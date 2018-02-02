import random
import os
import time
import subprocess
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue, Value


def load_from_txt(file):
    with open(file,"rb") as f:
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




def t_check(current_dir, O3_list):
    os.chdir(current_dir)
    O3_list_str = list_to_string(O3_list)

    os.environ["OPTFLAGS"] = O3_list_str
    err = os.system('make')
    O3time = -1.0
    O3size = -1
    if err==0:
      DEVNULL = open(os.devnull, 'wb', 0)


      try:
        start = time.time()
        check_call(['make run'], cwd = current_dir, shell = True)
        end = time.time()
      except subprocess.CalledProcessError as e:
        print 'cannot compile with O3: ' + current_dir
        return

      O3time = end - start
      O3size = int(check_output('ls -nl a.out | awk \'{print $5}\'', cwd = current_dir, shell = True))
    else:
      print 'cannot compile with O3: ' + current_dir
      return


    print '['+ shorten(current_dir) + '] O3 time = ', O3time, ', bin size = ', O3size

    os.system("rm -rf *.txt")



def main():
    O3_list = load_from_txt('O3List.txt')

    base_dir = '.'

    testcodes = get_testcodes(base_dir)

    if len(testcodes) == 0:
      print 'cannot find any MARKER, run \'generate_makefile\''
      return

    print 'found ' + str(len(testcodes)) + ' benchmarks:'
    print testcodes
    cmd = raw_input('continue? (y/n) ')

    if cmd == 'y':
    #   threads = []
    #   i=0
    #   for testcode in testcodes:
    #     thread = Process(target = t_check, args = (testcode, O3_list))
    #     threads.append(thread)
    #     threads[i].start()
    #     i+=1
      #
    #   for thread in threads:
    #     thread.join()
        for testcode in testcodes:
            t_check(testcode, O3_list)



def shorten(s):
    if 'poly' in s:
      return s[s.find('poly'):]
    elif 'cBench' in s:
      return s[s.find('cBench'):]
    else:
      return s

if __name__=="__main__":
    main()
