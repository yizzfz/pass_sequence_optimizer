FILES= tif_flush.c tiffmedian.c tif_lzw.c tif_zip.c tif_dirwrite.c tif_write.c tif_predict.c tif_dirread.c tif_open.c tif_luv.c tif_dirinfo.c tif_jpeg.c tif_error.c tif_packbits.c tif_unix.c tif_fax3.c tif_tile.c tif_print.c tif_dumpmode.c tif_swab.c tif_warning.c tif_version.c loop-wrap.c tif_compress.c tif_dir.c tif_pixarlog.c tif_close.c tif_read.c tif_strip.c tif_codec.c tif_fax3sm.c tif_thunder.c tif_getimage.c tif_next.c tif_aux.c
LL1= tif_flush.1.ll tiffmedian.1.ll tif_lzw.1.ll tif_zip.1.ll tif_dirwrite.1.ll tif_write.1.ll tif_predict.1.ll tif_dirread.1.ll tif_open.1.ll tif_luv.1.ll tif_dirinfo.1.ll tif_jpeg.1.ll tif_error.1.ll tif_packbits.1.ll tif_unix.1.ll tif_fax3.1.ll tif_tile.1.ll tif_print.1.ll tif_dumpmode.1.ll tif_swab.1.ll tif_warning.1.ll tif_version.1.ll loop-wrap.1.ll tif_compress.1.ll tif_dir.1.ll tif_pixarlog.1.ll tif_close.1.ll tif_read.1.ll tif_strip.1.ll tif_codec.1.ll tif_fax3sm.1.ll tif_thunder.1.ll tif_getimage.1.ll tif_next.1.ll tif_aux.1.ll
LL2= tif_flush.2.ll tiffmedian.2.ll tif_lzw.2.ll tif_zip.2.ll tif_dirwrite.2.ll tif_write.2.ll tif_predict.2.ll tif_dirread.2.ll tif_open.2.ll tif_luv.2.ll tif_dirinfo.2.ll tif_jpeg.2.ll tif_error.2.ll tif_packbits.2.ll tif_unix.2.ll tif_fax3.2.ll tif_tile.2.ll tif_print.2.ll tif_dumpmode.2.ll tif_swab.2.ll tif_warning.2.ll tif_version.2.ll loop-wrap.2.ll tif_compress.2.ll tif_dir.2.ll tif_pixarlog.2.ll tif_close.2.ll tif_read.2.ll tif_strip.2.ll tif_codec.2.ll tif_fax3sm.2.ll tif_thunder.2.ll tif_getimage.2.ll tif_next.2.ll tif_aux.2.ll
LL3= tif_flush.3.ll tiffmedian.3.ll tif_lzw.3.ll tif_zip.3.ll tif_dirwrite.3.ll tif_write.3.ll tif_predict.3.ll tif_dirread.3.ll tif_open.3.ll tif_luv.3.ll tif_dirinfo.3.ll tif_jpeg.3.ll tif_error.3.ll tif_packbits.3.ll tif_unix.3.ll tif_fax3.3.ll tif_tile.3.ll tif_print.3.ll tif_dumpmode.3.ll tif_swab.3.ll tif_warning.3.ll tif_version.3.ll loop-wrap.3.ll tif_compress.3.ll tif_dir.3.ll tif_pixarlog.3.ll tif_close.3.ll tif_read.3.ll tif_strip.3.ll tif_codec.3.ll tif_fax3sm.3.ll tif_thunder.3.ll tif_getimage.3.ll tif_next.3.ll tif_aux.3.ll
CC_FLAGS=
LD_FLAGS=-lm 
WORKLOAD=1 360

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
