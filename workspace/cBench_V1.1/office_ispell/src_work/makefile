FILES= ispell.c tgood.c defmt.c lookup.c term.c hash.c xgets.c tree.c dump.c makedent.c good.c correct.c
LL1= ispell.1.ll tgood.1.ll defmt.1.ll lookup.1.ll term.1.ll hash.1.ll xgets.1.ll tree.1.ll dump.1.ll makedent.1.ll good.1.ll correct.1.ll
LL2= ispell.2.ll tgood.2.ll defmt.2.ll lookup.2.ll term.2.ll hash.2.ll xgets.2.ll tree.2.ll dump.2.ll makedent.2.ll good.2.ll correct.2.ll
LL3= ispell.3.ll tgood.3.ll defmt.3.ll lookup.3.ll term.3.ll hash.3.ll xgets.3.ll tree.3.ll dump.3.ll makedent.3.ll good.3.ll correct.3.ll
CC_FLAGS=
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
