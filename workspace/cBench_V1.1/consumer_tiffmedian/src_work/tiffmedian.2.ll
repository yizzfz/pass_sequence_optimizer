; ModuleID = 'tmp1.ll'
source_filename = "tiffmedian.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.tiff = type opaque
%struct.colorbox = type { %struct.colorbox*, %struct.colorbox*, i32, i32, i32, i32, i32, i32, i32 }
%struct.C_cell = type { i32, [256 x [2 x i32]] }

$__llvm_profile_raw_version = comdat any

@rowsperstrip = global i32 -1, align 4
@compression = global i16 -1, align 2
@bitspersample = global i16 1, align 2
@predictor = global i16 0, align 2
@num_colors = common global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"c:C:r:f\00", align 1
@optarg = external global i8*, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [30 x i8] c"-c: colormap too big, max %d\0A\00", align 1
@optind = external global i32, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@in = common global %struct.tiff* null, align 8
@imagewidth = common global i32 0, align 4
@imagelength = common global i32 0, align 4
@samplesperpixel = common global i16 0, align 2
@.str.3 = private unnamed_addr constant [44 x i8] c"%s: Image must have at least 8-bits/sample\0A\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"%s: Image must have RGB data\0A\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"%s: Can only handle contiguous data packing\0A\00", align 1
@usedboxes = common global %struct.colorbox* null, align 8
@freeboxes = common global %struct.colorbox* null, align 8
@rm = common global [256 x i16] zeroinitializer, align 16
@gm = common global [256 x i16] zeroinitializer, align 16
@bm = common global [256 x i16] zeroinitializer, align 16
@ColorCells = common global %struct.C_cell** null, align 8
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@out = common global %struct.tiff* null, align 8
@.str.7 = private unnamed_addr constant [49 x i8] c"usage: tiffmedian [options] input.tif output.tif\00", align 1
@.str.8 = private unnamed_addr constant [19 x i8] c"where options are:\00", align 1
@.str.9 = private unnamed_addr constant [48 x i8] c" -r #\09\09make each strip have no more than # rows\00", align 1
@.str.10 = private unnamed_addr constant [40 x i8] c" -C #\09\09create a colormap with # entries\00", align 1
@.str.11 = private unnamed_addr constant [35 x i8] c" -f\09\09use Floyd-Steinberg dithering\00", align 1
@.str.12 = private unnamed_addr constant [64 x i8] c" -c lzw[:opts]\09compress output with Lempel-Ziv & Welch encoding\00", align 1
@.str.13 = private unnamed_addr constant [70 x i8] c"               (no longer supported due to Unisys patent enforcement)\00", align 1
@.str.14 = private unnamed_addr constant [53 x i8] c" -c zip[:opts]\09compress output with deflate encoding\00", align 1
@.str.15 = private unnamed_addr constant [52 x i8] c" -c packbits\09compress output with packbits encoding\00", align 1
@.str.16 = private unnamed_addr constant [48 x i8] c" -c none\09use no compression algorithm on output\00", align 1
@.str.17 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"LZW and deflate options:\00", align 1
@.str.19 = private unnamed_addr constant [24 x i8] c" #\09\09set predictor value\00", align 1
@.str.20 = private unnamed_addr constant [75 x i8] c"For example, -c lzw:2 to get LZW-encoded data with horizontal differencing\00", align 1
@stuff = global [15 x i8*] [i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.20, i32 0, i32 0), i8* null], align 16
@bytes_per_pixel = common global i32 0, align 4
@histogram = common global [32 x [32 x [32 x i32]]] zeroinitializer, align 16
@.str.21 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.22 = private unnamed_addr constant [9 x i8] c"packbits\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"zip\00", align 1
@.str.25 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.26 = private unnamed_addr constant [30 x i8] c"No space for scanline buffer\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_processCompressOptions = private constant [30 x i8] c"tmp1.ll:processCompressOptions"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_get_histogram = private constant [21 x i8] c"tmp1.ll:get_histogram"
@__profn_tmp1.ll_largest_box = private constant [19 x i8] c"tmp1.ll:largest_box"
@__profn_tmp1.ll_splitbox = private constant [16 x i8] c"tmp1.ll:splitbox"
@__profn_tmp1.ll_map_colortable = private constant [22 x i8] c"tmp1.ll:map_colortable"
@__profn_tmp1.ll_quant_fsdither = private constant [22 x i8] c"tmp1.ll:quant_fsdither"
@__profn_tmp1.ll_quant = private constant [13 x i8] c"tmp1.ll:quant"
@__profn_tmp1.ll_shrinkbox = private constant [17 x i8] c"tmp1.ll:shrinkbox"
@__profn_tmp1.ll_create_colorcell = private constant [24 x i8] c"tmp1.ll:create_colorcell"
@__profc_main1 = private global [42 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 553031072810, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* null, i32 42, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_processCompressOptions = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_processCompressOptions = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3452952462124452750, i64 109353886611, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 38432627612, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_histogram = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_get_histogram = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8896676386994480674, i64 170039417730, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_largest_box = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_largest_box = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3579938965652412394, i64 72927283651, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_splitbox = private global [26 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_splitbox = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 377636717994849298, i64 422170055261, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i32 0, i32 0), i8* null, i8* null, i32 26, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_map_colortable = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_map_colortable = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3677815733140160976, i64 150250837836, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_quant_fsdither = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_quant_fsdither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7309720834457966171, i64 366550979716, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_quant = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_quant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1287514795544394515, i64 79681774241, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_shrinkbox = private global [31 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_shrinkbox = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7843860310581043020, i64 577095186601, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i32 0, i32 0), i8* null, i8* null, i32 31, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_create_colorcell = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_create_colorcell = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1307888984139469300, i64 298250501696, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i32 0, i32 0), i8* null, i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [124 x i8] c"\D4\01yx\DAU\CCA\0A\021\0C\85a\BC\900[\B7\1E\C0#\94L\8Dm0ib\92\01\8F\AF t\C6U\C8\FF\E0\13\A0\B1\9CRl93_\CC\B5b\C4U\C5\FC{o\96\A4#\E6\BC\054\9C_\C3,\9D\22\B59\C8\AC\0C\DE0\B2\AC\FA\9E-\8C)\8FA\C0JUVOXy\17_\1B\8C,\8F\B8Sv\F4\FF\BCc\DDi<\8FZu\84\C4\1FX\91\F9\03\806Nu", section "__llvm_prf_names"
@llvm.used = appending global [12 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_processCompressOptions to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_histogram to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_largest_box to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_splitbox to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_map_colortable to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_quant_fsdither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_quant to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_shrinkbox to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_colorcell to i8*), i8* getelementptr inbounds ([124 x i8], [124 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca %struct.colorbox*, align 8
  %12 = alloca %struct.colorbox*, align 8
  %13 = alloca float, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %7, align 4
  store i32 256, i32* @num_colors, align 4
  br label %16

; <label>:16:                                     ; preds = %50, %2
  %17 = load i32, i32* %4, align 4
  %18 = load i8**, i8*** %5, align 8
  %19 = call i32 @getopt(i32 %17, i8** %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0)) #5
  store i32 %19, i32* %15, align 4
  %20 = icmp ne i32 %19, -1
  br i1 %20, label %21, label %52

; <label>:21:                                     ; preds = %16
  %22 = load i32, i32* %15, align 4
  switch i32 %22, label %50 [
    i32 99, label %23
    i32 67, label %31
    i32 102, label %42
    i32 114, label %44
    i32 63, label %48
  ]

; <label>:23:                                     ; preds = %21
  %24 = load i8*, i8** @optarg, align 8
  %25 = call i32 @processCompressOptions(i8* %24)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %29, label %27

; <label>:27:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 8)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 8)
  call void @usage()
  br label %29

; <label>:29:                                     ; preds = %27, %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 1)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 1)
  br label %50

; <label>:31:                                     ; preds = %21
  %32 = load i8*, i8** @optarg, align 8
  %33 = call i32 @atoi(i8* %32) #6
  store i32 %33, i32* @num_colors, align 4
  %34 = load i32, i32* @num_colors, align 4
  %35 = icmp sgt i32 %34, 256
  br i1 %35, label %36, label %40

; <label>:36:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 7)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 7)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0), i32 256)
  call void @usage()
  br label %40

; <label>:40:                                     ; preds = %36, %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 2)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 2)
  br label %50

; <label>:42:                                     ; preds = %21
  %pgocount4 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 3)
  %43 = add i64 %pgocount4, 1
  store i64 %43, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 3)
  store i32 1, i32* %7, align 4
  br label %50

; <label>:44:                                     ; preds = %21
  %pgocount5 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 4)
  %45 = add i64 %pgocount5, 1
  store i64 %45, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 4)
  %46 = load i8*, i8** @optarg, align 8
  %47 = call i32 @atoi(i8* %46) #6
  store i32 %47, i32* @rowsperstrip, align 4
  br label %50

; <label>:48:                                     ; preds = %21
  %pgocount6 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 5)
  %49 = add i64 %pgocount6, 1
  store i64 %49, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 5)
  call void @usage()
  br label %50

; <label>:50:                                     ; preds = %48, %44, %42, %40, %29, %21
  %pgocount7 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 0)
  %51 = add i64 %pgocount7, 1
  store i64 %51, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 0)
  br label %16

; <label>:52:                                     ; preds = %16
  %53 = load i32, i32* %4, align 4
  %54 = load i32, i32* @optind, align 4
  %55 = sub nsw i32 %53, %54
  %56 = icmp ne i32 %55, 2
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %52
  %pgocount8 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 13)
  %58 = add i64 %pgocount8, 1
  store i64 %58, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 13)
  call void @usage()
  br label %59

; <label>:59:                                     ; preds = %57, %52
  %60 = load i8**, i8*** %5, align 8
  %61 = load i32, i32* @optind, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8*, i8** %60, i64 %62
  %64 = load i8*, i8** %63, align 8
  %65 = call %struct.tiff* @TIFFOpen(i8* %64, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct.tiff* %65, %struct.tiff** @in, align 8
  %66 = load %struct.tiff*, %struct.tiff** @in, align 8
  %67 = icmp eq %struct.tiff* %66, null
  br i1 %67, label %68, label %70

; <label>:68:                                     ; preds = %59
  %pgocount9 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 16)
  %69 = add i64 %pgocount9, 1
  store i64 %69, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 16)
  store i32 -1, i32* %3, align 4
  br label %523

; <label>:70:                                     ; preds = %59
  %71 = load %struct.tiff*, %struct.tiff** @in, align 8
  %72 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %71, i32 256, i32* @imagewidth)
  %73 = load %struct.tiff*, %struct.tiff** @in, align 8
  %74 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %73, i32 257, i32* @imagelength)
  %75 = load %struct.tiff*, %struct.tiff** @in, align 8
  %76 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %75, i32 258, i16* @bitspersample)
  %77 = load %struct.tiff*, %struct.tiff** @in, align 8
  %78 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %77, i32 277, i16* @samplesperpixel)
  %79 = load i16, i16* @bitspersample, align 2
  %80 = zext i16 %79 to i32
  %81 = icmp ne i32 %80, 8
  br i1 %81, label %82, label %96

; <label>:82:                                     ; preds = %70
  %pgocount10 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 17)
  %83 = add i64 %pgocount10, 1
  store i64 %83, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 17)
  %84 = load i16, i16* @bitspersample, align 2
  %85 = zext i16 %84 to i32
  %86 = icmp ne i32 %85, 16
  br i1 %86, label %87, label %96

; <label>:87:                                     ; preds = %82
  %pgocount11 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 19)
  %88 = add i64 %pgocount11, 1
  store i64 %88, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 19)
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %90 = load i8**, i8*** %5, align 8
  %91 = load i32, i32* @optind, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8*, i8** %90, i64 %92
  %94 = load i8*, i8** %93, align 8
  %95 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %89, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.3, i32 0, i32 0), i8* %94)
  store i32 -3, i32* %3, align 4
  br label %523

; <label>:96:                                     ; preds = %82, %70
  %97 = load %struct.tiff*, %struct.tiff** @in, align 8
  %98 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %97, i32 262, i16* %10)
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %110

; <label>:100:                                    ; preds = %96
  %pgocount12 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 18)
  %101 = add i64 %pgocount12, 1
  store i64 %101, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 18)
  %102 = load i16, i16* %10, align 2
  %103 = zext i16 %102 to i32
  %104 = icmp ne i32 %103, 2
  br i1 %104, label %110, label %105

; <label>:105:                                    ; preds = %100
  %pgocount13 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 20)
  %106 = add i64 %pgocount13, 1
  store i64 %106, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 20)
  %107 = load i16, i16* @samplesperpixel, align 2
  %108 = zext i16 %107 to i32
  %109 = icmp slt i32 %108, 3
  br i1 %109, label %110, label %119

; <label>:110:                                    ; preds = %105, %100, %96
  %pgocount14 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 15)
  %111 = add i64 %pgocount14, 1
  store i64 %111, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 15)
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %113 = load i8**, i8*** %5, align 8
  %114 = load i32, i32* @optind, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8*, i8** %113, i64 %115
  %117 = load i8*, i8** %116, align 8
  %118 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %112, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i32 0, i32 0), i8* %117)
  store i32 -4, i32* %3, align 4
  br label %523

; <label>:119:                                    ; preds = %105
  %120 = load %struct.tiff*, %struct.tiff** @in, align 8
  %121 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %120, i32 284, i16* %9)
  %122 = load i16, i16* %9, align 2
  %123 = zext i16 %122 to i32
  %124 = icmp ne i32 %123, 1
  br i1 %124, label %125, label %134

; <label>:125:                                    ; preds = %119
  %pgocount15 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 21)
  %126 = add i64 %pgocount15, 1
  store i64 %126, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 21)
  %127 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %128 = load i8**, i8*** %5, align 8
  %129 = load i32, i32* @optind, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8*, i8** %128, i64 %130
  %132 = load i8*, i8** %131, align 8
  %133 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %127, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i32 0, i32 0), i8* %132)
  store i32 -5, i32* %3, align 4
  br label %523

; <label>:134:                                    ; preds = %119
  store %struct.colorbox* null, %struct.colorbox** @usedboxes, align 8
  %135 = load i32, i32* @num_colors, align 4
  %136 = sext i32 %135 to i64
  %137 = mul i64 %136, 48
  %138 = trunc i64 %137 to i32
  %139 = call i8* @_TIFFmalloc(i32 %138)
  %140 = bitcast i8* %139 to %struct.colorbox*
  store %struct.colorbox* %140, %struct.colorbox** @freeboxes, align 8
  store %struct.colorbox* %140, %struct.colorbox** %11, align 8
  %141 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %142 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %141, i64 1
  %143 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %144 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %143, i64 0
  %145 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %144, i32 0, i32 0
  store %struct.colorbox* %142, %struct.colorbox** %145, align 8
  %146 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %147 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %146, i64 0
  %148 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %147, i32 0, i32 1
  store %struct.colorbox* null, %struct.colorbox** %148, align 8
  store i32 1, i32* %6, align 4
  br label %149

; <label>:149:                                    ; preds = %175, %134
  %150 = load i32, i32* %6, align 4
  %151 = load i32, i32* @num_colors, align 4
  %152 = sub nsw i32 %151, 1
  %153 = icmp slt i32 %150, %152
  br i1 %153, label %154, label %179

; <label>:154:                                    ; preds = %149
  %155 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %156 = load i32, i32* %6, align 4
  %157 = add nsw i32 %156, 1
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %155, i64 %158
  %160 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %161 = load i32, i32* %6, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %160, i64 %162
  %164 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %163, i32 0, i32 0
  store %struct.colorbox* %159, %struct.colorbox** %164, align 8
  %165 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %166 = load i32, i32* %6, align 4
  %167 = sub nsw i32 %166, 1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %165, i64 %168
  %170 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %171 = load i32, i32* %6, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %170, i64 %172
  %174 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %173, i32 0, i32 1
  store %struct.colorbox* %169, %struct.colorbox** %174, align 8
  br label %175

; <label>:175:                                    ; preds = %154
  %pgocount16 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 9)
  %176 = add i64 %pgocount16, 1
  store i64 %176, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 9)
  %177 = load i32, i32* %6, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %6, align 4
  br label %149

; <label>:179:                                    ; preds = %149
  %180 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %181 = load i32, i32* @num_colors, align 4
  %182 = sub nsw i32 %181, 1
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %180, i64 %183
  %185 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %184, i32 0, i32 0
  store %struct.colorbox* null, %struct.colorbox** %185, align 8
  %186 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %187 = load i32, i32* @num_colors, align 4
  %188 = sub nsw i32 %187, 2
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %186, i64 %189
  %191 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %192 = load i32, i32* @num_colors, align 4
  %193 = sub nsw i32 %192, 1
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %191, i64 %194
  %196 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %195, i32 0, i32 1
  store %struct.colorbox* %190, %struct.colorbox** %196, align 8
  %197 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  store %struct.colorbox* %197, %struct.colorbox** %12, align 8
  %198 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %199 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %198, i32 0, i32 0
  %200 = load %struct.colorbox*, %struct.colorbox** %199, align 8
  store %struct.colorbox* %200, %struct.colorbox** @freeboxes, align 8
  %201 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %202 = icmp ne %struct.colorbox* %201, null
  br i1 %202, label %203, label %207

; <label>:203:                                    ; preds = %179
  %pgocount17 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 22)
  %204 = add i64 %pgocount17, 1
  store i64 %204, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 22)
  %205 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %206 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %205, i32 0, i32 1
  store %struct.colorbox* null, %struct.colorbox** %206, align 8
  br label %207

; <label>:207:                                    ; preds = %203, %179
  %208 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  %209 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %210 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %209, i32 0, i32 0
  store %struct.colorbox* %208, %struct.colorbox** %210, align 8
  %211 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  store %struct.colorbox* %211, %struct.colorbox** @usedboxes, align 8
  %212 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %213 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %212, i32 0, i32 0
  %214 = load %struct.colorbox*, %struct.colorbox** %213, align 8
  %215 = icmp ne %struct.colorbox* %214, null
  br i1 %215, label %216, label %223

; <label>:216:                                    ; preds = %207
  %pgocount18 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 23)
  %217 = add i64 %pgocount18, 1
  store i64 %217, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 23)
  %218 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %219 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %220 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %219, i32 0, i32 0
  %221 = load %struct.colorbox*, %struct.colorbox** %220, align 8
  %222 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %221, i32 0, i32 1
  store %struct.colorbox* %218, %struct.colorbox** %222, align 8
  br label %223

; <label>:223:                                    ; preds = %216, %207
  %224 = load %struct.tiff*, %struct.tiff** @in, align 8
  %225 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  call void @get_histogram(%struct.tiff* %224, %struct.colorbox* %225)
  br label %226

; <label>:226:                                    ; preds = %238, %223
  %227 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %228 = icmp ne %struct.colorbox* %227, null
  br i1 %228, label %229, label %239

; <label>:229:                                    ; preds = %226
  %230 = call %struct.colorbox* @largest_box()
  store %struct.colorbox* %230, %struct.colorbox** %12, align 8
  %231 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %232 = icmp ne %struct.colorbox* %231, null
  br i1 %232, label %233, label %236

; <label>:233:                                    ; preds = %229
  %pgocount19 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 11)
  %234 = add i64 %pgocount19, 1
  store i64 %234, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 11)
  %235 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  call void @splitbox(%struct.colorbox* %235)
  br label %238

; <label>:236:                                    ; preds = %229
  %pgocount20 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 14)
  %237 = add i64 %pgocount20, 1
  store i64 %237, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 14)
  store %struct.colorbox* null, %struct.colorbox** @freeboxes, align 8
  br label %238

; <label>:238:                                    ; preds = %236, %233
  br label %226

; <label>:239:                                    ; preds = %226
  store i32 0, i32* %6, align 4
  %240 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  store %struct.colorbox* %240, %struct.colorbox** %12, align 8
  br label %241

; <label>:241:                                    ; preds = %284, %239
  %242 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %243 = icmp ne %struct.colorbox* %242, null
  br i1 %243, label %244, label %291

; <label>:244:                                    ; preds = %241
  %245 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %246 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %245, i32 0, i32 2
  %247 = load i32, i32* %246, align 8
  %248 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %249 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %248, i32 0, i32 3
  %250 = load i32, i32* %249, align 4
  %251 = add nsw i32 %247, %250
  %252 = shl i32 %251, 3
  %253 = sdiv i32 %252, 2
  %254 = trunc i32 %253 to i16
  %255 = load i32, i32* %6, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %256
  store i16 %254, i16* %257, align 2
  %258 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %259 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %258, i32 0, i32 4
  %260 = load i32, i32* %259, align 8
  %261 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %262 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %261, i32 0, i32 5
  %263 = load i32, i32* %262, align 4
  %264 = add nsw i32 %260, %263
  %265 = shl i32 %264, 3
  %266 = sdiv i32 %265, 2
  %267 = trunc i32 %266 to i16
  %268 = load i32, i32* %6, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %269
  store i16 %267, i16* %270, align 2
  %271 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %272 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %271, i32 0, i32 6
  %273 = load i32, i32* %272, align 8
  %274 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %275 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %274, i32 0, i32 7
  %276 = load i32, i32* %275, align 4
  %277 = add nsw i32 %273, %276
  %278 = shl i32 %277, 3
  %279 = sdiv i32 %278, 2
  %280 = trunc i32 %279 to i16
  %281 = load i32, i32* %6, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %282
  store i16 %280, i16* %283, align 2
  br label %284

; <label>:284:                                    ; preds = %244
  %pgocount21 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 10)
  %285 = add i64 %pgocount21, 1
  store i64 %285, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 10)
  %286 = load i32, i32* %6, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, i32* %6, align 4
  %288 = load %struct.colorbox*, %struct.colorbox** %12, align 8
  %289 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %288, i32 0, i32 0
  %290 = load %struct.colorbox*, %struct.colorbox** %289, align 8
  store %struct.colorbox* %290, %struct.colorbox** %12, align 8
  br label %241

; <label>:291:                                    ; preds = %241
  %292 = load %struct.colorbox*, %struct.colorbox** %11, align 8
  %293 = bitcast %struct.colorbox* %292 to i8*
  call void @_TIFFfree(i8* %293)
  store %struct.colorbox* null, %struct.colorbox** @usedboxes, align 8
  store %struct.colorbox* null, %struct.colorbox** @freeboxes, align 8
  %294 = call i8* @_TIFFmalloc(i32 512)
  %295 = bitcast i8* %294 to %struct.C_cell**
  store %struct.C_cell** %295, %struct.C_cell*** @ColorCells, align 8
  %296 = load %struct.C_cell**, %struct.C_cell*** @ColorCells, align 8
  %297 = bitcast %struct.C_cell** %296 to i8*
  call void @_TIFFmemset(i8* %297, i32 0, i32 512)
  call void @map_colortable()
  %298 = load i8**, i8*** %5, align 8
  %299 = load i32, i32* @optind, align 4
  %300 = add nsw i32 %299, 1
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i8*, i8** %298, i64 %301
  %303 = load i8*, i8** %302, align 8
  %304 = call %struct.tiff* @TIFFOpen(i8* %303, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct.tiff* %304, %struct.tiff** @out, align 8
  %305 = load %struct.tiff*, %struct.tiff** @out, align 8
  %306 = icmp eq %struct.tiff* %305, null
  br i1 %306, label %307, label %309

; <label>:307:                                    ; preds = %291
  %pgocount22 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 35)
  %308 = add i64 %pgocount22, 1
  store i64 %308, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 35)
  store i32 -2, i32* %3, align 4
  br label %523

; <label>:309:                                    ; preds = %291
  %310 = load %struct.tiff*, %struct.tiff** @in, align 8
  %311 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %310, i32 254, i32* %14)
  %312 = icmp ne i32 %311, 0
  br i1 %312, label %313, label %318

; <label>:313:                                    ; preds = %309
  %pgocount23 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 24)
  %314 = add i64 %pgocount23, 1
  store i64 %314, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 24)
  %315 = load %struct.tiff*, %struct.tiff** @out, align 8
  %316 = load i32, i32* %14, align 4
  %317 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %315, i32 254, i32 %316)
  br label %318

; <label>:318:                                    ; preds = %313, %309
  %319 = load %struct.tiff*, %struct.tiff** @in, align 8
  %320 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %319, i32 256, i32* %14)
  %321 = icmp ne i32 %320, 0
  br i1 %321, label %322, label %327

; <label>:322:                                    ; preds = %318
  %pgocount24 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 25)
  %323 = add i64 %pgocount24, 1
  store i64 %323, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 25)
  %324 = load %struct.tiff*, %struct.tiff** @out, align 8
  %325 = load i32, i32* %14, align 4
  %326 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %324, i32 256, i32 %325)
  br label %327

; <label>:327:                                    ; preds = %322, %318
  %328 = load %struct.tiff*, %struct.tiff** @out, align 8
  %329 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %328, i32 258, i32 8)
  %330 = load i16, i16* @compression, align 2
  %331 = zext i16 %330 to i32
  %332 = icmp ne i32 %331, 65535
  br i1 %332, label %333, label %355

; <label>:333:                                    ; preds = %327
  %334 = load %struct.tiff*, %struct.tiff** @out, align 8
  %335 = load i16, i16* @compression, align 2
  %336 = zext i16 %335 to i32
  %337 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %334, i32 259, i32 %336)
  %338 = load i16, i16* @compression, align 2
  %339 = zext i16 %338 to i32
  switch i32 %339, label %353 [
    i32 5, label %._crit_edge
    i32 32946, label %341
  ]

._crit_edge:                                      ; preds = %333
  %pgocount25 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 6)
  %340 = add i64 %pgocount25, 1
  store i64 %340, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 6)
  br label %341

; <label>:341:                                    ; preds = %._crit_edge, %333
  %342 = load i16, i16* @predictor, align 2
  %343 = zext i16 %342 to i32
  %344 = icmp ne i32 %343, 0
  br i1 %344, label %345, label %351

; <label>:345:                                    ; preds = %341
  %pgocount26 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 41)
  %346 = add i64 %pgocount26, 1
  store i64 %346, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 41)
  %347 = load %struct.tiff*, %struct.tiff** @out, align 8
  %348 = load i16, i16* @predictor, align 2
  %349 = zext i16 %348 to i32
  %350 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %347, i32 317, i32 %349)
  br label %351

; <label>:351:                                    ; preds = %345, %341
  %pgocount27 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 39)
  %352 = add i64 %pgocount27, 1
  store i64 %352, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 39)
  br label %353

; <label>:353:                                    ; preds = %351, %333
  %pgocount28 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 36)
  %354 = add i64 %pgocount28, 1
  store i64 %354, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 36)
  br label %367

; <label>:355:                                    ; preds = %327
  %356 = load %struct.tiff*, %struct.tiff** @in, align 8
  %357 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %356, i32 259, i16* @compression)
  %358 = icmp ne i32 %357, 0
  br i1 %358, label %359, label %365

; <label>:359:                                    ; preds = %355
  %pgocount29 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 40)
  %360 = add i64 %pgocount29, 1
  store i64 %360, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 40)
  %361 = load %struct.tiff*, %struct.tiff** @out, align 8
  %362 = load i16, i16* @compression, align 2
  %363 = zext i16 %362 to i32
  %364 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %361, i32 259, i32 %363)
  br label %365

; <label>:365:                                    ; preds = %359, %355
  %pgocount30 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 37)
  %366 = add i64 %pgocount30, 1
  store i64 %366, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 37)
  br label %367

; <label>:367:                                    ; preds = %365, %353
  %368 = load %struct.tiff*, %struct.tiff** @out, align 8
  %369 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %368, i32 262, i32 3)
  %370 = load %struct.tiff*, %struct.tiff** @in, align 8
  %371 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %370, i32 274, i16* %8)
  %372 = icmp ne i32 %371, 0
  br i1 %372, label %373, label %379

; <label>:373:                                    ; preds = %367
  %pgocount31 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 26)
  %374 = add i64 %pgocount31, 1
  store i64 %374, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 26)
  %375 = load %struct.tiff*, %struct.tiff** @out, align 8
  %376 = load i16, i16* %8, align 2
  %377 = zext i16 %376 to i32
  %378 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %375, i32 274, i32 %377)
  br label %379

; <label>:379:                                    ; preds = %373, %367
  %380 = load %struct.tiff*, %struct.tiff** @out, align 8
  %381 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %380, i32 277, i32 1)
  %382 = load %struct.tiff*, %struct.tiff** @in, align 8
  %383 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %382, i32 284, i16* %8)
  %384 = icmp ne i32 %383, 0
  br i1 %384, label %385, label %391

; <label>:385:                                    ; preds = %379
  %pgocount32 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 27)
  %386 = add i64 %pgocount32, 1
  store i64 %386, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 27)
  %387 = load %struct.tiff*, %struct.tiff** @out, align 8
  %388 = load i16, i16* %8, align 2
  %389 = zext i16 %388 to i32
  %390 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %387, i32 284, i32 %389)
  br label %391

; <label>:391:                                    ; preds = %385, %379
  %392 = load %struct.tiff*, %struct.tiff** @out, align 8
  %393 = load %struct.tiff*, %struct.tiff** @out, align 8
  %394 = load i32, i32* @rowsperstrip, align 4
  %395 = call i32 @TIFFDefaultStripSize(%struct.tiff* %393, i32 %394)
  %396 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %392, i32 278, i32 %395)
  %397 = load %struct.tiff*, %struct.tiff** @in, align 8
  %398 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %397, i32 280, i16* %8)
  %399 = icmp ne i32 %398, 0
  br i1 %399, label %400, label %406

; <label>:400:                                    ; preds = %391
  %pgocount33 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 28)
  %401 = add i64 %pgocount33, 1
  store i64 %401, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 28)
  %402 = load %struct.tiff*, %struct.tiff** @out, align 8
  %403 = load i16, i16* %8, align 2
  %404 = zext i16 %403 to i32
  %405 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %402, i32 280, i32 %404)
  br label %406

; <label>:406:                                    ; preds = %400, %391
  %407 = load %struct.tiff*, %struct.tiff** @in, align 8
  %408 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %407, i32 281, i16* %8)
  %409 = icmp ne i32 %408, 0
  br i1 %409, label %410, label %416

; <label>:410:                                    ; preds = %406
  %pgocount34 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 29)
  %411 = add i64 %pgocount34, 1
  store i64 %411, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 29)
  %412 = load %struct.tiff*, %struct.tiff** @out, align 8
  %413 = load i16, i16* %8, align 2
  %414 = zext i16 %413 to i32
  %415 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %412, i32 281, i32 %414)
  br label %416

; <label>:416:                                    ; preds = %410, %406
  %417 = load %struct.tiff*, %struct.tiff** @in, align 8
  %418 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %417, i32 296, i16* %8)
  %419 = icmp ne i32 %418, 0
  br i1 %419, label %420, label %426

; <label>:420:                                    ; preds = %416
  %pgocount35 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 30)
  %421 = add i64 %pgocount35, 1
  store i64 %421, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 30)
  %422 = load %struct.tiff*, %struct.tiff** @out, align 8
  %423 = load i16, i16* %8, align 2
  %424 = zext i16 %423 to i32
  %425 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %422, i32 296, i32 %424)
  br label %426

; <label>:426:                                    ; preds = %420, %416
  %427 = load %struct.tiff*, %struct.tiff** @in, align 8
  %428 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %427, i32 282, float* %13)
  %429 = icmp ne i32 %428, 0
  br i1 %429, label %430, label %436

; <label>:430:                                    ; preds = %426
  %pgocount36 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 31)
  %431 = add i64 %pgocount36, 1
  store i64 %431, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 31)
  %432 = load %struct.tiff*, %struct.tiff** @out, align 8
  %433 = load float, float* %13, align 4
  %434 = fpext float %433 to double
  %435 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %432, i32 282, double %434)
  br label %436

; <label>:436:                                    ; preds = %430, %426
  %437 = load %struct.tiff*, %struct.tiff** @in, align 8
  %438 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %437, i32 283, float* %13)
  %439 = icmp ne i32 %438, 0
  br i1 %439, label %440, label %446

; <label>:440:                                    ; preds = %436
  %pgocount37 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 32)
  %441 = add i64 %pgocount37, 1
  store i64 %441, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 32)
  %442 = load %struct.tiff*, %struct.tiff** @out, align 8
  %443 = load float, float* %13, align 4
  %444 = fpext float %443 to double
  %445 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %442, i32 283, double %444)
  br label %446

; <label>:446:                                    ; preds = %440, %436
  %447 = load %struct.tiff*, %struct.tiff** @in, align 8
  %448 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %447, i32 286, float* %13)
  %449 = icmp ne i32 %448, 0
  br i1 %449, label %450, label %456

; <label>:450:                                    ; preds = %446
  %pgocount38 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 33)
  %451 = add i64 %pgocount38, 1
  store i64 %451, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 33)
  %452 = load %struct.tiff*, %struct.tiff** @out, align 8
  %453 = load float, float* %13, align 4
  %454 = fpext float %453 to double
  %455 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %452, i32 286, double %454)
  br label %456

; <label>:456:                                    ; preds = %450, %446
  %457 = load %struct.tiff*, %struct.tiff** @in, align 8
  %458 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %457, i32 287, float* %13)
  %459 = icmp ne i32 %458, 0
  br i1 %459, label %460, label %466

; <label>:460:                                    ; preds = %456
  %pgocount39 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 34)
  %461 = add i64 %pgocount39, 1
  store i64 %461, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 34)
  %462 = load %struct.tiff*, %struct.tiff** @out, align 8
  %463 = load float, float* %13, align 4
  %464 = fpext float %463 to double
  %465 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %462, i32 287, double %464)
  br label %466

; <label>:466:                                    ; preds = %460, %456
  %467 = load i32, i32* %7, align 4
  %468 = icmp ne i32 %467, 0
  br i1 %468, label %469, label %472

; <label>:469:                                    ; preds = %466
  %470 = load %struct.tiff*, %struct.tiff** @in, align 8
  %471 = load %struct.tiff*, %struct.tiff** @out, align 8
  call void @quant_fsdither(%struct.tiff* %470, %struct.tiff* %471)
  br label %476

; <label>:472:                                    ; preds = %466
  %pgocount40 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 38)
  %473 = add i64 %pgocount40, 1
  store i64 %473, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 38)
  %474 = load %struct.tiff*, %struct.tiff** @in, align 8
  %475 = load %struct.tiff*, %struct.tiff** @out, align 8
  call void @quant(%struct.tiff* %474, %struct.tiff* %475)
  br label %476

; <label>:476:                                    ; preds = %472, %469
  store i32 0, i32* %6, align 4
  br label %477

; <label>:477:                                    ; preds = %515, %476
  %478 = load i32, i32* %6, align 4
  %479 = icmp slt i32 %478, 256
  br i1 %479, label %480, label %518

; <label>:480:                                    ; preds = %477
  %pgocount41 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 12)
  %481 = add i64 %pgocount41, 1
  store i64 %481, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_main1, i64 0, i64 12)
  %482 = load i32, i32* %6, align 4
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %483
  %485 = load i16, i16* %484, align 2
  %486 = zext i16 %485 to i64
  %487 = mul nsw i64 %486, 65535
  %488 = sdiv i64 %487, 255
  %489 = trunc i64 %488 to i16
  %490 = load i32, i32* %6, align 4
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %491
  store i16 %489, i16* %492, align 2
  %493 = load i32, i32* %6, align 4
  %494 = sext i32 %493 to i64
  %495 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %494
  %496 = load i16, i16* %495, align 2
  %497 = zext i16 %496 to i64
  %498 = mul nsw i64 %497, 65535
  %499 = sdiv i64 %498, 255
  %500 = trunc i64 %499 to i16
  %501 = load i32, i32* %6, align 4
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %502
  store i16 %500, i16* %503, align 2
  %504 = load i32, i32* %6, align 4
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %505
  %507 = load i16, i16* %506, align 2
  %508 = zext i16 %507 to i64
  %509 = mul nsw i64 %508, 65535
  %510 = sdiv i64 %509, 255
  %511 = trunc i64 %510 to i16
  %512 = load i32, i32* %6, align 4
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %513
  store i16 %511, i16* %514, align 2
  br label %515

; <label>:515:                                    ; preds = %480
  %516 = load i32, i32* %6, align 4
  %517 = add nsw i32 %516, 1
  store i32 %517, i32* %6, align 4
  br label %477

; <label>:518:                                    ; preds = %477
  %519 = load %struct.tiff*, %struct.tiff** @out, align 8
  %520 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %519, i32 320, i16* getelementptr inbounds ([256 x i16], [256 x i16]* @rm, i32 0, i32 0), i16* getelementptr inbounds ([256 x i16], [256 x i16]* @gm, i32 0, i32 0), i16* getelementptr inbounds ([256 x i16], [256 x i16]* @bm, i32 0, i32 0))
  %521 = load %struct.tiff*, %struct.tiff** @in, align 8
  call void @TIFFClose(%struct.tiff* %521)
  %522 = load %struct.tiff*, %struct.tiff** @out, align 8
  call void @TIFFClose(%struct.tiff* %522)
  store i32 0, i32* %3, align 4
  br label %523

; <label>:523:                                    ; preds = %518, %307, %125, %110, %87, %68
  %524 = load i32, i32* %3, align 4
  ret i32 %524
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #1

; Function Attrs: nounwind uwtable
define internal i32 @processCompressOptions(i8*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0)) #6
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 0)
  store i16 1, i16* @compression, align 2
  br label %56

; <label>:11:                                     ; preds = %1
  %12 = load i8*, i8** %3, align 8
  %13 = call i32 @strcmp(i8* %12, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.22, i32 0, i32 0)) #6
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 1)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 1)
  store i16 -32763, i16* @compression, align 2
  br label %55

; <label>:17:                                     ; preds = %11
  %18 = load i8*, i8** %3, align 8
  %19 = call i32 @strncmp(i8* %18, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i64 3) #6
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %34

; <label>:21:                                     ; preds = %17
  %22 = load i8*, i8** %3, align 8
  %23 = call i8* @strchr(i8* %22, i32 58) #6
  store i8* %23, i8** %4, align 8
  %24 = load i8*, i8** %4, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 4)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 4)
  %28 = load i8*, i8** %4, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 1
  %30 = call i32 @atoi(i8* %29) #6
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* @predictor, align 2
  br label %32

; <label>:32:                                     ; preds = %26, %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 3)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 3)
  store i16 5, i16* @compression, align 2
  br label %54

; <label>:34:                                     ; preds = %17
  %35 = load i8*, i8** %3, align 8
  %36 = call i32 @strncmp(i8* %35, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i32 0, i32 0), i64 3) #6
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %50

; <label>:38:                                     ; preds = %34
  %39 = load i8*, i8** %3, align 8
  %40 = call i8* @strchr(i8* %39, i32 58) #6
  store i8* %40, i8** %5, align 8
  %41 = load i8*, i8** %5, align 8
  %42 = icmp ne i8* %41, null
  br i1 %42, label %43, label %49

; <label>:43:                                     ; preds = %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 6)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 6)
  %45 = load i8*, i8** %5, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 1
  %47 = call i32 @atoi(i8* %46) #6
  %48 = trunc i32 %47 to i16
  store i16 %48, i16* @predictor, align 2
  br label %49

; <label>:49:                                     ; preds = %43, %38
  store i16 -32590, i16* @compression, align 2
  br label %52

; <label>:50:                                     ; preds = %34
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 2)
  %51 = add i64 %pgocount5, 1
  store i64 %51, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %57

; <label>:52:                                     ; preds = %49
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 5)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_processCompressOptions, i64 0, i64 5)
  br label %54

; <label>:54:                                     ; preds = %52, %32
  br label %55

; <label>:55:                                     ; preds = %54, %15
  br label %56

; <label>:56:                                     ; preds = %55, %9
  store i32 1, i32* %2, align 4
  br label %57

; <label>:57:                                     ; preds = %56, %50
  %58 = load i32, i32* %2, align 4
  ret i32 %58
}

; Function Attrs: nounwind uwtable
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
  %8 = getelementptr inbounds [15 x i8*], [15 x i8*]* @stuff, i64 0, i64 %7
  %9 = load i8*, i8** %8, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %22

; <label>:11:                                     ; preds = %5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = load i32, i32* %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [15 x i8*], [15 x i8*]* @stuff, i64 0, i64 %14
  %16 = load i8*, i8** %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.25, i32 0, i32 0), i8* %16)
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
declare i32 @atoi(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare %struct.tiff* @TIFFOpen(i8*, i8*) #3

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) #3

declare i8* @_TIFFmalloc(i32) #3

; Function Attrs: nounwind uwtable
define internal void @get_histogram(%struct.tiff*, %struct.colorbox*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.colorbox*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.colorbox* %1, %struct.colorbox** %4, align 8
  %13 = load %struct.tiff*, %struct.tiff** %3, align 8
  %14 = call i32 @TIFFScanlineSize(%struct.tiff* %13)
  %15 = call i8* @_TIFFmalloc(i32 %14)
  store i8* %15, i8** %11, align 8
  %16 = load i8*, i8** %11, align 8
  %17 = icmp eq i8* %16, null
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 11)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 11)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.26, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:22:                                     ; preds = %2
  %23 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %24 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %23, i32 0, i32 6
  store i32 999, i32* %24, align 8
  %25 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %26 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %25, i32 0, i32 4
  store i32 999, i32* %26, align 8
  %27 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %28 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %27, i32 0, i32 2
  store i32 999, i32* %28, align 8
  %29 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %30 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %29, i32 0, i32 7
  store i32 -1, i32* %30, align 4
  %31 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %32 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %31, i32 0, i32 5
  store i32 -1, i32* %32, align 4
  %33 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %34 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %33, i32 0, i32 3
  store i32 -1, i32* %34, align 4
  %35 = load i32, i32* @imagewidth, align 4
  %36 = load i32, i32* @imagelength, align 4
  %37 = mul i32 %35, %36
  %38 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %39 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %38, i32 0, i32 8
  store i32 %37, i32* %39, align 8
  store i32* getelementptr inbounds ([32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 0, i64 0, i64 0), i32** %12, align 8
  store i32 32768, i32* %10, align 4
  br label %40

; <label>:40:                                     ; preds = %44, %22
  %41 = load i32, i32* %10, align 4
  %42 = add i32 %41, -1
  store i32 %42, i32* %10, align 4
  %43 = icmp ugt i32 %41, 0
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 7)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 7)
  %46 = load i32*, i32** %12, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %12, align 8
  store i32 0, i32* %46, align 4
  br label %40

; <label>:48:                                     ; preds = %40
  store i32 0, i32* %10, align 4
  br label %49

; <label>:49:                                     ; preds = %164, %48
  %50 = load i32, i32* %10, align 4
  %51 = load i32, i32* @imagelength, align 4
  %52 = icmp ult i32 %50, %51
  br i1 %52, label %53, label %167

; <label>:53:                                     ; preds = %49
  %54 = load %struct.tiff*, %struct.tiff** %3, align 8
  %55 = load i8*, i8** %11, align 8
  %56 = load i32, i32* %10, align 4
  %57 = call i32 @TIFFReadScanline(%struct.tiff* %54, i8* %55, i32 %56, i16 zeroext 0)
  %58 = icmp sle i32 %57, 0
  br i1 %58, label %59, label %61

; <label>:59:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 10)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 10)
  br label %167

; <label>:61:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 8)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 8)
  %63 = load i8*, i8** %11, align 8
  store i8* %63, i8** %5, align 8
  %64 = load i32, i32* @imagewidth, align 4
  store i32 %64, i32* %9, align 4
  br label %65

; <label>:65:                                     ; preds = %151, %61
  %66 = load i32, i32* %9, align 4
  %67 = add i32 %66, -1
  store i32 %67, i32* %9, align 4
  %68 = icmp ugt i32 %66, 0
  br i1 %68, label %69, label %163

; <label>:69:                                     ; preds = %65
  %70 = load i8*, i8** %5, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %5, align 8
  %72 = load i8, i8* %70, align 1
  %73 = zext i8 %72 to i32
  %74 = ashr i32 %73, 3
  store i32 %74, i32* %6, align 4
  %75 = load i8*, i8** %5, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %5, align 8
  %77 = load i8, i8* %75, align 1
  %78 = zext i8 %77 to i32
  %79 = ashr i32 %78, 3
  store i32 %79, i32* %7, align 4
  %80 = load i8*, i8** %5, align 8
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %81, i8** %5, align 8
  %82 = load i8, i8* %80, align 1
  %83 = zext i8 %82 to i32
  %84 = ashr i32 %83, 3
  store i32 %84, i32* %8, align 4
  %85 = load i32, i32* %6, align 4
  %86 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %87 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %86, i32 0, i32 2
  %88 = load i32, i32* %87, align 8
  %89 = icmp slt i32 %85, %88
  br i1 %89, label %90, label %95

; <label>:90:                                     ; preds = %69
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 1)
  %91 = add i64 %pgocount4, 1
  store i64 %91, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 1)
  %92 = load i32, i32* %6, align 4
  %93 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %94 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %93, i32 0, i32 2
  store i32 %92, i32* %94, align 8
  br label %95

; <label>:95:                                     ; preds = %90, %69
  %96 = load i32, i32* %6, align 4
  %97 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %98 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %97, i32 0, i32 3
  %99 = load i32, i32* %98, align 4
  %100 = icmp sgt i32 %96, %99
  br i1 %100, label %101, label %106

; <label>:101:                                    ; preds = %95
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 2)
  %102 = add i64 %pgocount5, 1
  store i64 %102, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 2)
  %103 = load i32, i32* %6, align 4
  %104 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %105 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %104, i32 0, i32 3
  store i32 %103, i32* %105, align 4
  br label %106

; <label>:106:                                    ; preds = %101, %95
  %107 = load i32, i32* %7, align 4
  %108 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %109 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %108, i32 0, i32 4
  %110 = load i32, i32* %109, align 8
  %111 = icmp slt i32 %107, %110
  br i1 %111, label %112, label %117

; <label>:112:                                    ; preds = %106
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 3)
  %113 = add i64 %pgocount6, 1
  store i64 %113, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 3)
  %114 = load i32, i32* %7, align 4
  %115 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %116 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %115, i32 0, i32 4
  store i32 %114, i32* %116, align 8
  br label %117

; <label>:117:                                    ; preds = %112, %106
  %118 = load i32, i32* %7, align 4
  %119 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %120 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %119, i32 0, i32 5
  %121 = load i32, i32* %120, align 4
  %122 = icmp sgt i32 %118, %121
  br i1 %122, label %123, label %128

; <label>:123:                                    ; preds = %117
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 4)
  %124 = add i64 %pgocount7, 1
  store i64 %124, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 4)
  %125 = load i32, i32* %7, align 4
  %126 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %127 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %126, i32 0, i32 5
  store i32 %125, i32* %127, align 4
  br label %128

; <label>:128:                                    ; preds = %123, %117
  %129 = load i32, i32* %8, align 4
  %130 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %131 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %130, i32 0, i32 6
  %132 = load i32, i32* %131, align 8
  %133 = icmp slt i32 %129, %132
  br i1 %133, label %134, label %139

; <label>:134:                                    ; preds = %128
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 5)
  %135 = add i64 %pgocount8, 1
  store i64 %135, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 5)
  %136 = load i32, i32* %8, align 4
  %137 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %138 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %137, i32 0, i32 6
  store i32 %136, i32* %138, align 8
  br label %139

; <label>:139:                                    ; preds = %134, %128
  %140 = load i32, i32* %8, align 4
  %141 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %142 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %141, i32 0, i32 7
  %143 = load i32, i32* %142, align 4
  %144 = icmp sgt i32 %140, %143
  br i1 %144, label %146, label %._crit_edge

._crit_edge:                                      ; preds = %139
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 0)
  %145 = add i64 %pgocount9, 1
  store i64 %145, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 0)
  br label %151

; <label>:146:                                    ; preds = %139
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 6)
  %147 = add i64 %pgocount10, 1
  store i64 %147, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 6)
  %148 = load i32, i32* %8, align 4
  %149 = load %struct.colorbox*, %struct.colorbox** %4, align 8
  %150 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %149, i32 0, i32 7
  store i32 %148, i32* %150, align 4
  br label %151

; <label>:151:                                    ; preds = %._crit_edge, %146
  %152 = load i32, i32* %6, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %153
  %155 = load i32, i32* %7, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %154, i64 0, i64 %156
  %158 = load i32, i32* %8, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [32 x i32], [32 x i32]* %157, i64 0, i64 %159
  %161 = load i32, i32* %160, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %160, align 4
  br label %65

; <label>:163:                                    ; preds = %65
  br label %164

; <label>:164:                                    ; preds = %163
  %165 = load i32, i32* %10, align 4
  %166 = add i32 %165, 1
  store i32 %166, i32* %10, align 4
  br label %49

; <label>:167:                                    ; preds = %59, %49
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 9)
  %168 = add i64 %pgocount11, 1
  store i64 %168, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_get_histogram, i64 0, i64 9)
  %169 = load i8*, i8** %11, align 8
  call void @_TIFFfree(i8* %169)
  ret void
}

; Function Attrs: nounwind uwtable
define internal %struct.colorbox* @largest_box() #0 {
  %1 = alloca %struct.colorbox*, align 8
  %2 = alloca %struct.colorbox*, align 8
  %3 = alloca i32, align 4
  store %struct.colorbox* null, %struct.colorbox** %2, align 8
  store i32 -1, i32* %3, align 4
  %4 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  store %struct.colorbox* %4, %struct.colorbox** %1, align 8
  br label %5

; <label>:5:                                      ; preds = %47, %0
  %6 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %7 = icmp ne %struct.colorbox* %6, null
  br i1 %7, label %8, label %52

; <label>:8:                                      ; preds = %5
  %9 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %10 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %9, i32 0, i32 3
  %11 = load i32, i32* %10, align 4
  %12 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %13 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %12, i32 0, i32 2
  %14 = load i32, i32* %13, align 8
  %15 = icmp sgt i32 %11, %14
  br i1 %15, label %35, label %16

; <label>:16:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 2)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 2)
  %18 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %19 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %18, i32 0, i32 5
  %20 = load i32, i32* %19, align 4
  %21 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %22 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %21, i32 0, i32 4
  %23 = load i32, i32* %22, align 8
  %24 = icmp sgt i32 %20, %23
  br i1 %24, label %35, label %25

; <label>:25:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 4)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 4)
  %27 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %28 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %27, i32 0, i32 7
  %29 = load i32, i32* %28, align 4
  %30 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %31 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %30, i32 0, i32 6
  %32 = load i32, i32* %31, align 8
  %33 = icmp sgt i32 %29, %32
  br i1 %33, label %35, label %._crit_edge

._crit_edge:                                      ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 0)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 0)
  br label %46

; <label>:35:                                     ; preds = %25, %16, %8
  %36 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %37 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %36, i32 0, i32 8
  %38 = load i32, i32* %37, align 8
  %39 = load i32, i32* %3, align 4
  %40 = icmp sgt i32 %38, %39
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 3)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 3)
  %43 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  store %struct.colorbox* %43, %struct.colorbox** %2, align 8
  %44 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %43, i32 0, i32 8
  %45 = load i32, i32* %44, align 8
  store i32 %45, i32* %3, align 4
  br label %46

; <label>:46:                                     ; preds = %._crit_edge, %41, %35
  br label %47

; <label>:47:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 1)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 1)
  %49 = load %struct.colorbox*, %struct.colorbox** %1, align 8
  %50 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %49, i32 0, i32 0
  %51 = load %struct.colorbox*, %struct.colorbox** %50, align 8
  store %struct.colorbox* %51, %struct.colorbox** %1, align 8
  br label %5

; <label>:52:                                     ; preds = %5
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 5)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_largest_box, i64 0, i64 5)
  %54 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  ret %struct.colorbox* %54
}

; Function Attrs: nounwind uwtable
define internal void @splitbox(%struct.colorbox*) #0 {
  %2 = alloca %struct.colorbox*, align 8
  %3 = alloca [32 x i32], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.colorbox*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.colorbox* %0, %struct.colorbox** %2, align 8
  %18 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %19 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %18, i32 0, i32 3
  %20 = load i32, i32* %19, align 4
  %21 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %22 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %21, i32 0, i32 2
  %23 = load i32, i32* %22, align 8
  %24 = sub nsw i32 %20, %23
  store i32 %24, i32* %9, align 4
  %25 = load i32, i32* %9, align 4
  %26 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %27 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %26, i32 0, i32 5
  %28 = load i32, i32* %27, align 4
  %29 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %30 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %29, i32 0, i32 4
  %31 = load i32, i32* %30, align 8
  %32 = sub nsw i32 %28, %31
  %33 = icmp sge i32 %25, %32
  br i1 %33, label %34, label %47

; <label>:34:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 15)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 15)
  %36 = load i32, i32* %9, align 4
  %37 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %38 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %37, i32 0, i32 7
  %39 = load i32, i32* %38, align 4
  %40 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %41 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %40, i32 0, i32 6
  %42 = load i32, i32* %41, align 8
  %43 = sub nsw i32 %39, %42
  %44 = icmp sge i32 %36, %43
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 19)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 19)
  store i32 0, i32* %17, align 4
  br label %68

; <label>:47:                                     ; preds = %34, %1
  %48 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %49 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %48, i32 0, i32 5
  %50 = load i32, i32* %49, align 4
  %51 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %52 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %51, i32 0, i32 4
  %53 = load i32, i32* %52, align 8
  %54 = sub nsw i32 %50, %53
  %55 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %56 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %55, i32 0, i32 7
  %57 = load i32, i32* %56, align 4
  %58 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %59 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %58, i32 0, i32 6
  %60 = load i32, i32* %59, align 8
  %61 = sub nsw i32 %57, %60
  %62 = icmp sge i32 %54, %61
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 17)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 17)
  store i32 1, i32* %17, align 4
  br label %67

; <label>:65:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 18)
  %66 = add i64 %pgocount3, 1
  store i64 %66, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 18)
  store i32 2, i32* %17, align 4
  br label %67

; <label>:67:                                     ; preds = %65, %63
  br label %68

; <label>:68:                                     ; preds = %67, %45
  %69 = load i32, i32* %17, align 4
  switch i32 %69, label %305 [
    i32 0, label %70
    i32 1, label %148
    i32 2, label %226
  ]

; <label>:70:                                     ; preds = %68
  %71 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %72 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %71, i32 0, i32 2
  %73 = load i32, i32* %72, align 8
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 %74
  store i32* %75, i32** %8, align 8
  %76 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %77 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %76, i32 0, i32 2
  %78 = load i32, i32* %77, align 8
  store i32 %78, i32* %11, align 4
  br label %79

; <label>:79:                                     ; preds = %137, %70
  %80 = load i32, i32* %11, align 4
  %81 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %82 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %81, i32 0, i32 3
  %83 = load i32, i32* %82, align 4
  %84 = icmp sle i32 %80, %83
  br i1 %84, label %85, label %140

; <label>:85:                                     ; preds = %79
  %pgocount4 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 12)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 12)
  %87 = load i32*, i32** %8, align 8
  store i32 0, i32* %87, align 4
  %88 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %89 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %88, i32 0, i32 4
  %90 = load i32, i32* %89, align 8
  store i32 %90, i32* %12, align 4
  br label %91

; <label>:91:                                     ; preds = %130, %85
  %92 = load i32, i32* %12, align 4
  %93 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %94 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %93, i32 0, i32 5
  %95 = load i32, i32* %94, align 4
  %96 = icmp sle i32 %92, %95
  br i1 %96, label %97, label %134

; <label>:97:                                     ; preds = %91
  %98 = load i32, i32* %11, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %99
  %101 = load i32, i32* %12, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %100, i64 0, i64 %102
  %104 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %105 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %104, i32 0, i32 6
  %106 = load i32, i32* %105, align 8
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [32 x i32], [32 x i32]* %103, i64 0, i64 %107
  store i32* %108, i32** %7, align 8
  %109 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %110 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %109, i32 0, i32 6
  %111 = load i32, i32* %110, align 8
  store i32 %111, i32* %13, align 4
  br label %112

; <label>:112:                                    ; preds = %125, %97
  %113 = load i32, i32* %13, align 4
  %114 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %115 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %114, i32 0, i32 7
  %116 = load i32, i32* %115, align 4
  %117 = icmp sle i32 %113, %116
  br i1 %117, label %118, label %129

; <label>:118:                                    ; preds = %112
  %119 = load i32*, i32** %7, align 8
  %120 = getelementptr inbounds i32, i32* %119, i32 1
  store i32* %120, i32** %7, align 8
  %121 = load i32, i32* %119, align 4
  %122 = load i32*, i32** %8, align 8
  %123 = load i32, i32* %122, align 4
  %124 = add nsw i32 %123, %121
  store i32 %124, i32* %122, align 4
  br label %125

; <label>:125:                                    ; preds = %118
  %pgocount5 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 0)
  %126 = add i64 %pgocount5, 1
  store i64 %126, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 0)
  %127 = load i32, i32* %13, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %13, align 4
  br label %112

; <label>:129:                                    ; preds = %112
  br label %130

; <label>:130:                                    ; preds = %129
  %pgocount6 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 3)
  %131 = add i64 %pgocount6, 1
  store i64 %131, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 3)
  %132 = load i32, i32* %12, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %12, align 4
  br label %91

; <label>:134:                                    ; preds = %91
  %135 = load i32*, i32** %8, align 8
  %136 = getelementptr inbounds i32, i32* %135, i32 1
  store i32* %136, i32** %8, align 8
  br label %137

; <label>:137:                                    ; preds = %134
  %138 = load i32, i32* %11, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %11, align 4
  br label %79

; <label>:140:                                    ; preds = %79
  %pgocount7 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 24)
  %141 = add i64 %pgocount7, 1
  store i64 %141, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 24)
  %142 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %143 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %142, i32 0, i32 2
  %144 = load i32, i32* %143, align 8
  store i32 %144, i32* %4, align 4
  %145 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %146 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %145, i32 0, i32 3
  %147 = load i32, i32* %146, align 4
  store i32 %147, i32* %5, align 4
  br label %305

; <label>:148:                                    ; preds = %68
  %149 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %150 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %149, i32 0, i32 4
  %151 = load i32, i32* %150, align 8
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 %152
  store i32* %153, i32** %8, align 8
  %154 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %155 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %154, i32 0, i32 4
  %156 = load i32, i32* %155, align 8
  store i32 %156, i32* %12, align 4
  br label %157

; <label>:157:                                    ; preds = %214, %148
  %158 = load i32, i32* %12, align 4
  %159 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %160 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %159, i32 0, i32 5
  %161 = load i32, i32* %160, align 4
  %162 = icmp sle i32 %158, %161
  br i1 %162, label %163, label %218

; <label>:163:                                    ; preds = %157
  %164 = load i32*, i32** %8, align 8
  store i32 0, i32* %164, align 4
  %165 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %166 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %165, i32 0, i32 2
  %167 = load i32, i32* %166, align 8
  store i32 %167, i32* %11, align 4
  br label %168

; <label>:168:                                    ; preds = %207, %163
  %169 = load i32, i32* %11, align 4
  %170 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %171 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %170, i32 0, i32 3
  %172 = load i32, i32* %171, align 4
  %173 = icmp sle i32 %169, %172
  br i1 %173, label %174, label %211

; <label>:174:                                    ; preds = %168
  %175 = load i32, i32* %11, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %176
  %178 = load i32, i32* %12, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %177, i64 0, i64 %179
  %181 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %182 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %181, i32 0, i32 6
  %183 = load i32, i32* %182, align 8
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [32 x i32], [32 x i32]* %180, i64 0, i64 %184
  store i32* %185, i32** %7, align 8
  %186 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %187 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %186, i32 0, i32 6
  %188 = load i32, i32* %187, align 8
  store i32 %188, i32* %13, align 4
  br label %189

; <label>:189:                                    ; preds = %202, %174
  %190 = load i32, i32* %13, align 4
  %191 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %192 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %191, i32 0, i32 7
  %193 = load i32, i32* %192, align 4
  %194 = icmp sle i32 %190, %193
  br i1 %194, label %195, label %206

; <label>:195:                                    ; preds = %189
  %196 = load i32*, i32** %7, align 8
  %197 = getelementptr inbounds i32, i32* %196, i32 1
  store i32* %197, i32** %7, align 8
  %198 = load i32, i32* %196, align 4
  %199 = load i32*, i32** %8, align 8
  %200 = load i32, i32* %199, align 4
  %201 = add nsw i32 %200, %198
  store i32 %201, i32* %199, align 4
  br label %202

; <label>:202:                                    ; preds = %195
  %pgocount8 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 1)
  %203 = add i64 %pgocount8, 1
  store i64 %203, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 1)
  %204 = load i32, i32* %13, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %13, align 4
  br label %189

; <label>:206:                                    ; preds = %189
  br label %207

; <label>:207:                                    ; preds = %206
  %pgocount9 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 4)
  %208 = add i64 %pgocount9, 1
  store i64 %208, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 4)
  %209 = load i32, i32* %11, align 4
  %210 = add nsw i32 %209, 1
  store i32 %210, i32* %11, align 4
  br label %168

; <label>:211:                                    ; preds = %168
  %212 = load i32*, i32** %8, align 8
  %213 = getelementptr inbounds i32, i32* %212, i32 1
  store i32* %213, i32** %8, align 8
  br label %214

; <label>:214:                                    ; preds = %211
  %pgocount10 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 10)
  %215 = add i64 %pgocount10, 1
  store i64 %215, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 10)
  %216 = load i32, i32* %12, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, i32* %12, align 4
  br label %157

; <label>:218:                                    ; preds = %157
  %pgocount11 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 20)
  %219 = add i64 %pgocount11, 1
  store i64 %219, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 20)
  %220 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %221 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %220, i32 0, i32 4
  %222 = load i32, i32* %221, align 8
  store i32 %222, i32* %4, align 4
  %223 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %224 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %223, i32 0, i32 5
  %225 = load i32, i32* %224, align 4
  store i32 %225, i32* %5, align 4
  br label %305

; <label>:226:                                    ; preds = %68
  %227 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %228 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %227, i32 0, i32 6
  %229 = load i32, i32* %228, align 8
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 %230
  store i32* %231, i32** %8, align 8
  %232 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %233 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %232, i32 0, i32 6
  %234 = load i32, i32* %233, align 8
  store i32 %234, i32* %13, align 4
  br label %235

; <label>:235:                                    ; preds = %293, %226
  %236 = load i32, i32* %13, align 4
  %237 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %238 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %237, i32 0, i32 7
  %239 = load i32, i32* %238, align 4
  %240 = icmp sle i32 %236, %239
  br i1 %240, label %241, label %297

; <label>:241:                                    ; preds = %235
  %242 = load i32*, i32** %8, align 8
  store i32 0, i32* %242, align 4
  %243 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %244 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %243, i32 0, i32 2
  %245 = load i32, i32* %244, align 8
  store i32 %245, i32* %11, align 4
  br label %246

; <label>:246:                                    ; preds = %286, %241
  %247 = load i32, i32* %11, align 4
  %248 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %249 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %248, i32 0, i32 3
  %250 = load i32, i32* %249, align 4
  %251 = icmp sle i32 %247, %250
  br i1 %251, label %252, label %290

; <label>:252:                                    ; preds = %246
  %253 = load i32, i32* %11, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %254
  %256 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %257 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %256, i32 0, i32 4
  %258 = load i32, i32* %257, align 8
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %255, i64 0, i64 %259
  %261 = load i32, i32* %13, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [32 x i32], [32 x i32]* %260, i64 0, i64 %262
  store i32* %263, i32** %7, align 8
  %264 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %265 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %264, i32 0, i32 4
  %266 = load i32, i32* %265, align 8
  store i32 %266, i32* %12, align 4
  br label %267

; <label>:267:                                    ; preds = %281, %252
  %268 = load i32, i32* %12, align 4
  %269 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %270 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %269, i32 0, i32 5
  %271 = load i32, i32* %270, align 4
  %272 = icmp sle i32 %268, %271
  br i1 %272, label %273, label %285

; <label>:273:                                    ; preds = %267
  %274 = load i32*, i32** %7, align 8
  %275 = load i32, i32* %274, align 4
  %276 = load i32*, i32** %8, align 8
  %277 = load i32, i32* %276, align 4
  %278 = add nsw i32 %277, %275
  store i32 %278, i32* %276, align 4
  %279 = load i32*, i32** %7, align 8
  %280 = getelementptr inbounds i32, i32* %279, i64 32
  store i32* %280, i32** %7, align 8
  br label %281

; <label>:281:                                    ; preds = %273
  %pgocount12 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 2)
  %282 = add i64 %pgocount12, 1
  store i64 %282, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 2)
  %283 = load i32, i32* %12, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, i32* %12, align 4
  br label %267

; <label>:285:                                    ; preds = %267
  br label %286

; <label>:286:                                    ; preds = %285
  %pgocount13 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 5)
  %287 = add i64 %pgocount13, 1
  store i64 %287, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 5)
  %288 = load i32, i32* %11, align 4
  %289 = add nsw i32 %288, 1
  store i32 %289, i32* %11, align 4
  br label %246

; <label>:290:                                    ; preds = %246
  %291 = load i32*, i32** %8, align 8
  %292 = getelementptr inbounds i32, i32* %291, i32 1
  store i32* %292, i32** %8, align 8
  br label %293

; <label>:293:                                    ; preds = %290
  %pgocount14 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 11)
  %294 = add i64 %pgocount14, 1
  store i64 %294, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 11)
  %295 = load i32, i32* %13, align 4
  %296 = add nsw i32 %295, 1
  store i32 %296, i32* %13, align 4
  br label %235

; <label>:297:                                    ; preds = %235
  %pgocount15 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 21)
  %298 = add i64 %pgocount15, 1
  store i64 %298, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 21)
  %299 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %300 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %299, i32 0, i32 6
  %301 = load i32, i32* %300, align 8
  store i32 %301, i32* %4, align 4
  %302 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %303 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %302, i32 0, i32 7
  %304 = load i32, i32* %303, align 4
  store i32 %304, i32* %5, align 4
  br label %305

; <label>:305:                                    ; preds = %297, %218, %140, %68
  %306 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %307 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %306, i32 0, i32 8
  %308 = load i32, i32* %307, align 8
  %309 = sdiv i32 %308, 2
  store i32 %309, i32* %16, align 4
  %310 = load i32, i32* %4, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 %311
  store i32* %312, i32** %8, align 8
  store i32 0, i32* %14, align 4
  %313 = load i32, i32* %4, align 4
  store i32 %313, i32* %9, align 4
  br label %314

; <label>:314:                                    ; preds = %330, %305
  %315 = load i32, i32* %9, align 4
  %316 = load i32, i32* %5, align 4
  %317 = icmp sle i32 %315, %316
  br i1 %317, label %318, label %327

; <label>:318:                                    ; preds = %314
  %pgocount16 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 9)
  %319 = add i64 %pgocount16, 1
  store i64 %319, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 9)
  %320 = load i32*, i32** %8, align 8
  %321 = getelementptr inbounds i32, i32* %320, i32 1
  store i32* %321, i32** %8, align 8
  %322 = load i32, i32* %320, align 4
  %323 = load i32, i32* %14, align 4
  %324 = add nsw i32 %323, %322
  store i32 %324, i32* %14, align 4
  %325 = load i32, i32* %16, align 4
  %326 = icmp slt i32 %324, %325
  br label %327

; <label>:327:                                    ; preds = %318, %314
  %328 = phi i1 [ false, %314 ], [ %326, %318 ]
  br i1 %328, label %329, label %334

; <label>:329:                                    ; preds = %327
  br label %330

; <label>:330:                                    ; preds = %329
  %pgocount17 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 6)
  %331 = add i64 %pgocount17, 1
  store i64 %331, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 6)
  %332 = load i32, i32* %9, align 4
  %333 = add nsw i32 %332, 1
  store i32 %333, i32* %9, align 4
  br label %314

; <label>:334:                                    ; preds = %327
  %335 = load i32, i32* %9, align 4
  %336 = load i32, i32* %4, align 4
  %337 = icmp eq i32 %335, %336
  br i1 %337, label %338, label %342

; <label>:338:                                    ; preds = %334
  %pgocount18 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 16)
  %339 = add i64 %pgocount18, 1
  store i64 %339, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 16)
  %340 = load i32, i32* %9, align 4
  %341 = add nsw i32 %340, 1
  store i32 %341, i32* %9, align 4
  br label %342

; <label>:342:                                    ; preds = %338, %334
  %343 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  store %struct.colorbox* %343, %struct.colorbox** %6, align 8
  %344 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %345 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %344, i32 0, i32 0
  %346 = load %struct.colorbox*, %struct.colorbox** %345, align 8
  store %struct.colorbox* %346, %struct.colorbox** @freeboxes, align 8
  %347 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %348 = icmp ne %struct.colorbox* %347, null
  br i1 %348, label %349, label %353

; <label>:349:                                    ; preds = %342
  %pgocount19 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 13)
  %350 = add i64 %pgocount19, 1
  store i64 %350, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 13)
  %351 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %352 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %351, i32 0, i32 1
  store %struct.colorbox* null, %struct.colorbox** %352, align 8
  br label %353

; <label>:353:                                    ; preds = %349, %342
  %354 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  %355 = icmp ne %struct.colorbox* %354, null
  br i1 %355, label %356, label %361

; <label>:356:                                    ; preds = %353
  %pgocount20 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 14)
  %357 = add i64 %pgocount20, 1
  store i64 %357, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 14)
  %358 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %359 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  %360 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %359, i32 0, i32 1
  store %struct.colorbox* %358, %struct.colorbox** %360, align 8
  br label %361

; <label>:361:                                    ; preds = %356, %353
  %362 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  %363 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %364 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %363, i32 0, i32 0
  store %struct.colorbox* %362, %struct.colorbox** %364, align 8
  %365 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  store %struct.colorbox* %365, %struct.colorbox** @usedboxes, align 8
  %366 = load i32, i32* %4, align 4
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 %367
  store i32* %368, i32** %8, align 8
  store i32 0, i32* %15, align 4
  %369 = load i32, i32* %4, align 4
  store i32 %369, i32* %10, align 4
  br label %370

; <label>:370:                                    ; preds = %380, %361
  %371 = load i32, i32* %10, align 4
  %372 = load i32, i32* %9, align 4
  %373 = icmp slt i32 %371, %372
  br i1 %373, label %374, label %384

; <label>:374:                                    ; preds = %370
  %375 = load i32*, i32** %8, align 8
  %376 = getelementptr inbounds i32, i32* %375, i32 1
  store i32* %376, i32** %8, align 8
  %377 = load i32, i32* %375, align 4
  %378 = load i32, i32* %15, align 4
  %379 = add nsw i32 %378, %377
  store i32 %379, i32* %15, align 4
  br label %380

; <label>:380:                                    ; preds = %374
  %pgocount21 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 7)
  %381 = add i64 %pgocount21, 1
  store i64 %381, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 7)
  %382 = load i32, i32* %10, align 4
  %383 = add nsw i32 %382, 1
  store i32 %383, i32* %10, align 4
  br label %370

; <label>:384:                                    ; preds = %370
  store i32 0, i32* %16, align 4
  %385 = load i32, i32* %9, align 4
  store i32 %385, i32* %10, align 4
  br label %386

; <label>:386:                                    ; preds = %396, %384
  %387 = load i32, i32* %10, align 4
  %388 = load i32, i32* %5, align 4
  %389 = icmp sle i32 %387, %388
  br i1 %389, label %390, label %400

; <label>:390:                                    ; preds = %386
  %391 = load i32*, i32** %8, align 8
  %392 = getelementptr inbounds i32, i32* %391, i32 1
  store i32* %392, i32** %8, align 8
  %393 = load i32, i32* %391, align 4
  %394 = load i32, i32* %16, align 4
  %395 = add nsw i32 %394, %393
  store i32 %395, i32* %16, align 4
  br label %396

; <label>:396:                                    ; preds = %390
  %pgocount22 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 8)
  %397 = add i64 %pgocount22, 1
  store i64 %397, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 8)
  %398 = load i32, i32* %10, align 4
  %399 = add nsw i32 %398, 1
  store i32 %399, i32* %10, align 4
  br label %386

; <label>:400:                                    ; preds = %386
  %401 = load i32, i32* %15, align 4
  %402 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %403 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %402, i32 0, i32 8
  store i32 %401, i32* %403, align 8
  %404 = load i32, i32* %16, align 4
  %405 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %406 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %405, i32 0, i32 8
  store i32 %404, i32* %406, align 8
  %407 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %408 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %407, i32 0, i32 2
  %409 = load i32, i32* %408, align 8
  %410 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %411 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %410, i32 0, i32 2
  store i32 %409, i32* %411, align 8
  %412 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %413 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %412, i32 0, i32 3
  %414 = load i32, i32* %413, align 4
  %415 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %416 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %415, i32 0, i32 3
  store i32 %414, i32* %416, align 4
  %417 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %418 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %417, i32 0, i32 4
  %419 = load i32, i32* %418, align 8
  %420 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %421 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %420, i32 0, i32 4
  store i32 %419, i32* %421, align 8
  %422 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %423 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %422, i32 0, i32 5
  %424 = load i32, i32* %423, align 4
  %425 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %426 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %425, i32 0, i32 5
  store i32 %424, i32* %426, align 4
  %427 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %428 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %427, i32 0, i32 6
  %429 = load i32, i32* %428, align 8
  %430 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %431 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %430, i32 0, i32 6
  store i32 %429, i32* %431, align 8
  %432 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %433 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %432, i32 0, i32 7
  %434 = load i32, i32* %433, align 4
  %435 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %436 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %435, i32 0, i32 7
  store i32 %434, i32* %436, align 4
  %437 = load i32, i32* %17, align 4
  switch i32 %437, label %465 [
    i32 0, label %438
    i32 1, label %447
    i32 2, label %456
  ]

; <label>:438:                                    ; preds = %400
  %pgocount23 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 25)
  %439 = add i64 %pgocount23, 1
  store i64 %439, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 25)
  %440 = load i32, i32* %9, align 4
  %441 = sub nsw i32 %440, 1
  %442 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %443 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %442, i32 0, i32 3
  store i32 %441, i32* %443, align 4
  %444 = load i32, i32* %9, align 4
  %445 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %446 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %445, i32 0, i32 2
  store i32 %444, i32* %446, align 8
  br label %465

; <label>:447:                                    ; preds = %400
  %pgocount24 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 22)
  %448 = add i64 %pgocount24, 1
  store i64 %448, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 22)
  %449 = load i32, i32* %9, align 4
  %450 = sub nsw i32 %449, 1
  %451 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %452 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %451, i32 0, i32 5
  store i32 %450, i32* %452, align 4
  %453 = load i32, i32* %9, align 4
  %454 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %455 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %454, i32 0, i32 4
  store i32 %453, i32* %455, align 8
  br label %465

; <label>:456:                                    ; preds = %400
  %pgocount25 = load i64, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 23)
  %457 = add i64 %pgocount25, 1
  store i64 %457, i64* getelementptr inbounds ([26 x i64], [26 x i64]* @__profc_tmp1.ll_splitbox, i64 0, i64 23)
  %458 = load i32, i32* %9, align 4
  %459 = sub nsw i32 %458, 1
  %460 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  %461 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %460, i32 0, i32 7
  store i32 %459, i32* %461, align 4
  %462 = load i32, i32* %9, align 4
  %463 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %464 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %463, i32 0, i32 6
  store i32 %462, i32* %464, align 8
  br label %465

; <label>:465:                                    ; preds = %456, %447, %438, %400
  %466 = load %struct.colorbox*, %struct.colorbox** %6, align 8
  call void @shrinkbox(%struct.colorbox* %466)
  %467 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  call void @shrinkbox(%struct.colorbox* %467)
  ret void
}

declare void @_TIFFfree(i8*) #3

declare void @_TIFFmemset(i8*, i32, i32) #3

; Function Attrs: nounwind uwtable
define internal void @map_colortable() #0 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct.C_cell*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32* getelementptr inbounds ([32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 0, i64 0, i64 0), i32** %1, align 8
  store i32 0, i32* %7, align 4
  br label %11

; <label>:11:                                     ; preds = %149, %0
  %12 = load i32, i32* %7, align 4
  %13 = sext i32 %12 to i64
  %14 = icmp slt i64 %13, 32
  br i1 %14, label %15, label %153

; <label>:15:                                     ; preds = %11
  store i32 0, i32* %8, align 4
  br label %16

; <label>:16:                                     ; preds = %144, %15
  %17 = load i32, i32* %8, align 4
  %18 = sext i32 %17 to i64
  %19 = icmp slt i64 %18, 32
  br i1 %19, label %20, label %148

; <label>:20:                                     ; preds = %16
  store i32 0, i32* %9, align 4
  br label %21

; <label>:21:                                     ; preds = %138, %20
  %22 = load i32, i32* %9, align 4
  %23 = sext i32 %22 to i64
  %24 = icmp slt i64 %23, 32
  br i1 %24, label %25, label %143

; <label>:25:                                     ; preds = %21
  %26 = load i32*, i32** %1, align 8
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %32

; <label>:29:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 4)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 4)
  %31 = load i32*, i32** %1, align 8
  store i32 -1, i32* %31, align 4
  br label %138

; <label>:32:                                     ; preds = %25
  %33 = load %struct.C_cell**, %struct.C_cell*** @ColorCells, align 8
  %34 = load i32, i32* %7, align 4
  %35 = ashr i32 %34, 3
  %36 = shl i32 %35, 4
  %37 = load i32, i32* %8, align 4
  %38 = ashr i32 %37, 3
  %39 = shl i32 %38, 2
  %40 = add nsw i32 %36, %39
  %41 = load i32, i32* %9, align 4
  %42 = ashr i32 %41, 3
  %43 = add nsw i32 %40, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %33, i64 %44
  %46 = load %struct.C_cell*, %struct.C_cell** %45, align 8
  store %struct.C_cell* %46, %struct.C_cell** %2, align 8
  %47 = load %struct.C_cell*, %struct.C_cell** %2, align 8
  %48 = icmp eq %struct.C_cell* %47, null
  br i1 %48, label %49, label %58

; <label>:49:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 5)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 5)
  %51 = load i32, i32* %7, align 4
  %52 = shl i32 %51, 3
  %53 = load i32, i32* %8, align 4
  %54 = shl i32 %53, 3
  %55 = load i32, i32* %9, align 4
  %56 = shl i32 %55, 3
  %57 = call %struct.C_cell* @create_colorcell(i32 %52, i32 %54, i32 %56)
  store %struct.C_cell* %57, %struct.C_cell** %2, align 8
  br label %58

; <label>:58:                                     ; preds = %49, %32
  store i32 9999999, i32* %6, align 4
  store i32 0, i32* %10, align 4
  br label %59

; <label>:59:                                     ; preds = %132, %58
  %60 = load i32, i32* %10, align 4
  %61 = load %struct.C_cell*, %struct.C_cell** %2, align 8
  %62 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %61, i32 0, i32 0
  %63 = load i32, i32* %62, align 4
  %64 = icmp slt i32 %60, %63
  br i1 %64, label %65, label %76

; <label>:65:                                     ; preds = %59
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 1)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 1)
  %67 = load i32, i32* %6, align 4
  %68 = load %struct.C_cell*, %struct.C_cell** %2, align 8
  %69 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %68, i32 0, i32 1
  %70 = load i32, i32* %10, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %69, i64 0, i64 %71
  %73 = getelementptr inbounds [2 x i32], [2 x i32]* %72, i64 0, i64 1
  %74 = load i32, i32* %73, align 4
  %75 = icmp sgt i32 %67, %74
  br label %76

; <label>:76:                                     ; preds = %65, %59
  %77 = phi i1 [ false, %59 ], [ %75, %65 ]
  br i1 %77, label %78, label %136

; <label>:78:                                     ; preds = %76
  %79 = load %struct.C_cell*, %struct.C_cell** %2, align 8
  %80 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %79, i32 0, i32 1
  %81 = load i32, i32* %10, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %80, i64 0, i64 %82
  %84 = getelementptr inbounds [2 x i32], [2 x i32]* %83, i64 0, i64 0
  %85 = load i32, i32* %84, align 4
  store i32 %85, i32* %3, align 4
  %86 = load i32, i32* %3, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %87
  %89 = load i16, i16* %88, align 2
  %90 = zext i16 %89 to i32
  %91 = load i32, i32* %7, align 4
  %92 = shl i32 %91, 3
  %93 = sub nsw i32 %90, %92
  store i32 %93, i32* %5, align 4
  %94 = load i32, i32* %5, align 4
  %95 = load i32, i32* %5, align 4
  %96 = mul nsw i32 %95, %94
  store i32 %96, i32* %5, align 4
  %97 = load i32, i32* %3, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %98
  %100 = load i16, i16* %99, align 2
  %101 = zext i16 %100 to i32
  %102 = load i32, i32* %8, align 4
  %103 = shl i32 %102, 3
  %104 = sub nsw i32 %101, %103
  store i32 %104, i32* %4, align 4
  %105 = load i32, i32* %4, align 4
  %106 = load i32, i32* %4, align 4
  %107 = mul nsw i32 %105, %106
  %108 = load i32, i32* %5, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, i32* %5, align 4
  %110 = load i32, i32* %3, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %111
  %113 = load i16, i16* %112, align 2
  %114 = zext i16 %113 to i32
  %115 = load i32, i32* %9, align 4
  %116 = shl i32 %115, 3
  %117 = sub nsw i32 %114, %116
  store i32 %117, i32* %4, align 4
  %118 = load i32, i32* %4, align 4
  %119 = load i32, i32* %4, align 4
  %120 = mul nsw i32 %118, %119
  %121 = load i32, i32* %5, align 4
  %122 = add nsw i32 %121, %120
  store i32 %122, i32* %5, align 4
  %123 = load i32, i32* %5, align 4
  %124 = load i32, i32* %6, align 4
  %125 = icmp slt i32 %123, %124
  br i1 %125, label %126, label %131

; <label>:126:                                    ; preds = %78
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 2)
  %127 = add i64 %pgocount3, 1
  store i64 %127, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 2)
  %128 = load i32, i32* %5, align 4
  store i32 %128, i32* %6, align 4
  %129 = load i32, i32* %3, align 4
  %130 = load i32*, i32** %1, align 8
  store i32 %129, i32* %130, align 4
  br label %131

; <label>:131:                                    ; preds = %126, %78
  br label %132

; <label>:132:                                    ; preds = %131
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 0)
  %133 = add i64 %pgocount4, 1
  store i64 %133, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 0)
  %134 = load i32, i32* %10, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %10, align 4
  br label %59

; <label>:136:                                    ; preds = %76
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 3)
  %137 = add i64 %pgocount5, 1
  store i64 %137, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 3)
  br label %138

; <label>:138:                                    ; preds = %136, %29
  %139 = load i32, i32* %9, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %9, align 4
  %141 = load i32*, i32** %1, align 8
  %142 = getelementptr inbounds i32, i32* %141, i32 1
  store i32* %142, i32** %1, align 8
  br label %21

; <label>:143:                                    ; preds = %21
  br label %144

; <label>:144:                                    ; preds = %143
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 6)
  %145 = add i64 %pgocount6, 1
  store i64 %145, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 6)
  %146 = load i32, i32* %8, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, i32* %8, align 4
  br label %16

; <label>:148:                                    ; preds = %16
  br label %149

; <label>:149:                                    ; preds = %148
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 7)
  %150 = add i64 %pgocount7, 1
  store i64 %150, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 7)
  %151 = load i32, i32* %7, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %7, align 4
  br label %11

; <label>:153:                                    ; preds = %11
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 8)
  %154 = add i64 %pgocount8, 1
  store i64 %154, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_map_colortable, i64 0, i64 8)
  ret void
}

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) #3

declare i32 @TIFFDefaultStripSize(%struct.tiff*, i32) #3

; Function Attrs: nounwind uwtable
define internal void @quant_fsdither(%struct.tiff*, %struct.tiff*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i16*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca %struct.C_cell*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.tiff* %1, %struct.tiff** %4, align 8
  %33 = load i32, i32* @imagelength, align 4
  %34 = sub i32 %33, 1
  store i32 %34, i32* %15, align 4
  %35 = load i32, i32* @imagewidth, align 4
  %36 = sub i32 %35, 1
  store i32 %36, i32* %16, align 4
  %37 = load %struct.tiff*, %struct.tiff** %3, align 8
  %38 = call i32 @TIFFScanlineSize(%struct.tiff* %37)
  %39 = call i8* @_TIFFmalloc(i32 %38)
  store i8* %39, i8** %6, align 8
  %40 = load i32, i32* @imagewidth, align 4
  %41 = mul i32 %40, 3
  %42 = zext i32 %41 to i64
  %43 = mul i64 %42, 2
  %44 = trunc i64 %43 to i32
  %45 = call i8* @_TIFFmalloc(i32 %44)
  %46 = bitcast i8* %45 to i16*
  store i16* %46, i16** %8, align 8
  %47 = load i32, i32* @imagewidth, align 4
  %48 = mul i32 %47, 3
  %49 = zext i32 %48 to i64
  %50 = mul i64 %49, 2
  %51 = trunc i64 %50 to i32
  %52 = call i8* @_TIFFmalloc(i32 %51)
  %53 = bitcast i8* %52 to i16*
  store i16* %53, i16** %9, align 8
  %54 = load %struct.tiff*, %struct.tiff** %4, align 8
  %55 = call i32 @TIFFScanlineSize(%struct.tiff* %54)
  %56 = call i8* @_TIFFmalloc(i32 %55)
  store i8* %56, i8** %5, align 8
  %57 = load %struct.tiff*, %struct.tiff** %3, align 8
  %58 = load i8*, i8** %6, align 8
  %59 = call i32 @TIFFReadScanline(%struct.tiff* %57, i8* %58, i32 0, i16 zeroext 0)
  %60 = icmp sle i32 %59, 0
  br i1 %60, label %61, label %63

; <label>:61:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 20)
  %62 = add i64 %pgocount, 1
  store i64 %62, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 20)
  br label %513

; <label>:63:                                     ; preds = %2
  %64 = load i8*, i8** %6, align 8
  store i8* %64, i8** %7, align 8
  %65 = load i16*, i16** %9, align 8
  store i16* %65, i16** %12, align 8
  store i32 0, i32* %14, align 4
  br label %66

; <label>:66:                                     ; preds = %90, %63
  %67 = load i32, i32* %14, align 4
  %68 = load i32, i32* @imagewidth, align 4
  %69 = icmp ult i32 %67, %68
  br i1 %69, label %70, label %93

; <label>:70:                                     ; preds = %66
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 17)
  %71 = add i64 %pgocount1, 1
  store i64 %71, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 17)
  %72 = load i8*, i8** %7, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %7, align 8
  %74 = load i8, i8* %72, align 1
  %75 = zext i8 %74 to i16
  %76 = load i16*, i16** %12, align 8
  %77 = getelementptr inbounds i16, i16* %76, i32 1
  store i16* %77, i16** %12, align 8
  store i16 %75, i16* %76, align 2
  %78 = load i8*, i8** %7, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %7, align 8
  %80 = load i8, i8* %78, align 1
  %81 = zext i8 %80 to i16
  %82 = load i16*, i16** %12, align 8
  %83 = getelementptr inbounds i16, i16* %82, i32 1
  store i16* %83, i16** %12, align 8
  store i16 %81, i16* %82, align 2
  %84 = load i8*, i8** %7, align 8
  %85 = getelementptr inbounds i8, i8* %84, i32 1
  store i8* %85, i8** %7, align 8
  %86 = load i8, i8* %84, align 1
  %87 = zext i8 %86 to i16
  %88 = load i16*, i16** %12, align 8
  %89 = getelementptr inbounds i16, i16* %88, i32 1
  store i16* %89, i16** %12, align 8
  store i16 %87, i16* %88, align 2
  br label %90

; <label>:90:                                     ; preds = %70
  %91 = load i32, i32* %14, align 4
  %92 = add i32 %91, 1
  store i32 %92, i32* %14, align 4
  br label %66

; <label>:93:                                     ; preds = %66
  store i32 1, i32* %13, align 4
  br label %94

; <label>:94:                                     ; preds = %508, %93
  %95 = load i32, i32* %13, align 4
  %96 = load i32, i32* @imagelength, align 4
  %97 = icmp ule i32 %95, %96
  br i1 %97, label %98, label %511

; <label>:98:                                     ; preds = %94
  %99 = load i16*, i16** %8, align 8
  store i16* %99, i16** %19, align 8
  %100 = load i16*, i16** %9, align 8
  store i16* %100, i16** %8, align 8
  %101 = load i16*, i16** %19, align 8
  store i16* %101, i16** %9, align 8
  %102 = load i32, i32* %13, align 4
  %103 = load i32, i32* %15, align 4
  %104 = icmp uge i32 %102, %103
  %105 = zext i1 %104 to i32
  store i32 %105, i32* %17, align 4
  %106 = load i32, i32* %13, align 4
  %107 = load i32, i32* %15, align 4
  %108 = icmp ule i32 %106, %107
  br i1 %108, label %109, label %119

; <label>:109:                                    ; preds = %98
  %110 = load %struct.tiff*, %struct.tiff** %3, align 8
  %111 = load i8*, i8** %6, align 8
  %112 = load i32, i32* %13, align 4
  %113 = call i32 @TIFFReadScanline(%struct.tiff* %110, i8* %111, i32 %112, i16 zeroext 0)
  %114 = icmp sle i32 %113, 0
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %109
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 23)
  %116 = add i64 %pgocount2, 1
  store i64 %116, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 23)
  br label %511

; <label>:117:                                    ; preds = %109
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 19)
  %118 = add i64 %pgocount3, 1
  store i64 %118, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 19)
  br label %119

; <label>:119:                                    ; preds = %117, %98
  %120 = load i8*, i8** %6, align 8
  store i8* %120, i8** %7, align 8
  %121 = load i16*, i16** %9, align 8
  store i16* %121, i16** %12, align 8
  store i32 0, i32* %14, align 4
  br label %122

; <label>:122:                                    ; preds = %145, %119
  %123 = load i32, i32* %14, align 4
  %124 = load i32, i32* @imagewidth, align 4
  %125 = icmp ult i32 %123, %124
  br i1 %125, label %126, label %149

; <label>:126:                                    ; preds = %122
  %127 = load i8*, i8** %7, align 8
  %128 = getelementptr inbounds i8, i8* %127, i32 1
  store i8* %128, i8** %7, align 8
  %129 = load i8, i8* %127, align 1
  %130 = zext i8 %129 to i16
  %131 = load i16*, i16** %12, align 8
  %132 = getelementptr inbounds i16, i16* %131, i32 1
  store i16* %132, i16** %12, align 8
  store i16 %130, i16* %131, align 2
  %133 = load i8*, i8** %7, align 8
  %134 = getelementptr inbounds i8, i8* %133, i32 1
  store i8* %134, i8** %7, align 8
  %135 = load i8, i8* %133, align 1
  %136 = zext i8 %135 to i16
  %137 = load i16*, i16** %12, align 8
  %138 = getelementptr inbounds i16, i16* %137, i32 1
  store i16* %138, i16** %12, align 8
  store i16 %136, i16* %137, align 2
  %139 = load i8*, i8** %7, align 8
  %140 = getelementptr inbounds i8, i8* %139, i32 1
  store i8* %140, i8** %7, align 8
  %141 = load i8, i8* %139, align 1
  %142 = zext i8 %141 to i16
  %143 = load i16*, i16** %12, align 8
  %144 = getelementptr inbounds i16, i16* %143, i32 1
  store i16* %144, i16** %12, align 8
  store i16 %142, i16* %143, align 2
  br label %145

; <label>:145:                                    ; preds = %126
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 3)
  %146 = add i64 %pgocount4, 1
  store i64 %146, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 3)
  %147 = load i32, i32* %14, align 4
  %148 = add i32 %147, 1
  store i32 %148, i32* %14, align 4
  br label %122

; <label>:149:                                    ; preds = %122
  %150 = load i16*, i16** %8, align 8
  store i16* %150, i16** %11, align 8
  %151 = load i16*, i16** %9, align 8
  store i16* %151, i16** %12, align 8
  %152 = load i8*, i8** %5, align 8
  store i8* %152, i8** %10, align 8
  store i32 0, i32* %14, align 4
  br label %153

; <label>:153:                                    ; preds = %494, %149
  %154 = load i32, i32* %14, align 4
  %155 = load i32, i32* @imagewidth, align 4
  %156 = icmp ult i32 %154, %155
  br i1 %156, label %157, label %497

; <label>:157:                                    ; preds = %153
  %158 = load i32, i32* %14, align 4
  %159 = load i32, i32* %16, align 4
  %160 = icmp eq i32 %158, %159
  %161 = zext i1 %160 to i32
  store i32 %161, i32* %18, align 4
  %162 = load i16*, i16** %11, align 8
  %163 = getelementptr inbounds i16, i16* %162, i32 1
  store i16* %163, i16** %11, align 8
  %164 = load i16, i16* %162, align 2
  %165 = sext i16 %164 to i32
  store i32 %165, i32* %24, align 4
  %166 = load i32, i32* %24, align 4
  %167 = icmp slt i32 %166, 0
  br i1 %167, label %168, label %170

; <label>:168:                                    ; preds = %157
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 5)
  %169 = add i64 %pgocount5, 1
  store i64 %169, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 5)
  store i32 0, i32* %24, align 4
  br label %176

; <label>:170:                                    ; preds = %157
  %171 = load i32, i32* %24, align 4
  %172 = icmp sge i32 %171, 256
  br i1 %172, label %173, label %175

; <label>:173:                                    ; preds = %170
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 11)
  %174 = add i64 %pgocount6, 1
  store i64 %174, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 11)
  store i32 255, i32* %24, align 4
  br label %175

; <label>:175:                                    ; preds = %173, %170
  br label %176

; <label>:176:                                    ; preds = %175, %168
  %177 = load i32, i32* %24, align 4
  store i32 %177, i32* %20, align 4
  %178 = load i32, i32* %24, align 4
  %179 = ashr i32 %178, 3
  store i32 %179, i32* %24, align 4
  %180 = load i16*, i16** %11, align 8
  %181 = getelementptr inbounds i16, i16* %180, i32 1
  store i16* %181, i16** %11, align 8
  %182 = load i16, i16* %180, align 2
  %183 = sext i16 %182 to i32
  store i32 %183, i32* %25, align 4
  %184 = load i32, i32* %25, align 4
  %185 = icmp slt i32 %184, 0
  br i1 %185, label %186, label %188

; <label>:186:                                    ; preds = %176
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 6)
  %187 = add i64 %pgocount7, 1
  store i64 %187, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 6)
  store i32 0, i32* %25, align 4
  br label %194

; <label>:188:                                    ; preds = %176
  %189 = load i32, i32* %25, align 4
  %190 = icmp sge i32 %189, 256
  br i1 %190, label %191, label %193

; <label>:191:                                    ; preds = %188
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 12)
  %192 = add i64 %pgocount8, 1
  store i64 %192, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 12)
  store i32 255, i32* %25, align 4
  br label %193

; <label>:193:                                    ; preds = %191, %188
  br label %194

; <label>:194:                                    ; preds = %193, %186
  %195 = load i32, i32* %25, align 4
  store i32 %195, i32* %21, align 4
  %196 = load i32, i32* %25, align 4
  %197 = ashr i32 %196, 3
  store i32 %197, i32* %25, align 4
  %198 = load i16*, i16** %11, align 8
  %199 = getelementptr inbounds i16, i16* %198, i32 1
  store i16* %199, i16** %11, align 8
  %200 = load i16, i16* %198, align 2
  %201 = sext i16 %200 to i32
  store i32 %201, i32* %26, align 4
  %202 = load i32, i32* %26, align 4
  %203 = icmp slt i32 %202, 0
  br i1 %203, label %204, label %206

; <label>:204:                                    ; preds = %194
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 7)
  %205 = add i64 %pgocount9, 1
  store i64 %205, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 7)
  store i32 0, i32* %26, align 4
  br label %213

; <label>:206:                                    ; preds = %194
  %207 = load i32, i32* %26, align 4
  %208 = icmp sge i32 %207, 256
  br i1 %208, label %209, label %211

; <label>:209:                                    ; preds = %206
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 13)
  %210 = add i64 %pgocount10, 1
  store i64 %210, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 13)
  store i32 255, i32* %26, align 4
  br label %211

; <label>:211:                                    ; preds = %209, %206
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 4)
  %212 = add i64 %pgocount11, 1
  store i64 %212, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 4)
  br label %213

; <label>:213:                                    ; preds = %211, %204
  %214 = load i32, i32* %26, align 4
  store i32 %214, i32* %22, align 4
  %215 = load i32, i32* %26, align 4
  %216 = ashr i32 %215, 3
  store i32 %216, i32* %26, align 4
  %217 = load i32, i32* %24, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %218
  %220 = load i32, i32* %25, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %219, i64 0, i64 %221
  %223 = load i32, i32* %26, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [32 x i32], [32 x i32]* %222, i64 0, i64 %224
  %226 = load i32, i32* %225, align 4
  store i32 %226, i32* %23, align 4
  %227 = load i32, i32* %23, align 4
  %228 = icmp eq i32 %227, -1
  br i1 %228, label %229, label %341

; <label>:229:                                    ; preds = %213
  %230 = load %struct.C_cell**, %struct.C_cell*** @ColorCells, align 8
  %231 = load i32, i32* %24, align 4
  %232 = ashr i32 %231, 3
  %233 = shl i32 %232, 4
  %234 = load i32, i32* %25, align 4
  %235 = ashr i32 %234, 3
  %236 = shl i32 %235, 2
  %237 = add nsw i32 %233, %236
  %238 = load i32, i32* %26, align 4
  %239 = ashr i32 %238, 3
  %240 = add nsw i32 %237, %239
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %230, i64 %241
  %243 = load %struct.C_cell*, %struct.C_cell** %242, align 8
  store %struct.C_cell* %243, %struct.C_cell** %32, align 8
  %244 = load %struct.C_cell*, %struct.C_cell** %32, align 8
  %245 = icmp eq %struct.C_cell* %244, null
  br i1 %245, label %246, label %252

; <label>:246:                                    ; preds = %229
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 15)
  %247 = add i64 %pgocount12, 1
  store i64 %247, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 15)
  %248 = load i32, i32* %20, align 4
  %249 = load i32, i32* %21, align 4
  %250 = load i32, i32* %22, align 4
  %251 = call %struct.C_cell* @create_colorcell(i32 %248, i32 %249, i32 %250)
  store %struct.C_cell* %251, %struct.C_cell** %32, align 8
  br label %252

; <label>:252:                                    ; preds = %246, %229
  store i32 9999999, i32* %31, align 4
  store i32 0, i32* %27, align 4
  br label %253

; <label>:253:                                    ; preds = %325, %252
  %254 = load i32, i32* %27, align 4
  %255 = load %struct.C_cell*, %struct.C_cell** %32, align 8
  %256 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %255, i32 0, i32 0
  %257 = load i32, i32* %256, align 4
  %258 = icmp slt i32 %254, %257
  br i1 %258, label %259, label %270

; <label>:259:                                    ; preds = %253
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 1)
  %260 = add i64 %pgocount13, 1
  store i64 %260, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 1)
  %261 = load i32, i32* %31, align 4
  %262 = load %struct.C_cell*, %struct.C_cell** %32, align 8
  %263 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %262, i32 0, i32 1
  %264 = load i32, i32* %27, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %263, i64 0, i64 %265
  %267 = getelementptr inbounds [2 x i32], [2 x i32]* %266, i64 0, i64 1
  %268 = load i32, i32* %267, align 4
  %269 = icmp sgt i32 %261, %268
  br label %270

; <label>:270:                                    ; preds = %259, %253
  %271 = phi i1 [ false, %253 ], [ %269, %259 ]
  br i1 %271, label %272, label %329

; <label>:272:                                    ; preds = %270
  %273 = load %struct.C_cell*, %struct.C_cell** %32, align 8
  %274 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %273, i32 0, i32 1
  %275 = load i32, i32* %27, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %274, i64 0, i64 %276
  %278 = getelementptr inbounds [2 x i32], [2 x i32]* %277, i64 0, i64 0
  %279 = load i32, i32* %278, align 4
  store i32 %279, i32* %28, align 4
  %280 = load i32, i32* %28, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %281
  %283 = load i16, i16* %282, align 2
  %284 = zext i16 %283 to i32
  %285 = ashr i32 %284, 3
  %286 = load i32, i32* %24, align 4
  %287 = sub nsw i32 %285, %286
  store i32 %287, i32* %30, align 4
  %288 = load i32, i32* %30, align 4
  %289 = load i32, i32* %30, align 4
  %290 = mul nsw i32 %289, %288
  store i32 %290, i32* %30, align 4
  %291 = load i32, i32* %28, align 4
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %292
  %294 = load i16, i16* %293, align 2
  %295 = zext i16 %294 to i32
  %296 = ashr i32 %295, 3
  %297 = load i32, i32* %25, align 4
  %298 = sub nsw i32 %296, %297
  store i32 %298, i32* %29, align 4
  %299 = load i32, i32* %29, align 4
  %300 = load i32, i32* %29, align 4
  %301 = mul nsw i32 %299, %300
  %302 = load i32, i32* %30, align 4
  %303 = add nsw i32 %302, %301
  store i32 %303, i32* %30, align 4
  %304 = load i32, i32* %28, align 4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %305
  %307 = load i16, i16* %306, align 2
  %308 = zext i16 %307 to i32
  %309 = ashr i32 %308, 3
  %310 = load i32, i32* %26, align 4
  %311 = sub nsw i32 %309, %310
  store i32 %311, i32* %29, align 4
  %312 = load i32, i32* %29, align 4
  %313 = load i32, i32* %29, align 4
  %314 = mul nsw i32 %312, %313
  %315 = load i32, i32* %30, align 4
  %316 = add nsw i32 %315, %314
  store i32 %316, i32* %30, align 4
  %317 = load i32, i32* %30, align 4
  %318 = load i32, i32* %31, align 4
  %319 = icmp slt i32 %317, %318
  br i1 %319, label %320, label %324

; <label>:320:                                    ; preds = %272
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 2)
  %321 = add i64 %pgocount14, 1
  store i64 %321, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 2)
  %322 = load i32, i32* %30, align 4
  store i32 %322, i32* %31, align 4
  %323 = load i32, i32* %28, align 4
  store i32 %323, i32* %23, align 4
  br label %324

; <label>:324:                                    ; preds = %320, %272
  br label %325

; <label>:325:                                    ; preds = %324
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 0)
  %326 = add i64 %pgocount15, 1
  store i64 %326, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 0)
  %327 = load i32, i32* %27, align 4
  %328 = add nsw i32 %327, 1
  store i32 %328, i32* %27, align 4
  br label %253

; <label>:329:                                    ; preds = %270
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 8)
  %330 = add i64 %pgocount16, 1
  store i64 %330, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 8)
  %331 = load i32, i32* %23, align 4
  %332 = load i32, i32* %24, align 4
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %333
  %335 = load i32, i32* %25, align 4
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %334, i64 0, i64 %336
  %338 = load i32, i32* %26, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [32 x i32], [32 x i32]* %337, i64 0, i64 %339
  store i32 %331, i32* %340, align 4
  br label %341

; <label>:341:                                    ; preds = %329, %213
  %342 = load i32, i32* %23, align 4
  %343 = trunc i32 %342 to i8
  %344 = load i8*, i8** %10, align 8
  %345 = getelementptr inbounds i8, i8* %344, i32 1
  store i8* %345, i8** %10, align 8
  store i8 %343, i8* %344, align 1
  %346 = load i32, i32* %23, align 4
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %347
  %349 = load i16, i16* %348, align 2
  %350 = zext i16 %349 to i32
  %351 = load i32, i32* %20, align 4
  %352 = sub nsw i32 %351, %350
  store i32 %352, i32* %20, align 4
  %353 = load i32, i32* %23, align 4
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %354
  %356 = load i16, i16* %355, align 2
  %357 = zext i16 %356 to i32
  %358 = load i32, i32* %21, align 4
  %359 = sub nsw i32 %358, %357
  store i32 %359, i32* %21, align 4
  %360 = load i32, i32* %23, align 4
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %361
  %363 = load i16, i16* %362, align 2
  %364 = zext i16 %363 to i32
  %365 = load i32, i32* %22, align 4
  %366 = sub nsw i32 %365, %364
  store i32 %366, i32* %22, align 4
  %367 = load i32, i32* %18, align 4
  %368 = icmp ne i32 %367, 0
  br i1 %368, label %398, label %369

; <label>:369:                                    ; preds = %341
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 9)
  %370 = add i64 %pgocount17, 1
  store i64 %370, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 9)
  %371 = load i32, i32* %22, align 4
  %372 = mul nsw i32 %371, 7
  %373 = sdiv i32 %372, 16
  %374 = load i16*, i16** %11, align 8
  %375 = getelementptr inbounds i16, i16* %374, i64 0
  %376 = load i16, i16* %375, align 2
  %377 = sext i16 %376 to i32
  %378 = add nsw i32 %377, %373
  %379 = trunc i32 %378 to i16
  store i16 %379, i16* %375, align 2
  %380 = load i32, i32* %21, align 4
  %381 = mul nsw i32 %380, 7
  %382 = sdiv i32 %381, 16
  %383 = load i16*, i16** %11, align 8
  %384 = getelementptr inbounds i16, i16* %383, i64 1
  %385 = load i16, i16* %384, align 2
  %386 = sext i16 %385 to i32
  %387 = add nsw i32 %386, %382
  %388 = trunc i32 %387 to i16
  store i16 %388, i16* %384, align 2
  %389 = load i32, i32* %20, align 4
  %390 = mul nsw i32 %389, 7
  %391 = sdiv i32 %390, 16
  %392 = load i16*, i16** %11, align 8
  %393 = getelementptr inbounds i16, i16* %392, i64 2
  %394 = load i16, i16* %393, align 2
  %395 = sext i16 %394 to i32
  %396 = add nsw i32 %395, %391
  %397 = trunc i32 %396 to i16
  store i16 %397, i16* %393, align 2
  br label %398

; <label>:398:                                    ; preds = %369, %341
  %399 = load i32, i32* %17, align 4
  %400 = icmp ne i32 %399, 0
  br i1 %400, label %493, label %401

; <label>:401:                                    ; preds = %398
  %402 = load i32, i32* %14, align 4
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %404, label %433

; <label>:404:                                    ; preds = %401
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 14)
  %405 = add i64 %pgocount18, 1
  store i64 %405, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 14)
  %406 = load i32, i32* %22, align 4
  %407 = mul nsw i32 %406, 3
  %408 = sdiv i32 %407, 16
  %409 = load i16*, i16** %12, align 8
  %410 = getelementptr inbounds i16, i16* %409, i64 -3
  %411 = load i16, i16* %410, align 2
  %412 = sext i16 %411 to i32
  %413 = add nsw i32 %412, %408
  %414 = trunc i32 %413 to i16
  store i16 %414, i16* %410, align 2
  %415 = load i32, i32* %21, align 4
  %416 = mul nsw i32 %415, 3
  %417 = sdiv i32 %416, 16
  %418 = load i16*, i16** %12, align 8
  %419 = getelementptr inbounds i16, i16* %418, i64 -2
  %420 = load i16, i16* %419, align 2
  %421 = sext i16 %420 to i32
  %422 = add nsw i32 %421, %417
  %423 = trunc i32 %422 to i16
  store i16 %423, i16* %419, align 2
  %424 = load i32, i32* %20, align 4
  %425 = mul nsw i32 %424, 3
  %426 = sdiv i32 %425, 16
  %427 = load i16*, i16** %12, align 8
  %428 = getelementptr inbounds i16, i16* %427, i64 -1
  %429 = load i16, i16* %428, align 2
  %430 = sext i16 %429 to i32
  %431 = add nsw i32 %430, %426
  %432 = trunc i32 %431 to i16
  store i16 %432, i16* %428, align 2
  br label %433

; <label>:433:                                    ; preds = %404, %401
  %434 = load i32, i32* %22, align 4
  %435 = mul nsw i32 %434, 5
  %436 = sdiv i32 %435, 16
  %437 = load i16*, i16** %12, align 8
  %438 = getelementptr inbounds i16, i16* %437, i64 0
  %439 = load i16, i16* %438, align 2
  %440 = sext i16 %439 to i32
  %441 = add nsw i32 %440, %436
  %442 = trunc i32 %441 to i16
  store i16 %442, i16* %438, align 2
  %443 = load i32, i32* %21, align 4
  %444 = mul nsw i32 %443, 5
  %445 = sdiv i32 %444, 16
  %446 = load i16*, i16** %12, align 8
  %447 = getelementptr inbounds i16, i16* %446, i64 1
  %448 = load i16, i16* %447, align 2
  %449 = sext i16 %448 to i32
  %450 = add nsw i32 %449, %445
  %451 = trunc i32 %450 to i16
  store i16 %451, i16* %447, align 2
  %452 = load i32, i32* %20, align 4
  %453 = mul nsw i32 %452, 5
  %454 = sdiv i32 %453, 16
  %455 = load i16*, i16** %12, align 8
  %456 = getelementptr inbounds i16, i16* %455, i64 2
  %457 = load i16, i16* %456, align 2
  %458 = sext i16 %457 to i32
  %459 = add nsw i32 %458, %454
  %460 = trunc i32 %459 to i16
  store i16 %460, i16* %456, align 2
  %461 = load i32, i32* %18, align 4
  %462 = icmp ne i32 %461, 0
  br i1 %462, label %489, label %463

; <label>:463:                                    ; preds = %433
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 16)
  %464 = add i64 %pgocount19, 1
  store i64 %464, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 16)
  %465 = load i32, i32* %22, align 4
  %466 = sdiv i32 %465, 16
  %467 = load i16*, i16** %12, align 8
  %468 = getelementptr inbounds i16, i16* %467, i64 3
  %469 = load i16, i16* %468, align 2
  %470 = sext i16 %469 to i32
  %471 = add nsw i32 %470, %466
  %472 = trunc i32 %471 to i16
  store i16 %472, i16* %468, align 2
  %473 = load i32, i32* %21, align 4
  %474 = sdiv i32 %473, 16
  %475 = load i16*, i16** %12, align 8
  %476 = getelementptr inbounds i16, i16* %475, i64 4
  %477 = load i16, i16* %476, align 2
  %478 = sext i16 %477 to i32
  %479 = add nsw i32 %478, %474
  %480 = trunc i32 %479 to i16
  store i16 %480, i16* %476, align 2
  %481 = load i32, i32* %20, align 4
  %482 = sdiv i32 %481, 16
  %483 = load i16*, i16** %12, align 8
  %484 = getelementptr inbounds i16, i16* %483, i64 5
  %485 = load i16, i16* %484, align 2
  %486 = sext i16 %485 to i32
  %487 = add nsw i32 %486, %482
  %488 = trunc i32 %487 to i16
  store i16 %488, i16* %484, align 2
  br label %489

; <label>:489:                                    ; preds = %463, %433
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 10)
  %490 = add i64 %pgocount20, 1
  store i64 %490, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 10)
  %491 = load i16*, i16** %12, align 8
  %492 = getelementptr inbounds i16, i16* %491, i64 3
  store i16* %492, i16** %12, align 8
  br label %493

; <label>:493:                                    ; preds = %489, %398
  br label %494

; <label>:494:                                    ; preds = %493
  %495 = load i32, i32* %14, align 4
  %496 = add i32 %495, 1
  store i32 %496, i32* %14, align 4
  br label %153

; <label>:497:                                    ; preds = %153
  %498 = load %struct.tiff*, %struct.tiff** %4, align 8
  %499 = load i8*, i8** %5, align 8
  %500 = load i32, i32* %13, align 4
  %501 = sub i32 %500, 1
  %502 = call i32 @TIFFWriteScanline(%struct.tiff* %498, i8* %499, i32 %501, i16 zeroext 0)
  %503 = icmp slt i32 %502, 0
  br i1 %503, label %504, label %506

; <label>:504:                                    ; preds = %497
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 22)
  %505 = add i64 %pgocount21, 1
  store i64 %505, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 22)
  br label %511

; <label>:506:                                    ; preds = %497
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 18)
  %507 = add i64 %pgocount22, 1
  store i64 %507, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 18)
  br label %508

; <label>:508:                                    ; preds = %506
  %509 = load i32, i32* %13, align 4
  %510 = add i32 %509, 1
  store i32 %510, i32* %13, align 4
  br label %94

; <label>:511:                                    ; preds = %504, %115, %94
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 21)
  %512 = add i64 %pgocount23, 1
  store i64 %512, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_tmp1.ll_quant_fsdither, i64 0, i64 21)
  br label %513

; <label>:513:                                    ; preds = %511, %61
  %514 = load i8*, i8** %6, align 8
  call void @_TIFFfree(i8* %514)
  %515 = load i16*, i16** %8, align 8
  %516 = bitcast i16* %515 to i8*
  call void @_TIFFfree(i8* %516)
  %517 = load i16*, i16** %9, align 8
  %518 = bitcast i16* %517 to i8*
  call void @_TIFFfree(i8* %518)
  %519 = load i8*, i8** %5, align 8
  call void @_TIFFfree(i8* %519)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @quant(%struct.tiff*, %struct.tiff*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct.tiff* %1, %struct.tiff** %4, align 8
  %14 = load %struct.tiff*, %struct.tiff** %3, align 8
  %15 = call i32 @TIFFScanlineSize(%struct.tiff* %14)
  %16 = call i8* @_TIFFmalloc(i32 %15)
  store i8* %16, i8** %6, align 8
  %17 = load i32, i32* @imagewidth, align 4
  %18 = call i8* @_TIFFmalloc(i32 %17)
  store i8* %18, i8** %5, align 8
  store i32 0, i32* %9, align 4
  br label %19

; <label>:19:                                     ; preds = %80, %2
  %20 = load i32, i32* %9, align 4
  %21 = load i32, i32* @imagelength, align 4
  %22 = icmp ult i32 %20, %21
  br i1 %22, label %23, label %84

; <label>:23:                                     ; preds = %19
  %24 = load %struct.tiff*, %struct.tiff** %3, align 8
  %25 = load i8*, i8** %6, align 8
  %26 = load i32, i32* %9, align 4
  %27 = call i32 @TIFFReadScanline(%struct.tiff* %24, i8* %25, i32 %26, i16 zeroext 0)
  %28 = icmp sle i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 3)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 3)
  br label %84

; <label>:31:                                     ; preds = %23
  %32 = load i8*, i8** %6, align 8
  store i8* %32, i8** %8, align 8
  %33 = load i8*, i8** %5, align 8
  store i8* %33, i8** %7, align 8
  store i32 0, i32* %10, align 4
  br label %34

; <label>:34:                                     ; preds = %67, %31
  %35 = load i32, i32* %10, align 4
  %36 = load i32, i32* @imagewidth, align 4
  %37 = icmp ult i32 %35, %36
  br i1 %37, label %38, label %71

; <label>:38:                                     ; preds = %34
  %39 = load i8*, i8** %8, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %8, align 8
  %41 = load i8, i8* %39, align 1
  %42 = zext i8 %41 to i32
  %43 = ashr i32 %42, 3
  store i32 %43, i32* %11, align 4
  %44 = load i8*, i8** %8, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %8, align 8
  %46 = load i8, i8* %44, align 1
  %47 = zext i8 %46 to i32
  %48 = ashr i32 %47, 3
  store i32 %48, i32* %12, align 4
  %49 = load i8*, i8** %8, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %8, align 8
  %51 = load i8, i8* %49, align 1
  %52 = zext i8 %51 to i32
  %53 = ashr i32 %52, 3
  store i32 %53, i32* %13, align 4
  %54 = load i32, i32* %11, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %55
  %57 = load i32, i32* %12, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %56, i64 0, i64 %58
  %60 = load i32, i32* %13, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [32 x i32], [32 x i32]* %59, i64 0, i64 %61
  %63 = load i32, i32* %62, align 4
  %64 = trunc i32 %63 to i8
  %65 = load i8*, i8** %7, align 8
  %66 = getelementptr inbounds i8, i8* %65, i32 1
  store i8* %66, i8** %7, align 8
  store i8 %64, i8* %65, align 1
  br label %67

; <label>:67:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 0)
  %68 = add i64 %pgocount1, 1
  store i64 %68, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 0)
  %69 = load i32, i32* %10, align 4
  %70 = add i32 %69, 1
  store i32 %70, i32* %10, align 4
  br label %34

; <label>:71:                                     ; preds = %34
  %72 = load %struct.tiff*, %struct.tiff** %4, align 8
  %73 = load i8*, i8** %5, align 8
  %74 = load i32, i32* %9, align 4
  %75 = call i32 @TIFFWriteScanline(%struct.tiff* %72, i8* %73, i32 %74, i16 zeroext 0)
  %76 = icmp slt i32 %75, 0
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 4)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 4)
  br label %84

; <label>:79:                                     ; preds = %71
  br label %80

; <label>:80:                                     ; preds = %79
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 1)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 1)
  %82 = load i32, i32* %9, align 4
  %83 = add i32 %82, 1
  store i32 %83, i32* %9, align 4
  br label %19

; <label>:84:                                     ; preds = %77, %29, %19
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 2)
  %85 = add i64 %pgocount4, 1
  store i64 %85, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_quant, i64 0, i64 2)
  %86 = load i8*, i8** %6, align 8
  call void @_TIFFfree(i8* %86)
  %87 = load i8*, i8** %5, align 8
  call void @_TIFFfree(i8* %87)
  ret void
}

declare void @TIFFClose(%struct.tiff*) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

declare i32 @TIFFScanlineSize(%struct.tiff*) #3

declare i32 @TIFFReadScanline(%struct.tiff*, i8*, i32, i16 zeroext) #3

; Function Attrs: nounwind uwtable
define internal void @shrinkbox(%struct.colorbox*) #0 {
  %2 = alloca %struct.colorbox*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.colorbox* %0, %struct.colorbox** %2, align 8
  %7 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %8 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %7, i32 0, i32 3
  %9 = load i32, i32* %8, align 4
  %10 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %11 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %10, i32 0, i32 2
  %12 = load i32, i32* %11, align 8
  %13 = icmp sgt i32 %9, %12
  br i1 %13, label %14, label %159

; <label>:14:                                     ; preds = %1
  %15 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %16 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %15, i32 0, i32 2
  %17 = load i32, i32* %16, align 8
  store i32 %17, i32* %4, align 4
  br label %18

; <label>:18:                                     ; preds = %75, %14
  %19 = load i32, i32* %4, align 4
  %20 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %21 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %20, i32 0, i32 3
  %22 = load i32, i32* %21, align 4
  %23 = icmp sle i32 %19, %22
  br i1 %23, label %24, label %79

; <label>:24:                                     ; preds = %18
  %25 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %26 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %25, i32 0, i32 4
  %27 = load i32, i32* %26, align 8
  store i32 %27, i32* %5, align 4
  br label %28

; <label>:28:                                     ; preds = %70, %24
  %29 = load i32, i32* %5, align 4
  %30 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %31 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %30, i32 0, i32 5
  %32 = load i32, i32* %31, align 4
  %33 = icmp sle i32 %29, %32
  br i1 %33, label %34, label %74

; <label>:34:                                     ; preds = %28
  %35 = load i32, i32* %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %36
  %38 = load i32, i32* %5, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %37, i64 0, i64 %39
  %41 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %42 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %41, i32 0, i32 6
  %43 = load i32, i32* %42, align 8
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [32 x i32], [32 x i32]* %40, i64 0, i64 %44
  store i32* %45, i32** %3, align 8
  %46 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %47 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %46, i32 0, i32 6
  %48 = load i32, i32* %47, align 8
  store i32 %48, i32* %6, align 4
  br label %49

; <label>:49:                                     ; preds = %66, %34
  %50 = load i32, i32* %6, align 4
  %51 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %52 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %51, i32 0, i32 7
  %53 = load i32, i32* %52, align 4
  %54 = icmp sle i32 %50, %53
  br i1 %54, label %55, label %69

; <label>:55:                                     ; preds = %49
  %56 = load i32*, i32** %3, align 8
  %57 = getelementptr inbounds i32, i32* %56, i32 1
  store i32* %57, i32** %3, align 8
  %58 = load i32, i32* %56, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %64

; <label>:60:                                     ; preds = %55
  %61 = load i32, i32* %4, align 4
  %62 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %63 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %62, i32 0, i32 2
  store i32 %61, i32* %63, align 8
  br label %81

; <label>:64:                                     ; preds = %55
  %pgocount = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 0)
  %65 = add i64 %pgocount, 1
  store i64 %65, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 0)
  br label %66

; <label>:66:                                     ; preds = %64
  %67 = load i32, i32* %6, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %6, align 4
  br label %49

; <label>:69:                                     ; preds = %49
  br label %70

; <label>:70:                                     ; preds = %69
  %pgocount1 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 7)
  %71 = add i64 %pgocount1, 1
  store i64 %71, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 7)
  %72 = load i32, i32* %5, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %5, align 4
  br label %28

; <label>:74:                                     ; preds = %28
  br label %75

; <label>:75:                                     ; preds = %74
  %pgocount2 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 19)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 19)
  %77 = load i32, i32* %4, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %4, align 4
  br label %18

; <label>:79:                                     ; preds = %18
  %pgocount3 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 22)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 22)
  br label %81

; <label>:81:                                     ; preds = %79, %60
  %82 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %83 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %82, i32 0, i32 3
  %84 = load i32, i32* %83, align 4
  %85 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %86 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %85, i32 0, i32 2
  %87 = load i32, i32* %86, align 8
  %88 = icmp sgt i32 %84, %87
  br i1 %88, label %89, label %157

; <label>:89:                                     ; preds = %81
  %90 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %91 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %90, i32 0, i32 3
  %92 = load i32, i32* %91, align 4
  store i32 %92, i32* %4, align 4
  br label %93

; <label>:93:                                     ; preds = %151, %89
  %94 = load i32, i32* %4, align 4
  %95 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %96 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %95, i32 0, i32 2
  %97 = load i32, i32* %96, align 8
  %98 = icmp sge i32 %94, %97
  br i1 %98, label %99, label %155

; <label>:99:                                     ; preds = %93
  %100 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %101 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %100, i32 0, i32 4
  %102 = load i32, i32* %101, align 8
  store i32 %102, i32* %5, align 4
  br label %103

; <label>:103:                                    ; preds = %146, %99
  %104 = load i32, i32* %5, align 4
  %105 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %106 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %105, i32 0, i32 5
  %107 = load i32, i32* %106, align 4
  %108 = icmp sle i32 %104, %107
  br i1 %108, label %109, label %150

; <label>:109:                                    ; preds = %103
  %110 = load i32, i32* %4, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %111
  %113 = load i32, i32* %5, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %112, i64 0, i64 %114
  %116 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %117 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %116, i32 0, i32 6
  %118 = load i32, i32* %117, align 8
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [32 x i32], [32 x i32]* %115, i64 0, i64 %119
  store i32* %120, i32** %3, align 8
  %121 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %122 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %121, i32 0, i32 6
  %123 = load i32, i32* %122, align 8
  store i32 %123, i32* %6, align 4
  br label %124

; <label>:124:                                    ; preds = %142, %109
  %125 = load i32, i32* %6, align 4
  %126 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %127 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %126, i32 0, i32 7
  %128 = load i32, i32* %127, align 4
  %129 = icmp sle i32 %125, %128
  br i1 %129, label %130, label %145

; <label>:130:                                    ; preds = %124
  %131 = load i32*, i32** %3, align 8
  %132 = getelementptr inbounds i32, i32* %131, i32 1
  store i32* %132, i32** %3, align 8
  %133 = load i32, i32* %131, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %135, label %140

; <label>:135:                                    ; preds = %130
  %pgocount4 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 16)
  %136 = add i64 %pgocount4, 1
  store i64 %136, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 16)
  %137 = load i32, i32* %4, align 4
  %138 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %139 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %138, i32 0, i32 3
  store i32 %137, i32* %139, align 4
  br label %160

; <label>:140:                                    ; preds = %130
  %pgocount5 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 3)
  %141 = add i64 %pgocount5, 1
  store i64 %141, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 3)
  br label %142

; <label>:142:                                    ; preds = %140
  %143 = load i32, i32* %6, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %6, align 4
  br label %124

; <label>:145:                                    ; preds = %124
  br label %146

; <label>:146:                                    ; preds = %145
  %pgocount6 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 13)
  %147 = add i64 %pgocount6, 1
  store i64 %147, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 13)
  %148 = load i32, i32* %5, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %5, align 4
  br label %103

; <label>:150:                                    ; preds = %103
  br label %151

; <label>:151:                                    ; preds = %150
  %pgocount7 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 23)
  %152 = add i64 %pgocount7, 1
  store i64 %152, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 23)
  %153 = load i32, i32* %4, align 4
  %154 = add nsw i32 %153, -1
  store i32 %154, i32* %4, align 4
  br label %93

; <label>:155:                                    ; preds = %93
  %pgocount8 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 28)
  %156 = add i64 %pgocount8, 1
  store i64 %156, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 28)
  br label %157

; <label>:157:                                    ; preds = %155, %81
  %pgocount9 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 10)
  %158 = add i64 %pgocount9, 1
  store i64 %158, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 10)
  br label %159

; <label>:159:                                    ; preds = %157, %1
  br label %160

; <label>:160:                                    ; preds = %159, %135
  %161 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %162 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %161, i32 0, i32 5
  %163 = load i32, i32* %162, align 4
  %164 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %165 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %164, i32 0, i32 4
  %166 = load i32, i32* %165, align 8
  %167 = icmp sgt i32 %163, %166
  br i1 %167, label %168, label %313

; <label>:168:                                    ; preds = %160
  %169 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %170 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %169, i32 0, i32 4
  %171 = load i32, i32* %170, align 8
  store i32 %171, i32* %5, align 4
  br label %172

; <label>:172:                                    ; preds = %229, %168
  %173 = load i32, i32* %5, align 4
  %174 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %175 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %174, i32 0, i32 5
  %176 = load i32, i32* %175, align 4
  %177 = icmp sle i32 %173, %176
  br i1 %177, label %178, label %233

; <label>:178:                                    ; preds = %172
  %179 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %180 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %179, i32 0, i32 2
  %181 = load i32, i32* %180, align 8
  store i32 %181, i32* %4, align 4
  br label %182

; <label>:182:                                    ; preds = %224, %178
  %183 = load i32, i32* %4, align 4
  %184 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %185 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %184, i32 0, i32 3
  %186 = load i32, i32* %185, align 4
  %187 = icmp sle i32 %183, %186
  br i1 %187, label %188, label %228

; <label>:188:                                    ; preds = %182
  %189 = load i32, i32* %4, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %190
  %192 = load i32, i32* %5, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %191, i64 0, i64 %193
  %195 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %196 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %195, i32 0, i32 6
  %197 = load i32, i32* %196, align 8
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [32 x i32], [32 x i32]* %194, i64 0, i64 %198
  store i32* %199, i32** %3, align 8
  %200 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %201 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %200, i32 0, i32 6
  %202 = load i32, i32* %201, align 8
  store i32 %202, i32* %6, align 4
  br label %203

; <label>:203:                                    ; preds = %220, %188
  %204 = load i32, i32* %6, align 4
  %205 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %206 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %205, i32 0, i32 7
  %207 = load i32, i32* %206, align 4
  %208 = icmp sle i32 %204, %207
  br i1 %208, label %209, label %223

; <label>:209:                                    ; preds = %203
  %210 = load i32*, i32** %3, align 8
  %211 = getelementptr inbounds i32, i32* %210, i32 1
  store i32* %211, i32** %3, align 8
  %212 = load i32, i32* %210, align 4
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %214, label %218

; <label>:214:                                    ; preds = %209
  %215 = load i32, i32* %5, align 4
  %216 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %217 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %216, i32 0, i32 4
  store i32 %215, i32* %217, align 8
  br label %235

; <label>:218:                                    ; preds = %209
  %pgocount10 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 1)
  %219 = add i64 %pgocount10, 1
  store i64 %219, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 1)
  br label %220

; <label>:220:                                    ; preds = %218
  %221 = load i32, i32* %6, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %6, align 4
  br label %203

; <label>:223:                                    ; preds = %203
  br label %224

; <label>:224:                                    ; preds = %223
  %pgocount11 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 8)
  %225 = add i64 %pgocount11, 1
  store i64 %225, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 8)
  %226 = load i32, i32* %4, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %4, align 4
  br label %182

; <label>:228:                                    ; preds = %182
  br label %229

; <label>:229:                                    ; preds = %228
  %pgocount12 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 20)
  %230 = add i64 %pgocount12, 1
  store i64 %230, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 20)
  %231 = load i32, i32* %5, align 4
  %232 = add nsw i32 %231, 1
  store i32 %232, i32* %5, align 4
  br label %172

; <label>:233:                                    ; preds = %172
  %pgocount13 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 24)
  %234 = add i64 %pgocount13, 1
  store i64 %234, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 24)
  br label %235

; <label>:235:                                    ; preds = %233, %214
  %236 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %237 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %236, i32 0, i32 5
  %238 = load i32, i32* %237, align 4
  %239 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %240 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %239, i32 0, i32 4
  %241 = load i32, i32* %240, align 8
  %242 = icmp sgt i32 %238, %241
  br i1 %242, label %243, label %311

; <label>:243:                                    ; preds = %235
  %244 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %245 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %244, i32 0, i32 5
  %246 = load i32, i32* %245, align 4
  store i32 %246, i32* %5, align 4
  br label %247

; <label>:247:                                    ; preds = %305, %243
  %248 = load i32, i32* %5, align 4
  %249 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %250 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %249, i32 0, i32 4
  %251 = load i32, i32* %250, align 8
  %252 = icmp sge i32 %248, %251
  br i1 %252, label %253, label %309

; <label>:253:                                    ; preds = %247
  %254 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %255 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %254, i32 0, i32 2
  %256 = load i32, i32* %255, align 8
  store i32 %256, i32* %4, align 4
  br label %257

; <label>:257:                                    ; preds = %300, %253
  %258 = load i32, i32* %4, align 4
  %259 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %260 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %259, i32 0, i32 3
  %261 = load i32, i32* %260, align 4
  %262 = icmp sle i32 %258, %261
  br i1 %262, label %263, label %304

; <label>:263:                                    ; preds = %257
  %264 = load i32, i32* %4, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %265
  %267 = load i32, i32* %5, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %266, i64 0, i64 %268
  %270 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %271 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %270, i32 0, i32 6
  %272 = load i32, i32* %271, align 8
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [32 x i32], [32 x i32]* %269, i64 0, i64 %273
  store i32* %274, i32** %3, align 8
  %275 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %276 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %275, i32 0, i32 6
  %277 = load i32, i32* %276, align 8
  store i32 %277, i32* %6, align 4
  br label %278

; <label>:278:                                    ; preds = %296, %263
  %279 = load i32, i32* %6, align 4
  %280 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %281 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %280, i32 0, i32 7
  %282 = load i32, i32* %281, align 4
  %283 = icmp sle i32 %279, %282
  br i1 %283, label %284, label %299

; <label>:284:                                    ; preds = %278
  %285 = load i32*, i32** %3, align 8
  %286 = getelementptr inbounds i32, i32* %285, i32 1
  store i32* %286, i32** %3, align 8
  %287 = load i32, i32* %285, align 4
  %288 = icmp ne i32 %287, 0
  br i1 %288, label %289, label %294

; <label>:289:                                    ; preds = %284
  %pgocount14 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 17)
  %290 = add i64 %pgocount14, 1
  store i64 %290, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 17)
  %291 = load i32, i32* %5, align 4
  %292 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %293 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %292, i32 0, i32 5
  store i32 %291, i32* %293, align 4
  br label %314

; <label>:294:                                    ; preds = %284
  %pgocount15 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 4)
  %295 = add i64 %pgocount15, 1
  store i64 %295, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 4)
  br label %296

; <label>:296:                                    ; preds = %294
  %297 = load i32, i32* %6, align 4
  %298 = add nsw i32 %297, 1
  store i32 %298, i32* %6, align 4
  br label %278

; <label>:299:                                    ; preds = %278
  br label %300

; <label>:300:                                    ; preds = %299
  %pgocount16 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 14)
  %301 = add i64 %pgocount16, 1
  store i64 %301, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 14)
  %302 = load i32, i32* %4, align 4
  %303 = add nsw i32 %302, 1
  store i32 %303, i32* %4, align 4
  br label %257

; <label>:304:                                    ; preds = %257
  br label %305

; <label>:305:                                    ; preds = %304
  %pgocount17 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 25)
  %306 = add i64 %pgocount17, 1
  store i64 %306, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 25)
  %307 = load i32, i32* %5, align 4
  %308 = add nsw i32 %307, -1
  store i32 %308, i32* %5, align 4
  br label %247

; <label>:309:                                    ; preds = %247
  %pgocount18 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 29)
  %310 = add i64 %pgocount18, 1
  store i64 %310, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 29)
  br label %311

; <label>:311:                                    ; preds = %309, %235
  %pgocount19 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 11)
  %312 = add i64 %pgocount19, 1
  store i64 %312, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 11)
  br label %313

; <label>:313:                                    ; preds = %311, %160
  br label %314

; <label>:314:                                    ; preds = %313, %289
  %315 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %316 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %315, i32 0, i32 7
  %317 = load i32, i32* %316, align 4
  %318 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %319 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %318, i32 0, i32 6
  %320 = load i32, i32* %319, align 8
  %321 = icmp sgt i32 %317, %320
  br i1 %321, label %322, label %469

; <label>:322:                                    ; preds = %314
  %323 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %324 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %323, i32 0, i32 6
  %325 = load i32, i32* %324, align 8
  store i32 %325, i32* %6, align 4
  br label %326

; <label>:326:                                    ; preds = %384, %322
  %327 = load i32, i32* %6, align 4
  %328 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %329 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %328, i32 0, i32 7
  %330 = load i32, i32* %329, align 4
  %331 = icmp sle i32 %327, %330
  br i1 %331, label %332, label %388

; <label>:332:                                    ; preds = %326
  %333 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %334 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %333, i32 0, i32 2
  %335 = load i32, i32* %334, align 8
  store i32 %335, i32* %4, align 4
  br label %336

; <label>:336:                                    ; preds = %379, %332
  %337 = load i32, i32* %4, align 4
  %338 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %339 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %338, i32 0, i32 3
  %340 = load i32, i32* %339, align 4
  %341 = icmp sle i32 %337, %340
  br i1 %341, label %342, label %383

; <label>:342:                                    ; preds = %336
  %343 = load i32, i32* %4, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %344
  %346 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %347 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %346, i32 0, i32 4
  %348 = load i32, i32* %347, align 8
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %345, i64 0, i64 %349
  %351 = load i32, i32* %6, align 4
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds [32 x i32], [32 x i32]* %350, i64 0, i64 %352
  store i32* %353, i32** %3, align 8
  %354 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %355 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %354, i32 0, i32 4
  %356 = load i32, i32* %355, align 8
  store i32 %356, i32* %5, align 4
  br label %357

; <label>:357:                                    ; preds = %375, %342
  %358 = load i32, i32* %5, align 4
  %359 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %360 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %359, i32 0, i32 5
  %361 = load i32, i32* %360, align 4
  %362 = icmp sle i32 %358, %361
  br i1 %362, label %363, label %378

; <label>:363:                                    ; preds = %357
  %364 = load i32*, i32** %3, align 8
  %365 = load i32, i32* %364, align 4
  %366 = icmp ne i32 %365, 0
  br i1 %366, label %367, label %371

; <label>:367:                                    ; preds = %363
  %368 = load i32, i32* %6, align 4
  %369 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %370 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %369, i32 0, i32 6
  store i32 %368, i32* %370, align 8
  br label %390

; <label>:371:                                    ; preds = %363
  %pgocount20 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 2)
  %372 = add i64 %pgocount20, 1
  store i64 %372, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 2)
  %373 = load i32*, i32** %3, align 8
  %374 = getelementptr inbounds i32, i32* %373, i64 32
  store i32* %374, i32** %3, align 8
  br label %375

; <label>:375:                                    ; preds = %371
  %376 = load i32, i32* %5, align 4
  %377 = add nsw i32 %376, 1
  store i32 %377, i32* %5, align 4
  br label %357

; <label>:378:                                    ; preds = %357
  br label %379

; <label>:379:                                    ; preds = %378
  %pgocount21 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 9)
  %380 = add i64 %pgocount21, 1
  store i64 %380, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 9)
  %381 = load i32, i32* %4, align 4
  %382 = add nsw i32 %381, 1
  store i32 %382, i32* %4, align 4
  br label %336

; <label>:383:                                    ; preds = %336
  br label %384

; <label>:384:                                    ; preds = %383
  %pgocount22 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 21)
  %385 = add i64 %pgocount22, 1
  store i64 %385, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 21)
  %386 = load i32, i32* %6, align 4
  %387 = add nsw i32 %386, 1
  store i32 %387, i32* %6, align 4
  br label %326

; <label>:388:                                    ; preds = %326
  %pgocount23 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 26)
  %389 = add i64 %pgocount23, 1
  store i64 %389, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 26)
  br label %390

; <label>:390:                                    ; preds = %388, %367
  %391 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %392 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %391, i32 0, i32 7
  %393 = load i32, i32* %392, align 4
  %394 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %395 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %394, i32 0, i32 6
  %396 = load i32, i32* %395, align 8
  %397 = icmp sgt i32 %393, %396
  br i1 %397, label %398, label %467

; <label>:398:                                    ; preds = %390
  %399 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %400 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %399, i32 0, i32 7
  %401 = load i32, i32* %400, align 4
  store i32 %401, i32* %6, align 4
  br label %402

; <label>:402:                                    ; preds = %461, %398
  %403 = load i32, i32* %6, align 4
  %404 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %405 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %404, i32 0, i32 6
  %406 = load i32, i32* %405, align 8
  %407 = icmp sge i32 %403, %406
  br i1 %407, label %408, label %465

; <label>:408:                                    ; preds = %402
  %409 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %410 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %409, i32 0, i32 2
  %411 = load i32, i32* %410, align 8
  store i32 %411, i32* %4, align 4
  br label %412

; <label>:412:                                    ; preds = %456, %408
  %413 = load i32, i32* %4, align 4
  %414 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %415 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %414, i32 0, i32 3
  %416 = load i32, i32* %415, align 4
  %417 = icmp sle i32 %413, %416
  br i1 %417, label %418, label %460

; <label>:418:                                    ; preds = %412
  %419 = load i32, i32* %4, align 4
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %420
  %422 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %423 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %422, i32 0, i32 4
  %424 = load i32, i32* %423, align 8
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]]* %421, i64 0, i64 %425
  %427 = load i32, i32* %6, align 4
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds [32 x i32], [32 x i32]* %426, i64 0, i64 %428
  store i32* %429, i32** %3, align 8
  %430 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %431 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %430, i32 0, i32 4
  %432 = load i32, i32* %431, align 8
  store i32 %432, i32* %5, align 4
  br label %433

; <label>:433:                                    ; preds = %452, %418
  %434 = load i32, i32* %5, align 4
  %435 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %436 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %435, i32 0, i32 5
  %437 = load i32, i32* %436, align 4
  %438 = icmp sle i32 %434, %437
  br i1 %438, label %439, label %455

; <label>:439:                                    ; preds = %433
  %440 = load i32*, i32** %3, align 8
  %441 = load i32, i32* %440, align 4
  %442 = icmp ne i32 %441, 0
  br i1 %442, label %443, label %448

; <label>:443:                                    ; preds = %439
  %pgocount24 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 18)
  %444 = add i64 %pgocount24, 1
  store i64 %444, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 18)
  %445 = load i32, i32* %6, align 4
  %446 = load %struct.colorbox*, %struct.colorbox** %2, align 8
  %447 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %446, i32 0, i32 7
  store i32 %445, i32* %447, align 4
  br label %471

; <label>:448:                                    ; preds = %439
  %pgocount25 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 5)
  %449 = add i64 %pgocount25, 1
  store i64 %449, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 5)
  %450 = load i32*, i32** %3, align 8
  %451 = getelementptr inbounds i32, i32* %450, i64 32
  store i32* %451, i32** %3, align 8
  br label %452

; <label>:452:                                    ; preds = %448
  %453 = load i32, i32* %5, align 4
  %454 = add nsw i32 %453, 1
  store i32 %454, i32* %5, align 4
  br label %433

; <label>:455:                                    ; preds = %433
  br label %456

; <label>:456:                                    ; preds = %455
  %pgocount26 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 15)
  %457 = add i64 %pgocount26, 1
  store i64 %457, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 15)
  %458 = load i32, i32* %4, align 4
  %459 = add nsw i32 %458, 1
  store i32 %459, i32* %4, align 4
  br label %412

; <label>:460:                                    ; preds = %412
  br label %461

; <label>:461:                                    ; preds = %460
  %pgocount27 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 27)
  %462 = add i64 %pgocount27, 1
  store i64 %462, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 27)
  %463 = load i32, i32* %6, align 4
  %464 = add nsw i32 %463, -1
  store i32 %464, i32* %6, align 4
  br label %402

; <label>:465:                                    ; preds = %402
  %pgocount28 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 30)
  %466 = add i64 %pgocount28, 1
  store i64 %466, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 30)
  br label %467

; <label>:467:                                    ; preds = %465, %390
  %pgocount29 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 12)
  %468 = add i64 %pgocount29, 1
  store i64 %468, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 12)
  br label %469

; <label>:469:                                    ; preds = %467, %314
  %pgocount30 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 6)
  %470 = add i64 %pgocount30, 1
  store i64 %470, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_shrinkbox, i64 0, i64 6)
  br label %471

; <label>:471:                                    ; preds = %469, %443
  ret void
}

; Function Attrs: nounwind uwtable
define internal %struct.C_cell* @create_colorcell(i32, i32, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.C_cell*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %17 = load i32, i32* %4, align 4
  %18 = ashr i32 %17, 6
  store i32 %18, i32* %7, align 4
  %19 = load i32, i32* %5, align 4
  %20 = ashr i32 %19, 6
  store i32 %20, i32* %8, align 4
  %21 = load i32, i32* %6, align 4
  %22 = ashr i32 %21, 6
  store i32 %22, i32* %9, align 4
  %23 = call i8* @_TIFFmalloc(i32 2052)
  %24 = bitcast i8* %23 to %struct.C_cell*
  store %struct.C_cell* %24, %struct.C_cell** %11, align 8
  %25 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %26 = load %struct.C_cell**, %struct.C_cell*** @ColorCells, align 8
  %27 = load i32, i32* %7, align 4
  %28 = sext i32 %27 to i64
  %29 = mul nsw i64 %28, 4
  %30 = mul nsw i64 %29, 4
  %31 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %26, i64 %30
  %32 = load i32, i32* %8, align 4
  %33 = sext i32 %32 to i64
  %34 = mul nsw i64 %33, 4
  %35 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %31, i64 %34
  %36 = load i32, i32* %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %35, i64 %37
  store %struct.C_cell* %25, %struct.C_cell** %38, align 8
  %39 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %40 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %39, i32 0, i32 0
  store i32 0, i32* %40, align 4
  store i32 99999999, i32* %12, align 4
  store i32 0, i32* %10, align 4
  br label %41

; <label>:41:                                     ; preds = %170, %3
  %42 = load i32, i32* %10, align 4
  %43 = load i32, i32* @num_colors, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %173

; <label>:45:                                     ; preds = %41
  %46 = load i32, i32* %10, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = zext i16 %49 to i32
  %51 = ashr i32 %50, 6
  %52 = load i32, i32* %7, align 4
  %53 = icmp ne i32 %51, %52
  br i1 %53, label %74, label %54

; <label>:54:                                     ; preds = %45
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 8)
  %55 = add i64 %pgocount, 1
  store i64 %55, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 8)
  %56 = load i32, i32* %10, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %57
  %59 = load i16, i16* %58, align 2
  %60 = zext i16 %59 to i32
  %61 = ashr i32 %60, 6
  %62 = load i32, i32* %8, align 4
  %63 = icmp ne i32 %61, %62
  br i1 %63, label %74, label %64

; <label>:64:                                     ; preds = %54
  %pgocount1 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 14)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 14)
  %66 = load i32, i32* %10, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %67
  %69 = load i16, i16* %68, align 2
  %70 = zext i16 %69 to i32
  %71 = ashr i32 %70, 6
  %72 = load i32, i32* %9, align 4
  %73 = icmp ne i32 %71, %72
  br i1 %73, label %74, label %76

; <label>:74:                                     ; preds = %64, %54, %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 3)
  %75 = add i64 %pgocount2, 1
  store i64 %75, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 3)
  br label %170

; <label>:76:                                     ; preds = %64
  %77 = load i32, i32* %10, align 4
  %78 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %79 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %78, i32 0, i32 1
  %80 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %81 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %80, i32 0, i32 0
  %82 = load i32, i32* %81, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %79, i64 0, i64 %83
  %85 = getelementptr inbounds [2 x i32], [2 x i32]* %84, i64 0, i64 0
  store i32 %77, i32* %85, align 4
  %86 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %87 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %86, i32 0, i32 1
  %88 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %89 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %88, i32 0, i32 0
  %90 = load i32, i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %87, i64 0, i64 %91
  %93 = getelementptr inbounds [2 x i32], [2 x i32]* %92, i64 0, i64 1
  store i32 0, i32* %93, align 4
  %94 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %95 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %94, i32 0, i32 0
  %96 = load i32, i32* %95, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %95, align 4
  %98 = load i32, i32* %10, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %99
  %101 = load i16, i16* %100, align 2
  %102 = zext i16 %101 to i32
  %103 = load i32, i32* %4, align 4
  %104 = sub nsw i32 %102, %103
  store i32 %104, i32* %14, align 4
  %105 = load i32, i32* %14, align 4
  %106 = sext i32 %105 to i64
  %107 = icmp slt i64 %106, 32
  br i1 %107, label %108, label %114

; <label>:108:                                    ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 18)
  %109 = add i64 %pgocount3, 1
  store i64 %109, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 18)
  %110 = load i32, i32* %14, align 4
  %111 = sext i32 %110 to i64
  %112 = sub nsw i64 63, %111
  %113 = trunc i64 %112 to i32
  store i32 %113, i32* %14, align 4
  br label %114

; <label>:114:                                    ; preds = %108, %76
  %115 = load i32, i32* %14, align 4
  %116 = load i32, i32* %14, align 4
  %117 = mul nsw i32 %115, %116
  store i32 %117, i32* %15, align 4
  %118 = load i32, i32* %10, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %119
  %121 = load i16, i16* %120, align 2
  %122 = zext i16 %121 to i32
  %123 = load i32, i32* %5, align 4
  %124 = sub nsw i32 %122, %123
  store i32 %124, i32* %14, align 4
  %125 = load i32, i32* %14, align 4
  %126 = sext i32 %125 to i64
  %127 = icmp slt i64 %126, 32
  br i1 %127, label %128, label %134

; <label>:128:                                    ; preds = %114
  %pgocount4 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 19)
  %129 = add i64 %pgocount4, 1
  store i64 %129, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 19)
  %130 = load i32, i32* %14, align 4
  %131 = sext i32 %130 to i64
  %132 = sub nsw i64 63, %131
  %133 = trunc i64 %132 to i32
  store i32 %133, i32* %14, align 4
  br label %134

; <label>:134:                                    ; preds = %128, %114
  %135 = load i32, i32* %14, align 4
  %136 = load i32, i32* %14, align 4
  %137 = mul nsw i32 %135, %136
  %138 = load i32, i32* %15, align 4
  %139 = add nsw i32 %138, %137
  store i32 %139, i32* %15, align 4
  %140 = load i32, i32* %10, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %141
  %143 = load i16, i16* %142, align 2
  %144 = zext i16 %143 to i32
  %145 = load i32, i32* %6, align 4
  %146 = sub nsw i32 %144, %145
  store i32 %146, i32* %14, align 4
  %147 = load i32, i32* %14, align 4
  %148 = sext i32 %147 to i64
  %149 = icmp slt i64 %148, 32
  br i1 %149, label %150, label %156

; <label>:150:                                    ; preds = %134
  %pgocount5 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 20)
  %151 = add i64 %pgocount5, 1
  store i64 %151, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 20)
  %152 = load i32, i32* %14, align 4
  %153 = sext i32 %152 to i64
  %154 = sub nsw i64 63, %153
  %155 = trunc i64 %154 to i32
  store i32 %155, i32* %14, align 4
  br label %156

; <label>:156:                                    ; preds = %150, %134
  %157 = load i32, i32* %14, align 4
  %158 = load i32, i32* %14, align 4
  %159 = mul nsw i32 %157, %158
  %160 = load i32, i32* %15, align 4
  %161 = add nsw i32 %160, %159
  store i32 %161, i32* %15, align 4
  %162 = load i32, i32* %15, align 4
  %163 = load i32, i32* %12, align 4
  %164 = icmp slt i32 %162, %163
  br i1 %164, label %165, label %168

; <label>:165:                                    ; preds = %156
  %pgocount6 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 21)
  %166 = add i64 %pgocount6, 1
  store i64 %166, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 21)
  %167 = load i32, i32* %15, align 4
  store i32 %167, i32* %12, align 4
  br label %168

; <label>:168:                                    ; preds = %165, %156
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 16)
  %169 = add i64 %pgocount7, 1
  store i64 %169, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 16)
  br label %170

; <label>:170:                                    ; preds = %168, %74
  %171 = load i32, i32* %10, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %10, align 4
  br label %41

; <label>:173:                                    ; preds = %41
  store i32 0, i32* %10, align 4
  br label %174

; <label>:174:                                    ; preds = %329, %173
  %175 = load i32, i32* %10, align 4
  %176 = load i32, i32* @num_colors, align 4
  %177 = icmp slt i32 %175, %176
  br i1 %177, label %178, label %332

; <label>:178:                                    ; preds = %174
  %179 = load i32, i32* %10, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %180
  %182 = load i16, i16* %181, align 2
  %183 = zext i16 %182 to i32
  %184 = ashr i32 %183, 6
  %185 = load i32, i32* %7, align 4
  %186 = icmp eq i32 %184, %185
  br i1 %186, label %187, label %209

; <label>:187:                                    ; preds = %178
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 9)
  %188 = add i64 %pgocount8, 1
  store i64 %188, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 9)
  %189 = load i32, i32* %10, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %190
  %192 = load i16, i16* %191, align 2
  %193 = zext i16 %192 to i32
  %194 = ashr i32 %193, 6
  %195 = load i32, i32* %8, align 4
  %196 = icmp eq i32 %194, %195
  br i1 %196, label %197, label %209

; <label>:197:                                    ; preds = %187
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 15)
  %198 = add i64 %pgocount9, 1
  store i64 %198, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 15)
  %199 = load i32, i32* %10, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %200
  %202 = load i16, i16* %201, align 2
  %203 = zext i16 %202 to i32
  %204 = ashr i32 %203, 6
  %205 = load i32, i32* %9, align 4
  %206 = icmp eq i32 %204, %205
  br i1 %206, label %207, label %209

; <label>:207:                                    ; preds = %197
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 17)
  %208 = add i64 %pgocount10, 1
  store i64 %208, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 17)
  br label %329

; <label>:209:                                    ; preds = %197, %187, %178
  store i32 0, i32* %15, align 4
  %210 = load i32, i32* %4, align 4
  %211 = load i32, i32* %10, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %212
  %214 = load i16, i16* %213, align 2
  %215 = zext i16 %214 to i32
  %216 = sub nsw i32 %210, %215
  store i32 %216, i32* %14, align 4
  %217 = icmp sgt i32 %216, 0
  br i1 %217, label %232, label %218

; <label>:218:                                    ; preds = %209
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 11)
  %219 = add i64 %pgocount11, 1
  store i64 %219, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 11)
  %220 = load i32, i32* %10, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %221
  %223 = load i16, i16* %222, align 2
  %224 = zext i16 %223 to i64
  %225 = load i32, i32* %4, align 4
  %226 = sext i32 %225 to i64
  %227 = add nsw i64 %226, 64
  %228 = sub nsw i64 %227, 1
  %229 = sub nsw i64 %224, %228
  %230 = trunc i64 %229 to i32
  store i32 %230, i32* %14, align 4
  %231 = icmp sgt i32 %230, 0
  br i1 %231, label %232, label %239

; <label>:232:                                    ; preds = %218, %209
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 5)
  %233 = add i64 %pgocount12, 1
  store i64 %233, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 5)
  %234 = load i32, i32* %14, align 4
  %235 = load i32, i32* %14, align 4
  %236 = mul nsw i32 %234, %235
  %237 = load i32, i32* %15, align 4
  %238 = add nsw i32 %237, %236
  store i32 %238, i32* %15, align 4
  br label %239

; <label>:239:                                    ; preds = %232, %218
  %240 = load i32, i32* %5, align 4
  %241 = load i32, i32* %10, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %242
  %244 = load i16, i16* %243, align 2
  %245 = zext i16 %244 to i32
  %246 = sub nsw i32 %240, %245
  store i32 %246, i32* %14, align 4
  %247 = icmp sgt i32 %246, 0
  br i1 %247, label %262, label %248

; <label>:248:                                    ; preds = %239
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 12)
  %249 = add i64 %pgocount13, 1
  store i64 %249, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 12)
  %250 = load i32, i32* %10, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %251
  %253 = load i16, i16* %252, align 2
  %254 = zext i16 %253 to i64
  %255 = load i32, i32* %5, align 4
  %256 = sext i32 %255 to i64
  %257 = add nsw i64 %256, 64
  %258 = sub nsw i64 %257, 1
  %259 = sub nsw i64 %254, %258
  %260 = trunc i64 %259 to i32
  store i32 %260, i32* %14, align 4
  %261 = icmp sgt i32 %260, 0
  br i1 %261, label %262, label %269

; <label>:262:                                    ; preds = %248, %239
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 6)
  %263 = add i64 %pgocount14, 1
  store i64 %263, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 6)
  %264 = load i32, i32* %14, align 4
  %265 = load i32, i32* %14, align 4
  %266 = mul nsw i32 %264, %265
  %267 = load i32, i32* %15, align 4
  %268 = add nsw i32 %267, %266
  store i32 %268, i32* %15, align 4
  br label %269

; <label>:269:                                    ; preds = %262, %248
  %270 = load i32, i32* %6, align 4
  %271 = load i32, i32* %10, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %272
  %274 = load i16, i16* %273, align 2
  %275 = zext i16 %274 to i32
  %276 = sub nsw i32 %270, %275
  store i32 %276, i32* %14, align 4
  %277 = icmp sgt i32 %276, 0
  br i1 %277, label %292, label %278

; <label>:278:                                    ; preds = %269
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 13)
  %279 = add i64 %pgocount15, 1
  store i64 %279, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 13)
  %280 = load i32, i32* %10, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %281
  %283 = load i16, i16* %282, align 2
  %284 = zext i16 %283 to i64
  %285 = load i32, i32* %6, align 4
  %286 = sext i32 %285 to i64
  %287 = add nsw i64 %286, 64
  %288 = sub nsw i64 %287, 1
  %289 = sub nsw i64 %284, %288
  %290 = trunc i64 %289 to i32
  store i32 %290, i32* %14, align 4
  %291 = icmp sgt i32 %290, 0
  br i1 %291, label %292, label %299

; <label>:292:                                    ; preds = %278, %269
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 7)
  %293 = add i64 %pgocount16, 1
  store i64 %293, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 7)
  %294 = load i32, i32* %14, align 4
  %295 = load i32, i32* %14, align 4
  %296 = mul nsw i32 %294, %295
  %297 = load i32, i32* %15, align 4
  %298 = add nsw i32 %297, %296
  store i32 %298, i32* %15, align 4
  br label %299

; <label>:299:                                    ; preds = %292, %278
  %300 = load i32, i32* %15, align 4
  %301 = load i32, i32* %12, align 4
  %302 = icmp slt i32 %300, %301
  br i1 %302, label %303, label %327

; <label>:303:                                    ; preds = %299
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 10)
  %304 = add i64 %pgocount17, 1
  store i64 %304, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 10)
  %305 = load i32, i32* %10, align 4
  %306 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %307 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %306, i32 0, i32 1
  %308 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %309 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %308, i32 0, i32 0
  %310 = load i32, i32* %309, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %307, i64 0, i64 %311
  %313 = getelementptr inbounds [2 x i32], [2 x i32]* %312, i64 0, i64 0
  store i32 %305, i32* %313, align 4
  %314 = load i32, i32* %15, align 4
  %315 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %316 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %315, i32 0, i32 1
  %317 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %318 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %317, i32 0, i32 0
  %319 = load i32, i32* %318, align 4
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %316, i64 0, i64 %320
  %322 = getelementptr inbounds [2 x i32], [2 x i32]* %321, i64 0, i64 1
  store i32 %314, i32* %322, align 4
  %323 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %324 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %323, i32 0, i32 0
  %325 = load i32, i32* %324, align 4
  %326 = add nsw i32 %325, 1
  store i32 %326, i32* %324, align 4
  br label %327

; <label>:327:                                    ; preds = %303, %299
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 4)
  %328 = add i64 %pgocount18, 1
  store i64 %328, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 4)
  br label %329

; <label>:329:                                    ; preds = %327, %207
  %330 = load i32, i32* %10, align 4
  %331 = add nsw i32 %330, 1
  store i32 %331, i32* %10, align 4
  br label %174

; <label>:332:                                    ; preds = %174
  %333 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %334 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %333, i32 0, i32 0
  %335 = load i32, i32* %334, align 4
  %336 = sub nsw i32 %335, 1
  store i32 %336, i32* %16, align 4
  br label %337

; <label>:337:                                    ; preds = %429, %332
  %338 = load i32, i32* %16, align 4
  %339 = icmp sgt i32 %338, 0
  br i1 %339, label %340, label %432

; <label>:340:                                    ; preds = %337
  store i32 0, i32* %13, align 4
  store i32 0, i32* %10, align 4
  br label %341

; <label>:341:                                    ; preds = %424, %340
  %342 = load i32, i32* %10, align 4
  %343 = load i32, i32* %16, align 4
  %344 = icmp slt i32 %342, %343
  br i1 %344, label %345, label %428

; <label>:345:                                    ; preds = %341
  %346 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %347 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %346, i32 0, i32 1
  %348 = load i32, i32* %10, align 4
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %347, i64 0, i64 %349
  %351 = getelementptr inbounds [2 x i32], [2 x i32]* %350, i64 0, i64 1
  %352 = load i32, i32* %351, align 4
  %353 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %354 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %353, i32 0, i32 1
  %355 = load i32, i32* %10, align 4
  %356 = add nsw i32 %355, 1
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %354, i64 0, i64 %357
  %359 = getelementptr inbounds [2 x i32], [2 x i32]* %358, i64 0, i64 1
  %360 = load i32, i32* %359, align 4
  %361 = icmp sgt i32 %352, %360
  br i1 %361, label %362, label %423

; <label>:362:                                    ; preds = %345
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 1)
  %363 = add i64 %pgocount19, 1
  store i64 %363, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 1)
  %364 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %365 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %364, i32 0, i32 1
  %366 = load i32, i32* %10, align 4
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %365, i64 0, i64 %367
  %369 = getelementptr inbounds [2 x i32], [2 x i32]* %368, i64 0, i64 0
  %370 = load i32, i32* %369, align 4
  store i32 %370, i32* %14, align 4
  %371 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %372 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %371, i32 0, i32 1
  %373 = load i32, i32* %10, align 4
  %374 = add nsw i32 %373, 1
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %372, i64 0, i64 %375
  %377 = getelementptr inbounds [2 x i32], [2 x i32]* %376, i64 0, i64 0
  %378 = load i32, i32* %377, align 4
  %379 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %380 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %379, i32 0, i32 1
  %381 = load i32, i32* %10, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %380, i64 0, i64 %382
  %384 = getelementptr inbounds [2 x i32], [2 x i32]* %383, i64 0, i64 0
  store i32 %378, i32* %384, align 4
  %385 = load i32, i32* %14, align 4
  %386 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %387 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %386, i32 0, i32 1
  %388 = load i32, i32* %10, align 4
  %389 = add nsw i32 %388, 1
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %387, i64 0, i64 %390
  %392 = getelementptr inbounds [2 x i32], [2 x i32]* %391, i64 0, i64 0
  store i32 %385, i32* %392, align 4
  %393 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %394 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %393, i32 0, i32 1
  %395 = load i32, i32* %10, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %394, i64 0, i64 %396
  %398 = getelementptr inbounds [2 x i32], [2 x i32]* %397, i64 0, i64 1
  %399 = load i32, i32* %398, align 4
  store i32 %399, i32* %14, align 4
  %400 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %401 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %400, i32 0, i32 1
  %402 = load i32, i32* %10, align 4
  %403 = add nsw i32 %402, 1
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %401, i64 0, i64 %404
  %406 = getelementptr inbounds [2 x i32], [2 x i32]* %405, i64 0, i64 1
  %407 = load i32, i32* %406, align 4
  %408 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %409 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %408, i32 0, i32 1
  %410 = load i32, i32* %10, align 4
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %409, i64 0, i64 %411
  %413 = getelementptr inbounds [2 x i32], [2 x i32]* %412, i64 0, i64 1
  store i32 %407, i32* %413, align 4
  %414 = load i32, i32* %14, align 4
  %415 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  %416 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %415, i32 0, i32 1
  %417 = load i32, i32* %10, align 4
  %418 = add nsw i32 %417, 1
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %416, i64 0, i64 %419
  %421 = getelementptr inbounds [2 x i32], [2 x i32]* %420, i64 0, i64 1
  store i32 %414, i32* %421, align 4
  %422 = load i32, i32* %10, align 4
  store i32 %422, i32* %13, align 4
  br label %423

; <label>:423:                                    ; preds = %362, %345
  br label %424

; <label>:424:                                    ; preds = %423
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 0)
  %425 = add i64 %pgocount20, 1
  store i64 %425, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 0)
  %426 = load i32, i32* %10, align 4
  %427 = add nsw i32 %426, 1
  store i32 %427, i32* %10, align 4
  br label %341

; <label>:428:                                    ; preds = %341
  br label %429

; <label>:429:                                    ; preds = %428
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 2)
  %430 = add i64 %pgocount21, 1
  store i64 %430, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 2)
  %431 = load i32, i32* %13, align 4
  store i32 %431, i32* %16, align 4
  br label %337

; <label>:432:                                    ; preds = %337
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 22)
  %433 = add i64 %pgocount22, 1
  store i64 %433, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_create_colorcell, i64 0, i64 22)
  %434 = load %struct.C_cell*, %struct.C_cell** %11, align 8
  ret %struct.C_cell* %434
}

declare i32 @TIFFWriteScanline(%struct.tiff*, i8*, i32, i16 zeroext) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
