; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1900 x [2100 x double]]*, align 8
  %8 = alloca [2100 x double]*, align 8
  %9 = alloca [2100 x double]*, align 8
  %10 = alloca [1900 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1900, i32* %5, align 4
  store i32 2100, i32* %6, align 4
  %11 = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %12 = bitcast [1900 x [2100 x double]]** %7 to i8**
  store i8* %11, i8** %12, align 8
  %13 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %14 = bitcast [2100 x double]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %16 = bitcast [2100 x double]** %9 to i8**
  store i8* %15, i8** %16, align 8
  %17 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %18 = bitcast [1900 x double]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = load i32, i32* %5, align 4
  %20 = load i32, i32* %6, align 4
  %21 = bitcast [1900 x [2100 x double]]** %7 to [2100 x double]**
  %22 = load [2100 x double]*, [2100 x double]** %21, align 8
  %23 = bitcast [2100 x double]** %8 to double**
  %24 = load double*, double** %23, align 8
  call void @init_array(i32 %19, i32 %20, [2100 x double]* %22, double* %24)
  call void (...) @polybench_timer_start() #4
  %25 = load i32, i32* %5, align 4
  %26 = load i32, i32* %6, align 4
  %27 = bitcast [1900 x [2100 x double]]** %7 to [2100 x double]**
  %28 = load [2100 x double]*, [2100 x double]** %27, align 8
  %29 = bitcast [2100 x double]** %8 to double**
  %30 = load double*, double** %29, align 8
  %31 = bitcast [2100 x double]** %9 to double**
  %32 = load double*, double** %31, align 8
  %33 = bitcast [1900 x double]** %10 to double**
  %34 = load double*, double** %33, align 8
  call void @kernel_atax(i32 %25, i32 %26, [2100 x double]* %28, double* %30, double* %32, double* %34)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %35 = load i32, i32* %3, align 4
  %36 = icmp sgt i32 %35, 42
  br i1 %36, label %37, label %._crit_edge

; <label>:37:                                     ; preds = %2
  %38 = load i8**, i8*** %4, align 8
  %39 = load i8*, i8** %38, align 8
  %strcmpload = load i8, i8* %39, align 1
  %40 = icmp eq i8 %strcmpload, 0
  br i1 %40, label %41, label %._crit_edge

; <label>:41:                                     ; preds = %37
  %42 = load i32, i32* %6, align 4
  %43 = bitcast [2100 x double]** %9 to double**
  %44 = load double*, double** %43, align 8
  call void @print_array(i32 %42, double* %44)
  br label %._crit_edge

._crit_edge:                                      ; preds = %37, %2, %41
  %45 = bitcast [1900 x [2100 x double]]** %7 to i8**
  %46 = load i8*, i8** %45, align 8
  call void @free(i8* %46) #4
  %47 = bitcast [2100 x double]** %8 to i8**
  %48 = load i8*, i8** %47, align 8
  call void @free(i8* %48) #4
  %49 = bitcast [2100 x double]** %9 to i8**
  %50 = load i8*, i8** %49, align 8
  call void @free(i8* %50) #4
  %51 = bitcast [1900 x double]** %10 to i8**
  %52 = load i8*, i8** %51, align 8
  call void @free(i8* %52) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [2100 x double]*, double*) #2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [2100 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [2100 x double]* %2, [2100 x double]** %7, align 8
  store double* %3, double** %8, align 8
  %11 = sitofp i32 %1 to double
  store double %11, double* %10, align 8
  store i32 0, i32* %9, align 4
  %12 = icmp sgt i32 %1, 0
  br i1 %12, label %.lr.ph5.preheader, label %._crit_edge6

.lr.ph5.preheader:                                ; preds = %4
  %13 = load double, double* %10, align 8
  %14 = load double*, double** %8, align 8
  %15 = load i32, i32* %6, align 4
  %.promoted = load i32, i32* %9, align 4
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader
  %16 = phi i32 [ %.promoted, %.lr.ph5.preheader ], [ %23, %.lr.ph5 ]
  %17 = phi i32 [ 0, %.lr.ph5.preheader ], [ %23, %.lr.ph5 ]
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = fadd double %19, 1.000000e+00
  %21 = sext i32 %17 to i64
  %22 = getelementptr inbounds double, double* %14, i64 %21
  store double %20, double* %22, align 8
  %23 = add nsw i32 %16, 1
  %24 = icmp slt i32 %23, %15
  br i1 %24, label %.lr.ph5, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %.lr.ph5
  store i32 %23, i32* %9, align 4
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %4, %._crit_edge6.loopexit
  store i32 0, i32* %9, align 4
  %25 = load i32, i32* %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph2.preheader, label %._crit_edge3

.lr.ph2.preheader:                                ; preds = %._crit_edge6
  %27 = load i32, i32* %6, align 4
  %28 = load i32, i32* %5, align 4
  %29 = mul nsw i32 %28, 5
  %30 = sitofp i32 %29 to double
  %31 = load [2100 x double]*, [2100 x double]** %7, align 8
  %.promoted7 = load i32, i32* %9, align 4
  %32 = sext i32 %.promoted7 to i64
  %33 = sext i32 %28 to i64
  %34 = zext i32 %27 to i64
  %35 = icmp sgt i32 %27, 0
  %xtraiter = and i64 %34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %36 = icmp eq i32 %27, 1
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv13 = phi i64 [ %32, %.lr.ph2.preheader ], [ %indvars.iv.next14, %._crit_edge ]
  br i1 %35, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph2
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %37 = trunc i64 %indvars.iv13 to i32
  %38 = srem i32 %37, %27
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %30
  %41 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %indvars.iv13, i64 0
  store double %40, double* %41, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br i1 %36, label %._crit_edge, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %42 = add nsw i64 %indvars.iv13, %indvars.iv
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %27
  %45 = sitofp i32 %44 to double
  %46 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %indvars.iv13, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = add nsw i64 %indvars.iv13, %indvars.iv.next
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, %27
  %50 = sitofp i32 %49 to double
  %51 = insertelement <2 x double> undef, double %30, i32 0
  %52 = insertelement <2 x double> %51, double %30, i32 1
  %53 = insertelement <2 x double> undef, double %45, i32 0
  %54 = insertelement <2 x double> %53, double %50, i32 1
  %55 = fdiv <2 x double> %54, %52
  %56 = bitcast double* %46 to <2 x double>*
  store <2 x double> %55, <2 x double>* %56, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next.1, %34
  br i1 %exitcond15.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph2
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %57 = icmp slt i64 %indvars.iv.next14, %33
  br i1 %57, label %.lr.ph2, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  %58 = trunc i64 %indvars.iv.next14 to i32
  store i32 %58, i32* %9, align 4
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge6, %._crit_edge3.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) #2 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [2100 x double]*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [2100 x double]* %2, [2100 x double]** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store double* %5, double** %12, align 8
  store i32 0, i32* %13, align 4
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph8.preheader, label %._crit_edge9

.lr.ph8.preheader:                                ; preds = %6
  %15 = load double*, double** %11, align 8
  %16 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %13, align 4
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %.lr.ph8, %.lr.ph8.preheader
  %17 = phi i32 [ %.promoted, %.lr.ph8.preheader ], [ %21, %.lr.ph8 ]
  %18 = phi i32 [ 0, %.lr.ph8.preheader ], [ %21, %.lr.ph8 ]
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, double* %15, i64 %19
  store double 0.000000e+00, double* %20, align 8
  %21 = add nsw i32 %17, 1
  %22 = icmp slt i32 %21, %16
  br i1 %22, label %.lr.ph8, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %.lr.ph8
  store i32 %21, i32* %13, align 4
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %6, %._crit_edge9.loopexit
  store i32 0, i32* %13, align 4
  %23 = load i32, i32* %7, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.lr.ph5.preheader, label %._crit_edge6

.lr.ph5.preheader:                                ; preds = %._crit_edge9
  %25 = load double*, double** %12, align 8
  %26 = load i32, i32* %8, align 4
  %27 = load [2100 x double]*, [2100 x double]** %9, align 8
  %28 = load double*, double** %10, align 8
  %29 = load double*, double** %11, align 8
  %30 = load i32, i32* %7, align 4
  %.promoted13 = load i32, i32* %13, align 4
  %31 = sext i32 %.promoted13 to i64
  %32 = sext i32 %30 to i64
  %33 = zext i32 %26 to i64
  %34 = add nsw i64 %33, -1
  %35 = icmp sgt i32 %26, 0
  %xtraiter = and i64 %33, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %36 = icmp eq i64 %34, 0
  %37 = icmp sgt i32 %26, 0
  %xtraiter33 = and i64 %33, 1
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  %38 = icmp eq i64 %34, 0
  %sunkaddr21 = ptrtoint double* %25 to i64
  %sunkaddr21.1 = ptrtoint double* %25 to i64
  %sunkaddr21.prol = ptrtoint double* %25 to i64
  %sunkaddr = ptrtoint double* %25 to i64
  %sunkaddr.1 = ptrtoint double* %25 to i64
  %sunkaddr.prol = ptrtoint double* %25 to i64
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge3, %.lr.ph5.preheader
  %indvars.iv30 = phi i64 [ %31, %.lr.ph5.preheader ], [ %indvars.iv.next31, %._crit_edge3 ]
  %39 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next31, %._crit_edge3 ]
  %sext = shl i64 %39, 32
  %40 = ashr exact i64 %sext, 32
  %41 = getelementptr inbounds double, double* %25, i64 %40
  store double 0.000000e+00, double* %41, align 8
  br i1 %35, label %.lr.ph.preheader, label %._crit_edge3

.lr.ph.preheader:                                 ; preds = %.lr.ph5
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %sunkaddr18.prol = shl i64 %indvars.iv30, 3
  %sunkaddr19.prol = add i64 %sunkaddr.prol, %sunkaddr18.prol
  %sunkaddr20.prol = inttoptr i64 %sunkaddr19.prol to double*
  %42 = load double, double* %sunkaddr20.prol, align 8
  %43 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv30, i64 0
  %44 = load double, double* %43, align 8
  %45 = load double, double* %28, align 8
  %46 = fmul double %44, %45
  %47 = fadd double %42, %46
  store double %47, double* %sunkaddr20.prol, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br i1 %36, label %._crit_edge, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  %sunkaddr18 = shl i64 %indvars.iv30, 3
  %sunkaddr19 = add i64 %sunkaddr, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  %sunkaddr18.1 = shl i64 %indvars.iv30, 3
  %sunkaddr19.1 = add i64 %sunkaddr.1, %sunkaddr18.1
  %sunkaddr20.1 = inttoptr i64 %sunkaddr19.1 to double*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %48 = load double, double* %sunkaddr20, align 8
  %49 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv30, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %48, %53
  store double %54, double* %sunkaddr20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = load double, double* %sunkaddr20.1, align 8
  %56 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv30, i64 %indvars.iv.next
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %28, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %55, %60
  store double %61, double* %sunkaddr20.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next.1, %33
  br i1 %exitcond32.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit
  br i1 %37, label %.lr.ph2.preheader, label %._crit_edge3

.lr.ph2.preheader:                                ; preds = %._crit_edge
  br i1 %lcmp.mod34, label %.lr.ph2.prol.loopexit, label %.lr.ph2.prol

.lr.ph2.prol:                                     ; preds = %.lr.ph2.preheader
  %62 = load double, double* %29, align 8
  %63 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv30, i64 0
  %64 = load double, double* %63, align 8
  %sunkaddr22.prol = shl i64 %indvars.iv30, 3
  %sunkaddr23.prol = add i64 %sunkaddr21.prol, %sunkaddr22.prol
  %sunkaddr24.prol = inttoptr i64 %sunkaddr23.prol to double*
  %65 = load double, double* %sunkaddr24.prol, align 8
  %66 = fmul double %64, %65
  %67 = fadd double %62, %66
  store double %67, double* %29, align 8
  br label %.lr.ph2.prol.loopexit

.lr.ph2.prol.loopexit:                            ; preds = %.lr.ph2.prol, %.lr.ph2.preheader
  %indvars.iv26.unr.ph = phi i64 [ 1, %.lr.ph2.prol ], [ 0, %.lr.ph2.preheader ]
  br i1 %38, label %._crit_edge3, label %.lr.ph2.preheader.new

.lr.ph2.preheader.new:                            ; preds = %.lr.ph2.prol.loopexit
  %sunkaddr22 = shl i64 %indvars.iv30, 3
  %sunkaddr23 = add i64 %sunkaddr21, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  %sunkaddr22.1 = shl i64 %indvars.iv30, 3
  %sunkaddr23.1 = add i64 %sunkaddr21.1, %sunkaddr22.1
  %sunkaddr24.1 = inttoptr i64 %sunkaddr23.1 to double*
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2, %.lr.ph2.preheader.new
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr.ph, %.lr.ph2.preheader.new ], [ %indvars.iv.next27.1, %.lr.ph2 ]
  %68 = getelementptr inbounds double, double* %29, i64 %indvars.iv26
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv30, i64 %indvars.iv26
  %71 = load double, double* %70, align 8
  %72 = load double, double* %sunkaddr24, align 8
  %73 = fmul double %71, %72
  %74 = fadd double %69, %73
  store double %74, double* %68, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %75 = getelementptr inbounds double, double* %29, i64 %indvars.iv.next27
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv30, i64 %indvars.iv.next27
  %78 = load double, double* %77, align 8
  %79 = load double, double* %sunkaddr24.1, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %76, %80
  store double %81, double* %75, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next27.1, %33
  br i1 %exitcond.1, label %._crit_edge3.loopexit, label %.lr.ph2

._crit_edge3.loopexit:                            ; preds = %.lr.ph2
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.lr.ph2.prol.loopexit, %._crit_edge, %.lr.ph5
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 1
  %82 = icmp slt i64 %indvars.iv.next31, %32
  br i1 %82, label %.lr.ph5, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %._crit_edge3
  %83 = trunc i64 %indvars.iv.next31 to i32
  store i32 %83, i32* %13, align 4
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge9, %._crit_edge6.loopexit
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
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
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %12 = load double*, double** %4, align 8
  %13 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  %14 = sext i32 %.promoted to i64
  %15 = sext i32 %13 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %14, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %16 = phi i32 [ 0, %.lr.ph.preheader ], [ %26, %.lr.ph._crit_edge ]
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %.lr.ph._crit_edge

; <label>:19:                                     ; preds = %.lr.ph
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = icmp slt i64 %indvars.iv.next, %15
  %26 = trunc i64 %indvars.iv.next to i32
  br i1 %25, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  store i32 %26, i32* %5, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge.loopexit
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
