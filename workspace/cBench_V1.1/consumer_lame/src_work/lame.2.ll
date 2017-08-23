; ModuleID = 'tmp1.ll'
source_filename = "lame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bit_stream_struc = type { i8*, i32, %struct._IO_FILE*, i8*, i32, i64, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.ID3TAGDATA = type { i32, i32, [31 x i8], [31 x i8], [31 x i8], [5 x i8], [31 x i8], [128 x i8], [1 x i8], i8 }
%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }
%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

$__llvm_profile_raw_version = comdat any

@bs = internal global %struct.bit_stream_struc zeroinitializer, align 8
@l3_side = internal global %struct.III_side_info_t zeroinitializer, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [65 x i8] c"Warning: highpass filter disabled.  highpass frequency to small\0A\00", align 1
@id3tag = external global %struct.ID3TAGDATA, align 4
@sfBandIndex = external global [6 x %struct.scalefac_struct], align 16
@scalefac_band = external global %struct.scalefac_struct, align 4
@lame_print_config.mode_names = internal global [4 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0)], align 16
@.str.1 = private unnamed_addr constant [7 x i8] c"stereo\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"j-stereo\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"dual-ch\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"single-ch\00", align 1
@.str.5 = private unnamed_addr constant [68 x i8] c"Autoconverting from stereo to mono. Setting encoding to mono mode.\0A\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"Resampling:  input=%ikHz  output=%ikHz\0A\00", align 1
@.str.7 = private unnamed_addr constant [70 x i8] c"Using polyphase highpass filter, transition band: %.0f Hz -  %.0f Hz\0A\00", align 1
@.str.8 = private unnamed_addr constant [70 x i8] c"Using polyphase lowpass filter,  transition band:  %.0f Hz - %.0f Hz\0A\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"Analyzing %s \0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"Encoding %s to %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str.14 = private unnamed_addr constant [59 x i8] c"Encoding as %.1fkHz VBR(q=%i) %s MPEG%i LayerIII  qval=%i\0A\00", align 1
@.str.15 = private unnamed_addr constant [67 x i8] c"Encoding as %.1f kHz %d kbps %s MPEG%i LayerIII (%4.1fx)  qval=%i\0A\00", align 1
@lame_encode_frame.frameBits = internal global i64 0, align 8
@lame_encode_frame.bitsPerSlot = internal global i64 0, align 8
@lame_encode_frame.frac_SpF = internal global double 0.000000e+00, align 8
@lame_encode_frame.slot_lag = internal global double 0.000000e+00, align 8
@lame_encode_frame.sentBits = internal global i64 0, align 8
@lame_encode_frame.ms_ratio = internal global [2 x double] zeroinitializer, align 16
@lame_encode_frame.ms_ener_ratio = internal global [2 x double] zeroinitializer, align 16
@.str.16 = private unnamed_addr constant [44 x i8] c"mf_size>=(BLKSIZE+gfp->framesize-FFTOFFSET)\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"lame.c\00", align 1
@__PRETTY_FUNCTION__.lame_encode_frame = private unnamed_addr constant [79 x i8] c"int lame_encode_frame(lame_global_flags *, short *, short *, int, char *, int)\00", align 1
@.str.18 = private unnamed_addr constant [36 x i8] c"Sent %ld bits = %ld slots plus %ld\0A\00", align 1
@fill_buffer_resample.itime = internal global [2 x double] zeroinitializer, align 16
@fill_buffer_resample.inbuf_old = internal global [2 x [5 x i16]] zeroinitializer, align 16
@fill_buffer_resample.init = internal global [2 x i32] zeroinitializer, align 4
@lame_encode_buffer.frame_buffered = internal global i32 0, align 4
@.str.19 = private unnamed_addr constant [18 x i8] c"MFSIZE>=mf_needed\00", align 1
@__PRETTY_FUNCTION__.lame_encode_buffer = private unnamed_addr constant [80 x i8] c"int lame_encode_buffer(lame_global_flags *, short *, short *, int, char *, int)\00", align 1
@mfbuf = internal global [2 x [3056 x i16]] zeroinitializer, align 16
@mf_samples_to_encode = internal global i32 0, align 4
@mf_size = internal global i32 0, align 4
@.str.20 = private unnamed_addr constant [16 x i8] c"mf_size<=MFSIZE\00", align 1
@.str.21 = private unnamed_addr constant [12 x i8] c"nsamples==0\00", align 1
@lame_encode_buffer_interleaved.frame_buffered = internal global i32 0, align 4
@__PRETTY_FUNCTION__.lame_encode_buffer_interleaved = private unnamed_addr constant [83 x i8] c"int lame_encode_buffer_interleaved(lame_global_flags *, short *, int, char *, int)\00", align 1
@.str.22 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_lame_init_params = private constant [16 x i8] c"lame_init_params"
@__profn_lame_print_config = private constant [17 x i8] c"lame_print_config"
@__profn_lame_encode_frame = private constant [17 x i8] c"lame_encode_frame"
@__profn_fill_buffer_resample = private constant [20 x i8] c"fill_buffer_resample"
@__profn_fill_buffer = private constant [11 x i8] c"fill_buffer"
@__profn_lame_encode_buffer = private constant [18 x i8] c"lame_encode_buffer"
@__profn_lame_encode_buffer_interleaved = private constant [30 x i8] c"lame_encode_buffer_interleaved"
@__profn_lame_encode = private constant [11 x i8] c"lame_encode"
@__profn_lame_init = private constant [9 x i8] c"lame_init"
@__profn_lame_encode_finish = private constant [18 x i8] c"lame_encode_finish"
@__profn_lame_mp3_tags = private constant [13 x i8] c"lame_mp3_tags"
@__profn_lame_version = private constant [12 x i8] c"lame_version"
@__profc_lame_init_params = private global [94 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_init_params = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3112244331014148540, i64 144116491554801340, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*)* @lame_init_params to i8*), i8* null, i32 94, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_print_config = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_print_config = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6063366057440712086, i64 139096558254, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*)* @lame_print_config to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_encode_frame = private global [34 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_encode_frame = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4693370588386963116, i64 72058106105481498, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i16*, i16*, i32, i8*, i32)* @lame_encode_frame to i8*), i8* null, i32 34, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_fill_buffer_resample = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fill_buffer_resample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4830399501423198828, i64 238714109133, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i16*, i32, i16*, i32, i32*, i32)* @fill_buffer_resample to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_fill_buffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fill_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5010350832189021621, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_fill_buffer, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i16*, i32, i16*, i32)* @fill_buffer to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_encode_buffer = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_encode_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8171150021028705920, i64 282432940809, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i16*, i16*, i32, i8*, i32)* @lame_encode_buffer to i8*), i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_encode_buffer_interleaved = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_encode_buffer_interleaved = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -603002418844413924, i64 350924228460, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i16*, i32, i8*, i32)* @lame_encode_buffer_interleaved to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_encode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7880655842340587316, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_encode, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, [1152 x i16]*, i8*, i32)* @lame_encode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -773516299153982711, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_init, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*)* @lame_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_encode_finish = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_encode_finish = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4470230914137981476, i64 105855382943, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i8*, i32)* @lame_encode_finish to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_mp3_tags = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_mp3_tags = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3728774387020293925, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_mp3_tags, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*)* @lame_mp3_tags to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_version = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_version = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4166433120491223177, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_version, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i8*)* @lame_version to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [110 x i8] c"\CB\01kx\DAu\CEA\0E\840\08\05\D0x\A69\10a\F4\E3\90P\DA\D0\EA\F9\AD\E9,\EC\C2\1Dy@\FE7N umT88\D5\C5n(\A1\DEh\CD.\BA\0F\81\AFy\03I\BF\C1\22jF\DFC\04A\81\CA\A9\D8\84\D3\CB+\F5\D8\860\F0\89\ED\B9\1E\F3\DDi\8E\EER\7F\83R\F9P\E3\FD\DF\F6DT\CD~\01N~N5", section "__llvm_prf_names"
@llvm.used = appending global [13 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_init_params to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_print_config to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_encode_frame to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fill_buffer_resample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fill_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_encode_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_encode_buffer_interleaved to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_encode_finish to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_mp3_tags to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_version to i8*), i8* getelementptr inbounds ([110 x i8], [110 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @lame_init_params(%struct.lame_global_flags*) #0 {
  %2 = alloca %struct.lame_global_flags*, align 8
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %2, align 8
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.bit_stream_struc* @bs to i8*), i8 0, i64 56, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.III_side_info_t* @l3_side to i8*), i8 0, i64 528, i32 8, i1 false)
  %11 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %11, i32 0, i32 39
  store i64 0, i64* %12, align 8
  call void @InitFormatBitStream()
  %13 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %14 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %13, i32 0, i32 1
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 23)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 23)
  %19 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %19, i32 0, i32 8
  store i32 3, i32* %20, align 4
  br label %21

; <label>:21:                                     ; preds = %17, %1
  %22 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %23 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %22, i32 0, i32 46
  store i32 2, i32* %23, align 4
  %24 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %25 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %24, i32 0, i32 8
  %26 = load i32, i32* %25, align 4
  %27 = icmp eq i32 %26, 3
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 24)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 24)
  %30 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %30, i32 0, i32 46
  store i32 1, i32* %31, align 4
  br label %32

; <label>:32:                                     ; preds = %28, %21
  %33 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %34 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %33, i32 0, i32 3
  %35 = load i32, i32* %34, align 8
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %196

; <label>:37:                                     ; preds = %32
  %38 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %38, i32 0, i32 2
  %40 = load i32, i32* %39, align 4
  %41 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %42 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %41, i32 0, i32 3
  store i32 %40, i32* %42, align 8
  %43 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %44 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %43, i32 0, i32 3
  %45 = load i32, i32* %44, align 8
  %46 = icmp sge i32 %45, 48000
  br i1 %46, label %47, label %51

; <label>:47:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 59)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 59)
  %49 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %50 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %49, i32 0, i32 3
  store i32 48000, i32* %50, align 8
  br label %95

; <label>:51:                                     ; preds = %37
  %52 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %53 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %52, i32 0, i32 3
  %54 = load i32, i32* %53, align 8
  %55 = icmp sge i32 %54, 44100
  br i1 %55, label %56, label %60

; <label>:56:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 70)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 70)
  %58 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %59 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %58, i32 0, i32 3
  store i32 44100, i32* %59, align 8
  br label %94

; <label>:60:                                     ; preds = %51
  %61 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %62 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %61, i32 0, i32 3
  %63 = load i32, i32* %62, align 8
  %64 = icmp sge i32 %63, 32000
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %60
  %pgocount4 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 77)
  %66 = add i64 %pgocount4, 1
  store i64 %66, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 77)
  %67 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %68 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %67, i32 0, i32 3
  store i32 32000, i32* %68, align 8
  br label %93

; <label>:69:                                     ; preds = %60
  %70 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %71 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %70, i32 0, i32 3
  %72 = load i32, i32* %71, align 8
  %73 = icmp sge i32 %72, 24000
  br i1 %73, label %74, label %78

; <label>:74:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 78)
  %75 = add i64 %pgocount5, 1
  store i64 %75, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 78)
  %76 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %77 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %76, i32 0, i32 3
  store i32 24000, i32* %77, align 8
  br label %92

; <label>:78:                                     ; preds = %69
  %79 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %80 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %79, i32 0, i32 3
  %81 = load i32, i32* %80, align 8
  %82 = icmp sge i32 %81, 22050
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 80)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 80)
  %85 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %86 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %85, i32 0, i32 3
  store i32 22050, i32* %86, align 8
  br label %91

; <label>:87:                                     ; preds = %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 81)
  %88 = add i64 %pgocount7, 1
  store i64 %88, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 81)
  %89 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %90 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %89, i32 0, i32 3
  store i32 16000, i32* %90, align 8
  br label %91

; <label>:91:                                     ; preds = %87, %83
  br label %92

; <label>:92:                                     ; preds = %91, %74
  br label %93

; <label>:93:                                     ; preds = %92, %65
  br label %94

; <label>:94:                                     ; preds = %93, %56
  br label %95

; <label>:95:                                     ; preds = %94, %47
  %96 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %97 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %96, i32 0, i32 11
  %98 = load i32, i32* %97, align 8
  %99 = icmp sgt i32 %98, 0
  br i1 %99, label %100, label %195

; <label>:100:                                    ; preds = %95
  %pgocount8 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 58)
  %101 = add i64 %pgocount8, 1
  store i64 %101, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 58)
  %102 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %103 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %102, i32 0, i32 3
  %104 = load i32, i32* %103, align 8
  %105 = mul nsw i32 %104, 16
  %106 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %107 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %106, i32 0, i32 46
  %108 = load i32, i32* %107, align 4
  %109 = mul nsw i32 %105, %108
  %110 = sitofp i32 %109 to double
  %111 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %112 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %111, i32 0, i32 11
  %113 = load i32, i32* %112, align 8
  %114 = sitofp i32 %113 to double
  %115 = fmul double 1.000000e+03, %114
  %116 = fdiv double %110, %115
  %117 = fptrunc double %116 to float
  store float %117, float* %4, align 4
  %118 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %119 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %118, i32 0, i32 21
  %120 = load i32, i32* %119, align 8
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %194, label %122

; <label>:122:                                    ; preds = %100
  %pgocount9 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 75)
  %123 = add i64 %pgocount9, 1
  store i64 %123, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 75)
  %124 = load float, float* %4, align 4
  %125 = fcmp ogt float %124, 1.300000e+01
  br i1 %125, label %126, label %194

; <label>:126:                                    ; preds = %122
  %127 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %128 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %127, i32 0, i32 11
  %129 = load i32, i32* %128, align 8
  %130 = sitofp i32 %129 to double
  %131 = fmul double 1.000000e+04, %130
  %132 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %133 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %132, i32 0, i32 46
  %134 = load i32, i32* %133, align 4
  %135 = mul nsw i32 16, %134
  %136 = sitofp i32 %135 to double
  %137 = fdiv double %131, %136
  %138 = fptosi double %137 to i32
  %139 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %140 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %139, i32 0, i32 3
  store i32 %138, i32* %140, align 8
  %141 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %142 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %141, i32 0, i32 3
  %143 = load i32, i32* %142, align 8
  %144 = icmp sle i32 %143, 16000
  br i1 %144, label %145, label %149

; <label>:145:                                    ; preds = %126
  %pgocount10 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 79)
  %146 = add i64 %pgocount10, 1
  store i64 %146, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 79)
  %147 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %148 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %147, i32 0, i32 3
  store i32 16000, i32* %148, align 8
  br label %193

; <label>:149:                                    ; preds = %126
  %150 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %151 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %150, i32 0, i32 3
  %152 = load i32, i32* %151, align 8
  %153 = icmp sle i32 %152, 22050
  br i1 %153, label %154, label %158

; <label>:154:                                    ; preds = %149
  %pgocount11 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 82)
  %155 = add i64 %pgocount11, 1
  store i64 %155, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 82)
  %156 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %157 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %156, i32 0, i32 3
  store i32 22050, i32* %157, align 8
  br label %192

; <label>:158:                                    ; preds = %149
  %159 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %160 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %159, i32 0, i32 3
  %161 = load i32, i32* %160, align 8
  %162 = icmp sle i32 %161, 24000
  br i1 %162, label %163, label %167

; <label>:163:                                    ; preds = %158
  %pgocount12 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 83)
  %164 = add i64 %pgocount12, 1
  store i64 %164, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 83)
  %165 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %166 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %165, i32 0, i32 3
  store i32 24000, i32* %166, align 8
  br label %191

; <label>:167:                                    ; preds = %158
  %168 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %169 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %168, i32 0, i32 3
  %170 = load i32, i32* %169, align 8
  %171 = icmp sle i32 %170, 32000
  br i1 %171, label %172, label %176

; <label>:172:                                    ; preds = %167
  %pgocount13 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 84)
  %173 = add i64 %pgocount13, 1
  store i64 %173, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 84)
  %174 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %175 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %174, i32 0, i32 3
  store i32 32000, i32* %175, align 8
  br label %190

; <label>:176:                                    ; preds = %167
  %177 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %178 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %177, i32 0, i32 3
  %179 = load i32, i32* %178, align 8
  %180 = icmp sle i32 %179, 44100
  br i1 %180, label %181, label %185

; <label>:181:                                    ; preds = %176
  %pgocount14 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 85)
  %182 = add i64 %pgocount14, 1
  store i64 %182, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 85)
  %183 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %184 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %183, i32 0, i32 3
  store i32 44100, i32* %184, align 8
  br label %189

; <label>:185:                                    ; preds = %176
  %pgocount15 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 86)
  %186 = add i64 %pgocount15, 1
  store i64 %186, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 86)
  %187 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %188 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %187, i32 0, i32 3
  store i32 48000, i32* %188, align 8
  br label %189

; <label>:189:                                    ; preds = %185, %181
  br label %190

; <label>:190:                                    ; preds = %189, %172
  br label %191

; <label>:191:                                    ; preds = %190, %163
  br label %192

; <label>:192:                                    ; preds = %191, %154
  br label %193

; <label>:193:                                    ; preds = %192, %145
  br label %194

; <label>:194:                                    ; preds = %193, %122, %100
  br label %195

; <label>:195:                                    ; preds = %194, %95
  br label %196

; <label>:196:                                    ; preds = %195, %32
  %197 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %198 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %197, i32 0, i32 3
  %199 = load i32, i32* %198, align 8
  %200 = icmp sle i32 %199, 24000
  %201 = zext i1 %200 to i64
  %pgocount16 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 92)
  %202 = add i64 %pgocount16, %201
  store i64 %202, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 92)
  %203 = select i1 %200, i32 1, i32 2
  %204 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %205 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %204, i32 0, i32 45
  store i32 %203, i32* %205, align 8
  %206 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %207 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %206, i32 0, i32 41
  store i32 800, i32* %207, align 8
  %208 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %209 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %208, i32 0, i32 45
  %210 = load i32, i32* %209, align 8
  %211 = mul nsw i32 %210, 576
  %212 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %213 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %212, i32 0, i32 42
  store i32 %211, i32* %213, align 4
  %214 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %215 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %214, i32 0, i32 11
  %216 = load i32, i32* %215, align 8
  %217 = icmp eq i32 %216, 0
  br i1 %217, label %218, label %231

; <label>:218:                                    ; preds = %196
  %219 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %220 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %219, i32 0, i32 11
  store i32 128, i32* %220, align 8
  %221 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %222 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %221, i32 0, i32 45
  %223 = load i32, i32* %222, align 8
  %224 = icmp eq i32 %223, 1
  br i1 %224, label %225, label %229

; <label>:225:                                    ; preds = %218
  %pgocount17 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 60)
  %226 = add i64 %pgocount17, 1
  store i64 %226, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 60)
  %227 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %228 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %227, i32 0, i32 11
  store i32 64, i32* %228, align 8
  br label %229

; <label>:229:                                    ; preds = %225, %218
  %pgocount18 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 38)
  %230 = add i64 %pgocount18, 1
  store i64 %230, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 38)
  br label %231

; <label>:231:                                    ; preds = %229, %196
  %232 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %233 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %232, i32 0, i32 49
  store float 1.000000e+00, float* %233, align 8
  %234 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %235 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %234, i32 0, i32 3
  %236 = load i32, i32* %235, align 8
  %237 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %238 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %237, i32 0, i32 2
  %239 = load i32, i32* %238, align 4
  %240 = icmp ne i32 %236, %239
  br i1 %240, label %241, label %254

; <label>:241:                                    ; preds = %231
  %pgocount19 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 25)
  %242 = add i64 %pgocount19, 1
  store i64 %242, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 25)
  %243 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %244 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %243, i32 0, i32 2
  %245 = load i32, i32* %244, align 4
  %246 = sitofp i32 %245 to float
  %247 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %248 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %247, i32 0, i32 3
  %249 = load i32, i32* %248, align 8
  %250 = sitofp i32 %249 to float
  %251 = fdiv float %246, %250
  %252 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %253 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %252, i32 0, i32 49
  store float %251, float* %253, align 8
  br label %254

; <label>:254:                                    ; preds = %241, %231
  %255 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %256 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %255, i32 0, i32 40
  store i64 0, i64* %256, align 8
  %257 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %258 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %257, i32 0, i32 0
  %259 = load i64, i64* %258, align 8
  %260 = uitofp i64 %259 to float
  %261 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %262 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %261, i32 0, i32 49
  %263 = load float, float* %262, align 8
  %264 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %265 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %264, i32 0, i32 42
  %266 = load i32, i32* %265, align 4
  %267 = sitofp i32 %266 to float
  %268 = fmul float %263, %267
  %269 = fdiv float %260, %268
  %270 = fadd float 2.000000e+00, %269
  %271 = fptosi float %270 to i64
  %272 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %273 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %272, i32 0, i32 40
  store i64 %271, i64* %273, align 8
  %274 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %275 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %274, i32 0, i32 11
  %276 = load i32, i32* %275, align 8
  %277 = icmp sge i32 %276, 320
  br i1 %277, label %278, label %282

; <label>:278:                                    ; preds = %254
  %pgocount20 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 26)
  %279 = add i64 %pgocount20, 1
  store i64 %279, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 26)
  %280 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %281 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %280, i32 0, i32 21
  store i32 0, i32* %281, align 8
  br label %282

; <label>:282:                                    ; preds = %278, %254
  %283 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %284 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %283, i32 0, i32 3
  %285 = load i32, i32* %284, align 8
  %286 = mul nsw i32 %285, 16
  %287 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %288 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %287, i32 0, i32 46
  %289 = load i32, i32* %288, align 4
  %290 = mul nsw i32 %286, %289
  %291 = sitofp i32 %290 to double
  %292 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %293 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %292, i32 0, i32 11
  %294 = load i32, i32* %293, align 8
  %295 = sitofp i32 %294 to double
  %296 = fmul double 1.000000e+03, %295
  %297 = fdiv double %291, %296
  %298 = fptrunc double %297 to float
  store float %298, float* %4, align 4
  %299 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %300 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %299, i32 0, i32 21
  %301 = load i32, i32* %300, align 8
  %302 = icmp ne i32 %301, 0
  br i1 %302, label %303, label %315

; <label>:303:                                    ; preds = %282
  %pgocount21 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 18)
  %304 = add i64 %pgocount21, 1
  store i64 %304, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 18)
  %305 = load float, float* %4, align 4
  %306 = fcmp ogt float %305, 1.100000e+01
  br i1 %306, label %307, label %315

; <label>:307:                                    ; preds = %303
  %pgocount22 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 43)
  %308 = add i64 %pgocount22, 1
  store i64 %308, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 43)
  %309 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %310 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %309, i32 0, i32 22
  %311 = load i32, i32* %310, align 4
  %312 = sitofp i32 %311 to double
  %313 = fadd double 4.400000e+00, %312
  %314 = fptrunc double %313 to float
  store float %314, float* %4, align 4
  br label %315

; <label>:315:                                    ; preds = %307, %303, %282
  %316 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %317 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %316, i32 0, i32 9
  %318 = load i32, i32* %317, align 8
  %319 = icmp ne i32 %318, 0
  br i1 %319, label %335, label %320

; <label>:320:                                    ; preds = %315
  %pgocount23 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 39)
  %321 = add i64 %pgocount23, 1
  store i64 %321, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 39)
  %322 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %323 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %322, i32 0, i32 8
  %324 = load i32, i32* %323, align 4
  %325 = icmp ne i32 %324, 3
  br i1 %325, label %326, label %335

; <label>:326:                                    ; preds = %320
  %327 = load float, float* %4, align 4
  %328 = fcmp olt float %327, 9.000000e+00
  br i1 %328, label %329, label %333

; <label>:329:                                    ; preds = %326
  %pgocount24 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 71)
  %330 = add i64 %pgocount24, 1
  store i64 %330, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 71)
  %331 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %332 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %331, i32 0, i32 8
  store i32 0, i32* %332, align 4
  br label %333

; <label>:333:                                    ; preds = %329, %326
  %pgocount25 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 61)
  %334 = add i64 %pgocount25, 1
  store i64 %334, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 61)
  br label %335

; <label>:335:                                    ; preds = %333, %320, %315
  %336 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %337 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %336, i32 0, i32 25
  %338 = load i32, i32* %337, align 8
  %339 = icmp eq i32 %338, 0
  br i1 %339, label %340, label %368

; <label>:340:                                    ; preds = %335
  %341 = load float, float* %4, align 4
  %342 = fpext float %341 to double
  %343 = fdiv double %342, 1.600000e+01
  %344 = call double @log(double %343) #7
  %345 = fmul double 1.800000e+01, %344
  %346 = fsub double 1.450000e+01, %345
  %347 = call double @floor(double %346) #8
  %348 = fadd double 1.000000e+00, %347
  %349 = fptosi double %348 to i32
  store i32 %349, i32* %5, align 4
  %350 = load i32, i32* %5, align 4
  %351 = icmp slt i32 %350, 31
  br i1 %351, label %352, label %366

; <label>:352:                                    ; preds = %340
  %pgocount26 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 62)
  %353 = add i64 %pgocount26, 1
  store i64 %353, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 62)
  %354 = load i32, i32* %5, align 4
  %355 = sitofp i32 %354 to double
  %356 = fdiv double %355, 3.100000e+01
  %357 = fptrunc double %356 to float
  %358 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %359 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %358, i32 0, i32 53
  store float %357, float* %359, align 8
  %360 = load i32, i32* %5, align 4
  %361 = sitofp i32 %360 to double
  %362 = fdiv double %361, 3.100000e+01
  %363 = fptrunc double %362 to float
  %364 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %365 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %364, i32 0, i32 54
  store float %363, float* %365, align 4
  br label %366

; <label>:366:                                    ; preds = %352, %340
  %pgocount27 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 40)
  %367 = add i64 %pgocount27, 1
  store i64 %367, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 40)
  br label %368

; <label>:368:                                    ; preds = %366, %335
  %369 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %370 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %369, i32 0, i32 26
  %371 = load i32, i32* %370, align 4
  %372 = icmp sgt i32 %371, 0
  br i1 %372, label %373, label %454

; <label>:373:                                    ; preds = %368
  %374 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %375 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %374, i32 0, i32 26
  %376 = load i32, i32* %375, align 4
  %377 = sitofp i32 %376 to double
  %378 = fmul double 2.000000e+00, %377
  %379 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %380 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %379, i32 0, i32 3
  %381 = load i32, i32* %380, align 8
  %382 = sitofp i32 %381 to double
  %383 = fdiv double %378, %382
  %384 = fptrunc double %383 to float
  %385 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %386 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %385, i32 0, i32 55
  store float %384, float* %386, align 8
  %387 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %388 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %387, i32 0, i32 28
  %389 = load i32, i32* %388, align 4
  %390 = icmp sge i32 %389, 0
  br i1 %390, label %391, label %409

; <label>:391:                                    ; preds = %373
  %392 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %393 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %392, i32 0, i32 26
  %394 = load i32, i32* %393, align 4
  %395 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %396 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %395, i32 0, i32 28
  %397 = load i32, i32* %396, align 4
  %398 = add nsw i32 %394, %397
  %399 = sitofp i32 %398 to double
  %400 = fmul double 2.000000e+00, %399
  %401 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %402 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %401, i32 0, i32 3
  %403 = load i32, i32* %402, align 8
  %404 = sitofp i32 %403 to double
  %405 = fdiv double %400, %404
  %406 = fptrunc double %405 to float
  %407 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %408 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %407, i32 0, i32 56
  store float %406, float* %408, align 4
  br label %424

; <label>:409:                                    ; preds = %373
  %pgocount28 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 44)
  %410 = add i64 %pgocount28, 1
  store i64 %410, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 44)
  %411 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %412 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %411, i32 0, i32 26
  %413 = load i32, i32* %412, align 4
  %414 = sitofp i32 %413 to double
  %415 = fmul double 2.000000e+00, %414
  %416 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %417 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %416, i32 0, i32 3
  %418 = load i32, i32* %417, align 8
  %419 = sitofp i32 %418 to double
  %420 = fdiv double %415, %419
  %421 = fptrunc double %420 to float
  %422 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %423 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %422, i32 0, i32 56
  store float %421, float* %423, align 4
  br label %424

; <label>:424:                                    ; preds = %409, %391
  %425 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %426 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %425, i32 0, i32 55
  %427 = load float, float* %426, align 8
  %428 = fcmp olt float 1.000000e+00, %427
  br i1 %428, label %429, label %430

; <label>:429:                                    ; preds = %424
  br label %435

; <label>:430:                                    ; preds = %424
  %pgocount29 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 45)
  %431 = add i64 %pgocount29, 1
  store i64 %431, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 45)
  %432 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %433 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %432, i32 0, i32 55
  %434 = load float, float* %433, align 8
  br label %435

; <label>:435:                                    ; preds = %430, %429
  %436 = phi float [ 1.000000e+00, %429 ], [ %434, %430 ]
  %437 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %438 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %437, i32 0, i32 55
  store float %436, float* %438, align 8
  %439 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %440 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %439, i32 0, i32 56
  %441 = load float, float* %440, align 4
  %442 = fcmp olt float 1.000000e+00, %441
  br i1 %442, label %443, label %445

; <label>:443:                                    ; preds = %435
  %pgocount30 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 46)
  %444 = add i64 %pgocount30, 1
  store i64 %444, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 46)
  br label %450

; <label>:445:                                    ; preds = %435
  %pgocount31 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 47)
  %446 = add i64 %pgocount31, 1
  store i64 %446, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 47)
  %447 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %448 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %447, i32 0, i32 56
  %449 = load float, float* %448, align 4
  br label %450

; <label>:450:                                    ; preds = %445, %443
  %451 = phi float [ 1.000000e+00, %443 ], [ %449, %445 ]
  %452 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %453 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %452, i32 0, i32 56
  store float %451, float* %453, align 4
  br label %454

; <label>:454:                                    ; preds = %450, %368
  %455 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %456 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %455, i32 0, i32 25
  %457 = load i32, i32* %456, align 8
  %458 = icmp sgt i32 %457, 0
  br i1 %458, label %459, label %549

; <label>:459:                                    ; preds = %454
  %460 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %461 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %460, i32 0, i32 25
  %462 = load i32, i32* %461, align 8
  %463 = sitofp i32 %462 to double
  %464 = fmul double 2.000000e+00, %463
  %465 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %466 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %465, i32 0, i32 3
  %467 = load i32, i32* %466, align 8
  %468 = sitofp i32 %467 to double
  %469 = fdiv double %464, %468
  %470 = fptrunc double %469 to float
  %471 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %472 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %471, i32 0, i32 54
  store float %470, float* %472, align 4
  %473 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %474 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %473, i32 0, i32 27
  %475 = load i32, i32* %474, align 8
  %476 = icmp sge i32 %475, 0
  br i1 %476, label %477, label %504

; <label>:477:                                    ; preds = %459
  %478 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %479 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %478, i32 0, i32 25
  %480 = load i32, i32* %479, align 8
  %481 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %482 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %481, i32 0, i32 27
  %483 = load i32, i32* %482, align 8
  %484 = sub nsw i32 %480, %483
  %485 = sitofp i32 %484 to double
  %486 = fmul double 2.000000e+00, %485
  %487 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %488 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %487, i32 0, i32 3
  %489 = load i32, i32* %488, align 8
  %490 = sitofp i32 %489 to double
  %491 = fdiv double %486, %490
  %492 = fptrunc double %491 to float
  %493 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %494 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %493, i32 0, i32 53
  store float %492, float* %494, align 8
  %495 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %496 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %495, i32 0, i32 53
  %497 = load float, float* %496, align 8
  %498 = fcmp olt float %497, 0.000000e+00
  br i1 %498, label %499, label %503

; <label>:499:                                    ; preds = %477
  %pgocount32 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 64)
  %500 = add i64 %pgocount32, 1
  store i64 %500, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 64)
  %501 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %502 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %501, i32 0, i32 53
  store float 0.000000e+00, float* %502, align 8
  br label %503

; <label>:503:                                    ; preds = %499, %477
  br label %519

; <label>:504:                                    ; preds = %459
  %pgocount33 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 48)
  %505 = add i64 %pgocount33, 1
  store i64 %505, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 48)
  %506 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %507 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %506, i32 0, i32 25
  %508 = load i32, i32* %507, align 8
  %509 = sitofp i32 %508 to double
  %510 = fmul double 2.000000e+00, %509
  %511 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %512 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %511, i32 0, i32 3
  %513 = load i32, i32* %512, align 8
  %514 = sitofp i32 %513 to double
  %515 = fdiv double %510, %514
  %516 = fptrunc double %515 to float
  %517 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %518 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %517, i32 0, i32 53
  store float %516, float* %518, align 8
  br label %519

; <label>:519:                                    ; preds = %504, %503
  %520 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %521 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %520, i32 0, i32 53
  %522 = load float, float* %521, align 8
  %523 = fcmp olt float 1.000000e+00, %522
  br i1 %523, label %524, label %525

; <label>:524:                                    ; preds = %519
  br label %530

; <label>:525:                                    ; preds = %519
  %pgocount34 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 49)
  %526 = add i64 %pgocount34, 1
  store i64 %526, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 49)
  %527 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %528 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %527, i32 0, i32 53
  %529 = load float, float* %528, align 8
  br label %530

; <label>:530:                                    ; preds = %525, %524
  %531 = phi float [ 1.000000e+00, %524 ], [ %529, %525 ]
  %532 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %533 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %532, i32 0, i32 53
  store float %531, float* %533, align 8
  %534 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %535 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %534, i32 0, i32 54
  %536 = load float, float* %535, align 4
  %537 = fcmp olt float 1.000000e+00, %536
  br i1 %537, label %538, label %540

; <label>:538:                                    ; preds = %530
  %pgocount35 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 50)
  %539 = add i64 %pgocount35, 1
  store i64 %539, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 50)
  br label %545

; <label>:540:                                    ; preds = %530
  %pgocount36 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 51)
  %541 = add i64 %pgocount36, 1
  store i64 %541, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 51)
  %542 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %543 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %542, i32 0, i32 54
  %544 = load float, float* %543, align 4
  br label %545

; <label>:545:                                    ; preds = %540, %538
  %546 = phi float [ 1.000000e+00, %538 ], [ %544, %540 ]
  %547 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %548 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %547, i32 0, i32 54
  store float %546, float* %548, align 4
  br label %549

; <label>:549:                                    ; preds = %545, %454
  %550 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %551 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %550, i32 0, i32 59
  %552 = load i32, i32* %551, align 8
  %553 = icmp eq i32 %552, 0
  br i1 %553, label %554, label %833

; <label>:554:                                    ; preds = %549
  %555 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %556 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %555, i32 0, i32 53
  %557 = load float, float* %556, align 8
  %558 = fcmp ogt float %557, 0.000000e+00
  br i1 %558, label %559, label %682

; <label>:559:                                    ; preds = %554
  store i32 999, i32* %8, align 4
  store i32 -1, i32* %7, align 4
  store i32 0, i32* %6, align 4
  br label %560

; <label>:560:                                    ; preds = %646, %559
  %561 = load i32, i32* %6, align 4
  %562 = icmp sle i32 %561, 31
  br i1 %562, label %563, label %650

; <label>:563:                                    ; preds = %560
  %564 = load i32, i32* %6, align 4
  %565 = sitofp i32 %564 to double
  %566 = fdiv double %565, 3.100000e+01
  store double %566, double* %10, align 8
  store double 1.000000e+00, double* %9, align 8
  %567 = load double, double* %10, align 8
  %568 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %569 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %568, i32 0, i32 54
  %570 = load float, float* %569, align 4
  %571 = fpext float %570 to double
  %572 = fcmp oge double %567, %571
  br i1 %572, label %573, label %591

; <label>:573:                                    ; preds = %563
  %574 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %575 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %574, i32 0, i32 57
  %576 = load i32, i32* %575, align 8
  %577 = load i32, i32* %6, align 4
  %578 = icmp slt i32 %576, %577
  br i1 %578, label %579, label %584

; <label>:579:                                    ; preds = %573
  %pgocount37 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 6)
  %580 = add i64 %pgocount37, 1
  store i64 %580, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 6)
  %581 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %582 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %581, i32 0, i32 57
  %583 = load i32, i32* %582, align 8
  br label %587

; <label>:584:                                    ; preds = %573
  %pgocount38 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 7)
  %585 = add i64 %pgocount38, 1
  store i64 %585, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 7)
  %586 = load i32, i32* %6, align 4
  br label %587

; <label>:587:                                    ; preds = %584, %579
  %588 = phi i32 [ %583, %579 ], [ %586, %584 ]
  %589 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %590 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %589, i32 0, i32 57
  store i32 %588, i32* %590, align 8
  store double 0.000000e+00, double* %9, align 8
  br label %591

; <label>:591:                                    ; preds = %587, %563
  %592 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %593 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %592, i32 0, i32 53
  %594 = load float, float* %593, align 8
  %595 = fpext float %594 to double
  %596 = load double, double* %10, align 8
  %597 = fcmp olt double %595, %596
  br i1 %597, label %598, label %645

; <label>:598:                                    ; preds = %591
  %pgocount39 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 4)
  %599 = add i64 %pgocount39, 1
  store i64 %599, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 4)
  %600 = load double, double* %10, align 8
  %601 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %602 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %601, i32 0, i32 54
  %603 = load float, float* %602, align 4
  %604 = fpext float %603 to double
  %605 = fcmp olt double %600, %604
  br i1 %605, label %606, label %645

; <label>:606:                                    ; preds = %598
  %607 = load i32, i32* %8, align 4
  %608 = load i32, i32* %6, align 4
  %609 = icmp slt i32 %607, %608
  br i1 %609, label %610, label %612

; <label>:610:                                    ; preds = %606
  %611 = load i32, i32* %8, align 4
  br label %615

; <label>:612:                                    ; preds = %606
  %pgocount40 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 11)
  %613 = add i64 %pgocount40, 1
  store i64 %613, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 11)
  %614 = load i32, i32* %6, align 4
  br label %615

; <label>:615:                                    ; preds = %612, %610
  %616 = phi i32 [ %611, %610 ], [ %614, %612 ]
  store i32 %616, i32* %8, align 4
  %617 = load i32, i32* %7, align 4
  %618 = load i32, i32* %6, align 4
  %619 = icmp sgt i32 %617, %618
  br i1 %619, label %620, label %623

; <label>:620:                                    ; preds = %615
  %pgocount41 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 12)
  %621 = add i64 %pgocount41, 1
  store i64 %621, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 12)
  %622 = load i32, i32* %7, align 4
  br label %626

; <label>:623:                                    ; preds = %615
  %pgocount42 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 13)
  %624 = add i64 %pgocount42, 1
  store i64 %624, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 13)
  %625 = load i32, i32* %6, align 4
  br label %626

; <label>:626:                                    ; preds = %623, %620
  %627 = phi i32 [ %622, %620 ], [ %625, %623 ]
  store i32 %627, i32* %7, align 4
  %628 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %629 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %628, i32 0, i32 53
  %630 = load float, float* %629, align 8
  %631 = fpext float %630 to double
  %632 = load double, double* %10, align 8
  %633 = fsub double %631, %632
  %634 = fmul double 0x3FF921FB54442D18, %633
  %635 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %636 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %635, i32 0, i32 54
  %637 = load float, float* %636, align 4
  %638 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %639 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %638, i32 0, i32 53
  %640 = load float, float* %639, align 8
  %641 = fsub float %637, %640
  %642 = fpext float %641 to double
  %643 = fdiv double %634, %642
  %644 = call double @cos(double %643) #7
  store double %644, double* %9, align 8
  br label %645

; <label>:645:                                    ; preds = %626, %598, %591
  br label %646

; <label>:646:                                    ; preds = %645
  %pgocount43 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 2)
  %647 = add i64 %pgocount43, 1
  store i64 %647, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 2)
  %648 = load i32, i32* %6, align 4
  %649 = add nsw i32 %648, 1
  store i32 %649, i32* %6, align 4
  br label %560

; <label>:650:                                    ; preds = %560
  %651 = load i32, i32* %8, align 4
  %652 = icmp eq i32 %651, 999
  br i1 %652, label %653, label %664

; <label>:653:                                    ; preds = %650
  %pgocount44 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 72)
  %654 = add i64 %pgocount44, 1
  store i64 %654, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 72)
  %655 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %656 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %655, i32 0, i32 57
  %657 = load i32, i32* %656, align 8
  %658 = sitofp i32 %657 to double
  %659 = fsub double %658, 7.500000e-01
  %660 = fdiv double %659, 3.100000e+01
  %661 = fptrunc double %660 to float
  %662 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %663 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %662, i32 0, i32 53
  store float %661, float* %663, align 8
  br label %673

; <label>:664:                                    ; preds = %650
  %pgocount45 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 73)
  %665 = add i64 %pgocount45, 1
  store i64 %665, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 73)
  %666 = load i32, i32* %8, align 4
  %667 = sitofp i32 %666 to double
  %668 = fsub double %667, 7.500000e-01
  %669 = fdiv double %668, 3.100000e+01
  %670 = fptrunc double %669 to float
  %671 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %672 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %671, i32 0, i32 53
  store float %670, float* %672, align 8
  br label %673

; <label>:673:                                    ; preds = %664, %653
  %674 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %675 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %674, i32 0, i32 57
  %676 = load i32, i32* %675, align 8
  %677 = sitofp i32 %676 to double
  %678 = fdiv double %677, 3.100000e+01
  %679 = fptrunc double %678 to float
  %680 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %681 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %680, i32 0, i32 54
  store float %679, float* %681, align 4
  br label %682

; <label>:682:                                    ; preds = %673, %554
  %683 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %684 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %683, i32 0, i32 56
  %685 = load float, float* %684, align 4
  %686 = fcmp ogt float %685, 0.000000e+00
  br i1 %686, label %687, label %703

; <label>:687:                                    ; preds = %682
  %688 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %689 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %688, i32 0, i32 56
  %690 = load float, float* %689, align 4
  %691 = fpext float %690 to double
  %692 = fcmp olt double %691, 0x3F964BF964BF964C
  br i1 %692, label %693, label %701

; <label>:693:                                    ; preds = %687
  %pgocount46 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 74)
  %694 = add i64 %pgocount46, 1
  store i64 %694, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 74)
  %695 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %696 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %695, i32 0, i32 55
  store float 0.000000e+00, float* %696, align 8
  %697 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %698 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %697, i32 0, i32 56
  store float 0.000000e+00, float* %698, align 4
  %699 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %700 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %699, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0))
  br label %701

; <label>:701:                                    ; preds = %693, %687
  %pgocount47 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 63)
  %702 = add i64 %pgocount47, 1
  store i64 %702, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 63)
  br label %703

; <label>:703:                                    ; preds = %701, %682
  %704 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %705 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %704, i32 0, i32 56
  %706 = load float, float* %705, align 4
  %707 = fcmp ogt float %706, 0.000000e+00
  br i1 %707, label %708, label %831

; <label>:708:                                    ; preds = %703
  store i32 999, i32* %8, align 4
  store i32 -1, i32* %7, align 4
  store i32 0, i32* %6, align 4
  br label %709

; <label>:709:                                    ; preds = %795, %708
  %710 = load i32, i32* %6, align 4
  %711 = icmp sle i32 %710, 31
  br i1 %711, label %712, label %799

; <label>:712:                                    ; preds = %709
  %713 = load i32, i32* %6, align 4
  %714 = sitofp i32 %713 to double
  %715 = fdiv double %714, 3.100000e+01
  store double %715, double* %10, align 8
  store double 1.000000e+00, double* %9, align 8
  %716 = load double, double* %10, align 8
  %717 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %718 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %717, i32 0, i32 55
  %719 = load float, float* %718, align 8
  %720 = fpext float %719 to double
  %721 = fcmp ole double %716, %720
  br i1 %721, label %722, label %740

; <label>:722:                                    ; preds = %712
  %723 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %724 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %723, i32 0, i32 58
  %725 = load i32, i32* %724, align 4
  %726 = load i32, i32* %6, align 4
  %727 = icmp sgt i32 %725, %726
  br i1 %727, label %728, label %733

; <label>:728:                                    ; preds = %722
  %pgocount48 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 8)
  %729 = add i64 %pgocount48, 1
  store i64 %729, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 8)
  %730 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %731 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %730, i32 0, i32 58
  %732 = load i32, i32* %731, align 4
  br label %736

; <label>:733:                                    ; preds = %722
  %pgocount49 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 9)
  %734 = add i64 %pgocount49, 1
  store i64 %734, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 9)
  %735 = load i32, i32* %6, align 4
  br label %736

; <label>:736:                                    ; preds = %733, %728
  %737 = phi i32 [ %732, %728 ], [ %735, %733 ]
  %738 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %739 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %738, i32 0, i32 58
  store i32 %737, i32* %739, align 4
  store double 0.000000e+00, double* %9, align 8
  br label %740

; <label>:740:                                    ; preds = %736, %712
  %741 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %742 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %741, i32 0, i32 55
  %743 = load float, float* %742, align 8
  %744 = fpext float %743 to double
  %745 = load double, double* %10, align 8
  %746 = fcmp olt double %744, %745
  br i1 %746, label %747, label %794

; <label>:747:                                    ; preds = %740
  %pgocount50 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 5)
  %748 = add i64 %pgocount50, 1
  store i64 %748, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 5)
  %749 = load double, double* %10, align 8
  %750 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %751 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %750, i32 0, i32 56
  %752 = load float, float* %751, align 4
  %753 = fpext float %752 to double
  %754 = fcmp olt double %749, %753
  br i1 %754, label %755, label %794

; <label>:755:                                    ; preds = %747
  %756 = load i32, i32* %8, align 4
  %757 = load i32, i32* %6, align 4
  %758 = icmp slt i32 %756, %757
  br i1 %758, label %759, label %761

; <label>:759:                                    ; preds = %755
  %760 = load i32, i32* %8, align 4
  br label %764

; <label>:761:                                    ; preds = %755
  %pgocount51 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 14)
  %762 = add i64 %pgocount51, 1
  store i64 %762, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 14)
  %763 = load i32, i32* %6, align 4
  br label %764

; <label>:764:                                    ; preds = %761, %759
  %765 = phi i32 [ %760, %759 ], [ %763, %761 ]
  store i32 %765, i32* %8, align 4
  %766 = load i32, i32* %7, align 4
  %767 = load i32, i32* %6, align 4
  %768 = icmp sgt i32 %766, %767
  br i1 %768, label %769, label %772

; <label>:769:                                    ; preds = %764
  %pgocount52 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 15)
  %770 = add i64 %pgocount52, 1
  store i64 %770, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 15)
  %771 = load i32, i32* %7, align 4
  br label %775

; <label>:772:                                    ; preds = %764
  %pgocount53 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 16)
  %773 = add i64 %pgocount53, 1
  store i64 %773, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 16)
  %774 = load i32, i32* %6, align 4
  br label %775

; <label>:775:                                    ; preds = %772, %769
  %776 = phi i32 [ %771, %769 ], [ %774, %772 ]
  store i32 %776, i32* %7, align 4
  %777 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %778 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %777, i32 0, i32 56
  %779 = load float, float* %778, align 4
  %780 = fpext float %779 to double
  %781 = load double, double* %10, align 8
  %782 = fsub double %780, %781
  %783 = fmul double 0x3FF921FB54442D18, %782
  %784 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %785 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %784, i32 0, i32 56
  %786 = load float, float* %785, align 4
  %787 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %788 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %787, i32 0, i32 55
  %789 = load float, float* %788, align 8
  %790 = fsub float %786, %789
  %791 = fpext float %790 to double
  %792 = fdiv double %783, %791
  %793 = call double @cos(double %792) #7
  store double %793, double* %9, align 8
  br label %794

; <label>:794:                                    ; preds = %775, %747, %740
  br label %795

; <label>:795:                                    ; preds = %794
  %pgocount54 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 3)
  %796 = add i64 %pgocount54, 1
  store i64 %796, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 3)
  %797 = load i32, i32* %6, align 4
  %798 = add nsw i32 %797, 1
  store i32 %798, i32* %6, align 4
  br label %709

; <label>:799:                                    ; preds = %709
  %800 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %801 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %800, i32 0, i32 58
  %802 = load i32, i32* %801, align 4
  %803 = sitofp i32 %802 to double
  %804 = fdiv double %803, 3.100000e+01
  %805 = fptrunc double %804 to float
  %806 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %807 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %806, i32 0, i32 55
  store float %805, float* %807, align 8
  %808 = load i32, i32* %7, align 4
  %809 = icmp eq i32 %808, -1
  br i1 %809, label %810, label %821

; <label>:810:                                    ; preds = %799
  %pgocount55 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 76)
  %811 = add i64 %pgocount55, 1
  store i64 %811, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 76)
  %812 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %813 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %812, i32 0, i32 58
  %814 = load i32, i32* %813, align 4
  %815 = sitofp i32 %814 to double
  %816 = fadd double %815, 7.500000e-01
  %817 = fdiv double %816, 3.100000e+01
  %818 = fptrunc double %817 to float
  %819 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %820 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %819, i32 0, i32 56
  store float %818, float* %820, align 4
  br label %830

; <label>:821:                                    ; preds = %799
  %pgocount56 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 68)
  %822 = add i64 %pgocount56, 1
  store i64 %822, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 68)
  %823 = load i32, i32* %7, align 4
  %824 = sitofp i32 %823 to double
  %825 = fadd double %824, 7.500000e-01
  %826 = fdiv double %825, 3.100000e+01
  %827 = fptrunc double %826 to float
  %828 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %829 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %828, i32 0, i32 56
  store float %827, float* %829, align 4
  br label %830

; <label>:830:                                    ; preds = %821, %810
  br label %831

; <label>:831:                                    ; preds = %830, %703
  %pgocount57 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 41)
  %832 = add i64 %pgocount57, 1
  store i64 %832, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 41)
  br label %833

; <label>:833:                                    ; preds = %831, %549
  %834 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %835 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %834, i32 0, i32 59
  %836 = load i32, i32* %835, align 8
  %837 = icmp eq i32 %836, 1
  br i1 %837, label %838, label %840

; <label>:838:                                    ; preds = %833
  %pgocount58 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 27)
  %839 = add i64 %pgocount58, 1
  store i64 %839, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 27)
  br label %840

; <label>:840:                                    ; preds = %838, %833
  %841 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %842 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %841, i32 0, i32 52
  store i32 0, i32* %842, align 4
  %843 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %844 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %843, i32 0, i32 8
  %845 = load i32, i32* %844, align 4
  %846 = icmp eq i32 %845, 3
  %847 = zext i1 %846 to i64
  %pgocount59 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 93)
  %848 = add i64 %pgocount59, %847
  store i64 %848, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 93)
  %849 = select i1 %846, i32 1, i32 2
  %850 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %851 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %850, i32 0, i32 46
  store i32 %849, i32* %851, align 4
  %852 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %853 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %852, i32 0, i32 3
  %854 = load i32, i32* %853, align 8
  %855 = sext i32 %854 to i64
  %856 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %857 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %856, i32 0, i32 43
  %858 = call i32 @SmpFrqIndex(i64 %855, i32* %857)
  %859 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %860 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %859, i32 0, i32 51
  store i32 %858, i32* %860, align 8
  %861 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %862 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %861, i32 0, i32 51
  %863 = load i32, i32* %862, align 8
  %864 = icmp slt i32 %863, 0
  br i1 %864, label %865, label %868

; <label>:865:                                    ; preds = %840
  %pgocount60 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 87)
  %866 = add i64 %pgocount60, 1
  store i64 %866, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 87)
  %867 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @display_bitrates(%struct._IO_FILE* %867)
  call void @exit(i32 1) #9
  unreachable

; <label>:868:                                    ; preds = %840
  %869 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %870 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %869, i32 0, i32 11
  %871 = load i32, i32* %870, align 8
  %872 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %873 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %872, i32 0, i32 43
  %874 = load i32, i32* %873, align 8
  %875 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %876 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %875, i32 0, i32 3
  %877 = load i32, i32* %876, align 8
  %878 = call i32 @BitrateIndex(i32 %871, i32 %874, i32 %877)
  %879 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %880 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %879, i32 0, i32 50
  store i32 %878, i32* %880, align 4
  %881 = icmp slt i32 %878, 0
  br i1 %881, label %882, label %885

; <label>:882:                                    ; preds = %868
  %pgocount61 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 88)
  %883 = add i64 %pgocount61, 1
  store i64 %883, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 88)
  %884 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @display_bitrates(%struct._IO_FILE* %884)
  call void @exit(i32 1) #9
  unreachable

; <label>:885:                                    ; preds = %868
  %886 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %887 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %886, i32 0, i32 21
  %888 = load i32, i32* %887, align 8
  %889 = icmp ne i32 %888, 0
  br i1 %889, label %890, label %982

; <label>:890:                                    ; preds = %885
  %891 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %892 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %891, i32 0, i32 24
  %893 = load i32, i32* %892, align 4
  %894 = icmp eq i32 0, %893
  br i1 %894, label %895, label %934

; <label>:895:                                    ; preds = %890
  %896 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %897 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %896, i32 0, i32 48
  store i32 13, i32* %897, align 4
  %898 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %899 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %898, i32 0, i32 23
  %900 = load i32, i32* %899, align 8
  %901 = icmp sge i32 %900, 256
  br i1 %901, label %902, label %906

; <label>:902:                                    ; preds = %895
  %pgocount62 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 65)
  %903 = add i64 %pgocount62, 1
  store i64 %903, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 65)
  %904 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %905 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %904, i32 0, i32 48
  store i32 14, i32* %905, align 4
  br label %906

; <label>:906:                                    ; preds = %902, %895
  %907 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %908 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %907, i32 0, i32 22
  %909 = load i32, i32* %908, align 4
  %910 = icmp eq i32 %909, 0
  br i1 %910, label %911, label %915

; <label>:911:                                    ; preds = %906
  %pgocount63 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 69)
  %912 = add i64 %pgocount63, 1
  store i64 %912, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 69)
  %913 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %914 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %913, i32 0, i32 48
  store i32 14, i32* %914, align 4
  br label %915

; <label>:915:                                    ; preds = %911, %906
  %916 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %917 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %916, i32 0, i32 22
  %918 = load i32, i32* %917, align 4
  %919 = icmp sge i32 %918, 4
  br i1 %919, label %920, label %924

; <label>:920:                                    ; preds = %915
  %pgocount64 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 66)
  %921 = add i64 %pgocount64, 1
  store i64 %921, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 66)
  %922 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %923 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %922, i32 0, i32 48
  store i32 12, i32* %923, align 4
  br label %924

; <label>:924:                                    ; preds = %920, %915
  %925 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %926 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %925, i32 0, i32 22
  %927 = load i32, i32* %926, align 4
  %928 = icmp sge i32 %927, 8
  br i1 %928, label %929, label %933

; <label>:929:                                    ; preds = %924
  %pgocount65 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 67)
  %930 = add i64 %pgocount65, 1
  store i64 %930, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 67)
  %931 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %932 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %931, i32 0, i32 48
  store i32 9, i32* %932, align 4
  br label %933

; <label>:933:                                    ; preds = %929, %924
  br label %953

; <label>:934:                                    ; preds = %890
  %935 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %936 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %935, i32 0, i32 24
  %937 = load i32, i32* %936, align 4
  %938 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %939 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %938, i32 0, i32 43
  %940 = load i32, i32* %939, align 8
  %941 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %942 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %941, i32 0, i32 3
  %943 = load i32, i32* %942, align 8
  %944 = call i32 @BitrateIndex(i32 %937, i32 %940, i32 %943)
  %945 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %946 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %945, i32 0, i32 48
  store i32 %944, i32* %946, align 4
  %947 = icmp slt i32 %944, 0
  br i1 %947, label %948, label %951

; <label>:948:                                    ; preds = %934
  %pgocount66 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 90)
  %949 = add i64 %pgocount66, 1
  store i64 %949, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 90)
  %950 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @display_bitrates(%struct._IO_FILE* %950)
  call void @exit(i32 1) #9
  unreachable

; <label>:951:                                    ; preds = %934
  %pgocount67 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 56)
  %952 = add i64 %pgocount67, 1
  store i64 %952, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 56)
  br label %953

; <label>:953:                                    ; preds = %951, %933
  %954 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %955 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %954, i32 0, i32 23
  %956 = load i32, i32* %955, align 8
  %957 = icmp eq i32 0, %956
  br i1 %957, label %958, label %962

; <label>:958:                                    ; preds = %953
  %pgocount68 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 52)
  %959 = add i64 %pgocount68, 1
  store i64 %959, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 52)
  %960 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %961 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %960, i32 0, i32 47
  store i32 1, i32* %961, align 8
  br label %981

; <label>:962:                                    ; preds = %953
  %963 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %964 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %963, i32 0, i32 23
  %965 = load i32, i32* %964, align 8
  %966 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %967 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %966, i32 0, i32 43
  %968 = load i32, i32* %967, align 8
  %969 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %970 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %969, i32 0, i32 3
  %971 = load i32, i32* %970, align 8
  %972 = call i32 @BitrateIndex(i32 %965, i32 %968, i32 %971)
  %973 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %974 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %973, i32 0, i32 47
  store i32 %972, i32* %974, align 8
  %975 = icmp slt i32 %972, 0
  br i1 %975, label %976, label %979

; <label>:976:                                    ; preds = %962
  %pgocount69 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 91)
  %977 = add i64 %pgocount69, 1
  store i64 %977, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 91)
  %978 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @display_bitrates(%struct._IO_FILE* %978)
  call void @exit(i32 1) #9
  unreachable

; <label>:979:                                    ; preds = %962
  %pgocount70 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 57)
  %980 = add i64 %pgocount70, 1
  store i64 %980, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 57)
  br label %981

; <label>:981:                                    ; preds = %979, %958
  br label %982

; <label>:982:                                    ; preds = %981, %885
  %983 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %984 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %983, i32 0, i32 21
  %985 = load i32, i32* %984, align 8
  %986 = icmp ne i32 %985, 0
  br i1 %986, label %987, label %1003

; <label>:987:                                    ; preds = %982
  %988 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %989 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %988, i32 0, i32 6
  %990 = load i32, i32* %989, align 4
  %991 = icmp slt i32 %990, 2
  br i1 %991, label %992, label %997

; <label>:992:                                    ; preds = %987
  %pgocount71 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 53)
  %993 = add i64 %pgocount71, 1
  store i64 %993, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 53)
  %994 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %995 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %994, i32 0, i32 6
  %996 = load i32, i32* %995, align 4
  br label %999

; <label>:997:                                    ; preds = %987
  %pgocount72 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 54)
  %998 = add i64 %pgocount72, 1
  store i64 %998, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 54)
  br label %999

; <label>:999:                                    ; preds = %997, %992
  %1000 = phi i32 [ %996, %992 ], [ 2, %997 ]
  %1001 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1002 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1001, i32 0, i32 6
  store i32 %1000, i32* %1002, align 4
  br label %1003

; <label>:1003:                                   ; preds = %999, %982
  %1004 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1005 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1004, i32 0, i32 8
  %1006 = load i32, i32* %1005, align 4
  %1007 = icmp eq i32 %1006, 3
  br i1 %1007, label %1008, label %1012

; <label>:1008:                                   ; preds = %1003
  %pgocount73 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 28)
  %1009 = add i64 %pgocount73, 1
  store i64 %1009, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 28)
  %1010 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1011 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1010, i32 0, i32 10
  store i32 0, i32* %1011, align 4
  br label %1012

; <label>:1012:                                   ; preds = %1008, %1003
  %1013 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1014 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1013, i32 0, i32 21
  %1015 = load i32, i32* %1014, align 8
  %1016 = icmp eq i32 %1015, 0
  br i1 %1016, label %1017, label %1021

; <label>:1017:                                   ; preds = %1012
  %pgocount74 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 42)
  %1018 = add i64 %pgocount74, 1
  store i64 %1018, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 42)
  %1019 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1020 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1019, i32 0, i32 5
  store i32 0, i32* %1020, align 8
  br label %1021

; <label>:1021:                                   ; preds = %1017, %1012
  %1022 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1023 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1022, i32 0, i32 32
  %1024 = load i8*, i8** %1023, align 8
  %1025 = icmp ne i8* %1024, null
  br i1 %1025, label %1026, label %1039

; <label>:1026:                                   ; preds = %1021
  %pgocount75 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 19)
  %1027 = add i64 %pgocount75, 1
  store i64 %1027, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 19)
  %1028 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1029 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1028, i32 0, i32 32
  %1030 = load i8*, i8** %1029, align 8
  %1031 = getelementptr inbounds i8, i8* %1030, i64 0
  %1032 = load i8, i8* %1031, align 1
  %1033 = sext i8 %1032 to i32
  %1034 = icmp eq i32 %1033, 45
  br i1 %1034, label %1035, label %1039

; <label>:1035:                                   ; preds = %1026
  %pgocount76 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 55)
  %1036 = add i64 %pgocount76, 1
  store i64 %1036, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 55)
  %1037 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1038 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1037, i32 0, i32 5
  store i32 0, i32* %1038, align 8
  br label %1039

; <label>:1039:                                   ; preds = %1035, %1026, %1021
  %1040 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1041 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1040, i32 0, i32 32
  %1042 = load i8*, i8** %1041, align 8
  %1043 = icmp eq i8* %1042, null
  br i1 %1043, label %1053, label %1044

; <label>:1044:                                   ; preds = %1039
  %pgocount77 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 20)
  %1045 = add i64 %pgocount77, 1
  store i64 %1045, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 20)
  %1046 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1047 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1046, i32 0, i32 32
  %1048 = load i8*, i8** %1047, align 8
  %1049 = getelementptr inbounds i8, i8* %1048, i64 0
  %1050 = load i8, i8* %1049, align 1
  %1051 = sext i8 %1050 to i32
  %1052 = icmp eq i32 %1051, 45
  br i1 %1052, label %1053, label %1055

; <label>:1053:                                   ; preds = %1044, %1039
  %pgocount78 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 17)
  %1054 = add i64 %pgocount78, 1
  store i64 %1054, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 17)
  store i32 0, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  br label %1055

; <label>:1055:                                   ; preds = %1053, %1044
  %1056 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1057 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1056, i32 0, i32 4
  %1058 = load i32, i32* %1057, align 4
  %1059 = icmp ne i32 %1058, 0
  br i1 %1059, label %1060, label %1064

; <label>:1060:                                   ; preds = %1055
  %pgocount79 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 21)
  %1061 = add i64 %pgocount79, 1
  store i64 %1061, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 21)
  %1062 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1063 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1062, i32 0, i32 5
  store i32 0, i32* %1063, align 8
  br label %1064

; <label>:1064:                                   ; preds = %1060, %1055
  call void @init_bit_stream_w(%struct.bit_stream_struc* @bs)
  %1065 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1066 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1065, i32 0, i32 6
  %1067 = load i32, i32* %1066, align 4
  %1068 = icmp eq i32 %1067, 9
  br i1 %1068, label %1069, label %1083

; <label>:1069:                                   ; preds = %1064
  %pgocount80 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 29)
  %1070 = add i64 %pgocount80, 1
  store i64 %1070, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 29)
  %1071 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1072 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1071, i32 0, i32 59
  store i32 0, i32* %1072, align 8
  %1073 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1074 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1073, i32 0, i32 63
  store i32 0, i32* %1074, align 8
  %1075 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1076 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1075, i32 0, i32 60
  store i32 0, i32* %1076, align 4
  %1077 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1078 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1077, i32 0, i32 61
  store i32 0, i32* %1078, align 8
  %1079 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1080 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1079, i32 0, i32 62
  store i32 0, i32* %1080, align 4
  %1081 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1082 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1081, i32 0, i32 64
  store i32 0, i32* %1082, align 4
  br label %1083

; <label>:1083:                                   ; preds = %1069, %1064
  %1084 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1085 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1084, i32 0, i32 6
  %1086 = load i32, i32* %1085, align 4
  %1087 = icmp eq i32 %1086, 8
  br i1 %1087, label %1088, label %1092

; <label>:1088:                                   ; preds = %1083
  %pgocount81 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 30)
  %1089 = add i64 %pgocount81, 1
  store i64 %1089, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 30)
  %1090 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1091 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1090, i32 0, i32 6
  store i32 7, i32* %1091, align 4
  br label %1092

; <label>:1092:                                   ; preds = %1088, %1083
  %1093 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1094 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1093, i32 0, i32 6
  %1095 = load i32, i32* %1094, align 4
  %1096 = icmp eq i32 %1095, 7
  br i1 %1096, label %1097, label %1111

; <label>:1097:                                   ; preds = %1092
  %pgocount82 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 31)
  %1098 = add i64 %pgocount82, 1
  store i64 %1098, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 31)
  %1099 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1100 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1099, i32 0, i32 59
  store i32 0, i32* %1100, align 8
  %1101 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1102 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1101, i32 0, i32 63
  store i32 1, i32* %1102, align 8
  %1103 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1104 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1103, i32 0, i32 60
  store i32 0, i32* %1104, align 4
  %1105 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1106 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1105, i32 0, i32 61
  store i32 0, i32* %1106, align 8
  %1107 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1108 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1107, i32 0, i32 62
  store i32 0, i32* %1108, align 4
  %1109 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1110 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1109, i32 0, i32 64
  store i32 0, i32* %1110, align 4
  br label %1111

; <label>:1111:                                   ; preds = %1097, %1092
  %1112 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1113 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1112, i32 0, i32 6
  %1114 = load i32, i32* %1113, align 4
  %1115 = icmp eq i32 %1114, 6
  br i1 %1115, label %1116, label %1120

; <label>:1116:                                   ; preds = %1111
  %pgocount83 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 32)
  %1117 = add i64 %pgocount83, 1
  store i64 %1117, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 32)
  %1118 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1119 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1118, i32 0, i32 6
  store i32 5, i32* %1119, align 4
  br label %1120

; <label>:1120:                                   ; preds = %1116, %1111
  %1121 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1122 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1121, i32 0, i32 6
  %1123 = load i32, i32* %1122, align 4
  %1124 = icmp eq i32 %1123, 5
  br i1 %1124, label %1125, label %1139

; <label>:1125:                                   ; preds = %1120
  %pgocount84 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 33)
  %1126 = add i64 %pgocount84, 1
  store i64 %1126, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 33)
  %1127 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1128 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1127, i32 0, i32 59
  store i32 0, i32* %1128, align 8
  %1129 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1130 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1129, i32 0, i32 63
  store i32 1, i32* %1130, align 8
  %1131 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1132 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1131, i32 0, i32 60
  store i32 0, i32* %1132, align 4
  %1133 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1134 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1133, i32 0, i32 61
  store i32 1, i32* %1134, align 8
  %1135 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1136 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1135, i32 0, i32 62
  store i32 0, i32* %1136, align 4
  %1137 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1138 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1137, i32 0, i32 64
  store i32 0, i32* %1138, align 4
  br label %1139

; <label>:1139:                                   ; preds = %1125, %1120
  %1140 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1141 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1140, i32 0, i32 6
  %1142 = load i32, i32* %1141, align 4
  %1143 = icmp eq i32 %1142, 4
  br i1 %1143, label %1144, label %1148

; <label>:1144:                                   ; preds = %1139
  %pgocount85 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 34)
  %1145 = add i64 %pgocount85, 1
  store i64 %1145, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 34)
  %1146 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1147 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1146, i32 0, i32 6
  store i32 2, i32* %1147, align 4
  br label %1148

; <label>:1148:                                   ; preds = %1144, %1139
  %1149 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1150 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1149, i32 0, i32 6
  %1151 = load i32, i32* %1150, align 4
  %1152 = icmp eq i32 %1151, 3
  br i1 %1152, label %1153, label %1157

; <label>:1153:                                   ; preds = %1148
  %pgocount86 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 35)
  %1154 = add i64 %pgocount86, 1
  store i64 %1154, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 35)
  %1155 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1156 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1155, i32 0, i32 6
  store i32 2, i32* %1156, align 4
  br label %1157

; <label>:1157:                                   ; preds = %1153, %1148
  %1158 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1159 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1158, i32 0, i32 6
  %1160 = load i32, i32* %1159, align 4
  %1161 = icmp eq i32 %1160, 2
  br i1 %1161, label %1162, label %1176

; <label>:1162:                                   ; preds = %1157
  %pgocount87 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 36)
  %1163 = add i64 %pgocount87, 1
  store i64 %1163, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 36)
  %1164 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1165 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1164, i32 0, i32 59
  store i32 0, i32* %1165, align 8
  %1166 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1167 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1166, i32 0, i32 63
  store i32 1, i32* %1167, align 8
  %1168 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1169 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1168, i32 0, i32 60
  store i32 1, i32* %1169, align 4
  %1170 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1171 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1170, i32 0, i32 61
  store i32 1, i32* %1171, align 8
  %1172 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1173 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1172, i32 0, i32 62
  store i32 0, i32* %1173, align 4
  %1174 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1175 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1174, i32 0, i32 64
  store i32 1, i32* %1175, align 4
  br label %1176

; <label>:1176:                                   ; preds = %1162, %1157
  %1177 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1178 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1177, i32 0, i32 6
  %1179 = load i32, i32* %1178, align 4
  %1180 = icmp eq i32 %1179, 1
  br i1 %1180, label %1181, label %1195

; <label>:1181:                                   ; preds = %1176
  %pgocount88 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 37)
  %1182 = add i64 %pgocount88, 1
  store i64 %1182, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 37)
  %1183 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1184 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1183, i32 0, i32 59
  store i32 0, i32* %1184, align 8
  %1185 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1186 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1185, i32 0, i32 63
  store i32 1, i32* %1186, align 8
  %1187 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1188 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1187, i32 0, i32 60
  store i32 1, i32* %1188, align 4
  %1189 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1190 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1189, i32 0, i32 61
  store i32 1, i32* %1190, align 8
  %1191 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1192 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1191, i32 0, i32 62
  store i32 1, i32* %1192, align 4
  %1193 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1194 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1193, i32 0, i32 64
  store i32 1, i32* %1194, align 4
  br label %1195

; <label>:1195:                                   ; preds = %1181, %1176
  %1196 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1197 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1196, i32 0, i32 6
  %1198 = load i32, i32* %1197, align 4
  %1199 = icmp eq i32 %1198, 0
  br i1 %1199, label %1200, label %1214

; <label>:1200:                                   ; preds = %1195
  %pgocount89 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 89)
  %1201 = add i64 %pgocount89, 1
  store i64 %1201, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 89)
  %1202 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1203 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1202, i32 0, i32 59
  store i32 1, i32* %1203, align 8
  %1204 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1205 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1204, i32 0, i32 63
  store i32 1, i32* %1205, align 8
  %1206 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1207 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1206, i32 0, i32 60
  store i32 1, i32* %1207, align 4
  %1208 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1209 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1208, i32 0, i32 61
  store i32 3, i32* %1209, align 8
  %1210 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1211 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1210, i32 0, i32 62
  store i32 2, i32* %1211, align 4
  %1212 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1213 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1212, i32 0, i32 64
  store i32 2, i32* %1213, align 4
  call void @exit(i32 -99) #9
  unreachable

; <label>:1214:                                   ; preds = %1195
  store i32 0, i32* %3, align 4
  br label %1215

; <label>:1215:                                   ; preds = %1237, %1214
  %1216 = load i32, i32* %3, align 4
  %1217 = icmp slt i32 %1216, 23
  br i1 %1217, label %1218, label %1241

; <label>:1218:                                   ; preds = %1215
  %1219 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1220 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1219, i32 0, i32 51
  %1221 = load i32, i32* %1220, align 8
  %1222 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1223 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1222, i32 0, i32 43
  %1224 = load i32, i32* %1223, align 8
  %1225 = mul nsw i32 %1224, 3
  %1226 = add nsw i32 %1221, %1225
  %1227 = sext i32 %1226 to i64
  %1228 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %1227
  %1229 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* %1228, i32 0, i32 0
  %1230 = load i32, i32* %3, align 4
  %1231 = sext i32 %1230 to i64
  %1232 = getelementptr inbounds [23 x i32], [23 x i32]* %1229, i64 0, i64 %1231
  %1233 = load i32, i32* %1232, align 4
  %1234 = load i32, i32* %3, align 4
  %1235 = sext i32 %1234 to i64
  %1236 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %1235
  store i32 %1233, i32* %1236, align 4
  br label %1237

; <label>:1237:                                   ; preds = %1218
  %pgocount90 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 0)
  %1238 = add i64 %pgocount90, 1
  store i64 %1238, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 0)
  %1239 = load i32, i32* %3, align 4
  %1240 = add nsw i32 %1239, 1
  store i32 %1240, i32* %3, align 4
  br label %1215

; <label>:1241:                                   ; preds = %1215
  store i32 0, i32* %3, align 4
  br label %1242

; <label>:1242:                                   ; preds = %1264, %1241
  %1243 = load i32, i32* %3, align 4
  %1244 = icmp slt i32 %1243, 14
  br i1 %1244, label %1245, label %1268

; <label>:1245:                                   ; preds = %1242
  %1246 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1247 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1246, i32 0, i32 51
  %1248 = load i32, i32* %1247, align 8
  %1249 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1250 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1249, i32 0, i32 43
  %1251 = load i32, i32* %1250, align 8
  %1252 = mul nsw i32 %1251, 3
  %1253 = add nsw i32 %1248, %1252
  %1254 = sext i32 %1253 to i64
  %1255 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %1254
  %1256 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* %1255, i32 0, i32 1
  %1257 = load i32, i32* %3, align 4
  %1258 = sext i32 %1257 to i64
  %1259 = getelementptr inbounds [14 x i32], [14 x i32]* %1256, i64 0, i64 %1258
  %1260 = load i32, i32* %1259, align 4
  %1261 = load i32, i32* %3, align 4
  %1262 = sext i32 %1261 to i64
  %1263 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %1262
  store i32 %1260, i32* %1263, align 4
  br label %1264

; <label>:1264:                                   ; preds = %1245
  %pgocount91 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 1)
  %1265 = add i64 %pgocount91, 1
  store i64 %1265, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 1)
  %1266 = load i32, i32* %3, align 4
  %1267 = add nsw i32 %1266, 1
  store i32 %1267, i32* %3, align 4
  br label %1242

; <label>:1268:                                   ; preds = %1242
  %1269 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1270 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1269, i32 0, i32 5
  %1271 = load i32, i32* %1270, align 8
  %1272 = icmp ne i32 %1271, 0
  br i1 %1272, label %1273, label %1286

; <label>:1273:                                   ; preds = %1268
  %pgocount92 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 22)
  %1274 = add i64 %pgocount92, 1
  store i64 %1274, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 22)
  %1275 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1276 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1275, i32 0, i32 43
  %1277 = load i32, i32* %1276, align 8
  %1278 = sub nsw i32 1, %1277
  %1279 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1280 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1279, i32 0, i32 8
  %1281 = load i32, i32* %1280, align 4
  %1282 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %1283 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %1282, i32 0, i32 51
  %1284 = load i32, i32* %1283, align 8
  %1285 = call i32 @InitVbrTag(%struct.bit_stream_struc* @bs, i32 %1278, i32 %1281, i32 %1284)
  br label %1286

; <label>:1286:                                   ; preds = %1273, %1268
  %pgocount93 = load i64, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 10)
  %1287 = add i64 %pgocount93, 1
  store i64 %1287, i64* getelementptr inbounds ([94 x i64], [94 x i64]* @__profc_lame_init_params, i64 0, i64 10)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @InitFormatBitStream() #2

; Function Attrs: nounwind readnone
declare double @floor(double) #3

; Function Attrs: nounwind
declare double @log(double) #4

; Function Attrs: nounwind
declare double @cos(double) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @SmpFrqIndex(i64, i32*) #2

declare void @display_bitrates(%struct._IO_FILE*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

declare i32 @BitrateIndex(i32, i32, i32) #2

declare void @init_bit_stream_w(%struct.bit_stream_struc*) #2

declare i32 @InitVbrTag(%struct.bit_stream_struc*, i32, i32, i32) #2

; Function Attrs: nounwind uwtable
define void @lame_print_config(%struct.lame_global_flags*) #0 {
  %2 = alloca %struct.lame_global_flags*, align 8
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %2, align 8
  %6 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %7 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %6, i32 0, i32 3
  %8 = load i32, i32* %7, align 8
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fptrunc double %10 to float
  store float %11, float* %3, align 4
  %12 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %12, i32 0, i32 49
  %14 = load float, float* %13, align 8
  %15 = load float, float* %3, align 4
  %16 = fmul float %14, %15
  store float %16, float* %4, align 4
  %17 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %17, i32 0, i32 46
  %19 = load i32, i32* %18, align 4
  %20 = mul nsw i32 %19, 16
  %21 = sitofp i32 %20 to float
  %22 = load float, float* %3, align 4
  %23 = fmul float %21, %22
  %24 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %25 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %24, i32 0, i32 11
  %26 = load i32, i32* %25, align 8
  %27 = sitofp i32 %26 to float
  %28 = fdiv float %23, %27
  store float %28, float* %5, align 4
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @lame_print_version(%struct._IO_FILE* %29)
  %30 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %30, i32 0, i32 1
  %32 = load i32, i32* %31, align 8
  %33 = icmp eq i32 %32, 2
  br i1 %33, label %34, label %44

; <label>:34:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 2)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 2)
  %36 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %36, i32 0, i32 46
  %38 = load i32, i32* %37, align 4
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 5)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 5)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.5, i32 0, i32 0))
  br label %44

; <label>:44:                                     ; preds = %40, %34, %1
  %45 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %46 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %45, i32 0, i32 49
  %47 = load float, float* %46, align 8
  %48 = fcmp une float %47, 1.000000e+00
  br i1 %48, label %49, label %57

; <label>:49:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 0)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 0)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = load float, float* %4, align 4
  %53 = fptosi float %52 to i32
  %54 = load float, float* %3, align 4
  %55 = fptosi float %54 to i32
  %56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i32 0, i32 0), i32 %53, i32 %55)
  br label %57

; <label>:57:                                     ; preds = %49, %44
  %58 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %59 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %58, i32 0, i32 56
  %60 = load float, float* %59, align 4
  %61 = fpext float %60 to double
  %62 = fcmp ogt double %61, 0.000000e+00
  br i1 %62, label %63, label %81

; <label>:63:                                     ; preds = %57
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 3)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 3)
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %66 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %67 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %66, i32 0, i32 55
  %68 = load float, float* %67, align 8
  %69 = load float, float* %3, align 4
  %70 = fmul float %68, %69
  %71 = fmul float %70, 5.000000e+02
  %72 = fpext float %71 to double
  %73 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %74 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %73, i32 0, i32 56
  %75 = load float, float* %74, align 4
  %76 = load float, float* %3, align 4
  %77 = fmul float %75, %76
  %78 = fmul float %77, 5.000000e+02
  %79 = fpext float %78 to double
  %80 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.7, i32 0, i32 0), double %72, double %79)
  br label %81

; <label>:81:                                     ; preds = %63, %57
  %82 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %83 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %82, i32 0, i32 53
  %84 = load float, float* %83, align 8
  %85 = fpext float %84 to double
  %86 = fcmp ogt double %85, 0.000000e+00
  br i1 %86, label %87, label %105

; <label>:87:                                     ; preds = %81
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 4)
  %88 = add i64 %pgocount4, 1
  store i64 %88, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 4)
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %90 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %91 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %90, i32 0, i32 53
  %92 = load float, float* %91, align 8
  %93 = load float, float* %3, align 4
  %94 = fmul float %92, %93
  %95 = fmul float %94, 5.000000e+02
  %96 = fpext float %95 to double
  %97 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %98 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %97, i32 0, i32 54
  %99 = load float, float* %98, align 4
  %100 = load float, float* %3, align 4
  %101 = fmul float %99, %100
  %102 = fmul float %101, 5.000000e+02
  %103 = fpext float %102 to double
  %104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %89, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.8, i32 0, i32 0), double %96, double %103)
  br label %105

; <label>:105:                                    ; preds = %87, %81
  %106 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %107 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %106, i32 0, i32 4
  %108 = load i32, i32* %107, align 4
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %117

; <label>:110:                                    ; preds = %105
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 1)
  %111 = add i64 %pgocount5, 1
  store i64 %111, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 1)
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %113 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %114 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %113, i32 0, i32 31
  %115 = load i8*, i8** %114, align 8
  %116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %112, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i32 0, i32 0), i8* %115)
  br label %203

; <label>:117:                                    ; preds = %105
  %118 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %119 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %120 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %119, i32 0, i32 31
  %121 = load i8*, i8** %120, align 8
  %122 = call i32 @strcmp(i8* %121, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0)) #10
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %128

; <label>:124:                                    ; preds = %117
  %125 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %126 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %125, i32 0, i32 31
  %127 = load i8*, i8** %126, align 8
  br label %130

; <label>:128:                                    ; preds = %117
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 7)
  %129 = add i64 %pgocount6, 1
  store i64 %129, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 7)
  br label %130

; <label>:130:                                    ; preds = %128, %124
  %131 = phi i8* [ %127, %124 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), %128 ]
  %132 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %133 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %132, i32 0, i32 32
  %134 = load i8*, i8** %133, align 8
  %135 = call i32 @strcmp(i8* %134, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0)) #10
  %136 = icmp ne i32 %135, 0
  br i1 %136, label %137, label %141

; <label>:137:                                    ; preds = %130
  %138 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %139 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %138, i32 0, i32 32
  %140 = load i8*, i8** %139, align 8
  br label %143

; <label>:141:                                    ; preds = %130
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 8)
  %142 = add i64 %pgocount7, 1
  store i64 %142, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 8)
  br label %143

; <label>:143:                                    ; preds = %141, %137
  %144 = phi i8* [ %140, %137 ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0), %141 ]
  %145 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %118, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.10, i32 0, i32 0), i8* %131, i8* %144)
  %146 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %147 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %146, i32 0, i32 21
  %148 = load i32, i32* %147, align 8
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %175

; <label>:150:                                    ; preds = %143
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 6)
  %151 = add i64 %pgocount8, 1
  store i64 %151, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 6)
  %152 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %153 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %154 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %153, i32 0, i32 3
  %155 = load i32, i32* %154, align 8
  %156 = sitofp i32 %155 to double
  %157 = fdiv double %156, 1.000000e+03
  %158 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %159 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %158, i32 0, i32 22
  %160 = load i32, i32* %159, align 4
  %161 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %162 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %161, i32 0, i32 8
  %163 = load i32, i32* %162, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [4 x i8*], [4 x i8*]* @lame_print_config.mode_names, i64 0, i64 %164
  %166 = load i8*, i8** %165, align 8
  %167 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %168 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %167, i32 0, i32 43
  %169 = load i32, i32* %168, align 8
  %170 = sub nsw i32 2, %169
  %171 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %172 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %171, i32 0, i32 6
  %173 = load i32, i32* %172, align 4
  %174 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %152, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.14, i32 0, i32 0), double %157, i32 %160, i8* %166, i32 %170, i32 %173)
  br label %202

; <label>:175:                                    ; preds = %143
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 9)
  %176 = add i64 %pgocount9, 1
  store i64 %176, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_print_config, i64 0, i64 9)
  %177 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %178 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %179 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %178, i32 0, i32 3
  %180 = load i32, i32* %179, align 8
  %181 = sitofp i32 %180 to double
  %182 = fdiv double %181, 1.000000e+03
  %183 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %184 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %183, i32 0, i32 11
  %185 = load i32, i32* %184, align 8
  %186 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %187 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %186, i32 0, i32 8
  %188 = load i32, i32* %187, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [4 x i8*], [4 x i8*]* @lame_print_config.mode_names, i64 0, i64 %189
  %191 = load i8*, i8** %190, align 8
  %192 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %193 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %192, i32 0, i32 43
  %194 = load i32, i32* %193, align 8
  %195 = sub nsw i32 2, %194
  %196 = load float, float* %5, align 4
  %197 = fpext float %196 to double
  %198 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %199 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %198, i32 0, i32 6
  %200 = load i32, i32* %199, align 4
  %201 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %177, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.15, i32 0, i32 0), double %182, i32 %185, i8* %191, i32 %195, double %197, i32 %200)
  br label %202

; <label>:202:                                    ; preds = %175, %150
  br label %203

; <label>:203:                                    ; preds = %202, %110
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %205 = call i32 @fflush(%struct._IO_FILE* %204)
  ret void
}

declare void @lame_print_version(%struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #6

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define i32 @lame_encode_frame(%struct.lame_global_flags*, i16*, i16*, i32, i8*, i32) #0 {
  %7 = alloca %struct.lame_global_flags*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca [2 x [2 x [576 x double]]], align 16
  %14 = alloca [2 x [2 x [576 x i32]]], align 16
  %15 = alloca i32, align 4
  %16 = alloca [2 x [2 x %struct.III_psy_ratio]], align 16
  %17 = alloca [2 x [2 x %struct.III_psy_ratio]], align 16
  %18 = alloca [2 x [2 x %struct.III_psy_ratio]]*, align 8
  %19 = alloca [2 x [2 x %struct.III_scalefac_t]], align 16
  %20 = alloca [2 x i16*], align 16
  %21 = alloca [2 x [2 x double]], align 16
  %22 = alloca [2 x [2 x double]], align 16
  %23 = alloca [2 x [2 x double]]*, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca double, align 8
  %30 = alloca double, align 8
  %31 = alloca double, align 8
  %32 = alloca double, align 8
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca [2 x i16*], align 16
  %36 = alloca [2 x i32], align 4
  %37 = alloca %struct.gr_info*, align 8
  %38 = alloca double, align 8
  %39 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %7, align 8
  store i16* %1, i16** %8, align 8
  store i16* %2, i16** %9, align 8
  store i32 %3, i32* %10, align 4
  store i8* %4, i8** %11, align 8
  store i32 %5, i32* %12, align 4
  store double 0.000000e+00, double* %29, align 8
  store double 0.000000e+00, double* %30, align 8
  %40 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %16, i32 0, i32 0
  %41 = bitcast [2 x %struct.III_psy_ratio]* %40 to i8*
  call void @llvm.memset.p0i8.i64(i8* %41, i8 0, i64 3904, i32 16, i1 false)
  %42 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %17, i32 0, i32 0
  %43 = bitcast [2 x %struct.III_psy_ratio]* %42 to i8*
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 3904, i32 16, i1 false)
  %44 = getelementptr inbounds [2 x [2 x %struct.III_scalefac_t]], [2 x [2 x %struct.III_scalefac_t]]* %19, i32 0, i32 0
  %45 = bitcast [2 x %struct.III_scalefac_t]* %44 to i8*
  call void @llvm.memset.p0i8.i64(i8* %45, i8 0, i64 976, i32 16, i1 false)
  %46 = load i16*, i16** %8, align 8
  %47 = getelementptr inbounds [2 x i16*], [2 x i16*]* %20, i64 0, i64 0
  store i16* %46, i16** %47, align 16
  %48 = load i16*, i16** %9, align 8
  %49 = getelementptr inbounds [2 x i16*], [2 x i16*]* %20, i64 0, i64 1
  store i16* %48, i16** %49, align 8
  %50 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %51 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %50, i32 0, i32 52
  store i32 0, i32* %51, align 4
  %52 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %53 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %52, i32 0, i32 39
  %54 = load i64, i64* %53, align 8
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %56, label %111

; <label>:56:                                     ; preds = %6
  %57 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %58 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %57, i32 0, i32 3
  %59 = load i32, i32* %58, align 8
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, 1.000000e+03
  store double %61, double* %32, align 8
  %62 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %63 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %62, i32 0, i32 11
  %64 = load i32, i32* %63, align 8
  store i32 %64, i32* %33, align 4
  store i64 0, i64* @lame_encode_frame.sentBits, align 8
  store i64 8, i64* @lame_encode_frame.bitsPerSlot, align 8
  %65 = load i32, i32* %33, align 4
  %66 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %67 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %66, i32 0, i32 42
  %68 = load i32, i32* %67, align 4
  %69 = mul nsw i32 %65, %68
  %70 = sitofp i32 %69 to double
  %71 = load double, double* %32, align 8
  %72 = load i64, i64* @lame_encode_frame.bitsPerSlot, align 8
  %73 = uitofp i64 %72 to double
  %74 = fmul double %71, %73
  %75 = fdiv double %70, %74
  store double %75, double* %31, align 8
  %76 = load double, double* %31, align 8
  %77 = load double, double* %31, align 8
  %78 = fadd double %77, 1.000000e-09
  %79 = call double @floor(double %78) #8
  %80 = fsub double %76, %79
  store double %80, double* @lame_encode_frame.frac_SpF, align 8
  %81 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %82 = call double @fabs(double %81) #8
  %83 = fcmp olt double %82, 1.000000e-09
  br i1 %83, label %84, label %86

; <label>:84:                                     ; preds = %56
  %pgocount = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 25)
  %85 = add i64 %pgocount, 1
  store i64 %85, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 25)
  store double 0.000000e+00, double* @lame_encode_frame.frac_SpF, align 8
  br label %86

; <label>:86:                                     ; preds = %84, %56
  %87 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %88 = fsub double -0.000000e+00, %87
  store double %88, double* @lame_encode_frame.slot_lag, align 8
  %89 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %90 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %89, i32 0, i32 44
  store i32 1, i32* %90, align 4
  %91 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %92 = fcmp oeq double %91, 0.000000e+00
  br i1 %92, label %93, label %97

; <label>:93:                                     ; preds = %86
  %pgocount1 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 24)
  %94 = add i64 %pgocount1, 1
  store i64 %94, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 24)
  %95 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %96 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %95, i32 0, i32 44
  store i32 0, i32* %96, align 4
  br label %97

; <label>:97:                                     ; preds = %93, %86
  %98 = load i32, i32* %10, align 4
  %99 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %100 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %99, i32 0, i32 42
  %101 = load i32, i32* %100, align 4
  %102 = add nsw i32 1024, %101
  %103 = sub nsw i32 %102, 272
  %104 = icmp sge i32 %98, %103
  br i1 %104, label %105, label %106

; <label>:105:                                    ; preds = %97
  br label %109

; <label>:106:                                    ; preds = %97
  %pgocount2 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 32)
  %107 = add i64 %pgocount2, 1
  store i64 %107, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 32)
  call void @__assert_fail(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 661, i8* getelementptr inbounds ([79 x i8], [79 x i8]* @__PRETTY_FUNCTION__.lame_encode_frame, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %109

; <label>:109:                                    ; preds = %108, %105
  %pgocount3 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 17)
  %110 = add i64 %pgocount3, 1
  store i64 %110, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 17)
  br label %111

; <label>:111:                                    ; preds = %109, %6
  %112 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %113 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %112, i32 0, i32 15
  %114 = load i32, i32* %113, align 8
  switch i32 %114, label %125 [
    i32 0, label %115
    i32 1, label %119
    i32 2, label %123
  ]

; <label>:115:                                    ; preds = %111
  %pgocount4 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 21)
  %116 = add i64 %pgocount4, 1
  store i64 %116, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 21)
  %117 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %118 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %117, i32 0, i32 44
  store i32 0, i32* %118, align 4
  br label %171

; <label>:119:                                    ; preds = %111
  %pgocount5 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 22)
  %120 = add i64 %pgocount5, 1
  store i64 %120, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 22)
  %121 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %122 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %121, i32 0, i32 44
  store i32 1, i32* %122, align 4
  br label %171

; <label>:123:                                    ; preds = %111
  %pgocount6 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 23)
  %124 = add i64 %pgocount6, 1
  store i64 %124, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 23)
  br label %125

; <label>:125:                                    ; preds = %123, %111
  %126 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %127 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %126, i32 0, i32 21
  %128 = load i32, i32* %127, align 8
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %134

; <label>:130:                                    ; preds = %125
  %pgocount7 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 20)
  %131 = add i64 %pgocount7, 1
  store i64 %131, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 20)
  %132 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %133 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %132, i32 0, i32 44
  store i32 0, i32* %133, align 4
  br label %170

; <label>:134:                                    ; preds = %125
  %135 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %136 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %135, i32 0, i32 17
  %137 = load i32, i32* %136, align 8
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %143

; <label>:139:                                    ; preds = %134
  %pgocount8 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 27)
  %140 = add i64 %pgocount8, 1
  store i64 %140, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 27)
  %141 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %142 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %141, i32 0, i32 44
  store i32 0, i32* %142, align 4
  br label %169

; <label>:143:                                    ; preds = %134
  %144 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %145 = fcmp une double %144, 0.000000e+00
  br i1 %145, label %146, label %167

; <label>:146:                                    ; preds = %143
  %147 = load double, double* @lame_encode_frame.slot_lag, align 8
  %148 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %149 = fsub double %148, 1.000000e+00
  %150 = fcmp ogt double %147, %149
  br i1 %150, label %151, label %158

; <label>:151:                                    ; preds = %146
  %pgocount9 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 30)
  %152 = add i64 %pgocount9, 1
  store i64 %152, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 30)
  %153 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %154 = load double, double* @lame_encode_frame.slot_lag, align 8
  %155 = fsub double %154, %153
  store double %155, double* @lame_encode_frame.slot_lag, align 8
  %156 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %157 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %156, i32 0, i32 44
  store i32 0, i32* %157, align 4
  br label %166

; <label>:158:                                    ; preds = %146
  %pgocount10 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 31)
  %159 = add i64 %pgocount10, 1
  store i64 %159, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 31)
  %160 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %161 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %160, i32 0, i32 44
  store i32 1, i32* %161, align 4
  %162 = load double, double* @lame_encode_frame.frac_SpF, align 8
  %163 = fsub double 1.000000e+00, %162
  %164 = load double, double* @lame_encode_frame.slot_lag, align 8
  %165 = fadd double %164, %163
  store double %165, double* @lame_encode_frame.slot_lag, align 8
  br label %166

; <label>:166:                                    ; preds = %158, %151
  br label %167

; <label>:167:                                    ; preds = %166, %143
  %pgocount11 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 28)
  %168 = add i64 %pgocount11, 1
  store i64 %168, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 28)
  br label %169

; <label>:169:                                    ; preds = %167, %139
  br label %170

; <label>:170:                                    ; preds = %169, %130
  br label %171

; <label>:171:                                    ; preds = %170, %119, %115
  %172 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %173 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %172, i32 0, i32 4
  %174 = load i32, i32* %173, align 4
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %213, label %176

; <label>:176:                                    ; preds = %171
  %pgocount12 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 14)
  %177 = add i64 %pgocount12, 1
  store i64 %177, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 14)
  %178 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %179 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %178, i32 0, i32 7
  %180 = load i32, i32* %179, align 8
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %213, label %182

; <label>:182:                                    ; preds = %176
  %183 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %184 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %183, i32 0, i32 43
  %185 = load i32, i32* %184, align 8
  %186 = icmp eq i32 %185, 0
  %187 = zext i1 %186 to i64
  %pgocount13 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 33)
  %188 = add i64 %pgocount13, %187
  store i64 %188, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 33)
  %189 = select i1 %186, i32 200, i32 50
  store i32 %189, i32* %34, align 4
  %190 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %191 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %190, i32 0, i32 39
  %192 = load i64, i64* %191, align 8
  %193 = load i32, i32* %34, align 4
  %194 = sext i32 %193 to i64
  %195 = srem i64 %192, %194
  %196 = icmp eq i64 %195, 0
  br i1 %196, label %197, label %211

; <label>:197:                                    ; preds = %182
  %pgocount14 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 29)
  %198 = add i64 %pgocount14, 1
  store i64 %198, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 29)
  %199 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %200 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %199, i32 0, i32 3
  %201 = load i32, i32* %200, align 8
  %202 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %203 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %202, i32 0, i32 39
  %204 = load i64, i64* %203, align 8
  %205 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %206 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %205, i32 0, i32 40
  %207 = load i64, i64* %206, align 8
  %208 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %209 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %208, i32 0, i32 42
  %210 = load i32, i32* %209, align 4
  call void @timestatus(i32 %201, i64 %204, i64 %207, i32 %210)
  br label %211

; <label>:211:                                    ; preds = %197, %182
  %pgocount15 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 26)
  %212 = add i64 %pgocount15, 1
  store i64 %212, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 26)
  br label %213

; <label>:213:                                    ; preds = %211, %176, %171
  %214 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %215 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %214, i32 0, i32 63
  %216 = load i32, i32* %215, align 8
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %308

; <label>:218:                                    ; preds = %213
  %219 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %220 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %219, i32 0, i32 45
  %221 = load i32, i32* %220, align 8
  %222 = sub nsw i32 %221, 1
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 %223
  %225 = load double, double* %224, align 8
  store double %225, double* %30, align 8
  store i32 0, i32* %25, align 4
  br label %226

; <label>:226:                                    ; preds = %304, %218
  %227 = load i32, i32* %25, align 4
  %228 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %229 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %228, i32 0, i32 45
  %230 = load i32, i32* %229, align 8
  %231 = icmp slt i32 %227, %230
  br i1 %231, label %232, label %307

; <label>:232:                                    ; preds = %226
  %pgocount16 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 5)
  %233 = add i64 %pgocount16, 1
  store i64 %233, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 5)
  store i32 0, i32* %24, align 4
  br label %234

; <label>:234:                                    ; preds = %255, %232
  %235 = load i32, i32* %24, align 4
  %236 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %237 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %236, i32 0, i32 46
  %238 = load i32, i32* %237, align 4
  %239 = icmp slt i32 %235, %238
  br i1 %239, label %240, label %258

; <label>:240:                                    ; preds = %234
  %pgocount17 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 3)
  %241 = add i64 %pgocount17, 1
  store i64 %241, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 3)
  %242 = load i32, i32* %24, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [2 x i16*], [2 x i16*]* %20, i64 0, i64 %243
  %245 = load i16*, i16** %244, align 8
  %246 = load i32, i32* %25, align 4
  %247 = mul nsw i32 %246, 576
  %248 = add nsw i32 576, %247
  %249 = sub nsw i32 %248, 272
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i16, i16* %245, i64 %250
  %252 = load i32, i32* %24, align 4
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds [2 x i16*], [2 x i16*]* %35, i64 0, i64 %253
  store i16* %251, i16** %254, align 8
  br label %255

; <label>:255:                                    ; preds = %240
  %256 = load i32, i32* %24, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, i32* %24, align 4
  br label %234

; <label>:258:                                    ; preds = %234
  %259 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %260 = getelementptr inbounds [2 x i16*], [2 x i16*]* %35, i32 0, i32 0
  %261 = load i32, i32* %25, align 4
  %262 = load i32, i32* %25, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 %263
  %265 = load i32, i32* %25, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [2 x double], [2 x double]* @lame_encode_frame.ms_ener_ratio, i64 0, i64 %266
  %268 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %16, i32 0, i32 0
  %269 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %17, i32 0, i32 0
  %270 = load i32, i32* %25, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %21, i64 0, i64 %271
  %273 = getelementptr inbounds [2 x double], [2 x double]* %272, i32 0, i32 0
  %274 = load i32, i32* %25, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %22, i64 0, i64 %275
  %277 = getelementptr inbounds [2 x double], [2 x double]* %276, i32 0, i32 0
  %278 = getelementptr inbounds [2 x i32], [2 x i32]* %36, i32 0, i32 0
  call void @L3psycho_anal(%struct.lame_global_flags* %259, i16** %260, i32 %261, double* %264, double* %29, double* %267, [2 x %struct.III_psy_ratio]* %268, [2 x %struct.III_psy_ratio]* %269, double* %273, double* %277, i32* %278)
  store i32 0, i32* %24, align 4
  br label %279

; <label>:279:                                    ; preds = %300, %258
  %280 = load i32, i32* %24, align 4
  %281 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %282 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %281, i32 0, i32 46
  %283 = load i32, i32* %282, align 4
  %284 = icmp slt i32 %280, %283
  br i1 %284, label %285, label %303

; <label>:285:                                    ; preds = %279
  %pgocount18 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 4)
  %286 = add i64 %pgocount18, 1
  store i64 %286, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 4)
  %287 = load i32, i32* %24, align 4
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds [2 x i32], [2 x i32]* %36, i64 0, i64 %288
  %290 = load i32, i32* %289, align 4
  %291 = load i32, i32* %25, align 4
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i32 0, i32 4), i64 0, i64 %292
  %294 = getelementptr inbounds %struct.anon, %struct.anon* %293, i32 0, i32 0
  %295 = load i32, i32* %24, align 4
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %294, i64 0, i64 %296
  %298 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %297, i32 0, i32 0
  %299 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %298, i32 0, i32 6
  store i32 %290, i32* %299, align 8
  br label %300

; <label>:300:                                    ; preds = %285
  %301 = load i32, i32* %24, align 4
  %302 = add nsw i32 %301, 1
  store i32 %302, i32* %24, align 4
  br label %279

; <label>:303:                                    ; preds = %279
  br label %304

; <label>:304:                                    ; preds = %303
  %305 = load i32, i32* %25, align 4
  %306 = add nsw i32 %305, 1
  store i32 %306, i32* %25, align 4
  br label %226

; <label>:307:                                    ; preds = %226
  br label %349

; <label>:308:                                    ; preds = %213
  %pgocount19 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 15)
  %309 = add i64 %pgocount19, 1
  store i64 %309, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 15)
  store i32 0, i32* %25, align 4
  br label %310

; <label>:310:                                    ; preds = %344, %308
  %311 = load i32, i32* %25, align 4
  %312 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %313 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %312, i32 0, i32 45
  %314 = load i32, i32* %313, align 8
  %315 = icmp slt i32 %311, %314
  br i1 %315, label %316, label %348

; <label>:316:                                    ; preds = %310
  store i32 0, i32* %24, align 4
  br label %317

; <label>:317:                                    ; preds = %339, %316
  %318 = load i32, i32* %24, align 4
  %319 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %320 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %319, i32 0, i32 46
  %321 = load i32, i32* %320, align 4
  %322 = icmp slt i32 %318, %321
  br i1 %322, label %323, label %343

; <label>:323:                                    ; preds = %317
  %324 = load i32, i32* %25, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i32 0, i32 4), i64 0, i64 %325
  %327 = getelementptr inbounds %struct.anon, %struct.anon* %326, i32 0, i32 0
  %328 = load i32, i32* %24, align 4
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %327, i64 0, i64 %329
  %331 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %330, i32 0, i32 0
  %332 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %331, i32 0, i32 6
  store i32 0, i32* %332, align 8
  %333 = load i32, i32* %25, align 4
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %21, i64 0, i64 %334
  %336 = load i32, i32* %24, align 4
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [2 x double], [2 x double]* %335, i64 0, i64 %337
  store double 7.000000e+02, double* %338, align 8
  br label %339

; <label>:339:                                    ; preds = %323
  %pgocount20 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 0)
  %340 = add i64 %pgocount20, 1
  store i64 %340, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 0)
  %341 = load i32, i32* %24, align 4
  %342 = add nsw i32 %341, 1
  store i32 %342, i32* %24, align 4
  br label %317

; <label>:343:                                    ; preds = %317
  br label %344

; <label>:344:                                    ; preds = %343
  %pgocount21 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 6)
  %345 = add i64 %pgocount21, 1
  store i64 %345, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 6)
  %346 = load i32, i32* %25, align 4
  %347 = add nsw i32 %346, 1
  store i32 %347, i32* %25, align 4
  br label %310

; <label>:348:                                    ; preds = %310
  br label %349

; <label>:349:                                    ; preds = %348, %307
  store i32 0, i32* %25, align 4
  br label %350

; <label>:350:                                    ; preds = %392, %349
  %351 = load i32, i32* %25, align 4
  %352 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %353 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %352, i32 0, i32 45
  %354 = load i32, i32* %353, align 8
  %355 = icmp slt i32 %351, %354
  br i1 %355, label %356, label %395

; <label>:356:                                    ; preds = %350
  %pgocount22 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 1)
  %357 = add i64 %pgocount22, 1
  store i64 %357, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 1)
  store i32 0, i32* %24, align 4
  br label %358

; <label>:358:                                    ; preds = %388, %356
  %359 = load i32, i32* %24, align 4
  %360 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %361 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %360, i32 0, i32 46
  %362 = load i32, i32* %361, align 4
  %363 = icmp slt i32 %359, %362
  br i1 %363, label %364, label %391

; <label>:364:                                    ; preds = %358
  %pgocount23 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 7)
  %365 = add i64 %pgocount23, 1
  store i64 %365, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 7)
  %366 = load i32, i32* %25, align 4
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i32 0, i32 4), i64 0, i64 %367
  %369 = getelementptr inbounds %struct.anon, %struct.anon* %368, i32 0, i32 0
  %370 = load i32, i32* %24, align 4
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %369, i64 0, i64 %371
  %373 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %372, i32 0, i32 0
  store %struct.gr_info* %373, %struct.gr_info** %37, align 8
  %374 = load %struct.gr_info*, %struct.gr_info** %37, align 8
  %375 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %374, i32 0, i32 7
  store i32 0, i32* %375, align 4
  %376 = load %struct.gr_info*, %struct.gr_info** %37, align 8
  %377 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %376, i32 0, i32 6
  %378 = load i32, i32* %377, align 8
  %379 = icmp eq i32 %378, 0
  br i1 %379, label %380, label %383

; <label>:380:                                    ; preds = %364
  %381 = load %struct.gr_info*, %struct.gr_info** %37, align 8
  %382 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %381, i32 0, i32 5
  store i32 0, i32* %382, align 4
  br label %387

; <label>:383:                                    ; preds = %364
  %pgocount24 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 2)
  %384 = add i64 %pgocount24, 1
  store i64 %384, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 2)
  %385 = load %struct.gr_info*, %struct.gr_info** %37, align 8
  %386 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %385, i32 0, i32 5
  store i32 1, i32* %386, align 4
  br label %387

; <label>:387:                                    ; preds = %383, %380
  br label %388

; <label>:388:                                    ; preds = %387
  %389 = load i32, i32* %24, align 4
  %390 = add nsw i32 %389, 1
  store i32 %390, i32* %24, align 4
  br label %358

; <label>:391:                                    ; preds = %358
  br label %392

; <label>:392:                                    ; preds = %391
  %393 = load i32, i32* %25, align 4
  %394 = add nsw i32 %393, 1
  store i32 %394, i32* %25, align 4
  br label %350

; <label>:395:                                    ; preds = %350
  %396 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %397 = getelementptr inbounds [2 x i16*], [2 x i16*]* %20, i64 0, i64 0
  %398 = load i16*, i16** %397, align 16
  %399 = getelementptr inbounds [2 x i16*], [2 x i16*]* %20, i64 0, i64 1
  %400 = load i16*, i16** %399, align 8
  %401 = getelementptr inbounds [2 x [2 x [576 x double]]], [2 x [2 x [576 x double]]]* %13, i32 0, i32 0
  call void @mdct_sub48(%struct.lame_global_flags* %396, i16* %398, i16* %400, [2 x [576 x double]]* %401, %struct.III_side_info_t* @l3_side)
  %402 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %403 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %402, i32 0, i32 8
  %404 = load i32, i32* %403, align 4
  %405 = icmp eq i32 %404, 1
  %406 = zext i1 %405 to i32
  store i32 %406, i32* %28, align 4
  %407 = load i32, i32* %28, align 4
  %408 = icmp ne i32 %407, 0
  br i1 %408, label %409, label %422

; <label>:409:                                    ; preds = %395
  %410 = load i32, i32* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i32 0, i32 4, i64 0, i32 0, i64 0, i32 0, i32 6), align 8
  %411 = load i32, i32* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i32 0, i32 4, i64 0, i32 0, i64 1, i32 0, i32 6), align 8
  %412 = icmp eq i32 %410, %411
  br i1 %412, label %413, label %418

; <label>:413:                                    ; preds = %409
  %pgocount25 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 18)
  %414 = add i64 %pgocount25, 1
  store i64 %414, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 18)
  %415 = load i32, i32* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i32 0, i32 4, i64 1, i32 0, i64 0, i32 0, i32 6), align 8
  %416 = load i32, i32* getelementptr inbounds (%struct.III_side_info_t, %struct.III_side_info_t* @l3_side, i32 0, i32 4, i64 1, i32 0, i64 1, i32 0, i32 6), align 8
  %417 = icmp eq i32 %415, %416
  br label %418

; <label>:418:                                    ; preds = %413, %409
  %419 = phi i1 [ false, %409 ], [ %417, %413 ]
  %pgocount26 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 8)
  %420 = add i64 %pgocount26, 1
  store i64 %420, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 8)
  %421 = zext i1 %419 to i32
  store i32 %421, i32* %28, align 4
  br label %422

; <label>:422:                                    ; preds = %418, %395
  %423 = load i32, i32* %28, align 4
  %424 = icmp ne i32 %423, 0
  br i1 %424, label %425, label %446

; <label>:425:                                    ; preds = %422
  %426 = load double, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 0), align 16
  %427 = load double, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i64 0, i64 1), align 8
  %428 = fadd double %426, %427
  %429 = load double, double* %30, align 8
  %430 = fadd double %428, %429
  %431 = load double, double* %29, align 8
  %432 = fadd double %430, %431
  %433 = fmul double 2.500000e-01, %432
  store double %433, double* %38, align 8
  %434 = load double, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ener_ratio, i64 0, i64 0), align 16
  %435 = load double, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ener_ratio, i64 0, i64 1), align 8
  %436 = fadd double %434, %435
  %437 = fmul double 5.000000e-01, %436
  store double %437, double* %39, align 8
  %438 = load double, double* %38, align 8
  %439 = fcmp olt double %438, 3.500000e-01
  br i1 %439, label %440, label %444

; <label>:440:                                    ; preds = %425
  %pgocount27 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 19)
  %441 = add i64 %pgocount27, 1
  store i64 %441, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 19)
  %442 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %443 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %442, i32 0, i32 52
  store i32 2, i32* %443, align 4
  br label %444

; <label>:444:                                    ; preds = %440, %425
  %pgocount28 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 9)
  %445 = add i64 %pgocount28, 1
  store i64 %445, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 9)
  br label %446

; <label>:446:                                    ; preds = %444, %422
  %447 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %448 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %447, i32 0, i32 10
  %449 = load i32, i32* %448, align 4
  %450 = icmp ne i32 %449, 0
  br i1 %450, label %451, label %455

; <label>:451:                                    ; preds = %446
  %pgocount29 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 10)
  %452 = add i64 %pgocount29, 1
  store i64 %452, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 10)
  %453 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %454 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %453, i32 0, i32 52
  store i32 2, i32* %454, align 4
  br label %455

; <label>:455:                                    ; preds = %451, %446
  %456 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %457 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %456, i32 0, i32 52
  %458 = load i32, i32* %457, align 4
  %459 = icmp eq i32 2, %458
  br i1 %459, label %460, label %461

; <label>:460:                                    ; preds = %455
  store [2 x [2 x %struct.III_psy_ratio]]* %17, [2 x [2 x %struct.III_psy_ratio]]** %18, align 8
  store [2 x [2 x double]]* %22, [2 x [2 x double]]** %23, align 8
  br label %463

; <label>:461:                                    ; preds = %455
  %pgocount30 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 13)
  %462 = add i64 %pgocount30, 1
  store i64 %462, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 13)
  store [2 x [2 x %struct.III_psy_ratio]]* %16, [2 x [2 x %struct.III_psy_ratio]]** %18, align 8
  store [2 x [2 x double]]* %21, [2 x [2 x double]]** %23, align 8
  br label %463

; <label>:463:                                    ; preds = %461, %460
  %464 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %465 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %464, i32 0, i32 21
  %466 = load i32, i32* %465, align 8
  %467 = icmp ne i32 %466, 0
  br i1 %467, label %468, label %477

; <label>:468:                                    ; preds = %463
  %469 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %470 = load [2 x [2 x double]]*, [2 x [2 x double]]** %23, align 8
  %471 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %470, i32 0, i32 0
  %472 = getelementptr inbounds [2 x [2 x [576 x double]]], [2 x [2 x [576 x double]]]* %13, i32 0, i32 0
  %473 = load [2 x [2 x %struct.III_psy_ratio]]*, [2 x [2 x %struct.III_psy_ratio]]** %18, align 8
  %474 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %473, i32 0, i32 0
  %475 = getelementptr inbounds [2 x [2 x [576 x i32]]], [2 x [2 x [576 x i32]]]* %14, i32 0, i32 0
  %476 = getelementptr inbounds [2 x [2 x %struct.III_scalefac_t]], [2 x [2 x %struct.III_scalefac_t]]* %19, i32 0, i32 0
  call void @VBR_iteration_loop(%struct.lame_global_flags* %469, [2 x double]* %471, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i32 0, i32 0), [2 x [576 x double]]* %472, [2 x %struct.III_psy_ratio]* %474, %struct.III_side_info_t* @l3_side, [2 x [576 x i32]]* %475, [2 x %struct.III_scalefac_t]* %476)
  br label %487

; <label>:477:                                    ; preds = %463
  %pgocount31 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 16)
  %478 = add i64 %pgocount31, 1
  store i64 %478, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 16)
  %479 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %480 = load [2 x [2 x double]]*, [2 x [2 x double]]** %23, align 8
  %481 = getelementptr inbounds [2 x [2 x double]], [2 x [2 x double]]* %480, i32 0, i32 0
  %482 = getelementptr inbounds [2 x [2 x [576 x double]]], [2 x [2 x [576 x double]]]* %13, i32 0, i32 0
  %483 = load [2 x [2 x %struct.III_psy_ratio]]*, [2 x [2 x %struct.III_psy_ratio]]** %18, align 8
  %484 = getelementptr inbounds [2 x [2 x %struct.III_psy_ratio]], [2 x [2 x %struct.III_psy_ratio]]* %483, i32 0, i32 0
  %485 = getelementptr inbounds [2 x [2 x [576 x i32]]], [2 x [2 x [576 x i32]]]* %14, i32 0, i32 0
  %486 = getelementptr inbounds [2 x [2 x %struct.III_scalefac_t]], [2 x [2 x %struct.III_scalefac_t]]* %19, i32 0, i32 0
  call void @iteration_loop(%struct.lame_global_flags* %479, [2 x double]* %481, double* getelementptr inbounds ([2 x double], [2 x double]* @lame_encode_frame.ms_ratio, i32 0, i32 0), [2 x [576 x double]]* %482, [2 x %struct.III_psy_ratio]* %484, %struct.III_side_info_t* @l3_side, [2 x [576 x i32]]* %485, [2 x %struct.III_scalefac_t]* %486)
  br label %487

; <label>:487:                                    ; preds = %477, %468
  %488 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  call void @getframebits(%struct.lame_global_flags* %488, i32* %27, i32* %26)
  %489 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %490 = load i32, i32* %27, align 4
  %491 = getelementptr inbounds [2 x [2 x [576 x i32]]], [2 x [2 x [576 x i32]]]* %14, i32 0, i32 0
  %492 = getelementptr inbounds [2 x [2 x %struct.III_scalefac_t]], [2 x [2 x %struct.III_scalefac_t]]* %19, i32 0, i32 0
  call void @III_format_bitstream(%struct.lame_global_flags* %489, i32 %490, [2 x [576 x i32]]* %491, %struct.III_side_info_t* @l3_side, [2 x %struct.III_scalefac_t]* %492, %struct.bit_stream_struc* @bs)
  %493 = load i64, i64* getelementptr inbounds (%struct.bit_stream_struc, %struct.bit_stream_struc* @bs, i32 0, i32 5), align 8
  %494 = load i64, i64* @lame_encode_frame.sentBits, align 8
  %495 = sub i64 %493, %494
  store i64 %495, i64* @lame_encode_frame.frameBits, align 8
  %496 = load i64, i64* @lame_encode_frame.frameBits, align 8
  %497 = load i64, i64* @lame_encode_frame.bitsPerSlot, align 8
  %498 = urem i64 %496, %497
  %499 = icmp ne i64 %498, 0
  br i1 %499, label %500, label %511

; <label>:500:                                    ; preds = %487
  %pgocount32 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 11)
  %501 = add i64 %pgocount32, 1
  store i64 %501, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 11)
  %502 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %503 = load i64, i64* @lame_encode_frame.frameBits, align 8
  %504 = load i64, i64* @lame_encode_frame.frameBits, align 8
  %505 = load i64, i64* @lame_encode_frame.bitsPerSlot, align 8
  %506 = udiv i64 %504, %505
  %507 = load i64, i64* @lame_encode_frame.frameBits, align 8
  %508 = load i64, i64* @lame_encode_frame.bitsPerSlot, align 8
  %509 = urem i64 %507, %508
  %510 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %502, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.18, i32 0, i32 0), i64 %503, i64 %506, i64 %509)
  br label %511

; <label>:511:                                    ; preds = %500, %487
  %512 = load i64, i64* @lame_encode_frame.frameBits, align 8
  %513 = load i64, i64* @lame_encode_frame.sentBits, align 8
  %514 = add i64 %513, %512
  store i64 %514, i64* @lame_encode_frame.sentBits, align 8
  %515 = load i8*, i8** %11, align 8
  %516 = load i32, i32* %12, align 4
  %517 = call i32 @copy_buffer(i8* %515, i32 %516, %struct.bit_stream_struc* @bs)
  store i32 %517, i32* %15, align 4
  %518 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %519 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %518, i32 0, i32 5
  %520 = load i32, i32* %519, align 8
  %521 = icmp ne i32 %520, 0
  br i1 %521, label %522, label %527

; <label>:522:                                    ; preds = %511
  %pgocount33 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 12)
  %523 = add i64 %pgocount33, 1
  store i64 %523, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_lame_encode_frame, i64 0, i64 12)
  %524 = load i64, i64* @lame_encode_frame.sentBits, align 8
  %525 = udiv i64 %524, 8
  %526 = trunc i64 %525 to i32
  call void @AddVbrFrame(i32 %526)
  br label %527

; <label>:527:                                    ; preds = %522, %511
  %528 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %529 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %528, i32 0, i32 39
  %530 = load i64, i64* %529, align 8
  %531 = add nsw i64 %530, 1
  store i64 %531, i64* %529, align 8
  %532 = load i32, i32* %15, align 4
  ret i32 %532
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #5

declare void @timestatus(i32, i64, i64, i32) #2

declare void @L3psycho_anal(%struct.lame_global_flags*, i16**, i32, double*, double*, double*, [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]*, double*, double*, i32*) #2

declare void @mdct_sub48(%struct.lame_global_flags*, i16*, i16*, [2 x [576 x double]]*, %struct.III_side_info_t*) #2

declare void @VBR_iteration_loop(%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) #2

declare void @iteration_loop(%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) #2

declare void @getframebits(%struct.lame_global_flags*, i32*, i32*) #2

declare void @III_format_bitstream(%struct.lame_global_flags*, i32, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*, %struct.bit_stream_struc*) #2

declare i32 @copy_buffer(i8*, i32, %struct.bit_stream_struc*) #2

declare void @AddVbrFrame(i32) #2

; Function Attrs: nounwind uwtable
define i32 @fill_buffer_resample(%struct.lame_global_flags*, i16*, i32, i16*, i32, i32*, i32) #0 {
  %8 = alloca %struct.lame_global_flags*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i16*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca double, align 8
  %25 = alloca double, align 8
  %26 = alloca double, align 8
  %27 = alloca double, align 8
  %28 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %8, align 8
  store i16* %1, i16** %9, align 8
  store i32 %2, i32* %10, align 4
  store i16* %3, i16** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  store i32 0, i32* %16, align 4
  %29 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %29, i32 0, i32 39
  %31 = load i64, i64* %30, align 8
  %32 = icmp eq i64 %31, 0
  br i1 %32, label %33, label %53

; <label>:33:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 13)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 13)
  %35 = load i32, i32* %14, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [2 x i32], [2 x i32]* @fill_buffer_resample.init, i64 0, i64 %36
  %38 = load i32, i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %53, label %40

; <label>:40:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 14)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 14)
  %42 = load i32, i32* %14, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [2 x i32], [2 x i32]* @fill_buffer_resample.init, i64 0, i64 %43
  store i32 1, i32* %44, align 4
  %45 = load i32, i32* %14, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [2 x double], [2 x double]* @fill_buffer_resample.itime, i64 0, i64 %46
  store double 0.000000e+00, double* %47, align 8
  %48 = load i32, i32* %14, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %49
  %51 = getelementptr inbounds [5 x i16], [5 x i16]* %50, i32 0, i32 0
  %52 = bitcast i16* %51 to i8*
  call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 10, i32 2, i1 false)
  br label %53

; <label>:53:                                     ; preds = %40, %33, %7
  %54 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %55 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %54, i32 0, i32 39
  %56 = load i64, i64* %55, align 8
  %57 = icmp ne i64 %56, 0
  br i1 %57, label %58, label %63

; <label>:58:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 9)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 9)
  %60 = load i32, i32* %14, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [2 x i32], [2 x i32]* @fill_buffer_resample.init, i64 0, i64 %61
  store i32 0, i32* %62, align 4
  br label %63

; <label>:63:                                     ; preds = %58, %53
  %64 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %65 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %64, i32 0, i32 49
  %66 = load float, float* %65, align 8
  %67 = fpext float %66 to double
  %68 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %69 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %68, i32 0, i32 49
  %70 = load float, float* %69, align 8
  %71 = fpext float %70 to double
  %72 = fadd double 5.000000e-01, %71
  %73 = call double @floor(double %72) #8
  %74 = fsub double %67, %73
  %75 = call double @fabs(double %74) #8
  %76 = fcmp olt double %75, 1.000000e-04
  %77 = zext i1 %76 to i32
  store i32 %77, i32* %18, align 4
  store i32 0, i32* %17, align 4
  br label %78

; <label>:78:                                     ; preds = %308, %63
  %79 = load i32, i32* %17, align 4
  %80 = load i32, i32* %10, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %311

; <label>:82:                                     ; preds = %78
  %83 = load i32, i32* %17, align 4
  %84 = sitofp i32 %83 to float
  %85 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %86 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %85, i32 0, i32 49
  %87 = load float, float* %86, align 8
  %88 = fmul float %84, %87
  %89 = fpext float %88 to double
  store double %89, double* %28, align 8
  %90 = load double, double* %28, align 8
  %91 = load i32, i32* %14, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [2 x double], [2 x double]* @fill_buffer_resample.itime, i64 0, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fsub double %90, %94
  %96 = call double @floor(double %95) #8
  %97 = fptosi double %96 to i32
  store i32 %97, i32* %16, align 4
  %98 = load i32, i32* %16, align 4
  %99 = add nsw i32 %98, 2
  %100 = load i32, i32* %12, align 4
  %101 = icmp sge i32 %99, %100
  br i1 %101, label %102, label %104

; <label>:102:                                    ; preds = %82
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 12)
  %103 = add i64 %pgocount3, 1
  store i64 %103, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 12)
  br label %311

; <label>:104:                                    ; preds = %82
  %105 = load double, double* %28, align 8
  %106 = load i32, i32* %14, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [2 x double], [2 x double]* @fill_buffer_resample.itime, i64 0, i64 %107
  %109 = load double, double* %108, align 8
  %110 = load i32, i32* %16, align 4
  %111 = sitofp i32 %110 to double
  %112 = fadd double %109, %111
  %113 = fsub double %105, %112
  store double %113, double* %25, align 8
  %114 = load double, double* %25, align 8
  %115 = fsub double %114, 1.000000e+00
  store double %115, double* %26, align 8
  %116 = load i32, i32* %16, align 4
  %117 = icmp slt i32 %116, 0
  br i1 %117, label %118, label %129

; <label>:118:                                    ; preds = %104
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 2)
  %119 = add i64 %pgocount4, 1
  store i64 %119, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 2)
  %120 = load i32, i32* %14, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %121
  %123 = load i32, i32* %16, align 4
  %124 = add nsw i32 5, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [5 x i16], [5 x i16]* %122, i64 0, i64 %125
  %127 = load i16, i16* %126, align 2
  %128 = sext i16 %127 to i32
  br label %136

; <label>:129:                                    ; preds = %104
  %130 = load i16*, i16** %11, align 8
  %131 = load i32, i32* %16, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i16, i16* %130, i64 %132
  %134 = load i16, i16* %133, align 2
  %135 = sext i16 %134 to i32
  br label %136

; <label>:136:                                    ; preds = %129, %118
  %137 = phi i32 [ %128, %118 ], [ %135, %129 ]
  store i32 %137, i32* %21, align 4
  %138 = load i32, i32* %16, align 4
  %139 = add nsw i32 1, %138
  %140 = icmp slt i32 %139, 0
  br i1 %140, label %141, label %152

; <label>:141:                                    ; preds = %136
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 3)
  %142 = add i64 %pgocount5, 1
  store i64 %142, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 3)
  %143 = load i32, i32* %14, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %144
  %146 = load i32, i32* %16, align 4
  %147 = add nsw i32 6, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [5 x i16], [5 x i16]* %145, i64 0, i64 %148
  %150 = load i16, i16* %149, align 2
  %151 = sext i16 %150 to i32
  br label %160

; <label>:152:                                    ; preds = %136
  %153 = load i16*, i16** %11, align 8
  %154 = load i32, i32* %16, align 4
  %155 = add nsw i32 1, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i16, i16* %153, i64 %156
  %158 = load i16, i16* %157, align 2
  %159 = sext i16 %158 to i32
  br label %160

; <label>:160:                                    ; preds = %152, %141
  %161 = phi i32 [ %151, %141 ], [ %159, %152 ]
  store i32 %161, i32* %22, align 4
  %162 = load i32, i32* %18, align 4
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %164, label %182

; <label>:164:                                    ; preds = %160
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 1)
  %165 = add i64 %pgocount6, 1
  store i64 %165, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 1)
  %166 = load i32, i32* %22, align 4
  %167 = sitofp i32 %166 to double
  %168 = load double, double* %25, align 8
  %169 = fmul double %167, %168
  %170 = load i32, i32* %21, align 4
  %171 = sitofp i32 %170 to double
  %172 = load double, double* %26, align 8
  %173 = fmul double %171, %172
  %174 = fsub double %169, %173
  %175 = fadd double 5.000000e-01, %174
  %176 = call double @floor(double %175) #8
  %177 = fptosi double %176 to i16
  %178 = load i16*, i16** %9, align 8
  %179 = load i32, i32* %17, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i16, i16* %178, i64 %180
  store i16 %177, i16* %181, align 2
  br label %307

; <label>:182:                                    ; preds = %160
  %183 = load double, double* %25, align 8
  %184 = fadd double %183, 1.000000e+00
  store double %184, double* %24, align 8
  %185 = load double, double* %25, align 8
  %186 = fsub double %185, 2.000000e+00
  store double %186, double* %27, align 8
  %187 = load i32, i32* %16, align 4
  %188 = sub nsw i32 %187, 1
  %189 = icmp slt i32 %188, 0
  br i1 %189, label %190, label %202

; <label>:190:                                    ; preds = %182
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 5)
  %191 = add i64 %pgocount7, 1
  store i64 %191, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 5)
  %192 = load i32, i32* %14, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %193
  %195 = load i32, i32* %16, align 4
  %196 = sub nsw i32 %195, 1
  %197 = add nsw i32 5, %196
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [5 x i16], [5 x i16]* %194, i64 0, i64 %198
  %200 = load i16, i16* %199, align 2
  %201 = sext i16 %200 to i32
  br label %210

; <label>:202:                                    ; preds = %182
  %203 = load i16*, i16** %11, align 8
  %204 = load i32, i32* %16, align 4
  %205 = sub nsw i32 %204, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i16, i16* %203, i64 %206
  %208 = load i16, i16* %207, align 2
  %209 = sext i16 %208 to i32
  br label %210

; <label>:210:                                    ; preds = %202, %190
  %211 = phi i32 [ %201, %190 ], [ %209, %202 ]
  store i32 %211, i32* %20, align 4
  %212 = load i32, i32* %16, align 4
  %213 = add nsw i32 %212, 2
  %214 = icmp slt i32 %213, 0
  br i1 %214, label %215, label %227

; <label>:215:                                    ; preds = %210
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 6)
  %216 = add i64 %pgocount8, 1
  store i64 %216, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 6)
  %217 = load i32, i32* %14, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %218
  %220 = load i32, i32* %16, align 4
  %221 = add nsw i32 %220, 2
  %222 = add nsw i32 5, %221
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [5 x i16], [5 x i16]* %219, i64 0, i64 %223
  %225 = load i16, i16* %224, align 2
  %226 = sext i16 %225 to i32
  br label %235

; <label>:227:                                    ; preds = %210
  %228 = load i16*, i16** %11, align 8
  %229 = load i32, i32* %16, align 4
  %230 = add nsw i32 %229, 2
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i16, i16* %228, i64 %231
  %233 = load i16, i16* %232, align 2
  %234 = sext i16 %233 to i32
  br label %235

; <label>:235:                                    ; preds = %227, %215
  %236 = phi i32 [ %226, %215 ], [ %234, %227 ]
  store i32 %236, i32* %23, align 4
  %237 = load i32, i32* %20, align 4
  %238 = sub nsw i32 0, %237
  %239 = sitofp i32 %238 to double
  %240 = load double, double* %25, align 8
  %241 = fmul double %239, %240
  %242 = load double, double* %26, align 8
  %243 = fmul double %241, %242
  %244 = load double, double* %27, align 8
  %245 = fmul double %243, %244
  %246 = fdiv double %245, 6.000000e+00
  %247 = fadd double 5.000000e-01, %246
  %248 = load i32, i32* %21, align 4
  %249 = sitofp i32 %248 to double
  %250 = load double, double* %24, align 8
  %251 = fmul double %249, %250
  %252 = load double, double* %26, align 8
  %253 = fmul double %251, %252
  %254 = load double, double* %27, align 8
  %255 = fmul double %253, %254
  %256 = fdiv double %255, 2.000000e+00
  %257 = fadd double %247, %256
  %258 = load i32, i32* %22, align 4
  %259 = sitofp i32 %258 to double
  %260 = load double, double* %24, align 8
  %261 = fmul double %259, %260
  %262 = load double, double* %25, align 8
  %263 = fmul double %261, %262
  %264 = load double, double* %27, align 8
  %265 = fmul double %263, %264
  %266 = fdiv double %265, 2.000000e+00
  %267 = fsub double %257, %266
  %268 = load i32, i32* %23, align 4
  %269 = sitofp i32 %268 to double
  %270 = load double, double* %24, align 8
  %271 = fmul double %269, %270
  %272 = load double, double* %25, align 8
  %273 = fmul double %271, %272
  %274 = load double, double* %26, align 8
  %275 = fmul double %273, %274
  %276 = fdiv double %275, 6.000000e+00
  %277 = fadd double %267, %276
  %278 = call double @floor(double %277) #8
  %279 = fptosi double %278 to i32
  store i32 %279, i32* %19, align 4
  %280 = load i32, i32* %19, align 4
  %281 = icmp sgt i32 %280, 32767
  br i1 %281, label %282, label %288

; <label>:282:                                    ; preds = %235
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 4)
  %283 = add i64 %pgocount9, 1
  store i64 %283, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 4)
  %284 = load i16*, i16** %9, align 8
  %285 = load i32, i32* %17, align 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds i16, i16* %284, i64 %286
  store i16 32767, i16* %287, align 2
  br label %306

; <label>:288:                                    ; preds = %235
  %289 = load i32, i32* %19, align 4
  %290 = icmp slt i32 %289, -32767
  br i1 %290, label %291, label %297

; <label>:291:                                    ; preds = %288
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 7)
  %292 = add i64 %pgocount10, 1
  store i64 %292, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 7)
  %293 = load i16*, i16** %9, align 8
  %294 = load i32, i32* %17, align 4
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i16, i16* %293, i64 %295
  store i16 -32767, i16* %296, align 2
  br label %305

; <label>:297:                                    ; preds = %288
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 8)
  %298 = add i64 %pgocount11, 1
  store i64 %298, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 8)
  %299 = load i32, i32* %19, align 4
  %300 = trunc i32 %299 to i16
  %301 = load i16*, i16** %9, align 8
  %302 = load i32, i32* %17, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i16, i16* %301, i64 %303
  store i16 %300, i16* %304, align 2
  br label %305

; <label>:305:                                    ; preds = %297, %291
  br label %306

; <label>:306:                                    ; preds = %305, %282
  br label %307

; <label>:307:                                    ; preds = %306, %164
  br label %308

; <label>:308:                                    ; preds = %307
  %309 = load i32, i32* %17, align 4
  %310 = add nsw i32 %309, 1
  store i32 %310, i32* %17, align 4
  br label %78

; <label>:311:                                    ; preds = %102, %78
  %312 = load i32, i32* %12, align 4
  %313 = load i32, i32* %16, align 4
  %314 = add nsw i32 %313, 2
  %315 = icmp slt i32 %312, %314
  br i1 %315, label %316, label %319

; <label>:316:                                    ; preds = %311
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 10)
  %317 = add i64 %pgocount12, 1
  store i64 %317, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 10)
  %318 = load i32, i32* %12, align 4
  br label %323

; <label>:319:                                    ; preds = %311
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 11)
  %320 = add i64 %pgocount13, 1
  store i64 %320, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 11)
  %321 = load i32, i32* %16, align 4
  %322 = add nsw i32 %321, 2
  br label %323

; <label>:323:                                    ; preds = %319, %316
  %324 = phi i32 [ %318, %316 ], [ %322, %319 ]
  %325 = load i32*, i32** %13, align 8
  store i32 %324, i32* %325, align 4
  %326 = load i32*, i32** %13, align 8
  %327 = load i32, i32* %326, align 4
  %328 = sitofp i32 %327 to float
  %329 = load i32, i32* %17, align 4
  %330 = sitofp i32 %329 to float
  %331 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %332 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %331, i32 0, i32 49
  %333 = load float, float* %332, align 8
  %334 = fmul float %330, %333
  %335 = fsub float %328, %334
  %336 = fpext float %335 to double
  %337 = load i32, i32* %14, align 4
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds [2 x double], [2 x double]* @fill_buffer_resample.itime, i64 0, i64 %338
  %340 = load double, double* %339, align 8
  %341 = fadd double %340, %336
  store double %341, double* %339, align 8
  store i32 0, i32* %15, align 4
  br label %342

; <label>:342:                                    ; preds = %361, %323
  %343 = load i32, i32* %15, align 4
  %344 = icmp slt i32 %343, 5
  br i1 %344, label %345, label %365

; <label>:345:                                    ; preds = %342
  %346 = load i16*, i16** %11, align 8
  %347 = load i32*, i32** %13, align 8
  %348 = load i32, i32* %347, align 4
  %349 = load i32, i32* %15, align 4
  %350 = add nsw i32 %348, %349
  %351 = sub nsw i32 %350, 5
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds i16, i16* %346, i64 %352
  %354 = load i16, i16* %353, align 2
  %355 = load i32, i32* %14, align 4
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [2 x [5 x i16]], [2 x [5 x i16]]* @fill_buffer_resample.inbuf_old, i64 0, i64 %356
  %358 = load i32, i32* %15, align 4
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds [5 x i16], [5 x i16]* %357, i64 0, i64 %359
  store i16 %354, i16* %360, align 2
  br label %361

; <label>:361:                                    ; preds = %345
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 0)
  %362 = add i64 %pgocount14, 1
  store i64 %362, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_fill_buffer_resample, i64 0, i64 0)
  %363 = load i32, i32* %15, align 4
  %364 = add nsw i32 %363, 1
  store i32 %364, i32* %15, align 4
  br label %342

; <label>:365:                                    ; preds = %342
  %366 = load i32, i32* %17, align 4
  ret i32 %366
}

; Function Attrs: nounwind uwtable
define i32 @fill_buffer(%struct.lame_global_flags*, i16*, i32, i16*, i32) #0 {
  %6 = alloca %struct.lame_global_flags*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %6, align 8
  store i16* %1, i16** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16* %3, i16** %9, align 8
  store i32 %4, i32* %10, align 4
  %12 = load i32, i32* %8, align 4
  %13 = load i32, i32* %10, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_fill_buffer, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_fill_buffer, i64 0, i64 0)
  %17 = load i32, i32* %8, align 4
  br label %21

; <label>:18:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_fill_buffer, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_fill_buffer, i64 0, i64 1)
  %20 = load i32, i32* %10, align 4
  br label %21

; <label>:21:                                     ; preds = %18, %15
  %22 = phi i32 [ %17, %15 ], [ %20, %18 ]
  store i32 %22, i32* %11, align 4
  %23 = load i16*, i16** %7, align 8
  %24 = bitcast i16* %23 to i8*
  %25 = load i16*, i16** %9, align 8
  %26 = bitcast i16* %25 to i8*
  %27 = load i32, i32* %11, align 4
  %28 = sext i32 %27 to i64
  %29 = mul i64 2, %28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %26, i64 %29, i32 1, i1 false)
  %30 = load i32, i32* %11, align 4
  ret i32 %30
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @lame_encode_buffer(%struct.lame_global_flags*, i16*, i16*, i32, i8*, i32) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.lame_global_flags*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca [2 x i16*], align 16
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %8, align 8
  store i16* %1, i16** %9, align 8
  store i16* %2, i16** %10, align 8
  store i32 %3, i32* %11, align 4
  store i8* %4, i8** %12, align 8
  store i32 %5, i32* %13, align 4
  store i32 0, i32* %14, align 4
  %22 = load i16*, i16** %9, align 8
  %23 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 0
  store i16* %22, i16** %23, align 16
  %24 = load i16*, i16** %10, align 8
  %25 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 1
  store i16* %24, i16** %25, align 8
  %26 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %27 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %26, i32 0, i32 42
  %28 = load i32, i32* %27, align 4
  %29 = add nsw i32 1024, %28
  %30 = sub nsw i32 %29, 272
  store i32 %30, i32* %18, align 4
  %31 = load i32, i32* %18, align 4
  %32 = icmp sge i32 3056, %31
  br i1 %32, label %33, label %34

; <label>:33:                                     ; preds = %6
  br label %37

; <label>:34:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 15)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 15)
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 990, i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %37

; <label>:37:                                     ; preds = %36, %33
  %38 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %38, i32 0, i32 39
  %40 = load i64, i64* %39, align 8
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %42, label %48

; <label>:42:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 10)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 10)
  %44 = load i32, i32* @lame_encode_buffer.frame_buffered, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %48, label %46

; <label>:46:                                     ; preds = %42
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 13)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 13)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([2 x [3056 x i16]]* @mfbuf to i8*), i8 0, i64 12224, i32 16, i1 false)
  store i32 1, i32* @lame_encode_buffer.frame_buffered, align 4
  store i32 1088, i32* @mf_samples_to_encode, align 4
  store i32 752, i32* @mf_size, align 4
  br label %48

; <label>:48:                                     ; preds = %46, %42, %37
  %49 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %50 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %49, i32 0, i32 39
  %51 = load i64, i64* %50, align 8
  %52 = icmp eq i64 %51, 1
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 8)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 8)
  store i32 0, i32* @lame_encode_buffer.frame_buffered, align 4
  br label %55

; <label>:55:                                     ; preds = %53, %48
  %56 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %57 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %56, i32 0, i32 1
  %58 = load i32, i32* %57, align 8
  %59 = icmp eq i32 %58, 2
  br i1 %59, label %60, label %105

; <label>:60:                                     ; preds = %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 9)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 9)
  %62 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %63 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %62, i32 0, i32 46
  %64 = load i32, i32* %63, align 4
  %65 = icmp eq i32 %64, 1
  br i1 %65, label %66, label %105

; <label>:66:                                     ; preds = %60
  store i32 0, i32* %16, align 4
  br label %67

; <label>:67:                                     ; preds = %99, %66
  %68 = load i32, i32* %16, align 4
  %69 = load i32, i32* %11, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %103

; <label>:71:                                     ; preds = %67
  %72 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 0
  %73 = load i16*, i16** %72, align 16
  %74 = load i32, i32* %16, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i16, i16* %73, i64 %75
  %77 = load i16, i16* %76, align 2
  %78 = sext i16 %77 to i32
  %79 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 1
  %80 = load i16*, i16** %79, align 8
  %81 = load i32, i32* %16, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i16, i16* %80, i64 %82
  %84 = load i16, i16* %83, align 2
  %85 = sext i16 %84 to i32
  %86 = add nsw i32 %78, %85
  %87 = sdiv i32 %86, 2
  %88 = trunc i32 %87 to i16
  %89 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 0
  %90 = load i16*, i16** %89, align 16
  %91 = load i32, i32* %16, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i16, i16* %90, i64 %92
  store i16 %88, i16* %93, align 2
  %94 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 1
  %95 = load i16*, i16** %94, align 8
  %96 = load i32, i32* %16, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i16, i16* %95, i64 %97
  store i16 0, i16* %98, align 2
  br label %99

; <label>:99:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 6)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 6)
  %101 = load i32, i32* %16, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %16, align 4
  br label %67

; <label>:103:                                    ; preds = %67
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 12)
  %104 = add i64 %pgocount6, 1
  store i64 %104, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 12)
  br label %105

; <label>:105:                                    ; preds = %103, %60, %55
  br label %106

; <label>:106:                                    ; preds = %258, %105
  %107 = load i32, i32* %11, align 4
  %108 = icmp sgt i32 %107, 0
  br i1 %108, label %109, label %260

; <label>:109:                                    ; preds = %106
  store i32 0, i32* %20, align 4
  store i32 0, i32* %21, align 4
  store i32 0, i32* %17, align 4
  br label %110

; <label>:110:                                    ; preds = %167, %109
  %111 = load i32, i32* %17, align 4
  %112 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %113 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %112, i32 0, i32 46
  %114 = load i32, i32* %113, align 4
  %115 = icmp slt i32 %111, %114
  br i1 %115, label %116, label %170

; <label>:116:                                    ; preds = %110
  %117 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %118 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %117, i32 0, i32 49
  %119 = load float, float* %118, align 8
  %120 = fcmp une float %119, 1.000000e+00
  br i1 %120, label %121, label %140

; <label>:121:                                    ; preds = %116
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 3)
  %122 = add i64 %pgocount7, 1
  store i64 %122, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 3)
  %123 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %124 = load i32, i32* %17, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %125
  %127 = load i32, i32* @mf_size, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [3056 x i16], [3056 x i16]* %126, i64 0, i64 %128
  %130 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %131 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %130, i32 0, i32 42
  %132 = load i32, i32* %131, align 4
  %133 = load i32, i32* %17, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 %134
  %136 = load i16*, i16** %135, align 8
  %137 = load i32, i32* %11, align 4
  %138 = load i32, i32* %17, align 4
  %139 = call i32 @fill_buffer_resample(%struct.lame_global_flags* %123, i16* %129, i32 %132, i16* %136, i32 %137, i32* %20, i32 %138)
  store i32 %139, i32* %21, align 4
  br label %159

; <label>:140:                                    ; preds = %116
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 1)
  %141 = add i64 %pgocount8, 1
  store i64 %141, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 1)
  %142 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %143 = load i32, i32* %17, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %144
  %146 = load i32, i32* @mf_size, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [3056 x i16], [3056 x i16]* %145, i64 0, i64 %147
  %149 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %150 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %149, i32 0, i32 42
  %151 = load i32, i32* %150, align 4
  %152 = load i32, i32* %17, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 %153
  %155 = load i16*, i16** %154, align 8
  %156 = load i32, i32* %11, align 4
  %157 = call i32 @fill_buffer(%struct.lame_global_flags* %142, i16* %148, i32 %151, i16* %155, i32 %156)
  store i32 %157, i32* %21, align 4
  %158 = load i32, i32* %21, align 4
  store i32 %158, i32* %20, align 4
  br label %159

; <label>:159:                                    ; preds = %140, %121
  %160 = load i32, i32* %20, align 4
  %161 = load i32, i32* %17, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [2 x i16*], [2 x i16*]* %19, i64 0, i64 %162
  %164 = load i16*, i16** %163, align 8
  %165 = sext i32 %160 to i64
  %166 = getelementptr inbounds i16, i16* %164, i64 %165
  store i16* %166, i16** %163, align 8
  br label %167

; <label>:167:                                    ; preds = %159
  %168 = load i32, i32* %17, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, i32* %17, align 4
  br label %110

; <label>:170:                                    ; preds = %110
  %171 = load i32, i32* %20, align 4
  %172 = load i32, i32* %11, align 4
  %173 = sub nsw i32 %172, %171
  store i32 %173, i32* %11, align 4
  %174 = load i32, i32* %21, align 4
  %175 = load i32, i32* @mf_size, align 4
  %176 = add nsw i32 %175, %174
  store i32 %176, i32* @mf_size, align 4
  %177 = load i32, i32* @mf_size, align 4
  %178 = icmp sle i32 %177, 3056
  br i1 %178, label %179, label %180

; <label>:179:                                    ; preds = %170
  br label %183

; <label>:180:                                    ; preds = %170
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 14)
  %181 = add i64 %pgocount9, 1
  store i64 %181, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 14)
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 1040, i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %183

; <label>:183:                                    ; preds = %182, %179
  %184 = load i32, i32* %21, align 4
  %185 = load i32, i32* @mf_samples_to_encode, align 4
  %186 = add nsw i32 %185, %184
  store i32 %186, i32* @mf_samples_to_encode, align 4
  %187 = load i32, i32* @mf_size, align 4
  %188 = load i32, i32* %18, align 4
  %189 = icmp sge i32 %187, %188
  br i1 %189, label %190, label %258

; <label>:190:                                    ; preds = %183
  %191 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %192 = load i32, i32* @mf_size, align 4
  %193 = load i8*, i8** %12, align 8
  %194 = load i32, i32* %13, align 4
  %195 = call i32 @lame_encode_frame(%struct.lame_global_flags* %191, i16* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 0, i32 0), i16* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 1, i32 0), i32 %192, i8* %193, i32 %194)
  store i32 %195, i32* %15, align 4
  %196 = load i32, i32* %15, align 4
  %197 = icmp eq i32 %196, -1
  br i1 %197, label %198, label %200

; <label>:198:                                    ; preds = %190
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 11)
  %199 = add i64 %pgocount10, 1
  store i64 %199, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 11)
  store i32 -1, i32* %7, align 4
  br label %270

; <label>:200:                                    ; preds = %190
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 5)
  %201 = add i64 %pgocount11, 1
  store i64 %201, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 5)
  %202 = load i32, i32* %15, align 4
  %203 = load i8*, i8** %12, align 8
  %204 = sext i32 %202 to i64
  %205 = getelementptr inbounds i8, i8* %203, i64 %204
  store i8* %205, i8** %12, align 8
  %206 = load i32, i32* %15, align 4
  %207 = load i32, i32* %14, align 4
  %208 = add nsw i32 %207, %206
  store i32 %208, i32* %14, align 4
  %209 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %210 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %209, i32 0, i32 42
  %211 = load i32, i32* %210, align 4
  %212 = load i32, i32* @mf_size, align 4
  %213 = sub nsw i32 %212, %211
  store i32 %213, i32* @mf_size, align 4
  %214 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %215 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %214, i32 0, i32 42
  %216 = load i32, i32* %215, align 4
  %217 = load i32, i32* @mf_samples_to_encode, align 4
  %218 = sub nsw i32 %217, %216
  store i32 %218, i32* @mf_samples_to_encode, align 4
  store i32 0, i32* %17, align 4
  br label %219

; <label>:219:                                    ; preds = %253, %200
  %220 = load i32, i32* %17, align 4
  %221 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %222 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %221, i32 0, i32 46
  %223 = load i32, i32* %222, align 4
  %224 = icmp slt i32 %220, %223
  br i1 %224, label %225, label %257

; <label>:225:                                    ; preds = %219
  store i32 0, i32* %16, align 4
  br label %226

; <label>:226:                                    ; preds = %249, %225
  %227 = load i32, i32* %16, align 4
  %228 = load i32, i32* @mf_size, align 4
  %229 = icmp slt i32 %227, %228
  br i1 %229, label %230, label %252

; <label>:230:                                    ; preds = %226
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 2)
  %231 = add i64 %pgocount12, 1
  store i64 %231, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 2)
  %232 = load i32, i32* %17, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %233
  %235 = load i32, i32* %16, align 4
  %236 = load %struct.lame_global_flags*, %struct.lame_global_flags** %8, align 8
  %237 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %236, i32 0, i32 42
  %238 = load i32, i32* %237, align 4
  %239 = add nsw i32 %235, %238
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [3056 x i16], [3056 x i16]* %234, i64 0, i64 %240
  %242 = load i16, i16* %241, align 2
  %243 = load i32, i32* %17, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %244
  %246 = load i32, i32* %16, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [3056 x i16], [3056 x i16]* %245, i64 0, i64 %247
  store i16 %242, i16* %248, align 2
  br label %249

; <label>:249:                                    ; preds = %230
  %250 = load i32, i32* %16, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* %16, align 4
  br label %226

; <label>:252:                                    ; preds = %226
  br label %253

; <label>:253:                                    ; preds = %252
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 0)
  %254 = add i64 %pgocount13, 1
  store i64 %254, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 0)
  %255 = load i32, i32* %17, align 4
  %256 = add nsw i32 %255, 1
  store i32 %256, i32* %17, align 4
  br label %219

; <label>:257:                                    ; preds = %219
  br label %258

; <label>:258:                                    ; preds = %257, %183
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 4)
  %259 = add i64 %pgocount14, 1
  store i64 %259, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 4)
  br label %106

; <label>:260:                                    ; preds = %106
  %261 = load i32, i32* %11, align 4
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %263, label %264

; <label>:263:                                    ; preds = %260
  br label %267

; <label>:264:                                    ; preds = %260
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 16)
  %265 = add i64 %pgocount15, 1
  store i64 %265, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 16)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 1061, i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %267

; <label>:267:                                    ; preds = %266, %263
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 7)
  %268 = add i64 %pgocount16, 1
  store i64 %268, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_lame_encode_buffer, i64 0, i64 7)
  %269 = load i32, i32* %14, align 4
  store i32 %269, i32* %7, align 4
  br label %270

; <label>:270:                                    ; preds = %267, %198
  %271 = load i32, i32* %7, align 4
  ret i32 %271
}

; Function Attrs: nounwind uwtable
define i32 @lame_encode_buffer_interleaved(%struct.lame_global_flags*, i16*, i32, i8*, i32) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.lame_global_flags*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i16*, align 8
  %18 = alloca i16*, align 8
  %19 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %7, align 8
  store i16* %1, i16** %8, align 8
  store i32 %2, i32* %9, align 4
  store i8* %3, i8** %10, align 8
  store i32 %4, i32* %11, align 4
  store i32 0, i32* %12, align 4
  %20 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %20, i32 0, i32 42
  %22 = load i32, i32* %21, align 4
  %23 = add nsw i32 1024, %22
  %24 = sub nsw i32 %23, 272
  store i32 %24, i32* %16, align 4
  %25 = load i32, i32* %16, align 4
  %26 = icmp sge i32 3056, %25
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %5
  br label %31

; <label>:28:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 20)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 20)
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 1078, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer_interleaved, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %31

; <label>:31:                                     ; preds = %30, %27
  %32 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %32, i32 0, i32 1
  %34 = load i32, i32* %33, align 8
  %35 = icmp eq i32 %34, 1
  br i1 %35, label %36, label %44

; <label>:36:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 8)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 8)
  %38 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %39 = load i16*, i16** %8, align 8
  %40 = load i32, i32* %9, align 4
  %41 = load i8*, i8** %10, align 8
  %42 = load i32, i32* %11, align 4
  %43 = call i32 @lame_encode_buffer(%struct.lame_global_flags* %38, i16* %39, i16* null, i32 %40, i8* %41, i32 %42)
  store i32 %43, i32* %6, align 4
  br label %339

; <label>:44:                                     ; preds = %31
  %45 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %46 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %45, i32 0, i32 49
  %47 = load float, float* %46, align 8
  %48 = fcmp une float %47, 1.000000e+00
  br i1 %48, label %49, label %113

; <label>:49:                                     ; preds = %44
  %50 = load i32, i32* %9, align 4
  %51 = sext i32 %50 to i64
  %52 = mul i64 2, %51
  %53 = call noalias i8* @malloc(i64 %52) #7
  %54 = bitcast i8* %53 to i16*
  store i16* %54, i16** %17, align 8
  %55 = load i32, i32* %9, align 4
  %56 = sext i32 %55 to i64
  %57 = mul i64 2, %56
  %58 = call noalias i8* @malloc(i64 %57) #7
  %59 = bitcast i8* %58 to i16*
  store i16* %59, i16** %18, align 8
  %60 = load i16*, i16** %17, align 8
  %61 = icmp eq i16* %60, null
  br i1 %61, label %66, label %62

; <label>:62:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 9)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 9)
  %64 = load i16*, i16** %18, align 8
  %65 = icmp eq i16* %64, null
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %62, %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 10)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 10)
  store i32 -1, i32* %6, align 4
  br label %339

; <label>:68:                                     ; preds = %62
  store i32 0, i32* %14, align 4
  br label %69

; <label>:69:                                     ; preds = %95, %68
  %70 = load i32, i32* %14, align 4
  %71 = load i32, i32* %9, align 4
  %72 = icmp slt i32 %70, %71
  br i1 %72, label %73, label %99

; <label>:73:                                     ; preds = %69
  %74 = load i16*, i16** %8, align 8
  %75 = load i32, i32* %14, align 4
  %76 = mul nsw i32 2, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i16, i16* %74, i64 %77
  %79 = load i16, i16* %78, align 2
  %80 = load i16*, i16** %17, align 8
  %81 = load i32, i32* %14, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i16, i16* %80, i64 %82
  store i16 %79, i16* %83, align 2
  %84 = load i16*, i16** %8, align 8
  %85 = load i32, i32* %14, align 4
  %86 = mul nsw i32 2, %85
  %87 = add nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i16, i16* %84, i64 %88
  %90 = load i16, i16* %89, align 2
  %91 = load i16*, i16** %18, align 8
  %92 = load i32, i32* %14, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i16, i16* %91, i64 %93
  store i16 %90, i16* %94, align 2
  br label %95

; <label>:95:                                     ; preds = %73
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 3)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 3)
  %97 = load i32, i32* %14, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %14, align 4
  br label %69

; <label>:99:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 12)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 12)
  %101 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %102 = load i16*, i16** %17, align 8
  %103 = load i16*, i16** %18, align 8
  %104 = load i32, i32* %9, align 4
  %105 = load i8*, i8** %10, align 8
  %106 = load i32, i32* %11, align 4
  %107 = call i32 @lame_encode_buffer(%struct.lame_global_flags* %101, i16* %102, i16* %103, i32 %104, i8* %105, i32 %106)
  store i32 %107, i32* %13, align 4
  %108 = load i16*, i16** %17, align 8
  %109 = bitcast i16* %108 to i8*
  call void @free(i8* %109) #7
  %110 = load i16*, i16** %18, align 8
  %111 = bitcast i16* %110 to i8*
  call void @free(i8* %111) #7
  %112 = load i32, i32* %13, align 4
  store i32 %112, i32* %6, align 4
  br label %339

; <label>:113:                                    ; preds = %44
  %114 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %115 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %114, i32 0, i32 39
  %116 = load i64, i64* %115, align 8
  %117 = icmp eq i64 %116, 0
  br i1 %117, label %118, label %124

; <label>:118:                                    ; preds = %113
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 15)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 15)
  %120 = load i32, i32* @lame_encode_buffer_interleaved.frame_buffered, align 4
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %124, label %122

; <label>:122:                                    ; preds = %118
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 18)
  %123 = add i64 %pgocount7, 1
  store i64 %123, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 18)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([2 x [3056 x i16]]* @mfbuf to i8*), i8 0, i64 12224, i32 16, i1 false)
  store i32 1, i32* @lame_encode_buffer_interleaved.frame_buffered, align 4
  store i32 1088, i32* @mf_samples_to_encode, align 4
  store i32 752, i32* @mf_size, align 4
  br label %124

; <label>:124:                                    ; preds = %122, %118, %113
  %125 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %126 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %125, i32 0, i32 39
  %127 = load i64, i64* %126, align 8
  %128 = icmp eq i64 %127, 1
  br i1 %128, label %129, label %131

; <label>:129:                                    ; preds = %124
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 13)
  %130 = add i64 %pgocount8, 1
  store i64 %130, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 13)
  store i32 0, i32* @lame_encode_buffer_interleaved.frame_buffered, align 4
  br label %131

; <label>:131:                                    ; preds = %129, %124
  %132 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %133 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %132, i32 0, i32 1
  %134 = load i32, i32* %133, align 8
  %135 = icmp eq i32 %134, 2
  br i1 %135, label %136, label %183

; <label>:136:                                    ; preds = %131
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 14)
  %137 = add i64 %pgocount9, 1
  store i64 %137, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 14)
  %138 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %139 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %138, i32 0, i32 46
  %140 = load i32, i32* %139, align 4
  %141 = icmp eq i32 %140, 1
  br i1 %141, label %142, label %183

; <label>:142:                                    ; preds = %136
  store i32 0, i32* %14, align 4
  br label %143

; <label>:143:                                    ; preds = %177, %142
  %144 = load i32, i32* %14, align 4
  %145 = load i32, i32* %9, align 4
  %146 = icmp slt i32 %144, %145
  br i1 %146, label %147, label %181

; <label>:147:                                    ; preds = %143
  %148 = load i16*, i16** %8, align 8
  %149 = load i32, i32* %14, align 4
  %150 = mul nsw i32 2, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i16, i16* %148, i64 %151
  %153 = load i16, i16* %152, align 2
  %154 = sext i16 %153 to i32
  %155 = load i16*, i16** %8, align 8
  %156 = load i32, i32* %14, align 4
  %157 = mul nsw i32 2, %156
  %158 = add nsw i32 %157, 1
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i16, i16* %155, i64 %159
  %161 = load i16, i16* %160, align 2
  %162 = sext i16 %161 to i32
  %163 = add nsw i32 %154, %162
  %164 = sdiv i32 %163, 2
  %165 = trunc i32 %164 to i16
  %166 = load i16*, i16** %8, align 8
  %167 = load i32, i32* %14, align 4
  %168 = mul nsw i32 2, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i16, i16* %166, i64 %169
  store i16 %165, i16* %170, align 2
  %171 = load i16*, i16** %8, align 8
  %172 = load i32, i32* %14, align 4
  %173 = mul nsw i32 2, %172
  %174 = add nsw i32 %173, 1
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i16, i16* %171, i64 %175
  store i16 0, i16* %176, align 2
  br label %177

; <label>:177:                                    ; preds = %147
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 7)
  %178 = add i64 %pgocount10, 1
  store i64 %178, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 7)
  %179 = load i32, i32* %14, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, i32* %14, align 4
  br label %143

; <label>:181:                                    ; preds = %143
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 17)
  %182 = add i64 %pgocount11, 1
  store i64 %182, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 17)
  br label %183

; <label>:183:                                    ; preds = %181, %136, %131
  br label %184

; <label>:184:                                    ; preds = %328, %183
  %185 = load i32, i32* %9, align 4
  %186 = icmp sgt i32 %185, 0
  br i1 %186, label %187, label %329

; <label>:187:                                    ; preds = %184
  %188 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %189 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %188, i32 0, i32 42
  %190 = load i32, i32* %189, align 4
  %191 = load i32, i32* %9, align 4
  %192 = icmp slt i32 %190, %191
  br i1 %192, label %193, label %198

; <label>:193:                                    ; preds = %187
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 4)
  %194 = add i64 %pgocount12, 1
  store i64 %194, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 4)
  %195 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %196 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %195, i32 0, i32 42
  %197 = load i32, i32* %196, align 4
  br label %201

; <label>:198:                                    ; preds = %187
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 5)
  %199 = add i64 %pgocount13, 1
  store i64 %199, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 5)
  %200 = load i32, i32* %9, align 4
  br label %201

; <label>:201:                                    ; preds = %198, %193
  %202 = phi i32 [ %197, %193 ], [ %200, %198 ]
  store i32 %202, i32* %19, align 4
  store i32 0, i32* %14, align 4
  br label %203

; <label>:203:                                    ; preds = %231, %201
  %204 = load i32, i32* %14, align 4
  %205 = load i32, i32* %19, align 4
  %206 = icmp slt i32 %204, %205
  br i1 %206, label %207, label %235

; <label>:207:                                    ; preds = %203
  %208 = load i16*, i16** %8, align 8
  %209 = load i32, i32* %14, align 4
  %210 = mul nsw i32 2, %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i16, i16* %208, i64 %211
  %213 = load i16, i16* %212, align 2
  %214 = load i32, i32* @mf_size, align 4
  %215 = load i32, i32* %14, align 4
  %216 = add nsw i32 %214, %215
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [3056 x i16], [3056 x i16]* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 0), i64 0, i64 %217
  store i16 %213, i16* %218, align 2
  %219 = load i16*, i16** %8, align 8
  %220 = load i32, i32* %14, align 4
  %221 = mul nsw i32 2, %220
  %222 = add nsw i32 %221, 1
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i16, i16* %219, i64 %223
  %225 = load i16, i16* %224, align 2
  %226 = load i32, i32* @mf_size, align 4
  %227 = load i32, i32* %14, align 4
  %228 = add nsw i32 %226, %227
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [3056 x i16], [3056 x i16]* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 1), i64 0, i64 %229
  store i16 %225, i16* %230, align 2
  br label %231

; <label>:231:                                    ; preds = %207
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 1)
  %232 = add i64 %pgocount14, 1
  store i64 %232, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 1)
  %233 = load i32, i32* %14, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %14, align 4
  br label %203

; <label>:235:                                    ; preds = %203
  %236 = load i32, i32* %19, align 4
  %237 = mul nsw i32 2, %236
  %238 = load i16*, i16** %8, align 8
  %239 = sext i32 %237 to i64
  %240 = getelementptr inbounds i16, i16* %238, i64 %239
  store i16* %240, i16** %8, align 8
  %241 = load i32, i32* %19, align 4
  %242 = load i32, i32* %9, align 4
  %243 = sub nsw i32 %242, %241
  store i32 %243, i32* %9, align 4
  %244 = load i32, i32* %19, align 4
  %245 = load i32, i32* @mf_size, align 4
  %246 = add nsw i32 %245, %244
  store i32 %246, i32* @mf_size, align 4
  %247 = load i32, i32* @mf_size, align 4
  %248 = icmp sle i32 %247, 3056
  br i1 %248, label %249, label %250

; <label>:249:                                    ; preds = %235
  br label %253

; <label>:250:                                    ; preds = %235
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 19)
  %251 = add i64 %pgocount15, 1
  store i64 %251, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 19)
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 1135, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer_interleaved, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %253

; <label>:253:                                    ; preds = %252, %249
  %254 = load i32, i32* %19, align 4
  %255 = load i32, i32* @mf_samples_to_encode, align 4
  %256 = add nsw i32 %255, %254
  store i32 %256, i32* @mf_samples_to_encode, align 4
  %257 = load i32, i32* @mf_size, align 4
  %258 = load i32, i32* %16, align 4
  %259 = icmp sge i32 %257, %258
  br i1 %259, label %260, label %328

; <label>:260:                                    ; preds = %253
  %261 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %262 = load i32, i32* @mf_size, align 4
  %263 = load i8*, i8** %10, align 8
  %264 = load i32, i32* %11, align 4
  %265 = call i32 @lame_encode_frame(%struct.lame_global_flags* %261, i16* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 0, i32 0), i16* getelementptr inbounds ([2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 1, i32 0), i32 %262, i8* %263, i32 %264)
  store i32 %265, i32* %13, align 4
  %266 = load i32, i32* %13, align 4
  %267 = icmp eq i32 %266, -1
  br i1 %267, label %268, label %270

; <label>:268:                                    ; preds = %260
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 16)
  %269 = add i64 %pgocount16, 1
  store i64 %269, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 16)
  store i32 -1, i32* %6, align 4
  br label %339

; <label>:270:                                    ; preds = %260
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 6)
  %271 = add i64 %pgocount17, 1
  store i64 %271, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 6)
  %272 = load i32, i32* %13, align 4
  %273 = load i8*, i8** %10, align 8
  %274 = sext i32 %272 to i64
  %275 = getelementptr inbounds i8, i8* %273, i64 %274
  store i8* %275, i8** %10, align 8
  %276 = load i32, i32* %13, align 4
  %277 = load i32, i32* %12, align 4
  %278 = add nsw i32 %277, %276
  store i32 %278, i32* %12, align 4
  %279 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %280 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %279, i32 0, i32 42
  %281 = load i32, i32* %280, align 4
  %282 = load i32, i32* @mf_size, align 4
  %283 = sub nsw i32 %282, %281
  store i32 %283, i32* @mf_size, align 4
  %284 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %285 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %284, i32 0, i32 42
  %286 = load i32, i32* %285, align 4
  %287 = load i32, i32* @mf_samples_to_encode, align 4
  %288 = sub nsw i32 %287, %286
  store i32 %288, i32* @mf_samples_to_encode, align 4
  store i32 0, i32* %15, align 4
  br label %289

; <label>:289:                                    ; preds = %323, %270
  %290 = load i32, i32* %15, align 4
  %291 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %292 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %291, i32 0, i32 46
  %293 = load i32, i32* %292, align 4
  %294 = icmp slt i32 %290, %293
  br i1 %294, label %295, label %327

; <label>:295:                                    ; preds = %289
  store i32 0, i32* %14, align 4
  br label %296

; <label>:296:                                    ; preds = %319, %295
  %297 = load i32, i32* %14, align 4
  %298 = load i32, i32* @mf_size, align 4
  %299 = icmp slt i32 %297, %298
  br i1 %299, label %300, label %322

; <label>:300:                                    ; preds = %296
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 2)
  %301 = add i64 %pgocount18, 1
  store i64 %301, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 2)
  %302 = load i32, i32* %15, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %303
  %305 = load i32, i32* %14, align 4
  %306 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %307 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %306, i32 0, i32 42
  %308 = load i32, i32* %307, align 4
  %309 = add nsw i32 %305, %308
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [3056 x i16], [3056 x i16]* %304, i64 0, i64 %310
  %312 = load i16, i16* %311, align 2
  %313 = load i32, i32* %15, align 4
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [2 x [3056 x i16]], [2 x [3056 x i16]]* @mfbuf, i64 0, i64 %314
  %316 = load i32, i32* %14, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [3056 x i16], [3056 x i16]* %315, i64 0, i64 %317
  store i16 %312, i16* %318, align 2
  br label %319

; <label>:319:                                    ; preds = %300
  %320 = load i32, i32* %14, align 4
  %321 = add nsw i32 %320, 1
  store i32 %321, i32* %14, align 4
  br label %296

; <label>:322:                                    ; preds = %296
  br label %323

; <label>:323:                                    ; preds = %322
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 0)
  %324 = add i64 %pgocount19, 1
  store i64 %324, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 0)
  %325 = load i32, i32* %15, align 4
  %326 = add nsw i32 %325, 1
  store i32 %326, i32* %15, align 4
  br label %289

; <label>:327:                                    ; preds = %289
  br label %328

; <label>:328:                                    ; preds = %327, %253
  br label %184

; <label>:329:                                    ; preds = %184
  %330 = load i32, i32* %9, align 4
  %331 = icmp eq i32 %330, 0
  br i1 %331, label %332, label %333

; <label>:332:                                    ; preds = %329
  br label %336

; <label>:333:                                    ; preds = %329
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 21)
  %334 = add i64 %pgocount20, 1
  store i64 %334, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 21)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 1156, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__PRETTY_FUNCTION__.lame_encode_buffer_interleaved, i32 0, i32 0)) #9
  unreachable
                                                  ; No predecessors!
  br label %336

; <label>:336:                                    ; preds = %335, %332
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 11)
  %337 = add i64 %pgocount21, 1
  store i64 %337, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_lame_encode_buffer_interleaved, i64 0, i64 11)
  %338 = load i32, i32* %12, align 4
  store i32 %338, i32* %6, align 4
  br label %339

; <label>:339:                                    ; preds = %336, %268, %99, %66, %36
  %340 = load i32, i32* %6, align 4
  ret i32 %340
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: nounwind uwtable
define i32 @lame_encode(%struct.lame_global_flags*, [1152 x i16]*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_encode, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_encode, i64 0, i64 0)
  %6 = alloca %struct.lame_global_flags*, align 8
  %7 = alloca [1152 x i16]*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %6, align 8
  store [1152 x i16]* %1, [1152 x i16]** %7, align 8
  store i8* %2, i8** %8, align 8
  store i32 %3, i32* %9, align 4
  %12 = load i32, i32* @mf_samples_to_encode, align 4
  store i32 %12, i32* %11, align 4
  %13 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %14 = load [1152 x i16]*, [1152 x i16]** %7, align 8
  %15 = getelementptr inbounds [1152 x i16], [1152 x i16]* %14, i64 0
  %16 = getelementptr inbounds [1152 x i16], [1152 x i16]* %15, i32 0, i32 0
  %17 = load [1152 x i16]*, [1152 x i16]** %7, align 8
  %18 = getelementptr inbounds [1152 x i16], [1152 x i16]* %17, i64 1
  %19 = getelementptr inbounds [1152 x i16], [1152 x i16]* %18, i32 0, i32 0
  %20 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %20, i32 0, i32 45
  %22 = load i32, i32* %21, align 8
  %23 = mul nsw i32 576, %22
  %24 = load i8*, i8** %8, align 8
  %25 = load i32, i32* %9, align 4
  %26 = call i32 @lame_encode_buffer(%struct.lame_global_flags* %13, i16* %16, i16* %19, i32 %23, i8* %24, i32 %25)
  store i32 %26, i32* %10, align 4
  %27 = load i32, i32* %11, align 4
  store i32 %27, i32* @mf_samples_to_encode, align 4
  %28 = load i32, i32* %10, align 4
  ret i32 %28
}

; Function Attrs: nounwind uwtable
define void @lame_init(%struct.lame_global_flags*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_init, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_init, i64 0, i64 0)
  %3 = alloca %struct.lame_global_flags*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %3, align 8
  %4 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %4, i32 0, i32 36
  store i32 0, i32* %5, align 4
  %6 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %7 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %6, i32 0, i32 33
  store i32 0, i32* %7, align 8
  %8 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %9 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %8, i32 0, i32 34
  store i32 0, i32* %9, align 4
  %10 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %11 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %10, i32 0, i32 5
  store i32 1, i32* %11, align 8
  %12 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %13 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %12, i32 0, i32 35
  store float 0.000000e+00, float* %13, align 8
  %14 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %15 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %14, i32 0, i32 17
  store i32 0, i32* %15, align 8
  %16 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %16, i32 0, i32 18
  store i32 0, i32* %17, align 4
  %18 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %18, i32 0, i32 19
  store i32 0, i32* %19, align 8
  %20 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %20, i32 0, i32 20
  store i32 0, i32* %21, align 4
  %22 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %23 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %22, i32 0, i32 39
  store i64 0, i64* %23, align 8
  %24 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %25 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %24, i32 0, i32 4
  store i32 0, i32* %25, align 4
  %26 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %27 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %26, i32 0, i32 6
  store i32 5, i32* %27, align 4
  %28 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %29 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %28, i32 0, i32 29
  store i32 0, i32* %29, align 8
  %30 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %31 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %30, i32 0, i32 59
  store i32 0, i32* %31, align 8
  %32 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %33 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %32, i32 0, i32 25
  store i32 0, i32* %33, align 8
  %34 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %35 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %34, i32 0, i32 26
  store i32 0, i32* %35, align 4
  %36 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %36, i32 0, i32 27
  store i32 -1, i32* %37, align 8
  %38 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %38, i32 0, i32 28
  store i32 -1, i32* %39, align 4
  %40 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %41 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %40, i32 0, i32 53
  store float 0.000000e+00, float* %41, align 8
  %42 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %43 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %42, i32 0, i32 54
  store float 0.000000e+00, float* %43, align 4
  %44 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %45 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %44, i32 0, i32 55
  store float 0.000000e+00, float* %45, align 8
  %46 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %47 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %46, i32 0, i32 56
  store float 0.000000e+00, float* %47, align 4
  %48 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %49 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %48, i32 0, i32 57
  store i32 32, i32* %49, align 8
  %50 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %51 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %50, i32 0, i32 58
  store i32 -1, i32* %51, align 4
  %52 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %53 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %52, i32 0, i32 37
  store i32 0, i32* %53, align 8
  %54 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %55 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %54, i32 0, i32 49
  store float 1.000000e+00, float* %55, align 8
  %56 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %57 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %56, i32 0, i32 15
  store i32 2, i32* %57, align 8
  %58 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %59 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %58, i32 0, i32 44
  store i32 0, i32* %59, align 4
  %60 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %61 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %60, i32 0, i32 30
  store i32 0, i32* %61, align 4
  %62 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %63 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %62, i32 0, i32 7
  store i32 0, i32* %63, align 8
  %64 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %65 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %64, i32 0, i32 40
  store i64 0, i64* %65, align 8
  %66 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %67 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %66, i32 0, i32 21
  store i32 0, i32* %67, align 8
  %68 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %69 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %68, i32 0, i32 22
  store i32 4, i32* %69, align 4
  %70 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %71 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %70, i32 0, i32 23
  store i32 0, i32* %71, align 8
  %72 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %73 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %72, i32 0, i32 24
  store i32 0, i32* %73, align 4
  %74 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %75 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %74, i32 0, i32 47
  store i32 1, i32* %75, align 8
  %76 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %77 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %76, i32 0, i32 48
  store i32 13, i32* %77, align 4
  %78 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %79 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %78, i32 0, i32 43
  store i32 1, i32* %79, align 8
  %80 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %81 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %80, i32 0, i32 8
  store i32 1, i32* %81, align 4
  %82 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %83 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %82, i32 0, i32 9
  store i32 0, i32* %83, align 8
  %84 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %85 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %84, i32 0, i32 10
  store i32 0, i32* %85, align 4
  %86 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %87 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %86, i32 0, i32 11
  store i32 0, i32* %87, align 8
  %88 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %89 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %88, i32 0, i32 12
  store i32 0, i32* %89, align 4
  %90 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %91 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %90, i32 0, i32 13
  store i32 1, i32* %91, align 8
  %92 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %93 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %92, i32 0, i32 16
  store i32 0, i32* %93, align 4
  %94 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %95 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %94, i32 0, i32 14
  store i32 0, i32* %95, align 4
  %96 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %97 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %96, i32 0, i32 38
  store i32 0, i32* %97, align 4
  %98 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %99 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %98, i32 0, i32 2
  store i32 44100, i32* %99, align 4
  %100 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %101 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %100, i32 0, i32 3
  store i32 0, i32* %101, align 8
  %102 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %103 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %102, i32 0, i32 1
  store i32 2, i32* %103, align 8
  %104 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %105 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %104, i32 0, i32 0
  store i64 4294967295, i64* %105, align 8
  %106 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %107 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %106, i32 0, i32 31
  store i8* null, i8** %107, align 8
  %108 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %109 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %108, i32 0, i32 32
  store i8* null, i8** %109, align 8
  store i32 0, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @lame_encode_finish(%struct.lame_global_flags*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.lame_global_flags*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [2 x [1152 x i16]], align 16
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %12 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %11, i32 0, i32 0
  %13 = bitcast [1152 x i16]* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 4608, i32 16, i1 false)
  store i32 0, i32* %9, align 4
  br label %14

; <label>:14:                                     ; preds = %35, %3
  %15 = load i32, i32* @mf_samples_to_encode, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %49

; <label>:17:                                     ; preds = %14
  %18 = load i32, i32* %7, align 4
  %19 = load i32, i32* %9, align 4
  %20 = sub nsw i32 %18, %19
  store i32 %20, i32* %10, align 4
  %21 = load i32, i32* %7, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 1)
  store i32 0, i32* %10, align 4
  br label %25

; <label>:25:                                     ; preds = %23, %17
  %26 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %27 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %11, i32 0, i32 0
  %28 = load i8*, i8** %6, align 8
  %29 = load i32, i32* %10, align 4
  %30 = call i32 @lame_encode(%struct.lame_global_flags* %26, [1152 x i16]* %27, i8* %28, i32 %29)
  store i32 %30, i32* %8, align 4
  %31 = load i32, i32* %8, align 4
  %32 = icmp eq i32 %31, -1
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 2)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 2)
  call void @desalloc_buffer(%struct.bit_stream_struc* @bs)
  store i32 -1, i32* %4, align 4
  br label %104

; <label>:35:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 0)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 0)
  %37 = load i32, i32* %8, align 4
  %38 = load i8*, i8** %6, align 8
  %39 = sext i32 %37 to i64
  %40 = getelementptr inbounds i8, i8* %38, i64 %39
  store i8* %40, i8** %6, align 8
  %41 = load i32, i32* %8, align 4
  %42 = load i32, i32* %9, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %9, align 4
  %44 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %45 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %44, i32 0, i32 42
  %46 = load i32, i32* %45, align 4
  %47 = load i32, i32* @mf_samples_to_encode, align 4
  %48 = sub nsw i32 %47, %46
  store i32 %48, i32* @mf_samples_to_encode, align 4
  br label %14

; <label>:49:                                     ; preds = %14
  %50 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %51 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %50, i32 0, i32 39
  %52 = load i64, i64* %51, align 8
  %53 = add nsw i64 %52, -1
  store i64 %53, i64* %51, align 8
  %54 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %55 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %54, i32 0, i32 4
  %56 = load i32, i32* %55, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %82, label %58

; <label>:58:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 4)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 4)
  %60 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %61 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %60, i32 0, i32 7
  %62 = load i32, i32* %61, align 8
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %82, label %64

; <label>:64:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 7)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 7)
  %66 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %67 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %66, i32 0, i32 3
  %68 = load i32, i32* %67, align 8
  %69 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %70 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %69, i32 0, i32 39
  %71 = load i64, i64* %70, align 8
  %72 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %73 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %72, i32 0, i32 40
  %74 = load i64, i64* %73, align 8
  %75 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %76 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %75, i32 0, i32 42
  %77 = load i32, i32* %76, align 4
  call void @timestatus(i32 %68, i64 %71, i64 %74, i32 %77)
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i32 0, i32 0))
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %81 = call i32 @fflush(%struct._IO_FILE* %80)
  br label %82

; <label>:82:                                     ; preds = %64, %58, %49
  call void @III_FlushBitstream()
  %83 = load i32, i32* %7, align 4
  %84 = load i32, i32* %9, align 4
  %85 = sub nsw i32 %83, %84
  store i32 %85, i32* %10, align 4
  %86 = load i32, i32* %7, align 4
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %90

; <label>:88:                                     ; preds = %82
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 5)
  %89 = add i64 %pgocount5, 1
  store i64 %89, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 5)
  store i32 0, i32* %10, align 4
  br label %90

; <label>:90:                                     ; preds = %88, %82
  %91 = load i8*, i8** %6, align 8
  %92 = load i32, i32* %10, align 4
  %93 = call i32 @copy_buffer(i8* %91, i32 %92, %struct.bit_stream_struc* @bs)
  store i32 %93, i32* %8, align 4
  %94 = load i32, i32* %8, align 4
  %95 = icmp eq i32 %94, -1
  br i1 %95, label %96, label %98

; <label>:96:                                     ; preds = %90
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 6)
  %97 = add i64 %pgocount6, 1
  store i64 %97, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 6)
  call void @desalloc_buffer(%struct.bit_stream_struc* @bs)
  store i32 -1, i32* %4, align 4
  br label %104

; <label>:98:                                     ; preds = %90
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 3)
  %99 = add i64 %pgocount7, 1
  store i64 %99, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_lame_encode_finish, i64 0, i64 3)
  %100 = load i32, i32* %8, align 4
  %101 = load i32, i32* %9, align 4
  %102 = add nsw i32 %101, %100
  store i32 %102, i32* %9, align 4
  call void @desalloc_buffer(%struct.bit_stream_struc* @bs)
  %103 = load i32, i32* %9, align 4
  store i32 %103, i32* %4, align 4
  br label %104

; <label>:104:                                    ; preds = %98, %96, %33
  %105 = load i32, i32* %4, align 4
  ret i32 %105
}

declare void @desalloc_buffer(%struct.bit_stream_struc*) #2

declare void @III_FlushBitstream() #2

; Function Attrs: nounwind uwtable
define void @lame_mp3_tags(%struct.lame_global_flags*) #0 {
  %2 = alloca %struct.lame_global_flags*, align 8
  %3 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %2, align 8
  %4 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %4, i32 0, i32 5
  %6 = load i32, i32* %5, align 8
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %24

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_mp3_tags, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_mp3_tags, i64 0, i64 1)
  %10 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %11 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %10, i32 0, i32 22
  %12 = load i32, i32* %11, align 4
  %13 = mul nsw i32 %12, 100
  %14 = sdiv i32 %13, 9
  store i32 %14, i32* %3, align 4
  %15 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %16 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %15, i32 0, i32 32
  %17 = load i8*, i8** %16, align 8
  %18 = load i32, i32* %3, align 4
  %19 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %19, i32 0, i32 43
  %21 = load i32, i32* %20, align 8
  %22 = sub nsw i32 1, %21
  %23 = call i32 @PutVbrTag(i8* %17, i32 %18, i32 %22)
  br label %24

; <label>:24:                                     ; preds = %8, %1
  %25 = load i32, i32* getelementptr inbounds (%struct.ID3TAGDATA, %struct.ID3TAGDATA* @id3tag, i32 0, i32 0), align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %33

; <label>:27:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_mp3_tags, i64 0, i64 2)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_mp3_tags, i64 0, i64 2)
  call void @id3_buildtag(%struct.ID3TAGDATA* @id3tag)
  %29 = load %struct.lame_global_flags*, %struct.lame_global_flags** %2, align 8
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %29, i32 0, i32 32
  %31 = load i8*, i8** %30, align 8
  %32 = call i32 @id3_writetag(i8* %31, %struct.ID3TAGDATA* @id3tag)
  br label %33

; <label>:33:                                     ; preds = %27, %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_mp3_tags, i64 0, i64 0)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_lame_mp3_tags, i64 0, i64 0)
  ret void
}

declare i32 @PutVbrTag(i8*, i32, i32) #2

declare void @id3_buildtag(%struct.ID3TAGDATA*) #2

declare i32 @id3_writetag(i8*, %struct.ID3TAGDATA*) #2

; Function Attrs: nounwind uwtable
define void @lame_version(%struct.lame_global_flags*, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_version, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_version, i64 0, i64 0)
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca i8*, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store i8* %1, i8** %5, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = call i8* @get_lame_version()
  %8 = call i8* @strncpy(i8* %6, i8* %7, i64 20) #7
  ret void
}

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #4

declare i8* @get_lame_version() #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #7

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
