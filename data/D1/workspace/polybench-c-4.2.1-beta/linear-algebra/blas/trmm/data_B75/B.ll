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
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge35

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count54 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %12 = and i32 %1, 1
  %lcmp.mod59 = icmp eq i32 %12, 0
  %13 = icmp eq i32 %1, 1
  %wide.trip.count45 = zext i32 %0 to i64
  %wide.trip.count41.1 = zext i32 %1 to i64
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %8, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us, %.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next44, %._crit_edge32.us ]
  %18 = icmp sgt i64 %indvars.iv43, 0
  br i1 %18, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv43
  store double 1.000000e+00, double* %19, align 8
  %20 = trunc i64 %indvars.iv43 to i32
  %21 = add i32 %20, %1
  br i1 %lcmp.mod59, label %.prol.loopexit57, label %.prol.preheader56

.prol.preheader56:                                ; preds = %._crit_edge.us
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 0
  store double %24, double* %25, align 8
  br label %.prol.loopexit57

.prol.loopexit57:                                 ; preds = %._crit_edge.us, %.prol.preheader56
  %indvars.iv39.unr.ph = phi i64 [ 1, %.prol.preheader56 ], [ 0, %._crit_edge.us ]
  br i1 %13, label %._crit_edge32.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit57
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %._crit_edge.us.new ], [ %indvars.iv39.unr.ph, %._crit_edge.us.new.preheader ]
  %26 = trunc i64 %indvars.iv39 to i32
  %27 = sub i32 %21, %26
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv39
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %31 = trunc i64 %indvars.iv.next40 to i32
  %32 = sub i32 %21, %31
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %29, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fdiv <2 x double> %36, %17
  %38 = bitcast double* %30 to <2 x double>*
  store <2 x double> %37, <2 x double>* %38, align 8
  %indvars.iv.next40.1 = add nuw nsw i64 %indvars.iv39, 2
  %exitcond42.1 = icmp eq i64 %indvars.iv.next40.1, %wide.trip.count41.1
  br i1 %exitcond42.1, label %._crit_edge32.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %39 = add nuw nsw i64 %indvars.iv, %indvars.iv43
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = add nuw nsw i64 %indvars.iv.next, %indvars.iv43
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fdiv <2 x double> %49, %15
  %51 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv43
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv43, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %52 = trunc i64 %indvars.iv43 to i32
  %53 = srem i32 %52, %0
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, %9
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 0
  store double %55, double* %56, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %57 = icmp eq i64 %indvars.iv43, 1
  br i1 %57, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %.prol.loopexit57
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %._crit_edge35.loopexit, label %.preheader.us

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next53, %._crit_edge ]
  %58 = icmp sgt i64 %indvars.iv52, 0
  br i1 %58, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter62 = and i64 %indvars.iv52, 1
  %lcmp.mod63 = icmp eq i64 %xtraiter62, 0
  br i1 %lcmp.mod63, label %.prol.loopexit61, label %.prol.preheader60

.prol.preheader60:                                ; preds = %.lr.ph
  %59 = trunc i64 %indvars.iv52 to i32
  %60 = srem i32 %59, %0
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, %9
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 0
  store double %62, double* %63, align 8
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.lr.ph, %.prol.preheader60
  %indvars.iv47.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph ]
  %64 = icmp eq i64 %indvars.iv52, 1
  br i1 %64, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit61
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %.lr.ph.new ], [ %indvars.iv47.unr.ph, %.lr.ph.new.preheader ]
  %65 = add nuw nsw i64 %indvars.iv47, %indvars.iv52
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, %0
  %68 = sitofp i32 %67 to double
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv47
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %70 = add nuw nsw i64 %indvars.iv.next48, %indvars.iv52
  %71 = trunc i64 %70 to i32
  %72 = srem i32 %71, %0
  %73 = sitofp i32 %72 to double
  %74 = insertelement <2 x double> undef, double %68, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fdiv <2 x double> %75, %11
  %77 = bitcast double* %69 to <2 x double>*
  store <2 x double> %76, <2 x double>* %77, align 8
  %indvars.iv.next48.1 = add nuw nsw i64 %indvars.iv47, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next48.1, %indvars.iv52
  br i1 %exitcond51.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit61, %.preheader
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv52, i64 %indvars.iv52
  store double 1.000000e+00, double* %78, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge35.loopexit66, label %.preheader

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35.loopexit66:                         ; preds = %._crit_edge
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit66, %._crit_edge35.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader27.us.preheader, label %._crit_edge31

.preheader27.us.preheader:                        ; preds = %5
  %8 = sext i32 %0 to i64
  %9 = zext i32 %1 to i64
  %10 = add nsw i64 %9, -1
  %11 = zext i32 %0 to i64
  %12 = add nuw nsw i64 %11, 1
  %13 = add nsw i64 %11, -2
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = icmp ult i64 %10, 3
  %15 = insertelement <2 x double> undef, double %2, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = insertelement <2 x double> undef, double %2, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next53, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv42 = phi i64 [ 1, %.preheader27.us.preheader ], [ %indvars.iv.next43, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %19 = icmp slt i64 %indvars.iv.next53, %8
  br i1 %19, label %.preheader.us.us.preheader, label %.preheader.us32.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %20 = sub i64 %12, %indvars.iv52
  %xtraiter57 = and i64 %20, 1
  %lcmp.mod58 = icmp eq i64 %xtraiter57, 0
  %21 = icmp eq i64 %13, %indvars.iv52
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv52
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader.us.us

.preheader.us32.preheader:                        ; preds = %.preheader27.us
  br i1 %lcmp.mod, label %.preheader.us32.prol.loopexit, label %.preheader.us32.prol.preheader

.preheader.us32.prol.preheader:                   ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol

.preheader.us32.prol:                             ; preds = %.preheader.us32.prol.preheader, %.preheader.us32.prol..preheader.us32.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ 0, %.preheader.us32.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ %xtraiter, %.preheader.us32.prol.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.prol
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %2
  store double %25, double* %23, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us32.prol.loopexit.loopexit, label %.preheader.us32.prol..preheader.us32.prol_crit_edge, !llvm.loop !1

.preheader.us32.prol..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us32.prol

.preheader.us32.prol.loopexit.loopexit:           ; preds = %.preheader.us32.prol
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol.loopexit:                    ; preds = %.preheader.us32.prol.loopexit.loopexit, %.preheader.us32.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us32.preheader ], [ %xtraiter, %.preheader.us32.prol.loopexit.loopexit ]
  br i1 %14, label %..loopexit_crit_edge.us, label %.preheader.us32.preheader64

.preheader.us32.preheader64:                      ; preds = %.preheader.us32.prol.loopexit
  br label %.preheader.us32

.preheader.us32:                                  ; preds = %.preheader.us32.preheader64, %.preheader.us32
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us32 ], [ %indvars.iv.unr, %.preheader.us32.preheader64 ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv
  %27 = bitcast double* %26 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, %16
  %30 = bitcast double* %26 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next.1
  %32 = bitcast double* %31 to <2 x double>*
  %33 = load <2 x double>, <2 x double>* %32, align 8
  %34 = fmul <2 x double> %33, %18
  %35 = bitcast double* %31 to <2 x double>*
  store <2 x double> %34, <2 x double>* %35, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %9
  br i1 %exitcond.3, label %..loopexit_crit_edge.us.loopexit65, label %.preheader.us32

..loopexit_crit_edge.us.loopexit:                 ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us.loopexit65:               ; preds = %.preheader.us32
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit65, %..loopexit_crit_edge.us.loopexit, %.preheader.us32.prol.loopexit
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %11
  br i1 %exitcond55, label %._crit_edge31.loopexit, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv48 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next49, %._crit_edge.us.us ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv48
  br i1 %lcmp.mod58, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %37 = load double, double* %22, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv48
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = load double, double* %36, align 8
  %42 = fadd double %41, %40
  store double %42, double* %36, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv44.unr.ph = phi i64 [ %indvars.iv.next45.prol, %.prol.preheader ], [ %indvars.iv42, %.preheader.us.us ]
  %.pre63 = load double, double* %36, align 8
  br i1 %21, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %43 = phi double [ %.pre63, %.prol.loopexit ], [ %57, %._crit_edge.us.us.loopexit ]
  %44 = fmul double %43, %2
  store double %44, double* %36, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %9
  br i1 %exitcond51, label %..loopexit_crit_edge.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %45 = phi double [ %57, %.preheader.us.us.new ], [ %.pre63, %.preheader.us.us.new.preheader ]
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %.preheader.us.us.new ], [ %indvars.iv44.unr.ph, %.preheader.us.us.new.preheader ]
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv52
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv48
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %45, %50
  store double %51, double* %36, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next45, i64 %indvars.iv52
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next45, i64 %indvars.iv48
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %51, %56
  store double %57, double* %36, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next45.1, %11
  br i1 %exitcond47.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge31.loopexit:                           ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %5
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
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
