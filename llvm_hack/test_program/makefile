FILES= jacobi-1d.c
WORKLOAD= -DEXTRALARGE_DATASET

ULT=$(WORKSPACE)/polybench-c-4.2.1-beta/utilities
FLAGS=-I$(ULT) -DPOLYBENCH_DUMP_ARRAYS $(WORKLOAD)
cc=clang
opt=opt

test1:
	$(cc) $(FILES) -O3 $(FLAGS) -lm $(ULT)/polybench.o
	time -p sh -c './a.out 2>/dev/null'

test2:
	@$(cc) $(FILES) -O1 $(FLAGS) -emit-llvm -S -o A.ll
	@$(opt) A.ll -o A.ll -O3 -S
	@$(cc) A.ll -O1 -lm $(ULT)/polybench.o
	@time -p sh -c './a.out 2>/dev/null'

test3:
	@$(cc) $(FILES) -O1 $(FLAGS) -emit-llvm -S -o B.ll
	@$(opt) B.ll -o B.ll -CPS -S
	@$(cc) B.ll -O1 -lm $(ULT)/polybench.o
	@time -p sh -c './a.out 2>/dev/null'
