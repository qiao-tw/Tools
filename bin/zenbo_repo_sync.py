#!/usr/bin/env python

import os
import errno
import optparse
import re
import shutil
import shlex
import stat
import subprocess
import sys

ASUS_REPO_DIR="/var/opengrok/src/Zenbo"
TEMP_FILE="temp.txt"

def main(args):
    #os.chdir("/var/opengrok/src")
    #subprocess.Popen(['touch', TEMP_FILE], cwd=ASUS_REPO_DIR)
    
    temp_file = open(TEMP_FILE, 'w')
    command_line = "find . -type d -name .git"
    cmd_args = shlex.split(command_line)
    subprocess.Popen(cmd_args, cwd=ASUS_REPO_DIR, stdout=temp_file)

if __name__ == '__main__':
    main(sys.argv[1:])
