FILES= darray.c elements.c l2u.c linuxplay.c dict.c def_pars.c holmes.c nsynth.c say.c phtoelm.c ASCII.c aufile.c english.c saynum.c text.c Revision.c trie.c getarg.c phones.c
LL1= darray.1.ll elements.1.ll l2u.1.ll linuxplay.1.ll dict.1.ll def_pars.1.ll holmes.1.ll nsynth.1.ll say.1.ll phtoelm.1.ll ASCII.1.ll aufile.1.ll english.1.ll saynum.1.ll text.1.ll Revision.1.ll trie.1.ll getarg.1.ll phones.1.ll
LL2= darray.2.ll elements.2.ll l2u.2.ll linuxplay.2.ll dict.2.ll def_pars.2.ll holmes.2.ll nsynth.2.ll say.2.ll phtoelm.2.ll ASCII.2.ll aufile.2.ll english.2.ll saynum.2.ll text.2.ll Revision.2.ll trie.2.ll getarg.2.ll phones.2.ll
LL3= darray.3.ll elements.3.ll l2u.3.ll linuxplay.3.ll dict.3.ll def_pars.3.ll holmes.3.ll nsynth.3.ll say.3.ll phtoelm.3.ll ASCII.3.ll aufile.3.ll english.3.ll saynum.3.ll text.3.ll Revision.3.ll trie.3.ll getarg.3.ll phones.3.ll
CC_FLAGS=-I./ 
LD_FLAGS=-lm 
WORKLOAD=1

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
