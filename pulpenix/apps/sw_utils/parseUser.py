import argparse
from getpass import getuser

if __name__=="__main__":
	parser = argparse.ArgumentParser(description='Run user parser')
	parser.add_argument('-sf', '--sfile', help='source file path')
	parser.add_argument('-df', '--dfile', help='dest file path')
	args = parser.parse_args()
	
	if args.sfile != None and args.dfile != None:
		sFilePath = args.sfile
		dFilePath = args.dfile
	else:
		print('File path missing!')
	
	lines = []
	userName = getuser()
	with open(sFilePath,'r') as inputFile:
		lines = inputFile.readlines()
	
	cnt = 0
	for line in lines:
		if '%%user%%' in line:
			lines[cnt] = line.replace('%%user%%',userName)
		cnt += 1
		
	with open(dFilePath,'w+') as outputFile:
		outputFile.writelines(lines)
		
	print(dFilePath+'created successfully!')