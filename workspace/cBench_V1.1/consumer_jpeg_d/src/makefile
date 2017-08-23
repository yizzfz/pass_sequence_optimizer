FILES= djpeg.c jdtrans.c wrtarga.c jcomapi.c jfdctfst.c wrgif.c jdpostct.c jdinput.c jidctflt.c jdhuff.c jcapistd.c jdcolor.c jcparam.c jerror.c jdapimin.c jmemansi.c jidctint.c wrppm.c jquant2.c jdmainct.c jdapistd.c jccolor.c jidctfst.c jfdctint.c jdmarker.c jdsample.c jutils.c jcmainct.c jcdctmgr.c jidctred.c jdmerge.c wrrle.c jmemmgr.c jquant1.c rdcolmap.c jcapimin.c jcmarker.c loop-wrap.c jdmaster.c jcmaster.c jcprepct.c jdatasrc.c jfdctflt.c jdphuff.c cdjpeg.c jdatadst.c wrbmp.c jdcoefct.c jddctmgr.c jctrans.c jcphuff.c jcsample.c jcinit.c jchuff.c jccoefct.c
OBJs= djpeg.o jdtrans.o wrtarga.o jcomapi.o jfdctfst.o wrgif.o jdpostct.o jdinput.o jidctflt.o jdhuff.o jcapistd.o jdcolor.o jcparam.o jerror.o jdapimin.o jmemansi.o jidctint.o wrppm.o jquant2.o jdmainct.o jdapistd.o jccolor.o jidctfst.o jfdctint.o jdmarker.o jdsample.o jutils.o jcmainct.o jcdctmgr.o jidctred.o jdmerge.o wrrle.o jmemmgr.o jquant1.o rdcolmap.o jcapimin.o jcmarker.o loop-wrap.o jdmaster.o jcmaster.o jcprepct.o jdatasrc.o jfdctflt.o jdphuff.o cdjpeg.o jdatadst.o wrbmp.o jdcoefct.o jddctmgr.o jctrans.o jcphuff.o jcsample.o jcinit.o jchuff.o jccoefct.o
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
