import random
import os
import time
import subprocess
import sys
import pickle
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue, Value
import pdb
TIME_MAX = 4

def load_finished(base_dir):
    try:
        with open(base_dir+'/FF.pkl', 'rb') as f:
            ff = pickle.load(f)
            f.close()
    except FileNotFoundError:
        ff = []
    return ff

def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
        cfiles = []
        for file in files:
            if file == 'MARKER':
                testcodes.append(os.path.realpath(root))
    return testcodes


def create_child(list_str, current_dir, time_baseline):
    os.environ["OPTFLAGS"] = list_str
    DEVNULL = open(os.devnull, 'wb', 0)
    f = open("stdout.dmp", 'w')

    try:
        check_call(['timeout 60 make'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
    except subprocess.CalledProcessError:
        return (1, -1, -1)

    etime = -1.0
    size = -1
    timing = []

    repeat = TIME_MAX   #set max run according to runtime


    for i in range(0, repeat):

        try:
            start = time.time()
            check_call(['taskset 0x1 make run'], stdout=f,
                   stderr=STDOUT, cwd=current_dir, shell=True)
            end = time.time()
            result_correct = 1

            if(i==0):
                if(os.path.isfile("data.dmp.ref")):
                    if(os.path.isfile("ftmp_out")):
                        os.system("mv ftmp_out data.dmp")
                    if(os.path.isfile("data.dmp")):
                        #t1 = open("data.dmp.ref", "rb").read()
                        #t2 = open("data.dmp", "rb").read()
                        try:
                            check_output('diff -q data.dmp data.dmp.ref', cwd=current_dir, shell=True)
                        except subprocess.CalledProcessError as e:
                            result_correct = False
                    else:
                        result_correct = False

                if(os.path.isfile("stdout.dmp.ref")):
                    if(os.path.isfile("stdout.dmp")):
                        t1 = open("stdout.dmp.ref", "r").read()
                        t2 = open("stdout.dmp", "r").read()
                        print(t1)
                        print(t2)
                        result_correct = result_correct and (t1==t2)
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
            return (1, -1, -1)


        timing.append(end - start)
        

    avg_time = average_timing(timing)
    size = int(check_output(
        'ls -nl a.out | awk \'{print $5}\'', cwd=current_dir, shell=True))
    return (0, avg_time, size)



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

    #print 'found optimal ' + optimal + ' in ' + target_dir
    pass_list = ''
    with open(target_dir + '/' + optimal + '/passList.txt', 'r') as f:
        pass_list = f.read().split('\n')[0]
        f.close()
    return pass_list


def compare_with_other(current_dir, finished, res_tb, i):
    #try others pass list on myself
    os.chdir(current_dir)
    O3time = read_O3_time(current_dir)
    output = []

    for j, testcode in enumerate(finished):
        if(testcode != current_dir):
            others_list = read_list(testcode)
            if others_list != '':
                res = create_child(others_list, current_dir, O3time)
                if res[0] == 0:
                    res_tb[i][j] = (O3time - res[1])/O3time
                    if res[1] < O3time:
                        output.append(((O3time - res[1]) * 100 / O3time, testcode))

    output.sort(reverse=1)
    with open(current_dir + "/workedForMe.txt", "w") as f:
        for (t, c) in output:
            f.write(c + '\t')
            f.write(str(t) + '\n')
        f.close()
    print ('    found '+str(len(output))+' similar')
    return res_tb


def main():
    base_dir = sys.path[0]
    #base_dir += '/polybench-c-4.2.1-beta'
    #base_dir += '/polybench-c-4.2.1-beta/stencils/jacobi-1d'
    #base_dir += '/cBench_V1.1/automotive_bitcount'

    testcodes = get_testcodes(base_dir)

    if len(testcodes) == 0:
        print ('cannot find any MARKER in (', base_dir, '), run \'generate_makefile\' ')
        return

    #testcodes = random_select(testcodes, 1)

    finished = load_finished(sys.path[0])
    if finished == []:
        print('did not finish GA')

    print ('found ' + str(len(finished)) +'/' + str(len(testcodes)) + ' finished benchmarks:')
    print (finished)
    cmd = input('continue? (y/n) ')
    if cmd != 'y':
        return


    total = len(finished)
    res = [[ -255 for _ in range(0, total)] for _ in range(0, total)]


    for i, testcode in enumerate(finished):
        print('Checking ['+ str(i+1) + '/' + str(total)+'] ' + shorten(testcode))
        res = compare_with_other(testcode, finished, res, i)


    with open(base_dir+'/../cross.pkl', 'wb') as f:
        pickle.dump(finished, f)
        pickle.dump(res, f)



    print('\ndone\n')

    print(res)
    pdb.set_trace()

def average_timing(t1):
    t1.sort()
    if(len(t1)>2):
        t2 = t1[1:-1]
        avg = sum(t2) / float(len(t2))
    else:
        avg = t1[0]
    return avg


def shorten(s):
    if 'workspace' in s:
        return s[s.find('workspace')+9:]
    else:
        return s


if __name__ == "__main__":
    main()
