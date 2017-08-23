; ModuleID = 'tmp1.ll'
source_filename = "tif_thunder.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@twobitdeltas = internal constant [4 x i32] [i32 0, i32 1, i32 0, i32 -1], align 16
@threebitdeltas = internal constant [8 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 -3, i32 -2, i32 -1], align 16
@.str = private unnamed_addr constant [52 x i8] c"ThunderDecode: %s data at scanline %ld (%lu != %lu)\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Not enough\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"Too much\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFInitThunderScan = private constant [19 x i8] c"TIFFInitThunderScan"
@__profn_tmp1.ll_ThunderDecodeRow = private constant [24 x i8] c"tmp1.ll:ThunderDecodeRow"
@__profn_tmp1.ll_ThunderDecode = private constant [21 x i8] c"tmp1.ll:ThunderDecode"
@__profc_TIFFInitThunderScan = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitThunderScan = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -928145591084009311, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitThunderScan, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitThunderScan to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ThunderDecodeRow = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ThunderDecodeRow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4428880688513703158, i64 44670996879, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ThunderDecodeRow, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @ThunderDecodeRow to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ThunderDecode = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ThunderDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6214600518268435442, i64 72057909969693900, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i32 0, i32 0), i8* null, i8* null, i32 23, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [51 x i8] c"B1x\DA\0B\F1ts\F3\CC\CB,\09\C9(\CDKI-\0ANN\CCc,\C9-0\D4\CB\C9\B1\82\8A\B9\A4&\E7\A7\A4\06\E5\97c\97\00\00\1EY\18\17", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitThunderScan to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ThunderDecodeRow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ThunderDecode to i8*), i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFInitThunderScan(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitThunderScan, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitThunderScan, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @ThunderDecodeRow, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @ThunderDecodeRow, i32 (%struct.tiff*, i8*, i32, i16)** %10, align 8
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @ThunderDecodeRow(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i8*, align 8
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %11 = load i8*, i8** %7, align 8
  store i8* %11, i8** %10, align 8
  %12 = load i16, i16* %9, align 2
  br label %13

; <label>:13:                                     ; preds = %28, %4
  %14 = load i32, i32* %8, align 4
  %15 = sext i32 %14 to i64
  %16 = icmp sgt i64 %15, 0
  br i1 %16, label %17, label %41

; <label>:17:                                     ; preds = %13
  %18 = load %struct.tiff*, %struct.tiff** %6, align 8
  %19 = load i8*, i8** %10, align 8
  %20 = load %struct.tiff*, %struct.tiff** %6, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 6
  %22 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %21, i32 0, i32 1
  %23 = load i32, i32* %22, align 8
  %24 = call i32 @ThunderDecode(%struct.tiff* %18, i8* %19, i32 %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ThunderDecodeRow, i64 0, i64 2)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ThunderDecodeRow, i64 0, i64 2)
  store i32 0, i32* %5, align 4
  br label %43

; <label>:28:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ThunderDecodeRow, i64 0, i64 0)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ThunderDecodeRow, i64 0, i64 0)
  %30 = load %struct.tiff*, %struct.tiff** %6, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 38
  %32 = load i32, i32* %31, align 8
  %33 = load i32, i32* %8, align 4
  %34 = sub nsw i32 %33, %32
  store i32 %34, i32* %8, align 4
  %35 = load %struct.tiff*, %struct.tiff** %6, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %35, i32 0, i32 38
  %37 = load i32, i32* %36, align 8
  %38 = load i8*, i8** %10, align 8
  %39 = sext i32 %37 to i64
  %40 = getelementptr inbounds i8, i8* %38, i64 %39
  store i8* %40, i8** %10, align 8
  br label %13

; <label>:41:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ThunderDecodeRow, i64 0, i64 1)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_ThunderDecodeRow, i64 0, i64 1)
  store i32 1, i32* %5, align 4
  br label %43

; <label>:43:                                     ; preds = %41, %26
  %44 = load i32, i32* %5, align 4
  ret i32 %44
}

; Function Attrs: nounwind uwtable
define internal i32 @ThunderDecode(%struct.tiff*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %14 = load %struct.tiff*, %struct.tiff** %5, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 42
  %16 = load i8*, i8** %15, align 8
  store i8* %16, i8** %8, align 8
  %17 = load %struct.tiff*, %struct.tiff** %5, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 43
  %19 = load i32, i32* %18, align 8
  store i32 %19, i32* %9, align 4
  store i32 0, i32* %10, align 4
  store i32 0, i32* %11, align 4
  br label %20

; <label>:20:                                     ; preds = %292, %3
  %21 = load i32, i32* %9, align 4
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 2)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 2)
  %25 = load i32, i32* %11, align 4
  %26 = load i32, i32* %7, align 4
  %27 = icmp slt i32 %25, %26
  br label %28

; <label>:28:                                     ; preds = %23, %20
  %29 = phi i1 [ false, %20 ], [ %27, %23 ]
  br i1 %29, label %30, label %294

; <label>:30:                                     ; preds = %28
  %31 = load i8*, i8** %8, align 8
  %32 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %32, i8** %8, align 8
  %33 = load i8, i8* %31, align 1
  %34 = zext i8 %33 to i32
  store i32 %34, i32* %12, align 4
  %35 = load i32, i32* %9, align 4
  %36 = add nsw i32 %35, -1
  store i32 %36, i32* %9, align 4
  %37 = load i32, i32* %12, align 4
  %38 = and i32 %37, 192
  switch i32 %38, label %292 [
    i32 0, label %39
    i32 64, label %96
    i32 128, label %199
    i32 192, label %268
  ]

; <label>:39:                                     ; preds = %30
  %40 = load i32, i32* %11, align 4
  %41 = and i32 %40, 1
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %60

; <label>:43:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 5)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 5)
  %45 = load i32, i32* %10, align 4
  %46 = load i8*, i8** %6, align 8
  %47 = getelementptr inbounds i8, i8* %46, i64 0
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = or i32 %49, %45
  %51 = trunc i32 %50 to i8
  store i8 %51, i8* %47, align 1
  %52 = load i8*, i8** %6, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %6, align 8
  %54 = load i8, i8* %52, align 1
  %55 = zext i8 %54 to i32
  store i32 %55, i32* %10, align 4
  %56 = load i32, i32* %11, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %11, align 4
  %58 = load i32, i32* %12, align 4
  %59 = add nsw i32 %58, -1
  store i32 %59, i32* %12, align 4
  br label %66

; <label>:60:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 6)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 6)
  %62 = load i32, i32* %10, align 4
  %63 = shl i32 %62, 4
  %64 = load i32, i32* %10, align 4
  %65 = or i32 %64, %63
  store i32 %65, i32* %10, align 4
  br label %66

; <label>:66:                                     ; preds = %60, %43
  %67 = load i32, i32* %12, align 4
  %68 = load i32, i32* %11, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, i32* %11, align 4
  br label %70

; <label>:70:                                     ; preds = %79, %66
  %71 = load i32, i32* %12, align 4
  %72 = icmp sgt i32 %71, 0
  br i1 %72, label %73, label %82

; <label>:73:                                     ; preds = %70
  %pgocount3 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 0)
  %74 = add i64 %pgocount3, 1
  store i64 %74, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 0)
  %75 = load i32, i32* %10, align 4
  %76 = trunc i32 %75 to i8
  %77 = load i8*, i8** %6, align 8
  %78 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %78, i8** %6, align 8
  store i8 %76, i8* %77, align 1
  br label %79

; <label>:79:                                     ; preds = %73
  %80 = load i32, i32* %12, align 4
  %81 = sub nsw i32 %80, 2
  store i32 %81, i32* %12, align 4
  br label %70

; <label>:82:                                     ; preds = %70
  %83 = load i32, i32* %12, align 4
  %84 = icmp eq i32 %83, -1
  br i1 %84, label %85, label %93

; <label>:85:                                     ; preds = %82
  %pgocount4 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 9)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 9)
  %87 = load i8*, i8** %6, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 -1
  store i8* %88, i8** %6, align 8
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = and i32 %90, 240
  %92 = trunc i32 %91 to i8
  store i8 %92, i8* %88, align 1
  br label %93

; <label>:93:                                     ; preds = %85, %82
  %94 = load i32, i32* %10, align 4
  %95 = and i32 %94, 15
  store i32 %95, i32* %10, align 4
  br label %292

; <label>:96:                                     ; preds = %30
  %97 = load i32, i32* %12, align 4
  %98 = ashr i32 %97, 4
  %99 = and i32 %98, 3
  store i32 %99, i32* %13, align 4
  %100 = icmp ne i32 %99, 2
  br i1 %100, label %101, label %130

; <label>:101:                                    ; preds = %96
  %102 = load i32, i32* %10, align 4
  %103 = load i32, i32* %13, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [4 x i32], [4 x i32]* @twobitdeltas, i64 0, i64 %104
  %106 = load i32, i32* %105, align 4
  %107 = add i32 %102, %106
  %108 = and i32 %107, 15
  store i32 %108, i32* %10, align 4
  %109 = load i32, i32* %11, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %11, align 4
  %111 = and i32 %109, 1
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %122

; <label>:113:                                    ; preds = %101
  %pgocount5 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 10)
  %114 = add i64 %pgocount5, 1
  store i64 %114, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 10)
  %115 = load i32, i32* %10, align 4
  %116 = load i8*, i8** %6, align 8
  %117 = getelementptr inbounds i8, i8* %116, i32 1
  store i8* %117, i8** %6, align 8
  %118 = load i8, i8* %116, align 1
  %119 = zext i8 %118 to i32
  %120 = or i32 %119, %115
  %121 = trunc i32 %120 to i8
  store i8 %121, i8* %116, align 1
  br label %129

; <label>:122:                                    ; preds = %101
  %pgocount6 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 11)
  %123 = add i64 %pgocount6, 1
  store i64 %123, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 11)
  %124 = load i32, i32* %10, align 4
  %125 = shl i32 %124, 4
  %126 = trunc i32 %125 to i8
  %127 = load i8*, i8** %6, align 8
  %128 = getelementptr inbounds i8, i8* %127, i64 0
  store i8 %126, i8* %128, align 1
  br label %129

; <label>:129:                                    ; preds = %122, %113
  br label %130

; <label>:130:                                    ; preds = %129, %96
  %131 = load i32, i32* %12, align 4
  %132 = ashr i32 %131, 2
  %133 = and i32 %132, 3
  store i32 %133, i32* %13, align 4
  %134 = icmp ne i32 %133, 2
  br i1 %134, label %135, label %164

; <label>:135:                                    ; preds = %130
  %136 = load i32, i32* %10, align 4
  %137 = load i32, i32* %13, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [4 x i32], [4 x i32]* @twobitdeltas, i64 0, i64 %138
  %140 = load i32, i32* %139, align 4
  %141 = add i32 %136, %140
  %142 = and i32 %141, 15
  store i32 %142, i32* %10, align 4
  %143 = load i32, i32* %11, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %11, align 4
  %145 = and i32 %143, 1
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %147, label %156

; <label>:147:                                    ; preds = %135
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 12)
  %148 = add i64 %pgocount7, 1
  store i64 %148, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 12)
  %149 = load i32, i32* %10, align 4
  %150 = load i8*, i8** %6, align 8
  %151 = getelementptr inbounds i8, i8* %150, i32 1
  store i8* %151, i8** %6, align 8
  %152 = load i8, i8* %150, align 1
  %153 = zext i8 %152 to i32
  %154 = or i32 %153, %149
  %155 = trunc i32 %154 to i8
  store i8 %155, i8* %150, align 1
  br label %163

; <label>:156:                                    ; preds = %135
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 13)
  %157 = add i64 %pgocount8, 1
  store i64 %157, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 13)
  %158 = load i32, i32* %10, align 4
  %159 = shl i32 %158, 4
  %160 = trunc i32 %159 to i8
  %161 = load i8*, i8** %6, align 8
  %162 = getelementptr inbounds i8, i8* %161, i64 0
  store i8 %160, i8* %162, align 1
  br label %163

; <label>:163:                                    ; preds = %156, %147
  br label %164

; <label>:164:                                    ; preds = %163, %130
  %165 = load i32, i32* %12, align 4
  %166 = and i32 %165, 3
  store i32 %166, i32* %13, align 4
  %167 = icmp ne i32 %166, 2
  br i1 %167, label %168, label %197

; <label>:168:                                    ; preds = %164
  %169 = load i32, i32* %10, align 4
  %170 = load i32, i32* %13, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [4 x i32], [4 x i32]* @twobitdeltas, i64 0, i64 %171
  %173 = load i32, i32* %172, align 4
  %174 = add i32 %169, %173
  %175 = and i32 %174, 15
  store i32 %175, i32* %10, align 4
  %176 = load i32, i32* %11, align 4
  %177 = add nsw i32 %176, 1
  store i32 %177, i32* %11, align 4
  %178 = and i32 %176, 1
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %189

; <label>:180:                                    ; preds = %168
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 14)
  %181 = add i64 %pgocount9, 1
  store i64 %181, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 14)
  %182 = load i32, i32* %10, align 4
  %183 = load i8*, i8** %6, align 8
  %184 = getelementptr inbounds i8, i8* %183, i32 1
  store i8* %184, i8** %6, align 8
  %185 = load i8, i8* %183, align 1
  %186 = zext i8 %185 to i32
  %187 = or i32 %186, %182
  %188 = trunc i32 %187 to i8
  store i8 %188, i8* %183, align 1
  br label %196

; <label>:189:                                    ; preds = %168
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 15)
  %190 = add i64 %pgocount10, 1
  store i64 %190, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 15)
  %191 = load i32, i32* %10, align 4
  %192 = shl i32 %191, 4
  %193 = trunc i32 %192 to i8
  %194 = load i8*, i8** %6, align 8
  %195 = getelementptr inbounds i8, i8* %194, i64 0
  store i8 %193, i8* %195, align 1
  br label %196

; <label>:196:                                    ; preds = %189, %180
  br label %197

; <label>:197:                                    ; preds = %196, %164
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 3)
  %198 = add i64 %pgocount11, 1
  store i64 %198, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 3)
  br label %292

; <label>:199:                                    ; preds = %30
  %200 = load i32, i32* %12, align 4
  %201 = ashr i32 %200, 3
  %202 = and i32 %201, 7
  store i32 %202, i32* %13, align 4
  %203 = icmp ne i32 %202, 4
  br i1 %203, label %204, label %233

; <label>:204:                                    ; preds = %199
  %205 = load i32, i32* %10, align 4
  %206 = load i32, i32* %13, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [8 x i32], [8 x i32]* @threebitdeltas, i64 0, i64 %207
  %209 = load i32, i32* %208, align 4
  %210 = add i32 %205, %209
  %211 = and i32 %210, 15
  store i32 %211, i32* %10, align 4
  %212 = load i32, i32* %11, align 4
  %213 = add nsw i32 %212, 1
  store i32 %213, i32* %11, align 4
  %214 = and i32 %212, 1
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %216, label %225

; <label>:216:                                    ; preds = %204
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 16)
  %217 = add i64 %pgocount12, 1
  store i64 %217, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 16)
  %218 = load i32, i32* %10, align 4
  %219 = load i8*, i8** %6, align 8
  %220 = getelementptr inbounds i8, i8* %219, i32 1
  store i8* %220, i8** %6, align 8
  %221 = load i8, i8* %219, align 1
  %222 = zext i8 %221 to i32
  %223 = or i32 %222, %218
  %224 = trunc i32 %223 to i8
  store i8 %224, i8* %219, align 1
  br label %232

; <label>:225:                                    ; preds = %204
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 17)
  %226 = add i64 %pgocount13, 1
  store i64 %226, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 17)
  %227 = load i32, i32* %10, align 4
  %228 = shl i32 %227, 4
  %229 = trunc i32 %228 to i8
  %230 = load i8*, i8** %6, align 8
  %231 = getelementptr inbounds i8, i8* %230, i64 0
  store i8 %229, i8* %231, align 1
  br label %232

; <label>:232:                                    ; preds = %225, %216
  br label %233

; <label>:233:                                    ; preds = %232, %199
  %234 = load i32, i32* %12, align 4
  %235 = and i32 %234, 7
  store i32 %235, i32* %13, align 4
  %236 = icmp ne i32 %235, 4
  br i1 %236, label %237, label %266

; <label>:237:                                    ; preds = %233
  %238 = load i32, i32* %10, align 4
  %239 = load i32, i32* %13, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [8 x i32], [8 x i32]* @threebitdeltas, i64 0, i64 %240
  %242 = load i32, i32* %241, align 4
  %243 = add i32 %238, %242
  %244 = and i32 %243, 15
  store i32 %244, i32* %10, align 4
  %245 = load i32, i32* %11, align 4
  %246 = add nsw i32 %245, 1
  store i32 %246, i32* %11, align 4
  %247 = and i32 %245, 1
  %248 = icmp ne i32 %247, 0
  br i1 %248, label %249, label %258

; <label>:249:                                    ; preds = %237
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 18)
  %250 = add i64 %pgocount14, 1
  store i64 %250, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 18)
  %251 = load i32, i32* %10, align 4
  %252 = load i8*, i8** %6, align 8
  %253 = getelementptr inbounds i8, i8* %252, i32 1
  store i8* %253, i8** %6, align 8
  %254 = load i8, i8* %252, align 1
  %255 = zext i8 %254 to i32
  %256 = or i32 %255, %251
  %257 = trunc i32 %256 to i8
  store i8 %257, i8* %252, align 1
  br label %265

; <label>:258:                                    ; preds = %237
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 19)
  %259 = add i64 %pgocount15, 1
  store i64 %259, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 19)
  %260 = load i32, i32* %10, align 4
  %261 = shl i32 %260, 4
  %262 = trunc i32 %261 to i8
  %263 = load i8*, i8** %6, align 8
  %264 = getelementptr inbounds i8, i8* %263, i64 0
  store i8 %262, i8* %264, align 1
  br label %265

; <label>:265:                                    ; preds = %258, %249
  br label %266

; <label>:266:                                    ; preds = %265, %233
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 4)
  %267 = add i64 %pgocount16, 1
  store i64 %267, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 4)
  br label %292

; <label>:268:                                    ; preds = %30
  %269 = load i32, i32* %12, align 4
  %270 = and i32 %269, 15
  store i32 %270, i32* %10, align 4
  %271 = load i32, i32* %11, align 4
  %272 = add nsw i32 %271, 1
  store i32 %272, i32* %11, align 4
  %273 = and i32 %271, 1
  %274 = icmp ne i32 %273, 0
  br i1 %274, label %275, label %284

; <label>:275:                                    ; preds = %268
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 7)
  %276 = add i64 %pgocount17, 1
  store i64 %276, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 7)
  %277 = load i32, i32* %10, align 4
  %278 = load i8*, i8** %6, align 8
  %279 = getelementptr inbounds i8, i8* %278, i32 1
  store i8* %279, i8** %6, align 8
  %280 = load i8, i8* %278, align 1
  %281 = zext i8 %280 to i32
  %282 = or i32 %281, %277
  %283 = trunc i32 %282 to i8
  store i8 %283, i8* %278, align 1
  br label %291

; <label>:284:                                    ; preds = %268
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 8)
  %285 = add i64 %pgocount18, 1
  store i64 %285, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 8)
  %286 = load i32, i32* %10, align 4
  %287 = shl i32 %286, 4
  %288 = trunc i32 %287 to i8
  %289 = load i8*, i8** %6, align 8
  %290 = getelementptr inbounds i8, i8* %289, i64 0
  store i8 %288, i8* %290, align 1
  br label %291

; <label>:291:                                    ; preds = %284, %275
  br label %292

; <label>:292:                                    ; preds = %291, %266, %197, %93, %30
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 1)
  %293 = add i64 %pgocount19, 1
  store i64 %293, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 1)
  br label %20

; <label>:294:                                    ; preds = %28
  %295 = load i8*, i8** %8, align 8
  %296 = load %struct.tiff*, %struct.tiff** %5, align 8
  %297 = getelementptr inbounds %struct.tiff, %struct.tiff* %296, i32 0, i32 42
  store i8* %295, i8** %297, align 8
  %298 = load i32, i32* %9, align 4
  %299 = load %struct.tiff*, %struct.tiff** %5, align 8
  %300 = getelementptr inbounds %struct.tiff, %struct.tiff* %299, i32 0, i32 43
  store i32 %298, i32* %300, align 8
  %301 = load i32, i32* %11, align 4
  %302 = load i32, i32* %7, align 4
  %303 = icmp ne i32 %301, %302
  br i1 %303, label %304, label %323

; <label>:304:                                    ; preds = %294
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 20)
  %305 = add i64 %pgocount20, 1
  store i64 %305, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 20)
  %306 = load %struct.tiff*, %struct.tiff** %5, align 8
  %307 = getelementptr inbounds %struct.tiff, %struct.tiff* %306, i32 0, i32 0
  %308 = load i8*, i8** %307, align 8
  %309 = load i32, i32* %11, align 4
  %310 = load i32, i32* %7, align 4
  %311 = icmp slt i32 %309, %310
  %312 = zext i1 %311 to i64
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 22)
  %313 = add i64 %pgocount21, %312
  store i64 %313, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 22)
  %314 = select i1 %311, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0)
  %315 = load %struct.tiff*, %struct.tiff** %5, align 8
  %316 = getelementptr inbounds %struct.tiff, %struct.tiff* %315, i32 0, i32 11
  %317 = load i32, i32* %316, align 8
  %318 = zext i32 %317 to i64
  %319 = load i32, i32* %11, align 4
  %320 = sext i32 %319 to i64
  %321 = load i32, i32* %7, align 4
  %322 = sext i32 %321 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %308, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str, i32 0, i32 0), i8* %314, i64 %318, i64 %320, i64 %322)
  store i32 0, i32* %4, align 4
  br label %325

; <label>:323:                                    ; preds = %294
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 21)
  %324 = add i64 %pgocount22, 1
  store i64 %324, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_ThunderDecode, i64 0, i64 21)
  store i32 1, i32* %4, align 4
  br label %325

; <label>:325:                                    ; preds = %323, %304
  %326 = load i32, i32* %4, align 4
  ret i32 %326
}

declare void @TIFFError(i8*, i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
