

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




import random

if __name__=="__main__":

    fp_asm_aes = "asm_aes.c"
    
    funct7_length = 7
    funct7_value = 0
    funct7_offset = 25
    rs2_length = 5
    rs2_value = 0
    rs2_offset = 20
    rs1_length = 5
    rs1_value = 0
    rs1_offset = 15
    funct3_length = 3
    funct3_value = 0
    funct3_offset = 12
    rd_length = 5
    rd_value = 0
    rd_offset = 7
    opcode_length = 7
    opcode_value = 59
    opcode_offset = 0
    
    with open(fp_asm_aes, 'r') as fp:
        lines = fp.readlines()
	cnt = -1
        for line in lines:
	    cnt = cnt + 1
	
	    if ( (len(line.split('"')) > 1) and ("aes" in line) ):
	        asm_cmd = line.split('"')[1]
	    else:
	        continue
	
	    if( "aes_reg" in line ):
	        funct3_value = aes_funct3_dict["aes_reg"]
	        rd_value = int(asm_cmd.split(",")[0].strip()[-1])
		rs1_tmp = asm_cmd.split(",")[1].strip()
		if( "x" in rs1_tmp ):
		    rs1_value = int(rs_tmp1.split("x")[1])
		else:
		    rs1_value = reg_dict[rs1_tmp]
		    
	    if( "aes_key" in line ):
	        funct3_value = aes_funct3_dict["aes_key"]
	        rd_value = int(asm_cmd.split(",")[0].strip()[-1])
		rs1_tmp = asm_cmd.split(",")[1].strip()
		if( "x" in rs1_tmp ):
		    rs1_value = int(rs_tmp1.split("x")[1])
		else:
		    rs1_value = reg_dict[rs1_tmp]
		    
	    if( "aes_mem" in line ):
	        funct3_value = aes_funct3_dict["aes_mem"]
		rs1_tmp = asm_cmd.split("mem")[1].strip()
		if( "x" in rs1_tmp ):
		    rs1_value = int(rs1_tmp.split("x")[1])
		else:
		    rs1_value = reg_dict[rs1_tmp]
		    
	    if( "aes_run" in line ):
	        funct3_value = aes_funct3_dict["aes_run"]
		
            funct7_mask = ((1<<funct7_length)-1) << funct7_offset
	    funct7_inst = (funct7_value << funct7_offset) & funct7_mask
	    
            rs2_mask = ((1<<rs2_length)-1) << rs2_offset
	    rs2_inst = (rs2_value << rs2_offset) & rs2_mask
	    
            rs1_mask = ((1<<rs1_length)-1) << rs1_offset
	    rs1_inst = (rs1_value << rs1_offset) & rs1_mask
	    
            funct3_mask = ((1<<funct3_length)-1) << funct3_offset
	    funct3_inst = (funct3_value << funct3_offset) & funct3_mask
	    
            rd_mask = ((1<<rd_length)-1) << rd_offset
	    rd_inst = (rd_value << rd_offset) & rd_mask
	    
            opcode_mask = ((1<<opcode_length)-1) << opcode_offset
	    opcode_inst = (opcode_value << opcode_offset) & opcode_mask

	    
	    cmd_dec = funct7_inst | rs2_inst | rs1_inst | funct3_inst | rd_inst | opcode_inst
	    lines[cnt] = line.replace(asm_cmd, ".word 0x{:08x}".format(cmd_dec))
	    	    
	    print "***************************"
	    print "0x{:032b}".format(funct7_inst)
	    print "0x{:032b}".format(rs2_inst)
	    print "0x{:032b}".format(rs1_inst)
	    print "0x{:032b}".format(funct3_inst)
	    print "0x{:032b}".format(rd_inst)
	    print "0x{:032b}".format(opcode_inst)
	    print "0x{:032b}".format(cmd_dec)
	    print "0x{:08x}".format(cmd_dec)
	    print "***************************"
	    
    with open("asm_aes_hex.c", 'w+') as fp:
        fp.writelines(lines)
