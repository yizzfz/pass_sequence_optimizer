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
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  call fastcc void @print_array([1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader2

.preheader2:                                      ; preds = %20, %5
  %indvars.iv24 = phi i64 [ 0, %5 ], [ %indvars.iv.next25, %20 ]
  %6 = add nuw nsw i64 %indvars.iv24, 1200
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader2
  %indvars.iv21 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next22, %7 ]
  %8 = add nuw nsw i64 %indvars.iv21, %indvars.iv24
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 100
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv21
  store double %12, double* %13, align 8
  %14 = sub nuw nsw i64 %6, %indvars.iv21
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv21
  store double %18, double* %19, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1200
  br i1 %exitcond23, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond26, label %.lr.ph.preheader, label %.preheader2

.lr.ph.preheader:                                 ; preds = %20
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph4.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit12, %._crit_edge
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond, label %68, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.loopexit ], [ 0, %.lr.ph.preheader ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %.loopexit ], [ 1, %.lr.ph.preheader ]
  %21 = sub i64 999, %indvars.iv19
  %22 = sub i64 998, %indvars.iv19
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %xtraiter27 = and i64 %indvars.iv.next20, 1
  %lcmp.mod = icmp eq i64 %xtraiter27, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %23 = trunc i64 %indvars.iv19 to i32
  %24 = srem i32 %23, 100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.000000e+03
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 0
  store double %26, double* %27, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %28 = icmp eq i64 %indvars.iv19, 0
  br i1 %28, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %29 = add nuw nsw i64 %indvars.iv, %indvars.iv19
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.000000e+03
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv
  store double %33, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = add nuw nsw i64 %indvars.iv.next, %indvars.iv19
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 1.000000e+03
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next
  store double %39, double* %40, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv17
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %41 = icmp slt i64 %indvars.iv.next20, 1000
  br i1 %41, label %.lr.ph4, label %.loopexit

.lr.ph4:                                          ; preds = %._crit_edge
  %42 = trunc i64 %21 to i32
  %xtraiter13 = and i32 %42, 7
  %lcmp.mod14 = icmp eq i32 %xtraiter13, 0
  br i1 %lcmp.mod14, label %.prol.loopexit12, label %.prol.preheader11.preheader

.prol.preheader11.preheader:                      ; preds = %.lr.ph4
  br label %.prol.preheader11

.prol.preheader11:                                ; preds = %.prol.preheader11.preheader, %.prol.preheader11
  %indvars.iv9.prol = phi i64 [ %indvars.iv.next10.prol, %.prol.preheader11 ], [ %indvars.iv17, %.prol.preheader11.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader11 ], [ %xtraiter13, %.prol.preheader11.preheader ]
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv9.prol
  store double -9.990000e+02, double* %43, align 8
  %indvars.iv.next10.prol = add nuw nsw i64 %indvars.iv9.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit12.loopexit, label %.prol.preheader11, !llvm.loop !1

.prol.loopexit12.loopexit:                        ; preds = %.prol.preheader11
  br label %.prol.loopexit12

.prol.loopexit12:                                 ; preds = %.prol.loopexit12.loopexit, %.lr.ph4
  %indvars.iv9.unr = phi i64 [ %indvars.iv17, %.lr.ph4 ], [ %indvars.iv.next10.prol, %.prol.loopexit12.loopexit ]
  %44 = trunc i64 %22 to i32
  %45 = icmp ult i32 %44, 7
  br i1 %45, label %.loopexit, label %.lr.ph4.new.preheader

.lr.ph4.new.preheader:                            ; preds = %.prol.loopexit12
  %46 = sub i64 992, %indvars.iv9.unr
  %47 = lshr i64 %46, 3
  %48 = add nuw nsw i64 %47, 1
  %min.iters.check = icmp ult i64 %48, 2
  br i1 %min.iters.check, label %.lr.ph4.new.preheader1, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph4.new.preheader
  %n.mod.vf = and i64 %48, 1
  %n.vec = sub nsw i64 %48, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %49 = add i64 %indvars.iv9.unr, 8
  %50 = shl nuw i64 %47, 3
  %51 = add i64 %49, %50
  %52 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %51, %52
  br i1 %cmp.zero, label %.lr.ph4.new.preheader1, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = shl i64 %index, 3
  %54 = add i64 %indvars.iv9.unr, %53
  %55 = add nsw i64 %54, 7
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %55
  %57 = getelementptr double, double* %56, i64 -7
  %58 = bitcast double* %57 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %58, align 8
  %index.next = add i64 %index, 2
  %59 = icmp eq i64 %index.next, %n.vec
  br i1 %59, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph4.new.preheader1

.lr.ph4.new.preheader1:                           ; preds = %middle.block, %min.iters.checked, %.lr.ph4.new.preheader
  %indvars.iv9.ph = phi i64 [ %indvars.iv9.unr, %min.iters.checked ], [ %indvars.iv9.unr, %.lr.ph4.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.new

.lr.ph4.new:                                      ; preds = %.lr.ph4.new.preheader1, %.lr.ph4.new
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.7, %.lr.ph4.new ], [ %indvars.iv9.ph, %.lr.ph4.new.preheader1 ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv9
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next10
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next10.1
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv9, 3
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next10.2
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next10.3 = add nsw i64 %indvars.iv9, 4
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next10.3
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next10.4 = add nsw i64 %indvars.iv9, 5
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next10.4
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next10.5 = add nsw i64 %indvars.iv9, 6
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next10.5
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next10.6 = add nsw i64 %indvars.iv9, 7
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next10.6
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next10.7 = add nsw i64 %indvars.iv9, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next10.7, 1000
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph4.new, !llvm.loop !6

; <label>:68:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #0 {
  %6 = fmul double %0, 0.000000e+00
  %broadcast.splatinsert35 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat36 = shufflevector <2 x double> %broadcast.splatinsert35, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert39 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat40 = shufflevector <2 x double> %broadcast.splatinsert39, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert41 = insertelement <2 x double> undef, double %6, i32 0
  %broadcast.splat42 = shufflevector <2 x double> %broadcast.splatinsert41, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3

.preheader3:                                      ; preds = %.us-lcssa.us, %5
  %indvars.iv17 = phi i64 [ 0, %5 ], [ %indvars.iv.next18, %.us-lcssa.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 0
  %7 = add i64 %indvars.iv17, 1
  %scevgep23 = getelementptr [1200 x double], [1200 x double]* %2, i64 %7, i64 0
  %8 = icmp sgt i64 %indvars.iv17, 0
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv17
  br i1 %8, label %.preheader.us.preheader, label %vector.memcheck

.preheader.us.preheader:                          ; preds = %.preheader3
  br label %.preheader.us

vector.memcheck:                                  ; preds = %.preheader3
  %scevgep27 = getelementptr [1200 x double], [1200 x double]* %4, i64 %7, i64 0
  %scevgep25 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep27
  %bound1 = icmp ult double* %scevgep25, %scevgep23
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ult double* %scevgep, %9
  %bound131 = icmp ult double* %9, %scevgep23
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  br i1 %conflict.rdx, label %.preheader.preheader, label %vector.ph

.preheader.preheader:                             ; preds = %vector.memcheck
  br label %.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !8, !noalias !11
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !8, !noalias !11
  %14 = fmul <2 x double> %wide.load, %broadcast.splat36
  %15 = fmul <2 x double> %wide.load34, %broadcast.splat36
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !14
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !14
  %20 = fmul <2 x double> %wide.load37, %broadcast.splat40
  %21 = fmul <2 x double> %wide.load38, %broadcast.splat40
  %22 = load double, double* %9, align 8, !alias.scope !15
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x double> undef, double %22, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = fmul <2 x double> %20, %24
  %28 = fmul <2 x double> %21, %26
  %29 = fadd <2 x double> %14, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %broadcast.splat42, %29
  %32 = fadd <2 x double> %broadcast.splat42, %30
  %33 = bitcast double* %10 to <2 x double>*
  store <2 x double> %31, <2 x double>* %33, align 8, !alias.scope !8, !noalias !11
  %34 = bitcast double* %12 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %35 = icmp eq i64 %index.next, 1200
  br i1 %35, label %.us-lcssa.us.loopexit2, label %vector.body, !llvm.loop !16

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv14
  br label %37

; <label>:37:                                     ; preds = %37, %.preheader.us
  %indvars.iv9 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next10, %37 ]
  %.05.us = phi double [ 0.000000e+00, %.preheader.us ], [ %50, %37 ]
  %38 = load double, double* %36, align 8
  %39 = fmul double %38, %0
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv9
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv14
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv14
  %47 = load double, double* %46, align 8
  %48 = load double, double* %40, align 8
  %49 = fmul double %47, %48
  %50 = fadd double %.05.us, %49
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, %indvars.iv17
  br i1 %exitcond13, label %._crit_edge.us, label %37

._crit_edge.us:                                   ; preds = %37
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv14
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv14
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %0
  %57 = load double, double* %9, align 8
  %58 = fmul double %56, %57
  %59 = fadd double %53, %58
  %60 = fmul double %50, %0
  %61 = fadd double %60, %59
  store double %61, double* %51, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %.us-lcssa.us.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %0
  %68 = load double, double* %9, align 8
  %69 = fmul double %67, %68
  %70 = fadd double %64, %69
  %71 = fadd double %6, %70
  store double %71, double* %62, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv.next
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv.next
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, %0
  %78 = load double, double* %9, align 8
  %79 = fmul double %77, %78
  %80 = fadd double %74, %79
  %81 = fadd double %6, %80
  store double %81, double* %72, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %.us-lcssa.us.loopexit1, label %.preheader, !llvm.loop !17

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit1:                           ; preds = %.preheader
  br label %.us-lcssa.us

.us-lcssa.us.loopexit2:                           ; preds = %vector.body
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit2, %.us-lcssa.us.loopexit1, %.us-lcssa.us.loopexit
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond19, label %82, label %.preheader3

; <label>:82:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

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
