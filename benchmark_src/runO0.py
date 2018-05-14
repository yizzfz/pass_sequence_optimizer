import random
import os
import time
import subprocess
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue, Value
TIME_MAX=1
def get_testcodes(base_dir):
    testcodes = []
    for root, dirs, files in os.walk(base_dir):
      cfiles = []
      for file in files:
        if file == 'MARKER':
          testcodes.append(os.path.realpath(root))
    return testcodes

def t_check(current_dir):
    os.chdir(current_dir)
    os.system('mkdir pre_O0')
    DEVNULL = open(os.devnull, 'wb', 0)

    os.environ["OPTFLAGS"] = ''
    try:
        check_call(['make'], stdout=DEVNULL,
                   stderr=STDOUT, cwd=current_dir, shell=True)
    except subprocess.CalledProcessError as e:
        print ('make O0 error')
        return

    O0time = -1.0
    O0size = -1

    timing = []
    start = time.time()
    check_call(['taskset 0x1 make run'], stdout=DEVNULL,
               stderr=STDOUT, cwd=current_dir, shell=True)
    end = time.time()

    O0time = end-start
    O0size = int(check_output(
        'ls -nl a.out | awk \'{print $5}\'', cwd=current_dir, shell=True))


    print ('    O0 time = {:.4f}'.format(O0time))
    with open('pre_O0/performance.txt', "w") as f:
        f.write('execution time: ' + str(O0time) + '\n')
        f.write('binary size: ' + str(O0size) + '\n')
        f.close()


def main():

    base_dir = '.'

    testcodes = get_testcodes(base_dir)

    if len(testcodes) == 0:
      print ('cannot find any MARKER, run \'generate_makefile\'')
      return

    print ('found ' + str(len(testcodes)) + ' benchmarks:')
    print (testcodes)
    cmd = raw_input('continue? (y/n) ')

    i=1
    total = len(testcodes)
    if cmd == 'y':
        for testcode in testcodes:
            print('Checking ['+ str(i) + '/' + str(total)+'] ' + shorten(testcode))
            t_check(testcode)
            i+=1


def shorten(s):
    if 'poly' in s:
      return s[s.find('poly'):]
    elif 'cBench' in s:
      return s[s.find('cBench'):]
    else:
      return s

if __name__=="__main__":
    main()
