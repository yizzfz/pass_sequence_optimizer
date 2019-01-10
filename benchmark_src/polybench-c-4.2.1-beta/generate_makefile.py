import os
import subprocess
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue

makefile_content = \
'''
ULT=$(WORKSPACE)/polybench-c-4.2.1-beta/utilities
FLAGS=-I$(ULT) -DPOLYBENCH_DUMP_ARRAYS $(WORKLOAD)

all: $(FILES)
	@$(RM) IRinfo* *.profraw
	@clang $(FILES) -O1 -emit-llvm -c -o A.ll -w $(FLAGS)
	@opt A.ll -o B.ll $(OPTFLAGS)
	@opt B.ll -o tmp.ll -O0 -load $(IR_PASS)
	@clang B.ll -O1 $(ULT)/polybench.o -lm $(FLAGS)

hotpath: $(FILES)
	@$(RM) IRinfo* *.profraw
	@clang $(FILES) -O0 -emit-llvm -c -o A.ll -w $(FLAGS)
	@cp A.ll B.ll
	@opt B.ll -o C.ll -O0 -profile-generate
	@opt B.ll -o tmp.ll -O0 -load $(IR_PASS)
	@clang B.ll -O1 $(ULT)/polybench.o -fprofile-generate -lm -o p.out $(FLAGS)
	@./p.out 2>/dev/null
	@llvm-profdata show -counts -all-functions default* > hotpath.txt
	@opt C.ll -o tmp.ll -O0 -load $(IR_PASS) -hotpath -hotpath-file=hotpath.txt
	@clang B.ll -O1 $(ULT)/polybench.o -lm $(FLAGS)

run:
	@taskset 0x1 ./a.out 2>data.dmp

profile: $(FILES)
	@clang $(FILES) -O3 -fprofile-generate $(FLAGS) -lm $(ULT)/polybench.o -o p.out
	@taskset 0x1 ./p.out 2>/dev/null
	@llvm-profdata merge -output=a.prof default*
	@clang $(FILES) -O3 -fprofile-use=a.prof $(FLAGS) -lm $(ULT)/polybench.o
'''


def list_to_string(list):
  s = ''
  for ele in list:
    s += ' ' + ele
  return s

def thread_func(root, cfiles):
  envvar_files = "FILES=" + list_to_string(cfiles)
  workload = open(root+'/workload.txt', 'r').read()
  with open(root+'/makefile', "w") as f:
    f.write(envvar_files+"\n")
    f.write('WORKLOAD='+workload+'\n')
    f.write(makefile_content)
  os.system('touch '+root+'/MARKER')

  print (root, "done", workload)


def main():
  os.system('./compile_uti.sh')
  print('utility compiled')
  threads = []
  i = 0
  for root, dirs, files in os.walk("."):
    cfiles = []
    for file in files:
      if file.endswith(".c"):
        cfiles.append(file)
    if len(cfiles)==1:
      thread = Process(target = thread_func, args = (root, cfiles, ))
      threads.append(thread)
      threads[i].start()
      i+=1




if __name__=="__main__":
  main()
