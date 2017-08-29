; ModuleID = 'tif_getimage.ll'
source_filename = "tif_getimage.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._TIFFRGBAImage = type { %struct.tiff*, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16*, i16*, i16*, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)*, %union.anon, i8*, i32**, i32**, %struct.TIFFYCbCrToRGB*, i32, i32 }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%union.anon = type { {}* }
%struct.TIFFYCbCrToRGB = type { i8*, i32*, i32*, i32*, i32*, [3 x float] }

@.str = private unnamed_addr constant [49 x i8] c"Sorry, can not handle images with %d-bit samples\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Missing needed %s tag\00", align 1
@photoTag = internal constant [26 x i8] c"PhotometricInterpretation\00", align 16
@.str.2 = private unnamed_addr constant [60 x i8] c"Sorry, can not handle contiguous data with %s=%d, and %s=%d\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Samples/pixel\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Sorry, can not handle YCbCr images with %s=%d\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Planarconfiguration\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"Sorry, can not handle RGB image with %s=%d\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"Color channels\00", align 1
@.str.8 = private unnamed_addr constant [49 x i8] c"Sorry, can not handle separated image with %s=%d\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"InkSet\00", align 1
@.str.10 = private unnamed_addr constant [33 x i8] c"Sorry, LogL data must have %s=%d\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"Compression\00", align 1
@.str.12 = private unnamed_addr constant [41 x i8] c"Sorry, LogLuv data must have %s=%d or %d\00", align 1
@.str.13 = private unnamed_addr constant [47 x i8] c"Sorry, can not handle LogLuv images with %s=%d\00", align 1
@.str.14 = private unnamed_addr constant [39 x i8] c"Sorry, can not handle image with %s=%d\00", align 1
@.str.15 = private unnamed_addr constant [41 x i8] c"Sorry, can not image with %d-bit samples\00", align 1
@.str.16 = private unnamed_addr constant [32 x i8] c"Missing required \22Colormap\22 tag\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"Out of memory for colormap copy\00", align 1
@.str.18 = private unnamed_addr constant [23 x i8] c"No \22get\22 routine setup\00", align 1
@.str.19 = private unnamed_addr constant [62 x i8] c"No \22put\22 routine setupl; probably can not handle image format\00", align 1
@.str.20 = private unnamed_addr constant [47 x i8] c"Can't use TIFFReadRGBAStrip() with tiled file.\00", align 1
@.str.21 = private unnamed_addr constant [60 x i8] c"Row passed to TIFFReadRGBAStrip() must be first in a strip.\00", align 1
@.str.22 = private unnamed_addr constant [49 x i8] c"Can't use TIFFReadRGBATile() with stripped file.\00", align 1
@.str.23 = private unnamed_addr constant [71 x i8] c"Row/col passed to TIFFReadRGBATile() must be topleft corner of a tile.\00", align 1
@.str.24 = private unnamed_addr constant [25 x i8] c"No space for tile buffer\00", align 1
@.str.25 = private unnamed_addr constant [30 x i8] c"using bottom-left orientation\00", align 1
@.str.26 = private unnamed_addr constant [27 x i8] c"using top-left orientation\00", align 1
@.str.27 = private unnamed_addr constant [26 x i8] c"No space for strip buffer\00", align 1
@.str.28 = private unnamed_addr constant [24 x i8] c"Assuming 8-bit colormap\00", align 1
@.str.29 = private unnamed_addr constant [42 x i8] c"No space for photometric conversion table\00", align 1
@.str.30 = private unnamed_addr constant [31 x i8] c"No space for B&W mapping table\00", align 1
@.str.31 = private unnamed_addr constant [35 x i8] c"No space for Palette mapping table\00", align 1
@.str.32 = private unnamed_addr constant [41 x i8] c"No space for YCbCr->RGB conversion state\00", align 1
@switch.table = private unnamed_addr constant [8 x void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*] [void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put1bitcmaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put2bitcmaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put4bitcmaptile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put8bitcmaptile]
@switch.table.1 = private unnamed_addr constant [8 x void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*] [void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put1bitbwtile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put2bitbwtile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @put4bitbwtile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* null, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putgreytile]

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFRGBAImageOK(%struct.tiff*, i8* nocapture) local_unnamed_addr #0 {
  %3 = alloca i16, align 2
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %5 = load i16, i16* %4, align 4
  switch i16 %5, label %6 [
    i16 1, label %9
    i16 2, label %9
    i16 4, label %9
    i16 8, label %9
    i16 16, label %9
  ]

; <label>:6:                                      ; preds = %2
  %7 = zext i16 %5 to i32
  %8 = tail call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i64 0, i64 0), i32 %7) #6
  br label %84

; <label>:9:                                      ; preds = %2, %2, %2, %2, %2
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 30
  %14 = load i16, i16* %13, align 4
  %15 = zext i16 %14 to i32
  %16 = sub nsw i32 %12, %15
  %17 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %0, i32 262, i16* nonnull %3) #6
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %thread-pre-split

; <label>:19:                                     ; preds = %9
  switch i32 %16, label %21 [
    i32 1, label %23
    i32 3, label %20
  ]

; <label>:20:                                     ; preds = %19
  br label %23

; <label>:21:                                     ; preds = %19
  %22 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i64 0, i64 0)) #6
  br label %84

; <label>:23:                                     ; preds = %19, %20
  %storemerge = phi i16 [ 2, %20 ], [ 1, %19 ]
  store i16 %storemerge, i16* %3, align 2
  br label %24

thread-pre-split:                                 ; preds = %9
  %.pr = load i16, i16* %3, align 2
  br label %24

; <label>:24:                                     ; preds = %thread-pre-split, %23
  %25 = phi i16 [ %.pr, %thread-pre-split ], [ %storemerge, %23 ]
  switch i16 %25, label %81 [
    i16 0, label %26
    i16 1, label %26
    i16 3, label %26
    i16 6, label %38
    i16 2, label %45
    i16 5, label %49
    i16 -32692, label %62
    i16 -32691, label %68
  ]

; <label>:26:                                     ; preds = %24, %24, %24
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %28 = load i16, i16* %27, align 2
  %29 = icmp eq i16 %28, 1
  br i1 %29, label %30, label %84

; <label>:30:                                     ; preds = %26
  %31 = load i16, i16* %10, align 2
  %32 = icmp eq i16 %31, 1
  br i1 %32, label %84, label %33

; <label>:33:                                     ; preds = %30
  %34 = zext i16 %31 to i32
  %35 = load i16, i16* %3, align 2
  %36 = zext i16 %35 to i32
  %37 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i64 0, i64 0), i32 %36, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %34) #6
  br label %84

; <label>:38:                                     ; preds = %24
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %40 = load i16, i16* %39, align 2
  %41 = icmp eq i16 %40, 1
  br i1 %41, label %84, label %42

; <label>:42:                                     ; preds = %38
  %43 = zext i16 %40 to i32
  %44 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i32 %43) #6
  br label %84

; <label>:45:                                     ; preds = %24
  %46 = icmp slt i32 %16, 3
  br i1 %46, label %47, label %84

; <label>:47:                                     ; preds = %45
  %48 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i32 %16) #6
  br label %84

; <label>:49:                                     ; preds = %24
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 55
  %51 = load i16, i16* %50, align 8
  %52 = icmp eq i16 %51, 1
  br i1 %52, label %56, label %53

; <label>:53:                                     ; preds = %49
  %54 = zext i16 %51 to i32
  %55 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i64 0, i64 0), i32 %54) #6
  br label %84

; <label>:56:                                     ; preds = %49
  %57 = load i16, i16* %10, align 2
  %58 = icmp eq i16 %57, 4
  br i1 %58, label %84, label %59

; <label>:59:                                     ; preds = %56
  %60 = zext i16 %57 to i32
  %61 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %60) #6
  br label %84

; <label>:62:                                     ; preds = %24
  %63 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %64 = load i16, i16* %63, align 8
  %65 = icmp eq i16 %64, -30860
  br i1 %65, label %84, label %66

; <label>:66:                                     ; preds = %62
  %67 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i64 0, i64 0), i32 34676) #6
  br label %84

; <label>:68:                                     ; preds = %24
  %69 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %70 = load i16, i16* %69, align 8
  %71 = and i16 %70, -2
  %switch = icmp eq i16 %71, -30860
  br i1 %switch, label %74, label %72

; <label>:72:                                     ; preds = %68
  %73 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i64 0, i64 0), i32 34676, i32 34677) #6
  br label %84

; <label>:74:                                     ; preds = %68
  %75 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %76 = load i16, i16* %75, align 2
  %77 = icmp eq i16 %76, 1
  br i1 %77, label %84, label %78

; <label>:78:                                     ; preds = %74
  %79 = zext i16 %76 to i32
  %80 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i32 %79) #6
  br label %84

; <label>:81:                                     ; preds = %24
  %82 = zext i16 %25 to i32
  %83 = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i64 0, i64 0), i32 %82) #6
  br label %84

; <label>:84:                                     ; preds = %30, %26, %38, %45, %56, %62, %74, %81, %78, %72, %66, %59, %53, %47, %42, %33, %21, %6
  %.0 = phi i32 [ 0, %6 ], [ 0, %81 ], [ 0, %72 ], [ 0, %78 ], [ 0, %66 ], [ 0, %53 ], [ 0, %59 ], [ 0, %47 ], [ 0, %42 ], [ 0, %33 ], [ 0, %21 ], [ 1, %74 ], [ 1, %62 ], [ 1, %56 ], [ 1, %45 ], [ 1, %38 ], [ 1, %26 ], [ 1, %30 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @TIFFRGBAImageEnd(%struct._TIFFRGBAImage* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %3 = load i8*, i8** %2, align 8
  %4 = icmp eq i8* %3, null
  br i1 %4, label %6, label %5

; <label>:5:                                      ; preds = %1
  tail call void @_TIFFfree(i8* nonnull %3) #6
  store i8* null, i8** %2, align 8
  br label %6

; <label>:6:                                      ; preds = %1, %5
  %7 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 16
  %8 = load i32**, i32*** %7, align 8
  %9 = icmp eq i32** %8, null
  br i1 %9, label %13, label %10

; <label>:10:                                     ; preds = %6
  %11 = bitcast i32*** %7 to i8**
  %12 = load i8*, i8** %11, align 8
  tail call void @_TIFFfree(i8* %12) #6
  store i32** null, i32*** %7, align 8
  br label %13

; <label>:13:                                     ; preds = %6, %10
  %14 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 17
  %15 = load i32**, i32*** %14, align 8
  %16 = icmp eq i32** %15, null
  br i1 %16, label %20, label %17

; <label>:17:                                     ; preds = %13
  %18 = bitcast i32*** %14 to i8**
  %19 = load i8*, i8** %18, align 8
  tail call void @_TIFFfree(i8* %19) #6
  store i32** null, i32*** %14, align 8
  br label %20

; <label>:20:                                     ; preds = %13, %17
  %21 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 18
  %22 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %21, align 8
  %23 = icmp eq %struct.TIFFYCbCrToRGB* %22, null
  br i1 %23, label %27, label %24

; <label>:24:                                     ; preds = %20
  %25 = bitcast %struct.TIFFYCbCrToRGB** %21 to i8**
  %26 = load i8*, i8** %25, align 8
  tail call void @_TIFFfree(i8* %26) #6
  store %struct.TIFFYCbCrToRGB* null, %struct.TIFFYCbCrToRGB** %21, align 8
  br label %27

; <label>:27:                                     ; preds = %20, %24
  %28 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 10
  %29 = load i16*, i16** %28, align 8
  %30 = icmp eq i16* %29, null
  br i1 %30, label %40, label %31

; <label>:31:                                     ; preds = %27
  %32 = bitcast i16** %28 to i8**
  %33 = load i8*, i8** %32, align 8
  tail call void @_TIFFfree(i8* %33) #6
  %34 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 11
  %35 = bitcast i16** %34 to i8**
  %36 = load i8*, i8** %35, align 8
  tail call void @_TIFFfree(i8* %36) #6
  %37 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 12
  %38 = bitcast i16** %37 to i8**
  %39 = load i8*, i8** %38, align 8
  tail call void @_TIFFfree(i8* %39) #6
  br label %40

; <label>:40:                                     ; preds = %27, %31
  ret void
}

declare void @_TIFFfree(i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFRGBAImageBegin(%struct._TIFFRGBAImage*, %struct.tiff*, i32, i8* nocapture) local_unnamed_addr #0 {
  %5 = alloca i16*, align 8
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16, align 2
  %13 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 19
  store i32 0, i32* %13, align 8
  %14 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 20
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 10
  %16 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 11
  %17 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 12
  %18 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %19 = bitcast i16** %15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 24, i32 8, i1 false)
  store %struct.tiff* %1, %struct.tiff** %18, align 8
  %20 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  store i32 %2, i32* %20, align 8
  %21 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %22 = tail call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %1, i32 258, i16* %21) #6
  %23 = load i16, i16* %21, align 4
  switch i16 %23, label %24 [
    i16 1, label %27
    i16 2, label %27
    i16 4, label %27
    i16 8, label %27
    i16 16, label %27
  ]

; <label>:24:                                     ; preds = %4
  %25 = zext i16 %23 to i32
  %26 = tail call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.15, i64 0, i64 0), i32 %25) #6
  br label %178

; <label>:27:                                     ; preds = %4, %4, %4, %4, %4
  %28 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 3
  store i32 0, i32* %28, align 8
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %30 = tail call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %1, i32 277, i16* %29) #6
  %31 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %1, i32 338, i16* nonnull %6, i16** nonnull %5) #6
  %32 = load i16, i16* %6, align 2
  %33 = icmp eq i16 %32, 1
  br i1 %33, label %34, label %39

; <label>:34:                                     ; preds = %27
  %35 = load i16*, i16** %5, align 8
  %36 = load i16, i16* %35, align 2
  %.off = add i16 %36, -1
  %switch = icmp ult i16 %.off, 2
  br i1 %switch, label %37, label %39

; <label>:37:                                     ; preds = %34
  %38 = zext i16 %36 to i32
  store i32 %38, i32* %28, align 8
  br label %39

; <label>:39:                                     ; preds = %37, %34, %27
  %40 = load i16, i16* %29, align 2
  %41 = zext i16 %40 to i32
  %42 = load i16, i16* %6, align 2
  %43 = zext i16 %42 to i32
  %44 = sub nsw i32 %41, %43
  %45 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %1, i32 259, i16* nonnull %8) #6
  %46 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %1, i32 284, i16* nonnull %7) #6
  %47 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 9
  %48 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %1, i32 262, i16* %47) #6
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %thread-pre-split

; <label>:50:                                     ; preds = %39
  switch i32 %44, label %54 [
    i32 1, label %51
    i32 3, label %.thread8
  ]

; <label>:51:                                     ; preds = %50
  %52 = call fastcc i32 @isCCITTCompression(%struct.tiff* %1)
  %53 = icmp eq i32 %52, 0
  %.sink = zext i1 %53 to i16
  store i16 %.sink, i16* %47, align 2
  br label %56

.thread8:                                         ; preds = %50
  store i16 2, i16* %47, align 2
  br label %158

; <label>:54:                                     ; preds = %50
  %55 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i64 0, i64 0)) #6
  br label %178

thread-pre-split:                                 ; preds = %39
  %.pr = load i16, i16* %47, align 2
  br label %56

; <label>:56:                                     ; preds = %thread-pre-split, %51
  %57 = phi i16 [ %.pr, %thread-pre-split ], [ %.sink, %51 ]
  switch i16 %57, label %155 [
    i16 3, label %58
    i16 0, label %96
    i16 1, label %96
    i16 6, label %107
    i16 2, label %118
    i16 5, label %122
    i16 -32692, label %135
    i16 -32691, label %142
  ]

; <label>:58:                                     ; preds = %56
  %59 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %1, i32 320, i16** nonnull %9, i16** nonnull %10, i16** nonnull %11) #6
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %63

; <label>:61:                                     ; preds = %58
  %62 = call i8* @TIFFFileName(%struct.tiff* %1) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %62, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.16, i64 0, i64 0)) #6
  br label %178

; <label>:63:                                     ; preds = %58
  %64 = load i16, i16* %21, align 4
  %65 = zext i16 %64 to i64
  %66 = shl i64 1, %65
  %67 = trunc i64 %66 to i32
  %68 = shl i32 %67, 1
  %69 = call i8* @_TIFFmalloc(i32 %68) #6
  %70 = bitcast i16** %15 to i8**
  store i8* %69, i8** %70, align 8
  %71 = call i8* @_TIFFmalloc(i32 %68) #6
  %72 = bitcast i16** %16 to i8**
  store i8* %71, i8** %72, align 8
  %73 = call i8* @_TIFFmalloc(i32 %68) #6
  %74 = bitcast i16** %17 to i8**
  store i8* %73, i8** %74, align 8
  %75 = load i16*, i16** %15, align 8
  %76 = icmp eq i16* %75, null
  br i1 %76, label %83, label %77

; <label>:77:                                     ; preds = %63
  %78 = load i16*, i16** %16, align 8
  %79 = icmp eq i16* %78, null
  br i1 %79, label %83, label %80

; <label>:80:                                     ; preds = %77
  %81 = load i16*, i16** %17, align 8
  %82 = icmp eq i16* %81, null
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %80, %77, %63
  %84 = call i8* @TIFFFileName(%struct.tiff* %1) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %84, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i64 0, i64 0)) #6
  br label %178

; <label>:85:                                     ; preds = %80
  %86 = load i8*, i8** %70, align 8
  %87 = bitcast i16** %9 to i8**
  %88 = load i8*, i8** %87, align 8
  %89 = sext i32 %68 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %86, i8* %88, i64 %89, i32 2, i1 false)
  %90 = load i8*, i8** %72, align 8
  %91 = bitcast i16** %10 to i8**
  %92 = load i8*, i8** %91, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %90, i8* %92, i64 %89, i32 2, i1 false)
  %93 = load i8*, i8** %74, align 8
  %94 = bitcast i16** %11 to i8**
  %95 = load i8*, i8** %94, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %93, i8* %95, i64 %89, i32 2, i1 false)
  br label %96

; <label>:96:                                     ; preds = %85, %56, %56
  %97 = load i16, i16* %7, align 2
  %98 = icmp eq i16 %97, 1
  br i1 %98, label %99, label %158

; <label>:99:                                     ; preds = %96
  %100 = load i16, i16* %29, align 2
  %101 = icmp eq i16 %100, 1
  br i1 %101, label %158, label %102

; <label>:102:                                    ; preds = %99
  %103 = load i16, i16* %47, align 2
  %104 = zext i16 %103 to i32
  %105 = zext i16 %100 to i32
  %106 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i64 0, i64 0), i32 %104, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %105) #6
  br label %178

; <label>:107:                                    ; preds = %56
  %108 = load i16, i16* %7, align 2
  %109 = icmp eq i16 %108, 1
  br i1 %109, label %113, label %110

; <label>:110:                                    ; preds = %107
  %111 = zext i16 %108 to i32
  %112 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i32 %111) #6
  br label %178

; <label>:113:                                    ; preds = %107
  %114 = load i16, i16* %8, align 2
  %115 = icmp eq i16 %114, 7
  br i1 %115, label %116, label %158

; <label>:116:                                    ; preds = %113
  %117 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 65538, i32 1) #6
  store i16 2, i16* %47, align 2
  br label %158

; <label>:118:                                    ; preds = %56
  %119 = icmp slt i32 %44, 3
  br i1 %119, label %120, label %158

; <label>:120:                                    ; preds = %118
  %121 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i64 0, i64 0), i32 %44) #6
  br label %178

; <label>:122:                                    ; preds = %56
  %123 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %1, i32 332, i16* nonnull %12) #6
  %124 = load i16, i16* %12, align 2
  %125 = icmp eq i16 %124, 1
  br i1 %125, label %129, label %126

; <label>:126:                                    ; preds = %122
  %127 = zext i16 %124 to i32
  %128 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i64 0, i64 0), i32 %127) #6
  br label %178

; <label>:129:                                    ; preds = %122
  %130 = load i16, i16* %29, align 2
  %131 = icmp eq i16 %130, 4
  br i1 %131, label %158, label %132

; <label>:132:                                    ; preds = %129
  %133 = zext i16 %130 to i32
  %134 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %133) #6
  br label %178

; <label>:135:                                    ; preds = %56
  %136 = load i16, i16* %8, align 2
  %137 = icmp eq i16 %136, -30860
  br i1 %137, label %140, label %138

; <label>:138:                                    ; preds = %135
  %139 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i64 0, i64 0), i32 34676) #6
  br label %178

; <label>:140:                                    ; preds = %135
  %141 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 65560, i32 3) #6
  store i16 1, i16* %47, align 2
  store i16 8, i16* %21, align 4
  br label %158

; <label>:142:                                    ; preds = %56
  %143 = load i16, i16* %8, align 2
  %144 = and i16 %143, -2
  %switch10 = icmp eq i16 %144, -30860
  br i1 %switch10, label %147, label %145

; <label>:145:                                    ; preds = %142
  %146 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i64 0, i64 0), i32 34676, i32 34677) #6
  br label %178

; <label>:147:                                    ; preds = %142
  %148 = load i16, i16* %7, align 2
  %149 = icmp eq i16 %148, 1
  br i1 %149, label %153, label %150

; <label>:150:                                    ; preds = %147
  %151 = zext i16 %148 to i32
  %152 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i32 %151) #6
  br label %178

; <label>:153:                                    ; preds = %147
  %154 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 65560, i32 3) #6
  store i16 2, i16* %47, align 2
  store i16 8, i16* %21, align 4
  br label %158

; <label>:155:                                    ; preds = %56
  %156 = zext i16 %57 to i32
  %157 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @photoTag, i64 0, i64 0), i32 %156) #6
  br label %178

; <label>:158:                                    ; preds = %.thread8, %129, %118, %113, %116, %96, %99, %153, %140
  %159 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %160 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 4
  %161 = bitcast i8** %159 to i8*
  call void @llvm.memset.p0i8.i64(i8* %161, i8 0, i64 32, i32 8, i1 false)
  %162 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %1, i32 256, i32* %160) #6
  %163 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 5
  %164 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %1, i32 257, i32* %163) #6
  %165 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 8
  %166 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %1, i32 274, i16* %165) #6
  %167 = load i16, i16* %7, align 2
  %phitmp = icmp slt i32 %44, 2
  %not. = icmp ne i16 %167, 2
  %phitmp. = or i1 %phitmp, %not.
  %168 = zext i1 %phitmp. to i32
  %169 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 2
  store i32 %168, i32* %169, align 4
  %170 = call i32 @TIFFIsTiled(%struct.tiff* %1) #6
  %171 = icmp ne i32 %170, 0
  br i1 %phitmp., label %172, label %175

; <label>:172:                                    ; preds = %158
  %173 = select i1 %171, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtTileContig, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtStripContig
  %174 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 13
  store i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* %173, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)** %174, align 8
  call fastcc void @pickTileContigCase(%struct._TIFFRGBAImage* nonnull %0)
  br label %178

; <label>:175:                                    ; preds = %158
  %176 = select i1 %171, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtTileSeparate, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* @gtStripSeparate
  %177 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 13
  store i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* %176, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)** %177, align 8
  call fastcc void @pickTileSeparateCase(%struct._TIFFRGBAImage* nonnull %0)
  br label %178

; <label>:178:                                    ; preds = %172, %175, %155, %150, %145, %138, %132, %126, %120, %110, %102, %83, %61, %54, %24
  %.0 = phi i32 [ 0, %24 ], [ 0, %155 ], [ 0, %145 ], [ 0, %150 ], [ 0, %138 ], [ 0, %126 ], [ 0, %132 ], [ 0, %120 ], [ 0, %110 ], [ 0, %102 ], [ 0, %83 ], [ 0, %61 ], [ 0, %54 ], [ 1, %175 ], [ 1, %172 ]
  ret i32 %.0
}

declare i32 @TIFFGetFieldDefaulted(%struct.tiff*, i32, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @isCCITTCompression(%struct.tiff*) unnamed_addr #0 {
  %2 = alloca i16, align 2
  %3 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 259, i16* nonnull %2) #6
  %4 = load i16, i16* %2, align 2
  %5 = icmp eq i16 %4, -32765
  %.off = add i16 %4, -2
  %switch = icmp ult i16 %.off, 3
  %. = or i1 %5, %switch
  %6 = zext i1 %. to i32
  ret i32 %6
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

declare i8* @TIFFFileName(%struct.tiff*) local_unnamed_addr #2

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #2

declare i32 @TIFFIsTiled(%struct.tiff*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @gtTileContig(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %8 = load %struct.tiff*, %struct.tiff** %7, align 8
  %9 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 14
  %10 = bitcast %union.anon* %9 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)**
  %11 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %10, align 8
  %12 = tail call i32 @TIFFTileSize(%struct.tiff* %8) #6
  %13 = tail call i8* @_TIFFmalloc(i32 %12) #6
  %14 = icmp eq i8* %13, null
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %4
  %16 = tail call i8* @TIFFFileName(%struct.tiff* %8) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %16, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.24, i64 0, i64 0)) #6
  br label %80

; <label>:17:                                     ; preds = %4
  %18 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %8, i32 322, i32* nonnull %5) #6
  %19 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %8, i32 323, i32* nonnull %6) #6
  %20 = call fastcc i32 @setorientation(%struct._TIFFRGBAImage* nonnull %0, i32 %3)
  %21 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 8
  %22 = load i16, i16* %21, align 8
  %23 = icmp eq i16 %22, 1
  %24 = load i32, i32* %5, align 4
  %25 = sub i32 0, %2
  %.p = select i1 %23, i32 %2, i32 %25
  %26 = add i32 %.p, %24
  %27 = sub nsw i32 0, %26
  %28 = icmp eq i32 %3, 0
  br i1 %28, label %._crit_edge10, label %.lr.ph9

.lr.ph9:                                          ; preds = %17
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %30 = icmp eq i32 %2, 0
  %31 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 20
  %32 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 19
  br i1 %30, label %.lr.ph9.split.preheader, label %.lr.ph9.split.us.preheader

.lr.ph9.split.us.preheader:                       ; preds = %.lr.ph9
  br label %.lr.ph9.split.us

.lr.ph9.split.preheader:                          ; preds = %.lr.ph9
  %33 = load i32, i32* %6, align 4
  br label %.lr.ph9.split

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %._crit_edge.us
  %.017.us = phi i32 [ %57, %._crit_edge.us ], [ %20, %.lr.ph9.split.us.preheader ]
  %.026.us = phi i32 [ %59, %._crit_edge.us ], [ 0, %.lr.ph9.split.us.preheader ]
  %34 = load i32, i32* %6, align 4
  %35 = add i32 %34, %.026.us
  %36 = icmp ugt i32 %35, %3
  %37 = sub i32 %3, %.026.us
  %38 = select i1 %36, i32 %37, i32 %34
  %39 = mul i32 %.017.us, %2
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32* %1, i64 %40
  %42 = mul i32 %.017.us, %2
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32* %1, i64 %43
  br label %45

; <label>:45:                                     ; preds = %.lr.ph9.split.us, %74
  %.034.us = phi i32 [ 0, %.lr.ph9.split.us ], [ %76, %74 ]
  %46 = load i32, i32* %31, align 4
  %47 = add i32 %46, %.034.us
  %48 = load i32, i32* %32, align 8
  %49 = add i32 %48, %.026.us
  %50 = call i32 @TIFFReadTile(%struct.tiff* %8, i8* nonnull %13, i32 %47, i32 %49, i32 0, i16 zeroext 0) #6
  %51 = icmp slt i32 %50, 0
  br i1 %51, label %52, label %61

; <label>:52:                                     ; preds = %45
  %53 = load i32, i32* %29, align 8
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %61, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %74, %52
  %55 = sub nsw i32 0, %38
  %56 = select i1 %23, i32 %55, i32 %38
  %57 = add i32 %56, %.017.us
  %58 = load i32, i32* %6, align 4
  %59 = add i32 %58, %.026.us
  %60 = icmp ult i32 %59, %3
  br i1 %60, label %.lr.ph9.split.us, label %._crit_edge10.loopexit14

; <label>:61:                                     ; preds = %52, %45
  %62 = load i32, i32* %5, align 4
  %63 = add i32 %62, %.034.us
  %64 = icmp ugt i32 %63, %2
  br i1 %64, label %68, label %65

; <label>:65:                                     ; preds = %61
  %66 = zext i32 %.034.us to i64
  %67 = getelementptr inbounds i32, i32* %44, i64 %66
  call void %11(%struct._TIFFRGBAImage* nonnull %0, i32* %67, i32 %.034.us, i32 %.017.us, i32 %62, i32 %38, i32 0, i32 %27, i8* nonnull %13) #6
  br label %74

; <label>:68:                                     ; preds = %61
  %69 = sub i32 %2, %.034.us
  %70 = sub i32 %62, %69
  %71 = zext i32 %.034.us to i64
  %72 = getelementptr inbounds i32, i32* %41, i64 %71
  %73 = sub i32 %70, %26
  call void %11(%struct._TIFFRGBAImage* nonnull %0, i32* %72, i32 %.034.us, i32 %.017.us, i32 %69, i32 %38, i32 %70, i32 %73, i8* nonnull %13) #6
  br label %74

; <label>:74:                                     ; preds = %68, %65
  %75 = load i32, i32* %5, align 4
  %76 = add i32 %75, %.034.us
  %77 = icmp ult i32 %76, %2
  br i1 %77, label %45, label %._crit_edge.us

.lr.ph9.split:                                    ; preds = %.lr.ph9.split.preheader, %.lr.ph9.split
  %.026 = phi i32 [ %78, %.lr.ph9.split ], [ 0, %.lr.ph9.split.preheader ]
  %78 = add i32 %33, %.026
  %79 = icmp ult i32 %78, %3
  br i1 %79, label %.lr.ph9.split, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %.lr.ph9.split
  br label %._crit_edge10

._crit_edge10.loopexit14:                         ; preds = %._crit_edge.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit14, %._crit_edge10.loopexit, %17
  call void @_TIFFfree(i8* nonnull %13) #6
  br label %80

; <label>:80:                                     ; preds = %._crit_edge10, %15
  %.0 = phi i32 [ 0, %15 ], [ 1, %._crit_edge10 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @gtStripContig(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %7 = load %struct.tiff*, %struct.tiff** %6, align 8
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 14
  %9 = bitcast %union.anon* %8 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)**
  %10 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %9, align 8
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 4
  %12 = load i32, i32* %11, align 4
  %13 = tail call i32 @TIFFStripSize(%struct.tiff* %7) #6
  %14 = tail call i8* @_TIFFmalloc(i32 %13) #6
  %15 = icmp eq i8* %14, null
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %4
  %17 = tail call i8* @TIFFFileName(%struct.tiff* %7) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %17, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.27, i64 0, i64 0)) #6
  br label %77

; <label>:18:                                     ; preds = %4
  %19 = tail call fastcc i32 @setorientation(%struct._TIFFRGBAImage* nonnull %0, i32 %3)
  %20 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 8
  %21 = load i16, i16* %20, align 8
  %22 = icmp eq i16 %21, 1
  %23 = shl i32 %2, 1
  %.op = sub i32 0, %23
  %24 = select i1 %22, i32 %.op, i32 0
  %25 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %7, i32 278, i32* nonnull %5) #6
  %26 = call i32 @TIFFScanlineSize(%struct.tiff* %7) #6
  %27 = icmp ugt i32 %12, %2
  %28 = sub i32 %12, %2
  %29 = select i1 %27, i32 %28, i32 0
  %30 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %31 = icmp eq i32 %3, 0
  br i1 %31, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %18
  %32 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 19
  br i1 %22, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %47
  %.014.us = phi i32 [ %51, %47 ], [ %19, %.lr.ph.split.us.preheader ]
  %.023.us = phi i32 [ %53, %47 ], [ 0, %.lr.ph.split.us.preheader ]
  %33 = load i32, i32* %5, align 4
  %34 = add i32 %33, %.023.us
  %35 = icmp ugt i32 %34, %3
  %36 = sub i32 %3, %.023.us
  %37 = select i1 %35, i32 %36, i32 %33
  %38 = load i32, i32* %32, align 8
  %39 = add i32 %38, %.023.us
  %40 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %39, i16 zeroext 0) #6
  %41 = mul i32 %37, %26
  %42 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %40, i8* nonnull %14, i32 %41) #6
  %43 = icmp slt i32 %42, 0
  br i1 %43, label %44, label %47

; <label>:44:                                     ; preds = %.lr.ph.split.us
  %45 = load i32, i32* %30, align 8
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %._crit_edge.loopexit

; <label>:47:                                     ; preds = %44, %.lr.ph.split.us
  %48 = mul i32 %.014.us, %2
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32* %1, i64 %49
  call void %10(%struct._TIFFRGBAImage* nonnull %0, i32* %50, i32 0, i32 %.014.us, i32 %2, i32 %37, i32 %29, i32 %24, i8* nonnull %14) #6
  %51 = sub i32 %.014.us, %37
  %52 = load i32, i32* %5, align 4
  %53 = add i32 %52, %.023.us
  %54 = icmp ult i32 %53, %3
  br i1 %54, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %69
  %.014 = phi i32 [ %73, %69 ], [ %19, %.lr.ph.split.preheader ]
  %.023 = phi i32 [ %75, %69 ], [ 0, %.lr.ph.split.preheader ]
  %55 = load i32, i32* %5, align 4
  %56 = add i32 %55, %.023
  %57 = icmp ugt i32 %56, %3
  %58 = sub i32 %3, %.023
  %59 = select i1 %57, i32 %58, i32 %55
  %60 = load i32, i32* %32, align 8
  %61 = add i32 %60, %.023
  %62 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %61, i16 zeroext 0) #6
  %63 = mul i32 %59, %26
  %64 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %62, i8* nonnull %14, i32 %63) #6
  %65 = icmp slt i32 %64, 0
  br i1 %65, label %66, label %69

; <label>:66:                                     ; preds = %.lr.ph.split
  %67 = load i32, i32* %30, align 8
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %._crit_edge.loopexit9

; <label>:69:                                     ; preds = %66, %.lr.ph.split
  %70 = mul i32 %.014, %2
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32* %1, i64 %71
  call void %10(%struct._TIFFRGBAImage* nonnull %0, i32* %72, i32 0, i32 %.014, i32 %2, i32 %59, i32 %29, i32 %24, i8* nonnull %14) #6
  %73 = add i32 %59, %.014
  %74 = load i32, i32* %5, align 4
  %75 = add i32 %74, %.023
  %76 = icmp ult i32 %75, %3
  br i1 %76, label %.lr.ph.split, label %._crit_edge.loopexit9

._crit_edge.loopexit:                             ; preds = %44, %47
  br label %._crit_edge

._crit_edge.loopexit9:                            ; preds = %66, %69
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit9, %._crit_edge.loopexit, %18
  call void @_TIFFfree(i8* nonnull %14) #6
  br label %77

; <label>:77:                                     ; preds = %._crit_edge, %16
  %.0 = phi i32 [ 0, %16 ], [ 1, %._crit_edge ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @pickTileContigCase(%struct._TIFFRGBAImage* nocapture) unnamed_addr #0 {
  %2 = tail call fastcc i32 @buildMap(%struct._TIFFRGBAImage* %0)
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %52, label %4

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 9
  %6 = load i16, i16* %5, align 2
  switch i16 %6, label %52 [
    i16 2, label %7
    i16 5, label %28
    i16 3, label %36
    i16 0, label %41
    i16 1, label %41
    i16 6, label %46
  ]

; <label>:7:                                      ; preds = %4
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %9 = load i16, i16* %8, align 4
  switch i16 %9, label %52 [
    i16 8, label %10
    i16 16, label %19
  ]

; <label>:10:                                     ; preds = %7
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %12 = load i8*, i8** %11, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %52

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 3
  %16 = load i32, i32* %15, align 8
  %17 = icmp eq i32 %16, 1
  %18 = icmp eq i32 %16, 2
  %putRGBUAcontig8bittile.putRGBcontig8bittile = select i1 %18, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBUAcontig8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bittile
  %putRGBAAcontig8bittile.putRGBUAcontig8bittile.putRGBcontig8bittile = select i1 %17, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBAAcontig8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %putRGBUAcontig8bittile.putRGBcontig8bittile
  br label %52

; <label>:19:                                     ; preds = %7
  %20 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %21 = load i8*, i8** %20, align 8
  %22 = icmp eq i8* %21, null
  br i1 %22, label %23, label %52

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 3
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 1
  %27 = icmp eq i32 %25, 2
  %putRGBUAcontig16bittile.putRGBcontig16bittile = select i1 %27, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBUAcontig16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig16bittile
  %putRGBAAcontig16bittile.putRGBUAcontig16bittile.putRGBcontig16bittile = select i1 %26, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBAAcontig16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %putRGBUAcontig16bittile.putRGBcontig16bittile
  br label %52

; <label>:28:                                     ; preds = %4
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %30 = load i16, i16* %29, align 4
  %31 = icmp eq i16 %30, 8
  br i1 %31, label %32, label %52

; <label>:32:                                     ; preds = %28
  %33 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %34 = load i8*, i8** %33, align 8
  %35 = icmp eq i8* %34, null
  %putRGBcontig8bitCMYKtile.putRGBcontig8bitCMYKMaptile = select i1 %35, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bitCMYKtile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @putRGBcontig8bitCMYKMaptile
  br label %52

; <label>:36:                                     ; preds = %4
  %37 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %38 = load i16, i16* %37, align 4
  %switch.tableidx = add i16 %38, -1
  %39 = icmp ult i16 %switch.tableidx, 8
  br i1 %39, label %switch.lookup, label %52

switch.lookup:                                    ; preds = %36
  %40 = sext i16 %switch.tableidx to i64
  %switch.gep = getelementptr inbounds [8 x void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*], [8 x void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*]* @switch.table, i64 0, i64 %40
  %switch.load = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %switch.gep, align 8
  br label %52

; <label>:41:                                     ; preds = %4, %4
  %42 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %43 = load i16, i16* %42, align 4
  %switch.tableidx2 = add i16 %43, -1
  %44 = icmp ult i16 %switch.tableidx2, 8
  br i1 %44, label %switch.lookup1, label %52

switch.lookup1:                                   ; preds = %41
  %45 = sext i16 %switch.tableidx2 to i64
  %switch.gep3 = getelementptr inbounds [8 x void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*], [8 x void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*]* @switch.table.1, i64 0, i64 %45
  %switch.load4 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %switch.gep3, align 8
  br label %52

; <label>:46:                                     ; preds = %4
  %47 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %48 = load i16, i16* %47, align 4
  %49 = icmp eq i16 %48, 8
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %46
  %51 = tail call fastcc void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @initYCbCrConversion(%struct._TIFFRGBAImage* nonnull %0)
  br label %52

; <label>:52:                                     ; preds = %23, %14, %4, %19, %10, %7, %32, %28, %switch.lookup, %36, %switch.lookup1, %41, %50, %46, %1
  %.13 = phi void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* [ null, %1 ], [ null, %4 ], [ null, %7 ], [ @putRGBcontig8bitMaptile, %10 ], [ @putRGBcontig16bittile, %19 ], [ %putRGBcontig8bitCMYKtile.putRGBcontig8bitCMYKMaptile, %32 ], [ null, %28 ], [ null, %36 ], [ %switch.load, %switch.lookup ], [ null, %41 ], [ %switch.load4, %switch.lookup1 ], [ %51, %50 ], [ null, %46 ], [ %putRGBAAcontig8bittile.putRGBUAcontig8bittile.putRGBcontig8bittile, %14 ], [ %putRGBAAcontig16bittile.putRGBUAcontig16bittile.putRGBcontig16bittile, %23 ]
  %53 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 14
  %54 = bitcast %union.anon* %53 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)**
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %.13, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)** %54, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @gtTileSeparate(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %8 = load %struct.tiff*, %struct.tiff** %7, align 8
  %9 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 14
  %10 = bitcast %union.anon* %9 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)**
  %11 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %10, align 8
  %12 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = tail call i32 @TIFFTileSize(%struct.tiff* %8) #6
  %15 = shl nsw i32 %14, 2
  %16 = tail call i8* @_TIFFmalloc(i32 %15) #6
  %17 = icmp eq i8* %16, null
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %4
  %19 = tail call i8* @TIFFFileName(%struct.tiff* %8) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %19, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.24, i64 0, i64 0)) #6
  br label %122

; <label>:20:                                     ; preds = %4
  %21 = sext i32 %14 to i64
  %22 = getelementptr inbounds i8, i8* %16, i64 %21
  %23 = getelementptr inbounds i8, i8* %22, i64 %21
  %24 = getelementptr inbounds i8, i8* %23, i64 %21
  %25 = icmp eq i32 %13, 0
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %20
  tail call void @llvm.memset.p0i8.i64(i8* %24, i8 -1, i64 %21, i32 1, i1 false)
  br label %27

; <label>:27:                                     ; preds = %20, %26
  %28 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %8, i32 322, i32* nonnull %5) #6
  %29 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %8, i32 323, i32* nonnull %6) #6
  %30 = call fastcc i32 @setorientation(%struct._TIFFRGBAImage* nonnull %0, i32 %3)
  %31 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 8
  %32 = load i16, i16* %31, align 8
  %33 = icmp eq i16 %32, 1
  %34 = load i32, i32* %5, align 4
  %35 = sub i32 0, %2
  %.p = select i1 %33, i32 %2, i32 %35
  %36 = add i32 %.p, %34
  %37 = sub nsw i32 0, %36
  %38 = icmp eq i32 %3, 0
  br i1 %38, label %._crit_edge13, label %.lr.ph12

.lr.ph12:                                         ; preds = %27
  %39 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %40 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %41 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %42 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %43 = icmp eq i32 %2, 0
  %44 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 20
  %45 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 19
  br label %46

; <label>:46:                                     ; preds = %.lr.ph12, %._crit_edge
  %.0110 = phi i32 [ %30, %.lr.ph12 ], [ %118, %._crit_edge ]
  %.029 = phi i32 [ 0, %.lr.ph12 ], [ %120, %._crit_edge ]
  %47 = load i32, i32* %6, align 4
  %48 = add i32 %47, %.029
  %49 = icmp ugt i32 %48, %3
  %50 = sub i32 %3, %.029
  %51 = select i1 %49, i32 %50, i32 %47
  br i1 %43, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %46
  %52 = mul i32 %.0110, %2
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32* %1, i64 %53
  %55 = mul i32 %.0110, %2
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %1, i64 %56
  br label %58

; <label>:58:                                     ; preds = %.lr.ph, %112
  %.034 = phi i32 [ 0, %.lr.ph ], [ %114, %112 ]
  %59 = load i32, i32* %44, align 4
  %60 = add i32 %59, %.034
  %61 = load i32, i32* %45, align 8
  %62 = add i32 %61, %.029
  %63 = call i32 @TIFFReadTile(%struct.tiff* %8, i8* nonnull %16, i32 %60, i32 %62, i32 0, i16 zeroext 0) #6
  %64 = icmp slt i32 %63, 0
  br i1 %64, label %65, label %68

; <label>:65:                                     ; preds = %58
  %66 = load i32, i32* %39, align 8
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %._crit_edge.loopexit

; <label>:68:                                     ; preds = %65, %58
  %69 = load i32, i32* %44, align 4
  %70 = add i32 %69, %.034
  %71 = load i32, i32* %45, align 8
  %72 = add i32 %71, %.029
  %73 = call i32 @TIFFReadTile(%struct.tiff* %8, i8* %22, i32 %70, i32 %72, i32 0, i16 zeroext 1) #6
  %74 = icmp slt i32 %73, 0
  br i1 %74, label %75, label %78

; <label>:75:                                     ; preds = %68
  %76 = load i32, i32* %40, align 8
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %._crit_edge.loopexit

; <label>:78:                                     ; preds = %75, %68
  %79 = load i32, i32* %44, align 4
  %80 = add i32 %79, %.034
  %81 = load i32, i32* %45, align 8
  %82 = add i32 %81, %.029
  %83 = call i32 @TIFFReadTile(%struct.tiff* %8, i8* %23, i32 %80, i32 %82, i32 0, i16 zeroext 2) #6
  %84 = icmp slt i32 %83, 0
  br i1 %84, label %85, label %88

; <label>:85:                                     ; preds = %78
  %86 = load i32, i32* %41, align 8
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %._crit_edge.loopexit

; <label>:88:                                     ; preds = %85, %78
  br i1 %25, label %99, label %89

; <label>:89:                                     ; preds = %88
  %90 = load i32, i32* %44, align 4
  %91 = add i32 %90, %.034
  %92 = load i32, i32* %45, align 8
  %93 = add i32 %92, %.029
  %94 = call i32 @TIFFReadTile(%struct.tiff* %8, i8* %24, i32 %91, i32 %93, i32 0, i16 zeroext 3) #6
  %95 = icmp slt i32 %94, 0
  br i1 %95, label %96, label %99

; <label>:96:                                     ; preds = %89
  %97 = load i32, i32* %42, align 8
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %._crit_edge.loopexit

; <label>:99:                                     ; preds = %96, %88, %89
  %100 = load i32, i32* %5, align 4
  %101 = add i32 %100, %.034
  %102 = icmp ugt i32 %101, %2
  br i1 %102, label %103, label %109

; <label>:103:                                    ; preds = %99
  %104 = sub i32 %2, %.034
  %105 = sub i32 %100, %104
  %106 = zext i32 %.034 to i64
  %107 = getelementptr inbounds i32, i32* %54, i64 %106
  %108 = sub i32 %105, %36
  call void %11(%struct._TIFFRGBAImage* nonnull %0, i32* %107, i32 %.034, i32 %.0110, i32 %104, i32 %51, i32 %105, i32 %108, i8* nonnull %16, i8* %22, i8* %23, i8* %24) #6
  br label %112

; <label>:109:                                    ; preds = %99
  %110 = zext i32 %.034 to i64
  %111 = getelementptr inbounds i32, i32* %57, i64 %110
  call void %11(%struct._TIFFRGBAImage* nonnull %0, i32* %111, i32 %.034, i32 %.0110, i32 %100, i32 %51, i32 0, i32 %37, i8* nonnull %16, i8* %22, i8* %23, i8* %24) #6
  br label %112

; <label>:112:                                    ; preds = %103, %109
  %113 = load i32, i32* %5, align 4
  %114 = add i32 %113, %.034
  %115 = icmp ult i32 %114, %2
  br i1 %115, label %58, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %96, %85, %75, %65, %112
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %46
  %116 = sub nsw i32 0, %51
  %117 = select i1 %33, i32 %116, i32 %51
  %118 = add i32 %117, %.0110
  %119 = load i32, i32* %6, align 4
  %120 = add i32 %119, %.029
  %121 = icmp ult i32 %120, %3
  br i1 %121, label %46, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %27
  call void @_TIFFfree(i8* nonnull %16) #6
  br label %122

; <label>:122:                                    ; preds = %._crit_edge13, %18
  %.0 = phi i32 [ 0, %18 ], [ 1, %._crit_edge13 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @gtStripSeparate(%struct._TIFFRGBAImage*, i32*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %7 = load %struct.tiff*, %struct.tiff** %6, align 8
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 14
  %9 = bitcast %union.anon* %8 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)**
  %10 = load void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)*, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %9, align 8
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 4
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = tail call i32 @TIFFStripSize(%struct.tiff* %7) #6
  %16 = shl nsw i32 %15, 2
  %17 = tail call i8* @_TIFFmalloc(i32 %16) #6
  %18 = icmp eq i8* %17, null
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %4
  %20 = tail call i8* @TIFFFileName(%struct.tiff* %7) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %20, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.24, i64 0, i64 0)) #6
  br label %129

; <label>:21:                                     ; preds = %4
  %22 = sext i32 %15 to i64
  %23 = getelementptr inbounds i8, i8* %17, i64 %22
  %24 = getelementptr inbounds i8, i8* %23, i64 %22
  %25 = getelementptr inbounds i8, i8* %24, i64 %22
  %26 = icmp eq i32 %14, 0
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %21
  tail call void @llvm.memset.p0i8.i64(i8* %25, i8 -1, i64 %22, i32 1, i1 false)
  br label %28

; <label>:28:                                     ; preds = %21, %27
  %29 = tail call fastcc i32 @setorientation(%struct._TIFFRGBAImage* nonnull %0, i32 %3)
  %30 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 8
  %31 = load i16, i16* %30, align 8
  %32 = icmp eq i16 %31, 1
  %33 = shl i32 %2, 1
  %.op = sub i32 0, %33
  %34 = select i1 %32, i32 %.op, i32 0
  %35 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %7, i32 278, i32* nonnull %5) #6
  %36 = call i32 @TIFFScanlineSize(%struct.tiff* %7) #6
  %37 = icmp ugt i32 %12, %2
  %38 = sub i32 %12, %2
  %39 = select i1 %37, i32 %38, i32 0
  %40 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %41 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %42 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %43 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 1
  %44 = icmp eq i32 %3, 0
  br i1 %44, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %28
  %45 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 19
  br i1 %26, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %74
  %.014.us = phi i32 [ %80, %74 ], [ %29, %.lr.ph.split.us.preheader ]
  %.023.us = phi i32 [ %82, %74 ], [ 0, %.lr.ph.split.us.preheader ]
  %46 = load i32, i32* %5, align 4
  %47 = add i32 %46, %.023.us
  %48 = icmp ugt i32 %47, %3
  %49 = sub i32 %3, %.023.us
  %50 = select i1 %48, i32 %49, i32 %46
  %51 = load i32, i32* %45, align 8
  %52 = add i32 %51, %.023.us
  %53 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %52, i16 zeroext 0) #6
  %54 = mul i32 %50, %36
  %55 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %53, i8* nonnull %17, i32 %54) #6
  %56 = icmp slt i32 %55, 0
  br i1 %56, label %57, label %60

; <label>:57:                                     ; preds = %.lr.ph.split.us
  %58 = load i32, i32* %40, align 8
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %._crit_edge.loopexit

; <label>:60:                                     ; preds = %57, %.lr.ph.split.us
  %61 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %52, i16 zeroext 1) #6
  %62 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %61, i8* %23, i32 %54) #6
  %63 = icmp slt i32 %62, 0
  br i1 %63, label %64, label %67

; <label>:64:                                     ; preds = %60
  %65 = load i32, i32* %41, align 8
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %._crit_edge.loopexit

; <label>:67:                                     ; preds = %64, %60
  %68 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %52, i16 zeroext 2) #6
  %69 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %68, i8* %24, i32 %54) #6
  %70 = icmp slt i32 %69, 0
  br i1 %70, label %71, label %74

; <label>:71:                                     ; preds = %67
  %72 = load i32, i32* %42, align 8
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %._crit_edge.loopexit

; <label>:74:                                     ; preds = %67, %71
  %75 = mul i32 %.014.us, %2
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32* %1, i64 %76
  call void %10(%struct._TIFFRGBAImage* nonnull %0, i32* %77, i32 0, i32 %.014.us, i32 %2, i32 %50, i32 %39, i32 %34, i8* nonnull %17, i8* %23, i8* %24, i8* %25) #6
  %78 = sub nsw i32 0, %50
  %79 = select i1 %32, i32 %78, i32 %50
  %80 = add i32 %79, %.014.us
  %81 = load i32, i32* %5, align 4
  %82 = add i32 %81, %.023.us
  %83 = icmp ult i32 %82, %3
  br i1 %83, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %119
  %.014 = phi i32 [ %125, %119 ], [ %29, %.lr.ph.split.preheader ]
  %.023 = phi i32 [ %127, %119 ], [ 0, %.lr.ph.split.preheader ]
  %84 = load i32, i32* %5, align 4
  %85 = add i32 %84, %.023
  %86 = icmp ugt i32 %85, %3
  %87 = sub i32 %3, %.023
  %88 = select i1 %86, i32 %87, i32 %84
  %89 = load i32, i32* %45, align 8
  %90 = add i32 %89, %.023
  %91 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %90, i16 zeroext 0) #6
  %92 = mul i32 %88, %36
  %93 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %91, i8* nonnull %17, i32 %92) #6
  %94 = icmp slt i32 %93, 0
  br i1 %94, label %95, label %98

; <label>:95:                                     ; preds = %.lr.ph.split
  %96 = load i32, i32* %40, align 8
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %._crit_edge.loopexit12

; <label>:98:                                     ; preds = %95, %.lr.ph.split
  %99 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %90, i16 zeroext 1) #6
  %100 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %99, i8* %23, i32 %92) #6
  %101 = icmp slt i32 %100, 0
  br i1 %101, label %102, label %105

; <label>:102:                                    ; preds = %98
  %103 = load i32, i32* %41, align 8
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %._crit_edge.loopexit12

; <label>:105:                                    ; preds = %102, %98
  %106 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %90, i16 zeroext 2) #6
  %107 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %106, i8* %24, i32 %92) #6
  %108 = icmp slt i32 %107, 0
  br i1 %108, label %109, label %112

; <label>:109:                                    ; preds = %105
  %110 = load i32, i32* %42, align 8
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %112, label %._crit_edge.loopexit12

; <label>:112:                                    ; preds = %105, %109
  %113 = call i32 @TIFFComputeStrip(%struct.tiff* %7, i32 %90, i16 zeroext 3) #6
  %114 = call i32 @TIFFReadEncodedStrip(%struct.tiff* %7, i32 %113, i8* %25, i32 %92) #6
  %115 = icmp slt i32 %114, 0
  br i1 %115, label %116, label %119

; <label>:116:                                    ; preds = %112
  %117 = load i32, i32* %43, align 8
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %._crit_edge.loopexit12

; <label>:119:                                    ; preds = %116, %112
  %120 = mul i32 %.014, %2
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32* %1, i64 %121
  call void %10(%struct._TIFFRGBAImage* nonnull %0, i32* %122, i32 0, i32 %.014, i32 %2, i32 %88, i32 %39, i32 %34, i8* nonnull %17, i8* %23, i8* %24, i8* %25) #6
  %123 = sub nsw i32 0, %88
  %124 = select i1 %32, i32 %123, i32 %88
  %125 = add i32 %124, %.014
  %126 = load i32, i32* %5, align 4
  %127 = add i32 %126, %.023
  %128 = icmp ult i32 %127, %3
  br i1 %128, label %.lr.ph.split, label %._crit_edge.loopexit12

._crit_edge.loopexit:                             ; preds = %71, %64, %57, %74
  br label %._crit_edge

._crit_edge.loopexit12:                           ; preds = %116, %109, %102, %95, %119
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit12, %._crit_edge.loopexit, %28
  call void @_TIFFfree(i8* nonnull %17) #6
  br label %129

; <label>:129:                                    ; preds = %._crit_edge, %19
  %.0 = phi i32 [ 0, %19 ], [ 1, %._crit_edge ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @pickTileSeparateCase(%struct._TIFFRGBAImage* nocapture) unnamed_addr #0 {
  %2 = tail call fastcc i32 @buildMap(%struct._TIFFRGBAImage* %0)
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %28, label %4

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 9
  %6 = load i16, i16* %5, align 2
  %cond = icmp eq i16 %6, 2
  br i1 %cond, label %7, label %28

; <label>:7:                                      ; preds = %4
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %9 = load i16, i16* %8, align 4
  switch i16 %9, label %28 [
    i16 8, label %10
    i16 16, label %19
  ]

; <label>:10:                                     ; preds = %7
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %12 = load i8*, i8** %11, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 3
  %16 = load i32, i32* %15, align 8
  %17 = icmp eq i32 %16, 1
  %18 = icmp eq i32 %16, 2
  %putRGBUAseparate8bittile.putRGBseparate8bittile = select i1 %18, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBUAseparate8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBseparate8bittile
  %putRGBAAseparate8bittile.putRGBUAseparate8bittile.putRGBseparate8bittile = select i1 %17, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBAAseparate8bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %putRGBUAseparate8bittile.putRGBseparate8bittile
  br label %28

; <label>:19:                                     ; preds = %7
  %20 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %21 = load i8*, i8** %20, align 8
  %22 = icmp eq i8* %21, null
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 3
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 1
  %27 = icmp eq i32 %25, 2
  %putRGBUAseparate16bittile.putRGBseparate16bittile = select i1 %27, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBUAseparate16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBseparate16bittile
  %putRGBAAseparate16bittile.putRGBUAseparate16bittile.putRGBseparate16bittile = select i1 %26, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* @putRGBAAseparate16bittile, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %putRGBUAseparate16bittile.putRGBseparate16bittile
  br label %28

; <label>:28:                                     ; preds = %23, %14, %4, %19, %10, %7, %1
  %.8 = phi void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* [ null, %1 ], [ null, %4 ], [ null, %7 ], [ @putRGBseparate8bitMaptile, %10 ], [ @putRGBseparate16bittile, %19 ], [ %putRGBAAseparate8bittile.putRGBUAseparate8bittile.putRGBseparate8bittile, %14 ], [ %putRGBAAseparate16bittile.putRGBUAseparate16bittile.putRGBseparate16bittile, %23 ]
  %29 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 14
  %30 = bitcast %union.anon* %29 to void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)**
  store void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)* %.8, void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*)** %30, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFRGBAImageGet(%struct._TIFFRGBAImage*, i32*, i32, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 13
  %6 = load i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)*, i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)** %5, align 8
  %7 = icmp eq i32 (%struct._TIFFRGBAImage*, i32*, i32, i32)* %6, null
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %10 = load %struct.tiff*, %struct.tiff** %9, align 8
  %11 = tail call i8* @TIFFFileName(%struct.tiff* %10) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %11, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.18, i64 0, i64 0)) #6
  br label %23

; <label>:12:                                     ; preds = %4
  %13 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 14
  %14 = bitcast %union.anon* %13 to void (%struct._TIFFRGBAImage*)**
  %15 = load void (%struct._TIFFRGBAImage*)*, void (%struct._TIFFRGBAImage*)** %14, align 8
  %16 = icmp eq void (%struct._TIFFRGBAImage*)* %15, null
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %12
  %18 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %19 = load %struct.tiff*, %struct.tiff** %18, align 8
  %20 = tail call i8* @TIFFFileName(%struct.tiff* %19) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %20, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.19, i64 0, i64 0)) #6
  br label %23

; <label>:21:                                     ; preds = %12
  %22 = tail call i32 %6(%struct._TIFFRGBAImage* nonnull %0, i32* %1, i32 %2, i32 %3) #6
  br label %23

; <label>:23:                                     ; preds = %21, %17, %8
  %.0 = phi i32 [ 0, %8 ], [ 0, %17 ], [ %22, %21 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRGBAImage(%struct.tiff*, i32, i32, i32*, i32) local_unnamed_addr #0 {
  %6 = alloca [1024 x i8], align 16
  %7 = alloca %struct._TIFFRGBAImage, align 8
  %8 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 0
  %9 = call i32 @TIFFRGBAImageBegin(%struct._TIFFRGBAImage* nonnull %7, %struct.tiff* %0, i32 %4, i8* nonnull %8)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %19, label %11

; <label>:11:                                     ; preds = %5
  %12 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %7, i64 0, i32 5
  %13 = load i32, i32* %12, align 8
  %14 = sub i32 %2, %13
  %15 = mul i32 %14, %1
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %3, i64 %16
  %18 = call i32 @TIFFRGBAImageGet(%struct._TIFFRGBAImage* nonnull %7, i32* %17, i32 %1, i32 %13)
  call void @TIFFRGBAImageEnd(%struct._TIFFRGBAImage* nonnull %7)
  br label %21

; <label>:19:                                     ; preds = %5
  %20 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %20, i8* nonnull %8) #6
  br label %21

; <label>:21:                                     ; preds = %19, %11
  %.0 = phi i32 [ %18, %11 ], [ 0, %19 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRGBAStrip(%struct.tiff*, i32, i32*) local_unnamed_addr #0 {
  %4 = alloca [1024 x i8], align 16
  %5 = alloca %struct._TIFFRGBAImage, align 8
  %6 = alloca i32, align 4
  %7 = tail call i32 @TIFFIsTiled(%struct.tiff* %0) #6
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %11, label %9

; <label>:9:                                      ; preds = %3
  %10 = tail call i8* @TIFFFileName(%struct.tiff* %0) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %10, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.20, i64 0, i64 0)) #6
  br label %36

; <label>:11:                                     ; preds = %3
  %12 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %0, i32 278, i32* nonnull %6) #6
  %13 = load i32, i32* %6, align 4
  %14 = urem i32 %1, %13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %11
  %17 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %17, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.21, i64 0, i64 0)) #6
  br label %36

; <label>:18:                                     ; preds = %11
  %19 = getelementptr inbounds [1024 x i8], [1024 x i8]* %4, i64 0, i64 0
  %20 = call i32 @TIFFRGBAImageBegin(%struct._TIFFRGBAImage* nonnull %5, %struct.tiff* %0, i32 0, i8* nonnull %19)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %34, label %22

; <label>:22:                                     ; preds = %18
  %23 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %5, i64 0, i32 19
  store i32 %1, i32* %23, align 8
  %24 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %5, i64 0, i32 20
  store i32 0, i32* %24, align 4
  %25 = load i32, i32* %6, align 4
  %26 = add i32 %25, %1
  %27 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %5, i64 0, i32 5
  %28 = load i32, i32* %27, align 8
  %29 = icmp ugt i32 %26, %28
  %30 = sub i32 %28, %1
  %.01 = select i1 %29, i32 %30, i32 %25
  %31 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %5, i64 0, i32 4
  %32 = load i32, i32* %31, align 4
  %33 = call i32 @TIFFRGBAImageGet(%struct._TIFFRGBAImage* nonnull %5, i32* %2, i32 %32, i32 %.01)
  call void @TIFFRGBAImageEnd(%struct._TIFFRGBAImage* nonnull %5)
  br label %36

; <label>:34:                                     ; preds = %18
  %35 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %35, i8* nonnull %19) #6
  br label %36

; <label>:36:                                     ; preds = %22, %34, %16, %9
  %.0 = phi i32 [ 0, %9 ], [ 0, %16 ], [ %33, %22 ], [ 0, %34 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFReadRGBATile(%struct.tiff*, i32, i32, i32*) local_unnamed_addr #0 {
  %5 = alloca [1024 x i8], align 16
  %6 = alloca %struct._TIFFRGBAImage, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = tail call i32 @TIFFIsTiled(%struct.tiff* %0) #6
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %4
  %12 = tail call i8* @TIFFFileName(%struct.tiff* %0) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %12, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.22, i64 0, i64 0)) #6
  br label %.loopexit

; <label>:13:                                     ; preds = %4
  %14 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %0, i32 322, i32* nonnull %7) #6
  %15 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %0, i32 323, i32* nonnull %8) #6
  %16 = load i32, i32* %7, align 4
  %17 = urem i32 %1, %16
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %13
  %20 = load i32, i32* %8, align 4
  %21 = urem i32 %2, %20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %19, %13
  %24 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %24, i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.23, i64 0, i64 0)) #6
  br label %.loopexit

; <label>:25:                                     ; preds = %19
  %26 = getelementptr inbounds [1024 x i8], [1024 x i8]* %5, i64 0, i64 0
  %27 = call i32 @TIFFRGBAImageBegin(%struct._TIFFRGBAImage* nonnull %6, %struct.tiff* %0, i32 0, i8* nonnull %26)
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %25
  %30 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %30, i8* nonnull %26) #6
  br label %.loopexit

; <label>:31:                                     ; preds = %25
  %32 = load i32, i32* %8, align 4
  %33 = add i32 %32, %2
  %34 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %6, i64 0, i32 5
  %35 = load i32, i32* %34, align 8
  %36 = icmp ugt i32 %33, %35
  %37 = sub i32 %35, %2
  %.02 = select i1 %36, i32 %37, i32 %32
  %38 = load i32, i32* %7, align 4
  %39 = add i32 %38, %1
  %40 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %6, i64 0, i32 4
  %41 = load i32, i32* %40, align 4
  %42 = icmp ugt i32 %39, %41
  %43 = sub i32 %41, %1
  %.03 = select i1 %42, i32 %43, i32 %38
  %44 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %6, i64 0, i32 19
  store i32 %2, i32* %44, align 8
  %45 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %6, i64 0, i32 20
  store i32 %1, i32* %45, align 4
  %46 = call i32 @TIFFRGBAImageGet(%struct._TIFFRGBAImage* nonnull %6, i32* %3, i32 %.03, i32 %.02)
  call void @TIFFRGBAImageEnd(%struct._TIFFRGBAImage* nonnull %6)
  %47 = load i32, i32* %7, align 4
  %48 = icmp eq i32 %.03, %47
  %49 = load i32, i32* %8, align 4
  %50 = icmp eq i32 %.02, %49
  %or.cond = and i1 %48, %50
  br i1 %or.cond, label %.loopexit, label %.preheader5

.preheader5:                                      ; preds = %31
  %51 = icmp eq i32 %.02, 0
  br i1 %51, label %.preheader, label %.lr.ph9

.lr.ph9:                                          ; preds = %.preheader5
  %52 = add i32 %.02, -1
  %53 = shl i32 %.03, 2
  %54 = zext i32 %.03 to i64
  %55 = zext i32 %.02 to i64
  br label %58

.preheader.loopexit:                              ; preds = %58
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader5
  %56 = load i32, i32* %8, align 4
  %57 = icmp ugt i32 %56, %.02
  br i1 %57, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:58:                                     ; preds = %.lr.ph9, %58
  %indvars.iv = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next, %58 ]
  %.01.neg8 = phi i32 [ 0, %.lr.ph9 ], [ %.01.neg, %58 ]
  %.017 = phi i32 [ 0, %.lr.ph9 ], [ %83, %58 ]
  %59 = load i32, i32* %8, align 4
  %60 = add i32 %.01.neg8, -1
  %61 = add i32 %60, %59
  %62 = load i32, i32* %7, align 4
  %63 = mul i32 %61, %62
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32* %3, i64 %64
  %66 = bitcast i32* %65 to i8*
  %67 = add i32 %52, %.01.neg8
  %68 = mul i32 %67, %.03
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32* %3, i64 %69
  %71 = bitcast i32* %70 to i8*
  call void @_TIFFmemcpy(i8* %66, i8* %71, i32 %53) #6
  %72 = load i32, i32* %8, align 4
  %73 = add i32 %.01.neg8, -1
  %74 = add i32 %73, %72
  %75 = load i32, i32* %7, align 4
  %76 = mul i32 %74, %75
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32* %3, i64 %77
  %79 = getelementptr inbounds i32, i32* %78, i64 %54
  %80 = bitcast i32* %79 to i8*
  %81 = sub i32 %75, %.03
  %82 = shl i32 %81, 2
  call void @_TIFFmemset(i8* %80, i32 0, i32 %82) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %83 = add nuw i32 %.017, 1
  %.01.neg = xor i32 %.017, -1
  %84 = icmp ugt i64 %55, %indvars.iv.next
  br i1 %84, label %58, label %.preheader.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %85 = phi i32 [ %95, %.lr.ph ], [ %56, %.lr.ph.preheader ]
  %.16 = phi i32 [ %94, %.lr.ph ], [ %.02, %.lr.ph.preheader ]
  %86 = xor i32 %.16, -1
  %87 = add i32 %85, %86
  %88 = load i32, i32* %7, align 4
  %89 = mul i32 %88, %87
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32* %3, i64 %90
  %92 = bitcast i32* %91 to i8*
  %93 = shl i32 %88, 2
  call void @_TIFFmemset(i8* %92, i32 0, i32 %93) #6
  %94 = add i32 %.16, 1
  %95 = load i32, i32* %8, align 4
  %96 = icmp ugt i32 %95, %94
  br i1 %96, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %31, %29, %23, %11
  %.0 = phi i32 [ 0, %23 ], [ 0, %29 ], [ 0, %11 ], [ %46, %31 ], [ %46, %.preheader ], [ %46, %.loopexit.loopexit ]
  ret i32 %.0
}

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #2

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #2

declare i32 @TIFFTileSize(%struct.tiff*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @setorientation(%struct._TIFFRGBAImage* nocapture, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 8
  %6 = load i16, i16* %5, align 8
  switch i16 %6, label %9 [
    i16 3, label %7
    i16 7, label %7
    i16 8, label %7
    i16 4, label %13
    i16 1, label %11
  ]

; <label>:7:                                      ; preds = %2, %2, %2
  %8 = tail call i8* @TIFFFileName(%struct.tiff* %4) #6
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %8, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.25, i64 0, i64 0)) #6
  store i16 4, i16* %5, align 8
  br label %13

; <label>:9:                                      ; preds = %2
  %10 = tail call i8* @TIFFFileName(%struct.tiff* %4) #6
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %10, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.26, i64 0, i64 0)) #6
  store i16 1, i16* %5, align 8
  br label %11

; <label>:11:                                     ; preds = %2, %9
  %12 = add i32 %1, -1
  br label %13

; <label>:13:                                     ; preds = %2, %7, %11
  %.0 = phi i32 [ %12, %11 ], [ 0, %7 ], [ 0, %2 ]
  ret i32 %.0
}

declare i32 @TIFFReadTile(%struct.tiff*, i8*, i32, i32, i32, i16 zeroext) local_unnamed_addr #2

declare void @TIFFWarning(i8*, i8*, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare i32 @TIFFStripSize(%struct.tiff*) local_unnamed_addr #2

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #2

declare i32 @TIFFReadEncodedStrip(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #2

declare i32 @TIFFComputeStrip(%struct.tiff*, i32, i16 zeroext) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @buildMap(%struct._TIFFRGBAImage* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 9
  %3 = load i16, i16* %2, align 2
  switch i16 %3, label %26 [
    i16 2, label %4
    i16 6, label %4
    i16 5, label %4
    i16 1, label %8
    i16 0, label %8
    i16 3, label %11
  ]

; <label>:4:                                      ; preds = %1, %1, %1
  %5 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %6 = load i16, i16* %5, align 4
  %7 = icmp eq i16 %6, 8
  br i1 %7, label %26, label %8

; <label>:8:                                      ; preds = %4, %1, %1
  %9 = tail call fastcc i32 @setupMap(%struct._TIFFRGBAImage* nonnull %0)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %27, label %26

; <label>:11:                                     ; preds = %1
  %12 = tail call fastcc i32 @checkcmap(%struct._TIFFRGBAImage* nonnull %0)
  %13 = icmp eq i32 %12, 16
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %11
  tail call fastcc void @cvtcmap(%struct._TIFFRGBAImage* nonnull %0)
  br label %19

; <label>:15:                                     ; preds = %11
  %16 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %17 = load %struct.tiff*, %struct.tiff** %16, align 8
  %18 = tail call i8* @TIFFFileName(%struct.tiff* %17) #6
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %18, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.28, i64 0, i64 0)) #6
  br label %19

; <label>:19:                                     ; preds = %15, %14
  %20 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %21 = load i16, i16* %20, align 4
  %22 = icmp ult i16 %21, 9
  br i1 %22, label %23, label %26

; <label>:23:                                     ; preds = %19
  %24 = tail call fastcc i32 @makecmap(%struct._TIFFRGBAImage* nonnull %0)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %27, label %26

; <label>:26:                                     ; preds = %19, %23, %8, %4, %1
  br label %27

; <label>:27:                                     ; preds = %23, %8, %26
  %.0 = phi i32 [ 1, %26 ], [ 0, %8 ], [ 0, %23 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBAAcontig8bittile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %11 = load i16, i16* %10, align 2
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %._crit_edge20, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %13 = zext i16 %11 to i32
  %14 = mul nsw i32 %13, %6
  %15 = icmp ugt i32 %4, 7
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  %18 = zext i16 %11 to i64
  %19 = zext i16 %11 to i64
  %20 = zext i16 %11 to i64
  %21 = zext i16 %11 to i64
  %22 = zext i16 %11 to i64
  %23 = zext i16 %11 to i64
  %24 = zext i16 %11 to i64
  %25 = zext i16 %11 to i64
  %26 = add i32 %4, -8
  %27 = lshr i32 %26, 3
  %28 = shl nuw i32 %27, 3
  %29 = zext i32 %28 to i64
  %30 = add nuw nsw i64 %29, 8
  %31 = mul nuw nsw i64 %30, %25
  %32 = shl nuw i32 %27, 3
  %33 = sub i32 %26, %32
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %329
  %.in = phi i32 [ %5, %.preheader.lr.ph ], [ %34, %329 ]
  %.0119 = phi i32* [ %1, %.preheader.lr.ph ], [ %330, %329 ]
  %.0218 = phi i8* [ %8, %.preheader.lr.ph ], [ %331, %329 ]
  %34 = add i32 %.in, -1
  br i1 %15, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %scevgep = getelementptr i8, i8* %.0218, i64 %31
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.015 = phi i32 [ %187, %.lr.ph ], [ %4, %.lr.ph.preheader ]
  %.114 = phi i32* [ %186, %.lr.ph ], [ %.0119, %.lr.ph.preheader ]
  %.1313 = phi i8* [ %185, %.lr.ph ], [ %.0218, %.lr.ph.preheader ]
  %35 = load i8, i8* %.1313, align 1
  %36 = zext i8 %35 to i32
  %37 = getelementptr inbounds i8, i8* %.1313, i64 1
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = shl nuw nsw i32 %39, 8
  %41 = or i32 %40, %36
  %42 = getelementptr inbounds i8, i8* %.1313, i64 2
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = shl nuw nsw i32 %44, 16
  %46 = or i32 %41, %45
  %47 = getelementptr inbounds i8, i8* %.1313, i64 3
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = shl nuw i32 %49, 24
  %51 = or i32 %46, %50
  %52 = getelementptr inbounds i32, i32* %.114, i64 1
  store i32 %51, i32* %.114, align 4
  %53 = getelementptr inbounds i8, i8* %.1313, i64 %25
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = getelementptr inbounds i8, i8* %53, i64 1
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = shl nuw nsw i32 %58, 8
  %60 = or i32 %59, %55
  %61 = getelementptr inbounds i8, i8* %53, i64 2
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = shl nuw nsw i32 %63, 16
  %65 = or i32 %60, %64
  %66 = getelementptr inbounds i8, i8* %53, i64 3
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = shl nuw i32 %68, 24
  %70 = or i32 %65, %69
  %71 = getelementptr inbounds i32, i32* %.114, i64 2
  store i32 %70, i32* %52, align 4
  %72 = getelementptr inbounds i8, i8* %53, i64 %25
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = getelementptr inbounds i8, i8* %72, i64 1
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = shl nuw nsw i32 %77, 8
  %79 = or i32 %78, %74
  %80 = getelementptr inbounds i8, i8* %72, i64 2
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = shl nuw nsw i32 %82, 16
  %84 = or i32 %79, %83
  %85 = getelementptr inbounds i8, i8* %72, i64 3
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = shl nuw i32 %87, 24
  %89 = or i32 %84, %88
  %90 = getelementptr inbounds i32, i32* %.114, i64 3
  store i32 %89, i32* %71, align 4
  %91 = getelementptr inbounds i8, i8* %72, i64 %25
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = getelementptr inbounds i8, i8* %91, i64 1
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = shl nuw nsw i32 %96, 8
  %98 = or i32 %97, %93
  %99 = getelementptr inbounds i8, i8* %91, i64 2
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = shl nuw nsw i32 %101, 16
  %103 = or i32 %98, %102
  %104 = getelementptr inbounds i8, i8* %91, i64 3
  %105 = load i8, i8* %104, align 1
  %106 = zext i8 %105 to i32
  %107 = shl nuw i32 %106, 24
  %108 = or i32 %103, %107
  %109 = getelementptr inbounds i32, i32* %.114, i64 4
  store i32 %108, i32* %90, align 4
  %110 = getelementptr inbounds i8, i8* %91, i64 %25
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = getelementptr inbounds i8, i8* %110, i64 1
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = shl nuw nsw i32 %115, 8
  %117 = or i32 %116, %112
  %118 = getelementptr inbounds i8, i8* %110, i64 2
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i32
  %121 = shl nuw nsw i32 %120, 16
  %122 = or i32 %117, %121
  %123 = getelementptr inbounds i8, i8* %110, i64 3
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i32
  %126 = shl nuw i32 %125, 24
  %127 = or i32 %122, %126
  %128 = getelementptr inbounds i32, i32* %.114, i64 5
  store i32 %127, i32* %109, align 4
  %129 = getelementptr inbounds i8, i8* %110, i64 %25
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = getelementptr inbounds i8, i8* %129, i64 1
  %133 = load i8, i8* %132, align 1
  %134 = zext i8 %133 to i32
  %135 = shl nuw nsw i32 %134, 8
  %136 = or i32 %135, %131
  %137 = getelementptr inbounds i8, i8* %129, i64 2
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = shl nuw nsw i32 %139, 16
  %141 = or i32 %136, %140
  %142 = getelementptr inbounds i8, i8* %129, i64 3
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i32
  %145 = shl nuw i32 %144, 24
  %146 = or i32 %141, %145
  %147 = getelementptr inbounds i32, i32* %.114, i64 6
  store i32 %146, i32* %128, align 4
  %148 = getelementptr inbounds i8, i8* %129, i64 %25
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = getelementptr inbounds i8, i8* %148, i64 1
  %152 = load i8, i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = shl nuw nsw i32 %153, 8
  %155 = or i32 %154, %150
  %156 = getelementptr inbounds i8, i8* %148, i64 2
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i32
  %159 = shl nuw nsw i32 %158, 16
  %160 = or i32 %155, %159
  %161 = getelementptr inbounds i8, i8* %148, i64 3
  %162 = load i8, i8* %161, align 1
  %163 = zext i8 %162 to i32
  %164 = shl nuw i32 %163, 24
  %165 = or i32 %160, %164
  %166 = getelementptr inbounds i32, i32* %.114, i64 7
  store i32 %165, i32* %147, align 4
  %167 = getelementptr inbounds i8, i8* %148, i64 %25
  %168 = load i8, i8* %167, align 1
  %169 = zext i8 %168 to i32
  %170 = getelementptr inbounds i8, i8* %167, i64 1
  %171 = load i8, i8* %170, align 1
  %172 = zext i8 %171 to i32
  %173 = shl nuw nsw i32 %172, 8
  %174 = or i32 %173, %169
  %175 = getelementptr inbounds i8, i8* %167, i64 2
  %176 = load i8, i8* %175, align 1
  %177 = zext i8 %176 to i32
  %178 = shl nuw nsw i32 %177, 16
  %179 = or i32 %174, %178
  %180 = getelementptr inbounds i8, i8* %167, i64 3
  %181 = load i8, i8* %180, align 1
  %182 = zext i8 %181 to i32
  %183 = shl nuw i32 %182, 24
  %184 = or i32 %179, %183
  store i32 %184, i32* %166, align 4
  %185 = getelementptr inbounds i8, i8* %167, i64 %25
  %186 = getelementptr inbounds i32, i32* %.114, i64 8
  %187 = add i32 %.015, -8
  %188 = icmp ugt i32 %187, 7
  br i1 %188, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %scevgep23 = getelementptr i32, i32* %.0119, i64 %30
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.13.lcssa = phi i8* [ %.0218, %.preheader ], [ %scevgep, %._crit_edge.loopexit ]
  %.1.lcssa = phi i32* [ %.0119, %.preheader ], [ %scevgep23, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ %4, %.preheader ], [ %33, %._crit_edge.loopexit ]
  switch i32 %.0.lcssa, label %329 [
    i32 1, label %309
    i32 7, label %189
    i32 6, label %209
    i32 5, label %229
    i32 4, label %249
    i32 3, label %269
    i32 2, label %289
  ]

; <label>:189:                                    ; preds = %._crit_edge
  %190 = load i8, i8* %.13.lcssa, align 1
  %191 = zext i8 %190 to i32
  %192 = getelementptr inbounds i8, i8* %.13.lcssa, i64 1
  %193 = load i8, i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = shl nuw nsw i32 %194, 8
  %196 = or i32 %195, %191
  %197 = getelementptr inbounds i8, i8* %.13.lcssa, i64 2
  %198 = load i8, i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = shl nuw nsw i32 %199, 16
  %201 = or i32 %196, %200
  %202 = getelementptr inbounds i8, i8* %.13.lcssa, i64 3
  %203 = load i8, i8* %202, align 1
  %204 = zext i8 %203 to i32
  %205 = shl nuw i32 %204, 24
  %206 = or i32 %201, %205
  %207 = getelementptr inbounds i32, i32* %.1.lcssa, i64 1
  store i32 %206, i32* %.1.lcssa, align 4
  %208 = getelementptr inbounds i8, i8* %.13.lcssa, i64 %19
  br label %209

; <label>:209:                                    ; preds = %._crit_edge, %189
  %.24 = phi i8* [ %208, %189 ], [ %.13.lcssa, %._crit_edge ]
  %.2 = phi i32* [ %207, %189 ], [ %.1.lcssa, %._crit_edge ]
  %210 = load i8, i8* %.24, align 1
  %211 = zext i8 %210 to i32
  %212 = getelementptr inbounds i8, i8* %.24, i64 1
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = shl nuw nsw i32 %214, 8
  %216 = or i32 %215, %211
  %217 = getelementptr inbounds i8, i8* %.24, i64 2
  %218 = load i8, i8* %217, align 1
  %219 = zext i8 %218 to i32
  %220 = shl nuw nsw i32 %219, 16
  %221 = or i32 %216, %220
  %222 = getelementptr inbounds i8, i8* %.24, i64 3
  %223 = load i8, i8* %222, align 1
  %224 = zext i8 %223 to i32
  %225 = shl nuw i32 %224, 24
  %226 = or i32 %221, %225
  %227 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %226, i32* %.2, align 4
  %228 = getelementptr inbounds i8, i8* %.24, i64 %20
  br label %229

; <label>:229:                                    ; preds = %._crit_edge, %209
  %.35 = phi i8* [ %228, %209 ], [ %.13.lcssa, %._crit_edge ]
  %.3 = phi i32* [ %227, %209 ], [ %.1.lcssa, %._crit_edge ]
  %230 = load i8, i8* %.35, align 1
  %231 = zext i8 %230 to i32
  %232 = getelementptr inbounds i8, i8* %.35, i64 1
  %233 = load i8, i8* %232, align 1
  %234 = zext i8 %233 to i32
  %235 = shl nuw nsw i32 %234, 8
  %236 = or i32 %235, %231
  %237 = getelementptr inbounds i8, i8* %.35, i64 2
  %238 = load i8, i8* %237, align 1
  %239 = zext i8 %238 to i32
  %240 = shl nuw nsw i32 %239, 16
  %241 = or i32 %236, %240
  %242 = getelementptr inbounds i8, i8* %.35, i64 3
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = shl nuw i32 %244, 24
  %246 = or i32 %241, %245
  %247 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %246, i32* %.3, align 4
  %248 = getelementptr inbounds i8, i8* %.35, i64 %21
  br label %249

; <label>:249:                                    ; preds = %._crit_edge, %229
  %.46 = phi i8* [ %248, %229 ], [ %.13.lcssa, %._crit_edge ]
  %.4 = phi i32* [ %247, %229 ], [ %.1.lcssa, %._crit_edge ]
  %250 = load i8, i8* %.46, align 1
  %251 = zext i8 %250 to i32
  %252 = getelementptr inbounds i8, i8* %.46, i64 1
  %253 = load i8, i8* %252, align 1
  %254 = zext i8 %253 to i32
  %255 = shl nuw nsw i32 %254, 8
  %256 = or i32 %255, %251
  %257 = getelementptr inbounds i8, i8* %.46, i64 2
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = shl nuw nsw i32 %259, 16
  %261 = or i32 %256, %260
  %262 = getelementptr inbounds i8, i8* %.46, i64 3
  %263 = load i8, i8* %262, align 1
  %264 = zext i8 %263 to i32
  %265 = shl nuw i32 %264, 24
  %266 = or i32 %261, %265
  %267 = getelementptr inbounds i32, i32* %.4, i64 1
  store i32 %266, i32* %.4, align 4
  %268 = getelementptr inbounds i8, i8* %.46, i64 %22
  br label %269

; <label>:269:                                    ; preds = %._crit_edge, %249
  %.57 = phi i8* [ %268, %249 ], [ %.13.lcssa, %._crit_edge ]
  %.5 = phi i32* [ %267, %249 ], [ %.1.lcssa, %._crit_edge ]
  %270 = load i8, i8* %.57, align 1
  %271 = zext i8 %270 to i32
  %272 = getelementptr inbounds i8, i8* %.57, i64 1
  %273 = load i8, i8* %272, align 1
  %274 = zext i8 %273 to i32
  %275 = shl nuw nsw i32 %274, 8
  %276 = or i32 %275, %271
  %277 = getelementptr inbounds i8, i8* %.57, i64 2
  %278 = load i8, i8* %277, align 1
  %279 = zext i8 %278 to i32
  %280 = shl nuw nsw i32 %279, 16
  %281 = or i32 %276, %280
  %282 = getelementptr inbounds i8, i8* %.57, i64 3
  %283 = load i8, i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = shl nuw i32 %284, 24
  %286 = or i32 %281, %285
  %287 = getelementptr inbounds i32, i32* %.5, i64 1
  store i32 %286, i32* %.5, align 4
  %288 = getelementptr inbounds i8, i8* %.57, i64 %23
  br label %289

; <label>:289:                                    ; preds = %._crit_edge, %269
  %.68 = phi i8* [ %288, %269 ], [ %.13.lcssa, %._crit_edge ]
  %.6 = phi i32* [ %287, %269 ], [ %.1.lcssa, %._crit_edge ]
  %290 = load i8, i8* %.68, align 1
  %291 = zext i8 %290 to i32
  %292 = getelementptr inbounds i8, i8* %.68, i64 1
  %293 = load i8, i8* %292, align 1
  %294 = zext i8 %293 to i32
  %295 = shl nuw nsw i32 %294, 8
  %296 = or i32 %295, %291
  %297 = getelementptr inbounds i8, i8* %.68, i64 2
  %298 = load i8, i8* %297, align 1
  %299 = zext i8 %298 to i32
  %300 = shl nuw nsw i32 %299, 16
  %301 = or i32 %296, %300
  %302 = getelementptr inbounds i8, i8* %.68, i64 3
  %303 = load i8, i8* %302, align 1
  %304 = zext i8 %303 to i32
  %305 = shl nuw i32 %304, 24
  %306 = or i32 %301, %305
  %307 = getelementptr inbounds i32, i32* %.6, i64 1
  store i32 %306, i32* %.6, align 4
  %308 = getelementptr inbounds i8, i8* %.68, i64 %24
  br label %309

; <label>:309:                                    ; preds = %._crit_edge, %289
  %.79 = phi i8* [ %308, %289 ], [ %.13.lcssa, %._crit_edge ]
  %.7 = phi i32* [ %307, %289 ], [ %.1.lcssa, %._crit_edge ]
  %310 = load i8, i8* %.79, align 1
  %311 = zext i8 %310 to i32
  %312 = getelementptr inbounds i8, i8* %.79, i64 1
  %313 = load i8, i8* %312, align 1
  %314 = zext i8 %313 to i32
  %315 = shl nuw nsw i32 %314, 8
  %316 = or i32 %315, %311
  %317 = getelementptr inbounds i8, i8* %.79, i64 2
  %318 = load i8, i8* %317, align 1
  %319 = zext i8 %318 to i32
  %320 = shl nuw nsw i32 %319, 16
  %321 = or i32 %316, %320
  %322 = getelementptr inbounds i8, i8* %.79, i64 3
  %323 = load i8, i8* %322, align 1
  %324 = zext i8 %323 to i32
  %325 = shl nuw i32 %324, 24
  %326 = or i32 %321, %325
  %327 = getelementptr inbounds i32, i32* %.7, i64 1
  store i32 %326, i32* %.7, align 4
  %328 = getelementptr inbounds i8, i8* %.79, i64 %18
  br label %329

; <label>:329:                                    ; preds = %309, %._crit_edge
  %.911 = phi i8* [ %328, %309 ], [ %.13.lcssa, %._crit_edge ]
  %.9 = phi i32* [ %327, %309 ], [ %.1.lcssa, %._crit_edge ]
  %330 = getelementptr inbounds i32, i32* %.9, i64 %16
  %331 = getelementptr inbounds i8, i8* %.911, i64 %17
  %332 = icmp eq i32 %34, 0
  br i1 %332, label %._crit_edge20.loopexit, label %.preheader

._crit_edge20.loopexit:                           ; preds = %329
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBUAcontig8bittile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %11 = load i16, i16* %10, align 2
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %._crit_edge11, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %13 = zext i16 %11 to i32
  %14 = mul nsw i32 %13, %6
  %15 = icmp eq i32 %4, 0
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  %18 = zext i16 %11 to i64
  br i1 %15, label %._crit_edge11, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %19 = add i32 %4, -1
  %20 = zext i32 %19 to i64
  %21 = add nuw nsw i64 %20, 1
  %22 = mul nuw nsw i64 %21, %18
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.in = phi i32 [ %23, %._crit_edge ], [ %5, %.preheader.preheader ]
  %.010 = phi i8* [ %53, %._crit_edge ], [ %8, %.preheader.preheader ]
  %.019 = phi i32* [ %52, %._crit_edge ], [ %1, %.preheader.preheader ]
  %23 = add i32 %.in, -1
  %scevgep = getelementptr i32, i32* %.019, i64 %21
  br label %24

; <label>:24:                                     ; preds = %.preheader, %24
  %.17 = phi i8* [ %.010, %.preheader ], [ %50, %24 ]
  %.126 = phi i32* [ %.019, %.preheader ], [ %49, %24 ]
  %.035 = phi i32 [ %4, %.preheader ], [ %25, %24 ]
  %25 = add i32 %.035, -1
  %26 = getelementptr inbounds i8, i8* %.17, i64 3
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = load i8, i8* %.17, align 1
  %30 = zext i8 %29 to i32
  %31 = mul nuw nsw i32 %30, %28
  %32 = udiv i32 %31, 255
  %33 = getelementptr inbounds i8, i8* %.17, i64 1
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = mul nuw nsw i32 %35, %28
  %37 = udiv i32 %36, 255
  %38 = getelementptr inbounds i8, i8* %.17, i64 2
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = mul nuw nsw i32 %40, %28
  %42 = udiv i32 %41, 255
  %43 = shl nuw nsw i32 %37, 8
  %44 = shl nuw nsw i32 %42, 16
  %45 = shl nuw i32 %28, 24
  %46 = or i32 %32, %45
  %47 = or i32 %46, %43
  %48 = or i32 %47, %44
  %49 = getelementptr inbounds i32, i32* %.126, i64 1
  store i32 %48, i32* %.126, align 4
  %50 = getelementptr inbounds i8, i8* %.17, i64 %18
  %51 = icmp eq i32 %25, 0
  br i1 %51, label %._crit_edge, label %24

._crit_edge:                                      ; preds = %24
  %scevgep14 = getelementptr i8, i8* %.010, i64 %22
  %52 = getelementptr inbounds i32, i32* %scevgep, i64 %16
  %53 = getelementptr inbounds i8, i8* %scevgep14, i64 %17
  %54 = icmp eq i32 %23, 0
  br i1 %54, label %._crit_edge11.loopexit, label %.preheader

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBcontig8bittile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %11 = load i16, i16* %10, align 2
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %._crit_edge20, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %13 = zext i16 %11 to i32
  %14 = mul nsw i32 %13, %6
  %15 = icmp ugt i32 %4, 7
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  %18 = zext i16 %11 to i64
  %19 = zext i16 %11 to i64
  %20 = zext i16 %11 to i64
  %21 = zext i16 %11 to i64
  %22 = zext i16 %11 to i64
  %23 = zext i16 %11 to i64
  %24 = zext i16 %11 to i64
  %25 = zext i16 %11 to i64
  %26 = add i32 %4, -8
  %27 = lshr i32 %26, 3
  %28 = shl nuw i32 %27, 3
  %29 = zext i32 %28 to i64
  %30 = add nuw nsw i64 %29, 8
  %31 = mul nuw nsw i64 %30, %25
  %32 = shl nuw i32 %27, 3
  %33 = sub i32 %26, %32
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %269
  %.in = phi i32 [ %5, %.preheader.lr.ph ], [ %34, %269 ]
  %.0119 = phi i32* [ %1, %.preheader.lr.ph ], [ %270, %269 ]
  %.0218 = phi i8* [ %8, %.preheader.lr.ph ], [ %271, %269 ]
  %34 = add i32 %.in, -1
  br i1 %15, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %scevgep = getelementptr i8, i8* %.0218, i64 %31
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.015 = phi i32 [ %155, %.lr.ph ], [ %4, %.lr.ph.preheader ]
  %.114 = phi i32* [ %154, %.lr.ph ], [ %.0119, %.lr.ph.preheader ]
  %.1313 = phi i8* [ %153, %.lr.ph ], [ %.0218, %.lr.ph.preheader ]
  %35 = load i8, i8* %.1313, align 1
  %36 = zext i8 %35 to i32
  %37 = getelementptr inbounds i8, i8* %.1313, i64 1
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = shl nuw nsw i32 %39, 8
  %41 = getelementptr inbounds i8, i8* %.1313, i64 2
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = shl nuw nsw i32 %43, 16
  %45 = or i32 %36, %40
  %46 = or i32 %45, %44
  %47 = or i32 %46, -16777216
  %48 = getelementptr inbounds i32, i32* %.114, i64 1
  store i32 %47, i32* %.114, align 4
  %49 = getelementptr inbounds i8, i8* %.1313, i64 %25
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = getelementptr inbounds i8, i8* %49, i64 1
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = shl nuw nsw i32 %54, 8
  %56 = getelementptr inbounds i8, i8* %49, i64 2
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = shl nuw nsw i32 %58, 16
  %60 = or i32 %51, %55
  %61 = or i32 %60, %59
  %62 = or i32 %61, -16777216
  %63 = getelementptr inbounds i32, i32* %.114, i64 2
  store i32 %62, i32* %48, align 4
  %64 = getelementptr inbounds i8, i8* %49, i64 %25
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = getelementptr inbounds i8, i8* %64, i64 1
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = shl nuw nsw i32 %69, 8
  %71 = getelementptr inbounds i8, i8* %64, i64 2
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = shl nuw nsw i32 %73, 16
  %75 = or i32 %66, %70
  %76 = or i32 %75, %74
  %77 = or i32 %76, -16777216
  %78 = getelementptr inbounds i32, i32* %.114, i64 3
  store i32 %77, i32* %63, align 4
  %79 = getelementptr inbounds i8, i8* %64, i64 %25
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = getelementptr inbounds i8, i8* %79, i64 1
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = shl nuw nsw i32 %84, 8
  %86 = getelementptr inbounds i8, i8* %79, i64 2
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = shl nuw nsw i32 %88, 16
  %90 = or i32 %81, %85
  %91 = or i32 %90, %89
  %92 = or i32 %91, -16777216
  %93 = getelementptr inbounds i32, i32* %.114, i64 4
  store i32 %92, i32* %78, align 4
  %94 = getelementptr inbounds i8, i8* %79, i64 %25
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = getelementptr inbounds i8, i8* %94, i64 1
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = shl nuw nsw i32 %99, 8
  %101 = getelementptr inbounds i8, i8* %94, i64 2
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = shl nuw nsw i32 %103, 16
  %105 = or i32 %96, %100
  %106 = or i32 %105, %104
  %107 = or i32 %106, -16777216
  %108 = getelementptr inbounds i32, i32* %.114, i64 5
  store i32 %107, i32* %93, align 4
  %109 = getelementptr inbounds i8, i8* %94, i64 %25
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = getelementptr inbounds i8, i8* %109, i64 1
  %113 = load i8, i8* %112, align 1
  %114 = zext i8 %113 to i32
  %115 = shl nuw nsw i32 %114, 8
  %116 = getelementptr inbounds i8, i8* %109, i64 2
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = shl nuw nsw i32 %118, 16
  %120 = or i32 %111, %115
  %121 = or i32 %120, %119
  %122 = or i32 %121, -16777216
  %123 = getelementptr inbounds i32, i32* %.114, i64 6
  store i32 %122, i32* %108, align 4
  %124 = getelementptr inbounds i8, i8* %109, i64 %25
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = getelementptr inbounds i8, i8* %124, i64 1
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i32
  %130 = shl nuw nsw i32 %129, 8
  %131 = getelementptr inbounds i8, i8* %124, i64 2
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = shl nuw nsw i32 %133, 16
  %135 = or i32 %126, %130
  %136 = or i32 %135, %134
  %137 = or i32 %136, -16777216
  %138 = getelementptr inbounds i32, i32* %.114, i64 7
  store i32 %137, i32* %123, align 4
  %139 = getelementptr inbounds i8, i8* %124, i64 %25
  %140 = load i8, i8* %139, align 1
  %141 = zext i8 %140 to i32
  %142 = getelementptr inbounds i8, i8* %139, i64 1
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i32
  %145 = shl nuw nsw i32 %144, 8
  %146 = getelementptr inbounds i8, i8* %139, i64 2
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %149 = shl nuw nsw i32 %148, 16
  %150 = or i32 %141, %145
  %151 = or i32 %150, %149
  %152 = or i32 %151, -16777216
  store i32 %152, i32* %138, align 4
  %153 = getelementptr inbounds i8, i8* %139, i64 %25
  %154 = getelementptr inbounds i32, i32* %.114, i64 8
  %155 = add i32 %.015, -8
  %156 = icmp ugt i32 %155, 7
  br i1 %156, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %scevgep23 = getelementptr i32, i32* %.0119, i64 %30
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.13.lcssa = phi i8* [ %.0218, %.preheader ], [ %scevgep, %._crit_edge.loopexit ]
  %.1.lcssa = phi i32* [ %.0119, %.preheader ], [ %scevgep23, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ %4, %.preheader ], [ %33, %._crit_edge.loopexit ]
  switch i32 %.0.lcssa, label %269 [
    i32 1, label %253
    i32 7, label %157
    i32 6, label %173
    i32 5, label %189
    i32 4, label %205
    i32 3, label %221
    i32 2, label %237
  ]

; <label>:157:                                    ; preds = %._crit_edge
  %158 = load i8, i8* %.13.lcssa, align 1
  %159 = zext i8 %158 to i32
  %160 = getelementptr inbounds i8, i8* %.13.lcssa, i64 1
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = shl nuw nsw i32 %162, 8
  %164 = getelementptr inbounds i8, i8* %.13.lcssa, i64 2
  %165 = load i8, i8* %164, align 1
  %166 = zext i8 %165 to i32
  %167 = shl nuw nsw i32 %166, 16
  %168 = or i32 %159, %163
  %169 = or i32 %168, %167
  %170 = or i32 %169, -16777216
  %171 = getelementptr inbounds i32, i32* %.1.lcssa, i64 1
  store i32 %170, i32* %.1.lcssa, align 4
  %172 = getelementptr inbounds i8, i8* %.13.lcssa, i64 %19
  br label %173

; <label>:173:                                    ; preds = %._crit_edge, %157
  %.24 = phi i8* [ %172, %157 ], [ %.13.lcssa, %._crit_edge ]
  %.2 = phi i32* [ %171, %157 ], [ %.1.lcssa, %._crit_edge ]
  %174 = load i8, i8* %.24, align 1
  %175 = zext i8 %174 to i32
  %176 = getelementptr inbounds i8, i8* %.24, i64 1
  %177 = load i8, i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = shl nuw nsw i32 %178, 8
  %180 = getelementptr inbounds i8, i8* %.24, i64 2
  %181 = load i8, i8* %180, align 1
  %182 = zext i8 %181 to i32
  %183 = shl nuw nsw i32 %182, 16
  %184 = or i32 %175, %179
  %185 = or i32 %184, %183
  %186 = or i32 %185, -16777216
  %187 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %186, i32* %.2, align 4
  %188 = getelementptr inbounds i8, i8* %.24, i64 %20
  br label %189

; <label>:189:                                    ; preds = %._crit_edge, %173
  %.35 = phi i8* [ %188, %173 ], [ %.13.lcssa, %._crit_edge ]
  %.3 = phi i32* [ %187, %173 ], [ %.1.lcssa, %._crit_edge ]
  %190 = load i8, i8* %.35, align 1
  %191 = zext i8 %190 to i32
  %192 = getelementptr inbounds i8, i8* %.35, i64 1
  %193 = load i8, i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = shl nuw nsw i32 %194, 8
  %196 = getelementptr inbounds i8, i8* %.35, i64 2
  %197 = load i8, i8* %196, align 1
  %198 = zext i8 %197 to i32
  %199 = shl nuw nsw i32 %198, 16
  %200 = or i32 %191, %195
  %201 = or i32 %200, %199
  %202 = or i32 %201, -16777216
  %203 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %202, i32* %.3, align 4
  %204 = getelementptr inbounds i8, i8* %.35, i64 %21
  br label %205

; <label>:205:                                    ; preds = %._crit_edge, %189
  %.46 = phi i8* [ %204, %189 ], [ %.13.lcssa, %._crit_edge ]
  %.4 = phi i32* [ %203, %189 ], [ %.1.lcssa, %._crit_edge ]
  %206 = load i8, i8* %.46, align 1
  %207 = zext i8 %206 to i32
  %208 = getelementptr inbounds i8, i8* %.46, i64 1
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = shl nuw nsw i32 %210, 8
  %212 = getelementptr inbounds i8, i8* %.46, i64 2
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = shl nuw nsw i32 %214, 16
  %216 = or i32 %207, %211
  %217 = or i32 %216, %215
  %218 = or i32 %217, -16777216
  %219 = getelementptr inbounds i32, i32* %.4, i64 1
  store i32 %218, i32* %.4, align 4
  %220 = getelementptr inbounds i8, i8* %.46, i64 %22
  br label %221

; <label>:221:                                    ; preds = %._crit_edge, %205
  %.57 = phi i8* [ %220, %205 ], [ %.13.lcssa, %._crit_edge ]
  %.5 = phi i32* [ %219, %205 ], [ %.1.lcssa, %._crit_edge ]
  %222 = load i8, i8* %.57, align 1
  %223 = zext i8 %222 to i32
  %224 = getelementptr inbounds i8, i8* %.57, i64 1
  %225 = load i8, i8* %224, align 1
  %226 = zext i8 %225 to i32
  %227 = shl nuw nsw i32 %226, 8
  %228 = getelementptr inbounds i8, i8* %.57, i64 2
  %229 = load i8, i8* %228, align 1
  %230 = zext i8 %229 to i32
  %231 = shl nuw nsw i32 %230, 16
  %232 = or i32 %223, %227
  %233 = or i32 %232, %231
  %234 = or i32 %233, -16777216
  %235 = getelementptr inbounds i32, i32* %.5, i64 1
  store i32 %234, i32* %.5, align 4
  %236 = getelementptr inbounds i8, i8* %.57, i64 %23
  br label %237

; <label>:237:                                    ; preds = %._crit_edge, %221
  %.68 = phi i8* [ %236, %221 ], [ %.13.lcssa, %._crit_edge ]
  %.6 = phi i32* [ %235, %221 ], [ %.1.lcssa, %._crit_edge ]
  %238 = load i8, i8* %.68, align 1
  %239 = zext i8 %238 to i32
  %240 = getelementptr inbounds i8, i8* %.68, i64 1
  %241 = load i8, i8* %240, align 1
  %242 = zext i8 %241 to i32
  %243 = shl nuw nsw i32 %242, 8
  %244 = getelementptr inbounds i8, i8* %.68, i64 2
  %245 = load i8, i8* %244, align 1
  %246 = zext i8 %245 to i32
  %247 = shl nuw nsw i32 %246, 16
  %248 = or i32 %239, %243
  %249 = or i32 %248, %247
  %250 = or i32 %249, -16777216
  %251 = getelementptr inbounds i32, i32* %.6, i64 1
  store i32 %250, i32* %.6, align 4
  %252 = getelementptr inbounds i8, i8* %.68, i64 %24
  br label %253

; <label>:253:                                    ; preds = %._crit_edge, %237
  %.79 = phi i8* [ %252, %237 ], [ %.13.lcssa, %._crit_edge ]
  %.7 = phi i32* [ %251, %237 ], [ %.1.lcssa, %._crit_edge ]
  %254 = load i8, i8* %.79, align 1
  %255 = zext i8 %254 to i32
  %256 = getelementptr inbounds i8, i8* %.79, i64 1
  %257 = load i8, i8* %256, align 1
  %258 = zext i8 %257 to i32
  %259 = shl nuw nsw i32 %258, 8
  %260 = getelementptr inbounds i8, i8* %.79, i64 2
  %261 = load i8, i8* %260, align 1
  %262 = zext i8 %261 to i32
  %263 = shl nuw nsw i32 %262, 16
  %264 = or i32 %255, %259
  %265 = or i32 %264, %263
  %266 = or i32 %265, -16777216
  %267 = getelementptr inbounds i32, i32* %.7, i64 1
  store i32 %266, i32* %.7, align 4
  %268 = getelementptr inbounds i8, i8* %.79, i64 %18
  br label %269

; <label>:269:                                    ; preds = %253, %._crit_edge
  %.911 = phi i8* [ %268, %253 ], [ %.13.lcssa, %._crit_edge ]
  %.9 = phi i32* [ %267, %253 ], [ %.1.lcssa, %._crit_edge ]
  %270 = getelementptr inbounds i32, i32* %.9, i64 %16
  %271 = getelementptr inbounds i8, i8* %.911, i64 %17
  %272 = icmp eq i32 %34, 0
  br i1 %272, label %._crit_edge20.loopexit, label %.preheader

._crit_edge20.loopexit:                           ; preds = %269
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBcontig8bitMaptile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %13 = load i16, i16* %12, align 2
  %14 = icmp eq i32 %5, 0
  br i1 %14, label %._crit_edge11, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %15 = zext i16 %13 to i32
  %16 = mul nsw i32 %15, %6
  %17 = icmp eq i32 %4, 0
  %18 = sext i32 %16 to i64
  %19 = sext i32 %7 to i64
  %20 = zext i16 %13 to i64
  br i1 %17, label %._crit_edge11, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %21 = add i32 %4, -1
  %22 = zext i32 %21 to i64
  %23 = add nuw nsw i64 %22, 1
  %24 = mul nuw nsw i64 %23, %20
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.in = phi i32 [ %25, %._crit_edge ], [ %5, %.preheader.preheader ]
  %.010 = phi i8* [ %53, %._crit_edge ], [ %8, %.preheader.preheader ]
  %.019 = phi i32* [ %54, %._crit_edge ], [ %1, %.preheader.preheader ]
  %25 = add i32 %.in, -1
  %scevgep = getelementptr i32, i32* %.019, i64 %23
  br label %26

; <label>:26:                                     ; preds = %.preheader, %26
  %.17 = phi i8* [ %.010, %.preheader ], [ %51, %26 ]
  %.126 = phi i32* [ %.019, %.preheader ], [ %50, %26 ]
  %.035 = phi i32 [ %4, %.preheader ], [ %27, %26 ]
  %27 = add i32 %.035, -1
  %28 = load i8, i8* %.17, align 1
  %29 = zext i8 %28 to i64
  %30 = getelementptr inbounds i8, i8* %11, i64 %29
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = getelementptr inbounds i8, i8* %.17, i64 1
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i64
  %36 = getelementptr inbounds i8, i8* %11, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = shl nuw nsw i32 %38, 8
  %40 = getelementptr inbounds i8, i8* %.17, i64 2
  %41 = load i8, i8* %40, align 1
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds i8, i8* %11, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = shl nuw nsw i32 %45, 16
  %47 = or i32 %32, %39
  %48 = or i32 %47, %46
  %49 = or i32 %48, -16777216
  %50 = getelementptr inbounds i32, i32* %.126, i64 1
  store i32 %49, i32* %.126, align 4
  %51 = getelementptr inbounds i8, i8* %.17, i64 %20
  %52 = icmp eq i32 %27, 0
  br i1 %52, label %._crit_edge, label %26

._crit_edge:                                      ; preds = %26
  %scevgep14 = getelementptr i8, i8* %.010, i64 %24
  %53 = getelementptr inbounds i8, i8* %scevgep14, i64 %18
  %54 = getelementptr inbounds i32, i32* %scevgep, i64 %19
  %55 = icmp eq i32 %25, 0
  br i1 %55, label %._crit_edge11.loopexit, label %.preheader

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBcontig16bittile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %11 = load i16, i16* %10, align 2
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %._crit_edge11, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %13 = zext i16 %11 to i32
  %14 = mul nsw i32 %13, %6
  %15 = icmp eq i32 %4, 0
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  %18 = zext i16 %11 to i64
  br i1 %15, label %._crit_edge11, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %19 = bitcast i8* %8 to i16*
  %20 = add i32 %4, -1
  %21 = zext i32 %20 to i64
  %22 = add nuw nsw i64 %21, 1
  %23 = shl nuw nsw i64 %21, 1
  %24 = add nuw nsw i64 %23, 2
  %25 = mul nuw nsw i64 %24, %18
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.in = phi i32 [ %26, %._crit_edge ], [ %5, %.preheader.preheader ]
  %.010 = phi i16* [ %48, %._crit_edge ], [ %19, %.preheader.preheader ]
  %.019 = phi i32* [ %47, %._crit_edge ], [ %1, %.preheader.preheader ]
  %26 = add i32 %.in, -1
  %.01014 = bitcast i16* %.010 to i8*
  %uglygep = getelementptr i8, i8* %.01014, i64 %25
  br label %27

; <label>:27:                                     ; preds = %.preheader, %27
  %.17 = phi i16* [ %.010, %.preheader ], [ %45, %27 ]
  %.126 = phi i32* [ %.019, %.preheader ], [ %44, %27 ]
  %.035 = phi i32 [ %4, %.preheader ], [ %28, %27 ]
  %28 = add i32 %.035, -1
  %29 = load i16, i16* %.17, align 2
  %30 = zext i16 %29 to i32
  %31 = lshr i32 %30, 8
  %32 = getelementptr inbounds i16, i16* %.17, i64 1
  %33 = load i16, i16* %32, align 2
  %34 = and i16 %33, -256
  %35 = zext i16 %34 to i32
  %36 = getelementptr inbounds i16, i16* %.17, i64 2
  %37 = load i16, i16* %36, align 2
  %38 = zext i16 %37 to i32
  %39 = lshr i32 %38, 8
  %40 = shl nuw nsw i32 %39, 16
  %41 = or i32 %31, %35
  %42 = or i32 %41, %40
  %43 = or i32 %42, -16777216
  %44 = getelementptr inbounds i32, i32* %.126, i64 1
  store i32 %43, i32* %.126, align 4
  %45 = getelementptr inbounds i16, i16* %.17, i64 %18
  %46 = icmp eq i32 %28, 0
  br i1 %46, label %._crit_edge, label %27

._crit_edge:                                      ; preds = %27
  %scevgep = getelementptr i32, i32* %.019, i64 %22
  %uglygep15 = bitcast i8* %uglygep to i16*
  %47 = getelementptr inbounds i32, i32* %scevgep, i64 %16
  %48 = getelementptr inbounds i16, i16* %uglygep15, i64 %17
  %49 = icmp eq i32 %26, 0
  br i1 %49, label %._crit_edge11.loopexit, label %.preheader

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBAAcontig16bittile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %11 = load i16, i16* %10, align 2
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %._crit_edge11, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %13 = zext i16 %11 to i32
  %14 = mul nsw i32 %13, %6
  %15 = icmp eq i32 %4, 0
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  %18 = zext i16 %11 to i64
  br i1 %15, label %._crit_edge11, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %19 = bitcast i8* %8 to i16*
  %20 = add i32 %4, -1
  %21 = zext i32 %20 to i64
  %22 = add nuw nsw i64 %21, 1
  %23 = shl nuw nsw i64 %21, 1
  %24 = add nuw nsw i64 %23, 2
  %25 = mul nuw nsw i64 %24, %18
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.in = phi i32 [ %26, %._crit_edge ], [ %5, %.preheader.preheader ]
  %.010 = phi i16* [ %53, %._crit_edge ], [ %19, %.preheader.preheader ]
  %.019 = phi i32* [ %52, %._crit_edge ], [ %1, %.preheader.preheader ]
  %26 = add i32 %.in, -1
  %.01014 = bitcast i16* %.010 to i8*
  %uglygep = getelementptr i8, i8* %.01014, i64 %25
  br label %27

; <label>:27:                                     ; preds = %.preheader, %27
  %.17 = phi i16* [ %.010, %.preheader ], [ %50, %27 ]
  %.126 = phi i32* [ %.019, %.preheader ], [ %49, %27 ]
  %.035 = phi i32 [ %4, %.preheader ], [ %28, %27 ]
  %28 = add i32 %.035, -1
  %29 = load i16, i16* %.17, align 2
  %30 = zext i16 %29 to i32
  %31 = lshr i32 %30, 8
  %32 = getelementptr inbounds i16, i16* %.17, i64 1
  %33 = load i16, i16* %32, align 2
  %34 = and i16 %33, -256
  %35 = zext i16 %34 to i32
  %36 = or i32 %35, %31
  %37 = getelementptr inbounds i16, i16* %.17, i64 2
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = lshr i32 %39, 8
  %41 = shl nuw nsw i32 %40, 16
  %42 = or i32 %36, %41
  %43 = getelementptr inbounds i16, i16* %.17, i64 3
  %44 = load i16, i16* %43, align 2
  %45 = zext i16 %44 to i32
  %46 = lshr i32 %45, 8
  %47 = shl nuw i32 %46, 24
  %48 = or i32 %42, %47
  %49 = getelementptr inbounds i32, i32* %.126, i64 1
  store i32 %48, i32* %.126, align 4
  %50 = getelementptr inbounds i16, i16* %.17, i64 %18
  %51 = icmp eq i32 %28, 0
  br i1 %51, label %._crit_edge, label %27

._crit_edge:                                      ; preds = %27
  %scevgep = getelementptr i32, i32* %.019, i64 %22
  %uglygep15 = bitcast i8* %uglygep to i16*
  %52 = getelementptr inbounds i32, i32* %scevgep, i64 %16
  %53 = getelementptr inbounds i16, i16* %uglygep15, i64 %17
  %54 = icmp eq i32 %26, 0
  br i1 %54, label %._crit_edge11.loopexit, label %.preheader

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBUAcontig16bittile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %11 = load i16, i16* %10, align 2
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %._crit_edge11, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %13 = zext i16 %11 to i32
  %14 = mul nsw i32 %13, %6
  %15 = icmp eq i32 %4, 0
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  %18 = zext i16 %11 to i64
  br i1 %15, label %._crit_edge11, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %19 = bitcast i8* %8 to i16*
  %20 = add i32 %4, -1
  %21 = zext i32 %20 to i64
  %22 = add nuw nsw i64 %21, 1
  %23 = shl nuw nsw i64 %21, 1
  %24 = add nuw nsw i64 %23, 2
  %25 = mul nuw nsw i64 %24, %18
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.in = phi i32 [ %26, %._crit_edge ], [ %5, %.preheader.preheader ]
  %.010 = phi i16* [ %57, %._crit_edge ], [ %19, %.preheader.preheader ]
  %.019 = phi i32* [ %56, %._crit_edge ], [ %1, %.preheader.preheader ]
  %26 = add i32 %.in, -1
  %.01014 = bitcast i16* %.010 to i8*
  %uglygep = getelementptr i8, i8* %.01014, i64 %25
  br label %27

; <label>:27:                                     ; preds = %.preheader, %27
  %.17 = phi i16* [ %.010, %.preheader ], [ %54, %27 ]
  %.126 = phi i32* [ %.019, %.preheader ], [ %53, %27 ]
  %.035 = phi i32 [ %4, %.preheader ], [ %28, %27 ]
  %28 = add i32 %.035, -1
  %29 = getelementptr inbounds i16, i16* %.17, i64 3
  %30 = load i16, i16* %29, align 2
  %31 = zext i16 %30 to i32
  %32 = lshr i32 %31, 4
  %33 = load i16, i16* %.17, align 2
  %34 = zext i16 %33 to i32
  %35 = mul nuw nsw i32 %34, %32
  %36 = udiv i32 %35, 69375
  %37 = getelementptr inbounds i16, i16* %.17, i64 1
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = mul nuw nsw i32 %39, %32
  %41 = udiv i32 %40, 69375
  %42 = getelementptr inbounds i16, i16* %.17, i64 2
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = mul nuw nsw i32 %44, %32
  %46 = udiv i32 %45, 69375
  %47 = shl nuw nsw i32 %41, 8
  %48 = shl nuw nsw i32 %46, 16
  %49 = shl i32 %32, 24
  %50 = or i32 %36, %49
  %51 = or i32 %50, %47
  %52 = or i32 %51, %48
  %53 = getelementptr inbounds i32, i32* %.126, i64 1
  store i32 %52, i32* %.126, align 4
  %54 = getelementptr inbounds i16, i16* %.17, i64 %18
  %55 = icmp eq i32 %28, 0
  br i1 %55, label %._crit_edge, label %27

._crit_edge:                                      ; preds = %27
  %scevgep = getelementptr i32, i32* %.019, i64 %22
  %uglygep15 = bitcast i8* %uglygep to i16*
  %56 = getelementptr inbounds i32, i32* %scevgep, i64 %16
  %57 = getelementptr inbounds i16, i16* %uglygep15, i64 %17
  %58 = icmp eq i32 %26, 0
  br i1 %58, label %._crit_edge11.loopexit, label %.preheader

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBcontig8bitCMYKtile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %11 = load i16, i16* %10, align 2
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %._crit_edge20, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %13 = zext i16 %11 to i32
  %14 = mul nsw i32 %13, %6
  %15 = icmp ugt i32 %4, 7
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  %18 = zext i16 %11 to i64
  %19 = zext i16 %11 to i64
  %20 = zext i16 %11 to i64
  %21 = zext i16 %11 to i64
  %22 = zext i16 %11 to i64
  %23 = zext i16 %11 to i64
  %24 = zext i16 %11 to i64
  %25 = zext i16 %11 to i64
  %26 = add i32 %4, -8
  %27 = lshr i32 %26, 3
  %28 = shl nuw i32 %27, 3
  %29 = zext i32 %28 to i64
  %30 = add nuw nsw i64 %29, 8
  %31 = mul nuw nsw i64 %30, %25
  %32 = shl nuw i32 %27, 3
  %33 = sub i32 %26, %32
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %509
  %.in = phi i32 [ %5, %.preheader.lr.ph ], [ %34, %509 ]
  %.0119 = phi i32* [ %1, %.preheader.lr.ph ], [ %510, %509 ]
  %.0318 = phi i8* [ %8, %.preheader.lr.ph ], [ %511, %509 ]
  %34 = add i32 %.in, -1
  br i1 %15, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %scevgep = getelementptr i8, i8* %.0318, i64 %31
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.015 = phi i32 [ %283, %.lr.ph ], [ %4, %.lr.ph.preheader ]
  %.114 = phi i32* [ %282, %.lr.ph ], [ %.0119, %.lr.ph.preheader ]
  %.1413 = phi i8* [ %281, %.lr.ph ], [ %.0318, %.lr.ph.preheader ]
  %35 = getelementptr inbounds i8, i8* %.1413, i64 3
  %36 = load i8, i8* %35, align 1
  %37 = xor i8 %36, -1
  %38 = zext i8 %37 to i16
  %39 = load i8, i8* %.1413, align 1
  %40 = xor i8 %39, -1
  %41 = zext i8 %40 to i16
  %42 = mul nuw i16 %41, %38
  %43 = udiv i16 %42, 255
  %44 = getelementptr inbounds i8, i8* %.1413, i64 1
  %45 = load i8, i8* %44, align 1
  %46 = xor i8 %45, -1
  %47 = zext i8 %46 to i16
  %48 = mul nuw i16 %47, %38
  %49 = udiv i16 %48, 255
  %50 = getelementptr inbounds i8, i8* %.1413, i64 2
  %51 = load i8, i8* %50, align 1
  %52 = xor i8 %51, -1
  %53 = zext i8 %52 to i16
  %54 = mul nuw i16 %53, %38
  %55 = udiv i16 %54, 255
  %56 = zext i16 %43 to i32
  %57 = zext i16 %49 to i32
  %58 = shl nuw nsw i32 %57, 8
  %59 = zext i16 %55 to i32
  %60 = shl nuw nsw i32 %59, 16
  %61 = or i32 %56, %58
  %62 = or i32 %61, %60
  %63 = or i32 %62, -16777216
  %64 = getelementptr inbounds i32, i32* %.114, i64 1
  store i32 %63, i32* %.114, align 4
  %65 = getelementptr inbounds i8, i8* %.1413, i64 %25
  %66 = getelementptr inbounds i8, i8* %65, i64 3
  %67 = load i8, i8* %66, align 1
  %68 = xor i8 %67, -1
  %69 = zext i8 %68 to i16
  %70 = load i8, i8* %65, align 1
  %71 = xor i8 %70, -1
  %72 = zext i8 %71 to i16
  %73 = mul nuw i16 %72, %69
  %74 = udiv i16 %73, 255
  %75 = getelementptr inbounds i8, i8* %65, i64 1
  %76 = load i8, i8* %75, align 1
  %77 = xor i8 %76, -1
  %78 = zext i8 %77 to i16
  %79 = mul nuw i16 %78, %69
  %80 = udiv i16 %79, 255
  %81 = getelementptr inbounds i8, i8* %65, i64 2
  %82 = load i8, i8* %81, align 1
  %83 = xor i8 %82, -1
  %84 = zext i8 %83 to i16
  %85 = mul nuw i16 %84, %69
  %86 = udiv i16 %85, 255
  %87 = zext i16 %74 to i32
  %88 = zext i16 %80 to i32
  %89 = shl nuw nsw i32 %88, 8
  %90 = zext i16 %86 to i32
  %91 = shl nuw nsw i32 %90, 16
  %92 = or i32 %87, %89
  %93 = or i32 %92, %91
  %94 = or i32 %93, -16777216
  %95 = getelementptr inbounds i32, i32* %.114, i64 2
  store i32 %94, i32* %64, align 4
  %96 = getelementptr inbounds i8, i8* %65, i64 %25
  %97 = getelementptr inbounds i8, i8* %96, i64 3
  %98 = load i8, i8* %97, align 1
  %99 = xor i8 %98, -1
  %100 = zext i8 %99 to i16
  %101 = load i8, i8* %96, align 1
  %102 = xor i8 %101, -1
  %103 = zext i8 %102 to i16
  %104 = mul nuw i16 %103, %100
  %105 = udiv i16 %104, 255
  %106 = getelementptr inbounds i8, i8* %96, i64 1
  %107 = load i8, i8* %106, align 1
  %108 = xor i8 %107, -1
  %109 = zext i8 %108 to i16
  %110 = mul nuw i16 %109, %100
  %111 = udiv i16 %110, 255
  %112 = getelementptr inbounds i8, i8* %96, i64 2
  %113 = load i8, i8* %112, align 1
  %114 = xor i8 %113, -1
  %115 = zext i8 %114 to i16
  %116 = mul nuw i16 %115, %100
  %117 = udiv i16 %116, 255
  %118 = zext i16 %105 to i32
  %119 = zext i16 %111 to i32
  %120 = shl nuw nsw i32 %119, 8
  %121 = zext i16 %117 to i32
  %122 = shl nuw nsw i32 %121, 16
  %123 = or i32 %118, %120
  %124 = or i32 %123, %122
  %125 = or i32 %124, -16777216
  %126 = getelementptr inbounds i32, i32* %.114, i64 3
  store i32 %125, i32* %95, align 4
  %127 = getelementptr inbounds i8, i8* %96, i64 %25
  %128 = getelementptr inbounds i8, i8* %127, i64 3
  %129 = load i8, i8* %128, align 1
  %130 = xor i8 %129, -1
  %131 = zext i8 %130 to i16
  %132 = load i8, i8* %127, align 1
  %133 = xor i8 %132, -1
  %134 = zext i8 %133 to i16
  %135 = mul nuw i16 %134, %131
  %136 = udiv i16 %135, 255
  %137 = getelementptr inbounds i8, i8* %127, i64 1
  %138 = load i8, i8* %137, align 1
  %139 = xor i8 %138, -1
  %140 = zext i8 %139 to i16
  %141 = mul nuw i16 %140, %131
  %142 = udiv i16 %141, 255
  %143 = getelementptr inbounds i8, i8* %127, i64 2
  %144 = load i8, i8* %143, align 1
  %145 = xor i8 %144, -1
  %146 = zext i8 %145 to i16
  %147 = mul nuw i16 %146, %131
  %148 = udiv i16 %147, 255
  %149 = zext i16 %136 to i32
  %150 = zext i16 %142 to i32
  %151 = shl nuw nsw i32 %150, 8
  %152 = zext i16 %148 to i32
  %153 = shl nuw nsw i32 %152, 16
  %154 = or i32 %149, %151
  %155 = or i32 %154, %153
  %156 = or i32 %155, -16777216
  %157 = getelementptr inbounds i32, i32* %.114, i64 4
  store i32 %156, i32* %126, align 4
  %158 = getelementptr inbounds i8, i8* %127, i64 %25
  %159 = getelementptr inbounds i8, i8* %158, i64 3
  %160 = load i8, i8* %159, align 1
  %161 = xor i8 %160, -1
  %162 = zext i8 %161 to i16
  %163 = load i8, i8* %158, align 1
  %164 = xor i8 %163, -1
  %165 = zext i8 %164 to i16
  %166 = mul nuw i16 %165, %162
  %167 = udiv i16 %166, 255
  %168 = getelementptr inbounds i8, i8* %158, i64 1
  %169 = load i8, i8* %168, align 1
  %170 = xor i8 %169, -1
  %171 = zext i8 %170 to i16
  %172 = mul nuw i16 %171, %162
  %173 = udiv i16 %172, 255
  %174 = getelementptr inbounds i8, i8* %158, i64 2
  %175 = load i8, i8* %174, align 1
  %176 = xor i8 %175, -1
  %177 = zext i8 %176 to i16
  %178 = mul nuw i16 %177, %162
  %179 = udiv i16 %178, 255
  %180 = zext i16 %167 to i32
  %181 = zext i16 %173 to i32
  %182 = shl nuw nsw i32 %181, 8
  %183 = zext i16 %179 to i32
  %184 = shl nuw nsw i32 %183, 16
  %185 = or i32 %180, %182
  %186 = or i32 %185, %184
  %187 = or i32 %186, -16777216
  %188 = getelementptr inbounds i32, i32* %.114, i64 5
  store i32 %187, i32* %157, align 4
  %189 = getelementptr inbounds i8, i8* %158, i64 %25
  %190 = getelementptr inbounds i8, i8* %189, i64 3
  %191 = load i8, i8* %190, align 1
  %192 = xor i8 %191, -1
  %193 = zext i8 %192 to i16
  %194 = load i8, i8* %189, align 1
  %195 = xor i8 %194, -1
  %196 = zext i8 %195 to i16
  %197 = mul nuw i16 %196, %193
  %198 = udiv i16 %197, 255
  %199 = getelementptr inbounds i8, i8* %189, i64 1
  %200 = load i8, i8* %199, align 1
  %201 = xor i8 %200, -1
  %202 = zext i8 %201 to i16
  %203 = mul nuw i16 %202, %193
  %204 = udiv i16 %203, 255
  %205 = getelementptr inbounds i8, i8* %189, i64 2
  %206 = load i8, i8* %205, align 1
  %207 = xor i8 %206, -1
  %208 = zext i8 %207 to i16
  %209 = mul nuw i16 %208, %193
  %210 = udiv i16 %209, 255
  %211 = zext i16 %198 to i32
  %212 = zext i16 %204 to i32
  %213 = shl nuw nsw i32 %212, 8
  %214 = zext i16 %210 to i32
  %215 = shl nuw nsw i32 %214, 16
  %216 = or i32 %211, %213
  %217 = or i32 %216, %215
  %218 = or i32 %217, -16777216
  %219 = getelementptr inbounds i32, i32* %.114, i64 6
  store i32 %218, i32* %188, align 4
  %220 = getelementptr inbounds i8, i8* %189, i64 %25
  %221 = getelementptr inbounds i8, i8* %220, i64 3
  %222 = load i8, i8* %221, align 1
  %223 = xor i8 %222, -1
  %224 = zext i8 %223 to i16
  %225 = load i8, i8* %220, align 1
  %226 = xor i8 %225, -1
  %227 = zext i8 %226 to i16
  %228 = mul nuw i16 %227, %224
  %229 = udiv i16 %228, 255
  %230 = getelementptr inbounds i8, i8* %220, i64 1
  %231 = load i8, i8* %230, align 1
  %232 = xor i8 %231, -1
  %233 = zext i8 %232 to i16
  %234 = mul nuw i16 %233, %224
  %235 = udiv i16 %234, 255
  %236 = getelementptr inbounds i8, i8* %220, i64 2
  %237 = load i8, i8* %236, align 1
  %238 = xor i8 %237, -1
  %239 = zext i8 %238 to i16
  %240 = mul nuw i16 %239, %224
  %241 = udiv i16 %240, 255
  %242 = zext i16 %229 to i32
  %243 = zext i16 %235 to i32
  %244 = shl nuw nsw i32 %243, 8
  %245 = zext i16 %241 to i32
  %246 = shl nuw nsw i32 %245, 16
  %247 = or i32 %242, %244
  %248 = or i32 %247, %246
  %249 = or i32 %248, -16777216
  %250 = getelementptr inbounds i32, i32* %.114, i64 7
  store i32 %249, i32* %219, align 4
  %251 = getelementptr inbounds i8, i8* %220, i64 %25
  %252 = getelementptr inbounds i8, i8* %251, i64 3
  %253 = load i8, i8* %252, align 1
  %254 = xor i8 %253, -1
  %255 = zext i8 %254 to i16
  %256 = load i8, i8* %251, align 1
  %257 = xor i8 %256, -1
  %258 = zext i8 %257 to i16
  %259 = mul nuw i16 %258, %255
  %260 = udiv i16 %259, 255
  %261 = getelementptr inbounds i8, i8* %251, i64 1
  %262 = load i8, i8* %261, align 1
  %263 = xor i8 %262, -1
  %264 = zext i8 %263 to i16
  %265 = mul nuw i16 %264, %255
  %266 = udiv i16 %265, 255
  %267 = getelementptr inbounds i8, i8* %251, i64 2
  %268 = load i8, i8* %267, align 1
  %269 = xor i8 %268, -1
  %270 = zext i8 %269 to i16
  %271 = mul nuw i16 %270, %255
  %272 = udiv i16 %271, 255
  %273 = zext i16 %260 to i32
  %274 = zext i16 %266 to i32
  %275 = shl nuw nsw i32 %274, 8
  %276 = zext i16 %272 to i32
  %277 = shl nuw nsw i32 %276, 16
  %278 = or i32 %273, %275
  %279 = or i32 %278, %277
  %280 = or i32 %279, -16777216
  store i32 %280, i32* %250, align 4
  %281 = getelementptr inbounds i8, i8* %251, i64 %25
  %282 = getelementptr inbounds i32, i32* %.114, i64 8
  %283 = add i32 %.015, -8
  %284 = icmp ugt i32 %283, 7
  br i1 %284, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %scevgep23 = getelementptr i32, i32* %.0119, i64 %30
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.14.lcssa = phi i8* [ %.0318, %.preheader ], [ %scevgep, %._crit_edge.loopexit ]
  %.1.lcssa = phi i32* [ %.0119, %.preheader ], [ %scevgep23, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ %4, %.preheader ], [ %33, %._crit_edge.loopexit ]
  switch i32 %.0.lcssa, label %509 [
    i32 1, label %477
    i32 7, label %285
    i32 6, label %317
    i32 5, label %349
    i32 4, label %381
    i32 3, label %413
    i32 2, label %445
  ]

; <label>:285:                                    ; preds = %._crit_edge
  %286 = getelementptr inbounds i8, i8* %.14.lcssa, i64 3
  %287 = load i8, i8* %286, align 1
  %288 = xor i8 %287, -1
  %289 = zext i8 %288 to i16
  %290 = load i8, i8* %.14.lcssa, align 1
  %291 = xor i8 %290, -1
  %292 = zext i8 %291 to i16
  %293 = mul nuw i16 %292, %289
  %294 = udiv i16 %293, 255
  %295 = getelementptr inbounds i8, i8* %.14.lcssa, i64 1
  %296 = load i8, i8* %295, align 1
  %297 = xor i8 %296, -1
  %298 = zext i8 %297 to i16
  %299 = mul nuw i16 %298, %289
  %300 = udiv i16 %299, 255
  %301 = getelementptr inbounds i8, i8* %.14.lcssa, i64 2
  %302 = load i8, i8* %301, align 1
  %303 = xor i8 %302, -1
  %304 = zext i8 %303 to i16
  %305 = mul nuw i16 %304, %289
  %306 = udiv i16 %305, 255
  %307 = zext i16 %294 to i32
  %308 = zext i16 %300 to i32
  %309 = shl nuw nsw i32 %308, 8
  %310 = zext i16 %306 to i32
  %311 = shl nuw nsw i32 %310, 16
  %312 = or i32 %307, %309
  %313 = or i32 %312, %311
  %314 = or i32 %313, -16777216
  %315 = getelementptr inbounds i32, i32* %.1.lcssa, i64 1
  store i32 %314, i32* %.1.lcssa, align 4
  %316 = getelementptr inbounds i8, i8* %.14.lcssa, i64 %19
  br label %317

; <label>:317:                                    ; preds = %._crit_edge, %285
  %.25 = phi i8* [ %316, %285 ], [ %.14.lcssa, %._crit_edge ]
  %.2 = phi i32* [ %315, %285 ], [ %.1.lcssa, %._crit_edge ]
  %318 = getelementptr inbounds i8, i8* %.25, i64 3
  %319 = load i8, i8* %318, align 1
  %320 = xor i8 %319, -1
  %321 = zext i8 %320 to i16
  %322 = load i8, i8* %.25, align 1
  %323 = xor i8 %322, -1
  %324 = zext i8 %323 to i16
  %325 = mul nuw i16 %324, %321
  %326 = udiv i16 %325, 255
  %327 = getelementptr inbounds i8, i8* %.25, i64 1
  %328 = load i8, i8* %327, align 1
  %329 = xor i8 %328, -1
  %330 = zext i8 %329 to i16
  %331 = mul nuw i16 %330, %321
  %332 = udiv i16 %331, 255
  %333 = getelementptr inbounds i8, i8* %.25, i64 2
  %334 = load i8, i8* %333, align 1
  %335 = xor i8 %334, -1
  %336 = zext i8 %335 to i16
  %337 = mul nuw i16 %336, %321
  %338 = udiv i16 %337, 255
  %339 = zext i16 %326 to i32
  %340 = zext i16 %332 to i32
  %341 = shl nuw nsw i32 %340, 8
  %342 = zext i16 %338 to i32
  %343 = shl nuw nsw i32 %342, 16
  %344 = or i32 %339, %341
  %345 = or i32 %344, %343
  %346 = or i32 %345, -16777216
  %347 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %346, i32* %.2, align 4
  %348 = getelementptr inbounds i8, i8* %.25, i64 %20
  br label %349

; <label>:349:                                    ; preds = %._crit_edge, %317
  %.36 = phi i8* [ %348, %317 ], [ %.14.lcssa, %._crit_edge ]
  %.3 = phi i32* [ %347, %317 ], [ %.1.lcssa, %._crit_edge ]
  %350 = getelementptr inbounds i8, i8* %.36, i64 3
  %351 = load i8, i8* %350, align 1
  %352 = xor i8 %351, -1
  %353 = zext i8 %352 to i16
  %354 = load i8, i8* %.36, align 1
  %355 = xor i8 %354, -1
  %356 = zext i8 %355 to i16
  %357 = mul nuw i16 %356, %353
  %358 = udiv i16 %357, 255
  %359 = getelementptr inbounds i8, i8* %.36, i64 1
  %360 = load i8, i8* %359, align 1
  %361 = xor i8 %360, -1
  %362 = zext i8 %361 to i16
  %363 = mul nuw i16 %362, %353
  %364 = udiv i16 %363, 255
  %365 = getelementptr inbounds i8, i8* %.36, i64 2
  %366 = load i8, i8* %365, align 1
  %367 = xor i8 %366, -1
  %368 = zext i8 %367 to i16
  %369 = mul nuw i16 %368, %353
  %370 = udiv i16 %369, 255
  %371 = zext i16 %358 to i32
  %372 = zext i16 %364 to i32
  %373 = shl nuw nsw i32 %372, 8
  %374 = zext i16 %370 to i32
  %375 = shl nuw nsw i32 %374, 16
  %376 = or i32 %371, %373
  %377 = or i32 %376, %375
  %378 = or i32 %377, -16777216
  %379 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %378, i32* %.3, align 4
  %380 = getelementptr inbounds i8, i8* %.36, i64 %21
  br label %381

; <label>:381:                                    ; preds = %._crit_edge, %349
  %.47 = phi i8* [ %380, %349 ], [ %.14.lcssa, %._crit_edge ]
  %.4 = phi i32* [ %379, %349 ], [ %.1.lcssa, %._crit_edge ]
  %382 = getelementptr inbounds i8, i8* %.47, i64 3
  %383 = load i8, i8* %382, align 1
  %384 = xor i8 %383, -1
  %385 = zext i8 %384 to i16
  %386 = load i8, i8* %.47, align 1
  %387 = xor i8 %386, -1
  %388 = zext i8 %387 to i16
  %389 = mul nuw i16 %388, %385
  %390 = udiv i16 %389, 255
  %391 = getelementptr inbounds i8, i8* %.47, i64 1
  %392 = load i8, i8* %391, align 1
  %393 = xor i8 %392, -1
  %394 = zext i8 %393 to i16
  %395 = mul nuw i16 %394, %385
  %396 = udiv i16 %395, 255
  %397 = getelementptr inbounds i8, i8* %.47, i64 2
  %398 = load i8, i8* %397, align 1
  %399 = xor i8 %398, -1
  %400 = zext i8 %399 to i16
  %401 = mul nuw i16 %400, %385
  %402 = udiv i16 %401, 255
  %403 = zext i16 %390 to i32
  %404 = zext i16 %396 to i32
  %405 = shl nuw nsw i32 %404, 8
  %406 = zext i16 %402 to i32
  %407 = shl nuw nsw i32 %406, 16
  %408 = or i32 %403, %405
  %409 = or i32 %408, %407
  %410 = or i32 %409, -16777216
  %411 = getelementptr inbounds i32, i32* %.4, i64 1
  store i32 %410, i32* %.4, align 4
  %412 = getelementptr inbounds i8, i8* %.47, i64 %22
  br label %413

; <label>:413:                                    ; preds = %._crit_edge, %381
  %.58 = phi i8* [ %412, %381 ], [ %.14.lcssa, %._crit_edge ]
  %.5 = phi i32* [ %411, %381 ], [ %.1.lcssa, %._crit_edge ]
  %414 = getelementptr inbounds i8, i8* %.58, i64 3
  %415 = load i8, i8* %414, align 1
  %416 = xor i8 %415, -1
  %417 = zext i8 %416 to i16
  %418 = load i8, i8* %.58, align 1
  %419 = xor i8 %418, -1
  %420 = zext i8 %419 to i16
  %421 = mul nuw i16 %420, %417
  %422 = udiv i16 %421, 255
  %423 = getelementptr inbounds i8, i8* %.58, i64 1
  %424 = load i8, i8* %423, align 1
  %425 = xor i8 %424, -1
  %426 = zext i8 %425 to i16
  %427 = mul nuw i16 %426, %417
  %428 = udiv i16 %427, 255
  %429 = getelementptr inbounds i8, i8* %.58, i64 2
  %430 = load i8, i8* %429, align 1
  %431 = xor i8 %430, -1
  %432 = zext i8 %431 to i16
  %433 = mul nuw i16 %432, %417
  %434 = udiv i16 %433, 255
  %435 = zext i16 %422 to i32
  %436 = zext i16 %428 to i32
  %437 = shl nuw nsw i32 %436, 8
  %438 = zext i16 %434 to i32
  %439 = shl nuw nsw i32 %438, 16
  %440 = or i32 %435, %437
  %441 = or i32 %440, %439
  %442 = or i32 %441, -16777216
  %443 = getelementptr inbounds i32, i32* %.5, i64 1
  store i32 %442, i32* %.5, align 4
  %444 = getelementptr inbounds i8, i8* %.58, i64 %23
  br label %445

; <label>:445:                                    ; preds = %._crit_edge, %413
  %.69 = phi i8* [ %444, %413 ], [ %.14.lcssa, %._crit_edge ]
  %.6 = phi i32* [ %443, %413 ], [ %.1.lcssa, %._crit_edge ]
  %446 = getelementptr inbounds i8, i8* %.69, i64 3
  %447 = load i8, i8* %446, align 1
  %448 = xor i8 %447, -1
  %449 = zext i8 %448 to i16
  %450 = load i8, i8* %.69, align 1
  %451 = xor i8 %450, -1
  %452 = zext i8 %451 to i16
  %453 = mul nuw i16 %452, %449
  %454 = udiv i16 %453, 255
  %455 = getelementptr inbounds i8, i8* %.69, i64 1
  %456 = load i8, i8* %455, align 1
  %457 = xor i8 %456, -1
  %458 = zext i8 %457 to i16
  %459 = mul nuw i16 %458, %449
  %460 = udiv i16 %459, 255
  %461 = getelementptr inbounds i8, i8* %.69, i64 2
  %462 = load i8, i8* %461, align 1
  %463 = xor i8 %462, -1
  %464 = zext i8 %463 to i16
  %465 = mul nuw i16 %464, %449
  %466 = udiv i16 %465, 255
  %467 = zext i16 %454 to i32
  %468 = zext i16 %460 to i32
  %469 = shl nuw nsw i32 %468, 8
  %470 = zext i16 %466 to i32
  %471 = shl nuw nsw i32 %470, 16
  %472 = or i32 %467, %469
  %473 = or i32 %472, %471
  %474 = or i32 %473, -16777216
  %475 = getelementptr inbounds i32, i32* %.6, i64 1
  store i32 %474, i32* %.6, align 4
  %476 = getelementptr inbounds i8, i8* %.69, i64 %24
  br label %477

; <label>:477:                                    ; preds = %._crit_edge, %445
  %.710 = phi i8* [ %476, %445 ], [ %.14.lcssa, %._crit_edge ]
  %.7 = phi i32* [ %475, %445 ], [ %.1.lcssa, %._crit_edge ]
  %478 = getelementptr inbounds i8, i8* %.710, i64 3
  %479 = load i8, i8* %478, align 1
  %480 = xor i8 %479, -1
  %481 = zext i8 %480 to i16
  %482 = load i8, i8* %.710, align 1
  %483 = xor i8 %482, -1
  %484 = zext i8 %483 to i16
  %485 = mul nuw i16 %484, %481
  %486 = udiv i16 %485, 255
  %487 = getelementptr inbounds i8, i8* %.710, i64 1
  %488 = load i8, i8* %487, align 1
  %489 = xor i8 %488, -1
  %490 = zext i8 %489 to i16
  %491 = mul nuw i16 %490, %481
  %492 = udiv i16 %491, 255
  %493 = getelementptr inbounds i8, i8* %.710, i64 2
  %494 = load i8, i8* %493, align 1
  %495 = xor i8 %494, -1
  %496 = zext i8 %495 to i16
  %497 = mul nuw i16 %496, %481
  %498 = udiv i16 %497, 255
  %499 = zext i16 %486 to i32
  %500 = zext i16 %492 to i32
  %501 = shl nuw nsw i32 %500, 8
  %502 = zext i16 %498 to i32
  %503 = shl nuw nsw i32 %502, 16
  %504 = or i32 %499, %501
  %505 = or i32 %504, %503
  %506 = or i32 %505, -16777216
  %507 = getelementptr inbounds i32, i32* %.7, i64 1
  store i32 %506, i32* %.7, align 4
  %508 = getelementptr inbounds i8, i8* %.710, i64 %18
  br label %509

; <label>:509:                                    ; preds = %477, %._crit_edge
  %.912 = phi i8* [ %508, %477 ], [ %.14.lcssa, %._crit_edge ]
  %.9 = phi i32* [ %507, %477 ], [ %.1.lcssa, %._crit_edge ]
  %510 = getelementptr inbounds i32, i32* %.9, i64 %16
  %511 = getelementptr inbounds i8, i8* %.912, i64 %17
  %512 = icmp eq i32 %34, 0
  br i1 %512, label %._crit_edge20.loopexit, label %.preheader

._crit_edge20.loopexit:                           ; preds = %509
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBcontig8bitCMYKMaptile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 7
  %11 = load i16, i16* %10, align 2
  %12 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %13 = load i8*, i8** %12, align 8
  %14 = icmp eq i32 %5, 0
  br i1 %14, label %._crit_edge11, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %15 = zext i16 %11 to i32
  %16 = mul nsw i32 %15, %6
  %17 = icmp eq i32 %4, 0
  %18 = sext i32 %16 to i64
  %19 = sext i32 %7 to i64
  %20 = zext i16 %11 to i64
  br i1 %17, label %._crit_edge11, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %21 = add i32 %4, -1
  %22 = zext i32 %21 to i64
  %23 = add nuw nsw i64 %22, 1
  %24 = mul nuw nsw i64 %23, %20
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.in = phi i32 [ %25, %._crit_edge ], [ %5, %.preheader.preheader ]
  %.010 = phi i8* [ %69, %._crit_edge ], [ %8, %.preheader.preheader ]
  %.019 = phi i32* [ %70, %._crit_edge ], [ %1, %.preheader.preheader ]
  %25 = add i32 %.in, -1
  %scevgep = getelementptr i32, i32* %.019, i64 %23
  br label %26

; <label>:26:                                     ; preds = %.preheader, %26
  %.17 = phi i8* [ %.010, %.preheader ], [ %67, %26 ]
  %.126 = phi i32* [ %.019, %.preheader ], [ %66, %26 ]
  %.035 = phi i32 [ %4, %.preheader ], [ %27, %26 ]
  %27 = add i32 %.035, -1
  %28 = getelementptr inbounds i8, i8* %.17, i64 3
  %29 = load i8, i8* %28, align 1
  %30 = xor i8 %29, -1
  %31 = zext i8 %30 to i16
  %32 = load i8, i8* %.17, align 1
  %33 = xor i8 %32, -1
  %34 = zext i8 %33 to i16
  %35 = mul nuw i16 %34, %31
  %36 = udiv i16 %35, 255
  %37 = getelementptr inbounds i8, i8* %.17, i64 1
  %38 = load i8, i8* %37, align 1
  %39 = xor i8 %38, -1
  %40 = zext i8 %39 to i16
  %41 = mul nuw i16 %40, %31
  %42 = udiv i16 %41, 255
  %43 = getelementptr inbounds i8, i8* %.17, i64 2
  %44 = load i8, i8* %43, align 1
  %45 = xor i8 %44, -1
  %46 = zext i8 %45 to i16
  %47 = mul nuw i16 %46, %31
  %48 = udiv i16 %47, 255
  %49 = zext i16 %36 to i64
  %50 = getelementptr inbounds i8, i8* %13, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = zext i16 %42 to i64
  %54 = getelementptr inbounds i8, i8* %13, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = shl nuw nsw i32 %56, 8
  %58 = zext i16 %48 to i64
  %59 = getelementptr inbounds i8, i8* %13, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = shl nuw nsw i32 %61, 16
  %63 = or i32 %52, %57
  %64 = or i32 %63, %62
  %65 = or i32 %64, -16777216
  %66 = getelementptr inbounds i32, i32* %.126, i64 1
  store i32 %65, i32* %.126, align 4
  %67 = getelementptr inbounds i8, i8* %.17, i64 %20
  %68 = icmp eq i32 %27, 0
  br i1 %68, label %._crit_edge, label %26

._crit_edge:                                      ; preds = %26
  %scevgep14 = getelementptr i8, i8* %.010, i64 %24
  %69 = getelementptr inbounds i8, i8* %scevgep14, i64 %18
  %70 = getelementptr inbounds i32, i32* %scevgep, i64 %19
  %71 = icmp eq i32 %25, 0
  br i1 %71, label %._crit_edge11.loopexit, label %.preheader

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @put8bitcmaptile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 17
  %11 = load i32**, i32*** %10, align 8
  %12 = add i32 %5, -1
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge20, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %14 = icmp ugt i32 %4, 7
  %15 = sext i32 %7 to i64
  %16 = sext i32 %6 to i64
  br i1 %14, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %17 = add i32 %4, -8
  %18 = lshr i32 %17, 3
  %19 = shl nuw i32 %18, 3
  %20 = sub i32 %4, %19
  %21 = shl nuw i32 %18, 3
  %22 = zext i32 %21 to i64
  %23 = add nuw nsw i64 %22, 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %81
  %24 = phi i32 [ %84, %81 ], [ %12, %.preheader.us.preheader ]
  %.0119.us = phi i32* [ %82, %81 ], [ %1, %.preheader.us.preheader ]
  %.0218.us = phi i8* [ %83, %81 ], [ %8, %.preheader.us.preheader ]
  %scevgep = getelementptr i32, i32* %.0119.us, i64 %22
  %scevgep24 = getelementptr i32, i32* %.0119.us, i64 %23
  br label %86

; <label>:25:                                     ; preds = %._crit_edge.us
  %scevgep23 = getelementptr i8, i8* %.0218.us, i64 %22
  %26 = getelementptr inbounds i8, i8* %scevgep23, i64 9
  %27 = load i8, i8* %scevgep25, align 1
  %28 = zext i8 %27 to i64
  %29 = getelementptr inbounds i32*, i32** %11, i64 %28
  %30 = load i32*, i32** %29, align 8
  %31 = load i32, i32* %30, align 4
  %32 = getelementptr inbounds i32, i32* %scevgep, i64 9
  store i32 %31, i32* %scevgep24, align 4
  br label %33

; <label>:33:                                     ; preds = %25, %._crit_edge.us
  %.24.us = phi i8* [ %26, %25 ], [ %scevgep25, %._crit_edge.us ]
  %.2.us = phi i32* [ %32, %25 ], [ %scevgep24, %._crit_edge.us ]
  %34 = getelementptr inbounds i8, i8* %.24.us, i64 1
  %35 = load i8, i8* %.24.us, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds i32*, i32** %11, i64 %36
  %38 = load i32*, i32** %37, align 8
  %39 = load i32, i32* %38, align 4
  %40 = getelementptr inbounds i32, i32* %.2.us, i64 1
  store i32 %39, i32* %.2.us, align 4
  br label %41

; <label>:41:                                     ; preds = %33, %._crit_edge.us
  %.35.us = phi i8* [ %34, %33 ], [ %scevgep25, %._crit_edge.us ]
  %.3.us = phi i32* [ %40, %33 ], [ %scevgep24, %._crit_edge.us ]
  %42 = getelementptr inbounds i8, i8* %.35.us, i64 1
  %43 = load i8, i8* %.35.us, align 1
  %44 = zext i8 %43 to i64
  %45 = getelementptr inbounds i32*, i32** %11, i64 %44
  %46 = load i32*, i32** %45, align 8
  %47 = load i32, i32* %46, align 4
  %48 = getelementptr inbounds i32, i32* %.3.us, i64 1
  store i32 %47, i32* %.3.us, align 4
  br label %49

; <label>:49:                                     ; preds = %41, %._crit_edge.us
  %.46.us = phi i8* [ %42, %41 ], [ %scevgep25, %._crit_edge.us ]
  %.4.us = phi i32* [ %48, %41 ], [ %scevgep24, %._crit_edge.us ]
  %50 = getelementptr inbounds i8, i8* %.46.us, i64 1
  %51 = load i8, i8* %.46.us, align 1
  %52 = zext i8 %51 to i64
  %53 = getelementptr inbounds i32*, i32** %11, i64 %52
  %54 = load i32*, i32** %53, align 8
  %55 = load i32, i32* %54, align 4
  %56 = getelementptr inbounds i32, i32* %.4.us, i64 1
  store i32 %55, i32* %.4.us, align 4
  br label %57

; <label>:57:                                     ; preds = %49, %._crit_edge.us
  %.57.us = phi i8* [ %50, %49 ], [ %scevgep25, %._crit_edge.us ]
  %.5.us = phi i32* [ %56, %49 ], [ %scevgep24, %._crit_edge.us ]
  %58 = getelementptr inbounds i8, i8* %.57.us, i64 1
  %59 = load i8, i8* %.57.us, align 1
  %60 = zext i8 %59 to i64
  %61 = getelementptr inbounds i32*, i32** %11, i64 %60
  %62 = load i32*, i32** %61, align 8
  %63 = load i32, i32* %62, align 4
  %64 = getelementptr inbounds i32, i32* %.5.us, i64 1
  store i32 %63, i32* %.5.us, align 4
  br label %65

; <label>:65:                                     ; preds = %57, %._crit_edge.us
  %.68.us = phi i8* [ %58, %57 ], [ %scevgep25, %._crit_edge.us ]
  %.6.us = phi i32* [ %64, %57 ], [ %scevgep24, %._crit_edge.us ]
  %66 = getelementptr inbounds i8, i8* %.68.us, i64 1
  %67 = load i8, i8* %.68.us, align 1
  %68 = zext i8 %67 to i64
  %69 = getelementptr inbounds i32*, i32** %11, i64 %68
  %70 = load i32*, i32** %69, align 8
  %71 = load i32, i32* %70, align 4
  %72 = getelementptr inbounds i32, i32* %.6.us, i64 1
  store i32 %71, i32* %.6.us, align 4
  br label %73

; <label>:73:                                     ; preds = %65, %._crit_edge.us
  %.79.us = phi i8* [ %66, %65 ], [ %scevgep25, %._crit_edge.us ]
  %.7.us = phi i32* [ %72, %65 ], [ %scevgep24, %._crit_edge.us ]
  %74 = getelementptr inbounds i8, i8* %.79.us, i64 1
  %75 = load i8, i8* %.79.us, align 1
  %76 = zext i8 %75 to i64
  %77 = getelementptr inbounds i32*, i32** %11, i64 %76
  %78 = load i32*, i32** %77, align 8
  %79 = load i32, i32* %78, align 4
  %80 = getelementptr inbounds i32, i32* %.7.us, i64 1
  store i32 %79, i32* %.7.us, align 4
  br label %81

; <label>:81:                                     ; preds = %73, %._crit_edge.us
  %.911.us = phi i8* [ %74, %73 ], [ %scevgep25, %._crit_edge.us ]
  %.9.us = phi i32* [ %80, %73 ], [ %scevgep24, %._crit_edge.us ]
  %82 = getelementptr inbounds i32, i32* %.9.us, i64 %15
  %83 = getelementptr inbounds i8, i8* %.911.us, i64 %16
  %84 = add i32 %24, -1
  %85 = icmp eq i32 %24, 0
  br i1 %85, label %._crit_edge20.loopexit, label %.preheader.us

; <label>:86:                                     ; preds = %.preheader.us, %86
  %.015.us = phi i32 [ %4, %.preheader.us ], [ %143, %86 ]
  %.114.us = phi i32* [ %.0119.us, %.preheader.us ], [ %141, %86 ]
  %.1313.us = phi i8* [ %.0218.us, %.preheader.us ], [ %142, %86 ]
  %87 = getelementptr inbounds i8, i8* %.1313.us, i64 1
  %88 = load i8, i8* %.1313.us, align 1
  %89 = zext i8 %88 to i64
  %90 = getelementptr inbounds i32*, i32** %11, i64 %89
  %91 = load i32*, i32** %90, align 8
  %92 = load i32, i32* %91, align 4
  %93 = getelementptr inbounds i32, i32* %.114.us, i64 1
  store i32 %92, i32* %.114.us, align 4
  %94 = getelementptr inbounds i8, i8* %.1313.us, i64 2
  %95 = load i8, i8* %87, align 1
  %96 = zext i8 %95 to i64
  %97 = getelementptr inbounds i32*, i32** %11, i64 %96
  %98 = load i32*, i32** %97, align 8
  %99 = load i32, i32* %98, align 4
  %100 = getelementptr inbounds i32, i32* %.114.us, i64 2
  store i32 %99, i32* %93, align 4
  %101 = getelementptr inbounds i8, i8* %.1313.us, i64 3
  %102 = load i8, i8* %94, align 1
  %103 = zext i8 %102 to i64
  %104 = getelementptr inbounds i32*, i32** %11, i64 %103
  %105 = load i32*, i32** %104, align 8
  %106 = load i32, i32* %105, align 4
  %107 = getelementptr inbounds i32, i32* %.114.us, i64 3
  store i32 %106, i32* %100, align 4
  %108 = getelementptr inbounds i8, i8* %.1313.us, i64 4
  %109 = load i8, i8* %101, align 1
  %110 = zext i8 %109 to i64
  %111 = getelementptr inbounds i32*, i32** %11, i64 %110
  %112 = load i32*, i32** %111, align 8
  %113 = load i32, i32* %112, align 4
  %114 = getelementptr inbounds i32, i32* %.114.us, i64 4
  store i32 %113, i32* %107, align 4
  %115 = getelementptr inbounds i8, i8* %.1313.us, i64 5
  %116 = load i8, i8* %108, align 1
  %117 = zext i8 %116 to i64
  %118 = getelementptr inbounds i32*, i32** %11, i64 %117
  %119 = load i32*, i32** %118, align 8
  %120 = load i32, i32* %119, align 4
  %121 = getelementptr inbounds i32, i32* %.114.us, i64 5
  store i32 %120, i32* %114, align 4
  %122 = getelementptr inbounds i8, i8* %.1313.us, i64 6
  %123 = load i8, i8* %115, align 1
  %124 = zext i8 %123 to i64
  %125 = getelementptr inbounds i32*, i32** %11, i64 %124
  %126 = load i32*, i32** %125, align 8
  %127 = load i32, i32* %126, align 4
  %128 = getelementptr inbounds i32, i32* %.114.us, i64 6
  store i32 %127, i32* %121, align 4
  %129 = getelementptr inbounds i8, i8* %.1313.us, i64 7
  %130 = load i8, i8* %122, align 1
  %131 = zext i8 %130 to i64
  %132 = getelementptr inbounds i32*, i32** %11, i64 %131
  %133 = load i32*, i32** %132, align 8
  %134 = load i32, i32* %133, align 4
  %135 = getelementptr inbounds i32, i32* %.114.us, i64 7
  store i32 %134, i32* %128, align 4
  %136 = load i8, i8* %129, align 1
  %137 = zext i8 %136 to i64
  %138 = getelementptr inbounds i32*, i32** %11, i64 %137
  %139 = load i32*, i32** %138, align 8
  %140 = load i32, i32* %139, align 4
  store i32 %140, i32* %135, align 4
  %141 = getelementptr inbounds i32, i32* %.114.us, i64 8
  %142 = getelementptr inbounds i8, i8* %.1313.us, i64 8
  %143 = add i32 %.015.us, -8
  %144 = icmp ugt i32 %143, 7
  br i1 %144, label %86, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %86
  %scevgep25 = getelementptr i8, i8* %.0218.us, i64 %23
  switch i32 %20, label %81 [
    i32 9, label %73
    i32 15, label %25
    i32 14, label %33
    i32 13, label %41
    i32 12, label %49
    i32 11, label %57
    i32 10, label %65
  ]

.preheader:                                       ; preds = %.preheader.preheader, %202
  %145 = phi i32 [ %205, %202 ], [ %12, %.preheader.preheader ]
  %.0119 = phi i32* [ %203, %202 ], [ %1, %.preheader.preheader ]
  %.0218 = phi i8* [ %204, %202 ], [ %8, %.preheader.preheader ]
  switch i32 %4, label %202 [
    i32 1, label %194
    i32 7, label %146
    i32 6, label %154
    i32 5, label %162
    i32 4, label %170
    i32 3, label %178
    i32 2, label %186
  ]

; <label>:146:                                    ; preds = %.preheader
  %147 = getelementptr inbounds i8, i8* %.0218, i64 1
  %148 = load i8, i8* %.0218, align 1
  %149 = zext i8 %148 to i64
  %150 = getelementptr inbounds i32*, i32** %11, i64 %149
  %151 = load i32*, i32** %150, align 8
  %152 = load i32, i32* %151, align 4
  %153 = getelementptr inbounds i32, i32* %.0119, i64 1
  store i32 %152, i32* %.0119, align 4
  br label %154

; <label>:154:                                    ; preds = %.preheader, %146
  %.24 = phi i8* [ %147, %146 ], [ %.0218, %.preheader ]
  %.2 = phi i32* [ %153, %146 ], [ %.0119, %.preheader ]
  %155 = getelementptr inbounds i8, i8* %.24, i64 1
  %156 = load i8, i8* %.24, align 1
  %157 = zext i8 %156 to i64
  %158 = getelementptr inbounds i32*, i32** %11, i64 %157
  %159 = load i32*, i32** %158, align 8
  %160 = load i32, i32* %159, align 4
  %161 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %160, i32* %.2, align 4
  br label %162

; <label>:162:                                    ; preds = %.preheader, %154
  %.35 = phi i8* [ %155, %154 ], [ %.0218, %.preheader ]
  %.3 = phi i32* [ %161, %154 ], [ %.0119, %.preheader ]
  %163 = getelementptr inbounds i8, i8* %.35, i64 1
  %164 = load i8, i8* %.35, align 1
  %165 = zext i8 %164 to i64
  %166 = getelementptr inbounds i32*, i32** %11, i64 %165
  %167 = load i32*, i32** %166, align 8
  %168 = load i32, i32* %167, align 4
  %169 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %168, i32* %.3, align 4
  br label %170

; <label>:170:                                    ; preds = %.preheader, %162
  %.46 = phi i8* [ %163, %162 ], [ %.0218, %.preheader ]
  %.4 = phi i32* [ %169, %162 ], [ %.0119, %.preheader ]
  %171 = getelementptr inbounds i8, i8* %.46, i64 1
  %172 = load i8, i8* %.46, align 1
  %173 = zext i8 %172 to i64
  %174 = getelementptr inbounds i32*, i32** %11, i64 %173
  %175 = load i32*, i32** %174, align 8
  %176 = load i32, i32* %175, align 4
  %177 = getelementptr inbounds i32, i32* %.4, i64 1
  store i32 %176, i32* %.4, align 4
  br label %178

; <label>:178:                                    ; preds = %.preheader, %170
  %.57 = phi i8* [ %171, %170 ], [ %.0218, %.preheader ]
  %.5 = phi i32* [ %177, %170 ], [ %.0119, %.preheader ]
  %179 = getelementptr inbounds i8, i8* %.57, i64 1
  %180 = load i8, i8* %.57, align 1
  %181 = zext i8 %180 to i64
  %182 = getelementptr inbounds i32*, i32** %11, i64 %181
  %183 = load i32*, i32** %182, align 8
  %184 = load i32, i32* %183, align 4
  %185 = getelementptr inbounds i32, i32* %.5, i64 1
  store i32 %184, i32* %.5, align 4
  br label %186

; <label>:186:                                    ; preds = %.preheader, %178
  %.68 = phi i8* [ %179, %178 ], [ %.0218, %.preheader ]
  %.6 = phi i32* [ %185, %178 ], [ %.0119, %.preheader ]
  %187 = getelementptr inbounds i8, i8* %.68, i64 1
  %188 = load i8, i8* %.68, align 1
  %189 = zext i8 %188 to i64
  %190 = getelementptr inbounds i32*, i32** %11, i64 %189
  %191 = load i32*, i32** %190, align 8
  %192 = load i32, i32* %191, align 4
  %193 = getelementptr inbounds i32, i32* %.6, i64 1
  store i32 %192, i32* %.6, align 4
  br label %194

; <label>:194:                                    ; preds = %.preheader, %186
  %.79 = phi i8* [ %187, %186 ], [ %.0218, %.preheader ]
  %.7 = phi i32* [ %193, %186 ], [ %.0119, %.preheader ]
  %195 = getelementptr inbounds i8, i8* %.79, i64 1
  %196 = load i8, i8* %.79, align 1
  %197 = zext i8 %196 to i64
  %198 = getelementptr inbounds i32*, i32** %11, i64 %197
  %199 = load i32*, i32** %198, align 8
  %200 = load i32, i32* %199, align 4
  %201 = getelementptr inbounds i32, i32* %.7, i64 1
  store i32 %200, i32* %.7, align 4
  br label %202

; <label>:202:                                    ; preds = %194, %.preheader
  %.911 = phi i8* [ %195, %194 ], [ %.0218, %.preheader ]
  %.9 = phi i32* [ %201, %194 ], [ %.0119, %.preheader ]
  %203 = getelementptr inbounds i32, i32* %.9, i64 %15
  %204 = getelementptr inbounds i8, i8* %.911, i64 %16
  %205 = add i32 %145, -1
  %206 = icmp eq i32 %145, 0
  br i1 %206, label %._crit_edge20.loopexit28, label %.preheader

._crit_edge20.loopexit:                           ; preds = %81
  br label %._crit_edge20

._crit_edge20.loopexit28:                         ; preds = %202
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit28, %._crit_edge20.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @put4bitcmaptile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 17
  %11 = load i32**, i32*** %10, align 8
  %12 = add i32 %5, -1
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge13, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %14 = sdiv i32 %6, 2
  %15 = icmp ugt i32 %4, 1
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  br i1 %15, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %xtraiter20 = and i32 %5, 1
  %lcmp.mod21 = icmp eq i32 %xtraiter20, 0
  br i1 %lcmp.mod21, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %18 = icmp eq i32 %4, 0
  br i1 %18, label %27, label %19

; <label>:19:                                     ; preds = %.preheader.prol
  %20 = getelementptr inbounds i8, i8* %8, i64 1
  %21 = load i8, i8* %8, align 1
  %22 = zext i8 %21 to i64
  %23 = getelementptr inbounds i32*, i32** %11, i64 %22
  %24 = load i32*, i32** %23, align 8
  %25 = load i32, i32* %24, align 4
  %26 = getelementptr inbounds i32, i32* %1, i64 1
  store i32 %25, i32* %1, align 4
  br label %27

; <label>:27:                                     ; preds = %19, %.preheader.prol
  %.24.prol = phi i8* [ %20, %19 ], [ %8, %.preheader.prol ]
  %.2.prol = phi i32* [ %26, %19 ], [ %1, %.preheader.prol ]
  %28 = getelementptr inbounds i32, i32* %.2.prol, i64 %16
  %29 = getelementptr inbounds i8, i8* %.24.prol, i64 %17
  %30 = add i32 %5, -2
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader, %27
  %.unr = phi i32 [ %12, %.preheader.preheader ], [ %30, %27 ]
  %.0112.unr = phi i32* [ %1, %.preheader.preheader ], [ %28, %27 ]
  %.0211.unr = phi i8* [ %8, %.preheader.preheader ], [ %29, %27 ]
  %31 = icmp eq i32 %12, 0
  br i1 %31, label %._crit_edge13, label %.preheader.preheader23

.preheader.preheader23:                           ; preds = %.preheader.prol.loopexit
  %32 = icmp eq i32 %4, 0
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %33 = add i32 %4, -2
  %34 = lshr i32 %33, 1
  %35 = zext i32 %34 to i64
  %36 = shl nuw i32 %34, 1
  %37 = zext i32 %36 to i64
  %38 = add nuw nsw i64 %37, 2
  %39 = add nuw nsw i64 %35, 1
  %40 = shl nuw i32 %34, 1
  %41 = and i32 %34, 1
  %lcmp.mod = icmp eq i32 %41, 0
  %42 = add i32 %4, -2
  %43 = icmp eq i32 %34, 0
  %44 = icmp eq i32 %33, %40
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %62
  %45 = phi i32 [ %69, %62 ], [ %12, %.preheader.us.preheader ]
  %.0112.us = phi i32* [ %67, %62 ], [ %1, %.preheader.us.preheader ]
  %.0211.us = phi i8* [ %68, %62 ], [ %8, %.preheader.us.preheader ]
  %scevgep = getelementptr i32, i32* %.0112.us, i64 %37
  %scevgep18 = getelementptr i32, i32* %.0112.us, i64 %38
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %46 = load i8, i8* %.0211.us, align 1
  %47 = zext i8 %46 to i64
  %48 = getelementptr inbounds i32*, i32** %11, i64 %47
  %49 = load i32*, i32** %48, align 8
  %50 = getelementptr inbounds i32, i32* %49, i64 1
  %51 = load i32, i32* %49, align 4
  %52 = getelementptr inbounds i32, i32* %.0112.us, i64 1
  store i32 %51, i32* %.0112.us, align 4
  %53 = load i32, i32* %50, align 4
  store i32 %53, i32* %52, align 4
  %54 = getelementptr inbounds i32, i32* %.0112.us, i64 2
  %55 = getelementptr inbounds i8, i8* %.0211.us, i64 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %.08.us.unr.ph = phi i32 [ %42, %.prol.preheader ], [ %4, %.preheader.us ]
  %.17.us.unr.ph = phi i32* [ %54, %.prol.preheader ], [ %.0112.us, %.preheader.us ]
  %.136.us.unr.ph = phi i8* [ %55, %.prol.preheader ], [ %.0211.us, %.preheader.us ]
  br i1 %43, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

; <label>:56:                                     ; preds = %._crit_edge.us
  %scevgep19 = getelementptr i8, i8* %.0211.us, i64 %39
  %57 = load i8, i8* %scevgep19, align 1
  %58 = zext i8 %57 to i64
  %59 = getelementptr inbounds i32*, i32** %11, i64 %58
  %60 = load i32*, i32** %59, align 8
  %61 = load i32, i32* %60, align 4
  store i32 %61, i32* %scevgep18, align 4
  br label %62

; <label>:62:                                     ; preds = %56, %._crit_edge.us
  %63 = phi i64 [ 2, %56 ], [ 1, %._crit_edge.us ]
  %64 = phi i64 [ 3, %56 ], [ 2, %._crit_edge.us ]
  %65 = getelementptr inbounds i8, i8* %scevgep17, i64 %63
  %66 = getelementptr inbounds i32, i32* %scevgep, i64 %64
  %67 = getelementptr inbounds i32, i32* %66, i64 %16
  %68 = getelementptr inbounds i8, i8* %65, i64 %17
  %69 = add i32 %45, -1
  %70 = icmp eq i32 %45, 0
  br i1 %70, label %._crit_edge13.loopexit, label %.preheader.us

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %.08.us = phi i32 [ %91, %.preheader.us.new ], [ %.08.us.unr.ph, %.preheader.us.new.preheader ]
  %.17.us = phi i32* [ %89, %.preheader.us.new ], [ %.17.us.unr.ph, %.preheader.us.new.preheader ]
  %.136.us = phi i8* [ %90, %.preheader.us.new ], [ %.136.us.unr.ph, %.preheader.us.new.preheader ]
  %71 = load i8, i8* %.136.us, align 1
  %72 = zext i8 %71 to i64
  %73 = getelementptr inbounds i32*, i32** %11, i64 %72
  %74 = load i32*, i32** %73, align 8
  %75 = getelementptr inbounds i32, i32* %74, i64 1
  %76 = load i32, i32* %74, align 4
  %77 = getelementptr inbounds i32, i32* %.17.us, i64 1
  store i32 %76, i32* %.17.us, align 4
  %78 = load i32, i32* %75, align 4
  store i32 %78, i32* %77, align 4
  %79 = getelementptr inbounds i32, i32* %.17.us, i64 2
  %80 = getelementptr inbounds i8, i8* %.136.us, i64 1
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i64
  %83 = getelementptr inbounds i32*, i32** %11, i64 %82
  %84 = load i32*, i32** %83, align 8
  %85 = getelementptr inbounds i32, i32* %84, i64 1
  %86 = load i32, i32* %84, align 4
  %87 = getelementptr inbounds i32, i32* %.17.us, i64 3
  store i32 %86, i32* %79, align 4
  %88 = load i32, i32* %85, align 4
  store i32 %88, i32* %87, align 4
  %89 = getelementptr inbounds i32, i32* %.17.us, i64 4
  %90 = getelementptr inbounds i8, i8* %.136.us, i64 2
  %91 = add i32 %.08.us, -4
  %92 = icmp ugt i32 %91, 1
  br i1 %92, label %.preheader.us.new, label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %scevgep17 = getelementptr i8, i8* %.0211.us, i64 %35
  br i1 %44, label %62, label %56

.preheader:                                       ; preds = %.preheader.preheader23, %113
  %93 = phi i32 [ %116, %113 ], [ %.unr, %.preheader.preheader23 ]
  %.0112 = phi i32* [ %114, %113 ], [ %.0112.unr, %.preheader.preheader23 ]
  %.0211 = phi i8* [ %115, %113 ], [ %.0211.unr, %.preheader.preheader23 ]
  br i1 %32, label %.preheader.122.thread, label %96

.preheader.122.thread:                            ; preds = %.preheader
  %94 = getelementptr inbounds i32, i32* %.0112, i64 %16
  %95 = getelementptr inbounds i8, i8* %.0211, i64 %17
  br label %113

._crit_edge13.loopexit:                           ; preds = %62
  br label %._crit_edge13

._crit_edge13.loopexit26:                         ; preds = %113
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit26, %._crit_edge13.loopexit, %.preheader.prol.loopexit, %9
  ret void

; <label>:96:                                     ; preds = %.preheader
  %97 = getelementptr inbounds i8, i8* %.0211, i64 1
  %98 = load i8, i8* %.0211, align 1
  %99 = zext i8 %98 to i64
  %100 = getelementptr inbounds i32*, i32** %11, i64 %99
  %101 = load i32*, i32** %100, align 8
  %102 = load i32, i32* %101, align 4
  %103 = getelementptr inbounds i32, i32* %.0112, i64 1
  store i32 %102, i32* %.0112, align 4
  %104 = getelementptr inbounds i32, i32* %103, i64 %16
  %105 = getelementptr inbounds i8, i8* %97, i64 %17
  %106 = getelementptr inbounds i8, i8* %105, i64 1
  %107 = load i8, i8* %105, align 1
  %108 = zext i8 %107 to i64
  %109 = getelementptr inbounds i32*, i32** %11, i64 %108
  %110 = load i32*, i32** %109, align 8
  %111 = load i32, i32* %110, align 4
  %112 = getelementptr inbounds i32, i32* %104, i64 1
  store i32 %111, i32* %104, align 4
  br label %113

; <label>:113:                                    ; preds = %.preheader.122.thread, %96
  %.24.1 = phi i8* [ %106, %96 ], [ %95, %.preheader.122.thread ]
  %.2.1 = phi i32* [ %112, %96 ], [ %94, %.preheader.122.thread ]
  %114 = getelementptr inbounds i32, i32* %.2.1, i64 %16
  %115 = getelementptr inbounds i8, i8* %.24.1, i64 %17
  %116 = add i32 %93, -2
  %117 = icmp eq i32 %93, 1
  br i1 %117, label %._crit_edge13.loopexit26, label %.preheader
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @put2bitcmaptile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 17
  %11 = load i32**, i32*** %10, align 8
  %12 = add i32 %5, -1
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge15, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %14 = sdiv i32 %6, 4
  %15 = icmp ugt i32 %4, 3
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  br i1 %15, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %18 = icmp eq i32 %4, 0
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %19 = add i32 %4, -4
  %20 = lshr i32 %19, 2
  %21 = shl nuw i32 %20, 2
  %22 = sub i32 %4, %21
  %23 = zext i32 %20 to i64
  %24 = shl nuw i32 %20, 2
  %25 = zext i32 %24 to i64
  %26 = add nuw nsw i64 %25, 4
  %27 = add nuw nsw i64 %23, 1
  %28 = add i32 %4, -4
  %29 = lshr i32 %28, 2
  %30 = and i32 %29, 1
  %lcmp.mod = icmp eq i32 %30, 0
  %31 = add i32 %4, -4
  %32 = icmp eq i32 %29, 0
  %33 = icmp eq i32 %28, %21
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %68
  %34 = phi i32 [ %71, %68 ], [ %12, %.preheader.us.preheader ]
  %.0114.us = phi i32* [ %69, %68 ], [ %1, %.preheader.us.preheader ]
  %.0413.us = phi i8* [ %70, %68 ], [ %8, %.preheader.us.preheader ]
  %scevgep = getelementptr i32, i32* %.0114.us, i64 %25
  %scevgep20 = getelementptr i32, i32* %.0114.us, i64 %26
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %35 = load i8, i8* %.0413.us, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds i32*, i32** %11, i64 %36
  %38 = load i32*, i32** %37, align 8
  %39 = getelementptr inbounds i32, i32* %38, i64 1
  %40 = load i32, i32* %38, align 4
  %41 = getelementptr inbounds i32, i32* %.0114.us, i64 1
  store i32 %40, i32* %.0114.us, align 4
  %42 = getelementptr inbounds i32, i32* %38, i64 2
  %43 = load i32, i32* %39, align 4
  %44 = getelementptr inbounds i32, i32* %.0114.us, i64 2
  store i32 %43, i32* %41, align 4
  %45 = getelementptr inbounds i32, i32* %38, i64 3
  %46 = load i32, i32* %42, align 4
  %47 = getelementptr inbounds i32, i32* %.0114.us, i64 3
  store i32 %46, i32* %44, align 4
  %48 = load i32, i32* %45, align 4
  store i32 %48, i32* %47, align 4
  %49 = getelementptr inbounds i32, i32* %.0114.us, i64 4
  %50 = getelementptr inbounds i8, i8* %.0413.us, i64 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %.010.us.unr.ph = phi i32 [ %31, %.prol.preheader ], [ %4, %.preheader.us ]
  %.19.us.unr.ph = phi i32* [ %49, %.prol.preheader ], [ %.0114.us, %.preheader.us ]
  %.158.us.unr.ph = phi i8* [ %50, %.prol.preheader ], [ %.0413.us, %.preheader.us ]
  br i1 %32, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

; <label>:51:                                     ; preds = %._crit_edge.us
  %scevgep19 = getelementptr i8, i8* %.0413.us, i64 %23
  %52 = getelementptr inbounds i8, i8* %scevgep19, i64 2
  %53 = load i8, i8* %scevgep21, align 1
  %54 = zext i8 %53 to i64
  %55 = getelementptr inbounds i32*, i32** %11, i64 %54
  %56 = load i32*, i32** %55, align 8
  switch i32 %22, label %68 [
    i32 7, label %57
    i32 6, label %61
    i32 5, label %65
  ]

; <label>:57:                                     ; preds = %51
  %58 = getelementptr inbounds i32, i32* %56, i64 1
  %59 = load i32, i32* %56, align 4
  %60 = getelementptr inbounds i32, i32* %scevgep, i64 5
  store i32 %59, i32* %scevgep20, align 4
  br label %61

; <label>:61:                                     ; preds = %57, %51
  %.02.us = phi i32* [ %56, %51 ], [ %58, %57 ]
  %.2.us = phi i32* [ %scevgep20, %51 ], [ %60, %57 ]
  %62 = getelementptr inbounds i32, i32* %.02.us, i64 1
  %63 = load i32, i32* %.02.us, align 4
  %64 = getelementptr inbounds i32, i32* %.2.us, i64 1
  store i32 %63, i32* %.2.us, align 4
  br label %65

; <label>:65:                                     ; preds = %61, %51
  %.13.us = phi i32* [ %56, %51 ], [ %62, %61 ]
  %.3.us = phi i32* [ %scevgep20, %51 ], [ %64, %61 ]
  %66 = load i32, i32* %.13.us, align 4
  %67 = getelementptr inbounds i32, i32* %.3.us, i64 1
  store i32 %66, i32* %.3.us, align 4
  br label %68

; <label>:68:                                     ; preds = %65, %51, %._crit_edge.us
  %.26.us = phi i8* [ %scevgep21, %._crit_edge.us ], [ %52, %65 ], [ %52, %51 ]
  %.5.us = phi i32* [ %scevgep20, %._crit_edge.us ], [ %67, %65 ], [ %scevgep20, %51 ]
  %69 = getelementptr inbounds i32, i32* %.5.us, i64 %16
  %70 = getelementptr inbounds i8, i8* %.26.us, i64 %17
  %71 = add i32 %34, -1
  %72 = icmp eq i32 %34, 0
  br i1 %72, label %._crit_edge15.loopexit, label %.preheader.us

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %.010.us = phi i32 [ %105, %.preheader.us.new ], [ %.010.us.unr.ph, %.preheader.us.new.preheader ]
  %.19.us = phi i32* [ %103, %.preheader.us.new ], [ %.19.us.unr.ph, %.preheader.us.new.preheader ]
  %.158.us = phi i8* [ %104, %.preheader.us.new ], [ %.158.us.unr.ph, %.preheader.us.new.preheader ]
  %73 = load i8, i8* %.158.us, align 1
  %74 = zext i8 %73 to i64
  %75 = getelementptr inbounds i32*, i32** %11, i64 %74
  %76 = load i32*, i32** %75, align 8
  %77 = getelementptr inbounds i32, i32* %76, i64 1
  %78 = load i32, i32* %76, align 4
  %79 = getelementptr inbounds i32, i32* %.19.us, i64 1
  store i32 %78, i32* %.19.us, align 4
  %80 = getelementptr inbounds i32, i32* %76, i64 2
  %81 = load i32, i32* %77, align 4
  %82 = getelementptr inbounds i32, i32* %.19.us, i64 2
  store i32 %81, i32* %79, align 4
  %83 = getelementptr inbounds i32, i32* %76, i64 3
  %84 = load i32, i32* %80, align 4
  %85 = getelementptr inbounds i32, i32* %.19.us, i64 3
  store i32 %84, i32* %82, align 4
  %86 = load i32, i32* %83, align 4
  store i32 %86, i32* %85, align 4
  %87 = getelementptr inbounds i32, i32* %.19.us, i64 4
  %88 = getelementptr inbounds i8, i8* %.158.us, i64 1
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i64
  %91 = getelementptr inbounds i32*, i32** %11, i64 %90
  %92 = load i32*, i32** %91, align 8
  %93 = getelementptr inbounds i32, i32* %92, i64 1
  %94 = load i32, i32* %92, align 4
  %95 = getelementptr inbounds i32, i32* %.19.us, i64 5
  store i32 %94, i32* %87, align 4
  %96 = getelementptr inbounds i32, i32* %92, i64 2
  %97 = load i32, i32* %93, align 4
  %98 = getelementptr inbounds i32, i32* %.19.us, i64 6
  store i32 %97, i32* %95, align 4
  %99 = getelementptr inbounds i32, i32* %92, i64 3
  %100 = load i32, i32* %96, align 4
  %101 = getelementptr inbounds i32, i32* %.19.us, i64 7
  store i32 %100, i32* %98, align 4
  %102 = load i32, i32* %99, align 4
  store i32 %102, i32* %101, align 4
  %103 = getelementptr inbounds i32, i32* %.19.us, i64 8
  %104 = getelementptr inbounds i8, i8* %.158.us, i64 2
  %105 = add i32 %.010.us, -8
  %106 = icmp ugt i32 %105, 3
  br i1 %106, label %.preheader.us.new, label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %scevgep21 = getelementptr i8, i8* %.0413.us, i64 %27
  br i1 %33, label %68, label %51

.preheader:                                       ; preds = %.preheader.preheader, %125
  %107 = phi i32 [ %128, %125 ], [ %12, %.preheader.preheader ]
  %.0114 = phi i32* [ %126, %125 ], [ %1, %.preheader.preheader ]
  %.0413 = phi i8* [ %127, %125 ], [ %8, %.preheader.preheader ]
  br i1 %18, label %125, label %108

; <label>:108:                                    ; preds = %.preheader
  %109 = getelementptr inbounds i8, i8* %.0413, i64 1
  %110 = load i8, i8* %.0413, align 1
  %111 = zext i8 %110 to i64
  %112 = getelementptr inbounds i32*, i32** %11, i64 %111
  %113 = load i32*, i32** %112, align 8
  switch i32 %4, label %125 [
    i32 3, label %114
    i32 2, label %118
    i32 1, label %122
  ]

; <label>:114:                                    ; preds = %108
  %115 = getelementptr inbounds i32, i32* %113, i64 1
  %116 = load i32, i32* %113, align 4
  %117 = getelementptr inbounds i32, i32* %.0114, i64 1
  store i32 %116, i32* %.0114, align 4
  br label %118

; <label>:118:                                    ; preds = %114, %108
  %.02 = phi i32* [ %113, %108 ], [ %115, %114 ]
  %.2 = phi i32* [ %.0114, %108 ], [ %117, %114 ]
  %119 = getelementptr inbounds i32, i32* %.02, i64 1
  %120 = load i32, i32* %.02, align 4
  %121 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %120, i32* %.2, align 4
  br label %122

; <label>:122:                                    ; preds = %118, %108
  %.13 = phi i32* [ %113, %108 ], [ %119, %118 ]
  %.3 = phi i32* [ %.0114, %108 ], [ %121, %118 ]
  %123 = load i32, i32* %.13, align 4
  %124 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %123, i32* %.3, align 4
  br label %125

; <label>:125:                                    ; preds = %108, %122, %.preheader
  %.26 = phi i8* [ %.0413, %.preheader ], [ %109, %122 ], [ %109, %108 ]
  %.5 = phi i32* [ %.0114, %.preheader ], [ %124, %122 ], [ %.0114, %108 ]
  %126 = getelementptr inbounds i32, i32* %.5, i64 %16
  %127 = getelementptr inbounds i8, i8* %.26, i64 %17
  %128 = add i32 %107, -1
  %129 = icmp eq i32 %107, 0
  br i1 %129, label %._crit_edge15.loopexit24, label %.preheader

._crit_edge15.loopexit:                           ; preds = %68
  br label %._crit_edge15

._crit_edge15.loopexit24:                         ; preds = %125
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit24, %._crit_edge15.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @put1bitcmaptile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 17
  %11 = load i32**, i32*** %10, align 8
  %12 = add i32 %5, -1
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge19, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %14 = sdiv i32 %6, 8
  %15 = icmp ugt i32 %4, 7
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  br i1 %15, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %18 = icmp eq i32 %4, 0
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %19 = add i32 %4, -8
  %20 = lshr i32 %19, 3
  %21 = shl nuw i32 %20, 3
  %22 = sub i32 %4, %21
  %23 = zext i32 %20 to i64
  %24 = shl nuw i32 %20, 3
  %25 = zext i32 %24 to i64
  %26 = add nuw nsw i64 %25, 8
  %27 = add nuw nsw i64 %23, 1
  %28 = add i32 %4, -8
  %29 = icmp eq i32 %28, %21
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %64
  %30 = phi i32 [ %67, %64 ], [ %12, %.preheader.us.preheader ]
  %.0118.us = phi i32* [ %65, %64 ], [ %1, %.preheader.us.preheader ]
  %.0817.us = phi i8* [ %66, %64 ], [ %8, %.preheader.us.preheader ]
  %scevgep = getelementptr i32, i32* %.0118.us, i64 %25
  %scevgep24 = getelementptr i32, i32* %.0118.us, i64 %26
  br label %69

; <label>:31:                                     ; preds = %._crit_edge.us
  %scevgep23 = getelementptr i8, i8* %.0817.us, i64 %23
  %32 = getelementptr inbounds i8, i8* %scevgep23, i64 2
  %33 = load i8, i8* %scevgep25, align 1
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i32*, i32** %11, i64 %34
  %36 = load i32*, i32** %35, align 8
  switch i32 %22, label %64 [
    i32 15, label %37
    i32 14, label %41
    i32 13, label %45
    i32 12, label %49
    i32 11, label %53
    i32 10, label %57
    i32 9, label %61
  ]

; <label>:37:                                     ; preds = %31
  %38 = getelementptr inbounds i32, i32* %36, i64 1
  %39 = load i32, i32* %36, align 4
  %40 = getelementptr inbounds i32, i32* %scevgep, i64 9
  store i32 %39, i32* %scevgep24, align 4
  br label %41

; <label>:41:                                     ; preds = %37, %31
  %.02.us = phi i32* [ %36, %31 ], [ %38, %37 ]
  %.2.us = phi i32* [ %scevgep24, %31 ], [ %40, %37 ]
  %42 = getelementptr inbounds i32, i32* %.02.us, i64 1
  %43 = load i32, i32* %.02.us, align 4
  %44 = getelementptr inbounds i32, i32* %.2.us, i64 1
  store i32 %43, i32* %.2.us, align 4
  br label %45

; <label>:45:                                     ; preds = %41, %31
  %.13.us = phi i32* [ %36, %31 ], [ %42, %41 ]
  %.3.us = phi i32* [ %scevgep24, %31 ], [ %44, %41 ]
  %46 = getelementptr inbounds i32, i32* %.13.us, i64 1
  %47 = load i32, i32* %.13.us, align 4
  %48 = getelementptr inbounds i32, i32* %.3.us, i64 1
  store i32 %47, i32* %.3.us, align 4
  br label %49

; <label>:49:                                     ; preds = %45, %31
  %.24.us = phi i32* [ %36, %31 ], [ %46, %45 ]
  %.4.us = phi i32* [ %scevgep24, %31 ], [ %48, %45 ]
  %50 = getelementptr inbounds i32, i32* %.24.us, i64 1
  %51 = load i32, i32* %.24.us, align 4
  %52 = getelementptr inbounds i32, i32* %.4.us, i64 1
  store i32 %51, i32* %.4.us, align 4
  br label %53

; <label>:53:                                     ; preds = %49, %31
  %.35.us = phi i32* [ %36, %31 ], [ %50, %49 ]
  %.5.us = phi i32* [ %scevgep24, %31 ], [ %52, %49 ]
  %54 = getelementptr inbounds i32, i32* %.35.us, i64 1
  %55 = load i32, i32* %.35.us, align 4
  %56 = getelementptr inbounds i32, i32* %.5.us, i64 1
  store i32 %55, i32* %.5.us, align 4
  br label %57

; <label>:57:                                     ; preds = %53, %31
  %.46.us = phi i32* [ %36, %31 ], [ %54, %53 ]
  %.6.us = phi i32* [ %scevgep24, %31 ], [ %56, %53 ]
  %58 = getelementptr inbounds i32, i32* %.46.us, i64 1
  %59 = load i32, i32* %.46.us, align 4
  %60 = getelementptr inbounds i32, i32* %.6.us, i64 1
  store i32 %59, i32* %.6.us, align 4
  br label %61

; <label>:61:                                     ; preds = %57, %31
  %.57.us = phi i32* [ %36, %31 ], [ %58, %57 ]
  %.7.us = phi i32* [ %scevgep24, %31 ], [ %60, %57 ]
  %62 = load i32, i32* %.57.us, align 4
  %63 = getelementptr inbounds i32, i32* %.7.us, i64 1
  store i32 %62, i32* %.7.us, align 4
  br label %64

; <label>:64:                                     ; preds = %61, %31, %._crit_edge.us
  %.210.us = phi i8* [ %scevgep25, %._crit_edge.us ], [ %32, %61 ], [ %32, %31 ]
  %.9.us = phi i32* [ %scevgep24, %._crit_edge.us ], [ %63, %61 ], [ %scevgep24, %31 ]
  %65 = getelementptr inbounds i32, i32* %.9.us, i64 %16
  %66 = getelementptr inbounds i8, i8* %.210.us, i64 %17
  %67 = add i32 %30, -1
  %68 = icmp eq i32 %30, 0
  br i1 %68, label %._crit_edge19.loopexit, label %.preheader.us

; <label>:69:                                     ; preds = %.preheader.us, %69
  %.014.us = phi i32 [ %4, %.preheader.us ], [ %98, %69 ]
  %.113.us = phi i32* [ %.0118.us, %.preheader.us ], [ %96, %69 ]
  %.1912.us = phi i8* [ %.0817.us, %.preheader.us ], [ %97, %69 ]
  %70 = load i8, i8* %.1912.us, align 1
  %71 = zext i8 %70 to i64
  %72 = getelementptr inbounds i32*, i32** %11, i64 %71
  %73 = load i32*, i32** %72, align 8
  %74 = getelementptr inbounds i32, i32* %73, i64 1
  %75 = load i32, i32* %73, align 4
  %76 = getelementptr inbounds i32, i32* %.113.us, i64 1
  store i32 %75, i32* %.113.us, align 4
  %77 = getelementptr inbounds i32, i32* %73, i64 2
  %78 = load i32, i32* %74, align 4
  %79 = getelementptr inbounds i32, i32* %.113.us, i64 2
  store i32 %78, i32* %76, align 4
  %80 = getelementptr inbounds i32, i32* %73, i64 3
  %81 = load i32, i32* %77, align 4
  %82 = getelementptr inbounds i32, i32* %.113.us, i64 3
  store i32 %81, i32* %79, align 4
  %83 = getelementptr inbounds i32, i32* %73, i64 4
  %84 = load i32, i32* %80, align 4
  %85 = getelementptr inbounds i32, i32* %.113.us, i64 4
  store i32 %84, i32* %82, align 4
  %86 = getelementptr inbounds i32, i32* %73, i64 5
  %87 = load i32, i32* %83, align 4
  %88 = getelementptr inbounds i32, i32* %.113.us, i64 5
  store i32 %87, i32* %85, align 4
  %89 = getelementptr inbounds i32, i32* %73, i64 6
  %90 = load i32, i32* %86, align 4
  %91 = getelementptr inbounds i32, i32* %.113.us, i64 6
  store i32 %90, i32* %88, align 4
  %92 = getelementptr inbounds i32, i32* %73, i64 7
  %93 = load i32, i32* %89, align 4
  %94 = getelementptr inbounds i32, i32* %.113.us, i64 7
  store i32 %93, i32* %91, align 4
  %95 = load i32, i32* %92, align 4
  store i32 %95, i32* %94, align 4
  %96 = getelementptr inbounds i32, i32* %.113.us, i64 8
  %97 = getelementptr inbounds i8, i8* %.1912.us, i64 1
  %98 = add i32 %.014.us, -8
  %99 = icmp ugt i32 %98, 7
  br i1 %99, label %69, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %69
  %scevgep25 = getelementptr i8, i8* %.0817.us, i64 %27
  br i1 %29, label %64, label %31

.preheader:                                       ; preds = %.preheader.preheader, %134
  %100 = phi i32 [ %137, %134 ], [ %12, %.preheader.preheader ]
  %.0118 = phi i32* [ %135, %134 ], [ %1, %.preheader.preheader ]
  %.0817 = phi i8* [ %136, %134 ], [ %8, %.preheader.preheader ]
  br i1 %18, label %134, label %101

; <label>:101:                                    ; preds = %.preheader
  %102 = getelementptr inbounds i8, i8* %.0817, i64 1
  %103 = load i8, i8* %.0817, align 1
  %104 = zext i8 %103 to i64
  %105 = getelementptr inbounds i32*, i32** %11, i64 %104
  %106 = load i32*, i32** %105, align 8
  switch i32 %4, label %134 [
    i32 7, label %107
    i32 6, label %111
    i32 5, label %115
    i32 4, label %119
    i32 3, label %123
    i32 2, label %127
    i32 1, label %131
  ]

; <label>:107:                                    ; preds = %101
  %108 = getelementptr inbounds i32, i32* %106, i64 1
  %109 = load i32, i32* %106, align 4
  %110 = getelementptr inbounds i32, i32* %.0118, i64 1
  store i32 %109, i32* %.0118, align 4
  br label %111

; <label>:111:                                    ; preds = %107, %101
  %.02 = phi i32* [ %106, %101 ], [ %108, %107 ]
  %.2 = phi i32* [ %.0118, %101 ], [ %110, %107 ]
  %112 = getelementptr inbounds i32, i32* %.02, i64 1
  %113 = load i32, i32* %.02, align 4
  %114 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %113, i32* %.2, align 4
  br label %115

; <label>:115:                                    ; preds = %111, %101
  %.13 = phi i32* [ %106, %101 ], [ %112, %111 ]
  %.3 = phi i32* [ %.0118, %101 ], [ %114, %111 ]
  %116 = getelementptr inbounds i32, i32* %.13, i64 1
  %117 = load i32, i32* %.13, align 4
  %118 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %117, i32* %.3, align 4
  br label %119

; <label>:119:                                    ; preds = %115, %101
  %.24 = phi i32* [ %106, %101 ], [ %116, %115 ]
  %.4 = phi i32* [ %.0118, %101 ], [ %118, %115 ]
  %120 = getelementptr inbounds i32, i32* %.24, i64 1
  %121 = load i32, i32* %.24, align 4
  %122 = getelementptr inbounds i32, i32* %.4, i64 1
  store i32 %121, i32* %.4, align 4
  br label %123

; <label>:123:                                    ; preds = %119, %101
  %.35 = phi i32* [ %106, %101 ], [ %120, %119 ]
  %.5 = phi i32* [ %.0118, %101 ], [ %122, %119 ]
  %124 = getelementptr inbounds i32, i32* %.35, i64 1
  %125 = load i32, i32* %.35, align 4
  %126 = getelementptr inbounds i32, i32* %.5, i64 1
  store i32 %125, i32* %.5, align 4
  br label %127

; <label>:127:                                    ; preds = %123, %101
  %.46 = phi i32* [ %106, %101 ], [ %124, %123 ]
  %.6 = phi i32* [ %.0118, %101 ], [ %126, %123 ]
  %128 = getelementptr inbounds i32, i32* %.46, i64 1
  %129 = load i32, i32* %.46, align 4
  %130 = getelementptr inbounds i32, i32* %.6, i64 1
  store i32 %129, i32* %.6, align 4
  br label %131

; <label>:131:                                    ; preds = %127, %101
  %.57 = phi i32* [ %106, %101 ], [ %128, %127 ]
  %.7 = phi i32* [ %.0118, %101 ], [ %130, %127 ]
  %132 = load i32, i32* %.57, align 4
  %133 = getelementptr inbounds i32, i32* %.7, i64 1
  store i32 %132, i32* %.7, align 4
  br label %134

; <label>:134:                                    ; preds = %101, %131, %.preheader
  %.210 = phi i8* [ %.0817, %.preheader ], [ %102, %131 ], [ %102, %101 ]
  %.9 = phi i32* [ %.0118, %.preheader ], [ %133, %131 ], [ %.0118, %101 ]
  %135 = getelementptr inbounds i32, i32* %.9, i64 %16
  %136 = getelementptr inbounds i8, i8* %.210, i64 %17
  %137 = add i32 %100, -1
  %138 = icmp eq i32 %100, 0
  br i1 %138, label %._crit_edge19.loopexit28, label %.preheader

._crit_edge19.loopexit:                           ; preds = %64
  br label %._crit_edge19

._crit_edge19.loopexit28:                         ; preds = %134
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit28, %._crit_edge19.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putgreytile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 16
  %11 = load i32**, i32*** %10, align 8
  %12 = icmp eq i32 %5, 0
  br i1 %12, label %._crit_edge11, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %13 = icmp eq i32 %4, 0
  %14 = sext i32 %7 to i64
  %15 = sext i32 %6 to i64
  br i1 %13, label %._crit_edge11, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %16 = add i32 %4, -1
  %17 = zext i32 %16 to i64
  %18 = add nuw nsw i64 %17, 1
  %xtraiter = and i32 %4, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %19 = icmp ult i32 %16, 3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.in = phi i32 [ %20, %._crit_edge ], [ %5, %.preheader.preheader ]
  %.010 = phi i8* [ %60, %._crit_edge ], [ %8, %.preheader.preheader ]
  %.019 = phi i32* [ %59, %._crit_edge ], [ %1, %.preheader.preheader ]
  %20 = add i32 %.in, -1
  %scevgep = getelementptr i8, i8* %.010, i64 %18
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %.17.prol = phi i8* [ %22, %.prol.preheader ], [ %.010, %.prol.preheader.preheader ]
  %.126.prol = phi i32* [ %28, %.prol.preheader ], [ %.019, %.prol.preheader.preheader ]
  %.035.prol = phi i32 [ %21, %.prol.preheader ], [ %4, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %21 = add i32 %.035.prol, -1
  %22 = getelementptr inbounds i8, i8* %.17.prol, i64 1
  %23 = load i8, i8* %.17.prol, align 1
  %24 = zext i8 %23 to i64
  %25 = getelementptr inbounds i32*, i32** %11, i64 %24
  %26 = load i32*, i32** %25, align 8
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr inbounds i32, i32* %.126.prol, i64 1
  store i32 %27, i32* %.126.prol, align 4
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader
  %.17.unr = phi i8* [ %.010, %.preheader ], [ %22, %.prol.loopexit.loopexit ]
  %.126.unr = phi i32* [ %.019, %.preheader ], [ %28, %.prol.loopexit.loopexit ]
  %.035.unr = phi i32 [ %4, %.preheader ], [ %21, %.prol.loopexit.loopexit ]
  br i1 %19, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %.17 = phi i8* [ %51, %.preheader.new ], [ %.17.unr, %.preheader.new.preheader ]
  %.126 = phi i32* [ %57, %.preheader.new ], [ %.126.unr, %.preheader.new.preheader ]
  %.035 = phi i32 [ %50, %.preheader.new ], [ %.035.unr, %.preheader.new.preheader ]
  %29 = getelementptr inbounds i8, i8* %.17, i64 1
  %30 = load i8, i8* %.17, align 1
  %31 = zext i8 %30 to i64
  %32 = getelementptr inbounds i32*, i32** %11, i64 %31
  %33 = load i32*, i32** %32, align 8
  %34 = load i32, i32* %33, align 4
  %35 = getelementptr inbounds i32, i32* %.126, i64 1
  store i32 %34, i32* %.126, align 4
  %36 = getelementptr inbounds i8, i8* %.17, i64 2
  %37 = load i8, i8* %29, align 1
  %38 = zext i8 %37 to i64
  %39 = getelementptr inbounds i32*, i32** %11, i64 %38
  %40 = load i32*, i32** %39, align 8
  %41 = load i32, i32* %40, align 4
  %42 = getelementptr inbounds i32, i32* %.126, i64 2
  store i32 %41, i32* %35, align 4
  %43 = getelementptr inbounds i8, i8* %.17, i64 3
  %44 = load i8, i8* %36, align 1
  %45 = zext i8 %44 to i64
  %46 = getelementptr inbounds i32*, i32** %11, i64 %45
  %47 = load i32*, i32** %46, align 8
  %48 = load i32, i32* %47, align 4
  %49 = getelementptr inbounds i32, i32* %.126, i64 3
  store i32 %48, i32* %42, align 4
  %50 = add i32 %.035, -4
  %51 = getelementptr inbounds i8, i8* %.17, i64 4
  %52 = load i8, i8* %43, align 1
  %53 = zext i8 %52 to i64
  %54 = getelementptr inbounds i32*, i32** %11, i64 %53
  %55 = load i32*, i32** %54, align 8
  %56 = load i32, i32* %55, align 4
  %57 = getelementptr inbounds i32, i32* %.126, i64 4
  store i32 %56, i32* %49, align 4
  %58 = icmp eq i32 %50, 0
  br i1 %58, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %scevgep14 = getelementptr i32, i32* %.019, i64 %18
  %59 = getelementptr inbounds i32, i32* %scevgep14, i64 %14
  %60 = getelementptr inbounds i8, i8* %scevgep, i64 %15
  %61 = icmp eq i32 %20, 0
  br i1 %61, label %._crit_edge11.loopexit, label %.preheader

._crit_edge11.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @put4bitbwtile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 16
  %11 = load i32**, i32*** %10, align 8
  %12 = add i32 %5, -1
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge13, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %14 = sdiv i32 %6, 2
  %15 = icmp ugt i32 %4, 1
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  br i1 %15, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %xtraiter20 = and i32 %5, 1
  %lcmp.mod21 = icmp eq i32 %xtraiter20, 0
  br i1 %lcmp.mod21, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %18 = icmp eq i32 %4, 0
  br i1 %18, label %27, label %19

; <label>:19:                                     ; preds = %.preheader.prol
  %20 = getelementptr inbounds i8, i8* %8, i64 1
  %21 = load i8, i8* %8, align 1
  %22 = zext i8 %21 to i64
  %23 = getelementptr inbounds i32*, i32** %11, i64 %22
  %24 = load i32*, i32** %23, align 8
  %25 = load i32, i32* %24, align 4
  %26 = getelementptr inbounds i32, i32* %1, i64 1
  store i32 %25, i32* %1, align 4
  br label %27

; <label>:27:                                     ; preds = %19, %.preheader.prol
  %.24.prol = phi i8* [ %20, %19 ], [ %8, %.preheader.prol ]
  %.2.prol = phi i32* [ %26, %19 ], [ %1, %.preheader.prol ]
  %28 = getelementptr inbounds i32, i32* %.2.prol, i64 %16
  %29 = getelementptr inbounds i8, i8* %.24.prol, i64 %17
  %30 = add i32 %5, -2
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader, %27
  %.unr = phi i32 [ %12, %.preheader.preheader ], [ %30, %27 ]
  %.0112.unr = phi i32* [ %1, %.preheader.preheader ], [ %28, %27 ]
  %.0211.unr = phi i8* [ %8, %.preheader.preheader ], [ %29, %27 ]
  %31 = icmp eq i32 %12, 0
  br i1 %31, label %._crit_edge13, label %.preheader.preheader23

.preheader.preheader23:                           ; preds = %.preheader.prol.loopexit
  %32 = icmp eq i32 %4, 0
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %33 = add i32 %4, -2
  %34 = lshr i32 %33, 1
  %35 = zext i32 %34 to i64
  %36 = shl nuw i32 %34, 1
  %37 = zext i32 %36 to i64
  %38 = add nuw nsw i64 %37, 2
  %39 = add nuw nsw i64 %35, 1
  %40 = shl nuw i32 %34, 1
  %41 = and i32 %34, 1
  %lcmp.mod = icmp eq i32 %41, 0
  %42 = add i32 %4, -2
  %43 = icmp eq i32 %34, 0
  %44 = icmp eq i32 %33, %40
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %62
  %45 = phi i32 [ %69, %62 ], [ %12, %.preheader.us.preheader ]
  %.0112.us = phi i32* [ %67, %62 ], [ %1, %.preheader.us.preheader ]
  %.0211.us = phi i8* [ %68, %62 ], [ %8, %.preheader.us.preheader ]
  %scevgep = getelementptr i32, i32* %.0112.us, i64 %37
  %scevgep18 = getelementptr i32, i32* %.0112.us, i64 %38
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %46 = load i8, i8* %.0211.us, align 1
  %47 = zext i8 %46 to i64
  %48 = getelementptr inbounds i32*, i32** %11, i64 %47
  %49 = load i32*, i32** %48, align 8
  %50 = getelementptr inbounds i32, i32* %49, i64 1
  %51 = load i32, i32* %49, align 4
  %52 = getelementptr inbounds i32, i32* %.0112.us, i64 1
  store i32 %51, i32* %.0112.us, align 4
  %53 = load i32, i32* %50, align 4
  store i32 %53, i32* %52, align 4
  %54 = getelementptr inbounds i32, i32* %.0112.us, i64 2
  %55 = getelementptr inbounds i8, i8* %.0211.us, i64 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %.08.us.unr.ph = phi i32 [ %42, %.prol.preheader ], [ %4, %.preheader.us ]
  %.17.us.unr.ph = phi i32* [ %54, %.prol.preheader ], [ %.0112.us, %.preheader.us ]
  %.136.us.unr.ph = phi i8* [ %55, %.prol.preheader ], [ %.0211.us, %.preheader.us ]
  br i1 %43, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

; <label>:56:                                     ; preds = %._crit_edge.us
  %scevgep19 = getelementptr i8, i8* %.0211.us, i64 %39
  %57 = load i8, i8* %scevgep19, align 1
  %58 = zext i8 %57 to i64
  %59 = getelementptr inbounds i32*, i32** %11, i64 %58
  %60 = load i32*, i32** %59, align 8
  %61 = load i32, i32* %60, align 4
  store i32 %61, i32* %scevgep18, align 4
  br label %62

; <label>:62:                                     ; preds = %56, %._crit_edge.us
  %63 = phi i64 [ 2, %56 ], [ 1, %._crit_edge.us ]
  %64 = phi i64 [ 3, %56 ], [ 2, %._crit_edge.us ]
  %65 = getelementptr inbounds i8, i8* %scevgep17, i64 %63
  %66 = getelementptr inbounds i32, i32* %scevgep, i64 %64
  %67 = getelementptr inbounds i32, i32* %66, i64 %16
  %68 = getelementptr inbounds i8, i8* %65, i64 %17
  %69 = add i32 %45, -1
  %70 = icmp eq i32 %45, 0
  br i1 %70, label %._crit_edge13.loopexit, label %.preheader.us

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %.08.us = phi i32 [ %91, %.preheader.us.new ], [ %.08.us.unr.ph, %.preheader.us.new.preheader ]
  %.17.us = phi i32* [ %89, %.preheader.us.new ], [ %.17.us.unr.ph, %.preheader.us.new.preheader ]
  %.136.us = phi i8* [ %90, %.preheader.us.new ], [ %.136.us.unr.ph, %.preheader.us.new.preheader ]
  %71 = load i8, i8* %.136.us, align 1
  %72 = zext i8 %71 to i64
  %73 = getelementptr inbounds i32*, i32** %11, i64 %72
  %74 = load i32*, i32** %73, align 8
  %75 = getelementptr inbounds i32, i32* %74, i64 1
  %76 = load i32, i32* %74, align 4
  %77 = getelementptr inbounds i32, i32* %.17.us, i64 1
  store i32 %76, i32* %.17.us, align 4
  %78 = load i32, i32* %75, align 4
  store i32 %78, i32* %77, align 4
  %79 = getelementptr inbounds i32, i32* %.17.us, i64 2
  %80 = getelementptr inbounds i8, i8* %.136.us, i64 1
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i64
  %83 = getelementptr inbounds i32*, i32** %11, i64 %82
  %84 = load i32*, i32** %83, align 8
  %85 = getelementptr inbounds i32, i32* %84, i64 1
  %86 = load i32, i32* %84, align 4
  %87 = getelementptr inbounds i32, i32* %.17.us, i64 3
  store i32 %86, i32* %79, align 4
  %88 = load i32, i32* %85, align 4
  store i32 %88, i32* %87, align 4
  %89 = getelementptr inbounds i32, i32* %.17.us, i64 4
  %90 = getelementptr inbounds i8, i8* %.136.us, i64 2
  %91 = add i32 %.08.us, -4
  %92 = icmp ugt i32 %91, 1
  br i1 %92, label %.preheader.us.new, label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %scevgep17 = getelementptr i8, i8* %.0211.us, i64 %35
  br i1 %44, label %62, label %56

.preheader:                                       ; preds = %.preheader.preheader23, %113
  %93 = phi i32 [ %116, %113 ], [ %.unr, %.preheader.preheader23 ]
  %.0112 = phi i32* [ %114, %113 ], [ %.0112.unr, %.preheader.preheader23 ]
  %.0211 = phi i8* [ %115, %113 ], [ %.0211.unr, %.preheader.preheader23 ]
  br i1 %32, label %.preheader.122.thread, label %96

.preheader.122.thread:                            ; preds = %.preheader
  %94 = getelementptr inbounds i32, i32* %.0112, i64 %16
  %95 = getelementptr inbounds i8, i8* %.0211, i64 %17
  br label %113

._crit_edge13.loopexit:                           ; preds = %62
  br label %._crit_edge13

._crit_edge13.loopexit26:                         ; preds = %113
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit26, %._crit_edge13.loopexit, %.preheader.prol.loopexit, %9
  ret void

; <label>:96:                                     ; preds = %.preheader
  %97 = getelementptr inbounds i8, i8* %.0211, i64 1
  %98 = load i8, i8* %.0211, align 1
  %99 = zext i8 %98 to i64
  %100 = getelementptr inbounds i32*, i32** %11, i64 %99
  %101 = load i32*, i32** %100, align 8
  %102 = load i32, i32* %101, align 4
  %103 = getelementptr inbounds i32, i32* %.0112, i64 1
  store i32 %102, i32* %.0112, align 4
  %104 = getelementptr inbounds i32, i32* %103, i64 %16
  %105 = getelementptr inbounds i8, i8* %97, i64 %17
  %106 = getelementptr inbounds i8, i8* %105, i64 1
  %107 = load i8, i8* %105, align 1
  %108 = zext i8 %107 to i64
  %109 = getelementptr inbounds i32*, i32** %11, i64 %108
  %110 = load i32*, i32** %109, align 8
  %111 = load i32, i32* %110, align 4
  %112 = getelementptr inbounds i32, i32* %104, i64 1
  store i32 %111, i32* %104, align 4
  br label %113

; <label>:113:                                    ; preds = %.preheader.122.thread, %96
  %.24.1 = phi i8* [ %106, %96 ], [ %95, %.preheader.122.thread ]
  %.2.1 = phi i32* [ %112, %96 ], [ %94, %.preheader.122.thread ]
  %114 = getelementptr inbounds i32, i32* %.2.1, i64 %16
  %115 = getelementptr inbounds i8, i8* %.24.1, i64 %17
  %116 = add i32 %93, -2
  %117 = icmp eq i32 %93, 1
  br i1 %117, label %._crit_edge13.loopexit26, label %.preheader
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @put2bitbwtile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 16
  %11 = load i32**, i32*** %10, align 8
  %12 = add i32 %5, -1
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge15, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %14 = sdiv i32 %6, 4
  %15 = icmp ugt i32 %4, 3
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  br i1 %15, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %18 = icmp eq i32 %4, 0
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %19 = add i32 %4, -4
  %20 = lshr i32 %19, 2
  %21 = shl nuw i32 %20, 2
  %22 = sub i32 %4, %21
  %23 = zext i32 %20 to i64
  %24 = shl nuw i32 %20, 2
  %25 = zext i32 %24 to i64
  %26 = add nuw nsw i64 %25, 4
  %27 = add nuw nsw i64 %23, 1
  %28 = add i32 %4, -4
  %29 = lshr i32 %28, 2
  %30 = and i32 %29, 1
  %lcmp.mod = icmp eq i32 %30, 0
  %31 = add i32 %4, -4
  %32 = icmp eq i32 %29, 0
  %33 = icmp eq i32 %28, %21
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %68
  %34 = phi i32 [ %71, %68 ], [ %12, %.preheader.us.preheader ]
  %.0114.us = phi i32* [ %69, %68 ], [ %1, %.preheader.us.preheader ]
  %.0413.us = phi i8* [ %70, %68 ], [ %8, %.preheader.us.preheader ]
  %scevgep = getelementptr i32, i32* %.0114.us, i64 %25
  %scevgep20 = getelementptr i32, i32* %.0114.us, i64 %26
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %35 = load i8, i8* %.0413.us, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds i32*, i32** %11, i64 %36
  %38 = load i32*, i32** %37, align 8
  %39 = getelementptr inbounds i32, i32* %38, i64 1
  %40 = load i32, i32* %38, align 4
  %41 = getelementptr inbounds i32, i32* %.0114.us, i64 1
  store i32 %40, i32* %.0114.us, align 4
  %42 = getelementptr inbounds i32, i32* %38, i64 2
  %43 = load i32, i32* %39, align 4
  %44 = getelementptr inbounds i32, i32* %.0114.us, i64 2
  store i32 %43, i32* %41, align 4
  %45 = getelementptr inbounds i32, i32* %38, i64 3
  %46 = load i32, i32* %42, align 4
  %47 = getelementptr inbounds i32, i32* %.0114.us, i64 3
  store i32 %46, i32* %44, align 4
  %48 = load i32, i32* %45, align 4
  store i32 %48, i32* %47, align 4
  %49 = getelementptr inbounds i32, i32* %.0114.us, i64 4
  %50 = getelementptr inbounds i8, i8* %.0413.us, i64 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %.010.us.unr.ph = phi i32 [ %31, %.prol.preheader ], [ %4, %.preheader.us ]
  %.19.us.unr.ph = phi i32* [ %49, %.prol.preheader ], [ %.0114.us, %.preheader.us ]
  %.158.us.unr.ph = phi i8* [ %50, %.prol.preheader ], [ %.0413.us, %.preheader.us ]
  br i1 %32, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

; <label>:51:                                     ; preds = %._crit_edge.us
  %scevgep19 = getelementptr i8, i8* %.0413.us, i64 %23
  %52 = getelementptr inbounds i8, i8* %scevgep19, i64 2
  %53 = load i8, i8* %scevgep21, align 1
  %54 = zext i8 %53 to i64
  %55 = getelementptr inbounds i32*, i32** %11, i64 %54
  %56 = load i32*, i32** %55, align 8
  switch i32 %22, label %68 [
    i32 7, label %57
    i32 6, label %61
    i32 5, label %65
  ]

; <label>:57:                                     ; preds = %51
  %58 = getelementptr inbounds i32, i32* %56, i64 1
  %59 = load i32, i32* %56, align 4
  %60 = getelementptr inbounds i32, i32* %scevgep, i64 5
  store i32 %59, i32* %scevgep20, align 4
  br label %61

; <label>:61:                                     ; preds = %57, %51
  %.02.us = phi i32* [ %56, %51 ], [ %58, %57 ]
  %.2.us = phi i32* [ %scevgep20, %51 ], [ %60, %57 ]
  %62 = getelementptr inbounds i32, i32* %.02.us, i64 1
  %63 = load i32, i32* %.02.us, align 4
  %64 = getelementptr inbounds i32, i32* %.2.us, i64 1
  store i32 %63, i32* %.2.us, align 4
  br label %65

; <label>:65:                                     ; preds = %61, %51
  %.13.us = phi i32* [ %56, %51 ], [ %62, %61 ]
  %.3.us = phi i32* [ %scevgep20, %51 ], [ %64, %61 ]
  %66 = load i32, i32* %.13.us, align 4
  %67 = getelementptr inbounds i32, i32* %.3.us, i64 1
  store i32 %66, i32* %.3.us, align 4
  br label %68

; <label>:68:                                     ; preds = %65, %51, %._crit_edge.us
  %.26.us = phi i8* [ %scevgep21, %._crit_edge.us ], [ %52, %65 ], [ %52, %51 ]
  %.5.us = phi i32* [ %scevgep20, %._crit_edge.us ], [ %67, %65 ], [ %scevgep20, %51 ]
  %69 = getelementptr inbounds i32, i32* %.5.us, i64 %16
  %70 = getelementptr inbounds i8, i8* %.26.us, i64 %17
  %71 = add i32 %34, -1
  %72 = icmp eq i32 %34, 0
  br i1 %72, label %._crit_edge15.loopexit, label %.preheader.us

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %.010.us = phi i32 [ %105, %.preheader.us.new ], [ %.010.us.unr.ph, %.preheader.us.new.preheader ]
  %.19.us = phi i32* [ %103, %.preheader.us.new ], [ %.19.us.unr.ph, %.preheader.us.new.preheader ]
  %.158.us = phi i8* [ %104, %.preheader.us.new ], [ %.158.us.unr.ph, %.preheader.us.new.preheader ]
  %73 = load i8, i8* %.158.us, align 1
  %74 = zext i8 %73 to i64
  %75 = getelementptr inbounds i32*, i32** %11, i64 %74
  %76 = load i32*, i32** %75, align 8
  %77 = getelementptr inbounds i32, i32* %76, i64 1
  %78 = load i32, i32* %76, align 4
  %79 = getelementptr inbounds i32, i32* %.19.us, i64 1
  store i32 %78, i32* %.19.us, align 4
  %80 = getelementptr inbounds i32, i32* %76, i64 2
  %81 = load i32, i32* %77, align 4
  %82 = getelementptr inbounds i32, i32* %.19.us, i64 2
  store i32 %81, i32* %79, align 4
  %83 = getelementptr inbounds i32, i32* %76, i64 3
  %84 = load i32, i32* %80, align 4
  %85 = getelementptr inbounds i32, i32* %.19.us, i64 3
  store i32 %84, i32* %82, align 4
  %86 = load i32, i32* %83, align 4
  store i32 %86, i32* %85, align 4
  %87 = getelementptr inbounds i32, i32* %.19.us, i64 4
  %88 = getelementptr inbounds i8, i8* %.158.us, i64 1
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i64
  %91 = getelementptr inbounds i32*, i32** %11, i64 %90
  %92 = load i32*, i32** %91, align 8
  %93 = getelementptr inbounds i32, i32* %92, i64 1
  %94 = load i32, i32* %92, align 4
  %95 = getelementptr inbounds i32, i32* %.19.us, i64 5
  store i32 %94, i32* %87, align 4
  %96 = getelementptr inbounds i32, i32* %92, i64 2
  %97 = load i32, i32* %93, align 4
  %98 = getelementptr inbounds i32, i32* %.19.us, i64 6
  store i32 %97, i32* %95, align 4
  %99 = getelementptr inbounds i32, i32* %92, i64 3
  %100 = load i32, i32* %96, align 4
  %101 = getelementptr inbounds i32, i32* %.19.us, i64 7
  store i32 %100, i32* %98, align 4
  %102 = load i32, i32* %99, align 4
  store i32 %102, i32* %101, align 4
  %103 = getelementptr inbounds i32, i32* %.19.us, i64 8
  %104 = getelementptr inbounds i8, i8* %.158.us, i64 2
  %105 = add i32 %.010.us, -8
  %106 = icmp ugt i32 %105, 3
  br i1 %106, label %.preheader.us.new, label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %scevgep21 = getelementptr i8, i8* %.0413.us, i64 %27
  br i1 %33, label %68, label %51

.preheader:                                       ; preds = %.preheader.preheader, %125
  %107 = phi i32 [ %128, %125 ], [ %12, %.preheader.preheader ]
  %.0114 = phi i32* [ %126, %125 ], [ %1, %.preheader.preheader ]
  %.0413 = phi i8* [ %127, %125 ], [ %8, %.preheader.preheader ]
  br i1 %18, label %125, label %108

; <label>:108:                                    ; preds = %.preheader
  %109 = getelementptr inbounds i8, i8* %.0413, i64 1
  %110 = load i8, i8* %.0413, align 1
  %111 = zext i8 %110 to i64
  %112 = getelementptr inbounds i32*, i32** %11, i64 %111
  %113 = load i32*, i32** %112, align 8
  switch i32 %4, label %125 [
    i32 3, label %114
    i32 2, label %118
    i32 1, label %122
  ]

; <label>:114:                                    ; preds = %108
  %115 = getelementptr inbounds i32, i32* %113, i64 1
  %116 = load i32, i32* %113, align 4
  %117 = getelementptr inbounds i32, i32* %.0114, i64 1
  store i32 %116, i32* %.0114, align 4
  br label %118

; <label>:118:                                    ; preds = %114, %108
  %.02 = phi i32* [ %113, %108 ], [ %115, %114 ]
  %.2 = phi i32* [ %.0114, %108 ], [ %117, %114 ]
  %119 = getelementptr inbounds i32, i32* %.02, i64 1
  %120 = load i32, i32* %.02, align 4
  %121 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %120, i32* %.2, align 4
  br label %122

; <label>:122:                                    ; preds = %118, %108
  %.13 = phi i32* [ %113, %108 ], [ %119, %118 ]
  %.3 = phi i32* [ %.0114, %108 ], [ %121, %118 ]
  %123 = load i32, i32* %.13, align 4
  %124 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %123, i32* %.3, align 4
  br label %125

; <label>:125:                                    ; preds = %108, %122, %.preheader
  %.26 = phi i8* [ %.0413, %.preheader ], [ %109, %122 ], [ %109, %108 ]
  %.5 = phi i32* [ %.0114, %.preheader ], [ %124, %122 ], [ %.0114, %108 ]
  %126 = getelementptr inbounds i32, i32* %.5, i64 %16
  %127 = getelementptr inbounds i8, i8* %.26, i64 %17
  %128 = add i32 %107, -1
  %129 = icmp eq i32 %107, 0
  br i1 %129, label %._crit_edge15.loopexit24, label %.preheader

._crit_edge15.loopexit:                           ; preds = %68
  br label %._crit_edge15

._crit_edge15.loopexit24:                         ; preds = %125
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit24, %._crit_edge15.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @put1bitbwtile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 16
  %11 = load i32**, i32*** %10, align 8
  %12 = add i32 %5, -1
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge19, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %9
  %14 = sdiv i32 %6, 8
  %15 = icmp ugt i32 %4, 7
  %16 = sext i32 %7 to i64
  %17 = sext i32 %14 to i64
  br i1 %15, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %18 = icmp eq i32 %4, 0
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %19 = add i32 %4, -8
  %20 = lshr i32 %19, 3
  %21 = shl nuw i32 %20, 3
  %22 = sub i32 %4, %21
  %23 = zext i32 %20 to i64
  %24 = shl nuw i32 %20, 3
  %25 = zext i32 %24 to i64
  %26 = add nuw nsw i64 %25, 8
  %27 = add nuw nsw i64 %23, 1
  %28 = add i32 %4, -8
  %29 = icmp eq i32 %28, %21
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %64
  %30 = phi i32 [ %67, %64 ], [ %12, %.preheader.us.preheader ]
  %.0118.us = phi i32* [ %65, %64 ], [ %1, %.preheader.us.preheader ]
  %.0817.us = phi i8* [ %66, %64 ], [ %8, %.preheader.us.preheader ]
  %scevgep = getelementptr i32, i32* %.0118.us, i64 %25
  %scevgep24 = getelementptr i32, i32* %.0118.us, i64 %26
  br label %69

; <label>:31:                                     ; preds = %._crit_edge.us
  %scevgep23 = getelementptr i8, i8* %.0817.us, i64 %23
  %32 = getelementptr inbounds i8, i8* %scevgep23, i64 2
  %33 = load i8, i8* %scevgep25, align 1
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds i32*, i32** %11, i64 %34
  %36 = load i32*, i32** %35, align 8
  switch i32 %22, label %64 [
    i32 15, label %37
    i32 14, label %41
    i32 13, label %45
    i32 12, label %49
    i32 11, label %53
    i32 10, label %57
    i32 9, label %61
  ]

; <label>:37:                                     ; preds = %31
  %38 = getelementptr inbounds i32, i32* %36, i64 1
  %39 = load i32, i32* %36, align 4
  %40 = getelementptr inbounds i32, i32* %scevgep, i64 9
  store i32 %39, i32* %scevgep24, align 4
  br label %41

; <label>:41:                                     ; preds = %37, %31
  %.02.us = phi i32* [ %36, %31 ], [ %38, %37 ]
  %.2.us = phi i32* [ %scevgep24, %31 ], [ %40, %37 ]
  %42 = getelementptr inbounds i32, i32* %.02.us, i64 1
  %43 = load i32, i32* %.02.us, align 4
  %44 = getelementptr inbounds i32, i32* %.2.us, i64 1
  store i32 %43, i32* %.2.us, align 4
  br label %45

; <label>:45:                                     ; preds = %41, %31
  %.13.us = phi i32* [ %36, %31 ], [ %42, %41 ]
  %.3.us = phi i32* [ %scevgep24, %31 ], [ %44, %41 ]
  %46 = getelementptr inbounds i32, i32* %.13.us, i64 1
  %47 = load i32, i32* %.13.us, align 4
  %48 = getelementptr inbounds i32, i32* %.3.us, i64 1
  store i32 %47, i32* %.3.us, align 4
  br label %49

; <label>:49:                                     ; preds = %45, %31
  %.24.us = phi i32* [ %36, %31 ], [ %46, %45 ]
  %.4.us = phi i32* [ %scevgep24, %31 ], [ %48, %45 ]
  %50 = getelementptr inbounds i32, i32* %.24.us, i64 1
  %51 = load i32, i32* %.24.us, align 4
  %52 = getelementptr inbounds i32, i32* %.4.us, i64 1
  store i32 %51, i32* %.4.us, align 4
  br label %53

; <label>:53:                                     ; preds = %49, %31
  %.35.us = phi i32* [ %36, %31 ], [ %50, %49 ]
  %.5.us = phi i32* [ %scevgep24, %31 ], [ %52, %49 ]
  %54 = getelementptr inbounds i32, i32* %.35.us, i64 1
  %55 = load i32, i32* %.35.us, align 4
  %56 = getelementptr inbounds i32, i32* %.5.us, i64 1
  store i32 %55, i32* %.5.us, align 4
  br label %57

; <label>:57:                                     ; preds = %53, %31
  %.46.us = phi i32* [ %36, %31 ], [ %54, %53 ]
  %.6.us = phi i32* [ %scevgep24, %31 ], [ %56, %53 ]
  %58 = getelementptr inbounds i32, i32* %.46.us, i64 1
  %59 = load i32, i32* %.46.us, align 4
  %60 = getelementptr inbounds i32, i32* %.6.us, i64 1
  store i32 %59, i32* %.6.us, align 4
  br label %61

; <label>:61:                                     ; preds = %57, %31
  %.57.us = phi i32* [ %36, %31 ], [ %58, %57 ]
  %.7.us = phi i32* [ %scevgep24, %31 ], [ %60, %57 ]
  %62 = load i32, i32* %.57.us, align 4
  %63 = getelementptr inbounds i32, i32* %.7.us, i64 1
  store i32 %62, i32* %.7.us, align 4
  br label %64

; <label>:64:                                     ; preds = %61, %31, %._crit_edge.us
  %.210.us = phi i8* [ %scevgep25, %._crit_edge.us ], [ %32, %61 ], [ %32, %31 ]
  %.9.us = phi i32* [ %scevgep24, %._crit_edge.us ], [ %63, %61 ], [ %scevgep24, %31 ]
  %65 = getelementptr inbounds i32, i32* %.9.us, i64 %16
  %66 = getelementptr inbounds i8, i8* %.210.us, i64 %17
  %67 = add i32 %30, -1
  %68 = icmp eq i32 %30, 0
  br i1 %68, label %._crit_edge19.loopexit, label %.preheader.us

; <label>:69:                                     ; preds = %.preheader.us, %69
  %.014.us = phi i32 [ %4, %.preheader.us ], [ %98, %69 ]
  %.113.us = phi i32* [ %.0118.us, %.preheader.us ], [ %96, %69 ]
  %.1912.us = phi i8* [ %.0817.us, %.preheader.us ], [ %97, %69 ]
  %70 = load i8, i8* %.1912.us, align 1
  %71 = zext i8 %70 to i64
  %72 = getelementptr inbounds i32*, i32** %11, i64 %71
  %73 = load i32*, i32** %72, align 8
  %74 = getelementptr inbounds i32, i32* %73, i64 1
  %75 = load i32, i32* %73, align 4
  %76 = getelementptr inbounds i32, i32* %.113.us, i64 1
  store i32 %75, i32* %.113.us, align 4
  %77 = getelementptr inbounds i32, i32* %73, i64 2
  %78 = load i32, i32* %74, align 4
  %79 = getelementptr inbounds i32, i32* %.113.us, i64 2
  store i32 %78, i32* %76, align 4
  %80 = getelementptr inbounds i32, i32* %73, i64 3
  %81 = load i32, i32* %77, align 4
  %82 = getelementptr inbounds i32, i32* %.113.us, i64 3
  store i32 %81, i32* %79, align 4
  %83 = getelementptr inbounds i32, i32* %73, i64 4
  %84 = load i32, i32* %80, align 4
  %85 = getelementptr inbounds i32, i32* %.113.us, i64 4
  store i32 %84, i32* %82, align 4
  %86 = getelementptr inbounds i32, i32* %73, i64 5
  %87 = load i32, i32* %83, align 4
  %88 = getelementptr inbounds i32, i32* %.113.us, i64 5
  store i32 %87, i32* %85, align 4
  %89 = getelementptr inbounds i32, i32* %73, i64 6
  %90 = load i32, i32* %86, align 4
  %91 = getelementptr inbounds i32, i32* %.113.us, i64 6
  store i32 %90, i32* %88, align 4
  %92 = getelementptr inbounds i32, i32* %73, i64 7
  %93 = load i32, i32* %89, align 4
  %94 = getelementptr inbounds i32, i32* %.113.us, i64 7
  store i32 %93, i32* %91, align 4
  %95 = load i32, i32* %92, align 4
  store i32 %95, i32* %94, align 4
  %96 = getelementptr inbounds i32, i32* %.113.us, i64 8
  %97 = getelementptr inbounds i8, i8* %.1912.us, i64 1
  %98 = add i32 %.014.us, -8
  %99 = icmp ugt i32 %98, 7
  br i1 %99, label %69, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %69
  %scevgep25 = getelementptr i8, i8* %.0817.us, i64 %27
  br i1 %29, label %64, label %31

.preheader:                                       ; preds = %.preheader.preheader, %134
  %100 = phi i32 [ %137, %134 ], [ %12, %.preheader.preheader ]
  %.0118 = phi i32* [ %135, %134 ], [ %1, %.preheader.preheader ]
  %.0817 = phi i8* [ %136, %134 ], [ %8, %.preheader.preheader ]
  br i1 %18, label %134, label %101

; <label>:101:                                    ; preds = %.preheader
  %102 = getelementptr inbounds i8, i8* %.0817, i64 1
  %103 = load i8, i8* %.0817, align 1
  %104 = zext i8 %103 to i64
  %105 = getelementptr inbounds i32*, i32** %11, i64 %104
  %106 = load i32*, i32** %105, align 8
  switch i32 %4, label %134 [
    i32 7, label %107
    i32 6, label %111
    i32 5, label %115
    i32 4, label %119
    i32 3, label %123
    i32 2, label %127
    i32 1, label %131
  ]

; <label>:107:                                    ; preds = %101
  %108 = getelementptr inbounds i32, i32* %106, i64 1
  %109 = load i32, i32* %106, align 4
  %110 = getelementptr inbounds i32, i32* %.0118, i64 1
  store i32 %109, i32* %.0118, align 4
  br label %111

; <label>:111:                                    ; preds = %107, %101
  %.02 = phi i32* [ %106, %101 ], [ %108, %107 ]
  %.2 = phi i32* [ %.0118, %101 ], [ %110, %107 ]
  %112 = getelementptr inbounds i32, i32* %.02, i64 1
  %113 = load i32, i32* %.02, align 4
  %114 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %113, i32* %.2, align 4
  br label %115

; <label>:115:                                    ; preds = %111, %101
  %.13 = phi i32* [ %106, %101 ], [ %112, %111 ]
  %.3 = phi i32* [ %.0118, %101 ], [ %114, %111 ]
  %116 = getelementptr inbounds i32, i32* %.13, i64 1
  %117 = load i32, i32* %.13, align 4
  %118 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %117, i32* %.3, align 4
  br label %119

; <label>:119:                                    ; preds = %115, %101
  %.24 = phi i32* [ %106, %101 ], [ %116, %115 ]
  %.4 = phi i32* [ %.0118, %101 ], [ %118, %115 ]
  %120 = getelementptr inbounds i32, i32* %.24, i64 1
  %121 = load i32, i32* %.24, align 4
  %122 = getelementptr inbounds i32, i32* %.4, i64 1
  store i32 %121, i32* %.4, align 4
  br label %123

; <label>:123:                                    ; preds = %119, %101
  %.35 = phi i32* [ %106, %101 ], [ %120, %119 ]
  %.5 = phi i32* [ %.0118, %101 ], [ %122, %119 ]
  %124 = getelementptr inbounds i32, i32* %.35, i64 1
  %125 = load i32, i32* %.35, align 4
  %126 = getelementptr inbounds i32, i32* %.5, i64 1
  store i32 %125, i32* %.5, align 4
  br label %127

; <label>:127:                                    ; preds = %123, %101
  %.46 = phi i32* [ %106, %101 ], [ %124, %123 ]
  %.6 = phi i32* [ %.0118, %101 ], [ %126, %123 ]
  %128 = getelementptr inbounds i32, i32* %.46, i64 1
  %129 = load i32, i32* %.46, align 4
  %130 = getelementptr inbounds i32, i32* %.6, i64 1
  store i32 %129, i32* %.6, align 4
  br label %131

; <label>:131:                                    ; preds = %127, %101
  %.57 = phi i32* [ %106, %101 ], [ %128, %127 ]
  %.7 = phi i32* [ %.0118, %101 ], [ %130, %127 ]
  %132 = load i32, i32* %.57, align 4
  %133 = getelementptr inbounds i32, i32* %.7, i64 1
  store i32 %132, i32* %.7, align 4
  br label %134

; <label>:134:                                    ; preds = %101, %131, %.preheader
  %.210 = phi i8* [ %.0817, %.preheader ], [ %102, %131 ], [ %102, %101 ]
  %.9 = phi i32* [ %.0118, %.preheader ], [ %133, %131 ], [ %.0118, %101 ]
  %135 = getelementptr inbounds i32, i32* %.9, i64 %16
  %136 = getelementptr inbounds i8, i8* %.210, i64 %17
  %137 = add i32 %100, -1
  %138 = icmp eq i32 %100, 0
  br i1 %138, label %._crit_edge19.loopexit28, label %.preheader

._crit_edge19.loopexit:                           ; preds = %64
  br label %._crit_edge19

._crit_edge19.loopexit28:                         ; preds = %134
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit28, %._crit_edge19.loopexit, %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* @initYCbCrConversion(%struct._TIFFRGBAImage* nocapture) unnamed_addr #0 {
  %2 = alloca i16, align 2
  %3 = alloca i16, align 2
  %4 = alloca float*, align 8
  %5 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 18
  %6 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %5, align 8
  %7 = icmp eq %struct.TIFFYCbCrToRGB* %6, null
  br i1 %7, label %8, label %20

; <label>:8:                                      ; preds = %1
  %9 = tail call i8* @_TIFFmalloc(i32 5176) #6
  %10 = bitcast %struct.TIFFYCbCrToRGB** %5 to i8**
  store i8* %9, i8** %10, align 8
  %11 = icmp eq i8* %9, null
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %8
  %13 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %14 = load %struct.tiff*, %struct.tiff** %13, align 8
  %15 = tail call i8* @TIFFFileName(%struct.tiff* %14) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %15, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.32, i64 0, i64 0)) #6
  br label %50

; <label>:16:                                     ; preds = %8
  %17 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %5, align 8
  %18 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %19 = load %struct.tiff*, %struct.tiff** %18, align 8
  tail call fastcc void @TIFFYCbCrToRGBInit(%struct.TIFFYCbCrToRGB* %17, %struct.tiff* %19)
  br label %34

; <label>:20:                                     ; preds = %1
  %21 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %22 = load %struct.tiff*, %struct.tiff** %21, align 8
  %23 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %22, i32 529, float** nonnull %4) #6
  %24 = bitcast float** %4 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %5, align 8
  %27 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %26, i64 0, i32 5, i64 0
  %28 = bitcast float* %27 to i8*
  %29 = call i32 @_TIFFmemcmp(i8* %25, i8* %28, i32 12) #6
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %34, label %31

; <label>:31:                                     ; preds = %20
  %32 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %5, align 8
  %33 = load %struct.tiff*, %struct.tiff** %21, align 8
  call fastcc void @TIFFYCbCrToRGBInit(%struct.TIFFYCbCrToRGB* %32, %struct.tiff* %33)
  br label %34

; <label>:34:                                     ; preds = %31, %20, %16
  %35 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %36 = load %struct.tiff*, %struct.tiff** %35, align 8
  %37 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %36, i32 530, i16* nonnull %2, i16* nonnull %3) #6
  %38 = load i16, i16* %2, align 2
  %39 = zext i16 %38 to i32
  %40 = shl nuw nsw i32 %39, 4
  %41 = load i16, i16* %3, align 2
  %42 = zext i16 %41 to i32
  %43 = or i32 %40, %42
  %trunc = trunc i32 %43 to i20
  switch i20 %trunc, label %49 [
    i20 68, label %50
    i20 66, label %44
    i20 65, label %45
    i20 34, label %46
    i20 33, label %47
    i20 17, label %48
  ]

; <label>:44:                                     ; preds = %34
  br label %50

; <label>:45:                                     ; preds = %34
  br label %50

; <label>:46:                                     ; preds = %34
  br label %50

; <label>:47:                                     ; preds = %34
  br label %50

; <label>:48:                                     ; preds = %34
  br label %50

; <label>:49:                                     ; preds = %34
  br label %50

; <label>:50:                                     ; preds = %34, %49, %48, %47, %46, %45, %44, %12
  %.0 = phi void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* [ null, %12 ], [ null, %49 ], [ @putcontig8bitYCbCr11tile, %48 ], [ @putcontig8bitYCbCr21tile, %47 ], [ @putcontig8bitYCbCr22tile, %46 ], [ @putcontig8bitYCbCr41tile, %45 ], [ @putcontig8bitYCbCr42tile, %44 ], [ @putcontig8bitYCbCr44tile, %34 ]
  ret void (%struct._TIFFRGBAImage*, i32*, i32, i32, i32, i32, i32, i32, i8*)* %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @setupMap(%struct._TIFFRGBAImage* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %3 = load i16, i16* %2, align 4
  %4 = zext i16 %3 to i64
  %5 = shl i64 1, %4
  %6 = add i64 %5, 4294967295
  %7 = trunc i64 %6 to i32
  %8 = shl i64 %6, 32
  %sext = add i64 %8, 4294967296
  %9 = lshr exact i64 %sext, 32
  %10 = trunc i64 %9 to i32
  %11 = tail call i8* @_TIFFmalloc(i32 %10) #6
  %12 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  store i8* %11, i8** %12, align 8
  %13 = icmp eq i8* %11, null
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %1
  %15 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %16 = load %struct.tiff*, %struct.tiff** %15, align 8
  %17 = tail call i8* @TIFFFileName(%struct.tiff* %16) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %17, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.29, i64 0, i64 0)) #6
  br label %69

; <label>:18:                                     ; preds = %1
  %19 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 9
  %20 = load i16, i16* %19, align 2
  %21 = icmp eq i16 %20, 0
  %22 = icmp slt i32 %7, 0
  br i1 %21, label %.preheader, label %.preheader2

.preheader2:                                      ; preds = %18
  br i1 %22, label %.loopexit, label %.lr.ph6.preheader

.lr.ph6.preheader:                                ; preds = %.preheader2
  %23 = add i32 %7, 1
  %xtraiter11 = and i32 %23, 1
  %lcmp.mod12 = icmp eq i32 %xtraiter11, 0
  br i1 %lcmp.mod12, label %.lr.ph6.prol.loopexit, label %.lr.ph6.prol

.lr.ph6.prol:                                     ; preds = %.lr.ph6.preheader
  %24 = load i8*, i8** %12, align 8
  store i8 0, i8* %24, align 1
  br label %.lr.ph6.prol.loopexit

.lr.ph6.prol.loopexit:                            ; preds = %.lr.ph6.preheader, %.lr.ph6.prol
  %indvars.iv8.unr = phi i64 [ 0, %.lr.ph6.preheader ], [ 1, %.lr.ph6.prol ]
  %25 = icmp eq i32 %7, 0
  br i1 %25, label %.loopexit, label %.lr.ph6.preheader17

.lr.ph6.preheader17:                              ; preds = %.lr.ph6.prol.loopexit
  %wide.trip.count10.1 = zext i32 %23 to i64
  br label %.lr.ph6

.preheader:                                       ; preds = %18
  br i1 %22, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %sext15 = shl i64 %6, 32
  %26 = ashr exact i64 %sext15, 32
  %27 = add i32 %7, 1
  %xtraiter = and i32 %27, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %28 = mul nsw i64 %26, 255
  %29 = trunc i64 %28 to i32
  %30 = sdiv i32 %29, %7
  %31 = trunc i32 %30 to i8
  %32 = load i8*, i8** %12, align 8
  store i8 %31, i8* %32, align 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ 1, %.lr.ph.prol ]
  %33 = icmp eq i32 %7, 0
  br i1 %33, label %.loopexit, label %.lr.ph.preheader16

.lr.ph.preheader16:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %27 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader16, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader16 ]
  %34 = sub nsw i64 %26, %indvars.iv
  %35 = mul nsw i64 %34, 255
  %36 = trunc i64 %35 to i32
  %37 = sdiv i32 %36, %7
  %38 = trunc i32 %37 to i8
  %39 = load i8*, i8** %12, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 %indvars.iv
  store i8 %38, i8* %40, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = sub nsw i64 %26, %indvars.iv.next
  %42 = mul nsw i64 %41, 255
  %43 = trunc i64 %42 to i32
  %44 = sdiv i32 %43, %7
  %45 = trunc i32 %44 to i8
  %46 = load i8*, i8** %12, align 8
  %47 = getelementptr inbounds i8, i8* %46, i64 %indvars.iv.next
  store i8 %45, i8* %47, align 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.loopexit.loopexit, label %.lr.ph

.lr.ph6:                                          ; preds = %.lr.ph6.preheader17, %.lr.ph6
  %indvars.iv8 = phi i64 [ %indvars.iv.next9.1, %.lr.ph6 ], [ %indvars.iv8.unr, %.lr.ph6.preheader17 ]
  %48 = mul nuw nsw i64 %indvars.iv8, 255
  %49 = trunc i64 %48 to i32
  %50 = sdiv i32 %49, %7
  %51 = trunc i32 %50 to i8
  %52 = load i8*, i8** %12, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 %indvars.iv8
  store i8 %51, i8* %53, align 1
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %54 = mul nuw nsw i64 %indvars.iv.next9, 255
  %55 = trunc i64 %54 to i32
  %56 = sdiv i32 %55, %7
  %57 = trunc i32 %56 to i8
  %58 = load i8*, i8** %12, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 %indvars.iv.next9
  store i8 %57, i8* %59, align 1
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %exitcond.114 = icmp eq i64 %indvars.iv.next9.1, %wide.trip.count10.1
  br i1 %exitcond.114, label %.loopexit.loopexit20, label %.lr.ph6

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit.loopexit20:                             ; preds = %.lr.ph6
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit20, %.loopexit.loopexit, %.lr.ph6.prol.loopexit, %.lr.ph.prol.loopexit, %.preheader2, %.preheader
  %60 = load i16, i16* %2, align 4
  %61 = icmp ult i16 %60, 9
  br i1 %61, label %62, label %69

; <label>:62:                                     ; preds = %.loopexit
  %63 = load i16, i16* %19, align 2
  %switch = icmp ult i16 %63, 2
  br i1 %switch, label %64, label %69

; <label>:64:                                     ; preds = %62
  %65 = tail call fastcc i32 @makebwmap(%struct._TIFFRGBAImage* nonnull %0)
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %69, label %67

; <label>:67:                                     ; preds = %64
  %68 = load i8*, i8** %12, align 8
  tail call void @_TIFFfree(i8* %68) #6
  store i8* null, i8** %12, align 8
  br label %69

; <label>:69:                                     ; preds = %62, %.loopexit, %67, %64, %14
  %.0 = phi i32 [ 0, %14 ], [ 0, %64 ], [ 1, %67 ], [ 1, %.loopexit ], [ 1, %62 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @checkcmap(%struct._TIFFRGBAImage* nocapture readonly) unnamed_addr #5 {
  %2 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %3 = load i16, i16* %2, align 4
  %4 = icmp eq i16 %3, 63
  br i1 %4, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %1
  %5 = zext i16 %3 to i64
  %6 = shl i64 1, %5
  %7 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 12
  %8 = load i16*, i16** %7, align 8
  %9 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 11
  %10 = load i16*, i16** %9, align 8
  %11 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 10
  %12 = load i16*, i16** %11, align 8
  br label %.lr.ph

; <label>:13:                                     ; preds = %24
  %14 = getelementptr inbounds i16, i16* %.036, i64 1
  %15 = getelementptr inbounds i16, i16* %.045, i64 1
  %16 = icmp sgt i64 %.in, 1
  br i1 %16, label %.lr.ph, label %._crit_edge.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %.in = phi i64 [ %17, %13 ], [ %6, %.lr.ph.preheader ]
  %.027 = phi i16* [ %18, %13 ], [ %12, %.lr.ph.preheader ]
  %.036 = phi i16* [ %14, %13 ], [ %10, %.lr.ph.preheader ]
  %.045 = phi i16* [ %15, %13 ], [ %8, %.lr.ph.preheader ]
  %17 = add nsw i64 %.in, -1
  %18 = getelementptr inbounds i16, i16* %.027, i64 1
  %19 = load i16, i16* %.027, align 2
  %20 = icmp ugt i16 %19, 255
  br i1 %20, label %._crit_edge.loopexit, label %21

; <label>:21:                                     ; preds = %.lr.ph
  %22 = load i16, i16* %.036, align 2
  %23 = icmp ugt i16 %22, 255
  br i1 %23, label %._crit_edge.loopexit, label %24

; <label>:24:                                     ; preds = %21
  %25 = load i16, i16* %.045, align 2
  %26 = icmp ugt i16 %25, 255
  br i1 %26, label %._crit_edge.loopexit, label %13

._crit_edge.loopexit:                             ; preds = %13, %.lr.ph, %21, %24
  %.0.ph = phi i32 [ 8, %13 ], [ 16, %.lr.ph ], [ 16, %21 ], [ 16, %24 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %.0 = phi i32 [ 8, %1 ], [ %.0.ph, %._crit_edge.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @cvtcmap(%struct._TIFFRGBAImage* nocapture readonly) unnamed_addr #4 {
  %2 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 10
  %3 = load i16*, i16** %2, align 8
  %4 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 11
  %5 = load i16*, i16** %4, align 8
  %6 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 12
  %7 = load i16*, i16** %6, align 8
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %9 = load i16, i16* %8, align 4
  %10 = icmp eq i16 %9, 63
  br i1 %10, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %1
  %11 = zext i16 %9 to i64
  %12 = shl i64 1, %11
  %13 = xor i64 %12, -1
  %14 = icmp sgt i64 %13, -2
  %smax = select i1 %14, i64 %13, i64 -2
  %15 = add i64 %12, %smax
  %16 = add i64 %15, 2
  %min.iters.check = icmp ult i64 %16, 8
  br i1 %min.iters.check, label %.lr.ph.preheader29, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader
  %n.vec = and i64 %16, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph.preheader29, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %17 = xor i64 %12, -1
  %18 = icmp sgt i64 %17, -2
  %smax3 = select i1 %18, i64 %17, i64 -2
  %19 = sub i64 -2, %smax3
  %scevgep = getelementptr i16, i16* %3, i64 %19
  %scevgep5 = getelementptr i16, i16* %3, i64 %12
  %scevgep7 = getelementptr i16, i16* %5, i64 %19
  %scevgep9 = getelementptr i16, i16* %5, i64 %12
  %scevgep11 = getelementptr i16, i16* %7, i64 %19
  %scevgep13 = getelementptr i16, i16* %7, i64 %12
  %bound0 = icmp ult i16* %scevgep, %scevgep9
  %bound1 = icmp ult i16* %scevgep7, %scevgep5
  %found.conflict = and i1 %bound0, %bound1
  %bound015 = icmp ult i16* %scevgep, %scevgep13
  %bound116 = icmp ult i16* %scevgep11, %scevgep5
  %found.conflict17 = and i1 %bound015, %bound116
  %conflict.rdx = or i1 %found.conflict, %found.conflict17
  %bound018 = icmp ult i16* %scevgep7, %scevgep13
  %bound119 = icmp ult i16* %scevgep11, %scevgep9
  %found.conflict20 = and i1 %bound018, %bound119
  %conflict.rdx21 = or i1 %conflict.rdx, %found.conflict20
  %ind.end = sub i64 %12, %n.vec
  br i1 %conflict.rdx21, label %.lr.ph.preheader29, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %20 = add i64 %n.vec, -8
  %21 = lshr exact i64 %20, 3
  %22 = and i64 %21, 1
  %lcmp.mod = icmp eq i64 %22, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %23 = add nsw i64 %12, -1
  %24 = getelementptr inbounds i16, i16* %3, i64 %23
  %25 = getelementptr i16, i16* %24, i64 -7
  %26 = bitcast i16* %25 to <8 x i16>*
  %wide.load.prol = load <8 x i16>, <8 x i16>* %26, align 2, !alias.scope !3, !noalias !6
  %27 = lshr <8 x i16> %wide.load.prol, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %28 = bitcast i16* %25 to <8 x i16>*
  store <8 x i16> %27, <8 x i16>* %28, align 2, !alias.scope !3, !noalias !6
  %29 = getelementptr inbounds i16, i16* %5, i64 %23
  %30 = getelementptr i16, i16* %29, i64 -7
  %31 = bitcast i16* %30 to <8 x i16>*
  %wide.load23.prol = load <8 x i16>, <8 x i16>* %31, align 2, !alias.scope !9, !noalias !10
  %32 = lshr <8 x i16> %wide.load23.prol, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %33 = bitcast i16* %30 to <8 x i16>*
  store <8 x i16> %32, <8 x i16>* %33, align 2, !alias.scope !9, !noalias !10
  %34 = getelementptr inbounds i16, i16* %7, i64 %23
  %35 = getelementptr i16, i16* %34, i64 -7
  %36 = bitcast i16* %35 to <8 x i16>*
  %wide.load26.prol = load <8 x i16>, <8 x i16>* %36, align 2, !alias.scope !10
  %37 = lshr <8 x i16> %wide.load26.prol, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %38 = bitcast i16* %35 to <8 x i16>*
  store <8 x i16> %37, <8 x i16>* %38, align 2, !alias.scope !10
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 8, %vector.body.prol ]
  %39 = icmp eq i64 %21, 0
  br i1 %39, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %offset.idx = sub i64 %12, %index
  %40 = add nsw i64 %offset.idx, -1
  %41 = getelementptr inbounds i16, i16* %3, i64 %40
  %42 = getelementptr i16, i16* %41, i64 -7
  %43 = bitcast i16* %42 to <8 x i16>*
  %wide.load = load <8 x i16>, <8 x i16>* %43, align 2, !alias.scope !3, !noalias !6
  %44 = lshr <8 x i16> %wide.load, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %45 = bitcast i16* %42 to <8 x i16>*
  store <8 x i16> %44, <8 x i16>* %45, align 2, !alias.scope !3, !noalias !6
  %46 = getelementptr inbounds i16, i16* %5, i64 %40
  %47 = getelementptr i16, i16* %46, i64 -7
  %48 = bitcast i16* %47 to <8 x i16>*
  %wide.load23 = load <8 x i16>, <8 x i16>* %48, align 2, !alias.scope !9, !noalias !10
  %49 = lshr <8 x i16> %wide.load23, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %50 = bitcast i16* %47 to <8 x i16>*
  store <8 x i16> %49, <8 x i16>* %50, align 2, !alias.scope !9, !noalias !10
  %51 = getelementptr inbounds i16, i16* %7, i64 %40
  %52 = getelementptr i16, i16* %51, i64 -7
  %53 = bitcast i16* %52 to <8 x i16>*
  %wide.load26 = load <8 x i16>, <8 x i16>* %53, align 2, !alias.scope !10
  %54 = lshr <8 x i16> %wide.load26, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %55 = bitcast i16* %52 to <8 x i16>*
  store <8 x i16> %54, <8 x i16>* %55, align 2, !alias.scope !10
  %index.next = add i64 %index, 8
  %offset.idx.1 = sub i64 %12, %index.next
  %56 = add nsw i64 %offset.idx.1, -1
  %57 = getelementptr inbounds i16, i16* %3, i64 %56
  %58 = getelementptr i16, i16* %57, i64 -7
  %59 = bitcast i16* %58 to <8 x i16>*
  %wide.load.1 = load <8 x i16>, <8 x i16>* %59, align 2, !alias.scope !3, !noalias !6
  %60 = lshr <8 x i16> %wide.load.1, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %61 = bitcast i16* %58 to <8 x i16>*
  store <8 x i16> %60, <8 x i16>* %61, align 2, !alias.scope !3, !noalias !6
  %62 = getelementptr inbounds i16, i16* %5, i64 %56
  %63 = getelementptr i16, i16* %62, i64 -7
  %64 = bitcast i16* %63 to <8 x i16>*
  %wide.load23.1 = load <8 x i16>, <8 x i16>* %64, align 2, !alias.scope !9, !noalias !10
  %65 = lshr <8 x i16> %wide.load23.1, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %66 = bitcast i16* %63 to <8 x i16>*
  store <8 x i16> %65, <8 x i16>* %66, align 2, !alias.scope !9, !noalias !10
  %67 = getelementptr inbounds i16, i16* %7, i64 %56
  %68 = getelementptr i16, i16* %67, i64 -7
  %69 = bitcast i16* %68 to <8 x i16>*
  %wide.load26.1 = load <8 x i16>, <8 x i16>* %69, align 2, !alias.scope !10
  %70 = lshr <8 x i16> %wide.load26.1, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %71 = bitcast i16* %68 to <8 x i16>*
  store <8 x i16> %70, <8 x i16>* %71, align 2, !alias.scope !10
  %index.next.1 = add i64 %index, 16
  %72 = icmp eq i64 %index.next.1, %n.vec
  br i1 %72, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !11

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %16, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader29

.lr.ph.preheader29:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.preheader
  %.02.in.ph = phi i64 [ %12, %vector.memcheck ], [ %12, %min.iters.checked ], [ %12, %.lr.ph.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader29, %.lr.ph
  %.02.in = phi i64 [ %.02, %.lr.ph ], [ %.02.in.ph, %.lr.ph.preheader29 ]
  %.02 = add nsw i64 %.02.in, -1
  %73 = getelementptr inbounds i16, i16* %3, i64 %.02
  %74 = load i16, i16* %73, align 2
  %75 = lshr i16 %74, 8
  store i16 %75, i16* %73, align 2
  %76 = getelementptr inbounds i16, i16* %5, i64 %.02
  %77 = load i16, i16* %76, align 2
  %78 = lshr i16 %77, 8
  store i16 %78, i16* %76, align 2
  %79 = getelementptr inbounds i16, i16* %7, i64 %.02
  %80 = load i16, i16* %79, align 2
  %81 = lshr i16 %80, 8
  store i16 %81, i16* %79, align 2
  %82 = icmp sgt i64 %.02.in, 1
  br i1 %82, label %.lr.ph, label %._crit_edge.loopexit, !llvm.loop !14

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @makecmap(%struct._TIFFRGBAImage* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %3 = load i16, i16* %2, align 4
  %4 = zext i16 %3 to i32
  %5 = udiv i32 8, %4
  %6 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 10
  %7 = load i16*, i16** %6, align 8
  %8 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 11
  %9 = load i16*, i16** %8, align 8
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 12
  %11 = load i16*, i16** %10, align 8
  %12 = shl nuw nsw i32 %5, 10
  %addconv = add nuw nsw i32 %12, 2048
  %13 = tail call i8* @_TIFFmalloc(i32 %addconv) #6
  %14 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 17
  %15 = bitcast i32*** %14 to i8**
  store i8* %13, i8** %15, align 8
  %16 = icmp eq i8* %13, null
  br i1 %16, label %17, label %21

; <label>:17:                                     ; preds = %1
  %18 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %19 = load %struct.tiff*, %struct.tiff** %18, align 8
  %20 = tail call i8* @TIFFFileName(%struct.tiff* %19) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %20, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.31, i64 0, i64 0)) #6
  br label %.loopexit

; <label>:21:                                     ; preds = %1
  %22 = load i32**, i32*** %14, align 8
  %23 = getelementptr inbounds i32*, i32** %22, i64 256
  %24 = bitcast i32** %23 to i32*
  br label %25

; <label>:25:                                     ; preds = %178, %21
  %indvars.iv = phi i64 [ 0, %21 ], [ %indvars.iv.next, %178 ]
  %.0286 = phi i32* [ %24, %21 ], [ %.1, %178 ]
  %26 = load i32**, i32*** %14, align 8
  %27 = getelementptr inbounds i32*, i32** %26, i64 %indvars.iv
  store i32* %.0286, i32** %27, align 8
  switch i16 %3, label %178 [
    i16 1, label %28
    i16 2, label %.sink.split.sink.split.sink.split
    i16 4, label %.sink.split.sink.split
    i16 8, label %.sink.split
  ]

; <label>:28:                                     ; preds = %25
  %29 = lshr i64 %indvars.iv, 7
  %.mask8 = and i64 %29, 255
  %30 = getelementptr inbounds i16, i16* %7, i64 %.mask8
  %31 = load i16, i16* %30, align 2
  %32 = and i16 %31, 255
  %33 = getelementptr inbounds i16, i16* %9, i64 %.mask8
  %34 = load i16, i16* %33, align 2
  %35 = shl i16 %34, 8
  %36 = or i16 %35, %32
  %37 = zext i16 %36 to i32
  %38 = getelementptr inbounds i16, i16* %11, i64 %.mask8
  %39 = load i16, i16* %38, align 2
  %40 = and i16 %39, 255
  %41 = zext i16 %40 to i32
  %42 = shl nuw nsw i32 %41, 16
  %43 = or i32 %37, %42
  %44 = or i32 %43, -16777216
  %45 = getelementptr inbounds i32, i32* %.0286, i64 1
  store i32 %44, i32* %.0286, align 4
  %46 = lshr i64 %indvars.iv, 6
  %47 = and i64 %46, 1
  %48 = getelementptr inbounds i16, i16* %7, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = and i16 %49, 255
  %51 = getelementptr inbounds i16, i16* %9, i64 %47
  %52 = load i16, i16* %51, align 2
  %53 = shl i16 %52, 8
  %54 = or i16 %53, %50
  %55 = zext i16 %54 to i32
  %56 = getelementptr inbounds i16, i16* %11, i64 %47
  %57 = load i16, i16* %56, align 2
  %58 = and i16 %57, 255
  %59 = zext i16 %58 to i32
  %60 = shl nuw nsw i32 %59, 16
  %61 = or i32 %55, %60
  %62 = or i32 %61, -16777216
  %63 = getelementptr inbounds i32, i32* %.0286, i64 2
  store i32 %62, i32* %45, align 4
  %64 = lshr i64 %indvars.iv, 5
  %65 = and i64 %64, 1
  %66 = getelementptr inbounds i16, i16* %7, i64 %65
  %67 = load i16, i16* %66, align 2
  %68 = and i16 %67, 255
  %69 = getelementptr inbounds i16, i16* %9, i64 %65
  %70 = load i16, i16* %69, align 2
  %71 = shl i16 %70, 8
  %72 = or i16 %71, %68
  %73 = zext i16 %72 to i32
  %74 = getelementptr inbounds i16, i16* %11, i64 %65
  %75 = load i16, i16* %74, align 2
  %76 = and i16 %75, 255
  %77 = zext i16 %76 to i32
  %78 = shl nuw nsw i32 %77, 16
  %79 = or i32 %73, %78
  %80 = or i32 %79, -16777216
  %81 = getelementptr inbounds i32, i32* %.0286, i64 3
  store i32 %80, i32* %63, align 4
  %82 = lshr i64 %indvars.iv, 4
  %83 = and i64 %82, 1
  %84 = getelementptr inbounds i16, i16* %7, i64 %83
  %85 = load i16, i16* %84, align 2
  %86 = and i16 %85, 255
  %87 = getelementptr inbounds i16, i16* %9, i64 %83
  %88 = load i16, i16* %87, align 2
  %89 = shl i16 %88, 8
  %90 = or i16 %89, %86
  %91 = zext i16 %90 to i32
  %92 = getelementptr inbounds i16, i16* %11, i64 %83
  %93 = load i16, i16* %92, align 2
  %94 = and i16 %93, 255
  %95 = zext i16 %94 to i32
  %96 = shl nuw nsw i32 %95, 16
  %97 = or i32 %91, %96
  %98 = or i32 %97, -16777216
  %99 = getelementptr inbounds i32, i32* %.0286, i64 4
  store i32 %98, i32* %81, align 4
  br label %.sink.split.sink.split.sink.split

.sink.split.sink.split.sink.split:                ; preds = %25, %28
  %.sink85 = phi i32 [ 3, %28 ], [ 6, %25 ]
  %.sink84 = phi i32 [ 1, %28 ], [ 255, %25 ]
  %.sink64 = phi i64 [ 5, %28 ], [ 1, %25 ]
  %.sink63 = phi i32* [ %99, %28 ], [ %.0286, %25 ]
  %.sink = phi i32 [ 2, %28 ], [ 4, %25 ]
  %.sink61 = phi i32 [ 1, %28 ], [ 3, %25 ]
  %.sink45 = phi i64 [ 6, %28 ], [ 2, %25 ]
  %.sink43.ph = phi i32 [ 1, %28 ], [ 2, %25 ]
  %.sink27.ph = phi i64 [ 7, %28 ], [ 3, %25 ]
  %.sink10.ph.ph = phi i64 [ 8, %28 ], [ 4, %25 ]
  %100 = trunc i64 %indvars.iv to i32
  %101 = lshr i32 %100, %.sink85
  %102 = and i32 %101, %.sink84
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i16, i16* %7, i64 %103
  %105 = load i16, i16* %104, align 2
  %106 = and i16 %105, 255
  %107 = getelementptr inbounds i16, i16* %9, i64 %103
  %108 = load i16, i16* %107, align 2
  %109 = shl i16 %108, 8
  %110 = or i16 %109, %106
  %111 = zext i16 %110 to i32
  %112 = getelementptr inbounds i16, i16* %11, i64 %103
  %113 = load i16, i16* %112, align 2
  %114 = and i16 %113, 255
  %115 = zext i16 %114 to i32
  %116 = shl nuw nsw i32 %115, 16
  %117 = or i32 %111, %116
  %118 = or i32 %117, -16777216
  %119 = getelementptr inbounds i32, i32* %.0286, i64 %.sink64
  store i32 %118, i32* %.sink63, align 4
  %120 = trunc i64 %indvars.iv to i32
  %121 = lshr i32 %120, %.sink
  %122 = and i32 %121, %.sink61
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds i16, i16* %7, i64 %123
  %125 = load i16, i16* %124, align 2
  %126 = and i16 %125, 255
  %127 = getelementptr inbounds i16, i16* %9, i64 %123
  %128 = load i16, i16* %127, align 2
  %129 = shl i16 %128, 8
  %130 = or i16 %129, %126
  %131 = zext i16 %130 to i32
  %132 = getelementptr inbounds i16, i16* %11, i64 %123
  %133 = load i16, i16* %132, align 2
  %134 = and i16 %133, 255
  %135 = zext i16 %134 to i32
  %136 = shl nuw nsw i32 %135, 16
  %137 = or i32 %131, %136
  %138 = or i32 %137, -16777216
  %139 = getelementptr inbounds i32, i32* %.0286, i64 %.sink45
  store i32 %138, i32* %119, align 4
  br label %.sink.split.sink.split

.sink.split.sink.split:                           ; preds = %.sink.split.sink.split.sink.split, %25
  %.sink43 = phi i32 [ 4, %25 ], [ %.sink43.ph, %.sink.split.sink.split.sink.split ]
  %.sink42 = phi i32 [ 255, %25 ], [ %.sink61, %.sink.split.sink.split.sink.split ]
  %.sink27 = phi i64 [ 1, %25 ], [ %.sink27.ph, %.sink.split.sink.split.sink.split ]
  %.sink26 = phi i32* [ %.0286, %25 ], [ %139, %.sink.split.sink.split.sink.split ]
  %.sink25.ph = phi i32 [ 15, %25 ], [ %.sink61, %.sink.split.sink.split.sink.split ]
  %.sink10.ph = phi i64 [ 2, %25 ], [ %.sink10.ph.ph, %.sink.split.sink.split.sink.split ]
  %140 = trunc i64 %indvars.iv to i32
  %141 = lshr i32 %140, %.sink43
  %.mask4 = and i32 %141, %.sink42
  %142 = zext i32 %.mask4 to i64
  %143 = getelementptr inbounds i16, i16* %7, i64 %142
  %144 = load i16, i16* %143, align 2
  %145 = and i16 %144, 255
  %146 = getelementptr inbounds i16, i16* %9, i64 %142
  %147 = load i16, i16* %146, align 2
  %148 = shl i16 %147, 8
  %149 = or i16 %148, %145
  %150 = zext i16 %149 to i32
  %151 = getelementptr inbounds i16, i16* %11, i64 %142
  %152 = load i16, i16* %151, align 2
  %153 = and i16 %152, 255
  %154 = zext i16 %153 to i32
  %155 = shl nuw nsw i32 %154, 16
  %156 = or i32 %150, %155
  %157 = or i32 %156, -16777216
  %158 = getelementptr inbounds i32, i32* %.0286, i64 %.sink27
  store i32 %157, i32* %.sink26, align 4
  br label %.sink.split

.sink.split:                                      ; preds = %.sink.split.sink.split, %25
  %.sink25 = phi i32 [ 255, %25 ], [ %.sink25.ph, %.sink.split.sink.split ]
  %.sink10 = phi i64 [ 1, %25 ], [ %.sink10.ph, %.sink.split.sink.split ]
  %.02.sink = phi i32* [ %.0286, %25 ], [ %158, %.sink.split.sink.split ]
  %159 = trunc i64 %indvars.iv to i32
  %160 = and i32 %.sink25, %159
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds i16, i16* %7, i64 %161
  %163 = load i16, i16* %162, align 2
  %164 = and i16 %163, 255
  %165 = getelementptr inbounds i16, i16* %9, i64 %161
  %166 = load i16, i16* %165, align 2
  %167 = shl i16 %166, 8
  %168 = or i16 %167, %164
  %169 = zext i16 %168 to i32
  %170 = getelementptr inbounds i16, i16* %11, i64 %161
  %171 = load i16, i16* %170, align 2
  %172 = and i16 %171, 255
  %173 = zext i16 %172 to i32
  %174 = shl nuw nsw i32 %173, 16
  %175 = or i32 %169, %174
  %176 = or i32 %175, -16777216
  %177 = getelementptr inbounds i32, i32* %.0286, i64 %.sink10
  store i32 %176, i32* %.02.sink, align 4
  br label %178

; <label>:178:                                    ; preds = %25, %.sink.split
  %.1 = phi i32* [ %.0286, %25 ], [ %177, %.sink.split ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %.loopexit.loopexit, label %25

.loopexit.loopexit:                               ; preds = %178
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %17
  %.0 = phi i32 [ 0, %17 ], [ 1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @makebwmap(%struct._TIFFRGBAImage* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %3 = load i8*, i8** %2, align 8
  %4 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 6
  %5 = load i16, i16* %4, align 4
  %6 = zext i16 %5 to i32
  %7 = udiv i32 8, %6
  %8 = shl nuw nsw i32 %7, 10
  %addconv = add nuw nsw i32 %8, 2048
  %9 = tail call i8* @_TIFFmalloc(i32 %addconv) #6
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 16
  %11 = bitcast i32*** %10 to i8**
  store i8* %9, i8** %11, align 8
  %12 = icmp eq i8* %9, null
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 0
  %15 = load %struct.tiff*, %struct.tiff** %14, align 8
  %16 = tail call i8* @TIFFFileName(%struct.tiff* %15) #6
  tail call void (i8*, i8*, ...) @TIFFError(i8* %16, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.30, i64 0, i64 0)) #6
  br label %.loopexit

; <label>:17:                                     ; preds = %1
  %18 = load i32**, i32*** %10, align 8
  %19 = getelementptr inbounds i32*, i32** %18, i64 256
  %20 = bitcast i32** %19 to i32*
  br label %21

; <label>:21:                                     ; preds = %143, %17
  %indvars.iv = phi i64 [ 0, %17 ], [ %indvars.iv.next, %143 ]
  %.0130 = phi i32* [ %20, %17 ], [ %.1, %143 ]
  %22 = load i32**, i32*** %10, align 8
  %23 = getelementptr inbounds i32*, i32** %22, i64 %indvars.iv
  store i32* %.0130, i32** %23, align 8
  switch i16 %5, label %143 [
    i16 1, label %24
    i16 2, label %94
    i16 4, label %120
    i16 8, label %.sink.split
  ]

; <label>:24:                                     ; preds = %21
  %25 = trunc i64 %indvars.iv to i32
  %26 = ashr i32 %25, 7
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8* %3, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = shl nuw nsw i32 %30, 8
  %32 = shl nuw nsw i32 %30, 16
  %33 = or i32 %30, %31
  %34 = or i32 %33, %32
  %35 = or i32 %34, -16777216
  %36 = getelementptr inbounds i32, i32* %.0130, i64 1
  store i32 %35, i32* %.0130, align 4
  %37 = lshr i64 %indvars.iv, 6
  %38 = and i64 %37, 1
  %39 = getelementptr inbounds i8, i8* %3, i64 %38
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = shl nuw nsw i32 %41, 8
  %43 = shl nuw nsw i32 %41, 16
  %44 = or i32 %41, %42
  %45 = or i32 %44, %43
  %46 = or i32 %45, -16777216
  %47 = getelementptr inbounds i32, i32* %.0130, i64 2
  store i32 %46, i32* %36, align 4
  %48 = lshr i64 %indvars.iv, 5
  %49 = and i64 %48, 1
  %50 = getelementptr inbounds i8, i8* %3, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = shl nuw nsw i32 %52, 8
  %54 = shl nuw nsw i32 %52, 16
  %55 = or i32 %52, %53
  %56 = or i32 %55, %54
  %57 = or i32 %56, -16777216
  %58 = getelementptr inbounds i32, i32* %.0130, i64 3
  store i32 %57, i32* %47, align 4
  %59 = lshr i64 %indvars.iv, 4
  %60 = and i64 %59, 1
  %61 = getelementptr inbounds i8, i8* %3, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = shl nuw nsw i32 %63, 8
  %65 = shl nuw nsw i32 %63, 16
  %66 = or i32 %63, %64
  %67 = or i32 %66, %65
  %68 = or i32 %67, -16777216
  %69 = getelementptr inbounds i32, i32* %.0130, i64 4
  store i32 %68, i32* %58, align 4
  %70 = lshr i64 %indvars.iv, 3
  %71 = and i64 %70, 1
  %72 = getelementptr inbounds i8, i8* %3, i64 %71
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = shl nuw nsw i32 %74, 8
  %76 = shl nuw nsw i32 %74, 16
  %77 = or i32 %74, %75
  %78 = or i32 %77, %76
  %79 = or i32 %78, -16777216
  %80 = getelementptr inbounds i32, i32* %.0130, i64 5
  store i32 %79, i32* %69, align 4
  %81 = lshr i64 %indvars.iv, 2
  %82 = and i64 %81, 1
  %83 = getelementptr inbounds i8, i8* %3, i64 %82
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = shl nuw nsw i32 %85, 8
  %87 = shl nuw nsw i32 %85, 16
  %88 = or i32 %85, %86
  %89 = or i32 %88, %87
  %90 = or i32 %89, -16777216
  %91 = getelementptr inbounds i32, i32* %.0130, i64 6
  store i32 %90, i32* %80, align 4
  %92 = lshr i64 %indvars.iv, 1
  %93 = and i64 %92, 1
  br label %.sink.split.sink.split

; <label>:94:                                     ; preds = %21
  %95 = trunc i64 %indvars.iv to i32
  %96 = ashr i32 %95, 6
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8* %3, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = shl nuw nsw i32 %100, 8
  %102 = shl nuw nsw i32 %100, 16
  %103 = or i32 %100, %101
  %104 = or i32 %103, %102
  %105 = or i32 %104, -16777216
  %106 = getelementptr inbounds i32, i32* %.0130, i64 1
  store i32 %105, i32* %.0130, align 4
  %107 = lshr i64 %indvars.iv, 4
  %108 = and i64 %107, 3
  %109 = getelementptr inbounds i8, i8* %3, i64 %108
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = shl nuw nsw i32 %111, 8
  %113 = shl nuw nsw i32 %111, 16
  %114 = or i32 %111, %112
  %115 = or i32 %114, %113
  %116 = or i32 %115, -16777216
  %117 = getelementptr inbounds i32, i32* %.0130, i64 2
  store i32 %116, i32* %106, align 4
  %118 = lshr i64 %indvars.iv, 2
  %119 = and i64 %118, 3
  br label %.sink.split.sink.split

; <label>:120:                                    ; preds = %21
  %121 = trunc i64 %indvars.iv to i32
  %122 = ashr i32 %121, 4
  %123 = sext i32 %122 to i64
  br label %.sink.split.sink.split

.sink.split.sink.split:                           ; preds = %120, %94, %24
  %.sink26 = phi i64 [ %123, %120 ], [ %119, %94 ], [ %93, %24 ]
  %.sink16 = phi i64 [ 1, %120 ], [ 3, %94 ], [ 7, %24 ]
  %.sink15 = phi i32* [ %.0130, %120 ], [ %117, %94 ], [ %91, %24 ]
  %.sink13 = phi i64 [ 15, %120 ], [ 3, %94 ], [ 1, %24 ]
  %.sink3.ph = phi i64 [ 2, %120 ], [ 4, %94 ], [ 8, %24 ]
  %124 = getelementptr inbounds i8, i8* %3, i64 %.sink26
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = shl nuw nsw i32 %126, 8
  %128 = shl nuw nsw i32 %126, 16
  %129 = or i32 %126, %127
  %130 = or i32 %129, %128
  %131 = or i32 %130, -16777216
  %132 = getelementptr inbounds i32, i32* %.0130, i64 %.sink16
  store i32 %131, i32* %.sink15, align 4
  %133 = and i64 %.sink13, %indvars.iv
  br label %.sink.split

.sink.split:                                      ; preds = %.sink.split.sink.split, %21
  %.sink = phi i64 [ %indvars.iv, %21 ], [ %133, %.sink.split.sink.split ]
  %.sink3 = phi i64 [ 1, %21 ], [ %.sink3.ph, %.sink.split.sink.split ]
  %.01.sink = phi i32* [ %.0130, %21 ], [ %132, %.sink.split.sink.split ]
  %134 = getelementptr inbounds i8, i8* %3, i64 %.sink
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = shl nuw nsw i32 %136, 8
  %138 = shl nuw nsw i32 %136, 16
  %139 = or i32 %136, %137
  %140 = or i32 %139, %138
  %141 = or i32 %140, -16777216
  %142 = getelementptr inbounds i32, i32* %.0130, i64 %.sink3
  store i32 %141, i32* %.01.sink, align 4
  br label %143

; <label>:143:                                    ; preds = %21, %.sink.split
  %.1 = phi i32* [ %.0130, %21 ], [ %142, %.sink.split ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %.loopexit.loopexit, label %21

.loopexit.loopexit:                               ; preds = %143
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %13
  %.0 = phi i32 [ 0, %13 ], [ 1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @TIFFYCbCrToRGBInit(%struct.TIFFYCbCrToRGB*, %struct.tiff*) unnamed_addr #0 {
min.iters.checked:
  %2 = alloca float*, align 8
  %3 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %0, i64 1
  %4 = bitcast %struct.TIFFYCbCrToRGB* %3 to i8*
  tail call void @_TIFFmemset(i8* %4, i32 0, i32 256) #6
  %5 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %0, i64 5, i32 4
  %6 = bitcast %struct.TIFFYCbCrToRGB* %0 to i32***
  store i32** %5, i32*** %6, align 8
  br label %vector.body

vector.body:                                      ; preds = %min.iters.checked
  %7 = bitcast i32** %5 to <128 x i8>*
  store <128 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31, i8 32, i8 33, i8 34, i8 35, i8 36, i8 37, i8 38, i8 39, i8 40, i8 41, i8 42, i8 43, i8 44, i8 45, i8 46, i8 47, i8 48, i8 49, i8 50, i8 51, i8 52, i8 53, i8 54, i8 55, i8 56, i8 57, i8 58, i8 59, i8 60, i8 61, i8 62, i8 63, i8 64, i8 65, i8 66, i8 67, i8 68, i8 69, i8 70, i8 71, i8 72, i8 73, i8 74, i8 75, i8 76, i8 77, i8 78, i8 79, i8 80, i8 81, i8 82, i8 83, i8 84, i8 85, i8 86, i8 87, i8 88, i8 89, i8 90, i8 91, i8 92, i8 93, i8 94, i8 95, i8 96, i8 97, i8 98, i8 99, i8 100, i8 101, i8 102, i8 103, i8 104, i8 105, i8 106, i8 107, i8 108, i8 109, i8 110, i8 111, i8 112, i8 113, i8 114, i8 115, i8 116, i8 117, i8 118, i8 119, i8 120, i8 121, i8 122, i8 123, i8 124, i8 125, i8 126, i8 127>, <128 x i8>* %7, align 1
  %8 = getelementptr i32*, i32** %5, i64 16
  %9 = bitcast i32** %8 to <128 x i8>*
  store <128 x i8> <i8 -128, i8 -127, i8 -126, i8 -125, i8 -124, i8 -123, i8 -122, i8 -121, i8 -120, i8 -119, i8 -118, i8 -117, i8 -116, i8 -115, i8 -114, i8 -113, i8 -112, i8 -111, i8 -110, i8 -109, i8 -108, i8 -107, i8 -106, i8 -105, i8 -104, i8 -103, i8 -102, i8 -101, i8 -100, i8 -99, i8 -98, i8 -97, i8 -96, i8 -95, i8 -94, i8 -93, i8 -92, i8 -91, i8 -90, i8 -89, i8 -88, i8 -87, i8 -86, i8 -85, i8 -84, i8 -83, i8 -82, i8 -81, i8 -80, i8 -79, i8 -78, i8 -77, i8 -76, i8 -75, i8 -74, i8 -73, i8 -72, i8 -71, i8 -70, i8 -69, i8 -68, i8 -67, i8 -66, i8 -65, i8 -64, i8 -63, i8 -62, i8 -61, i8 -60, i8 -59, i8 -58, i8 -57, i8 -56, i8 -55, i8 -54, i8 -53, i8 -52, i8 -51, i8 -50, i8 -49, i8 -48, i8 -47, i8 -46, i8 -45, i8 -44, i8 -43, i8 -42, i8 -41, i8 -40, i8 -39, i8 -38, i8 -37, i8 -36, i8 -35, i8 -34, i8 -33, i8 -32, i8 -31, i8 -30, i8 -29, i8 -28, i8 -27, i8 -26, i8 -25, i8 -24, i8 -23, i8 -22, i8 -21, i8 -20, i8 -19, i8 -18, i8 -17, i8 -16, i8 -15, i8 -14, i8 -13, i8 -12, i8 -11, i8 -10, i8 -9, i8 -8, i8 -7, i8 -6, i8 -5, i8 -4, i8 -3, i8 -2, i8 -1>, <128 x i8>* %9, align 1
  %10 = getelementptr inbounds i32*, i32** %5, i64 32
  %11 = bitcast i32** %10 to i8*
  tail call void @_TIFFmemset(i8* %11, i32 255, i32 512) #6
  %12 = call i32 (%struct.tiff*, i32, ...) @TIFFGetFieldDefaulted(%struct.tiff* %1, i32 529, float** nonnull %2) #6
  %13 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %0, i64 0, i32 5, i64 0
  %14 = bitcast float* %13 to i8*
  %15 = bitcast float** %2 to i8**
  %16 = load i8*, i8** %15, align 8
  call void @_TIFFmemcpy(i8* %14, i8* %16, i32 12) #6
  %17 = load float*, float** %2, align 8
  %18 = load float, float* %17, align 4
  %19 = fmul float %18, 2.000000e+00
  %20 = fsub float 2.000000e+00, %19
  %21 = fmul float %20, 6.553600e+04
  %22 = fpext float %21 to double
  %23 = fadd double %22, 5.000000e-01
  %24 = fptosi double %23 to i32
  %25 = fmul float %18, %20
  %26 = getelementptr inbounds float, float* %17, i64 1
  %27 = load float, float* %26, align 4
  %28 = fdiv float %25, %27
  %29 = fmul float %28, 6.553600e+04
  %30 = fpext float %29 to double
  %31 = fadd double %30, 5.000000e-01
  %32 = fptosi double %31 to i32
  %33 = sub i32 0, %32
  %34 = getelementptr inbounds float, float* %17, i64 2
  %35 = load float, float* %34, align 4
  %36 = fmul float %35, 2.000000e+00
  %37 = fsub float 2.000000e+00, %36
  %38 = fmul float %37, 6.553600e+04
  %39 = fpext float %38 to double
  %40 = fadd double %39, 5.000000e-01
  %41 = fptosi double %40 to i32
  %42 = fmul float %35, %37
  %43 = fdiv float %42, %27
  %44 = fmul float %43, 6.553600e+04
  %45 = fpext float %44 to double
  %46 = fadd double %45, 5.000000e-01
  %47 = fptosi double %46 to i32
  %48 = getelementptr inbounds i32*, i32** %5, i64 96
  %49 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %0, i64 0, i32 1
  %50 = bitcast i32** %49 to i32***
  store i32** %48, i32*** %50, align 8
  %51 = getelementptr inbounds i32*, i32** %5, i64 224
  %52 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %0, i64 0, i32 2
  %53 = bitcast i32** %52 to i32***
  store i32** %51, i32*** %53, align 8
  %54 = getelementptr inbounds i32*, i32** %5, i64 352
  %55 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %0, i64 0, i32 3
  %56 = bitcast i32** %55 to i32***
  store i32** %54, i32*** %56, align 8
  %57 = getelementptr inbounds i32*, i32** %5, i64 480
  %58 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %0, i64 0, i32 4
  %59 = bitcast i32** %58 to i32***
  store i32** %57, i32*** %59, align 8
  br label %60

; <label>:60:                                     ; preds = %60, %vector.body
  %indvars.iv = phi i64 [ 0, %vector.body ], [ %indvars.iv.next, %60 ]
  %.03 = phi i32 [ -128, %vector.body ], [ %78, %60 ]
  %61 = mul nsw i32 %.03, %24
  %62 = add nsw i32 %61, 32768
  %63 = ashr i32 %62, 16
  %64 = load i32*, i32** %49, align 8
  %65 = getelementptr inbounds i32, i32* %64, i64 %indvars.iv
  store i32 %63, i32* %65, align 4
  %66 = mul nsw i32 %.03, %41
  %67 = add nsw i32 %66, 32768
  %68 = ashr i32 %67, 16
  %69 = load i32*, i32** %52, align 8
  %70 = getelementptr inbounds i32, i32* %69, i64 %indvars.iv
  store i32 %68, i32* %70, align 4
  %71 = mul nsw i32 %.03, %33
  %72 = load i32*, i32** %55, align 8
  %73 = getelementptr inbounds i32, i32* %72, i64 %indvars.iv
  store i32 %71, i32* %73, align 4
  %74 = mul i32 %.03, %47
  %75 = sub i32 32768, %74
  %76 = load i32*, i32** %58, align 8
  %77 = getelementptr inbounds i32, i32* %76, i64 %indvars.iv
  store i32 %75, i32* %77, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %78 = add nsw i32 %.03, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %79, label %60

; <label>:79:                                     ; preds = %60
  ret void
}

declare i32 @_TIFFmemcmp(i8*, i8*, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putcontig8bitYCbCr44tile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 18
  %11 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %10, align 8
  %12 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 1
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 2
  %15 = load i32*, i32** %14, align 8
  %16 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 3
  %17 = load i32*, i32** %16, align 8
  %18 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 4
  %19 = load i32*, i32** %18, align 8
  %20 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = zext i32 %4 to i64
  %23 = getelementptr inbounds i32, i32* %1, i64 %22
  %24 = sext i32 %7 to i64
  %25 = getelementptr inbounds i32, i32* %23, i64 %24
  %26 = getelementptr inbounds i32, i32* %25, i64 %22
  %27 = getelementptr inbounds i32, i32* %26, i64 %24
  %28 = icmp ugt i32 %5, 3
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %9
  %29 = shl i32 %7, 2
  %30 = mul i32 %4, 3
  %31 = add i32 %29, %30
  %32 = getelementptr inbounds i32, i32* %27, i64 %22
  %33 = getelementptr inbounds i32, i32* %32, i64 %24
  %34 = lshr i32 %4, 2
  %35 = sext i32 %6 to i64
  %36 = sext i32 %31 to i64
  %37 = add nsw i32 %34, -1
  %38 = zext i32 %37 to i64
  %39 = shl nuw nsw i64 %38, 2
  %40 = add nuw nsw i64 %39, 4
  %41 = mul nuw nsw i64 %38, 18
  %42 = add nuw nsw i64 %41, 18
  br label %43

; <label>:43:                                     ; preds = %.lr.ph, %537
  %.020 = phi i32* [ %33, %.lr.ph ], [ %539, %537 ]
  %.0119 = phi i32* [ %1, %.lr.ph ], [ %542, %537 ]
  %.0418 = phi i32* [ %27, %.lr.ph ], [ %540, %537 ]
  %.0617 = phi i32* [ %25, %.lr.ph ], [ %541, %537 ]
  %.0816 = phi i32 [ %5, %.lr.ph ], [ %543, %537 ]
  %.0915 = phi i8* [ %8, %.lr.ph ], [ %538, %537 ]
  %scevgep25 = getelementptr i32, i32* %.0617, i64 %40
  %scevgep27 = getelementptr i32, i32* %.020, i64 %40
  br label %44

; <label>:44:                                     ; preds = %44, %43
  %.110 = phi i8* [ %.0915, %43 ], [ %534, %44 ]
  %.17 = phi i32* [ %.0617, %43 ], [ %531, %44 ]
  %.15 = phi i32* [ %.0418, %43 ], [ %532, %44 ]
  %.03 = phi i32 [ %34, %43 ], [ %535, %44 ]
  %.12 = phi i32* [ %.0119, %43 ], [ %530, %44 ]
  %.1 = phi i32* [ %.020, %43 ], [ %533, %44 ]
  %45 = getelementptr inbounds i8, i8* %.110, i64 16
  %46 = load i8, i8* %45, align 1
  %47 = getelementptr inbounds i8, i8* %.110, i64 17
  %48 = load i8, i8* %47, align 1
  %49 = load i8, i8* %.110, align 1
  %50 = zext i8 %49 to i32
  %51 = zext i8 %48 to i64
  %52 = getelementptr inbounds i32, i32* %13, i64 %51
  %53 = load i32, i32* %52, align 4
  %54 = add nsw i32 %50, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8* %21, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = zext i8 %46 to i64
  %60 = getelementptr inbounds i32, i32* %19, i64 %59
  %61 = load i32, i32* %60, align 4
  %62 = getelementptr inbounds i32, i32* %17, i64 %51
  %63 = load i32, i32* %62, align 4
  %64 = add nsw i32 %63, %61
  %65 = ashr i32 %64, 16
  %66 = add nsw i32 %65, %50
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8* %21, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = shl nuw nsw i32 %70, 8
  %72 = getelementptr inbounds i32, i32* %15, i64 %59
  %73 = load i32, i32* %72, align 4
  %74 = add nsw i32 %73, %50
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %21, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = shl nuw nsw i32 %78, 16
  %80 = or i32 %58, %71
  %81 = or i32 %80, %79
  %82 = or i32 %81, -16777216
  store i32 %82, i32* %.12, align 4
  %83 = getelementptr inbounds i8, i8* %.110, i64 1
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = load i32, i32* %52, align 4
  %87 = add nsw i32 %85, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8, i8* %21, i64 %88
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = load i32, i32* %60, align 4
  %93 = load i32, i32* %62, align 4
  %94 = add nsw i32 %93, %92
  %95 = ashr i32 %94, 16
  %96 = add nsw i32 %95, %85
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8* %21, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = shl nuw nsw i32 %100, 8
  %102 = load i32, i32* %72, align 4
  %103 = add nsw i32 %102, %85
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8* %21, i64 %104
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = shl nuw nsw i32 %107, 16
  %109 = or i32 %91, %101
  %110 = or i32 %109, %108
  %111 = or i32 %110, -16777216
  %112 = getelementptr inbounds i32, i32* %.12, i64 1
  store i32 %111, i32* %112, align 4
  %113 = getelementptr inbounds i8, i8* %.110, i64 2
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = load i32, i32* %52, align 4
  %117 = add nsw i32 %115, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8, i8* %21, i64 %118
  %120 = load i8, i8* %119, align 1
  %121 = zext i8 %120 to i32
  %122 = load i32, i32* %60, align 4
  %123 = load i32, i32* %62, align 4
  %124 = add nsw i32 %123, %122
  %125 = ashr i32 %124, 16
  %126 = add nsw i32 %125, %115
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8* %21, i64 %127
  %129 = load i8, i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = shl nuw nsw i32 %130, 8
  %132 = load i32, i32* %72, align 4
  %133 = add nsw i32 %132, %115
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i8, i8* %21, i64 %134
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i32
  %138 = shl nuw nsw i32 %137, 16
  %139 = or i32 %121, %131
  %140 = or i32 %139, %138
  %141 = or i32 %140, -16777216
  %142 = getelementptr inbounds i32, i32* %.12, i64 2
  store i32 %141, i32* %142, align 4
  %143 = getelementptr inbounds i8, i8* %.110, i64 3
  %144 = load i8, i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = load i32, i32* %52, align 4
  %147 = add nsw i32 %145, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i8, i8* %21, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = load i32, i32* %60, align 4
  %153 = load i32, i32* %62, align 4
  %154 = add nsw i32 %153, %152
  %155 = ashr i32 %154, 16
  %156 = add nsw i32 %155, %145
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i8, i8* %21, i64 %157
  %159 = load i8, i8* %158, align 1
  %160 = zext i8 %159 to i32
  %161 = shl nuw nsw i32 %160, 8
  %162 = load i32, i32* %72, align 4
  %163 = add nsw i32 %162, %145
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i8, i8* %21, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = shl nuw nsw i32 %167, 16
  %169 = or i32 %151, %161
  %170 = or i32 %169, %168
  %171 = or i32 %170, -16777216
  %172 = getelementptr inbounds i32, i32* %.12, i64 3
  store i32 %171, i32* %172, align 4
  %173 = getelementptr inbounds i8, i8* %.110, i64 4
  %174 = load i8, i8* %173, align 1
  %175 = zext i8 %174 to i32
  %176 = load i32, i32* %52, align 4
  %177 = add nsw i32 %175, %176
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, i8* %21, i64 %178
  %180 = load i8, i8* %179, align 1
  %181 = zext i8 %180 to i32
  %182 = load i32, i32* %60, align 4
  %183 = load i32, i32* %62, align 4
  %184 = add nsw i32 %183, %182
  %185 = ashr i32 %184, 16
  %186 = add nsw i32 %185, %175
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i8, i8* %21, i64 %187
  %189 = load i8, i8* %188, align 1
  %190 = zext i8 %189 to i32
  %191 = shl nuw nsw i32 %190, 8
  %192 = load i32, i32* %72, align 4
  %193 = add nsw i32 %192, %175
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds i8, i8* %21, i64 %194
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i32
  %198 = shl nuw nsw i32 %197, 16
  %199 = or i32 %181, %191
  %200 = or i32 %199, %198
  %201 = or i32 %200, -16777216
  store i32 %201, i32* %.17, align 4
  %202 = getelementptr inbounds i8, i8* %.110, i64 5
  %203 = load i8, i8* %202, align 1
  %204 = zext i8 %203 to i32
  %205 = load i32, i32* %52, align 4
  %206 = add nsw i32 %204, %205
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i8, i8* %21, i64 %207
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = load i32, i32* %60, align 4
  %212 = load i32, i32* %62, align 4
  %213 = add nsw i32 %212, %211
  %214 = ashr i32 %213, 16
  %215 = add nsw i32 %214, %204
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i8, i8* %21, i64 %216
  %218 = load i8, i8* %217, align 1
  %219 = zext i8 %218 to i32
  %220 = shl nuw nsw i32 %219, 8
  %221 = load i32, i32* %72, align 4
  %222 = add nsw i32 %221, %204
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i8, i8* %21, i64 %223
  %225 = load i8, i8* %224, align 1
  %226 = zext i8 %225 to i32
  %227 = shl nuw nsw i32 %226, 16
  %228 = or i32 %210, %220
  %229 = or i32 %228, %227
  %230 = or i32 %229, -16777216
  %231 = getelementptr inbounds i32, i32* %.17, i64 1
  store i32 %230, i32* %231, align 4
  %232 = getelementptr inbounds i8, i8* %.110, i64 6
  %233 = load i8, i8* %232, align 1
  %234 = zext i8 %233 to i32
  %235 = load i32, i32* %52, align 4
  %236 = add nsw i32 %234, %235
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i8, i8* %21, i64 %237
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = load i32, i32* %60, align 4
  %242 = load i32, i32* %62, align 4
  %243 = add nsw i32 %242, %241
  %244 = ashr i32 %243, 16
  %245 = add nsw i32 %244, %234
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds i8, i8* %21, i64 %246
  %248 = load i8, i8* %247, align 1
  %249 = zext i8 %248 to i32
  %250 = shl nuw nsw i32 %249, 8
  %251 = load i32, i32* %72, align 4
  %252 = add nsw i32 %251, %234
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds i8, i8* %21, i64 %253
  %255 = load i8, i8* %254, align 1
  %256 = zext i8 %255 to i32
  %257 = shl nuw nsw i32 %256, 16
  %258 = or i32 %240, %250
  %259 = or i32 %258, %257
  %260 = or i32 %259, -16777216
  %261 = getelementptr inbounds i32, i32* %.17, i64 2
  store i32 %260, i32* %261, align 4
  %262 = getelementptr inbounds i8, i8* %.110, i64 7
  %263 = load i8, i8* %262, align 1
  %264 = zext i8 %263 to i32
  %265 = load i32, i32* %52, align 4
  %266 = add nsw i32 %264, %265
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds i8, i8* %21, i64 %267
  %269 = load i8, i8* %268, align 1
  %270 = zext i8 %269 to i32
  %271 = load i32, i32* %60, align 4
  %272 = load i32, i32* %62, align 4
  %273 = add nsw i32 %272, %271
  %274 = ashr i32 %273, 16
  %275 = add nsw i32 %274, %264
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds i8, i8* %21, i64 %276
  %278 = load i8, i8* %277, align 1
  %279 = zext i8 %278 to i32
  %280 = shl nuw nsw i32 %279, 8
  %281 = load i32, i32* %72, align 4
  %282 = add nsw i32 %281, %264
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds i8, i8* %21, i64 %283
  %285 = load i8, i8* %284, align 1
  %286 = zext i8 %285 to i32
  %287 = shl nuw nsw i32 %286, 16
  %288 = or i32 %270, %280
  %289 = or i32 %288, %287
  %290 = or i32 %289, -16777216
  %291 = getelementptr inbounds i32, i32* %.17, i64 3
  store i32 %290, i32* %291, align 4
  %292 = getelementptr inbounds i8, i8* %.110, i64 8
  %293 = load i8, i8* %292, align 1
  %294 = zext i8 %293 to i32
  %295 = load i32, i32* %52, align 4
  %296 = add nsw i32 %294, %295
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds i8, i8* %21, i64 %297
  %299 = load i8, i8* %298, align 1
  %300 = zext i8 %299 to i32
  %301 = load i32, i32* %60, align 4
  %302 = load i32, i32* %62, align 4
  %303 = add nsw i32 %302, %301
  %304 = ashr i32 %303, 16
  %305 = add nsw i32 %304, %294
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds i8, i8* %21, i64 %306
  %308 = load i8, i8* %307, align 1
  %309 = zext i8 %308 to i32
  %310 = shl nuw nsw i32 %309, 8
  %311 = load i32, i32* %72, align 4
  %312 = add nsw i32 %311, %294
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds i8, i8* %21, i64 %313
  %315 = load i8, i8* %314, align 1
  %316 = zext i8 %315 to i32
  %317 = shl nuw nsw i32 %316, 16
  %318 = or i32 %300, %310
  %319 = or i32 %318, %317
  %320 = or i32 %319, -16777216
  store i32 %320, i32* %.15, align 4
  %321 = getelementptr inbounds i8, i8* %.110, i64 9
  %322 = load i8, i8* %321, align 1
  %323 = zext i8 %322 to i32
  %324 = load i32, i32* %52, align 4
  %325 = add nsw i32 %323, %324
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds i8, i8* %21, i64 %326
  %328 = load i8, i8* %327, align 1
  %329 = zext i8 %328 to i32
  %330 = load i32, i32* %60, align 4
  %331 = load i32, i32* %62, align 4
  %332 = add nsw i32 %331, %330
  %333 = ashr i32 %332, 16
  %334 = add nsw i32 %333, %323
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds i8, i8* %21, i64 %335
  %337 = load i8, i8* %336, align 1
  %338 = zext i8 %337 to i32
  %339 = shl nuw nsw i32 %338, 8
  %340 = load i32, i32* %72, align 4
  %341 = add nsw i32 %340, %323
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds i8, i8* %21, i64 %342
  %344 = load i8, i8* %343, align 1
  %345 = zext i8 %344 to i32
  %346 = shl nuw nsw i32 %345, 16
  %347 = or i32 %329, %339
  %348 = or i32 %347, %346
  %349 = or i32 %348, -16777216
  %350 = getelementptr inbounds i32, i32* %.15, i64 1
  store i32 %349, i32* %350, align 4
  %351 = getelementptr inbounds i8, i8* %.110, i64 10
  %352 = load i8, i8* %351, align 1
  %353 = zext i8 %352 to i32
  %354 = load i32, i32* %52, align 4
  %355 = add nsw i32 %353, %354
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i8, i8* %21, i64 %356
  %358 = load i8, i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = load i32, i32* %60, align 4
  %361 = load i32, i32* %62, align 4
  %362 = add nsw i32 %361, %360
  %363 = ashr i32 %362, 16
  %364 = add nsw i32 %363, %353
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds i8, i8* %21, i64 %365
  %367 = load i8, i8* %366, align 1
  %368 = zext i8 %367 to i32
  %369 = shl nuw nsw i32 %368, 8
  %370 = load i32, i32* %72, align 4
  %371 = add nsw i32 %370, %353
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds i8, i8* %21, i64 %372
  %374 = load i8, i8* %373, align 1
  %375 = zext i8 %374 to i32
  %376 = shl nuw nsw i32 %375, 16
  %377 = or i32 %359, %369
  %378 = or i32 %377, %376
  %379 = or i32 %378, -16777216
  %380 = getelementptr inbounds i32, i32* %.15, i64 2
  store i32 %379, i32* %380, align 4
  %381 = getelementptr inbounds i8, i8* %.110, i64 11
  %382 = load i8, i8* %381, align 1
  %383 = zext i8 %382 to i32
  %384 = load i32, i32* %52, align 4
  %385 = add nsw i32 %383, %384
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds i8, i8* %21, i64 %386
  %388 = load i8, i8* %387, align 1
  %389 = zext i8 %388 to i32
  %390 = load i32, i32* %60, align 4
  %391 = load i32, i32* %62, align 4
  %392 = add nsw i32 %391, %390
  %393 = ashr i32 %392, 16
  %394 = add nsw i32 %393, %383
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds i8, i8* %21, i64 %395
  %397 = load i8, i8* %396, align 1
  %398 = zext i8 %397 to i32
  %399 = shl nuw nsw i32 %398, 8
  %400 = load i32, i32* %72, align 4
  %401 = add nsw i32 %400, %383
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds i8, i8* %21, i64 %402
  %404 = load i8, i8* %403, align 1
  %405 = zext i8 %404 to i32
  %406 = shl nuw nsw i32 %405, 16
  %407 = or i32 %389, %399
  %408 = or i32 %407, %406
  %409 = or i32 %408, -16777216
  %410 = getelementptr inbounds i32, i32* %.15, i64 3
  store i32 %409, i32* %410, align 4
  %411 = getelementptr inbounds i8, i8* %.110, i64 12
  %412 = load i8, i8* %411, align 1
  %413 = zext i8 %412 to i32
  %414 = load i32, i32* %52, align 4
  %415 = add nsw i32 %413, %414
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds i8, i8* %21, i64 %416
  %418 = load i8, i8* %417, align 1
  %419 = zext i8 %418 to i32
  %420 = load i32, i32* %60, align 4
  %421 = load i32, i32* %62, align 4
  %422 = add nsw i32 %421, %420
  %423 = ashr i32 %422, 16
  %424 = add nsw i32 %423, %413
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds i8, i8* %21, i64 %425
  %427 = load i8, i8* %426, align 1
  %428 = zext i8 %427 to i32
  %429 = shl nuw nsw i32 %428, 8
  %430 = load i32, i32* %72, align 4
  %431 = add nsw i32 %430, %413
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds i8, i8* %21, i64 %432
  %434 = load i8, i8* %433, align 1
  %435 = zext i8 %434 to i32
  %436 = shl nuw nsw i32 %435, 16
  %437 = or i32 %419, %429
  %438 = or i32 %437, %436
  %439 = or i32 %438, -16777216
  store i32 %439, i32* %.1, align 4
  %440 = getelementptr inbounds i8, i8* %.110, i64 13
  %441 = load i8, i8* %440, align 1
  %442 = zext i8 %441 to i32
  %443 = load i32, i32* %52, align 4
  %444 = add nsw i32 %442, %443
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds i8, i8* %21, i64 %445
  %447 = load i8, i8* %446, align 1
  %448 = zext i8 %447 to i32
  %449 = load i32, i32* %60, align 4
  %450 = load i32, i32* %62, align 4
  %451 = add nsw i32 %450, %449
  %452 = ashr i32 %451, 16
  %453 = add nsw i32 %452, %442
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds i8, i8* %21, i64 %454
  %456 = load i8, i8* %455, align 1
  %457 = zext i8 %456 to i32
  %458 = shl nuw nsw i32 %457, 8
  %459 = load i32, i32* %72, align 4
  %460 = add nsw i32 %459, %442
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds i8, i8* %21, i64 %461
  %463 = load i8, i8* %462, align 1
  %464 = zext i8 %463 to i32
  %465 = shl nuw nsw i32 %464, 16
  %466 = or i32 %448, %458
  %467 = or i32 %466, %465
  %468 = or i32 %467, -16777216
  %469 = getelementptr inbounds i32, i32* %.1, i64 1
  store i32 %468, i32* %469, align 4
  %470 = getelementptr inbounds i8, i8* %.110, i64 14
  %471 = load i8, i8* %470, align 1
  %472 = zext i8 %471 to i32
  %473 = load i32, i32* %52, align 4
  %474 = add nsw i32 %472, %473
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds i8, i8* %21, i64 %475
  %477 = load i8, i8* %476, align 1
  %478 = zext i8 %477 to i32
  %479 = load i32, i32* %60, align 4
  %480 = load i32, i32* %62, align 4
  %481 = add nsw i32 %480, %479
  %482 = ashr i32 %481, 16
  %483 = add nsw i32 %482, %472
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds i8, i8* %21, i64 %484
  %486 = load i8, i8* %485, align 1
  %487 = zext i8 %486 to i32
  %488 = shl nuw nsw i32 %487, 8
  %489 = load i32, i32* %72, align 4
  %490 = add nsw i32 %489, %472
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds i8, i8* %21, i64 %491
  %493 = load i8, i8* %492, align 1
  %494 = zext i8 %493 to i32
  %495 = shl nuw nsw i32 %494, 16
  %496 = or i32 %478, %488
  %497 = or i32 %496, %495
  %498 = or i32 %497, -16777216
  %499 = getelementptr inbounds i32, i32* %.1, i64 2
  store i32 %498, i32* %499, align 4
  %500 = getelementptr inbounds i8, i8* %.110, i64 15
  %501 = load i8, i8* %500, align 1
  %502 = zext i8 %501 to i32
  %503 = load i32, i32* %52, align 4
  %504 = add nsw i32 %502, %503
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds i8, i8* %21, i64 %505
  %507 = load i8, i8* %506, align 1
  %508 = zext i8 %507 to i32
  %509 = load i32, i32* %60, align 4
  %510 = load i32, i32* %62, align 4
  %511 = add nsw i32 %510, %509
  %512 = ashr i32 %511, 16
  %513 = add nsw i32 %512, %502
  %514 = sext i32 %513 to i64
  %515 = getelementptr inbounds i8, i8* %21, i64 %514
  %516 = load i8, i8* %515, align 1
  %517 = zext i8 %516 to i32
  %518 = shl nuw nsw i32 %517, 8
  %519 = load i32, i32* %72, align 4
  %520 = add nsw i32 %519, %502
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds i8, i8* %21, i64 %521
  %523 = load i8, i8* %522, align 1
  %524 = zext i8 %523 to i32
  %525 = shl nuw nsw i32 %524, 16
  %526 = or i32 %508, %518
  %527 = or i32 %526, %525
  %528 = or i32 %527, -16777216
  %529 = getelementptr inbounds i32, i32* %.1, i64 3
  store i32 %528, i32* %529, align 4
  %530 = getelementptr inbounds i32, i32* %.12, i64 4
  %531 = getelementptr inbounds i32, i32* %.17, i64 4
  %532 = getelementptr inbounds i32, i32* %.15, i64 4
  %533 = getelementptr inbounds i32, i32* %.1, i64 4
  %534 = getelementptr inbounds i8, i8* %.110, i64 18
  %535 = add i32 %.03, -1
  %536 = icmp eq i32 %535, 0
  br i1 %536, label %537, label %44

; <label>:537:                                    ; preds = %44
  %scevgep = getelementptr i32, i32* %.0119, i64 %40
  %scevgep26 = getelementptr i32, i32* %.0418, i64 %40
  %scevgep28 = getelementptr i8, i8* %.0915, i64 %42
  %538 = getelementptr inbounds i8, i8* %scevgep28, i64 %35
  %539 = getelementptr inbounds i32, i32* %scevgep27, i64 %36
  %540 = getelementptr inbounds i32, i32* %scevgep26, i64 %36
  %541 = getelementptr inbounds i32, i32* %scevgep25, i64 %36
  %542 = getelementptr inbounds i32, i32* %scevgep, i64 %36
  %543 = add i32 %.0816, -4
  %544 = icmp ugt i32 %543, 3
  br i1 %544, label %43, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %537
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putcontig8bitYCbCr42tile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 18
  %11 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %10, align 8
  %12 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 1
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 2
  %15 = load i32*, i32** %14, align 8
  %16 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 3
  %17 = load i32*, i32** %16, align 8
  %18 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 4
  %19 = load i32*, i32** %18, align 8
  %20 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = icmp ugt i32 %5, 1
  br i1 %22, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %9
  %23 = shl i32 %7, 1
  %24 = add i32 %23, %4
  %25 = zext i32 %4 to i64
  %26 = getelementptr inbounds i32, i32* %1, i64 %25
  %27 = sext i32 %7 to i64
  %28 = getelementptr inbounds i32, i32* %26, i64 %27
  %29 = lshr i32 %4, 2
  %30 = sext i32 %6 to i64
  %31 = sext i32 %24 to i64
  %32 = add nsw i32 %29, -1
  %33 = zext i32 %32 to i64
  %34 = shl nuw nsw i64 %33, 2
  %35 = add nuw nsw i64 %34, 4
  %36 = mul nuw nsw i64 %33, 10
  %37 = add nuw nsw i64 %36, 10
  br label %38

; <label>:38:                                     ; preds = %.lr.ph, %292
  %.012 = phi i32* [ %28, %.lr.ph ], [ %294, %292 ]
  %.0111 = phi i32* [ %1, %.lr.ph ], [ %295, %292 ]
  %.0410 = phi i8* [ %8, %.lr.ph ], [ %293, %292 ]
  %.069 = phi i32 [ %5, %.lr.ph ], [ %296, %292 ]
  %scevgep15 = getelementptr i32, i32* %.012, i64 %35
  br label %39

; <label>:39:                                     ; preds = %39, %38
  %.15 = phi i8* [ %.0410, %38 ], [ %289, %39 ]
  %.03 = phi i32 [ %29, %38 ], [ %290, %39 ]
  %.12 = phi i32* [ %.0111, %38 ], [ %287, %39 ]
  %.1 = phi i32* [ %.012, %38 ], [ %288, %39 ]
  %40 = getelementptr inbounds i8, i8* %.15, i64 8
  %41 = load i8, i8* %40, align 1
  %42 = getelementptr inbounds i8, i8* %.15, i64 9
  %43 = load i8, i8* %42, align 1
  %44 = load i8, i8* %.15, align 1
  %45 = zext i8 %44 to i32
  %46 = zext i8 %43 to i64
  %47 = getelementptr inbounds i32, i32* %13, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = add nsw i32 %45, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %21, i64 %50
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = zext i8 %41 to i64
  %55 = getelementptr inbounds i32, i32* %19, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = getelementptr inbounds i32, i32* %17, i64 %46
  %58 = load i32, i32* %57, align 4
  %59 = add nsw i32 %58, %56
  %60 = ashr i32 %59, 16
  %61 = add nsw i32 %60, %45
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %21, i64 %62
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = shl nuw nsw i32 %65, 8
  %67 = getelementptr inbounds i32, i32* %15, i64 %54
  %68 = load i32, i32* %67, align 4
  %69 = add nsw i32 %68, %45
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %21, i64 %70
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = shl nuw nsw i32 %73, 16
  %75 = or i32 %53, %66
  %76 = or i32 %75, %74
  %77 = or i32 %76, -16777216
  store i32 %77, i32* %.12, align 4
  %78 = getelementptr inbounds i8, i8* %.15, i64 1
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = load i32, i32* %47, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %21, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = load i32, i32* %55, align 4
  %88 = load i32, i32* %57, align 4
  %89 = add nsw i32 %88, %87
  %90 = ashr i32 %89, 16
  %91 = add nsw i32 %90, %80
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8* %21, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = shl nuw nsw i32 %95, 8
  %97 = load i32, i32* %67, align 4
  %98 = add nsw i32 %97, %80
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i8, i8* %21, i64 %99
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i32
  %103 = shl nuw nsw i32 %102, 16
  %104 = or i32 %86, %96
  %105 = or i32 %104, %103
  %106 = or i32 %105, -16777216
  %107 = getelementptr inbounds i32, i32* %.12, i64 1
  store i32 %106, i32* %107, align 4
  %108 = getelementptr inbounds i8, i8* %.15, i64 2
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = load i32, i32* %47, align 4
  %112 = add nsw i32 %110, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %21, i64 %113
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i32
  %117 = load i32, i32* %55, align 4
  %118 = load i32, i32* %57, align 4
  %119 = add nsw i32 %118, %117
  %120 = ashr i32 %119, 16
  %121 = add nsw i32 %120, %110
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8* %21, i64 %122
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i32
  %126 = shl nuw nsw i32 %125, 8
  %127 = load i32, i32* %67, align 4
  %128 = add nsw i32 %127, %110
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, i8* %21, i64 %129
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i32
  %133 = shl nuw nsw i32 %132, 16
  %134 = or i32 %116, %126
  %135 = or i32 %134, %133
  %136 = or i32 %135, -16777216
  %137 = getelementptr inbounds i32, i32* %.12, i64 2
  store i32 %136, i32* %137, align 4
  %138 = getelementptr inbounds i8, i8* %.15, i64 3
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = load i32, i32* %47, align 4
  %142 = add nsw i32 %140, %141
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8* %21, i64 %143
  %145 = load i8, i8* %144, align 1
  %146 = zext i8 %145 to i32
  %147 = load i32, i32* %55, align 4
  %148 = load i32, i32* %57, align 4
  %149 = add nsw i32 %148, %147
  %150 = ashr i32 %149, 16
  %151 = add nsw i32 %150, %140
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8* %21, i64 %152
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = shl nuw nsw i32 %155, 8
  %157 = load i32, i32* %67, align 4
  %158 = add nsw i32 %157, %140
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i8, i8* %21, i64 %159
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = shl nuw nsw i32 %162, 16
  %164 = or i32 %146, %156
  %165 = or i32 %164, %163
  %166 = or i32 %165, -16777216
  %167 = getelementptr inbounds i32, i32* %.12, i64 3
  store i32 %166, i32* %167, align 4
  %168 = getelementptr inbounds i8, i8* %.15, i64 4
  %169 = load i8, i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = load i32, i32* %47, align 4
  %172 = add nsw i32 %170, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i8, i8* %21, i64 %173
  %175 = load i8, i8* %174, align 1
  %176 = zext i8 %175 to i32
  %177 = load i32, i32* %55, align 4
  %178 = load i32, i32* %57, align 4
  %179 = add nsw i32 %178, %177
  %180 = ashr i32 %179, 16
  %181 = add nsw i32 %180, %170
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8, i8* %21, i64 %182
  %184 = load i8, i8* %183, align 1
  %185 = zext i8 %184 to i32
  %186 = shl nuw nsw i32 %185, 8
  %187 = load i32, i32* %67, align 4
  %188 = add nsw i32 %187, %170
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i8, i8* %21, i64 %189
  %191 = load i8, i8* %190, align 1
  %192 = zext i8 %191 to i32
  %193 = shl nuw nsw i32 %192, 16
  %194 = or i32 %176, %186
  %195 = or i32 %194, %193
  %196 = or i32 %195, -16777216
  store i32 %196, i32* %.1, align 4
  %197 = getelementptr inbounds i8, i8* %.15, i64 5
  %198 = load i8, i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = load i32, i32* %47, align 4
  %201 = add nsw i32 %199, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i8, i8* %21, i64 %202
  %204 = load i8, i8* %203, align 1
  %205 = zext i8 %204 to i32
  %206 = load i32, i32* %55, align 4
  %207 = load i32, i32* %57, align 4
  %208 = add nsw i32 %207, %206
  %209 = ashr i32 %208, 16
  %210 = add nsw i32 %209, %199
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i8, i8* %21, i64 %211
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = shl nuw nsw i32 %214, 8
  %216 = load i32, i32* %67, align 4
  %217 = add nsw i32 %216, %199
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i8, i8* %21, i64 %218
  %220 = load i8, i8* %219, align 1
  %221 = zext i8 %220 to i32
  %222 = shl nuw nsw i32 %221, 16
  %223 = or i32 %205, %215
  %224 = or i32 %223, %222
  %225 = or i32 %224, -16777216
  %226 = getelementptr inbounds i32, i32* %.1, i64 1
  store i32 %225, i32* %226, align 4
  %227 = getelementptr inbounds i8, i8* %.15, i64 6
  %228 = load i8, i8* %227, align 1
  %229 = zext i8 %228 to i32
  %230 = load i32, i32* %47, align 4
  %231 = add nsw i32 %229, %230
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i8, i8* %21, i64 %232
  %234 = load i8, i8* %233, align 1
  %235 = zext i8 %234 to i32
  %236 = load i32, i32* %55, align 4
  %237 = load i32, i32* %57, align 4
  %238 = add nsw i32 %237, %236
  %239 = ashr i32 %238, 16
  %240 = add nsw i32 %239, %229
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i8, i8* %21, i64 %241
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = shl nuw nsw i32 %244, 8
  %246 = load i32, i32* %67, align 4
  %247 = add nsw i32 %246, %229
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i8, i8* %21, i64 %248
  %250 = load i8, i8* %249, align 1
  %251 = zext i8 %250 to i32
  %252 = shl nuw nsw i32 %251, 16
  %253 = or i32 %235, %245
  %254 = or i32 %253, %252
  %255 = or i32 %254, -16777216
  %256 = getelementptr inbounds i32, i32* %.1, i64 2
  store i32 %255, i32* %256, align 4
  %257 = getelementptr inbounds i8, i8* %.15, i64 7
  %258 = load i8, i8* %257, align 1
  %259 = zext i8 %258 to i32
  %260 = load i32, i32* %47, align 4
  %261 = add nsw i32 %259, %260
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds i8, i8* %21, i64 %262
  %264 = load i8, i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = load i32, i32* %55, align 4
  %267 = load i32, i32* %57, align 4
  %268 = add nsw i32 %267, %266
  %269 = ashr i32 %268, 16
  %270 = add nsw i32 %269, %259
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds i8, i8* %21, i64 %271
  %273 = load i8, i8* %272, align 1
  %274 = zext i8 %273 to i32
  %275 = shl nuw nsw i32 %274, 8
  %276 = load i32, i32* %67, align 4
  %277 = add nsw i32 %276, %259
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i8, i8* %21, i64 %278
  %280 = load i8, i8* %279, align 1
  %281 = zext i8 %280 to i32
  %282 = shl nuw nsw i32 %281, 16
  %283 = or i32 %265, %275
  %284 = or i32 %283, %282
  %285 = or i32 %284, -16777216
  %286 = getelementptr inbounds i32, i32* %.1, i64 3
  store i32 %285, i32* %286, align 4
  %287 = getelementptr inbounds i32, i32* %.12, i64 4
  %288 = getelementptr inbounds i32, i32* %.1, i64 4
  %289 = getelementptr inbounds i8, i8* %.15, i64 10
  %290 = add i32 %.03, -1
  %291 = icmp eq i32 %290, 0
  br i1 %291, label %292, label %39

; <label>:292:                                    ; preds = %39
  %scevgep = getelementptr i32, i32* %.0111, i64 %35
  %scevgep16 = getelementptr i8, i8* %.0410, i64 %37
  %293 = getelementptr inbounds i8, i8* %scevgep16, i64 %30
  %294 = getelementptr inbounds i32, i32* %scevgep15, i64 %31
  %295 = getelementptr inbounds i32, i32* %scevgep, i64 %31
  %296 = add i32 %.069, -2
  %297 = icmp ugt i32 %296, 1
  br i1 %297, label %38, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %292
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putcontig8bitYCbCr41tile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 18
  %11 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %10, align 8
  %12 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 1
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 2
  %15 = load i32*, i32** %14, align 8
  %16 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 3
  %17 = load i32*, i32** %16, align 8
  %18 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 4
  %19 = load i32*, i32** %18, align 8
  %20 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = sext i32 %6 to i64
  %23 = lshr i32 %4, 2
  %24 = sext i32 %7 to i64
  %25 = add nsw i32 %23, -1
  %26 = zext i32 %25 to i64
  %27 = shl nuw nsw i64 %26, 2
  %28 = add nuw nsw i64 %27, 4
  %29 = mul nuw nsw i64 %26, 6
  %30 = add nuw nsw i64 %29, 6
  br label %31

; <label>:31:                                     ; preds = %165, %9
  %.04 = phi i32 [ %5, %9 ], [ %168, %165 ]
  %.01 = phi i32* [ %1, %9 ], [ %167, %165 ]
  %.0 = phi i8* [ %8, %9 ], [ %166, %165 ]
  %scevgep = getelementptr i32, i32* %.01, i64 %28
  br label %32

; <label>:32:                                     ; preds = %32, %31
  %.03 = phi i32 [ %23, %31 ], [ %163, %32 ]
  %.12 = phi i32* [ %.01, %31 ], [ %161, %32 ]
  %.1 = phi i8* [ %.0, %31 ], [ %162, %32 ]
  %33 = getelementptr inbounds i8, i8* %.1, i64 4
  %34 = load i8, i8* %33, align 1
  %35 = getelementptr inbounds i8, i8* %.1, i64 5
  %36 = load i8, i8* %35, align 1
  %37 = load i8, i8* %.1, align 1
  %38 = zext i8 %37 to i32
  %39 = zext i8 %36 to i64
  %40 = getelementptr inbounds i32, i32* %13, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = add nsw i32 %38, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8* %21, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = zext i8 %34 to i64
  %48 = getelementptr inbounds i32, i32* %19, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = getelementptr inbounds i32, i32* %17, i64 %39
  %51 = load i32, i32* %50, align 4
  %52 = add nsw i32 %51, %49
  %53 = ashr i32 %52, 16
  %54 = add nsw i32 %53, %38
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8* %21, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = shl nuw nsw i32 %58, 8
  %60 = getelementptr inbounds i32, i32* %15, i64 %47
  %61 = load i32, i32* %60, align 4
  %62 = add nsw i32 %61, %38
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %21, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = shl nuw nsw i32 %66, 16
  %68 = or i32 %46, %59
  %69 = or i32 %68, %67
  %70 = or i32 %69, -16777216
  store i32 %70, i32* %.12, align 4
  %71 = getelementptr inbounds i8, i8* %.1, i64 1
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = load i32, i32* %40, align 4
  %75 = add nsw i32 %73, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8* %21, i64 %76
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = load i32, i32* %48, align 4
  %81 = load i32, i32* %50, align 4
  %82 = add nsw i32 %81, %80
  %83 = ashr i32 %82, 16
  %84 = add nsw i32 %83, %73
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8* %21, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = shl nuw nsw i32 %88, 8
  %90 = load i32, i32* %60, align 4
  %91 = add nsw i32 %90, %73
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8* %21, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = shl nuw nsw i32 %95, 16
  %97 = or i32 %79, %89
  %98 = or i32 %97, %96
  %99 = or i32 %98, -16777216
  %100 = getelementptr inbounds i32, i32* %.12, i64 1
  store i32 %99, i32* %100, align 4
  %101 = getelementptr inbounds i8, i8* %.1, i64 2
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = load i32, i32* %40, align 4
  %105 = add nsw i32 %103, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* %21, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = load i32, i32* %48, align 4
  %111 = load i32, i32* %50, align 4
  %112 = add nsw i32 %111, %110
  %113 = ashr i32 %112, 16
  %114 = add nsw i32 %113, %103
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8* %21, i64 %115
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = shl nuw nsw i32 %118, 8
  %120 = load i32, i32* %60, align 4
  %121 = add nsw i32 %120, %103
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8* %21, i64 %122
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i32
  %126 = shl nuw nsw i32 %125, 16
  %127 = or i32 %109, %119
  %128 = or i32 %127, %126
  %129 = or i32 %128, -16777216
  %130 = getelementptr inbounds i32, i32* %.12, i64 2
  store i32 %129, i32* %130, align 4
  %131 = getelementptr inbounds i8, i8* %.1, i64 3
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = load i32, i32* %40, align 4
  %135 = add nsw i32 %133, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i8, i8* %21, i64 %136
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = load i32, i32* %48, align 4
  %141 = load i32, i32* %50, align 4
  %142 = add nsw i32 %141, %140
  %143 = ashr i32 %142, 16
  %144 = add nsw i32 %143, %133
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8* %21, i64 %145
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %149 = shl nuw nsw i32 %148, 8
  %150 = load i32, i32* %60, align 4
  %151 = add nsw i32 %150, %133
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8* %21, i64 %152
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = shl nuw nsw i32 %155, 16
  %157 = or i32 %139, %149
  %158 = or i32 %157, %156
  %159 = or i32 %158, -16777216
  %160 = getelementptr inbounds i32, i32* %.12, i64 3
  store i32 %159, i32* %160, align 4
  %161 = getelementptr inbounds i32, i32* %.12, i64 4
  %162 = getelementptr inbounds i8, i8* %.1, i64 6
  %163 = add i32 %.03, -1
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %32

; <label>:165:                                    ; preds = %32
  %scevgep7 = getelementptr i8, i8* %.0, i64 %30
  %166 = getelementptr inbounds i8, i8* %scevgep7, i64 %22
  %167 = getelementptr inbounds i32, i32* %scevgep, i64 %24
  %168 = add i32 %.04, -1
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %31

; <label>:170:                                    ; preds = %165
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putcontig8bitYCbCr22tile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 18
  %11 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %10, align 8
  %12 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 1
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 2
  %15 = load i32*, i32** %14, align 8
  %16 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 3
  %17 = load i32*, i32** %16, align 8
  %18 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 4
  %19 = load i32*, i32** %18, align 8
  %20 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = icmp ugt i32 %5, 1
  br i1 %22, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %9
  %23 = shl i32 %7, 1
  %24 = add i32 %23, %4
  %25 = zext i32 %4 to i64
  %26 = getelementptr inbounds i32, i32* %1, i64 %25
  %27 = sext i32 %7 to i64
  %28 = getelementptr inbounds i32, i32* %26, i64 %27
  %29 = lshr i32 %4, 1
  %30 = sext i32 %6 to i64
  %31 = sext i32 %24 to i64
  %32 = add nsw i32 %29, -1
  %33 = zext i32 %32 to i64
  %34 = shl nuw nsw i64 %33, 1
  %35 = add nuw nsw i64 %34, 2
  %36 = mul nuw nsw i64 %33, 6
  %37 = add nuw nsw i64 %36, 6
  br label %38

; <label>:38:                                     ; preds = %.lr.ph, %172
  %.012 = phi i32* [ %28, %.lr.ph ], [ %174, %172 ]
  %.0111 = phi i32* [ %1, %.lr.ph ], [ %175, %172 ]
  %.0410 = phi i8* [ %8, %.lr.ph ], [ %173, %172 ]
  %.069 = phi i32 [ %5, %.lr.ph ], [ %176, %172 ]
  %scevgep15 = getelementptr i32, i32* %.012, i64 %35
  br label %39

; <label>:39:                                     ; preds = %39, %38
  %.15 = phi i8* [ %.0410, %38 ], [ %169, %39 ]
  %.03 = phi i32 [ %29, %38 ], [ %170, %39 ]
  %.12 = phi i32* [ %.0111, %38 ], [ %167, %39 ]
  %.1 = phi i32* [ %.012, %38 ], [ %168, %39 ]
  %40 = getelementptr inbounds i8, i8* %.15, i64 4
  %41 = load i8, i8* %40, align 1
  %42 = getelementptr inbounds i8, i8* %.15, i64 5
  %43 = load i8, i8* %42, align 1
  %44 = load i8, i8* %.15, align 1
  %45 = zext i8 %44 to i32
  %46 = zext i8 %43 to i64
  %47 = getelementptr inbounds i32, i32* %13, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = add nsw i32 %45, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %21, i64 %50
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = zext i8 %41 to i64
  %55 = getelementptr inbounds i32, i32* %19, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = getelementptr inbounds i32, i32* %17, i64 %46
  %58 = load i32, i32* %57, align 4
  %59 = add nsw i32 %58, %56
  %60 = ashr i32 %59, 16
  %61 = add nsw i32 %60, %45
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %21, i64 %62
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = shl nuw nsw i32 %65, 8
  %67 = getelementptr inbounds i32, i32* %15, i64 %54
  %68 = load i32, i32* %67, align 4
  %69 = add nsw i32 %68, %45
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %21, i64 %70
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = shl nuw nsw i32 %73, 16
  %75 = or i32 %53, %66
  %76 = or i32 %75, %74
  %77 = or i32 %76, -16777216
  store i32 %77, i32* %.12, align 4
  %78 = getelementptr inbounds i8, i8* %.15, i64 1
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = load i32, i32* %47, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %21, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = load i32, i32* %55, align 4
  %88 = load i32, i32* %57, align 4
  %89 = add nsw i32 %88, %87
  %90 = ashr i32 %89, 16
  %91 = add nsw i32 %90, %80
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8* %21, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = shl nuw nsw i32 %95, 8
  %97 = load i32, i32* %67, align 4
  %98 = add nsw i32 %97, %80
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i8, i8* %21, i64 %99
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i32
  %103 = shl nuw nsw i32 %102, 16
  %104 = or i32 %86, %96
  %105 = or i32 %104, %103
  %106 = or i32 %105, -16777216
  %107 = getelementptr inbounds i32, i32* %.12, i64 1
  store i32 %106, i32* %107, align 4
  %108 = getelementptr inbounds i8, i8* %.15, i64 2
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = load i32, i32* %47, align 4
  %112 = add nsw i32 %110, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %21, i64 %113
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i32
  %117 = load i32, i32* %55, align 4
  %118 = load i32, i32* %57, align 4
  %119 = add nsw i32 %118, %117
  %120 = ashr i32 %119, 16
  %121 = add nsw i32 %120, %110
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8* %21, i64 %122
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i32
  %126 = shl nuw nsw i32 %125, 8
  %127 = load i32, i32* %67, align 4
  %128 = add nsw i32 %127, %110
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i8, i8* %21, i64 %129
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i32
  %133 = shl nuw nsw i32 %132, 16
  %134 = or i32 %116, %126
  %135 = or i32 %134, %133
  %136 = or i32 %135, -16777216
  store i32 %136, i32* %.1, align 4
  %137 = getelementptr inbounds i8, i8* %.15, i64 3
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = load i32, i32* %47, align 4
  %141 = add nsw i32 %139, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8* %21, i64 %142
  %144 = load i8, i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = load i32, i32* %55, align 4
  %147 = load i32, i32* %57, align 4
  %148 = add nsw i32 %147, %146
  %149 = ashr i32 %148, 16
  %150 = add nsw i32 %149, %139
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i8, i8* %21, i64 %151
  %153 = load i8, i8* %152, align 1
  %154 = zext i8 %153 to i32
  %155 = shl nuw nsw i32 %154, 8
  %156 = load i32, i32* %67, align 4
  %157 = add nsw i32 %156, %139
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8* %21, i64 %158
  %160 = load i8, i8* %159, align 1
  %161 = zext i8 %160 to i32
  %162 = shl nuw nsw i32 %161, 16
  %163 = or i32 %145, %155
  %164 = or i32 %163, %162
  %165 = or i32 %164, -16777216
  %166 = getelementptr inbounds i32, i32* %.1, i64 1
  store i32 %165, i32* %166, align 4
  %167 = getelementptr inbounds i32, i32* %.12, i64 2
  %168 = getelementptr inbounds i32, i32* %.1, i64 2
  %169 = getelementptr inbounds i8, i8* %.15, i64 6
  %170 = add i32 %.03, -1
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %39

; <label>:172:                                    ; preds = %39
  %scevgep = getelementptr i32, i32* %.0111, i64 %35
  %scevgep16 = getelementptr i8, i8* %.0410, i64 %37
  %173 = getelementptr inbounds i8, i8* %scevgep16, i64 %30
  %174 = getelementptr inbounds i32, i32* %scevgep15, i64 %31
  %175 = getelementptr inbounds i32, i32* %scevgep, i64 %31
  %176 = add i32 %.069, -2
  %177 = icmp ugt i32 %176, 1
  br i1 %177, label %38, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %172
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %9
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putcontig8bitYCbCr21tile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 18
  %11 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %10, align 8
  %12 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 1
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 2
  %15 = load i32*, i32** %14, align 8
  %16 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 3
  %17 = load i32*, i32** %16, align 8
  %18 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 4
  %19 = load i32*, i32** %18, align 8
  %20 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = sext i32 %6 to i64
  %23 = lshr i32 %4, 1
  %24 = sext i32 %7 to i64
  %25 = add nsw i32 %23, -1
  %26 = zext i32 %25 to i64
  %27 = shl nuw nsw i64 %26, 1
  %28 = add nuw nsw i64 %27, 2
  %29 = shl nuw nsw i64 %26, 2
  %30 = add nuw nsw i64 %29, 4
  br label %31

; <label>:31:                                     ; preds = %105, %9
  %.04 = phi i32 [ %5, %9 ], [ %108, %105 ]
  %.01 = phi i32* [ %1, %9 ], [ %107, %105 ]
  %.0 = phi i8* [ %8, %9 ], [ %106, %105 ]
  %scevgep = getelementptr i32, i32* %.01, i64 %28
  br label %32

; <label>:32:                                     ; preds = %32, %31
  %.03 = phi i32 [ %23, %31 ], [ %103, %32 ]
  %.12 = phi i32* [ %.01, %31 ], [ %101, %32 ]
  %.1 = phi i8* [ %.0, %31 ], [ %102, %32 ]
  %33 = getelementptr inbounds i8, i8* %.1, i64 2
  %34 = load i8, i8* %33, align 1
  %35 = getelementptr inbounds i8, i8* %.1, i64 3
  %36 = load i8, i8* %35, align 1
  %37 = load i8, i8* %.1, align 1
  %38 = zext i8 %37 to i32
  %39 = zext i8 %36 to i64
  %40 = getelementptr inbounds i32, i32* %13, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = add nsw i32 %38, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8* %21, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = zext i8 %34 to i64
  %48 = getelementptr inbounds i32, i32* %19, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = getelementptr inbounds i32, i32* %17, i64 %39
  %51 = load i32, i32* %50, align 4
  %52 = add nsw i32 %51, %49
  %53 = ashr i32 %52, 16
  %54 = add nsw i32 %53, %38
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i8, i8* %21, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = shl nuw nsw i32 %58, 8
  %60 = getelementptr inbounds i32, i32* %15, i64 %47
  %61 = load i32, i32* %60, align 4
  %62 = add nsw i32 %61, %38
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %21, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = shl nuw nsw i32 %66, 16
  %68 = or i32 %46, %59
  %69 = or i32 %68, %67
  %70 = or i32 %69, -16777216
  store i32 %70, i32* %.12, align 4
  %71 = getelementptr inbounds i8, i8* %.1, i64 1
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = load i32, i32* %40, align 4
  %75 = add nsw i32 %73, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8* %21, i64 %76
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = load i32, i32* %48, align 4
  %81 = load i32, i32* %50, align 4
  %82 = add nsw i32 %81, %80
  %83 = ashr i32 %82, 16
  %84 = add nsw i32 %83, %73
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8* %21, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = shl nuw nsw i32 %88, 8
  %90 = load i32, i32* %60, align 4
  %91 = add nsw i32 %90, %73
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8* %21, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = shl nuw nsw i32 %95, 16
  %97 = or i32 %79, %89
  %98 = or i32 %97, %96
  %99 = or i32 %98, -16777216
  %100 = getelementptr inbounds i32, i32* %.12, i64 1
  store i32 %99, i32* %100, align 4
  %101 = getelementptr inbounds i32, i32* %.12, i64 2
  %102 = getelementptr inbounds i8, i8* %.1, i64 4
  %103 = add i32 %.03, -1
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %32

; <label>:105:                                    ; preds = %32
  %scevgep7 = getelementptr i8, i8* %.0, i64 %30
  %106 = getelementptr inbounds i8, i8* %scevgep7, i64 %22
  %107 = getelementptr inbounds i32, i32* %scevgep, i64 %24
  %108 = add i32 %.04, -1
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %31

; <label>:110:                                    ; preds = %105
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putcontig8bitYCbCr11tile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly) #4 {
  %10 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 18
  %11 = load %struct.TIFFYCbCrToRGB*, %struct.TIFFYCbCrToRGB** %10, align 8
  %12 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 1
  %13 = load i32*, i32** %12, align 8
  %14 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 2
  %15 = load i32*, i32** %14, align 8
  %16 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 3
  %17 = load i32*, i32** %16, align 8
  %18 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 4
  %19 = load i32*, i32** %18, align 8
  %20 = getelementptr inbounds %struct.TIFFYCbCrToRGB, %struct.TIFFYCbCrToRGB* %11, i64 0, i32 0
  %21 = load i8*, i8** %20, align 8
  %22 = sext i32 %6 to i64
  %23 = lshr i32 %4, 1
  %24 = sext i32 %7 to i64
  %25 = add nsw i32 %23, -1
  %26 = zext i32 %25 to i64
  %27 = add nuw nsw i64 %26, 1
  %28 = mul nuw nsw i64 %26, 3
  %29 = add nuw nsw i64 %28, 3
  br label %30

; <label>:30:                                     ; preds = %74, %9
  %.04 = phi i32 [ %5, %9 ], [ %77, %74 ]
  %.01 = phi i32* [ %1, %9 ], [ %76, %74 ]
  %.0 = phi i8* [ %8, %9 ], [ %75, %74 ]
  %scevgep = getelementptr i32, i32* %.01, i64 %27
  br label %31

; <label>:31:                                     ; preds = %31, %30
  %.03 = phi i32 [ %23, %30 ], [ %72, %31 ]
  %.12 = phi i32* [ %.01, %30 ], [ %70, %31 ]
  %.1 = phi i8* [ %.0, %30 ], [ %71, %31 ]
  %32 = getelementptr inbounds i8, i8* %.1, i64 1
  %33 = load i8, i8* %32, align 1
  %34 = getelementptr inbounds i8, i8* %.1, i64 2
  %35 = load i8, i8* %34, align 1
  %36 = load i8, i8* %.1, align 1
  %37 = zext i8 %36 to i32
  %38 = zext i8 %35 to i64
  %39 = getelementptr inbounds i32, i32* %13, i64 %38
  %40 = load i32, i32* %39, align 4
  %41 = add nsw i32 %37, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8* %21, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = zext i8 %33 to i64
  %47 = getelementptr inbounds i32, i32* %19, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = getelementptr inbounds i32, i32* %17, i64 %38
  %50 = load i32, i32* %49, align 4
  %51 = add nsw i32 %50, %48
  %52 = ashr i32 %51, 16
  %53 = add nsw i32 %52, %37
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8* %21, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = shl nuw nsw i32 %57, 8
  %59 = getelementptr inbounds i32, i32* %15, i64 %46
  %60 = load i32, i32* %59, align 4
  %61 = add nsw i32 %60, %37
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %21, i64 %62
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = shl nuw nsw i32 %65, 16
  %67 = or i32 %45, %58
  %68 = or i32 %67, %66
  %69 = or i32 %68, -16777216
  %70 = getelementptr inbounds i32, i32* %.12, i64 1
  store i32 %69, i32* %.12, align 4
  %71 = getelementptr inbounds i8, i8* %.1, i64 3
  %72 = add i32 %.03, -1
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %31

; <label>:74:                                     ; preds = %31
  %scevgep7 = getelementptr i8, i8* %.0, i64 %29
  %75 = getelementptr inbounds i8, i8* %scevgep7, i64 %22
  %76 = getelementptr inbounds i32, i32* %scevgep, i64 %24
  %77 = add i32 %.04, -1
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %30

; <label>:79:                                     ; preds = %74
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBAAseparate8bittile(%struct._TIFFRGBAImage* nocapture readnone, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly) #4 {
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge59, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %12
  %14 = icmp ugt i32 %4, 7
  %15 = sext i32 %6 to i64
  %16 = sext i32 %7 to i64
  %17 = add i32 %4, -8
  %18 = lshr i32 %17, 3
  %19 = shl nuw i32 %18, 3
  %20 = zext i32 %19 to i64
  %21 = add nuw nsw i64 %20, 8
  %22 = shl nuw i32 %18, 3
  %23 = sub i32 %17, %22
  %24 = add i32 %4, -8
  %25 = lshr i32 %24, 3
  %addconv = add nuw nsw i32 %25, 1
  %26 = zext i32 %addconv to i64
  %27 = shl nuw i32 %25, 3
  %28 = zext i32 %27 to i64
  %29 = add nuw nsw i64 %28, 8
  %min.iters.check = icmp ult i32 %addconv, 4
  %30 = and i32 %addconv, 3
  %n.mod.vf = zext i32 %30 to i64
  %n.vec = sub nsw i64 %26, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cast.crd = trunc i64 %n.vec to i32
  %31 = shl i32 %cast.crd, 3
  %ind.end = sub i32 %4, %31
  %32 = shl nsw i64 %n.vec, 3
  %cmp.n = icmp eq i32 %30, 0
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %427
  %.in = phi i32 [ %5, %.preheader.lr.ph ], [ %33, %427 ]
  %.0158 = phi i32* [ %1, %.preheader.lr.ph ], [ %432, %427 ]
  %.0257 = phi i8* [ %11, %.preheader.lr.ph ], [ %431, %427 ]
  %.01256 = phi i8* [ %10, %.preheader.lr.ph ], [ %430, %427 ]
  %.02255 = phi i8* [ %9, %.preheader.lr.ph ], [ %429, %427 ]
  %.03354 = phi i8* [ %8, %.preheader.lr.ph ], [ %428, %427 ]
  %.015869 = bitcast i32* %.0158 to i8*
  %33 = add i32 %.in, -1
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %scevgep65 = getelementptr i8, i8* %.0257, i64 %21
  %scevgep67 = getelementptr i8, i8* %.02255, i64 %21
  br i1 %min.iters.check, label %.lr.ph.preheader135, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader
  br i1 %cmp.zero, label %.lr.ph.preheader135, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep70 = getelementptr i32, i32* %.0158, i64 %29
  %scevgep7071 = bitcast i32* %scevgep70 to i8*
  %scevgep72 = getelementptr i8, i8* %.03354, i64 %29
  %scevgep73 = getelementptr i8, i8* %.02255, i64 %29
  %scevgep74 = getelementptr i8, i8* %.01256, i64 %29
  %scevgep75 = getelementptr i8, i8* %.0257, i64 %29
  %bound0 = icmp ult i8* %.015869, %scevgep72
  %bound1 = icmp ult i8* %.03354, %scevgep7071
  %found.conflict = and i1 %bound0, %bound1
  %bound076 = icmp ult i8* %.015869, %scevgep73
  %bound177 = icmp ult i8* %.02255, %scevgep7071
  %found.conflict78 = and i1 %bound076, %bound177
  %conflict.rdx = or i1 %found.conflict, %found.conflict78
  %bound079 = icmp ult i8* %.015869, %scevgep74
  %bound180 = icmp ult i8* %.01256, %scevgep7071
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx82 = or i1 %conflict.rdx, %found.conflict81
  %bound083 = icmp ult i8* %.015869, %scevgep75
  %bound184 = icmp ult i8* %.0257, %scevgep7071
  %found.conflict85 = and i1 %bound083, %bound184
  %conflict.rdx86 = or i1 %conflict.rdx82, %found.conflict85
  %ind.end88 = getelementptr i32, i32* %.0158, i64 %32
  %ind.end90 = getelementptr i8, i8* %.0257, i64 %32
  %ind.end92 = getelementptr i8, i8* %.01256, i64 %32
  %ind.end94 = getelementptr i8, i8* %.02255, i64 %32
  %ind.end96 = getelementptr i8, i8* %.03354, i64 %32
  br i1 %conflict.rdx86, label %.lr.ph.preheader135, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %34 = shl i64 %index, 3
  %next.gep = getelementptr i32, i32* %.0158, i64 %34
  %35 = shl i64 %index, 3
  %next.gep97 = getelementptr i8, i8* %.0257, i64 %35
  %36 = shl i64 %index, 3
  %next.gep98 = getelementptr i8, i8* %.01256, i64 %36
  %37 = shl i64 %index, 3
  %next.gep99 = getelementptr i8, i8* %.02255, i64 %37
  %38 = shl i64 %index, 3
  %next.gep100 = getelementptr i8, i8* %.03354, i64 %38
  %39 = bitcast i8* %next.gep100 to <32 x i8>*
  %wide.vec = load <32 x i8>, <32 x i8>* %39, align 1, !alias.scope !15
  %strided.vec = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 0, i32 8, i32 16, i32 24>
  %strided.vec101 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 1, i32 9, i32 17, i32 25>
  %strided.vec102 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 2, i32 10, i32 18, i32 26>
  %strided.vec103 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 3, i32 11, i32 19, i32 27>
  %strided.vec104 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 4, i32 12, i32 20, i32 28>
  %strided.vec105 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 5, i32 13, i32 21, i32 29>
  %strided.vec106 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 6, i32 14, i32 22, i32 30>
  %strided.vec107 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 7, i32 15, i32 23, i32 31>
  %40 = zext <4 x i8> %strided.vec to <4 x i32>
  %41 = bitcast i8* %next.gep99 to <32 x i8>*
  %wide.vec108 = load <32 x i8>, <32 x i8>* %41, align 1, !alias.scope !18
  %strided.vec109 = shufflevector <32 x i8> %wide.vec108, <32 x i8> undef, <4 x i32> <i32 0, i32 8, i32 16, i32 24>
  %strided.vec110 = shufflevector <32 x i8> %wide.vec108, <32 x i8> undef, <4 x i32> <i32 1, i32 9, i32 17, i32 25>
  %strided.vec111 = shufflevector <32 x i8> %wide.vec108, <32 x i8> undef, <4 x i32> <i32 2, i32 10, i32 18, i32 26>
  %strided.vec112 = shufflevector <32 x i8> %wide.vec108, <32 x i8> undef, <4 x i32> <i32 3, i32 11, i32 19, i32 27>
  %strided.vec113 = shufflevector <32 x i8> %wide.vec108, <32 x i8> undef, <4 x i32> <i32 4, i32 12, i32 20, i32 28>
  %strided.vec114 = shufflevector <32 x i8> %wide.vec108, <32 x i8> undef, <4 x i32> <i32 5, i32 13, i32 21, i32 29>
  %strided.vec115 = shufflevector <32 x i8> %wide.vec108, <32 x i8> undef, <4 x i32> <i32 6, i32 14, i32 22, i32 30>
  %strided.vec116 = shufflevector <32 x i8> %wide.vec108, <32 x i8> undef, <4 x i32> <i32 7, i32 15, i32 23, i32 31>
  %42 = zext <4 x i8> %strided.vec109 to <4 x i32>
  %43 = shl nuw nsw <4 x i32> %42, <i32 8, i32 8, i32 8, i32 8>
  %44 = or <4 x i32> %43, %40
  %45 = bitcast i8* %next.gep98 to <32 x i8>*
  %wide.vec117 = load <32 x i8>, <32 x i8>* %45, align 1, !alias.scope !20
  %strided.vec118 = shufflevector <32 x i8> %wide.vec117, <32 x i8> undef, <4 x i32> <i32 0, i32 8, i32 16, i32 24>
  %strided.vec119 = shufflevector <32 x i8> %wide.vec117, <32 x i8> undef, <4 x i32> <i32 1, i32 9, i32 17, i32 25>
  %strided.vec120 = shufflevector <32 x i8> %wide.vec117, <32 x i8> undef, <4 x i32> <i32 2, i32 10, i32 18, i32 26>
  %strided.vec121 = shufflevector <32 x i8> %wide.vec117, <32 x i8> undef, <4 x i32> <i32 3, i32 11, i32 19, i32 27>
  %strided.vec122 = shufflevector <32 x i8> %wide.vec117, <32 x i8> undef, <4 x i32> <i32 4, i32 12, i32 20, i32 28>
  %strided.vec123 = shufflevector <32 x i8> %wide.vec117, <32 x i8> undef, <4 x i32> <i32 5, i32 13, i32 21, i32 29>
  %strided.vec124 = shufflevector <32 x i8> %wide.vec117, <32 x i8> undef, <4 x i32> <i32 6, i32 14, i32 22, i32 30>
  %strided.vec125 = shufflevector <32 x i8> %wide.vec117, <32 x i8> undef, <4 x i32> <i32 7, i32 15, i32 23, i32 31>
  %46 = zext <4 x i8> %strided.vec118 to <4 x i32>
  %47 = shl nuw nsw <4 x i32> %46, <i32 16, i32 16, i32 16, i32 16>
  %48 = or <4 x i32> %44, %47
  %49 = bitcast i8* %next.gep97 to <32 x i8>*
  %wide.vec126 = load <32 x i8>, <32 x i8>* %49, align 1, !alias.scope !22
  %strided.vec127 = shufflevector <32 x i8> %wide.vec126, <32 x i8> undef, <4 x i32> <i32 0, i32 8, i32 16, i32 24>
  %strided.vec128 = shufflevector <32 x i8> %wide.vec126, <32 x i8> undef, <4 x i32> <i32 1, i32 9, i32 17, i32 25>
  %strided.vec129 = shufflevector <32 x i8> %wide.vec126, <32 x i8> undef, <4 x i32> <i32 2, i32 10, i32 18, i32 26>
  %strided.vec130 = shufflevector <32 x i8> %wide.vec126, <32 x i8> undef, <4 x i32> <i32 3, i32 11, i32 19, i32 27>
  %strided.vec131 = shufflevector <32 x i8> %wide.vec126, <32 x i8> undef, <4 x i32> <i32 4, i32 12, i32 20, i32 28>
  %strided.vec132 = shufflevector <32 x i8> %wide.vec126, <32 x i8> undef, <4 x i32> <i32 5, i32 13, i32 21, i32 29>
  %strided.vec133 = shufflevector <32 x i8> %wide.vec126, <32 x i8> undef, <4 x i32> <i32 6, i32 14, i32 22, i32 30>
  %strided.vec134 = shufflevector <32 x i8> %wide.vec126, <32 x i8> undef, <4 x i32> <i32 7, i32 15, i32 23, i32 31>
  %50 = zext <4 x i8> %strided.vec127 to <4 x i32>
  %51 = shl nuw <4 x i32> %50, <i32 24, i32 24, i32 24, i32 24>
  %52 = or <4 x i32> %48, %51
  %53 = zext <4 x i8> %strided.vec101 to <4 x i32>
  %54 = zext <4 x i8> %strided.vec110 to <4 x i32>
  %55 = shl nuw nsw <4 x i32> %54, <i32 8, i32 8, i32 8, i32 8>
  %56 = or <4 x i32> %55, %53
  %57 = zext <4 x i8> %strided.vec119 to <4 x i32>
  %58 = shl nuw nsw <4 x i32> %57, <i32 16, i32 16, i32 16, i32 16>
  %59 = or <4 x i32> %56, %58
  %60 = zext <4 x i8> %strided.vec128 to <4 x i32>
  %61 = shl nuw <4 x i32> %60, <i32 24, i32 24, i32 24, i32 24>
  %62 = or <4 x i32> %59, %61
  %63 = zext <4 x i8> %strided.vec102 to <4 x i32>
  %64 = zext <4 x i8> %strided.vec111 to <4 x i32>
  %65 = shl nuw nsw <4 x i32> %64, <i32 8, i32 8, i32 8, i32 8>
  %66 = or <4 x i32> %65, %63
  %67 = zext <4 x i8> %strided.vec120 to <4 x i32>
  %68 = shl nuw nsw <4 x i32> %67, <i32 16, i32 16, i32 16, i32 16>
  %69 = or <4 x i32> %66, %68
  %70 = zext <4 x i8> %strided.vec129 to <4 x i32>
  %71 = shl nuw <4 x i32> %70, <i32 24, i32 24, i32 24, i32 24>
  %72 = or <4 x i32> %69, %71
  %73 = zext <4 x i8> %strided.vec103 to <4 x i32>
  %74 = zext <4 x i8> %strided.vec112 to <4 x i32>
  %75 = shl nuw nsw <4 x i32> %74, <i32 8, i32 8, i32 8, i32 8>
  %76 = or <4 x i32> %75, %73
  %77 = zext <4 x i8> %strided.vec121 to <4 x i32>
  %78 = shl nuw nsw <4 x i32> %77, <i32 16, i32 16, i32 16, i32 16>
  %79 = or <4 x i32> %76, %78
  %80 = zext <4 x i8> %strided.vec130 to <4 x i32>
  %81 = shl nuw <4 x i32> %80, <i32 24, i32 24, i32 24, i32 24>
  %82 = or <4 x i32> %79, %81
  %83 = zext <4 x i8> %strided.vec104 to <4 x i32>
  %84 = zext <4 x i8> %strided.vec113 to <4 x i32>
  %85 = shl nuw nsw <4 x i32> %84, <i32 8, i32 8, i32 8, i32 8>
  %86 = or <4 x i32> %85, %83
  %87 = zext <4 x i8> %strided.vec122 to <4 x i32>
  %88 = shl nuw nsw <4 x i32> %87, <i32 16, i32 16, i32 16, i32 16>
  %89 = or <4 x i32> %86, %88
  %90 = zext <4 x i8> %strided.vec131 to <4 x i32>
  %91 = shl nuw <4 x i32> %90, <i32 24, i32 24, i32 24, i32 24>
  %92 = or <4 x i32> %89, %91
  %93 = zext <4 x i8> %strided.vec105 to <4 x i32>
  %94 = zext <4 x i8> %strided.vec114 to <4 x i32>
  %95 = shl nuw nsw <4 x i32> %94, <i32 8, i32 8, i32 8, i32 8>
  %96 = or <4 x i32> %95, %93
  %97 = zext <4 x i8> %strided.vec123 to <4 x i32>
  %98 = shl nuw nsw <4 x i32> %97, <i32 16, i32 16, i32 16, i32 16>
  %99 = or <4 x i32> %96, %98
  %100 = zext <4 x i8> %strided.vec132 to <4 x i32>
  %101 = shl nuw <4 x i32> %100, <i32 24, i32 24, i32 24, i32 24>
  %102 = or <4 x i32> %99, %101
  %103 = zext <4 x i8> %strided.vec106 to <4 x i32>
  %104 = zext <4 x i8> %strided.vec115 to <4 x i32>
  %105 = shl nuw nsw <4 x i32> %104, <i32 8, i32 8, i32 8, i32 8>
  %106 = or <4 x i32> %105, %103
  %107 = zext <4 x i8> %strided.vec124 to <4 x i32>
  %108 = shl nuw nsw <4 x i32> %107, <i32 16, i32 16, i32 16, i32 16>
  %109 = or <4 x i32> %106, %108
  %110 = zext <4 x i8> %strided.vec133 to <4 x i32>
  %111 = shl nuw <4 x i32> %110, <i32 24, i32 24, i32 24, i32 24>
  %112 = or <4 x i32> %109, %111
  %113 = getelementptr inbounds i32, i32* %next.gep, i64 7
  %114 = zext <4 x i8> %strided.vec107 to <4 x i32>
  %115 = zext <4 x i8> %strided.vec116 to <4 x i32>
  %116 = shl nuw nsw <4 x i32> %115, <i32 8, i32 8, i32 8, i32 8>
  %117 = or <4 x i32> %116, %114
  %118 = zext <4 x i8> %strided.vec125 to <4 x i32>
  %119 = shl nuw nsw <4 x i32> %118, <i32 16, i32 16, i32 16, i32 16>
  %120 = or <4 x i32> %117, %119
  %121 = zext <4 x i8> %strided.vec134 to <4 x i32>
  %122 = shl nuw <4 x i32> %121, <i32 24, i32 24, i32 24, i32 24>
  %123 = or <4 x i32> %120, %122
  %124 = getelementptr i32, i32* %113, i64 -7
  %125 = bitcast i32* %124 to <32 x i32>*
  %126 = shufflevector <4 x i32> %52, <4 x i32> %62, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %127 = shufflevector <4 x i32> %72, <4 x i32> %82, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %128 = shufflevector <4 x i32> %92, <4 x i32> %102, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %129 = shufflevector <4 x i32> %112, <4 x i32> %123, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %130 = shufflevector <8 x i32> %126, <8 x i32> %127, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %131 = shufflevector <8 x i32> %128, <8 x i32> %129, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %interleaved.vec = shufflevector <16 x i32> %130, <16 x i32> %131, <32 x i32> <i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 28, i32 1, i32 5, i32 9, i32 13, i32 17, i32 21, i32 25, i32 29, i32 2, i32 6, i32 10, i32 14, i32 18, i32 22, i32 26, i32 30, i32 3, i32 7, i32 11, i32 15, i32 19, i32 23, i32 27, i32 31>
  store <32 x i32> %interleaved.vec, <32 x i32>* %125, align 4, !alias.scope !24, !noalias !26
  %index.next = add i64 %index, 4
  %132 = icmp eq i64 %index.next, %n.vec
  br i1 %132, label %middle.block, label %vector.body, !llvm.loop !27

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.loopexit, label %.lr.ph.preheader135

.lr.ph.preheader135:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.preheader
  %.048.ph = phi i32 [ %4, %vector.memcheck ], [ %4, %min.iters.checked ], [ %4, %.lr.ph.preheader ], [ %ind.end, %middle.block ]
  %.147.ph = phi i32* [ %.0158, %vector.memcheck ], [ %.0158, %min.iters.checked ], [ %.0158, %.lr.ph.preheader ], [ %ind.end88, %middle.block ]
  %.1346.ph = phi i8* [ %.0257, %vector.memcheck ], [ %.0257, %min.iters.checked ], [ %.0257, %.lr.ph.preheader ], [ %ind.end90, %middle.block ]
  %.11345.ph = phi i8* [ %.01256, %vector.memcheck ], [ %.01256, %min.iters.checked ], [ %.01256, %.lr.ph.preheader ], [ %ind.end92, %middle.block ]
  %.12344.ph = phi i8* [ %.02255, %vector.memcheck ], [ %.02255, %min.iters.checked ], [ %.02255, %.lr.ph.preheader ], [ %ind.end94, %middle.block ]
  %.13443.ph = phi i8* [ %.03354, %vector.memcheck ], [ %.03354, %min.iters.checked ], [ %.03354, %.lr.ph.preheader ], [ %ind.end96, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader135, %.lr.ph
  %.048 = phi i32 [ %285, %.lr.ph ], [ %.048.ph, %.lr.ph.preheader135 ]
  %.147 = phi i32* [ %280, %.lr.ph ], [ %.147.ph, %.lr.ph.preheader135 ]
  %.1346 = phi i8* [ %281, %.lr.ph ], [ %.1346.ph, %.lr.ph.preheader135 ]
  %.11345 = phi i8* [ %282, %.lr.ph ], [ %.11345.ph, %.lr.ph.preheader135 ]
  %.12344 = phi i8* [ %283, %.lr.ph ], [ %.12344.ph, %.lr.ph.preheader135 ]
  %.13443 = phi i8* [ %284, %.lr.ph ], [ %.13443.ph, %.lr.ph.preheader135 ]
  %133 = getelementptr inbounds i8, i8* %.13443, i64 1
  %134 = load i8, i8* %.13443, align 1
  %135 = zext i8 %134 to i32
  %136 = getelementptr inbounds i8, i8* %.12344, i64 1
  %137 = load i8, i8* %.12344, align 1
  %138 = zext i8 %137 to i32
  %139 = shl nuw nsw i32 %138, 8
  %140 = or i32 %139, %135
  %141 = getelementptr inbounds i8, i8* %.11345, i64 1
  %142 = load i8, i8* %.11345, align 1
  %143 = zext i8 %142 to i32
  %144 = shl nuw nsw i32 %143, 16
  %145 = or i32 %140, %144
  %146 = getelementptr inbounds i8, i8* %.1346, i64 1
  %147 = load i8, i8* %.1346, align 1
  %148 = zext i8 %147 to i32
  %149 = shl nuw i32 %148, 24
  %150 = or i32 %145, %149
  %151 = getelementptr inbounds i32, i32* %.147, i64 1
  store i32 %150, i32* %.147, align 4
  %152 = getelementptr inbounds i8, i8* %.13443, i64 2
  %153 = load i8, i8* %133, align 1
  %154 = zext i8 %153 to i32
  %155 = getelementptr inbounds i8, i8* %.12344, i64 2
  %156 = load i8, i8* %136, align 1
  %157 = zext i8 %156 to i32
  %158 = shl nuw nsw i32 %157, 8
  %159 = or i32 %158, %154
  %160 = getelementptr inbounds i8, i8* %.11345, i64 2
  %161 = load i8, i8* %141, align 1
  %162 = zext i8 %161 to i32
  %163 = shl nuw nsw i32 %162, 16
  %164 = or i32 %159, %163
  %165 = getelementptr inbounds i8, i8* %.1346, i64 2
  %166 = load i8, i8* %146, align 1
  %167 = zext i8 %166 to i32
  %168 = shl nuw i32 %167, 24
  %169 = or i32 %164, %168
  %170 = getelementptr inbounds i32, i32* %.147, i64 2
  store i32 %169, i32* %151, align 4
  %171 = getelementptr inbounds i8, i8* %.13443, i64 3
  %172 = load i8, i8* %152, align 1
  %173 = zext i8 %172 to i32
  %174 = getelementptr inbounds i8, i8* %.12344, i64 3
  %175 = load i8, i8* %155, align 1
  %176 = zext i8 %175 to i32
  %177 = shl nuw nsw i32 %176, 8
  %178 = or i32 %177, %173
  %179 = getelementptr inbounds i8, i8* %.11345, i64 3
  %180 = load i8, i8* %160, align 1
  %181 = zext i8 %180 to i32
  %182 = shl nuw nsw i32 %181, 16
  %183 = or i32 %178, %182
  %184 = getelementptr inbounds i8, i8* %.1346, i64 3
  %185 = load i8, i8* %165, align 1
  %186 = zext i8 %185 to i32
  %187 = shl nuw i32 %186, 24
  %188 = or i32 %183, %187
  %189 = getelementptr inbounds i32, i32* %.147, i64 3
  store i32 %188, i32* %170, align 4
  %190 = getelementptr inbounds i8, i8* %.13443, i64 4
  %191 = load i8, i8* %171, align 1
  %192 = zext i8 %191 to i32
  %193 = getelementptr inbounds i8, i8* %.12344, i64 4
  %194 = load i8, i8* %174, align 1
  %195 = zext i8 %194 to i32
  %196 = shl nuw nsw i32 %195, 8
  %197 = or i32 %196, %192
  %198 = getelementptr inbounds i8, i8* %.11345, i64 4
  %199 = load i8, i8* %179, align 1
  %200 = zext i8 %199 to i32
  %201 = shl nuw nsw i32 %200, 16
  %202 = or i32 %197, %201
  %203 = getelementptr inbounds i8, i8* %.1346, i64 4
  %204 = load i8, i8* %184, align 1
  %205 = zext i8 %204 to i32
  %206 = shl nuw i32 %205, 24
  %207 = or i32 %202, %206
  %208 = getelementptr inbounds i32, i32* %.147, i64 4
  store i32 %207, i32* %189, align 4
  %209 = getelementptr inbounds i8, i8* %.13443, i64 5
  %210 = load i8, i8* %190, align 1
  %211 = zext i8 %210 to i32
  %212 = getelementptr inbounds i8, i8* %.12344, i64 5
  %213 = load i8, i8* %193, align 1
  %214 = zext i8 %213 to i32
  %215 = shl nuw nsw i32 %214, 8
  %216 = or i32 %215, %211
  %217 = getelementptr inbounds i8, i8* %.11345, i64 5
  %218 = load i8, i8* %198, align 1
  %219 = zext i8 %218 to i32
  %220 = shl nuw nsw i32 %219, 16
  %221 = or i32 %216, %220
  %222 = getelementptr inbounds i8, i8* %.1346, i64 5
  %223 = load i8, i8* %203, align 1
  %224 = zext i8 %223 to i32
  %225 = shl nuw i32 %224, 24
  %226 = or i32 %221, %225
  %227 = getelementptr inbounds i32, i32* %.147, i64 5
  store i32 %226, i32* %208, align 4
  %228 = getelementptr inbounds i8, i8* %.13443, i64 6
  %229 = load i8, i8* %209, align 1
  %230 = zext i8 %229 to i32
  %231 = getelementptr inbounds i8, i8* %.12344, i64 6
  %232 = load i8, i8* %212, align 1
  %233 = zext i8 %232 to i32
  %234 = shl nuw nsw i32 %233, 8
  %235 = or i32 %234, %230
  %236 = getelementptr inbounds i8, i8* %.11345, i64 6
  %237 = load i8, i8* %217, align 1
  %238 = zext i8 %237 to i32
  %239 = shl nuw nsw i32 %238, 16
  %240 = or i32 %235, %239
  %241 = getelementptr inbounds i8, i8* %.1346, i64 6
  %242 = load i8, i8* %222, align 1
  %243 = zext i8 %242 to i32
  %244 = shl nuw i32 %243, 24
  %245 = or i32 %240, %244
  %246 = getelementptr inbounds i32, i32* %.147, i64 6
  store i32 %245, i32* %227, align 4
  %247 = getelementptr inbounds i8, i8* %.13443, i64 7
  %248 = load i8, i8* %228, align 1
  %249 = zext i8 %248 to i32
  %250 = getelementptr inbounds i8, i8* %.12344, i64 7
  %251 = load i8, i8* %231, align 1
  %252 = zext i8 %251 to i32
  %253 = shl nuw nsw i32 %252, 8
  %254 = or i32 %253, %249
  %255 = getelementptr inbounds i8, i8* %.11345, i64 7
  %256 = load i8, i8* %236, align 1
  %257 = zext i8 %256 to i32
  %258 = shl nuw nsw i32 %257, 16
  %259 = or i32 %254, %258
  %260 = getelementptr inbounds i8, i8* %.1346, i64 7
  %261 = load i8, i8* %241, align 1
  %262 = zext i8 %261 to i32
  %263 = shl nuw i32 %262, 24
  %264 = or i32 %259, %263
  %265 = getelementptr inbounds i32, i32* %.147, i64 7
  store i32 %264, i32* %246, align 4
  %266 = load i8, i8* %247, align 1
  %267 = zext i8 %266 to i32
  %268 = load i8, i8* %250, align 1
  %269 = zext i8 %268 to i32
  %270 = shl nuw nsw i32 %269, 8
  %271 = or i32 %270, %267
  %272 = load i8, i8* %255, align 1
  %273 = zext i8 %272 to i32
  %274 = shl nuw nsw i32 %273, 16
  %275 = or i32 %271, %274
  %276 = load i8, i8* %260, align 1
  %277 = zext i8 %276 to i32
  %278 = shl nuw i32 %277, 24
  %279 = or i32 %275, %278
  store i32 %279, i32* %265, align 4
  %280 = getelementptr inbounds i32, i32* %.147, i64 8
  %281 = getelementptr inbounds i8, i8* %.1346, i64 8
  %282 = getelementptr inbounds i8, i8* %.11345, i64 8
  %283 = getelementptr inbounds i8, i8* %.12344, i64 8
  %284 = getelementptr inbounds i8, i8* %.13443, i64 8
  %285 = add i32 %.048, -8
  %286 = icmp ugt i32 %285, 7
  br i1 %286, label %.lr.ph, label %._crit_edge.loopexit.loopexit, !llvm.loop !28

._crit_edge.loopexit.loopexit:                    ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.loopexit, %middle.block
  %scevgep = getelementptr i32, i32* %.0158, i64 %21
  %scevgep66 = getelementptr i8, i8* %.01256, i64 %21
  %scevgep68 = getelementptr i8, i8* %.03354, i64 %21
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.134.lcssa = phi i8* [ %.03354, %.preheader ], [ %scevgep68, %._crit_edge.loopexit ]
  %.123.lcssa = phi i8* [ %.02255, %.preheader ], [ %scevgep67, %._crit_edge.loopexit ]
  %.113.lcssa = phi i8* [ %.01256, %.preheader ], [ %scevgep66, %._crit_edge.loopexit ]
  %.13.lcssa = phi i8* [ %.0257, %.preheader ], [ %scevgep65, %._crit_edge.loopexit ]
  %.1.lcssa = phi i32* [ %.0158, %.preheader ], [ %scevgep, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ %4, %.preheader ], [ %23, %._crit_edge.loopexit ]
  switch i32 %.0.lcssa, label %427 [
    i32 1, label %407
    i32 7, label %287
    i32 6, label %307
    i32 5, label %327
    i32 4, label %347
    i32 3, label %367
    i32 2, label %387
  ]

; <label>:287:                                    ; preds = %._crit_edge
  %288 = getelementptr inbounds i8, i8* %.134.lcssa, i64 1
  %289 = load i8, i8* %.134.lcssa, align 1
  %290 = zext i8 %289 to i32
  %291 = getelementptr inbounds i8, i8* %.123.lcssa, i64 1
  %292 = load i8, i8* %.123.lcssa, align 1
  %293 = zext i8 %292 to i32
  %294 = shl nuw nsw i32 %293, 8
  %295 = or i32 %294, %290
  %296 = getelementptr inbounds i8, i8* %.113.lcssa, i64 1
  %297 = load i8, i8* %.113.lcssa, align 1
  %298 = zext i8 %297 to i32
  %299 = shl nuw nsw i32 %298, 16
  %300 = or i32 %295, %299
  %301 = getelementptr inbounds i8, i8* %.13.lcssa, i64 1
  %302 = load i8, i8* %.13.lcssa, align 1
  %303 = zext i8 %302 to i32
  %304 = shl nuw i32 %303, 24
  %305 = or i32 %300, %304
  %306 = getelementptr inbounds i32, i32* %.1.lcssa, i64 1
  store i32 %305, i32* %.1.lcssa, align 4
  br label %307

; <label>:307:                                    ; preds = %._crit_edge, %287
  %.235 = phi i8* [ %288, %287 ], [ %.134.lcssa, %._crit_edge ]
  %.224 = phi i8* [ %291, %287 ], [ %.123.lcssa, %._crit_edge ]
  %.214 = phi i8* [ %296, %287 ], [ %.113.lcssa, %._crit_edge ]
  %.24 = phi i8* [ %301, %287 ], [ %.13.lcssa, %._crit_edge ]
  %.2 = phi i32* [ %306, %287 ], [ %.1.lcssa, %._crit_edge ]
  %308 = getelementptr inbounds i8, i8* %.235, i64 1
  %309 = load i8, i8* %.235, align 1
  %310 = zext i8 %309 to i32
  %311 = getelementptr inbounds i8, i8* %.224, i64 1
  %312 = load i8, i8* %.224, align 1
  %313 = zext i8 %312 to i32
  %314 = shl nuw nsw i32 %313, 8
  %315 = or i32 %314, %310
  %316 = getelementptr inbounds i8, i8* %.214, i64 1
  %317 = load i8, i8* %.214, align 1
  %318 = zext i8 %317 to i32
  %319 = shl nuw nsw i32 %318, 16
  %320 = or i32 %315, %319
  %321 = getelementptr inbounds i8, i8* %.24, i64 1
  %322 = load i8, i8* %.24, align 1
  %323 = zext i8 %322 to i32
  %324 = shl nuw i32 %323, 24
  %325 = or i32 %320, %324
  %326 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %325, i32* %.2, align 4
  br label %327

; <label>:327:                                    ; preds = %._crit_edge, %307
  %.336 = phi i8* [ %308, %307 ], [ %.134.lcssa, %._crit_edge ]
  %.325 = phi i8* [ %311, %307 ], [ %.123.lcssa, %._crit_edge ]
  %.315 = phi i8* [ %316, %307 ], [ %.113.lcssa, %._crit_edge ]
  %.35 = phi i8* [ %321, %307 ], [ %.13.lcssa, %._crit_edge ]
  %.3 = phi i32* [ %326, %307 ], [ %.1.lcssa, %._crit_edge ]
  %328 = getelementptr inbounds i8, i8* %.336, i64 1
  %329 = load i8, i8* %.336, align 1
  %330 = zext i8 %329 to i32
  %331 = getelementptr inbounds i8, i8* %.325, i64 1
  %332 = load i8, i8* %.325, align 1
  %333 = zext i8 %332 to i32
  %334 = shl nuw nsw i32 %333, 8
  %335 = or i32 %334, %330
  %336 = getelementptr inbounds i8, i8* %.315, i64 1
  %337 = load i8, i8* %.315, align 1
  %338 = zext i8 %337 to i32
  %339 = shl nuw nsw i32 %338, 16
  %340 = or i32 %335, %339
  %341 = getelementptr inbounds i8, i8* %.35, i64 1
  %342 = load i8, i8* %.35, align 1
  %343 = zext i8 %342 to i32
  %344 = shl nuw i32 %343, 24
  %345 = or i32 %340, %344
  %346 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %345, i32* %.3, align 4
  br label %347

; <label>:347:                                    ; preds = %._crit_edge, %327
  %.437 = phi i8* [ %328, %327 ], [ %.134.lcssa, %._crit_edge ]
  %.426 = phi i8* [ %331, %327 ], [ %.123.lcssa, %._crit_edge ]
  %.416 = phi i8* [ %336, %327 ], [ %.113.lcssa, %._crit_edge ]
  %.46 = phi i8* [ %341, %327 ], [ %.13.lcssa, %._crit_edge ]
  %.4 = phi i32* [ %346, %327 ], [ %.1.lcssa, %._crit_edge ]
  %348 = getelementptr inbounds i8, i8* %.437, i64 1
  %349 = load i8, i8* %.437, align 1
  %350 = zext i8 %349 to i32
  %351 = getelementptr inbounds i8, i8* %.426, i64 1
  %352 = load i8, i8* %.426, align 1
  %353 = zext i8 %352 to i32
  %354 = shl nuw nsw i32 %353, 8
  %355 = or i32 %354, %350
  %356 = getelementptr inbounds i8, i8* %.416, i64 1
  %357 = load i8, i8* %.416, align 1
  %358 = zext i8 %357 to i32
  %359 = shl nuw nsw i32 %358, 16
  %360 = or i32 %355, %359
  %361 = getelementptr inbounds i8, i8* %.46, i64 1
  %362 = load i8, i8* %.46, align 1
  %363 = zext i8 %362 to i32
  %364 = shl nuw i32 %363, 24
  %365 = or i32 %360, %364
  %366 = getelementptr inbounds i32, i32* %.4, i64 1
  store i32 %365, i32* %.4, align 4
  br label %367

; <label>:367:                                    ; preds = %._crit_edge, %347
  %.538 = phi i8* [ %348, %347 ], [ %.134.lcssa, %._crit_edge ]
  %.527 = phi i8* [ %351, %347 ], [ %.123.lcssa, %._crit_edge ]
  %.517 = phi i8* [ %356, %347 ], [ %.113.lcssa, %._crit_edge ]
  %.57 = phi i8* [ %361, %347 ], [ %.13.lcssa, %._crit_edge ]
  %.5 = phi i32* [ %366, %347 ], [ %.1.lcssa, %._crit_edge ]
  %368 = getelementptr inbounds i8, i8* %.538, i64 1
  %369 = load i8, i8* %.538, align 1
  %370 = zext i8 %369 to i32
  %371 = getelementptr inbounds i8, i8* %.527, i64 1
  %372 = load i8, i8* %.527, align 1
  %373 = zext i8 %372 to i32
  %374 = shl nuw nsw i32 %373, 8
  %375 = or i32 %374, %370
  %376 = getelementptr inbounds i8, i8* %.517, i64 1
  %377 = load i8, i8* %.517, align 1
  %378 = zext i8 %377 to i32
  %379 = shl nuw nsw i32 %378, 16
  %380 = or i32 %375, %379
  %381 = getelementptr inbounds i8, i8* %.57, i64 1
  %382 = load i8, i8* %.57, align 1
  %383 = zext i8 %382 to i32
  %384 = shl nuw i32 %383, 24
  %385 = or i32 %380, %384
  %386 = getelementptr inbounds i32, i32* %.5, i64 1
  store i32 %385, i32* %.5, align 4
  br label %387

; <label>:387:                                    ; preds = %._crit_edge, %367
  %.639 = phi i8* [ %368, %367 ], [ %.134.lcssa, %._crit_edge ]
  %.628 = phi i8* [ %371, %367 ], [ %.123.lcssa, %._crit_edge ]
  %.618 = phi i8* [ %376, %367 ], [ %.113.lcssa, %._crit_edge ]
  %.68 = phi i8* [ %381, %367 ], [ %.13.lcssa, %._crit_edge ]
  %.6 = phi i32* [ %386, %367 ], [ %.1.lcssa, %._crit_edge ]
  %388 = getelementptr inbounds i8, i8* %.639, i64 1
  %389 = load i8, i8* %.639, align 1
  %390 = zext i8 %389 to i32
  %391 = getelementptr inbounds i8, i8* %.628, i64 1
  %392 = load i8, i8* %.628, align 1
  %393 = zext i8 %392 to i32
  %394 = shl nuw nsw i32 %393, 8
  %395 = or i32 %394, %390
  %396 = getelementptr inbounds i8, i8* %.618, i64 1
  %397 = load i8, i8* %.618, align 1
  %398 = zext i8 %397 to i32
  %399 = shl nuw nsw i32 %398, 16
  %400 = or i32 %395, %399
  %401 = getelementptr inbounds i8, i8* %.68, i64 1
  %402 = load i8, i8* %.68, align 1
  %403 = zext i8 %402 to i32
  %404 = shl nuw i32 %403, 24
  %405 = or i32 %400, %404
  %406 = getelementptr inbounds i32, i32* %.6, i64 1
  store i32 %405, i32* %.6, align 4
  br label %407

; <label>:407:                                    ; preds = %._crit_edge, %387
  %.740 = phi i8* [ %388, %387 ], [ %.134.lcssa, %._crit_edge ]
  %.729 = phi i8* [ %391, %387 ], [ %.123.lcssa, %._crit_edge ]
  %.719 = phi i8* [ %396, %387 ], [ %.113.lcssa, %._crit_edge ]
  %.79 = phi i8* [ %401, %387 ], [ %.13.lcssa, %._crit_edge ]
  %.7 = phi i32* [ %406, %387 ], [ %.1.lcssa, %._crit_edge ]
  %408 = getelementptr inbounds i8, i8* %.740, i64 1
  %409 = load i8, i8* %.740, align 1
  %410 = zext i8 %409 to i32
  %411 = getelementptr inbounds i8, i8* %.729, i64 1
  %412 = load i8, i8* %.729, align 1
  %413 = zext i8 %412 to i32
  %414 = shl nuw nsw i32 %413, 8
  %415 = or i32 %414, %410
  %416 = getelementptr inbounds i8, i8* %.719, i64 1
  %417 = load i8, i8* %.719, align 1
  %418 = zext i8 %417 to i32
  %419 = shl nuw nsw i32 %418, 16
  %420 = or i32 %415, %419
  %421 = getelementptr inbounds i8, i8* %.79, i64 1
  %422 = load i8, i8* %.79, align 1
  %423 = zext i8 %422 to i32
  %424 = shl nuw i32 %423, 24
  %425 = or i32 %420, %424
  %426 = getelementptr inbounds i32, i32* %.7, i64 1
  store i32 %425, i32* %.7, align 4
  br label %427

; <label>:427:                                    ; preds = %407, %._crit_edge
  %.942 = phi i8* [ %408, %407 ], [ %.134.lcssa, %._crit_edge ]
  %.931 = phi i8* [ %411, %407 ], [ %.123.lcssa, %._crit_edge ]
  %.921 = phi i8* [ %416, %407 ], [ %.113.lcssa, %._crit_edge ]
  %.911 = phi i8* [ %421, %407 ], [ %.13.lcssa, %._crit_edge ]
  %.9 = phi i32* [ %426, %407 ], [ %.1.lcssa, %._crit_edge ]
  %428 = getelementptr inbounds i8, i8* %.942, i64 %15
  %429 = getelementptr inbounds i8, i8* %.931, i64 %15
  %430 = getelementptr inbounds i8, i8* %.921, i64 %15
  %431 = getelementptr inbounds i8, i8* %.911, i64 %15
  %432 = getelementptr inbounds i32, i32* %.9, i64 %16
  %433 = icmp eq i32 %33, 0
  br i1 %433, label %._crit_edge59.loopexit, label %.preheader

._crit_edge59.loopexit:                           ; preds = %427
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %12
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBUAseparate8bittile(%struct._TIFFRGBAImage* nocapture readnone, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly) #4 {
  %13 = bitcast i32* %1 to i8*
  %14 = icmp eq i32 %5, 0
  br i1 %14, label %._crit_edge26, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %12
  %15 = icmp eq i32 %4, 0
  %16 = sext i32 %6 to i64
  %17 = sext i32 %7 to i64
  br i1 %15, label %._crit_edge26, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %18 = add i32 %4, -1
  %19 = zext i32 %18 to i64
  %20 = add nuw nsw i64 %19, 1
  %21 = add nsw i64 %17, %19
  %22 = shl nsw i64 %21, 2
  %23 = add nsw i64 %22, 4
  %scevgep36 = getelementptr i32, i32* %1, i64 %20
  %scevgep3637 = bitcast i32* %scevgep36 to i8*
  %24 = add nsw i64 %16, %19
  %25 = add nsw i64 %24, 1
  %min.iters.check = icmp ult i64 %20, 4
  %n.vec = and i64 %20, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end61 = sub i32 %4, %cast.crd
  %cmp.n = icmp eq i64 %20, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvar = phi i64 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge ]
  %.in = phi i32 [ %5, %.preheader.preheader ], [ %29, %._crit_edge ]
  %.025 = phi i8* [ %11, %.preheader.preheader ], [ %82, %._crit_edge ]
  %.0124 = phi i32* [ %1, %.preheader.preheader ], [ %83, %._crit_edge ]
  %.0423 = phi i8* [ %10, %.preheader.preheader ], [ %81, %._crit_edge ]
  %.0622 = phi i8* [ %9, %.preheader.preheader ], [ %80, %._crit_edge ]
  %.0921 = phi i8* [ %8, %.preheader.preheader ], [ %79, %._crit_edge ]
  %26 = mul i64 %23, %indvar
  %uglygep = getelementptr i8, i8* %13, i64 %26
  %uglygep38 = getelementptr i8, i8* %scevgep3637, i64 %26
  %27 = mul i64 %25, %indvar
  %scevgep39 = getelementptr i8, i8* %11, i64 %27
  %28 = add i64 %20, %27
  %scevgep40 = getelementptr i8, i8* %11, i64 %28
  %scevgep41 = getelementptr i8, i8* %8, i64 %27
  %scevgep42 = getelementptr i8, i8* %8, i64 %28
  %scevgep43 = getelementptr i8, i8* %9, i64 %27
  %scevgep44 = getelementptr i8, i8* %9, i64 %28
  %scevgep45 = getelementptr i8, i8* %10, i64 %27
  %scevgep46 = getelementptr i8, i8* %10, i64 %28
  %29 = add i32 %.in, -1
  %scevgep32 = getelementptr i8, i8* %.0921, i64 %20
  %scevgep34 = getelementptr i8, i8* %.0423, i64 %20
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %uglygep, %scevgep40
  %bound1 = icmp ult i8* %scevgep39, %uglygep38
  %found.conflict = and i1 %bound0, %bound1
  %bound047 = icmp ult i8* %uglygep, %scevgep42
  %bound148 = icmp ult i8* %scevgep41, %uglygep38
  %found.conflict49 = and i1 %bound047, %bound148
  %conflict.rdx = or i1 %found.conflict, %found.conflict49
  %bound050 = icmp ult i8* %uglygep, %scevgep44
  %bound151 = icmp ult i8* %scevgep43, %uglygep38
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx53 = or i1 %conflict.rdx, %found.conflict52
  %bound054 = icmp ult i8* %uglygep, %scevgep46
  %bound155 = icmp ult i8* %scevgep45, %uglygep38
  %found.conflict56 = and i1 %bound054, %bound155
  %conflict.rdx57 = or i1 %conflict.rdx53, %found.conflict56
  %ind.end = getelementptr i8, i8* %.025, i64 %n.vec
  %ind.end59 = getelementptr i32, i32* %.0124, i64 %n.vec
  %ind.end63 = getelementptr i8, i8* %.0423, i64 %n.vec
  %ind.end65 = getelementptr i8, i8* %.0622, i64 %n.vec
  %ind.end67 = getelementptr i8, i8* %.0921, i64 %n.vec
  br i1 %conflict.rdx57, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %next.gep = getelementptr i8, i8* %.025, i64 %index
  %next.gep68 = getelementptr i32, i32* %.0124, i64 %index
  %next.gep69 = getelementptr i8, i8* %.0423, i64 %index
  %next.gep70 = getelementptr i8, i8* %.0622, i64 %index
  %next.gep71 = getelementptr i8, i8* %.0921, i64 %index
  %30 = bitcast i8* %next.gep to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %30, align 1, !alias.scope !29
  %31 = zext <4 x i8> %wide.load to <4 x i32>
  %32 = bitcast i8* %next.gep71 to <4 x i8>*
  %wide.load72 = load <4 x i8>, <4 x i8>* %32, align 1, !alias.scope !32
  %33 = zext <4 x i8> %wide.load72 to <4 x i32>
  %34 = mul nuw nsw <4 x i32> %33, %31
  %35 = udiv <4 x i32> %34, <i32 255, i32 255, i32 255, i32 255>
  %36 = bitcast i8* %next.gep70 to <4 x i8>*
  %wide.load73 = load <4 x i8>, <4 x i8>* %36, align 1, !alias.scope !34
  %37 = zext <4 x i8> %wide.load73 to <4 x i32>
  %38 = mul nuw nsw <4 x i32> %37, %31
  %39 = udiv <4 x i32> %38, <i32 255, i32 255, i32 255, i32 255>
  %40 = bitcast i8* %next.gep69 to <4 x i8>*
  %wide.load74 = load <4 x i8>, <4 x i8>* %40, align 1, !alias.scope !36
  %41 = zext <4 x i8> %wide.load74 to <4 x i32>
  %42 = mul nuw nsw <4 x i32> %41, %31
  %43 = udiv <4 x i32> %42, <i32 255, i32 255, i32 255, i32 255>
  %44 = shl nuw nsw <4 x i32> %39, <i32 8, i32 8, i32 8, i32 8>
  %45 = shl nuw nsw <4 x i32> %43, <i32 16, i32 16, i32 16, i32 16>
  %46 = shl nuw <4 x i32> %31, <i32 24, i32 24, i32 24, i32 24>
  %47 = or <4 x i32> %35, %46
  %48 = or <4 x i32> %47, %44
  %49 = or <4 x i32> %48, %45
  %50 = bitcast i32* %next.gep68 to <4 x i32>*
  store <4 x i32> %49, <4 x i32>* %50, align 4, !alias.scope !38, !noalias !40
  %index.next = add i64 %index, 4
  %51 = icmp eq i64 %index.next, %n.vec
  br i1 %51, label %middle.block, label %vector.body, !llvm.loop !41

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %.116.ph = phi i8* [ %.025, %vector.memcheck ], [ %.025, %min.iters.checked ], [ %.025, %.preheader ], [ %ind.end, %middle.block ]
  %.1215.ph = phi i32* [ %.0124, %vector.memcheck ], [ %.0124, %min.iters.checked ], [ %.0124, %.preheader ], [ %ind.end59, %middle.block ]
  %.0314.ph = phi i32 [ %4, %vector.memcheck ], [ %4, %min.iters.checked ], [ %4, %.preheader ], [ %ind.end61, %middle.block ]
  %.1513.ph = phi i8* [ %.0423, %vector.memcheck ], [ %.0423, %min.iters.checked ], [ %.0423, %.preheader ], [ %ind.end63, %middle.block ]
  %.1712.ph = phi i8* [ %.0622, %vector.memcheck ], [ %.0622, %min.iters.checked ], [ %.0622, %.preheader ], [ %ind.end65, %middle.block ]
  %.11011.ph = phi i8* [ %.0921, %vector.memcheck ], [ %.0921, %min.iters.checked ], [ %.0921, %.preheader ], [ %ind.end67, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %.116 = phi i8* [ %53, %scalar.ph ], [ %.116.ph, %scalar.ph.preheader ]
  %.1215 = phi i32* [ %77, %scalar.ph ], [ %.1215.ph, %scalar.ph.preheader ]
  %.0314 = phi i32 [ %52, %scalar.ph ], [ %.0314.ph, %scalar.ph.preheader ]
  %.1513 = phi i8* [ %66, %scalar.ph ], [ %.1513.ph, %scalar.ph.preheader ]
  %.1712 = phi i8* [ %61, %scalar.ph ], [ %.1712.ph, %scalar.ph.preheader ]
  %.11011 = phi i8* [ %56, %scalar.ph ], [ %.11011.ph, %scalar.ph.preheader ]
  %52 = add i32 %.0314, -1
  %53 = getelementptr inbounds i8, i8* %.116, i64 1
  %54 = load i8, i8* %.116, align 1
  %55 = zext i8 %54 to i32
  %56 = getelementptr inbounds i8, i8* %.11011, i64 1
  %57 = load i8, i8* %.11011, align 1
  %58 = zext i8 %57 to i32
  %59 = mul nuw nsw i32 %58, %55
  %60 = udiv i32 %59, 255
  %61 = getelementptr inbounds i8, i8* %.1712, i64 1
  %62 = load i8, i8* %.1712, align 1
  %63 = zext i8 %62 to i32
  %64 = mul nuw nsw i32 %63, %55
  %65 = udiv i32 %64, 255
  %66 = getelementptr inbounds i8, i8* %.1513, i64 1
  %67 = load i8, i8* %.1513, align 1
  %68 = zext i8 %67 to i32
  %69 = mul nuw nsw i32 %68, %55
  %70 = udiv i32 %69, 255
  %71 = shl nuw nsw i32 %65, 8
  %72 = shl nuw nsw i32 %70, 16
  %73 = shl nuw i32 %55, 24
  %74 = or i32 %60, %73
  %75 = or i32 %74, %71
  %76 = or i32 %75, %72
  %77 = getelementptr inbounds i32, i32* %.1215, i64 1
  store i32 %76, i32* %.1215, align 4
  %78 = icmp eq i32 %52, 0
  br i1 %78, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !42

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %scevgep = getelementptr i8, i8* %.025, i64 %20
  %scevgep33 = getelementptr i8, i8* %.0622, i64 %20
  %scevgep35 = getelementptr i32, i32* %.0124, i64 %20
  %79 = getelementptr inbounds i8, i8* %scevgep32, i64 %16
  %80 = getelementptr inbounds i8, i8* %scevgep33, i64 %16
  %81 = getelementptr inbounds i8, i8* %scevgep34, i64 %16
  %82 = getelementptr inbounds i8, i8* %scevgep, i64 %16
  %83 = getelementptr inbounds i32, i32* %scevgep35, i64 %17
  %84 = icmp eq i32 %29, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %84, label %._crit_edge26.loopexit, label %.preheader

._crit_edge26.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader.lr.ph, %12
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBseparate8bittile(%struct._TIFFRGBAImage* nocapture readnone, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readnone) #4 {
  %13 = icmp eq i32 %5, 0
  br i1 %13, label %._crit_edge46, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %12
  %14 = icmp ugt i32 %4, 7
  %15 = sext i32 %6 to i64
  %16 = sext i32 %7 to i64
  %17 = add i32 %4, -8
  %18 = lshr i32 %17, 3
  %19 = shl nuw i32 %18, 3
  %20 = zext i32 %19 to i64
  %21 = add nuw nsw i64 %20, 8
  %22 = shl nuw i32 %18, 3
  %23 = sub i32 %17, %22
  %24 = add i32 %4, -8
  %25 = lshr i32 %24, 3
  %addconv = add nuw nsw i32 %25, 1
  %26 = zext i32 %addconv to i64
  %27 = shl nuw i32 %25, 3
  %28 = zext i32 %27 to i64
  %29 = add nuw nsw i64 %28, 8
  %min.iters.check = icmp ult i32 %addconv, 4
  %30 = and i32 %addconv, 3
  %n.mod.vf = zext i32 %30 to i64
  %n.vec = sub nsw i64 %26, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cast.crd = trunc i64 %n.vec to i32
  %31 = shl i32 %cast.crd, 3
  %ind.end = sub i32 %4, %31
  %32 = shl nsw i64 %n.vec, 3
  %cmp.n = icmp eq i32 %30, 0
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %349
  %.in = phi i32 [ %5, %.preheader.lr.ph ], [ %33, %349 ]
  %.0145 = phi i32* [ %1, %.preheader.lr.ph ], [ %353, %349 ]
  %.0244 = phi i8* [ %10, %.preheader.lr.ph ], [ %352, %349 ]
  %.01243 = phi i8* [ %9, %.preheader.lr.ph ], [ %351, %349 ]
  %.02242 = phi i8* [ %8, %.preheader.lr.ph ], [ %350, %349 ]
  %.014554 = bitcast i32* %.0145 to i8*
  %33 = add i32 %.in, -1
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %scevgep = getelementptr i32, i32* %.0145, i64 %21
  %scevgep52 = getelementptr i8, i8* %.01243, i64 %21
  br i1 %min.iters.check, label %.lr.ph.preheader103, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader
  br i1 %cmp.zero, label %.lr.ph.preheader103, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep55 = getelementptr i32, i32* %.0145, i64 %29
  %scevgep5556 = bitcast i32* %scevgep55 to i8*
  %scevgep57 = getelementptr i8, i8* %.02242, i64 %29
  %scevgep58 = getelementptr i8, i8* %.01243, i64 %29
  %scevgep59 = getelementptr i8, i8* %.0244, i64 %29
  %bound0 = icmp ult i8* %.014554, %scevgep57
  %bound1 = icmp ult i8* %.02242, %scevgep5556
  %found.conflict = and i1 %bound0, %bound1
  %bound060 = icmp ult i8* %.014554, %scevgep58
  %bound161 = icmp ult i8* %.01243, %scevgep5556
  %found.conflict62 = and i1 %bound060, %bound161
  %conflict.rdx = or i1 %found.conflict, %found.conflict62
  %bound063 = icmp ult i8* %.014554, %scevgep59
  %bound164 = icmp ult i8* %.0244, %scevgep5556
  %found.conflict65 = and i1 %bound063, %bound164
  %conflict.rdx66 = or i1 %conflict.rdx, %found.conflict65
  %ind.end68 = getelementptr i32, i32* %.0145, i64 %32
  %ind.end70 = getelementptr i8, i8* %.0244, i64 %32
  %ind.end72 = getelementptr i8, i8* %.01243, i64 %32
  %ind.end74 = getelementptr i8, i8* %.02242, i64 %32
  br i1 %conflict.rdx66, label %.lr.ph.preheader103, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %34 = shl i64 %index, 3
  %next.gep = getelementptr i32, i32* %.0145, i64 %34
  %35 = shl i64 %index, 3
  %next.gep75 = getelementptr i8, i8* %.0244, i64 %35
  %36 = shl i64 %index, 3
  %next.gep76 = getelementptr i8, i8* %.01243, i64 %36
  %37 = shl i64 %index, 3
  %next.gep77 = getelementptr i8, i8* %.02242, i64 %37
  %38 = bitcast i8* %next.gep77 to <32 x i8>*
  %wide.vec = load <32 x i8>, <32 x i8>* %38, align 1, !alias.scope !43
  %strided.vec = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 0, i32 8, i32 16, i32 24>
  %strided.vec78 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 1, i32 9, i32 17, i32 25>
  %strided.vec79 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 2, i32 10, i32 18, i32 26>
  %strided.vec80 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 3, i32 11, i32 19, i32 27>
  %strided.vec81 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 4, i32 12, i32 20, i32 28>
  %strided.vec82 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 5, i32 13, i32 21, i32 29>
  %strided.vec83 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 6, i32 14, i32 22, i32 30>
  %strided.vec84 = shufflevector <32 x i8> %wide.vec, <32 x i8> undef, <4 x i32> <i32 7, i32 15, i32 23, i32 31>
  %39 = zext <4 x i8> %strided.vec to <4 x i32>
  %40 = bitcast i8* %next.gep76 to <32 x i8>*
  %wide.vec85 = load <32 x i8>, <32 x i8>* %40, align 1, !alias.scope !46
  %strided.vec86 = shufflevector <32 x i8> %wide.vec85, <32 x i8> undef, <4 x i32> <i32 0, i32 8, i32 16, i32 24>
  %strided.vec87 = shufflevector <32 x i8> %wide.vec85, <32 x i8> undef, <4 x i32> <i32 1, i32 9, i32 17, i32 25>
  %strided.vec88 = shufflevector <32 x i8> %wide.vec85, <32 x i8> undef, <4 x i32> <i32 2, i32 10, i32 18, i32 26>
  %strided.vec89 = shufflevector <32 x i8> %wide.vec85, <32 x i8> undef, <4 x i32> <i32 3, i32 11, i32 19, i32 27>
  %strided.vec90 = shufflevector <32 x i8> %wide.vec85, <32 x i8> undef, <4 x i32> <i32 4, i32 12, i32 20, i32 28>
  %strided.vec91 = shufflevector <32 x i8> %wide.vec85, <32 x i8> undef, <4 x i32> <i32 5, i32 13, i32 21, i32 29>
  %strided.vec92 = shufflevector <32 x i8> %wide.vec85, <32 x i8> undef, <4 x i32> <i32 6, i32 14, i32 22, i32 30>
  %strided.vec93 = shufflevector <32 x i8> %wide.vec85, <32 x i8> undef, <4 x i32> <i32 7, i32 15, i32 23, i32 31>
  %41 = zext <4 x i8> %strided.vec86 to <4 x i32>
  %42 = shl nuw nsw <4 x i32> %41, <i32 8, i32 8, i32 8, i32 8>
  %43 = bitcast i8* %next.gep75 to <32 x i8>*
  %wide.vec94 = load <32 x i8>, <32 x i8>* %43, align 1, !alias.scope !48
  %strided.vec95 = shufflevector <32 x i8> %wide.vec94, <32 x i8> undef, <4 x i32> <i32 0, i32 8, i32 16, i32 24>
  %strided.vec96 = shufflevector <32 x i8> %wide.vec94, <32 x i8> undef, <4 x i32> <i32 1, i32 9, i32 17, i32 25>
  %strided.vec97 = shufflevector <32 x i8> %wide.vec94, <32 x i8> undef, <4 x i32> <i32 2, i32 10, i32 18, i32 26>
  %strided.vec98 = shufflevector <32 x i8> %wide.vec94, <32 x i8> undef, <4 x i32> <i32 3, i32 11, i32 19, i32 27>
  %strided.vec99 = shufflevector <32 x i8> %wide.vec94, <32 x i8> undef, <4 x i32> <i32 4, i32 12, i32 20, i32 28>
  %strided.vec100 = shufflevector <32 x i8> %wide.vec94, <32 x i8> undef, <4 x i32> <i32 5, i32 13, i32 21, i32 29>
  %strided.vec101 = shufflevector <32 x i8> %wide.vec94, <32 x i8> undef, <4 x i32> <i32 6, i32 14, i32 22, i32 30>
  %strided.vec102 = shufflevector <32 x i8> %wide.vec94, <32 x i8> undef, <4 x i32> <i32 7, i32 15, i32 23, i32 31>
  %44 = zext <4 x i8> %strided.vec95 to <4 x i32>
  %45 = shl nuw nsw <4 x i32> %44, <i32 16, i32 16, i32 16, i32 16>
  %46 = or <4 x i32> %39, %42
  %47 = or <4 x i32> %46, %45
  %48 = or <4 x i32> %47, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %49 = zext <4 x i8> %strided.vec78 to <4 x i32>
  %50 = zext <4 x i8> %strided.vec87 to <4 x i32>
  %51 = shl nuw nsw <4 x i32> %50, <i32 8, i32 8, i32 8, i32 8>
  %52 = zext <4 x i8> %strided.vec96 to <4 x i32>
  %53 = shl nuw nsw <4 x i32> %52, <i32 16, i32 16, i32 16, i32 16>
  %54 = or <4 x i32> %49, %51
  %55 = or <4 x i32> %54, %53
  %56 = or <4 x i32> %55, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %57 = zext <4 x i8> %strided.vec79 to <4 x i32>
  %58 = zext <4 x i8> %strided.vec88 to <4 x i32>
  %59 = shl nuw nsw <4 x i32> %58, <i32 8, i32 8, i32 8, i32 8>
  %60 = zext <4 x i8> %strided.vec97 to <4 x i32>
  %61 = shl nuw nsw <4 x i32> %60, <i32 16, i32 16, i32 16, i32 16>
  %62 = or <4 x i32> %57, %59
  %63 = or <4 x i32> %62, %61
  %64 = or <4 x i32> %63, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %65 = zext <4 x i8> %strided.vec80 to <4 x i32>
  %66 = zext <4 x i8> %strided.vec89 to <4 x i32>
  %67 = shl nuw nsw <4 x i32> %66, <i32 8, i32 8, i32 8, i32 8>
  %68 = zext <4 x i8> %strided.vec98 to <4 x i32>
  %69 = shl nuw nsw <4 x i32> %68, <i32 16, i32 16, i32 16, i32 16>
  %70 = or <4 x i32> %65, %67
  %71 = or <4 x i32> %70, %69
  %72 = or <4 x i32> %71, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %73 = zext <4 x i8> %strided.vec81 to <4 x i32>
  %74 = zext <4 x i8> %strided.vec90 to <4 x i32>
  %75 = shl nuw nsw <4 x i32> %74, <i32 8, i32 8, i32 8, i32 8>
  %76 = zext <4 x i8> %strided.vec99 to <4 x i32>
  %77 = shl nuw nsw <4 x i32> %76, <i32 16, i32 16, i32 16, i32 16>
  %78 = or <4 x i32> %73, %75
  %79 = or <4 x i32> %78, %77
  %80 = or <4 x i32> %79, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %81 = zext <4 x i8> %strided.vec82 to <4 x i32>
  %82 = zext <4 x i8> %strided.vec91 to <4 x i32>
  %83 = shl nuw nsw <4 x i32> %82, <i32 8, i32 8, i32 8, i32 8>
  %84 = zext <4 x i8> %strided.vec100 to <4 x i32>
  %85 = shl nuw nsw <4 x i32> %84, <i32 16, i32 16, i32 16, i32 16>
  %86 = or <4 x i32> %81, %83
  %87 = or <4 x i32> %86, %85
  %88 = or <4 x i32> %87, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %89 = zext <4 x i8> %strided.vec83 to <4 x i32>
  %90 = zext <4 x i8> %strided.vec92 to <4 x i32>
  %91 = shl nuw nsw <4 x i32> %90, <i32 8, i32 8, i32 8, i32 8>
  %92 = zext <4 x i8> %strided.vec101 to <4 x i32>
  %93 = shl nuw nsw <4 x i32> %92, <i32 16, i32 16, i32 16, i32 16>
  %94 = or <4 x i32> %89, %91
  %95 = or <4 x i32> %94, %93
  %96 = or <4 x i32> %95, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %97 = getelementptr inbounds i32, i32* %next.gep, i64 7
  %98 = zext <4 x i8> %strided.vec84 to <4 x i32>
  %99 = zext <4 x i8> %strided.vec93 to <4 x i32>
  %100 = shl nuw nsw <4 x i32> %99, <i32 8, i32 8, i32 8, i32 8>
  %101 = zext <4 x i8> %strided.vec102 to <4 x i32>
  %102 = shl nuw nsw <4 x i32> %101, <i32 16, i32 16, i32 16, i32 16>
  %103 = or <4 x i32> %98, %100
  %104 = or <4 x i32> %103, %102
  %105 = or <4 x i32> %104, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %106 = getelementptr i32, i32* %97, i64 -7
  %107 = bitcast i32* %106 to <32 x i32>*
  %108 = shufflevector <4 x i32> %48, <4 x i32> %56, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %109 = shufflevector <4 x i32> %64, <4 x i32> %72, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %110 = shufflevector <4 x i32> %80, <4 x i32> %88, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %111 = shufflevector <4 x i32> %96, <4 x i32> %105, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %112 = shufflevector <8 x i32> %108, <8 x i32> %109, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %113 = shufflevector <8 x i32> %110, <8 x i32> %111, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %interleaved.vec = shufflevector <16 x i32> %112, <16 x i32> %113, <32 x i32> <i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 28, i32 1, i32 5, i32 9, i32 13, i32 17, i32 21, i32 25, i32 29, i32 2, i32 6, i32 10, i32 14, i32 18, i32 22, i32 26, i32 30, i32 3, i32 7, i32 11, i32 15, i32 19, i32 23, i32 27, i32 31>
  store <32 x i32> %interleaved.vec, <32 x i32>* %107, align 4, !alias.scope !50, !noalias !52
  %index.next = add i64 %index, 4
  %114 = icmp eq i64 %index.next, %n.vec
  br i1 %114, label %middle.block, label %vector.body, !llvm.loop !53

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.loopexit, label %.lr.ph.preheader103

.lr.ph.preheader103:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.preheader
  %.037.ph = phi i32 [ %4, %vector.memcheck ], [ %4, %min.iters.checked ], [ %4, %.lr.ph.preheader ], [ %ind.end, %middle.block ]
  %.136.ph = phi i32* [ %.0145, %vector.memcheck ], [ %.0145, %min.iters.checked ], [ %.0145, %.lr.ph.preheader ], [ %ind.end68, %middle.block ]
  %.1335.ph = phi i8* [ %.0244, %vector.memcheck ], [ %.0244, %min.iters.checked ], [ %.0244, %.lr.ph.preheader ], [ %ind.end70, %middle.block ]
  %.11334.ph = phi i8* [ %.01243, %vector.memcheck ], [ %.01243, %min.iters.checked ], [ %.01243, %.lr.ph.preheader ], [ %ind.end72, %middle.block ]
  %.12333.ph = phi i8* [ %.02242, %vector.memcheck ], [ %.02242, %min.iters.checked ], [ %.02242, %.lr.ph.preheader ], [ %ind.end74, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader103, %.lr.ph
  %.037 = phi i32 [ %235, %.lr.ph ], [ %.037.ph, %.lr.ph.preheader103 ]
  %.136 = phi i32* [ %231, %.lr.ph ], [ %.136.ph, %.lr.ph.preheader103 ]
  %.1335 = phi i8* [ %232, %.lr.ph ], [ %.1335.ph, %.lr.ph.preheader103 ]
  %.11334 = phi i8* [ %233, %.lr.ph ], [ %.11334.ph, %.lr.ph.preheader103 ]
  %.12333 = phi i8* [ %234, %.lr.ph ], [ %.12333.ph, %.lr.ph.preheader103 ]
  %115 = getelementptr inbounds i8, i8* %.12333, i64 1
  %116 = load i8, i8* %.12333, align 1
  %117 = zext i8 %116 to i32
  %118 = getelementptr inbounds i8, i8* %.11334, i64 1
  %119 = load i8, i8* %.11334, align 1
  %120 = zext i8 %119 to i32
  %121 = shl nuw nsw i32 %120, 8
  %122 = getelementptr inbounds i8, i8* %.1335, i64 1
  %123 = load i8, i8* %.1335, align 1
  %124 = zext i8 %123 to i32
  %125 = shl nuw nsw i32 %124, 16
  %126 = or i32 %117, %121
  %127 = or i32 %126, %125
  %128 = or i32 %127, -16777216
  %129 = getelementptr inbounds i32, i32* %.136, i64 1
  store i32 %128, i32* %.136, align 4
  %130 = getelementptr inbounds i8, i8* %.12333, i64 2
  %131 = load i8, i8* %115, align 1
  %132 = zext i8 %131 to i32
  %133 = getelementptr inbounds i8, i8* %.11334, i64 2
  %134 = load i8, i8* %118, align 1
  %135 = zext i8 %134 to i32
  %136 = shl nuw nsw i32 %135, 8
  %137 = getelementptr inbounds i8, i8* %.1335, i64 2
  %138 = load i8, i8* %122, align 1
  %139 = zext i8 %138 to i32
  %140 = shl nuw nsw i32 %139, 16
  %141 = or i32 %132, %136
  %142 = or i32 %141, %140
  %143 = or i32 %142, -16777216
  %144 = getelementptr inbounds i32, i32* %.136, i64 2
  store i32 %143, i32* %129, align 4
  %145 = getelementptr inbounds i8, i8* %.12333, i64 3
  %146 = load i8, i8* %130, align 1
  %147 = zext i8 %146 to i32
  %148 = getelementptr inbounds i8, i8* %.11334, i64 3
  %149 = load i8, i8* %133, align 1
  %150 = zext i8 %149 to i32
  %151 = shl nuw nsw i32 %150, 8
  %152 = getelementptr inbounds i8, i8* %.1335, i64 3
  %153 = load i8, i8* %137, align 1
  %154 = zext i8 %153 to i32
  %155 = shl nuw nsw i32 %154, 16
  %156 = or i32 %147, %151
  %157 = or i32 %156, %155
  %158 = or i32 %157, -16777216
  %159 = getelementptr inbounds i32, i32* %.136, i64 3
  store i32 %158, i32* %144, align 4
  %160 = getelementptr inbounds i8, i8* %.12333, i64 4
  %161 = load i8, i8* %145, align 1
  %162 = zext i8 %161 to i32
  %163 = getelementptr inbounds i8, i8* %.11334, i64 4
  %164 = load i8, i8* %148, align 1
  %165 = zext i8 %164 to i32
  %166 = shl nuw nsw i32 %165, 8
  %167 = getelementptr inbounds i8, i8* %.1335, i64 4
  %168 = load i8, i8* %152, align 1
  %169 = zext i8 %168 to i32
  %170 = shl nuw nsw i32 %169, 16
  %171 = or i32 %162, %166
  %172 = or i32 %171, %170
  %173 = or i32 %172, -16777216
  %174 = getelementptr inbounds i32, i32* %.136, i64 4
  store i32 %173, i32* %159, align 4
  %175 = getelementptr inbounds i8, i8* %.12333, i64 5
  %176 = load i8, i8* %160, align 1
  %177 = zext i8 %176 to i32
  %178 = getelementptr inbounds i8, i8* %.11334, i64 5
  %179 = load i8, i8* %163, align 1
  %180 = zext i8 %179 to i32
  %181 = shl nuw nsw i32 %180, 8
  %182 = getelementptr inbounds i8, i8* %.1335, i64 5
  %183 = load i8, i8* %167, align 1
  %184 = zext i8 %183 to i32
  %185 = shl nuw nsw i32 %184, 16
  %186 = or i32 %177, %181
  %187 = or i32 %186, %185
  %188 = or i32 %187, -16777216
  %189 = getelementptr inbounds i32, i32* %.136, i64 5
  store i32 %188, i32* %174, align 4
  %190 = getelementptr inbounds i8, i8* %.12333, i64 6
  %191 = load i8, i8* %175, align 1
  %192 = zext i8 %191 to i32
  %193 = getelementptr inbounds i8, i8* %.11334, i64 6
  %194 = load i8, i8* %178, align 1
  %195 = zext i8 %194 to i32
  %196 = shl nuw nsw i32 %195, 8
  %197 = getelementptr inbounds i8, i8* %.1335, i64 6
  %198 = load i8, i8* %182, align 1
  %199 = zext i8 %198 to i32
  %200 = shl nuw nsw i32 %199, 16
  %201 = or i32 %192, %196
  %202 = or i32 %201, %200
  %203 = or i32 %202, -16777216
  %204 = getelementptr inbounds i32, i32* %.136, i64 6
  store i32 %203, i32* %189, align 4
  %205 = getelementptr inbounds i8, i8* %.12333, i64 7
  %206 = load i8, i8* %190, align 1
  %207 = zext i8 %206 to i32
  %208 = getelementptr inbounds i8, i8* %.11334, i64 7
  %209 = load i8, i8* %193, align 1
  %210 = zext i8 %209 to i32
  %211 = shl nuw nsw i32 %210, 8
  %212 = getelementptr inbounds i8, i8* %.1335, i64 7
  %213 = load i8, i8* %197, align 1
  %214 = zext i8 %213 to i32
  %215 = shl nuw nsw i32 %214, 16
  %216 = or i32 %207, %211
  %217 = or i32 %216, %215
  %218 = or i32 %217, -16777216
  %219 = getelementptr inbounds i32, i32* %.136, i64 7
  store i32 %218, i32* %204, align 4
  %220 = load i8, i8* %205, align 1
  %221 = zext i8 %220 to i32
  %222 = load i8, i8* %208, align 1
  %223 = zext i8 %222 to i32
  %224 = shl nuw nsw i32 %223, 8
  %225 = load i8, i8* %212, align 1
  %226 = zext i8 %225 to i32
  %227 = shl nuw nsw i32 %226, 16
  %228 = or i32 %221, %224
  %229 = or i32 %228, %227
  %230 = or i32 %229, -16777216
  store i32 %230, i32* %219, align 4
  %231 = getelementptr inbounds i32, i32* %.136, i64 8
  %232 = getelementptr inbounds i8, i8* %.1335, i64 8
  %233 = getelementptr inbounds i8, i8* %.11334, i64 8
  %234 = getelementptr inbounds i8, i8* %.12333, i64 8
  %235 = add i32 %.037, -8
  %236 = icmp ugt i32 %235, 7
  br i1 %236, label %.lr.ph, label %._crit_edge.loopexit.loopexit, !llvm.loop !54

._crit_edge.loopexit.loopexit:                    ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.loopexit.loopexit, %middle.block
  %scevgep51 = getelementptr i8, i8* %.0244, i64 %21
  %scevgep53 = getelementptr i8, i8* %.02242, i64 %21
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.123.lcssa = phi i8* [ %.02242, %.preheader ], [ %scevgep53, %._crit_edge.loopexit ]
  %.113.lcssa = phi i8* [ %.01243, %.preheader ], [ %scevgep52, %._crit_edge.loopexit ]
  %.13.lcssa = phi i8* [ %.0244, %.preheader ], [ %scevgep51, %._crit_edge.loopexit ]
  %.1.lcssa = phi i32* [ %.0145, %.preheader ], [ %scevgep, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ %4, %.preheader ], [ %23, %._crit_edge.loopexit ]
  switch i32 %.0.lcssa, label %349 [
    i32 1, label %333
    i32 7, label %237
    i32 6, label %253
    i32 5, label %269
    i32 4, label %285
    i32 3, label %301
    i32 2, label %317
  ]

; <label>:237:                                    ; preds = %._crit_edge
  %238 = getelementptr inbounds i8, i8* %.123.lcssa, i64 1
  %239 = load i8, i8* %.123.lcssa, align 1
  %240 = zext i8 %239 to i32
  %241 = getelementptr inbounds i8, i8* %.113.lcssa, i64 1
  %242 = load i8, i8* %.113.lcssa, align 1
  %243 = zext i8 %242 to i32
  %244 = shl nuw nsw i32 %243, 8
  %245 = getelementptr inbounds i8, i8* %.13.lcssa, i64 1
  %246 = load i8, i8* %.13.lcssa, align 1
  %247 = zext i8 %246 to i32
  %248 = shl nuw nsw i32 %247, 16
  %249 = or i32 %240, %244
  %250 = or i32 %249, %248
  %251 = or i32 %250, -16777216
  %252 = getelementptr inbounds i32, i32* %.1.lcssa, i64 1
  store i32 %251, i32* %.1.lcssa, align 4
  br label %253

; <label>:253:                                    ; preds = %._crit_edge, %237
  %.224 = phi i8* [ %238, %237 ], [ %.123.lcssa, %._crit_edge ]
  %.214 = phi i8* [ %241, %237 ], [ %.113.lcssa, %._crit_edge ]
  %.24 = phi i8* [ %245, %237 ], [ %.13.lcssa, %._crit_edge ]
  %.2 = phi i32* [ %252, %237 ], [ %.1.lcssa, %._crit_edge ]
  %254 = getelementptr inbounds i8, i8* %.224, i64 1
  %255 = load i8, i8* %.224, align 1
  %256 = zext i8 %255 to i32
  %257 = getelementptr inbounds i8, i8* %.214, i64 1
  %258 = load i8, i8* %.214, align 1
  %259 = zext i8 %258 to i32
  %260 = shl nuw nsw i32 %259, 8
  %261 = getelementptr inbounds i8, i8* %.24, i64 1
  %262 = load i8, i8* %.24, align 1
  %263 = zext i8 %262 to i32
  %264 = shl nuw nsw i32 %263, 16
  %265 = or i32 %256, %260
  %266 = or i32 %265, %264
  %267 = or i32 %266, -16777216
  %268 = getelementptr inbounds i32, i32* %.2, i64 1
  store i32 %267, i32* %.2, align 4
  br label %269

; <label>:269:                                    ; preds = %._crit_edge, %253
  %.325 = phi i8* [ %254, %253 ], [ %.123.lcssa, %._crit_edge ]
  %.315 = phi i8* [ %257, %253 ], [ %.113.lcssa, %._crit_edge ]
  %.35 = phi i8* [ %261, %253 ], [ %.13.lcssa, %._crit_edge ]
  %.3 = phi i32* [ %268, %253 ], [ %.1.lcssa, %._crit_edge ]
  %270 = getelementptr inbounds i8, i8* %.325, i64 1
  %271 = load i8, i8* %.325, align 1
  %272 = zext i8 %271 to i32
  %273 = getelementptr inbounds i8, i8* %.315, i64 1
  %274 = load i8, i8* %.315, align 1
  %275 = zext i8 %274 to i32
  %276 = shl nuw nsw i32 %275, 8
  %277 = getelementptr inbounds i8, i8* %.35, i64 1
  %278 = load i8, i8* %.35, align 1
  %279 = zext i8 %278 to i32
  %280 = shl nuw nsw i32 %279, 16
  %281 = or i32 %272, %276
  %282 = or i32 %281, %280
  %283 = or i32 %282, -16777216
  %284 = getelementptr inbounds i32, i32* %.3, i64 1
  store i32 %283, i32* %.3, align 4
  br label %285

; <label>:285:                                    ; preds = %._crit_edge, %269
  %.426 = phi i8* [ %270, %269 ], [ %.123.lcssa, %._crit_edge ]
  %.416 = phi i8* [ %273, %269 ], [ %.113.lcssa, %._crit_edge ]
  %.46 = phi i8* [ %277, %269 ], [ %.13.lcssa, %._crit_edge ]
  %.4 = phi i32* [ %284, %269 ], [ %.1.lcssa, %._crit_edge ]
  %286 = getelementptr inbounds i8, i8* %.426, i64 1
  %287 = load i8, i8* %.426, align 1
  %288 = zext i8 %287 to i32
  %289 = getelementptr inbounds i8, i8* %.416, i64 1
  %290 = load i8, i8* %.416, align 1
  %291 = zext i8 %290 to i32
  %292 = shl nuw nsw i32 %291, 8
  %293 = getelementptr inbounds i8, i8* %.46, i64 1
  %294 = load i8, i8* %.46, align 1
  %295 = zext i8 %294 to i32
  %296 = shl nuw nsw i32 %295, 16
  %297 = or i32 %288, %292
  %298 = or i32 %297, %296
  %299 = or i32 %298, -16777216
  %300 = getelementptr inbounds i32, i32* %.4, i64 1
  store i32 %299, i32* %.4, align 4
  br label %301

; <label>:301:                                    ; preds = %._crit_edge, %285
  %.527 = phi i8* [ %286, %285 ], [ %.123.lcssa, %._crit_edge ]
  %.517 = phi i8* [ %289, %285 ], [ %.113.lcssa, %._crit_edge ]
  %.57 = phi i8* [ %293, %285 ], [ %.13.lcssa, %._crit_edge ]
  %.5 = phi i32* [ %300, %285 ], [ %.1.lcssa, %._crit_edge ]
  %302 = getelementptr inbounds i8, i8* %.527, i64 1
  %303 = load i8, i8* %.527, align 1
  %304 = zext i8 %303 to i32
  %305 = getelementptr inbounds i8, i8* %.517, i64 1
  %306 = load i8, i8* %.517, align 1
  %307 = zext i8 %306 to i32
  %308 = shl nuw nsw i32 %307, 8
  %309 = getelementptr inbounds i8, i8* %.57, i64 1
  %310 = load i8, i8* %.57, align 1
  %311 = zext i8 %310 to i32
  %312 = shl nuw nsw i32 %311, 16
  %313 = or i32 %304, %308
  %314 = or i32 %313, %312
  %315 = or i32 %314, -16777216
  %316 = getelementptr inbounds i32, i32* %.5, i64 1
  store i32 %315, i32* %.5, align 4
  br label %317

; <label>:317:                                    ; preds = %._crit_edge, %301
  %.628 = phi i8* [ %302, %301 ], [ %.123.lcssa, %._crit_edge ]
  %.618 = phi i8* [ %305, %301 ], [ %.113.lcssa, %._crit_edge ]
  %.68 = phi i8* [ %309, %301 ], [ %.13.lcssa, %._crit_edge ]
  %.6 = phi i32* [ %316, %301 ], [ %.1.lcssa, %._crit_edge ]
  %318 = getelementptr inbounds i8, i8* %.628, i64 1
  %319 = load i8, i8* %.628, align 1
  %320 = zext i8 %319 to i32
  %321 = getelementptr inbounds i8, i8* %.618, i64 1
  %322 = load i8, i8* %.618, align 1
  %323 = zext i8 %322 to i32
  %324 = shl nuw nsw i32 %323, 8
  %325 = getelementptr inbounds i8, i8* %.68, i64 1
  %326 = load i8, i8* %.68, align 1
  %327 = zext i8 %326 to i32
  %328 = shl nuw nsw i32 %327, 16
  %329 = or i32 %320, %324
  %330 = or i32 %329, %328
  %331 = or i32 %330, -16777216
  %332 = getelementptr inbounds i32, i32* %.6, i64 1
  store i32 %331, i32* %.6, align 4
  br label %333

; <label>:333:                                    ; preds = %._crit_edge, %317
  %.729 = phi i8* [ %318, %317 ], [ %.123.lcssa, %._crit_edge ]
  %.719 = phi i8* [ %321, %317 ], [ %.113.lcssa, %._crit_edge ]
  %.79 = phi i8* [ %325, %317 ], [ %.13.lcssa, %._crit_edge ]
  %.7 = phi i32* [ %332, %317 ], [ %.1.lcssa, %._crit_edge ]
  %334 = getelementptr inbounds i8, i8* %.729, i64 1
  %335 = load i8, i8* %.729, align 1
  %336 = zext i8 %335 to i32
  %337 = getelementptr inbounds i8, i8* %.719, i64 1
  %338 = load i8, i8* %.719, align 1
  %339 = zext i8 %338 to i32
  %340 = shl nuw nsw i32 %339, 8
  %341 = getelementptr inbounds i8, i8* %.79, i64 1
  %342 = load i8, i8* %.79, align 1
  %343 = zext i8 %342 to i32
  %344 = shl nuw nsw i32 %343, 16
  %345 = or i32 %336, %340
  %346 = or i32 %345, %344
  %347 = or i32 %346, -16777216
  %348 = getelementptr inbounds i32, i32* %.7, i64 1
  store i32 %347, i32* %.7, align 4
  br label %349

; <label>:349:                                    ; preds = %333, %._crit_edge
  %.931 = phi i8* [ %334, %333 ], [ %.123.lcssa, %._crit_edge ]
  %.921 = phi i8* [ %337, %333 ], [ %.113.lcssa, %._crit_edge ]
  %.911 = phi i8* [ %341, %333 ], [ %.13.lcssa, %._crit_edge ]
  %.9 = phi i32* [ %348, %333 ], [ %.1.lcssa, %._crit_edge ]
  %350 = getelementptr inbounds i8, i8* %.931, i64 %15
  %351 = getelementptr inbounds i8, i8* %.921, i64 %15
  %352 = getelementptr inbounds i8, i8* %.911, i64 %15
  %353 = getelementptr inbounds i32, i32* %.9, i64 %16
  %354 = icmp eq i32 %33, 0
  br i1 %354, label %._crit_edge46.loopexit, label %.preheader

._crit_edge46.loopexit:                           ; preds = %349
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %12
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBseparate8bitMaptile(%struct._TIFFRGBAImage* nocapture readonly, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readnone) #4 {
  %13 = getelementptr inbounds %struct._TIFFRGBAImage, %struct._TIFFRGBAImage* %0, i64 0, i32 15
  %14 = load i8*, i8** %13, align 8
  %15 = icmp eq i32 %5, 0
  br i1 %15, label %._crit_edge21, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %12
  %16 = icmp eq i32 %4, 0
  %17 = sext i32 %6 to i64
  %18 = sext i32 %7 to i64
  br i1 %16, label %._crit_edge21, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %19 = add i32 %4, -1
  %20 = zext i32 %19 to i64
  %21 = add nuw nsw i64 %20, 1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.in = phi i32 [ %22, %._crit_edge ], [ %5, %.preheader.preheader ]
  %.020 = phi i8* [ %52, %._crit_edge ], [ %10, %.preheader.preheader ]
  %.0119 = phi i32* [ %53, %._crit_edge ], [ %1, %.preheader.preheader ]
  %.0418 = phi i8* [ %51, %._crit_edge ], [ %9, %.preheader.preheader ]
  %.0617 = phi i8* [ %50, %._crit_edge ], [ %8, %.preheader.preheader ]
  %22 = add i32 %.in, -1
  %scevgep = getelementptr i32, i32* %.0119, i64 %21
  %scevgep27 = getelementptr i8, i8* %.0418, i64 %21
  br label %23

; <label>:23:                                     ; preds = %.preheader, %23
  %.113 = phi i8* [ %.020, %.preheader ], [ %45, %23 ]
  %.1212 = phi i32* [ %.0119, %.preheader ], [ %44, %23 ]
  %.0311 = phi i32 [ %4, %.preheader ], [ %48, %23 ]
  %.1510 = phi i8* [ %.0418, %.preheader ], [ %46, %23 ]
  %.179 = phi i8* [ %.0617, %.preheader ], [ %47, %23 ]
  %24 = load i8, i8* %.179, align 1
  %25 = zext i8 %24 to i64
  %26 = getelementptr inbounds i8, i8* %14, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = load i8, i8* %.1510, align 1
  %30 = zext i8 %29 to i64
  %31 = getelementptr inbounds i8, i8* %14, i64 %30
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = shl nuw nsw i32 %33, 8
  %35 = load i8, i8* %.113, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds i8, i8* %14, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = shl nuw nsw i32 %39, 16
  %41 = or i32 %28, %34
  %42 = or i32 %41, %40
  %43 = or i32 %42, -16777216
  store i32 %43, i32* %.1212, align 4
  %44 = getelementptr inbounds i32, i32* %.1212, i64 1
  %45 = getelementptr inbounds i8, i8* %.113, i64 1
  %46 = getelementptr inbounds i8, i8* %.1510, i64 1
  %47 = getelementptr inbounds i8, i8* %.179, i64 1
  %48 = add i32 %.0311, -1
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %._crit_edge, label %23

._crit_edge:                                      ; preds = %23
  %scevgep26 = getelementptr i8, i8* %.020, i64 %21
  %scevgep28 = getelementptr i8, i8* %.0617, i64 %21
  %50 = getelementptr inbounds i8, i8* %scevgep28, i64 %17
  %51 = getelementptr inbounds i8, i8* %scevgep27, i64 %17
  %52 = getelementptr inbounds i8, i8* %scevgep26, i64 %17
  %53 = getelementptr inbounds i32, i32* %scevgep, i64 %18
  %54 = icmp eq i32 %22, 0
  br i1 %54, label %._crit_edge21.loopexit, label %.preheader

._crit_edge21.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader.lr.ph, %12
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBseparate16bittile(%struct._TIFFRGBAImage* nocapture readnone, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readnone) #4 {
  %13 = bitcast i32* %1 to i8*
  %14 = icmp eq i32 %5, 0
  br i1 %14, label %._crit_edge21, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %12
  %15 = icmp eq i32 %4, 0
  %16 = sext i32 %6 to i64
  %17 = sext i32 %7 to i64
  br i1 %15, label %._crit_edge21, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %18 = bitcast i8* %10 to i16*
  %19 = bitcast i8* %9 to i16*
  %20 = bitcast i8* %8 to i16*
  %21 = add i32 %4, -1
  %22 = zext i32 %21 to i64
  %23 = add nuw nsw i64 %22, 1
  %24 = add nsw i64 %17, %22
  %25 = shl nsw i64 %24, 2
  %26 = add nsw i64 %25, 4
  %scevgep29 = getelementptr i32, i32* %1, i64 %23
  %scevgep2930 = bitcast i32* %scevgep29 to i8*
  %27 = shl nsw i64 %16, 1
  %28 = shl nuw nsw i64 %22, 1
  %29 = add nsw i64 %27, %28
  %30 = add nsw i64 %29, 2
  %31 = add nuw nsw i64 %28, 2
  %min.iters.check = icmp ult i64 %23, 8
  %n.vec = and i64 %23, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cast.crd = trunc i64 %n.vec to i32
  %cmp.n = icmp eq i64 %23, %n.vec
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge.us ]
  %.in = phi i32 [ %5, %.preheader.us.preheader ], [ %35, %._crit_edge.us ]
  %.020.us = phi i16* [ %18, %.preheader.us.preheader ], [ %89, %._crit_edge.us ]
  %.0119.us = phi i32* [ %1, %.preheader.us.preheader ], [ %90, %._crit_edge.us ]
  %.0418.us = phi i16* [ %19, %.preheader.us.preheader ], [ %88, %._crit_edge.us ]
  %.0617.us = phi i16* [ %20, %.preheader.us.preheader ], [ %87, %._crit_edge.us ]
  %32 = mul i64 %26, %indvar
  %uglygep = getelementptr i8, i8* %13, i64 %32
  %uglygep31 = getelementptr i8, i8* %scevgep2930, i64 %32
  %33 = mul i64 %30, %indvar
  %scevgep32 = getelementptr i8, i8* %8, i64 %33
  %34 = add i64 %31, %33
  %scevgep33 = getelementptr i8, i8* %8, i64 %34
  %scevgep34 = getelementptr i8, i8* %9, i64 %33
  %scevgep35 = getelementptr i8, i8* %9, i64 %34
  %scevgep36 = getelementptr i8, i8* %10, i64 %33
  %scevgep37 = getelementptr i8, i8* %10, i64 %34
  %35 = add i32 %.in, -1
  %scevgep = getelementptr i32, i32* %.0119.us, i64 %23
  %scevgep27 = getelementptr i16, i16* %.0418.us, i64 %23
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %uglygep, %scevgep33
  %bound1 = icmp ult i8* %scevgep32, %uglygep31
  %found.conflict = and i1 %bound0, %bound1
  %bound038 = icmp ult i8* %uglygep, %scevgep35
  %bound139 = icmp ult i8* %scevgep34, %uglygep31
  %found.conflict40 = and i1 %bound038, %bound139
  %conflict.rdx = or i1 %found.conflict, %found.conflict40
  %bound041 = icmp ult i8* %uglygep, %scevgep37
  %bound142 = icmp ult i8* %scevgep36, %uglygep31
  %found.conflict43 = and i1 %bound041, %bound142
  %conflict.rdx44 = or i1 %conflict.rdx, %found.conflict43
  %ind.end = getelementptr i16, i16* %.020.us, i64 %n.vec
  %ind.end46 = getelementptr i32, i32* %.0119.us, i64 %n.vec
  %ind.end50 = getelementptr i16, i16* %.0418.us, i64 %n.vec
  %ind.end52 = getelementptr i16, i16* %.0617.us, i64 %n.vec
  br i1 %conflict.rdx44, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %next.gep = getelementptr i16, i16* %.020.us, i64 %index
  %next.gep54 = getelementptr i32, i32* %.0119.us, i64 %index
  %next.gep57 = getelementptr i16, i16* %.0418.us, i64 %index
  %next.gep59 = getelementptr i16, i16* %.0617.us, i64 %index
  %36 = bitcast i16* %next.gep59 to <4 x i16>*
  %wide.load = load <4 x i16>, <4 x i16>* %36, align 2, !alias.scope !55
  %37 = getelementptr i16, i16* %next.gep59, i64 4
  %38 = bitcast i16* %37 to <4 x i16>*
  %wide.load61 = load <4 x i16>, <4 x i16>* %38, align 2, !alias.scope !55
  %39 = zext <4 x i16> %wide.load to <4 x i32>
  %40 = zext <4 x i16> %wide.load61 to <4 x i32>
  %41 = lshr <4 x i32> %39, <i32 8, i32 8, i32 8, i32 8>
  %42 = lshr <4 x i32> %40, <i32 8, i32 8, i32 8, i32 8>
  %43 = bitcast i16* %next.gep57 to <4 x i16>*
  %wide.load62 = load <4 x i16>, <4 x i16>* %43, align 2, !alias.scope !58
  %44 = getelementptr i16, i16* %next.gep57, i64 4
  %45 = bitcast i16* %44 to <4 x i16>*
  %wide.load63 = load <4 x i16>, <4 x i16>* %45, align 2, !alias.scope !58
  %46 = and <4 x i16> %wide.load62, <i16 -256, i16 -256, i16 -256, i16 -256>
  %47 = and <4 x i16> %wide.load63, <i16 -256, i16 -256, i16 -256, i16 -256>
  %48 = zext <4 x i16> %46 to <4 x i32>
  %49 = zext <4 x i16> %47 to <4 x i32>
  %50 = bitcast i16* %next.gep to <4 x i16>*
  %wide.load64 = load <4 x i16>, <4 x i16>* %50, align 2, !alias.scope !60
  %51 = getelementptr i16, i16* %next.gep, i64 4
  %52 = bitcast i16* %51 to <4 x i16>*
  %wide.load65 = load <4 x i16>, <4 x i16>* %52, align 2, !alias.scope !60
  %53 = zext <4 x i16> %wide.load64 to <4 x i32>
  %54 = zext <4 x i16> %wide.load65 to <4 x i32>
  %55 = lshr <4 x i32> %53, <i32 8, i32 8, i32 8, i32 8>
  %56 = lshr <4 x i32> %54, <i32 8, i32 8, i32 8, i32 8>
  %57 = shl nuw nsw <4 x i32> %55, <i32 16, i32 16, i32 16, i32 16>
  %58 = shl nuw nsw <4 x i32> %56, <i32 16, i32 16, i32 16, i32 16>
  %59 = or <4 x i32> %41, %48
  %60 = or <4 x i32> %42, %49
  %61 = or <4 x i32> %59, %57
  %62 = or <4 x i32> %60, %58
  %63 = or <4 x i32> %61, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %64 = or <4 x i32> %62, <i32 -16777216, i32 -16777216, i32 -16777216, i32 -16777216>
  %65 = bitcast i32* %next.gep54 to <4 x i32>*
  store <4 x i32> %63, <4 x i32>* %65, align 4, !alias.scope !62, !noalias !64
  %66 = getelementptr i32, i32* %next.gep54, i64 4
  %67 = bitcast i32* %66 to <4 x i32>*
  store <4 x i32> %64, <4 x i32>* %67, align 4, !alias.scope !62, !noalias !64
  %index.next = add i64 %index, 8
  %68 = icmp eq i64 %index.next, %n.vec
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !65

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %.113.us.ph = phi i16* [ %.020.us, %vector.memcheck ], [ %.020.us, %min.iters.checked ], [ %.020.us, %.preheader.us ], [ %ind.end, %middle.block ]
  %.1212.us.ph = phi i32* [ %.0119.us, %vector.memcheck ], [ %.0119.us, %min.iters.checked ], [ %.0119.us, %.preheader.us ], [ %ind.end46, %middle.block ]
  %.0311.us.ph = phi i32 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %cast.crd, %middle.block ]
  %.1510.us.ph = phi i16* [ %.0418.us, %vector.memcheck ], [ %.0418.us, %min.iters.checked ], [ %.0418.us, %.preheader.us ], [ %ind.end50, %middle.block ]
  %.179.us.ph = phi i16* [ %.0617.us, %vector.memcheck ], [ %.0617.us, %min.iters.checked ], [ %.0617.us, %.preheader.us ], [ %ind.end52, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %.113.us = phi i16* [ %83, %scalar.ph ], [ %.113.us.ph, %scalar.ph.preheader ]
  %.1212.us = phi i32* [ %82, %scalar.ph ], [ %.1212.us.ph, %scalar.ph.preheader ]
  %.0311.us = phi i32 [ %86, %scalar.ph ], [ %.0311.us.ph, %scalar.ph.preheader ]
  %.1510.us = phi i16* [ %84, %scalar.ph ], [ %.1510.us.ph, %scalar.ph.preheader ]
  %.179.us = phi i16* [ %85, %scalar.ph ], [ %.179.us.ph, %scalar.ph.preheader ]
  %69 = load i16, i16* %.179.us, align 2
  %70 = zext i16 %69 to i32
  %71 = lshr i32 %70, 8
  %72 = load i16, i16* %.1510.us, align 2
  %73 = and i16 %72, -256
  %74 = zext i16 %73 to i32
  %75 = load i16, i16* %.113.us, align 2
  %76 = zext i16 %75 to i32
  %77 = lshr i32 %76, 8
  %78 = shl nuw nsw i32 %77, 16
  %79 = or i32 %71, %74
  %80 = or i32 %79, %78
  %81 = or i32 %80, -16777216
  store i32 %81, i32* %.1212.us, align 4
  %82 = getelementptr inbounds i32, i32* %.1212.us, i64 1
  %83 = getelementptr inbounds i16, i16* %.113.us, i64 1
  %84 = getelementptr inbounds i16, i16* %.1510.us, i64 1
  %85 = getelementptr inbounds i16, i16* %.179.us, i64 1
  %86 = add nuw i32 %.0311.us, 1
  %exitcond = icmp eq i32 %86, %4
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !66

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %scevgep26 = getelementptr i16, i16* %.020.us, i64 %23
  %scevgep28 = getelementptr i16, i16* %.0617.us, i64 %23
  %87 = getelementptr inbounds i16, i16* %scevgep28, i64 %16
  %88 = getelementptr inbounds i16, i16* %scevgep27, i64 %16
  %89 = getelementptr inbounds i16, i16* %scevgep26, i64 %16
  %90 = getelementptr inbounds i32, i32* %scevgep, i64 %17
  %91 = icmp eq i32 %35, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %91, label %._crit_edge21.loopexit, label %.preheader.us

._crit_edge21.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader.lr.ph, %12
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBAAseparate16bittile(%struct._TIFFRGBAImage* nocapture readnone, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly) #4 {
  %13 = bitcast i32* %1 to i8*
  %14 = icmp eq i32 %5, 0
  br i1 %14, label %._crit_edge26, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %12
  %15 = icmp eq i32 %4, 0
  %16 = sext i32 %6 to i64
  %17 = sext i32 %7 to i64
  br i1 %15, label %._crit_edge26, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %18 = bitcast i8* %11 to i16*
  %19 = bitcast i8* %10 to i16*
  %20 = bitcast i8* %9 to i16*
  %21 = bitcast i8* %8 to i16*
  %22 = add i32 %4, -1
  %23 = zext i32 %22 to i64
  %24 = add nuw nsw i64 %23, 1
  %25 = add nsw i64 %17, %23
  %26 = shl nsw i64 %25, 2
  %27 = add nsw i64 %26, 4
  %scevgep36 = getelementptr i32, i32* %1, i64 %24
  %scevgep3637 = bitcast i32* %scevgep36 to i8*
  %28 = shl nsw i64 %16, 1
  %29 = shl nuw nsw i64 %23, 1
  %30 = add nsw i64 %28, %29
  %31 = add nsw i64 %30, 2
  %32 = add nuw nsw i64 %29, 2
  %min.iters.check = icmp ult i64 %24, 4
  %n.vec = and i64 %24, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cast.crd = trunc i64 %n.vec to i32
  %cmp.n = icmp eq i64 %24, %n.vec
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge.us ]
  %.in = phi i32 [ %5, %.preheader.us.preheader ], [ %36, %._crit_edge.us ]
  %.025.us = phi i16* [ %18, %.preheader.us.preheader ], [ %82, %._crit_edge.us ]
  %.0124.us = phi i32* [ %1, %.preheader.us.preheader ], [ %83, %._crit_edge.us ]
  %.0423.us = phi i16* [ %19, %.preheader.us.preheader ], [ %81, %._crit_edge.us ]
  %.0622.us = phi i16* [ %20, %.preheader.us.preheader ], [ %80, %._crit_edge.us ]
  %.0921.us = phi i16* [ %21, %.preheader.us.preheader ], [ %79, %._crit_edge.us ]
  %33 = mul i64 %27, %indvar
  %uglygep = getelementptr i8, i8* %13, i64 %33
  %uglygep38 = getelementptr i8, i8* %scevgep3637, i64 %33
  %34 = mul i64 %31, %indvar
  %scevgep39 = getelementptr i8, i8* %8, i64 %34
  %35 = add i64 %32, %34
  %scevgep40 = getelementptr i8, i8* %8, i64 %35
  %scevgep41 = getelementptr i8, i8* %9, i64 %34
  %scevgep42 = getelementptr i8, i8* %9, i64 %35
  %scevgep43 = getelementptr i8, i8* %10, i64 %34
  %scevgep44 = getelementptr i8, i8* %10, i64 %35
  %scevgep45 = getelementptr i8, i8* %11, i64 %34
  %scevgep46 = getelementptr i8, i8* %11, i64 %35
  %36 = add i32 %.in, -1
  %scevgep32 = getelementptr i16, i16* %.025.us, i64 %24
  %scevgep34 = getelementptr i16, i16* %.0622.us, i64 %24
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %uglygep, %scevgep40
  %bound1 = icmp ult i8* %scevgep39, %uglygep38
  %found.conflict = and i1 %bound0, %bound1
  %bound047 = icmp ult i8* %uglygep, %scevgep42
  %bound148 = icmp ult i8* %scevgep41, %uglygep38
  %found.conflict49 = and i1 %bound047, %bound148
  %conflict.rdx = or i1 %found.conflict, %found.conflict49
  %bound050 = icmp ult i8* %uglygep, %scevgep44
  %bound151 = icmp ult i8* %scevgep43, %uglygep38
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx53 = or i1 %conflict.rdx, %found.conflict52
  %bound054 = icmp ult i8* %uglygep, %scevgep46
  %bound155 = icmp ult i8* %scevgep45, %uglygep38
  %found.conflict56 = and i1 %bound054, %bound155
  %conflict.rdx57 = or i1 %conflict.rdx53, %found.conflict56
  %ind.end = getelementptr i16, i16* %.025.us, i64 %n.vec
  %ind.end59 = getelementptr i32, i32* %.0124.us, i64 %n.vec
  %ind.end63 = getelementptr i16, i16* %.0423.us, i64 %n.vec
  %ind.end65 = getelementptr i16, i16* %.0622.us, i64 %n.vec
  %ind.end67 = getelementptr i16, i16* %.0921.us, i64 %n.vec
  br i1 %conflict.rdx57, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %next.gep = getelementptr i16, i16* %.025.us, i64 %index
  %next.gep68 = getelementptr i32, i32* %.0124.us, i64 %index
  %next.gep69 = getelementptr i16, i16* %.0423.us, i64 %index
  %next.gep70 = getelementptr i16, i16* %.0622.us, i64 %index
  %next.gep71 = getelementptr i16, i16* %.0921.us, i64 %index
  %37 = bitcast i16* %next.gep71 to <4 x i16>*
  %wide.load = load <4 x i16>, <4 x i16>* %37, align 2, !alias.scope !67
  %38 = zext <4 x i16> %wide.load to <4 x i32>
  %39 = lshr <4 x i32> %38, <i32 8, i32 8, i32 8, i32 8>
  %40 = bitcast i16* %next.gep70 to <4 x i16>*
  %wide.load72 = load <4 x i16>, <4 x i16>* %40, align 2, !alias.scope !70
  %41 = and <4 x i16> %wide.load72, <i16 -256, i16 -256, i16 -256, i16 -256>
  %42 = zext <4 x i16> %41 to <4 x i32>
  %43 = or <4 x i32> %42, %39
  %44 = bitcast i16* %next.gep69 to <4 x i16>*
  %wide.load73 = load <4 x i16>, <4 x i16>* %44, align 2, !alias.scope !72
  %45 = zext <4 x i16> %wide.load73 to <4 x i32>
  %46 = lshr <4 x i32> %45, <i32 8, i32 8, i32 8, i32 8>
  %47 = shl nuw nsw <4 x i32> %46, <i32 16, i32 16, i32 16, i32 16>
  %48 = or <4 x i32> %43, %47
  %49 = bitcast i16* %next.gep to <4 x i16>*
  %wide.load74 = load <4 x i16>, <4 x i16>* %49, align 2, !alias.scope !74
  %50 = zext <4 x i16> %wide.load74 to <4 x i32>
  %51 = lshr <4 x i32> %50, <i32 8, i32 8, i32 8, i32 8>
  %52 = shl nuw <4 x i32> %51, <i32 24, i32 24, i32 24, i32 24>
  %53 = or <4 x i32> %48, %52
  %54 = bitcast i32* %next.gep68 to <4 x i32>*
  store <4 x i32> %53, <4 x i32>* %54, align 4, !alias.scope !76, !noalias !78
  %index.next = add i64 %index, 4
  %55 = icmp eq i64 %index.next, %n.vec
  br i1 %55, label %middle.block, label %vector.body, !llvm.loop !79

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %.116.us.ph = phi i16* [ %.025.us, %vector.memcheck ], [ %.025.us, %min.iters.checked ], [ %.025.us, %.preheader.us ], [ %ind.end, %middle.block ]
  %.1215.us.ph = phi i32* [ %.0124.us, %vector.memcheck ], [ %.0124.us, %min.iters.checked ], [ %.0124.us, %.preheader.us ], [ %ind.end59, %middle.block ]
  %.0314.us.ph = phi i32 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %cast.crd, %middle.block ]
  %.1513.us.ph = phi i16* [ %.0423.us, %vector.memcheck ], [ %.0423.us, %min.iters.checked ], [ %.0423.us, %.preheader.us ], [ %ind.end63, %middle.block ]
  %.1712.us.ph = phi i16* [ %.0622.us, %vector.memcheck ], [ %.0622.us, %min.iters.checked ], [ %.0622.us, %.preheader.us ], [ %ind.end65, %middle.block ]
  %.11011.us.ph = phi i16* [ %.0921.us, %vector.memcheck ], [ %.0921.us, %min.iters.checked ], [ %.0921.us, %.preheader.us ], [ %ind.end67, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %.116.us = phi i16* [ %74, %scalar.ph ], [ %.116.us.ph, %scalar.ph.preheader ]
  %.1215.us = phi i32* [ %73, %scalar.ph ], [ %.1215.us.ph, %scalar.ph.preheader ]
  %.0314.us = phi i32 [ %78, %scalar.ph ], [ %.0314.us.ph, %scalar.ph.preheader ]
  %.1513.us = phi i16* [ %75, %scalar.ph ], [ %.1513.us.ph, %scalar.ph.preheader ]
  %.1712.us = phi i16* [ %76, %scalar.ph ], [ %.1712.us.ph, %scalar.ph.preheader ]
  %.11011.us = phi i16* [ %77, %scalar.ph ], [ %.11011.us.ph, %scalar.ph.preheader ]
  %56 = load i16, i16* %.11011.us, align 2
  %57 = zext i16 %56 to i32
  %58 = lshr i32 %57, 8
  %59 = load i16, i16* %.1712.us, align 2
  %60 = and i16 %59, -256
  %61 = zext i16 %60 to i32
  %62 = or i32 %61, %58
  %63 = load i16, i16* %.1513.us, align 2
  %64 = zext i16 %63 to i32
  %65 = lshr i32 %64, 8
  %66 = shl nuw nsw i32 %65, 16
  %67 = or i32 %62, %66
  %68 = load i16, i16* %.116.us, align 2
  %69 = zext i16 %68 to i32
  %70 = lshr i32 %69, 8
  %71 = shl nuw i32 %70, 24
  %72 = or i32 %67, %71
  store i32 %72, i32* %.1215.us, align 4
  %73 = getelementptr inbounds i32, i32* %.1215.us, i64 1
  %74 = getelementptr inbounds i16, i16* %.116.us, i64 1
  %75 = getelementptr inbounds i16, i16* %.1513.us, i64 1
  %76 = getelementptr inbounds i16, i16* %.1712.us, i64 1
  %77 = getelementptr inbounds i16, i16* %.11011.us, i64 1
  %78 = add nuw i32 %.0314.us, 1
  %exitcond = icmp eq i32 %78, %4
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !80

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %scevgep = getelementptr i32, i32* %.0124.us, i64 %24
  %scevgep33 = getelementptr i16, i16* %.0423.us, i64 %24
  %scevgep35 = getelementptr i16, i16* %.0921.us, i64 %24
  %79 = getelementptr inbounds i16, i16* %scevgep35, i64 %16
  %80 = getelementptr inbounds i16, i16* %scevgep34, i64 %16
  %81 = getelementptr inbounds i16, i16* %scevgep33, i64 %16
  %82 = getelementptr inbounds i16, i16* %scevgep32, i64 %16
  %83 = getelementptr inbounds i32, i32* %scevgep, i64 %17
  %84 = icmp eq i32 %36, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %84, label %._crit_edge26.loopexit, label %.preheader.us

._crit_edge26.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader.lr.ph, %12
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @putRGBUAseparate16bittile(%struct._TIFFRGBAImage* nocapture readnone, i32* nocapture, i32, i32, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly) #4 {
  %13 = bitcast i32* %1 to i8*
  %14 = icmp eq i32 %5, 0
  br i1 %14, label %._crit_edge26, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %12
  %15 = icmp eq i32 %4, 0
  %16 = sext i32 %6 to i64
  %17 = sext i32 %7 to i64
  br i1 %15, label %._crit_edge26, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %18 = bitcast i8* %11 to i16*
  %19 = bitcast i8* %10 to i16*
  %20 = bitcast i8* %9 to i16*
  %21 = bitcast i8* %8 to i16*
  %22 = add i32 %4, -1
  %23 = zext i32 %22 to i64
  %24 = add nuw nsw i64 %23, 1
  %25 = add nsw i64 %17, %23
  %26 = shl nsw i64 %25, 2
  %27 = add nsw i64 %26, 4
  %scevgep36 = getelementptr i32, i32* %1, i64 %24
  %scevgep3637 = bitcast i32* %scevgep36 to i8*
  %28 = shl nsw i64 %16, 1
  %29 = shl nuw nsw i64 %23, 1
  %30 = add nsw i64 %28, %29
  %31 = add nsw i64 %30, 2
  %32 = add nuw nsw i64 %29, 2
  %min.iters.check = icmp ult i64 %24, 4
  %n.vec = and i64 %24, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end61 = sub i32 %4, %cast.crd
  %cmp.n = icmp eq i64 %24, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvar = phi i64 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge ]
  %.in = phi i32 [ %5, %.preheader.preheader ], [ %36, %._crit_edge ]
  %.025 = phi i16* [ %18, %.preheader.preheader ], [ %91, %._crit_edge ]
  %.0124 = phi i32* [ %1, %.preheader.preheader ], [ %92, %._crit_edge ]
  %.0423 = phi i16* [ %19, %.preheader.preheader ], [ %90, %._crit_edge ]
  %.0622 = phi i16* [ %20, %.preheader.preheader ], [ %89, %._crit_edge ]
  %.0921 = phi i16* [ %21, %.preheader.preheader ], [ %88, %._crit_edge ]
  %33 = mul i64 %27, %indvar
  %uglygep = getelementptr i8, i8* %13, i64 %33
  %uglygep38 = getelementptr i8, i8* %scevgep3637, i64 %33
  %34 = mul i64 %31, %indvar
  %scevgep39 = getelementptr i8, i8* %11, i64 %34
  %35 = add i64 %32, %34
  %scevgep40 = getelementptr i8, i8* %11, i64 %35
  %scevgep41 = getelementptr i8, i8* %8, i64 %34
  %scevgep42 = getelementptr i8, i8* %8, i64 %35
  %scevgep43 = getelementptr i8, i8* %9, i64 %34
  %scevgep44 = getelementptr i8, i8* %9, i64 %35
  %scevgep45 = getelementptr i8, i8* %10, i64 %34
  %scevgep46 = getelementptr i8, i8* %10, i64 %35
  %36 = add i32 %.in, -1
  %scevgep32 = getelementptr i16, i16* %.0921, i64 %24
  %scevgep34 = getelementptr i16, i16* %.0423, i64 %24
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %uglygep, %scevgep40
  %bound1 = icmp ult i8* %scevgep39, %uglygep38
  %found.conflict = and i1 %bound0, %bound1
  %bound047 = icmp ult i8* %uglygep, %scevgep42
  %bound148 = icmp ult i8* %scevgep41, %uglygep38
  %found.conflict49 = and i1 %bound047, %bound148
  %conflict.rdx = or i1 %found.conflict, %found.conflict49
  %bound050 = icmp ult i8* %uglygep, %scevgep44
  %bound151 = icmp ult i8* %scevgep43, %uglygep38
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx53 = or i1 %conflict.rdx, %found.conflict52
  %bound054 = icmp ult i8* %uglygep, %scevgep46
  %bound155 = icmp ult i8* %scevgep45, %uglygep38
  %found.conflict56 = and i1 %bound054, %bound155
  %conflict.rdx57 = or i1 %conflict.rdx53, %found.conflict56
  %ind.end = getelementptr i16, i16* %.025, i64 %n.vec
  %ind.end59 = getelementptr i32, i32* %.0124, i64 %n.vec
  %ind.end63 = getelementptr i16, i16* %.0423, i64 %n.vec
  %ind.end65 = getelementptr i16, i16* %.0622, i64 %n.vec
  %ind.end67 = getelementptr i16, i16* %.0921, i64 %n.vec
  br i1 %conflict.rdx57, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %next.gep = getelementptr i16, i16* %.025, i64 %index
  %next.gep68 = getelementptr i32, i32* %.0124, i64 %index
  %next.gep69 = getelementptr i16, i16* %.0423, i64 %index
  %next.gep70 = getelementptr i16, i16* %.0622, i64 %index
  %next.gep71 = getelementptr i16, i16* %.0921, i64 %index
  %37 = bitcast i16* %next.gep to <4 x i16>*
  %wide.load = load <4 x i16>, <4 x i16>* %37, align 2, !alias.scope !81
  %38 = zext <4 x i16> %wide.load to <4 x i32>
  %39 = lshr <4 x i32> %38, <i32 4, i32 4, i32 4, i32 4>
  %40 = bitcast i16* %next.gep71 to <4 x i16>*
  %wide.load72 = load <4 x i16>, <4 x i16>* %40, align 2, !alias.scope !84
  %41 = zext <4 x i16> %wide.load72 to <4 x i32>
  %42 = mul nuw nsw <4 x i32> %41, %39
  %43 = udiv <4 x i32> %42, <i32 69375, i32 69375, i32 69375, i32 69375>
  %44 = bitcast i16* %next.gep70 to <4 x i16>*
  %wide.load73 = load <4 x i16>, <4 x i16>* %44, align 2, !alias.scope !86
  %45 = zext <4 x i16> %wide.load73 to <4 x i32>
  %46 = mul nuw nsw <4 x i32> %45, %39
  %47 = udiv <4 x i32> %46, <i32 69375, i32 69375, i32 69375, i32 69375>
  %48 = bitcast i16* %next.gep69 to <4 x i16>*
  %wide.load74 = load <4 x i16>, <4 x i16>* %48, align 2, !alias.scope !88
  %49 = zext <4 x i16> %wide.load74 to <4 x i32>
  %50 = mul nuw nsw <4 x i32> %49, %39
  %51 = udiv <4 x i32> %50, <i32 69375, i32 69375, i32 69375, i32 69375>
  %52 = shl nuw nsw <4 x i32> %47, <i32 8, i32 8, i32 8, i32 8>
  %53 = shl nuw nsw <4 x i32> %51, <i32 16, i32 16, i32 16, i32 16>
  %54 = shl <4 x i32> %39, <i32 24, i32 24, i32 24, i32 24>
  %55 = or <4 x i32> %43, %54
  %56 = or <4 x i32> %55, %52
  %57 = or <4 x i32> %56, %53
  %58 = bitcast i32* %next.gep68 to <4 x i32>*
  store <4 x i32> %57, <4 x i32>* %58, align 4, !alias.scope !90, !noalias !92
  %index.next = add i64 %index, 4
  %59 = icmp eq i64 %index.next, %n.vec
  br i1 %59, label %middle.block, label %vector.body, !llvm.loop !93

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %.116.ph = phi i16* [ %.025, %vector.memcheck ], [ %.025, %min.iters.checked ], [ %.025, %.preheader ], [ %ind.end, %middle.block ]
  %.1215.ph = phi i32* [ %.0124, %vector.memcheck ], [ %.0124, %min.iters.checked ], [ %.0124, %.preheader ], [ %ind.end59, %middle.block ]
  %.0314.ph = phi i32 [ %4, %vector.memcheck ], [ %4, %min.iters.checked ], [ %4, %.preheader ], [ %ind.end61, %middle.block ]
  %.1513.ph = phi i16* [ %.0423, %vector.memcheck ], [ %.0423, %min.iters.checked ], [ %.0423, %.preheader ], [ %ind.end63, %middle.block ]
  %.1712.ph = phi i16* [ %.0622, %vector.memcheck ], [ %.0622, %min.iters.checked ], [ %.0622, %.preheader ], [ %ind.end65, %middle.block ]
  %.11011.ph = phi i16* [ %.0921, %vector.memcheck ], [ %.0921, %min.iters.checked ], [ %.0921, %.preheader ], [ %ind.end67, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %.116 = phi i16* [ %61, %scalar.ph ], [ %.116.ph, %scalar.ph.preheader ]
  %.1215 = phi i32* [ %86, %scalar.ph ], [ %.1215.ph, %scalar.ph.preheader ]
  %.0314 = phi i32 [ %60, %scalar.ph ], [ %.0314.ph, %scalar.ph.preheader ]
  %.1513 = phi i16* [ %75, %scalar.ph ], [ %.1513.ph, %scalar.ph.preheader ]
  %.1712 = phi i16* [ %70, %scalar.ph ], [ %.1712.ph, %scalar.ph.preheader ]
  %.11011 = phi i16* [ %65, %scalar.ph ], [ %.11011.ph, %scalar.ph.preheader ]
  %60 = add i32 %.0314, -1
  %61 = getelementptr inbounds i16, i16* %.116, i64 1
  %62 = load i16, i16* %.116, align 2
  %63 = zext i16 %62 to i32
  %64 = lshr i32 %63, 4
  %65 = getelementptr inbounds i16, i16* %.11011, i64 1
  %66 = load i16, i16* %.11011, align 2
  %67 = zext i16 %66 to i32
  %68 = mul nuw nsw i32 %67, %64
  %69 = udiv i32 %68, 69375
  %70 = getelementptr inbounds i16, i16* %.1712, i64 1
  %71 = load i16, i16* %.1712, align 2
  %72 = zext i16 %71 to i32
  %73 = mul nuw nsw i32 %72, %64
  %74 = udiv i32 %73, 69375
  %75 = getelementptr inbounds i16, i16* %.1513, i64 1
  %76 = load i16, i16* %.1513, align 2
  %77 = zext i16 %76 to i32
  %78 = mul nuw nsw i32 %77, %64
  %79 = udiv i32 %78, 69375
  %80 = shl nuw nsw i32 %74, 8
  %81 = shl nuw nsw i32 %79, 16
  %82 = shl i32 %64, 24
  %83 = or i32 %69, %82
  %84 = or i32 %83, %80
  %85 = or i32 %84, %81
  %86 = getelementptr inbounds i32, i32* %.1215, i64 1
  store i32 %85, i32* %.1215, align 4
  %87 = icmp eq i32 %60, 0
  br i1 %87, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !94

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %scevgep = getelementptr i16, i16* %.025, i64 %24
  %scevgep33 = getelementptr i16, i16* %.0622, i64 %24
  %scevgep35 = getelementptr i32, i32* %.0124, i64 %24
  %88 = getelementptr inbounds i16, i16* %scevgep32, i64 %16
  %89 = getelementptr inbounds i16, i16* %scevgep33, i64 %16
  %90 = getelementptr inbounds i16, i16* %scevgep34, i64 %16
  %91 = getelementptr inbounds i16, i16* %scevgep, i64 %16
  %92 = getelementptr inbounds i32, i32* %scevgep35, i64 %17
  %93 = icmp eq i32 %36, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %93, label %._crit_edge26.loopexit, label %.preheader

._crit_edge26.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader.lr.ph, %12
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7, !8}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = !{!7}
!10 = !{!8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = !{!21}
!21 = distinct !{!21, !17}
!22 = !{!23}
!23 = distinct !{!23, !17}
!24 = !{!25}
!25 = distinct !{!25, !17}
!26 = !{!16, !19, !21, !23}
!27 = distinct !{!27, !12, !13}
!28 = distinct !{!28, !12, !13}
!29 = !{!30}
!30 = distinct !{!30, !31}
!31 = distinct !{!31, !"LVerDomain"}
!32 = !{!33}
!33 = distinct !{!33, !31}
!34 = !{!35}
!35 = distinct !{!35, !31}
!36 = !{!37}
!37 = distinct !{!37, !31}
!38 = !{!39}
!39 = distinct !{!39, !31}
!40 = !{!30, !33, !35, !37}
!41 = distinct !{!41, !12, !13}
!42 = distinct !{!42, !12, !13}
!43 = !{!44}
!44 = distinct !{!44, !45}
!45 = distinct !{!45, !"LVerDomain"}
!46 = !{!47}
!47 = distinct !{!47, !45}
!48 = !{!49}
!49 = distinct !{!49, !45}
!50 = !{!51}
!51 = distinct !{!51, !45}
!52 = !{!44, !47, !49}
!53 = distinct !{!53, !12, !13}
!54 = distinct !{!54, !12, !13}
!55 = !{!56}
!56 = distinct !{!56, !57}
!57 = distinct !{!57, !"LVerDomain"}
!58 = !{!59}
!59 = distinct !{!59, !57}
!60 = !{!61}
!61 = distinct !{!61, !57}
!62 = !{!63}
!63 = distinct !{!63, !57}
!64 = !{!56, !59, !61}
!65 = distinct !{!65, !12, !13}
!66 = distinct !{!66, !12, !13}
!67 = !{!68}
!68 = distinct !{!68, !69}
!69 = distinct !{!69, !"LVerDomain"}
!70 = !{!71}
!71 = distinct !{!71, !69}
!72 = !{!73}
!73 = distinct !{!73, !69}
!74 = !{!75}
!75 = distinct !{!75, !69}
!76 = !{!77}
!77 = distinct !{!77, !69}
!78 = !{!68, !71, !73, !75}
!79 = distinct !{!79, !12, !13}
!80 = distinct !{!80, !12, !13}
!81 = !{!82}
!82 = distinct !{!82, !83}
!83 = distinct !{!83, !"LVerDomain"}
!84 = !{!85}
!85 = distinct !{!85, !83}
!86 = !{!87}
!87 = distinct !{!87, !83}
!88 = !{!89}
!89 = distinct !{!89, !83}
!90 = !{!91}
!91 = distinct !{!91, !83}
!92 = !{!82, !85, !87, !89}
!93 = distinct !{!93, !12, !13}
!94 = distinct !{!94, !12, !13}
