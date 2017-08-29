; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.preheader.lr.ph, label %._crit_edge3._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %0 to double
  br i1 %8, label %._crit_edge.preheader.us.preheader, label %._crit_edge4.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count19 = zext i32 %1 to i64
  %wide.trip.count23 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.us.preheader, %._crit_edge._crit_edge.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.us.preheader ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next18, %._crit_edge.us ]
  %10 = mul nuw nsw i64 %indvars.iv17, %indvars.iv21
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, %0
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %9
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv17
  store double %15, double* %16, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count19
  br i1 %exitcond20, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge3.preheader, label %._crit_edge.preheader.us

._crit_edge3.preheader:                           ; preds = %._crit_edge._crit_edge.us
  %17 = icmp sgt i32 %0, 0
  br i1 %17, label %._crit_edge4.preheader.lr.ph, label %._crit_edge3._crit_edge

._crit_edge4.preheader.lr.ph:                     ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge3.preheader
  %18 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %._crit_edge4.preheader.us

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4._crit_edge.us, %._crit_edge4.preheader.lr.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge4._crit_edge.us ], [ 0, %._crit_edge4.preheader.lr.ph ]
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us, %._crit_edge4.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge4.preheader.us ], [ %indvars.iv.next, %._crit_edge4.us ]
  %19 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %20 = add nuw nsw i64 %19, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %18
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv
  store double %24, double* %25, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge3._crit_edge.loopexit, label %._crit_edge4.preheader.us

._crit_edge3._crit_edge.loopexit:                 ; preds = %._crit_edge4._crit_edge.us
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge3._crit_edge.loopexit, %6, %._crit_edge3.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.preheader.lr.ph, label %._crit_edge12

._crit_edge.preheader.lr.ph:                      ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count56 = zext i32 %0 to i64
  %broadcast.splatinsert64 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat65 = shufflevector <2 x double> %broadcast.splatinsert64, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count36 = zext i32 %1 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  %broadcast.splatinsert89 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat90 = shufflevector <2 x double> %broadcast.splatinsert89, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader96, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge.us ], [ %indvars.iv.ph, %._crit_edge.us.preheader96 ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next.1
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next.2
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %3
  store double %20, double* %18, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond.3, label %._crit_edge4.preheader.us16.preheader.loopexit, label %._crit_edge.us, !llvm.loop !1

._crit_edge4.us13:                                ; preds = %._crit_edge4.us13.preheader, %._crit_edge4.us13
  %indvars.iv26 = phi i64 [ %indvars.iv.next27.1, %._crit_edge4.us13 ], [ %indvars.iv26.unr.ph, %._crit_edge4.us13.preheader ]
  %21 = load double, double* %37, align 8
  %22 = fmul double %21, %2
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv34
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv26
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %26, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %29 = load double, double* %37, align 8
  %30 = fmul double %29, %2
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next27, i64 %indvars.iv34
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next27
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  %indvars.iv.next27.1 = add nuw nsw i64 %indvars.iv26, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next27.1, %indvars.iv38
  br i1 %exitcond.1, label %._crit_edge4._crit_edge.us19.loopexit, label %._crit_edge4.us13

._crit_edge4.preheader.us16:                      ; preds = %._crit_edge4.preheader.us16.preheader, %._crit_edge4._crit_edge.us19
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge4._crit_edge.us19 ], [ 0, %._crit_edge4.preheader.us16.preheader ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv34
  br i1 %lcmp.mod32, label %._crit_edge4.us13.prol.loopexit, label %._crit_edge4.us13.prol

._crit_edge4.us13.prol:                           ; preds = %._crit_edge4.preheader.us16
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %2
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv34
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %77, align 8
  %44 = fadd double %43, %42
  store double %44, double* %77, align 8
  br label %._crit_edge4.us13.prol.loopexit

._crit_edge4.us13.prol.loopexit:                  ; preds = %._crit_edge4.us13.prol, %._crit_edge4.preheader.us16
  %indvars.iv26.unr.ph = phi i64 [ 1, %._crit_edge4.us13.prol ], [ 0, %._crit_edge4.preheader.us16 ]
  br i1 %76, label %._crit_edge4._crit_edge.us19, label %._crit_edge4.us13.preheader

._crit_edge4.us13.preheader:                      ; preds = %._crit_edge4.us13.prol.loopexit
  br label %._crit_edge4.us13

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge3._crit_edge.us
  %indvars.iv92 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next93, %._crit_edge3._crit_edge.us ]
  %indvars.iv40 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next41, %._crit_edge3._crit_edge.us ]
  %indvars.iv38 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next39, %._crit_edge3._crit_edge.us ]
  %45 = zext i2 %indvars.iv92 to i64
  %46 = add nuw nsw i64 %45, 4294967295
  %47 = and i64 %46, 4294967295
  %48 = add nuw nsw i64 %47, 1
  %49 = add nsw i64 %indvars.iv40, -3
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %50 = trunc i64 %indvars.iv.next41 to i32
  %xtraiter = and i32 %50, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.prol
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %3
  store double %53, double* %51, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !5

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %48, %._crit_edge.us.prol.loopexit.loopexit ]
  %54 = icmp ult i64 %indvars.iv40, 3
  br i1 %54, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  %55 = sub i64 %49, %indvars.iv.unr
  %56 = lshr i64 %55, 2
  %57 = add nuw nsw i64 %56, 1
  %min.iters.check69 = icmp ult i64 %57, 2
  br i1 %min.iters.check69, label %._crit_edge.us.preheader96, label %min.iters.checked70

._crit_edge.us.preheader96:                       ; preds = %middle.block67, %min.iters.checked70, %._crit_edge.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked70 ], [ %indvars.iv.unr, %._crit_edge.us.preheader ], [ %ind.end78, %middle.block67 ]
  br label %._crit_edge.us

min.iters.checked70:                              ; preds = %._crit_edge.us.preheader
  %n.mod.vf71 = and i64 %57, 1
  %n.vec72 = sub nsw i64 %57, %n.mod.vf71
  %cmp.zero73 = icmp eq i64 %n.vec72, 0
  %58 = add nsw i64 %indvars.iv.unr, 4
  %59 = shl nuw i64 %56, 2
  %60 = add i64 %58, %59
  %61 = shl nuw nsw i64 %n.mod.vf71, 2
  %ind.end78 = sub i64 %60, %61
  br i1 %cmp.zero73, label %._crit_edge.us.preheader96, label %vector.ph74

vector.ph74:                                      ; preds = %min.iters.checked70
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66, %vector.ph74
  %index75 = phi i64 [ 0, %vector.ph74 ], [ %index.next76, %vector.body66 ]
  %62 = shl i64 %index75, 2
  %offset.idx80 = add i64 %indvars.iv.unr, %62
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %offset.idx80
  %64 = bitcast double* %63 to <8 x double>*
  %wide.vec84 = load <8 x double>, <8 x double>* %64, align 8
  %strided.vec85 = shufflevector <8 x double> %wide.vec84, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec86 = shufflevector <8 x double> %wide.vec84, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec87 = shufflevector <8 x double> %wide.vec84, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec88 = shufflevector <8 x double> %wide.vec84, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %65 = fmul <2 x double> %strided.vec85, %broadcast.splat90
  %66 = fmul <2 x double> %strided.vec86, %broadcast.splat90
  %67 = fmul <2 x double> %strided.vec87, %broadcast.splat90
  %68 = add nsw i64 %offset.idx80, 3
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %68
  %70 = fmul <2 x double> %strided.vec88, %broadcast.splat90
  %71 = getelementptr double, double* %69, i64 -3
  %72 = bitcast double* %71 to <8 x double>*
  %73 = shufflevector <2 x double> %65, <2 x double> %66, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %74 = shufflevector <2 x double> %67, <2 x double> %70, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec91 = shufflevector <4 x double> %73, <4 x double> %74, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec91, <8 x double>* %72, align 8
  %index.next76 = add i64 %index75, 2
  %75 = icmp eq i64 %index.next76, %n.vec72
  br i1 %75, label %middle.block67, label %vector.body66, !llvm.loop !7

middle.block67:                                   ; preds = %vector.body66
  %cmp.n79 = icmp eq i64 %n.mod.vf71, 0
  br i1 %cmp.n79, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.preheader96

._crit_edge4.preheader.us16.preheader.loopexit:   ; preds = %._crit_edge.us
  br label %._crit_edge4.preheader.us16.preheader

._crit_edge4.preheader.us16.preheader:            ; preds = %._crit_edge4.preheader.us16.preheader.loopexit, %middle.block67, %._crit_edge.us.prol.loopexit
  %xtraiter3158 = and i64 %indvars.iv.next41, 1
  %lcmp.mod32 = icmp eq i64 %xtraiter3158, 0
  %76 = icmp eq i64 %indvars.iv40, 0
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 0
  br label %._crit_edge4.preheader.us16

._crit_edge4._crit_edge.us19.loopexit:            ; preds = %._crit_edge4.us13
  br label %._crit_edge4._crit_edge.us19

._crit_edge4._crit_edge.us19:                     ; preds = %._crit_edge4._crit_edge.us19.loopexit, %._crit_edge4.us13.prol.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond, label %._crit_edge3._crit_edge.us, label %._crit_edge4.preheader.us16

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge4._crit_edge.us19
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  %indvars.iv.next93 = add i2 %indvars.iv92, 1
  br i1 %exitcond43, label %._crit_edge12.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge3.preheader
  %indvars.iv94 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next95, %._crit_edge3.preheader ]
  %indvars.iv54 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next55, %._crit_edge3.preheader ]
  %indvars.iv52 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next53, %._crit_edge3.preheader ]
  %78 = zext i2 %indvars.iv94 to i64
  %79 = add nuw nsw i64 %78, 4294967295
  %80 = and i64 %79, 4294967295
  %81 = add nuw nsw i64 %80, 1
  %82 = add nsw i64 %indvars.iv54, -3
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %83 = trunc i64 %indvars.iv.next55 to i32
  %xtraiter49 = and i32 %83, 3
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  br i1 %lcmp.mod50, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader, %._crit_edge.prol
  %indvars.iv44.prol = phi i64 [ %indvars.iv.next45.prol, %._crit_edge.prol ], [ 0, %._crit_edge.prol.preheader ]
  %prol.iter51 = phi i32 [ %prol.iter51.sub, %._crit_edge.prol ], [ %xtraiter49, %._crit_edge.prol.preheader ]
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv44.prol
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %3
  store double %86, double* %84, align 8
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv44.prol, 1
  %prol.iter51.sub = add nsw i32 %prol.iter51, -1
  %prol.iter51.cmp = icmp eq i32 %prol.iter51.sub, 0
  br i1 %prol.iter51.cmp, label %._crit_edge.prol.loopexit.loopexit, label %._crit_edge.prol, !llvm.loop !8

._crit_edge.prol.loopexit.loopexit:               ; preds = %._crit_edge.prol
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv44.unr = phi i64 [ 0, %.lr.ph ], [ %81, %._crit_edge.prol.loopexit.loopexit ]
  %87 = icmp ult i64 %indvars.iv54, 3
  br i1 %87, label %._crit_edge3.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.prol.loopexit
  %88 = sub i64 %82, %indvars.iv44.unr
  %89 = lshr i64 %88, 2
  %90 = add nuw nsw i64 %89, 1
  %min.iters.check = icmp ult i64 %90, 2
  br i1 %min.iters.check, label %._crit_edge.preheader97, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge.preheader
  %n.mod.vf = and i64 %90, 1
  %n.vec = sub nsw i64 %90, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %91 = add nsw i64 %indvars.iv44.unr, 4
  %92 = shl nuw i64 %89, 2
  %93 = add i64 %91, %92
  %94 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %93, %94
  br i1 %cmp.zero, label %._crit_edge.preheader97, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %95 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv44.unr, %95
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %offset.idx
  %97 = bitcast double* %96 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %97, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %98 = fmul <2 x double> %strided.vec, %broadcast.splat65
  %99 = fmul <2 x double> %strided.vec61, %broadcast.splat65
  %100 = fmul <2 x double> %strided.vec62, %broadcast.splat65
  %101 = add nsw i64 %offset.idx, 3
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %101
  %103 = fmul <2 x double> %strided.vec63, %broadcast.splat65
  %104 = getelementptr double, double* %102, i64 -3
  %105 = bitcast double* %104 to <8 x double>*
  %106 = shufflevector <2 x double> %98, <2 x double> %99, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %107 = shufflevector <2 x double> %100, <2 x double> %103, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %106, <4 x double> %107, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %105, align 8
  %index.next = add i64 %index, 2
  %108 = icmp eq i64 %index.next, %n.vec
  br i1 %108, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge3.preheader, label %._crit_edge.preheader97

._crit_edge.preheader97:                          ; preds = %middle.block, %min.iters.checked, %._crit_edge.preheader
  %indvars.iv44.ph = phi i64 [ %indvars.iv44.unr, %min.iters.checked ], [ %indvars.iv44.unr, %._crit_edge.preheader ], [ %ind.end, %middle.block ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader97, %._crit_edge
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.3, %._crit_edge ], [ %indvars.iv44.ph, %._crit_edge.preheader97 ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv44
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next45
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %3
  store double %114, double* %112, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next45.1
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, %3
  store double %117, double* %115, align 8
  %indvars.iv.next45.2 = add nsw i64 %indvars.iv44, 3
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next45.2
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, %3
  store double %120, double* %118, align 8
  %indvars.iv.next45.3 = add nsw i64 %indvars.iv44, 4
  %exitcond48.3 = icmp eq i64 %indvars.iv.next45.3, %indvars.iv52
  br i1 %exitcond48.3, label %._crit_edge3.preheader.loopexit, label %._crit_edge, !llvm.loop !10

._crit_edge3.preheader.loopexit:                  ; preds = %._crit_edge
  br label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge3.preheader.loopexit, %middle.block, %._crit_edge.prol.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  %indvars.iv.next95 = add i2 %indvars.iv94, 1
  br i1 %exitcond57, label %._crit_edge12.loopexit98, label %.lr.ph

._crit_edge12.loopexit:                           ; preds = %._crit_edge3._crit_edge.us
  br label %._crit_edge12

._crit_edge12.loopexit98:                         ; preds = %._crit_edge3.preheader
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit98, %._crit_edge12.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge2.preheader.us.preheader, label %._crit_edge5

._crit_edge2.preheader.us.preheader:              ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %._crit_edge2.preheader.us

._crit_edge2.preheader.us:                        ; preds = %._crit_edge2._crit_edge.us, %._crit_edge2.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %._crit_edge2.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge2._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv6, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge.us, %._crit_edge2.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge2._crit_edge.us, label %10

._crit_edge2._crit_edge.us:                       ; preds = %._crit_edge.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge5.loopexit, label %._crit_edge2.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge2._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}
