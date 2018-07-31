import random
import os
import time
import subprocess
import sys
import pickle
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue, Value
import numpy as np


def load_prepared(base_dir):
    try:
        with open(base_dir+'/PP.pkl', 'rb') as f:
            pp = pickle.load(f)
            f.close()
    except FileNotFoundError:
        pp = []
    return pp


def read_O3_time(current_dir):
    time = 0
    try:
        os.chdir(current_dir + '/data_O3_0')
    except OSError as e:
        print (current_dir + ' does not have /data_O3_0')
        return -1

    with open("performance.txt", "r") as f:
        lines = f.read().split('\n')
        f.close()
    s = lines[0].split(': ')
    time = float(s[1])
    return time


def load_from_txt(file):
    with open(file, "r") as f:
        lines = f.read().split('\n')
        f.close()
    passes = lines[:len(lines) - 1]
    return passes


def list_to_string(pass_list):
    s = ''
    for ele in pass_list:
        s += ' ' + ele
    return s


def generate_random_list(all_list):
    n = random.randint(100, 200)
    new_list = []
    for i in range(0, n):
        index = random.randint(0, len(all_list) - 1)
        new_list.append(all_list[index])
    return new_list


def create_child(list_str, current_dir):
    os.environ["OPTFLAGS"] = list_str
    DEVNULL = open(os.devnull, 'wb', 0)

    try:
        check_call(['timeout 60 make'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
    except subprocess.CalledProcessError:
        with open(current_dir + "/error.txt", "a") as f:
            f.write(list_str)
            f.write('\n')
            f.close()
        record_list('err_', -1, -1, 0)
        return (1, -1, -1)

    etime = -1.0
    size = -1
    timing = []

    repeat = 5  # set max run according to runtime
    for i in range(0, repeat):

        try:
            f = open("stdout.dmp", 'w')
            start = time.time()
            check_call(['taskset 0x1 make run'], stdout=f,
                       stderr=STDOUT, cwd=current_dir, shell=True)
            end = time.time()
            f.close()
            result_correct = 1

            if(i == 0):
                if(os.path.isfile("data.dmp.ref")):
                    if(os.path.isfile("ftmp_out")):

                        if(os.path.isfile("output_large.mp3")):
                            os.system("mv output_large.mp3 data.dmp")
                        else:
                            os.system("mv ftmp_out data.dmp")
                    if(os.path.isfile("data.dmp")):
                        try:
                            check_output(
                                'diff -q data.dmp data.dmp.ref', cwd=current_dir, shell=True)
                        except subprocess.CalledProcessError as e:
                            result_correct = False
                    else:
                        result_correct = False

                if(os.path.isfile("stdout.dmp.ref")):
                    if(os.path.isfile("stdout.dmp")):
                        t1 = open("stdout.dmp.ref", "r").read()
                        t2 = open("stdout.dmp", "r").read()
                        result_correct = result_correct and (t1 == t2)
                    else:
                        result_correct = False

                if(not result_correct):
                    with open(current_dir + "/res_error.txt", "a") as f:
                        f.write(list_str)
                        f.write('\n')
                        f.close()
                    record_list('rerr_', -1, -1, 0)
                    return (1, -1, -1)

        except subprocess.CalledProcessError:
            with open(current_dir + "/error.txt", "a") as f:
                f.write(list_str)
                f.write('\n')
                f.close()
            record_list('err_', -1, -1, 0)
            return (1, -1, -1)

        timing.append(end - start)

    avg_time = average_timing(timing)
    size = int(check_output(
        'ls -nl a.out | awk \'{print $5}\'', cwd=current_dir, shell=True))
    return (0, avg_time, size)


def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
        cfiles = []
        for file in files:
            if file == 'MARKER':
                testcodes.append(os.path.realpath(root))
    return testcodes


def t_rand(current_dir, all_list):
    os.chdir(current_dir)
    cnt = 0
    times = []
    for i in range(100):
        rand_list = generate_random_list(all_list)
        list_str = list_to_string(rand_list)
        res = create_child(list_str, current_dir)
        if res[0] == 0:
            child_time = res[1]
            print(' ' * 80, end='\r')
            print ('[' + str(cnt) + ']', ': no.passes ', len(rand_list), ', time {:.3f} '.format(child_time), end='\r')
            times.append(child_time)
            cnt += 1
        if cnt == 10:
            break

    O3time = read_O3_time(current_dir)
    print(times, O3time)
    return times


def main():
    all_list = load_from_txt('allPassList.txt')
    base_dir = sys.path[0]
    testcodes = get_testcodes(base_dir)

    if len(testcodes) == 0:
        print ('cannot find any MARKER in (', base_dir,
               '), run \'generate_makefile\' ')
        return

    prepared = load_prepared(sys.path[0])
    if prepared != []:
        stmp = 'prepared ' + str(len(prepared))
        print(stmp)

    print ('found ' + str(len(testcodes)) + ' benchmarks:')
    print (testcodes)
    cmd = input('continue? (y/n) ')
    if cmd != 'y':
        return

    total = len(testcodes)
    res_all = {}
    for i, testcode in enumerate(prepared):
        print('[' + str(i) + '/' + str(total) + '] ' + shorten(testcode))
        res = t_rand(testcode, all_list)
        res_all[shorten(testcode)] = res
    print('\nall done\n')
    print(res_all)

    with open('rand.pkl', 'wb') as f:
        pickle.dump(res_all, f)


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
