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
  %13 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %14 = bitcast [1300 x [1300 x double]]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %16 = bitcast [1300 x [1300 x double]]** %9 to i8**
  store i8* %15, i8** %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %18 = bitcast [1300 x double]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %20 = bitcast [1300 x double]** %11 to i8**
  store i8* %19, i8** %20, align 8
  %21 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %22 = bitcast [1300 x double]** %12 to i8**
  store i8* %21, i8** %22, align 8
  %23 = load i32, i32* %5, align 4
  %24 = bitcast [1300 x [1300 x double]]** %8 to [1300 x double]**
  %25 = load [1300 x double]*, [1300 x double]** %24, align 8
  %26 = bitcast [1300 x [1300 x double]]** %9 to [1300 x double]**
  %27 = load [1300 x double]*, [1300 x double]** %26, align 8
  %28 = bitcast [1300 x double]** %11 to double**
  %29 = load double*, double** %28, align 8
  call fastcc void @init_array(i32 %23, double* nonnull %6, double* nonnull %7, [1300 x double]* %25, [1300 x double]* %27, double* %29)
  call void (...) @polybench_timer_start() #4
  %30 = load i32, i32* %5, align 4
  %31 = load double, double* %6, align 8
  %32 = load double, double* %7, align 8
  %33 = bitcast [1300 x [1300 x double]]** %8 to [1300 x double]**
  %34 = load [1300 x double]*, [1300 x double]** %33, align 8
  %35 = bitcast [1300 x [1300 x double]]** %9 to [1300 x double]**
  %36 = load [1300 x double]*, [1300 x double]** %35, align 8
  %37 = bitcast [1300 x double]** %10 to double**
  %38 = load double*, double** %37, align 8
  %39 = bitcast [1300 x double]** %11 to double**
  %40 = load double*, double** %39, align 8
  %41 = bitcast [1300 x double]** %12 to double**
  %42 = load double*, double** %41, align 8
  call fastcc void @kernel_gesummv(i32 %30, double %31, double %32, [1300 x double]* %34, [1300 x double]* %36, double* %38, double* %40, double* %42)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %43 = load i32, i32* %3, align 4
  %44 = icmp sgt i32 %43, 42
  br i1 %44, label %45, label %._crit_edge

; <label>:45:                                     ; preds = %2
  %46 = load i8**, i8*** %4, align 8
  %47 = load i8*, i8** %46, align 8
  %strcmpload = load i8, i8* %47, align 1
  %48 = icmp eq i8 %strcmpload, 0
  br i1 %48, label %49, label %._crit_edge

; <label>:49:                                     ; preds = %45
  %50 = load i32, i32* %5, align 4
  %51 = bitcast [1300 x double]** %12 to double**
  %52 = load double*, double** %51, align 8
  call fastcc void @print_array(i32 %50, double* %52)
  br label %._crit_edge

._crit_edge:                                      ; preds = %45, %2, %49
  %53 = bitcast [1300 x [1300 x double]]** %8 to i8**
  %54 = load i8*, i8** %53, align 8
  call void @free(i8* %54) #4
  %55 = bitcast [1300 x [1300 x double]]** %9 to i8**
  %56 = load i8*, i8** %55, align 8
  call void @free(i8* %56) #4
  %57 = bitcast [1300 x double]** %10 to i8**
  %58 = load i8*, i8** %57, align 8
  call void @free(i8* %58) #4
  %59 = bitcast [1300 x double]** %11 to i8**
  %60 = load i8*, i8** %59, align 8
  call void @free(i8* %60) #4
  %61 = bitcast [1300 x double]** %12 to i8**
  %62 = load i8*, i8** %61, align 8
  call void @free(i8* %62) #4
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
  %12 = load i32, i32* %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.lr.ph4, label %61

.lr.ph4:                                          ; preds = %6
  %14 = load i32, i32* %7, align 4
  %15 = sext i32 %14 to i64
  %16 = sext i32 %14 to i64
  %17 = sitofp i32 %14 to double
  %18 = load double*, double** %10, align 8
  %19 = icmp sgt i32 %14, 0
  %20 = sitofp i32 %14 to double
  %21 = load [1300 x double]*, [1300 x double]** %8, align 8
  %22 = sitofp i32 %14 to double
  %23 = load [1300 x double]*, [1300 x double]** %9, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %19, label %.lr.ph4.split.us.preheader, label %.lr.ph4.split.preheader

.lr.ph4.split.preheader:                          ; preds = %.lr.ph4
  %24 = sext i32 %.promoted to i64
  br label %.lr.ph4.split

.lr.ph4.split.us.preheader:                       ; preds = %.lr.ph4
  %25 = load i32, i32* %7, align 4
  %26 = sext i32 %25 to i64
  %27 = sext i32 %.promoted to i64
  %28 = insertelement <2 x double> undef, double %20, i32 0
  %29 = insertelement <2 x double> %28, double %22, i32 1
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %.lr.ph4.split.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %27, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %30 = trunc i64 %indvars.iv11 to i32
  %31 = srem i32 %30, %14
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %17
  %34 = getelementptr inbounds double, double* %18, i64 %indvars.iv11
  store double %33, double* %34, align 8
  br label %35

; <label>:35:                                     ; preds = %.lr.ph4.split.us, %35
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %35 ]
  %36 = mul nsw i64 %indvars.iv, %indvars.iv11
  %37 = add nsw i64 %36, 1
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %14
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds [1300 x double], [1300 x double]* %21, i64 %indvars.iv11, i64 %indvars.iv
  %42 = mul nsw i64 %indvars.iv, %indvars.iv11
  %43 = add nsw i64 %42, 2
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %14
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %40, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fdiv <2 x double> %48, %29
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  store double %50, double* %41, align 8
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %23, i64 %indvars.iv11, i64 %indvars.iv
  store double %51, double* %52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %53 = icmp slt i64 %indvars.iv.next, %26
  br i1 %53, label %35, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %35
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %54 = icmp slt i64 %indvars.iv.next12, %15
  br i1 %54, label %.lr.ph4.split.us, label %._crit_edge5.loopexit

.lr.ph4.split:                                    ; preds = %.lr.ph4.split.preheader, %.lr.ph4.split
  %indvars.iv13 = phi i64 [ %24, %.lr.ph4.split.preheader ], [ %indvars.iv.next14, %.lr.ph4.split ]
  %55 = trunc i64 %indvars.iv13 to i32
  %56 = srem i32 %55, %14
  %57 = sitofp i32 %56 to double
  %58 = fdiv double %57, %17
  %59 = getelementptr inbounds double, double* %18, i64 %indvars.iv13
  store double %58, double* %59, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %60 = icmp slt i64 %indvars.iv.next14, %16
  br i1 %60, label %.lr.ph4.split, label %._crit_edge5.loopexit19

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5.loopexit19:                          ; preds = %.lr.ph4.split
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit19, %._crit_edge5.loopexit
  %.lcssa8.in = phi i64 [ %indvars.iv.next12, %._crit_edge5.loopexit ], [ %indvars.iv.next14, %._crit_edge5.loopexit19 ]
  %.lcssa8 = trunc i64 %.lcssa8.in to i32
  store i32 %.lcssa8, i32* %11, align 4
  br label %61

; <label>:61:                                     ; preds = %._crit_edge5, %6
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
  %18 = load i32, i32* %9, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %.lr.ph3, label %96

.lr.ph3:                                          ; preds = %8
  %20 = load double*, double** %14, align 8
  %21 = load double*, double** %16, align 8
  %22 = load i32, i32* %9, align 4
  %23 = sext i32 %22 to i64
  %24 = icmp sgt i32 %22, 0
  %25 = load double, double* %10, align 8
  %26 = load double, double* %11, align 8
  %27 = load [1300 x double]*, [1300 x double]** %12, align 8
  %28 = load double*, double** %15, align 8
  %29 = load double*, double** %14, align 8
  %30 = load [1300 x double]*, [1300 x double]** %13, align 8
  %31 = load double*, double** %16, align 8
  %.promoted5 = load i32, i32* %17, align 4
  %32 = sext i32 %.promoted5 to i64
  br i1 %24, label %.lr.ph3.split.us.preheader, label %.lr.ph3.split.preheader

.lr.ph3.split.preheader:                          ; preds = %.lr.ph3
  %33 = fmul double %26, 0.000000e+00
  %34 = add nsw i64 %32, 1
  %35 = icmp sgt i64 %34, %23
  %smax = select i1 %35, i64 %34, i64 %23
  %36 = sub nsw i64 %smax, %32
  %min.iters.check = icmp ult i64 %36, 4
  br i1 %min.iters.check, label %.lr.ph3.split.preheader51, label %min.iters.checked

.lr.ph3.split.preheader51:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph3.split.preheader
  %indvars.iv13.ph = phi i64 [ %32, %vector.memcheck ], [ %32, %min.iters.checked ], [ %32, %.lr.ph3.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph3.split

min.iters.checked:                                ; preds = %.lr.ph3.split.preheader
  %n.vec = and i64 %36, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph3.split.preheader51, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %20, i64 %32
  %37 = add nsw i64 %32, 1
  %38 = icmp sgt i64 %37, %23
  %smax38 = select i1 %38, i64 %37, i64 %23
  %scevgep39 = getelementptr double, double* %20, i64 %smax38
  %scevgep41 = getelementptr double, double* %21, i64 %32
  %scevgep43 = getelementptr double, double* %21, i64 %smax38
  %bound0 = icmp ult double* %scevgep, %scevgep43
  %bound1 = icmp ult double* %scevgep41, %scevgep39
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add nsw i64 %32, %n.vec
  br i1 %memcheck.conflict, label %.lr.ph3.split.preheader51, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %25, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert49 = insertelement <2 x double> undef, double %33, i32 0
  %broadcast.splat50 = shufflevector <2 x double> %broadcast.splatinsert49, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %39 = add i64 %32, %index
  %40 = getelementptr inbounds double, double* %20, i64 %39
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8, !alias.scope !1, !noalias !4
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %43, align 8, !alias.scope !1, !noalias !4
  %44 = getelementptr inbounds double, double* %21, i64 %39
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %45, align 8, !alias.scope !4
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %47, align 8, !alias.scope !4
  %48 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !1, !noalias !4
  %49 = bitcast double* %42 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !1, !noalias !4
  %50 = fmul <2 x double> %broadcast.splat48, %wide.load
  %51 = fmul <2 x double> %broadcast.splat48, %wide.load46
  %52 = fadd <2 x double> %50, %broadcast.splat50
  %53 = fadd <2 x double> %51, %broadcast.splat50
  %54 = bitcast double* %44 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !4
  %55 = bitcast double* %46 to <2 x double>*
  store <2 x double> %53, <2 x double>* %55, align 8, !alias.scope !4
  %index.next = add i64 %index, 4
  %56 = icmp eq i64 %index.next, %n.vec
  br i1 %56, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %36, %n.vec
  br i1 %cmp.n, label %._crit_edge4, label %.lr.ph3.split.preheader51

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  %57 = load i32, i32* %9, align 4
  %58 = sext i32 %57 to i64
  %59 = sext i32 %.promoted5 to i64
  %60 = sext i32 %22 to i64
  %sunkaddr = ptrtoint double* %29 to i64
  %sunkaddr23 = ptrtoint double* %29 to i64
  %sunkaddr27 = ptrtoint double* %31 to i64
  %sunkaddr31 = ptrtoint double* %31 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %.lr.ph3.split.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %59, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %61 = getelementptr inbounds double, double* %20, i64 %indvars.iv11
  store double 0.000000e+00, double* %61, align 8
  %62 = getelementptr inbounds double, double* %21, i64 %indvars.iv11
  store double 0.000000e+00, double* %62, align 8
  %sunkaddr20 = shl i64 %indvars.iv11, 3
  %sunkaddr21 = add i64 %sunkaddr, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  %sunkaddr24 = shl i64 %indvars.iv11, 3
  %sunkaddr25 = add i64 %sunkaddr23, %sunkaddr24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  %sunkaddr28 = shl i64 %indvars.iv11, 3
  %sunkaddr29 = add i64 %sunkaddr27, %sunkaddr28
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to double*
  %sunkaddr32 = shl i64 %indvars.iv11, 3
  %sunkaddr33 = add i64 %sunkaddr31, %sunkaddr32
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  br label %63

; <label>:63:                                     ; preds = %.lr.ph3.split.us, %63
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %63 ]
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %27, i64 %indvars.iv11, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = load double, double* %sunkaddr22, align 8
  %70 = fadd double %68, %69
  store double %70, double* %sunkaddr26, align 8
  %71 = getelementptr inbounds [1300 x double], [1300 x double]* %30, i64 %indvars.iv11, i64 %indvars.iv
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = load double, double* %sunkaddr30, align 8
  %77 = fadd double %75, %76
  store double %77, double* %sunkaddr34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %78 = icmp slt i64 %indvars.iv.next, %58
  br i1 %78, label %63, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %63
  %79 = getelementptr inbounds double, double* %20, i64 %indvars.iv11
  %80 = load double, double* %79, align 8
  %81 = fmul double %25, %80
  %82 = getelementptr inbounds double, double* %21, i64 %indvars.iv11
  %83 = load double, double* %82, align 8
  %84 = fmul double %26, %83
  %85 = fadd double %81, %84
  %86 = getelementptr inbounds double, double* %21, i64 %indvars.iv11
  store double %85, double* %86, align 8
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %87 = icmp slt i64 %indvars.iv.next12, %60
  br i1 %87, label %.lr.ph3.split.us, label %._crit_edge4.loopexit

.lr.ph3.split:                                    ; preds = %.lr.ph3.split.preheader51, %.lr.ph3.split
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %.lr.ph3.split ], [ %indvars.iv13.ph, %.lr.ph3.split.preheader51 ]
  %88 = getelementptr inbounds double, double* %20, i64 %indvars.iv13
  store double 0.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds double, double* %21, i64 %indvars.iv13
  store double 0.000000e+00, double* %89, align 8
  %90 = getelementptr inbounds double, double* %20, i64 %indvars.iv13
  %91 = load double, double* %90, align 8
  %92 = fmul double %25, %91
  %93 = fadd double %92, %33
  %94 = getelementptr inbounds double, double* %21, i64 %indvars.iv13
  store double %93, double* %94, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %95 = icmp slt i64 %indvars.iv.next14, %23
  br i1 %95, label %.lr.ph3.split, label %._crit_edge4.loopexit53, !llvm.loop !9

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4.loopexit53:                          ; preds = %.lr.ph3.split
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit53, %._crit_edge4.loopexit, %middle.block
  %.lcssa6.in = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv.next12, %._crit_edge4.loopexit ], [ %indvars.iv.next14, %._crit_edge4.loopexit53 ]
  %.lcssa6 = trunc i64 %.lcssa6.in to i32
  store i32 %.lcssa6, i32* %17, align 4
  br label %96

; <label>:96:                                     ; preds = %._crit_edge4, %8
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
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %28

.lr.ph:                                           ; preds = %2
  %12 = load double*, double** %4, align 8
  %13 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  %14 = sext i32 %.promoted to i64
  %15 = sext i32 %13 to i64
  br label %16

; <label>:16:                                     ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ %14, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %16
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %16, %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %26 = icmp slt i64 %indvars.iv.next, %15
  br i1 %26, label %16, label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge
  %27 = trunc i64 %indvars.iv.next to i32
  store i32 %27, i32* %5, align 4
  br label %28

; <label>:28:                                     ; preds = %._crit_edge2, %2
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
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
