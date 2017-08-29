; ModuleID = 'tif_compress.ll'
source_filename = "tif_compress.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._codec = type { %struct._codec*, %struct.TIFFCodec* }
%struct.TIFFCodec = type { i8*, i16, i32 (%struct.tiff*, i32)* }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, {}*, {}*, {}*, {}*, {}*, {}*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [9 x i8] c"scanline\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"strip\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"tile\00", align 1
@.str.3 = private unnamed_addr constant [53 x i8] c"Compression algorithm does not support random access\00", align 1
@registeredCODECS = internal global %struct._codec* null, align 8
@_TIFFBuiltinCODECS = external global [0 x %struct.TIFFCodec], align 8
@.str.4 = private unnamed_addr constant [18 x i8] c"TIFFRegisterCODEC\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"No space to register compression scheme %s\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"TIFFUnRegisterCODEC\00", align 1
@.str.7 = private unnamed_addr constant [52 x i8] c"Cannot remove compression scheme %s; not registered\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"LZW\00", align 1
@.str.9 = private unnamed_addr constant [73 x i8] c"%s %s encoding is no longer implemented due to Unisys patent enforcement\00", align 1
@.str.10 = private unnamed_addr constant [34 x i8] c"%s %s encoding is not implemented\00", align 1
@.str.11 = private unnamed_addr constant [53 x i8] c"Compression scheme %u %s encoding is not implemented\00", align 1
@.str.12 = private unnamed_addr constant [34 x i8] c"%s %s decoding is not implemented\00", align 1
@.str.13 = private unnamed_addr constant [53 x i8] c"Compression scheme %u %s decoding is not implemented\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @_TIFFNoRowEncode(%struct.tiff* nocapture readonly, i8* nocapture readnone, i32, i16 zeroext) #0 {
  tail call fastcc void @TIFFNoEncode(%struct.tiff* %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0))
  ret i32 -1
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @TIFFNoEncode(%struct.tiff* nocapture readonly, i8*) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %4 = load i16, i16* %3, align 8
  %5 = tail call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %4)
  %6 = icmp eq %struct.TIFFCodec* %5, null
  br i1 %6, label %16, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %5, i64 0, i32 0
  %9 = load i8*, i8** %8, align 8
  %10 = tail call i32 @strncmp(i8* %9, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i64 3) #7
  %11 = icmp eq i32 %10, 0
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %13 = load i8*, i8** %12, align 8
  br i1 %11, label %14, label %15

; <label>:14:                                     ; preds = %7
  tail call void (i8*, i8*, ...) @TIFFError(i8* %13, i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.9, i64 0, i64 0), i8* %9, i8* %1) #8
  br label %20

; <label>:15:                                     ; preds = %7
  tail call void (i8*, i8*, ...) @TIFFError(i8* %13, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.10, i64 0, i64 0), i8* %9, i8* %1) #8
  br label %20

; <label>:16:                                     ; preds = %2
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %18 = load i8*, i8** %17, align 8
  %19 = zext i16 %4 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %18, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.11, i64 0, i64 0), i32 %19, i8* %1) #8
  br label %20

; <label>:20:                                     ; preds = %14, %15, %16
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @_TIFFNoStripEncode(%struct.tiff* nocapture readonly, i8* nocapture readnone, i32, i16 zeroext) #0 {
  tail call fastcc void @TIFFNoEncode(%struct.tiff* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0))
  ret i32 -1
}

; Function Attrs: noinline nounwind uwtable
define i32 @_TIFFNoTileEncode(%struct.tiff* nocapture readonly, i8* nocapture readnone, i32, i16 zeroext) #0 {
  tail call fastcc void @TIFFNoEncode(%struct.tiff* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0))
  ret i32 -1
}

; Function Attrs: noinline nounwind uwtable
define i32 @_TIFFNoRowDecode(%struct.tiff* nocapture readonly, i8* nocapture readnone, i32, i16 zeroext) #0 {
  tail call fastcc void @TIFFNoDecode(%struct.tiff* %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0))
  ret i32 -1
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @TIFFNoDecode(%struct.tiff* nocapture readonly, i8*) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %4 = load i16, i16* %3, align 8
  %5 = tail call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %4)
  %6 = icmp eq %struct.TIFFCodec* %5, null
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %8 = load i8*, i8** %7, align 8
  br i1 %6, label %12, label %9

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %5, i64 0, i32 0
  %11 = load i8*, i8** %10, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %8, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.12, i64 0, i64 0), i8* %11, i8* %1) #8
  br label %14

; <label>:12:                                     ; preds = %2
  %13 = zext i16 %4 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %8, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.13, i64 0, i64 0), i32 %13, i8* %1) #8
  br label %14

; <label>:14:                                     ; preds = %12, %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @_TIFFNoStripDecode(%struct.tiff* nocapture readonly, i8* nocapture readnone, i32, i16 zeroext) #0 {
  tail call fastcc void @TIFFNoDecode(%struct.tiff* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0))
  ret i32 -1
}

; Function Attrs: noinline nounwind uwtable
define i32 @_TIFFNoTileDecode(%struct.tiff* nocapture readonly, i8* nocapture readnone, i32, i16 zeroext) #0 {
  tail call fastcc void @TIFFNoDecode(%struct.tiff* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0))
  ret i32 -1
}

; Function Attrs: noinline nounwind uwtable
define i32 @_TIFFNoSeek(%struct.tiff* nocapture readonly, i32) #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %4 = load i8*, i8** %3, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %4, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.3, i64 0, i64 0)) #8
  ret i32 0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @_TIFFNoPreCode(%struct.tiff* nocapture readnone, i16 zeroext) #2 {
  ret i32 1
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @_TIFFSetDefaultCompressionState(%struct.tiff* nocapture) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  store i32 (%struct.tiff*)* @_TIFFtrue, i32 (%struct.tiff*)** %2, align 8
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 22
  store i32 (%struct.tiff*, i16)* @_TIFFNoPreCode, i32 (%struct.tiff*, i16)** %3, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  %5 = bitcast {}** %4 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoRowDecode, i32 (%struct.tiff*, i8*, i32, i16)** %5, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  %7 = bitcast {}** %6 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoStripDecode, i32 (%struct.tiff*, i8*, i32, i16)** %7, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  %9 = bitcast {}** %8 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoTileDecode, i32 (%struct.tiff*, i8*, i32, i16)** %9, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  store i32 (%struct.tiff*)* @_TIFFtrue, i32 (%struct.tiff*)** %10, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 24
  store i32 (%struct.tiff*, i16)* @_TIFFNoPreCode, i32 (%struct.tiff*, i16)** %11, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 25
  store i32 (%struct.tiff*)* @_TIFFtrue, i32 (%struct.tiff*)** %12, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  %14 = bitcast {}** %13 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoRowEncode, i32 (%struct.tiff*, i8*, i32, i16)** %14, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  %16 = bitcast {}** %15 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoStripEncode, i32 (%struct.tiff*, i8*, i32, i16)** %16, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  %18 = bitcast {}** %17 to i32 (%struct.tiff*, i8*, i32, i16)**
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoTileEncode, i32 (%struct.tiff*, i8*, i32, i16)** %18, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 32
  store void (%struct.tiff*)* @_TIFFvoid, void (%struct.tiff*)** %19, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 33
  store i32 (%struct.tiff*, i32)* @_TIFFNoSeek, i32 (%struct.tiff*, i32)** %20, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  store void (%struct.tiff*)* @_TIFFvoid, void (%struct.tiff*)** %21, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 35
  store i32 (%struct.tiff*, i32)* @_TIFFDefaultStripSize, i32 (%struct.tiff*, i32)** %22, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 36
  store void (%struct.tiff*, i32*, i32*)* @_TIFFDefaultTileSize, void (%struct.tiff*, i32*, i32*)** %23, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %25 = load i32, i32* %24, align 8
  %26 = and i32 %25, -257
  store i32 %26, i32* %24, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @_TIFFtrue(%struct.tiff* nocapture readnone) #2 {
  ret i32 1
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @_TIFFvoid(%struct.tiff* nocapture) #2 {
  ret void
}

declare i32 @_TIFFDefaultStripSize(%struct.tiff*, i32) #1

declare void @_TIFFDefaultTileSize(%struct.tiff*, i32*, i32*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFSetCompressionScheme(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = trunc i32 %1 to i16
  %4 = tail call %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext %3)
  tail call void @_TIFFSetDefaultCompressionState(%struct.tiff* %0)
  %5 = icmp eq %struct.TIFFCodec* %4, null
  br i1 %5, label %10, label %6

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %4, i64 0, i32 2
  %8 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %7, align 8
  %9 = tail call i32 %8(%struct.tiff* %0, i32 %1) #8
  br label %10

; <label>:10:                                     ; preds = %2, %6
  %11 = phi i32 [ %9, %6 ], [ 1, %2 ]
  ret i32 %11
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define %struct.TIFFCodec* @TIFFFindCODEC(i16 zeroext) local_unnamed_addr #4 {
  %.017 = load %struct._codec*, %struct._codec** @registeredCODECS, align 8
  %2 = icmp eq %struct._codec* %.017, null
  br i1 %2, label %.preheader, label %.lr.ph9.preheader

.lr.ph9.preheader:                                ; preds = %1
  br label %.lr.ph9

; <label>:3:                                      ; preds = %.lr.ph9
  %4 = getelementptr inbounds %struct._codec, %struct._codec* %.018, i64 0, i32 0
  %.01 = load %struct._codec*, %struct._codec** %4, align 8
  %5 = icmp eq %struct._codec* %.01, null
  br i1 %5, label %.preheader.loopexit, label %.lr.ph9

.preheader.loopexit:                              ; preds = %3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %1
  %6 = load i8*, i8** getelementptr inbounds ([0 x %struct.TIFFCodec], [0 x %struct.TIFFCodec]* @_TIFFBuiltinCODECS, i64 0, i64 0, i32 0), align 8
  %7 = icmp eq i8* %6, null
  br i1 %7, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %3
  %.018 = phi %struct._codec* [ %.01, %3 ], [ %.017, %.lr.ph9.preheader ]
  %8 = getelementptr inbounds %struct._codec, %struct._codec* %.018, i64 0, i32 1
  %9 = load %struct.TIFFCodec*, %struct.TIFFCodec** %8, align 8
  %10 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %9, i64 0, i32 1
  %11 = load i16, i16* %10, align 8
  %12 = icmp eq i16 %11, %0
  br i1 %12, label %.loopexit.loopexit16, label %3

.lr.ph:                                           ; preds = %.lr.ph.preheader, %16
  %.024 = phi %struct.TIFFCodec* [ %17, %16 ], [ getelementptr inbounds ([0 x %struct.TIFFCodec], [0 x %struct.TIFFCodec]* @_TIFFBuiltinCODECS, i64 0, i64 0), %.lr.ph.preheader ]
  %13 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %.024, i64 0, i32 1
  %14 = load i16, i16* %13, align 8
  %15 = icmp eq i16 %14, %0
  br i1 %15, label %.loopexit.loopexit, label %16

; <label>:16:                                     ; preds = %.lr.ph
  %17 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %.024, i64 1
  %18 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %17, i64 0, i32 0
  %19 = load i8*, i8** %18, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %16, %.lr.ph
  %.0.ph = phi %struct.TIFFCodec* [ %.024, %.lr.ph ], [ null, %16 ]
  br label %.loopexit

.loopexit.loopexit16:                             ; preds = %.lr.ph9
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit16, %.loopexit.loopexit, %.preheader
  %.0 = phi %struct.TIFFCodec* [ null, %.preheader ], [ %.0.ph, %.loopexit.loopexit ], [ %9, %.loopexit.loopexit16 ]
  ret %struct.TIFFCodec* %.0
}

; Function Attrs: noinline nounwind uwtable
define %struct.TIFFCodec* @TIFFRegisterCODEC(i16 zeroext, i8*, i32 (%struct.tiff*, i32)*) local_unnamed_addr #0 {
  %4 = tail call i64 @strlen(i8* %1) #7
  %5 = add i64 %4, 41
  %6 = trunc i64 %5 to i32
  %7 = tail call i8* @_TIFFmalloc(i32 %6) #8
  %8 = icmp eq i8* %7, null
  br i1 %8, label %23, label %9

; <label>:9:                                      ; preds = %3
  %10 = getelementptr inbounds i8, i8* %7, i64 16
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to i8**
  store i8* %10, i8** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 40
  %14 = bitcast i8* %10 to i8**
  store i8* %13, i8** %14, align 8
  %15 = tail call i8* @strcpy(i8* %13, i8* %1) #8
  %16 = bitcast i8* %11 to %struct.TIFFCodec**
  %17 = load %struct.TIFFCodec*, %struct.TIFFCodec** %16, align 8
  %18 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %17, i64 0, i32 1
  store i16 %0, i16* %18, align 8
  %19 = load %struct.TIFFCodec*, %struct.TIFFCodec** %16, align 8
  %20 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %19, i64 0, i32 2
  store i32 (%struct.tiff*, i32)* %2, i32 (%struct.tiff*, i32)** %20, align 8
  %21 = load i64, i64* bitcast (%struct._codec** @registeredCODECS to i64*), align 8
  %22 = bitcast i8* %7 to i64*
  store i64 %21, i64* %22, align 8
  store i8* %7, i8** bitcast (%struct._codec** @registeredCODECS to i8**), align 8
  br label %24

; <label>:23:                                     ; preds = %3
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8* %1) #8
  br label %24

; <label>:24:                                     ; preds = %23, %9
  %25 = getelementptr inbounds i8, i8* %7, i64 8
  %26 = bitcast i8* %25 to %struct.TIFFCodec**
  %27 = load %struct.TIFFCodec*, %struct.TIFFCodec** %26, align 8
  ret %struct.TIFFCodec* %27
}

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8* nocapture readonly) local_unnamed_addr #6

; Function Attrs: noinline nounwind uwtable
define void @TIFFUnRegisterCODEC(%struct.TIFFCodec* readonly) local_unnamed_addr #0 {
  %2 = load %struct._codec*, %struct._codec** @registeredCODECS, align 8
  %3 = icmp eq %struct._codec* %2, null
  br i1 %3, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %4 = phi %struct._codec* [ %15, %13 ], [ %2, %.lr.ph.preheader ]
  %.03 = phi %struct._codec** [ %14, %13 ], [ @registeredCODECS, %.lr.ph.preheader ]
  %5 = getelementptr inbounds %struct._codec, %struct._codec* %4, i64 0, i32 1
  %6 = load %struct.TIFFCodec*, %struct.TIFFCodec** %5, align 8
  %7 = icmp eq %struct.TIFFCodec* %6, %0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %.lr.ph
  %9 = bitcast %struct._codec* %4 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = bitcast %struct._codec** %.03 to i64*
  store i64 %10, i64* %11, align 8
  %12 = bitcast %struct._codec* %4 to i8*
  tail call void @_TIFFfree(i8* %12) #8
  br label %19

; <label>:13:                                     ; preds = %.lr.ph
  %14 = getelementptr inbounds %struct._codec, %struct._codec* %4, i64 0, i32 0
  %15 = load %struct._codec*, %struct._codec** %14, align 8
  %16 = icmp eq %struct._codec* %15, null
  br i1 %16, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %17 = getelementptr inbounds %struct.TIFFCodec, %struct.TIFFCodec* %0, i64 0, i32 0
  %18 = load i8*, i8** %17, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.7, i64 0, i64 0), i8* %18) #8
  br label %19

; <label>:19:                                     ; preds = %._crit_edge, %8
  ret void
}

declare void @_TIFFfree(i8*) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
