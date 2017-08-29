; ModuleID = 'parse.2.ll'
source_filename = "parse.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ID3TAGDATA = type { i32, i32, [31 x i8], [31 x i8], [31 x i8], [5 x i8], [31 x i8], [128 x i8], [1 x i8], i8 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [44 x i8] c"USAGE   :  %s [options] <infile> [outfile]\0A\00", align 1
@.str.2 = private unnamed_addr constant [66 x i8] c"\0A<infile> and/or <outfile> can be \22-\22, which means stdin/stdout.\0A\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"Try \22%s --help\22 for more information\0A\00", align 1
@stdout = external global %struct._IO_FILE*, align 8
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
@genre_last = external global i32, align 4
@genre_list = external global [0 x i8*], align 8
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
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_lame_usage = private constant [10 x i8] c"lame_usage"
@__profn_lame_help = private constant [9 x i8] c"lame_help"
@__profn_lame_presets_info = private constant [17 x i8] c"lame_presets_info"
@__profn_lame_parse_args = private constant [15 x i8] c"lame_parse_args"
@__profc_lame_usage = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6671710152969071081, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_usage, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i8*)* @lame_usage to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_help = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_help = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 253523698629200258, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_help, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i8*)* @lame_help to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_presets_info = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_presets_info = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 818462429074071690, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_presets_info, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i8*)* @lame_presets_info to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_parse_args = private global [114 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_parse_args = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3310654905539394678, i64 1616685993374, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i32, i8**)* @lame_parse_args to i8*), i8* null, i32 114, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00lame_usage\01lame_help\01lame_presets_info\01lame_parse_args", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_help to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_presets_info to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_parse_args to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @lame_usage(%struct.lame_global_flags*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_usage, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_usage, i64 0, i64 0)
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca i8*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @lame_print_version(%struct._IO_FILE* %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = load i8*, i8** %5, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i32 0, i32 0), i8* %10)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.2, i32 0, i32 0))
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = load i8*, i8** %5, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i32 0, i32 0), i8* %17)
  call void @exit(i32 1) #6
  unreachable
                                                  ; No predecessors!
  ret void
}

declare void @lame_print_version(%struct._IO_FILE*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: noinline nounwind uwtable
define void @lame_help(%struct.lame_global_flags*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_help, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_help, i64 0, i64 0)
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca i8*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  call void @lame_print_version(%struct._IO_FILE* %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %10 = load i8*, i8** %5, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i32 0, i32 0), i8* %10)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.2, i32 0, i32 0))
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0))
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i32 0, i32 0))
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.6, i32 0, i32 0))
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.7, i32 0, i32 0))
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.8, i32 0, i32 0))
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.9, i32 0, i32 0))
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.10, i32 0, i32 0))
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.11, i32 0, i32 0))
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.12, i32 0, i32 0))
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.13, i32 0, i32 0))
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.14, i32 0, i32 0))
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.15, i32 0, i32 0))
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.16, i32 0, i32 0))
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.17, i32 0, i32 0))
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %47 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.18, i32 0, i32 0))
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.19, i32 0, i32 0))
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.20, i32 0, i32 0))
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.21, i32 0, i32 0))
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.22, i32 0, i32 0))
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.23, i32 0, i32 0))
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.24, i32 0, i32 0))
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %63 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.25, i32 0, i32 0))
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %65 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.26, i32 0, i32 0))
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %67 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.27, i32 0, i32 0))
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %69 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.28, i32 0, i32 0))
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %71 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %70, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.29, i32 0, i32 0))
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %73 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %75 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.30, i32 0, i32 0))
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %77 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.31, i32 0, i32 0))
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.32, i32 0, i32 0))
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %81 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %80, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.33, i32 0, i32 0))
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %83 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %82, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %85 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %84, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.34, i32 0, i32 0))
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %87 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.35, i32 0, i32 0))
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %89 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %90 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %89, i32 0, i32 22
  %91 = load i32, i32* %90, align 4
  %92 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %88, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.36, i32 0, i32 0), i32 %91)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %94 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.37, i32 0, i32 0))
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %96 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %95, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.38, i32 0, i32 0))
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %98 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.39, i32 0, i32 0))
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %100 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %99, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.40, i32 0, i32 0))
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %102 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %101, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.41, i32 0, i32 0))
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %103, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %106 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.42, i32 0, i32 0))
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %108 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.43, i32 0, i32 0))
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %110 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %109, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.44, i32 0, i32 0))
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %112 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %111, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.45, i32 0, i32 0))
  %113 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %114 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %113, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.46, i32 0, i32 0))
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %115, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.47, i32 0, i32 0))
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %118 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %117, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.48, i32 0, i32 0))
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %120 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %119, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %122 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %121, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.49, i32 0, i32 0))
  %123 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %124 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %123, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.50, i32 0, i32 0))
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %126 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.51, i32 0, i32 0))
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %128 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %127, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.52, i32 0, i32 0))
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %130 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %129, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.53, i32 0, i32 0))
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %132 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %131, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.54, i32 0, i32 0))
  %133 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %134 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %133, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.55, i32 0, i32 0))
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %136 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.56, i32 0, i32 0))
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %138 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %137, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.57, i32 0, i32 0))
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %140 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %139, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.58, i32 0, i32 0))
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  call void @display_bitrates(%struct._IO_FILE* %143)
  call void @exit(i32 0) #6
  unreachable
                                                  ; No predecessors!
  ret void
}

declare void @display_bitrates(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define void @lame_presets_info(%struct.lame_global_flags*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_presets_info, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_presets_info, i64 0, i64 0)
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca i8*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  call void @lame_print_version(%struct._IO_FILE* %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.59, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.60, i32 0, i32 0))
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.61, i32 0, i32 0))
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.62, i32 0, i32 0))
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.63, i32 0, i32 0))
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.64, i32 0, i32 0))
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.65, i32 0, i32 0))
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.66, i32 0, i32 0))
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.67, i32 0, i32 0))
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.68, i32 0, i32 0))
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.69, i32 0, i32 0))
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.70, i32 0, i32 0))
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.71, i32 0, i32 0))
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.72, i32 0, i32 0))
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.73, i32 0, i32 0))
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.74, i32 0, i32 0))
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.75, i32 0, i32 0))
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.76, i32 0, i32 0))
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %50 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.66, i32 0, i32 0))
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.67, i32 0, i32 0))
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.77, i32 0, i32 0))
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.69, i32 0, i32 0))
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %58 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.78, i32 0, i32 0))
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.79, i32 0, i32 0))
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.80, i32 0, i32 0))
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.81, i32 0, i32 0))
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %68 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.82, i32 0, i32 0))
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.83, i32 0, i32 0))
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %72 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.84, i32 0, i32 0))
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %74 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %73, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.85, i32 0, i32 0))
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %76 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %75, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.86, i32 0, i32 0))
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %78 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.87, i32 0, i32 0))
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %80 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %79, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.88, i32 0, i32 0))
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %82 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.79, i32 0, i32 0))
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %84 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %83, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %86 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %85, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.89, i32 0, i32 0))
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %88 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %87, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.76, i32 0, i32 0))
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %90 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %89, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.90, i32 0, i32 0))
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %92 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %91, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.91, i32 0, i32 0))
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %94 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.85, i32 0, i32 0))
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %96 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %95, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.92, i32 0, i32 0))
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %98 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.87, i32 0, i32 0))
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %100 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %99, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.88, i32 0, i32 0))
  %101 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %102 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %101, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.79, i32 0, i32 0))
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %103, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %106 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.93, i32 0, i32 0))
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %108 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.94, i32 0, i32 0))
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %110 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %109, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.90, i32 0, i32 0))
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %112 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %111, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.91, i32 0, i32 0))
  %113 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %114 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %113, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.95, i32 0, i32 0))
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %115, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.85, i32 0, i32 0))
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %118 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %117, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.96, i32 0, i32 0))
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %120 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %119, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.87, i32 0, i32 0))
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %122 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %121, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.97, i32 0, i32 0))
  %123 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %124 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %123, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.98, i32 0, i32 0))
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %126 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %125, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %128 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %127, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.99, i32 0, i32 0))
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %130 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %129, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.95, i32 0, i32 0))
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %132 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %131, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.100, i32 0, i32 0))
  %133 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %134 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %133, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.101, i32 0, i32 0))
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %136 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.102, i32 0, i32 0))
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %138 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %137, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.103, i32 0, i32 0))
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %140 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %139, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.104, i32 0, i32 0))
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %143 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %144 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %143, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.105, i32 0, i32 0))
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %146 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %145, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.95, i32 0, i32 0))
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %148 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %147, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.100, i32 0, i32 0))
  %149 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %150 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %149, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.106, i32 0, i32 0))
  %151 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %152 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %151, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.107, i32 0, i32 0))
  %153 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %154 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %153, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.108, i32 0, i32 0))
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %156 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %155, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.109, i32 0, i32 0))
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %158 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %157, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 0) #6
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @lame_parse_args(%struct.lame_global_flags*, i32, i8**) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 107)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 107)
  %5 = alloca %struct.lame_global_flags*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8**, align 8
  %8 = alloca float, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i8, align 1
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8** %2, i8*** %7, align 8
  store i32 0, i32* %9, align 4
  store i32 0, i32* %10, align 4
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  %20 = load i8**, i8*** %7, align 8
  %21 = getelementptr inbounds i8*, i8** %20, i64 0
  %22 = load i8*, i8** %21, align 8
  store i8* %22, i8** %13, align 8
  store i32 0, i32* %14, align 4
  store i8 0, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  store i8 0, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %23 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %23, i32 0, i32 31
  store i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i32 0, i32 0), i8** %24, align 8
  %25 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %25, i32 0, i32 32
  store i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i32 0, i32 0), i8** %26, align 8
  call void @id3_inittag(%struct.ID3TAGDATA* @id3tag)
  store i32 0, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  br label %27

; <label>:27:                                     ; preds = %1061, %3
  %28 = load i32, i32* %10, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %10, align 4
  %30 = load i32, i32* %6, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %33, label %._crit_edge3

._crit_edge3:                                     ; preds = %27
  %pgocount11 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 3)
  %32 = add i64 %pgocount11, 1
  store i64 %32, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 3)
  br label %36

; <label>:33:                                     ; preds = %27
  %34 = load i32, i32* %9, align 4
  %35 = icmp eq i32 %34, 0
  br label %36

; <label>:36:                                     ; preds = %33, %._crit_edge3
  %37 = phi i1 [ false, %._crit_edge3 ], [ %35, %33 ]
  br i1 %37, label %38, label %1062

; <label>:38:                                     ; preds = %36
  %39 = load i8**, i8*** %7, align 8
  %40 = load i32, i32* %10, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8*, i8** %39, i64 %41
  %43 = load i8*, i8** %42, align 8
  store i8* %43, i8** %16, align 8
  %44 = load i8*, i8** %16, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %16, align 8
  %46 = load i8, i8* %44, align 1
  %47 = sext i8 %46 to i32
  %48 = icmp eq i32 %47, 45
  br i1 %48, label %49, label %1025

; <label>:49:                                     ; preds = %38
  %50 = load i32, i32* %10, align 4
  %51 = add nsw i32 %50, 1
  %52 = load i32, i32* %6, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %61

; <label>:54:                                     ; preds = %49
  %55 = load i8**, i8*** %7, align 8
  %56 = load i32, i32* %10, align 4
  %57 = add nsw i32 %56, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8*, i8** %55, i64 %58
  %60 = load i8*, i8** %59, align 8
  store i8* %60, i8** %18, align 8
  br label %63

; <label>:61:                                     ; preds = %49
  %pgocount12 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 10)
  %62 = add i64 %pgocount12, 1
  store i64 %62, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 10)
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.110, i32 0, i32 0), i8** %18, align 8
  br label %63

; <label>:63:                                     ; preds = %61, %54
  store i32 0, i32* %19, align 4
  %64 = load i8*, i8** %16, align 8
  %65 = load i8, i8* %64, align 1
  %66 = icmp ne i8 %65, 0
  br i1 %66, label %94, label %67

; <label>:67:                                     ; preds = %63
  %68 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %69 = sext i8 %68 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %79

; <label>:71:                                     ; preds = %67
  %pgocount13 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 43)
  %72 = add i64 %pgocount13, 1
  store i64 %72, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 43)
  %73 = load i8**, i8*** %7, align 8
  %74 = load i32, i32* %10, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8*, i8** %73, i64 %75
  %77 = load i8*, i8** %76, align 8
  %78 = call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i32 0, i32 0), i8* %77, i64 300) #5
  br label %93

; <label>:79:                                     ; preds = %67
  %pgocount14 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 53)
  %80 = add i64 %pgocount14, 1
  store i64 %80, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 53)
  %81 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %82 = sext i8 %81 to i32
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %85, label %._crit_edge10

._crit_edge10:                                    ; preds = %79
  %pgocount15 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 85)
  %84 = add i64 %pgocount15, 1
  store i64 %84, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 85)
  br label %92

; <label>:85:                                     ; preds = %79
  %86 = load i8**, i8*** %7, align 8
  %87 = load i32, i32* %10, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8*, i8** %86, i64 %88
  %90 = load i8*, i8** %89, align 8
  %91 = call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i32 0, i32 0), i8* %90, i64 300) #5
  br label %92

; <label>:92:                                     ; preds = %85, %._crit_edge10
  br label %93

; <label>:93:                                     ; preds = %92, %71
  br label %94

; <label>:94:                                     ; preds = %93, %63
  %95 = load i8*, i8** %16, align 8
  %96 = load i8, i8* %95, align 1
  %97 = sext i8 %96 to i32
  %98 = icmp eq i32 %97, 45
  br i1 %98, label %99, label %667

; <label>:99:                                     ; preds = %94
  %100 = load i8*, i8** %16, align 8
  %101 = getelementptr inbounds i8, i8* %100, i32 1
  store i8* %101, i8** %16, align 8
  %102 = load i8*, i8** %16, align 8
  %103 = call i32 @strcmp(i8* %102, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.111, i32 0, i32 0)) #7
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %123

; <label>:105:                                    ; preds = %99
  store i32 1, i32* %19, align 4
  %106 = load i8*, i8** %18, align 8
  %107 = call double @atof(i8* %106) #7
  %108 = fptrunc double %107 to float
  store float %108, float* %8, align 4
  %109 = load float, float* %8, align 4
  %110 = fpext float %109 to double
  %111 = fmul double 1.000000e+03, %110
  %112 = fadd double %111, 5.000000e-01
  %113 = fptosi double %112 to i32
  %114 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %115 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %114, i32 0, i32 3
  store i32 %113, i32* %115, align 8
  %116 = load float, float* %8, align 4
  %117 = fcmp olt float %116, 1.000000e+00
  br i1 %117, label %118, label %122

; <label>:118:                                    ; preds = %105
  %pgocount16 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 105)
  %119 = add i64 %pgocount16, 1
  store i64 %119, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 105)
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %121 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %120, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.112, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:122:                                    ; preds = %105
  br label %662

; <label>:123:                                    ; preds = %99
  %124 = load i8*, i8** %16, align 8
  %125 = call i32 @strcmp(i8* %124, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.113, i32 0, i32 0)) #7
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %131

; <label>:127:                                    ; preds = %123
  %pgocount17 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 4)
  %128 = add i64 %pgocount17, 1
  store i64 %128, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 4)
  %129 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %130 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %129, i32 0, i32 29
  store i32 3, i32* %130, align 8
  br label %661

; <label>:131:                                    ; preds = %123
  %132 = load i8*, i8** %16, align 8
  %133 = call i32 @strcmp(i8* %132, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.114, i32 0, i32 0)) #7
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %135, label %143

; <label>:135:                                    ; preds = %131
  %pgocount18 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 51)
  %136 = add i64 %pgocount18, 1
  store i64 %136, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 51)
  %137 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %138 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %137, i32 0, i32 25
  store i32 12000, i32* %138, align 8
  %139 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %140 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %139, i32 0, i32 24
  store i32 160, i32* %140, align 4
  %141 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %142 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %141, i32 0, i32 37
  store i32 1, i32* %142, align 8
  br label %659

; <label>:143:                                    ; preds = %131
  %144 = load i8*, i8** %16, align 8
  %145 = call i32 @strcmp(i8* %144, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.115, i32 0, i32 0)) #7
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %147, label %150

; <label>:147:                                    ; preds = %143
  %148 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %149 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %148, i32 0, i32 37
  store i32 1, i32* %149, align 8
  br label %658

; <label>:150:                                    ; preds = %143
  %151 = load i8*, i8** %16, align 8
  %152 = call i32 @strcmp(i8* %151, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.116, i32 0, i32 0)) #7
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %154, label %157

; <label>:154:                                    ; preds = %150
  %155 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %156 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %155, i32 0, i32 34
  store i32 1, i32* %156, align 4
  br label %656

; <label>:157:                                    ; preds = %150
  %158 = load i8*, i8** %16, align 8
  %159 = call i32 @strcmp(i8* %158, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.117, i32 0, i32 0)) #7
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %161, label %166

; <label>:161:                                    ; preds = %157
  %162 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %163 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %162, i32 0, i32 17
  store i32 1, i32* %163, align 8
  %164 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %165 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %164, i32 0, i32 44
  store i32 0, i32* %165, align 4
  br label %654

; <label>:166:                                    ; preds = %157
  %167 = load i8*, i8** %16, align 8
  %168 = call i32 @strcmp(i8* %167, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.118, i32 0, i32 0)) #7
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %174

; <label>:170:                                    ; preds = %166
  %pgocount19 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 44)
  %171 = add i64 %pgocount19, 1
  store i64 %171, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 44)
  %172 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %173 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %172, i32 0, i32 33
  store i32 1, i32* %173, align 8
  br label %653

; <label>:174:                                    ; preds = %166
  %175 = load i8*, i8** %16, align 8
  %176 = call i32 @strcmp(i8* %175, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.119, i32 0, i32 0)) #7
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %178, label %180

; <label>:178:                                    ; preds = %174
  %pgocount20 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 65)
  %179 = add i64 %pgocount20, 1
  store i64 %179, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 65)
  br label %652

; <label>:180:                                    ; preds = %174
  %181 = load i8*, i8** %16, align 8
  %182 = call i32 @strcmp(i8* %181, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.120, i32 0, i32 0)) #7
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %184, label %188

; <label>:184:                                    ; preds = %180
  %pgocount21 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 73)
  %185 = add i64 %pgocount21, 1
  store i64 %185, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 73)
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  store i32 1, i32* %19, align 4
  %186 = load i8*, i8** %18, align 8
  %187 = call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 2, i32 0), i8* %186, i64 30) #5
  br label %651

; <label>:188:                                    ; preds = %180
  %189 = load i8*, i8** %16, align 8
  %190 = call i32 @strcmp(i8* %189, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.121, i32 0, i32 0)) #7
  %191 = icmp eq i32 %190, 0
  br i1 %191, label %192, label %196

; <label>:192:                                    ; preds = %188
  %pgocount22 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 76)
  %193 = add i64 %pgocount22, 1
  store i64 %193, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 76)
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  store i32 1, i32* %19, align 4
  %194 = load i8*, i8** %18, align 8
  %195 = call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 3, i32 0), i8* %194, i64 30) #5
  br label %650

; <label>:196:                                    ; preds = %188
  %197 = load i8*, i8** %16, align 8
  %198 = call i32 @strcmp(i8* %197, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.122, i32 0, i32 0)) #7
  %199 = icmp eq i32 %198, 0
  br i1 %199, label %200, label %204

; <label>:200:                                    ; preds = %196
  %pgocount23 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 78)
  %201 = add i64 %pgocount23, 1
  store i64 %201, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 78)
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  store i32 1, i32* %19, align 4
  %202 = load i8*, i8** %18, align 8
  %203 = call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 4, i32 0), i8* %202, i64 30) #5
  br label %649

; <label>:204:                                    ; preds = %196
  %205 = load i8*, i8** %16, align 8
  %206 = call i32 @strcmp(i8* %205, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.123, i32 0, i32 0)) #7
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %212

; <label>:208:                                    ; preds = %204
  %pgocount24 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 80)
  %209 = add i64 %pgocount24, 1
  store i64 %209, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 80)
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  store i32 1, i32* %19, align 4
  %210 = load i8*, i8** %18, align 8
  %211 = call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 5, i32 0), i8* %210, i64 4) #5
  br label %648

; <label>:212:                                    ; preds = %204
  %213 = load i8*, i8** %16, align 8
  %214 = call i32 @strcmp(i8* %213, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.124, i32 0, i32 0)) #7
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %216, label %220

; <label>:216:                                    ; preds = %212
  %pgocount25 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 81)
  %217 = add i64 %pgocount25, 1
  store i64 %217, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 81)
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  store i32 1, i32* %19, align 4
  %218 = load i8*, i8** %18, align 8
  %219 = call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 6, i32 0), i8* %218, i64 30) #5
  br label %647

; <label>:220:                                    ; preds = %212
  %221 = load i8*, i8** %16, align 8
  %222 = call i32 @strcmp(i8* %221, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.125, i32 0, i32 0)) #7
  %223 = icmp eq i32 %222, 0
  br i1 %223, label %224, label %240

; <label>:224:                                    ; preds = %220
  %pgocount26 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 82)
  %225 = add i64 %pgocount26, 1
  store i64 %225, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 82)
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  store i32 1, i32* %19, align 4
  %226 = load i8*, i8** %18, align 8
  %227 = call i32 @atoi(i8* %226) #7
  store i32 %227, i32* %14, align 4
  %228 = load i32, i32* %14, align 4
  %229 = icmp slt i32 %228, 1
  br i1 %229, label %230, label %232

; <label>:230:                                    ; preds = %224
  %pgocount27 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 87)
  %231 = add i64 %pgocount27, 1
  store i64 %231, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 87)
  store i32 1, i32* %14, align 4
  br label %232

; <label>:232:                                    ; preds = %230, %224
  %233 = load i32, i32* %14, align 4
  %234 = icmp sgt i32 %233, 99
  br i1 %234, label %235, label %237

; <label>:235:                                    ; preds = %232
  %pgocount28 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 84)
  %236 = add i64 %pgocount28, 1
  store i64 %236, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 84)
  store i32 99, i32* %14, align 4
  br label %237

; <label>:237:                                    ; preds = %235, %232
  %238 = load i32, i32* %14, align 4
  %239 = trunc i32 %238 to i8
  store i8 %239, i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 9), align 2
  br label %646

; <label>:240:                                    ; preds = %220
  %241 = load i8*, i8** %16, align 8
  %242 = call i32 @strcmp(i8* %241, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.126, i32 0, i32 0)) #7
  %243 = icmp eq i32 %242, 0
  br i1 %243, label %244, label %289

; <label>:244:                                    ; preds = %240
  %245 = load i8*, i8** %18, align 8
  %246 = call i64 @strtol(i8* %245, i8** %16, i32 10) #5
  %247 = trunc i64 %246 to i32
  store i32 %247, i32* %19, align 4
  %248 = load i8*, i8** %18, align 8
  %249 = load i8*, i8** %16, align 8
  %250 = icmp eq i8* %248, %249
  br i1 %250, label %251, label %273

; <label>:251:                                    ; preds = %244
  store i32 0, i32* %19, align 4
  br label %252

; <label>:252:                                    ; preds = %267, %251
  %253 = load i32, i32* %19, align 4
  %254 = load i32, i32* @genre_last, align 4
  %255 = icmp sle i32 %253, %254
  br i1 %255, label %256, label %271

; <label>:256:                                    ; preds = %252
  %257 = load i32, i32* %19, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [0 x i8*], [0 x i8*]* @genre_list, i64 0, i64 %258
  %260 = load i8*, i8** %259, align 8
  %261 = load i8*, i8** %18, align 8
  %262 = call i32 @strcmp(i8* %260, i8* %261) #7
  %263 = icmp ne i32 %262, 0
  br i1 %263, label %266, label %264

; <label>:264:                                    ; preds = %256
  %pgocount29 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 92)
  %265 = add i64 %pgocount29, 1
  store i64 %265, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 92)
  br label %271

; <label>:266:                                    ; preds = %256
  br label %267

; <label>:267:                                    ; preds = %266
  %pgocount30 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 79)
  %268 = add i64 %pgocount30, 1
  store i64 %268, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 79)
  %269 = load i32, i32* %19, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, i32* %19, align 4
  br label %252

; <label>:271:                                    ; preds = %264, %252
  %pgocount31 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 90)
  %272 = add i64 %pgocount31, 1
  store i64 %272, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 90)
  br label %273

; <label>:273:                                    ; preds = %271, %244
  %274 = load i32, i32* %19, align 4
  %275 = load i32, i32* @genre_last, align 4
  %276 = icmp sgt i32 %274, %275
  br i1 %276, label %277, label %282

; <label>:277:                                    ; preds = %273
  %pgocount32 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 88)
  %278 = add i64 %pgocount32, 1
  store i64 %278, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 88)
  store i32 255, i32* %19, align 4
  %279 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %280 = load i8*, i8** %18, align 8
  %281 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %279, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.127, i32 0, i32 0), i8* %280)
  br label %282

; <label>:282:                                    ; preds = %277, %273
  %pgocount33 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 83)
  %283 = add i64 %pgocount33, 1
  store i64 %283, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 83)
  %284 = load i32, i32* %19, align 4
  %285 = and i32 %284, 255
  store i32 %285, i32* %19, align 4
  %286 = load i32, i32* %19, align 4
  %287 = trunc i32 %286 to i8
  store i8 %287, i8* %15, align 1
  store i32 1, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  store i32 1, i32* %19, align 4
  %288 = call i8* @strncpy(i8* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 8, i32 0), i8* %15, i64 1) #5
  br label %645

; <label>:289:                                    ; preds = %240
  %290 = load i8*, i8** %16, align 8
  %291 = call i32 @strcmp(i8* %290, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.128, i32 0, i32 0)) #7
  %292 = icmp eq i32 %291, 0
  br i1 %292, label %293, label %311

; <label>:293:                                    ; preds = %289
  store i32 1, i32* %19, align 4
  %294 = load i8*, i8** %18, align 8
  %295 = call double @atof(i8* %294) #7
  %296 = fmul double 1.000000e+03, %295
  %297 = fadd double %296, 5.000000e-01
  %298 = fptosi double %297 to i32
  %299 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %300 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %299, i32 0, i32 25
  store i32 %298, i32* %300, align 8
  %301 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %302 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %301, i32 0, i32 25
  %303 = load i32, i32* %302, align 8
  %304 = icmp slt i32 %303, 1
  br i1 %304, label %305, label %309

; <label>:305:                                    ; preds = %293
  %pgocount34 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 108)
  %306 = add i64 %pgocount34, 1
  store i64 %306, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 108)
  %307 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %308 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %307, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.129, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:309:                                    ; preds = %293
  %pgocount35 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 86)
  %310 = add i64 %pgocount35, 1
  store i64 %310, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 86)
  br label %644

; <label>:311:                                    ; preds = %289
  %312 = load i8*, i8** %16, align 8
  %313 = call i32 @strcmp(i8* %312, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.130, i32 0, i32 0)) #7
  %314 = icmp eq i32 %313, 0
  br i1 %314, label %315, label %333

; <label>:315:                                    ; preds = %311
  store i32 1, i32* %19, align 4
  %316 = load i8*, i8** %18, align 8
  %317 = call double @atof(i8* %316) #7
  %318 = fmul double 1.000000e+03, %317
  %319 = fadd double %318, 5.000000e-01
  %320 = fptosi double %319 to i32
  %321 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %322 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %321, i32 0, i32 27
  store i32 %320, i32* %322, align 8
  %323 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %324 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %323, i32 0, i32 27
  %325 = load i32, i32* %324, align 8
  %326 = icmp slt i32 %325, 0
  br i1 %326, label %327, label %331

; <label>:327:                                    ; preds = %315
  %pgocount36 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 109)
  %328 = add i64 %pgocount36, 1
  store i64 %328, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 109)
  %329 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %330 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %329, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.131, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:331:                                    ; preds = %315
  %pgocount37 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 89)
  %332 = add i64 %pgocount37, 1
  store i64 %332, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 89)
  br label %643

; <label>:333:                                    ; preds = %311
  %334 = load i8*, i8** %16, align 8
  %335 = call i32 @strcmp(i8* %334, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.132, i32 0, i32 0)) #7
  %336 = icmp eq i32 %335, 0
  br i1 %336, label %337, label %355

; <label>:337:                                    ; preds = %333
  store i32 1, i32* %19, align 4
  %338 = load i8*, i8** %18, align 8
  %339 = call double @atof(i8* %338) #7
  %340 = fmul double 1.000000e+03, %339
  %341 = fadd double %340, 5.000000e-01
  %342 = fptosi double %341 to i32
  %343 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %344 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %343, i32 0, i32 26
  store i32 %342, i32* %344, align 4
  %345 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %346 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %345, i32 0, i32 26
  %347 = load i32, i32* %346, align 4
  %348 = icmp slt i32 %347, 1
  br i1 %348, label %349, label %353

; <label>:349:                                    ; preds = %337
  %pgocount38 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 110)
  %350 = add i64 %pgocount38, 1
  store i64 %350, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 110)
  %351 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %352 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %351, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.133, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:353:                                    ; preds = %337
  %pgocount39 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 91)
  %354 = add i64 %pgocount39, 1
  store i64 %354, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 91)
  br label %642

; <label>:355:                                    ; preds = %333
  %356 = load i8*, i8** %16, align 8
  %357 = call i32 @strcmp(i8* %356, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.134, i32 0, i32 0)) #7
  %358 = icmp eq i32 %357, 0
  br i1 %358, label %359, label %377

; <label>:359:                                    ; preds = %355
  store i32 1, i32* %19, align 4
  %360 = load i8*, i8** %18, align 8
  %361 = call double @atof(i8* %360) #7
  %362 = fmul double 1.000000e+03, %361
  %363 = fadd double %362, 5.000000e-01
  %364 = fptosi double %363 to i32
  %365 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %366 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %365, i32 0, i32 28
  store i32 %364, i32* %366, align 4
  %367 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %368 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %367, i32 0, i32 28
  %369 = load i32, i32* %368, align 4
  %370 = icmp slt i32 %369, 0
  br i1 %370, label %371, label %375

; <label>:371:                                    ; preds = %359
  %pgocount40 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 111)
  %372 = add i64 %pgocount40, 1
  store i64 %372, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 111)
  %373 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %374 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %373, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.135, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:375:                                    ; preds = %359
  %pgocount41 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 93)
  %376 = add i64 %pgocount41, 1
  store i64 %376, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 93)
  br label %641

; <label>:377:                                    ; preds = %355
  %378 = load i8*, i8** %16, align 8
  %379 = call i32 @strcmp(i8* %378, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.136, i32 0, i32 0)) #7
  %380 = icmp eq i32 %379, 0
  br i1 %380, label %381, label %397

; <label>:381:                                    ; preds = %377
  store i32 1, i32* %19, align 4
  %382 = load i8*, i8** %18, align 8
  %383 = call double @atof(i8* %382) #7
  %384 = fptrunc double %383 to float
  %385 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %386 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %385, i32 0, i32 35
  store float %384, float* %386, align 8
  %387 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %388 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %387, i32 0, i32 35
  %389 = load float, float* %388, align 8
  %390 = fcmp ole float %389, 0.000000e+00
  br i1 %390, label %391, label %395

; <label>:391:                                    ; preds = %381
  %pgocount42 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 112)
  %392 = add i64 %pgocount42, 1
  store i64 %392, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 112)
  %393 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %394 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %393, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.137, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:395:                                    ; preds = %381
  %pgocount43 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 96)
  %396 = add i64 %pgocount43, 1
  store i64 %396, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 96)
  br label %640

; <label>:397:                                    ; preds = %377
  %398 = load i8*, i8** %16, align 8
  %399 = call i32 @strcmp(i8* %398, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.138, i32 0, i32 0)) #7
  %400 = icmp eq i32 %399, 0
  br i1 %400, label %406, label %401

; <label>:401:                                    ; preds = %397
  %pgocount44 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 94)
  %402 = add i64 %pgocount44, 1
  store i64 %402, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 94)
  %403 = load i8*, i8** %16, align 8
  %404 = call i32 @strcmp(i8* %403, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.139, i32 0, i32 0)) #7
  %405 = icmp eq i32 %404, 0
  br i1 %405, label %406, label %410

; <label>:406:                                    ; preds = %401, %397
  %pgocount45 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 95)
  %407 = add i64 %pgocount45, 1
  store i64 %407, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 95)
  %408 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %409 = load i8*, i8** %13, align 8
  call void @lame_help(%struct.lame_global_flags* %408, i8* %409)
  br label %639

; <label>:410:                                    ; preds = %401
  %411 = load i8*, i8** %16, align 8
  %412 = call i32 @strcmp(i8* %411, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.140, i32 0, i32 0)) #7
  %413 = icmp eq i32 %412, 0
  br i1 %413, label %414, label %632

; <label>:414:                                    ; preds = %410
  store i32 1, i32* %19, align 4
  %415 = load i8*, i8** %18, align 8
  %416 = call i32 @strcmp(i8* %415, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.141, i32 0, i32 0)) #7
  %417 = icmp eq i32 %416, 0
  br i1 %417, label %418, label %446

; <label>:418:                                    ; preds = %414
  %pgocount46 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 98)
  %419 = add i64 %pgocount46, 1
  store i64 %419, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 98)
  %420 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %421 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %420, i32 0, i32 11
  store i32 16, i32* %421, align 8
  %422 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %423 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %422, i32 0, i32 26
  store i32 260, i32* %423, align 4
  %424 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %425 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %424, i32 0, i32 28
  store i32 40, i32* %425, align 4
  %426 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %427 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %426, i32 0, i32 25
  store i32 3700, i32* %427, align 8
  %428 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %429 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %428, i32 0, i32 27
  store i32 300, i32* %429, align 8
  %430 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %431 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %430, i32 0, i32 22
  store i32 5, i32* %431, align 4
  %432 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %433 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %432, i32 0, i32 23
  store i32 8, i32* %433, align 8
  %434 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %435 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %434, i32 0, i32 24
  store i32 56, i32* %435, align 4
  %436 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %437 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %436, i32 0, i32 37
  store i32 1, i32* %437, align 8
  %438 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %439 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %438, i32 0, i32 3
  store i32 16000, i32* %439, align 8
  %440 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %441 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %440, i32 0, i32 8
  store i32 3, i32* %441, align 4
  %442 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %443 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %442, i32 0, i32 9
  store i32 1, i32* %443, align 8
  %444 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %445 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %444, i32 0, i32 6
  store i32 5, i32* %445, align 4
  br label %631

; <label>:446:                                    ; preds = %414
  %447 = load i8*, i8** %18, align 8
  %448 = call i32 @strcmp(i8* %447, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.114, i32 0, i32 0)) #7
  %449 = icmp eq i32 %448, 0
  br i1 %449, label %450, label %478

; <label>:450:                                    ; preds = %446
  %pgocount47 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 99)
  %451 = add i64 %pgocount47, 1
  store i64 %451, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 99)
  %452 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %453 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %452, i32 0, i32 11
  store i32 56, i32* %453, align 8
  %454 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %455 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %454, i32 0, i32 26
  store i32 100, i32* %455, align 4
  %456 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %457 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %456, i32 0, i32 28
  store i32 20, i32* %457, align 4
  %458 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %459 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %458, i32 0, i32 27
  store i32 2000, i32* %459, align 8
  %460 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %461 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %460, i32 0, i32 25
  store i32 11000, i32* %461, align 8
  %462 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %463 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %462, i32 0, i32 22
  store i32 4, i32* %463, align 4
  %464 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %465 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %464, i32 0, i32 23
  store i32 8, i32* %465, align 8
  %466 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %467 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %466, i32 0, i32 24
  store i32 96, i32* %467, align 4
  %468 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %469 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %468, i32 0, i32 37
  store i32 1, i32* %469, align 8
  %470 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %471 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %470, i32 0, i32 8
  store i32 3, i32* %471, align 4
  %472 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %473 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %472, i32 0, i32 9
  store i32 1, i32* %473, align 8
  %474 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %475 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %474, i32 0, i32 3
  store i32 24000, i32* %475, align 8
  %476 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %477 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %476, i32 0, i32 6
  store i32 5, i32* %477, align 4
  br label %630

; <label>:478:                                    ; preds = %446
  %479 = load i8*, i8** %18, align 8
  %480 = call i32 @strcmp(i8* %479, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.142, i32 0, i32 0)) #7
  %481 = icmp eq i32 %480, 0
  br i1 %481, label %482, label %506

; <label>:482:                                    ; preds = %478
  %pgocount48 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 100)
  %483 = add i64 %pgocount48, 1
  store i64 %483, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 100)
  %484 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %485 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %484, i32 0, i32 11
  store i32 96, i32* %485, align 8
  %486 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %487 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %486, i32 0, i32 26
  store i32 30, i32* %487, align 4
  %488 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %489 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %488, i32 0, i32 28
  store i32 0, i32* %489, align 4
  %490 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %491 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %490, i32 0, i32 25
  store i32 15000, i32* %491, align 8
  %492 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %493 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %492, i32 0, i32 27
  store i32 0, i32* %493, align 8
  %494 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %495 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %494, i32 0, i32 22
  store i32 4, i32* %495, align 4
  %496 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %497 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %496, i32 0, i32 23
  store i32 32, i32* %497, align 8
  %498 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %499 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %498, i32 0, i32 24
  store i32 192, i32* %499, align 4
  %500 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %501 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %500, i32 0, i32 8
  store i32 1, i32* %501, align 4
  %502 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %503 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %502, i32 0, i32 9
  store i32 1, i32* %503, align 8
  %504 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %505 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %504, i32 0, i32 6
  store i32 5, i32* %505, align 4
  br label %629

; <label>:506:                                    ; preds = %478
  %507 = load i8*, i8** %18, align 8
  %508 = call i32 @strcmp(i8* %507, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.143, i32 0, i32 0)) #7
  %509 = icmp eq i32 %508, 0
  br i1 %509, label %510, label %534

; <label>:510:                                    ; preds = %506
  %pgocount49 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 101)
  %511 = add i64 %pgocount49, 1
  store i64 %511, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 101)
  %512 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %513 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %512, i32 0, i32 11
  store i32 128, i32* %513, align 8
  %514 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %515 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %514, i32 0, i32 26
  store i32 15, i32* %515, align 4
  %516 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %517 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %516, i32 0, i32 28
  store i32 15, i32* %517, align 4
  %518 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %519 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %518, i32 0, i32 25
  store i32 17000, i32* %519, align 8
  %520 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %521 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %520, i32 0, i32 27
  store i32 2000, i32* %521, align 8
  %522 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %523 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %522, i32 0, i32 22
  store i32 4, i32* %523, align 4
  %524 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %525 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %524, i32 0, i32 23
  store i32 32, i32* %525, align 8
  %526 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %527 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %526, i32 0, i32 24
  store i32 192, i32* %527, align 4
  %528 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %529 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %528, i32 0, i32 8
  store i32 1, i32* %529, align 4
  %530 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %531 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %530, i32 0, i32 9
  store i32 1, i32* %531, align 8
  %532 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %533 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %532, i32 0, i32 6
  store i32 5, i32* %533, align 4
  br label %628

; <label>:534:                                    ; preds = %506
  %535 = load i8*, i8** %18, align 8
  %536 = call i32 @strcmp(i8* %535, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.144, i32 0, i32 0)) #7
  %537 = icmp eq i32 %536, 0
  br i1 %537, label %538, label %562

; <label>:538:                                    ; preds = %534
  %pgocount50 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 102)
  %539 = add i64 %pgocount50, 1
  store i64 %539, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 102)
  %540 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %541 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %540, i32 0, i32 11
  store i32 160, i32* %541, align 8
  %542 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %543 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %542, i32 0, i32 26
  store i32 15, i32* %543, align 4
  %544 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %545 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %544, i32 0, i32 28
  store i32 15, i32* %545, align 4
  %546 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %547 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %546, i32 0, i32 25
  store i32 20000, i32* %547, align 8
  %548 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %549 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %548, i32 0, i32 27
  store i32 3000, i32* %549, align 8
  %550 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %551 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %550, i32 0, i32 22
  store i32 3, i32* %551, align 4
  %552 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %553 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %552, i32 0, i32 23
  store i32 32, i32* %553, align 8
  %554 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %555 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %554, i32 0, i32 24
  store i32 224, i32* %555, align 4
  %556 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %557 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %556, i32 0, i32 8
  store i32 1, i32* %557, align 4
  %558 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %559 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %558, i32 0, i32 9
  store i32 1, i32* %559, align 8
  %560 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %561 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %560, i32 0, i32 6
  store i32 2, i32* %561, align 4
  br label %627

; <label>:562:                                    ; preds = %534
  %563 = load i8*, i8** %18, align 8
  %564 = call i32 @strcmp(i8* %563, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.145, i32 0, i32 0)) #7
  %565 = icmp eq i32 %564, 0
  br i1 %565, label %566, label %586

; <label>:566:                                    ; preds = %562
  %pgocount51 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 104)
  %567 = add i64 %pgocount51, 1
  store i64 %567, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 104)
  %568 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %569 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %568, i32 0, i32 11
  store i32 192, i32* %569, align 8
  %570 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %571 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %570, i32 0, i32 25
  store i32 -1, i32* %571, align 8
  %572 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %573 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %572, i32 0, i32 26
  store i32 -1, i32* %573, align 4
  %574 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %575 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %574, i32 0, i32 22
  store i32 2, i32* %575, align 4
  %576 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %577 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %576, i32 0, i32 23
  store i32 80, i32* %577, align 8
  %578 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %579 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %578, i32 0, i32 24
  store i32 256, i32* %579, align 4
  %580 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %581 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %580, i32 0, i32 8
  store i32 0, i32* %581, align 4
  %582 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %583 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %582, i32 0, i32 9
  store i32 1, i32* %583, align 8
  %584 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %585 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %584, i32 0, i32 6
  store i32 2, i32* %585, align 4
  br label %626

; <label>:586:                                    ; preds = %562
  %587 = load i8*, i8** %18, align 8
  %588 = call i32 @strcmp(i8* %587, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.146, i32 0, i32 0)) #7
  %589 = icmp eq i32 %588, 0
  br i1 %589, label %590, label %610

; <label>:590:                                    ; preds = %586
  %pgocount52 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 106)
  %591 = add i64 %pgocount52, 1
  store i64 %591, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 106)
  %592 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %593 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %592, i32 0, i32 11
  store i32 256, i32* %593, align 8
  %594 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %595 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %594, i32 0, i32 25
  store i32 -1, i32* %595, align 8
  %596 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %597 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %596, i32 0, i32 26
  store i32 -1, i32* %597, align 4
  %598 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %599 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %598, i32 0, i32 22
  store i32 0, i32* %599, align 4
  %600 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %601 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %600, i32 0, i32 23
  store i32 112, i32* %601, align 8
  %602 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %603 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %602, i32 0, i32 24
  store i32 320, i32* %603, align 4
  %604 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %605 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %604, i32 0, i32 8
  store i32 0, i32* %605, align 4
  %606 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %607 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %606, i32 0, i32 9
  store i32 1, i32* %607, align 8
  %608 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %609 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %608, i32 0, i32 6
  store i32 2, i32* %609, align 4
  br label %625

; <label>:610:                                    ; preds = %586
  %611 = load i8*, i8** %18, align 8
  %612 = call i32 @strcmp(i8* %611, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.138, i32 0, i32 0)) #7
  %613 = icmp eq i32 %612, 0
  br i1 %613, label %614, label %618

; <label>:614:                                    ; preds = %610
  %pgocount53 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 103)
  %615 = add i64 %pgocount53, 1
  store i64 %615, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 103)
  %616 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %617 = load i8*, i8** %13, align 8
  call void @lame_presets_info(%struct.lame_global_flags* %616, i8* %617)
  br label %624

; <label>:618:                                    ; preds = %610
  %pgocount54 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 113)
  %619 = add i64 %pgocount54, 1
  store i64 %619, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 113)
  %620 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %621 = load i8*, i8** %13, align 8
  %622 = load i8*, i8** %18, align 8
  %623 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %620, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @.str.147, i32 0, i32 0), i8* %621, i8* %622)
  call void @exit(i32 1) #6
  unreachable

; <label>:624:                                    ; preds = %614
  br label %625

; <label>:625:                                    ; preds = %624, %590
  br label %626

; <label>:626:                                    ; preds = %625, %566
  br label %627

; <label>:627:                                    ; preds = %626, %538
  br label %628

; <label>:628:                                    ; preds = %627, %510
  br label %629

; <label>:629:                                    ; preds = %628, %482
  br label %630

; <label>:630:                                    ; preds = %629, %450
  br label %631

; <label>:631:                                    ; preds = %630, %418
  br label %638

; <label>:632:                                    ; preds = %410
  %pgocount55 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 97)
  %633 = add i64 %pgocount55, 1
  store i64 %633, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 97)
  %634 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %635 = load i8*, i8** %13, align 8
  %636 = load i8*, i8** %16, align 8
  %637 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %634, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.148, i32 0, i32 0), i8* %635, i8* %636)
  br label %638

; <label>:638:                                    ; preds = %632, %631
  br label %639

; <label>:639:                                    ; preds = %638, %406
  br label %640

; <label>:640:                                    ; preds = %639, %395
  br label %641

; <label>:641:                                    ; preds = %640, %375
  br label %642

; <label>:642:                                    ; preds = %641, %353
  br label %643

; <label>:643:                                    ; preds = %642, %331
  br label %644

; <label>:644:                                    ; preds = %643, %309
  br label %645

; <label>:645:                                    ; preds = %644, %282
  br label %646

; <label>:646:                                    ; preds = %645, %237
  br label %647

; <label>:647:                                    ; preds = %646, %216
  br label %648

; <label>:648:                                    ; preds = %647, %208
  br label %649

; <label>:649:                                    ; preds = %648, %200
  br label %650

; <label>:650:                                    ; preds = %649, %192
  br label %651

; <label>:651:                                    ; preds = %650, %184
  br label %652

; <label>:652:                                    ; preds = %651, %178
  br label %653

; <label>:653:                                    ; preds = %652, %170
  br label %654

; <label>:654:                                    ; preds = %653, %161
  %pgocount56 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 33)
  %655 = add i64 %pgocount56, 1
  store i64 %655, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 33)
  br label %656

; <label>:656:                                    ; preds = %654, %154
  %pgocount57 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 40)
  %657 = add i64 %pgocount57, 1
  store i64 %657, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 40)
  br label %658

; <label>:658:                                    ; preds = %656, %147
  br label %659

; <label>:659:                                    ; preds = %658, %135
  %pgocount58 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 77)
  %660 = add i64 %pgocount58, 1
  store i64 %660, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 77)
  br label %661

; <label>:661:                                    ; preds = %659, %127
  br label %662

; <label>:662:                                    ; preds = %661, %122
  %pgocount59 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 12)
  %663 = add i64 %pgocount59, 1
  store i64 %663, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 12)
  %664 = load i32, i32* %19, align 4
  %665 = load i32, i32* %10, align 4
  %666 = add nsw i32 %665, %664
  store i32 %666, i32* %10, align 4
  br label %1024

; <label>:667:                                    ; preds = %94
  br label %668

; <label>:668:                                    ; preds = %1021, %667
  %669 = load i8*, i8** %16, align 8
  %670 = getelementptr inbounds i8, i8* %669, i32 1
  store i8* %670, i8** %16, align 8
  %671 = load i8, i8* %669, align 1
  store i8 %671, i8* %15, align 1
  %672 = icmp ne i8 %671, 0
  br i1 %672, label %673, label %1022

; <label>:673:                                    ; preds = %668
  %674 = load i8*, i8** %16, align 8
  %675 = load i8, i8* %674, align 1
  %676 = icmp ne i8 %675, 0
  br i1 %676, label %677, label %679

; <label>:677:                                    ; preds = %673
  %678 = load i8*, i8** %16, align 8
  store i8* %678, i8** %17, align 8
  br label %682

; <label>:679:                                    ; preds = %673
  %pgocount60 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 66)
  %680 = add i64 %pgocount60, 1
  store i64 %680, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 66)
  %681 = load i8*, i8** %18, align 8
  store i8* %681, i8** %17, align 8
  br label %682

; <label>:682:                                    ; preds = %679, %677
  %683 = load i8, i8* %15, align 1
  %684 = sext i8 %683 to i32
  switch i32 %684, label %1000 [
    i32 109, label %685
    i32 86, label %745
    i32 113, label %771
    i32 115, label %785
    i32 98, label %797
    i32 66, label %808
    i32 116, label %814
    i32 114, label %818
    i32 120, label %822
    i32 112, label %826
    i32 97, label %830
    i32 104, label %836
    i32 107, label %840
    i32 100, label %846
    i32 118, label %850
    i32 83, label %854
    i32 88, label %858
    i32 89, label %936
    i32 90, label %940
    i32 102, label %944
    i32 103, label %948
    i32 101, label %952
    i32 99, label %988
    i32 111, label %992
    i32 63, label %996
  ]

; <label>:685:                                    ; preds = %682
  store i32 1, i32* %19, align 4
  %686 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %687 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %686, i32 0, i32 9
  store i32 1, i32* %687, align 8
  %688 = load i8*, i8** %17, align 8
  %689 = load i8, i8* %688, align 1
  %690 = sext i8 %689 to i32
  %691 = icmp eq i32 %690, 115
  br i1 %691, label %692, label %696

; <label>:692:                                    ; preds = %685
  %pgocount61 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 59)
  %693 = add i64 %pgocount61, 1
  store i64 %693, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 59)
  %694 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %695 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %694, i32 0, i32 8
  store i32 0, i32* %695, align 4
  br label %744

; <label>:696:                                    ; preds = %685
  %697 = load i8*, i8** %17, align 8
  %698 = load i8, i8* %697, align 1
  %699 = sext i8 %698 to i32
  %700 = icmp eq i32 %699, 100
  br i1 %700, label %701, label %704

; <label>:701:                                    ; preds = %696
  %702 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %703 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %702, i32 0, i32 8
  store i32 2, i32* %703, align 4
  br label %742

; <label>:704:                                    ; preds = %696
  %705 = load i8*, i8** %17, align 8
  %706 = load i8, i8* %705, align 1
  %707 = sext i8 %706 to i32
  %708 = icmp eq i32 %707, 106
  br i1 %708, label %709, label %713

; <label>:709:                                    ; preds = %704
  %pgocount62 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 46)
  %710 = add i64 %pgocount62, 1
  store i64 %710, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 46)
  %711 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %712 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %711, i32 0, i32 8
  store i32 1, i32* %712, align 4
  br label %741

; <label>:713:                                    ; preds = %704
  %714 = load i8*, i8** %17, align 8
  %715 = load i8, i8* %714, align 1
  %716 = sext i8 %715 to i32
  %717 = icmp eq i32 %716, 102
  br i1 %717, label %718, label %724

; <label>:718:                                    ; preds = %713
  %pgocount63 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 67)
  %719 = add i64 %pgocount63, 1
  store i64 %719, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 67)
  %720 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %721 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %720, i32 0, i32 8
  store i32 1, i32* %721, align 4
  %722 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %723 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %722, i32 0, i32 10
  store i32 1, i32* %723, align 4
  br label %740

; <label>:724:                                    ; preds = %713
  %725 = load i8*, i8** %17, align 8
  %726 = load i8, i8* %725, align 1
  %727 = sext i8 %726 to i32
  %728 = icmp eq i32 %727, 109
  br i1 %728, label %729, label %732

; <label>:729:                                    ; preds = %724
  %730 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %731 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %730, i32 0, i32 8
  store i32 3, i32* %731, align 4
  br label %738

; <label>:732:                                    ; preds = %724
  %pgocount64 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 8)
  %733 = add i64 %pgocount64, 1
  store i64 %733, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 8)
  %734 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %735 = load i8*, i8** %13, align 8
  %736 = load i8*, i8** %17, align 8
  %737 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %734, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.149, i32 0, i32 0), i8* %735, i8* %736)
  store i32 1, i32* %9, align 4
  br label %738

; <label>:738:                                    ; preds = %732, %729
  %pgocount65 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 68)
  %739 = add i64 %pgocount65, 1
  store i64 %739, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 68)
  br label %740

; <label>:740:                                    ; preds = %738, %718
  br label %741

; <label>:741:                                    ; preds = %740, %709
  br label %742

; <label>:742:                                    ; preds = %741, %701
  %pgocount66 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 60)
  %743 = add i64 %pgocount66, 1
  store i64 %743, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 60)
  br label %744

; <label>:744:                                    ; preds = %742, %692
  br label %1006

; <label>:745:                                    ; preds = %682
  store i32 1, i32* %19, align 4
  %746 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %747 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %746, i32 0, i32 21
  store i32 1, i32* %747, align 8
  %748 = load i8*, i8** %17, align 8
  %749 = call i32 @atoi(i8* %748) #7
  %750 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %751 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %750, i32 0, i32 22
  store i32 %749, i32* %751, align 4
  %752 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %753 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %752, i32 0, i32 22
  %754 = load i32, i32* %753, align 4
  %755 = icmp slt i32 %754, 0
  br i1 %755, label %757, label %._crit_edge4

._crit_edge4:                                     ; preds = %745
  %pgocount67 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 34)
  %756 = add i64 %pgocount67, 1
  store i64 %756, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 34)
  br label %760

; <label>:757:                                    ; preds = %745
  %758 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %759 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %758, i32 0, i32 22
  store i32 0, i32* %759, align 4
  br label %760

; <label>:760:                                    ; preds = %757, %._crit_edge4
  %761 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %762 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %761, i32 0, i32 22
  %763 = load i32, i32* %762, align 4
  %764 = icmp sgt i32 %763, 9
  br i1 %764, label %766, label %._crit_edge6

._crit_edge6:                                     ; preds = %760
  %pgocount68 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 41)
  %765 = add i64 %pgocount68, 1
  store i64 %765, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 41)
  br label %770

; <label>:766:                                    ; preds = %760
  %pgocount69 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 57)
  %767 = add i64 %pgocount69, 1
  store i64 %767, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 57)
  %768 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %769 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %768, i32 0, i32 22
  store i32 9, i32* %769, align 4
  br label %770

; <label>:770:                                    ; preds = %766, %._crit_edge6
  br label %1006

; <label>:771:                                    ; preds = %682
  store i32 1, i32* %19, align 4
  %772 = load i8*, i8** %17, align 8
  %773 = call i32 @atoi(i8* %772) #7
  store i32 %773, i32* %12, align 4
  %774 = load i32, i32* %12, align 4
  %775 = icmp slt i32 %774, 0
  br i1 %775, label %777, label %._crit_edge5

._crit_edge5:                                     ; preds = %771
  %pgocount70 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 35)
  %776 = add i64 %pgocount70, 1
  store i64 %776, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 35)
  br label %778

; <label>:777:                                    ; preds = %771
  store i32 0, i32* %12, align 4
  br label %778

; <label>:778:                                    ; preds = %777, %._crit_edge5
  %779 = load i32, i32* %12, align 4
  %780 = icmp sgt i32 %779, 9
  br i1 %780, label %782, label %._crit_edge7

._crit_edge7:                                     ; preds = %778
  %pgocount71 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 42)
  %781 = add i64 %pgocount71, 1
  store i64 %781, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 42)
  br label %784

; <label>:782:                                    ; preds = %778
  %pgocount72 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 58)
  %783 = add i64 %pgocount72, 1
  store i64 %783, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 58)
  store i32 9, i32* %12, align 4
  br label %784

; <label>:784:                                    ; preds = %782, %._crit_edge7
  br label %1006

; <label>:785:                                    ; preds = %682
  %pgocount73 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 13)
  %786 = add i64 %pgocount73, 1
  store i64 %786, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 13)
  store i32 1, i32* %19, align 4
  %787 = load i8*, i8** %17, align 8
  %788 = call double @atof(i8* %787) #7
  %789 = fptrunc double %788 to float
  store float %789, float* %8, align 4
  %790 = load float, float* %8, align 4
  %791 = fpext float %790 to double
  %792 = fmul double 1.000000e+03, %791
  %793 = fadd double %792, 5.000000e-01
  %794 = fptosi double %793 to i32
  %795 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %796 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %795, i32 0, i32 2
  store i32 %794, i32* %796, align 4
  br label %1006

; <label>:797:                                    ; preds = %682
  %pgocount74 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 23)
  %798 = add i64 %pgocount74, 1
  store i64 %798, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 23)
  store i32 1, i32* %19, align 4
  %799 = load i8*, i8** %17, align 8
  %800 = call i32 @atoi(i8* %799) #7
  %801 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %802 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %801, i32 0, i32 11
  store i32 %800, i32* %802, align 8
  %803 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %804 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %803, i32 0, i32 11
  %805 = load i32, i32* %804, align 8
  %806 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %807 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %806, i32 0, i32 23
  store i32 %805, i32* %807, align 8
  br label %1006

; <label>:808:                                    ; preds = %682
  %pgocount75 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 27)
  %809 = add i64 %pgocount75, 1
  store i64 %809, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 27)
  store i32 1, i32* %19, align 4
  %810 = load i8*, i8** %17, align 8
  %811 = call i32 @atoi(i8* %810) #7
  %812 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %813 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %812, i32 0, i32 24
  store i32 %811, i32* %813, align 4
  br label %1006

; <label>:814:                                    ; preds = %682
  %pgocount76 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 22)
  %815 = add i64 %pgocount76, 1
  store i64 %815, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 22)
  %816 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %817 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %816, i32 0, i32 5
  store i32 0, i32* %817, align 8
  br label %1006

; <label>:818:                                    ; preds = %682
  %pgocount77 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 30)
  %819 = add i64 %pgocount77, 1
  store i64 %819, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 30)
  %820 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %821 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %820, i32 0, i32 29
  store i32 4, i32* %821, align 8
  br label %1006

; <label>:822:                                    ; preds = %682
  %pgocount78 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 14)
  %823 = add i64 %pgocount78, 1
  store i64 %823, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 14)
  %824 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %825 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %824, i32 0, i32 30
  store i32 1, i32* %825, align 4
  br label %1006

; <label>:826:                                    ; preds = %682
  %pgocount79 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 29)
  %827 = add i64 %pgocount79, 1
  store i64 %827, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 29)
  %828 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %829 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %828, i32 0, i32 14
  store i32 1, i32* %829, align 4
  br label %1006

; <label>:830:                                    ; preds = %682
  %pgocount80 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 15)
  %831 = add i64 %pgocount80, 1
  store i64 %831, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 15)
  store i32 1, i32* %11, align 4
  %832 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %833 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %832, i32 0, i32 8
  store i32 3, i32* %833, align 4
  %834 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %835 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %834, i32 0, i32 9
  store i32 1, i32* %835, align 8
  br label %1006

; <label>:836:                                    ; preds = %682
  %pgocount81 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 16)
  %837 = add i64 %pgocount81, 1
  store i64 %837, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 16)
  %838 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %839 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %838, i32 0, i32 6
  store i32 2, i32* %839, align 4
  br label %1006

; <label>:840:                                    ; preds = %682
  %pgocount82 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 26)
  %841 = add i64 %pgocount82, 1
  store i64 %841, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 26)
  %842 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %843 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %842, i32 0, i32 25
  store i32 -1, i32* %843, align 8
  %844 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %845 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %844, i32 0, i32 26
  store i32 -1, i32* %845, align 4
  br label %1006

; <label>:846:                                    ; preds = %682
  %pgocount83 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 17)
  %847 = add i64 %pgocount83, 1
  store i64 %847, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 17)
  %848 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %849 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %848, i32 0, i32 36
  store i32 1, i32* %849, align 4
  br label %1006

; <label>:850:                                    ; preds = %682
  %pgocount84 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 21)
  %851 = add i64 %pgocount84, 1
  store i64 %851, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 21)
  %852 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %853 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %852, i32 0, i32 21
  store i32 1, i32* %853, align 8
  br label %1006

; <label>:854:                                    ; preds = %682
  %pgocount85 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 18)
  %855 = add i64 %pgocount85, 1
  store i64 %855, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 18)
  %856 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %857 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %856, i32 0, i32 7
  store i32 1, i32* %857, align 8
  br label %1006

; <label>:858:                                    ; preds = %682
  store i32 1, i32* %19, align 4
  %859 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %860 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %859, i32 0, i32 18
  store i32 0, i32* %860, align 4
  %861 = load i8*, i8** %17, align 8
  %862 = load i8, i8* %861, align 1
  %863 = sext i8 %862 to i32
  %864 = icmp eq i32 %863, 48
  br i1 %864, label %865, label %869

; <label>:865:                                    ; preds = %858
  %pgocount86 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 61)
  %866 = add i64 %pgocount86, 1
  store i64 %866, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 61)
  %867 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %868 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %867, i32 0, i32 18
  store i32 0, i32* %868, align 4
  br label %935

; <label>:869:                                    ; preds = %858
  %870 = load i8*, i8** %17, align 8
  %871 = load i8, i8* %870, align 1
  %872 = sext i8 %871 to i32
  %873 = icmp eq i32 %872, 49
  br i1 %873, label %874, label %877

; <label>:874:                                    ; preds = %869
  %875 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %876 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %875, i32 0, i32 18
  store i32 1, i32* %876, align 4
  br label %933

; <label>:877:                                    ; preds = %869
  %878 = load i8*, i8** %17, align 8
  %879 = load i8, i8* %878, align 1
  %880 = sext i8 %879 to i32
  %881 = icmp eq i32 %880, 50
  br i1 %881, label %882, label %886

; <label>:882:                                    ; preds = %877
  %pgocount87 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 47)
  %883 = add i64 %pgocount87, 1
  store i64 %883, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 47)
  %884 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %885 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %884, i32 0, i32 18
  store i32 2, i32* %885, align 4
  br label %932

; <label>:886:                                    ; preds = %877
  %887 = load i8*, i8** %17, align 8
  %888 = load i8, i8* %887, align 1
  %889 = sext i8 %888 to i32
  %890 = icmp eq i32 %889, 51
  br i1 %890, label %891, label %895

; <label>:891:                                    ; preds = %886
  %pgocount88 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 69)
  %892 = add i64 %pgocount88, 1
  store i64 %892, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 69)
  %893 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %894 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %893, i32 0, i32 18
  store i32 3, i32* %894, align 4
  br label %931

; <label>:895:                                    ; preds = %886
  %896 = load i8*, i8** %17, align 8
  %897 = load i8, i8* %896, align 1
  %898 = sext i8 %897 to i32
  %899 = icmp eq i32 %898, 52
  br i1 %899, label %900, label %903

; <label>:900:                                    ; preds = %895
  %901 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %902 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %901, i32 0, i32 18
  store i32 4, i32* %902, align 4
  br label %929

; <label>:903:                                    ; preds = %895
  %904 = load i8*, i8** %17, align 8
  %905 = load i8, i8* %904, align 1
  %906 = sext i8 %905 to i32
  %907 = icmp eq i32 %906, 53
  br i1 %907, label %908, label %912

; <label>:908:                                    ; preds = %903
  %pgocount89 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 50)
  %909 = add i64 %pgocount89, 1
  store i64 %909, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 50)
  %910 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %911 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %910, i32 0, i32 18
  store i32 5, i32* %911, align 4
  br label %928

; <label>:912:                                    ; preds = %903
  %913 = load i8*, i8** %17, align 8
  %914 = load i8, i8* %913, align 1
  %915 = sext i8 %914 to i32
  %916 = icmp eq i32 %915, 54
  br i1 %916, label %917, label %921

; <label>:917:                                    ; preds = %912
  %pgocount90 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 71)
  %918 = add i64 %pgocount90, 1
  store i64 %918, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 71)
  %919 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %920 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %919, i32 0, i32 18
  store i32 6, i32* %920, align 4
  br label %927

; <label>:921:                                    ; preds = %912
  %pgocount91 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 72)
  %922 = add i64 %pgocount91, 1
  store i64 %922, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 72)
  %923 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %924 = load i8*, i8** %13, align 8
  %925 = load i8*, i8** %17, align 8
  %926 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %923, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.150, i32 0, i32 0), i8* %924, i8* %925)
  store i32 1, i32* %9, align 4
  br label %927

; <label>:927:                                    ; preds = %921, %917
  br label %928

; <label>:928:                                    ; preds = %927, %908
  br label %929

; <label>:929:                                    ; preds = %928, %900
  %pgocount92 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 70)
  %930 = add i64 %pgocount92, 1
  store i64 %930, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 70)
  br label %931

; <label>:931:                                    ; preds = %929, %891
  br label %932

; <label>:932:                                    ; preds = %931, %882
  br label %933

; <label>:933:                                    ; preds = %932, %874
  %pgocount93 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 62)
  %934 = add i64 %pgocount93, 1
  store i64 %934, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 62)
  br label %935

; <label>:935:                                    ; preds = %933, %865
  br label %1006

; <label>:936:                                    ; preds = %682
  %pgocount94 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 28)
  %937 = add i64 %pgocount94, 1
  store i64 %937, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 28)
  %938 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %939 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %938, i32 0, i32 19
  store i32 1, i32* %939, align 8
  br label %1006

; <label>:940:                                    ; preds = %682
  %pgocount95 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 31)
  %941 = add i64 %pgocount95, 1
  store i64 %941, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 31)
  %942 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %943 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %942, i32 0, i32 20
  store i32 1, i32* %943, align 4
  br label %1006

; <label>:944:                                    ; preds = %682
  %pgocount96 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 24)
  %945 = add i64 %pgocount96, 1
  store i64 %945, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 24)
  %946 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %947 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %946, i32 0, i32 6
  store i32 9, i32* %947, align 4
  br label %1006

; <label>:948:                                    ; preds = %682
  %pgocount97 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 25)
  %949 = add i64 %pgocount97, 1
  store i64 %949, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 25)
  %950 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %951 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %950, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.151, i32 0, i32 0))
  br label %1006

; <label>:952:                                    ; preds = %682
  store i32 1, i32* %19, align 4
  %953 = load i8*, i8** %17, align 8
  %954 = load i8, i8* %953, align 1
  %955 = sext i8 %954 to i32
  %956 = icmp eq i32 %955, 110
  br i1 %956, label %957, label %961

; <label>:957:                                    ; preds = %952
  %pgocount98 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 63)
  %958 = add i64 %pgocount98, 1
  store i64 %958, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 63)
  %959 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %960 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %959, i32 0, i32 38
  store i32 0, i32* %960, align 4
  br label %987

; <label>:961:                                    ; preds = %952
  %962 = load i8*, i8** %17, align 8
  %963 = load i8, i8* %962, align 1
  %964 = sext i8 %963 to i32
  %965 = icmp eq i32 %964, 53
  br i1 %965, label %966, label %969

; <label>:966:                                    ; preds = %961
  %967 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %968 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %967, i32 0, i32 38
  store i32 1, i32* %968, align 4
  br label %985

; <label>:969:                                    ; preds = %961
  %970 = load i8*, i8** %17, align 8
  %971 = load i8, i8* %970, align 1
  %972 = sext i8 %971 to i32
  %973 = icmp eq i32 %972, 99
  br i1 %973, label %974, label %978

; <label>:974:                                    ; preds = %969
  %pgocount99 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 48)
  %975 = add i64 %pgocount99, 1
  store i64 %975, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 48)
  %976 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %977 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %976, i32 0, i32 38
  store i32 3, i32* %977, align 4
  br label %984

; <label>:978:                                    ; preds = %969
  %pgocount100 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 49)
  %979 = add i64 %pgocount100, 1
  store i64 %979, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 49)
  %980 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %981 = load i8*, i8** %13, align 8
  %982 = load i8*, i8** %17, align 8
  %983 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %980, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.152, i32 0, i32 0), i8* %981, i8* %982)
  store i32 1, i32* %9, align 4
  br label %984

; <label>:984:                                    ; preds = %978, %974
  br label %985

; <label>:985:                                    ; preds = %984, %966
  %pgocount101 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 64)
  %986 = add i64 %pgocount101, 1
  store i64 %986, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 64)
  br label %987

; <label>:987:                                    ; preds = %985, %957
  br label %1006

; <label>:988:                                    ; preds = %682
  %pgocount102 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 32)
  %989 = add i64 %pgocount102, 1
  store i64 %989, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 32)
  %990 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %991 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %990, i32 0, i32 12
  store i32 1, i32* %991, align 4
  br label %1006

; <label>:992:                                    ; preds = %682
  %pgocount103 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 20)
  %993 = add i64 %pgocount103, 1
  store i64 %993, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 20)
  %994 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %995 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %994, i32 0, i32 13
  store i32 0, i32* %995, align 8
  br label %1006

; <label>:996:                                    ; preds = %682
  %pgocount104 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 19)
  %997 = add i64 %pgocount104, 1
  store i64 %997, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 19)
  %998 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %999 = load i8*, i8** %13, align 8
  call void @lame_help(%struct.lame_global_flags* %998, i8* %999)
  br label %1000

; <label>:1000:                                   ; preds = %996, %682
  %1001 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1002 = load i8*, i8** %13, align 8
  %1003 = load i8, i8* %15, align 1
  %1004 = sext i8 %1003 to i32
  %1005 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1001, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.153, i32 0, i32 0), i8* %1002, i32 %1004)
  store i32 1, i32* %9, align 4
  br label %1006

; <label>:1006:                                   ; preds = %1000, %992, %988, %987, %948, %944, %940, %936, %935, %854, %850, %846, %840, %836, %830, %826, %822, %818, %814, %808, %797, %785, %784, %770, %744
  %1007 = load i32, i32* %19, align 4
  %1008 = icmp ne i32 %1007, 0
  br i1 %1008, label %1010, label %._crit_edge9

._crit_edge9:                                     ; preds = %1006
  %pgocount105 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 75)
  %1009 = add i64 %pgocount105, 1
  store i64 %1009, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 75)
  br label %1021

; <label>:1010:                                   ; preds = %1006
  %1011 = load i8*, i8** %17, align 8
  %1012 = load i8*, i8** %16, align 8
  %1013 = icmp eq i8* %1011, %1012
  br i1 %1013, label %1014, label %1016

; <label>:1014:                                   ; preds = %1010
  %pgocount106 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 7)
  %1015 = add i64 %pgocount106, 1
  store i64 %1015, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 7)
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.110, i32 0, i32 0), i8** %16, align 8
  br label %1019

; <label>:1016:                                   ; preds = %1010
  %1017 = load i32, i32* %10, align 4
  %1018 = add nsw i32 %1017, 1
  store i32 %1018, i32* %10, align 4
  br label %1019

; <label>:1019:                                   ; preds = %1016, %1014
  %pgocount107 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 45)
  %1020 = add i64 %pgocount107, 1
  store i64 %1020, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 45)
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.110, i32 0, i32 0), i8** %17, align 8
  store i32 0, i32* %19, align 4
  br label %1021

; <label>:1021:                                   ; preds = %1019, %._crit_edge9
  br label %668

; <label>:1022:                                   ; preds = %668
  %pgocount108 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 11)
  %1023 = add i64 %pgocount108, 1
  store i64 %1023, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 11)
  br label %1024

; <label>:1024:                                   ; preds = %1022, %662
  br label %1061

; <label>:1025:                                   ; preds = %38
  %1026 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %1027 = sext i8 %1026 to i32
  %1028 = icmp eq i32 %1027, 0
  br i1 %1028, label %1029, label %1037

; <label>:1029:                                   ; preds = %1025
  %pgocount109 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 6)
  %1030 = add i64 %pgocount109, 1
  store i64 %1030, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 6)
  %1031 = load i8**, i8*** %7, align 8
  %1032 = load i32, i32* %10, align 4
  %1033 = sext i32 %1032 to i64
  %1034 = getelementptr inbounds i8*, i8** %1031, i64 %1033
  %1035 = load i8*, i8** %1034, align 8
  %1036 = call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i32 0, i32 0), i8* %1035, i64 300) #5
  br label %1060

; <label>:1037:                                   ; preds = %1025
  %1038 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %1039 = sext i8 %1038 to i32
  %1040 = icmp eq i32 %1039, 0
  br i1 %1040, label %1041, label %1049

; <label>:1041:                                   ; preds = %1037
  %pgocount110 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 52)
  %1042 = add i64 %pgocount110, 1
  store i64 %1042, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 52)
  %1043 = load i8**, i8*** %7, align 8
  %1044 = load i32, i32* %10, align 4
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds i8*, i8** %1043, i64 %1045
  %1047 = load i8*, i8** %1046, align 8
  %1048 = call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i32 0, i32 0), i8* %1047, i64 300) #5
  br label %1059

; <label>:1049:                                   ; preds = %1037
  %pgocount111 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 74)
  %1050 = add i64 %pgocount111, 1
  store i64 %1050, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 74)
  %1051 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1052 = load i8*, i8** %13, align 8
  %1053 = load i8**, i8*** %7, align 8
  %1054 = load i32, i32* %10, align 4
  %1055 = sext i32 %1054 to i64
  %1056 = getelementptr inbounds i8*, i8** %1053, i64 %1055
  %1057 = load i8*, i8** %1056, align 8
  %1058 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1051, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.154, i32 0, i32 0), i8* %1052, i8* %1057)
  store i32 1, i32* %9, align 4
  br label %1059

; <label>:1059:                                   ; preds = %1049, %1041
  br label %1060

; <label>:1060:                                   ; preds = %1059, %1029
  br label %1061

; <label>:1061:                                   ; preds = %1060, %1024
  br label %27

; <label>:1062:                                   ; preds = %36
  %1063 = load i32, i32* %9, align 4
  %1064 = icmp ne i32 %1063, 0
  br i1 %1064, label %1070, label %1065

; <label>:1065:                                   ; preds = %1062
  %1066 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %1067 = sext i8 %1066 to i32
  %1068 = icmp eq i32 %1067, 0
  br i1 %1068, label %._crit_edge8, label %1074

._crit_edge8:                                     ; preds = %1065
  %pgocount112 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 56)
  %1069 = add i64 %pgocount112, 1
  store i64 %1069, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 56)
  br label %1070

; <label>:1070:                                   ; preds = %._crit_edge8, %1062
  %pgocount113 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 9)
  %1071 = add i64 %pgocount113, 1
  store i64 %1071, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 9)
  %1072 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1073 = load i8*, i8** %13, align 8
  call void @lame_usage(%struct.lame_global_flags* %1072, i8* %1073)
  br label %1074

; <label>:1074:                                   ; preds = %1070, %1065
  %1075 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %1076 = sext i8 %1075 to i32
  %1077 = icmp eq i32 %1076, 45
  br i1 %1077, label %1079, label %._crit_edge

._crit_edge:                                      ; preds = %1074
  %pgocount114 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 0)
  %1078 = add i64 %pgocount114, 1
  store i64 %1078, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 0)
  br label %1082

; <label>:1079:                                   ; preds = %1074
  %1080 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1081 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1080, i32 0, i32 7
  store i32 1, i32* %1081, align 8
  br label %1082

; <label>:1082:                                   ; preds = %1079, %._crit_edge
  %1083 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %1084 = sext i8 %1083 to i32
  %1085 = icmp eq i32 %1084, 0
  br i1 %1085, label %1086, label %1098

; <label>:1086:                                   ; preds = %1082
  %1087 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i64 0, i64 0), align 16
  %1088 = sext i8 %1087 to i32
  %1089 = icmp eq i32 %1088, 45
  br i1 %1089, label %1090, label %1093

; <label>:1090:                                   ; preds = %1086
  %pgocount115 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 36)
  %1091 = add i64 %pgocount115, 1
  store i64 %1091, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 36)
  %1092 = call i8* @strcpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.155, i32 0, i32 0)) #5
  br label %1097

; <label>:1093:                                   ; preds = %1086
  %pgocount116 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 37)
  %1094 = add i64 %pgocount116, 1
  store i64 %1094, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 37)
  %1095 = call i8* @strncpy(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i32 0, i32 0), i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i32 0, i32 0), i64 296) #5
  %1096 = call i8* @strncat(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.156, i32 0, i32 0), i64 4) #5
  br label %1097

; <label>:1097:                                   ; preds = %1093, %1090
  br label %1098

; <label>:1098:                                   ; preds = %1097, %1082
  %1099 = load i8, i8* getelementptr inbounds ([300 x i8], [300 x i8]* @outPath, i64 0, i64 0), align 16
  %1100 = sext i8 %1099 to i32
  %1101 = icmp eq i32 %1100, 45
  br i1 %1101, label %1103, label %._crit_edge1

._crit_edge1:                                     ; preds = %1098
  %pgocount117 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 1)
  %1102 = add i64 %pgocount117, 1
  store i64 %1102, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 1)
  br label %1113

; <label>:1103:                                   ; preds = %1098
  %1104 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1105 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1104, i32 0, i32 5
  store i32 0, i32* %1105, align 8
  %1106 = load i32, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  %1107 = icmp ne i32 %1106, 0
  br i1 %1107, label %1108, label %1112

; <label>:1108:                                   ; preds = %1103
  %pgocount118 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 5)
  %1109 = add i64 %pgocount118, 1
  store i64 %1109, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 5)
  store i32 0, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  %1110 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1111 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1110, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.157, i32 0, i32 0))
  br label %1112

; <label>:1112:                                   ; preds = %1108, %1103
  br label %1113

; <label>:1113:                                   ; preds = %1112, %._crit_edge1
  %1114 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1115 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1114, i32 0, i32 29
  %1116 = load i32, i32* %1115, align 8
  %1117 = icmp ne i32 %1116, 3
  br i1 %1117, label %1119, label %._crit_edge2

._crit_edge2:                                     ; preds = %1113
  %pgocount119 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 2)
  %1118 = add i64 %pgocount119, 1
  store i64 %1118, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 2)
  br label %1130

; <label>:1119:                                   ; preds = %1113
  %1120 = call i64 @strlen(i8* getelementptr inbounds ([300 x i8], [300 x i8]* @inPath, i32 0, i32 0)) #7
  %1121 = sub i64 %1120, 4
  %1122 = getelementptr inbounds [300 x i8], [300 x i8]* @inPath, i64 0, i64 %1121
  %1123 = call i32 @strcmp(i8* %1122, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.156, i32 0, i32 0)) #7
  %1124 = icmp ne i32 %1123, 0
  br i1 %1124, label %1129, label %1125

; <label>:1125:                                   ; preds = %1119
  %pgocount120 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 38)
  %1126 = add i64 %pgocount120, 1
  store i64 %1126, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 38)
  %1127 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1128 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1127, i32 0, i32 29
  store i32 3, i32* %1128, align 8
  br label %1129

; <label>:1129:                                   ; preds = %1125, %1119
  br label %1130

; <label>:1130:                                   ; preds = %1129, %._crit_edge2
  %1131 = load i32, i32* %11, align 4
  %1132 = icmp ne i32 %1131, 0
  br i1 %1132, label %1133, label %1137

; <label>:1133:                                   ; preds = %1130
  %pgocount121 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 54)
  %1134 = add i64 %pgocount121, 1
  store i64 %1134, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 54)
  %1135 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1136 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1135, i32 0, i32 1
  store i32 2, i32* %1136, align 8
  br label %1150

; <label>:1137:                                   ; preds = %1130
  %1138 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1139 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1138, i32 0, i32 8
  %1140 = load i32, i32* %1139, align 4
  %1141 = icmp eq i32 %1140, 3
  br i1 %1141, label %1142, label %1145

; <label>:1142:                                   ; preds = %1137
  %1143 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1144 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1143, i32 0, i32 1
  store i32 1, i32* %1144, align 8
  br label %1149

; <label>:1145:                                   ; preds = %1137
  %pgocount122 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 39)
  %1146 = add i64 %pgocount122, 1
  store i64 %1146, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 39)
  %1147 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1148 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1147, i32 0, i32 1
  store i32 2, i32* %1148, align 8
  br label %1149

; <label>:1149:                                   ; preds = %1145, %1142
  br label %1150

; <label>:1150:                                   ; preds = %1149, %1133
  %1151 = load i32, i32* %12, align 4
  %1152 = icmp ne i32 %1151, 0
  br i1 %1152, label %1153, label %1158

; <label>:1153:                                   ; preds = %1150
  %pgocount123 = load i64, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 55)
  %1154 = add i64 %pgocount123, 1
  store i64 %1154, i64* getelementptr inbounds ([114 x i64], [114 x i64]* @__profc_lame_parse_args, i64 0, i64 55)
  %1155 = load i32, i32* %12, align 4
  %1156 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %1157 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1156, i32 0, i32 6
  store i32 %1155, i32* %1157, align 4
  br label %1158

; <label>:1158:                                   ; preds = %1153, %1150
  ret void
}

declare void @id3_inittag(%struct.ID3TAGDATA*) #1

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind readonly
declare double @atof(i8*) #4

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind
declare i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
