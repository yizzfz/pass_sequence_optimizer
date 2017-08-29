; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  br i1 true, label %.preheader.lr.ph, label %._crit_edge36

.preheader.lr.ph:                                 ; preds = %5
  br i1 true, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge32.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge32.us ], [ 0, %.preheader.us.preheader ]
  %6 = icmp sgt i64 %indvars.iv43, 0
  br i1 %6, label %.lr.ph.us, label %.preheader._crit_edge.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv43, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %7 = trunc i64 %indvars.iv43 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 0
  store double %10, double* %11, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %12 = icmp eq i64 %indvars.iv43, 1
  br i1 %12, label %.preheader._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph.us.new ], [ %indvars.iv.us.unr.ph, %.lr.ph.us.new.preheader ]
  %13 = add nuw nsw i64 %indvars.iv.us, %indvars.iv43
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %18 = add nuw nsw i64 %indvars.iv.next.us, %indvars.iv43
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 1000
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %16, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fdiv <2 x double> %23, <double 1.000000e+03, double 1.000000e+03>
  %25 = bitcast double* %17 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, %indvars.iv43
  br i1 %exitcond.us.1, label %.preheader._crit_edge.us.loopexit, label %.lr.ph.us.new

.preheader._crit_edge.us.loopexit:                ; preds = %.lr.ph.us.new
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv43
  store double 1.000000e+00, double* %26, align 8
  %27 = trunc i64 %indvars.iv43 to i32
  %28 = add i32 %27, 1200
  br label %29

; <label>:29:                                     ; preds = %29, %.preheader._crit_edge.us
  %indvars.iv37.us = phi i64 [ 0, %.preheader._crit_edge.us ], [ %indvars.iv.next38.us, %29 ]
  %30 = sub nsw i64 0, %indvars.iv37.us
  %31 = trunc i64 %30 to i32
  %32 = add i32 %28, %31
  %33 = srem i32 %32, 1200
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.200000e+03
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv37.us
  store double %35, double* %36, align 8
  %indvars.iv.next38.us = add nuw nsw i64 %indvars.iv37.us, 1
  %exitcond41.us = icmp eq i64 %indvars.iv.next38.us, 1200
  br i1 %exitcond41.us, label %._crit_edge32.us, label %29

._crit_edge32.us:                                 ; preds = %29
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond46, label %._crit_edge36.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %.preheader._crit_edge
  br i1 undef, label %.lr.ph, label %.preheader._crit_edge

.lr.ph:                                           ; preds = %.preheader
  br i1 undef, label %.prol.loopexit48, label %.prol.preheader47

.prol.preheader47:                                ; preds = %.lr.ph
  br label %.prol.loopexit48

.prol.loopexit48:                                 ; preds = %.prol.preheader47, %.lr.ph
  br i1 undef, label %.preheader._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit48
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  br i1 true, label %.preheader._crit_edge.loopexit, label %.lr.ph.new

.preheader._crit_edge.loopexit:                   ; preds = %.lr.ph.new
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.prol.loopexit48, %.preheader
  br i1 true, label %._crit_edge36.loopexit57, label %.preheader

._crit_edge36.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge36

._crit_edge36.loopexit57:                         ; preds = %.preheader._crit_edge
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36.loopexit57, %._crit_edge36.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader27.lr.ph, label %._crit_edge34

.preheader27.lr.ph:                               ; preds = %5
  br i1 true, label %.preheader27.us.preheader, label %._crit_edge34

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %6 = insertelement <2 x double> undef, double %2, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = insertelement <2 x double> undef, double %2, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge31.us, %.preheader27.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next, %._crit_edge31.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = icmp slt i64 %indvars.iv.next, 1000
  br i1 %10, label %.preheader.us.us.preheader, label %.preheader.us41.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %11 = sub nsw i64 0, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv
  %indvars.iv.next.us.us.prol = add nuw nsw i64 %indvars.iv, 2
  %14 = and i64 %indvars.iv, 1
  %15 = icmp eq i64 %14, 0
  %16 = icmp eq i32 %12, -998
  br label %.preheader.us.us

.preheader.us41.preheader:                        ; preds = %.preheader27.us
  br i1 true, label %.preheader.us41.prol.loopexit, label %.preheader.us41.prol.preheader

.preheader.us41.prol.preheader:                   ; preds = %.preheader.us41.preheader
  br label %.preheader.us41.prol

.preheader.us41.prol:                             ; preds = %.preheader.us41.prol.preheader, %.preheader.us41.prol
  br i1 true, label %.preheader.us41.prol.loopexit.loopexit, label %.preheader.us41.prol, !llvm.loop !1

.preheader.us41.prol.loopexit.loopexit:           ; preds = %.preheader.us41.prol
  br label %.preheader.us41.prol.loopexit

.preheader.us41.prol.loopexit:                    ; preds = %.preheader.us41.prol.loopexit.loopexit, %.preheader.us41.preheader
  br i1 false, label %._crit_edge31.us, label %.preheader.us41.preheader71

.preheader.us41.preheader71:                      ; preds = %.preheader.us41.prol.loopexit
  br i1 false, label %.preheader.us41.prol.preheader75, label %.preheader.us41.prol.loopexit76.unr-lcssa

.preheader.us41.prol.preheader75:                 ; preds = %.preheader.us41.preheader71
  br label %.preheader.us41.prol78

.preheader.us41.prol78:                           ; preds = %.preheader.us41.prol.preheader75
  br label %.preheader.us41.prol.loopexit76.unr-lcssa

.preheader.us41.prol.loopexit76.unr-lcssa:        ; preds = %.preheader.us41.preheader71, %.preheader.us41.prol78
  %indvars.iv35.us42.unr82.ph = phi i64 [ 4, %.preheader.us41.prol78 ], [ 0, %.preheader.us41.preheader71 ]
  br label %.preheader.us41.prol.loopexit76

.preheader.us41.prol.loopexit76:                  ; preds = %.preheader.us41.prol.loopexit76.unr-lcssa
  br i1 false, label %._crit_edge31.us.loopexit74, label %.preheader.us41.preheader71.new

.preheader.us41.preheader71.new:                  ; preds = %.preheader.us41.prol.loopexit76
  br label %.preheader.us41

.preheader.us41:                                  ; preds = %.preheader.us41, %.preheader.us41.preheader71.new
  %indvars.iv35.us42 = phi i64 [ %indvars.iv35.us42.unr82.ph, %.preheader.us41.preheader71.new ], [ %indvars.iv.next36.us55.3.1, %.preheader.us41 ]
  %.phi.trans.insert.us44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv35.us42
  %.pre38.us45.v.i0 = bitcast double* %.phi.trans.insert.us44 to <2 x double>*
  %.pre38.us45 = load <2 x double>, <2 x double>* %.pre38.us45.v.i0, align 8
  %17 = fmul <2 x double> %.pre38.us45, %7
  %18 = bitcast double* %.phi.trans.insert.us44 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next36.us55.1 = or i64 %indvars.iv35.us42, 2
  %.phi.trans.insert.us44.2 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv.next36.us55.1
  %.pre38.us45.2.v.i0 = bitcast double* %.phi.trans.insert.us44.2 to <2 x double>*
  %.pre38.us45.2 = load <2 x double>, <2 x double>* %.pre38.us45.2.v.i0, align 8
  %19 = fmul <2 x double> %.pre38.us45.2, %9
  %20 = bitcast double* %.phi.trans.insert.us44.2 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next36.us55.3 = add nuw nsw i64 %indvars.iv35.us42, 4
  %.phi.trans.insert.us44.1 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv.next36.us55.3
  %.pre38.us45.v.i0.1 = bitcast double* %.phi.trans.insert.us44.1 to <2 x double>*
  %.pre38.us45.1 = load <2 x double>, <2 x double>* %.pre38.us45.v.i0.1, align 8
  %21 = fmul <2 x double> %.pre38.us45.1, %7
  %22 = bitcast double* %.phi.trans.insert.us44.1 to <2 x double>*
  store <2 x double> %21, <2 x double>* %22, align 8
  %indvars.iv.next36.us55.1.1 = add nsw i64 %indvars.iv35.us42, 6
  %.phi.trans.insert.us44.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv.next36.us55.1.1
  %.pre38.us45.2.v.i0.1 = bitcast double* %.phi.trans.insert.us44.2.1 to <2 x double>*
  %.pre38.us45.2.1 = load <2 x double>, <2 x double>* %.pre38.us45.2.v.i0.1, align 8
  %23 = fmul <2 x double> %.pre38.us45.2.1, %9
  %24 = bitcast double* %.phi.trans.insert.us44.2.1 to <2 x double>*
  store <2 x double> %23, <2 x double>* %24, align 8
  %indvars.iv.next36.us55.3.1 = add nsw i64 %indvars.iv35.us42, 8
  %exitcond37.us56.3.1 = icmp eq i64 %indvars.iv.next36.us55.3.1, 1200
  br i1 %exitcond37.us56.3.1, label %._crit_edge31.us.loopexit74.unr-lcssa, label %.preheader.us41

._crit_edge31.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge31.us

._crit_edge31.us.loopexit74.unr-lcssa:            ; preds = %.preheader.us41
  br label %._crit_edge31.us.loopexit74

._crit_edge31.us.loopexit74:                      ; preds = %.preheader.us41.prol.loopexit76, %._crit_edge31.us.loopexit74.unr-lcssa
  br label %._crit_edge31.us

._crit_edge31.us:                                 ; preds = %._crit_edge31.us.loopexit74, %._crit_edge31.us.loopexit, %.preheader.us41.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge34.loopexit, label %.preheader27.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv35.us.us = phi i64 [ %indvars.iv.next36.us.us, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv35.us.us
  %.pre.us.us = load double, double* %25, align 8
  br i1 %15, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %26 = load double, double* %13, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv35.us.us
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %.pre.us.us, %29
  store double %30, double* %25, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %.lcssa.unr.ph = phi double [ %30, %.prol.preheader ], [ undef, %.preheader.us.us ]
  %.unr.ph = phi double [ %30, %.prol.preheader ], [ %.pre.us.us, %.preheader.us.us ]
  %indvars.iv.us.us.unr.ph = phi i64 [ %indvars.iv.next.us.us.prol, %.prol.preheader ], [ %indvars.iv.next, %.preheader.us.us ]
  br i1 %16, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %44, %._crit_edge.us.us.loopexit ]
  %31 = fmul double %.lcssa, %2
  store double %31, double* %25, align 8
  %indvars.iv.next36.us.us = add nuw nsw i64 %indvars.iv35.us.us, 1
  %exitcond37.us.us = icmp eq i64 %indvars.iv.next36.us.us, 1200
  br i1 %exitcond37.us.us, label %._crit_edge31.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %32 = phi double [ %44, %.preheader.us.us.new ], [ %.unr.ph, %.preheader.us.us.new.preheader ]
  %indvars.iv.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.preheader.us.us.new ], [ %indvars.iv.us.us.unr.ph, %.preheader.us.us.new.preheader ]
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.us.us, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.us.us, i64 %indvars.iv35.us.us
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %32, %37
  store double %38, double* %25, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next.us.us, i64 %indvars.iv35.us.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %25, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv.us.us, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.us.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge34.loopexit:                           ; preds = %._crit_edge31.us
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.preheader27.lr.ph, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %8 = mul i64 %indvars.iv, 1000
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %16 ]
  %10 = add i64 %indvars.iv.us, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.us
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %3
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
