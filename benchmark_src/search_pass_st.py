import random
import os
import time
import subprocess
import sys
import pickle
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue, Value

GA_MAX = 1
CHILD_MAX = 1
TIME_MAX = 8


def load_prepared(base_dir):
    try:
        with open(base_dir+'/PP.pkl', 'rb') as f:
            pp = pickle.load(f)
            f.close()
    except FileNotFoundError:
        pp = []
    return pp

def load_finished(base_dir):
    try:
        with open(base_dir+'/FF.pkl', 'rb') as f:
            ff = pickle.load(f)
            f.close()
    except FileNotFoundError:
        ff = []
    return ff

def record_prepared(base_dir, pp):
    with open(base_dir+'/PP.pkl', 'wb') as f:
        pickle.dump(pp, f)
        f.close()

def record_finished(base_dir, ff):
    with open(base_dir+'/FF.pkl', 'wb') as f:
        pickle.dump(ff, f)
        f.close()


def load_from_txt(file):
    with open(file, "r") as f:
        lines = f.read().split('\n')
        f.close()
    passes = lines[:len(lines) - 1]
    return passes


def random_gen(n):
    new_list = []
    for i in range(0, random.randint(0, n - 1)):
        index = random.randint(0, n - 1)
        new_list.append(index)
    return new_list


def random_select(plist, n):
    new_list = []
    rng = len(plist) - 1
    for i in range(0, n):
        index = random.randint(0, rng)
        new_list.append(plist[index])
    return list(set(new_list))


def list_to_string(pass_list):
    s = ''
    for ele in pass_list:
        s += ' ' + ele
    return s


def generate_list(all_list, parent_list):
    new_list = parent_list[:]
    change_rate = min(20, len(parent_list) - 1)

    # insert/delete rate
    #delete_rate = int(len(parent_list)*0.2)
    #insert_rate = 3000/len(parent_list)
    delete_rate = change_rate
    insert_rate = change_rate

    random_insert_idx = random_gen(insert_rate)
    random_delete_idx = random_gen(delete_rate)

    for k in random_delete_idx:
        new_list[k] = 'd'

    for k in random_insert_idx:
        pos = random.randint(0, len(parent_list) - 1)
        new_list.insert(pos, all_list[k])

    final_list = [e for e in new_list if e != 'd']
    #print 'new list = ', final_list
    #print 'current size ', len(parent_list), ' insert ', len(random_insert_idx), ' delete ', len(random_delete_idx), ' new size ', len(final_list)
    return final_list


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


def ga(all_list, parent_list, current_dir, time_baseline, size_baseline, cnt, succ, O3_time):
    best_time = time_baseline
    best_list = parent_list[:]
    size = size_baseline
    improved = 0
    current_best_improve = (O3_time - time_baseline)*100/O3_time
    # num of children per run
    for i in range(0, CHILD_MAX):
        cnt += 1
        child_list = generate_list(all_list, parent_list)
        list_str = list_to_string(child_list)
        res = create_child(list_str, current_dir, time_baseline)
        if res[0] == 0:
            child_time = res[1]
            child_size = res[2]
            time_improve = (time_baseline - child_time) * 100 / time_baseline
            size_improve = (size_baseline - child_size) * 100 / size_baseline
            O3_improve = (O3_time - child_time)*100/O3_time
            print(' '*80, end='\r')
            #print ('['+str(cnt)+']'+'child ', i, ': num of passes ', len(child_list), ', time {:.3f} '.format(child_time), '({:.3f}%)'.format(time_improve), end='\r')
            print ('['+str(cnt)+']', ': no.passes ', len(child_list), ', time {:.3f} '.format(child_time), '({:.3f}%)'.format(O3_improve), 'current best = {:.3f}%'.format(current_best_improve), end='\r')
            if time_improve > 0.5 and child_time < best_time:  # choose this child if improvment is greater than ?%
                best_time = child_time
                best_list = child_list[:]
                size = child_size
                improved = 1
                record_list('A', child_time, child_size, cnt)
                succ += 1
            else:
                record_list('B', child_time, child_size, cnt)

    return (improved, best_time, best_list, size, cnt, succ)


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


def filter_testcodes(base_dir, testcodes_all):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
        cfiles = []
        for file in files:
            if file == 'MARKER':
                path = os.path.realpath(root)
                if path in testcodes_all:
                    testcodes.append(path)


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


def compare_with_other(current_dir, testcodes):
    #try others pass list on myself
    O3time = read_O3_time(current_dir)
    os.chdir(current_dir)

    output = []

    for testcode in testcodes:
        others_list = read_list(testcode)
        if others_list != '':
            res = create_child(others_list, current_dir, O3time)
            if res[0] == 0:
                if res[1] < O3time:
                    output.append(((O3time - res[1]) * 100 / O3time, testcode))

    output.sort(reverse=1)
    with open(current_dir + "/workedForMe.txt", "a") as f:
        for (t, c) in output:
            f.write(c + '\t')
            f.write(str(t) + '\n')
        f.close()


def t_prepare(current_dir, O3_list):
    os.chdir(current_dir)
    O3_list_str = list_to_string(O3_list)
    os.system("rm -rf data* *.txt")
    os.system('mkdir data_O0')
    DEVNULL = open(os.devnull, 'wb', 0)

    # first do O0 and profile
    try:
        check_call(['make hotpath'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
    except subprocess.CalledProcessError as e:
        print ('make hotpath error')
        os.system('rm ' + root + '/MARKER')
        return

    os.system('cp IRinfo.txt data_O0/IRinfo.txt')
    os.system('cp IRinfo_profile.txt data_O0/IRinfo_profile.txt')

    # next do O3
    os.environ["OPTFLAGS"] = O3_list_str
    try:
        check_call(['make'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
    except subprocess.CalledProcessError as e:
        print ('make O3 error')
        os.system('rm ' + root + '/MARKER')
        return

    O3time = -1.0
    O3size = -1

    timing = []
    for i in range(0, TIME_MAX):
        start = time.time()
        check_call(['taskset 0x1 make run'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
        end = time.time()
        timing.append(end - start)

    O3time = average_timing(timing)
    O3size = int(check_output(
        'ls -nl a.out | awk \'{print $5}\'', cwd=current_dir, shell=True))


    print ('    O3 time = {:.4f}'.format(O3time))
    record_list('O3_', O3time, O3size, 0)
    os.system('cp IRinfo.txt data_O3_0/IRinfo.txt')


def t_GA(current_dir, all_list, O3_list, testcodes):
    cnt = 0
    succ = 0
    os.chdir(current_dir)
    current_list = O3_list[:]
    O3_time = read_O3_time(current_dir)
    current_time = O3_time
    if current_time == -1:
        return

    os.chdir(current_dir)
    current_size = 1
    fail_in_a_row = 0

    #### num. ga steps ####
    for i in range(0, GA_MAX):
        res = ga(all_list, current_list, current_dir,
                 current_time, current_size, cnt, succ, O3_time)
        cnt = res[4]
        succ = res[5]
        improved = res[0]
        if improved == 0:
            fail_in_a_row += 1
            if fail_in_a_row > 50:
                break
        else:
            fail_in_a_row = 0
            current_time = res[1]
            current_list = res[2][:]
            current_size = res[3]
    final_improve = (O3_time-current_time)*100/O3_time
    print ('    final time = {:.4f}'.format(current_time),
            '({:.3f}%)'.format(final_improve),
            ', attempt =', str(cnt), ', successed =' , str(succ), ' '*10)
    compare_with_other(current_dir, testcodes)
    os.chdir(current_dir)


def main():


    all_list = load_from_txt('allPassList.txt')
    O3_list = load_from_txt('O3List.txt')

    base_dir = sys.path[0]
    base_dir += '/polybench-c-4.2.1-beta'
    #base_dir += '/polybench-c-4.2.1-beta/stencils/jacobi-1d'
    #base_dir += '/cBench_V1.1/automotive_bitcount'

    testcodes = get_testcodes(base_dir)

    if len(testcodes) == 0:
        print ('cannot find any MARKER in (', base_dir, '), run \'generate_makefile\' ')
        return

    #testcodes = random_select(testcodes, 1)

    finished = load_finished(sys.path[0])
    prepared = load_prepared(sys.path[0])
    start_from_last = False
    if finished != [] or prepared != []:
        stmp = 'prepared '+str(len(prepared))+', finished '+str(len(finished))
        cmd = input('found existed progress, '+stmp+', continue? (y/n) ')
        if(cmd!='y'):
            finished = []
            prepared = []
        else:
            print('continued')
            start_from_last = True



    print ('found ' + str(len(testcodes)) + ' benchmarks:')
    print (testcodes)
    cmd = input('continue? (y/n) ')
    if cmd != 'y':
        return

    total = len(testcodes)
    i = 1

    print('GA stages = ' + str(GA_MAX) + ', child num = ' +
          str(CHILD_MAX) + ', loop wrap = ' + str(TIME_MAX))
    for testcode in testcodes:
        print('Preparing ['+ str(i) + '/' + str(total)+'] ' + shorten(testcode))
        if(not(start_from_last and testcode in prepared)):
            t_prepare(testcode, O3_list)
            prepared.append(testcode)
            record_prepared(sys.path[0], prepared)
        i = i+1

    print('\npreparation done\n')

    testcodes_f = filter_testcodes(base_dir, testcodes)
    record_prepared(sys.path[0], testcodes_f)
    total = len(testcodes_f)
    i = 1
    for testcode in testcodes_f:
        print('GA on ['+ str(i) + '/' + str(total)+'] ' + shorten(testcode))
        if(not(start_from_last and testcode in finished)):
            t_GA(testcode, all_list, O3_list, testcodes_f)
            finished.append(testcode)
            record_finished(sys.path[0], finished)
        i=i+1
    print('\nall done\n')

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
