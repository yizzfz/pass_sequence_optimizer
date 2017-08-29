; ModuleID = 'tif_lzw.ll'
source_filename = "tif_lzw.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.LZWDecodeState = type { %struct.LZWBaseState, i64, i64, i64, i32 (%struct.tiff*, i8*, i32, i16)*, %struct.code_ent*, %struct.code_ent*, %struct.code_ent*, %struct.code_ent*, %struct.code_ent* }
%struct.LZWBaseState = type { %struct.TIFFPredictorState, i16, i16, i16, i64, i64 }
%struct.TIFFPredictorState = type { i32, i32, i32, void (%struct.tiff*, i8*, i32)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*)* }
%struct.code_ent = type { %struct.code_ent*, i16, i8, i8 }

@.str = private unnamed_addr constant [26 x i8] c"scheme == COMPRESSION_LZW\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"tif_lzw.c\00", align 1
@__PRETTY_FUNCTION__.TIFFInitLZW = private unnamed_addr constant [29 x i8] c"int TIFFInitLZW(TIFF *, int)\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"TIFFInitLZW\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"No space for LZW state block\00", align 1
@LZWSetupDecode.module = internal constant [16 x i8] c" LZWSetupDecode\00", align 16
@.str.4 = private unnamed_addr constant [11 x i8] c"sp != NULL\00", align 1
@__PRETTY_FUNCTION__.LZWSetupDecode = private unnamed_addr constant [27 x i8] c"int LZWSetupDecode(TIFF *)\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"No space for LZW code table\00", align 1
@__PRETTY_FUNCTION__.LZWPreDecode = private unnamed_addr constant [36 x i8] c"int LZWPreDecode(TIFF *, tsample_t)\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"Old-style LZW codes, convert file\00", align 1
@__PRETTY_FUNCTION__.LZWDecodeCompat = private unnamed_addr constant [58 x i8] c"int LZWDecodeCompat(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.7 = private unnamed_addr constant [49 x i8] c"LZWDecode: Strip %d not terminated with EOI code\00", align 1
@.str.8 = private unnamed_addr constant [72 x i8] c"&sp->dec_codetab[0] <= free_entp && free_entp < &sp->dec_codetab[CSIZE]\00", align 1
@.str.9 = private unnamed_addr constant [65 x i8] c"LZWDecodeCompat: Not enough data at scanline %d (short %d bytes)\00", align 1
@__PRETTY_FUNCTION__.LZWDecode = private unnamed_addr constant [52 x i8] c"int LZWDecode(TIFF *, tidata_t, tsize_t, tsample_t)\00", align 1
@.str.10 = private unnamed_addr constant [59 x i8] c"LZWDecode: Not enough data at scanline %d (short %d bytes)\00", align 1
@.str.11 = private unnamed_addr constant [63 x i8] c"LZWDecode: Bogus encoding, loop in the code table; scanline %d\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitLZW(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 5
  br i1 %3, label %5, label %4

; <label>:4:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 663, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.TIFFInitLZW, i64 0, i64 0)) #5
  unreachable

; <label>:5:                                      ; preds = %2
  %6 = tail call i8* @_TIFFmalloc(i32 184) #6
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  store i8* %6, i8** %7, align 8
  %8 = icmp eq i8* %6, null
  br i1 %8, label %33, label %9

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %19

; <label>:13:                                     ; preds = %9
  %14 = bitcast i8** %7 to %struct.LZWDecodeState**
  %15 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %14, align 8
  %16 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %15, i64 0, i32 9
  store %struct.code_ent* null, %struct.code_ent** %16, align 8
  %17 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %14, align 8
  %18 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %17, i64 0, i32 4
  store i32 (%struct.tiff*, i8*, i32, i16)* null, i32 (%struct.tiff*, i8*, i32, i16)** %18, align 8
  br label %19

; <label>:19:                                     ; preds = %13, %9
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  store i32 (%struct.tiff*)* @LZWSetupDecode, i32 (%struct.tiff*)** %20, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 22
  store i32 (%struct.tiff*, i16)* @LZWPreDecode, i32 (%struct.tiff*, i16)** %21, align 8
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode, i32 (%struct.tiff*, i8*, i32, i16)** %22, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode, i32 (%struct.tiff*, i8*, i32, i16)** %23, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode, i32 (%struct.tiff*, i8*, i32, i16)** %24, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  store i32 (%struct.tiff*)* @_LZWtrue, i32 (%struct.tiff*)** %25, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 24
  store i32 (%struct.tiff*, i16)* @_TIFFNoPreCode, i32 (%struct.tiff*, i16)** %26, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 25
  store i32 (%struct.tiff*)* @_LZWtrue, i32 (%struct.tiff*)** %27, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoRowEncode, i32 (%struct.tiff*, i8*, i32, i16)** %28, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoStripEncode, i32 (%struct.tiff*, i8*, i32, i16)** %29, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @_TIFFNoTileEncode, i32 (%struct.tiff*, i8*, i32, i16)** %30, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  store void (%struct.tiff*)* @LZWCleanup, void (%struct.tiff*)** %31, align 8
  %32 = tail call i32 @TIFFPredictorInit(%struct.tiff* nonnull %0) #6
  br label %34

; <label>:33:                                     ; preds = %5
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %34

; <label>:34:                                     ; preds = %33, %19
  %.0 = phi i32 [ 0, %33 ], [ 1, %19 ]
  ret i32 %.0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @LZWSetupDecode(%struct.tiff* nocapture readonly) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.LZWDecodeState**
  %4 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %3, align 8
  %5 = icmp eq %struct.LZWDecodeState* %4, null
  br i1 %5, label %6, label %7

; <label>:6:                                      ; preds = %1
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 196, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__PRETTY_FUNCTION__.LZWSetupDecode, i64 0, i64 0)) #5
  unreachable

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %4, i64 0, i32 9
  %9 = load %struct.code_ent*, %struct.code_ent** %8, align 8
  %10 = icmp eq %struct.code_ent* %9, null
  br i1 %10, label %11, label %.loopexit

; <label>:11:                                     ; preds = %7
  %12 = tail call i8* @_TIFFmalloc(i32 81904) #6
  %13 = bitcast %struct.code_ent** %8 to i8**
  store i8* %12, i8** %13, align 8
  %14 = icmp eq i8* %12, null
  br i1 %14, label %15, label %.preheader.preheader

.preheader.preheader:                             ; preds = %11
  br label %.preheader

; <label>:15:                                     ; preds = %11
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @LZWSetupDecode.module, i64 0, i64 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i64 0, i64 0)) #6
  br label %.loopexit

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 255, %.preheader.preheader ]
  %.012 = phi i32 [ %25, %.preheader ], [ 255, %.preheader.preheader ]
  %16 = trunc i32 %.012 to i8
  %17 = load %struct.code_ent*, %struct.code_ent** %8, align 8
  %18 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %17, i64 %indvars.iv, i32 2
  store i8 %16, i8* %18, align 2
  %19 = load %struct.code_ent*, %struct.code_ent** %8, align 8
  %20 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %19, i64 %indvars.iv, i32 3
  store i8 %16, i8* %20, align 1
  %21 = load %struct.code_ent*, %struct.code_ent** %8, align 8
  %22 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %21, i64 %indvars.iv, i32 1
  store i16 1, i16* %22, align 8
  %23 = load %struct.code_ent*, %struct.code_ent** %8, align 8
  %24 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %23, i64 %indvars.iv, i32 0
  store %struct.code_ent* null, %struct.code_ent** %24, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %25 = add nsw i32 %.012, -1
  %26 = icmp sgt i64 %indvars.iv, 0
  br i1 %26, label %.preheader, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7, %15
  %.0 = phi i32 [ 0, %15 ], [ 1, %7 ], [ 1, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LZWPreDecode(%struct.tiff*, i16 zeroext) #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %4 = bitcast i8** %3 to %struct.LZWDecodeState**
  %5 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %4, align 8
  %6 = icmp eq %struct.LZWDecodeState* %5, null
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 225, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.LZWPreDecode, i64 0, i64 0)) #5
  unreachable

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %10 = load i8*, i8** %9, align 8
  %11 = load i8, i8* %10, align 1
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %13, label %33

; <label>:13:                                     ; preds = %8
  %14 = getelementptr inbounds i8, i8* %10, i64 1
  %15 = load i8, i8* %14, align 1
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %33, label %18

; <label>:18:                                     ; preds = %13
  %19 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 4
  %20 = load i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)** %19, align 8
  %21 = icmp eq i32 (%struct.tiff*, i8*, i32, i16)* %20, null
  br i1 %21, label %22, label %31

; <label>:22:                                     ; preds = %18
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %24 = load i8*, i8** %23, align 8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %24, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0)) #6
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat, i32 (%struct.tiff*, i8*, i32, i16)** %25, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat, i32 (%struct.tiff*, i8*, i32, i16)** %26, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat, i32 (%struct.tiff*, i8*, i32, i16)** %27, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  %29 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %28, align 8
  %30 = tail call i32 %29(%struct.tiff* nonnull %0) #6
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecodeCompat, i32 (%struct.tiff*, i8*, i32, i16)** %19, align 8
  br label %31

; <label>:31:                                     ; preds = %18, %22
  %32 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 0, i32 2
  store i16 511, i16* %32, align 2
  br label %36

; <label>:33:                                     ; preds = %13, %8
  %34 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 0, i32 2
  store i16 510, i16* %34, align 2
  %35 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 4
  store i32 (%struct.tiff*, i8*, i32, i16)* @LZWDecode, i32 (%struct.tiff*, i8*, i32, i16)** %35, align 8
  br label %36

; <label>:36:                                     ; preds = %33, %31
  %37 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 0, i32 1
  store i16 9, i16* %37, align 8
  %38 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 0, i32 4
  %39 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 2
  store i64 0, i64* %39, align 8
  %40 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 1
  %41 = bitcast i64* %38 to i8*
  call void @llvm.memset.p0i8.i64(i8* %41, i8 0, i64 16, i32 8, i1 false)
  store i64 511, i64* %40, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %43 = load i32, i32* %42, align 8
  %44 = shl i32 %43, 3
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 3
  store i64 %45, i64* %46, align 8
  %47 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 9
  %48 = load %struct.code_ent*, %struct.code_ent** %47, align 8
  %49 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %48, i64 258
  %50 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 7
  store %struct.code_ent* %49, %struct.code_ent** %50, align 8
  %.cast = bitcast %struct.code_ent* %49 to i8*
  tail call void @_TIFFmemset(i8* %.cast, i32 0, i32 77776) #6
  %51 = load %struct.code_ent*, %struct.code_ent** %47, align 8
  %52 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %51, i64 -1
  %53 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 6
  store %struct.code_ent* %52, %struct.code_ent** %53, align 8
  %54 = load i64, i64* %40, align 8
  %55 = add nsw i64 %54, -1
  %56 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %51, i64 %55
  %57 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %5, i64 0, i32 8
  store %struct.code_ent* %56, %struct.code_ent** %57, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @LZWDecode(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.LZWDecodeState**
  %7 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %6, align 8
  %8 = sext i32 %2 to i64
  %9 = icmp eq %struct.LZWDecodeState* %7, null
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 324, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.LZWDecode, i64 0, i64 0)) #5
  unreachable

; <label>:11:                                     ; preds = %4
  %12 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 2
  %13 = load i64, i64* %12, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %58, label %15

; <label>:15:                                     ; preds = %11
  %16 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 5
  %17 = load %struct.code_ent*, %struct.code_ent** %16, align 8
  %18 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %17, i64 0, i32 1
  %19 = load i16, i16* %18, align 8
  %20 = zext i16 %19 to i64
  %21 = sub nsw i64 %20, %13
  %22 = icmp slt i64 %8, %21
  br i1 %22, label %23, label %45

; <label>:23:                                     ; preds = %15
  %24 = add nsw i64 %13, %8
  store i64 %24, i64* %12, align 8
  br label %25

; <label>:25:                                     ; preds = %25, %23
  %.08 = phi %struct.code_ent* [ %17, %23 ], [ %27, %25 ]
  %.01 = phi i64 [ %21, %23 ], [ %28, %25 ]
  %26 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.08, i64 0, i32 0
  %27 = load %struct.code_ent*, %struct.code_ent** %26, align 8
  %28 = add nsw i64 %.01, -1
  %29 = icmp sgt i64 %28, %8
  %30 = icmp ne %struct.code_ent* %27, null
  %31 = and i1 %29, %30
  br i1 %31, label %25, label %32

; <label>:32:                                     ; preds = %25
  %33 = icmp eq %struct.code_ent* %27, null
  br i1 %33, label %.loopexit57, label %34

; <label>:34:                                     ; preds = %32
  %35 = getelementptr inbounds i8, i8* %1, i64 %8
  br label %36

; <label>:36:                                     ; preds = %36, %34
  %.020 = phi i8* [ %35, %34 ], [ %39, %36 ]
  %.014 = phi i64 [ %8, %34 ], [ %42, %36 ]
  %.19 = phi %struct.code_ent* [ %27, %34 ], [ %41, %36 ]
  %37 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.19, i64 0, i32 2
  %38 = load i8, i8* %37, align 2
  %39 = getelementptr inbounds i8, i8* %.020, i64 -1
  store i8 %38, i8* %39, align 1
  %40 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.19, i64 0, i32 0
  %41 = load %struct.code_ent*, %struct.code_ent** %40, align 8
  %42 = add nsw i64 %.014, -1
  %43 = icmp ne %struct.code_ent* %41, null
  %not.55 = icmp ne i64 %42, 0
  %44 = and i1 %not.55, %43
  br i1 %44, label %36, label %.loopexit57.loopexit

; <label>:45:                                     ; preds = %15
  %46 = getelementptr inbounds i8, i8* %1, i64 %21
  br label %47

; <label>:47:                                     ; preds = %47, %45
  %.121 = phi i8* [ %46, %45 ], [ %48, %47 ]
  %.210 = phi %struct.code_ent* [ %17, %45 ], [ %52, %47 ]
  %.1 = phi i64 [ %21, %45 ], [ %53, %47 ]
  %48 = getelementptr inbounds i8, i8* %.121, i64 -1
  %49 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.210, i64 0, i32 2
  %50 = load i8, i8* %49, align 2
  %51 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.210, i64 0, i32 0
  %52 = load %struct.code_ent*, %struct.code_ent** %51, align 8
  store i8 %50, i8* %48, align 1
  %53 = add nsw i64 %.1, -1
  %54 = icmp ne %struct.code_ent* %52, null
  %not. = icmp ne i64 %53, 0
  %55 = and i1 %not., %54
  br i1 %55, label %47, label %56

; <label>:56:                                     ; preds = %47
  %57 = sub nsw i64 %8, %21
  store i64 0, i64* %12, align 8
  br label %58

; <label>:58:                                     ; preds = %11, %56
  %.115 = phi i64 [ %57, %56 ], [ %8, %11 ]
  %.011 = phi i8* [ %46, %56 ], [ %1, %11 ]
  %59 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %60 = load i8*, i8** %59, align 8
  %61 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 0, i32 1
  %62 = load i16, i16* %61, align 8
  %63 = zext i16 %62 to i64
  %64 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 0, i32 4
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 0, i32 5
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 1
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 6
  %71 = load %struct.code_ent*, %struct.code_ent** %70, align 8
  %72 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 7
  %73 = load %struct.code_ent*, %struct.code_ent** %72, align 8
  %74 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 8
  %75 = load %struct.code_ent*, %struct.code_ent** %74, align 8
  %76 = icmp sgt i64 %.115, 0
  br i1 %76, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %58
  %77 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 3
  %78 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 9
  %79 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 9
  br label %80

; <label>:80:                                     ; preds = %.lr.ph, %.backedge
  %.02142 = phi %struct.code_ent* [ %71, %.lr.ph ], [ %.02.be, %.backedge ]
  %.04141 = phi %struct.code_ent* [ %75, %.lr.ph ], [ %.04.be, %.backedge ]
  %.06140 = phi %struct.code_ent* [ %73, %.lr.ph ], [ %.06.be, %.backedge ]
  %.112139 = phi i8* [ %.011, %.lr.ph ], [ %.112.be, %.backedge ]
  %.216138 = phi i64 [ %.115, %.lr.ph ], [ %.216.be, %.backedge ]
  %.024137 = phi i8* [ %60, %.lr.ph ], [ %.024.be, %.backedge ]
  %.032136 = phi i64 [ %69, %.lr.ph ], [ %.032.be, %.backedge ]
  %.035135 = phi i64 [ %63, %.lr.ph ], [ %.035.be, %.backedge ]
  %.039134 = phi i64 [ %67, %.lr.ph ], [ %.039.be, %.backedge ]
  %.045133 = phi i64 [ %65, %.lr.ph ], [ %.045.be, %.backedge ]
  %81 = load i64, i64* %77, align 8
  %82 = icmp slt i64 %81, %.035135
  br i1 %82, label %.thread, label %87

.thread:                                          ; preds = %80
  %83 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %84 = load i8*, i8** %83, align 8
  %85 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  %86 = load i32, i32* %85, align 8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %84, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i64 0, i64 0), i32 %86) #6
  br label %.loopexit

; <label>:87:                                     ; preds = %80
  %88 = shl i64 %.045133, 8
  %89 = getelementptr inbounds i8, i8* %.024137, i64 1
  %90 = load i8, i8* %.024137, align 1
  %91 = zext i8 %90 to i64
  %92 = or i64 %91, %88
  %93 = add nsw i64 %.039134, 8
  %94 = icmp slt i64 %93, %.035135
  br i1 %94, label %95, label %102

; <label>:95:                                     ; preds = %87
  %96 = add nsw i64 %.039134, 16
  %97 = getelementptr inbounds i8, i8* %.024137, i64 2
  %98 = shl i64 %92, 8
  %99 = load i8, i8* %89, align 1
  %100 = zext i8 %99 to i64
  %101 = or i64 %100, %98
  br label %102

; <label>:102:                                    ; preds = %87, %95
  %.146 = phi i64 [ %101, %95 ], [ %92, %87 ]
  %.140 = phi i64 [ %96, %95 ], [ %93, %87 ]
  %.125 = phi i8* [ %97, %95 ], [ %89, %87 ]
  %103 = sub nsw i64 %.140, %.035135
  %104 = ashr i64 %.146, %103
  %105 = and i64 %104, %.032136
  %106 = trunc i64 %105 to i16
  %107 = load i64, i64* %77, align 8
  %108 = sub nsw i64 %107, %.035135
  store i64 %108, i64* %77, align 8
  switch i16 %106, label %150 [
    i16 257, label %.loopexit.loopexit408
    i16 256, label %109
  ]

; <label>:109:                                    ; preds = %102
  %110 = load %struct.code_ent*, %struct.code_ent** %79, align 8
  %111 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %110, i64 258
  %112 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %110, i64 510
  %113 = load i64, i64* %77, align 8
  %114 = icmp slt i64 %113, 9
  br i1 %114, label %.thread51, label %119

.thread51:                                        ; preds = %109
  %115 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %116 = load i8*, i8** %115, align 8
  %117 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  %118 = load i32, i32* %117, align 8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %116, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i64 0, i64 0), i32 %118) #6
  br label %.loopexit

; <label>:119:                                    ; preds = %109
  %120 = shl i64 %.146, 8
  %121 = getelementptr inbounds i8, i8* %.125, i64 1
  %122 = load i8, i8* %.125, align 1
  %123 = zext i8 %122 to i64
  %124 = or i64 %123, %120
  %125 = add nsw i64 %103, 8
  %126 = icmp slt i64 %125, 9
  br i1 %126, label %127, label %134

; <label>:127:                                    ; preds = %119
  %128 = add nsw i64 %103, 16
  %129 = getelementptr inbounds i8, i8* %.125, i64 2
  %130 = shl i64 %124, 8
  %131 = load i8, i8* %121, align 1
  %132 = zext i8 %131 to i64
  %133 = or i64 %132, %130
  br label %134

; <label>:134:                                    ; preds = %119, %127
  %.348 = phi i64 [ %133, %127 ], [ %124, %119 ]
  %.342 = phi i64 [ %128, %127 ], [ %125, %119 ]
  %.327 = phi i8* [ %129, %127 ], [ %121, %119 ]
  %135 = add nsw i64 %.342, -9
  %136 = ashr i64 %.348, %135
  %137 = trunc i64 %136 to i16
  %138 = and i16 %137, 511
  %139 = load i64, i64* %77, align 8
  %140 = add nsw i64 %139, -9
  store i64 %140, i64* %77, align 8
  %141 = icmp eq i16 %138, 257
  br i1 %141, label %.loopexit.loopexit408, label %142

; <label>:142:                                    ; preds = %134
  %143 = trunc i64 %136 to i8
  %144 = getelementptr inbounds i8, i8* %.112139, i64 1
  store i8 %143, i8* %.112139, align 1
  %145 = add nsw i64 %.216138, -1
  %146 = load %struct.code_ent*, %struct.code_ent** %79, align 8
  %147 = zext i16 %138 to i64
  %148 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %146, i64 %147
  br label %.backedge

.backedge:                                        ; preds = %142, %225, %223
  %.045.be = phi i64 [ %.348, %142 ], [ %.146, %225 ], [ %.146, %223 ]
  %.039.be = phi i64 [ %135, %142 ], [ %103, %225 ], [ %103, %223 ]
  %.035.be = phi i64 [ 9, %142 ], [ %.237, %225 ], [ %.237, %223 ]
  %.032.be = phi i64 [ 511, %142 ], [ %.133, %225 ], [ %.133, %223 ]
  %.024.be = phi i8* [ %.327, %142 ], [ %.125, %225 ], [ %.125, %223 ]
  %.216.be = phi i64 [ %145, %142 ], [ %228, %225 ], [ %224, %223 ]
  %.112.be = phi i8* [ %144, %142 ], [ %227, %225 ], [ %211, %223 ]
  %.06.be = phi %struct.code_ent* [ %111, %142 ], [ %170, %225 ], [ %170, %223 ]
  %.04.be = phi %struct.code_ent* [ %112, %142 ], [ %.15, %225 ], [ %.15, %223 ]
  %.02.be = phi %struct.code_ent* [ %148, %142 ], [ %153, %225 ], [ %153, %223 ]
  %149 = icmp sgt i64 %.216.be, 0
  br i1 %149, label %80, label %.loopexit.loopexit408

; <label>:150:                                    ; preds = %102
  %151 = load %struct.code_ent*, %struct.code_ent** %78, align 8
  %152 = and i64 %105, 65535
  %153 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %151, i64 %152
  %154 = icmp ule %struct.code_ent* %151, %.06140
  %155 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %151, i64 5119
  %156 = icmp ult %struct.code_ent* %.06140, %155
  %or.cond = and i1 %154, %156
  br i1 %or.cond, label %158, label %157

; <label>:157:                                    ; preds = %150
  tail call void @__assert_fail(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 398, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.LZWDecode, i64 0, i64 0)) #5
  unreachable

; <label>:158:                                    ; preds = %150
  %159 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06140, i64 0, i32 0
  store %struct.code_ent* %.02142, %struct.code_ent** %159, align 8
  %160 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.02142, i64 0, i32 3
  %161 = load i8, i8* %160, align 1
  %162 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06140, i64 0, i32 3
  store i8 %161, i8* %162, align 1
  %163 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.02142, i64 0, i32 1
  %164 = load i16, i16* %163, align 8
  %165 = add i16 %164, 1
  %166 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06140, i64 0, i32 1
  store i16 %165, i16* %166, align 8
  %167 = icmp ult %struct.code_ent* %153, %.06140
  %168 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %151, i64 %152, i32 3
  %.in.in = select i1 %167, i8* %168, i8* %162
  %.in = load i8, i8* %.in.in, align 1
  %169 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06140, i64 0, i32 2
  store i8 %.in, i8* %169, align 2
  %170 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06140, i64 1
  %171 = icmp ugt %struct.code_ent* %170, %.04141
  %172 = add nsw i64 %.035135, 1
  %173 = icmp sgt i64 %.035135, 11
  %. = select i1 %173, i64 12, i64 %172
  %174 = shl i64 1, %.
  %175 = add nsw i64 %174, -1
  br i1 %171, label %176, label %180

; <label>:176:                                    ; preds = %158
  %177 = load %struct.code_ent*, %struct.code_ent** %78, align 8
  %178 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %177, i64 %175
  %179 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %178, i64 -1
  br label %180

; <label>:180:                                    ; preds = %176, %158
  %.237 = phi i64 [ %., %176 ], [ %.035135, %158 ]
  %.133 = phi i64 [ %175, %176 ], [ %.032136, %158 ]
  %.15 = phi %struct.code_ent* [ %179, %176 ], [ %.04141, %158 ]
  %181 = icmp ugt i16 %106, 255
  br i1 %181, label %182, label %225

; <label>:182:                                    ; preds = %180
  %183 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %151, i64 %152, i32 1
  %184 = load i16, i16* %183, align 8
  %185 = zext i16 %184 to i64
  %186 = icmp slt i64 %.216138, %185
  br i1 %186, label %187, label %210

; <label>:187:                                    ; preds = %182
  %188 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 5
  store %struct.code_ent* %153, %struct.code_ent** %188, align 8
  br label %189

; <label>:189:                                    ; preds = %192, %187
  %.3 = phi %struct.code_ent* [ %153, %187 ], [ %191, %192 ]
  %190 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.3, i64 0, i32 0
  %191 = load %struct.code_ent*, %struct.code_ent** %190, align 8
  %cond = icmp eq %struct.code_ent* %191, null
  br i1 %cond, label %.loopexit.loopexit, label %192

; <label>:192:                                    ; preds = %189
  %193 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %191, i64 0, i32 1
  %194 = load i16, i16* %193, align 8
  %195 = zext i16 %194 to i64
  %196 = icmp sgt i64 %195, %.216138
  br i1 %196, label %189, label %.critedge

.critedge:                                        ; preds = %192
  store i64 %.216138, i64* %12, align 8
  %197 = getelementptr inbounds i8, i8* %.112139, i64 %.216138
  br label %198

; <label>:198:                                    ; preds = %198, %.critedge
  %.222 = phi i8* [ %197, %.critedge ], [ %201, %198 ]
  %.317 = phi i64 [ %.216138, %.critedge ], [ %204, %198 ]
  %.4 = phi %struct.code_ent* [ %191, %.critedge ], [ %203, %198 ]
  %199 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.4, i64 0, i32 2
  %200 = load i8, i8* %199, align 2
  %201 = getelementptr inbounds i8, i8* %.222, i64 -1
  store i8 %200, i8* %201, align 1
  %202 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.4, i64 0, i32 0
  %203 = load %struct.code_ent*, %struct.code_ent** %202, align 8
  %204 = add nsw i64 %.317, -1
  %205 = icmp ne %struct.code_ent* %203, null
  %not.54 = icmp ne i64 %204, 0
  %206 = and i1 %not.54, %205
  br i1 %206, label %198, label %207

; <label>:207:                                    ; preds = %198
  %208 = icmp eq %struct.code_ent* %203, null
  br i1 %208, label %.loopexit, label %209

; <label>:209:                                    ; preds = %207
  tail call fastcc void @codeLoop(%struct.tiff* %0)
  br label %.loopexit

; <label>:210:                                    ; preds = %182
  %211 = getelementptr inbounds i8, i8* %.112139, i64 %185
  br label %212

; <label>:212:                                    ; preds = %212, %210
  %.323 = phi i8* [ %211, %210 ], [ %213, %212 ]
  %.5 = phi %struct.code_ent* [ %153, %210 ], [ %217, %212 ]
  %213 = getelementptr inbounds i8, i8* %.323, i64 -1
  %214 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.5, i64 0, i32 2
  %215 = load i8, i8* %214, align 2
  %216 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.5, i64 0, i32 0
  %217 = load %struct.code_ent*, %struct.code_ent** %216, align 8
  store i8 %215, i8* %213, align 1
  %218 = icmp eq %struct.code_ent* %217, null
  %219 = icmp ugt i8* %213, %.112139
  %not.53 = xor i1 %218, true
  %220 = and i1 %219, %not.53
  br i1 %220, label %212, label %221

; <label>:221:                                    ; preds = %212
  br i1 %218, label %223, label %222

; <label>:222:                                    ; preds = %221
  tail call fastcc void @codeLoop(%struct.tiff* %0)
  br label %.loopexit

; <label>:223:                                    ; preds = %221
  %224 = sub nsw i64 %.216138, %185
  br label %.backedge

; <label>:225:                                    ; preds = %180
  %226 = trunc i64 %105 to i8
  %227 = getelementptr inbounds i8, i8* %.112139, i64 1
  store i8 %226, i8* %.112139, align 1
  %228 = add nsw i64 %.216138, -1
  br label %.backedge

.loopexit.loopexit:                               ; preds = %189
  br label %.loopexit

.loopexit.loopexit408:                            ; preds = %134, %102, %.backedge
  %.550.ph = phi i64 [ %.045.be, %.backedge ], [ %.146, %102 ], [ %.348, %134 ]
  %.544.ph = phi i64 [ %.039.be, %.backedge ], [ %103, %102 ], [ %135, %134 ]
  %.338.ph = phi i64 [ %.035.be, %.backedge ], [ %.035135, %102 ], [ 9, %134 ]
  %.234.ph = phi i64 [ %.032.be, %.backedge ], [ %.032136, %102 ], [ 511, %134 ]
  %.529.ph = phi i8* [ %.024.be, %.backedge ], [ %.125, %102 ], [ %.327, %134 ]
  %.6.ph = phi i64 [ %.216.be, %.backedge ], [ %.216138, %102 ], [ %.216138, %134 ]
  %.17.ph = phi %struct.code_ent* [ %.06.be, %.backedge ], [ %.06140, %102 ], [ %111, %134 ]
  %.2.ph = phi %struct.code_ent* [ %.04.be, %.backedge ], [ %.04141, %102 ], [ %112, %134 ]
  %.13.ph = phi %struct.code_ent* [ %.02.be, %.backedge ], [ %.02142, %102 ], [ %.02142, %134 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit408, %.loopexit.loopexit, %58, %.thread51, %.thread, %207, %209, %222
  %.550 = phi i64 [ %.146, %222 ], [ %.146, %209 ], [ %.146, %207 ], [ %.045133, %.thread ], [ %.146, %.thread51 ], [ %65, %58 ], [ %.146, %.loopexit.loopexit ], [ %.550.ph, %.loopexit.loopexit408 ]
  %.544 = phi i64 [ %103, %222 ], [ %103, %209 ], [ %103, %207 ], [ %.039134, %.thread ], [ %103, %.thread51 ], [ %67, %58 ], [ %103, %.loopexit.loopexit ], [ %.544.ph, %.loopexit.loopexit408 ]
  %.338 = phi i64 [ %.237, %222 ], [ %.237, %209 ], [ %.237, %207 ], [ %.035135, %.thread ], [ 9, %.thread51 ], [ %63, %58 ], [ %.237, %.loopexit.loopexit ], [ %.338.ph, %.loopexit.loopexit408 ]
  %.234 = phi i64 [ %.133, %222 ], [ %.133, %209 ], [ %.133, %207 ], [ %.032136, %.thread ], [ 511, %.thread51 ], [ %69, %58 ], [ %.133, %.loopexit.loopexit ], [ %.234.ph, %.loopexit.loopexit408 ]
  %.529 = phi i8* [ %.125, %222 ], [ %.125, %209 ], [ %.125, %207 ], [ %.024137, %.thread ], [ %.125, %.thread51 ], [ %60, %58 ], [ %.125, %.loopexit.loopexit ], [ %.529.ph, %.loopexit.loopexit408 ]
  %.6 = phi i64 [ %.216138, %222 ], [ %204, %209 ], [ %204, %207 ], [ %.216138, %.thread ], [ %.216138, %.thread51 ], [ %.115, %58 ], [ %.216138, %.loopexit.loopexit ], [ %.6.ph, %.loopexit.loopexit408 ]
  %.17 = phi %struct.code_ent* [ %170, %222 ], [ %170, %209 ], [ %170, %207 ], [ %.06140, %.thread ], [ %111, %.thread51 ], [ %73, %58 ], [ %170, %.loopexit.loopexit ], [ %.17.ph, %.loopexit.loopexit408 ]
  %.2 = phi %struct.code_ent* [ %.15, %222 ], [ %.15, %209 ], [ %.15, %207 ], [ %.04141, %.thread ], [ %112, %.thread51 ], [ %75, %58 ], [ %.15, %.loopexit.loopexit ], [ %.2.ph, %.loopexit.loopexit408 ]
  %.13 = phi %struct.code_ent* [ %153, %222 ], [ %153, %209 ], [ %153, %207 ], [ %.02142, %.thread ], [ %.02142, %.thread51 ], [ %71, %58 ], [ %153, %.loopexit.loopexit ], [ %.13.ph, %.loopexit.loopexit408 ]
  store i8* %.529, i8** %59, align 8
  %229 = trunc i64 %.338 to i16
  store i16 %229, i16* %61, align 8
  store i64 %.550, i64* %64, align 8
  store i64 %.544, i64* %66, align 8
  store i64 %.234, i64* %68, align 8
  store %struct.code_ent* %.13, %struct.code_ent** %70, align 8
  store %struct.code_ent* %.17, %struct.code_ent** %72, align 8
  store %struct.code_ent* %.2, %struct.code_ent** %74, align 8
  %230 = icmp sgt i64 %.6, 0
  br i1 %230, label %231, label %.loopexit57

; <label>:231:                                    ; preds = %.loopexit
  %232 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %233 = load i8*, i8** %232, align 8
  %234 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %235 = load i32, i32* %234, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %233, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.10, i64 0, i64 0), i32 %235, i64 %.6) #6
  br label %.loopexit57

.loopexit57.loopexit:                             ; preds = %36
  br label %.loopexit57

.loopexit57:                                      ; preds = %.loopexit57.loopexit, %.loopexit, %32, %231
  %.0 = phi i32 [ 0, %231 ], [ 1, %32 ], [ 1, %.loopexit ], [ 1, %.loopexit57.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @_LZWtrue(%struct.tiff* nocapture readnone) #3 {
  ret i32 1
}

declare i32 @_TIFFNoPreCode(%struct.tiff*, i16 zeroext) #2

declare i32 @_TIFFNoRowEncode(%struct.tiff*, i8*, i32, i16 zeroext) #2

declare i32 @_TIFFNoStripEncode(%struct.tiff*, i8*, i32, i16 zeroext) #2

declare i32 @_TIFFNoTileEncode(%struct.tiff*, i8*, i32, i16 zeroext) #2

; Function Attrs: noinline nounwind uwtable
define internal void @LZWCleanup(%struct.tiff* nocapture) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = load i8*, i8** %2, align 8
  %4 = icmp eq i8* %3, null
  br i1 %4, label %20, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %18

; <label>:9:                                      ; preds = %5
  %10 = bitcast i8** %2 to %struct.LZWDecodeState**
  %11 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %10, align 8
  %12 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %11, i64 0, i32 9
  %13 = load %struct.code_ent*, %struct.code_ent** %12, align 8
  %14 = icmp eq %struct.code_ent* %13, null
  br i1 %14, label %18, label %15

; <label>:15:                                     ; preds = %9
  %16 = bitcast %struct.code_ent** %12 to i8**
  %17 = load i8*, i8** %16, align 8
  tail call void @_TIFFfree(i8* %17) #6
  br label %18

; <label>:18:                                     ; preds = %15, %9, %5
  %19 = load i8*, i8** %2, align 8
  tail call void @_TIFFfree(i8* %19) #6
  store i8* null, i8** %2, align 8
  br label %20

; <label>:20:                                     ; preds = %1, %18
  ret void
}

declare i32 @TIFFPredictorInit(%struct.tiff*) local_unnamed_addr #2

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

declare void @TIFFWarning(i8*, i8*, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @LZWDecodeCompat(%struct.tiff* nocapture, i8* nocapture, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.LZWDecodeState**
  %7 = load %struct.LZWDecodeState*, %struct.LZWDecodeState** %6, align 8
  %8 = sext i32 %2 to i64
  %9 = icmp eq %struct.LZWDecodeState* %7, null
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %4
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 504, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.LZWDecodeCompat, i64 0, i64 0)) #5
  unreachable

; <label>:11:                                     ; preds = %4
  %12 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 2
  %13 = load i64, i64* %12, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %247, label %15

; <label>:15:                                     ; preds = %11
  %16 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 5
  %17 = load %struct.code_ent*, %struct.code_ent** %16, align 8
  %18 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %17, i64 0, i32 1
  %19 = load i16, i16* %18, align 8
  %20 = zext i16 %19 to i64
  %21 = sub nsw i64 %20, %13
  %22 = icmp slt i64 %8, %21
  br i1 %22, label %23, label %168

; <label>:23:                                     ; preds = %15
  %24 = add nsw i64 %13, %8
  store i64 %24, i64* %12, align 8
  %25 = sub i64 %20, %13
  %26 = sub i64 %25, %8
  %27 = add nsw i64 %20, -1
  %28 = sub i64 %27, %13
  %29 = sub i64 %28, %8
  %xtraiter215 = and i64 %26, 7
  %lcmp.mod216 = icmp eq i64 %xtraiter215, 0
  br i1 %lcmp.mod216, label %.prol.loopexit213, label %.prol.preheader212.preheader

.prol.preheader212.preheader:                     ; preds = %23
  br label %.prol.preheader212

.prol.preheader212:                               ; preds = %.prol.preheader212.preheader, %.prol.preheader212
  %.08.prol = phi %struct.code_ent* [ %31, %.prol.preheader212 ], [ %17, %.prol.preheader212.preheader ]
  %.01.prol = phi i64 [ %32, %.prol.preheader212 ], [ %21, %.prol.preheader212.preheader ]
  %prol.iter217 = phi i64 [ %prol.iter217.sub, %.prol.preheader212 ], [ %xtraiter215, %.prol.preheader212.preheader ]
  %30 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.08.prol, i64 0, i32 0
  %31 = load %struct.code_ent*, %struct.code_ent** %30, align 8
  %32 = add nsw i64 %.01.prol, -1
  %prol.iter217.sub = add i64 %prol.iter217, -1
  %prol.iter217.cmp = icmp eq i64 %prol.iter217.sub, 0
  br i1 %prol.iter217.cmp, label %.prol.loopexit213.loopexit, label %.prol.preheader212, !llvm.loop !1

.prol.loopexit213.loopexit:                       ; preds = %.prol.preheader212
  br label %.prol.loopexit213

.prol.loopexit213:                                ; preds = %.prol.loopexit213.loopexit, %23
  %.08.unr = phi %struct.code_ent* [ %17, %23 ], [ %31, %.prol.loopexit213.loopexit ]
  %.01.unr = phi i64 [ %21, %23 ], [ %32, %.prol.loopexit213.loopexit ]
  %.lcssa205.unr = phi %struct.code_ent* [ undef, %23 ], [ %31, %.prol.loopexit213.loopexit ]
  %33 = icmp ult i64 %29, 7
  br i1 %33, label %.unr-lcssa, label %.new214.preheader

.new214.preheader:                                ; preds = %.prol.loopexit213
  %34 = xor i64 %8, -1
  %35 = sub i64 7, %.01.unr
  %36 = icmp slt i64 %35, %34
  %smax = select i1 %36, i64 %34, i64 %35
  %37 = add i64 %.01.unr, %smax
  %38 = lshr i64 %37, 3
  %39 = and i64 %38, 1
  %lcmp.mod449 = icmp eq i64 %39, 0
  br i1 %lcmp.mod449, label %.new214.prol.preheader, label %.new214.prol.loopexit

.new214.prol.preheader:                           ; preds = %.new214.preheader
  br label %.new214.prol

.new214.prol:                                     ; preds = %.new214.prol.preheader
  %40 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.08.unr, i64 0, i32 0
  %41 = load %struct.code_ent*, %struct.code_ent** %40, align 8
  %42 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %41, i64 0, i32 0
  %43 = load %struct.code_ent*, %struct.code_ent** %42, align 8
  %44 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %43, i64 0, i32 0
  %45 = load %struct.code_ent*, %struct.code_ent** %44, align 8
  %46 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %45, i64 0, i32 0
  %47 = load %struct.code_ent*, %struct.code_ent** %46, align 8
  %48 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %47, i64 0, i32 0
  %49 = load %struct.code_ent*, %struct.code_ent** %48, align 8
  %50 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %49, i64 0, i32 0
  %51 = load %struct.code_ent*, %struct.code_ent** %50, align 8
  %52 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %51, i64 0, i32 0
  %53 = load %struct.code_ent*, %struct.code_ent** %52, align 8
  %54 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %53, i64 0, i32 0
  %55 = load %struct.code_ent*, %struct.code_ent** %54, align 8
  %56 = add nsw i64 %.01.unr, -8
  br label %.new214.prol.loopexit

.new214.prol.loopexit:                            ; preds = %.new214.prol, %.new214.preheader
  %.08.unr452 = phi %struct.code_ent* [ %.08.unr, %.new214.preheader ], [ %55, %.new214.prol ]
  %.01.unr453 = phi i64 [ %.01.unr, %.new214.preheader ], [ %56, %.new214.prol ]
  %.lcssa426.unr = phi %struct.code_ent* [ undef, %.new214.preheader ], [ %55, %.new214.prol ]
  %57 = icmp eq i64 %38, 0
  br i1 %57, label %.unr-lcssa.loopexit, label %.new214.preheader.new

.new214.preheader.new:                            ; preds = %.new214.prol.loopexit
  br label %.new214

.new214:                                          ; preds = %.new214, %.new214.preheader.new
  %.08 = phi %struct.code_ent* [ %.08.unr452, %.new214.preheader.new ], [ %89, %.new214 ]
  %.01 = phi i64 [ %.01.unr453, %.new214.preheader.new ], [ %90, %.new214 ]
  %58 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.08, i64 0, i32 0
  %59 = load %struct.code_ent*, %struct.code_ent** %58, align 8
  %60 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %59, i64 0, i32 0
  %61 = load %struct.code_ent*, %struct.code_ent** %60, align 8
  %62 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %61, i64 0, i32 0
  %63 = load %struct.code_ent*, %struct.code_ent** %62, align 8
  %64 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %63, i64 0, i32 0
  %65 = load %struct.code_ent*, %struct.code_ent** %64, align 8
  %66 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %65, i64 0, i32 0
  %67 = load %struct.code_ent*, %struct.code_ent** %66, align 8
  %68 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %67, i64 0, i32 0
  %69 = load %struct.code_ent*, %struct.code_ent** %68, align 8
  %70 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %69, i64 0, i32 0
  %71 = load %struct.code_ent*, %struct.code_ent** %70, align 8
  %72 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %71, i64 0, i32 0
  %73 = load %struct.code_ent*, %struct.code_ent** %72, align 8
  %74 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %73, i64 0, i32 0
  %75 = load %struct.code_ent*, %struct.code_ent** %74, align 8
  %76 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %75, i64 0, i32 0
  %77 = load %struct.code_ent*, %struct.code_ent** %76, align 8
  %78 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %77, i64 0, i32 0
  %79 = load %struct.code_ent*, %struct.code_ent** %78, align 8
  %80 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %79, i64 0, i32 0
  %81 = load %struct.code_ent*, %struct.code_ent** %80, align 8
  %82 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %81, i64 0, i32 0
  %83 = load %struct.code_ent*, %struct.code_ent** %82, align 8
  %84 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %83, i64 0, i32 0
  %85 = load %struct.code_ent*, %struct.code_ent** %84, align 8
  %86 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %85, i64 0, i32 0
  %87 = load %struct.code_ent*, %struct.code_ent** %86, align 8
  %88 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %87, i64 0, i32 0
  %89 = load %struct.code_ent*, %struct.code_ent** %88, align 8
  %90 = add nsw i64 %.01, -16
  %91 = icmp sgt i64 %90, %8
  br i1 %91, label %.new214, label %.unr-lcssa.loopexit.unr-lcssa

.unr-lcssa.loopexit.unr-lcssa:                    ; preds = %.new214
  br label %.unr-lcssa.loopexit

.unr-lcssa.loopexit:                              ; preds = %.new214.prol.loopexit, %.unr-lcssa.loopexit.unr-lcssa
  %.lcssa426 = phi %struct.code_ent* [ %.lcssa426.unr, %.new214.prol.loopexit ], [ %89, %.unr-lcssa.loopexit.unr-lcssa ]
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %.prol.loopexit213
  %.lcssa205 = phi %struct.code_ent* [ %.lcssa205.unr, %.prol.loopexit213 ], [ %.lcssa426, %.unr-lcssa.loopexit ]
  %92 = getelementptr inbounds i8, i8* %1, i64 %8
  %93 = add nsw i64 %8, -1
  %xtraiter209 = and i64 %8, 3
  %lcmp.mod210 = icmp eq i64 %xtraiter209, 0
  br i1 %lcmp.mod210, label %.prol.loopexit207, label %.prol.preheader206.preheader

.prol.preheader206.preheader:                     ; preds = %.unr-lcssa
  br label %.prol.preheader206

.prol.preheader206:                               ; preds = %.prol.preheader206.preheader, %.prol.preheader206
  %.020.prol = phi i8* [ %96, %.prol.preheader206 ], [ %92, %.prol.preheader206.preheader ]
  %.014.prol = phi i64 [ %99, %.prol.preheader206 ], [ %8, %.prol.preheader206.preheader ]
  %.19.prol = phi %struct.code_ent* [ %98, %.prol.preheader206 ], [ %.lcssa205, %.prol.preheader206.preheader ]
  %prol.iter211 = phi i64 [ %prol.iter211.sub, %.prol.preheader206 ], [ %xtraiter209, %.prol.preheader206.preheader ]
  %94 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.19.prol, i64 0, i32 2
  %95 = load i8, i8* %94, align 2
  %96 = getelementptr inbounds i8, i8* %.020.prol, i64 -1
  store i8 %95, i8* %96, align 1
  %97 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.19.prol, i64 0, i32 0
  %98 = load %struct.code_ent*, %struct.code_ent** %97, align 8
  %99 = add nsw i64 %.014.prol, -1
  %prol.iter211.sub = add i64 %prol.iter211, -1
  %prol.iter211.cmp = icmp eq i64 %prol.iter211.sub, 0
  br i1 %prol.iter211.cmp, label %.prol.loopexit207.loopexit, label %.prol.preheader206, !llvm.loop !3

.prol.loopexit207.loopexit:                       ; preds = %.prol.preheader206
  br label %.prol.loopexit207

.prol.loopexit207:                                ; preds = %.prol.loopexit207.loopexit, %.unr-lcssa
  %.020.unr = phi i8* [ %92, %.unr-lcssa ], [ %96, %.prol.loopexit207.loopexit ]
  %.014.unr = phi i64 [ %8, %.unr-lcssa ], [ %99, %.prol.loopexit207.loopexit ]
  %.19.unr = phi %struct.code_ent* [ %.lcssa205, %.unr-lcssa ], [ %98, %.prol.loopexit207.loopexit ]
  %100 = icmp ult i64 %93, 3
  br i1 %100, label %.loopexit55, label %.new208.preheader

.new208.preheader:                                ; preds = %.prol.loopexit207
  %101 = add i64 %.014.unr, -4
  %102 = lshr i64 %101, 2
  %103 = and i64 %102, 1
  %lcmp.mod441 = icmp eq i64 %103, 0
  br i1 %lcmp.mod441, label %.new208.prol.preheader, label %.new208.prol.loopexit

.new208.prol.preheader:                           ; preds = %.new208.preheader
  br label %.new208.prol

.new208.prol:                                     ; preds = %.new208.prol.preheader
  %104 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.19.unr, i64 0, i32 2
  %105 = load i8, i8* %104, align 2
  %106 = getelementptr inbounds i8, i8* %.020.unr, i64 -1
  store i8 %105, i8* %106, align 1
  %107 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.19.unr, i64 0, i32 0
  %108 = load %struct.code_ent*, %struct.code_ent** %107, align 8
  %109 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %108, i64 0, i32 2
  %110 = load i8, i8* %109, align 2
  %111 = getelementptr inbounds i8, i8* %.020.unr, i64 -2
  store i8 %110, i8* %111, align 1
  %112 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %108, i64 0, i32 0
  %113 = load %struct.code_ent*, %struct.code_ent** %112, align 8
  %114 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %113, i64 0, i32 2
  %115 = load i8, i8* %114, align 2
  %116 = getelementptr inbounds i8, i8* %.020.unr, i64 -3
  store i8 %115, i8* %116, align 1
  %117 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %113, i64 0, i32 0
  %118 = load %struct.code_ent*, %struct.code_ent** %117, align 8
  %119 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %118, i64 0, i32 2
  %120 = load i8, i8* %119, align 2
  %121 = getelementptr inbounds i8, i8* %.020.unr, i64 -4
  store i8 %120, i8* %121, align 1
  %122 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %118, i64 0, i32 0
  %123 = load %struct.code_ent*, %struct.code_ent** %122, align 8
  %124 = add nsw i64 %.014.unr, -4
  br label %.new208.prol.loopexit

.new208.prol.loopexit:                            ; preds = %.new208.prol, %.new208.preheader
  %.020.unr445 = phi i8* [ %.020.unr, %.new208.preheader ], [ %121, %.new208.prol ]
  %.014.unr446 = phi i64 [ %.014.unr, %.new208.preheader ], [ %124, %.new208.prol ]
  %.19.unr447 = phi %struct.code_ent* [ %.19.unr, %.new208.preheader ], [ %123, %.new208.prol ]
  %125 = icmp eq i64 %102, 0
  br i1 %125, label %.loopexit55.loopexit, label %.new208.preheader.new

.new208.preheader.new:                            ; preds = %.new208.prol.loopexit
  br label %.new208

.new208:                                          ; preds = %.new208, %.new208.preheader.new
  %.020 = phi i8* [ %.020.unr445, %.new208.preheader.new ], [ %163, %.new208 ]
  %.014 = phi i64 [ %.014.unr446, %.new208.preheader.new ], [ %166, %.new208 ]
  %.19 = phi %struct.code_ent* [ %.19.unr447, %.new208.preheader.new ], [ %165, %.new208 ]
  %126 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.19, i64 0, i32 2
  %127 = load i8, i8* %126, align 2
  %128 = getelementptr inbounds i8, i8* %.020, i64 -1
  store i8 %127, i8* %128, align 1
  %129 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.19, i64 0, i32 0
  %130 = load %struct.code_ent*, %struct.code_ent** %129, align 8
  %131 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %130, i64 0, i32 2
  %132 = load i8, i8* %131, align 2
  %133 = getelementptr inbounds i8, i8* %.020, i64 -2
  store i8 %132, i8* %133, align 1
  %134 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %130, i64 0, i32 0
  %135 = load %struct.code_ent*, %struct.code_ent** %134, align 8
  %136 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %135, i64 0, i32 2
  %137 = load i8, i8* %136, align 2
  %138 = getelementptr inbounds i8, i8* %.020, i64 -3
  store i8 %137, i8* %138, align 1
  %139 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %135, i64 0, i32 0
  %140 = load %struct.code_ent*, %struct.code_ent** %139, align 8
  %141 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %140, i64 0, i32 2
  %142 = load i8, i8* %141, align 2
  %143 = getelementptr inbounds i8, i8* %.020, i64 -4
  store i8 %142, i8* %143, align 1
  %144 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %140, i64 0, i32 0
  %145 = load %struct.code_ent*, %struct.code_ent** %144, align 8
  %146 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %145, i64 0, i32 2
  %147 = load i8, i8* %146, align 2
  %148 = getelementptr inbounds i8, i8* %.020, i64 -5
  store i8 %147, i8* %148, align 1
  %149 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %145, i64 0, i32 0
  %150 = load %struct.code_ent*, %struct.code_ent** %149, align 8
  %151 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %150, i64 0, i32 2
  %152 = load i8, i8* %151, align 2
  %153 = getelementptr inbounds i8, i8* %.020, i64 -6
  store i8 %152, i8* %153, align 1
  %154 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %150, i64 0, i32 0
  %155 = load %struct.code_ent*, %struct.code_ent** %154, align 8
  %156 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %155, i64 0, i32 2
  %157 = load i8, i8* %156, align 2
  %158 = getelementptr inbounds i8, i8* %.020, i64 -7
  store i8 %157, i8* %158, align 1
  %159 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %155, i64 0, i32 0
  %160 = load %struct.code_ent*, %struct.code_ent** %159, align 8
  %161 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %160, i64 0, i32 2
  %162 = load i8, i8* %161, align 2
  %163 = getelementptr inbounds i8, i8* %.020, i64 -8
  store i8 %162, i8* %163, align 1
  %164 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %160, i64 0, i32 0
  %165 = load %struct.code_ent*, %struct.code_ent** %164, align 8
  %166 = add nsw i64 %.014, -8
  %167 = icmp eq i64 %166, 0
  br i1 %167, label %.loopexit55.loopexit.unr-lcssa, label %.new208

; <label>:168:                                    ; preds = %15
  %169 = getelementptr inbounds i8, i8* %1, i64 %21
  %170 = add nsw i64 %20, -1
  %171 = sub i64 %170, %13
  %xtraiter221 = and i64 %21, 3
  %lcmp.mod222 = icmp eq i64 %xtraiter221, 0
  br i1 %lcmp.mod222, label %.prol.loopexit219, label %.prol.preheader218.preheader

.prol.preheader218.preheader:                     ; preds = %168
  br label %.prol.preheader218

.prol.preheader218:                               ; preds = %.prol.preheader218.preheader, %.prol.preheader218
  %.121.prol = phi i8* [ %174, %.prol.preheader218 ], [ %169, %.prol.preheader218.preheader ]
  %.210.prol = phi %struct.code_ent* [ %176, %.prol.preheader218 ], [ %17, %.prol.preheader218.preheader ]
  %.1.prol = phi i64 [ %177, %.prol.preheader218 ], [ %21, %.prol.preheader218.preheader ]
  %prol.iter223 = phi i64 [ %prol.iter223.sub, %.prol.preheader218 ], [ %xtraiter221, %.prol.preheader218.preheader ]
  %172 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.210.prol, i64 0, i32 2
  %173 = load i8, i8* %172, align 2
  %174 = getelementptr inbounds i8, i8* %.121.prol, i64 -1
  store i8 %173, i8* %174, align 1
  %175 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.210.prol, i64 0, i32 0
  %176 = load %struct.code_ent*, %struct.code_ent** %175, align 8
  %177 = add nsw i64 %.1.prol, -1
  %prol.iter223.sub = add i64 %prol.iter223, -1
  %prol.iter223.cmp = icmp eq i64 %prol.iter223.sub, 0
  br i1 %prol.iter223.cmp, label %.prol.loopexit219.loopexit, label %.prol.preheader218, !llvm.loop !4

.prol.loopexit219.loopexit:                       ; preds = %.prol.preheader218
  br label %.prol.loopexit219

.prol.loopexit219:                                ; preds = %.prol.loopexit219.loopexit, %168
  %.121.unr = phi i8* [ %169, %168 ], [ %174, %.prol.loopexit219.loopexit ]
  %.210.unr = phi %struct.code_ent* [ %17, %168 ], [ %176, %.prol.loopexit219.loopexit ]
  %.1.unr = phi i64 [ %21, %168 ], [ %177, %.prol.loopexit219.loopexit ]
  %178 = icmp ult i64 %171, 3
  br i1 %178, label %.unr-lcssa224, label %.new220.preheader

.new220.preheader:                                ; preds = %.prol.loopexit219
  %179 = add i64 %.1.unr, -4
  %180 = lshr i64 %179, 2
  %181 = and i64 %180, 1
  %lcmp.mod455 = icmp eq i64 %181, 0
  br i1 %lcmp.mod455, label %.new220.prol.preheader, label %.new220.prol.loopexit

.new220.prol.preheader:                           ; preds = %.new220.preheader
  br label %.new220.prol

.new220.prol:                                     ; preds = %.new220.prol.preheader
  %182 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.210.unr, i64 0, i32 2
  %183 = load i8, i8* %182, align 2
  %184 = getelementptr inbounds i8, i8* %.121.unr, i64 -1
  store i8 %183, i8* %184, align 1
  %185 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.210.unr, i64 0, i32 0
  %186 = load %struct.code_ent*, %struct.code_ent** %185, align 8
  %187 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %186, i64 0, i32 2
  %188 = load i8, i8* %187, align 2
  %189 = getelementptr inbounds i8, i8* %.121.unr, i64 -2
  store i8 %188, i8* %189, align 1
  %190 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %186, i64 0, i32 0
  %191 = load %struct.code_ent*, %struct.code_ent** %190, align 8
  %192 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %191, i64 0, i32 2
  %193 = load i8, i8* %192, align 2
  %194 = getelementptr inbounds i8, i8* %.121.unr, i64 -3
  store i8 %193, i8* %194, align 1
  %195 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %191, i64 0, i32 0
  %196 = load %struct.code_ent*, %struct.code_ent** %195, align 8
  %197 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %196, i64 0, i32 2
  %198 = load i8, i8* %197, align 2
  %199 = getelementptr inbounds i8, i8* %.121.unr, i64 -4
  store i8 %198, i8* %199, align 1
  %200 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %196, i64 0, i32 0
  %201 = load %struct.code_ent*, %struct.code_ent** %200, align 8
  %202 = add nsw i64 %.1.unr, -4
  br label %.new220.prol.loopexit

.new220.prol.loopexit:                            ; preds = %.new220.prol, %.new220.preheader
  %.121.unr459 = phi i8* [ %.121.unr, %.new220.preheader ], [ %199, %.new220.prol ]
  %.210.unr460 = phi %struct.code_ent* [ %.210.unr, %.new220.preheader ], [ %201, %.new220.prol ]
  %.1.unr461 = phi i64 [ %.1.unr, %.new220.preheader ], [ %202, %.new220.prol ]
  %203 = icmp eq i64 %180, 0
  br i1 %203, label %.unr-lcssa224.loopexit, label %.new220.preheader.new

.new220.preheader.new:                            ; preds = %.new220.prol.loopexit
  br label %.new220

.new220:                                          ; preds = %.new220, %.new220.preheader.new
  %.121 = phi i8* [ %.121.unr459, %.new220.preheader.new ], [ %241, %.new220 ]
  %.210 = phi %struct.code_ent* [ %.210.unr460, %.new220.preheader.new ], [ %243, %.new220 ]
  %.1 = phi i64 [ %.1.unr461, %.new220.preheader.new ], [ %244, %.new220 ]
  %204 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.210, i64 0, i32 2
  %205 = load i8, i8* %204, align 2
  %206 = getelementptr inbounds i8, i8* %.121, i64 -1
  store i8 %205, i8* %206, align 1
  %207 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.210, i64 0, i32 0
  %208 = load %struct.code_ent*, %struct.code_ent** %207, align 8
  %209 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %208, i64 0, i32 2
  %210 = load i8, i8* %209, align 2
  %211 = getelementptr inbounds i8, i8* %.121, i64 -2
  store i8 %210, i8* %211, align 1
  %212 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %208, i64 0, i32 0
  %213 = load %struct.code_ent*, %struct.code_ent** %212, align 8
  %214 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %213, i64 0, i32 2
  %215 = load i8, i8* %214, align 2
  %216 = getelementptr inbounds i8, i8* %.121, i64 -3
  store i8 %215, i8* %216, align 1
  %217 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %213, i64 0, i32 0
  %218 = load %struct.code_ent*, %struct.code_ent** %217, align 8
  %219 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %218, i64 0, i32 2
  %220 = load i8, i8* %219, align 2
  %221 = getelementptr inbounds i8, i8* %.121, i64 -4
  store i8 %220, i8* %221, align 1
  %222 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %218, i64 0, i32 0
  %223 = load %struct.code_ent*, %struct.code_ent** %222, align 8
  %224 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %223, i64 0, i32 2
  %225 = load i8, i8* %224, align 2
  %226 = getelementptr inbounds i8, i8* %.121, i64 -5
  store i8 %225, i8* %226, align 1
  %227 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %223, i64 0, i32 0
  %228 = load %struct.code_ent*, %struct.code_ent** %227, align 8
  %229 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %228, i64 0, i32 2
  %230 = load i8, i8* %229, align 2
  %231 = getelementptr inbounds i8, i8* %.121, i64 -6
  store i8 %230, i8* %231, align 1
  %232 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %228, i64 0, i32 0
  %233 = load %struct.code_ent*, %struct.code_ent** %232, align 8
  %234 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %233, i64 0, i32 2
  %235 = load i8, i8* %234, align 2
  %236 = getelementptr inbounds i8, i8* %.121, i64 -7
  store i8 %235, i8* %236, align 1
  %237 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %233, i64 0, i32 0
  %238 = load %struct.code_ent*, %struct.code_ent** %237, align 8
  %239 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %238, i64 0, i32 2
  %240 = load i8, i8* %239, align 2
  %241 = getelementptr inbounds i8, i8* %.121, i64 -8
  store i8 %240, i8* %241, align 1
  %242 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %238, i64 0, i32 0
  %243 = load %struct.code_ent*, %struct.code_ent** %242, align 8
  %244 = add nsw i64 %.1, -8
  %245 = icmp eq i64 %244, 0
  br i1 %245, label %.unr-lcssa224.loopexit.unr-lcssa, label %.new220

.unr-lcssa224.loopexit.unr-lcssa:                 ; preds = %.new220
  br label %.unr-lcssa224.loopexit

.unr-lcssa224.loopexit:                           ; preds = %.new220.prol.loopexit, %.unr-lcssa224.loopexit.unr-lcssa
  br label %.unr-lcssa224

.unr-lcssa224:                                    ; preds = %.unr-lcssa224.loopexit, %.prol.loopexit219
  %246 = sub nsw i64 %8, %21
  store i64 0, i64* %12, align 8
  br label %247

; <label>:247:                                    ; preds = %11, %.unr-lcssa224
  %.115 = phi i64 [ %246, %.unr-lcssa224 ], [ %8, %11 ]
  %.011 = phi i8* [ %169, %.unr-lcssa224 ], [ %1, %11 ]
  %248 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %249 = load i8*, i8** %248, align 8
  %250 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 0, i32 1
  %251 = load i16, i16* %250, align 8
  %252 = zext i16 %251 to i32
  %253 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 0, i32 4
  %254 = load i64, i64* %253, align 8
  %255 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 0, i32 5
  %256 = load i64, i64* %255, align 8
  %257 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 1
  %258 = load i64, i64* %257, align 8
  %259 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 6
  %260 = load %struct.code_ent*, %struct.code_ent** %259, align 8
  %261 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 7
  %262 = load %struct.code_ent*, %struct.code_ent** %261, align 8
  %263 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 8
  %264 = load %struct.code_ent*, %struct.code_ent** %263, align 8
  %265 = icmp sgt i64 %.115, 0
  br i1 %265, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %247
  %266 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 3
  %267 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 9
  %268 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 9
  br label %269

; <label>:269:                                    ; preds = %.lr.ph, %.backedge
  %.02119 = phi %struct.code_ent* [ %260, %.lr.ph ], [ %.02.be, %.backedge ]
  %.04118 = phi %struct.code_ent* [ %264, %.lr.ph ], [ %.04.be, %.backedge ]
  %.06117 = phi %struct.code_ent* [ %262, %.lr.ph ], [ %.06.be, %.backedge ]
  %.112116 = phi i8* [ %.011, %.lr.ph ], [ %.112.be, %.backedge ]
  %.216115 = phi i64 [ %.115, %.lr.ph ], [ %.216.be, %.backedge ]
  %.024114 = phi i8* [ %249, %.lr.ph ], [ %.024.be, %.backedge ]
  %.032113 = phi i32 [ %252, %.lr.ph ], [ %.032.be, %.backedge ]
  %.036112 = phi i64 [ %256, %.lr.ph ], [ %.036.be, %.backedge ]
  %.042111 = phi i64 [ %254, %.lr.ph ], [ %.042.be, %.backedge ]
  %.048110 = phi i64 [ %258, %.lr.ph ], [ %.048.be, %.backedge ]
  %270 = load i64, i64* %266, align 8
  %271 = sext i32 %.032113 to i64
  %272 = icmp slt i64 %270, %271
  br i1 %272, label %.thread, label %277

.thread:                                          ; preds = %269
  %273 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %274 = load i8*, i8** %273, align 8
  %275 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  %276 = load i32, i32* %275, align 8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %274, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i64 0, i64 0), i32 %276) #6
  br label %.loopexit

; <label>:277:                                    ; preds = %269
  %278 = getelementptr inbounds i8, i8* %.024114, i64 1
  %279 = load i8, i8* %.024114, align 1
  %280 = zext i8 %279 to i64
  %281 = shl i64 %280, %.036112
  %282 = or i64 %281, %.042111
  %283 = add nsw i64 %.036112, 8
  %284 = icmp slt i64 %283, %271
  br i1 %284, label %285, label %292

; <label>:285:                                    ; preds = %277
  %286 = add nsw i64 %.036112, 16
  %287 = getelementptr inbounds i8, i8* %.024114, i64 2
  %288 = load i8, i8* %278, align 1
  %289 = zext i8 %288 to i64
  %290 = shl i64 %289, %283
  %291 = or i64 %290, %282
  br label %292

; <label>:292:                                    ; preds = %277, %285
  %.143 = phi i64 [ %291, %285 ], [ %282, %277 ]
  %.137 = phi i64 [ %286, %285 ], [ %283, %277 ]
  %.125 = phi i8* [ %287, %285 ], [ %278, %277 ]
  %293 = and i64 %.143, %.048110
  %294 = trunc i64 %293 to i32
  %295 = and i32 %294, 65535
  %296 = zext i32 %.032113 to i64
  %297 = ashr i64 %.143, %296
  %298 = sub nsw i64 %.137, %271
  %299 = load i64, i64* %266, align 8
  %300 = sub nsw i64 %299, %271
  store i64 %300, i64* %266, align 8
  %trunc = trunc i64 %293 to i16
  switch i16 %trunc, label %343 [
    i16 257, label %.loopexit.loopexit363
    i16 256, label %301
  ]

; <label>:301:                                    ; preds = %292
  %302 = load %struct.code_ent*, %struct.code_ent** %268, align 8
  %303 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %302, i64 258
  %304 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %302, i64 511
  %305 = load i64, i64* %266, align 8
  %306 = icmp slt i64 %305, 9
  br i1 %306, label %.thread51, label %311

.thread51:                                        ; preds = %301
  %307 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %308 = load i8*, i8** %307, align 8
  %309 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 13
  %310 = load i32, i32* %309, align 8
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %308, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.7, i64 0, i64 0), i32 %310) #6
  br label %.loopexit

; <label>:311:                                    ; preds = %301
  %312 = getelementptr inbounds i8, i8* %.125, i64 1
  %313 = load i8, i8* %.125, align 1
  %314 = zext i8 %313 to i64
  %315 = shl i64 %314, %298
  %316 = or i64 %315, %297
  %317 = add nsw i64 %298, 8
  %318 = icmp slt i64 %317, 9
  br i1 %318, label %319, label %326

; <label>:319:                                    ; preds = %311
  %320 = add nsw i64 %298, 16
  %321 = getelementptr inbounds i8, i8* %.125, i64 2
  %322 = load i8, i8* %312, align 1
  %323 = zext i8 %322 to i64
  %324 = shl i64 %323, %317
  %325 = or i64 %324, %316
  br label %326

; <label>:326:                                    ; preds = %311, %319
  %.345 = phi i64 [ %325, %319 ], [ %316, %311 ]
  %.339 = phi i64 [ %320, %319 ], [ %317, %311 ]
  %.327 = phi i8* [ %321, %319 ], [ %312, %311 ]
  %327 = trunc i64 %.345 to i32
  %328 = and i32 %327, 511
  %329 = ashr i64 %.345, 9
  %330 = add nsw i64 %.339, -9
  %331 = load i64, i64* %266, align 8
  %332 = add nsw i64 %331, -9
  store i64 %332, i64* %266, align 8
  %333 = icmp eq i32 %328, 257
  br i1 %333, label %.loopexit.loopexit363, label %334

; <label>:334:                                    ; preds = %326
  %335 = trunc i64 %.345 to i8
  %336 = getelementptr inbounds i8, i8* %.112116, i64 1
  store i8 %335, i8* %.112116, align 1
  %337 = add nsw i64 %.216115, -1
  %338 = load %struct.code_ent*, %struct.code_ent** %268, align 8
  %339 = zext i32 %328 to i64
  %340 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %338, i64 %339
  br label %.backedge

.backedge.loopexit:                               ; preds = %468
  %341 = sub nsw i64 %.216115, %378
  br label %.backedge

.backedge:                                        ; preds = %.backedge.loopexit, %334, %475
  %.048.be = phi i64 [ 511, %334 ], [ %.149, %475 ], [ %.149, %.backedge.loopexit ]
  %.042.be = phi i64 [ %329, %334 ], [ %297, %475 ], [ %297, %.backedge.loopexit ]
  %.036.be = phi i64 [ %330, %334 ], [ %298, %475 ], [ %298, %.backedge.loopexit ]
  %.032.be = phi i32 [ 9, %334 ], [ %.234, %475 ], [ %.234, %.backedge.loopexit ]
  %.024.be = phi i8* [ %.327, %334 ], [ %.125, %475 ], [ %.125, %.backedge.loopexit ]
  %.216.be = phi i64 [ %337, %334 ], [ %478, %475 ], [ %341, %.backedge.loopexit ]
  %.112.be = phi i8* [ %336, %334 ], [ %477, %475 ], [ %467, %.backedge.loopexit ]
  %.06.be = phi %struct.code_ent* [ %303, %334 ], [ %363, %475 ], [ %363, %.backedge.loopexit ]
  %.04.be = phi %struct.code_ent* [ %304, %334 ], [ %.15, %475 ], [ %.15, %.backedge.loopexit ]
  %.02.be = phi %struct.code_ent* [ %340, %334 ], [ %346, %475 ], [ %346, %.backedge.loopexit ]
  %342 = icmp sgt i64 %.216.be, 0
  br i1 %342, label %269, label %.loopexit.loopexit363

; <label>:343:                                    ; preds = %292
  %344 = load %struct.code_ent*, %struct.code_ent** %267, align 8
  %345 = zext i32 %295 to i64
  %346 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %344, i64 %345
  %347 = icmp ule %struct.code_ent* %344, %.06117
  %348 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %344, i64 5119
  %349 = icmp ult %struct.code_ent* %.06117, %348
  %or.cond = and i1 %347, %349
  br i1 %or.cond, label %351, label %350

; <label>:350:                                    ; preds = %343
  tail call void @__assert_fail(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0), i32 573, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__PRETTY_FUNCTION__.LZWDecodeCompat, i64 0, i64 0)) #5
  unreachable

; <label>:351:                                    ; preds = %343
  %352 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06117, i64 0, i32 0
  store %struct.code_ent* %.02119, %struct.code_ent** %352, align 8
  %353 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.02119, i64 0, i32 3
  %354 = load i8, i8* %353, align 1
  %355 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06117, i64 0, i32 3
  store i8 %354, i8* %355, align 1
  %356 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.02119, i64 0, i32 1
  %357 = load i16, i16* %356, align 8
  %358 = add i16 %357, 1
  %359 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06117, i64 0, i32 1
  store i16 %358, i16* %359, align 8
  %360 = icmp ult %struct.code_ent* %346, %.06117
  %361 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %344, i64 %345, i32 3
  %.in.in = select i1 %360, i8* %361, i8* %355
  %.in = load i8, i8* %.in.in, align 1
  %362 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06117, i64 0, i32 2
  store i8 %.in, i8* %362, align 2
  %363 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.06117, i64 1
  %364 = icmp ugt %struct.code_ent* %363, %.04118
  %365 = add nsw i32 %.032113, 1
  %366 = icmp sgt i32 %.032113, 11
  %. = select i1 %366, i32 12, i32 %365
  %367 = zext i32 %. to i64
  %368 = shl i64 1, %367
  %369 = add nsw i64 %368, -1
  br i1 %364, label %370, label %373

; <label>:370:                                    ; preds = %351
  %371 = load %struct.code_ent*, %struct.code_ent** %267, align 8
  %372 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %371, i64 %369
  br label %373

; <label>:373:                                    ; preds = %370, %351
  %.149 = phi i64 [ %369, %370 ], [ %.048110, %351 ]
  %.234 = phi i32 [ %., %370 ], [ %.032113, %351 ]
  %.15 = phi %struct.code_ent* [ %372, %370 ], [ %.04118, %351 ]
  %374 = icmp ugt i32 %295, 255
  br i1 %374, label %375, label %475

; <label>:375:                                    ; preds = %373
  %376 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %344, i64 %345, i32 1
  %377 = load i16, i16* %376, align 8
  %378 = zext i16 %377 to i64
  %379 = icmp slt i64 %.216115, %378
  br i1 %379, label %380, label %466

; <label>:380:                                    ; preds = %375
  %381 = getelementptr inbounds %struct.LZWDecodeState, %struct.LZWDecodeState* %7, i64 0, i32 5
  store %struct.code_ent* %346, %struct.code_ent** %381, align 8
  br label %382

; <label>:382:                                    ; preds = %382, %380
  %.3 = phi %struct.code_ent* [ %346, %380 ], [ %384, %382 ]
  %383 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.3, i64 0, i32 0
  %384 = load %struct.code_ent*, %struct.code_ent** %383, align 8
  %385 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %384, i64 0, i32 1
  %386 = load i16, i16* %385, align 8
  %387 = zext i16 %386 to i64
  %388 = icmp sgt i64 %387, %.216115
  br i1 %388, label %382, label %389

; <label>:389:                                    ; preds = %382
  store i64 %.216115, i64* %12, align 8
  %390 = getelementptr inbounds i8, i8* %.112116, i64 %.216115
  %391 = add i64 %.216115, -1
  %xtraiter = and i64 %.216115, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %389
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %.222.prol = phi i8* [ %394, %.prol.preheader ], [ %390, %.prol.preheader.preheader ]
  %.317.prol = phi i64 [ %397, %.prol.preheader ], [ %.216115, %.prol.preheader.preheader ]
  %.4.prol = phi %struct.code_ent* [ %396, %.prol.preheader ], [ %384, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %392 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.4.prol, i64 0, i32 2
  %393 = load i8, i8* %392, align 2
  %394 = getelementptr inbounds i8, i8* %.222.prol, i64 -1
  store i8 %393, i8* %394, align 1
  %395 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.4.prol, i64 0, i32 0
  %396 = load %struct.code_ent*, %struct.code_ent** %395, align 8
  %397 = add nsw i64 %.317.prol, -1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %389
  %.222.unr = phi i8* [ %390, %389 ], [ %394, %.prol.loopexit.loopexit ]
  %.317.unr = phi i64 [ %.216115, %389 ], [ %397, %.prol.loopexit.loopexit ]
  %.4.unr = phi %struct.code_ent* [ %384, %389 ], [ %396, %.prol.loopexit.loopexit ]
  %398 = icmp ult i64 %391, 3
  br i1 %398, label %.loopexit, label %.new.preheader

.new.preheader:                                   ; preds = %.prol.loopexit
  %399 = add i64 %.317.unr, -4
  %400 = lshr i64 %399, 2
  %401 = and i64 %400, 1
  %lcmp.mod433 = icmp eq i64 %401, 0
  br i1 %lcmp.mod433, label %.new.prol.preheader, label %.new.prol.loopexit

.new.prol.preheader:                              ; preds = %.new.preheader
  br label %.new.prol

.new.prol:                                        ; preds = %.new.prol.preheader
  %402 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.4.unr, i64 0, i32 2
  %403 = load i8, i8* %402, align 2
  %404 = getelementptr inbounds i8, i8* %.222.unr, i64 -1
  store i8 %403, i8* %404, align 1
  %405 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.4.unr, i64 0, i32 0
  %406 = load %struct.code_ent*, %struct.code_ent** %405, align 8
  %407 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %406, i64 0, i32 2
  %408 = load i8, i8* %407, align 2
  %409 = getelementptr inbounds i8, i8* %.222.unr, i64 -2
  store i8 %408, i8* %409, align 1
  %410 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %406, i64 0, i32 0
  %411 = load %struct.code_ent*, %struct.code_ent** %410, align 8
  %412 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %411, i64 0, i32 2
  %413 = load i8, i8* %412, align 2
  %414 = getelementptr inbounds i8, i8* %.222.unr, i64 -3
  store i8 %413, i8* %414, align 1
  %415 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %411, i64 0, i32 0
  %416 = load %struct.code_ent*, %struct.code_ent** %415, align 8
  %417 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %416, i64 0, i32 2
  %418 = load i8, i8* %417, align 2
  %419 = getelementptr inbounds i8, i8* %.222.unr, i64 -4
  store i8 %418, i8* %419, align 1
  %420 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %416, i64 0, i32 0
  %421 = load %struct.code_ent*, %struct.code_ent** %420, align 8
  %422 = add nsw i64 %.317.unr, -4
  br label %.new.prol.loopexit

.new.prol.loopexit:                               ; preds = %.new.prol, %.new.preheader
  %.222.unr437 = phi i8* [ %.222.unr, %.new.preheader ], [ %419, %.new.prol ]
  %.317.unr438 = phi i64 [ %.317.unr, %.new.preheader ], [ %422, %.new.prol ]
  %.4.unr439 = phi %struct.code_ent* [ %.4.unr, %.new.preheader ], [ %421, %.new.prol ]
  %423 = icmp eq i64 %400, 0
  br i1 %423, label %.loopexit.loopexit, label %.new.preheader.new

.new.preheader.new:                               ; preds = %.new.prol.loopexit
  br label %.new

.new:                                             ; preds = %.new, %.new.preheader.new
  %.222 = phi i8* [ %.222.unr437, %.new.preheader.new ], [ %461, %.new ]
  %.317 = phi i64 [ %.317.unr438, %.new.preheader.new ], [ %464, %.new ]
  %.4 = phi %struct.code_ent* [ %.4.unr439, %.new.preheader.new ], [ %463, %.new ]
  %424 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.4, i64 0, i32 2
  %425 = load i8, i8* %424, align 2
  %426 = getelementptr inbounds i8, i8* %.222, i64 -1
  store i8 %425, i8* %426, align 1
  %427 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.4, i64 0, i32 0
  %428 = load %struct.code_ent*, %struct.code_ent** %427, align 8
  %429 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %428, i64 0, i32 2
  %430 = load i8, i8* %429, align 2
  %431 = getelementptr inbounds i8, i8* %.222, i64 -2
  store i8 %430, i8* %431, align 1
  %432 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %428, i64 0, i32 0
  %433 = load %struct.code_ent*, %struct.code_ent** %432, align 8
  %434 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %433, i64 0, i32 2
  %435 = load i8, i8* %434, align 2
  %436 = getelementptr inbounds i8, i8* %.222, i64 -3
  store i8 %435, i8* %436, align 1
  %437 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %433, i64 0, i32 0
  %438 = load %struct.code_ent*, %struct.code_ent** %437, align 8
  %439 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %438, i64 0, i32 2
  %440 = load i8, i8* %439, align 2
  %441 = getelementptr inbounds i8, i8* %.222, i64 -4
  store i8 %440, i8* %441, align 1
  %442 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %438, i64 0, i32 0
  %443 = load %struct.code_ent*, %struct.code_ent** %442, align 8
  %444 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %443, i64 0, i32 2
  %445 = load i8, i8* %444, align 2
  %446 = getelementptr inbounds i8, i8* %.222, i64 -5
  store i8 %445, i8* %446, align 1
  %447 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %443, i64 0, i32 0
  %448 = load %struct.code_ent*, %struct.code_ent** %447, align 8
  %449 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %448, i64 0, i32 2
  %450 = load i8, i8* %449, align 2
  %451 = getelementptr inbounds i8, i8* %.222, i64 -6
  store i8 %450, i8* %451, align 1
  %452 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %448, i64 0, i32 0
  %453 = load %struct.code_ent*, %struct.code_ent** %452, align 8
  %454 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %453, i64 0, i32 2
  %455 = load i8, i8* %454, align 2
  %456 = getelementptr inbounds i8, i8* %.222, i64 -7
  store i8 %455, i8* %456, align 1
  %457 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %453, i64 0, i32 0
  %458 = load %struct.code_ent*, %struct.code_ent** %457, align 8
  %459 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %458, i64 0, i32 2
  %460 = load i8, i8* %459, align 2
  %461 = getelementptr inbounds i8, i8* %.222, i64 -8
  store i8 %460, i8* %461, align 1
  %462 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %458, i64 0, i32 0
  %463 = load %struct.code_ent*, %struct.code_ent** %462, align 8
  %464 = add nsw i64 %.317, -8
  %465 = icmp eq i64 %464, 0
  br i1 %465, label %.loopexit.loopexit.unr-lcssa, label %.new

; <label>:466:                                    ; preds = %375
  %467 = getelementptr inbounds i8, i8* %.112116, i64 %378
  br label %468

; <label>:468:                                    ; preds = %468, %466
  %.323 = phi i8* [ %467, %466 ], [ %471, %468 ]
  %.5 = phi %struct.code_ent* [ %346, %466 ], [ %473, %468 ]
  %469 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.5, i64 0, i32 2
  %470 = load i8, i8* %469, align 2
  %471 = getelementptr inbounds i8, i8* %.323, i64 -1
  store i8 %470, i8* %471, align 1
  %472 = getelementptr inbounds %struct.code_ent, %struct.code_ent* %.5, i64 0, i32 0
  %473 = load %struct.code_ent*, %struct.code_ent** %472, align 8
  %474 = icmp eq %struct.code_ent* %473, null
  br i1 %474, label %.backedge.loopexit, label %468

; <label>:475:                                    ; preds = %373
  %476 = trunc i64 %293 to i8
  %477 = getelementptr inbounds i8, i8* %.112116, i64 1
  store i8 %476, i8* %.112116, align 1
  %478 = add nsw i64 %.216115, -1
  br label %.backedge

.loopexit.loopexit.unr-lcssa:                     ; preds = %.new
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.new.prol.loopexit, %.loopexit.loopexit.unr-lcssa
  br label %.loopexit

.loopexit.loopexit363:                            ; preds = %326, %292, %.backedge
  %.250.ph = phi i64 [ %.048.be, %.backedge ], [ %.048110, %292 ], [ 511, %326 ]
  %.547.ph = phi i64 [ %.042.be, %.backedge ], [ %297, %292 ], [ %329, %326 ]
  %.541.ph = phi i64 [ %.036.be, %.backedge ], [ %298, %292 ], [ %330, %326 ]
  %.335.ph = phi i32 [ %.032.be, %.backedge ], [ %.032113, %292 ], [ 9, %326 ]
  %.529.ph = phi i8* [ %.024.be, %.backedge ], [ %.125, %292 ], [ %.327, %326 ]
  %.519.ph = phi i64 [ %.216.be, %.backedge ], [ %.216115, %292 ], [ %.216115, %326 ]
  %.17.ph = phi %struct.code_ent* [ %.06.be, %.backedge ], [ %.06117, %292 ], [ %303, %326 ]
  %.2.ph = phi %struct.code_ent* [ %.04.be, %.backedge ], [ %.04118, %292 ], [ %304, %326 ]
  %.13.ph = phi %struct.code_ent* [ %.02.be, %.backedge ], [ %.02119, %292 ], [ %.02119, %326 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit363, %.loopexit.loopexit, %.prol.loopexit, %247, %.thread51, %.thread
  %.250 = phi i64 [ %.048110, %.thread ], [ 511, %.thread51 ], [ %258, %247 ], [ %.149, %.prol.loopexit ], [ %.149, %.loopexit.loopexit ], [ %.250.ph, %.loopexit.loopexit363 ]
  %.547 = phi i64 [ %.042111, %.thread ], [ %297, %.thread51 ], [ %254, %247 ], [ %297, %.prol.loopexit ], [ %297, %.loopexit.loopexit ], [ %.547.ph, %.loopexit.loopexit363 ]
  %.541 = phi i64 [ %.036112, %.thread ], [ %298, %.thread51 ], [ %256, %247 ], [ %298, %.prol.loopexit ], [ %298, %.loopexit.loopexit ], [ %.541.ph, %.loopexit.loopexit363 ]
  %.335 = phi i32 [ %.032113, %.thread ], [ 9, %.thread51 ], [ %252, %247 ], [ %.234, %.prol.loopexit ], [ %.234, %.loopexit.loopexit ], [ %.335.ph, %.loopexit.loopexit363 ]
  %.529 = phi i8* [ %.024114, %.thread ], [ %.125, %.thread51 ], [ %249, %247 ], [ %.125, %.prol.loopexit ], [ %.125, %.loopexit.loopexit ], [ %.529.ph, %.loopexit.loopexit363 ]
  %.519 = phi i64 [ %.216115, %.thread ], [ %.216115, %.thread51 ], [ %.115, %247 ], [ 0, %.prol.loopexit ], [ 0, %.loopexit.loopexit ], [ %.519.ph, %.loopexit.loopexit363 ]
  %.17 = phi %struct.code_ent* [ %.06117, %.thread ], [ %303, %.thread51 ], [ %262, %247 ], [ %363, %.prol.loopexit ], [ %363, %.loopexit.loopexit ], [ %.17.ph, %.loopexit.loopexit363 ]
  %.2 = phi %struct.code_ent* [ %.04118, %.thread ], [ %304, %.thread51 ], [ %264, %247 ], [ %.15, %.prol.loopexit ], [ %.15, %.loopexit.loopexit ], [ %.2.ph, %.loopexit.loopexit363 ]
  %.13 = phi %struct.code_ent* [ %.02119, %.thread ], [ %.02119, %.thread51 ], [ %260, %247 ], [ %346, %.prol.loopexit ], [ %346, %.loopexit.loopexit ], [ %.13.ph, %.loopexit.loopexit363 ]
  store i8* %.529, i8** %248, align 8
  %479 = trunc i32 %.335 to i16
  store i16 %479, i16* %250, align 8
  store i64 %.547, i64* %253, align 8
  store i64 %.541, i64* %255, align 8
  store i64 %.250, i64* %257, align 8
  store %struct.code_ent* %.13, %struct.code_ent** %259, align 8
  store %struct.code_ent* %.17, %struct.code_ent** %261, align 8
  store %struct.code_ent* %.2, %struct.code_ent** %263, align 8
  %480 = icmp sgt i64 %.519, 0
  br i1 %480, label %481, label %.loopexit55

; <label>:481:                                    ; preds = %.loopexit
  %482 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %483 = load i8*, i8** %482, align 8
  %484 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %485 = load i32, i32* %484, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %483, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.9, i64 0, i64 0), i32 %485, i64 %.519) #6
  br label %.loopexit55

.loopexit55.loopexit.unr-lcssa:                   ; preds = %.new208
  br label %.loopexit55.loopexit

.loopexit55.loopexit:                             ; preds = %.new208.prol.loopexit, %.loopexit55.loopexit.unr-lcssa
  br label %.loopexit55

.loopexit55:                                      ; preds = %.loopexit55.loopexit, %.prol.loopexit207, %.loopexit, %481
  %.0 = phi i32 [ 0, %481 ], [ 1, %.loopexit ], [ 1, %.prol.loopexit207 ], [ 1, %.loopexit55.loopexit ]
  ret i32 %.0
}

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @codeLoop(%struct.tiff* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %3 = load i8*, i8** %2, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %5 = load i32, i32* %4, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %3, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.11, i64 0, i64 0), i32 %5) #6
  ret void
}

declare void @_TIFFfree(i8*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
