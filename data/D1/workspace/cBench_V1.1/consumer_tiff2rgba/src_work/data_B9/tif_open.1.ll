; ModuleID = 'tif_open.ll'
source_filename = "tif_open.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [15 x i8] c"\22%s\22: Bad mode\00", align 1
@TIFFClientOpen.module = internal constant [15 x i8] c"TIFFClientOpen\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"%s: Out of memory (TIFF structure)\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Cannot read TIFF header\00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"Error writing TIFF header\00", align 1
@.str.4 = private unnamed_addr constant [44 x i8] c"Not a TIFF file, bad magic number %d (0x%x)\00", align 1
@.str.5 = private unnamed_addr constant [46 x i8] c"Not a TIFF file, bad version number %d (0x%x)\00", align 1
@typemask = internal constant [13 x i64] [i64 0, i64 255, i64 4294967295, i64 65535, i64 4294967295, i64 4294967295, i64 255, i64 255, i64 65535, i64 4294967295, i64 4294967295, i64 4294967295, i64 4294967295], align 16
@bigTypeshift = internal constant [13 x i32] [i32 0, i32 24, i32 0, i32 16, i32 0, i32 0, i32 24, i32 24, i32 16, i32 0, i32 0, i32 0, i32 0], align 16
@litTypeshift = internal constant [13 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define i32 @_TIFFgetMode(i8*, i8*) local_unnamed_addr #0 {
  %3 = load i8, i8* %0, align 1
  %4 = sext i8 %3 to i32
  switch i32 %4, label %12 [
    i32 114, label %5
    i32 119, label %9
    i32 97, label %9
  ]

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds i8, i8* %0, i64 1
  %7 = load i8, i8* %6, align 1
  %8 = icmp eq i8 %7, 43
  %. = select i1 %8, i32 2, i32 0
  br label %13

; <label>:9:                                      ; preds = %2, %2
  %10 = load i8, i8* %0, align 1
  %11 = icmp eq i8 %10, 119
  %.3 = select i1 %11, i32 578, i32 66
  br label %13

; <label>:12:                                     ; preds = %2
  tail call void (i8*, i8*, ...) @TIFFError(i8* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i8* nonnull %0) #6
  br label %13

; <label>:13:                                     ; preds = %12, %9, %5
  %.2 = phi i32 [ -1, %12 ], [ %.3, %9 ], [ %., %5 ]
  ret i32 %.2
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define %struct.tiff* @TIFFClientOpen(i8*, i8*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*) local_unnamed_addr #0 {
  %11 = tail call i32 @_TIFFgetMode(i8* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @TIFFClientOpen.module, i64 0, i64 0))
  %12 = icmp eq i32 %11, -1
  br i1 %12, label %229, label %13

; <label>:13:                                     ; preds = %10
  %14 = tail call i64 @strlen(i8* %0) #7
  %15 = add i64 %14, 881
  %16 = trunc i64 %15 to i32
  %17 = tail call i8* @_TIFFmalloc(i32 %16) #6
  %18 = bitcast i8* %17 to %struct.tiff*
  %19 = icmp eq i8* %17, null
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %13
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @TIFFClientOpen.module, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i64 0, i64 0), i8* %0) #6
  br label %229

; <label>:21:                                     ; preds = %13
  tail call void @_TIFFmemset(i8* nonnull %17, i32 0, i32 880) #6
  %22 = getelementptr inbounds i8, i8* %17, i64 880
  %23 = bitcast i8* %17 to i8**
  store i8* %22, i8** %23, align 8
  %24 = tail call i8* @strcpy(i8* %22, i8* %0) #6
  %25 = and i32 %11, -577
  %26 = getelementptr inbounds i8, i8* %17, i64 12
  %27 = bitcast i8* %26 to i32*
  store i32 %25, i32* %27, align 4
  %28 = getelementptr inbounds i8, i8* %17, i64 540
  %29 = bitcast i8* %28 to i16*
  store i16 -1, i16* %29, align 4
  %30 = getelementptr inbounds i8, i8* %17, i64 548
  %31 = bitcast i8* %30 to i32*
  store i32 0, i32* %31, align 4
  %32 = getelementptr inbounds i8, i8* %17, i64 544
  %33 = bitcast i8* %32 to i32*
  store i32 -1, i32* %33, align 8
  %34 = getelementptr inbounds i8, i8* %17, i64 536
  %35 = bitcast i8* %34 to i32*
  store i32 -1, i32* %35, align 8
  %36 = getelementptr inbounds i8, i8* %17, i64 784
  %37 = bitcast i8* %36 to i8**
  store i8* %2, i8** %37, align 8
  %38 = getelementptr inbounds i8, i8* %17, i64 792
  %39 = bitcast i8* %38 to i32 (i8*, i8*, i32)**
  store i32 (i8*, i8*, i32)* %3, i32 (i8*, i8*, i32)** %39, align 8
  %40 = getelementptr inbounds i8, i8* %17, i64 800
  %41 = bitcast i8* %40 to i32 (i8*, i8*, i32)**
  store i32 (i8*, i8*, i32)* %4, i32 (i8*, i8*, i32)** %41, align 8
  %42 = getelementptr inbounds i8, i8* %17, i64 808
  %43 = bitcast i8* %42 to i32 (i8*, i32, i32)**
  store i32 (i8*, i32, i32)* %5, i32 (i8*, i32, i32)** %43, align 8
  %44 = getelementptr inbounds i8, i8* %17, i64 816
  %45 = bitcast i8* %44 to i32 (i8*)**
  store i32 (i8*)* %6, i32 (i8*)** %45, align 8
  %46 = getelementptr inbounds i8, i8* %17, i64 824
  %47 = bitcast i8* %46 to i32 (i8*)**
  store i32 (i8*)* %7, i32 (i8*)** %47, align 8
  %48 = getelementptr inbounds i8, i8* %17, i64 768
  %49 = bitcast i8* %48 to i32 (i8*, i8**, i32*)**
  store i32 (i8*, i8**, i32*)* %8, i32 (i8*, i8**, i32*)** %49, align 8
  %50 = getelementptr inbounds i8, i8* %17, i64 776
  %51 = bitcast i8* %50 to void (i8*, i8*, i32)**
  store void (i8*, i8*, i32)* %9, void (i8*, i8*, i32)** %51, align 8
  tail call void @_TIFFSetDefaultCompressionState(%struct.tiff* %18) #6
  %52 = getelementptr inbounds i8, i8* %17, i64 16
  %53 = bitcast i8* %52 to i32*
  %54 = icmp eq i32 %11, 0
  %. = select i1 %54, i32 34817, i32 1
  store i32 %., i32* %53, align 8
  %55 = load i8, i8* %1, align 1
  %56 = icmp eq i8 %55, 0
  br i1 %56, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %21
  %57 = and i32 %11, 64
  %58 = icmp eq i32 %57, 0
  br i1 %54, label %.lr.ph.split.us.preheader, label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %89
  %59 = phi i8 [ %91, %89 ], [ %55, %.lr.ph.split.us.preheader ]
  %.013.us = phi i8* [ %90, %89 ], [ %1, %.lr.ph.split.us.preheader ]
  %60 = sext i8 %59 to i32
  switch i32 %60, label %89 [
    i32 98, label %85
    i32 99, label %82
    i32 66, label %78
    i32 76, label %74
    i32 72, label %70
    i32 77, label %67
    i32 109, label %64
    i32 67, label %61
  ]

; <label>:61:                                     ; preds = %.lr.ph.split.us
  %62 = load i32, i32* %53, align 8
  %63 = or i32 %62, 32768
  store i32 %63, i32* %53, align 8
  br label %89

; <label>:64:                                     ; preds = %.lr.ph.split.us
  %65 = load i32, i32* %53, align 8
  %66 = and i32 %65, -2049
  store i32 %66, i32* %53, align 8
  br label %89

; <label>:67:                                     ; preds = %.lr.ph.split.us
  %68 = load i32, i32* %53, align 8
  %69 = or i32 %68, 2048
  store i32 %69, i32* %53, align 8
  br label %89

; <label>:70:                                     ; preds = %.lr.ph.split.us
  %71 = load i32, i32* %53, align 8
  %72 = and i32 %71, -4
  %73 = or i32 %72, 1
  store i32 %73, i32* %53, align 8
  br label %89

; <label>:74:                                     ; preds = %.lr.ph.split.us
  %75 = load i32, i32* %53, align 8
  %76 = and i32 %75, -4
  %77 = or i32 %76, 2
  store i32 %77, i32* %53, align 8
  br label %89

; <label>:78:                                     ; preds = %.lr.ph.split.us
  %79 = load i32, i32* %53, align 8
  %80 = and i32 %79, -4
  %81 = or i32 %80, 1
  store i32 %81, i32* %53, align 8
  br label %89

; <label>:82:                                     ; preds = %.lr.ph.split.us
  %83 = load i32, i32* %53, align 8
  %84 = and i32 %83, -32769
  store i32 %84, i32* %53, align 8
  br label %89

; <label>:85:                                     ; preds = %.lr.ph.split.us
  br i1 %58, label %89, label %86

; <label>:86:                                     ; preds = %85
  %87 = load i32, i32* %53, align 8
  %88 = or i32 %87, 128
  store i32 %88, i32* %53, align 8
  br label %89

; <label>:89:                                     ; preds = %86, %85, %82, %78, %74, %70, %67, %64, %61, %.lr.ph.split.us
  %90 = getelementptr inbounds i8, i8* %.013.us, i64 1
  %91 = load i8, i8* %90, align 1
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %._crit_edge.loopexit, label %.lr.ph.split.us

.lr.ph.split:                                     ; preds = %.lr.ph
  br i1 %58, label %.lr.ph.split.split.us.preheader, label %.lr.ph.split.split.preheader

.lr.ph.split.split.preheader:                     ; preds = %.lr.ph.split
  br label %.lr.ph.split.split

.lr.ph.split.split.us.preheader:                  ; preds = %.lr.ph.split
  br label %.lr.ph.split.split.us

.lr.ph.split.split.us:                            ; preds = %.lr.ph.split.split.us.preheader, %100
  %93 = phi i8 [ %102, %100 ], [ %55, %.lr.ph.split.split.us.preheader ]
  %.013.us4 = phi i8* [ %101, %100 ], [ %1, %.lr.ph.split.split.us.preheader ]
  %94 = sext i8 %93 to i32
  switch i32 %94, label %100 [
    i32 72, label %95
    i32 76, label %.sink.split
    i32 66, label %96
  ]

; <label>:95:                                     ; preds = %.lr.ph.split.split.us
  br label %.sink.split

; <label>:96:                                     ; preds = %.lr.ph.split.split.us
  br label %.sink.split

.sink.split:                                      ; preds = %.lr.ph.split.split.us, %95, %96
  %.sink6 = phi i32 [ 1, %96 ], [ 1, %95 ], [ 2, %.lr.ph.split.split.us ]
  %97 = load i32, i32* %53, align 8
  %98 = and i32 %97, -4
  %99 = or i32 %98, %.sink6
  store i32 %99, i32* %53, align 8
  br label %100

; <label>:100:                                    ; preds = %.sink.split, %.lr.ph.split.split.us
  %101 = getelementptr inbounds i8, i8* %.013.us4, i64 1
  %102 = load i8, i8* %101, align 1
  %103 = icmp eq i8 %102, 0
  br i1 %103, label %._crit_edge.loopexit14, label %.lr.ph.split.split.us

.lr.ph.split.split:                               ; preds = %.lr.ph.split.split.preheader, %121
  %104 = phi i8 [ %123, %121 ], [ %55, %.lr.ph.split.split.preheader ]
  %.013 = phi i8* [ %122, %121 ], [ %1, %.lr.ph.split.split.preheader ]
  %105 = sext i8 %104 to i32
  switch i32 %105, label %121 [
    i32 98, label %106
    i32 72, label %117
    i32 66, label %109
    i32 76, label %113
  ]

; <label>:106:                                    ; preds = %.lr.ph.split.split
  %107 = load i32, i32* %53, align 8
  %108 = or i32 %107, 128
  br label %.sink.split7

; <label>:109:                                    ; preds = %.lr.ph.split.split
  %110 = load i32, i32* %53, align 8
  %111 = and i32 %110, -4
  %112 = or i32 %111, 1
  br label %.sink.split7

; <label>:113:                                    ; preds = %.lr.ph.split.split
  %114 = load i32, i32* %53, align 8
  %115 = and i32 %114, -4
  %116 = or i32 %115, 2
  br label %.sink.split7

; <label>:117:                                    ; preds = %.lr.ph.split.split
  %118 = load i32, i32* %53, align 8
  %119 = and i32 %118, -4
  %120 = or i32 %119, 1
  br label %.sink.split7

.sink.split7:                                     ; preds = %106, %117, %113, %109
  %.sink = phi i32 [ %112, %109 ], [ %116, %113 ], [ %120, %117 ], [ %108, %106 ]
  store i32 %.sink, i32* %53, align 8
  br label %121

; <label>:121:                                    ; preds = %.sink.split7, %.lr.ph.split.split
  %122 = getelementptr inbounds i8, i8* %.013, i64 1
  %123 = load i8, i8* %122, align 1
  %124 = icmp eq i8 %123, 0
  br i1 %124, label %._crit_edge.loopexit15, label %.lr.ph.split.split

._crit_edge.loopexit:                             ; preds = %89
  br label %._crit_edge

._crit_edge.loopexit14:                           ; preds = %100
  br label %._crit_edge

._crit_edge.loopexit15:                           ; preds = %121
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit15, %._crit_edge.loopexit14, %._crit_edge.loopexit, %21
  %125 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %39, align 8
  %126 = load i8*, i8** %37, align 8
  %127 = getelementptr inbounds i8, i8* %17, i64 504
  %128 = tail call i32 %125(i8* %126, i8* %127, i32 8) #6
  %129 = icmp eq i32 %128, 8
  br i1 %129, label %162, label %130

; <label>:130:                                    ; preds = %._crit_edge
  %131 = load i32, i32* %27, align 4
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %134

; <label>:133:                                    ; preds = %130
  tail call void (i8*, i8*, ...) @TIFFError(i8* %0, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0)) #6
  br label %228

; <label>:134:                                    ; preds = %130
  %135 = load i32, i32* %53, align 8
  %136 = trunc i32 %135 to i8
  %137 = icmp slt i8 %136, 0
  %138 = select i1 %137, i16 19789, i16 18761
  %139 = bitcast i8* %127 to i16*
  store i16 %138, i16* %139, align 8
  %140 = getelementptr inbounds i8, i8* %17, i64 506
  %141 = bitcast i8* %140 to i16*
  store i16 42, i16* %141, align 2
  %142 = load i32, i32* %53, align 8
  %143 = trunc i32 %142 to i8
  %144 = icmp slt i8 %143, 0
  br i1 %144, label %145, label %146

; <label>:145:                                    ; preds = %134
  tail call void @TIFFSwabShort(i16* %141) #6
  br label %146

; <label>:146:                                    ; preds = %145, %134
  %147 = getelementptr inbounds i8, i8* %17, i64 508
  %148 = bitcast i8* %147 to i32*
  store i32 0, i32* %148, align 4
  %149 = load i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)** %41, align 8
  %150 = load i8*, i8** %37, align 8
  %151 = tail call i32 %149(i8* %150, i8* nonnull %127, i32 8) #6
  %152 = icmp eq i32 %151, 8
  br i1 %152, label %154, label %153

; <label>:153:                                    ; preds = %146
  tail call void (i8*, i8*, ...) @TIFFError(i8* %0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %228

; <label>:154:                                    ; preds = %146
  %155 = load i16, i16* %139, align 8
  %156 = zext i16 %155 to i32
  tail call fastcc void @TIFFInitOrder(%struct.tiff* nonnull %18, i32 %156, i32 0)
  %157 = tail call i32 @TIFFDefaultDirectory(%struct.tiff* nonnull %18) #6
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %228, label %159

; <label>:159:                                    ; preds = %154
  %160 = getelementptr inbounds i8, i8* %17, i64 20
  %161 = bitcast i8* %160 to i32*
  store i32 0, i32* %161, align 4
  br label %231

; <label>:162:                                    ; preds = %._crit_edge
  %163 = bitcast i8* %127 to i16*
  %164 = load i16, i16* %163, align 8
  switch i16 %164, label %165 [
    i16 19789, label %167
    i16 18761, label %167
  ]

; <label>:165:                                    ; preds = %162
  %166 = zext i16 %164 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.4, i64 0, i64 0), i32 %166, i32 %166) #6
  br label %228

; <label>:167:                                    ; preds = %162, %162
  %168 = load i16, i16* %163, align 8
  %169 = zext i16 %168 to i32
  tail call fastcc void @TIFFInitOrder(%struct.tiff* nonnull %18, i32 %169, i32 0)
  %170 = load i32, i32* %53, align 8
  %171 = trunc i32 %170 to i8
  %172 = icmp slt i8 %171, 0
  br i1 %172, label %173, label %178

; <label>:173:                                    ; preds = %167
  %174 = getelementptr inbounds i8, i8* %17, i64 506
  %175 = bitcast i8* %174 to i16*
  tail call void @TIFFSwabShort(i16* %175) #6
  %176 = getelementptr inbounds i8, i8* %17, i64 508
  %177 = bitcast i8* %176 to i32*
  tail call void @TIFFSwabLong(i32* %177) #6
  br label %178

; <label>:178:                                    ; preds = %173, %167
  %179 = getelementptr inbounds i8, i8* %17, i64 506
  %180 = bitcast i8* %179 to i16*
  %181 = load i16, i16* %180, align 2
  %182 = icmp eq i16 %181, 42
  br i1 %182, label %185, label %183

; <label>:183:                                    ; preds = %178
  %184 = zext i16 %181 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.5, i64 0, i64 0), i32 %184, i32 %184) #6
  br label %228

; <label>:185:                                    ; preds = %178
  %186 = load i32, i32* %53, align 8
  %187 = or i32 %186, 512
  store i32 %187, i32* %53, align 8
  %188 = getelementptr inbounds i8, i8* %17, i64 720
  %189 = bitcast i8* %188 to i8**
  store i8* null, i8** %189, align 8
  %190 = getelementptr inbounds i8, i8* %17, i64 736
  %191 = bitcast i8* %190 to i8**
  store i8* null, i8** %191, align 8
  %192 = getelementptr inbounds i8, i8* %17, i64 728
  %193 = bitcast i8* %192 to i32*
  store i32 0, i32* %193, align 8
  %194 = load i8, i8* %1, align 1
  %195 = sext i8 %194 to i32
  switch i32 %195, label %228 [
    i32 114, label %196
    i32 97, label %225
  ]

; <label>:196:                                    ; preds = %185
  %197 = getelementptr inbounds i8, i8* %17, i64 508
  %198 = bitcast i8* %197 to i32*
  %199 = load i32, i32* %198, align 4
  %200 = getelementptr inbounds i8, i8* %17, i64 24
  %201 = bitcast i8* %200 to i32*
  store i32 %199, i32* %201, align 8
  %202 = load i32, i32* %53, align 8
  %203 = and i32 %202, 2048
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %217, label %205

; <label>:205:                                    ; preds = %196
  %206 = load i32 (i8*, i8**, i32*)*, i32 (i8*, i8**, i32*)** %49, align 8
  %207 = load i8*, i8** %37, align 8
  %208 = getelementptr inbounds i8, i8* %17, i64 752
  %209 = bitcast i8* %208 to i8**
  %210 = getelementptr inbounds i8, i8* %17, i64 760
  %211 = bitcast i8* %210 to i32*
  %212 = tail call i32 %206(i8* %207, i8** %209, i32* %211) #6
  %213 = icmp eq i32 %212, 0
  br i1 %213, label %214, label %217

; <label>:214:                                    ; preds = %205
  %215 = load i32, i32* %53, align 8
  %216 = and i32 %215, -2049
  store i32 %216, i32* %53, align 8
  br label %217

; <label>:217:                                    ; preds = %205, %196, %214
  %218 = tail call i32 @TIFFReadDirectory(%struct.tiff* nonnull %18) #6
  %219 = icmp eq i32 %218, 0
  br i1 %219, label %228, label %220

; <label>:220:                                    ; preds = %217
  %221 = getelementptr inbounds i8, i8* %17, i64 744
  %222 = bitcast i8* %221 to i32*
  store i32 -1, i32* %222, align 8
  %223 = load i32, i32* %53, align 8
  %224 = or i32 %223, 16
  store i32 %224, i32* %53, align 8
  br label %231

; <label>:225:                                    ; preds = %185
  %226 = tail call i32 @TIFFDefaultDirectory(%struct.tiff* nonnull %18) #6
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %228, label %231

; <label>:228:                                    ; preds = %185, %217, %225, %154, %183, %165, %153, %133
  store i32 0, i32* %27, align 4
  tail call void @TIFFClose(%struct.tiff* nonnull %18) #6
  br label %231

; <label>:229:                                    ; preds = %10, %20
  %230 = tail call i32 %6(i8* %2) #6
  br label %231

; <label>:231:                                    ; preds = %225, %229, %228, %220, %159
  %.0 = phi %struct.tiff* [ null, %229 ], [ null, %228 ], [ %18, %220 ], [ %18, %159 ], [ %18, %225 ]
  ret %struct.tiff* %.0
}

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #2

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8* nocapture readonly) local_unnamed_addr #3

declare void @_TIFFSetDefaultCompressionState(%struct.tiff*) local_unnamed_addr #1

declare void @TIFFSwabShort(i16*) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @TIFFInitOrder(%struct.tiff* nocapture, i32, i32) unnamed_addr #4 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 10
  store i64* getelementptr inbounds ([13 x i64], [13 x i64]* @typemask, i64 0, i64 0), i64** %4, align 8
  %5 = icmp eq i32 %1, 19789
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 9
  br i1 %5, label %7, label %13

; <label>:7:                                      ; preds = %3
  store i32* getelementptr inbounds ([13 x i32], [13 x i32]* @bigTypeshift, i64 0, i64 0), i32** %6, align 8
  %8 = icmp eq i32 %2, 0
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %7
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %11 = load i32, i32* %10, align 8
  %12 = or i32 %11, 128
  store i32 %12, i32* %10, align 8
  br label %19

; <label>:13:                                     ; preds = %3
  store i32* getelementptr inbounds ([13 x i32], [13 x i32]* @litTypeshift, i64 0, i64 0), i32** %6, align 8
  %14 = icmp eq i32 %2, 0
  br i1 %14, label %19, label %15

; <label>:15:                                     ; preds = %13
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %17 = load i32, i32* %16, align 8
  %18 = or i32 %17, 128
  store i32 %18, i32* %16, align 8
  br label %19

; <label>:19:                                     ; preds = %15, %13, %9, %7
  ret void
}

declare i32 @TIFFDefaultDirectory(%struct.tiff*) local_unnamed_addr #1

declare void @TIFFSwabLong(i32*) local_unnamed_addr #1

declare i32 @TIFFReadDirectory(%struct.tiff*) local_unnamed_addr #1

declare void @TIFFClose(%struct.tiff*) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i8* @TIFFFileName(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %3 = load i8*, i8** %2, align 8
  ret i8* %3
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFFileno(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 1
  %3 = load i32, i32* %2, align 8
  ret i32 %3
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFGetMode(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %3 = load i32, i32* %2, align 4
  ret i32 %3
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFIsTiled(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 8
  %4 = lshr i32 %3, 10
  %.lobit = and i32 %4, 1
  ret i32 %.lobit
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFCurrentRow(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %3 = load i32, i32* %2, align 8
  ret i32 %3
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define zeroext i16 @TIFFCurrentDirectory(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 12
  %3 = load i16, i16* %2, align 4
  ret i16 %3
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFCurrentStrip(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  %3 = load i32, i32* %2, align 8
  ret i32 %3
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFCurrentTile(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 19
  %3 = load i32, i32* %2, align 8
  ret i32 %3
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFIsByteSwapped(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 8
  %.lobit = lshr i32 %3, 7
  %4 = and i32 %.lobit, 1
  ret i32 %4
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFIsUpSampled(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 8
  %4 = lshr i32 %3, 14
  %.lobit = and i32 %4, 1
  ret i32 %.lobit
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFIsMSB2LSB(%struct.tiff* nocapture readonly) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 8
  %4 = and i32 %3, 1
  ret i32 %4
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
