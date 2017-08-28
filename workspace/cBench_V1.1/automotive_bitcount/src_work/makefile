<<<<<<< HEAD
FILES= bitcnt_4.c loop-wrap.c bstr_i.c bitcnt_3.c bitstrng.c bitcnts.c bitfiles.c bitcnt_2.c bitcnt_1.c bitarray.c
LL1= bitcnt_4.1.ll loop-wrap.1.ll bstr_i.1.ll bitcnt_3.1.ll bitstrng.1.ll bitcnts.1.ll bitfiles.1.ll bitcnt_2.1.ll bitcnt_1.1.ll bitarray.1.ll
LL2= bitcnt_4.2.ll loop-wrap.2.ll bstr_i.2.ll bitcnt_3.2.ll bitstrng.2.ll bitcnts.2.ll bitfiles.2.ll bitcnt_2.2.ll bitcnt_1.2.ll bitarray.2.ll
LL3= bitcnt_4.3.ll loop-wrap.3.ll bstr_i.3.ll bitcnt_3.3.ll bitstrng.3.ll bitcnts.3.ll bitfiles.3.ll bitcnt_2.3.ll bitcnt_1.3.ll bitarray.3.ll
=======
FILES= bitcnt_1.c bitcnt_2.c bitcnt_3.c bitstrng.c loop-wrap.c bitarray.c bitcnt_4.c bstr_i.c bitfiles.c bitcnts.c
LL1= bitcnt_1.1.ll bitcnt_2.1.ll bitcnt_3.1.ll bitstrng.1.ll loop-wrap.1.ll bitarray.1.ll bitcnt_4.1.ll bstr_i.1.ll bitfiles.1.ll bitcnts.1.ll
LL2= bitcnt_1.2.ll bitcnt_2.2.ll bitcnt_3.2.ll bitstrng.2.ll loop-wrap.2.ll bitarray.2.ll bitcnt_4.2.ll bstr_i.2.ll bitfiles.2.ll bitcnts.2.ll
LL3= bitcnt_1.3.ll bitcnt_2.3.ll bitcnt_3.3.ll bitstrng.3.ll loop-wrap.3.ll bitarray.3.ll bitcnt_4.3.ll bstr_i.3.ll bitfiles.3.ll bitcnts.3.ll
>>>>>>> 6f701e38f661d4dfa548b57c00f6048e8fec418f
CC_FLAGS=
LD_FLAGS=-lm 

all: 
	@$(RM) IRinfo.txt *.profraw
	@make ll1
	@clang $(LL1) -O0 $(LD_FLAGS) -o a.out
	
run:
	@./__run 1
	
ll1: $(LL1)
	@

hotpath: $(LL2)
	@$(RM) IRinfo_profile.txt *.profraw
	@make ll2
	@clang $(LL2) -O0 -fprofile-generate $(LD_FLAGS) -o a.out
	@./__run 1
	@llvm-profdata show -counts -all-functions default* > hotpath.txt
	@make ll3

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
