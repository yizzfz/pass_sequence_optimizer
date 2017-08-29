; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
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
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  tail call fastcc void @kernel_syrk(double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
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
  tail call fastcc void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.lr.ph
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.lr.ph ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next18, %._crit_edge.us ]
  %4 = mul nuw nsw i64 %indvars.iv17, %indvars.iv21
  %5 = add nuw nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 1200
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv21, i64 %indvars.iv17
  store double %9, double* %10, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond28, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next22, 1200
  br i1 %exitcond29, label %._crit_edge4.preheader.us.preheader, label %._crit_edge.preheader.us

._crit_edge4.preheader.us.preheader:              ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge4.preheader.us

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4.preheader.us.preheader, %._crit_edge4._crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge4._crit_edge.us ], [ 0, %._crit_edge4.preheader.us.preheader ]
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us, %._crit_edge4.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge4.preheader.us ], [ %indvars.iv.next, %._crit_edge4.us ]
  %11 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %12 = add nuw nsw i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  store double %16, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond27, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond, label %._crit_edge3._crit_edge, label %._crit_edge4.preheader.us

._crit_edge3._crit_edge:                          ; preds = %._crit_edge4._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  %broadcast.splatinsert69 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat70 = shufflevector <2 x double> %broadcast.splatinsert69, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge.us ], [ %indvars.iv.ph, %._crit_edge.us.preheader ]
  %4 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv
  %5 = load double, double* %4, align 8
  %6 = fmul double %5, %1
  store double %6, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %1
  store double %9, double* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next.1
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %1
  store double %12, double* %10, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next.2
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %1
  store double %15, double* %13, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv37
  br i1 %exitcond.3, label %._crit_edge4.preheader.us16.preheader.loopexit, label %._crit_edge.us, !llvm.loop !1

._crit_edge4.us13:                                ; preds = %._crit_edge4.us13.preheader, %._crit_edge4.us13
  %indvars.iv26 = phi i64 [ %indvars.iv.next27.1, %._crit_edge4.us13 ], [ %indvars.iv26.unr.ph, %._crit_edge4.us13.preheader ]
  %16 = load double, double* %33, align 8
  %17 = fmul double %16, %0
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv32
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv26
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %21, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %24 = load double, double* %33, align 8
  %25 = fmul double %24, %0
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next27, i64 %indvars.iv32
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next27
  %30 = load double, double* %29, align 8
  %31 = fadd double %30, %28
  store double %31, double* %29, align 8
  %indvars.iv.next27.1 = add nuw nsw i64 %indvars.iv26, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next27.1, %indvars.iv37
  br i1 %exitcond31.1, label %._crit_edge4._crit_edge.us19.loopexit, label %._crit_edge4.us13

._crit_edge4.preheader.us16:                      ; preds = %._crit_edge4._crit_edge.us19, %._crit_edge4.preheader.us16.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge4._crit_edge.us19 ], [ 0, %._crit_edge4.preheader.us16.preheader ]
  %32 = icmp eq i64 %70, 0
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv32
  br i1 %32, label %._crit_edge4.us13.prol, label %._crit_edge4.us13.prol.loopexit

._crit_edge4.us13.prol:                           ; preds = %._crit_edge4.preheader.us16
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, %0
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv32
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = load double, double* %71, align 8
  %40 = fadd double %39, %38
  store double %40, double* %71, align 8
  br label %._crit_edge4.us13.prol.loopexit

._crit_edge4.us13.prol.loopexit:                  ; preds = %._crit_edge4.preheader.us16, %._crit_edge4.us13.prol
  %indvars.iv26.unr.ph = phi i64 [ 1, %._crit_edge4.us13.prol ], [ 0, %._crit_edge4.preheader.us16 ]
  %41 = icmp eq i64 %indvars.iv39, 0
  br i1 %41, label %._crit_edge4._crit_edge.us19, label %._crit_edge4.us13.preheader

._crit_edge4.us13.preheader:                      ; preds = %._crit_edge4.us13.prol.loopexit
  br label %._crit_edge4.us13

.lr.ph.us:                                        ; preds = %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv60 = phi i2 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next61, %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge ]
  %indvars.iv39 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next40, %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge ]
  %indvars.iv37 = phi i64 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next38, %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge ]
  %42 = add i64 %indvars.iv39, -3
  %43 = zext i2 %indvars.iv60 to i64
  %44 = add nuw nsw i64 %indvars.iv39, 1
  %xtraiter = and i64 %44, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.prol
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %1
  store double %47, double* %45, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !5

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %43, %._crit_edge.us.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %indvars.iv39, 3
  br i1 %48, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge

._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge: ; preds = %._crit_edge.us.prol.loopexit
  %49 = sub i64 %42, %indvars.iv.unr
  %50 = lshr i64 %49, 2
  %51 = add nuw nsw i64 %50, 1
  %min.iters.check = icmp ult i64 %51, 2
  br i1 %min.iters.check, label %._crit_edge.us.preheader, label %min.iters.checked

._crit_edge.us.preheader:                         ; preds = %middle.block, %min.iters.checked, %._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge ], [ %ind.end, %middle.block ]
  br label %._crit_edge.us

min.iters.checked:                                ; preds = %._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge
  %n.mod.vf = and i64 %51, 1
  %n.vec = sub nsw i64 %51, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %52 = or i64 %indvars.iv.unr, 4
  %53 = shl nuw i64 %50, 2
  %54 = add i64 %52, %53
  %55 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %54, %55
  br i1 %cmp.zero, label %._crit_edge.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %56 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv.unr, %56
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %offset.idx
  %58 = bitcast double* %57 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %58, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec67 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec68 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %59 = fmul <2 x double> %strided.vec, %broadcast.splat70
  %60 = fmul <2 x double> %strided.vec66, %broadcast.splat70
  %61 = fmul <2 x double> %strided.vec67, %broadcast.splat70
  %62 = add nsw i64 %offset.idx, 3
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %62
  %64 = fmul <2 x double> %strided.vec68, %broadcast.splat70
  %65 = getelementptr double, double* %63, i64 -3
  %66 = bitcast double* %65 to <8 x double>*
  %67 = shufflevector <2 x double> %59, <2 x double> %60, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %68 = shufflevector <2 x double> %61, <2 x double> %64, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %67, <4 x double> %68, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %66, align 8
  %index.next = add i64 %index, 2
  %69 = icmp eq i64 %index.next, %n.vec
  br i1 %69, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.preheader

._crit_edge4.preheader.us16.preheader.loopexit:   ; preds = %._crit_edge.us
  br label %._crit_edge4.preheader.us16.preheader

._crit_edge4.preheader.us16.preheader:            ; preds = %._crit_edge4.preheader.us16.preheader.loopexit, %._crit_edge.us.prol.loopexit, %middle.block
  %70 = and i64 %indvars.iv39, 1
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 0
  br label %._crit_edge4.preheader.us16

._crit_edge4._crit_edge.us19.loopexit:            ; preds = %._crit_edge4.us13
  br label %._crit_edge4._crit_edge.us19

._crit_edge4._crit_edge.us19:                     ; preds = %._crit_edge4._crit_edge.us19.loopexit, %._crit_edge4.us13.prol.loopexit
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, 1000
  br i1 %exitcond, label %._crit_edge3._crit_edge.us, label %._crit_edge4.preheader.us16

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge4._crit_edge.us19
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond62, label %._crit_edge12, label %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge

._crit_edge3._crit_edge.us..lr.ph.us_crit_edge:   ; preds = %._crit_edge3._crit_edge.us
  %indvars.iv.next61 = add i2 %indvars.iv60, 1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  br label %.lr.ph.us

._crit_edge12:                                    ; preds = %._crit_edge3._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv5, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %7 = add nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond9, label %._crit_edge._crit_edge.us, label %6

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge.preheader.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
