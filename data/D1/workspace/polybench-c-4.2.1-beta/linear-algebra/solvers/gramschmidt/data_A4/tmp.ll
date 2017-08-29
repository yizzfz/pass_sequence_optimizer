; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader4.lr.ph, label %.preheader3

.preheader4.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  br i1 %7, label %.preheader4.us.preheader, label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %9 = zext i32 %1 to i64
  %10 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next23, %._crit_edge10.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader4.us
  %indvars.iv18 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next19, %11 ]
  %12 = mul nuw nsw i64 %indvars.iv18, %indvars.iv22
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv18
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv18
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %9
  br i1 %exitcond, label %._crit_edge10.us, label %11

._crit_edge10.us:                                 ; preds = %11
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next23, %10
  br i1 %exitcond31, label %.preheader3.loopexit, label %.preheader4.us

.preheader3.loopexit:                             ; preds = %._crit_edge10.us
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %.preheader3
  %22 = zext i32 %1 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = zext i32 %1 to i64
  %25 = add nsw i64 %24, -1
  %xtraiter = and i64 %24, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv14.prol = phi i64 [ %indvars.iv.next15.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv14.prol, i64 0
  %scevgep28.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv14.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15.prol, %.preheader.us.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %25, 3
  br i1 %26, label %._crit_edge7, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %27 = add nsw i64 %24, -4
  %28 = sub i64 %27, %indvars.iv14.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod33 = icmp eq i64 %30, 0
  br i1 %lcmp.mod33, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %scevgep.prol35 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv14.unr, i64 0
  %scevgep28.prol36 = bitcast double* %scevgep.prol35 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.prol36, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.prol37 = add nuw nsw i64 %indvars.iv14.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.prol37, i64 0
  %scevgep28.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.1.prol = add nsw i64 %indvars.iv14.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.1.prol, i64 0
  %scevgep28.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.2.prol = add nsw i64 %indvars.iv14.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.2.prol, i64 0
  %scevgep28.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.3.prol = add nsw i64 %indvars.iv14.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv14.unr38 = phi i64 [ %indvars.iv14.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next15.3.prol, %._crit_edge.us.3.prol ]
  %31 = icmp eq i64 %29, 0
  br i1 %31, label %._crit_edge7.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge7.loopexit.unr-lcssa:                  ; preds = %._crit_edge.us.3
  br label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us.3.prol.loopexit, %._crit_edge7.loopexit.unr-lcssa
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader4.lr.ph, %.preheader.us.prol.loopexit, %.preheader3
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3, %._crit_edge.us.3.preheader.new
  %indvars.iv14 = phi i64 [ %indvars.iv14.unr38, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next15.3.1, %._crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 0
  %scevgep28 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15, i64 0
  %scevgep28.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.1, i64 0
  %scevgep28.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.2 = add nsw i64 %indvars.iv14, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.2, i64 0
  %scevgep28.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.3 = add nsw i64 %indvars.iv14, 4
  %scevgep.139 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.3, i64 0
  %scevgep28.140 = bitcast double* %scevgep.139 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.140, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.141 = add nsw i64 %indvars.iv14, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.141, i64 0
  %scevgep28.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.1.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.1.1 = add nsw i64 %indvars.iv14, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.1.1, i64 0
  %scevgep28.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.2.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.2.1 = add nsw i64 %indvars.iv14, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next15.2.1, i64 0
  %scevgep28.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep28.3.1, i8 0, i64 %23, i32 8, i1 false)
  %indvars.iv.next15.3.1 = add nsw i64 %indvars.iv14, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next15.3.1, %24
  br i1 %exitcond.3.1, label %._crit_edge7.loopexit.unr-lcssa, label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader5.lr.ph, label %._crit_edge21

.preheader5.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %0, 0
  %10 = icmp sgt i32 %0, 0
  %11 = sext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %13 = add nsw i64 %12, -1
  %14 = zext i32 %1 to i64
  %15 = shl nuw nsw i64 %14, 3
  %16 = add nsw i64 %15, -8
  %17 = zext i32 %1 to i64
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %13, 3
  %xtraiter62 = and i64 %12, 1
  %lcmp.mod63 = icmp eq i64 %xtraiter62, 0
  %19 = icmp eq i64 %13, 0
  %xtraiter67 = and i64 %12, 1
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  %20 = icmp eq i64 %13, 0
  %xtraiter71 = and i64 %12, 1
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  %21 = icmp eq i64 %13, 0
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge19, %.preheader5.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next58, %._crit_edge19 ]
  %indvars.iv51 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next52, %._crit_edge19 ]
  %22 = mul i64 %indvars.iv57, 1201
  %23 = add i64 %22, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %23
  %scevgep64 = bitcast double* %scevgep to i8*
  %24 = mul i64 %indvars.iv57, -8
  %25 = add i64 %16, %24
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.07.prol = phi double [ %29, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv57
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %.07.prol, %28
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.07.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  br i1 %18, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.07 = phi double [ %45, %.lr.ph.new ], [ %.07.unr, %.lr.ph.new.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv57
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %31
  %33 = fadd double %.07, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv57
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %35
  %37 = fadd double %33, %36
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv57
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fadd double %37, %40
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv57
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fadd double %41, %44
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next.3, %12
  br i1 %exitcond61.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader5
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader5 ], [ %.lcssa.unr, %.prol.loopexit ], [ %45, %._crit_edge.loopexit ]
  %46 = tail call double @sqrt(double %.0.lcssa) #4
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv57
  store double %46, double* %47, align 8
  br i1 %8, label %.lr.ph10.preheader, label %.preheader4

.lr.ph10.preheader:                               ; preds = %._crit_edge
  br i1 %lcmp.mod63, label %.lr.ph10.prol.loopexit, label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.preheader
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv57
  %49 = load double, double* %48, align 8
  %50 = load double, double* %47, align 8
  %51 = fdiv double %49, %50
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv57
  store double %51, double* %52, align 8
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol, %.lr.ph10.preheader
  %indvars.iv33.unr.ph = phi i64 [ 1, %.lr.ph10.prol ], [ 0, %.lr.ph10.preheader ]
  br i1 %19, label %.preheader4, label %.lr.ph10.preheader85

.lr.ph10.preheader85:                             ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.preheader4.loopexit:                             ; preds = %.lr.ph10
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.lr.ph10.prol.loopexit, %._crit_edge
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %53 = icmp slt i64 %indvars.iv.next58, %11
  br i1 %53, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.preheader4
  br i1 %9, label %.lr.ph18.split.us.preheader, label %._crit_edge19.loopexit32

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv57
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv57
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %.loopexit.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %.loopexit.us ], [ %indvars.iv51, %.lr.ph18.split.us.preheader ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv53
  store double 0.000000e+00, double* %56, align 8
  br i1 %lcmp.mod68, label %.prol.loopexit66, label %.prol.preheader65

.prol.preheader65:                                ; preds = %.lr.ph18.split.us
  %57 = load double, double* %55, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv53
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %60, 0.000000e+00
  store double %61, double* %56, align 8
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.prol.preheader65, %.lr.ph18.split.us
  %indvars.iv43.unr.ph = phi i64 [ 1, %.prol.preheader65 ], [ 0, %.lr.ph18.split.us ]
  %.unr.ph = phi double [ %61, %.prol.preheader65 ], [ 0.000000e+00, %.lr.ph18.split.us ]
  br i1 %20, label %..preheader_crit_edge.us, label %.lr.ph18.split.us.new.preheader

.lr.ph18.split.us.new.preheader:                  ; preds = %.prol.loopexit66
  br label %.lr.ph18.split.us.new

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader84, %.lr.ph15.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %.lr.ph15.us ], [ %indvars.iv47.unr.ph, %.lr.ph15.us.preheader84 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv53
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv47, i64 %indvars.iv57
  %65 = load double, double* %64, align 8
  %66 = load double, double* %56, align 8
  %67 = fmul double %65, %66
  %68 = fsub double %63, %67
  store double %68, double* %62, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next48, i64 %indvars.iv53
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next48, i64 %indvars.iv57
  %72 = load double, double* %71, align 8
  %73 = load double, double* %56, align 8
  %74 = fmul double %72, %73
  %75 = fsub double %70, %74
  store double %75, double* %69, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond.174 = icmp eq i64 %indvars.iv.next48.1, %12
  br i1 %exitcond.174, label %.loopexit.us.loopexit, label %.lr.ph15.us

.lr.ph18.split.us.new:                            ; preds = %.lr.ph18.split.us.new.preheader, %.lr.ph18.split.us.new
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %.lr.ph18.split.us.new ], [ %indvars.iv43.unr.ph, %.lr.ph18.split.us.new.preheader ]
  %76 = phi double [ %88, %.lr.ph18.split.us.new ], [ %.unr.ph, %.lr.ph18.split.us.new.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv57
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv43, i64 %indvars.iv53
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %56, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next44, i64 %indvars.iv57
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next44, i64 %indvars.iv53
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %82, %87
  store double %88, double* %56, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond.170 = icmp eq i64 %indvars.iv.next44.1, %12
  br i1 %exitcond.170, label %..preheader_crit_edge.us.loopexit, label %.lr.ph18.split.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph15.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %.lr.ph15.us.prol.loopexit, %..preheader_crit_edge.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond = icmp eq i64 %indvars.iv.next54, %17
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph18.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit66
  br i1 %10, label %.lr.ph15.us.preheader, label %.loopexit.us

.lr.ph15.us.preheader:                            ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod72, label %.lr.ph15.us.prol.loopexit, label %.lr.ph15.us.prol

.lr.ph15.us.prol:                                 ; preds = %.lr.ph15.us.preheader
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv53
  %90 = load double, double* %89, align 8
  %91 = load double, double* %54, align 8
  %92 = load double, double* %56, align 8
  %93 = fmul double %91, %92
  %94 = fsub double %90, %93
  store double %94, double* %89, align 8
  br label %.lr.ph15.us.prol.loopexit

.lr.ph15.us.prol.loopexit:                        ; preds = %.lr.ph15.us.prol, %.lr.ph15.us.preheader
  %indvars.iv47.unr.ph = phi i64 [ 1, %.lr.ph15.us.prol ], [ 0, %.lr.ph15.us.preheader ]
  br i1 %21, label %.loopexit.us, label %.lr.ph15.us.preheader84

.lr.ph15.us.preheader84:                          ; preds = %.lr.ph15.us.prol.loopexit
  br label %.lr.ph15.us

.lr.ph10:                                         ; preds = %.lr.ph10.preheader85, %.lr.ph10
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.lr.ph10 ], [ %indvars.iv33.unr.ph, %.lr.ph10.preheader85 ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv57
  %96 = load double, double* %95, align 8
  %97 = load double, double* %47, align 8
  %98 = fdiv double %96, %97
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv33, i64 %indvars.iv57
  store double %98, double* %99, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next34, i64 %indvars.iv57
  %101 = load double, double* %100, align 8
  %102 = load double, double* %47, align 8
  %103 = fdiv double %101, %102
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next34, i64 %indvars.iv57
  store double %103, double* %104, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next34.1, %12
  br i1 %exitcond.1, label %.preheader4.loopexit, label %.lr.ph10

._crit_edge19.loopexit32:                         ; preds = %.lr.ph18
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep64, i8 0, i64 %25, i32 8, i1 false)
  br label %._crit_edge19

._crit_edge19.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %._crit_edge19.loopexit32, %.preheader4
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next58, %14
  br i1 %exitcond77, label %._crit_edge21.loopexit, label %.preheader5

._crit_edge21.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader4.us.preheader, label %._crit_edge14

.preheader4.us.preheader:                         ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv25 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next26, %._crit_edge11.us ]
  %13 = mul nsw i64 %indvars.iv25, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader4.us
  %indvars.iv21 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next22, %21 ]
  %15 = add nsw i64 %indvars.iv21, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next22, %11
  br i1 %exitcond30, label %._crit_edge11.us, label %14

._crit_edge11.us:                                 ; preds = %21
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next26, %12
  br i1 %exitcond31, label %._crit_edge14.loopexit, label %.preheader4.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %4
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %30 = icmp sgt i32 %0, 0
  %31 = icmp sgt i32 %1, 0
  %or.cond = and i1 %30, %31
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge8

.preheader.us.preheader:                          ; preds = %._crit_edge14
  %32 = sext i32 %1 to i64
  %33 = zext i32 %1 to i64
  %34 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %35 = mul nsw i64 %indvars.iv16, %32
  br label %36

; <label>:36:                                     ; preds = %43, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %43 ]
  %37 = add nsw i64 %indvars.iv, %35
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %36
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %42) #6
  br label %43

; <label>:43:                                     ; preds = %41, %36
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, %33
  br i1 %exitcond29, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %43
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %34
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge14
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %50) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
