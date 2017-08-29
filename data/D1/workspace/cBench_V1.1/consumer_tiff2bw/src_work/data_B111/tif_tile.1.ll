; ModuleID = 'tif_tile.ll'
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

@.str = private unnamed_addr constant [30 x i8] c"Col %ld out of range, max %lu\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Row %ld out of range, max %lu\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Depth %ld out of range, max %lu\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Sample %d out of range, max %u\00", align 1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFComputeTile(%struct.tiff* nocapture readonly, i32, i32, i32, i16 zeroext) local_unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %7 = load i32, i32* %6, align 4
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 1
  %. = select i1 %14, i32 0, i32 %3
  %15 = icmp eq i32 %7, -1
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %5
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %18 = load i32, i32* %17, align 8
  br label %19

; <label>:19:                                     ; preds = %16, %5
  %.04 = phi i32 [ %18, %16 ], [ %7, %5 ]
  %20 = icmp eq i32 %9, -1
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %19
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %23 = load i32, i32* %22, align 4
  br label %24

; <label>:24:                                     ; preds = %21, %19
  %.02 = phi i32 [ %23, %21 ], [ %9, %19 ]
  %25 = icmp eq i32 %11, -1
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %24
  %27 = load i32, i32* %12, align 8
  br label %28

; <label>:28:                                     ; preds = %26, %24
  %.01 = phi i32 [ %27, %26 ], [ %11, %24 ]
  %29 = icmp eq i32 %.04, 0
  %30 = icmp eq i32 %.02, 0
  %or.cond = or i1 %29, %30
  %31 = icmp eq i32 %.01, 0
  %or.cond5 = or i1 %or.cond, %31
  br i1 %or.cond5, label %65, label %32

; <label>:32:                                     ; preds = %28
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %34 = load i32, i32* %33, align 8
  %35 = add i32 %.04, -1
  %36 = add i32 %35, %34
  %37 = udiv i32 %36, %.04
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %39 = load i32, i32* %38, align 4
  %40 = add i32 %.02, -1
  %41 = add i32 %40, %39
  %42 = udiv i32 %41, %.02
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %44 = load i16, i16* %43, align 2
  %45 = icmp eq i16 %44, 2
  br i1 %45, label %46, label %57

; <label>:46:                                     ; preds = %32
  %47 = load i32, i32* %12, align 8
  %48 = add i32 %.01, -1
  %49 = add i32 %48, %47
  %50 = udiv i32 %49, %.01
  %51 = zext i16 %4 to i32
  %52 = mul i32 %50, %51
  %53 = udiv i32 %., %.01
  %54 = udiv i32 %2, %.02
  %55 = udiv i32 %1, %.04
  %tmp7 = add i32 %52, %53
  %tmp8 = mul i32 %tmp7, %42
  %tmp9 = add i32 %tmp8, %54
  %tmp10 = mul i32 %tmp9, %37
  %56 = add i32 %tmp10, %55
  br label %65

; <label>:57:                                     ; preds = %32
  %58 = udiv i32 %., %.01
  %59 = mul i32 %58, %42
  %60 = udiv i32 %2, %.02
  %61 = udiv i32 %1, %.04
  %62 = zext i16 %4 to i32
  %tmp = add i32 %60, %59
  %tmp6 = mul i32 %tmp, %37
  %63 = add i32 %61, %62
  %64 = add i32 %63, %tmp6
  br label %65

; <label>:65:                                     ; preds = %46, %57, %28
  %.1 = phi i32 [ 1, %28 ], [ %56, %46 ], [ %64, %57 ]
  ret i32 %.1
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFCheckTile(%struct.tiff* nocapture readonly, i32, i32, i32, i16 zeroext) local_unnamed_addr #1 {
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %7 = load i32, i32* %6, align 8
  %8 = icmp ugt i32 %7, %1
  br i1 %8, label %14, label %9

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = zext i32 %1 to i64
  %13 = zext i32 %7 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %11, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i64 0, i64 0), i64 %12, i64 %13) #4
  br label %45

; <label>:14:                                     ; preds = %5
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %16 = load i32, i32* %15, align 4
  %17 = icmp ugt i32 %16, %2
  br i1 %17, label %23, label %18

; <label>:18:                                     ; preds = %14
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %20 = load i8*, i8** %19, align 8
  %21 = zext i32 %2 to i64
  %22 = zext i32 %16 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %20, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0), i64 %21, i64 %22) #4
  br label %45

; <label>:23:                                     ; preds = %14
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  %25 = load i32, i32* %24, align 8
  %26 = icmp ugt i32 %25, %3
  br i1 %26, label %32, label %27

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = zext i32 %3 to i64
  %31 = zext i32 %25 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %29, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i64 %30, i64 %31) #4
  br label %45

; <label>:32:                                     ; preds = %23
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %34 = load i16, i16* %33, align 2
  %35 = icmp eq i16 %34, 2
  br i1 %35, label %36, label %45

; <label>:36:                                     ; preds = %32
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %38 = load i16, i16* %37, align 2
  %39 = icmp ugt i16 %38, %4
  br i1 %39, label %45, label %40

; <label>:40:                                     ; preds = %36
  %41 = zext i16 %38 to i32
  %42 = zext i16 %4 to i32
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %44 = load i8*, i8** %43, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %44, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i64 0, i64 0), i32 %42, i32 %41) #4
  br label %45

; <label>:45:                                     ; preds = %32, %36, %40, %27, %18, %9
  %.0 = phi i32 [ 0, %9 ], [ 0, %18 ], [ 0, %27 ], [ 0, %40 ], [ 1, %36 ], [ 1, %32 ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFNumberOfTiles(%struct.tiff* nocapture readonly) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %5 = load i32, i32* %4, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %3, -1
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %1
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %11 = load i32, i32* %10, align 8
  br label %12

; <label>:12:                                     ; preds = %9, %1
  %.02 = phi i32 [ %11, %9 ], [ %3, %1 ]
  %13 = icmp eq i32 %5, -1
  br i1 %13, label %14, label %17

; <label>:14:                                     ; preds = %12
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %16 = load i32, i32* %15, align 4
  br label %17

; <label>:17:                                     ; preds = %14, %12
  %.03 = phi i32 [ %16, %14 ], [ %5, %12 ]
  %18 = icmp eq i32 %7, -1
  br i1 %18, label %19, label %22

; <label>:19:                                     ; preds = %17
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  %21 = load i32, i32* %20, align 8
  br label %22

; <label>:22:                                     ; preds = %19, %17
  %.01 = phi i32 [ %21, %19 ], [ %7, %17 ]
  %23 = icmp eq i32 %.02, 0
  %24 = icmp eq i32 %.03, 0
  %or.cond = or i1 %23, %24
  %25 = icmp eq i32 %.01, 0
  %or.cond4 = or i1 %or.cond, %25
  br i1 %or.cond4, label %44, label %26

; <label>:26:                                     ; preds = %22
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %28 = load i32, i32* %27, align 8
  %29 = add i32 %.02, -1
  %30 = add i32 %29, %28
  %31 = udiv i32 %30, %.02
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %33 = load i32, i32* %32, align 4
  %34 = add i32 %.03, -1
  %35 = add i32 %34, %33
  %36 = udiv i32 %35, %.03
  %37 = mul i32 %36, %31
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  %39 = load i32, i32* %38, align 8
  %40 = add i32 %.01, -1
  %41 = add i32 %40, %39
  %42 = udiv i32 %41, %.01
  %43 = mul i32 %37, %42
  br label %44

; <label>:44:                                     ; preds = %22, %26
  %45 = phi i32 [ %43, %26 ], [ 0, %22 ]
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %47 = load i16, i16* %46, align 2
  %48 = icmp eq i16 %47, 2
  br i1 %48, label %49, label %54

; <label>:49:                                     ; preds = %44
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %51 = load i16, i16* %50, align 2
  %52 = zext i16 %51 to i32
  %53 = mul i32 %52, %45
  br label %54

; <label>:54:                                     ; preds = %49, %44
  %.0 = phi i32 [ %53, %49 ], [ %45, %44 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFTileRowSize(%struct.tiff* nocapture readonly) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %25, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %25, label %9

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %11 = load i16, i16* %10, align 4
  %12 = zext i16 %11 to i32
  %13 = mul i32 %12, %7
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %15 = load i16, i16* %14, align 2
  %16 = icmp eq i16 %15, 1
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %9
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = mul nsw i32 %20, %13
  br label %22

; <label>:22:                                     ; preds = %17, %9
  %.01 = phi i32 [ %21, %17 ], [ %13, %9 ]
  %23 = add i32 %.01, 7
  %24 = lshr i32 %23, 3
  br label %25

; <label>:25:                                     ; preds = %1, %5, %22
  %.0 = phi i32 [ %24, %22 ], [ 0, %5 ], [ 0, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFVTileSize(%struct.tiff* nocapture readonly, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %59, label %6

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %59, label %10

; <label>:10:                                     ; preds = %6
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  %12 = load i32, i32* %11, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %59, label %14

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %16 = load i16, i16* %15, align 2
  %17 = icmp eq i16 %16, 1
  br i1 %17, label %18, label %53

; <label>:18:                                     ; preds = %14
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %20 = load i16, i16* %19, align 2
  %21 = icmp eq i16 %20, 6
  br i1 %21, label %22, label %53

; <label>:22:                                     ; preds = %18
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %24 = load i32, i32* %23, align 8
  %25 = and i32 %24, 16384
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %53

; <label>:27:                                     ; preds = %22
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 0
  %29 = load i16, i16* %28, align 8
  %30 = zext i16 %29 to i32
  %31 = add i32 %8, -1
  %32 = add i32 %31, %30
  %33 = urem i32 %32, %30
  %34 = sub i32 %32, %33
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %36 = load i16, i16* %35, align 4
  %37 = zext i16 %36 to i32
  %38 = mul nsw i32 %34, %37
  %39 = add i32 %38, 7
  %40 = lshr i32 %39, 3
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 1
  %42 = load i16, i16* %41, align 2
  %43 = zext i16 %42 to i32
  %44 = mul nuw nsw i32 %43, %30
  %45 = add i32 %1, -1
  %46 = add i32 %45, %43
  %47 = urem i32 %46, %43
  %48 = sub i32 %46, %47
  %49 = mul i32 %48, %40
  %50 = udiv i32 %49, %44
  %51 = shl i32 %50, 1
  %52 = add i32 %49, %51
  br label %56

; <label>:53:                                     ; preds = %22, %18, %14
  %54 = tail call i32 @TIFFTileRowSize(%struct.tiff* nonnull %0)
  %55 = mul i32 %54, %1
  br label %56

; <label>:56:                                     ; preds = %53, %27
  %.01 = phi i32 [ %55, %53 ], [ %52, %27 ]
  %57 = load i32, i32* %11, align 4
  %58 = mul i32 %57, %.01
  br label %59

; <label>:59:                                     ; preds = %2, %6, %10, %56
  %.0 = phi i32 [ %58, %56 ], [ 0, %10 ], [ 0, %6 ], [ 0, %2 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFTileSize(%struct.tiff* nocapture readonly) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %3 = load i32, i32* %2, align 8
  %4 = tail call i32 @TIFFVTileSize(%struct.tiff* %0, i32 %3)
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFDefaultTileSize(%struct.tiff*, i32*, i32*) local_unnamed_addr #1 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 36
  %5 = load void (%struct.tiff*, i32*, i32*)*, void (%struct.tiff*, i32*, i32*)** %4, align 8
  tail call void %5(%struct.tiff* %0, i32* %1, i32* %2) #4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @_TIFFDefaultTileSize(%struct.tiff* nocapture readnone, i32* nocapture, i32* nocapture) local_unnamed_addr #3 {
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %4, 1
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %3
  store i32 256, i32* %1, align 4
  br label %7

; <label>:7:                                      ; preds = %6, %3
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %8, 1
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %7
  store i32 256, i32* %2, align 4
  br label %11

; <label>:11:                                     ; preds = %10, %7
  %12 = load i32, i32* %1, align 4
  %13 = and i32 %12, 15
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %18, label %15

; <label>:15:                                     ; preds = %11
  %16 = add i32 %12, 15
  %17 = and i32 %16, -16
  store i32 %17, i32* %1, align 4
  br label %18

; <label>:18:                                     ; preds = %11, %15
  %19 = load i32, i32* %2, align 4
  %20 = and i32 %19, 15
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %25, label %22

; <label>:22:                                     ; preds = %18
  %23 = add i32 %19, 15
  %24 = and i32 %23, -16
  store i32 %24, i32* %2, align 4
  br label %25

; <label>:25:                                     ; preds = %18, %22
  ret void
}

attributes #0 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
