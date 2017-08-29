; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %5 = add nsw i32 %0, 1
  %6 = zext i32 %5 to i64
  %7 = add nsw i64 %3, -1
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge2.prol.loopexit, label %._crit_edge2.prol.preheader

._crit_edge2.prol.preheader:                      ; preds = %.lr.ph
  br label %._crit_edge2.prol

._crit_edge2.prol:                                ; preds = %._crit_edge2.prol, %._crit_edge2.prol.preheader
  %indvars.iv1.prol = phi i64 [ 0, %._crit_edge2.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge2.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge2.prol.preheader ], [ %prol.iter.sub, %._crit_edge2.prol ]
  %8 = sub nsw i64 %6, %indvars.iv1.prol
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv1.prol
  store double %10, double* %11, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv1.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge2.prol.loopexit.unr-lcssa, label %._crit_edge2.prol, !llvm.loop !1

._crit_edge2.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge2.prol
  br label %._crit_edge2.prol.loopexit

._crit_edge2.prol.loopexit:                       ; preds = %.lr.ph, %._crit_edge2.prol.loopexit.unr-lcssa
  %indvars.iv1.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge2.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %7, 3
  br i1 %12, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge2.prol.loopexit
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph.new
  %indvars.iv1 = phi i64 [ %indvars.iv1.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge2 ]
  %13 = sub nsw i64 %6, %indvars.iv1
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  store double %15, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %17 = sub nsw i64 %6, %indvars.iv.next
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %21 = sub nsw i64 %6, %indvars.iv.next.1
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %23, double* %24, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv1, 3
  %25 = sub nsw i64 %6, %indvars.iv.next.2
  %26 = trunc i64 %25 to i32
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %27, double* %28, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv1, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %3
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge2

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge2
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge2.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = icmp sgt i32 %0, 1
  br i1 %9, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %10 = sext i32 %0 to i64
  %11 = load double, double* %1, align 8
  %12 = fsub double -0.000000e+00, %11
  %13 = add nsw i64 %10, -1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit, %.lr.ph.preheader
  %indvar = phi i64 [ 0, %.lr.ph.preheader ], [ %55, %.loopexit ]
  %.0327 = phi double [ %12, %.lr.ph.preheader ], [ %63, %.loopexit ]
  %.0426 = phi double [ 1.000000e+00, %.lr.ph.preheader ], [ %58, %.loopexit ]
  %indvars.iv1925 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next20, %.loopexit ]
  %14 = add i64 %indvar, 1
  %15 = shl i64 %indvar, 3
  %16 = add nuw nsw i64 %15, 8
  %17 = add nsw i64 %indvars.iv1925, -1
  %xtraiter = and i64 %14, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge29.prol.loopexit, label %._crit_edge29.prol.preheader

._crit_edge29.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge29.prol

._crit_edge29.prol:                               ; preds = %._crit_edge29.prol, %._crit_edge29.prol.preheader
  %.0222.prol = phi double [ 0.000000e+00, %._crit_edge29.prol.preheader ], [ %24, %._crit_edge29.prol ]
  %indvars.iv21.prol = phi i64 [ 0, %._crit_edge29.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge29.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge29.prol.preheader ], [ %prol.iter.sub, %._crit_edge29.prol ]
  %18 = sub nsw i64 %17, %indvars.iv21.prol
  %19 = getelementptr inbounds double, double* %1, i64 %18
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv21.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %.0222.prol, %23
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv21.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge29.prol.loopexit.unr-lcssa, label %._crit_edge29.prol, !llvm.loop !3

._crit_edge29.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge29.prol
  br label %._crit_edge29.prol.loopexit

._crit_edge29.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge29.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %24, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %.0222.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %24, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %indvars.iv21.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge29.prol.loopexit.unr-lcssa ]
  %25 = icmp ult i64 %indvar, 3
  br i1 %25, label %54, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge29.prol.loopexit
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29, %.lr.ph.new
  %.0222 = phi double [ %.0222.unr, %.lr.ph.new ], [ %53, %._crit_edge29 ]
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge29 ]
  %26 = sub nsw i64 %17, %indvars.iv21
  %27 = getelementptr inbounds double, double* %1, i64 %26
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %.0222, %31
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %33 = sub nsw i64 %17, %indvars.iv.next
  %34 = getelementptr inbounds double, double* %1, i64 %33
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %32, %38
  %indvars.iv.next.1 = add nsw i64 %indvars.iv21, 2
  %40 = sub nsw i64 %17, %indvars.iv.next.1
  %41 = getelementptr inbounds double, double* %1, i64 %40
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %39, %45
  %indvars.iv.next.2 = add nsw i64 %indvars.iv21, 3
  %47 = sub nsw i64 %17, %indvars.iv.next.2
  %48 = getelementptr inbounds double, double* %1, i64 %47
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %46, %52
  %indvars.iv.next.3 = add nsw i64 %indvars.iv21, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1925
  br i1 %exitcond.3, label %.unr-lcssa, label %._crit_edge29

.unr-lcssa:                                       ; preds = %._crit_edge29
  br label %54

; <label>:54:                                     ; preds = %._crit_edge29.prol.loopexit, %.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge29.prol.loopexit ], [ %53, %.unr-lcssa ]
  %55 = add nuw nsw i64 %indvar, 1
  %56 = fmul double %.0327, %.0327
  %57 = fsub double 1.000000e+00, %56
  %58 = fmul double %.0426, %57
  %59 = getelementptr inbounds double, double* %1, i64 %indvars.iv1925
  %60 = load double, double* %59, align 8
  %61 = fadd double %.lcssa, %60
  %62 = fsub double -0.000000e+00, %61
  %63 = fdiv double %62, %58
  %min.iters.check = icmp ult i64 %55, 4
  br i1 %min.iters.check, label %._crit_edge30.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %54
  %n.vec = and i64 %55, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge30.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert36 = insertelement <2 x double> undef, double %63, i32 0
  %broadcast.splat37 = shufflevector <2 x double> %broadcast.splatinsert36, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %64 = getelementptr inbounds double, double* %2, i64 %index
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %67, align 8
  %68 = sub nsw i64 %17, %index
  %69 = getelementptr inbounds double, double* %2, i64 %68
  %70 = getelementptr double, double* %69, i64 -1
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %71, align 8
  %reverse = shufflevector <2 x double> %wide.load33, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %72 = getelementptr double, double* %69, i64 -2
  %73 = getelementptr double, double* %72, i64 -1
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %74, align 8
  %reverse35 = shufflevector <2 x double> %wide.load34, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %75 = fmul <2 x double> %broadcast.splat37, %reverse
  %76 = fmul <2 x double> %broadcast.splat37, %reverse35
  %77 = fadd <2 x double> %wide.load, %75
  %78 = fadd <2 x double> %wide.load32, %76
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %index
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %77, <2 x double>* %80, align 16
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %78, <2 x double>* %82, align 16
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, %n.vec
  br i1 %83, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %55, %n.vec
  br i1 %cmp.n, label %.loopexit, label %._crit_edge30.preheader

._crit_edge30.preheader:                          ; preds = %middle.block, %min.iters.checked, %54
  %indvars.iv723.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %54 ], [ %n.vec, %middle.block ]
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.preheader, %._crit_edge30
  %indvars.iv723 = phi i64 [ %indvars.iv.next8, %._crit_edge30 ], [ %indvars.iv723.ph, %._crit_edge30.preheader ]
  %84 = getelementptr inbounds double, double* %2, i64 %indvars.iv723
  %85 = load double, double* %84, align 8
  %86 = sub nsw i64 %17, %indvars.iv723
  %87 = getelementptr inbounds double, double* %2, i64 %86
  %88 = load double, double* %87, align 8
  %89 = fmul double %63, %88
  %90 = fadd double %85, %89
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv723
  store double %90, double* %91, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv723, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, %indvars.iv1925
  br i1 %exitcond12, label %.loopexit.loopexit, label %._crit_edge30, !llvm.loop !7

.loopexit.loopexit:                               ; preds = %._crit_edge30
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %4, i8* nonnull %6, i64 %16, i32 8, i1 false)
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv1925
  store double %63, double* %92, align 8
  %exitcond28 = icmp eq i64 %55, %13
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1925, 1
  br i1 %exitcond28, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv1 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.lr.ph._crit_edge

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

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
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
