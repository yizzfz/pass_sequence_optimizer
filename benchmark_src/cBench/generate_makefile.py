import os
import subprocess
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue


def list_to_string(list):
  s = ''
  for ele in list:
    s += ' ' + ele
  return s

def cfiles_to_objs(list, pf):
  s = ''
  for ele in list:
    s += ' ' + ele[0:-2] + pf
  return s

def read_makefile():
  s = ''
  with open("makefile_template.txt", 'r') as f:
    s = f.read()
  return s

def get_cc_flags(root):
  flags = ''
  with open(root+'/../src/Makefile', 'r') as f1:
    lines = f1.read().split('\n')
    for line in lines:
      if '$(ZCC) $(CCC_OPTS) $(CCC_OPTS_ADD)' in line:
        args = line.split(' ')
        for arg in args:
          if arg.startswith('-D') or arg.startswith('-I'):
            flags += arg + ' '
  return flags

def get_ld_flags(root):
  flags = ''
  with open(root+'/../src/Makefile', 'r') as f1:
    lines = f1.read().split('\n')
    for line in lines:
      if '$(LDCC) $(LD_OPTS) $(CCC_OPTS_ADD)' in line:
        args = line.split(' ')
        for arg in args:
          if arg.startswith('-l'):
            flags += arg + ' '
  return flags


def thread_func(root, cfiles, makefile_content):
  env_FILES = "FILES=" + list_to_string(cfiles)
  workload = open(root+'/workload.txt', 'r').read()
  with open(root+'/makefile', "w") as f:
    f.write(env_FILES+"\n")
    f.write("LL1=" + cfiles_to_objs(cfiles, '.1.ll')+"\n")
    f.write("LL2=" + cfiles_to_objs(cfiles, '.2.ll')+"\n")
    f.write("LL3=" + cfiles_to_objs(cfiles, '.3.ll')+"\n")
    f.write("CC_FLAGS=" + get_cc_flags(root)+'\n')
    f.write("LD_FLAGS=" + get_ld_flags(root)+'\n')
    f.write('WORKLOAD='+workload+'\n')
    f.write("\n")
    f.write(makefile_content)
  os.system('touch '+root+'/MARKER')
  os.system('rm -f '+root+'/Make*')

  print (root, 'done', workload)


def main():

  threads = []
  i = 0
  # os.system('./all__delete_work_dirs')
  # print ('work dir cleared')
  # os.system('./all__create_work_dirs')
  # print ('work dir created')

  makefile_content = read_makefile()
  for root, dirs, files in os.walk("."):
    cfiles = []
    for file in files:
      if file.endswith(".c") :
        cfiles.append(file)
    if len(cfiles)>=1 and 'src_work' in root and 'workload.txt' in files:
      # thread = Process(target = thread_func, args = (root, cfiles, makefile_content,  ))
      # threads.append(thread)
      # threads[i].start()
      # i+=1
      thread_func(root, cfiles, makefile_content)




if __name__=="__main__":
  main()
