<<<<<<< HEAD
FILES= parse.c layer12.c equalizer.c ucs4.c version.c frame.c audio_raw.c stream.c bit.c audio_oss.c synth.c compat.c utf8.c frametype.c huffman.c utf16.c audio.c version3.c audio_esd.c audio_cdda.c fixed.c audio_aiff.c madplay.c audio_wave.c crc.c debug.c audio_snd.c timer.c audio_null.c latin1.c decoder.c util.c render.c layer3.c filter.c file.c player.c xing.c field.c resample.c genre.c tag.c frame2.c
LL1= parse.1.ll layer12.1.ll equalizer.1.ll ucs4.1.ll version.1.ll frame.1.ll audio_raw.1.ll stream.1.ll bit.1.ll audio_oss.1.ll synth.1.ll compat.1.ll utf8.1.ll frametype.1.ll huffman.1.ll utf16.1.ll audio.1.ll version3.1.ll audio_esd.1.ll audio_cdda.1.ll fixed.1.ll audio_aiff.1.ll madplay.1.ll audio_wave.1.ll crc.1.ll debug.1.ll audio_snd.1.ll timer.1.ll audio_null.1.ll latin1.1.ll decoder.1.ll util.1.ll render.1.ll layer3.1.ll filter.1.ll file.1.ll player.1.ll xing.1.ll field.1.ll resample.1.ll genre.1.ll tag.1.ll frame2.1.ll
LL2= parse.2.ll layer12.2.ll equalizer.2.ll ucs4.2.ll version.2.ll frame.2.ll audio_raw.2.ll stream.2.ll bit.2.ll audio_oss.2.ll synth.2.ll compat.2.ll utf8.2.ll frametype.2.ll huffman.2.ll utf16.2.ll audio.2.ll version3.2.ll audio_esd.2.ll audio_cdda.2.ll fixed.2.ll audio_aiff.2.ll madplay.2.ll audio_wave.2.ll crc.2.ll debug.2.ll audio_snd.2.ll timer.2.ll audio_null.2.ll latin1.2.ll decoder.2.ll util.2.ll render.2.ll layer3.2.ll filter.2.ll file.2.ll player.2.ll xing.2.ll field.2.ll resample.2.ll genre.2.ll tag.2.ll frame2.2.ll
LL3= parse.3.ll layer12.3.ll equalizer.3.ll ucs4.3.ll version.3.ll frame.3.ll audio_raw.3.ll stream.3.ll bit.3.ll audio_oss.3.ll synth.3.ll compat.3.ll utf8.3.ll frametype.3.ll huffman.3.ll utf16.3.ll audio.3.ll version3.3.ll audio_esd.3.ll audio_cdda.3.ll fixed.3.ll audio_aiff.3.ll madplay.3.ll audio_wave.3.ll crc.3.ll debug.3.ll audio_snd.3.ll timer.3.ll audio_null.3.ll latin1.3.ll decoder.3.ll util.3.ll render.3.ll layer3.3.ll filter.3.ll file.3.ll player.3.ll xing.3.ll field.3.ll resample.3.ll genre.3.ll tag.3.ll frame2.3.ll
=======
FILES= render.c frame.c audio.c ucs4.c layer12.c resample.c stream.c filter.c huffman.c file.c utf8.c tag.c audio_oss.c equalizer.c frametype.c fixed.c debug.c genre.c audio_wave.c player.c utf16.c layer3.c bit.c field.c util.c audio_null.c latin1.c version3.c synth.c audio_esd.c compat.c decoder.c madplay.c timer.c xing.c audio_snd.c frame2.c audio_raw.c audio_cdda.c audio_aiff.c parse.c version.c crc.c
LL1= render.1.ll frame.1.ll audio.1.ll ucs4.1.ll layer12.1.ll resample.1.ll stream.1.ll filter.1.ll huffman.1.ll file.1.ll utf8.1.ll tag.1.ll audio_oss.1.ll equalizer.1.ll frametype.1.ll fixed.1.ll debug.1.ll genre.1.ll audio_wave.1.ll player.1.ll utf16.1.ll layer3.1.ll bit.1.ll field.1.ll util.1.ll audio_null.1.ll latin1.1.ll version3.1.ll synth.1.ll audio_esd.1.ll compat.1.ll decoder.1.ll madplay.1.ll timer.1.ll xing.1.ll audio_snd.1.ll frame2.1.ll audio_raw.1.ll audio_cdda.1.ll audio_aiff.1.ll parse.1.ll version.1.ll crc.1.ll
LL2= render.2.ll frame.2.ll audio.2.ll ucs4.2.ll layer12.2.ll resample.2.ll stream.2.ll filter.2.ll huffman.2.ll file.2.ll utf8.2.ll tag.2.ll audio_oss.2.ll equalizer.2.ll frametype.2.ll fixed.2.ll debug.2.ll genre.2.ll audio_wave.2.ll player.2.ll utf16.2.ll layer3.2.ll bit.2.ll field.2.ll util.2.ll audio_null.2.ll latin1.2.ll version3.2.ll synth.2.ll audio_esd.2.ll compat.2.ll decoder.2.ll madplay.2.ll timer.2.ll xing.2.ll audio_snd.2.ll frame2.2.ll audio_raw.2.ll audio_cdda.2.ll audio_aiff.2.ll parse.2.ll version.2.ll crc.2.ll
LL3= render.3.ll frame.3.ll audio.3.ll ucs4.3.ll layer12.3.ll resample.3.ll stream.3.ll filter.3.ll huffman.3.ll file.3.ll utf8.3.ll tag.3.ll audio_oss.3.ll equalizer.3.ll frametype.3.ll fixed.3.ll debug.3.ll genre.3.ll audio_wave.3.ll player.3.ll utf16.3.ll layer3.3.ll bit.3.ll field.3.ll util.3.ll audio_null.3.ll latin1.3.ll version3.3.ll synth.3.ll audio_esd.3.ll compat.3.ll decoder.3.ll madplay.3.ll timer.3.ll xing.3.ll audio_snd.3.ll frame2.3.ll audio_raw.3.ll audio_cdda.3.ll audio_aiff.3.ll parse.3.ll version.3.ll crc.3.ll
>>>>>>> 6f701e38f661d4dfa548b57c00f6048e8fec418f
CC_FLAGS=-I. -DFPM_DEFAULT -DHAVE_CONFIG_H -DLOCALEDIR=\"/usr/local/share/locale\" 
LD_FLAGS=-lm -lz -lesd 

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
