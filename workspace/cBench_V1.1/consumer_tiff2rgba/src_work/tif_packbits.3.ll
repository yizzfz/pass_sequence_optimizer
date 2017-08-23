; ModuleID = 'tif_packbits.2.ll'
source_filename = "tif_packbits.c"
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

@.str = private unnamed_addr constant [49 x i8] c"PackBitsDecode: Not enough data for scanline %ld\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"rowsize > 0\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"tif_packbits.c\00", align 1
@__PRETTY_FUNCTION__.PackBitsEncodeChunk = private unnamed_addr constant [62 x i8] c"int PackBitsEncodeChunk(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFInitPackBits = private constant [16 x i8] c"TIFFInitPackBits"
@__profn_tmp1.ll_PackBitsDecode = private constant [22 x i8] c"tmp1.ll:PackBitsDecode"
@__profn_tmp1.ll_PackBitsPreEncode = private constant [25 x i8] c"tmp1.ll:PackBitsPreEncode"
@__profn_tmp1.ll_PackBitsEncode = private constant [22 x i8] c"tmp1.ll:PackBitsEncode"
@__profn_tmp1.ll_PackBitsEncodeChunk = private constant [27 x i8] c"tmp1.ll:PackBitsEncodeChunk"
@__profc_TIFFInitPackBits = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFInitPackBits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8787174046486258199, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitPackBits, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFInitPackBits to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PackBitsDecode = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_PackBitsDecode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4118577527366425933, i64 119330136228, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PackBitsPreEncode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_PackBitsPreEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5797323998251233855, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_PackBitsPreEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i16)* @PackBitsPreEncode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PackBitsEncode = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_PackBitsEncode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5578137308659479263, i64 72057923418455989, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncode to i8*), i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_PackBitsEncodeChunk = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_PackBitsEncodeChunk = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8716864892206746046, i64 64743629758, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncodeChunk to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"t9x\DA\0B\F1ts\F3\CC\CB,\09HL\CEv\CA,)f,\C9-0\D4\CB\C9\B1\82\09\B8\A4&\E7\A7\A4b\08\07\14\A5\BA\E6a\95\C1+\EC\9CQ\9A\97\0D\00V@)m", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFInitPackBits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PackBitsDecode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PackBitsPreEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PackBitsEncode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_PackBitsEncodeChunk to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFInitPackBits(%struct.tiff*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitPackBits, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFInitPackBits, i64 0, i64 0)
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %7, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %10, align 8
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %12, align 8
  %13 = load %struct.tiff*, %struct.tiff** %4, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 24
  store i32 (%struct.tiff*, i16)* @PackBitsPreEncode, i32 (%struct.tiff*, i16)** %14, align 8
  %15 = load %struct.tiff*, %struct.tiff** %4, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncode, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %17 = load %struct.tiff*, %struct.tiff** %4, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncodeChunk, i32 (%struct.tiff*, i8*, i32, i16)** %18, align 8
  %19 = load %struct.tiff*, %struct.tiff** %4, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncodeChunk, i32 (%struct.tiff*, i8*, i32, i16)** %20, align 8
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @PackBitsDecode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %14 = load i16, i16* %9, align 2
  %15 = load %struct.tiff*, %struct.tiff** %6, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 42
  %17 = load i8*, i8** %16, align 8
  store i8* %17, i8** %10, align 8
  %18 = load %struct.tiff*, %struct.tiff** %6, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 43
  %20 = load i32, i32* %19, align 8
  store i32 %20, i32* %11, align 4
  br label %21

; <label>:21:                                     ; preds = %102, %50, %4
  %22 = load i32, i32* %11, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 1)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 1)
  %26 = load i32, i32* %8, align 4
  %27 = sext i32 %26 to i64
  %28 = icmp sgt i64 %27, 0
  br label %29

; <label>:29:                                     ; preds = %24, %21
  %30 = phi i1 [ false, %21 ], [ %28, %24 ]
  br i1 %30, label %31, label %103

; <label>:31:                                     ; preds = %29
  %32 = load i8*, i8** %10, align 8
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %10, align 8
  %34 = load i8, i8* %32, align 1
  %35 = sext i8 %34 to i64
  store i64 %35, i64* %12, align 8
  %36 = load i32, i32* %11, align 4
  %37 = add nsw i32 %36, -1
  store i32 %37, i32* %11, align 4
  %38 = load i64, i64* %12, align 8
  %39 = icmp sge i64 %38, 128
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 3)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 3)
  %42 = load i64, i64* %12, align 8
  %43 = sub nsw i64 %42, 256
  store i64 %43, i64* %12, align 8
  br label %44

; <label>:44:                                     ; preds = %40, %31
  %45 = load i64, i64* %12, align 8
  %46 = icmp slt i64 %45, 0
  br i1 %46, label %47, label %79

; <label>:47:                                     ; preds = %44
  %48 = load i64, i64* %12, align 8
  %49 = icmp eq i64 %48, -128
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 4)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 4)
  br label %21

; <label>:52:                                     ; preds = %47
  %53 = load i64, i64* %12, align 8
  %54 = sub nsw i64 0, %53
  %55 = add nsw i64 %54, 1
  store i64 %55, i64* %12, align 8
  %56 = load i64, i64* %12, align 8
  %57 = load i32, i32* %8, align 4
  %58 = sext i32 %57 to i64
  %59 = sub nsw i64 %58, %56
  %60 = trunc i64 %59 to i32
  store i32 %60, i32* %8, align 4
  %61 = load i8*, i8** %10, align 8
  %62 = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %62, i8** %10, align 8
  %63 = load i8, i8* %61, align 1
  %64 = sext i8 %63 to i32
  store i32 %64, i32* %13, align 4
  %65 = load i32, i32* %11, align 4
  %66 = add nsw i32 %65, -1
  store i32 %66, i32* %11, align 4
  br label %67

; <label>:67:                                     ; preds = %71, %52
  %68 = load i64, i64* %12, align 8
  %69 = add nsw i64 %68, -1
  store i64 %69, i64* %12, align 8
  %70 = icmp sgt i64 %68, 0
  br i1 %70, label %71, label %77

; <label>:71:                                     ; preds = %67
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 0)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 0)
  %73 = load i32, i32* %13, align 4
  %74 = trunc i32 %73 to i8
  %75 = load i8*, i8** %7, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %7, align 8
  store i8 %74, i8* %75, align 1
  br label %67

; <label>:77:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 5)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 5)
  br label %102

; <label>:79:                                     ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 2)
  %80 = add i64 %pgocount5, 1
  store i64 %80, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 2)
  %81 = load i8*, i8** %7, align 8
  %82 = load i8*, i8** %10, align 8
  %83 = load i64, i64* %12, align 8
  %84 = add nsw i64 %83, 1
  store i64 %84, i64* %12, align 8
  %85 = trunc i64 %84 to i32
  call void @_TIFFmemcpy(i8* %81, i8* %82, i32 %85)
  %86 = load i64, i64* %12, align 8
  %87 = load i8*, i8** %7, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 %86
  store i8* %88, i8** %7, align 8
  %89 = load i64, i64* %12, align 8
  %90 = load i32, i32* %8, align 4
  %91 = sext i32 %90 to i64
  %92 = sub nsw i64 %91, %89
  %93 = trunc i64 %92 to i32
  store i32 %93, i32* %8, align 4
  %94 = load i64, i64* %12, align 8
  %95 = load i8*, i8** %10, align 8
  %96 = getelementptr inbounds i8, i8* %95, i64 %94
  store i8* %96, i8** %10, align 8
  %97 = load i64, i64* %12, align 8
  %98 = load i32, i32* %11, align 4
  %99 = sext i32 %98 to i64
  %100 = sub nsw i64 %99, %97
  %101 = trunc i64 %100 to i32
  store i32 %101, i32* %11, align 4
  br label %102

; <label>:102:                                    ; preds = %79, %77
  br label %21

; <label>:103:                                    ; preds = %29
  %104 = load i8*, i8** %10, align 8
  %105 = load %struct.tiff*, %struct.tiff** %6, align 8
  %106 = getelementptr inbounds %struct.tiff, %struct.tiff* %105, i32 0, i32 42
  store i8* %104, i8** %106, align 8
  %107 = load i32, i32* %11, align 4
  %108 = load %struct.tiff*, %struct.tiff** %6, align 8
  %109 = getelementptr inbounds %struct.tiff, %struct.tiff* %108, i32 0, i32 43
  store i32 %107, i32* %109, align 8
  %110 = load i32, i32* %8, align 4
  %111 = icmp sgt i32 %110, 0
  br i1 %111, label %112, label %121

; <label>:112:                                    ; preds = %103
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 6)
  %113 = add i64 %pgocount6, 1
  store i64 %113, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 6)
  %114 = load %struct.tiff*, %struct.tiff** %6, align 8
  %115 = getelementptr inbounds %struct.tiff, %struct.tiff* %114, i32 0, i32 0
  %116 = load i8*, i8** %115, align 8
  %117 = load %struct.tiff*, %struct.tiff** %6, align 8
  %118 = getelementptr inbounds %struct.tiff, %struct.tiff* %117, i32 0, i32 11
  %119 = load i32, i32* %118, align 8
  %120 = zext i32 %119 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %116, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i32 0, i32 0), i64 %120)
  store i32 0, i32* %5, align 4
  br label %123

; <label>:121:                                    ; preds = %103
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 7)
  %122 = add i64 %pgocount7, 1
  store i64 %122, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_PackBitsDecode, i64 0, i64 7)
  store i32 1, i32* %5, align 4
  br label %123

; <label>:123:                                    ; preds = %121, %112
  %124 = load i32, i32* %5, align 4
  ret i32 %124
}

; Function Attrs: nounwind uwtable
define internal i32 @PackBitsPreEncode(%struct.tiff*, i16 zeroext) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i16 %1, i16* %4, align 2
  %5 = load i16, i16* %4, align 2
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 3
  %8 = load i32, i32* %7, align 8
  %9 = and i32 %8, 1024
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %19

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_PackBitsPreEncode, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_PackBitsPreEncode, i64 0, i64 0)
  %13 = load %struct.tiff*, %struct.tiff** %3, align 8
  %14 = call i32 @TIFFTileRowSize(%struct.tiff* %13)
  %15 = sext i32 %14 to i64
  %16 = inttoptr i64 %15 to i8*
  %17 = load %struct.tiff*, %struct.tiff** %3, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 37
  store i8* %16, i8** %18, align 8
  br label %27

; <label>:19:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_PackBitsPreEncode, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_PackBitsPreEncode, i64 0, i64 1)
  %21 = load %struct.tiff*, %struct.tiff** %3, align 8
  %22 = call i32 @TIFFScanlineSize(%struct.tiff* %21)
  %23 = sext i32 %22 to i64
  %24 = inttoptr i64 %23 to i8*
  %25 = load %struct.tiff*, %struct.tiff** %3, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 37
  store i8* %24, i8** %26, align 8
  br label %27

; <label>:27:                                     ; preds = %19, %11
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @PackBitsEncode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %18 = load i8*, i8** %7, align 8
  store i8* %18, i8** %10, align 8
  %19 = load i16, i16* %9, align 2
  %20 = load %struct.tiff*, %struct.tiff** %6, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 42
  %22 = load i8*, i8** %21, align 8
  store i8* %22, i8** %11, align 8
  %23 = load %struct.tiff*, %struct.tiff** %6, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 40
  %25 = load i8*, i8** %24, align 8
  %26 = load %struct.tiff*, %struct.tiff** %6, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %26, i32 0, i32 41
  %28 = load i32, i32* %27, align 8
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %25, i64 %29
  store i8* %30, i8** %12, align 8
  store i32 0, i32* %17, align 4
  store i8* null, i8** %13, align 8
  br label %31

; <label>:31:                                     ; preds = %301, %4
  %32 = load i32, i32* %8, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %303

; <label>:34:                                     ; preds = %31
  %35 = load i8*, i8** %10, align 8
  %36 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %36, i8** %10, align 8
  %37 = load i8, i8* %35, align 1
  %38 = zext i8 %37 to i32
  store i32 %38, i32* %16, align 4
  %39 = load i32, i32* %8, align 4
  %40 = add nsw i32 %39, -1
  store i32 %40, i32* %8, align 4
  store i64 1, i64* %14, align 8
  br label %41

; <label>:41:                                     ; preds = %56, %34
  %42 = load i32, i32* %8, align 4
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %44, label %51

; <label>:44:                                     ; preds = %41
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 2)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 2)
  %46 = load i32, i32* %16, align 4
  %47 = load i8*, i8** %10, align 8
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp eq i32 %46, %49
  br label %51

; <label>:51:                                     ; preds = %44, %41
  %52 = phi i1 [ false, %41 ], [ %50, %44 ]
  br i1 %52, label %53, label %62

; <label>:53:                                     ; preds = %51
  %54 = load i64, i64* %14, align 8
  %55 = add nsw i64 %54, 1
  store i64 %55, i64* %14, align 8
  br label %56

; <label>:56:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 1)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 1)
  %58 = load i32, i32* %8, align 4
  %59 = add nsw i32 %58, -1
  store i32 %59, i32* %8, align 4
  %60 = load i8*, i8** %10, align 8
  %61 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %61, i8** %10, align 8
  br label %41

; <label>:62:                                     ; preds = %51
  br label %63

; <label>:63:                                     ; preds = %300, %233, %190, %152, %62
  %64 = load i8*, i8** %11, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 2
  %66 = load i8*, i8** %12, align 8
  %67 = icmp uge i8* %65, %66
  br i1 %67, label %68, label %144

; <label>:68:                                     ; preds = %63
  %69 = load i32, i32* %17, align 4
  %70 = icmp eq i32 %69, 1
  br i1 %70, label %75, label %71

; <label>:71:                                     ; preds = %68
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 4)
  %72 = add i64 %pgocount2, 1
  store i64 %72, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 4)
  %73 = load i32, i32* %17, align 4
  %74 = icmp eq i32 %73, 3
  br i1 %74, label %75, label %119

; <label>:75:                                     ; preds = %71, %68
  %76 = load i8*, i8** %11, align 8
  %77 = load i8*, i8** %13, align 8
  %78 = ptrtoint i8* %76 to i64
  %79 = ptrtoint i8* %77 to i64
  %80 = sub i64 %78, %79
  store i64 %80, i64* %15, align 8
  %81 = load i8*, i8** %13, align 8
  %82 = load %struct.tiff*, %struct.tiff** %6, align 8
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %82, i32 0, i32 42
  %84 = load i8*, i8** %83, align 8
  %85 = ptrtoint i8* %81 to i64
  %86 = ptrtoint i8* %84 to i64
  %87 = sub i64 %85, %86
  %88 = load %struct.tiff*, %struct.tiff** %6, align 8
  %89 = getelementptr inbounds %struct.tiff, %struct.tiff* %88, i32 0, i32 43
  %90 = load i32, i32* %89, align 8
  %91 = sext i32 %90 to i64
  %92 = add nsw i64 %91, %87
  %93 = trunc i64 %92 to i32
  store i32 %93, i32* %89, align 8
  %94 = load %struct.tiff*, %struct.tiff** %6, align 8
  %95 = call i32 @TIFFFlushData1(%struct.tiff* %94)
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %99, label %97

; <label>:97:                                     ; preds = %75
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 14)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 14)
  store i32 -1, i32* %5, align 4
  br label %321

; <label>:99:                                     ; preds = %75
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 3)
  %100 = add i64 %pgocount4, 1
  store i64 %100, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 3)
  %101 = load %struct.tiff*, %struct.tiff** %6, align 8
  %102 = getelementptr inbounds %struct.tiff, %struct.tiff* %101, i32 0, i32 42
  %103 = load i8*, i8** %102, align 8
  store i8* %103, i8** %11, align 8
  br label %104

; <label>:104:                                    ; preds = %108, %99
  %105 = load i64, i64* %15, align 8
  %106 = add nsw i64 %105, -1
  store i64 %106, i64* %15, align 8
  %107 = icmp sgt i64 %105, 0
  br i1 %107, label %108, label %115

; <label>:108:                                    ; preds = %104
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 0)
  %109 = add i64 %pgocount5, 1
  store i64 %109, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 0)
  %110 = load i8*, i8** %13, align 8
  %111 = getelementptr inbounds i8, i8* %110, i32 1
  store i8* %111, i8** %13, align 8
  %112 = load i8, i8* %110, align 1
  %113 = load i8*, i8** %11, align 8
  %114 = getelementptr inbounds i8, i8* %113, i32 1
  store i8* %114, i8** %11, align 8
  store i8 %112, i8* %113, align 1
  br label %104

; <label>:115:                                    ; preds = %104
  %116 = load %struct.tiff*, %struct.tiff** %6, align 8
  %117 = getelementptr inbounds %struct.tiff, %struct.tiff* %116, i32 0, i32 42
  %118 = load i8*, i8** %117, align 8
  store i8* %118, i8** %13, align 8
  br label %143

; <label>:119:                                    ; preds = %71
  %120 = load i8*, i8** %11, align 8
  %121 = load %struct.tiff*, %struct.tiff** %6, align 8
  %122 = getelementptr inbounds %struct.tiff, %struct.tiff* %121, i32 0, i32 42
  %123 = load i8*, i8** %122, align 8
  %124 = ptrtoint i8* %120 to i64
  %125 = ptrtoint i8* %123 to i64
  %126 = sub i64 %124, %125
  %127 = load %struct.tiff*, %struct.tiff** %6, align 8
  %128 = getelementptr inbounds %struct.tiff, %struct.tiff* %127, i32 0, i32 43
  %129 = load i32, i32* %128, align 8
  %130 = sext i32 %129 to i64
  %131 = add nsw i64 %130, %126
  %132 = trunc i64 %131 to i32
  store i32 %132, i32* %128, align 8
  %133 = load %struct.tiff*, %struct.tiff** %6, align 8
  %134 = call i32 @TIFFFlushData1(%struct.tiff* %133)
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %138, label %136

; <label>:136:                                    ; preds = %119
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 21)
  %137 = add i64 %pgocount6, 1
  store i64 %137, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 21)
  store i32 -1, i32* %5, align 4
  br label %321

; <label>:138:                                    ; preds = %119
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 9)
  %139 = add i64 %pgocount7, 1
  store i64 %139, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 9)
  %140 = load %struct.tiff*, %struct.tiff** %6, align 8
  %141 = getelementptr inbounds %struct.tiff, %struct.tiff* %140, i32 0, i32 42
  %142 = load i8*, i8** %141, align 8
  store i8* %142, i8** %11, align 8
  br label %143

; <label>:143:                                    ; preds = %138, %115
  br label %144

; <label>:144:                                    ; preds = %143, %63
  %145 = load i32, i32* %17, align 4
  switch i32 %145, label %301 [
    i32 0, label %146
    i32 1, label %184
    i32 2, label %227
    i32 3, label %265
  ]

; <label>:146:                                    ; preds = %144
  %147 = load i64, i64* %14, align 8
  %148 = icmp sgt i64 %147, 1
  br i1 %148, label %149, label %174

; <label>:149:                                    ; preds = %146
  store i32 2, i32* %17, align 4
  %150 = load i64, i64* %14, align 8
  %151 = icmp sgt i64 %150, 128
  br i1 %151, label %152, label %162

; <label>:152:                                    ; preds = %149
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 5)
  %153 = add i64 %pgocount8, 1
  store i64 %153, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 5)
  %154 = load i8*, i8** %11, align 8
  %155 = getelementptr inbounds i8, i8* %154, i32 1
  store i8* %155, i8** %11, align 8
  store i8 -127, i8* %154, align 1
  %156 = load i32, i32* %16, align 4
  %157 = trunc i32 %156 to i8
  %158 = load i8*, i8** %11, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %11, align 8
  store i8 %157, i8* %158, align 1
  %160 = load i64, i64* %14, align 8
  %161 = sub nsw i64 %160, 128
  store i64 %161, i64* %14, align 8
  br label %63

; <label>:162:                                    ; preds = %149
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 18)
  %163 = add i64 %pgocount9, 1
  store i64 %163, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 18)
  %164 = load i64, i64* %14, align 8
  %165 = sub nsw i64 %164, 1
  %166 = sub nsw i64 0, %165
  %167 = trunc i64 %166 to i8
  %168 = load i8*, i8** %11, align 8
  %169 = getelementptr inbounds i8, i8* %168, i32 1
  store i8* %169, i8** %11, align 8
  store i8 %167, i8* %168, align 1
  %170 = load i32, i32* %16, align 4
  %171 = trunc i32 %170 to i8
  %172 = load i8*, i8** %11, align 8
  %173 = getelementptr inbounds i8, i8* %172, i32 1
  store i8* %173, i8** %11, align 8
  store i8 %171, i8* %172, align 1
  br label %183

; <label>:174:                                    ; preds = %146
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 15)
  %175 = add i64 %pgocount10, 1
  store i64 %175, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 15)
  %176 = load i8*, i8** %11, align 8
  store i8* %176, i8** %13, align 8
  %177 = load i8*, i8** %11, align 8
  %178 = getelementptr inbounds i8, i8* %177, i32 1
  store i8* %178, i8** %11, align 8
  store i8 0, i8* %177, align 1
  %179 = load i32, i32* %16, align 4
  %180 = trunc i32 %179 to i8
  %181 = load i8*, i8** %11, align 8
  %182 = getelementptr inbounds i8, i8* %181, i32 1
  store i8* %182, i8** %11, align 8
  store i8 %180, i8* %181, align 1
  store i32 1, i32* %17, align 4
  br label %183

; <label>:183:                                    ; preds = %174, %162
  br label %301

; <label>:184:                                    ; preds = %144
  %185 = load i64, i64* %14, align 8
  %186 = icmp sgt i64 %185, 1
  br i1 %186, label %187, label %212

; <label>:187:                                    ; preds = %184
  store i32 3, i32* %17, align 4
  %188 = load i64, i64* %14, align 8
  %189 = icmp sgt i64 %188, 128
  br i1 %189, label %190, label %200

; <label>:190:                                    ; preds = %187
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 6)
  %191 = add i64 %pgocount11, 1
  store i64 %191, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 6)
  %192 = load i8*, i8** %11, align 8
  %193 = getelementptr inbounds i8, i8* %192, i32 1
  store i8* %193, i8** %11, align 8
  store i8 -127, i8* %192, align 1
  %194 = load i32, i32* %16, align 4
  %195 = trunc i32 %194 to i8
  %196 = load i8*, i8** %11, align 8
  %197 = getelementptr inbounds i8, i8* %196, i32 1
  store i8* %197, i8** %11, align 8
  store i8 %195, i8* %196, align 1
  %198 = load i64, i64* %14, align 8
  %199 = sub nsw i64 %198, 128
  store i64 %199, i64* %14, align 8
  br label %63

; <label>:200:                                    ; preds = %187
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 19)
  %201 = add i64 %pgocount12, 1
  store i64 %201, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 19)
  %202 = load i64, i64* %14, align 8
  %203 = sub nsw i64 %202, 1
  %204 = sub nsw i64 0, %203
  %205 = trunc i64 %204 to i8
  %206 = load i8*, i8** %11, align 8
  %207 = getelementptr inbounds i8, i8* %206, i32 1
  store i8* %207, i8** %11, align 8
  store i8 %205, i8* %206, align 1
  %208 = load i32, i32* %16, align 4
  %209 = trunc i32 %208 to i8
  %210 = load i8*, i8** %11, align 8
  %211 = getelementptr inbounds i8, i8* %210, i32 1
  store i8* %211, i8** %11, align 8
  store i8 %209, i8* %210, align 1
  br label %226

; <label>:212:                                    ; preds = %184
  %213 = load i8*, i8** %13, align 8
  %214 = load i8, i8* %213, align 1
  %215 = add i8 %214, 1
  store i8 %215, i8* %213, align 1
  %216 = zext i8 %215 to i32
  %217 = icmp eq i32 %216, 127
  br i1 %217, label %218, label %220

; <label>:218:                                    ; preds = %212
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 22)
  %219 = add i64 %pgocount13, 1
  store i64 %219, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 22)
  store i32 0, i32* %17, align 4
  br label %220

; <label>:220:                                    ; preds = %218, %212
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 16)
  %221 = add i64 %pgocount14, 1
  store i64 %221, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 16)
  %222 = load i32, i32* %16, align 4
  %223 = trunc i32 %222 to i8
  %224 = load i8*, i8** %11, align 8
  %225 = getelementptr inbounds i8, i8* %224, i32 1
  store i8* %225, i8** %11, align 8
  store i8 %223, i8* %224, align 1
  br label %226

; <label>:226:                                    ; preds = %220, %200
  br label %301

; <label>:227:                                    ; preds = %144
  %228 = load i64, i64* %14, align 8
  %229 = icmp sgt i64 %228, 1
  br i1 %229, label %230, label %255

; <label>:230:                                    ; preds = %227
  %231 = load i64, i64* %14, align 8
  %232 = icmp sgt i64 %231, 128
  br i1 %232, label %233, label %243

; <label>:233:                                    ; preds = %230
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 7)
  %234 = add i64 %pgocount15, 1
  store i64 %234, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 7)
  %235 = load i8*, i8** %11, align 8
  %236 = getelementptr inbounds i8, i8* %235, i32 1
  store i8* %236, i8** %11, align 8
  store i8 -127, i8* %235, align 1
  %237 = load i32, i32* %16, align 4
  %238 = trunc i32 %237 to i8
  %239 = load i8*, i8** %11, align 8
  %240 = getelementptr inbounds i8, i8* %239, i32 1
  store i8* %240, i8** %11, align 8
  store i8 %238, i8* %239, align 1
  %241 = load i64, i64* %14, align 8
  %242 = sub nsw i64 %241, 128
  store i64 %242, i64* %14, align 8
  br label %63

; <label>:243:                                    ; preds = %230
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 20)
  %244 = add i64 %pgocount16, 1
  store i64 %244, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 20)
  %245 = load i64, i64* %14, align 8
  %246 = sub nsw i64 %245, 1
  %247 = sub nsw i64 0, %246
  %248 = trunc i64 %247 to i8
  %249 = load i8*, i8** %11, align 8
  %250 = getelementptr inbounds i8, i8* %249, i32 1
  store i8* %250, i8** %11, align 8
  store i8 %248, i8* %249, align 1
  %251 = load i32, i32* %16, align 4
  %252 = trunc i32 %251 to i8
  %253 = load i8*, i8** %11, align 8
  %254 = getelementptr inbounds i8, i8* %253, i32 1
  store i8* %254, i8** %11, align 8
  store i8 %252, i8* %253, align 1
  br label %264

; <label>:255:                                    ; preds = %227
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 17)
  %256 = add i64 %pgocount17, 1
  store i64 %256, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 17)
  %257 = load i8*, i8** %11, align 8
  store i8* %257, i8** %13, align 8
  %258 = load i8*, i8** %11, align 8
  %259 = getelementptr inbounds i8, i8* %258, i32 1
  store i8* %259, i8** %11, align 8
  store i8 0, i8* %258, align 1
  %260 = load i32, i32* %16, align 4
  %261 = trunc i32 %260 to i8
  %262 = load i8*, i8** %11, align 8
  %263 = getelementptr inbounds i8, i8* %262, i32 1
  store i8* %263, i8** %11, align 8
  store i8 %261, i8* %262, align 1
  store i32 1, i32* %17, align 4
  br label %264

; <label>:264:                                    ; preds = %255, %243
  br label %301

; <label>:265:                                    ; preds = %144
  %266 = load i64, i64* %14, align 8
  %267 = icmp eq i64 %266, 1
  br i1 %267, label %268, label %298

; <label>:268:                                    ; preds = %265
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 10)
  %269 = add i64 %pgocount18, 1
  store i64 %269, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 10)
  %270 = load i8*, i8** %11, align 8
  %271 = getelementptr inbounds i8, i8* %270, i64 -2
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  %274 = icmp eq i32 %273, 255
  br i1 %274, label %275, label %298

; <label>:275:                                    ; preds = %268
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 12)
  %276 = add i64 %pgocount19, 1
  store i64 %276, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 12)
  %277 = load i8*, i8** %13, align 8
  %278 = load i8, i8* %277, align 1
  %279 = zext i8 %278 to i32
  %280 = icmp slt i32 %279, 126
  br i1 %280, label %281, label %298

; <label>:281:                                    ; preds = %275
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 13)
  %282 = add i64 %pgocount20, 1
  store i64 %282, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 13)
  %283 = load i8*, i8** %13, align 8
  %284 = load i8, i8* %283, align 1
  %285 = zext i8 %284 to i32
  %286 = add nsw i32 %285, 2
  %287 = trunc i32 %286 to i8
  store i8 %287, i8* %283, align 1
  %288 = zext i8 %287 to i32
  %289 = icmp eq i32 %288, 127
  %290 = zext i1 %289 to i64
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 24)
  %291 = add i64 %pgocount21, %290
  store i64 %291, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 24)
  %292 = select i1 %289, i32 0, i32 1
  store i32 %292, i32* %17, align 4
  %293 = load i8*, i8** %11, align 8
  %294 = getelementptr inbounds i8, i8* %293, i64 -1
  %295 = load i8, i8* %294, align 1
  %296 = load i8*, i8** %11, align 8
  %297 = getelementptr inbounds i8, i8* %296, i64 -2
  store i8 %295, i8* %297, align 1
  br label %300

; <label>:298:                                    ; preds = %275, %268, %265
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 8)
  %299 = add i64 %pgocount22, 1
  store i64 %299, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 8)
  store i32 2, i32* %17, align 4
  br label %300

; <label>:300:                                    ; preds = %298, %281
  br label %63

; <label>:301:                                    ; preds = %264, %226, %183, %144
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 11)
  %302 = add i64 %pgocount23, 1
  store i64 %302, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 11)
  br label %31

; <label>:303:                                    ; preds = %31
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 23)
  %304 = add i64 %pgocount24, 1
  store i64 %304, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_PackBitsEncode, i64 0, i64 23)
  %305 = load i8*, i8** %11, align 8
  %306 = load %struct.tiff*, %struct.tiff** %6, align 8
  %307 = getelementptr inbounds %struct.tiff, %struct.tiff* %306, i32 0, i32 42
  %308 = load i8*, i8** %307, align 8
  %309 = ptrtoint i8* %305 to i64
  %310 = ptrtoint i8* %308 to i64
  %311 = sub i64 %309, %310
  %312 = load %struct.tiff*, %struct.tiff** %6, align 8
  %313 = getelementptr inbounds %struct.tiff, %struct.tiff* %312, i32 0, i32 43
  %314 = load i32, i32* %313, align 8
  %315 = sext i32 %314 to i64
  %316 = add nsw i64 %315, %311
  %317 = trunc i64 %316 to i32
  store i32 %317, i32* %313, align 8
  %318 = load i8*, i8** %11, align 8
  %319 = load %struct.tiff*, %struct.tiff** %6, align 8
  %320 = getelementptr inbounds %struct.tiff, %struct.tiff* %319, i32 0, i32 42
  store i8* %318, i8** %320, align 8
  store i32 1, i32* %5, align 4
  br label %321

; <label>:321:                                    ; preds = %303, %136, %97
  %322 = load i32, i32* %5, align 4
  ret i32 %322
}

; Function Attrs: nounwind uwtable
define internal i32 @PackBitsEncodeChunk(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
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
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 37
  %13 = load i8*, i8** %12, align 8
  %14 = ptrtoint i8* %13 to i32
  store i32 %14, i32* %10, align 4
  %15 = load i32, i32* %10, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %4
  br label %21

; <label>:18:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i64 0, i64 3)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i64 0, i64 3)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 193, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PackBitsEncodeChunk, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %21

; <label>:21:                                     ; preds = %20, %17
  br label %22

; <label>:22:                                     ; preds = %35, %21
  %23 = load i32, i32* %8, align 4
  %24 = sext i32 %23 to i64
  %25 = icmp sgt i64 %24, 0
  br i1 %25, label %26, label %44

; <label>:26:                                     ; preds = %22
  %27 = load %struct.tiff*, %struct.tiff** %6, align 8
  %28 = load i8*, i8** %7, align 8
  %29 = load i32, i32* %10, align 4
  %30 = load i16, i16* %9, align 2
  %31 = call i32 @PackBitsEncode(%struct.tiff* %27, i8* %28, i32 %29, i16 zeroext %30)
  %32 = icmp slt i32 %31, 0
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i64 0, i64 2)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i64 0, i64 2)
  store i32 -1, i32* %5, align 4
  br label %46

; <label>:35:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i64 0, i64 0)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i64 0, i64 0)
  %37 = load i32, i32* %10, align 4
  %38 = load i8*, i8** %7, align 8
  %39 = sext i32 %37 to i64
  %40 = getelementptr inbounds i8, i8* %38, i64 %39
  store i8* %40, i8** %7, align 8
  %41 = load i32, i32* %10, align 4
  %42 = load i32, i32* %8, align 4
  %43 = sub nsw i32 %42, %41
  store i32 %43, i32* %8, align 4
  br label %22

; <label>:44:                                     ; preds = %22
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i64 0, i64 1)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_PackBitsEncodeChunk, i64 0, i64 1)
  store i32 1, i32* %5, align 4
  br label %46

; <label>:46:                                     ; preds = %44, %33
  %47 = load i32, i32* %5, align 4
  ret i32 %47
}

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

declare void @TIFFError(i8*, i8*, ...) #1

declare i32 @TIFFTileRowSize(%struct.tiff*) #1

declare i32 @TIFFScanlineSize(%struct.tiff*) #1

declare i32 @TIFFFlushData1(%struct.tiff*) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
