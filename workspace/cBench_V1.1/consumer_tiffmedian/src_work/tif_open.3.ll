; ModuleID = 'tif_open.2.ll'
source_filename = "tif_open.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%union.anon = type { i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [15 x i8] c"\22%s\22: Bad mode\00", align 1
@TIFFClientOpen.module = internal constant [15 x i8] c"TIFFClientOpen\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"%s: Out of memory (TIFF structure)\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Cannot read TIFF header\00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"Error writing TIFF header\00", align 1
@.str.4 = private unnamed_addr constant [44 x i8] c"Not a TIFF file, bad magic number %d (0x%x)\00", align 1
@.str.5 = private unnamed_addr constant [46 x i8] c"Not a TIFF file, bad version number %d (0x%x)\00", align 1
@typemask = internal constant [13 x i64] [i64 0, i64 255, i64 4294967295, i64 65535, i64 4294967295, i64 4294967295, i64 255, i64 255, i64 65535, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295], align 16
@bigTypeshift = internal constant [13 x i32] [i32 0, i32 24, i32 0, i32 16, i32 0, i32 0, i32 24, i32 24, i32 16, i32 0, i32 0, i32 0, i32 0], align 16
@litTypeshift = internal constant [13 x i32] zeroinitializer, align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn__TIFFgetMode = private constant [12 x i8] c"_TIFFgetMode"
@__profn_TIFFClientOpen = private constant [14 x i8] c"TIFFClientOpen"
@__profn_tmp1.ll_TIFFInitOrder = private constant [21 x i8] c"tmp1.ll:TIFFInitOrder"
@__profn_TIFFFileName = private constant [12 x i8] c"TIFFFileName"
@__profn_TIFFFileno = private constant [10 x i8] c"TIFFFileno"
@__profn_TIFFGetMode = private constant [11 x i8] c"TIFFGetMode"
@__profn_TIFFIsTiled = private constant [11 x i8] c"TIFFIsTiled"
@__profn_TIFFCurrentRow = private constant [14 x i8] c"TIFFCurrentRow"
@__profn_TIFFCurrentDirectory = private constant [20 x i8] c"TIFFCurrentDirectory"
@__profn_TIFFCurrentStrip = private constant [16 x i8] c"TIFFCurrentStrip"
@__profn_TIFFCurrentTile = private constant [15 x i8] c"TIFFCurrentTile"
@__profn_TIFFIsByteSwapped = private constant [17 x i8] c"TIFFIsByteSwapped"
@__profn_TIFFIsUpSampled = private constant [15 x i8] c"TIFFIsUpSampled"
@__profn_TIFFIsMSB2LSB = private constant [13 x i8] c"TIFFIsMSB2LSB"
@__profc__TIFFgetMode = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFgetMode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2601628208547149624, i64 65572630079, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @_TIFFgetMode to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFClientOpen = private global [40 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFClientOpen = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFClientOpen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1078068744371932652, i64 145241546344928170, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i32 0, i32 0), i8* bitcast (%struct.tiff* (i8*, i8*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*)* @TIFFClientOpen to i8*), i8* bitcast ([4 x i64]* @__profvp_TIFFClientOpen to i8*), i32 40, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_TIFFInitOrder = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_TIFFInitOrder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 271392203038758187, i64 53179400532, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFFileName = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFFileName = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5124137332420681472, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFFileName, i32 0, i32 0), i8* bitcast (i8* (%struct.tiff*)* @TIFFFileName to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFFileno = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFFileno = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4290719051403595847, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFFileno, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFFileno to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFGetMode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFGetMode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5804094230777340084, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetMode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFGetMode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFIsTiled = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFIsTiled = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7703995398994331646, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsTiled, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFIsTiled to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFCurrentRow = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFCurrentRow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6874345823214388372, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentRow, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFCurrentRow to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFCurrentDirectory = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFCurrentDirectory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -268468127962781813, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentDirectory, i32 0, i32 0), i8* bitcast (i16 (%struct.tiff*)* @TIFFCurrentDirectory to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFCurrentStrip = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFCurrentStrip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3524906589838952675, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentStrip, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFCurrentStrip to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFCurrentTile = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFCurrentTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4479834341046124082, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFCurrentTile to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFIsByteSwapped = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFIsByteSwapped = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9163022208814694069, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsByteSwapped, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFIsByteSwapped to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFIsUpSampled = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFIsUpSampled = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2412206914531057111, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsUpSampled, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFIsUpSampled to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFIsMSB2LSB = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFIsMSB2LSB = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 292470046495803339, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsMSB2LSB, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFIsMSB2LSB to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [137 x i8] c"\D6\01\85\01x\DAM\8C\CD\0A\C20\10\06\E9\0B\09z\F4\18%\12\B0\16\BA\F5,\C1,\12\C8\CF\B2])}{\9BZJn\DF\CC.\F3\1A\8C\D6\1F\946;l\CA\BE\04\8FI:\C2\D4H\A4\E3!\84s\D1&y\E9\D8!\AFO\DA\07|\D8\88;\A4\BC\CE[\152\E3\B0\1C\DC?\FAe^\AA}\9Ej\BCz\C6\B7d\9Ek\09\C2\9EjQ*[P\CD\820Y\A2-k\C6'\81\8D\14vnA\9D\EE\A0~b\D6H\99", section "__llvm_prf_names"
@llvm.used = appending global [16 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFgetMode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClientOpen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_TIFFInitOrder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFileName to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFileno to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFGetMode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFIsTiled to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFCurrentRow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFCurrentDirectory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFCurrentStrip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFCurrentTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFIsByteSwapped to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFIsUpSampled to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFIsMSB2LSB to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([137 x i8], [137 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @_TIFFgetMode(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  store i32 -1, i32* %5, align 4
  %6 = load i8*, i8** %3, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  switch i32 %9, label %33 [
    i32 114, label %11
    i32 119, label %._crit_edge
    i32 97, label %21
  ]

._crit_edge:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 0)
  br label %21

; <label>:11:                                     ; preds = %2
  store i32 0, i32* %5, align 4
  %12 = load i8*, i8** %3, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 1
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 43
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 5)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 5)
  store i32 2, i32* %5, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 2)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 2)
  br label %37

; <label>:21:                                     ; preds = %._crit_edge, %2
  store i32 66, i32* %5, align 4
  %22 = load i8*, i8** %3, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 0
  %24 = load i8, i8* %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 119
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 3)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 3)
  %29 = load i32, i32* %5, align 4
  %30 = or i32 %29, 512
  store i32 %30, i32* %5, align 4
  br label %31

; <label>:31:                                     ; preds = %27, %21
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 1)
  %32 = add i64 %pgocount4, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 1)
  br label %37

; <label>:33:                                     ; preds = %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 4)
  %34 = add i64 %pgocount5, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc__TIFFgetMode, i64 0, i64 4)
  %35 = load i8*, i8** %4, align 8
  %36 = load i8*, i8** %3, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %35, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* %36)
  br label %37

; <label>:37:                                     ; preds = %33, %31, %19
  %38 = load i32, i32* %5, align 4
  ret i32 %38
}

declare void @TIFFError(i8*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define %struct.tiff* @TIFFClientOpen(i8*, i8*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*) #0 {
  %11 = alloca %struct.tiff*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i32 (i8*, i8*, i32)*, align 8
  %16 = alloca i32 (i8*, i8*, i32)*, align 8
  %17 = alloca i32 (i8*, i32, i32)*, align 8
  %18 = alloca i32 (i8*)*, align 8
  %19 = alloca i32 (i8*)*, align 8
  %20 = alloca i32 (i8*, i8**, i32*)*, align 8
  %21 = alloca void (i8*, i8*, i32)*, align 8
  %22 = alloca %struct.tiff*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i8*, align 8
  %26 = alloca %union.anon, align 4
  store i8* %0, i8** %12, align 8
  store i8* %1, i8** %13, align 8
  store i8* %2, i8** %14, align 8
  store i32 (i8*, i8*, i32)* %3, i32 (i8*, i8*, i32)** %15, align 8
  store i32 (i8*, i8*, i32)* %4, i32 (i8*, i8*, i32)** %16, align 8
  store i32 (i8*, i32, i32)* %5, i32 (i8*, i32, i32)** %17, align 8
  store i32 (i8*)* %6, i32 (i8*)** %18, align 8
  store i32 (i8*)* %7, i32 (i8*)** %19, align 8
  store i32 (i8*, i8**, i32*)* %8, i32 (i8*, i8**, i32*)** %20, align 8
  store void (i8*, i8*, i32)* %9, void (i8*, i8*, i32)** %21, align 8
  %27 = load i8*, i8** %13, align 8
  %28 = call i32 @_TIFFgetMode(i8* %27, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @TIFFClientOpen.module, i32 0, i32 0))
  store i32 %28, i32* %23, align 4
  %29 = load i32, i32* %23, align 4
  %30 = icmp eq i32 %29, -1
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 17)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 17)
  br label %474

; <label>:33:                                     ; preds = %10
  %34 = load i8*, i8** %12, align 8
  %35 = call i64 @strlen(i8* %34) #5
  %36 = add i64 880, %35
  %37 = add i64 %36, 1
  %38 = trunc i64 %37 to i32
  %39 = call i8* @_TIFFmalloc(i32 %38)
  %40 = bitcast i8* %39 to %struct.tiff*
  store %struct.tiff* %40, %struct.tiff** %22, align 8
  %41 = load %struct.tiff*, %struct.tiff** %22, align 8
  %42 = icmp eq %struct.tiff* %41, null
  br i1 %42, label %43, label %46

; <label>:43:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 18)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 18)
  %45 = load i8*, i8** %12, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @TIFFClientOpen.module, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i32 0, i32 0), i8* %45)
  br label %474

; <label>:46:                                     ; preds = %33
  %47 = load %struct.tiff*, %struct.tiff** %22, align 8
  %48 = bitcast %struct.tiff* %47 to i8*
  call void @_TIFFmemset(i8* %48, i32 0, i32 880)
  %49 = load %struct.tiff*, %struct.tiff** %22, align 8
  %50 = bitcast %struct.tiff* %49 to i8*
  %51 = getelementptr inbounds i8, i8* %50, i64 880
  %52 = load %struct.tiff*, %struct.tiff** %22, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 0
  store i8* %51, i8** %53, align 8
  %54 = load %struct.tiff*, %struct.tiff** %22, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %54, i32 0, i32 0
  %56 = load i8*, i8** %55, align 8
  %57 = load i8*, i8** %12, align 8
  %58 = call i8* @strcpy(i8* %56, i8* %57) #4
  %59 = load i32, i32* %23, align 4
  %60 = and i32 %59, -577
  %61 = load %struct.tiff*, %struct.tiff** %22, align 8
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %61, i32 0, i32 2
  store i32 %60, i32* %62, align 4
  %63 = load %struct.tiff*, %struct.tiff** %22, align 8
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %63, i32 0, i32 12
  store i16 -1, i16* %64, align 4
  %65 = load %struct.tiff*, %struct.tiff** %22, align 8
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %65, i32 0, i32 14
  store i32 0, i32* %66, align 4
  %67 = load %struct.tiff*, %struct.tiff** %22, align 8
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %67, i32 0, i32 13
  store i32 -1, i32* %68, align 8
  %69 = load %struct.tiff*, %struct.tiff** %22, align 8
  %70 = getelementptr inbounds %struct.tiff, %struct.tiff* %69, i32 0, i32 11
  store i32 -1, i32* %70, align 8
  %71 = load i8*, i8** %14, align 8
  %72 = load %struct.tiff*, %struct.tiff** %22, align 8
  %73 = getelementptr inbounds %struct.tiff, %struct.tiff* %72, i32 0, i32 48
  store i8* %71, i8** %73, align 8
  %74 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %15, align 8
  %75 = load %struct.tiff*, %struct.tiff** %22, align 8
  %76 = getelementptr inbounds %struct.tiff, %struct.tiff* %75, i32 0, i32 49
  store i32 (i8*, i8*, i32)* %74, i32 (i8*, i8*, i32)** %76, align 8
  %77 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %16, align 8
  %78 = load %struct.tiff*, %struct.tiff** %22, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 50
  store i32 (i8*, i8*, i32)* %77, i32 (i8*, i8*, i32)** %79, align 8
  %80 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %17, align 8
  %81 = load %struct.tiff*, %struct.tiff** %22, align 8
  %82 = getelementptr inbounds %struct.tiff, %struct.tiff* %81, i32 0, i32 51
  store i32 (i8*, i32, i32)* %80, i32 (i8*, i32, i32)** %82, align 8
  %83 = load i32 (i8*)*, i32 (i8*)** %18, align 8
  %84 = load %struct.tiff*, %struct.tiff** %22, align 8
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %84, i32 0, i32 52
  store i32 (i8*)* %83, i32 (i8*)** %85, align 8
  %86 = load i32 (i8*)*, i32 (i8*)** %19, align 8
  %87 = load %struct.tiff*, %struct.tiff** %22, align 8
  %88 = getelementptr inbounds %struct.tiff, %struct.tiff* %87, i32 0, i32 53
  store i32 (i8*)* %86, i32 (i8*)** %88, align 8
  %89 = load i32 (i8*, i8**, i32*)*, i32 (i8*, i8**, i32*)** %20, align 8
  %90 = load %struct.tiff*, %struct.tiff** %22, align 8
  %91 = getelementptr inbounds %struct.tiff, %struct.tiff* %90, i32 0, i32 46
  store i32 (i8*, i8**, i32*)* %89, i32 (i8*, i8**, i32*)** %91, align 8
  %92 = load void (i8*, i8*, i32)*, void (i8*, i8*, i32)** %21, align 8
  %93 = load %struct.tiff*, %struct.tiff** %22, align 8
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %93, i32 0, i32 47
  store void (i8*, i8*, i32)* %92, void (i8*, i8*, i32)** %94, align 8
  %95 = load %struct.tiff*, %struct.tiff** %22, align 8
  call void @_TIFFSetDefaultCompressionState(%struct.tiff* %95)
  %96 = load %struct.tiff*, %struct.tiff** %22, align 8
  %97 = getelementptr inbounds %struct.tiff, %struct.tiff* %96, i32 0, i32 3
  store i32 1, i32* %97, align 8
  %98 = load i32, i32* %23, align 4
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %106

; <label>:100:                                    ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 20)
  %101 = add i64 %pgocount2, 1
  store i64 %101, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 20)
  %102 = load %struct.tiff*, %struct.tiff** %22, align 8
  %103 = getelementptr inbounds %struct.tiff, %struct.tiff* %102, i32 0, i32 3
  %104 = load i32, i32* %103, align 8
  %105 = or i32 %104, 34816
  store i32 %105, i32* %103, align 8
  br label %106

; <label>:106:                                    ; preds = %100, %46
  %107 = bitcast %union.anon* %26 to i32*
  store i32 1, i32* %107, align 4
  %108 = bitcast %union.anon* %26 to [4 x i8]*
  %109 = getelementptr inbounds [4 x i8], [4 x i8]* %108, i64 0, i64 0
  %110 = load i8, i8* %109, align 4
  %111 = sext i8 %110 to i32
  %112 = icmp eq i32 %111, 0
  %113 = zext i1 %112 to i32
  store i32 %113, i32* %24, align 4
  %114 = load i8*, i8** %13, align 8
  store i8* %114, i8** %25, align 8
  br label %115

; <label>:115:                                    ; preds = %227, %106
  %116 = load i8*, i8** %25, align 8
  %117 = load i8, i8* %116, align 1
  %118 = icmp ne i8 %117, 0
  br i1 %118, label %119, label %231

; <label>:119:                                    ; preds = %115
  %120 = load i8*, i8** %25, align 8
  %121 = load i8, i8* %120, align 1
  %122 = sext i8 %121 to i32
  switch i32 %122, label %226 [
    i32 98, label %123
    i32 108, label %139
    i32 66, label %155
    i32 76, label %164
    i32 72, label %173
    i32 77, label %182
    i32 109, label %193
    i32 67, label %204
    i32 99, label %215
  ]

; <label>:123:                                    ; preds = %119
  %124 = load i32, i32* %23, align 4
  %125 = and i32 %124, 64
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %137

; <label>:127:                                    ; preds = %123
  %pgocount3 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 10)
  %128 = add i64 %pgocount3, 1
  store i64 %128, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 10)
  %129 = load i32, i32* %24, align 4
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %137, label %131

; <label>:131:                                    ; preds = %127
  %pgocount4 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 19)
  %132 = add i64 %pgocount4, 1
  store i64 %132, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 19)
  %133 = load %struct.tiff*, %struct.tiff** %22, align 8
  %134 = getelementptr inbounds %struct.tiff, %struct.tiff* %133, i32 0, i32 3
  %135 = load i32, i32* %134, align 8
  %136 = or i32 %135, 128
  store i32 %136, i32* %134, align 8
  br label %137

; <label>:137:                                    ; preds = %131, %127, %123
  %pgocount5 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 1)
  %138 = add i64 %pgocount5, 1
  store i64 %138, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 1)
  br label %226

; <label>:139:                                    ; preds = %119
  %140 = load i32, i32* %23, align 4
  %141 = and i32 %140, 64
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %143, label %153

; <label>:143:                                    ; preds = %139
  %pgocount6 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 11)
  %144 = add i64 %pgocount6, 1
  store i64 %144, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 11)
  %145 = load i32, i32* %24, align 4
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %147, label %153

; <label>:147:                                    ; preds = %143
  %pgocount7 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 16)
  %148 = add i64 %pgocount7, 1
  store i64 %148, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 16)
  %149 = load %struct.tiff*, %struct.tiff** %22, align 8
  %150 = getelementptr inbounds %struct.tiff, %struct.tiff* %149, i32 0, i32 3
  %151 = load i32, i32* %150, align 8
  %152 = or i32 %151, 128
  store i32 %152, i32* %150, align 8
  br label %153

; <label>:153:                                    ; preds = %147, %143, %139
  %pgocount8 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 2)
  %154 = add i64 %pgocount8, 1
  store i64 %154, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 2)
  br label %226

; <label>:155:                                    ; preds = %119
  %pgocount9 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 3)
  %156 = add i64 %pgocount9, 1
  store i64 %156, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 3)
  %157 = load %struct.tiff*, %struct.tiff** %22, align 8
  %158 = getelementptr inbounds %struct.tiff, %struct.tiff* %157, i32 0, i32 3
  %159 = load i32, i32* %158, align 8
  %160 = and i32 %159, -4
  %161 = or i32 %160, 1
  %162 = load %struct.tiff*, %struct.tiff** %22, align 8
  %163 = getelementptr inbounds %struct.tiff, %struct.tiff* %162, i32 0, i32 3
  store i32 %161, i32* %163, align 8
  br label %226

; <label>:164:                                    ; preds = %119
  %pgocount10 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 4)
  %165 = add i64 %pgocount10, 1
  store i64 %165, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 4)
  %166 = load %struct.tiff*, %struct.tiff** %22, align 8
  %167 = getelementptr inbounds %struct.tiff, %struct.tiff* %166, i32 0, i32 3
  %168 = load i32, i32* %167, align 8
  %169 = and i32 %168, -4
  %170 = or i32 %169, 2
  %171 = load %struct.tiff*, %struct.tiff** %22, align 8
  %172 = getelementptr inbounds %struct.tiff, %struct.tiff* %171, i32 0, i32 3
  store i32 %170, i32* %172, align 8
  br label %226

; <label>:173:                                    ; preds = %119
  %pgocount11 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 5)
  %174 = add i64 %pgocount11, 1
  store i64 %174, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 5)
  %175 = load %struct.tiff*, %struct.tiff** %22, align 8
  %176 = getelementptr inbounds %struct.tiff, %struct.tiff* %175, i32 0, i32 3
  %177 = load i32, i32* %176, align 8
  %178 = and i32 %177, -4
  %179 = or i32 %178, 1
  %180 = load %struct.tiff*, %struct.tiff** %22, align 8
  %181 = getelementptr inbounds %struct.tiff, %struct.tiff* %180, i32 0, i32 3
  store i32 %179, i32* %181, align 8
  br label %226

; <label>:182:                                    ; preds = %119
  %183 = load i32, i32* %23, align 4
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %191

; <label>:185:                                    ; preds = %182
  %pgocount12 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 12)
  %186 = add i64 %pgocount12, 1
  store i64 %186, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 12)
  %187 = load %struct.tiff*, %struct.tiff** %22, align 8
  %188 = getelementptr inbounds %struct.tiff, %struct.tiff* %187, i32 0, i32 3
  %189 = load i32, i32* %188, align 8
  %190 = or i32 %189, 2048
  store i32 %190, i32* %188, align 8
  br label %191

; <label>:191:                                    ; preds = %185, %182
  %pgocount13 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 6)
  %192 = add i64 %pgocount13, 1
  store i64 %192, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 6)
  br label %226

; <label>:193:                                    ; preds = %119
  %194 = load i32, i32* %23, align 4
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %196, label %202

; <label>:196:                                    ; preds = %193
  %pgocount14 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 13)
  %197 = add i64 %pgocount14, 1
  store i64 %197, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 13)
  %198 = load %struct.tiff*, %struct.tiff** %22, align 8
  %199 = getelementptr inbounds %struct.tiff, %struct.tiff* %198, i32 0, i32 3
  %200 = load i32, i32* %199, align 8
  %201 = and i32 %200, -2049
  store i32 %201, i32* %199, align 8
  br label %202

; <label>:202:                                    ; preds = %196, %193
  %pgocount15 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 7)
  %203 = add i64 %pgocount15, 1
  store i64 %203, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 7)
  br label %226

; <label>:204:                                    ; preds = %119
  %205 = load i32, i32* %23, align 4
  %206 = icmp eq i32 %205, 0
  br i1 %206, label %207, label %213

; <label>:207:                                    ; preds = %204
  %pgocount16 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 14)
  %208 = add i64 %pgocount16, 1
  store i64 %208, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 14)
  %209 = load %struct.tiff*, %struct.tiff** %22, align 8
  %210 = getelementptr inbounds %struct.tiff, %struct.tiff* %209, i32 0, i32 3
  %211 = load i32, i32* %210, align 8
  %212 = or i32 %211, 32768
  store i32 %212, i32* %210, align 8
  br label %213

; <label>:213:                                    ; preds = %207, %204
  %pgocount17 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 8)
  %214 = add i64 %pgocount17, 1
  store i64 %214, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 8)
  br label %226

; <label>:215:                                    ; preds = %119
  %216 = load i32, i32* %23, align 4
  %217 = icmp eq i32 %216, 0
  br i1 %217, label %218, label %224

; <label>:218:                                    ; preds = %215
  %pgocount18 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 15)
  %219 = add i64 %pgocount18, 1
  store i64 %219, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 15)
  %220 = load %struct.tiff*, %struct.tiff** %22, align 8
  %221 = getelementptr inbounds %struct.tiff, %struct.tiff* %220, i32 0, i32 3
  %222 = load i32, i32* %221, align 8
  %223 = and i32 %222, -32769
  store i32 %223, i32* %221, align 8
  br label %224

; <label>:224:                                    ; preds = %218, %215
  %pgocount19 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 9)
  %225 = add i64 %pgocount19, 1
  store i64 %225, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 9)
  br label %226

; <label>:226:                                    ; preds = %224, %213, %202, %191, %173, %164, %155, %153, %137, %119
  br label %227

; <label>:227:                                    ; preds = %226
  %pgocount20 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 0)
  %228 = add i64 %pgocount20, 1
  store i64 %228, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 0)
  %229 = load i8*, i8** %25, align 8
  %230 = getelementptr inbounds i8, i8* %229, i32 1
  store i8* %230, i8** %25, align 8
  br label %115

; <label>:231:                                    ; preds = %115
  %232 = load %struct.tiff*, %struct.tiff** %22, align 8
  %233 = getelementptr inbounds %struct.tiff, %struct.tiff* %232, i32 0, i32 49
  %234 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %233, align 8
  %235 = load %struct.tiff*, %struct.tiff** %22, align 8
  %236 = getelementptr inbounds %struct.tiff, %struct.tiff* %235, i32 0, i32 48
  %237 = load i8*, i8** %236, align 8
  %238 = load %struct.tiff*, %struct.tiff** %22, align 8
  %239 = getelementptr inbounds %struct.tiff, %struct.tiff* %238, i32 0, i32 7
  %240 = bitcast %struct.TIFFHeader* %239 to i8*
  %241 = ptrtoint i32 (i8*, i8*, i32)* %234 to i64
  call void @__llvm_profile_instrument_target(i64 %241, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClientOpen to i8*), i32 0)
  %242 = call i32 %234(i8* %237, i8* %240, i32 8)
  %243 = icmp eq i32 %242, 8
  br i1 %243, label %327, label %244

; <label>:244:                                    ; preds = %231
  %245 = load %struct.tiff*, %struct.tiff** %22, align 8
  %246 = getelementptr inbounds %struct.tiff, %struct.tiff* %245, i32 0, i32 2
  %247 = load i32, i32* %246, align 4
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %249, label %252

; <label>:249:                                    ; preds = %244
  %pgocount21 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 24)
  %250 = add i64 %pgocount21, 1
  store i64 %250, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 24)
  %251 = load i8*, i8** %12, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %251, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i32 0, i32 0))
  br label %470

; <label>:252:                                    ; preds = %244
  %253 = load %struct.tiff*, %struct.tiff** %22, align 8
  %254 = getelementptr inbounds %struct.tiff, %struct.tiff* %253, i32 0, i32 3
  %255 = load i32, i32* %254, align 8
  %256 = and i32 %255, 128
  %257 = icmp ne i32 %256, 0
  br i1 %257, label %258, label %264

; <label>:258:                                    ; preds = %252
  %259 = load i32, i32* %24, align 4
  %260 = icmp ne i32 %259, 0
  %261 = zext i1 %260 to i64
  %pgocount22 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 38)
  %262 = add i64 %pgocount22, %261
  store i64 %262, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 38)
  %263 = select i1 %260, i32 18761, i32 19789
  br label %271

; <label>:264:                                    ; preds = %252
  %pgocount23 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 25)
  %265 = add i64 %pgocount23, 1
  store i64 %265, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 25)
  %266 = load i32, i32* %24, align 4
  %267 = icmp ne i32 %266, 0
  %268 = zext i1 %267 to i64
  %pgocount24 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 39)
  %269 = add i64 %pgocount24, %268
  store i64 %269, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 39)
  %270 = select i1 %267, i32 19789, i32 18761
  br label %271

; <label>:271:                                    ; preds = %264, %258
  %272 = phi i32 [ %263, %258 ], [ %270, %264 ]
  %273 = trunc i32 %272 to i16
  %274 = load %struct.tiff*, %struct.tiff** %22, align 8
  %275 = getelementptr inbounds %struct.tiff, %struct.tiff* %274, i32 0, i32 7
  %276 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %275, i32 0, i32 0
  store i16 %273, i16* %276, align 8
  %277 = load %struct.tiff*, %struct.tiff** %22, align 8
  %278 = getelementptr inbounds %struct.tiff, %struct.tiff* %277, i32 0, i32 7
  %279 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %278, i32 0, i32 1
  store i16 42, i16* %279, align 2
  %280 = load %struct.tiff*, %struct.tiff** %22, align 8
  %281 = getelementptr inbounds %struct.tiff, %struct.tiff* %280, i32 0, i32 3
  %282 = load i32, i32* %281, align 8
  %283 = and i32 %282, 128
  %284 = icmp ne i32 %283, 0
  br i1 %284, label %285, label %290

; <label>:285:                                    ; preds = %271
  %pgocount25 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 26)
  %286 = add i64 %pgocount25, 1
  store i64 %286, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 26)
  %287 = load %struct.tiff*, %struct.tiff** %22, align 8
  %288 = getelementptr inbounds %struct.tiff, %struct.tiff* %287, i32 0, i32 7
  %289 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %288, i32 0, i32 1
  call void @TIFFSwabShort(i16* %289)
  br label %290

; <label>:290:                                    ; preds = %285, %271
  %291 = load %struct.tiff*, %struct.tiff** %22, align 8
  %292 = getelementptr inbounds %struct.tiff, %struct.tiff* %291, i32 0, i32 7
  %293 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %292, i32 0, i32 2
  store i32 0, i32* %293, align 4
  %294 = load %struct.tiff*, %struct.tiff** %22, align 8
  %295 = getelementptr inbounds %struct.tiff, %struct.tiff* %294, i32 0, i32 50
  %296 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %295, align 8
  %297 = load %struct.tiff*, %struct.tiff** %22, align 8
  %298 = getelementptr inbounds %struct.tiff, %struct.tiff* %297, i32 0, i32 48
  %299 = load i8*, i8** %298, align 8
  %300 = load %struct.tiff*, %struct.tiff** %22, align 8
  %301 = getelementptr inbounds %struct.tiff, %struct.tiff* %300, i32 0, i32 7
  %302 = bitcast %struct.TIFFHeader* %301 to i8*
  %303 = ptrtoint i32 (i8*, i8*, i32)* %296 to i64
  call void @__llvm_profile_instrument_target(i64 %303, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClientOpen to i8*), i32 1)
  %304 = call i32 %296(i8* %299, i8* %302, i32 8)
  %305 = icmp eq i32 %304, 8
  br i1 %305, label %309, label %306

; <label>:306:                                    ; preds = %290
  %pgocount26 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 27)
  %307 = add i64 %pgocount26, 1
  store i64 %307, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 27)
  %308 = load i8*, i8** %12, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %308, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i32 0, i32 0))
  br label %470

; <label>:309:                                    ; preds = %290
  %310 = load %struct.tiff*, %struct.tiff** %22, align 8
  %311 = load %struct.tiff*, %struct.tiff** %22, align 8
  %312 = getelementptr inbounds %struct.tiff, %struct.tiff* %311, i32 0, i32 7
  %313 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %312, i32 0, i32 0
  %314 = load i16, i16* %313, align 8
  %315 = zext i16 %314 to i32
  %316 = load i32, i32* %24, align 4
  call void @TIFFInitOrder(%struct.tiff* %310, i32 %315, i32 %316)
  %317 = load %struct.tiff*, %struct.tiff** %22, align 8
  %318 = call i32 @TIFFDefaultDirectory(%struct.tiff* %317)
  %319 = icmp ne i32 %318, 0
  br i1 %319, label %322, label %320

; <label>:320:                                    ; preds = %309
  %pgocount27 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 31)
  %321 = add i64 %pgocount27, 1
  store i64 %321, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 31)
  br label %470

; <label>:322:                                    ; preds = %309
  %pgocount28 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 29)
  %323 = add i64 %pgocount28, 1
  store i64 %323, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 29)
  %324 = load %struct.tiff*, %struct.tiff** %22, align 8
  %325 = getelementptr inbounds %struct.tiff, %struct.tiff* %324, i32 0, i32 4
  store i32 0, i32* %325, align 4
  %326 = load %struct.tiff*, %struct.tiff** %22, align 8
  store %struct.tiff* %326, %struct.tiff** %11, align 8
  br label %479

; <label>:327:                                    ; preds = %231
  %328 = load %struct.tiff*, %struct.tiff** %22, align 8
  %329 = getelementptr inbounds %struct.tiff, %struct.tiff* %328, i32 0, i32 7
  %330 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %329, i32 0, i32 0
  %331 = load i16, i16* %330, align 8
  %332 = zext i16 %331 to i32
  %333 = icmp ne i32 %332, 19789
  br i1 %333, label %334, label %355

; <label>:334:                                    ; preds = %327
  %pgocount29 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 21)
  %335 = add i64 %pgocount29, 1
  store i64 %335, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 21)
  %336 = load %struct.tiff*, %struct.tiff** %22, align 8
  %337 = getelementptr inbounds %struct.tiff, %struct.tiff* %336, i32 0, i32 7
  %338 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %337, i32 0, i32 0
  %339 = load i16, i16* %338, align 8
  %340 = zext i16 %339 to i32
  %341 = icmp ne i32 %340, 18761
  br i1 %341, label %342, label %355

; <label>:342:                                    ; preds = %334
  %pgocount30 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 28)
  %343 = add i64 %pgocount30, 1
  store i64 %343, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 28)
  %344 = load i8*, i8** %12, align 8
  %345 = load %struct.tiff*, %struct.tiff** %22, align 8
  %346 = getelementptr inbounds %struct.tiff, %struct.tiff* %345, i32 0, i32 7
  %347 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %346, i32 0, i32 0
  %348 = load i16, i16* %347, align 8
  %349 = zext i16 %348 to i32
  %350 = load %struct.tiff*, %struct.tiff** %22, align 8
  %351 = getelementptr inbounds %struct.tiff, %struct.tiff* %350, i32 0, i32 7
  %352 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %351, i32 0, i32 0
  %353 = load i16, i16* %352, align 8
  %354 = zext i16 %353 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* %344, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.4, i32 0, i32 0), i32 %349, i32 %354)
  br label %470

; <label>:355:                                    ; preds = %334, %327
  %356 = load %struct.tiff*, %struct.tiff** %22, align 8
  %357 = load %struct.tiff*, %struct.tiff** %22, align 8
  %358 = getelementptr inbounds %struct.tiff, %struct.tiff* %357, i32 0, i32 7
  %359 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %358, i32 0, i32 0
  %360 = load i16, i16* %359, align 8
  %361 = zext i16 %360 to i32
  %362 = load i32, i32* %24, align 4
  call void @TIFFInitOrder(%struct.tiff* %356, i32 %361, i32 %362)
  %363 = load %struct.tiff*, %struct.tiff** %22, align 8
  %364 = getelementptr inbounds %struct.tiff, %struct.tiff* %363, i32 0, i32 3
  %365 = load i32, i32* %364, align 8
  %366 = and i32 %365, 128
  %367 = icmp ne i32 %366, 0
  br i1 %367, label %368, label %376

; <label>:368:                                    ; preds = %355
  %pgocount31 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 22)
  %369 = add i64 %pgocount31, 1
  store i64 %369, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 22)
  %370 = load %struct.tiff*, %struct.tiff** %22, align 8
  %371 = getelementptr inbounds %struct.tiff, %struct.tiff* %370, i32 0, i32 7
  %372 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %371, i32 0, i32 1
  call void @TIFFSwabShort(i16* %372)
  %373 = load %struct.tiff*, %struct.tiff** %22, align 8
  %374 = getelementptr inbounds %struct.tiff, %struct.tiff* %373, i32 0, i32 7
  %375 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %374, i32 0, i32 2
  call void @TIFFSwabLong(i32* %375)
  br label %376

; <label>:376:                                    ; preds = %368, %355
  %377 = load %struct.tiff*, %struct.tiff** %22, align 8
  %378 = getelementptr inbounds %struct.tiff, %struct.tiff* %377, i32 0, i32 7
  %379 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %378, i32 0, i32 1
  %380 = load i16, i16* %379, align 2
  %381 = zext i16 %380 to i32
  %382 = icmp ne i32 %381, 42
  br i1 %382, label %383, label %396

; <label>:383:                                    ; preds = %376
  %pgocount32 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 23)
  %384 = add i64 %pgocount32, 1
  store i64 %384, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 23)
  %385 = load i8*, i8** %12, align 8
  %386 = load %struct.tiff*, %struct.tiff** %22, align 8
  %387 = getelementptr inbounds %struct.tiff, %struct.tiff* %386, i32 0, i32 7
  %388 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %387, i32 0, i32 1
  %389 = load i16, i16* %388, align 2
  %390 = zext i16 %389 to i32
  %391 = load %struct.tiff*, %struct.tiff** %22, align 8
  %392 = getelementptr inbounds %struct.tiff, %struct.tiff* %391, i32 0, i32 7
  %393 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %392, i32 0, i32 1
  %394 = load i16, i16* %393, align 2
  %395 = zext i16 %394 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* %385, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.5, i32 0, i32 0), i32 %390, i32 %395)
  br label %470

; <label>:396:                                    ; preds = %376
  %397 = load %struct.tiff*, %struct.tiff** %22, align 8
  %398 = getelementptr inbounds %struct.tiff, %struct.tiff* %397, i32 0, i32 3
  %399 = load i32, i32* %398, align 8
  %400 = or i32 %399, 512
  store i32 %400, i32* %398, align 8
  %401 = load %struct.tiff*, %struct.tiff** %22, align 8
  %402 = getelementptr inbounds %struct.tiff, %struct.tiff* %401, i32 0, i32 40
  store i8* null, i8** %402, align 8
  %403 = load %struct.tiff*, %struct.tiff** %22, align 8
  %404 = getelementptr inbounds %struct.tiff, %struct.tiff* %403, i32 0, i32 42
  store i8* null, i8** %404, align 8
  %405 = load %struct.tiff*, %struct.tiff** %22, align 8
  %406 = getelementptr inbounds %struct.tiff, %struct.tiff* %405, i32 0, i32 41
  store i32 0, i32* %406, align 8
  %407 = load i8*, i8** %13, align 8
  %408 = getelementptr inbounds i8, i8* %407, i64 0
  %409 = load i8, i8* %408, align 1
  %410 = sext i8 %409 to i32
  switch i32 %410, label %468 [
    i32 114, label %411
    i32 97, label %459
  ]

; <label>:411:                                    ; preds = %396
  %412 = load %struct.tiff*, %struct.tiff** %22, align 8
  %413 = getelementptr inbounds %struct.tiff, %struct.tiff* %412, i32 0, i32 7
  %414 = getelementptr inbounds %struct.TIFFHeader, %struct.TIFFHeader* %413, i32 0, i32 2
  %415 = load i32, i32* %414, align 4
  %416 = load %struct.tiff*, %struct.tiff** %22, align 8
  %417 = getelementptr inbounds %struct.tiff, %struct.tiff* %416, i32 0, i32 5
  store i32 %415, i32* %417, align 8
  %418 = load %struct.tiff*, %struct.tiff** %22, align 8
  %419 = getelementptr inbounds %struct.tiff, %struct.tiff* %418, i32 0, i32 3
  %420 = load i32, i32* %419, align 8
  %421 = and i32 %420, 2048
  %422 = icmp ne i32 %421, 0
  br i1 %422, label %423, label %444

; <label>:423:                                    ; preds = %411
  %pgocount33 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 34)
  %424 = add i64 %pgocount33, 1
  store i64 %424, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 34)
  %425 = load %struct.tiff*, %struct.tiff** %22, align 8
  %426 = getelementptr inbounds %struct.tiff, %struct.tiff* %425, i32 0, i32 46
  %427 = load i32 (i8*, i8**, i32*)*, i32 (i8*, i8**, i32*)** %426, align 8
  %428 = load %struct.tiff*, %struct.tiff** %22, align 8
  %429 = getelementptr inbounds %struct.tiff, %struct.tiff* %428, i32 0, i32 48
  %430 = load i8*, i8** %429, align 8
  %431 = load %struct.tiff*, %struct.tiff** %22, align 8
  %432 = getelementptr inbounds %struct.tiff, %struct.tiff* %431, i32 0, i32 44
  %433 = load %struct.tiff*, %struct.tiff** %22, align 8
  %434 = getelementptr inbounds %struct.tiff, %struct.tiff* %433, i32 0, i32 45
  %435 = ptrtoint i32 (i8*, i8**, i32*)* %427 to i64
  call void @__llvm_profile_instrument_target(i64 %435, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClientOpen to i8*), i32 2)
  %436 = call i32 %427(i8* %430, i8** %432, i32* %434)
  %437 = icmp ne i32 %436, 0
  br i1 %437, label %444, label %438

; <label>:438:                                    ; preds = %423
  %pgocount34 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 37)
  %439 = add i64 %pgocount34, 1
  store i64 %439, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 37)
  %440 = load %struct.tiff*, %struct.tiff** %22, align 8
  %441 = getelementptr inbounds %struct.tiff, %struct.tiff* %440, i32 0, i32 3
  %442 = load i32, i32* %441, align 8
  %443 = and i32 %442, -2049
  store i32 %443, i32* %441, align 8
  br label %444

; <label>:444:                                    ; preds = %438, %423, %411
  %445 = load %struct.tiff*, %struct.tiff** %22, align 8
  %446 = call i32 @TIFFReadDirectory(%struct.tiff* %445)
  %447 = icmp ne i32 %446, 0
  br i1 %447, label %448, label %457

; <label>:448:                                    ; preds = %444
  %pgocount35 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 32)
  %449 = add i64 %pgocount35, 1
  store i64 %449, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 32)
  %450 = load %struct.tiff*, %struct.tiff** %22, align 8
  %451 = getelementptr inbounds %struct.tiff, %struct.tiff* %450, i32 0, i32 43
  store i32 -1, i32* %451, align 8
  %452 = load %struct.tiff*, %struct.tiff** %22, align 8
  %453 = getelementptr inbounds %struct.tiff, %struct.tiff* %452, i32 0, i32 3
  %454 = load i32, i32* %453, align 8
  %455 = or i32 %454, 16
  store i32 %455, i32* %453, align 8
  %456 = load %struct.tiff*, %struct.tiff** %22, align 8
  store %struct.tiff* %456, %struct.tiff** %11, align 8
  br label %479

; <label>:457:                                    ; preds = %444
  %pgocount36 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 35)
  %458 = add i64 %pgocount36, 1
  store i64 %458, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 35)
  br label %468

; <label>:459:                                    ; preds = %396
  %460 = load %struct.tiff*, %struct.tiff** %22, align 8
  %461 = call i32 @TIFFDefaultDirectory(%struct.tiff* %460)
  %462 = icmp ne i32 %461, 0
  br i1 %462, label %465, label %463

; <label>:463:                                    ; preds = %459
  %pgocount37 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 36)
  %464 = add i64 %pgocount37, 1
  store i64 %464, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 36)
  br label %470

; <label>:465:                                    ; preds = %459
  %pgocount38 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 33)
  %466 = add i64 %pgocount38, 1
  store i64 %466, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 33)
  %467 = load %struct.tiff*, %struct.tiff** %22, align 8
  store %struct.tiff* %467, %struct.tiff** %11, align 8
  br label %479

; <label>:468:                                    ; preds = %457, %396
  %pgocount39 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 30)
  %469 = add i64 %pgocount39, 1
  store i64 %469, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_TIFFClientOpen, i64 0, i64 30)
  br label %470

; <label>:470:                                    ; preds = %468, %463, %383, %342, %320, %306, %249
  %471 = load %struct.tiff*, %struct.tiff** %22, align 8
  %472 = getelementptr inbounds %struct.tiff, %struct.tiff* %471, i32 0, i32 2
  store i32 0, i32* %472, align 4
  %473 = load %struct.tiff*, %struct.tiff** %22, align 8
  call void @TIFFClose(%struct.tiff* %473)
  store %struct.tiff* null, %struct.tiff** %11, align 8
  br label %479

; <label>:474:                                    ; preds = %43, %31
  %475 = load i32 (i8*)*, i32 (i8*)** %18, align 8
  %476 = load i8*, i8** %14, align 8
  %477 = ptrtoint i32 (i8*)* %475 to i64
  call void @__llvm_profile_instrument_target(i64 %477, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClientOpen to i8*), i32 3)
  %478 = call i32 %475(i8* %476)
  store %struct.tiff* null, %struct.tiff** %11, align 8
  br label %479

; <label>:479:                                    ; preds = %474, %470, %465, %448, %322
  %480 = load %struct.tiff*, %struct.tiff** %11, align 8
  ret %struct.tiff* %480
}

declare i8* @_TIFFmalloc(i32) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

declare void @_TIFFmemset(i8*, i32, i32) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #3

declare void @_TIFFSetDefaultCompressionState(%struct.tiff*) #1

declare void @TIFFSwabShort(i16*) #1

; Function Attrs: nounwind uwtable
define internal void @TIFFInitOrder(%struct.tiff*, i32, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 10
  store i64* getelementptr inbounds ([13 x i64], [13 x i64]* @typemask, i32 0, i32 0), i64** %8, align 8
  %9 = load i32, i32* %5, align 4
  %10 = icmp eq i32 %9, 19789
  br i1 %10, label %11, label %24

; <label>:11:                                     ; preds = %3
  %12 = load %struct.tiff*, %struct.tiff** %4, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 9
  store i32* getelementptr inbounds ([13 x i32], [13 x i32]* @bigTypeshift, i32 0, i32 0), i32** %13, align 8
  %14 = load i32, i32* %6, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %22, label %16

; <label>:16:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i64 0, i64 3)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i64 0, i64 3)
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 3
  %20 = load i32, i32* %19, align 8
  %21 = or i32 %20, 128
  store i32 %21, i32* %19, align 8
  br label %22

; <label>:22:                                     ; preds = %16, %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i64 0, i64 0)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i64 0, i64 0)
  br label %37

; <label>:24:                                     ; preds = %3
  %25 = load %struct.tiff*, %struct.tiff** %4, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 9
  store i32* getelementptr inbounds ([13 x i32], [13 x i32]* @litTypeshift, i32 0, i32 0), i32** %26, align 8
  %27 = load i32, i32* %6, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %35

; <label>:29:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i64 0, i64 2)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i64 0, i64 2)
  %31 = load %struct.tiff*, %struct.tiff** %4, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %31, i32 0, i32 3
  %33 = load i32, i32* %32, align 8
  %34 = or i32 %33, 128
  store i32 %34, i32* %32, align 8
  br label %35

; <label>:35:                                     ; preds = %29, %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i64 0, i64 1)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_TIFFInitOrder, i64 0, i64 1)
  br label %37

; <label>:37:                                     ; preds = %35, %22
  ret void
}

declare i32 @TIFFDefaultDirectory(%struct.tiff*) #1

declare void @TIFFSwabLong(i32*) #1

declare i32 @TIFFReadDirectory(%struct.tiff*) #1

declare void @TIFFClose(%struct.tiff*) #1

; Function Attrs: nounwind uwtable
define i8* @TIFFFileName(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFFileName, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFFileName, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 0
  %6 = load i8*, i8** %5, align 8
  ret i8* %6
}

; Function Attrs: nounwind uwtable
define i32 @TIFFFileno(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFFileno, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFFileno, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 1
  %6 = load i32, i32* %5, align 8
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @TIFFGetMode(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetMode, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetMode, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 2
  %6 = load i32, i32* %5, align 4
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @TIFFIsTiled(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsTiled, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsTiled, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 1024
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i32
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @TIFFCurrentRow(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentRow, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentRow, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 11
  %6 = load i32, i32* %5, align 8
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define zeroext i16 @TIFFCurrentDirectory(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentDirectory, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentDirectory, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 12
  %6 = load i16, i16* %5, align 4
  ret i16 %6
}

; Function Attrs: nounwind uwtable
define i32 @TIFFCurrentStrip(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentStrip, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentStrip, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 13
  %6 = load i32, i32* %5, align 8
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @TIFFCurrentTile(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentTile, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFCurrentTile, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 19
  %6 = load i32, i32* %5, align 8
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @TIFFIsByteSwapped(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsByteSwapped, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsByteSwapped, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 128
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i32
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @TIFFIsUpSampled(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsUpSampled, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsUpSampled, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 16384
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i32
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @TIFFIsMSB2LSB(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsMSB2LSB, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFIsMSB2LSB, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 1
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i32
  ret i32 %9
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
