; ModuleID = 'tmp1.ll'
source_filename = "tiff2rgba.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.tiff = type opaque

$__llvm_profile_raw_version = comdat any

@compression = global i16 -32763, align 2
@rowsperstrip = global i32 -1, align 4
@process_by_block = global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"c:r:t:b\00", align 1
@optarg = external global i8*, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"packbits\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"jpeg\00", align 1
@optind = external global i32, align 4
@.str.5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"Source image not tiled\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"No space for raster buffer\00", align 1
@.str.9 = private unnamed_addr constant [36 x i8] c"No space for raster scanline buffer\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"Source image not in strips\00", align 1
@usageMsg = internal global [10 x i8*] [i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.20, i32 0, i32 0), i8* null], align 16
@stderr = external global %struct._IO_FILE*, align 8
@.str.11 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.12 = private unnamed_addr constant [59 x i8] c"usage: tiff2rgba [-c comp] [-r rows] [-b] input... output\0A\00", align 1
@.str.13 = private unnamed_addr constant [60 x i8] c"where comp is one of the following compression algorithms:\0A\00", align 1
@.str.14 = private unnamed_addr constant [22 x i8] c" jpeg\09\09JPEG encoding\0A\00", align 1
@.str.15 = private unnamed_addr constant [35 x i8] c" lzw\09\09Lempel-Ziv & Welch encoding\0A\00", align 1
@.str.16 = private unnamed_addr constant [29 x i8] c" packbits\09PackBits encoding\0A\00", align 1
@.str.17 = private unnamed_addr constant [23 x i8] c" none\09\09no compression\0A\00", align 1
@.str.18 = private unnamed_addr constant [28 x i8] c"and the other options are:\0A\00", align 1
@.str.19 = private unnamed_addr constant [16 x i8] c" -r\09rows/strip\0A\00", align 1
@.str.20 = private unnamed_addr constant [54 x i8] c" -b (progress by block rather than as a whole image)\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_usage = private constant [13 x i8] c"tmp1.ll:usage"
@__profn_tmp1.ll_tiffcvt = private constant [15 x i8] c"tmp1.ll:tiffcvt"
@__profn_tmp1.ll_cvt_by_tile = private constant [19 x i8] c"tmp1.ll:cvt_by_tile"
@__profn_tmp1.ll_cvt_by_strip = private constant [20 x i8] c"tmp1.ll:cvt_by_strip"
@__profn_tmp1.ll_cvt_whole_image = private constant [23 x i8] c"tmp1.ll:cvt_whole_image"
@__profc_main1 = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 248288438221, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_usage = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_usage = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7998456694610620455, i64 38432627612, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_tiffcvt = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_tiffcvt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3746519954346673586, i64 127686823606, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cvt_by_tile = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cvt_by_tile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -433547492378985556, i64 177859251248, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cvt_by_strip = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cvt_by_strip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -647973206727369485, i64 152107807344, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_cvt_whole_image = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_cvt_whole_image = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1186416086436215151, i64 125152571251, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [68 x i8] c"dBx\DA\CBM\CC\CC3d,\C9-0\D4\CB\C9\B1*-NLO\85\F3J2\D3\D2\92\CBJ\E0| ;>\A92\BE$3'\15]\AC\B8\A4(\B3\00E\B0<#?'5>3\17h \00\05s$\8A", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_usage to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_tiffcvt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cvt_by_tile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cvt_by_strip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_cvt_whole_image to i8*), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  br label %9

; <label>:9:                                      ; preds = %59, %2
  %10 = load i32, i32* %4, align 4
  %11 = load i8**, i8*** %5, align 8
  %12 = call i32 @getopt(i32 %10, i8** %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0)) #5
  store i32 %12, i32* %8, align 4
  %13 = icmp ne i32 %12, -1
  br i1 %13, label %14, label %60

; <label>:14:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 0)
  %16 = load i32, i32* %8, align 4
  switch i32 %16, label %59 [
    i32 98, label %17
    i32 99, label %19
    i32 114, label %49
    i32 116, label %53
    i32 63, label %57
  ]

; <label>:17:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 3)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 3)
  store i32 1, i32* @process_by_block, align 4
  br label %59

; <label>:19:                                     ; preds = %14
  %20 = load i8*, i8** @optarg, align 8
  %21 = call i32 @strcmp(i8* %20, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0)) #6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 7)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 7)
  store i16 1, i16* @compression, align 2
  br label %48

; <label>:25:                                     ; preds = %19
  %26 = load i8*, i8** @optarg, align 8
  %27 = call i32 @strcmp(i8* %26, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)) #6
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 8)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 8)
  store i16 -32763, i16* @compression, align 2
  br label %47

; <label>:31:                                     ; preds = %25
  %32 = load i8*, i8** @optarg, align 8
  %33 = call i32 @strcmp(i8* %32, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0)) #6
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 11)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 11)
  store i16 5, i16* @compression, align 2
  br label %46

; <label>:37:                                     ; preds = %31
  %38 = load i8*, i8** @optarg, align 8
  %39 = call i32 @strcmp(i8* %38, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)) #6
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %37
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 14)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 14)
  store i16 7, i16* @compression, align 2
  br label %45

; <label>:43:                                     ; preds = %37
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 10)
  %44 = add i64 %pgocount6, 1
  store i64 %44, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 10)
  call void @usage()
  br label %45

; <label>:45:                                     ; preds = %43, %41
  br label %46

; <label>:46:                                     ; preds = %45, %35
  br label %47

; <label>:47:                                     ; preds = %46, %29
  br label %48

; <label>:48:                                     ; preds = %47, %23
  br label %59

; <label>:49:                                     ; preds = %14
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 4)
  %50 = add i64 %pgocount7, 1
  store i64 %50, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 4)
  %51 = load i8*, i8** @optarg, align 8
  %52 = call i32 @atoi(i8* %51) #6
  store i32 %52, i32* @rowsperstrip, align 4
  br label %59

; <label>:53:                                     ; preds = %14
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 5)
  %54 = add i64 %pgocount8, 1
  store i64 %54, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 5)
  %55 = load i8*, i8** @optarg, align 8
  %56 = call i32 @atoi(i8* %55) #6
  store i32 %56, i32* @rowsperstrip, align 4
  br label %59

; <label>:57:                                     ; preds = %14
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 6)
  %58 = add i64 %pgocount9, 1
  store i64 %58, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 6)
  call void @usage()
  br label %59

; <label>:59:                                     ; preds = %57, %53, %49, %48, %17, %14
  br label %9

; <label>:60:                                     ; preds = %9
  %61 = load i32, i32* %4, align 4
  %62 = load i32, i32* @optind, align 4
  %63 = sub nsw i32 %61, %62
  %64 = icmp slt i32 %63, 2
  br i1 %64, label %65, label %67

; <label>:65:                                     ; preds = %60
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 13)
  %66 = add i64 %pgocount10, 1
  store i64 %66, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 13)
  call void @usage()
  br label %67

; <label>:67:                                     ; preds = %65, %60
  %68 = load i8**, i8*** %5, align 8
  %69 = load i32, i32* %4, align 4
  %70 = sub nsw i32 %69, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8*, i8** %68, i64 %71
  %73 = load i8*, i8** %72, align 8
  %74 = call %struct.tiff* @TIFFOpen(i8* %73, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store %struct.tiff* %74, %struct.tiff** %7, align 8
  %75 = load %struct.tiff*, %struct.tiff** %7, align 8
  %76 = icmp eq %struct.tiff* %75, null
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %67
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 15)
  %78 = add i64 %pgocount11, 1
  store i64 %78, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 15)
  store i32 -2, i32* %3, align 4
  br label %125

; <label>:79:                                     ; preds = %67
  br label %80

; <label>:80:                                     ; preds = %118, %79
  %81 = load i32, i32* @optind, align 4
  %82 = load i32, i32* %4, align 4
  %83 = sub nsw i32 %82, 1
  %84 = icmp slt i32 %81, %83
  br i1 %84, label %85, label %122

; <label>:85:                                     ; preds = %80
  %86 = load i8**, i8*** %5, align 8
  %87 = load i32, i32* @optind, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8*, i8** %86, i64 %88
  %90 = load i8*, i8** %89, align 8
  %91 = call %struct.tiff* @TIFFOpen(i8* %90, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct.tiff* %91, %struct.tiff** %6, align 8
  %92 = load %struct.tiff*, %struct.tiff** %6, align 8
  %93 = icmp ne %struct.tiff* %92, null
  br i1 %93, label %94, label %117

; <label>:94:                                     ; preds = %85
  br label %95

; <label>:95:                                     ; preds = %110, %94
  %96 = load %struct.tiff*, %struct.tiff** %6, align 8
  %97 = load %struct.tiff*, %struct.tiff** %7, align 8
  %98 = call i32 @tiffcvt(%struct.tiff* %96, %struct.tiff* %97)
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %105

; <label>:100:                                    ; preds = %95
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 1)
  %101 = add i64 %pgocount12, 1
  store i64 %101, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 1)
  %102 = load %struct.tiff*, %struct.tiff** %7, align 8
  %103 = call i32 @TIFFWriteDirectory(%struct.tiff* %102)
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %108, label %105

; <label>:105:                                    ; preds = %100, %95
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 12)
  %106 = add i64 %pgocount13, 1
  store i64 %106, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 12)
  %107 = load %struct.tiff*, %struct.tiff** %7, align 8
  call void @TIFFClose(%struct.tiff* %107)
  store i32 1, i32* %3, align 4
  br label %125

; <label>:108:                                    ; preds = %100
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 2)
  %109 = add i64 %pgocount14, 1
  store i64 %109, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 2)
  br label %110

; <label>:110:                                    ; preds = %108
  %111 = load %struct.tiff*, %struct.tiff** %6, align 8
  %112 = call i32 @TIFFReadDirectory(%struct.tiff* %111)
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %95, label %114

; <label>:114:                                    ; preds = %110
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 16)
  %115 = add i64 %pgocount15, 1
  store i64 %115, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 16)
  %116 = load %struct.tiff*, %struct.tiff** %6, align 8
  call void @TIFFClose(%struct.tiff* %116)
  br label %117

; <label>:117:                                    ; preds = %114, %85
  br label %118

; <label>:118:                                    ; preds = %117
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 9)
  %119 = add i64 %pgocount16, 1
  store i64 %119, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 9)
  %120 = load i32, i32* @optind, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* @optind, align 4
  br label %80

; <label>:122:                                    ; preds = %80
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 17)
  %123 = add i64 %pgocount17, 1
  store i64 %123, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_main1, i64 0, i64 17)
  %124 = load %struct.tiff*, %struct.tiff** %7, align 8
  call void @TIFFClose(%struct.tiff* %124)
  store i32 0, i32* %3, align 4
  br label %125

; <label>:125:                                    ; preds = %122, %105, %77
  %126 = load i32, i32* %3, align 4
  ret i32 %126
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define internal void @usage() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %2

; <label>:2:                                      ; preds = %15, %0
  %3 = load i32, i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [10 x i8*], [10 x i8*]* @usageMsg, i64 0, i64 %4
  %6 = load i8*, i8** %5, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %8, label %19

; <label>:8:                                      ; preds = %2
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = load i32, i32* %1, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [10 x i8*], [10 x i8*]* @usageMsg, i64 0, i64 %11
  %13 = load i8*, i8** %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* %13)
  br label %15

; <label>:15:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 0)
  %17 = load i32, i32* %1, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %1, align 4
  br label %2

; <label>:19:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_usage, i64 0, i64 1)
  call void @exit(i32 1) #7
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare %struct.tiff* @TIFFOpen(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define internal i32 @tiffcvt(%struct.tiff*, %struct.tiff*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i16, align 2
  %9 = alloca float, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca [1 x i16], align 2
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.tiff* %1, %struct.tiff** %5, align 8
  %13 = load %struct.tiff*, %struct.tiff** %4, align 8
  %14 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %13, i32 256, i32* %6)
  %15 = load %struct.tiff*, %struct.tiff** %4, align 8
  %16 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %15, i32 257, i32* %7)
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %17, i32 254, i32* %11)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %25

; <label>:20:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 0)
  %22 = load %struct.tiff*, %struct.tiff** %5, align 8
  %23 = load i32, i32* %11, align 4
  %24 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %22, i32 254, i32 %23)
  br label %25

; <label>:25:                                     ; preds = %20, %2
  %26 = load %struct.tiff*, %struct.tiff** %5, align 8
  %27 = load i32, i32* %6, align 4
  %28 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %26, i32 256, i32 %27)
  %29 = load %struct.tiff*, %struct.tiff** %5, align 8
  %30 = load i32, i32* %7, align 4
  %31 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %29, i32 257, i32 %30)
  %32 = load %struct.tiff*, %struct.tiff** %5, align 8
  %33 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %32, i32 258, i32 8)
  %34 = load %struct.tiff*, %struct.tiff** %5, align 8
  %35 = load i16, i16* @compression, align 2
  %36 = zext i16 %35 to i32
  %37 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %34, i32 259, i32 %36)
  %38 = load %struct.tiff*, %struct.tiff** %5, align 8
  %39 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %38, i32 262, i32 2)
  %40 = load %struct.tiff*, %struct.tiff** %4, align 8
  %41 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %40, i32 266, i16* %8)
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %49

; <label>:43:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 1)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 1)
  %45 = load %struct.tiff*, %struct.tiff** %5, align 8
  %46 = load i16, i16* %8, align 2
  %47 = zext i16 %46 to i32
  %48 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %45, i32 266, i32 %47)
  br label %49

; <label>:49:                                     ; preds = %43, %25
  %50 = load %struct.tiff*, %struct.tiff** %5, align 8
  %51 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %50, i32 274, i32 1)
  %52 = load %struct.tiff*, %struct.tiff** %5, align 8
  %53 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %52, i32 277, i32 4)
  %54 = getelementptr inbounds [1 x i16], [1 x i16]* %12, i64 0, i64 0
  store i16 1, i16* %54, align 2
  %55 = load %struct.tiff*, %struct.tiff** %5, align 8
  %56 = getelementptr inbounds [1 x i16], [1 x i16]* %12, i32 0, i32 0
  %57 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %55, i32 338, i32 1, i16* %56)
  %58 = load %struct.tiff*, %struct.tiff** %4, align 8
  %59 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %58, i32 282, float* %9)
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %67

; <label>:61:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 2)
  %62 = add i64 %pgocount2, 1
  store i64 %62, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 2)
  %63 = load %struct.tiff*, %struct.tiff** %5, align 8
  %64 = load float, float* %9, align 4
  %65 = fpext float %64 to double
  %66 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %63, i32 282, double %65)
  br label %67

; <label>:67:                                     ; preds = %61, %49
  %68 = load %struct.tiff*, %struct.tiff** %4, align 8
  %69 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %68, i32 283, float* %9)
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %77

; <label>:71:                                     ; preds = %67
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 3)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 3)
  %73 = load %struct.tiff*, %struct.tiff** %5, align 8
  %74 = load float, float* %9, align 4
  %75 = fpext float %74 to double
  %76 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %73, i32 283, double %75)
  br label %77

; <label>:77:                                     ; preds = %71, %67
  %78 = load %struct.tiff*, %struct.tiff** %4, align 8
  %79 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %78, i32 296, i16* %8)
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %87

; <label>:81:                                     ; preds = %77
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 4)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 4)
  %83 = load %struct.tiff*, %struct.tiff** %5, align 8
  %84 = load i16, i16* %8, align 2
  %85 = zext i16 %84 to i32
  %86 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %83, i32 296, i32 %85)
  br label %87

; <label>:87:                                     ; preds = %81, %77
  %88 = load %struct.tiff*, %struct.tiff** %5, align 8
  %89 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %88, i32 284, i32 1)
  %90 = load %struct.tiff*, %struct.tiff** %5, align 8
  %91 = call i8* @TIFFGetVersion()
  %92 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %90, i32 305, i8* %91)
  %93 = load %struct.tiff*, %struct.tiff** %4, align 8
  %94 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %93, i32 269, i8** %10)
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %101

; <label>:96:                                     ; preds = %87
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 5)
  %97 = add i64 %pgocount5, 1
  store i64 %97, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 5)
  %98 = load %struct.tiff*, %struct.tiff** %5, align 8
  %99 = load i8*, i8** %10, align 8
  %100 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %98, i32 269, i8* %99)
  br label %101

; <label>:101:                                    ; preds = %96, %87
  %102 = load i32, i32* @process_by_block, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %114

; <label>:104:                                    ; preds = %101
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 6)
  %105 = add i64 %pgocount6, 1
  store i64 %105, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 6)
  %106 = load %struct.tiff*, %struct.tiff** %4, align 8
  %107 = call i32 @TIFFIsTiled(%struct.tiff* %106)
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %114

; <label>:109:                                    ; preds = %104
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 7)
  %110 = add i64 %pgocount7, 1
  store i64 %110, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 7)
  %111 = load %struct.tiff*, %struct.tiff** %4, align 8
  %112 = load %struct.tiff*, %struct.tiff** %5, align 8
  %113 = call i32 @cvt_by_tile(%struct.tiff* %111, %struct.tiff* %112)
  store i32 %113, i32* %3, align 4
  br label %127

; <label>:114:                                    ; preds = %104, %101
  %115 = load i32, i32* @process_by_block, align 4
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %122

; <label>:117:                                    ; preds = %114
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 8)
  %118 = add i64 %pgocount8, 1
  store i64 %118, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 8)
  %119 = load %struct.tiff*, %struct.tiff** %4, align 8
  %120 = load %struct.tiff*, %struct.tiff** %5, align 8
  %121 = call i32 @cvt_by_strip(%struct.tiff* %119, %struct.tiff* %120)
  store i32 %121, i32* %3, align 4
  br label %127

; <label>:122:                                    ; preds = %114
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 9)
  %123 = add i64 %pgocount9, 1
  store i64 %123, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_tiffcvt, i64 0, i64 9)
  %124 = load %struct.tiff*, %struct.tiff** %4, align 8
  %125 = load %struct.tiff*, %struct.tiff** %5, align 8
  %126 = call i32 @cvt_whole_image(%struct.tiff* %124, %struct.tiff* %125)
  store i32 %126, i32* %3, align 4
  br label %127

; <label>:127:                                    ; preds = %122, %117, %109
  %128 = load i32, i32* %3, align 4
  ret i32 %128
}

declare i32 @TIFFWriteDirectory(%struct.tiff*) #3

declare void @TIFFClose(%struct.tiff*) #3

declare i32 @TIFFReadDirectory(%struct.tiff*) #3

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) #3

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) #3

declare i8* @TIFFGetVersion() #3

declare i32 @TIFFIsTiled(%struct.tiff*) #3

; Function Attrs: nounwind uwtable
define internal i32 @cvt_by_tile(%struct.tiff*, %struct.tiff*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32*, align 8
  %17 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.tiff* %1, %struct.tiff** %5, align 8
  store i32 1, i32* %14, align 4
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %18, i32 256, i32* %7)
  %20 = load %struct.tiff*, %struct.tiff** %4, align 8
  %21 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %20, i32 257, i32* %8)
  %22 = load %struct.tiff*, %struct.tiff** %4, align 8
  %23 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %22, i32 322, i32* %9)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %30

; <label>:25:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 7)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 7)
  %27 = load %struct.tiff*, %struct.tiff** %4, align 8
  %28 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %27, i32 323, i32* %10)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %34, label %30

; <label>:30:                                     ; preds = %25, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 8)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 8)
  %32 = load %struct.tiff*, %struct.tiff** %4, align 8
  %33 = call i8* @TIFFFileName(%struct.tiff* %32)
  call void (i8*, i8*, ...) @TIFFError(i8* %33, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %178

; <label>:34:                                     ; preds = %25
  %35 = load %struct.tiff*, %struct.tiff** %5, align 8
  %36 = load i32, i32* %9, align 4
  %37 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %35, i32 322, i32 %36)
  %38 = load %struct.tiff*, %struct.tiff** %5, align 8
  %39 = load i32, i32* %10, align 4
  %40 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %38, i32 323, i32 %39)
  %41 = load i32, i32* %9, align 4
  %42 = load i32, i32* %10, align 4
  %43 = mul i32 %41, %42
  %44 = zext i32 %43 to i64
  %45 = mul i64 %44, 4
  %46 = trunc i64 %45 to i32
  %47 = call i8* @_TIFFmalloc(i32 %46)
  %48 = bitcast i8* %47 to i32*
  store i32* %48, i32** %6, align 8
  %49 = load i32*, i32** %6, align 8
  %50 = icmp eq i32* %49, null
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 10)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 10)
  %53 = load %struct.tiff*, %struct.tiff** %4, align 8
  %54 = call i8* @TIFFFileName(%struct.tiff* %53)
  call void (i8*, i8*, ...) @TIFFError(i8* %54, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %178

; <label>:55:                                     ; preds = %34
  %56 = load i32, i32* %9, align 4
  %57 = zext i32 %56 to i64
  %58 = mul i64 %57, 4
  %59 = trunc i64 %58 to i32
  %60 = call i8* @_TIFFmalloc(i32 %59)
  %61 = bitcast i8* %60 to i32*
  store i32* %61, i32** %13, align 8
  %62 = load i32*, i32** %13, align 8
  %63 = icmp eq i32* %62, null
  br i1 %63, label %64, label %68

; <label>:64:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 11)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 11)
  %66 = load %struct.tiff*, %struct.tiff** %4, align 8
  %67 = call i8* @TIFFFileName(%struct.tiff* %66)
  call void (i8*, i8*, ...) @TIFFError(i8* %67, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i32 0, i32 0))
  store i32 0, i32* %14, align 4
  br label %68

; <label>:68:                                     ; preds = %64, %55
  store i32 0, i32* %11, align 4
  br label %69

; <label>:69:                                     ; preds = %167, %68
  %70 = load i32, i32* %14, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %77

; <label>:72:                                     ; preds = %69
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 4)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 4)
  %74 = load i32, i32* %11, align 4
  %75 = load i32, i32* %8, align 4
  %76 = icmp ult i32 %74, %75
  br label %77

; <label>:77:                                     ; preds = %72, %69
  %78 = phi i1 [ false, %69 ], [ %76, %72 ]
  br i1 %78, label %79, label %171

; <label>:79:                                     ; preds = %77
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 3)
  %80 = add i64 %pgocount5, 1
  store i64 %80, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 3)
  store i32 0, i32* %12, align 4
  br label %81

; <label>:81:                                     ; preds = %161, %79
  %82 = load i32, i32* %14, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %89

; <label>:84:                                     ; preds = %81
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 2)
  %85 = add i64 %pgocount6, 1
  store i64 %85, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 2)
  %86 = load i32, i32* %12, align 4
  %87 = load i32, i32* %7, align 4
  %88 = icmp ult i32 %86, %87
  br label %89

; <label>:89:                                     ; preds = %84, %81
  %90 = phi i1 [ false, %81 ], [ %88, %84 ]
  br i1 %90, label %91, label %166

; <label>:91:                                     ; preds = %89
  %92 = load %struct.tiff*, %struct.tiff** %4, align 8
  %93 = load i32, i32* %12, align 4
  %94 = load i32, i32* %11, align 4
  %95 = load i32*, i32** %6, align 8
  %96 = call i32 @TIFFReadRGBATile(%struct.tiff* %92, i32 %93, i32 %94, i32* %95)
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %100, label %98

; <label>:98:                                     ; preds = %91
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 5)
  %99 = add i64 %pgocount7, 1
  store i64 %99, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 5)
  store i32 0, i32* %14, align 4
  br label %166

; <label>:100:                                    ; preds = %91
  store i32 0, i32* %15, align 4
  br label %101

; <label>:101:                                    ; preds = %140, %100
  %102 = load i32, i32* %15, align 4
  %103 = load i32, i32* %10, align 4
  %104 = udiv i32 %103, 2
  %105 = icmp ult i32 %102, %104
  br i1 %105, label %106, label %144

; <label>:106:                                    ; preds = %101
  %107 = load i32*, i32** %6, align 8
  %108 = load i32, i32* %9, align 4
  %109 = load i32, i32* %15, align 4
  %110 = mul i32 %108, %109
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32* %107, i64 %111
  store i32* %112, i32** %16, align 8
  %113 = load i32*, i32** %6, align 8
  %114 = load i32, i32* %9, align 4
  %115 = load i32, i32* %10, align 4
  %116 = load i32, i32* %15, align 4
  %117 = sub i32 %115, %116
  %118 = sub i32 %117, 1
  %119 = mul i32 %114, %118
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32* %113, i64 %120
  store i32* %121, i32** %17, align 8
  %122 = load i32*, i32** %13, align 8
  %123 = bitcast i32* %122 to i8*
  %124 = load i32*, i32** %16, align 8
  %125 = bitcast i32* %124 to i8*
  %126 = load i32, i32* %9, align 4
  %127 = mul i32 4, %126
  call void @_TIFFmemcpy(i8* %123, i8* %125, i32 %127)
  %128 = load i32*, i32** %16, align 8
  %129 = bitcast i32* %128 to i8*
  %130 = load i32*, i32** %17, align 8
  %131 = bitcast i32* %130 to i8*
  %132 = load i32, i32* %9, align 4
  %133 = mul i32 4, %132
  call void @_TIFFmemcpy(i8* %129, i8* %131, i32 %133)
  %134 = load i32*, i32** %17, align 8
  %135 = bitcast i32* %134 to i8*
  %136 = load i32*, i32** %13, align 8
  %137 = bitcast i32* %136 to i8*
  %138 = load i32, i32* %9, align 4
  %139 = mul i32 4, %138
  call void @_TIFFmemcpy(i8* %135, i8* %137, i32 %139)
  br label %140

; <label>:140:                                    ; preds = %106
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 0)
  %141 = add i64 %pgocount8, 1
  store i64 %141, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 0)
  %142 = load i32, i32* %15, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %15, align 4
  br label %101

; <label>:144:                                    ; preds = %101
  %145 = load %struct.tiff*, %struct.tiff** %5, align 8
  %146 = load %struct.tiff*, %struct.tiff** %5, align 8
  %147 = load i32, i32* %12, align 4
  %148 = load i32, i32* %11, align 4
  %149 = call i32 @TIFFComputeTile(%struct.tiff* %146, i32 %147, i32 %148, i32 0, i16 zeroext 0)
  %150 = load i32*, i32** %6, align 8
  %151 = bitcast i32* %150 to i8*
  %152 = load i32, i32* %9, align 4
  %153 = mul i32 4, %152
  %154 = load i32, i32* %10, align 4
  %155 = mul i32 %153, %154
  %156 = call i32 @TIFFWriteEncodedTile(%struct.tiff* %145, i32 %149, i8* %151, i32 %155)
  %157 = icmp eq i32 %156, -1
  br i1 %157, label %158, label %160

; <label>:158:                                    ; preds = %144
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 6)
  %159 = add i64 %pgocount9, 1
  store i64 %159, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 6)
  store i32 0, i32* %14, align 4
  br label %166

; <label>:160:                                    ; preds = %144
  br label %161

; <label>:161:                                    ; preds = %160
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 1)
  %162 = add i64 %pgocount10, 1
  store i64 %162, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 1)
  %163 = load i32, i32* %9, align 4
  %164 = load i32, i32* %12, align 4
  %165 = add i32 %164, %163
  store i32 %165, i32* %12, align 4
  br label %81

; <label>:166:                                    ; preds = %158, %98, %89
  br label %167

; <label>:167:                                    ; preds = %166
  %168 = load i32, i32* %10, align 4
  %169 = load i32, i32* %11, align 4
  %170 = add i32 %169, %168
  store i32 %170, i32* %11, align 4
  br label %69

; <label>:171:                                    ; preds = %77
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 9)
  %172 = add i64 %pgocount11, 1
  store i64 %172, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_cvt_by_tile, i64 0, i64 9)
  %173 = load i32*, i32** %6, align 8
  %174 = bitcast i32* %173 to i8*
  call void @_TIFFfree(i8* %174)
  %175 = load i32*, i32** %13, align 8
  %176 = bitcast i32* %175 to i8*
  call void @_TIFFfree(i8* %176)
  %177 = load i32, i32* %14, align 4
  store i32 %177, i32* %3, align 4
  br label %178

; <label>:178:                                    ; preds = %171, %51, %30
  %179 = load i32, i32* %3, align 4
  ret i32 %179
}

; Function Attrs: nounwind uwtable
define internal i32 @cvt_by_strip(%struct.tiff*, %struct.tiff*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32*, align 8
  %15 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.tiff* %1, %struct.tiff** %5, align 8
  store i32 1, i32* %11, align 4
  %16 = load %struct.tiff*, %struct.tiff** %4, align 8
  %17 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %16, i32 256, i32* %7)
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %18, i32 257, i32* %8)
  %20 = load %struct.tiff*, %struct.tiff** %4, align 8
  %21 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %20, i32 278, i32* @rowsperstrip)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %27, label %23

; <label>:23:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 5)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 5)
  %25 = load %struct.tiff*, %struct.tiff** %4, align 8
  %26 = call i8* @TIFFFileName(%struct.tiff* %25)
  call void (i8*, i8*, ...) @TIFFError(i8* %26, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %162

; <label>:27:                                     ; preds = %2
  %28 = load %struct.tiff*, %struct.tiff** %5, align 8
  %29 = load i32, i32* @rowsperstrip, align 4
  %30 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %28, i32 278, i32 %29)
  %31 = load i32, i32* %7, align 4
  %32 = load i32, i32* @rowsperstrip, align 4
  %33 = mul i32 %31, %32
  %34 = zext i32 %33 to i64
  %35 = mul i64 %34, 4
  %36 = trunc i64 %35 to i32
  %37 = call i8* @_TIFFmalloc(i32 %36)
  %38 = bitcast i8* %37 to i32*
  store i32* %38, i32** %6, align 8
  %39 = load i32*, i32** %6, align 8
  %40 = icmp eq i32* %39, null
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 6)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 6)
  %43 = load %struct.tiff*, %struct.tiff** %4, align 8
  %44 = call i8* @TIFFFileName(%struct.tiff* %43)
  call void (i8*, i8*, ...) @TIFFError(i8* %44, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %162

; <label>:45:                                     ; preds = %27
  %46 = load i32, i32* %7, align 4
  %47 = zext i32 %46 to i64
  %48 = mul i64 %47, 4
  %49 = trunc i64 %48 to i32
  %50 = call i8* @_TIFFmalloc(i32 %49)
  %51 = bitcast i8* %50 to i32*
  store i32* %51, i32** %10, align 8
  %52 = load i32*, i32** %10, align 8
  %53 = icmp eq i32* %52, null
  br i1 %53, label %54, label %58

; <label>:54:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 7)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 7)
  %56 = load %struct.tiff*, %struct.tiff** %4, align 8
  %57 = call i8* @TIFFFileName(%struct.tiff* %56)
  call void (i8*, i8*, ...) @TIFFError(i8* %57, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i32 0, i32 0))
  store i32 0, i32* %11, align 4
  br label %58

; <label>:58:                                     ; preds = %54, %45
  store i32 0, i32* %9, align 4
  br label %59

; <label>:59:                                     ; preds = %151, %58
  %60 = load i32, i32* %11, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %67

; <label>:62:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 1)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 1)
  %64 = load i32, i32* %9, align 4
  %65 = load i32, i32* %8, align 4
  %66 = icmp ult i32 %64, %65
  br label %67

; <label>:67:                                     ; preds = %62, %59
  %68 = phi i1 [ false, %59 ], [ %66, %62 ]
  br i1 %68, label %69, label %155

; <label>:69:                                     ; preds = %67
  %70 = load %struct.tiff*, %struct.tiff** %4, align 8
  %71 = load i32, i32* %9, align 4
  %72 = load i32*, i32** %6, align 8
  %73 = call i32 @TIFFReadRGBAStrip(%struct.tiff* %70, i32 %71, i32* %72)
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %77, label %75

; <label>:75:                                     ; preds = %69
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 8)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 8)
  store i32 0, i32* %11, align 4
  br label %155

; <label>:77:                                     ; preds = %69
  %78 = load i32, i32* %9, align 4
  %79 = load i32, i32* @rowsperstrip, align 4
  %80 = add i32 %78, %79
  %81 = load i32, i32* %8, align 4
  %82 = icmp ugt i32 %80, %81
  br i1 %82, label %83, label %88

; <label>:83:                                     ; preds = %77
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 2)
  %84 = add i64 %pgocount5, 1
  store i64 %84, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 2)
  %85 = load i32, i32* %8, align 4
  %86 = load i32, i32* %9, align 4
  %87 = sub i32 %85, %86
  store i32 %87, i32* %12, align 4
  br label %91

; <label>:88:                                     ; preds = %77
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 3)
  %89 = add i64 %pgocount6, 1
  store i64 %89, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 3)
  %90 = load i32, i32* @rowsperstrip, align 4
  store i32 %90, i32* %12, align 4
  br label %91

; <label>:91:                                     ; preds = %88, %83
  store i32 0, i32* %13, align 4
  br label %92

; <label>:92:                                     ; preds = %131, %91
  %93 = load i32, i32* %13, align 4
  %94 = load i32, i32* %12, align 4
  %95 = sdiv i32 %94, 2
  %96 = icmp slt i32 %93, %95
  br i1 %96, label %97, label %135

; <label>:97:                                     ; preds = %92
  %98 = load i32*, i32** %6, align 8
  %99 = load i32, i32* %7, align 4
  %100 = load i32, i32* %13, align 4
  %101 = mul i32 %99, %100
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32* %98, i64 %102
  store i32* %103, i32** %14, align 8
  %104 = load i32*, i32** %6, align 8
  %105 = load i32, i32* %7, align 4
  %106 = load i32, i32* %12, align 4
  %107 = load i32, i32* %13, align 4
  %108 = sub nsw i32 %106, %107
  %109 = sub nsw i32 %108, 1
  %110 = mul i32 %105, %109
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32* %104, i64 %111
  store i32* %112, i32** %15, align 8
  %113 = load i32*, i32** %10, align 8
  %114 = bitcast i32* %113 to i8*
  %115 = load i32*, i32** %14, align 8
  %116 = bitcast i32* %115 to i8*
  %117 = load i32, i32* %7, align 4
  %118 = mul i32 4, %117
  call void @_TIFFmemcpy(i8* %114, i8* %116, i32 %118)
  %119 = load i32*, i32** %14, align 8
  %120 = bitcast i32* %119 to i8*
  %121 = load i32*, i32** %15, align 8
  %122 = bitcast i32* %121 to i8*
  %123 = load i32, i32* %7, align 4
  %124 = mul i32 4, %123
  call void @_TIFFmemcpy(i8* %120, i8* %122, i32 %124)
  %125 = load i32*, i32** %15, align 8
  %126 = bitcast i32* %125 to i8*
  %127 = load i32*, i32** %10, align 8
  %128 = bitcast i32* %127 to i8*
  %129 = load i32, i32* %7, align 4
  %130 = mul i32 4, %129
  call void @_TIFFmemcpy(i8* %126, i8* %128, i32 %130)
  br label %131

; <label>:131:                                    ; preds = %97
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 0)
  %132 = add i64 %pgocount7, 1
  store i64 %132, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 0)
  %133 = load i32, i32* %13, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %13, align 4
  br label %92

; <label>:135:                                    ; preds = %92
  %136 = load %struct.tiff*, %struct.tiff** %5, align 8
  %137 = load i32, i32* %9, align 4
  %138 = load i32, i32* @rowsperstrip, align 4
  %139 = udiv i32 %137, %138
  %140 = load i32*, i32** %6, align 8
  %141 = bitcast i32* %140 to i8*
  %142 = load i32, i32* %12, align 4
  %143 = mul nsw i32 4, %142
  %144 = load i32, i32* %7, align 4
  %145 = mul i32 %143, %144
  %146 = call i32 @TIFFWriteEncodedStrip(%struct.tiff* %136, i32 %139, i8* %141, i32 %145)
  %147 = icmp eq i32 %146, -1
  br i1 %147, label %148, label %150

; <label>:148:                                    ; preds = %135
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 9)
  %149 = add i64 %pgocount8, 1
  store i64 %149, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 9)
  store i32 0, i32* %11, align 4
  br label %155

; <label>:150:                                    ; preds = %135
  br label %151

; <label>:151:                                    ; preds = %150
  %152 = load i32, i32* @rowsperstrip, align 4
  %153 = load i32, i32* %9, align 4
  %154 = add i32 %153, %152
  store i32 %154, i32* %9, align 4
  br label %59

; <label>:155:                                    ; preds = %148, %75, %67
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 4)
  %156 = add i64 %pgocount9, 1
  store i64 %156, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_cvt_by_strip, i64 0, i64 4)
  %157 = load i32*, i32** %6, align 8
  %158 = bitcast i32* %157 to i8*
  call void @_TIFFfree(i8* %158)
  %159 = load i32*, i32** %10, align 8
  %160 = bitcast i32* %159 to i8*
  call void @_TIFFfree(i8* %160)
  %161 = load i32, i32* %11, align 4
  store i32 %161, i32* %3, align 4
  br label %162

; <label>:162:                                    ; preds = %155, %41, %23
  %163 = load i32, i32* %3, align 4
  ret i32 %163
}

; Function Attrs: nounwind uwtable
define internal i32 @cvt_whole_image(%struct.tiff*, %struct.tiff*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.tiff* %1, %struct.tiff** %5, align 8
  %15 = load %struct.tiff*, %struct.tiff** %4, align 8
  %16 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %15, i32 256, i32* %7)
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %17, i32 257, i32* %8)
  %19 = load %struct.tiff*, %struct.tiff** %5, align 8
  %20 = load i32, i32* @rowsperstrip, align 4
  %21 = call i32 @TIFFDefaultStripSize(%struct.tiff* %19, i32 %20)
  store i32 %21, i32* @rowsperstrip, align 4
  %22 = load %struct.tiff*, %struct.tiff** %5, align 8
  %23 = load i32, i32* @rowsperstrip, align 4
  %24 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %22, i32 278, i32 %23)
  %25 = load i32, i32* %7, align 4
  %26 = load i32, i32* %8, align 4
  %27 = mul i32 %25, %26
  %28 = zext i32 %27 to i64
  %29 = mul i64 %28, 4
  %30 = trunc i64 %29 to i32
  %31 = call i8* @_TIFFmalloc(i32 %30)
  %32 = bitcast i8* %31 to i32*
  store i32* %32, i32** %6, align 8
  %33 = load i32*, i32** %6, align 8
  %34 = icmp eq i32* %33, null
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 3)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 3)
  %37 = load %struct.tiff*, %struct.tiff** %4, align 8
  %38 = call i8* @TIFFFileName(%struct.tiff* %37)
  call void (i8*, i8*, ...) @TIFFError(i8* %38, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %160

; <label>:39:                                     ; preds = %2
  %40 = load %struct.tiff*, %struct.tiff** %4, align 8
  %41 = load i32, i32* %7, align 4
  %42 = load i32, i32* %8, align 4
  %43 = load i32*, i32** %6, align 8
  %44 = call i32 @TIFFReadRGBAImage(%struct.tiff* %40, i32 %41, i32 %42, i32* %43, i32 0)
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %50, label %46

; <label>:46:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 4)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 4)
  %48 = load i32*, i32** %6, align 8
  %49 = bitcast i32* %48 to i8*
  call void @_TIFFfree(i8* %49)
  store i32 0, i32* %3, align 4
  br label %160

; <label>:50:                                     ; preds = %39
  %51 = load i32, i32* %7, align 4
  %52 = zext i32 %51 to i64
  %53 = mul i64 %52, 4
  %54 = trunc i64 %53 to i32
  %55 = call i8* @_TIFFmalloc(i32 %54)
  %56 = bitcast i8* %55 to i32*
  store i32* %56, i32** %10, align 8
  %57 = load i32*, i32** %10, align 8
  %58 = icmp eq i32* %57, null
  br i1 %58, label %59, label %63

; <label>:59:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 5)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 5)
  %61 = load %struct.tiff*, %struct.tiff** %4, align 8
  %62 = call i8* @TIFFFileName(%struct.tiff* %61)
  call void (i8*, i8*, ...) @TIFFError(i8* %62, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i32 0, i32 0))
  store i32 0, i32* %3, align 4
  br label %160

; <label>:63:                                     ; preds = %50
  store i32 0, i32* %9, align 4
  br label %64

; <label>:64:                                     ; preds = %103, %63
  %65 = load i32, i32* %9, align 4
  %66 = load i32, i32* %8, align 4
  %67 = udiv i32 %66, 2
  %68 = icmp ult i32 %65, %67
  br i1 %68, label %69, label %107

; <label>:69:                                     ; preds = %64
  %70 = load i32*, i32** %6, align 8
  %71 = load i32, i32* %7, align 4
  %72 = load i32, i32* %9, align 4
  %73 = mul i32 %71, %72
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32* %70, i64 %74
  store i32* %75, i32** %11, align 8
  %76 = load i32*, i32** %6, align 8
  %77 = load i32, i32* %7, align 4
  %78 = load i32, i32* %8, align 4
  %79 = load i32, i32* %9, align 4
  %80 = sub i32 %78, %79
  %81 = sub i32 %80, 1
  %82 = mul i32 %77, %81
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32* %76, i64 %83
  store i32* %84, i32** %12, align 8
  %85 = load i32*, i32** %10, align 8
  %86 = bitcast i32* %85 to i8*
  %87 = load i32*, i32** %11, align 8
  %88 = bitcast i32* %87 to i8*
  %89 = load i32, i32* %7, align 4
  %90 = mul i32 4, %89
  call void @_TIFFmemcpy(i8* %86, i8* %88, i32 %90)
  %91 = load i32*, i32** %11, align 8
  %92 = bitcast i32* %91 to i8*
  %93 = load i32*, i32** %12, align 8
  %94 = bitcast i32* %93 to i8*
  %95 = load i32, i32* %7, align 4
  %96 = mul i32 4, %95
  call void @_TIFFmemcpy(i8* %92, i8* %94, i32 %96)
  %97 = load i32*, i32** %12, align 8
  %98 = bitcast i32* %97 to i8*
  %99 = load i32*, i32** %10, align 8
  %100 = bitcast i32* %99 to i8*
  %101 = load i32, i32* %7, align 4
  %102 = mul i32 4, %101
  call void @_TIFFmemcpy(i8* %98, i8* %100, i32 %102)
  br label %103

; <label>:103:                                    ; preds = %69
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 0)
  %104 = add i64 %pgocount3, 1
  store i64 %104, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 0)
  %105 = load i32, i32* %9, align 4
  %106 = add i32 %105, 1
  store i32 %106, i32* %9, align 4
  br label %64

; <label>:107:                                    ; preds = %64
  %108 = load i32*, i32** %10, align 8
  %109 = bitcast i32* %108 to i8*
  call void @_TIFFfree(i8* %109)
  store i32 0, i32* %9, align 4
  br label %110

; <label>:110:                                    ; preds = %152, %107
  %111 = load i32, i32* %9, align 4
  %112 = load i32, i32* %8, align 4
  %113 = icmp ult i32 %111, %112
  br i1 %113, label %114, label %156

; <label>:114:                                    ; preds = %110
  %115 = load i32*, i32** %6, align 8
  %116 = load i32, i32* %9, align 4
  %117 = load i32, i32* %7, align 4
  %118 = mul i32 %116, %117
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32* %115, i64 %119
  store i32* %120, i32** %13, align 8
  %121 = load i32, i32* %9, align 4
  %122 = load i32, i32* @rowsperstrip, align 4
  %123 = add i32 %121, %122
  %124 = load i32, i32* %8, align 4
  %125 = icmp ugt i32 %123, %124
  br i1 %125, label %126, label %131

; <label>:126:                                    ; preds = %114
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 1)
  %127 = add i64 %pgocount4, 1
  store i64 %127, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 1)
  %128 = load i32, i32* %8, align 4
  %129 = load i32, i32* %9, align 4
  %130 = sub i32 %128, %129
  store i32 %130, i32* %14, align 4
  br label %134

; <label>:131:                                    ; preds = %114
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 2)
  %132 = add i64 %pgocount5, 1
  store i64 %132, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 2)
  %133 = load i32, i32* @rowsperstrip, align 4
  store i32 %133, i32* %14, align 4
  br label %134

; <label>:134:                                    ; preds = %131, %126
  %135 = load %struct.tiff*, %struct.tiff** %5, align 8
  %136 = load i32, i32* %9, align 4
  %137 = load i32, i32* @rowsperstrip, align 4
  %138 = udiv i32 %136, %137
  %139 = load i32*, i32** %13, align 8
  %140 = bitcast i32* %139 to i8*
  %141 = load i32, i32* %14, align 4
  %142 = mul nsw i32 4, %141
  %143 = load i32, i32* %7, align 4
  %144 = mul i32 %142, %143
  %145 = call i32 @TIFFWriteEncodedStrip(%struct.tiff* %135, i32 %138, i8* %140, i32 %144)
  %146 = icmp eq i32 %145, -1
  br i1 %146, label %147, label %151

; <label>:147:                                    ; preds = %134
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 7)
  %148 = add i64 %pgocount6, 1
  store i64 %148, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 7)
  %149 = load i32*, i32** %6, align 8
  %150 = bitcast i32* %149 to i8*
  call void @_TIFFfree(i8* %150)
  store i32 0, i32* %3, align 4
  br label %160

; <label>:151:                                    ; preds = %134
  br label %152

; <label>:152:                                    ; preds = %151
  %153 = load i32, i32* @rowsperstrip, align 4
  %154 = load i32, i32* %9, align 4
  %155 = add i32 %154, %153
  store i32 %155, i32* %9, align 4
  br label %110

; <label>:156:                                    ; preds = %110
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 6)
  %157 = add i64 %pgocount7, 1
  store i64 %157, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_cvt_whole_image, i64 0, i64 6)
  %158 = load i32*, i32** %6, align 8
  %159 = bitcast i32* %158 to i8*
  call void @_TIFFfree(i8* %159)
  store i32 1, i32* %3, align 4
  br label %160

; <label>:160:                                    ; preds = %156, %147, %59, %46, %35
  %161 = load i32, i32* %3, align 4
  ret i32 %161
}

declare void @TIFFError(i8*, i8*, ...) #3

declare i8* @TIFFFileName(%struct.tiff*) #3

declare i8* @_TIFFmalloc(i32) #3

declare i32 @TIFFReadRGBATile(%struct.tiff*, i32, i32, i32*) #3

declare void @_TIFFmemcpy(i8*, i8*, i32) #3

declare i32 @TIFFWriteEncodedTile(%struct.tiff*, i32, i8*, i32) #3

declare i32 @TIFFComputeTile(%struct.tiff*, i32, i32, i32, i16 zeroext) #3

declare void @_TIFFfree(i8*) #3

declare i32 @TIFFReadRGBAStrip(%struct.tiff*, i32, i32*) #3

declare i32 @TIFFWriteEncodedStrip(%struct.tiff*, i32, i8*, i32) #3

declare i32 @TIFFDefaultStripSize(%struct.tiff*, i32) #3

declare i32 @TIFFReadRGBAImage(%struct.tiff*, i32, i32, i32*, i32) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

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
