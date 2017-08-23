FILES= system.c genprime.c rsagen.c md5.c mdfile.c armor.c randpool.c getopt.c zdeflate.c keyadd.c pgp.c idea.c charset.c zbits.c crypto.c language.c mpw32asm.c config.c zunzip.c keymaint.c sleep.c passwd.c ztrees.c zfile_io.c random.c gettime.c strtol.c zinflate.c noise.c zip.c zglobals.c zipup.c rsaglue1.c keymgmt.c mpiio.c mpilib.c more.c fileio.c memmove.c
OBJs= system.o genprime.o rsagen.o md5.o mdfile.o armor.o randpool.o getopt.o zdeflate.o keyadd.o pgp.o idea.o charset.o zbits.o crypto.o language.o mpw32asm.o config.o zunzip.o keymaint.o sleep.o passwd.o ztrees.o zfile_io.o random.o gettime.o strtol.o zinflate.o noise.o zip.o zglobals.o zipup.o rsaglue1.o keymgmt.o mpiio.o mpilib.o more.o fileio.o memmove.o
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
