FILES= jdmarker.c jchuff.c jdatadst.c rdppm.c jcphuff.c jdapimin.c jdcoefct.c rdbmp.c jccolor.c jdtrans.c jcparam.c loop-wrap.c jctrans.c jidctred.c jccoefct.c jutils.c rdrle.c rdswitch.c jcapistd.c jquant1.c jmemmgr.c jidctint.c jfdctint.c jdmaster.c jcapimin.c jdapistd.c jcmaster.c jfdctflt.c jmemansi.c rdgif.c jfdctfst.c jidctfst.c jdhuff.c jdinput.c jdatasrc.c cjpeg.c jdcolor.c jcsample.c jdpostct.c jcdctmgr.c jdphuff.c jdmainct.c jcinit.c jquant2.c jcmainct.c jddctmgr.c jerror.c jcomapi.c jdsample.c rdtarga.c jcmarker.c cdjpeg.c jdmerge.c jcprepct.c jidctflt.c
LL1= jdmarker.1.ll jchuff.1.ll jdatadst.1.ll rdppm.1.ll jcphuff.1.ll jdapimin.1.ll jdcoefct.1.ll rdbmp.1.ll jccolor.1.ll jdtrans.1.ll jcparam.1.ll loop-wrap.1.ll jctrans.1.ll jidctred.1.ll jccoefct.1.ll jutils.1.ll rdrle.1.ll rdswitch.1.ll jcapistd.1.ll jquant1.1.ll jmemmgr.1.ll jidctint.1.ll jfdctint.1.ll jdmaster.1.ll jcapimin.1.ll jdapistd.1.ll jcmaster.1.ll jfdctflt.1.ll jmemansi.1.ll rdgif.1.ll jfdctfst.1.ll jidctfst.1.ll jdhuff.1.ll jdinput.1.ll jdatasrc.1.ll cjpeg.1.ll jdcolor.1.ll jcsample.1.ll jdpostct.1.ll jcdctmgr.1.ll jdphuff.1.ll jdmainct.1.ll jcinit.1.ll jquant2.1.ll jcmainct.1.ll jddctmgr.1.ll jerror.1.ll jcomapi.1.ll jdsample.1.ll rdtarga.1.ll jcmarker.1.ll cdjpeg.1.ll jdmerge.1.ll jcprepct.1.ll jidctflt.1.ll
LL2= jdmarker.2.ll jchuff.2.ll jdatadst.2.ll rdppm.2.ll jcphuff.2.ll jdapimin.2.ll jdcoefct.2.ll rdbmp.2.ll jccolor.2.ll jdtrans.2.ll jcparam.2.ll loop-wrap.2.ll jctrans.2.ll jidctred.2.ll jccoefct.2.ll jutils.2.ll rdrle.2.ll rdswitch.2.ll jcapistd.2.ll jquant1.2.ll jmemmgr.2.ll jidctint.2.ll jfdctint.2.ll jdmaster.2.ll jcapimin.2.ll jdapistd.2.ll jcmaster.2.ll jfdctflt.2.ll jmemansi.2.ll rdgif.2.ll jfdctfst.2.ll jidctfst.2.ll jdhuff.2.ll jdinput.2.ll jdatasrc.2.ll cjpeg.2.ll jdcolor.2.ll jcsample.2.ll jdpostct.2.ll jcdctmgr.2.ll jdphuff.2.ll jdmainct.2.ll jcinit.2.ll jquant2.2.ll jcmainct.2.ll jddctmgr.2.ll jerror.2.ll jcomapi.2.ll jdsample.2.ll rdtarga.2.ll jcmarker.2.ll cdjpeg.2.ll jdmerge.2.ll jcprepct.2.ll jidctflt.2.ll
LL3= jdmarker.3.ll jchuff.3.ll jdatadst.3.ll rdppm.3.ll jcphuff.3.ll jdapimin.3.ll jdcoefct.3.ll rdbmp.3.ll jccolor.3.ll jdtrans.3.ll jcparam.3.ll loop-wrap.3.ll jctrans.3.ll jidctred.3.ll jccoefct.3.ll jutils.3.ll rdrle.3.ll rdswitch.3.ll jcapistd.3.ll jquant1.3.ll jmemmgr.3.ll jidctint.3.ll jfdctint.3.ll jdmaster.3.ll jcapimin.3.ll jdapistd.3.ll jcmaster.3.ll jfdctflt.3.ll jmemansi.3.ll rdgif.3.ll jfdctfst.3.ll jidctfst.3.ll jdhuff.3.ll jdinput.3.ll jdatasrc.3.ll cjpeg.3.ll jdcolor.3.ll jcsample.3.ll jdpostct.3.ll jcdctmgr.3.ll jdphuff.3.ll jdmainct.3.ll jcinit.3.ll jquant2.3.ll jcmainct.3.ll jddctmgr.3.ll jerror.3.ll jcomapi.3.ll jdsample.3.ll rdtarga.3.ll jcmarker.3.ll cdjpeg.3.ll jdmerge.3.ll jcprepct.3.ll jidctflt.3.ll
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
