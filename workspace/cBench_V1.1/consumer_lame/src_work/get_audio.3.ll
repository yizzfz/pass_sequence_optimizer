; ModuleID = 'get_audio.2.ll'
source_filename = "get_audio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.fmt_chunk_data_struct = type { i16, i16, i64, i64, i16, i16 }
%struct.IFF_AIFF_struct = type { i16, i64, i16, float, i64, %struct.blockAlign_struct }
%struct.blockAlign_struct = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@count_samples_carefully = internal global i32 0, align 4
@get_audio.num_samples_read = internal global i64 0, align 8
@num_samples = internal global i64 0, align 8
@musicin = internal global %struct._IO_FILE* null, align 8
@input_bitrate = internal global i32 0, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [34 x i8] c"Could not close audio input file\0A\00", align 1
@samp_freq = internal global i32 0, align 4
@num_channels = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@stdin = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"Could not find \22%s\22.\0A\00", align 1
@.str.4 = private unnamed_addr constant [45 x i8] c"Error reading headers in mp3 input file %s.\0A\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"Assuming raw pcm input file\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c" : Forcing byte-swapping\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [26 x i8] c"Error reading input file\0A\00", align 1
@NativeByteOrder = external global i32, align 4
@.str.9 = private unnamed_addr constant [27 x i8] c"byte order not determined\0A\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.11 = private unnamed_addr constant [38 x i8] c"%d-bit sample-size is not supported!\0A\00", align 1
@.str.12 = private unnamed_addr constant [32 x i8] c"Sound data is not PCM in \22%s\22.\0A\00", align 1
@.str.13 = private unnamed_addr constant [36 x i8] c"Sound data is not %d bits in \22%s\22.\0A\00", align 1
@.str.14 = private unnamed_addr constant [43 x i8] c"Sound data is not mono or stereo in \22%s\22.\0A\00", align 1
@.str.15 = private unnamed_addr constant [37 x i8] c"Block size is not %d bytes in \22%s\22.\0A\00", align 1
@.str.16 = private unnamed_addr constant [39 x i8] c"Block offset is not %d bytes in \22%s\22.\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_lame_init_infile = private constant [16 x i8] c"lame_init_infile"
@__profn_OpenSndFile = private constant [11 x i8] c"OpenSndFile"
@__profn_GetSndSampleRate = private constant [16 x i8] c"GetSndSampleRate"
@__profn_GetSndChannels = private constant [14 x i8] c"GetSndChannels"
@__profn_GetSndSamples = private constant [13 x i8] c"GetSndSamples"
@__profn_lame_close_infile = private constant [17 x i8] c"lame_close_infile"
@__profn_CloseSndFile = private constant [12 x i8] c"CloseSndFile"
@__profn_lame_readframe = private constant [14 x i8] c"lame_readframe"
@__profn_get_audio = private constant [9 x i8] c"get_audio"
@__profn_read_samples_mp3 = private constant [16 x i8] c"read_samples_mp3"
@__profn_read_samples_pcm = private constant [16 x i8] c"read_samples_pcm"
@__profn_GetSndBitrate = private constant [13 x i8] c"GetSndBitrate"
@__profn_fskip = private constant [5 x i8] c"fskip"
@__profn_parse_file_header = private constant [17 x i8] c"parse_file_header"
@__profn_tmp1.ll_parse_wave_header = private constant [25 x i8] c"tmp1.ll:parse_wave_header"
@__profn_tmp1.ll_parse_aiff_header = private constant [25 x i8] c"tmp1.ll:parse_aiff_header"
@__profn_tmp1.ll_wave_check = private constant [18 x i8] c"tmp1.ll:wave_check"
@__profn_tmp1.ll_aiff_check2 = private constant [19 x i8] c"tmp1.ll:aiff_check2"
@__profc_lame_init_infile = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_init_infile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5657914578881189576, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_init_infile, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*)* @lame_init_infile to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_OpenSndFile = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_OpenSndFile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5354364006873720863, i64 166681220521, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i32 0, i32 0), i8* bitcast (%struct._IO_FILE* (%struct.lame_global_flags*, i8*, i32, i32)* @OpenSndFile to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_GetSndSampleRate = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_GetSndSampleRate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1264229721723985854, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndSampleRate, i32 0, i32 0), i8* bitcast (i32 ()* @GetSndSampleRate to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_GetSndChannels = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_GetSndChannels = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 999552317098516693, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndChannels, i32 0, i32 0), i8* bitcast (i32 ()* @GetSndChannels to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_GetSndSamples = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_GetSndSamples = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7451710391363068183, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndSamples, i32 0, i32 0), i8* bitcast (i64 ()* @GetSndSamples to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_close_infile = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_close_infile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5015129296701133304, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_close_infile, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*)* @lame_close_infile to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_CloseSndFile = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_CloseSndFile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7022804191192148308, i64 24868915205, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CloseSndFile, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*)* @CloseSndFile to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_readframe = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_readframe = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3074689092956815711, i64 55817546142, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, [1152 x i16]*)* @lame_readframe to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_get_audio = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_get_audio = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7542845800135278794, i64 136142551281, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, [1152 x i16]*, i32)* @get_audio to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_read_samples_mp3 = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_read_samples_mp3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3603784380601505628, i64 64137428002, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, %struct._IO_FILE*, [1152 x i16]*, i32)* @read_samples_mp3 to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_read_samples_pcm = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_read_samples_pcm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -352421472974444760, i64 154316281605, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i16*, i32, i32)* @read_samples_pcm to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_GetSndBitrate = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_GetSndBitrate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6542523574975241663, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndBitrate, i32 0, i32 0), i8* bitcast (i32 ()* @GetSndBitrate to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_fskip = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fskip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5683250454509044485, i64 43380092889, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_fskip, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, i64, i32)* @fskip to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_parse_file_header = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_parse_file_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 150197237268636383, i64 91608552321, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, %struct._IO_FILE*)* @parse_file_header to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_parse_wave_header = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_parse_wave_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3229516125037407807, i64 149558100545, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_parse_aiff_header = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_parse_aiff_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7249705977235580430, i64 132550950871, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_wave_check = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_wave_check = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -275020191800763828, i64 24868915205, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wave_check, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_aiff_check2 = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_aiff_check2 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3755668579434937276, i64 82329086393, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [163 x i8] c"\A5\02\9F\01x\DAu\8E\C1\0A\C20\10D\C9\0F\09\EA\CD\A3\05=\0A\F6\03\C2\92n\CC\D2M\BA$\A9\FE\BEIj\85\0A^\C2d\DE0\B3\0C\1E5\05\CA\E5\B1\C4\A8n\82\A1\0F\C3\A5\EA+\E6\22{\F0\C2x\87\BC\1A\9D\83\10\90\D3\86'\C5\B5\CA\F0\94p\ED\EA\EAg-k8\22\0C6\16\A5\1E\985\CC\03M\AAz:-%\DA\CBqk\88\F1\9F\9D3\E5X\8F\B0i$Q\02\B1\0C\D5\19\EDJ\1E\A3\CA^\F6;\E6\D3B^\F0\FCC\80\AC\FD%-m\1C\9A\F1k\B5X\B3\0Eo\85\A3lq", section "__llvm_prf_names"
@llvm.used = appending global [19 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_init_infile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_OpenSndFile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_GetSndSampleRate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_GetSndChannels to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_GetSndSamples to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_close_infile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_CloseSndFile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_readframe to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_get_audio to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_samples_mp3 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_samples_pcm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_GetSndBitrate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fskip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_parse_file_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_parse_wave_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_parse_aiff_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_wave_check to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_aiff_check2 to i8*), i8* getelementptr inbounds ([163 x i8], [163 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @lame_init_infile(%struct.lame_global_flags*) #0 {
  %2 = alloca %struct.lame_global_flags*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %2, align 8
  store i32 0, i32* @count_samples_carefully, align 4
  %3 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %4 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %4, i32 0, i32 31
  %6 = load i8*, i8** %5, align 8
  %7 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %7, i32 0, i32 2
  %9 = load i32, i32* %8, align 4
  %10 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %11 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %10, i32 0, i32 1
  %12 = load i32, i32* %11, align 8
  %13 = call %struct._IO_FILE* @OpenSndFile(%struct.lame_global_flags* %3, i8* %6, i32 %9, i32 %12)
  %14 = call i32 @GetSndSampleRate()
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %21

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_init_infile, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_init_infile, i64 0, i64 1)
  %18 = call i32 @GetSndSampleRate()
  %19 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %19, i32 0, i32 2
  store i32 %18, i32* %20, align 4
  br label %21

; <label>:21:                                     ; preds = %16, %1
  %22 = call i32 @GetSndChannels()
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_init_infile, i64 0, i64 2)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_init_infile, i64 0, i64 2)
  %26 = call i32 @GetSndChannels()
  %27 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %28 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %27, i32 0, i32 1
  store i32 %26, i32* %28, align 8
  br label %29

; <label>:29:                                     ; preds = %24, %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_init_infile, i64 0, i64 0)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_init_infile, i64 0, i64 0)
  %31 = call i64 @GetSndSamples()
  %32 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %32, i32 0, i32 0
  store i64 %31, i64* %33, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define %struct._IO_FILE* @OpenSndFile(%struct.lame_global_flags*, i8*, i32, i32) #0 {
  %5 = alloca %struct.lame_global_flags*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.stat, align 8
  %10 = alloca float, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i64 4294967295, i64* @num_samples, align 8
  %11 = load i32, i32* %7, align 4
  store i32 %11, i32* @samp_freq, align 4
  %12 = load i32, i32* %8, align 4
  store i32 %12, i32* @num_channels, align 4
  %13 = load i8*, i8** %6, align 8
  %14 = call i32 @strcmp(i8* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)) #7
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %19, label %16

; <label>:16:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 3)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 3)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %18, %struct._IO_FILE** @musicin, align 8
  br label %29

; <label>:19:                                     ; preds = %4
  %20 = load i8*, i8** %6, align 8
  %21 = call %struct._IO_FILE* @fopen(i8* %20, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %21, %struct._IO_FILE** @musicin, align 8
  %22 = icmp eq %struct._IO_FILE* %21, null
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 10)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 10)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = load i8*, i8** %6, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0), i8* %26)
  call void @exit(i32 1) #8
  unreachable

; <label>:28:                                     ; preds = %19
  br label %29

; <label>:29:                                     ; preds = %28, %16
  store i32 0, i32* @input_bitrate, align 4
  %30 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %30, i32 0, i32 29
  %32 = load i32, i32* %31, align 8
  %33 = icmp eq i32 %32, 3
  br i1 %33, label %34, label %45

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %36 = call i32 @lame_decode_initfile(%struct._IO_FILE* %35, i32* @num_channels, i32* @samp_freq, i32* @input_bitrate, i64* @num_samples)
  %37 = icmp eq i32 -1, %36
  br i1 %37, label %38, label %43

; <label>:38:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 11)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 11)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = load i8*, i8** %6, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.4, i32 0, i32 0), i8* %41)
  call void @exit(i32 1) #8
  unreachable

; <label>:43:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 2)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 2)
  br label %77

; <label>:45:                                     ; preds = %29
  %46 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %47 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %46, i32 0, i32 29
  %48 = load i32, i32* %47, align 8
  %49 = icmp ne i32 %48, 4
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 5)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 5)
  %52 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  call void @parse_file_header(%struct.lame_global_flags* %52, %struct._IO_FILE* %53)
  br label %54

; <label>:54:                                     ; preds = %50, %45
  %55 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %56 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %55, i32 0, i32 29
  %57 = load i32, i32* %56, align 8
  %58 = icmp eq i32 %57, 4
  br i1 %58, label %59, label %75

; <label>:59:                                     ; preds = %54
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i32 0, i32 0))
  %62 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %63 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %62, i32 0, i32 30
  %64 = load i32, i32* %63, align 4
  %65 = icmp eq i32 %64, 1
  br i1 %65, label %66, label %70

; <label>:66:                                     ; preds = %59
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 6)
  %67 = add i64 %pgocount5, 1
  store i64 %67, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 6)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %69 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i32 0, i32 0))
  br label %74

; <label>:70:                                     ; preds = %59
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 7)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 7)
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %73 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  br label %74

; <label>:74:                                     ; preds = %70, %66
  br label %75

; <label>:75:                                     ; preds = %74, %54
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 0)
  %76 = add i64 %pgocount7, 1
  store i64 %76, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 0)
  br label %77

; <label>:77:                                     ; preds = %75, %43
  %78 = load i64, i64* @num_samples, align 8
  %79 = icmp eq i64 %78, 4294967295
  br i1 %79, label %80, label %121

; <label>:80:                                     ; preds = %77
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 1)
  %81 = add i64 %pgocount8, 1
  store i64 %81, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 1)
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  %84 = icmp ne %struct._IO_FILE* %82, %83
  br i1 %84, label %85, label %121

; <label>:85:                                     ; preds = %80
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 4)
  %86 = add i64 %pgocount9, 1
  store i64 %86, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 4)
  %87 = load i8*, i8** %6, align 8
  %88 = call i32 @stat(i8* %87, %struct.stat* %9) #6
  %89 = icmp eq i32 0, %88
  br i1 %89, label %90, label %120

; <label>:90:                                     ; preds = %85
  %91 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %92 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %91, i32 0, i32 29
  %93 = load i32, i32* %92, align 8
  %94 = icmp eq i32 %93, 3
  br i1 %94, label %95, label %111

; <label>:95:                                     ; preds = %90
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 8)
  %96 = add i64 %pgocount10, 1
  store i64 %96, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 8)
  %97 = getelementptr inbounds %struct.stat, %struct.stat* %9, i32 0, i32 8
  %98 = load i64, i64* %97, align 8
  %99 = sitofp i64 %98 to double
  %100 = fmul double %99, 8.000000e+00
  %101 = call i32 @GetSndBitrate()
  %102 = sitofp i32 %101 to double
  %103 = fmul double 1.000000e+03, %102
  %104 = fdiv double %100, %103
  %105 = fptrunc double %104 to float
  store float %105, float* %10, align 4
  %106 = load float, float* %10, align 4
  %107 = call i32 @GetSndSampleRate()
  %108 = sitofp i32 %107 to float
  %109 = fmul float %106, %108
  %110 = fptoui float %109 to i64
  store i64 %110, i64* @num_samples, align 8
  br label %119

; <label>:111:                                    ; preds = %90
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 9)
  %112 = add i64 %pgocount11, 1
  store i64 %112, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_OpenSndFile, i64 0, i64 9)
  %113 = getelementptr inbounds %struct.stat, %struct.stat* %9, i32 0, i32 8
  %114 = load i64, i64* %113, align 8
  %115 = call i32 @GetSndChannels()
  %116 = mul nsw i32 2, %115
  %117 = sext i32 %116 to i64
  %118 = sdiv i64 %114, %117
  store i64 %118, i64* @num_samples, align 8
  br label %119

; <label>:119:                                    ; preds = %111, %95
  br label %120

; <label>:120:                                    ; preds = %119, %85
  br label %121

; <label>:121:                                    ; preds = %120, %80, %77
  %122 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  ret %struct._IO_FILE* %122
}

; Function Attrs: nounwind uwtable
define i32 @GetSndSampleRate() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndSampleRate, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndSampleRate, i64 0, i64 0)
  %2 = load i32, i32* @samp_freq, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @GetSndChannels() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndChannels, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndChannels, i64 0, i64 0)
  %2 = load i32, i32* @num_channels, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i64 @GetSndSamples() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndSamples, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndSamples, i64 0, i64 0)
  %2 = load i64, i64* @num_samples, align 8
  ret i64 %2
}

; Function Attrs: nounwind uwtable
define void @lame_close_infile(%struct.lame_global_flags*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_close_infile, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_close_infile, i64 0, i64 0)
  %3 = alloca %struct.lame_global_flags*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %3, align 8
  %4 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  call void @CloseSndFile(%struct.lame_global_flags* %4)
  ret void
}

; Function Attrs: nounwind uwtable
define void @CloseSndFile(%struct.lame_global_flags*) #0 {
  %2 = alloca %struct.lame_global_flags*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %2, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %4 = call i32 @fclose(%struct._IO_FILE* %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %10

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CloseSndFile, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CloseSndFile, i64 0, i64 1)
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 2) #8
  unreachable

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CloseSndFile, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_CloseSndFile, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lame_readframe(%struct.lame_global_flags*, [1152 x i16]*) #0 {
  %3 = alloca %struct.lame_global_flags*, align 8
  %4 = alloca [1152 x i16]*, align 8
  %5 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %3, align 8
  store [1152 x i16]* %1, [1152 x i16]** %4, align 8
  %6 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %7 = load [1152 x i16]*, [1152 x i16]** %4, align 8
  %8 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %9 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %8, i32 0, i32 46
  %10 = load i32, i32* %9, align 4
  %11 = call i32 @get_audio(%struct.lame_global_flags* %6, [1152 x i16]* %7, i32 %10)
  store i32 %11, i32* %5, align 4
  %12 = load i32, i32* %5, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %38

; <label>:14:                                     ; preds = %2
  %15 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %16 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %15, i32 0, i32 40
  %17 = load i64, i64* %16, align 8
  %18 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %18, i32 0, i32 39
  %20 = load i64, i64* %19, align 8
  %21 = add nsw i64 %20, 2
  %22 = icmp slt i64 %17, %21
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i64 0, i64 2)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i64 0, i64 2)
  %25 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %25, i32 0, i32 40
  %27 = load i64, i64* %26, align 8
  br label %34

; <label>:28:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i64 0, i64 3)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i64 0, i64 3)
  %30 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %30, i32 0, i32 39
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, 2
  br label %34

; <label>:34:                                     ; preds = %28, %23
  %35 = phi i64 [ %27, %23 ], [ %33, %28 ]
  %36 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %36, i32 0, i32 40
  store i64 %35, i64* %37, align 8
  br label %38

; <label>:38:                                     ; preds = %34, %2
  %39 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %40 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %39, i32 0, i32 39
  %41 = load i64, i64* %40, align 8
  %42 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %43 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %42, i32 0, i32 40
  %44 = load i64, i64* %43, align 8
  %45 = sub nsw i64 %44, 1
  %46 = icmp sgt i64 %41, %45
  br i1 %46, label %47, label %54

; <label>:47:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i64 0, i64 1)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i64 0, i64 1)
  %49 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %50 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %49, i32 0, i32 39
  %51 = load i64, i64* %50, align 8
  %52 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %53 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %52, i32 0, i32 40
  store i64 %51, i64* %53, align 8
  br label %54

; <label>:54:                                     ; preds = %47, %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i64 0, i64 0)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_lame_readframe, i64 0, i64 0)
  %56 = load i32, i32* %5, align 4
  ret i32 %56
}

; Function Attrs: nounwind uwtable
define i32 @get_audio(%struct.lame_global_flags*, [1152 x i16]*, i32) #0 {
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca [1152 x i16]*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [2304 x i16], align 16
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store [1152 x i16]* %1, [1152 x i16]** %5, align 8
  store i32 %2, i32* %6, align 4
  %14 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %15 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  store i32 %16, i32* %13, align 4
  %17 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %17, i32 0, i32 39
  %19 = load i64, i64* %18, align 8
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 5)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 5)
  store i64 0, i64* @get_audio.num_samples_read, align 8
  %23 = call i64 @GetSndSamples()
  store i64 %23, i64* @num_samples, align 8
  br label %24

; <label>:24:                                     ; preds = %21, %3
  %25 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %25, i32 0, i32 45
  %27 = load i32, i32* %26, align 8
  %28 = mul nsw i32 %27, 576
  store i32 %28, i32* %10, align 4
  %29 = load i32, i32* %10, align 4
  store i32 %29, i32* %11, align 4
  %30 = load i32, i32* @count_samples_carefully, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %55

; <label>:32:                                     ; preds = %24
  %33 = load i64, i64* @num_samples, align 8
  %34 = load i64, i64* @num_samples, align 8
  %35 = load i64, i64* @get_audio.num_samples_read, align 8
  %36 = icmp ult i64 %34, %35
  br i1 %36, label %37, label %40

; <label>:37:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 6)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 6)
  %39 = load i64, i64* @num_samples, align 8
  br label %43

; <label>:40:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 7)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 7)
  %42 = load i64, i64* @get_audio.num_samples_read, align 8
  br label %43

; <label>:43:                                     ; preds = %40, %37
  %44 = phi i64 [ %39, %37 ], [ %42, %40 ]
  %45 = sub i64 %33, %44
  store i64 %45, i64* %12, align 8
  %46 = load i64, i64* %12, align 8
  %47 = load i32, i32* %10, align 4
  %48 = sext i32 %47 to i64
  %49 = icmp ult i64 %46, %48
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 8)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 8)
  %52 = load i64, i64* %12, align 8
  %53 = trunc i64 %52 to i32
  store i32 %53, i32* %11, align 4
  br label %54

; <label>:54:                                     ; preds = %50, %43
  br label %55

; <label>:55:                                     ; preds = %54, %24
  %56 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %57 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %56, i32 0, i32 29
  %58 = load i32, i32* %57, align 8
  %59 = icmp eq i32 %58, 3
  br i1 %59, label %60, label %67

; <label>:60:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 2)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 2)
  %62 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %64 = load [1152 x i16]*, [1152 x i16]** %5, align 8
  %65 = load i32, i32* %13, align 4
  %66 = call i32 @read_samples_mp3(%struct.lame_global_flags* %62, %struct._IO_FILE* %63, [1152 x i16]* %64, i32 %65)
  store i32 %66, i32* %9, align 4
  br label %124

; <label>:67:                                     ; preds = %55
  %68 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %69 = getelementptr inbounds [2304 x i16], [2304 x i16]* %8, i32 0, i32 0
  %70 = load i32, i32* %13, align 4
  %71 = load i32, i32* %10, align 4
  %72 = mul nsw i32 %70, %71
  %73 = load i32, i32* %13, align 4
  %74 = load i32, i32* %11, align 4
  %75 = mul nsw i32 %73, %74
  %76 = call i32 @read_samples_pcm(%struct.lame_global_flags* %68, i16* %69, i32 %72, i32 %75)
  store i32 %76, i32* %9, align 4
  %77 = load i32, i32* %13, align 4
  %78 = load i32, i32* %9, align 4
  %79 = sdiv i32 %78, %77
  store i32 %79, i32* %9, align 4
  store i32 0, i32* %7, align 4
  br label %80

; <label>:80:                                     ; preds = %119, %67
  %81 = load i32, i32* %7, align 4
  %82 = load i32, i32* %10, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %122

; <label>:84:                                     ; preds = %80
  %85 = load i32, i32* %13, align 4
  %86 = load i32, i32* %7, align 4
  %87 = mul nsw i32 %85, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [2304 x i16], [2304 x i16]* %8, i64 0, i64 %88
  %90 = load i16, i16* %89, align 2
  %91 = load [1152 x i16]*, [1152 x i16]** %5, align 8
  %92 = getelementptr inbounds [1152 x i16], [1152 x i16]* %91, i64 0
  %93 = load i32, i32* %7, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [1152 x i16], [1152 x i16]* %92, i64 0, i64 %94
  store i16 %90, i16* %95, align 2
  %96 = load i32, i32* %13, align 4
  %97 = icmp eq i32 %96, 2
  br i1 %97, label %98, label %111

; <label>:98:                                     ; preds = %84
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 0)
  %99 = add i64 %pgocount5, 1
  store i64 %99, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 0)
  %100 = load i32, i32* %7, align 4
  %101 = mul nsw i32 2, %100
  %102 = add nsw i32 %101, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [2304 x i16], [2304 x i16]* %8, i64 0, i64 %103
  %105 = load i16, i16* %104, align 2
  %106 = load [1152 x i16]*, [1152 x i16]** %5, align 8
  %107 = getelementptr inbounds [1152 x i16], [1152 x i16]* %106, i64 1
  %108 = load i32, i32* %7, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [1152 x i16], [1152 x i16]* %107, i64 0, i64 %109
  store i16 %105, i16* %110, align 2
  br label %118

; <label>:111:                                    ; preds = %84
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 1)
  %112 = add i64 %pgocount6, 1
  store i64 %112, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 1)
  %113 = load [1152 x i16]*, [1152 x i16]** %5, align 8
  %114 = getelementptr inbounds [1152 x i16], [1152 x i16]* %113, i64 1
  %115 = load i32, i32* %7, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [1152 x i16], [1152 x i16]* %114, i64 0, i64 %116
  store i16 0, i16* %117, align 2
  br label %118

; <label>:118:                                    ; preds = %111, %98
  br label %119

; <label>:119:                                    ; preds = %118
  %120 = load i32, i32* %7, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %7, align 4
  br label %80

; <label>:122:                                    ; preds = %80
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 3)
  %123 = add i64 %pgocount7, 1
  store i64 %123, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 3)
  br label %124

; <label>:124:                                    ; preds = %122, %60
  %125 = load i64, i64* @num_samples, align 8
  %126 = icmp ne i64 %125, 4294967295
  br i1 %126, label %127, label %133

; <label>:127:                                    ; preds = %124
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 4)
  %128 = add i64 %pgocount8, 1
  store i64 %128, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_get_audio, i64 0, i64 4)
  %129 = load i32, i32* %9, align 4
  %130 = sext i32 %129 to i64
  %131 = load i64, i64* @get_audio.num_samples_read, align 8
  %132 = add i64 %131, %130
  store i64 %132, i64* @get_audio.num_samples_read, align 8
  br label %133

; <label>:133:                                    ; preds = %127, %124
  %134 = load i32, i32* %9, align 4
  ret i32 %134
}

; Function Attrs: nounwind uwtable
define i32 @read_samples_mp3(%struct.lame_global_flags*, %struct._IO_FILE*, [1152 x i16]*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.lame_global_flags*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca [1152 x i16]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %6, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %7, align 8
  store [1152 x i16]* %2, [1152 x i16]** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 0, i32* %11, align 4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %13 = load [1152 x i16]*, [1152 x i16]** %8, align 8
  %14 = getelementptr inbounds [1152 x i16], [1152 x i16]* %13, i64 0
  %15 = getelementptr inbounds [1152 x i16], [1152 x i16]* %14, i32 0, i32 0
  %16 = load [1152 x i16]*, [1152 x i16]** %8, align 8
  %17 = getelementptr inbounds [1152 x i16], [1152 x i16]* %16, i64 1
  %18 = getelementptr inbounds [1152 x i16], [1152 x i16]* %17, i32 0, i32 0
  %19 = call i32 @lame_decode_fromfile(%struct._IO_FILE* %12, i16* %15, i16* %18)
  store i32 %19, i32* %11, align 4
  %20 = load i32, i32* %11, align 4
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %43

; <label>:22:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i64 0, i64 2)
  store i32 0, i32* %10, align 4
  br label %24

; <label>:24:                                     ; preds = %38, %22
  %25 = load i32, i32* %10, align 4
  %26 = icmp slt i32 %25, 1152
  br i1 %26, label %27, label %42

; <label>:27:                                     ; preds = %24
  %28 = load [1152 x i16]*, [1152 x i16]** %8, align 8
  %29 = getelementptr inbounds [1152 x i16], [1152 x i16]* %28, i64 0
  %30 = load i32, i32* %10, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1152 x i16], [1152 x i16]* %29, i64 0, i64 %31
  store i16 0, i16* %32, align 2
  %33 = load [1152 x i16]*, [1152 x i16]** %8, align 8
  %34 = getelementptr inbounds [1152 x i16], [1152 x i16]* %33, i64 1
  %35 = load i32, i32* %10, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1152 x i16], [1152 x i16]* %34, i64 0, i64 %36
  store i16 0, i16* %37, align 2
  br label %38

; <label>:38:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i64 0, i64 0)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i64 0, i64 0)
  %40 = load i32, i32* %10, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %10, align 4
  br label %24

; <label>:42:                                     ; preds = %24
  br label %43

; <label>:43:                                     ; preds = %42, %4
  %44 = load i32, i32* %11, align 4
  %45 = icmp eq i32 %44, -1
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i64 0, i64 3)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i64 0, i64 3)
  store i32 0, i32* %5, align 4
  br label %51

; <label>:48:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i64 0, i64 1)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_read_samples_mp3, i64 0, i64 1)
  %50 = load i32, i32* %11, align 4
  store i32 %50, i32* %5, align 4
  br label %51

; <label>:51:                                     ; preds = %48, %46
  %52 = load i32, i32* %5, align 4
  ret i32 %52
}

; Function Attrs: nounwind uwtable
define i32 @read_samples_pcm(%struct.lame_global_flags*, i16*, i32, i32) #0 {
  %5 = alloca %struct.lame_global_flags*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %5, align 8
  store i16* %1, i16** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %12 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %12, i32 0, i32 29
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 1
  %16 = zext i1 %15 to i32
  store i32 %16, i32* %11, align 4
  %17 = load i16*, i16** %6, align 8
  %18 = bitcast i16* %17 to i8*
  %19 = load i32, i32* %8, align 4
  %20 = sext i32 %19 to i64
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %22 = call i64 @fread(i8* %18, i64 2, i64 %20, %struct._IO_FILE* %21)
  %23 = trunc i64 %22 to i32
  store i32 %23, i32* %9, align 4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @musicin, align 8
  %25 = call i32 @ferror(%struct._IO_FILE* %24) #6
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 10)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 10)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.8, i32 0, i32 0))
  call void @exit(i32 2) #8
  unreachable

; <label>:31:                                     ; preds = %4
  %32 = load i32, i32* @NativeByteOrder, align 4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %44

; <label>:34:                                     ; preds = %31
  %35 = call i32 @DetermineByteOrder()
  store i32 %35, i32* @NativeByteOrder, align 4
  %36 = load i32, i32* @NativeByteOrder, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 11)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 11)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.9, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

; <label>:42:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 6)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 6)
  br label %44

; <label>:44:                                     ; preds = %42, %31
  %45 = load i32, i32* %11, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %55, label %47

; <label>:47:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 5)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 5)
  %49 = load i32, i32* @NativeByteOrder, align 4
  %50 = icmp eq i32 %49, 2
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 8)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 8)
  %53 = load i16*, i16** %6, align 8
  %54 = load i32, i32* %9, align 4
  call void @SwapBytesInWords(i16* %53, i32 %54)
  br label %55

; <label>:55:                                     ; preds = %51, %47, %44
  %56 = load i32, i32* %11, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %66

; <label>:58:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 2)
  %59 = add i64 %pgocount5, 1
  store i64 %59, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 2)
  %60 = load i32, i32* @NativeByteOrder, align 4
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %66

; <label>:62:                                     ; preds = %58
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 7)
  %63 = add i64 %pgocount6, 1
  store i64 %63, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 7)
  %64 = load i16*, i16** %6, align 8
  %65 = load i32, i32* %9, align 4
  call void @SwapBytesInWords(i16* %64, i32 %65)
  br label %66

; <label>:66:                                     ; preds = %62, %58, %55
  %67 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %68 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %67, i32 0, i32 30
  %69 = load i32, i32* %68, align 4
  %70 = icmp eq i32 %69, 1
  br i1 %70, label %71, label %75

; <label>:71:                                     ; preds = %66
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 3)
  %72 = add i64 %pgocount7, 1
  store i64 %72, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 3)
  %73 = load i16*, i16** %6, align 8
  %74 = load i32, i32* %9, align 4
  call void @SwapBytesInWords(i16* %73, i32 %74)
  br label %75

; <label>:75:                                     ; preds = %71, %66
  %76 = load i32, i32* %9, align 4
  store i32 %76, i32* %10, align 4
  %77 = load i32, i32* %9, align 4
  %78 = load i32, i32* %7, align 4
  %79 = icmp slt i32 %77, %78
  br i1 %79, label %80, label %100

; <label>:80:                                     ; preds = %75
  %81 = load i32, i32* %9, align 4
  %82 = icmp slt i32 %81, 0
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %80
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 9)
  %84 = add i64 %pgocount8, 1
  store i64 %84, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 9)
  store i32 0, i32* %9, align 4
  br label %85

; <label>:85:                                     ; preds = %83, %80
  br label %86

; <label>:86:                                     ; preds = %91, %85
  %87 = load i32, i32* %9, align 4
  %88 = load i32, i32* %7, align 4
  %89 = icmp slt i32 %87, %88
  br i1 %89, label %90, label %98

; <label>:90:                                     ; preds = %86
  br label %91

; <label>:91:                                     ; preds = %90
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 0)
  %92 = add i64 %pgocount9, 1
  store i64 %92, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 0)
  %93 = load i16*, i16** %6, align 8
  %94 = load i32, i32* %9, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %9, align 4
  %96 = sext i32 %94 to i64
  %97 = getelementptr inbounds i16, i16* %93, i64 %96
  store i16 0, i16* %97, align 2
  br label %86

; <label>:98:                                     ; preds = %86
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 4)
  %99 = add i64 %pgocount10, 1
  store i64 %99, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 4)
  br label %100

; <label>:100:                                    ; preds = %98, %75
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 1)
  %101 = add i64 %pgocount11, 1
  store i64 %101, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_read_samples_pcm, i64 0, i64 1)
  %102 = load i32, i32* %10, align 4
  ret i32 %102
}

; Function Attrs: nounwind uwtable
define i32 @GetSndBitrate() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndBitrate, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_GetSndBitrate, i64 0, i64 0)
  %2 = load i32, i32* @input_bitrate, align 4
  ret i32 %2
}

declare i32 @lame_decode_fromfile(%struct._IO_FILE*, i16*, i16*) #1

; Function Attrs: nounwind uwtable
define i32 @fskip(%struct._IO_FILE*, i64, i32) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca [1024 x i8], align 16
  %8 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i64 %1, i64* %5, align 8
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %8, align 4
  br label %9

; <label>:9:                                      ; preds = %20, %3
  %10 = load i64, i64* %5, align 8
  %11 = icmp sgt i64 %10, 0
  br i1 %11, label %12, label %30

; <label>:12:                                     ; preds = %9
  %13 = load i64, i64* %5, align 8
  %14 = icmp sgt i64 %13, 1024
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_fskip, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_fskip, i64 0, i64 0)
  br label %20

; <label>:17:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_fskip, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_fskip, i64 0, i64 1)
  %19 = load i64, i64* %5, align 8
  br label %20

; <label>:20:                                     ; preds = %17, %15
  %21 = phi i64 [ 1024, %15 ], [ %19, %17 ]
  %22 = trunc i64 %21 to i32
  store i32 %22, i32* %8, align 4
  %23 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i32 0, i32 0
  %24 = load i32, i32* %8, align 4
  %25 = sext i32 %24 to i64
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %27 = call i64 @fread(i8* %23, i64 1, i64 %25, %struct._IO_FILE* %26)
  %28 = load i64, i64* %5, align 8
  %29 = sub i64 %28, %27
  store i64 %29, i64* %5, align 8
  br label %9

; <label>:30:                                     ; preds = %9
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_fskip, i64 0, i64 2)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_fskip, i64 0, i64 2)
  %32 = load i64, i64* %5, align 8
  %33 = trunc i64 %32 to i32
  ret i32 %33
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @lame_decode_initfile(%struct._IO_FILE*, i32*, i32*, i32*, i64*) #1

; Function Attrs: nounwind uwtable
define void @parse_file_header(%struct.lame_global_flags*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.lame_global_flags*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  store i32 0, i32* %5, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %7 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %6)
  store i32 %7, i32* %5, align 4
  store i32 0, i32* @count_samples_carefully, align 4
  %8 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %9 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %8, i32 0, i32 29
  store i32 4, i32* %9, align 8
  %10 = load i32, i32* %5, align 4
  %11 = icmp eq i32 %10, 1380533830
  br i1 %11, label %12, label %22

; <label>:12:                                     ; preds = %2
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %14 = call i32 @parse_wave_header(%struct._IO_FILE* %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 3)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 3)
  %18 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %18, i32 0, i32 29
  store i32 1, i32* %19, align 8
  store i32 1, i32* @count_samples_carefully, align 4
  br label %20

; <label>:20:                                     ; preds = %16, %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 0)
  br label %37

; <label>:22:                                     ; preds = %2
  %23 = load i32, i32* %5, align 4
  %24 = icmp eq i32 %23, 1179603533
  br i1 %24, label %25, label %35

; <label>:25:                                     ; preds = %22
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %27 = call i32 @parse_aiff_header(%struct._IO_FILE* %26)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %33

; <label>:29:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 6)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 6)
  %31 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %32 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %31, i32 0, i32 29
  store i32 2, i32* %32, align 8
  store i32 1, i32* @count_samples_carefully, align 4
  br label %33

; <label>:33:                                     ; preds = %29, %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 5)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 5)
  br label %35

; <label>:35:                                     ; preds = %33, %22
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 1)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 1)
  br label %37

; <label>:37:                                     ; preds = %35, %20
  %38 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %38, i32 0, i32 29
  %40 = load i32, i32* %39, align 8
  %41 = icmp eq i32 %40, 4
  br i1 %41, label %42, label %52

; <label>:42:                                     ; preds = %37
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %44 = call i32 @fseek(%struct._IO_FILE* %43, i64 0, i32 0)
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %42
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 4)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 4)
  br label %48

; <label>:48:                                     ; preds = %46, %42
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 2)
  %49 = add i64 %pgocount6, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_parse_file_header, i64 0, i64 2)
  %50 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %51 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %50, i32 0, i32 29
  store i32 4, i32* %51, align 8
  br label %52

; <label>:52:                                     ; preds = %48, %37
  ret void
}

; Function Attrs: nounwind
declare i32 @stat(i8*, %struct.stat*) #4

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #4

declare i32 @DetermineByteOrder() #1

declare void @SwapBytesInWords(i16*, i32) #1

declare i32 @Read32BitsHighLow(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal i32 @parse_wave_header(%struct._IO_FILE*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct.fmt_chunk_data_struct, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i32 0, i32* %5, align 4
  store i64 0, i64* %6, align 8
  store i64 0, i64* %8, align 8
  store i32 0, i32* %9, align 4
  %11 = bitcast %struct.fmt_chunk_data_struct* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 32, i32 8, i1 false)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %13 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %12)
  %14 = sext i32 %13 to i64
  store i64 %14, i64* %7, align 8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %16 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %15)
  %17 = icmp ne i32 %16, 1463899717
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 3)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 3)
  store i32 0, i32* %2, align 4
  br label %138

; <label>:20:                                     ; preds = %1
  store i32 0, i32* %9, align 4
  br label %21

; <label>:21:                                     ; preds = %110, %20
  %22 = load i32, i32* %9, align 4
  %23 = icmp slt i32 %22, 20
  br i1 %23, label %24, label %113

; <label>:24:                                     ; preds = %21
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %26 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %25)
  store i32 %26, i32* %10, align 4
  %27 = load i32, i32* %10, align 4
  %28 = icmp eq i32 %27, 1718449184
  br i1 %28, label %29, label %87

; <label>:29:                                     ; preds = %24
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %31 = call i32 @Read32Bits(%struct._IO_FILE* %30)
  %32 = sext i32 %31 to i64
  store i64 %32, i64* %8, align 8
  %33 = load i64, i64* %8, align 8
  %34 = icmp slt i64 %33, 16
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 6)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %138

; <label>:37:                                     ; preds = %29
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %39 = call i32 @Read16BitsLowHigh(%struct._IO_FILE* %38)
  %40 = trunc i32 %39 to i16
  %41 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 0
  store i16 %40, i16* %41, align 8
  %42 = load i64, i64* %8, align 8
  %43 = sub nsw i64 %42, 2
  store i64 %43, i64* %8, align 8
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %45 = call i32 @Read16BitsLowHigh(%struct._IO_FILE* %44)
  %46 = trunc i32 %45 to i16
  %47 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 1
  store i16 %46, i16* %47, align 2
  %48 = load i64, i64* %8, align 8
  %49 = sub nsw i64 %48, 2
  store i64 %49, i64* %8, align 8
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %51 = call i32 @Read32Bits(%struct._IO_FILE* %50)
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 2
  store i64 %52, i64* %53, align 8
  %54 = load i64, i64* %8, align 8
  %55 = sub nsw i64 %54, 4
  store i64 %55, i64* %8, align 8
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %57 = call i32 @Read32Bits(%struct._IO_FILE* %56)
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 3
  store i64 %58, i64* %59, align 8
  %60 = load i64, i64* %8, align 8
  %61 = sub nsw i64 %60, 4
  store i64 %61, i64* %8, align 8
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %63 = call i32 @Read16BitsLowHigh(%struct._IO_FILE* %62)
  %64 = trunc i32 %63 to i16
  %65 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 4
  store i16 %64, i16* %65, align 8
  %66 = load i64, i64* %8, align 8
  %67 = sub nsw i64 %66, 2
  store i64 %67, i64* %8, align 8
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %69 = call i32 @Read16BitsLowHigh(%struct._IO_FILE* %68)
  %70 = trunc i32 %69 to i16
  %71 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 5
  store i16 %70, i16* %71, align 2
  %72 = load i64, i64* %8, align 8
  %73 = sub nsw i64 %72, 2
  store i64 %73, i64* %8, align 8
  %74 = load i64, i64* %8, align 8
  %75 = icmp sgt i64 %74, 0
  br i1 %75, label %76, label %85

; <label>:76:                                     ; preds = %37
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %78 = load i64, i64* %8, align 8
  %79 = call i32 @fskip(%struct._IO_FILE* %77, i64 %78, i32 1)
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %76
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 9)
  %82 = add i64 %pgocount2, 1
  store i64 %82, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 9)
  store i32 0, i32* %2, align 4
  br label %138

; <label>:83:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 2)
  %84 = add i64 %pgocount3, 1
  store i64 %84, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 2)
  br label %85

; <label>:85:                                     ; preds = %83, %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 0)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 0)
  br label %109

; <label>:87:                                     ; preds = %24
  %88 = load i32, i32* %10, align 4
  %89 = icmp eq i32 %88, 1684108385
  br i1 %89, label %90, label %96

; <label>:90:                                     ; preds = %87
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 7)
  %91 = add i64 %pgocount5, 1
  store i64 %91, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 7)
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %93 = call i32 @Read32Bits(%struct._IO_FILE* %92)
  %94 = sext i32 %93 to i64
  store i64 %94, i64* %8, align 8
  %95 = load i64, i64* %8, align 8
  store i64 %95, i64* %6, align 8
  store i32 1, i32* %5, align 4
  br label %113

; <label>:96:                                     ; preds = %87
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %98 = call i32 @Read32Bits(%struct._IO_FILE* %97)
  %99 = sext i32 %98 to i64
  store i64 %99, i64* %8, align 8
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %101 = load i64, i64* %8, align 8
  %102 = call i32 @fskip(%struct._IO_FILE* %100, i64 %101, i32 1)
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %106

; <label>:104:                                    ; preds = %96
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 8)
  %105 = add i64 %pgocount6, 1
  store i64 %105, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 8)
  store i32 0, i32* %2, align 4
  br label %138

; <label>:106:                                    ; preds = %96
  br label %107

; <label>:107:                                    ; preds = %106
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 1)
  %108 = add i64 %pgocount7, 1
  store i64 %108, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 1)
  br label %109

; <label>:109:                                    ; preds = %107, %85
  br label %110

; <label>:110:                                    ; preds = %109
  %111 = load i32, i32* %9, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %9, align 4
  br label %21

; <label>:113:                                    ; preds = %90, %21
  %114 = load i32, i32* %5, align 4
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %116, label %135

; <label>:116:                                    ; preds = %113
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 5)
  %117 = add i64 %pgocount8, 1
  store i64 %117, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 5)
  call void @wave_check(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), %struct.fmt_chunk_data_struct* %4)
  %118 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 1
  %119 = load i16, i16* %118, align 2
  %120 = zext i16 %119 to i32
  store i32 %120, i32* @num_channels, align 4
  %121 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 2
  %122 = load i64, i64* %121, align 8
  %123 = trunc i64 %122 to i32
  store i32 %123, i32* @samp_freq, align 4
  %124 = load i64, i64* %6, align 8
  %125 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 1
  %126 = load i16, i16* %125, align 2
  %127 = zext i16 %126 to i32
  %128 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %4, i32 0, i32 5
  %129 = load i16, i16* %128, align 2
  %130 = zext i16 %129 to i32
  %131 = mul nsw i32 %127, %130
  %132 = sdiv i32 %131, 8
  %133 = sext i32 %132 to i64
  %134 = sdiv i64 %124, %133
  store i64 %134, i64* @num_samples, align 8
  br label %135

; <label>:135:                                    ; preds = %116, %113
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 4)
  %136 = add i64 %pgocount9, 1
  store i64 %136, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_parse_wave_header, i64 0, i64 4)
  %137 = load i32, i32* %5, align 4
  store i32 %137, i32* %2, align 4
  br label %138

; <label>:138:                                    ; preds = %135, %104, %81, %35, %18
  %139 = load i32, i32* %2, align 4
  ret i32 %139
}

; Function Attrs: nounwind uwtable
define internal i32 @parse_aiff_header(%struct._IO_FILE*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.IFF_AIFF_struct, align 8
  %8 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i32 0, i32* %4, align 4
  store i64 0, i64* %5, align 8
  store i64 0, i64* %6, align 8
  %9 = bitcast %struct.IFF_AIFF_struct* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 48, i32 8, i1 false)
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %11 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %10)
  %12 = sext i32 %11 to i64
  store i64 %12, i64* %5, align 8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %14 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %13)
  %15 = icmp ne i32 %14, 1095321158
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 2)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %136

; <label>:18:                                     ; preds = %1
  br label %19

; <label>:19:                                     ; preds = %119, %18
  %20 = load i64, i64* %5, align 8
  %21 = icmp sgt i64 %20, 0
  br i1 %21, label %22, label %120

; <label>:22:                                     ; preds = %19
  store i32 0, i32* %8, align 4
  %23 = load i64, i64* %5, align 8
  %24 = sub nsw i64 %23, 4
  store i64 %24, i64* %5, align 8
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %26 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %25)
  store i32 %26, i32* %8, align 4
  %27 = load i32, i32* %8, align 4
  %28 = icmp eq i32 %27, 1129270605
  br i1 %28, label %29, label %68

; <label>:29:                                     ; preds = %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %31 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %30)
  %32 = sext i32 %31 to i64
  store i64 %32, i64* %6, align 8
  %33 = load i64, i64* %6, align 8
  %34 = load i64, i64* %5, align 8
  %35 = sub nsw i64 %34, %33
  store i64 %35, i64* %5, align 8
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %37 = call i32 @Read16BitsHighLow(%struct._IO_FILE* %36)
  %38 = trunc i32 %37 to i16
  %39 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 0
  store i16 %38, i16* %39, align 8
  %40 = load i64, i64* %6, align 8
  %41 = sub nsw i64 %40, 2
  store i64 %41, i64* %6, align 8
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %43 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %42)
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 1
  store i64 %44, i64* %45, align 8
  %46 = load i64, i64* %6, align 8
  %47 = sub nsw i64 %46, 4
  store i64 %47, i64* %6, align 8
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %49 = call i32 @Read16BitsHighLow(%struct._IO_FILE* %48)
  %50 = trunc i32 %49 to i16
  %51 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 2
  store i16 %50, i16* %51, align 8
  %52 = load i64, i64* %6, align 8
  %53 = sub nsw i64 %52, 2
  store i64 %53, i64* %6, align 8
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %55 = call double @ReadIeeeExtendedHighLow(%struct._IO_FILE* %54)
  %56 = fptrunc double %55 to float
  %57 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 3
  store float %56, float* %57, align 4
  %58 = load i64, i64* %6, align 8
  %59 = sub nsw i64 %58, 10
  store i64 %59, i64* %6, align 8
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %61 = load i64, i64* %6, align 8
  %62 = call i32 @fskip(%struct._IO_FILE* %60, i64 %61, i32 1)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 5)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 5)
  store i32 0, i32* %2, align 4
  br label %136

; <label>:66:                                     ; preds = %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 0)
  %67 = add i64 %pgocount2, 1
  store i64 %67, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 0)
  br label %119

; <label>:68:                                     ; preds = %22
  %69 = load i32, i32* %8, align 4
  %70 = icmp eq i32 %69, 1397968452
  br i1 %70, label %71, label %103

; <label>:71:                                     ; preds = %68
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %73 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %72)
  %74 = sext i32 %73 to i64
  store i64 %74, i64* %6, align 8
  %75 = load i64, i64* %6, align 8
  %76 = load i64, i64* %5, align 8
  %77 = sub nsw i64 %76, %75
  store i64 %77, i64* %5, align 8
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %79 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %78)
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 5
  %82 = getelementptr inbounds %struct.blockAlign_struct, %struct.blockAlign_struct* %81, i32 0, i32 0
  store i64 %80, i64* %82, align 8
  %83 = load i64, i64* %6, align 8
  %84 = sub nsw i64 %83, 4
  store i64 %84, i64* %6, align 8
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %86 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %85)
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 5
  %89 = getelementptr inbounds %struct.blockAlign_struct, %struct.blockAlign_struct* %88, i32 0, i32 1
  store i64 %87, i64* %89, align 8
  %90 = load i64, i64* %6, align 8
  %91 = sub nsw i64 %90, 4
  store i64 %91, i64* %6, align 8
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %93 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 5
  %94 = getelementptr inbounds %struct.blockAlign_struct, %struct.blockAlign_struct* %93, i32 0, i32 0
  %95 = load i64, i64* %94, align 8
  %96 = call i32 @fskip(%struct._IO_FILE* %92, i64 %95, i32 1)
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %100

; <label>:98:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 7)
  %99 = add i64 %pgocount3, 1
  store i64 %99, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 7)
  store i32 0, i32* %2, align 4
  br label %136

; <label>:100:                                    ; preds = %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 8)
  %101 = add i64 %pgocount4, 1
  store i64 %101, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 8)
  %102 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 4
  store i64 1397968452, i64* %102, align 8
  store i32 1, i32* %4, align 4
  br label %120

; <label>:103:                                    ; preds = %68
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %105 = call i32 @Read32BitsHighLow(%struct._IO_FILE* %104)
  %106 = sext i32 %105 to i64
  store i64 %106, i64* %6, align 8
  %107 = load i64, i64* %6, align 8
  %108 = load i64, i64* %5, align 8
  %109 = sub nsw i64 %108, %107
  store i64 %109, i64* %5, align 8
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %111 = load i64, i64* %6, align 8
  %112 = call i32 @fskip(%struct._IO_FILE* %110, i64 %111, i32 1)
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %116

; <label>:114:                                    ; preds = %103
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 6)
  %115 = add i64 %pgocount5, 1
  store i64 %115, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %136

; <label>:116:                                    ; preds = %103
  br label %117

; <label>:117:                                    ; preds = %116
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 1)
  %118 = add i64 %pgocount6, 1
  store i64 %118, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 1)
  br label %119

; <label>:119:                                    ; preds = %117, %66
  br label %19

; <label>:120:                                    ; preds = %100, %19
  %121 = load i32, i32* %4, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %133

; <label>:123:                                    ; preds = %120
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 4)
  %124 = add i64 %pgocount7, 1
  store i64 %124, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 4)
  call void @aiff_check2(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0), %struct.IFF_AIFF_struct* %7)
  %125 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 0
  %126 = load i16, i16* %125, align 8
  %127 = sext i16 %126 to i32
  store i32 %127, i32* @num_channels, align 4
  %128 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 3
  %129 = load float, float* %128, align 4
  %130 = fptosi float %129 to i32
  store i32 %130, i32* @samp_freq, align 4
  %131 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %7, i32 0, i32 1
  %132 = load i64, i64* %131, align 8
  store i64 %132, i64* @num_samples, align 8
  br label %133

; <label>:133:                                    ; preds = %123, %120
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 3)
  %134 = add i64 %pgocount8, 1
  store i64 %134, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_parse_aiff_header, i64 0, i64 3)
  %135 = load i32, i32* %4, align 4
  store i32 %135, i32* %2, align 4
  br label %136

; <label>:136:                                    ; preds = %133, %114, %98, %64, %16
  %137 = load i32, i32* %2, align 4
  ret i32 %137
}

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

declare i32 @Read32Bits(%struct._IO_FILE*) #1

declare i32 @Read16BitsLowHigh(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal void @wave_check(i8*, %struct.fmt_chunk_data_struct*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.fmt_chunk_data_struct*, align 8
  store i8* %0, i8** %3, align 8
  store %struct.fmt_chunk_data_struct* %1, %struct.fmt_chunk_data_struct** %4, align 8
  %5 = load %struct.fmt_chunk_data_struct*, %struct.fmt_chunk_data_struct** %4, align 8
  %6 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %5, i32 0, i32 5
  %7 = load i16, i16* %6, align 2
  %8 = zext i16 %7 to i32
  %9 = icmp ne i32 %8, 16
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wave_check, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wave_check, i64 0, i64 1)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = load %struct.fmt_chunk_data_struct*, %struct.fmt_chunk_data_struct** %4, align 8
  %14 = getelementptr inbounds %struct.fmt_chunk_data_struct, %struct.fmt_chunk_data_struct* %13, i32 0, i32 5
  %15 = load i16, i16* %14, align 2
  %16 = zext i16 %15 to i32
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.11, i32 0, i32 0), i32 %16)
  call void @exit(i32 1) #8
  unreachable

; <label>:18:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wave_check, i64 0, i64 0)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wave_check, i64 0, i64 0)
  ret void
}

declare i32 @Read16BitsHighLow(%struct._IO_FILE*) #1

declare double @ReadIeeeExtendedHighLow(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal void @aiff_check2(i8*, %struct.IFF_AIFF_struct*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.IFF_AIFF_struct*, align 8
  store i8* %0, i8** %3, align 8
  store %struct.IFF_AIFF_struct* %1, %struct.IFF_AIFF_struct** %4, align 8
  %5 = load %struct.IFF_AIFF_struct*, %struct.IFF_AIFF_struct** %4, align 8
  %6 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %5, i32 0, i32 4
  %7 = load i64, i64* %6, align 8
  %8 = icmp ne i64 %7, 1397968452
  br i1 %8, label %9, label %14

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 2)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = load i8*, i8** %3, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.12, i32 0, i32 0), i8* %12)
  call void @exit(i32 1) #8
  unreachable

; <label>:14:                                     ; preds = %2
  %15 = load %struct.IFF_AIFF_struct*, %struct.IFF_AIFF_struct** %4, align 8
  %16 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %15, i32 0, i32 2
  %17 = load i16, i16* %16, align 8
  %18 = sext i16 %17 to i64
  %19 = icmp ne i64 %18, 16
  br i1 %19, label %20, label %25

; <label>:20:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 3)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 3)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = load i8*, i8** %3, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i32 0, i32 0), i32 16, i8* %23)
  call void @exit(i32 1) #8
  unreachable

; <label>:25:                                     ; preds = %14
  %26 = load %struct.IFF_AIFF_struct*, %struct.IFF_AIFF_struct** %4, align 8
  %27 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %26, i32 0, i32 0
  %28 = load i16, i16* %27, align 8
  %29 = sext i16 %28 to i32
  %30 = icmp ne i32 %29, 1
  br i1 %30, label %31, label %43

; <label>:31:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 1)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 1)
  %33 = load %struct.IFF_AIFF_struct*, %struct.IFF_AIFF_struct** %4, align 8
  %34 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %33, i32 0, i32 0
  %35 = load i16, i16* %34, align 8
  %36 = sext i16 %35 to i32
  %37 = icmp ne i32 %36, 2
  br i1 %37, label %38, label %43

; <label>:38:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 6)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 6)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = load i8*, i8** %3, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.14, i32 0, i32 0), i8* %41)
  call void @exit(i32 1) #8
  unreachable

; <label>:43:                                     ; preds = %31, %25
  %44 = load %struct.IFF_AIFF_struct*, %struct.IFF_AIFF_struct** %4, align 8
  %45 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %44, i32 0, i32 5
  %46 = getelementptr inbounds %struct.blockAlign_struct, %struct.blockAlign_struct* %45, i32 0, i32 1
  %47 = load i64, i64* %46, align 8
  %48 = icmp ne i64 %47, 0
  br i1 %48, label %49, label %54

; <label>:49:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 4)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 4)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = load i8*, i8** %3, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.15, i32 0, i32 0), i32 0, i8* %52)
  call void @exit(i32 1) #8
  unreachable

; <label>:54:                                     ; preds = %43
  %55 = load %struct.IFF_AIFF_struct*, %struct.IFF_AIFF_struct** %4, align 8
  %56 = getelementptr inbounds %struct.IFF_AIFF_struct, %struct.IFF_AIFF_struct* %55, i32 0, i32 5
  %57 = getelementptr inbounds %struct.blockAlign_struct, %struct.blockAlign_struct* %56, i32 0, i32 0
  %58 = load i64, i64* %57, align 8
  %59 = icmp ne i64 %58, 0
  br i1 %59, label %60, label %65

; <label>:60:                                     ; preds = %54
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 5)
  %61 = add i64 %pgocount5, 1
  store i64 %61, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 5)
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %63 = load i8*, i8** %3, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.16, i32 0, i32 0), i32 0, i8* %63)
  call void @exit(i32 1) #8
  unreachable

; <label>:65:                                     ; preds = %54
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 0)
  %66 = add i64 %pgocount6, 1
  store i64 %66, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aiff_check2, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
