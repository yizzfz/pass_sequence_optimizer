; ModuleID = 'tif_tile.2.ll'
source_filename = "tif_tile.c"
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

@.str = private unnamed_addr constant [30 x i8] c"Col %ld out of range, max %lu\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Row %ld out of range, max %lu\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Depth %ld out of range, max %lu\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Sample %d out of range, max %u\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFComputeTile = private constant [15 x i8] c"TIFFComputeTile"
@__profn_TIFFCheckTile = private constant [13 x i8] c"TIFFCheckTile"
@__profn_TIFFNumberOfTiles = private constant [17 x i8] c"TIFFNumberOfTiles"
@__profn_TIFFTileRowSize = private constant [15 x i8] c"TIFFTileRowSize"
@__profn_TIFFVTileSize = private constant [13 x i8] c"TIFFVTileSize"
@__profn_TIFFTileSize = private constant [12 x i8] c"TIFFTileSize"
@__profn_TIFFDefaultTileSize = private constant [19 x i8] c"TIFFDefaultTileSize"
@__profn__TIFFDefaultTileSize = private constant [20 x i8] c"_TIFFDefaultTileSize"
@__profc_TIFFComputeTile = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFComputeTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8642033995073701238, i64 109377865682, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i32, i32, i16)* @TIFFComputeTile to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFCheckTile = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFCheckTile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7101252385312770254, i64 73254265348, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32, i32, i32, i16)* @TIFFCheckTile to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFNumberOfTiles = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFNumberOfTiles = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4646572730005573793, i64 97586449031, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFNumberOfTiles to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFTileRowSize = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFTileRowSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2536009641984701021, i64 51375187908, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFTileRowSize to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFVTileSize = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFVTileSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4551203686278125926, i64 77877629319, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*, i32)* @TIFFVTileSize to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFTileSize = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFTileSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5019936391959304117, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFTileSize, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFTileSize to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFDefaultTileSize = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFDefaultTileSize = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFDefaultTileSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 14616900419413000, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFDefaultTileSize, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i32*, i32*)* @TIFFDefaultTileSize to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFDefaultTileSize to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc__TIFFDefaultTileSize = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFDefaultTileSize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6814498346418262770, i64 61563538795, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, i32*, i32*)* @_TIFFDefaultTileSize to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [76 x i8] c"\83\01Ix\DA\0B\F1tss\CE\CF-(-I\0D\C9\CCIe\0C\01\F13R\93\B3\E1<\BF\D2\DC\A4\D4\22\FF4\90@1X\04\C4\0A\CA/\0F\CE\AC\82\A8\08\03\09\C0y(\1C\97\D4\B4\C4\D2\9C\12\B8X<\16A\00\93\A8-\8A", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFComputeTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFCheckTile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFNumberOfTiles to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFTileRowSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFVTileSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFTileSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFDefaultTileSize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFDefaultTileSize to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([76 x i8], [76 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFComputeTile(%struct.tiff*, i32, i32, i32, i16 zeroext) #0 {
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i16, align 2
  %11 = alloca %struct.TIFFDirectory*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i16 %4, i16* %10, align 2
  %19 = load %struct.tiff*, %struct.tiff** %6, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 6
  store %struct.TIFFDirectory* %20, %struct.TIFFDirectory** %11, align 8
  %21 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %22 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %21, i32 0, i32 4
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %12, align 4
  %24 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %25 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %24, i32 0, i32 5
  %26 = load i32, i32* %25, align 8
  store i32 %26, i32* %13, align 4
  %27 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %28 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %27, i32 0, i32 6
  %29 = load i32, i32* %28, align 4
  store i32 %29, i32* %14, align 4
  store i32 1, i32* %15, align 4
  %30 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %31 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %30, i32 0, i32 3
  %32 = load i32, i32* %31, align 8
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 2)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 2)
  store i32 0, i32* %9, align 4
  br label %36

; <label>:36:                                     ; preds = %34, %5
  %37 = load i32, i32* %12, align 4
  %38 = icmp eq i32 %37, -1
  br i1 %38, label %39, label %44

; <label>:39:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 4)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 4)
  %41 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %42 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 8
  store i32 %43, i32* %12, align 4
  br label %44

; <label>:44:                                     ; preds = %39, %36
  %45 = load i32, i32* %13, align 4
  %46 = icmp eq i32 %45, -1
  br i1 %46, label %47, label %52

; <label>:47:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 5)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 5)
  %49 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %50 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %49, i32 0, i32 2
  %51 = load i32, i32* %50, align 4
  store i32 %51, i32* %13, align 4
  br label %52

; <label>:52:                                     ; preds = %47, %44
  %53 = load i32, i32* %14, align 4
  %54 = icmp eq i32 %53, -1
  br i1 %54, label %55, label %60

; <label>:55:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 6)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 6)
  %57 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %58 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %57, i32 0, i32 3
  %59 = load i32, i32* %58, align 8
  store i32 %59, i32* %14, align 4
  br label %60

; <label>:60:                                     ; preds = %55, %52
  %61 = load i32, i32* %12, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %152

; <label>:63:                                     ; preds = %60
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 1)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 1)
  %65 = load i32, i32* %13, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %152

; <label>:67:                                     ; preds = %63
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 3)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 3)
  %69 = load i32, i32* %14, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %152

; <label>:71:                                     ; preds = %67
  %72 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %73 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %72, i32 0, i32 1
  %74 = load i32, i32* %73, align 8
  %75 = load i32, i32* %12, align 4
  %76 = sub i32 %75, 1
  %77 = add i32 %74, %76
  %78 = load i32, i32* %12, align 4
  %79 = udiv i32 %77, %78
  store i32 %79, i32* %16, align 4
  %80 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %81 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %80, i32 0, i32 2
  %82 = load i32, i32* %81, align 4
  %83 = load i32, i32* %13, align 4
  %84 = sub i32 %83, 1
  %85 = add i32 %82, %84
  %86 = load i32, i32* %13, align 4
  %87 = udiv i32 %85, %86
  store i32 %87, i32* %17, align 4
  %88 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %89 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %88, i32 0, i32 3
  %90 = load i32, i32* %89, align 8
  %91 = load i32, i32* %14, align 4
  %92 = sub i32 %91, 1
  %93 = add i32 %90, %92
  %94 = load i32, i32* %14, align 4
  %95 = udiv i32 %93, %94
  store i32 %95, i32* %18, align 4
  %96 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %11, align 8
  %97 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %96, i32 0, i32 24
  %98 = load i16, i16* %97, align 2
  %99 = zext i16 %98 to i32
  %100 = icmp eq i32 %99, 2
  br i1 %100, label %101, label %129

; <label>:101:                                    ; preds = %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 7)
  %102 = add i64 %pgocount6, 1
  store i64 %102, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 7)
  %103 = load i32, i32* %16, align 4
  %104 = load i32, i32* %17, align 4
  %105 = mul i32 %103, %104
  %106 = load i32, i32* %18, align 4
  %107 = mul i32 %105, %106
  %108 = load i16, i16* %10, align 2
  %109 = zext i16 %108 to i32
  %110 = mul i32 %107, %109
  %111 = load i32, i32* %16, align 4
  %112 = load i32, i32* %17, align 4
  %113 = mul i32 %111, %112
  %114 = load i32, i32* %9, align 4
  %115 = load i32, i32* %14, align 4
  %116 = udiv i32 %114, %115
  %117 = mul i32 %113, %116
  %118 = add i32 %110, %117
  %119 = load i32, i32* %16, align 4
  %120 = load i32, i32* %8, align 4
  %121 = load i32, i32* %13, align 4
  %122 = udiv i32 %120, %121
  %123 = mul i32 %119, %122
  %124 = add i32 %118, %123
  %125 = load i32, i32* %7, align 4
  %126 = load i32, i32* %12, align 4
  %127 = udiv i32 %125, %126
  %128 = add i32 %124, %127
  store i32 %128, i32* %15, align 4
  br label %151

; <label>:129:                                    ; preds = %71
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 8)
  %130 = add i64 %pgocount7, 1
  store i64 %130, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 8)
  %131 = load i32, i32* %16, align 4
  %132 = load i32, i32* %17, align 4
  %133 = mul i32 %131, %132
  %134 = load i32, i32* %9, align 4
  %135 = load i32, i32* %14, align 4
  %136 = udiv i32 %134, %135
  %137 = mul i32 %133, %136
  %138 = load i32, i32* %16, align 4
  %139 = load i32, i32* %8, align 4
  %140 = load i32, i32* %13, align 4
  %141 = udiv i32 %139, %140
  %142 = mul i32 %138, %141
  %143 = add i32 %137, %142
  %144 = load i32, i32* %7, align 4
  %145 = load i32, i32* %12, align 4
  %146 = udiv i32 %144, %145
  %147 = add i32 %143, %146
  %148 = load i16, i16* %10, align 2
  %149 = zext i16 %148 to i32
  %150 = add i32 %147, %149
  store i32 %150, i32* %15, align 4
  br label %151

; <label>:151:                                    ; preds = %129, %101
  br label %152

; <label>:152:                                    ; preds = %151, %67, %63, %60
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 0)
  %153 = add i64 %pgocount8, 1
  store i64 %153, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_TIFFComputeTile, i64 0, i64 0)
  %154 = load i32, i32* %15, align 4
  ret i32 %154
}

; Function Attrs: nounwind uwtable
define i32 @TIFFCheckTile(%struct.tiff*, i32, i32, i32, i16 zeroext) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.tiff*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i16, align 2
  %12 = alloca %struct.TIFFDirectory*, align 8
  store %struct.tiff* %0, %struct.tiff** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i16 %4, i16* %11, align 2
  %13 = load %struct.tiff*, %struct.tiff** %7, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 6
  store %struct.TIFFDirectory* %14, %struct.TIFFDirectory** %12, align 8
  %15 = load i32, i32* %8, align 4
  %16 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %17 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %16, i32 0, i32 1
  %18 = load i32, i32* %17, align 8
  %19 = icmp uge i32 %15, %18
  br i1 %19, label %20, label %31

; <label>:20:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 0)
  %22 = load %struct.tiff*, %struct.tiff** %7, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 0
  %24 = load i8*, i8** %23, align 8
  %25 = load i32, i32* %8, align 4
  %26 = zext i32 %25 to i64
  %27 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %28 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %27, i32 0, i32 1
  %29 = load i32, i32* %28, align 8
  %30 = zext i32 %29 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %24, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i32 0, i32 0), i64 %26, i64 %30)
  store i32 0, i32* %6, align 4
  br label %93

; <label>:31:                                     ; preds = %5
  %32 = load i32, i32* %9, align 4
  %33 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %34 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %33, i32 0, i32 2
  %35 = load i32, i32* %34, align 4
  %36 = icmp uge i32 %32, %35
  br i1 %36, label %37, label %48

; <label>:37:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 1)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 1)
  %39 = load %struct.tiff*, %struct.tiff** %7, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %39, i32 0, i32 0
  %41 = load i8*, i8** %40, align 8
  %42 = load i32, i32* %9, align 4
  %43 = zext i32 %42 to i64
  %44 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %45 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %44, i32 0, i32 2
  %46 = load i32, i32* %45, align 4
  %47 = zext i32 %46 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %41, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0), i64 %43, i64 %47)
  store i32 0, i32* %6, align 4
  br label %93

; <label>:48:                                     ; preds = %31
  %49 = load i32, i32* %10, align 4
  %50 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %51 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %50, i32 0, i32 3
  %52 = load i32, i32* %51, align 8
  %53 = icmp uge i32 %49, %52
  br i1 %53, label %54, label %65

; <label>:54:                                     ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 2)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 2)
  %56 = load %struct.tiff*, %struct.tiff** %7, align 8
  %57 = getelementptr inbounds %struct.tiff, %struct.tiff* %56, i32 0, i32 0
  %58 = load i8*, i8** %57, align 8
  %59 = load i32, i32* %10, align 4
  %60 = zext i32 %59 to i64
  %61 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %62 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %61, i32 0, i32 3
  %63 = load i32, i32* %62, align 8
  %64 = zext i32 %63 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %58, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i32 0, i32 0), i64 %60, i64 %64)
  store i32 0, i32* %6, align 4
  br label %93

; <label>:65:                                     ; preds = %48
  %66 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %67 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %66, i32 0, i32 24
  %68 = load i16, i16* %67, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp eq i32 %69, 2
  br i1 %70, label %71, label %91

; <label>:71:                                     ; preds = %65
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 4)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 4)
  %73 = load i16, i16* %11, align 2
  %74 = zext i16 %73 to i32
  %75 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %76 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %75, i32 0, i32 15
  %77 = load i16, i16* %76, align 2
  %78 = zext i16 %77 to i32
  %79 = icmp sge i32 %74, %78
  br i1 %79, label %80, label %91

; <label>:80:                                     ; preds = %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 5)
  %81 = add i64 %pgocount4, 1
  store i64 %81, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 5)
  %82 = load %struct.tiff*, %struct.tiff** %7, align 8
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %82, i32 0, i32 0
  %84 = load i8*, i8** %83, align 8
  %85 = load i16, i16* %11, align 2
  %86 = zext i16 %85 to i32
  %87 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %12, align 8
  %88 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %87, i32 0, i32 15
  %89 = load i16, i16* %88, align 2
  %90 = zext i16 %89 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* %84, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i32 0, i32 0), i32 %86, i32 %90)
  store i32 0, i32* %6, align 4
  br label %93

; <label>:91:                                     ; preds = %71, %65
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 3)
  %92 = add i64 %pgocount5, 1
  store i64 %92, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFCheckTile, i64 0, i64 3)
  store i32 1, i32* %6, align 4
  br label %93

; <label>:93:                                     ; preds = %91, %80, %54, %37, %20
  %94 = load i32, i32* %6, align 4
  ret i32 %94
}

declare void @TIFFError(i8*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @TIFFNumberOfTiles(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  %3 = alloca %struct.TIFFDirectory*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %8 = load %struct.tiff*, %struct.tiff** %2, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 6
  store %struct.TIFFDirectory* %9, %struct.TIFFDirectory** %3, align 8
  %10 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %11 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %10, i32 0, i32 4
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %4, align 4
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 5
  %15 = load i32, i32* %14, align 8
  store i32 %15, i32* %5, align 4
  %16 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %17 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %16, i32 0, i32 6
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %6, align 4
  %19 = load i32, i32* %4, align 4
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %21, label %26

; <label>:21:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 3)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 3)
  %23 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %24 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %23, i32 0, i32 1
  %25 = load i32, i32* %24, align 8
  store i32 %25, i32* %4, align 4
  br label %26

; <label>:26:                                     ; preds = %21, %1
  %27 = load i32, i32* %5, align 4
  %28 = icmp eq i32 %27, -1
  br i1 %28, label %29, label %34

; <label>:29:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 4)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 4)
  %31 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %32 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %31, i32 0, i32 2
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %5, align 4
  br label %34

; <label>:34:                                     ; preds = %29, %26
  %35 = load i32, i32* %6, align 4
  %36 = icmp eq i32 %35, -1
  br i1 %36, label %37, label %42

; <label>:37:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 5)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 5)
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 3
  %41 = load i32, i32* %40, align 8
  store i32 %41, i32* %6, align 4
  br label %42

; <label>:42:                                     ; preds = %37, %34
  %43 = load i32, i32* %4, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %53, label %45

; <label>:45:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 1)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 1)
  %47 = load i32, i32* %5, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %53, label %49

; <label>:49:                                     ; preds = %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 6)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 6)
  %51 = load i32, i32* %6, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %49, %45, %42
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 0)
  %54 = add i64 %pgocount5, 1
  store i64 %54, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 0)
  br label %83

; <label>:55:                                     ; preds = %49
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 7)
  %56 = add i64 %pgocount6, 1
  store i64 %56, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 7)
  %57 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %58 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %57, i32 0, i32 1
  %59 = load i32, i32* %58, align 8
  %60 = load i32, i32* %4, align 4
  %61 = sub i32 %60, 1
  %62 = add i32 %59, %61
  %63 = load i32, i32* %4, align 4
  %64 = udiv i32 %62, %63
  %65 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %66 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %65, i32 0, i32 2
  %67 = load i32, i32* %66, align 4
  %68 = load i32, i32* %5, align 4
  %69 = sub i32 %68, 1
  %70 = add i32 %67, %69
  %71 = load i32, i32* %5, align 4
  %72 = udiv i32 %70, %71
  %73 = mul i32 %64, %72
  %74 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %75 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %74, i32 0, i32 3
  %76 = load i32, i32* %75, align 8
  %77 = load i32, i32* %6, align 4
  %78 = sub i32 %77, 1
  %79 = add i32 %76, %78
  %80 = load i32, i32* %6, align 4
  %81 = udiv i32 %79, %80
  %82 = mul i32 %73, %81
  br label %83

; <label>:83:                                     ; preds = %55, %53
  %84 = phi i32 [ 0, %53 ], [ %82, %55 ]
  store i32 %84, i32* %7, align 4
  %85 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %86 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %85, i32 0, i32 24
  %87 = load i16, i16* %86, align 2
  %88 = zext i16 %87 to i32
  %89 = icmp eq i32 %88, 2
  br i1 %89, label %90, label %98

; <label>:90:                                     ; preds = %83
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 2)
  %91 = add i64 %pgocount7, 1
  store i64 %91, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_TIFFNumberOfTiles, i64 0, i64 2)
  %92 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %3, align 8
  %93 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %92, i32 0, i32 15
  %94 = load i16, i16* %93, align 2
  %95 = zext i16 %94 to i32
  %96 = load i32, i32* %7, align 4
  %97 = mul i32 %96, %95
  store i32 %97, i32* %7, align 4
  br label %98

; <label>:98:                                     ; preds = %90, %83
  %99 = load i32, i32* %7, align 4
  ret i32 %99
}

; Function Attrs: nounwind uwtable
define i32 @TIFFTileRowSize(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct.TIFFDirectory*, align 8
  %5 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 6
  store %struct.TIFFDirectory* %7, %struct.TIFFDirectory** %4, align 8
  %8 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %9 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %8, i32 0, i32 5
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %18, label %12

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i64 0, i64 0)
  %14 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %15 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %14, i32 0, i32 4
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %12, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %47

; <label>:20:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i64 0, i64 2)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i64 0, i64 2)
  %22 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %23 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %22, i32 0, i32 8
  %24 = load i16, i16* %23, align 4
  %25 = zext i16 %24 to i32
  %26 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %27 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %26, i32 0, i32 4
  %28 = load i32, i32* %27, align 4
  %29 = mul i32 %25, %28
  store i32 %29, i32* %5, align 4
  %30 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %31 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %30, i32 0, i32 24
  %32 = load i16, i16* %31, align 2
  %33 = zext i16 %32 to i32
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %43

; <label>:35:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i64 0, i64 3)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFTileRowSize, i64 0, i64 3)
  %37 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %4, align 8
  %38 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %37, i32 0, i32 15
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = load i32, i32* %5, align 4
  %42 = mul nsw i32 %41, %40
  store i32 %42, i32* %5, align 4
  br label %43

; <label>:43:                                     ; preds = %35, %20
  %44 = load i32, i32* %5, align 4
  %45 = add i32 %44, 7
  %46 = udiv i32 %45, 8
  store i32 %46, i32* %2, align 4
  br label %47

; <label>:47:                                     ; preds = %43, %18
  %48 = load i32, i32* %2, align 4
  ret i32 %48
}

; Function Attrs: nounwind uwtable
define i32 @TIFFVTileSize(%struct.tiff*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFDirectory*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32 %1, i32* %5, align 4
  %11 = load %struct.tiff*, %struct.tiff** %4, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 6
  store %struct.TIFFDirectory* %12, %struct.TIFFDirectory** %6, align 8
  %13 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 5
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %29, label %17

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 1)
  %19 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %20 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %29, label %23

; <label>:23:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 2)
  %25 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %26 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %25, i32 0, i32 6
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %23, %17, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 0)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 0)
  store i32 0, i32* %3, align 4
  br label %136

; <label>:31:                                     ; preds = %23
  %32 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %33 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %32, i32 0, i32 24
  %34 = load i16, i16* %33, align 2
  %35 = zext i16 %34 to i32
  %36 = icmp eq i32 %35, 1
  br i1 %36, label %37, label %124

; <label>:37:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 4)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 4)
  %39 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %40 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %39, i32 0, i32 11
  %41 = load i16, i16* %40, align 2
  %42 = zext i16 %41 to i32
  %43 = icmp eq i32 %42, 6
  br i1 %43, label %44, label %124

; <label>:44:                                     ; preds = %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 5)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 5)
  %46 = load %struct.tiff*, %struct.tiff** %4, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 3
  %48 = load i32, i32* %47, align 8
  %49 = and i32 %48, 16384
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %124, label %51

; <label>:51:                                     ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 6)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 6)
  %53 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %54 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %53, i32 0, i32 4
  %55 = load i32, i32* %54, align 4
  %56 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %57 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %56, i32 0, i32 49
  %58 = getelementptr inbounds [2 x i16], [2 x i16]* %57, i64 0, i64 0
  %59 = load i16, i16* %58, align 8
  %60 = zext i16 %59 to i32
  %61 = sub i32 %60, 1
  %62 = add i32 %55, %61
  %63 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %64 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %63, i32 0, i32 49
  %65 = getelementptr inbounds [2 x i16], [2 x i16]* %64, i64 0, i64 0
  %66 = load i16, i16* %65, align 8
  %67 = zext i16 %66 to i32
  %68 = udiv i32 %62, %67
  %69 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %70 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %69, i32 0, i32 49
  %71 = getelementptr inbounds [2 x i16], [2 x i16]* %70, i64 0, i64 0
  %72 = load i16, i16* %71, align 8
  %73 = zext i16 %72 to i32
  %74 = mul i32 %68, %73
  store i32 %74, i32* %8, align 4
  %75 = load i32, i32* %8, align 4
  %76 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %77 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %76, i32 0, i32 8
  %78 = load i16, i16* %77, align 4
  %79 = zext i16 %78 to i32
  %80 = mul nsw i32 %75, %79
  %81 = add i32 %80, 7
  %82 = udiv i32 %81, 8
  store i32 %82, i32* %9, align 4
  %83 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %84 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %83, i32 0, i32 49
  %85 = getelementptr inbounds [2 x i16], [2 x i16]* %84, i64 0, i64 0
  %86 = load i16, i16* %85, align 8
  %87 = zext i16 %86 to i32
  %88 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %89 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %88, i32 0, i32 49
  %90 = getelementptr inbounds [2 x i16], [2 x i16]* %89, i64 0, i64 1
  %91 = load i16, i16* %90, align 2
  %92 = zext i16 %91 to i32
  %93 = mul nsw i32 %87, %92
  store i32 %93, i32* %10, align 4
  %94 = load i32, i32* %5, align 4
  %95 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %96 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %95, i32 0, i32 49
  %97 = getelementptr inbounds [2 x i16], [2 x i16]* %96, i64 0, i64 1
  %98 = load i16, i16* %97, align 2
  %99 = zext i16 %98 to i32
  %100 = sub i32 %99, 1
  %101 = add i32 %94, %100
  %102 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %103 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %102, i32 0, i32 49
  %104 = getelementptr inbounds [2 x i16], [2 x i16]* %103, i64 0, i64 1
  %105 = load i16, i16* %104, align 2
  %106 = zext i16 %105 to i32
  %107 = udiv i32 %101, %106
  %108 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %109 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %108, i32 0, i32 49
  %110 = getelementptr inbounds [2 x i16], [2 x i16]* %109, i64 0, i64 1
  %111 = load i16, i16* %110, align 2
  %112 = zext i16 %111 to i32
  %113 = mul i32 %107, %112
  store i32 %113, i32* %5, align 4
  %114 = load i32, i32* %5, align 4
  %115 = load i32, i32* %9, align 4
  %116 = mul i32 %114, %115
  %117 = load i32, i32* %5, align 4
  %118 = load i32, i32* %9, align 4
  %119 = mul i32 %117, %118
  %120 = load i32, i32* %10, align 4
  %121 = udiv i32 %119, %120
  %122 = mul i32 2, %121
  %123 = add i32 %116, %122
  store i32 %123, i32* %7, align 4
  br label %130

; <label>:124:                                    ; preds = %44, %37, %31
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 3)
  %125 = add i64 %pgocount6, 1
  store i64 %125, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_TIFFVTileSize, i64 0, i64 3)
  %126 = load i32, i32* %5, align 4
  %127 = load %struct.tiff*, %struct.tiff** %4, align 8
  %128 = call i32 @TIFFTileRowSize(%struct.tiff* %127)
  %129 = mul i32 %126, %128
  store i32 %129, i32* %7, align 4
  br label %130

; <label>:130:                                    ; preds = %124, %51
  %131 = load i32, i32* %7, align 4
  %132 = load %struct.TIFFDirectory*, %struct.TIFFDirectory** %6, align 8
  %133 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %132, i32 0, i32 6
  %134 = load i32, i32* %133, align 4
  %135 = mul i32 %131, %134
  store i32 %135, i32* %3, align 4
  br label %136

; <label>:136:                                    ; preds = %130, %29
  %137 = load i32, i32* %3, align 4
  ret i32 %137
}

; Function Attrs: nounwind uwtable
define i32 @TIFFTileSize(%struct.tiff*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFTileSize, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFTileSize, i64 0, i64 0)
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = load %struct.tiff*, %struct.tiff** %3, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 6
  %7 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %6, i32 0, i32 5
  %8 = load i32, i32* %7, align 8
  %9 = call i32 @TIFFVTileSize(%struct.tiff* %4, i32 %8)
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define void @TIFFDefaultTileSize(%struct.tiff*, i32*, i32*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFDefaultTileSize, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFDefaultTileSize, i64 0, i64 0)
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  %8 = load %struct.tiff*, %struct.tiff** %5, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 36
  %10 = load void (%struct.tiff*, i32*, i32*)*, void (%struct.tiff*, i32*, i32*)** %9, align 8
  %11 = load %struct.tiff*, %struct.tiff** %5, align 8
  %12 = load i32*, i32** %6, align 8
  %13 = load i32*, i32** %7, align 8
  %14 = ptrtoint void (%struct.tiff*, i32*, i32*)* %10 to i64
  call void @__llvm_profile_instrument_target(i64 %14, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFDefaultTileSize to i8*), i32 0)
  call void %10(%struct.tiff* %11, i32* %12, i32* %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_TIFFDefaultTileSize(%struct.tiff*, i32*, i32*) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %7 = load %struct.tiff*, %struct.tiff** %4, align 8
  %8 = load i32*, i32** %5, align 8
  %9 = load i32, i32* %8, align 4
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 3)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 3)
  %13 = load i32*, i32** %5, align 8
  store i32 256, i32* %13, align 4
  br label %14

; <label>:14:                                     ; preds = %11, %3
  %15 = load i32*, i32** %6, align 8
  %16 = load i32, i32* %15, align 4
  %17 = icmp slt i32 %16, 1
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 4)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 4)
  %20 = load i32*, i32** %6, align 8
  store i32 256, i32* %20, align 4
  br label %21

; <label>:21:                                     ; preds = %18, %14
  %22 = load i32*, i32** %5, align 8
  %23 = load i32, i32* %22, align 4
  %24 = and i32 %23, 15
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %34

; <label>:26:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 1)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 1)
  %28 = load i32*, i32** %5, align 8
  %29 = load i32, i32* %28, align 4
  %30 = add i32 %29, 15
  %31 = udiv i32 %30, 16
  %32 = mul i32 %31, 16
  %33 = load i32*, i32** %5, align 8
  store i32 %32, i32* %33, align 4
  br label %34

; <label>:34:                                     ; preds = %26, %21
  %35 = load i32*, i32** %6, align 8
  %36 = load i32, i32* %35, align 4
  %37 = and i32 %36, 15
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %47

; <label>:39:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 2)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 2)
  %41 = load i32*, i32** %6, align 8
  %42 = load i32, i32* %41, align 4
  %43 = add i32 %42, 15
  %44 = udiv i32 %43, 16
  %45 = mul i32 %44, 16
  %46 = load i32*, i32** %6, align 8
  store i32 %45, i32* %46, align 4
  br label %47

; <label>:47:                                     ; preds = %39, %34
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 0)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc__TIFFDefaultTileSize, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
