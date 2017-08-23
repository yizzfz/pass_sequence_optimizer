; ModuleID = 'tmp1.ll'
source_filename = "tif_strip.c"
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

@.str = private unnamed_addr constant [32 x i8] c"%u: Sample out of range, max %u\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFComputeStrip = private constant [16 x i8] c"TIFFComputeStrip"
@__profn_TIFFNumberOfStrips = private constant [18 x i8] c"TIFFNumberOfStrips"
@__profn_TIFFVStripSize = private constant [14 x i8] c"TIFFVStripSize"
@__profn_TIFFScanlineSize = private constant [16 x i8] c"TIFFScanlineSize"
@__profn_TIFFStripSize = private constant [13 x i8] c"TIFFStripSize"
@__profn_TIFFDefaultStripSize = private constant [20 x i8] c"TIFFDefaultStripSize"
@__profn__TIFFDefaultStripSize = private constant [21 x i8] c"_TIFFDefaultStripSize"
@__profn_TIFFRasterScanlineSize = private constant [22 x i8] c"TIFFRasterScanlineSize"
@__profc_TIFFComputeStrip = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFComputeStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8407736610022122566, i64 40073891988, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFComputeStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i16)* @TIFFComputeStrip to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFNumberOfStrips = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFNumberOfStrips = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2819091387288846642, i64 72057636006223249, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFNumberOfStrips to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFVStripSize = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFVStripSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1536458565777686091, i64 58302444702, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFVStripSize to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFScanlineSize = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFScanlineSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7566780431909815027, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFScanlineSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFScanlineSize to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFStripSize = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFStripSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6538103682385224518, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFStripSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFStripSize to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFDefaultStripSize = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFDefaultStripSize = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFDefaultStripSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 29617426073335353, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFDefaultStripSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFDefaultStripSize to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFDefaultStripSize to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc__TIFFDefaultStripSize = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFDefaultStripSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6933953848034239958, i64 53944548713, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @_TIFFDefaultStripSize to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFRasterScanlineSize = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFRasterScanlineSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 350161525480077486, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRasterScanlineSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFRasterScanlineSize to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [86 x i8] c"\93\01Sx\DA\0B\F1tss\CE\CF-(-I\0D.)\CA,`\0C\01\0A\F8\95\E6&\A5\16\F9\A7\81E\8A\C1Ba`vpfU*\98\1B\9C\9C\98\97\93\99\97\8A\10@\91vIMK,\CD)A\08\C6c\15\05\09\06%\16\97\A4\16!\9B\07\00\12\A94\D6", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFComputeStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFNumberOfStrips to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFVStripSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFScanlineSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFStripSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFDefaultStripSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFDefaultStripSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFRasterScanlineSize to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFComputeStrip(%struct.tiff*, i32, i16 zeroext) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  %8 = alloca %struct.TIFFDirectory*, align 8
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store i16 %2, i16* %7, align 2
  %10 = load %struct.tiff*, %struct.tiff** %5, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 6
  store %struct.TIFFDirectory* %11, %struct.TIFFDirectory** %8, align 8
  %12 = load i32, i32* %6, align 4
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 16
  %15 = load i32, i32* %14, align 4
  %16 = udiv i32 %12, %15
  store i32 %16, i32* %9, align 4
  %17 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %18 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %17, i32 0, i32 24
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = icmp eq i32 %20, 2
  br i1 %21, label %22, label %51

; <label>:22:                                     ; preds = %3
  %23 = load i16, i16* %7, align 2
  %24 = zext i16 %23 to i32
  %25 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %26 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %25, i32 0, i32 15
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  %29 = icmp sge i32 %24, %28
  br i1 %29, label %30, label %41

; <label>:30:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFComputeStrip, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFComputeStrip, i64 0, i64 1)
  %32 = load %struct.tiff*, %struct.tiff** %5, align 8
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %32, i32 0, i32 0
  %34 = load i8*, i8** %33, align 8
  %35 = load i16, i16* %7, align 2
  %36 = zext i16 %35 to i32
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 15
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* %34, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0), i32 %36, i32 %40)
  store i32 0, i32* %4, align 4
  br label %54

; <label>:41:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFComputeStrip, i64 0, i64 2)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFComputeStrip, i64 0, i64 2)
  %43 = load i16, i16* %7, align 2
  %44 = zext i16 %43 to i32
  %45 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %8, align 8
  %46 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %45, i32 0, i32 42
  %47 = load i32, i32* %46, align 8
  %48 = mul i32 %44, %47
  %49 = load i32, i32* %9, align 4
  %50 = add i32 %49, %48
  store i32 %50, i32* %9, align 4
  br label %51

; <label>:51:                                     ; preds = %41, %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFComputeStrip, i64 0, i64 0)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFComputeStrip, i64 0, i64 0)
  %53 = load i32, i32* %9, align 4
  store i32 %53, i32* %4, align 4
  br label %54

; <label>:54:                                     ; preds = %51, %30
  %55 = load i32, i32* %4, align 4
  ret i32 %55
}

declare void @TIFFError(i8*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @TIFFNumberOfStrips(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.TIFFDirectory*, align 8
  %4 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %5 = load %struct.tiff*, %struct.tiff** %2, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 6
  store %struct.TIFFDirectory* %6, %struct.TIFFDirectory** %3, align 8
  %7 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %8 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %7, i32 0, i32 16
  %9 = load i32, i32* %8, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %20

; <label>:11:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i64 0, i64 2)
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 2
  %15 = load i32, i32* %14, align 4
  %16 = icmp ne i32 %15, 0
  %17 = zext i1 %16 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i64 0, i64 3)
  %18 = add i64 %pgocount1, %17
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i64 0, i64 3)
  %19 = select i1 %16, i32 1, i32 0
  br label %34

; <label>:20:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i64 0, i64 0)
  %22 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %23 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %22, i32 0, i32 2
  %24 = load i32, i32* %23, align 4
  %25 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %26 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %25, i32 0, i32 16
  %27 = load i32, i32* %26, align 4
  %28 = sub i32 %27, 1
  %29 = add i32 %24, %28
  %30 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %31 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %30, i32 0, i32 16
  %32 = load i32, i32* %31, align 4
  %33 = udiv i32 %29, %32
  br label %34

; <label>:34:                                     ; preds = %20, %11
  %35 = phi i32 [ %19, %11 ], [ %33, %20 ]
  store i32 %35, i32* %4, align 4
  %36 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %37 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %36, i32 0, i32 24
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = icmp eq i32 %39, 2
  br i1 %40, label %41, label %49

; <label>:41:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i64 0, i64 1)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFNumberOfStrips, i64 0, i64 1)
  %43 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %44 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %43, i32 0, i32 15
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = load i32, i32* %4, align 4
  %48 = mul i32 %47, %46
  store i32 %48, i32* %4, align 4
  br label %49

; <label>:49:                                     ; preds = %41, %34
  %50 = load i32, i32* %4, align 4
  ret i32 %50
}

; Function Attrs: nounwind uwtable
define i32 @TIFFVStripSize(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFDirectory*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %10 = load %struct.tiff*, %struct.tiff** %4, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 6
  store %struct.TIFFDirectory* %11, %struct.TIFFDirectory** %6, align 8
  %12 = load i32, i32* %5, align 4
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 2)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 2)
  %16 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %17 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %16, i32 0, i32 2
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %5, align 4
  br label %19

; <label>:19:                                     ; preds = %14, %2
  %20 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %21 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %20, i32 0, i32 24
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %112

; <label>:25:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 1)
  %27 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %28 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %27, i32 0, i32 11
  %29 = load i16, i16* %28, align 2
  %30 = zext i16 %29 to i32
  %31 = icmp eq i32 %30, 6
  br i1 %31, label %32, label %112

; <label>:32:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 3)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 3)
  %34 = load %struct.tiff*, %struct.tiff** %4, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %34, i32 0, i32 3
  %36 = load i32, i32* %35, align 8
  %37 = and i32 %36, 16384
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %112, label %39

; <label>:39:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 4)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 4)
  %41 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %42 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 8
  %44 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %45 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %44, i32 0, i32 49
  %46 = getelementptr inbounds [2 x i16], [2 x i16]* %45, i64 0, i64 0
  %47 = load i16, i16* %46, align 8
  %48 = zext i16 %47 to i32
  %49 = sub i32 %48, 1
  %50 = add i32 %43, %49
  %51 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %52 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %51, i32 0, i32 49
  %53 = getelementptr inbounds [2 x i16], [2 x i16]* %52, i64 0, i64 0
  %54 = load i16, i16* %53, align 8
  %55 = zext i16 %54 to i32
  %56 = udiv i32 %50, %55
  %57 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %58 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %57, i32 0, i32 49
  %59 = getelementptr inbounds [2 x i16], [2 x i16]* %58, i64 0, i64 0
  %60 = load i16, i16* %59, align 8
  %61 = zext i16 %60 to i32
  %62 = mul i32 %56, %61
  store i32 %62, i32* %7, align 4
  %63 = load i32, i32* %7, align 4
  %64 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %65 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %64, i32 0, i32 8
  %66 = load i16, i16* %65, align 4
  %67 = zext i16 %66 to i32
  %68 = mul nsw i32 %63, %67
  %69 = add i32 %68, 7
  %70 = udiv i32 %69, 8
  store i32 %70, i32* %8, align 4
  %71 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %72 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %71, i32 0, i32 49
  %73 = getelementptr inbounds [2 x i16], [2 x i16]* %72, i64 0, i64 0
  %74 = load i16, i16* %73, align 8
  %75 = zext i16 %74 to i32
  %76 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %77 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %76, i32 0, i32 49
  %78 = getelementptr inbounds [2 x i16], [2 x i16]* %77, i64 0, i64 1
  %79 = load i16, i16* %78, align 2
  %80 = zext i16 %79 to i32
  %81 = mul nsw i32 %75, %80
  store i32 %81, i32* %9, align 4
  %82 = load i32, i32* %5, align 4
  %83 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %84 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %83, i32 0, i32 49
  %85 = getelementptr inbounds [2 x i16], [2 x i16]* %84, i64 0, i64 1
  %86 = load i16, i16* %85, align 2
  %87 = zext i16 %86 to i32
  %88 = sub i32 %87, 1
  %89 = add i32 %82, %88
  %90 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %91 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %90, i32 0, i32 49
  %92 = getelementptr inbounds [2 x i16], [2 x i16]* %91, i64 0, i64 1
  %93 = load i16, i16* %92, align 2
  %94 = zext i16 %93 to i32
  %95 = udiv i32 %89, %94
  %96 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %97 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %96, i32 0, i32 49
  %98 = getelementptr inbounds [2 x i16], [2 x i16]* %97, i64 0, i64 1
  %99 = load i16, i16* %98, align 2
  %100 = zext i16 %99 to i32
  %101 = mul i32 %95, %100
  store i32 %101, i32* %5, align 4
  %102 = load i32, i32* %5, align 4
  %103 = load i32, i32* %8, align 4
  %104 = mul i32 %102, %103
  %105 = load i32, i32* %5, align 4
  %106 = load i32, i32* %8, align 4
  %107 = mul i32 %105, %106
  %108 = load i32, i32* %9, align 4
  %109 = udiv i32 %107, %108
  %110 = mul i32 2, %109
  %111 = add i32 %104, %110
  store i32 %111, i32* %3, align 4
  br label %118

; <label>:112:                                    ; preds = %32, %25, %19
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 0)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFVStripSize, i64 0, i64 0)
  %114 = load i32, i32* %5, align 4
  %115 = load %struct.tiff*, %struct.tiff** %4, align 8
  %116 = call i32 @TIFFScanlineSize(%struct.tiff* %115)
  %117 = mul i32 %114, %116
  store i32 %117, i32* %3, align 4
  br label %118

; <label>:118:                                    ; preds = %112, %39
  %119 = load i32, i32* %3, align 4
  ret i32 %119
}

; Function Attrs: nounwind uwtable
define i32 @TIFFScanlineSize(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.TIFFDirectory*, align 8
  %4 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %5 = load %struct.tiff*, %struct.tiff** %2, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 6
  store %struct.TIFFDirectory* %6, %struct.TIFFDirectory** %3, align 8
  %7 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %8 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %7, i32 0, i32 8
  %9 = load i16, i16* %8, align 4
  %10 = zext i16 %9 to i32
  %11 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %12 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 8
  %14 = mul i32 %10, %13
  store i32 %14, i32* %4, align 4
  %15 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %16 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %15, i32 0, i32 24
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i32
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %28

; <label>:20:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFScanlineSize, i64 0, i64 1)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFScanlineSize, i64 0, i64 1)
  %22 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %23 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %22, i32 0, i32 15
  %24 = load i16, i16* %23, align 2
  %25 = zext i16 %24 to i32
  %26 = load i32, i32* %4, align 4
  %27 = mul nsw i32 %26, %25
  store i32 %27, i32* %4, align 4
  br label %28

; <label>:28:                                     ; preds = %20, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFScanlineSize, i64 0, i64 0)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFScanlineSize, i64 0, i64 0)
  %30 = load i32, i32* %4, align 4
  %31 = add i32 %30, 7
  %32 = udiv i32 %31, 8
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define i32 @TIFFStripSize(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.TIFFDirectory*, align 8
  %4 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %5 = load %struct.tiff*, %struct.tiff** %2, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 6
  store %struct.TIFFDirectory* %6, %struct.TIFFDirectory** %3, align 8
  %7 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %8 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %7, i32 0, i32 16
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %4, align 4
  %10 = load i32, i32* %4, align 4
  %11 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %12 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp ugt i32 %10, %13
  br i1 %14, label %15, label %20

; <label>:15:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFStripSize, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFStripSize, i64 0, i64 1)
  %17 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %18 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %17, i32 0, i32 2
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %4, align 4
  br label %20

; <label>:20:                                     ; preds = %15, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFStripSize, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFStripSize, i64 0, i64 0)
  %22 = load %struct.tiff*, %struct.tiff** %2, align 8
  %23 = load i32, i32* %4, align 4
  %24 = call i32 @TIFFVStripSize(%struct.tiff* %22, i32 %23)
  ret i32 %24
}

; Function Attrs: nounwind uwtable
define i32 @TIFFDefaultStripSize(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFDefaultStripSize, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFDefaultStripSize, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.tiff*, %struct.tiff** %4, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 35
  %8 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %7, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = load i32, i32* %5, align 4
  %11 = ptrtoint i32 (%struct.tiff*, i32)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFDefaultStripSize to i8*), i32 0)
  %12 = call i32 %8(%struct.tiff* %9, i32 %10)
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @_TIFFDefaultStripSize(%struct.tiff*, i32) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i32, i32* %4, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %26

; <label>:8:                                      ; preds = %2
  %9 = load %struct.tiff*, %struct.tiff** %3, align 8
  %10 = call i32 @TIFFScanlineSize(%struct.tiff* %9)
  store i32 %10, i32* %5, align 4
  %11 = load i32, i32* %5, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i64 0, i64 2)
  br label %18

; <label>:15:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i64 0, i64 1)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i64 0, i64 1)
  %17 = load i32, i32* %5, align 4
  br label %18

; <label>:18:                                     ; preds = %15, %13
  %19 = phi i32 [ 1, %13 ], [ %17, %15 ]
  %20 = udiv i32 8192, %19
  store i32 %20, i32* %4, align 4
  %21 = load i32, i32* %4, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i64 0, i64 3)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i64 0, i64 3)
  store i32 1, i32* %4, align 4
  br label %25

; <label>:25:                                     ; preds = %23, %18
  br label %26

; <label>:26:                                     ; preds = %25, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i64 0, i64 0)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFDefaultStripSize, i64 0, i64 0)
  %28 = load i32, i32* %4, align 4
  ret i32 %28
}

; Function Attrs: nounwind uwtable
define i32 @TIFFRasterScanlineSize(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirectory*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 6
  store %struct.TIFFDirectory* %7, %struct.TIFFDirectory** %4, align 8
  %8 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %9 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %8, i32 0, i32 8
  %10 = load i16, i16* %9, align 4
  %11 = zext i16 %10 to i32
  %12 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %13 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 8
  %15 = mul i32 %11, %14
  store i32 %15, i32* %5, align 4
  %16 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %17 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %16, i32 0, i32 24
  %18 = load i16, i16* %17, align 2
  %19 = zext i16 %18 to i32
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %32

; <label>:21:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRasterScanlineSize, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRasterScanlineSize, i64 0, i64 0)
  %23 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %24 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %23, i32 0, i32 15
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = load i32, i32* %5, align 4
  %28 = mul nsw i32 %27, %26
  store i32 %28, i32* %5, align 4
  %29 = load i32, i32* %5, align 4
  %30 = add i32 %29, 7
  %31 = udiv i32 %30, 8
  store i32 %31, i32* %2, align 4
  br label %42

; <label>:32:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRasterScanlineSize, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFRasterScanlineSize, i64 0, i64 1)
  %34 = load i32, i32* %5, align 4
  %35 = add i32 %34, 7
  %36 = udiv i32 %35, 8
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 15
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = mul nsw i32 %36, %40
  store i32 %41, i32* %2, align 4
  br label %42

; <label>:42:                                     ; preds = %32, %21
  %43 = load i32, i32* %2, align 4
  ret i32 %43
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
