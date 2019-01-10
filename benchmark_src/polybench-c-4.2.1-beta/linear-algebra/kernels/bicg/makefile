FILES= bicg.c
WORKLOAD= -DEXTRALARGE_DATASET 

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
