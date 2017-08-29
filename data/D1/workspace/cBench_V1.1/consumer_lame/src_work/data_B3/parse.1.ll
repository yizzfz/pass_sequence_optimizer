; ModuleID = 'parse.ll'
source_filename = "parse.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ID3TAGDATA = type { i32, i32, [31 x i8], [31 x i8], [31 x i8], [5 x i8], [31 x i8], [128 x i8], [1 x i8], i8 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [44 x i8] c"USAGE   :  %s [options] <infile> [outfile]\0A\00", align 1
@.str.2 = private unnamed_addr constant [66 x i8] c"\0A<infile> and/or <outfile> can be \22-\22, which means stdin/stdout.\0A\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"Try \22%s --help\22 for more information\0A\00", align 1
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [11 x i8] c"OPTIONS :\0A\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"  Input options:\0A\00", align 1
@.str.6 = private unnamed_addr constant [38 x i8] c"    -r              input is raw pcm\0A\00", align 1
@.str.7 = private unnamed_addr constant [50 x i8] c"    -x              force byte-swapping of input\0A\00", align 1
@.str.8 = private unnamed_addr constant [77 x i8] c"    -s sfreq        sampling frequency of input file(kHz) - default 44.1kHz\0A\00", align 1
@.str.9 = private unnamed_addr constant [46 x i8] c"    --mp3input      input file is a MP3 file\0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"  Filter options:\0A\00", align 1
@.str.11 = private unnamed_addr constant [65 x i8] c"    -k              keep ALL frequencies (disables all filters)\0A\00", align 1
@.str.12 = private unnamed_addr constant [75 x i8] c"  --lowpass freq         frequency(kHz), lowpass filter cutoff above freq\0A\00", align 1
@.str.13 = private unnamed_addr constant [72 x i8] c"  --lowpass-width freq   frequency(kHz) - default 15%% of lowpass freq\0A\00", align 1
@.str.14 = private unnamed_addr constant [76 x i8] c"  --highpass freq        frequency(kHz), highpass filter cutoff below freq\0A\00", align 1
@.str.15 = private unnamed_addr constant [73 x i8] c"  --highpass-width freq  frequency(kHz) - default 15%% of highpass freq\0A\00", align 1
@.str.16 = private unnamed_addr constant [81 x i8] c"  --resample sfreq  sampling frequency of output file(kHz)- default=input sfreq\0A\00", align 1
@.str.17 = private unnamed_addr constant [73 x i8] c"  --cwlimit freq    compute tonality up to freq (in kHz) default 8.8717\0A\00", align 1
@.str.18 = private unnamed_addr constant [24 x i8] c"  Operational options:\0A\00", align 1
@.str.19 = private unnamed_addr constant [71 x i8] c"    -m mode         (s)tereo, (j)oint, (f)orce or (m)ono  (default j)\0A\00", align 1
@.str.20 = private unnamed_addr constant [67 x i8] c"                    force = force ms_stereo on all frames. Faster\0A\00", align 1
@.str.21 = private unnamed_addr constant [72 x i8] c"    -a              downmix from stereo to mono file for mono encoding\0A\00", align 1
@.str.22 = private unnamed_addr constant [65 x i8] c"    -d              allow channels to have different blocktypes\0A\00", align 1
@.str.23 = private unnamed_addr constant [65 x i8] c"    -S              don't print progress report, VBR histograms\0A\00", align 1
@.str.24 = private unnamed_addr constant [50 x i8] c"    --athonly       only use the ATH for masking\0A\00", align 1
@.str.25 = private unnamed_addr constant [49 x i8] c"    --noath         disable the ATH for masking\0A\00", align 1
@.str.26 = private unnamed_addr constant [45 x i8] c"    --noshort       do not use short blocks\0A\00", align 1
@.str.27 = private unnamed_addr constant [45 x i8] c"    --voice         experimental voice mode\0A\00", align 1
@.str.28 = private unnamed_addr constant [77 x i8] c"    --preset type   type must be phone, voice, fm, tape, hifi, cd or studio\0A\00", align 1
@.str.29 = private unnamed_addr constant [57 x i8] c"                    help gives some more infos on these\0A\00", align 1
@.str.30 = private unnamed_addr constant [48 x i8] c"  CBR (constant bitrate, the default) options:\0A\00", align 1
@.str.31 = private unnamed_addr constant [72 x i8] c"    -h              higher quality, but a little slower.  Recommended.\0A\00", align 1
@.str.32 = private unnamed_addr constant [50 x i8] c"    -f              fast mode (very low quality)\0A\00", align 1
@.str.33 = private unnamed_addr constant [54 x i8] c"    -b bitrate      set the bitrate, default 128kbps\0A\00", align 1
@.str.34 = private unnamed_addr constant [16 x i8] c"  VBR options:\0A\00", align 1
@.str.35 = private unnamed_addr constant [48 x i8] c"    -v              use variable bitrate (VBR)\0A\00", align 1
@.str.36 = private unnamed_addr constant [60 x i8] c"    -V n            quality setting for VBR.  default n=%i\0A\00", align 1
@.str.37 = private unnamed_addr constant [66 x i8] c"                    0=high quality,bigger files. 9=smaller files\0A\00", align 1
@.str.38 = private unnamed_addr constant [68 x i8] c"    -b bitrate      specify minimum allowed bitrate, default 32kbs\0A\00", align 1
@.str.39 = private unnamed_addr constant [69 x i8] c"    -B bitrate      specify maximum allowed bitrate, default 256kbs\0A\00", align 1
@.str.40 = private unnamed_addr constant [56 x i8] c"    -t              disable Xing VBR informational tag\0A\00", align 1
@.str.41 = private unnamed_addr constant [51 x i8] c"    --nohist        disable VBR histogram display\0A\00", align 1
@.str.42 = private unnamed_addr constant [30 x i8] c"  MP3 header/stream options:\0A\00", align 1
@.str.43 = private unnamed_addr constant [51 x i8] c"    -e emp          de-emphasis n/5/c  (obsolete)\0A\00", align 1
@.str.44 = private unnamed_addr constant [39 x i8] c"    -c              mark as copyright\0A\00", align 1
@.str.45 = private unnamed_addr constant [42 x i8] c"    -o              mark as non-original\0A\00", align 1
@.str.46 = private unnamed_addr constant [75 x i8] c"    -p              error protection.  adds 16bit checksum to every frame\0A\00", align 1
@.str.47 = private unnamed_addr constant [58 x i8] c"                    (the checksum is computed correctly)\0A\00", align 1
@.str.48 = private unnamed_addr constant [47 x i8] c"    --nores         disable the bit reservoir\0A\00", align 1
@.str.49 = private unnamed_addr constant [64 x i8] c"  Specifying any of the following options will add an ID3 tag:\0A\00", align 1
@.str.50 = private unnamed_addr constant [52 x i8] c"     --tt \22title\22     title of song (max 30 chars)\0A\00", align 1
@.str.51 = private unnamed_addr constant [62 x i8] c"     --ta \22artist\22    artist who did the song (max 30 chars)\0A\00", align 1
@.str.52 = private unnamed_addr constant [63 x i8] c"     --tl \22album\22     album where it came from (max 30 chars)\0A\00", align 1
@.str.53 = private unnamed_addr constant [75 x i8] c"     --ty \22year\22      year in which the song/album was made (max 4 chars)\0A\00", align 1
@.str.54 = private unnamed_addr constant [54 x i8] c"     --tc \22comment\22   additional info (max 30 chars)\0A\00", align 1
@.str.55 = private unnamed_addr constant [69 x i8] c"                      (or max 28 chars if using the \22track\22 option)\0A\00", align 1
@.str.56 = private unnamed_addr constant [68 x i8] c"     --tn \22track\22     track number of the song on the CD (1 to 99)\0A\00", align 1
@.str.57 = private unnamed_addr constant [67 x i8] c"                      (using this option will add an ID3v1.1 tag)\0A\00", align 1
@.str.58 = private unnamed_addr constant [54 x i8] c"     --tg \22genre\22     genre of song (name or number)\0A\00", align 1
@.str.59 = private unnamed_addr constant [49 x i8] c"Presets are some shortcuts for common settings.\0A\00", align 1
@.str.60 = private unnamed_addr constant [52 x i8] c"They can be combined with -v if you want VBR MP3s.\0A\00", align 1
@.str.61 = private unnamed_addr constant [44 x i8] c"  --preset phone    =>  --resample      16\0A\00", align 1
@.str.62 = private unnamed_addr constant [48 x i8] c"                        --highpass       0.260\0A\00", align 1
@.str.63 = private unnamed_addr constant [48 x i8] c"                        --highpasswidth  0.040\0A\00", align 1
@.str.64 = private unnamed_addr constant [48 x i8] c"                        --lowpass        3.700\0A\00", align 1
@.str.65 = private unnamed_addr constant [48 x i8] c"                        --lowpasswidth   0.300\0A\00", align 1
@.str.66 = private unnamed_addr constant [35 x i8] c"                        --noshort\0A\00", align 1
@.str.67 = private unnamed_addr constant [32 x i8] c"                        -m   m\0A\00", align 1
@.str.68 = private unnamed_addr constant [32 x i8] c"                        -b  16\0A\00", align 1
@.str.69 = private unnamed_addr constant [35 x i8] c"                  plus  -b   8  \5C\0A\00", align 1
@.str.70 = private unnamed_addr constant [59 x i8] c"                        -B  56   > in combination with -v\0A\00", align 1
@.str.71 = private unnamed_addr constant [35 x i8] c"                        -V   5  /\0A\00", align 1
@.str.72 = private unnamed_addr constant [44 x i8] c"  --preset voice:   =>  --resample      24\0A\00", align 1
@.str.73 = private unnamed_addr constant [48 x i8] c"                        --highpass       0.100\0A\00", align 1
@.str.74 = private unnamed_addr constant [48 x i8] c"                        --highpasswidth  0.020\0A\00", align 1
@.str.75 = private unnamed_addr constant [44 x i8] c"                        --lowpass       11\0A\00", align 1
@.str.76 = private unnamed_addr constant [44 x i8] c"                        --lowpasswidth   2\0A\00", align 1
@.str.77 = private unnamed_addr constant [32 x i8] c"                        -b  32\0A\00", align 1
@.str.78 = private unnamed_addr constant [59 x i8] c"                        -B  96   > in combination with -v\0A\00", align 1
@.str.79 = private unnamed_addr constant [35 x i8] c"                        -V   4  /\0A\00", align 1
@.str.80 = private unnamed_addr constant [44 x i8] c"  --preset fm:      =>  --resample      32\0A\00", align 1
@.str.81 = private unnamed_addr constant [48 x i8] c"                        --highpass       0.030\0A\00", align 1
@.str.82 = private unnamed_addr constant [44 x i8] c"                        --highpasswidth  0\0A\00", align 1
@.str.83 = private unnamed_addr constant [46 x i8] c"                        --lowpass       11.4\0A\00", align 1
@.str.84 = private unnamed_addr constant [44 x i8] c"                        --lowpasswidth   0\0A\00", align 1
@.str.85 = private unnamed_addr constant [32 x i8] c"                        -m   j\0A\00", align 1
@.str.86 = private unnamed_addr constant [32 x i8] c"                        -b  96\0A\00", align 1
@.str.87 = private unnamed_addr constant [35 x i8] c"                  plus  -b  32  \5C\0A\00", align 1
@.str.88 = private unnamed_addr constant [59 x i8] c"                        -B 192   > in combination with -v\0A\00", align 1
@.str.89 = private unnamed_addr constant [44 x i8] c"  --preset tape:    =>  --lowpass       17\0A\00", align 1
@.str.90 = private unnamed_addr constant [48 x i8] c"                        --highpass       0.015\0A\00", align 1
@.str.91 = private unnamed_addr constant [48 x i8] c"                        --highpasswidth  0.015\0A\00", align 1
@.str.92 = private unnamed_addr constant [32 x i8] c"                        -b 128\0A\00", align 1
@.str.93 = private unnamed_addr constant [44 x i8] c"  --preset hifi:    =>  --lowpass       20\0A\00", align 1
@.str.94 = private unnamed_addr constant [44 x i8] c"                        --lowpasswidth   3\0A\00", align 1
@.str.95 = private unnamed_addr constant [28 x i8] c"                        -h\0A\00", align 1
@.str.96 = private unnamed_addr constant [32 x i8] c"                        -b 160\0A\00", align 1
@.str.97 = private unnamed_addr constant [59 x i8] c"                        -B 224   > in combination with -v\0A\00", align 1
@.str.98 = private unnamed_addr constant [35 x i8] c"                        -V   3  /\0A\00", align 1
@.str.99 = private unnamed_addr constant [28 x i8] c"  --preset cd:      =>  -k\0A\00", align 1
@.str.100 = private unnamed_addr constant [32 x i8] c"                        -m   s\0A\00", align 1
@.str.101 = private unnamed_addr constant [32 x i8] c"                        -b 192\0A\00", align 1
@.str.102 = private unnamed_addr constant [35 x i8] c"                  plus  -b  80  \5C\0A\00", align 1
@.str.103 = private unnamed_addr constant [59 x i8] c"                        -B 256   > in combination with -v\0A\00", align 1
@.str.104 = private unnamed_addr constant [35 x i8] c"                        -V   2  /\0A\00", align 1
@.str.105 = private unnamed_addr constant [28 x i8] c"  --preset studio:  =>  -k\0A\00", align 1
@.str.106 = private unnamed_addr constant [32 x i8] c"                        -b 256\0A\00", align 1
@.str.107 = private unnamed_addr constant [35 x i8] c"                  plus  -b 112  \5C\0A\00", align 1
@.str.108 = private unnamed_addr constant [59 x i8] c"                        -B 320   > in combination with -v\0A\00", align 1
@.str.109 = private unnamed_addr constant [35 x i8] c"                        -V   0  /\0A\00", align 1
@inPath = common global [300 x i8] zeroinitializer, align 16
@outPath = common global [300 x i8] zeroinitializer, align 16
@id3tag = external global %struct.ID3TAGDATA, align 4
@.str.110 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.111 = private unnamed_addr constant [9 x i8] c"resample\00", align 1
@.str.112 = private unnamed_addr constant [43 x i8] c"Must specify a samplerate with --resample\0A\00", align 1
@.str.113 = private unnamed_addr constant [9 x i8] c"mp3input\00", align 1
@.str.114 = private unnamed_addr constant [6 x i8] c"voice\00", align 1
@.str.115 = private unnamed_addr constant [8 x i8] c"noshort\00", align 1
@.str.116 = private unnamed_addr constant [6 x i8] c"noath\00", align 1
@.str.117 = private unnamed_addr constant [6 x i8] c"nores\00", align 1
@.str.118 = private unnamed_addr constant [8 x i8] c"athonly\00", align 1
@.str.119 = private unnamed_addr constant [7 x i8] c"nohist\00", align 1
@.str.120 = private unnamed_addr constant [3 x i8] c"tt\00", align 1
@.str.121 = private unnamed_addr constant [3 x i8] c"ta\00", align 1
@.str.122 = private unnamed_addr constant [3 x i8] c"tl\00", align 1
@.str.123 = private unnamed_addr constant [3 x i8] c"ty\00", align 1
@.str.124 = private unnamed_addr constant [3 x i8] c"tc\00", align 1
@.str.125 = private unnamed_addr constant [3 x i8] c"tn\00", align 1
@.str.126 = private unnamed_addr constant [3 x i8] c"tg\00", align 1
@genre_last = external local_unnamed_addr global i32, align 4
@genre_list = external local_unnamed_addr global [0 x i8*], align 8
@.str.127 = private unnamed_addr constant [44 x i8] c"Unknown genre: %s.  Specifiy genre number \0A\00", align 1
@.str.128 = private unnamed_addr constant [8 x i8] c"lowpass\00", align 1
@.str.129 = private unnamed_addr constant [61 x i8] c"Must specify lowpass with --lowpass freq, freq >= 0.001 kHz\0A\00", align 1
@.str.130 = private unnamed_addr constant [14 x i8] c"lowpass-width\00", align 1
@.str.131 = private unnamed_addr constant [69 x i8] c"Must specify lowpass width with --lowpass-width freq, freq >= 0 kHz\0A\00", align 1
@.str.132 = private unnamed_addr constant [9 x i8] c"highpass\00", align 1
@.str.133 = private unnamed_addr constant [63 x i8] c"Must specify highpass with --highpass freq, freq >= 0.001 kHz\0A\00", align 1
@.str.134 = private unnamed_addr constant [15 x i8] c"highpass-width\00", align 1
@.str.135 = private unnamed_addr constant [71 x i8] c"Must specify highpass width with --highpass-width freq, freq >= 0 kHz\0A\00", align 1
@.str.136 = private unnamed_addr constant [8 x i8] c"cwlimit\00", align 1
@.str.137 = private unnamed_addr constant [29 x i8] c"Must specify cwlimit in kHz\0A\00", align 1
@.str.138 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str.139 = private unnamed_addr constant [6 x i8] c"usage\00", align 1
@.str.140 = private unnamed_addr constant [7 x i8] c"preset\00", align 1
@.str.141 = private unnamed_addr constant [6 x i8] c"phone\00", align 1
@.str.142 = private unnamed_addr constant [3 x i8] c"fm\00", align 1
@.str.143 = private unnamed_addr constant [5 x i8] c"tape\00", align 1
@.str.144 = private unnamed_addr constant [5 x i8] c"hifi\00", align 1
@.str.145 = private unnamed_addr constant [3 x i8] c"cd\00", align 1
@.str.146 = private unnamed_addr constant [7 x i8] c"studio\00", align 1
@.str.147 = private unnamed_addr constant [84 x i8] c"%s: --preset type, type must be phone, voice, fm, tape, hifi, cd or studio, not %s\0A\00", align 1
@.str.148 = private unnamed_addr constant [23 x i8] c"%s: unrec option --%s\0A\00", align 1
@.str.149 = private unnamed_addr constant [38 x i8] c"%s: -m mode must be s/d/j/f/m not %s\0A\00", align 1
@.str.150 = private unnamed_addr constant [30 x i8] c"%s: -X n must be 0-6, not %s\0A\00", align 1
@.str.151 = private unnamed_addr constant [55 x i8] c"LAME not compiled with GTK support, -g not supported.\0A\00", align 1
@.str.152 = private unnamed_addr constant [33 x i8] c"%s: -e emp must be n/5/c not %s\0A\00", align 1
@.str.153 = private unnamed_addr constant [21 x i8] c"%s: unrec option %c\0A\00", align 1
@.str.154 = private unnamed_addr constant [19 x i8] c"%s: excess arg %s\0A\00", align 1
@.str.155 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.156 = private unnamed_addr constant [5 x i8] c".mp3\00", align 1
@.str.157 = private unnamed_addr constant [55 x i8] c"id3tag ignored: id3 tagging not supported for stdout.\0A\00", align 1

; Function Attrs: noinline noreturn nounwind uwtable
define void @lame_usage(%struct.lame_global_flags* nocapture readnone, i8*) local_unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  tail call void @lame_print_version(%struct._IO_FILE* %3) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i64 0, i64 0), i8* %1) #8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.2, i64 0, i64 0), i64 65, i64 1, %struct._IO_FILE* %7) #8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0), i8* %1) #8
  tail call void @exit(i32 1) #9
  unreachable
}

declare void @lame_print_version(%struct._IO_FILE*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind uwtable
define void @lame_help(%struct.lame_global_flags* nocapture readonly, i8*) local_unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  tail call void @lame_print_version(%struct._IO_FILE* %3) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i64 0, i64 0), i8* %1)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.2, i64 0, i64 0), i64 65, i64 1, %struct._IO_FILE* %7)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9)
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i64 10, i64 1, %struct._IO_FILE* %10)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i64 0, i64 0), i64 17, i64 1, %struct._IO_FILE* %12)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.6, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %14)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.7, i64 0, i64 0), i64 49, i64 1, %struct._IO_FILE* %16)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.8, i64 0, i64 0), i64 76, i64 1, %struct._IO_FILE* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.9, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %20)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %22)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.10, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %23)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.11, i64 0, i64 0), i64 64, i64 1, %struct._IO_FILE* %25)
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.12, i64 0, i64 0), i64 74, i64 1, %struct._IO_FILE* %27)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.13, i64 0, i64 0))
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.14, i64 0, i64 0), i64 75, i64 1, %struct._IO_FILE* %31)
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.15, i64 0, i64 0))
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.16, i64 0, i64 0), i64 80, i64 1, %struct._IO_FILE* %35)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.17, i64 0, i64 0), i64 72, i64 1, %struct._IO_FILE* %37)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc9 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %39)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %41 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.18, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %40)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %43 = tail call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.19, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %42)
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.20, i64 0, i64 0), i64 66, i64 1, %struct._IO_FILE* %44)
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %47 = tail call i64 @fwrite(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.21, i64 0, i64 0), i64 71, i64 1, %struct._IO_FILE* %46)
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %49 = tail call i64 @fwrite(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.22, i64 0, i64 0), i64 64, i64 1, %struct._IO_FILE* %48)
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %51 = tail call i64 @fwrite(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.23, i64 0, i64 0), i64 64, i64 1, %struct._IO_FILE* %50)
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %53 = tail call i64 @fwrite(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.24, i64 0, i64 0), i64 49, i64 1, %struct._IO_FILE* %52)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %55 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.25, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %54)
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %57 = tail call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.26, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %56)
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %59 = tail call i64 @fwrite(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.27, i64 0, i64 0), i64 44, i64 1, %struct._IO_FILE* %58)
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %61 = tail call i64 @fwrite(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.28, i64 0, i64 0), i64 76, i64 1, %struct._IO_FILE* %60)
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %63 = tail call i64 @fwrite(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.29, i64 0, i64 0), i64 56, i64 1, %struct._IO_FILE* %62)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc12 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %64)
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %66 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.30, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %65)
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %68 = tail call i64 @fwrite(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.31, i64 0, i64 0), i64 71, i64 1, %struct._IO_FILE* %67)
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %70 = tail call i64 @fwrite(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.32, i64 0, i64 0), i64 49, i64 1, %struct._IO_FILE* %69)
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %72 = tail call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.33, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %71)
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc15 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %73)
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %75 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.34, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %74)
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %77 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.35, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %76)
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %79 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %80 = load i32, i32* %79, align 4
  %81 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.36, i64 0, i64 0), i32 %80)
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %83 = tail call i64 @fwrite(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.37, i64 0, i64 0), i64 65, i64 1, %struct._IO_FILE* %82)
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %85 = tail call i64 @fwrite(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.38, i64 0, i64 0), i64 67, i64 1, %struct._IO_FILE* %84)
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %87 = tail call i64 @fwrite(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.39, i64 0, i64 0), i64 68, i64 1, %struct._IO_FILE* %86)
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %89 = tail call i64 @fwrite(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.40, i64 0, i64 0), i64 55, i64 1, %struct._IO_FILE* %88)
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %91 = tail call i64 @fwrite(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.41, i64 0, i64 0), i64 50, i64 1, %struct._IO_FILE* %90)
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc18 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %92)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %94 = tail call i64 @fwrite(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.42, i64 0, i64 0), i64 29, i64 1, %struct._IO_FILE* %93)
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %96 = tail call i64 @fwrite(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.43, i64 0, i64 0), i64 50, i64 1, %struct._IO_FILE* %95)
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %98 = tail call i64 @fwrite(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.44, i64 0, i64 0), i64 38, i64 1, %struct._IO_FILE* %97)
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %100 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.45, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %99)
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %102 = tail call i64 @fwrite(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.46, i64 0, i64 0), i64 74, i64 1, %struct._IO_FILE* %101)
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %104 = tail call i64 @fwrite(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.47, i64 0, i64 0), i64 57, i64 1, %struct._IO_FILE* %103)
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %106 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.48, i64 0, i64 0), i64 46, i64 1, %struct._IO_FILE* %105)
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc21 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %107)
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %109 = tail call i64 @fwrite(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.49, i64 0, i64 0), i64 63, i64 1, %struct._IO_FILE* %108)
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %111 = tail call i64 @fwrite(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.50, i64 0, i64 0), i64 51, i64 1, %struct._IO_FILE* %110)
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %113 = tail call i64 @fwrite(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.51, i64 0, i64 0), i64 61, i64 1, %struct._IO_FILE* %112)
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %115 = tail call i64 @fwrite(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.52, i64 0, i64 0), i64 62, i64 1, %struct._IO_FILE* %114)
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %117 = tail call i64 @fwrite(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.53, i64 0, i64 0), i64 74, i64 1, %struct._IO_FILE* %116)
  %118 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %119 = tail call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.54, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %118)
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %121 = tail call i64 @fwrite(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.55, i64 0, i64 0), i64 68, i64 1, %struct._IO_FILE* %120)
  %122 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %123 = tail call i64 @fwrite(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.56, i64 0, i64 0), i64 67, i64 1, %struct._IO_FILE* %122)
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %125 = tail call i64 @fwrite(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.57, i64 0, i64 0), i64 66, i64 1, %struct._IO_FILE* %124)
  %126 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %127 = tail call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.58, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %126)
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc24 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %128)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  tail call void @display_bitrates(%struct._IO_FILE* %129) #6
  tail call void @exit(i32 0) #9
  unreachable
}

declare void @display_bitrates(%struct._IO_FILE*) local_unnamed_addr #1

; Function Attrs: noinline noreturn nounwind uwtable
define void @lame_presets_info(%struct.lame_global_flags* nocapture readnone, i8* nocapture readnone) local_unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  tail call void @lame_print_version(%struct._IO_FILE* %3) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.59, i64 0, i64 0), i64 48, i64 1, %struct._IO_FILE* %5)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i64 0, i64 0), i64 51, i64 1, %struct._IO_FILE* %7)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9)
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.61, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %10)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.62, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %12)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.63, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %14)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.64, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %16)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.65, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.66, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %20)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.67, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %22)
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.68, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %24)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.69, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %26)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.70, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %28)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %31 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.71, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32)
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.72, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.73, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %35)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.74, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %37)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %40 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.75, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %39)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %42 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.76, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %41)
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %44 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.66, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %43)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %46 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.67, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %45)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %48 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.77, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %47)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %50 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.69, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %49)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %52 = tail call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.78, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %51)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %54 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.79, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %53)
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc9 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %55)
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %57 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.80, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %56)
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %59 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.81, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %58)
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %61 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.82, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %60)
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %63 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.83, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %62)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %65 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.84, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %64)
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %67 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.85, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %66)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %69 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.86, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %68)
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %71 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.87, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %70)
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %73 = tail call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.88, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %72)
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %75 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.79, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %74)
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc12 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %76)
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %78 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.89, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %77)
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %80 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.76, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %79)
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %82 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.90, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %81)
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %84 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.91, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %83)
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %86 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.85, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %85)
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %88 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.92, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %87)
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %90 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.87, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %89)
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %92 = tail call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.88, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %91)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %94 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.79, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %93)
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc15 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %95)
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %97 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.93, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %96)
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %99 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.94, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %98)
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %101 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.90, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %100)
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %103 = tail call i64 @fwrite(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.91, i64 0, i64 0), i64 47, i64 1, %struct._IO_FILE* %102)
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %105 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.95, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %104)
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %107 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.85, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %106)
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %109 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.96, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %108)
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %111 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.87, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %110)
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %113 = tail call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.97, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %112)
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %115 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.98, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %114)
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc18 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %116)
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %118 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.99, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %117)
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %120 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.95, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %119)
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %122 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.100, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %121)
  %123 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %124 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.101, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %123)
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %126 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.102, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %125)
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %128 = tail call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.103, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %127)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %130 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.104, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %129)
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc21 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %131)
  %132 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %133 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.105, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %132)
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %135 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.95, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %134)
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %137 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.100, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %136)
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %139 = tail call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.106, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %138)
  %140 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %141 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.107, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %140)
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %143 = tail call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.108, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %142)
  %144 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %145 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.109, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %144)
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc24 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %146)
  tail call void @exit(i32 0) #9
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define void @lame_parse_args(%struct.lame_global_flags*, i32, i8** nocapture readonly) local_unnamed_addr #4 {
  %4 = alloca i8, align 1
  %5 = alloca i8*, align 8
  %6 = load i8*, i8** %2, align 8
  store i8 0, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  store i8 0, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %7 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 31
  store i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), i8** %7, align 8
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 32
  store i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), i8** %8, align 8
  tail call void @id3_inittag(%struct.ID3TAGDATA* nonnull @id3tag) #6
  store i32 0, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %9 = icmp sgt i32 %1, 1
  br i1 %9, label %.lr.ph128.lr.ph.lr.ph, label %.outer60._crit_edge

.lr.ph128.lr.ph.lr.ph:                            ; preds = %3
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %11 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 29
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %14 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 37
  %15 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 37
  %16 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 34
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 17
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 33
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 27
  %22 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %23 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 28
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 35
  %25 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %27 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 28
  %28 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %29 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 27
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %32 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 37
  %34 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %35 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %36 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %38 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %40 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 28
  %41 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 27
  %42 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %43 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %44 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %45 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %46 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 37
  %47 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %48 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %49 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %50 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %51 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %52 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %53 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 28
  %54 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %55 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 27
  %56 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %57 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %58 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %59 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %60 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %61 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %62 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %63 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %64 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 28
  %65 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %66 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 27
  %67 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %68 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %69 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %70 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %71 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %72 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %73 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %74 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %75 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 28
  %76 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %77 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 27
  %78 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %79 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %80 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %81 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %82 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %83 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %84 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %85 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %86 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %87 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %88 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %89 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %90 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %91 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %92 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %93 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %94 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %95 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %96 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %97 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %98 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %99 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %100 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %101 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %102 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %103 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %104 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %105 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %106 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %107 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 10
  %108 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %109 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  %110 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %111 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 2
  %112 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 11
  %113 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 23
  %114 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 24
  %115 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  %116 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 29
  %117 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 30
  %118 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 14
  %119 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %120 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 9
  %121 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %122 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 25
  %123 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 26
  %124 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 36
  %125 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 21
  %126 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 7
  %127 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 18
  %128 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 19
  %129 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 20
  %130 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  %131 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 38
  %132 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 38
  %133 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 38
  %134 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 12
  %135 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 13
  br label %.lr.ph128

.loopexit59.loopexit:                             ; preds = %.backedge
  br label %.loopexit59

.loopexit59:                                      ; preds = %.loopexit59.loopexit, %.preheader58
  %.143.lcssa = phi i32 [ %.042.ph153, %.preheader58 ], [ %.143.be, %.loopexit59.loopexit ]
  %.138.lcssa = phi i32 [ %.037.ph154, %.preheader58 ], [ %.138.be, %.loopexit59.loopexit ]
  %.132.lcssa = phi i32 [ %142, %.preheader58 ], [ %.132.be, %.loopexit59.loopexit ]
  %.110.lcssa = phi i32 [ 0, %.preheader58 ], [ %.110.be, %.loopexit59.loopexit ]
  %136 = add nsw i32 %.132.lcssa, 1
  %137 = icmp slt i32 %136, %1
  %138 = icmp eq i32 %.110.lcssa, 0
  %.126135 = and i1 %137, %138
  br i1 %.126135, label %.lr.ph128, label %.outer60._crit_edge.loopexit328

.lr.ph128:                                        ; preds = %.loopexit59, %.lr.ph128.lr.ph.lr.ph
  %139 = phi i1 [ true, %.lr.ph128.lr.ph.lr.ph ], [ %138, %.loopexit59 ]
  %140 = phi i32 [ 1, %.lr.ph128.lr.ph.lr.ph ], [ %136, %.loopexit59 ]
  %.031.ph155 = phi i32 [ 0, %.lr.ph128.lr.ph.lr.ph ], [ %.132.lcssa, %.loopexit59 ]
  %.037.ph154 = phi i32 [ 0, %.lr.ph128.lr.ph.lr.ph ], [ %.138.lcssa, %.loopexit59 ]
  %.042.ph153 = phi i32 [ 0, %.lr.ph128.lr.ph.lr.ph ], [ %.143.lcssa, %.loopexit59 ]
  br label %141

; <label>:141:                                    ; preds = %.lr.ph128, %.backedge63
  %142 = phi i32 [ %140, %.lr.ph128 ], [ %486, %.backedge63 ]
  %.031127 = phi i32 [ %.031.ph155, %.lr.ph128 ], [ %.031.be, %.backedge63 ]
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8*, i8** %2, i64 %143
  %145 = load i8*, i8** %144, align 8
  %146 = getelementptr inbounds i8, i8* %145, i64 1
  store i8* %146, i8** %5, align 8
  %147 = load i8, i8* %145, align 1
  %148 = icmp eq i8 %147, 45
  br i1 %148, label %149, label %480

; <label>:149:                                    ; preds = %141
  %150 = add nsw i32 %.031127, 2
  %151 = icmp slt i32 %150, %1
  br i1 %151, label %152, label %156

; <label>:152:                                    ; preds = %149
  %153 = sext i32 %150 to i64
  %154 = getelementptr inbounds i8*, i8** %2, i64 %153
  %155 = load i8*, i8** %154, align 8
  br label %156

; <label>:156:                                    ; preds = %149, %152
  %.01 = phi i8* [ %155, %152 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.110, i64 0, i64 0), %149 ]
  %157 = load i8*, i8** %5, align 8
  %158 = load i8, i8* %157, align 1
  %159 = icmp eq i8 %158, 0
  br i1 %159, label %160, label %172

; <label>:160:                                    ; preds = %156
  %161 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %162 = icmp eq i8 %161, 0
  br i1 %162, label %163, label %166

; <label>:163:                                    ; preds = %160
  %164 = load i8*, i8** %144, align 8
  %165 = tail call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), i8* %164, i64 300) #6
  br label %172

; <label>:166:                                    ; preds = %160
  %167 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %168 = icmp eq i8 %167, 0
  br i1 %168, label %169, label %172

; <label>:169:                                    ; preds = %166
  %170 = load i8*, i8** %144, align 8
  %171 = tail call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), i8* %170, i64 300) #6
  br label %172

; <label>:172:                                    ; preds = %163, %169, %166, %156
  %173 = load i8*, i8** %5, align 8
  %174 = load i8, i8* %173, align 1
  %175 = icmp eq i8 %174, 45
  br i1 %175, label %180, label %.preheader58

.preheader58:                                     ; preds = %172
  %176 = load i8*, i8** %5, align 8
  %177 = getelementptr inbounds i8, i8* %176, i64 1
  store i8* %177, i8** %5, align 8
  %178 = load i8, i8* %176, align 1
  store i8 %178, i8* %4, align 1
  %179 = icmp eq i8 %178, 0
  br i1 %179, label %.loopexit59, label %.lr.ph148.preheader

.lr.ph148.preheader:                              ; preds = %.preheader58
  br label %.lr.ph148

; <label>:180:                                    ; preds = %172
  %181 = getelementptr inbounds i8, i8* %173, i64 1
  store i8* %181, i8** %5, align 8
  %182 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.111, i64 0, i64 0)) #10
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %184, label %195

; <label>:184:                                    ; preds = %180
  %185 = tail call double @atof(i8* %.01) #10
  %186 = fptrunc double %185 to float
  %187 = fpext float %186 to double
  %188 = fmul double %187, 1.000000e+03
  %189 = fadd double %188, 5.000000e-01
  %190 = fptosi double %189 to i32
  store i32 %190, i32* %10, align 8
  %191 = fcmp olt float %186, 1.000000e+00
  br i1 %191, label %192, label %390

; <label>:192:                                    ; preds = %184
  %193 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %194 = tail call i64 @fwrite(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.112, i64 0, i64 0), i64 42, i64 1, %struct._IO_FILE* %193) #8
  tail call void @exit(i32 1) #9
  unreachable

; <label>:195:                                    ; preds = %180
  %196 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.113, i64 0, i64 0)) #10
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %198, label %199

; <label>:198:                                    ; preds = %195
  store i32 3, i32* %11, align 8
  br label %390

; <label>:199:                                    ; preds = %195
  %200 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.114, i64 0, i64 0)) #10
  %201 = icmp eq i32 %200, 0
  br i1 %201, label %202, label %203

; <label>:202:                                    ; preds = %199
  store i32 12000, i32* %12, align 8
  store i32 160, i32* %13, align 4
  store i32 1, i32* %14, align 8
  br label %390

; <label>:203:                                    ; preds = %199
  %204 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.115, i64 0, i64 0)) #10
  %205 = icmp eq i32 %204, 0
  br i1 %205, label %206, label %207

; <label>:206:                                    ; preds = %203
  store i32 1, i32* %15, align 8
  br label %390

; <label>:207:                                    ; preds = %203
  %208 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.116, i64 0, i64 0)) #10
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %210, label %211

; <label>:210:                                    ; preds = %207
  store i32 1, i32* %16, align 4
  br label %390

; <label>:211:                                    ; preds = %207
  %212 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.117, i64 0, i64 0)) #10
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %214, label %215

; <label>:214:                                    ; preds = %211
  store i32 1, i32* %17, align 8
  store i32 0, i32* %18, align 4
  br label %390

; <label>:215:                                    ; preds = %211
  %216 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.118, i64 0, i64 0)) #10
  %217 = icmp eq i32 %216, 0
  br i1 %217, label %218, label %219

; <label>:218:                                    ; preds = %215
  store i32 1, i32* %19, align 8
  br label %390

; <label>:219:                                    ; preds = %215
  %220 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.119, i64 0, i64 0)) #10
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %390, label %222

; <label>:222:                                    ; preds = %219
  %223 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.120, i64 0, i64 0)) #10
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %225, label %227

; <label>:225:                                    ; preds = %222
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %226 = tail call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 2, i64 0), i8* %.01, i64 30) #6
  br label %390

; <label>:227:                                    ; preds = %222
  %228 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.121, i64 0, i64 0)) #10
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %230, label %232

; <label>:230:                                    ; preds = %227
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %231 = tail call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 3, i64 0), i8* %.01, i64 30) #6
  br label %390

; <label>:232:                                    ; preds = %227
  %233 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.122, i64 0, i64 0)) #10
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %235, label %237

; <label>:235:                                    ; preds = %232
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %236 = tail call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 4, i64 0), i8* %.01, i64 30) #6
  br label %390

; <label>:237:                                    ; preds = %232
  %238 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.123, i64 0, i64 0)) #10
  %239 = icmp eq i32 %238, 0
  br i1 %239, label %240, label %242

; <label>:240:                                    ; preds = %237
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %241 = tail call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 5, i64 0), i8* %.01, i64 4) #6
  br label %390

; <label>:242:                                    ; preds = %237
  %243 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.124, i64 0, i64 0)) #10
  %244 = icmp eq i32 %243, 0
  br i1 %244, label %245, label %247

; <label>:245:                                    ; preds = %242
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %246 = tail call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 6, i64 0), i8* %.01, i64 30) #6
  br label %390

; <label>:247:                                    ; preds = %242
  %248 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.125, i64 0, i64 0)) #10
  %249 = icmp eq i32 %248, 0
  br i1 %249, label %250, label %255

; <label>:250:                                    ; preds = %247
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %251 = tail call i32 @atoi(i8* %.01) #10
  %252 = icmp sgt i32 %251, 1
  %.51 = select i1 %252, i32 %251, i32 1
  %253 = icmp slt i32 %.51, 99
  %.150 = select i1 %253, i32 %.51, i32 99
  %254 = trunc i32 %.150 to i8
  store i8 %254, i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 9), align 2
  br label %390

; <label>:255:                                    ; preds = %247
  %256 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.126, i64 0, i64 0)) #10
  %257 = icmp eq i32 %256, 0
  br i1 %257, label %258, label %284

; <label>:258:                                    ; preds = %255
  %259 = call i64 @strtol(i8* %.01, i8** nonnull %5, i32 10) #6
  %260 = trunc i64 %259 to i32
  %261 = load i8*, i8** %5, align 8
  %262 = icmp eq i8* %.01, %261
  br i1 %262, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %258
  %263 = load i32, i32* @genre_last, align 4
  %264 = icmp slt i32 %263, 0
  br i1 %264, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %265 = load i32, i32* @genre_last, align 4
  %266 = sext i32 %265 to i64
  br label %267

; <label>:267:                                    ; preds = %273, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %273 ], [ 0, %.lr.ph ]
  %.0123 = phi i32 [ %274, %273 ], [ 0, %.lr.ph ]
  %268 = getelementptr inbounds [0 x i8*], [0 x i8*]* @genre_list, i64 0, i64 %indvars.iv
  %269 = load i8*, i8** %268, align 8
  %270 = tail call i32 @strcmp(i8* %269, i8* %.01) #10
  %271 = icmp eq i32 %270, 0
  %272 = trunc i64 %indvars.iv to i32
  br i1 %271, label %.loopexit.loopexit, label %273

; <label>:273:                                    ; preds = %267
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %274 = add nuw nsw i32 %.0123, 1
  %275 = icmp slt i64 %indvars.iv, %266
  br i1 %275, label %267, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %267, %273
  %.1.ph = phi i32 [ %272, %267 ], [ %274, %273 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %258
  %.1 = phi i32 [ %260, %258 ], [ 0, %.preheader ], [ %.1.ph, %.loopexit.loopexit ]
  %276 = load i32, i32* @genre_last, align 4
  %277 = icmp sgt i32 %.1, %276
  br i1 %277, label %278, label %281

; <label>:278:                                    ; preds = %.loopexit
  %279 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %280 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %279, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.127, i64 0, i64 0), i8* %.01) #8
  br label %281

; <label>:281:                                    ; preds = %278, %.loopexit
  %.2 = phi i32 [ 255, %278 ], [ %.1, %.loopexit ]
  %282 = trunc i32 %.2 to i8
  store i8 %282, i8* %4, align 1
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %283 = call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 8, i64 0), i8* nonnull %4, i64 1) #6
  br label %390

; <label>:284:                                    ; preds = %255
  %285 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.128, i64 0, i64 0)) #10
  %286 = icmp eq i32 %285, 0
  br i1 %286, label %287, label %296

; <label>:287:                                    ; preds = %284
  %288 = tail call double @atof(i8* %.01) #10
  %289 = fmul double %288, 1.000000e+03
  %290 = fadd double %289, 5.000000e-01
  %291 = fptosi double %290 to i32
  store i32 %291, i32* %20, align 8
  %292 = icmp slt i32 %291, 1
  br i1 %292, label %293, label %390

; <label>:293:                                    ; preds = %287
  %294 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %295 = tail call i64 @fwrite(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.129, i64 0, i64 0), i64 60, i64 1, %struct._IO_FILE* %294) #8
  tail call void @exit(i32 1) #9
  unreachable

; <label>:296:                                    ; preds = %284
  %297 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.130, i64 0, i64 0)) #10
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %299, label %308

; <label>:299:                                    ; preds = %296
  %300 = tail call double @atof(i8* %.01) #10
  %301 = fmul double %300, 1.000000e+03
  %302 = fadd double %301, 5.000000e-01
  %303 = fptosi double %302 to i32
  store i32 %303, i32* %21, align 8
  %304 = icmp slt i32 %303, 0
  br i1 %304, label %305, label %390

; <label>:305:                                    ; preds = %299
  %306 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %307 = tail call i64 @fwrite(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.131, i64 0, i64 0), i64 68, i64 1, %struct._IO_FILE* %306) #8
  tail call void @exit(i32 1) #9
  unreachable

; <label>:308:                                    ; preds = %296
  %309 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.132, i64 0, i64 0)) #10
  %310 = icmp eq i32 %309, 0
  br i1 %310, label %311, label %320

; <label>:311:                                    ; preds = %308
  %312 = tail call double @atof(i8* %.01) #10
  %313 = fmul double %312, 1.000000e+03
  %314 = fadd double %313, 5.000000e-01
  %315 = fptosi double %314 to i32
  store i32 %315, i32* %22, align 4
  %316 = icmp slt i32 %315, 1
  br i1 %316, label %317, label %390

; <label>:317:                                    ; preds = %311
  %318 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %319 = tail call i64 @fwrite(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.133, i64 0, i64 0), i64 62, i64 1, %struct._IO_FILE* %318) #8
  tail call void @exit(i32 1) #9
  unreachable

; <label>:320:                                    ; preds = %308
  %321 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.134, i64 0, i64 0)) #10
  %322 = icmp eq i32 %321, 0
  br i1 %322, label %323, label %332

; <label>:323:                                    ; preds = %320
  %324 = tail call double @atof(i8* %.01) #10
  %325 = fmul double %324, 1.000000e+03
  %326 = fadd double %325, 5.000000e-01
  %327 = fptosi double %326 to i32
  store i32 %327, i32* %23, align 4
  %328 = icmp slt i32 %327, 0
  br i1 %328, label %329, label %390

; <label>:329:                                    ; preds = %323
  %330 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %331 = tail call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.135, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %330) #8
  tail call void @exit(i32 1) #9
  unreachable

; <label>:332:                                    ; preds = %320
  %333 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.136, i64 0, i64 0)) #10
  %334 = icmp eq i32 %333, 0
  br i1 %334, label %335, label %342

; <label>:335:                                    ; preds = %332
  %336 = tail call double @atof(i8* %.01) #10
  %337 = fptrunc double %336 to float
  store float %337, float* %24, align 8
  %338 = fcmp ugt float %337, 0.000000e+00
  br i1 %338, label %390, label %339

; <label>:339:                                    ; preds = %335
  %340 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %341 = tail call i64 @fwrite(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.137, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %340) #8
  tail call void @exit(i32 1) #9
  unreachable

; <label>:342:                                    ; preds = %332
  %343 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.138, i64 0, i64 0)) #10
  %344 = icmp eq i32 %343, 0
  br i1 %344, label %348, label %345

; <label>:345:                                    ; preds = %342
  %346 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.139, i64 0, i64 0)) #10
  %347 = icmp eq i32 %346, 0
  br i1 %347, label %348, label %349

; <label>:348:                                    ; preds = %345, %342
  tail call void @lame_help(%struct.lame_global_flags* %0, i8* %6)
  unreachable

; <label>:349:                                    ; preds = %345
  %350 = tail call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.140, i64 0, i64 0)) #10
  %351 = icmp eq i32 %350, 0
  br i1 %351, label %352, label %387

; <label>:352:                                    ; preds = %349
  %353 = tail call i32 @strcmp(i8* %.01, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.141, i64 0, i64 0)) #10
  %354 = icmp eq i32 %353, 0
  br i1 %354, label %355, label %356

; <label>:355:                                    ; preds = %352
  store i32 16, i32* %25, align 8
  store i32 260, i32* %26, align 4
  store i32 40, i32* %27, align 4
  store i32 3700, i32* %28, align 8
  store i32 300, i32* %29, align 8
  store i32 5, i32* %30, align 4
  store i32 8, i32* %31, align 8
  store i32 56, i32* %32, align 4
  store i32 1, i32* %33, align 8
  store i32 16000, i32* %34, align 8
  store i32 3, i32* %35, align 4
  store i32 1, i32* %36, align 8
  store i32 5, i32* %37, align 4
  br label %390

; <label>:356:                                    ; preds = %352
  %357 = tail call i32 @strcmp(i8* %.01, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.114, i64 0, i64 0)) #10
  %358 = icmp eq i32 %357, 0
  br i1 %358, label %359, label %360

; <label>:359:                                    ; preds = %356
  store i32 56, i32* %38, align 8
  store i32 100, i32* %39, align 4
  store i32 20, i32* %40, align 4
  store i32 2000, i32* %41, align 8
  store i32 11000, i32* %42, align 8
  store i32 4, i32* %43, align 4
  store i32 8, i32* %44, align 8
  store i32 96, i32* %45, align 4
  store i32 1, i32* %46, align 8
  store i32 3, i32* %47, align 4
  store i32 1, i32* %48, align 8
  store i32 24000, i32* %49, align 8
  store i32 5, i32* %50, align 4
  br label %390

; <label>:360:                                    ; preds = %356
  %361 = tail call i32 @strcmp(i8* %.01, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.142, i64 0, i64 0)) #10
  %362 = icmp eq i32 %361, 0
  br i1 %362, label %363, label %364

; <label>:363:                                    ; preds = %360
  store i32 96, i32* %51, align 8
  store i32 30, i32* %52, align 4
  store i32 0, i32* %53, align 4
  store i32 15000, i32* %54, align 8
  store i32 0, i32* %55, align 8
  store i32 4, i32* %56, align 4
  store i32 32, i32* %57, align 8
  store i32 192, i32* %58, align 4
  store i32 1, i32* %59, align 4
  store i32 1, i32* %60, align 8
  store i32 5, i32* %61, align 4
  br label %390

; <label>:364:                                    ; preds = %360
  %365 = tail call i32 @strcmp(i8* %.01, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.143, i64 0, i64 0)) #10
  %366 = icmp eq i32 %365, 0
  br i1 %366, label %367, label %368

; <label>:367:                                    ; preds = %364
  store i32 128, i32* %62, align 8
  store i32 15, i32* %63, align 4
  store i32 15, i32* %64, align 4
  store i32 17000, i32* %65, align 8
  store i32 2000, i32* %66, align 8
  store i32 4, i32* %67, align 4
  store i32 32, i32* %68, align 8
  store i32 192, i32* %69, align 4
  store i32 1, i32* %70, align 4
  store i32 1, i32* %71, align 8
  store i32 5, i32* %72, align 4
  br label %390

; <label>:368:                                    ; preds = %364
  %369 = tail call i32 @strcmp(i8* %.01, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.144, i64 0, i64 0)) #10
  %370 = icmp eq i32 %369, 0
  br i1 %370, label %371, label %372

; <label>:371:                                    ; preds = %368
  store i32 160, i32* %73, align 8
  store i32 15, i32* %74, align 4
  store i32 15, i32* %75, align 4
  store i32 20000, i32* %76, align 8
  store i32 3000, i32* %77, align 8
  store i32 3, i32* %78, align 4
  store i32 32, i32* %79, align 8
  store i32 224, i32* %80, align 4
  store i32 1, i32* %81, align 4
  store i32 1, i32* %82, align 8
  store i32 2, i32* %83, align 4
  br label %390

; <label>:372:                                    ; preds = %368
  %373 = tail call i32 @strcmp(i8* %.01, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.145, i64 0, i64 0)) #10
  %374 = icmp eq i32 %373, 0
  br i1 %374, label %375, label %376

; <label>:375:                                    ; preds = %372
  store i32 192, i32* %84, align 8
  store i32 -1, i32* %85, align 8
  store i32 -1, i32* %86, align 4
  store i32 2, i32* %87, align 4
  store i32 80, i32* %88, align 8
  store i32 256, i32* %89, align 4
  store i32 0, i32* %90, align 4
  store i32 1, i32* %91, align 8
  store i32 2, i32* %92, align 4
  br label %390

; <label>:376:                                    ; preds = %372
  %377 = tail call i32 @strcmp(i8* %.01, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.146, i64 0, i64 0)) #10
  %378 = icmp eq i32 %377, 0
  br i1 %378, label %379, label %380

; <label>:379:                                    ; preds = %376
  store i32 256, i32* %93, align 8
  store i32 -1, i32* %94, align 8
  store i32 -1, i32* %95, align 4
  store i32 0, i32* %96, align 4
  store i32 112, i32* %97, align 8
  store i32 320, i32* %98, align 4
  store i32 0, i32* %99, align 4
  store i32 1, i32* %100, align 8
  store i32 2, i32* %101, align 4
  br label %390

; <label>:380:                                    ; preds = %376
  %381 = tail call i32 @strcmp(i8* %.01, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.138, i64 0, i64 0)) #10
  %382 = icmp eq i32 %381, 0
  br i1 %382, label %383, label %384

; <label>:383:                                    ; preds = %380
  tail call void @lame_presets_info(%struct.lame_global_flags* undef, i8* undef)
  unreachable

; <label>:384:                                    ; preds = %380
  %385 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %386 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %385, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @.str.147, i64 0, i64 0), i8* %6, i8* %.01) #8
  tail call void @exit(i32 1) #9
  unreachable

; <label>:387:                                    ; preds = %349
  %388 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %389 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %388, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.148, i64 0, i64 0), i8* %6, i8* %181) #8
  br label %390

; <label>:390:                                    ; preds = %198, %206, %214, %219, %230, %240, %250, %287, %311, %335, %387, %359, %367, %375, %379, %371, %363, %355, %323, %299, %281, %245, %235, %225, %218, %210, %202, %184
  %.24 = phi i32 [ 1, %184 ], [ 0, %198 ], [ 0, %202 ], [ 0, %206 ], [ 0, %210 ], [ 0, %214 ], [ 0, %218 ], [ 0, %219 ], [ 1, %225 ], [ 1, %230 ], [ 1, %235 ], [ 1, %240 ], [ 1, %245 ], [ 1, %250 ], [ 1, %281 ], [ 1, %287 ], [ 1, %299 ], [ 1, %311 ], [ 1, %323 ], [ 1, %335 ], [ 0, %387 ], [ 1, %359 ], [ 1, %367 ], [ 1, %375 ], [ 1, %379 ], [ 1, %371 ], [ 1, %363 ], [ 1, %355 ]
  %391 = add nsw i32 %.24, %142
  br label %.backedge63

.lr.ph148:                                        ; preds = %.lr.ph148.preheader, %.backedge
  %392 = phi i8 [ %476, %.backedge ], [ %178, %.lr.ph148.preheader ]
  %.110147 = phi i32 [ %.110.be, %.backedge ], [ 0, %.lr.ph148.preheader ]
  %.132146 = phi i32 [ %.132.be, %.backedge ], [ %142, %.lr.ph148.preheader ]
  %.138145 = phi i32 [ %.138.be, %.backedge ], [ %.037.ph154, %.lr.ph148.preheader ]
  %.143144 = phi i32 [ %.143.be, %.backedge ], [ %.042.ph153, %.lr.ph148.preheader ]
  %393 = load i8*, i8** %5, align 8
  %394 = load i8, i8* %393, align 1
  %395 = icmp eq i8 %394, 0
  %.02 = select i1 %395, i8* %.01, i8* %393
  %396 = sext i8 %392 to i32
  switch i32 %396, label %467 [
    i32 109, label %397
    i32 86, label %407
    i32 113, label %413
    i32 115, label %417
    i32 98, label %424
    i32 66, label %426
    i32 116, label %428
    i32 114, label %429
    i32 120, label %430
    i32 112, label %431
    i32 97, label %432
    i32 104, label %433
    i32 107, label %434
    i32 100, label %435
    i32 118, label %436
    i32 83, label %437
    i32 88, label %438
    i32 89, label %450
    i32 90, label %451
    i32 102, label %452
    i32 103, label %453
    i32 101, label %456
    i32 99, label %464
    i32 111, label %465
    i32 63, label %466
  ]

; <label>:397:                                    ; preds = %.lr.ph148
  store i32 1, i32* %102, align 8
  %398 = load i8, i8* %.02, align 1
  switch i8 %398, label %404 [
    i8 115, label %399
    i8 100, label %400
    i8 106, label %401
    i8 102, label %402
    i8 109, label %403
  ]

; <label>:399:                                    ; preds = %397
  store i32 0, i32* %103, align 4
  br label %470

; <label>:400:                                    ; preds = %397
  store i32 2, i32* %104, align 4
  br label %470

; <label>:401:                                    ; preds = %397
  store i32 1, i32* %105, align 4
  br label %470

; <label>:402:                                    ; preds = %397
  store i32 1, i32* %106, align 4
  store i32 1, i32* %107, align 4
  br label %470

; <label>:403:                                    ; preds = %397
  store i32 3, i32* %108, align 4
  br label %470

; <label>:404:                                    ; preds = %397
  %405 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %406 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %405, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.149, i64 0, i64 0), i8* %6, i8* nonnull %.02) #8
  br label %470

; <label>:407:                                    ; preds = %.lr.ph148
  store i32 1, i32* %109, align 8
  %408 = tail call i32 @atoi(i8* %.02) #10
  store i32 %408, i32* %110, align 4
  %409 = icmp slt i32 %408, 0
  br i1 %409, label %.thread, label %410

.thread:                                          ; preds = %407
  store i32 0, i32* %110, align 4
  br label %470

; <label>:410:                                    ; preds = %407
  %411 = icmp sgt i32 %408, 9
  br i1 %411, label %412, label %470

; <label>:412:                                    ; preds = %410
  store i32 9, i32* %110, align 4
  br label %470

; <label>:413:                                    ; preds = %.lr.ph148
  %414 = tail call i32 @atoi(i8* %.02) #10
  %415 = icmp sgt i32 %414, 0
  %.52 = select i1 %415, i32 %414, i32 0
  %416 = icmp slt i32 %.52, 9
  %.345 = select i1 %416, i32 %.52, i32 9
  br label %470

; <label>:417:                                    ; preds = %.lr.ph148
  %418 = tail call double @atof(i8* %.02) #10
  %419 = fptrunc double %418 to float
  %420 = fpext float %419 to double
  %421 = fmul double %420, 1.000000e+03
  %422 = fadd double %421, 5.000000e-01
  %423 = fptosi double %422 to i32
  store i32 %423, i32* %111, align 4
  br label %470

; <label>:424:                                    ; preds = %.lr.ph148
  %425 = tail call i32 @atoi(i8* %.02) #10
  store i32 %425, i32* %112, align 8
  store i32 %425, i32* %113, align 8
  br label %470

; <label>:426:                                    ; preds = %.lr.ph148
  %427 = tail call i32 @atoi(i8* %.02) #10
  store i32 %427, i32* %114, align 4
  br label %470

; <label>:428:                                    ; preds = %.lr.ph148
  store i32 0, i32* %115, align 8
  br label %.backedge

; <label>:429:                                    ; preds = %.lr.ph148
  store i32 4, i32* %116, align 8
  br label %.backedge

; <label>:430:                                    ; preds = %.lr.ph148
  store i32 1, i32* %117, align 4
  br label %.backedge

; <label>:431:                                    ; preds = %.lr.ph148
  store i32 1, i32* %118, align 4
  br label %.backedge

; <label>:432:                                    ; preds = %.lr.ph148
  store i32 3, i32* %119, align 4
  store i32 1, i32* %120, align 8
  br label %.backedge

; <label>:433:                                    ; preds = %.lr.ph148
  store i32 2, i32* %121, align 4
  br label %.backedge

; <label>:434:                                    ; preds = %.lr.ph148
  store i32 -1, i32* %122, align 8
  store i32 -1, i32* %123, align 4
  br label %.backedge

; <label>:435:                                    ; preds = %.lr.ph148
  store i32 1, i32* %124, align 4
  br label %.backedge

; <label>:436:                                    ; preds = %.lr.ph148
  store i32 1, i32* %125, align 8
  br label %.backedge

; <label>:437:                                    ; preds = %.lr.ph148
  store i32 1, i32* %126, align 8
  br label %.backedge

; <label>:438:                                    ; preds = %.lr.ph148
  store i32 0, i32* %127, align 4
  %439 = load i8, i8* %.02, align 1
  switch i8 %439, label %447 [
    i8 48, label %440
    i8 49, label %441
    i8 50, label %442
    i8 51, label %443
    i8 52, label %444
    i8 53, label %445
    i8 54, label %446
  ]

; <label>:440:                                    ; preds = %438
  store i32 0, i32* %127, align 4
  br label %470

; <label>:441:                                    ; preds = %438
  store i32 1, i32* %127, align 4
  br label %470

; <label>:442:                                    ; preds = %438
  store i32 2, i32* %127, align 4
  br label %470

; <label>:443:                                    ; preds = %438
  store i32 3, i32* %127, align 4
  br label %470

; <label>:444:                                    ; preds = %438
  store i32 4, i32* %127, align 4
  br label %470

; <label>:445:                                    ; preds = %438
  store i32 5, i32* %127, align 4
  br label %470

; <label>:446:                                    ; preds = %438
  store i32 6, i32* %127, align 4
  br label %470

; <label>:447:                                    ; preds = %438
  %448 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %449 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %448, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.150, i64 0, i64 0), i8* %6, i8* nonnull %.02) #8
  br label %470

; <label>:450:                                    ; preds = %.lr.ph148
  store i32 1, i32* %128, align 8
  br label %.backedge

; <label>:451:                                    ; preds = %.lr.ph148
  store i32 1, i32* %129, align 4
  br label %.backedge

; <label>:452:                                    ; preds = %.lr.ph148
  store i32 9, i32* %130, align 4
  br label %.backedge

; <label>:453:                                    ; preds = %.lr.ph148
  %454 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %455 = tail call i64 @fwrite(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.151, i64 0, i64 0), i64 54, i64 1, %struct._IO_FILE* %454) #8
  br label %.backedge

; <label>:456:                                    ; preds = %.lr.ph148
  %457 = load i8, i8* %.02, align 1
  switch i8 %457, label %461 [
    i8 110, label %458
    i8 53, label %459
    i8 99, label %460
  ]

; <label>:458:                                    ; preds = %456
  store i32 0, i32* %131, align 4
  br label %470

; <label>:459:                                    ; preds = %456
  store i32 1, i32* %132, align 4
  br label %470

; <label>:460:                                    ; preds = %456
  store i32 3, i32* %133, align 4
  br label %470

; <label>:461:                                    ; preds = %456
  %462 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %463 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %462, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.152, i64 0, i64 0), i8* %6, i8* nonnull %.02) #8
  br label %470

; <label>:464:                                    ; preds = %.lr.ph148
  store i32 1, i32* %134, align 4
  br label %.backedge

; <label>:465:                                    ; preds = %.lr.ph148
  store i32 0, i32* %135, align 8
  br label %.backedge

; <label>:466:                                    ; preds = %.lr.ph148
  tail call void @lame_help(%struct.lame_global_flags* %0, i8* %6)
  unreachable

; <label>:467:                                    ; preds = %.lr.ph148
  %468 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %469 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %468, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.153, i64 0, i64 0), i8* %6, i32 %396) #8
  br label %.backedge

; <label>:470:                                    ; preds = %426, %424, %417, %400, %402, %404, %403, %401, %399, %412, %410, %413, %441, %443, %445, %447, %446, %444, %442, %440, %459, %461, %460, %458, %.thread
  %.446.ph = phi i32 [ %.143144, %.thread ], [ %.143144, %458 ], [ %.143144, %460 ], [ %.143144, %461 ], [ %.143144, %459 ], [ %.143144, %440 ], [ %.143144, %442 ], [ %.143144, %444 ], [ %.143144, %446 ], [ %.143144, %447 ], [ %.143144, %445 ], [ %.143144, %443 ], [ %.143144, %441 ], [ %.345, %413 ], [ %.143144, %410 ], [ %.143144, %412 ], [ %.143144, %399 ], [ %.143144, %401 ], [ %.143144, %403 ], [ %.143144, %404 ], [ %.143144, %402 ], [ %.143144, %400 ], [ %.143144, %417 ], [ %.143144, %424 ], [ %.143144, %426 ]
  %.1726.ph = phi i32 [ %.110147, %.thread ], [ %.110147, %458 ], [ %.110147, %460 ], [ 1, %461 ], [ %.110147, %459 ], [ %.110147, %440 ], [ %.110147, %442 ], [ %.110147, %444 ], [ %.110147, %446 ], [ 1, %447 ], [ %.110147, %445 ], [ %.110147, %443 ], [ %.110147, %441 ], [ %.110147, %413 ], [ %.110147, %410 ], [ %.110147, %412 ], [ %.110147, %399 ], [ %.110147, %401 ], [ %.110147, %403 ], [ 1, %404 ], [ %.110147, %402 ], [ %.110147, %400 ], [ %.110147, %417 ], [ %.110147, %424 ], [ %.110147, %426 ]
  %471 = load i8*, i8** %5, align 8
  %472 = icmp eq i8* %.02, %471
  br i1 %472, label %473, label %478

; <label>:473:                                    ; preds = %470
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.110, i64 0, i64 0), i8** %5, align 8
  br label %.backedge

.backedge:                                        ; preds = %473, %478, %467, %465, %464, %453, %452, %451, %450, %437, %436, %435, %434, %433, %432, %431, %430, %429, %428
  %.143.be = phi i32 [ %.446.ph, %473 ], [ %.446.ph, %478 ], [ %.143144, %467 ], [ %.143144, %465 ], [ %.143144, %464 ], [ %.143144, %453 ], [ %.143144, %452 ], [ %.143144, %451 ], [ %.143144, %450 ], [ %.143144, %437 ], [ %.143144, %436 ], [ %.143144, %435 ], [ %.143144, %434 ], [ %.143144, %433 ], [ %.143144, %432 ], [ %.143144, %431 ], [ %.143144, %430 ], [ %.143144, %429 ], [ %.143144, %428 ]
  %.138.be = phi i32 [ %.138145, %473 ], [ %.138145, %478 ], [ %.138145, %467 ], [ %.138145, %465 ], [ %.138145, %464 ], [ %.138145, %453 ], [ %.138145, %452 ], [ %.138145, %451 ], [ %.138145, %450 ], [ %.138145, %437 ], [ %.138145, %436 ], [ %.138145, %435 ], [ %.138145, %434 ], [ %.138145, %433 ], [ 1, %432 ], [ %.138145, %431 ], [ %.138145, %430 ], [ %.138145, %429 ], [ %.138145, %428 ]
  %.132.be = phi i32 [ %.132146, %473 ], [ %479, %478 ], [ %.132146, %467 ], [ %.132146, %465 ], [ %.132146, %464 ], [ %.132146, %453 ], [ %.132146, %452 ], [ %.132146, %451 ], [ %.132146, %450 ], [ %.132146, %437 ], [ %.132146, %436 ], [ %.132146, %435 ], [ %.132146, %434 ], [ %.132146, %433 ], [ %.132146, %432 ], [ %.132146, %431 ], [ %.132146, %430 ], [ %.132146, %429 ], [ %.132146, %428 ]
  %.110.be = phi i32 [ %.1726.ph, %473 ], [ %.1726.ph, %478 ], [ 1, %467 ], [ %.110147, %465 ], [ %.110147, %464 ], [ %.110147, %453 ], [ %.110147, %452 ], [ %.110147, %451 ], [ %.110147, %450 ], [ %.110147, %437 ], [ %.110147, %436 ], [ %.110147, %435 ], [ %.110147, %434 ], [ %.110147, %433 ], [ %.110147, %432 ], [ %.110147, %431 ], [ %.110147, %430 ], [ %.110147, %429 ], [ %.110147, %428 ]
  %474 = load i8*, i8** %5, align 8
  %475 = getelementptr inbounds i8, i8* %474, i64 1
  store i8* %475, i8** %5, align 8
  %476 = load i8, i8* %474, align 1
  store i8 %476, i8* %4, align 1
  %477 = icmp eq i8 %476, 0
  br i1 %477, label %.loopexit59.loopexit, label %.lr.ph148

; <label>:478:                                    ; preds = %470
  %479 = add nsw i32 %.132146, 1
  br label %.backedge

; <label>:480:                                    ; preds = %141
  %481 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %482 = icmp eq i8 %481, 0
  br i1 %482, label %483, label %488

; <label>:483:                                    ; preds = %480
  %484 = load i8*, i8** %144, align 8
  %485 = tail call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), i8* %484, i64 300) #6
  br label %.backedge63

.backedge63:                                      ; preds = %483, %491, %390
  %.031.be = phi i32 [ %391, %390 ], [ %142, %491 ], [ %142, %483 ]
  %486 = add nsw i32 %.031.be, 1
  %487 = icmp slt i32 %486, %1
  %. = and i1 %487, %139
  br i1 %., label %141, label %.outer60._crit_edge.loopexit

; <label>:488:                                    ; preds = %480
  %489 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %490 = icmp eq i8 %489, 0
  br i1 %490, label %491, label %.outer60._crit_edge.thread

; <label>:491:                                    ; preds = %488
  %492 = load i8*, i8** %144, align 8
  %493 = tail call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), i8* %492, i64 300) #6
  br label %.backedge63

.outer60._crit_edge.thread:                       ; preds = %488
  %494 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %495 = load i8*, i8** %144, align 8
  %496 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %494, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.154, i64 0, i64 0), i8* %6, i8* %495) #8
  br label %500

.outer60._crit_edge.loopexit:                     ; preds = %.backedge63
  br label %.outer60._crit_edge

.outer60._crit_edge.loopexit328:                  ; preds = %.loopexit59
  br label %.outer60._crit_edge

.outer60._crit_edge:                              ; preds = %.outer60._crit_edge.loopexit328, %.outer60._crit_edge.loopexit, %3
  %.042.ph.lcssa122 = phi i32 [ 0, %3 ], [ %.042.ph153, %.outer60._crit_edge.loopexit ], [ %.143.lcssa, %.outer60._crit_edge.loopexit328 ]
  %.037.ph.lcssa113 = phi i32 [ 0, %3 ], [ %.037.ph154, %.outer60._crit_edge.loopexit ], [ %.138.lcssa, %.outer60._crit_edge.loopexit328 ]
  %.03.ph62.lcssa100 = phi i32 [ 0, %3 ], [ 0, %.outer60._crit_edge.loopexit ], [ %.110.lcssa, %.outer60._crit_edge.loopexit328 ]
  %497 = icmp ne i32 %.03.ph62.lcssa100, 0
  %498 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %499 = icmp eq i8 %498, 0
  %or.cond = or i1 %497, %499
  br i1 %or.cond, label %500, label %501

; <label>:500:                                    ; preds = %.outer60._crit_edge.thread, %.outer60._crit_edge
  tail call void @lame_usage(%struct.lame_global_flags* undef, i8* %6)
  unreachable

; <label>:501:                                    ; preds = %.outer60._crit_edge
  %502 = icmp eq i8 %498, 45
  br i1 %502, label %503, label %505

; <label>:503:                                    ; preds = %501
  %504 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 7
  store i32 1, i32* %504, align 8
  br label %505

; <label>:505:                                    ; preds = %503, %501
  %506 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %507 = icmp eq i8 %506, 0
  br i1 %507, label %508, label %514

; <label>:508:                                    ; preds = %505
  %509 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %510 = icmp eq i8 %509, 45
  br i1 %510, label %511, label %512

; <label>:511:                                    ; preds = %508
  store i16 45, i16* bitcast ([300 x i8]* @outPath to i16*), align 16
  br label %thread-pre-split

; <label>:512:                                    ; preds = %508
  %513 = tail call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), i64 296) #6
  %strlen = tail call i64 @strlen(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0))
  %endptr = getelementptr [300 x i8], [300 x i8]* @outPath, i64 0, i64 %strlen
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.156, i64 0, i64 0), i64 5, i32 1, i1 false)
  br label %thread-pre-split

thread-pre-split:                                 ; preds = %512, %511
  %.pr = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  br label %514

; <label>:514:                                    ; preds = %thread-pre-split, %505
  %515 = phi i8 [ %.pr, %thread-pre-split ], [ %506, %505 ]
  %516 = icmp eq i8 %515, 45
  br i1 %516, label %517, label %524

; <label>:517:                                    ; preds = %514
  %518 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 5
  store i32 0, i32* %518, align 8
  %519 = load i32, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %520 = icmp eq i32 %519, 0
  br i1 %520, label %524, label %521

; <label>:521:                                    ; preds = %517
  store i32 0, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i64 0, i32 0), align 4
  %522 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %523 = tail call i64 @fwrite(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.157, i64 0, i64 0), i64 54, i64 1, %struct._IO_FILE* %522) #8
  br label %524

; <label>:524:                                    ; preds = %521, %517, %514
  %525 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 29
  %526 = load i32, i32* %525, align 8
  %527 = icmp eq i32 %526, 3
  br i1 %527, label %535, label %528

; <label>:528:                                    ; preds = %524
  %529 = tail call i64 @strlen(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0)) #10
  %530 = add i64 %529, -4
  %531 = getelementptr inbounds [300 x i8], [300 x i8]* @inPath, i64 0, i64 %530
  %532 = tail call i32 @strcmp(i8* %531, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.156, i64 0, i64 0)) #10
  %533 = icmp eq i32 %532, 0
  br i1 %533, label %534, label %535

; <label>:534:                                    ; preds = %528
  store i32 3, i32* %525, align 8
  br label %535

; <label>:535:                                    ; preds = %534, %528, %524
  %536 = icmp eq i32 %.037.ph.lcssa113, 0
  br i1 %536, label %539, label %537

; <label>:537:                                    ; preds = %535
  %538 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  store i32 2, i32* %538, align 8
  br label %544

; <label>:539:                                    ; preds = %535
  %540 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 8
  %541 = load i32, i32* %540, align 4
  %542 = icmp eq i32 %541, 3
  %543 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 1
  %.sink = select i1 %542, i32 1, i32 2
  store i32 %.sink, i32* %543, align 8
  br label %544

; <label>:544:                                    ; preds = %539, %537
  %545 = icmp eq i32 %.042.ph.lcssa122, 0
  br i1 %545, label %548, label %546

; <label>:546:                                    ; preds = %544
  %547 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 6
  store i32 %.042.ph.lcssa122, i32* %547, align 4
  br label %548

; <label>:548:                                    ; preds = %544, %546
  ret void
}

declare void @id3_inittag(%struct.ID3TAGDATA*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i64) local_unnamed_addr #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind readonly
declare double @atof(i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #7

attributes #0 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { argmemonly nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
