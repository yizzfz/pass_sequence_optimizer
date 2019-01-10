import random
import os
import subprocess
from subprocess import check_call, check_output, STDOUT
import argparse
import sys
import time
sys.path.append('../llvm_hack')
import llvm_CPS

CPS = llvm_CPS.CPS_Generator()
os.environ["OPTFLAGS"] = '-CPS'


def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
        cfiles = []
        for file in files:
            if file == 'MARKER':
                testcodes.append(os.path.realpath(root))
    return testcodes


def t_check(current_dir, O0=False):
    os.chdir(current_dir)

    DEVNULL = open(os.devnull, 'wb', 0)
    f = open("stdout.dmp", 'w')
    try:
        check_call(['make'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
    except subprocess.CalledProcessError as e:
        print ('make error in ' + current_dir)
        return

    try:
        start = time.time()
        check_call(['taskset 0x1 make run'], stdout=f,
                   stderr=DEVNULL, cwd=current_dir, shell=True)
        end = time.time()

        std_size = f.tell()

        runtime = end - start
        size = int(check_output(
            'ls -nl a.out | awk \'{print $5}\'', cwd=current_dir, shell=True))
    except subprocess.CalledProcessError as e:
        print ('cannot run bin in ' + current_dir)
        return

    print ('[' + shorten(current_dir) + '] Time = {:.4f} '.format(runtime), end='')
    if(os.path.isfile("data.dmp")):
        print(', data dumped', end='')
    if(os.path.isfile("ftmp_out")):
        print(', cbench data dumped', end='')
        os.system("mv ftmp_out data.dmp")
    if(os.path.isfile("stdout.dmp")):
        if(std_size > 0):
            print(', stdout dumped {:} chars'.format(std_size), end='')

    print ()

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
        CPS.set_default_list(O3=False)
        print('running with O0')
    elif(args.O3):
        CPS.set_default_list(O3=True)
        print('running with O3')
    else:
        return

    base_dir = '.'
    # base_dir += '/Misc'
    testcodes = get_testcodes(base_dir)

    if len(testcodes) == 0:
        print ('cannot find any MARKER, run \'generate_makefile\'')
        return

    print ('found ' + str(len(testcodes)) + ' benchmarks:')
    for i, c in enumerate(testcodes):
        print("[" + str(i) + "] " + shorten(c))
    cmd = input('continue? (y/n) ')

    if cmd == 'y':
        for testcode in testcodes:
            t_check(testcode, args.O0)


def shorten(s):
    if 'workspace' in s:
        return s[s.find('workspace') + 9:]
    else:
        return s


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Run all programs with O0 or O3')
    parser.add_argument(
        '--O0', action='store_true', default=False,
        help='run all programs with O0')
    parser.add_argument(
        '--O3', action='store_true', default=True,
        help='run all programs with O3')

    args = parser.parse_args()
    main(args)
