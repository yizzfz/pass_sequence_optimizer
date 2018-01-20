FILES= system.c genprime.c rsagen.c md5.c mdfile.c armor.c randpool.c getopt.c zdeflate.c keyadd.c pgp.c idea.c charset.c zbits.c crypto.c language.c mpw32asm.c config.c zunzip.c keymaint.c sleep.c passwd.c ztrees.c zfile_io.c random.c gettime.c strtol.c zinflate.c noise.c zip.c zglobals.c zipup.c rsaglue1.c keymgmt.c mpiio.c mpilib.c more.c fileio.c memmove.c
LL1= system.1.ll genprime.1.ll rsagen.1.ll md5.1.ll mdfile.1.ll armor.1.ll randpool.1.ll getopt.1.ll zdeflate.1.ll keyadd.1.ll pgp.1.ll idea.1.ll charset.1.ll zbits.1.ll crypto.1.ll language.1.ll mpw32asm.1.ll config.1.ll zunzip.1.ll keymaint.1.ll sleep.1.ll passwd.1.ll ztrees.1.ll zfile_io.1.ll random.1.ll gettime.1.ll strtol.1.ll zinflate.1.ll noise.1.ll zip.1.ll zglobals.1.ll zipup.1.ll rsaglue1.1.ll keymgmt.1.ll mpiio.1.ll mpilib.1.ll more.1.ll fileio.1.ll memmove.1.ll
LL2= system.2.ll genprime.2.ll rsagen.2.ll md5.2.ll mdfile.2.ll armor.2.ll randpool.2.ll getopt.2.ll zdeflate.2.ll keyadd.2.ll pgp.2.ll idea.2.ll charset.2.ll zbits.2.ll crypto.2.ll language.2.ll mpw32asm.2.ll config.2.ll zunzip.2.ll keymaint.2.ll sleep.2.ll passwd.2.ll ztrees.2.ll zfile_io.2.ll random.2.ll gettime.2.ll strtol.2.ll zinflate.2.ll noise.2.ll zip.2.ll zglobals.2.ll zipup.2.ll rsaglue1.2.ll keymgmt.2.ll mpiio.2.ll mpilib.2.ll more.2.ll fileio.2.ll memmove.2.ll
LL3= system.3.ll genprime.3.ll rsagen.3.ll md5.3.ll mdfile.3.ll armor.3.ll randpool.3.ll getopt.3.ll zdeflate.3.ll keyadd.3.ll pgp.3.ll idea.3.ll charset.3.ll zbits.3.ll crypto.3.ll language.3.ll mpw32asm.3.ll config.3.ll zunzip.3.ll keymaint.3.ll sleep.3.ll passwd.3.ll ztrees.3.ll zfile_io.3.ll random.3.ll gettime.3.ll strtol.3.ll zinflate.3.ll noise.3.ll zip.3.ll zglobals.3.ll zipup.3.ll rsaglue1.3.ll keymgmt.3.ll mpiio.3.ll mpilib.3.ll more.3.ll fileio.3.ll memmove.3.ll
CC_FLAGS=-DUNIX -DPORTABLE 
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
