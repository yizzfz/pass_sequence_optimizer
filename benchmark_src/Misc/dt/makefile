FILES= dt.c

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
