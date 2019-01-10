# this is for everything other than cBench and polybench

import os
import subprocess
from subprocess import check_call, check_output, STDOUT
from multiprocessing import Process, Queue

makefile_content = \
'''
FLAGS=-lm

all: $(FILES)
	@$(RM) IRinfo* *.profraw
	@clang $(FILES) -O1 -emit-llvm -S -o A.ll -w $(FLAGS)
	@opt A.ll -S -o B.ll $(OPTFLAGS)
	@opt B.ll -S -o tmp.ll -O0 -load $(IR_PASS)
	@clang B.ll -O1 $(FLAGS)

hotpath: $(FILES)
	@$(RM) IRinfo* *.profraw
	@clang $(FILES) -O0 -emit-llvm -S -o A.ll -w $(FLAGS)
	@cp A.ll B.ll
	@opt B.ll -S -o C.ll -O0 -profile-generate
	@opt B.ll -S -o tmp.ll -O0 -load $(IR_PASS)
	@clang B.ll -O0 -fprofile-generate -lm -o p.out $(FLAGS)
	@./p.out
	@llvm-profdata show -counts -all-functions default* > hotpath.txt
	@opt C.ll -S -o tmp.ll -O0 -load $(IR_PASS) -hotpath -hotpath-file=hotpath.txt
	@clang B.ll -O0 $(FLAGS)

run:
	@taskset 0x1 ./a.out

profile: $(FILES)
	@clang $(FILES) -O3 -fprofile-generate $(FLAGS) -o p.out
	@taskset 0x1 ./p.out
	@llvm-profdata merge -output=a.prof default*
	@clang $(FILES) -O3 -fprofile-use=a.prof $(FLAGS)
'''


def list_to_string(list):
    s = ''
    for ele in list:
        s += ' ' + ele
    return s


def thread_func(root, cfiles):
    envvar_files = "FILES=" + list_to_string(cfiles)
    with open(root + '/makefile', "w") as f:
        f.write(envvar_files + "\n")
        f.write(makefile_content)
    os.system('touch ' + root + '/MARKER')

    print (root + " - done")


def main():

    threads = []
    i = 0
    for root, dirs, files in os.walk("."):
        cfiles = []
        for file in files:
            if file.endswith(".c"):
                cfiles.append(file)
        if len(cfiles) == 1:
            # thread = Process(target = thread_func, args = (root, cfiles, ))
            # threads.append(thread)
            # threads[i].start()
            thread_func(root, cfiles)
            i += 1


if __name__ == "__main__":
    main()
