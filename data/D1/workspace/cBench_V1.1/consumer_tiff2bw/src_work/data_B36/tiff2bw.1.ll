; ModuleID = 'tiff2bw.ll'
source_filename = "tiff2bw.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.cpTag = type { i16, i16, i32 }
%struct.tiff = type opaque

@RED = local_unnamed_addr global i32 71, align 4
@GREEN = local_unnamed_addr global i32 150, align 4
@BLUE = local_unnamed_addr global i32 28, align 4
@.str = private unnamed_addr constant [11 x i8] c"c:r:R:G:B:\00", align 1
@optarg = external local_unnamed_addr global i8*, align 8
@optind = external local_unnamed_addr global i32, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [62 x i8] c"%s: Bad photometric; can only handle RGB and Palette images.\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"%s: Bad samples/pixel %u.\0A\00", align 1
@.str.4 = private unnamed_addr constant [40 x i8] c" %s: Sorry, only handle 8-bit samples.\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@compression = internal unnamed_addr global i16 -1, align 2
@quality = internal unnamed_addr global i32 75, align 4
@jpegcolormode = internal unnamed_addr global i1 false, align 4
@predictor = internal unnamed_addr global i16 0, align 2
@.str.6 = private unnamed_addr constant [18 x i8] c"B&W version of %s\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"tiff2bw\00", align 1
@.str.8 = private unnamed_addr constant [46 x i8] c"usage: tiff2bw [options] input.tif output.tif\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"where options are:\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c" -R %\09\09use #% from red channel\00", align 1
@.str.11 = private unnamed_addr constant [33 x i8] c" -G %\09\09use #% from green channel\00", align 1
@.str.12 = private unnamed_addr constant [32 x i8] c" -B %\09\09use #% from blue channel\00", align 1
@.str.13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.14 = private unnamed_addr constant [48 x i8] c" -r #\09\09make each strip have no more than # rows\00", align 1
@.str.15 = private unnamed_addr constant [64 x i8] c" -c lzw[:opts]\09compress output with Lempel-Ziv & Welch encoding\00", align 1
@.str.16 = private unnamed_addr constant [70 x i8] c"               (no longer supported due to Unisys patent enforcement)\00", align 1
@.str.17 = private unnamed_addr constant [53 x i8] c" -c zip[:opts]\09compress output with deflate encoding\00", align 1
@.str.18 = private unnamed_addr constant [52 x i8] c" -c packbits\09compress output with packbits encoding\00", align 1
@.str.19 = private unnamed_addr constant [58 x i8] c" -c g3[:opts]\09compress output with CCITT Group 3 encoding\00", align 1
@.str.20 = private unnamed_addr constant [52 x i8] c" -c g4\09\09compress output with CCITT Group 4 encoding\00", align 1
@.str.21 = private unnamed_addr constant [48 x i8] c" -c none\09use no compression algorithm on output\00", align 1
@.str.22 = private unnamed_addr constant [25 x i8] c"LZW and deflate options:\00", align 1
@.str.23 = private unnamed_addr constant [24 x i8] c" #\09\09set predictor value\00", align 1
@.str.24 = private unnamed_addr constant [75 x i8] c"For example, -c lzw:2 to get LZW-encoded data with horizontal differencing\00", align 1
@stuff = local_unnamed_addr global [20 x i8*] [i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.24, i32 0, i32 0), i8* null], align 16
@.str.25 = private unnamed_addr constant [24 x i8] c"Assuming 8-bit colormap\00", align 1
@.str.26 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.27 = private unnamed_addr constant [9 x i8] c"packbits\00", align 1
@.str.28 = private unnamed_addr constant [5 x i8] c"jpeg\00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.30 = private unnamed_addr constant [4 x i8] c"zip\00", align 1
@tags = internal global [16 x %struct.cpTag] [%struct.cpTag { i16 256, i16 1, i32 4 }, %struct.cpTag { i16 257, i16 1, i32 4 }, %struct.cpTag { i16 266, i16 1, i32 3 }, %struct.cpTag { i16 269, i16 1, i32 2 }, %struct.cpTag { i16 271, i16 1, i32 2 }, %struct.cpTag { i16 272, i16 1, i32 2 }, %struct.cpTag { i16 274, i16 1, i32 3 }, %struct.cpTag { i16 282, i16 1, i32 5 }, %struct.cpTag { i16 283, i16 1, i32 5 }, %struct.cpTag { i16 285, i16 1, i32 2 }, %struct.cpTag { i16 286, i16 1, i32 5 }, %struct.cpTag { i16 287, i16 1, i32 5 }, %struct.cpTag { i16 296, i16 1, i32 3 }, %struct.cpTag { i16 297, i16 2, i32 3 }, %struct.cpTag { i16 315, i16 1, i32 2 }, %struct.cpTag { i16 316, i16 1, i32 2 }], align 16
@.str.31 = private unnamed_addr constant [16 x i8] c"Unexpected tag\0A\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca [1024 x i8], align 16
  br label %.outer

.outer:                                           ; preds = %19, %2
  %.02.ph = phi i32 [ %21, %19 ], [ -1, %2 ]
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.outer
  %13 = tail call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0)) #8
  switch i32 %13, label %.backedge.backedge [
    i32 -1, label %38
    i32 99, label %14
    i32 114, label %19
    i32 82, label %22
    i32 71, label %27
    i32 66, label %32
    i32 63, label %37
  ]

; <label>:14:                                     ; preds = %.backedge
  %15 = load i8*, i8** @optarg, align 8
  %16 = tail call fastcc i32 @processCompressOptions(i8* %15)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %.backedge.backedge

.backedge.backedge:                               ; preds = %14, %.backedge, %32, %27, %22
  br label %.backedge

; <label>:18:                                     ; preds = %14
  tail call fastcc void @usage()
  unreachable

; <label>:19:                                     ; preds = %.backedge
  %20 = load i8*, i8** @optarg, align 8
  %21 = tail call i32 @atoi(i8* %20) #9
  br label %.outer

; <label>:22:                                     ; preds = %.backedge
  %23 = load i8*, i8** @optarg, align 8
  %24 = tail call i32 @atoi(i8* %23) #9
  %25 = mul nsw i32 %24, 255
  %26 = sdiv i32 %25, 100
  store i32 %26, i32* @RED, align 4
  br label %.backedge.backedge

; <label>:27:                                     ; preds = %.backedge
  %28 = load i8*, i8** @optarg, align 8
  %29 = tail call i32 @atoi(i8* %28) #9
  %30 = mul nsw i32 %29, 255
  %31 = sdiv i32 %30, 100
  store i32 %31, i32* @GREEN, align 4
  br label %.backedge.backedge

; <label>:32:                                     ; preds = %.backedge
  %33 = load i8*, i8** @optarg, align 8
  %34 = tail call i32 @atoi(i8* %33) #9
  %35 = mul nsw i32 %34, 255
  %36 = sdiv i32 %35, 100
  store i32 %36, i32* @BLUE, align 4
  br label %.backedge.backedge

; <label>:37:                                     ; preds = %.backedge
  tail call fastcc void @usage()
  unreachable

; <label>:38:                                     ; preds = %.backedge
  %39 = load i32, i32* @optind, align 4
  %40 = sub nsw i32 %0, %39
  %41 = icmp slt i32 %40, 2
  br i1 %41, label %42, label %43

; <label>:42:                                     ; preds = %38
  tail call fastcc void @usage()
  unreachable

; <label>:43:                                     ; preds = %38
  %44 = sext i32 %39 to i64
  %45 = getelementptr inbounds i8*, i8** %1, i64 %44
  %46 = load i8*, i8** %45, align 8
  %47 = tail call %struct.tiff* @TIFFOpen(i8* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)) #8
  %48 = icmp eq %struct.tiff* %47, null
  br i1 %48, label %.loopexit14, label %49

; <label>:49:                                     ; preds = %43
  store i16 0, i16* %8, align 2
  %50 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %47, i32 262, i16* nonnull %8) #8
  %51 = load i16, i16* %8, align 2
  %52 = and i16 %51, -2
  %switch = icmp eq i16 %52, 2
  br i1 %switch, label %60, label %53

; <label>:53:                                     ; preds = %49
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = load i32, i32* @optind, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8*, i8** %1, i64 %56
  %58 = load i8*, i8** %57, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.2, i64 0, i64 0), i8* %58) #10
  br label %.loopexit14

; <label>:60:                                     ; preds = %49
  %61 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %47, i32 277, i16* nonnull %5) #8
  %62 = load i16, i16* %5, align 2
  switch i16 %62, label %63 [
    i16 3, label %71
    i16 1, label %71
  ]

; <label>:63:                                     ; preds = %60
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = load i32, i32* @optind, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8*, i8** %1, i64 %66
  %68 = load i8*, i8** %67, align 8
  %69 = zext i16 %62 to i32
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i8* %68, i32 %69) #10
  br label %.loopexit14

; <label>:71:                                     ; preds = %60, %60
  %72 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %47, i32 258, i16* nonnull %6) #8
  %73 = load i16, i16* %6, align 2
  %74 = icmp eq i16 %73, 8
  br i1 %74, label %82, label %75

; <label>:75:                                     ; preds = %71
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %77 = load i32, i32* @optind, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i8*, i8** %1, i64 %78
  %80 = load i8*, i8** %79, align 8
  %81 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.4, i64 0, i64 0), i8* %80) #10
  br label %.loopexit14

; <label>:82:                                     ; preds = %71
  %83 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %47, i32 256, i32* nonnull %3) #8
  %84 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %47, i32 257, i32* nonnull %4) #8
  %85 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %47, i32 284, i16* nonnull %7) #8
  %86 = load i32, i32* @optind, align 4
  %87 = add nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8*, i8** %1, i64 %88
  %90 = load i8*, i8** %89, align 8
  %91 = call %struct.tiff* @TIFFOpen(i8* %90, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0)) #8
  %92 = icmp eq %struct.tiff* %91, null
  br i1 %92, label %.loopexit14, label %93

; <label>:93:                                     ; preds = %82
  call fastcc void @cpTags(%struct.tiff* nonnull %47, %struct.tiff* nonnull %91)
  %94 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 258, i32 8) #8
  %95 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 277, i32 1) #8
  %96 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 284, i32 1) #8
  %97 = load i16, i16* @compression, align 2
  %98 = icmp eq i16 %97, -1
  br i1 %98, label %114, label %99

; <label>:99:                                     ; preds = %93
  %100 = zext i16 %97 to i32
  %101 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 259, i32 %100) #8
  %102 = load i16, i16* @compression, align 2
  switch i16 %102, label %114 [
    i16 7, label %103
    i16 5, label %108
    i16 -32590, label %108
  ]

; <label>:103:                                    ; preds = %99
  %104 = load i32, i32* @quality, align 4
  %105 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 65537, i32 %104) #8
  %.b = load i1, i1* @jpegcolormode, align 4
  %not..b = xor i1 %.b, true
  %106 = zext i1 %not..b to i32
  %107 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 65538, i32 %106) #8
  br label %114

; <label>:108:                                    ; preds = %99, %99
  %109 = load i16, i16* @predictor, align 2
  %110 = icmp eq i16 %109, 0
  br i1 %110, label %114, label %111

; <label>:111:                                    ; preds = %108
  %112 = zext i16 %109 to i32
  %113 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 317, i32 %112) #8
  br label %114

; <label>:114:                                    ; preds = %99, %103, %108, %111, %93
  %115 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 262, i32 1) #8
  %116 = getelementptr inbounds [1024 x i8], [1024 x i8]* %12, i64 0, i64 0
  %117 = load i32, i32* @optind, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8*, i8** %1, i64 %118
  %120 = load i8*, i8** %119, align 8
  %121 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %116, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i64 0, i64 0), i8* %120) #8
  %122 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 270, i8* nonnull %116) #8
  %123 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 305, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0)) #8
  %124 = call i32 @TIFFScanlineSize(%struct.tiff* nonnull %91) #8
  %125 = call i8* @_TIFFmalloc(i32 %124) #8
  %126 = call i32 @TIFFDefaultStripSize(%struct.tiff* nonnull %91, i32 %.02.ph) #8
  %127 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %91, i32 278, i32 %126) #8
  %128 = load i16, i16* %8, align 2
  %129 = zext i16 %128 to i32
  %130 = shl nuw nsw i32 %129, 8
  %131 = load i16, i16* %7, align 2
  %132 = zext i16 %131 to i32
  %133 = or i32 %130, %132
  %trunc = trunc i32 %133 to i24
  switch i24 %trunc, label %.loopexit [
    i24 769, label %134
    i24 770, label %134
    i24 513, label %176
    i24 514, label %190
  ]

; <label>:134:                                    ; preds = %114, %114
  %135 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %47, i32 320, i16** nonnull %9, i16** nonnull %10, i16** nonnull %11) #8
  %136 = load i16, i16* %6, align 2
  %137 = zext i16 %136 to i32
  %138 = shl i32 1, %137
  %139 = load i16*, i16** %9, align 8
  %140 = load i16*, i16** %10, align 8
  %141 = load i16*, i16** %11, align 8
  %142 = call fastcc i32 @checkcmap(%struct.tiff* nonnull %47, i32 %138, i16* %139, i16* %140, i16* %141)
  %143 = icmp eq i32 %142, 16
  br i1 %143, label %144, label %.loopexit12

; <label>:144:                                    ; preds = %134
  %145 = load i16, i16* %6, align 2
  %146 = icmp eq i16 %145, 31
  br i1 %146, label %.loopexit12, label %.lr.ph23.preheader

.lr.ph23.preheader:                               ; preds = %144
  %147 = zext i16 %145 to i32
  %148 = shl i32 1, %147
  %149 = sext i32 %148 to i64
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23.preheader, %.lr.ph23
  %indvars.iv = phi i64 [ %149, %.lr.ph23.preheader ], [ %indvars.iv.next, %.lr.ph23 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %150 = load i16*, i16** %9, align 8
  %151 = getelementptr inbounds i16, i16* %150, i64 %indvars.iv.next
  %152 = load i16, i16* %151, align 2
  %div = udiv i16 %152, 257
  store i16 %div, i16* %151, align 2
  %153 = load i16*, i16** %10, align 8
  %154 = getelementptr inbounds i16, i16* %153, i64 %indvars.iv.next
  %155 = load i16, i16* %154, align 2
  %div6 = udiv i16 %155, 257
  store i16 %div6, i16* %154, align 2
  %156 = load i16*, i16** %11, align 8
  %157 = getelementptr inbounds i16, i16* %156, i64 %indvars.iv.next
  %158 = load i16, i16* %157, align 2
  %div7 = udiv i16 %158, 257
  store i16 %div7, i16* %157, align 2
  %159 = icmp sgt i64 %indvars.iv, 1
  br i1 %159, label %.lr.ph23, label %.loopexit12.loopexit

.loopexit12.loopexit:                             ; preds = %.lr.ph23
  br label %.loopexit12

.loopexit12:                                      ; preds = %.loopexit12.loopexit, %144, %134
  %160 = call i32 @TIFFScanlineSize(%struct.tiff* nonnull %47) #8
  %161 = call i8* @_TIFFmalloc(i32 %160) #8
  %162 = load i32, i32* %4, align 4
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.loopexit12
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %166
  %.0418 = phi i32 [ %173, %166 ], [ 0, %.lr.ph.preheader ]
  %164 = call i32 @TIFFReadScanline(%struct.tiff* nonnull %47, i8* %161, i32 %.0418, i16 zeroext 0) #8
  %165 = icmp slt i32 %164, 0
  br i1 %165, label %.loopexit.loopexit, label %166

; <label>:166:                                    ; preds = %.lr.ph
  %167 = load i32, i32* %3, align 4
  %168 = load i16*, i16** %9, align 8
  %169 = load i16*, i16** %10, align 8
  %170 = load i16*, i16** %11, align 8
  call fastcc void @compresspalette(i8* %125, i8* %161, i32 %167, i16* %168, i16* %169, i16* %170)
  %171 = call i32 @TIFFWriteScanline(%struct.tiff* nonnull %91, i8* %125, i32 %.0418, i16 zeroext 0) #8
  %172 = icmp sgt i32 %171, -1
  %173 = add i32 %.0418, 1
  %174 = load i32, i32* %4, align 4
  %175 = icmp ult i32 %173, %174
  %or.cond = and i1 %172, %175
  br i1 %or.cond, label %.lr.ph, label %.loopexit.loopexit

; <label>:176:                                    ; preds = %114
  %177 = call i32 @TIFFScanlineSize(%struct.tiff* nonnull %47) #8
  %178 = call i8* @_TIFFmalloc(i32 %177) #8
  %179 = load i32, i32* %4, align 4
  %180 = icmp eq i32 %179, 0
  br i1 %180, label %.loopexit, label %.lr.ph25.preheader

.lr.ph25.preheader:                               ; preds = %176
  br label %.lr.ph25

.lr.ph25:                                         ; preds = %.lr.ph25.preheader, %183
  %.1524 = phi i32 [ %187, %183 ], [ 0, %.lr.ph25.preheader ]
  %181 = call i32 @TIFFReadScanline(%struct.tiff* nonnull %47, i8* %178, i32 %.1524, i16 zeroext 0) #8
  %182 = icmp slt i32 %181, 0
  br i1 %182, label %.loopexit.loopexit52, label %183

; <label>:183:                                    ; preds = %.lr.ph25
  %184 = load i32, i32* %3, align 4
  call fastcc void @compresscontig(i8* %125, i8* %178, i32 %184)
  %185 = call i32 @TIFFWriteScanline(%struct.tiff* nonnull %91, i8* %125, i32 %.1524, i16 zeroext 0) #8
  %186 = icmp sgt i32 %185, -1
  %187 = add i32 %.1524, 1
  %188 = load i32, i32* %4, align 4
  %189 = icmp ult i32 %187, %188
  %or.cond45 = and i1 %186, %189
  br i1 %or.cond45, label %.lr.ph25, label %.loopexit.loopexit52

; <label>:190:                                    ; preds = %114
  %191 = call i32 @TIFFScanlineSize(%struct.tiff* nonnull %47) #8
  %192 = mul nsw i32 %191, 3
  %193 = call i8* @_TIFFmalloc(i32 %192) #8
  %194 = load i32, i32* %4, align 4
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %.loopexit, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %190
  %196 = sext i32 %191 to i64
  %197 = getelementptr inbounds i8, i8* %193, i64 %196
  %198 = shl nsw i32 %191, 1
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i8, i8* %193, i64 %199
  %201 = sext i32 %191 to i64
  %202 = getelementptr inbounds i8, i8* %193, i64 %201
  %203 = shl nsw i64 %201, 1
  %204 = getelementptr inbounds i8, i8* %193, i64 %203
  br label %208

; <label>:205:                                    ; preds = %208
  %206 = call i32 @TIFFReadScanline(%struct.tiff* nonnull %47, i8* %202, i32 %.229, i16 zeroext 1) #8
  %207 = icmp slt i32 %206, 0
  br i1 %207, label %.loopexit14.loopexit, label %211

; <label>:208:                                    ; preds = %214, %.preheader.lr.ph
  %.229 = phi i32 [ 0, %.preheader.lr.ph ], [ %218, %214 ]
  %209 = call i32 @TIFFReadScanline(%struct.tiff* nonnull %47, i8* %193, i32 %.229, i16 zeroext 0) #8
  %210 = icmp slt i32 %209, 0
  br i1 %210, label %.loopexit14.loopexit, label %205

.loopexit.loopexit:                               ; preds = %166, %.lr.ph
  br label %.loopexit

.loopexit.loopexit52:                             ; preds = %183, %.lr.ph25
  br label %.loopexit

.loopexit.loopexit53:                             ; preds = %214
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit53, %.loopexit.loopexit52, %.loopexit.loopexit, %.loopexit12, %176, %190, %114
  call void @TIFFClose(%struct.tiff* nonnull %47) #8
  call void @TIFFClose(%struct.tiff* nonnull %91) #8
  br label %.loopexit14

.loopexit14.loopexit:                             ; preds = %211, %205, %208
  br label %.loopexit14

.loopexit14:                                      ; preds = %.loopexit14.loopexit, %82, %43, %.loopexit, %75, %63, %53
  %.0 = phi i32 [ -1, %53 ], [ -1, %63 ], [ -1, %75 ], [ 0, %.loopexit ], [ -1, %43 ], [ -1, %82 ], [ -1, %.loopexit14.loopexit ]
  ret i32 %.0

; <label>:211:                                    ; preds = %205
  %212 = call i32 @TIFFReadScanline(%struct.tiff* nonnull %47, i8* %204, i32 %.229, i16 zeroext 2) #8
  %213 = icmp slt i32 %212, 0
  br i1 %213, label %.loopexit14.loopexit, label %214

; <label>:214:                                    ; preds = %211
  %215 = load i32, i32* %3, align 4
  call fastcc void @compresssep(i8* %125, i8* %193, i8* %197, i8* %200, i32 %215)
  %216 = call i32 @TIFFWriteScanline(%struct.tiff* nonnull %91, i8* %125, i32 %.229, i16 zeroext 0) #8
  %217 = icmp sgt i32 %216, -1
  %218 = add i32 %.229, 1
  %219 = load i32, i32* %4, align 4
  %220 = icmp ult i32 %218, %219
  %or.cond47 = and i1 %217, %220
  br i1 %or.cond47, label %208, label %.loopexit.loopexit53
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @processCompressOptions(i8*) unnamed_addr #0 {
  %2 = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.26, i64 0, i64 0)) #9
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %.sink.split, label %4

; <label>:4:                                      ; preds = %1
  %5 = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.27, i64 0, i64 0)) #9
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %.sink.split, label %7

; <label>:7:                                      ; preds = %4
  %8 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i64 0, i64 0), i64 4) #9
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %28

; <label>:10:                                     ; preds = %7
  %11 = tail call i8* @strchr(i8* %0, i32 58) #9
  %cond = icmp eq i8* %11, null
  br i1 %cond, label %.sink.split, label %12

; <label>:12:                                     ; preds = %10
  %13 = tail call i16** @__ctype_b_loc() #11
  %14 = load i16*, i16** %13, align 8
  %15 = getelementptr inbounds i8, i8* %11, i64 1
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i64
  %18 = getelementptr inbounds i16, i16* %14, i64 %17
  %19 = load i16, i16* %18, align 2
  %20 = and i16 %19, 2048
  %21 = icmp eq i16 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %12
  %23 = tail call i32 @atoi(i8* %15) #9
  store i32 %23, i32* @quality, align 4
  br label %24

; <label>:24:                                     ; preds = %22, %12
  %25 = tail call i8* @strchr(i8* nonnull %11, i32 114) #9
  %26 = icmp eq i8* %25, null
  br i1 %26, label %.sink.split, label %27

; <label>:27:                                     ; preds = %24
  store i1 true, i1* @jpegcolormode, align 4
  br label %.sink.split

; <label>:28:                                     ; preds = %7
  %29 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.29, i64 0, i64 0), i64 3) #9
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %38

; <label>:31:                                     ; preds = %28
  %32 = tail call i8* @strchr(i8* %0, i32 58) #9
  %33 = icmp eq i8* %32, null
  br i1 %33, label %.sink.split, label %34

; <label>:34:                                     ; preds = %31
  %35 = getelementptr inbounds i8, i8* %32, i64 1
  %36 = tail call i32 @atoi(i8* %35) #9
  %37 = trunc i32 %36 to i16
  store i16 %37, i16* @predictor, align 2
  br label %.sink.split

; <label>:38:                                     ; preds = %28
  %39 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i64 0, i64 0), i64 3) #9
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %48

; <label>:41:                                     ; preds = %38
  %42 = tail call i8* @strchr(i8* %0, i32 58) #9
  %43 = icmp eq i8* %42, null
  br i1 %43, label %.sink.split, label %44

; <label>:44:                                     ; preds = %41
  %45 = getelementptr inbounds i8, i8* %42, i64 1
  %46 = tail call i32 @atoi(i8* %45) #9
  %47 = trunc i32 %46 to i16
  store i16 %47, i16* @predictor, align 2
  br label %.sink.split

.sink.split:                                      ; preds = %1, %44, %41, %34, %31, %27, %24, %10, %4
  %.sink = phi i16 [ -32763, %4 ], [ 7, %10 ], [ 7, %24 ], [ 7, %27 ], [ 5, %31 ], [ 5, %34 ], [ -32590, %41 ], [ -32590, %44 ], [ 1, %1 ]
  store i16 %.sink, i16* @compression, align 2
  br label %48

; <label>:48:                                     ; preds = %.sink.split, %38
  %.0 = phi i32 [ 0, %38 ], [ 1, %.sink.split ]
  ret i32 %.0
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @usage() unnamed_addr #2 {
  %1 = alloca [8192 x i8], align 16
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = getelementptr inbounds [8192 x i8], [8192 x i8]* %1, i64 0, i64 0
  call void @setbuf(%struct._IO_FILE* %2, i8* nonnull %3) #8
  %4 = load i8*, i8** getelementptr inbounds ([20 x i8*], [20 x i8*]* @stuff, i64 0, i64 0), align 16
  %5 = icmp eq i8* %4, null
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %6 = phi i8* [ %10, %.lr.ph ], [ %4, %.lr.ph.preheader ]
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i64 0, i64 0), i8* nonnull %6) #10
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [20 x i8*], [20 x i8*]* @stuff, i64 0, i64 %indvars.iv.next
  %10 = load i8*, i8** %9, align 8
  %11 = icmp eq i8* %10, null
  br i1 %11, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  call void @exit(i32 1) #12
  unreachable
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #3

declare %struct.tiff* @TIFFOpen(i8*, i8*) local_unnamed_addr #4

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @cpTags(%struct.tiff*, %struct.tiff*) unnamed_addr #0 {
  br label %3

; <label>:3:                                      ; preds = %2, %3
  %.01 = phi %struct.cpTag* [ getelementptr inbounds ([16 x %struct.cpTag], [16 x %struct.cpTag]* @tags, i64 0, i64 0), %2 ], [ %10, %3 ]
  %4 = getelementptr inbounds %struct.cpTag, %struct.cpTag* %.01, i64 0, i32 0
  %5 = load i16, i16* %4, align 4
  %6 = getelementptr inbounds %struct.cpTag, %struct.cpTag* %.01, i64 0, i32 1
  %7 = load i16, i16* %6, align 2
  %8 = getelementptr inbounds %struct.cpTag, %struct.cpTag* %.01, i64 0, i32 2
  %9 = load i32, i32* %8, align 4
  tail call fastcc void @cpTag(%struct.tiff* %0, %struct.tiff* %1, i16 zeroext %5, i16 zeroext %7, i32 %9)
  %10 = getelementptr inbounds %struct.cpTag, %struct.cpTag* %.01, i64 1
  %11 = icmp ult %struct.cpTag* %10, getelementptr inbounds ([16 x %struct.cpTag], [16 x %struct.cpTag]* @tags, i64 1, i64 0)
  br i1 %11, label %3, label %12

; <label>:12:                                     ; preds = %3
  ret void
}

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #4

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #4

declare i32 @TIFFDefaultStripSize(%struct.tiff*, i32) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @checkcmap(%struct.tiff*, i32, i16* nocapture readonly, i16* nocapture readonly, i16* nocapture readonly) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %5
  br label %.lr.ph

; <label>:7:                                      ; preds = %18
  %8 = getelementptr inbounds i16, i16* %.017, i64 1
  %9 = getelementptr inbounds i16, i16* %.045, i64 1
  %10 = icmp sgt i32 %.in, 1
  br i1 %10, label %.lr.ph, label %._crit_edge.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %7
  %.in = phi i32 [ %11, %7 ], [ %1, %.lr.ph.preheader ]
  %.017 = phi i16* [ %8, %7 ], [ %4, %.lr.ph.preheader ]
  %.036 = phi i16* [ %12, %7 ], [ %2, %.lr.ph.preheader ]
  %.045 = phi i16* [ %9, %7 ], [ %3, %.lr.ph.preheader ]
  %11 = add nsw i32 %.in, -1
  %12 = getelementptr inbounds i16, i16* %.036, i64 1
  %13 = load i16, i16* %.036, align 2
  %14 = icmp ugt i16 %13, 255
  br i1 %14, label %.loopexit.loopexit, label %15

; <label>:15:                                     ; preds = %.lr.ph
  %16 = load i16, i16* %.045, align 2
  %17 = icmp ugt i16 %16, 255
  br i1 %17, label %.loopexit.loopexit, label %18

; <label>:18:                                     ; preds = %15
  %19 = load i16, i16* %.017, align 2
  %20 = icmp ugt i16 %19, 255
  br i1 %20, label %.loopexit.loopexit, label %7

._crit_edge.loopexit:                             ; preds = %7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  %21 = tail call i8* @TIFFFileName(%struct.tiff* %0) #8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %21, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.25, i64 0, i64 0)) #8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %18, %15, %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ 8, %._crit_edge ], [ 16, %.loopexit.loopexit ]
  ret i32 %.0
}

declare i32 @TIFFReadScanline(%struct.tiff*, i8*, i32, i16 zeroext) local_unnamed_addr #4

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @compresspalette(i8* nocapture, i8* nocapture readonly, i32, i16* nocapture readonly, i16* nocapture readonly, i16* nocapture readonly) unnamed_addr #5 {
  %7 = load i32, i32* @RED, align 4
  %8 = load i32, i32* @GREEN, align 4
  %9 = load i32, i32* @BLUE, align 4
  %10 = icmp eq i32 %2, 0
  br i1 %10, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi i8* [ %31, %.lr.ph ], [ %0, %.lr.ph.preheader ]
  %.014 = phi i8* [ %12, %.lr.ph ], [ %1, %.lr.ph.preheader ]
  %.023 = phi i32 [ %11, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %11 = add i32 %.023, -1
  %12 = getelementptr inbounds i8, i8* %.014, i64 1
  %13 = load i8, i8* %.014, align 1
  %14 = zext i8 %13 to i64
  %15 = getelementptr inbounds i16, i16* %3, i64 %14
  %16 = load i16, i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = mul nsw i32 %17, %7
  %19 = getelementptr inbounds i16, i16* %4, i64 %14
  %20 = load i16, i16* %19, align 2
  %21 = zext i16 %20 to i32
  %22 = mul nsw i32 %21, %8
  %23 = add nsw i32 %22, %18
  %24 = getelementptr inbounds i16, i16* %5, i64 %14
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = mul nsw i32 %26, %9
  %28 = add nsw i32 %23, %27
  %29 = lshr i32 %28, 8
  %30 = trunc i32 %29 to i8
  %31 = getelementptr inbounds i8, i8* %.05, i64 1
  store i8 %30, i8* %.05, align 1
  %32 = icmp eq i32 %11, 0
  br i1 %32, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

declare i32 @TIFFWriteScanline(%struct.tiff*, i8*, i32, i16 zeroext) local_unnamed_addr #4

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @compresscontig(i8* nocapture, i8* nocapture readonly, i32) unnamed_addr #5 {
  %4 = load i32, i32* @RED, align 4
  %5 = load i32, i32* @GREEN, align 4
  %6 = load i32, i32* @BLUE, align 4
  %7 = icmp eq i32 %2, 0
  br i1 %7, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi i8* [ %25, %.lr.ph ], [ %0, %.lr.ph.preheader ]
  %.014 = phi i8* [ %18, %.lr.ph ], [ %1, %.lr.ph.preheader ]
  %.023 = phi i32 [ %8, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %8 = add i32 %.023, -1
  %9 = getelementptr inbounds i8, i8* %.014, i64 1
  %10 = load i8, i8* %.014, align 1
  %11 = zext i8 %10 to i32
  %12 = mul nsw i32 %11, %4
  %13 = getelementptr inbounds i8, i8* %.014, i64 2
  %14 = load i8, i8* %9, align 1
  %15 = zext i8 %14 to i32
  %16 = mul nsw i32 %15, %5
  %17 = add nsw i32 %16, %12
  %18 = getelementptr inbounds i8, i8* %.014, i64 3
  %19 = load i8, i8* %13, align 1
  %20 = zext i8 %19 to i32
  %21 = mul nsw i32 %20, %6
  %22 = add nsw i32 %17, %21
  %23 = lshr i32 %22, 8
  %24 = trunc i32 %23 to i8
  %25 = getelementptr inbounds i8, i8* %.05, i64 1
  store i8 %24, i8* %.05, align 1
  %26 = icmp eq i32 %8, 0
  br i1 %26, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @compresssep(i8* nocapture, i8* nocapture readonly, i8* nocapture readonly, i8* nocapture readonly, i32) unnamed_addr #5 {
  %6 = load i32, i32* @RED, align 4
  %7 = load i32, i32* @GREEN, align 4
  %8 = load i32, i32* @BLUE, align 4
  %9 = icmp eq i32 %4, 0
  br i1 %9, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %5
  %10 = add i32 %4, -1
  %11 = zext i32 %10 to i64
  %12 = add nuw nsw i64 %11, 1
  %min.iters.check = icmp ult i64 %12, 16
  br i1 %min.iters.check, label %.lr.ph.preheader39, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader
  %n.vec = and i64 %12, 8589934576
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph.preheader39, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %13 = add i32 %4, -1
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  %scevgep = getelementptr i8, i8* %0, i64 %15
  %scevgep10 = getelementptr i8, i8* %1, i64 %15
  %scevgep11 = getelementptr i8, i8* %2, i64 %15
  %scevgep12 = getelementptr i8, i8* %3, i64 %15
  %bound0 = icmp ugt i8* %scevgep10, %0
  %bound1 = icmp ugt i8* %scevgep, %1
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ugt i8* %scevgep11, %0
  %bound114 = icmp ugt i8* %scevgep, %2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ugt i8* %scevgep12, %0
  %bound117 = icmp ugt i8* %scevgep, %3
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %ind.end = getelementptr i8, i8* %0, i64 %n.vec
  %ind.end21 = getelementptr i8, i8* %1, i64 %n.vec
  %ind.end23 = getelementptr i8, i8* %2, i64 %n.vec
  %ind.end25 = getelementptr i8, i8* %3, i64 %n.vec
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end27 = sub i32 %4, %cast.crd
  br i1 %conflict.rdx19, label %.lr.ph.preheader39, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert31 = insertelement <16 x i32> undef, i32 %6, i32 0
  %broadcast.splat32 = shufflevector <16 x i32> %broadcast.splatinsert31, <16 x i32> undef, <16 x i32> zeroinitializer
  %broadcast.splatinsert34 = insertelement <16 x i32> undef, i32 %7, i32 0
  %broadcast.splat35 = shufflevector <16 x i32> %broadcast.splatinsert34, <16 x i32> undef, <16 x i32> zeroinitializer
  %broadcast.splatinsert37 = insertelement <16 x i32> undef, i32 %8, i32 0
  %broadcast.splat38 = shufflevector <16 x i32> %broadcast.splatinsert37, <16 x i32> undef, <16 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8, i8* %0, i64 %index
  %next.gep28 = getelementptr i8, i8* %1, i64 %index
  %next.gep29 = getelementptr i8, i8* %2, i64 %index
  %next.gep30 = getelementptr i8, i8* %3, i64 %index
  %16 = bitcast i8* %next.gep28 to <16 x i8>*
  %wide.load = load <16 x i8>, <16 x i8>* %16, align 1, !alias.scope !1
  %17 = zext <16 x i8> %wide.load to <16 x i32>
  %18 = mul <16 x i32> %17, %broadcast.splat32
  %19 = bitcast i8* %next.gep29 to <16 x i8>*
  %wide.load33 = load <16 x i8>, <16 x i8>* %19, align 1, !alias.scope !4
  %20 = zext <16 x i8> %wide.load33 to <16 x i32>
  %21 = mul <16 x i32> %20, %broadcast.splat35
  %22 = add <16 x i32> %21, %18
  %23 = bitcast i8* %next.gep30 to <16 x i8>*
  %wide.load36 = load <16 x i8>, <16 x i8>* %23, align 1, !alias.scope !6
  %24 = zext <16 x i8> %wide.load36 to <16 x i32>
  %25 = mul <16 x i32> %24, %broadcast.splat38
  %26 = add <16 x i32> %22, %25
  %27 = lshr <16 x i32> %26, <i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8>
  %28 = trunc <16 x i32> %27 to <16 x i8>
  %29 = bitcast i8* %next.gep to <16 x i8>*
  store <16 x i8> %28, <16 x i8>* %29, align 1, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 16
  %30 = icmp eq i64 %index.next, %n.vec
  br i1 %30, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %12, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader39

.lr.ph.preheader39:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph.preheader
  %.09.ph = phi i8* [ %0, %vector.memcheck ], [ %0, %min.iters.checked ], [ %0, %.lr.ph.preheader ], [ %ind.end, %middle.block ]
  %.018.ph = phi i8* [ %1, %vector.memcheck ], [ %1, %min.iters.checked ], [ %1, %.lr.ph.preheader ], [ %ind.end21, %middle.block ]
  %.027.ph = phi i8* [ %2, %vector.memcheck ], [ %2, %min.iters.checked ], [ %2, %.lr.ph.preheader ], [ %ind.end23, %middle.block ]
  %.036.ph = phi i8* [ %3, %vector.memcheck ], [ %3, %min.iters.checked ], [ %3, %.lr.ph.preheader ], [ %ind.end25, %middle.block ]
  %.045.ph = phi i32 [ %4, %vector.memcheck ], [ %4, %min.iters.checked ], [ %4, %.lr.ph.preheader ], [ %ind.end27, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader39, %.lr.ph
  %.09 = phi i8* [ %48, %.lr.ph ], [ %.09.ph, %.lr.ph.preheader39 ]
  %.018 = phi i8* [ %32, %.lr.ph ], [ %.018.ph, %.lr.ph.preheader39 ]
  %.027 = phi i8* [ %36, %.lr.ph ], [ %.027.ph, %.lr.ph.preheader39 ]
  %.036 = phi i8* [ %41, %.lr.ph ], [ %.036.ph, %.lr.ph.preheader39 ]
  %.045 = phi i32 [ %31, %.lr.ph ], [ %.045.ph, %.lr.ph.preheader39 ]
  %31 = add i32 %.045, -1
  %32 = getelementptr inbounds i8, i8* %.018, i64 1
  %33 = load i8, i8* %.018, align 1
  %34 = zext i8 %33 to i32
  %35 = mul i32 %34, %6
  %36 = getelementptr inbounds i8, i8* %.027, i64 1
  %37 = load i8, i8* %.027, align 1
  %38 = zext i8 %37 to i32
  %39 = mul i32 %38, %7
  %40 = add i32 %39, %35
  %41 = getelementptr inbounds i8, i8* %.036, i64 1
  %42 = load i8, i8* %.036, align 1
  %43 = zext i8 %42 to i32
  %44 = mul i32 %43, %8
  %45 = add i32 %40, %44
  %46 = lshr i32 %45, 8
  %47 = trunc i32 %46 to i8
  %48 = getelementptr inbounds i8, i8* %.09, i64 1
  store i8 %47, i8* %.09, align 1
  %49 = icmp eq i32 %31, 0
  br i1 %49, label %._crit_edge.loopexit, label %.lr.ph, !llvm.loop !14

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %5
  ret void
}

declare void @TIFFClose(%struct.tiff*) local_unnamed_addr #4

declare void @TIFFWarning(i8*, i8*, ...) local_unnamed_addr #4

declare i8* @TIFFFileName(%struct.tiff*) local_unnamed_addr #4

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() local_unnamed_addr #6

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @cpTag(%struct.tiff*, %struct.tiff*, i16 zeroext, i16 zeroext, i32) unnamed_addr #0 {
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16*, align 8
  %9 = alloca float, align 4
  %10 = alloca float*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  switch i32 %4, label %71 [
    i32 3, label %13
    i32 4, label %41
    i32 5, label %48
    i32 2, label %64
  ]

; <label>:13:                                     ; preds = %5
  switch i16 %3, label %74 [
    i16 1, label %14
    i16 2, label %22
    i16 -1, label %32
  ]

; <label>:14:                                     ; preds = %13
  %15 = zext i16 %2 to i32
  %16 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %15, i16* nonnull %6) #8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %74, label %18

; <label>:18:                                     ; preds = %14
  %19 = load i16, i16* %6, align 2
  %20 = zext i16 %19 to i32
  %21 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 %15, i32 %20) #8
  br label %74

; <label>:22:                                     ; preds = %13
  %23 = zext i16 %2 to i32
  %24 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %23, i16* nonnull %6, i16* nonnull %7) #8
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %74, label %26

; <label>:26:                                     ; preds = %22
  %27 = load i16, i16* %6, align 2
  %28 = zext i16 %27 to i32
  %29 = load i16, i16* %7, align 2
  %30 = zext i16 %29 to i32
  %31 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 %23, i32 %28, i32 %30) #8
  br label %74

; <label>:32:                                     ; preds = %13
  %33 = zext i16 %2 to i32
  %34 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %33, i16* nonnull %6, i16** nonnull %8) #8
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %74, label %36

; <label>:36:                                     ; preds = %32
  %37 = load i16, i16* %6, align 2
  %38 = zext i16 %37 to i32
  %39 = load i16*, i16** %8, align 8
  %40 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 %33, i32 %38, i16* %39) #8
  br label %74

; <label>:41:                                     ; preds = %5
  %42 = zext i16 %2 to i32
  %43 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %42, i32* nonnull %12) #8
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %74, label %45

; <label>:45:                                     ; preds = %41
  %46 = load i32, i32* %12, align 4
  %47 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 %42, i32 %46) #8
  br label %74

; <label>:48:                                     ; preds = %5
  switch i16 %3, label %74 [
    i16 1, label %49
    i16 -1, label %57
  ]

; <label>:49:                                     ; preds = %48
  %50 = zext i16 %2 to i32
  %51 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %50, float* nonnull %9) #8
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %74, label %53

; <label>:53:                                     ; preds = %49
  %54 = load float, float* %9, align 4
  %55 = fpext float %54 to double
  %56 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 %50, double %55) #8
  br label %74

; <label>:57:                                     ; preds = %48
  %58 = zext i16 %2 to i32
  %59 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %58, float** nonnull %10) #8
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %74, label %61

; <label>:61:                                     ; preds = %57
  %62 = load float*, float** %10, align 8
  %63 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 %58, float* %62) #8
  br label %74

; <label>:64:                                     ; preds = %5
  %65 = zext i16 %2 to i32
  %66 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %0, i32 %65, i8** nonnull %11) #8
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %74, label %68

; <label>:68:                                     ; preds = %64
  %69 = load i8*, i8** %11, align 8
  %70 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %1, i32 %65, i8* %69) #8
  br label %74

; <label>:71:                                     ; preds = %5
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %73 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.31, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %72) #10
  tail call void @exit(i32 1) #12
  unreachable

; <label>:74:                                     ; preds = %68, %64, %49, %53, %61, %57, %48, %45, %41, %14, %18, %13, %32, %36, %26, %22
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #7

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE* nocapture, i8*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #8

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readonly }
attributes #10 = { cold }
attributes #11 = { nounwind readnone }
attributes #12 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!9}
!9 = distinct !{!9, !3}
!10 = !{!2, !5, !7}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
