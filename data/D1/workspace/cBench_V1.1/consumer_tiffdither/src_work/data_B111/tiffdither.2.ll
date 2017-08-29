; ModuleID = 'tmp1.ll'
source_filename = "tiffdither.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.tiff = type opaque

$__llvm_profile_raw_version = comdat any

@threshold = global i32 128, align 4
@.str = private unnamed_addr constant [9 x i8] c"c:f:r:t:\00", align 1
@optarg = external global i8*, align 8
@.str.1 = private unnamed_addr constant [8 x i8] c"lsb2msb\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"msb2lsb\00", align 1
@optind = external global i32, align 4
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [22 x i8] c"%s: Not a b&w image.\0A\00", align 1
@.str.5 = private unnamed_addr constant [40 x i8] c" %s: Sorry, only handle 8-bit samples.\0A\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@imagewidth = common global i32 0, align 4
@imagelength = common global i32 0, align 4
@compression = internal global i16 -32763, align 2
@.str.7 = private unnamed_addr constant [27 x i8] c"Dithered B&W version of %s\00", align 1
@group3options = internal global i32 0, align 4
@predictor = internal global i16 0, align 2
@.str.8 = private unnamed_addr constant [49 x i8] c"usage: tiffdither [options] input.tif output.tif\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"where options are:\00", align 1
@.str.10 = private unnamed_addr constant [48 x i8] c" -r #\09\09make each strip have no more than # rows\00", align 1
@.str.11 = private unnamed_addr constant [50 x i8] c" -f lsb2msb\09force lsb-to-msb FillOrder for output\00", align 1
@.str.12 = private unnamed_addr constant [50 x i8] c" -f msb2lsb\09force msb-to-lsb FillOrder for output\00", align 1
@.str.13 = private unnamed_addr constant [64 x i8] c" -c lzw[:opts]\09compress output with Lempel-Ziv & Welch encoding\00", align 1
@.str.14 = private unnamed_addr constant [70 x i8] c"               (no longer supported due to Unisys patent enforcement)\00", align 1
@.str.15 = private unnamed_addr constant [53 x i8] c" -c zip[:opts]\09compress output with deflate encoding\00", align 1
@.str.16 = private unnamed_addr constant [52 x i8] c" -c packbits\09compress output with packbits encoding\00", align 1
@.str.17 = private unnamed_addr constant [58 x i8] c" -c g3[:opts]\09compress output with CCITT Group 3 encoding\00", align 1
@.str.18 = private unnamed_addr constant [52 x i8] c" -c g4\09\09compress output with CCITT Group 4 encoding\00", align 1
@.str.19 = private unnamed_addr constant [48 x i8] c" -c none\09use no compression algorithm on output\00", align 1
@.str.20 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.21 = private unnamed_addr constant [17 x i8] c"Group 3 options:\00", align 1
@.str.22 = private unnamed_addr constant [43 x i8] c" 1d\09\09use default CCITT Group 3 1D-encoding\00", align 1
@.str.23 = private unnamed_addr constant [44 x i8] c" 2d\09\09use optional CCITT Group 3 2D-encoding\00", align 1
@.str.24 = private unnamed_addr constant [28 x i8] c" fill\09\09byte-align EOL codes\00", align 1
@.str.25 = private unnamed_addr constant [76 x i8] c"For example, -c g3:2d:fill to get G3-2D-encoded data with byte-aligned EOLs\00", align 1
@.str.26 = private unnamed_addr constant [25 x i8] c"LZW and deflate options:\00", align 1
@.str.27 = private unnamed_addr constant [24 x i8] c" #\09\09set predictor value\00", align 1
@.str.28 = private unnamed_addr constant [75 x i8] c"For example, -c lzw:2 to get LZW-encoded data with horizontal differencing\00", align 1
@stuff = global [23 x i8*] [i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.28, i32 0, i32 0), i8* null], align 16
@.str.29 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.30 = private unnamed_addr constant [9 x i8] c"packbits\00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"g3\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"g4\00", align 1
@.str.33 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.34 = private unnamed_addr constant [4 x i8] c"zip\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"1d\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"2d\00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c"fill\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_processCompressOptions = private constant [30 x i8] c"tmp1.ll:processCompressOptions"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_fsdither = private constant [16 x i8] c"tmp1.ll:fsdither"
@__profn_tmp1.ll_processG3Options = private constant [24 x i8] c"tmp1.ll:processG3Options"
@__profc_main1 = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 342519043331, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_processCompressOptions = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_processCompressOptions = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3452952462124452750, i64 144182933962, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 38432627612, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fsdither = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fsdither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 713380537530657658, i64 244927136868, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_processG3Options = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_processG3Options = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6139449125083776402, i64 93369698436, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [94 x i8] c"\5C\00main1\01tmp1.ll:processCompressOptions\01tmp1.ll:usage\01tmp1.ll:fsdither\01tmp1.ll:processG3Options", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_processCompressOptions to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fsdither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_processG3Options to i8*), i8* getelementptr inbounds ([94 x i8], [94 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca float, align 4
  %12 = alloca [1024 x i8], align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i16, align 2
  %16 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i16 1, i16* %9, align 2
  store i32 -1, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i16 0, i16* %15, align 2
  br label %17

; <label>:17:                                     ; preds = %70, %2
  %18 = load i32, i32* %4, align 4
  %19 = load i8**, i8*** %5, align 8
  %20 = call i32 @getopt(i32 %18, i8** %19, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0)) #5
  store i32 %20, i32* %16, align 4
  %21 = icmp ne i32 %20, -1
  br i1 %21, label %22, label %71

; <label>:22:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 0)
  %24 = load i32, i32* %16, align 4
  switch i32 %24, label %70 [
    i32 99, label %25
    i32 102, label %33
    i32 114, label %49
    i32 116, label %53
    i32 63, label %68
  ]

; <label>:25:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 2)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 2)
  %27 = load i8*, i8** @optarg, align 8
  %28 = call i32 @processCompressOptions(i8* %27)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %32, label %30

; <label>:30:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 7)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 7)
  call void @usage()
  br label %32

; <label>:32:                                     ; preds = %30, %25
  br label %70

; <label>:33:                                     ; preds = %22
  %34 = load i8*, i8** @optarg, align 8
  %35 = call i32 @strcmp(i8* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0)) #6
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 8)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 8)
  store i16 2, i16* %15, align 2
  br label %48

; <label>:39:                                     ; preds = %33
  %40 = load i8*, i8** @optarg, align 8
  %41 = call i32 @strcmp(i8* %40, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0)) #6
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %39
  %pgocount4 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 11)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 11)
  store i16 1, i16* %15, align 2
  br label %47

; <label>:45:                                     ; preds = %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 6)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 6)
  call void @usage()
  br label %47

; <label>:47:                                     ; preds = %45, %43
  br label %48

; <label>:48:                                     ; preds = %47, %37
  br label %70

; <label>:49:                                     ; preds = %22
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 3)
  %50 = add i64 %pgocount6, 1
  store i64 %50, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 3)
  %51 = load i8*, i8** @optarg, align 8
  %52 = call i32 @atoi(i8* %51) #6
  store i32 %52, i32* %13, align 4
  store i32 0, i32* %14, align 4
  br label %70

; <label>:53:                                     ; preds = %22
  %54 = load i8*, i8** @optarg, align 8
  %55 = call i32 @atoi(i8* %54) #6
  store i32 %55, i32* @threshold, align 4
  %56 = load i32, i32* @threshold, align 4
  %57 = icmp slt i32 %56, 0
  br i1 %57, label %58, label %60

; <label>:58:                                     ; preds = %53
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 9)
  %59 = add i64 %pgocount7, 1
  store i64 %59, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 9)
  store i32 0, i32* @threshold, align 4
  br label %67

; <label>:60:                                     ; preds = %53
  %61 = load i32, i32* @threshold, align 4
  %62 = icmp sgt i32 %61, 255
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %60
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 10)
  %64 = add i64 %pgocount8, 1
  store i64 %64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 10)
  store i32 255, i32* @threshold, align 4
  br label %65

; <label>:65:                                     ; preds = %63, %60
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 5)
  %66 = add i64 %pgocount9, 1
  store i64 %66, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 5)
  br label %67

; <label>:67:                                     ; preds = %65, %58
  br label %70

; <label>:68:                                     ; preds = %22
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 4)
  %69 = add i64 %pgocount10, 1
  store i64 %69, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 4)
  call void @usage()
  br label %70

; <label>:70:                                     ; preds = %68, %67, %49, %48, %32, %22
  br label %17

; <label>:71:                                     ; preds = %17
  %72 = load i32, i32* %4, align 4
  %73 = load i32, i32* @optind, align 4
  %74 = sub nsw i32 %72, %73
  %75 = icmp slt i32 %74, 2
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %71
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 12)
  %77 = add i64 %pgocount11, 1
  store i64 %77, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 12)
  call void @usage()
  br label %78

; <label>:78:                                     ; preds = %76, %71
  %79 = load i8**, i8*** %5, align 8
  %80 = load i32, i32* @optind, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8*, i8** %79, i64 %81
  %83 = load i8*, i8** %82, align 8
  %84 = call %struct.tiff* @TIFFOpen(i8* %83, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store %struct.tiff* %84, %struct.tiff** %6, align 8
  %85 = load %struct.tiff*, %struct.tiff** %6, align 8
  %86 = icmp eq %struct.tiff* %85, null
  br i1 %86, label %87, label %89

; <label>:87:                                     ; preds = %78
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 13)
  %88 = add i64 %pgocount12, 1
  store i64 %88, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 13)
  store i32 -1, i32* %3, align 4
  br label %248

; <label>:89:                                     ; preds = %78
  %90 = load %struct.tiff*, %struct.tiff** %6, align 8
  %91 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %90, i32 277, i16* %8)
  %92 = load i16, i16* %8, align 2
  %93 = zext i16 %92 to i32
  %94 = icmp ne i32 %93, 1
  br i1 %94, label %95, label %102

; <label>:95:                                     ; preds = %89
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 14)
  %96 = add i64 %pgocount13, 1
  store i64 %96, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 14)
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %98 = load i8**, i8*** %5, align 8
  %99 = getelementptr inbounds i8*, i8** %98, i64 0
  %100 = load i8*, i8** %99, align 8
  %101 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0), i8* %100)
  store i32 -1, i32* %3, align 4
  br label %248

; <label>:102:                                    ; preds = %89
  %103 = load %struct.tiff*, %struct.tiff** %6, align 8
  %104 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %103, i32 258, i16* %9)
  %105 = load i16, i16* %9, align 2
  %106 = zext i16 %105 to i32
  %107 = icmp ne i32 %106, 8
  br i1 %107, label %108, label %115

; <label>:108:                                    ; preds = %102
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 15)
  %109 = add i64 %pgocount14, 1
  store i64 %109, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 15)
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %111 = load i8**, i8*** %5, align 8
  %112 = getelementptr inbounds i8*, i8** %111, i64 0
  %113 = load i8*, i8** %112, align 8
  %114 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %110, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.5, i32 0, i32 0), i8* %113)
  store i32 -1, i32* %3, align 4
  br label %248

; <label>:115:                                    ; preds = %102
  %116 = load i8**, i8*** %5, align 8
  %117 = load i32, i32* @optind, align 4
  %118 = add nsw i32 %117, 1
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8*, i8** %116, i64 %119
  %121 = load i8*, i8** %120, align 8
  %122 = call %struct.tiff* @TIFFOpen(i8* %121, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct.tiff* %122, %struct.tiff** %7, align 8
  %123 = load %struct.tiff*, %struct.tiff** %7, align 8
  %124 = icmp eq %struct.tiff* %123, null
  br i1 %124, label %125, label %127

; <label>:125:                                    ; preds = %115
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 16)
  %126 = add i64 %pgocount15, 1
  store i64 %126, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 16)
  store i32 -1, i32* %3, align 4
  br label %248

; <label>:127:                                    ; preds = %115
  %128 = load %struct.tiff*, %struct.tiff** %6, align 8
  %129 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %128, i32 256, i32* @imagewidth)
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %136

; <label>:131:                                    ; preds = %127
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 17)
  %132 = add i64 %pgocount16, 1
  store i64 %132, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 17)
  %133 = load %struct.tiff*, %struct.tiff** %7, align 8
  %134 = load i32, i32* @imagewidth, align 4
  %135 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %133, i32 256, i32 %134)
  br label %136

; <label>:136:                                    ; preds = %131, %127
  %137 = load %struct.tiff*, %struct.tiff** %6, align 8
  %138 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %137, i32 257, i32* @imagelength)
  %139 = load %struct.tiff*, %struct.tiff** %7, align 8
  %140 = load i32, i32* @imagelength, align 4
  %141 = sub i32 %140, 1
  %142 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %139, i32 257, i32 %141)
  %143 = load %struct.tiff*, %struct.tiff** %7, align 8
  %144 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %143, i32 258, i32 1)
  %145 = load %struct.tiff*, %struct.tiff** %7, align 8
  %146 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %145, i32 277, i32 1)
  %147 = load %struct.tiff*, %struct.tiff** %7, align 8
  %148 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %147, i32 284, i32 1)
  %149 = load %struct.tiff*, %struct.tiff** %7, align 8
  %150 = load i16, i16* @compression, align 2
  %151 = zext i16 %150 to i32
  %152 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %149, i32 259, i32 %151)
  %153 = load %struct.tiff*, %struct.tiff** %7, align 8
  %154 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %153, i32 262, i32 1)
  %155 = load %struct.tiff*, %struct.tiff** %7, align 8
  %156 = load i16, i16* %15, align 2
  %157 = zext i16 %156 to i32
  %158 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %155, i32 266, i32 %157)
  %159 = getelementptr inbounds [1024 x i8], [1024 x i8]* %12, i32 0, i32 0
  %160 = load i8**, i8*** %5, align 8
  %161 = load i32, i32* @optind, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i8*, i8** %160, i64 %162
  %164 = load i8*, i8** %163, align 8
  %165 = call i32 (i8*, i8*, ...) @sprintf(i8* %159, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.7, i32 0, i32 0), i8* %164) #5
  %166 = load %struct.tiff*, %struct.tiff** %7, align 8
  %167 = getelementptr inbounds [1024 x i8], [1024 x i8]* %12, i32 0, i32 0
  %168 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %166, i32 270, i8* %167)
  %169 = load %struct.tiff*, %struct.tiff** %6, align 8
  %170 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %169, i32 274, i16* %10)
  %171 = icmp ne i32 %170, 0
  br i1 %171, label %172, label %178

; <label>:172:                                    ; preds = %136
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 18)
  %173 = add i64 %pgocount17, 1
  store i64 %173, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 18)
  %174 = load %struct.tiff*, %struct.tiff** %7, align 8
  %175 = load i16, i16* %10, align 2
  %176 = zext i16 %175 to i32
  %177 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %174, i32 274, i32 %176)
  br label %178

; <label>:178:                                    ; preds = %172, %136
  %179 = load %struct.tiff*, %struct.tiff** %6, align 8
  %180 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %179, i32 282, float* %11)
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %182, label %188

; <label>:182:                                    ; preds = %178
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 19)
  %183 = add i64 %pgocount18, 1
  store i64 %183, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 19)
  %184 = load %struct.tiff*, %struct.tiff** %7, align 8
  %185 = load float, float* %11, align 4
  %186 = fpext float %185 to double
  %187 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %184, i32 282, double %186)
  br label %188

; <label>:188:                                    ; preds = %182, %178
  %189 = load %struct.tiff*, %struct.tiff** %6, align 8
  %190 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %189, i32 283, float* %11)
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %198

; <label>:192:                                    ; preds = %188
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 20)
  %193 = add i64 %pgocount19, 1
  store i64 %193, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 20)
  %194 = load %struct.tiff*, %struct.tiff** %7, align 8
  %195 = load float, float* %11, align 4
  %196 = fpext float %195 to double
  %197 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %194, i32 283, double %196)
  br label %198

; <label>:198:                                    ; preds = %192, %188
  %199 = load %struct.tiff*, %struct.tiff** %6, align 8
  %200 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %199, i32 296, i16* %10)
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %202, label %208

; <label>:202:                                    ; preds = %198
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 21)
  %203 = add i64 %pgocount20, 1
  store i64 %203, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 21)
  %204 = load %struct.tiff*, %struct.tiff** %7, align 8
  %205 = load i16, i16* %10, align 2
  %206 = zext i16 %205 to i32
  %207 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %204, i32 296, i32 %206)
  br label %208

; <label>:208:                                    ; preds = %202, %198
  %209 = load i32, i32* %14, align 4
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %215

; <label>:211:                                    ; preds = %208
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 22)
  %212 = add i64 %pgocount21, 1
  store i64 %212, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 22)
  %213 = load i32, i32* @imagelength, align 4
  %214 = sub i32 %213, 1
  store i32 %214, i32* %13, align 4
  br label %220

; <label>:215:                                    ; preds = %208
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 24)
  %216 = add i64 %pgocount22, 1
  store i64 %216, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 24)
  %217 = load %struct.tiff*, %struct.tiff** %7, align 8
  %218 = load i32, i32* %13, align 4
  %219 = call i32 @TIFFDefaultStripSize(%struct.tiff* %217, i32 %218)
  store i32 %219, i32* %13, align 4
  br label %220

; <label>:220:                                    ; preds = %215, %211
  %221 = load %struct.tiff*, %struct.tiff** %7, align 8
  %222 = load i32, i32* %13, align 4
  %223 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %221, i32 278, i32 %222)
  %224 = load i16, i16* @compression, align 2
  %225 = zext i16 %224 to i32
  switch i32 %225, label %243 [
    i32 3, label %227
    i32 5, label %._crit_edge
    i32 32946, label %232
  ]

._crit_edge:                                      ; preds = %220
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 1)
  %226 = add i64 %pgocount23, 1
  store i64 %226, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 1)
  br label %232

; <label>:227:                                    ; preds = %220
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 26)
  %228 = add i64 %pgocount24, 1
  store i64 %228, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 26)
  %229 = load %struct.tiff*, %struct.tiff** %7, align 8
  %230 = load i32, i32* @group3options, align 4
  %231 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %229, i32 292, i32 %230)
  br label %243

; <label>:232:                                    ; preds = %._crit_edge, %220
  %233 = load i16, i16* @predictor, align 2
  %234 = icmp ne i16 %233, 0
  br i1 %234, label %235, label %241

; <label>:235:                                    ; preds = %232
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 25)
  %236 = add i64 %pgocount25, 1
  store i64 %236, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 25)
  %237 = load %struct.tiff*, %struct.tiff** %7, align 8
  %238 = load i16, i16* @predictor, align 2
  %239 = zext i16 %238 to i32
  %240 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %237, i32 317, i32 %239)
  br label %241

; <label>:241:                                    ; preds = %235, %232
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 23)
  %242 = add i64 %pgocount26, 1
  store i64 %242, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_main1, i64 0, i64 23)
  br label %243

; <label>:243:                                    ; preds = %241, %227, %220
  %244 = load %struct.tiff*, %struct.tiff** %6, align 8
  %245 = load %struct.tiff*, %struct.tiff** %7, align 8
  call void @fsdither(%struct.tiff* %244, %struct.tiff* %245)
  %246 = load %struct.tiff*, %struct.tiff** %6, align 8
  call void @TIFFClose(%struct.tiff* %246)
  %247 = load %struct.tiff*, %struct.tiff** %7, align 8
  call void @TIFFClose(%struct.tiff* %247)
  store i32 0, i32* %3, align 4
  br label %248

; <label>:248:                                    ; preds = %243, %125, %108, %95, %87
  %249 = load i32, i32* %3, align 4
  ret i32 %249
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @processCompressOptions(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.29, i32 0, i32 0)) #6
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 0)
  store i16 1, i16* @compression, align 2
  br label %71

; <label>:11:                                     ; preds = %1
  %12 = load i8*, i8** %3, align 8
  %13 = call i32 @strcmp(i8* %12, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.30, i32 0, i32 0)) #6
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 1)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 1)
  store i16 -32763, i16* @compression, align 2
  br label %70

; <label>:17:                                     ; preds = %11
  %18 = load i8*, i8** %3, align 8
  %19 = call i32 @strncmp(i8* %18, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.31, i32 0, i32 0), i64 2) #6
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 2)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 2)
  %23 = load i8*, i8** %3, align 8
  call void @processG3Options(i8* %23)
  store i16 3, i16* @compression, align 2
  br label %69

; <label>:24:                                     ; preds = %17
  %25 = load i8*, i8** %3, align 8
  %26 = call i32 @strcmp(i8* %25, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0)) #6
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 3)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 3)
  store i16 4, i16* @compression, align 2
  br label %68

; <label>:30:                                     ; preds = %24
  %31 = load i8*, i8** %3, align 8
  %32 = call i32 @strncmp(i8* %31, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i32 0, i32 0), i64 3) #6
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %47

; <label>:34:                                     ; preds = %30
  %35 = load i8*, i8** %3, align 8
  %36 = call i8* @strchr(i8* %35, i32 58) #6
  store i8* %36, i8** %4, align 8
  %37 = load i8*, i8** %4, align 8
  %38 = icmp ne i8* %37, null
  br i1 %38, label %39, label %45

; <label>:39:                                     ; preds = %34
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 6)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 6)
  %41 = load i8*, i8** %4, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 1
  %43 = call i32 @atoi(i8* %42) #6
  %44 = trunc i32 %43 to i16
  store i16 %44, i16* @predictor, align 2
  br label %45

; <label>:45:                                     ; preds = %39, %34
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 5)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 5)
  store i16 5, i16* @compression, align 2
  br label %67

; <label>:47:                                     ; preds = %30
  %48 = load i8*, i8** %3, align 8
  %49 = call i32 @strncmp(i8* %48, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.34, i32 0, i32 0), i64 3) #6
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %63

; <label>:51:                                     ; preds = %47
  %52 = load i8*, i8** %3, align 8
  %53 = call i8* @strchr(i8* %52, i32 58) #6
  store i8* %53, i8** %5, align 8
  %54 = load i8*, i8** %5, align 8
  %55 = icmp ne i8* %54, null
  br i1 %55, label %56, label %62

; <label>:56:                                     ; preds = %51
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 8)
  %57 = add i64 %pgocount6, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 8)
  %58 = load i8*, i8** %5, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 1
  %60 = call i32 @atoi(i8* %59) #6
  %61 = trunc i32 %60 to i16
  store i16 %61, i16* @predictor, align 2
  br label %62

; <label>:62:                                     ; preds = %56, %51
  store i16 -32590, i16* @compression, align 2
  br label %65

; <label>:63:                                     ; preds = %47
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 4)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 4)
  store i32 0, i32* %2, align 4
  br label %72

; <label>:65:                                     ; preds = %62
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 7)
  %66 = add i64 %pgocount8, 1
  store i64 %66, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 7)
  br label %67

; <label>:67:                                     ; preds = %65, %45
  br label %68

; <label>:68:                                     ; preds = %67, %28
  br label %69

; <label>:69:                                     ; preds = %68, %21
  br label %70

; <label>:70:                                     ; preds = %69, %15
  br label %71

; <label>:71:                                     ; preds = %70, %9
  store i32 1, i32* %2, align 4
  br label %72

; <label>:72:                                     ; preds = %71, %63
  %73 = load i32, i32* %2, align 4
  ret i32 %73
}

; Function Attrs: noinline nounwind uwtable
define internal void @usage() #0 {
  %1 = alloca [8192 x i8], align 16
  %2 = alloca i32, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = getelementptr inbounds [8192 x i8], [8192 x i8]* %1, i32 0, i32 0
  call void @setbuf(%struct._IO_FILE* %3, i8* %4) #5
  store i32 0, i32* %2, align 4
  br label %5

; <label>:5:                                      ; preds = %18, %0
  %6 = load i32, i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [23 x i8*], [23 x i8*]* @stuff, i64 0, i64 %7
  %9 = load i8*, i8** %8, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %22

; <label>:11:                                     ; preds = %5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = load i32, i32* %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [23 x i8*], [23 x i8*]* @stuff, i64 0, i64 %14
  %16 = load i8*, i8** %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i32 0, i32 0), i8* %16)
  br label %18

; <label>:18:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %20 = load i32, i32* %2, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %2, align 4
  br label %5

; <label>:22:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 1)
  call void @exit(i32 1) #7
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare %struct.tiff* @TIFFOpen(i8*, i8*) #3

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) #3

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

declare i32 @TIFFDefaultStripSize(%struct.tiff*, i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @fsdither(%struct.tiff*, %struct.tiff*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.tiff* %1, %struct.tiff** %4, align 8
  %23 = load i32, i32* @imagelength, align 4
  %24 = sub i32 %23, 1
  store i32 %24, i32* %16, align 4
  %25 = load i32, i32* @imagewidth, align 4
  %26 = sub i32 %25, 1
  store i32 %26, i32* %17, align 4
  %27 = load %struct.tiff*, %struct.tiff** %3, align 8
  %28 = call i32 @TIFFScanlineSize(%struct.tiff* %27)
  %29 = call i8* @_TIFFmalloc(i32 %28)
  store i8* %29, i8** %6, align 8
  %30 = load i32, i32* @imagewidth, align 4
  %31 = zext i32 %30 to i64
  %32 = mul i64 %31, 2
  %33 = trunc i64 %32 to i32
  %34 = call i8* @_TIFFmalloc(i32 %33)
  %35 = bitcast i8* %34 to i16*
  store i16* %35, i16** %8, align 8
  %36 = load i32, i32* @imagewidth, align 4
  %37 = zext i32 %36 to i64
  %38 = mul i64 %37, 2
  %39 = trunc i64 %38 to i32
  %40 = call i8* @_TIFFmalloc(i32 %39)
  %41 = bitcast i8* %40 to i16*
  store i16* %41, i16** %9, align 8
  %42 = load %struct.tiff*, %struct.tiff** %4, align 8
  %43 = call i32 @TIFFScanlineSize(%struct.tiff* %42)
  store i32 %43, i32* %21, align 4
  %44 = load i32, i32* %21, align 4
  %45 = call i8* @_TIFFmalloc(i32 %44)
  store i8* %45, i8** %5, align 8
  %46 = load %struct.tiff*, %struct.tiff** %3, align 8
  %47 = load i8*, i8** %6, align 8
  %48 = call i32 @TIFFReadScanline(%struct.tiff* %46, i8* %47, i32 0, i16 zeroext 0)
  %49 = icmp sle i32 %48, 0
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 12)
  %51 = add i64 %pgocount, 1
  store i64 %51, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 12)
  br label %241

; <label>:52:                                     ; preds = %2
  %53 = load i8*, i8** %6, align 8
  store i8* %53, i8** %7, align 8
  %54 = load i16*, i16** %9, align 8
  store i16* %54, i16** %13, align 8
  store i32 0, i32* %15, align 4
  br label %55

; <label>:55:                                     ; preds = %66, %52
  %56 = load i32, i32* %15, align 4
  %57 = load i32, i32* @imagewidth, align 4
  %58 = icmp ult i32 %56, %57
  br i1 %58, label %59, label %70

; <label>:59:                                     ; preds = %55
  %60 = load i8*, i8** %7, align 8
  %61 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %61, i8** %7, align 8
  %62 = load i8, i8* %60, align 1
  %63 = zext i8 %62 to i16
  %64 = load i16*, i16** %13, align 8
  %65 = getelementptr inbounds i16, i16* %64, i32 1
  store i16* %65, i16** %13, align 8
  store i16 %63, i16* %64, align 2
  br label %66

; <label>:66:                                     ; preds = %59
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 10)
  %67 = add i64 %pgocount1, 1
  store i64 %67, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 10)
  %68 = load i32, i32* %15, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* %15, align 4
  br label %55

; <label>:70:                                     ; preds = %55
  store i32 1, i32* %14, align 4
  br label %71

; <label>:71:                                     ; preds = %229, %70
  %72 = load i32, i32* %14, align 4
  %73 = load i32, i32* @imagelength, align 4
  %74 = icmp ult i32 %72, %73
  br i1 %74, label %75, label %233

; <label>:75:                                     ; preds = %71
  %76 = load i16*, i16** %8, align 8
  store i16* %76, i16** %10, align 8
  %77 = load i16*, i16** %9, align 8
  store i16* %77, i16** %8, align 8
  %78 = load i16*, i16** %10, align 8
  store i16* %78, i16** %9, align 8
  %79 = load i32, i32* %14, align 4
  %80 = load i32, i32* %16, align 4
  %81 = icmp eq i32 %79, %80
  %82 = zext i1 %81 to i32
  store i32 %82, i32* %18, align 4
  %83 = load %struct.tiff*, %struct.tiff** %3, align 8
  %84 = load i8*, i8** %6, align 8
  %85 = load i32, i32* %14, align 4
  %86 = call i32 @TIFFReadScanline(%struct.tiff* %83, i8* %84, i32 %85, i16 zeroext 0)
  %87 = icmp sle i32 %86, 0
  br i1 %87, label %88, label %90

; <label>:88:                                     ; preds = %75
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 14)
  %89 = add i64 %pgocount2, 1
  store i64 %89, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 14)
  br label %233

; <label>:90:                                     ; preds = %75
  %91 = load i8*, i8** %6, align 8
  store i8* %91, i8** %7, align 8
  %92 = load i16*, i16** %9, align 8
  store i16* %92, i16** %13, align 8
  store i32 0, i32* %15, align 4
  br label %93

; <label>:93:                                     ; preds = %104, %90
  %94 = load i32, i32* %15, align 4
  %95 = load i32, i32* @imagewidth, align 4
  %96 = icmp ult i32 %94, %95
  br i1 %96, label %97, label %108

; <label>:97:                                     ; preds = %93
  %98 = load i8*, i8** %7, align 8
  %99 = getelementptr inbounds i8, i8* %98, i32 1
  store i8* %99, i8** %7, align 8
  %100 = load i8, i8* %98, align 1
  %101 = zext i8 %100 to i16
  %102 = load i16*, i16** %13, align 8
  %103 = getelementptr inbounds i16, i16* %102, i32 1
  store i16* %103, i16** %13, align 8
  store i16 %101, i16* %102, align 2
  br label %104

; <label>:104:                                    ; preds = %97
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 0)
  %105 = add i64 %pgocount3, 1
  store i64 %105, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 0)
  %106 = load i32, i32* %15, align 4
  %107 = add i32 %106, 1
  store i32 %107, i32* %15, align 4
  br label %93

; <label>:108:                                    ; preds = %93
  %109 = load i16*, i16** %8, align 8
  store i16* %109, i16** %12, align 8
  %110 = load i16*, i16** %9, align 8
  store i16* %110, i16** %13, align 8
  %111 = load i8*, i8** %5, align 8
  store i8* %111, i8** %11, align 8
  %112 = load i32, i32* %21, align 4
  call void @_TIFFmemset(i8* %111, i32 0, i32 %112)
  store i32 128, i32* %20, align 4
  store i32 0, i32* %15, align 4
  br label %113

; <label>:113:                                    ; preds = %216, %108
  %114 = load i32, i32* %15, align 4
  %115 = load i32, i32* @imagewidth, align 4
  %116 = icmp ult i32 %114, %115
  br i1 %116, label %117, label %219

; <label>:117:                                    ; preds = %113
  %118 = load i32, i32* %15, align 4
  %119 = load i32, i32* %17, align 4
  %120 = icmp eq i32 %118, %119
  %121 = zext i1 %120 to i32
  store i32 %121, i32* %19, align 4
  %122 = load i16*, i16** %12, align 8
  %123 = getelementptr inbounds i16, i16* %122, i32 1
  store i16* %123, i16** %12, align 8
  %124 = load i16, i16* %122, align 2
  %125 = sext i16 %124 to i32
  store i32 %125, i32* %22, align 4
  %126 = load i32, i32* %22, align 4
  %127 = icmp slt i32 %126, 0
  br i1 %127, label %128, label %130

; <label>:128:                                    ; preds = %117
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 3)
  %129 = add i64 %pgocount4, 1
  store i64 %129, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 3)
  store i32 0, i32* %22, align 4
  br label %137

; <label>:130:                                    ; preds = %117
  %131 = load i32, i32* %22, align 4
  %132 = icmp sgt i32 %131, 255
  br i1 %132, label %133, label %135

; <label>:133:                                    ; preds = %130
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 7)
  %134 = add i64 %pgocount5, 1
  store i64 %134, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 7)
  store i32 255, i32* %22, align 4
  br label %135

; <label>:135:                                    ; preds = %133, %130
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 1)
  %136 = add i64 %pgocount6, 1
  store i64 %136, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 1)
  br label %137

; <label>:137:                                    ; preds = %135, %128
  %138 = load i32, i32* %22, align 4
  %139 = load i32, i32* @threshold, align 4
  %140 = icmp sgt i32 %138, %139
  br i1 %140, label %141, label %151

; <label>:141:                                    ; preds = %137
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 2)
  %142 = add i64 %pgocount7, 1
  store i64 %142, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 2)
  %143 = load i32, i32* %20, align 4
  %144 = load i8*, i8** %11, align 8
  %145 = load i8, i8* %144, align 1
  %146 = zext i8 %145 to i32
  %147 = or i32 %146, %143
  %148 = trunc i32 %147 to i8
  store i8 %148, i8* %144, align 1
  %149 = load i32, i32* %22, align 4
  %150 = sub nsw i32 %149, 255
  store i32 %150, i32* %22, align 4
  br label %151

; <label>:151:                                    ; preds = %141, %137
  %152 = load i32, i32* %20, align 4
  %153 = ashr i32 %152, 1
  store i32 %153, i32* %20, align 4
  %154 = load i32, i32* %20, align 4
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %160

; <label>:156:                                    ; preds = %151
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 4)
  %157 = add i64 %pgocount8, 1
  store i64 %157, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 4)
  %158 = load i8*, i8** %11, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %11, align 8
  store i32 128, i32* %20, align 4
  br label %160

; <label>:160:                                    ; preds = %156, %151
  %161 = load i32, i32* %19, align 4
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %174, label %163

; <label>:163:                                    ; preds = %160
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 5)
  %164 = add i64 %pgocount9, 1
  store i64 %164, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 5)
  %165 = load i32, i32* %22, align 4
  %166 = mul nsw i32 %165, 7
  %167 = sdiv i32 %166, 16
  %168 = load i16*, i16** %12, align 8
  %169 = getelementptr inbounds i16, i16* %168, i64 0
  %170 = load i16, i16* %169, align 2
  %171 = sext i16 %170 to i32
  %172 = add nsw i32 %171, %167
  %173 = trunc i32 %172 to i16
  store i16 %173, i16* %169, align 2
  br label %174

; <label>:174:                                    ; preds = %163, %160
  %175 = load i32, i32* %18, align 4
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %215, label %177

; <label>:177:                                    ; preds = %174
  %178 = load i32, i32* %15, align 4
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %191

; <label>:180:                                    ; preds = %177
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 8)
  %181 = add i64 %pgocount10, 1
  store i64 %181, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 8)
  %182 = load i32, i32* %22, align 4
  %183 = mul nsw i32 %182, 3
  %184 = sdiv i32 %183, 16
  %185 = load i16*, i16** %13, align 8
  %186 = getelementptr inbounds i16, i16* %185, i64 -1
  %187 = load i16, i16* %186, align 2
  %188 = sext i16 %187 to i32
  %189 = add nsw i32 %188, %184
  %190 = trunc i32 %189 to i16
  store i16 %190, i16* %186, align 2
  br label %191

; <label>:191:                                    ; preds = %180, %177
  %192 = load i32, i32* %22, align 4
  %193 = mul nsw i32 %192, 5
  %194 = sdiv i32 %193, 16
  %195 = load i16*, i16** %13, align 8
  %196 = getelementptr inbounds i16, i16* %195, i32 1
  store i16* %196, i16** %13, align 8
  %197 = load i16, i16* %195, align 2
  %198 = sext i16 %197 to i32
  %199 = add nsw i32 %198, %194
  %200 = trunc i32 %199 to i16
  store i16 %200, i16* %195, align 2
  %201 = load i32, i32* %19, align 4
  %202 = icmp ne i32 %201, 0
  br i1 %202, label %213, label %203

; <label>:203:                                    ; preds = %191
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 9)
  %204 = add i64 %pgocount11, 1
  store i64 %204, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 9)
  %205 = load i32, i32* %22, align 4
  %206 = sdiv i32 %205, 16
  %207 = load i16*, i16** %13, align 8
  %208 = getelementptr inbounds i16, i16* %207, i64 0
  %209 = load i16, i16* %208, align 2
  %210 = sext i16 %209 to i32
  %211 = add nsw i32 %210, %206
  %212 = trunc i32 %211 to i16
  store i16 %212, i16* %208, align 2
  br label %213

; <label>:213:                                    ; preds = %203, %191
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 6)
  %214 = add i64 %pgocount12, 1
  store i64 %214, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 6)
  br label %215

; <label>:215:                                    ; preds = %213, %174
  br label %216

; <label>:216:                                    ; preds = %215
  %217 = load i32, i32* %15, align 4
  %218 = add i32 %217, 1
  store i32 %218, i32* %15, align 4
  br label %113

; <label>:219:                                    ; preds = %113
  %220 = load %struct.tiff*, %struct.tiff** %4, align 8
  %221 = load i8*, i8** %5, align 8
  %222 = load i32, i32* %14, align 4
  %223 = sub i32 %222, 1
  %224 = call i32 @TIFFWriteScanline(%struct.tiff* %220, i8* %221, i32 %223, i16 zeroext 0)
  %225 = icmp slt i32 %224, 0
  br i1 %225, label %226, label %228

; <label>:226:                                    ; preds = %219
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 15)
  %227 = add i64 %pgocount13, 1
  store i64 %227, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 15)
  br label %233

; <label>:228:                                    ; preds = %219
  br label %229

; <label>:229:                                    ; preds = %228
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 11)
  %230 = add i64 %pgocount14, 1
  store i64 %230, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 11)
  %231 = load i32, i32* %14, align 4
  %232 = add i32 %231, 1
  store i32 %232, i32* %14, align 4
  br label %71

; <label>:233:                                    ; preds = %226, %88, %71
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 13)
  %234 = add i64 %pgocount15, 1
  store i64 %234, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_fsdither, i64 0, i64 13)
  %235 = load i8*, i8** %6, align 8
  call void @_TIFFfree(i8* %235)
  %236 = load i16*, i16** %8, align 8
  %237 = bitcast i16* %236 to i8*
  call void @_TIFFfree(i8* %237)
  %238 = load i16*, i16** %9, align 8
  %239 = bitcast i16* %238 to i8*
  call void @_TIFFfree(i8* %239)
  %240 = load i8*, i8** %5, align 8
  call void @_TIFFfree(i8* %240)
  br label %241

; <label>:241:                                    ; preds = %233, %50
  ret void
}

declare void @TIFFClose(%struct.tiff*) #3

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @processG3Options(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i8* @strchr(i8* %3, i32 58) #6
  store i8* %4, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %44

; <label>:6:                                      ; preds = %1
  br label %7

; <label>:7:                                      ; preds = %38, %6
  %8 = load i8*, i8** %2, align 8
  %9 = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %9, i8** %2, align 8
  %10 = load i8*, i8** %2, align 8
  %11 = call i32 @strncmp(i8* %10, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0), i64 2) #6
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 0)
  %15 = load i32, i32* @group3options, align 4
  %16 = and i32 %15, -2
  store i32 %16, i32* @group3options, align 4
  br label %37

; <label>:17:                                     ; preds = %7
  %18 = load i8*, i8** %2, align 8
  %19 = call i32 @strncmp(i8* %18, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0), i64 2) #6
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 2)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 2)
  %23 = load i32, i32* @group3options, align 4
  %24 = or i32 %23, 1
  store i32 %24, i32* @group3options, align 4
  br label %36

; <label>:25:                                     ; preds = %17
  %26 = load i8*, i8** %2, align 8
  %27 = call i32 @strncmp(i8* %26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0), i64 4) #6
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %33

; <label>:29:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 3)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 3)
  %31 = load i32, i32* @group3options, align 4
  %32 = or i32 %31, 4
  store i32 %32, i32* @group3options, align 4
  br label %35

; <label>:33:                                     ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 1)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 1)
  call void @usage()
  br label %35

; <label>:35:                                     ; preds = %33, %29
  br label %36

; <label>:36:                                     ; preds = %35, %21
  br label %37

; <label>:37:                                     ; preds = %36, %13
  br label %38

; <label>:38:                                     ; preds = %37
  %39 = load i8*, i8** %2, align 8
  %40 = call i8* @strchr(i8* %39, i32 58) #6
  store i8* %40, i8** %2, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %7, label %42

; <label>:42:                                     ; preds = %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 5)
  %43 = add i64 %pgocount4, 1
  store i64 %43, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 5)
  br label %44

; <label>:44:                                     ; preds = %42, %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 4)
  %45 = add i64 %pgocount5, 1
  store i64 %45, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_processG3Options, i64 0, i64 4)
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

declare i8* @_TIFFmalloc(i32) #3

declare i32 @TIFFScanlineSize(%struct.tiff*) #3

declare i32 @TIFFReadScanline(%struct.tiff*, i8*, i32, i16 zeroext) #3

declare void @_TIFFmemset(i8*, i32, i32) #3

declare i32 @TIFFWriteScanline(%struct.tiff*, i8*, i32, i16 zeroext) #3

declare void @_TIFFfree(i8*) #3

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
