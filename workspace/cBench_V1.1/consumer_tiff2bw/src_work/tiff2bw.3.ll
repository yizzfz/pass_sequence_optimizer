; ModuleID = 'tiff2bw.2.ll'
source_filename = "tiff2bw.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.cpTag = type { i16, i16, i32 }
%struct.tiff = type opaque

$__llvm_profile_raw_version = comdat any

@RED = global i32 71, align 4
@GREEN = global i32 150, align 4
@BLUE = global i32 28, align 4
@.str = private unnamed_addr constant [11 x i8] c"c:r:R:G:B:\00", align 1
@optarg = external global i8*, align 8
@optind = external global i32, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [62 x i8] c"%s: Bad photometric; can only handle RGB and Palette images.\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"%s: Bad samples/pixel %u.\0A\00", align 1
@.str.4 = private unnamed_addr constant [40 x i8] c" %s: Sorry, only handle 8-bit samples.\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@compression = internal global i16 -1, align 2
@quality = internal global i32 75, align 4
@jpegcolormode = internal global i32 1, align 4
@predictor = internal global i16 0, align 2
@.str.6 = private unnamed_addr constant [18 x i8] c"B&W version of %s\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"tiff2bw\00", align 1
@.str.8 = private unnamed_addr constant [46 x i8] c"usage: tiff2bw [options] input.tif output.tif\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"where options are:\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c" -R %\09\09use #% from red channel\00", align 1
@.str.11 = private unnamed_addr constant [33 x i8] c" -G %\09\09use #% from green channel\00", align 1
@.str.12 = private unnamed_addr constant [32 x i8] c" -B %\09\09use #% from blue channel\00", align 1
@.str.13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.14 = private unnamed_addr constant [48 x i8] c" -r #\09\09make each strip have no more than # rows\00", align 1
@.str.15 = private unnamed_addr constant [64 x i8] c" -c lzw[:opts]\09compress output with Lempel-Ziv & Welch encoding\00", align 1
@.str.16 = private unnamed_addr constant [70 x i8] c"               (no longer supported due to Unisys patent enforcement)\00", align 1
@.str.17 = private unnamed_addr constant [53 x i8] c" -c zip[:opts]\09compress output with deflate encoding\00", align 1
@.str.18 = private unnamed_addr constant [52 x i8] c" -c packbits\09compress output with packbits encoding\00", align 1
@.str.19 = private unnamed_addr constant [58 x i8] c" -c g3[:opts]\09compress output with CCITT Group 3 encoding\00", align 1
@.str.20 = private unnamed_addr constant [52 x i8] c" -c g4\09\09compress output with CCITT Group 4 encoding\00", align 1
@.str.21 = private unnamed_addr constant [48 x i8] c" -c none\09use no compression algorithm on output\00", align 1
@.str.22 = private unnamed_addr constant [25 x i8] c"LZW and deflate options:\00", align 1
@.str.23 = private unnamed_addr constant [24 x i8] c" #\09\09set predictor value\00", align 1
@.str.24 = private unnamed_addr constant [75 x i8] c"For example, -c lzw:2 to get LZW-encoded data with horizontal differencing\00", align 1
@stuff = global [20 x i8*] [i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.24, i32 0, i32 0), i8* null], align 16
@.str.25 = private unnamed_addr constant [24 x i8] c"Assuming 8-bit colormap\00", align 1
@.str.26 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.27 = private unnamed_addr constant [9 x i8] c"packbits\00", align 1
@.str.28 = private unnamed_addr constant [5 x i8] c"jpeg\00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.30 = private unnamed_addr constant [4 x i8] c"zip\00", align 1
@tags = internal global [16 x %struct.cpTag] [%struct.cpTag { i16 256, i16 1, i32 4 }, %struct.cpTag { i16 257, i16 1, i32 4 }, %struct.cpTag { i16 266, i16 1, i32 3 }, %struct.cpTag { i16 269, i16 1, i32 2 }, %struct.cpTag { i16 271, i16 1, i32 2 }, %struct.cpTag { i16 272, i16 1, i32 2 }, %struct.cpTag { i16 274, i16 1, i32 3 }, %struct.cpTag { i16 282, i16 1, i32 5 }, %struct.cpTag { i16 283, i16 1, i32 5 }, %struct.cpTag { i16 285, i16 1, i32 2 }, %struct.cpTag { i16 286, i16 1, i32 5 }, %struct.cpTag { i16 287, i16 1, i32 5 }, %struct.cpTag { i16 296, i16 1, i32 3 }, %struct.cpTag { i16 297, i16 2, i32 3 }, %struct.cpTag { i16 315, i16 1, i32 2 }, %struct.cpTag { i16 316, i16 1, i32 2 }], align 16
@.str.31 = private unnamed_addr constant [16 x i8] c"Unexpected tag\0A\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_processCompressOptions = private constant [30 x i8] c"tmp1.ll:processCompressOptions"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_cpTags = private constant [14 x i8] c"tmp1.ll:cpTags"
@__profn_tmp1.ll_checkcmap = private constant [17 x i8] c"tmp1.ll:checkcmap"
@__profn_tmp1.ll_compresspalette = private constant [23 x i8] c"tmp1.ll:compresspalette"
@__profn_tmp1.ll_compresscontig = private constant [22 x i8] c"tmp1.ll:compresscontig"
@__profn_tmp1.ll_compresssep = private constant [19 x i8] c"tmp1.ll:compresssep"
@__profn_tmp1.ll_cpTag = private constant [13 x i8] c"tmp1.ll:cpTag"
@__profc_main1 = private global [38 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 479486687517, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* null, i32 38, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_processCompressOptions = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_processCompressOptions = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3452952462124452750, i64 171143464574, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 38432627612, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cpTags = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cpTags = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3629465376683619998, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cpTags, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_checkcmap = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_checkcmap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6124412785797532413, i64 64171083454, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compresspalette = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compresspalette = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1650262475667383787, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresspalette, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compresscontig = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compresscontig = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7979119621756287740, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresscontig, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compresssep = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_compresssep = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9146037492357575855, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresssep, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cpTag = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cpTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7210668883600698123, i64 221946245389, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [95 x i8] c"\A4\01\5Cx\DAe\8DA\0A\800\0C\04\F1CB\AF^}\80\17?\10B\A8\C5\A6]\9A\F8\7F=H\8BxZv\06v\95R\09\93+\C2\9C\F3\82VY\CC\D6\AAhOn\F0T\8Bu}\19E\E9\8D\B1S\1C\92\0F\E1\93\950\C8;\03\CA\E2.?\CE\B5x\8A?l\82\EF\C7\0DP\C2<*", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_processCompressOptions to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cpTags to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_checkcmap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compresspalette to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compresscontig to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compresssep to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cpTag to i8*), i8* getelementptr inbounds ([95 x i8], [95 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca %struct.tiff*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  %15 = alloca i16*, align 8
  %16 = alloca i16*, align 8
  %17 = alloca i16*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i16, align 2
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca [1024 x i8], align 16
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 -1, i32* %6, align 4
  br label %26

; <label>:26:                                     ; preds = %65, %2
  %27 = load i32, i32* %4, align 4
  %28 = load i8**, i8*** %5, align 8
  %29 = call i32 @getopt(i32 %27, i8** %28, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0)) #6
  store i32 %29, i32* %24, align 4
  %30 = icmp ne i32 %29, -1
  br i1 %30, label %31, label %67

; <label>:31:                                     ; preds = %26
  %32 = load i32, i32* %24, align 4
  switch i32 %32, label %65 [
    i32 99, label %33
    i32 114, label %41
    i32 82, label %45
    i32 71, label %51
    i32 66, label %57
    i32 63, label %63
  ]

; <label>:33:                                     ; preds = %31
  %34 = load i8*, i8** @optarg, align 8
  %35 = call i32 @processCompressOptions(i8* %34)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %39, label %37

; <label>:37:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 9)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 9)
  call void @usage()
  br label %39

; <label>:39:                                     ; preds = %37, %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 3)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 3)
  br label %65

; <label>:41:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 4)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 4)
  %43 = load i8*, i8** @optarg, align 8
  %44 = call i32 @atoi(i8* %43) #7
  store i32 %44, i32* %6, align 4
  br label %65

; <label>:45:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 5)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 5)
  %47 = load i8*, i8** @optarg, align 8
  %48 = call i32 @atoi(i8* %47) #7
  %49 = mul nsw i32 %48, 255
  %50 = sdiv i32 %49, 100
  store i32 %50, i32* @RED, align 4
  br label %65

; <label>:51:                                     ; preds = %31
  %pgocount5 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 6)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 6)
  %53 = load i8*, i8** @optarg, align 8
  %54 = call i32 @atoi(i8* %53) #7
  %55 = mul nsw i32 %54, 255
  %56 = sdiv i32 %55, 100
  store i32 %56, i32* @GREEN, align 4
  br label %65

; <label>:57:                                     ; preds = %31
  %pgocount6 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 7)
  %58 = add i64 %pgocount6, 1
  store i64 %58, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 7)
  %59 = load i8*, i8** @optarg, align 8
  %60 = call i32 @atoi(i8* %59) #7
  %61 = mul nsw i32 %60, 255
  %62 = sdiv i32 %61, 100
  store i32 %62, i32* @BLUE, align 4
  br label %65

; <label>:63:                                     ; preds = %31
  %pgocount7 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 8)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 8)
  call void @usage()
  br label %65

; <label>:65:                                     ; preds = %63, %57, %51, %45, %41, %39, %31
  %pgocount8 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 0)
  %66 = add i64 %pgocount8, 1
  store i64 %66, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 0)
  br label %26

; <label>:67:                                     ; preds = %26
  %68 = load i32, i32* %4, align 4
  %69 = load i32, i32* @optind, align 4
  %70 = sub nsw i32 %68, %69
  %71 = icmp slt i32 %70, 2
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %67
  %pgocount9 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 12)
  %73 = add i64 %pgocount9, 1
  store i64 %73, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 12)
  call void @usage()
  br label %74

; <label>:74:                                     ; preds = %72, %67
  %75 = load i8**, i8*** %5, align 8
  %76 = load i32, i32* @optind, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8*, i8** %75, i64 %77
  %79 = load i8*, i8** %78, align 8
  %80 = call %struct.tiff* @TIFFOpen(i8* %79, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct.tiff* %80, %struct.tiff** %7, align 8
  %81 = load %struct.tiff*, %struct.tiff** %7, align 8
  %82 = icmp eq %struct.tiff* %81, null
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %74
  %pgocount10 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 14)
  %84 = add i64 %pgocount10, 1
  store i64 %84, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 14)
  store i32 -1, i32* %3, align 4
  br label %435

; <label>:85:                                     ; preds = %74
  store i16 0, i16* %14, align 2
  %86 = load %struct.tiff*, %struct.tiff** %7, align 8
  %87 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %86, i32 262, i16* %14)
  %88 = load i16, i16* %14, align 2
  %89 = zext i16 %88 to i32
  %90 = icmp ne i32 %89, 2
  br i1 %90, label %91, label %105

; <label>:91:                                     ; preds = %85
  %pgocount11 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 15)
  %92 = add i64 %pgocount11, 1
  store i64 %92, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 15)
  %93 = load i16, i16* %14, align 2
  %94 = zext i16 %93 to i32
  %95 = icmp ne i32 %94, 3
  br i1 %95, label %96, label %105

; <label>:96:                                     ; preds = %91
  %pgocount12 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 19)
  %97 = add i64 %pgocount12, 1
  store i64 %97, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 19)
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %99 = load i8**, i8*** %5, align 8
  %100 = load i32, i32* @optind, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8*, i8** %99, i64 %101
  %103 = load i8*, i8** %102, align 8
  %104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %98, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.2, i32 0, i32 0), i8* %103)
  store i32 -1, i32* %3, align 4
  br label %435

; <label>:105:                                    ; preds = %91, %85
  %106 = load %struct.tiff*, %struct.tiff** %7, align 8
  %107 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %106, i32 277, i16* %11)
  %108 = load i16, i16* %11, align 2
  %109 = zext i16 %108 to i32
  %110 = icmp ne i32 %109, 1
  br i1 %110, label %111, label %127

; <label>:111:                                    ; preds = %105
  %pgocount13 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 16)
  %112 = add i64 %pgocount13, 1
  store i64 %112, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 16)
  %113 = load i16, i16* %11, align 2
  %114 = zext i16 %113 to i32
  %115 = icmp ne i32 %114, 3
  br i1 %115, label %116, label %127

; <label>:116:                                    ; preds = %111
  %pgocount14 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 20)
  %117 = add i64 %pgocount14, 1
  store i64 %117, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 20)
  %118 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %119 = load i8**, i8*** %5, align 8
  %120 = load i32, i32* @optind, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8*, i8** %119, i64 %121
  %123 = load i8*, i8** %122, align 8
  %124 = load i16, i16* %11, align 2
  %125 = zext i16 %124 to i32
  %126 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %118, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i32 0, i32 0), i8* %123, i32 %125)
  store i32 -1, i32* %3, align 4
  br label %435

; <label>:127:                                    ; preds = %111, %105
  %128 = load %struct.tiff*, %struct.tiff** %7, align 8
  %129 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %128, i32 258, i16* %12)
  %130 = load i16, i16* %12, align 2
  %131 = zext i16 %130 to i32
  %132 = icmp ne i32 %131, 8
  br i1 %132, label %133, label %142

; <label>:133:                                    ; preds = %127
  %pgocount15 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 18)
  %134 = add i64 %pgocount15, 1
  store i64 %134, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 18)
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %136 = load i8**, i8*** %5, align 8
  %137 = load i32, i32* @optind, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i8*, i8** %136, i64 %138
  %140 = load i8*, i8** %139, align 8
  %141 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.4, i32 0, i32 0), i8* %140)
  store i32 -1, i32* %3, align 4
  br label %435

; <label>:142:                                    ; preds = %127
  %143 = load %struct.tiff*, %struct.tiff** %7, align 8
  %144 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %143, i32 256, i32* %9)
  %145 = load %struct.tiff*, %struct.tiff** %7, align 8
  %146 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %145, i32 257, i32* %10)
  %147 = load %struct.tiff*, %struct.tiff** %7, align 8
  %148 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %147, i32 284, i16* %13)
  %149 = load i8**, i8*** %5, align 8
  %150 = load i32, i32* @optind, align 4
  %151 = add nsw i32 %150, 1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8*, i8** %149, i64 %152
  %154 = load i8*, i8** %153, align 8
  %155 = call %struct.tiff* @TIFFOpen(i8* %154, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store %struct.tiff* %155, %struct.tiff** %8, align 8
  %156 = load %struct.tiff*, %struct.tiff** %8, align 8
  %157 = icmp eq %struct.tiff* %156, null
  br i1 %157, label %158, label %160

; <label>:158:                                    ; preds = %142
  %pgocount16 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 22)
  %159 = add i64 %pgocount16, 1
  store i64 %159, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 22)
  store i32 -1, i32* %3, align 4
  br label %435

; <label>:160:                                    ; preds = %142
  %161 = load %struct.tiff*, %struct.tiff** %7, align 8
  %162 = load %struct.tiff*, %struct.tiff** %8, align 8
  call void @cpTags(%struct.tiff* %161, %struct.tiff* %162)
  %163 = load %struct.tiff*, %struct.tiff** %8, align 8
  %164 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %163, i32 258, i32 8)
  %165 = load %struct.tiff*, %struct.tiff** %8, align 8
  %166 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %165, i32 277, i32 1)
  %167 = load %struct.tiff*, %struct.tiff** %8, align 8
  %168 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %167, i32 284, i32 1)
  %169 = load i16, i16* @compression, align 2
  %170 = zext i16 %169 to i32
  %171 = icmp ne i32 %170, 65535
  br i1 %171, label %172, label %202

; <label>:172:                                    ; preds = %160
  %173 = load %struct.tiff*, %struct.tiff** %8, align 8
  %174 = load i16, i16* @compression, align 2
  %175 = zext i16 %174 to i32
  %176 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %173, i32 259, i32 %175)
  %177 = load i16, i16* @compression, align 2
  %178 = zext i16 %177 to i32
  switch i32 %178, label %200 [
    i32 7, label %180
    i32 5, label %._crit_edge1
    i32 32946, label %188
  ]

._crit_edge1:                                     ; preds = %172
  %pgocount17 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 2)
  %179 = add i64 %pgocount17, 1
  store i64 %179, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 2)
  br label %188

; <label>:180:                                    ; preds = %172
  %pgocount18 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 33)
  %181 = add i64 %pgocount18, 1
  store i64 %181, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 33)
  %182 = load %struct.tiff*, %struct.tiff** %8, align 8
  %183 = load i32, i32* @quality, align 4
  %184 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %182, i32 65537, i32 %183)
  %185 = load %struct.tiff*, %struct.tiff** %8, align 8
  %186 = load i32, i32* @jpegcolormode, align 4
  %187 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %185, i32 65538, i32 %186)
  br label %200

; <label>:188:                                    ; preds = %._crit_edge1, %172
  %189 = load i16, i16* @predictor, align 2
  %190 = zext i16 %189 to i32
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %198

; <label>:192:                                    ; preds = %188
  %pgocount19 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 30)
  %193 = add i64 %pgocount19, 1
  store i64 %193, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 30)
  %194 = load %struct.tiff*, %struct.tiff** %8, align 8
  %195 = load i16, i16* @predictor, align 2
  %196 = zext i16 %195 to i32
  %197 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %194, i32 317, i32 %196)
  br label %198

; <label>:198:                                    ; preds = %192, %188
  %pgocount20 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 25)
  %199 = add i64 %pgocount20, 1
  store i64 %199, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 25)
  br label %200

; <label>:200:                                    ; preds = %198, %180, %172
  %pgocount21 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 23)
  %201 = add i64 %pgocount21, 1
  store i64 %201, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 23)
  br label %202

; <label>:202:                                    ; preds = %200, %160
  %203 = load %struct.tiff*, %struct.tiff** %8, align 8
  %204 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %203, i32 262, i32 1)
  %205 = getelementptr inbounds [1024 x i8], [1024 x i8]* %23, i32 0, i32 0
  %206 = load i8**, i8*** %5, align 8
  %207 = load i32, i32* @optind, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i8*, i8** %206, i64 %208
  %210 = load i8*, i8** %209, align 8
  %211 = call i32 (i8*, i8*, ...) @sprintf(i8* %205, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i32 0, i32 0), i8* %210) #6
  %212 = load %struct.tiff*, %struct.tiff** %8, align 8
  %213 = getelementptr inbounds [1024 x i8], [1024 x i8]* %23, i32 0, i32 0
  %214 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %212, i32 270, i8* %213)
  %215 = load %struct.tiff*, %struct.tiff** %8, align 8
  %216 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %215, i32 305, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0))
  %217 = load %struct.tiff*, %struct.tiff** %8, align 8
  %218 = call i32 @TIFFScanlineSize(%struct.tiff* %217)
  %219 = call i8* @_TIFFmalloc(i32 %218)
  store i8* %219, i8** %22, align 8
  %220 = load %struct.tiff*, %struct.tiff** %8, align 8
  %221 = load %struct.tiff*, %struct.tiff** %8, align 8
  %222 = load i32, i32* %6, align 4
  %223 = call i32 @TIFFDefaultStripSize(%struct.tiff* %221, i32 %222)
  %224 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %220, i32 278, i32 %223)
  %225 = load i16, i16* %14, align 2
  %226 = zext i16 %225 to i32
  %227 = shl i32 %226, 8
  %228 = load i16, i16* %13, align 2
  %229 = zext i16 %228 to i32
  %230 = or i32 %227, %229
  switch i32 %230, label %431 [
    i32 769, label %._crit_edge
    i32 770, label %232
    i32 513, label %335
    i32 514, label %369
  ]

._crit_edge:                                      ; preds = %202
  %pgocount22 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 1)
  %231 = add i64 %pgocount22, 1
  store i64 %231, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 1)
  br label %232

; <label>:232:                                    ; preds = %._crit_edge, %202
  %233 = load %struct.tiff*, %struct.tiff** %7, align 8
  %234 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %233, i32 320, i16** %15, i16** %16, i16** %17)
  %235 = load %struct.tiff*, %struct.tiff** %7, align 8
  %236 = load i16, i16* %12, align 2
  %237 = zext i16 %236 to i32
  %238 = shl i32 1, %237
  %239 = load i16*, i16** %15, align 8
  %240 = load i16*, i16** %16, align 8
  %241 = load i16*, i16** %17, align 8
  %242 = call i32 @checkcmap(%struct.tiff* %235, i32 %238, i16* %239, i16* %240, i16* %241)
  %243 = icmp eq i32 %242, 16
  br i1 %243, label %244, label %298

; <label>:244:                                    ; preds = %232
  %245 = load i16, i16* %12, align 2
  %246 = zext i16 %245 to i32
  %247 = shl i32 1, %246
  %248 = sub nsw i32 %247, 1
  store i32 %248, i32* %25, align 4
  br label %249

; <label>:249:                                    ; preds = %293, %244
  %250 = load i32, i32* %25, align 4
  %251 = icmp sge i32 %250, 0
  br i1 %251, label %252, label %296

; <label>:252:                                    ; preds = %249
  %pgocount23 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 10)
  %253 = add i64 %pgocount23, 1
  store i64 %253, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 10)
  %254 = load i16*, i16** %15, align 8
  %255 = load i32, i32* %25, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds i16, i16* %254, i64 %256
  %258 = load i16, i16* %257, align 2
  %259 = zext i16 %258 to i64
  %260 = mul nsw i64 %259, 255
  %261 = sdiv i64 %260, 65535
  %262 = trunc i64 %261 to i16
  %263 = load i16*, i16** %15, align 8
  %264 = load i32, i32* %25, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i16, i16* %263, i64 %265
  store i16 %262, i16* %266, align 2
  %267 = load i16*, i16** %16, align 8
  %268 = load i32, i32* %25, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i16, i16* %267, i64 %269
  %271 = load i16, i16* %270, align 2
  %272 = zext i16 %271 to i64
  %273 = mul nsw i64 %272, 255
  %274 = sdiv i64 %273, 65535
  %275 = trunc i64 %274 to i16
  %276 = load i16*, i16** %16, align 8
  %277 = load i32, i32* %25, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i16, i16* %276, i64 %278
  store i16 %275, i16* %279, align 2
  %280 = load i16*, i16** %17, align 8
  %281 = load i32, i32* %25, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds i16, i16* %280, i64 %282
  %284 = load i16, i16* %283, align 2
  %285 = zext i16 %284 to i64
  %286 = mul nsw i64 %285, 255
  %287 = sdiv i64 %286, 65535
  %288 = trunc i64 %287 to i16
  %289 = load i16*, i16** %17, align 8
  %290 = load i32, i32* %25, align 4
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds i16, i16* %289, i64 %291
  store i16 %288, i16* %292, align 2
  br label %293

; <label>:293:                                    ; preds = %252
  %294 = load i32, i32* %25, align 4
  %295 = add nsw i32 %294, -1
  store i32 %295, i32* %25, align 4
  br label %249

; <label>:296:                                    ; preds = %249
  %pgocount24 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 26)
  %297 = add i64 %pgocount24, 1
  store i64 %297, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 26)
  br label %298

; <label>:298:                                    ; preds = %296, %232
  %299 = load %struct.tiff*, %struct.tiff** %7, align 8
  %300 = call i32 @TIFFScanlineSize(%struct.tiff* %299)
  %301 = call i8* @_TIFFmalloc(i32 %300)
  store i8* %301, i8** %21, align 8
  store i32 0, i32* %19, align 4
  br label %302

; <label>:302:                                    ; preds = %330, %298
  %303 = load i32, i32* %19, align 4
  %304 = load i32, i32* %10, align 4
  %305 = icmp ult i32 %303, %304
  br i1 %305, label %306, label %333

; <label>:306:                                    ; preds = %302
  %307 = load %struct.tiff*, %struct.tiff** %7, align 8
  %308 = load i8*, i8** %21, align 8
  %309 = load i32, i32* %19, align 4
  %310 = call i32 @TIFFReadScanline(%struct.tiff* %307, i8* %308, i32 %309, i16 zeroext 0)
  %311 = icmp slt i32 %310, 0
  br i1 %311, label %312, label %314

; <label>:312:                                    ; preds = %306
  %pgocount25 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 31)
  %313 = add i64 %pgocount25, 1
  store i64 %313, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 31)
  br label %333

; <label>:314:                                    ; preds = %306
  %315 = load i8*, i8** %22, align 8
  %316 = load i8*, i8** %21, align 8
  %317 = load i32, i32* %9, align 4
  %318 = load i16*, i16** %15, align 8
  %319 = load i16*, i16** %16, align 8
  %320 = load i16*, i16** %17, align 8
  call void @compresspalette(i8* %315, i8* %316, i32 %317, i16* %318, i16* %319, i16* %320)
  %321 = load %struct.tiff*, %struct.tiff** %8, align 8
  %322 = load i8*, i8** %22, align 8
  %323 = load i32, i32* %19, align 4
  %324 = call i32 @TIFFWriteScanline(%struct.tiff* %321, i8* %322, i32 %323, i16 zeroext 0)
  %325 = icmp slt i32 %324, 0
  br i1 %325, label %326, label %328

; <label>:326:                                    ; preds = %314
  %pgocount26 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 32)
  %327 = add i64 %pgocount26, 1
  store i64 %327, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 32)
  br label %333

; <label>:328:                                    ; preds = %314
  %pgocount27 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 13)
  %329 = add i64 %pgocount27, 1
  store i64 %329, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 13)
  br label %330

; <label>:330:                                    ; preds = %328
  %331 = load i32, i32* %19, align 4
  %332 = add i32 %331, 1
  store i32 %332, i32* %19, align 4
  br label %302

; <label>:333:                                    ; preds = %326, %312, %302
  %pgocount28 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 24)
  %334 = add i64 %pgocount28, 1
  store i64 %334, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 24)
  br label %431

; <label>:335:                                    ; preds = %202
  %336 = load %struct.tiff*, %struct.tiff** %7, align 8
  %337 = call i32 @TIFFScanlineSize(%struct.tiff* %336)
  %338 = call i8* @_TIFFmalloc(i32 %337)
  store i8* %338, i8** %21, align 8
  store i32 0, i32* %19, align 4
  br label %339

; <label>:339:                                    ; preds = %363, %335
  %340 = load i32, i32* %19, align 4
  %341 = load i32, i32* %10, align 4
  %342 = icmp ult i32 %340, %341
  br i1 %342, label %343, label %367

; <label>:343:                                    ; preds = %339
  %344 = load %struct.tiff*, %struct.tiff** %7, align 8
  %345 = load i8*, i8** %21, align 8
  %346 = load i32, i32* %19, align 4
  %347 = call i32 @TIFFReadScanline(%struct.tiff* %344, i8* %345, i32 %346, i16 zeroext 0)
  %348 = icmp slt i32 %347, 0
  br i1 %348, label %349, label %351

; <label>:349:                                    ; preds = %343
  %pgocount29 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 34)
  %350 = add i64 %pgocount29, 1
  store i64 %350, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 34)
  br label %367

; <label>:351:                                    ; preds = %343
  %352 = load i8*, i8** %22, align 8
  %353 = load i8*, i8** %21, align 8
  %354 = load i32, i32* %9, align 4
  call void @compresscontig(i8* %352, i8* %353, i32 %354)
  %355 = load %struct.tiff*, %struct.tiff** %8, align 8
  %356 = load i8*, i8** %22, align 8
  %357 = load i32, i32* %19, align 4
  %358 = call i32 @TIFFWriteScanline(%struct.tiff* %355, i8* %356, i32 %357, i16 zeroext 0)
  %359 = icmp slt i32 %358, 0
  br i1 %359, label %360, label %362

; <label>:360:                                    ; preds = %351
  %pgocount30 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 35)
  %361 = add i64 %pgocount30, 1
  store i64 %361, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 35)
  br label %367

; <label>:362:                                    ; preds = %351
  br label %363

; <label>:363:                                    ; preds = %362
  %pgocount31 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 17)
  %364 = add i64 %pgocount31, 1
  store i64 %364, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 17)
  %365 = load i32, i32* %19, align 4
  %366 = add i32 %365, 1
  store i32 %366, i32* %19, align 4
  br label %339

; <label>:367:                                    ; preds = %360, %349, %339
  %pgocount32 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 27)
  %368 = add i64 %pgocount32, 1
  store i64 %368, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 27)
  br label %431

; <label>:369:                                    ; preds = %202
  %370 = load %struct.tiff*, %struct.tiff** %7, align 8
  %371 = call i32 @TIFFScanlineSize(%struct.tiff* %370)
  store i32 %371, i32* %18, align 4
  %372 = load i32, i32* %18, align 4
  %373 = mul nsw i32 3, %372
  %374 = call i8* @_TIFFmalloc(i32 %373)
  store i8* %374, i8** %21, align 8
  store i32 0, i32* %19, align 4
  br label %375

; <label>:375:                                    ; preds = %425, %369
  %376 = load i32, i32* %19, align 4
  %377 = load i32, i32* %10, align 4
  %378 = icmp ult i32 %376, %377
  br i1 %378, label %379, label %429

; <label>:379:                                    ; preds = %375
  store i16 0, i16* %20, align 2
  br label %380

; <label>:380:                                    ; preds = %400, %379
  %381 = load i16, i16* %20, align 2
  %382 = zext i16 %381 to i32
  %383 = icmp slt i32 %382, 3
  br i1 %383, label %384, label %404

; <label>:384:                                    ; preds = %380
  %385 = load %struct.tiff*, %struct.tiff** %7, align 8
  %386 = load i8*, i8** %21, align 8
  %387 = load i16, i16* %20, align 2
  %388 = zext i16 %387 to i32
  %389 = load i32, i32* %18, align 4
  %390 = mul nsw i32 %388, %389
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds i8, i8* %386, i64 %391
  %393 = load i32, i32* %19, align 4
  %394 = load i16, i16* %20, align 2
  %395 = call i32 @TIFFReadScanline(%struct.tiff* %385, i8* %392, i32 %393, i16 zeroext %394)
  %396 = icmp slt i32 %395, 0
  br i1 %396, label %397, label %399

; <label>:397:                                    ; preds = %384
  %pgocount33 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 28)
  %398 = add i64 %pgocount33, 1
  store i64 %398, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 28)
  store i32 -1, i32* %3, align 4
  br label %435

; <label>:399:                                    ; preds = %384
  br label %400

; <label>:400:                                    ; preds = %399
  %pgocount34 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 11)
  %401 = add i64 %pgocount34, 1
  store i64 %401, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 11)
  %402 = load i16, i16* %20, align 2
  %403 = add i16 %402, 1
  store i16 %403, i16* %20, align 2
  br label %380

; <label>:404:                                    ; preds = %380
  %405 = load i8*, i8** %22, align 8
  %406 = load i8*, i8** %21, align 8
  %407 = load i8*, i8** %21, align 8
  %408 = load i32, i32* %18, align 4
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds i8, i8* %407, i64 %409
  %411 = load i8*, i8** %21, align 8
  %412 = load i32, i32* %18, align 4
  %413 = mul nsw i32 2, %412
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds i8, i8* %411, i64 %414
  %416 = load i32, i32* %9, align 4
  call void @compresssep(i8* %405, i8* %406, i8* %410, i8* %415, i32 %416)
  %417 = load %struct.tiff*, %struct.tiff** %8, align 8
  %418 = load i8*, i8** %22, align 8
  %419 = load i32, i32* %19, align 4
  %420 = call i32 @TIFFWriteScanline(%struct.tiff* %417, i8* %418, i32 %419, i16 zeroext 0)
  %421 = icmp slt i32 %420, 0
  br i1 %421, label %422, label %424

; <label>:422:                                    ; preds = %404
  %pgocount35 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 37)
  %423 = add i64 %pgocount35, 1
  store i64 %423, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 37)
  br label %429

; <label>:424:                                    ; preds = %404
  br label %425

; <label>:425:                                    ; preds = %424
  %pgocount36 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 29)
  %426 = add i64 %pgocount36, 1
  store i64 %426, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 29)
  %427 = load i32, i32* %19, align 4
  %428 = add i32 %427, 1
  store i32 %428, i32* %19, align 4
  br label %375

; <label>:429:                                    ; preds = %422, %375
  %pgocount37 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 36)
  %430 = add i64 %pgocount37, 1
  store i64 %430, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 36)
  br label %431

; <label>:431:                                    ; preds = %429, %367, %333, %202
  %pgocount38 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 21)
  %432 = add i64 %pgocount38, 1
  store i64 %432, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_main1, i64 0, i64 21)
  %433 = load %struct.tiff*, %struct.tiff** %7, align 8
  call void @TIFFClose(%struct.tiff* %433)
  %434 = load %struct.tiff*, %struct.tiff** %8, align 8
  call void @TIFFClose(%struct.tiff* %434)
  store i32 0, i32* %3, align 4
  br label %435

; <label>:435:                                    ; preds = %431, %397, %158, %133, %116, %96, %83
  %436 = load i32, i32* %3, align 4
  ret i32 %436
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #1

; Function Attrs: nounwind uwtable
define internal i32 @processCompressOptions(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.26, i32 0, i32 0)) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 0)
  store i16 1, i16* @compression, align 2
  br label %98

; <label>:12:                                     ; preds = %1
  %13 = load i8*, i8** %3, align 8
  %14 = call i32 @strcmp(i8* %13, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.27, i32 0, i32 0)) #7
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 1)
  store i16 -32763, i16* @compression, align 2
  br label %97

; <label>:18:                                     ; preds = %12
  %19 = load i8*, i8** %3, align 8
  %20 = call i32 @strncmp(i8* %19, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i32 0, i32 0), i64 4) #7
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %58

; <label>:22:                                     ; preds = %18
  %23 = load i8*, i8** %3, align 8
  %24 = call i8* @strchr(i8* %23, i32 58) #7
  store i8* %24, i8** %4, align 8
  %25 = load i8*, i8** %4, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %46

; <label>:27:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 4)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 4)
  %29 = call i16** @__ctype_b_loc() #8
  %30 = load i16*, i16** %29, align 8
  %31 = load i8*, i8** %4, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 1
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, i16* %30, i64 %35
  %37 = load i16, i16* %36, align 2
  %38 = zext i16 %37 to i32
  %39 = and i32 %38, 2048
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 10)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 10)
  %43 = load i8*, i8** %4, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 1
  %45 = call i32 @atoi(i8* %44) #7
  store i32 %45, i32* @quality, align 4
  br label %46

; <label>:46:                                     ; preds = %41, %27, %22
  %47 = load i8*, i8** %4, align 8
  %48 = icmp ne i8* %47, null
  br i1 %48, label %49, label %56

; <label>:49:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 5)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 5)
  %51 = load i8*, i8** %4, align 8
  %52 = call i8* @strchr(i8* %51, i32 114) #7
  %53 = icmp ne i8* %52, null
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 7)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 7)
  store i32 0, i32* @jpegcolormode, align 4
  br label %56

; <label>:56:                                     ; preds = %54, %49, %46
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 2)
  %57 = add i64 %pgocount6, 1
  store i64 %57, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 2)
  store i16 7, i16* @compression, align 2
  br label %96

; <label>:58:                                     ; preds = %18
  %59 = load i8*, i8** %3, align 8
  %60 = call i32 @strncmp(i8* %59, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.29, i32 0, i32 0), i64 3) #7
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %75

; <label>:62:                                     ; preds = %58
  %63 = load i8*, i8** %3, align 8
  %64 = call i8* @strchr(i8* %63, i32 58) #7
  store i8* %64, i8** %5, align 8
  %65 = load i8*, i8** %5, align 8
  %66 = icmp ne i8* %65, null
  br i1 %66, label %67, label %73

; <label>:67:                                     ; preds = %62
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 8)
  %68 = add i64 %pgocount7, 1
  store i64 %68, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 8)
  %69 = load i8*, i8** %5, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 1
  %71 = call i32 @atoi(i8* %70) #7
  %72 = trunc i32 %71 to i16
  store i16 %72, i16* @predictor, align 2
  br label %73

; <label>:73:                                     ; preds = %67, %62
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 6)
  %74 = add i64 %pgocount8, 1
  store i64 %74, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 6)
  store i16 5, i16* @compression, align 2
  br label %95

; <label>:75:                                     ; preds = %58
  %76 = load i8*, i8** %3, align 8
  %77 = call i32 @strncmp(i8* %76, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0), i64 3) #7
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %91

; <label>:79:                                     ; preds = %75
  %80 = load i8*, i8** %3, align 8
  %81 = call i8* @strchr(i8* %80, i32 58) #7
  store i8* %81, i8** %6, align 8
  %82 = load i8*, i8** %6, align 8
  %83 = icmp ne i8* %82, null
  br i1 %83, label %84, label %90

; <label>:84:                                     ; preds = %79
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 11)
  %85 = add i64 %pgocount9, 1
  store i64 %85, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 11)
  %86 = load i8*, i8** %6, align 8
  %87 = getelementptr inbounds i8, i8* %86, i64 1
  %88 = call i32 @atoi(i8* %87) #7
  %89 = trunc i32 %88 to i16
  store i16 %89, i16* @predictor, align 2
  br label %90

; <label>:90:                                     ; preds = %84, %79
  store i16 -32590, i16* @compression, align 2
  br label %93

; <label>:91:                                     ; preds = %75
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 3)
  %92 = add i64 %pgocount10, 1
  store i64 %92, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 3)
  store i32 0, i32* %2, align 4
  br label %99

; <label>:93:                                     ; preds = %90
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 9)
  %94 = add i64 %pgocount11, 1
  store i64 %94, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 9)
  br label %95

; <label>:95:                                     ; preds = %93, %73
  br label %96

; <label>:96:                                     ; preds = %95, %56
  br label %97

; <label>:97:                                     ; preds = %96, %16
  br label %98

; <label>:98:                                     ; preds = %97, %10
  store i32 1, i32* %2, align 4
  br label %99

; <label>:99:                                     ; preds = %98, %91
  %100 = load i32, i32* %2, align 4
  ret i32 %100
}

; Function Attrs: nounwind uwtable
define internal void @usage() #0 {
  %1 = alloca [8192 x i8], align 16
  %2 = alloca i32, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = getelementptr inbounds [8192 x i8], [8192 x i8]* %1, i32 0, i32 0
  call void @setbuf(%struct._IO_FILE* %3, i8* %4) #6
  store i32 0, i32* %2, align 4
  br label %5

; <label>:5:                                      ; preds = %18, %0
  %6 = load i32, i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [20 x i8*], [20 x i8*]* @stuff, i64 0, i64 %7
  %9 = load i8*, i8** %8, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %22

; <label>:11:                                     ; preds = %5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = load i32, i32* %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [20 x i8*], [20 x i8*]* @stuff, i64 0, i64 %14
  %16 = load i8*, i8** %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i32 0, i32 0), i8* %16)
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
  call void @exit(i32 1) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare %struct.tiff* @TIFFOpen(i8*, i8*) #3

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define internal void @cpTags(%struct.tiff*, %struct.tiff*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.cpTag*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.tiff* %1, %struct.tiff** %4, align 8
  store %struct.cpTag* getelementptr inbounds ([16 x %struct.cpTag], [16 x %struct.cpTag]* @tags, i32 0, i32 0), %struct.cpTag** %5, align 8
  br label %6

; <label>:6:                                      ; preds = %21, %2
  %7 = load %struct.cpTag*, %struct.cpTag** %5, align 8
  %8 = icmp ult %struct.cpTag* %7, getelementptr inbounds ([16 x %struct.cpTag], [16 x %struct.cpTag]* @tags, i64 1, i64 0)
  br i1 %8, label %9, label %25

; <label>:9:                                      ; preds = %6
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = load %struct.cpTag*, %struct.cpTag** %5, align 8
  %13 = getelementptr inbounds %struct.cpTag, %struct.cpTag* %12, i32 0, i32 0
  %14 = load i16, i16* %13, align 4
  %15 = load %struct.cpTag*, %struct.cpTag** %5, align 8
  %16 = getelementptr inbounds %struct.cpTag, %struct.cpTag* %15, i32 0, i32 1
  %17 = load i16, i16* %16, align 2
  %18 = load %struct.cpTag*, %struct.cpTag** %5, align 8
  %19 = getelementptr inbounds %struct.cpTag, %struct.cpTag* %18, i32 0, i32 2
  %20 = load i32, i32* %19, align 4
  call void @cpTag(%struct.tiff* %10, %struct.tiff* %11, i16 zeroext %14, i16 zeroext %17, i32 %20)
  br label %21

; <label>:21:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cpTags, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cpTags, i64 0, i64 0)
  %23 = load %struct.cpTag*, %struct.cpTag** %5, align 8
  %24 = getelementptr inbounds %struct.cpTag, %struct.cpTag* %23, i32 1
  store %struct.cpTag* %24, %struct.cpTag** %5, align 8
  br label %6

; <label>:25:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cpTags, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_cpTags, i64 0, i64 1)
  ret void
}

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) #3

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

declare i8* @_TIFFmalloc(i32) #3

declare i32 @TIFFScanlineSize(%struct.tiff*) #3

declare i32 @TIFFDefaultStripSize(%struct.tiff*, i32) #3

; Function Attrs: nounwind uwtable
define internal i32 @checkcmap(%struct.tiff*, i32, i16*, i16*, i16*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  store %struct.tiff* %0, %struct.tiff** %7, align 8
  store i32 %1, i32* %8, align 4
  store i16* %2, i16** %9, align 8
  store i16* %3, i16** %10, align 8
  store i16* %4, i16** %11, align 8
  br label %12

; <label>:12:                                     ; preds = %38, %5
  %13 = load i32, i32* %8, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %8, align 4
  %15 = icmp sgt i32 %13, 0
  br i1 %15, label %16, label %40

; <label>:16:                                     ; preds = %12
  %17 = load i16*, i16** %9, align 8
  %18 = getelementptr inbounds i16, i16* %17, i32 1
  store i16* %18, i16** %9, align 8
  %19 = load i16, i16* %17, align 2
  %20 = zext i16 %19 to i32
  %21 = icmp sge i32 %20, 256
  br i1 %21, label %36, label %22

; <label>:22:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 0)
  %24 = load i16*, i16** %10, align 8
  %25 = getelementptr inbounds i16, i16* %24, i32 1
  store i16* %25, i16** %10, align 8
  %26 = load i16, i16* %24, align 2
  %27 = zext i16 %26 to i32
  %28 = icmp sge i32 %27, 256
  br i1 %28, label %36, label %29

; <label>:29:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 1)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 1)
  %31 = load i16*, i16** %11, align 8
  %32 = getelementptr inbounds i16, i16* %31, i32 1
  store i16* %32, i16** %11, align 8
  %33 = load i16, i16* %31, align 2
  %34 = zext i16 %33 to i32
  %35 = icmp sge i32 %34, 256
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %29, %22, %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 3)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 3)
  store i32 16, i32* %6, align 4
  br label %44

; <label>:38:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 2)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 2)
  br label %12

; <label>:40:                                     ; preds = %12
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 4)
  %41 = add i64 %pgocount4, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_checkcmap, i64 0, i64 4)
  %42 = load %struct.tiff*, %struct.tiff** %7, align 8
  %43 = call i8* @TIFFFileName(%struct.tiff* %42)
  call void (i8*, i8*, ...) @TIFFWarning(i8* %43, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.25, i32 0, i32 0))
  store i32 8, i32* %6, align 4
  br label %44

; <label>:44:                                     ; preds = %40, %36
  %45 = load i32, i32* %6, align 4
  ret i32 %45
}

declare i32 @TIFFReadScanline(%struct.tiff*, i8*, i32, i16 zeroext) #3

; Function Attrs: nounwind uwtable
define internal void @compresspalette(i8*, i8*, i32, i16*, i16*, i16*) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i8* %0, i8** %7, align 8
  store i8* %1, i8** %8, align 8
  store i32 %2, i32* %9, align 4
  store i16* %3, i16** %10, align 8
  store i16* %4, i16** %11, align 8
  store i16* %5, i16** %12, align 8
  %18 = load i32, i32* @RED, align 4
  store i32 %18, i32* %14, align 4
  %19 = load i32, i32* @GREEN, align 4
  store i32 %19, i32* %15, align 4
  %20 = load i32, i32* @BLUE, align 4
  store i32 %20, i32* %16, align 4
  br label %21

; <label>:21:                                     ; preds = %25, %6
  %22 = load i32, i32* %9, align 4
  %23 = add i32 %22, -1
  store i32 %23, i32* %9, align 4
  %24 = icmp ugt i32 %22, 0
  br i1 %24, label %25, label %64

; <label>:25:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresspalette, i64 0, i64 0)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresspalette, i64 0, i64 0)
  %27 = load i8*, i8** %8, align 8
  %28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %28, i8** %8, align 8
  %29 = load i8, i8* %27, align 1
  %30 = zext i8 %29 to i32
  store i32 %30, i32* %17, align 4
  %31 = load i32, i32* %14, align 4
  %32 = load i16*, i16** %10, align 8
  %33 = load i32, i32* %17, align 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i16, i16* %32, i64 %34
  %36 = load i16, i16* %35, align 2
  %37 = zext i16 %36 to i32
  %38 = mul nsw i32 %31, %37
  store i32 %38, i32* %13, align 4
  %39 = load i32, i32* %15, align 4
  %40 = load i16*, i16** %11, align 8
  %41 = load i32, i32* %17, align 4
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i16, i16* %40, i64 %42
  %44 = load i16, i16* %43, align 2
  %45 = zext i16 %44 to i32
  %46 = mul nsw i32 %39, %45
  %47 = load i32, i32* %13, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, i32* %13, align 4
  %49 = load i32, i32* %16, align 4
  %50 = load i16*, i16** %12, align 8
  %51 = load i32, i32* %17, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i16, i16* %50, i64 %52
  %54 = load i16, i16* %53, align 2
  %55 = zext i16 %54 to i32
  %56 = mul nsw i32 %49, %55
  %57 = load i32, i32* %13, align 4
  %58 = add nsw i32 %57, %56
  store i32 %58, i32* %13, align 4
  %59 = load i32, i32* %13, align 4
  %60 = ashr i32 %59, 8
  %61 = trunc i32 %60 to i8
  %62 = load i8*, i8** %7, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %7, align 8
  store i8 %61, i8* %62, align 1
  br label %21

; <label>:64:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresspalette, i64 0, i64 1)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresspalette, i64 0, i64 1)
  ret void
}

declare i32 @TIFFWriteScanline(%struct.tiff*, i8*, i32, i16 zeroext) #3

; Function Attrs: nounwind uwtable
define internal void @compresscontig(i8*, i8*, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %11 = load i32, i32* @RED, align 4
  store i32 %11, i32* %8, align 4
  %12 = load i32, i32* @GREEN, align 4
  store i32 %12, i32* %9, align 4
  %13 = load i32, i32* @BLUE, align 4
  store i32 %13, i32* %10, align 4
  br label %14

; <label>:14:                                     ; preds = %18, %3
  %15 = load i32, i32* %6, align 4
  %16 = add i32 %15, -1
  store i32 %16, i32* %6, align 4
  %17 = icmp ugt i32 %15, 0
  br i1 %17, label %18, label %47

; <label>:18:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresscontig, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresscontig, i64 0, i64 0)
  %20 = load i32, i32* %8, align 4
  %21 = load i8*, i8** %5, align 8
  %22 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %22, i8** %5, align 8
  %23 = load i8, i8* %21, align 1
  %24 = zext i8 %23 to i32
  %25 = mul nsw i32 %20, %24
  store i32 %25, i32* %7, align 4
  %26 = load i32, i32* %9, align 4
  %27 = load i8*, i8** %5, align 8
  %28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %28, i8** %5, align 8
  %29 = load i8, i8* %27, align 1
  %30 = zext i8 %29 to i32
  %31 = mul nsw i32 %26, %30
  %32 = load i32, i32* %7, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %7, align 4
  %34 = load i32, i32* %10, align 4
  %35 = load i8*, i8** %5, align 8
  %36 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %36, i8** %5, align 8
  %37 = load i8, i8* %35, align 1
  %38 = zext i8 %37 to i32
  %39 = mul nsw i32 %34, %38
  %40 = load i32, i32* %7, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, i32* %7, align 4
  %42 = load i32, i32* %7, align 4
  %43 = ashr i32 %42, 8
  %44 = trunc i32 %43 to i8
  %45 = load i8*, i8** %4, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %4, align 8
  store i8 %44, i8* %45, align 1
  br label %14

; <label>:47:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresscontig, i64 0, i64 1)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresscontig, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @compresssep(i8*, i8*, i8*, i8*, i32) #0 {
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i8* %0, i8** %6, align 8
  store i8* %1, i8** %7, align 8
  store i8* %2, i8** %8, align 8
  store i8* %3, i8** %9, align 8
  store i32 %4, i32* %10, align 4
  %14 = load i32, i32* @RED, align 4
  store i32 %14, i32* %11, align 4
  %15 = load i32, i32* @GREEN, align 4
  store i32 %15, i32* %12, align 4
  %16 = load i32, i32* @BLUE, align 4
  store i32 %16, i32* %13, align 4
  br label %17

; <label>:17:                                     ; preds = %21, %5
  %18 = load i32, i32* %10, align 4
  %19 = add i32 %18, -1
  store i32 %19, i32* %10, align 4
  %20 = icmp ugt i32 %18, 0
  br i1 %20, label %21, label %47

; <label>:21:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresssep, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresssep, i64 0, i64 0)
  %23 = load i32, i32* %11, align 4
  %24 = load i8*, i8** %7, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %7, align 8
  %26 = load i8, i8* %24, align 1
  %27 = zext i8 %26 to i32
  %28 = mul i32 %23, %27
  %29 = load i32, i32* %12, align 4
  %30 = load i8*, i8** %8, align 8
  %31 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %31, i8** %8, align 8
  %32 = load i8, i8* %30, align 1
  %33 = zext i8 %32 to i32
  %34 = mul i32 %29, %33
  %35 = add i32 %28, %34
  %36 = load i32, i32* %13, align 4
  %37 = load i8*, i8** %9, align 8
  %38 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %38, i8** %9, align 8
  %39 = load i8, i8* %37, align 1
  %40 = zext i8 %39 to i32
  %41 = mul i32 %36, %40
  %42 = add i32 %35, %41
  %43 = lshr i32 %42, 8
  %44 = trunc i32 %43 to i8
  %45 = load i8*, i8** %6, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %6, align 8
  store i8 %44, i8* %45, align 1
  br label %17

; <label>:47:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresssep, i64 0, i64 1)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_compresssep, i64 0, i64 1)
  ret void
}

declare void @TIFFClose(%struct.tiff*) #3

declare void @TIFFWarning(i8*, i8*, ...) #3

declare i8* @TIFFFileName(%struct.tiff*) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #4

; Function Attrs: nounwind uwtable
define internal void @cpTag(%struct.tiff*, %struct.tiff*, i16 zeroext, i16 zeroext, i32) #0 {
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i32, align 4
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca i16*, align 8
  %14 = alloca float, align 4
  %15 = alloca float*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store %struct.tiff* %1, %struct.tiff** %7, align 8
  store i16 %2, i16* %8, align 2
  store i16 %3, i16* %9, align 2
  store i32 %4, i32* %10, align 4
  %18 = load i32, i32* %10, align 4
  switch i32 %18, label %158 [
    i32 3, label %19
    i32 4, label %86
    i32 5, label %101
    i32 2, label %143
  ]

; <label>:19:                                     ; preds = %5
  %20 = load i16, i16* %9, align 2
  %21 = zext i16 %20 to i32
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %23, label %39

; <label>:23:                                     ; preds = %19
  %24 = load %struct.tiff*, %struct.tiff** %6, align 8
  %25 = load i16, i16* %8, align 2
  %26 = zext i16 %25 to i32
  %27 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %24, i32 %26, i16* %11)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 7)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 7)
  %31 = load %struct.tiff*, %struct.tiff** %7, align 8
  %32 = load i16, i16* %8, align 2
  %33 = zext i16 %32 to i32
  %34 = load i16, i16* %11, align 2
  %35 = zext i16 %34 to i32
  %36 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %31, i32 %33, i32 %35)
  br label %37

; <label>:37:                                     ; preds = %29, %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 4)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 4)
  br label %85

; <label>:39:                                     ; preds = %19
  %40 = load i16, i16* %9, align 2
  %41 = zext i16 %40 to i32
  %42 = icmp eq i32 %41, 2
  br i1 %42, label %43, label %61

; <label>:43:                                     ; preds = %39
  %44 = load %struct.tiff*, %struct.tiff** %6, align 8
  %45 = load i16, i16* %8, align 2
  %46 = zext i16 %45 to i32
  %47 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %44, i32 %46, i16* %11, i16* %12)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %59

; <label>:49:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 12)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 12)
  %51 = load %struct.tiff*, %struct.tiff** %7, align 8
  %52 = load i16, i16* %8, align 2
  %53 = zext i16 %52 to i32
  %54 = load i16, i16* %11, align 2
  %55 = zext i16 %54 to i32
  %56 = load i16, i16* %12, align 2
  %57 = zext i16 %56 to i32
  %58 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %51, i32 %53, i32 %55, i32 %57)
  br label %59

; <label>:59:                                     ; preds = %49, %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 9)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 9)
  br label %84

; <label>:61:                                     ; preds = %39
  %62 = load i16, i16* %9, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp eq i32 %63, 65535
  br i1 %64, label %65, label %82

; <label>:65:                                     ; preds = %61
  %66 = load %struct.tiff*, %struct.tiff** %6, align 8
  %67 = load i16, i16* %8, align 2
  %68 = zext i16 %67 to i32
  %69 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %66, i32 %68, i16* %11, i16** %13)
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %80

; <label>:71:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 15)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 15)
  %73 = load %struct.tiff*, %struct.tiff** %7, align 8
  %74 = load i16, i16* %8, align 2
  %75 = zext i16 %74 to i32
  %76 = load i16, i16* %11, align 2
  %77 = zext i16 %76 to i32
  %78 = load i16*, i16** %13, align 8
  %79 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %73, i32 %75, i32 %77, i16* %78)
  br label %80

; <label>:80:                                     ; preds = %71, %65
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 14)
  %81 = add i64 %pgocount5, 1
  store i64 %81, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 14)
  br label %82

; <label>:82:                                     ; preds = %80, %61
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 10)
  %83 = add i64 %pgocount6, 1
  store i64 %83, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 10)
  br label %84

; <label>:84:                                     ; preds = %82, %59
  br label %85

; <label>:85:                                     ; preds = %84, %37
  br label %162

; <label>:86:                                     ; preds = %5
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 0)
  %87 = add i64 %pgocount7, 1
  store i64 %87, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 0)
  %88 = load %struct.tiff*, %struct.tiff** %6, align 8
  %89 = load i16, i16* %8, align 2
  %90 = zext i16 %89 to i32
  %91 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %88, i32 %90, i32* %17)
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %100

; <label>:93:                                     ; preds = %86
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 2)
  %94 = add i64 %pgocount8, 1
  store i64 %94, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 2)
  %95 = load %struct.tiff*, %struct.tiff** %7, align 8
  %96 = load i16, i16* %8, align 2
  %97 = zext i16 %96 to i32
  %98 = load i32, i32* %17, align 4
  %99 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %95, i32 %97, i32 %98)
  br label %100

; <label>:100:                                    ; preds = %93, %86
  br label %162

; <label>:101:                                    ; preds = %5
  %102 = load i16, i16* %9, align 2
  %103 = zext i16 %102 to i32
  %104 = icmp eq i32 %103, 1
  br i1 %104, label %105, label %121

; <label>:105:                                    ; preds = %101
  %106 = load %struct.tiff*, %struct.tiff** %6, align 8
  %107 = load i16, i16* %8, align 2
  %108 = zext i16 %107 to i32
  %109 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %106, i32 %108, float* %14)
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %119

; <label>:111:                                    ; preds = %105
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 8)
  %112 = add i64 %pgocount9, 1
  store i64 %112, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 8)
  %113 = load %struct.tiff*, %struct.tiff** %7, align 8
  %114 = load i16, i16* %8, align 2
  %115 = zext i16 %114 to i32
  %116 = load float, float* %14, align 4
  %117 = fpext float %116 to double
  %118 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %113, i32 %115, double %117)
  br label %119

; <label>:119:                                    ; preds = %111, %105
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 5)
  %120 = add i64 %pgocount10, 1
  store i64 %120, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 5)
  br label %142

; <label>:121:                                    ; preds = %101
  %122 = load i16, i16* %9, align 2
  %123 = zext i16 %122 to i32
  %124 = icmp eq i32 %123, 65535
  br i1 %124, label %125, label %140

; <label>:125:                                    ; preds = %121
  %126 = load %struct.tiff*, %struct.tiff** %6, align 8
  %127 = load i16, i16* %8, align 2
  %128 = zext i16 %127 to i32
  %129 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %126, i32 %128, float** %15)
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %138

; <label>:131:                                    ; preds = %125
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 13)
  %132 = add i64 %pgocount11, 1
  store i64 %132, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 13)
  %133 = load %struct.tiff*, %struct.tiff** %7, align 8
  %134 = load i16, i16* %8, align 2
  %135 = zext i16 %134 to i32
  %136 = load float*, float** %15, align 8
  %137 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %133, i32 %135, float* %136)
  br label %138

; <label>:138:                                    ; preds = %131, %125
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 11)
  %139 = add i64 %pgocount12, 1
  store i64 %139, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 11)
  br label %140

; <label>:140:                                    ; preds = %138, %121
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 6)
  %141 = add i64 %pgocount13, 1
  store i64 %141, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 6)
  br label %142

; <label>:142:                                    ; preds = %140, %119
  br label %162

; <label>:143:                                    ; preds = %5
  %144 = load %struct.tiff*, %struct.tiff** %6, align 8
  %145 = load i16, i16* %8, align 2
  %146 = zext i16 %145 to i32
  %147 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %144, i32 %146, i8** %16)
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %156

; <label>:149:                                    ; preds = %143
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 3)
  %150 = add i64 %pgocount14, 1
  store i64 %150, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 3)
  %151 = load %struct.tiff*, %struct.tiff** %7, align 8
  %152 = load i16, i16* %8, align 2
  %153 = zext i16 %152 to i32
  %154 = load i8*, i8** %16, align 8
  %155 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %151, i32 %153, i8* %154)
  br label %156

; <label>:156:                                    ; preds = %149, %143
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 1)
  %157 = add i64 %pgocount15, 1
  store i64 %157, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 1)
  br label %162

; <label>:158:                                    ; preds = %5
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 16)
  %159 = add i64 %pgocount16, 1
  store i64 %159, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_cpTag, i64 0, i64 16)
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %161 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %160, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.31, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

; <label>:162:                                    ; preds = %156, %142, %100, %85
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind readnone }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
