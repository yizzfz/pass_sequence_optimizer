FILES= render.c frame.c audio.c ucs4.c layer12.c resample.c stream.c filter.c huffman.c file.c utf8.c tag.c audio_oss.c equalizer.c frametype.c fixed.c debug.c genre.c audio_wave.c player.c utf16.c layer3.c bit.c field.c util.c audio_null.c latin1.c version3.c synth.c audio_esd.c compat.c decoder.c madplay.c timer.c xing.c audio_snd.c frame2.c audio_raw.c audio_cdda.c audio_aiff.c parse.c version.c crc.c
OBJs= render.o frame.o audio.o ucs4.o layer12.o resample.o stream.o filter.o huffman.o file.o utf8.o tag.o audio_oss.o equalizer.o frametype.o fixed.o debug.o genre.o audio_wave.o player.o utf16.o layer3.o bit.o field.o util.o audio_null.o latin1.o version3.o synth.o audio_esd.o compat.o decoder.o madplay.o timer.o xing.o audio_snd.o frame2.o audio_raw.o audio_cdda.o audio_aiff.o parse.o version.o crc.o
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
