'''
Created on June 16, 2020

@author: dolevv and davidd
'''
# AES implementation by Daniel Miller
import random
import getpass
import subprocess
import shutil
from os.path import join
from os import environ, makedirs, system, path
from TraceCounter import traceCounter


def twos_comp(val, bits):
	"""compute the 2's complement of int value val"""
	if (val & (1 << (bits - 1))) != 0: # if sign bit is set e.g., 8bit: 128-255
		val = val - (1 << bits)		# compute negative value
	return val

def xor(s1, s2):
	return tuple(a^b for a,b in zip(s1, s2))

class AES(object):
	class __metaclass__(type):
		def __init__(cls, name, bases, classdict):
			cls.Gmul = {}
			for f in (0x02, 0x03, 0x0e, 0x0b, 0x0d, 0x09):
				cls.Gmul[f] = tuple(cls.gmul(f, x) for x in range(0,0x100))

	Rcon = ( 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a )
	Sbox = (
			0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
			0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
			0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
			0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
			0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
			0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
			0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
			0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
			0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
			0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
			0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
			0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
			0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
			0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
			0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
			0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
			)
	Sbox_inv = (
			0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB,
			0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB,
			0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E,
			0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25,
			0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92,
			0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84,
			0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06,
			0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B,
			0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73,
			0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E,
			0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B,
			0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4,
			0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F,
			0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF,
			0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61,
			0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D
			)

	@staticmethod
	def rot_word(word):
		return word[1:] + word[:1]

	@staticmethod
	def sub_word(word):
		return (AES.Sbox[b] for b in word)

	def key_schedule(self):
		expanded = []
		expanded.extend(map(ord, self.key))
		for i in range(self.nk, self.nb * (self.nr + 1)):
			t = expanded[(i-1)*4:i*4]
			if i % self.nk == 0:
				t = xor( AES.sub_word( AES.rot_word(t) ), (AES.Rcon[i // self.nk],0,0,0) )
			elif self.nk > 6 and i % self.nk == 4:
				t = AES.sub_word(t)
			expanded.extend( xor(t, expanded[(i-self.nk)*4:(i-self.nk+1)*4]))
		return expanded

	def add_round_key(self, rkey):
		for i, b in enumerate(rkey):
			self.state[i] ^= b

	def sub_bytes(self):
		for i, b in enumerate(self.state):
			self.state[i] = AES.Sbox[b]

	def inv_sub_bytes(self):
		for i, b in enumerate(self.state):
			self.state[i] = AES.Sbox_inv[b]

	def shift_rows(self):
		rows = []
		for r in range(4):
			rows.append( self.state[r::4] )
			rows[r] = rows[r][r:] + rows[r][:r]
		self.state = [ r[c] for c in range(4) for r in rows ]

	def inv_shift_rows(self):
		rows = []
		for r in range(4):
			rows.append( self.state[r::4] )
			rows[r] = rows[r][4-r:] + rows[r][:4-r]
		self.state = [ r[c] for c in range(4) for r in rows ]

	@staticmethod
	def gmul(a, b):
		p = 0
		for c in range(8):
			if b & 1:
				p ^= a
			a <<= 1
			if a & 0x100:
				a ^= 0x11b
			b >>= 1
		return p

	def mix_columns(self):
		ss = []
		for c in range(4):
			col = self.state[c*4:(c+1)*4]
			ss.extend((
						AES.Gmul[0x02][col[0]] ^ AES.Gmul[0x03][col[1]] ^				col[2]  ^				col[3] ,
									   col[0]  ^ AES.Gmul[0x02][col[1]] ^ AES.Gmul[0x03][col[2]] ^				col[3] ,
									   col[0]  ^				col[1]  ^ AES.Gmul[0x02][col[2]] ^ AES.Gmul[0x03][col[3]],
						AES.Gmul[0x03][col[0]] ^				col[1]  ^				col[2]  ^ AES.Gmul[0x02][col[3]],
					))
		self.state = ss

	def inv_mix_columns(self):
		ss = []
		for c in range(4):
			col = self.state[c*4:(c+1)*4]
			ss.extend((
						AES.Gmul[0x0e][col[0]] ^ AES.Gmul[0x0b][col[1]] ^ AES.Gmul[0x0d][col[2]] ^ AES.Gmul[0x09][col[3]],
						AES.Gmul[0x09][col[0]] ^ AES.Gmul[0x0e][col[1]] ^ AES.Gmul[0x0b][col[2]] ^ AES.Gmul[0x0d][col[3]],
						AES.Gmul[0x0d][col[0]] ^ AES.Gmul[0x09][col[1]] ^ AES.Gmul[0x0e][col[2]] ^ AES.Gmul[0x0b][col[3]],
						AES.Gmul[0x0b][col[0]] ^ AES.Gmul[0x0d][col[1]] ^ AES.Gmul[0x09][col[2]] ^ AES.Gmul[0x0e][col[3]],
					))
		self.state = ss

	def cipher(self, block):
		#print "round[ 0].input: {0}".format(block.encode('hex'))
		n = self.nb * 4
		self.state = map(ord, block)
		keys = self.key_schedule()
		#print "round[ 0].k_sch: {0}".format(keys[0:n].encode('hex'))
		self.add_round_key(keys[0:n])
		for r in range(1, self.nr):
			#print "round[{0}].start: {1}".format(r,self.state.encode('hex'))
			self.sub_bytes()
			#print "round[{0}].s_box: {1}".format(r,self.state.encode('hex'))
			self.shift_rows()
			#print "round[{0}].s_row: {1}".format(r,self.state.encode('hex'))
			self.mix_columns()
			#print "round[{0}].m_col: {1}".format(r,self.state.encode('hex'))
			k = keys[r*n:(r+1)*n]
			#print "round[{0}].k_sch: {1}".format(r,k.encode('hex'))
			self.add_round_key(k)

		self.sub_bytes()
		self.shift_rows()
		self.add_round_key(keys[self.nr*n:])
		#print "output: {0}".format(self.state.encode('hex'))
		return "".join(map(chr, self.state))

	def inv_cipher(self, block):
		#print "round[ 0].iinput: {0}".format(block.encode('hex'))
		n = self.nb * 4
		self.state = map(ord, block)
		keys = self.key_schedule()
		k = keys[self.nr*n:(self.nr+1)*n]
		#print "round[ 0].ik_sch: {0}".format(k.encode('hex'))
		self.add_round_key(k)
		for r in range(self.nr-1, 0, -1):
			#print "round[{0}].istart: {1}".format(r,self.state.encode('hex'))
			self.inv_shift_rows()
			#print "round[{0}].is_row: {1}".format(r,self.state.encode('hex'))
			self.inv_sub_bytes()
			#print "round[{0}].is_box: {1}".format(r,self.state.encode('hex'))
			k = keys[r*n:(r+1)*n]
			#print "round[{0}].ik_sch: {1}".format(r,k.encode('hex'))
			self.add_round_key(k)
			#print "round[{0}].ik_add: {1}".format(r,self.state.encode('hex'))
			self.inv_mix_columns()
			#print "round[{0}].im_col: {1}".format(r,self.state.encode('hex'))

		self.inv_shift_rows()
		self.inv_sub_bytes()
		self.add_round_key(keys[0:n])
		#print "output: {0}".format(self.state.encode('hex'))
		return "".join(map(chr, self.state))



class AES_128(AES):
	def __init__(self):
		self.nb = 4
		self.nr = 10
		self.nk = 4

if __name__=="__main__":
	
	key = "{:032x}".format(random.randint(0,2**128))
	data = "{:032x}".format(random.randint(0,2**128))
	
	#key = "0000000000000000cafeface00000000"
	#data = "deadbeefdeafbabe0000000000000000"
	
	#data = "thanks take care".encode('hex')
	#key = "{:032x}".format(random.randint(0,2**128))

	keyBin = "{:0128b}".format(int(key,16))
	dataBin = "{:0128b}".format(int(data,16))
	
	aesTestPath = join(environ['MY_PULP_APPS'], "aes_test")
	with open (join(aesTestPath,'test_key_data.txt'),'w+') as test_data:
		test_data.write("Key:\n")
		test_data.write(key+'\n')
		test_data.write("Data:\n")
		test_data.write(data+'\n')
		
	
	username = getpass.getuser()
	
	aesRiscvAppTempPath = join(environ['MY_PULP_APPS'], "asm_aes_riscv_temp")
	aesCAppTempPath = join(environ['MY_PULP_APPS'], "asm_aes_c_temp")
	traceFile = join(environ['MY_PULP_IRUN'],"trace_core_00_0.log")
	
	if ( path.isdir(aesRiscvAppTempPath) ):
		shutil.rmtree(aesRiscvAppTempPath)

	if ( path.isdir(aesCAppTempPath) ):
		shutil.rmtree(aesCAppTempPath)
	
	
	lines = []
	with open(aesTestPath + "/asm_aes_riscv_template.c", 'r') as fp:
		print('Creating new AES RISCV test:')
		print('Generated key: ' + key.decode('hex'))
		print('Generated data: ' + data.decode('hex'))
		lines = fp.readlines()
		cnt = 0
		for line in lines:
			if( "%%" in line ):
				dataRegNum = int(line.split("%%")[1].split("-")[0][-1])
				dataOrKey = line.split("%%")[1].split("-")[0][0:-1]
				dataBinTmp = eval("%sBin[dataRegNum*32:(dataRegNum+1)*32]"%(dataOrKey))
				bitRange = line.split("%%")[1].split("-")[1]
				numBits = int(bitRange.split(':')[1])-int(bitRange.split(':')[0])
				if 'lui' in line:
					decVal = int(eval("dataBinTmp[%s]"%(bitRange)),2)
				else:
					decVal = twos_comp(int(eval("dataBinTmp[%s]"%(bitRange)),2),numBits)
				lines[cnt] = line.replace("%%" + line.split("%%")[1] + "%%", str(decVal))
			cnt = cnt + 1
	
	makedirs(aesRiscvAppTempPath)
	
	if len(lines)>0:
		print('New AES RISCV test created.')
		with open(join(aesRiscvAppTempPath, "asm_aes_riscv_temp.c"), 'w+') as fp:
			fp.writelines(lines)
	else:
		print('Error while creating "asm_aes_riscv_temp.c".')
	
	print('Running AES RISCV test:')
	system("$MY_PULP_ENV/misc/scripts/pulpenix_compile asm_aes_riscv_temp > " + join(aesRiscvAppTempPath, "asm_aes_riscv_temp_output") + " 2> " + join(aesRiscvAppTempPath, "asm_aes_riscv_temp_error_output"))
	print('Finished running AES RISCV test.')
	
	#riscvFirstClock = subprocess.check_output("cat $MY_PULP_IRUN/trace_core_00_0.log | head -2 | tail -1 | cut -d' ' -f20", shell=True)
	#riscvLastClock = subprocess.check_output("cat $MY_PULP_IRUN/trace_core_00_0.log | tail -1 | cut -d' ' -f20", shell=True)
	#riscvClocks = int(riscvLastClock) - int(riscvFirstClock)
	shutil.copyfile(traceFile,join(aesRiscvAppTempPath,"trace_core_00_0.log"))
	
	lines = []
	with open(join(aesTestPath ,"asm_aes_c_template.c"), 'r') as fp:
		print('Creating new AES C test:')
		lines = fp.readlines()
		cnt = 0
		for line in lines:
			if( "%%key%%" in line ):
				keyTemp = ""
			
				for i in range(int(len(key)/2)):
					keyTemp += "0x" + key[2*i:2*i+2] + ","
				
				lines[cnt] = line.replace("%%key%%", str(keyTemp))
			
			if( "%%plainText%%" in line ):
				plainTextTemp = ""
			
				for i in range(int(len(key)/2)):
					plainTextTemp += "0x" + data[2*i:2*i+2] + ","
			
				lines[cnt] = line.replace("%%plainText%%", str(plainTextTemp))
			
			cnt = cnt + 1
				
	makedirs(aesCAppTempPath)
	
	if len(lines)>0:
		print('New AES C test created.')
		with open(join(aesCAppTempPath, "asm_aes_c_temp.c"), 'w+') as fp:
			fp.writelines(lines)
	else:
		print('Error while creating "asm_aes_c_temp.c".')
	
	print('Running AES C test:')
	system("$MY_PULP_ENV/misc/scripts/pulpenix_compile asm_aes_c_temp > " + join(aesCAppTempPath, "asm_aes_c_temp_output") + " 2> " + join(aesCAppTempPath, "asm_aes_c_temp_error_output"))
	print('Finished running AES C test.')
	
	#cFirstClock = subprocess.check_output("cat $MY_PULP_IRUN/trace_core_00_0.log | cut -d' ' -f20 | head -2 | tail -1", shell=True)
	#cLastClock = subprocess.check_output("cat $MY_PULP_IRUN/trace_core_00_0.log | cut -d' ' -f20 | tail -1", shell=True)
	#cClocks = int(cLastClock) - int(cFirstClock)
	shutil.copyfile(traceFile,join(aesCAppTempPath,"trace_core_00_0.log"))
  
	[numOfCycles, numOfDiffCycles] = traceCounter(join(aesRiscvAppTempPath,"trace_core_00_0.log"), join(aesCAppTempPath,"trace_core_00_0.log"))
	
	riscvResult = subprocess.check_output("cat $MY_PULP_APPS/asm_aes_riscv_temp/asm_aes_riscv_temp_output | grep 'Ciphered text' | cut -d: -f2", shell=True)
	cResult = subprocess.check_output("cat $MY_PULP_APPS/asm_aes_c_temp/asm_aes_c_temp_output | grep 'Ciphered text' | cut -d: -f2", shell=True)
	
	crypt = AES_128()
	crypt.key = key.decode('hex')
	pythonResult = crypt.cipher(data.decode('hex'))
	pythonResult = pythonResult.encode('hex').upper()
	if (riscvResult.strip() == cResult.strip() and cResult.strip() == pythonResult.strip()):
		print("***RISCV ciphered text is identical to C ciphered text, and to Python ciphered text.***")
		print('Ciphered data: ' + riscvResult.strip().decode('hex'))
		print('RISCV: number of cycles: ' + str(numOfCycles[0]))
		print('C: number of cycles: ' + str(numOfCycles[1]))
		print('RISCV: number of different cycles: ' + str(numOfDiffCycles[0]))
		print('C: number of different cycles: ' + str(numOfDiffCycles[1]))
		#shutil.rmtree(aesRiscvAppTempPath)
		#shutil.rmtree(aesCAppTempPath)
		
	else:
		print ("Ciphered text is not identical:")
		print ("RISCV ciphered text is: " + riscvResult)
		print ("C ciphered text is: " + cResult)
		print ("Python ciphered text is: " + pythonResult)
		
	#print riscvClocks
	#print cLastClock
	
	

