import random
import os
import time
import subprocess
import sys
import pickle
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue, Value

TIME_MAX = 8

def load_finished(base_dir):
    try:
        with open(base_dir+'/FF.pkl', 'rb') as f:
            ff = pickle.load(f)
            f.close()
    except FileNotFoundError:
        ff = []
    return ff

def record_list(prefix, time, size, cnt):
    subdir = 'data_' + prefix + str(cnt)
    os.system('mkdir -p ' + subdir)
    os.system('touch tmp_empty.ll')
    os.system('echo "$OPTFLAGS\n" > ' + subdir + '/passList.txt')
    os.system('opt tmp_empty.ll -S $OPTFLAGS -debug-pass=Structure -o tmp_empty1.ll 2>> ' +
              subdir + '/passList.txt')
    os.system('rm tmp*.ll')
    if cnt > 0:
        os.system('cp IRinfo.txt ' + subdir + '/IRinfo.txt')
    #os.system('cp *.ll $SUBDIR/')
    with open(subdir + '/performance.txt', "w") as f:
        f.write('execution time: ' + str(time) + '\n')
        f.write('binary size: ' + str(size) + '\n')
        f.close()

def create_child(list_str, current_dir, time_baseline):
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

    repeat = TIME_MAX   #set max run according to runtime
    if(time_baseline>60):
        repeat = min(repeat, 3)
    elif(time_baseline>20):
        repeat = min(repeat, 5)

    if(time_baseline>3):
        checkpoint = 1
    else:
        checkpoint = 3
    for i in range(0, repeat):
        start = time.time()
        check_call(['taskset 0x1 make run'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
        end = time.time()
        timing.append(end - start)
        if(i==checkpoint):   #check if worth continue at 1st run or 3rd run
            current_time = average_timing(timing)
            if(current_time-time_baseline > min(10, time_baseline*0.1)):
                break

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


def compare_with_other(current_dir, finished):
    #try others pass list on myself
    os.chdir(current_dir)
    O3time = read_O3_time(current_dir)
    output = []

    for testcode in finished:
        if(testcode != current_dir):
            others_list = read_list(testcode)
            if others_list != '':
                res = create_child(others_list, current_dir, O3time)
                if res[0] == 0:
                    if res[1] < O3time:
                        output.append(((O3time - res[1]) * 100 / O3time, testcode))

    output.sort(reverse=1)
    with open(current_dir + "/workedForMe.txt", "w") as f:
        for (t, c) in output:
            f.write(c + '\t')
            f.write(str(t) + '\n')
        f.close()
    print ('    found '+str(len(output))+' similar')


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

    total = len(testcodes)
    i = 1
    for testcode in testcodes:
        print('Checking ['+ str(i) + '/' + str(total)+'] ' + shorten(testcode))
        if((testcode in finished)):
            compare_with_other(testcode, finished)
        i = i+1

    print('\ndone\n')


def average_timing(t1):
    t1.sort()
    if(len(t1)>2):
        t2 = t1[1:-1]
        avg = sum(t2) / float(len(t2))
    else:
        avg = t1[0]
    return avg


def shorten(s):
    if 'poly' in s:
        return s[s.find('poly'):]
    elif 'cBench' in s:
        return s[s.find('cBench'):]
    else:
        return s


if __name__ == "__main__":
    main()
