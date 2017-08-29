; ModuleID = 'compress.ll'
source_filename = "compress.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.EState = type { %struct.bz_stream*, i32, i32, i32, i32*, i32*, i32*, i32, i32*, i8*, i16*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8], [256 x i8], i32, i32, i32, i32, i32, i32, i32, i32, [258 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [258 x [4 x i32]] }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [62 x i8] c"    block %d: crc = 0x%08x, combined CRC = 0x%08x, size = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"    final combined CRC = 0x%08x\0A   \00", align 1
@.str.2 = private unnamed_addr constant [64 x i8] c"      %d in block, %d after MTF & 1-2 coding, %d+2 syms in use\0A\00", align 1
@.str.3 = private unnamed_addr constant [59 x i8] c"      initial group %d, [%d .. %d], has %d syms (%4.1f%%)\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"      pass %d: size is %d, grp uses are \00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.7 = private unnamed_addr constant [26 x i8] c"      bytes: mapping %d, \00", align 1
@.str.8 = private unnamed_addr constant [15 x i8] c"selectors %d, \00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"code lengths %d, \00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"codes %d\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @BZ2_bsInitWrite(%struct.EState* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 25
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 24
  store i32 0, i32* %3, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @BZ2_compressBlock(%struct.EState*, i8 zeroext) local_unnamed_addr #1 {
  %3 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %4 = load i32, i32* %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %33

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 26
  %8 = load i32, i32* %7, align 8
  %9 = xor i32 %8, -1
  store i32 %9, i32* %7, align 8
  %10 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 27
  %11 = load i32, i32* %10, align 4
  %12 = shl i32 %11, 1
  %13 = lshr i32 %11, 31
  %14 = or i32 %12, %13
  %15 = xor i32 %14, %9
  store i32 %15, i32* %10, align 4
  %16 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 29
  %17 = load i32, i32* %16, align 4
  %18 = icmp sgt i32 %17, 1
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %6
  %20 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 19
  store i32 0, i32* %20, align 4
  br label %21

; <label>:21:                                     ; preds = %19, %6
  %22 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 28
  %23 = load i32, i32* %22, align 8
  %24 = icmp sgt i32 %23, 1
  br i1 %24, label %25, label %32

; <label>:25:                                     ; preds = %21
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = load i32, i32* %16, align 4
  %28 = load i32, i32* %7, align 8
  %29 = load i32, i32* %10, align 4
  %30 = load i32, i32* %3, align 4
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str, i64 0, i64 0), i32 %27, i32 %28, i32 %29, i32 %30) #6
  br label %32

; <label>:32:                                     ; preds = %25, %21
  tail call void @BZ2_blockSort(%struct.EState* nonnull %0) #4
  br label %33

; <label>:33:                                     ; preds = %32, %2
  %34 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 5
  %35 = bitcast i32** %34 to i8**
  %36 = load i8*, i8** %35, align 8
  %37 = load i32, i32* %3, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %36, i64 %38
  %40 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 11
  store i8* %39, i8** %40, align 8
  %41 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 29
  %42 = load i32, i32* %41, align 4
  %43 = icmp eq i32 %42, 1
  br i1 %43, label %44, label %49

; <label>:44:                                     ; preds = %33
  tail call void @BZ2_bsInitWrite(%struct.EState* nonnull %0)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 66)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 90)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 104)
  %45 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 30
  %46 = load i32, i32* %45, align 8
  %47 = add nsw i32 %46, 48
  %48 = trunc i32 %47 to i8
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext %48)
  br label %49

; <label>:49:                                     ; preds = %44, %33
  %50 = load i32, i32* %3, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %57

; <label>:52:                                     ; preds = %49
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 49)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 65)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 89)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 38)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 83)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 89)
  %53 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 26
  %54 = load i32, i32* %53, align 8
  tail call fastcc void @bsPutUInt32(%struct.EState* nonnull %0, i32 %54)
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 1, i32 0)
  %55 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 7
  %56 = load i32, i32* %55, align 8
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 24, i32 %56)
  tail call fastcc void @generateMTFValues(%struct.EState* nonnull %0)
  tail call fastcc void @sendMTFValues(%struct.EState* nonnull %0)
  br label %57

; <label>:57:                                     ; preds = %52, %49
  %58 = icmp eq i8 %1, 0
  br i1 %58, label %70, label %59

; <label>:59:                                     ; preds = %57
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 23)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 114)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 69)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 56)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext 80)
  tail call fastcc void @bsPutUChar(%struct.EState* nonnull %0, i8 zeroext -112)
  %60 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 27
  %61 = load i32, i32* %60, align 4
  tail call fastcc void @bsPutUInt32(%struct.EState* nonnull %0, i32 %61)
  %62 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 28
  %63 = load i32, i32* %62, align 8
  %64 = icmp sgt i32 %63, 1
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %59
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %67 = load i32, i32* %60, align 4
  %68 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %66, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0), i32 %67) #6
  br label %69

; <label>:69:                                     ; preds = %65, %59
  tail call fastcc void @bsFinishWrite(%struct.EState* nonnull %0)
  br label %70

; <label>:70:                                     ; preds = %57, %69
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @BZ2_blockSort(%struct.EState*) local_unnamed_addr #3

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @bsPutUChar(%struct.EState* nocapture, i8 zeroext) unnamed_addr #0 {
  %3 = zext i8 %1 to i32
  tail call fastcc void @bsW(%struct.EState* %0, i32 8, i32 %3)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @bsPutUInt32(%struct.EState* nocapture, i32) unnamed_addr #0 {
  %3 = lshr i32 %1, 24
  tail call fastcc void @bsW(%struct.EState* %0, i32 8, i32 %3)
  %4 = lshr i32 %1, 16
  %5 = and i32 %4, 255
  tail call fastcc void @bsW(%struct.EState* %0, i32 8, i32 %5)
  %6 = lshr i32 %1, 8
  %7 = and i32 %6, 255
  tail call fastcc void @bsW(%struct.EState* %0, i32 8, i32 %7)
  %8 = and i32 %1, 255
  tail call fastcc void @bsW(%struct.EState* %0, i32 8, i32 %8)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @bsW(%struct.EState* nocapture, i32, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 25
  %5 = load i32, i32* %4, align 4
  %6 = icmp sgt i32 %5, 7
  br i1 %6, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 24
  %8 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 11
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 19
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %10
  %11 = load i32, i32* %7, align 8
  %12 = lshr i32 %11, 24
  %13 = trunc i32 %12 to i8
  %14 = load i8*, i8** %8, align 8
  %15 = load i32, i32* %9, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %14, i64 %16
  store i8 %13, i8* %17, align 1
  %18 = load i32, i32* %9, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %9, align 4
  %20 = load i32, i32* %7, align 8
  %21 = shl i32 %20, 8
  store i32 %21, i32* %7, align 8
  %22 = load i32, i32* %4, align 4
  %23 = add nsw i32 %22, -8
  store i32 %23, i32* %4, align 4
  %24 = icmp sgt i32 %23, 7
  br i1 %24, label %10, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %.lcssa = phi i32 [ %5, %3 ], [ %23, %._crit_edge.loopexit ]
  %25 = sub i32 32, %1
  %26 = sub i32 %25, %.lcssa
  %27 = shl i32 %2, %26
  %28 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 24
  %29 = load i32, i32* %28, align 8
  %30 = or i32 %29, %27
  store i32 %30, i32* %28, align 8
  %31 = load i32, i32* %4, align 4
  %32 = add nsw i32 %31, %1
  store i32 %32, i32* %4, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @generateMTFValues(%struct.EState* nocapture) unnamed_addr #0 {
  %2 = alloca [256 x i8], align 16
  %3 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 8
  %4 = load i32*, i32** %3, align 8
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 9
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 10
  %8 = load i16*, i16** %7, align 8
  tail call fastcc void @makeMaps_e(%struct.EState* %0)
  %9 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 21
  %10 = load i32, i32* %9, align 4
  %11 = add nsw i32 %10, 1
  %12 = icmp slt i32 %10, -1
  br i1 %12, label %.preheader, label %.preheader13

.preheader13:                                     ; preds = %1
  %scevgep = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 0
  %scevgep38 = bitcast i32* %scevgep to i8*
  %13 = add i32 %10, 1
  %14 = zext i32 %13 to i64
  %15 = shl nuw nsw i64 %14, 2
  %16 = add nuw nsw i64 %15, 4
  call void @llvm.memset.p0i8.i64(i8* %scevgep38, i8 0, i64 %16, i32 4, i1 false)
  %.pr = load i32, i32* %9, align 4
  %17 = icmp sgt i32 %.pr, 0
  br i1 %17, label %.lr.ph25, label %.preheader

.lr.ph25:                                         ; preds = %.preheader13
  %18 = load i32, i32* %9, align 4
  %19 = sext i32 %18 to i64
  %20 = icmp sgt i64 %19, 1
  %smax = select i1 %20, i64 %19, i64 1
  %min.iters.check = icmp ult i64 %smax, 32
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph25
  %indvars.iv34.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph25 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.lr.ph25
  %n.vec = and i64 %smax, 9223372036854775776
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %21 = add nsw i64 %n.vec, -32
  %22 = lshr exact i64 %21, 5
  %23 = add nuw nsw i64 %22, 1
  %xtraiter = and i64 %23, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %vec.ind42.prol = phi <16 x i8> [ %vec.ind.next45.prol, %vector.body.prol ], [ <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %step.add43.prol = add <16 x i8> %vec.ind42.prol, <i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16>
  %24 = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 %index.prol
  %25 = bitcast i8* %24 to <16 x i8>*
  store <16 x i8> %vec.ind42.prol, <16 x i8>* %25, align 16
  %26 = getelementptr i8, i8* %24, i64 16
  %27 = bitcast i8* %26 to <16 x i8>*
  store <16 x i8> %step.add43.prol, <16 x i8>* %27, align 16
  %index.next.prol = add i64 %index.prol, 32
  %vec.ind.next45.prol = add <16 x i8> %vec.ind42.prol, <i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32>
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %vec.ind42.unr = phi <16 x i8> [ <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, %vector.body.preheader ], [ %vec.ind.next45.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %28 = icmp ult i64 %21, 96
  br i1 %28, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %vec.ind42 = phi <16 x i8> [ %vec.ind42.unr, %vector.body.preheader.new ], [ %vec.ind.next45.3, %vector.body ]
  %step.add43 = add <16 x i8> %vec.ind42, <i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16>
  %29 = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 %index
  %30 = bitcast i8* %29 to <16 x i8>*
  store <16 x i8> %vec.ind42, <16 x i8>* %30, align 16
  %31 = getelementptr i8, i8* %29, i64 16
  %32 = bitcast i8* %31 to <16 x i8>*
  store <16 x i8> %step.add43, <16 x i8>* %32, align 16
  %index.next = add i64 %index, 32
  %vec.ind.next45 = add <16 x i8> %vec.ind42, <i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32, i8 32>
  %step.add43.1 = add <16 x i8> %vec.ind42, <i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48, i8 48>
  %33 = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 %index.next
  %34 = bitcast i8* %33 to <16 x i8>*
  store <16 x i8> %vec.ind.next45, <16 x i8>* %34, align 16
  %35 = getelementptr i8, i8* %33, i64 16
  %36 = bitcast i8* %35 to <16 x i8>*
  store <16 x i8> %step.add43.1, <16 x i8>* %36, align 16
  %index.next.1 = add i64 %index, 64
  %vec.ind.next45.1 = add <16 x i8> %vec.ind42, <i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64, i8 64>
  %step.add43.2 = add <16 x i8> %vec.ind42, <i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80, i8 80>
  %37 = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 %index.next.1
  %38 = bitcast i8* %37 to <16 x i8>*
  store <16 x i8> %vec.ind.next45.1, <16 x i8>* %38, align 16
  %39 = getelementptr i8, i8* %37, i64 16
  %40 = bitcast i8* %39 to <16 x i8>*
  store <16 x i8> %step.add43.2, <16 x i8>* %40, align 16
  %index.next.2 = add i64 %index, 96
  %vec.ind.next45.2 = add <16 x i8> %vec.ind42, <i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96, i8 96>
  %step.add43.3 = add <16 x i8> %vec.ind42, <i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112, i8 112>
  %41 = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 %index.next.2
  %42 = bitcast i8* %41 to <16 x i8>*
  store <16 x i8> %vec.ind.next45.2, <16 x i8>* %42, align 16
  %43 = getelementptr i8, i8* %41, i64 16
  %44 = bitcast i8* %43 to <16 x i8>*
  store <16 x i8> %step.add43.3, <16 x i8>* %44, align 16
  %index.next.3 = add i64 %index, 128
  %vec.ind.next45.3 = xor <16 x i8> %vec.ind42, <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>
  %45 = icmp eq i64 %index.next.3, %n.vec
  br i1 %45, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %.preheader, label %scalar.ph.preheader

.preheader.loopexit:                              ; preds = %scalar.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %middle.block, %1, %.preheader13
  %46 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %47 = load i32, i32* %46, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %.lr.ph20, label %.loopexit

.lr.ph20:                                         ; preds = %.preheader
  %49 = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 0
  %50 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 0
  %51 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 1
  %52 = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 1
  %53 = ptrtoint [256 x i8]* %2 to i64
  br label %57

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %scalar.ph ], [ %indvars.iv34.ph, %scalar.ph.preheader ]
  %54 = trunc i64 %indvars.iv34 to i8
  %55 = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 %indvars.iv34
  store i8 %54, i8* %55, align 1
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %56 = icmp slt i64 %indvars.iv.next35, %19
  br i1 %56, label %scalar.ph, label %.preheader.loopexit, !llvm.loop !6

; <label>:57:                                     ; preds = %.lr.ph20, %113
  %indvars.iv32 = phi i64 [ 0, %.lr.ph20 ], [ %indvars.iv.next33, %113 ]
  %58 = phi i32 [ %47, %.lr.ph20 ], [ %114, %113 ]
  %.0318 = phi i32 [ 0, %.lr.ph20 ], [ %.3, %113 ]
  %.0617 = phi i32 [ 0, %.lr.ph20 ], [ %.410, %113 ]
  %59 = getelementptr inbounds i32, i32* %4, i64 %indvars.iv32
  %60 = load i32, i32* %59, align 4
  %61 = add i32 %60, -1
  %62 = icmp slt i32 %61, 0
  %63 = select i1 %62, i32 %58, i32 0
  %. = add nsw i32 %63, %61
  %64 = sext i32 %. to i64
  %65 = getelementptr inbounds i8, i8* %6, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i64
  %68 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 23, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = load i8, i8* %49, align 16
  %71 = icmp eq i8 %70, %69
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %57
  %73 = add nsw i32 %.0318, 1
  br label %113

; <label>:74:                                     ; preds = %57
  %75 = icmp sgt i32 %.0318, 0
  br i1 %75, label %76, label %.loopexit12

; <label>:76:                                     ; preds = %74
  %77 = add nsw i32 %.0318, -1
  %78 = sext i32 %.0617 to i64
  br label %79

; <label>:79:                                     ; preds = %91, %76
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %91 ], [ %78, %76 ]
  %.14 = phi i32 [ %93, %91 ], [ %77, %76 ]
  %80 = and i32 %.14, 1
  %81 = icmp eq i32 %80, 0
  %82 = getelementptr inbounds i16, i16* %8, i64 %indvars.iv30
  br i1 %81, label %86, label %83

; <label>:83:                                     ; preds = %79
  store i16 1, i16* %82, align 2
  %84 = load i32, i32* %51, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %51, align 4
  br label %89

; <label>:86:                                     ; preds = %79
  store i16 0, i16* %82, align 2
  %87 = load i32, i32* %50, align 8
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %50, align 8
  br label %89

; <label>:89:                                     ; preds = %86, %83
  %indvars.iv.next31 = add i64 %indvars.iv30, 1
  %90 = icmp slt i32 %.14, 2
  br i1 %90, label %.loopexit12.loopexit, label %91

; <label>:91:                                     ; preds = %89
  %92 = add nsw i32 %.14, -2
  %93 = sdiv i32 %92, 2
  br label %79

.loopexit12.loopexit:                             ; preds = %89
  %94 = trunc i64 %indvars.iv.next31 to i32
  br label %.loopexit12

.loopexit12:                                      ; preds = %.loopexit12.loopexit, %74
  %.39 = phi i32 [ %.0617, %74 ], [ %94, %.loopexit12.loopexit ]
  %.25 = phi i32 [ %.0318, %74 ], [ 0, %.loopexit12.loopexit ]
  %95 = load i8, i8* %52, align 1
  %96 = load i8, i8* %49, align 16
  store i8 %96, i8* %52, align 1
  %97 = icmp eq i8 %69, %95
  br i1 %97, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.loopexit12
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.015 = phi i8* [ %98, %.lr.ph ], [ %52, %.lr.ph.preheader ]
  %.01114 = phi i8 [ %99, %.lr.ph ], [ %95, %.lr.ph.preheader ]
  %98 = getelementptr inbounds i8, i8* %.015, i64 1
  %99 = load i8, i8* %98, align 1
  store i8 %.01114, i8* %98, align 1
  %100 = icmp eq i8 %69, %99
  br i1 %100, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.loopexit12
  %.011.lcssa = phi i8 [ %95, %.loopexit12 ], [ %99, %._crit_edge.loopexit ]
  %.0.lcssa = phi i8* [ %52, %.loopexit12 ], [ %98, %._crit_edge.loopexit ]
  store i8 %.011.lcssa, i8* %49, align 16
  %101 = ptrtoint i8* %.0.lcssa to i64
  %102 = sub i64 %101, %53
  %103 = trunc i64 %102 to i16
  %104 = add i16 %103, 1
  %105 = sext i32 %.39 to i64
  %106 = getelementptr inbounds i16, i16* %8, i64 %105
  store i16 %104, i16* %106, align 2
  %107 = add nsw i32 %.39, 1
  %108 = shl i64 %102, 32
  %sext = add i64 %108, 4294967296
  %109 = ashr exact i64 %sext, 32
  %110 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 %109
  %111 = load i32, i32* %110, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %110, align 4
  br label %113

; <label>:113:                                    ; preds = %72, %._crit_edge
  %.410 = phi i32 [ %.0617, %72 ], [ %107, %._crit_edge ]
  %.3 = phi i32 [ %73, %72 ], [ %.25, %._crit_edge ]
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %114 = load i32, i32* %46, align 4
  %115 = sext i32 %114 to i64
  %116 = icmp slt i64 %indvars.iv.next33, %115
  br i1 %116, label %57, label %._crit_edge21

._crit_edge21:                                    ; preds = %113
  %117 = icmp sgt i32 %.3, 0
  br i1 %117, label %118, label %.loopexit

; <label>:118:                                    ; preds = %._crit_edge21
  %119 = add nsw i32 %.3, -1
  %120 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 0
  %121 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 1
  %122 = sext i32 %.410 to i64
  br label %123

; <label>:123:                                    ; preds = %135, %118
  %indvars.iv = phi i64 [ %indvars.iv.next, %135 ], [ %122, %118 ]
  %.4 = phi i32 [ %137, %135 ], [ %119, %118 ]
  %124 = and i32 %.4, 1
  %125 = icmp eq i32 %124, 0
  %126 = getelementptr inbounds i16, i16* %8, i64 %indvars.iv
  br i1 %125, label %130, label %127

; <label>:127:                                    ; preds = %123
  store i16 1, i16* %126, align 2
  %128 = load i32, i32* %121, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %121, align 4
  br label %133

; <label>:130:                                    ; preds = %123
  store i16 0, i16* %126, align 2
  %131 = load i32, i32* %120, align 8
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %120, align 8
  br label %133

; <label>:133:                                    ; preds = %130, %127
  %indvars.iv.next = add i64 %indvars.iv, 1
  %134 = icmp slt i32 %.4, 2
  br i1 %134, label %.loopexit.loopexit, label %135

; <label>:135:                                    ; preds = %133
  %136 = add nsw i32 %.4, -2
  %137 = sdiv i32 %136, 2
  br label %123

.loopexit.loopexit:                               ; preds = %133
  %138 = trunc i64 %indvars.iv.next to i32
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader, %.loopexit.loopexit, %._crit_edge21
  %.7 = phi i32 [ %.410, %._crit_edge21 ], [ %138, %.loopexit.loopexit ], [ 0, %.preheader ]
  %139 = trunc i32 %11 to i16
  %140 = sext i32 %.7 to i64
  %141 = getelementptr inbounds i16, i16* %8, i64 %140
  store i16 %139, i16* %141, align 2
  %142 = add nsw i32 %.7, 1
  %143 = sext i32 %11 to i64
  %144 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 %143
  %145 = load i32, i32* %144, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %144, align 4
  %147 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 31
  store i32 %142, i32* %147, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @sendMTFValues(%struct.EState*) unnamed_addr #1 {
  %2 = alloca [6 x i16], align 2
  %3 = bitcast [6 x i16]* %2 to i8*
  %4 = alloca [6 x i32], align 16
  %5 = bitcast [6 x i32]* %4 to i8*
  %6 = alloca [6 x i8], align 1
  %7 = alloca [16 x i8], align 16
  %8 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 10
  %9 = load i16*, i16** %8, align 8
  %10 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 28
  %11 = load i32, i32* %10, align 8
  %12 = icmp sgt i32 %11, 2
  br i1 %12, label %13, label %22

; <label>:13:                                     ; preds = %1
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 17
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 31
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 21
  %20 = load i32, i32* %19, align 4
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.2, i64 0, i64 0), i32 %16, i32 %18, i32 %20) #6
  br label %22

; <label>:22:                                     ; preds = %13, %1
  %23 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 21
  %24 = load i32, i32* %23, align 4
  %25 = add nsw i32 %24, 2
  %26 = icmp sgt i32 %24, -2
  br i1 %26, label %._crit_edge180.us.5, label %.us-lcssa183.us

.us-lcssa183.us:                                  ; preds = %22, %._crit_edge180.us.5
  %27 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 31
  %28 = load i32, i32* %27, align 4
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %31, label %30

; <label>:30:                                     ; preds = %.us-lcssa183.us
  tail call void @BZ2_bz__AssertH__fail(i32 3001) #4
  %.pr = load i32, i32* %27, align 4
  br label %31

; <label>:31:                                     ; preds = %30, %.us-lcssa183.us
  %32 = phi i32 [ %.pr, %30 ], [ %28, %.us-lcssa183.us ]
  %33 = icmp slt i32 %32, 200
  br i1 %33, label %39, label %34

; <label>:34:                                     ; preds = %31
  %35 = icmp slt i32 %32, 600
  br i1 %35, label %39, label %36

; <label>:36:                                     ; preds = %34
  %37 = icmp slt i32 %32, 1200
  %38 = icmp slt i32 %32, 2400
  %. = select i1 %38, i32 5, i32 6
  %.. = select i1 %37, i32 4, i32 %.
  br label %39

; <label>:39:                                     ; preds = %36, %34, %31
  %.346 = phi i32 [ 2, %31 ], [ 3, %34 ], [ %.., %36 ]
  %40 = load i32, i32* %27, align 4
  %41 = icmp sgt i32 %24, -2
  %42 = sext i32 %24 to i64
  br i1 %41, label %.split177.us.preheader, label %.split177.preheader

.split177.preheader:                              ; preds = %39
  br label %.split177

.split177.us.preheader:                           ; preds = %39
  %43 = sext i32 %25 to i64
  %44 = sext i32 %.346 to i64
  %45 = zext i32 %.346 to i64
  br label %.split177.us

.split177.us:                                     ; preds = %.split177.us.preheader, %._crit_edge173.us
  %indvars.iv272 = phi i64 [ %44, %.split177.us.preheader ], [ %indvars.iv.next273, %._crit_edge173.us ]
  %.022176.us = phi i32 [ 0, %.split177.us.preheader ], [ %95, %._crit_edge173.us ]
  %.050174.us = phi i32 [ %40, %.split177.us.preheader ], [ %96, %._crit_edge173.us ]
  %46 = trunc i64 %indvars.iv272 to i32
  %47 = sdiv i32 %.050174.us, %46
  %48 = add nsw i32 %.022176.us, -1
  %49 = icmp sgt i32 %47, 0
  %50 = icmp sle i32 %48, %24
  %.51163.us = and i1 %49, %50
  br i1 %.51163.us, label %.lr.ph167.us.preheader, label %._crit_edge168.us

.lr.ph167.us.preheader:                           ; preds = %.split177.us
  %51 = sext i32 %48 to i64
  br label %.lr.ph167.us

._crit_edge168.us.loopexit:                       ; preds = %.lr.ph167.us
  %52 = trunc i64 %indvars.iv.next269 to i32
  br label %._crit_edge168.us

._crit_edge168.us:                                ; preds = %._crit_edge168.us.loopexit, %.split177.us
  %.047.lcssa.us = phi i32 [ 0, %.split177.us ], [ %90, %._crit_edge168.us.loopexit ]
  %.025.lcssa.us = phi i32 [ %48, %.split177.us ], [ %52, %._crit_edge168.us.loopexit ]
  %53 = icmp sle i32 %.025.lcssa.us, %.022176.us
  %54 = trunc i64 %indvars.iv272 to i32
  %55 = icmp eq i32 %.346, %54
  %or.cond.us = or i1 %55, %53
  %56 = trunc i64 %indvars.iv272 to i32
  %57 = icmp eq i32 %56, 1
  %or.cond52.us = or i1 %57, %or.cond.us
  br i1 %or.cond52.us, label %69, label %58

; <label>:58:                                     ; preds = %._crit_edge168.us
  %59 = sub i64 %45, %indvars.iv272
  %60 = trunc i64 %59 to i32
  %61 = srem i32 %60, 2
  %62 = icmp eq i32 %61, 1
  br i1 %62, label %63, label %69

; <label>:63:                                     ; preds = %58
  %64 = add nsw i32 %.025.lcssa.us, -1
  %65 = sext i32 %.025.lcssa.us to i64
  %66 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 %65
  %67 = load i32, i32* %66, align 4
  %68 = sub nsw i32 %.047.lcssa.us, %67
  br label %69

; <label>:69:                                     ; preds = %63, %58, %._crit_edge168.us
  %.148.us = phi i32 [ %68, %63 ], [ %.047.lcssa.us, %58 ], [ %.047.lcssa.us, %._crit_edge168.us ]
  %.126.us = phi i32 [ %64, %63 ], [ %.025.lcssa.us, %58 ], [ %.025.lcssa.us, %._crit_edge168.us ]
  %70 = load i32, i32* %10, align 8
  %71 = icmp sgt i32 %70, 2
  br i1 %71, label %72, label %.lr.ph172.us

; <label>:72:                                     ; preds = %69
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %74 = sitofp i32 %.148.us to float
  %75 = fpext float %74 to double
  %76 = fmul double %75, 1.000000e+02
  %77 = load i32, i32* %27, align 4
  %78 = sitofp i32 %77 to float
  %79 = fpext float %78 to double
  %80 = fdiv double %76, %79
  %81 = trunc i64 %indvars.iv272 to i32
  %82 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %73, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %81, i32 %.022176.us, i32 %.126.us, i32 %.148.us, double %80) #6
  br label %.lr.ph172.us

; <label>:83:                                     ; preds = %.lr.ph172.us, %83
  %indvars.iv270 = phi i64 [ 0, %.lr.ph172.us ], [ %indvars.iv.next271, %83 ]
  %84 = icmp slt i64 %indvars.iv270, %93
  %85 = icmp sgt i64 %indvars.iv270, %94
  %or.cond53.us = or i1 %84, %85
  %.sink.us = select i1 %or.cond53.us, i8 15, i8 0
  %86 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv.next273, i64 %indvars.iv270
  store i8 %.sink.us, i8* %86, align 1
  %indvars.iv.next271 = add nuw nsw i64 %indvars.iv270, 1
  %87 = icmp slt i64 %indvars.iv.next271, %43
  br i1 %87, label %83, label %._crit_edge173.us

.lr.ph167.us:                                     ; preds = %.lr.ph167.us.preheader, %.lr.ph167.us
  %indvars.iv268 = phi i64 [ %51, %.lr.ph167.us.preheader ], [ %indvars.iv.next269, %.lr.ph167.us ]
  %.047164.us = phi i32 [ 0, %.lr.ph167.us.preheader ], [ %90, %.lr.ph167.us ]
  %indvars.iv.next269 = add nsw i64 %indvars.iv268, 1
  %88 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 %indvars.iv.next269
  %89 = load i32, i32* %88, align 4
  %90 = add nsw i32 %89, %.047164.us
  %91 = icmp slt i32 %90, %47
  %92 = icmp slt i64 %indvars.iv268, %42
  %.51.us = and i1 %91, %92
  br i1 %.51.us, label %.lr.ph167.us, label %._crit_edge168.us.loopexit

.lr.ph172.us:                                     ; preds = %69, %72
  %indvars.iv.next273 = add nsw i64 %indvars.iv272, -1
  %93 = sext i32 %.022176.us to i64
  %94 = sext i32 %.126.us to i64
  br label %83

._crit_edge173.us:                                ; preds = %83
  %95 = add nsw i32 %.126.us, 1
  %96 = sub nsw i32 %.050174.us, %.148.us
  %97 = icmp sgt i64 %indvars.iv272, 1
  br i1 %97, label %.split177.us, label %.preheader88.loopexit

.preheader88.loopexit:                            ; preds = %._crit_edge173.us
  br label %.preheader88

.preheader88.loopexit369:                         ; preds = %.preheader89
  br label %.preheader88

.preheader88:                                     ; preds = %.preheader88.loopexit369, %.preheader88.loopexit
  %98 = icmp sgt i32 %24, -2
  %99 = icmp eq i32 %.346, 6
  %100 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 0
  %101 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 1
  %102 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 2
  %103 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 3
  %104 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 4
  %105 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 5
  %106 = add nsw i32 %.346, -1
  %107 = zext i32 %106 to i64
  %108 = shl nuw nsw i64 %107, 2
  %109 = add nuw nsw i64 %108, 4
  %110 = icmp sgt i32 %25, 1
  %smax245 = select i1 %110, i32 %25, i32 1
  %111 = add nsw i32 %smax245, -1
  %112 = zext i32 %111 to i64
  %113 = shl nuw nsw i64 %112, 2
  %114 = add nuw nsw i64 %113, 4
  %115 = sext i32 %25 to i64
  %116 = add nsw i32 %.346, -1
  %117 = zext i32 %116 to i64
  %118 = shl nuw nsw i64 %117, 1
  %119 = add nuw nsw i64 %118, 2
  %120 = sext i32 %.346 to i64
  %121 = sext i32 %.346 to i64
  %scevgep = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 0, i64 0
  %scevgep244 = bitcast i32* %scevgep to i8*
  %scevgep.1 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 1, i64 0
  %scevgep244.1 = bitcast i32* %scevgep.1 to i8*
  %122 = icmp sgt i32 %.346, 2
  %scevgep.2 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 2, i64 0
  %scevgep244.2 = bitcast i32* %scevgep.2 to i8*
  %123 = icmp sgt i32 %.346, 3
  %scevgep.3 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 3, i64 0
  %scevgep244.3 = bitcast i32* %scevgep.3 to i8*
  %124 = icmp sgt i32 %.346, 4
  %scevgep.4 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 4, i64 0
  %scevgep244.4 = bitcast i32* %scevgep.4 to i8*
  %125 = icmp sgt i32 %.346, 5
  %scevgep.5 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 5, i64 0
  %scevgep244.5 = bitcast i32* %scevgep.5 to i8*
  %126 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 0
  %127 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 1
  %128 = icmp sgt i32 %.346, 2
  %129 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 2
  %130 = icmp eq i32 %.346, 3
  %131 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 3
  %132 = icmp sgt i32 %.346, 4
  %133 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 4
  %134 = icmp eq i32 %.346, 5
  %135 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 5
  %136 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 0
  %137 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 1
  %138 = icmp sgt i32 %.346, 2
  %139 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 2
  %140 = icmp eq i32 %.346, 3
  %141 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 3
  %142 = icmp sgt i32 %.346, 4
  %143 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 4
  %144 = icmp eq i32 %.346, 5
  %145 = getelementptr inbounds [6 x i16], [6 x i16]* %2, i64 0, i64 5
  br label %.preheader86

.split177:                                        ; preds = %.split177.preheader, %.preheader89
  %.022176 = phi i32 [ %183, %.preheader89 ], [ 0, %.split177.preheader ]
  %.049175 = phi i32 [ %182, %.preheader89 ], [ %.346, %.split177.preheader ]
  %.050174 = phi i32 [ %184, %.preheader89 ], [ %40, %.split177.preheader ]
  %146 = sdiv i32 %.050174, %.049175
  %147 = add nsw i32 %.022176, -1
  %148 = icmp sgt i32 %146, 0
  %149 = icmp sle i32 %147, %24
  %.51163 = and i1 %148, %149
  br i1 %.51163, label %.lr.ph167.preheader, label %._crit_edge168.thread

.lr.ph167.preheader:                              ; preds = %.split177
  %150 = sext i32 %147 to i64
  br label %.lr.ph167

.lr.ph167:                                        ; preds = %.lr.ph167.preheader, %.lr.ph167
  %indvars.iv274 = phi i64 [ %150, %.lr.ph167.preheader ], [ %indvars.iv.next275, %.lr.ph167 ]
  %.047164 = phi i32 [ 0, %.lr.ph167.preheader ], [ %153, %.lr.ph167 ]
  %indvars.iv.next275 = add nsw i64 %indvars.iv274, 1
  %151 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 %indvars.iv.next275
  %152 = load i32, i32* %151, align 4
  %153 = add nsw i32 %152, %.047164
  %154 = icmp slt i32 %153, %146
  %155 = icmp slt i64 %indvars.iv274, %42
  %.51 = and i1 %154, %155
  br i1 %.51, label %.lr.ph167, label %._crit_edge168

._crit_edge168:                                   ; preds = %.lr.ph167
  %156 = trunc i64 %indvars.iv.next275 to i32
  %157 = icmp sle i32 %156, %.022176
  %158 = icmp eq i32 %.346, %.049175
  %or.cond = or i1 %158, %157
  %159 = icmp eq i32 %.049175, 1
  %or.cond52 = or i1 %159, %or.cond
  br i1 %or.cond52, label %._crit_edge168.thread, label %160

; <label>:160:                                    ; preds = %._crit_edge168
  %161 = sub nuw nsw i32 %.346, %.049175
  %162 = srem i32 %161, 2
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %._crit_edge168.thread

; <label>:164:                                    ; preds = %160
  %165 = add nsw i32 %156, -1
  %sext = shl i64 %indvars.iv.next275, 32
  %166 = ashr exact i64 %sext, 32
  %167 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 32, i64 %166
  %168 = load i32, i32* %167, align 4
  %169 = sub nsw i32 %153, %168
  br label %._crit_edge168.thread

._crit_edge168.thread:                            ; preds = %.split177, %._crit_edge168, %164, %160
  %.148 = phi i32 [ %169, %164 ], [ %153, %160 ], [ %153, %._crit_edge168 ], [ 0, %.split177 ]
  %.126 = phi i32 [ %165, %164 ], [ %156, %160 ], [ %156, %._crit_edge168 ], [ %147, %.split177 ]
  %170 = load i32, i32* %10, align 8
  %171 = icmp sgt i32 %170, 2
  br i1 %171, label %172, label %.preheader89

; <label>:172:                                    ; preds = %._crit_edge168.thread
  %173 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %174 = sitofp i32 %.148 to float
  %175 = fpext float %174 to double
  %176 = fmul double %175, 1.000000e+02
  %177 = load i32, i32* %27, align 4
  %178 = sitofp i32 %177 to float
  %179 = fpext float %178 to double
  %180 = fdiv double %176, %179
  %181 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %173, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %.049175, i32 %.022176, i32 %.126, i32 %.148, double %180) #6
  br label %.preheader89

.preheader89:                                     ; preds = %._crit_edge168.thread, %172
  %182 = add nsw i32 %.049175, -1
  %183 = add nsw i32 %.126, 1
  %184 = sub nsw i32 %.050174, %.148
  %185 = icmp sgt i32 %.049175, 1
  br i1 %185, label %.split177, label %.preheader88.loopexit369

.preheader86:                                     ; preds = %.preheader88, %1391
  %.034162 = phi i32 [ 0, %.preheader88 ], [ %1392, %1391 ]
  call void @llvm.memset.p0i8.i64(i8* nonnull %5, i8 0, i64 %109, i32 16, i1 false)
  br i1 %98, label %._crit_edge139.us.1, label %.preheader84

.us-lcssa141.us:                                  ; preds = %._crit_edge139.us.1, %._crit_edge139.us.2, %._crit_edge139.us.3, %._crit_edge139.us.4, %._crit_edge139.us.5
  br i1 %99, label %.lr.ph143.preheader, label %.preheader84

.lr.ph143.preheader:                              ; preds = %.us-lcssa141.us
  br label %.lr.ph143

.preheader84.loopexit:                            ; preds = %.lr.ph143
  br label %.preheader84

.preheader84:                                     ; preds = %.preheader84.loopexit, %.us-lcssa141.us, %.preheader86
  %186 = load i32, i32* %27, align 4
  %187 = icmp sgt i32 %186, 0
  br i1 %187, label %.preheader298.preheader, label %._crit_edge157

.preheader298.preheader:                          ; preds = %.preheader84
  br label %.preheader298

.lr.ph143:                                        ; preds = %.lr.ph143.preheader, %.lr.ph143
  %indvars.iv248 = phi i64 [ %indvars.iv.next249, %.lr.ph143 ], [ 0, %.lr.ph143.preheader ]
  %188 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 1, i64 %indvars.iv248
  %189 = load i8, i8* %188, align 1
  %190 = zext i8 %189 to i32
  %191 = shl nuw nsw i32 %190, 16
  %192 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 0, i64 %indvars.iv248
  %193 = load i8, i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = or i32 %191, %194
  %196 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %indvars.iv248, i64 0
  store i32 %195, i32* %196, align 8
  %197 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 3, i64 %indvars.iv248
  %198 = load i8, i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = shl nuw nsw i32 %199, 16
  %201 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 2, i64 %indvars.iv248
  %202 = load i8, i8* %201, align 1
  %203 = zext i8 %202 to i32
  %204 = or i32 %200, %203
  %205 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %indvars.iv248, i64 1
  store i32 %204, i32* %205, align 4
  %206 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 5, i64 %indvars.iv248
  %207 = load i8, i8* %206, align 1
  %208 = zext i8 %207 to i32
  %209 = shl nuw nsw i32 %208, 16
  %210 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 4, i64 %indvars.iv248
  %211 = load i8, i8* %210, align 1
  %212 = zext i8 %211 to i32
  %213 = or i32 %209, %212
  %214 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %indvars.iv248, i64 2
  store i32 %213, i32* %214, align 8
  %indvars.iv.next249 = add nuw nsw i64 %indvars.iv248, 1
  %215 = icmp slt i64 %indvars.iv.next249, %115
  br i1 %215, label %.lr.ph143, label %.preheader84.loopexit

.preheader298:                                    ; preds = %.preheader298.preheader, %.loopexit79
  %indvars.iv261 = phi i64 [ %indvars.iv.next262, %.loopexit79 ], [ 0, %.preheader298.preheader ]
  %216 = phi i32 [ %1369, %.loopexit79 ], [ %186, %.preheader298.preheader ]
  %.123155 = phi i32 [ %1368, %.loopexit79 ], [ 0, %.preheader298.preheader ]
  %.029154 = phi i32 [ %937, %.loopexit79 ], [ 0, %.preheader298.preheader ]
  %217 = add nsw i32 %.123155, 49
  call void @llvm.memset.p0i8.i64(i8* nonnull %3, i8 0, i64 %119, i32 2, i1 false)
  %218 = add nsw i32 %216, -1
  %219 = icmp slt i32 %217, %216
  %.65 = select i1 %219, i32 %217, i32 %218
  %220 = sub nsw i32 %.65, %.123155
  %221 = icmp eq i32 %220, 49
  %or.cond59 = and i1 %99, %221
  br i1 %or.cond59, label %225, label %.preheader81

.preheader81:                                     ; preds = %.preheader298
  %222 = icmp slt i32 %.65, %.123155
  br i1 %222, label %.preheader80.1, label %.lr.ph147.preheader

.lr.ph147.preheader:                              ; preds = %.preheader81
  %223 = sext i32 %.123155 to i64
  %224 = sext i32 %.65 to i64
  %.promoted = load i16, i16* %136, align 2
  %.promoted307 = load i16, i16* %137, align 2
  %.promoted309 = load i16, i16* %139, align 2
  %.promoted311 = load i16, i16* %141, align 2
  %.promoted313 = load i16, i16* %143, align 2
  %.promoted315 = load i16, i16* %145, align 2
  br label %2173

; <label>:225:                                    ; preds = %.preheader298
  %226 = sext i32 %.123155 to i64
  %227 = getelementptr inbounds i16, i16* %9, i64 %226
  %228 = load i16, i16* %227, align 2
  %229 = zext i16 %228 to i64
  %230 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %229, i64 0
  %231 = load i32, i32* %230, align 8
  %232 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %229, i64 1
  %233 = load i32, i32* %232, align 4
  %234 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %229, i64 2
  %235 = load i32, i32* %234, align 8
  %236 = add nsw i32 %.123155, 1
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i16, i16* %9, i64 %237
  %239 = load i16, i16* %238, align 2
  %240 = zext i16 %239 to i64
  %241 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %240, i64 0
  %242 = load i32, i32* %241, align 8
  %243 = add i32 %242, %231
  %244 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %240, i64 1
  %245 = load i32, i32* %244, align 4
  %246 = add i32 %245, %233
  %247 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %240, i64 2
  %248 = load i32, i32* %247, align 8
  %249 = add i32 %248, %235
  %250 = add nsw i32 %.123155, 2
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i16, i16* %9, i64 %251
  %253 = load i16, i16* %252, align 2
  %254 = zext i16 %253 to i64
  %255 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %254, i64 0
  %256 = load i32, i32* %255, align 8
  %257 = add i32 %243, %256
  %258 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %254, i64 1
  %259 = load i32, i32* %258, align 4
  %260 = add i32 %246, %259
  %261 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %254, i64 2
  %262 = load i32, i32* %261, align 8
  %263 = add i32 %249, %262
  %264 = add nsw i32 %.123155, 3
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i16, i16* %9, i64 %265
  %267 = load i16, i16* %266, align 2
  %268 = zext i16 %267 to i64
  %269 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %268, i64 0
  %270 = load i32, i32* %269, align 8
  %271 = add i32 %257, %270
  %272 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %268, i64 1
  %273 = load i32, i32* %272, align 4
  %274 = add i32 %260, %273
  %275 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %268, i64 2
  %276 = load i32, i32* %275, align 8
  %277 = add i32 %263, %276
  %278 = add nsw i32 %.123155, 4
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds i16, i16* %9, i64 %279
  %281 = load i16, i16* %280, align 2
  %282 = zext i16 %281 to i64
  %283 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %282, i64 0
  %284 = load i32, i32* %283, align 8
  %285 = add i32 %271, %284
  %286 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %282, i64 1
  %287 = load i32, i32* %286, align 4
  %288 = add i32 %274, %287
  %289 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %282, i64 2
  %290 = load i32, i32* %289, align 8
  %291 = add i32 %277, %290
  %292 = add nsw i32 %.123155, 5
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i16, i16* %9, i64 %293
  %295 = load i16, i16* %294, align 2
  %296 = zext i16 %295 to i64
  %297 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %296, i64 0
  %298 = load i32, i32* %297, align 8
  %299 = add i32 %285, %298
  %300 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %296, i64 1
  %301 = load i32, i32* %300, align 4
  %302 = add i32 %288, %301
  %303 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %296, i64 2
  %304 = load i32, i32* %303, align 8
  %305 = add i32 %291, %304
  %306 = add nsw i32 %.123155, 6
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds i16, i16* %9, i64 %307
  %309 = load i16, i16* %308, align 2
  %310 = zext i16 %309 to i64
  %311 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %310, i64 0
  %312 = load i32, i32* %311, align 8
  %313 = add i32 %299, %312
  %314 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %310, i64 1
  %315 = load i32, i32* %314, align 4
  %316 = add i32 %302, %315
  %317 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %310, i64 2
  %318 = load i32, i32* %317, align 8
  %319 = add i32 %305, %318
  %320 = add nsw i32 %.123155, 7
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds i16, i16* %9, i64 %321
  %323 = load i16, i16* %322, align 2
  %324 = zext i16 %323 to i64
  %325 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %324, i64 0
  %326 = load i32, i32* %325, align 8
  %327 = add i32 %313, %326
  %328 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %324, i64 1
  %329 = load i32, i32* %328, align 4
  %330 = add i32 %316, %329
  %331 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %324, i64 2
  %332 = load i32, i32* %331, align 8
  %333 = add i32 %319, %332
  %334 = add nsw i32 %.123155, 8
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds i16, i16* %9, i64 %335
  %337 = load i16, i16* %336, align 2
  %338 = zext i16 %337 to i64
  %339 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %338, i64 0
  %340 = load i32, i32* %339, align 8
  %341 = add i32 %327, %340
  %342 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %338, i64 1
  %343 = load i32, i32* %342, align 4
  %344 = add i32 %330, %343
  %345 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %338, i64 2
  %346 = load i32, i32* %345, align 8
  %347 = add i32 %333, %346
  %348 = add nsw i32 %.123155, 9
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds i16, i16* %9, i64 %349
  %351 = load i16, i16* %350, align 2
  %352 = zext i16 %351 to i64
  %353 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %352, i64 0
  %354 = load i32, i32* %353, align 8
  %355 = add i32 %341, %354
  %356 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %352, i64 1
  %357 = load i32, i32* %356, align 4
  %358 = add i32 %344, %357
  %359 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %352, i64 2
  %360 = load i32, i32* %359, align 8
  %361 = add i32 %347, %360
  %362 = add nsw i32 %.123155, 10
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds i16, i16* %9, i64 %363
  %365 = load i16, i16* %364, align 2
  %366 = zext i16 %365 to i64
  %367 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %366, i64 0
  %368 = load i32, i32* %367, align 8
  %369 = add i32 %355, %368
  %370 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %366, i64 1
  %371 = load i32, i32* %370, align 4
  %372 = add i32 %358, %371
  %373 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %366, i64 2
  %374 = load i32, i32* %373, align 8
  %375 = add i32 %361, %374
  %376 = add nsw i32 %.123155, 11
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds i16, i16* %9, i64 %377
  %379 = load i16, i16* %378, align 2
  %380 = zext i16 %379 to i64
  %381 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %380, i64 0
  %382 = load i32, i32* %381, align 8
  %383 = add i32 %369, %382
  %384 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %380, i64 1
  %385 = load i32, i32* %384, align 4
  %386 = add i32 %372, %385
  %387 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %380, i64 2
  %388 = load i32, i32* %387, align 8
  %389 = add i32 %375, %388
  %390 = add nsw i32 %.123155, 12
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds i16, i16* %9, i64 %391
  %393 = load i16, i16* %392, align 2
  %394 = zext i16 %393 to i64
  %395 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %394, i64 0
  %396 = load i32, i32* %395, align 8
  %397 = add i32 %383, %396
  %398 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %394, i64 1
  %399 = load i32, i32* %398, align 4
  %400 = add i32 %386, %399
  %401 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %394, i64 2
  %402 = load i32, i32* %401, align 8
  %403 = add i32 %389, %402
  %404 = add nsw i32 %.123155, 13
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds i16, i16* %9, i64 %405
  %407 = load i16, i16* %406, align 2
  %408 = zext i16 %407 to i64
  %409 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %408, i64 0
  %410 = load i32, i32* %409, align 8
  %411 = add i32 %397, %410
  %412 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %408, i64 1
  %413 = load i32, i32* %412, align 4
  %414 = add i32 %400, %413
  %415 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %408, i64 2
  %416 = load i32, i32* %415, align 8
  %417 = add i32 %403, %416
  %418 = add nsw i32 %.123155, 14
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i16, i16* %9, i64 %419
  %421 = load i16, i16* %420, align 2
  %422 = zext i16 %421 to i64
  %423 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %422, i64 0
  %424 = load i32, i32* %423, align 8
  %425 = add i32 %411, %424
  %426 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %422, i64 1
  %427 = load i32, i32* %426, align 4
  %428 = add i32 %414, %427
  %429 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %422, i64 2
  %430 = load i32, i32* %429, align 8
  %431 = add i32 %417, %430
  %432 = add nsw i32 %.123155, 15
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds i16, i16* %9, i64 %433
  %435 = load i16, i16* %434, align 2
  %436 = zext i16 %435 to i64
  %437 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %436, i64 0
  %438 = load i32, i32* %437, align 8
  %439 = add i32 %425, %438
  %440 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %436, i64 1
  %441 = load i32, i32* %440, align 4
  %442 = add i32 %428, %441
  %443 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %436, i64 2
  %444 = load i32, i32* %443, align 8
  %445 = add i32 %431, %444
  %446 = add nsw i32 %.123155, 16
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds i16, i16* %9, i64 %447
  %449 = load i16, i16* %448, align 2
  %450 = zext i16 %449 to i64
  %451 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %450, i64 0
  %452 = load i32, i32* %451, align 8
  %453 = add i32 %439, %452
  %454 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %450, i64 1
  %455 = load i32, i32* %454, align 4
  %456 = add i32 %442, %455
  %457 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %450, i64 2
  %458 = load i32, i32* %457, align 8
  %459 = add i32 %445, %458
  %460 = add nsw i32 %.123155, 17
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds i16, i16* %9, i64 %461
  %463 = load i16, i16* %462, align 2
  %464 = zext i16 %463 to i64
  %465 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %464, i64 0
  %466 = load i32, i32* %465, align 8
  %467 = add i32 %453, %466
  %468 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %464, i64 1
  %469 = load i32, i32* %468, align 4
  %470 = add i32 %456, %469
  %471 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %464, i64 2
  %472 = load i32, i32* %471, align 8
  %473 = add i32 %459, %472
  %474 = add nsw i32 %.123155, 18
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds i16, i16* %9, i64 %475
  %477 = load i16, i16* %476, align 2
  %478 = zext i16 %477 to i64
  %479 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %478, i64 0
  %480 = load i32, i32* %479, align 8
  %481 = add i32 %467, %480
  %482 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %478, i64 1
  %483 = load i32, i32* %482, align 4
  %484 = add i32 %470, %483
  %485 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %478, i64 2
  %486 = load i32, i32* %485, align 8
  %487 = add i32 %473, %486
  %488 = add nsw i32 %.123155, 19
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds i16, i16* %9, i64 %489
  %491 = load i16, i16* %490, align 2
  %492 = zext i16 %491 to i64
  %493 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %492, i64 0
  %494 = load i32, i32* %493, align 8
  %495 = add i32 %481, %494
  %496 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %492, i64 1
  %497 = load i32, i32* %496, align 4
  %498 = add i32 %484, %497
  %499 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %492, i64 2
  %500 = load i32, i32* %499, align 8
  %501 = add i32 %487, %500
  %502 = add nsw i32 %.123155, 20
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds i16, i16* %9, i64 %503
  %505 = load i16, i16* %504, align 2
  %506 = zext i16 %505 to i64
  %507 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %506, i64 0
  %508 = load i32, i32* %507, align 8
  %509 = add i32 %495, %508
  %510 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %506, i64 1
  %511 = load i32, i32* %510, align 4
  %512 = add i32 %498, %511
  %513 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %506, i64 2
  %514 = load i32, i32* %513, align 8
  %515 = add i32 %501, %514
  %516 = add nsw i32 %.123155, 21
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds i16, i16* %9, i64 %517
  %519 = load i16, i16* %518, align 2
  %520 = zext i16 %519 to i64
  %521 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %520, i64 0
  %522 = load i32, i32* %521, align 8
  %523 = add i32 %509, %522
  %524 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %520, i64 1
  %525 = load i32, i32* %524, align 4
  %526 = add i32 %512, %525
  %527 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %520, i64 2
  %528 = load i32, i32* %527, align 8
  %529 = add i32 %515, %528
  %530 = add nsw i32 %.123155, 22
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds i16, i16* %9, i64 %531
  %533 = load i16, i16* %532, align 2
  %534 = zext i16 %533 to i64
  %535 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %534, i64 0
  %536 = load i32, i32* %535, align 8
  %537 = add i32 %523, %536
  %538 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %534, i64 1
  %539 = load i32, i32* %538, align 4
  %540 = add i32 %526, %539
  %541 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %534, i64 2
  %542 = load i32, i32* %541, align 8
  %543 = add i32 %529, %542
  %544 = add nsw i32 %.123155, 23
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds i16, i16* %9, i64 %545
  %547 = load i16, i16* %546, align 2
  %548 = zext i16 %547 to i64
  %549 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %548, i64 0
  %550 = load i32, i32* %549, align 8
  %551 = add i32 %537, %550
  %552 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %548, i64 1
  %553 = load i32, i32* %552, align 4
  %554 = add i32 %540, %553
  %555 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %548, i64 2
  %556 = load i32, i32* %555, align 8
  %557 = add i32 %543, %556
  %558 = add nsw i32 %.123155, 24
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds i16, i16* %9, i64 %559
  %561 = load i16, i16* %560, align 2
  %562 = zext i16 %561 to i64
  %563 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %562, i64 0
  %564 = load i32, i32* %563, align 8
  %565 = add i32 %551, %564
  %566 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %562, i64 1
  %567 = load i32, i32* %566, align 4
  %568 = add i32 %554, %567
  %569 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %562, i64 2
  %570 = load i32, i32* %569, align 8
  %571 = add i32 %557, %570
  %572 = add nsw i32 %.123155, 25
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds i16, i16* %9, i64 %573
  %575 = load i16, i16* %574, align 2
  %576 = zext i16 %575 to i64
  %577 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %576, i64 0
  %578 = load i32, i32* %577, align 8
  %579 = add i32 %565, %578
  %580 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %576, i64 1
  %581 = load i32, i32* %580, align 4
  %582 = add i32 %568, %581
  %583 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %576, i64 2
  %584 = load i32, i32* %583, align 8
  %585 = add i32 %571, %584
  %586 = add nsw i32 %.123155, 26
  %587 = sext i32 %586 to i64
  %588 = getelementptr inbounds i16, i16* %9, i64 %587
  %589 = load i16, i16* %588, align 2
  %590 = zext i16 %589 to i64
  %591 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %590, i64 0
  %592 = load i32, i32* %591, align 8
  %593 = add i32 %579, %592
  %594 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %590, i64 1
  %595 = load i32, i32* %594, align 4
  %596 = add i32 %582, %595
  %597 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %590, i64 2
  %598 = load i32, i32* %597, align 8
  %599 = add i32 %585, %598
  %600 = add nsw i32 %.123155, 27
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds i16, i16* %9, i64 %601
  %603 = load i16, i16* %602, align 2
  %604 = zext i16 %603 to i64
  %605 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %604, i64 0
  %606 = load i32, i32* %605, align 8
  %607 = add i32 %593, %606
  %608 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %604, i64 1
  %609 = load i32, i32* %608, align 4
  %610 = add i32 %596, %609
  %611 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %604, i64 2
  %612 = load i32, i32* %611, align 8
  %613 = add i32 %599, %612
  %614 = add nsw i32 %.123155, 28
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds i16, i16* %9, i64 %615
  %617 = load i16, i16* %616, align 2
  %618 = zext i16 %617 to i64
  %619 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %618, i64 0
  %620 = load i32, i32* %619, align 8
  %621 = add i32 %607, %620
  %622 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %618, i64 1
  %623 = load i32, i32* %622, align 4
  %624 = add i32 %610, %623
  %625 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %618, i64 2
  %626 = load i32, i32* %625, align 8
  %627 = add i32 %613, %626
  %628 = add nsw i32 %.123155, 29
  %629 = sext i32 %628 to i64
  %630 = getelementptr inbounds i16, i16* %9, i64 %629
  %631 = load i16, i16* %630, align 2
  %632 = zext i16 %631 to i64
  %633 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %632, i64 0
  %634 = load i32, i32* %633, align 8
  %635 = add i32 %621, %634
  %636 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %632, i64 1
  %637 = load i32, i32* %636, align 4
  %638 = add i32 %624, %637
  %639 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %632, i64 2
  %640 = load i32, i32* %639, align 8
  %641 = add i32 %627, %640
  %642 = add nsw i32 %.123155, 30
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds i16, i16* %9, i64 %643
  %645 = load i16, i16* %644, align 2
  %646 = zext i16 %645 to i64
  %647 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %646, i64 0
  %648 = load i32, i32* %647, align 8
  %649 = add i32 %635, %648
  %650 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %646, i64 1
  %651 = load i32, i32* %650, align 4
  %652 = add i32 %638, %651
  %653 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %646, i64 2
  %654 = load i32, i32* %653, align 8
  %655 = add i32 %641, %654
  %656 = add nsw i32 %.123155, 31
  %657 = sext i32 %656 to i64
  %658 = getelementptr inbounds i16, i16* %9, i64 %657
  %659 = load i16, i16* %658, align 2
  %660 = zext i16 %659 to i64
  %661 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %660, i64 0
  %662 = load i32, i32* %661, align 8
  %663 = add i32 %649, %662
  %664 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %660, i64 1
  %665 = load i32, i32* %664, align 4
  %666 = add i32 %652, %665
  %667 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %660, i64 2
  %668 = load i32, i32* %667, align 8
  %669 = add i32 %655, %668
  %670 = add nsw i32 %.123155, 32
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds i16, i16* %9, i64 %671
  %673 = load i16, i16* %672, align 2
  %674 = zext i16 %673 to i64
  %675 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %674, i64 0
  %676 = load i32, i32* %675, align 8
  %677 = add i32 %663, %676
  %678 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %674, i64 1
  %679 = load i32, i32* %678, align 4
  %680 = add i32 %666, %679
  %681 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %674, i64 2
  %682 = load i32, i32* %681, align 8
  %683 = add i32 %669, %682
  %684 = add nsw i32 %.123155, 33
  %685 = sext i32 %684 to i64
  %686 = getelementptr inbounds i16, i16* %9, i64 %685
  %687 = load i16, i16* %686, align 2
  %688 = zext i16 %687 to i64
  %689 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %688, i64 0
  %690 = load i32, i32* %689, align 8
  %691 = add i32 %677, %690
  %692 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %688, i64 1
  %693 = load i32, i32* %692, align 4
  %694 = add i32 %680, %693
  %695 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %688, i64 2
  %696 = load i32, i32* %695, align 8
  %697 = add i32 %683, %696
  %698 = add nsw i32 %.123155, 34
  %699 = sext i32 %698 to i64
  %700 = getelementptr inbounds i16, i16* %9, i64 %699
  %701 = load i16, i16* %700, align 2
  %702 = zext i16 %701 to i64
  %703 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %702, i64 0
  %704 = load i32, i32* %703, align 8
  %705 = add i32 %691, %704
  %706 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %702, i64 1
  %707 = load i32, i32* %706, align 4
  %708 = add i32 %694, %707
  %709 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %702, i64 2
  %710 = load i32, i32* %709, align 8
  %711 = add i32 %697, %710
  %712 = add nsw i32 %.123155, 35
  %713 = sext i32 %712 to i64
  %714 = getelementptr inbounds i16, i16* %9, i64 %713
  %715 = load i16, i16* %714, align 2
  %716 = zext i16 %715 to i64
  %717 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %716, i64 0
  %718 = load i32, i32* %717, align 8
  %719 = add i32 %705, %718
  %720 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %716, i64 1
  %721 = load i32, i32* %720, align 4
  %722 = add i32 %708, %721
  %723 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %716, i64 2
  %724 = load i32, i32* %723, align 8
  %725 = add i32 %711, %724
  %726 = add nsw i32 %.123155, 36
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds i16, i16* %9, i64 %727
  %729 = load i16, i16* %728, align 2
  %730 = zext i16 %729 to i64
  %731 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %730, i64 0
  %732 = load i32, i32* %731, align 8
  %733 = add i32 %719, %732
  %734 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %730, i64 1
  %735 = load i32, i32* %734, align 4
  %736 = add i32 %722, %735
  %737 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %730, i64 2
  %738 = load i32, i32* %737, align 8
  %739 = add i32 %725, %738
  %740 = add nsw i32 %.123155, 37
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds i16, i16* %9, i64 %741
  %743 = load i16, i16* %742, align 2
  %744 = zext i16 %743 to i64
  %745 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %744, i64 0
  %746 = load i32, i32* %745, align 8
  %747 = add i32 %733, %746
  %748 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %744, i64 1
  %749 = load i32, i32* %748, align 4
  %750 = add i32 %736, %749
  %751 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %744, i64 2
  %752 = load i32, i32* %751, align 8
  %753 = add i32 %739, %752
  %754 = add nsw i32 %.123155, 38
  %755 = sext i32 %754 to i64
  %756 = getelementptr inbounds i16, i16* %9, i64 %755
  %757 = load i16, i16* %756, align 2
  %758 = zext i16 %757 to i64
  %759 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %758, i64 0
  %760 = load i32, i32* %759, align 8
  %761 = add i32 %747, %760
  %762 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %758, i64 1
  %763 = load i32, i32* %762, align 4
  %764 = add i32 %750, %763
  %765 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %758, i64 2
  %766 = load i32, i32* %765, align 8
  %767 = add i32 %753, %766
  %768 = add nsw i32 %.123155, 39
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds i16, i16* %9, i64 %769
  %771 = load i16, i16* %770, align 2
  %772 = zext i16 %771 to i64
  %773 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %772, i64 0
  %774 = load i32, i32* %773, align 8
  %775 = add i32 %761, %774
  %776 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %772, i64 1
  %777 = load i32, i32* %776, align 4
  %778 = add i32 %764, %777
  %779 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %772, i64 2
  %780 = load i32, i32* %779, align 8
  %781 = add i32 %767, %780
  %782 = add nsw i32 %.123155, 40
  %783 = sext i32 %782 to i64
  %784 = getelementptr inbounds i16, i16* %9, i64 %783
  %785 = load i16, i16* %784, align 2
  %786 = zext i16 %785 to i64
  %787 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %786, i64 0
  %788 = load i32, i32* %787, align 8
  %789 = add i32 %775, %788
  %790 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %786, i64 1
  %791 = load i32, i32* %790, align 4
  %792 = add i32 %778, %791
  %793 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %786, i64 2
  %794 = load i32, i32* %793, align 8
  %795 = add i32 %781, %794
  %796 = add nsw i32 %.123155, 41
  %797 = sext i32 %796 to i64
  %798 = getelementptr inbounds i16, i16* %9, i64 %797
  %799 = load i16, i16* %798, align 2
  %800 = zext i16 %799 to i64
  %801 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %800, i64 0
  %802 = load i32, i32* %801, align 8
  %803 = add i32 %789, %802
  %804 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %800, i64 1
  %805 = load i32, i32* %804, align 4
  %806 = add i32 %792, %805
  %807 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %800, i64 2
  %808 = load i32, i32* %807, align 8
  %809 = add i32 %795, %808
  %810 = add nsw i32 %.123155, 42
  %811 = sext i32 %810 to i64
  %812 = getelementptr inbounds i16, i16* %9, i64 %811
  %813 = load i16, i16* %812, align 2
  %814 = zext i16 %813 to i64
  %815 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %814, i64 0
  %816 = load i32, i32* %815, align 8
  %817 = add i32 %803, %816
  %818 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %814, i64 1
  %819 = load i32, i32* %818, align 4
  %820 = add i32 %806, %819
  %821 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %814, i64 2
  %822 = load i32, i32* %821, align 8
  %823 = add i32 %809, %822
  %824 = add nsw i32 %.123155, 43
  %825 = sext i32 %824 to i64
  %826 = getelementptr inbounds i16, i16* %9, i64 %825
  %827 = load i16, i16* %826, align 2
  %828 = zext i16 %827 to i64
  %829 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %828, i64 0
  %830 = load i32, i32* %829, align 8
  %831 = add i32 %817, %830
  %832 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %828, i64 1
  %833 = load i32, i32* %832, align 4
  %834 = add i32 %820, %833
  %835 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %828, i64 2
  %836 = load i32, i32* %835, align 8
  %837 = add i32 %823, %836
  %838 = add nsw i32 %.123155, 44
  %839 = sext i32 %838 to i64
  %840 = getelementptr inbounds i16, i16* %9, i64 %839
  %841 = load i16, i16* %840, align 2
  %842 = zext i16 %841 to i64
  %843 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %842, i64 0
  %844 = load i32, i32* %843, align 8
  %845 = add i32 %831, %844
  %846 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %842, i64 1
  %847 = load i32, i32* %846, align 4
  %848 = add i32 %834, %847
  %849 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %842, i64 2
  %850 = load i32, i32* %849, align 8
  %851 = add i32 %837, %850
  %852 = add nsw i32 %.123155, 45
  %853 = sext i32 %852 to i64
  %854 = getelementptr inbounds i16, i16* %9, i64 %853
  %855 = load i16, i16* %854, align 2
  %856 = zext i16 %855 to i64
  %857 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %856, i64 0
  %858 = load i32, i32* %857, align 8
  %859 = add i32 %845, %858
  %860 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %856, i64 1
  %861 = load i32, i32* %860, align 4
  %862 = add i32 %848, %861
  %863 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %856, i64 2
  %864 = load i32, i32* %863, align 8
  %865 = add i32 %851, %864
  %866 = add nsw i32 %.123155, 46
  %867 = sext i32 %866 to i64
  %868 = getelementptr inbounds i16, i16* %9, i64 %867
  %869 = load i16, i16* %868, align 2
  %870 = zext i16 %869 to i64
  %871 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %870, i64 0
  %872 = load i32, i32* %871, align 8
  %873 = add i32 %859, %872
  %874 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %870, i64 1
  %875 = load i32, i32* %874, align 4
  %876 = add i32 %862, %875
  %877 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %870, i64 2
  %878 = load i32, i32* %877, align 8
  %879 = add i32 %865, %878
  %880 = add nsw i32 %.123155, 47
  %881 = sext i32 %880 to i64
  %882 = getelementptr inbounds i16, i16* %9, i64 %881
  %883 = load i16, i16* %882, align 2
  %884 = zext i16 %883 to i64
  %885 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %884, i64 0
  %886 = load i32, i32* %885, align 8
  %887 = add i32 %873, %886
  %888 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %884, i64 1
  %889 = load i32, i32* %888, align 4
  %890 = add i32 %876, %889
  %891 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %884, i64 2
  %892 = load i32, i32* %891, align 8
  %893 = add i32 %879, %892
  %894 = add nsw i32 %.123155, 48
  %895 = sext i32 %894 to i64
  %896 = getelementptr inbounds i16, i16* %9, i64 %895
  %897 = load i16, i16* %896, align 2
  %898 = zext i16 %897 to i64
  %899 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %898, i64 0
  %900 = load i32, i32* %899, align 8
  %901 = add i32 %887, %900
  %902 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %898, i64 1
  %903 = load i32, i32* %902, align 4
  %904 = add i32 %890, %903
  %905 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %898, i64 2
  %906 = load i32, i32* %905, align 8
  %907 = add i32 %893, %906
  %908 = sext i32 %217 to i64
  %909 = getelementptr inbounds i16, i16* %9, i64 %908
  %910 = load i16, i16* %909, align 2
  %911 = zext i16 %910 to i64
  %912 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %911, i64 0
  %913 = load i32, i32* %912, align 8
  %914 = add i32 %901, %913
  %915 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %911, i64 1
  %916 = load i32, i32* %915, align 4
  %917 = add i32 %904, %916
  %918 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 38, i64 %911, i64 2
  %919 = load i32, i32* %918, align 8
  %920 = add i32 %907, %919
  %921 = trunc i32 %914 to i16
  store i16 %921, i16* %100, align 2
  %922 = lshr i32 %914, 16
  %923 = trunc i32 %922 to i16
  store i16 %923, i16* %101, align 2
  %924 = trunc i32 %917 to i16
  store i16 %924, i16* %102, align 2
  %925 = lshr i32 %917, 16
  %926 = trunc i32 %925 to i16
  store i16 %926, i16* %103, align 2
  %927 = trunc i32 %920 to i16
  store i16 %927, i16* %104, align 2
  %928 = lshr i32 %920, 16
  %929 = trunc i32 %928 to i16
  store i16 %929, i16* %105, align 2
  br label %.preheader80.1

; <label>:930:                                    ; preds = %2206, %2201, %2191, %2196, %2173
  %931 = phi i16 [ %2210, %2206 ], [ %2174, %2201 ], [ %2174, %2191 ], [ %2174, %2196 ], [ %2174, %2173 ]
  %932 = phi i16 [ %2205, %2206 ], [ %2205, %2201 ], [ %2175, %2191 ], [ %2175, %2196 ], [ %2175, %2173 ]
  %933 = phi i16 [ %2200, %2206 ], [ %2200, %2201 ], [ %2176, %2191 ], [ %2200, %2196 ], [ %2176, %2173 ]
  %934 = phi i16 [ %2195, %2206 ], [ %2195, %2201 ], [ %2195, %2191 ], [ %2195, %2196 ], [ %2177, %2173 ]
  %indvars.iv.next256 = add nsw i64 %indvars.iv255, 1
  %935 = icmp slt i64 %indvars.iv255, %224
  br i1 %935, label %2173, label %.preheader80.1.loopexit

; <label>:936:                                    ; preds = %.preheader80.5, %.preheader80.4, %.preheader80.2, %.preheader80.3, %.preheader80.1
  %..032.lcssa.in = phi i16 [ %..032.1284, %.preheader80.1 ], [ %..032.2285, %.preheader80.2 ], [ %..032.3286, %.preheader80.3 ], [ %..032.4287, %.preheader80.4 ], [ %..032.5288, %.preheader80.5 ]
  %.5..030.lcssa = phi i32 [ %.5..030.1, %.preheader80.1 ], [ %.5..030.2, %.preheader80.2 ], [ %.5..030.3, %.preheader80.3 ], [ %.5..030.4, %.preheader80.4 ], [ %.5..030.5, %.preheader80.5 ]
  %..032.lcssa = zext i16 %..032.lcssa.in to i32
  %937 = add nsw i32 %..032.lcssa, %.029154
  %938 = sext i32 %.5..030.lcssa to i64
  %939 = getelementptr inbounds [6 x i32], [6 x i32]* %4, i64 0, i64 %938
  %940 = load i32, i32* %939, align 4
  %941 = add nsw i32 %940, 1
  store i32 %941, i32* %939, align 4
  %942 = trunc i32 %.5..030.lcssa to i8
  %943 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 33, i64 %indvars.iv261
  store i8 %942, i8* %943, align 1
  %indvars.iv.next262 = add nuw i64 %indvars.iv261, 1
  br i1 %or.cond59, label %956, label %.preheader78

.preheader78:                                     ; preds = %936
  %944 = icmp slt i32 %.65, %.123155
  br i1 %944, label %.loopexit79, label %.lr.ph152.preheader

.lr.ph152.preheader:                              ; preds = %.preheader78
  %945 = sext i32 %.123155 to i64
  %946 = sext i32 %.65 to i64
  %947 = add nsw i64 %946, 1
  %948 = sub nsw i64 %947, %945
  %xtraiter = and i64 %948, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph152.prol.loopexit.unr-lcssa, label %.lr.ph152.prol.preheader

.lr.ph152.prol.preheader:                         ; preds = %.lr.ph152.preheader
  br label %.lr.ph152.prol

.lr.ph152.prol:                                   ; preds = %.lr.ph152.prol.preheader
  %949 = getelementptr inbounds i16, i16* %9, i64 %945
  %950 = load i16, i16* %949, align 2
  %951 = zext i16 %950 to i64
  %952 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %951
  %953 = load i32, i32* %952, align 4
  %954 = add nsw i32 %953, 1
  store i32 %954, i32* %952, align 4
  %indvars.iv.next260.prol = add nsw i64 %945, 1
  br label %.lr.ph152.prol.loopexit.unr-lcssa

.lr.ph152.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph152.preheader, %.lr.ph152.prol
  %indvars.iv259.unr.ph = phi i64 [ %indvars.iv.next260.prol, %.lr.ph152.prol ], [ %945, %.lr.ph152.preheader ]
  br label %.lr.ph152.prol.loopexit

.lr.ph152.prol.loopexit:                          ; preds = %.lr.ph152.prol.loopexit.unr-lcssa
  %955 = icmp eq i32 %.65, %.123155
  br i1 %955, label %.loopexit79.loopexit, label %.lr.ph152.preheader.new

.lr.ph152.preheader.new:                          ; preds = %.lr.ph152.prol.loopexit
  br label %.lr.ph152

; <label>:956:                                    ; preds = %936
  %957 = sext i32 %.123155 to i64
  %958 = getelementptr inbounds i16, i16* %9, i64 %957
  %959 = load i16, i16* %958, align 2
  %960 = zext i16 %959 to i64
  %961 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %960
  %962 = load i32, i32* %961, align 4
  %963 = add nsw i32 %962, 1
  store i32 %963, i32* %961, align 4
  %964 = add nsw i32 %.123155, 1
  %965 = sext i32 %964 to i64
  %966 = getelementptr inbounds i16, i16* %9, i64 %965
  %967 = load i16, i16* %966, align 2
  %968 = zext i16 %967 to i64
  %969 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %968
  %970 = load i32, i32* %969, align 4
  %971 = add nsw i32 %970, 1
  store i32 %971, i32* %969, align 4
  %972 = add nsw i32 %.123155, 2
  %973 = sext i32 %972 to i64
  %974 = getelementptr inbounds i16, i16* %9, i64 %973
  %975 = load i16, i16* %974, align 2
  %976 = zext i16 %975 to i64
  %977 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %976
  %978 = load i32, i32* %977, align 4
  %979 = add nsw i32 %978, 1
  store i32 %979, i32* %977, align 4
  %980 = add nsw i32 %.123155, 3
  %981 = sext i32 %980 to i64
  %982 = getelementptr inbounds i16, i16* %9, i64 %981
  %983 = load i16, i16* %982, align 2
  %984 = zext i16 %983 to i64
  %985 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %984
  %986 = load i32, i32* %985, align 4
  %987 = add nsw i32 %986, 1
  store i32 %987, i32* %985, align 4
  %988 = add nsw i32 %.123155, 4
  %989 = sext i32 %988 to i64
  %990 = getelementptr inbounds i16, i16* %9, i64 %989
  %991 = load i16, i16* %990, align 2
  %992 = zext i16 %991 to i64
  %993 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %992
  %994 = load i32, i32* %993, align 4
  %995 = add nsw i32 %994, 1
  store i32 %995, i32* %993, align 4
  %996 = add nsw i32 %.123155, 5
  %997 = sext i32 %996 to i64
  %998 = getelementptr inbounds i16, i16* %9, i64 %997
  %999 = load i16, i16* %998, align 2
  %1000 = zext i16 %999 to i64
  %1001 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1000
  %1002 = load i32, i32* %1001, align 4
  %1003 = add nsw i32 %1002, 1
  store i32 %1003, i32* %1001, align 4
  %1004 = add nsw i32 %.123155, 6
  %1005 = sext i32 %1004 to i64
  %1006 = getelementptr inbounds i16, i16* %9, i64 %1005
  %1007 = load i16, i16* %1006, align 2
  %1008 = zext i16 %1007 to i64
  %1009 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1008
  %1010 = load i32, i32* %1009, align 4
  %1011 = add nsw i32 %1010, 1
  store i32 %1011, i32* %1009, align 4
  %1012 = add nsw i32 %.123155, 7
  %1013 = sext i32 %1012 to i64
  %1014 = getelementptr inbounds i16, i16* %9, i64 %1013
  %1015 = load i16, i16* %1014, align 2
  %1016 = zext i16 %1015 to i64
  %1017 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1016
  %1018 = load i32, i32* %1017, align 4
  %1019 = add nsw i32 %1018, 1
  store i32 %1019, i32* %1017, align 4
  %1020 = add nsw i32 %.123155, 8
  %1021 = sext i32 %1020 to i64
  %1022 = getelementptr inbounds i16, i16* %9, i64 %1021
  %1023 = load i16, i16* %1022, align 2
  %1024 = zext i16 %1023 to i64
  %1025 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1024
  %1026 = load i32, i32* %1025, align 4
  %1027 = add nsw i32 %1026, 1
  store i32 %1027, i32* %1025, align 4
  %1028 = add nsw i32 %.123155, 9
  %1029 = sext i32 %1028 to i64
  %1030 = getelementptr inbounds i16, i16* %9, i64 %1029
  %1031 = load i16, i16* %1030, align 2
  %1032 = zext i16 %1031 to i64
  %1033 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1032
  %1034 = load i32, i32* %1033, align 4
  %1035 = add nsw i32 %1034, 1
  store i32 %1035, i32* %1033, align 4
  %1036 = add nsw i32 %.123155, 10
  %1037 = sext i32 %1036 to i64
  %1038 = getelementptr inbounds i16, i16* %9, i64 %1037
  %1039 = load i16, i16* %1038, align 2
  %1040 = zext i16 %1039 to i64
  %1041 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1040
  %1042 = load i32, i32* %1041, align 4
  %1043 = add nsw i32 %1042, 1
  store i32 %1043, i32* %1041, align 4
  %1044 = add nsw i32 %.123155, 11
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds i16, i16* %9, i64 %1045
  %1047 = load i16, i16* %1046, align 2
  %1048 = zext i16 %1047 to i64
  %1049 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1048
  %1050 = load i32, i32* %1049, align 4
  %1051 = add nsw i32 %1050, 1
  store i32 %1051, i32* %1049, align 4
  %1052 = add nsw i32 %.123155, 12
  %1053 = sext i32 %1052 to i64
  %1054 = getelementptr inbounds i16, i16* %9, i64 %1053
  %1055 = load i16, i16* %1054, align 2
  %1056 = zext i16 %1055 to i64
  %1057 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1056
  %1058 = load i32, i32* %1057, align 4
  %1059 = add nsw i32 %1058, 1
  store i32 %1059, i32* %1057, align 4
  %1060 = add nsw i32 %.123155, 13
  %1061 = sext i32 %1060 to i64
  %1062 = getelementptr inbounds i16, i16* %9, i64 %1061
  %1063 = load i16, i16* %1062, align 2
  %1064 = zext i16 %1063 to i64
  %1065 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1064
  %1066 = load i32, i32* %1065, align 4
  %1067 = add nsw i32 %1066, 1
  store i32 %1067, i32* %1065, align 4
  %1068 = add nsw i32 %.123155, 14
  %1069 = sext i32 %1068 to i64
  %1070 = getelementptr inbounds i16, i16* %9, i64 %1069
  %1071 = load i16, i16* %1070, align 2
  %1072 = zext i16 %1071 to i64
  %1073 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1072
  %1074 = load i32, i32* %1073, align 4
  %1075 = add nsw i32 %1074, 1
  store i32 %1075, i32* %1073, align 4
  %1076 = add nsw i32 %.123155, 15
  %1077 = sext i32 %1076 to i64
  %1078 = getelementptr inbounds i16, i16* %9, i64 %1077
  %1079 = load i16, i16* %1078, align 2
  %1080 = zext i16 %1079 to i64
  %1081 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1080
  %1082 = load i32, i32* %1081, align 4
  %1083 = add nsw i32 %1082, 1
  store i32 %1083, i32* %1081, align 4
  %1084 = add nsw i32 %.123155, 16
  %1085 = sext i32 %1084 to i64
  %1086 = getelementptr inbounds i16, i16* %9, i64 %1085
  %1087 = load i16, i16* %1086, align 2
  %1088 = zext i16 %1087 to i64
  %1089 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1088
  %1090 = load i32, i32* %1089, align 4
  %1091 = add nsw i32 %1090, 1
  store i32 %1091, i32* %1089, align 4
  %1092 = add nsw i32 %.123155, 17
  %1093 = sext i32 %1092 to i64
  %1094 = getelementptr inbounds i16, i16* %9, i64 %1093
  %1095 = load i16, i16* %1094, align 2
  %1096 = zext i16 %1095 to i64
  %1097 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1096
  %1098 = load i32, i32* %1097, align 4
  %1099 = add nsw i32 %1098, 1
  store i32 %1099, i32* %1097, align 4
  %1100 = add nsw i32 %.123155, 18
  %1101 = sext i32 %1100 to i64
  %1102 = getelementptr inbounds i16, i16* %9, i64 %1101
  %1103 = load i16, i16* %1102, align 2
  %1104 = zext i16 %1103 to i64
  %1105 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1104
  %1106 = load i32, i32* %1105, align 4
  %1107 = add nsw i32 %1106, 1
  store i32 %1107, i32* %1105, align 4
  %1108 = add nsw i32 %.123155, 19
  %1109 = sext i32 %1108 to i64
  %1110 = getelementptr inbounds i16, i16* %9, i64 %1109
  %1111 = load i16, i16* %1110, align 2
  %1112 = zext i16 %1111 to i64
  %1113 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1112
  %1114 = load i32, i32* %1113, align 4
  %1115 = add nsw i32 %1114, 1
  store i32 %1115, i32* %1113, align 4
  %1116 = add nsw i32 %.123155, 20
  %1117 = sext i32 %1116 to i64
  %1118 = getelementptr inbounds i16, i16* %9, i64 %1117
  %1119 = load i16, i16* %1118, align 2
  %1120 = zext i16 %1119 to i64
  %1121 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1120
  %1122 = load i32, i32* %1121, align 4
  %1123 = add nsw i32 %1122, 1
  store i32 %1123, i32* %1121, align 4
  %1124 = add nsw i32 %.123155, 21
  %1125 = sext i32 %1124 to i64
  %1126 = getelementptr inbounds i16, i16* %9, i64 %1125
  %1127 = load i16, i16* %1126, align 2
  %1128 = zext i16 %1127 to i64
  %1129 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1128
  %1130 = load i32, i32* %1129, align 4
  %1131 = add nsw i32 %1130, 1
  store i32 %1131, i32* %1129, align 4
  %1132 = add nsw i32 %.123155, 22
  %1133 = sext i32 %1132 to i64
  %1134 = getelementptr inbounds i16, i16* %9, i64 %1133
  %1135 = load i16, i16* %1134, align 2
  %1136 = zext i16 %1135 to i64
  %1137 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1136
  %1138 = load i32, i32* %1137, align 4
  %1139 = add nsw i32 %1138, 1
  store i32 %1139, i32* %1137, align 4
  %1140 = add nsw i32 %.123155, 23
  %1141 = sext i32 %1140 to i64
  %1142 = getelementptr inbounds i16, i16* %9, i64 %1141
  %1143 = load i16, i16* %1142, align 2
  %1144 = zext i16 %1143 to i64
  %1145 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1144
  %1146 = load i32, i32* %1145, align 4
  %1147 = add nsw i32 %1146, 1
  store i32 %1147, i32* %1145, align 4
  %1148 = add nsw i32 %.123155, 24
  %1149 = sext i32 %1148 to i64
  %1150 = getelementptr inbounds i16, i16* %9, i64 %1149
  %1151 = load i16, i16* %1150, align 2
  %1152 = zext i16 %1151 to i64
  %1153 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1152
  %1154 = load i32, i32* %1153, align 4
  %1155 = add nsw i32 %1154, 1
  store i32 %1155, i32* %1153, align 4
  %1156 = add nsw i32 %.123155, 25
  %1157 = sext i32 %1156 to i64
  %1158 = getelementptr inbounds i16, i16* %9, i64 %1157
  %1159 = load i16, i16* %1158, align 2
  %1160 = zext i16 %1159 to i64
  %1161 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1160
  %1162 = load i32, i32* %1161, align 4
  %1163 = add nsw i32 %1162, 1
  store i32 %1163, i32* %1161, align 4
  %1164 = add nsw i32 %.123155, 26
  %1165 = sext i32 %1164 to i64
  %1166 = getelementptr inbounds i16, i16* %9, i64 %1165
  %1167 = load i16, i16* %1166, align 2
  %1168 = zext i16 %1167 to i64
  %1169 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1168
  %1170 = load i32, i32* %1169, align 4
  %1171 = add nsw i32 %1170, 1
  store i32 %1171, i32* %1169, align 4
  %1172 = add nsw i32 %.123155, 27
  %1173 = sext i32 %1172 to i64
  %1174 = getelementptr inbounds i16, i16* %9, i64 %1173
  %1175 = load i16, i16* %1174, align 2
  %1176 = zext i16 %1175 to i64
  %1177 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1176
  %1178 = load i32, i32* %1177, align 4
  %1179 = add nsw i32 %1178, 1
  store i32 %1179, i32* %1177, align 4
  %1180 = add nsw i32 %.123155, 28
  %1181 = sext i32 %1180 to i64
  %1182 = getelementptr inbounds i16, i16* %9, i64 %1181
  %1183 = load i16, i16* %1182, align 2
  %1184 = zext i16 %1183 to i64
  %1185 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1184
  %1186 = load i32, i32* %1185, align 4
  %1187 = add nsw i32 %1186, 1
  store i32 %1187, i32* %1185, align 4
  %1188 = add nsw i32 %.123155, 29
  %1189 = sext i32 %1188 to i64
  %1190 = getelementptr inbounds i16, i16* %9, i64 %1189
  %1191 = load i16, i16* %1190, align 2
  %1192 = zext i16 %1191 to i64
  %1193 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1192
  %1194 = load i32, i32* %1193, align 4
  %1195 = add nsw i32 %1194, 1
  store i32 %1195, i32* %1193, align 4
  %1196 = add nsw i32 %.123155, 30
  %1197 = sext i32 %1196 to i64
  %1198 = getelementptr inbounds i16, i16* %9, i64 %1197
  %1199 = load i16, i16* %1198, align 2
  %1200 = zext i16 %1199 to i64
  %1201 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1200
  %1202 = load i32, i32* %1201, align 4
  %1203 = add nsw i32 %1202, 1
  store i32 %1203, i32* %1201, align 4
  %1204 = add nsw i32 %.123155, 31
  %1205 = sext i32 %1204 to i64
  %1206 = getelementptr inbounds i16, i16* %9, i64 %1205
  %1207 = load i16, i16* %1206, align 2
  %1208 = zext i16 %1207 to i64
  %1209 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1208
  %1210 = load i32, i32* %1209, align 4
  %1211 = add nsw i32 %1210, 1
  store i32 %1211, i32* %1209, align 4
  %1212 = add nsw i32 %.123155, 32
  %1213 = sext i32 %1212 to i64
  %1214 = getelementptr inbounds i16, i16* %9, i64 %1213
  %1215 = load i16, i16* %1214, align 2
  %1216 = zext i16 %1215 to i64
  %1217 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1216
  %1218 = load i32, i32* %1217, align 4
  %1219 = add nsw i32 %1218, 1
  store i32 %1219, i32* %1217, align 4
  %1220 = add nsw i32 %.123155, 33
  %1221 = sext i32 %1220 to i64
  %1222 = getelementptr inbounds i16, i16* %9, i64 %1221
  %1223 = load i16, i16* %1222, align 2
  %1224 = zext i16 %1223 to i64
  %1225 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1224
  %1226 = load i32, i32* %1225, align 4
  %1227 = add nsw i32 %1226, 1
  store i32 %1227, i32* %1225, align 4
  %1228 = add nsw i32 %.123155, 34
  %1229 = sext i32 %1228 to i64
  %1230 = getelementptr inbounds i16, i16* %9, i64 %1229
  %1231 = load i16, i16* %1230, align 2
  %1232 = zext i16 %1231 to i64
  %1233 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1232
  %1234 = load i32, i32* %1233, align 4
  %1235 = add nsw i32 %1234, 1
  store i32 %1235, i32* %1233, align 4
  %1236 = add nsw i32 %.123155, 35
  %1237 = sext i32 %1236 to i64
  %1238 = getelementptr inbounds i16, i16* %9, i64 %1237
  %1239 = load i16, i16* %1238, align 2
  %1240 = zext i16 %1239 to i64
  %1241 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1240
  %1242 = load i32, i32* %1241, align 4
  %1243 = add nsw i32 %1242, 1
  store i32 %1243, i32* %1241, align 4
  %1244 = add nsw i32 %.123155, 36
  %1245 = sext i32 %1244 to i64
  %1246 = getelementptr inbounds i16, i16* %9, i64 %1245
  %1247 = load i16, i16* %1246, align 2
  %1248 = zext i16 %1247 to i64
  %1249 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1248
  %1250 = load i32, i32* %1249, align 4
  %1251 = add nsw i32 %1250, 1
  store i32 %1251, i32* %1249, align 4
  %1252 = add nsw i32 %.123155, 37
  %1253 = sext i32 %1252 to i64
  %1254 = getelementptr inbounds i16, i16* %9, i64 %1253
  %1255 = load i16, i16* %1254, align 2
  %1256 = zext i16 %1255 to i64
  %1257 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1256
  %1258 = load i32, i32* %1257, align 4
  %1259 = add nsw i32 %1258, 1
  store i32 %1259, i32* %1257, align 4
  %1260 = add nsw i32 %.123155, 38
  %1261 = sext i32 %1260 to i64
  %1262 = getelementptr inbounds i16, i16* %9, i64 %1261
  %1263 = load i16, i16* %1262, align 2
  %1264 = zext i16 %1263 to i64
  %1265 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1264
  %1266 = load i32, i32* %1265, align 4
  %1267 = add nsw i32 %1266, 1
  store i32 %1267, i32* %1265, align 4
  %1268 = add nsw i32 %.123155, 39
  %1269 = sext i32 %1268 to i64
  %1270 = getelementptr inbounds i16, i16* %9, i64 %1269
  %1271 = load i16, i16* %1270, align 2
  %1272 = zext i16 %1271 to i64
  %1273 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1272
  %1274 = load i32, i32* %1273, align 4
  %1275 = add nsw i32 %1274, 1
  store i32 %1275, i32* %1273, align 4
  %1276 = add nsw i32 %.123155, 40
  %1277 = sext i32 %1276 to i64
  %1278 = getelementptr inbounds i16, i16* %9, i64 %1277
  %1279 = load i16, i16* %1278, align 2
  %1280 = zext i16 %1279 to i64
  %1281 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1280
  %1282 = load i32, i32* %1281, align 4
  %1283 = add nsw i32 %1282, 1
  store i32 %1283, i32* %1281, align 4
  %1284 = add nsw i32 %.123155, 41
  %1285 = sext i32 %1284 to i64
  %1286 = getelementptr inbounds i16, i16* %9, i64 %1285
  %1287 = load i16, i16* %1286, align 2
  %1288 = zext i16 %1287 to i64
  %1289 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1288
  %1290 = load i32, i32* %1289, align 4
  %1291 = add nsw i32 %1290, 1
  store i32 %1291, i32* %1289, align 4
  %1292 = add nsw i32 %.123155, 42
  %1293 = sext i32 %1292 to i64
  %1294 = getelementptr inbounds i16, i16* %9, i64 %1293
  %1295 = load i16, i16* %1294, align 2
  %1296 = zext i16 %1295 to i64
  %1297 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1296
  %1298 = load i32, i32* %1297, align 4
  %1299 = add nsw i32 %1298, 1
  store i32 %1299, i32* %1297, align 4
  %1300 = add nsw i32 %.123155, 43
  %1301 = sext i32 %1300 to i64
  %1302 = getelementptr inbounds i16, i16* %9, i64 %1301
  %1303 = load i16, i16* %1302, align 2
  %1304 = zext i16 %1303 to i64
  %1305 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1304
  %1306 = load i32, i32* %1305, align 4
  %1307 = add nsw i32 %1306, 1
  store i32 %1307, i32* %1305, align 4
  %1308 = add nsw i32 %.123155, 44
  %1309 = sext i32 %1308 to i64
  %1310 = getelementptr inbounds i16, i16* %9, i64 %1309
  %1311 = load i16, i16* %1310, align 2
  %1312 = zext i16 %1311 to i64
  %1313 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1312
  %1314 = load i32, i32* %1313, align 4
  %1315 = add nsw i32 %1314, 1
  store i32 %1315, i32* %1313, align 4
  %1316 = add nsw i32 %.123155, 45
  %1317 = sext i32 %1316 to i64
  %1318 = getelementptr inbounds i16, i16* %9, i64 %1317
  %1319 = load i16, i16* %1318, align 2
  %1320 = zext i16 %1319 to i64
  %1321 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1320
  %1322 = load i32, i32* %1321, align 4
  %1323 = add nsw i32 %1322, 1
  store i32 %1323, i32* %1321, align 4
  %1324 = add nsw i32 %.123155, 46
  %1325 = sext i32 %1324 to i64
  %1326 = getelementptr inbounds i16, i16* %9, i64 %1325
  %1327 = load i16, i16* %1326, align 2
  %1328 = zext i16 %1327 to i64
  %1329 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1328
  %1330 = load i32, i32* %1329, align 4
  %1331 = add nsw i32 %1330, 1
  store i32 %1331, i32* %1329, align 4
  %1332 = add nsw i32 %.123155, 47
  %1333 = sext i32 %1332 to i64
  %1334 = getelementptr inbounds i16, i16* %9, i64 %1333
  %1335 = load i16, i16* %1334, align 2
  %1336 = zext i16 %1335 to i64
  %1337 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1336
  %1338 = load i32, i32* %1337, align 4
  %1339 = add nsw i32 %1338, 1
  store i32 %1339, i32* %1337, align 4
  %1340 = add nsw i32 %.123155, 48
  %1341 = sext i32 %1340 to i64
  %1342 = getelementptr inbounds i16, i16* %9, i64 %1341
  %1343 = load i16, i16* %1342, align 2
  %1344 = zext i16 %1343 to i64
  %1345 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1344
  %1346 = load i32, i32* %1345, align 4
  %1347 = add nsw i32 %1346, 1
  store i32 %1347, i32* %1345, align 4
  %1348 = sext i32 %217 to i64
  %1349 = getelementptr inbounds i16, i16* %9, i64 %1348
  %1350 = load i16, i16* %1349, align 2
  %1351 = zext i16 %1350 to i64
  %1352 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1351
  %1353 = load i32, i32* %1352, align 4
  %1354 = add nsw i32 %1353, 1
  store i32 %1354, i32* %1352, align 4
  br label %.loopexit79

.lr.ph152:                                        ; preds = %.lr.ph152, %.lr.ph152.preheader.new
  %indvars.iv259 = phi i64 [ %indvars.iv259.unr.ph, %.lr.ph152.preheader.new ], [ %indvars.iv.next260.1, %.lr.ph152 ]
  %1355 = getelementptr inbounds i16, i16* %9, i64 %indvars.iv259
  %1356 = load i16, i16* %1355, align 2
  %1357 = zext i16 %1356 to i64
  %1358 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1357
  %1359 = load i32, i32* %1358, align 4
  %1360 = add nsw i32 %1359, 1
  store i32 %1360, i32* %1358, align 4
  %indvars.iv.next260 = add nsw i64 %indvars.iv259, 1
  %1361 = getelementptr inbounds i16, i16* %9, i64 %indvars.iv.next260
  %1362 = load i16, i16* %1361, align 2
  %1363 = zext i16 %1362 to i64
  %1364 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %938, i64 %1363
  %1365 = load i32, i32* %1364, align 4
  %1366 = add nsw i32 %1365, 1
  store i32 %1366, i32* %1364, align 4
  %indvars.iv.next260.1 = add nsw i64 %indvars.iv259, 2
  %1367 = icmp slt i64 %indvars.iv.next260, %946
  br i1 %1367, label %.lr.ph152, label %.loopexit79.loopexit.unr-lcssa

.loopexit79.loopexit.unr-lcssa:                   ; preds = %.lr.ph152
  br label %.loopexit79.loopexit

.loopexit79.loopexit:                             ; preds = %.lr.ph152.prol.loopexit, %.loopexit79.loopexit.unr-lcssa
  br label %.loopexit79

.loopexit79:                                      ; preds = %.loopexit79.loopexit, %.preheader78, %956
  %1368 = add nsw i32 %.65, 1
  %1369 = load i32, i32* %27, align 4
  %1370 = icmp slt i32 %1368, %1369
  br i1 %1370, label %.preheader298, label %._crit_edge157.loopexit

._crit_edge157.loopexit:                          ; preds = %.loopexit79
  %1371 = trunc i64 %indvars.iv.next262 to i32
  br label %._crit_edge157

._crit_edge157:                                   ; preds = %._crit_edge157.loopexit, %.preheader84
  %.136.lcssa = phi i32 [ 0, %.preheader84 ], [ %1371, %._crit_edge157.loopexit ]
  %.029.lcssa = phi i32 [ 0, %.preheader84 ], [ %937, %._crit_edge157.loopexit ]
  %1372 = load i32, i32* %10, align 8
  %1373 = icmp sgt i32 %1372, 2
  br i1 %1373, label %1374, label %.preheader83.preheader

; <label>:1374:                                   ; preds = %._crit_edge157
  %1375 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1376 = add nuw nsw i32 %.034162, 1
  %1377 = sdiv i32 %.029.lcssa, 8
  %1378 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1375, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.4, i64 0, i64 0), i32 %1376, i32 %1377) #6
  %1379 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %1380

; <label>:1380:                                   ; preds = %1374, %1380
  %indvars.iv263 = phi i64 [ 0, %1374 ], [ %indvars.iv.next264, %1380 ]
  %1381 = phi %struct._IO_FILE* [ %1379, %1374 ], [ %1386, %1380 ]
  %1382 = getelementptr inbounds [6 x i32], [6 x i32]* %4, i64 0, i64 %indvars.iv263
  %1383 = load i32, i32* %1382, align 4
  %1384 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1381, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %1383) #6
  %indvars.iv.next264 = add nuw nsw i64 %indvars.iv263, 1
  %1385 = icmp slt i64 %indvars.iv.next264, %120
  %1386 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %1385, label %1380, label %1387

; <label>:1387:                                   ; preds = %1380
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %1386) #6
  br label %.preheader83.preheader

.preheader83.preheader:                           ; preds = %1387, %._crit_edge157
  br label %.preheader83

.preheader83:                                     ; preds = %.preheader83.preheader, %.preheader83
  %indvars.iv265 = phi i64 [ %indvars.iv.next266, %.preheader83 ], [ 0, %.preheader83.preheader ]
  %1388 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv265, i64 0
  %1389 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 37, i64 %indvars.iv265, i64 0
  tail call void @BZ2_hbMakeCodeLengths(i8* %1388, i32* %1389, i32 %25, i32 17) #4
  %indvars.iv.next266 = add nuw nsw i64 %indvars.iv265, 1
  %1390 = icmp slt i64 %indvars.iv.next266, %121
  br i1 %1390, label %.preheader83, label %1391

; <label>:1391:                                   ; preds = %.preheader83
  %1392 = add nuw nsw i32 %.034162, 1
  %exitcond267 = icmp eq i32 %1392, 4
  br i1 %exitcond267, label %1393, label %.preheader86

; <label>:1393:                                   ; preds = %1391
  %1394 = icmp slt i32 %.136.lcssa, 18003
  br i1 %1394, label %.preheader77.1, label %1395

; <label>:1395:                                   ; preds = %1393
  tail call void @BZ2_bz__AssertH__fail(i32 3003) #4
  br label %.preheader77.1

.preheader76:                                     ; preds = %.preheader77.5, %.preheader77.4, %.preheader77.2, %.preheader77.3, %.preheader77.1
  %1396 = icmp sgt i32 %.136.lcssa, 0
  br i1 %1396, label %.lr.ph134, label %.preheader75

.lr.ph134:                                        ; preds = %.preheader76
  %1397 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 0
  %wide.trip.count236 = zext i32 %.136.lcssa to i64
  br label %1438

.preheader75.loopexit:                            ; preds = %._crit_edge130
  br label %.preheader75

.preheader75:                                     ; preds = %.preheader75.loopexit, %.preheader76
  %1398 = icmp sgt i32 %24, -2
  br i1 %1398, label %.preheader74.us.preheader, label %.preheader74.preheader

.preheader74.preheader:                           ; preds = %.preheader75
  %1399 = sext i32 %.346 to i64
  br label %1448

.preheader74.us.preheader:                        ; preds = %.preheader75
  %1400 = sext i32 %25 to i64
  %1401 = sext i32 %.346 to i64
  %1402 = icmp sgt i64 %115, 1
  %smax = select i1 %1402, i64 %115, i64 1
  %min.iters.check = icmp ult i64 %smax, 8
  %n.vec = and i64 %smax, 9223372036854775800
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %.preheader74.us

.preheader74.us:                                  ; preds = %.preheader74.us.preheader, %1426
  %indvars.iv228 = phi i64 [ 0, %.preheader74.us.preheader ], [ %indvars.iv.next229, %1426 ]
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.preheader74.us
  %indvars.iv226.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.preheader74.us ], [ %n.vec, %middle.block ]
  %.038119.us.ph = phi i32 [ 32, %min.iters.checked ], [ 32, %.preheader74.us ], [ %1421, %middle.block ]
  %.040118.us.ph = phi i32 [ 0, %min.iters.checked ], [ 0, %.preheader74.us ], [ %1420, %middle.block ]
  br label %scalar.ph

min.iters.checked:                                ; preds = %.preheader74.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.phi = phi <4 x i32> [ %1417, %vector.body ], [ <i32 32, i32 32, i32 32, i32 32>, %vector.body.preheader ]
  %vec.phi349 = phi <4 x i32> [ %1418, %vector.body ], [ <i32 32, i32 32, i32 32, i32 32>, %vector.body.preheader ]
  %vec.phi350 = phi <4 x i32> [ %1411, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %vec.phi351 = phi <4 x i32> [ %1412, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %1403 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv228, i64 %index
  %1404 = bitcast i8* %1403 to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %1404, align 1
  %1405 = getelementptr i8, i8* %1403, i64 4
  %1406 = bitcast i8* %1405 to <4 x i8>*
  %wide.load352 = load <4 x i8>, <4 x i8>* %1406, align 1
  %1407 = zext <4 x i8> %wide.load to <4 x i32>
  %1408 = zext <4 x i8> %wide.load352 to <4 x i32>
  %1409 = icmp sgt <4 x i32> %1407, %vec.phi350
  %1410 = icmp sgt <4 x i32> %1408, %vec.phi351
  %1411 = select <4 x i1> %1409, <4 x i32> %1407, <4 x i32> %vec.phi350
  %1412 = select <4 x i1> %1410, <4 x i32> %1408, <4 x i32> %vec.phi351
  %1413 = zext <4 x i8> %wide.load to <4 x i32>
  %1414 = zext <4 x i8> %wide.load352 to <4 x i32>
  %1415 = icmp slt <4 x i32> %1413, %vec.phi
  %1416 = icmp slt <4 x i32> %1414, %vec.phi349
  %1417 = select <4 x i1> %1415, <4 x i32> %1413, <4 x i32> %vec.phi
  %1418 = select <4 x i1> %1416, <4 x i32> %1414, <4 x i32> %vec.phi349
  %index.next = add i64 %index, 8
  %1419 = icmp eq i64 %index.next, %n.vec
  br i1 %1419, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %rdx.minmax.cmp358 = icmp sgt <4 x i32> %1411, %1412
  %rdx.minmax.select359 = select <4 x i1> %rdx.minmax.cmp358, <4 x i32> %1411, <4 x i32> %1412
  %rdx.shuf360 = shufflevector <4 x i32> %rdx.minmax.select359, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %rdx.minmax.cmp361 = icmp sgt <4 x i32> %rdx.minmax.select359, %rdx.shuf360
  %rdx.minmax.select362 = select <4 x i1> %rdx.minmax.cmp361, <4 x i32> %rdx.minmax.select359, <4 x i32> %rdx.shuf360
  %rdx.shuf363 = shufflevector <4 x i32> %rdx.minmax.select362, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %rdx.minmax.cmp364 = icmp sgt <4 x i32> %rdx.minmax.select362, %rdx.shuf363
  %rdx.minmax.cmp364.elt = extractelement <4 x i1> %rdx.minmax.cmp364, i32 0
  %rdx.minmax.select362.elt = extractelement <4 x i32> %rdx.minmax.select362, i32 0
  %rdx.shuf363.elt = extractelement <4 x i32> %rdx.minmax.select362, i32 1
  %1420 = select i1 %rdx.minmax.cmp364.elt, i32 %rdx.minmax.select362.elt, i32 %rdx.shuf363.elt
  %rdx.minmax.cmp = icmp slt <4 x i32> %1417, %1418
  %rdx.minmax.select = select <4 x i1> %rdx.minmax.cmp, <4 x i32> %1417, <4 x i32> %1418
  %rdx.shuf = shufflevector <4 x i32> %rdx.minmax.select, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %rdx.minmax.cmp353 = icmp slt <4 x i32> %rdx.minmax.select, %rdx.shuf
  %rdx.minmax.select354 = select <4 x i1> %rdx.minmax.cmp353, <4 x i32> %rdx.minmax.select, <4 x i32> %rdx.shuf
  %rdx.shuf355 = shufflevector <4 x i32> %rdx.minmax.select354, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %rdx.minmax.cmp356 = icmp slt <4 x i32> %rdx.minmax.select354, %rdx.shuf355
  %rdx.minmax.cmp356.elt = extractelement <4 x i1> %rdx.minmax.cmp356, i32 0
  %rdx.minmax.select354.elt = extractelement <4 x i32> %rdx.minmax.select354, i32 0
  %rdx.shuf355.elt = extractelement <4 x i32> %rdx.minmax.select354, i32 1
  %1421 = select i1 %rdx.minmax.cmp356.elt, i32 %rdx.minmax.select354.elt, i32 %rdx.shuf355.elt
  br i1 %cmp.n, label %._crit_edge122.us, label %scalar.ph.preheader

; <label>:1422:                                   ; preds = %._crit_edge122.us
  tail call void @BZ2_bz__AssertH__fail(i32 3004) #4
  br label %1423

; <label>:1423:                                   ; preds = %1422, %._crit_edge122.us
  %1424 = icmp slt i32 %.139.us.lcssa, 1
  br i1 %1424, label %1425, label %1426

; <label>:1425:                                   ; preds = %1423
  tail call void @BZ2_bz__AssertH__fail(i32 3005) #4
  br label %1426

; <label>:1426:                                   ; preds = %1425, %1423
  %1427 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %indvars.iv228, i64 0
  %1428 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv228, i64 0
  tail call void @BZ2_hbAssignCodes(i32* %1427, i8* %1428, i32 %.139.us.lcssa, i32 %..040.us.lcssa, i32 %25) #4
  %indvars.iv.next229 = add nuw nsw i64 %indvars.iv228, 1
  %1429 = icmp slt i64 %indvars.iv.next229, %1401
  br i1 %1429, label %.preheader74.us, label %.preheader296.preheader.loopexit

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv226 = phi i64 [ %indvars.iv.next227, %scalar.ph ], [ %indvars.iv226.ph, %scalar.ph.preheader ]
  %.038119.us = phi i32 [ %.139.us, %scalar.ph ], [ %.038119.us.ph, %scalar.ph.preheader ]
  %.040118.us = phi i32 [ %..040.us, %scalar.ph ], [ %.040118.us.ph, %scalar.ph.preheader ]
  %1430 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv228, i64 %indvars.iv226
  %1431 = load i8, i8* %1430, align 1
  %1432 = zext i8 %1431 to i32
  %1433 = icmp sgt i32 %1432, %.040118.us
  %..040.us = select i1 %1433, i32 %1432, i32 %.040118.us
  %1434 = zext i8 %1431 to i32
  %1435 = icmp slt i32 %1434, %.038119.us
  %.139.us = select i1 %1435, i32 %1434, i32 %.038119.us
  %indvars.iv.next227 = add nuw nsw i64 %indvars.iv226, 1
  %1436 = icmp slt i64 %indvars.iv.next227, %1400
  br i1 %1436, label %scalar.ph, label %._crit_edge122.us.loopexit, !llvm.loop !9

._crit_edge122.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge122.us

._crit_edge122.us:                                ; preds = %._crit_edge122.us.loopexit, %middle.block
  %..040.us.lcssa = phi i32 [ %1420, %middle.block ], [ %..040.us, %._crit_edge122.us.loopexit ]
  %.139.us.lcssa = phi i32 [ %1421, %middle.block ], [ %.139.us, %._crit_edge122.us.loopexit ]
  %1437 = icmp sgt i32 %..040.us.lcssa, 17
  br i1 %1437, label %1422, label %1423

; <label>:1438:                                   ; preds = %._crit_edge130, %.lr.ph134
  %indvars.iv234 = phi i64 [ 0, %.lr.ph134 ], [ %indvars.iv.next235, %._crit_edge130 ]
  %1439 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 33, i64 %indvars.iv234
  %1440 = load i8, i8* %1439, align 1
  %1441 = load i8, i8* %1397, align 1
  %1442 = icmp eq i8 %1440, %1441
  br i1 %1442, label %._crit_edge130, label %.lr.ph129.preheader

.lr.ph129.preheader:                              ; preds = %1438
  br label %.lr.ph129

.lr.ph129:                                        ; preds = %.lr.ph129.preheader, %.lr.ph129
  %indvars.iv232 = phi i64 [ %indvars.iv.next233, %.lr.ph129 ], [ 0, %.lr.ph129.preheader ]
  %.037126 = phi i8 [ %1444, %.lr.ph129 ], [ %1441, %.lr.ph129.preheader ]
  %indvars.iv.next233 = add nuw nsw i64 %indvars.iv232, 1
  %1443 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 %indvars.iv.next233
  %1444 = load i8, i8* %1443, align 1
  store i8 %.037126, i8* %1443, align 1
  %1445 = icmp eq i8 %1440, %1444
  br i1 %1445, label %._crit_edge130.loopexit, label %.lr.ph129

._crit_edge130.loopexit:                          ; preds = %.lr.ph129
  %1446 = trunc i64 %indvars.iv.next233 to i8
  br label %._crit_edge130

._crit_edge130:                                   ; preds = %._crit_edge130.loopexit, %1438
  %.037.lcssa = phi i8 [ %1441, %1438 ], [ %1444, %._crit_edge130.loopexit ]
  %.018.lcssa = phi i8 [ 0, %1438 ], [ %1446, %._crit_edge130.loopexit ]
  store i8 %.037.lcssa, i8* %1397, align 1
  %1447 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 34, i64 %indvars.iv234
  store i8 %.018.lcssa, i8* %1447, align 1
  %indvars.iv.next235 = add nuw nsw i64 %indvars.iv234, 1
  %exitcond237 = icmp eq i64 %indvars.iv.next235, %wide.trip.count236
  br i1 %exitcond237, label %.preheader75.loopexit, label %1438

; <label>:1448:                                   ; preds = %.preheader74.preheader, %1448
  %indvars.iv230 = phi i64 [ 0, %.preheader74.preheader ], [ %indvars.iv.next231, %1448 ]
  %1449 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %indvars.iv230, i64 0
  %1450 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv230, i64 0
  tail call void @BZ2_hbAssignCodes(i32* %1449, i8* %1450, i32 32, i32 0, i32 %25) #4
  %indvars.iv.next231 = add nuw nsw i64 %indvars.iv230, 1
  %1451 = icmp slt i64 %indvars.iv.next231, %1399
  br i1 %1451, label %1448, label %.preheader296.preheader.loopexit368

.preheader296.preheader.loopexit:                 ; preds = %1426
  br label %.preheader296.preheader

.preheader296.preheader.loopexit368:              ; preds = %1448
  br label %.preheader296.preheader

.preheader296.preheader:                          ; preds = %.preheader296.preheader.loopexit368, %.preheader296.preheader.loopexit
  br label %.preheader296

.preheader296:                                    ; preds = %.preheader296.preheader, %.preheader296
  %indvars.iv223 = phi i64 [ %indvars.iv.next224, %.preheader296 ], [ 0, %.preheader296.preheader ]
  %1452 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 %indvars.iv223
  store i8 0, i8* %1452, align 1
  %1453 = shl i64 %indvars.iv223, 4
  %1454 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1453
  %1455 = load i8, i8* %1454, align 1
  %not. = icmp ne i8 %1455, 0
  %.317 = zext i1 %not. to i8
  store i8 %.317, i8* %1452, align 1
  %1456 = or i64 %1453, 1
  %1457 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1456
  %1458 = load i8, i8* %1457, align 1
  %1459 = or i8 %1455, %1458
  %1460 = icmp ne i8 %1459, 0
  %.317. = zext i1 %1460 to i8
  store i8 %.317., i8* %1452, align 1
  %1461 = or i64 %1453, 2
  %1462 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1461
  %1463 = load i8, i8* %1462, align 1
  %1464 = or i8 %1459, %1463
  %1465 = icmp ne i8 %1464, 0
  %.317.. = zext i1 %1465 to i8
  store i8 %.317.., i8* %1452, align 1
  %1466 = or i64 %1453, 3
  %1467 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1466
  %1468 = load i8, i8* %1467, align 1
  %1469 = or i8 %1464, %1468
  %1470 = icmp ne i8 %1469, 0
  %.317... = zext i1 %1470 to i8
  store i8 %.317..., i8* %1452, align 1
  %1471 = or i64 %1453, 4
  %1472 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1471
  %1473 = load i8, i8* %1472, align 1
  %1474 = or i8 %1469, %1473
  %1475 = icmp ne i8 %1474, 0
  %.317.... = zext i1 %1475 to i8
  store i8 %.317...., i8* %1452, align 1
  %1476 = or i64 %1453, 5
  %1477 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1476
  %1478 = load i8, i8* %1477, align 1
  %1479 = or i8 %1474, %1478
  %1480 = icmp ne i8 %1479, 0
  %.317..... = zext i1 %1480 to i8
  store i8 %.317....., i8* %1452, align 1
  %1481 = or i64 %1453, 6
  %1482 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1481
  %1483 = load i8, i8* %1482, align 1
  %1484 = or i8 %1479, %1483
  %1485 = icmp ne i8 %1484, 0
  %.317...... = zext i1 %1485 to i8
  store i8 %.317......, i8* %1452, align 1
  %1486 = or i64 %1453, 7
  %1487 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1486
  %1488 = load i8, i8* %1487, align 1
  %1489 = or i8 %1484, %1488
  %1490 = icmp ne i8 %1489, 0
  %.317....... = zext i1 %1490 to i8
  store i8 %.317......., i8* %1452, align 1
  %1491 = or i64 %1453, 8
  %1492 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1491
  %1493 = load i8, i8* %1492, align 1
  %1494 = or i8 %1489, %1493
  %1495 = icmp ne i8 %1494, 0
  %.317........ = zext i1 %1495 to i8
  store i8 %.317........, i8* %1452, align 1
  %1496 = or i64 %1453, 9
  %1497 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1496
  %1498 = load i8, i8* %1497, align 1
  %1499 = or i8 %1494, %1498
  %1500 = icmp ne i8 %1499, 0
  %.317......... = zext i1 %1500 to i8
  store i8 %.317........., i8* %1452, align 1
  %1501 = or i64 %1453, 10
  %1502 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1501
  %1503 = load i8, i8* %1502, align 1
  %1504 = or i8 %1499, %1503
  %1505 = icmp ne i8 %1504, 0
  %.317.......... = zext i1 %1505 to i8
  store i8 %.317.........., i8* %1452, align 1
  %1506 = or i64 %1453, 11
  %1507 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1506
  %1508 = load i8, i8* %1507, align 1
  %1509 = or i8 %1504, %1508
  %1510 = icmp ne i8 %1509, 0
  %.317........... = zext i1 %1510 to i8
  store i8 %.317..........., i8* %1452, align 1
  %1511 = or i64 %1453, 12
  %1512 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1511
  %1513 = load i8, i8* %1512, align 1
  %1514 = or i8 %1509, %1513
  %1515 = icmp ne i8 %1514, 0
  %.317............ = zext i1 %1515 to i8
  store i8 %.317............, i8* %1452, align 1
  %1516 = or i64 %1453, 13
  %1517 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1516
  %1518 = load i8, i8* %1517, align 1
  %1519 = or i8 %1514, %1518
  %1520 = icmp ne i8 %1519, 0
  %.317............. = zext i1 %1520 to i8
  store i8 %.317............., i8* %1452, align 1
  %1521 = or i64 %1453, 14
  %1522 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1521
  %1523 = load i8, i8* %1522, align 1
  %1524 = or i8 %1519, %1523
  %1525 = icmp ne i8 %1524, 0
  %.317.............. = zext i1 %1525 to i8
  store i8 %.317.............., i8* %1452, align 1
  %1526 = or i64 %1453, 15
  %1527 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1526
  %1528 = load i8, i8* %1527, align 1
  %1529 = or i8 %1524, %1528
  %1530 = icmp ne i8 %1529, 0
  %.317............... = zext i1 %1530 to i8
  store i8 %.317..............., i8* %1452, align 1
  %indvars.iv.next224 = add nuw nsw i64 %indvars.iv223, 1
  %exitcond225 = icmp eq i64 %indvars.iv.next224, 16
  br i1 %exitcond225, label %1531, label %.preheader296

; <label>:1531:                                   ; preds = %.preheader296
  %1532 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 19
  %1533 = load i32, i32* %1532, align 4
  br label %1534

; <label>:1534:                                   ; preds = %1540, %1531
  %indvars.iv217 = phi i64 [ 0, %1531 ], [ %indvars.iv.next218, %1540 ]
  %1535 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 %indvars.iv217
  %1536 = load i8, i8* %1535, align 1
  %1537 = icmp eq i8 %1536, 0
  br i1 %1537, label %1539, label %1538

; <label>:1538:                                   ; preds = %1534
  tail call fastcc void @bsW(%struct.EState* %0, i32 1, i32 1)
  br label %1540

; <label>:1539:                                   ; preds = %1534
  tail call fastcc void @bsW(%struct.EState* %0, i32 1, i32 0)
  br label %1540

; <label>:1540:                                   ; preds = %1538, %1539
  %indvars.iv.next218 = add nuw nsw i64 %indvars.iv217, 1
  %exitcond219 = icmp eq i64 %indvars.iv.next218, 16
  br i1 %exitcond219, label %.preheader72.preheader, label %1534

.preheader72.preheader:                           ; preds = %1540
  br label %.preheader72

.preheader72:                                     ; preds = %.preheader72.preheader, %.loopexit71
  %indvars.iv214 = phi i64 [ %indvars.iv.next215, %.loopexit71 ], [ 0, %.preheader72.preheader ]
  %1541 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 %indvars.iv214
  %1542 = load i8, i8* %1541, align 1
  %1543 = icmp eq i8 %1542, 0
  br i1 %1543, label %.loopexit71, label %.preheader70

.preheader70:                                     ; preds = %.preheader72
  %1544 = shl i64 %indvars.iv214, 4
  br label %1545

; <label>:1545:                                   ; preds = %1552, %.preheader70
  %indvars.iv211 = phi i64 [ 0, %.preheader70 ], [ %indvars.iv.next212, %1552 ]
  %1546 = add nuw nsw i64 %indvars.iv211, %1544
  %1547 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %1546
  %1548 = load i8, i8* %1547, align 1
  %1549 = icmp eq i8 %1548, 0
  br i1 %1549, label %1551, label %1550

; <label>:1550:                                   ; preds = %1545
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 1, i32 1)
  br label %1552

; <label>:1551:                                   ; preds = %1545
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 1, i32 0)
  br label %1552

; <label>:1552:                                   ; preds = %1550, %1551
  %indvars.iv.next212 = add nuw nsw i64 %indvars.iv211, 1
  %exitcond213 = icmp eq i64 %indvars.iv.next212, 16
  br i1 %exitcond213, label %.loopexit71.loopexit, label %1545

.loopexit71.loopexit:                             ; preds = %1552
  br label %.loopexit71

.loopexit71:                                      ; preds = %.loopexit71.loopexit, %.preheader72
  %indvars.iv.next215 = add nuw nsw i64 %indvars.iv214, 1
  %exitcond216 = icmp eq i64 %indvars.iv.next215, 16
  br i1 %exitcond216, label %1553, label %.preheader72

; <label>:1553:                                   ; preds = %.loopexit71
  %1554 = load i32, i32* %10, align 8
  %1555 = icmp sgt i32 %1554, 2
  br i1 %1555, label %1556, label %1561

; <label>:1556:                                   ; preds = %1553
  %1557 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1558 = load i32, i32* %1532, align 4
  %1559 = sub nsw i32 %1558, %1533
  %1560 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1557, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.7, i64 0, i64 0), i32 %1559) #6
  br label %1561

; <label>:1561:                                   ; preds = %1556, %1553
  %1562 = load i32, i32* %1532, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 3, i32 %.346)
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 15, i32 %.136.lcssa)
  %1563 = icmp sgt i32 %.136.lcssa, 0
  br i1 %1563, label %.preheader69.preheader, label %._crit_edge112

.preheader69.preheader:                           ; preds = %1561
  %wide.trip.count = zext i32 %.136.lcssa to i64
  br label %.preheader69

.preheader69:                                     ; preds = %.preheader69.preheader, %._crit_edge110
  %indvars.iv209 = phi i64 [ %indvars.iv.next210, %._crit_edge110 ], [ 0, %.preheader69.preheader ]
  %1564 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 34, i64 %indvars.iv209
  %1565 = load i8, i8* %1564, align 1
  %1566 = icmp eq i8 %1565, 0
  br i1 %1566, label %._crit_edge110, label %.lr.ph109.preheader

.lr.ph109.preheader:                              ; preds = %.preheader69
  br label %.lr.ph109

.lr.ph109:                                        ; preds = %.lr.ph109.preheader, %.lr.ph109
  %.321108 = phi i32 [ %1567, %.lr.ph109 ], [ 0, %.lr.ph109.preheader ]
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 1, i32 1)
  %1567 = add nuw nsw i32 %.321108, 1
  %1568 = load i8, i8* %1564, align 1
  %1569 = zext i8 %1568 to i32
  %1570 = icmp slt i32 %1567, %1569
  br i1 %1570, label %.lr.ph109, label %._crit_edge110.loopexit

._crit_edge110.loopexit:                          ; preds = %.lr.ph109
  br label %._crit_edge110

._crit_edge110:                                   ; preds = %._crit_edge110.loopexit, %.preheader69
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 1, i32 0)
  %indvars.iv.next210 = add nuw nsw i64 %indvars.iv209, 1
  %exitcond = icmp eq i64 %indvars.iv.next210, %wide.trip.count
  br i1 %exitcond, label %._crit_edge112.loopexit, label %.preheader69

._crit_edge112.loopexit:                          ; preds = %._crit_edge110
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %1561
  %1571 = load i32, i32* %10, align 8
  %1572 = icmp sgt i32 %1571, 2
  br i1 %1572, label %1573, label %1578

; <label>:1573:                                   ; preds = %._crit_edge112
  %1574 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1575 = load i32, i32* %1532, align 4
  %1576 = sub nsw i32 %1575, %1562
  %1577 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1574, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.8, i64 0, i64 0), i32 %1576) #6
  br label %1578

; <label>:1578:                                   ; preds = %1573, %._crit_edge112
  %1579 = load i32, i32* %1532, align 4
  %1580 = icmp sgt i32 %24, -2
  br i1 %1580, label %.split.us.preheader, label %.split.preheader

.split.preheader:                                 ; preds = %1578
  %1581 = sext i32 %.346 to i64
  br label %.split

.split.us.preheader:                              ; preds = %1578
  %1582 = sext i32 %25 to i64
  %1583 = sext i32 %.346 to i64
  br label %.split.us

.split.us:                                        ; preds = %.split.us.preheader, %._crit_edge106.us
  %indvars.iv205 = phi i64 [ 0, %.split.us.preheader ], [ %indvars.iv.next206, %._crit_edge106.us ]
  %1584 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv205, i64 0
  %1585 = load i8, i8* %1584, align 2
  %1586 = zext i8 %1585 to i32
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 5, i32 %1586)
  br label %.preheader68.us

._crit_edge102.us.loopexit:                       ; preds = %.lr.ph101.us
  br label %._crit_edge102.us

._crit_edge102.us:                                ; preds = %._crit_edge102.us.loopexit, %.preheader67.us
  %.2.lcssa.us = phi i32 [ %.1.lcssa.us, %.preheader67.us ], [ %1588, %._crit_edge102.us.loopexit ]
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 1, i32 0)
  %indvars.iv.next204 = add nuw nsw i64 %indvars.iv203, 1
  %1587 = icmp slt i64 %indvars.iv.next204, %1582
  br i1 %1587, label %.preheader68.us, label %._crit_edge106.us

.lr.ph101.us:                                     ; preds = %.lr.ph101.us.preheader, %.lr.ph101.us
  %.2100.us = phi i32 [ %1588, %.lr.ph101.us ], [ %.1.lcssa.us, %.lr.ph101.us.preheader ]
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 2, i32 3)
  %1588 = add nsw i32 %.2100.us, -1
  %1589 = load i8, i8* %1599, align 1
  %1590 = zext i8 %1589 to i32
  %1591 = icmp sgt i32 %1588, %1590
  br i1 %1591, label %.lr.ph101.us, label %._crit_edge102.us.loopexit

.lr.ph97.us:                                      ; preds = %.lr.ph97.us.preheader, %.lr.ph97.us
  %.196.us = phi i32 [ %1592, %.lr.ph97.us ], [ %.0105.us, %.lr.ph97.us.preheader ]
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 2, i32 2)
  %1592 = add nsw i32 %.196.us, 1
  %1593 = load i8, i8* %1599, align 1
  %1594 = zext i8 %1593 to i32
  %1595 = icmp slt i32 %1592, %1594
  br i1 %1595, label %.lr.ph97.us, label %.preheader67.us.loopexit

.preheader67.us.loopexit:                         ; preds = %.lr.ph97.us
  br label %.preheader67.us

.preheader67.us:                                  ; preds = %.preheader67.us.loopexit, %.preheader68.us
  %.1.lcssa.us = phi i32 [ %.0105.us, %.preheader68.us ], [ %1592, %.preheader67.us.loopexit ]
  %1596 = load i8, i8* %1599, align 1
  %1597 = zext i8 %1596 to i32
  %1598 = icmp sgt i32 %.1.lcssa.us, %1597
  br i1 %1598, label %.lr.ph101.us.preheader, label %._crit_edge102.us

.lr.ph101.us.preheader:                           ; preds = %.preheader67.us
  br label %.lr.ph101.us

.preheader68.us:                                  ; preds = %.split.us, %._crit_edge102.us
  %indvars.iv203 = phi i64 [ 0, %.split.us ], [ %indvars.iv.next204, %._crit_edge102.us ]
  %.0105.us = phi i32 [ %1586, %.split.us ], [ %.2.lcssa.us, %._crit_edge102.us ]
  %1599 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv205, i64 %indvars.iv203
  %1600 = load i8, i8* %1599, align 1
  %1601 = zext i8 %1600 to i32
  %1602 = icmp slt i32 %.0105.us, %1601
  br i1 %1602, label %.lr.ph97.us.preheader, label %.preheader67.us

.lr.ph97.us.preheader:                            ; preds = %.preheader68.us
  br label %.lr.ph97.us

._crit_edge106.us:                                ; preds = %._crit_edge102.us
  %indvars.iv.next206 = add nuw nsw i64 %indvars.iv205, 1
  %1603 = icmp slt i64 %indvars.iv.next206, %1583
  br i1 %1603, label %.split.us, label %.us-lcssa.us.loopexit

.split:                                           ; preds = %.split.preheader, %.split
  %indvars.iv207 = phi i64 [ 0, %.split.preheader ], [ %indvars.iv.next208, %.split ]
  %1604 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %indvars.iv207, i64 0
  %1605 = load i8, i8* %1604, align 2
  %1606 = zext i8 %1605 to i32
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 5, i32 %1606)
  %indvars.iv.next208 = add nuw nsw i64 %indvars.iv207, 1
  %1607 = icmp slt i64 %indvars.iv.next208, %1581
  br i1 %1607, label %.split, label %.us-lcssa.us.loopexit367

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge106.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit367:                         ; preds = %.split
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit367, %.us-lcssa.us.loopexit
  %1608 = load i32, i32* %10, align 8
  %1609 = icmp sgt i32 %1608, 2
  br i1 %1609, label %1610, label %1615

; <label>:1610:                                   ; preds = %.us-lcssa.us
  %1611 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1612 = load i32, i32* %1532, align 4
  %1613 = sub nsw i32 %1612, %1579
  %1614 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1611, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i32 %1613) #6
  br label %1615

; <label>:1615:                                   ; preds = %1610, %.us-lcssa.us
  %1616 = load i32, i32* %1532, align 4
  %1617 = load i32, i32* %27, align 4
  %1618 = icmp sgt i32 %1617, 0
  br i1 %1618, label %.lr.ph95, label %._crit_edge

.lr.ph95:                                         ; preds = %1615
  %1619 = icmp eq i32 %.346, 6
  br label %1620

; <label>:1620:                                   ; preds = %.lr.ph95, %.loopexit
  %indvars.iv201 = phi i64 [ 0, %.lr.ph95 ], [ %indvars.iv.next202, %.loopexit ]
  %1621 = phi i32 [ %1617, %.lr.ph95 ], [ %2149, %.loopexit ]
  %.22494 = phi i32 [ 0, %.lr.ph95 ], [ %2148, %.loopexit ]
  %1622 = add nsw i32 %.22494, 49
  %1623 = icmp slt i32 %1622, %1621
  %1624 = add nsw i32 %1621, -1
  %.66 = select i1 %1623, i32 %1622, i32 %1624
  %1625 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 33, i64 %indvars.iv201
  %1626 = load i8, i8* %1625, align 1
  %1627 = zext i8 %1626 to i32
  %1628 = icmp slt i32 %1627, %.346
  br i1 %1628, label %1630, label %1629

; <label>:1629:                                   ; preds = %1620
  tail call void @BZ2_bz__AssertH__fail(i32 3006) #4
  br label %1630

; <label>:1630:                                   ; preds = %1629, %1620
  %1631 = sub nsw i32 %.66, %.22494
  %1632 = icmp eq i32 %1631, 49
  %or.cond64 = and i1 %1619, %1632
  br i1 %or.cond64, label %1636, label %.preheader

.preheader:                                       ; preds = %1630
  %1633 = icmp slt i32 %.66, %.22494
  br i1 %1633, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %1634 = sext i32 %.22494 to i64
  %1635 = sext i32 %.66 to i64
  br label %.lr.ph

; <label>:1636:                                   ; preds = %1630
  %1637 = load i8, i8* %1625, align 1
  %1638 = zext i8 %1637 to i64
  %1639 = sext i32 %.22494 to i64
  %1640 = getelementptr inbounds i16, i16* %9, i64 %1639
  %1641 = load i16, i16* %1640, align 2
  %1642 = zext i16 %1641 to i64
  %1643 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1642
  %1644 = load i8, i8* %1643, align 1
  %1645 = zext i8 %1644 to i32
  %1646 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1642
  %1647 = load i32, i32* %1646, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1645, i32 %1647)
  %1648 = add nsw i32 %.22494, 1
  %1649 = sext i32 %1648 to i64
  %1650 = getelementptr inbounds i16, i16* %9, i64 %1649
  %1651 = load i16, i16* %1650, align 2
  %1652 = zext i16 %1651 to i64
  %1653 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1652
  %1654 = load i8, i8* %1653, align 1
  %1655 = zext i8 %1654 to i32
  %1656 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1652
  %1657 = load i32, i32* %1656, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1655, i32 %1657)
  %1658 = add nsw i32 %.22494, 2
  %1659 = sext i32 %1658 to i64
  %1660 = getelementptr inbounds i16, i16* %9, i64 %1659
  %1661 = load i16, i16* %1660, align 2
  %1662 = zext i16 %1661 to i64
  %1663 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1662
  %1664 = load i8, i8* %1663, align 1
  %1665 = zext i8 %1664 to i32
  %1666 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1662
  %1667 = load i32, i32* %1666, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1665, i32 %1667)
  %1668 = add nsw i32 %.22494, 3
  %1669 = sext i32 %1668 to i64
  %1670 = getelementptr inbounds i16, i16* %9, i64 %1669
  %1671 = load i16, i16* %1670, align 2
  %1672 = zext i16 %1671 to i64
  %1673 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1672
  %1674 = load i8, i8* %1673, align 1
  %1675 = zext i8 %1674 to i32
  %1676 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1672
  %1677 = load i32, i32* %1676, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1675, i32 %1677)
  %1678 = add nsw i32 %.22494, 4
  %1679 = sext i32 %1678 to i64
  %1680 = getelementptr inbounds i16, i16* %9, i64 %1679
  %1681 = load i16, i16* %1680, align 2
  %1682 = zext i16 %1681 to i64
  %1683 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1682
  %1684 = load i8, i8* %1683, align 1
  %1685 = zext i8 %1684 to i32
  %1686 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1682
  %1687 = load i32, i32* %1686, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1685, i32 %1687)
  %1688 = add nsw i32 %.22494, 5
  %1689 = sext i32 %1688 to i64
  %1690 = getelementptr inbounds i16, i16* %9, i64 %1689
  %1691 = load i16, i16* %1690, align 2
  %1692 = zext i16 %1691 to i64
  %1693 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1692
  %1694 = load i8, i8* %1693, align 1
  %1695 = zext i8 %1694 to i32
  %1696 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1692
  %1697 = load i32, i32* %1696, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1695, i32 %1697)
  %1698 = add nsw i32 %.22494, 6
  %1699 = sext i32 %1698 to i64
  %1700 = getelementptr inbounds i16, i16* %9, i64 %1699
  %1701 = load i16, i16* %1700, align 2
  %1702 = zext i16 %1701 to i64
  %1703 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1702
  %1704 = load i8, i8* %1703, align 1
  %1705 = zext i8 %1704 to i32
  %1706 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1702
  %1707 = load i32, i32* %1706, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1705, i32 %1707)
  %1708 = add nsw i32 %.22494, 7
  %1709 = sext i32 %1708 to i64
  %1710 = getelementptr inbounds i16, i16* %9, i64 %1709
  %1711 = load i16, i16* %1710, align 2
  %1712 = zext i16 %1711 to i64
  %1713 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1712
  %1714 = load i8, i8* %1713, align 1
  %1715 = zext i8 %1714 to i32
  %1716 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1712
  %1717 = load i32, i32* %1716, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1715, i32 %1717)
  %1718 = add nsw i32 %.22494, 8
  %1719 = sext i32 %1718 to i64
  %1720 = getelementptr inbounds i16, i16* %9, i64 %1719
  %1721 = load i16, i16* %1720, align 2
  %1722 = zext i16 %1721 to i64
  %1723 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1722
  %1724 = load i8, i8* %1723, align 1
  %1725 = zext i8 %1724 to i32
  %1726 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1722
  %1727 = load i32, i32* %1726, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1725, i32 %1727)
  %1728 = add nsw i32 %.22494, 9
  %1729 = sext i32 %1728 to i64
  %1730 = getelementptr inbounds i16, i16* %9, i64 %1729
  %1731 = load i16, i16* %1730, align 2
  %1732 = zext i16 %1731 to i64
  %1733 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1732
  %1734 = load i8, i8* %1733, align 1
  %1735 = zext i8 %1734 to i32
  %1736 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1732
  %1737 = load i32, i32* %1736, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1735, i32 %1737)
  %1738 = add nsw i32 %.22494, 10
  %1739 = sext i32 %1738 to i64
  %1740 = getelementptr inbounds i16, i16* %9, i64 %1739
  %1741 = load i16, i16* %1740, align 2
  %1742 = zext i16 %1741 to i64
  %1743 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1742
  %1744 = load i8, i8* %1743, align 1
  %1745 = zext i8 %1744 to i32
  %1746 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1742
  %1747 = load i32, i32* %1746, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1745, i32 %1747)
  %1748 = add nsw i32 %.22494, 11
  %1749 = sext i32 %1748 to i64
  %1750 = getelementptr inbounds i16, i16* %9, i64 %1749
  %1751 = load i16, i16* %1750, align 2
  %1752 = zext i16 %1751 to i64
  %1753 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1752
  %1754 = load i8, i8* %1753, align 1
  %1755 = zext i8 %1754 to i32
  %1756 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1752
  %1757 = load i32, i32* %1756, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1755, i32 %1757)
  %1758 = add nsw i32 %.22494, 12
  %1759 = sext i32 %1758 to i64
  %1760 = getelementptr inbounds i16, i16* %9, i64 %1759
  %1761 = load i16, i16* %1760, align 2
  %1762 = zext i16 %1761 to i64
  %1763 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1762
  %1764 = load i8, i8* %1763, align 1
  %1765 = zext i8 %1764 to i32
  %1766 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1762
  %1767 = load i32, i32* %1766, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1765, i32 %1767)
  %1768 = add nsw i32 %.22494, 13
  %1769 = sext i32 %1768 to i64
  %1770 = getelementptr inbounds i16, i16* %9, i64 %1769
  %1771 = load i16, i16* %1770, align 2
  %1772 = zext i16 %1771 to i64
  %1773 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1772
  %1774 = load i8, i8* %1773, align 1
  %1775 = zext i8 %1774 to i32
  %1776 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1772
  %1777 = load i32, i32* %1776, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1775, i32 %1777)
  %1778 = add nsw i32 %.22494, 14
  %1779 = sext i32 %1778 to i64
  %1780 = getelementptr inbounds i16, i16* %9, i64 %1779
  %1781 = load i16, i16* %1780, align 2
  %1782 = zext i16 %1781 to i64
  %1783 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1782
  %1784 = load i8, i8* %1783, align 1
  %1785 = zext i8 %1784 to i32
  %1786 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1782
  %1787 = load i32, i32* %1786, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1785, i32 %1787)
  %1788 = add nsw i32 %.22494, 15
  %1789 = sext i32 %1788 to i64
  %1790 = getelementptr inbounds i16, i16* %9, i64 %1789
  %1791 = load i16, i16* %1790, align 2
  %1792 = zext i16 %1791 to i64
  %1793 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1792
  %1794 = load i8, i8* %1793, align 1
  %1795 = zext i8 %1794 to i32
  %1796 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1792
  %1797 = load i32, i32* %1796, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1795, i32 %1797)
  %1798 = add nsw i32 %.22494, 16
  %1799 = sext i32 %1798 to i64
  %1800 = getelementptr inbounds i16, i16* %9, i64 %1799
  %1801 = load i16, i16* %1800, align 2
  %1802 = zext i16 %1801 to i64
  %1803 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1802
  %1804 = load i8, i8* %1803, align 1
  %1805 = zext i8 %1804 to i32
  %1806 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1802
  %1807 = load i32, i32* %1806, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1805, i32 %1807)
  %1808 = add nsw i32 %.22494, 17
  %1809 = sext i32 %1808 to i64
  %1810 = getelementptr inbounds i16, i16* %9, i64 %1809
  %1811 = load i16, i16* %1810, align 2
  %1812 = zext i16 %1811 to i64
  %1813 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1812
  %1814 = load i8, i8* %1813, align 1
  %1815 = zext i8 %1814 to i32
  %1816 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1812
  %1817 = load i32, i32* %1816, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1815, i32 %1817)
  %1818 = add nsw i32 %.22494, 18
  %1819 = sext i32 %1818 to i64
  %1820 = getelementptr inbounds i16, i16* %9, i64 %1819
  %1821 = load i16, i16* %1820, align 2
  %1822 = zext i16 %1821 to i64
  %1823 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1822
  %1824 = load i8, i8* %1823, align 1
  %1825 = zext i8 %1824 to i32
  %1826 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1822
  %1827 = load i32, i32* %1826, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1825, i32 %1827)
  %1828 = add nsw i32 %.22494, 19
  %1829 = sext i32 %1828 to i64
  %1830 = getelementptr inbounds i16, i16* %9, i64 %1829
  %1831 = load i16, i16* %1830, align 2
  %1832 = zext i16 %1831 to i64
  %1833 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1832
  %1834 = load i8, i8* %1833, align 1
  %1835 = zext i8 %1834 to i32
  %1836 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1832
  %1837 = load i32, i32* %1836, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1835, i32 %1837)
  %1838 = add nsw i32 %.22494, 20
  %1839 = sext i32 %1838 to i64
  %1840 = getelementptr inbounds i16, i16* %9, i64 %1839
  %1841 = load i16, i16* %1840, align 2
  %1842 = zext i16 %1841 to i64
  %1843 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1842
  %1844 = load i8, i8* %1843, align 1
  %1845 = zext i8 %1844 to i32
  %1846 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1842
  %1847 = load i32, i32* %1846, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1845, i32 %1847)
  %1848 = add nsw i32 %.22494, 21
  %1849 = sext i32 %1848 to i64
  %1850 = getelementptr inbounds i16, i16* %9, i64 %1849
  %1851 = load i16, i16* %1850, align 2
  %1852 = zext i16 %1851 to i64
  %1853 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1852
  %1854 = load i8, i8* %1853, align 1
  %1855 = zext i8 %1854 to i32
  %1856 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1852
  %1857 = load i32, i32* %1856, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1855, i32 %1857)
  %1858 = add nsw i32 %.22494, 22
  %1859 = sext i32 %1858 to i64
  %1860 = getelementptr inbounds i16, i16* %9, i64 %1859
  %1861 = load i16, i16* %1860, align 2
  %1862 = zext i16 %1861 to i64
  %1863 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1862
  %1864 = load i8, i8* %1863, align 1
  %1865 = zext i8 %1864 to i32
  %1866 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1862
  %1867 = load i32, i32* %1866, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1865, i32 %1867)
  %1868 = add nsw i32 %.22494, 23
  %1869 = sext i32 %1868 to i64
  %1870 = getelementptr inbounds i16, i16* %9, i64 %1869
  %1871 = load i16, i16* %1870, align 2
  %1872 = zext i16 %1871 to i64
  %1873 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1872
  %1874 = load i8, i8* %1873, align 1
  %1875 = zext i8 %1874 to i32
  %1876 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1872
  %1877 = load i32, i32* %1876, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1875, i32 %1877)
  %1878 = add nsw i32 %.22494, 24
  %1879 = sext i32 %1878 to i64
  %1880 = getelementptr inbounds i16, i16* %9, i64 %1879
  %1881 = load i16, i16* %1880, align 2
  %1882 = zext i16 %1881 to i64
  %1883 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1882
  %1884 = load i8, i8* %1883, align 1
  %1885 = zext i8 %1884 to i32
  %1886 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1882
  %1887 = load i32, i32* %1886, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1885, i32 %1887)
  %1888 = add nsw i32 %.22494, 25
  %1889 = sext i32 %1888 to i64
  %1890 = getelementptr inbounds i16, i16* %9, i64 %1889
  %1891 = load i16, i16* %1890, align 2
  %1892 = zext i16 %1891 to i64
  %1893 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1892
  %1894 = load i8, i8* %1893, align 1
  %1895 = zext i8 %1894 to i32
  %1896 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1892
  %1897 = load i32, i32* %1896, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1895, i32 %1897)
  %1898 = add nsw i32 %.22494, 26
  %1899 = sext i32 %1898 to i64
  %1900 = getelementptr inbounds i16, i16* %9, i64 %1899
  %1901 = load i16, i16* %1900, align 2
  %1902 = zext i16 %1901 to i64
  %1903 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1902
  %1904 = load i8, i8* %1903, align 1
  %1905 = zext i8 %1904 to i32
  %1906 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1902
  %1907 = load i32, i32* %1906, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1905, i32 %1907)
  %1908 = add nsw i32 %.22494, 27
  %1909 = sext i32 %1908 to i64
  %1910 = getelementptr inbounds i16, i16* %9, i64 %1909
  %1911 = load i16, i16* %1910, align 2
  %1912 = zext i16 %1911 to i64
  %1913 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1912
  %1914 = load i8, i8* %1913, align 1
  %1915 = zext i8 %1914 to i32
  %1916 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1912
  %1917 = load i32, i32* %1916, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1915, i32 %1917)
  %1918 = add nsw i32 %.22494, 28
  %1919 = sext i32 %1918 to i64
  %1920 = getelementptr inbounds i16, i16* %9, i64 %1919
  %1921 = load i16, i16* %1920, align 2
  %1922 = zext i16 %1921 to i64
  %1923 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1922
  %1924 = load i8, i8* %1923, align 1
  %1925 = zext i8 %1924 to i32
  %1926 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1922
  %1927 = load i32, i32* %1926, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1925, i32 %1927)
  %1928 = add nsw i32 %.22494, 29
  %1929 = sext i32 %1928 to i64
  %1930 = getelementptr inbounds i16, i16* %9, i64 %1929
  %1931 = load i16, i16* %1930, align 2
  %1932 = zext i16 %1931 to i64
  %1933 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1932
  %1934 = load i8, i8* %1933, align 1
  %1935 = zext i8 %1934 to i32
  %1936 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1932
  %1937 = load i32, i32* %1936, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1935, i32 %1937)
  %1938 = add nsw i32 %.22494, 30
  %1939 = sext i32 %1938 to i64
  %1940 = getelementptr inbounds i16, i16* %9, i64 %1939
  %1941 = load i16, i16* %1940, align 2
  %1942 = zext i16 %1941 to i64
  %1943 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1942
  %1944 = load i8, i8* %1943, align 1
  %1945 = zext i8 %1944 to i32
  %1946 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1942
  %1947 = load i32, i32* %1946, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1945, i32 %1947)
  %1948 = add nsw i32 %.22494, 31
  %1949 = sext i32 %1948 to i64
  %1950 = getelementptr inbounds i16, i16* %9, i64 %1949
  %1951 = load i16, i16* %1950, align 2
  %1952 = zext i16 %1951 to i64
  %1953 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1952
  %1954 = load i8, i8* %1953, align 1
  %1955 = zext i8 %1954 to i32
  %1956 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1952
  %1957 = load i32, i32* %1956, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1955, i32 %1957)
  %1958 = add nsw i32 %.22494, 32
  %1959 = sext i32 %1958 to i64
  %1960 = getelementptr inbounds i16, i16* %9, i64 %1959
  %1961 = load i16, i16* %1960, align 2
  %1962 = zext i16 %1961 to i64
  %1963 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1962
  %1964 = load i8, i8* %1963, align 1
  %1965 = zext i8 %1964 to i32
  %1966 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1962
  %1967 = load i32, i32* %1966, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1965, i32 %1967)
  %1968 = add nsw i32 %.22494, 33
  %1969 = sext i32 %1968 to i64
  %1970 = getelementptr inbounds i16, i16* %9, i64 %1969
  %1971 = load i16, i16* %1970, align 2
  %1972 = zext i16 %1971 to i64
  %1973 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1972
  %1974 = load i8, i8* %1973, align 1
  %1975 = zext i8 %1974 to i32
  %1976 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1972
  %1977 = load i32, i32* %1976, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1975, i32 %1977)
  %1978 = add nsw i32 %.22494, 34
  %1979 = sext i32 %1978 to i64
  %1980 = getelementptr inbounds i16, i16* %9, i64 %1979
  %1981 = load i16, i16* %1980, align 2
  %1982 = zext i16 %1981 to i64
  %1983 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1982
  %1984 = load i8, i8* %1983, align 1
  %1985 = zext i8 %1984 to i32
  %1986 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1982
  %1987 = load i32, i32* %1986, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1985, i32 %1987)
  %1988 = add nsw i32 %.22494, 35
  %1989 = sext i32 %1988 to i64
  %1990 = getelementptr inbounds i16, i16* %9, i64 %1989
  %1991 = load i16, i16* %1990, align 2
  %1992 = zext i16 %1991 to i64
  %1993 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %1992
  %1994 = load i8, i8* %1993, align 1
  %1995 = zext i8 %1994 to i32
  %1996 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %1992
  %1997 = load i32, i32* %1996, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %1995, i32 %1997)
  %1998 = add nsw i32 %.22494, 36
  %1999 = sext i32 %1998 to i64
  %2000 = getelementptr inbounds i16, i16* %9, i64 %1999
  %2001 = load i16, i16* %2000, align 2
  %2002 = zext i16 %2001 to i64
  %2003 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2002
  %2004 = load i8, i8* %2003, align 1
  %2005 = zext i8 %2004 to i32
  %2006 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2002
  %2007 = load i32, i32* %2006, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2005, i32 %2007)
  %2008 = add nsw i32 %.22494, 37
  %2009 = sext i32 %2008 to i64
  %2010 = getelementptr inbounds i16, i16* %9, i64 %2009
  %2011 = load i16, i16* %2010, align 2
  %2012 = zext i16 %2011 to i64
  %2013 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2012
  %2014 = load i8, i8* %2013, align 1
  %2015 = zext i8 %2014 to i32
  %2016 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2012
  %2017 = load i32, i32* %2016, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2015, i32 %2017)
  %2018 = add nsw i32 %.22494, 38
  %2019 = sext i32 %2018 to i64
  %2020 = getelementptr inbounds i16, i16* %9, i64 %2019
  %2021 = load i16, i16* %2020, align 2
  %2022 = zext i16 %2021 to i64
  %2023 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2022
  %2024 = load i8, i8* %2023, align 1
  %2025 = zext i8 %2024 to i32
  %2026 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2022
  %2027 = load i32, i32* %2026, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2025, i32 %2027)
  %2028 = add nsw i32 %.22494, 39
  %2029 = sext i32 %2028 to i64
  %2030 = getelementptr inbounds i16, i16* %9, i64 %2029
  %2031 = load i16, i16* %2030, align 2
  %2032 = zext i16 %2031 to i64
  %2033 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2032
  %2034 = load i8, i8* %2033, align 1
  %2035 = zext i8 %2034 to i32
  %2036 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2032
  %2037 = load i32, i32* %2036, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2035, i32 %2037)
  %2038 = add nsw i32 %.22494, 40
  %2039 = sext i32 %2038 to i64
  %2040 = getelementptr inbounds i16, i16* %9, i64 %2039
  %2041 = load i16, i16* %2040, align 2
  %2042 = zext i16 %2041 to i64
  %2043 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2042
  %2044 = load i8, i8* %2043, align 1
  %2045 = zext i8 %2044 to i32
  %2046 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2042
  %2047 = load i32, i32* %2046, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2045, i32 %2047)
  %2048 = add nsw i32 %.22494, 41
  %2049 = sext i32 %2048 to i64
  %2050 = getelementptr inbounds i16, i16* %9, i64 %2049
  %2051 = load i16, i16* %2050, align 2
  %2052 = zext i16 %2051 to i64
  %2053 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2052
  %2054 = load i8, i8* %2053, align 1
  %2055 = zext i8 %2054 to i32
  %2056 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2052
  %2057 = load i32, i32* %2056, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2055, i32 %2057)
  %2058 = add nsw i32 %.22494, 42
  %2059 = sext i32 %2058 to i64
  %2060 = getelementptr inbounds i16, i16* %9, i64 %2059
  %2061 = load i16, i16* %2060, align 2
  %2062 = zext i16 %2061 to i64
  %2063 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2062
  %2064 = load i8, i8* %2063, align 1
  %2065 = zext i8 %2064 to i32
  %2066 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2062
  %2067 = load i32, i32* %2066, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2065, i32 %2067)
  %2068 = add nsw i32 %.22494, 43
  %2069 = sext i32 %2068 to i64
  %2070 = getelementptr inbounds i16, i16* %9, i64 %2069
  %2071 = load i16, i16* %2070, align 2
  %2072 = zext i16 %2071 to i64
  %2073 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2072
  %2074 = load i8, i8* %2073, align 1
  %2075 = zext i8 %2074 to i32
  %2076 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2072
  %2077 = load i32, i32* %2076, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2075, i32 %2077)
  %2078 = add nsw i32 %.22494, 44
  %2079 = sext i32 %2078 to i64
  %2080 = getelementptr inbounds i16, i16* %9, i64 %2079
  %2081 = load i16, i16* %2080, align 2
  %2082 = zext i16 %2081 to i64
  %2083 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2082
  %2084 = load i8, i8* %2083, align 1
  %2085 = zext i8 %2084 to i32
  %2086 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2082
  %2087 = load i32, i32* %2086, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2085, i32 %2087)
  %2088 = add nsw i32 %.22494, 45
  %2089 = sext i32 %2088 to i64
  %2090 = getelementptr inbounds i16, i16* %9, i64 %2089
  %2091 = load i16, i16* %2090, align 2
  %2092 = zext i16 %2091 to i64
  %2093 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2092
  %2094 = load i8, i8* %2093, align 1
  %2095 = zext i8 %2094 to i32
  %2096 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2092
  %2097 = load i32, i32* %2096, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2095, i32 %2097)
  %2098 = add nsw i32 %.22494, 46
  %2099 = sext i32 %2098 to i64
  %2100 = getelementptr inbounds i16, i16* %9, i64 %2099
  %2101 = load i16, i16* %2100, align 2
  %2102 = zext i16 %2101 to i64
  %2103 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2102
  %2104 = load i8, i8* %2103, align 1
  %2105 = zext i8 %2104 to i32
  %2106 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2102
  %2107 = load i32, i32* %2106, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2105, i32 %2107)
  %2108 = add nsw i32 %.22494, 47
  %2109 = sext i32 %2108 to i64
  %2110 = getelementptr inbounds i16, i16* %9, i64 %2109
  %2111 = load i16, i16* %2110, align 2
  %2112 = zext i16 %2111 to i64
  %2113 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2112
  %2114 = load i8, i8* %2113, align 1
  %2115 = zext i8 %2114 to i32
  %2116 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2112
  %2117 = load i32, i32* %2116, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2115, i32 %2117)
  %2118 = add nsw i32 %.22494, 48
  %2119 = sext i32 %2118 to i64
  %2120 = getelementptr inbounds i16, i16* %9, i64 %2119
  %2121 = load i16, i16* %2120, align 2
  %2122 = zext i16 %2121 to i64
  %2123 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2122
  %2124 = load i8, i8* %2123, align 1
  %2125 = zext i8 %2124 to i32
  %2126 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2122
  %2127 = load i32, i32* %2126, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2125, i32 %2127)
  %2128 = sext i32 %1622 to i64
  %2129 = getelementptr inbounds i16, i16* %9, i64 %2128
  %2130 = load i16, i16* %2129, align 2
  %2131 = zext i16 %2130 to i64
  %2132 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %1638, i64 %2131
  %2133 = load i8, i8* %2132, align 1
  %2134 = zext i8 %2133 to i32
  %2135 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %1638, i64 %2131
  %2136 = load i32, i32* %2135, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2134, i32 %2136)
  br label %.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %1634, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %2137 = load i8, i8* %1625, align 1
  %2138 = zext i8 %2137 to i64
  %2139 = getelementptr inbounds i16, i16* %9, i64 %indvars.iv
  %2140 = load i16, i16* %2139, align 2
  %2141 = zext i16 %2140 to i64
  %2142 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 %2138, i64 %2141
  %2143 = load i8, i8* %2142, align 1
  %2144 = zext i8 %2143 to i32
  %2145 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 36, i64 %2138, i64 %2141
  %2146 = load i32, i32* %2145, align 4
  tail call fastcc void @bsW(%struct.EState* nonnull %0, i32 %2144, i32 %2146)
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %2147 = icmp slt i64 %indvars.iv, %1635
  br i1 %2147, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %1636
  %2148 = add nsw i32 %.66, 1
  %indvars.iv.next202 = add nuw i64 %indvars.iv201, 1
  %2149 = load i32, i32* %27, align 4
  %2150 = icmp slt i32 %2148, %2149
  br i1 %2150, label %1620, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  %2151 = trunc i64 %indvars.iv.next202 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1615
  %.042.lcssa = phi i32 [ 0, %1615 ], [ %2151, %._crit_edge.loopexit ]
  %2152 = icmp eq i32 %.042.lcssa, %.136.lcssa
  br i1 %2152, label %2154, label %2153

; <label>:2153:                                   ; preds = %._crit_edge
  tail call void @BZ2_bz__AssertH__fail(i32 3007) #4
  br label %2154

; <label>:2154:                                   ; preds = %2153, %._crit_edge
  %2155 = load i32, i32* %10, align 8
  %2156 = icmp sgt i32 %2155, 2
  br i1 %2156, label %2157, label %2162

; <label>:2157:                                   ; preds = %2154
  %2158 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2159 = load i32, i32* %1532, align 4
  %2160 = sub nsw i32 %2159, %1616
  %2161 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2158, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i64 0, i64 0), i32 %2160) #6
  br label %2162

; <label>:2162:                                   ; preds = %2157, %2154
  ret void

.preheader77.1:                                   ; preds = %1393, %1395
  %2163 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 0
  store i8 0, i8* %2163, align 1
  %2164 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 1
  store i8 1, i8* %2164, align 1
  %2165 = icmp sgt i32 %.346, 2
  br i1 %2165, label %.preheader77.2, label %.preheader76

.preheader77.2:                                   ; preds = %.preheader77.1
  %2166 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 2
  store i8 2, i8* %2166, align 1
  %2167 = icmp eq i32 %.346, 3
  br i1 %2167, label %.preheader76, label %.preheader77.3

.preheader77.3:                                   ; preds = %.preheader77.2
  %2168 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 3
  store i8 3, i8* %2168, align 1
  %2169 = icmp sgt i32 %.346, 4
  br i1 %2169, label %.preheader77.4, label %.preheader76

.preheader77.4:                                   ; preds = %.preheader77.3
  %2170 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 4
  store i8 4, i8* %2170, align 1
  %2171 = icmp eq i32 %.346, 5
  br i1 %2171, label %.preheader76, label %.preheader77.5

.preheader77.5:                                   ; preds = %.preheader77.4
  %2172 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 5
  store i8 5, i8* %2172, align 1
  br label %.preheader76

._crit_edge139.us.1:                              ; preds = %.preheader86
  call void @llvm.memset.p0i8.i64(i8* %scevgep244, i8 0, i64 %114, i32 4, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %scevgep244.1, i8 0, i64 %114, i32 4, i1 false)
  br i1 %122, label %._crit_edge139.us.2, label %.us-lcssa141.us

._crit_edge139.us.2:                              ; preds = %._crit_edge139.us.1
  call void @llvm.memset.p0i8.i64(i8* %scevgep244.2, i8 0, i64 %114, i32 4, i1 false)
  br i1 %123, label %._crit_edge139.us.3, label %.us-lcssa141.us

._crit_edge139.us.3:                              ; preds = %._crit_edge139.us.2
  call void @llvm.memset.p0i8.i64(i8* %scevgep244.3, i8 0, i64 %114, i32 4, i1 false)
  br i1 %124, label %._crit_edge139.us.4, label %.us-lcssa141.us

._crit_edge139.us.4:                              ; preds = %._crit_edge139.us.3
  call void @llvm.memset.p0i8.i64(i8* %scevgep244.4, i8 0, i64 %114, i32 4, i1 false)
  br i1 %125, label %._crit_edge139.us.5, label %.us-lcssa141.us

._crit_edge139.us.5:                              ; preds = %._crit_edge139.us.4
  call void @llvm.memset.p0i8.i64(i8* %scevgep244.5, i8 0, i64 %114, i32 4, i1 false)
  br label %.us-lcssa141.us

; <label>:2173:                                   ; preds = %.lr.ph147.preheader, %930
  %2174 = phi i16 [ %.promoted315, %.lr.ph147.preheader ], [ %931, %930 ]
  %2175 = phi i16 [ %.promoted313, %.lr.ph147.preheader ], [ %932, %930 ]
  %2176 = phi i16 [ %.promoted311, %.lr.ph147.preheader ], [ %933, %930 ]
  %2177 = phi i16 [ %.promoted309, %.lr.ph147.preheader ], [ %934, %930 ]
  %2178 = phi i16 [ %.promoted307, %.lr.ph147.preheader ], [ %2190, %930 ]
  %2179 = phi i16 [ %.promoted, %.lr.ph147.preheader ], [ %2186, %930 ]
  %indvars.iv255 = phi i64 [ %223, %.lr.ph147.preheader ], [ %indvars.iv.next256, %930 ]
  %2180 = getelementptr inbounds i16, i16* %9, i64 %indvars.iv255
  %2181 = load i16, i16* %2180, align 2
  %2182 = zext i16 %2181 to i64
  %2183 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 0, i64 %2182
  %2184 = load i8, i8* %2183, align 1
  %2185 = zext i8 %2184 to i16
  %2186 = add i16 %2179, %2185
  %2187 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 1, i64 %2182
  %2188 = load i8, i8* %2187, align 1
  %2189 = zext i8 %2188 to i16
  %2190 = add i16 %2178, %2189
  br i1 %138, label %2191, label %930

; <label>:2191:                                   ; preds = %2173
  %2192 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 2, i64 %2182
  %2193 = load i8, i8* %2192, align 1
  %2194 = zext i8 %2193 to i16
  %2195 = add i16 %2177, %2194
  br i1 %140, label %930, label %2196

; <label>:2196:                                   ; preds = %2191
  %2197 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 3, i64 %2182
  %2198 = load i8, i8* %2197, align 1
  %2199 = zext i8 %2198 to i16
  %2200 = add i16 %2176, %2199
  br i1 %142, label %2201, label %930

; <label>:2201:                                   ; preds = %2196
  %2202 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 4, i64 %2182
  %2203 = load i8, i8* %2202, align 1
  %2204 = zext i8 %2203 to i16
  %2205 = add i16 %2175, %2204
  br i1 %144, label %930, label %2206

; <label>:2206:                                   ; preds = %2201
  %2207 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 5, i64 %2182
  %2208 = load i8, i8* %2207, align 1
  %2209 = zext i8 %2208 to i16
  %2210 = add i16 %2174, %2209
  br label %930

.preheader80.1.loopexit:                          ; preds = %930
  store i16 %2186, i16* %136, align 2
  store i16 %2190, i16* %137, align 2
  store i16 %934, i16* %139, align 2
  store i16 %933, i16* %141, align 2
  store i16 %932, i16* %143, align 2
  store i16 %931, i16* %145, align 2
  br label %.preheader80.1

.preheader80.1:                                   ; preds = %.preheader80.1.loopexit, %.preheader81, %225
  %2211 = load i16, i16* %126, align 2
  %2212 = load i16, i16* %127, align 2
  %2213 = icmp ult i16 %2212, %2211
  %2214 = icmp ult i16 %2212, %2211
  %..032.1284 = select i1 %2214, i16 %2212, i16 %2211
  %.5..030.1 = zext i1 %2213 to i32
  br i1 %128, label %.preheader80.2, label %936

.preheader80.2:                                   ; preds = %.preheader80.1
  %2215 = load i16, i16* %129, align 2
  %2216 = icmp ult i16 %2215, %..032.1284
  %2217 = icmp ult i16 %2215, %..032.1284
  %..032.2285 = select i1 %2217, i16 %2215, i16 %..032.1284
  %.5..030.2 = select i1 %2216, i32 2, i32 %.5..030.1
  br i1 %130, label %936, label %.preheader80.3

.preheader80.3:                                   ; preds = %.preheader80.2
  %2218 = load i16, i16* %131, align 2
  %2219 = icmp ult i16 %2218, %..032.2285
  %2220 = icmp ult i16 %2218, %..032.2285
  %..032.3286 = select i1 %2220, i16 %2218, i16 %..032.2285
  %.5..030.3 = select i1 %2219, i32 3, i32 %.5..030.2
  br i1 %132, label %.preheader80.4, label %936

.preheader80.4:                                   ; preds = %.preheader80.3
  %2221 = load i16, i16* %133, align 2
  %2222 = icmp ult i16 %2221, %..032.3286
  %2223 = icmp ult i16 %2221, %..032.3286
  %..032.4287 = select i1 %2223, i16 %2221, i16 %..032.3286
  %.5..030.4 = select i1 %2222, i32 4, i32 %.5..030.3
  br i1 %134, label %936, label %.preheader80.5

.preheader80.5:                                   ; preds = %.preheader80.4
  %2224 = load i16, i16* %135, align 2
  %2225 = icmp ult i16 %2224, %..032.4287
  %2226 = icmp ult i16 %2224, %..032.4287
  %..032.5288 = select i1 %2226, i16 %2224, i16 %..032.4287
  %.5..030.5 = select i1 %2225, i32 5, i32 %.5..030.4
  br label %936

._crit_edge180.us.5:                              ; preds = %22
  %2227 = icmp sgt i32 %25, 1
  %smax279 = select i1 %2227, i32 %25, i32 1
  %2228 = add nsw i32 %smax279, -1
  %2229 = zext i32 %2228 to i64
  %2230 = add nuw nsw i64 %2229, 1
  %scevgep278 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %scevgep278, i8 15, i64 %2230, i32 1, i1 false)
  %scevgep278.1 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 1, i64 0
  call void @llvm.memset.p0i8.i64(i8* %scevgep278.1, i8 15, i64 %2230, i32 1, i1 false)
  %scevgep278.2 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 2, i64 0
  call void @llvm.memset.p0i8.i64(i8* %scevgep278.2, i8 15, i64 %2230, i32 1, i1 false)
  %scevgep278.3 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 3, i64 0
  call void @llvm.memset.p0i8.i64(i8* %scevgep278.3, i8 15, i64 %2230, i32 1, i1 false)
  %scevgep278.4 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 4, i64 0
  call void @llvm.memset.p0i8.i64(i8* %scevgep278.4, i8 15, i64 %2230, i32 1, i1 false)
  %scevgep278.5 = getelementptr %struct.EState, %struct.EState* %0, i64 0, i32 35, i64 5, i64 0
  call void @llvm.memset.p0i8.i64(i8* %scevgep278.5, i8 15, i64 %2230, i32 1, i1 false)
  br label %.us-lcssa183.us
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @bsFinishWrite(%struct.EState* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 25
  %3 = load i32, i32* %2, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %5 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 24
  %6 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 11
  %7 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 19
  br label %8

; <label>:8:                                      ; preds = %.lr.ph, %8
  %9 = load i32, i32* %5, align 8
  %10 = lshr i32 %9, 24
  %11 = trunc i32 %10 to i8
  %12 = load i8*, i8** %6, align 8
  %13 = load i32, i32* %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %12, i64 %14
  store i8 %11, i8* %15, align 1
  %16 = load i32, i32* %7, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %7, align 4
  %18 = load i32, i32* %5, align 8
  %19 = shl i32 %18, 8
  store i32 %19, i32* %5, align 8
  %20 = load i32, i32* %2, align 4
  %21 = add nsw i32 %20, -8
  store i32 %21, i32* %2, align 4
  %22 = icmp sgt i32 %20, 8
  br i1 %22, label %8, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @makeMaps_e(%struct.EState* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 21
  store i32 0, i32* %2, align 4
  br label %3

; <label>:3:                                      ; preds = %24, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next.1, %24 ]
  %4 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %indvars.iv
  %5 = load i8, i8* %4, align 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %13, label %7

; <label>:7:                                      ; preds = %3
  %8 = load i32, i32* %2, align 4
  %9 = trunc i32 %8 to i8
  %10 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 23, i64 %indvars.iv
  store i8 %9, i8* %10, align 1
  %11 = load i32, i32* %2, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %2, align 4
  br label %13

; <label>:13:                                     ; preds = %7, %3
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 22, i64 %indvars.iv.next
  %15 = load i8, i8* %14, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %24, label %18

; <label>:17:                                     ; preds = %24
  ret void

; <label>:18:                                     ; preds = %13
  %19 = load i32, i32* %2, align 4
  %20 = trunc i32 %19 to i8
  %21 = getelementptr inbounds %struct.EState, %struct.EState* %0, i64 0, i32 23, i64 %indvars.iv.next
  store i8 %20, i8* %21, align 1
  %22 = load i32, i32* %2, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %2, align 4
  br label %24

; <label>:24:                                     ; preds = %18, %13
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 256
  br i1 %exitcond.1, label %17, label %3
}

declare void @BZ2_bz__AssertH__fail(i32) local_unnamed_addr #3

declare void @BZ2_hbMakeCodeLengths(i8*, i32*, i32, i32) local_unnamed_addr #3

declare void @BZ2_hbAssignCodes(i32*, i8*, i32, i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !4, !5}
!9 = distinct !{!9, !7, !4, !5}
