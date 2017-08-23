; ModuleID = 'tif_lzw.2.ll'
source_filename = "tif_lzw.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.LZWBaseState = type { %struct.TIFFPredictorState, i16, i16, i16, i64, i64 }
%struct.TIFFPredictorState = type { i32, i32, i32, void (%struct.tiff*, i8*, i32)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*)* }
%struct.LZWDecodeState = type { %struct.LZWBaseState, i64, i64, i64, i32 (%struct.tiff*, i8*, i32, i16)*, %struct.code_ent*, %struct.code_ent*, %struct.code_ent*, %struct.code_ent*, %struct.code_ent* }
%struct.code_ent = type { %struct.code_ent*, i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [26 x i8] c"scheme == COMPRESSION_LZW\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"tif_lzw.c\00", align 1
@__PRETTY_FUNCTION__.TIFFInitLZW = private unnamed_addr constant [29 x i8] c"int TIFFInitLZW(TIFF *, int)\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"TIFFInitLZW\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"No space for LZW state block\00", align 1
@LZWSetupDecode.module = internal constant [16 x i8] c" LZWSetupDecode\00", align 16
@.str.4 = private unnamed_addr constant [11 x i8] c"sp != NULL\00", align 1
@__PRETTY_FUNCTION__.LZWSetupDecode = private unnamed_addr constant [27 x i8] c"int LZWSetupDecode(TIFF *)\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"No space for LZW code table\00", align 1
@__PRETTY_FUNCTION__.LZWPreDecode = private unnamed_addr constant [36 x i8] c"int LZWPreDecode(TIFF *, tsample_t)\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"Old-style LZW codes, convert file\00", align 1
@__PRETTY_FUNCTION__.LZWDecodeCompat = private unnamed_addr constant [58 x i8] c"int LZWDecodeCompat(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.7 = private unnamed_addr constant [49 x i8] c"LZWDecode: Strip %d not terminated with EOI code\00", align 1
@.str.8 = private unnamed_addr constant [72 x i8] c"&sp->dec_codetab[0] <= free_entp && free_entp < &sp->dec_codetab[CSIZE]\00", align 1
@.str.9 = private unnamed_addr constant [65 x i8] c"LZWDecodeCompat: Not enough data at scanline %d (short %d bytes)\00", align 1
@__PRETTY_FUNCTION__.LZWDecode = private unnamed_addr constant [52 x i8] c"int LZWDecode(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.10 = private unnamed_addr constant [59 x i8] c"LZWDecode: Not enough data at scanline %d (short %d bytes)\00", align 1
@.str.11 = private unnamed_addr constant [63 x i8] c"LZWDecode: Bogus encoding, loop in the code table; scanline %d\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFInitLZW = private constant [11 x i8] c"TIFFInitLZW"
@__profn_tmp1.ll_LZWSetupDecode = private constant [22 x i8] c"tmp1.ll:LZWSetupDecode"
@__profn_tmp1.ll_LZWPreDecode = private constant [20 x i8] c"tmp1.ll:LZWPreDecode"
@__profn_tmp1.ll_LZWDecode = private constant [17 x i8] c"tmp1.ll:LZWDecode"
@__profn_tmp1.ll__LZWtrue = private constant [16 x i8] c"tmp1.ll:_LZWtrue"
@__profn_tmp1.ll_LZWCleanup = private constant [18 x i8] c"tmp1.ll:LZWCleanup"
@__profn_tmp1.ll_LZWDecodeCompat = private constant [23 x i8] c"tmp1.ll:LZWDecodeCompat"
@__profn_tmp1.ll_codeLoop = private constant [16 x i8] c"tmp1.ll:codeLoop"
@__profc_TIFFInitLZW = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitLZW = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4389549297381389454, i64 64754104832, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitLZW to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LZWSetupDecode = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LZWSetupDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8622528008610032130, i64 85500298211, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @LZWSetupDecode to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LZWPreDecode = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_LZWPreDecode = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_LZWPreDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2099741938183665499, i64 281545987412878, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i16)* @LZWPreDecode to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_LZWPreDecode to i8*), i32 5, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LZWDecode = private global [36 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LZWDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9044384933919720565, i64 525237889794, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode to i8*), i8* null, i32 36, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__LZWtrue = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__LZWtrue = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5169177909259185412, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__LZWtrue, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @_LZWtrue to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LZWCleanup = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LZWCleanup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7301863110973973430, i64 47582660695, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @LZWCleanup to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_LZWDecodeCompat = private global [26 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_LZWDecodeCompat = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4058264639006264801, i64 397054774983, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat to i8*), i8* null, i32 26, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_codeLoop = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_codeLoop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8196490440572321144, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_codeLoop, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [83 x i8] c"\96\01Px\DA\0B\F1ts\F3\CC\CB,\F1\89\0Ag,\C9-0\D4\CB\C9\B1\02\B2\83SKJ\0B\5CR\93\F3SR\91\85\03\8AR1\05\D1D\E2\81B%E\A5(J\9CsR\13\F3J\0B0u9\E7\E7\16$\96\C0\C5AB>\F9\F9\05\00\13\F23\C6", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitLZW to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWSetupDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWPreDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__LZWtrue to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWCleanup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWDecodeCompat to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_codeLoop to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([83 x i8], [83 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFInitLZW(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 5
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %2
  br label %12

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i64 0, i64 3)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 663, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.TIFFInitLZW, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %12

; <label>:12:                                     ; preds = %11, %8
  %13 = call i8* @_TIFFmalloc(i32 184)
  %14 = load %struct.tiff*, %struct.tiff** %4, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 37
  store i8* %13, i8** %15, align 8
  %16 = load %struct.tiff*, %struct.tiff** %4, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 37
  %18 = load i8*, i8** %17, align 8
  %19 = icmp eq i8* %18, null
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %12
  br label %68

; <label>:21:                                     ; preds = %12
  %22 = load %struct.tiff*, %struct.tiff** %4, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 2
  %24 = load i32, i32* %23, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %40

; <label>:26:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i64 0, i64 2)
  %28 = load %struct.tiff*, %struct.tiff** %4, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 37
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to %struct.LZWBaseState*
  %32 = bitcast %struct.LZWBaseState* %31 to %struct.LZWDecodeState*
  %33 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %32, i32 0, i32 9
  store %struct.code_ent* null, %struct.code_ent** %33, align 8
  %34 = load %struct.tiff*, %struct.tiff** %4, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %34, i32 0, i32 37
  %36 = load i8*, i8** %35, align 8
  %37 = bitcast i8* %36 to %struct.LZWBaseState*
  %38 = bitcast %struct.LZWBaseState* %37 to %struct.LZWDecodeState*
  %39 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %38, i32 0, i32 4
  store i32 (%struct.tiff*, i8*, i32, i16)* null, i32 (%struct.tiff*, i8*, i32, i16)** %39, align 8
  br label %40

; <label>:40:                                     ; preds = %26, %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i64 0, i64 0)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i64 0, i64 0)
  %42 = load %struct.tiff*, %struct.tiff** %4, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %42, i32 0, i32 21
  store i32 (%struct.tiff*)* @LZWSetupDecode, i32 (%struct.tiff*)** %43, align 8
  %44 = load %struct.tiff*, %struct.tiff** %4, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 22
  store i32 (%struct.tiff*, i16)* @LZWPreDecode, i32 (%struct.tiff*, i16)** %45, align 8
  %46 = load %struct.tiff*, %struct.tiff** %4, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode, i32 (%struct.tiff*, i8*, i32, i16)** %47, align 8
  %48 = load %struct.tiff*, %struct.tiff** %4, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode, i32 (%struct.tiff*, i8*, i32, i16)** %49, align 8
  %50 = load %struct.tiff*, %struct.tiff** %4, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode, i32 (%struct.tiff*, i8*, i32, i16)** %51, align 8
  %52 = load %struct.tiff*, %struct.tiff** %4, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 23
  store i32 (%struct.tiff*)* @_LZWtrue, i32 (%struct.tiff*)** %53, align 8
  %54 = load %struct.tiff*, %struct.tiff** %4, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %54, i32 0, i32 24
  store i32 (%struct.tiff*, i16)* @_TIFFNoPreCode, i32 (%struct.tiff*, i16)** %55, align 8
  %56 = load %struct.tiff*, %struct.tiff** %4, align 8
  %57 = getelementptr inbounds %struct.tiff, %struct.tiff* %56, i32 0, i32 25
  store i32 (%struct.tiff*)* @_LZWtrue, i32 (%struct.tiff*)** %57, align 8
  %58 = load %struct.tiff*, %struct.tiff** %4, align 8
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %58, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoRowEncode, i32 (%struct.tiff*, i8*, i32, i16)** %59, align 8
  %60 = load %struct.tiff*, %struct.tiff** %4, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoStripEncode, i32 (%struct.tiff*, i8*, i32, i16)** %61, align 8
  %62 = load %struct.tiff*, %struct.tiff** %4, align 8
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %62, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoTileEncode, i32 (%struct.tiff*, i8*, i32, i16)** %63, align 8
  %64 = load %struct.tiff*, %struct.tiff** %4, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %64, i32 0, i32 34
  store void (%struct.tiff*)* @LZWCleanup, void (%struct.tiff*)** %65, align 8
  %66 = load %struct.tiff*, %struct.tiff** %4, align 8
  %67 = call i32 @TIFFPredictorInit(%struct.tiff* %66)
  store i32 1, i32* %3, align 4
  br label %70

; <label>:68:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i64 0, i64 1)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFInitLZW, i64 0, i64 1)
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %70

; <label>:70:                                     ; preds = %68, %40
  %71 = load i32, i32* %3, align 4
  ret i32 %71
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

declare i8* @_TIFFmalloc(i32) #2

; Function Attrs: nounwind uwtable
define internal i32 @LZWSetupDecode(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.LZWDecodeState*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 37
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.LZWBaseState*
  %10 = bitcast %struct.LZWBaseState* %9 to %struct.LZWDecodeState*
  store %struct.LZWDecodeState* %10, %struct.LZWDecodeState** %4, align 8
  %11 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %12 = icmp ne %struct.LZWDecodeState* %11, null
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %1
  br label %17

; <label>:14:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 4)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 196, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__PRETTY_FUNCTION__.LZWSetupDecode, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17:                                     ; preds = %16, %13
  %18 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %19 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %18, i32 0, i32 9
  %20 = load %struct.code_ent*, %struct.code_ent** %19, align 8
  %21 = icmp eq %struct.code_ent* %20, null
  br i1 %21, label %22, label %76

; <label>:22:                                     ; preds = %17
  %23 = call i8* @_TIFFmalloc(i32 81904)
  %24 = bitcast i8* %23 to %struct.code_ent*
  %25 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %26 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %25, i32 0, i32 9
  store %struct.code_ent* %24, %struct.code_ent** %26, align 8
  %27 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %28 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %27, i32 0, i32 9
  %29 = load %struct.code_ent*, %struct.code_ent** %28, align 8
  %30 = icmp eq %struct.code_ent* %29, null
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 3)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 3)
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @LZWSetupDecode.module, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i32 0, i32 0))
  store i32 0, i32* %2, align 4
  br label %78

; <label>:33:                                     ; preds = %22
  store i32 255, i32* %5, align 4
  br label %34

; <label>:34:                                     ; preds = %70, %33
  %35 = load i32, i32* %5, align 4
  %36 = icmp sge i32 %35, 0
  br i1 %36, label %37, label %74

; <label>:37:                                     ; preds = %34
  %38 = load i32, i32* %5, align 4
  %39 = trunc i32 %38 to i8
  %40 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %41 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %40, i32 0, i32 9
  %42 = load %struct.code_ent*, %struct.code_ent** %41, align 8
  %43 = load i32, i32* %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %42, i64 %44
  %46 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %45, i32 0, i32 2
  store i8 %39, i8* %46, align 2
  %47 = load i32, i32* %5, align 4
  %48 = trunc i32 %47 to i8
  %49 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %50 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %49, i32 0, i32 9
  %51 = load %struct.code_ent*, %struct.code_ent** %50, align 8
  %52 = load i32, i32* %5, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %51, i64 %53
  %55 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %54, i32 0, i32 3
  store i8 %48, i8* %55, align 1
  %56 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %57 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %56, i32 0, i32 9
  %58 = load %struct.code_ent*, %struct.code_ent** %57, align 8
  %59 = load i32, i32* %5, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %58, i64 %60
  %62 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %61, i32 0, i32 1
  store i16 1, i16* %62, align 8
  %63 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %64 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %63, i32 0, i32 9
  %65 = load %struct.code_ent*, %struct.code_ent** %64, align 8
  %66 = load i32, i32* %5, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %65, i64 %67
  %69 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %68, i32 0, i32 0
  store %struct.code_ent* null, %struct.code_ent** %69, align 8
  br label %70

; <label>:70:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 0)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 0)
  %72 = load i32, i32* %5, align 4
  %73 = add nsw i32 %72, -1
  store i32 %73, i32* %5, align 4
  br label %34

; <label>:74:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 2)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 2)
  br label %76

; <label>:76:                                     ; preds = %74, %17
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 1)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWSetupDecode, i64 0, i64 1)
  store i32 1, i32* %2, align 4
  br label %78

; <label>:78:                                     ; preds = %76, %31
  %79 = load i32, i32* %2, align 4
  ret i32 %79
}

; Function Attrs: nounwind uwtable
define internal i32 @LZWPreDecode(%struct.tiff*, i16 zeroext) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i16, align 2
  %5 = alloca %struct.LZWDecodeState*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i16 %1, i16* %4, align 2
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 37
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast i8* %8 to %struct.LZWBaseState*
  %10 = bitcast %struct.LZWBaseState* %9 to %struct.LZWDecodeState*
  store %struct.LZWDecodeState* %10, %struct.LZWDecodeState** %5, align 8
  %11 = load i16, i16* %4, align 2
  %12 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %13 = icmp ne %struct.LZWDecodeState* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %2
  br label %18

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 4)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 225, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.LZWPreDecode, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %18

; <label>:18:                                     ; preds = %17, %14
  %19 = load %struct.tiff*, %struct.tiff** %3, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 40
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 0
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %65

; <label>:26:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 1)
  %28 = load %struct.tiff*, %struct.tiff** %3, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 40
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = and i32 %33, 1
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %65

; <label>:36:                                     ; preds = %26
  %37 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %38 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %37, i32 0, i32 4
  %39 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %38, align 8
  %40 = icmp ne i32 (%struct.tiff*, i8*, i32, i16)* %39, null
  br i1 %40, label %60, label %41

; <label>:41:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 3)
  %43 = load %struct.tiff*, %struct.tiff** %3, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %43, i32 0, i32 0
  %45 = load i8*, i8** %44, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %45, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i32 0, i32 0))
  %46 = load %struct.tiff*, %struct.tiff** %3, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat, i32 (%struct.tiff*, i8*, i32, i16)** %47, align 8
  %48 = load %struct.tiff*, %struct.tiff** %3, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat, i32 (%struct.tiff*, i8*, i32, i16)** %49, align 8
  %50 = load %struct.tiff*, %struct.tiff** %3, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat, i32 (%struct.tiff*, i8*, i32, i16)** %51, align 8
  %52 = load %struct.tiff*, %struct.tiff** %3, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 21
  %54 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %53, align 8
  %55 = load %struct.tiff*, %struct.tiff** %3, align 8
  %56 = ptrtoint i32 (%struct.tiff*)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %56, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_LZWPreDecode to i8*), i32 0)
  %57 = call i32 %54(%struct.tiff* %55)
  %58 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %59 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %58, i32 0, i32 4
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat, i32 (%struct.tiff*, i8*, i32, i16)** %59, align 8
  br label %60

; <label>:60:                                     ; preds = %41, %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 2)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 2)
  %62 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %63 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %62, i32 0, i32 0
  %64 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %63, i32 0, i32 2
  store i16 511, i16* %64, align 2
  br label %72

; <label>:65:                                     ; preds = %26, %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 0)
  %66 = add i64 %pgocount4, 1
  store i64 %66, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_LZWPreDecode, i64 0, i64 0)
  %67 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %68 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %67, i32 0, i32 0
  %69 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %68, i32 0, i32 2
  store i16 510, i16* %69, align 2
  %70 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %71 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %70, i32 0, i32 4
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode, i32 (%struct.tiff*, i8*, i32, i16)** %71, align 8
  br label %72

; <label>:72:                                     ; preds = %65, %60
  %73 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %74 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %73, i32 0, i32 0
  %75 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %74, i32 0, i32 1
  store i16 9, i16* %75, align 8
  %76 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %77 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %76, i32 0, i32 0
  %78 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %77, i32 0, i32 5
  store i64 0, i64* %78, align 8
  %79 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %80 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %79, i32 0, i32 0
  %81 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %80, i32 0, i32 4
  store i64 0, i64* %81, align 8
  %82 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %83 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %82, i32 0, i32 2
  store i64 0, i64* %83, align 8
  %84 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %85 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %84, i32 0, i32 1
  store i64 511, i64* %85, align 8
  %86 = load %struct.tiff*, %struct.tiff** %3, align 8
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %86, i32 0, i32 43
  %88 = load i32, i32* %87, align 8
  %89 = shl i32 %88, 3
  %90 = sext i32 %89 to i64
  %91 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %92 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %91, i32 0, i32 3
  store i64 %90, i64* %92, align 8
  %93 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %94 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %93, i32 0, i32 9
  %95 = load %struct.code_ent*, %struct.code_ent** %94, align 8
  %96 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %95, i64 258
  %97 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %98 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %97, i32 0, i32 7
  store %struct.code_ent* %96, %struct.code_ent** %98, align 8
  %99 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %100 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %99, i32 0, i32 7
  %101 = load %struct.code_ent*, %struct.code_ent** %100, align 8
  %102 = bitcast %struct.code_ent* %101 to i8*
  call void @_TIFFmemset(i8* %102, i32 0, i32 77776)
  %103 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %104 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %103, i32 0, i32 9
  %105 = load %struct.code_ent*, %struct.code_ent** %104, align 8
  %106 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %105, i64 -1
  %107 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %108 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %107, i32 0, i32 6
  store %struct.code_ent* %106, %struct.code_ent** %108, align 8
  %109 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %110 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %109, i32 0, i32 9
  %111 = load %struct.code_ent*, %struct.code_ent** %110, align 8
  %112 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %113 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %112, i32 0, i32 1
  %114 = load i64, i64* %113, align 8
  %115 = sub nsw i64 %114, 1
  %116 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %111, i64 %115
  %117 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %5, align 8
  %118 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %117, i32 0, i32 8
  store %struct.code_ent* %116, %struct.code_ent** %118, align 8
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @LZWDecode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.LZWDecodeState*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i16, align 2
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca %struct.code_ent*, align 8
  %22 = alloca %struct.code_ent*, align 8
  %23 = alloca %struct.code_ent*, align 8
  %24 = alloca %struct.code_ent*, align 8
  %25 = alloca i64, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %28 = load %struct.tiff*, %struct.tiff** %6, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 37
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to %struct.LZWBaseState*
  %32 = bitcast %struct.LZWBaseState* %31 to %struct.LZWDecodeState*
  store %struct.LZWDecodeState* %32, %struct.LZWDecodeState** %10, align 8
  %33 = load i8*, i8** %7, align 8
  store i8* %33, i8** %11, align 8
  %34 = load i32, i32* %8, align 4
  %35 = sext i32 %34 to i64
  store i64 %35, i64* %12, align 8
  %36 = load i16, i16* %9, align 2
  %37 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %38 = icmp ne %struct.LZWDecodeState* %37, null
  br i1 %38, label %39, label %40

; <label>:39:                                     ; preds = %4
  br label %43

; <label>:40:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 35)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 35)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 324, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.LZWDecode, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %43

; <label>:43:                                     ; preds = %42, %39
  %44 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %45 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %44, i32 0, i32 2
  %46 = load i64, i64* %45, align 8
  %47 = icmp ne i64 %46, 0
  br i1 %47, label %48, label %152

; <label>:48:                                     ; preds = %43
  %49 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %50 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %49, i32 0, i32 5
  %51 = load %struct.code_ent*, %struct.code_ent** %50, align 8
  store %struct.code_ent* %51, %struct.code_ent** %21, align 8
  %52 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %53 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %52, i32 0, i32 1
  %54 = load i16, i16* %53, align 8
  %55 = zext i16 %54 to i64
  %56 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %57 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %56, i32 0, i32 2
  %58 = load i64, i64* %57, align 8
  %59 = sub nsw i64 %55, %58
  store i64 %59, i64* %25, align 8
  %60 = load i64, i64* %25, align 8
  %61 = load i64, i64* %12, align 8
  %62 = icmp sgt i64 %60, %61
  br i1 %62, label %63, label %116

; <label>:63:                                     ; preds = %48
  %64 = load i64, i64* %12, align 8
  %65 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %66 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %65, i32 0, i32 2
  %67 = load i64, i64* %66, align 8
  %68 = add nsw i64 %67, %64
  store i64 %68, i64* %66, align 8
  br label %69

; <label>:69:                                     ; preds = %83, %63
  %pgocount1 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 2)
  %70 = add i64 %pgocount1, 1
  store i64 %70, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 2)
  %71 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %72 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %71, i32 0, i32 0
  %73 = load %struct.code_ent*, %struct.code_ent** %72, align 8
  store %struct.code_ent* %73, %struct.code_ent** %21, align 8
  br label %74

; <label>:74:                                     ; preds = %69
  %75 = load i64, i64* %25, align 8
  %76 = add nsw i64 %75, -1
  store i64 %76, i64* %25, align 8
  %77 = load i64, i64* %12, align 8
  %78 = icmp sgt i64 %76, %77
  br i1 %78, label %79, label %83

; <label>:79:                                     ; preds = %74
  %pgocount2 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 6)
  %80 = add i64 %pgocount2, 1
  store i64 %80, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 6)
  %81 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %82 = icmp ne %struct.code_ent* %81, null
  br label %83

; <label>:83:                                     ; preds = %79, %74
  %84 = phi i1 [ false, %74 ], [ %82, %79 ]
  br i1 %84, label %69, label %85

; <label>:85:                                     ; preds = %83
  %86 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %87 = icmp ne %struct.code_ent* %86, null
  br i1 %87, label %88, label %114

; <label>:88:                                     ; preds = %85
  %89 = load i8*, i8** %11, align 8
  %90 = load i64, i64* %12, align 8
  %91 = getelementptr inbounds i8, i8* %89, i64 %90
  store i8* %91, i8** %13, align 8
  br label %92

; <label>:92:                                     ; preds = %110, %88
  %pgocount3 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 4)
  %93 = add i64 %pgocount3, 1
  store i64 %93, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 4)
  %94 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %95 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %94, i32 0, i32 2
  %96 = load i8, i8* %95, align 2
  %97 = load i8*, i8** %13, align 8
  %98 = getelementptr inbounds i8, i8* %97, i32 -1
  store i8* %98, i8** %13, align 8
  store i8 %96, i8* %98, align 1
  %99 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %100 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %99, i32 0, i32 0
  %101 = load %struct.code_ent*, %struct.code_ent** %100, align 8
  store %struct.code_ent* %101, %struct.code_ent** %21, align 8
  br label %102

; <label>:102:                                    ; preds = %92
  %103 = load i64, i64* %12, align 8
  %104 = add nsw i64 %103, -1
  store i64 %104, i64* %12, align 8
  %105 = icmp ne i64 %104, 0
  br i1 %105, label %106, label %110

; <label>:106:                                    ; preds = %102
  %pgocount4 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 7)
  %107 = add i64 %pgocount4, 1
  store i64 %107, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 7)
  %108 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %109 = icmp ne %struct.code_ent* %108, null
  br label %110

; <label>:110:                                    ; preds = %106, %102
  %111 = phi i1 [ false, %102 ], [ %109, %106 ]
  br i1 %111, label %92, label %112

; <label>:112:                                    ; preds = %110
  %pgocount5 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 27)
  %113 = add i64 %pgocount5, 1
  store i64 %113, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 27)
  br label %114

; <label>:114:                                    ; preds = %112, %85
  %pgocount6 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 23)
  %115 = add i64 %pgocount6, 1
  store i64 %115, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 23)
  store i32 1, i32* %5, align 4
  br label %596

; <label>:116:                                    ; preds = %48
  %117 = load i64, i64* %25, align 8
  %118 = load i8*, i8** %11, align 8
  %119 = getelementptr inbounds i8, i8* %118, i64 %117
  store i8* %119, i8** %11, align 8
  %120 = load i64, i64* %25, align 8
  %121 = load i64, i64* %12, align 8
  %122 = sub nsw i64 %121, %120
  store i64 %122, i64* %12, align 8
  %123 = load i8*, i8** %11, align 8
  store i8* %123, i8** %13, align 8
  br label %124

; <label>:124:                                    ; preds = %146, %116
  %pgocount7 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 3)
  %125 = add i64 %pgocount7, 1
  store i64 %125, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 3)
  %126 = load i8*, i8** %13, align 8
  %127 = getelementptr inbounds i8, i8* %126, i32 -1
  store i8* %127, i8** %13, align 8
  %128 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %129 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %128, i32 0, i32 2
  %130 = load i8, i8* %129, align 2
  %131 = zext i8 %130 to i32
  store i32 %131, i32* %26, align 4
  %132 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %133 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %132, i32 0, i32 0
  %134 = load %struct.code_ent*, %struct.code_ent** %133, align 8
  store %struct.code_ent* %134, %struct.code_ent** %21, align 8
  %135 = load i32, i32* %26, align 4
  %136 = trunc i32 %135 to i8
  %137 = load i8*, i8** %13, align 8
  store i8 %136, i8* %137, align 1
  br label %138

; <label>:138:                                    ; preds = %124
  %139 = load i64, i64* %25, align 8
  %140 = add nsw i64 %139, -1
  store i64 %140, i64* %25, align 8
  %141 = icmp ne i64 %140, 0
  br i1 %141, label %142, label %146

; <label>:142:                                    ; preds = %138
  %pgocount8 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 5)
  %143 = add i64 %pgocount8, 1
  store i64 %143, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 5)
  %144 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %145 = icmp ne %struct.code_ent* %144, null
  br label %146

; <label>:146:                                    ; preds = %142, %138
  %147 = phi i1 [ false, %138 ], [ %145, %142 ]
  br i1 %147, label %124, label %148

; <label>:148:                                    ; preds = %146
  %pgocount9 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 24)
  %149 = add i64 %pgocount9, 1
  store i64 %149, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 24)
  %150 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %151 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %150, i32 0, i32 2
  store i64 0, i64* %151, align 8
  br label %152

; <label>:152:                                    ; preds = %148, %43
  %153 = load %struct.tiff*, %struct.tiff** %6, align 8
  %154 = getelementptr inbounds %struct.tiff, %struct.tiff* %153, i32 0, i32 42
  %155 = load i8*, i8** %154, align 8
  store i8* %155, i8** %14, align 8
  %156 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %157 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %156, i32 0, i32 0
  %158 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %157, i32 0, i32 1
  %159 = load i16, i16* %158, align 8
  %160 = zext i16 %159 to i64
  store i64 %160, i64* %17, align 8
  %161 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %162 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %161, i32 0, i32 0
  %163 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %162, i32 0, i32 4
  %164 = load i64, i64* %163, align 8
  store i64 %164, i64* %19, align 8
  %165 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %166 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %165, i32 0, i32 0
  %167 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %166, i32 0, i32 5
  %168 = load i64, i64* %167, align 8
  store i64 %168, i64* %18, align 8
  %169 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %170 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %169, i32 0, i32 1
  %171 = load i64, i64* %170, align 8
  store i64 %171, i64* %20, align 8
  %172 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %173 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %172, i32 0, i32 6
  %174 = load %struct.code_ent*, %struct.code_ent** %173, align 8
  store %struct.code_ent* %174, %struct.code_ent** %24, align 8
  %175 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %176 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %175, i32 0, i32 7
  %177 = load %struct.code_ent*, %struct.code_ent** %176, align 8
  store %struct.code_ent* %177, %struct.code_ent** %22, align 8
  %178 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %179 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %178, i32 0, i32 8
  %180 = load %struct.code_ent*, %struct.code_ent** %179, align 8
  store %struct.code_ent* %180, %struct.code_ent** %23, align 8
  br label %181

; <label>:181:                                    ; preds = %553, %321, %152
  %182 = load i64, i64* %12, align 8
  %183 = icmp sgt i64 %182, 0
  br i1 %183, label %184, label %554

; <label>:184:                                    ; preds = %181
  %185 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %186 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %185, i32 0, i32 3
  %187 = load i64, i64* %186, align 8
  %188 = load i64, i64* %17, align 8
  %189 = icmp slt i64 %187, %188
  br i1 %189, label %190, label %197

; <label>:190:                                    ; preds = %184
  %191 = load %struct.tiff*, %struct.tiff** %6, align 8
  %192 = getelementptr inbounds %struct.tiff, %struct.tiff* %191, i32 0, i32 0
  %193 = load i8*, i8** %192, align 8
  %194 = load %struct.tiff*, %struct.tiff** %6, align 8
  %195 = getelementptr inbounds %struct.tiff, %struct.tiff* %194, i32 0, i32 13
  %196 = load i32, i32* %195, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %193, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i32 0, i32 0), i32 %196)
  store i16 257, i16* %15, align 2
  br label %239

; <label>:197:                                    ; preds = %184
  %198 = load i64, i64* %19, align 8
  %199 = shl i64 %198, 8
  %200 = load i8*, i8** %14, align 8
  %201 = getelementptr inbounds i8, i8* %200, i32 1
  store i8* %201, i8** %14, align 8
  %202 = load i8, i8* %200, align 1
  %203 = zext i8 %202 to i64
  %204 = or i64 %199, %203
  store i64 %204, i64* %19, align 8
  %205 = load i64, i64* %18, align 8
  %206 = add nsw i64 %205, 8
  store i64 %206, i64* %18, align 8
  %207 = load i64, i64* %18, align 8
  %208 = load i64, i64* %17, align 8
  %209 = icmp slt i64 %207, %208
  br i1 %209, label %210, label %221

; <label>:210:                                    ; preds = %197
  %pgocount10 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 9)
  %211 = add i64 %pgocount10, 1
  store i64 %211, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 9)
  %212 = load i64, i64* %19, align 8
  %213 = shl i64 %212, 8
  %214 = load i8*, i8** %14, align 8
  %215 = getelementptr inbounds i8, i8* %214, i32 1
  store i8* %215, i8** %14, align 8
  %216 = load i8, i8* %214, align 1
  %217 = zext i8 %216 to i64
  %218 = or i64 %213, %217
  store i64 %218, i64* %19, align 8
  %219 = load i64, i64* %18, align 8
  %220 = add nsw i64 %219, 8
  store i64 %220, i64* %18, align 8
  br label %221

; <label>:221:                                    ; preds = %210, %197
  %pgocount11 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 8)
  %222 = add i64 %pgocount11, 1
  store i64 %222, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 8)
  %223 = load i64, i64* %19, align 8
  %224 = load i64, i64* %18, align 8
  %225 = load i64, i64* %17, align 8
  %226 = sub nsw i64 %224, %225
  %227 = ashr i64 %223, %226
  %228 = load i64, i64* %20, align 8
  %229 = and i64 %227, %228
  %230 = trunc i64 %229 to i16
  store i16 %230, i16* %15, align 2
  %231 = load i64, i64* %17, align 8
  %232 = load i64, i64* %18, align 8
  %233 = sub nsw i64 %232, %231
  store i64 %233, i64* %18, align 8
  %234 = load i64, i64* %17, align 8
  %235 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %236 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %235, i32 0, i32 3
  %237 = load i64, i64* %236, align 8
  %238 = sub nsw i64 %237, %234
  store i64 %238, i64* %236, align 8
  br label %239

; <label>:239:                                    ; preds = %221, %190
  %240 = load i16, i16* %15, align 2
  %241 = zext i16 %240 to i32
  %242 = icmp eq i32 %241, 257
  br i1 %242, label %243, label %245

; <label>:243:                                    ; preds = %239
  %pgocount12 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 26)
  %244 = add i64 %pgocount12, 1
  store i64 %244, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 26)
  br label %554

; <label>:245:                                    ; preds = %239
  %246 = load i16, i16* %15, align 2
  %247 = zext i16 %246 to i32
  %248 = icmp eq i32 %247, 256
  br i1 %248, label %249, label %335

; <label>:249:                                    ; preds = %245
  %250 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %251 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %250, i32 0, i32 9
  %252 = load %struct.code_ent*, %struct.code_ent** %251, align 8
  %253 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %252, i64 258
  store %struct.code_ent* %253, %struct.code_ent** %22, align 8
  store i64 9, i64* %17, align 8
  store i64 511, i64* %20, align 8
  %254 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %255 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %254, i32 0, i32 9
  %256 = load %struct.code_ent*, %struct.code_ent** %255, align 8
  %257 = load i64, i64* %20, align 8
  %258 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %256, i64 %257
  %259 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %258, i64 -1
  store %struct.code_ent* %259, %struct.code_ent** %23, align 8
  %260 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %261 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %260, i32 0, i32 3
  %262 = load i64, i64* %261, align 8
  %263 = load i64, i64* %17, align 8
  %264 = icmp slt i64 %262, %263
  br i1 %264, label %265, label %273

; <label>:265:                                    ; preds = %249
  %pgocount13 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 10)
  %266 = add i64 %pgocount13, 1
  store i64 %266, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 10)
  %267 = load %struct.tiff*, %struct.tiff** %6, align 8
  %268 = getelementptr inbounds %struct.tiff, %struct.tiff* %267, i32 0, i32 0
  %269 = load i8*, i8** %268, align 8
  %270 = load %struct.tiff*, %struct.tiff** %6, align 8
  %271 = getelementptr inbounds %struct.tiff, %struct.tiff* %270, i32 0, i32 13
  %272 = load i32, i32* %271, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %269, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i32 0, i32 0), i32 %272)
  store i16 257, i16* %15, align 2
  br label %315

; <label>:273:                                    ; preds = %249
  %274 = load i64, i64* %19, align 8
  %275 = shl i64 %274, 8
  %276 = load i8*, i8** %14, align 8
  %277 = getelementptr inbounds i8, i8* %276, i32 1
  store i8* %277, i8** %14, align 8
  %278 = load i8, i8* %276, align 1
  %279 = zext i8 %278 to i64
  %280 = or i64 %275, %279
  store i64 %280, i64* %19, align 8
  %281 = load i64, i64* %18, align 8
  %282 = add nsw i64 %281, 8
  store i64 %282, i64* %18, align 8
  %283 = load i64, i64* %18, align 8
  %284 = load i64, i64* %17, align 8
  %285 = icmp slt i64 %283, %284
  br i1 %285, label %286, label %297

; <label>:286:                                    ; preds = %273
  %pgocount14 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 19)
  %287 = add i64 %pgocount14, 1
  store i64 %287, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 19)
  %288 = load i64, i64* %19, align 8
  %289 = shl i64 %288, 8
  %290 = load i8*, i8** %14, align 8
  %291 = getelementptr inbounds i8, i8* %290, i32 1
  store i8* %291, i8** %14, align 8
  %292 = load i8, i8* %290, align 1
  %293 = zext i8 %292 to i64
  %294 = or i64 %289, %293
  store i64 %294, i64* %19, align 8
  %295 = load i64, i64* %18, align 8
  %296 = add nsw i64 %295, 8
  store i64 %296, i64* %18, align 8
  br label %297

; <label>:297:                                    ; preds = %286, %273
  %pgocount15 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 11)
  %298 = add i64 %pgocount15, 1
  store i64 %298, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 11)
  %299 = load i64, i64* %19, align 8
  %300 = load i64, i64* %18, align 8
  %301 = load i64, i64* %17, align 8
  %302 = sub nsw i64 %300, %301
  %303 = ashr i64 %299, %302
  %304 = load i64, i64* %20, align 8
  %305 = and i64 %303, %304
  %306 = trunc i64 %305 to i16
  store i16 %306, i16* %15, align 2
  %307 = load i64, i64* %17, align 8
  %308 = load i64, i64* %18, align 8
  %309 = sub nsw i64 %308, %307
  store i64 %309, i64* %18, align 8
  %310 = load i64, i64* %17, align 8
  %311 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %312 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %311, i32 0, i32 3
  %313 = load i64, i64* %312, align 8
  %314 = sub nsw i64 %313, %310
  store i64 %314, i64* %312, align 8
  br label %315

; <label>:315:                                    ; preds = %297, %265
  %316 = load i16, i16* %15, align 2
  %317 = zext i16 %316 to i32
  %318 = icmp eq i32 %317, 257
  br i1 %318, label %319, label %321

; <label>:319:                                    ; preds = %315
  %pgocount16 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 28)
  %320 = add i64 %pgocount16, 1
  store i64 %320, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 28)
  br label %554

; <label>:321:                                    ; preds = %315
  %322 = load i16, i16* %15, align 2
  %323 = trunc i16 %322 to i8
  %324 = load i8*, i8** %11, align 8
  %325 = getelementptr inbounds i8, i8* %324, i32 1
  store i8* %325, i8** %11, align 8
  store i8 %323, i8* %324, align 1
  %326 = load i64, i64* %12, align 8
  %327 = add nsw i64 %326, -1
  store i64 %327, i64* %12, align 8
  %328 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %329 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %328, i32 0, i32 9
  %330 = load %struct.code_ent*, %struct.code_ent** %329, align 8
  %331 = load i16, i16* %15, align 2
  %332 = zext i16 %331 to i32
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %330, i64 %333
  store %struct.code_ent* %334, %struct.code_ent** %24, align 8
  br label %181

; <label>:335:                                    ; preds = %245
  %336 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %337 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %336, i32 0, i32 9
  %338 = load %struct.code_ent*, %struct.code_ent** %337, align 8
  %339 = load i16, i16* %15, align 2
  %340 = zext i16 %339 to i32
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %338, i64 %341
  store %struct.code_ent* %342, %struct.code_ent** %21, align 8
  %343 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %344 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %343, i32 0, i32 9
  %345 = load %struct.code_ent*, %struct.code_ent** %344, align 8
  %346 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %345, i64 0
  %347 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %348 = icmp ule %struct.code_ent* %346, %347
  br i1 %348, label %349, label %358

; <label>:349:                                    ; preds = %335
  %350 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %351 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %352 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %351, i32 0, i32 9
  %353 = load %struct.code_ent*, %struct.code_ent** %352, align 8
  %354 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %353, i64 5119
  %355 = icmp ult %struct.code_ent* %350, %354
  br i1 %355, label %357, label %._crit_edge

._crit_edge:                                      ; preds = %349
  %pgocount17 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 33)
  %356 = add i64 %pgocount17, 1
  store i64 %356, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 33)
  br label %358

; <label>:357:                                    ; preds = %349
  br label %361

; <label>:358:                                    ; preds = %._crit_edge, %335
  %pgocount18 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 34)
  %359 = add i64 %pgocount18, 1
  store i64 %359, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 34)
  call void @__assert_fail(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 398, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.LZWDecode, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %361

; <label>:361:                                    ; preds = %360, %357
  %362 = load %struct.code_ent*, %struct.code_ent** %24, align 8
  %363 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %364 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %363, i32 0, i32 0
  store %struct.code_ent* %362, %struct.code_ent** %364, align 8
  %365 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %366 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %365, i32 0, i32 0
  %367 = load %struct.code_ent*, %struct.code_ent** %366, align 8
  %368 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %367, i32 0, i32 3
  %369 = load i8, i8* %368, align 1
  %370 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %371 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %370, i32 0, i32 3
  store i8 %369, i8* %371, align 1
  %372 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %373 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %372, i32 0, i32 0
  %374 = load %struct.code_ent*, %struct.code_ent** %373, align 8
  %375 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %374, i32 0, i32 1
  %376 = load i16, i16* %375, align 8
  %377 = zext i16 %376 to i32
  %378 = add nsw i32 %377, 1
  %379 = trunc i32 %378 to i16
  %380 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %381 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %380, i32 0, i32 1
  store i16 %379, i16* %381, align 8
  %382 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %383 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %384 = icmp ult %struct.code_ent* %382, %383
  br i1 %384, label %385, label %390

; <label>:385:                                    ; preds = %361
  %386 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %387 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %386, i32 0, i32 3
  %388 = load i8, i8* %387, align 1
  %389 = zext i8 %388 to i32
  br label %396

; <label>:390:                                    ; preds = %361
  %pgocount19 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 12)
  %391 = add i64 %pgocount19, 1
  store i64 %391, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 12)
  %392 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %393 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %392, i32 0, i32 3
  %394 = load i8, i8* %393, align 1
  %395 = zext i8 %394 to i32
  br label %396

; <label>:396:                                    ; preds = %390, %385
  %397 = phi i32 [ %389, %385 ], [ %395, %390 ]
  %398 = trunc i32 %397 to i8
  %399 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %400 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %399, i32 0, i32 2
  store i8 %398, i8* %400, align 2
  %401 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %402 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %401, i32 1
  store %struct.code_ent* %402, %struct.code_ent** %22, align 8
  %403 = load %struct.code_ent*, %struct.code_ent** %23, align 8
  %404 = icmp ugt %struct.code_ent* %402, %403
  br i1 %404, label %405, label %422

; <label>:405:                                    ; preds = %396
  %406 = load i64, i64* %17, align 8
  %407 = add nsw i64 %406, 1
  store i64 %407, i64* %17, align 8
  %408 = icmp sgt i64 %407, 12
  br i1 %408, label %409, label %411

; <label>:409:                                    ; preds = %405
  %pgocount20 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 20)
  %410 = add i64 %pgocount20, 1
  store i64 %410, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 20)
  store i64 12, i64* %17, align 8
  br label %411

; <label>:411:                                    ; preds = %409, %405
  %pgocount21 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 13)
  %412 = add i64 %pgocount21, 1
  store i64 %412, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 13)
  %413 = load i64, i64* %17, align 8
  %414 = shl i64 1, %413
  %415 = sub nsw i64 %414, 1
  store i64 %415, i64* %20, align 8
  %416 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %417 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %416, i32 0, i32 9
  %418 = load %struct.code_ent*, %struct.code_ent** %417, align 8
  %419 = load i64, i64* %20, align 8
  %420 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %418, i64 %419
  %421 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %420, i64 -1
  store %struct.code_ent* %421, %struct.code_ent** %23, align 8
  br label %422

; <label>:422:                                    ; preds = %411, %396
  %423 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  store %struct.code_ent* %423, %struct.code_ent** %24, align 8
  %424 = load i16, i16* %15, align 2
  %425 = zext i16 %424 to i32
  %426 = icmp sge i32 %425, 256
  br i1 %426, label %427, label %545

; <label>:427:                                    ; preds = %422
  %428 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %429 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %428, i32 0, i32 1
  %430 = load i16, i16* %429, align 8
  %431 = zext i16 %430 to i64
  %432 = load i64, i64* %12, align 8
  %433 = icmp sgt i64 %431, %432
  br i1 %433, label %434, label %496

; <label>:434:                                    ; preds = %427
  %435 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %436 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %437 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %436, i32 0, i32 5
  store %struct.code_ent* %435, %struct.code_ent** %437, align 8
  br label %438

; <label>:438:                                    ; preds = %454, %434
  %pgocount22 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 14)
  %439 = add i64 %pgocount22, 1
  store i64 %439, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 14)
  %440 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %441 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %440, i32 0, i32 0
  %442 = load %struct.code_ent*, %struct.code_ent** %441, align 8
  store %struct.code_ent* %442, %struct.code_ent** %21, align 8
  br label %443

; <label>:443:                                    ; preds = %438
  %444 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %445 = icmp ne %struct.code_ent* %444, null
  br i1 %445, label %446, label %454

; <label>:446:                                    ; preds = %443
  %pgocount23 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 18)
  %447 = add i64 %pgocount23, 1
  store i64 %447, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 18)
  %448 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %449 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %448, i32 0, i32 1
  %450 = load i16, i16* %449, align 8
  %451 = zext i16 %450 to i64
  %452 = load i64, i64* %12, align 8
  %453 = icmp sgt i64 %451, %452
  br label %454

; <label>:454:                                    ; preds = %446, %443
  %455 = phi i1 [ false, %443 ], [ %453, %446 ]
  br i1 %455, label %438, label %456

; <label>:456:                                    ; preds = %454
  %457 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %458 = icmp ne %struct.code_ent* %457, null
  br i1 %458, label %459, label %494

; <label>:459:                                    ; preds = %456
  %460 = load i64, i64* %12, align 8
  %461 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %462 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %461, i32 0, i32 2
  store i64 %460, i64* %462, align 8
  %463 = load i8*, i8** %11, align 8
  %464 = load i64, i64* %12, align 8
  %465 = getelementptr inbounds i8, i8* %463, i64 %464
  store i8* %465, i8** %13, align 8
  br label %466

; <label>:466:                                    ; preds = %484, %459
  %pgocount24 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 17)
  %467 = add i64 %pgocount24, 1
  store i64 %467, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 17)
  %468 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %469 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %468, i32 0, i32 2
  %470 = load i8, i8* %469, align 2
  %471 = load i8*, i8** %13, align 8
  %472 = getelementptr inbounds i8, i8* %471, i32 -1
  store i8* %472, i8** %13, align 8
  store i8 %470, i8* %472, align 1
  %473 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %474 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %473, i32 0, i32 0
  %475 = load %struct.code_ent*, %struct.code_ent** %474, align 8
  store %struct.code_ent* %475, %struct.code_ent** %21, align 8
  br label %476

; <label>:476:                                    ; preds = %466
  %477 = load i64, i64* %12, align 8
  %478 = add nsw i64 %477, -1
  store i64 %478, i64* %12, align 8
  %479 = icmp ne i64 %478, 0
  br i1 %479, label %480, label %484

; <label>:480:                                    ; preds = %476
  %pgocount25 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 21)
  %481 = add i64 %pgocount25, 1
  store i64 %481, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 21)
  %482 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %483 = icmp ne %struct.code_ent* %482, null
  br label %484

; <label>:484:                                    ; preds = %480, %476
  %485 = phi i1 [ false, %476 ], [ %483, %480 ]
  br i1 %485, label %466, label %486

; <label>:486:                                    ; preds = %484
  %487 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %488 = icmp ne %struct.code_ent* %487, null
  br i1 %488, label %489, label %492

; <label>:489:                                    ; preds = %486
  %pgocount26 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 32)
  %490 = add i64 %pgocount26, 1
  store i64 %490, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 32)
  %491 = load %struct.tiff*, %struct.tiff** %6, align 8
  call void @codeLoop(%struct.tiff* %491)
  br label %492

; <label>:492:                                    ; preds = %489, %486
  %pgocount27 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 31)
  %493 = add i64 %pgocount27, 1
  store i64 %493, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 31)
  br label %494

; <label>:494:                                    ; preds = %492, %456
  %pgocount28 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 29)
  %495 = add i64 %pgocount28, 1
  store i64 %495, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 29)
  br label %554

; <label>:496:                                    ; preds = %427
  %497 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %498 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %497, i32 0, i32 1
  %499 = load i16, i16* %498, align 8
  %500 = zext i16 %499 to i32
  store i32 %500, i32* %16, align 4
  %501 = load i8*, i8** %11, align 8
  %502 = load i32, i32* %16, align 4
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds i8, i8* %501, i64 %503
  store i8* %504, i8** %13, align 8
  br label %505

; <label>:505:                                    ; preds = %527, %496
  %pgocount29 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 0)
  %506 = add i64 %pgocount29, 1
  store i64 %506, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 0)
  %507 = load i8*, i8** %13, align 8
  %508 = getelementptr inbounds i8, i8* %507, i32 -1
  store i8* %508, i8** %13, align 8
  %509 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %510 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %509, i32 0, i32 2
  %511 = load i8, i8* %510, align 2
  %512 = zext i8 %511 to i32
  store i32 %512, i32* %27, align 4
  %513 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %514 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %513, i32 0, i32 0
  %515 = load %struct.code_ent*, %struct.code_ent** %514, align 8
  store %struct.code_ent* %515, %struct.code_ent** %21, align 8
  %516 = load i32, i32* %27, align 4
  %517 = trunc i32 %516 to i8
  %518 = load i8*, i8** %13, align 8
  store i8 %517, i8* %518, align 1
  br label %519

; <label>:519:                                    ; preds = %505
  %520 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %521 = icmp ne %struct.code_ent* %520, null
  br i1 %521, label %522, label %527

; <label>:522:                                    ; preds = %519
  %pgocount30 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 1)
  %523 = add i64 %pgocount30, 1
  store i64 %523, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 1)
  %524 = load i8*, i8** %13, align 8
  %525 = load i8*, i8** %11, align 8
  %526 = icmp ugt i8* %524, %525
  br label %527

; <label>:527:                                    ; preds = %522, %519
  %528 = phi i1 [ false, %519 ], [ %526, %522 ]
  br i1 %528, label %505, label %529

; <label>:529:                                    ; preds = %527
  %530 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %531 = icmp ne %struct.code_ent* %530, null
  br i1 %531, label %532, label %535

; <label>:532:                                    ; preds = %529
  %pgocount31 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 30)
  %533 = add i64 %pgocount31, 1
  store i64 %533, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 30)
  %534 = load %struct.tiff*, %struct.tiff** %6, align 8
  call void @codeLoop(%struct.tiff* %534)
  br label %554

; <label>:535:                                    ; preds = %529
  %pgocount32 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 16)
  %536 = add i64 %pgocount32, 1
  store i64 %536, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 16)
  %537 = load i32, i32* %16, align 4
  %538 = load i8*, i8** %11, align 8
  %539 = sext i32 %537 to i64
  %540 = getelementptr inbounds i8, i8* %538, i64 %539
  store i8* %540, i8** %11, align 8
  %541 = load i32, i32* %16, align 4
  %542 = sext i32 %541 to i64
  %543 = load i64, i64* %12, align 8
  %544 = sub nsw i64 %543, %542
  store i64 %544, i64* %12, align 8
  br label %553

; <label>:545:                                    ; preds = %422
  %pgocount33 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 15)
  %546 = add i64 %pgocount33, 1
  store i64 %546, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 15)
  %547 = load i16, i16* %15, align 2
  %548 = trunc i16 %547 to i8
  %549 = load i8*, i8** %11, align 8
  %550 = getelementptr inbounds i8, i8* %549, i32 1
  store i8* %550, i8** %11, align 8
  store i8 %548, i8* %549, align 1
  %551 = load i64, i64* %12, align 8
  %552 = add nsw i64 %551, -1
  store i64 %552, i64* %12, align 8
  br label %553

; <label>:553:                                    ; preds = %545, %535
  br label %181

; <label>:554:                                    ; preds = %532, %494, %319, %243, %181
  %555 = load i8*, i8** %14, align 8
  %556 = load %struct.tiff*, %struct.tiff** %6, align 8
  %557 = getelementptr inbounds %struct.tiff, %struct.tiff* %556, i32 0, i32 42
  store i8* %555, i8** %557, align 8
  %558 = load i64, i64* %17, align 8
  %559 = trunc i64 %558 to i16
  %560 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %561 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %560, i32 0, i32 0
  %562 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %561, i32 0, i32 1
  store i16 %559, i16* %562, align 8
  %563 = load i64, i64* %19, align 8
  %564 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %565 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %564, i32 0, i32 0
  %566 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %565, i32 0, i32 4
  store i64 %563, i64* %566, align 8
  %567 = load i64, i64* %18, align 8
  %568 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %569 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %568, i32 0, i32 0
  %570 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %569, i32 0, i32 5
  store i64 %567, i64* %570, align 8
  %571 = load i64, i64* %20, align 8
  %572 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %573 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %572, i32 0, i32 1
  store i64 %571, i64* %573, align 8
  %574 = load %struct.code_ent*, %struct.code_ent** %24, align 8
  %575 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %576 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %575, i32 0, i32 6
  store %struct.code_ent* %574, %struct.code_ent** %576, align 8
  %577 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %578 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %579 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %578, i32 0, i32 7
  store %struct.code_ent* %577, %struct.code_ent** %579, align 8
  %580 = load %struct.code_ent*, %struct.code_ent** %23, align 8
  %581 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %582 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %581, i32 0, i32 8
  store %struct.code_ent* %580, %struct.code_ent** %582, align 8
  %583 = load i64, i64* %12, align 8
  %584 = icmp sgt i64 %583, 0
  br i1 %584, label %585, label %594

; <label>:585:                                    ; preds = %554
  %pgocount34 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 22)
  %586 = add i64 %pgocount34, 1
  store i64 %586, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 22)
  %587 = load %struct.tiff*, %struct.tiff** %6, align 8
  %588 = getelementptr inbounds %struct.tiff, %struct.tiff* %587, i32 0, i32 0
  %589 = load i8*, i8** %588, align 8
  %590 = load %struct.tiff*, %struct.tiff** %6, align 8
  %591 = getelementptr inbounds %struct.tiff, %struct.tiff* %590, i32 0, i32 11
  %592 = load i32, i32* %591, align 8
  %593 = load i64, i64* %12, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %589, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.10, i32 0, i32 0), i32 %592, i64 %593)
  store i32 0, i32* %5, align 4
  br label %596

; <label>:594:                                    ; preds = %554
  %pgocount35 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 25)
  %595 = add i64 %pgocount35, 1
  store i64 %595, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_tmp1.ll_LZWDecode, i64 0, i64 25)
  store i32 1, i32* %5, align 4
  br label %596

; <label>:596:                                    ; preds = %594, %585, %114
  %597 = load i32, i32* %5, align 4
  ret i32 %597
}

; Function Attrs: nounwind uwtable
define internal i32 @_LZWtrue(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__LZWtrue, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__LZWtrue, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  ret i32 1
}

declare i32 @_TIFFNoPreCode(%struct.tiff*, i16 zeroext) #2

declare i32 @_TIFFNoRowEncode(%struct.tiff*, i8*, i32, i16 zeroext) #2

declare i32 @_TIFFNoStripEncode(%struct.tiff*, i8*, i32, i16 zeroext) #2

declare i32 @_TIFFNoTileEncode(%struct.tiff*, i8*, i32, i16 zeroext) #2

; Function Attrs: nounwind uwtable
define internal void @LZWCleanup(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %3 = load %struct.tiff*, %struct.tiff** %2, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %3, i32 0, i32 37
  %5 = load i8*, i8** %4, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %40

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i64 0, i64 1)
  %9 = load %struct.tiff*, %struct.tiff** %2, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %34

; <label>:13:                                     ; preds = %7
  %14 = load %struct.tiff*, %struct.tiff** %2, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 37
  %16 = load i8*, i8** %15, align 8
  %17 = bitcast i8* %16 to %struct.LZWBaseState*
  %18 = bitcast %struct.LZWBaseState* %17 to %struct.LZWDecodeState*
  %19 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %18, i32 0, i32 9
  %20 = load %struct.code_ent*, %struct.code_ent** %19, align 8
  %21 = icmp ne %struct.code_ent* %20, null
  br i1 %21, label %22, label %32

; <label>:22:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i64 0, i64 3)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i64 0, i64 3)
  %24 = load %struct.tiff*, %struct.tiff** %2, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %24, i32 0, i32 37
  %26 = load i8*, i8** %25, align 8
  %27 = bitcast i8* %26 to %struct.LZWBaseState*
  %28 = bitcast %struct.LZWBaseState* %27 to %struct.LZWDecodeState*
  %29 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %28, i32 0, i32 9
  %30 = load %struct.code_ent*, %struct.code_ent** %29, align 8
  %31 = bitcast %struct.code_ent* %30 to i8*
  call void @_TIFFfree(i8* %31)
  br label %32

; <label>:32:                                     ; preds = %22, %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i64 0, i64 2)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i64 0, i64 2)
  br label %34

; <label>:34:                                     ; preds = %32, %7
  %35 = load %struct.tiff*, %struct.tiff** %2, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %35, i32 0, i32 37
  %37 = load i8*, i8** %36, align 8
  call void @_TIFFfree(i8* %37)
  %38 = load %struct.tiff*, %struct.tiff** %2, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %38, i32 0, i32 37
  store i8* null, i8** %39, align 8
  br label %40

; <label>:40:                                     ; preds = %34, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i64 0, i64 0)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_LZWCleanup, i64 0, i64 0)
  ret void
}

declare i32 @TIFFPredictorInit(%struct.tiff*) #2

declare void @TIFFError(i8*, i8*, ...) #2

declare void @TIFFWarning(i8*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal i32 @LZWDecodeCompat(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca %struct.LZWDecodeState*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca %struct.code_ent*, align 8
  %21 = alloca %struct.code_ent*, align 8
  %22 = alloca %struct.code_ent*, align 8
  %23 = alloca %struct.code_ent*, align 8
  %24 = alloca i64, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %25 = load %struct.tiff*, %struct.tiff** %6, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 37
  %27 = load i8*, i8** %26, align 8
  %28 = bitcast i8* %27 to %struct.LZWBaseState*
  %29 = bitcast %struct.LZWBaseState* %28 to %struct.LZWDecodeState*
  store %struct.LZWDecodeState* %29, %struct.LZWDecodeState** %10, align 8
  %30 = load i8*, i8** %7, align 8
  store i8* %30, i8** %11, align 8
  %31 = load i32, i32* %8, align 4
  %32 = sext i32 %31 to i64
  store i64 %32, i64* %12, align 8
  %33 = load i16, i16* %9, align 2
  %34 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %35 = icmp ne %struct.LZWDecodeState* %34, null
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %4
  br label %40

; <label>:37:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 25)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 25)
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 504, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.LZWDecodeCompat, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %40

; <label>:40:                                     ; preds = %39, %36
  %41 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %42 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %41, i32 0, i32 2
  %43 = load i64, i64* %42, align 8
  %44 = icmp ne i64 %43, 0
  br i1 %44, label %45, label %122

; <label>:45:                                     ; preds = %40
  %46 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %47 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %46, i32 0, i32 5
  %48 = load %struct.code_ent*, %struct.code_ent** %47, align 8
  store %struct.code_ent* %48, %struct.code_ent** %20, align 8
  %49 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %50 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %49, i32 0, i32 1
  %51 = load i16, i16* %50, align 8
  %52 = zext i16 %51 to i64
  %53 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %54 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %53, i32 0, i32 2
  %55 = load i64, i64* %54, align 8
  %56 = sub nsw i64 %52, %55
  store i64 %56, i64* %24, align 8
  %57 = load i64, i64* %24, align 8
  %58 = load i64, i64* %12, align 8
  %59 = icmp sgt i64 %57, %58
  br i1 %59, label %60, label %96

; <label>:60:                                     ; preds = %45
  %61 = load i64, i64* %12, align 8
  %62 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %63 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %62, i32 0, i32 2
  %64 = load i64, i64* %63, align 8
  %65 = add nsw i64 %64, %61
  store i64 %65, i64* %63, align 8
  br label %66

; <label>:66:                                     ; preds = %71, %60
  %pgocount1 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 1)
  %67 = add i64 %pgocount1, 1
  store i64 %67, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 1)
  %68 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %69 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %68, i32 0, i32 0
  %70 = load %struct.code_ent*, %struct.code_ent** %69, align 8
  store %struct.code_ent* %70, %struct.code_ent** %20, align 8
  br label %71

; <label>:71:                                     ; preds = %66
  %72 = load i64, i64* %24, align 8
  %73 = add nsw i64 %72, -1
  store i64 %73, i64* %24, align 8
  %74 = load i64, i64* %12, align 8
  %75 = icmp sgt i64 %73, %74
  br i1 %75, label %66, label %76

; <label>:76:                                     ; preds = %71
  %77 = load i8*, i8** %11, align 8
  %78 = load i64, i64* %12, align 8
  %79 = getelementptr inbounds i8, i8* %77, i64 %78
  store i8* %79, i8** %13, align 8
  br label %80

; <label>:80:                                     ; preds = %90, %76
  %pgocount2 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 2)
  %81 = add i64 %pgocount2, 1
  store i64 %81, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 2)
  %82 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %83 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %82, i32 0, i32 2
  %84 = load i8, i8* %83, align 2
  %85 = load i8*, i8** %13, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 -1
  store i8* %86, i8** %13, align 8
  store i8 %84, i8* %86, align 1
  %87 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %88 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %87, i32 0, i32 0
  %89 = load %struct.code_ent*, %struct.code_ent** %88, align 8
  store %struct.code_ent* %89, %struct.code_ent** %20, align 8
  br label %90

; <label>:90:                                     ; preds = %80
  %91 = load i64, i64* %12, align 8
  %92 = add nsw i64 %91, -1
  store i64 %92, i64* %12, align 8
  %93 = icmp ne i64 %92, 0
  br i1 %93, label %80, label %94

; <label>:94:                                     ; preds = %90
  %pgocount3 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 17)
  %95 = add i64 %pgocount3, 1
  store i64 %95, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 17)
  store i32 1, i32* %5, align 4
  br label %530

; <label>:96:                                     ; preds = %45
  %97 = load i64, i64* %24, align 8
  %98 = load i8*, i8** %11, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 %97
  store i8* %99, i8** %11, align 8
  %100 = load i64, i64* %24, align 8
  %101 = load i64, i64* %12, align 8
  %102 = sub nsw i64 %101, %100
  store i64 %102, i64* %12, align 8
  %103 = load i8*, i8** %11, align 8
  store i8* %103, i8** %13, align 8
  br label %104

; <label>:104:                                    ; preds = %114, %96
  %pgocount4 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 3)
  %105 = add i64 %pgocount4, 1
  store i64 %105, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 3)
  %106 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %107 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %106, i32 0, i32 2
  %108 = load i8, i8* %107, align 2
  %109 = load i8*, i8** %13, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 -1
  store i8* %110, i8** %13, align 8
  store i8 %108, i8* %110, align 1
  %111 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %112 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %111, i32 0, i32 0
  %113 = load %struct.code_ent*, %struct.code_ent** %112, align 8
  store %struct.code_ent* %113, %struct.code_ent** %20, align 8
  br label %114

; <label>:114:                                    ; preds = %104
  %115 = load i64, i64* %24, align 8
  %116 = add nsw i64 %115, -1
  store i64 %116, i64* %24, align 8
  %117 = icmp ne i64 %116, 0
  br i1 %117, label %104, label %118

; <label>:118:                                    ; preds = %114
  %pgocount5 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 18)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 18)
  %120 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %121 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %120, i32 0, i32 2
  store i64 0, i64* %121, align 8
  br label %122

; <label>:122:                                    ; preds = %118, %40
  %123 = load %struct.tiff*, %struct.tiff** %6, align 8
  %124 = getelementptr inbounds %struct.tiff, %struct.tiff* %123, i32 0, i32 42
  %125 = load i8*, i8** %124, align 8
  store i8* %125, i8** %14, align 8
  %126 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %127 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %126, i32 0, i32 0
  %128 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %127, i32 0, i32 1
  %129 = load i16, i16* %128, align 8
  %130 = zext i16 %129 to i32
  store i32 %130, i32* %16, align 4
  %131 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %132 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %131, i32 0, i32 0
  %133 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %132, i32 0, i32 4
  %134 = load i64, i64* %133, align 8
  store i64 %134, i64* %18, align 8
  %135 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %136 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %135, i32 0, i32 0
  %137 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %136, i32 0, i32 5
  %138 = load i64, i64* %137, align 8
  store i64 %138, i64* %17, align 8
  %139 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %140 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %139, i32 0, i32 1
  %141 = load i64, i64* %140, align 8
  store i64 %141, i64* %19, align 8
  %142 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %143 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %142, i32 0, i32 6
  %144 = load %struct.code_ent*, %struct.code_ent** %143, align 8
  store %struct.code_ent* %144, %struct.code_ent** %23, align 8
  %145 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %146 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %145, i32 0, i32 7
  %147 = load %struct.code_ent*, %struct.code_ent** %146, align 8
  store %struct.code_ent* %147, %struct.code_ent** %21, align 8
  %148 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %149 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %148, i32 0, i32 8
  %150 = load %struct.code_ent*, %struct.code_ent** %149, align 8
  store %struct.code_ent* %150, %struct.code_ent** %22, align 8
  br label %151

; <label>:151:                                    ; preds = %487, %301, %122
  %152 = load i64, i64* %12, align 8
  %153 = icmp sgt i64 %152, 0
  br i1 %153, label %154, label %488

; <label>:154:                                    ; preds = %151
  %155 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %156 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %155, i32 0, i32 3
  %157 = load i64, i64* %156, align 8
  %158 = load i32, i32* %16, align 4
  %159 = sext i32 %158 to i64
  %160 = icmp slt i64 %157, %159
  br i1 %160, label %161, label %168

; <label>:161:                                    ; preds = %154
  %162 = load %struct.tiff*, %struct.tiff** %6, align 8
  %163 = getelementptr inbounds %struct.tiff, %struct.tiff* %162, i32 0, i32 0
  %164 = load i8*, i8** %163, align 8
  %165 = load %struct.tiff*, %struct.tiff** %6, align 8
  %166 = getelementptr inbounds %struct.tiff, %struct.tiff* %165, i32 0, i32 13
  %167 = load i32, i32* %166, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %164, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i32 0, i32 0), i32 %167)
  store i32 257, i32* %15, align 4
  br label %216

; <label>:168:                                    ; preds = %154
  %169 = load i8*, i8** %14, align 8
  %170 = getelementptr inbounds i8, i8* %169, i32 1
  store i8* %170, i8** %14, align 8
  %171 = load i8, i8* %169, align 1
  %172 = zext i8 %171 to i64
  %173 = load i64, i64* %17, align 8
  %174 = shl i64 %172, %173
  %175 = load i64, i64* %18, align 8
  %176 = or i64 %175, %174
  store i64 %176, i64* %18, align 8
  %177 = load i64, i64* %17, align 8
  %178 = add nsw i64 %177, 8
  store i64 %178, i64* %17, align 8
  %179 = load i64, i64* %17, align 8
  %180 = load i32, i32* %16, align 4
  %181 = sext i32 %180 to i64
  %182 = icmp slt i64 %179, %181
  br i1 %182, label %183, label %195

; <label>:183:                                    ; preds = %168
  %pgocount6 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 5)
  %184 = add i64 %pgocount6, 1
  store i64 %184, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 5)
  %185 = load i8*, i8** %14, align 8
  %186 = getelementptr inbounds i8, i8* %185, i32 1
  store i8* %186, i8** %14, align 8
  %187 = load i8, i8* %185, align 1
  %188 = zext i8 %187 to i64
  %189 = load i64, i64* %17, align 8
  %190 = shl i64 %188, %189
  %191 = load i64, i64* %18, align 8
  %192 = or i64 %191, %190
  store i64 %192, i64* %18, align 8
  %193 = load i64, i64* %17, align 8
  %194 = add nsw i64 %193, 8
  store i64 %194, i64* %17, align 8
  br label %195

; <label>:195:                                    ; preds = %183, %168
  %pgocount7 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 4)
  %196 = add i64 %pgocount7, 1
  store i64 %196, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 4)
  %197 = load i64, i64* %18, align 8
  %198 = load i64, i64* %19, align 8
  %199 = and i64 %197, %198
  %200 = trunc i64 %199 to i16
  %201 = zext i16 %200 to i32
  store i32 %201, i32* %15, align 4
  %202 = load i32, i32* %16, align 4
  %203 = load i64, i64* %18, align 8
  %204 = zext i32 %202 to i64
  %205 = ashr i64 %203, %204
  store i64 %205, i64* %18, align 8
  %206 = load i32, i32* %16, align 4
  %207 = sext i32 %206 to i64
  %208 = load i64, i64* %17, align 8
  %209 = sub nsw i64 %208, %207
  store i64 %209, i64* %17, align 8
  %210 = load i32, i32* %16, align 4
  %211 = sext i32 %210 to i64
  %212 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %213 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %212, i32 0, i32 3
  %214 = load i64, i64* %213, align 8
  %215 = sub nsw i64 %214, %211
  store i64 %215, i64* %213, align 8
  br label %216

; <label>:216:                                    ; preds = %195, %161
  %217 = load i32, i32* %15, align 4
  %218 = icmp eq i32 %217, 257
  br i1 %218, label %219, label %221

; <label>:219:                                    ; preds = %216
  %pgocount8 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 20)
  %220 = add i64 %pgocount8, 1
  store i64 %220, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 20)
  br label %488

; <label>:221:                                    ; preds = %216
  %222 = load i32, i32* %15, align 4
  %223 = icmp eq i32 %222, 256
  br i1 %223, label %224, label %314

; <label>:224:                                    ; preds = %221
  %225 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %226 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %225, i32 0, i32 9
  %227 = load %struct.code_ent*, %struct.code_ent** %226, align 8
  %228 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %227, i64 258
  store %struct.code_ent* %228, %struct.code_ent** %21, align 8
  store i32 9, i32* %16, align 4
  store i64 511, i64* %19, align 8
  %229 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %230 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %229, i32 0, i32 9
  %231 = load %struct.code_ent*, %struct.code_ent** %230, align 8
  %232 = load i64, i64* %19, align 8
  %233 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %231, i64 %232
  store %struct.code_ent* %233, %struct.code_ent** %22, align 8
  %234 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %235 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %234, i32 0, i32 3
  %236 = load i64, i64* %235, align 8
  %237 = load i32, i32* %16, align 4
  %238 = sext i32 %237 to i64
  %239 = icmp slt i64 %236, %238
  br i1 %239, label %240, label %248

; <label>:240:                                    ; preds = %224
  %pgocount9 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 6)
  %241 = add i64 %pgocount9, 1
  store i64 %241, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 6)
  %242 = load %struct.tiff*, %struct.tiff** %6, align 8
  %243 = getelementptr inbounds %struct.tiff, %struct.tiff* %242, i32 0, i32 0
  %244 = load i8*, i8** %243, align 8
  %245 = load %struct.tiff*, %struct.tiff** %6, align 8
  %246 = getelementptr inbounds %struct.tiff, %struct.tiff* %245, i32 0, i32 13
  %247 = load i32, i32* %246, align 8
  call void (i8*, i8*, ...) @TIFFWarning(i8* %244, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i32 0, i32 0), i32 %247)
  store i32 257, i32* %15, align 4
  br label %296

; <label>:248:                                    ; preds = %224
  %249 = load i8*, i8** %14, align 8
  %250 = getelementptr inbounds i8, i8* %249, i32 1
  store i8* %250, i8** %14, align 8
  %251 = load i8, i8* %249, align 1
  %252 = zext i8 %251 to i64
  %253 = load i64, i64* %17, align 8
  %254 = shl i64 %252, %253
  %255 = load i64, i64* %18, align 8
  %256 = or i64 %255, %254
  store i64 %256, i64* %18, align 8
  %257 = load i64, i64* %17, align 8
  %258 = add nsw i64 %257, 8
  store i64 %258, i64* %17, align 8
  %259 = load i64, i64* %17, align 8
  %260 = load i32, i32* %16, align 4
  %261 = sext i32 %260 to i64
  %262 = icmp slt i64 %259, %261
  br i1 %262, label %263, label %275

; <label>:263:                                    ; preds = %248
  %pgocount10 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 14)
  %264 = add i64 %pgocount10, 1
  store i64 %264, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 14)
  %265 = load i8*, i8** %14, align 8
  %266 = getelementptr inbounds i8, i8* %265, i32 1
  store i8* %266, i8** %14, align 8
  %267 = load i8, i8* %265, align 1
  %268 = zext i8 %267 to i64
  %269 = load i64, i64* %17, align 8
  %270 = shl i64 %268, %269
  %271 = load i64, i64* %18, align 8
  %272 = or i64 %271, %270
  store i64 %272, i64* %18, align 8
  %273 = load i64, i64* %17, align 8
  %274 = add nsw i64 %273, 8
  store i64 %274, i64* %17, align 8
  br label %275

; <label>:275:                                    ; preds = %263, %248
  %pgocount11 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 7)
  %276 = add i64 %pgocount11, 1
  store i64 %276, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 7)
  %277 = load i64, i64* %18, align 8
  %278 = load i64, i64* %19, align 8
  %279 = and i64 %277, %278
  %280 = trunc i64 %279 to i16
  %281 = zext i16 %280 to i32
  store i32 %281, i32* %15, align 4
  %282 = load i32, i32* %16, align 4
  %283 = load i64, i64* %18, align 8
  %284 = zext i32 %282 to i64
  %285 = ashr i64 %283, %284
  store i64 %285, i64* %18, align 8
  %286 = load i32, i32* %16, align 4
  %287 = sext i32 %286 to i64
  %288 = load i64, i64* %17, align 8
  %289 = sub nsw i64 %288, %287
  store i64 %289, i64* %17, align 8
  %290 = load i32, i32* %16, align 4
  %291 = sext i32 %290 to i64
  %292 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %293 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %292, i32 0, i32 3
  %294 = load i64, i64* %293, align 8
  %295 = sub nsw i64 %294, %291
  store i64 %295, i64* %293, align 8
  br label %296

; <label>:296:                                    ; preds = %275, %240
  %297 = load i32, i32* %15, align 4
  %298 = icmp eq i32 %297, 257
  br i1 %298, label %299, label %301

; <label>:299:                                    ; preds = %296
  %pgocount12 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 21)
  %300 = add i64 %pgocount12, 1
  store i64 %300, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 21)
  br label %488

; <label>:301:                                    ; preds = %296
  %302 = load i32, i32* %15, align 4
  %303 = trunc i32 %302 to i8
  %304 = load i8*, i8** %11, align 8
  %305 = getelementptr inbounds i8, i8* %304, i32 1
  store i8* %305, i8** %11, align 8
  store i8 %303, i8* %304, align 1
  %306 = load i64, i64* %12, align 8
  %307 = add nsw i64 %306, -1
  store i64 %307, i64* %12, align 8
  %308 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %309 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %308, i32 0, i32 9
  %310 = load %struct.code_ent*, %struct.code_ent** %309, align 8
  %311 = load i32, i32* %15, align 4
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %310, i64 %312
  store %struct.code_ent* %313, %struct.code_ent** %23, align 8
  br label %151

; <label>:314:                                    ; preds = %221
  %315 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %316 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %315, i32 0, i32 9
  %317 = load %struct.code_ent*, %struct.code_ent** %316, align 8
  %318 = load i32, i32* %15, align 4
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %317, i64 %319
  store %struct.code_ent* %320, %struct.code_ent** %20, align 8
  %321 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %322 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %321, i32 0, i32 9
  %323 = load %struct.code_ent*, %struct.code_ent** %322, align 8
  %324 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %323, i64 0
  %325 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %326 = icmp ule %struct.code_ent* %324, %325
  br i1 %326, label %327, label %336

; <label>:327:                                    ; preds = %314
  %328 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %329 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %330 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %329, i32 0, i32 9
  %331 = load %struct.code_ent*, %struct.code_ent** %330, align 8
  %332 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %331, i64 5119
  %333 = icmp ult %struct.code_ent* %328, %332
  br i1 %333, label %335, label %._crit_edge

._crit_edge:                                      ; preds = %327
  %pgocount13 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 23)
  %334 = add i64 %pgocount13, 1
  store i64 %334, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 23)
  br label %336

; <label>:335:                                    ; preds = %327
  br label %339

; <label>:336:                                    ; preds = %._crit_edge, %314
  %pgocount14 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 24)
  %337 = add i64 %pgocount14, 1
  store i64 %337, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 24)
  call void @__assert_fail(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 573, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.LZWDecodeCompat, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %339

; <label>:339:                                    ; preds = %338, %335
  %340 = load %struct.code_ent*, %struct.code_ent** %23, align 8
  %341 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %342 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %341, i32 0, i32 0
  store %struct.code_ent* %340, %struct.code_ent** %342, align 8
  %343 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %344 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %343, i32 0, i32 0
  %345 = load %struct.code_ent*, %struct.code_ent** %344, align 8
  %346 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %345, i32 0, i32 3
  %347 = load i8, i8* %346, align 1
  %348 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %349 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %348, i32 0, i32 3
  store i8 %347, i8* %349, align 1
  %350 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %351 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %350, i32 0, i32 0
  %352 = load %struct.code_ent*, %struct.code_ent** %351, align 8
  %353 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %352, i32 0, i32 1
  %354 = load i16, i16* %353, align 8
  %355 = zext i16 %354 to i32
  %356 = add nsw i32 %355, 1
  %357 = trunc i32 %356 to i16
  %358 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %359 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %358, i32 0, i32 1
  store i16 %357, i16* %359, align 8
  %360 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %361 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %362 = icmp ult %struct.code_ent* %360, %361
  br i1 %362, label %363, label %368

; <label>:363:                                    ; preds = %339
  %364 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %365 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %364, i32 0, i32 3
  %366 = load i8, i8* %365, align 1
  %367 = zext i8 %366 to i32
  br label %374

; <label>:368:                                    ; preds = %339
  %pgocount15 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 8)
  %369 = add i64 %pgocount15, 1
  store i64 %369, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 8)
  %370 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %371 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %370, i32 0, i32 3
  %372 = load i8, i8* %371, align 1
  %373 = zext i8 %372 to i32
  br label %374

; <label>:374:                                    ; preds = %368, %363
  %375 = phi i32 [ %367, %363 ], [ %373, %368 ]
  %376 = trunc i32 %375 to i8
  %377 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %378 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %377, i32 0, i32 2
  store i8 %376, i8* %378, align 2
  %379 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %380 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %379, i32 1
  store %struct.code_ent* %380, %struct.code_ent** %21, align 8
  %381 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %382 = icmp ugt %struct.code_ent* %380, %381
  br i1 %382, label %383, label %400

; <label>:383:                                    ; preds = %374
  %384 = load i32, i32* %16, align 4
  %385 = add nsw i32 %384, 1
  store i32 %385, i32* %16, align 4
  %386 = icmp sgt i32 %385, 12
  br i1 %386, label %387, label %389

; <label>:387:                                    ; preds = %383
  %pgocount16 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 15)
  %388 = add i64 %pgocount16, 1
  store i64 %388, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 15)
  store i32 12, i32* %16, align 4
  br label %389

; <label>:389:                                    ; preds = %387, %383
  %pgocount17 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 9)
  %390 = add i64 %pgocount17, 1
  store i64 %390, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 9)
  %391 = load i32, i32* %16, align 4
  %392 = zext i32 %391 to i64
  %393 = shl i64 1, %392
  %394 = sub nsw i64 %393, 1
  store i64 %394, i64* %19, align 8
  %395 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %396 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %395, i32 0, i32 9
  %397 = load %struct.code_ent*, %struct.code_ent** %396, align 8
  %398 = load i64, i64* %19, align 8
  %399 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %397, i64 %398
  store %struct.code_ent* %399, %struct.code_ent** %22, align 8
  br label %400

; <label>:400:                                    ; preds = %389, %374
  %401 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  store %struct.code_ent* %401, %struct.code_ent** %23, align 8
  %402 = load i32, i32* %15, align 4
  %403 = icmp sge i32 %402, 256
  br i1 %403, label %404, label %479

; <label>:404:                                    ; preds = %400
  %405 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %406 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %405, i32 0, i32 1
  %407 = load i16, i16* %406, align 8
  %408 = zext i16 %407 to i64
  %409 = load i64, i64* %12, align 8
  %410 = icmp sgt i64 %408, %409
  br i1 %410, label %411, label %450

; <label>:411:                                    ; preds = %404
  %412 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %413 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %414 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %413, i32 0, i32 5
  store %struct.code_ent* %412, %struct.code_ent** %414, align 8
  br label %415

; <label>:415:                                    ; preds = %420, %411
  %pgocount18 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 10)
  %416 = add i64 %pgocount18, 1
  store i64 %416, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 10)
  %417 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %418 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %417, i32 0, i32 0
  %419 = load %struct.code_ent*, %struct.code_ent** %418, align 8
  store %struct.code_ent* %419, %struct.code_ent** %20, align 8
  br label %420

; <label>:420:                                    ; preds = %415
  %421 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %422 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %421, i32 0, i32 1
  %423 = load i16, i16* %422, align 8
  %424 = zext i16 %423 to i64
  %425 = load i64, i64* %12, align 8
  %426 = icmp sgt i64 %424, %425
  br i1 %426, label %415, label %427

; <label>:427:                                    ; preds = %420
  %428 = load i64, i64* %12, align 8
  %429 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %430 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %429, i32 0, i32 2
  store i64 %428, i64* %430, align 8
  %431 = load i8*, i8** %11, align 8
  %432 = load i64, i64* %12, align 8
  %433 = getelementptr inbounds i8, i8* %431, i64 %432
  store i8* %433, i8** %13, align 8
  br label %434

; <label>:434:                                    ; preds = %444, %427
  %pgocount19 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 11)
  %435 = add i64 %pgocount19, 1
  store i64 %435, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 11)
  %436 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %437 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %436, i32 0, i32 2
  %438 = load i8, i8* %437, align 2
  %439 = load i8*, i8** %13, align 8
  %440 = getelementptr inbounds i8, i8* %439, i32 -1
  store i8* %440, i8** %13, align 8
  store i8 %438, i8* %440, align 1
  %441 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %442 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %441, i32 0, i32 0
  %443 = load %struct.code_ent*, %struct.code_ent** %442, align 8
  store %struct.code_ent* %443, %struct.code_ent** %20, align 8
  br label %444

; <label>:444:                                    ; preds = %434
  %445 = load i64, i64* %12, align 8
  %446 = add nsw i64 %445, -1
  store i64 %446, i64* %12, align 8
  %447 = icmp ne i64 %446, 0
  br i1 %447, label %434, label %448

; <label>:448:                                    ; preds = %444
  %pgocount20 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 22)
  %449 = add i64 %pgocount20, 1
  store i64 %449, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 22)
  br label %488

; <label>:450:                                    ; preds = %404
  %pgocount21 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 13)
  %451 = add i64 %pgocount21, 1
  store i64 %451, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 13)
  %452 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %453 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %452, i32 0, i32 1
  %454 = load i16, i16* %453, align 8
  %455 = zext i16 %454 to i32
  %456 = load i8*, i8** %11, align 8
  %457 = sext i32 %455 to i64
  %458 = getelementptr inbounds i8, i8* %456, i64 %457
  store i8* %458, i8** %11, align 8
  %459 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %460 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %459, i32 0, i32 1
  %461 = load i16, i16* %460, align 8
  %462 = zext i16 %461 to i64
  %463 = load i64, i64* %12, align 8
  %464 = sub nsw i64 %463, %462
  store i64 %464, i64* %12, align 8
  %465 = load i8*, i8** %11, align 8
  store i8* %465, i8** %13, align 8
  br label %466

; <label>:466:                                    ; preds = %473, %450
  %pgocount22 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 0)
  %467 = add i64 %pgocount22, 1
  store i64 %467, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 0)
  %468 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %469 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %468, i32 0, i32 2
  %470 = load i8, i8* %469, align 2
  %471 = load i8*, i8** %13, align 8
  %472 = getelementptr inbounds i8, i8* %471, i32 -1
  store i8* %472, i8** %13, align 8
  store i8 %470, i8* %472, align 1
  br label %473

; <label>:473:                                    ; preds = %466
  %474 = load %struct.code_ent*, %struct.code_ent** %20, align 8
  %475 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %474, i32 0, i32 0
  %476 = load %struct.code_ent*, %struct.code_ent** %475, align 8
  store %struct.code_ent* %476, %struct.code_ent** %20, align 8
  %477 = icmp ne %struct.code_ent* %476, null
  br i1 %477, label %466, label %478

; <label>:478:                                    ; preds = %473
  br label %487

; <label>:479:                                    ; preds = %400
  %pgocount23 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 12)
  %480 = add i64 %pgocount23, 1
  store i64 %480, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 12)
  %481 = load i32, i32* %15, align 4
  %482 = trunc i32 %481 to i8
  %483 = load i8*, i8** %11, align 8
  %484 = getelementptr inbounds i8, i8* %483, i32 1
  store i8* %484, i8** %11, align 8
  store i8 %482, i8* %483, align 1
  %485 = load i64, i64* %12, align 8
  %486 = add nsw i64 %485, -1
  store i64 %486, i64* %12, align 8
  br label %487

; <label>:487:                                    ; preds = %479, %478
  br label %151

; <label>:488:                                    ; preds = %448, %299, %219, %151
  %489 = load i8*, i8** %14, align 8
  %490 = load %struct.tiff*, %struct.tiff** %6, align 8
  %491 = getelementptr inbounds %struct.tiff, %struct.tiff* %490, i32 0, i32 42
  store i8* %489, i8** %491, align 8
  %492 = load i32, i32* %16, align 4
  %493 = trunc i32 %492 to i16
  %494 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %495 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %494, i32 0, i32 0
  %496 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %495, i32 0, i32 1
  store i16 %493, i16* %496, align 8
  %497 = load i64, i64* %18, align 8
  %498 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %499 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %498, i32 0, i32 0
  %500 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %499, i32 0, i32 4
  store i64 %497, i64* %500, align 8
  %501 = load i64, i64* %17, align 8
  %502 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %503 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %502, i32 0, i32 0
  %504 = getelementptr inbounds %struct.LZWBaseState, %struct.LZWBaseState* %503, i32 0, i32 5
  store i64 %501, i64* %504, align 8
  %505 = load i64, i64* %19, align 8
  %506 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %507 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %506, i32 0, i32 1
  store i64 %505, i64* %507, align 8
  %508 = load %struct.code_ent*, %struct.code_ent** %23, align 8
  %509 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %510 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %509, i32 0, i32 6
  store %struct.code_ent* %508, %struct.code_ent** %510, align 8
  %511 = load %struct.code_ent*, %struct.code_ent** %21, align 8
  %512 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %513 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %512, i32 0, i32 7
  store %struct.code_ent* %511, %struct.code_ent** %513, align 8
  %514 = load %struct.code_ent*, %struct.code_ent** %22, align 8
  %515 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %516 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %515, i32 0, i32 8
  store %struct.code_ent* %514, %struct.code_ent** %516, align 8
  %517 = load i64, i64* %12, align 8
  %518 = icmp sgt i64 %517, 0
  br i1 %518, label %519, label %528

; <label>:519:                                    ; preds = %488
  %pgocount24 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 16)
  %520 = add i64 %pgocount24, 1
  store i64 %520, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 16)
  %521 = load %struct.tiff*, %struct.tiff** %6, align 8
  %522 = getelementptr inbounds %struct.tiff, %struct.tiff* %521, i32 0, i32 0
  %523 = load i8*, i8** %522, align 8
  %524 = load %struct.tiff*, %struct.tiff** %6, align 8
  %525 = getelementptr inbounds %struct.tiff, %struct.tiff* %524, i32 0, i32 11
  %526 = load i32, i32* %525, align 8
  %527 = load i64, i64* %12, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %523, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.9, i32 0, i32 0), i32 %526, i64 %527)
  store i32 0, i32* %5, align 4
  br label %530

; <label>:528:                                    ; preds = %488
  %pgocount25 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 19)
  %529 = add i64 %pgocount25, 1
  store i64 %529, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_LZWDecodeCompat, i64 0, i64 19)
  store i32 1, i32* %5, align 4
  br label %530

; <label>:530:                                    ; preds = %528, %519, %94
  %531 = load i32, i32* %5, align 4
  ret i32 %531
}

declare void @_TIFFmemset(i8*, i32, i32) #2

; Function Attrs: nounwind uwtable
define internal void @codeLoop(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_codeLoop, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_codeLoop, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 0
  %6 = load i8*, i8** %5, align 8
  %7 = load %struct.tiff*, %struct.tiff** %3, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 11
  %9 = load i32, i32* %8, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %6, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.11, i32 0, i32 0), i32 %9)
  ret void
}

declare void @_TIFFfree(i8*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
