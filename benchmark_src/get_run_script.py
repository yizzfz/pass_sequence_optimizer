import pickle
import pdb
import random
import os

def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
        cfiles = []

        if 'MARKER' in files and 'makefile' in files:
            fullpath = os.path.realpath(root)
            workload = ''
            if 'poly' in fullpath or 'cBench' in fullpath:
                with open(fullpath + '/makefile', 'r') as f:
                    lines = f.read().split('\n')
                    for line in lines:
                        if 'WORKLOAD=' in line:
                            workload = line[9:]
                            break

                        if '_DATASET' in line:
                            workload = line[38:]
                            break

                        if './__run' in line:
                            workload = line[22:]
                            break

                with open(fullpath + '/workload.txt', 'w') as f:
                    f.write(workload)


            testcodes.append((fullpath, workload))

    return testcodes


def main():
    test = get_testcodes('.')
    print(len(test))
    for t in test:
        print(t)


if __name__ == '__main__':
    main()
