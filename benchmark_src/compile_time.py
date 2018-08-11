import random
import os
import time
import subprocess
import sys
import pickle
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue, Value
import numpy as np


def load_from_txt(file):
    with open(file, "r") as f:
        lines = f.read().split('\n')
    passes = lines[:len(lines) - 1]
    return passes


def create_child(list_str, current_dir):
    os.chdir(current_dir)
    os.environ["OPTFLAGS"] = list_str
    DEVNULL = open(os.devnull, 'wb', 0)
    timing = []
    repeat = 10
    for i in range(repeat):
        try:
            os.system('rm -f a.out')
            start = time.time()
            check_call(['timeout 60 make'], stdout=DEVNULL,
                       stderr=STDOUT, cwd=current_dir, shell=True)
            end = time.time()
            os.system('rm -f a.out')
        except subprocess.CalledProcessError:
            return (-1)

        timing.append(end - start)
    avg_time = average_timing(timing)
    return avg_time


def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
        cfiles = []
        for file in files:
            if file == 'MARKER':
                testcodes.append(os.path.realpath(root))
    return testcodes


def list_to_string(pass_list):
    s = ''
    for ele in pass_list:
        s += ' ' + ele
    return s


def read_list(target_dir):
    optimal = ''
    lmax = 0
    for root, dirs, files in os.walk(target_dir):
        for dir in dirs:
            if 'data_A' in dir:
                idx = dir[6:]
                if int(idx) > lmax:
                    lmax = int(idx)
                    optimal = dir

    if optimal == '':
        return ''

    # print 'found optimal ' + optimal + ' in ' + target_dir
    pass_list = ''
    with open(target_dir + '/' + optimal + '/passList.txt', 'r') as f:
        pass_list = f.read().split('\n')[0]
        f.close()
    return pass_list


def get_time(cdir, o3list):
    os.chdir(cdir)
    galist = read_list(cdir)
    o3time = create_child(o3list, cdir)
    gatime = create_child(galist, cdir) if galist != '' else -1

    return (o3time, gatime)


def main():
    base_dir = sys.path[0]
    testcodes = get_testcodes(base_dir)
    o3list = list_to_string(load_from_txt('O3List.txt'))

    if len(testcodes) == 0:
        print ('cannot find any MARKER in (', base_dir,
               '), run \'generate_makefile\' ')
        return

    print('found', len(testcodes), 'programs')
    cmd = input('continue? (y/n) ')
    if cmd != 'y':
        return

    res = []
    for i, testcode in enumerate(testcodes):
        o3, ga = get_time(testcode, o3list)
        res.append((shorten(testcode), o3, ga))
        print('[{}] o3 {:.4f}, ga {:.4f}'.format(shorten(testcode), o3, ga))

    print(res)

    with open(base_dir + '/../compile_time.pkl', 'wb') as f:
        pickle.dump(res, f)

    print('\ndone\n')


def average_timing(t1):
    t1.sort()
    if(len(t1) > 2):
        t2 = t1[1:-1]
        avg = sum(t2) / float(len(t2))
    else:
        avg = t1[0]
    return avg


def shorten(s):
    if 'workspace' in s:
        return s[s.find('workspace') + 9:]
    else:
        return s


if __name__ == "__main__":
    main()
