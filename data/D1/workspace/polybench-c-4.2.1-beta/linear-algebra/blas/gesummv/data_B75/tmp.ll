; ModuleID = 'A.ll'
source_filename = "gesummv.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca [1300 x [1300 x double]]*, align 8
  %9 = alloca [1300 x [1300 x double]]*, align 8
  %10 = alloca [1300 x double]*, align 8
  %11 = alloca [1300 x double]*, align 8
  %12 = alloca [1300 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1300, i32* %5, align 4
  %13 = call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %14 = bitcast [1300 x [1300 x double]]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %16 = bitcast [1300 x [1300 x double]]** %9 to i8**
  store i8* %15, i8** %16, align 8
  %17 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %18 = bitcast [1300 x double]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %20 = bitcast [1300 x double]** %11 to i8**
  store i8* %19, i8** %20, align 8
  %21 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %22 = bitcast [1300 x double]** %12 to i8**
  store i8* %21, i8** %22, align 8
  %23 = ptrtoint i8* %13 to i64
  %24 = inttoptr i64 %23 to [1300 x double]*
  %25 = ptrtoint i8* %15 to i64
  %26 = inttoptr i64 %25 to [1300 x double]*
  %27 = ptrtoint i8* %19 to i64
  %28 = inttoptr i64 %27 to double*
  call fastcc void @init_array(i32 1300, double* nonnull %6, double* nonnull %7, [1300 x double]* %24, [1300 x double]* %26, double* %28)
  call void (...) @polybench_timer_start() #4
  %29 = load double, double* %6, align 8
  %30 = load double, double* %7, align 8
  %31 = ptrtoint i8* %17 to i64
  %32 = inttoptr i64 %31 to double*
  %33 = ptrtoint i8* %21 to i64
  %34 = inttoptr i64 %33 to double*
  call fastcc void @kernel_gesummv(i32 1300, double %29, double %30, [1300 x double]* %24, [1300 x double]* %26, double* %32, double* %28, double* %34)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %35 = icmp sgt i32 %0, 42
  br i1 %35, label %36, label %._crit_edge

; <label>:36:                                     ; preds = %2
  %37 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %37, align 1
  %38 = icmp eq i8 %strcmpload, 0
  br i1 %38, label %39, label %._crit_edge

; <label>:39:                                     ; preds = %36
  call fastcc void @print_array(i32 1300, double* %34)
  br label %._crit_edge

._crit_edge:                                      ; preds = %36, %2, %39
  call void @free(i8* %13) #4
  call void @free(i8* %15) #4
  call void @free(i8* %17) #4
  call void @free(i8* %19) #4
  call void @free(i8* %21) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [1300 x double]*, [1300 x double]*, double*) unnamed_addr #2 {
  %7 = alloca i32, align 4
  %8 = alloca [1300 x double]*, align 8
  %9 = alloca [1300 x double]*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store [1300 x double]* %3, [1300 x double]** %8, align 8
  store [1300 x double]* %4, [1300 x double]** %9, align 8
  store double* %5, double** %10, align 8
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  store i32 0, i32* %11, align 4
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph3, label %47

.lr.ph3:                                          ; preds = %6
  %13 = sext i32 %0 to i64
  %14 = sitofp i32 %0 to double
  br i1 true, label %.lr.ph3.split.us.preheader, label %.lr.ph3.split.preheader

.lr.ph3.split.preheader:                          ; preds = %.lr.ph3
  br label %.lr.ph3.split

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  %15 = insertelement <2 x double> undef, double %14, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %.lr.ph3.split.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %17 = trunc i64 %indvars.iv10 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %14
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv10
  store double %20, double* %21, align 8
  br label %22

; <label>:22:                                     ; preds = %.lr.ph3.split.us, %22
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %22 ]
  %23 = mul nsw i64 %indvars.iv, %indvars.iv10
  %24 = add nsw i64 %23, 1
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %0
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  %29 = add nsw i64 %23, 2
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, %0
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %27, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fdiv <2 x double> %34, %16
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  store double %36, double* %28, align 8
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv10, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = icmp slt i64 %indvars.iv.next, %13
  br i1 %39, label %22, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %22
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %40 = icmp slt i64 %indvars.iv.next11, %13
  br i1 %40, label %.lr.ph3.split.us, label %._crit_edge4.loopexit

.lr.ph3.split:                                    ; preds = %.lr.ph3.split.preheader, %.lr.ph3.split
  %indvars.iv12 = phi i64 [ 0, %.lr.ph3.split.preheader ], [ %indvars.iv.next13, %.lr.ph3.split ]
  %41 = trunc i64 %indvars.iv12 to i32
  %42 = srem i32 %41, %0
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %14
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv12
  store double %44, double* %45, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %46 = icmp slt i64 %indvars.iv.next13, %13
  br i1 %46, label %.lr.ph3.split, label %._crit_edge4.loopexit17

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4.loopexit17:                          ; preds = %.lr.ph3.split
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit17, %._crit_edge4.loopexit
  %.lcssa7.in = phi i64 [ %indvars.iv.next11, %._crit_edge4.loopexit ], [ undef, %._crit_edge4.loopexit17 ]
  %.lcssa7 = trunc i64 %.lcssa7.in to i32
  store i32 %.lcssa7, i32* %11, align 4
  br label %47

; <label>:47:                                     ; preds = %._crit_edge4, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(i32, double, double, [1300 x double]*, [1300 x double]*, double*, double*, double*) unnamed_addr #2 {
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1300 x double]*, align 8
  %13 = alloca [1300 x double]*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store double %1, double* %10, align 8
  store double %2, double* %11, align 8
  store [1300 x double]* %3, [1300 x double]** %12, align 8
  store [1300 x double]* %4, [1300 x double]** %13, align 8
  store double* %5, double** %14, align 8
  store double* %6, double** %15, align 8
  store double* %7, double** %16, align 8
  store i32 0, i32* %17, align 4
  %18 = icmp sgt i32 %0, 0
  br i1 %18, label %.lr.ph2, label %70

.lr.ph2:                                          ; preds = %8
  %19 = sext i32 %0 to i64
  br i1 true, label %.lr.ph2.split.us.preheader, label %.lr.ph2.split.preheader

.lr.ph2.split.preheader:                          ; preds = %.lr.ph2
  %20 = fmul double %2, 0.000000e+00
  %21 = icmp sgt i64 1, %19
  %smax = select i1 %21, i64 1, i64 %19
  %min.iters.check = icmp ult i64 %smax, 4
  br i1 %min.iters.check, label %.lr.ph2.split.preheader50, label %min.iters.checked

.lr.ph2.split.preheader50:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph2.split.preheader
  %indvars.iv14.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph2.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph2.split

min.iters.checked:                                ; preds = %.lr.ph2.split.preheader
  %n.vec = and i64 %smax, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph2.split.preheader50, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep38 = getelementptr double, double* %5, i64 %smax
  %scevgep42 = getelementptr double, double* %7, i64 %smax
  %bound0 = icmp ult double* %5, %scevgep42
  %bound1 = icmp ult double* %7, %scevgep38
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph2.split.preheader50, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert46 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat47 = shufflevector <2 x double> %broadcast.splatinsert46, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert48 = insertelement <2 x double> undef, double %20, i32 0
  %broadcast.splat49 = shufflevector <2 x double> %broadcast.splatinsert48, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %22 = getelementptr inbounds double, double* %5, i64 %index
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8, !alias.scope !1, !noalias !4
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8, !alias.scope !1, !noalias !4
  %26 = getelementptr inbounds double, double* %7, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8, !alias.scope !4
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %29, align 8, !alias.scope !4
  %30 = bitcast double* %22 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1, !noalias !4
  %31 = bitcast double* %24 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1, !noalias !4
  %32 = fmul <2 x double> %broadcast.splat47, %wide.load
  %33 = fmul <2 x double> %broadcast.splat47, %wide.load45
  %34 = fadd <2 x double> %32, %broadcast.splat49
  %35 = fadd <2 x double> %33, %broadcast.splat49
  %36 = bitcast double* %26 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !4
  %37 = bitcast double* %28 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8, !alias.scope !4
  %index.next = add i64 %index, 4
  %38 = icmp eq i64 %index.next, %n.vec
  br i1 %38, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %middle.block.._crit_edge3_crit_edge, label %.lr.ph2.split.preheader50

middle.block.._crit_edge3_crit_edge:              ; preds = %middle.block
  br label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph2
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr26 = ptrtoint double* %7 to i64
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv10
  store double 0.000000e+00, double* %39, align 8
  %40 = getelementptr inbounds double, double* %7, i64 %indvars.iv10
  store double 0.000000e+00, double* %40, align 8
  %sunkaddr19 = shl i64 %indvars.iv10, 3
  %sunkaddr20 = add i64 %sunkaddr, %sunkaddr19
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to double*
  %sunkaddr28 = add i64 %sunkaddr26, %sunkaddr19
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  br label %41

; <label>:41:                                     ; preds = %.lr.ph2.split.us, %41
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %41 ]
  %42 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %6, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %sunkaddr21, align 8
  %48 = fadd double %46, %47
  store double %48, double* %sunkaddr21, align 8
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv10, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = load double, double* %44, align 8
  %52 = fmul double %50, %51
  %53 = load double, double* %sunkaddr29, align 8
  %54 = fadd double %52, %53
  store double %54, double* %sunkaddr29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = icmp slt i64 %indvars.iv.next, %19
  br i1 %55, label %41, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %41
  %56 = load double, double* %39, align 8
  %57 = fmul double %1, %56
  %58 = load double, double* %40, align 8
  %59 = fmul double %2, %58
  %60 = fadd double %57, %59
  store double %60, double* %40, align 8
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %61 = icmp slt i64 %indvars.iv.next11, %19
  br i1 %61, label %.lr.ph2.split.us, label %._crit_edge3.loopexit

.lr.ph2.split:                                    ; preds = %.lr.ph2.split.preheader50, %.lr.ph2.split
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %.lr.ph2.split ], [ %indvars.iv14.ph, %.lr.ph2.split.preheader50 ]
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv14
  store double 0.000000e+00, double* %62, align 8
  %63 = getelementptr inbounds double, double* %7, i64 %indvars.iv14
  store double 0.000000e+00, double* %63, align 8
  %64 = getelementptr inbounds double, double* %5, i64 %indvars.iv14
  %65 = load double, double* %64, align 8
  %66 = fmul double %1, %65
  %67 = fadd double %66, %20
  %68 = getelementptr inbounds double, double* %7, i64 %indvars.iv14
  store double %67, double* %68, align 8
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %69 = icmp slt i64 %indvars.iv.next15, %19
  br i1 %69, label %.lr.ph2.split, label %._crit_edge3.loopexit51, !llvm.loop !9

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3.loopexit51:                          ; preds = %.lr.ph2.split
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %middle.block.._crit_edge3_crit_edge, %._crit_edge3.loopexit51, %._crit_edge3.loopexit
  %.lcssa5.in = phi i64 [ undef, %middle.block.._crit_edge3_crit_edge ], [ %indvars.iv.next11, %._crit_edge3.loopexit ], [ undef, %._crit_edge3.loopexit51 ]
  %.lcssa5 = trunc i64 %.lcssa5.in to i32
  store i32 %.lcssa5, i32* %17, align 4
  br label %70

; <label>:70:                                     ; preds = %._crit_edge3, %8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store double* %1, double** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph, label %24

.lr.ph:                                           ; preds = %2
  %11 = sext i32 %0 to i64
  br label %12

; <label>:12:                                     ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %12
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %22 = icmp slt i64 %indvars.iv.next, %11
  br i1 %22, label %12, label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge
  %23 = trunc i64 %indvars.iv.next to i32
  store i32 %23, i32* %5, align 4
  br label %24

; <label>:24:                                     ; preds = %._crit_edge2, %2
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
