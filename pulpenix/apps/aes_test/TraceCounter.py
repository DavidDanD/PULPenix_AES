#!/tools/common/pkgs/python/3.6.3/bin/python3.6
'''
Created on Sep 23, 2020

@author: davidd
'''
import argparse
from traceback import print_exc


def traceCounter(file1Path, file2Path):
    lines = []

    with open(file1Path, 'r') as inFile:
        lines.append(inFile.readlines())
    with open(file2Path, 'r') as inFile:
        lines.append(inFile.readlines())
    
    firstMnemonic = []
    firstCycle = []
    lastMnemonic = []
    lastCycle = []
    firstLine = [0, 0]
    headerLine = ['', '']
    
    i = 0
    line1 = lines[0][i].split()
    line2 = lines[1][i].split()
    try:
      while(line1[3:] == line2[3:] and i < len(lines[0]) and i < len(lines[1])):
          i += 1
          line1 = lines[0][i].split()
          line2 = lines[1][i].split()
    except:
      print(lines[0][i-1])
      print(lines[1][i-1])
        
    firstDiffLine = i
    
    i = len(lines[0]) - 1
    j = len(lines[1]) - 1
    line1 = lines[0][i].split()
    line2 = lines[1][j].split()
    while(line1[3:] == line2[3:]):
        i -= 1
        j -= 1
        line1 = lines[0][i].split()
        line2 = lines[1][j].split()
    
    firstDiffCycle = []
    lastDiffCycle = []
    lastDiffLine = []
    lastDiffLine.append(i + 1)
    lastDiffLine.append(j + 1)
    numOfCycles = []
    numOfDiffCycles = []
    
    for i in range(2):
        while('Cycles' not in headerLine[i] or 'Mnemonic' not in headerLine[i]):
            headerLine[i] = lines[i][firstLine[i]]
            firstLine[i] += 1
            
        if 'Cycles' in headerLine[i] and 'Mnemonic' in headerLine[i]:
            cycleCol = headerLine[i].split().index('Cycles')
            mnemonicCol = headerLine[i].split().index('Mnemonic')
            
            firstMnemonic.append(lines[i][firstLine[i]].split()[mnemonicCol])
            # while(mnemonic)
            firstCycle.append(lines[i][firstLine[i]].split()[cycleCol])
            firstDiffCycle.append(int(lines[i][firstDiffLine].split()[cycleCol]))
            
            lastMnemonic.append(lines[i][-1].split()[mnemonicCol])
            lastCycle.append(lines[i][-1].split()[cycleCol])
            lastDiffCycle.append(int(lines[i][lastDiffLine[i]].split()[cycleCol]))
            
            numOfCycles.append(int(lastCycle[i]) - int(firstCycle[i]))
            numOfDiffCycles.append(lastDiffCycle[i] - firstDiffCycle[i])
    
    return [numOfCycles, numOfDiffCycles]
                

if __name__ == '__main__':
    try:
        parser = argparse.ArgumentParser(description='Run traceCounter')
        parser.add_argument('-p1', '--path1', help='First Trace File Path')
        parser.add_argument('-p2', '--path2', help='Second Trace File Path')
        args = parser.parse_args()
        if args.path1 is not None and args.path2 is not None:
            file1Path = args.path1
            file2Path = args.path2
        elif args.path1 is not None:
            print("Error: Missing argument path2.")
        elif args.path2 is not None:
            print("Error: Missing argument path1.")
        else:
            print("Error: Missing argument path1 and path2")
            
        [numOfCycles, numOfDiffCycles] = traceCounter(file1Path, file2Path)

        print('First method number of cycles: ' + str(numOfCycles[0]))
        print('Second method number of cycles: ' + str(numOfCycles[1]))
        print('First method number of different cycles: ' + str(numOfDiffCycles[0]))
        print('Second method number of different cycles: ' + str(numOfDiffCycles[1]))
    except:
        print_exc()
