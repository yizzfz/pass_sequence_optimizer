; ModuleID = 'tif_read.ll'
source_filename = "tif_read.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [33 x i8] c"%ld: Strip out of range, max %ld\00", align 1
@TIFFReadRawStrip.module = internal constant [17 x i8] c"TIFFReadRawStrip\00", align 16
@.str.1 = private unnamed_addr constant [33 x i8] c"%lu: Strip out of range, max %lu\00", align 1
@.str.2 = private unnamed_addr constant [41 x i8] c"%lu: Invalid strip byte count, strip %lu\00", align 1
@.str.3 = private unnamed_addr constant [32 x i8] c"%ld: Tile out of range, max %ld\00", align 1
@TIFFReadRawTile.module = internal constant [16 x i8] c"TIFFReadRawTile\00", align 16
@.str.4 = private unnamed_addr constant [32 x i8] c"%lu: Tile out of range, max %lu\00", align 1
@TIFFReadBufferSetup.module = internal constant [20 x i8] c"TIFFReadBufferSetup\00", align 16
@.str.5 = private unnamed_addr constant [45 x i8] c"%s: No space for data buffer at scanline %ld\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"(cc & 1) == 0\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"tif_read.c\00", align 1
@__PRETTY_FUNCTION__._TIFFSwab16BitData = private unnamed_addr constant [51 x i8] c"void _TIFFSwab16BitData(TIFF *, tidata_t, tsize_t)\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"(cc & 3) == 0\00", align 1
@__PRETTY_FUNCTION__._TIFFSwab32BitData = private unnamed_addr constant [51 x i8] c"void _TIFFSwab32BitData(TIFF *, tidata_t, tsize_t)\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"(cc & 7) == 0\00", align 1
@__PRETTY_FUNCTION__._TIFFSwab64BitData = private unnamed_addr constant [51 x i8] c"void _TIFFSwab64BitData(TIFF *, tidata_t, tsize_t)\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"%lu: Row out of range, max %lu\00", align 1
@.str.11 = private unnamed_addr constant [34 x i8] c"%lu: Sample out of range, max %lu\00", align 1
@.str.12 = private unnamed_addr constant [42 x i8] c"%s: Seek error at scanline %lu, strip %lu\00", align 1
@.str.13 = private unnamed_addr constant [60 x i8] c"%s: Read error at scanline %lu; got %lu bytes, expected %lu\00", align 1
@.str.14 = private unnamed_addr constant [71 x i8] c"%s: Read error at scanline %lu, strip %lu; got %lu bytes, expected %lu\00", align 1
@TIFFFillStrip.module = internal constant [14 x i8] c"TIFFFillStrip\00", align 1
@.str.15 = private unnamed_addr constant [57 x i8] c"%s: Read error on strip %lu; got %lu bytes, expected %lu\00", align 1
@.str.16 = private unnamed_addr constant [44 x i8] c"%s: Data buffer too small to hold strip %lu\00", align 1
@.str.17 = private unnamed_addr constant [45 x i8] c"%s: Seek error at row %ld, col %ld, tile %ld\00", align 1
@.str.18 = private unnamed_addr constant [64 x i8] c"%s: Read error at row %ld, col %ld; got %lu bytes, expected %lu\00", align 1
@.str.19 = private unnamed_addr constant [74 x i8] c"%s: Read error at row %ld, col %ld, tile %ld; got %lu bytes, expected %lu\00", align 1
@TIFFFillTile.module = internal constant [13 x i8] c"TIFFFillTile\00", align 1
@.str.20 = private unnamed_addr constant [39 x i8] c"%lu: Invalid tile byte count, tile %lu\00", align 1
@.str.21 = private unnamed_addr constant [43 x i8] c"%s: Data buffer too small to hold tile %ld\00", align 1
@.str.22 = private unnamed_addr constant [26 x i8] c"File not open for reading\00", align 1
@.str.23 = private unnamed_addr constant [41 x i8] c"Can not read tiles from a stripped image\00", align 1
@.str.24 = private unnamed_addr constant [42 x i8] c"Can not read scanlines from a tiled image\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadScanline(%struct.tiff*, i8*, i32, i16 zeroext) local_unnamed_addr #0 {
  %5 = tail call fastcc i32 @TIFFCheckRead(%struct.tiff* %0, i32 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %24, label %7

; <label>:7:                                      ; preds = %4
  %8 = tail call fastcc i32 @TIFFSeek(%struct.tiff* %0, i32 %2, i16 zeroext %3)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %24, label %10

; <label>:10:                                     ; preds = %7
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  %12 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %11, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  %14 = load i32, i32* %13, align 8
  %15 = tail call i32 %12(%struct.tiff* %0, i8* %1, i32 %14, i16 zeroext %3) #4
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %17 = load i32, i32* %16, align 8
  %18 = add i32 %17, 1
  store i32 %18, i32* %16, align 8
  %19 = icmp eq i32 %15, 0
  br i1 %19, label %24, label %20

; <label>:20:                                     ; preds = %10
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  %22 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %21, align 8
  %23 = load i32, i32* %13, align 8
  tail call void %22(%struct.tiff* nonnull %0, i8* %1, i32 %23) #4
  %phitmp = icmp sgt i32 %15, 0
  %phitmp2 = select i1 %phitmp, i32 1, i32 -1
  br label %24

; <label>:24:                                     ; preds = %7, %10, %20, %4
  %.0 = phi i32 [ -1, %4 ], [ -1, %7 ], [ -1, %10 ], [ %phitmp2, %20 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFCheckRead(%struct.tiff* nocapture readonly, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %8 = load i8*, i8** %7, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %8, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.22, i64 0, i64 0)) #4
  br label %19

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %11 = load i32, i32* %10, align 8
  %12 = lshr i32 %11, 10
  %.lobit = and i32 %12, 1
  %13 = icmp eq i32 %.lobit, %1
  br i1 %13, label %19, label %14

; <label>:14:                                     ; preds = %9
  %15 = icmp ne i32 %1, 0
  %16 = select i1 %15, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.23, i64 0, i64 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.24, i64 0, i64 0)
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %18 = load i8*, i8** %17, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %18, i8* %16) #4
  br label %19

; <label>:19:                                     ; preds = %9, %14, %6
  %.0 = phi i32 [ 0, %6 ], [ 0, %14 ], [ 1, %9 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFSeek(%struct.tiff*, i32, i16 zeroext) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp ugt i32 %5, %1
  br i1 %6, label %12, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %9 = load i8*, i8** %8, align 8
  %10 = zext i32 %1 to i64
  %11 = zext i32 %5 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %9, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.10, i64 0, i64 0), i64 %10, i64 %11) #4
  br label %63

; <label>:12:                                     ; preds = %3
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %14 = load i16, i16* %13, align 2
  %15 = icmp eq i16 %14, 2
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %18 = load i16, i16* %17, align 2
  %19 = icmp ugt i16 %18, %2
  br i1 %19, label %25, label %20

; <label>:20:                                     ; preds = %16
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8
  %23 = zext i16 %2 to i64
  %24 = zext i16 %18 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %22, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.11, i64 0, i64 0), i64 %23, i64 %24) #4
  br label %63

; <label>:25:                                     ; preds = %16
  %26 = zext i16 %2 to i32
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %28 = load i32, i32* %27, align 8
  %29 = mul i32 %28, %26
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %31 = load i32, i32* %30, align 4
  %32 = udiv i32 %1, %31
  %33 = add i32 %32, %29
  br label %38

; <label>:34:                                     ; preds = %12
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %36 = load i32, i32* %35, align 4
  %37 = udiv i32 %1, %36
  br label %38

; <label>:38:                                     ; preds = %34, %25
  %.01 = phi i32 [ %33, %25 ], [ %37, %34 ]
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  %40 = load i32, i32* %39, align 8
  %41 = icmp eq i32 %.01, %40
  br i1 %41, label %45, label %42

; <label>:42:                                     ; preds = %38
  %43 = tail call fastcc i32 @TIFFFillStrip(%struct.tiff* nonnull %0, i32 %.01)
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %63, label %52

; <label>:45:                                     ; preds = %38
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %47 = load i32, i32* %46, align 8
  %48 = icmp ugt i32 %47, %1
  br i1 %48, label %49, label %52

; <label>:49:                                     ; preds = %45
  %50 = tail call fastcc i32 @TIFFStartStrip(%struct.tiff* nonnull %0, i32 %.01)
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %63, label %52

; <label>:52:                                     ; preds = %45, %49, %42
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %54 = load i32, i32* %53, align 8
  %55 = icmp eq i32 %54, %1
  br i1 %55, label %63, label %56

; <label>:56:                                     ; preds = %52
  %57 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 33
  %58 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %57, align 8
  %59 = sub i32 %1, %54
  %60 = tail call i32 %58(%struct.tiff* nonnull %0, i32 %59) #4
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %63, label %62

; <label>:62:                                     ; preds = %56
  store i32 %1, i32* %53, align 8
  br label %63

; <label>:63:                                     ; preds = %62, %52, %56, %49, %42, %20, %7
  %.0 = phi i32 [ 0, %7 ], [ 0, %20 ], [ 0, %42 ], [ 0, %49 ], [ 0, %56 ], [ 1, %52 ], [ 1, %62 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadEncodedStrip(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = tail call fastcc i32 @TIFFCheckRead(%struct.tiff* %0, i32 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %48, label %7

; <label>:7:                                      ; preds = %4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %9 = load i32, i32* %8, align 4
  %10 = icmp ugt i32 %9, %1
  br i1 %10, label %16, label %11

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %13 = load i8*, i8** %12, align 8
  %14 = zext i32 %1 to i64
  %15 = zext i32 %9 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %13, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i64 0, i64 0), i64 %14, i64 %15) #4
  br label %48

; <label>:16:                                     ; preds = %7
  %17 = add i32 %9, -1
  %18 = icmp eq i32 %17, %1
  br i1 %18, label %19, label %26

; <label>:19:                                     ; preds = %16
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %23 = load i32, i32* %22, align 4
  %24 = urem i32 %21, %23
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %29

; <label>:26:                                     ; preds = %16, %19
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %28 = load i32, i32* %27, align 4
  br label %29

; <label>:29:                                     ; preds = %26, %19
  %.01 = phi i32 [ %28, %26 ], [ %24, %19 ]
  %30 = tail call i32 @TIFFVStripSize(%struct.tiff* nonnull %0, i32 %.01) #4
  %31 = icmp eq i32 %3, -1
  %32 = icmp slt i32 %30, %3
  %33 = or i1 %31, %32
  %.1 = select i1 %33, i32 %30, i32 %3
  %34 = tail call fastcc i32 @TIFFFillStrip(%struct.tiff* nonnull %0, i32 %1)
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %48, label %36

; <label>:36:                                     ; preds = %29
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  %38 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %37, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %40 = load i32, i32* %39, align 8
  %41 = udiv i32 %1, %40
  %42 = trunc i32 %41 to i16
  %43 = tail call i32 %38(%struct.tiff* nonnull %0, i8* %2, i32 %.1, i16 zeroext %42) #4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %48, label %45

; <label>:45:                                     ; preds = %36
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  %47 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %46, align 8
  tail call void %47(%struct.tiff* nonnull %0, i8* %2, i32 %.1) #4
  br label %48

; <label>:48:                                     ; preds = %29, %36, %4, %45, %11
  %.0 = phi i32 [ -1, %11 ], [ %.1, %45 ], [ -1, %4 ], [ -1, %36 ], [ -1, %29 ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

declare i32 @TIFFVStripSize(%struct.tiff*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFillStrip(%struct.tiff*, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %4 = load i32*, i32** %3, align 8
  %5 = zext i32 %1 to i64
  %6 = getelementptr inbounds i32, i32* %4, i64 %5
  %7 = load i32, i32* %6, align 4
  %8 = icmp slt i32 %7, 1
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = sext i32 %7 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %11, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.2, i64 0, i64 0), i64 %12, i64 %5) #4
  br label %98

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %15 = load i32, i32* %14, align 8
  %16 = and i32 %15, 2048
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %63, label %18

; <label>:18:                                     ; preds = %13
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %20 = load i16, i16* %19, align 2
  %21 = or i16 %20, 256
  %22 = zext i16 %21 to i32
  %23 = and i32 %22, %15
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %63, label %25

; <label>:25:                                     ; preds = %18
  %26 = load i32, i32* %14, align 8
  %27 = and i32 %26, 512
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %34, label %29

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %31 = load i8*, i8** %30, align 8
  %32 = icmp eq i8* %31, null
  br i1 %32, label %34, label %33

; <label>:33:                                     ; preds = %29
  tail call void @_TIFFfree(i8* nonnull %31) #4
  br label %34

; <label>:34:                                     ; preds = %29, %25, %33
  %35 = load i32, i32* %14, align 8
  %36 = and i32 %35, -513
  store i32 %36, i32* %14, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %38 = load i32*, i32** %37, align 8
  %39 = getelementptr inbounds i32, i32* %38, i64 %5
  %40 = load i32, i32* %39, align 4
  %41 = add nsw i32 %40, %7
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 45
  %43 = load i32, i32* %42, align 8
  %44 = icmp sgt i32 %41, %43
  br i1 %44, label %45, label %53

; <label>:45:                                     ; preds = %34
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %47 = load i8*, i8** %46, align 8
  %48 = sext i32 %43 to i64
  %49 = zext i32 %40 to i64
  %50 = sub nsw i64 %48, %49
  %51 = sext i32 %7 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @TIFFFillStrip.module, i64 0, i64 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.15, i64 0, i64 0), i8* %47, i64 %5, i64 %50, i64 %51) #4
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  store i32 -1, i32* %52, align 8
  br label %98

; <label>:53:                                     ; preds = %34
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  store i32 %7, i32* %54, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 44
  %56 = load i8*, i8** %55, align 8
  %57 = load i32*, i32** %37, align 8
  %58 = getelementptr inbounds i32, i32* %57, i64 %5
  %59 = load i32, i32* %58, align 4
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %56, i64 %60
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  store i8* %61, i8** %62, align 8
  br label %96

; <label>:63:                                     ; preds = %18, %13
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %65 = load i32, i32* %64, align 8
  %66 = icmp sgt i32 %7, %65
  br i1 %66, label %67, label %80

; <label>:67:                                     ; preds = %63
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  store i32 -1, i32* %68, align 8
  %69 = load i32, i32* %14, align 8
  %70 = and i32 %69, 512
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %75

; <label>:72:                                     ; preds = %67
  %73 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %74 = load i8*, i8** %73, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @TIFFFillStrip.module, i64 0, i64 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.16, i64 0, i64 0), i8* %74, i64 %5) #4
  br label %98

; <label>:75:                                     ; preds = %67
  %76 = add i32 %7, 1023
  %77 = and i32 %76, -1024
  %78 = tail call i32 @TIFFReadBufferSetup(%struct.tiff* nonnull %0, i8* null, i32 %77)
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %98, label %80

; <label>:80:                                     ; preds = %75, %63
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %82 = load i8*, i8** %81, align 8
  %83 = tail call fastcc i32 @TIFFReadRawStrip1(%struct.tiff* nonnull %0, i32 %1, i8* %82, i32 %7, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @TIFFFillStrip.module, i64 0, i64 0))
  %84 = icmp eq i32 %83, %7
  br i1 %84, label %85, label %98

; <label>:85:                                     ; preds = %80
  %86 = load i32, i32* %14, align 8
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %88 = load i16, i16* %87, align 2
  %89 = or i16 %88, 256
  %90 = zext i16 %89 to i32
  %91 = and i32 %86, %90
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %96

; <label>:93:                                     ; preds = %85
  %94 = sext i32 %7 to i64
  %95 = load i8*, i8** %81, align 8
  tail call void @TIFFReverseBits(i8* %95, i64 %94) #4
  br label %96

; <label>:96:                                     ; preds = %93, %85, %53
  %97 = tail call fastcc i32 @TIFFStartStrip(%struct.tiff* nonnull %0, i32 %1)
  br label %98

; <label>:98:                                     ; preds = %80, %75, %96, %72, %45, %9
  %.0 = phi i32 [ 0, %9 ], [ 0, %45 ], [ %97, %96 ], [ 0, %72 ], [ 0, %75 ], [ 0, %80 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRawStrip(%struct.tiff* nocapture readonly, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = tail call fastcc i32 @TIFFCheckRead(%struct.tiff* %0, i32 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %31, label %7

; <label>:7:                                      ; preds = %4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %9 = load i32, i32* %8, align 4
  %10 = icmp ugt i32 %9, %1
  br i1 %10, label %16, label %11

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %13 = load i8*, i8** %12, align 8
  %14 = zext i32 %1 to i64
  %15 = zext i32 %9 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %13, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i64 0, i64 0), i64 %14, i64 %15) #4
  br label %31

; <label>:16:                                     ; preds = %7
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %18 = load i32*, i32** %17, align 8
  %19 = zext i32 %1 to i64
  %20 = getelementptr inbounds i32, i32* %18, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = icmp slt i32 %21, 1
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %16
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %25 = load i8*, i8** %24, align 8
  %26 = sext i32 %21 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %25, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.2, i64 0, i64 0), i64 %26, i64 %19) #4
  br label %31

; <label>:27:                                     ; preds = %16
  %28 = icmp ne i32 %3, -1
  %29 = icmp sgt i32 %21, %3
  %or.cond = and i1 %28, %29
  %.01 = select i1 %or.cond, i32 %3, i32 %21
  %30 = tail call fastcc i32 @TIFFReadRawStrip1(%struct.tiff* nonnull %0, i32 %1, i8* %2, i32 %.01, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @TIFFReadRawStrip.module, i64 0, i64 0))
  br label %31

; <label>:31:                                     ; preds = %4, %27, %23, %11
  %.0 = phi i32 [ -1, %11 ], [ -1, %23 ], [ %30, %27 ], [ -1, %4 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFReadRawStrip1(%struct.tiff* nocapture readonly, i32, i8*, i32, i8*) unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %7 = load i32, i32* %6, align 8
  %8 = and i32 %7, 2048
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %45

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %12 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %11, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %14 = load i8*, i8** %13, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %16 = load i32*, i32** %15, align 8
  %17 = zext i32 %1 to i64
  %18 = getelementptr inbounds i32, i32* %16, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = tail call i32 %12(i8* %14, i32 %19, i32 0) #4
  %21 = load i32*, i32** %15, align 8
  %22 = getelementptr inbounds i32, i32* %21, i64 %17
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %20, %23
  br i1 %24, label %31, label %25

; <label>:25:                                     ; preds = %10
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %29 = load i32, i32* %28, align 8
  %30 = zext i32 %29 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %4, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.12, i64 0, i64 0), i8* %27, i64 %30, i64 %17) #4
  br label %70

; <label>:31:                                     ; preds = %10
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 49
  %33 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %32, align 8
  %34 = load i8*, i8** %13, align 8
  %35 = tail call i32 %33(i8* %34, i8* %2, i32 %3) #4
  %36 = icmp eq i32 %35, %3
  br i1 %36, label %70, label %37

; <label>:37:                                     ; preds = %31
  %38 = sext i32 %3 to i64
  %39 = sext i32 %35 to i64
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %42 = load i8*, i8** %41, align 8
  %43 = load i32, i32* %40, align 8
  %44 = zext i32 %43 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %4, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13, i64 0, i64 0), i8* %42, i64 %44, i64 %39, i64 %38) #4
  br label %70

; <label>:45:                                     ; preds = %5
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %47 = load i32*, i32** %46, align 8
  %48 = zext i32 %1 to i64
  %49 = getelementptr inbounds i32, i32* %47, i64 %48
  %50 = load i32, i32* %49, align 4
  %51 = add i32 %50, %3
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 45
  %53 = load i32, i32* %52, align 8
  %54 = icmp sgt i32 %51, %53
  br i1 %54, label %55, label %65

; <label>:55:                                     ; preds = %45
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %57 = load i8*, i8** %56, align 8
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %59 = load i32, i32* %58, align 8
  %60 = zext i32 %59 to i64
  %61 = sext i32 %53 to i64
  %62 = zext i32 %50 to i64
  %63 = sub nsw i64 %61, %62
  %64 = sext i32 %3 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %4, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.14, i64 0, i64 0), i8* %57, i64 %60, i64 %48, i64 %63, i64 %64) #4
  br label %70

; <label>:65:                                     ; preds = %45
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 44
  %67 = load i8*, i8** %66, align 8
  %68 = zext i32 %50 to i64
  %69 = getelementptr inbounds i8, i8* %67, i64 %68
  tail call void @_TIFFmemcpy(i8* %2, i8* %69, i32 %3) #4
  br label %70

; <label>:70:                                     ; preds = %65, %31, %55, %37, %25
  %.0 = phi i32 [ -1, %55 ], [ -1, %37 ], [ -1, %25 ], [ %3, %31 ], [ %3, %65 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadTile(%struct.tiff*, i8*, i32, i32, i32, i16 zeroext) local_unnamed_addr #0 {
  %7 = tail call fastcc i32 @TIFFCheckRead(%struct.tiff* %0, i32 1)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %15, label %9

; <label>:9:                                      ; preds = %6
  %10 = tail call i32 @TIFFCheckTile(%struct.tiff* %0, i32 %2, i32 %3, i32 %4, i16 zeroext %5) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %15, label %12

; <label>:12:                                     ; preds = %9
  %13 = tail call i32 @TIFFComputeTile(%struct.tiff* %0, i32 %2, i32 %3, i32 %4, i16 zeroext %5) #4
  %14 = tail call i32 @TIFFReadEncodedTile(%struct.tiff* %0, i32 %13, i8* %1, i32 -1)
  br label %15

; <label>:15:                                     ; preds = %6, %9, %12
  %.0 = phi i32 [ %14, %12 ], [ -1, %9 ], [ -1, %6 ]
  ret i32 %.0
}

declare i32 @TIFFCheckTile(%struct.tiff*, i32, i32, i32, i16 zeroext) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadEncodedTile(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 20
  %6 = load i32, i32* %5, align 4
  %7 = tail call fastcc i32 @TIFFCheckRead(%struct.tiff* %0, i32 1)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %36, label %9

; <label>:9:                                      ; preds = %4
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %11 = load i32, i32* %10, align 4
  %12 = icmp ugt i32 %11, %1
  br i1 %12, label %18, label %13

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %15 = load i8*, i8** %14, align 8
  %16 = zext i32 %1 to i64
  %17 = zext i32 %11 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %15, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i64 0, i64 0), i64 %16, i64 %17) #4
  br label %36

; <label>:18:                                     ; preds = %9
  %19 = icmp eq i32 %3, -1
  %20 = icmp slt i32 %6, %3
  %21 = or i1 %19, %20
  %.1 = select i1 %21, i32 %6, i32 %3
  %22 = tail call fastcc i32 @TIFFFillTile(%struct.tiff* nonnull %0, i32 %1)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %36, label %24

; <label>:24:                                     ; preds = %18
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  %26 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %25, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %28 = load i32, i32* %27, align 8
  %29 = udiv i32 %1, %28
  %30 = trunc i32 %29 to i16
  %31 = tail call i32 %26(%struct.tiff* nonnull %0, i8* %2, i32 %.1, i16 zeroext %30) #4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %36, label %33

; <label>:33:                                     ; preds = %24
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  %35 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %34, align 8
  tail call void %35(%struct.tiff* nonnull %0, i8* %2, i32 %.1) #4
  br label %36

; <label>:36:                                     ; preds = %18, %24, %4, %33, %13
  %.0 = phi i32 [ -1, %13 ], [ %.1, %33 ], [ -1, %4 ], [ -1, %24 ], [ -1, %18 ]
  ret i32 %.0
}

declare i32 @TIFFComputeTile(%struct.tiff*, i32, i32, i32, i16 zeroext) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFFillTile(%struct.tiff*, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %4 = load i32*, i32** %3, align 8
  %5 = zext i32 %1 to i64
  %6 = getelementptr inbounds i32, i32* %4, i64 %5
  %7 = load i32, i32* %6, align 4
  %8 = icmp slt i32 %7, 1
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = sext i32 %7 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %11, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.20, i64 0, i64 0), i64 %12, i64 %5) #4
  br label %92

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %15 = load i32, i32* %14, align 8
  %16 = and i32 %15, 2048
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %57, label %18

; <label>:18:                                     ; preds = %13
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %20 = load i16, i16* %19, align 2
  %21 = or i16 %20, 256
  %22 = zext i16 %21 to i32
  %23 = and i32 %22, %15
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %57, label %25

; <label>:25:                                     ; preds = %18
  %26 = load i32, i32* %14, align 8
  %27 = and i32 %26, 512
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %34, label %29

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %31 = load i8*, i8** %30, align 8
  %32 = icmp eq i8* %31, null
  br i1 %32, label %34, label %33

; <label>:33:                                     ; preds = %29
  tail call void @_TIFFfree(i8* nonnull %31) #4
  br label %34

; <label>:34:                                     ; preds = %29, %25, %33
  %35 = load i32, i32* %14, align 8
  %36 = and i32 %35, -513
  store i32 %36, i32* %14, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %38 = load i32*, i32** %37, align 8
  %39 = getelementptr inbounds i32, i32* %38, i64 %5
  %40 = load i32, i32* %39, align 4
  %41 = add i32 %40, %7
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 45
  %43 = load i32, i32* %42, align 8
  %44 = icmp sgt i32 %41, %43
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %34
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 19
  store i32 -1, i32* %46, align 8
  br label %92

; <label>:47:                                     ; preds = %34
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  store i32 %7, i32* %48, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 44
  %50 = load i8*, i8** %49, align 8
  %51 = load i32*, i32** %37, align 8
  %52 = getelementptr inbounds i32, i32* %51, i64 %5
  %53 = load i32, i32* %52, align 4
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8* %50, i64 %54
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  store i8* %55, i8** %56, align 8
  br label %90

; <label>:57:                                     ; preds = %18, %13
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %59 = load i32, i32* %58, align 8
  %60 = icmp sgt i32 %7, %59
  br i1 %60, label %61, label %74

; <label>:61:                                     ; preds = %57
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 19
  store i32 -1, i32* %62, align 8
  %63 = load i32, i32* %14, align 8
  %64 = and i32 %63, 512
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %69

; <label>:66:                                     ; preds = %61
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %68 = load i8*, i8** %67, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @TIFFFillTile.module, i64 0, i64 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.21, i64 0, i64 0), i8* %68, i64 %5) #4
  br label %92

; <label>:69:                                     ; preds = %61
  %70 = add i32 %7, 1023
  %71 = and i32 %70, -1024
  %72 = tail call i32 @TIFFReadBufferSetup(%struct.tiff* nonnull %0, i8* null, i32 %71)
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %92, label %74

; <label>:74:                                     ; preds = %69, %57
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %76 = load i8*, i8** %75, align 8
  %77 = tail call fastcc i32 @TIFFReadRawTile1(%struct.tiff* nonnull %0, i32 %1, i8* %76, i32 %7, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @TIFFFillTile.module, i64 0, i64 0))
  %78 = icmp eq i32 %77, %7
  br i1 %78, label %79, label %92

; <label>:79:                                     ; preds = %74
  %80 = load i32, i32* %14, align 8
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %82 = load i16, i16* %81, align 2
  %83 = or i16 %82, 256
  %84 = zext i16 %83 to i32
  %85 = and i32 %80, %84
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %90

; <label>:87:                                     ; preds = %79
  %88 = sext i32 %7 to i64
  %89 = load i8*, i8** %75, align 8
  tail call void @TIFFReverseBits(i8* %89, i64 %88) #4
  br label %90

; <label>:90:                                     ; preds = %87, %79, %47
  %91 = tail call fastcc i32 @TIFFStartTile(%struct.tiff* nonnull %0, i32 %1)
  br label %92

; <label>:92:                                     ; preds = %74, %69, %90, %66, %45, %9
  %.0 = phi i32 [ 0, %9 ], [ 0, %45 ], [ %91, %90 ], [ 0, %66 ], [ 0, %69 ], [ 0, %74 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRawTile(%struct.tiff* readonly, i32, i8*, i32) local_unnamed_addr #0 {
  %5 = tail call fastcc i32 @TIFFCheckRead(%struct.tiff* %0, i32 1)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %25, label %7

; <label>:7:                                      ; preds = %4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 43
  %9 = load i32, i32* %8, align 4
  %10 = icmp ugt i32 %9, %1
  br i1 %10, label %16, label %11

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %13 = load i8*, i8** %12, align 8
  %14 = zext i32 %1 to i64
  %15 = zext i32 %9 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %13, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0), i64 %14, i64 %15) #4
  br label %25

; <label>:16:                                     ; preds = %7
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %18 = load i32*, i32** %17, align 8
  %19 = zext i32 %1 to i64
  %20 = getelementptr inbounds i32, i32* %18, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = icmp ne i32 %3, -1
  %23 = icmp sgt i32 %21, %3
  %or.cond = and i1 %22, %23
  %.01 = select i1 %or.cond, i32 %3, i32 %21
  %24 = tail call fastcc i32 @TIFFReadRawTile1(%struct.tiff* nonnull %0, i32 %1, i8* %2, i32 %.01, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @TIFFReadRawTile.module, i64 0, i64 0))
  br label %25

; <label>:25:                                     ; preds = %4, %16, %11
  %.0 = phi i32 [ -1, %11 ], [ %24, %16 ], [ -1, %4 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFReadRawTile1(%struct.tiff* readonly, i32, i8*, i32, i8*) unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %7 = load i32, i32* %6, align 8
  %8 = and i32 %7, 2048
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %51

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %12 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %11, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %14 = load i8*, i8** %13, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %16 = load i32*, i32** %15, align 8
  %17 = zext i32 %1 to i64
  %18 = getelementptr inbounds i32, i32* %16, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = tail call i32 %12(i8* %14, i32 %19, i32 0) #4
  %21 = load i32*, i32** %15, align 8
  %22 = getelementptr inbounds i32, i32* %21, i64 %17
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %20, %23
  br i1 %24, label %34, label %25

; <label>:25:                                     ; preds = %10
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %29 = load i32, i32* %28, align 8
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 18
  %32 = load i32, i32* %31, align 4
  %33 = zext i32 %32 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %4, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.17, i64 0, i64 0), i8* %27, i64 %30, i64 %33, i64 %17) #4
  br label %79

; <label>:34:                                     ; preds = %10
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 49
  %36 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %35, align 8
  %37 = load i8*, i8** %13, align 8
  %38 = tail call i32 %36(i8* %37, i8* %2, i32 %3) #4
  %39 = icmp eq i32 %38, %3
  br i1 %39, label %79, label %40

; <label>:40:                                     ; preds = %34
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %42 = load i8*, i8** %41, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %44 = load i32, i32* %43, align 8
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 18
  %47 = load i32, i32* %46, align 4
  %48 = zext i32 %47 to i64
  %49 = sext i32 %38 to i64
  %50 = sext i32 %3 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %4, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.18, i64 0, i64 0), i8* %42, i64 %45, i64 %48, i64 %49, i64 %50) #4
  br label %79

; <label>:51:                                     ; preds = %5
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %53 = load i32*, i32** %52, align 8
  %54 = zext i32 %1 to i64
  %55 = getelementptr inbounds i32, i32* %53, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = add i32 %56, %3
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 45
  %59 = load i32, i32* %58, align 8
  %60 = icmp sgt i32 %57, %59
  br i1 %60, label %61, label %74

; <label>:61:                                     ; preds = %51
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %63 = load i8*, i8** %62, align 8
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %65 = load i32, i32* %64, align 8
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 18
  %68 = load i32, i32* %67, align 4
  %69 = zext i32 %68 to i64
  %70 = sext i32 %59 to i64
  %71 = zext i32 %56 to i64
  %72 = sub nsw i64 %70, %71
  %73 = sext i32 %3 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %4, i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.19, i64 0, i64 0), i8* %63, i64 %66, i64 %69, i64 %54, i64 %72, i64 %73) #4
  br label %79

; <label>:74:                                     ; preds = %51
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 44
  %76 = load i8*, i8** %75, align 8
  %77 = zext i32 %56 to i64
  %78 = getelementptr inbounds i8, i8* %76, i64 %77
  tail call void @_TIFFmemcpy(i8* %2, i8* %78, i32 %3) #4
  br label %79

; <label>:79:                                     ; preds = %74, %34, %61, %40, %25
  %.0 = phi i32 [ -1, %61 ], [ -1, %40 ], [ -1, %25 ], [ %3, %34 ], [ %3, %74 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadBufferSetup(%struct.tiff* nocapture, i8*, i32) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %5 = load i8*, i8** %4, align 8
  %6 = icmp eq i8* %5, null
  br i1 %6, label %14, label %7

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %9 = load i32, i32* %8, align 8
  %10 = and i32 %9, 512
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12:                                     ; preds = %7
  tail call void @_TIFFfree(i8* nonnull %5) #4
  br label %13

; <label>:13:                                     ; preds = %7, %12
  store i8* null, i8** %4, align 8
  br label %14

; <label>:14:                                     ; preds = %3, %13
  %15 = icmp eq i8* %1, null
  br i1 %15, label %21, label %16

; <label>:16:                                     ; preds = %14
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  store i32 %2, i32* %17, align 8
  store i8* %1, i8** %4, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %19 = load i32, i32* %18, align 8
  %20 = and i32 %19, -513
  store i32 %20, i32* %18, align 8
  br label %29

; <label>:21:                                     ; preds = %14
  %22 = add i32 %2, 1023
  %23 = and i32 %22, -1024
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  store i32 %23, i32* %24, align 8
  %25 = tail call i8* @_TIFFmalloc(i32 %23) #4
  store i8* %25, i8** %4, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %27 = load i32, i32* %26, align 8
  %28 = or i32 %27, 512
  store i32 %28, i32* %26, align 8
  br label %29

; <label>:29:                                     ; preds = %21, %16
  %30 = load i8*, i8** %4, align 8
  %31 = icmp eq i8* %30, null
  br i1 %31, label %32, label %39

; <label>:32:                                     ; preds = %29
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %34 = load i8*, i8** %33, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %36 = load i32, i32* %35, align 8
  %37 = zext i32 %36 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @TIFFReadBufferSetup.module, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i64 0, i64 0), i8* %34, i64 %37) #4
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  store i32 0, i32* %38, align 8
  br label %39

; <label>:39:                                     ; preds = %29, %32
  %.0 = phi i32 [ 0, %32 ], [ 1, %29 ]
  ret i32 %.0
}

declare void @_TIFFfree(i8*) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readnone uwtable
define void @_TIFFNoPostDecode(%struct.tiff* nocapture, i8* nocapture, i32) local_unnamed_addr #2 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @_TIFFSwab16BitData(%struct.tiff* nocapture readnone, i8*, i32) local_unnamed_addr #0 {
  %4 = and i32 %2, 1
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %3
  tail call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i32 608, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__PRETTY_FUNCTION__._TIFFSwab16BitData, i64 0, i64 0)) #5
  unreachable

; <label>:7:                                      ; preds = %3
  %8 = bitcast i8* %1 to i16*
  %9 = sdiv i32 %2, 2
  %10 = sext i32 %9 to i64
  tail call void @TIFFSwabArrayOfShort(i16* %8, i64 %10) #4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

declare void @TIFFSwabArrayOfShort(i16*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFSwab32BitData(%struct.tiff* nocapture readnone, i8*, i32) local_unnamed_addr #0 {
  %4 = and i32 %2, 3
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %3
  tail call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i32 616, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__PRETTY_FUNCTION__._TIFFSwab32BitData, i64 0, i64 0)) #5
  unreachable

; <label>:7:                                      ; preds = %3
  %8 = bitcast i8* %1 to i32*
  %9 = sdiv i32 %2, 4
  %10 = sext i32 %9 to i64
  tail call void @TIFFSwabArrayOfLong(i32* %8, i64 %10) #4
  ret void
}

declare void @TIFFSwabArrayOfLong(i32*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFSwab64BitData(%struct.tiff* nocapture readnone, i8*, i32) local_unnamed_addr #0 {
  %4 = and i32 %2, 7
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %3
  tail call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i32 624, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__PRETTY_FUNCTION__._TIFFSwab64BitData, i64 0, i64 0)) #5
  unreachable

; <label>:7:                                      ; preds = %3
  %8 = bitcast i8* %1 to double*
  %9 = sdiv i32 %2, 8
  %10 = sext i32 %9 to i64
  tail call void @TIFFSwabArrayOfDouble(double* %8, i64 %10) #4
  ret void
}

declare void @TIFFSwabArrayOfDouble(double*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFStartStrip(%struct.tiff*, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %4 = load i32, i32* %3, align 8
  %5 = and i32 %4, 32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %15

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  %9 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %8, align 8
  %10 = tail call i32 %9(%struct.tiff* nonnull %0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %41, label %12

; <label>:12:                                     ; preds = %7
  %13 = load i32, i32* %3, align 8
  %14 = or i32 %13, 32
  store i32 %14, i32* %3, align 8
  br label %15

; <label>:15:                                     ; preds = %12, %2
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  store i32 %1, i32* %16, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %18 = load i32, i32* %17, align 8
  %19 = urem i32 %1, %18
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %21 = load i32, i32* %20, align 4
  %22 = mul i32 %21, %19
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 %22, i32* %23, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %25 = bitcast i8** %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %28 = bitcast i8** %27 to i64*
  store i64 %26, i64* %28, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %30 = load i32*, i32** %29, align 8
  %31 = zext i32 %1 to i64
  %32 = getelementptr inbounds i32, i32* %30, i64 %31
  %33 = load i32, i32* %32, align 4
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  store i32 %33, i32* %34, align 8
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 22
  %36 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %35, align 8
  %37 = load i32, i32* %17, align 8
  %38 = udiv i32 %1, %37
  %39 = trunc i32 %38 to i16
  %40 = tail call i32 %36(%struct.tiff* nonnull %0, i16 zeroext %39) #4
  br label %41

; <label>:41:                                     ; preds = %7, %15
  %.0 = phi i32 [ %40, %15 ], [ 0, %7 ]
  ret i32 %.0
}

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #1

declare void @TIFFReverseBits(i8*, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFStartTile(%struct.tiff*, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %4 = load i32, i32* %3, align 8
  %5 = and i32 %4, 32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %15

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  %9 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %8, align 8
  %10 = tail call i32 %9(%struct.tiff* nonnull %0) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %56, label %12

; <label>:12:                                     ; preds = %7
  %13 = load i32, i32* %3, align 8
  %14 = or i32 %13, 32
  store i32 %14, i32* %3, align 8
  br label %15

; <label>:15:                                     ; preds = %12, %2
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 19
  store i32 %1, i32* %16, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %18 = load i32, i32* %17, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %20 = load i32, i32* %19, align 4
  %21 = add i32 %18, -1
  %22 = add i32 %21, %20
  %23 = udiv i32 %22, %20
  %24 = urem i32 %1, %23
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %26 = load i32, i32* %25, align 8
  %27 = mul i32 %26, %24
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 %27, i32* %28, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %30 = load i32, i32* %29, align 4
  %31 = add i32 %26, -1
  %32 = add i32 %31, %30
  %33 = udiv i32 %32, %26
  %34 = urem i32 %1, %33
  %35 = load i32, i32* %19, align 4
  %36 = mul i32 %35, %34
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 18
  store i32 %36, i32* %37, align 4
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %39 = bitcast i8** %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %42 = bitcast i8** %41 to i64*
  store i64 %40, i64* %42, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %44 = load i32*, i32** %43, align 8
  %45 = zext i32 %1 to i64
  %46 = getelementptr inbounds i32, i32* %44, i64 %45
  %47 = load i32, i32* %46, align 4
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  store i32 %47, i32* %48, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 22
  %50 = load i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*, i16)** %49, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %52 = load i32, i32* %51, align 8
  %53 = udiv i32 %1, %52
  %54 = trunc i32 %53 to i16
  %55 = tail call i32 %50(%struct.tiff* nonnull %0, i16 zeroext %54) #4
  br label %56

; <label>:56:                                     ; preds = %7, %15
  %.0 = phi i32 [ %55, %15 ], [ 0, %7 ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
