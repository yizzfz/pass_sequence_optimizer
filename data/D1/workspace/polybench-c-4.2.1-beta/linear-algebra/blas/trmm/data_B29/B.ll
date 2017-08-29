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
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge9

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count28 = zext i32 %0 to i64
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count15 = zext i32 %1 to i64
  %wide.trip.count19 = zext i32 %0 to i64
  %xtraiter36 = and i64 %wide.trip.count15, 1
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  %10 = icmp eq i32 %1, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge6.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge6.us ], [ 0, %.preheader.us.preheader ]
  %11 = icmp sgt i64 %indvars.iv17, 0
  br i1 %11, label %._crit_edge31.preheader, label %._crit_edge.us

._crit_edge31.preheader:                          ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv17, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge31.prol.loopexit.unr-lcssa, label %._crit_edge31.prol.preheader

._crit_edge31.prol.preheader:                     ; preds = %._crit_edge31.preheader
  br label %._crit_edge31.prol

._crit_edge31.prol:                               ; preds = %._crit_edge31.prol.preheader
  %12 = trunc i64 %indvars.iv17 to i32
  %13 = srem i32 %12, %0
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %9
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 0
  store double %15, double* %16, align 8
  br label %._crit_edge31.prol.loopexit.unr-lcssa

._crit_edge31.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge31.preheader, %._crit_edge31.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge31.prol ], [ 0, %._crit_edge31.preheader ]
  br label %._crit_edge31.prol.loopexit

._crit_edge31.prol.loopexit:                      ; preds = %._crit_edge31.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %indvars.iv17, 1
  br i1 %17, label %._crit_edge.us.loopexit, label %._crit_edge31.preheader.new

._crit_edge31.preheader.new:                      ; preds = %._crit_edge31.prol.loopexit
  br label %._crit_edge31

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge31
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge31.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv17
  store double 1.000000e+00, double* %18, align 8
  %19 = trunc i64 %indvars.iv17 to i32
  %20 = add i32 %19, %1
  br i1 %lcmp.mod37, label %._crit_edge30.prol.loopexit.unr-lcssa, label %._crit_edge30.prol.preheader

._crit_edge30.prol.preheader:                     ; preds = %._crit_edge.us
  br label %._crit_edge30.prol

._crit_edge30.prol:                               ; preds = %._crit_edge30.prol.preheader
  %21 = srem i32 %20, %1
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 0
  store double %23, double* %24, align 8
  br label %._crit_edge30.prol.loopexit.unr-lcssa

._crit_edge30.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge.us, %._crit_edge30.prol
  %indvars.iv13.unr.ph = phi i64 [ 1, %._crit_edge30.prol ], [ 0, %._crit_edge.us ]
  br label %._crit_edge30.prol.loopexit

._crit_edge30.prol.loopexit:                      ; preds = %._crit_edge30.prol.loopexit.unr-lcssa
  br i1 %10, label %._crit_edge6.us, label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge30.prol.loopexit
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30, %._crit_edge.us.new
  %indvars.iv13 = phi i64 [ %indvars.iv13.unr.ph, %._crit_edge.us.new ], [ %indvars.iv.next14.1, %._crit_edge30 ]
  %25 = trunc i64 %indvars.iv13 to i32
  %26 = sub i32 %20, %25
  %27 = srem i32 %26, %1
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, %8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv13
  store double %29, double* %30, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %31 = trunc i64 %indvars.iv.next14 to i32
  %32 = sub i32 %20, %31
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv.next14
  store double %35, double* %36, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next14.1, %wide.trip.count15
  br i1 %exitcond16.1, label %._crit_edge6.us.unr-lcssa, label %._crit_edge30

._crit_edge31:                                    ; preds = %._crit_edge31, %._crit_edge31.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge31.preheader.new ], [ %indvars.iv.next.1, %._crit_edge31 ]
  %37 = add nuw nsw i64 %indvars.iv, %indvars.iv17
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %0
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %9
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv
  store double %41, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = add nuw nsw i64 %indvars.iv.next, %indvars.iv17
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv.next
  store double %47, double* %48, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv17
  br i1 %exitcond.1, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge31

._crit_edge6.us.unr-lcssa:                        ; preds = %._crit_edge30
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge30.prol.loopexit, %._crit_edge6.us.unr-lcssa
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count19
  br i1 %exitcond20, label %._crit_edge9.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge ], [ 0, %.preheader.preheader ]
  %49 = icmp sgt i64 %indvars.iv26, 0
  br i1 %49, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter38 = and i64 %indvars.iv26, 1
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %50 = trunc i64 %indvars.iv26 to i32
  %51 = srem i32 %50, %0
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %9
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 0
  store double %53, double* %54, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv21.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %55 = icmp eq i64 %indvars.iv26, 1
  br i1 %55, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next22.1, %.lr.ph ]
  %56 = add nuw nsw i64 %indvars.iv21, %indvars.iv26
  %57 = trunc i64 %56 to i32
  %58 = srem i32 %57, %0
  %59 = sitofp i32 %58 to double
  %60 = fdiv double %59, %9
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv21
  store double %60, double* %61, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %62 = add nuw nsw i64 %indvars.iv.next22, %indvars.iv26
  %63 = trunc i64 %62 to i32
  %64 = srem i32 %63, %0
  %65 = sitofp i32 %64 to double
  %66 = fdiv double %65, %9
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv.next22
  store double %66, double* %67, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond25.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv26
  br i1 %exitcond25.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv26
  store double 1.000000e+00, double* %68, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond29, label %._crit_edge9.loopexit35, label %.preheader

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9.loopexit35:                          ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit35, %._crit_edge9.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader3.us.preheader, label %._crit_edge9

.preheader3.us.preheader:                         ; preds = %5
  %8 = sext i32 %0 to i64
  %wide.trip.count32 = zext i32 %0 to i64
  %wide.trip.count28 = zext i32 %1 to i64
  %9 = add nuw nsw i64 %wide.trip.count32, 1
  %10 = add nsw i64 %wide.trip.count32, -2
  %min.iters.check = icmp ult i32 %1, 4
  %11 = and i32 %1, 3
  %n.mod.vf = zext i32 %11 to i64
  %n.vec = sub nsw i64 %wide.trip.count28, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert39 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat40 = shufflevector <2 x double> %broadcast.splatinsert39, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %11, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge7.us, %.preheader3.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next31, %._crit_edge7.us ]
  %indvars.iv20 = phi i64 [ 1, %.preheader3.us.preheader ], [ %indvars.iv.next21, %._crit_edge7.us ]
  %12 = sub i64 %9, %indvars.iv30
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %13 = icmp slt i64 %indvars.iv.next31, %8
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us10.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %xtraiter = and i64 %12, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv30
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv20, 1
  %15 = icmp eq i64 %10, %indvars.iv30
  br label %.preheader.us.us

.preheader.us10.preheader:                        ; preds = %.preheader3.us
  br i1 %min.iters.check, label %.preheader.us10.preheader41, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us10.preheader
  br i1 %cmp.zero, label %.preheader.us10.preheader41, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %19, align 8
  %20 = fmul <2 x double> %wide.load, %broadcast.splat40
  %21 = fmul <2 x double> %wide.load38, %broadcast.splat40
  store <2 x double> %20, <2 x double>* %17, align 8
  store <2 x double> %21, <2 x double>* %19, align 8
  %index.next = add i64 %index, 4
  %22 = icmp eq i64 %index.next, %n.vec
  br i1 %22, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge7.us, label %.preheader.us10.preheader41

.preheader.us10.preheader41:                      ; preds = %middle.block, %min.iters.checked, %.preheader.us10.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.preheader.us10.preheader ], [ %n.vec, %middle.block ]
  br label %.preheader.us10

.preheader.us10:                                  ; preds = %.preheader.us10.preheader41, %.preheader.us10
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader.us10 ], [ %indvars.iv.ph, %.preheader.us10.preheader41 ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %2
  store double %25, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count28
  br i1 %exitcond, label %._crit_edge7.us.loopexit42, label %.preheader.us10, !llvm.loop !4

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge7.us

._crit_edge7.us.loopexit42:                       ; preds = %.preheader.us10
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit42, %._crit_edge7.us.loopexit, %middle.block
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br i1 %exitcond33, label %._crit_edge9.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv26
  %.pre = load double, double* %26, align 8
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader.us.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %27 = load double, double* %14, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv26
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %.pre, %30
  store double %31, double* %26, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.preheader.us.us, %._crit_edge.prol
  %.lcssa.unr.ph = phi double [ %31, %._crit_edge.prol ], [ undef, %.preheader.us.us ]
  %.unr.ph = phi double [ %31, %._crit_edge.prol ], [ %.pre, %.preheader.us.us ]
  %indvars.iv22.unr.ph = phi i64 [ %indvars.iv.next23.prol, %._crit_edge.prol ], [ %indvars.iv20, %.preheader.us.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 %15, label %._crit_edge.us.us, label %.preheader.us.us.new

.preheader.us.us.new:                             ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge.prol.loopexit ], [ %45, %._crit_edge.us.us.unr-lcssa ]
  %32 = fmul double %.lcssa, %2
  store double %32, double* %26, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond29, label %._crit_edge7.us.loopexit, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us.new
  %33 = phi double [ %.unr.ph, %.preheader.us.us.new ], [ %45, %._crit_edge ]
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr.ph, %.preheader.us.us.new ], [ %indvars.iv.next23.1, %._crit_edge ]
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv30
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv26
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %33, %38
  store double %39, double* %26, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv30
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next23, i64 %indvars.iv26
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %39, %44
  store double %45, double* %26, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond25.1 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count32
  br i1 %exitcond25.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge

._crit_edge9.loopexit:                            ; preds = %._crit_edge7.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %5
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
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
