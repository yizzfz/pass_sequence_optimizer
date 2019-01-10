FILES= bitcnts.c bitcnt_1.c bitcnt_3.c bitcnt_2.c bitcnt_4.c bitstrng.c bstr_i.c loop-wrap.c bitfiles.c bitarray.c
LL1= bitcnts.1.ll bitcnt_1.1.ll bitcnt_3.1.ll bitcnt_2.1.ll bitcnt_4.1.ll bitstrng.1.ll bstr_i.1.ll loop-wrap.1.ll bitfiles.1.ll bitarray.1.ll
LL2= bitcnts.2.ll bitcnt_1.2.ll bitcnt_3.2.ll bitcnt_2.2.ll bitcnt_4.2.ll bitstrng.2.ll bstr_i.2.ll loop-wrap.2.ll bitfiles.2.ll bitarray.2.ll
LL3= bitcnts.3.ll bitcnt_1.3.ll bitcnt_3.3.ll bitcnt_2.3.ll bitcnt_4.3.ll bitstrng.3.ll bstr_i.3.ll loop-wrap.3.ll bitfiles.3.ll bitarray.3.ll
CC_FLAGS=
LD_FLAGS=-lm 
WORKLOAD=1 10

all:
	@$(RM) IRinfo.txt *.profraw
	@make ll1 -s
	@clang $(LL1) -O1 $(LD_FLAGS) -o a.out
	@$(RM) *.ll

run:
	@taskset 0x1 ./__run $(WORKLOAD)

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
	@opt $^ -S -o tmp1.ll -O0
	@opt tmp1.ll -S -o $@ -O0 -profile-generate

%.3.ll: %.2.ll
	@opt $^ -S -o $@ -O0 -load $(IR_PASS) -hotpath -hotpath-file=hotpath.txt

profile: $(FILES)
	@clang $(FILES) -O3 -fprofile-generate $(CC_FLAGS) $(LD_FLAGS)
	@make run
	@llvm-profdata merge -output=a.prof default*
	@clang $(FILES) -O3 -fprofile-use=a.prof $(CC_FLAGS) $(LD_FLAGS)
