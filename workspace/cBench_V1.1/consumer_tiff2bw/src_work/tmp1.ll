; ModuleID = 'tif_packbits.ll'
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

@.str = private unnamed_addr constant [49 x i8] c"PackBitsDecode: Not enough data for scanline %ld\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"rowsize > 0\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"tif_packbits.c\00", align 1
@__PRETTY_FUNCTION__.PackBitsEncodeChunk = private unnamed_addr constant [62 x i8] c"int PackBitsEncodeChunk(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1

; Function Attrs: nounwind uwtable
define i32 @TIFFInitPackBits(%struct.tiff*, i32) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %7, align 8
  %8 = load %struct.tiff*, %struct.tiff** %3, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %9, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %11, align 8
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 24
  store i32 (%struct.tiff*, i16)* @PackBitsPreEncode, i32 (%struct.tiff*, i16)** %13, align 8
  %14 = load %struct.tiff*, %struct.tiff** %3, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncode, i32 (%struct.tiff*, i8*, i32, i16)** %15, align 8
  %16 = load %struct.tiff*, %struct.tiff** %3, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncodeChunk, i32 (%struct.tiff*, i8*, i32, i16)** %17, align 8
  %18 = load %struct.tiff*, %struct.tiff** %3, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncodeChunk, i32 (%struct.tiff*, i8*, i32, i16)** %19, align 8
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

; <label>:21:                                     ; preds = %96, %48, %4
  %22 = load i32, i32* %11, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %21
  %25 = load i32, i32* %8, align 4
  %26 = sext i32 %25 to i64
  %27 = icmp sgt i64 %26, 0
  br label %28

; <label>:28:                                     ; preds = %24, %21
  %29 = phi i1 [ false, %21 ], [ %27, %24 ]
  br i1 %29, label %30, label %97

; <label>:30:                                     ; preds = %28
  %31 = load i8*, i8** %10, align 8
  %32 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %32, i8** %10, align 8
  %33 = load i8, i8* %31, align 1
  %34 = sext i8 %33 to i64
  store i64 %34, i64* %12, align 8
  %35 = load i32, i32* %11, align 4
  %36 = add nsw i32 %35, -1
  store i32 %36, i32* %11, align 4
  %37 = load i64, i64* %12, align 8
  %38 = icmp sge i64 %37, 128
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %30
  %40 = load i64, i64* %12, align 8
  %41 = sub nsw i64 %40, 256
  store i64 %41, i64* %12, align 8
  br label %42

; <label>:42:                                     ; preds = %39, %30
  %43 = load i64, i64* %12, align 8
  %44 = icmp slt i64 %43, 0
  br i1 %44, label %45, label %74

; <label>:45:                                     ; preds = %42
  %46 = load i64, i64* %12, align 8
  %47 = icmp eq i64 %46, -128
  br i1 %47, label %48, label %49

; <label>:48:                                     ; preds = %45
  br label %21

; <label>:49:                                     ; preds = %45
  %50 = load i64, i64* %12, align 8
  %51 = sub nsw i64 0, %50
  %52 = add nsw i64 %51, 1
  store i64 %52, i64* %12, align 8
  %53 = load i64, i64* %12, align 8
  %54 = load i32, i32* %8, align 4
  %55 = sext i32 %54 to i64
  %56 = sub nsw i64 %55, %53
  %57 = trunc i64 %56 to i32
  store i32 %57, i32* %8, align 4
  %58 = load i8*, i8** %10, align 8
  %59 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %59, i8** %10, align 8
  %60 = load i8, i8* %58, align 1
  %61 = sext i8 %60 to i32
  store i32 %61, i32* %13, align 4
  %62 = load i32, i32* %11, align 4
  %63 = add nsw i32 %62, -1
  store i32 %63, i32* %11, align 4
  br label %64

; <label>:64:                                     ; preds = %68, %49
  %65 = load i64, i64* %12, align 8
  %66 = add nsw i64 %65, -1
  store i64 %66, i64* %12, align 8
  %67 = icmp sgt i64 %65, 0
  br i1 %67, label %68, label %73

; <label>:68:                                     ; preds = %64
  %69 = load i32, i32* %13, align 4
  %70 = trunc i32 %69 to i8
  %71 = load i8*, i8** %7, align 8
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %7, align 8
  store i8 %70, i8* %71, align 1
  br label %64

; <label>:73:                                     ; preds = %64
  br label %96

; <label>:74:                                     ; preds = %42
  %75 = load i8*, i8** %7, align 8
  %76 = load i8*, i8** %10, align 8
  %77 = load i64, i64* %12, align 8
  %78 = add nsw i64 %77, 1
  store i64 %78, i64* %12, align 8
  %79 = trunc i64 %78 to i32
  call void @_TIFFmemcpy(i8* %75, i8* %76, i32 %79)
  %80 = load i64, i64* %12, align 8
  %81 = load i8*, i8** %7, align 8
  %82 = getelementptr inbounds i8, i8* %81, i64 %80
  store i8* %82, i8** %7, align 8
  %83 = load i64, i64* %12, align 8
  %84 = load i32, i32* %8, align 4
  %85 = sext i32 %84 to i64
  %86 = sub nsw i64 %85, %83
  %87 = trunc i64 %86 to i32
  store i32 %87, i32* %8, align 4
  %88 = load i64, i64* %12, align 8
  %89 = load i8*, i8** %10, align 8
  %90 = getelementptr inbounds i8, i8* %89, i64 %88
  store i8* %90, i8** %10, align 8
  %91 = load i64, i64* %12, align 8
  %92 = load i32, i32* %11, align 4
  %93 = sext i32 %92 to i64
  %94 = sub nsw i64 %93, %91
  %95 = trunc i64 %94 to i32
  store i32 %95, i32* %11, align 4
  br label %96

; <label>:96:                                     ; preds = %74, %73
  br label %21

; <label>:97:                                     ; preds = %28
  %98 = load i8*, i8** %10, align 8
  %99 = load %struct.tiff*, %struct.tiff** %6, align 8
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %99, i32 0, i32 42
  store i8* %98, i8** %100, align 8
  %101 = load i32, i32* %11, align 4
  %102 = load %struct.tiff*, %struct.tiff** %6, align 8
  %103 = getelementptr inbounds %struct.tiff, %struct.tiff* %102, i32 0, i32 43
  store i32 %101, i32* %103, align 8
  %104 = load i32, i32* %8, align 4
  %105 = icmp sgt i32 %104, 0
  br i1 %105, label %106, label %114

; <label>:106:                                    ; preds = %97
  %107 = load %struct.tiff*, %struct.tiff** %6, align 8
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %107, i32 0, i32 0
  %109 = load i8*, i8** %108, align 8
  %110 = load %struct.tiff*, %struct.tiff** %6, align 8
  %111 = getelementptr inbounds %struct.tiff, %struct.tiff* %110, i32 0, i32 11
  %112 = load i32, i32* %111, align 8
  %113 = zext i32 %112 to i64
  call void (i8*, i8*, ...) @TIFFError(i8* %109, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i32 0, i32 0), i64 %113)
  store i32 0, i32* %5, align 4
  br label %115

; <label>:114:                                    ; preds = %97
  store i32 1, i32* %5, align 4
  br label %115

; <label>:115:                                    ; preds = %114, %106
  %116 = load i32, i32* %5, align 4
  ret i32 %116
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
  br i1 %10, label %11, label %18

; <label>:11:                                     ; preds = %2
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = call i32 @TIFFTileRowSize(%struct.tiff* %12)
  %14 = sext i32 %13 to i64
  %15 = inttoptr i64 %14 to i8*
  %16 = load %struct.tiff*, %struct.tiff** %3, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 37
  store i8* %15, i8** %17, align 8
  br label %25

; <label>:18:                                     ; preds = %2
  %19 = load %struct.tiff*, %struct.tiff** %3, align 8
  %20 = call i32 @TIFFScanlineSize(%struct.tiff* %19)
  %21 = sext i32 %20 to i64
  %22 = inttoptr i64 %21 to i8*
  %23 = load %struct.tiff*, %struct.tiff** %3, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %23, i32 0, i32 37
  store i8* %22, i8** %24, align 8
  br label %25

; <label>:25:                                     ; preds = %18, %11
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

; <label>:31:                                     ; preds = %277, %4
  %32 = load i32, i32* %8, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %278

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

; <label>:41:                                     ; preds = %55, %34
  %42 = load i32, i32* %8, align 4
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %44, label %50

; <label>:44:                                     ; preds = %41
  %45 = load i32, i32* %16, align 4
  %46 = load i8*, i8** %10, align 8
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = icmp eq i32 %45, %48
  br label %50

; <label>:50:                                     ; preds = %44, %41
  %51 = phi i1 [ false, %41 ], [ %49, %44 ]
  br i1 %51, label %52, label %60

; <label>:52:                                     ; preds = %50
  %53 = load i64, i64* %14, align 8
  %54 = add nsw i64 %53, 1
  store i64 %54, i64* %14, align 8
  br label %55

; <label>:55:                                     ; preds = %52
  %56 = load i32, i32* %8, align 4
  %57 = add nsw i32 %56, -1
  store i32 %57, i32* %8, align 4
  %58 = load i8*, i8** %10, align 8
  %59 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %59, i8** %10, align 8
  br label %41

; <label>:60:                                     ; preds = %50
  br label %61

; <label>:61:                                     ; preds = %276, %218, %179, %144, %60
  %62 = load i8*, i8** %11, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 2
  %64 = load i8*, i8** %12, align 8
  %65 = icmp uge i8* %63, %64
  br i1 %65, label %66, label %136

; <label>:66:                                     ; preds = %61
  %67 = load i32, i32* %17, align 4
  %68 = icmp eq i32 %67, 1
  br i1 %68, label %72, label %69

; <label>:69:                                     ; preds = %66
  %70 = load i32, i32* %17, align 4
  %71 = icmp eq i32 %70, 3
  br i1 %71, label %72, label %113

; <label>:72:                                     ; preds = %69, %66
  %73 = load i8*, i8** %11, align 8
  %74 = load i8*, i8** %13, align 8
  %75 = ptrtoint i8* %73 to i64
  %76 = ptrtoint i8* %74 to i64
  %77 = sub i64 %75, %76
  store i64 %77, i64* %15, align 8
  %78 = load i8*, i8** %13, align 8
  %79 = load %struct.tiff*, %struct.tiff** %6, align 8
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %79, i32 0, i32 42
  %81 = load i8*, i8** %80, align 8
  %82 = ptrtoint i8* %78 to i64
  %83 = ptrtoint i8* %81 to i64
  %84 = sub i64 %82, %83
  %85 = load %struct.tiff*, %struct.tiff** %6, align 8
  %86 = getelementptr inbounds %struct.tiff, %struct.tiff* %85, i32 0, i32 43
  %87 = load i32, i32* %86, align 8
  %88 = sext i32 %87 to i64
  %89 = add nsw i64 %88, %84
  %90 = trunc i64 %89 to i32
  store i32 %90, i32* %86, align 8
  %91 = load %struct.tiff*, %struct.tiff** %6, align 8
  %92 = call i32 @TIFFFlushData1(%struct.tiff* %91)
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %95, label %94

; <label>:94:                                     ; preds = %72
  store i32 -1, i32* %5, align 4
  br label %295

; <label>:95:                                     ; preds = %72
  %96 = load %struct.tiff*, %struct.tiff** %6, align 8
  %97 = getelementptr inbounds %struct.tiff, %struct.tiff* %96, i32 0, i32 42
  %98 = load i8*, i8** %97, align 8
  store i8* %98, i8** %11, align 8
  br label %99

; <label>:99:                                     ; preds = %103, %95
  %100 = load i64, i64* %15, align 8
  %101 = add nsw i64 %100, -1
  store i64 %101, i64* %15, align 8
  %102 = icmp sgt i64 %100, 0
  br i1 %102, label %103, label %109

; <label>:103:                                    ; preds = %99
  %104 = load i8*, i8** %13, align 8
  %105 = getelementptr inbounds i8, i8* %104, i32 1
  store i8* %105, i8** %13, align 8
  %106 = load i8, i8* %104, align 1
  %107 = load i8*, i8** %11, align 8
  %108 = getelementptr inbounds i8, i8* %107, i32 1
  store i8* %108, i8** %11, align 8
  store i8 %106, i8* %107, align 1
  br label %99

; <label>:109:                                    ; preds = %99
  %110 = load %struct.tiff*, %struct.tiff** %6, align 8
  %111 = getelementptr inbounds %struct.tiff, %struct.tiff* %110, i32 0, i32 42
  %112 = load i8*, i8** %111, align 8
  store i8* %112, i8** %13, align 8
  br label %135

; <label>:113:                                    ; preds = %69
  %114 = load i8*, i8** %11, align 8
  %115 = load %struct.tiff*, %struct.tiff** %6, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %115, i32 0, i32 42
  %117 = load i8*, i8** %116, align 8
  %118 = ptrtoint i8* %114 to i64
  %119 = ptrtoint i8* %117 to i64
  %120 = sub i64 %118, %119
  %121 = load %struct.tiff*, %struct.tiff** %6, align 8
  %122 = getelementptr inbounds %struct.tiff, %struct.tiff* %121, i32 0, i32 43
  %123 = load i32, i32* %122, align 8
  %124 = sext i32 %123 to i64
  %125 = add nsw i64 %124, %120
  %126 = trunc i64 %125 to i32
  store i32 %126, i32* %122, align 8
  %127 = load %struct.tiff*, %struct.tiff** %6, align 8
  %128 = call i32 @TIFFFlushData1(%struct.tiff* %127)
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %131, label %130

; <label>:130:                                    ; preds = %113
  store i32 -1, i32* %5, align 4
  br label %295

; <label>:131:                                    ; preds = %113
  %132 = load %struct.tiff*, %struct.tiff** %6, align 8
  %133 = getelementptr inbounds %struct.tiff, %struct.tiff* %132, i32 0, i32 42
  %134 = load i8*, i8** %133, align 8
  store i8* %134, i8** %11, align 8
  br label %135

; <label>:135:                                    ; preds = %131, %109
  br label %136

; <label>:136:                                    ; preds = %135, %61
  %137 = load i32, i32* %17, align 4
  switch i32 %137, label %277 [
    i32 0, label %138
    i32 1, label %173
    i32 2, label %212
    i32 3, label %247
  ]

; <label>:138:                                    ; preds = %136
  %139 = load i64, i64* %14, align 8
  %140 = icmp sgt i64 %139, 1
  br i1 %140, label %141, label %164

; <label>:141:                                    ; preds = %138
  store i32 2, i32* %17, align 4
  %142 = load i64, i64* %14, align 8
  %143 = icmp sgt i64 %142, 128
  br i1 %143, label %144, label %153

; <label>:144:                                    ; preds = %141
  %145 = load i8*, i8** %11, align 8
  %146 = getelementptr inbounds i8, i8* %145, i32 1
  store i8* %146, i8** %11, align 8
  store i8 -127, i8* %145, align 1
  %147 = load i32, i32* %16, align 4
  %148 = trunc i32 %147 to i8
  %149 = load i8*, i8** %11, align 8
  %150 = getelementptr inbounds i8, i8* %149, i32 1
  store i8* %150, i8** %11, align 8
  store i8 %148, i8* %149, align 1
  %151 = load i64, i64* %14, align 8
  %152 = sub nsw i64 %151, 128
  store i64 %152, i64* %14, align 8
  br label %61

; <label>:153:                                    ; preds = %141
  %154 = load i64, i64* %14, align 8
  %155 = sub nsw i64 %154, 1
  %156 = sub nsw i64 0, %155
  %157 = trunc i64 %156 to i8
  %158 = load i8*, i8** %11, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %11, align 8
  store i8 %157, i8* %158, align 1
  %160 = load i32, i32* %16, align 4
  %161 = trunc i32 %160 to i8
  %162 = load i8*, i8** %11, align 8
  %163 = getelementptr inbounds i8, i8* %162, i32 1
  store i8* %163, i8** %11, align 8
  store i8 %161, i8* %162, align 1
  br label %172

; <label>:164:                                    ; preds = %138
  %165 = load i8*, i8** %11, align 8
  store i8* %165, i8** %13, align 8
  %166 = load i8*, i8** %11, align 8
  %167 = getelementptr inbounds i8, i8* %166, i32 1
  store i8* %167, i8** %11, align 8
  store i8 0, i8* %166, align 1
  %168 = load i32, i32* %16, align 4
  %169 = trunc i32 %168 to i8
  %170 = load i8*, i8** %11, align 8
  %171 = getelementptr inbounds i8, i8* %170, i32 1
  store i8* %171, i8** %11, align 8
  store i8 %169, i8* %170, align 1
  store i32 1, i32* %17, align 4
  br label %172

; <label>:172:                                    ; preds = %164, %153
  br label %277

; <label>:173:                                    ; preds = %136
  %174 = load i64, i64* %14, align 8
  %175 = icmp sgt i64 %174, 1
  br i1 %175, label %176, label %199

; <label>:176:                                    ; preds = %173
  store i32 3, i32* %17, align 4
  %177 = load i64, i64* %14, align 8
  %178 = icmp sgt i64 %177, 128
  br i1 %178, label %179, label %188

; <label>:179:                                    ; preds = %176
  %180 = load i8*, i8** %11, align 8
  %181 = getelementptr inbounds i8, i8* %180, i32 1
  store i8* %181, i8** %11, align 8
  store i8 -127, i8* %180, align 1
  %182 = load i32, i32* %16, align 4
  %183 = trunc i32 %182 to i8
  %184 = load i8*, i8** %11, align 8
  %185 = getelementptr inbounds i8, i8* %184, i32 1
  store i8* %185, i8** %11, align 8
  store i8 %183, i8* %184, align 1
  %186 = load i64, i64* %14, align 8
  %187 = sub nsw i64 %186, 128
  store i64 %187, i64* %14, align 8
  br label %61

; <label>:188:                                    ; preds = %176
  %189 = load i64, i64* %14, align 8
  %190 = sub nsw i64 %189, 1
  %191 = sub nsw i64 0, %190
  %192 = trunc i64 %191 to i8
  %193 = load i8*, i8** %11, align 8
  %194 = getelementptr inbounds i8, i8* %193, i32 1
  store i8* %194, i8** %11, align 8
  store i8 %192, i8* %193, align 1
  %195 = load i32, i32* %16, align 4
  %196 = trunc i32 %195 to i8
  %197 = load i8*, i8** %11, align 8
  %198 = getelementptr inbounds i8, i8* %197, i32 1
  store i8* %198, i8** %11, align 8
  store i8 %196, i8* %197, align 1
  br label %211

; <label>:199:                                    ; preds = %173
  %200 = load i8*, i8** %13, align 8
  %201 = load i8, i8* %200, align 1
  %202 = add i8 %201, 1
  store i8 %202, i8* %200, align 1
  %203 = zext i8 %202 to i32
  %204 = icmp eq i32 %203, 127
  br i1 %204, label %205, label %206

; <label>:205:                                    ; preds = %199
  store i32 0, i32* %17, align 4
  br label %206

; <label>:206:                                    ; preds = %205, %199
  %207 = load i32, i32* %16, align 4
  %208 = trunc i32 %207 to i8
  %209 = load i8*, i8** %11, align 8
  %210 = getelementptr inbounds i8, i8* %209, i32 1
  store i8* %210, i8** %11, align 8
  store i8 %208, i8* %209, align 1
  br label %211

; <label>:211:                                    ; preds = %206, %188
  br label %277

; <label>:212:                                    ; preds = %136
  %213 = load i64, i64* %14, align 8
  %214 = icmp sgt i64 %213, 1
  br i1 %214, label %215, label %238

; <label>:215:                                    ; preds = %212
  %216 = load i64, i64* %14, align 8
  %217 = icmp sgt i64 %216, 128
  br i1 %217, label %218, label %227

; <label>:218:                                    ; preds = %215
  %219 = load i8*, i8** %11, align 8
  %220 = getelementptr inbounds i8, i8* %219, i32 1
  store i8* %220, i8** %11, align 8
  store i8 -127, i8* %219, align 1
  %221 = load i32, i32* %16, align 4
  %222 = trunc i32 %221 to i8
  %223 = load i8*, i8** %11, align 8
  %224 = getelementptr inbounds i8, i8* %223, i32 1
  store i8* %224, i8** %11, align 8
  store i8 %222, i8* %223, align 1
  %225 = load i64, i64* %14, align 8
  %226 = sub nsw i64 %225, 128
  store i64 %226, i64* %14, align 8
  br label %61

; <label>:227:                                    ; preds = %215
  %228 = load i64, i64* %14, align 8
  %229 = sub nsw i64 %228, 1
  %230 = sub nsw i64 0, %229
  %231 = trunc i64 %230 to i8
  %232 = load i8*, i8** %11, align 8
  %233 = getelementptr inbounds i8, i8* %232, i32 1
  store i8* %233, i8** %11, align 8
  store i8 %231, i8* %232, align 1
  %234 = load i32, i32* %16, align 4
  %235 = trunc i32 %234 to i8
  %236 = load i8*, i8** %11, align 8
  %237 = getelementptr inbounds i8, i8* %236, i32 1
  store i8* %237, i8** %11, align 8
  store i8 %235, i8* %236, align 1
  br label %246

; <label>:238:                                    ; preds = %212
  %239 = load i8*, i8** %11, align 8
  store i8* %239, i8** %13, align 8
  %240 = load i8*, i8** %11, align 8
  %241 = getelementptr inbounds i8, i8* %240, i32 1
  store i8* %241, i8** %11, align 8
  store i8 0, i8* %240, align 1
  %242 = load i32, i32* %16, align 4
  %243 = trunc i32 %242 to i8
  %244 = load i8*, i8** %11, align 8
  %245 = getelementptr inbounds i8, i8* %244, i32 1
  store i8* %245, i8** %11, align 8
  store i8 %243, i8* %244, align 1
  store i32 1, i32* %17, align 4
  br label %246

; <label>:246:                                    ; preds = %238, %227
  br label %277

; <label>:247:                                    ; preds = %136
  %248 = load i64, i64* %14, align 8
  %249 = icmp eq i64 %248, 1
  br i1 %249, label %250, label %275

; <label>:250:                                    ; preds = %247
  %251 = load i8*, i8** %11, align 8
  %252 = getelementptr inbounds i8, i8* %251, i64 -2
  %253 = load i8, i8* %252, align 1
  %254 = zext i8 %253 to i32
  %255 = icmp eq i32 %254, 255
  br i1 %255, label %256, label %275

; <label>:256:                                    ; preds = %250
  %257 = load i8*, i8** %13, align 8
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = icmp slt i32 %259, 126
  br i1 %260, label %261, label %275

; <label>:261:                                    ; preds = %256
  %262 = load i8*, i8** %13, align 8
  %263 = load i8, i8* %262, align 1
  %264 = zext i8 %263 to i32
  %265 = add nsw i32 %264, 2
  %266 = trunc i32 %265 to i8
  store i8 %266, i8* %262, align 1
  %267 = zext i8 %266 to i32
  %268 = icmp eq i32 %267, 127
  %269 = select i1 %268, i32 0, i32 1
  store i32 %269, i32* %17, align 4
  %270 = load i8*, i8** %11, align 8
  %271 = getelementptr inbounds i8, i8* %270, i64 -1
  %272 = load i8, i8* %271, align 1
  %273 = load i8*, i8** %11, align 8
  %274 = getelementptr inbounds i8, i8* %273, i64 -2
  store i8 %272, i8* %274, align 1
  br label %276

; <label>:275:                                    ; preds = %256, %250, %247
  store i32 2, i32* %17, align 4
  br label %276

; <label>:276:                                    ; preds = %275, %261
  br label %61

; <label>:277:                                    ; preds = %246, %211, %172, %136
  br label %31

; <label>:278:                                    ; preds = %31
  %279 = load i8*, i8** %11, align 8
  %280 = load %struct.tiff*, %struct.tiff** %6, align 8
  %281 = getelementptr inbounds %struct.tiff, %struct.tiff* %280, i32 0, i32 42
  %282 = load i8*, i8** %281, align 8
  %283 = ptrtoint i8* %279 to i64
  %284 = ptrtoint i8* %282 to i64
  %285 = sub i64 %283, %284
  %286 = load %struct.tiff*, %struct.tiff** %6, align 8
  %287 = getelementptr inbounds %struct.tiff, %struct.tiff* %286, i32 0, i32 43
  %288 = load i32, i32* %287, align 8
  %289 = sext i32 %288 to i64
  %290 = add nsw i64 %289, %285
  %291 = trunc i64 %290 to i32
  store i32 %291, i32* %287, align 8
  %292 = load i8*, i8** %11, align 8
  %293 = load %struct.tiff*, %struct.tiff** %6, align 8
  %294 = getelementptr inbounds %struct.tiff, %struct.tiff* %293, i32 0, i32 42
  store i8* %292, i8** %294, align 8
  store i32 1, i32* %5, align 4
  br label %295

; <label>:295:                                    ; preds = %278, %130, %94
  %296 = load i32, i32* %5, align 4
  ret i32 %296
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
  br label %20

; <label>:18:                                     ; preds = %4
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i32 193, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PackBitsEncodeChunk, i32 0, i32 0)) #3
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20:                                     ; preds = %19, %17
  br label %21

; <label>:21:                                     ; preds = %33, %20
  %22 = load i32, i32* %8, align 4
  %23 = sext i32 %22 to i64
  %24 = icmp sgt i64 %23, 0
  br i1 %24, label %25, label %41

; <label>:25:                                     ; preds = %21
  %26 = load %struct.tiff*, %struct.tiff** %6, align 8
  %27 = load i8*, i8** %7, align 8
  %28 = load i32, i32* %10, align 4
  %29 = load i16, i16* %9, align 2
  %30 = call i32 @PackBitsEncode(%struct.tiff* %26, i8* %27, i32 %28, i16 zeroext %29)
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %25
  store i32 -1, i32* %5, align 4
  br label %42

; <label>:33:                                     ; preds = %25
  %34 = load i32, i32* %10, align 4
  %35 = load i8*, i8** %7, align 8
  %36 = sext i32 %34 to i64
  %37 = getelementptr inbounds i8, i8* %35, i64 %36
  store i8* %37, i8** %7, align 8
  %38 = load i32, i32* %10, align 4
  %39 = load i32, i32* %8, align 4
  %40 = sub nsw i32 %39, %38
  store i32 %40, i32* %8, align 4
  br label %21

; <label>:41:                                     ; preds = %21
  store i32 1, i32* %5, align 4
  br label %42

; <label>:42:                                     ; preds = %41, %32
  %43 = load i32, i32* %5, align 4
  ret i32 %43
}

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

declare void @TIFFError(i8*, i8*, ...) #1

declare i32 @TIFFTileRowSize(%struct.tiff*) #1

declare i32 @TIFFScanlineSize(%struct.tiff*) #1

declare i32 @TIFFFlushData1(%struct.tiff*) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
