'''
Created on Nov 22, 2020

@author: dado
'''
import sys
import subprocess
from os import environ

REQUIRED_PYTHON_VERSION = 3


class PythonAlias(object):
    '''
    classdocs
    '''
    curPyVer = 0

    def __init__(self,):
        '''
        Constructor
        '''
        self.curPyVer = sys.version_info[0]
	self.envShell = environ['SHELL']
        if self.curPyVer >= REQUIRED_PYTHON_VERSION:
            self.pyVerStr = 'python'
        else:
            self.pyVerStr = 'python' + str(REQUIRED_PYTHON_VERSION) 
	    subprocess.call([self.envShell, '-i', '-c', 'alias python python3'])

    def AddAlias(self, newAlias):
        fullAlias = newAlias % (self.pyVerStr)
        print(fullAlias)
        subprocess.check_output(fullAlias, shell=True, executable=self.envShell)

        
if __name__ == '__main__':
    compilerAlias = 'alias our_pulp_aes_compile  %s $RISCV_PULP_SW_UTILS/compiler.py'
    verifyAlias = 'alias our_pulp_aes_verification %s $MY_PULP_APPS/aes_test/aesVerify.py'
    newSources = PythonAlias()
    #newSources.AddAlias(compilerAlias)
    #newSources.AddAlias(verifyAlias)
    print('Python aliases updated successfully. python version: ' + str(newSources.curPyVer))
    exit(0)
