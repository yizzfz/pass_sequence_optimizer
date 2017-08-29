; ModuleID = 'tiffdither.ll'
source_filename = "tiffdither.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.tiff = type opaque

@threshold = local_unnamed_addr global i32 128, align 4
@.str = private unnamed_addr constant [9 x i8] c"c:f:r:t:\00", align 1
@optarg = external local_unnamed_addr global i8*, align 8
@.str.1 = private unnamed_addr constant [8 x i8] c"lsb2msb\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"msb2lsb\00", align 1
@optind = external local_unnamed_addr global i32, align 4
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [22 x i8] c"%s: Not a b&w image.\0A\00", align 1
@.str.5 = private unnamed_addr constant [40 x i8] c" %s: Sorry, only handle 8-bit samples.\0A\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@imagewidth = common global i32 0, align 4
@imagelength = common global i32 0, align 4
@compression = internal unnamed_addr global i16 -32763, align 2
@.str.7 = private unnamed_addr constant [27 x i8] c"Dithered B&W version of %s\00", align 1
@group3options = internal unnamed_addr global i32 0, align 4
@predictor = internal unnamed_addr global i16 0, align 2
@.str.8 = private unnamed_addr constant [49 x i8] c"usage: tiffdither [options] input.tif output.tif\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"where options are:\00", align 1
@.str.10 = private unnamed_addr constant [48 x i8] c" -r #\09\09make each strip have no more than # rows\00", align 1
@.str.11 = private unnamed_addr constant [50 x i8] c" -f lsb2msb\09force lsb-to-msb FillOrder for output\00", align 1
@.str.12 = private unnamed_addr constant [50 x i8] c" -f msb2lsb\09force msb-to-lsb FillOrder for output\00", align 1
@.str.13 = private unnamed_addr constant [64 x i8] c" -c lzw[:opts]\09compress output with Lempel-Ziv & Welch encoding\00", align 1
@.str.14 = private unnamed_addr constant [70 x i8] c"               (no longer supported due to Unisys patent enforcement)\00", align 1
@.str.15 = private unnamed_addr constant [53 x i8] c" -c zip[:opts]\09compress output with deflate encoding\00", align 1
@.str.16 = private unnamed_addr constant [52 x i8] c" -c packbits\09compress output with packbits encoding\00", align 1
@.str.17 = private unnamed_addr constant [58 x i8] c" -c g3[:opts]\09compress output with CCITT Group 3 encoding\00", align 1
@.str.18 = private unnamed_addr constant [52 x i8] c" -c g4\09\09compress output with CCITT Group 4 encoding\00", align 1
@.str.19 = private unnamed_addr constant [48 x i8] c" -c none\09use no compression algorithm on output\00", align 1
@.str.20 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.21 = private unnamed_addr constant [17 x i8] c"Group 3 options:\00", align 1
@.str.22 = private unnamed_addr constant [43 x i8] c" 1d\09\09use default CCITT Group 3 1D-encoding\00", align 1
@.str.23 = private unnamed_addr constant [44 x i8] c" 2d\09\09use optional CCITT Group 3 2D-encoding\00", align 1
@.str.24 = private unnamed_addr constant [28 x i8] c" fill\09\09byte-align EOL codes\00", align 1
@.str.25 = private unnamed_addr constant [76 x i8] c"For example, -c g3:2d:fill to get G3-2D-encoded data with byte-aligned EOLs\00", align 1
@.str.26 = private unnamed_addr constant [25 x i8] c"LZW and deflate options:\00", align 1
@.str.27 = private unnamed_addr constant [24 x i8] c" #\09\09set predictor value\00", align 1
@.str.28 = private unnamed_addr constant [75 x i8] c"For example, -c lzw:2 to get LZW-encoded data with horizontal differencing\00", align 1
@stuff = local_unnamed_addr global [23 x i8*] [i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.28, i32 0, i32 0), i8* null], align 16
@.str.29 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.30 = private unnamed_addr constant [9 x i8] c"packbits\00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"g3\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"g4\00", align 1
@.str.33 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.34 = private unnamed_addr constant [4 x i8] c"zip\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"1d\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"2d\00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c"fill\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca float, align 4
  %7 = alloca [1024 x i8], align 16
  store i16 1, i16* %4, align 2
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %2
  %.04 = phi i32 [ -1, %2 ], [ %.04.be, %.backedge.backedge ]
  %.01 = phi i16 [ 0, %2 ], [ %.01.be, %.backedge.backedge ]
  %8 = tail call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0)) #6
  switch i32 %8, label %.backedge.backedge [
    i32 -1, label %34
    i32 99, label %9
    i32 102, label %14
    i32 114, label %22
    i32 116, label %25
    i32 63, label %33
  ]

; <label>:9:                                      ; preds = %.backedge
  %10 = load i8*, i8** @optarg, align 8
  %11 = tail call fastcc i32 @processCompressOptions(i8* %10)
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.backedge.backedge

; <label>:13:                                     ; preds = %9
  tail call fastcc void @usage()
  unreachable

; <label>:14:                                     ; preds = %.backedge
  %15 = load i8*, i8** @optarg, align 8
  %16 = tail call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)) #7
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %.backedge.backedge, label %18

; <label>:18:                                     ; preds = %14
  %19 = tail call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)) #7
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %.backedge.backedge, label %21

; <label>:21:                                     ; preds = %18
  tail call fastcc void @usage()
  unreachable

; <label>:22:                                     ; preds = %.backedge
  %23 = load i8*, i8** @optarg, align 8
  %24 = tail call i32 @atoi(i8* %23) #7
  br label %.backedge.backedge

; <label>:25:                                     ; preds = %.backedge
  %26 = load i8*, i8** @optarg, align 8
  %27 = tail call i32 @atoi(i8* %26) #7
  store i32 %27, i32* @threshold, align 4
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %25
  store i32 0, i32* @threshold, align 4
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %29, %32, %30, %14, %18, %9, %.backedge, %22
  %.04.be = phi i32 [ %24, %22 ], [ %.04, %.backedge ], [ %.04, %9 ], [ %.04, %18 ], [ %.04, %14 ], [ %.04, %30 ], [ %.04, %32 ], [ %.04, %29 ]
  %.01.be = phi i16 [ %.01, %22 ], [ %.01, %.backedge ], [ %.01, %9 ], [ 1, %18 ], [ 2, %14 ], [ %.01, %30 ], [ %.01, %32 ], [ %.01, %29 ]
  br label %.backedge

; <label>:30:                                     ; preds = %25
  %31 = icmp sgt i32 %27, 255
  br i1 %31, label %32, label %.backedge.backedge

; <label>:32:                                     ; preds = %30
  store i32 255, i32* @threshold, align 4
  br label %.backedge.backedge

; <label>:33:                                     ; preds = %.backedge
  tail call fastcc void @usage()
  unreachable

; <label>:34:                                     ; preds = %.backedge
  %35 = load i32, i32* @optind, align 4
  %36 = sub nsw i32 %0, %35
  %37 = icmp slt i32 %36, 2
  br i1 %37, label %38, label %39

; <label>:38:                                     ; preds = %34
  tail call fastcc void @usage()
  unreachable

; <label>:39:                                     ; preds = %34
  %40 = sext i32 %35 to i64
  %41 = getelementptr inbounds i8*, i8** %1, i64 %40
  %42 = load i8*, i8** %41, align 8
  %43 = tail call %struct.tiff* @TIFFOpen(i8* %42, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %44 = icmp eq %struct.tiff* %43, null
  br i1 %44, label %137, label %45

; <label>:45:                                     ; preds = %39
  %46 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %43, i32 277, i16* nonnull %3) #6
  %47 = load i16, i16* %3, align 2
  %48 = icmp eq i16 %47, 1
  br i1 %48, label %53, label %49

; <label>:49:                                     ; preds = %45
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = load i8*, i8** %1, align 8
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0), i8* %51) #8
  br label %137

; <label>:53:                                     ; preds = %45
  %54 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %43, i32 258, i16* nonnull %4) #6
  %55 = load i16, i16* %4, align 2
  %56 = icmp eq i16 %55, 8
  br i1 %56, label %61, label %57

; <label>:57:                                     ; preds = %53
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = load i8*, i8** %1, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.5, i64 0, i64 0), i8* %59) #8
  br label %137

; <label>:61:                                     ; preds = %53
  %62 = load i32, i32* @optind, align 4
  %63 = add nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8*, i8** %1, i64 %64
  %66 = load i8*, i8** %65, align 8
  %67 = call %struct.tiff* @TIFFOpen(i8* %66, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)) #6
  %68 = icmp eq %struct.tiff* %67, null
  br i1 %68, label %137, label %69

; <label>:69:                                     ; preds = %61
  %70 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %43, i32 256, i32* nonnull @imagewidth) #6
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %75, label %72

; <label>:72:                                     ; preds = %69
  %73 = load i32, i32* @imagewidth, align 4
  %74 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 256, i32 %73) #6
  br label %75

; <label>:75:                                     ; preds = %69, %72
  %76 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %43, i32 257, i32* nonnull @imagelength) #6
  %77 = load i32, i32* @imagelength, align 4
  %78 = add i32 %77, -1
  %79 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 257, i32 %78) #6
  %80 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 258, i32 1) #6
  %81 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 277, i32 1) #6
  %82 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 284, i32 1) #6
  %83 = load i16, i16* @compression, align 2
  %84 = zext i16 %83 to i32
  %85 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 259, i32 %84) #6
  %86 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 262, i32 1) #6
  %87 = zext i16 %.01 to i32
  %88 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 266, i32 %87) #6
  %89 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 0
  %90 = load i32, i32* @optind, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8*, i8** %1, i64 %91
  %93 = load i8*, i8** %92, align 8
  %94 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %89, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.7, i64 0, i64 0), i8* %93) #6
  %95 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 270, i8* nonnull %89) #6
  %96 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %43, i32 274, i16* nonnull %5) #6
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %102, label %98

; <label>:98:                                     ; preds = %75
  %99 = load i16, i16* %5, align 2
  %100 = zext i16 %99 to i32
  %101 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 274, i32 %100) #6
  br label %102

; <label>:102:                                    ; preds = %75, %98
  %103 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %43, i32 282, float* nonnull %6) #6
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %109, label %105

; <label>:105:                                    ; preds = %102
  %106 = load float, float* %6, align 4
  %107 = fpext float %106 to double
  %108 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 282, double %107) #6
  br label %109

; <label>:109:                                    ; preds = %102, %105
  %110 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %43, i32 283, float* nonnull %6) #6
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %116, label %112

; <label>:112:                                    ; preds = %109
  %113 = load float, float* %6, align 4
  %114 = fpext float %113 to double
  %115 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 283, double %114) #6
  br label %116

; <label>:116:                                    ; preds = %109, %112
  %117 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %43, i32 296, i16* nonnull %5) #6
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %123, label %119

; <label>:119:                                    ; preds = %116
  %120 = load i16, i16* %5, align 2
  %121 = zext i16 %120 to i32
  %122 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 296, i32 %121) #6
  br label %123

; <label>:123:                                    ; preds = %119, %116
  %124 = call i32 @TIFFDefaultStripSize(%struct.tiff* nonnull %67, i32 %.04) #6
  %125 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 278, i32 %124) #6
  %126 = load i16, i16* @compression, align 2
  switch i16 %126, label %136 [
    i16 3, label %127
    i16 5, label %130
    i16 -32590, label %130
  ]

; <label>:127:                                    ; preds = %123
  %128 = load i32, i32* @group3options, align 4
  %129 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 292, i32 %128) #6
  br label %136

; <label>:130:                                    ; preds = %123, %123
  %131 = load i16, i16* @predictor, align 2
  %132 = icmp eq i16 %131, 0
  br i1 %132, label %136, label %133

; <label>:133:                                    ; preds = %130
  %134 = zext i16 %131 to i32
  %135 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %67, i32 317, i32 %134) #6
  br label %136

; <label>:136:                                    ; preds = %133, %130, %127, %123
  call fastcc void @fsdither(%struct.tiff* nonnull %43, %struct.tiff* nonnull %67)
  call void @TIFFClose(%struct.tiff* nonnull %43) #6
  call void @TIFFClose(%struct.tiff* nonnull %67) #6
  br label %137

; <label>:137:                                    ; preds = %61, %39, %136, %57, %49
  %.0 = phi i32 [ -1, %49 ], [ -1, %57 ], [ 0, %136 ], [ -1, %39 ], [ -1, %61 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @processCompressOptions(i8* readonly) unnamed_addr #0 {
  %2 = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.29, i64 0, i64 0)) #7
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %.sink.split, label %4

; <label>:4:                                      ; preds = %1
  %5 = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.30, i64 0, i64 0)) #7
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %.sink.split, label %7

; <label>:7:                                      ; preds = %4
  %8 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.31, i64 0, i64 0), i64 2) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %7
  tail call fastcc void @processG3Options(i8* %0)
  br label %.sink.split

; <label>:11:                                     ; preds = %7
  %12 = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i64 0, i64 0)) #7
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %.sink.split, label %14

; <label>:14:                                     ; preds = %11
  %15 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i64 0, i64 0), i64 3) #7
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %24

; <label>:17:                                     ; preds = %14
  %18 = tail call i8* @strchr(i8* %0, i32 58) #7
  %19 = icmp eq i8* %18, null
  br i1 %19, label %.sink.split, label %20

; <label>:20:                                     ; preds = %17
  %21 = getelementptr inbounds i8, i8* %18, i64 1
  %22 = tail call i32 @atoi(i8* %21) #7
  %23 = trunc i32 %22 to i16
  store i16 %23, i16* @predictor, align 2
  br label %.sink.split

; <label>:24:                                     ; preds = %14
  %25 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.34, i64 0, i64 0), i64 3) #7
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %34

; <label>:27:                                     ; preds = %24
  %28 = tail call i8* @strchr(i8* %0, i32 58) #7
  %29 = icmp eq i8* %28, null
  br i1 %29, label %.sink.split, label %30

; <label>:30:                                     ; preds = %27
  %31 = getelementptr inbounds i8, i8* %28, i64 1
  %32 = tail call i32 @atoi(i8* %31) #7
  %33 = trunc i32 %32 to i16
  store i16 %33, i16* @predictor, align 2
  br label %.sink.split

.sink.split:                                      ; preds = %1, %30, %27, %20, %17, %11, %4, %10
  %.sink = phi i16 [ 3, %10 ], [ -32763, %4 ], [ 4, %11 ], [ 5, %17 ], [ 5, %20 ], [ -32590, %27 ], [ -32590, %30 ], [ 1, %1 ]
  store i16 %.sink, i16* @compression, align 2
  br label %34

; <label>:34:                                     ; preds = %.sink.split, %24
  %.0 = phi i32 [ 0, %24 ], [ 1, %.sink.split ]
  ret i32 %.0
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @usage() unnamed_addr #2 {
  %1 = alloca [8192 x i8], align 16
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = getelementptr inbounds [8192 x i8], [8192 x i8]* %1, i64 0, i64 0
  call void @setbuf(%struct._IO_FILE* %2, i8* nonnull %3) #6
  %4 = load i8*, i8** getelementptr inbounds ([23 x i8*], [23 x i8*]* @stuff, i64 0, i64 0), align 16
  %5 = icmp eq i8* %4, null
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %6 = phi i8* [ %10, %.lr.ph ], [ %4, %.lr.ph.preheader ]
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i64 0, i64 0), i8* nonnull %6) #8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [23 x i8*], [23 x i8*]* @stuff, i64 0, i64 %indvars.iv.next
  %10 = load i8*, i8** %9, align 8
  %11 = icmp eq i8* %10, null
  br i1 %11, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  call void @exit(i32 1) #9
  unreachable
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #3

declare %struct.tiff* @TIFFOpen(i8*, i8*) local_unnamed_addr #4

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

declare i32 @TIFFDefaultStripSize(%struct.tiff*, i32) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @fsdither(%struct.tiff*, %struct.tiff*) unnamed_addr #0 {
  %3 = load i32, i32* @imagelength, align 4
  %4 = add i32 %3, -1
  %5 = load i32, i32* @imagewidth, align 4
  %6 = add i32 %5, -1
  %7 = tail call i32 @TIFFScanlineSize(%struct.tiff* %0) #6
  %8 = tail call i8* @_TIFFmalloc(i32 %7) #6
  %9 = load i32, i32* @imagewidth, align 4
  %10 = shl i32 %9, 1
  %11 = tail call i8* @_TIFFmalloc(i32 %10) #6
  %12 = bitcast i8* %11 to i16*
  %13 = load i32, i32* @imagewidth, align 4
  %14 = shl i32 %13, 1
  %15 = tail call i8* @_TIFFmalloc(i32 %14) #6
  %16 = bitcast i8* %15 to i16*
  %17 = tail call i32 @TIFFScanlineSize(%struct.tiff* %1) #6
  %18 = tail call i8* @_TIFFmalloc(i32 %17) #6
  %19 = tail call i32 @TIFFReadScanline(%struct.tiff* %0, i8* %8, i32 0, i16 zeroext 0) #6
  %20 = icmp slt i32 %19, 1
  br i1 %20, label %140, label %.preheader22

.preheader22:                                     ; preds = %2
  %21 = load i32, i32* @imagewidth, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.preheader21, label %.lr.ph49.preheader

.lr.ph49.preheader:                               ; preds = %.preheader22
  br label %.lr.ph49

.preheader21.loopexit:                            ; preds = %.lr.ph49
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.loopexit, %.preheader22
  %23 = load i32, i32* @imagelength, align 4
  %24 = icmp ugt i32 %23, 1
  br i1 %24, label %.lr.ph37.preheader, label %._crit_edge38

.lr.ph37.preheader:                               ; preds = %.preheader21
  br label %.lr.ph37

.lr.ph49:                                         ; preds = %.lr.ph49.preheader, %.lr.ph49
  %.0348 = phi i32 [ %29, %.lr.ph49 ], [ 0, %.lr.ph49.preheader ]
  %.0747 = phi i8* [ %28, %.lr.ph49 ], [ %8, %.lr.ph49.preheader ]
  %.01346 = phi i16* [ %27, %.lr.ph49 ], [ %16, %.lr.ph49.preheader ]
  %25 = load i8, i8* %.0747, align 1
  %26 = zext i8 %25 to i16
  store i16 %26, i16* %.01346, align 2
  %27 = getelementptr inbounds i16, i16* %.01346, i64 1
  %28 = getelementptr inbounds i8, i8* %.0747, i64 1
  %29 = add i32 %.0348, 1
  %30 = load i32, i32* @imagewidth, align 4
  %31 = icmp ult i32 %29, %30
  br i1 %31, label %.lr.ph49, label %.preheader21.loopexit

.lr.ph37:                                         ; preds = %.lr.ph37.preheader, %._crit_edge33
  %.0636 = phi i32 [ %135, %._crit_edge33 ], [ 1, %.lr.ph37.preheader ]
  %.0935 = phi i16* [ %.01134, %._crit_edge33 ], [ %12, %.lr.ph37.preheader ]
  %32 = phi i8* [ %34, %._crit_edge33 ], [ %11, %.lr.ph37.preheader ]
  %33 = phi i8* [ %35, %._crit_edge33 ], [ %11, %.lr.ph37.preheader ]
  %.01134 = phi i16* [ %.0935, %._crit_edge33 ], [ %16, %.lr.ph37.preheader ]
  %34 = phi i8* [ %32, %._crit_edge33 ], [ %15, %.lr.ph37.preheader ]
  %35 = phi i8* [ %33, %._crit_edge33 ], [ %15, %.lr.ph37.preheader ]
  %36 = icmp eq i32 %.0636, %4
  %37 = tail call i32 @TIFFReadScanline(%struct.tiff* %0, i8* %8, i32 %.0636, i16 zeroext 0) #6
  %38 = icmp slt i32 %37, 1
  br i1 %38, label %._crit_edge38.loopexit, label %.preheader

.preheader:                                       ; preds = %.lr.ph37
  %39 = load i32, i32* @imagewidth, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.1425 = phi i32 [ %45, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.1824 = phi i8* [ %44, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.11423 = phi i16* [ %43, %.lr.ph ], [ %.0935, %.lr.ph.preheader ]
  %41 = load i8, i8* %.1824, align 1
  %42 = zext i8 %41 to i16
  store i16 %42, i16* %.11423, align 2
  %43 = getelementptr inbounds i16, i16* %.11423, i64 1
  %44 = getelementptr inbounds i8, i8* %.1824, i64 1
  %45 = add i32 %.1425, 1
  %46 = load i32, i32* @imagewidth, align 4
  %47 = icmp ult i32 %45, %46
  br i1 %47, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  tail call void @_TIFFmemset(i8* %18, i32 0, i32 %17) #6
  %48 = load i32, i32* @imagewidth, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %._crit_edge33, label %.lr.ph32

.lr.ph32:                                         ; preds = %._crit_edge
  br i1 %36, label %.lr.ph32.split.us.preheader, label %.lr.ph32.split.preheader

.lr.ph32.split.preheader:                         ; preds = %.lr.ph32
  br label %.lr.ph32.split

.lr.ph32.split.us.preheader:                      ; preds = %.lr.ph32
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %75
  %.0130.us = phi i32 [ %.19.us, %75 ], [ 128, %.lr.ph32.split.us.preheader ]
  %.2529.us = phi i32 [ %76, %75 ], [ 0, %.lr.ph32.split.us.preheader ]
  %.01627.us = phi i8* [ %..016.us, %75 ], [ %18, %.lr.ph32.split.us.preheader ]
  %.01826.us = phi i16* [ %51, %75 ], [ %.01134, %.lr.ph32.split.us.preheader ]
  %50 = icmp eq i32 %.2529.us, %6
  %51 = getelementptr inbounds i16, i16* %.01826.us, i64 1
  %52 = load i16, i16* %.01826.us, align 2
  %53 = icmp slt i16 %52, 0
  %54 = icmp slt i16 %52, 255
  %.20.us = select i1 %54, i16 %52, i16 255
  %55 = sext i16 %.20.us to i32
  %...us = select i1 %53, i32 0, i32 %55
  %56 = load i32, i32* @threshold, align 4
  %57 = icmp sgt i32 %...us, %56
  br i1 %57, label %58, label %64

; <label>:58:                                     ; preds = %.lr.ph32.split.us
  %59 = load i8, i8* %.01627.us, align 1
  %60 = zext i8 %59 to i32
  %61 = or i32 %60, %.0130.us
  %62 = trunc i32 %61 to i8
  store i8 %62, i8* %.01627.us, align 1
  %63 = add nsw i32 %...us, -255
  br label %64

; <label>:64:                                     ; preds = %58, %.lr.ph32.split.us
  %.2.us = phi i32 [ %63, %58 ], [ %...us, %.lr.ph32.split.us ]
  %65 = ashr i32 %.0130.us, 1
  %66 = icmp eq i32 %65, 0
  %67 = getelementptr inbounds i8, i8* %.01627.us, i64 1
  %..016.us = select i1 %66, i8* %67, i8* %.01627.us
  %.19.us = select i1 %66, i32 128, i32 %65
  br i1 %50, label %75, label %68

; <label>:68:                                     ; preds = %64
  %69 = mul nsw i32 %.2.us, 7
  %70 = sdiv i32 %69, 16
  %71 = load i16, i16* %51, align 2
  %72 = zext i16 %71 to i32
  %73 = add nsw i32 %72, %70
  %74 = trunc i32 %73 to i16
  store i16 %74, i16* %51, align 2
  br label %75

; <label>:75:                                     ; preds = %64, %68
  %76 = add i32 %.2529.us, 1
  %77 = load i32, i32* @imagewidth, align 4
  %78 = icmp ult i32 %76, %77
  br i1 %78, label %.lr.ph32.split.us, label %._crit_edge33.loopexit

.lr.ph32.split:                                   ; preds = %.lr.ph32.split.preheader, %128
  %.0130 = phi i32 [ %.19, %128 ], [ 128, %.lr.ph32.split.preheader ]
  %.2529 = phi i32 [ %129, %128 ], [ 0, %.lr.ph32.split.preheader ]
  %.21528 = phi i16* [ %117, %128 ], [ %.0935, %.lr.ph32.split.preheader ]
  %.01627 = phi i8* [ %..016, %128 ], [ %18, %.lr.ph32.split.preheader ]
  %.01826 = phi i16* [ %80, %128 ], [ %.01134, %.lr.ph32.split.preheader ]
  %79 = icmp eq i32 %.2529, %6
  %80 = getelementptr inbounds i16, i16* %.01826, i64 1
  %81 = load i16, i16* %.01826, align 2
  %82 = icmp slt i16 %81, 0
  %83 = icmp slt i16 %81, 255
  %.20 = select i1 %83, i16 %81, i16 255
  %84 = sext i16 %.20 to i32
  %.. = select i1 %82, i32 0, i32 %84
  %85 = load i32, i32* @threshold, align 4
  %86 = icmp sgt i32 %.., %85
  br i1 %86, label %87, label %93

; <label>:87:                                     ; preds = %.lr.ph32.split
  %88 = load i8, i8* %.01627, align 1
  %89 = zext i8 %88 to i32
  %90 = or i32 %89, %.0130
  %91 = trunc i32 %90 to i8
  store i8 %91, i8* %.01627, align 1
  %92 = add nsw i32 %.., -255
  br label %93

; <label>:93:                                     ; preds = %87, %.lr.ph32.split
  %.2 = phi i32 [ %92, %87 ], [ %.., %.lr.ph32.split ]
  %94 = ashr i32 %.0130, 1
  %95 = icmp eq i32 %94, 0
  %96 = getelementptr inbounds i8, i8* %.01627, i64 1
  %..016 = select i1 %95, i8* %96, i8* %.01627
  %.19 = select i1 %95, i32 128, i32 %94
  br i1 %79, label %104, label %97

; <label>:97:                                     ; preds = %93
  %98 = mul nsw i32 %.2, 7
  %99 = sdiv i32 %98, 16
  %100 = load i16, i16* %80, align 2
  %101 = zext i16 %100 to i32
  %102 = add nsw i32 %101, %99
  %103 = trunc i32 %102 to i16
  store i16 %103, i16* %80, align 2
  br label %104

; <label>:104:                                    ; preds = %93, %97
  %105 = icmp eq i32 %.2529, 0
  br i1 %105, label %114, label %106

; <label>:106:                                    ; preds = %104
  %107 = mul nsw i32 %.2, 3
  %108 = sdiv i32 %107, 16
  %109 = getelementptr inbounds i16, i16* %.21528, i64 -1
  %110 = load i16, i16* %109, align 2
  %111 = zext i16 %110 to i32
  %112 = add nsw i32 %111, %108
  %113 = trunc i32 %112 to i16
  store i16 %113, i16* %109, align 2
  br label %114

; <label>:114:                                    ; preds = %104, %106
  %115 = mul nsw i32 %.2, 5
  %116 = sdiv i32 %115, 16
  %117 = getelementptr inbounds i16, i16* %.21528, i64 1
  %118 = load i16, i16* %.21528, align 2
  %119 = zext i16 %118 to i32
  %120 = add nsw i32 %119, %116
  %121 = trunc i32 %120 to i16
  store i16 %121, i16* %.21528, align 2
  br i1 %79, label %128, label %122

; <label>:122:                                    ; preds = %114
  %123 = sdiv i32 %.2, 16
  %124 = load i16, i16* %117, align 2
  %125 = zext i16 %124 to i32
  %126 = add nsw i32 %125, %123
  %127 = trunc i32 %126 to i16
  store i16 %127, i16* %117, align 2
  br label %128

; <label>:128:                                    ; preds = %122, %114
  %129 = add i32 %.2529, 1
  %130 = load i32, i32* @imagewidth, align 4
  %131 = icmp ult i32 %129, %130
  br i1 %131, label %.lr.ph32.split, label %._crit_edge33.loopexit57

._crit_edge33.loopexit:                           ; preds = %75
  br label %._crit_edge33

._crit_edge33.loopexit57:                         ; preds = %128
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit57, %._crit_edge33.loopexit, %._crit_edge
  %132 = add i32 %.0636, -1
  %133 = tail call i32 @TIFFWriteScanline(%struct.tiff* %1, i8* %18, i32 %132, i16 zeroext 0) #6
  %134 = icmp sgt i32 %133, -1
  %135 = add i32 %.0636, 1
  %136 = load i32, i32* @imagelength, align 4
  %137 = icmp ult i32 %135, %136
  %or.cond = and i1 %134, %137
  br i1 %or.cond, label %.lr.ph37, label %._crit_edge38.loopexit

._crit_edge38.loopexit:                           ; preds = %._crit_edge33, %.lr.ph37
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %.preheader21
  %138 = phi i8* [ %15, %.preheader21 ], [ %32, %._crit_edge38.loopexit ]
  %139 = phi i8* [ %11, %.preheader21 ], [ %35, %._crit_edge38.loopexit ]
  tail call void @_TIFFfree(i8* %8) #6
  tail call void @_TIFFfree(i8* %139) #6
  tail call void @_TIFFfree(i8* %138) #6
  tail call void @_TIFFfree(i8* %18) #6
  br label %140

; <label>:140:                                    ; preds = %2, %._crit_edge38
  ret void
}

declare void @TIFFClose(%struct.tiff*) local_unnamed_addr #4

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @processG3Options(i8* readonly) unnamed_addr #0 {
  %2 = tail call i8* @strchr(i8* %0, i32 58) #7
  %3 = icmp eq i8* %2, null
  br i1 %3, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %23
  %.0 = phi i8* [ %24, %23 ], [ %2, %.preheader.preheader ]
  %4 = getelementptr inbounds i8, i8* %.0, i64 1
  %5 = tail call i32 @strncmp(i8* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i64 0, i64 0), i64 2) #7
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %.preheader
  %8 = load i32, i32* @group3options, align 4
  %9 = and i32 %8, -2
  br label %23

; <label>:10:                                     ; preds = %.preheader
  %11 = tail call i32 @strncmp(i8* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i64 0, i64 0), i64 2) #7
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = load i32, i32* @group3options, align 4
  %15 = or i32 %14, 1
  br label %23

; <label>:16:                                     ; preds = %10
  %17 = tail call i32 @strncmp(i8* %4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i64 0, i64 0), i64 4) #7
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %22

; <label>:19:                                     ; preds = %16
  %20 = load i32, i32* @group3options, align 4
  %21 = or i32 %20, 4
  br label %23

; <label>:22:                                     ; preds = %16
  tail call fastcc void @usage()
  unreachable

; <label>:23:                                     ; preds = %7, %19, %13
  %.sink = phi i32 [ %9, %7 ], [ %21, %19 ], [ %15, %13 ]
  store i32 %.sink, i32* @group3options, align 4
  %24 = tail call i8* @strchr(i8* %4, i32 58) #7
  %25 = icmp eq i8* %24, null
  br i1 %25, label %.loopexit.loopexit, label %.preheader

.loopexit.loopexit:                               ; preds = %23
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  ret void
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) local_unnamed_addr #3

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #4

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #4

declare i32 @TIFFReadScanline(%struct.tiff*, i8*, i32, i16 zeroext) local_unnamed_addr #4

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #4

declare i32 @TIFFWriteScanline(%struct.tiff*, i8*, i32, i16 zeroext) local_unnamed_addr #4

declare void @_TIFFfree(i8*) local_unnamed_addr #4

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE* nocapture, i8*) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
