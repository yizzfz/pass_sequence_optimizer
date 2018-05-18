FILES= crctable.c blocksort.c randtable.c compress.c bzlib.c loop-wrap.c decompress.c bzip2.c huffman.c
LL1= crctable.1.ll blocksort.1.ll randtable.1.ll compress.1.ll bzlib.1.ll loop-wrap.1.ll decompress.1.ll bzip2.1.ll huffman.1.ll
LL2= crctable.2.ll blocksort.2.ll randtable.2.ll compress.2.ll bzlib.2.ll loop-wrap.2.ll decompress.2.ll bzip2.2.ll huffman.2.ll
LL3= crctable.3.ll blocksort.3.ll randtable.3.ll compress.3.ll bzlib.3.ll loop-wrap.3.ll decompress.3.ll bzip2.3.ll huffman.3.ll
CC_FLAGS=
LD_FLAGS=-lm

all:
	@$(RM) IRinfo.txt *.profraw
	@make ll1 -s
	@clang $(LL1) -O0 $(LD_FLAGS) -o a.out
	@$(RM) *.ll

run:
	@taskset 0x1 ./__run 1 15

ll1: $(LL1)
	@

hotpath: $(LL2)
	@$(RM) IRinfo_profile.txt *.profraw
	@make ll1 -s
	@make ll2 -s
	@clang $(LL2) -O0 -fprofile-generate $(LD_FLAGS) -o a.out
	@./__run 1
	@llvm-profdata show -counts -all-functions default* > hotpath.txt
	@make ll3 -s
	@$(RM) *.ll

ll2: $(LL2)
	@

ll3: $(LL3)
	@

%.ll: %.c
	@clang $^ -O0 -emit-llvm -S -o $@ -w $(CC_FLAGS)

%.1.ll: %.ll
	@opt $^ -S -o $@ $(OPTFLAGS)
	@opt $@ -S -o tmp.ll -O0 -load $(IR_PASS)

%.2.ll: %.ll
	@opt $^ -S -o tmp1.ll $(OPTFLAGS)
	@opt tmp1.ll -S -o $@ -O0 -profile-generate

%.3.ll: %.2.ll
	@opt $^ -S -o $@ -O0 -load $(IR_PASS) -hotpath -hotpath-file=hotpath.txt
