FILES= mainmpglib.c ieeefloat.c interface.c dct64_i386.c get_audio.c quantize-pvt.c quantize.c common.c brhist.c id3tag.c decode_i386.c layer3.c l3bitstream.c reservoir.c formatBitstream.c main.c takehiro.c VbrTag.c gpkplotting.c portableio.c rtp.c tables.c amiga_mpega.c vbrquantize.c gtkanal.c loop-wrap.c tabinit.c psymodel.c timestatus.c util.c parse.c version.c lame.c newmdct.c fft.c
LL1= mainmpglib.1.ll ieeefloat.1.ll interface.1.ll dct64_i386.1.ll get_audio.1.ll quantize-pvt.1.ll quantize.1.ll common.1.ll brhist.1.ll id3tag.1.ll decode_i386.1.ll layer3.1.ll l3bitstream.1.ll reservoir.1.ll formatBitstream.1.ll main.1.ll takehiro.1.ll VbrTag.1.ll gpkplotting.1.ll portableio.1.ll rtp.1.ll tables.1.ll amiga_mpega.1.ll vbrquantize.1.ll gtkanal.1.ll loop-wrap.1.ll tabinit.1.ll psymodel.1.ll timestatus.1.ll util.1.ll parse.1.ll version.1.ll lame.1.ll newmdct.1.ll fft.1.ll
LL2= mainmpglib.2.ll ieeefloat.2.ll interface.2.ll dct64_i386.2.ll get_audio.2.ll quantize-pvt.2.ll quantize.2.ll common.2.ll brhist.2.ll id3tag.2.ll decode_i386.2.ll layer3.2.ll l3bitstream.2.ll reservoir.2.ll formatBitstream.2.ll main.2.ll takehiro.2.ll VbrTag.2.ll gpkplotting.2.ll portableio.2.ll rtp.2.ll tables.2.ll amiga_mpega.2.ll vbrquantize.2.ll gtkanal.2.ll loop-wrap.2.ll tabinit.2.ll psymodel.2.ll timestatus.2.ll util.2.ll parse.2.ll version.2.ll lame.2.ll newmdct.2.ll fft.2.ll
LL3= mainmpglib.3.ll ieeefloat.3.ll interface.3.ll dct64_i386.3.ll get_audio.3.ll quantize-pvt.3.ll quantize.3.ll common.3.ll brhist.3.ll id3tag.3.ll decode_i386.3.ll layer3.3.ll l3bitstream.3.ll reservoir.3.ll formatBitstream.3.ll main.3.ll takehiro.3.ll VbrTag.3.ll gpkplotting.3.ll portableio.3.ll rtp.3.ll tables.3.ll amiga_mpega.3.ll vbrquantize.3.ll gtkanal.3.ll loop-wrap.3.ll tabinit.3.ll psymodel.3.ll timestatus.3.ll util.3.ll parse.3.ll version.3.ll lame.3.ll newmdct.3.ll fft.3.ll
CC_FLAGS=-DLAMESNDFILE -DHAVEMPGLIB -DLAMEPARSE 
LD_FLAGS=-lm 
WORKLOAD=1 80

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
