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
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  %11 = bitcast i8* %5 to [1200 x double]*
  %12 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %11, [1000 x double]* %12)
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
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.lr.ph
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.lr.ph ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv17 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next18, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv17, %indvars.iv21
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv17
  store double %11, double* %12, align 8
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
  %13 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv
  store double %18, double* %19, align 8
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
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  %broadcast.splatinsert69 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat70 = shufflevector <2 x double> %broadcast.splatinsert69, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge.us ], [ %indvars.iv.ph, %._crit_edge.us.preheader ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %3
  store double %8, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next.1
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next.2
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond.3, label %._crit_edge4.preheader.us16.preheader.loopexit, label %._crit_edge.us, !llvm.loop !1

._crit_edge4.us13:                                ; preds = %._crit_edge4.us13.preheader, %._crit_edge4.us13
  %indvars.iv26 = phi i64 [ %indvars.iv.next27.1, %._crit_edge4.us13 ], [ %indvars.iv26.unr.ph, %._crit_edge4.us13.preheader ]
  %18 = load double, double* %34, align 8
  %19 = fmul double %18, %2
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv34
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv26
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %23, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %26 = load double, double* %34, align 8
  %27 = fmul double %26, %2
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next27, i64 %indvars.iv34
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.next27
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next27.1 = add nuw nsw i64 %indvars.iv26, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next27.1, %indvars.iv38
  br i1 %exitcond.1, label %._crit_edge4._crit_edge.us19.loopexit, label %._crit_edge4.us13

._crit_edge4.preheader.us16:                      ; preds = %._crit_edge4._crit_edge.us19, %._crit_edge4.preheader.us16.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge4._crit_edge.us19 ], [ 0, %._crit_edge4.preheader.us16.preheader ]
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv34
  br i1 %lcmp.mod32, label %._crit_edge4.us13.prol.loopexit, label %._crit_edge4.us13.prol

._crit_edge4.us13.prol:                           ; preds = %._crit_edge4.preheader.us16
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %2
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv34
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %75, align 8
  %41 = fadd double %40, %39
  store double %41, double* %75, align 8
  br label %._crit_edge4.us13.prol.loopexit

._crit_edge4.us13.prol.loopexit:                  ; preds = %._crit_edge4.preheader.us16, %._crit_edge4.us13.prol
  %indvars.iv26.unr.ph = phi i64 [ 1, %._crit_edge4.us13.prol ], [ 0, %._crit_edge4.preheader.us16 ]
  br i1 %74, label %._crit_edge4._crit_edge.us19, label %._crit_edge4.us13.preheader

._crit_edge4.us13.preheader:                      ; preds = %._crit_edge4.us13.prol.loopexit
  br label %._crit_edge4.us13

.lr.ph.us:                                        ; preds = %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv60 = phi i2 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next61, %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge ]
  %indvars.iv40 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next41, %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge ]
  %indvars.iv38 = phi i64 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next39, %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge ]
  %42 = add i64 %indvars.iv40, -3
  %43 = zext i2 %indvars.iv60 to i64
  %44 = add nuw nsw i64 %43, 4294967295
  %45 = and i64 %44, 4294967295
  %46 = add nuw nsw i64 %45, 1
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %47 = trunc i64 %indvars.iv.next41 to i32
  %xtraiter = and i32 %47, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv.prol
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %3
  store double %50, double* %48, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !5

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %46, %._crit_edge.us.prol.loopexit.loopexit ]
  %51 = icmp ult i64 %indvars.iv40, 3
  br i1 %51, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge

._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge: ; preds = %._crit_edge.us.prol.loopexit
  %52 = sub i64 %42, %indvars.iv.unr
  %53 = lshr i64 %52, 2
  %54 = add nuw nsw i64 %53, 1
  %min.iters.check = icmp ult i64 %54, 2
  br i1 %min.iters.check, label %._crit_edge.us.preheader, label %min.iters.checked

._crit_edge.us.preheader:                         ; preds = %middle.block, %min.iters.checked, %._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge ], [ %ind.end, %middle.block ]
  br label %._crit_edge.us

min.iters.checked:                                ; preds = %._crit_edge.us.prol.loopexit.._crit_edge.us_crit_edge
  %n.mod.vf = and i64 %54, 1
  %n.vec = sub nsw i64 %54, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %55 = add nsw i64 %indvars.iv.unr, 4
  %56 = shl nuw i64 %53, 2
  %57 = add i64 %55, %56
  %58 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %57, %58
  br i1 %cmp.zero, label %._crit_edge.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %59 = shl i64 %index, 2
  %60 = add i64 %indvars.iv.unr, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %60
  %62 = bitcast double* %61 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %62, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec67 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec68 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %63 = fmul <2 x double> %strided.vec, %broadcast.splat70
  %64 = fmul <2 x double> %strided.vec66, %broadcast.splat70
  %65 = fmul <2 x double> %strided.vec67, %broadcast.splat70
  %66 = add nsw i64 %60, 3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %66
  %68 = fmul <2 x double> %strided.vec68, %broadcast.splat70
  %69 = getelementptr double, double* %67, i64 -3
  %70 = bitcast double* %69 to <8 x double>*
  %71 = shufflevector <2 x double> %63, <2 x double> %64, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %72 = shufflevector <2 x double> %65, <2 x double> %68, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %71, <4 x double> %72, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %70, align 8
  %index.next = add i64 %index, 2
  %73 = icmp eq i64 %index.next, %n.vec
  br i1 %73, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge4.preheader.us16.preheader, label %._crit_edge.us.preheader

._crit_edge4.preheader.us16.preheader.loopexit:   ; preds = %._crit_edge.us
  br label %._crit_edge4.preheader.us16.preheader

._crit_edge4.preheader.us16.preheader:            ; preds = %._crit_edge4.preheader.us16.preheader.loopexit, %._crit_edge.us.prol.loopexit, %middle.block
  %xtraiter3158 = and i64 %indvars.iv.next41, 1
  %lcmp.mod32 = icmp eq i64 %xtraiter3158, 0
  %74 = icmp eq i64 %indvars.iv40, 0
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 0
  br label %._crit_edge4.preheader.us16

._crit_edge4._crit_edge.us19.loopexit:            ; preds = %._crit_edge4.us13
  br label %._crit_edge4._crit_edge.us19

._crit_edge4._crit_edge.us19:                     ; preds = %._crit_edge4._crit_edge.us19.loopexit, %._crit_edge4.us13.prol.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond62, label %._crit_edge3._crit_edge.us, label %._crit_edge4.preheader.us16

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge4._crit_edge.us19
  %exitcond = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond, label %._crit_edge12, label %._crit_edge3._crit_edge.us..lr.ph.us_crit_edge

._crit_edge3._crit_edge.us..lr.ph.us_crit_edge:   ; preds = %._crit_edge3._crit_edge.us
  %indvars.iv.next61 = add i2 %indvars.iv60, 1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  br label %.lr.ph.us

._crit_edge12:                                    ; preds = %._crit_edge3._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv5, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond9, label %._crit_edge._crit_edge.us, label %7

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge.preheader.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
