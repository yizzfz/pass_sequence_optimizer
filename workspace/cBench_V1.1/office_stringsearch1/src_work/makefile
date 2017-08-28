<<<<<<< HEAD
FILES= pbmsrch_large.c bmhasrch.c bmhsrch.c bmhisrch.c
LL1= pbmsrch_large.1.ll bmhasrch.1.ll bmhsrch.1.ll bmhisrch.1.ll
LL2= pbmsrch_large.2.ll bmhasrch.2.ll bmhsrch.2.ll bmhisrch.2.ll
LL3= pbmsrch_large.3.ll bmhasrch.3.ll bmhsrch.3.ll bmhisrch.3.ll
=======
FILES= bmhisrch.c bmhsrch.c bmhasrch.c pbmsrch_large.c
LL1= bmhisrch.1.ll bmhsrch.1.ll bmhasrch.1.ll pbmsrch_large.1.ll
LL2= bmhisrch.2.ll bmhsrch.2.ll bmhasrch.2.ll pbmsrch_large.2.ll
LL3= bmhisrch.3.ll bmhsrch.3.ll bmhasrch.3.ll pbmsrch_large.3.ll
>>>>>>> 6f701e38f661d4dfa548b57c00f6048e8fec418f
CC_FLAGS=-DUNIX -DPORTABLE 
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
