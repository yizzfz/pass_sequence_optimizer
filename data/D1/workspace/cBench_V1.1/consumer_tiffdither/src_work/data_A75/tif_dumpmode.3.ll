; ModuleID = 'tif_dumpmode.2.ll'
source_filename = "tif_dumpmode.c"
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

@.str = private unnamed_addr constant [48 x i8] c"DumpModeDecode: Not enough data for scanline %d\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFInitDumpMode = private constant [16 x i8] c"TIFFInitDumpMode"
@__profn_tmp1.ll_DumpModeDecode = private constant [22 x i8] c"tmp1.ll:DumpModeDecode"
@__profn_tmp1.ll_DumpModeEncode = private constant [22 x i8] c"tmp1.ll:DumpModeEncode"
@__profn_tmp1.ll_DumpModeSeek = private constant [20 x i8] c"tmp1.ll:DumpModeSeek"
@__profc_TIFFInitDumpMode = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitDumpMode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2640803258612771622, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitDumpMode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitDumpMode to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_DumpModeDecode = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_DumpModeDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5479583902505501649, i64 41716471419, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_DumpModeDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_DumpModeEncode = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_DumpModeEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7925061547271693696, i64 80386983804, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_DumpModeSeek = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_DumpModeSeek = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 749110723430556716, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_DumpModeSeek, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @DumpModeSeek to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [85 x i8] c"S\00TIFFInitDumpMode\01tmp1.ll:DumpModeDecode\01tmp1.ll:DumpModeEncode\01tmp1.ll:DumpModeSeek", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitDumpMode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_DumpModeDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_DumpModeEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_DumpModeSeek to i8*), i8* getelementptr inbounds ([85 x i8], [85 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitDumpMode(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitDumpMode, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitDumpMode, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %10, align 8
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %12, align 8
  %13 = load %struct.tiff*, %struct.tiff** %4, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %14, align 8
  %15 = load %struct.tiff*, %struct.tiff** %4, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %18, align 8
  %19 = load %struct.tiff*, %struct.tiff** %4, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 33
  store i32 (%struct.tiff*, i32)* @DumpModeSeek, i32 (%struct.tiff*, i32)** %20, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @DumpModeDecode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %10 = load i16, i16* %9, align 2
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 43
  %13 = load i32, i32* %12, align 8
  %14 = load i32, i32* %8, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_DumpModeDecode, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_DumpModeDecode, i64 0, i64 0)
  %18 = load %struct.tiff*, %struct.tiff** %6, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 0
  %20 = load i8*, i8** %19, align 8
  %21 = load %struct.tiff*, %struct.tiff** %6, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 11
  %23 = load i32, i32* %22, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %20, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i32 0, i32 0), i32 %23)
  store i32 0, i32* %5, align 4
  br label %50

; <label>:24:                                     ; preds = %4
  %25 = load %struct.tiff*, %struct.tiff** %6, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 42
  %27 = load i8*, i8** %26, align 8
  %28 = load i8*, i8** %7, align 8
  %29 = icmp ne i8* %27, %28
  br i1 %29, label %30, label %37

; <label>:30:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_DumpModeDecode, i64 0, i64 2)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_DumpModeDecode, i64 0, i64 2)
  %32 = load i8*, i8** %7, align 8
  %33 = load %struct.tiff*, %struct.tiff** %6, align 8
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %33, i32 0, i32 42
  %35 = load i8*, i8** %34, align 8
  %36 = load i32, i32* %8, align 4
  call void @_TIFFmemcpy(i8* %32, i8* %35, i32 %36)
  br label %37

; <label>:37:                                     ; preds = %30, %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_DumpModeDecode, i64 0, i64 1)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_DumpModeDecode, i64 0, i64 1)
  %39 = load i32, i32* %8, align 4
  %40 = load %struct.tiff*, %struct.tiff** %6, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %40, i32 0, i32 42
  %42 = load i8*, i8** %41, align 8
  %43 = sext i32 %39 to i64
  %44 = getelementptr inbounds i8, i8* %42, i64 %43
  store i8* %44, i8** %41, align 8
  %45 = load i32, i32* %8, align 4
  %46 = load %struct.tiff*, %struct.tiff** %6, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 43
  %48 = load i32, i32* %47, align 8
  %49 = sub nsw i32 %48, %45
  store i32 %49, i32* %47, align 8
  store i32 1, i32* %5, align 4
  br label %50

; <label>:50:                                     ; preds = %37, %16
  %51 = load i32, i32* %5, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @DumpModeEncode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %11 = load i16, i16* %9, align 2
  br label %12

; <label>:12:                                     ; preds = %81, %4
  %13 = load i32, i32* %8, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %83

; <label>:15:                                     ; preds = %12
  %16 = load i32, i32* %8, align 4
  store i32 %16, i32* %10, align 4
  %17 = load %struct.tiff*, %struct.tiff** %6, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 43
  %19 = load i32, i32* %18, align 8
  %20 = load i32, i32* %10, align 4
  %21 = add nsw i32 %19, %20
  %22 = load %struct.tiff*, %struct.tiff** %6, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 41
  %24 = load i32, i32* %23, align 8
  %25 = icmp sgt i32 %21, %24
  br i1 %25, label %26, label %35

; <label>:26:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 2)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 2)
  %28 = load %struct.tiff*, %struct.tiff** %6, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 41
  %30 = load i32, i32* %29, align 8
  %31 = load %struct.tiff*, %struct.tiff** %6, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %31, i32 0, i32 43
  %33 = load i32, i32* %32, align 8
  %34 = sub nsw i32 %30, %33
  store i32 %34, i32* %10, align 4
  br label %35

; <label>:35:                                     ; preds = %26, %15
  %36 = load %struct.tiff*, %struct.tiff** %6, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %36, i32 0, i32 42
  %38 = load i8*, i8** %37, align 8
  %39 = load i8*, i8** %7, align 8
  %40 = icmp ne i8* %38, %39
  br i1 %40, label %41, label %48

; <label>:41:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 1)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 1)
  %43 = load %struct.tiff*, %struct.tiff** %6, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %43, i32 0, i32 42
  %45 = load i8*, i8** %44, align 8
  %46 = load i8*, i8** %7, align 8
  %47 = load i32, i32* %10, align 4
  call void @_TIFFmemcpy(i8* %45, i8* %46, i32 %47)
  br label %48

; <label>:48:                                     ; preds = %41, %35
  %49 = load i32, i32* %10, align 4
  %50 = load %struct.tiff*, %struct.tiff** %6, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %50, i32 0, i32 42
  %52 = load i8*, i8** %51, align 8
  %53 = sext i32 %49 to i64
  %54 = getelementptr inbounds i8, i8* %52, i64 %53
  store i8* %54, i8** %51, align 8
  %55 = load i32, i32* %10, align 4
  %56 = load %struct.tiff*, %struct.tiff** %6, align 8
  %57 = getelementptr inbounds %struct.tiff, %struct.tiff* %56, i32 0, i32 43
  %58 = load i32, i32* %57, align 8
  %59 = add nsw i32 %58, %55
  store i32 %59, i32* %57, align 8
  %60 = load i32, i32* %10, align 4
  %61 = load i8*, i8** %7, align 8
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds i8, i8* %61, i64 %62
  store i8* %63, i8** %7, align 8
  %64 = load i32, i32* %10, align 4
  %65 = load i32, i32* %8, align 4
  %66 = sub nsw i32 %65, %64
  store i32 %66, i32* %8, align 4
  %67 = load %struct.tiff*, %struct.tiff** %6, align 8
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %67, i32 0, i32 43
  %69 = load i32, i32* %68, align 8
  %70 = load %struct.tiff*, %struct.tiff** %6, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %70, i32 0, i32 41
  %72 = load i32, i32* %71, align 8
  %73 = icmp sge i32 %69, %72
  br i1 %73, label %74, label %81

; <label>:74:                                     ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 3)
  %75 = add i64 %pgocount2, 1
  store i64 %75, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 3)
  %76 = load %struct.tiff*, %struct.tiff** %6, align 8
  %77 = call i32 @TIFFFlushData1(%struct.tiff* %76)
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %81, label %79

; <label>:79:                                     ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 5)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 5)
  store i32 -1, i32* %5, align 4
  br label %85

; <label>:81:                                     ; preds = %74, %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 0)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 0)
  br label %12

; <label>:83:                                     ; preds = %12
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 4)
  %84 = add i64 %pgocount5, 1
  store i64 %84, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_DumpModeEncode, i64 0, i64 4)
  store i32 1, i32* %5, align 4
  br label %85

; <label>:85:                                     ; preds = %83, %79
  %86 = load i32, i32* %5, align 4
  ret i32 %86
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @DumpModeSeek(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_DumpModeSeek, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_DumpModeSeek, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 38
  %9 = load i32, i32* %8, align 8
  %10 = mul i32 %6, %9
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 42
  %13 = load i8*, i8** %12, align 8
  %14 = zext i32 %10 to i64
  %15 = getelementptr inbounds i8, i8* %13, i64 %14
  store i8* %15, i8** %12, align 8
  %16 = load i32, i32* %5, align 4
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 38
  %19 = load i32, i32* %18, align 8
  %20 = mul i32 %16, %19
  %21 = load %struct.tiff*, %struct.tiff** %4, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %21, i32 0, i32 43
  %23 = load i32, i32* %22, align 8
  %24 = sub i32 %23, %20
  store i32 %24, i32* %22, align 8
  ret i32 1
}

declare void @TIFFError(i8*, i8*, ...) #1

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

declare i32 @TIFFFlushData1(%struct.tiff*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
