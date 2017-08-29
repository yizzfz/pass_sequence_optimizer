; ModuleID = 'tiffmedian.ll'
source_filename = "tiffmedian.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.tiff = type opaque
%struct.colorbox = type { %struct.colorbox*, %struct.colorbox*, i32, i32, i32, i32, i32, i32, i32 }
%struct.C_cell = type { i32, [256 x [2 x i32]] }

@rowsperstrip = local_unnamed_addr global i32 -1, align 4
@compression = global i16 -1, align 2
@bitspersample = global i16 1, align 2
@predictor = local_unnamed_addr global i16 0, align 2
@num_colors = common local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"c:C:r:f\00", align 1
@optarg = external local_unnamed_addr global i8*, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [30 x i8] c"-c: colormap too big, max %d\0A\00", align 1
@optind = external local_unnamed_addr global i32, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@in = common local_unnamed_addr global %struct.tiff* null, align 8
@imagewidth = common global i32 0, align 4
@imagelength = common global i32 0, align 4
@samplesperpixel = common global i16 0, align 2
@.str.3 = private unnamed_addr constant [44 x i8] c"%s: Image must have at least 8-bits/sample\0A\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"%s: Image must have RGB data\0A\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"%s: Can only handle contiguous data packing\0A\00", align 1
@usedboxes = common local_unnamed_addr global %struct.colorbox* null, align 8
@freeboxes = common local_unnamed_addr global %struct.colorbox* null, align 8
@rm = common global [256 x i16] zeroinitializer, align 16
@gm = common global [256 x i16] zeroinitializer, align 16
@bm = common global [256 x i16] zeroinitializer, align 16
@ColorCells = common local_unnamed_addr global %struct.C_cell** null, align 8
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@out = common local_unnamed_addr global %struct.tiff* null, align 8
@.str.7 = private unnamed_addr constant [49 x i8] c"usage: tiffmedian [options] input.tif output.tif\00", align 1
@.str.8 = private unnamed_addr constant [19 x i8] c"where options are:\00", align 1
@.str.9 = private unnamed_addr constant [48 x i8] c" -r #\09\09make each strip have no more than # rows\00", align 1
@.str.10 = private unnamed_addr constant [40 x i8] c" -C #\09\09create a colormap with # entries\00", align 1
@.str.11 = private unnamed_addr constant [35 x i8] c" -f\09\09use Floyd-Steinberg dithering\00", align 1
@.str.12 = private unnamed_addr constant [64 x i8] c" -c lzw[:opts]\09compress output with Lempel-Ziv & Welch encoding\00", align 1
@.str.13 = private unnamed_addr constant [70 x i8] c"               (no longer supported due to Unisys patent enforcement)\00", align 1
@.str.14 = private unnamed_addr constant [53 x i8] c" -c zip[:opts]\09compress output with deflate encoding\00", align 1
@.str.15 = private unnamed_addr constant [52 x i8] c" -c packbits\09compress output with packbits encoding\00", align 1
@.str.16 = private unnamed_addr constant [48 x i8] c" -c none\09use no compression algorithm on output\00", align 1
@.str.17 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"LZW and deflate options:\00", align 1
@.str.19 = private unnamed_addr constant [24 x i8] c" #\09\09set predictor value\00", align 1
@.str.20 = private unnamed_addr constant [75 x i8] c"For example, -c lzw:2 to get LZW-encoded data with horizontal differencing\00", align 1
@stuff = local_unnamed_addr global [15 x i8*] [i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.20, i32 0, i32 0), i8* null], align 16
@bytes_per_pixel = common local_unnamed_addr global i32 0, align 4
@histogram = common global [32 x [32 x [32 x i32]]] zeroinitializer, align 16
@.str.21 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.22 = private unnamed_addr constant [9 x i8] c"packbits\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"zip\00", align 1
@.str.25 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.26 = private unnamed_addr constant [30 x i8] c"No space for scanline buffer\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca float, align 4
  %7 = alloca i32, align 4
  store i32 256, i32* @num_colors, align 4
  br label %.outer

.outer.loopexit:                                  ; preds = %.backedge
  br label %.outer

.outer:                                           ; preds = %.outer.loopexit, %2
  %.02.ph = phi i32 [ 0, %2 ], [ 1, %.outer.loopexit ]
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.outer
  %8 = tail call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #8
  switch i32 %8, label %.backedge.backedge [
    i32 -1, label %25
    i32 99, label %9
    i32 67, label %14
    i32 102, label %.outer.loopexit
    i32 114, label %21
    i32 63, label %24
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
  %16 = tail call i32 @atoi(i8* %15) #10
  store i32 %16, i32* @num_colors, align 4
  %17 = icmp sgt i32 %16, 256
  br i1 %17, label %18, label %.backedge.backedge

.backedge.backedge:                               ; preds = %14, %9, %.backedge, %21
  br label %.backedge

; <label>:18:                                     ; preds = %14
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0), i32 256) #11
  tail call fastcc void @usage()
  unreachable

; <label>:21:                                     ; preds = %.backedge
  %22 = load i8*, i8** @optarg, align 8
  %23 = tail call i32 @atoi(i8* %22) #10
  store i32 %23, i32* @rowsperstrip, align 4
  br label %.backedge.backedge

; <label>:24:                                     ; preds = %.backedge
  tail call fastcc void @usage()
  unreachable

; <label>:25:                                     ; preds = %.backedge
  %26 = load i32, i32* @optind, align 4
  %27 = sub nsw i32 %0, %26
  %28 = icmp eq i32 %27, 2
  br i1 %28, label %30, label %29

; <label>:29:                                     ; preds = %25
  tail call fastcc void @usage()
  unreachable

; <label>:30:                                     ; preds = %25
  %31 = sext i32 %26 to i64
  %32 = getelementptr inbounds i8*, i8** %1, i64 %31
  %33 = load i8*, i8** %32, align 8
  %34 = tail call %struct.tiff* @TIFFOpen(i8* %33, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)) #8
  store %struct.tiff* %34, %struct.tiff** @in, align 8
  %35 = icmp eq %struct.tiff* %34, null
  br i1 %35, label %328, label %36

; <label>:36:                                     ; preds = %30
  %37 = tail call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* nonnull %34, i32 256, i32* nonnull @imagewidth) #8
  %38 = load %struct.tiff*, %struct.tiff** @in, align 8
  %39 = tail call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %38, i32 257, i32* nonnull @imagelength) #8
  %40 = load %struct.tiff*, %struct.tiff** @in, align 8
  %41 = tail call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %40, i32 258, i16* nonnull @bitspersample) #8
  %42 = load %struct.tiff*, %struct.tiff** @in, align 8
  %43 = tail call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %42, i32 277, i16* nonnull @samplesperpixel) #8
  %44 = load i16, i16* @bitspersample, align 2
  switch i16 %44, label %45 [
    i16 16, label %52
    i16 8, label %52
  ]

; <label>:45:                                     ; preds = %36
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = load i32, i32* @optind, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8*, i8** %1, i64 %48
  %50 = load i8*, i8** %49, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.3, i64 0, i64 0), i8* %50) #11
  br label %328

; <label>:52:                                     ; preds = %36, %36
  %53 = load %struct.tiff*, %struct.tiff** @in, align 8
  %54 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %53, i32 262, i16* nonnull %5) #8
  %55 = load i16, i16* %5, align 2
  %notlhs = icmp eq i32 %54, 0
  %notrhs = icmp ne i16 %55, 2
  %or.cond7.not = or i1 %notlhs, %notrhs
  %56 = load i16, i16* @samplesperpixel, align 2
  %57 = icmp ult i16 %56, 3
  %or.cond9 = or i1 %or.cond7.not, %57
  br i1 %or.cond9, label %58, label %65

; <label>:58:                                     ; preds = %52
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = load i32, i32* @optind, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8*, i8** %1, i64 %61
  %63 = load i8*, i8** %62, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0), i8* %63) #11
  br label %328

; <label>:65:                                     ; preds = %52
  %66 = load %struct.tiff*, %struct.tiff** @in, align 8
  %67 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %66, i32 284, i16* nonnull %4) #8
  %68 = load i16, i16* %4, align 2
  %69 = icmp eq i16 %68, 1
  br i1 %69, label %77, label %70

; <label>:70:                                     ; preds = %65
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = load i32, i32* @optind, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8*, i8** %1, i64 %73
  %75 = load i8*, i8** %74, align 8
  %76 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i64 0, i64 0), i8* %75) #11
  br label %328

; <label>:77:                                     ; preds = %65
  store %struct.colorbox* null, %struct.colorbox** @usedboxes, align 8
  %78 = load i32, i32* @num_colors, align 4
  %79 = mul i32 %78, 48
  %80 = call i8* @_TIFFmalloc(i32 %79) #8
  store i8* %80, i8** bitcast (%struct.colorbox** @freeboxes to i8**), align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 48
  %82 = bitcast i8* %80 to i8**
  store i8* %81, i8** %82, align 8
  %83 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %84 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %83, i64 0, i32 1
  store %struct.colorbox* null, %struct.colorbox** %84, align 8
  %85 = load i32, i32* @num_colors, align 4
  %86 = add nsw i32 %85, -1
  %87 = icmp sgt i32 %86, 1
  br i1 %87, label %.lr.ph25.preheader, label %._crit_edge26

.lr.ph25.preheader:                               ; preds = %77
  br label %.lr.ph25

.lr.ph25:                                         ; preds = %.lr.ph25.preheader, %.lr.ph25
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %.lr.ph25 ], [ 1, %.lr.ph25.preheader ]
  %88 = phi %struct.colorbox* [ %99, %.lr.ph25 ], [ %83, %.lr.ph25.preheader ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %89 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %88, i64 %indvars.iv.next35
  %90 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %88, i64 %indvars.iv34, i32 0
  store %struct.colorbox* %89, %struct.colorbox** %90, align 8
  %91 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %92 = add nsw i64 %indvars.iv34, -1
  %93 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %91, i64 %92
  %94 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %91, i64 %indvars.iv34, i32 1
  store %struct.colorbox* %93, %struct.colorbox** %94, align 8
  %95 = load i32, i32* @num_colors, align 4
  %96 = add nsw i32 %95, -1
  %97 = sext i32 %96 to i64
  %98 = icmp slt i64 %indvars.iv.next35, %97
  %99 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  br i1 %98, label %.lr.ph25, label %._crit_edge26.loopexit

._crit_edge26.loopexit:                           ; preds = %.lr.ph25
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %77
  %.lcssa13 = phi i32 [ %86, %77 ], [ %96, %._crit_edge26.loopexit ]
  %.lcssa12 = phi %struct.colorbox* [ %83, %77 ], [ %99, %._crit_edge26.loopexit ]
  %100 = sext i32 %.lcssa13 to i64
  %101 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.lcssa12, i64 %100, i32 0
  store %struct.colorbox* null, %struct.colorbox** %101, align 8
  %102 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %103 = load i32, i32* @num_colors, align 4
  %104 = add nsw i32 %103, -2
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %102, i64 %105
  %107 = add nsw i32 %103, -1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %102, i64 %108, i32 1
  store %struct.colorbox* %106, %struct.colorbox** %109, align 8
  %110 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %111 = bitcast %struct.colorbox* %110 to i64*
  %112 = load i64, i64* %111, align 8
  store i64 %112, i64* bitcast (%struct.colorbox** @freeboxes to i64*), align 8
  %113 = icmp eq i64 %112, 0
  br i1 %113, label %117, label %114

; <label>:114:                                    ; preds = %._crit_edge26
  %115 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %116 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %115, i64 0, i32 1
  store %struct.colorbox* null, %struct.colorbox** %116, align 8
  br label %117

; <label>:117:                                    ; preds = %._crit_edge26, %114
  %118 = load i64, i64* bitcast (%struct.colorbox** @usedboxes to i64*), align 8
  store i64 %118, i64* %111, align 8
  store %struct.colorbox* %110, %struct.colorbox** @usedboxes, align 8
  %119 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %110, i64 0, i32 0
  %120 = load %struct.colorbox*, %struct.colorbox** %119, align 8
  %121 = icmp eq %struct.colorbox* %120, null
  br i1 %121, label %124, label %122

; <label>:122:                                    ; preds = %117
  %123 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %120, i64 0, i32 1
  store %struct.colorbox* %110, %struct.colorbox** %123, align 8
  br label %124

; <label>:124:                                    ; preds = %117, %122
  %125 = load %struct.tiff*, %struct.tiff** @in, align 8
  call fastcc void @get_histogram(%struct.tiff* %125, %struct.colorbox* nonnull %110)
  %.pr22 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %126 = icmp eq %struct.colorbox* %.pr22, null
  br i1 %126, label %.preheader11, label %.lr.ph21.preheader

.lr.ph21.preheader:                               ; preds = %124
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader, %thread-pre-split
  %127 = call fastcc %struct.colorbox* @largest_box()
  %128 = icmp eq %struct.colorbox* %127, null
  br i1 %128, label %..preheader11_crit_edge, label %thread-pre-split

.preheader11.loopexit:                            ; preds = %thread-pre-split
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %124, %..preheader11_crit_edge
  %.0118 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  %129 = icmp eq %struct.colorbox* %.0118, null
  br i1 %129, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader11
  br label %.lr.ph

thread-pre-split:                                 ; preds = %.lr.ph21
  call fastcc void @splitbox(%struct.colorbox* nonnull %127)
  %.pr = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %130 = icmp eq %struct.colorbox* %.pr, null
  br i1 %130, label %.preheader11.loopexit, label %.lr.ph21

..preheader11_crit_edge:                          ; preds = %.lr.ph21
  store %struct.colorbox* null, %struct.colorbox** @freeboxes, align 8
  br label %.preheader11

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.0120 = phi %struct.colorbox* [ %.01, %.lr.ph ], [ %.0118, %.lr.ph.preheader ]
  %131 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.0120, i64 0, i32 2
  %132 = load i32, i32* %131, align 8
  %133 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.0120, i64 0, i32 3
  %134 = load i32, i32* %133, align 4
  %135 = add nsw i32 %134, %132
  %136 = shl i32 %135, 3
  %137 = sdiv i32 %136, 2
  %138 = trunc i32 %137 to i16
  %139 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %indvars.iv32
  store i16 %138, i16* %139, align 2
  %140 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.0120, i64 0, i32 4
  %141 = load i32, i32* %140, align 8
  %142 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.0120, i64 0, i32 5
  %143 = load i32, i32* %142, align 4
  %144 = add nsw i32 %143, %141
  %145 = shl i32 %144, 3
  %146 = sdiv i32 %145, 2
  %147 = trunc i32 %146 to i16
  %148 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %indvars.iv32
  store i16 %147, i16* %148, align 2
  %149 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.0120, i64 0, i32 6
  %150 = load i32, i32* %149, align 8
  %151 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.0120, i64 0, i32 7
  %152 = load i32, i32* %151, align 4
  %153 = add nsw i32 %152, %150
  %154 = shl i32 %153, 3
  %155 = sdiv i32 %154, 2
  %156 = trunc i32 %155 to i16
  %157 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %indvars.iv32
  store i16 %156, i16* %157, align 2
  %indvars.iv.next33 = add nuw i64 %indvars.iv32, 1
  %158 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.0120, i64 0, i32 0
  %.01 = load %struct.colorbox*, %struct.colorbox** %158, align 8
  %159 = icmp eq %struct.colorbox* %.01, null
  br i1 %159, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader11
  call void @_TIFFfree(i8* %80) #8
  store %struct.colorbox* null, %struct.colorbox** @usedboxes, align 8
  store %struct.colorbox* null, %struct.colorbox** @freeboxes, align 8
  %160 = call i8* @_TIFFmalloc(i32 512) #8
  store i8* %160, i8** bitcast (%struct.C_cell*** @ColorCells to i8**), align 8
  call void @_TIFFmemset(i8* %160, i32 0, i32 512) #8
  call fastcc void @map_colortable()
  %161 = load i32, i32* @optind, align 4
  %162 = add nsw i32 %161, 1
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i8*, i8** %1, i64 %163
  %165 = load i8*, i8** %164, align 8
  %166 = call %struct.tiff* @TIFFOpen(i8* %165, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)) #8
  store %struct.tiff* %166, %struct.tiff** @out, align 8
  %167 = icmp eq %struct.tiff* %166, null
  br i1 %167, label %328, label %168

; <label>:168:                                    ; preds = %._crit_edge
  %169 = load %struct.tiff*, %struct.tiff** @in, align 8
  %170 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %169, i32 254, i32* nonnull %7) #8
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %176, label %172

; <label>:172:                                    ; preds = %168
  %173 = load %struct.tiff*, %struct.tiff** @out, align 8
  %174 = load i32, i32* %7, align 4
  %175 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %173, i32 254, i32 %174) #8
  br label %176

; <label>:176:                                    ; preds = %168, %172
  %177 = load %struct.tiff*, %struct.tiff** @in, align 8
  %178 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %177, i32 256, i32* nonnull %7) #8
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %184, label %180

; <label>:180:                                    ; preds = %176
  %181 = load %struct.tiff*, %struct.tiff** @out, align 8
  %182 = load i32, i32* %7, align 4
  %183 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %181, i32 256, i32 %182) #8
  br label %184

; <label>:184:                                    ; preds = %176, %180
  %185 = load %struct.tiff*, %struct.tiff** @out, align 8
  %186 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %185, i32 258, i32 8) #8
  %187 = load i16, i16* @compression, align 2
  %188 = icmp eq i16 %187, -1
  br i1 %188, label %201, label %189

; <label>:189:                                    ; preds = %184
  %190 = load %struct.tiff*, %struct.tiff** @out, align 8
  %191 = zext i16 %187 to i32
  %192 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %190, i32 259, i32 %191) #8
  %193 = load i16, i16* @compression, align 2
  switch i16 %193, label %210 [
    i16 5, label %194
    i16 -32590, label %194
  ]

; <label>:194:                                    ; preds = %189, %189
  %195 = load i16, i16* @predictor, align 2
  %196 = icmp eq i16 %195, 0
  br i1 %196, label %210, label %197

; <label>:197:                                    ; preds = %194
  %198 = zext i16 %195 to i32
  %199 = load %struct.tiff*, %struct.tiff** @out, align 8
  %200 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %199, i32 317, i32 %198) #8
  br label %210

; <label>:201:                                    ; preds = %184
  %202 = load %struct.tiff*, %struct.tiff** @in, align 8
  %203 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %202, i32 259, i16* nonnull @compression) #8
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %210, label %205

; <label>:205:                                    ; preds = %201
  %206 = load %struct.tiff*, %struct.tiff** @out, align 8
  %207 = load i16, i16* @compression, align 2
  %208 = zext i16 %207 to i32
  %209 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %206, i32 259, i32 %208) #8
  br label %210

; <label>:210:                                    ; preds = %205, %201, %189, %194, %197
  %211 = load %struct.tiff*, %struct.tiff** @out, align 8
  %212 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %211, i32 262, i32 3) #8
  %213 = load %struct.tiff*, %struct.tiff** @in, align 8
  %214 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %213, i32 274, i16* nonnull %3) #8
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %221, label %216

; <label>:216:                                    ; preds = %210
  %217 = load %struct.tiff*, %struct.tiff** @out, align 8
  %218 = load i16, i16* %3, align 2
  %219 = zext i16 %218 to i32
  %220 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %217, i32 274, i32 %219) #8
  br label %221

; <label>:221:                                    ; preds = %210, %216
  %222 = load %struct.tiff*, %struct.tiff** @out, align 8
  %223 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %222, i32 277, i32 1) #8
  %224 = load %struct.tiff*, %struct.tiff** @in, align 8
  %225 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %224, i32 284, i16* nonnull %3) #8
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %232, label %227

; <label>:227:                                    ; preds = %221
  %228 = load %struct.tiff*, %struct.tiff** @out, align 8
  %229 = load i16, i16* %3, align 2
  %230 = zext i16 %229 to i32
  %231 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %228, i32 284, i32 %230) #8
  br label %232

; <label>:232:                                    ; preds = %221, %227
  %233 = load %struct.tiff*, %struct.tiff** @out, align 8
  %234 = load i32, i32* @rowsperstrip, align 4
  %235 = call i32 @TIFFDefaultStripSize(%struct.tiff* %233, i32 %234) #8
  %236 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %233, i32 278, i32 %235) #8
  %237 = load %struct.tiff*, %struct.tiff** @in, align 8
  %238 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %237, i32 280, i16* nonnull %3) #8
  %239 = icmp eq i32 %238, 0
  br i1 %239, label %245, label %240

; <label>:240:                                    ; preds = %232
  %241 = load %struct.tiff*, %struct.tiff** @out, align 8
  %242 = load i16, i16* %3, align 2
  %243 = zext i16 %242 to i32
  %244 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %241, i32 280, i32 %243) #8
  br label %245

; <label>:245:                                    ; preds = %232, %240
  %246 = load %struct.tiff*, %struct.tiff** @in, align 8
  %247 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %246, i32 281, i16* nonnull %3) #8
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %254, label %249

; <label>:249:                                    ; preds = %245
  %250 = load %struct.tiff*, %struct.tiff** @out, align 8
  %251 = load i16, i16* %3, align 2
  %252 = zext i16 %251 to i32
  %253 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %250, i32 281, i32 %252) #8
  br label %254

; <label>:254:                                    ; preds = %245, %249
  %255 = load %struct.tiff*, %struct.tiff** @in, align 8
  %256 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %255, i32 296, i16* nonnull %3) #8
  %257 = icmp eq i32 %256, 0
  br i1 %257, label %263, label %258

; <label>:258:                                    ; preds = %254
  %259 = load %struct.tiff*, %struct.tiff** @out, align 8
  %260 = load i16, i16* %3, align 2
  %261 = zext i16 %260 to i32
  %262 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %259, i32 296, i32 %261) #8
  br label %263

; <label>:263:                                    ; preds = %254, %258
  %264 = load %struct.tiff*, %struct.tiff** @in, align 8
  %265 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %264, i32 282, float* nonnull %6) #8
  %266 = icmp eq i32 %265, 0
  br i1 %266, label %272, label %267

; <label>:267:                                    ; preds = %263
  %268 = load %struct.tiff*, %struct.tiff** @out, align 8
  %269 = load float, float* %6, align 4
  %270 = fpext float %269 to double
  %271 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %268, i32 282, double %270) #8
  br label %272

; <label>:272:                                    ; preds = %263, %267
  %273 = load %struct.tiff*, %struct.tiff** @in, align 8
  %274 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %273, i32 283, float* nonnull %6) #8
  %275 = icmp eq i32 %274, 0
  br i1 %275, label %281, label %276

; <label>:276:                                    ; preds = %272
  %277 = load %struct.tiff*, %struct.tiff** @out, align 8
  %278 = load float, float* %6, align 4
  %279 = fpext float %278 to double
  %280 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %277, i32 283, double %279) #8
  br label %281

; <label>:281:                                    ; preds = %272, %276
  %282 = load %struct.tiff*, %struct.tiff** @in, align 8
  %283 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %282, i32 286, float* nonnull %6) #8
  %284 = icmp eq i32 %283, 0
  br i1 %284, label %290, label %285

; <label>:285:                                    ; preds = %281
  %286 = load %struct.tiff*, %struct.tiff** @out, align 8
  %287 = load float, float* %6, align 4
  %288 = fpext float %287 to double
  %289 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %286, i32 286, double %288) #8
  br label %290

; <label>:290:                                    ; preds = %281, %285
  %291 = load %struct.tiff*, %struct.tiff** @in, align 8
  %292 = call i32 (%struct.tiff*, i32, ...) @TIFFGetField(%struct.tiff* %291, i32 287, float* nonnull %6) #8
  %293 = icmp eq i32 %292, 0
  br i1 %293, label %299, label %294

; <label>:294:                                    ; preds = %290
  %295 = load %struct.tiff*, %struct.tiff** @out, align 8
  %296 = load float, float* %6, align 4
  %297 = fpext float %296 to double
  %298 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %295, i32 287, double %297) #8
  br label %299

; <label>:299:                                    ; preds = %290, %294
  %300 = icmp eq i32 %.02.ph, 0
  %301 = load %struct.tiff*, %struct.tiff** @in, align 8
  %302 = load %struct.tiff*, %struct.tiff** @out, align 8
  br i1 %300, label %304, label %303

; <label>:303:                                    ; preds = %299
  call fastcc void @quant_fsdither(%struct.tiff* %301, %struct.tiff* %302)
  br label %.preheader.preheader

; <label>:304:                                    ; preds = %299
  call fastcc void @quant(%struct.tiff* %301, %struct.tiff* %302)
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %304, %303
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader ], [ 0, %.preheader.preheader ]
  %305 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %indvars.iv
  %306 = load i16, i16* %305, align 4
  %307 = mul i16 %306, 257
  store i16 %307, i16* %305, align 4
  %308 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %indvars.iv
  %309 = load i16, i16* %308, align 4
  %310 = mul i16 %309, 257
  store i16 %310, i16* %308, align 4
  %311 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %indvars.iv
  %312 = load i16, i16* %311, align 4
  %313 = mul i16 %312, 257
  store i16 %313, i16* %311, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %314 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %indvars.iv.next
  %315 = load i16, i16* %314, align 2
  %316 = mul i16 %315, 257
  store i16 %316, i16* %314, align 2
  %317 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %indvars.iv.next
  %318 = load i16, i16* %317, align 2
  %319 = mul i16 %318, 257
  store i16 %319, i16* %317, align 2
  %320 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %indvars.iv.next
  %321 = load i16, i16* %320, align 2
  %322 = mul i16 %321, 257
  store i16 %322, i16* %320, align 2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 256
  br i1 %exitcond.1, label %323, label %.preheader

; <label>:323:                                    ; preds = %.preheader
  %324 = load %struct.tiff*, %struct.tiff** @out, align 8
  %325 = call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %324, i32 320, i16* getelementptr inbounds ([256 x i16], [256 x i16]* @rm, i64 0, i64 0), i16* getelementptr inbounds ([256 x i16], [256 x i16]* @gm, i64 0, i64 0), i16* getelementptr inbounds ([256 x i16], [256 x i16]* @bm, i64 0, i64 0)) #8
  %326 = load %struct.tiff*, %struct.tiff** @in, align 8
  call void @TIFFClose(%struct.tiff* %326) #8
  %327 = load %struct.tiff*, %struct.tiff** @out, align 8
  call void @TIFFClose(%struct.tiff* %327) #8
  br label %328

; <label>:328:                                    ; preds = %._crit_edge, %30, %323, %70, %58, %45
  %.0 = phi i32 [ -3, %45 ], [ -4, %58 ], [ -5, %70 ], [ 0, %323 ], [ -1, %30 ], [ -2, %._crit_edge ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @processCompressOptions(i8* readonly) unnamed_addr #0 {
  %2 = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i64 0, i64 0)) #10
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %.sink.split, label %4

; <label>:4:                                      ; preds = %1
  %5 = tail call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.22, i64 0, i64 0)) #10
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %.sink.split, label %7

; <label>:7:                                      ; preds = %4
  %8 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0), i64 3) #10
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %17

; <label>:10:                                     ; preds = %7
  %11 = tail call i8* @strchr(i8* %0, i32 58) #10
  %12 = icmp eq i8* %11, null
  br i1 %12, label %.sink.split, label %13

; <label>:13:                                     ; preds = %10
  %14 = getelementptr inbounds i8, i8* %11, i64 1
  %15 = tail call i32 @atoi(i8* %14) #10
  %16 = trunc i32 %15 to i16
  store i16 %16, i16* @predictor, align 2
  br label %.sink.split

; <label>:17:                                     ; preds = %7
  %18 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i64 0, i64 0), i64 3) #10
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %27

; <label>:20:                                     ; preds = %17
  %21 = tail call i8* @strchr(i8* %0, i32 58) #10
  %22 = icmp eq i8* %21, null
  br i1 %22, label %.sink.split, label %23

; <label>:23:                                     ; preds = %20
  %24 = getelementptr inbounds i8, i8* %21, i64 1
  %25 = tail call i32 @atoi(i8* %24) #10
  %26 = trunc i32 %25 to i16
  store i16 %26, i16* @predictor, align 2
  br label %.sink.split

.sink.split:                                      ; preds = %1, %23, %20, %13, %10, %4
  %.sink = phi i16 [ -32763, %4 ], [ 5, %10 ], [ 5, %13 ], [ -32590, %20 ], [ -32590, %23 ], [ 1, %1 ]
  store i16 %.sink, i16* @compression, align 2
  br label %27

; <label>:27:                                     ; preds = %.sink.split, %17
  %.0 = phi i32 [ 0, %17 ], [ 1, %.sink.split ]
  ret i32 %.0
}

; Function Attrs: noinline noreturn nounwind uwtable
define internal fastcc void @usage() unnamed_addr #2 {
  %1 = alloca [8192 x i8], align 16
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = getelementptr inbounds [8192 x i8], [8192 x i8]* %1, i64 0, i64 0
  call void @setbuf(%struct._IO_FILE* %2, i8* nonnull %3) #8
  %4 = load i8*, i8** getelementptr inbounds ([15 x i8*], [15 x i8*]* @stuff, i64 0, i64 0), align 16
  %5 = icmp eq i8* %4, null
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %6 = phi i8* [ %10, %.lr.ph ], [ %4, %.lr.ph.preheader ]
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.25, i64 0, i64 0), i8* nonnull %6) #11
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [15 x i8*], [15 x i8*]* @stuff, i64 0, i64 %indvars.iv.next
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

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

declare %struct.tiff* @TIFFOpen(i8*, i8*) local_unnamed_addr #4

declare i32 @TIFFGetField(%struct.tiff*, i32, ...) local_unnamed_addr #4

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @get_histogram(%struct.tiff*, %struct.colorbox* nocapture) unnamed_addr #0 {
  %3 = tail call i32 @TIFFScanlineSize(%struct.tiff* %0) #8
  %4 = tail call i8* @_TIFFmalloc(i32 %3) #8
  %5 = icmp eq i8* %4, null
  br i1 %5, label %6, label %.preheader

; <label>:6:                                      ; preds = %2
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.26, i64 0, i64 0), i64 29, i64 1, %struct._IO_FILE* %7) #11
  tail call void @exit(i32 1) #12
  unreachable

.preheader:                                       ; preds = %2
  %9 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %1, i64 0, i32 6
  store i32 999, i32* %9, align 8
  %10 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %1, i64 0, i32 4
  store i32 999, i32* %10, align 8
  %11 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %1, i64 0, i32 2
  store i32 999, i32* %11, align 8
  %12 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %1, i64 0, i32 7
  store i32 -1, i32* %12, align 4
  %13 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %1, i64 0, i32 5
  store i32 -1, i32* %13, align 4
  %14 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %1, i64 0, i32 3
  store i32 -1, i32* %14, align 4
  %15 = load i32, i32* @imagewidth, align 4
  %16 = load i32, i32* @imagelength, align 4
  %17 = mul i32 %16, %15
  %18 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %1, i64 0, i32 8
  store i32 %17, i32* %18, align 8
  call void @llvm.memset.p0i8.i64(i8* bitcast ([32 x [32 x [32 x i32]]]* @histogram to i8*), i8 0, i64 131072, i32 16, i1 false)
  %19 = icmp eq i32 %16, 0
  br i1 %19, label %._crit_edge7, label %.lr.ph6.preheader

.lr.ph6.preheader:                                ; preds = %.preheader
  br label %.lr.ph6

.lr.ph6:                                          ; preds = %.lr.ph6.preheader, %._crit_edge
  %.15 = phi i32 [ %69, %._crit_edge ], [ 0, %.lr.ph6.preheader ]
  %20 = tail call i32 @TIFFReadScanline(%struct.tiff* %0, i8* nonnull %4, i32 %.15, i16 zeroext 0) #8
  %21 = icmp slt i32 %20, 1
  br i1 %21, label %._crit_edge7.loopexit, label %22

; <label>:22:                                     ; preds = %.lr.ph6
  %23 = load i32, i32* @imagewidth, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %22
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %61
  %.in = phi i32 [ %25, %61 ], [ %23, %.lr.ph.preheader ]
  %.024 = phi i8* [ %34, %61 ], [ %4, %.lr.ph.preheader ]
  %25 = add i32 %.in, -1
  %26 = getelementptr inbounds i8, i8* %.024, i64 1
  %27 = load i8, i8* %.024, align 1
  %28 = zext i8 %27 to i32
  %29 = lshr i32 %28, 3
  %30 = getelementptr inbounds i8, i8* %.024, i64 2
  %31 = load i8, i8* %26, align 1
  %32 = zext i8 %31 to i32
  %33 = lshr i32 %32, 3
  %34 = getelementptr inbounds i8, i8* %.024, i64 3
  %35 = load i8, i8* %30, align 1
  %36 = zext i8 %35 to i32
  %37 = lshr i32 %36, 3
  %38 = load i32, i32* %11, align 8
  %39 = icmp slt i32 %29, %38
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %.lr.ph
  store i32 %29, i32* %11, align 8
  br label %41

; <label>:41:                                     ; preds = %40, %.lr.ph
  %42 = load i32, i32* %14, align 4
  %43 = icmp sgt i32 %29, %42
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %41
  store i32 %29, i32* %14, align 4
  br label %45

; <label>:45:                                     ; preds = %44, %41
  %46 = load i32, i32* %10, align 8
  %47 = icmp slt i32 %33, %46
  br i1 %47, label %48, label %49

; <label>:48:                                     ; preds = %45
  store i32 %33, i32* %10, align 8
  br label %49

; <label>:49:                                     ; preds = %48, %45
  %50 = load i32, i32* %13, align 4
  %51 = icmp sgt i32 %33, %50
  br i1 %51, label %52, label %53

; <label>:52:                                     ; preds = %49
  store i32 %33, i32* %13, align 4
  br label %53

; <label>:53:                                     ; preds = %52, %49
  %54 = load i32, i32* %9, align 8
  %55 = icmp slt i32 %37, %54
  br i1 %55, label %56, label %57

; <label>:56:                                     ; preds = %53
  store i32 %37, i32* %9, align 8
  br label %57

; <label>:57:                                     ; preds = %56, %53
  %58 = load i32, i32* %12, align 4
  %59 = icmp sgt i32 %37, %58
  br i1 %59, label %60, label %61

; <label>:60:                                     ; preds = %57
  store i32 %37, i32* %12, align 4
  br label %61

; <label>:61:                                     ; preds = %60, %57
  %62 = zext i32 %29 to i64
  %63 = zext i32 %33 to i64
  %64 = zext i32 %37 to i64
  %65 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %62, i64 %63, i64 %64
  %66 = load i32, i32* %65, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %65, align 4
  %68 = icmp eq i32 %25, 0
  br i1 %68, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %61
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %22
  %69 = add i32 %.15, 1
  %70 = load i32, i32* @imagelength, align 4
  %71 = icmp ult i32 %69, %70
  br i1 %71, label %.lr.ph6, label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %.lr.ph6, %._crit_edge
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader
  tail call void @_TIFFfree(i8* nonnull %4) #8
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc %struct.colorbox* @largest_box() unnamed_addr #5 {
  %.04 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  %1 = icmp eq %struct.colorbox* %.04, null
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %23
  %.07 = phi %struct.colorbox* [ %.0, %23 ], [ %.04, %.lr.ph.preheader ]
  %.016 = phi %struct.colorbox* [ %.1, %23 ], [ null, %.lr.ph.preheader ]
  %.025 = phi i32 [ %.13, %23 ], [ -1, %.lr.ph.preheader ]
  %2 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.07, i64 0, i32 3
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.07, i64 0, i32 2
  %5 = load i32, i32* %4, align 8
  %6 = icmp sgt i32 %3, %5
  br i1 %6, label %19, label %7

; <label>:7:                                      ; preds = %.lr.ph
  %8 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.07, i64 0, i32 5
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.07, i64 0, i32 4
  %11 = load i32, i32* %10, align 8
  %12 = icmp sgt i32 %9, %11
  br i1 %12, label %19, label %13

; <label>:13:                                     ; preds = %7
  %14 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.07, i64 0, i32 7
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.07, i64 0, i32 6
  %17 = load i32, i32* %16, align 8
  %18 = icmp sgt i32 %15, %17
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %13, %7, %.lr.ph
  %20 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.07, i64 0, i32 8
  %21 = load i32, i32* %20, align 8
  %22 = icmp sgt i32 %21, %.025
  %..02 = select i1 %22, i32 %21, i32 %.025
  %.0..01 = select i1 %22, %struct.colorbox* %.07, %struct.colorbox* %.016
  br label %23

; <label>:23:                                     ; preds = %19, %13
  %.13 = phi i32 [ %.025, %13 ], [ %..02, %19 ]
  %.1 = phi %struct.colorbox* [ %.016, %13 ], [ %.0..01, %19 ]
  %24 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %.07, i64 0, i32 0
  %.0 = load %struct.colorbox*, %struct.colorbox** %24, align 8
  %25 = icmp eq %struct.colorbox* %.0, null
  br i1 %25, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %23
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  %.01.lcssa = phi %struct.colorbox* [ null, %0 ], [ %.1, %._crit_edge.loopexit ]
  ret %struct.colorbox* %.01.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @splitbox(%struct.colorbox*) unnamed_addr #6 {
  %2 = alloca [32 x i32], align 16
  %3 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 3
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 2
  %6 = load i32, i32* %5, align 8
  %7 = sub nsw i32 %4, %6
  %8 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 5
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 4
  %11 = load i32, i32* %10, align 8
  %12 = sub nsw i32 %9, %11
  %13 = icmp slt i32 %7, %12
  br i1 %13, label %21, label %14

; <label>:14:                                     ; preds = %1
  %15 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %18 = load i32, i32* %17, align 8
  %19 = sub nsw i32 %16, %18
  %20 = icmp slt i32 %7, %19
  br i1 %20, label %21, label %.thread

; <label>:21:                                     ; preds = %1, %14
  %22 = load i32, i32* %8, align 4
  %23 = load i32, i32* %10, align 8
  %24 = sub nsw i32 %22, %23
  %25 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  %26 = load i32, i32* %25, align 4
  %27 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %28 = load i32, i32* %27, align 8
  %29 = sub nsw i32 %26, %28
  %30 = icmp slt i32 %24, %29
  %. = select i1 %30, i32 2, i32 1
  br i1 %30, label %96, label %63

.thread:                                          ; preds = %14
  %31 = load i32, i32* %5, align 8
  %32 = load i32, i32* %3, align 4
  %33 = icmp sgt i32 %31, %32
  br i1 %33, label %.sink.split, label %.lr.ph91

.lr.ph91:                                         ; preds = %.thread
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %37 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  br label %38

; <label>:38:                                     ; preds = %._crit_edge88, %.lr.ph91
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge88 ], [ %34, %.lr.ph91 ]
  %.0690 = phi i32* [ %59, %._crit_edge88 ], [ %35, %.lr.ph91 ]
  store i32 0, i32* %.0690, align 4
  %39 = load i32, i32* %10, align 8
  %40 = load i32, i32* %8, align 4
  %41 = icmp sgt i32 %39, %40
  br i1 %41, label %._crit_edge88, label %.lr.ph87

.lr.ph87:                                         ; preds = %38
  %42 = sext i32 %39 to i64
  br label %43

; <label>:43:                                     ; preds = %._crit_edge84, %.lr.ph87
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge84 ], [ %42, %.lr.ph87 ]
  %44 = load i32, i32* %36, align 8
  %45 = load i32, i32* %37, align 4
  %46 = icmp sgt i32 %44, %45
  br i1 %46, label %._crit_edge84, label %.lr.ph83.preheader

.lr.ph83.preheader:                               ; preds = %43
  %47 = sext i32 %44 to i64
  %48 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv104, i64 %indvars.iv102, i64 %47
  br label %.lr.ph83

.lr.ph83:                                         ; preds = %.lr.ph83.preheader, %.lr.ph83
  %.0481 = phi i32* [ %52, %.lr.ph83 ], [ %48, %.lr.ph83.preheader ]
  %.01980 = phi i32 [ %53, %.lr.ph83 ], [ %44, %.lr.ph83.preheader ]
  %49 = load i32, i32* %.0481, align 4
  %50 = load i32, i32* %.0690, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, i32* %.0690, align 4
  %52 = getelementptr inbounds i32, i32* %.0481, i64 1
  %53 = add nsw i32 %.01980, 1
  %54 = load i32, i32* %37, align 4
  %55 = icmp slt i32 %.01980, %54
  br i1 %55, label %.lr.ph83, label %._crit_edge84.loopexit

._crit_edge84.loopexit:                           ; preds = %.lr.ph83
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge84.loopexit, %43
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %56 = load i32, i32* %8, align 4
  %57 = sext i32 %56 to i64
  %58 = icmp slt i64 %indvars.iv102, %57
  br i1 %58, label %43, label %._crit_edge88.loopexit

._crit_edge88.loopexit:                           ; preds = %._crit_edge84
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.loopexit, %38
  %59 = getelementptr inbounds i32, i32* %.0690, i64 1
  %indvars.iv.next105 = add i64 %indvars.iv104, 1
  %60 = load i32, i32* %3, align 4
  %61 = sext i32 %60 to i64
  %62 = icmp slt i64 %indvars.iv104, %61
  br i1 %62, label %38, label %.sink.split.loopexit132

; <label>:63:                                     ; preds = %21
  %64 = load i32, i32* %10, align 8
  %65 = load i32, i32* %8, align 4
  %66 = icmp sgt i32 %64, %65
  br i1 %66, label %.sink.split, label %.lr.ph79

.lr.ph79:                                         ; preds = %63
  %67 = sext i32 %64 to i64
  %68 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 %67
  %69 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %70 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  br label %71

; <label>:71:                                     ; preds = %._crit_edge75, %.lr.ph79
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge75 ], [ %67, %.lr.ph79 ]
  %.1777 = phi i32* [ %92, %._crit_edge75 ], [ %68, %.lr.ph79 ]
  store i32 0, i32* %.1777, align 4
  %72 = load i32, i32* %5, align 8
  %73 = load i32, i32* %3, align 4
  %74 = icmp sgt i32 %72, %73
  br i1 %74, label %._crit_edge75, label %.lr.ph74

.lr.ph74:                                         ; preds = %71
  %75 = sext i32 %72 to i64
  br label %76

; <label>:76:                                     ; preds = %._crit_edge71, %.lr.ph74
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %._crit_edge71 ], [ %75, %.lr.ph74 ]
  %77 = load i32, i32* %69, align 8
  %78 = load i32, i32* %70, align 4
  %79 = icmp sgt i32 %77, %78
  br i1 %79, label %._crit_edge71, label %.lr.ph70.preheader

.lr.ph70.preheader:                               ; preds = %76
  %80 = sext i32 %77 to i64
  %81 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv98, i64 %indvars.iv100, i64 %80
  br label %.lr.ph70

.lr.ph70:                                         ; preds = %.lr.ph70.preheader, %.lr.ph70
  %.1568 = phi i32* [ %85, %.lr.ph70 ], [ %81, %.lr.ph70.preheader ]
  %.12067 = phi i32 [ %86, %.lr.ph70 ], [ %77, %.lr.ph70.preheader ]
  %82 = load i32, i32* %.1568, align 4
  %83 = load i32, i32* %.1777, align 4
  %84 = add nsw i32 %83, %82
  store i32 %84, i32* %.1777, align 4
  %85 = getelementptr inbounds i32, i32* %.1568, i64 1
  %86 = add nsw i32 %.12067, 1
  %87 = load i32, i32* %70, align 4
  %88 = icmp slt i32 %.12067, %87
  br i1 %88, label %.lr.ph70, label %._crit_edge71.loopexit

._crit_edge71.loopexit:                           ; preds = %.lr.ph70
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit, %76
  %indvars.iv.next99 = add i64 %indvars.iv98, 1
  %89 = load i32, i32* %3, align 4
  %90 = sext i32 %89 to i64
  %91 = icmp slt i64 %indvars.iv98, %90
  br i1 %91, label %76, label %._crit_edge75.loopexit

._crit_edge75.loopexit:                           ; preds = %._crit_edge71
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75.loopexit, %71
  %92 = getelementptr inbounds i32, i32* %.1777, i64 1
  %indvars.iv.next101 = add i64 %indvars.iv100, 1
  %93 = load i32, i32* %8, align 4
  %94 = sext i32 %93 to i64
  %95 = icmp slt i64 %indvars.iv100, %94
  br i1 %95, label %71, label %.sink.split.loopexit131

; <label>:96:                                     ; preds = %21
  %97 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %98 = load i32, i32* %97, align 8
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  %101 = load i32, i32* %100, align 4
  %102 = icmp sgt i32 %98, %101
  br i1 %102, label %.sink.split, label %.lr.ph65.preheader

.lr.ph65.preheader:                               ; preds = %96
  %103 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 %99
  br label %.lr.ph65

.lr.ph65:                                         ; preds = %.lr.ph65.preheader, %._crit_edge61
  %indvars.iv96 = phi i64 [ %99, %.lr.ph65.preheader ], [ %indvars.iv.next97, %._crit_edge61 ]
  %.2863 = phi i32* [ %103, %.lr.ph65.preheader ], [ %124, %._crit_edge61 ]
  store i32 0, i32* %.2863, align 4
  %104 = load i32, i32* %5, align 8
  %105 = load i32, i32* %3, align 4
  %106 = icmp sgt i32 %104, %105
  br i1 %106, label %._crit_edge61, label %.lr.ph60

.lr.ph60:                                         ; preds = %.lr.ph65
  %107 = sext i32 %104 to i64
  br label %108

; <label>:108:                                    ; preds = %._crit_edge57, %.lr.ph60
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge57 ], [ %107, %.lr.ph60 ]
  %109 = load i32, i32* %10, align 8
  %110 = load i32, i32* %8, align 4
  %111 = icmp sgt i32 %109, %110
  br i1 %111, label %._crit_edge57, label %.lr.ph56.preheader

.lr.ph56.preheader:                               ; preds = %108
  %112 = sext i32 %109 to i64
  %113 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv, i64 %112, i64 %indvars.iv96
  br label %.lr.ph56

.lr.ph56:                                         ; preds = %.lr.ph56.preheader, %.lr.ph56
  %.254 = phi i32* [ %117, %.lr.ph56 ], [ %113, %.lr.ph56.preheader ]
  %.21853 = phi i32 [ %118, %.lr.ph56 ], [ %109, %.lr.ph56.preheader ]
  %114 = load i32, i32* %.254, align 4
  %115 = load i32, i32* %.2863, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, i32* %.2863, align 4
  %117 = getelementptr inbounds i32, i32* %.254, i64 32
  %118 = add nsw i32 %.21853, 1
  %119 = load i32, i32* %8, align 4
  %120 = icmp slt i32 %.21853, %119
  br i1 %120, label %.lr.ph56, label %._crit_edge57.loopexit

._crit_edge57.loopexit:                           ; preds = %.lr.ph56
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57.loopexit, %108
  %indvars.iv.next = add i64 %indvars.iv, 1
  %121 = load i32, i32* %3, align 4
  %122 = sext i32 %121 to i64
  %123 = icmp slt i64 %indvars.iv, %122
  br i1 %123, label %108, label %._crit_edge61.loopexit

._crit_edge61.loopexit:                           ; preds = %._crit_edge57
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61.loopexit, %.lr.ph65
  %124 = getelementptr inbounds i32, i32* %.2863, i64 1
  %indvars.iv.next97 = add i64 %indvars.iv96, 1
  %125 = load i32, i32* %100, align 4
  %126 = sext i32 %125 to i64
  %127 = icmp slt i64 %indvars.iv96, %126
  br i1 %127, label %.lr.ph65, label %.sink.split.loopexit

.sink.split.loopexit:                             ; preds = %._crit_edge61
  br label %.sink.split

.sink.split.loopexit131:                          ; preds = %._crit_edge75
  br label %.sink.split

.sink.split.loopexit132:                          ; preds = %._crit_edge88
  br label %.sink.split

.sink.split:                                      ; preds = %.sink.split.loopexit132, %.sink.split.loopexit131, %.sink.split.loopexit, %.thread, %63, %96
  %.sink31 = phi i32* [ %97, %96 ], [ %10, %63 ], [ %5, %.thread ], [ %97, %.sink.split.loopexit ], [ %10, %.sink.split.loopexit131 ], [ %5, %.sink.split.loopexit132 ]
  %.127 = phi i32 [ 2, %96 ], [ 1, %63 ], [ 0, %.thread ], [ %., %.sink.split.loopexit ], [ %., %.sink.split.loopexit131 ], [ 0, %.sink.split.loopexit132 ]
  %.sink = phi i32* [ %100, %96 ], [ %8, %63 ], [ %3, %.thread ], [ %100, %.sink.split.loopexit ], [ %8, %.sink.split.loopexit131 ], [ %3, %.sink.split.loopexit132 ]
  %128 = load i32, i32* %.sink31, align 8
  %129 = load i32, i32* %.sink, align 4
  %130 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 8
  %131 = load i32, i32* %130, align 8
  %132 = sdiv i32 %131, 2
  %133 = sext i32 %128 to i64
  %134 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 %133
  %135 = icmp sgt i32 %128, %129
  br i1 %135, label %.thread30, label %.lr.ph49.preheader

.lr.ph49.preheader:                               ; preds = %.sink.split
  br label %.lr.ph49

.lr.ph49:                                         ; preds = %.lr.ph49.preheader, %139
  %.348 = phi i32* [ %140, %139 ], [ %134, %.lr.ph49.preheader ]
  %.0947 = phi i32 [ %141, %139 ], [ %128, %.lr.ph49.preheader ]
  %.02246 = phi i32 [ %137, %139 ], [ 0, %.lr.ph49.preheader ]
  %136 = load i32, i32* %.348, align 4
  %137 = add nsw i32 %136, %.02246
  %138 = icmp slt i32 %137, %132
  br i1 %138, label %139, label %.thread30.loopexit

; <label>:139:                                    ; preds = %.lr.ph49
  %140 = getelementptr inbounds i32, i32* %.348, i64 1
  %141 = add nsw i32 %.0947, 1
  %142 = icmp slt i32 %.0947, %129
  br i1 %142, label %.lr.ph49, label %.thread30.loopexit

.thread30.loopexit:                               ; preds = %.lr.ph49, %139
  %.09.lcssa.ph = phi i32 [ %141, %139 ], [ %.0947, %.lr.ph49 ]
  br label %.thread30

.thread30:                                        ; preds = %.thread30.loopexit, %.sink.split
  %.09.lcssa = phi i32 [ %128, %.sink.split ], [ %.09.lcssa.ph, %.thread30.loopexit ]
  %143 = icmp eq i32 %.09.lcssa, %128
  %144 = zext i1 %143 to i32
  %..09 = add nsw i32 %144, %.09.lcssa
  %145 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %146 = bitcast %struct.colorbox* %145 to i64*
  %147 = load i64, i64* %146, align 8
  store i64 %147, i64* bitcast (%struct.colorbox** @freeboxes to i64*), align 8
  %148 = icmp eq i64 %147, 0
  br i1 %148, label %152, label %149

; <label>:149:                                    ; preds = %.thread30
  %150 = load %struct.colorbox*, %struct.colorbox** @freeboxes, align 8
  %151 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %150, i64 0, i32 1
  store %struct.colorbox* null, %struct.colorbox** %151, align 8
  br label %152

; <label>:152:                                    ; preds = %.thread30, %149
  %153 = load %struct.colorbox*, %struct.colorbox** @usedboxes, align 8
  %154 = icmp eq %struct.colorbox* %153, null
  br i1 %154, label %157, label %155

; <label>:155:                                    ; preds = %152
  %156 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %153, i64 0, i32 1
  store %struct.colorbox* %145, %struct.colorbox** %156, align 8
  br label %157

; <label>:157:                                    ; preds = %152, %155
  %158 = load i64, i64* bitcast (%struct.colorbox** @usedboxes to i64*), align 8
  store i64 %158, i64* %146, align 8
  store %struct.colorbox* %145, %struct.colorbox** @usedboxes, align 8
  %159 = icmp slt i32 %128, %..09
  br i1 %159, label %.lr.ph43.preheader, label %.preheader

.lr.ph43.preheader:                               ; preds = %157
  %160 = add i32 %.09.lcssa, %144
  %161 = add i32 %160, -1
  %162 = sub i32 %161, %128
  %163 = zext i32 %162 to i64
  %164 = add nsw i64 %133, %163
  %165 = add nsw i64 %164, 1
  %166 = sub i32 %160, %128
  %167 = add i32 %.09.lcssa, %144
  %168 = add i32 %167, -1
  %169 = sub i32 %168, %128
  %xtraiter = and i32 %166, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph43.prol.loopexit, label %.lr.ph43.prol.preheader

.lr.ph43.prol.preheader:                          ; preds = %.lr.ph43.preheader
  br label %.lr.ph43.prol

.lr.ph43.prol:                                    ; preds = %.lr.ph43.prol.preheader, %.lr.ph43.prol
  %.541.prol = phi i32* [ %172, %.lr.ph43.prol ], [ %134, %.lr.ph43.prol.preheader ]
  %.01140.prol = phi i32 [ %173, %.lr.ph43.prol ], [ %128, %.lr.ph43.prol.preheader ]
  %.02439.prol = phi i32 [ %171, %.lr.ph43.prol ], [ 0, %.lr.ph43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph43.prol ], [ %xtraiter, %.lr.ph43.prol.preheader ]
  %170 = load i32, i32* %.541.prol, align 4
  %171 = add nsw i32 %170, %.02439.prol
  %172 = getelementptr inbounds i32, i32* %.541.prol, i64 1
  %173 = add nsw i32 %.01140.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph43.prol.loopexit.loopexit, label %.lr.ph43.prol, !llvm.loop !1

.lr.ph43.prol.loopexit.loopexit:                  ; preds = %.lr.ph43.prol
  br label %.lr.ph43.prol.loopexit

.lr.ph43.prol.loopexit:                           ; preds = %.lr.ph43.prol.loopexit.loopexit, %.lr.ph43.preheader
  %.541.unr = phi i32* [ %134, %.lr.ph43.preheader ], [ %172, %.lr.ph43.prol.loopexit.loopexit ]
  %.01140.unr = phi i32 [ %128, %.lr.ph43.preheader ], [ %173, %.lr.ph43.prol.loopexit.loopexit ]
  %.02439.unr = phi i32 [ 0, %.lr.ph43.preheader ], [ %171, %.lr.ph43.prol.loopexit.loopexit ]
  %.lcssa95.unr = phi i32 [ undef, %.lr.ph43.preheader ], [ %171, %.lr.ph43.prol.loopexit.loopexit ]
  %174 = icmp ult i32 %169, 7
  br i1 %174, label %.preheader.loopexit, label %.lr.ph43.preheader130

.lr.ph43.preheader130:                            ; preds = %.lr.ph43.prol.loopexit
  br label %.lr.ph43

.preheader.loopexit.loopexit:                     ; preds = %.lr.ph43
  br label %.preheader.loopexit

.preheader.loopexit:                              ; preds = %.preheader.loopexit.loopexit, %.lr.ph43.prol.loopexit
  %.lcssa95 = phi i32 [ %.lcssa95.unr, %.lr.ph43.prol.loopexit ], [ %233, %.preheader.loopexit.loopexit ]
  %scevgep = getelementptr [32 x i32], [32 x i32]* %2, i64 0, i64 %165
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %157
  %.024.lcssa = phi i32 [ 0, %157 ], [ %.lcssa95, %.preheader.loopexit ]
  %.5.lcssa = phi i32* [ %134, %157 ], [ %scevgep, %.preheader.loopexit ]
  %175 = icmp sgt i32 %..09, %129
  br i1 %175, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %176 = icmp sgt i32 %129, %..09
  %smax = select i1 %176, i32 %129, i32 %..09
  %177 = sub i32 %smax, %..09
  %178 = zext i32 %177 to i64
  %179 = add nuw nsw i64 %178, 1
  %min.iters.check = icmp ult i64 %179, 8
  br i1 %min.iters.check, label %.lr.ph.preheader129, label %min.iters.checked

.lr.ph.preheader129:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph.preheader
  %.0338.ph = phi i32 [ 0, %min.iters.checked ], [ 0, %.lr.ph.preheader ], [ %210, %middle.block ]
  %.637.ph = phi i32* [ %.5.lcssa, %min.iters.checked ], [ %.5.lcssa, %.lr.ph.preheader ], [ %ind.end, %middle.block ]
  %.11236.ph = phi i32 [ %..09, %min.iters.checked ], [ %..09, %.lr.ph.preheader ], [ %ind.end121, %middle.block ]
  br label %.lr.ph

min.iters.checked:                                ; preds = %.lr.ph.preheader
  %n.vec = and i64 %179, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = getelementptr i32, i32* %.5.lcssa, i64 %n.vec
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end121 = add i32 %..09, %cast.crd
  br i1 %cmp.zero, label %.lr.ph.preheader129, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %180 = add nsw i64 %n.vec, -8
  %181 = lshr exact i64 %180, 3
  %182 = add nuw nsw i64 %181, 1
  %xtraiter139 = and i64 %182, 3
  %lcmp.mod140 = icmp eq i64 %xtraiter139, 0
  br i1 %lcmp.mod140, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %vec.phi.prol = phi <4 x i32> [ %186, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %vec.phi122.prol = phi <4 x i32> [ %187, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %prol.iter141 = phi i64 [ %prol.iter141.sub, %vector.body.prol ], [ %xtraiter139, %vector.body.prol.preheader ]
  %next.gep.prol = getelementptr i32, i32* %.5.lcssa, i64 %index.prol
  %183 = bitcast i32* %next.gep.prol to <4 x i32>*
  %wide.load.prol = load <4 x i32>, <4 x i32>* %183, align 4
  %184 = getelementptr i32, i32* %next.gep.prol, i64 4
  %185 = bitcast i32* %184 to <4 x i32>*
  %wide.load125.prol = load <4 x i32>, <4 x i32>* %185, align 4
  %186 = add nsw <4 x i32> %wide.load.prol, %vec.phi.prol
  %187 = add nsw <4 x i32> %wide.load125.prol, %vec.phi122.prol
  %index.next.prol = add i64 %index.prol, 8
  %prol.iter141.sub = add i64 %prol.iter141, -1
  %prol.iter141.cmp = icmp eq i64 %prol.iter141.sub, 0
  br i1 %prol.iter141.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !3

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %.lcssa134.unr = phi <4 x i32> [ undef, %vector.body.preheader ], [ %186, %vector.body.prol.loopexit.unr-lcssa ]
  %.lcssa133.unr = phi <4 x i32> [ undef, %vector.body.preheader ], [ %187, %vector.body.prol.loopexit.unr-lcssa ]
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi.unr = phi <4 x i32> [ zeroinitializer, %vector.body.preheader ], [ %186, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.phi122.unr = phi <4 x i32> [ zeroinitializer, %vector.body.preheader ], [ %187, %vector.body.prol.loopexit.unr-lcssa ]
  %188 = icmp ult i64 %180, 24
  br i1 %188, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %vec.phi = phi <4 x i32> [ %vec.phi.unr, %vector.body.preheader.new ], [ %207, %vector.body ]
  %vec.phi122 = phi <4 x i32> [ %vec.phi122.unr, %vector.body.preheader.new ], [ %208, %vector.body ]
  %next.gep = getelementptr i32, i32* %.5.lcssa, i64 %index
  %189 = bitcast i32* %next.gep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %189, align 4
  %190 = getelementptr i32, i32* %next.gep, i64 4
  %191 = bitcast i32* %190 to <4 x i32>*
  %wide.load125 = load <4 x i32>, <4 x i32>* %191, align 4
  %192 = add nsw <4 x i32> %wide.load, %vec.phi
  %193 = add nsw <4 x i32> %wide.load125, %vec.phi122
  %index.next = add i64 %index, 8
  %next.gep.1 = getelementptr i32, i32* %.5.lcssa, i64 %index.next
  %194 = bitcast i32* %next.gep.1 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %194, align 4
  %195 = getelementptr i32, i32* %next.gep.1, i64 4
  %196 = bitcast i32* %195 to <4 x i32>*
  %wide.load125.1 = load <4 x i32>, <4 x i32>* %196, align 4
  %197 = add nsw <4 x i32> %wide.load.1, %192
  %198 = add nsw <4 x i32> %wide.load125.1, %193
  %index.next.1 = add i64 %index, 16
  %next.gep.2 = getelementptr i32, i32* %.5.lcssa, i64 %index.next.1
  %199 = bitcast i32* %next.gep.2 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %199, align 4
  %200 = getelementptr i32, i32* %next.gep.2, i64 4
  %201 = bitcast i32* %200 to <4 x i32>*
  %wide.load125.2 = load <4 x i32>, <4 x i32>* %201, align 4
  %202 = add nsw <4 x i32> %wide.load.2, %197
  %203 = add nsw <4 x i32> %wide.load125.2, %198
  %index.next.2 = add i64 %index, 24
  %next.gep.3 = getelementptr i32, i32* %.5.lcssa, i64 %index.next.2
  %204 = bitcast i32* %next.gep.3 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %204, align 4
  %205 = getelementptr i32, i32* %next.gep.3, i64 4
  %206 = bitcast i32* %205 to <4 x i32>*
  %wide.load125.3 = load <4 x i32>, <4 x i32>* %206, align 4
  %207 = add nsw <4 x i32> %wide.load.3, %202
  %208 = add nsw <4 x i32> %wide.load125.3, %203
  %index.next.3 = add i64 %index, 32
  %209 = icmp eq i64 %index.next.3, %n.vec
  br i1 %209, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !4

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa134 = phi <4 x i32> [ %.lcssa134.unr, %vector.body.prol.loopexit ], [ %207, %middle.block.unr-lcssa ]
  %.lcssa133 = phi <4 x i32> [ %.lcssa133.unr, %vector.body.prol.loopexit ], [ %208, %middle.block.unr-lcssa ]
  %bin.rdx = add <4 x i32> %.lcssa133, %.lcssa134
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx126 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf127 = shufflevector <4 x i32> %bin.rdx126, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx128 = add <4 x i32> %bin.rdx126, %rdx.shuf127
  %210 = extractelement <4 x i32> %bin.rdx128, i32 0
  %cmp.n = icmp eq i64 %179, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader129

.lr.ph43:                                         ; preds = %.lr.ph43.preheader130, %.lr.ph43
  %.541 = phi i32* [ %234, %.lr.ph43 ], [ %.541.unr, %.lr.ph43.preheader130 ]
  %.01140 = phi i32 [ %235, %.lr.ph43 ], [ %.01140.unr, %.lr.ph43.preheader130 ]
  %.02439 = phi i32 [ %233, %.lr.ph43 ], [ %.02439.unr, %.lr.ph43.preheader130 ]
  %211 = load i32, i32* %.541, align 4
  %212 = add nsw i32 %211, %.02439
  %213 = getelementptr inbounds i32, i32* %.541, i64 1
  %214 = load i32, i32* %213, align 4
  %215 = add nsw i32 %214, %212
  %216 = getelementptr inbounds i32, i32* %.541, i64 2
  %217 = load i32, i32* %216, align 4
  %218 = add nsw i32 %217, %215
  %219 = getelementptr inbounds i32, i32* %.541, i64 3
  %220 = load i32, i32* %219, align 4
  %221 = add nsw i32 %220, %218
  %222 = getelementptr inbounds i32, i32* %.541, i64 4
  %223 = load i32, i32* %222, align 4
  %224 = add nsw i32 %223, %221
  %225 = getelementptr inbounds i32, i32* %.541, i64 5
  %226 = load i32, i32* %225, align 4
  %227 = add nsw i32 %226, %224
  %228 = getelementptr inbounds i32, i32* %.541, i64 6
  %229 = load i32, i32* %228, align 4
  %230 = add nsw i32 %229, %227
  %231 = getelementptr inbounds i32, i32* %.541, i64 7
  %232 = load i32, i32* %231, align 4
  %233 = add nsw i32 %232, %230
  %234 = getelementptr inbounds i32, i32* %.541, i64 8
  %235 = add nsw i32 %.01140, 8
  %exitcond.7 = icmp eq i32 %235, %..09
  br i1 %exitcond.7, label %.preheader.loopexit.loopexit, label %.lr.ph43

.lr.ph:                                           ; preds = %.lr.ph.preheader129, %.lr.ph
  %.0338 = phi i32 [ %237, %.lr.ph ], [ %.0338.ph, %.lr.ph.preheader129 ]
  %.637 = phi i32* [ %238, %.lr.ph ], [ %.637.ph, %.lr.ph.preheader129 ]
  %.11236 = phi i32 [ %239, %.lr.ph ], [ %.11236.ph, %.lr.ph.preheader129 ]
  %236 = load i32, i32* %.637, align 4
  %237 = add nsw i32 %236, %.0338
  %238 = getelementptr inbounds i32, i32* %.637, i64 1
  %239 = add nsw i32 %.11236, 1
  %240 = icmp slt i32 %.11236, %129
  br i1 %240, label %.lr.ph, label %._crit_edge.loopexit, !llvm.loop !7

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.preheader
  %.03.lcssa = phi i32 [ 0, %.preheader ], [ %210, %middle.block ], [ %237, %._crit_edge.loopexit ]
  %241 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %145, i64 0, i32 8
  store i32 %.024.lcssa, i32* %241, align 8
  store i32 %.03.lcssa, i32* %130, align 8
  %242 = load i32, i32* %5, align 8
  %243 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %145, i64 0, i32 2
  store i32 %242, i32* %243, align 8
  %244 = load i32, i32* %3, align 4
  %245 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %145, i64 0, i32 3
  store i32 %244, i32* %245, align 4
  %246 = load i32, i32* %10, align 8
  %247 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %145, i64 0, i32 4
  store i32 %246, i32* %247, align 8
  %248 = load i32, i32* %8, align 4
  %249 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %145, i64 0, i32 5
  store i32 %248, i32* %249, align 4
  %250 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %251 = load i32, i32* %250, align 8
  %252 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %145, i64 0, i32 6
  store i32 %251, i32* %252, align 8
  %253 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  %254 = load i32, i32* %253, align 4
  %255 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %145, i64 0, i32 7
  store i32 %254, i32* %255, align 4
  %trunc = trunc i32 %.127 to i2
  switch i2 %trunc, label %259 [
    i2 0, label %256
    i2 1, label %.sink.split25
    i2 -2, label %257
  ]

; <label>:256:                                    ; preds = %._crit_edge
  br label %.sink.split25

; <label>:257:                                    ; preds = %._crit_edge
  br label %.sink.split25

.sink.split25:                                    ; preds = %._crit_edge, %256, %257
  %.sink33 = phi i32* [ %245, %256 ], [ %255, %257 ], [ %249, %._crit_edge ]
  %.sink26 = phi i32* [ %5, %256 ], [ %250, %257 ], [ %10, %._crit_edge ]
  %258 = add nsw i32 %..09, -1
  store i32 %258, i32* %.sink33, align 4
  store i32 %..09, i32* %.sink26, align 8
  br label %259

; <label>:259:                                    ; preds = %.sink.split25, %._crit_edge
  tail call fastcc void @shrinkbox(%struct.colorbox* nonnull %145)
  tail call fastcc void @shrinkbox(%struct.colorbox* nonnull %0)
  ret void
}

declare void @_TIFFfree(i8*) local_unnamed_addr #4

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @map_colortable() unnamed_addr #0 {
  br label %.preheader8

.preheader8:                                      ; preds = %65, %0
  %.020 = phi i32* [ getelementptr inbounds ([32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 0, i64 0, i64 0), %0 ], [ %scevgep21, %65 ]
  %.0619 = phi i32 [ 0, %0 ], [ %66, %65 ]
  %1 = lshr i32 %.0619, 3
  %2 = shl i32 %1, 4
  %3 = shl i32 %.0619, 3
  %4 = shl i32 %.0619, 3
  br label %.preheader

.preheader:                                       ; preds = %63, %.preheader8
  %.118 = phi i32* [ %.020, %.preheader8 ], [ %scevgep, %63 ]
  %.0717 = phi i32 [ 0, %.preheader8 ], [ %64, %63 ]
  %5 = ashr i32 %.0717, 3
  %6 = shl nsw i32 %5, 2
  %7 = add nsw i32 %6, %2
  %8 = shl i32 %.0717, 3
  %9 = shl i32 %.0717, 3
  br label %10

; <label>:10:                                     ; preds = %.critedge, %.preheader
  %.214 = phi i32* [ %.118, %.preheader ], [ %62, %.critedge ]
  %.0312 = phi i32 [ 0, %.preheader ], [ %61, %.critedge ]
  %11 = load i32, i32* %.214, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  store i32 -1, i32* %.214, align 4
  br label %.critedge

; <label>:14:                                     ; preds = %10
  %15 = load %struct.C_cell**, %struct.C_cell*** @ColorCells, align 8
  %16 = ashr i32 %.0312, 3
  %17 = add nsw i32 %7, %16
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %15, i64 %18
  %20 = load %struct.C_cell*, %struct.C_cell** %19, align 8
  %21 = icmp eq %struct.C_cell* %20, null
  br i1 %21, label %22, label %25

; <label>:22:                                     ; preds = %14
  %23 = shl i32 %.0312, 3
  %24 = tail call fastcc %struct.C_cell* @create_colorcell(i32 %3, i32 %8, i32 %23)
  br label %25

; <label>:25:                                     ; preds = %22, %14
  %.01 = phi %struct.C_cell* [ %24, %22 ], [ %20, %14 ]
  %26 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %.01, i64 0, i32 0
  %27 = load i32, i32* %26, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %.lr.ph, label %.critedge

.lr.ph:                                           ; preds = %25
  %29 = shl i32 %.0312, 3
  br label %30

; <label>:30:                                     ; preds = %.lr.ph, %57
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %57 ]
  %.049 = phi i32 [ 9999999, %.lr.ph ], [ %.15, %57 ]
  %31 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %.01, i64 0, i32 1, i64 %indvars.iv, i64 1
  %32 = load i32, i32* %31, align 4
  %33 = icmp sgt i32 %.049, %32
  br i1 %33, label %34, label %.critedge.loopexit

; <label>:34:                                     ; preds = %30
  %35 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %.01, i64 0, i32 1, i64 %indvars.iv, i64 0
  %36 = load i32, i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %37
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = sub nsw i32 %40, %4
  %42 = mul nsw i32 %41, %41
  %43 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %37
  %44 = load i16, i16* %43, align 2
  %45 = zext i16 %44 to i32
  %46 = sub nsw i32 %45, %9
  %47 = mul nsw i32 %46, %46
  %48 = add nuw nsw i32 %47, %42
  %49 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %37
  %50 = load i16, i16* %49, align 2
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %51, %29
  %53 = mul nsw i32 %52, %52
  %54 = add nuw nsw i32 %48, %53
  %55 = icmp slt i32 %54, %.049
  br i1 %55, label %56, label %57

; <label>:56:                                     ; preds = %34
  store i32 %36, i32* %.214, align 4
  br label %57

; <label>:57:                                     ; preds = %34, %56
  %.15 = phi i32 [ %54, %56 ], [ %.049, %34 ]
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %58 = load i32, i32* %26, align 4
  %59 = sext i32 %58 to i64
  %60 = icmp slt i64 %indvars.iv.next, %59
  br i1 %60, label %30, label %.critedge.loopexit

.critedge.loopexit:                               ; preds = %30, %57
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %25, %13
  %61 = add nuw nsw i32 %.0312, 1
  %62 = getelementptr inbounds i32, i32* %.214, i64 1
  %exitcond = icmp eq i32 %61, 32
  br i1 %exitcond, label %63, label %10

; <label>:63:                                     ; preds = %.critedge
  %scevgep = getelementptr i32, i32* %.118, i64 32
  %64 = add nuw nsw i32 %.0717, 1
  %exitcond22 = icmp eq i32 %64, 32
  br i1 %exitcond22, label %65, label %.preheader

; <label>:65:                                     ; preds = %63
  %scevgep21 = getelementptr i32, i32* %.020, i64 1024
  %66 = add nuw nsw i32 %.0619, 1
  %exitcond23 = icmp eq i32 %66, 32
  br i1 %exitcond23, label %67, label %.preheader8

; <label>:67:                                     ; preds = %65
  ret void
}

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #4

declare i32 @TIFFDefaultStripSize(%struct.tiff*, i32) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @quant_fsdither(%struct.tiff*, %struct.tiff*) unnamed_addr #0 {
  %3 = load i32, i32* @imagelength, align 4
  %4 = add i32 %3, -1
  %5 = load i32, i32* @imagewidth, align 4
  %6 = add i32 %5, -1
  %7 = tail call i32 @TIFFScanlineSize(%struct.tiff* %0) #8
  %8 = tail call i8* @_TIFFmalloc(i32 %7) #8
  %9 = load i32, i32* @imagewidth, align 4
  %10 = mul i32 %9, 6
  %11 = tail call i8* @_TIFFmalloc(i32 %10) #8
  %12 = bitcast i8* %11 to i16*
  %13 = load i32, i32* @imagewidth, align 4
  %14 = mul i32 %13, 6
  %15 = tail call i8* @_TIFFmalloc(i32 %14) #8
  %16 = bitcast i8* %15 to i16*
  %17 = tail call i32 @TIFFScanlineSize(%struct.tiff* %1) #8
  %18 = tail call i8* @_TIFFmalloc(i32 %17) #8
  %19 = tail call i32 @TIFFReadScanline(%struct.tiff* %0, i8* %8, i32 0, i16 zeroext 0) #8
  %20 = icmp slt i32 %19, 1
  br i1 %20, label %.loopexit, label %.preheader36

.preheader36:                                     ; preds = %2
  %21 = load i32, i32* @imagewidth, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %.preheader34, label %.lr.ph66.preheader

.lr.ph66.preheader:                               ; preds = %.preheader36
  br label %.lr.ph66

.preheader34.loopexit:                            ; preds = %.lr.ph66
  br label %.preheader34

.preheader34:                                     ; preds = %.preheader34.loopexit, %.preheader36
  %23 = load i32, i32* @imagelength, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %.loopexit, label %.lr.ph54.preheader

.lr.ph54.preheader:                               ; preds = %.preheader34
  br label %.lr.ph54

.lr.ph66:                                         ; preds = %.lr.ph66.preheader, %.lr.ph66
  %.0365 = phi i8* [ %36, %.lr.ph66 ], [ %8, %.lr.ph66.preheader ]
  %.01264 = phi i16* [ %35, %.lr.ph66 ], [ %16, %.lr.ph66.preheader ]
  %.01663 = phi i32 [ %37, %.lr.ph66 ], [ 0, %.lr.ph66.preheader ]
  %25 = getelementptr inbounds i8, i8* %.0365, i64 1
  %26 = load i8, i8* %.0365, align 1
  %27 = zext i8 %26 to i16
  %28 = getelementptr inbounds i16, i16* %.01264, i64 1
  store i16 %27, i16* %.01264, align 2
  %29 = getelementptr inbounds i8, i8* %.0365, i64 2
  %30 = load i8, i8* %25, align 1
  %31 = zext i8 %30 to i16
  %32 = getelementptr inbounds i16, i16* %.01264, i64 2
  store i16 %31, i16* %28, align 2
  %33 = load i8, i8* %29, align 1
  %34 = zext i8 %33 to i16
  store i16 %34, i16* %32, align 2
  %35 = getelementptr inbounds i16, i16* %.01264, i64 3
  %36 = getelementptr inbounds i8, i8* %.0365, i64 3
  %37 = add i32 %.01663, 1
  %38 = load i32, i32* @imagewidth, align 4
  %39 = icmp ult i32 %37, %38
  br i1 %39, label %.lr.ph66, label %.preheader34.loopexit

.lr.ph54:                                         ; preds = %.lr.ph54.preheader, %._crit_edge
  %.0553 = phi i16* [ %.0752, %._crit_edge ], [ %12, %.lr.ph54.preheader ]
  %40 = phi i8* [ %42, %._crit_edge ], [ %11, %.lr.ph54.preheader ]
  %41 = phi i8* [ %43, %._crit_edge ], [ %11, %.lr.ph54.preheader ]
  %.0752 = phi i16* [ %.0553, %._crit_edge ], [ %16, %.lr.ph54.preheader ]
  %42 = phi i8* [ %40, %._crit_edge ], [ %15, %.lr.ph54.preheader ]
  %43 = phi i8* [ %41, %._crit_edge ], [ %15, %.lr.ph54.preheader ]
  %.01551 = phi i32 [ %253, %._crit_edge ], [ 1, %.lr.ph54.preheader ]
  %44 = icmp ult i32 %.01551, %4
  %45 = icmp ugt i32 %.01551, %4
  br i1 %45, label %.preheader33, label %46

; <label>:46:                                     ; preds = %.lr.ph54
  %47 = tail call i32 @TIFFReadScanline(%struct.tiff* %0, i8* %8, i32 %.01551, i16 zeroext 0) #8
  %48 = icmp slt i32 %47, 1
  br i1 %48, label %.loopexit.loopexit, label %.preheader33

.preheader33:                                     ; preds = %46, %.lr.ph54
  %49 = load i32, i32* @imagewidth, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader33
  br label %.lr.ph

.preheader:                                       ; preds = %.lr.ph
  %51 = icmp eq i32 %65, 0
  br i1 %51, label %._crit_edge, label %.lr.ph50.preheader

.lr.ph50.preheader:                               ; preds = %.preheader
  br label %.lr.ph50

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.1439 = phi i8* [ %63, %.lr.ph ], [ %8, %.lr.ph.preheader ]
  %.11338 = phi i16* [ %62, %.lr.ph ], [ %.0553, %.lr.ph.preheader ]
  %.11737 = phi i32 [ %64, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %52 = getelementptr inbounds i8, i8* %.1439, i64 1
  %53 = load i8, i8* %.1439, align 1
  %54 = zext i8 %53 to i16
  %55 = getelementptr inbounds i16, i16* %.11338, i64 1
  store i16 %54, i16* %.11338, align 2
  %56 = getelementptr inbounds i8, i8* %.1439, i64 2
  %57 = load i8, i8* %52, align 1
  %58 = zext i8 %57 to i16
  %59 = getelementptr inbounds i16, i16* %.11338, i64 2
  store i16 %58, i16* %55, align 2
  %60 = load i8, i8* %56, align 1
  %61 = zext i8 %60 to i16
  store i16 %61, i16* %59, align 2
  %62 = getelementptr inbounds i16, i16* %.11338, i64 3
  %63 = getelementptr inbounds i8, i8* %.1439, i64 3
  %64 = add i32 %.11737, 1
  %65 = load i32, i32* @imagewidth, align 4
  %66 = icmp ult i32 %64, %65
  br i1 %66, label %.lr.ph, label %.preheader

.lr.ph50:                                         ; preds = %.lr.ph50.preheader, %246
  %.01049 = phi i8* [ %144, %246 ], [ %18, %.lr.ph50.preheader ]
  %.01148 = phi i16* [ %80, %246 ], [ %.0752, %.lr.ph50.preheader ]
  %.21447 = phi i16* [ %.3, %246 ], [ %.0553, %.lr.ph50.preheader ]
  %.21846 = phi i32 [ %247, %246 ], [ 0, %.lr.ph50.preheader ]
  %67 = icmp eq i32 %.21846, %6
  %68 = getelementptr inbounds i16, i16* %.01148, i64 1
  %69 = load i16, i16* %.01148, align 2
  %70 = icmp slt i16 %69, 0
  %71 = icmp slt i16 %69, 255
  %.30 = select i1 %71, i16 %69, i16 255
  %72 = sext i16 %.30 to i32
  %.. = select i1 %70, i32 0, i32 %72
  %73 = ashr i32 %.., 3
  %74 = getelementptr inbounds i16, i16* %.01148, i64 2
  %75 = load i16, i16* %68, align 2
  %76 = icmp slt i16 %75, 0
  %77 = icmp slt i16 %75, 255
  %.2831 = select i1 %77, i16 %75, i16 255
  %78 = sext i16 %.2831 to i32
  %.122 = select i1 %76, i32 0, i32 %78
  %79 = ashr i32 %.122, 3
  %80 = getelementptr inbounds i16, i16* %.01148, i64 3
  %81 = load i16, i16* %74, align 2
  %82 = icmp slt i16 %81, 0
  %83 = icmp slt i16 %81, 255
  %.2932 = select i1 %83, i16 %81, i16 255
  %84 = sext i16 %.2932 to i32
  %..29 = select i1 %82, i32 0, i32 %84
  %85 = ashr i32 %..29, 3
  %86 = sext i32 %73 to i64
  %87 = sext i32 %79 to i64
  %88 = sext i32 %85 to i64
  %89 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %86, i64 %87, i64 %88
  %90 = load i32, i32* %89, align 4
  %91 = icmp eq i32 %90, -1
  br i1 %91, label %92, label %142

; <label>:92:                                     ; preds = %.lr.ph50
  %93 = load %struct.C_cell**, %struct.C_cell*** @ColorCells, align 8
  %94 = ashr i32 %.., 6
  %95 = shl nsw i32 %94, 4
  %96 = ashr i32 %.122, 6
  %97 = shl nsw i32 %96, 2
  %98 = add nsw i32 %97, %95
  %99 = ashr i32 %..29, 6
  %100 = add nsw i32 %98, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %93, i64 %101
  %103 = load %struct.C_cell*, %struct.C_cell** %102, align 8
  %104 = icmp eq %struct.C_cell* %103, null
  br i1 %104, label %105, label %107

; <label>:105:                                    ; preds = %92
  %106 = tail call fastcc %struct.C_cell* @create_colorcell(i32 %.., i32 %.122, i32 %..29)
  br label %107

; <label>:107:                                    ; preds = %105, %92
  %.0 = phi %struct.C_cell* [ %106, %105 ], [ %103, %92 ]
  %108 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %.0, i64 0, i32 0
  %109 = load i32, i32* %108, align 4
  %110 = icmp sgt i32 %109, 0
  br i1 %110, label %.lr.ph43.preheader, label %.critedge

.lr.ph43.preheader:                               ; preds = %107
  br label %.lr.ph43

.lr.ph43:                                         ; preds = %.lr.ph43.preheader, %114
  %indvars.iv = phi i64 [ %indvars.iv.next, %114 ], [ 0, %.lr.ph43.preheader ]
  %.0142 = phi i32 [ %..01, %114 ], [ 9999999, %.lr.ph43.preheader ]
  %.02540 = phi i32 [ %..025, %114 ], [ -1, %.lr.ph43.preheader ]
  %111 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %.0, i64 0, i32 1, i64 %indvars.iv, i64 1
  %112 = load i32, i32* %111, align 4
  %113 = icmp sgt i32 %.0142, %112
  br i1 %113, label %114, label %.critedge.loopexit

; <label>:114:                                    ; preds = %.lr.ph43
  %115 = getelementptr inbounds %struct.C_cell, %struct.C_cell* %.0, i64 0, i32 1, i64 %indvars.iv, i64 0
  %116 = load i32, i32* %115, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %117
  %119 = load i16, i16* %118, align 2
  %120 = zext i16 %119 to i32
  %121 = lshr i32 %120, 3
  %122 = sub nsw i32 %121, %73
  %123 = mul nsw i32 %122, %122
  %124 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %117
  %125 = load i16, i16* %124, align 2
  %126 = zext i16 %125 to i32
  %127 = lshr i32 %126, 3
  %128 = sub nsw i32 %127, %79
  %129 = mul nsw i32 %128, %128
  %130 = add nuw nsw i32 %129, %123
  %131 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %117
  %132 = load i16, i16* %131, align 2
  %133 = zext i16 %132 to i32
  %134 = lshr i32 %133, 3
  %135 = sub nsw i32 %134, %85
  %136 = mul nsw i32 %135, %135
  %137 = add nuw nsw i32 %130, %136
  %138 = icmp slt i32 %137, %.0142
  %..025 = select i1 %138, i32 %116, i32 %.02540
  %..01 = select i1 %138, i32 %137, i32 %.0142
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %139 = load i32, i32* %108, align 4
  %140 = sext i32 %139 to i64
  %141 = icmp slt i64 %indvars.iv.next, %140
  br i1 %141, label %.lr.ph43, label %.critedge.loopexit

.critedge.loopexit:                               ; preds = %114, %.lr.ph43
  %.025.lcssa.ph = phi i32 [ %..025, %114 ], [ %.02540, %.lr.ph43 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %107
  %.025.lcssa = phi i32 [ -1, %107 ], [ %.025.lcssa.ph, %.critedge.loopexit ]
  store i32 %.025.lcssa, i32* %89, align 4
  br label %142

; <label>:142:                                    ; preds = %.critedge, %.lr.ph50
  %.227 = phi i32 [ %.025.lcssa, %.critedge ], [ %90, %.lr.ph50 ]
  %143 = trunc i32 %.227 to i8
  %144 = getelementptr inbounds i8, i8* %.01049, i64 1
  store i8 %143, i8* %.01049, align 1
  %145 = sext i32 %.227 to i64
  %146 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %145
  %147 = load i16, i16* %146, align 2
  %148 = zext i16 %147 to i32
  %149 = sub nsw i32 %.., %148
  %150 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %145
  %151 = load i16, i16* %150, align 2
  %152 = zext i16 %151 to i32
  %153 = sub nsw i32 %.122, %152
  %154 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %145
  %155 = load i16, i16* %154, align 2
  %156 = zext i16 %155 to i32
  %157 = sub nsw i32 %..29, %156
  br i1 %67, label %179, label %158

; <label>:158:                                    ; preds = %142
  %159 = mul nsw i32 %157, 7
  %160 = sdiv i32 %159, 16
  %161 = load i16, i16* %80, align 2
  %162 = zext i16 %161 to i32
  %163 = add nsw i32 %162, %160
  %164 = trunc i32 %163 to i16
  store i16 %164, i16* %80, align 2
  %165 = mul nsw i32 %153, 7
  %166 = sdiv i32 %165, 16
  %167 = getelementptr inbounds i16, i16* %.01148, i64 4
  %168 = load i16, i16* %167, align 2
  %169 = zext i16 %168 to i32
  %170 = add nsw i32 %169, %166
  %171 = trunc i32 %170 to i16
  store i16 %171, i16* %167, align 2
  %172 = mul nsw i32 %149, 7
  %173 = sdiv i32 %172, 16
  %174 = getelementptr inbounds i16, i16* %.01148, i64 5
  %175 = load i16, i16* %174, align 2
  %176 = zext i16 %175 to i32
  %177 = add nsw i32 %176, %173
  %178 = trunc i32 %177 to i16
  store i16 %178, i16* %174, align 2
  br label %179

; <label>:179:                                    ; preds = %158, %142
  br i1 %44, label %180, label %246

; <label>:180:                                    ; preds = %179
  %181 = icmp eq i32 %.21846, 0
  br i1 %181, label %204, label %182

; <label>:182:                                    ; preds = %180
  %183 = mul nsw i32 %157, 3
  %184 = sdiv i32 %183, 16
  %185 = getelementptr inbounds i16, i16* %.21447, i64 -3
  %186 = load i16, i16* %185, align 2
  %187 = zext i16 %186 to i32
  %188 = add nsw i32 %187, %184
  %189 = trunc i32 %188 to i16
  store i16 %189, i16* %185, align 2
  %190 = mul nsw i32 %153, 3
  %191 = sdiv i32 %190, 16
  %192 = getelementptr inbounds i16, i16* %.21447, i64 -2
  %193 = load i16, i16* %192, align 2
  %194 = zext i16 %193 to i32
  %195 = add nsw i32 %194, %191
  %196 = trunc i32 %195 to i16
  store i16 %196, i16* %192, align 2
  %197 = mul nsw i32 %149, 3
  %198 = sdiv i32 %197, 16
  %199 = getelementptr inbounds i16, i16* %.21447, i64 -1
  %200 = load i16, i16* %199, align 2
  %201 = zext i16 %200 to i32
  %202 = add nsw i32 %201, %198
  %203 = trunc i32 %202 to i16
  store i16 %203, i16* %199, align 2
  br label %204

; <label>:204:                                    ; preds = %180, %182
  %205 = mul nsw i32 %157, 5
  %206 = sdiv i32 %205, 16
  %207 = load i16, i16* %.21447, align 2
  %208 = zext i16 %207 to i32
  %209 = add nsw i32 %208, %206
  %210 = trunc i32 %209 to i16
  store i16 %210, i16* %.21447, align 2
  %211 = mul nsw i32 %153, 5
  %212 = sdiv i32 %211, 16
  %213 = getelementptr inbounds i16, i16* %.21447, i64 1
  %214 = load i16, i16* %213, align 2
  %215 = zext i16 %214 to i32
  %216 = add nsw i32 %215, %212
  %217 = trunc i32 %216 to i16
  store i16 %217, i16* %213, align 2
  %218 = mul nsw i32 %149, 5
  %219 = sdiv i32 %218, 16
  %220 = getelementptr inbounds i16, i16* %.21447, i64 2
  %221 = load i16, i16* %220, align 2
  %222 = zext i16 %221 to i32
  %223 = add nsw i32 %222, %219
  %224 = trunc i32 %223 to i16
  store i16 %224, i16* %220, align 2
  br i1 %67, label %244, label %225

; <label>:225:                                    ; preds = %204
  %226 = sdiv i32 %157, 16
  %227 = getelementptr inbounds i16, i16* %.21447, i64 3
  %228 = load i16, i16* %227, align 2
  %229 = zext i16 %228 to i32
  %230 = add nsw i32 %229, %226
  %231 = trunc i32 %230 to i16
  store i16 %231, i16* %227, align 2
  %232 = sdiv i32 %153, 16
  %233 = getelementptr inbounds i16, i16* %.21447, i64 4
  %234 = load i16, i16* %233, align 2
  %235 = zext i16 %234 to i32
  %236 = add nsw i32 %235, %232
  %237 = trunc i32 %236 to i16
  store i16 %237, i16* %233, align 2
  %238 = sdiv i32 %149, 16
  %239 = getelementptr inbounds i16, i16* %.21447, i64 5
  %240 = load i16, i16* %239, align 2
  %241 = zext i16 %240 to i32
  %242 = add nsw i32 %241, %238
  %243 = trunc i32 %242 to i16
  store i16 %243, i16* %239, align 2
  br label %244

; <label>:244:                                    ; preds = %225, %204
  %245 = getelementptr inbounds i16, i16* %.21447, i64 3
  br label %246

; <label>:246:                                    ; preds = %244, %179
  %.3 = phi i16* [ %.21447, %179 ], [ %245, %244 ]
  %247 = add i32 %.21846, 1
  %248 = load i32, i32* @imagewidth, align 4
  %249 = icmp ult i32 %247, %248
  br i1 %249, label %.lr.ph50, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %246
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader33, %.preheader
  %250 = add i32 %.01551, -1
  %251 = tail call i32 @TIFFWriteScanline(%struct.tiff* %1, i8* %18, i32 %250, i16 zeroext 0) #8
  %252 = icmp slt i32 %251, 0
  %253 = add i32 %.01551, 1
  %254 = load i32, i32* @imagelength, align 4
  %255 = icmp ugt i32 %253, %254
  %or.cond = or i1 %252, %255
  br i1 %or.cond, label %.loopexit.loopexit, label %.lr.ph54

.loopexit.loopexit:                               ; preds = %46, %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader34, %2
  %256 = phi i8* [ %15, %2 ], [ %15, %.preheader34 ], [ %40, %.loopexit.loopexit ]
  %257 = phi i8* [ %11, %2 ], [ %11, %.preheader34 ], [ %43, %.loopexit.loopexit ]
  tail call void @_TIFFfree(i8* %8) #8
  tail call void @_TIFFfree(i8* %257) #8
  tail call void @_TIFFfree(i8* %256) #8
  tail call void @_TIFFfree(i8* %18) #8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @quant(%struct.tiff*, %struct.tiff*) unnamed_addr #0 {
  %3 = tail call i32 @TIFFScanlineSize(%struct.tiff* %0) #8
  %4 = tail call i8* @_TIFFmalloc(i32 %3) #8
  %5 = load i32, i32* @imagewidth, align 4
  %6 = tail call i8* @_TIFFmalloc(i32 %5) #8
  %7 = load i32, i32* @imagelength, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %._crit_edge10, label %.lr.ph9.preheader

.lr.ph9.preheader:                                ; preds = %2
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %._crit_edge
  %.017 = phi i32 [ %34, %._crit_edge ], [ 0, %.lr.ph9.preheader ]
  %9 = tail call i32 @TIFFReadScanline(%struct.tiff* %0, i8* %4, i32 %.017, i16 zeroext 0) #8
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %._crit_edge10.loopexit, label %.preheader

.preheader:                                       ; preds = %.lr.ph9
  %11 = load i32, i32* @imagewidth, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.06 = phi i32 [ %29, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.025 = phi i8* [ %28, %.lr.ph ], [ %4, %.lr.ph.preheader ]
  %.034 = phi i8* [ %27, %.lr.ph ], [ %6, %.lr.ph.preheader ]
  %13 = getelementptr inbounds i8, i8* %.025, i64 1
  %14 = load i8, i8* %.025, align 1
  %15 = zext i8 %14 to i64
  %16 = lshr i64 %15, 3
  %17 = getelementptr inbounds i8, i8* %.025, i64 2
  %18 = load i8, i8* %13, align 1
  %19 = zext i8 %18 to i64
  %20 = lshr i64 %19, 3
  %21 = load i8, i8* %17, align 1
  %22 = zext i8 %21 to i64
  %23 = lshr i64 %22, 3
  %24 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %16, i64 %20, i64 %23
  %25 = load i32, i32* %24, align 4
  %26 = trunc i32 %25 to i8
  store i8 %26, i8* %.034, align 1
  %27 = getelementptr inbounds i8, i8* %.034, i64 1
  %28 = getelementptr inbounds i8, i8* %.025, i64 3
  %29 = add i32 %.06, 1
  %30 = load i32, i32* @imagewidth, align 4
  %31 = icmp ult i32 %29, %30
  br i1 %31, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %32 = tail call i32 @TIFFWriteScanline(%struct.tiff* %1, i8* %6, i32 %.017, i16 zeroext 0) #8
  %33 = icmp sgt i32 %32, -1
  %34 = add i32 %.017, 1
  %35 = load i32, i32* @imagelength, align 4
  %36 = icmp ult i32 %34, %35
  %or.cond = and i1 %33, %36
  br i1 %or.cond, label %.lr.ph9, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge, %.lr.ph9
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %2
  tail call void @_TIFFfree(i8* %4) #8
  tail call void @_TIFFfree(i8* %6) #8
  ret void
}

declare void @TIFFClose(%struct.tiff*) local_unnamed_addr #4

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE* nocapture, i8*) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #7

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #4

declare i32 @TIFFReadScanline(%struct.tiff*, i8*, i32, i16 zeroext) local_unnamed_addr #4

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @shrinkbox(%struct.colorbox*) unnamed_addr #6 {
  %2 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 2
  %5 = load i32, i32* %4, align 8
  %6 = icmp sgt i32 %3, %5
  br i1 %6, label %.preheader27, label %.loopexit26

.preheader27:                                     ; preds = %1
  %7 = load i32, i32* %2, align 4
  %8 = icmp sgt i32 %5, %7
  br i1 %8, label %.loopexit28, label %.lr.ph149

.lr.ph149:                                        ; preds = %.preheader27
  %9 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 4
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 5
  %12 = load i32, i32* %11, align 4
  %13 = icmp sgt i32 %10, %12
  %14 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  br i1 %13, label %.lr.ph149.split.us.preheader, label %.lr.ph149.split.preheader

.lr.ph149.split.us.preheader:                     ; preds = %.lr.ph149
  %15 = load i32, i32* %2, align 4
  br label %.lr.ph149.split.us

.lr.ph149.split.preheader:                        ; preds = %.lr.ph149
  %16 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %17 = sext i32 %10 to i64
  %18 = sext i32 %5 to i64
  %19 = load i32, i32* %16, align 8
  %20 = sext i32 %19 to i64
  %21 = load i32, i32* %14, align 4
  %22 = icmp sgt i32 %19, %21
  br label %.lr.ph149.split

.lr.ph149.split.us:                               ; preds = %.lr.ph149.split.us.preheader, %.lr.ph149.split.us
  %.07146.us = phi i32 [ %23, %.lr.ph149.split.us ], [ %5, %.lr.ph149.split.us.preheader ]
  %23 = add nsw i32 %.07146.us, 1
  %24 = icmp slt i32 %.07146.us, %15
  br i1 %24, label %.lr.ph149.split.us, label %.loopexit28.loopexit

.lr.ph149.split:                                  ; preds = %.lr.ph149.split.preheader, %._crit_edge144
  %indvars.iv195 = phi i64 [ %18, %.lr.ph149.split.preheader ], [ %indvars.iv.next196, %._crit_edge144 ]
  br i1 %22, label %.lr.ph143.split.us.preheader, label %.lr.ph143.split.preheader

.lr.ph143.split.preheader:                        ; preds = %.lr.ph149.split
  br label %.lr.ph143.split

.lr.ph143.split.us.preheader:                     ; preds = %.lr.ph149.split
  %25 = load i32, i32* %11, align 4
  br label %.lr.ph143.split.us

.lr.ph143.split.us:                               ; preds = %.lr.ph143.split.us.preheader, %.lr.ph143.split.us
  %.013141.us = phi i32 [ %26, %.lr.ph143.split.us ], [ %10, %.lr.ph143.split.us.preheader ]
  %26 = add nsw i32 %.013141.us, 1
  %27 = icmp slt i32 %.013141.us, %25
  br i1 %27, label %.lr.ph143.split.us, label %._crit_edge144.loopexit

.lr.ph143.split:                                  ; preds = %.lr.ph143.split.preheader, %._crit_edge140
  %indvars.iv193 = phi i64 [ %indvars.iv.next194, %._crit_edge140 ], [ %17, %.lr.ph143.split.preheader ]
  %28 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv195, i64 %indvars.iv193, i64 %20
  br label %29

; <label>:29:                                     ; preds = %33, %.lr.ph143.split
  %.0137 = phi i32 [ %19, %.lr.ph143.split ], [ %35, %33 ]
  %.01136 = phi i32* [ %28, %.lr.ph143.split ], [ %34, %33 ]
  %30 = load i32, i32* %.01136, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %33, label %.us-lcssa145

.us-lcssa145:                                     ; preds = %29
  %32 = trunc i64 %indvars.iv195 to i32
  store i32 %32, i32* %4, align 8
  br label %.loopexit28

; <label>:33:                                     ; preds = %29
  %34 = getelementptr inbounds i32, i32* %.01136, i64 1
  %35 = add nsw i32 %.0137, 1
  %36 = load i32, i32* %14, align 4
  %37 = icmp slt i32 %.0137, %36
  br i1 %37, label %29, label %._crit_edge140

._crit_edge140:                                   ; preds = %33
  %indvars.iv.next194 = add i64 %indvars.iv193, 1
  %38 = load i32, i32* %11, align 4
  %39 = sext i32 %38 to i64
  %40 = icmp slt i64 %indvars.iv193, %39
  br i1 %40, label %.lr.ph143.split, label %._crit_edge144.loopexit243

._crit_edge144.loopexit:                          ; preds = %.lr.ph143.split.us
  br label %._crit_edge144

._crit_edge144.loopexit243:                       ; preds = %._crit_edge140
  br label %._crit_edge144

._crit_edge144:                                   ; preds = %._crit_edge144.loopexit243, %._crit_edge144.loopexit
  %indvars.iv.next196 = add i64 %indvars.iv195, 1
  %41 = load i32, i32* %2, align 4
  %42 = sext i32 %41 to i64
  %43 = icmp slt i64 %indvars.iv195, %42
  br i1 %43, label %.lr.ph149.split, label %.loopexit28.loopexit244

.loopexit28.loopexit:                             ; preds = %.lr.ph149.split.us
  br label %.loopexit28

.loopexit28.loopexit244:                          ; preds = %._crit_edge144
  br label %.loopexit28

.loopexit28:                                      ; preds = %.loopexit28.loopexit244, %.loopexit28.loopexit, %.preheader27, %.us-lcssa145
  %44 = load i32, i32* %2, align 4
  %45 = load i32, i32* %4, align 8
  %46 = icmp sgt i32 %44, %45
  br i1 %46, label %.preheader25, label %.loopexit26

.preheader25:                                     ; preds = %.loopexit28
  %47 = load i32, i32* %4, align 8
  %48 = icmp slt i32 %44, %47
  br i1 %48, label %.loopexit26, label %.lr.ph128

.lr.ph128:                                        ; preds = %.preheader25
  %49 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 4
  %50 = load i32, i32* %49, align 8
  %51 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 5
  %52 = load i32, i32* %51, align 4
  %53 = icmp sgt i32 %50, %52
  %54 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  br i1 %53, label %.lr.ph128.split.us.preheader, label %.lr.ph128.split.preheader

.lr.ph128.split.us.preheader:                     ; preds = %.lr.ph128
  %55 = load i32, i32* %4, align 8
  br label %.lr.ph128.split.us

.lr.ph128.split.preheader:                        ; preds = %.lr.ph128
  %56 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %57 = sext i32 %50 to i64
  %58 = sext i32 %44 to i64
  %59 = load i32, i32* %56, align 8
  %60 = sext i32 %59 to i64
  %61 = load i32, i32* %54, align 4
  %62 = icmp sgt i32 %59, %61
  br label %.lr.ph128.split

.lr.ph128.split.us:                               ; preds = %.lr.ph128.split.us.preheader, %.lr.ph128.split.us
  %.18125.us = phi i32 [ %63, %.lr.ph128.split.us ], [ %44, %.lr.ph128.split.us.preheader ]
  %63 = add nsw i32 %.18125.us, -1
  %64 = icmp sgt i32 %.18125.us, %55
  br i1 %64, label %.lr.ph128.split.us, label %.loopexit26.loopexit

.lr.ph128.split:                                  ; preds = %.lr.ph128.split.preheader, %._crit_edge123
  %indvars.iv191 = phi i64 [ %58, %.lr.ph128.split.preheader ], [ %indvars.iv.next192, %._crit_edge123 ]
  br i1 %62, label %.lr.ph122.split.us.preheader, label %.lr.ph122.split.preheader

.lr.ph122.split.preheader:                        ; preds = %.lr.ph128.split
  br label %.lr.ph122.split

.lr.ph122.split.us.preheader:                     ; preds = %.lr.ph128.split
  %65 = load i32, i32* %51, align 4
  br label %.lr.ph122.split.us

.lr.ph122.split.us:                               ; preds = %.lr.ph122.split.us.preheader, %.lr.ph122.split.us
  %.114120.us = phi i32 [ %66, %.lr.ph122.split.us ], [ %50, %.lr.ph122.split.us.preheader ]
  %66 = add nsw i32 %.114120.us, 1
  %67 = icmp slt i32 %.114120.us, %65
  br i1 %67, label %.lr.ph122.split.us, label %._crit_edge123.loopexit

.lr.ph122.split:                                  ; preds = %.lr.ph122.split.preheader, %._crit_edge119
  %indvars.iv189 = phi i64 [ %indvars.iv.next190, %._crit_edge119 ], [ %57, %.lr.ph122.split.preheader ]
  %68 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv191, i64 %indvars.iv189, i64 %60
  br label %69

; <label>:69:                                     ; preds = %73, %.lr.ph122.split
  %.1116 = phi i32 [ %59, %.lr.ph122.split ], [ %75, %73 ]
  %.12115 = phi i32* [ %68, %.lr.ph122.split ], [ %74, %73 ]
  %70 = load i32, i32* %.12115, align 4
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %73, label %.us-lcssa124

.us-lcssa124:                                     ; preds = %69
  %72 = trunc i64 %indvars.iv191 to i32
  store i32 %72, i32* %2, align 4
  br label %.loopexit26

; <label>:73:                                     ; preds = %69
  %74 = getelementptr inbounds i32, i32* %.12115, i64 1
  %75 = add nsw i32 %.1116, 1
  %76 = load i32, i32* %54, align 4
  %77 = icmp slt i32 %.1116, %76
  br i1 %77, label %69, label %._crit_edge119

._crit_edge119:                                   ; preds = %73
  %indvars.iv.next190 = add i64 %indvars.iv189, 1
  %78 = load i32, i32* %51, align 4
  %79 = sext i32 %78 to i64
  %80 = icmp slt i64 %indvars.iv189, %79
  br i1 %80, label %.lr.ph122.split, label %._crit_edge123.loopexit241

._crit_edge123.loopexit:                          ; preds = %.lr.ph122.split.us
  br label %._crit_edge123

._crit_edge123.loopexit241:                       ; preds = %._crit_edge119
  br label %._crit_edge123

._crit_edge123:                                   ; preds = %._crit_edge123.loopexit241, %._crit_edge123.loopexit
  %indvars.iv.next192 = add i64 %indvars.iv191, -1
  %81 = load i32, i32* %4, align 8
  %82 = sext i32 %81 to i64
  %83 = icmp sgt i64 %indvars.iv191, %82
  br i1 %83, label %.lr.ph128.split, label %.loopexit26.loopexit242

.loopexit26.loopexit:                             ; preds = %.lr.ph128.split.us
  br label %.loopexit26

.loopexit26.loopexit242:                          ; preds = %._crit_edge123
  br label %.loopexit26

.loopexit26:                                      ; preds = %.loopexit26.loopexit242, %.loopexit26.loopexit, %.preheader25, %1, %.loopexit28, %.us-lcssa124
  %84 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 5
  %85 = load i32, i32* %84, align 4
  %86 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 4
  %87 = load i32, i32* %86, align 8
  %88 = icmp sgt i32 %85, %87
  br i1 %88, label %.preheader23, label %.loopexit22

.preheader23:                                     ; preds = %.loopexit26
  %89 = load i32, i32* %84, align 4
  %90 = icmp sgt i32 %87, %89
  br i1 %90, label %.loopexit24, label %.lr.ph107

.lr.ph107:                                        ; preds = %.preheader23
  %91 = load i32, i32* %4, align 8
  %92 = load i32, i32* %2, align 4
  %93 = icmp sgt i32 %91, %92
  %94 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  br i1 %93, label %.lr.ph107.split.us.preheader, label %.lr.ph107.split.preheader

.lr.ph107.split.us.preheader:                     ; preds = %.lr.ph107
  %95 = load i32, i32* %84, align 4
  br label %.lr.ph107.split.us

.lr.ph107.split.preheader:                        ; preds = %.lr.ph107
  %96 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %97 = sext i32 %91 to i64
  %98 = sext i32 %87 to i64
  %99 = load i32, i32* %96, align 8
  %100 = sext i32 %99 to i64
  %101 = load i32, i32* %94, align 4
  %102 = icmp sgt i32 %99, %101
  br label %.lr.ph107.split

.lr.ph107.split.us:                               ; preds = %.lr.ph107.split.us.preheader, %.lr.ph107.split.us
  %.215104.us = phi i32 [ %103, %.lr.ph107.split.us ], [ %87, %.lr.ph107.split.us.preheader ]
  %103 = add nsw i32 %.215104.us, 1
  %104 = icmp slt i32 %.215104.us, %95
  br i1 %104, label %.lr.ph107.split.us, label %.loopexit24.loopexit

.lr.ph107.split:                                  ; preds = %.lr.ph107.split.preheader, %._crit_edge102
  %indvars.iv187 = phi i64 [ %98, %.lr.ph107.split.preheader ], [ %indvars.iv.next188, %._crit_edge102 ]
  br i1 %102, label %.lr.ph101.split.us.preheader, label %.lr.ph101.split.preheader

.lr.ph101.split.preheader:                        ; preds = %.lr.ph107.split
  br label %.lr.ph101.split

.lr.ph101.split.us.preheader:                     ; preds = %.lr.ph107.split
  %105 = load i32, i32* %2, align 4
  br label %.lr.ph101.split.us

.lr.ph101.split.us:                               ; preds = %.lr.ph101.split.us.preheader, %.lr.ph101.split.us
  %.2999.us = phi i32 [ %106, %.lr.ph101.split.us ], [ %91, %.lr.ph101.split.us.preheader ]
  %106 = add nsw i32 %.2999.us, 1
  %107 = icmp slt i32 %.2999.us, %105
  br i1 %107, label %.lr.ph101.split.us, label %._crit_edge102.loopexit

.lr.ph101.split:                                  ; preds = %.lr.ph101.split.preheader, %._crit_edge98
  %indvars.iv185 = phi i64 [ %indvars.iv.next186, %._crit_edge98 ], [ %97, %.lr.ph101.split.preheader ]
  %108 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv185, i64 %indvars.iv187, i64 %100
  br label %109

; <label>:109:                                    ; preds = %113, %.lr.ph101.split
  %.295 = phi i32 [ %99, %.lr.ph101.split ], [ %115, %113 ]
  %.2394 = phi i32* [ %108, %.lr.ph101.split ], [ %114, %113 ]
  %110 = load i32, i32* %.2394, align 4
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %113, label %.us-lcssa103

.us-lcssa103:                                     ; preds = %109
  %112 = trunc i64 %indvars.iv187 to i32
  store i32 %112, i32* %86, align 8
  br label %.loopexit24

; <label>:113:                                    ; preds = %109
  %114 = getelementptr inbounds i32, i32* %.2394, i64 1
  %115 = add nsw i32 %.295, 1
  %116 = load i32, i32* %94, align 4
  %117 = icmp slt i32 %.295, %116
  br i1 %117, label %109, label %._crit_edge98

._crit_edge98:                                    ; preds = %113
  %indvars.iv.next186 = add i64 %indvars.iv185, 1
  %118 = load i32, i32* %2, align 4
  %119 = sext i32 %118 to i64
  %120 = icmp slt i64 %indvars.iv185, %119
  br i1 %120, label %.lr.ph101.split, label %._crit_edge102.loopexit239

._crit_edge102.loopexit:                          ; preds = %.lr.ph101.split.us
  br label %._crit_edge102

._crit_edge102.loopexit239:                       ; preds = %._crit_edge98
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102.loopexit239, %._crit_edge102.loopexit
  %indvars.iv.next188 = add i64 %indvars.iv187, 1
  %121 = load i32, i32* %84, align 4
  %122 = sext i32 %121 to i64
  %123 = icmp slt i64 %indvars.iv187, %122
  br i1 %123, label %.lr.ph107.split, label %.loopexit24.loopexit240

.loopexit24.loopexit:                             ; preds = %.lr.ph107.split.us
  br label %.loopexit24

.loopexit24.loopexit240:                          ; preds = %._crit_edge102
  br label %.loopexit24

.loopexit24:                                      ; preds = %.loopexit24.loopexit240, %.loopexit24.loopexit, %.preheader23, %.us-lcssa103
  %124 = load i32, i32* %84, align 4
  %125 = load i32, i32* %86, align 8
  %126 = icmp sgt i32 %124, %125
  br i1 %126, label %.preheader21, label %.loopexit22

.preheader21:                                     ; preds = %.loopexit24
  %127 = load i32, i32* %86, align 8
  %128 = icmp slt i32 %124, %127
  br i1 %128, label %.loopexit22, label %.lr.ph86

.lr.ph86:                                         ; preds = %.preheader21
  %129 = load i32, i32* %4, align 8
  %130 = load i32, i32* %2, align 4
  %131 = icmp sgt i32 %129, %130
  %132 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  br i1 %131, label %.lr.ph86.split.us.preheader, label %.lr.ph86.split.preheader

.lr.ph86.split.us.preheader:                      ; preds = %.lr.ph86
  %133 = load i32, i32* %86, align 8
  br label %.lr.ph86.split.us

.lr.ph86.split.preheader:                         ; preds = %.lr.ph86
  %134 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %135 = sext i32 %129 to i64
  %136 = sext i32 %124 to i64
  %137 = load i32, i32* %134, align 8
  %138 = sext i32 %137 to i64
  %139 = load i32, i32* %132, align 4
  %140 = icmp sgt i32 %137, %139
  br label %.lr.ph86.split

.lr.ph86.split.us:                                ; preds = %.lr.ph86.split.us.preheader, %.lr.ph86.split.us
  %.31683.us = phi i32 [ %141, %.lr.ph86.split.us ], [ %124, %.lr.ph86.split.us.preheader ]
  %141 = add nsw i32 %.31683.us, -1
  %142 = icmp sgt i32 %.31683.us, %133
  br i1 %142, label %.lr.ph86.split.us, label %.loopexit22.loopexit

.lr.ph86.split:                                   ; preds = %.lr.ph86.split.preheader, %._crit_edge81
  %indvars.iv183 = phi i64 [ %136, %.lr.ph86.split.preheader ], [ %indvars.iv.next184, %._crit_edge81 ]
  br i1 %140, label %.lr.ph80.split.us.preheader, label %.lr.ph80.split.preheader

.lr.ph80.split.preheader:                         ; preds = %.lr.ph86.split
  br label %.lr.ph80.split

.lr.ph80.split.us.preheader:                      ; preds = %.lr.ph86.split
  %143 = load i32, i32* %2, align 4
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %.lr.ph80.split.us.preheader, %.lr.ph80.split.us
  %.31078.us = phi i32 [ %144, %.lr.ph80.split.us ], [ %129, %.lr.ph80.split.us.preheader ]
  %144 = add nsw i32 %.31078.us, 1
  %145 = icmp slt i32 %.31078.us, %143
  br i1 %145, label %.lr.ph80.split.us, label %._crit_edge81.loopexit

.lr.ph80.split:                                   ; preds = %.lr.ph80.split.preheader, %._crit_edge77
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge77 ], [ %135, %.lr.ph80.split.preheader ]
  %146 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv181, i64 %indvars.iv183, i64 %138
  br label %147

; <label>:147:                                    ; preds = %151, %.lr.ph80.split
  %.374 = phi i32 [ %137, %.lr.ph80.split ], [ %153, %151 ]
  %.3473 = phi i32* [ %146, %.lr.ph80.split ], [ %152, %151 ]
  %148 = load i32, i32* %.3473, align 4
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %151, label %.us-lcssa82

.us-lcssa82:                                      ; preds = %147
  %150 = trunc i64 %indvars.iv183 to i32
  store i32 %150, i32* %84, align 4
  br label %.loopexit22

; <label>:151:                                    ; preds = %147
  %152 = getelementptr inbounds i32, i32* %.3473, i64 1
  %153 = add nsw i32 %.374, 1
  %154 = load i32, i32* %132, align 4
  %155 = icmp slt i32 %.374, %154
  br i1 %155, label %147, label %._crit_edge77

._crit_edge77:                                    ; preds = %151
  %indvars.iv.next182 = add i64 %indvars.iv181, 1
  %156 = load i32, i32* %2, align 4
  %157 = sext i32 %156 to i64
  %158 = icmp slt i64 %indvars.iv181, %157
  br i1 %158, label %.lr.ph80.split, label %._crit_edge81.loopexit237

._crit_edge81.loopexit:                           ; preds = %.lr.ph80.split.us
  br label %._crit_edge81

._crit_edge81.loopexit237:                        ; preds = %._crit_edge77
  br label %._crit_edge81

._crit_edge81:                                    ; preds = %._crit_edge81.loopexit237, %._crit_edge81.loopexit
  %indvars.iv.next184 = add i64 %indvars.iv183, -1
  %159 = load i32, i32* %86, align 8
  %160 = sext i32 %159 to i64
  %161 = icmp sgt i64 %indvars.iv183, %160
  br i1 %161, label %.lr.ph86.split, label %.loopexit22.loopexit238

.loopexit22.loopexit:                             ; preds = %.lr.ph86.split.us
  br label %.loopexit22

.loopexit22.loopexit238:                          ; preds = %._crit_edge81
  br label %.loopexit22

.loopexit22:                                      ; preds = %.loopexit22.loopexit238, %.loopexit22.loopexit, %.preheader21, %.loopexit26, %.loopexit24, %.us-lcssa82
  %162 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 7
  %163 = load i32, i32* %162, align 4
  %164 = getelementptr inbounds %struct.colorbox, %struct.colorbox* %0, i64 0, i32 6
  %165 = load i32, i32* %164, align 8
  %166 = icmp sgt i32 %163, %165
  br i1 %166, label %.preheader19, label %.loopexit

.preheader19:                                     ; preds = %.loopexit22
  %167 = load i32, i32* %162, align 4
  %168 = icmp sgt i32 %165, %167
  br i1 %168, label %.loopexit20, label %.lr.ph65

.lr.ph65:                                         ; preds = %.preheader19
  %169 = load i32, i32* %4, align 8
  %170 = load i32, i32* %2, align 4
  %171 = icmp sgt i32 %169, %170
  br i1 %171, label %.lr.ph65.split.us.preheader, label %.lr.ph65.split.preheader

.lr.ph65.split.us.preheader:                      ; preds = %.lr.ph65
  %172 = load i32, i32* %162, align 4
  br label %.lr.ph65.split.us

.lr.ph65.split.preheader:                         ; preds = %.lr.ph65
  %173 = sext i32 %169 to i64
  %174 = sext i32 %165 to i64
  %175 = load i32, i32* %86, align 8
  %176 = sext i32 %175 to i64
  %177 = load i32, i32* %84, align 4
  %178 = icmp sgt i32 %175, %177
  br label %.lr.ph65.split

.lr.ph65.split.us:                                ; preds = %.lr.ph65.split.us.preheader, %.lr.ph65.split.us
  %.462.us = phi i32 [ %179, %.lr.ph65.split.us ], [ %165, %.lr.ph65.split.us.preheader ]
  %179 = add nsw i32 %.462.us, 1
  %180 = icmp slt i32 %.462.us, %172
  br i1 %180, label %.lr.ph65.split.us, label %.loopexit20.loopexit

.lr.ph65.split:                                   ; preds = %.lr.ph65.split.preheader, %._crit_edge60
  %indvars.iv179 = phi i64 [ %174, %.lr.ph65.split.preheader ], [ %indvars.iv.next180, %._crit_edge60 ]
  br i1 %178, label %.lr.ph59.split.us.preheader, label %.lr.ph59.split.preheader

.lr.ph59.split.preheader:                         ; preds = %.lr.ph65.split
  br label %.lr.ph59.split

.lr.ph59.split.us.preheader:                      ; preds = %.lr.ph65.split
  %181 = load i32, i32* %2, align 4
  br label %.lr.ph59.split.us

.lr.ph59.split.us:                                ; preds = %.lr.ph59.split.us.preheader, %.lr.ph59.split.us
  %.41157.us = phi i32 [ %182, %.lr.ph59.split.us ], [ %169, %.lr.ph59.split.us.preheader ]
  %182 = add nsw i32 %.41157.us, 1
  %183 = icmp slt i32 %.41157.us, %181
  br i1 %183, label %.lr.ph59.split.us, label %._crit_edge60.loopexit

.lr.ph59.split:                                   ; preds = %.lr.ph59.split.preheader, %._crit_edge56
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %._crit_edge56 ], [ %173, %.lr.ph59.split.preheader ]
  %184 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv177, i64 %176, i64 %indvars.iv179
  br label %185

; <label>:185:                                    ; preds = %189, %.lr.ph59.split
  %.4553 = phi i32* [ %184, %.lr.ph59.split ], [ %190, %189 ]
  %.41752 = phi i32 [ %175, %.lr.ph59.split ], [ %191, %189 ]
  %186 = load i32, i32* %.4553, align 4
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %189, label %.us-lcssa61

.us-lcssa61:                                      ; preds = %185
  %188 = trunc i64 %indvars.iv179 to i32
  store i32 %188, i32* %164, align 8
  br label %.loopexit20

; <label>:189:                                    ; preds = %185
  %190 = getelementptr inbounds i32, i32* %.4553, i64 32
  %191 = add nsw i32 %.41752, 1
  %192 = load i32, i32* %84, align 4
  %193 = icmp slt i32 %.41752, %192
  br i1 %193, label %185, label %._crit_edge56

._crit_edge56:                                    ; preds = %189
  %indvars.iv.next178 = add i64 %indvars.iv177, 1
  %194 = load i32, i32* %2, align 4
  %195 = sext i32 %194 to i64
  %196 = icmp slt i64 %indvars.iv177, %195
  br i1 %196, label %.lr.ph59.split, label %._crit_edge60.loopexit235

._crit_edge60.loopexit:                           ; preds = %.lr.ph59.split.us
  br label %._crit_edge60

._crit_edge60.loopexit235:                        ; preds = %._crit_edge56
  br label %._crit_edge60

._crit_edge60:                                    ; preds = %._crit_edge60.loopexit235, %._crit_edge60.loopexit
  %indvars.iv.next180 = add i64 %indvars.iv179, 1
  %197 = load i32, i32* %162, align 4
  %198 = sext i32 %197 to i64
  %199 = icmp slt i64 %indvars.iv179, %198
  br i1 %199, label %.lr.ph65.split, label %.loopexit20.loopexit236

.loopexit20.loopexit:                             ; preds = %.lr.ph65.split.us
  br label %.loopexit20

.loopexit20.loopexit236:                          ; preds = %._crit_edge60
  br label %.loopexit20

.loopexit20:                                      ; preds = %.loopexit20.loopexit236, %.loopexit20.loopexit, %.preheader19, %.us-lcssa61
  %200 = load i32, i32* %162, align 4
  %201 = load i32, i32* %164, align 8
  %202 = icmp sgt i32 %200, %201
  br i1 %202, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %.loopexit20
  %203 = load i32, i32* %164, align 8
  %204 = icmp slt i32 %200, %203
  br i1 %204, label %.loopexit, label %.lr.ph44

.lr.ph44:                                         ; preds = %.preheader
  %205 = load i32, i32* %4, align 8
  %206 = load i32, i32* %2, align 4
  %207 = icmp sgt i32 %205, %206
  br i1 %207, label %.lr.ph44.split.us.preheader, label %.lr.ph44.split.preheader

.lr.ph44.split.us.preheader:                      ; preds = %.lr.ph44
  %208 = load i32, i32* %164, align 8
  br label %.lr.ph44.split.us

.lr.ph44.split.preheader:                         ; preds = %.lr.ph44
  %209 = sext i32 %205 to i64
  %210 = sext i32 %200 to i64
  %211 = load i32, i32* %86, align 8
  %212 = sext i32 %211 to i64
  %213 = load i32, i32* %84, align 4
  %214 = icmp sgt i32 %211, %213
  br label %.lr.ph44.split

.lr.ph44.split.us:                                ; preds = %.lr.ph44.split.us.preheader, %.lr.ph44.split.us
  %.541.us = phi i32 [ %215, %.lr.ph44.split.us ], [ %200, %.lr.ph44.split.us.preheader ]
  %215 = add nsw i32 %.541.us, -1
  %216 = icmp sgt i32 %.541.us, %208
  br i1 %216, label %.lr.ph44.split.us, label %.loopexit.loopexit

.lr.ph44.split:                                   ; preds = %.lr.ph44.split.preheader, %._crit_edge40
  %indvars.iv175 = phi i64 [ %210, %.lr.ph44.split.preheader ], [ %indvars.iv.next176, %._crit_edge40 ]
  br i1 %214, label %.lr.ph39.split.us.preheader, label %.lr.ph39.split.preheader

.lr.ph39.split.preheader:                         ; preds = %.lr.ph44.split
  br label %.lr.ph39.split

.lr.ph39.split.us.preheader:                      ; preds = %.lr.ph44.split
  %217 = load i32, i32* %2, align 4
  br label %.lr.ph39.split.us

.lr.ph39.split.us:                                ; preds = %.lr.ph39.split.us.preheader, %.lr.ph39.split.us
  %.51237.us = phi i32 [ %218, %.lr.ph39.split.us ], [ %205, %.lr.ph39.split.us.preheader ]
  %218 = add nsw i32 %.51237.us, 1
  %219 = icmp slt i32 %.51237.us, %217
  br i1 %219, label %.lr.ph39.split.us, label %._crit_edge40.loopexit

.lr.ph39.split:                                   ; preds = %.lr.ph39.split.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %209, %.lr.ph39.split.preheader ]
  %220 = getelementptr inbounds [32 x [32 x [32 x i32]]], [32 x [32 x [32 x i32]]]* @histogram, i64 0, i64 %indvars.iv, i64 %212, i64 %indvars.iv175
  br label %221

; <label>:221:                                    ; preds = %225, %.lr.ph39.split
  %.5636 = phi i32* [ %220, %.lr.ph39.split ], [ %226, %225 ]
  %.51835 = phi i32 [ %211, %.lr.ph39.split ], [ %227, %225 ]
  %222 = load i32, i32* %.5636, align 4
  %223 = icmp eq i32 %222, 0
  br i1 %223, label %225, label %.us-lcssa

.us-lcssa:                                        ; preds = %221
  %224 = trunc i64 %indvars.iv175 to i32
  store i32 %224, i32* %162, align 4
  br label %.loopexit

; <label>:225:                                    ; preds = %221
  %226 = getelementptr inbounds i32, i32* %.5636, i64 32
  %227 = add nsw i32 %.51835, 1
  %228 = load i32, i32* %84, align 4
  %229 = icmp slt i32 %.51835, %228
  br i1 %229, label %221, label %._crit_edge

._crit_edge:                                      ; preds = %225
  %indvars.iv.next = add i64 %indvars.iv, 1
  %230 = load i32, i32* %2, align 4
  %231 = sext i32 %230 to i64
  %232 = icmp slt i64 %indvars.iv, %231
  br i1 %232, label %.lr.ph39.split, label %._crit_edge40.loopexit233

._crit_edge40.loopexit:                           ; preds = %.lr.ph39.split.us
  br label %._crit_edge40

._crit_edge40.loopexit233:                        ; preds = %._crit_edge
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit233, %._crit_edge40.loopexit
  %indvars.iv.next176 = add i64 %indvars.iv175, -1
  %233 = load i32, i32* %164, align 8
  %234 = sext i32 %233 to i64
  %235 = icmp sgt i64 %indvars.iv175, %234
  br i1 %235, label %.lr.ph44.split, label %.loopexit.loopexit234

.loopexit.loopexit:                               ; preds = %.lr.ph44.split.us
  br label %.loopexit

.loopexit.loopexit234:                            ; preds = %._crit_edge40
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit234, %.loopexit.loopexit, %.preheader, %.loopexit22, %.loopexit20, %.us-lcssa
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc %struct.C_cell* @create_colorcell(i32, i32, i32) unnamed_addr #0 {
  %4 = ashr i32 %0, 6
  %5 = ashr i32 %1, 6
  %6 = ashr i32 %2, 6
  %7 = tail call i8* @_TIFFmalloc(i32 2052) #8
  %8 = bitcast i8* %7 to %struct.C_cell*
  %9 = load %struct.C_cell**, %struct.C_cell*** @ColorCells, align 8
  %10 = sext i32 %4 to i64
  %11 = shl nsw i64 %10, 4
  %12 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %9, i64 %11
  %13 = sext i32 %5 to i64
  %14 = shl nsw i64 %13, 2
  %15 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %12, i64 %14
  %16 = sext i32 %6 to i64
  %17 = getelementptr inbounds %struct.C_cell*, %struct.C_cell** %15, i64 %16
  %18 = bitcast %struct.C_cell** %17 to i8**
  store i8* %7, i8** %18, align 8
  %19 = bitcast i8* %7 to i32*
  store i32 0, i32* %19, align 4
  %20 = load i32, i32* @num_colors, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %.lr.ph34, label %._crit_edge

.lr.ph34:                                         ; preds = %3
  %22 = getelementptr inbounds i8, i8* %7, i64 4
  %23 = bitcast i8* %22 to [256 x [2 x i32]]*
  br label %27

.preheader20:                                     ; preds = %75
  %24 = icmp sgt i32 %76, 0
  br i1 %24, label %.lr.ph, label %._crit_edge30

.lr.ph:                                           ; preds = %.preheader20
  %25 = getelementptr inbounds i8, i8* %7, i64 4
  %26 = bitcast i8* %25 to [256 x [2 x i32]]*
  %.neg19 = sub i32 -63, %2
  %.neg17 = sub i32 -63, %1
  %.neg15 = sub i32 -63, %0
  br label %79

; <label>:27:                                     ; preds = %.lr.ph34, %75
  %indvars.iv42 = phi i64 [ 0, %.lr.ph34 ], [ %indvars.iv.next43, %75 ]
  %.0732 = phi i32 [ 99999999, %.lr.ph34 ], [ %.29, %75 ]
  %28 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %indvars.iv42
  %29 = load i16, i16* %28, align 2
  %30 = zext i16 %29 to i32
  %31 = lshr i32 %30, 6
  %32 = icmp eq i32 %31, %4
  br i1 %32, label %33, label %75

; <label>:33:                                     ; preds = %27
  %34 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %indvars.iv42
  %35 = load i16, i16* %34, align 2
  %36 = zext i16 %35 to i32
  %37 = lshr i32 %36, 6
  %38 = icmp eq i32 %37, %5
  br i1 %38, label %39, label %75

; <label>:39:                                     ; preds = %33
  %40 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %indvars.iv42
  %41 = load i16, i16* %40, align 2
  %42 = zext i16 %41 to i32
  %43 = lshr i32 %42, 6
  %44 = icmp eq i32 %43, %6
  br i1 %44, label %45, label %75

; <label>:45:                                     ; preds = %39
  %46 = load i32, i32* %19, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %23, i64 0, i64 %47, i64 0
  %49 = trunc i64 %indvars.iv42 to i32
  store i32 %49, i32* %48, align 4
  %50 = sext i32 %46 to i64
  %51 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %23, i64 0, i64 %50, i64 1
  store i32 0, i32* %51, align 4
  %52 = load i32, i32* %19, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %19, align 4
  %54 = load i16, i16* %28, align 2
  %55 = zext i16 %54 to i32
  %56 = sub nsw i32 %55, %0
  %57 = icmp slt i32 %56, 32
  %58 = sub i32 63, %56
  %. = select i1 %57, i32 %58, i32 %56
  %59 = mul nsw i32 %., %.
  %60 = load i16, i16* %34, align 2
  %61 = zext i16 %60 to i32
  %62 = sub nsw i32 %61, %1
  %63 = icmp slt i32 %62, 32
  %64 = sub i32 63, %62
  %.13 = select i1 %63, i32 %64, i32 %62
  %65 = mul nsw i32 %.13, %.13
  %66 = add nuw nsw i32 %65, %59
  %67 = load i16, i16* %40, align 2
  %68 = zext i16 %67 to i32
  %69 = sub nsw i32 %68, %2
  %70 = icmp slt i32 %69, 32
  %71 = sub i32 63, %69
  %.14 = select i1 %70, i32 %71, i32 %69
  %72 = mul nsw i32 %.14, %.14
  %73 = add nuw nsw i32 %66, %72
  %74 = icmp slt i32 %73, %.0732
  %.18 = select i1 %74, i32 %73, i32 %.0732
  br label %75

; <label>:75:                                     ; preds = %45, %27, %33, %39
  %.29 = phi i32 [ %.0732, %39 ], [ %.0732, %33 ], [ %.0732, %27 ], [ %.18, %45 ]
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %76 = load i32, i32* @num_colors, align 4
  %77 = sext i32 %76 to i64
  %78 = icmp slt i64 %indvars.iv.next43, %77
  br i1 %78, label %27, label %.preheader20

; <label>:79:                                     ; preds = %.lr.ph, %142
  %indvars.iv40 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next41, %142 ]
  %80 = getelementptr inbounds [256 x i16], [256 x i16]* @rm, i64 0, i64 %indvars.iv40
  %81 = load i16, i16* %80, align 2
  %82 = zext i16 %81 to i32
  %83 = lshr i32 %82, 6
  %84 = icmp eq i32 %83, %4
  br i1 %84, label %85, label %97

; <label>:85:                                     ; preds = %79
  %86 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %indvars.iv40
  %87 = load i16, i16* %86, align 2
  %88 = zext i16 %87 to i32
  %89 = lshr i32 %88, 6
  %90 = icmp eq i32 %89, %5
  br i1 %90, label %91, label %97

; <label>:91:                                     ; preds = %85
  %92 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %indvars.iv40
  %93 = load i16, i16* %92, align 2
  %94 = zext i16 %93 to i32
  %95 = lshr i32 %94, 6
  %96 = icmp eq i32 %95, %6
  br i1 %96, label %142, label %97

; <label>:97:                                     ; preds = %91, %85, %79
  %98 = load i16, i16* %80, align 2
  %99 = zext i16 %98 to i32
  %100 = sub nsw i32 %0, %99
  %101 = icmp sgt i32 %100, 0
  br i1 %101, label %105, label %102

; <label>:102:                                    ; preds = %97
  %103 = add i32 %.neg15, %99
  %104 = icmp sgt i32 %103, 0
  br i1 %104, label %105, label %107

; <label>:105:                                    ; preds = %102, %97
  %.3 = phi i32 [ %100, %97 ], [ %103, %102 ]
  %106 = mul nsw i32 %.3, %.3
  br label %107

; <label>:107:                                    ; preds = %105, %102
  %.01 = phi i32 [ %106, %105 ], [ 0, %102 ]
  %108 = getelementptr inbounds [256 x i16], [256 x i16]* @gm, i64 0, i64 %indvars.iv40
  %109 = load i16, i16* %108, align 2
  %110 = zext i16 %109 to i32
  %111 = sub nsw i32 %1, %110
  %112 = icmp sgt i32 %111, 0
  br i1 %112, label %116, label %113

; <label>:113:                                    ; preds = %107
  %114 = add i32 %.neg17, %110
  %115 = icmp sgt i32 %114, 0
  br i1 %115, label %116, label %119

; <label>:116:                                    ; preds = %113, %107
  %.4 = phi i32 [ %111, %107 ], [ %114, %113 ]
  %117 = mul nsw i32 %.4, %.4
  %118 = add nuw nsw i32 %117, %.01
  br label %119

; <label>:119:                                    ; preds = %116, %113
  %.1 = phi i32 [ %118, %116 ], [ %.01, %113 ]
  %120 = getelementptr inbounds [256 x i16], [256 x i16]* @bm, i64 0, i64 %indvars.iv40
  %121 = load i16, i16* %120, align 2
  %122 = zext i16 %121 to i32
  %123 = sub nsw i32 %2, %122
  %124 = icmp sgt i32 %123, 0
  br i1 %124, label %128, label %125

; <label>:125:                                    ; preds = %119
  %126 = add i32 %.neg19, %122
  %127 = icmp sgt i32 %126, 0
  br i1 %127, label %128, label %131

; <label>:128:                                    ; preds = %125, %119
  %.5 = phi i32 [ %123, %119 ], [ %126, %125 ]
  %129 = mul nsw i32 %.5, %.5
  %130 = add nsw i32 %129, %.1
  br label %131

; <label>:131:                                    ; preds = %128, %125
  %.2 = phi i32 [ %130, %128 ], [ %.1, %125 ]
  %132 = icmp slt i32 %.2, %.29
  br i1 %132, label %133, label %142

; <label>:133:                                    ; preds = %131
  %134 = load i32, i32* %19, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %26, i64 0, i64 %135, i64 0
  %137 = trunc i64 %indvars.iv40 to i32
  store i32 %137, i32* %136, align 4
  %138 = sext i32 %134 to i64
  %139 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %26, i64 0, i64 %138, i64 1
  store i32 %.2, i32* %139, align 4
  %140 = load i32, i32* %19, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* %19, align 4
  br label %142

; <label>:142:                                    ; preds = %131, %133, %91
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %143 = load i32, i32* @num_colors, align 4
  %144 = sext i32 %143 to i64
  %145 = icmp slt i64 %indvars.iv.next41, %144
  br i1 %145, label %79, label %._crit_edge30.loopexit

._crit_edge30.loopexit:                           ; preds = %142
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.preheader20
  %.pr = load i32, i32* %19, align 4
  %146 = icmp sgt i32 %.pr, 1
  br i1 %146, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %._crit_edge30
  %147 = add nsw i32 %.pr, -1
  %148 = getelementptr inbounds i8, i8* %7, i64 4
  %149 = bitcast i8* %148 to [256 x [2 x i32]]*
  br label %.preheader

.loopexit:                                        ; preds = %153
  %150 = icmp sgt i32 %.05.ph, 0
  br i1 %150, label %.preheader, label %._crit_edge.loopexit

.preheader:                                       ; preds = %.preheader.lr.ph, %.loopexit
  %.027 = phi i32 [ %147, %.preheader.lr.ph ], [ %.05.ph, %.loopexit ]
  %151 = sext i32 %.027 to i64
  br label %.outer

.outer:                                           ; preds = %.preheader, %161
  %.212.ph = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %161 ]
  %.05.ph = phi i32 [ 0, %.preheader ], [ %162, %161 ]
  %sext = shl i64 %.212.ph, 32
  %152 = ashr exact i64 %sext, 32
  br label %153

; <label>:153:                                    ; preds = %.outer, %155
  %indvars.iv = phi i64 [ %152, %.outer ], [ %indvars.iv.next, %155 ]
  %154 = icmp slt i64 %indvars.iv, %151
  br i1 %154, label %155, label %.loopexit

; <label>:155:                                    ; preds = %153
  %156 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %149, i64 0, i64 %indvars.iv, i64 1
  %157 = load i32, i32* %156, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %158 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %149, i64 0, i64 %indvars.iv.next, i64 1
  %159 = load i32, i32* %158, align 4
  %160 = icmp sgt i32 %157, %159
  br i1 %160, label %161, label %153

; <label>:161:                                    ; preds = %155
  %162 = trunc i64 %indvars.iv to i32
  %163 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %149, i64 0, i64 %indvars.iv, i64 0
  %164 = load i32, i32* %163, align 4
  %165 = getelementptr inbounds [256 x [2 x i32]], [256 x [2 x i32]]* %149, i64 0, i64 %indvars.iv.next, i64 0
  %166 = load i32, i32* %165, align 4
  store i32 %166, i32* %163, align 4
  store i32 %164, i32* %165, align 4
  %167 = load i32, i32* %156, align 4
  %168 = load i32, i32* %158, align 4
  store i32 %168, i32* %156, align 4
  store i32 %167, i32* %158, align 4
  br label %.outer

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3, %._crit_edge30
  ret %struct.C_cell* %8
}

declare i32 @TIFFWriteScanline(%struct.tiff*, i8*, i32, i16 zeroext) local_unnamed_addr #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #8

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #9

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { argmemonly nounwind }
attributes #10 = { nounwind readonly }
attributes #11 = { cold }
attributes #12 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
