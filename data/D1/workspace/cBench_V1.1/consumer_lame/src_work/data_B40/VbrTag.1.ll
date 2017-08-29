; ModuleID = 'VbrTag.ll'
source_filename = "VbrTag.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.VBRTAGDATA = type { i32, i32, i32, i32, i32, i32, [100 x i8] }
%struct.bit_stream_struc = type { i8*, i32, %struct._IO_FILE*, i8*, i32, i64, i32, i32 }

@SizeOfEmptyFrame = local_unnamed_addr global [2 x [2 x i32]] [[2 x i32] [i32 32, i32 17], [2 x i32] [i32 17, i32 9]], align 16
@pVbrFrames = local_unnamed_addr global i32* null, align 8
@nVbrNumFrames = local_unnamed_addr global i32 0, align 4
@nVbrFrameBufferSize = local_unnamed_addr global i32 0, align 4
@GetVbrTag.sr_table = internal unnamed_addr constant [4 x i32] [i32 44100, i32 48000, i32 32000, i32 99999], align 16
@pbtStreamBuffer = internal global [216 x i8] zeroinitializer, align 16
@nZeroStreamSize = internal unnamed_addr global i32 0, align 4
@InitVbrTag.framesize = internal unnamed_addr constant [3 x i32] [i32 208, i32 192, i32 288], align 4
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [34 x i8] c"illegal sampling frequency index\0A\00", align 1
@TotalFrameSize = internal unnamed_addr global i32 0, align 4
@.str.1 = private unnamed_addr constant [34 x i8] c"Xing VBR header problem...use -t\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"rb+\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"LAME%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @AddVbrFrame(i32) local_unnamed_addr #0 {
  %2 = load i32*, i32** @pVbrFrames, align 8
  %3 = icmp eq i32* %2, null
  %4 = load i32, i32* @nVbrFrameBufferSize, align 4
  %5 = icmp eq i32 %4, 0
  %or.cond = or i1 %3, %5
  br i1 %or.cond, label %6, label %8

; <label>:6:                                      ; preds = %1
  store i32 100, i32* @nVbrFrameBufferSize, align 4
  %7 = tail call noalias i8* @malloc(i64 400) #8
  store i8* %7, i8** bitcast (i32** @pVbrFrames to i8**), align 8
  br label %8

; <label>:8:                                      ; preds = %1, %6
  %9 = load i32, i32* @nVbrNumFrames, align 4
  %10 = load i32, i32* @nVbrFrameBufferSize, align 4
  %11 = icmp eq i32 %9, %10
  %12 = shl nsw i32 %10, 1
  br i1 %11, label %13, label %18

; <label>:13:                                     ; preds = %8
  %14 = sext i32 %12 to i64
  %15 = shl nsw i64 %14, 2
  store i32 %12, i32* @nVbrFrameBufferSize, align 4
  %16 = load i8*, i8** bitcast (i32** @pVbrFrames to i8**), align 8
  %17 = tail call i8* @realloc(i8* %16, i64 %15) #8
  store i8* %17, i8** bitcast (i32** @pVbrFrames to i8**), align 8
  br label %18

; <label>:18:                                     ; preds = %13, %8
  %19 = load i32*, i32** @pVbrFrames, align 8
  %20 = load i32, i32* @nVbrNumFrames, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* @nVbrNumFrames, align 4
  %22 = sext i32 %20 to i64
  %23 = getelementptr inbounds i32, i32* %19, i64 %22
  store i32 %0, i32* %23, align 4
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define void @CreateI4(i8* nocapture, i32) local_unnamed_addr #2 {
  %3 = lshr i32 %1, 24
  %4 = trunc i32 %3 to i8
  store i8 %4, i8* %0, align 1
  %5 = lshr i32 %1, 16
  %6 = trunc i32 %5 to i8
  %7 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 %6, i8* %7, align 1
  %8 = lshr i32 %1, 8
  %9 = trunc i32 %8 to i8
  %10 = getelementptr inbounds i8, i8* %0, i64 2
  store i8 %9, i8* %10, align 1
  %11 = trunc i32 %1 to i8
  %12 = getelementptr inbounds i8, i8* %0, i64 3
  store i8 %11, i8* %12, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @CheckVbrTag(i8* nocapture readonly) local_unnamed_addr #3 {
  %2 = getelementptr inbounds i8, i8* %0, i64 1
  %3 = load i8, i8* %2, align 1
  %4 = and i8 %3, 8
  %5 = getelementptr inbounds i8, i8* %0, i64 3
  %6 = load i8, i8* %5, align 1
  %7 = icmp eq i8 %4, 0
  %8 = icmp ugt i8 %6, -65
  %.sink2 = select i1 %8, i64 13, i64 21
  %.sink = select i1 %8, i64 21, i64 36
  %.sink2.sink = select i1 %7, i64 %.sink2, i64 %.sink
  %9 = getelementptr inbounds i8, i8* %0, i64 %.sink2.sink
  %10 = load i8, i8* %9, align 1
  %11 = icmp eq i8 %10, 88
  br i1 %11, label %12, label %24

; <label>:12:                                     ; preds = %1
  %13 = getelementptr inbounds i8, i8* %9, i64 1
  %14 = load i8, i8* %13, align 1
  %15 = icmp eq i8 %14, 105
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %12
  %17 = getelementptr inbounds i8, i8* %9, i64 2
  %18 = load i8, i8* %17, align 1
  %19 = icmp eq i8 %18, 110
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %16
  %21 = getelementptr inbounds i8, i8* %9, i64 3
  %22 = load i8, i8* %21, align 1
  %23 = icmp eq i8 %22, 103
  %. = zext i1 %23 to i32
  br label %24

; <label>:24:                                     ; preds = %20, %16, %12, %1
  %.0 = phi i32 [ 0, %1 ], [ 0, %12 ], [ 0, %16 ], [ %., %20 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @GetVbrTag(%struct.VBRTAGDATA* nocapture, i8* nocapture readonly) local_unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 2
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds i8, i8* %1, i64 1
  %5 = load i8, i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = lshr i32 %6, 3
  %8 = and i32 %7, 1
  %9 = getelementptr inbounds i8, i8* %1, i64 2
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i64
  %12 = lshr i64 %11, 2
  %13 = and i64 %12, 3
  %14 = getelementptr inbounds i8, i8* %1, i64 3
  %15 = load i8, i8* %14, align 1
  %16 = icmp eq i32 %8, 0
  %17 = icmp ugt i8 %15, -65
  %.sink3 = select i1 %17, i64 13, i64 21
  %.sink = select i1 %17, i64 21, i64 36
  %.sink3.sink = select i1 %16, i64 %.sink3, i64 %.sink
  %18 = getelementptr inbounds i8, i8* %1, i64 %.sink3.sink
  %19 = load i8, i8* %18, align 1
  %20 = icmp eq i8 %19, 88
  br i1 %20, label %21, label %81

; <label>:21:                                     ; preds = %2
  %22 = getelementptr inbounds i8, i8* %18, i64 1
  %23 = load i8, i8* %22, align 1
  %24 = icmp eq i8 %23, 105
  br i1 %24, label %25, label %81

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds i8, i8* %18, i64 2
  %27 = load i8, i8* %26, align 1
  %28 = icmp eq i8 %27, 110
  br i1 %28, label %29, label %81

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds i8, i8* %18, i64 3
  %31 = load i8, i8* %30, align 1
  %32 = icmp eq i8 %31, 103
  br i1 %32, label %33, label %81

; <label>:33:                                     ; preds = %29
  %34 = getelementptr inbounds i8, i8* %18, i64 4
  %35 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 0
  store i32 %8, i32* %35, align 4
  %36 = getelementptr inbounds [4 x i32], [4 x i32]* @GetVbrTag.sr_table, i64 0, i64 %13
  %37 = load i32, i32* %36, align 4
  %38 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 1
  %39 = xor i32 %8, 1
  %. = ashr i32 %37, %39
  store i32 %., i32* %38, align 4
  %40 = tail call fastcc i32 @ExtractI4(i8* %34)
  store i32 %40, i32* %3, align 4
  %41 = getelementptr inbounds i8, i8* %18, i64 8
  %42 = and i32 %40, 1
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %48, label %44

; <label>:44:                                     ; preds = %33
  %45 = tail call fastcc i32 @ExtractI4(i8* %41)
  %46 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 3
  store i32 %45, i32* %46, align 4
  %47 = getelementptr inbounds i8, i8* %18, i64 12
  br label %48

; <label>:48:                                     ; preds = %33, %44
  %.3 = phi i8* [ %47, %44 ], [ %41, %33 ]
  %49 = and i32 %40, 2
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %55, label %51

; <label>:51:                                     ; preds = %48
  %52 = tail call fastcc i32 @ExtractI4(i8* %.3)
  %53 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 4
  store i32 %52, i32* %53, align 4
  %54 = getelementptr inbounds i8, i8* %.3, i64 4
  br label %55

; <label>:55:                                     ; preds = %48, %51
  %.4 = phi i8* [ %54, %51 ], [ %.3, %48 ]
  %56 = and i32 %40, 4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %75, label %.preheader.preheader

.preheader.preheader:                             ; preds = %55
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.4, %.preheader ], [ 0, %.preheader.preheader ]
  %58 = getelementptr inbounds i8, i8* %.4, i64 %indvars.iv
  %59 = load i8, i8* %58, align 1
  %60 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 6, i64 %indvars.iv
  store i8 %59, i8* %60, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %61 = getelementptr inbounds i8, i8* %.4, i64 %indvars.iv.next
  %62 = load i8, i8* %61, align 1
  %63 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 6, i64 %indvars.iv.next
  store i8 %62, i8* %63, align 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %64 = getelementptr inbounds i8, i8* %.4, i64 %indvars.iv.next.1
  %65 = load i8, i8* %64, align 1
  %66 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 6, i64 %indvars.iv.next.1
  store i8 %65, i8* %66, align 1
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %67 = getelementptr inbounds i8, i8* %.4, i64 %indvars.iv.next.2
  %68 = load i8, i8* %67, align 1
  %69 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 6, i64 %indvars.iv.next.2
  store i8 %68, i8* %69, align 1
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %70 = getelementptr inbounds i8, i8* %.4, i64 %indvars.iv.next.3
  %71 = load i8, i8* %70, align 1
  %72 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 6, i64 %indvars.iv.next.3
  store i8 %71, i8* %72, align 1
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 100
  br i1 %exitcond.4, label %73, label %.preheader

; <label>:73:                                     ; preds = %.preheader
  %74 = getelementptr inbounds i8, i8* %.4, i64 100
  br label %75

; <label>:75:                                     ; preds = %55, %73
  %.5 = phi i8* [ %74, %73 ], [ %.4, %55 ]
  %76 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %0, i64 0, i32 5
  store i32 -1, i32* %76, align 4
  %77 = and i32 %40, 8
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %81, label %79

; <label>:79:                                     ; preds = %75
  %80 = tail call fastcc i32 @ExtractI4(i8* %.5)
  store i32 %80, i32* %76, align 4
  br label %81

; <label>:81:                                     ; preds = %79, %75, %29, %25, %21, %2
  %.0 = phi i32 [ 0, %2 ], [ 0, %21 ], [ 0, %25 ], [ 0, %29 ], [ 1, %75 ], [ 1, %79 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @ExtractI4(i8* nocapture readonly) unnamed_addr #3 {
  %2 = load i8, i8* %0, align 1
  %3 = zext i8 %2 to i32
  %4 = shl nuw nsw i32 %3, 8
  %5 = getelementptr inbounds i8, i8* %0, i64 1
  %6 = load i8, i8* %5, align 1
  %7 = zext i8 %6 to i32
  %8 = or i32 %4, %7
  %9 = shl nuw nsw i32 %8, 8
  %10 = getelementptr inbounds i8, i8* %0, i64 2
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i32
  %13 = or i32 %9, %12
  %14 = shl nuw i32 %13, 8
  %15 = getelementptr inbounds i8, i8* %0, i64 3
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = or i32 %14, %17
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define i32 @InitVbrTag(%struct.bit_stream_struc*, i32, i32, i32) local_unnamed_addr #0 {
  store i32* null, i32** @pVbrFrames, align 8
  store i32 0, i32* @nVbrNumFrames, align 4
  store i32 0, i32* @nVbrFrameBufferSize, align 4
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 0), i8 0, i64 216, i32 16, i1 false)
  %5 = icmp eq i32 %2, 3
  %6 = sext i32 %1 to i64
  %.sink = zext i1 %5 to i64
  %7 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @SizeOfEmptyFrame, i64 0, i64 %6, i64 %.sink
  %storemerge.in = load i32, i32* %7, align 4
  %storemerge = add nsw i32 %storemerge.in, 4
  store i32 %storemerge, i32* @nZeroStreamSize, align 4
  %8 = icmp sgt i32 %3, 2
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %10) #9
  tail call void @exit(i32 -1) #10
  unreachable

; <label>:12:                                     ; preds = %4
  %13 = sext i32 %3 to i64
  %14 = getelementptr inbounds [3 x i32], [3 x i32]* @InitVbrTag.framesize, i64 0, i64 %13
  %15 = load i32, i32* %14, align 4
  store i32 %15, i32* @TotalFrameSize, align 4
  %16 = load i32, i32* @nZeroStreamSize, align 4
  %17 = add nsw i32 %16, 140
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %21, label %.preheader

.preheader:                                       ; preds = %12
  %19 = load i32, i32* @TotalFrameSize, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

; <label>:21:                                     ; preds = %12
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %22) #9
  tail call void @exit(i32 -1) #10
  unreachable

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.11 = phi i32 [ %24, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  tail call void @putbits(%struct.bit_stream_struc* %0, i32 0, i32 8) #8
  %24 = add nuw nsw i32 %.11, 1
  %25 = load i32, i32* @TotalFrameSize, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

declare void @putbits(%struct.bit_stream_struc*, i32, i32) local_unnamed_addr #6

; Function Attrs: noinline nounwind uwtable
define i32 @PutVbrTag(i8* nocapture readonly, i32, i32) local_unnamed_addr #0 {
  %4 = alloca [100 x i8], align 16
  %5 = alloca [80 x i8], align 16
  %6 = load i32, i32* @nVbrNumFrames, align 4
  %7 = icmp eq i32 %6, 0
  %8 = load i32*, i32** @pVbrFrames, align 8
  %9 = icmp eq i32* %8, null
  %or.cond = or i1 %7, %9
  br i1 %or.cond, label %92, label %10

; <label>:10:                                     ; preds = %3
  %11 = tail call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0))
  %12 = icmp eq %struct._IO_FILE* %11, null
  br i1 %12, label %92, label %13

; <label>:13:                                     ; preds = %10
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 0), i8 0, i64 216, i32 16, i1 false)
  %14 = tail call i32 @fseek(%struct._IO_FILE* nonnull %11, i64 0, i32 2)
  %15 = tail call i64 @ftell(%struct._IO_FILE* nonnull %11)
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %92, label %17

; <label>:17:                                     ; preds = %13
  %18 = load i32, i32* @TotalFrameSize, align 4
  %19 = sext i32 %18 to i64
  %20 = tail call i32 @fseek(%struct._IO_FILE* nonnull %11, i64 %19, i32 0)
  %21 = tail call i64 @fread(i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* nonnull %11)
  store i8 -1, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 0), align 16
  %22 = icmp eq i32 %2, 0
  %.sink = select i1 %22, i8 -5, i8 -13
  %.sink4 = select i1 %22, i8 80, i8 -128
  store i8 %.sink, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 1), align 1
  %23 = load i8, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 2), align 2
  %24 = and i8 %23, 12
  %25 = or i8 %24, %.sink4
  store i8 %25, i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 2), align 2
  %26 = tail call i32 @fseek(%struct._IO_FILE* nonnull %11, i64 0, i32 0)
  %27 = getelementptr inbounds [100 x i8], [100 x i8]* %4, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* nonnull %27, i8 0, i64 100, i32 16, i1 false)
  %28 = load i32, i32* @nVbrNumFrames, align 4
  %29 = sitofp i32 %28 to double
  %30 = load i32*, i32** @pVbrFrames, align 8
  %31 = sitofp i64 %15 to float
  br label %32

; <label>:32:                                     ; preds = %32, %17
  %indvars.iv = phi i64 [ 1, %17 ], [ %indvars.iv.next, %32 ]
  %33 = trunc i64 %indvars.iv to i32
  %34 = sitofp i32 %33 to double
  %35 = fmul double %34, 1.000000e-02
  %36 = fmul double %35, %29
  %37 = tail call double @floor(double %36) #11
  %38 = fptosi double %37 to i32
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32* %30, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = sitofp i32 %41 to float
  %43 = fmul float %42, 2.560000e+02
  %44 = fdiv float %43, %31
  %45 = fcmp ogt float %44, 2.550000e+02
  %.01 = select i1 %45, float 2.550000e+02, float %44
  %46 = fptoui float %.01 to i8
  %47 = getelementptr inbounds [100 x i8], [100 x i8]* %4, i64 0, i64 %indvars.iv
  store i8 %46, i8* %47, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 100
  br i1 %exitcond, label %48, label %32

; <label>:48:                                     ; preds = %32
  %49 = load i32, i32* @nZeroStreamSize, align 4
  %50 = add nsw i32 %49, 1
  %51 = sext i32 %49 to i64
  %52 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %51
  store i8 88, i8* %52, align 1
  %53 = add nsw i32 %49, 2
  %54 = sext i32 %50 to i64
  %55 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %54
  store i8 105, i8* %55, align 1
  %56 = add nsw i32 %49, 3
  %57 = sext i32 %53 to i64
  %58 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %57
  store i8 110, i8* %58, align 1
  %59 = add nsw i32 %49, 4
  %60 = sext i32 %56 to i64
  %61 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %60
  store i8 103, i8* %61, align 1
  %62 = sext i32 %59 to i64
  %63 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %62
  tail call void @CreateI4(i8* %63, i32 15)
  %64 = add nsw i32 %49, 8
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %65
  %67 = load i32, i32* @nVbrNumFrames, align 4
  tail call void @CreateI4(i8* %66, i32 %67)
  %68 = add nsw i32 %49, 12
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %69
  %71 = trunc i64 %15 to i32
  tail call void @CreateI4(i8* %70, i32 %71)
  %72 = add nsw i32 %49, 16
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %74, i8* nonnull %27, i64 100, i32 1, i1 false)
  %75 = add i32 %49, 116
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %76
  tail call void @CreateI4(i8* %77, i32 %1)
  %78 = add i32 %49, 120
  %79 = getelementptr inbounds [80 x i8], [80 x i8]* %5, i64 0, i64 0
  %80 = tail call i8* @get_lame_version() #8
  %81 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %79, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i8* %80) #8
  %82 = sext i32 %78 to i64
  %83 = getelementptr inbounds [216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 %82
  %84 = call i8* @strncpy(i8* %83, i8* nonnull %79, i64 20) #8
  %85 = load i32, i32* @TotalFrameSize, align 4
  %86 = sext i32 %85 to i64
  %87 = tail call i64 @fwrite(i8* getelementptr inbounds ([216 x i8], [216 x i8]* @pbtStreamBuffer, i64 0, i64 0), i64 %86, i64 1, %struct._IO_FILE* nonnull %11)
  %88 = icmp eq i64 %87, 1
  br i1 %88, label %89, label %92

; <label>:89:                                     ; preds = %48
  %90 = tail call i32 @fclose(%struct._IO_FILE* nonnull %11)
  %91 = load i8*, i8** bitcast (i32** @pVbrFrames to i8**), align 8
  tail call void @free(i8* %91) #8
  store i32* null, i32** @pVbrFrames, align 8
  br label %92

; <label>:92:                                     ; preds = %48, %13, %10, %3, %89
  %.0 = phi i32 [ 0, %89 ], [ -1, %3 ], [ -1, %10 ], [ -1, %13 ], [ -1, %48 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fseek(%struct._IO_FILE* nocapture, i64, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @ftell(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare double @floor(double) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

declare i8* @get_lame_version() local_unnamed_addr #6

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @SeekPoint(i8* nocapture readonly, i32, float) local_unnamed_addr #3 {
  %4 = fcmp olt float %2, 0.000000e+00
  %.02 = select i1 %4, float 0.000000e+00, float %2
  %5 = fcmp ogt float %.02, 1.000000e+02
  %.1 = select i1 %5, float 1.000000e+02, float %.02
  %6 = fptosi float %.1 to i32
  %7 = icmp slt i32 %6, 99
  %. = select i1 %7, i32 %6, i32 99
  %8 = sext i32 %. to i64
  %9 = getelementptr inbounds i8, i8* %0, i64 %8
  %10 = load i8, i8* %9, align 1
  %11 = uitofp i8 %10 to float
  br i1 %7, label %12, label %18

; <label>:12:                                     ; preds = %3
  %13 = add nsw i32 %., 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %0, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = uitofp i8 %16 to float
  br label %18

; <label>:18:                                     ; preds = %3, %12
  %.0 = phi float [ %17, %12 ], [ 2.560000e+02, %3 ]
  %19 = fsub float %.0, %11
  %20 = sitofp i32 %. to float
  %21 = fsub float %.1, %20
  %22 = fmul float %21, %19
  %23 = fadd float %11, %22
  %24 = fmul float %23, 3.906250e-03
  %25 = sitofp i32 %1 to float
  %26 = fmul float %25, %24
  %27 = fptosi float %26 to i32
  ret i32 %27
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
