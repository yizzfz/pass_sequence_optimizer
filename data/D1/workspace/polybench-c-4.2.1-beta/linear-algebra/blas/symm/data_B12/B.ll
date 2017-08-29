; ModuleID = 'A.ll'
source_filename = "symm.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader2

.preheader2:                                      ; preds = %22, %7
  %indvars.iv24 = phi i64 [ 0, %7 ], [ %indvars.iv.next25, %22 ]
  %8 = add nuw nsw i64 %indvars.iv24, 1200
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader2
  %indvars.iv21 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next22, %9 ]
  %10 = add nuw nsw i64 %indvars.iv21, %indvars.iv24
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv21
  store double %14, double* %15, align 8
  %16 = sub nuw nsw i64 %8, %indvars.iv21
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv24, i64 %indvars.iv21
  store double %20, double* %21, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1200
  br i1 %exitcond23, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond26, label %.lr.ph.preheader, label %.preheader2

.lr.ph.preheader:                                 ; preds = %22
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph4.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit12, %._crit_edge
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond, label %70, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.loopexit ], [ 0, %.lr.ph.preheader ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %.loopexit ], [ 1, %.lr.ph.preheader ]
  %23 = sub i64 999, %indvars.iv19
  %24 = sub i64 998, %indvars.iv19
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %xtraiter27 = and i64 %indvars.iv.next20, 1
  %lcmp.mod = icmp eq i64 %xtraiter27, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %25 = trunc i64 %indvars.iv19 to i32
  %26 = srem i32 %25, 100
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 0
  store double %28, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %30 = icmp eq i64 %indvars.iv19, 0
  br i1 %30, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %31 = add nuw nsw i64 %indvars.iv, %indvars.iv19
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.000000e+03
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = add nuw nsw i64 %indvars.iv.next, %indvars.iv19
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 1.000000e+03
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next
  store double %41, double* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv17
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %43 = icmp slt i64 %indvars.iv.next20, 1000
  br i1 %43, label %.lr.ph4, label %.loopexit

.lr.ph4:                                          ; preds = %._crit_edge
  %44 = trunc i64 %23 to i32
  %xtraiter13 = and i32 %44, 7
  %lcmp.mod14 = icmp eq i32 %xtraiter13, 0
  br i1 %lcmp.mod14, label %.prol.loopexit12, label %.prol.preheader11.preheader

.prol.preheader11.preheader:                      ; preds = %.lr.ph4
  br label %.prol.preheader11

.prol.preheader11:                                ; preds = %.prol.preheader11.preheader, %.prol.preheader11
  %indvars.iv9.prol = phi i64 [ %indvars.iv.next10.prol, %.prol.preheader11 ], [ %indvars.iv17, %.prol.preheader11.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader11 ], [ %xtraiter13, %.prol.preheader11.preheader ]
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv9.prol
  store double -9.990000e+02, double* %45, align 8
  %indvars.iv.next10.prol = add nuw nsw i64 %indvars.iv9.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit12.loopexit, label %.prol.preheader11, !llvm.loop !1

.prol.loopexit12.loopexit:                        ; preds = %.prol.preheader11
  br label %.prol.loopexit12

.prol.loopexit12:                                 ; preds = %.prol.loopexit12.loopexit, %.lr.ph4
  %indvars.iv9.unr = phi i64 [ %indvars.iv17, %.lr.ph4 ], [ %indvars.iv.next10.prol, %.prol.loopexit12.loopexit ]
  %46 = trunc i64 %24 to i32
  %47 = icmp ult i32 %46, 7
  br i1 %47, label %.loopexit, label %.lr.ph4.new.preheader

.lr.ph4.new.preheader:                            ; preds = %.prol.loopexit12
  %48 = sub i64 992, %indvars.iv9.unr
  %49 = lshr i64 %48, 3
  %50 = add nuw nsw i64 %49, 1
  %min.iters.check = icmp ult i64 %50, 2
  br i1 %min.iters.check, label %.lr.ph4.new.preheader28, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph4.new.preheader
  %n.mod.vf = and i64 %50, 1
  %n.vec = sub nsw i64 %50, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %51 = add i64 %indvars.iv9.unr, 8
  %52 = shl nuw i64 %49, 3
  %53 = add i64 %51, %52
  %54 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %53, %54
  br i1 %cmp.zero, label %.lr.ph4.new.preheader28, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %55 = shl i64 %index, 3
  %56 = add i64 %indvars.iv9.unr, %55
  %57 = add nsw i64 %56, 7
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %57
  %59 = getelementptr double, double* %58, i64 -7
  %60 = bitcast double* %59 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %60, align 8
  %index.next = add i64 %index, 2
  %61 = icmp eq i64 %index.next, %n.vec
  br i1 %61, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph4.new.preheader28

.lr.ph4.new.preheader28:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph4.new.preheader
  %indvars.iv9.ph = phi i64 [ %indvars.iv9.unr, %min.iters.checked ], [ %indvars.iv9.unr, %.lr.ph4.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.new

.lr.ph4.new:                                      ; preds = %.lr.ph4.new.preheader28, %.lr.ph4.new
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.7, %.lr.ph4.new ], [ %indvars.iv9.ph, %.lr.ph4.new.preheader28 ]
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv9
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next10
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next10.1
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv9, 3
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next10.2
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next10.3 = add nsw i64 %indvars.iv9, 4
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next10.3
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next10.4 = add nsw i64 %indvars.iv9, 5
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next10.4
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next10.5 = add nsw i64 %indvars.iv9, 6
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next10.5
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next10.6 = add nsw i64 %indvars.iv9, 7
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next10.6
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next10.7 = add nsw i64 %indvars.iv9, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next10.7, 1000
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph4.new, !llvm.loop !6

; <label>:70:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
  %8 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert35 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat36 = shufflevector <2 x double> %broadcast.splatinsert35, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert39 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat40 = shufflevector <2 x double> %broadcast.splatinsert39, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert41 = insertelement <2 x double> undef, double %8, i32 0
  %broadcast.splat42 = shufflevector <2 x double> %broadcast.splatinsert41, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3

.preheader3:                                      ; preds = %.us-lcssa.us, %7
  %indvars.iv17 = phi i64 [ 0, %7 ], [ %indvars.iv.next18, %.us-lcssa.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 0
  %9 = add i64 %indvars.iv17, 1
  %scevgep23 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %10 = icmp sgt i64 %indvars.iv17, 0
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv17, i64 %indvars.iv17
  br i1 %10, label %.preheader.us.preheader, label %vector.memcheck

.preheader.us.preheader:                          ; preds = %.preheader3
  br label %.preheader.us

vector.memcheck:                                  ; preds = %.preheader3
  %scevgep27 = getelementptr [1200 x double], [1200 x double]* %6, i64 %9, i64 0
  %scevgep25 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv17, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep27
  %bound1 = icmp ult double* %scevgep25, %scevgep23
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ult double* %scevgep, %11
  %bound131 = icmp ult double* %11, %scevgep23
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  br i1 %conflict.rdx, label %.preheader.preheader, label %vector.ph

.preheader.preheader:                             ; preds = %vector.memcheck
  br label %.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %index
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !8, !noalias !11
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !8, !noalias !11
  %16 = fmul <2 x double> %wide.load, %broadcast.splat36
  %17 = fmul <2 x double> %wide.load34, %broadcast.splat36
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv17, i64 %index
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !14
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !14
  %22 = fmul <2 x double> %wide.load37, %broadcast.splat40
  %23 = fmul <2 x double> %wide.load38, %broadcast.splat40
  %24 = load double, double* %11, align 8, !alias.scope !15
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = insertelement <2 x double> undef, double %24, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = fmul <2 x double> %22, %26
  %30 = fmul <2 x double> %23, %28
  %31 = fadd <2 x double> %16, %29
  %32 = fadd <2 x double> %17, %30
  %33 = fadd <2 x double> %broadcast.splat42, %31
  %34 = fadd <2 x double> %broadcast.splat42, %32
  %35 = bitcast double* %12 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !8, !noalias !11
  %36 = bitcast double* %14 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %37 = icmp eq i64 %index.next, 1200
  br i1 %37, label %.us-lcssa.us.loopexit44, label %vector.body, !llvm.loop !16

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv17, i64 %indvars.iv14
  br label %39

; <label>:39:                                     ; preds = %39, %.preheader.us
  %indvars.iv9 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next10, %39 ]
  %.05.us = phi double [ 0.000000e+00, %.preheader.us ], [ %52, %39 ]
  %40 = load double, double* %38, align 8
  %41 = fmul double %40, %2
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv17, i64 %indvars.iv9
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv14
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv9, i64 %indvars.iv14
  %49 = load double, double* %48, align 8
  %50 = load double, double* %42, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %.05.us, %51
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, %indvars.iv17
  br i1 %exitcond13, label %._crit_edge.us, label %39

._crit_edge.us:                                   ; preds = %39
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv14
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = load double, double* %38, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %11, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %55, %59
  %61 = fmul double %52, %2
  %62 = fadd double %61, %60
  store double %62, double* %53, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %.us-lcssa.us.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv17, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %11, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fadd double %8, %71
  store double %72, double* %63, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv.next
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv17, i64 %indvars.iv.next
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %2
  %79 = load double, double* %11, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %75, %80
  %82 = fadd double %8, %81
  store double %82, double* %73, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %.us-lcssa.us.loopexit43, label %.preheader, !llvm.loop !17

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit43:                          ; preds = %.preheader
  br label %.us-lcssa.us

.us-lcssa.us.loopexit44:                          ; preds = %vector.body
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit44, %.us-lcssa.us.loopexit43, %.us-lcssa.us.loopexit
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond19, label %83, label %.preheader3

; <label>:83:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %21, %3
  %indvars.iv1 = phi i64 [ 0, %3 ], [ %indvars.iv.next2, %21 ]
  %8 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #4
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
