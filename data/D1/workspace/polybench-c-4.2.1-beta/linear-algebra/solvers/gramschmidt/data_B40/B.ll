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
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]*) unnamed_addr #2 {
  %6 = alloca [1200 x double]*, align 8
  store [1200 x double]* %4, [1200 x double]** %6, align 8
  %7 = sext i32 %1 to i64
  %8 = sext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %5
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  %12 = load [1200 x double]*, [1200 x double]** %6, align 8
  br i1 %10, label %.lr.ph18.split.us.preheader, label %._crit_edge8

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %._crit_edge13.us
  %indvars.iv15.us = phi i64 [ %indvars.iv.next14.us, %._crit_edge13.us ], [ 0, %.lr.ph18.split.us.preheader ]
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph18.split.us
  %indvars.iv10.us = phi i64 [ 0, %.lr.ph18.split.us ], [ %indvars.iv.next9.us, %13 ]
  %14 = mul nuw nsw i64 %indvars.iv10.us, %indvars.iv15.us
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %11
  %19 = fmul double %18, 1.000000e+02
  %20 = fadd double %19, 1.000000e+01
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15.us, i64 %indvars.iv10.us
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv15.us, i64 %indvars.iv10.us
  store double 0.000000e+00, double* %22, align 8
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv10.us, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next9.us, %7
  br i1 %exitcond22, label %._crit_edge13.us, label %13

._crit_edge13.us:                                 ; preds = %13
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next14.us, %8
  br i1 %exitcond23, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %5
  %23 = sext i32 %1 to i64
  %24 = icmp sgt i32 %1, 0
  br i1 %24, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %._crit_edge19
  %wide.trip.count = zext i32 %1 to i64
  %25 = shl nuw nsw i64 %wide.trip.count, 3
  %26 = add nsw i64 %7, -1
  %xtraiter = and i64 %7, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph7
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv4.prol = phi i64 [ %indvars.iv.next3.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.prol ], [ %xtraiter, %._crit_edge.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv4.prol, i64 0
  %scevgep26.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.prol = add nuw nsw i64 %indvars.iv4.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %._crit_edge.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph7
  %indvars.iv4.unr = phi i64 [ 0, %.lr.ph7 ], [ %xtraiter, %.lr.ph.prol.loopexit.loopexit ]
  %27 = icmp ult i64 %26, 3
  br i1 %27, label %._crit_edge8, label %._crit_edge.3.preheader

._crit_edge.3.preheader:                          ; preds = %.lr.ph.prol.loopexit
  %28 = add nsw i64 %7, -4
  %29 = sub nsw i64 %28, %indvars.iv4.unr
  %30 = lshr i64 %29, 2
  %31 = and i64 %30, 1
  %lcmp.mod30 = icmp eq i64 %31, 0
  br i1 %lcmp.mod30, label %._crit_edge.3.prol, label %._crit_edge.3.prol.loopexit

._crit_edge.3.prol:                               ; preds = %._crit_edge.3.preheader
  %scevgep.prol32 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv4.unr, i64 0
  %scevgep26.prol33 = bitcast double* %scevgep.prol32 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.prol33, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.prol34 = add nuw nsw i64 %indvars.iv4.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.prol34, i64 0
  %scevgep26.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.1.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.1.prol = add nuw nsw i64 %indvars.iv4.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.1.prol, i64 0
  %scevgep26.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.2.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.2.prol = add nuw nsw i64 %indvars.iv4.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.2.prol, i64 0
  %scevgep26.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.3.prol, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.3.prol = or i64 %indvars.iv4.unr, 4
  br label %._crit_edge.3.prol.loopexit

._crit_edge.3.prol.loopexit:                      ; preds = %._crit_edge.3.prol, %._crit_edge.3.preheader
  %indvars.iv4.unr35 = phi i64 [ %indvars.iv4.unr, %._crit_edge.3.preheader ], [ %indvars.iv.next3.3.prol, %._crit_edge.3.prol ]
  %32 = icmp eq i64 %30, 0
  br i1 %32, label %._crit_edge8, label %._crit_edge.3.preheader.new

._crit_edge.3.preheader.new:                      ; preds = %._crit_edge.3.prol.loopexit
  br label %._crit_edge.3

._crit_edge8.loopexit:                            ; preds = %._crit_edge.3
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge.3.prol.loopexit, %.lr.ph18, %.lr.ph.prol.loopexit, %._crit_edge19
  ret void

._crit_edge.3:                                    ; preds = %._crit_edge.3, %._crit_edge.3.preheader.new
  %indvars.iv4 = phi i64 [ %indvars.iv4.unr35, %._crit_edge.3.preheader.new ], [ %indvars.iv.next3.3.1, %._crit_edge.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 0
  %scevgep26 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv4, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3, i64 0
  %scevgep26.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.1 = add nsw i64 %indvars.iv4, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.1, i64 0
  %scevgep26.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.2, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.2 = add nsw i64 %indvars.iv4, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.2, i64 0
  %scevgep26.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.3, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.3 = add nsw i64 %indvars.iv4, 4
  %scevgep.136 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.3, i64 0
  %scevgep26.137 = bitcast double* %scevgep.136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.137, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.138 = add nsw i64 %indvars.iv4, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.138, i64 0
  %scevgep26.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.1.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.1.1 = add nsw i64 %indvars.iv4, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.1.1, i64 0
  %scevgep26.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.2.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.2.1 = add nsw i64 %indvars.iv4, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next3.2.1, i64 0
  %scevgep26.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep26.3.1, i8 0, i64 %25, i32 8, i1 false)
  %indvars.iv.next3.3.1 = add nsw i64 %indvars.iv4, 8
  %exitcond21.3.1 = icmp eq i64 %indvars.iv.next3.3.1, %23
  br i1 %exitcond21.3.1, label %._crit_edge8.loopexit, label %._crit_edge.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]* nocapture, [1200 x double]*) unnamed_addr #0 {
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  store [1200 x double]* %4, [1200 x double]** %7, align 8
  %8 = sext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph38, label %._crit_edge39

.lr.ph38:                                         ; preds = %5
  %10 = sext i32 %0 to i64
  %11 = load [1200 x double]*, [1200 x double]** %6, align 8
  %12 = load [1200 x double]*, [1200 x double]** %7, align 8
  %13 = sext i32 %1 to i64
  %14 = add nsw i64 %10, -1
  %15 = shl nsw i64 %8, 3
  %16 = add nsw i64 %15, -8
  %17 = zext i32 %1 to i64
  %xtraiter = and i64 %10, 3
  %xtraiter65 = and i64 %10, 1
  %xtraiter70 = and i64 %10, 1
  %xtraiter74 = and i64 %10, 1
  br label %18

; <label>:18:                                     ; preds = %._crit_edge33, %.lr.ph38
  %indvars.iv = phi i64 [ 0, %.lr.ph38 ], [ %indvars.iv.next59, %._crit_edge33 ]
  %19 = icmp sgt i32 %0, 0
  %20 = mul i64 %indvars.iv, 1201
  %21 = add i64 %20, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %21
  %22 = mul i64 %indvars.iv, -8
  %23 = add i64 %16, %22
  br i1 %19, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %18
  %24 = icmp eq i64 %xtraiter, 0
  br i1 %24, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %25 = phi double [ %29, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %indvars.iv8.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv8.prol, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %25, %28
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv8.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa62.unr = phi double [ undef, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %indvars.iv8.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %30 = icmp ult i64 %14, 3
  br i1 %30, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %31 = phi double [ %47, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %indvars.iv8 = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv8.unr, %.lr.ph.new.preheader ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv8, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %33
  %35 = fadd double %31, %34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv.next, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %37
  %39 = fadd double %35, %38
  %indvars.iv.next.1 = add nsw i64 %indvars.iv8, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv.next.1, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fadd double %39, %42
  %indvars.iv.next.2 = add nsw i64 %indvars.iv8, 3
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv.next.2, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fadd double %43, %46
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv8, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %10
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %18
  %.lcssa = phi double [ 0.000000e+00, %18 ], [ %.lcssa62.unr, %.prol.loopexit ], [ %47, %._crit_edge.loopexit ]
  %48 = icmp sgt i32 %0, 0
  %49 = tail call double @sqrt(double %.lcssa) #4
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv
  store double %49, double* %50, align 8
  br i1 %48, label %.lr.ph12, label %._crit_edge13

.lr.ph12:                                         ; preds = %._crit_edge
  %51 = icmp eq i64 %xtraiter65, 0
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv
  br i1 %51, label %.prol.loopexit64, label %.prol.preheader63

.prol.preheader63:                                ; preds = %.lr.ph12
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 0, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = load double, double* %52, align 8
  %56 = fdiv double %54, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 0, i64 %indvars.iv
  store double %56, double* %57, align 8
  br label %.prol.loopexit64

.prol.loopexit64:                                 ; preds = %.prol.preheader63, %.lr.ph12
  %indvars.iv10.unr.ph = phi i64 [ 1, %.prol.preheader63 ], [ 0, %.lr.ph12 ]
  %58 = icmp eq i64 %14, 0
  br i1 %58, label %._crit_edge13, label %.lr.ph12.new.preheader

.lr.ph12.new.preheader:                           ; preds = %.prol.loopexit64
  br label %.lr.ph12.new

.lr.ph12.new:                                     ; preds = %.lr.ph12.new.preheader, %.lr.ph12.new
  %indvars.iv10 = phi i64 [ %indvars.iv.next9.1, %.lr.ph12.new ], [ %indvars.iv10.unr.ph, %.lr.ph12.new.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv10, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = load double, double* %52, align 8
  %62 = fdiv double %60, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv10, i64 %indvars.iv
  store double %62, double* %63, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv10, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv.next9, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = load double, double* %52, align 8
  %67 = fdiv double %65, %66
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next9, i64 %indvars.iv
  store double %67, double* %68, align 8
  %indvars.iv.next9.1 = add nuw nsw i64 %indvars.iv10, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next9.1, %10
  br i1 %exitcond54.1, label %._crit_edge13.loopexit, label %.lr.ph12.new

._crit_edge13.loopexit:                           ; preds = %.lr.ph12.new
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.prol.loopexit64, %._crit_edge
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv, 1
  %69 = icmp slt i64 %indvars.iv.next59, %13
  br i1 %69, label %.lr.ph32, label %._crit_edge33

.lr.ph32:                                         ; preds = %._crit_edge13
  %70 = icmp sgt i32 %0, 0
  br i1 %70, label %.lr.ph32.split.us.preheader, label %._crit_edge33.loopexit61

.lr.ph32.split.us.preheader:                      ; preds = %.lr.ph32
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %._crit_edge27.us
  %indvars.iv29.us = phi i64 [ %indvars.iv.next28.us, %._crit_edge27.us ], [ %indvars.iv.next59, %.lr.ph32.split.us.preheader ]
  %71 = icmp eq i64 %xtraiter70, 0
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv29.us
  store double 0.000000e+00, double* %72, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv29.us
  br i1 %71, label %.prol.loopexit69, label %.prol.preheader68

.prol.preheader68:                                ; preds = %.lr.ph32.split.us
  %sunkaddr = ptrtoint [1200 x double]* %12 to i64
  %sunkaddr86 = mul i64 %indvars.iv, 8
  %sunkaddr87 = add i64 %sunkaddr, %sunkaddr86
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to double*
  %74 = load double, double* %sunkaddr88, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 0, i64 %indvars.iv29.us
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = load double, double* %73, align 8
  %79 = fadd double %78, %77
  store double %79, double* %73, align 8
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.prol.preheader68, %.lr.ph32.split.us
  %indvars.iv17.us.unr.ph = phi i64 [ 1, %.prol.preheader68 ], [ 0, %.lr.ph32.split.us ]
  %80 = icmp eq i64 %14, 0
  br i1 %80, label %._crit_edge20.us, label %.lr.ph32.split.us.new.preheader

.lr.ph32.split.us.new.preheader:                  ; preds = %.prol.loopexit69
  br label %.lr.ph32.split.us.new

.lr.ph32.split.us.new:                            ; preds = %.lr.ph32.split.us.new.preheader, %.lr.ph32.split.us.new
  %indvars.iv17.us = phi i64 [ %indvars.iv.next16.us.1, %.lr.ph32.split.us.new ], [ %indvars.iv17.us.unr.ph, %.lr.ph32.split.us.new.preheader ]
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv17.us, i64 %indvars.iv
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv17.us, i64 %indvars.iv29.us
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = load double, double* %73, align 8
  %87 = fadd double %86, %85
  store double %87, double* %73, align 8
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv17.us, 1
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next16.us, i64 %indvars.iv
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv.next16.us, i64 %indvars.iv29.us
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = load double, double* %73, align 8
  %94 = fadd double %93, %92
  store double %94, double* %73, align 8
  %indvars.iv.next16.us.1 = add nuw nsw i64 %indvars.iv17.us, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next16.us.1, %10
  br i1 %exitcond56.1, label %._crit_edge20.us.loopexit, label %.lr.ph32.split.us.new

._crit_edge20.us.loopexit:                        ; preds = %.lr.ph32.split.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %.prol.loopexit69
  %95 = icmp sgt i32 %0, 0
  br i1 %95, label %.lr.ph26.us, label %._crit_edge27.us

.lr.ph26.us:                                      ; preds = %._crit_edge20.us
  %96 = icmp eq i64 %xtraiter74, 0
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv29.us
  br i1 %96, label %.prol.loopexit73, label %.prol.preheader72

.prol.preheader72:                                ; preds = %.lr.ph26.us
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 0, i64 %indvars.iv29.us
  %99 = load double, double* %98, align 8
  %sunkaddr89 = ptrtoint [1200 x double]* %12 to i64
  %sunkaddr90 = mul i64 %indvars.iv, 8
  %sunkaddr91 = add i64 %sunkaddr89, %sunkaddr90
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to double*
  %100 = load double, double* %sunkaddr92, align 8
  %101 = load double, double* %97, align 8
  %102 = fmul double %100, %101
  %103 = fsub double %99, %102
  store double %103, double* %98, align 8
  br label %.prol.loopexit73

.prol.loopexit73:                                 ; preds = %.prol.preheader72, %.lr.ph26.us
  %indvars.iv24.us.unr.ph = phi i64 [ 1, %.prol.preheader72 ], [ 0, %.lr.ph26.us ]
  %104 = icmp eq i64 %14, 0
  br i1 %104, label %._crit_edge27.us, label %.lr.ph26.us.new.preheader

.lr.ph26.us.new.preheader:                        ; preds = %.prol.loopexit73
  br label %.lr.ph26.us.new

.lr.ph26.us.new:                                  ; preds = %.lr.ph26.us.new.preheader, %.lr.ph26.us.new
  %indvars.iv24.us = phi i64 [ %indvars.iv.next23.us.1, %.lr.ph26.us.new ], [ %indvars.iv24.us.unr.ph, %.lr.ph26.us.new.preheader ]
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv24.us, i64 %indvars.iv29.us
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv24.us, i64 %indvars.iv
  %108 = load double, double* %107, align 8
  %109 = load double, double* %97, align 8
  %110 = fmul double %108, %109
  %111 = fsub double %106, %110
  store double %111, double* %105, align 8
  %indvars.iv.next23.us = add nuw nsw i64 %indvars.iv24.us, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv.next23.us, i64 %indvars.iv29.us
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %12, i64 %indvars.iv.next23.us, i64 %indvars.iv
  %115 = load double, double* %114, align 8
  %116 = load double, double* %97, align 8
  %117 = fmul double %115, %116
  %118 = fsub double %113, %117
  store double %118, double* %112, align 8
  %indvars.iv.next23.us.1 = add nuw nsw i64 %indvars.iv24.us, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next23.us.1, %10
  br i1 %exitcond57.1, label %._crit_edge27.us.loopexit, label %.lr.ph26.us.new

._crit_edge27.us.loopexit:                        ; preds = %.lr.ph26.us.new
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit, %.prol.loopexit73, %._crit_edge20.us
  %indvars.iv.next28.us = add nuw nsw i64 %indvars.iv29.us, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next28.us, %8
  br i1 %exitcond58, label %._crit_edge33.loopexit, label %.lr.ph32.split.us

._crit_edge33.loopexit61:                         ; preds = %.lr.ph32
  %119 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %119, i8 0, i64 %23, i32 8, i1 false)
  br label %._crit_edge33

._crit_edge33.loopexit:                           ; preds = %._crit_edge27.us
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %._crit_edge33.loopexit61, %._crit_edge13
  %exitcond = icmp eq i64 %indvars.iv.next59, %17
  br i1 %exitcond, label %._crit_edge39.loopexit, label %18

._crit_edge39.loopexit:                           ; preds = %._crit_edge33
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = sext i32 %1 to i64
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %4
  %wide.trip.count = zext i32 %1 to i64
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %._crit_edge13, %.lr.ph18
  %indvars.iv15 = phi i64 [ 0, %.lr.ph18 ], [ %indvars.iv.next14, %._crit_edge13 ]
  %11 = mul nsw i64 %indvars.iv15, %9
  br label %12

; <label>:12:                                     ; preds = %19, %.lr.ph12
  %indvars.iv10 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next8, %19 ]
  %13 = add nsw i64 %indvars.iv10, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc22 = call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %19

; <label>:19:                                     ; preds = %12, %17
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv10
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #7
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, %wide.trip.count
  br i1 %exitcond, label %._crit_edge13, label %12

._crit_edge13:                                    ; preds = %19
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next14, %9
  br i1 %exitcond27, label %._crit_edge19.loopexit, label %.lr.ph12

._crit_edge19.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %28 = sext i32 %1 to i64
  %29 = sext i32 %0 to i64
  %30 = sext i32 %1 to i64
  %31 = icmp sgt i32 %0, 0
  %32 = icmp sgt i32 %1, 0
  %or.cond = and i1 %31, %32
  br i1 %or.cond, label %.lr.ph6.split.us.preheader, label %._crit_edge7

.lr.ph6.split.us.preheader:                       ; preds = %._crit_edge19
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %.lr.ph6.split.us.preheader, %._crit_edge.us
  %indvars.iv3.us = phi i64 [ %indvars.iv.next2.us, %._crit_edge.us ], [ 0, %.lr.ph6.split.us.preheader ]
  %33 = mul nsw i64 %indvars.iv3.us, %30
  br label %34

; <label>:34:                                     ; preds = %41, %.lr.ph6.split.us
  %indvars.iv1.us = phi i64 [ 0, %.lr.ph6.split.us ], [ %indvars.iv.next.us, %41 ]
  %35 = add nsw i64 %indvars.iv1.us, %33
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 20
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %34
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %40) #6
  br label %41

; <label>:41:                                     ; preds = %39, %34
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv3.us, i64 %indvars.iv1.us
  %44 = load double, double* %43, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %44) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv1.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next.us, %28
  br i1 %exitcond24, label %._crit_edge.us, label %34

._crit_edge.us:                                   ; preds = %41
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv3.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next2.us, %29
  br i1 %exitcond25, label %._crit_edge7.loopexit, label %.lr.ph6.split.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge19
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %48) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
