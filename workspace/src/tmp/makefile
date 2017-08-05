all: Source.cpp
	@clang++ Source.cpp -O3 -emit-llvm -S -o A.ll -w
	@opt A.ll -S -o B.ll $(OPTFLAGS) 
	@opt B.ll -S -o C.ll -O0 -load $(IR_PASS)
	@clang++ B.ll -O0
	
	
hotpath: tmp.cpp
	@$(RM) IRinfo* *.profraw
	@clang++ tmp.cpp -O0 -emit-llvm -S -o A.ll -w 
	@opt A.ll -S -o B.ll -O0
	@opt B.ll -S -o C.ll -O0 -profile-generate 
	@opt B.ll -S -O0 -o tmp.ll -load $(IR_PASS)
	@clang++ B.ll -O0 -fprofile-generate -fno-lto
	@./a.out
	@llvm-profdata show -counts -all-functions default* > hotpath.txt
	@opt C.ll -S -O0 -o tmp.ll -load $(IR_PASS) -hotpath -hotpath-file=hotpath.txt

