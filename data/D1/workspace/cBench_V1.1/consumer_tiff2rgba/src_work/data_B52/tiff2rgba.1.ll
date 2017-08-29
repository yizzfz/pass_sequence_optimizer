; ModuleID = 'tiff2rgba.ll'
source_filename = "tiff2rgba.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.tiff = type opaque

@compression = local_unnamed_addr global i16 -32763, align 2
@rowsperstrip = global i32 -1, align 4
@process_by_block = local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"c:r:t:b\00", align 1
@optarg = external local_unnamed_addr global i8*, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"packbits\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"jpeg\00", align 1
@optind = external local_unnamed_addr global i32, align 4
@.str.5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"Source image not tiled\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"No space for raster buffer\00", align 1
@.str.9 = private unnamed_addr constant [36 x i8] c"No space for raster scanline buffer\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"Source image not in strips\00", align 1
@usageMsg = internal unnamed_addr constant [10 x i8*] [i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.20, i32 0, i32 0), i8* null], align 16
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.11 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.12 = private unnamed_addr constant [59 x i8] c"usage: tiff2rgba [-c comp] [-r rows] [-b] input... output\0A\00", align 1
@.str.13 = private unnamed_addr constant [60 x i8] c"where comp is one of the following compression algorithms:\0A\00", align 1
@.str.14 = private unnamed_addr constant [22 x i8] c" jpeg\09\09JPEG encoding\0A\00", align 1
@.str.15 = private unnamed_addr constant [35 x i8] c" lzw\09\09Lempel-Ziv & Welch encoding\0A\00", align 1
@.str.16 = private unnamed_addr constant [29 x i8] c" packbits\09PackBits encoding\0A\00", align 1
@.str.17 = private unnamed_addr constant [23 x i8] c" none\09\09no compression\0A\00", align 1
@.str.18 = private unnamed_addr constant [28 x i8] c"and the other options are:\0A\00", align 1
@.str.19 = private unnamed_addr constant [16 x i8] c" -r\09rows/strip\0A\00", align 1
@.str.20 = private unnamed_addr constant [54 x i8] c" -b (progress by block rather than as a whole image)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) local_unnamed_addr #0 {
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %2
  %3 = tail call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #6
  switch i32 %3, label %.backedge.backedge [
    i32 -1, label %30
    i32 98, label %4
    i32 99, label %5
    i32 114, label %23
    i32 116, label %26
    i32 63, label %29
  ]

; <label>:4:                                      ; preds = %.backedge
  store i32 1, i32* @process_by_block, align 4
  br label %.backedge.backedge

; <label>:5:                                      ; preds = %.backedge
  %6 = load i8*, i8** @optarg, align 8
  %7 = tail call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #7
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %5
  store i16 1, i16* @compression, align 2
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %9, %17, %21, %13, %.backedge, %26, %23, %4
  br label %.backedge

; <label>:10:                                     ; preds = %5
  %11 = tail call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)) #7
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  store i16 -32763, i16* @compression, align 2
  br label %.backedge.backedge

; <label>:14:                                     ; preds = %10
  %15 = tail call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  store i16 5, i16* @compression, align 2
  br label %.backedge.backedge

; <label>:18:                                     ; preds = %14
  %19 = tail call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0)) #7
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  store i16 7, i16* @compression, align 2
  br label %.backedge.backedge

; <label>:22:                                     ; preds = %18
  tail call fastcc void @usage()
  unreachable

; <label>:23:                                     ; preds = %.backedge
  %24 = load i8*, i8** @optarg, align 8
  %25 = tail call i32 @atoi(i8* %24) #7
  store i32 %25, i32* @rowsperstrip, align 4
  br label %.backedge.backedge

; <label>:26:                                     ; preds = %.backedge
  %27 = load i8*, i8** @optarg, align 8
  %28 = tail call i32 @atoi(i8* %27) #7
  store i32 %28, i32* @rowsperstrip, align 4
  br label %.backedge.backedge

; <label>:29:                                     ; preds = %.backedge
  tail call fastcc void @usage()
  unreachable

; <label>:30:                                     ; preds = %.backedge
  %31 = load i32, i32* @optind, align 4
  %32 = sub nsw i32 %0, %31
  %33 = icmp slt i32 %32, 2
  br i1 %33, label %34, label %35

; <label>:34:                                     ; preds = %30
  tail call fastcc void @usage()
  unreachable

; <label>:35:                                     ; preds = %30
  %36 = add nsw i32 %0, -1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8*, i8** %1, i64 %37
  %39 = load i8*, i8** %38, align 8
  %40 = tail call %struct.tiff* @TIFFOpen(i8* %39, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)) #6
  %41 = icmp eq %struct.tiff* %40, null
  br i1 %41, label %64, label %.preheader1

.preheader1:                                      ; preds = %35
  %42 = load i32, i32* @optind, align 4
  %43 = icmp slt i32 %42, %36
  br i1 %43, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %60
  %44 = phi i32 [ %62, %60 ], [ %42, %.lr.ph.preheader ]
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8*, i8** %1, i64 %45
  %47 = load i8*, i8** %46, align 8
  %48 = tail call %struct.tiff* @TIFFOpen(i8* %47, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)) #6
  %49 = icmp eq %struct.tiff* %48, null
  br i1 %49, label %60, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.lr.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %56
  %50 = tail call fastcc i32 @tiffcvt(%struct.tiff* nonnull %48, %struct.tiff* nonnull %40)
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %55, label %52

; <label>:52:                                     ; preds = %.preheader
  %53 = tail call i32 @TIFFWriteDirectory(%struct.tiff* nonnull %40) #6
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %56

; <label>:55:                                     ; preds = %52, %.preheader
  tail call void @TIFFClose(%struct.tiff* nonnull %40) #6
  br label %64

; <label>:56:                                     ; preds = %52
  %57 = tail call i32 @TIFFReadDirectory(%struct.tiff* nonnull %48) #6
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %.preheader

; <label>:59:                                     ; preds = %56
  tail call void @TIFFClose(%struct.tiff* nonnull %48) #6
  br label %60

; <label>:60:                                     ; preds = %59, %.lr.ph
  %61 = load i32, i32* @optind, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* @optind, align 4
  %63 = icmp slt i32 %62, %36
  br i1 %63, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %60
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader1
  tail call void @TIFFClose(%struct.tiff* nonnull %40) #6
  br label %64

; <label>:64:                                     ; preds = %35, %._crit_edge, %55
  %.0 = phi i32 [ 1, %55 ], [ 0, %._crit_edge ], [ -2, %35 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #2

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @usage() unnamed_addr #3 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.12, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %1) #8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.13, i64 0, i64 0), i64 59, i64 1, %struct._IO_FILE* %3) #8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.14, i64 0, i64 0), i64 21, i64 1, %struct._IO_FILE* %5) #8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %7) #8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.16, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %9) #8
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.17, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.18, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %13) #8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.19, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %15) #8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.20, i64 0, i64 0), i64 53, i64 1, %struct._IO_FILE* %17) #8
  tail call void @exit(i32 1) #9
  unreachable
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #2

declare %struct.tiff* @TIFFOpen(i8*, i8*) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @tiffcvt(%struct.tiff*, %struct.tiff*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  %6 = alloca float, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca [1 x i16], align 2
  %10 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 256, i32* nonnull %3) #6
  %11 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 257, i32* nonnull %4) #6
  %12 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 254, i32* nonnull %8) #6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %17, label %14

; <label>:14:                                     ; preds = %2
  %15 = load i32, i32* %8, align 4
  %16 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 254, i32 %15) #6
  br label %17

; <label>:17:                                     ; preds = %2, %14
  %18 = load i32, i32* %3, align 4
  %19 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 256, i32 %18) #6
  %20 = load i32, i32* %4, align 4
  %21 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 257, i32 %20) #6
  %22 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 258, i32 8) #6
  %23 = load i16, i16* @compression, align 2
  %24 = zext i16 %23 to i32
  %25 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 259, i32 %24) #6
  %26 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 262, i32 2) #6
  %27 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 266, i16* nonnull %5) #6
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %33, label %29

; <label>:29:                                     ; preds = %17
  %30 = load i16, i16* %5, align 2
  %31 = zext i16 %30 to i32
  %32 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 266, i32 %31) #6
  br label %33

; <label>:33:                                     ; preds = %17, %29
  %34 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 274, i32 1) #6
  %35 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 277, i32 4) #6
  %36 = getelementptr inbounds [1 x i16], [1 x i16]* %9, i64 0, i64 0
  store i16 1, i16* %36, align 2
  %37 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 338, i32 1, i16* nonnull %36) #6
  %38 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 282, float* nonnull %6) #6
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %44, label %40

; <label>:40:                                     ; preds = %33
  %41 = load float, float* %6, align 4
  %42 = fpext float %41 to double
  %43 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 282, double %42) #6
  br label %44

; <label>:44:                                     ; preds = %33, %40
  %45 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 283, float* nonnull %6) #6
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %51, label %47

; <label>:47:                                     ; preds = %44
  %48 = load float, float* %6, align 4
  %49 = fpext float %48 to double
  %50 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 283, double %49) #6
  br label %51

; <label>:51:                                     ; preds = %44, %47
  %52 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 296, i16* nonnull %5) #6
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %58, label %54

; <label>:54:                                     ; preds = %51
  %55 = load i16, i16* %5, align 2
  %56 = zext i16 %55 to i32
  %57 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 296, i32 %56) #6
  br label %58

; <label>:58:                                     ; preds = %51, %54
  %59 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 284, i32 1) #6
  %60 = call i8* @TIFFGetVersion() #6
  %61 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 305, i8* %60) #6
  %62 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 269, i8** nonnull %7) #6
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %67, label %64

; <label>:64:                                     ; preds = %58
  %65 = load i8*, i8** %7, align 8
  %66 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 269, i8* %65) #6
  br label %67

; <label>:67:                                     ; preds = %58, %64
  %68 = load i32, i32* @process_by_block, align 4
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %.thread, label %70

; <label>:70:                                     ; preds = %67
  %71 = call i32 @TIFFIsTiled(%struct.tiff* %0) #6
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %75, label %73

; <label>:73:                                     ; preds = %70
  %74 = call fastcc i32 @cvt_by_tile(%struct.tiff* %0, %struct.tiff* %1)
  br label %80

; <label>:75:                                     ; preds = %70
  %.pr = load i32, i32* @process_by_block, align 4
  %76 = icmp eq i32 %.pr, 0
  br i1 %76, label %.thread, label %77

; <label>:77:                                     ; preds = %75
  %78 = call fastcc i32 @cvt_by_strip(%struct.tiff* %0, %struct.tiff* %1)
  br label %80

.thread:                                          ; preds = %67, %75
  %79 = call fastcc i32 @cvt_whole_image(%struct.tiff* %0, %struct.tiff* %1)
  br label %80

; <label>:80:                                     ; preds = %.thread, %77, %73
  %.0 = phi i32 [ %74, %73 ], [ %78, %77 ], [ %79, %.thread ]
  ret i32 %.0
}

declare i32 @TIFFWriteDirectory(%struct.tiff*) local_unnamed_addr #4

declare void @TIFFClose(%struct.tiff*) local_unnamed_addr #4

declare i32 @TIFFReadDirectory(%struct.tiff*) local_unnamed_addr #4

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) local_unnamed_addr #4

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #4

declare i8* @TIFFGetVersion() local_unnamed_addr #4

declare i32 @TIFFIsTiled(%struct.tiff*) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @cvt_by_tile(%struct.tiff*, %struct.tiff*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 256, i32* nonnull %3) #6
  %8 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 257, i32* nonnull %4) #6
  %9 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 322, i32* nonnull %5) #6
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %14, label %11

; <label>:11:                                     ; preds = %2
  %12 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 323, i32* nonnull %6) #6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11, %2
  %15 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %15, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %117

; <label>:16:                                     ; preds = %11
  %17 = load i32, i32* %5, align 4
  %18 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 322, i32 %17) #6
  %19 = load i32, i32* %6, align 4
  %20 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 323, i32 %19) #6
  %21 = load i32, i32* %5, align 4
  %22 = load i32, i32* %6, align 4
  %23 = shl i32 %21, 2
  %24 = mul i32 %23, %22
  %25 = call i8* @_TIFFmalloc(i32 %24) #6
  %26 = bitcast i8* %25 to i32*
  %27 = icmp eq i8* %25, null
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %16
  %29 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %29, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %117

; <label>:30:                                     ; preds = %16
  %31 = load i32, i32* %5, align 4
  %32 = shl i32 %31, 2
  %33 = call i8* @_TIFFmalloc(i32 %32) #6
  %34 = icmp eq i8* %33, null
  br i1 %34, label %.preheader7.thread, label %.preheader7

.preheader7.thread:                               ; preds = %30
  %35 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %35, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %._crit_edge23

.preheader7:                                      ; preds = %30
  %36 = load i32, i32* %4, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %._crit_edge23, label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.preheader7
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %._crit_edge11
  %38 = phi i1 [ %113, %._crit_edge11 ], [ false, %.preheader6.preheader ]
  %.122 = phi i32 [ %.2, %._crit_edge11 ], [ 1, %.preheader6.preheader ]
  %.0417 = phi i32 [ %112, %._crit_edge11 ], [ 0, %.preheader6.preheader ]
  %39 = load i32, i32* %3, align 4
  %40 = icmp ne i32 %39, 0
  %not.5 = xor i1 %38, true
  %41 = and i1 %40, %not.5
  br i1 %41, label %.lr.ph10, label %._crit_edge11

.lr.ph10:                                         ; preds = %.preheader6
  br i1 %38, label %.lr.ph10.split, label %.lr.ph10.split.us.preheader

.lr.ph10.split.us.preheader:                      ; preds = %.lr.ph10
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %.lr.ph10.split.us.preheader, %51
  %.039.us = phi i32 [ %53, %51 ], [ 0, %.lr.ph10.split.us.preheader ]
  %42 = call i32 @TIFFReadRGBATile(%struct.tiff* %0, i32 %.039.us, i32 %.0417, i32* %26) #6
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %44 = call i32 @TIFFComputeTile(%struct.tiff* %1, i32 %.039.us, i32 %.0417, i32 0, i16 zeroext 0) #6
  %45 = load i32, i32* %5, align 4
  %46 = shl i32 %45, 2
  %47 = load i32, i32* %6, align 4
  %48 = mul i32 %46, %47
  %49 = call i32 @TIFFWriteEncodedTile(%struct.tiff* %1, i32 %44, i8* nonnull %25, i32 %48) #6
  %50 = icmp eq i32 %49, -1
  br i1 %50, label %._crit_edge11.loopexit, label %51

; <label>:51:                                     ; preds = %._crit_edge.us
  %52 = load i32, i32* %5, align 4
  %53 = add i32 %52, %.039.us
  %54 = load i32, i32* %3, align 4
  %55 = icmp ult i32 %53, %54
  br i1 %55, label %.lr.ph10.split.us, label %._crit_edge11.loopexit

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.lr.ph.us
  %56 = phi i32 [ %74, %.lr.ph.us ], [ %77, %.lr.ph.us.preheader ]
  %.018.us = phi i32 [ %73, %.lr.ph.us ], [ 0, %.lr.ph.us.preheader ]
  %57 = load i32, i32* %5, align 4
  %58 = mul i32 %57, %.018.us
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32* %26, i64 %59
  %61 = xor i32 %.018.us, -1
  %62 = add i32 %56, %61
  %63 = mul i32 %57, %62
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32* %26, i64 %64
  %66 = bitcast i32* %60 to i8*
  %67 = shl i32 %57, 2
  call void @_TIFFmemcpy(i8* nonnull %33, i8* %66, i32 %67) #6
  %68 = bitcast i32* %65 to i8*
  %69 = load i32, i32* %5, align 4
  %70 = shl i32 %69, 2
  call void @_TIFFmemcpy(i8* %66, i8* %68, i32 %70) #6
  %71 = load i32, i32* %5, align 4
  %72 = shl i32 %71, 2
  call void @_TIFFmemcpy(i8* %68, i8* nonnull %33, i32 %72) #6
  %73 = add nuw nsw i32 %.018.us, 1
  %74 = load i32, i32* %6, align 4
  %75 = lshr i32 %74, 1
  %76 = icmp ult i32 %73, %75
  br i1 %76, label %.lr.ph.us, label %._crit_edge.us.loopexit

.preheader.us:                                    ; preds = %.lr.ph10.split.us
  %77 = load i32, i32* %6, align 4
  %78 = icmp ugt i32 %77, 1
  br i1 %78, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  br label %.lr.ph.us

.lr.ph10.split:                                   ; preds = %.lr.ph10
  %79 = call i32 @TIFFReadRGBATile(%struct.tiff* %0, i32 0, i32 %.0417, i32* %26) #6
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %._crit_edge11, label %.preheader

.preheader:                                       ; preds = %.lr.ph10.split
  %81 = load i32, i32* %6, align 4
  %82 = icmp ugt i32 %81, 1
  br i1 %82, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %83 = phi i32 [ %101, %.lr.ph ], [ %81, %.lr.ph.preheader ]
  %.018 = phi i32 [ %100, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %84 = load i32, i32* %5, align 4
  %85 = mul i32 %84, %.018
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32* %26, i64 %86
  %88 = xor i32 %.018, -1
  %89 = add i32 %83, %88
  %90 = mul i32 %84, %89
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32* %26, i64 %91
  %93 = bitcast i32* %87 to i8*
  %94 = shl i32 %84, 2
  call void @_TIFFmemcpy(i8* nonnull %33, i8* %93, i32 %94) #6
  %95 = bitcast i32* %92 to i8*
  %96 = load i32, i32* %5, align 4
  %97 = shl i32 %96, 2
  call void @_TIFFmemcpy(i8* %93, i8* %95, i32 %97) #6
  %98 = load i32, i32* %5, align 4
  %99 = shl i32 %98, 2
  call void @_TIFFmemcpy(i8* %95, i8* nonnull %33, i32 %99) #6
  %100 = add nuw nsw i32 %.018, 1
  %101 = load i32, i32* %6, align 4
  %102 = lshr i32 %101, 1
  %103 = icmp ult i32 %100, %102
  br i1 %103, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %104 = call i32 @TIFFComputeTile(%struct.tiff* %1, i32 0, i32 %.0417, i32 0, i16 zeroext 0) #6
  %105 = load i32, i32* %5, align 4
  %106 = shl i32 %105, 2
  %107 = load i32, i32* %6, align 4
  %108 = mul i32 %106, %107
  %109 = call i32 @TIFFWriteEncodedTile(%struct.tiff* %1, i32 %104, i8* nonnull %25, i32 %108) #6
  %110 = icmp eq i32 %109, -1
  %..122 = select i1 %110, i32 0, i32 %.122
  br label %._crit_edge11

._crit_edge11.loopexit:                           ; preds = %51, %.lr.ph10.split.us, %._crit_edge.us
  %.2.ph = phi i32 [ %.122, %51 ], [ 0, %.lr.ph10.split.us ], [ 0, %._crit_edge.us ]
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %._crit_edge, %.lr.ph10.split, %.preheader6
  %.2 = phi i32 [ %.122, %.preheader6 ], [ 0, %.lr.ph10.split ], [ %..122, %._crit_edge ], [ %.2.ph, %._crit_edge11.loopexit ]
  %111 = load i32, i32* %6, align 4
  %112 = add i32 %111, %.0417
  %113 = icmp eq i32 %.2, 0
  %114 = load i32, i32* %4, align 4
  %115 = icmp ult i32 %112, %114
  %not. = xor i1 %113, true
  %116 = and i1 %115, %not.
  br i1 %116, label %.preheader6, label %._crit_edge23.loopexit

._crit_edge23.loopexit:                           ; preds = %._crit_edge11
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.preheader7, %.preheader7.thread
  %.1.lcssa = phi i32 [ 1, %.preheader7 ], [ 0, %.preheader7.thread ], [ %.2, %._crit_edge23.loopexit ]
  call void @_TIFFfree(i8* nonnull %25) #6
  call void @_TIFFfree(i8* %33) #6
  br label %117

; <label>:117:                                    ; preds = %._crit_edge23, %28, %14
  %.0 = phi i32 [ 0, %28 ], [ %.1.lcssa, %._crit_edge23 ], [ 0, %14 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @cvt_by_strip(%struct.tiff*, %struct.tiff*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 256, i32* nonnull %3) #6
  %6 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 257, i32* nonnull %4) #6
  %7 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 278, i32* nonnull @rowsperstrip) #6
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %2
  %10 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %10, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i64 0, i64 0)) #6
  br label %73

; <label>:11:                                     ; preds = %2
  %12 = load i32, i32* @rowsperstrip, align 4
  %13 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 278, i32 %12) #6
  %14 = load i32, i32* %3, align 4
  %15 = load i32, i32* @rowsperstrip, align 4
  %16 = shl i32 %14, 2
  %17 = mul i32 %16, %15
  %18 = call i8* @_TIFFmalloc(i32 %17) #6
  %19 = bitcast i8* %18 to i32*
  %20 = icmp eq i8* %18, null
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %11
  %22 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %22, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %73

; <label>:23:                                     ; preds = %11
  %24 = load i32, i32* %3, align 4
  %25 = shl i32 %24, 2
  %26 = call i8* @_TIFFmalloc(i32 %25) #6
  %27 = icmp eq i8* %26, null
  br i1 %27, label %.thread, label %29

.thread:                                          ; preds = %23
  %28 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %28, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %._crit_edge9

; <label>:29:                                     ; preds = %23
  %30 = load i32, i32* %4, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %._crit_edge9, label %.lr.ph8.split.us.preheader

.lr.ph8.split.us.preheader:                       ; preds = %29
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %.lr.ph8.split.us.preheader, %49
  %.046.us = phi i32 [ %51, %49 ], [ 0, %.lr.ph8.split.us.preheader ]
  %32 = call i32 @TIFFReadRGBAStrip(%struct.tiff* %0, i32 %.046.us, i32* %19) #6
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %._crit_edge9.loopexit, label %34

; <label>:34:                                     ; preds = %.lr.ph8.split.us
  %35 = load i32, i32* @rowsperstrip, align 4
  %36 = add i32 %35, %.046.us
  %37 = load i32, i32* %4, align 4
  %38 = icmp ugt i32 %36, %37
  %39 = sub i32 %37, %.046.us
  %.02.us = select i1 %38, i32 %39, i32 %35
  %40 = sdiv i32 %.02.us, 2
  %41 = icmp sgt i32 %.02.us, 1
  br i1 %41, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %54
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %34
  %42 = load i32, i32* @rowsperstrip, align 4
  %43 = udiv i32 %.046.us, %42
  %44 = shl i32 %.02.us, 2
  %45 = load i32, i32* %3, align 4
  %46 = mul i32 %44, %45
  %47 = call i32 @TIFFWriteEncodedStrip(%struct.tiff* %1, i32 %43, i8* nonnull %18, i32 %46) #6
  %48 = icmp eq i32 %47, -1
  br i1 %48, label %._crit_edge9.loopexit, label %49

; <label>:49:                                     ; preds = %._crit_edge.us
  %50 = load i32, i32* @rowsperstrip, align 4
  %51 = add i32 %50, %.046.us
  %52 = load i32, i32* %4, align 4
  %53 = icmp ult i32 %51, %52
  br i1 %53, label %.lr.ph8.split.us, label %._crit_edge9.loopexit

; <label>:54:                                     ; preds = %.lr.ph.us, %54
  %.015.us = phi i32 [ 0, %.lr.ph.us ], [ %70, %54 ]
  %55 = load i32, i32* %3, align 4
  %56 = mul i32 %55, %.015.us
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32* %19, i64 %57
  %59 = sub i32 %72, %.015.us
  %60 = mul i32 %55, %59
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32* %19, i64 %61
  %63 = bitcast i32* %58 to i8*
  %64 = shl i32 %55, 2
  call void @_TIFFmemcpy(i8* nonnull %26, i8* %63, i32 %64) #6
  %65 = bitcast i32* %62 to i8*
  %66 = load i32, i32* %3, align 4
  %67 = shl i32 %66, 2
  call void @_TIFFmemcpy(i8* %63, i8* %65, i32 %67) #6
  %68 = load i32, i32* %3, align 4
  %69 = shl i32 %68, 2
  call void @_TIFFmemcpy(i8* %65, i8* nonnull %26, i32 %69) #6
  %70 = add nuw nsw i32 %.015.us, 1
  %71 = icmp slt i32 %70, %40
  br i1 %71, label %54, label %._crit_edge.us.loopexit

.lr.ph.us:                                        ; preds = %34
  %72 = add i32 %.02.us, -1
  br label %54

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us, %.lr.ph8.split.us, %49
  %.1.ph = phi i32 [ 0, %._crit_edge.us ], [ 0, %.lr.ph8.split.us ], [ 1, %49 ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %29, %.thread
  %.1 = phi i32 [ 1, %29 ], [ 0, %.thread ], [ %.1.ph, %._crit_edge9.loopexit ]
  call void @_TIFFfree(i8* nonnull %18) #6
  call void @_TIFFfree(i8* %26) #6
  br label %73

; <label>:73:                                     ; preds = %._crit_edge9, %21, %9
  %.0 = phi i32 [ 0, %21 ], [ %.1, %._crit_edge9 ], [ 0, %9 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @cvt_whole_image(%struct.tiff*, %struct.tiff*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 256, i32* nonnull %3) #6
  %6 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 257, i32* nonnull %4) #6
  %7 = load i32, i32* @rowsperstrip, align 4
  %8 = call i32 @TIFFDefaultStripSize(%struct.tiff* %1, i32 %7) #6
  store i32 %8, i32* @rowsperstrip, align 4
  %9 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 278, i32 %8) #6
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* %4, align 4
  %12 = shl i32 %10, 2
  %13 = mul i32 %12, %11
  %14 = call i8* @_TIFFmalloc(i32 %13) #6
  %15 = bitcast i8* %14 to i32*
  %16 = icmp eq i8* %14, null
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %2
  %18 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %18, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %78

; <label>:19:                                     ; preds = %2
  %20 = load i32, i32* %3, align 4
  %21 = load i32, i32* %4, align 4
  %22 = call i32 @TIFFReadRGBAImage(%struct.tiff* %0, i32 %20, i32 %21, i32* %15, i32 0) #6
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %19
  call void @_TIFFfree(i8* nonnull %14) #6
  br label %78

; <label>:25:                                     ; preds = %19
  %26 = load i32, i32* %3, align 4
  %27 = shl i32 %26, 2
  %28 = call i8* @_TIFFmalloc(i32 %27) #6
  %29 = icmp eq i8* %28, null
  br i1 %29, label %32, label %.preheader

.preheader:                                       ; preds = %25
  %30 = load i32, i32* %4, align 4
  %31 = icmp ugt i32 %30, 1
  br i1 %31, label %.lr.ph5.preheader, label %._crit_edge6

.lr.ph5.preheader:                                ; preds = %.preheader
  br label %.lr.ph5

; <label>:32:                                     ; preds = %25
  %33 = call i8* @TIFFFileName(%struct.tiff* %0) #6
  call void (i8*, i8*, ...) @TIFFError(i8* %33, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %78

.lr.ph5:                                          ; preds = %.lr.ph5.preheader, %.lr.ph5
  %34 = phi i32 [ %52, %.lr.ph5 ], [ %30, %.lr.ph5.preheader ]
  %.024 = phi i32 [ %51, %.lr.ph5 ], [ 0, %.lr.ph5.preheader ]
  %35 = load i32, i32* %3, align 4
  %36 = mul i32 %35, %.024
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32* %15, i64 %37
  %39 = xor i32 %.024, -1
  %40 = add i32 %34, %39
  %41 = mul i32 %35, %40
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32* %15, i64 %42
  %44 = bitcast i32* %38 to i8*
  %45 = shl i32 %35, 2
  call void @_TIFFmemcpy(i8* nonnull %28, i8* %44, i32 %45) #6
  %46 = bitcast i32* %43 to i8*
  %47 = load i32, i32* %3, align 4
  %48 = shl i32 %47, 2
  call void @_TIFFmemcpy(i8* %44, i8* %46, i32 %48) #6
  %49 = load i32, i32* %3, align 4
  %50 = shl i32 %49, 2
  call void @_TIFFmemcpy(i8* %46, i8* nonnull %28, i32 %50) #6
  %51 = add i32 %.024, 1
  %52 = load i32, i32* %4, align 4
  %53 = lshr i32 %52, 1
  %54 = icmp ult i32 %51, %53
  br i1 %54, label %.lr.ph5, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %.lr.ph5
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader
  call void @_TIFFfree(i8* nonnull %28) #6
  %55 = load i32, i32* %4, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %73
  %57 = phi i32 [ %76, %73 ], [ %55, %.lr.ph.preheader ]
  %.13 = phi i32 [ %75, %73 ], [ 0, %.lr.ph.preheader ]
  %58 = load i32, i32* %3, align 4
  %59 = mul i32 %58, %.13
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32* %15, i64 %60
  %62 = load i32, i32* @rowsperstrip, align 4
  %63 = add i32 %62, %.13
  %64 = icmp ugt i32 %63, %57
  %65 = sub i32 %57, %.13
  %.01 = select i1 %64, i32 %65, i32 %62
  %66 = udiv i32 %.13, %62
  %67 = bitcast i32* %61 to i8*
  %68 = shl i32 %58, 2
  %69 = mul i32 %68, %.01
  %70 = call i32 @TIFFWriteEncodedStrip(%struct.tiff* %1, i32 %66, i8* %67, i32 %69) #6
  %71 = icmp eq i32 %70, -1
  br i1 %71, label %72, label %73

; <label>:72:                                     ; preds = %.lr.ph
  call void @_TIFFfree(i8* nonnull %14) #6
  br label %78

; <label>:73:                                     ; preds = %.lr.ph
  %74 = load i32, i32* @rowsperstrip, align 4
  %75 = add i32 %74, %.13
  %76 = load i32, i32* %4, align 4
  %77 = icmp ugt i32 %76, %75
  br i1 %77, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %73
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge6
  call void @_TIFFfree(i8* nonnull %14) #6
  br label %78

; <label>:78:                                     ; preds = %._crit_edge, %72, %32, %24, %17
  %.0 = phi i32 [ 0, %17 ], [ 0, %32 ], [ 0, %72 ], [ 1, %._crit_edge ], [ 0, %24 ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #4

declare i8* @TIFFFileName(%struct.tiff*) local_unnamed_addr #4

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #4

declare i32 @TIFFReadRGBATile(%struct.tiff*, i32, i32, i32*) local_unnamed_addr #4

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #4

declare i32 @TIFFWriteEncodedTile(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #4

declare i32 @TIFFComputeTile(%struct.tiff*, i32, i32, i32, i16 zeroext) local_unnamed_addr #4

declare void @_TIFFfree(i8*) local_unnamed_addr #4

declare i32 @TIFFReadRGBAStrip(%struct.tiff*, i32, i32*) local_unnamed_addr #4

declare i32 @TIFFWriteEncodedStrip(%struct.tiff*, i32, i8*, i32) local_unnamed_addr #4

declare i32 @TIFFDefaultStripSize(%struct.tiff*, i32) local_unnamed_addr #4

declare i32 @TIFFReadRGBAImage(%struct.tiff*, i32, i32, i32*, i32) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
