; ModuleID = 'mainmpglib.ll'
source_filename = "mainmpglib.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mpstr = type { %struct.buf*, %struct.buf*, i32, i32, i32, %struct.frame, [2 x [2304 x i8]], [2 x [2 x [576 x double]]], [2 x i32], i64, i32, [2 x [2 x [272 x double]]], i32 }
%struct.buf = type { i8*, i64, i64, %struct.buf*, %struct.buf* }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.VBRTAGDATA = type { i32, i32, i32, i32, i32, i32, [100 x i8] }

@mp = common global %struct.mpstr zeroinitializer, align 8
@buf = internal global [16384 x i8] zeroinitializer, align 16
@out = internal global [8192 x i8] zeroinitializer, align 16
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [50 x i8] c"Opps: first frame of mpglib output will be lost \0A\00", align 1
@freqs = external local_unnamed_addr global [9 x i64], align 16
@tabsel_123 = external local_unnamed_addr global [2 x [3 x [16 x i32]]], align 16
@.str.1 = private unnamed_addr constant [66 x i8] c"Opps: mpg123 returned more than one frame!  Cant handle this... \0A\00", align 1
@.str.2 = private unnamed_addr constant [66 x i8] c"Opps: mpg123 returned more than one frame!  shouldn't happen... \0A\00", align 1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @is_syncword(i8* nocapture readonly) local_unnamed_addr #0 {
  %2 = load i8, i8* %0, align 1
  %3 = icmp eq i8 %2, -1
  br i1 %3, label %4, label %8

; <label>:4:                                      ; preds = %1
  %5 = getelementptr inbounds i8, i8* %0, i64 1
  %6 = load i8, i8* %5, align 1
  %7 = icmp ugt i8 %6, -17
  br label %8

; <label>:8:                                      ; preds = %4, %1
  %9 = phi i1 [ false, %1 ], [ %7, %4 ]
  %10 = zext i1 %9 to i32
  ret i32 %10
}

; Function Attrs: noinline nounwind uwtable
define i32 @lame_decode_initfile(%struct._IO_FILE* nocapture, i32* nocapture, i32* nocapture, i32* nocapture, i64* nocapture) local_unnamed_addr #1 {
  %6 = alloca %struct.VBRTAGDATA, align 4
  %7 = alloca i32, align 4
  %8 = tail call i32 @InitMP3(%struct.mpstr* nonnull @mp) #6
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0), i8 0, i64 16384, i32 16, i1 false)
  br label %9

; <label>:9:                                      ; preds = %12, %5
  %10 = tail call i32 @is_syncword(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0))
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %9
  %13 = load i8, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 1), align 1
  store i8 %13, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0), align 16
  %14 = tail call i64 @fread(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 1), i64 1, i64 1, %struct._IO_FILE* %0)
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %.loopexit.loopexit, label %9

; <label>:16:                                     ; preds = %9
  %17 = tail call i64 @fread(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 2), i64 1, i64 46, %struct._IO_FILE* %0)
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %.loopexit, label %19

; <label>:19:                                     ; preds = %16
  %20 = add i64 %17, 2
  %21 = call i32 @GetVbrTag(%struct.VBRTAGDATA* nonnull %6, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0)) #6
  %22 = icmp eq i32 %21, 0
  %23 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %6, i64 0, i32 3
  %24 = load i32, i32* %23, align 4
  %25 = sext i32 %24 to i64
  %.01 = select i1 %22, i64 0, i64 %25
  store i32 0, i32* %7, align 4
  %26 = trunc i64 %20 to i32
  %27 = call i32 @decodeMP3(%struct.mpstr* nonnull @mp, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0), i32 %26, i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @out, i64 0, i64 0), i32 8192, i32* nonnull %7) #6
  %28 = load i32, i32* %7, align 4
  %29 = icmp sgt i32 %28, 0
  %or.cond = and i1 %22, %29
  br i1 %or.cond, label %30, label %33

; <label>:30:                                     ; preds = %19
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = call i64 @fwrite(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str, i64 0, i64 0), i64 49, i64 1, %struct._IO_FILE* %31) #7
  br label %33

; <label>:33:                                     ; preds = %30, %19
  %34 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  store i32 %34, i32* %1, align 4
  %35 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 9), align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [9 x i64], [9 x i64]* @freqs, i64 0, i64 %36
  %38 = load i64, i64* %37, align 8
  %39 = trunc i64 %38 to i32
  store i32 %39, i32* %2, align 4
  %40 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 3), align 4
  %41 = sext i32 %40 to i64
  %42 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 6), align 4
  %43 = add nsw i32 %42, -1
  %44 = sext i32 %43 to i64
  %45 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 8), align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [2 x [3 x [16 x i32]]], [2 x [3 x [16 x i32]]]* @tabsel_123, i64 0, i64 %41, i64 %44, i64 %46
  %48 = load i32, i32* %47, align 4
  store i32 %48, i32* %3, align 4
  %49 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 3), align 4
  store i64 4294967295, i64* %4, align 8
  %50 = icmp eq i64 %.01, 0
  %or.cond2 = or i1 %22, %50
  br i1 %or.cond2, label %.loopexit, label %51

; <label>:51:                                     ; preds = %33
  %52 = icmp eq i32 %49, 0
  %53 = select i1 %52, i64 1152, i64 576
  %54 = mul nsw i64 %53, %.01
  store i64 %54, i64* %4, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %12
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %51, %33, %16
  %.0 = phi i32 [ -1, %16 ], [ 0, %33 ], [ 0, %51 ], [ -1, %.loopexit.loopexit ]
  ret i32 %.0
}

declare i32 @InitMP3(%struct.mpstr*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

declare i32 @GetVbrTag(%struct.VBRTAGDATA*, i8*) local_unnamed_addr #2

declare i32 @decodeMP3(%struct.mpstr*, i8*, i32, i8*, i32, i32*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @lame_decode_init() local_unnamed_addr #1 {
  %1 = tail call i32 @InitMP3(%struct.mpstr* nonnull @mp) #6
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0), i8 0, i64 16384, i32 16, i1 false)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define i32 @lame_decode_fromfile(%struct._IO_FILE* nocapture, i16* nocapture, i16* nocapture) local_unnamed_addr #1 {
  %4 = alloca i32, align 4
  store i32 0, i32* %4, align 4
  %5 = tail call i64 @fread(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0), i64 1, i64 64, %struct._IO_FILE* %0)
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %.loopexit9, label %.preheader8.preheader

.preheader8.preheader:                            ; preds = %3
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.preheader, %13
  %.sink5 = phi i64 [ %14, %13 ], [ %5, %.preheader8.preheader ]
  %7 = trunc i64 %.sink5 to i32
  %8 = call i32 @decodeMP3(%struct.mpstr* nonnull @mp, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0), i32 %7, i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @out, i64 0, i64 0), i32 8192, i32* nonnull %4) #6
  %9 = icmp eq i32 %8, 1
  %10 = load i32, i32* %4, align 4
  %11 = icmp eq i32 %10, 0
  %12 = or i1 %9, %11
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %.preheader8
  %14 = call i64 @fread(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0), i64 1, i64 100, %struct._IO_FILE* %0)
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %.loopexit9.loopexit, label %.preheader8

; <label>:16:                                     ; preds = %.preheader8
  %17 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  %18 = icmp eq i32 %8, 0
  br i1 %18, label %19, label %.loopexit

; <label>:19:                                     ; preds = %16
  %20 = shl nsw i32 %17, 1
  %21 = sdiv i32 %10, %20
  switch i32 %21, label %45 [
    i32 576, label %.preheader7
    i32 1152, label %.preheader7
  ]

.preheader7:                                      ; preds = %19, %19
  %22 = icmp sgt i32 %17, 0
  br i1 %22, label %.preheader.us.preheader, label %.loopexit

.preheader.us.preheader:                          ; preds = %.preheader7
  %xtraiter = and i32 %21, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %23 = icmp eq i32 %21, 1
  %wide.trip.count22 = zext i32 %17 to i64
  %wide.trip.count.1 = zext i32 %21 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %24 = icmp eq i64 %indvars.iv20, 0
  %.sink6.us = select i1 %24, i16* %1, i16* %2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %25 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %indvars.iv20
  %26 = load i16, i16* %25, align 2
  store i16 %26, i16* %.sink6.us, align 2
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %23, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %27 = trunc i64 %indvars.iv20 to i32
  %28 = trunc i64 %indvars.iv20 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %29 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  %30 = trunc i64 %indvars.iv to i32
  %31 = mul nsw i32 %29, %30
  %32 = add nsw i32 %31, %27
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %33
  %35 = load i16, i16* %34, align 2
  %36 = getelementptr inbounds i16, i16* %.sink6.us, i64 %indvars.iv
  store i16 %35, i16* %36, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  %38 = trunc i64 %indvars.iv.next to i32
  %39 = mul nsw i32 %37, %38
  %40 = add nsw i32 %39, %28
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %41
  %43 = load i16, i16* %42, align 2
  %44 = getelementptr inbounds i16, i16* %.sink6.us, i64 %indvars.iv.next
  store i16 %43, i16* %44, align 2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond, label %.loopexit.loopexit, label %.preheader.us

; <label>:45:                                     ; preds = %19
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = call i64 @fwrite(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.1, i64 0, i64 0), i64 65, i64 1, %struct._IO_FILE* %46) #7
  call void @exit(i32 -50) #8
  unreachable

.loopexit.loopexit:                               ; preds = %._crit_edge.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader7, %16
  %.04 = phi i32 [ 0, %16 ], [ %21, %.preheader7 ], [ %21, %.loopexit.loopexit ]
  %48 = icmp eq i32 %8, -1
  %..04 = select i1 %48, i32 -1, i32 %.04
  br label %.loopexit9

.loopexit9.loopexit:                              ; preds = %13
  br label %.loopexit9

.loopexit9:                                       ; preds = %.loopexit9.loopexit, %.loopexit, %3
  %.0 = phi i32 [ 0, %3 ], [ %..04, %.loopexit ], [ -1, %.loopexit9.loopexit ]
  ret i32 %.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind uwtable
define i32 @lame_decode(i8*, i32, i16* nocapture, i16* nocapture) local_unnamed_addr #1 {
  %5 = alloca i32, align 4
  %6 = call i32 @decodeMP3(%struct.mpstr* nonnull @mp, i8* %0, i32 %1, i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @out, i64 0, i64 0), i32 8192, i32* nonnull %5) #6
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.loopexit

; <label>:8:                                      ; preds = %4
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  %11 = shl nsw i32 %10, 1
  %12 = sdiv i32 %9, %11
  %13 = icmp sgt i32 %12, 1152
  br i1 %13, label %43, label %.preheader5

.preheader5:                                      ; preds = %8
  %14 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.preheader.lr.ph, label %.loopexit

.preheader.lr.ph:                                 ; preds = %.preheader5
  %16 = icmp sgt i32 %12, 0
  br i1 %16, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %17 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %12, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %12, 1
  %wide.trip.count.1 = zext i32 %12 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %19 = icmp eq i64 %indvars.iv10, 0
  %.sink4.us = select i1 %19, i16* %2, i16* %3
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %20 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %indvars.iv10
  %21 = load i16, i16* %20, align 2
  store i16 %21, i16* %.sink4.us, align 2
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %18, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %22 = trunc i64 %indvars.iv10 to i32
  %23 = trunc i64 %indvars.iv10 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %24 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  %25 = trunc i64 %indvars.iv to i32
  %26 = mul nsw i32 %24, %25
  %27 = add nsw i32 %26, %22
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %28
  %30 = load i16, i16* %29, align 2
  %31 = getelementptr inbounds i16, i16* %.sink4.us, i64 %indvars.iv
  store i16 %30, i16* %31, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  %33 = trunc i64 %indvars.iv.next to i32
  %34 = mul nsw i32 %32, %33
  %35 = add nsw i32 %34, %23
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %36
  %38 = load i16, i16* %37, align 2
  %39 = getelementptr inbounds i16, i16* %.sink4.us, i64 %indvars.iv.next
  store i16 %38, i16* %39, align 2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %40 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i64 0, i32 5, i32 0), align 4
  %41 = sext i32 %40 to i64
  %42 = icmp slt i64 %indvars.iv.next11, %41
  br i1 %42, label %.preheader.us, label %.loopexit.loopexit

; <label>:43:                                     ; preds = %8
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = call i64 @fwrite(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.2, i64 0, i64 0), i64 65, i64 1, %struct._IO_FILE* %44) #7
  call void @exit(i32 -50) #8
  unreachable

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.027 = phi i32 [ %46, %.preheader ], [ 0, %.preheader.preheader ]
  %46 = add nuw nsw i32 %.027, 1
  %47 = icmp slt i32 %46, %17
  br i1 %47, label %.preheader, label %.loopexit.loopexit14

.loopexit.loopexit:                               ; preds = %._crit_edge.us
  br label %.loopexit

.loopexit.loopexit14:                             ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit14, %.loopexit.loopexit, %.preheader5, %4
  %.03 = phi i32 [ 0, %4 ], [ %12, %.preheader5 ], [ %12, %.loopexit.loopexit ], [ %12, %.loopexit.loopexit14 ]
  %48 = icmp eq i32 %6, -1
  %..03 = select i1 %48, i32 -1, i32 %.03
  ret i32 %..03
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
