import random
import os
import time
import subprocess
import sys
import pickle

def record_prepared(base_dir, pp):
    with open(base_dir+'/PP.pkl', 'wb') as f:
        pickle.dump(pp, f)
        f.close()

def record_finished(base_dir, ff):
    with open(base_dir+'/FF.pkl', 'wb') as f:
        pickle.dump(ff, f)
        f.close()


def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
        cfiles = []
        for file in files:
            if file == 'MARKER':
                testcodes.append(os.path.realpath(root))
    return testcodes

def main():
    base_dir = sys.path[0]+'/workspace'
    testcodes = get_testcodes(base_dir)

    print ('found ' + str(len(testcodes)) + ' benchmarks')

    for i, b in enumerate(testcodes):
        print('['+str(i)+'] '+b)


    cmd = int(input('set prepared:'))
    i = 1
    prepared = []
    for testcode in testcodes:
        prepared.append(testcode)
        i=i+1
        if(i>cmd):
            break
    record_prepared('./workspace', prepared)

    cmd = int(input('set finished:'))
    i = 1
    finished = []
    for testcode in testcodes:
        finished.append(testcode)
        i=i+1
        if(i>cmd):
            break
    record_finished('./workspace', finished)



if __name__ == "__main__":
    main()
