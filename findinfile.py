#!/usr/bin/python
import sys
import re
import os

pattern = ''.join(sys.argv[1:])

for path, folder, files in os.walk(os.getcwd()):
    for files in files:
        if re.findall(pattern, open(path+"/"+files).read()):
            print files    
