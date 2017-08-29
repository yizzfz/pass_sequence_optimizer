; ModuleID = 'tif_packbits.ll'
source_filename = "tif_packbits.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [49 x i8] c"PackBitsDecode: Not enough data for scanline %ld\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"rowsize > 0\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"tif_packbits.c\00", align 1
@__PRETTY_FUNCTION__.PackBitsEncodeChunk = private unnamed_addr constant [62 x i8] c"int PackBitsEncodeChunk(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @TIFFInitPackBits(%struct.tiff* nocapture, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %3, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %4, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsDecode, i32 (%struct.tiff*, i8*, i32, i16)** %5, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 24
  store i32 (%struct.tiff*, i16)* @PackBitsPreEncode, i32 (%struct.tiff*, i16)** %6, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncode, i32 (%struct.tiff*, i8*, i32, i16)** %7, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncodeChunk, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @PackBitsEncodeChunk, i32 (%struct.tiff*, i8*, i32, i16)** %9, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PackBitsDecode(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #1 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %8 = load i32, i32* %7, align 8
  %9 = icmp sgt i32 %2, 0
  br i1 %9, label %.outer.split.us.preheader.preheader, label %.us-lcssa.us.thread

.outer.split.us.preheader.preheader:              ; preds = %4
  br label %.outer.split.us.preheader

.outer.split.us.preheader:                        ; preds = %.outer.split.us.preheader.preheader, %.loopexit
  %10 = phi i1 [ %44, %.loopexit ], [ %9, %.outer.split.us.preheader.preheader ]
  %.02.ph75 = phi i8* [ %.2, %.loopexit ], [ %1, %.outer.split.us.preheader.preheader ]
  %.04.ph74 = phi i32 [ %.15, %.loopexit ], [ %2, %.outer.split.us.preheader.preheader ]
  %.06.ph73 = phi i32 [ %.17, %.loopexit ], [ %8, %.outer.split.us.preheader.preheader ]
  %.08.ph72 = phi i8* [ %.19, %.loopexit ], [ %6, %.outer.split.us.preheader.preheader ]
  br label %.outer.split.us

.us-lcssa.us.thread.loopexit:                     ; preds = %.loopexit
  br label %.us-lcssa.us.thread

.us-lcssa.us.thread:                              ; preds = %.us-lcssa.us.thread.loopexit, %4
  %.08.ph.lcssa = phi i8* [ %6, %4 ], [ %.19, %.us-lcssa.us.thread.loopexit ]
  %.06.ph.lcssa = phi i32 [ %8, %4 ], [ %.17, %.us-lcssa.us.thread.loopexit ]
  store i8* %.08.ph.lcssa, i8** %5, align 8
  store i32 %.06.ph.lcssa, i32* %7, align 8
  br label %51

.outer.split.us:                                  ; preds = %.outer.split.us.preheader, %17
  %.08.us = phi i8* [ %13, %17 ], [ %.08.ph72, %.outer.split.us.preheader ]
  %.06.us = phi i32 [ %15, %17 ], [ %.06.ph73, %.outer.split.us.preheader ]
  %11 = icmp sgt i32 %.06.us, 0
  br i1 %11, label %12, label %.us-lcssa.us

; <label>:12:                                     ; preds = %.outer.split.us
  %13 = getelementptr inbounds i8, i8* %.08.us, i64 1
  %14 = load i8, i8* %.08.us, align 1
  %15 = add nsw i32 %.06.us, -1
  %16 = icmp slt i8 %14, 0
  br i1 %16, label %17, label %.us-lcssa24.us

; <label>:17:                                     ; preds = %12
  %18 = icmp eq i8 %14, -128
  br i1 %18, label %.outer.split.us, label %.us-lcssa25.us

.us-lcssa25.us:                                   ; preds = %17
  %19 = sext i8 %14 to i64
  %20 = sub nsw i64 1, %19
  %21 = sext i32 %.04.ph74 to i64
  %22 = sub nsw i64 %21, %20
  %23 = getelementptr inbounds i8, i8* %.08.us, i64 2
  %24 = add nsw i32 %.06.us, -2
  %25 = icmp sgt i64 %20, 0
  br i1 %25, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.us-lcssa25.us
  %26 = load i8, i8* %13, align 1
  %27 = add nsw i64 %19, -2
  %28 = icmp sgt i64 %27, -2
  %smax = select i1 %28, i64 %27, i64 -2
  %29 = add nsw i64 %smax, 3
  %30 = sub nsw i64 %29, %19
  call void @llvm.memset.p0i8.i64(i8* %.02.ph75, i8 %26, i64 %30, i32 1, i1 false)
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.127 = phi i64 [ %31, %.lr.ph ], [ %20, %.lr.ph.preheader ]
  %.1326 = phi i8* [ %32, %.lr.ph ], [ %.02.ph75, %.lr.ph.preheader ]
  %31 = add nsw i64 %.127, -1
  %32 = getelementptr inbounds i8, i8* %.1326, i64 1
  %33 = icmp sgt i64 %.127, 1
  br i1 %33, label %.lr.ph, label %.loopexit.loopexit

.us-lcssa24.us:                                   ; preds = %12
  %34 = sext i8 %14 to i64
  %35 = add nsw i64 %34, 1
  %36 = trunc i64 %35 to i32
  tail call void @_TIFFmemcpy(i8* %.02.ph75, i8* %13, i32 %36) #5
  %37 = getelementptr inbounds i8, i8* %.02.ph75, i64 %35
  %38 = zext i32 %.04.ph74 to i64
  %39 = sub nsw i64 %38, %35
  %40 = getelementptr inbounds i8, i8* %13, i64 %35
  %41 = zext i32 %15 to i64
  %42 = sub nsw i64 %41, %35
  %43 = trunc i64 %42 to i32
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.us-lcssa25.us, %.us-lcssa24.us
  %.19 = phi i8* [ %40, %.us-lcssa24.us ], [ %23, %.us-lcssa25.us ], [ %23, %.loopexit.loopexit ]
  %.17 = phi i32 [ %43, %.us-lcssa24.us ], [ %24, %.us-lcssa25.us ], [ %24, %.loopexit.loopexit ]
  %.15.in = phi i64 [ %39, %.us-lcssa24.us ], [ %22, %.us-lcssa25.us ], [ %22, %.loopexit.loopexit ]
  %.2 = phi i8* [ %37, %.us-lcssa24.us ], [ %.02.ph75, %.us-lcssa25.us ], [ %32, %.loopexit.loopexit ]
  %.15 = trunc i64 %.15.in to i32
  %44 = icmp sgt i32 %.15, 0
  br i1 %44, label %.outer.split.us.preheader, label %.us-lcssa.us.thread.loopexit

.us-lcssa.us:                                     ; preds = %.outer.split.us
  store i8* %.08.us, i8** %5, align 8
  store i32 %.06.us, i32* %7, align 8
  br i1 %10, label %45, label %51

; <label>:45:                                     ; preds = %.us-lcssa.us
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %47 = load i8*, i8** %46, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %49 = load i32, i32* %48, align 8
  %50 = zext i32 %49 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %47, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i64 0, i64 0), i64 %50) #5
  br label %51

; <label>:51:                                     ; preds = %.us-lcssa.us.thread, %.us-lcssa.us, %45
  %.0 = phi i32 [ 0, %45 ], [ 1, %.us-lcssa.us ], [ 1, %.us-lcssa.us.thread ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PackBitsPreEncode(%struct.tiff*, i16 zeroext) #1 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %4 = load i32, i32* %3, align 8
  %5 = and i32 %4, 1024
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %9, label %7

; <label>:7:                                      ; preds = %2
  %8 = tail call i32 @TIFFTileRowSize(%struct.tiff* nonnull %0) #5
  br label %11

; <label>:9:                                      ; preds = %2
  %10 = tail call i32 @TIFFScanlineSize(%struct.tiff* nonnull %0) #5
  br label %11

; <label>:11:                                     ; preds = %9, %7
  %.sink = phi i32 [ %10, %9 ], [ %8, %7 ]
  %12 = sext i32 %.sink to i64
  %13 = inttoptr i64 %12 to i8*
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  store i8* %13, i8** %14, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PackBitsEncode(%struct.tiff*, i8* nocapture readonly, i32, i16 zeroext) #1 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %10 = load i32, i32* %9, align 8
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, i8* %8, i64 %11
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %.lr.ph88, label %._crit_edge89

.lr.ph88:                                         ; preds = %4
  %14 = bitcast i8** %5 to i64*
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %16 = bitcast i8** %5 to i64*
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  br label %18

; <label>:18:                                     ; preds = %.lr.ph88, %.backedge
  %.0186 = phi i32 [ 0, %.lr.ph88 ], [ %.01.be, %.backedge ]
  %.0385 = phi i32 [ %2, %.lr.ph88 ], [ %.14.lcssa, %.backedge ]
  %.0784 = phi i8* [ %1, %.lr.ph88 ], [ %.18.lcssa, %.backedge ]
  %.0983 = phi i8* [ %6, %.lr.ph88 ], [ %.09.be, %.backedge ]
  %.01782 = phi i8* [ null, %.lr.ph88 ], [ %.017.be, %.backedge ]
  %19 = load i8, i8* %.0784, align 1
  %.1864 = getelementptr inbounds i8, i8* %.0784, i64 1
  %.1465 = add nsw i32 %.0385, -1
  %20 = icmp sgt i32 %.0385, 1
  br i1 %20, label %.lr.ph.preheader, label %.critedge.preheader

.lr.ph.preheader:                                 ; preds = %18
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %23
  %.1468 = phi i32 [ %.14, %23 ], [ %.1465, %.lr.ph.preheader ]
  %.1867 = phi i8* [ %.18, %23 ], [ %.1864, %.lr.ph.preheader ]
  %.0566 = phi i64 [ %24, %23 ], [ 1, %.lr.ph.preheader ]
  %21 = load i8, i8* %.1867, align 1
  %22 = icmp eq i8 %19, %21
  br i1 %22, label %23, label %.critedge.preheader.loopexit

.critedge.preheader.loopexit:                     ; preds = %23, %.lr.ph
  %.05.lcssa.ph = phi i64 [ %24, %23 ], [ %.0566, %.lr.ph ]
  %.18.lcssa.ph = phi i8* [ %.18, %23 ], [ %.1867, %.lr.ph ]
  %.14.lcssa.ph = phi i32 [ %.14, %23 ], [ %.1468, %.lr.ph ]
  br label %.critedge.preheader

.critedge.preheader:                              ; preds = %.critedge.preheader.loopexit, %18
  %.05.lcssa = phi i64 [ 1, %18 ], [ %.05.lcssa.ph, %.critedge.preheader.loopexit ]
  %.18.lcssa = phi i8* [ %.1864, %18 ], [ %.18.lcssa.ph, %.critedge.preheader.loopexit ]
  %.14.lcssa = phi i32 [ %.1465, %18 ], [ %.14.lcssa.ph, %.critedge.preheader.loopexit ]
  br label %.critedge.outer

; <label>:23:                                     ; preds = %.lr.ph
  %24 = add nuw nsw i64 %.0566, 1
  %.18 = getelementptr inbounds i8, i8* %.1867, i64 1
  %.14 = add nsw i32 %.1468, -1
  %25 = icmp sgt i32 %.1468, 1
  br i1 %25, label %.lr.ph, label %.critedge.preheader.loopexit

.critedge:                                        ; preds = %.critedge.preheader294, %108
  %.118 = phi i8* [ %.421, %108 ], [ %.118.ph, %.critedge.preheader294 ]
  %.110 = phi i8* [ %.413, %108 ], [ %.110.ph, %.critedge.preheader294 ]
  %.1 = phi i32 [ 2, %108 ], [ %.1.ph, %.critedge.preheader294 ]
  %26 = getelementptr inbounds i8, i8* %.110, i64 2
  %27 = icmp ult i8* %26, %12
  br i1 %27, label %108, label %28

; <label>:28:                                     ; preds = %.critedge
  switch i32 %.1, label %96 [
    i32 1, label %29
    i32 3, label %29
  ]

; <label>:29:                                     ; preds = %28, %28
  %30 = load i64, i64* %16, align 8
  %31 = ptrtoint i8* %.118 to i64
  %32 = sub i64 %31, %30
  %33 = load i32, i32* %17, align 8
  %34 = zext i32 %33 to i64
  %35 = add i64 %32, %34
  %36 = trunc i64 %35 to i32
  store i32 %36, i32* %17, align 8
  %37 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #5
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %.loopexit.loopexit295, label %39

; <label>:39:                                     ; preds = %29
  %40 = ptrtoint i8* %.110 to i64
  %41 = sub i64 %40, %31
  %42 = load i8*, i8** %5, align 8
  %43 = icmp sgt i64 %41, 0
  br i1 %43, label %.lr.ph78.preheader, label %._crit_edge

.lr.ph78.preheader:                               ; preds = %39
  %44 = add i64 %40, 2
  %45 = add i64 %31, -1
  %46 = sub i64 %45, %40
  %47 = icmp sgt i64 %46, -2
  %smax254 = select i1 %47, i64 %46, i64 -2
  %48 = add i64 %44, %smax254
  %49 = sub i64 %48, %31
  %min.iters.check255 = icmp ult i64 %49, 32
  br i1 %min.iters.check255, label %.lr.ph78.preheader293, label %min.iters.checked256

min.iters.checked256:                             ; preds = %.lr.ph78.preheader
  %n.vec258 = and i64 %49, -32
  %cmp.zero259 = icmp eq i64 %n.vec258, 0
  br i1 %cmp.zero259, label %.lr.ph78.preheader293, label %vector.memcheck270

vector.memcheck270:                               ; preds = %min.iters.checked256
  %scevgep261 = getelementptr i8, i8* %42, i64 2
  %50 = add i64 %31, -1
  %51 = sub i64 %50, %40
  %52 = icmp sgt i64 %51, -2
  %smax262 = select i1 %52, i64 %51, i64 -2
  %53 = add i64 %40, %smax262
  %54 = sub i64 %53, %31
  %scevgep263 = getelementptr i8, i8* %scevgep261, i64 %54
  %scevgep264 = getelementptr i8, i8* %.118, i64 2
  %scevgep265 = getelementptr i8, i8* %scevgep264, i64 %54
  %bound0266 = icmp ult i8* %42, %scevgep265
  %bound1267 = icmp ult i8* %.118, %scevgep263
  %memcheck.conflict269 = and i1 %bound0266, %bound1267
  %ind.end275 = sub i64 %41, %n.vec258
  %ind.end277 = getelementptr i8, i8* %42, i64 %n.vec258
  %ind.end279 = getelementptr i8, i8* %.118, i64 %n.vec258
  br i1 %memcheck.conflict269, label %.lr.ph78.preheader293, label %vector.body251.preheader

vector.body251.preheader:                         ; preds = %vector.memcheck270
  %55 = add i64 %n.vec258, -32
  %56 = lshr exact i64 %55, 5
  %57 = add nuw nsw i64 %56, 1
  %xtraiter = and i64 %57, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body251.prol.loopexit, label %vector.body251.prol.preheader

vector.body251.prol.preheader:                    ; preds = %vector.body251.preheader
  br label %vector.body251.prol

vector.body251.prol:                              ; preds = %vector.body251.prol, %vector.body251.prol.preheader
  %index272.prol = phi i64 [ %index.next273.prol, %vector.body251.prol ], [ 0, %vector.body251.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body251.prol ], [ %xtraiter, %vector.body251.prol.preheader ]
  %next.gep286.prol = getelementptr i8, i8* %42, i64 %index272.prol
  %next.gep288.prol = getelementptr i8, i8* %.118, i64 %index272.prol
  %58 = bitcast i8* %next.gep288.prol to <16 x i8>*
  %wide.load290.prol = load <16 x i8>, <16 x i8>* %58, align 1, !alias.scope !1
  %59 = getelementptr i8, i8* %next.gep288.prol, i64 16
  %60 = bitcast i8* %59 to <16 x i8>*
  %wide.load291.prol = load <16 x i8>, <16 x i8>* %60, align 1, !alias.scope !1
  %61 = bitcast i8* %next.gep286.prol to <16 x i8>*
  store <16 x i8> %wide.load290.prol, <16 x i8>* %61, align 1, !alias.scope !4, !noalias !1
  %62 = getelementptr i8, i8* %next.gep286.prol, i64 16
  %63 = bitcast i8* %62 to <16 x i8>*
  store <16 x i8> %wide.load291.prol, <16 x i8>* %63, align 1, !alias.scope !4, !noalias !1
  %index.next273.prol = add i64 %index272.prol, 32
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body251.prol.loopexit.unr-lcssa, label %vector.body251.prol, !llvm.loop !6

vector.body251.prol.loopexit.unr-lcssa:           ; preds = %vector.body251.prol
  br label %vector.body251.prol.loopexit

vector.body251.prol.loopexit:                     ; preds = %vector.body251.preheader, %vector.body251.prol.loopexit.unr-lcssa
  %index272.unr = phi i64 [ 0, %vector.body251.preheader ], [ %index.next273.prol, %vector.body251.prol.loopexit.unr-lcssa ]
  %64 = icmp ult i64 %55, 96
  br i1 %64, label %middle.block252, label %vector.body251.preheader.new

vector.body251.preheader.new:                     ; preds = %vector.body251.prol.loopexit
  br label %vector.body251

vector.body251:                                   ; preds = %vector.body251, %vector.body251.preheader.new
  %index272 = phi i64 [ %index272.unr, %vector.body251.preheader.new ], [ %index.next273.3, %vector.body251 ]
  %next.gep286 = getelementptr i8, i8* %42, i64 %index272
  %next.gep288 = getelementptr i8, i8* %.118, i64 %index272
  %65 = bitcast i8* %next.gep288 to <16 x i8>*
  %wide.load290 = load <16 x i8>, <16 x i8>* %65, align 1, !alias.scope !1
  %66 = getelementptr i8, i8* %next.gep288, i64 16
  %67 = bitcast i8* %66 to <16 x i8>*
  %wide.load291 = load <16 x i8>, <16 x i8>* %67, align 1, !alias.scope !1
  %68 = bitcast i8* %next.gep286 to <16 x i8>*
  store <16 x i8> %wide.load290, <16 x i8>* %68, align 1, !alias.scope !4, !noalias !1
  %69 = getelementptr i8, i8* %next.gep286, i64 16
  %70 = bitcast i8* %69 to <16 x i8>*
  store <16 x i8> %wide.load291, <16 x i8>* %70, align 1, !alias.scope !4, !noalias !1
  %index.next273 = add i64 %index272, 32
  %next.gep286.1 = getelementptr i8, i8* %42, i64 %index.next273
  %next.gep288.1 = getelementptr i8, i8* %.118, i64 %index.next273
  %71 = bitcast i8* %next.gep288.1 to <16 x i8>*
  %wide.load290.1 = load <16 x i8>, <16 x i8>* %71, align 1, !alias.scope !1
  %72 = getelementptr i8, i8* %next.gep288.1, i64 16
  %73 = bitcast i8* %72 to <16 x i8>*
  %wide.load291.1 = load <16 x i8>, <16 x i8>* %73, align 1, !alias.scope !1
  %74 = bitcast i8* %next.gep286.1 to <16 x i8>*
  store <16 x i8> %wide.load290.1, <16 x i8>* %74, align 1, !alias.scope !4, !noalias !1
  %75 = getelementptr i8, i8* %next.gep286.1, i64 16
  %76 = bitcast i8* %75 to <16 x i8>*
  store <16 x i8> %wide.load291.1, <16 x i8>* %76, align 1, !alias.scope !4, !noalias !1
  %index.next273.1 = add i64 %index272, 64
  %next.gep286.2 = getelementptr i8, i8* %42, i64 %index.next273.1
  %next.gep288.2 = getelementptr i8, i8* %.118, i64 %index.next273.1
  %77 = bitcast i8* %next.gep288.2 to <16 x i8>*
  %wide.load290.2 = load <16 x i8>, <16 x i8>* %77, align 1, !alias.scope !1
  %78 = getelementptr i8, i8* %next.gep288.2, i64 16
  %79 = bitcast i8* %78 to <16 x i8>*
  %wide.load291.2 = load <16 x i8>, <16 x i8>* %79, align 1, !alias.scope !1
  %80 = bitcast i8* %next.gep286.2 to <16 x i8>*
  store <16 x i8> %wide.load290.2, <16 x i8>* %80, align 1, !alias.scope !4, !noalias !1
  %81 = getelementptr i8, i8* %next.gep286.2, i64 16
  %82 = bitcast i8* %81 to <16 x i8>*
  store <16 x i8> %wide.load291.2, <16 x i8>* %82, align 1, !alias.scope !4, !noalias !1
  %index.next273.2 = add i64 %index272, 96
  %next.gep286.3 = getelementptr i8, i8* %42, i64 %index.next273.2
  %next.gep288.3 = getelementptr i8, i8* %.118, i64 %index.next273.2
  %83 = bitcast i8* %next.gep288.3 to <16 x i8>*
  %wide.load290.3 = load <16 x i8>, <16 x i8>* %83, align 1, !alias.scope !1
  %84 = getelementptr i8, i8* %next.gep288.3, i64 16
  %85 = bitcast i8* %84 to <16 x i8>*
  %wide.load291.3 = load <16 x i8>, <16 x i8>* %85, align 1, !alias.scope !1
  %86 = bitcast i8* %next.gep286.3 to <16 x i8>*
  store <16 x i8> %wide.load290.3, <16 x i8>* %86, align 1, !alias.scope !4, !noalias !1
  %87 = getelementptr i8, i8* %next.gep286.3, i64 16
  %88 = bitcast i8* %87 to <16 x i8>*
  store <16 x i8> %wide.load291.3, <16 x i8>* %88, align 1, !alias.scope !4, !noalias !1
  %index.next273.3 = add i64 %index272, 128
  %89 = icmp eq i64 %index.next273.3, %n.vec258
  br i1 %89, label %middle.block252.unr-lcssa, label %vector.body251, !llvm.loop !8

middle.block252.unr-lcssa:                        ; preds = %vector.body251
  br label %middle.block252

middle.block252:                                  ; preds = %vector.body251.prol.loopexit, %middle.block252.unr-lcssa
  %cmp.n280 = icmp eq i64 %49, %n.vec258
  br i1 %cmp.n280, label %._crit_edge, label %.lr.ph78.preheader293

.lr.ph78.preheader293:                            ; preds = %middle.block252, %vector.memcheck270, %min.iters.checked256, %.lr.ph78.preheader
  %.0277.ph = phi i64 [ %41, %vector.memcheck270 ], [ %41, %min.iters.checked256 ], [ %41, %.lr.ph78.preheader ], [ %ind.end275, %middle.block252 ]
  %.21176.ph = phi i8* [ %42, %vector.memcheck270 ], [ %42, %min.iters.checked256 ], [ %42, %.lr.ph78.preheader ], [ %ind.end277, %middle.block252 ]
  %.21975.ph = phi i8* [ %.118, %vector.memcheck270 ], [ %.118, %min.iters.checked256 ], [ %.118, %.lr.ph78.preheader ], [ %ind.end279, %middle.block252 ]
  br label %.lr.ph78

.lr.ph78:                                         ; preds = %.lr.ph78.preheader293, %.lr.ph78
  %.0277 = phi i64 [ %90, %.lr.ph78 ], [ %.0277.ph, %.lr.ph78.preheader293 ]
  %.21176 = phi i8* [ %93, %.lr.ph78 ], [ %.21176.ph, %.lr.ph78.preheader293 ]
  %.21975 = phi i8* [ %91, %.lr.ph78 ], [ %.21975.ph, %.lr.ph78.preheader293 ]
  %90 = add nsw i64 %.0277, -1
  %91 = getelementptr inbounds i8, i8* %.21975, i64 1
  %92 = load i8, i8* %.21975, align 1
  %93 = getelementptr inbounds i8, i8* %.21176, i64 1
  store i8 %92, i8* %.21176, align 1
  %94 = icmp sgt i64 %.0277, 1
  br i1 %94, label %.lr.ph78, label %._crit_edge.loopexit, !llvm.loop !11

._crit_edge.loopexit:                             ; preds = %.lr.ph78
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block252, %39
  %.211.lcssa = phi i8* [ %42, %39 ], [ %ind.end277, %middle.block252 ], [ %93, %._crit_edge.loopexit ]
  %95 = load i8*, i8** %5, align 8
  br label %108

; <label>:96:                                     ; preds = %28
  %97 = load i64, i64* %14, align 8
  %98 = ptrtoint i8* %.110 to i64
  %99 = sub i64 %98, %97
  %100 = load i32, i32* %15, align 8
  %101 = zext i32 %100 to i64
  %102 = add i64 %99, %101
  %103 = trunc i64 %102 to i32
  store i32 %103, i32* %15, align 8
  %104 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #5
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %.loopexit.loopexit295, label %106

; <label>:106:                                    ; preds = %96
  %107 = load i8*, i8** %5, align 8
  br label %108

; <label>:108:                                    ; preds = %._crit_edge, %106, %.critedge
  %.421 = phi i8* [ %.118, %.critedge ], [ %95, %._crit_edge ], [ %.118, %106 ]
  %.413 = phi i8* [ %.110, %.critedge ], [ %.211.lcssa, %._crit_edge ], [ %107, %106 ]
  switch i32 %.1, label %.backedge.loopexit296 [
    i32 0, label %.us-lcssa.loopexit297
    i32 1, label %.us-lcssa80.loopexit298
    i32 2, label %.us-lcssa81.loopexit299
    i32 3, label %.critedge
  ]

.us-lcssa.loopexit:                               ; preds = %230
  br label %.us-lcssa

.us-lcssa.loopexit297:                            ; preds = %108
  br label %.us-lcssa

.us-lcssa:                                        ; preds = %.us-lcssa.loopexit297, %.us-lcssa.loopexit
  %.421.lcssa41 = phi i8* [ %.421.us, %.us-lcssa.loopexit ], [ %.421, %.us-lcssa.loopexit297 ]
  %.413.lcssa32 = phi i8* [ %.413.us, %.us-lcssa.loopexit ], [ %.413, %.us-lcssa.loopexit297 ]
  %109 = icmp sgt i64 %.16.ph, 1
  br i1 %109, label %110, label %.loopexit31.loopexit

; <label>:110:                                    ; preds = %.us-lcssa
  %111 = icmp sgt i64 %.16.ph, 128
  br i1 %111, label %112, label %116

; <label>:112:                                    ; preds = %110
  %113 = getelementptr inbounds i8, i8* %.413.lcssa32, i64 1
  store i8 -127, i8* %.413.lcssa32, align 1
  %114 = getelementptr inbounds i8, i8* %.413.lcssa32, i64 2
  store i8 %19, i8* %113, align 1
  %115 = add nsw i64 %.16.ph, -128
  br label %.critedge.outer.backedge

; <label>:116:                                    ; preds = %110
  %117 = sub i64 1, %.16.ph
  %118 = trunc i64 %117 to i8
  br label %.loopexit31

.loopexit31.loopexit:                             ; preds = %.us-lcssa
  br label %.loopexit31

.loopexit31:                                      ; preds = %.loopexit31.loopexit, %116
  %.sink25 = phi i8 [ %118, %116 ], [ 0, %.loopexit31.loopexit ]
  %.522 = phi i8* [ %.421.lcssa41, %116 ], [ %.413.lcssa32, %.loopexit31.loopexit ]
  %.2 = phi i32 [ 2, %116 ], [ 1, %.loopexit31.loopexit ]
  %119 = getelementptr inbounds i8, i8* %.413.lcssa32, i64 1
  store i8 %.sink25, i8* %.413.lcssa32, align 1
  store i8 %19, i8* %119, align 1
  %.514 = getelementptr inbounds i8, i8* %.413.lcssa32, i64 2
  br label %.backedge

.us-lcssa80.loopexit:                             ; preds = %230
  br label %.us-lcssa80

.us-lcssa80.loopexit298:                          ; preds = %108
  br label %.us-lcssa80

.us-lcssa80:                                      ; preds = %.us-lcssa80.loopexit298, %.us-lcssa80.loopexit
  %.421.lcssa42 = phi i8* [ %.421.us, %.us-lcssa80.loopexit ], [ %.421, %.us-lcssa80.loopexit298 ]
  %.413.lcssa33 = phi i8* [ %.413.us, %.us-lcssa80.loopexit ], [ %.413, %.us-lcssa80.loopexit298 ]
  %120 = icmp sgt i64 %.16.ph, 1
  br i1 %120, label %121, label %131

; <label>:121:                                    ; preds = %.us-lcssa80
  %122 = icmp sgt i64 %.16.ph, 128
  br i1 %122, label %123, label %127

; <label>:123:                                    ; preds = %121
  %124 = getelementptr inbounds i8, i8* %.413.lcssa33, i64 1
  store i8 -127, i8* %.413.lcssa33, align 1
  %125 = getelementptr inbounds i8, i8* %.413.lcssa33, i64 2
  store i8 %19, i8* %124, align 1
  %126 = add nsw i64 %.16.ph, -128
  br label %.critedge.outer.backedge

; <label>:127:                                    ; preds = %121
  %128 = sub i64 1, %.16.ph
  %129 = trunc i64 %128 to i8
  %130 = getelementptr inbounds i8, i8* %.413.lcssa33, i64 1
  store i8 %129, i8* %.413.lcssa33, align 1
  br label %134

; <label>:131:                                    ; preds = %.us-lcssa80
  %132 = load i8, i8* %.421.lcssa42, align 1
  %133 = add i8 %132, 1
  store i8 %133, i8* %.421.lcssa42, align 1
  %not. = icmp ne i8 %133, 127
  %..1 = zext i1 %not. to i32
  br label %134

; <label>:134:                                    ; preds = %131, %127
  %.413.sink = phi i8* [ %.413.lcssa33, %131 ], [ %130, %127 ]
  %.4 = phi i32 [ %..1, %131 ], [ 3, %127 ]
  store i8 %19, i8* %.413.sink, align 1
  %.615 = getelementptr inbounds i8, i8* %.413.sink, i64 1
  br label %.backedge

.us-lcssa81.loopexit:                             ; preds = %230
  br label %.us-lcssa81

.us-lcssa81.loopexit299:                          ; preds = %108
  br label %.us-lcssa81

.us-lcssa81:                                      ; preds = %.us-lcssa81.loopexit299, %.us-lcssa81.loopexit
  %.421.lcssa43 = phi i8* [ %.421.us, %.us-lcssa81.loopexit ], [ %.421, %.us-lcssa81.loopexit299 ]
  %.413.lcssa34 = phi i8* [ %.413.us, %.us-lcssa81.loopexit ], [ %.413, %.us-lcssa81.loopexit299 ]
  %135 = icmp sgt i64 %.16.ph, 1
  br i1 %135, label %136, label %.loopexit30.loopexit

; <label>:136:                                    ; preds = %.us-lcssa81
  %137 = icmp sgt i64 %.16.ph, 128
  br i1 %137, label %138, label %142

; <label>:138:                                    ; preds = %136
  %139 = getelementptr inbounds i8, i8* %.413.lcssa34, i64 1
  store i8 -127, i8* %.413.lcssa34, align 1
  %140 = getelementptr inbounds i8, i8* %.413.lcssa34, i64 2
  store i8 %19, i8* %139, align 1
  %141 = add nsw i64 %.16.ph, -128
  br label %.critedge.outer.backedge

.critedge.outer.backedge:                         ; preds = %138, %123, %112, %.critedge.outer.loopexit
  %.118.ph.be = phi i8* [ %.421.lcssa41, %112 ], [ %.421.lcssa42, %123 ], [ %.421.lcssa43, %138 ], [ %.421.us, %.critedge.outer.loopexit ]
  %.110.ph.be = phi i8* [ %114, %112 ], [ %125, %123 ], [ %140, %138 ], [ %.413.us, %.critedge.outer.loopexit ]
  %.16.ph.be = phi i64 [ %115, %112 ], [ %126, %123 ], [ %141, %138 ], [ 1, %.critedge.outer.loopexit ]
  %.1.ph.be = phi i32 [ 2, %112 ], [ 3, %123 ], [ 2, %138 ], [ 2, %.critedge.outer.loopexit ]
  br label %.critedge.outer

; <label>:142:                                    ; preds = %136
  %143 = sub i64 1, %.16.ph
  %144 = trunc i64 %143 to i8
  br label %.loopexit30

.loopexit30.loopexit:                             ; preds = %.us-lcssa81
  br label %.loopexit30

.loopexit30:                                      ; preds = %.loopexit30.loopexit, %142
  %.sink26 = phi i8 [ %144, %142 ], [ 0, %.loopexit30.loopexit ]
  %.623 = phi i8* [ %.421.lcssa43, %142 ], [ %.413.lcssa34, %.loopexit30.loopexit ]
  %.5 = phi i32 [ 2, %142 ], [ 1, %.loopexit30.loopexit ]
  %145 = getelementptr inbounds i8, i8* %.413.lcssa34, i64 1
  store i8 %.sink26, i8* %.413.lcssa34, align 1
  store i8 %19, i8* %145, align 1
  %.716 = getelementptr inbounds i8, i8* %.413.lcssa34, i64 2
  br label %.backedge

.backedge.loopexit:                               ; preds = %230
  br label %.backedge

.backedge.loopexit296:                            ; preds = %108
  br label %.backedge

.backedge:                                        ; preds = %.backedge.loopexit296, %.backedge.loopexit, %.loopexit30, %134, %.loopexit31
  %.017.be = phi i8* [ %.623, %.loopexit30 ], [ %.421.lcssa42, %134 ], [ %.522, %.loopexit31 ], [ %.421.us, %.backedge.loopexit ], [ %.421, %.backedge.loopexit296 ]
  %.09.be = phi i8* [ %.716, %.loopexit30 ], [ %.615, %134 ], [ %.514, %.loopexit31 ], [ %.413.us, %.backedge.loopexit ], [ %.413, %.backedge.loopexit296 ]
  %.01.be = phi i32 [ %.5, %.loopexit30 ], [ %.4, %134 ], [ %.2, %.loopexit31 ], [ %.1.us, %.backedge.loopexit ], [ %.1, %.backedge.loopexit296 ]
  %146 = icmp sgt i32 %.14.lcssa, 0
  br i1 %146, label %18, label %._crit_edge89.loopexit

.critedge.outer.loopexit:                         ; preds = %231
  br label %.critedge.outer.backedge

.critedge.outer:                                  ; preds = %.critedge.outer.backedge, %.critedge.preheader
  %.118.ph = phi i8* [ %.01782, %.critedge.preheader ], [ %.118.ph.be, %.critedge.outer.backedge ]
  %.110.ph = phi i8* [ %.0983, %.critedge.preheader ], [ %.110.ph.be, %.critedge.outer.backedge ]
  %.16.ph = phi i64 [ %.05.lcssa, %.critedge.preheader ], [ %.16.ph.be, %.critedge.outer.backedge ]
  %.1.ph = phi i32 [ %.0186, %.critedge.preheader ], [ %.1.ph.be, %.critedge.outer.backedge ]
  %147 = icmp eq i64 %.16.ph, 1
  br i1 %147, label %.critedge.us.preheader, label %.critedge.preheader294

.critedge.preheader294:                           ; preds = %.critedge.outer
  br label %.critedge

.critedge.us.preheader:                           ; preds = %.critedge.outer
  br label %.critedge.us

.critedge.us:                                     ; preds = %.critedge.us.backedge, %.critedge.us.preheader
  %.118.us = phi i8* [ %.118.ph, %.critedge.us.preheader ], [ %.421.us, %.critedge.us.backedge ]
  %.110.us = phi i8* [ %.110.ph, %.critedge.us.preheader ], [ %.413.us, %.critedge.us.backedge ]
  %.1.us = phi i32 [ %.1.ph, %.critedge.us.preheader ], [ %.1.us.be, %.critedge.us.backedge ]
  %148 = getelementptr inbounds i8, i8* %.110.us, i64 2
  %149 = icmp ult i8* %148, %12
  br i1 %149, label %230, label %150

; <label>:150:                                    ; preds = %.critedge.us
  switch i32 %.1.us, label %218 [
    i32 1, label %151
    i32 3, label %151
  ]

; <label>:151:                                    ; preds = %150, %150
  %152 = load i64, i64* %16, align 8
  %153 = ptrtoint i8* %.118.us to i64
  %154 = sub i64 %153, %152
  %155 = load i32, i32* %17, align 8
  %156 = zext i32 %155 to i64
  %157 = add i64 %154, %156
  %158 = trunc i64 %157 to i32
  store i32 %158, i32* %17, align 8
  %159 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #5
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %.loopexit.loopexit, label %161

; <label>:161:                                    ; preds = %151
  %162 = ptrtoint i8* %.110.us to i64
  %163 = sub i64 %162, %153
  %164 = load i8*, i8** %5, align 8
  %165 = icmp sgt i64 %163, 0
  br i1 %165, label %.lr.ph78.us.preheader, label %._crit_edge.us

.lr.ph78.us.preheader:                            ; preds = %161
  %166 = add i64 %162, 2
  %167 = add i64 %153, -1
  %168 = sub i64 %167, %162
  %169 = icmp sgt i64 %168, -2
  %smax = select i1 %169, i64 %168, i64 -2
  %170 = add i64 %166, %smax
  %171 = sub i64 %170, %153
  %min.iters.check = icmp ult i64 %171, 32
  br i1 %min.iters.check, label %.lr.ph78.us.preheader292, label %min.iters.checked

.lr.ph78.us.preheader292:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph78.us.preheader
  %.0277.us.ph = phi i64 [ %163, %vector.memcheck ], [ %163, %min.iters.checked ], [ %163, %.lr.ph78.us.preheader ], [ %ind.end, %middle.block ]
  %.21176.us.ph = phi i8* [ %164, %vector.memcheck ], [ %164, %min.iters.checked ], [ %164, %.lr.ph78.us.preheader ], [ %ind.end243, %middle.block ]
  %.21975.us.ph = phi i8* [ %.118.us, %vector.memcheck ], [ %.118.us, %min.iters.checked ], [ %.118.us, %.lr.ph78.us.preheader ], [ %ind.end245, %middle.block ]
  br label %.lr.ph78.us

min.iters.checked:                                ; preds = %.lr.ph78.us.preheader
  %n.vec = and i64 %171, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph78.us.preheader292, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i8, i8* %164, i64 2
  %172 = add i64 %153, -1
  %173 = sub i64 %172, %162
  %174 = icmp sgt i64 %173, -2
  %smax238 = select i1 %174, i64 %173, i64 -2
  %175 = add i64 %162, %smax238
  %176 = sub i64 %175, %153
  %scevgep239 = getelementptr i8, i8* %scevgep, i64 %176
  %scevgep240 = getelementptr i8, i8* %.118.us, i64 2
  %scevgep241 = getelementptr i8, i8* %scevgep240, i64 %176
  %bound0 = icmp ult i8* %164, %scevgep241
  %bound1 = icmp ult i8* %.118.us, %scevgep239
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %163, %n.vec
  %ind.end243 = getelementptr i8, i8* %164, i64 %n.vec
  %ind.end245 = getelementptr i8, i8* %.118.us, i64 %n.vec
  br i1 %memcheck.conflict, label %.lr.ph78.us.preheader292, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %177 = add i64 %n.vec, -32
  %178 = lshr exact i64 %177, 5
  %179 = add nuw nsw i64 %178, 1
  %xtraiter342 = and i64 %179, 3
  %lcmp.mod343 = icmp eq i64 %xtraiter342, 0
  br i1 %lcmp.mod343, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter344 = phi i64 [ %prol.iter344.sub, %vector.body.prol ], [ %xtraiter342, %vector.body.prol.preheader ]
  %next.gep.prol = getelementptr i8, i8* %164, i64 %index.prol
  %next.gep248.prol = getelementptr i8, i8* %.118.us, i64 %index.prol
  %180 = bitcast i8* %next.gep248.prol to <16 x i8>*
  %wide.load.prol = load <16 x i8>, <16 x i8>* %180, align 1, !alias.scope !12
  %181 = getelementptr i8, i8* %next.gep248.prol, i64 16
  %182 = bitcast i8* %181 to <16 x i8>*
  %wide.load250.prol = load <16 x i8>, <16 x i8>* %182, align 1, !alias.scope !12
  %183 = bitcast i8* %next.gep.prol to <16 x i8>*
  store <16 x i8> %wide.load.prol, <16 x i8>* %183, align 1, !alias.scope !15, !noalias !12
  %184 = getelementptr i8, i8* %next.gep.prol, i64 16
  %185 = bitcast i8* %184 to <16 x i8>*
  store <16 x i8> %wide.load250.prol, <16 x i8>* %185, align 1, !alias.scope !15, !noalias !12
  %index.next.prol = add i64 %index.prol, 32
  %prol.iter344.sub = add i64 %prol.iter344, -1
  %prol.iter344.cmp = icmp eq i64 %prol.iter344.sub, 0
  br i1 %prol.iter344.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !17

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %186 = icmp ult i64 %177, 96
  br i1 %186, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %next.gep = getelementptr i8, i8* %164, i64 %index
  %next.gep248 = getelementptr i8, i8* %.118.us, i64 %index
  %187 = bitcast i8* %next.gep248 to <16 x i8>*
  %wide.load = load <16 x i8>, <16 x i8>* %187, align 1, !alias.scope !12
  %188 = getelementptr i8, i8* %next.gep248, i64 16
  %189 = bitcast i8* %188 to <16 x i8>*
  %wide.load250 = load <16 x i8>, <16 x i8>* %189, align 1, !alias.scope !12
  %190 = bitcast i8* %next.gep to <16 x i8>*
  store <16 x i8> %wide.load, <16 x i8>* %190, align 1, !alias.scope !15, !noalias !12
  %191 = getelementptr i8, i8* %next.gep, i64 16
  %192 = bitcast i8* %191 to <16 x i8>*
  store <16 x i8> %wide.load250, <16 x i8>* %192, align 1, !alias.scope !15, !noalias !12
  %index.next = add i64 %index, 32
  %next.gep.1 = getelementptr i8, i8* %164, i64 %index.next
  %next.gep248.1 = getelementptr i8, i8* %.118.us, i64 %index.next
  %193 = bitcast i8* %next.gep248.1 to <16 x i8>*
  %wide.load.1 = load <16 x i8>, <16 x i8>* %193, align 1, !alias.scope !12
  %194 = getelementptr i8, i8* %next.gep248.1, i64 16
  %195 = bitcast i8* %194 to <16 x i8>*
  %wide.load250.1 = load <16 x i8>, <16 x i8>* %195, align 1, !alias.scope !12
  %196 = bitcast i8* %next.gep.1 to <16 x i8>*
  store <16 x i8> %wide.load.1, <16 x i8>* %196, align 1, !alias.scope !15, !noalias !12
  %197 = getelementptr i8, i8* %next.gep.1, i64 16
  %198 = bitcast i8* %197 to <16 x i8>*
  store <16 x i8> %wide.load250.1, <16 x i8>* %198, align 1, !alias.scope !15, !noalias !12
  %index.next.1 = add i64 %index, 64
  %next.gep.2 = getelementptr i8, i8* %164, i64 %index.next.1
  %next.gep248.2 = getelementptr i8, i8* %.118.us, i64 %index.next.1
  %199 = bitcast i8* %next.gep248.2 to <16 x i8>*
  %wide.load.2 = load <16 x i8>, <16 x i8>* %199, align 1, !alias.scope !12
  %200 = getelementptr i8, i8* %next.gep248.2, i64 16
  %201 = bitcast i8* %200 to <16 x i8>*
  %wide.load250.2 = load <16 x i8>, <16 x i8>* %201, align 1, !alias.scope !12
  %202 = bitcast i8* %next.gep.2 to <16 x i8>*
  store <16 x i8> %wide.load.2, <16 x i8>* %202, align 1, !alias.scope !15, !noalias !12
  %203 = getelementptr i8, i8* %next.gep.2, i64 16
  %204 = bitcast i8* %203 to <16 x i8>*
  store <16 x i8> %wide.load250.2, <16 x i8>* %204, align 1, !alias.scope !15, !noalias !12
  %index.next.2 = add i64 %index, 96
  %next.gep.3 = getelementptr i8, i8* %164, i64 %index.next.2
  %next.gep248.3 = getelementptr i8, i8* %.118.us, i64 %index.next.2
  %205 = bitcast i8* %next.gep248.3 to <16 x i8>*
  %wide.load.3 = load <16 x i8>, <16 x i8>* %205, align 1, !alias.scope !12
  %206 = getelementptr i8, i8* %next.gep248.3, i64 16
  %207 = bitcast i8* %206 to <16 x i8>*
  %wide.load250.3 = load <16 x i8>, <16 x i8>* %207, align 1, !alias.scope !12
  %208 = bitcast i8* %next.gep.3 to <16 x i8>*
  store <16 x i8> %wide.load.3, <16 x i8>* %208, align 1, !alias.scope !15, !noalias !12
  %209 = getelementptr i8, i8* %next.gep.3, i64 16
  %210 = bitcast i8* %209 to <16 x i8>*
  store <16 x i8> %wide.load250.3, <16 x i8>* %210, align 1, !alias.scope !15, !noalias !12
  %index.next.3 = add i64 %index, 128
  %211 = icmp eq i64 %index.next.3, %n.vec
  br i1 %211, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !18

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %171, %n.vec
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph78.us.preheader292

._crit_edge.us.loopexit:                          ; preds = %.lr.ph78.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block, %161
  %.211.lcssa.us = phi i8* [ %164, %161 ], [ %ind.end243, %middle.block ], [ %216, %._crit_edge.us.loopexit ]
  %212 = load i8*, i8** %5, align 8
  br label %230

.lr.ph78.us:                                      ; preds = %.lr.ph78.us.preheader292, %.lr.ph78.us
  %.0277.us = phi i64 [ %213, %.lr.ph78.us ], [ %.0277.us.ph, %.lr.ph78.us.preheader292 ]
  %.21176.us = phi i8* [ %216, %.lr.ph78.us ], [ %.21176.us.ph, %.lr.ph78.us.preheader292 ]
  %.21975.us = phi i8* [ %214, %.lr.ph78.us ], [ %.21975.us.ph, %.lr.ph78.us.preheader292 ]
  %213 = add nsw i64 %.0277.us, -1
  %214 = getelementptr inbounds i8, i8* %.21975.us, i64 1
  %215 = load i8, i8* %.21975.us, align 1
  %216 = getelementptr inbounds i8, i8* %.21176.us, i64 1
  store i8 %215, i8* %.21176.us, align 1
  %217 = icmp sgt i64 %.0277.us, 1
  br i1 %217, label %.lr.ph78.us, label %._crit_edge.us.loopexit, !llvm.loop !19

; <label>:218:                                    ; preds = %150
  %219 = load i64, i64* %14, align 8
  %220 = ptrtoint i8* %.110.us to i64
  %221 = sub i64 %220, %219
  %222 = load i32, i32* %15, align 8
  %223 = zext i32 %222 to i64
  %224 = add i64 %221, %223
  %225 = trunc i64 %224 to i32
  store i32 %225, i32* %15, align 8
  %226 = tail call i32 @TIFFFlushData1(%struct.tiff* %0) #5
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %.loopexit.loopexit, label %228

; <label>:228:                                    ; preds = %218
  %229 = load i8*, i8** %5, align 8
  br label %230

; <label>:230:                                    ; preds = %228, %._crit_edge.us, %.critedge.us
  %.421.us = phi i8* [ %.118.us, %.critedge.us ], [ %212, %._crit_edge.us ], [ %.118.us, %228 ]
  %.413.us = phi i8* [ %.110.us, %.critedge.us ], [ %.211.lcssa.us, %._crit_edge.us ], [ %229, %228 ]
  switch i32 %.1.us, label %.backedge.loopexit [
    i32 0, label %.us-lcssa.loopexit
    i32 1, label %.us-lcssa80.loopexit
    i32 2, label %.us-lcssa81.loopexit
    i32 3, label %231
  ]

; <label>:231:                                    ; preds = %230
  %232 = getelementptr inbounds i8, i8* %.413.us, i64 -2
  %233 = load i8, i8* %232, align 1
  %234 = icmp eq i8 %233, -1
  br i1 %234, label %235, label %.critedge.outer.loopexit

; <label>:235:                                    ; preds = %231
  %236 = load i8, i8* %.421.us, align 1
  %237 = icmp ult i8 %236, 126
  %238 = add i8 %236, 2
  br i1 %237, label %239, label %.critedge.us.backedge

; <label>:239:                                    ; preds = %235
  %240 = getelementptr inbounds i8, i8* %.413.us, i64 -1
  %not..us = icmp ne i8 %238, 127
  %241 = zext i1 %not..us to i32
  store i8 %238, i8* %.421.us, align 1
  %242 = load i8, i8* %240, align 1
  store i8 %242, i8* %232, align 1
  br label %.critedge.us.backedge

.critedge.us.backedge:                            ; preds = %239, %235
  %.1.us.be = phi i32 [ %241, %239 ], [ 2, %235 ]
  br label %.critedge.us

._crit_edge89.loopexit:                           ; preds = %.backedge
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.loopexit, %4
  %.09.lcssa = phi i8* [ %6, %4 ], [ %.09.be, %._crit_edge89.loopexit ]
  %243 = bitcast i8** %5 to i64*
  %244 = load i64, i64* %243, align 8
  %245 = ptrtoint i8* %.09.lcssa to i64
  %246 = sub i64 %245, %244
  %247 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %248 = load i32, i32* %247, align 8
  %249 = zext i32 %248 to i64
  %250 = add i64 %246, %249
  %251 = trunc i64 %250 to i32
  store i32 %251, i32* %247, align 8
  store i8* %.09.lcssa, i8** %5, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %151, %218
  br label %.loopexit

.loopexit.loopexit295:                            ; preds = %29, %96
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit295, %.loopexit.loopexit, %._crit_edge89
  %.0 = phi i32 [ 1, %._crit_edge89 ], [ -1, %.loopexit.loopexit ], [ -1, %.loopexit.loopexit295 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @PackBitsEncodeChunk(%struct.tiff*, i8* nocapture readonly, i32, i16 zeroext) #1 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = trunc i64 %7 to i32
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.preheader, label %12

.preheader:                                       ; preds = %4
  %10 = icmp sgt i32 %2, 0
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %sext = shl i64 %7, 32
  %11 = ashr exact i64 %sext, 32
  br label %13

; <label>:12:                                     ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i32 193, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.PackBitsEncodeChunk, i64 0, i64 0)) #6
  unreachable

; <label>:13:                                     ; preds = %.lr.ph, %16
  %.014 = phi i32 [ %2, %.lr.ph ], [ %18, %16 ]
  %.023 = phi i8* [ %1, %.lr.ph ], [ %17, %16 ]
  %14 = tail call i32 @PackBitsEncode(%struct.tiff* %0, i8* %.023, i32 %8, i16 zeroext %3)
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %._crit_edge.loopexit, label %16

; <label>:16:                                     ; preds = %13
  %17 = getelementptr inbounds i8, i8* %.023, i64 %11
  %18 = sub nsw i32 %.014, %8
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %13, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %16, %13
  %.0.ph = phi i32 [ 1, %16 ], [ -1, %13 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.0 = phi i32 [ 1, %.preheader ], [ %.0.ph, %._crit_edge.loopexit ]
  ret i32 %.0
}

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #2

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

declare i32 @TIFFTileRowSize(%struct.tiff*) local_unnamed_addr #2

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #2

declare i32 @TIFFFlushData1(%struct.tiff*) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !9, !10}
!19 = distinct !{!19, !9, !10}
