; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge3._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %._crit_edge.preheader.us.preheader, label %._crit_edge4.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %10 = sitofp i32 %1 to double
  %11 = sitofp i32 %0 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = insertelement <2 x double> %12, double %10, i32 1
  %wide.trip.count19 = zext i32 %1 to i64
  %wide.trip.count23 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.us.preheader, %._crit_edge._crit_edge.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.us.preheader ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge.us ], [ 0, %._crit_edge.preheader.us ]
  %14 = mul nuw nsw i64 %indvars.iv17, %indvars.iv21
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv17
  %20 = add nuw nsw i64 %14, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %18, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fdiv <2 x double> %25, %13
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  store double %27, double* %19, align 8
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv21, i64 %indvars.iv17
  store double %28, double* %29, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count19
  br i1 %exitcond20, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge3.preheader, label %._crit_edge.preheader.us

._crit_edge3.preheader:                           ; preds = %._crit_edge._crit_edge.us
  %30 = icmp sgt i32 %0, 0
  br i1 %30, label %._crit_edge4.preheader.lr.ph, label %._crit_edge3._crit_edge

._crit_edge4.preheader.lr.ph:                     ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge3.preheader
  %31 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %._crit_edge4.preheader.us

._crit_edge4.preheader.us:                        ; preds = %._crit_edge3.us, %._crit_edge4.preheader.lr.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge3.us ], [ 0, %._crit_edge4.preheader.lr.ph ]
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us, %._crit_edge4.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge4.us ], [ 0, %._crit_edge4.preheader.us ]
  %32 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %33 = add nuw nsw i64 %32, 3
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %31
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge4.us

._crit_edge3.us:                                  ; preds = %._crit_edge4.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge3._crit_edge.loopexit, label %._crit_edge4.preheader.us

._crit_edge3._crit_edge.loopexit:                 ; preds = %._crit_edge3.us
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge3._crit_edge.loopexit, %7, %._crit_edge3.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge10

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count52 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %3, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %12 = insertelement <2 x double> undef, double %3, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count31 = zext i32 %1 to i64
  %wide.trip.count38 = zext i32 %0 to i64
  %14 = insertelement <2 x double> undef, double %3, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %3, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert81 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat82 = shufflevector <2 x double> %broadcast.splatinsert81, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge3._crit_edge.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge3._crit_edge.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge3._crit_edge.us ], [ 1, %.lr.ph.us.preheader ]
  %18 = add i64 %indvars.iv36, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 0
  %19 = mul i64 %indvars.iv36, 1201
  %20 = add i64 %19, 1
  %scevgep57 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %20
  %21 = add i64 %indvars.iv36, 1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %22 = trunc i64 %indvars.iv.next37 to i32
  %xtraiter = and i32 %22, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.prol
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %3
  store double %25, double* %23, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %._crit_edge.us.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %indvars.iv36, 3
  br i1 %26, label %._crit_edge4.preheader.us11.preheader, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  %27 = sub i64 %18, %indvars.iv.unr
  %28 = lshr i64 %27, 2
  %29 = and i64 %28, 1
  %lcmp.mod87 = icmp eq i64 %29, 0
  br i1 %lcmp.mod87, label %._crit_edge.us.prol.preheader84, label %._crit_edge.us.prol.loopexit85.unr-lcssa

._crit_edge.us.prol.preheader84:                  ; preds = %._crit_edge.us.preheader
  br label %._crit_edge.us.prol88

._crit_edge.us.prol88:                            ; preds = %._crit_edge.us.prol.preheader84
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.unr
  %31 = bitcast double* %30 to <2 x double>*
  %32 = load <2 x double>, <2 x double>* %31, align 8
  %33 = fmul <2 x double> %32, %15
  %34 = bitcast double* %30 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next.1.prol
  %36 = bitcast double* %35 to <2 x double>*
  %37 = load <2 x double>, <2 x double>* %36, align 8
  %38 = fmul <2 x double> %37, %17
  %39 = bitcast double* %35 to <2 x double>*
  store <2 x double> %38, <2 x double>* %39, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %._crit_edge.us.prol.loopexit85.unr-lcssa

._crit_edge.us.prol.loopexit85.unr-lcssa:         ; preds = %._crit_edge.us.preheader, %._crit_edge.us.prol88
  %indvars.iv.unr90.ph = phi i64 [ %indvars.iv.next.3.prol, %._crit_edge.us.prol88 ], [ %indvars.iv.unr, %._crit_edge.us.preheader ]
  br label %._crit_edge.us.prol.loopexit85

._crit_edge.us.prol.loopexit85:                   ; preds = %._crit_edge.us.prol.loopexit85.unr-lcssa
  %40 = icmp eq i64 %28, 0
  br i1 %40, label %._crit_edge4.preheader.us11.preheader.loopexit, label %._crit_edge.us.preheader.new

._crit_edge.us.preheader.new:                     ; preds = %._crit_edge.us.prol.loopexit85
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr90.ph, %._crit_edge.us.preheader.new ], [ %indvars.iv.next.3.1, %._crit_edge.us ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv
  %42 = bitcast double* %41 to <2 x double>*
  %43 = load <2 x double>, <2 x double>* %42, align 8
  %44 = fmul <2 x double> %43, %15
  %45 = bitcast double* %41 to <2 x double>*
  store <2 x double> %44, <2 x double>* %45, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next.1
  %47 = bitcast double* %46 to <2 x double>*
  %48 = load <2 x double>, <2 x double>* %47, align 8
  %49 = fmul <2 x double> %48, %17
  %50 = bitcast double* %46 to <2 x double>*
  store <2 x double> %49, <2 x double>* %50, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next.3
  %52 = bitcast double* %51 to <2 x double>*
  %53 = load <2 x double>, <2 x double>* %52, align 8
  %54 = fmul <2 x double> %53, %15
  %55 = bitcast double* %51 to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next.1.1
  %57 = bitcast double* %56 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %59 = fmul <2 x double> %58, %17
  %60 = bitcast double* %56 to <2 x double>*
  store <2 x double> %59, <2 x double>* %60, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv34
  br i1 %exitcond.3.1, label %._crit_edge4.preheader.us11.preheader.loopexit.unr-lcssa, label %._crit_edge.us

._crit_edge4.preheader.us11.preheader.loopexit.unr-lcssa: ; preds = %._crit_edge.us
  br label %._crit_edge4.preheader.us11.preheader.loopexit

._crit_edge4.preheader.us11.preheader.loopexit:   ; preds = %._crit_edge.us.prol.loopexit85, %._crit_edge4.preheader.us11.preheader.loopexit.unr-lcssa
  br label %._crit_edge4.preheader.us11.preheader

._crit_edge4.preheader.us11.preheader:            ; preds = %._crit_edge4.preheader.us11.preheader.loopexit, %._crit_edge.us.prol.loopexit
  %min.iters.check = icmp ult i64 %21, 2
  %n.vec = and i64 %21, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %21, %n.vec
  br label %._crit_edge4.preheader.us11

._crit_edge4.preheader.us11:                      ; preds = %._crit_edge4.preheader.us11.preheader, %._crit_edge3.us17
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge3.us17 ], [ 0, %._crit_edge4.preheader.us11.preheader ]
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv29
  %61 = add i64 %indvars.iv29, 1
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %61
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv29
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv36, i64 %61
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv29
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv29
  br i1 %min.iters.check, label %._crit_edge4.us14.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge4.preheader.us11
  br i1 %cmp.zero, label %._crit_edge4.us14.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %63
  %bound1 = icmp ult double* %63, %scevgep57
  %found.conflict = and i1 %bound0, %bound1
  %bound068 = icmp ult double* %scevgep, %scevgep61
  %bound169 = icmp ult double* %scevgep59, %scevgep57
  %found.conflict70 = and i1 %bound068, %bound169
  %conflict.rdx = or i1 %found.conflict, %found.conflict70
  %bound071 = icmp ult double* %scevgep, %scevgep65
  %bound172 = icmp ult double* %scevgep63, %scevgep57
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx74 = or i1 %conflict.rdx, %found.conflict73
  %bound077 = icmp ult double* %scevgep, %62
  %bound178 = icmp ult double* %62, %scevgep57
  %found.conflict79 = and i1 %bound077, %bound178
  %conflict.rdx80 = or i1 %conflict.rdx74, %found.conflict79
  br i1 %conflict.rdx80, label %._crit_edge4.us14.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %64 = load double, double* %62, align 8, !alias.scope !3
  %65 = insertelement <2 x double> undef, double %64, i32 0
  %66 = shufflevector <2 x double> %65, <2 x double> undef, <2 x i32> zeroinitializer
  %67 = load double, double* %63, align 8, !alias.scope !6
  %68 = insertelement <2 x double> undef, double %67, i32 0
  %69 = shufflevector <2 x double> %68, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %70 = or i64 %index, 1
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv29
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %70, i64 %indvars.iv29
  %73 = load double, double* %71, align 8, !alias.scope !8
  %74 = load double, double* %72, align 8, !alias.scope !8
  %75 = insertelement <2 x double> undef, double %73, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %76, %broadcast.splat82
  %78 = fmul <2 x double> %77, %66
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv29
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %70, i64 %indvars.iv29
  %81 = load double, double* %79, align 8, !alias.scope !10
  %82 = load double, double* %80, align 8, !alias.scope !10
  %83 = insertelement <2 x double> undef, double %81, i32 0
  %84 = insertelement <2 x double> %83, double %82, i32 1
  %85 = fmul <2 x double> %84, %broadcast.splat82
  %86 = fmul <2 x double> %85, %69
  %87 = fadd <2 x double> %78, %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %index
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !12, !noalias !14
  %90 = fadd <2 x double> %wide.load, %87
  %91 = bitcast double* %88 to <2 x double>*
  store <2 x double> %90, <2 x double>* %91, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 2
  %92 = icmp eq i64 %index.next, %n.vec
  br i1 %92, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge3.us17, label %._crit_edge4.us14.preheader

._crit_edge4.us14.preheader:                      ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge4.preheader.us11
  %indvars.iv24.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge4.preheader.us11 ], [ %n.vec, %middle.block ]
  br label %._crit_edge4.us14

._crit_edge4.us14:                                ; preds = %._crit_edge4.us14.preheader, %._crit_edge4.us14
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge4.us14 ], [ %indvars.iv24.ph, %._crit_edge4.us14.preheader ]
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv29
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, %2
  %96 = load double, double* %62, align 8
  %97 = fmul double %95, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv24, i64 %indvars.iv29
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, %2
  %101 = load double, double* %63, align 8
  %102 = fmul double %100, %101
  %103 = fadd double %97, %102
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv24
  %105 = load double, double* %104, align 8
  %106 = fadd double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, %indvars.iv34
  br i1 %exitcond, label %._crit_edge3.us17.loopexit, label %._crit_edge4.us14, !llvm.loop !18

._crit_edge3.us17.loopexit:                       ; preds = %._crit_edge4.us14
  br label %._crit_edge3.us17

._crit_edge3.us17:                                ; preds = %._crit_edge3.us17.loopexit, %middle.block
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next30, %wide.trip.count31
  br i1 %exitcond32, label %._crit_edge3._crit_edge.us, label %._crit_edge4.preheader.us11

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge3.us17
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge10.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge3.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge3.preheader ], [ 0, %.lr.ph.preheader ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge3.preheader ], [ 1, %.lr.ph.preheader ]
  %107 = add i64 %indvars.iv50, -3
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %108 = trunc i64 %indvars.iv.next51 to i32
  %xtraiter45 = and i32 %108, 3
  %lcmp.mod46 = icmp eq i32 %xtraiter45, 0
  br i1 %lcmp.mod46, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv40.prol = phi i64 [ %indvars.iv.next41.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter47 = phi i32 [ %prol.iter47.sub, %._crit_edge.prol ], [ %xtraiter45, %._crit_edge.prol.preheader ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv40.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next41.prol = add nuw nsw i64 %indvars.iv40.prol, 1
  %prol.iter47.sub = add i32 %prol.iter47, -1
  %prol.iter47.cmp = icmp eq i32 %prol.iter47.sub, 0
  br i1 %prol.iter47.cmp, label %._crit_edge.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !19

._crit_edge.prol.loopexit.loopexit:               ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv40.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next41.prol, %._crit_edge.prol.loopexit.loopexit ]
  %112 = icmp ult i64 %indvars.iv50, 3
  br i1 %112, label %._crit_edge3.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.prol.loopexit
  %113 = sub i64 %107, %indvars.iv40.unr
  %114 = lshr i64 %113, 2
  %115 = and i64 %114, 1
  %lcmp.mod94 = icmp eq i64 %115, 0
  br i1 %lcmp.mod94, label %._crit_edge.prol.preheader91, label %._crit_edge.prol.loopexit92.unr-lcssa

._crit_edge.prol.preheader91:                     ; preds = %._crit_edge.preheader
  br label %._crit_edge.prol95

._crit_edge.prol95:                               ; preds = %._crit_edge.prol.preheader91
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv40.unr
  %117 = bitcast double* %116 to <2 x double>*
  %118 = load <2 x double>, <2 x double>* %117, align 8
  %119 = fmul <2 x double> %118, %11
  %120 = bitcast double* %116 to <2 x double>*
  store <2 x double> %119, <2 x double>* %120, align 8
  %indvars.iv.next41.1.prol = add nsw i64 %indvars.iv40.unr, 2
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next41.1.prol
  %122 = bitcast double* %121 to <2 x double>*
  %123 = load <2 x double>, <2 x double>* %122, align 8
  %124 = fmul <2 x double> %123, %13
  %125 = bitcast double* %121 to <2 x double>*
  store <2 x double> %124, <2 x double>* %125, align 8
  %indvars.iv.next41.3.prol = add nsw i64 %indvars.iv40.unr, 4
  br label %._crit_edge.prol.loopexit92.unr-lcssa

._crit_edge.prol.loopexit92.unr-lcssa:            ; preds = %._crit_edge.preheader, %._crit_edge.prol95
  %indvars.iv40.unr97.ph = phi i64 [ %indvars.iv.next41.3.prol, %._crit_edge.prol95 ], [ %indvars.iv40.unr, %._crit_edge.preheader ]
  br label %._crit_edge.prol.loopexit92

._crit_edge.prol.loopexit92:                      ; preds = %._crit_edge.prol.loopexit92.unr-lcssa
  %126 = icmp eq i64 %114, 0
  br i1 %126, label %._crit_edge3.preheader.loopexit, label %._crit_edge.preheader.new

._crit_edge.preheader.new:                        ; preds = %._crit_edge.prol.loopexit92
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader.new
  %indvars.iv40 = phi i64 [ %indvars.iv40.unr97.ph, %._crit_edge.preheader.new ], [ %indvars.iv.next41.3.1, %._crit_edge ]
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv40
  %128 = bitcast double* %127 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %128, align 8
  %130 = fmul <2 x double> %129, %11
  %131 = bitcast double* %127 to <2 x double>*
  store <2 x double> %130, <2 x double>* %131, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next41.1
  %133 = bitcast double* %132 to <2 x double>*
  %134 = load <2 x double>, <2 x double>* %133, align 8
  %135 = fmul <2 x double> %134, %13
  %136 = bitcast double* %132 to <2 x double>*
  store <2 x double> %135, <2 x double>* %136, align 8
  %indvars.iv.next41.3 = add nsw i64 %indvars.iv40, 4
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next41.3
  %138 = bitcast double* %137 to <2 x double>*
  %139 = load <2 x double>, <2 x double>* %138, align 8
  %140 = fmul <2 x double> %139, %11
  %141 = bitcast double* %137 to <2 x double>*
  store <2 x double> %140, <2 x double>* %141, align 8
  %indvars.iv.next41.1.1 = add nsw i64 %indvars.iv40, 6
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next41.1.1
  %143 = bitcast double* %142 to <2 x double>*
  %144 = load <2 x double>, <2 x double>* %143, align 8
  %145 = fmul <2 x double> %144, %13
  %146 = bitcast double* %142 to <2 x double>*
  store <2 x double> %145, <2 x double>* %146, align 8
  %indvars.iv.next41.3.1 = add nsw i64 %indvars.iv40, 8
  %exitcond44.3.1 = icmp eq i64 %indvars.iv.next41.3.1, %indvars.iv48
  br i1 %exitcond44.3.1, label %._crit_edge3.preheader.loopexit.unr-lcssa, label %._crit_edge

._crit_edge3.preheader.loopexit.unr-lcssa:        ; preds = %._crit_edge
  br label %._crit_edge3.preheader.loopexit

._crit_edge3.preheader.loopexit:                  ; preds = %._crit_edge.prol.loopexit92, %._crit_edge3.preheader.loopexit.unr-lcssa
  br label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge3.preheader.loopexit, %._crit_edge.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge10.loopexit83, label %.lr.ph

._crit_edge10.loopexit:                           ; preds = %._crit_edge3._crit_edge.us
  br label %._crit_edge10

._crit_edge10.loopexit83:                         ; preds = %._crit_edge3.preheader
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit83, %._crit_edge10.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us ], [ 0, %._crit_edge.preheader.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!11}
!11 = distinct !{!11, !5}
!12 = !{!13}
!13 = distinct !{!13, !5}
!14 = !{!7, !9, !11, !4}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !16, !17}
!19 = distinct !{!19, !2}
