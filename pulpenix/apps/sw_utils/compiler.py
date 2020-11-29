'''
Created on June 6, 2020

@author: dolevv and davidd
'''
import argparse
import random
from os import environ
from os.path import join
import ctypes
c_uint32 = ctypes.c_uint32
c_int = ctypes.c_int

reg_dict = {
		"zero" : 0,
		"ra"   : 1,
		"sp"   : 2,
		"gp"   : 3,
		"tp"   : 4,
		"t0"   : 5,
		"t1"   : 6,
		"t2"   : 7,
		"s0"   : 8,
		"fp"   : 8,
		"s1"   : 9,
		"a0"   : 10,
		"a1"   : 11,
		"a2"   : 12,
		"a3"   : 13,
		"a4"   : 14,
		"a5"   : 15,
		"a6"   : 16,
		"a7"   : 17,
		"s2"   : 18,
		"s3"   : 19,
		"s4"   : 20,
		"s5"   : 21,
		"s6"   : 22,
		"s7"   : 23,
		"s8"   : 24,
		"s9"   : 25,
		"s10"  : 26,
		"s11"  : 27,
		"t3"   : 28,
		"t4"   : 29,
		"t5"   : 30,
		"t6"   : 31
		}

aes_funct3_dict = {
		   "aes_reg": 0,
		   "aes_key": 1,
		   "aes_mem": 2,
		   "aes_run": 4
		   }

class InstrBits(ctypes.LittleEndianStructure):
	_fields_ = [("opcode",	c_int, 7),
				("rd",		c_int, 5),
				("funct3",	c_int, 3),
				("rs1",		c_int, 5),
				("rs2",		c_int, 5),
				("funct7",	c_int, 7)]
				
class Instr(ctypes.Union):
	_fields_ = [("b", InstrBits),
				("asword", c_uint32)]

if __name__=="__main__":

	parser = argparse.ArgumentParser(description='Run Compiler')
	parser.add_argument('-a', '--app', help='App name')
	args = parser.parse_args()
	
	if args.app is not None and args.app.strip() != "":
		appName = args.app
	else:
		print("App name missing, please specify app.")
	
	opcode_value = 59
	rd_value = 0
	funct3_value = 0
	rs1_value = 0
	rs2_value = 0
	funct7_value = 0
	
	with open(join(environ["MY_PULP_APPS"],appName,appName+'.c'), 'r') as fp:
		lines = fp.readlines()
		
	with open(join(environ["MY_PULP_APPS"],appName,appName+'_pre_compile.c'), 'w+') as fp:
		fp.writelines(lines)
		
	cnt = -1
	for line in lines:
		cnt = cnt + 1
		
		if ( (len(line.split('"')) > 1) and ("aes" in line.lower()) ):
			line = line.lower()
			asm_cmd = line.split('"')[1]
			aes_cmd = Instr()
			
			aes_cmd.b.opcode = opcode_value
			aes_cmd.b.rd = rd_value
			aes_cmd.b.funct3 = funct3_value
			aes_cmd.b.rs1 = rs1_value
			aes_cmd.b.rs2 = rs2_value
			aes_cmd.b.funct7 = funct7_value
			
		else:
			continue
	
		if( "aes_reg" in line ):
			aes_cmd.b.funct3 = aes_funct3_dict["aes_reg"]
			aes_cmd.b.rd = int(asm_cmd.split(",")[0].strip()[-1])
			
			rs1_tmp = asm_cmd.split(",")[1].strip()
			if( "x" in rs1_tmp ):
				aes_cmd.b.rs1 = int(rs_tmp1.split("x")[1])
			else:
				aes_cmd.b.rs1 = reg_dict[rs1_tmp]
			
		if( "aes_key" in line ):
			aes_cmd.b.funct3 = aes_funct3_dict["aes_key"]
			aes_cmd.b.rd = int(asm_cmd.split(",")[0].strip()[-1])
			
			rs1_tmp = asm_cmd.split(",")[1].strip()
			if( "x" in rs1_tmp ):
				aes_cmd.b.rs1 = int(rs_tmp1.split("x")[1])
			else:
				aes_cmd.b.rs1 = reg_dict[rs1_tmp]
			
		if( "aes_mem" in line ):
			aes_cmd.b.funct3 = aes_funct3_dict["aes_mem"]
			
			rs1_tmp = asm_cmd.split("mem")[1].strip()
			if( "x" in rs1_tmp ):
				aes_cmd.b.rs1 = int(rs1_tmp.split("x")[1])
			else:
				aes_cmd.b.rs1 = reg_dict[rs1_tmp]
			
		if( "aes_run" in line ):
			aes_cmd.b.funct3 = aes_funct3_dict["aes_run"]

		cmd_dec = aes_cmd.asword
		lines[cnt] = line.replace(asm_cmd, ".word 0x{:08x}".format(cmd_dec))
			
	with open(join(environ["MY_PULP_APPS"],appName,appName+'.c'), 'w+') as fp:
		fp.writelines(lines)
		
	print(appName + ' compiled AES commands successfully!')
