; ModuleID = 'tif_unix.2.ll'
source_filename = "tif_unix.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@TIFFOpen.module = internal constant [9 x i8] c"TIFFOpen\00", align 1
@.str = private unnamed_addr constant [16 x i8] c"%s: Cannot open\00", align 1
@_TIFFwarningHandler = global void (i8*, i8*, %struct.__va_list_tag*)* @unixWarningHandler, align 8
@_TIFFerrorHandler = global void (i8*, i8*, %struct.__va_list_tag*)* @unixErrorHandler, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"Warning, \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c".\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFFdOpen = private constant [10 x i8] c"TIFFFdOpen"
@__profn_tmp1.ll__tiffReadProc = private constant [21 x i8] c"tmp1.ll:_tiffReadProc"
@__profn_tmp1.ll__tiffWriteProc = private constant [22 x i8] c"tmp1.ll:_tiffWriteProc"
@__profn_tmp1.ll__tiffSeekProc = private constant [21 x i8] c"tmp1.ll:_tiffSeekProc"
@__profn_tmp1.ll__tiffCloseProc = private constant [22 x i8] c"tmp1.ll:_tiffCloseProc"
@__profn_tmp1.ll__tiffSizeProc = private constant [21 x i8] c"tmp1.ll:_tiffSizeProc"
@__profn_tmp1.ll__tiffMapProc = private constant [20 x i8] c"tmp1.ll:_tiffMapProc"
@__profn_tmp1.ll__tiffUnmapProc = private constant [22 x i8] c"tmp1.ll:_tiffUnmapProc"
@__profn_TIFFOpen = private constant [8 x i8] c"TIFFOpen"
@__profn__TIFFmalloc = private constant [11 x i8] c"_TIFFmalloc"
@__profn__TIFFfree = private constant [9 x i8] c"_TIFFfree"
@__profn__TIFFrealloc = private constant [12 x i8] c"_TIFFrealloc"
@__profn__TIFFmemset = private constant [11 x i8] c"_TIFFmemset"
@__profn__TIFFmemcpy = private constant [11 x i8] c"_TIFFmemcpy"
@__profn__TIFFmemcmp = private constant [11 x i8] c"_TIFFmemcmp"
@__profn_tmp1.ll_unixWarningHandler = private constant [26 x i8] c"tmp1.ll:unixWarningHandler"
@__profn_tmp1.ll_unixErrorHandler = private constant [24 x i8] c"tmp1.ll:unixErrorHandler"
@__profc_TIFFFdOpen = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFFdOpen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7573061282665121142, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFFdOpen, i32 0, i32 0), i8* bitcast (%struct.tiff* (i32, i8*, i8*)* @TIFFFdOpen to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__tiffReadProc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__tiffReadProc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3180816562182970230, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffReadProc, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32)* @_tiffReadProc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__tiffWriteProc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__tiffWriteProc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4883794548219962070, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffWriteProc, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32)* @_tiffWriteProc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__tiffSeekProc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__tiffSeekProc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2887119065061810955, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffSeekProc, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32)* @_tiffSeekProc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__tiffCloseProc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__tiffCloseProc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1595276981984909619, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffCloseProc, i32 0, i32 0), i8* bitcast (i32 (i8*)* @_tiffCloseProc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__tiffSizeProc = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__tiffSizeProc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3000726616695943883, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll__tiffSizeProc, i32 0, i32 0), i8* bitcast (i32 (i8*)* @_tiffSizeProc to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__tiffMapProc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__tiffMapProc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4714832368109822907, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffMapProc, i32 0, i32 0), i8* bitcast (i32 (i8*, i8**, i32*)* @_tiffMapProc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll__tiffUnmapProc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll__tiffUnmapProc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8907521918414288897, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffUnmapProc, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32)* @_tiffUnmapProc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFOpen = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFOpen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1112517931865270927, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFOpen, i32 0, i32 0), i8* bitcast (%struct.tiff* (i8*, i8*)* @TIFFOpen to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFmalloc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFmalloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3279664933829868067, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmalloc, i32 0, i32 0), i8* bitcast (i8* (i32)* @_TIFFmalloc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFfree = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFfree = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1148598713419561810, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFfree, i32 0, i32 0), i8* bitcast (void (i8*)* @_TIFFfree to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFrealloc = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFrealloc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4941455882450658168, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFrealloc, i32 0, i32 0), i8* bitcast (i8* (i8*, i32)* @_TIFFrealloc to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFmemset = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFmemset = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -133898286450704921, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemset, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32)* @_TIFFmemset to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFmemcpy = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFmemcpy = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6065260925463245241, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemcpy, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32)* @_TIFFmemcpy to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFmemcmp = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFmemcmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6091054648337105976, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemcmp, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32)* @_TIFFmemcmp to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_unixWarningHandler = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_unixWarningHandler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2505375658949470996, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixWarningHandler, i32 0, i32 0), i8* bitcast (void (i8*, i8*, %struct.__va_list_tag*)* @unixWarningHandler to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_unixErrorHandler = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_unixErrorHandler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8869982409693440392, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixErrorHandler, i32 0, i32 0), i8* bitcast (void (i8*, i8*, %struct.__va_list_tag*)* @unixErrorHandler to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [142 x i8] c"\AA\02\8A\01x\DAm\CE\C1\0A\C20\0C\80a|!\C1\ABW\B1\E8A\14\DD\D8q\945\95`\92\96\AC\82\FA\F4\CE9\A6\A3\BB\FD|\09$\C5\DE\18\E3\8E\11d\918\AE\96D\EB:\A1\F7g\B0\EE\A4\A1\99j\A5\98 \E7\0B\C0-\D7\0D\85vn\19_3z\B01\C7Rx\E0\A2{\B3\7F\B2\FE\14[\A2\0E\FB\F6\0A\F0-\85?f\E0\16\D2\D8M|\FE\9A\E3x\E6.\F8\A8\AC\0A\CAug\C5\11\E8d\B4U\0D:\0C\DEq\A3i\AB", section "__llvm_prf_names"
@llvm.used = appending global [18 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFdOpen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__tiffReadProc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__tiffWriteProc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__tiffSeekProc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__tiffCloseProc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__tiffSizeProc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__tiffMapProc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll__tiffUnmapProc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFOpen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFmalloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFfree to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFrealloc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFmemset to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFmemcpy to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFmemcmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_unixWarningHandler to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_unixErrorHandler to i8*), i8* getelementptr inbounds ([142 x i8], [142 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define %struct.tiff* @TIFFFdOpen(i32, i8*, i8*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %struct.tiff*, align 8
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  store i8* %2, i8** %6, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = load i32, i32* %4, align 4
  %11 = sext i32 %10 to i64
  %12 = inttoptr i64 %11 to i8*
  %13 = call %struct.tiff* @TIFFClientOpen(i8* %8, i8* %9, i8* %12, i32 (i8*, i8*, i32)* @_tiffReadProc, i32 (i8*, i8*, i32)* @_tiffWriteProc, i32 (i8*, i32, i32)* @_tiffSeekProc, i32 (i8*)* @_tiffCloseProc, i32 (i8*)* @_tiffSizeProc, i32 (i8*, i8**, i32*)* @_tiffMapProc, void (i8*, i8*, i32)* @_tiffUnmapProc)
  store %struct.tiff* %13, %struct.tiff** %7, align 8
  %14 = load %struct.tiff*, %struct.tiff** %7, align 8
  %15 = icmp ne %struct.tiff* %14, null
  br i1 %15, label %16, label %21

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFFdOpen, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFFdOpen, i64 0, i64 1)
  %18 = load i32, i32* %4, align 4
  %19 = load %struct.tiff*, %struct.tiff** %7, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 1
  store i32 %18, i32* %20, align 8
  br label %21

; <label>:21:                                     ; preds = %16, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFFdOpen, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFFdOpen, i64 0, i64 0)
  %23 = load %struct.tiff*, %struct.tiff** %7, align 8
  ret %struct.tiff* %23
}

declare %struct.tiff* @TIFFClientOpen(i8*, i8*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*) #1

; Function Attrs: nounwind uwtable
define internal i32 @_tiffReadProc(i8*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffReadProc, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffReadProc, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = ptrtoint i8* %8 to i32
  %10 = load i8*, i8** %6, align 8
  %11 = load i32, i32* %7, align 4
  %12 = sext i32 %11 to i64
  %13 = call i64 @read(i32 %9, i8* %10, i64 %12)
  %14 = trunc i64 %13 to i32
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define internal i32 @_tiffWriteProc(i8*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffWriteProc, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffWriteProc, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = ptrtoint i8* %8 to i32
  %10 = load i8*, i8** %6, align 8
  %11 = load i32, i32* %7, align 4
  %12 = sext i32 %11 to i64
  %13 = call i64 @write(i32 %9, i8* %10, i64 %12)
  %14 = trunc i64 %13 to i32
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define internal i32 @_tiffSeekProc(i8*, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffSeekProc, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffSeekProc, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = ptrtoint i8* %8 to i32
  %10 = load i32, i32* %6, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32, i32* %7, align 4
  %13 = call i64 @lseek(i32 %9, i64 %11, i32 %12) #5
  %14 = trunc i64 %13 to i32
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define internal i32 @_tiffCloseProc(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffCloseProc, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffCloseProc, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = ptrtoint i8* %4 to i32
  %6 = call i32 @close(i32 %5)
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define internal i32 @_tiffSizeProc(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.stat, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = ptrtoint i8* %4 to i32
  %6 = call i32 @fstat(i32 %5, %struct.stat* %3) #5
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll__tiffSizeProc, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll__tiffSizeProc, i64 0, i64 1)
  br label %14

; <label>:10:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll__tiffSizeProc, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll__tiffSizeProc, i64 0, i64 0)
  %12 = getelementptr inbounds %struct.stat, %struct.stat* %3, i32 0, i32 8
  %13 = load i64, i64* %12, align 8
  br label %14

; <label>:14:                                     ; preds = %10, %8
  %15 = phi i64 [ 0, %8 ], [ %13, %10 ]
  %16 = trunc i64 %15 to i32
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define internal i32 @_tiffMapProc(i8*, i8**, i32*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffMapProc, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffMapProc, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32*, align 8
  store i8* %0, i8** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i32* %2, i32** %7, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = load i8**, i8*** %6, align 8
  %10 = load i32*, i32** %7, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @_tiffUnmapProc(i8*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffUnmapProc, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll__tiffUnmapProc, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = load i32, i32* %7, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.tiff* @TIFFOpen(i8*, i8*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %5, align 8
  %9 = call i32 @_TIFFgetMode(i8* %8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @TIFFOpen.module, i32 0, i32 0))
  store i32 %9, i32* %6, align 4
  %10 = load i32, i32* %6, align 4
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFOpen, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFOpen, i64 0, i64 1)
  store %struct.tiff* null, %struct.tiff** %3, align 8
  br label %29

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %4, align 8
  %16 = load i32, i32* %6, align 4
  %17 = call i32 (i8*, i32, ...) @open(i8* %15, i32 %16, i32 438)
  store i32 %17, i32* %7, align 4
  %18 = load i32, i32* %7, align 4
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFOpen, i64 0, i64 2)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFOpen, i64 0, i64 2)
  %22 = load i8*, i8** %4, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @TIFFOpen.module, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i8* %22)
  store %struct.tiff* null, %struct.tiff** %3, align 8
  br label %29

; <label>:23:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFOpen, i64 0, i64 0)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFOpen, i64 0, i64 0)
  %25 = load i32, i32* %7, align 4
  %26 = load i8*, i8** %4, align 8
  %27 = load i8*, i8** %5, align 8
  %28 = call %struct.tiff* @TIFFFdOpen(i32 %25, i8* %26, i8* %27)
  store %struct.tiff* %28, %struct.tiff** %3, align 8
  br label %29

; <label>:29:                                     ; preds = %23, %20, %12
  %30 = load %struct.tiff*, %struct.tiff** %3, align 8
  ret %struct.tiff* %30
}

declare i32 @_TIFFgetMode(i8*, i8*) #1

declare i32 @open(i8*, i32, ...) #1

declare void @TIFFError(i8*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i8* @_TIFFmalloc(i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmalloc, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmalloc, i64 0, i64 0)
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = sext i32 %4 to i64
  %6 = call noalias i8* @malloc(i64 %5) #5
  ret i8* %6
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @_TIFFfree(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFfree, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFfree, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  call void @free(i8* %4) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i8* @_TIFFrealloc(i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFrealloc, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFrealloc, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i8*, i8** %4, align 8
  %7 = load i32, i32* %5, align 4
  %8 = sext i32 %7 to i64
  %9 = call i8* @realloc(i8* %6, i64 %8) #5
  ret i8* %9
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #2

; Function Attrs: nounwind uwtable
define void @_TIFFmemset(i8*, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemset, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemset, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = load i32, i32* %6, align 4
  %10 = trunc i32 %9 to i8
  %11 = load i32, i32* %7, align 4
  %12 = sext i32 %11 to i64
  call void @llvm.memset.p0i8.i64(i8* %8, i8 %10, i64 %12, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define void @_TIFFmemcpy(i8*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemcpy, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemcpy, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = load i32, i32* %7, align 4
  %11 = sext i32 %10 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 %11, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define i32 @_TIFFmemcmp(i8*, i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemcmp, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc__TIFFmemcmp, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = load i8*, i8** %6, align 8
  %10 = load i32, i32* %7, align 4
  %11 = sext i32 %10 to i64
  %12 = call i32 @memcmp(i8* %8, i8* %9, i64 %11) #6
  ret i32 %12
}

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8*, i8*, i64) #4

; Function Attrs: nounwind uwtable
define internal void @unixWarningHandler(i8*, i8*, %struct.__va_list_tag*) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.__va_list_tag*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %6, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %14

; <label>:9:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixWarningHandler, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixWarningHandler, i64 0, i64 1)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = load i8*, i8** %4, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i8* %12)
  br label %14

; <label>:14:                                     ; preds = %9, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixWarningHandler, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixWarningHandler, i64 0, i64 0)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0))
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = load i8*, i8** %5, align 8
  %20 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %21 = call i32 @vfprintf(%struct._IO_FILE* %18, i8* %19, %struct.__va_list_tag* %20)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @unixErrorHandler(i8*, i8*, %struct.__va_list_tag*) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.__va_list_tag*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store %struct.__va_list_tag* %2, %struct.__va_list_tag** %6, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %14

; <label>:9:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixErrorHandler, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixErrorHandler, i64 0, i64 1)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = load i8*, i8** %4, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i8* %12)
  br label %14

; <label>:14:                                     ; preds = %9, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixErrorHandler, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_unixErrorHandler, i64 0, i64 0)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = load i8*, i8** %5, align 8
  %18 = load %struct.__va_list_tag*, %struct.__va_list_tag** %6, align 8
  %19 = call i32 @vfprintf(%struct._IO_FILE* %16, i8* %17, %struct.__va_list_tag* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  ret void
}

declare i64 @read(i32, i8*, i64) #1

declare i64 @write(i32, i8*, i64) #1

; Function Attrs: nounwind
declare i64 @lseek(i32, i64, i32) #2

declare i32 @close(i32) #1

; Function Attrs: nounwind
declare i32 @fstat(i32, %struct.stat*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @vfprintf(%struct._IO_FILE*, i8*, %struct.__va_list_tag*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
