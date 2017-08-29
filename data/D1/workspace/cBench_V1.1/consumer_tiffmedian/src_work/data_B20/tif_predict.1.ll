; ModuleID = 'tif_predict.ll'
source_filename = "tif_predict.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.TIFFPredictorState = type { i32, i32, i32, void (%struct.tiff*, i8*, i32)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*)* }

@predictFieldInfo = internal constant [1 x %struct.TIFFFieldInfo] [%struct.TIFFFieldInfo { i32 317, i16 1, i16 1, i32 3, i16 62, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0) }], align 16
@.str = private unnamed_addr constant [10 x i8] c"Predictor\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"  Predictor: \00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"none \00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"horizontal differencing \00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"%u (0x%x)\0A\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"\22Predictor\22 value %d not supported\00", align 1
@.str.6 = private unnamed_addr constant [70 x i8] c"Horizontal differencing \22Predictor\22 not supported with %d-bit samples\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"sp != NULL\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"tif_predict.c\00", align 1
@__PRETTY_FUNCTION__.PredictorDecodeRow = private unnamed_addr constant [61 x i8] c"int PredictorDecodeRow(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"sp->coderow != NULL\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"sp->pfunc != NULL\00", align 1
@__PRETTY_FUNCTION__.PredictorDecodeTile = private unnamed_addr constant [62 x i8] c"int PredictorDecodeTile(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"sp->codetile != NULL\00", align 1
@.str.12 = private unnamed_addr constant [12 x i8] c"rowsize > 0\00", align 1
@__PRETTY_FUNCTION__.PredictorEncodeRow = private unnamed_addr constant [61 x i8] c"int PredictorEncodeRow(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@__PRETTY_FUNCTION__.PredictorEncodeTile = private unnamed_addr constant [62 x i8] c"int PredictorEncodeTile(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFPredictorInit(%struct.tiff*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.TIFFPredictorState**
  %4 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %3, align 8
  tail call void @_TIFFMergeFieldInfo(%struct.tiff* %0, %struct.TIFFFieldInfo* getelementptr inbounds ([1 x %struct.TIFFFieldInfo], [1 x %struct.TIFFFieldInfo]* @predictFieldInfo, i64 0, i64 0), i32 1) #5
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 58
  %6 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 7
  %9 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %8 to i64*
  store i64 %7, i64* %9, align 8
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @PredictorVGetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %5, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 57
  %11 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 8
  %14 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %13 to i64*
  store i64 %12, i64* %14, align 8
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @PredictorVSetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %10, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 59
  %16 = bitcast void (%struct.tiff*, %struct._IO_FILE*, i64)** %15 to i64*
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 9
  %19 = bitcast void (%struct.tiff*, %struct._IO_FILE*, i64)** %18 to i64*
  store i64 %17, i64* %19, align 8
  store void (%struct.tiff*, %struct._IO_FILE*, i64)* @PredictorPrintDir, void (%struct.tiff*, %struct._IO_FILE*, i64)** %15, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  %21 = bitcast {}** %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 10
  %24 = bitcast i32 (%struct.tiff*)** %23 to i64*
  store i64 %22, i64* %24, align 8
  %25 = bitcast {}** %20 to i32 (%struct.tiff*)**
  store i32 (%struct.tiff*)* @PredictorSetupDecode, i32 (%struct.tiff*)** %25, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  %27 = bitcast {}** %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 11
  %30 = bitcast i32 (%struct.tiff*)** %29 to i64*
  store i64 %28, i64* %30, align 8
  %31 = bitcast {}** %26 to i32 (%struct.tiff*)**
  store i32 (%struct.tiff*)* @PredictorSetupEncode, i32 (%struct.tiff*)** %31, align 8
  %32 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 0
  store i32 1, i32* %32, align 8
  %33 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 3
  store void (%struct.tiff*, i8*, i32)* null, void (%struct.tiff*, i8*, i32)** %33, align 8
  ret i32 1
}

declare void @_TIFFMergeFieldInfo(%struct.tiff*, %struct.TIFFFieldInfo*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @PredictorVGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.TIFFPredictorState**
  %6 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %5, align 8
  %cond = icmp eq i32 %1, 317
  br i1 %cond, label %7, label %27

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = trunc i32 %9 to i16
  %11 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %12 = load i32, i32* %11, align 8
  %13 = icmp ult i32 %12, 41
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %7
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %16 = load i8*, i8** %15, align 8
  %17 = sext i32 %12 to i64
  %18 = getelementptr i8, i8* %16, i64 %17
  %19 = add i32 %12, 8
  store i32 %19, i32* %11, align 8
  br label %24

; <label>:20:                                     ; preds = %7
  %21 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %22 = load i8*, i8** %21, align 8
  %23 = getelementptr i8, i8* %22, i64 8
  store i8* %23, i8** %21, align 8
  br label %24

; <label>:24:                                     ; preds = %20, %14
  %.in = phi i8* [ %18, %14 ], [ %22, %20 ]
  %25 = bitcast i8* %.in to i16**
  %26 = load i16*, i16** %25, align 8
  store i16 %10, i16* %26, align 2
  br label %31

; <label>:27:                                     ; preds = %3
  %28 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 7
  %29 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %28, align 8
  %30 = tail call i32 %29(%struct.tiff* nonnull %0, i32 %1, %struct.__va_list_tag* %2) #5
  br label %31

; <label>:31:                                     ; preds = %24, %27
  %.0 = phi i32 [ %30, %27 ], [ 1, %24 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PredictorVSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.TIFFPredictorState**
  %6 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %5, align 8
  %cond = icmp eq i32 %1, 317
  br i1 %cond, label %7, label %32

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = icmp ult i32 %9, 41
  br i1 %10, label %11, label %17

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %13 = load i8*, i8** %12, align 8
  %14 = sext i32 %9 to i64
  %15 = getelementptr i8, i8* %13, i64 %14
  %16 = add i32 %9, 8
  store i32 %16, i32* %8, align 8
  br label %21

; <label>:17:                                     ; preds = %7
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr i8, i8* %19, i64 8
  store i8* %20, i8** %18, align 8
  br label %21

; <label>:21:                                     ; preds = %17, %11
  %.in = phi i8* [ %15, %11 ], [ %19, %17 ]
  %22 = bitcast i8* %.in to i32*
  %23 = load i32, i32* %22, align 4
  %24 = and i32 %23, 65535
  %25 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 0
  store i32 %24, i32* %25, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 1
  %27 = load i64, i64* %26, align 8
  %28 = or i64 %27, 1073741824
  store i64 %28, i64* %26, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %30 = load i32, i32* %29, align 8
  %31 = or i32 %30, 8
  store i32 %31, i32* %29, align 8
  br label %36

; <label>:32:                                     ; preds = %3
  %33 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 8
  %34 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %33, align 8
  %35 = tail call i32 %34(%struct.tiff* nonnull %0, i32 %1, %struct.__va_list_tag* %2) #5
  br label %36

; <label>:36:                                     ; preds = %21, %32
  %.0 = phi i32 [ %35, %32 ], [ 1, %21 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @PredictorPrintDir(%struct.tiff*, %struct._IO_FILE*, i64) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.TIFFPredictorState**
  %6 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %5, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 1
  %8 = load i64, i64* %7, align 8
  %9 = and i64 %8, 1073741824
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %22, label %11

; <label>:11:                                     ; preds = %3
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i64 13, i64 1, %struct._IO_FILE* %1)
  %13 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 0
  %14 = load i32, i32* %13, align 8
  switch i32 %14, label %19 [
    i32 1, label %15
    i32 2, label %17
  ]

; <label>:15:                                     ; preds = %11
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i64 5, i64 1, %struct._IO_FILE* %1)
  br label %19

; <label>:17:                                     ; preds = %11
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %1)
  br label %19

; <label>:19:                                     ; preds = %17, %15, %11
  %20 = load i32, i32* %13, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i32 %20, i32 %20)
  br label %22

; <label>:22:                                     ; preds = %3, %19
  %23 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 9
  %24 = load void (%struct.tiff*, %struct._IO_FILE*, i64)*, void (%struct.tiff*, %struct._IO_FILE*, i64)** %23, align 8
  %25 = icmp eq void (%struct.tiff*, %struct._IO_FILE*, i64)* %24, null
  br i1 %25, label %27, label %26

; <label>:26:                                     ; preds = %22
  tail call void %24(%struct.tiff* %0, %struct._IO_FILE* %1, i64 %2) #5
  br label %27

; <label>:27:                                     ; preds = %22, %26
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PredictorSetupDecode(%struct.tiff*) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.TIFFPredictorState**
  %4 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %3, align 8
  %5 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 10
  %6 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %5, align 8
  %7 = tail call i32 %6(%struct.tiff* %0) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %47, label %9

; <label>:9:                                      ; preds = %1
  %10 = tail call fastcc i32 @PredictorSetup(%struct.tiff* nonnull %0)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %47, label %12

; <label>:12:                                     ; preds = %9
  %13 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 0
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 2
  br i1 %15, label %16, label %47

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %18 = load i16, i16* %17, align 4
  switch i16 %18, label %21 [
    i16 8, label %19
    i16 16, label %.sink.split
  ]

; <label>:19:                                     ; preds = %16
  br label %.sink.split

.sink.split:                                      ; preds = %16, %19
  %horAcc16.sink = phi void (%struct.tiff*, i8*, i32)* [ @horAcc8, %19 ], [ @horAcc16, %16 ]
  %20 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 3
  store void (%struct.tiff*, i8*, i32)* %horAcc16.sink, void (%struct.tiff*, i8*, i32)** %20, align 8
  br label %21

; <label>:21:                                     ; preds = %.sink.split, %16
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  %23 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 4
  %26 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %25 to i64*
  store i64 %24, i64* %26, align 8
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorDecodeRow, i32 (%struct.tiff*, i8*, i32, i16)** %22, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  %28 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 5
  %31 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %30 to i64*
  store i64 %29, i64* %31, align 8
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorDecodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %27, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  %33 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 6
  %36 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %35 to i64*
  store i64 %34, i64* %36, align 8
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorDecodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %32, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %38 = load i32, i32* %37, align 8
  %39 = trunc i32 %38 to i8
  %40 = icmp slt i8 %39, 0
  br i1 %40, label %41, label %47

; <label>:41:                                     ; preds = %21
  %42 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 3
  %43 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %42, align 8
  %44 = icmp eq void (%struct.tiff*, i8*, i32)* %43, @horAcc16
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %41
  store void (%struct.tiff*, i8*, i32)* @swabHorAcc16, void (%struct.tiff*, i8*, i32)** %42, align 8
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 54
  store void (%struct.tiff*, i8*, i32)* @_TIFFNoPostDecode, void (%struct.tiff*, i8*, i32)** %46, align 8
  br label %47

; <label>:47:                                     ; preds = %12, %41, %45, %21, %1, %9
  %.0 = phi i32 [ 0, %9 ], [ 0, %1 ], [ 1, %21 ], [ 1, %45 ], [ 1, %41 ], [ 1, %12 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PredictorSetupEncode(%struct.tiff*) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.TIFFPredictorState**
  %4 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %3, align 8
  %5 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 11
  %6 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %5, align 8
  %7 = tail call i32 %6(%struct.tiff* %0) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %37, label %9

; <label>:9:                                      ; preds = %1
  %10 = tail call fastcc i32 @PredictorSetup(%struct.tiff* nonnull %0)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %37, label %12

; <label>:12:                                     ; preds = %9
  %13 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 0
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 2
  br i1 %15, label %16, label %37

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %18 = load i16, i16* %17, align 4
  switch i16 %18, label %21 [
    i16 8, label %19
    i16 16, label %.sink.split
  ]

; <label>:19:                                     ; preds = %16
  br label %.sink.split

.sink.split:                                      ; preds = %16, %19
  %horDiff16.sink = phi void (%struct.tiff*, i8*, i32)* [ @horDiff8, %19 ], [ @horDiff16, %16 ]
  %20 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 3
  store void (%struct.tiff*, i8*, i32)* %horDiff16.sink, void (%struct.tiff*, i8*, i32)** %20, align 8
  br label %21

; <label>:21:                                     ; preds = %.sink.split, %16
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  %23 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 4
  %26 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %25 to i64*
  store i64 %24, i64* %26, align 8
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorEncodeRow, i32 (%struct.tiff*, i8*, i32, i16)** %22, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  %28 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 5
  %31 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %30 to i64*
  store i64 %29, i64* %31, align 8
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorEncodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %27, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  %33 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 6
  %36 = bitcast i32 (%struct.tiff*, i8*, i32, i16)** %35 to i64*
  store i64 %34, i64* %36, align 8
  store i32 (%struct.tiff*, i8*, i32, i16)* @PredictorEncodeTile, i32 (%struct.tiff*, i8*, i32, i16)** %32, align 8
  br label %37

; <label>:37:                                     ; preds = %12, %21, %1, %9
  %.0 = phi i32 [ 0, %9 ], [ 0, %1 ], [ 1, %21 ], [ 1, %12 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @PredictorSetup(%struct.tiff*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.TIFFPredictorState**
  %4 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %3, align 8
  %5 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 0
  %6 = load i32, i32* %5, align 8
  switch i32 %6, label %7 [
    i32 1, label %38
    i32 2, label %10
  ]

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %9 = load i8*, i8** %8, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %9, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0), i32 %6) #5
  br label %38

; <label>:10:                                     ; preds = %1
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %12 = load i16, i16* %11, align 4
  switch i16 %12, label %13 [
    i16 8, label %17
    i16 16, label %17
  ]

; <label>:13:                                     ; preds = %10
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %15 = load i8*, i8** %14, align 8
  %16 = zext i16 %12 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %15, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.6, i64 0, i64 0), i32 %16) #5
  br label %38

; <label>:17:                                     ; preds = %10, %10
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %19 = load i16, i16* %18, align 2
  %20 = icmp eq i16 %19, 1
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i32
  br label %25

; <label>:25:                                     ; preds = %17, %21
  %26 = phi i32 [ %24, %21 ], [ 1, %17 ]
  %27 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 1
  store i32 %26, i32* %27, align 4
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %29 = load i32, i32* %28, align 8
  %30 = and i32 %29, 1024
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %34, label %32

; <label>:32:                                     ; preds = %25
  %33 = tail call i32 @TIFFTileRowSize(%struct.tiff* nonnull %0) #5
  br label %36

; <label>:34:                                     ; preds = %25
  %35 = tail call i32 @TIFFScanlineSize(%struct.tiff* nonnull %0) #5
  br label %36

; <label>:36:                                     ; preds = %34, %32
  %.sink = phi i32 [ %35, %34 ], [ %33, %32 ]
  %37 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %4, i64 0, i32 2
  store i32 %.sink, i32* %37, align 8
  br label %38

; <label>:38:                                     ; preds = %1, %36, %13, %7
  %.0 = phi i32 [ 0, %7 ], [ 0, %13 ], [ 1, %36 ], [ 1, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @horAcc8(%struct.tiff* nocapture readonly, i8* nocapture, i32) #3 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.TIFFPredictorState**
  %6 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %5, align 8
  %7 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = icmp slt i32 %8, %2
  br i1 %9, label %10, label %.loopexit12

; <label>:10:                                     ; preds = %3
  %11 = sub nsw i32 %2, %8
  switch i32 %8, label %.preheader [
    i32 3, label %23
    i32 4, label %50
  ]

.preheader:                                       ; preds = %10
  %12 = add nsw i32 %8, -4
  %13 = icmp sgt i32 %8, 4
  %14 = sext i32 %8 to i64
  %15 = sext i32 %8 to i64
  %16 = sext i32 %8 to i64
  %17 = sext i32 %8 to i64
  %18 = sext i32 %8 to i64
  %19 = add i32 %8, -5
  %20 = zext i32 %19 to i64
  %21 = add nuw nsw i64 %20, 1
  %xtraiter = and i32 %12, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %22 = icmp ult i32 %19, 3
  br label %.preheader.split.split

; <label>:23:                                     ; preds = %10
  %24 = load i8, i8* %1, align 1
  %25 = sext i8 %24 to i32
  %26 = getelementptr inbounds i8, i8* %1, i64 1
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = getelementptr inbounds i8, i8* %1, i64 2
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  br label %32

; <label>:32:                                     ; preds = %32, %23
  %.010 = phi i32 [ %31, %23 ], [ %46, %32 ]
  %.09 = phi i32 [ %28, %23 ], [ %41, %32 ]
  %.08 = phi i32 [ %25, %23 ], [ %36, %32 ]
  %.05 = phi i8* [ %1, %23 ], [ %33, %32 ]
  %.02 = phi i32 [ %11, %23 ], [ %48, %32 ]
  %33 = getelementptr inbounds i8, i8* %.05, i64 3
  %34 = load i8, i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = add i32 %35, %.08
  %37 = trunc i32 %36 to i8
  store i8 %37, i8* %33, align 1
  %38 = getelementptr inbounds i8, i8* %.05, i64 4
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = add i32 %40, %.09
  %42 = trunc i32 %41 to i8
  store i8 %42, i8* %38, align 1
  %43 = getelementptr inbounds i8, i8* %.05, i64 5
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = add i32 %45, %.010
  %47 = trunc i32 %46 to i8
  store i8 %47, i8* %43, align 1
  %48 = add nsw i32 %.02, -3
  %49 = icmp sgt i32 %.02, 3
  br i1 %49, label %32, label %.loopexit12.loopexit44

; <label>:50:                                     ; preds = %10
  %51 = load i8, i8* %1, align 1
  %52 = sext i8 %51 to i32
  %53 = getelementptr inbounds i8, i8* %1, i64 1
  %54 = load i8, i8* %53, align 1
  %55 = sext i8 %54 to i32
  %56 = getelementptr inbounds i8, i8* %1, i64 2
  %57 = load i8, i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = getelementptr inbounds i8, i8* %1, i64 3
  %60 = load i8, i8* %59, align 1
  %61 = sext i8 %60 to i32
  br label %62

; <label>:62:                                     ; preds = %62, %50
  %.011 = phi i32 [ %52, %50 ], [ %66, %62 ]
  %.16 = phi i8* [ %1, %50 ], [ %63, %62 ]
  %.04 = phi i32 [ %55, %50 ], [ %71, %62 ]
  %.03 = phi i32 [ %58, %50 ], [ %76, %62 ]
  %.1 = phi i32 [ %11, %50 ], [ %83, %62 ]
  %.01 = phi i32 [ %61, %50 ], [ %81, %62 ]
  %63 = getelementptr inbounds i8, i8* %.16, i64 4
  %64 = load i8, i8* %63, align 1
  %65 = sext i8 %64 to i32
  %66 = add i32 %65, %.011
  %67 = trunc i32 %66 to i8
  store i8 %67, i8* %63, align 1
  %68 = getelementptr inbounds i8, i8* %.16, i64 5
  %69 = load i8, i8* %68, align 1
  %70 = sext i8 %69 to i32
  %71 = add i32 %70, %.04
  %72 = trunc i32 %71 to i8
  store i8 %72, i8* %68, align 1
  %73 = getelementptr inbounds i8, i8* %.16, i64 6
  %74 = load i8, i8* %73, align 1
  %75 = sext i8 %74 to i32
  %76 = add i32 %75, %.03
  %77 = trunc i32 %76 to i8
  store i8 %77, i8* %73, align 1
  %78 = getelementptr inbounds i8, i8* %.16, i64 7
  %79 = load i8, i8* %78, align 1
  %80 = sext i8 %79 to i32
  %81 = add i32 %80, %.01
  %82 = trunc i32 %81 to i8
  store i8 %82, i8* %78, align 1
  %83 = add nsw i32 %.1, -4
  %84 = icmp sgt i32 %.1, 4
  br i1 %84, label %62, label %.loopexit12.loopexit45

.preheader.split.split:                           ; preds = %.preheader, %137
  %.27 = phi i8* [ %.8, %137 ], [ %1, %.preheader ]
  %.2 = phi i32 [ %138, %137 ], [ %11, %.preheader ]
  switch i32 %8, label %85 [
    i32 0, label %137
    i32 1, label %131
    i32 2, label %125
  ]

; <label>:85:                                     ; preds = %.preheader.split.split
  br i1 %13, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %85
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.016.prol = phi i32 [ %91, %.lr.ph.prol ], [ %12, %.lr.ph.prol.preheader ]
  %.315.prol = phi i8* [ %90, %.lr.ph.prol ], [ %.27, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %86 = load i8, i8* %.315.prol, align 1
  %87 = getelementptr inbounds i8, i8* %.315.prol, i64 %14
  %88 = load i8, i8* %87, align 1
  %89 = add i8 %88, %86
  store i8 %89, i8* %87, align 1
  %90 = getelementptr inbounds i8, i8* %.315.prol, i64 1
  %91 = add nsw i32 %.016.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.016.unr = phi i32 [ %12, %.lr.ph.preheader ], [ %91, %.lr.ph.prol.loopexit.loopexit ]
  %.315.unr = phi i8* [ %.27, %.lr.ph.preheader ], [ %90, %.lr.ph.prol.loopexit.loopexit ]
  br i1 %22, label %.loopexit.loopexit, label %.lr.ph.preheader43

.lr.ph.preheader43:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader43, %.lr.ph
  %.016 = phi i32 [ %113, %.lr.ph ], [ %.016.unr, %.lr.ph.preheader43 ]
  %.315 = phi i8* [ %112, %.lr.ph ], [ %.315.unr, %.lr.ph.preheader43 ]
  %92 = load i8, i8* %.315, align 1
  %93 = getelementptr inbounds i8, i8* %.315, i64 %14
  %94 = load i8, i8* %93, align 1
  %95 = add i8 %94, %92
  store i8 %95, i8* %93, align 1
  %96 = getelementptr inbounds i8, i8* %.315, i64 1
  %97 = load i8, i8* %96, align 1
  %98 = getelementptr inbounds i8, i8* %96, i64 %14
  %99 = load i8, i8* %98, align 1
  %100 = add i8 %99, %97
  store i8 %100, i8* %98, align 1
  %101 = getelementptr inbounds i8, i8* %.315, i64 2
  %102 = load i8, i8* %101, align 1
  %103 = getelementptr inbounds i8, i8* %101, i64 %14
  %104 = load i8, i8* %103, align 1
  %105 = add i8 %104, %102
  store i8 %105, i8* %103, align 1
  %106 = getelementptr inbounds i8, i8* %.315, i64 3
  %107 = add nsw i32 %.016, -3
  %108 = load i8, i8* %106, align 1
  %109 = getelementptr inbounds i8, i8* %106, i64 %14
  %110 = load i8, i8* %109, align 1
  %111 = add i8 %110, %108
  store i8 %111, i8* %109, align 1
  %112 = getelementptr inbounds i8, i8* %.315, i64 4
  %113 = add nsw i32 %.016, -4
  %114 = icmp sgt i32 %107, 1
  br i1 %114, label %.lr.ph, label %.loopexit.loopexit.loopexit

.loopexit.loopexit.loopexit:                      ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.loopexit.loopexit.loopexit, %.lr.ph.prol.loopexit
  %scevgep = getelementptr i8, i8* %.27, i64 %21
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %85
  %.3.lcssa = phi i8* [ %.27, %85 ], [ %scevgep, %.loopexit.loopexit ]
  %115 = load i8, i8* %.3.lcssa, align 1
  %116 = getelementptr inbounds i8, i8* %.3.lcssa, i64 %15
  %117 = load i8, i8* %116, align 1
  %118 = add i8 %117, %115
  store i8 %118, i8* %116, align 1
  %119 = getelementptr inbounds i8, i8* %.3.lcssa, i64 1
  %120 = load i8, i8* %119, align 1
  %121 = getelementptr inbounds i8, i8* %119, i64 %16
  %122 = load i8, i8* %121, align 1
  %123 = add i8 %122, %120
  store i8 %123, i8* %121, align 1
  %124 = getelementptr inbounds i8, i8* %.3.lcssa, i64 2
  br label %125

; <label>:125:                                    ; preds = %.loopexit, %.preheader.split.split
  %.6 = phi i8* [ %124, %.loopexit ], [ %.27, %.preheader.split.split ]
  %126 = load i8, i8* %.6, align 1
  %127 = getelementptr inbounds i8, i8* %.6, i64 %17
  %128 = load i8, i8* %127, align 1
  %129 = add i8 %128, %126
  store i8 %129, i8* %127, align 1
  %130 = getelementptr inbounds i8, i8* %.6, i64 1
  br label %131

; <label>:131:                                    ; preds = %.preheader.split.split, %125
  %.7 = phi i8* [ %130, %125 ], [ %.27, %.preheader.split.split ]
  %132 = load i8, i8* %.7, align 1
  %133 = getelementptr inbounds i8, i8* %.7, i64 %18
  %134 = load i8, i8* %133, align 1
  %135 = add i8 %134, %132
  store i8 %135, i8* %133, align 1
  %136 = getelementptr inbounds i8, i8* %.7, i64 1
  br label %137

; <label>:137:                                    ; preds = %.preheader.split.split, %131
  %.8 = phi i8* [ %136, %131 ], [ %.27, %.preheader.split.split ]
  %138 = sub nsw i32 %.2, %8
  %139 = icmp sgt i32 %138, 0
  br i1 %139, label %.preheader.split.split, label %.loopexit12.loopexit

.loopexit12.loopexit:                             ; preds = %137
  br label %.loopexit12

.loopexit12.loopexit44:                           ; preds = %32
  br label %.loopexit12

.loopexit12.loopexit45:                           ; preds = %62
  br label %.loopexit12

.loopexit12:                                      ; preds = %.loopexit12.loopexit45, %.loopexit12.loopexit44, %.loopexit12.loopexit, %3
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @horAcc16(%struct.tiff* nocapture readonly, i8* nocapture, i32) #3 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.TIFFPredictorState**
  %6 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %5, align 8
  %7 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = sdiv i32 %2, 2
  %10 = icmp sgt i32 %9, %8
  br i1 %10, label %11, label %.loopexit3

; <label>:11:                                     ; preds = %3
  %12 = bitcast i8* %1 to i16*
  %13 = sub nsw i32 %9, %8
  %14 = add nsw i32 %8, -4
  %15 = icmp sgt i32 %8, 4
  %16 = sext i32 %8 to i64
  %17 = sext i32 %8 to i64
  %18 = sext i32 %8 to i64
  %19 = sext i32 %8 to i64
  %20 = sext i32 %8 to i64
  switch i32 %8, label %.split.split.preheader [
    i32 4, label %.split.us.preheader
    i32 3, label %.split.split.us.preheader
  ]

.split.split.us.preheader:                        ; preds = %11
  br label %.split.split.us

.split.us.preheader:                              ; preds = %11
  br label %.split.us

.split.split.preheader:                           ; preds = %11
  %21 = add i32 %8, -5
  %22 = zext i32 %21 to i64
  %23 = add nuw nsw i64 %22, 1
  %xtraiter = and i32 %14, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %24 = icmp ult i32 %21, 3
  br label %.split.split

.split.us:                                        ; preds = %.split.us.preheader, %.split.us
  %.02.us = phi i16* [ %44, %.split.us ], [ %12, %.split.us.preheader ]
  %.01.us = phi i32 [ %45, %.split.us ], [ %13, %.split.us.preheader ]
  %25 = load i16, i16* %.02.us, align 2
  %26 = getelementptr inbounds i16, i16* %.02.us, i64 %17
  %27 = load i16, i16* %26, align 2
  %28 = add i16 %27, %25
  store i16 %28, i16* %26, align 2
  %29 = getelementptr inbounds i16, i16* %.02.us, i64 1
  %30 = load i16, i16* %29, align 2
  %31 = getelementptr inbounds i16, i16* %29, i64 %18
  %32 = load i16, i16* %31, align 2
  %33 = add i16 %32, %30
  store i16 %33, i16* %31, align 2
  %34 = getelementptr inbounds i16, i16* %.02.us, i64 2
  %35 = load i16, i16* %34, align 2
  %36 = getelementptr inbounds i16, i16* %34, i64 %19
  %37 = load i16, i16* %36, align 2
  %38 = add i16 %37, %35
  store i16 %38, i16* %36, align 2
  %39 = getelementptr inbounds i16, i16* %.02.us, i64 3
  %40 = load i16, i16* %39, align 2
  %41 = getelementptr inbounds i16, i16* %39, i64 %20
  %42 = load i16, i16* %41, align 2
  %43 = add i16 %42, %40
  store i16 %43, i16* %41, align 2
  %44 = getelementptr inbounds i16, i16* %.02.us, i64 4
  %45 = add nsw i32 %.01.us, -4
  %46 = icmp sgt i32 %.01.us, 4
  br i1 %46, label %.split.us, label %.loopexit3.loopexit33

.split.split.us:                                  ; preds = %.split.split.us.preheader, %.split.split.us
  %.02.us6 = phi i16* [ %61, %.split.split.us ], [ %12, %.split.split.us.preheader ]
  %.01.us7 = phi i32 [ %62, %.split.split.us ], [ %13, %.split.split.us.preheader ]
  %47 = load i16, i16* %.02.us6, align 2
  %48 = getelementptr inbounds i16, i16* %.02.us6, i64 %18
  %49 = load i16, i16* %48, align 2
  %50 = add i16 %49, %47
  store i16 %50, i16* %48, align 2
  %51 = getelementptr inbounds i16, i16* %.02.us6, i64 1
  %52 = load i16, i16* %51, align 2
  %53 = getelementptr inbounds i16, i16* %51, i64 %19
  %54 = load i16, i16* %53, align 2
  %55 = add i16 %54, %52
  store i16 %55, i16* %53, align 2
  %56 = getelementptr inbounds i16, i16* %.02.us6, i64 2
  %57 = load i16, i16* %56, align 2
  %58 = getelementptr inbounds i16, i16* %56, i64 %20
  %59 = load i16, i16* %58, align 2
  %60 = add i16 %59, %57
  store i16 %60, i16* %58, align 2
  %61 = getelementptr inbounds i16, i16* %.02.us6, i64 3
  %62 = add nsw i32 %.01.us7, -3
  %63 = icmp sgt i32 %.01.us7, 3
  br i1 %63, label %.split.split.us, label %.loopexit3.loopexit34

.split.split:                                     ; preds = %.split.split.preheader, %116
  %.02 = phi i16* [ %.6, %116 ], [ %12, %.split.split.preheader ]
  %.01 = phi i32 [ %117, %116 ], [ %13, %.split.split.preheader ]
  switch i32 %8, label %64 [
    i32 0, label %116
    i32 1, label %110
    i32 2, label %104
  ]

; <label>:64:                                     ; preds = %.split.split
  br i1 %15, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %64
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.05.prol = phi i32 [ %70, %.lr.ph.prol ], [ %14, %.lr.ph.prol.preheader ]
  %.14.prol = phi i16* [ %69, %.lr.ph.prol ], [ %.02, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %65 = load i16, i16* %.14.prol, align 2
  %66 = getelementptr inbounds i16, i16* %.14.prol, i64 %16
  %67 = load i16, i16* %66, align 2
  %68 = add i16 %67, %65
  store i16 %68, i16* %66, align 2
  %69 = getelementptr inbounds i16, i16* %.14.prol, i64 1
  %70 = add nsw i32 %.05.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.05.unr = phi i32 [ %14, %.lr.ph.preheader ], [ %70, %.lr.ph.prol.loopexit.loopexit ]
  %.14.unr = phi i16* [ %.02, %.lr.ph.preheader ], [ %69, %.lr.ph.prol.loopexit.loopexit ]
  br i1 %24, label %.loopexit.loopexit, label %.lr.ph.preheader32

.lr.ph.preheader32:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader32, %.lr.ph
  %.05 = phi i32 [ %92, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader32 ]
  %.14 = phi i16* [ %91, %.lr.ph ], [ %.14.unr, %.lr.ph.preheader32 ]
  %71 = load i16, i16* %.14, align 2
  %72 = getelementptr inbounds i16, i16* %.14, i64 %16
  %73 = load i16, i16* %72, align 2
  %74 = add i16 %73, %71
  store i16 %74, i16* %72, align 2
  %75 = getelementptr inbounds i16, i16* %.14, i64 1
  %76 = load i16, i16* %75, align 2
  %77 = getelementptr inbounds i16, i16* %75, i64 %16
  %78 = load i16, i16* %77, align 2
  %79 = add i16 %78, %76
  store i16 %79, i16* %77, align 2
  %80 = getelementptr inbounds i16, i16* %.14, i64 2
  %81 = load i16, i16* %80, align 2
  %82 = getelementptr inbounds i16, i16* %80, i64 %16
  %83 = load i16, i16* %82, align 2
  %84 = add i16 %83, %81
  store i16 %84, i16* %82, align 2
  %85 = getelementptr inbounds i16, i16* %.14, i64 3
  %86 = add nsw i32 %.05, -3
  %87 = load i16, i16* %85, align 2
  %88 = getelementptr inbounds i16, i16* %85, i64 %16
  %89 = load i16, i16* %88, align 2
  %90 = add i16 %89, %87
  store i16 %90, i16* %88, align 2
  %91 = getelementptr inbounds i16, i16* %.14, i64 4
  %92 = add nsw i32 %.05, -4
  %93 = icmp sgt i32 %86, 1
  br i1 %93, label %.lr.ph, label %.loopexit.loopexit.loopexit

.loopexit.loopexit.loopexit:                      ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.loopexit.loopexit.loopexit, %.lr.ph.prol.loopexit
  %scevgep = getelementptr i16, i16* %.02, i64 %23
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %64
  %.1.lcssa = phi i16* [ %.02, %64 ], [ %scevgep, %.loopexit.loopexit ]
  %94 = load i16, i16* %.1.lcssa, align 2
  %95 = getelementptr inbounds i16, i16* %.1.lcssa, i64 %17
  %96 = load i16, i16* %95, align 2
  %97 = add i16 %96, %94
  store i16 %97, i16* %95, align 2
  %98 = getelementptr inbounds i16, i16* %.1.lcssa, i64 1
  %99 = load i16, i16* %98, align 2
  %100 = getelementptr inbounds i16, i16* %98, i64 %18
  %101 = load i16, i16* %100, align 2
  %102 = add i16 %101, %99
  store i16 %102, i16* %100, align 2
  %103 = getelementptr inbounds i16, i16* %.1.lcssa, i64 2
  br label %104

; <label>:104:                                    ; preds = %.loopexit, %.split.split
  %.4 = phi i16* [ %103, %.loopexit ], [ %.02, %.split.split ]
  %105 = load i16, i16* %.4, align 2
  %106 = getelementptr inbounds i16, i16* %.4, i64 %19
  %107 = load i16, i16* %106, align 2
  %108 = add i16 %107, %105
  store i16 %108, i16* %106, align 2
  %109 = getelementptr inbounds i16, i16* %.4, i64 1
  br label %110

; <label>:110:                                    ; preds = %.split.split, %104
  %.5 = phi i16* [ %109, %104 ], [ %.02, %.split.split ]
  %111 = load i16, i16* %.5, align 2
  %112 = getelementptr inbounds i16, i16* %.5, i64 %20
  %113 = load i16, i16* %112, align 2
  %114 = add i16 %113, %111
  store i16 %114, i16* %112, align 2
  %115 = getelementptr inbounds i16, i16* %.5, i64 1
  br label %116

; <label>:116:                                    ; preds = %.split.split, %110
  %.6 = phi i16* [ %115, %110 ], [ %.02, %.split.split ]
  %117 = sub nsw i32 %.01, %8
  %118 = icmp sgt i32 %117, 0
  br i1 %118, label %.split.split, label %.loopexit3.loopexit

.loopexit3.loopexit:                              ; preds = %116
  br label %.loopexit3

.loopexit3.loopexit33:                            ; preds = %.split.us
  br label %.loopexit3

.loopexit3.loopexit34:                            ; preds = %.split.split.us
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit34, %.loopexit3.loopexit33, %.loopexit3.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PredictorDecodeRow(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.TIFFPredictorState**
  %7 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %6, align 8
  %8 = icmp eq %struct.TIFFPredictorState* %7, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 244, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeRow, i64 0, i64 0)) #6
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 4
  %12 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %11, align 8
  %13 = icmp eq i32 (%struct.tiff*, i8*, i32, i16)* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 245, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeRow, i64 0, i64 0)) #6
  unreachable

; <label>:15:                                     ; preds = %10
  %16 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 3
  %17 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %16, align 8
  %18 = icmp eq void (%struct.tiff*, i8*, i32)* %17, null
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %15
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 246, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeRow, i64 0, i64 0)) #6
  unreachable

; <label>:20:                                     ; preds = %15
  %21 = tail call i32 %12(%struct.tiff* nonnull %0, i8* %1, i32 %2, i16 zeroext %3) #5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %20
  %24 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %16, align 8
  tail call void %24(%struct.tiff* nonnull %0, i8* %1, i32 %2) #5
  br label %25

; <label>:25:                                     ; preds = %20, %23
  %.0 = phi i32 [ 1, %23 ], [ 0, %20 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PredictorDecodeTile(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.TIFFPredictorState**
  %7 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %6, align 8
  %8 = icmp eq %struct.TIFFPredictorState* %7, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 266, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeTile, i64 0, i64 0)) #6
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 6
  %12 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %11, align 8
  %13 = icmp eq i32 (%struct.tiff*, i8*, i32, i16)* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 267, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeTile, i64 0, i64 0)) #6
  unreachable

; <label>:15:                                     ; preds = %10
  %16 = tail call i32 %12(%struct.tiff* nonnull %0, i8* %1, i32 %2, i16 zeroext %3) #5
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %.loopexit, label %18

; <label>:18:                                     ; preds = %15
  %19 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 2
  %20 = load i32, i32* %19, align 8
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %23, label %22

; <label>:22:                                     ; preds = %18
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 270, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeTile, i64 0, i64 0)) #6
  unreachable

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 3
  %25 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %24, align 8
  %26 = icmp eq void (%struct.tiff*, i8*, i32)* %25, null
  br i1 %26, label %29, label %.preheader

.preheader:                                       ; preds = %23
  %27 = icmp sgt i32 %2, 0
  br i1 %27, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.preheader
  %28 = sext i32 %20 to i64
  br label %30

; <label>:29:                                     ; preds = %23
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 271, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorDecodeTile, i64 0, i64 0)) #6
  unreachable

; <label>:30:                                     ; preds = %.lr.ph, %30
  %.014 = phi i32 [ %2, %.lr.ph ], [ %32, %30 ]
  %.023 = phi i8* [ %1, %.lr.ph ], [ %33, %30 ]
  %31 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %24, align 8
  tail call void %31(%struct.tiff* %0, i8* %.023, i32 %20) #5
  %32 = sub nsw i32 %.014, %20
  %33 = getelementptr inbounds i8, i8* %.023, i64 %28
  %34 = icmp sgt i32 %32, 0
  br i1 %34, label %30, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %30
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %15
  %.0 = phi i32 [ 0, %15 ], [ 1, %.preheader ], [ 1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @swabHorAcc16(%struct.tiff* nocapture readonly, i8*, i32) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.TIFFPredictorState**
  %6 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %5, align 8
  %7 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = bitcast i8* %1 to i16*
  %10 = sdiv i32 %2, 2
  %11 = icmp sgt i32 %10, %8
  br i1 %11, label %12, label %.loopexit3

; <label>:12:                                     ; preds = %3
  %13 = sext i32 %10 to i64
  tail call void @TIFFSwabArrayOfShort(i16* %9, i64 %13) #5
  %14 = sub nsw i32 %10, %8
  %15 = add nsw i32 %8, -4
  %16 = icmp sgt i32 %8, 4
  %17 = sext i32 %8 to i64
  %18 = sext i32 %8 to i64
  %19 = sext i32 %8 to i64
  %20 = sext i32 %8 to i64
  %21 = sext i32 %8 to i64
  switch i32 %8, label %.split.split.preheader [
    i32 4, label %.split.us.preheader
    i32 3, label %.split.split.us.preheader
  ]

.split.split.us.preheader:                        ; preds = %12
  br label %.split.split.us

.split.us.preheader:                              ; preds = %12
  br label %.split.us

.split.split.preheader:                           ; preds = %12
  %22 = add i32 %8, -5
  %23 = zext i32 %22 to i64
  %24 = add nuw nsw i64 %23, 1
  %xtraiter = and i32 %15, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %25 = icmp ult i32 %22, 3
  br label %.split.split

.split.us:                                        ; preds = %.split.us.preheader, %.split.us
  %.02.us = phi i16* [ %45, %.split.us ], [ %9, %.split.us.preheader ]
  %.01.us = phi i32 [ %46, %.split.us ], [ %14, %.split.us.preheader ]
  %26 = load i16, i16* %.02.us, align 2
  %27 = getelementptr inbounds i16, i16* %.02.us, i64 %18
  %28 = load i16, i16* %27, align 2
  %29 = add i16 %28, %26
  store i16 %29, i16* %27, align 2
  %30 = getelementptr inbounds i16, i16* %.02.us, i64 1
  %31 = load i16, i16* %30, align 2
  %32 = getelementptr inbounds i16, i16* %30, i64 %19
  %33 = load i16, i16* %32, align 2
  %34 = add i16 %33, %31
  store i16 %34, i16* %32, align 2
  %35 = getelementptr inbounds i16, i16* %.02.us, i64 2
  %36 = load i16, i16* %35, align 2
  %37 = getelementptr inbounds i16, i16* %35, i64 %20
  %38 = load i16, i16* %37, align 2
  %39 = add i16 %38, %36
  store i16 %39, i16* %37, align 2
  %40 = getelementptr inbounds i16, i16* %.02.us, i64 3
  %41 = load i16, i16* %40, align 2
  %42 = getelementptr inbounds i16, i16* %40, i64 %21
  %43 = load i16, i16* %42, align 2
  %44 = add i16 %43, %41
  store i16 %44, i16* %42, align 2
  %45 = getelementptr inbounds i16, i16* %.02.us, i64 4
  %46 = add nsw i32 %.01.us, -4
  %47 = icmp sgt i32 %.01.us, 4
  br i1 %47, label %.split.us, label %.loopexit3.loopexit33

.split.split.us:                                  ; preds = %.split.split.us.preheader, %.split.split.us
  %.02.us6 = phi i16* [ %62, %.split.split.us ], [ %9, %.split.split.us.preheader ]
  %.01.us7 = phi i32 [ %63, %.split.split.us ], [ %14, %.split.split.us.preheader ]
  %48 = load i16, i16* %.02.us6, align 2
  %49 = getelementptr inbounds i16, i16* %.02.us6, i64 %19
  %50 = load i16, i16* %49, align 2
  %51 = add i16 %50, %48
  store i16 %51, i16* %49, align 2
  %52 = getelementptr inbounds i16, i16* %.02.us6, i64 1
  %53 = load i16, i16* %52, align 2
  %54 = getelementptr inbounds i16, i16* %52, i64 %20
  %55 = load i16, i16* %54, align 2
  %56 = add i16 %55, %53
  store i16 %56, i16* %54, align 2
  %57 = getelementptr inbounds i16, i16* %.02.us6, i64 2
  %58 = load i16, i16* %57, align 2
  %59 = getelementptr inbounds i16, i16* %57, i64 %21
  %60 = load i16, i16* %59, align 2
  %61 = add i16 %60, %58
  store i16 %61, i16* %59, align 2
  %62 = getelementptr inbounds i16, i16* %.02.us6, i64 3
  %63 = add nsw i32 %.01.us7, -3
  %64 = icmp sgt i32 %.01.us7, 3
  br i1 %64, label %.split.split.us, label %.loopexit3.loopexit34

.split.split:                                     ; preds = %.split.split.preheader, %117
  %.02 = phi i16* [ %.6, %117 ], [ %9, %.split.split.preheader ]
  %.01 = phi i32 [ %118, %117 ], [ %14, %.split.split.preheader ]
  switch i32 %8, label %65 [
    i32 0, label %117
    i32 1, label %111
    i32 2, label %105
  ]

; <label>:65:                                     ; preds = %.split.split
  br i1 %16, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %65
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.05.prol = phi i32 [ %71, %.lr.ph.prol ], [ %15, %.lr.ph.prol.preheader ]
  %.14.prol = phi i16* [ %70, %.lr.ph.prol ], [ %.02, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %66 = load i16, i16* %.14.prol, align 2
  %67 = getelementptr inbounds i16, i16* %.14.prol, i64 %17
  %68 = load i16, i16* %67, align 2
  %69 = add i16 %68, %66
  store i16 %69, i16* %67, align 2
  %70 = getelementptr inbounds i16, i16* %.14.prol, i64 1
  %71 = add nsw i32 %.05.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !4

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.05.unr = phi i32 [ %15, %.lr.ph.preheader ], [ %71, %.lr.ph.prol.loopexit.loopexit ]
  %.14.unr = phi i16* [ %.02, %.lr.ph.preheader ], [ %70, %.lr.ph.prol.loopexit.loopexit ]
  br i1 %25, label %.loopexit.loopexit, label %.lr.ph.preheader32

.lr.ph.preheader32:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader32, %.lr.ph
  %.05 = phi i32 [ %93, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader32 ]
  %.14 = phi i16* [ %92, %.lr.ph ], [ %.14.unr, %.lr.ph.preheader32 ]
  %72 = load i16, i16* %.14, align 2
  %73 = getelementptr inbounds i16, i16* %.14, i64 %17
  %74 = load i16, i16* %73, align 2
  %75 = add i16 %74, %72
  store i16 %75, i16* %73, align 2
  %76 = getelementptr inbounds i16, i16* %.14, i64 1
  %77 = load i16, i16* %76, align 2
  %78 = getelementptr inbounds i16, i16* %76, i64 %17
  %79 = load i16, i16* %78, align 2
  %80 = add i16 %79, %77
  store i16 %80, i16* %78, align 2
  %81 = getelementptr inbounds i16, i16* %.14, i64 2
  %82 = load i16, i16* %81, align 2
  %83 = getelementptr inbounds i16, i16* %81, i64 %17
  %84 = load i16, i16* %83, align 2
  %85 = add i16 %84, %82
  store i16 %85, i16* %83, align 2
  %86 = getelementptr inbounds i16, i16* %.14, i64 3
  %87 = add nsw i32 %.05, -3
  %88 = load i16, i16* %86, align 2
  %89 = getelementptr inbounds i16, i16* %86, i64 %17
  %90 = load i16, i16* %89, align 2
  %91 = add i16 %90, %88
  store i16 %91, i16* %89, align 2
  %92 = getelementptr inbounds i16, i16* %.14, i64 4
  %93 = add nsw i32 %.05, -4
  %94 = icmp sgt i32 %87, 1
  br i1 %94, label %.lr.ph, label %.loopexit.loopexit.loopexit

.loopexit.loopexit.loopexit:                      ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.loopexit.loopexit.loopexit, %.lr.ph.prol.loopexit
  %scevgep = getelementptr i16, i16* %.02, i64 %24
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %65
  %.1.lcssa = phi i16* [ %.02, %65 ], [ %scevgep, %.loopexit.loopexit ]
  %95 = load i16, i16* %.1.lcssa, align 2
  %96 = getelementptr inbounds i16, i16* %.1.lcssa, i64 %18
  %97 = load i16, i16* %96, align 2
  %98 = add i16 %97, %95
  store i16 %98, i16* %96, align 2
  %99 = getelementptr inbounds i16, i16* %.1.lcssa, i64 1
  %100 = load i16, i16* %99, align 2
  %101 = getelementptr inbounds i16, i16* %99, i64 %19
  %102 = load i16, i16* %101, align 2
  %103 = add i16 %102, %100
  store i16 %103, i16* %101, align 2
  %104 = getelementptr inbounds i16, i16* %.1.lcssa, i64 2
  br label %105

; <label>:105:                                    ; preds = %.loopexit, %.split.split
  %.4 = phi i16* [ %104, %.loopexit ], [ %.02, %.split.split ]
  %106 = load i16, i16* %.4, align 2
  %107 = getelementptr inbounds i16, i16* %.4, i64 %20
  %108 = load i16, i16* %107, align 2
  %109 = add i16 %108, %106
  store i16 %109, i16* %107, align 2
  %110 = getelementptr inbounds i16, i16* %.4, i64 1
  br label %111

; <label>:111:                                    ; preds = %.split.split, %105
  %.5 = phi i16* [ %110, %105 ], [ %.02, %.split.split ]
  %112 = load i16, i16* %.5, align 2
  %113 = getelementptr inbounds i16, i16* %.5, i64 %21
  %114 = load i16, i16* %113, align 2
  %115 = add i16 %114, %112
  store i16 %115, i16* %113, align 2
  %116 = getelementptr inbounds i16, i16* %.5, i64 1
  br label %117

; <label>:117:                                    ; preds = %.split.split, %111
  %.6 = phi i16* [ %116, %111 ], [ %.02, %.split.split ]
  %118 = sub nsw i32 %.01, %8
  %119 = icmp sgt i32 %118, 0
  br i1 %119, label %.split.split, label %.loopexit3.loopexit

.loopexit3.loopexit:                              ; preds = %117
  br label %.loopexit3

.loopexit3.loopexit33:                            ; preds = %.split.us
  br label %.loopexit3

.loopexit3.loopexit34:                            ; preds = %.split.split.us
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit34, %.loopexit3.loopexit33, %.loopexit3.loopexit, %3
  ret void
}

declare void @_TIFFNoPostDecode(%struct.tiff*, i8*, i32) #1

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

declare i32 @TIFFTileRowSize(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #4

declare void @TIFFSwabArrayOfShort(i16*, i64) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @horDiff8(%struct.tiff* nocapture readonly, i8* nocapture, i32) #3 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.TIFFPredictorState**
  %6 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %5, align 8
  %7 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = icmp slt i32 %8, %2
  br i1 %9, label %10, label %.loopexit12

; <label>:10:                                     ; preds = %3
  %11 = sub nsw i32 %2, %8
  switch i32 %8, label %..split_crit_edge [
    i32 3, label %12
    i32 4, label %30
  ]

; <label>:12:                                     ; preds = %10
  %13 = load i8, i8* %1, align 1
  %14 = getelementptr inbounds i8, i8* %1, i64 1
  %15 = load i8, i8* %14, align 1
  %16 = getelementptr inbounds i8, i8* %1, i64 2
  %17 = load i8, i8* %16, align 1
  br label %18

; <label>:18:                                     ; preds = %18, %12
  %.011 = phi i8 [ %13, %12 ], [ %20, %18 ]
  %.010 = phi i8 [ %15, %12 ], [ %23, %18 ]
  %.09 = phi i8 [ %17, %12 ], [ %26, %18 ]
  %.05 = phi i8* [ %1, %12 ], [ %19, %18 ]
  %.02 = phi i32 [ %11, %12 ], [ %28, %18 ]
  %19 = getelementptr inbounds i8, i8* %.05, i64 3
  %20 = load i8, i8* %19, align 1
  %21 = sub i8 %20, %.011
  store i8 %21, i8* %19, align 1
  %22 = getelementptr inbounds i8, i8* %.05, i64 4
  %23 = load i8, i8* %22, align 1
  %24 = sub i8 %23, %.010
  store i8 %24, i8* %22, align 1
  %25 = getelementptr inbounds i8, i8* %.05, i64 5
  %26 = load i8, i8* %25, align 1
  %27 = sub i8 %26, %.09
  store i8 %27, i8* %25, align 1
  %28 = add nsw i32 %.02, -3
  %29 = icmp sgt i32 %.02, 3
  br i1 %29, label %18, label %.loopexit12.loopexit46

; <label>:30:                                     ; preds = %10
  %31 = load i8, i8* %1, align 1
  %32 = getelementptr inbounds i8, i8* %1, i64 1
  %33 = load i8, i8* %32, align 1
  %34 = getelementptr inbounds i8, i8* %1, i64 2
  %35 = load i8, i8* %34, align 1
  %36 = getelementptr inbounds i8, i8* %1, i64 3
  %37 = load i8, i8* %36, align 1
  %38 = add i32 %8, -1
  %39 = sub i32 %38, %2
  %40 = icmp sgt i32 %39, -5
  %smax = select i1 %40, i32 %39, i32 -5
  %41 = add i32 %smax, %2
  %42 = add i32 %41, 4
  %43 = sub i32 %42, %8
  %44 = lshr i32 %43, 2
  %45 = and i32 %44, 1
  %lcmp.mod36 = icmp eq i32 %45, 0
  br i1 %lcmp.mod36, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %30
  %46 = getelementptr inbounds i8, i8* %1, i64 4
  %47 = load i8, i8* %46, align 1
  %48 = sub i8 %47, %31
  store i8 %48, i8* %46, align 1
  %49 = getelementptr inbounds i8, i8* %1, i64 5
  %50 = load i8, i8* %49, align 1
  %51 = sub i8 %50, %33
  store i8 %51, i8* %49, align 1
  %52 = getelementptr inbounds i8, i8* %1, i64 6
  %53 = load i8, i8* %52, align 1
  %54 = sub i8 %53, %35
  store i8 %54, i8* %52, align 1
  %55 = getelementptr inbounds i8, i8* %1, i64 7
  %56 = load i8, i8* %55, align 1
  %57 = sub i8 %56, %37
  store i8 %57, i8* %55, align 1
  %58 = add nsw i32 %11, -4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %30
  %.08.unr = phi i8 [ %31, %30 ], [ %47, %.prol.preheader ]
  %.16.unr = phi i8* [ %1, %30 ], [ %46, %.prol.preheader ]
  %.04.unr = phi i8 [ %33, %30 ], [ %50, %.prol.preheader ]
  %.03.unr = phi i8 [ %35, %30 ], [ %53, %.prol.preheader ]
  %.1.unr = phi i32 [ %11, %30 ], [ %58, %.prol.preheader ]
  %.01.unr = phi i8 [ %37, %30 ], [ %56, %.prol.preheader ]
  %59 = icmp eq i32 %44, 0
  br i1 %59, label %.loopexit12, label %.new.preheader

.new.preheader:                                   ; preds = %.prol.loopexit
  br label %.new

.new:                                             ; preds = %.new.preheader, %.new
  %.08 = phi i8 [ %74, %.new ], [ %.08.unr, %.new.preheader ]
  %.16 = phi i8* [ %73, %.new ], [ %.16.unr, %.new.preheader ]
  %.04 = phi i8 [ %77, %.new ], [ %.04.unr, %.new.preheader ]
  %.03 = phi i8 [ %80, %.new ], [ %.03.unr, %.new.preheader ]
  %.1 = phi i32 [ %85, %.new ], [ %.1.unr, %.new.preheader ]
  %.01 = phi i8 [ %83, %.new ], [ %.01.unr, %.new.preheader ]
  %60 = getelementptr inbounds i8, i8* %.16, i64 4
  %61 = load i8, i8* %60, align 1
  %62 = sub i8 %61, %.08
  store i8 %62, i8* %60, align 1
  %63 = getelementptr inbounds i8, i8* %.16, i64 5
  %64 = load i8, i8* %63, align 1
  %65 = sub i8 %64, %.04
  store i8 %65, i8* %63, align 1
  %66 = getelementptr inbounds i8, i8* %.16, i64 6
  %67 = load i8, i8* %66, align 1
  %68 = sub i8 %67, %.03
  store i8 %68, i8* %66, align 1
  %69 = getelementptr inbounds i8, i8* %.16, i64 7
  %70 = load i8, i8* %69, align 1
  %71 = sub i8 %70, %.01
  store i8 %71, i8* %69, align 1
  %72 = add nsw i32 %.1, -4
  %73 = getelementptr inbounds i8, i8* %.16, i64 8
  %74 = load i8, i8* %73, align 1
  %75 = sub i8 %74, %61
  store i8 %75, i8* %73, align 1
  %76 = getelementptr inbounds i8, i8* %.16, i64 9
  %77 = load i8, i8* %76, align 1
  %78 = sub i8 %77, %64
  store i8 %78, i8* %76, align 1
  %79 = getelementptr inbounds i8, i8* %.16, i64 10
  %80 = load i8, i8* %79, align 1
  %81 = sub i8 %80, %67
  store i8 %81, i8* %79, align 1
  %82 = getelementptr inbounds i8, i8* %.16, i64 11
  %83 = load i8, i8* %82, align 1
  %84 = sub i8 %83, %70
  store i8 %84, i8* %82, align 1
  %85 = add nsw i32 %.1, -8
  %86 = icmp sgt i32 %72, 4
  br i1 %86, label %.new, label %.loopexit12.loopexit47

..split_crit_edge:                                ; preds = %10
  %87 = add nsw i32 %11, -1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8, i8* %1, i64 %88
  %90 = add nsw i32 %8, -4
  %91 = icmp sgt i32 %8, 4
  %92 = sext i32 %8 to i64
  %93 = sext i32 %8 to i64
  %94 = sext i32 %8 to i64
  %95 = sext i32 %8 to i64
  %96 = sext i32 %8 to i64
  %97 = add i32 %8, -5
  %98 = zext i32 %97 to i64
  %99 = xor i64 %98, -1
  %xtraiter = and i32 %90, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %100 = icmp ult i32 %97, 3
  br label %.split.split

.split.split:                                     ; preds = %..split_crit_edge, %153
  %.27 = phi i8* [ %.8, %153 ], [ %89, %..split_crit_edge ]
  %.2 = phi i32 [ %154, %153 ], [ %11, %..split_crit_edge ]
  switch i32 %8, label %101 [
    i32 0, label %153
    i32 1, label %147
    i32 2, label %141
  ]

; <label>:101:                                    ; preds = %.split.split
  br i1 %91, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %101
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.016.prol = phi i32 [ %107, %.lr.ph.prol ], [ %90, %.lr.ph.prol.preheader ]
  %.315.prol = phi i8* [ %106, %.lr.ph.prol ], [ %.27, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %102 = load i8, i8* %.315.prol, align 1
  %103 = getelementptr inbounds i8, i8* %.315.prol, i64 %92
  %104 = load i8, i8* %103, align 1
  %105 = sub i8 %104, %102
  store i8 %105, i8* %103, align 1
  %106 = getelementptr inbounds i8, i8* %.315.prol, i64 -1
  %107 = add nsw i32 %.016.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.016.unr = phi i32 [ %90, %.lr.ph.preheader ], [ %107, %.lr.ph.prol.loopexit.loopexit ]
  %.315.unr = phi i8* [ %.27, %.lr.ph.preheader ], [ %106, %.lr.ph.prol.loopexit.loopexit ]
  br i1 %100, label %.loopexit.loopexit, label %.lr.ph.preheader45

.lr.ph.preheader45:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader45, %.lr.ph
  %.016 = phi i32 [ %129, %.lr.ph ], [ %.016.unr, %.lr.ph.preheader45 ]
  %.315 = phi i8* [ %128, %.lr.ph ], [ %.315.unr, %.lr.ph.preheader45 ]
  %108 = load i8, i8* %.315, align 1
  %109 = getelementptr inbounds i8, i8* %.315, i64 %92
  %110 = load i8, i8* %109, align 1
  %111 = sub i8 %110, %108
  store i8 %111, i8* %109, align 1
  %112 = getelementptr inbounds i8, i8* %.315, i64 -1
  %113 = load i8, i8* %112, align 1
  %114 = getelementptr inbounds i8, i8* %112, i64 %92
  %115 = load i8, i8* %114, align 1
  %116 = sub i8 %115, %113
  store i8 %116, i8* %114, align 1
  %117 = getelementptr inbounds i8, i8* %.315, i64 -2
  %118 = load i8, i8* %117, align 1
  %119 = getelementptr inbounds i8, i8* %117, i64 %92
  %120 = load i8, i8* %119, align 1
  %121 = sub i8 %120, %118
  store i8 %121, i8* %119, align 1
  %122 = getelementptr inbounds i8, i8* %.315, i64 -3
  %123 = add nsw i32 %.016, -3
  %124 = load i8, i8* %122, align 1
  %125 = getelementptr inbounds i8, i8* %122, i64 %92
  %126 = load i8, i8* %125, align 1
  %127 = sub i8 %126, %124
  store i8 %127, i8* %125, align 1
  %128 = getelementptr inbounds i8, i8* %.315, i64 -4
  %129 = add nsw i32 %.016, -4
  %130 = icmp sgt i32 %123, 1
  br i1 %130, label %.lr.ph, label %.loopexit.loopexit.loopexit

.loopexit.loopexit.loopexit:                      ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.loopexit.loopexit.loopexit, %.lr.ph.prol.loopexit
  %scevgep = getelementptr i8, i8* %.27, i64 %99
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %101
  %.3.lcssa = phi i8* [ %.27, %101 ], [ %scevgep, %.loopexit.loopexit ]
  %131 = load i8, i8* %.3.lcssa, align 1
  %132 = getelementptr inbounds i8, i8* %.3.lcssa, i64 %93
  %133 = load i8, i8* %132, align 1
  %134 = sub i8 %133, %131
  store i8 %134, i8* %132, align 1
  %135 = getelementptr inbounds i8, i8* %.3.lcssa, i64 -1
  %136 = load i8, i8* %135, align 1
  %137 = getelementptr inbounds i8, i8* %135, i64 %94
  %138 = load i8, i8* %137, align 1
  %139 = sub i8 %138, %136
  store i8 %139, i8* %137, align 1
  %140 = getelementptr inbounds i8, i8* %.3.lcssa, i64 -2
  br label %141

; <label>:141:                                    ; preds = %.loopexit, %.split.split
  %.6 = phi i8* [ %140, %.loopexit ], [ %.27, %.split.split ]
  %142 = load i8, i8* %.6, align 1
  %143 = getelementptr inbounds i8, i8* %.6, i64 %95
  %144 = load i8, i8* %143, align 1
  %145 = sub i8 %144, %142
  store i8 %145, i8* %143, align 1
  %146 = getelementptr inbounds i8, i8* %.6, i64 -1
  br label %147

; <label>:147:                                    ; preds = %.split.split, %141
  %.7 = phi i8* [ %146, %141 ], [ %.27, %.split.split ]
  %148 = load i8, i8* %.7, align 1
  %149 = getelementptr inbounds i8, i8* %.7, i64 %96
  %150 = load i8, i8* %149, align 1
  %151 = sub i8 %150, %148
  store i8 %151, i8* %149, align 1
  %152 = getelementptr inbounds i8, i8* %.7, i64 -1
  br label %153

; <label>:153:                                    ; preds = %.split.split, %147
  %.8 = phi i8* [ %152, %147 ], [ %.27, %.split.split ]
  %154 = sub nsw i32 %.2, %8
  %155 = icmp sgt i32 %154, 0
  br i1 %155, label %.split.split, label %.loopexit12.loopexit

.loopexit12.loopexit:                             ; preds = %153
  br label %.loopexit12

.loopexit12.loopexit46:                           ; preds = %18
  br label %.loopexit12

.loopexit12.loopexit47:                           ; preds = %.new
  br label %.loopexit12

.loopexit12:                                      ; preds = %.loopexit12.loopexit47, %.loopexit12.loopexit46, %.loopexit12.loopexit, %.prol.loopexit, %3
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @horDiff16(%struct.tiff* nocapture readonly, i8* nocapture, i32) #3 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.TIFFPredictorState**
  %6 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %5, align 8
  %7 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %6, i64 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = sdiv i32 %2, 2
  %10 = icmp sgt i32 %9, %8
  br i1 %10, label %11, label %.loopexit3

; <label>:11:                                     ; preds = %3
  %12 = bitcast i8* %1 to i16*
  %13 = sub nsw i32 %9, %8
  %14 = add nsw i32 %13, -1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i16, i16* %12, i64 %15
  %17 = add nsw i32 %8, -4
  %18 = icmp sgt i32 %8, 4
  %19 = sext i32 %8 to i64
  %20 = sext i32 %8 to i64
  %21 = sext i32 %8 to i64
  %22 = sext i32 %8 to i64
  %23 = sext i32 %8 to i64
  switch i32 %8, label %.split.split.preheader [
    i32 4, label %.split.us.preheader
    i32 3, label %.split.split.us.preheader
  ]

.split.split.us.preheader:                        ; preds = %11
  br label %.split.split.us

.split.us.preheader:                              ; preds = %11
  br label %.split.us

.split.split.preheader:                           ; preds = %11
  %24 = add i32 %8, -5
  %25 = zext i32 %24 to i64
  %26 = xor i64 %25, -1
  %xtraiter = and i32 %17, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %27 = icmp ult i32 %24, 3
  br label %.split.split

.split.us:                                        ; preds = %.split.us.preheader, %.split.us
  %.02.us = phi i16* [ %47, %.split.us ], [ %16, %.split.us.preheader ]
  %.01.us = phi i32 [ %48, %.split.us ], [ %13, %.split.us.preheader ]
  %28 = load i16, i16* %.02.us, align 2
  %29 = getelementptr inbounds i16, i16* %.02.us, i64 %20
  %30 = load i16, i16* %29, align 2
  %31 = sub i16 %30, %28
  store i16 %31, i16* %29, align 2
  %32 = getelementptr inbounds i16, i16* %.02.us, i64 -1
  %33 = load i16, i16* %32, align 2
  %34 = getelementptr inbounds i16, i16* %32, i64 %21
  %35 = load i16, i16* %34, align 2
  %36 = sub i16 %35, %33
  store i16 %36, i16* %34, align 2
  %37 = getelementptr inbounds i16, i16* %.02.us, i64 -2
  %38 = load i16, i16* %37, align 2
  %39 = getelementptr inbounds i16, i16* %37, i64 %22
  %40 = load i16, i16* %39, align 2
  %41 = sub i16 %40, %38
  store i16 %41, i16* %39, align 2
  %42 = getelementptr inbounds i16, i16* %.02.us, i64 -3
  %43 = load i16, i16* %42, align 2
  %44 = getelementptr inbounds i16, i16* %42, i64 %23
  %45 = load i16, i16* %44, align 2
  %46 = sub i16 %45, %43
  store i16 %46, i16* %44, align 2
  %47 = getelementptr inbounds i16, i16* %.02.us, i64 -4
  %48 = add nsw i32 %.01.us, -4
  %49 = icmp sgt i32 %.01.us, 4
  br i1 %49, label %.split.us, label %.loopexit3.loopexit33

.split.split.us:                                  ; preds = %.split.split.us.preheader, %.split.split.us
  %.02.us6 = phi i16* [ %64, %.split.split.us ], [ %16, %.split.split.us.preheader ]
  %.01.us7 = phi i32 [ %65, %.split.split.us ], [ %13, %.split.split.us.preheader ]
  %50 = load i16, i16* %.02.us6, align 2
  %51 = getelementptr inbounds i16, i16* %.02.us6, i64 %21
  %52 = load i16, i16* %51, align 2
  %53 = sub i16 %52, %50
  store i16 %53, i16* %51, align 2
  %54 = getelementptr inbounds i16, i16* %.02.us6, i64 -1
  %55 = load i16, i16* %54, align 2
  %56 = getelementptr inbounds i16, i16* %54, i64 %22
  %57 = load i16, i16* %56, align 2
  %58 = sub i16 %57, %55
  store i16 %58, i16* %56, align 2
  %59 = getelementptr inbounds i16, i16* %.02.us6, i64 -2
  %60 = load i16, i16* %59, align 2
  %61 = getelementptr inbounds i16, i16* %59, i64 %23
  %62 = load i16, i16* %61, align 2
  %63 = sub i16 %62, %60
  store i16 %63, i16* %61, align 2
  %64 = getelementptr inbounds i16, i16* %.02.us6, i64 -3
  %65 = add nsw i32 %.01.us7, -3
  %66 = icmp sgt i32 %.01.us7, 3
  br i1 %66, label %.split.split.us, label %.loopexit3.loopexit34

.split.split:                                     ; preds = %.split.split.preheader, %119
  %.02 = phi i16* [ %.6, %119 ], [ %16, %.split.split.preheader ]
  %.01 = phi i32 [ %120, %119 ], [ %13, %.split.split.preheader ]
  switch i32 %8, label %67 [
    i32 0, label %119
    i32 1, label %113
    i32 2, label %107
  ]

; <label>:67:                                     ; preds = %.split.split
  br i1 %18, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %67
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.05.prol = phi i32 [ %73, %.lr.ph.prol ], [ %17, %.lr.ph.prol.preheader ]
  %.14.prol = phi i16* [ %72, %.lr.ph.prol ], [ %.02, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %68 = load i16, i16* %.14.prol, align 2
  %69 = getelementptr inbounds i16, i16* %.14.prol, i64 %19
  %70 = load i16, i16* %69, align 2
  %71 = sub i16 %70, %68
  store i16 %71, i16* %69, align 2
  %72 = getelementptr inbounds i16, i16* %.14.prol, i64 -1
  %73 = add nsw i32 %.05.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !6

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.05.unr = phi i32 [ %17, %.lr.ph.preheader ], [ %73, %.lr.ph.prol.loopexit.loopexit ]
  %.14.unr = phi i16* [ %.02, %.lr.ph.preheader ], [ %72, %.lr.ph.prol.loopexit.loopexit ]
  br i1 %27, label %.loopexit.loopexit, label %.lr.ph.preheader32

.lr.ph.preheader32:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader32, %.lr.ph
  %.05 = phi i32 [ %95, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader32 ]
  %.14 = phi i16* [ %94, %.lr.ph ], [ %.14.unr, %.lr.ph.preheader32 ]
  %74 = load i16, i16* %.14, align 2
  %75 = getelementptr inbounds i16, i16* %.14, i64 %19
  %76 = load i16, i16* %75, align 2
  %77 = sub i16 %76, %74
  store i16 %77, i16* %75, align 2
  %78 = getelementptr inbounds i16, i16* %.14, i64 -1
  %79 = load i16, i16* %78, align 2
  %80 = getelementptr inbounds i16, i16* %78, i64 %19
  %81 = load i16, i16* %80, align 2
  %82 = sub i16 %81, %79
  store i16 %82, i16* %80, align 2
  %83 = getelementptr inbounds i16, i16* %.14, i64 -2
  %84 = load i16, i16* %83, align 2
  %85 = getelementptr inbounds i16, i16* %83, i64 %19
  %86 = load i16, i16* %85, align 2
  %87 = sub i16 %86, %84
  store i16 %87, i16* %85, align 2
  %88 = getelementptr inbounds i16, i16* %.14, i64 -3
  %89 = add nsw i32 %.05, -3
  %90 = load i16, i16* %88, align 2
  %91 = getelementptr inbounds i16, i16* %88, i64 %19
  %92 = load i16, i16* %91, align 2
  %93 = sub i16 %92, %90
  store i16 %93, i16* %91, align 2
  %94 = getelementptr inbounds i16, i16* %.14, i64 -4
  %95 = add nsw i32 %.05, -4
  %96 = icmp sgt i32 %89, 1
  br i1 %96, label %.lr.ph, label %.loopexit.loopexit.loopexit

.loopexit.loopexit.loopexit:                      ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.loopexit.loopexit.loopexit, %.lr.ph.prol.loopexit
  %scevgep = getelementptr i16, i16* %.02, i64 %26
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %67
  %.1.lcssa = phi i16* [ %.02, %67 ], [ %scevgep, %.loopexit.loopexit ]
  %97 = load i16, i16* %.1.lcssa, align 2
  %98 = getelementptr inbounds i16, i16* %.1.lcssa, i64 %20
  %99 = load i16, i16* %98, align 2
  %100 = sub i16 %99, %97
  store i16 %100, i16* %98, align 2
  %101 = getelementptr inbounds i16, i16* %.1.lcssa, i64 -1
  %102 = load i16, i16* %101, align 2
  %103 = getelementptr inbounds i16, i16* %101, i64 %21
  %104 = load i16, i16* %103, align 2
  %105 = sub i16 %104, %102
  store i16 %105, i16* %103, align 2
  %106 = getelementptr inbounds i16, i16* %.1.lcssa, i64 -2
  br label %107

; <label>:107:                                    ; preds = %.loopexit, %.split.split
  %.4 = phi i16* [ %106, %.loopexit ], [ %.02, %.split.split ]
  %108 = load i16, i16* %.4, align 2
  %109 = getelementptr inbounds i16, i16* %.4, i64 %22
  %110 = load i16, i16* %109, align 2
  %111 = sub i16 %110, %108
  store i16 %111, i16* %109, align 2
  %112 = getelementptr inbounds i16, i16* %.4, i64 -1
  br label %113

; <label>:113:                                    ; preds = %.split.split, %107
  %.5 = phi i16* [ %112, %107 ], [ %.02, %.split.split ]
  %114 = load i16, i16* %.5, align 2
  %115 = getelementptr inbounds i16, i16* %.5, i64 %23
  %116 = load i16, i16* %115, align 2
  %117 = sub i16 %116, %114
  store i16 %117, i16* %115, align 2
  %118 = getelementptr inbounds i16, i16* %.5, i64 -1
  br label %119

; <label>:119:                                    ; preds = %.split.split, %113
  %.6 = phi i16* [ %118, %113 ], [ %.02, %.split.split ]
  %120 = sub nsw i32 %.01, %8
  %121 = icmp sgt i32 %120, 0
  br i1 %121, label %.split.split, label %.loopexit3.loopexit

.loopexit3.loopexit:                              ; preds = %119
  br label %.loopexit3

.loopexit3.loopexit33:                            ; preds = %.split.us
  br label %.loopexit3

.loopexit3.loopexit34:                            ; preds = %.split.split.us
  br label %.loopexit3

.loopexit3:                                       ; preds = %.loopexit3.loopexit34, %.loopexit3.loopexit33, %.loopexit3.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PredictorEncodeRow(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.TIFFPredictorState**
  %7 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %6, align 8
  %8 = icmp eq %struct.TIFFPredictorState* %7, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 350, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeRow, i64 0, i64 0)) #6
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 3
  %12 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %11, align 8
  %13 = icmp eq void (%struct.tiff*, i8*, i32)* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 351, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeRow, i64 0, i64 0)) #6
  unreachable

; <label>:15:                                     ; preds = %10
  %16 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 4
  %17 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %18 = icmp eq i32 (%struct.tiff*, i8*, i32, i16)* %17, null
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %15
  tail call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 352, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeRow, i64 0, i64 0)) #6
  unreachable

; <label>:20:                                     ; preds = %15
  tail call void %12(%struct.tiff* nonnull %0, i8* %1, i32 %2) #5
  %21 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %22 = tail call i32 %21(%struct.tiff* nonnull %0, i8* %1, i32 %2, i16 zeroext %3) #5
  ret i32 %22
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PredictorEncodeTile(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.TIFFPredictorState**
  %7 = load %struct.TIFFPredictorState*, %struct.TIFFPredictorState** %6, align 8
  %8 = icmp eq %struct.TIFFPredictorState* %7, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 365, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeTile, i64 0, i64 0)) #6
  unreachable

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 3
  %12 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %11, align 8
  %13 = icmp eq void (%struct.tiff*, i8*, i32)* %12, null
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 366, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeTile, i64 0, i64 0)) #6
  unreachable

; <label>:15:                                     ; preds = %10
  %16 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 6
  %17 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %18 = icmp eq i32 (%struct.tiff*, i8*, i32, i16)* %17, null
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %15
  tail call void @__assert_fail(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 367, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeTile, i64 0, i64 0)) #6
  unreachable

; <label>:20:                                     ; preds = %15
  %21 = getelementptr inbounds %struct.TIFFPredictorState, %struct.TIFFPredictorState* %7, i64 0, i32 2
  %22 = load i32, i32* %21, align 8
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.preheader, label %26

.preheader:                                       ; preds = %20
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %25 = sext i32 %22 to i64
  br label %27

; <label>:26:                                     ; preds = %20
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i64 0, i64 0), i32 369, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PredictorEncodeTile, i64 0, i64 0)) #6
  unreachable

; <label>:27:                                     ; preds = %.lr.ph, %27
  %.03 = phi i8* [ %1, %.lr.ph ], [ %30, %27 ]
  %.012 = phi i32 [ %2, %.lr.ph ], [ %29, %27 ]
  %28 = load void (%struct.tiff*, i8*, i32)*, void (%struct.tiff*, i8*, i32)** %11, align 8
  tail call void %28(%struct.tiff* %0, i8* %.03, i32 %22) #5
  %29 = sub nsw i32 %.012, %22
  %30 = getelementptr inbounds i8, i8* %.03, i64 %25
  %31 = icmp sgt i32 %29, 0
  br i1 %31, label %27, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %27
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %32 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %33 = tail call i32 %32(%struct.tiff* %0, i8* %1, i32 %2, i16 zeroext %3) #5
  ret i32 %33
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
!6 = distinct !{!6, !2}
