; ModuleID = 'tif_dir.ll'
source_filename = "tif_dir.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@_TIFFextender = internal unnamed_addr global void (%struct.tiff*)* null, align 8
@TIFFUnlinkDirectory.module = internal constant [20 x i8] c"TIFFUnlinkDirectory\00", align 16
@.str = private unnamed_addr constant [43 x i8] c"Can not unlink directory in read-only file\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Directory %d does not exist\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Error writing directory link\00", align 1
@TIFFReassignTagToIgnore.TIFFignoretags = internal unnamed_addr global [95 x i32] zeroinitializer, align 16
@TIFFReassignTagToIgnore.tagcount = internal unnamed_addr global i32 0, align 4
@.str.3 = private unnamed_addr constant [13 x i8] c"TIFFSetField\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"%s: Unknown %stag %u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"pseudo-\00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.7 = private unnamed_addr constant [41 x i8] c"%s: Cannot modify tag \22%s\22 while writing\00", align 1
@.str.8 = private unnamed_addr constant [69 x i8] c"LZW compression no longer supported due to Unisys patent enforcement\00", align 1
@.str.9 = private unnamed_addr constant [35 x i8] c"Bad value %ld for \22%s\22 tag ignored\00", align 1
@.str.10 = private unnamed_addr constant [40 x i8] c"Nonstandard tile width %d, convert file\00", align 1
@.str.11 = private unnamed_addr constant [41 x i8] c"Nonstandard tile length %d, convert file\00", align 1
@.str.12 = private unnamed_addr constant [27 x i8] c"Sorry, cannot nest SubIFDs\00", align 1
@.str.13 = private unnamed_addr constant [48 x i8] c"%s: Invalid %stag \22%s\22 (not supported by codec)\00", align 1
@.str.14 = private unnamed_addr constant [8 x i8] c"pseduo-\00", align 1
@.str.15 = private unnamed_addr constant [23 x i8] c"%d: Bad value for \22%s\22\00", align 1
@.str.16 = private unnamed_addr constant [24 x i8] c"%ld: Bad value for \22%s\22\00", align 1
@.str.17 = private unnamed_addr constant [23 x i8] c"%f: Bad value for \22%s\22\00", align 1
@.str.18 = private unnamed_addr constant [57 x i8] c"%s: Invalid InkNames value; expecting %d names, found %d\00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"TIFFGetField\00", align 1
@TIFFAdvanceDirectory.module = internal constant [21 x i8] c"TIFFAdvanceDirectory\00", align 16
@.str.20 = private unnamed_addr constant [35 x i8] c"%s: Error fetching directory count\00", align 1
@.str.21 = private unnamed_addr constant [34 x i8] c"%s: Error fetching directory link\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFsetByteArray(i8** nocapture, i8*, i64) local_unnamed_addr #0 {
  %4 = load i8*, i8** %0, align 8
  %5 = icmp eq i8* %4, null
  br i1 %5, label %7, label %6

; <label>:6:                                      ; preds = %3
  tail call void @_TIFFfree(i8* nonnull %4) #3
  store i8* null, i8** %0, align 8
  br label %7

; <label>:7:                                      ; preds = %3, %6
  %8 = icmp eq i8* %1, null
  br i1 %8, label %14, label %9

; <label>:9:                                      ; preds = %7
  %10 = trunc i64 %2 to i32
  %11 = tail call i8* @_TIFFmalloc(i32 %10) #3
  store i8* %11, i8** %0, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %14, label %13

; <label>:13:                                     ; preds = %9
  tail call void @_TIFFmemcpy(i8* nonnull %11, i8* nonnull %1, i32 %10) #3
  br label %14

; <label>:14:                                     ; preds = %9, %7, %13
  ret void
}

declare void @_TIFFfree(i8*) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFsetString(i8** nocapture, i8*) local_unnamed_addr #0 {
  %3 = tail call i64 @strlen(i8* %1) #6
  %4 = add i64 %3, 1
  tail call void @_TIFFsetByteArray(i8** %0, i8* %1, i64 %4)
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @_TIFFsetNString(i8** nocapture, i8*, i64) local_unnamed_addr #0 {
  tail call void @_TIFFsetByteArray(i8** %0, i8* %1, i64 %2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @_TIFFsetShortArray(i16** nocapture, i16*, i64) local_unnamed_addr #0 {
  %4 = bitcast i16** %0 to i8**
  %5 = bitcast i16* %1 to i8*
  %6 = shl i64 %2, 1
  tail call void @_TIFFsetByteArray(i8** %4, i8* %5, i64 %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @_TIFFsetLongArray(i32** nocapture, i32*, i64) local_unnamed_addr #0 {
  %4 = bitcast i32** %0 to i8**
  %5 = bitcast i32* %1 to i8*
  %6 = shl i64 %2, 2
  tail call void @_TIFFsetByteArray(i8** %4, i8* %5, i64 %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @_TIFFsetFloatArray(float** nocapture, float*, i64) local_unnamed_addr #0 {
  %4 = bitcast float** %0 to i8**
  %5 = bitcast float* %1 to i8*
  %6 = shl i64 %2, 2
  tail call void @_TIFFsetByteArray(i8** %4, i8* %5, i64 %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @_TIFFsetDoubleArray(double** nocapture, double*, i64) local_unnamed_addr #0 {
  %4 = bitcast double** %0 to i8**
  %5 = bitcast double* %1 to i8*
  %6 = shl i64 %2, 3
  tail call void @_TIFFsetByteArray(i8** %4, i8* %5, i64 %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.va_start(i8* nonnull %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  %6 = call i32 @TIFFVSetField(%struct.tiff* %0, i32 %1, %struct.__va_list_tag* nonnull %5)
  call void @llvm.va_end(i8* nonnull %4)
  ret i32 %6
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #3

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFVSetField(%struct.tiff*, i32, %struct.__va_list_tag*) local_unnamed_addr #0 {
  %4 = tail call fastcc i32 @OkToChangeTag(%struct.tiff* %0, i32 %1)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %10, label %6

; <label>:6:                                      ; preds = %3
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 57
  %8 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %7, align 8
  %9 = tail call i32 %8(%struct.tiff* %0, i32 %1, %struct.__va_list_tag* %2) #3
  br label %10

; <label>:10:                                     ; preds = %3, %6
  %11 = phi i32 [ %9, %6 ], [ 0, %3 ]
  ret i32 %11
}

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @OkToChangeTag(%struct.tiff*, i32) unnamed_addr #0 {
  %3 = tail call %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff* %0, i32 %1, i32 0) #3
  %4 = icmp eq %struct.TIFFFieldInfo* %3, null
  br i1 %4, label %5, label %10

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = icmp ugt i32 %1, 65535
  %9 = select i1 %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0)
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0), i8* %7, i8* %9, i32 %1) #3
  br label %26

; <label>:10:                                     ; preds = %2
  %11 = icmp eq i32 %1, 257
  br i1 %11, label %26, label %12

; <label>:12:                                     ; preds = %10
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = and i32 %14, 64
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %26, label %17

; <label>:17:                                     ; preds = %12
  %18 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %3, i64 0, i32 5
  %19 = load i8, i8* %18, align 2
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %21, label %26

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %3, i64 0, i32 7
  %25 = load i8*, i8** %24, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i64 0, i64 0), i8* %23, i8* %25) #3
  br label %26

; <label>:26:                                     ; preds = %10, %12, %17, %21, %5
  %.0 = phi i32 [ 0, %21 ], [ 0, %5 ], [ 1, %17 ], [ 1, %12 ], [ 1, %10 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFGetField(%struct.tiff*, i32, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.va_start(i8* nonnull %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  %6 = call i32 @TIFFVGetField(%struct.tiff* %0, i32 %1, %struct.__va_list_tag* nonnull %5)
  call void @llvm.va_end(i8* nonnull %4)
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) local_unnamed_addr #0 {
  %4 = tail call %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff* %0, i32 %1, i32 0) #3
  %5 = icmp eq %struct.TIFFFieldInfo* %4, null
  br i1 %5, label %23, label %6

; <label>:6:                                      ; preds = %3
  %7 = icmp ugt i32 %1, 65535
  br i1 %7, label %19, label %8

; <label>:8:                                      ; preds = %6
  %9 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %4, i64 0, i32 4
  %10 = load i16, i16* %9, align 4
  %div = lshr i16 %10, 5
  %11 = zext i16 %div to i64
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 %11
  %13 = load i64, i64* %12, align 8
  %14 = and i16 %10, 31
  %15 = zext i16 %14 to i64
  %16 = shl i64 1, %15
  %17 = and i64 %16, %13
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %23, label %19

; <label>:19:                                     ; preds = %8, %6
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 58
  %21 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %20, align 8
  %22 = tail call i32 %21(%struct.tiff* %0, i32 %1, %struct.__va_list_tag* %2) #3
  br label %23

; <label>:23:                                     ; preds = %3, %8, %19
  %24 = phi i32 [ %22, %19 ], [ 0, %8 ], [ 0, %3 ]
  ret i32 %24
}

declare %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff*, i32, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @TIFFFreeDirectory(%struct.tiff*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 0
  %3 = load i16*, i16** %2, align 8
  %4 = icmp eq i16* %3, null
  br i1 %4, label %8, label %5

; <label>:5:                                      ; preds = %1
  %6 = bitcast i16** %2 to i8**
  %7 = load i8*, i8** %6, align 8
  tail call void @_TIFFfree(i8* %7) #3
  store i16* null, i16** %2, align 8
  br label %8

; <label>:8:                                      ; preds = %1, %5
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 1
  %10 = load i16*, i16** %9, align 8
  %11 = icmp eq i16* %10, null
  br i1 %11, label %15, label %12

; <label>:12:                                     ; preds = %8
  %13 = bitcast i16** %9 to i8**
  %14 = load i8*, i8** %13, align 8
  tail call void @_TIFFfree(i8* %14) #3
  store i16* null, i16** %9, align 8
  br label %15

; <label>:15:                                     ; preds = %8, %12
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 2
  %17 = load i16*, i16** %16, align 8
  %18 = icmp eq i16* %17, null
  br i1 %18, label %22, label %19

; <label>:19:                                     ; preds = %15
  %20 = bitcast i16** %16 to i8**
  %21 = load i8*, i8** %20, align 8
  tail call void @_TIFFfree(i8* %21) #3
  store i16* null, i16** %16, align 8
  br label %22

; <label>:22:                                     ; preds = %15, %19
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 33
  %24 = load i8*, i8** %23, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %27, label %26

; <label>:26:                                     ; preds = %22
  tail call void @_TIFFfree(i8* nonnull %24) #3
  store i8* null, i8** %23, align 8
  br label %27

; <label>:27:                                     ; preds = %22, %26
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 34
  %29 = load i8*, i8** %28, align 8
  %30 = icmp eq i8* %29, null
  br i1 %30, label %32, label %31

; <label>:31:                                     ; preds = %27
  tail call void @_TIFFfree(i8* nonnull %29) #3
  store i8* null, i8** %28, align 8
  br label %32

; <label>:32:                                     ; preds = %27, %31
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 35
  %34 = load i8*, i8** %33, align 8
  %35 = icmp eq i8* %34, null
  br i1 %35, label %37, label %36

; <label>:36:                                     ; preds = %32
  tail call void @_TIFFfree(i8* nonnull %34) #3
  store i8* null, i8** %33, align 8
  br label %37

; <label>:37:                                     ; preds = %32, %36
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 36
  %39 = load i8*, i8** %38, align 8
  %40 = icmp eq i8* %39, null
  br i1 %40, label %42, label %41

; <label>:41:                                     ; preds = %37
  tail call void @_TIFFfree(i8* nonnull %39) #3
  store i8* null, i8** %38, align 8
  br label %42

; <label>:42:                                     ; preds = %37, %41
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 37
  %44 = load i8*, i8** %43, align 8
  %45 = icmp eq i8* %44, null
  br i1 %45, label %47, label %46

; <label>:46:                                     ; preds = %42
  tail call void @_TIFFfree(i8* nonnull %44) #3
  store i8* null, i8** %43, align 8
  br label %47

; <label>:47:                                     ; preds = %42, %46
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 38
  %49 = load i8*, i8** %48, align 8
  %50 = icmp eq i8* %49, null
  br i1 %50, label %52, label %51

; <label>:51:                                     ; preds = %47
  tail call void @_TIFFfree(i8* nonnull %49) #3
  store i8* null, i8** %48, align 8
  br label %52

; <label>:52:                                     ; preds = %47, %51
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 39
  %54 = load i8*, i8** %53, align 8
  %55 = icmp eq i8* %54, null
  br i1 %55, label %57, label %56

; <label>:56:                                     ; preds = %52
  tail call void @_TIFFfree(i8* nonnull %54) #3
  store i8* null, i8** %53, align 8
  br label %57

; <label>:57:                                     ; preds = %52, %56
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 40
  %59 = load i8*, i8** %58, align 8
  %60 = icmp eq i8* %59, null
  br i1 %60, label %62, label %61

; <label>:61:                                     ; preds = %57
  tail call void @_TIFFfree(i8* nonnull %59) #3
  store i8* null, i8** %58, align 8
  br label %62

; <label>:62:                                     ; preds = %57, %61
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 41
  %64 = load i8*, i8** %63, align 8
  %65 = icmp eq i8* %64, null
  br i1 %65, label %67, label %66

; <label>:66:                                     ; preds = %62
  tail call void @_TIFFfree(i8* nonnull %64) #3
  store i8* null, i8** %63, align 8
  br label %67

; <label>:67:                                     ; preds = %62, %66
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 31
  %69 = load i16*, i16** %68, align 8
  %70 = icmp eq i16* %69, null
  br i1 %70, label %74, label %71

; <label>:71:                                     ; preds = %67
  %72 = bitcast i16** %68 to i8**
  %73 = load i8*, i8** %72, align 8
  tail call void @_TIFFfree(i8* %73) #3
  store i16* null, i16** %68, align 8
  br label %74

; <label>:74:                                     ; preds = %67, %71
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 47
  %76 = load i32*, i32** %75, align 8
  %77 = icmp eq i32* %76, null
  br i1 %77, label %81, label %78

; <label>:78:                                     ; preds = %74
  %79 = bitcast i32** %75 to i8**
  %80 = load i8*, i8** %79, align 8
  tail call void @_TIFFfree(i8* %80) #3
  store i32* null, i32** %75, align 8
  br label %81

; <label>:81:                                     ; preds = %74, %78
  %82 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 48
  %83 = load float*, float** %82, align 8
  %84 = icmp eq float* %83, null
  br i1 %84, label %88, label %85

; <label>:85:                                     ; preds = %81
  %86 = bitcast float** %82 to i8**
  %87 = load i8*, i8** %86, align 8
  tail call void @_TIFFfree(i8* %87) #3
  store float* null, float** %82, align 8
  br label %88

; <label>:88:                                     ; preds = %81, %85
  %89 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 59
  %90 = load i8*, i8** %89, align 8
  %91 = icmp eq i8* %90, null
  br i1 %91, label %93, label %92

; <label>:92:                                     ; preds = %88
  tail call void @_TIFFfree(i8* nonnull %90) #3
  store i8* null, i8** %89, align 8
  br label %93

; <label>:93:                                     ; preds = %88, %92
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 60
  %95 = load i8*, i8** %94, align 8
  %96 = icmp eq i8* %95, null
  br i1 %96, label %98, label %97

; <label>:97:                                     ; preds = %93
  tail call void @_TIFFfree(i8* nonnull %95) #3
  store i8* null, i8** %94, align 8
  br label %98

; <label>:98:                                     ; preds = %93, %97
  %99 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 51
  %100 = load float*, float** %99, align 8
  %101 = icmp eq float* %100, null
  br i1 %101, label %105, label %102

; <label>:102:                                    ; preds = %98
  %103 = bitcast float** %99 to i8**
  %104 = load i8*, i8** %103, align 8
  tail call void @_TIFFfree(i8* %104) #3
  store float* null, float** %99, align 8
  br label %105

; <label>:105:                                    ; preds = %98, %102
  %106 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 52
  %107 = load float*, float** %106, align 8
  %108 = icmp eq float* %107, null
  br i1 %108, label %112, label %109

; <label>:109:                                    ; preds = %105
  %110 = bitcast float** %106 to i8**
  %111 = load i8*, i8** %110, align 8
  tail call void @_TIFFfree(i8* %111) #3
  store float* null, float** %106, align 8
  br label %112

; <label>:112:                                    ; preds = %105, %109
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 53
  %114 = load float*, float** %113, align 8
  %115 = icmp eq float* %114, null
  br i1 %115, label %119, label %116

; <label>:116:                                    ; preds = %112
  %117 = bitcast float** %113 to i8**
  %118 = load i8*, i8** %117, align 8
  tail call void @_TIFFfree(i8* %118) #3
  store float* null, float** %113, align 8
  br label %119

; <label>:119:                                    ; preds = %112, %116
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 0
  %121 = load i16*, i16** %120, align 8
  %122 = icmp eq i16* %121, null
  br i1 %122, label %126, label %123

; <label>:123:                                    ; preds = %119
  %124 = bitcast i16** %120 to i8**
  %125 = load i8*, i8** %124, align 8
  tail call void @_TIFFfree(i8* %125) #3
  store i16* null, i16** %120, align 8
  br label %126

; <label>:126:                                    ; preds = %119, %123
  %127 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 1
  %128 = load i16*, i16** %127, align 8
  %129 = icmp eq i16* %128, null
  br i1 %129, label %133, label %130

; <label>:130:                                    ; preds = %126
  %131 = bitcast i16** %127 to i8**
  %132 = load i8*, i8** %131, align 8
  tail call void @_TIFFfree(i8* %132) #3
  store i16* null, i16** %127, align 8
  br label %133

; <label>:133:                                    ; preds = %126, %130
  %134 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 2
  %135 = load i16*, i16** %134, align 8
  %136 = icmp eq i16* %135, null
  br i1 %136, label %140, label %137

; <label>:137:                                    ; preds = %133
  %138 = bitcast i16** %134 to i8**
  %139 = load i8*, i8** %138, align 8
  tail call void @_TIFFfree(i8* %139) #3
  store i16* null, i16** %134, align 8
  br label %140

; <label>:140:                                    ; preds = %133, %137
  %141 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 62
  %142 = load i8*, i8** %141, align 8
  %143 = icmp eq i8* %142, null
  br i1 %143, label %145, label %144

; <label>:144:                                    ; preds = %140
  tail call void @_TIFFfree(i8* nonnull %142) #3
  store i8* null, i8** %141, align 8
  br label %145

; <label>:145:                                    ; preds = %140, %144
  %146 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 64
  %147 = load i8*, i8** %146, align 8
  %148 = icmp eq i8* %147, null
  br i1 %148, label %150, label %149

; <label>:149:                                    ; preds = %145
  tail call void @_TIFFfree(i8* nonnull %147) #3
  store i8* null, i8** %146, align 8
  br label %150

; <label>:150:                                    ; preds = %145, %149
  %151 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 66
  %152 = load i8*, i8** %151, align 8
  %153 = icmp eq i8* %152, null
  br i1 %153, label %155, label %154

; <label>:154:                                    ; preds = %150
  tail call void @_TIFFfree(i8* nonnull %152) #3
  store i8* null, i8** %151, align 8
  br label %155

; <label>:155:                                    ; preds = %150, %154
  %156 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %157 = load i32*, i32** %156, align 8
  %158 = icmp eq i32* %157, null
  br i1 %158, label %162, label %159

; <label>:159:                                    ; preds = %155
  %160 = bitcast i32** %156 to i8**
  %161 = load i8*, i8** %160, align 8
  tail call void @_TIFFfree(i8* %161) #3
  store i32* null, i32** %156, align 8
  br label %162

; <label>:162:                                    ; preds = %155, %159
  %163 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %164 = load i32*, i32** %163, align 8
  %165 = icmp eq i32* %164, null
  br i1 %165, label %169, label %166

; <label>:166:                                    ; preds = %162
  %167 = bitcast i32** %163 to i8**
  %168 = load i8*, i8** %167, align 8
  tail call void @_TIFFfree(i8* %168) #3
  store i32* null, i32** %163, align 8
  br label %169

; <label>:169:                                    ; preds = %162, %166
  %170 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 69
  %171 = load i8*, i8** %170, align 8
  %172 = icmp eq i8* %171, null
  br i1 %172, label %174, label %173

; <label>:173:                                    ; preds = %169
  tail call void @_TIFFfree(i8* nonnull %171) #3
  store i8* null, i8** %170, align 8
  br label %174

; <label>:174:                                    ; preds = %169, %173
  %175 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 70
  %176 = load i8*, i8** %175, align 8
  %177 = icmp eq i8* %176, null
  br i1 %177, label %179, label %178

; <label>:178:                                    ; preds = %174
  tail call void @_TIFFfree(i8* nonnull %176) #3
  store i8* null, i8** %175, align 8
  br label %179

; <label>:179:                                    ; preds = %174, %178
  %180 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 72
  %181 = load float*, float** %180, align 8
  %182 = icmp eq float* %181, null
  br i1 %182, label %186, label %183

; <label>:183:                                    ; preds = %179
  %184 = bitcast float** %180 to i8**
  %185 = load i8*, i8** %184, align 8
  tail call void @_TIFFfree(i8* %185) #3
  store float* null, float** %180, align 8
  br label %186

; <label>:186:                                    ; preds = %179, %183
  %187 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 73
  %188 = load float*, float** %187, align 8
  %189 = icmp eq float* %188, null
  br i1 %189, label %193, label %190

; <label>:190:                                    ; preds = %186
  %191 = bitcast float** %187 to i8**
  %192 = load i8*, i8** %191, align 8
  tail call void @_TIFFfree(i8* %192) #3
  store float* null, float** %187, align 8
  br label %193

; <label>:193:                                    ; preds = %186, %190
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void (%struct.tiff*)* @TIFFSetTagExtender(void (%struct.tiff*)*) local_unnamed_addr #4 {
  %2 = load void (%struct.tiff*)*, void (%struct.tiff*)** @_TIFFextender, align 8
  store void (%struct.tiff*)* %0, void (%struct.tiff*)** @_TIFFextender, align 8
  ret void (%struct.tiff*)* %2
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFDefaultDirectory(%struct.tiff*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6
  tail call void @_TIFFSetupFieldInfo(%struct.tiff* %0) #3
  %3 = bitcast %struct.TIFFDirectory* %2 to i8*
  tail call void @_TIFFmemset(i8* %3, i32 0, i32 472) #3
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  store i16 1, i16* %4, align 2
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  store i16 1, i16* %5, align 4
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 12
  store i16 1, i16* %6, align 4
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 14
  store i16 1, i16* %7, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  store i16 1, i16* %8, align 2
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  store i32 -1, i32* %9, align 4
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  store i32 -1, i32* %10, align 4
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  store i32 -1, i32* %11, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  store i32 1, i32* %12, align 4
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 23
  store i16 2, i16* %13, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  store i16 4, i16* %14, align 2
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  store i32 1, i32* %15, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 0
  store i16 2, i16* %16, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 1
  store i16 2, i16* %17, align 2
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 50
  store i16 1, i16* %18, align 4
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 55
  store i16 1, i16* %19, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 56
  store i16 4, i16* %20, align 2
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFNoPostDecode, void (%struct.tiff*, i8*, i32)** %21, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 57
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @_TIFFVSetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %22, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 58
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @_TIFFVGetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %23, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 59
  store void (%struct.tiff*, %struct._IO_FILE*, i64)* null, void (%struct.tiff*, %struct._IO_FILE*, i64)** %24, align 8
  %25 = load void (%struct.tiff*)*, void (%struct.tiff*)** @_TIFFextender, align 8
  %26 = icmp eq void (%struct.tiff*)* %25, null
  br i1 %26, label %28, label %27

; <label>:27:                                     ; preds = %1
  tail call void %25(%struct.tiff* nonnull %0) #3
  br label %28

; <label>:28:                                     ; preds = %1, %27
  %29 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 259, i32 1)
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %31 = load i32, i32* %30, align 8
  %32 = and i32 %31, -9
  store i32 %32, i32* %30, align 8
  ret i32 1
}

declare void @_TIFFSetupFieldInfo(%struct.tiff*) local_unnamed_addr #1

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #1

declare void @_TIFFNoPostDecode(%struct.tiff*, i8*, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @_TIFFVSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  switch i32 %1, label %1520 [
    i32 254, label %6
    i32 256, label %24
    i32 257, label %42
    i32 258, label %60
    i32 259, label %90
    i32 262, label %140
    i32 263, label %159
    i32 266, label %178
    i32 269, label %198
    i32 315, label %216
    i32 306, label %234
    i32 316, label %252
    i32 270, label %270
    i32 271, label %288
    i32 272, label %306
    i32 305, label %324
    i32 274, label %342
    i32 277, label %369
    i32 278, label %390
    i32 280, label %419
    i32 281, label %438
    i32 340, label %457
    i32 341, label %476
    i32 282, label %495
    i32 283, label %514
    i32 284, label %533
    i32 285, label %553
    i32 286, label %571
    i32 287, label %590
    i32 296, label %609
    i32 297, label %630
    i32 321, label %666
    i32 320, label %702
    i32 338, label %757
    i32 32995, label %761
    i32 322, label %783
    i32 323, label %814
    i32 32998, label %845
    i32 32996, label %865
    i32 339, label %890
    i32 32997, label %911
    i32 37439, label %929
    i32 33300, label %949
    i32 33301, label %967
    i32 33302, label %985
    i32 33303, label %1003
    i32 33304, label %1021
    i32 33305, label %1040
    i32 33306, label %1058
    i32 330, label %1076
    i32 529, label %1121
    i32 531, label %1139
    i32 530, label %1158
    i32 318, label %1194
    i32 319, label %1212
    i32 301, label %.lr.ph
    i32 532, label %1263
    i32 332, label %1281
    i32 336, label %1300
    i32 333, label %1336
    i32 334, label %1374
    i32 337, label %1393
    i32 34675, label %1411
    i32 34377, label %1447
    i32 33723, label %1483
  ]

; <label>:6:                                      ; preds = %3
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %8 = load i32, i32* %7, align 8
  %9 = icmp ult i32 %8, 41
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %6
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %12 = load i8*, i8** %11, align 8
  %13 = sext i32 %8 to i64
  %14 = getelementptr i8, i8* %12, i64 %13
  %15 = add i32 %8, 8
  store i32 %15, i32* %7, align 8
  br label %20

; <label>:16:                                     ; preds = %6
  %17 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = getelementptr i8, i8* %18, i64 8
  store i8* %19, i8** %17, align 8
  br label %20

; <label>:20:                                     ; preds = %16, %10
  %.in77 = phi i8* [ %14, %10 ], [ %18, %16 ]
  %21 = bitcast i8* %.in77 to i32*
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 7
  store i32 %22, i32* %23, align 8
  br label %.thread

; <label>:24:                                     ; preds = %3
  %25 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %26 = load i32, i32* %25, align 8
  %27 = icmp ult i32 %26, 41
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %24
  %29 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %30 = load i8*, i8** %29, align 8
  %31 = sext i32 %26 to i64
  %32 = getelementptr i8, i8* %30, i64 %31
  %33 = add i32 %26, 8
  store i32 %33, i32* %25, align 8
  br label %38

; <label>:34:                                     ; preds = %24
  %35 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr i8, i8* %36, i64 8
  store i8* %37, i8** %35, align 8
  br label %38

; <label>:38:                                     ; preds = %34, %28
  %.in76 = phi i8* [ %32, %28 ], [ %36, %34 ]
  %39 = bitcast i8* %.in76 to i32*
  %40 = load i32, i32* %39, align 4
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  store i32 %40, i32* %41, align 8
  br label %.thread

; <label>:42:                                     ; preds = %3
  %43 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %44 = load i32, i32* %43, align 8
  %45 = icmp ult i32 %44, 41
  br i1 %45, label %46, label %52

; <label>:46:                                     ; preds = %42
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %48 = load i8*, i8** %47, align 8
  %49 = sext i32 %44 to i64
  %50 = getelementptr i8, i8* %48, i64 %49
  %51 = add i32 %44, 8
  store i32 %51, i32* %43, align 8
  br label %56

; <label>:52:                                     ; preds = %42
  %53 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %54 = load i8*, i8** %53, align 8
  %55 = getelementptr i8, i8* %54, i64 8
  store i8* %55, i8** %53, align 8
  br label %56

; <label>:56:                                     ; preds = %52, %46
  %.in75 = phi i8* [ %50, %46 ], [ %54, %52 ]
  %57 = bitcast i8* %.in75 to i32*
  %58 = load i32, i32* %57, align 4
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  store i32 %58, i32* %59, align 4
  br label %.thread

; <label>:60:                                     ; preds = %3
  %61 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %62 = load i32, i32* %61, align 8
  %63 = icmp ult i32 %62, 41
  br i1 %63, label %64, label %70

; <label>:64:                                     ; preds = %60
  %65 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %66 = load i8*, i8** %65, align 8
  %67 = sext i32 %62 to i64
  %68 = getelementptr i8, i8* %66, i64 %67
  %69 = add i32 %62, 8
  store i32 %69, i32* %61, align 8
  br label %74

; <label>:70:                                     ; preds = %60
  %71 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %72 = load i8*, i8** %71, align 8
  %73 = getelementptr i8, i8* %72, i64 8
  store i8* %73, i8** %71, align 8
  br label %74

; <label>:74:                                     ; preds = %70, %64
  %.in74 = phi i8* [ %68, %64 ], [ %72, %70 ]
  %75 = bitcast i8* %.in74 to i32*
  %76 = load i32, i32* %75, align 4
  %77 = trunc i32 %76 to i16
  %78 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  store i16 %77, i16* %78, align 4
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %80 = load i32, i32* %79, align 8
  %81 = trunc i32 %80 to i8
  %82 = icmp slt i8 %81, 0
  br i1 %82, label %83, label %.thread

; <label>:83:                                     ; preds = %74
  switch i16 %77, label %.thread [
    i16 16, label %84
    i16 32, label %86
    i16 64, label %88
  ]

; <label>:84:                                     ; preds = %83
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFSwab16BitData, void (%struct.tiff*, i8*, i32)** %85, align 8
  br label %.thread

; <label>:86:                                     ; preds = %83
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFSwab32BitData, void (%struct.tiff*, i8*, i32)** %87, align 8
  br label %.thread

; <label>:88:                                     ; preds = %83
  %89 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFSwab64BitData, void (%struct.tiff*, i8*, i32)** %89, align 8
  br label %.thread

; <label>:90:                                     ; preds = %3
  %91 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %92 = load i32, i32* %91, align 8
  %93 = icmp ult i32 %92, 41
  br i1 %93, label %94, label %100

; <label>:94:                                     ; preds = %90
  %95 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %96 = load i8*, i8** %95, align 8
  %97 = sext i32 %92 to i64
  %98 = getelementptr i8, i8* %96, i64 %97
  %99 = add i32 %92, 8
  store i32 %99, i32* %91, align 8
  br label %104

; <label>:100:                                    ; preds = %90
  %101 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %102 = load i8*, i8** %101, align 8
  %103 = getelementptr i8, i8* %102, i64 8
  store i8* %103, i8** %101, align 8
  br label %104

; <label>:104:                                    ; preds = %100, %94
  %.in73 = phi i8* [ %98, %94 ], [ %102, %100 ]
  %105 = bitcast i8* %.in73 to i32*
  %106 = load i32, i32* %105, align 4
  %107 = and i32 %106, 65535
  store i32 %107, i32* %4, align 4
  %108 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 0
  %109 = load i64, i64* %108, align 8
  %110 = trunc i64 %109 to i8
  %111 = icmp slt i8 %110, 0
  br i1 %111, label %112, label %123

; <label>:112:                                    ; preds = %104
  %113 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %114 = load i16, i16* %113, align 8
  %115 = trunc i32 %106 to i16
  %116 = icmp eq i16 %114, %115
  br i1 %116, label %.thread, label %117

; <label>:117:                                    ; preds = %112
  %118 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  %119 = load void (%struct.tiff*)*, void (%struct.tiff*)** %118, align 8
  tail call void %119(%struct.tiff* nonnull %0) #3
  %120 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %121 = load i32, i32* %120, align 8
  %122 = and i32 %121, -33
  store i32 %122, i32* %120, align 8
  br label %123

; <label>:123:                                    ; preds = %117, %104
  %124 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %125 = load i32, i32* %124, align 4
  %126 = icmp ne i32 %125, 0
  %127 = load i32, i32* %4, align 4
  %128 = icmp eq i32 %127, 5
  %or.cond88 = and i1 %126, %128
  br i1 %or.cond88, label %129, label %132

; <label>:129:                                    ; preds = %123
  %130 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %131 = load i8*, i8** %130, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %131, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.8, i64 0, i64 0)) #3
  store i32 1, i32* %4, align 4
  br label %132

; <label>:132:                                    ; preds = %123, %129
  %133 = load i32, i32* %4, align 4
  %134 = tail call i32 @TIFFSetCompressionScheme(%struct.tiff* nonnull %0, i32 %133) #3
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %.thread93, label %136

; <label>:136:                                    ; preds = %132
  %137 = load i32, i32* %4, align 4
  %138 = trunc i32 %137 to i16
  %139 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  store i16 %138, i16* %139, align 8
  br label %.thread

; <label>:140:                                    ; preds = %3
  %141 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %142 = load i32, i32* %141, align 8
  %143 = icmp ult i32 %142, 41
  br i1 %143, label %144, label %150

; <label>:144:                                    ; preds = %140
  %145 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %146 = load i8*, i8** %145, align 8
  %147 = sext i32 %142 to i64
  %148 = getelementptr i8, i8* %146, i64 %147
  %149 = add i32 %142, 8
  store i32 %149, i32* %141, align 8
  br label %154

; <label>:150:                                    ; preds = %140
  %151 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %152 = load i8*, i8** %151, align 8
  %153 = getelementptr i8, i8* %152, i64 8
  store i8* %153, i8** %151, align 8
  br label %154

; <label>:154:                                    ; preds = %150, %144
  %.in72 = phi i8* [ %148, %144 ], [ %152, %150 ]
  %155 = bitcast i8* %.in72 to i32*
  %156 = load i32, i32* %155, align 4
  %157 = trunc i32 %156 to i16
  %158 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  store i16 %157, i16* %158, align 2
  br label %.thread

; <label>:159:                                    ; preds = %3
  %160 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %161 = load i32, i32* %160, align 8
  %162 = icmp ult i32 %161, 41
  br i1 %162, label %163, label %169

; <label>:163:                                    ; preds = %159
  %164 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %165 = load i8*, i8** %164, align 8
  %166 = sext i32 %161 to i64
  %167 = getelementptr i8, i8* %165, i64 %166
  %168 = add i32 %161, 8
  store i32 %168, i32* %160, align 8
  br label %173

; <label>:169:                                    ; preds = %159
  %170 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %171 = load i8*, i8** %170, align 8
  %172 = getelementptr i8, i8* %171, i64 8
  store i8* %172, i8** %170, align 8
  br label %173

; <label>:173:                                    ; preds = %169, %163
  %.in71 = phi i8* [ %167, %163 ], [ %171, %169 ]
  %174 = bitcast i8* %.in71 to i32*
  %175 = load i32, i32* %174, align 4
  %176 = trunc i32 %175 to i16
  %177 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 12
  store i16 %176, i16* %177, align 4
  br label %.thread

; <label>:178:                                    ; preds = %3
  %179 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %180 = load i32, i32* %179, align 8
  %181 = icmp ult i32 %180, 41
  br i1 %181, label %182, label %188

; <label>:182:                                    ; preds = %178
  %183 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %184 = load i8*, i8** %183, align 8
  %185 = sext i32 %180 to i64
  %186 = getelementptr i8, i8* %184, i64 %185
  %187 = add i32 %180, 8
  store i32 %187, i32* %179, align 8
  br label %192

; <label>:188:                                    ; preds = %178
  %189 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %190 = load i8*, i8** %189, align 8
  %191 = getelementptr i8, i8* %190, i64 8
  store i8* %191, i8** %189, align 8
  br label %192

; <label>:192:                                    ; preds = %188, %182
  %.in70 = phi i8* [ %186, %182 ], [ %190, %188 ]
  %193 = bitcast i8* %.in70 to i32*
  %194 = load i32, i32* %193, align 4
  store i32 %194, i32* %4, align 4
  %.off = add i32 %194, -1
  %switch = icmp ult i32 %.off, 2
  br i1 %switch, label %195, label %1545

; <label>:195:                                    ; preds = %192
  %196 = trunc i32 %194 to i16
  %197 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  store i16 %196, i16* %197, align 2
  br label %.thread

; <label>:198:                                    ; preds = %3
  %199 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 33
  %200 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %201 = load i32, i32* %200, align 8
  %202 = icmp ult i32 %201, 41
  br i1 %202, label %203, label %209

; <label>:203:                                    ; preds = %198
  %204 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %205 = load i8*, i8** %204, align 8
  %206 = sext i32 %201 to i64
  %207 = getelementptr i8, i8* %205, i64 %206
  %208 = add i32 %201, 8
  store i32 %208, i32* %200, align 8
  br label %213

; <label>:209:                                    ; preds = %198
  %210 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %211 = load i8*, i8** %210, align 8
  %212 = getelementptr i8, i8* %211, i64 8
  store i8* %212, i8** %210, align 8
  br label %213

; <label>:213:                                    ; preds = %209, %203
  %.in69 = phi i8* [ %207, %203 ], [ %211, %209 ]
  %214 = bitcast i8* %.in69 to i8**
  %215 = load i8*, i8** %214, align 8
  tail call void @_TIFFsetString(i8** %199, i8* %215)
  br label %.thread

; <label>:216:                                    ; preds = %3
  %217 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 34
  %218 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %219 = load i32, i32* %218, align 8
  %220 = icmp ult i32 %219, 41
  br i1 %220, label %221, label %227

; <label>:221:                                    ; preds = %216
  %222 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %223 = load i8*, i8** %222, align 8
  %224 = sext i32 %219 to i64
  %225 = getelementptr i8, i8* %223, i64 %224
  %226 = add i32 %219, 8
  store i32 %226, i32* %218, align 8
  br label %231

; <label>:227:                                    ; preds = %216
  %228 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %229 = load i8*, i8** %228, align 8
  %230 = getelementptr i8, i8* %229, i64 8
  store i8* %230, i8** %228, align 8
  br label %231

; <label>:231:                                    ; preds = %227, %221
  %.in68 = phi i8* [ %225, %221 ], [ %229, %227 ]
  %232 = bitcast i8* %.in68 to i8**
  %233 = load i8*, i8** %232, align 8
  tail call void @_TIFFsetString(i8** %217, i8* %233)
  br label %.thread

; <label>:234:                                    ; preds = %3
  %235 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 35
  %236 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %237 = load i32, i32* %236, align 8
  %238 = icmp ult i32 %237, 41
  br i1 %238, label %239, label %245

; <label>:239:                                    ; preds = %234
  %240 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %241 = load i8*, i8** %240, align 8
  %242 = sext i32 %237 to i64
  %243 = getelementptr i8, i8* %241, i64 %242
  %244 = add i32 %237, 8
  store i32 %244, i32* %236, align 8
  br label %249

; <label>:245:                                    ; preds = %234
  %246 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %247 = load i8*, i8** %246, align 8
  %248 = getelementptr i8, i8* %247, i64 8
  store i8* %248, i8** %246, align 8
  br label %249

; <label>:249:                                    ; preds = %245, %239
  %.in67 = phi i8* [ %243, %239 ], [ %247, %245 ]
  %250 = bitcast i8* %.in67 to i8**
  %251 = load i8*, i8** %250, align 8
  tail call void @_TIFFsetString(i8** %235, i8* %251)
  br label %.thread

; <label>:252:                                    ; preds = %3
  %253 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 36
  %254 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %255 = load i32, i32* %254, align 8
  %256 = icmp ult i32 %255, 41
  br i1 %256, label %257, label %263

; <label>:257:                                    ; preds = %252
  %258 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %259 = load i8*, i8** %258, align 8
  %260 = sext i32 %255 to i64
  %261 = getelementptr i8, i8* %259, i64 %260
  %262 = add i32 %255, 8
  store i32 %262, i32* %254, align 8
  br label %267

; <label>:263:                                    ; preds = %252
  %264 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %265 = load i8*, i8** %264, align 8
  %266 = getelementptr i8, i8* %265, i64 8
  store i8* %266, i8** %264, align 8
  br label %267

; <label>:267:                                    ; preds = %263, %257
  %.in66 = phi i8* [ %261, %257 ], [ %265, %263 ]
  %268 = bitcast i8* %.in66 to i8**
  %269 = load i8*, i8** %268, align 8
  tail call void @_TIFFsetString(i8** %253, i8* %269)
  br label %.thread

; <label>:270:                                    ; preds = %3
  %271 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 37
  %272 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %273 = load i32, i32* %272, align 8
  %274 = icmp ult i32 %273, 41
  br i1 %274, label %275, label %281

; <label>:275:                                    ; preds = %270
  %276 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %277 = load i8*, i8** %276, align 8
  %278 = sext i32 %273 to i64
  %279 = getelementptr i8, i8* %277, i64 %278
  %280 = add i32 %273, 8
  store i32 %280, i32* %272, align 8
  br label %285

; <label>:281:                                    ; preds = %270
  %282 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %283 = load i8*, i8** %282, align 8
  %284 = getelementptr i8, i8* %283, i64 8
  store i8* %284, i8** %282, align 8
  br label %285

; <label>:285:                                    ; preds = %281, %275
  %.in65 = phi i8* [ %279, %275 ], [ %283, %281 ]
  %286 = bitcast i8* %.in65 to i8**
  %287 = load i8*, i8** %286, align 8
  tail call void @_TIFFsetString(i8** %271, i8* %287)
  br label %.thread

; <label>:288:                                    ; preds = %3
  %289 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 38
  %290 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %291 = load i32, i32* %290, align 8
  %292 = icmp ult i32 %291, 41
  br i1 %292, label %293, label %299

; <label>:293:                                    ; preds = %288
  %294 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %295 = load i8*, i8** %294, align 8
  %296 = sext i32 %291 to i64
  %297 = getelementptr i8, i8* %295, i64 %296
  %298 = add i32 %291, 8
  store i32 %298, i32* %290, align 8
  br label %303

; <label>:299:                                    ; preds = %288
  %300 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %301 = load i8*, i8** %300, align 8
  %302 = getelementptr i8, i8* %301, i64 8
  store i8* %302, i8** %300, align 8
  br label %303

; <label>:303:                                    ; preds = %299, %293
  %.in64 = phi i8* [ %297, %293 ], [ %301, %299 ]
  %304 = bitcast i8* %.in64 to i8**
  %305 = load i8*, i8** %304, align 8
  tail call void @_TIFFsetString(i8** %289, i8* %305)
  br label %.thread

; <label>:306:                                    ; preds = %3
  %307 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 39
  %308 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %309 = load i32, i32* %308, align 8
  %310 = icmp ult i32 %309, 41
  br i1 %310, label %311, label %317

; <label>:311:                                    ; preds = %306
  %312 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %313 = load i8*, i8** %312, align 8
  %314 = sext i32 %309 to i64
  %315 = getelementptr i8, i8* %313, i64 %314
  %316 = add i32 %309, 8
  store i32 %316, i32* %308, align 8
  br label %321

; <label>:317:                                    ; preds = %306
  %318 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %319 = load i8*, i8** %318, align 8
  %320 = getelementptr i8, i8* %319, i64 8
  store i8* %320, i8** %318, align 8
  br label %321

; <label>:321:                                    ; preds = %317, %311
  %.in63 = phi i8* [ %315, %311 ], [ %319, %317 ]
  %322 = bitcast i8* %.in63 to i8**
  %323 = load i8*, i8** %322, align 8
  tail call void @_TIFFsetString(i8** %307, i8* %323)
  br label %.thread

; <label>:324:                                    ; preds = %3
  %325 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 40
  %326 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %327 = load i32, i32* %326, align 8
  %328 = icmp ult i32 %327, 41
  br i1 %328, label %329, label %335

; <label>:329:                                    ; preds = %324
  %330 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %331 = load i8*, i8** %330, align 8
  %332 = sext i32 %327 to i64
  %333 = getelementptr i8, i8* %331, i64 %332
  %334 = add i32 %327, 8
  store i32 %334, i32* %326, align 8
  br label %339

; <label>:335:                                    ; preds = %324
  %336 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %337 = load i8*, i8** %336, align 8
  %338 = getelementptr i8, i8* %337, i64 8
  store i8* %338, i8** %336, align 8
  br label %339

; <label>:339:                                    ; preds = %335, %329
  %.in62 = phi i8* [ %333, %329 ], [ %337, %335 ]
  %340 = bitcast i8* %.in62 to i8**
  %341 = load i8*, i8** %340, align 8
  tail call void @_TIFFsetString(i8** %325, i8* %341)
  br label %.thread

; <label>:342:                                    ; preds = %3
  %343 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %344 = load i32, i32* %343, align 8
  %345 = icmp ult i32 %344, 41
  br i1 %345, label %346, label %352

; <label>:346:                                    ; preds = %342
  %347 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %348 = load i8*, i8** %347, align 8
  %349 = sext i32 %344 to i64
  %350 = getelementptr i8, i8* %348, i64 %349
  %351 = add i32 %344, 8
  store i32 %351, i32* %343, align 8
  br label %356

; <label>:352:                                    ; preds = %342
  %353 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %354 = load i8*, i8** %353, align 8
  %355 = getelementptr i8, i8* %354, i64 8
  store i8* %355, i8** %353, align 8
  br label %356

; <label>:356:                                    ; preds = %352, %346
  %.in61 = phi i8* [ %350, %346 ], [ %354, %352 ]
  %357 = bitcast i8* %.in61 to i32*
  %358 = load i32, i32* %357, align 4
  store i32 %358, i32* %4, align 4
  %.off98 = add i32 %358, -1
  %359 = icmp ugt i32 %.off98, 7
  br i1 %359, label %360, label %366

; <label>:360:                                    ; preds = %356
  %361 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %362 = load i8*, i8** %361, align 8
  %363 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %1) #3
  %364 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %363, i64 0, i32 7
  %365 = load i8*, i8** %364, align 8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %362, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.9, i64 0, i64 0), i32 %358, i8* %365) #3
  br label %.thread

; <label>:366:                                    ; preds = %356
  %367 = trunc i32 %358 to i16
  %368 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 14
  store i16 %367, i16* %368, align 8
  br label %.thread

; <label>:369:                                    ; preds = %3
  %370 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %371 = load i32, i32* %370, align 8
  %372 = icmp ult i32 %371, 41
  br i1 %372, label %373, label %379

; <label>:373:                                    ; preds = %369
  %374 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %375 = load i8*, i8** %374, align 8
  %376 = sext i32 %371 to i64
  %377 = getelementptr i8, i8* %375, i64 %376
  %378 = add i32 %371, 8
  store i32 %378, i32* %370, align 8
  br label %383

; <label>:379:                                    ; preds = %369
  %380 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %381 = load i8*, i8** %380, align 8
  %382 = getelementptr i8, i8* %381, i64 8
  store i8* %382, i8** %380, align 8
  br label %383

; <label>:383:                                    ; preds = %379, %373
  %.in60 = phi i8* [ %377, %373 ], [ %381, %379 ]
  %384 = bitcast i8* %.in60 to i32*
  %385 = load i32, i32* %384, align 4
  store i32 %385, i32* %4, align 4
  %386 = icmp eq i32 %385, 0
  br i1 %386, label %1545, label %387

; <label>:387:                                    ; preds = %383
  %388 = trunc i32 %385 to i16
  %389 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  store i16 %388, i16* %389, align 2
  br label %.thread

; <label>:390:                                    ; preds = %3
  %391 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %392 = load i32, i32* %391, align 8
  %393 = icmp ult i32 %392, 41
  br i1 %393, label %394, label %400

; <label>:394:                                    ; preds = %390
  %395 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %396 = load i8*, i8** %395, align 8
  %397 = sext i32 %392 to i64
  %398 = getelementptr i8, i8* %396, i64 %397
  %399 = add i32 %392, 8
  store i32 %399, i32* %391, align 8
  br label %404

; <label>:400:                                    ; preds = %390
  %401 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %402 = load i8*, i8** %401, align 8
  %403 = getelementptr i8, i8* %402, i64 8
  store i8* %403, i8** %401, align 8
  br label %404

; <label>:404:                                    ; preds = %400, %394
  %.in59 = phi i8* [ %398, %394 ], [ %402, %400 ]
  %405 = bitcast i8* %.in59 to i32*
  %406 = load i32, i32* %405, align 4
  %407 = icmp eq i32 %406, 0
  br i1 %407, label %1553, label %408

; <label>:408:                                    ; preds = %404
  %409 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  store i32 %406, i32* %409, align 4
  %410 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 0
  %411 = load i64, i64* %410, align 8
  %412 = and i64 %411, 4
  %413 = icmp eq i64 %412, 0
  br i1 %413, label %414, label %.thread

; <label>:414:                                    ; preds = %408
  %415 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  store i32 %406, i32* %415, align 8
  %416 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %417 = load i32, i32* %416, align 8
  %418 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  store i32 %417, i32* %418, align 4
  br label %.thread

; <label>:419:                                    ; preds = %3
  %420 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %421 = load i32, i32* %420, align 8
  %422 = icmp ult i32 %421, 41
  br i1 %422, label %423, label %429

; <label>:423:                                    ; preds = %419
  %424 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %425 = load i8*, i8** %424, align 8
  %426 = sext i32 %421 to i64
  %427 = getelementptr i8, i8* %425, i64 %426
  %428 = add i32 %421, 8
  store i32 %428, i32* %420, align 8
  br label %433

; <label>:429:                                    ; preds = %419
  %430 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %431 = load i8*, i8** %430, align 8
  %432 = getelementptr i8, i8* %431, i64 8
  store i8* %432, i8** %430, align 8
  br label %433

; <label>:433:                                    ; preds = %429, %423
  %.in58 = phi i8* [ %427, %423 ], [ %431, %429 ]
  %434 = bitcast i8* %.in58 to i32*
  %435 = load i32, i32* %434, align 4
  %436 = trunc i32 %435 to i16
  %437 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 17
  store i16 %436, i16* %437, align 8
  br label %.thread

; <label>:438:                                    ; preds = %3
  %439 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %440 = load i32, i32* %439, align 8
  %441 = icmp ult i32 %440, 41
  br i1 %441, label %442, label %448

; <label>:442:                                    ; preds = %438
  %443 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %444 = load i8*, i8** %443, align 8
  %445 = sext i32 %440 to i64
  %446 = getelementptr i8, i8* %444, i64 %445
  %447 = add i32 %440, 8
  store i32 %447, i32* %439, align 8
  br label %452

; <label>:448:                                    ; preds = %438
  %449 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %450 = load i8*, i8** %449, align 8
  %451 = getelementptr i8, i8* %450, i64 8
  store i8* %451, i8** %449, align 8
  br label %452

; <label>:452:                                    ; preds = %448, %442
  %.in57 = phi i8* [ %446, %442 ], [ %450, %448 ]
  %453 = bitcast i8* %.in57 to i32*
  %454 = load i32, i32* %453, align 4
  %455 = trunc i32 %454 to i16
  %456 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 18
  store i16 %455, i16* %456, align 2
  br label %.thread

; <label>:457:                                    ; preds = %3
  %458 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 1
  %459 = load i32, i32* %458, align 4
  %460 = icmp ult i32 %459, 161
  br i1 %460, label %461, label %467

; <label>:461:                                    ; preds = %457
  %462 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %463 = load i8*, i8** %462, align 8
  %464 = sext i32 %459 to i64
  %465 = getelementptr i8, i8* %463, i64 %464
  %466 = add i32 %459, 16
  store i32 %466, i32* %458, align 4
  br label %471

; <label>:467:                                    ; preds = %457
  %468 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %469 = load i8*, i8** %468, align 8
  %470 = getelementptr i8, i8* %469, i64 8
  store i8* %470, i8** %468, align 8
  br label %471

; <label>:471:                                    ; preds = %467, %461
  %.in56 = phi i8* [ %465, %461 ], [ %469, %467 ]
  %472 = bitcast i8* %.in56 to i64*
  %473 = load i64, i64* %472, align 8
  %474 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 19
  %475 = bitcast double* %474 to i64*
  store i64 %473, i64* %475, align 8
  br label %.thread

; <label>:476:                                    ; preds = %3
  %477 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 1
  %478 = load i32, i32* %477, align 4
  %479 = icmp ult i32 %478, 161
  br i1 %479, label %480, label %486

; <label>:480:                                    ; preds = %476
  %481 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %482 = load i8*, i8** %481, align 8
  %483 = sext i32 %478 to i64
  %484 = getelementptr i8, i8* %482, i64 %483
  %485 = add i32 %478, 16
  store i32 %485, i32* %477, align 4
  br label %490

; <label>:486:                                    ; preds = %476
  %487 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %488 = load i8*, i8** %487, align 8
  %489 = getelementptr i8, i8* %488, i64 8
  store i8* %489, i8** %487, align 8
  br label %490

; <label>:490:                                    ; preds = %486, %480
  %.in55 = phi i8* [ %484, %480 ], [ %488, %486 ]
  %491 = bitcast i8* %.in55 to i64*
  %492 = load i64, i64* %491, align 8
  %493 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 20
  %494 = bitcast double* %493 to i64*
  store i64 %492, i64* %494, align 8
  br label %.thread

; <label>:495:                                    ; preds = %3
  %496 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 1
  %497 = load i32, i32* %496, align 4
  %498 = icmp ult i32 %497, 161
  br i1 %498, label %499, label %505

; <label>:499:                                    ; preds = %495
  %500 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %501 = load i8*, i8** %500, align 8
  %502 = sext i32 %497 to i64
  %503 = getelementptr i8, i8* %501, i64 %502
  %504 = add i32 %497, 16
  store i32 %504, i32* %496, align 4
  br label %509

; <label>:505:                                    ; preds = %495
  %506 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %507 = load i8*, i8** %506, align 8
  %508 = getelementptr i8, i8* %507, i64 8
  store i8* %508, i8** %506, align 8
  br label %509

; <label>:509:                                    ; preds = %505, %499
  %.in54 = phi i8* [ %503, %499 ], [ %507, %505 ]
  %510 = bitcast i8* %.in54 to double*
  %511 = load double, double* %510, align 8
  %512 = fptrunc double %511 to float
  %513 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 21
  store float %512, float* %513, align 8
  br label %.thread

; <label>:514:                                    ; preds = %3
  %515 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 1
  %516 = load i32, i32* %515, align 4
  %517 = icmp ult i32 %516, 161
  br i1 %517, label %518, label %524

; <label>:518:                                    ; preds = %514
  %519 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %520 = load i8*, i8** %519, align 8
  %521 = sext i32 %516 to i64
  %522 = getelementptr i8, i8* %520, i64 %521
  %523 = add i32 %516, 16
  store i32 %523, i32* %515, align 4
  br label %528

; <label>:524:                                    ; preds = %514
  %525 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %526 = load i8*, i8** %525, align 8
  %527 = getelementptr i8, i8* %526, i64 8
  store i8* %527, i8** %525, align 8
  br label %528

; <label>:528:                                    ; preds = %524, %518
  %.in53 = phi i8* [ %522, %518 ], [ %526, %524 ]
  %529 = bitcast i8* %.in53 to double*
  %530 = load double, double* %529, align 8
  %531 = fptrunc double %530 to float
  %532 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 22
  store float %531, float* %532, align 4
  br label %.thread

; <label>:533:                                    ; preds = %3
  %534 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %535 = load i32, i32* %534, align 8
  %536 = icmp ult i32 %535, 41
  br i1 %536, label %537, label %543

; <label>:537:                                    ; preds = %533
  %538 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %539 = load i8*, i8** %538, align 8
  %540 = sext i32 %535 to i64
  %541 = getelementptr i8, i8* %539, i64 %540
  %542 = add i32 %535, 8
  store i32 %542, i32* %534, align 8
  br label %547

; <label>:543:                                    ; preds = %533
  %544 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %545 = load i8*, i8** %544, align 8
  %546 = getelementptr i8, i8* %545, i64 8
  store i8* %546, i8** %544, align 8
  br label %547

; <label>:547:                                    ; preds = %543, %537
  %.in52 = phi i8* [ %541, %537 ], [ %545, %543 ]
  %548 = bitcast i8* %.in52 to i32*
  %549 = load i32, i32* %548, align 4
  store i32 %549, i32* %4, align 4
  %.off94 = add i32 %549, -1
  %switch95 = icmp ult i32 %.off94, 2
  br i1 %switch95, label %550, label %1545

; <label>:550:                                    ; preds = %547
  %551 = trunc i32 %549 to i16
  %552 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  store i16 %551, i16* %552, align 2
  br label %.thread

; <label>:553:                                    ; preds = %3
  %554 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 41
  %555 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %556 = load i32, i32* %555, align 8
  %557 = icmp ult i32 %556, 41
  br i1 %557, label %558, label %564

; <label>:558:                                    ; preds = %553
  %559 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %560 = load i8*, i8** %559, align 8
  %561 = sext i32 %556 to i64
  %562 = getelementptr i8, i8* %560, i64 %561
  %563 = add i32 %556, 8
  store i32 %563, i32* %555, align 8
  br label %568

; <label>:564:                                    ; preds = %553
  %565 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %566 = load i8*, i8** %565, align 8
  %567 = getelementptr i8, i8* %566, i64 8
  store i8* %567, i8** %565, align 8
  br label %568

; <label>:568:                                    ; preds = %564, %558
  %.in51 = phi i8* [ %562, %558 ], [ %566, %564 ]
  %569 = bitcast i8* %.in51 to i8**
  %570 = load i8*, i8** %569, align 8
  tail call void @_TIFFsetString(i8** %554, i8* %570)
  br label %.thread

; <label>:571:                                    ; preds = %3
  %572 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 1
  %573 = load i32, i32* %572, align 4
  %574 = icmp ult i32 %573, 161
  br i1 %574, label %575, label %581

; <label>:575:                                    ; preds = %571
  %576 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %577 = load i8*, i8** %576, align 8
  %578 = sext i32 %573 to i64
  %579 = getelementptr i8, i8* %577, i64 %578
  %580 = add i32 %573, 16
  store i32 %580, i32* %572, align 4
  br label %585

; <label>:581:                                    ; preds = %571
  %582 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %583 = load i8*, i8** %582, align 8
  %584 = getelementptr i8, i8* %583, i64 8
  store i8* %584, i8** %582, align 8
  br label %585

; <label>:585:                                    ; preds = %581, %575
  %.in50 = phi i8* [ %579, %575 ], [ %583, %581 ]
  %586 = bitcast i8* %.in50 to double*
  %587 = load double, double* %586, align 8
  %588 = fptrunc double %587 to float
  %589 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 25
  store float %588, float* %589, align 4
  br label %.thread

; <label>:590:                                    ; preds = %3
  %591 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 1
  %592 = load i32, i32* %591, align 4
  %593 = icmp ult i32 %592, 161
  br i1 %593, label %594, label %600

; <label>:594:                                    ; preds = %590
  %595 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %596 = load i8*, i8** %595, align 8
  %597 = sext i32 %592 to i64
  %598 = getelementptr i8, i8* %596, i64 %597
  %599 = add i32 %592, 16
  store i32 %599, i32* %591, align 4
  br label %604

; <label>:600:                                    ; preds = %590
  %601 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %602 = load i8*, i8** %601, align 8
  %603 = getelementptr i8, i8* %602, i64 8
  store i8* %603, i8** %601, align 8
  br label %604

; <label>:604:                                    ; preds = %600, %594
  %.in49 = phi i8* [ %598, %594 ], [ %602, %600 ]
  %605 = bitcast i8* %.in49 to double*
  %606 = load double, double* %605, align 8
  %607 = fptrunc double %606 to float
  %608 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 26
  store float %607, float* %608, align 8
  br label %.thread

; <label>:609:                                    ; preds = %3
  %610 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %611 = load i32, i32* %610, align 8
  %612 = icmp ult i32 %611, 41
  br i1 %612, label %613, label %619

; <label>:613:                                    ; preds = %609
  %614 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %615 = load i8*, i8** %614, align 8
  %616 = sext i32 %611 to i64
  %617 = getelementptr i8, i8* %615, i64 %616
  %618 = add i32 %611, 8
  store i32 %618, i32* %610, align 8
  br label %623

; <label>:619:                                    ; preds = %609
  %620 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %621 = load i8*, i8** %620, align 8
  %622 = getelementptr i8, i8* %621, i64 8
  store i8* %622, i8** %620, align 8
  br label %623

; <label>:623:                                    ; preds = %619, %613
  %.in48 = phi i8* [ %617, %613 ], [ %621, %619 ]
  %624 = bitcast i8* %.in48 to i32*
  %625 = load i32, i32* %624, align 4
  store i32 %625, i32* %4, align 4
  %.off97 = add i32 %625, -1
  %626 = icmp ugt i32 %.off97, 2
  br i1 %626, label %1545, label %627

; <label>:627:                                    ; preds = %623
  %628 = trunc i32 %625 to i16
  %629 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 23
  store i16 %628, i16* %629, align 8
  br label %.thread

; <label>:630:                                    ; preds = %3
  %631 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %632 = load i32, i32* %631, align 8
  %633 = icmp ult i32 %632, 41
  br i1 %633, label %634, label %640

; <label>:634:                                    ; preds = %630
  %635 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %636 = load i8*, i8** %635, align 8
  %637 = sext i32 %632 to i64
  %638 = getelementptr i8, i8* %636, i64 %637
  %639 = add i32 %632, 8
  store i32 %639, i32* %631, align 8
  br label %644

; <label>:640:                                    ; preds = %630
  %641 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %642 = load i8*, i8** %641, align 8
  %643 = getelementptr i8, i8* %642, i64 8
  store i8* %643, i8** %641, align 8
  br label %644

; <label>:644:                                    ; preds = %640, %634
  %.in46 = phi i8* [ %638, %634 ], [ %642, %640 ]
  %645 = bitcast i8* %.in46 to i32*
  %646 = load i32, i32* %645, align 4
  %647 = trunc i32 %646 to i16
  %648 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 27, i64 0
  store i16 %647, i16* %648, align 4
  %649 = load i32, i32* %631, align 8
  %650 = icmp ult i32 %649, 41
  br i1 %650, label %651, label %657

; <label>:651:                                    ; preds = %644
  %652 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %653 = load i8*, i8** %652, align 8
  %654 = sext i32 %649 to i64
  %655 = getelementptr i8, i8* %653, i64 %654
  %656 = add i32 %649, 8
  store i32 %656, i32* %631, align 8
  br label %661

; <label>:657:                                    ; preds = %644
  %658 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %659 = load i8*, i8** %658, align 8
  %660 = getelementptr i8, i8* %659, i64 8
  store i8* %660, i8** %658, align 8
  br label %661

; <label>:661:                                    ; preds = %657, %651
  %.in47 = phi i8* [ %655, %651 ], [ %659, %657 ]
  %662 = bitcast i8* %.in47 to i32*
  %663 = load i32, i32* %662, align 4
  %664 = trunc i32 %663 to i16
  %665 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 27, i64 1
  store i16 %664, i16* %665, align 2
  br label %.thread

; <label>:666:                                    ; preds = %3
  %667 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %668 = load i32, i32* %667, align 8
  %669 = icmp ult i32 %668, 41
  br i1 %669, label %670, label %676

; <label>:670:                                    ; preds = %666
  %671 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %672 = load i8*, i8** %671, align 8
  %673 = sext i32 %668 to i64
  %674 = getelementptr i8, i8* %672, i64 %673
  %675 = add i32 %668, 8
  store i32 %675, i32* %667, align 8
  br label %680

; <label>:676:                                    ; preds = %666
  %677 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %678 = load i8*, i8** %677, align 8
  %679 = getelementptr i8, i8* %678, i64 8
  store i8* %679, i8** %677, align 8
  br label %680

; <label>:680:                                    ; preds = %676, %670
  %.in44 = phi i8* [ %674, %670 ], [ %678, %676 ]
  %681 = bitcast i8* %.in44 to i32*
  %682 = load i32, i32* %681, align 4
  %683 = trunc i32 %682 to i16
  %684 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 29, i64 0
  store i16 %683, i16* %684, align 8
  %685 = load i32, i32* %667, align 8
  %686 = icmp ult i32 %685, 41
  br i1 %686, label %687, label %693

; <label>:687:                                    ; preds = %680
  %688 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %689 = load i8*, i8** %688, align 8
  %690 = sext i32 %685 to i64
  %691 = getelementptr i8, i8* %689, i64 %690
  %692 = add i32 %685, 8
  store i32 %692, i32* %667, align 8
  br label %697

; <label>:693:                                    ; preds = %680
  %694 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %695 = load i8*, i8** %694, align 8
  %696 = getelementptr i8, i8* %695, i64 8
  store i8* %696, i8** %694, align 8
  br label %697

; <label>:697:                                    ; preds = %693, %687
  %.in45 = phi i8* [ %691, %687 ], [ %695, %693 ]
  %698 = bitcast i8* %.in45 to i32*
  %699 = load i32, i32* %698, align 4
  %700 = trunc i32 %699 to i16
  %701 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 29, i64 1
  store i16 %700, i16* %701, align 2
  br label %.thread

; <label>:702:                                    ; preds = %3
  %703 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %704 = load i16, i16* %703, align 4
  %705 = zext i16 %704 to i64
  %706 = shl i64 1, %705
  %707 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 0
  %708 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %709 = load i32, i32* %708, align 8
  %710 = icmp ult i32 %709, 41
  br i1 %710, label %711, label %717

; <label>:711:                                    ; preds = %702
  %712 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %713 = load i8*, i8** %712, align 8
  %714 = sext i32 %709 to i64
  %715 = getelementptr i8, i8* %713, i64 %714
  %716 = add i32 %709, 8
  store i32 %716, i32* %708, align 8
  br label %721

; <label>:717:                                    ; preds = %702
  %718 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %719 = load i8*, i8** %718, align 8
  %720 = getelementptr i8, i8* %719, i64 8
  store i8* %720, i8** %718, align 8
  br label %721

; <label>:721:                                    ; preds = %717, %711
  %.in41 = phi i8* [ %715, %711 ], [ %719, %717 ]
  %722 = bitcast i8* %.in41 to i16**
  %723 = load i16*, i16** %722, align 8
  %724 = and i64 %706, 4294967295
  tail call void @_TIFFsetShortArray(i16** %707, i16* %723, i64 %724)
  %725 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 1
  %726 = load i32, i32* %708, align 8
  %727 = icmp ult i32 %726, 41
  br i1 %727, label %728, label %734

; <label>:728:                                    ; preds = %721
  %729 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %730 = load i8*, i8** %729, align 8
  %731 = sext i32 %726 to i64
  %732 = getelementptr i8, i8* %730, i64 %731
  %733 = add i32 %726, 8
  store i32 %733, i32* %708, align 8
  br label %738

; <label>:734:                                    ; preds = %721
  %735 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %736 = load i8*, i8** %735, align 8
  %737 = getelementptr i8, i8* %736, i64 8
  store i8* %737, i8** %735, align 8
  br label %738

; <label>:738:                                    ; preds = %734, %728
  %.in42 = phi i8* [ %732, %728 ], [ %736, %734 ]
  %739 = bitcast i8* %.in42 to i16**
  %740 = load i16*, i16** %739, align 8
  tail call void @_TIFFsetShortArray(i16** %725, i16* %740, i64 %724)
  %741 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 2
  %742 = load i32, i32* %708, align 8
  %743 = icmp ult i32 %742, 41
  br i1 %743, label %744, label %750

; <label>:744:                                    ; preds = %738
  %745 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %746 = load i8*, i8** %745, align 8
  %747 = sext i32 %742 to i64
  %748 = getelementptr i8, i8* %746, i64 %747
  %749 = add i32 %742, 8
  store i32 %749, i32* %708, align 8
  br label %754

; <label>:750:                                    ; preds = %738
  %751 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %752 = load i8*, i8** %751, align 8
  %753 = getelementptr i8, i8* %752, i64 8
  store i8* %753, i8** %751, align 8
  br label %754

; <label>:754:                                    ; preds = %750, %744
  %.in43 = phi i8* [ %748, %744 ], [ %752, %750 ]
  %755 = bitcast i8* %.in43 to i16**
  %756 = load i16*, i16** %755, align 8
  tail call void @_TIFFsetShortArray(i16** %741, i16* %756, i64 %724)
  br label %.thread

; <label>:757:                                    ; preds = %3
  %758 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6
  %759 = call fastcc i32 @setExtraSamples(%struct.TIFFDirectory* %758, %struct.__va_list_tag* %2, i32* nonnull %4)
  %760 = icmp eq i32 %759, 0
  br i1 %760, label %1545, label %.thread

; <label>:761:                                    ; preds = %3
  %762 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %763 = load i32, i32* %762, align 8
  %764 = icmp ult i32 %763, 41
  br i1 %764, label %765, label %771

; <label>:765:                                    ; preds = %761
  %766 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %767 = load i8*, i8** %766, align 8
  %768 = sext i32 %763 to i64
  %769 = getelementptr i8, i8* %767, i64 %768
  %770 = add i32 %763, 8
  store i32 %770, i32* %762, align 8
  br label %775

; <label>:771:                                    ; preds = %761
  %772 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %773 = load i8*, i8** %772, align 8
  %774 = getelementptr i8, i8* %773, i64 8
  store i8* %774, i8** %772, align 8
  br label %775

; <label>:775:                                    ; preds = %771, %765
  %.in40 = phi i8* [ %769, %765 ], [ %773, %771 ]
  %776 = bitcast i8* %.in40 to i32*
  %777 = load i32, i32* %776, align 4
  %778 = icmp ne i32 %777, 0
  %779 = zext i1 %778 to i16
  %780 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  store i16 %779, i16* %780, align 4
  br i1 %778, label %781, label %.thread

; <label>:781:                                    ; preds = %775
  store i16 1, i16* %5, align 2
  %782 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 31
  call void @_TIFFsetShortArray(i16** %782, i16* nonnull %5, i64 1)
  br label %.thread

; <label>:783:                                    ; preds = %3
  %784 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %785 = load i32, i32* %784, align 8
  %786 = icmp ult i32 %785, 41
  br i1 %786, label %787, label %793

; <label>:787:                                    ; preds = %783
  %788 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %789 = load i8*, i8** %788, align 8
  %790 = sext i32 %785 to i64
  %791 = getelementptr i8, i8* %789, i64 %790
  %792 = add i32 %785, 8
  store i32 %792, i32* %784, align 8
  br label %797

; <label>:793:                                    ; preds = %783
  %794 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %795 = load i8*, i8** %794, align 8
  %796 = getelementptr i8, i8* %795, i64 8
  store i8* %796, i8** %794, align 8
  br label %797

; <label>:797:                                    ; preds = %793, %787
  %.in39 = phi i8* [ %791, %787 ], [ %795, %793 ]
  %798 = bitcast i8* %.in39 to i32*
  %799 = load i32, i32* %798, align 4
  %800 = and i32 %799, 15
  %801 = icmp eq i32 %800, 0
  br i1 %801, label %809, label %802

; <label>:802:                                    ; preds = %797
  %803 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %804 = load i32, i32* %803, align 4
  %805 = icmp eq i32 %804, 0
  br i1 %805, label %806, label %1553

; <label>:806:                                    ; preds = %802
  %807 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %808 = load i8*, i8** %807, align 8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %808, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.10, i64 0, i64 0), i32 %799) #3
  br label %809

; <label>:809:                                    ; preds = %797, %806
  %810 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  store i32 %799, i32* %810, align 4
  %811 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %812 = load i32, i32* %811, align 8
  %813 = or i32 %812, 1024
  store i32 %813, i32* %811, align 8
  br label %.thread

; <label>:814:                                    ; preds = %3
  %815 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %816 = load i32, i32* %815, align 8
  %817 = icmp ult i32 %816, 41
  br i1 %817, label %818, label %824

; <label>:818:                                    ; preds = %814
  %819 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %820 = load i8*, i8** %819, align 8
  %821 = sext i32 %816 to i64
  %822 = getelementptr i8, i8* %820, i64 %821
  %823 = add i32 %816, 8
  store i32 %823, i32* %815, align 8
  br label %828

; <label>:824:                                    ; preds = %814
  %825 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %826 = load i8*, i8** %825, align 8
  %827 = getelementptr i8, i8* %826, i64 8
  store i8* %827, i8** %825, align 8
  br label %828

; <label>:828:                                    ; preds = %824, %818
  %.in38 = phi i8* [ %822, %818 ], [ %826, %824 ]
  %829 = bitcast i8* %.in38 to i32*
  %830 = load i32, i32* %829, align 4
  %831 = and i32 %830, 15
  %832 = icmp eq i32 %831, 0
  br i1 %832, label %840, label %833

; <label>:833:                                    ; preds = %828
  %834 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %835 = load i32, i32* %834, align 4
  %836 = icmp eq i32 %835, 0
  br i1 %836, label %837, label %1553

; <label>:837:                                    ; preds = %833
  %838 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %839 = load i8*, i8** %838, align 8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %839, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.11, i64 0, i64 0), i32 %830) #3
  br label %840

; <label>:840:                                    ; preds = %828, %837
  %841 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  store i32 %830, i32* %841, align 8
  %842 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %843 = load i32, i32* %842, align 8
  %844 = or i32 %843, 1024
  store i32 %844, i32* %842, align 8
  br label %.thread

; <label>:845:                                    ; preds = %3
  %846 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %847 = load i32, i32* %846, align 8
  %848 = icmp ult i32 %847, 41
  br i1 %848, label %849, label %855

; <label>:849:                                    ; preds = %845
  %850 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %851 = load i8*, i8** %850, align 8
  %852 = sext i32 %847 to i64
  %853 = getelementptr i8, i8* %851, i64 %852
  %854 = add i32 %847, 8
  store i32 %854, i32* %846, align 8
  br label %859

; <label>:855:                                    ; preds = %845
  %856 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %857 = load i8*, i8** %856, align 8
  %858 = getelementptr i8, i8* %857, i64 8
  store i8* %858, i8** %856, align 8
  br label %859

; <label>:859:                                    ; preds = %855, %849
  %.in37 = phi i8* [ %853, %849 ], [ %857, %855 ]
  %860 = bitcast i8* %.in37 to i32*
  %861 = load i32, i32* %860, align 4
  %862 = icmp eq i32 %861, 0
  br i1 %862, label %1553, label %863

; <label>:863:                                    ; preds = %859
  %864 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  store i32 %861, i32* %864, align 4
  br label %.thread

; <label>:865:                                    ; preds = %3
  %866 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %867 = load i32, i32* %866, align 8
  %868 = icmp ult i32 %867, 41
  br i1 %868, label %869, label %875

; <label>:869:                                    ; preds = %865
  %870 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %871 = load i8*, i8** %870, align 8
  %872 = sext i32 %867 to i64
  %873 = getelementptr i8, i8* %871, i64 %872
  %874 = add i32 %867, 8
  store i32 %874, i32* %866, align 8
  br label %879

; <label>:875:                                    ; preds = %865
  %876 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %877 = load i8*, i8** %876, align 8
  %878 = getelementptr i8, i8* %877, i64 8
  store i8* %878, i8** %876, align 8
  br label %879

; <label>:879:                                    ; preds = %875, %869
  %.in36 = phi i8* [ %873, %869 ], [ %877, %875 ]
  %880 = bitcast i8* %.in36 to i32*
  %881 = load i32, i32* %880, align 4
  store i32 %881, i32* %4, align 4
  switch i32 %881, label %1545 [
    i32 0, label %882
    i32 1, label %883
    i32 2, label %884
    i32 3, label %885
  ]

; <label>:882:                                    ; preds = %879
  store i32 4, i32* %4, align 4
  br label %886

; <label>:883:                                    ; preds = %879
  store i32 2, i32* %4, align 4
  br label %886

; <label>:884:                                    ; preds = %879
  store i32 1, i32* %4, align 4
  br label %886

; <label>:885:                                    ; preds = %879
  store i32 3, i32* %4, align 4
  br label %886

; <label>:886:                                    ; preds = %885, %884, %883, %882
  %887 = load i32, i32* %4, align 4
  %888 = trunc i32 %887 to i16
  %889 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  store i16 %888, i16* %889, align 2
  br label %.thread

; <label>:890:                                    ; preds = %3
  %891 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %892 = load i32, i32* %891, align 8
  %893 = icmp ult i32 %892, 41
  br i1 %893, label %894, label %900

; <label>:894:                                    ; preds = %890
  %895 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %896 = load i8*, i8** %895, align 8
  %897 = sext i32 %892 to i64
  %898 = getelementptr i8, i8* %896, i64 %897
  %899 = add i32 %892, 8
  store i32 %899, i32* %891, align 8
  br label %904

; <label>:900:                                    ; preds = %890
  %901 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %902 = load i8*, i8** %901, align 8
  %903 = getelementptr i8, i8* %902, i64 8
  store i8* %903, i8** %901, align 8
  br label %904

; <label>:904:                                    ; preds = %900, %894
  %.in35 = phi i8* [ %898, %894 ], [ %902, %900 ]
  %905 = bitcast i8* %.in35 to i32*
  %906 = load i32, i32* %905, align 4
  store i32 %906, i32* %4, align 4
  %.off96 = add i32 %906, -1
  %907 = icmp ugt i32 %.off96, 3
  br i1 %907, label %1545, label %908

; <label>:908:                                    ; preds = %904
  %909 = trunc i32 %906 to i16
  %910 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  store i16 %909, i16* %910, align 2
  br label %.thread

; <label>:911:                                    ; preds = %3
  %912 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %913 = load i32, i32* %912, align 8
  %914 = icmp ult i32 %913, 41
  br i1 %914, label %915, label %921

; <label>:915:                                    ; preds = %911
  %916 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %917 = load i8*, i8** %916, align 8
  %918 = sext i32 %913 to i64
  %919 = getelementptr i8, i8* %917, i64 %918
  %920 = add i32 %913, 8
  store i32 %920, i32* %912, align 8
  br label %925

; <label>:921:                                    ; preds = %911
  %922 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %923 = load i8*, i8** %922, align 8
  %924 = getelementptr i8, i8* %923, i64 8
  store i8* %924, i8** %922, align 8
  br label %925

; <label>:925:                                    ; preds = %921, %915
  %.in34 = phi i8* [ %919, %915 ], [ %923, %921 ]
  %926 = bitcast i8* %.in34 to i32*
  %927 = load i32, i32* %926, align 4
  %928 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  store i32 %927, i32* %928, align 8
  br label %.thread

; <label>:929:                                    ; preds = %3
  %930 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 1
  %931 = load i32, i32* %930, align 4
  %932 = icmp ult i32 %931, 161
  br i1 %932, label %933, label %939

; <label>:933:                                    ; preds = %929
  %934 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %935 = load i8*, i8** %934, align 8
  %936 = sext i32 %931 to i64
  %937 = getelementptr i8, i8* %935, i64 %936
  %938 = add i32 %931, 16
  store i32 %938, i32* %930, align 4
  br label %943

; <label>:939:                                    ; preds = %929
  %940 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %941 = load i8*, i8** %940, align 8
  %942 = getelementptr i8, i8* %941, i64 8
  store i8* %942, i8** %940, align 8
  br label %943

; <label>:943:                                    ; preds = %939, %933
  %.in33 = phi i8* [ %937, %933 ], [ %941, %939 ]
  %944 = bitcast i8* %.in33 to double*
  %945 = load double, double* %944, align 8
  %946 = fcmp ugt double %945, 0.000000e+00
  br i1 %946, label %947, label %1560

; <label>:947:                                    ; preds = %943
  %948 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 32
  store double %945, double* %948, align 8
  br label %.thread

; <label>:949:                                    ; preds = %3
  %950 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %951 = load i32, i32* %950, align 8
  %952 = icmp ult i32 %951, 41
  br i1 %952, label %953, label %959

; <label>:953:                                    ; preds = %949
  %954 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %955 = load i8*, i8** %954, align 8
  %956 = sext i32 %951 to i64
  %957 = getelementptr i8, i8* %955, i64 %956
  %958 = add i32 %951, 8
  store i32 %958, i32* %950, align 8
  br label %963

; <label>:959:                                    ; preds = %949
  %960 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %961 = load i8*, i8** %960, align 8
  %962 = getelementptr i8, i8* %961, i64 8
  store i8* %962, i8** %960, align 8
  br label %963

; <label>:963:                                    ; preds = %959, %953
  %.in32 = phi i8* [ %957, %953 ], [ %961, %959 ]
  %964 = bitcast i8* %.in32 to i32*
  %965 = load i32, i32* %964, align 4
  %966 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 67
  store i32 %965, i32* %966, align 8
  br label %.thread

; <label>:967:                                    ; preds = %3
  %968 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %969 = load i32, i32* %968, align 8
  %970 = icmp ult i32 %969, 41
  br i1 %970, label %971, label %977

; <label>:971:                                    ; preds = %967
  %972 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %973 = load i8*, i8** %972, align 8
  %974 = sext i32 %969 to i64
  %975 = getelementptr i8, i8* %973, i64 %974
  %976 = add i32 %969, 8
  store i32 %976, i32* %968, align 8
  br label %981

; <label>:977:                                    ; preds = %967
  %978 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %979 = load i8*, i8** %978, align 8
  %980 = getelementptr i8, i8* %979, i64 8
  store i8* %980, i8** %978, align 8
  br label %981

; <label>:981:                                    ; preds = %977, %971
  %.in31 = phi i8* [ %975, %971 ], [ %979, %977 ]
  %982 = bitcast i8* %.in31 to i32*
  %983 = load i32, i32* %982, align 4
  %984 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 68
  store i32 %983, i32* %984, align 4
  br label %.thread

; <label>:985:                                    ; preds = %3
  %986 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 69
  %987 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %988 = load i32, i32* %987, align 8
  %989 = icmp ult i32 %988, 41
  br i1 %989, label %990, label %996

; <label>:990:                                    ; preds = %985
  %991 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %992 = load i8*, i8** %991, align 8
  %993 = sext i32 %988 to i64
  %994 = getelementptr i8, i8* %992, i64 %993
  %995 = add i32 %988, 8
  store i32 %995, i32* %987, align 8
  br label %1000

; <label>:996:                                    ; preds = %985
  %997 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %998 = load i8*, i8** %997, align 8
  %999 = getelementptr i8, i8* %998, i64 8
  store i8* %999, i8** %997, align 8
  br label %1000

; <label>:1000:                                   ; preds = %996, %990
  %.in30 = phi i8* [ %994, %990 ], [ %998, %996 ]
  %1001 = bitcast i8* %.in30 to i8**
  %1002 = load i8*, i8** %1001, align 8
  tail call void @_TIFFsetString(i8** %986, i8* %1002)
  br label %.thread

; <label>:1003:                                   ; preds = %3
  %1004 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 70
  %1005 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1006 = load i32, i32* %1005, align 8
  %1007 = icmp ult i32 %1006, 41
  br i1 %1007, label %1008, label %1014

; <label>:1008:                                   ; preds = %1003
  %1009 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1010 = load i8*, i8** %1009, align 8
  %1011 = sext i32 %1006 to i64
  %1012 = getelementptr i8, i8* %1010, i64 %1011
  %1013 = add i32 %1006, 8
  store i32 %1013, i32* %1005, align 8
  br label %1018

; <label>:1014:                                   ; preds = %1003
  %1015 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1016 = load i8*, i8** %1015, align 8
  %1017 = getelementptr i8, i8* %1016, i64 8
  store i8* %1017, i8** %1015, align 8
  br label %1018

; <label>:1018:                                   ; preds = %1014, %1008
  %.in29 = phi i8* [ %1012, %1008 ], [ %1016, %1014 ]
  %1019 = bitcast i8* %.in29 to i8**
  %1020 = load i8*, i8** %1019, align 8
  tail call void @_TIFFsetString(i8** %1004, i8* %1020)
  br label %.thread

; <label>:1021:                                   ; preds = %3
  %1022 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 1
  %1023 = load i32, i32* %1022, align 4
  %1024 = icmp ult i32 %1023, 161
  br i1 %1024, label %1025, label %1031

; <label>:1025:                                   ; preds = %1021
  %1026 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1027 = load i8*, i8** %1026, align 8
  %1028 = sext i32 %1023 to i64
  %1029 = getelementptr i8, i8* %1027, i64 %1028
  %1030 = add i32 %1023, 16
  store i32 %1030, i32* %1022, align 4
  br label %1035

; <label>:1031:                                   ; preds = %1021
  %1032 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1033 = load i8*, i8** %1032, align 8
  %1034 = getelementptr i8, i8* %1033, i64 8
  store i8* %1034, i8** %1032, align 8
  br label %1035

; <label>:1035:                                   ; preds = %1031, %1025
  %.in28 = phi i8* [ %1029, %1025 ], [ %1033, %1031 ]
  %1036 = bitcast i8* %.in28 to double*
  %1037 = load double, double* %1036, align 8
  %1038 = fptrunc double %1037 to float
  %1039 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 71
  store float %1038, float* %1039, align 8
  br label %.thread

; <label>:1040:                                   ; preds = %3
  %1041 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 72
  %1042 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1043 = load i32, i32* %1042, align 8
  %1044 = icmp ult i32 %1043, 41
  br i1 %1044, label %1045, label %1051

; <label>:1045:                                   ; preds = %1040
  %1046 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1047 = load i8*, i8** %1046, align 8
  %1048 = sext i32 %1043 to i64
  %1049 = getelementptr i8, i8* %1047, i64 %1048
  %1050 = add i32 %1043, 8
  store i32 %1050, i32* %1042, align 8
  br label %1055

; <label>:1051:                                   ; preds = %1040
  %1052 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1053 = load i8*, i8** %1052, align 8
  %1054 = getelementptr i8, i8* %1053, i64 8
  store i8* %1054, i8** %1052, align 8
  br label %1055

; <label>:1055:                                   ; preds = %1051, %1045
  %.in27 = phi i8* [ %1049, %1045 ], [ %1053, %1051 ]
  %1056 = bitcast i8* %.in27 to float**
  %1057 = load float*, float** %1056, align 8
  tail call void @_TIFFsetFloatArray(float** %1041, float* %1057, i64 16)
  br label %.thread

; <label>:1058:                                   ; preds = %3
  %1059 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 73
  %1060 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1061 = load i32, i32* %1060, align 8
  %1062 = icmp ult i32 %1061, 41
  br i1 %1062, label %1063, label %1069

; <label>:1063:                                   ; preds = %1058
  %1064 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1065 = load i8*, i8** %1064, align 8
  %1066 = sext i32 %1061 to i64
  %1067 = getelementptr i8, i8* %1065, i64 %1066
  %1068 = add i32 %1061, 8
  store i32 %1068, i32* %1060, align 8
  br label %1073

; <label>:1069:                                   ; preds = %1058
  %1070 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1071 = load i8*, i8** %1070, align 8
  %1072 = getelementptr i8, i8* %1071, i64 8
  store i8* %1072, i8** %1070, align 8
  br label %1073

; <label>:1073:                                   ; preds = %1069, %1063
  %.in26 = phi i8* [ %1067, %1063 ], [ %1071, %1069 ]
  %1074 = bitcast i8* %.in26 to float**
  %1075 = load float*, float** %1074, align 8
  tail call void @_TIFFsetFloatArray(float** %1059, float* %1075, i64 16)
  br label %.thread

; <label>:1076:                                   ; preds = %3
  %1077 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %1078 = load i32, i32* %1077, align 8
  %1079 = and i32 %1078, 8192
  %1080 = icmp eq i32 %1079, 0
  br i1 %1080, label %1081, label %1118

; <label>:1081:                                   ; preds = %1076
  %1082 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1083 = load i32, i32* %1082, align 8
  %1084 = icmp ult i32 %1083, 41
  br i1 %1084, label %1085, label %1091

; <label>:1085:                                   ; preds = %1081
  %1086 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1087 = load i8*, i8** %1086, align 8
  %1088 = sext i32 %1083 to i64
  %1089 = getelementptr i8, i8* %1087, i64 %1088
  %1090 = add i32 %1083, 8
  store i32 %1090, i32* %1082, align 8
  br label %1095

; <label>:1091:                                   ; preds = %1081
  %1092 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1093 = load i8*, i8** %1092, align 8
  %1094 = getelementptr i8, i8* %1093, i64 8
  store i8* %1094, i8** %1092, align 8
  br label %1095

; <label>:1095:                                   ; preds = %1091, %1085
  %.in24 = phi i8* [ %1089, %1085 ], [ %1093, %1091 ]
  %1096 = bitcast i8* %.in24 to i32*
  %1097 = load i32, i32* %1096, align 4
  %1098 = trunc i32 %1097 to i16
  %1099 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 46
  store i16 %1098, i16* %1099, align 8
  %1100 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 47
  %1101 = load i32, i32* %1082, align 8
  %1102 = icmp ult i32 %1101, 41
  br i1 %1102, label %1103, label %1109

; <label>:1103:                                   ; preds = %1095
  %1104 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1105 = load i8*, i8** %1104, align 8
  %1106 = sext i32 %1101 to i64
  %1107 = getelementptr i8, i8* %1105, i64 %1106
  %1108 = add i32 %1101, 8
  store i32 %1108, i32* %1082, align 8
  br label %1113

; <label>:1109:                                   ; preds = %1095
  %1110 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1111 = load i8*, i8** %1110, align 8
  %1112 = getelementptr i8, i8* %1111, i64 8
  store i8* %1112, i8** %1110, align 8
  br label %1113

; <label>:1113:                                   ; preds = %1109, %1103
  %.in25 = phi i8* [ %1107, %1103 ], [ %1111, %1109 ]
  %1114 = bitcast i8* %.in25 to i32**
  %1115 = load i32*, i32** %1114, align 8
  %1116 = load i16, i16* %1099, align 8
  %1117 = zext i16 %1116 to i64
  tail call void @_TIFFsetLongArray(i32** %1100, i32* %1115, i64 %1117)
  br label %.thread

; <label>:1118:                                   ; preds = %1076
  %1119 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %1120 = load i8*, i8** %1119, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %1120, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.12, i64 0, i64 0)) #3
  br label %.thread93

; <label>:1121:                                   ; preds = %3
  %1122 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 48
  %1123 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1124 = load i32, i32* %1123, align 8
  %1125 = icmp ult i32 %1124, 41
  br i1 %1125, label %1126, label %1132

; <label>:1126:                                   ; preds = %1121
  %1127 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1128 = load i8*, i8** %1127, align 8
  %1129 = sext i32 %1124 to i64
  %1130 = getelementptr i8, i8* %1128, i64 %1129
  %1131 = add i32 %1124, 8
  store i32 %1131, i32* %1123, align 8
  br label %1136

; <label>:1132:                                   ; preds = %1121
  %1133 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1134 = load i8*, i8** %1133, align 8
  %1135 = getelementptr i8, i8* %1134, i64 8
  store i8* %1135, i8** %1133, align 8
  br label %1136

; <label>:1136:                                   ; preds = %1132, %1126
  %.in23 = phi i8* [ %1130, %1126 ], [ %1134, %1132 ]
  %1137 = bitcast i8* %.in23 to float**
  %1138 = load float*, float** %1137, align 8
  tail call void @_TIFFsetFloatArray(float** %1122, float* %1138, i64 3)
  br label %.thread

; <label>:1139:                                   ; preds = %3
  %1140 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1141 = load i32, i32* %1140, align 8
  %1142 = icmp ult i32 %1141, 41
  br i1 %1142, label %1143, label %1149

; <label>:1143:                                   ; preds = %1139
  %1144 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1145 = load i8*, i8** %1144, align 8
  %1146 = sext i32 %1141 to i64
  %1147 = getelementptr i8, i8* %1145, i64 %1146
  %1148 = add i32 %1141, 8
  store i32 %1148, i32* %1140, align 8
  br label %1153

; <label>:1149:                                   ; preds = %1139
  %1150 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1151 = load i8*, i8** %1150, align 8
  %1152 = getelementptr i8, i8* %1151, i64 8
  store i8* %1152, i8** %1150, align 8
  br label %1153

; <label>:1153:                                   ; preds = %1149, %1143
  %.in22 = phi i8* [ %1147, %1143 ], [ %1151, %1149 ]
  %1154 = bitcast i8* %.in22 to i32*
  %1155 = load i32, i32* %1154, align 4
  %1156 = trunc i32 %1155 to i16
  %1157 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 50
  store i16 %1156, i16* %1157, align 4
  br label %.thread

; <label>:1158:                                   ; preds = %3
  %1159 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1160 = load i32, i32* %1159, align 8
  %1161 = icmp ult i32 %1160, 41
  br i1 %1161, label %1162, label %1168

; <label>:1162:                                   ; preds = %1158
  %1163 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1164 = load i8*, i8** %1163, align 8
  %1165 = sext i32 %1160 to i64
  %1166 = getelementptr i8, i8* %1164, i64 %1165
  %1167 = add i32 %1160, 8
  store i32 %1167, i32* %1159, align 8
  br label %1172

; <label>:1168:                                   ; preds = %1158
  %1169 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1170 = load i8*, i8** %1169, align 8
  %1171 = getelementptr i8, i8* %1170, i64 8
  store i8* %1171, i8** %1169, align 8
  br label %1172

; <label>:1172:                                   ; preds = %1168, %1162
  %.in20 = phi i8* [ %1166, %1162 ], [ %1170, %1168 ]
  %1173 = bitcast i8* %.in20 to i32*
  %1174 = load i32, i32* %1173, align 4
  %1175 = trunc i32 %1174 to i16
  %1176 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 0
  store i16 %1175, i16* %1176, align 8
  %1177 = load i32, i32* %1159, align 8
  %1178 = icmp ult i32 %1177, 41
  br i1 %1178, label %1179, label %1185

; <label>:1179:                                   ; preds = %1172
  %1180 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1181 = load i8*, i8** %1180, align 8
  %1182 = sext i32 %1177 to i64
  %1183 = getelementptr i8, i8* %1181, i64 %1182
  %1184 = add i32 %1177, 8
  store i32 %1184, i32* %1159, align 8
  br label %1189

; <label>:1185:                                   ; preds = %1172
  %1186 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1187 = load i8*, i8** %1186, align 8
  %1188 = getelementptr i8, i8* %1187, i64 8
  store i8* %1188, i8** %1186, align 8
  br label %1189

; <label>:1189:                                   ; preds = %1185, %1179
  %.in21 = phi i8* [ %1183, %1179 ], [ %1187, %1185 ]
  %1190 = bitcast i8* %.in21 to i32*
  %1191 = load i32, i32* %1190, align 4
  %1192 = trunc i32 %1191 to i16
  %1193 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 1
  store i16 %1192, i16* %1193, align 2
  br label %.thread

; <label>:1194:                                   ; preds = %3
  %1195 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 51
  %1196 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1197 = load i32, i32* %1196, align 8
  %1198 = icmp ult i32 %1197, 41
  br i1 %1198, label %1199, label %1205

; <label>:1199:                                   ; preds = %1194
  %1200 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1201 = load i8*, i8** %1200, align 8
  %1202 = sext i32 %1197 to i64
  %1203 = getelementptr i8, i8* %1201, i64 %1202
  %1204 = add i32 %1197, 8
  store i32 %1204, i32* %1196, align 8
  br label %1209

; <label>:1205:                                   ; preds = %1194
  %1206 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1207 = load i8*, i8** %1206, align 8
  %1208 = getelementptr i8, i8* %1207, i64 8
  store i8* %1208, i8** %1206, align 8
  br label %1209

; <label>:1209:                                   ; preds = %1205, %1199
  %.in19 = phi i8* [ %1203, %1199 ], [ %1207, %1205 ]
  %1210 = bitcast i8* %.in19 to float**
  %1211 = load float*, float** %1210, align 8
  tail call void @_TIFFsetFloatArray(float** %1195, float* %1211, i64 2)
  br label %.thread

; <label>:1212:                                   ; preds = %3
  %1213 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 52
  %1214 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1215 = load i32, i32* %1214, align 8
  %1216 = icmp ult i32 %1215, 41
  br i1 %1216, label %1217, label %1223

; <label>:1217:                                   ; preds = %1212
  %1218 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1219 = load i8*, i8** %1218, align 8
  %1220 = sext i32 %1215 to i64
  %1221 = getelementptr i8, i8* %1219, i64 %1220
  %1222 = add i32 %1215, 8
  store i32 %1222, i32* %1214, align 8
  br label %1227

; <label>:1223:                                   ; preds = %1212
  %1224 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1225 = load i8*, i8** %1224, align 8
  %1226 = getelementptr i8, i8* %1225, i64 8
  store i8* %1226, i8** %1224, align 8
  br label %1227

; <label>:1227:                                   ; preds = %1223, %1217
  %.in18 = phi i8* [ %1221, %1217 ], [ %1225, %1223 ]
  %1228 = bitcast i8* %.in18 to float**
  %1229 = load float*, float** %1228, align 8
  tail call void @_TIFFsetFloatArray(float** %1213, float* %1229, i64 6)
  br label %.thread

.lr.ph:                                           ; preds = %3
  %1230 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %1231 = load i16, i16* %1230, align 2
  %1232 = zext i16 %1231 to i32
  %1233 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %1234 = load i16, i16* %1233, align 4
  %1235 = zext i16 %1234 to i32
  %1236 = sub nsw i32 %1232, %1235
  %1237 = icmp sgt i32 %1236, 1
  %1238 = select i1 %1237, i32 3, i32 1
  store i32 %1238, i32* %4, align 4
  %1239 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1240 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1241 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %1242 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1243 = zext i32 %1238 to i64
  br label %1244

; <label>:1244:                                   ; preds = %.lr.ph, %1256
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %1256 ]
  %1245 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 %indvars.iv
  %1246 = load i32, i32* %1239, align 8
  %1247 = icmp ult i32 %1246, 41
  br i1 %1247, label %1248, label %1253

; <label>:1248:                                   ; preds = %1244
  %1249 = load i8*, i8** %1240, align 8
  %1250 = sext i32 %1246 to i64
  %1251 = getelementptr i8, i8* %1249, i64 %1250
  %1252 = add i32 %1246, 8
  store i32 %1252, i32* %1239, align 8
  br label %1256

; <label>:1253:                                   ; preds = %1244
  %1254 = load i8*, i8** %1242, align 8
  %1255 = getelementptr i8, i8* %1254, i64 8
  store i8* %1255, i8** %1242, align 8
  br label %1256

; <label>:1256:                                   ; preds = %1253, %1248
  %.in17 = phi i8* [ %1251, %1248 ], [ %1254, %1253 ]
  %1257 = bitcast i8* %.in17 to i16**
  %1258 = load i16*, i16** %1257, align 8
  %1259 = load i16, i16* %1241, align 4
  %1260 = zext i16 %1259 to i64
  %1261 = shl i64 1, %1260
  tail call void @_TIFFsetShortArray(i16** %1245, i16* %1258, i64 %1261)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %1262 = icmp slt i64 %indvars.iv.next, %1243
  br i1 %1262, label %1244, label %.thread.loopexit

; <label>:1263:                                   ; preds = %3
  %1264 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 53
  %1265 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1266 = load i32, i32* %1265, align 8
  %1267 = icmp ult i32 %1266, 41
  br i1 %1267, label %1268, label %1274

; <label>:1268:                                   ; preds = %1263
  %1269 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1270 = load i8*, i8** %1269, align 8
  %1271 = sext i32 %1266 to i64
  %1272 = getelementptr i8, i8* %1270, i64 %1271
  %1273 = add i32 %1266, 8
  store i32 %1273, i32* %1265, align 8
  br label %1278

; <label>:1274:                                   ; preds = %1263
  %1275 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1276 = load i8*, i8** %1275, align 8
  %1277 = getelementptr i8, i8* %1276, i64 8
  store i8* %1277, i8** %1275, align 8
  br label %1278

; <label>:1278:                                   ; preds = %1274, %1268
  %.in16 = phi i8* [ %1272, %1268 ], [ %1276, %1274 ]
  %1279 = bitcast i8* %.in16 to float**
  %1280 = load float*, float** %1279, align 8
  tail call void @_TIFFsetFloatArray(float** %1264, float* %1280, i64 6)
  br label %.thread

; <label>:1281:                                   ; preds = %3
  %1282 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1283 = load i32, i32* %1282, align 8
  %1284 = icmp ult i32 %1283, 41
  br i1 %1284, label %1285, label %1291

; <label>:1285:                                   ; preds = %1281
  %1286 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1287 = load i8*, i8** %1286, align 8
  %1288 = sext i32 %1283 to i64
  %1289 = getelementptr i8, i8* %1287, i64 %1288
  %1290 = add i32 %1283, 8
  store i32 %1290, i32* %1282, align 8
  br label %1295

; <label>:1291:                                   ; preds = %1281
  %1292 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1293 = load i8*, i8** %1292, align 8
  %1294 = getelementptr i8, i8* %1293, i64 8
  store i8* %1294, i8** %1292, align 8
  br label %1295

; <label>:1295:                                   ; preds = %1291, %1285
  %.in15 = phi i8* [ %1289, %1285 ], [ %1293, %1291 ]
  %1296 = bitcast i8* %.in15 to i32*
  %1297 = load i32, i32* %1296, align 4
  %1298 = trunc i32 %1297 to i16
  %1299 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 55
  store i16 %1298, i16* %1299, align 8
  br label %.thread

; <label>:1300:                                   ; preds = %3
  %1301 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1302 = load i32, i32* %1301, align 8
  %1303 = icmp ult i32 %1302, 41
  br i1 %1303, label %1304, label %1310

; <label>:1304:                                   ; preds = %1300
  %1305 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1306 = load i8*, i8** %1305, align 8
  %1307 = sext i32 %1302 to i64
  %1308 = getelementptr i8, i8* %1306, i64 %1307
  %1309 = add i32 %1302, 8
  store i32 %1309, i32* %1301, align 8
  br label %1314

; <label>:1310:                                   ; preds = %1300
  %1311 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1312 = load i8*, i8** %1311, align 8
  %1313 = getelementptr i8, i8* %1312, i64 8
  store i8* %1313, i8** %1311, align 8
  br label %1314

; <label>:1314:                                   ; preds = %1310, %1304
  %.in13 = phi i8* [ %1308, %1304 ], [ %1312, %1310 ]
  %1315 = bitcast i8* %.in13 to i32*
  %1316 = load i32, i32* %1315, align 4
  %1317 = trunc i32 %1316 to i16
  %1318 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 57, i64 0
  store i16 %1317, i16* %1318, align 4
  %1319 = load i32, i32* %1301, align 8
  %1320 = icmp ult i32 %1319, 41
  br i1 %1320, label %1321, label %1327

; <label>:1321:                                   ; preds = %1314
  %1322 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1323 = load i8*, i8** %1322, align 8
  %1324 = sext i32 %1319 to i64
  %1325 = getelementptr i8, i8* %1323, i64 %1324
  %1326 = add i32 %1319, 8
  store i32 %1326, i32* %1301, align 8
  br label %1331

; <label>:1327:                                   ; preds = %1314
  %1328 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1329 = load i8*, i8** %1328, align 8
  %1330 = getelementptr i8, i8* %1329, i64 8
  store i8* %1330, i8** %1328, align 8
  br label %1331

; <label>:1331:                                   ; preds = %1327, %1321
  %.in14 = phi i8* [ %1325, %1321 ], [ %1329, %1327 ]
  %1332 = bitcast i8* %.in14 to i32*
  %1333 = load i32, i32* %1332, align 4
  %1334 = trunc i32 %1333 to i16
  %1335 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 57, i64 1
  store i16 %1334, i16* %1335, align 2
  br label %.thread

; <label>:1336:                                   ; preds = %3
  %1337 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1338 = load i32, i32* %1337, align 8
  %1339 = icmp ult i32 %1338, 41
  br i1 %1339, label %1340, label %1346

; <label>:1340:                                   ; preds = %1336
  %1341 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1342 = load i8*, i8** %1341, align 8
  %1343 = sext i32 %1338 to i64
  %1344 = getelementptr i8, i8* %1342, i64 %1343
  %1345 = add i32 %1338, 8
  store i32 %1345, i32* %1337, align 8
  br label %1350

; <label>:1346:                                   ; preds = %1336
  %1347 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1348 = load i8*, i8** %1347, align 8
  %1349 = getelementptr i8, i8* %1348, i64 8
  store i8* %1349, i8** %1347, align 8
  %.pr = load i32, i32* %1337, align 8
  br label %1350

; <label>:1350:                                   ; preds = %1346, %1340
  %1351 = phi i32 [ %.pr, %1346 ], [ %1345, %1340 ]
  %.in11 = phi i8* [ %1348, %1346 ], [ %1344, %1340 ]
  %1352 = bitcast i8* %.in11 to i32*
  %1353 = load i32, i32* %1352, align 4
  %1354 = icmp ult i32 %1351, 41
  br i1 %1354, label %1355, label %1361

; <label>:1355:                                   ; preds = %1350
  %1356 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1357 = load i8*, i8** %1356, align 8
  %1358 = sext i32 %1351 to i64
  %1359 = getelementptr i8, i8* %1357, i64 %1358
  %1360 = add i32 %1351, 8
  store i32 %1360, i32* %1337, align 8
  br label %1365

; <label>:1361:                                   ; preds = %1350
  %1362 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1363 = load i8*, i8** %1362, align 8
  %1364 = getelementptr i8, i8* %1363, i64 8
  store i8* %1364, i8** %1362, align 8
  br label %1365

; <label>:1365:                                   ; preds = %1361, %1355
  %.in12 = phi i8* [ %1359, %1355 ], [ %1363, %1361 ]
  %1366 = bitcast i8* %.in12 to i8**
  %1367 = load i8*, i8** %1366, align 8
  %1368 = tail call fastcc i32 @checkInkNamesString(%struct.tiff* %0, i32 %1353, i8* %1367)
  %1369 = icmp sgt i32 %1368, 0
  br i1 %1369, label %1370, label %.thread93

; <label>:1370:                                   ; preds = %1365
  %1371 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 58
  %1372 = sext i32 %1368 to i64
  %1373 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 59
  tail call void @_TIFFsetNString(i8** %1373, i8* %1367, i64 %1372)
  store i32 %1368, i32* %1371, align 8
  br label %.thread

; <label>:1374:                                   ; preds = %3
  %1375 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1376 = load i32, i32* %1375, align 8
  %1377 = icmp ult i32 %1376, 41
  br i1 %1377, label %1378, label %1384

; <label>:1378:                                   ; preds = %1374
  %1379 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1380 = load i8*, i8** %1379, align 8
  %1381 = sext i32 %1376 to i64
  %1382 = getelementptr i8, i8* %1380, i64 %1381
  %1383 = add i32 %1376, 8
  store i32 %1383, i32* %1375, align 8
  br label %1388

; <label>:1384:                                   ; preds = %1374
  %1385 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1386 = load i8*, i8** %1385, align 8
  %1387 = getelementptr i8, i8* %1386, i64 8
  store i8* %1387, i8** %1385, align 8
  br label %1388

; <label>:1388:                                   ; preds = %1384, %1378
  %.in10 = phi i8* [ %1382, %1378 ], [ %1386, %1384 ]
  %1389 = bitcast i8* %.in10 to i32*
  %1390 = load i32, i32* %1389, align 4
  %1391 = trunc i32 %1390 to i16
  %1392 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 56
  store i16 %1391, i16* %1392, align 2
  br label %.thread

; <label>:1393:                                   ; preds = %3
  %1394 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 60
  %1395 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1396 = load i32, i32* %1395, align 8
  %1397 = icmp ult i32 %1396, 41
  br i1 %1397, label %1398, label %1404

; <label>:1398:                                   ; preds = %1393
  %1399 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1400 = load i8*, i8** %1399, align 8
  %1401 = sext i32 %1396 to i64
  %1402 = getelementptr i8, i8* %1400, i64 %1401
  %1403 = add i32 %1396, 8
  store i32 %1403, i32* %1395, align 8
  br label %1408

; <label>:1404:                                   ; preds = %1393
  %1405 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1406 = load i8*, i8** %1405, align 8
  %1407 = getelementptr i8, i8* %1406, i64 8
  store i8* %1407, i8** %1405, align 8
  br label %1408

; <label>:1408:                                   ; preds = %1404, %1398
  %.in9 = phi i8* [ %1402, %1398 ], [ %1406, %1404 ]
  %1409 = bitcast i8* %.in9 to i8**
  %1410 = load i8*, i8** %1409, align 8
  tail call void @_TIFFsetString(i8** %1394, i8* %1410)
  br label %.thread

; <label>:1411:                                   ; preds = %3
  %1412 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1413 = load i32, i32* %1412, align 8
  %1414 = icmp ult i32 %1413, 41
  br i1 %1414, label %1415, label %1421

; <label>:1415:                                   ; preds = %1411
  %1416 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1417 = load i8*, i8** %1416, align 8
  %1418 = sext i32 %1413 to i64
  %1419 = getelementptr i8, i8* %1417, i64 %1418
  %1420 = add i32 %1413, 8
  store i32 %1420, i32* %1412, align 8
  br label %1425

; <label>:1421:                                   ; preds = %1411
  %1422 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1423 = load i8*, i8** %1422, align 8
  %1424 = getelementptr i8, i8* %1423, i64 8
  store i8* %1424, i8** %1422, align 8
  br label %1425

; <label>:1425:                                   ; preds = %1421, %1415
  %.in7 = phi i8* [ %1419, %1415 ], [ %1423, %1421 ]
  %1426 = bitcast i8* %.in7 to i32*
  %1427 = load i32, i32* %1426, align 4
  %1428 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 61
  store i32 %1427, i32* %1428, align 8
  %1429 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 62
  %1430 = load i32, i32* %1412, align 8
  %1431 = icmp ult i32 %1430, 41
  br i1 %1431, label %1432, label %1438

; <label>:1432:                                   ; preds = %1425
  %1433 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1434 = load i8*, i8** %1433, align 8
  %1435 = sext i32 %1430 to i64
  %1436 = getelementptr i8, i8* %1434, i64 %1435
  %1437 = add i32 %1430, 8
  store i32 %1437, i32* %1412, align 8
  br label %1442

; <label>:1438:                                   ; preds = %1425
  %1439 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1440 = load i8*, i8** %1439, align 8
  %1441 = getelementptr i8, i8* %1440, i64 8
  store i8* %1441, i8** %1439, align 8
  br label %1442

; <label>:1442:                                   ; preds = %1438, %1432
  %.in8 = phi i8* [ %1436, %1432 ], [ %1440, %1438 ]
  %1443 = bitcast i8* %.in8 to i8**
  %1444 = load i8*, i8** %1443, align 8
  %1445 = load i32, i32* %1428, align 8
  %1446 = zext i32 %1445 to i64
  tail call void @_TIFFsetByteArray(i8** %1429, i8* %1444, i64 %1446)
  br label %.thread

; <label>:1447:                                   ; preds = %3
  %1448 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1449 = load i32, i32* %1448, align 8
  %1450 = icmp ult i32 %1449, 41
  br i1 %1450, label %1451, label %1457

; <label>:1451:                                   ; preds = %1447
  %1452 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1453 = load i8*, i8** %1452, align 8
  %1454 = sext i32 %1449 to i64
  %1455 = getelementptr i8, i8* %1453, i64 %1454
  %1456 = add i32 %1449, 8
  store i32 %1456, i32* %1448, align 8
  br label %1461

; <label>:1457:                                   ; preds = %1447
  %1458 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1459 = load i8*, i8** %1458, align 8
  %1460 = getelementptr i8, i8* %1459, i64 8
  store i8* %1460, i8** %1458, align 8
  br label %1461

; <label>:1461:                                   ; preds = %1457, %1451
  %.in5 = phi i8* [ %1455, %1451 ], [ %1459, %1457 ]
  %1462 = bitcast i8* %.in5 to i32*
  %1463 = load i32, i32* %1462, align 4
  %1464 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 63
  store i32 %1463, i32* %1464, align 8
  %1465 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 64
  %1466 = load i32, i32* %1448, align 8
  %1467 = icmp ult i32 %1466, 41
  br i1 %1467, label %1468, label %1474

; <label>:1468:                                   ; preds = %1461
  %1469 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1470 = load i8*, i8** %1469, align 8
  %1471 = sext i32 %1466 to i64
  %1472 = getelementptr i8, i8* %1470, i64 %1471
  %1473 = add i32 %1466, 8
  store i32 %1473, i32* %1448, align 8
  br label %1478

; <label>:1474:                                   ; preds = %1461
  %1475 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1476 = load i8*, i8** %1475, align 8
  %1477 = getelementptr i8, i8* %1476, i64 8
  store i8* %1477, i8** %1475, align 8
  br label %1478

; <label>:1478:                                   ; preds = %1474, %1468
  %.in6 = phi i8* [ %1472, %1468 ], [ %1476, %1474 ]
  %1479 = bitcast i8* %.in6 to i8**
  %1480 = load i8*, i8** %1479, align 8
  %1481 = load i32, i32* %1464, align 8
  %1482 = zext i32 %1481 to i64
  tail call void @_TIFFsetByteArray(i8** %1465, i8* %1480, i64 %1482)
  br label %.thread

; <label>:1483:                                   ; preds = %3
  %1484 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1485 = load i32, i32* %1484, align 8
  %1486 = icmp ult i32 %1485, 41
  br i1 %1486, label %1487, label %1493

; <label>:1487:                                   ; preds = %1483
  %1488 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1489 = load i8*, i8** %1488, align 8
  %1490 = sext i32 %1485 to i64
  %1491 = getelementptr i8, i8* %1489, i64 %1490
  %1492 = add i32 %1485, 8
  store i32 %1492, i32* %1484, align 8
  br label %1497

; <label>:1493:                                   ; preds = %1483
  %1494 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1495 = load i8*, i8** %1494, align 8
  %1496 = getelementptr i8, i8* %1495, i64 8
  store i8* %1496, i8** %1494, align 8
  br label %1497

; <label>:1497:                                   ; preds = %1493, %1487
  %.in = phi i8* [ %1491, %1487 ], [ %1495, %1493 ]
  %1498 = bitcast i8* %.in to i32*
  %1499 = load i32, i32* %1498, align 4
  %1500 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 65
  store i32 %1499, i32* %1500, align 8
  %1501 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 66
  %1502 = bitcast i8** %1501 to i32**
  %1503 = load i32, i32* %1484, align 8
  %1504 = icmp ult i32 %1503, 41
  br i1 %1504, label %1505, label %1511

; <label>:1505:                                   ; preds = %1497
  %1506 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1507 = load i8*, i8** %1506, align 8
  %1508 = sext i32 %1503 to i64
  %1509 = getelementptr i8, i8* %1507, i64 %1508
  %1510 = add i32 %1503, 8
  store i32 %1510, i32* %1484, align 8
  br label %1515

; <label>:1511:                                   ; preds = %1497
  %1512 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1513 = load i8*, i8** %1512, align 8
  %1514 = getelementptr i8, i8* %1513, i64 8
  store i8* %1514, i8** %1512, align 8
  br label %1515

; <label>:1515:                                   ; preds = %1511, %1505
  %.in4 = phi i8* [ %1509, %1505 ], [ %1513, %1511 ]
  %1516 = bitcast i8* %.in4 to i32**
  %1517 = load i32*, i32** %1516, align 8
  %1518 = load i32, i32* %1500, align 8
  %1519 = zext i32 %1518 to i64
  tail call void @_TIFFsetLongArray(i32** %1502, i32* %1517, i64 %1519)
  br label %.thread

; <label>:1520:                                   ; preds = %3
  %1521 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %1522 = load i8*, i8** %1521, align 8
  %1523 = icmp ugt i32 %1, 65535
  %1524 = select i1 %1523, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0)
  %1525 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %1) #3
  %1526 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1525, i64 0, i32 7
  %1527 = load i8*, i8** %1526, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.13, i64 0, i64 0), i8* %1522, i8* %1524, i8* %1527) #3
  br label %.thread93

.thread.loopexit:                                 ; preds = %1256
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %1370, %83, %1113, %775, %781, %757, %414, %408, %360, %366, %136, %112, %74, %86, %88, %84, %20, %38, %56, %154, %173, %195, %213, %231, %249, %267, %285, %303, %321, %339, %387, %433, %452, %471, %490, %509, %528, %550, %568, %585, %604, %627, %661, %697, %754, %809, %840, %863, %886, %908, %925, %947, %963, %981, %1000, %1018, %1035, %1055, %1073, %1136, %1153, %1189, %1209, %1227, %1278, %1295, %1331, %1388, %1408, %1442, %1478, %1515
  %.189 = phi i32 [ 1, %1370 ], [ 1, %1113 ], [ 1, %775 ], [ 1, %781 ], [ 1, %757 ], [ 1, %414 ], [ 1, %408 ], [ 1, %360 ], [ 1, %366 ], [ %134, %136 ], [ 1, %112 ], [ 1, %74 ], [ 1, %86 ], [ 1, %88 ], [ 1, %84 ], [ 1, %20 ], [ 1, %38 ], [ 1, %56 ], [ 1, %154 ], [ 1, %173 ], [ 1, %195 ], [ 1, %213 ], [ 1, %231 ], [ 1, %249 ], [ 1, %267 ], [ 1, %285 ], [ 1, %303 ], [ 1, %321 ], [ 1, %339 ], [ 1, %387 ], [ 1, %433 ], [ 1, %452 ], [ 1, %471 ], [ 1, %490 ], [ 1, %509 ], [ 1, %528 ], [ 1, %550 ], [ 1, %568 ], [ 1, %585 ], [ 1, %604 ], [ 1, %627 ], [ 1, %661 ], [ 1, %697 ], [ 1, %754 ], [ 1, %809 ], [ 1, %840 ], [ 1, %863 ], [ 1, %886 ], [ 1, %908 ], [ 1, %925 ], [ 1, %947 ], [ 1, %963 ], [ 1, %981 ], [ 1, %1000 ], [ 1, %1018 ], [ 1, %1035 ], [ 1, %1055 ], [ 1, %1073 ], [ 1, %1136 ], [ 1, %1153 ], [ 1, %1189 ], [ 1, %1209 ], [ 1, %1227 ], [ 1, %1278 ], [ 1, %1295 ], [ 1, %1331 ], [ 1, %1388 ], [ 1, %1408 ], [ 1, %1442 ], [ 1, %1478 ], [ 1, %1515 ], [ 1, %83 ], [ 1, %.thread.loopexit ]
  %1528 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %1) #3
  %1529 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1528, i64 0, i32 4
  %1530 = load i16, i16* %1529, align 4
  %1531 = and i16 %1530, 31
  %1532 = zext i16 %1531 to i64
  %1533 = shl i64 1, %1532
  %1534 = call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %1) #3
  %1535 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1534, i64 0, i32 4
  %1536 = load i16, i16* %1535, align 4
  %div = lshr i16 %1536, 5
  %1537 = zext i16 %div to i64
  %1538 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 %1537
  %1539 = load i64, i64* %1538, align 8
  %1540 = or i64 %1539, %1533
  store i64 %1540, i64* %1538, align 8
  %1541 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %1542 = load i32, i32* %1541, align 8
  %1543 = or i32 %1542, 8
  store i32 %1543, i32* %1541, align 8
  br label %.thread93

.thread93:                                        ; preds = %1365, %1118, %132, %1520, %.thread
  %.190 = phi i32 [ %.189, %.thread ], [ 0, %1118 ], [ 0, %132 ], [ 0, %1520 ], [ 0, %1365 ]
  %1544 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_end(i8* %1544)
  br label %1567

; <label>:1545:                                   ; preds = %547, %192, %904, %879, %757, %623, %383
  %1546 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %1547 = load i8*, i8** %1546, align 8
  %1548 = load i32, i32* %4, align 4
  %1549 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %1) #3
  %1550 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1549, i64 0, i32 7
  %1551 = load i8*, i8** %1550, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %1547, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.15, i64 0, i64 0), i32 %1548, i8* %1551) #3
  %1552 = bitcast %struct.__va_list_tag* %2 to i8*
  tail call void @llvm.va_end(i8* %1552)
  br label %1567

; <label>:1553:                                   ; preds = %859, %833, %802, %404
  %.02 = phi i32 [ 0, %404 ], [ %799, %802 ], [ %830, %833 ], [ 0, %859 ]
  %1554 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %1555 = load i8*, i8** %1554, align 8
  %1556 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %1) #3
  %1557 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1556, i64 0, i32 7
  %1558 = load i8*, i8** %1557, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %1555, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.16, i64 0, i64 0), i32 %.02, i8* %1558) #3
  %1559 = bitcast %struct.__va_list_tag* %2 to i8*
  tail call void @llvm.va_end(i8* %1559)
  br label %1567

; <label>:1560:                                   ; preds = %943
  %1561 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %1562 = load i8*, i8** %1561, align 8
  %1563 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %1) #3
  %1564 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1563, i64 0, i32 7
  %1565 = load i8*, i8** %1564, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %1562, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.17, i64 0, i64 0), double %945, i8* %1565) #3
  %1566 = bitcast %struct.__va_list_tag* %2 to i8*
  tail call void @llvm.va_end(i8* %1566)
  br label %1567

; <label>:1567:                                   ; preds = %1560, %1553, %1545, %.thread93
  %.0 = phi i32 [ %.190, %.thread93 ], [ 0, %1560 ], [ 0, %1545 ], [ 0, %1553 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @_TIFFVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  switch i32 %1, label %1598 [
    i32 254, label %4
    i32 256, label %23
    i32 257, label %42
    i32 258, label %61
    i32 259, label %80
    i32 262, label %99
    i32 263, label %118
    i32 266, label %137
    i32 269, label %156
    i32 315, label %176
    i32 306, label %196
    i32 316, label %216
    i32 270, label %236
    i32 271, label %256
    i32 272, label %276
    i32 305, label %296
    i32 274, label %316
    i32 277, label %335
    i32 278, label %354
    i32 280, label %373
    i32 281, label %392
    i32 340, label %411
    i32 341, label %431
    i32 282, label %451
    i32 283, label %471
    i32 284, label %491
    i32 286, label %510
    i32 287, label %530
    i32 285, label %550
    i32 296, label %570
    i32 297, label %589
    i32 321, label %625
    i32 320, label %661
    i32 273, label %717
    i32 324, label %717
    i32 279, label %737
    i32 325, label %737
    i32 32995, label %757
    i32 338, label %785
    i32 322, label %822
    i32 323, label %841
    i32 32998, label %860
    i32 32996, label %879
    i32 339, label %940
    i32 32997, label %959
    i32 37439, label %978
    i32 330, label %998
    i32 529, label %1035
    i32 531, label %1055
    i32 530, label %1074
    i32 318, label %1110
    i32 319, label %1130
    i32 301, label %1150
    i32 532, label %1215
    i32 332, label %1235
    i32 336, label %1254
    i32 333, label %1290
    i32 334, label %1310
    i32 337, label %1329
    i32 34675, label %1349
    i32 34377, label %1386
    i32 33723, label %1423
    i32 33300, label %1460
    i32 33301, label %1479
    i32 33302, label %1498
    i32 33303, label %1518
    i32 33304, label %1538
    i32 33305, label %1558
    i32 33306, label %1578
  ]

; <label>:4:                                      ; preds = %3
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 7
  %6 = load i32, i32* %5, align 8
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %8 = load i32, i32* %7, align 8
  %9 = icmp ult i32 %8, 41
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %12 = load i8*, i8** %11, align 8
  %13 = sext i32 %8 to i64
  %14 = getelementptr i8, i8* %12, i64 %13
  %15 = add i32 %8, 8
  store i32 %15, i32* %7, align 8
  br label %20

; <label>:16:                                     ; preds = %4
  %17 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = getelementptr i8, i8* %18, i64 8
  store i8* %19, i8** %17, align 8
  br label %20

; <label>:20:                                     ; preds = %16, %10
  %.in82 = phi i8* [ %14, %10 ], [ %18, %16 ]
  %21 = bitcast i8* %.in82 to i32**
  %22 = load i32*, i32** %21, align 8
  store i32 %6, i32* %22, align 4
  br label %1606

; <label>:23:                                     ; preds = %3
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %25 = load i32, i32* %24, align 8
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %27 = load i32, i32* %26, align 8
  %28 = icmp ult i32 %27, 41
  br i1 %28, label %29, label %35

; <label>:29:                                     ; preds = %23
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %31 = load i8*, i8** %30, align 8
  %32 = sext i32 %27 to i64
  %33 = getelementptr i8, i8* %31, i64 %32
  %34 = add i32 %27, 8
  store i32 %34, i32* %26, align 8
  br label %39

; <label>:35:                                     ; preds = %23
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr i8, i8* %37, i64 8
  store i8* %38, i8** %36, align 8
  br label %39

; <label>:39:                                     ; preds = %35, %29
  %.in81 = phi i8* [ %33, %29 ], [ %37, %35 ]
  %40 = bitcast i8* %.in81 to i32**
  %41 = load i32*, i32** %40, align 8
  store i32 %25, i32* %41, align 4
  br label %1606

; <label>:42:                                     ; preds = %3
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %44 = load i32, i32* %43, align 4
  %45 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %46 = load i32, i32* %45, align 8
  %47 = icmp ult i32 %46, 41
  br i1 %47, label %48, label %54

; <label>:48:                                     ; preds = %42
  %49 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %50 = load i8*, i8** %49, align 8
  %51 = sext i32 %46 to i64
  %52 = getelementptr i8, i8* %50, i64 %51
  %53 = add i32 %46, 8
  store i32 %53, i32* %45, align 8
  br label %58

; <label>:54:                                     ; preds = %42
  %55 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %56 = load i8*, i8** %55, align 8
  %57 = getelementptr i8, i8* %56, i64 8
  store i8* %57, i8** %55, align 8
  br label %58

; <label>:58:                                     ; preds = %54, %48
  %.in80 = phi i8* [ %52, %48 ], [ %56, %54 ]
  %59 = bitcast i8* %.in80 to i32**
  %60 = load i32*, i32** %59, align 8
  store i32 %44, i32* %60, align 4
  br label %1606

; <label>:61:                                     ; preds = %3
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %63 = load i16, i16* %62, align 4
  %64 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %65 = load i32, i32* %64, align 8
  %66 = icmp ult i32 %65, 41
  br i1 %66, label %67, label %73

; <label>:67:                                     ; preds = %61
  %68 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %69 = load i8*, i8** %68, align 8
  %70 = sext i32 %65 to i64
  %71 = getelementptr i8, i8* %69, i64 %70
  %72 = add i32 %65, 8
  store i32 %72, i32* %64, align 8
  br label %77

; <label>:73:                                     ; preds = %61
  %74 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %75 = load i8*, i8** %74, align 8
  %76 = getelementptr i8, i8* %75, i64 8
  store i8* %76, i8** %74, align 8
  br label %77

; <label>:77:                                     ; preds = %73, %67
  %.in79 = phi i8* [ %71, %67 ], [ %75, %73 ]
  %78 = bitcast i8* %.in79 to i16**
  %79 = load i16*, i16** %78, align 8
  store i16 %63, i16* %79, align 2
  br label %1606

; <label>:80:                                     ; preds = %3
  %81 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %82 = load i16, i16* %81, align 8
  %83 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %84 = load i32, i32* %83, align 8
  %85 = icmp ult i32 %84, 41
  br i1 %85, label %86, label %92

; <label>:86:                                     ; preds = %80
  %87 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %88 = load i8*, i8** %87, align 8
  %89 = sext i32 %84 to i64
  %90 = getelementptr i8, i8* %88, i64 %89
  %91 = add i32 %84, 8
  store i32 %91, i32* %83, align 8
  br label %96

; <label>:92:                                     ; preds = %80
  %93 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %94 = load i8*, i8** %93, align 8
  %95 = getelementptr i8, i8* %94, i64 8
  store i8* %95, i8** %93, align 8
  br label %96

; <label>:96:                                     ; preds = %92, %86
  %.in78 = phi i8* [ %90, %86 ], [ %94, %92 ]
  %97 = bitcast i8* %.in78 to i16**
  %98 = load i16*, i16** %97, align 8
  store i16 %82, i16* %98, align 2
  br label %1606

; <label>:99:                                     ; preds = %3
  %100 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %101 = load i16, i16* %100, align 2
  %102 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %103 = load i32, i32* %102, align 8
  %104 = icmp ult i32 %103, 41
  br i1 %104, label %105, label %111

; <label>:105:                                    ; preds = %99
  %106 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %107 = load i8*, i8** %106, align 8
  %108 = sext i32 %103 to i64
  %109 = getelementptr i8, i8* %107, i64 %108
  %110 = add i32 %103, 8
  store i32 %110, i32* %102, align 8
  br label %115

; <label>:111:                                    ; preds = %99
  %112 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %113 = load i8*, i8** %112, align 8
  %114 = getelementptr i8, i8* %113, i64 8
  store i8* %114, i8** %112, align 8
  br label %115

; <label>:115:                                    ; preds = %111, %105
  %.in77 = phi i8* [ %109, %105 ], [ %113, %111 ]
  %116 = bitcast i8* %.in77 to i16**
  %117 = load i16*, i16** %116, align 8
  store i16 %101, i16* %117, align 2
  br label %1606

; <label>:118:                                    ; preds = %3
  %119 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 12
  %120 = load i16, i16* %119, align 4
  %121 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %122 = load i32, i32* %121, align 8
  %123 = icmp ult i32 %122, 41
  br i1 %123, label %124, label %130

; <label>:124:                                    ; preds = %118
  %125 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %126 = load i8*, i8** %125, align 8
  %127 = sext i32 %122 to i64
  %128 = getelementptr i8, i8* %126, i64 %127
  %129 = add i32 %122, 8
  store i32 %129, i32* %121, align 8
  br label %134

; <label>:130:                                    ; preds = %118
  %131 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %132 = load i8*, i8** %131, align 8
  %133 = getelementptr i8, i8* %132, i64 8
  store i8* %133, i8** %131, align 8
  br label %134

; <label>:134:                                    ; preds = %130, %124
  %.in76 = phi i8* [ %128, %124 ], [ %132, %130 ]
  %135 = bitcast i8* %.in76 to i16**
  %136 = load i16*, i16** %135, align 8
  store i16 %120, i16* %136, align 2
  br label %1606

; <label>:137:                                    ; preds = %3
  %138 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %139 = load i16, i16* %138, align 2
  %140 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %141 = load i32, i32* %140, align 8
  %142 = icmp ult i32 %141, 41
  br i1 %142, label %143, label %149

; <label>:143:                                    ; preds = %137
  %144 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %145 = load i8*, i8** %144, align 8
  %146 = sext i32 %141 to i64
  %147 = getelementptr i8, i8* %145, i64 %146
  %148 = add i32 %141, 8
  store i32 %148, i32* %140, align 8
  br label %153

; <label>:149:                                    ; preds = %137
  %150 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %151 = load i8*, i8** %150, align 8
  %152 = getelementptr i8, i8* %151, i64 8
  store i8* %152, i8** %150, align 8
  br label %153

; <label>:153:                                    ; preds = %149, %143
  %.in75 = phi i8* [ %147, %143 ], [ %151, %149 ]
  %154 = bitcast i8* %.in75 to i16**
  %155 = load i16*, i16** %154, align 8
  store i16 %139, i16* %155, align 2
  br label %1606

; <label>:156:                                    ; preds = %3
  %157 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 33
  %158 = bitcast i8** %157 to i64*
  %159 = load i64, i64* %158, align 8
  %160 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %161 = load i32, i32* %160, align 8
  %162 = icmp ult i32 %161, 41
  br i1 %162, label %163, label %169

; <label>:163:                                    ; preds = %156
  %164 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %165 = load i8*, i8** %164, align 8
  %166 = sext i32 %161 to i64
  %167 = getelementptr i8, i8* %165, i64 %166
  %168 = add i32 %161, 8
  store i32 %168, i32* %160, align 8
  br label %173

; <label>:169:                                    ; preds = %156
  %170 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %171 = load i8*, i8** %170, align 8
  %172 = getelementptr i8, i8* %171, i64 8
  store i8* %172, i8** %170, align 8
  br label %173

; <label>:173:                                    ; preds = %169, %163
  %.in74 = phi i8* [ %167, %163 ], [ %171, %169 ]
  %174 = bitcast i8* %.in74 to i64**
  %175 = load i64*, i64** %174, align 8
  store i64 %159, i64* %175, align 8
  br label %1606

; <label>:176:                                    ; preds = %3
  %177 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 34
  %178 = bitcast i8** %177 to i64*
  %179 = load i64, i64* %178, align 8
  %180 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %181 = load i32, i32* %180, align 8
  %182 = icmp ult i32 %181, 41
  br i1 %182, label %183, label %189

; <label>:183:                                    ; preds = %176
  %184 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %185 = load i8*, i8** %184, align 8
  %186 = sext i32 %181 to i64
  %187 = getelementptr i8, i8* %185, i64 %186
  %188 = add i32 %181, 8
  store i32 %188, i32* %180, align 8
  br label %193

; <label>:189:                                    ; preds = %176
  %190 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %191 = load i8*, i8** %190, align 8
  %192 = getelementptr i8, i8* %191, i64 8
  store i8* %192, i8** %190, align 8
  br label %193

; <label>:193:                                    ; preds = %189, %183
  %.in73 = phi i8* [ %187, %183 ], [ %191, %189 ]
  %194 = bitcast i8* %.in73 to i64**
  %195 = load i64*, i64** %194, align 8
  store i64 %179, i64* %195, align 8
  br label %1606

; <label>:196:                                    ; preds = %3
  %197 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 35
  %198 = bitcast i8** %197 to i64*
  %199 = load i64, i64* %198, align 8
  %200 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %201 = load i32, i32* %200, align 8
  %202 = icmp ult i32 %201, 41
  br i1 %202, label %203, label %209

; <label>:203:                                    ; preds = %196
  %204 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %205 = load i8*, i8** %204, align 8
  %206 = sext i32 %201 to i64
  %207 = getelementptr i8, i8* %205, i64 %206
  %208 = add i32 %201, 8
  store i32 %208, i32* %200, align 8
  br label %213

; <label>:209:                                    ; preds = %196
  %210 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %211 = load i8*, i8** %210, align 8
  %212 = getelementptr i8, i8* %211, i64 8
  store i8* %212, i8** %210, align 8
  br label %213

; <label>:213:                                    ; preds = %209, %203
  %.in72 = phi i8* [ %207, %203 ], [ %211, %209 ]
  %214 = bitcast i8* %.in72 to i64**
  %215 = load i64*, i64** %214, align 8
  store i64 %199, i64* %215, align 8
  br label %1606

; <label>:216:                                    ; preds = %3
  %217 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 36
  %218 = bitcast i8** %217 to i64*
  %219 = load i64, i64* %218, align 8
  %220 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %221 = load i32, i32* %220, align 8
  %222 = icmp ult i32 %221, 41
  br i1 %222, label %223, label %229

; <label>:223:                                    ; preds = %216
  %224 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %225 = load i8*, i8** %224, align 8
  %226 = sext i32 %221 to i64
  %227 = getelementptr i8, i8* %225, i64 %226
  %228 = add i32 %221, 8
  store i32 %228, i32* %220, align 8
  br label %233

; <label>:229:                                    ; preds = %216
  %230 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %231 = load i8*, i8** %230, align 8
  %232 = getelementptr i8, i8* %231, i64 8
  store i8* %232, i8** %230, align 8
  br label %233

; <label>:233:                                    ; preds = %229, %223
  %.in71 = phi i8* [ %227, %223 ], [ %231, %229 ]
  %234 = bitcast i8* %.in71 to i64**
  %235 = load i64*, i64** %234, align 8
  store i64 %219, i64* %235, align 8
  br label %1606

; <label>:236:                                    ; preds = %3
  %237 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 37
  %238 = bitcast i8** %237 to i64*
  %239 = load i64, i64* %238, align 8
  %240 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %241 = load i32, i32* %240, align 8
  %242 = icmp ult i32 %241, 41
  br i1 %242, label %243, label %249

; <label>:243:                                    ; preds = %236
  %244 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %245 = load i8*, i8** %244, align 8
  %246 = sext i32 %241 to i64
  %247 = getelementptr i8, i8* %245, i64 %246
  %248 = add i32 %241, 8
  store i32 %248, i32* %240, align 8
  br label %253

; <label>:249:                                    ; preds = %236
  %250 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %251 = load i8*, i8** %250, align 8
  %252 = getelementptr i8, i8* %251, i64 8
  store i8* %252, i8** %250, align 8
  br label %253

; <label>:253:                                    ; preds = %249, %243
  %.in70 = phi i8* [ %247, %243 ], [ %251, %249 ]
  %254 = bitcast i8* %.in70 to i64**
  %255 = load i64*, i64** %254, align 8
  store i64 %239, i64* %255, align 8
  br label %1606

; <label>:256:                                    ; preds = %3
  %257 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 38
  %258 = bitcast i8** %257 to i64*
  %259 = load i64, i64* %258, align 8
  %260 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %261 = load i32, i32* %260, align 8
  %262 = icmp ult i32 %261, 41
  br i1 %262, label %263, label %269

; <label>:263:                                    ; preds = %256
  %264 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %265 = load i8*, i8** %264, align 8
  %266 = sext i32 %261 to i64
  %267 = getelementptr i8, i8* %265, i64 %266
  %268 = add i32 %261, 8
  store i32 %268, i32* %260, align 8
  br label %273

; <label>:269:                                    ; preds = %256
  %270 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %271 = load i8*, i8** %270, align 8
  %272 = getelementptr i8, i8* %271, i64 8
  store i8* %272, i8** %270, align 8
  br label %273

; <label>:273:                                    ; preds = %269, %263
  %.in69 = phi i8* [ %267, %263 ], [ %271, %269 ]
  %274 = bitcast i8* %.in69 to i64**
  %275 = load i64*, i64** %274, align 8
  store i64 %259, i64* %275, align 8
  br label %1606

; <label>:276:                                    ; preds = %3
  %277 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 39
  %278 = bitcast i8** %277 to i64*
  %279 = load i64, i64* %278, align 8
  %280 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %281 = load i32, i32* %280, align 8
  %282 = icmp ult i32 %281, 41
  br i1 %282, label %283, label %289

; <label>:283:                                    ; preds = %276
  %284 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %285 = load i8*, i8** %284, align 8
  %286 = sext i32 %281 to i64
  %287 = getelementptr i8, i8* %285, i64 %286
  %288 = add i32 %281, 8
  store i32 %288, i32* %280, align 8
  br label %293

; <label>:289:                                    ; preds = %276
  %290 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %291 = load i8*, i8** %290, align 8
  %292 = getelementptr i8, i8* %291, i64 8
  store i8* %292, i8** %290, align 8
  br label %293

; <label>:293:                                    ; preds = %289, %283
  %.in68 = phi i8* [ %287, %283 ], [ %291, %289 ]
  %294 = bitcast i8* %.in68 to i64**
  %295 = load i64*, i64** %294, align 8
  store i64 %279, i64* %295, align 8
  br label %1606

; <label>:296:                                    ; preds = %3
  %297 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 40
  %298 = bitcast i8** %297 to i64*
  %299 = load i64, i64* %298, align 8
  %300 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %301 = load i32, i32* %300, align 8
  %302 = icmp ult i32 %301, 41
  br i1 %302, label %303, label %309

; <label>:303:                                    ; preds = %296
  %304 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %305 = load i8*, i8** %304, align 8
  %306 = sext i32 %301 to i64
  %307 = getelementptr i8, i8* %305, i64 %306
  %308 = add i32 %301, 8
  store i32 %308, i32* %300, align 8
  br label %313

; <label>:309:                                    ; preds = %296
  %310 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %311 = load i8*, i8** %310, align 8
  %312 = getelementptr i8, i8* %311, i64 8
  store i8* %312, i8** %310, align 8
  br label %313

; <label>:313:                                    ; preds = %309, %303
  %.in67 = phi i8* [ %307, %303 ], [ %311, %309 ]
  %314 = bitcast i8* %.in67 to i64**
  %315 = load i64*, i64** %314, align 8
  store i64 %299, i64* %315, align 8
  br label %1606

; <label>:316:                                    ; preds = %3
  %317 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 14
  %318 = load i16, i16* %317, align 8
  %319 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %320 = load i32, i32* %319, align 8
  %321 = icmp ult i32 %320, 41
  br i1 %321, label %322, label %328

; <label>:322:                                    ; preds = %316
  %323 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %324 = load i8*, i8** %323, align 8
  %325 = sext i32 %320 to i64
  %326 = getelementptr i8, i8* %324, i64 %325
  %327 = add i32 %320, 8
  store i32 %327, i32* %319, align 8
  br label %332

; <label>:328:                                    ; preds = %316
  %329 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %330 = load i8*, i8** %329, align 8
  %331 = getelementptr i8, i8* %330, i64 8
  store i8* %331, i8** %329, align 8
  br label %332

; <label>:332:                                    ; preds = %328, %322
  %.in66 = phi i8* [ %326, %322 ], [ %330, %328 ]
  %333 = bitcast i8* %.in66 to i16**
  %334 = load i16*, i16** %333, align 8
  store i16 %318, i16* %334, align 2
  br label %1606

; <label>:335:                                    ; preds = %3
  %336 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %337 = load i16, i16* %336, align 2
  %338 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %339 = load i32, i32* %338, align 8
  %340 = icmp ult i32 %339, 41
  br i1 %340, label %341, label %347

; <label>:341:                                    ; preds = %335
  %342 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %343 = load i8*, i8** %342, align 8
  %344 = sext i32 %339 to i64
  %345 = getelementptr i8, i8* %343, i64 %344
  %346 = add i32 %339, 8
  store i32 %346, i32* %338, align 8
  br label %351

; <label>:347:                                    ; preds = %335
  %348 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %349 = load i8*, i8** %348, align 8
  %350 = getelementptr i8, i8* %349, i64 8
  store i8* %350, i8** %348, align 8
  br label %351

; <label>:351:                                    ; preds = %347, %341
  %.in65 = phi i8* [ %345, %341 ], [ %349, %347 ]
  %352 = bitcast i8* %.in65 to i16**
  %353 = load i16*, i16** %352, align 8
  store i16 %337, i16* %353, align 2
  br label %1606

; <label>:354:                                    ; preds = %3
  %355 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %356 = load i32, i32* %355, align 4
  %357 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %358 = load i32, i32* %357, align 8
  %359 = icmp ult i32 %358, 41
  br i1 %359, label %360, label %366

; <label>:360:                                    ; preds = %354
  %361 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %362 = load i8*, i8** %361, align 8
  %363 = sext i32 %358 to i64
  %364 = getelementptr i8, i8* %362, i64 %363
  %365 = add i32 %358, 8
  store i32 %365, i32* %357, align 8
  br label %370

; <label>:366:                                    ; preds = %354
  %367 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %368 = load i8*, i8** %367, align 8
  %369 = getelementptr i8, i8* %368, i64 8
  store i8* %369, i8** %367, align 8
  br label %370

; <label>:370:                                    ; preds = %366, %360
  %.in64 = phi i8* [ %364, %360 ], [ %368, %366 ]
  %371 = bitcast i8* %.in64 to i32**
  %372 = load i32*, i32** %371, align 8
  store i32 %356, i32* %372, align 4
  br label %1606

; <label>:373:                                    ; preds = %3
  %374 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 17
  %375 = load i16, i16* %374, align 8
  %376 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %377 = load i32, i32* %376, align 8
  %378 = icmp ult i32 %377, 41
  br i1 %378, label %379, label %385

; <label>:379:                                    ; preds = %373
  %380 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %381 = load i8*, i8** %380, align 8
  %382 = sext i32 %377 to i64
  %383 = getelementptr i8, i8* %381, i64 %382
  %384 = add i32 %377, 8
  store i32 %384, i32* %376, align 8
  br label %389

; <label>:385:                                    ; preds = %373
  %386 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %387 = load i8*, i8** %386, align 8
  %388 = getelementptr i8, i8* %387, i64 8
  store i8* %388, i8** %386, align 8
  br label %389

; <label>:389:                                    ; preds = %385, %379
  %.in63 = phi i8* [ %383, %379 ], [ %387, %385 ]
  %390 = bitcast i8* %.in63 to i16**
  %391 = load i16*, i16** %390, align 8
  store i16 %375, i16* %391, align 2
  br label %1606

; <label>:392:                                    ; preds = %3
  %393 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 18
  %394 = load i16, i16* %393, align 2
  %395 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %396 = load i32, i32* %395, align 8
  %397 = icmp ult i32 %396, 41
  br i1 %397, label %398, label %404

; <label>:398:                                    ; preds = %392
  %399 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %400 = load i8*, i8** %399, align 8
  %401 = sext i32 %396 to i64
  %402 = getelementptr i8, i8* %400, i64 %401
  %403 = add i32 %396, 8
  store i32 %403, i32* %395, align 8
  br label %408

; <label>:404:                                    ; preds = %392
  %405 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %406 = load i8*, i8** %405, align 8
  %407 = getelementptr i8, i8* %406, i64 8
  store i8* %407, i8** %405, align 8
  br label %408

; <label>:408:                                    ; preds = %404, %398
  %.in62 = phi i8* [ %402, %398 ], [ %406, %404 ]
  %409 = bitcast i8* %.in62 to i16**
  %410 = load i16*, i16** %409, align 8
  store i16 %394, i16* %410, align 2
  br label %1606

; <label>:411:                                    ; preds = %3
  %412 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 19
  %413 = bitcast double* %412 to i64*
  %414 = load i64, i64* %413, align 8
  %415 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %416 = load i32, i32* %415, align 8
  %417 = icmp ult i32 %416, 41
  br i1 %417, label %418, label %424

; <label>:418:                                    ; preds = %411
  %419 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %420 = load i8*, i8** %419, align 8
  %421 = sext i32 %416 to i64
  %422 = getelementptr i8, i8* %420, i64 %421
  %423 = add i32 %416, 8
  store i32 %423, i32* %415, align 8
  br label %428

; <label>:424:                                    ; preds = %411
  %425 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %426 = load i8*, i8** %425, align 8
  %427 = getelementptr i8, i8* %426, i64 8
  store i8* %427, i8** %425, align 8
  br label %428

; <label>:428:                                    ; preds = %424, %418
  %.in61 = phi i8* [ %422, %418 ], [ %426, %424 ]
  %429 = bitcast i8* %.in61 to i64**
  %430 = load i64*, i64** %429, align 8
  store i64 %414, i64* %430, align 8
  br label %1606

; <label>:431:                                    ; preds = %3
  %432 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 20
  %433 = bitcast double* %432 to i64*
  %434 = load i64, i64* %433, align 8
  %435 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %436 = load i32, i32* %435, align 8
  %437 = icmp ult i32 %436, 41
  br i1 %437, label %438, label %444

; <label>:438:                                    ; preds = %431
  %439 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %440 = load i8*, i8** %439, align 8
  %441 = sext i32 %436 to i64
  %442 = getelementptr i8, i8* %440, i64 %441
  %443 = add i32 %436, 8
  store i32 %443, i32* %435, align 8
  br label %448

; <label>:444:                                    ; preds = %431
  %445 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %446 = load i8*, i8** %445, align 8
  %447 = getelementptr i8, i8* %446, i64 8
  store i8* %447, i8** %445, align 8
  br label %448

; <label>:448:                                    ; preds = %444, %438
  %.in60 = phi i8* [ %442, %438 ], [ %446, %444 ]
  %449 = bitcast i8* %.in60 to i64**
  %450 = load i64*, i64** %449, align 8
  store i64 %434, i64* %450, align 8
  br label %1606

; <label>:451:                                    ; preds = %3
  %452 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 21
  %453 = bitcast float* %452 to i32*
  %454 = load i32, i32* %453, align 8
  %455 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %456 = load i32, i32* %455, align 8
  %457 = icmp ult i32 %456, 41
  br i1 %457, label %458, label %464

; <label>:458:                                    ; preds = %451
  %459 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %460 = load i8*, i8** %459, align 8
  %461 = sext i32 %456 to i64
  %462 = getelementptr i8, i8* %460, i64 %461
  %463 = add i32 %456, 8
  store i32 %463, i32* %455, align 8
  br label %468

; <label>:464:                                    ; preds = %451
  %465 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %466 = load i8*, i8** %465, align 8
  %467 = getelementptr i8, i8* %466, i64 8
  store i8* %467, i8** %465, align 8
  br label %468

; <label>:468:                                    ; preds = %464, %458
  %.in59 = phi i8* [ %462, %458 ], [ %466, %464 ]
  %469 = bitcast i8* %.in59 to i32**
  %470 = load i32*, i32** %469, align 8
  store i32 %454, i32* %470, align 4
  br label %1606

; <label>:471:                                    ; preds = %3
  %472 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 22
  %473 = bitcast float* %472 to i32*
  %474 = load i32, i32* %473, align 4
  %475 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %476 = load i32, i32* %475, align 8
  %477 = icmp ult i32 %476, 41
  br i1 %477, label %478, label %484

; <label>:478:                                    ; preds = %471
  %479 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %480 = load i8*, i8** %479, align 8
  %481 = sext i32 %476 to i64
  %482 = getelementptr i8, i8* %480, i64 %481
  %483 = add i32 %476, 8
  store i32 %483, i32* %475, align 8
  br label %488

; <label>:484:                                    ; preds = %471
  %485 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %486 = load i8*, i8** %485, align 8
  %487 = getelementptr i8, i8* %486, i64 8
  store i8* %487, i8** %485, align 8
  br label %488

; <label>:488:                                    ; preds = %484, %478
  %.in58 = phi i8* [ %482, %478 ], [ %486, %484 ]
  %489 = bitcast i8* %.in58 to i32**
  %490 = load i32*, i32** %489, align 8
  store i32 %474, i32* %490, align 4
  br label %1606

; <label>:491:                                    ; preds = %3
  %492 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %493 = load i16, i16* %492, align 2
  %494 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %495 = load i32, i32* %494, align 8
  %496 = icmp ult i32 %495, 41
  br i1 %496, label %497, label %503

; <label>:497:                                    ; preds = %491
  %498 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %499 = load i8*, i8** %498, align 8
  %500 = sext i32 %495 to i64
  %501 = getelementptr i8, i8* %499, i64 %500
  %502 = add i32 %495, 8
  store i32 %502, i32* %494, align 8
  br label %507

; <label>:503:                                    ; preds = %491
  %504 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %505 = load i8*, i8** %504, align 8
  %506 = getelementptr i8, i8* %505, i64 8
  store i8* %506, i8** %504, align 8
  br label %507

; <label>:507:                                    ; preds = %503, %497
  %.in57 = phi i8* [ %501, %497 ], [ %505, %503 ]
  %508 = bitcast i8* %.in57 to i16**
  %509 = load i16*, i16** %508, align 8
  store i16 %493, i16* %509, align 2
  br label %1606

; <label>:510:                                    ; preds = %3
  %511 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 25
  %512 = bitcast float* %511 to i32*
  %513 = load i32, i32* %512, align 4
  %514 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %515 = load i32, i32* %514, align 8
  %516 = icmp ult i32 %515, 41
  br i1 %516, label %517, label %523

; <label>:517:                                    ; preds = %510
  %518 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %519 = load i8*, i8** %518, align 8
  %520 = sext i32 %515 to i64
  %521 = getelementptr i8, i8* %519, i64 %520
  %522 = add i32 %515, 8
  store i32 %522, i32* %514, align 8
  br label %527

; <label>:523:                                    ; preds = %510
  %524 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %525 = load i8*, i8** %524, align 8
  %526 = getelementptr i8, i8* %525, i64 8
  store i8* %526, i8** %524, align 8
  br label %527

; <label>:527:                                    ; preds = %523, %517
  %.in56 = phi i8* [ %521, %517 ], [ %525, %523 ]
  %528 = bitcast i8* %.in56 to i32**
  %529 = load i32*, i32** %528, align 8
  store i32 %513, i32* %529, align 4
  br label %1606

; <label>:530:                                    ; preds = %3
  %531 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 26
  %532 = bitcast float* %531 to i32*
  %533 = load i32, i32* %532, align 8
  %534 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %535 = load i32, i32* %534, align 8
  %536 = icmp ult i32 %535, 41
  br i1 %536, label %537, label %543

; <label>:537:                                    ; preds = %530
  %538 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %539 = load i8*, i8** %538, align 8
  %540 = sext i32 %535 to i64
  %541 = getelementptr i8, i8* %539, i64 %540
  %542 = add i32 %535, 8
  store i32 %542, i32* %534, align 8
  br label %547

; <label>:543:                                    ; preds = %530
  %544 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %545 = load i8*, i8** %544, align 8
  %546 = getelementptr i8, i8* %545, i64 8
  store i8* %546, i8** %544, align 8
  br label %547

; <label>:547:                                    ; preds = %543, %537
  %.in55 = phi i8* [ %541, %537 ], [ %545, %543 ]
  %548 = bitcast i8* %.in55 to i32**
  %549 = load i32*, i32** %548, align 8
  store i32 %533, i32* %549, align 4
  br label %1606

; <label>:550:                                    ; preds = %3
  %551 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 41
  %552 = bitcast i8** %551 to i64*
  %553 = load i64, i64* %552, align 8
  %554 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %555 = load i32, i32* %554, align 8
  %556 = icmp ult i32 %555, 41
  br i1 %556, label %557, label %563

; <label>:557:                                    ; preds = %550
  %558 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %559 = load i8*, i8** %558, align 8
  %560 = sext i32 %555 to i64
  %561 = getelementptr i8, i8* %559, i64 %560
  %562 = add i32 %555, 8
  store i32 %562, i32* %554, align 8
  br label %567

; <label>:563:                                    ; preds = %550
  %564 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %565 = load i8*, i8** %564, align 8
  %566 = getelementptr i8, i8* %565, i64 8
  store i8* %566, i8** %564, align 8
  br label %567

; <label>:567:                                    ; preds = %563, %557
  %.in54 = phi i8* [ %561, %557 ], [ %565, %563 ]
  %568 = bitcast i8* %.in54 to i64**
  %569 = load i64*, i64** %568, align 8
  store i64 %553, i64* %569, align 8
  br label %1606

; <label>:570:                                    ; preds = %3
  %571 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 23
  %572 = load i16, i16* %571, align 8
  %573 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %574 = load i32, i32* %573, align 8
  %575 = icmp ult i32 %574, 41
  br i1 %575, label %576, label %582

; <label>:576:                                    ; preds = %570
  %577 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %578 = load i8*, i8** %577, align 8
  %579 = sext i32 %574 to i64
  %580 = getelementptr i8, i8* %578, i64 %579
  %581 = add i32 %574, 8
  store i32 %581, i32* %573, align 8
  br label %586

; <label>:582:                                    ; preds = %570
  %583 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %584 = load i8*, i8** %583, align 8
  %585 = getelementptr i8, i8* %584, i64 8
  store i8* %585, i8** %583, align 8
  br label %586

; <label>:586:                                    ; preds = %582, %576
  %.in53 = phi i8* [ %580, %576 ], [ %584, %582 ]
  %587 = bitcast i8* %.in53 to i16**
  %588 = load i16*, i16** %587, align 8
  store i16 %572, i16* %588, align 2
  br label %1606

; <label>:589:                                    ; preds = %3
  %590 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 27, i64 0
  %591 = load i16, i16* %590, align 4
  %592 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %593 = load i32, i32* %592, align 8
  %594 = icmp ult i32 %593, 41
  br i1 %594, label %595, label %601

; <label>:595:                                    ; preds = %589
  %596 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %597 = load i8*, i8** %596, align 8
  %598 = sext i32 %593 to i64
  %599 = getelementptr i8, i8* %597, i64 %598
  %600 = add i32 %593, 8
  store i32 %600, i32* %592, align 8
  br label %605

; <label>:601:                                    ; preds = %589
  %602 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %603 = load i8*, i8** %602, align 8
  %604 = getelementptr i8, i8* %603, i64 8
  store i8* %604, i8** %602, align 8
  br label %605

; <label>:605:                                    ; preds = %601, %595
  %.in51 = phi i8* [ %599, %595 ], [ %603, %601 ]
  %606 = bitcast i8* %.in51 to i16**
  %607 = load i16*, i16** %606, align 8
  store i16 %591, i16* %607, align 2
  %608 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 27, i64 1
  %609 = load i16, i16* %608, align 2
  %610 = load i32, i32* %592, align 8
  %611 = icmp ult i32 %610, 41
  br i1 %611, label %612, label %618

; <label>:612:                                    ; preds = %605
  %613 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %614 = load i8*, i8** %613, align 8
  %615 = sext i32 %610 to i64
  %616 = getelementptr i8, i8* %614, i64 %615
  %617 = add i32 %610, 8
  store i32 %617, i32* %592, align 8
  br label %622

; <label>:618:                                    ; preds = %605
  %619 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %620 = load i8*, i8** %619, align 8
  %621 = getelementptr i8, i8* %620, i64 8
  store i8* %621, i8** %619, align 8
  br label %622

; <label>:622:                                    ; preds = %618, %612
  %.in52 = phi i8* [ %616, %612 ], [ %620, %618 ]
  %623 = bitcast i8* %.in52 to i16**
  %624 = load i16*, i16** %623, align 8
  store i16 %609, i16* %624, align 2
  br label %1606

; <label>:625:                                    ; preds = %3
  %626 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 29, i64 0
  %627 = load i16, i16* %626, align 8
  %628 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %629 = load i32, i32* %628, align 8
  %630 = icmp ult i32 %629, 41
  br i1 %630, label %631, label %637

; <label>:631:                                    ; preds = %625
  %632 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %633 = load i8*, i8** %632, align 8
  %634 = sext i32 %629 to i64
  %635 = getelementptr i8, i8* %633, i64 %634
  %636 = add i32 %629, 8
  store i32 %636, i32* %628, align 8
  br label %641

; <label>:637:                                    ; preds = %625
  %638 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %639 = load i8*, i8** %638, align 8
  %640 = getelementptr i8, i8* %639, i64 8
  store i8* %640, i8** %638, align 8
  br label %641

; <label>:641:                                    ; preds = %637, %631
  %.in49 = phi i8* [ %635, %631 ], [ %639, %637 ]
  %642 = bitcast i8* %.in49 to i16**
  %643 = load i16*, i16** %642, align 8
  store i16 %627, i16* %643, align 2
  %644 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 29, i64 1
  %645 = load i16, i16* %644, align 2
  %646 = load i32, i32* %628, align 8
  %647 = icmp ult i32 %646, 41
  br i1 %647, label %648, label %654

; <label>:648:                                    ; preds = %641
  %649 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %650 = load i8*, i8** %649, align 8
  %651 = sext i32 %646 to i64
  %652 = getelementptr i8, i8* %650, i64 %651
  %653 = add i32 %646, 8
  store i32 %653, i32* %628, align 8
  br label %658

; <label>:654:                                    ; preds = %641
  %655 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %656 = load i8*, i8** %655, align 8
  %657 = getelementptr i8, i8* %656, i64 8
  store i8* %657, i8** %655, align 8
  br label %658

; <label>:658:                                    ; preds = %654, %648
  %.in50 = phi i8* [ %652, %648 ], [ %656, %654 ]
  %659 = bitcast i8* %.in50 to i16**
  %660 = load i16*, i16** %659, align 8
  store i16 %645, i16* %660, align 2
  br label %1606

; <label>:661:                                    ; preds = %3
  %662 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 0
  %663 = bitcast i16** %662 to i64*
  %664 = load i64, i64* %663, align 8
  %665 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %666 = load i32, i32* %665, align 8
  %667 = icmp ult i32 %666, 41
  br i1 %667, label %668, label %674

; <label>:668:                                    ; preds = %661
  %669 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %670 = load i8*, i8** %669, align 8
  %671 = sext i32 %666 to i64
  %672 = getelementptr i8, i8* %670, i64 %671
  %673 = add i32 %666, 8
  store i32 %673, i32* %665, align 8
  br label %678

; <label>:674:                                    ; preds = %661
  %675 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %676 = load i8*, i8** %675, align 8
  %677 = getelementptr i8, i8* %676, i64 8
  store i8* %677, i8** %675, align 8
  br label %678

; <label>:678:                                    ; preds = %674, %668
  %.in46 = phi i8* [ %672, %668 ], [ %676, %674 ]
  %679 = bitcast i8* %.in46 to i64**
  %680 = load i64*, i64** %679, align 8
  store i64 %664, i64* %680, align 8
  %681 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 1
  %682 = bitcast i16** %681 to i64*
  %683 = load i64, i64* %682, align 8
  %684 = load i32, i32* %665, align 8
  %685 = icmp ult i32 %684, 41
  br i1 %685, label %686, label %692

; <label>:686:                                    ; preds = %678
  %687 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %688 = load i8*, i8** %687, align 8
  %689 = sext i32 %684 to i64
  %690 = getelementptr i8, i8* %688, i64 %689
  %691 = add i32 %684, 8
  store i32 %691, i32* %665, align 8
  br label %696

; <label>:692:                                    ; preds = %678
  %693 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %694 = load i8*, i8** %693, align 8
  %695 = getelementptr i8, i8* %694, i64 8
  store i8* %695, i8** %693, align 8
  br label %696

; <label>:696:                                    ; preds = %692, %686
  %.in47 = phi i8* [ %690, %686 ], [ %694, %692 ]
  %697 = bitcast i8* %.in47 to i64**
  %698 = load i64*, i64** %697, align 8
  store i64 %683, i64* %698, align 8
  %699 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 28, i64 2
  %700 = bitcast i16** %699 to i64*
  %701 = load i64, i64* %700, align 8
  %702 = load i32, i32* %665, align 8
  %703 = icmp ult i32 %702, 41
  br i1 %703, label %704, label %710

; <label>:704:                                    ; preds = %696
  %705 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %706 = load i8*, i8** %705, align 8
  %707 = sext i32 %702 to i64
  %708 = getelementptr i8, i8* %706, i64 %707
  %709 = add i32 %702, 8
  store i32 %709, i32* %665, align 8
  br label %714

; <label>:710:                                    ; preds = %696
  %711 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %712 = load i8*, i8** %711, align 8
  %713 = getelementptr i8, i8* %712, i64 8
  store i8* %713, i8** %711, align 8
  br label %714

; <label>:714:                                    ; preds = %710, %704
  %.in48 = phi i8* [ %708, %704 ], [ %712, %710 ]
  %715 = bitcast i8* %.in48 to i64**
  %716 = load i64*, i64** %715, align 8
  store i64 %701, i64* %716, align 8
  br label %1606

; <label>:717:                                    ; preds = %3, %3
  %718 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 44
  %719 = bitcast i32** %718 to i64*
  %720 = load i64, i64* %719, align 8
  %721 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %722 = load i32, i32* %721, align 8
  %723 = icmp ult i32 %722, 41
  br i1 %723, label %724, label %730

; <label>:724:                                    ; preds = %717
  %725 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %726 = load i8*, i8** %725, align 8
  %727 = sext i32 %722 to i64
  %728 = getelementptr i8, i8* %726, i64 %727
  %729 = add i32 %722, 8
  store i32 %729, i32* %721, align 8
  br label %734

; <label>:730:                                    ; preds = %717
  %731 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %732 = load i8*, i8** %731, align 8
  %733 = getelementptr i8, i8* %732, i64 8
  store i8* %733, i8** %731, align 8
  br label %734

; <label>:734:                                    ; preds = %730, %724
  %.in45 = phi i8* [ %728, %724 ], [ %732, %730 ]
  %735 = bitcast i8* %.in45 to i64**
  %736 = load i64*, i64** %735, align 8
  store i64 %720, i64* %736, align 8
  br label %1606

; <label>:737:                                    ; preds = %3, %3
  %738 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 45
  %739 = bitcast i32** %738 to i64*
  %740 = load i64, i64* %739, align 8
  %741 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %742 = load i32, i32* %741, align 8
  %743 = icmp ult i32 %742, 41
  br i1 %743, label %744, label %750

; <label>:744:                                    ; preds = %737
  %745 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %746 = load i8*, i8** %745, align 8
  %747 = sext i32 %742 to i64
  %748 = getelementptr i8, i8* %746, i64 %747
  %749 = add i32 %742, 8
  store i32 %749, i32* %741, align 8
  br label %754

; <label>:750:                                    ; preds = %737
  %751 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %752 = load i8*, i8** %751, align 8
  %753 = getelementptr i8, i8* %752, i64 8
  store i8* %753, i8** %751, align 8
  br label %754

; <label>:754:                                    ; preds = %750, %744
  %.in44 = phi i8* [ %748, %744 ], [ %752, %750 ]
  %755 = bitcast i8* %.in44 to i64**
  %756 = load i64*, i64** %755, align 8
  store i64 %740, i64* %756, align 8
  br label %1606

; <label>:757:                                    ; preds = %3
  %758 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %759 = load i16, i16* %758, align 4
  %760 = icmp eq i16 %759, 1
  br i1 %760, label %761, label %766

; <label>:761:                                    ; preds = %757
  %762 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 31
  %763 = load i16*, i16** %762, align 8
  %764 = load i16, i16* %763, align 2
  %765 = icmp eq i16 %764, 1
  br label %766

; <label>:766:                                    ; preds = %761, %757
  %767 = phi i1 [ false, %757 ], [ %765, %761 ]
  %768 = zext i1 %767 to i16
  %769 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %770 = load i32, i32* %769, align 8
  %771 = icmp ult i32 %770, 41
  br i1 %771, label %772, label %778

; <label>:772:                                    ; preds = %766
  %773 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %774 = load i8*, i8** %773, align 8
  %775 = sext i32 %770 to i64
  %776 = getelementptr i8, i8* %774, i64 %775
  %777 = add i32 %770, 8
  store i32 %777, i32* %769, align 8
  br label %782

; <label>:778:                                    ; preds = %766
  %779 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %780 = load i8*, i8** %779, align 8
  %781 = getelementptr i8, i8* %780, i64 8
  store i8* %781, i8** %779, align 8
  br label %782

; <label>:782:                                    ; preds = %778, %772
  %.in43 = phi i8* [ %776, %772 ], [ %780, %778 ]
  %783 = bitcast i8* %.in43 to i16**
  %784 = load i16*, i16** %783, align 8
  store i16 %768, i16* %784, align 2
  br label %1606

; <label>:785:                                    ; preds = %3
  %786 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %787 = load i16, i16* %786, align 4
  %788 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %789 = load i32, i32* %788, align 8
  %790 = icmp ult i32 %789, 41
  br i1 %790, label %791, label %797

; <label>:791:                                    ; preds = %785
  %792 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %793 = load i8*, i8** %792, align 8
  %794 = sext i32 %789 to i64
  %795 = getelementptr i8, i8* %793, i64 %794
  %796 = add i32 %789, 8
  store i32 %796, i32* %788, align 8
  br label %801

; <label>:797:                                    ; preds = %785
  %798 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %799 = load i8*, i8** %798, align 8
  %800 = getelementptr i8, i8* %799, i64 8
  store i8* %800, i8** %798, align 8
  br label %801

; <label>:801:                                    ; preds = %797, %791
  %.in41 = phi i8* [ %795, %791 ], [ %799, %797 ]
  %802 = bitcast i8* %.in41 to i16**
  %803 = load i16*, i16** %802, align 8
  store i16 %787, i16* %803, align 2
  %804 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 31
  %805 = bitcast i16** %804 to i64*
  %806 = load i64, i64* %805, align 8
  %807 = load i32, i32* %788, align 8
  %808 = icmp ult i32 %807, 41
  br i1 %808, label %809, label %815

; <label>:809:                                    ; preds = %801
  %810 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %811 = load i8*, i8** %810, align 8
  %812 = sext i32 %807 to i64
  %813 = getelementptr i8, i8* %811, i64 %812
  %814 = add i32 %807, 8
  store i32 %814, i32* %788, align 8
  br label %819

; <label>:815:                                    ; preds = %801
  %816 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %817 = load i8*, i8** %816, align 8
  %818 = getelementptr i8, i8* %817, i64 8
  store i8* %818, i8** %816, align 8
  br label %819

; <label>:819:                                    ; preds = %815, %809
  %.in42 = phi i8* [ %813, %809 ], [ %817, %815 ]
  %820 = bitcast i8* %.in42 to i64**
  %821 = load i64*, i64** %820, align 8
  store i64 %806, i64* %821, align 8
  br label %1606

; <label>:822:                                    ; preds = %3
  %823 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  %824 = load i32, i32* %823, align 4
  %825 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %826 = load i32, i32* %825, align 8
  %827 = icmp ult i32 %826, 41
  br i1 %827, label %828, label %834

; <label>:828:                                    ; preds = %822
  %829 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %830 = load i8*, i8** %829, align 8
  %831 = sext i32 %826 to i64
  %832 = getelementptr i8, i8* %830, i64 %831
  %833 = add i32 %826, 8
  store i32 %833, i32* %825, align 8
  br label %838

; <label>:834:                                    ; preds = %822
  %835 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %836 = load i8*, i8** %835, align 8
  %837 = getelementptr i8, i8* %836, i64 8
  store i8* %837, i8** %835, align 8
  br label %838

; <label>:838:                                    ; preds = %834, %828
  %.in40 = phi i8* [ %832, %828 ], [ %836, %834 ]
  %839 = bitcast i8* %.in40 to i32**
  %840 = load i32*, i32** %839, align 8
  store i32 %824, i32* %840, align 4
  br label %1606

; <label>:841:                                    ; preds = %3
  %842 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 5
  %843 = load i32, i32* %842, align 8
  %844 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %845 = load i32, i32* %844, align 8
  %846 = icmp ult i32 %845, 41
  br i1 %846, label %847, label %853

; <label>:847:                                    ; preds = %841
  %848 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %849 = load i8*, i8** %848, align 8
  %850 = sext i32 %845 to i64
  %851 = getelementptr i8, i8* %849, i64 %850
  %852 = add i32 %845, 8
  store i32 %852, i32* %844, align 8
  br label %857

; <label>:853:                                    ; preds = %841
  %854 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %855 = load i8*, i8** %854, align 8
  %856 = getelementptr i8, i8* %855, i64 8
  store i8* %856, i8** %854, align 8
  br label %857

; <label>:857:                                    ; preds = %853, %847
  %.in39 = phi i8* [ %851, %847 ], [ %855, %853 ]
  %858 = bitcast i8* %.in39 to i32**
  %859 = load i32*, i32** %858, align 8
  store i32 %843, i32* %859, align 4
  br label %1606

; <label>:860:                                    ; preds = %3
  %861 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 6
  %862 = load i32, i32* %861, align 4
  %863 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %864 = load i32, i32* %863, align 8
  %865 = icmp ult i32 %864, 41
  br i1 %865, label %866, label %872

; <label>:866:                                    ; preds = %860
  %867 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %868 = load i8*, i8** %867, align 8
  %869 = sext i32 %864 to i64
  %870 = getelementptr i8, i8* %868, i64 %869
  %871 = add i32 %864, 8
  store i32 %871, i32* %863, align 8
  br label %876

; <label>:872:                                    ; preds = %860
  %873 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %874 = load i8*, i8** %873, align 8
  %875 = getelementptr i8, i8* %874, i64 8
  store i8* %875, i8** %873, align 8
  br label %876

; <label>:876:                                    ; preds = %872, %866
  %.in38 = phi i8* [ %870, %866 ], [ %874, %872 ]
  %877 = bitcast i8* %.in38 to i32**
  %878 = load i32*, i32** %877, align 8
  store i32 %862, i32* %878, align 4
  br label %1606

; <label>:879:                                    ; preds = %3
  %880 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  %881 = load i16, i16* %880, align 2
  switch i16 %881, label %1606 [
    i16 1, label %882
    i16 2, label %896
    i16 3, label %910
    i16 4, label %924
  ]

; <label>:882:                                    ; preds = %879
  %883 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %884 = load i32, i32* %883, align 8
  %885 = icmp ult i32 %884, 41
  br i1 %885, label %886, label %892

; <label>:886:                                    ; preds = %882
  %887 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %888 = load i8*, i8** %887, align 8
  %889 = sext i32 %884 to i64
  %890 = getelementptr i8, i8* %888, i64 %889
  %891 = add i32 %884, 8
  store i32 %891, i32* %883, align 8
  br label %.sink.split

; <label>:892:                                    ; preds = %882
  %893 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %894 = load i8*, i8** %893, align 8
  %895 = getelementptr i8, i8* %894, i64 8
  store i8* %895, i8** %893, align 8
  br label %.sink.split

; <label>:896:                                    ; preds = %879
  %897 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %898 = load i32, i32* %897, align 8
  %899 = icmp ult i32 %898, 41
  br i1 %899, label %900, label %906

; <label>:900:                                    ; preds = %896
  %901 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %902 = load i8*, i8** %901, align 8
  %903 = sext i32 %898 to i64
  %904 = getelementptr i8, i8* %902, i64 %903
  %905 = add i32 %898, 8
  store i32 %905, i32* %897, align 8
  br label %.sink.split

; <label>:906:                                    ; preds = %896
  %907 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %908 = load i8*, i8** %907, align 8
  %909 = getelementptr i8, i8* %908, i64 8
  store i8* %909, i8** %907, align 8
  br label %.sink.split

; <label>:910:                                    ; preds = %879
  %911 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %912 = load i32, i32* %911, align 8
  %913 = icmp ult i32 %912, 41
  br i1 %913, label %914, label %920

; <label>:914:                                    ; preds = %910
  %915 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %916 = load i8*, i8** %915, align 8
  %917 = sext i32 %912 to i64
  %918 = getelementptr i8, i8* %916, i64 %917
  %919 = add i32 %912, 8
  store i32 %919, i32* %911, align 8
  br label %.sink.split

; <label>:920:                                    ; preds = %910
  %921 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %922 = load i8*, i8** %921, align 8
  %923 = getelementptr i8, i8* %922, i64 8
  store i8* %923, i8** %921, align 8
  br label %.sink.split

; <label>:924:                                    ; preds = %879
  %925 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %926 = load i32, i32* %925, align 8
  %927 = icmp ult i32 %926, 41
  br i1 %927, label %928, label %934

; <label>:928:                                    ; preds = %924
  %929 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %930 = load i8*, i8** %929, align 8
  %931 = sext i32 %926 to i64
  %932 = getelementptr i8, i8* %930, i64 %931
  %933 = add i32 %926, 8
  store i32 %933, i32* %925, align 8
  br label %.sink.split

; <label>:934:                                    ; preds = %924
  %935 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %936 = load i8*, i8** %935, align 8
  %937 = getelementptr i8, i8* %936, i64 8
  store i8* %937, i8** %935, align 8
  br label %.sink.split

.sink.split:                                      ; preds = %886, %892, %928, %934, %914, %920, %900, %906
  %.in34.sink = phi i8* [ %904, %900 ], [ %908, %906 ], [ %918, %914 ], [ %922, %920 ], [ %932, %928 ], [ %936, %934 ], [ %890, %886 ], [ %894, %892 ]
  %.sink = phi i16 [ 1, %900 ], [ 1, %906 ], [ 3, %914 ], [ 3, %920 ], [ 0, %928 ], [ 0, %934 ], [ 2, %886 ], [ 2, %892 ]
  %938 = bitcast i8* %.in34.sink to i16**
  %939 = load i16*, i16** %938, align 8
  store i16 %.sink, i16* %939, align 2
  br label %1606

; <label>:940:                                    ; preds = %3
  %941 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  %942 = load i16, i16* %941, align 2
  %943 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %944 = load i32, i32* %943, align 8
  %945 = icmp ult i32 %944, 41
  br i1 %945, label %946, label %952

; <label>:946:                                    ; preds = %940
  %947 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %948 = load i8*, i8** %947, align 8
  %949 = sext i32 %944 to i64
  %950 = getelementptr i8, i8* %948, i64 %949
  %951 = add i32 %944, 8
  store i32 %951, i32* %943, align 8
  br label %956

; <label>:952:                                    ; preds = %940
  %953 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %954 = load i8*, i8** %953, align 8
  %955 = getelementptr i8, i8* %954, i64 8
  store i8* %955, i8** %953, align 8
  br label %956

; <label>:956:                                    ; preds = %952, %946
  %.in33 = phi i8* [ %950, %946 ], [ %954, %952 ]
  %957 = bitcast i8* %.in33 to i16**
  %958 = load i16*, i16** %957, align 8
  store i16 %942, i16* %958, align 2
  br label %1606

; <label>:959:                                    ; preds = %3
  %960 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 3
  %961 = load i32, i32* %960, align 8
  %962 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %963 = load i32, i32* %962, align 8
  %964 = icmp ult i32 %963, 41
  br i1 %964, label %965, label %971

; <label>:965:                                    ; preds = %959
  %966 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %967 = load i8*, i8** %966, align 8
  %968 = sext i32 %963 to i64
  %969 = getelementptr i8, i8* %967, i64 %968
  %970 = add i32 %963, 8
  store i32 %970, i32* %962, align 8
  br label %975

; <label>:971:                                    ; preds = %959
  %972 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %973 = load i8*, i8** %972, align 8
  %974 = getelementptr i8, i8* %973, i64 8
  store i8* %974, i8** %972, align 8
  br label %975

; <label>:975:                                    ; preds = %971, %965
  %.in32 = phi i8* [ %969, %965 ], [ %973, %971 ]
  %976 = bitcast i8* %.in32 to i32**
  %977 = load i32*, i32** %976, align 8
  store i32 %961, i32* %977, align 4
  br label %1606

; <label>:978:                                    ; preds = %3
  %979 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 32
  %980 = bitcast double* %979 to i64*
  %981 = load i64, i64* %980, align 8
  %982 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %983 = load i32, i32* %982, align 8
  %984 = icmp ult i32 %983, 41
  br i1 %984, label %985, label %991

; <label>:985:                                    ; preds = %978
  %986 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %987 = load i8*, i8** %986, align 8
  %988 = sext i32 %983 to i64
  %989 = getelementptr i8, i8* %987, i64 %988
  %990 = add i32 %983, 8
  store i32 %990, i32* %982, align 8
  br label %995

; <label>:991:                                    ; preds = %978
  %992 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %993 = load i8*, i8** %992, align 8
  %994 = getelementptr i8, i8* %993, i64 8
  store i8* %994, i8** %992, align 8
  br label %995

; <label>:995:                                    ; preds = %991, %985
  %.in31 = phi i8* [ %989, %985 ], [ %993, %991 ]
  %996 = bitcast i8* %.in31 to i64**
  %997 = load i64*, i64** %996, align 8
  store i64 %981, i64* %997, align 8
  br label %1606

; <label>:998:                                    ; preds = %3
  %999 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 46
  %1000 = load i16, i16* %999, align 8
  %1001 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1002 = load i32, i32* %1001, align 8
  %1003 = icmp ult i32 %1002, 41
  br i1 %1003, label %1004, label %1010

; <label>:1004:                                   ; preds = %998
  %1005 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1006 = load i8*, i8** %1005, align 8
  %1007 = sext i32 %1002 to i64
  %1008 = getelementptr i8, i8* %1006, i64 %1007
  %1009 = add i32 %1002, 8
  store i32 %1009, i32* %1001, align 8
  br label %1014

; <label>:1010:                                   ; preds = %998
  %1011 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1012 = load i8*, i8** %1011, align 8
  %1013 = getelementptr i8, i8* %1012, i64 8
  store i8* %1013, i8** %1011, align 8
  br label %1014

; <label>:1014:                                   ; preds = %1010, %1004
  %.in29 = phi i8* [ %1008, %1004 ], [ %1012, %1010 ]
  %1015 = bitcast i8* %.in29 to i16**
  %1016 = load i16*, i16** %1015, align 8
  store i16 %1000, i16* %1016, align 2
  %1017 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 47
  %1018 = bitcast i32** %1017 to i64*
  %1019 = load i64, i64* %1018, align 8
  %1020 = load i32, i32* %1001, align 8
  %1021 = icmp ult i32 %1020, 41
  br i1 %1021, label %1022, label %1028

; <label>:1022:                                   ; preds = %1014
  %1023 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1024 = load i8*, i8** %1023, align 8
  %1025 = sext i32 %1020 to i64
  %1026 = getelementptr i8, i8* %1024, i64 %1025
  %1027 = add i32 %1020, 8
  store i32 %1027, i32* %1001, align 8
  br label %1032

; <label>:1028:                                   ; preds = %1014
  %1029 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1030 = load i8*, i8** %1029, align 8
  %1031 = getelementptr i8, i8* %1030, i64 8
  store i8* %1031, i8** %1029, align 8
  br label %1032

; <label>:1032:                                   ; preds = %1028, %1022
  %.in30 = phi i8* [ %1026, %1022 ], [ %1030, %1028 ]
  %1033 = bitcast i8* %.in30 to i64**
  %1034 = load i64*, i64** %1033, align 8
  store i64 %1019, i64* %1034, align 8
  br label %1606

; <label>:1035:                                   ; preds = %3
  %1036 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 48
  %1037 = bitcast float** %1036 to i64*
  %1038 = load i64, i64* %1037, align 8
  %1039 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1040 = load i32, i32* %1039, align 8
  %1041 = icmp ult i32 %1040, 41
  br i1 %1041, label %1042, label %1048

; <label>:1042:                                   ; preds = %1035
  %1043 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1044 = load i8*, i8** %1043, align 8
  %1045 = sext i32 %1040 to i64
  %1046 = getelementptr i8, i8* %1044, i64 %1045
  %1047 = add i32 %1040, 8
  store i32 %1047, i32* %1039, align 8
  br label %1052

; <label>:1048:                                   ; preds = %1035
  %1049 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1050 = load i8*, i8** %1049, align 8
  %1051 = getelementptr i8, i8* %1050, i64 8
  store i8* %1051, i8** %1049, align 8
  br label %1052

; <label>:1052:                                   ; preds = %1048, %1042
  %.in28 = phi i8* [ %1046, %1042 ], [ %1050, %1048 ]
  %1053 = bitcast i8* %.in28 to i64**
  %1054 = load i64*, i64** %1053, align 8
  store i64 %1038, i64* %1054, align 8
  br label %1606

; <label>:1055:                                   ; preds = %3
  %1056 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 50
  %1057 = load i16, i16* %1056, align 4
  %1058 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1059 = load i32, i32* %1058, align 8
  %1060 = icmp ult i32 %1059, 41
  br i1 %1060, label %1061, label %1067

; <label>:1061:                                   ; preds = %1055
  %1062 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1063 = load i8*, i8** %1062, align 8
  %1064 = sext i32 %1059 to i64
  %1065 = getelementptr i8, i8* %1063, i64 %1064
  %1066 = add i32 %1059, 8
  store i32 %1066, i32* %1058, align 8
  br label %1071

; <label>:1067:                                   ; preds = %1055
  %1068 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1069 = load i8*, i8** %1068, align 8
  %1070 = getelementptr i8, i8* %1069, i64 8
  store i8* %1070, i8** %1068, align 8
  br label %1071

; <label>:1071:                                   ; preds = %1067, %1061
  %.in27 = phi i8* [ %1065, %1061 ], [ %1069, %1067 ]
  %1072 = bitcast i8* %.in27 to i16**
  %1073 = load i16*, i16** %1072, align 8
  store i16 %1057, i16* %1073, align 2
  br label %1606

; <label>:1074:                                   ; preds = %3
  %1075 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 0
  %1076 = load i16, i16* %1075, align 8
  %1077 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1078 = load i32, i32* %1077, align 8
  %1079 = icmp ult i32 %1078, 41
  br i1 %1079, label %1080, label %1086

; <label>:1080:                                   ; preds = %1074
  %1081 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1082 = load i8*, i8** %1081, align 8
  %1083 = sext i32 %1078 to i64
  %1084 = getelementptr i8, i8* %1082, i64 %1083
  %1085 = add i32 %1078, 8
  store i32 %1085, i32* %1077, align 8
  br label %1090

; <label>:1086:                                   ; preds = %1074
  %1087 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1088 = load i8*, i8** %1087, align 8
  %1089 = getelementptr i8, i8* %1088, i64 8
  store i8* %1089, i8** %1087, align 8
  br label %1090

; <label>:1090:                                   ; preds = %1086, %1080
  %.in25 = phi i8* [ %1084, %1080 ], [ %1088, %1086 ]
  %1091 = bitcast i8* %.in25 to i16**
  %1092 = load i16*, i16** %1091, align 8
  store i16 %1076, i16* %1092, align 2
  %1093 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 1
  %1094 = load i16, i16* %1093, align 2
  %1095 = load i32, i32* %1077, align 8
  %1096 = icmp ult i32 %1095, 41
  br i1 %1096, label %1097, label %1103

; <label>:1097:                                   ; preds = %1090
  %1098 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1099 = load i8*, i8** %1098, align 8
  %1100 = sext i32 %1095 to i64
  %1101 = getelementptr i8, i8* %1099, i64 %1100
  %1102 = add i32 %1095, 8
  store i32 %1102, i32* %1077, align 8
  br label %1107

; <label>:1103:                                   ; preds = %1090
  %1104 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1105 = load i8*, i8** %1104, align 8
  %1106 = getelementptr i8, i8* %1105, i64 8
  store i8* %1106, i8** %1104, align 8
  br label %1107

; <label>:1107:                                   ; preds = %1103, %1097
  %.in26 = phi i8* [ %1101, %1097 ], [ %1105, %1103 ]
  %1108 = bitcast i8* %.in26 to i16**
  %1109 = load i16*, i16** %1108, align 8
  store i16 %1094, i16* %1109, align 2
  br label %1606

; <label>:1110:                                   ; preds = %3
  %1111 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 51
  %1112 = bitcast float** %1111 to i64*
  %1113 = load i64, i64* %1112, align 8
  %1114 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1115 = load i32, i32* %1114, align 8
  %1116 = icmp ult i32 %1115, 41
  br i1 %1116, label %1117, label %1123

; <label>:1117:                                   ; preds = %1110
  %1118 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1119 = load i8*, i8** %1118, align 8
  %1120 = sext i32 %1115 to i64
  %1121 = getelementptr i8, i8* %1119, i64 %1120
  %1122 = add i32 %1115, 8
  store i32 %1122, i32* %1114, align 8
  br label %1127

; <label>:1123:                                   ; preds = %1110
  %1124 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1125 = load i8*, i8** %1124, align 8
  %1126 = getelementptr i8, i8* %1125, i64 8
  store i8* %1126, i8** %1124, align 8
  br label %1127

; <label>:1127:                                   ; preds = %1123, %1117
  %.in24 = phi i8* [ %1121, %1117 ], [ %1125, %1123 ]
  %1128 = bitcast i8* %.in24 to i64**
  %1129 = load i64*, i64** %1128, align 8
  store i64 %1113, i64* %1129, align 8
  br label %1606

; <label>:1130:                                   ; preds = %3
  %1131 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 52
  %1132 = bitcast float** %1131 to i64*
  %1133 = load i64, i64* %1132, align 8
  %1134 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1135 = load i32, i32* %1134, align 8
  %1136 = icmp ult i32 %1135, 41
  br i1 %1136, label %1137, label %1143

; <label>:1137:                                   ; preds = %1130
  %1138 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1139 = load i8*, i8** %1138, align 8
  %1140 = sext i32 %1135 to i64
  %1141 = getelementptr i8, i8* %1139, i64 %1140
  %1142 = add i32 %1135, 8
  store i32 %1142, i32* %1134, align 8
  br label %1147

; <label>:1143:                                   ; preds = %1130
  %1144 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1145 = load i8*, i8** %1144, align 8
  %1146 = getelementptr i8, i8* %1145, i64 8
  store i8* %1146, i8** %1144, align 8
  br label %1147

; <label>:1147:                                   ; preds = %1143, %1137
  %.in23 = phi i8* [ %1141, %1137 ], [ %1145, %1143 ]
  %1148 = bitcast i8* %.in23 to i64**
  %1149 = load i64*, i64** %1148, align 8
  store i64 %1133, i64* %1149, align 8
  br label %1606

; <label>:1150:                                   ; preds = %3
  %1151 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 0
  %1152 = bitcast i16** %1151 to i64*
  %1153 = load i64, i64* %1152, align 8
  %1154 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1155 = load i32, i32* %1154, align 8
  %1156 = icmp ult i32 %1155, 41
  br i1 %1156, label %1157, label %1163

; <label>:1157:                                   ; preds = %1150
  %1158 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1159 = load i8*, i8** %1158, align 8
  %1160 = sext i32 %1155 to i64
  %1161 = getelementptr i8, i8* %1159, i64 %1160
  %1162 = add i32 %1155, 8
  store i32 %1162, i32* %1154, align 8
  br label %1167

; <label>:1163:                                   ; preds = %1150
  %1164 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1165 = load i8*, i8** %1164, align 8
  %1166 = getelementptr i8, i8* %1165, i64 8
  store i8* %1166, i8** %1164, align 8
  br label %1167

; <label>:1167:                                   ; preds = %1163, %1157
  %.in20 = phi i8* [ %1161, %1157 ], [ %1165, %1163 ]
  %1168 = bitcast i8* %.in20 to i64**
  %1169 = load i64*, i64** %1168, align 8
  store i64 %1153, i64* %1169, align 8
  %1170 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %1171 = load i16, i16* %1170, align 2
  %1172 = zext i16 %1171 to i32
  %1173 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %1174 = load i16, i16* %1173, align 4
  %1175 = zext i16 %1174 to i32
  %1176 = sub nsw i32 %1172, %1175
  %1177 = icmp sgt i32 %1176, 1
  br i1 %1177, label %1178, label %1606

; <label>:1178:                                   ; preds = %1167
  %1179 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 1
  %1180 = bitcast i16** %1179 to i64*
  %1181 = load i64, i64* %1180, align 8
  %1182 = load i32, i32* %1154, align 8
  %1183 = icmp ult i32 %1182, 41
  br i1 %1183, label %1184, label %1190

; <label>:1184:                                   ; preds = %1178
  %1185 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1186 = load i8*, i8** %1185, align 8
  %1187 = sext i32 %1182 to i64
  %1188 = getelementptr i8, i8* %1186, i64 %1187
  %1189 = add i32 %1182, 8
  store i32 %1189, i32* %1154, align 8
  br label %1194

; <label>:1190:                                   ; preds = %1178
  %1191 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1192 = load i8*, i8** %1191, align 8
  %1193 = getelementptr i8, i8* %1192, i64 8
  store i8* %1193, i8** %1191, align 8
  br label %1194

; <label>:1194:                                   ; preds = %1190, %1184
  %.in21 = phi i8* [ %1188, %1184 ], [ %1192, %1190 ]
  %1195 = bitcast i8* %.in21 to i64**
  %1196 = load i64*, i64** %1195, align 8
  store i64 %1181, i64* %1196, align 8
  %1197 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 54, i64 2
  %1198 = bitcast i16** %1197 to i64*
  %1199 = load i64, i64* %1198, align 8
  %1200 = load i32, i32* %1154, align 8
  %1201 = icmp ult i32 %1200, 41
  br i1 %1201, label %1202, label %1208

; <label>:1202:                                   ; preds = %1194
  %1203 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1204 = load i8*, i8** %1203, align 8
  %1205 = sext i32 %1200 to i64
  %1206 = getelementptr i8, i8* %1204, i64 %1205
  %1207 = add i32 %1200, 8
  store i32 %1207, i32* %1154, align 8
  br label %1212

; <label>:1208:                                   ; preds = %1194
  %1209 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1210 = load i8*, i8** %1209, align 8
  %1211 = getelementptr i8, i8* %1210, i64 8
  store i8* %1211, i8** %1209, align 8
  br label %1212

; <label>:1212:                                   ; preds = %1208, %1202
  %.in22 = phi i8* [ %1206, %1202 ], [ %1210, %1208 ]
  %1213 = bitcast i8* %.in22 to i64**
  %1214 = load i64*, i64** %1213, align 8
  store i64 %1199, i64* %1214, align 8
  br label %1606

; <label>:1215:                                   ; preds = %3
  %1216 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 53
  %1217 = bitcast float** %1216 to i64*
  %1218 = load i64, i64* %1217, align 8
  %1219 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1220 = load i32, i32* %1219, align 8
  %1221 = icmp ult i32 %1220, 41
  br i1 %1221, label %1222, label %1228

; <label>:1222:                                   ; preds = %1215
  %1223 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1224 = load i8*, i8** %1223, align 8
  %1225 = sext i32 %1220 to i64
  %1226 = getelementptr i8, i8* %1224, i64 %1225
  %1227 = add i32 %1220, 8
  store i32 %1227, i32* %1219, align 8
  br label %1232

; <label>:1228:                                   ; preds = %1215
  %1229 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1230 = load i8*, i8** %1229, align 8
  %1231 = getelementptr i8, i8* %1230, i64 8
  store i8* %1231, i8** %1229, align 8
  br label %1232

; <label>:1232:                                   ; preds = %1228, %1222
  %.in19 = phi i8* [ %1226, %1222 ], [ %1230, %1228 ]
  %1233 = bitcast i8* %.in19 to i64**
  %1234 = load i64*, i64** %1233, align 8
  store i64 %1218, i64* %1234, align 8
  br label %1606

; <label>:1235:                                   ; preds = %3
  %1236 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 55
  %1237 = load i16, i16* %1236, align 8
  %1238 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1239 = load i32, i32* %1238, align 8
  %1240 = icmp ult i32 %1239, 41
  br i1 %1240, label %1241, label %1247

; <label>:1241:                                   ; preds = %1235
  %1242 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1243 = load i8*, i8** %1242, align 8
  %1244 = sext i32 %1239 to i64
  %1245 = getelementptr i8, i8* %1243, i64 %1244
  %1246 = add i32 %1239, 8
  store i32 %1246, i32* %1238, align 8
  br label %1251

; <label>:1247:                                   ; preds = %1235
  %1248 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1249 = load i8*, i8** %1248, align 8
  %1250 = getelementptr i8, i8* %1249, i64 8
  store i8* %1250, i8** %1248, align 8
  br label %1251

; <label>:1251:                                   ; preds = %1247, %1241
  %.in18 = phi i8* [ %1245, %1241 ], [ %1249, %1247 ]
  %1252 = bitcast i8* %.in18 to i16**
  %1253 = load i16*, i16** %1252, align 8
  store i16 %1237, i16* %1253, align 2
  br label %1606

; <label>:1254:                                   ; preds = %3
  %1255 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 57, i64 0
  %1256 = load i16, i16* %1255, align 4
  %1257 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1258 = load i32, i32* %1257, align 8
  %1259 = icmp ult i32 %1258, 41
  br i1 %1259, label %1260, label %1266

; <label>:1260:                                   ; preds = %1254
  %1261 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1262 = load i8*, i8** %1261, align 8
  %1263 = sext i32 %1258 to i64
  %1264 = getelementptr i8, i8* %1262, i64 %1263
  %1265 = add i32 %1258, 8
  store i32 %1265, i32* %1257, align 8
  br label %1270

; <label>:1266:                                   ; preds = %1254
  %1267 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1268 = load i8*, i8** %1267, align 8
  %1269 = getelementptr i8, i8* %1268, i64 8
  store i8* %1269, i8** %1267, align 8
  br label %1270

; <label>:1270:                                   ; preds = %1266, %1260
  %.in16 = phi i8* [ %1264, %1260 ], [ %1268, %1266 ]
  %1271 = bitcast i8* %.in16 to i16**
  %1272 = load i16*, i16** %1271, align 8
  store i16 %1256, i16* %1272, align 2
  %1273 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 57, i64 1
  %1274 = load i16, i16* %1273, align 2
  %1275 = load i32, i32* %1257, align 8
  %1276 = icmp ult i32 %1275, 41
  br i1 %1276, label %1277, label %1283

; <label>:1277:                                   ; preds = %1270
  %1278 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1279 = load i8*, i8** %1278, align 8
  %1280 = sext i32 %1275 to i64
  %1281 = getelementptr i8, i8* %1279, i64 %1280
  %1282 = add i32 %1275, 8
  store i32 %1282, i32* %1257, align 8
  br label %1287

; <label>:1283:                                   ; preds = %1270
  %1284 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1285 = load i8*, i8** %1284, align 8
  %1286 = getelementptr i8, i8* %1285, i64 8
  store i8* %1286, i8** %1284, align 8
  br label %1287

; <label>:1287:                                   ; preds = %1283, %1277
  %.in17 = phi i8* [ %1281, %1277 ], [ %1285, %1283 ]
  %1288 = bitcast i8* %.in17 to i16**
  %1289 = load i16*, i16** %1288, align 8
  store i16 %1274, i16* %1289, align 2
  br label %1606

; <label>:1290:                                   ; preds = %3
  %1291 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 59
  %1292 = bitcast i8** %1291 to i64*
  %1293 = load i64, i64* %1292, align 8
  %1294 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1295 = load i32, i32* %1294, align 8
  %1296 = icmp ult i32 %1295, 41
  br i1 %1296, label %1297, label %1303

; <label>:1297:                                   ; preds = %1290
  %1298 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1299 = load i8*, i8** %1298, align 8
  %1300 = sext i32 %1295 to i64
  %1301 = getelementptr i8, i8* %1299, i64 %1300
  %1302 = add i32 %1295, 8
  store i32 %1302, i32* %1294, align 8
  br label %1307

; <label>:1303:                                   ; preds = %1290
  %1304 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1305 = load i8*, i8** %1304, align 8
  %1306 = getelementptr i8, i8* %1305, i64 8
  store i8* %1306, i8** %1304, align 8
  br label %1307

; <label>:1307:                                   ; preds = %1303, %1297
  %.in15 = phi i8* [ %1301, %1297 ], [ %1305, %1303 ]
  %1308 = bitcast i8* %.in15 to i64**
  %1309 = load i64*, i64** %1308, align 8
  store i64 %1293, i64* %1309, align 8
  br label %1606

; <label>:1310:                                   ; preds = %3
  %1311 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 56
  %1312 = load i16, i16* %1311, align 2
  %1313 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1314 = load i32, i32* %1313, align 8
  %1315 = icmp ult i32 %1314, 41
  br i1 %1315, label %1316, label %1322

; <label>:1316:                                   ; preds = %1310
  %1317 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1318 = load i8*, i8** %1317, align 8
  %1319 = sext i32 %1314 to i64
  %1320 = getelementptr i8, i8* %1318, i64 %1319
  %1321 = add i32 %1314, 8
  store i32 %1321, i32* %1313, align 8
  br label %1326

; <label>:1322:                                   ; preds = %1310
  %1323 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1324 = load i8*, i8** %1323, align 8
  %1325 = getelementptr i8, i8* %1324, i64 8
  store i8* %1325, i8** %1323, align 8
  br label %1326

; <label>:1326:                                   ; preds = %1322, %1316
  %.in14 = phi i8* [ %1320, %1316 ], [ %1324, %1322 ]
  %1327 = bitcast i8* %.in14 to i16**
  %1328 = load i16*, i16** %1327, align 8
  store i16 %1312, i16* %1328, align 2
  br label %1606

; <label>:1329:                                   ; preds = %3
  %1330 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 60
  %1331 = bitcast i8** %1330 to i64*
  %1332 = load i64, i64* %1331, align 8
  %1333 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1334 = load i32, i32* %1333, align 8
  %1335 = icmp ult i32 %1334, 41
  br i1 %1335, label %1336, label %1342

; <label>:1336:                                   ; preds = %1329
  %1337 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1338 = load i8*, i8** %1337, align 8
  %1339 = sext i32 %1334 to i64
  %1340 = getelementptr i8, i8* %1338, i64 %1339
  %1341 = add i32 %1334, 8
  store i32 %1341, i32* %1333, align 8
  br label %1346

; <label>:1342:                                   ; preds = %1329
  %1343 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1344 = load i8*, i8** %1343, align 8
  %1345 = getelementptr i8, i8* %1344, i64 8
  store i8* %1345, i8** %1343, align 8
  br label %1346

; <label>:1346:                                   ; preds = %1342, %1336
  %.in13 = phi i8* [ %1340, %1336 ], [ %1344, %1342 ]
  %1347 = bitcast i8* %.in13 to i64**
  %1348 = load i64*, i64** %1347, align 8
  store i64 %1332, i64* %1348, align 8
  br label %1606

; <label>:1349:                                   ; preds = %3
  %1350 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 61
  %1351 = load i32, i32* %1350, align 8
  %1352 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1353 = load i32, i32* %1352, align 8
  %1354 = icmp ult i32 %1353, 41
  br i1 %1354, label %1355, label %1361

; <label>:1355:                                   ; preds = %1349
  %1356 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1357 = load i8*, i8** %1356, align 8
  %1358 = sext i32 %1353 to i64
  %1359 = getelementptr i8, i8* %1357, i64 %1358
  %1360 = add i32 %1353, 8
  store i32 %1360, i32* %1352, align 8
  br label %1365

; <label>:1361:                                   ; preds = %1349
  %1362 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1363 = load i8*, i8** %1362, align 8
  %1364 = getelementptr i8, i8* %1363, i64 8
  store i8* %1364, i8** %1362, align 8
  br label %1365

; <label>:1365:                                   ; preds = %1361, %1355
  %.in11 = phi i8* [ %1359, %1355 ], [ %1363, %1361 ]
  %1366 = bitcast i8* %.in11 to i32**
  %1367 = load i32*, i32** %1366, align 8
  store i32 %1351, i32* %1367, align 4
  %1368 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 62
  %1369 = bitcast i8** %1368 to i64*
  %1370 = load i64, i64* %1369, align 8
  %1371 = load i32, i32* %1352, align 8
  %1372 = icmp ult i32 %1371, 41
  br i1 %1372, label %1373, label %1379

; <label>:1373:                                   ; preds = %1365
  %1374 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1375 = load i8*, i8** %1374, align 8
  %1376 = sext i32 %1371 to i64
  %1377 = getelementptr i8, i8* %1375, i64 %1376
  %1378 = add i32 %1371, 8
  store i32 %1378, i32* %1352, align 8
  br label %1383

; <label>:1379:                                   ; preds = %1365
  %1380 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1381 = load i8*, i8** %1380, align 8
  %1382 = getelementptr i8, i8* %1381, i64 8
  store i8* %1382, i8** %1380, align 8
  br label %1383

; <label>:1383:                                   ; preds = %1379, %1373
  %.in12 = phi i8* [ %1377, %1373 ], [ %1381, %1379 ]
  %1384 = bitcast i8* %.in12 to i64**
  %1385 = load i64*, i64** %1384, align 8
  store i64 %1370, i64* %1385, align 8
  br label %1606

; <label>:1386:                                   ; preds = %3
  %1387 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 63
  %1388 = load i32, i32* %1387, align 8
  %1389 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1390 = load i32, i32* %1389, align 8
  %1391 = icmp ult i32 %1390, 41
  br i1 %1391, label %1392, label %1398

; <label>:1392:                                   ; preds = %1386
  %1393 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1394 = load i8*, i8** %1393, align 8
  %1395 = sext i32 %1390 to i64
  %1396 = getelementptr i8, i8* %1394, i64 %1395
  %1397 = add i32 %1390, 8
  store i32 %1397, i32* %1389, align 8
  br label %1402

; <label>:1398:                                   ; preds = %1386
  %1399 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1400 = load i8*, i8** %1399, align 8
  %1401 = getelementptr i8, i8* %1400, i64 8
  store i8* %1401, i8** %1399, align 8
  br label %1402

; <label>:1402:                                   ; preds = %1398, %1392
  %.in9 = phi i8* [ %1396, %1392 ], [ %1400, %1398 ]
  %1403 = bitcast i8* %.in9 to i32**
  %1404 = load i32*, i32** %1403, align 8
  store i32 %1388, i32* %1404, align 4
  %1405 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 64
  %1406 = bitcast i8** %1405 to i64*
  %1407 = load i64, i64* %1406, align 8
  %1408 = load i32, i32* %1389, align 8
  %1409 = icmp ult i32 %1408, 41
  br i1 %1409, label %1410, label %1416

; <label>:1410:                                   ; preds = %1402
  %1411 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1412 = load i8*, i8** %1411, align 8
  %1413 = sext i32 %1408 to i64
  %1414 = getelementptr i8, i8* %1412, i64 %1413
  %1415 = add i32 %1408, 8
  store i32 %1415, i32* %1389, align 8
  br label %1420

; <label>:1416:                                   ; preds = %1402
  %1417 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1418 = load i8*, i8** %1417, align 8
  %1419 = getelementptr i8, i8* %1418, i64 8
  store i8* %1419, i8** %1417, align 8
  br label %1420

; <label>:1420:                                   ; preds = %1416, %1410
  %.in10 = phi i8* [ %1414, %1410 ], [ %1418, %1416 ]
  %1421 = bitcast i8* %.in10 to i64**
  %1422 = load i64*, i64** %1421, align 8
  store i64 %1407, i64* %1422, align 8
  br label %1606

; <label>:1423:                                   ; preds = %3
  %1424 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 65
  %1425 = load i32, i32* %1424, align 8
  %1426 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1427 = load i32, i32* %1426, align 8
  %1428 = icmp ult i32 %1427, 41
  br i1 %1428, label %1429, label %1435

; <label>:1429:                                   ; preds = %1423
  %1430 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1431 = load i8*, i8** %1430, align 8
  %1432 = sext i32 %1427 to i64
  %1433 = getelementptr i8, i8* %1431, i64 %1432
  %1434 = add i32 %1427, 8
  store i32 %1434, i32* %1426, align 8
  br label %1439

; <label>:1435:                                   ; preds = %1423
  %1436 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1437 = load i8*, i8** %1436, align 8
  %1438 = getelementptr i8, i8* %1437, i64 8
  store i8* %1438, i8** %1436, align 8
  br label %1439

; <label>:1439:                                   ; preds = %1435, %1429
  %.in7 = phi i8* [ %1433, %1429 ], [ %1437, %1435 ]
  %1440 = bitcast i8* %.in7 to i32**
  %1441 = load i32*, i32** %1440, align 8
  store i32 %1425, i32* %1441, align 4
  %1442 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 66
  %1443 = bitcast i8** %1442 to i64*
  %1444 = load i64, i64* %1443, align 8
  %1445 = load i32, i32* %1426, align 8
  %1446 = icmp ult i32 %1445, 41
  br i1 %1446, label %1447, label %1453

; <label>:1447:                                   ; preds = %1439
  %1448 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1449 = load i8*, i8** %1448, align 8
  %1450 = sext i32 %1445 to i64
  %1451 = getelementptr i8, i8* %1449, i64 %1450
  %1452 = add i32 %1445, 8
  store i32 %1452, i32* %1426, align 8
  br label %1457

; <label>:1453:                                   ; preds = %1439
  %1454 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1455 = load i8*, i8** %1454, align 8
  %1456 = getelementptr i8, i8* %1455, i64 8
  store i8* %1456, i8** %1454, align 8
  br label %1457

; <label>:1457:                                   ; preds = %1453, %1447
  %.in8 = phi i8* [ %1451, %1447 ], [ %1455, %1453 ]
  %1458 = bitcast i8* %.in8 to i64**
  %1459 = load i64*, i64** %1458, align 8
  store i64 %1444, i64* %1459, align 8
  br label %1606

; <label>:1460:                                   ; preds = %3
  %1461 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 67
  %1462 = load i32, i32* %1461, align 8
  %1463 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1464 = load i32, i32* %1463, align 8
  %1465 = icmp ult i32 %1464, 41
  br i1 %1465, label %1466, label %1472

; <label>:1466:                                   ; preds = %1460
  %1467 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1468 = load i8*, i8** %1467, align 8
  %1469 = sext i32 %1464 to i64
  %1470 = getelementptr i8, i8* %1468, i64 %1469
  %1471 = add i32 %1464, 8
  store i32 %1471, i32* %1463, align 8
  br label %1476

; <label>:1472:                                   ; preds = %1460
  %1473 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1474 = load i8*, i8** %1473, align 8
  %1475 = getelementptr i8, i8* %1474, i64 8
  store i8* %1475, i8** %1473, align 8
  br label %1476

; <label>:1476:                                   ; preds = %1472, %1466
  %.in6 = phi i8* [ %1470, %1466 ], [ %1474, %1472 ]
  %1477 = bitcast i8* %.in6 to i32**
  %1478 = load i32*, i32** %1477, align 8
  store i32 %1462, i32* %1478, align 4
  br label %1606

; <label>:1479:                                   ; preds = %3
  %1480 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 68
  %1481 = load i32, i32* %1480, align 4
  %1482 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1483 = load i32, i32* %1482, align 8
  %1484 = icmp ult i32 %1483, 41
  br i1 %1484, label %1485, label %1491

; <label>:1485:                                   ; preds = %1479
  %1486 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1487 = load i8*, i8** %1486, align 8
  %1488 = sext i32 %1483 to i64
  %1489 = getelementptr i8, i8* %1487, i64 %1488
  %1490 = add i32 %1483, 8
  store i32 %1490, i32* %1482, align 8
  br label %1495

; <label>:1491:                                   ; preds = %1479
  %1492 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1493 = load i8*, i8** %1492, align 8
  %1494 = getelementptr i8, i8* %1493, i64 8
  store i8* %1494, i8** %1492, align 8
  br label %1495

; <label>:1495:                                   ; preds = %1491, %1485
  %.in5 = phi i8* [ %1489, %1485 ], [ %1493, %1491 ]
  %1496 = bitcast i8* %.in5 to i32**
  %1497 = load i32*, i32** %1496, align 8
  store i32 %1481, i32* %1497, align 4
  br label %1606

; <label>:1498:                                   ; preds = %3
  %1499 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 69
  %1500 = bitcast i8** %1499 to i64*
  %1501 = load i64, i64* %1500, align 8
  %1502 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1503 = load i32, i32* %1502, align 8
  %1504 = icmp ult i32 %1503, 41
  br i1 %1504, label %1505, label %1511

; <label>:1505:                                   ; preds = %1498
  %1506 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1507 = load i8*, i8** %1506, align 8
  %1508 = sext i32 %1503 to i64
  %1509 = getelementptr i8, i8* %1507, i64 %1508
  %1510 = add i32 %1503, 8
  store i32 %1510, i32* %1502, align 8
  br label %1515

; <label>:1511:                                   ; preds = %1498
  %1512 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1513 = load i8*, i8** %1512, align 8
  %1514 = getelementptr i8, i8* %1513, i64 8
  store i8* %1514, i8** %1512, align 8
  br label %1515

; <label>:1515:                                   ; preds = %1511, %1505
  %.in4 = phi i8* [ %1509, %1505 ], [ %1513, %1511 ]
  %1516 = bitcast i8* %.in4 to i64**
  %1517 = load i64*, i64** %1516, align 8
  store i64 %1501, i64* %1517, align 8
  br label %1606

; <label>:1518:                                   ; preds = %3
  %1519 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 70
  %1520 = bitcast i8** %1519 to i64*
  %1521 = load i64, i64* %1520, align 8
  %1522 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1523 = load i32, i32* %1522, align 8
  %1524 = icmp ult i32 %1523, 41
  br i1 %1524, label %1525, label %1531

; <label>:1525:                                   ; preds = %1518
  %1526 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1527 = load i8*, i8** %1526, align 8
  %1528 = sext i32 %1523 to i64
  %1529 = getelementptr i8, i8* %1527, i64 %1528
  %1530 = add i32 %1523, 8
  store i32 %1530, i32* %1522, align 8
  br label %1535

; <label>:1531:                                   ; preds = %1518
  %1532 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1533 = load i8*, i8** %1532, align 8
  %1534 = getelementptr i8, i8* %1533, i64 8
  store i8* %1534, i8** %1532, align 8
  br label %1535

; <label>:1535:                                   ; preds = %1531, %1525
  %.in3 = phi i8* [ %1529, %1525 ], [ %1533, %1531 ]
  %1536 = bitcast i8* %.in3 to i64**
  %1537 = load i64*, i64** %1536, align 8
  store i64 %1521, i64* %1537, align 8
  br label %1606

; <label>:1538:                                   ; preds = %3
  %1539 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 71
  %1540 = bitcast float* %1539 to i32*
  %1541 = load i32, i32* %1540, align 8
  %1542 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1543 = load i32, i32* %1542, align 8
  %1544 = icmp ult i32 %1543, 41
  br i1 %1544, label %1545, label %1551

; <label>:1545:                                   ; preds = %1538
  %1546 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1547 = load i8*, i8** %1546, align 8
  %1548 = sext i32 %1543 to i64
  %1549 = getelementptr i8, i8* %1547, i64 %1548
  %1550 = add i32 %1543, 8
  store i32 %1550, i32* %1542, align 8
  br label %1555

; <label>:1551:                                   ; preds = %1538
  %1552 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1553 = load i8*, i8** %1552, align 8
  %1554 = getelementptr i8, i8* %1553, i64 8
  store i8* %1554, i8** %1552, align 8
  br label %1555

; <label>:1555:                                   ; preds = %1551, %1545
  %.in2 = phi i8* [ %1549, %1545 ], [ %1553, %1551 ]
  %1556 = bitcast i8* %.in2 to i32**
  %1557 = load i32*, i32** %1556, align 8
  store i32 %1541, i32* %1557, align 4
  br label %1606

; <label>:1558:                                   ; preds = %3
  %1559 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 72
  %1560 = bitcast float** %1559 to i64*
  %1561 = load i64, i64* %1560, align 8
  %1562 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1563 = load i32, i32* %1562, align 8
  %1564 = icmp ult i32 %1563, 41
  br i1 %1564, label %1565, label %1571

; <label>:1565:                                   ; preds = %1558
  %1566 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1567 = load i8*, i8** %1566, align 8
  %1568 = sext i32 %1563 to i64
  %1569 = getelementptr i8, i8* %1567, i64 %1568
  %1570 = add i32 %1563, 8
  store i32 %1570, i32* %1562, align 8
  br label %1575

; <label>:1571:                                   ; preds = %1558
  %1572 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1573 = load i8*, i8** %1572, align 8
  %1574 = getelementptr i8, i8* %1573, i64 8
  store i8* %1574, i8** %1572, align 8
  br label %1575

; <label>:1575:                                   ; preds = %1571, %1565
  %.in1 = phi i8* [ %1569, %1565 ], [ %1573, %1571 ]
  %1576 = bitcast i8* %.in1 to i64**
  %1577 = load i64*, i64** %1576, align 8
  store i64 %1561, i64* %1577, align 8
  br label %1606

; <label>:1578:                                   ; preds = %3
  %1579 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 73
  %1580 = bitcast float** %1579 to i64*
  %1581 = load i64, i64* %1580, align 8
  %1582 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %1583 = load i32, i32* %1582, align 8
  %1584 = icmp ult i32 %1583, 41
  br i1 %1584, label %1585, label %1591

; <label>:1585:                                   ; preds = %1578
  %1586 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %1587 = load i8*, i8** %1586, align 8
  %1588 = sext i32 %1583 to i64
  %1589 = getelementptr i8, i8* %1587, i64 %1588
  %1590 = add i32 %1583, 8
  store i32 %1590, i32* %1582, align 8
  br label %1595

; <label>:1591:                                   ; preds = %1578
  %1592 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %1593 = load i8*, i8** %1592, align 8
  %1594 = getelementptr i8, i8* %1593, i64 8
  store i8* %1594, i8** %1592, align 8
  br label %1595

; <label>:1595:                                   ; preds = %1591, %1585
  %.in = phi i8* [ %1589, %1585 ], [ %1593, %1591 ]
  %1596 = bitcast i8* %.in to i64**
  %1597 = load i64*, i64** %1596, align 8
  store i64 %1581, i64* %1597, align 8
  br label %1606

; <label>:1598:                                   ; preds = %3
  %1599 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %1600 = load i8*, i8** %1599, align 8
  %1601 = icmp ugt i32 %1, 65535
  %1602 = select i1 %1601, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i64 0, i64 0)
  %1603 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* %0, i32 %1) #3
  %1604 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1603, i64 0, i32 7
  %1605 = load i8*, i8** %1604, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.13, i64 0, i64 0), i8* %1600, i8* %1602, i8* %1605) #3
  br label %1606

; <label>:1606:                                   ; preds = %1167, %1212, %879, %.sink.split, %1598, %1595, %1575, %1555, %1535, %1515, %1495, %1476, %1457, %1420, %1383, %1346, %1326, %1307, %1287, %1251, %1232, %1147, %1127, %1107, %1071, %1052, %1032, %995, %975, %956, %876, %857, %838, %819, %782, %754, %734, %714, %658, %622, %586, %567, %547, %527, %507, %488, %468, %448, %428, %408, %389, %370, %351, %332, %313, %293, %273, %253, %233, %213, %193, %173, %153, %134, %115, %96, %77, %58, %39, %20
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define zeroext i16 @TIFFNumberOfDirectories(%struct.tiff* readonly) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 2
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %2, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %.critedge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %8
  %.01 = phi i16 [ %9, %8 ], [ 0, %.lr.ph.preheader ]
  %6 = call fastcc i32 @TIFFAdvanceDirectory(%struct.tiff* %0, i32* nonnull %2, i32* null)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %.critedge.loopexit, label %8

; <label>:8:                                      ; preds = %.lr.ph
  %9 = add i16 %.01, 1
  %.pr = load i32, i32* %2, align 4
  %10 = icmp eq i32 %.pr, 0
  br i1 %10, label %.critedge.loopexit, label %.lr.ph

.critedge.loopexit:                               ; preds = %.lr.ph, %8
  %.0.lcssa.ph = phi i16 [ %.01, %.lr.ph ], [ %9, %8 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %1
  %.0.lcssa = phi i16 [ 0, %1 ], [ %.0.lcssa.ph, %.critedge.loopexit ]
  ret i16 %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @TIFFAdvanceDirectory(%struct.tiff* readonly, i32*, i32*) unnamed_addr #0 {
  %4 = alloca i16, align 2
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 2048
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %52, label %9

; <label>:9:                                      ; preds = %3
  %10 = load i32, i32* %1, align 4
  %11 = add i32 %10, 2
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 45
  %13 = load i32, i32* %12, align 8
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %9
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %17 = load i8*, i8** %16, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFAdvanceDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i64 0, i64 0), i8* %17) #3
  br label %99

; <label>:18:                                     ; preds = %9
  %19 = bitcast i16* %4 to i8*
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 44
  %21 = load i8*, i8** %20, align 8
  %22 = sext i32 %10 to i64
  %23 = getelementptr inbounds i8, i8* %21, i64 %22
  call void @_TIFFmemcpy(i8* nonnull %19, i8* %23, i32 2) #3
  %24 = load i32, i32* %5, align 8
  %25 = trunc i32 %24 to i8
  %26 = icmp slt i8 %25, 0
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %18
  call void @TIFFSwabShort(i16* nonnull %4) #3
  br label %28

; <label>:28:                                     ; preds = %27, %18
  %29 = load i16, i16* %4, align 2
  %30 = zext i16 %29 to i32
  %31 = mul nuw nsw i32 %30, 12
  %32 = or i32 %31, 2
  %33 = add i32 %32, %10
  %34 = icmp eq i32* %2, null
  br i1 %34, label %36, label %35

; <label>:35:                                     ; preds = %28
  store i32 %33, i32* %2, align 4
  br label %36

; <label>:36:                                     ; preds = %28, %35
  %37 = add i32 %33, 4
  %38 = load i32, i32* %12, align 8
  %39 = icmp sgt i32 %37, %38
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %36
  %41 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %42 = load i8*, i8** %41, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFAdvanceDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.21, i64 0, i64 0), i8* %42) #3
  br label %99

; <label>:43:                                     ; preds = %36
  %44 = bitcast i32* %1 to i8*
  %45 = load i8*, i8** %20, align 8
  %46 = sext i32 %33 to i64
  %47 = getelementptr inbounds i8, i8* %45, i64 %46
  call void @_TIFFmemcpy(i8* %44, i8* %47, i32 4) #3
  %48 = load i32, i32* %5, align 8
  %49 = trunc i32 %48 to i8
  %50 = icmp slt i8 %49, 0
  br i1 %50, label %51, label %99

; <label>:51:                                     ; preds = %43
  call void @TIFFSwabLong(i32* %1) #3
  br label %99

; <label>:52:                                     ; preds = %3
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %54 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %53, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %56 = load i8*, i8** %55, align 8
  %57 = load i32, i32* %1, align 4
  %58 = tail call i32 %54(i8* %56, i32 %57, i32 0) #3
  %59 = load i32, i32* %1, align 4
  %60 = icmp eq i32 %58, %59
  br i1 %60, label %61, label %68

; <label>:61:                                     ; preds = %52
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 49
  %63 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %62, align 8
  %64 = load i8*, i8** %55, align 8
  %65 = bitcast i16* %4 to i8*
  %66 = call i32 %63(i8* %64, i8* nonnull %65, i32 2) #3
  %67 = icmp eq i32 %66, 2
  br i1 %67, label %71, label %68

; <label>:68:                                     ; preds = %61, %52
  %69 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %70 = load i8*, i8** %69, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFAdvanceDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i64 0, i64 0), i8* %70) #3
  br label %99

; <label>:71:                                     ; preds = %61
  %72 = load i32, i32* %5, align 8
  %73 = trunc i32 %72 to i8
  %74 = icmp slt i8 %73, 0
  br i1 %74, label %75, label %76

; <label>:75:                                     ; preds = %71
  call void @TIFFSwabShort(i16* nonnull %4) #3
  br label %76

; <label>:76:                                     ; preds = %75, %71
  %77 = icmp eq i32* %2, null
  %78 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %53, align 8
  %79 = load i8*, i8** %55, align 8
  %80 = load i16, i16* %4, align 2
  %81 = zext i16 %80 to i32
  %82 = mul nuw nsw i32 %81, 12
  %83 = call i32 %78(i8* %79, i32 %82, i32 1) #3
  br i1 %77, label %85, label %84

; <label>:84:                                     ; preds = %76
  store i32 %83, i32* %2, align 4
  br label %85

; <label>:85:                                     ; preds = %76, %84
  %86 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %62, align 8
  %87 = load i8*, i8** %55, align 8
  %88 = bitcast i32* %1 to i8*
  %89 = call i32 %86(i8* %87, i8* %88, i32 4) #3
  %90 = icmp eq i32 %89, 4
  br i1 %90, label %94, label %91

; <label>:91:                                     ; preds = %85
  %92 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %93 = load i8*, i8** %92, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @TIFFAdvanceDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.21, i64 0, i64 0), i8* %93) #3
  br label %99

; <label>:94:                                     ; preds = %85
  %95 = load i32, i32* %5, align 8
  %96 = trunc i32 %95 to i8
  %97 = icmp slt i8 %96, 0
  br i1 %97, label %98, label %99

; <label>:98:                                     ; preds = %94
  call void @TIFFSwabLong(i32* %1) #3
  br label %99

; <label>:99:                                     ; preds = %94, %98, %43, %51, %91, %68, %40, %15
  %.0 = phi i32 [ 0, %15 ], [ 0, %40 ], [ 0, %91 ], [ 0, %68 ], [ 1, %51 ], [ 1, %43 ], [ 1, %98 ], [ 1, %94 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFSetDirectory(%struct.tiff*, i16 zeroext) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 2
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %3, align 4
  %6 = icmp ne i32 %5, 0
  %not.4 = icmp ne i16 %1, 0
  %7 = and i1 %not.4, %6
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %10
  %.015 = phi i16 [ %11, %10 ], [ %1, %.lr.ph.preheader ]
  %8 = call fastcc i32 @TIFFAdvanceDirectory(%struct.tiff* %0, i32* nonnull %3, i32* null)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %.loopexit.loopexit, label %10

; <label>:10:                                     ; preds = %.lr.ph
  %11 = add i16 %.015, -1
  %12 = load i32, i32* %3, align 4
  %13 = icmp ne i32 %12, 0
  %not. = icmp ne i16 %11, 0
  %14 = and i1 %not., %13
  br i1 %14, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %.01.lcssa = phi i16 [ %1, %2 ], [ %11, %._crit_edge.loopexit ]
  %.lcssa = phi i32 [ %5, %2 ], [ %12, %._crit_edge.loopexit ]
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 5
  store i32 %.lcssa, i32* %15, align 8
  %16 = add i16 %1, -1
  %17 = sub i16 %16, %.01.lcssa
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 12
  store i16 %17, i16* %18, align 4
  %19 = call i32 @TIFFReadDirectory(%struct.tiff* %0) #3
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ %19, %._crit_edge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

declare i32 @TIFFReadDirectory(%struct.tiff*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFSetSubDirectory(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 5
  store i32 %1, i32* %3, align 8
  %4 = tail call i32 @TIFFReadDirectory(%struct.tiff* %0) #3
  ret i32 %4
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFCurrentDirOffset(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 4
  ret i32 %3
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFLastDirectory(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 5
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFUnlinkDirectory(%struct.tiff*, i16 zeroext) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %2
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @TIFFUnlinkDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i64 0, i64 0)) #3
  br label %.loopexit

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 7, i32 2
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %3, align 4
  store i32 4, i32* %4, align 4
  br label %12

; <label>:12:                                     ; preds = %19, %9
  %.01.in = phi i16 [ %1, %9 ], [ %.01, %19 ]
  %.01 = add i16 %.01.in, -1
  %13 = icmp eq i16 %.01, 0
  br i1 %13, label %22, label %14

; <label>:14:                                     ; preds = %12
  %15 = load i32, i32* %3, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = zext i16 %1 to i32
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @TIFFUnlinkDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i32 %18) #3
  br label %.loopexit

; <label>:19:                                     ; preds = %14
  %20 = call fastcc i32 @TIFFAdvanceDirectory(%struct.tiff* %0, i32* nonnull %3, i32* nonnull %4)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %.loopexit.loopexit, label %12

; <label>:22:                                     ; preds = %12
  %23 = call fastcc i32 @TIFFAdvanceDirectory(%struct.tiff* %0, i32* nonnull %3, i32* null)
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %.loopexit, label %25

; <label>:25:                                     ; preds = %22
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 51
  %27 = load i32 (i8*, i32, i32)*, i32 (i8*, i32, i32)** %26, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %29 = load i8*, i8** %28, align 8
  %30 = load i32, i32* %4, align 4
  %31 = call i32 %27(i8* %29, i32 %30, i32 0) #3
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %33 = load i32, i32* %32, align 8
  %34 = trunc i32 %33 to i8
  %35 = icmp slt i8 %34, 0
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %25
  call void @TIFFSwabLong(i32* nonnull %3) #3
  br label %37

; <label>:37:                                     ; preds = %36, %25
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 50
  %39 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %38, align 8
  %40 = load i8*, i8** %28, align 8
  %41 = bitcast i32* %3 to i8*
  %42 = call i32 %39(i8* %40, i8* nonnull %41, i32 4) #3
  %43 = icmp eq i32 %42, 4
  br i1 %43, label %45, label %44

; <label>:44:                                     ; preds = %37
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @TIFFUnlinkDirectory.module, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i64 0, i64 0)) #3
  br label %.loopexit

; <label>:45:                                     ; preds = %37
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  %47 = load void (%struct.tiff*)*, void (%struct.tiff*)** %46, align 8
  call void %47(%struct.tiff* nonnull %0) #3
  %48 = load i32, i32* %32, align 8
  %49 = and i32 %48, 512
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %57, label %51

; <label>:51:                                     ; preds = %45
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %53 = load i8*, i8** %52, align 8
  %54 = icmp eq i8* %53, null
  br i1 %54, label %57, label %55

; <label>:55:                                     ; preds = %51
  call void @_TIFFfree(i8* nonnull %53) #3
  store i8* null, i8** %52, align 8
  %56 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  store i32 0, i32* %56, align 8
  br label %57

; <label>:57:                                     ; preds = %51, %45, %55
  %58 = load i32, i32* %32, align 8
  %59 = and i32 %58, -4177
  store i32 %59, i32* %32, align 8
  call void @TIFFFreeDirectory(%struct.tiff* nonnull %0)
  %60 = call i32 @TIFFDefaultDirectory(%struct.tiff* nonnull %0)
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 4
  store i32 0, i32* %61, align 4
  %62 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 5
  store i32 0, i32* %62, align 8
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 14
  store i32 0, i32* %63, align 4
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  store i32 -1, i32* %64, align 8
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  store i32 -1, i32* %65, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %19
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %22, %57, %44, %17, %8
  %.0 = phi i32 [ 0, %8 ], [ 0, %17 ], [ 1, %57 ], [ 0, %44 ], [ 0, %22 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

declare void @TIFFSwabLong(i32*) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @TIFFReassignTagToIgnore(i32, i32) local_unnamed_addr #4 {
  switch i32 %0, label %.loopexit [
    i32 0, label %7
    i32 1, label %.preheader3
    i32 2, label %29
  ]

.preheader3:                                      ; preds = %2
  %3 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %.lr.ph8, label %.loopexit

.lr.ph8:                                          ; preds = %.preheader3
  %5 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %6 = sext i32 %5 to i64
  br label %25

; <label>:7:                                      ; preds = %2
  %8 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %9 = icmp slt i32 %8, 94
  br i1 %9, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %7
  %10 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %12 = load i32, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %13 = sext i32 %12 to i64
  br label %16

; <label>:14:                                     ; preds = %16
  %15 = icmp slt i64 %indvars.iv.next, %13
  br i1 %15, label %16, label %._crit_edge.loopexit

; <label>:16:                                     ; preds = %.lr.ph, %14
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %14 ]
  %17 = getelementptr inbounds [95 x i32], [95 x i32]* @TIFFReassignTagToIgnore.TIFFignoretags, i64 0, i64 %indvars.iv
  %18 = load i32, i32* %17, align 4
  %19 = icmp eq i32 %18, %1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %19, label %.loopexit.loopexit, label %14

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.lcssa = phi i32 [ %10, %.preheader ], [ %12, %._crit_edge.loopexit ]
  %20 = add nsw i32 %.lcssa, 1
  store i32 %20, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  %21 = sext i32 %.lcssa to i64
  %22 = getelementptr inbounds [95 x i32], [95 x i32]* @TIFFReassignTagToIgnore.TIFFignoretags, i64 0, i64 %21
  store i32 %1, i32* %22, align 4
  br label %.loopexit

; <label>:23:                                     ; preds = %25
  %24 = icmp slt i64 %indvars.iv.next14, %6
  br i1 %24, label %25, label %.loopexit.loopexit17

; <label>:25:                                     ; preds = %.lr.ph8, %23
  %indvars.iv13 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next14, %23 ]
  %26 = getelementptr inbounds [95 x i32], [95 x i32]* @TIFFReassignTagToIgnore.TIFFignoretags, i64 0, i64 %indvars.iv13
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, %1
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  br i1 %28, label %.loopexit.loopexit17, label %23

; <label>:29:                                     ; preds = %2
  store i32 0, i32* @TIFFReassignTagToIgnore.tagcount, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %16
  br label %.loopexit

.loopexit.loopexit17:                             ; preds = %23, %25
  %.0.ph = phi i32 [ 1, %25 ], [ 0, %23 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit17, %.loopexit.loopexit, %.preheader3, %7, %2, %29, %._crit_edge
  %.0 = phi i32 [ 1, %29 ], [ 1, %._crit_edge ], [ 0, %2 ], [ 0, %7 ], [ 0, %.preheader3 ], [ 1, %.loopexit.loopexit ], [ %.0.ph, %.loopexit.loopexit17 ]
  ret i32 %.0
}

declare void @_TIFFSwab16BitData(%struct.tiff*, i8*, i32) #1

declare void @_TIFFSwab32BitData(%struct.tiff*, i8*, i32) #1

declare void @_TIFFSwab64BitData(%struct.tiff*, i8*, i32) #1

declare i32 @TIFFSetCompressionScheme(%struct.tiff*, i32) local_unnamed_addr #1

declare void @TIFFWarning(i8*, i8*, ...) local_unnamed_addr #1

declare %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @setExtraSamples(%struct.TIFFDirectory* nocapture, %struct.__va_list_tag* nocapture, i32* nocapture) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1, i64 0, i32 0
  %5 = load i32, i32* %4, align 8
  %6 = icmp ult i32 %5, 41
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1, i64 0, i32 3
  %9 = load i8*, i8** %8, align 8
  %10 = sext i32 %5 to i64
  %11 = getelementptr i8, i8* %9, i64 %10
  %12 = add i32 %5, 8
  store i32 %12, i32* %4, align 8
  br label %17

; <label>:13:                                     ; preds = %3
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1, i64 0, i32 2
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr i8, i8* %15, i64 8
  store i8* %16, i8** %14, align 8
  br label %17

; <label>:17:                                     ; preds = %13, %7
  %.in = phi i8* [ %11, %7 ], [ %15, %13 ]
  %18 = bitcast i8* %.in to i32*
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %2, align 4
  %20 = and i32 %19, 65535
  %21 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 15
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = icmp ugt i32 %20, %23
  br i1 %24, label %.loopexit, label %25

; <label>:25:                                     ; preds = %17
  %26 = load i32, i32* %4, align 8
  %27 = icmp ult i32 %26, 41
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %25
  %29 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1, i64 0, i32 3
  %30 = load i8*, i8** %29, align 8
  %31 = sext i32 %26 to i64
  %32 = getelementptr i8, i8* %30, i64 %31
  %33 = add i32 %26, 8
  store i32 %33, i32* %4, align 8
  br label %38

; <label>:34:                                     ; preds = %25
  %35 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %1, i64 0, i32 2
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr i8, i8* %36, i64 8
  store i8* %37, i8** %35, align 8
  br label %38

; <label>:38:                                     ; preds = %34, %28
  %.in2 = phi i8* [ %32, %28 ], [ %36, %34 ]
  %39 = bitcast i8* %.in2 to i16**
  %40 = load i16*, i16** %39, align 8
  %41 = load i32, i32* %2, align 4
  %42 = icmp sgt i32 %41, 0
  %43 = icmp eq i16* %40, null
  %or.cond = and i1 %43, %42
  br i1 %or.cond, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %38
  %44 = load i32, i32* %2, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:46:                                     ; preds = %.lr.ph
  %47 = load i32, i32* %2, align 4
  %48 = sext i32 %47 to i64
  %49 = icmp slt i64 %indvars.iv.next, %48
  br i1 %49, label %.lr.ph, label %._crit_edge.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %46
  %indvars.iv = phi i64 [ %indvars.iv.next, %46 ], [ 0, %.lr.ph.preheader ]
  %50 = getelementptr inbounds i16, i16* %40, i64 %indvars.iv
  %51 = load i16, i16* %50, align 2
  %52 = icmp ugt i16 %51, 2
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %52, label %.loopexit.loopexit, label %46

._crit_edge.loopexit:                             ; preds = %46
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.lcssa = phi i32 [ %44, %.preheader ], [ %47, %._crit_edge.loopexit ]
  %53 = trunc i32 %.lcssa to i16
  %54 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 30
  store i16 %53, i16* %54, align 4
  %55 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %0, i64 0, i32 31
  %.mask = and i32 %.lcssa, 65535
  %56 = zext i32 %.mask to i64
  tail call void @_TIFFsetShortArray(i16** %55, i16* %40, i64 %56)
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %38, %17, %._crit_edge
  %.0 = phi i32 [ 1, %._crit_edge ], [ 0, %17 ], [ 0, %38 ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @checkInkNamesString(%struct.tiff* nocapture readonly, i32, i8*) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %5 = load i16, i16* %4, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %8, label %.loopexit

; <label>:8:                                      ; preds = %3
  %9 = sext i32 %1 to i64
  %10 = getelementptr inbounds i8, i8* %2, i64 %9
  %11 = icmp eq i16 %5, 0
  br i1 %11, label %._crit_edge11, label %.preheader.preheader

.preheader.preheader:                             ; preds = %8
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.0110 = phi i8* [ %19, %._crit_edge ], [ %2, %.preheader.preheader ]
  %.028 = phi i32 [ %20, %._crit_edge ], [ %6, %.preheader.preheader ]
  %12 = load i8, i8* %.0110, align 1
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %15
  %.17 = phi i8* [ %16, %15 ], [ %.0110, %.lr.ph.preheader ]
  %14 = icmp ult i8* %.17, %10
  br i1 %14, label %15, label %.loopexit.loopexit

; <label>:15:                                     ; preds = %.lr.ph
  %16 = getelementptr inbounds i8, i8* %.17, i64 1
  %17 = load i8, i8* %16, align 1
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %15
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.1.lcssa = phi i8* [ %.0110, %.preheader ], [ %16, %._crit_edge.loopexit ]
  %19 = getelementptr inbounds i8, i8* %.1.lcssa, i64 1
  %20 = add nsw i32 %.028, -1
  %21 = icmp sgt i32 %.028, 1
  br i1 %21, label %.preheader, label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %8
  %.01.lcssa = phi i8* [ %2, %8 ], [ %19, %._crit_edge11.loopexit ]
  %22 = ptrtoint i8* %.01.lcssa to i64
  %23 = ptrtoint i8* %2 to i64
  %24 = sub i64 %22, %23
  %25 = trunc i64 %24 to i32
  br label %31

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  %.13 = phi i32 [ %6, %3 ], [ %.028, %.loopexit.loopexit ]
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = load i16, i16* %4, align 2
  %29 = zext i16 %28 to i32
  %30 = sub nsw i32 %29, %.13
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.18, i64 0, i64 0), i8* %27, i32 %29, i32 %30) #3
  br label %31

; <label>:31:                                     ; preds = %.loopexit, %._crit_edge11
  %.0 = phi i32 [ 0, %.loopexit ], [ %25, %._crit_edge11 ]
  ret i32 %.0
}

declare void @TIFFSwabShort(i16*) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
