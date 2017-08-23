FILES= bf_ofb64.c bf_skey.c bf_enc.c bf_cfb64.c bf_cbc.c bf_ecb.c bf.c
OBJs= bf_ofb64.o bf_skey.o bf_enc.o bf_cfb64.o bf_cbc.o bf_ecb.o bf.o
FLAGS=

all: $(FILES)
	@$(RM) IRinfo* *.profraw
	@clang $(FILES) -O0 -emit-llvm -S -o A.ll -w $(FLAGS)
	@opt A.ll -S -o B.ll $(OPTFLAGS)
	@opt B.ll -S -o tmp.ll -O0 -load $(IR_PASS)
	@clang B.ll -O0 $(ULT)/polybench.o -lm $(FLAGS)

hotpath: $(FILES)
	@$(RM) IRinfo* *.profraw
	@clang $(FILES) -O0 -emit-llvm -S -o A.ll -w $(FLAGS)
	@opt A.ll -S -o B.ll $(OPTFLAGS)
	@opt B.ll -S -o C.ll -O0 -profile-generate
	@opt B.ll -S -o tmp.ll -O0 -load $(IR_PASS)
	@clang B.ll -O0 $(ULT)/polybench.o -fprofile-generate -lm -o p.out $(FLAGS)
	@./p.out
	@llvm-profdata show -counts -all-functions default* > hotpath.txt
	@opt C.ll -S -o tmp.ll -O0 -load $(IR_PASS) -hotpath -hotpath-file=hotpath.txt
	@clang B.ll -O0 $(ULT)/polybench.o -lm $(FLAGS)

%.ll: %.c
	@clang $^ -O0 -emit-llvm -S -o $@ -w $(FLAGS)

%.ll1: %.ll
	@opt $^ -S -o $@ $(OPTFLAGS)
	@opt $@ -S -o tmp.ll -O0 -load $(IR_PASS)   #first analysis

bin_p: *.ll1
	@clang $^ -O0 -fprofile-generate -lm -o p.out
	@./p.out
	@llvm-profdata show -counts -all-functions default* > hotpath.txt

%.ll2: %.ll p.out
	@opt $^ -S -o $@ $(OPTFLAGS) -O0 -profile-generate
	@opt $@ -S -o tmp.ll -O0 -load $(IR_PASS) -hotpath -hotpath-file=hotpath.txt

bin_o: *.ll2
	@clang $^ -O0 -fprofile-generate -lm -o o.out
