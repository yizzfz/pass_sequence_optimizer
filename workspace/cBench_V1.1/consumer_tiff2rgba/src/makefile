FILES= tif_tile.c tif_dumpmode.c tif_read.c tif_write.c tif_open.c tif_fax3.c tif_error.c tif_dirread.c tif_dirwrite.c tif_lzw.c tif_flush.c tif_print.c tiff2rgba.c tif_version.c tif_codec.c tif_compress.c tif_dirinfo.c tif_strip.c tif_aux.c tif_warning.c tif_unix.c tif_swab.c loop-wrap.c tif_luv.c tif_predict.c tif_thunder.c tif_fax3sm.c tif_pixarlog.c tif_zip.c tif_jpeg.c tif_getimage.c tif_dir.c tif_next.c tif_close.c tif_packbits.c
OBJs= tif_tile.o tif_dumpmode.o tif_read.o tif_write.o tif_open.o tif_fax3.o tif_error.o tif_dirread.o tif_dirwrite.o tif_lzw.o tif_flush.o tif_print.o tiff2rgba.o tif_version.o tif_codec.o tif_compress.o tif_dirinfo.o tif_strip.o tif_aux.o tif_warning.o tif_unix.o tif_swab.o loop-wrap.o tif_luv.o tif_predict.o tif_thunder.o tif_fax3sm.o tif_pixarlog.o tif_zip.o tif_jpeg.o tif_getimage.o tif_dir.o tif_next.o tif_close.o tif_packbits.o
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
