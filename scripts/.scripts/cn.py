#!/usr/bin/env python

import sys
import os
import glob
import subprocess

ARGS = sys.argv
DIR = ''
SUBDIR = ''
CWD = os.getcwd()

def main():
	DIR = ARGS[1]
	SUBDIR = ''
	if len(ARGS) == 3:
		SUBDIR = ARGS[2]
	else:
		print(os.getcwd())
		PATH = glob.glob(CWD + '/' + DIR + '*')
		print(PATH)
		#print(os.listdir(PATH[0]))
		os.chdir(PATH[0])
		print(os.getcwd())
		print(os.listdir(os.getcwd()))
		newpath = 'cd ' + PATH[0]
		print(newpath)
		os.system(newpath)
		os.system("clear")

if __name__ == "__main__":
    main()
