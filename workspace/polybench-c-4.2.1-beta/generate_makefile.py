import os
import subprocess
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue

makefile_content = "\
ULT=/home/naim/compiler/workspace/polybench-c-4.2.1-beta/utilities\n\
FLAGS=-DPOLYBENCH_TIME -I \n\n\
all: $(FILES)\n\
\t@$(RM) IRinfo* *.profraw\n\
\t@clang $(FILES) -O0 -emit-llvm -S -o A.ll -w $(FLAGS)\n\
\t@opt A.ll -S -o B.ll $(OPTFLAGS)\n\
\t@opt B.ll -S -o tmp.ll -O0 -load $(IR_PASS)\n\
\t@clang B.ll -O0 $(ULT)/polybench.o -lm $(FLAGS)\n\
\n\
hotpath: $(FILES)\n\
\t@$(RM) IRinfo* *.profraw\n\
\t@clang $(FILES) -O0 -emit-llvm -S -o A.ll -w $(FLAGS)\n\
\t@opt A.ll -S -o B.ll $(OPTFLAGS)\n\
\t@opt B.ll -S -o C.ll -O0 -profile-generate\n\
\t@opt B.ll -S -o tmp.ll -O0 -load $(IR_PASS)\n\
\t@clang B.ll -O0 $(ULT)/polybench.o -fprofile-generate -lm -o p.out $(FLAGS)\n\
\t@./p.out\n\
\t@llvm-profdata show -counts -all-functions default* > hotpath.txt\n\
\t@opt C.ll -S -o tmp.ll -O0 -load $(IR_PASS) -hotpath -hotpath-file=hotpath.txt\n\
\t@clang B.ll -O0 $(ULT)/polybench.o -lm $(FLAGS)\n"


def list_to_string(list):
  s = ''
  for ele in list:
    s += ' ' + ele
  return s

def thread_func(root, cfiles):
  envvar_files = "FILES=" + list_to_string(cfiles)
  with open(root+'/makefile', "wb") as f:
    f.write(envvar_files+"\n")
    f.write(makefile_content)
  try:
    check_call(['make hotpath'], cwd = root, shell = True)
  except subprocess.CalledProcessError as e:
    print 'make error'
  print root+" -success"

  
def main():
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
