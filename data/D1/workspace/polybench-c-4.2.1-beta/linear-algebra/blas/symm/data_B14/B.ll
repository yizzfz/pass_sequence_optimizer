; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader40.preheader

.preheader40.preheader:                           ; preds = %21, %7
  %indvars.iv5665 = phi i64 [ 0, %7 ], [ %indvars.iv.next57, %21 ]
  %8 = add nuw nsw i64 %indvars.iv5665, 1200
  br label %.preheader40

.preheader40:                                     ; preds = %.preheader40, %.preheader40.preheader
  %indvars.iv5364 = phi i64 [ 0, %.preheader40.preheader ], [ %indvars.iv.next54, %.preheader40 ]
  %9 = add nuw nsw i64 %indvars.iv5364, %indvars.iv5665
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 1.000000e+03
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv5665, i64 %indvars.iv5364
  store double %13, double* %14, align 8
  %15 = sub nuw nsw i64 %8, %indvars.iv5364
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.000000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv5665, i64 %indvars.iv5364
  store double %19, double* %20, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv5364, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next54, 1200
  br i1 %exitcond55, label %21, label %.preheader40

; <label>:21:                                     ; preds = %.preheader40
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv5665, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next57, 1000
  br i1 %exitcond58, label %.preheader.preheader.preheader, label %.preheader40.preheader

.preheader.preheader.preheader:                   ; preds = %21
  br label %.preheader.preheader

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.lr.ph.prol.loopexit, %.unr-lcssa
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv4863, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next51, 1000
  br i1 %exitcond52, label %68, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.loopexit
  %indvars.iv4863 = phi i64 [ %indvars.iv.next49, %.loopexit ], [ 1, %.preheader.preheader.preheader ]
  %indvars.iv5062 = phi i64 [ %indvars.iv.next51, %.loopexit ], [ 0, %.preheader.preheader.preheader ]
  %22 = sub i64 999, %indvars.iv5062
  %23 = sub i64 998, %indvars.iv5062
  %24 = and i64 %indvars.iv5062, 1
  %lcmp.mod = icmp eq i64 %24, 0
  br i1 %lcmp.mod, label %.preheader.prol, label %.preheader.prol.loopexit

.preheader.prol:                                  ; preds = %.preheader.preheader
  %25 = trunc i64 %indvars.iv5062 to i32
  %26 = srem i32 %25, 100
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 0
  store double %28, double* %29, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv59.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  %30 = icmp eq i64 %indvars.iv5062, 0
  br i1 %30, label %.unr-lcssa, label %.preheader.preheader73

.preheader.preheader73:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader73, %.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv59.unr.ph, %.preheader.preheader73 ]
  %31 = add nuw nsw i64 %indvars.iv59, %indvars.iv5062
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 100
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv59
  %indvars.iv.next = add nuw nsw i64 %indvars.iv59, 1
  %36 = add nuw nsw i64 %indvars.iv.next, %indvars.iv5062
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 100
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %34, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fdiv <2 x double> %41, <double 1.000000e+03, double 1.000000e+03>
  %43 = bitcast double* %35 to <2 x double>*
  store <2 x double> %42, <2 x double>* %43, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv59, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv4863
  br i1 %exitcond.1, label %.unr-lcssa.loopexit, label %.preheader

.unr-lcssa.loopexit:                              ; preds = %.preheader
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv5062, 1
  %exitcond4760 = icmp eq i64 %indvars.iv4863, 1000
  br i1 %exitcond4760, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.unr-lcssa
  %xtraiter66 = and i64 %22, 7
  %lcmp.mod67 = icmp eq i64 %xtraiter66, 0
  br i1 %lcmp.mod67, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv4561.prol = phi i64 [ %indvars.iv.next46.prol, %.lr.ph.prol ], [ %indvars.iv4863, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter66, %.lr.ph.prol.preheader ]
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv4561.prol
  store double -9.990000e+02, double* %44, align 8
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv4561.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv4561.unr = phi i64 [ %indvars.iv4863, %.lr.ph.preheader ], [ %indvars.iv.next46.prol, %.lr.ph.prol.loopexit.loopexit ]
  %45 = icmp ult i64 %23, 7
  br i1 %45, label %.loopexit, label %.lr.ph.preheader70

.lr.ph.preheader70:                               ; preds = %.lr.ph.prol.loopexit
  %46 = sub i64 992, %indvars.iv4561.unr
  %47 = lshr i64 %46, 3
  %48 = add nuw nsw i64 %47, 1
  %min.iters.check = icmp ult i64 %48, 2
  br i1 %min.iters.check, label %.lr.ph.preheader72, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader70
  %n.mod.vf = and i64 %48, 1
  %n.vec = sub nsw i64 %48, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %49 = add i64 %indvars.iv4561.unr, 8
  %50 = shl nuw i64 %47, 3
  %51 = add i64 %49, %50
  %52 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %51, %52
  br i1 %cmp.zero, label %.lr.ph.preheader72, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = shl i64 %index, 3
  %54 = add i64 %indvars.iv4561.unr, %53
  %55 = add nsw i64 %54, 7
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %55
  %57 = getelementptr double, double* %56, i64 -7
  %58 = bitcast double* %57 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %58, align 8
  %index.next = add i64 %index, 2
  %59 = icmp eq i64 %index.next, %n.vec
  br i1 %59, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph.preheader72

.lr.ph.preheader72:                               ; preds = %middle.block, %min.iters.checked, %.lr.ph.preheader70
  %indvars.iv4561.ph = phi i64 [ %indvars.iv4561.unr, %min.iters.checked ], [ %indvars.iv4561.unr, %.lr.ph.preheader70 ], [ %ind.end, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader72, %.lr.ph
  %indvars.iv4561 = phi i64 [ %indvars.iv.next46.7, %.lr.ph ], [ %indvars.iv4561.ph, %.lr.ph.preheader72 ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv4561
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4561, 1
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv.next46
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv4561, 2
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv.next46.1
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next46.2 = add nsw i64 %indvars.iv4561, 3
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv.next46.2
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv4561, 4
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv.next46.3
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next46.4 = add nsw i64 %indvars.iv4561, 5
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv.next46.4
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next46.5 = add nsw i64 %indvars.iv4561, 6
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv.next46.5
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next46.6 = add nsw i64 %indvars.iv4561, 7
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5062, i64 %indvars.iv.next46.6
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next46.7 = add nsw i64 %indvars.iv4561, 8
  %exitcond47.7 = icmp eq i64 %indvars.iv.next46.7, 1000
  br i1 %exitcond47.7, label %.loopexit.loopexit, label %.lr.ph, !llvm.loop !6

; <label>:68:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  %8 = fmul double %2, 0.000000e+00
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 1, i64 0
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %6, i64 1, i64 0
  %9 = bitcast double* %scevgep63 to [1200 x double]*
  %bound0 = icmp ugt [1200 x double]* %9, %4
  %10 = bitcast double* %scevgep to [1200 x double]*
  %bound1 = icmp ugt [1200 x double]* %10, %6
  %found.conflict = and i1 %bound0, %bound1
  %broadcast.splatinsert70 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat71 = shufflevector <2 x double> %broadcast.splatinsert70, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert75 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat76 = shufflevector <2 x double> %broadcast.splatinsert75, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert77 = insertelement <2 x double> undef, double %8, i32 0
  %broadcast.splat78 = shufflevector <2 x double> %broadcast.splatinsert77, <2 x double> undef, <2 x i32> zeroinitializer
  %11 = insertelement <2 x double> undef, double %3, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44.preheader

.preheader44.preheader:                           ; preds = %.us-lcssa.us, %7
  %indvars.iv5057 = phi i64 [ 0, %7 ], [ %indvars.iv.next51, %.us-lcssa.us ]
  %exitcond53 = icmp eq i64 %indvars.iv5057, 0
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5057, i64 %indvars.iv5057
  br i1 %exitcond53, label %vector.memcheck, label %.preheader.preheader.us.preheader

.preheader.preheader.us.preheader:                ; preds = %.preheader44.preheader
  br label %.preheader.preheader.us

vector.memcheck:                                  ; preds = %.preheader44.preheader
  %14 = bitcast double* %13 to [1200 x double]*
  %bound066 = icmp ugt [1200 x double]* %14, %4
  %bound167 = icmp ult double* %13, %scevgep
  %found.conflict68 = and i1 %bound066, %bound167
  %conflict.rdx = or i1 %found.conflict, %found.conflict68
  br i1 %conflict.rdx, label %.preheader.preheader.preheader, label %vector.ph

.preheader.preheader.preheader:                   ; preds = %vector.memcheck
  br label %.preheader.preheader

vector.ph:                                        ; preds = %vector.memcheck
  %15 = load double, double* %13, align 8, !alias.scope !8
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = load double, double* %13, align 8, !alias.scope !8
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %offset.idx
  %22 = bitcast double* %21 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %22, align 8, !alias.scope !11, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec69 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %23 = fmul <2 x double> %strided.vec, %broadcast.splat71
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %offset.idx
  %25 = bitcast double* %24 to <4 x double>*
  %wide.vec72 = load <4 x double>, <4 x double>* %25, align 8, !alias.scope !15
  %strided.vec73 = shufflevector <4 x double> %wide.vec72, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec74 = shufflevector <4 x double> %wide.vec72, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %strided.vec73, %broadcast.splat76
  %27 = fmul <2 x double> %26, %17
  %28 = fadd <2 x double> %23, %27
  %29 = fadd <2 x double> %broadcast.splat78, %28
  %30 = or i64 %offset.idx, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %30
  %32 = fmul <2 x double> %strided.vec69, %broadcast.splat71
  %33 = fmul <2 x double> %strided.vec74, %broadcast.splat76
  %34 = fmul <2 x double> %33, %20
  %35 = fadd <2 x double> %32, %34
  %36 = fadd <2 x double> %broadcast.splat78, %35
  %37 = getelementptr double, double* %31, i64 -1
  %38 = bitcast double* %37 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %29, <2 x double> %36, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %38, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 2
  %39 = icmp eq i64 %index.next, 600
  br i1 %39, label %.us-lcssa.us.loopexit79, label %vector.body, !llvm.loop !16

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv4756.us = phi i64 [ %indvars.iv.next48.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv5057, i64 %indvars.iv4756.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.preheader.us
  %.055.us = phi double [ 0.000000e+00, %.preheader.preheader.us ], [ %53, %.preheader.us ]
  %indvars.iv54.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv5057, i64 %indvars.iv54.us
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54.us, i64 %indvars.iv4756.us
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %46, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv54.us, i64 %indvars.iv4756.us
  %50 = load double, double* %49, align 8
  %51 = load double, double* %43, align 8
  %52 = fmul double %50, %51
  %53 = fadd double %.055.us, %52
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv54.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %indvars.iv5057
  br i1 %exitcond.us, label %.preheader._crit_edge.us, label %.preheader.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv5057, i64 %indvars.iv4756.us
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %3
  %57 = load double, double* %40, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %13, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %56, %60
  %62 = fmul double %53, %2
  %63 = fadd double %62, %61
  store double %63, double* %54, align 8
  %indvars.iv.next48.us = add nuw nsw i64 %indvars.iv4756.us, 1
  %exitcond49.us = icmp eq i64 %indvars.iv.next48.us, 1200
  br i1 %exitcond49.us, label %.us-lcssa.us.loopexit80, label %.preheader.preheader.us

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader.preheader
  %indvars.iv4756 = phi i64 [ %indvars.iv.next48.1, %.preheader.preheader ], [ 0, %.preheader.preheader.preheader ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv4756
  %65 = bitcast double* %64 to <2 x double>*
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %indvars.iv4756
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %13, align 8
  %70 = fmul double %68, %69
  %indvars.iv.next48 = or i64 %indvars.iv4756, 1
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next48
  %72 = load <2 x double>, <2 x double>* %65, align 8
  %73 = fmul <2 x double> %72, %12
  %74 = extractelement <2 x double> %73, i32 0
  %75 = extractelement <2 x double> %73, i32 1
  %76 = fadd double %74, %70
  %77 = fadd double %8, %76
  store double %77, double* %64, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 0, i64 %indvars.iv.next48
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %2
  %81 = load double, double* %13, align 8
  %82 = fmul double %80, %81
  %83 = fadd double %75, %82
  %84 = fadd double %8, %83
  store double %84, double* %71, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv4756, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next48.1, 1200
  br i1 %exitcond49.1, label %.us-lcssa.us.loopexit, label %.preheader.preheader, !llvm.loop !17

.us-lcssa.us.loopexit:                            ; preds = %.preheader.preheader
  br label %.us-lcssa.us

.us-lcssa.us.loopexit79:                          ; preds = %vector.body
  br label %.us-lcssa.us

.us-lcssa.us.loopexit80:                          ; preds = %.preheader._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit80, %.us-lcssa.us.loopexit79, %.us-lcssa.us.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv5057, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next51, 1000
  br i1 %exitcond52, label %85, label %.preheader44.preheader

; <label>:85:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %20, %3
  %indvars.iv1115 = phi i64 [ 0, %3 ], [ %indvars.iv.next12, %20 ]
  %8 = mul nuw nsw i64 %indvars.iv1115, 1000
  br label %9

; <label>:9:                                      ; preds = %.preheader, %.preheader.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %10 = add nuw nsw i64 %indvars.iv14, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.preheader

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %.preheader

.preheader:                                       ; preds = %14, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1115, i64 %indvars.iv14
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %.preheader
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1115, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond13, label %21, label %.preheader.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
