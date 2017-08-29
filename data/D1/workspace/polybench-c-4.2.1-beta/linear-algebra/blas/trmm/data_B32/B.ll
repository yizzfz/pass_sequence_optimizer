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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = sext i32 %1 to i64
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %._crit_edge44

.preheader.lr.ph:                                 ; preds = %5
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %1 to double
  %11 = sitofp i32 %0 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br i1 %9, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge40.us
  %indvars.iv3341.us = phi i64 [ %indvars.iv.next34.us, %._crit_edge40.us ], [ 0, %.preheader.us.preheader ]
  %exitcond35.us = icmp eq i64 %indvars.iv3341.us, 0
  br i1 %exitcond35.us, label %._crit_edge.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv3341.us, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.preheader
  %14 = trunc i64 %indvars.iv3341.us to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %11
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3341.us, i64 0
  store double %17, double* %18, align 8
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol
  %indvars.iv36.us.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  %19 = icmp eq i64 %indvars.iv3341.us, 1
  br i1 %19, label %._crit_edge.us, label %.lr.ph.us.preheader58

.lr.ph.us.preheader58:                            ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph.us.prol.loopexit, %.preheader.us
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3341.us, i64 %indvars.iv3341.us
  store double 1.000000e+00, double* %20, align 8
  %21 = trunc i64 %indvars.iv3341.us to i32
  %22 = add i32 %21, %1
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57, %._crit_edge.us
  %indvars.iv3037.us = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next31.us, %._crit_edge57 ]
  %23 = sub nsw i64 0, %indvars.iv3037.us
  %24 = trunc i64 %23 to i32
  %25 = add i32 %22, %24
  %26 = srem i32 %25, %1
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %10
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3341.us, i64 %indvars.iv3037.us
  store double %28, double* %29, align 8
  %indvars.iv.next31.us = add nuw nsw i64 %indvars.iv3037.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next31.us, %6
  br i1 %exitcond46, label %._crit_edge40.us, label %._crit_edge57

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader58, %.lr.ph.us
  %indvars.iv36.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph.us ], [ %indvars.iv36.us.unr.ph, %.lr.ph.us.preheader58 ]
  %30 = add nuw nsw i64 %indvars.iv36.us, %indvars.iv3341.us
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %0
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3341.us, i64 %indvars.iv36.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv36.us, 1
  %35 = add nuw nsw i64 %indvars.iv.next.us, %indvars.iv3341.us
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %0
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fdiv <2 x double> %40, %13
  %42 = bitcast double* %34 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv36.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, %indvars.iv3341.us
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.lr.ph.us

._crit_edge40.us:                                 ; preds = %._crit_edge57
  %indvars.iv.next34.us = add nuw nsw i64 %indvars.iv3341.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next34.us, %7
  br i1 %exitcond47, label %._crit_edge44.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv3341 = phi i64 [ %indvars.iv.next34, %._crit_edge ], [ 0, %.preheader.preheader ]
  %exitcond35 = icmp eq i64 %indvars.iv3341, 0
  br i1 %exitcond35, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter49 = and i64 %indvars.iv3341, 1
  %lcmp.mod50 = icmp eq i64 %xtraiter49, 0
  br i1 %lcmp.mod50, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %43 = trunc i64 %indvars.iv3341 to i32
  %44 = srem i32 %43, %0
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %11
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3341, i64 0
  store double %46, double* %47, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv36.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %48 = icmp eq i64 %indvars.iv3341, 1
  br i1 %48, label %._crit_edge, label %.lr.ph.preheader59

.lr.ph.preheader59:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader59, %.lr.ph
  %indvars.iv36 = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv36.unr.ph, %.lr.ph.preheader59 ]
  %49 = add nuw nsw i64 %indvars.iv36, %indvars.iv3341
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %0
  %52 = sitofp i32 %51 to double
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3341, i64 %indvars.iv36
  %indvars.iv.next = add nuw nsw i64 %indvars.iv36, 1
  %54 = add nuw nsw i64 %indvars.iv.next, %indvars.iv3341
  %55 = trunc i64 %54 to i32
  %56 = srem i32 %55, %0
  %57 = sitofp i32 %56 to double
  %58 = insertelement <2 x double> undef, double %52, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fdiv <2 x double> %59, %13
  %61 = bitcast double* %53 to <2 x double>*
  store <2 x double> %60, <2 x double>* %61, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv36, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3341
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3341, i64 %indvars.iv3341
  store double 1.000000e+00, double* %62, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3341, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next34, %7
  br i1 %exitcond48, label %._crit_edge44.loopexit60, label %.preheader

._crit_edge44.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge44

._crit_edge44.loopexit60:                         ; preds = %._crit_edge
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit60, %._crit_edge44.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = sext i32 %1 to i64
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader27.lr.ph, label %._crit_edge42

.preheader27.lr.ph:                               ; preds = %5
  %9 = add i32 %0, -1
  %10 = icmp sgt i32 %1, 0
  %wide.trip.count = zext i32 %9 to i64
  br i1 %10, label %.preheader27.us.preheader, label %._crit_edge42

.preheader27.us.preheader:                        ; preds = %.preheader27.lr.ph
  %11 = add nsw i64 %wide.trip.count, -1
  %12 = add nsw i64 %6, -1
  %xtraiter58 = and i64 %6, 3
  %lcmp.mod59 = icmp eq i64 %xtraiter58, 0
  %13 = icmp ult i64 %12, 3
  %14 = insertelement <2 x double> undef, double %2, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = add nsw i64 %6, -4
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge38.us, %.preheader27.us.preheader
  %indvars.iv3239.us = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next33.us, %._crit_edge38.us ]
  %exitcond35.us = icmp eq i64 %wide.trip.count, %indvars.iv3239.us
  br i1 %exitcond35.us, label %.preheader.us43.preheader, label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %17 = sub i64 %wide.trip.count, %indvars.iv3239.us
  %xtraiter = and i64 %17, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp eq i64 %11, %indvars.iv3239.us
  %indvars.iv.next2936.us.us.prol = add nuw nsw i64 %indvars.iv3239.us, 1
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next2936.us.us.prol, i64 %indvars.iv3239.us
  br label %.preheader.us.us

.preheader.us43.preheader:                        ; preds = %.preheader27.us
  br i1 %lcmp.mod59, label %.preheader.us43.prol.loopexit, label %.preheader.us43.prol.preheader

.preheader.us43.prol.preheader:                   ; preds = %.preheader.us43.preheader
  br label %.preheader.us43.prol

.preheader.us43.prol:                             ; preds = %.preheader.us43.prol.preheader, %.preheader.us43.prol..preheader.us43.prol_crit_edge
  %indvars.iv3037.us44.prol = phi i64 [ %indvars.iv.next31.us45.prol, %.preheader.us43.prol..preheader.us43.prol_crit_edge ], [ 0, %.preheader.us43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.us43.prol..preheader.us43.prol_crit_edge ], [ %xtraiter58, %.preheader.us43.prol.preheader ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %wide.trip.count, i64 %indvars.iv3037.us44.prol
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %2
  store double %22, double* %20, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us43.prol.loopexit.loopexit, label %.preheader.us43.prol..preheader.us43.prol_crit_edge, !llvm.loop !1

.preheader.us43.prol..preheader.us43.prol_crit_edge: ; preds = %.preheader.us43.prol
  %indvars.iv.next31.us45.prol = add nuw nsw i64 %indvars.iv3037.us44.prol, 1
  br label %.preheader.us43.prol

.preheader.us43.prol.loopexit.loopexit:           ; preds = %.preheader.us43.prol
  br label %.preheader.us43.prol.loopexit

.preheader.us43.prol.loopexit:                    ; preds = %.preheader.us43.prol.loopexit.loopexit, %.preheader.us43.preheader
  %indvars.iv3037.us44.unr = phi i64 [ 0, %.preheader.us43.preheader ], [ %xtraiter58, %.preheader.us43.prol.loopexit.loopexit ]
  br i1 %13, label %._crit_edge38.us, label %.preheader.us43.preheader65

.preheader.us43.preheader65:                      ; preds = %.preheader.us43.prol.loopexit
  %23 = sub nsw i64 %16, %indvars.iv3037.us44.unr
  %24 = lshr i64 %23, 2
  %25 = and i64 %24, 1
  %lcmp.mod70 = icmp eq i64 %25, 0
  br i1 %lcmp.mod70, label %.preheader.us43.prol.preheader67, label %.preheader.us43.prol.loopexit68.unr-lcssa

.preheader.us43.prol.preheader67:                 ; preds = %.preheader.us43.preheader65
  br label %.preheader.us43.prol71

.preheader.us43.prol71:                           ; preds = %.preheader.us43.prol.preheader67
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %wide.trip.count, i64 %indvars.iv3037.us44.unr
  %27 = bitcast double* %26 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, %15
  store <2 x double> %29, <2 x double>* %27, align 8
  %indvars.iv.next31.us45.1.prol = add nuw nsw i64 %indvars.iv3037.us44.unr, 2
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %wide.trip.count, i64 %indvars.iv.next31.us45.1.prol
  %31 = bitcast double* %30 to <2 x double>*
  %32 = load <2 x double>, <2 x double>* %31, align 8
  %33 = fmul <2 x double> %32, %15
  store <2 x double> %33, <2 x double>* %31, align 8
  %indvars.iv.next31.us45.3.prol = or i64 %indvars.iv3037.us44.unr, 4
  br label %.preheader.us43.prol.loopexit68.unr-lcssa

.preheader.us43.prol.loopexit68.unr-lcssa:        ; preds = %.preheader.us43.preheader65, %.preheader.us43.prol71
  %indvars.iv3037.us44.unr73.ph = phi i64 [ %indvars.iv.next31.us45.3.prol, %.preheader.us43.prol71 ], [ %indvars.iv3037.us44.unr, %.preheader.us43.preheader65 ]
  br label %.preheader.us43.prol.loopexit68

.preheader.us43.prol.loopexit68:                  ; preds = %.preheader.us43.prol.loopexit68.unr-lcssa
  %34 = icmp eq i64 %24, 0
  br i1 %34, label %._crit_edge38.us.loopexit, label %.preheader.us43.preheader65.new

.preheader.us43.preheader65.new:                  ; preds = %.preheader.us43.prol.loopexit68
  br label %.preheader.us43

.preheader.us43:                                  ; preds = %.preheader.us43, %.preheader.us43.preheader65.new
  %indvars.iv3037.us44 = phi i64 [ %indvars.iv3037.us44.unr73.ph, %.preheader.us43.preheader65.new ], [ %indvars.iv.next31.us45.3.1, %.preheader.us43 ]
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %wide.trip.count, i64 %indvars.iv3037.us44
  %36 = bitcast double* %35 to <2 x double>*
  %37 = load <2 x double>, <2 x double>* %36, align 8
  %38 = fmul <2 x double> %37, %15
  store <2 x double> %38, <2 x double>* %36, align 8
  %indvars.iv.next31.us45.1 = add nsw i64 %indvars.iv3037.us44, 2
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %wide.trip.count, i64 %indvars.iv.next31.us45.1
  %40 = bitcast double* %39 to <2 x double>*
  %41 = load <2 x double>, <2 x double>* %40, align 8
  %42 = fmul <2 x double> %41, %15
  store <2 x double> %42, <2 x double>* %40, align 8
  %indvars.iv.next31.us45.3 = add nuw nsw i64 %indvars.iv3037.us44, 4
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %wide.trip.count, i64 %indvars.iv.next31.us45.3
  %44 = bitcast double* %43 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = fmul <2 x double> %45, %15
  store <2 x double> %46, <2 x double>* %44, align 8
  %indvars.iv.next31.us45.1.1 = add nsw i64 %indvars.iv3037.us44, 6
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %wide.trip.count, i64 %indvars.iv.next31.us45.1.1
  %48 = bitcast double* %47 to <2 x double>*
  %49 = load <2 x double>, <2 x double>* %48, align 8
  %50 = fmul <2 x double> %49, %15
  store <2 x double> %50, <2 x double>* %48, align 8
  %indvars.iv.next31.us45.3.1 = add nsw i64 %indvars.iv3037.us44, 8
  %exitcond55.3.1 = icmp eq i64 %indvars.iv.next31.us45.3.1, %6
  br i1 %exitcond55.3.1, label %._crit_edge38.us.loopexit.unr-lcssa, label %.preheader.us43

._crit_edge38.us.loopexit.unr-lcssa:              ; preds = %.preheader.us43
  br label %._crit_edge38.us.loopexit

._crit_edge38.us.loopexit:                        ; preds = %.preheader.us43.prol.loopexit68, %._crit_edge38.us.loopexit.unr-lcssa
  br label %._crit_edge38.us

._crit_edge38.us.loopexit66:                      ; preds = %._crit_edge.us.us
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit66, %._crit_edge38.us.loopexit, %.preheader.us43.prol.loopexit
  %indvars.iv.next33.us = add nuw nsw i64 %indvars.iv3239.us, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next33.us, %7
  br i1 %exitcond56, label %._crit_edge42.loopexit, label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv3037.us.us = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next31.us.us, %._crit_edge.us.us ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv3239.us, i64 %indvars.iv3037.us.us
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %52 = load double, double* %19, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next2936.us.us.prol, i64 %indvars.iv3037.us.us
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = load double, double* %51, align 8
  %57 = fadd double %56, %55
  store double %57, double* %51, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv.next2936.us.us.in.unr.ph = phi i64 [ %indvars.iv.next2936.us.us.prol, %.prol.preheader ], [ %indvars.iv3239.us, %.preheader.us.us ]
  %.pre64 = load double, double* %51, align 8
  br i1 %18, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %58 = phi double [ %.pre64, %.prol.loopexit ], [ %72, %._crit_edge.us.us.loopexit ]
  %59 = fmul double %58, %2
  store double %59, double* %51, align 8
  %indvars.iv.next31.us.us = add nuw nsw i64 %indvars.iv3037.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next31.us.us, %6
  br i1 %exitcond, label %._crit_edge38.us.loopexit66, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %60 = phi double [ %72, %.preheader.us.us.new ], [ %.pre64, %.preheader.us.us.new.preheader ]
  %indvars.iv.next2936.us.us.in = phi i64 [ %indvars.iv.next2936.us.us.1, %.preheader.us.us.new ], [ %indvars.iv.next2936.us.us.in.unr.ph, %.preheader.us.us.new.preheader ]
  %indvars.iv.next2936.us.us = add nuw nsw i64 %indvars.iv.next2936.us.us.in, 1
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next2936.us.us, i64 %indvars.iv3239.us
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next2936.us.us, i64 %indvars.iv3037.us.us
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %51, align 8
  %indvars.iv.next2936.us.us.1 = add nsw i64 %indvars.iv.next2936.us.us.in, 2
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next2936.us.us.1, i64 %indvars.iv3239.us
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next2936.us.us.1, i64 %indvars.iv3037.us.us
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %51, align 8
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next2936.us.us.1, %wide.trip.count
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge42.loopexit:                           ; preds = %._crit_edge38.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader27.lr.ph, %5
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
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv1215.us = phi i64 [ %indvars.iv.next13.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %12 = mul nsw i64 %indvars.iv1215.us, %9
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv14.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %13 = add nsw i64 %indvars.iv14.us, %12
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge21
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1215.us, i64 %indvars.iv14.us
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %8
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1215.us, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next13.us, %9
  br i1 %exitcond19, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
