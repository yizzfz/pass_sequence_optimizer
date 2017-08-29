; ModuleID = 'toast.2.ll'
source_filename = "toast.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fmtdesc = type { i8*, i8*, i8*, i32 ()*, i32 ()*, i32 (i16*)*, i32 (i16*)* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.gsm_state = type opaque
%struct.utimbuf = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@f_decode = global i32 0, align 4
@f_cat = global i32 0, align 4
@f_force = global i32 0, align 4
@f_precious = global i32 0, align 4
@f_fast = global i32 0, align 4
@f_verbose = global i32 0, align 4
@.str = private unnamed_addr constant [6 x i8] c"audio\00", align 1
@.str.1 = private unnamed_addr constant [50 x i8] c"8 kHz, 8 bit u-law encoding with Sun audio header\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c".au\00", align 1
@f_audio = global %struct.fmtdesc { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 ()* @audio_init_input, i32 ()* @audio_init_output, i32 (i16*)* @ulaw_input, i32 (i16*)* @ulaw_output }, align 8
@.str.3 = private unnamed_addr constant [6 x i8] c"u-law\00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"plain 8 kHz, 8 bit u-law encoding\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c".u\00", align 1
@f_ulaw = global %struct.fmtdesc { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 ()* @generic_init, i32 ()* @generic_init, i32 (i16*)* @ulaw_input, i32 (i16*)* @ulaw_output }, align 8
@.str.6 = private unnamed_addr constant [6 x i8] c"A-law\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"8 kHz, 8 bit A-law encoding\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c".A\00", align 1
@f_alaw = global %struct.fmtdesc { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i32 ()* @generic_init, i32 ()* @generic_init, i32 (i16*)* @alaw_input, i32 (i16*)* @alaw_output }, align 8
@.str.9 = private unnamed_addr constant [7 x i8] c"linear\00", align 1
@.str.10 = private unnamed_addr constant [44 x i8] c"16 bit (13 significant) signed 8 kHz signal\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c".l\00", align 1
@f_linear = global %struct.fmtdesc { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i32 ()* @generic_init, i32 ()* @generic_init, i32 (i16*)* @linear_input, i32 (i16*)* @linear_output }, align 8
@alldescs = global [5 x %struct.fmtdesc*] [%struct.fmtdesc* @f_audio, %struct.fmtdesc* @f_alaw, %struct.fmtdesc* @f_ulaw, %struct.fmtdesc* @f_linear, %struct.fmtdesc* null], align 16
@f_format = global %struct.fmtdesc* null, align 8
@.str.12 = private unnamed_addr constant [13 x i8] c"fcdpvhuaslVF\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.13 = private unnamed_addr constant [51 x i8] c"Usage: %s [-fcpdhvuaslF] [files...] (-h for help)\0A\00", align 1
@progname = common global i8* null, align 8
@optind = external global i32, align 4
@instat = common global %struct.stat zeroinitializer, align 8
@in = common global %struct._IO_FILE* null, align 8
@out = common global %struct._IO_FILE* null, align 8
@inname = common global i8* null, align 8
@outname = common global i8* null, align 8
@output = common global i32 (i16*)* null, align 8
@input = common global i32 (i16*)* null, align 8
@init_input = common global i32 ()* null, align 8
@init_output = common global i32 ()* null, align 8
@.str.14 = private unnamed_addr constant [6 x i8] c"toast\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"un\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"cat\00", align 1
@.str.17 = private unnamed_addr constant [54 x i8] c"%s: only one of -[uals] is possible (%s -h for help)\0A\00", align 1
@.str.18 = private unnamed_addr constant [20 x i8] c"%s 1.0, version %s\0A\00", align 1
@.str.19 = private unnamed_addr constant [58 x i8] c"$Id: toast.c,v 1.1.1.1 2000/11/06 19:54:26 mguthaus Exp $\00", align 1
@.str.20 = private unnamed_addr constant [37 x i8] c"Usage: %s [-fcpdhvaulsF] [files...]\0A\00", align 1
@.str.21 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.22 = private unnamed_addr constant [54 x i8] c" -f  force     Replace existing files without asking\0A\00", align 1
@.str.23 = private unnamed_addr constant [60 x i8] c" -c  cat       Write to stdout, do not remove source files\0A\00", align 1
@.str.24 = private unnamed_addr constant [48 x i8] c" -d  decode    Decode data (default is encode)\0A\00", align 1
@.str.25 = private unnamed_addr constant [41 x i8] c" -p  precious  Do not delete the source\0A\00", align 1
@.str.26 = private unnamed_addr constant [57 x i8] c" -u  u-law     Force 8 kHz/8 bit u-law in/output format\0A\00", align 1
@.str.27 = private unnamed_addr constant [53 x i8] c" -s  sun .au   Force Sun .au u-law in/output format\0A\00", align 1
@.str.28 = private unnamed_addr constant [57 x i8] c" -a  A-law     Force 8 kHz/8 bit A-law in/output format\0A\00", align 1
@.str.29 = private unnamed_addr constant [53 x i8] c" -l  linear    Force 16 bit linear in/output format\0A\00", align 1
@.str.30 = private unnamed_addr constant [53 x i8] c" -F  fast      Sacrifice conformance to performance\0A\00", align 1
@.str.31 = private unnamed_addr constant [41 x i8] c" -v  version   Show version information\0A\00", align 1
@.str.32 = private unnamed_addr constant [32 x i8] c" -h  help      Print this text\0A\00", align 1
@.str.33 = private unnamed_addr constant [17 x i8] c"%s: error %s %s\0A\00", align 1
@.str.34 = private unnamed_addr constant [18 x i8] c"writing header to\00", align 1
@.str.35 = private unnamed_addr constant [20 x i8] c"reading header from\00", align 1
@.str.36 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str.37 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str.38 = private unnamed_addr constant [24 x i8] c"%s: error writing \22%s\22\0A\00", align 1
@stdout = external global %struct._IO_FILE*, align 8
@stdin = external global %struct._IO_FILE*, align 8
@.str.39 = private unnamed_addr constant [30 x i8] c"%s: source \22%s\22 not deleted.\0A\00", align 1
@.str.40 = private unnamed_addr constant [27 x i8] c"%s: could not unlink \22%s\22\0A\00", align 1
@.str.41 = private unnamed_addr constant [5 x i8] c".gsm\00", align 1
@.str.42 = private unnamed_addr constant [46 x i8] c"%s: %s already has \22%s\22 suffix -- unchanged.\0A\00", align 1
@.str.43 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.44 = private unnamed_addr constant [34 x i8] c"%s: cannot open \22%s\22 for reading\0A\00", align 1
@.str.45 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.46 = private unnamed_addr constant [40 x i8] c"%s: failed to malloc %d bytes -- abort\0A\00", align 1
@.str.47 = private unnamed_addr constant [22 x i8] c"%s: cannot stat \22%s\22\0A\00", align 1
@.str.48 = private unnamed_addr constant [46 x i8] c"%s: \22%s\22 is not a regular file -- unchanged.\0A\00", align 1
@.str.49 = private unnamed_addr constant [44 x i8] c"%s: \22%s\22 has %s other link%s -- unchanged.\0A\00", align 1
@.str.50 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.51 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.52 = private unnamed_addr constant [33 x i8] c"%s: can't open \22%s\22 for writing\0A\00", align 1
@.str.53 = private unnamed_addr constant [48 x i8] c"%s: filename \22%s\22 is too long (maximum is %ld)\0A\00", align 1
@.str.54 = private unnamed_addr constant [58 x i8] c"%s already exists; do you wish to overwrite %s (y or n)? \00", align 1
@.str.55 = private unnamed_addr constant [18 x i8] c"\09not overwritten\0A\00", align 1
@.str.56 = private unnamed_addr constant [50 x i8] c"%s: incomplete frame (%d byte%s missing) from %s\0A\00", align 1
@.str.57 = private unnamed_addr constant [21 x i8] c"%s: bad frame in %s\0A\00", align 1
@.str.58 = private unnamed_addr constant [25 x i8] c"%s: error writing to %s\0A\00", align 1
@.str.59 = private unnamed_addr constant [27 x i8] c"%s: error reading from %s\0A\00", align 1
@.str.60 = private unnamed_addr constant [40 x i8] c"%s: could not change file mode of \22%s\22\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_tmp1.ll_generic_init = private constant [20 x i8] c"tmp1.ll:generic_init"
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_parse_argv0 = private constant [19 x i8] c"tmp1.ll:parse_argv0"
@__profn_tmp1.ll_set_format = private constant [18 x i8] c"tmp1.ll:set_format"
@__profn_tmp1.ll_version = private constant [15 x i8] c"tmp1.ll:version"
@__profn_tmp1.ll_help = private constant [12 x i8] c"tmp1.ll:help"
@__profn_tmp1.ll_catch_signals = private constant [21 x i8] c"tmp1.ll:catch_signals"
@__profn_tmp1.ll_onintr = private constant [14 x i8] c"tmp1.ll:onintr"
@__profn_tmp1.ll_process = private constant [15 x i8] c"tmp1.ll:process"
@__profn_tmp1.ll_endname = private constant [15 x i8] c"tmp1.ll:endname"
@__profn_tmp1.ll_open_input = private constant [18 x i8] c"tmp1.ll:open_input"
@__profn_tmp1.ll_open_output = private constant [19 x i8] c"tmp1.ll:open_output"
@__profn_tmp1.ll_process_decode = private constant [22 x i8] c"tmp1.ll:process_decode"
@__profn_tmp1.ll_process_encode = private constant [22 x i8] c"tmp1.ll:process_encode"
@__profn_tmp1.ll_update_times = private constant [20 x i8] c"tmp1.ll:update_times"
@__profn_tmp1.ll_update_mode = private constant [19 x i8] c"tmp1.ll:update_mode"
@__profn_tmp1.ll_update_own = private constant [18 x i8] c"tmp1.ll:update_own"
@__profn_tmp1.ll_codename = private constant [16 x i8] c"tmp1.ll:codename"
@__profn_tmp1.ll_suffix = private constant [14 x i8] c"tmp1.ll:suffix"
@__profn_tmp1.ll_emalloc = private constant [15 x i8] c"tmp1.ll:emalloc"
@__profn_tmp1.ll_okay_as_input = private constant [21 x i8] c"tmp1.ll:okay_as_input"
@__profn_tmp1.ll_grok_format = private constant [19 x i8] c"tmp1.ll:grok_format"
@__profn_tmp1.ll_prepare_io = private constant [18 x i8] c"tmp1.ll:prepare_io"
@__profn_tmp1.ll_normalname = private constant [18 x i8] c"tmp1.ll:normalname"
@__profn_tmp1.ll_plainname = private constant [17 x i8] c"tmp1.ll:plainname"
@__profn_tmp1.ll_length_okay = private constant [19 x i8] c"tmp1.ll:length_okay"
@__profn_tmp1.ll_ok_to_replace = private constant [21 x i8] c"tmp1.ll:ok_to_replace"
@__profc_tmp1.ll_generic_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_generic_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -44793511050331915, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_generic_init, i32 0, i32 0), i8* bitcast (i32 ()* @generic_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main1 = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 174016450578, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_parse_argv0 = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_parse_argv0 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3756644951312417693, i64 63414882412, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_set_format = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_set_format = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1980986445170323886, i64 32036479533, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_format, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_version = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_version = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8216697443682825548, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_version, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_help = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_help = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7310842176785540889, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_help, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_catch_signals = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_catch_signals = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5813414273511178715, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_catch_signals, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_onintr = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_onintr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8532633290492531597, i64 29866266370, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_onintr, i32 0, i32 0), i8* bitcast (void ()* @onintr to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process = private global [34 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9156161467291521079, i64 144678543543413447, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_process to i8*), i32 34, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_endname = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_endname = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3105692886124907186, i64 43201679710, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_open_input = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_open_input = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8305271791944931606, i64 126543105858, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_open_output = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_open_output = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_open_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4237697707684054549, i64 72339199715121789, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_open_output to i8*), i32 10, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process_decode = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process_decode = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1286224709169146911, i64 281652540570716, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i32 0, i32 0), i8* bitcast (i32 ()* @process_decode to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_process_decode to i8*), i32 12, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process_encode = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process_encode = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process_encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3821740988750287161, i64 281629110226390, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i32 0, i32 0), i8* bitcast (i32 ()* @process_encode to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_process_encode to i8*), i32 10, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_update_times = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_update_times = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9138087031070275417, i64 36189902368, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_times, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_update_mode = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_update_mode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3385033869235442552, i64 36189902368, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_mode, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_update_own = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_update_own = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9096838506459405237, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_update_own, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_codename = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_codename = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3133874150073174820, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_codename, i32 0, i32 0), i8* bitcast (i8* (i8*)* @codename to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_suffix = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_suffix = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -696278221834402583, i64 52798776341, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emalloc = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emalloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2508849540757736377, i64 24868915205, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emalloc, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_okay_as_input = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_okay_as_input = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8496247409192312425, i64 71834398630, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_grok_format = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_grok_format = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7222942521407613150, i64 79933792225, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_prepare_io = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_prepare_io = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2714540749246726406, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_prepare_io, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_normalname = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_normalname = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 977732725026344625, i64 65668753982, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_plainname = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_plainname = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2371659484747281007, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_plainname, i32 0, i32 0), i8* bitcast (i8* (i8*)* @plainname to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_length_okay = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_length_okay = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6997633071488352164, i64 50985810975, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ok_to_replace = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ok_to_replace = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6159451213147999199, i64 88053528787, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [499 x i8] c"\F0\03\00tmp1.ll:generic_init\01main1\01tmp1.ll:parse_argv0\01tmp1.ll:set_format\01tmp1.ll:version\01tmp1.ll:help\01tmp1.ll:catch_signals\01tmp1.ll:onintr\01tmp1.ll:process\01tmp1.ll:endname\01tmp1.ll:open_input\01tmp1.ll:open_output\01tmp1.ll:process_decode\01tmp1.ll:process_encode\01tmp1.ll:update_times\01tmp1.ll:update_mode\01tmp1.ll:update_own\01tmp1.ll:codename\01tmp1.ll:suffix\01tmp1.ll:emalloc\01tmp1.ll:okay_as_input\01tmp1.ll:grok_format\01tmp1.ll:prepare_io\01tmp1.ll:normalname\01tmp1.ll:plainname\01tmp1.ll:length_okay\01tmp1.ll:ok_to_replace", section "__llvm_prf_names"
@llvm.used = appending global [29 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_generic_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_parse_argv0 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_set_format to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_version to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_help to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_catch_signals to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_onintr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_endname to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_open_input to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_open_output to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_update_times to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_update_mode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_update_own to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_codename to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_suffix to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emalloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_okay_as_input to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_grok_format to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_io to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_normalname to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_plainname to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_length_okay to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ok_to_replace to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([499 x i8], [499 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

declare i32 @audio_init_input() #0

declare i32 @audio_init_output() #0

declare i32 @ulaw_input(i16*) #0

declare i32 @ulaw_output(i16*) #0

; Function Attrs: noinline nounwind uwtable
define internal i32 @generic_init() #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_generic_init, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_generic_init, i64 0, i64 0)
  ret i32 0
}

declare i32 @alaw_input(i16*) #0

declare i32 @alaw_output(i16*) #0

declare i32 @linear_input(i16*) #0

declare i32 @linear_output(i16*) #0

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) #1 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %6 = load i8**, i8*** %4, align 8
  %7 = load i8*, i8** %6, align 8
  call void @parse_argv0(i8* %7)
  br label %8

; <label>:8:                                      ; preds = %44, %2
  %9 = load i32, i32* %3, align 4
  %10 = load i8**, i8*** %4, align 8
  %11 = call i32 @getopt(i32 %9, i8** %10, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0)) #7
  store i32 %11, i32* %5, align 4
  %12 = icmp ne i32 %11, -1
  br i1 %12, label %13, label %45

; <label>:13:                                     ; preds = %8
  %14 = load i32, i32* %5, align 4
  switch i32 %14, label %39 [
    i32 100, label %15
    i32 102, label %17
    i32 99, label %19
    i32 112, label %21
    i32 70, label %23
    i32 86, label %25
    i32 117, label %27
    i32 108, label %29
    i32 97, label %31
    i32 115, label %33
    i32 118, label %35
    i32 104, label %37
  ]

; <label>:15:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 1)
  store i32 1, i32* @f_decode, align 4
  br label %44

; <label>:17:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 2)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 2)
  store i32 1, i32* @f_force, align 4
  br label %44

; <label>:19:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 3)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 3)
  store i32 1, i32* @f_cat, align 4
  br label %44

; <label>:21:                                     ; preds = %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 4)
  %22 = add i64 %pgocount3, 1
  store i64 %22, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 4)
  store i32 1, i32* @f_precious, align 4
  br label %44

; <label>:23:                                     ; preds = %13
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 5)
  %24 = add i64 %pgocount4, 1
  store i64 %24, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 5)
  store i32 1, i32* @f_fast, align 4
  br label %44

; <label>:25:                                     ; preds = %13
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 6)
  %26 = add i64 %pgocount5, 1
  store i64 %26, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 6)
  store i32 1, i32* @f_verbose, align 4
  br label %44

; <label>:27:                                     ; preds = %13
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 7)
  %28 = add i64 %pgocount6, 1
  store i64 %28, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 7)
  call void @set_format(%struct.fmtdesc* @f_ulaw)
  br label %44

; <label>:29:                                     ; preds = %13
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 8)
  %30 = add i64 %pgocount7, 1
  store i64 %30, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 8)
  call void @set_format(%struct.fmtdesc* @f_linear)
  br label %44

; <label>:31:                                     ; preds = %13
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 9)
  %32 = add i64 %pgocount8, 1
  store i64 %32, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 9)
  call void @set_format(%struct.fmtdesc* @f_alaw)
  br label %44

; <label>:33:                                     ; preds = %13
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 10)
  %34 = add i64 %pgocount9, 1
  store i64 %34, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 10)
  call void @set_format(%struct.fmtdesc* @f_audio)
  br label %44

; <label>:35:                                     ; preds = %13
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 13)
  %36 = add i64 %pgocount10, 1
  store i64 %36, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 13)
  call void @version()
  call void @exit(i32 0) #8
  unreachable

; <label>:37:                                     ; preds = %13
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 14)
  %38 = add i64 %pgocount11, 1
  store i64 %38, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 14)
  call void @help()
  call void @exit(i32 0) #8
  unreachable

; <label>:39:                                     ; preds = %13
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 15)
  %40 = add i64 %pgocount12, 1
  store i64 %40, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 15)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = load i8*, i8** @progname, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.13, i32 0, i32 0), i8* %42)
  call void @exit(i32 1) #8
  unreachable

; <label>:44:                                     ; preds = %33, %31, %29, %27, %25, %23, %21, %19, %17, %15
  br label %8

; <label>:45:                                     ; preds = %8
  %46 = load i32, i32* @f_cat, align 4
  %47 = load i32, i32* @f_precious, align 4
  %48 = or i32 %47, %46
  store i32 %48, i32* @f_precious, align 4
  %49 = load i32, i32* @optind, align 4
  %50 = load i8**, i8*** %4, align 8
  %51 = sext i32 %49 to i64
  %52 = getelementptr inbounds i8*, i8** %50, i64 %51
  store i8** %52, i8*** %4, align 8
  %53 = load i32, i32* @optind, align 4
  %54 = load i32, i32* %3, align 4
  %55 = sub nsw i32 %54, %53
  store i32 %55, i32* %3, align 4
  call void @catch_signals(void (...)* bitcast (void ()* @onintr to void (...)*))
  %56 = load i32, i32* %3, align 4
  %57 = icmp sle i32 %56, 0
  br i1 %57, label %58, label %61

; <label>:58:                                     ; preds = %45
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 11)
  %59 = add i64 %pgocount13, 1
  store i64 %59, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 11)
  %60 = call i32 @process(i8* null)
  br label %74

; <label>:61:                                     ; preds = %45
  br label %62

; <label>:62:                                     ; preds = %66, %61
  %63 = load i32, i32* %3, align 4
  %64 = add nsw i32 %63, -1
  store i32 %64, i32* %3, align 4
  %65 = icmp ne i32 %63, 0
  br i1 %65, label %66, label %72

; <label>:66:                                     ; preds = %62
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 0)
  %67 = add i64 %pgocount14, 1
  store i64 %67, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 0)
  %68 = load i8**, i8*** %4, align 8
  %69 = getelementptr inbounds i8*, i8** %68, i32 1
  store i8** %69, i8*** %4, align 8
  %70 = load i8*, i8** %68, align 8
  %71 = call i32 @process(i8* %70)
  br label %62

; <label>:72:                                     ; preds = %62
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 12)
  %73 = add i64 %pgocount15, 1
  store i64 %73, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_main1, i64 0, i64 12)
  br label %74

; <label>:74:                                     ; preds = %72, %58
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @parse_argv0(i8*) #1 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 0)
  %8 = load i8*, i8** %2, align 8
  br label %11

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 2)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 2)
  br label %11

; <label>:11:                                     ; preds = %9, %6
  %12 = phi i8* [ %8, %6 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0), %9 ]
  %13 = call i8* @endname(i8* %12)
  store i8* %13, i8** %2, align 8
  store i8* %13, i8** @progname, align 8
  %14 = load i8*, i8** %2, align 8
  %15 = call i32 @strncmp(i8* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i64 2) #9
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %19, label %17

; <label>:17:                                     ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 3)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 3)
  store i32 1, i32* @f_decode, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %11
  %20 = load i8*, i8** %2, align 8
  %21 = call i64 @strlen(i8* %20) #9
  %22 = trunc i64 %21 to i32
  store i32 %22, i32* %3, align 4
  %23 = icmp sge i32 %22, 3
  br i1 %23, label %24, label %35

; <label>:24:                                     ; preds = %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 1)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 1)
  %26 = load i8*, i8** %2, align 8
  %27 = load i32, i32* %3, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8* %26, i64 %28
  %30 = getelementptr inbounds i8, i8* %29, i64 -3
  %31 = call i32 @strcmp(i8* %30, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0)) #9
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %35, label %33

; <label>:33:                                     ; preds = %24
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 4)
  %34 = add i64 %pgocount4, 1
  store i64 %34, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_parse_argv0, i64 0, i64 4)
  store i32 1, i32* @f_decode, align 4
  store i32 1, i32* @f_cat, align 4
  br label %35

; <label>:35:                                     ; preds = %33, %24, %19
  ret void
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @set_format(%struct.fmtdesc*) #1 {
  %2 = alloca %struct.fmtdesc*, align 8
  store %struct.fmtdesc* %0, %struct.fmtdesc** %2, align 8
  %3 = load %struct.fmtdesc*, %struct.fmtdesc** @f_format, align 8
  %4 = icmp ne %struct.fmtdesc* %3, null
  br i1 %4, label %5, label %16

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_format, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_format, i64 0, i64 1)
  %7 = load %struct.fmtdesc*, %struct.fmtdesc** @f_format, align 8
  %8 = load %struct.fmtdesc*, %struct.fmtdesc** %2, align 8
  %9 = icmp ne %struct.fmtdesc* %7, %8
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_format, i64 0, i64 2)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_format, i64 0, i64 2)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = load i8*, i8** @progname, align 8
  %14 = load i8*, i8** @progname, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.17, i32 0, i32 0), i8* %13, i8* %14)
  call void @exit(i32 1) #8
  unreachable

; <label>:16:                                     ; preds = %5, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_format, i64 0, i64 0)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_set_format, i64 0, i64 0)
  %18 = load %struct.fmtdesc*, %struct.fmtdesc** %2, align 8
  store %struct.fmtdesc* %18, %struct.fmtdesc** @f_format, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @version() #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_version, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_version, i64 0, i64 0)
  %2 = load i8*, i8** @progname, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.18, i32 0, i32 0), i8* %2, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.19, i32 0, i32 0))
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @help() #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_help, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_help, i64 0, i64 0)
  %2 = load i8*, i8** @progname, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20, i32 0, i32 0), i8* %2)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0))
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.22, i32 0, i32 0))
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.23, i32 0, i32 0))
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.24, i32 0, i32 0))
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.25, i32 0, i32 0))
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0))
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.26, i32 0, i32 0))
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.27, i32 0, i32 0))
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.28, i32 0, i32 0))
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.29, i32 0, i32 0))
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0))
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.30, i32 0, i32 0))
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.31, i32 0, i32 0))
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.32, i32 0, i32 0))
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0))
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #0

; Function Attrs: noinline nounwind uwtable
define internal void @catch_signals(void (...)*) #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_catch_signals, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_catch_signals, i64 0, i64 0)
  %3 = alloca void (...)*, align 8
  store void (...)* %0, void (...)** %3, align 8
  %4 = load void (...)*, void (...)** %3, align 8
  %5 = bitcast void (...)* %4 to void (i32)*
  %6 = call void (i32)* @signal(i32 1, void (i32)* %5) #7
  %7 = load void (...)*, void (...)** %3, align 8
  %8 = bitcast void (...)* %7 to void (i32)*
  %9 = call void (i32)* @signal(i32 2, void (i32)* %8) #7
  %10 = load void (...)*, void (...)** %3, align 8
  %11 = bitcast void (...)* %10 to void (i32)*
  %12 = call void (i32)* @signal(i32 13, void (i32)* %11) #7
  %13 = load void (...)*, void (...)** %3, align 8
  %14 = bitcast void (...)* %13 to void (i32)*
  %15 = call void (i32)* @signal(i32 15, void (i32)* %14) #7
  %16 = load void (...)*, void (...)** %3, align 8
  %17 = bitcast void (...)* %16 to void (i32)*
  %18 = call void (i32)* @signal(i32 25, void (i32)* %17) #7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @onintr() #1 {
  %1 = alloca i8*, align 8
  %2 = load i8*, i8** @outname, align 8
  store i8* %2, i8** %1, align 8
  store i8* null, i8** @outname, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_onintr, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_onintr, i64 0, i64 1)
  %7 = load i8*, i8** %1, align 8
  %8 = call i32 @unlink(i8* %7) #7
  br label %9

; <label>:9:                                      ; preds = %5, %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_onintr, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_onintr, i64 0, i64 0)
  call void @exit(i32 1) #8
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @process(i8*) #1 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 0, i32* %4, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** @out, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** @in, align 8
  store i8* null, i8** @outname, align 8
  store i8* null, i8** @inname, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = call i32 @open_input(i8* %5, %struct.stat* @instat)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 0)
  %10 = load i8*, i8** %3, align 8
  %11 = call i32 @open_output(i8* %10)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %8, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 5)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 5)
  br label %163

; <label>:15:                                     ; preds = %8
  %16 = load i32, i32* @f_decode, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %15
  %19 = load i32 ()*, i32 ()** @init_output, align 8
  br label %23

; <label>:20:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 10)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 10)
  %22 = load i32 ()*, i32 ()** @init_input, align 8
  br label %23

; <label>:23:                                     ; preds = %20, %18
  %24 = phi i32 ()* [ %19, %18 ], [ %22, %20 ]
  %25 = ptrtoint i32 ()* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %25, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process to i8*), i32 0)
  %26 = call i32 %24()
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %61

; <label>:28:                                     ; preds = %23
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = load i8*, i8** @progname, align 8
  %31 = load i32, i32* @f_decode, align 4
  %32 = icmp ne i32 %31, 0
  %33 = zext i1 %32 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 32)
  %34 = add i64 %pgocount3, %33
  store i64 %34, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 32)
  %35 = select i1 %32, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.35, i32 0, i32 0)
  %36 = load i32, i32* @f_decode, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %48

; <label>:38:                                     ; preds = %28
  %39 = load i8*, i8** @outname, align 8
  %40 = icmp ne i8* %39, null
  br i1 %40, label %41, label %44

; <label>:41:                                     ; preds = %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 12)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 12)
  %43 = load i8*, i8** @outname, align 8
  br label %46

; <label>:44:                                     ; preds = %38
  %pgocount5 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 15)
  %45 = add i64 %pgocount5, 1
  store i64 %45, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 15)
  br label %46

; <label>:46:                                     ; preds = %44, %41
  %47 = phi i8* [ %43, %41 ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0), %44 ]
  br label %58

; <label>:48:                                     ; preds = %28
  %49 = load i8*, i8** @inname, align 8
  %50 = icmp ne i8* %49, null
  br i1 %50, label %51, label %54

; <label>:51:                                     ; preds = %48
  %pgocount6 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 16)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 16)
  %53 = load i8*, i8** @inname, align 8
  br label %56

; <label>:54:                                     ; preds = %48
  %pgocount7 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 18)
  %55 = add i64 %pgocount7, 1
  store i64 %55, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 18)
  br label %56

; <label>:56:                                     ; preds = %54, %51
  %57 = phi i8* [ %53, %51 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i32 0, i32 0), %54 ]
  br label %58

; <label>:58:                                     ; preds = %56, %46
  %59 = phi i8* [ %47, %46 ], [ %57, %56 ]
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.33, i32 0, i32 0), i8* %30, i8* %35, i8* %59)
  br label %163

; <label>:61:                                     ; preds = %23
  %62 = load i32, i32* @f_decode, align 4
  %63 = icmp ne i32 %62, 0
  %64 = zext i1 %63 to i64
  %pgocount8 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 33)
  %65 = add i64 %pgocount8, %64
  store i64 %65, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 33)
  %66 = select i1 %63, i32 ()* @process_decode, i32 ()* @process_encode
  %67 = ptrtoint i32 ()* %66 to i64
  call void @__llvm_profile_instrument_target(i64 %67, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process to i8*), i32 1)
  %68 = call i32 %66()
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %72

; <label>:70:                                     ; preds = %61
  %pgocount9 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 13)
  %71 = add i64 %pgocount9, 1
  store i64 %71, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 13)
  br label %163

; <label>:72:                                     ; preds = %61
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %74 = call i32 @fflush(%struct._IO_FILE* %73)
  %75 = icmp slt i32 %74, 0
  br i1 %75, label %81, label %76

; <label>:76:                                     ; preds = %72
  %pgocount10 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 19)
  %77 = add i64 %pgocount10, 1
  store i64 %77, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 19)
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %79 = call i32 @ferror(%struct._IO_FILE* %78) #7
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %102

; <label>:81:                                     ; preds = %76, %72
  %82 = load i8*, i8** @outname, align 8
  %83 = icmp ne i8* %82, null
  br i1 %83, label %84, label %86

; <label>:84:                                     ; preds = %81
  %85 = load i8*, i8** @outname, align 8
  br label %88

; <label>:86:                                     ; preds = %81
  %pgocount11 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 21)
  %87 = add i64 %pgocount11, 1
  store i64 %87, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 21)
  br label %88

; <label>:88:                                     ; preds = %86, %84
  %89 = phi i8* [ %85, %84 ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0), %86 ]
  call void @perror(i8* %89)
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %91 = load i8*, i8** @progname, align 8
  %92 = load i8*, i8** @outname, align 8
  %93 = icmp ne i8* %92, null
  br i1 %93, label %94, label %97

; <label>:94:                                     ; preds = %88
  %pgocount12 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 20)
  %95 = add i64 %pgocount12, 1
  store i64 %95, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 20)
  %96 = load i8*, i8** @outname, align 8
  br label %99

; <label>:97:                                     ; preds = %88
  %pgocount13 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 22)
  %98 = add i64 %pgocount13, 1
  store i64 %98, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 22)
  br label %99

; <label>:99:                                     ; preds = %97, %94
  %100 = phi i8* [ %96, %94 ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0), %97 ]
  %101 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %90, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.38, i32 0, i32 0), i8* %91, i8* %100)
  br label %163

; <label>:102:                                    ; preds = %76
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %105 = icmp ne %struct._IO_FILE* %103, %104
  br i1 %105, label %106, label %126

; <label>:106:                                    ; preds = %102
  call void @update_times()
  call void @update_mode()
  call void @update_own()
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %108 = call i32 @fclose(%struct._IO_FILE* %107)
  %109 = icmp slt i32 %108, 0
  br i1 %109, label %110, label %117

; <label>:110:                                    ; preds = %106
  %pgocount14 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 28)
  %111 = add i64 %pgocount14, 1
  store i64 %111, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 28)
  %112 = load i8*, i8** @outname, align 8
  call void @perror(i8* %112)
  %113 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %114 = load i8*, i8** @progname, align 8
  %115 = load i8*, i8** @outname, align 8
  %116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %113, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.38, i32 0, i32 0), i8* %114, i8* %115)
  br label %163

; <label>:117:                                    ; preds = %106
  %118 = load i8*, i8** @outname, align 8
  %119 = load i8*, i8** %3, align 8
  %120 = icmp ne i8* %118, %119
  br i1 %120, label %121, label %124

; <label>:121:                                    ; preds = %117
  %pgocount15 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 27)
  %122 = add i64 %pgocount15, 1
  store i64 %122, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 27)
  %123 = load i8*, i8** @outname, align 8
  call void @free(i8* %123) #7
  br label %124

; <label>:124:                                    ; preds = %121, %117
  %pgocount16 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 25)
  %125 = add i64 %pgocount16, 1
  store i64 %125, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 25)
  store i8* null, i8** @outname, align 8
  br label %126

; <label>:126:                                    ; preds = %124, %102
  store %struct._IO_FILE* null, %struct._IO_FILE** @out, align 8
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %129 = icmp ne %struct._IO_FILE* %127, %128
  br i1 %129, label %130, label %161

; <label>:130:                                    ; preds = %126
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %132 = call i32 @fclose(%struct._IO_FILE* %131)
  store %struct._IO_FILE* null, %struct._IO_FILE** @in, align 8
  %133 = load i32, i32* @f_cat, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %152, label %135

; <label>:135:                                    ; preds = %130
  %pgocount17 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 29)
  %136 = add i64 %pgocount17, 1
  store i64 %136, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 29)
  %137 = load i32, i32* @f_precious, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %152, label %139

; <label>:139:                                    ; preds = %135
  %140 = load i8*, i8** @inname, align 8
  %141 = call i32 @unlink(i8* %140) #7
  %142 = icmp slt i32 %141, 0
  br i1 %142, label %143, label %150

; <label>:143:                                    ; preds = %139
  %pgocount18 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 31)
  %144 = add i64 %pgocount18, 1
  store i64 %144, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 31)
  %145 = load i8*, i8** @inname, align 8
  call void @perror(i8* %145)
  %146 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %147 = load i8*, i8** @progname, align 8
  %148 = load i8*, i8** @inname, align 8
  %149 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %146, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.39, i32 0, i32 0), i8* %147, i8* %148)
  br label %150

; <label>:150:                                    ; preds = %143, %139
  %pgocount19 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 30)
  %151 = add i64 %pgocount19, 1
  store i64 %151, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 30)
  br label %163

; <label>:152:                                    ; preds = %135, %130
  %153 = load i8*, i8** @inname, align 8
  %154 = load i8*, i8** %3, align 8
  %155 = icmp ne i8* %153, %154
  br i1 %155, label %156, label %159

; <label>:156:                                    ; preds = %152
  %pgocount20 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 26)
  %157 = add i64 %pgocount20, 1
  store i64 %157, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 26)
  %158 = load i8*, i8** @inname, align 8
  call void @free(i8* %158) #7
  br label %159

; <label>:159:                                    ; preds = %156, %152
  %pgocount21 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 24)
  %160 = add i64 %pgocount21, 1
  store i64 %160, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 24)
  store i8* null, i8** @inname, align 8
  br label %161

; <label>:161:                                    ; preds = %159, %126
  %pgocount22 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 23)
  %162 = add i64 %pgocount22, 1
  store i64 %162, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 23)
  store i32 0, i32* %2, align 4
  br label %231

; <label>:163:                                    ; preds = %150, %110, %99, %70, %58, %13
  %164 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %165 = icmp ne %struct._IO_FILE* %164, null
  br i1 %165, label %166, label %196

; <label>:166:                                    ; preds = %163
  %pgocount23 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 1)
  %167 = add i64 %pgocount23, 1
  store i64 %167, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 1)
  %168 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %170 = icmp ne %struct._IO_FILE* %168, %169
  br i1 %170, label %171, label %196

; <label>:171:                                    ; preds = %166
  %pgocount24 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 6)
  %172 = add i64 %pgocount24, 1
  store i64 %172, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 6)
  %173 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %174 = call i32 @fclose(%struct._IO_FILE* %173)
  store %struct._IO_FILE* null, %struct._IO_FILE** @out, align 8
  %175 = load i8*, i8** @outname, align 8
  %176 = call i32 @unlink(i8* %175) #7
  %177 = icmp slt i32 %176, 0
  br i1 %177, label %178, label %195

; <label>:178:                                    ; preds = %171
  %pgocount25 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 11)
  %179 = add i64 %pgocount25, 1
  store i64 %179, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 11)
  %180 = call i32* @__errno_location() #10
  %181 = load i32, i32* %180, align 4
  %182 = icmp ne i32 %181, 2
  br i1 %182, label %183, label %195

; <label>:183:                                    ; preds = %178
  %pgocount26 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 14)
  %184 = add i64 %pgocount26, 1
  store i64 %184, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 14)
  %185 = call i32* @__errno_location() #10
  %186 = load i32, i32* %185, align 4
  %187 = icmp ne i32 %186, 4
  br i1 %187, label %188, label %195

; <label>:188:                                    ; preds = %183
  %pgocount27 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 17)
  %189 = add i64 %pgocount27, 1
  store i64 %189, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 17)
  %190 = load i8*, i8** @outname, align 8
  call void @perror(i8* %190)
  %191 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %192 = load i8*, i8** @progname, align 8
  %193 = load i8*, i8** @outname, align 8
  %194 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %191, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.40, i32 0, i32 0), i8* %192, i8* %193)
  br label %195

; <label>:195:                                    ; preds = %188, %183, %178, %171
  br label %196

; <label>:196:                                    ; preds = %195, %166, %163
  %197 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %198 = icmp ne %struct._IO_FILE* %197, null
  br i1 %198, label %199, label %208

; <label>:199:                                    ; preds = %196
  %pgocount28 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 2)
  %200 = add i64 %pgocount28, 1
  store i64 %200, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 2)
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %202 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %203 = icmp ne %struct._IO_FILE* %201, %202
  br i1 %203, label %204, label %208

; <label>:204:                                    ; preds = %199
  %pgocount29 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 7)
  %205 = add i64 %pgocount29, 1
  store i64 %205, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 7)
  %206 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %207 = call i32 @fclose(%struct._IO_FILE* %206)
  store %struct._IO_FILE* null, %struct._IO_FILE** @in, align 8
  br label %208

; <label>:208:                                    ; preds = %204, %199, %196
  %209 = load i8*, i8** @inname, align 8
  %210 = icmp ne i8* %209, null
  br i1 %210, label %211, label %219

; <label>:211:                                    ; preds = %208
  %pgocount30 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 3)
  %212 = add i64 %pgocount30, 1
  store i64 %212, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 3)
  %213 = load i8*, i8** @inname, align 8
  %214 = load i8*, i8** %3, align 8
  %215 = icmp ne i8* %213, %214
  br i1 %215, label %216, label %219

; <label>:216:                                    ; preds = %211
  %pgocount31 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 8)
  %217 = add i64 %pgocount31, 1
  store i64 %217, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 8)
  %218 = load i8*, i8** @inname, align 8
  call void @free(i8* %218) #7
  br label %219

; <label>:219:                                    ; preds = %216, %211, %208
  %220 = load i8*, i8** @outname, align 8
  %221 = icmp ne i8* %220, null
  br i1 %221, label %222, label %230

; <label>:222:                                    ; preds = %219
  %pgocount32 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 4)
  %223 = add i64 %pgocount32, 1
  store i64 %223, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 4)
  %224 = load i8*, i8** @outname, align 8
  %225 = load i8*, i8** %3, align 8
  %226 = icmp ne i8* %224, %225
  br i1 %226, label %227, label %230

; <label>:227:                                    ; preds = %222
  %pgocount33 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 9)
  %228 = add i64 %pgocount33, 1
  store i64 %228, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_process, i64 0, i64 9)
  %229 = load i8*, i8** @outname, align 8
  call void @free(i8* %229) #7
  br label %230

; <label>:230:                                    ; preds = %227, %222, %219
  store i32 -1, i32* %2, align 4
  br label %231

; <label>:231:                                    ; preds = %230, %161
  %232 = load i32, i32* %2, align 4
  ret i32 %232
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @endname(i8*) #1 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %24

; <label>:6:                                      ; preds = %1
  %7 = load i8*, i8** %2, align 8
  %8 = call i8* @strrchr(i8* %7, i32 47) #9
  store i8* %8, i8** %3, align 8
  %9 = load i8*, i8** %3, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %22

; <label>:11:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i64 0, i64 2)
  %13 = load i8*, i8** %3, align 8
  %14 = getelementptr inbounds i8, i8* %13, i64 1
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i64 0, i64 3)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i64 0, i64 3)
  %20 = load i8*, i8** %3, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  store i8* %21, i8** %2, align 8
  br label %22

; <label>:22:                                     ; preds = %18, %11, %6
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i64 0, i64 1)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i64 0, i64 1)
  br label %24

; <label>:24:                                     ; preds = %22, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i64 0, i64 0)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_endname, i64 0, i64 0)
  %26 = load i8*, i8** %2, align 8
  ret i8* %26
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #4

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind readonly
declare i8* @strrchr(i8*, i32) #4

declare i32 @printf(i8*, ...) #0

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) #2

; Function Attrs: nounwind
declare i32 @unlink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @open_input(i8*, %struct.stat*) #1 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca %struct.stat*, align 8
  %6 = alloca %struct.fmtdesc*, align 8
  store i8* %0, i8** %4, align 8
  store %struct.stat* %1, %struct.stat** %5, align 8
  %7 = load %struct.fmtdesc*, %struct.fmtdesc** @f_format, align 8
  store %struct.fmtdesc* %7, %struct.fmtdesc** %6, align 8
  %8 = load %struct.stat*, %struct.stat** %5, align 8
  %9 = getelementptr inbounds %struct.stat, %struct.stat* %8, i32 0, i32 2
  store i64 0, i64* %9, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %14, label %12

; <label>:12:                                     ; preds = %2
  store i8* null, i8** @inname, align 8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %13, %struct._IO_FILE** @in, align 8
  br label %70

; <label>:14:                                     ; preds = %2
  %15 = load i32, i32* @f_decode, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %14
  %18 = load i8*, i8** %4, align 8
  %19 = call i8* @codename(i8* %18)
  store i8* %19, i8** @inname, align 8
  br label %42

; <label>:20:                                     ; preds = %14
  %21 = load i32, i32* @f_cat, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %34, label %23

; <label>:23:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 6)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 6)
  %25 = load i8*, i8** %4, align 8
  %26 = call i8* @suffix(i8* %25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0))
  %27 = icmp ne i8* %26, null
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 8)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 8)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = load i8*, i8** @progname, align 8
  %32 = load i8*, i8** %4, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.42, i32 0, i32 0), i8* %31, i8* %32, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %80

; <label>:34:                                     ; preds = %23, %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 4)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 4)
  %36 = load i8*, i8** %4, align 8
  %37 = call i64 @strlen(i8* %36) #9
  %38 = add i64 %37, 1
  %39 = call i8* @emalloc(i64 %38)
  %40 = load i8*, i8** %4, align 8
  %41 = call i8* @strcpy(i8* %39, i8* %40) #7
  store i8* %41, i8** @inname, align 8
  br label %42

; <label>:42:                                     ; preds = %34, %17
  %43 = load i8*, i8** @inname, align 8
  %44 = call %struct._IO_FILE* @fopen(i8* %43, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0))
  store %struct._IO_FILE* %44, %struct._IO_FILE** @in, align 8
  %45 = icmp ne %struct._IO_FILE* %44, null
  br i1 %45, label %53, label %46

; <label>:46:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 2)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 2)
  %48 = load i8*, i8** @inname, align 8
  call void @perror(i8* %48)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = load i8*, i8** @progname, align 8
  %51 = load i8*, i8** @inname, align 8
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.44, i32 0, i32 0), i8* %50, i8* %51)
  store i32 0, i32* %3, align 4
  br label %80

; <label>:53:                                     ; preds = %42
  %54 = load i8*, i8** @inname, align 8
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %56 = load %struct.stat*, %struct.stat** %5, align 8
  %57 = call i32 @okay_as_input(i8* %54, %struct._IO_FILE* %55, %struct.stat* %56)
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %61, label %59

; <label>:59:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 5)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 5)
  store i32 0, i32* %3, align 4
  br label %80

; <label>:61:                                     ; preds = %53
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 3)
  %62 = add i64 %pgocount5, 1
  store i64 %62, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 3)
  %63 = load %struct.fmtdesc*, %struct.fmtdesc** %6, align 8
  %64 = icmp ne %struct.fmtdesc* %63, null
  br i1 %64, label %69, label %65

; <label>:65:                                     ; preds = %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 7)
  %66 = add i64 %pgocount6, 1
  store i64 %66, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 7)
  %67 = load i8*, i8** @inname, align 8
  %68 = call %struct.fmtdesc* @grok_format(i8* %67)
  store %struct.fmtdesc* %68, %struct.fmtdesc** %6, align 8
  br label %69

; <label>:69:                                     ; preds = %65, %61
  br label %70

; <label>:70:                                     ; preds = %69, %12
  %71 = load %struct.fmtdesc*, %struct.fmtdesc** %6, align 8
  %72 = icmp ne %struct.fmtdesc* %71, null
  br i1 %72, label %73, label %76

; <label>:73:                                     ; preds = %70
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 0)
  %74 = add i64 %pgocount7, 1
  store i64 %74, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 0)
  %75 = load %struct.fmtdesc*, %struct.fmtdesc** %6, align 8
  br label %78

; <label>:76:                                     ; preds = %70
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 1)
  %77 = add i64 %pgocount8, 1
  store i64 %77, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_open_input, i64 0, i64 1)
  br label %78

; <label>:78:                                     ; preds = %76, %73
  %79 = phi %struct.fmtdesc* [ %75, %73 ], [ @f_ulaw, %76 ]
  call void @prepare_io(%struct.fmtdesc* %79)
  store i32 1, i32* %3, align 4
  br label %80

; <label>:80:                                     ; preds = %78, %59, %46, %28
  %81 = load i32, i32* %3, align 4
  ret i32 %81
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @open_output(i8*) #1 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 1)
  %10 = load i32, i32* @f_cat, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %8, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 0)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 0)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %14, %struct._IO_FILE** @out, align 8
  store i8* null, i8** @outname, align 8
  br label %74

; <label>:15:                                     ; preds = %8
  store i32 -1, i32* %4, align 4
  %16 = load i32, i32* @f_decode, align 4
  %17 = icmp ne i32 %16, 0
  %18 = zext i1 %17 to i64
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 9)
  %19 = add i64 %pgocount2, %18
  store i64 %19, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 9)
  %20 = select i1 %17, i8* (i8*)* @plainname, i8* (i8*)* @codename
  %21 = load i8*, i8** %3, align 8
  %22 = ptrtoint i8* (i8*)* %20 to i64
  call void @__llvm_profile_instrument_target(i64 %22, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_open_output to i8*), i32 0)
  %23 = call i8* %20(i8* %21)
  store i8* %23, i8** %5, align 8
  %24 = load i8*, i8** %5, align 8
  %25 = call i32 @length_okay(i8* %24)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %29, label %27

; <label>:27:                                     ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 2)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %75

; <label>:29:                                     ; preds = %15
  %30 = load i8*, i8** %5, align 8
  %31 = call i32 (i8*, i32, ...) @open(i8* %30, i32 193, i32 438)
  store i32 %31, i32* %4, align 4
  %32 = icmp sge i32 %31, 0
  br i1 %32, label %33, label %37

; <label>:33:                                     ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 3)
  %34 = add i64 %pgocount4, 1
  store i64 %34, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 3)
  %35 = load i32, i32* %4, align 4
  %36 = call %struct._IO_FILE* @fdopen(i32 %35, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.51, i32 0, i32 0)) #7
  store %struct._IO_FILE* %36, %struct._IO_FILE** @out, align 8
  br label %55

; <label>:37:                                     ; preds = %29
  %38 = call i32* @__errno_location() #10
  %39 = load i32, i32* %38, align 4
  %40 = icmp ne i32 %39, 17
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %37
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 5)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 5)
  store %struct._IO_FILE* null, %struct._IO_FILE** @out, align 8
  br label %54

; <label>:43:                                     ; preds = %37
  %44 = load i8*, i8** %5, align 8
  %45 = call i32 @ok_to_replace(i8* %44)
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %50

; <label>:47:                                     ; preds = %43
  %48 = load i8*, i8** %5, align 8
  %49 = call %struct._IO_FILE* @fopen(i8* %48, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.51, i32 0, i32 0))
  store %struct._IO_FILE* %49, %struct._IO_FILE** @out, align 8
  br label %52

; <label>:50:                                     ; preds = %43
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 8)
  %51 = add i64 %pgocount6, 1
  store i64 %51, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 8)
  store i32 0, i32* %2, align 4
  br label %75

; <label>:52:                                     ; preds = %47
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 7)
  %53 = add i64 %pgocount7, 1
  store i64 %53, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 7)
  br label %54

; <label>:54:                                     ; preds = %52, %41
  br label %55

; <label>:55:                                     ; preds = %54, %33
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %57 = icmp ne %struct._IO_FILE* %56, null
  br i1 %57, label %72, label %58

; <label>:58:                                     ; preds = %55
  %59 = load i8*, i8** %5, align 8
  call void @perror(i8* %59)
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %61 = load i8*, i8** @progname, align 8
  %62 = load i8*, i8** %5, align 8
  %63 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.52, i32 0, i32 0), i8* %61, i8* %62)
  %64 = load i32, i32* %4, align 4
  %65 = icmp sge i32 %64, 0
  br i1 %65, label %66, label %70

; <label>:66:                                     ; preds = %58
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 6)
  %67 = add i64 %pgocount8, 1
  store i64 %67, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 6)
  %68 = load i32, i32* %4, align 4
  %69 = call i32 @close(i32 %68)
  br label %70

; <label>:70:                                     ; preds = %66, %58
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 4)
  %71 = add i64 %pgocount9, 1
  store i64 %71, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_open_output, i64 0, i64 4)
  store i32 0, i32* %2, align 4
  br label %75

; <label>:72:                                     ; preds = %55
  %73 = load i8*, i8** %5, align 8
  store i8* %73, i8** @outname, align 8
  br label %74

; <label>:74:                                     ; preds = %72, %12
  store i32 1, i32* %2, align 4
  br label %75

; <label>:75:                                     ; preds = %74, %70, %50, %27
  %76 = load i32, i32* %2, align 4
  ret i32 %76
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @process_decode() #1 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.gsm_state*, align 8
  %3 = alloca [33 x i8], align 16
  %4 = alloca [160 x i16], align 16
  %5 = alloca i32, align 4
  %6 = call %struct.gsm_state* @gsm_create()
  store %struct.gsm_state* %6, %struct.gsm_state** %2, align 8
  %7 = icmp ne %struct.gsm_state* %6, null
  br i1 %7, label %11, label %8

; <label>:8:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 1)
  %10 = load i8*, i8** @progname, align 8
  call void @perror(i8* %10)
  store i32 -1, i32* %1, align 4
  br label %121

; <label>:11:                                     ; preds = %0
  %12 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %13 = call i32 @gsm_option(%struct.gsm_state* %12, i32 2, i32* @f_fast)
  %14 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %15 = call i32 @gsm_option(%struct.gsm_state* %14, i32 1, i32* @f_verbose)
  br label %16

; <label>:16:                                     ; preds = %91, %11
  %17 = getelementptr inbounds [33 x i8], [33 x i8]* %3, i32 0, i32 0
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %19 = call i64 @fread(i8* %17, i64 1, i64 33, %struct._IO_FILE* %18)
  %20 = trunc i64 %19 to i32
  store i32 %20, i32* %5, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %93

; <label>:22:                                     ; preds = %16
  %23 = load i32, i32* %5, align 4
  %24 = sext i32 %23 to i64
  %25 = icmp ne i64 %24, 33
  br i1 %25, label %26, label %56

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %5, align 4
  %28 = icmp sge i32 %27, 0
  br i1 %28, label %29, label %52

; <label>:29:                                     ; preds = %26
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = load i8*, i8** @progname, align 8
  %32 = load i32, i32* %5, align 4
  %33 = sext i32 %32 to i64
  %34 = sub i64 33, %33
  %35 = load i32, i32* %5, align 4
  %36 = sext i32 %35 to i64
  %37 = sub i64 33, %36
  %38 = icmp eq i64 %37, 1
  %39 = zext i1 %38 to i32
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.50, i32 0, i32 0), i64 %40
  %42 = load i8*, i8** @inname, align 8
  %43 = icmp ne i8* %42, null
  br i1 %43, label %44, label %47

; <label>:44:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 7)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 7)
  %46 = load i8*, i8** @inname, align 8
  br label %49

; <label>:47:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 9)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 9)
  br label %49

; <label>:49:                                     ; preds = %47, %44
  %50 = phi i8* [ %46, %44 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i32 0, i32 0), %47 ]
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.56, i32 0, i32 0), i8* %31, i64 %34, i8* %41, i8* %50)
  br label %52

; <label>:52:                                     ; preds = %49, %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 2)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 2)
  %54 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  call void @gsm_destroy(%struct.gsm_state* %54)
  %55 = call i32* @__errno_location() #10
  store i32 0, i32* %55, align 4
  store i32 -1, i32* %1, align 4
  br label %121

; <label>:56:                                     ; preds = %22
  %57 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %58 = getelementptr inbounds [33 x i8], [33 x i8]* %3, i32 0, i32 0
  %59 = getelementptr inbounds [160 x i16], [160 x i16]* %4, i32 0, i32 0
  %60 = call i32 @gsm_decode(%struct.gsm_state* %57, i8* %58, i16* %59)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %77

; <label>:62:                                     ; preds = %56
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %64 = load i8*, i8** @progname, align 8
  %65 = load i8*, i8** @inname, align 8
  %66 = icmp ne i8* %65, null
  br i1 %66, label %67, label %70

; <label>:67:                                     ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 5)
  %68 = add i64 %pgocount4, 1
  store i64 %68, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 5)
  %69 = load i8*, i8** @inname, align 8
  br label %72

; <label>:70:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 6)
  %71 = add i64 %pgocount5, 1
  store i64 %71, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 6)
  br label %72

; <label>:72:                                     ; preds = %70, %67
  %73 = phi i8* [ %69, %67 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i32 0, i32 0), %70 ]
  %74 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.57, i32 0, i32 0), i8* %64, i8* %73)
  %75 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  call void @gsm_destroy(%struct.gsm_state* %75)
  %76 = call i32* @__errno_location() #10
  store i32 0, i32* %76, align 4
  store i32 -1, i32* %1, align 4
  br label %121

; <label>:77:                                     ; preds = %56
  %78 = load i32 (i16*)*, i32 (i16*)** @output, align 8
  %79 = getelementptr inbounds [160 x i16], [160 x i16]* %4, i32 0, i32 0
  %80 = ptrtoint i32 (i16*)* %78 to i64
  call void @__llvm_profile_instrument_target(i64 %80, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_decode to i8*), i32 0)
  %81 = call i32 %78(i16* %79)
  %82 = icmp slt i32 %81, 0
  br i1 %82, label %83, label %91

; <label>:83:                                     ; preds = %77
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 3)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 3)
  %85 = load i8*, i8** @outname, align 8
  call void @perror(i8* %85)
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %87 = load i8*, i8** @progname, align 8
  %88 = load i8*, i8** @outname, align 8
  %89 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %86, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.58, i32 0, i32 0), i8* %87, i8* %88)
  %90 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  call void @gsm_destroy(%struct.gsm_state* %90)
  store i32 -1, i32* %1, align 4
  br label %121

; <label>:91:                                     ; preds = %77
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 0)
  %92 = add i64 %pgocount7, 1
  store i64 %92, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 0)
  br label %16

; <label>:93:                                     ; preds = %16
  %94 = load i32, i32* %5, align 4
  %95 = icmp slt i32 %94, 0
  br i1 %95, label %96, label %118

; <label>:96:                                     ; preds = %93
  %97 = load i8*, i8** @inname, align 8
  %98 = icmp ne i8* %97, null
  br i1 %98, label %99, label %101

; <label>:99:                                     ; preds = %96
  %100 = load i8*, i8** @inname, align 8
  br label %103

; <label>:101:                                    ; preds = %96
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 10)
  %102 = add i64 %pgocount8, 1
  store i64 %102, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 10)
  br label %103

; <label>:103:                                    ; preds = %101, %99
  %104 = phi i8* [ %100, %99 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i32 0, i32 0), %101 ]
  call void @perror(i8* %104)
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %106 = load i8*, i8** @progname, align 8
  %107 = load i8*, i8** @inname, align 8
  %108 = icmp ne i8* %107, null
  br i1 %108, label %109, label %112

; <label>:109:                                    ; preds = %103
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 8)
  %110 = add i64 %pgocount9, 1
  store i64 %110, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 8)
  %111 = load i8*, i8** @inname, align 8
  br label %114

; <label>:112:                                    ; preds = %103
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 11)
  %113 = add i64 %pgocount10, 1
  store i64 %113, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 11)
  br label %114

; <label>:114:                                    ; preds = %112, %109
  %115 = phi i8* [ %111, %109 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i32 0, i32 0), %112 ]
  %116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.59, i32 0, i32 0), i8* %106, i8* %115)
  %117 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  call void @gsm_destroy(%struct.gsm_state* %117)
  store i32 -1, i32* %1, align 4
  br label %121

; <label>:118:                                    ; preds = %93
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 4)
  %119 = add i64 %pgocount11, 1
  store i64 %119, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_process_decode, i64 0, i64 4)
  %120 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  call void @gsm_destroy(%struct.gsm_state* %120)
  store i32 0, i32* %1, align 4
  br label %121

; <label>:121:                                    ; preds = %118, %114, %83, %72, %52, %8
  %122 = load i32, i32* %1, align 4
  ret i32 %122
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @process_encode() #1 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.gsm_state*, align 8
  %3 = alloca [160 x i16], align 16
  %4 = alloca [33 x i8], align 16
  %5 = alloca i32, align 4
  %6 = call %struct.gsm_state* @gsm_create()
  store %struct.gsm_state* %6, %struct.gsm_state** %2, align 8
  %7 = icmp ne %struct.gsm_state* %6, null
  br i1 %7, label %11, label %8

; <label>:8:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 2)
  %10 = load i8*, i8** @progname, align 8
  call void @perror(i8* %10)
  store i32 -1, i32* %1, align 4
  br label %97

; <label>:11:                                     ; preds = %0
  %12 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %13 = call i32 @gsm_option(%struct.gsm_state* %12, i32 2, i32* @f_fast)
  %14 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %15 = call i32 @gsm_option(%struct.gsm_state* %14, i32 1, i32* @f_verbose)
  br label %16

; <label>:16:                                     ; preds = %67, %11
  %17 = load i32 (i16*)*, i32 (i16*)** @input, align 8
  %18 = getelementptr inbounds [160 x i16], [160 x i16]* %3, i32 0, i32 0
  %19 = ptrtoint i32 (i16*)* %17 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_encode to i8*), i32 0)
  %20 = call i32 %17(i16* %18)
  store i32 %20, i32* %5, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %69

; <label>:22:                                     ; preds = %16
  %23 = load i32, i32* %5, align 4
  %24 = sext i32 %23 to i64
  %25 = icmp ult i64 %24, 160
  br i1 %25, label %26, label %37

; <label>:26:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 1)
  %28 = getelementptr inbounds [160 x i16], [160 x i16]* %3, i32 0, i32 0
  %29 = load i32, i32* %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i16, i16* %28, i64 %30
  %32 = bitcast i16* %31 to i8*
  %33 = load i32, i32* %5, align 4
  %34 = sext i32 %33 to i64
  %35 = mul i64 %34, 2
  %36 = sub i64 320, %35
  call void @llvm.memset.p0i8.i64(i8* %32, i8 0, i64 %36, i32 1, i1 false)
  br label %37

; <label>:37:                                     ; preds = %26, %22
  %38 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %39 = getelementptr inbounds [160 x i16], [160 x i16]* %3, i32 0, i32 0
  %40 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i32 0, i32 0
  call void @gsm_encode(%struct.gsm_state* %38, i16* %39, i8* %40)
  %41 = getelementptr inbounds [33 x i8], [33 x i8]* %4, i32 0, i32 0
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %43 = call i64 @fwrite(i8* %41, i64 33, i64 1, %struct._IO_FILE* %42)
  %44 = icmp ne i64 %43, 1
  br i1 %44, label %45, label %67

; <label>:45:                                     ; preds = %37
  %46 = load i8*, i8** @outname, align 8
  %47 = icmp ne i8* %46, null
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %45
  %49 = load i8*, i8** @outname, align 8
  br label %52

; <label>:50:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 5)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 5)
  br label %52

; <label>:52:                                     ; preds = %50, %48
  %53 = phi i8* [ %49, %48 ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0), %50 ]
  call void @perror(i8* %53)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = load i8*, i8** @progname, align 8
  %56 = load i8*, i8** @outname, align 8
  %57 = icmp ne i8* %56, null
  br i1 %57, label %58, label %61

; <label>:58:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 4)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 4)
  %60 = load i8*, i8** @outname, align 8
  br label %63

; <label>:61:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 6)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 6)
  br label %63

; <label>:63:                                     ; preds = %61, %58
  %64 = phi i8* [ %60, %58 ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.36, i32 0, i32 0), %61 ]
  %65 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.58, i32 0, i32 0), i8* %55, i8* %64)
  %66 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  call void @gsm_destroy(%struct.gsm_state* %66)
  store i32 -1, i32* %1, align 4
  br label %97

; <label>:67:                                     ; preds = %37
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 0)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 0)
  br label %16

; <label>:69:                                     ; preds = %16
  %70 = load i32, i32* %5, align 4
  %71 = icmp slt i32 %70, 0
  br i1 %71, label %72, label %94

; <label>:72:                                     ; preds = %69
  %73 = load i8*, i8** @inname, align 8
  %74 = icmp ne i8* %73, null
  br i1 %74, label %75, label %77

; <label>:75:                                     ; preds = %72
  %76 = load i8*, i8** @inname, align 8
  br label %79

; <label>:77:                                     ; preds = %72
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 8)
  %78 = add i64 %pgocount6, 1
  store i64 %78, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 8)
  br label %79

; <label>:79:                                     ; preds = %77, %75
  %80 = phi i8* [ %76, %75 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i32 0, i32 0), %77 ]
  call void @perror(i8* %80)
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %82 = load i8*, i8** @progname, align 8
  %83 = load i8*, i8** @inname, align 8
  %84 = icmp ne i8* %83, null
  br i1 %84, label %85, label %88

; <label>:85:                                     ; preds = %79
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 7)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 7)
  %87 = load i8*, i8** @inname, align 8
  br label %90

; <label>:88:                                     ; preds = %79
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 9)
  %89 = add i64 %pgocount8, 1
  store i64 %89, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 9)
  br label %90

; <label>:90:                                     ; preds = %88, %85
  %91 = phi i8* [ %87, %85 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i32 0, i32 0), %88 ]
  %92 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.59, i32 0, i32 0), i8* %82, i8* %91)
  %93 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  call void @gsm_destroy(%struct.gsm_state* %93)
  store i32 -1, i32* %1, align 4
  br label %97

; <label>:94:                                     ; preds = %69
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 3)
  %95 = add i64 %pgocount9, 1
  store i64 %95, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_process_encode, i64 0, i64 3)
  %96 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  call void @gsm_destroy(%struct.gsm_state* %96)
  store i32 0, i32* %1, align 4
  br label %97

; <label>:97:                                     ; preds = %94, %90, %63, %8
  %98 = load i32, i32* %1, align 4
  ret i32 %98
}

declare i32 @fflush(%struct._IO_FILE*) #0

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #2

declare void @perror(i8*) #0

; Function Attrs: noinline nounwind uwtable
define internal void @update_times() #1 {
  %1 = alloca [2 x i64], align 16
  %2 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i32 0, i32 2), align 8
  %3 = icmp ne i64 %2, 0
  br i1 %3, label %6, label %4

; <label>:4:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_times, i64 0, i64 2)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_times, i64 0, i64 2)
  br label %20

; <label>:6:                                      ; preds = %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_times, i64 0, i64 0)
  %7 = add i64 %pgocount1, 1
  store i64 %7, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_times, i64 0, i64 0)
  %8 = load i8*, i8** @outname, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %20

; <label>:10:                                     ; preds = %6
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_times, i64 0, i64 1)
  %11 = add i64 %pgocount2, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_times, i64 0, i64 1)
  %12 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i32 0, i32 11, i32 0), align 8
  %13 = getelementptr inbounds [2 x i64], [2 x i64]* %1, i64 0, i64 0
  store i64 %12, i64* %13, align 16
  %14 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i32 0, i32 12, i32 0), align 8
  %15 = getelementptr inbounds [2 x i64], [2 x i64]* %1, i64 0, i64 1
  store i64 %14, i64* %15, align 8
  %16 = load i8*, i8** @outname, align 8
  %17 = getelementptr inbounds [2 x i64], [2 x i64]* %1, i32 0, i32 0
  %18 = bitcast i64* %17 to %struct.utimbuf*
  %19 = call i32 @utime(i8* %16, %struct.utimbuf* %18) #7
  br label %20

; <label>:20:                                     ; preds = %10, %6, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @update_mode() #1 {
  %1 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i32 0, i32 2), align 8
  %2 = icmp ne i64 %1, 0
  br i1 %2, label %5, label %3

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_mode, i64 0, i64 2)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_mode, i64 0, i64 2)
  br label %20

; <label>:5:                                      ; preds = %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_mode, i64 0, i64 0)
  %6 = add i64 %pgocount1, 1
  store i64 %6, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_mode, i64 0, i64 0)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %8 = call i32 @fileno(%struct._IO_FILE* %7) #7
  %9 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i32 0, i32 3), align 8
  %10 = and i32 %9, 4095
  %11 = call i32 @fchmod(i32 %8, i32 %10) #7
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %20

; <label>:13:                                     ; preds = %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_mode, i64 0, i64 1)
  %14 = add i64 %pgocount2, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_update_mode, i64 0, i64 1)
  %15 = load i8*, i8** @outname, align 8
  call void @perror(i8* %15)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = load i8*, i8** @progname, align 8
  %18 = load i8*, i8** @outname, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.60, i32 0, i32 0), i8* %17, i8* %18)
  br label %20

; <label>:20:                                     ; preds = %13, %5, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @update_own() #1 {
  %1 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i32 0, i32 2), align 8
  %2 = icmp ne i64 %1, 0
  br i1 %2, label %5, label %3

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_update_own, i64 0, i64 1)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_update_own, i64 0, i64 1)
  br label %12

; <label>:5:                                      ; preds = %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_update_own, i64 0, i64 0)
  %6 = add i64 %pgocount1, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_update_own, i64 0, i64 0)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %8 = call i32 @fileno(%struct._IO_FILE* %7) #7
  %9 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i32 0, i32 4), align 4
  %10 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @instat, i32 0, i32 5), align 8
  %11 = call i32 @fchown(i32 %8, i32 %9, i32 %10) #7
  br label %12

; <label>:12:                                     ; preds = %5, %3
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #0

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #5

; Function Attrs: noinline nounwind uwtable
define internal i8* @codename(i8*) #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_codename, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_codename, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = call i8* @normalname(i8* %4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.45, i32 0, i32 0))
  ret i8* %5
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @suffix(i8*, i8*) #1 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = call i64 @strlen(i8* %8) #9
  store i64 %9, i64* %6, align 8
  %10 = load i8*, i8** %5, align 8
  %11 = call i64 @strlen(i8* %10) #9
  store i64 %11, i64* %7, align 8
  %12 = load i64, i64* %7, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i64 0, i64 1)
  %16 = load i64, i64* %6, align 8
  %17 = load i64, i64* %7, align 8
  %18 = icmp ule i64 %16, %17
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i64 0, i64 0)
  store i8* null, i8** %3, align 8
  br label %39

; <label>:21:                                     ; preds = %14
  %22 = load i64, i64* %6, align 8
  %23 = load i64, i64* %7, align 8
  %24 = sub i64 %22, %23
  %25 = load i8*, i8** %4, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 %24
  store i8* %26, i8** %4, align 8
  %27 = load i8*, i8** %4, align 8
  %28 = load i8*, i8** %5, align 8
  %29 = load i64, i64* %7, align 8
  %30 = call i32 @memcmp(i8* %27, i8* %28, i64 %29) #9
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i64 0, i64 2)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i64 0, i64 2)
  br label %37

; <label>:34:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i64 0, i64 3)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_suffix, i64 0, i64 3)
  %36 = load i8*, i8** %4, align 8
  br label %37

; <label>:37:                                     ; preds = %34, %32
  %38 = phi i8* [ null, %32 ], [ %36, %34 ]
  store i8* %38, i8** %3, align 8
  br label %39

; <label>:39:                                     ; preds = %37, %19
  %40 = load i8*, i8** %3, align 8
  ret i8* %40
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal i8* @emalloc(i64) #1 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call noalias i8* @malloc(i64 %4) #7
  store i8* %5, i8** %3, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %13, label %7

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emalloc, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emalloc, i64 0, i64 1)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = load i8*, i8** @progname, align 8
  %11 = load i64, i64* %2, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.46, i32 0, i32 0), i8* %10, i64 %11)
  call void @onintr()
  call void @exit(i32 1) #8
  unreachable

; <label>:13:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emalloc, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_emalloc, i64 0, i64 0)
  %15 = load i8*, i8** %3, align 8
  ret i8* %15
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #0

; Function Attrs: noinline nounwind uwtable
define internal i32 @okay_as_input(i8*, %struct._IO_FILE*, %struct.stat*) #1 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct.stat*, align 8
  store i8* %0, i8** %5, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %6, align 8
  store %struct.stat* %2, %struct.stat** %7, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %9 = call i32 @fileno(%struct._IO_FILE* %8) #7
  %10 = load %struct.stat*, %struct.stat** %7, align 8
  %11 = call i32 @fstat(i32 %9, %struct.stat* %10) #7
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %20

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 0)
  %15 = load i8*, i8** %5, align 8
  call void @perror(i8* %15)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = load i8*, i8** @progname, align 8
  %18 = load i8*, i8** %5, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.47, i32 0, i32 0), i8* %17, i8* %18)
  store i32 0, i32* %4, align 4
  br label %64

; <label>:20:                                     ; preds = %3
  %21 = load %struct.stat*, %struct.stat** %7, align 8
  %22 = getelementptr inbounds %struct.stat, %struct.stat* %21, i32 0, i32 3
  %23 = load i32, i32* %22, align 8
  %24 = and i32 %23, 61440
  %25 = icmp eq i32 %24, 32768
  br i1 %25, label %32, label %26

; <label>:26:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 1)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = load i8*, i8** @progname, align 8
  %30 = load i8*, i8** %5, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.48, i32 0, i32 0), i8* %29, i8* %30)
  store i32 0, i32* %4, align 4
  br label %64

; <label>:32:                                     ; preds = %20
  %33 = load %struct.stat*, %struct.stat** %7, align 8
  %34 = getelementptr inbounds %struct.stat, %struct.stat* %33, i32 0, i32 2
  %35 = load i64, i64* %34, align 8
  %36 = icmp ugt i64 %35, 1
  br i1 %36, label %37, label %62

; <label>:37:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 3)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 3)
  %39 = load i32, i32* @f_cat, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %62, label %41

; <label>:41:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 4)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 4)
  %43 = load i32, i32* @f_precious, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %62, label %45

; <label>:45:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 5)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 5)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = load i8*, i8** @progname, align 8
  %49 = load i8*, i8** %5, align 8
  %50 = load %struct.stat*, %struct.stat** %7, align 8
  %51 = getelementptr inbounds %struct.stat, %struct.stat* %50, i32 0, i32 2
  %52 = load i64, i64* %51, align 8
  %53 = sub i64 %52, 1
  %54 = load %struct.stat*, %struct.stat** %7, align 8
  %55 = getelementptr inbounds %struct.stat, %struct.stat* %54, i32 0, i32 2
  %56 = load i64, i64* %55, align 8
  %57 = icmp ule i64 %56, 2
  %58 = zext i1 %57 to i32
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.50, i32 0, i32 0), i64 %59
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.49, i32 0, i32 0), i8* %48, i8* %49, i64 %53, i8* %60)
  store i32 0, i32* %4, align 4
  br label %64

; <label>:62:                                     ; preds = %41, %37, %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 2)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_okay_as_input, i64 0, i64 2)
  store i32 1, i32* %4, align 4
  br label %64

; <label>:64:                                     ; preds = %62, %45, %26, %13
  %65 = load i32, i32* %4, align 4
  ret i32 %65
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.fmtdesc* @grok_format(i8*) #1 {
  %2 = alloca %struct.fmtdesc*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.fmtdesc**, align 8
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %8, label %52

; <label>:8:                                      ; preds = %1
  %9 = load i8*, i8** %3, align 8
  %10 = call i8* @plainname(i8* %9)
  store i8* %10, i8** %4, align 8
  store %struct.fmtdesc** getelementptr inbounds ([5 x %struct.fmtdesc*], [5 x %struct.fmtdesc*]* @alldescs, i32 0, i32 0), %struct.fmtdesc*** %5, align 8
  br label %11

; <label>:11:                                     ; preds = %45, %8
  %12 = load %struct.fmtdesc**, %struct.fmtdesc*** %5, align 8
  %13 = load %struct.fmtdesc*, %struct.fmtdesc** %12, align 8
  %14 = icmp ne %struct.fmtdesc* %13, null
  br i1 %14, label %15, label %49

; <label>:15:                                     ; preds = %11
  %16 = load %struct.fmtdesc**, %struct.fmtdesc*** %5, align 8
  %17 = load %struct.fmtdesc*, %struct.fmtdesc** %16, align 8
  %18 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %17, i32 0, i32 2
  %19 = load i8*, i8** %18, align 8
  %20 = icmp ne i8* %19, null
  br i1 %20, label %21, label %44

; <label>:21:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 1)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 1)
  %23 = load %struct.fmtdesc**, %struct.fmtdesc*** %5, align 8
  %24 = load %struct.fmtdesc*, %struct.fmtdesc** %23, align 8
  %25 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %24, i32 0, i32 2
  %26 = load i8*, i8** %25, align 8
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %44

; <label>:30:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 2)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 2)
  %32 = load i8*, i8** %4, align 8
  %33 = load %struct.fmtdesc**, %struct.fmtdesc*** %5, align 8
  %34 = load %struct.fmtdesc*, %struct.fmtdesc** %33, align 8
  %35 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %34, i32 0, i32 2
  %36 = load i8*, i8** %35, align 8
  %37 = call i8* @suffix(i8* %32, i8* %36)
  %38 = icmp ne i8* %37, null
  br i1 %38, label %39, label %44

; <label>:39:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 5)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 5)
  %41 = load i8*, i8** %4, align 8
  call void @free(i8* %41) #7
  %42 = load %struct.fmtdesc**, %struct.fmtdesc*** %5, align 8
  %43 = load %struct.fmtdesc*, %struct.fmtdesc** %42, align 8
  store %struct.fmtdesc* %43, %struct.fmtdesc** %2, align 8
  br label %54

; <label>:44:                                     ; preds = %30, %21, %15
  br label %45

; <label>:45:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 0)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 0)
  %47 = load %struct.fmtdesc**, %struct.fmtdesc*** %5, align 8
  %48 = getelementptr inbounds %struct.fmtdesc*, %struct.fmtdesc** %47, i32 1
  store %struct.fmtdesc** %48, %struct.fmtdesc*** %5, align 8
  br label %11

; <label>:49:                                     ; preds = %11
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 4)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 4)
  %51 = load i8*, i8** %4, align 8
  call void @free(i8* %51) #7
  br label %52

; <label>:52:                                     ; preds = %49, %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 3)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_grok_format, i64 0, i64 3)
  store %struct.fmtdesc* null, %struct.fmtdesc** %2, align 8
  br label %54

; <label>:54:                                     ; preds = %52, %39
  %55 = load %struct.fmtdesc*, %struct.fmtdesc** %2, align 8
  ret %struct.fmtdesc* %55
}

; Function Attrs: noinline nounwind uwtable
define internal void @prepare_io(%struct.fmtdesc*) #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_prepare_io, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_prepare_io, i64 0, i64 0)
  %3 = alloca %struct.fmtdesc*, align 8
  store %struct.fmtdesc* %0, %struct.fmtdesc** %3, align 8
  %4 = load %struct.fmtdesc*, %struct.fmtdesc** %3, align 8
  %5 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %4, i32 0, i32 6
  %6 = load i32 (i16*)*, i32 (i16*)** %5, align 8
  store i32 (i16*)* %6, i32 (i16*)** @output, align 8
  %7 = load %struct.fmtdesc*, %struct.fmtdesc** %3, align 8
  %8 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %7, i32 0, i32 5
  %9 = load i32 (i16*)*, i32 (i16*)** %8, align 8
  store i32 (i16*)* %9, i32 (i16*)** @input, align 8
  %10 = load %struct.fmtdesc*, %struct.fmtdesc** %3, align 8
  %11 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %10, i32 0, i32 3
  %12 = load i32 ()*, i32 ()** %11, align 8
  store i32 ()* %12, i32 ()** @init_input, align 8
  %13 = load %struct.fmtdesc*, %struct.fmtdesc** %3, align 8
  %14 = getelementptr inbounds %struct.fmtdesc, %struct.fmtdesc* %13, i32 0, i32 4
  %15 = load i32 ()*, i32 ()** %14, align 8
  store i32 ()* %15, i32 ()** @init_output, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @normalname(i8*, i8*, i8*) #1 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store i8* null, i8** %10, align 8
  %11 = load i8*, i8** %5, align 8
  %12 = icmp ne i8* %11, null
  br i1 %12, label %16, label %13

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 1)
  %15 = load i8*, i8** %10, align 8
  store i8* %15, i8** %4, align 8
  br label %59

; <label>:16:                                     ; preds = %3
  %17 = load i8*, i8** %5, align 8
  %18 = call i64 @strlen(i8* %17) #9
  %19 = add i64 %18, 1
  %20 = load i8*, i8** %6, align 8
  %21 = call i64 @strlen(i8* %20) #9
  %22 = add i64 %19, %21
  %23 = load i8*, i8** %7, align 8
  %24 = call i64 @strlen(i8* %23) #9
  %25 = add i64 %22, %24
  store i64 %25, i64* %8, align 8
  %26 = load i64, i64* %8, align 8
  %27 = call i8* @emalloc(i64 %26)
  %28 = load i8*, i8** %5, align 8
  %29 = call i8* @strcpy(i8* %27, i8* %28) #7
  store i8* %29, i8** %10, align 8
  %30 = load i8*, i8** %10, align 8
  %31 = load i8*, i8** %7, align 8
  %32 = call i8* @suffix(i8* %30, i8* %31)
  store i8* %32, i8** %9, align 8
  %33 = icmp ne i8* %32, null
  br i1 %33, label %34, label %39

; <label>:34:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 0)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 0)
  %36 = load i8*, i8** %9, align 8
  %37 = load i8*, i8** %6, align 8
  %38 = call i8* @strcpy(i8* %36, i8* %37) #7
  br label %57

; <label>:39:                                     ; preds = %16
  %40 = load i8*, i8** %6, align 8
  %41 = load i8, i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %55

; <label>:44:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 3)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 3)
  %46 = load i8*, i8** %10, align 8
  %47 = load i8*, i8** %6, align 8
  %48 = call i8* @suffix(i8* %46, i8* %47)
  %49 = icmp ne i8* %48, null
  br i1 %49, label %55, label %50

; <label>:50:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 4)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 4)
  %52 = load i8*, i8** %10, align 8
  %53 = load i8*, i8** %6, align 8
  %54 = call i8* @strcat(i8* %52, i8* %53) #7
  br label %55

; <label>:55:                                     ; preds = %50, %44, %39
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 2)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_normalname, i64 0, i64 2)
  br label %57

; <label>:57:                                     ; preds = %55, %34
  %58 = load i8*, i8** %10, align 8
  store i8* %58, i8** %4, align 8
  br label %59

; <label>:59:                                     ; preds = %57, %13
  %60 = load i8*, i8** %4, align 8
  ret i8* %60
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8*, i8*, i64) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare i32 @fstat(i32, %struct.stat*) #2

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define internal i8* @plainname(i8*) #1 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_plainname, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_plainname, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = call i8* @normalname(i8* %4, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0))
  ret i8* %5
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @length_okay(i8*) #1 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i64 0, i64* %4, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %10, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %31

; <label>:10:                                     ; preds = %1
  %11 = load i8*, i8** %3, align 8
  %12 = call i8* @endname(i8* %11)
  store i8* %12, i8** %5, align 8
  %13 = load i64, i64* %4, align 8
  %14 = icmp sgt i64 %13, 0
  br i1 %14, label %15, label %29

; <label>:15:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i64 0, i64 2)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i64 0, i64 2)
  %17 = load i8*, i8** %5, align 8
  %18 = call i64 @strlen(i8* %17) #9
  %19 = load i64, i64* %4, align 8
  %20 = icmp ugt i64 %18, %19
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i64 0, i64 3)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i64 0, i64 3)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = load i8*, i8** @progname, align 8
  %25 = load i8*, i8** %3, align 8
  %26 = call i8* @endname(i8* %25)
  %27 = load i64, i64* %4, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.53, i32 0, i32 0), i8* %24, i8* %26, i64 %27)
  store i32 0, i32* %2, align 4
  br label %31

; <label>:29:                                     ; preds = %15, %10
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i64 0, i64 0)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_length_okay, i64 0, i64 0)
  store i32 1, i32* %2, align 4
  br label %31

; <label>:31:                                     ; preds = %29, %21, %8
  %32 = load i32, i32* %2, align 4
  ret i32 %32
}

declare i32 @open(i8*, i32, ...) #0

; Function Attrs: nounwind
declare %struct._IO_FILE* @fdopen(i32, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @ok_to_replace(i8*) #1 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  %6 = load i32, i32* @f_force, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 2)
  store i32 1, i32* %2, align 4
  br label %47

; <label>:10:                                     ; preds = %1
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 @fileno(%struct._IO_FILE* %11) #7
  %13 = call i32 @isatty(i32 %12) #7
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %17, label %15

; <label>:15:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 3)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 3)
  store i32 0, i32* %2, align 4
  br label %47

; <label>:17:                                     ; preds = %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load i8*, i8** %3, align 8
  %20 = load i8*, i8** %3, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.54, i32 0, i32 0), i8* %19, i8* %20)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 @fflush(%struct._IO_FILE* %22)
  %24 = call i32 @getchar()
  store i32 %24, i32* %4, align 4
  store i32 %24, i32* %5, align 4
  br label %25

; <label>:25:                                     ; preds = %35, %17
  %26 = load i32, i32* %5, align 4
  %27 = icmp ne i32 %26, 10
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 1)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 1)
  %30 = load i32, i32* %5, align 4
  %31 = icmp ne i32 %30, -1
  br label %32

; <label>:32:                                     ; preds = %28, %25
  %33 = phi i1 [ false, %25 ], [ %31, %28 ]
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %32
  br label %35

; <label>:35:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 0)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 0)
  %37 = call i32 @getchar()
  store i32 %37, i32* %5, align 4
  br label %25

; <label>:38:                                     ; preds = %32
  %39 = load i32, i32* %4, align 4
  %40 = icmp eq i32 %39, 121
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 4)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 4)
  store i32 1, i32* %2, align 4
  br label %47

; <label>:43:                                     ; preds = %38
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 5)
  %44 = add i64 %pgocount5, 1
  store i64 %44, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_ok_to_replace, i64 0, i64 5)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.55, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %47

; <label>:47:                                     ; preds = %43, %41, %15, %8
  %48 = load i32, i32* %2, align 4
  ret i32 %48
}

declare i32 @close(i32) #0

; Function Attrs: nounwind
declare i32 @isatty(i32) #2

declare i32 @getchar() #0

declare %struct.gsm_state* @gsm_create() #0

declare i32 @gsm_option(%struct.gsm_state*, i32, i32*) #0

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #0

declare void @gsm_destroy(%struct.gsm_state*) #0

declare i32 @gsm_decode(%struct.gsm_state*, i8*, i16*) #0

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #6

declare void @gsm_encode(%struct.gsm_state*, i16*, i8*) #0

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #0

; Function Attrs: nounwind
declare i32 @utime(i8*, %struct.utimbuf*) #2

; Function Attrs: nounwind
declare i32 @fchmod(i32, i32) #2

; Function Attrs: nounwind
declare i32 @fchown(i32, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #7

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #7

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #7

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }
attributes #10 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
