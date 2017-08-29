FILES= gsm_option.c gsm_destroy.c gsm_create.c toast_ulaw.c gsm_decode.c gsm_encode.c gsm_explode.c preprocess.c toast.c debug.c code.c rpe.c gsm_print.c short_term.c add.c toast_alaw.c lpc.c decode.c toast_audio.c loop-wrap.c long_term.c table.c gsm_implode.c toast_lin.c
LL1= gsm_option.1.ll gsm_destroy.1.ll gsm_create.1.ll toast_ulaw.1.ll gsm_decode.1.ll gsm_encode.1.ll gsm_explode.1.ll preprocess.1.ll toast.1.ll debug.1.ll code.1.ll rpe.1.ll gsm_print.1.ll short_term.1.ll add.1.ll toast_alaw.1.ll lpc.1.ll decode.1.ll toast_audio.1.ll loop-wrap.1.ll long_term.1.ll table.1.ll gsm_implode.1.ll toast_lin.1.ll
LL2= gsm_option.2.ll gsm_destroy.2.ll gsm_create.2.ll toast_ulaw.2.ll gsm_decode.2.ll gsm_encode.2.ll gsm_explode.2.ll preprocess.2.ll toast.2.ll debug.2.ll code.2.ll rpe.2.ll gsm_print.2.ll short_term.2.ll add.2.ll toast_alaw.2.ll lpc.2.ll decode.2.ll toast_audio.2.ll loop-wrap.2.ll long_term.2.ll table.2.ll gsm_implode.2.ll toast_lin.2.ll
LL3= gsm_option.3.ll gsm_destroy.3.ll gsm_create.3.ll toast_ulaw.3.ll gsm_decode.3.ll gsm_encode.3.ll gsm_explode.3.ll preprocess.3.ll toast.3.ll debug.3.ll code.3.ll rpe.3.ll gsm_print.3.ll short_term.3.ll add.3.ll toast_alaw.3.ll lpc.3.ll decode.3.ll toast_audio.3.ll loop-wrap.3.ll long_term.3.ll table.3.ll gsm_implode.3.ll toast_lin.3.ll
CC_FLAGS=-DSASR -DSTUPID_COMPILER -DNeedFunctionPrototypes=1 
LD_FLAGS=-lm 

all: 
	@$(RM) IRinfo.txt *.profraw
	@make ll1 -s
	@clang $(LL1) -O0 $(LD_FLAGS) -o a.out
	@$(RM) *.ll
	
run:
	@./__run 1
	
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
