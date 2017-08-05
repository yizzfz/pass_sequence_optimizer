folder=medley/nussinov
name=nussinov
file=$(folder)/$(name).c
dump=-DPOLYBENCH_DUMP_ARRAYS -o ${name}_ref -O3
time=-DPOLYBENCH_TIME -o ${name}_time -O3
myPass=../myPass/apPass.so

ref:
	clang -I utilities -I $(folder) utilities/polybench.c $(file) $(dump)
	./${name}_ref 2>${name}_ref.out
	
time:
	clang -I utilities -I $(folder) utilities/polybench.c $(file) $(time)
	./${name}_time

pass:
	clang++ -O0 -emit-llvm -S $(file) -o first.ll $(flags) -I utilities -DPOLYBENCH_TIME
	opt -O1 -load $(myPass) -S first.ll -o kernel.ll -disable-loop-vectorization -disable-loop-unrolling
	clang wrapper.c -emit-llvm -S -fopenmp -O3 
	clang++ tool.c wrapper.ll kernel.ll -o $(name)_parallel -O3 -fopenmp 
	
	
clean:
	$(RM) *.ll *.c *_ref *_time *.out
