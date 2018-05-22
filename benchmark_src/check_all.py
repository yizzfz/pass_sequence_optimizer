import random
import os
import time
import subprocess
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue, Value
import argparse

def load_from_txt(file):
    with open(file,"r") as f:
        lines = f.read().split('\n')
    passes = lines[:len(lines)-1]
    return passes


def list_to_string(pass_list):
    s = ''
    for ele in pass_list:
      s += ' ' + ele
    return s


def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
      cfiles = []
      for file in files:
        if file == 'MARKER':
          testcodes.append(os.path.realpath(root))
    return testcodes




def t_check(current_dir, pass_list, O0=False):
    os.chdir(current_dir)
    os.environ["OPTFLAGS"] = pass_list

    DEVNULL = open(os.devnull, 'wb', 0)
    try:
        check_call(['make'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
    except subprocess.CalledProcessError as e:
        print ('make error in ' + current_dir)
        return

    try:
        start = time.time()
        check_call(['taskset 0x1 make run'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
        end = time.time()

        runtime = end-start
        size = int(check_output(
            'ls -nl a.out | awk \'{print $5}\'', cwd=current_dir, shell=True))
    except subprocess.CalledProcessError as e:
        print ('cannot run bin in ' + current_dir)
        return

    print ('['+ shorten(current_dir) + '] Time = {:.4f}, Bin Size = {:}'.format(runtime, size))

    os.system('rm -rf precheck')
    os.system('mkdir -p precheck')
    if(O0):
        filename = 'precheck/O0.txt'
    else:
        filename = 'precheck/O3.txt'

    with open(filename, "w") as f:
        f.write('execution time: ' + str(runtime) + '\n')
        f.write('binary size: ' + str(size) + '\n')
        f.close()




def main(args):
    if(args.O0):
        pass_list = load_from_txt('O0List.txt')
        print('running with O0')
    elif(args.O3):
        pass_list = load_from_txt('O3List.txt')
        print('running with O3')
    else:
        return

    pass_list_str = list_to_string(pass_list)
    print(pass_list_str)


    base_dir = '.'
    testcodes = get_testcodes(base_dir)

    if len(testcodes) == 0:
      print ('cannot find any MARKER, run \'generate_makefile\'')
      return

    print ('found ' + str(len(testcodes)) + ' benchmarks:')
    print (testcodes)
    cmd = input('continue? (y/n) ')

    if cmd == 'y':
        for testcode in testcodes:
            t_check(testcode, pass_list_str, args.O0)



def shorten(s):
    if 'workspace' in s:
        return s[s.find('workspace')+9:]
    else:
        return s

if __name__=="__main__":
    parser = argparse.ArgumentParser(description='Run all programs with O0 or O3')
    parser.add_argument(
        '--O0', action='store_true', default=False,
        help='run all programs with O0')
    parser.add_argument(
        '--O3', action='store_true', default=True,
        help='run all programs with O3')

    args = parser.parse_args()
    main(args)
