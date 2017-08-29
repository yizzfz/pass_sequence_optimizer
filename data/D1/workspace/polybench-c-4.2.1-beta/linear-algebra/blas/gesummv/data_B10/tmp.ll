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
  %13 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %14 = bitcast [1300 x [1300 x double]]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %16 = bitcast [1300 x [1300 x double]]** %9 to i8**
  store i8* %15, i8** %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %18 = bitcast [1300 x double]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %20 = bitcast [1300 x double]** %11 to i8**
  store i8* %19, i8** %20, align 8
  %21 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
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
  call void (...) @polybench_timer_start() #3
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
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  call void @free(i8* %54) #3
  %55 = bitcast [1300 x [1300 x double]]** %9 to i8**
  %56 = load i8*, i8** %55, align 8
  call void @free(i8* %56) #3
  %57 = bitcast [1300 x double]** %10 to i8**
  %58 = load i8*, i8** %57, align 8
  call void @free(i8* %58) #3
  %59 = bitcast [1300 x double]** %11 to i8**
  %60 = load i8*, i8** %59, align 8
  call void @free(i8* %60) #3
  %61 = bitcast [1300 x double]** %12 to i8**
  %62 = load i8*, i8** %61, align 8
  call void @free(i8* %62) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*, [1300 x double]*, [1300 x double]*, double*) unnamed_addr #0 {
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
  br i1 %13, label %.lr.ph4, label %._crit_edge

.lr.ph4:                                          ; preds = %6
  %14 = load i32, i32* %7, align 4
  %15 = sext i32 %14 to i64
  %16 = sitofp i32 %14 to double
  %17 = load double*, double** %10, align 8
  %18 = icmp sgt i32 %14, 0
  %19 = sitofp i32 %14 to double
  %20 = load [1300 x double]*, [1300 x double]** %8, align 8
  %21 = sitofp i32 %14 to double
  %22 = load [1300 x double]*, [1300 x double]** %9, align 8
  %.promoted = load i32, i32* %11, align 4
  br i1 %18, label %.lr.ph4.split.us.preheader, label %.lr.ph4.split.preheader

.lr.ph4.split.preheader:                          ; preds = %.lr.ph4
  %23 = sext i32 %.promoted to i64
  br label %.lr.ph4.split

.lr.ph4.split.us.preheader:                       ; preds = %.lr.ph4
  %24 = load i32, i32* %7, align 4
  %25 = sext i32 %24 to i64
  %26 = sext i32 %.promoted to i64
  %27 = sext i32 %14 to i64
  %28 = insertelement <2 x double> undef, double %19, i32 0
  %29 = insertelement <2 x double> %28, double %21, i32 1
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv11 = phi i64 [ %26, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %30 = trunc i64 %indvars.iv11 to i32
  %31 = srem i32 %30, %14
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %16
  %34 = getelementptr inbounds double, double* %17, i64 %indvars.iv11
  store double %33, double* %34, align 8
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %._crit_edge18 ]
  %35 = mul nsw i64 %indvars.iv, %indvars.iv11
  %36 = add nsw i64 %35, 1
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %14
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %20, i64 %indvars.iv11, i64 %indvars.iv
  %41 = mul nsw i64 %indvars.iv, %indvars.iv11
  %42 = add nsw i64 %41, 2
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %14
  %45 = sitofp i32 %44 to double
  %46 = insertelement <2 x double> undef, double %39, i32 0
  %47 = insertelement <2 x double> %46, double %45, i32 1
  %48 = fdiv <2 x double> %47, %29
  %49 = extractelement <2 x double> %48, i32 0
  %50 = extractelement <2 x double> %48, i32 1
  store double %49, double* %40, align 8
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %22, i64 %indvars.iv11, i64 %indvars.iv
  store double %50, double* %51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %52 = icmp slt i64 %indvars.iv.next, %25
  br i1 %52, label %._crit_edge18, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge18
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %53 = icmp slt i64 %indvars.iv.next12, %27
  br i1 %53, label %.lr.ph4.split.us, label %._crit_edge5.loopexit

.lr.ph4.split:                                    ; preds = %.lr.ph4.split, %.lr.ph4.split.preheader
  %indvars.iv13 = phi i64 [ %23, %.lr.ph4.split.preheader ], [ %indvars.iv.next14, %.lr.ph4.split ]
  %54 = trunc i64 %indvars.iv13 to i32
  %55 = srem i32 %54, %14
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %16
  %58 = getelementptr inbounds double, double* %17, i64 %indvars.iv13
  store double %57, double* %58, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %59 = icmp slt i64 %indvars.iv.next14, %15
  br i1 %59, label %.lr.ph4.split, label %._crit_edge5.loopexit19

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5.loopexit19:                          ; preds = %.lr.ph4.split
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit19, %._crit_edge5.loopexit
  %.lcssa8.in = phi i64 [ %indvars.iv.next12, %._crit_edge5.loopexit ], [ %indvars.iv.next14, %._crit_edge5.loopexit19 ]
  %.lcssa8 = trunc i64 %.lcssa8.in to i32
  store i32 %.lcssa8, i32* %11, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %._crit_edge5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gesummv(i32, double, double, [1300 x double]*, [1300 x double]*, double*, double*, double*) unnamed_addr #0 {
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
  br i1 %19, label %.lr.ph3, label %._crit_edge

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
  br i1 %24, label %.lr.ph3.split.us.preheader, label %.lr.ph3.split.preheader

.lr.ph3.split.preheader:                          ; preds = %.lr.ph3
  %32 = sext i32 %.promoted5 to i64
  %33 = fmul double %26, 0.000000e+00
  br label %.lr.ph3.split

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  %34 = load i32, i32* %9, align 4
  %35 = sext i32 %34 to i64
  %36 = sext i32 %.promoted5 to i64
  %37 = sext i32 %22 to i64
  %sunkaddr = ptrtoint double* %29 to i64
  %sunkaddr24 = ptrtoint double* %29 to i64
  %sunkaddr28 = ptrtoint double* %31 to i64
  %sunkaddr32 = ptrtoint double* %31 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv11 = phi i64 [ %36, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %38 = getelementptr inbounds double, double* %20, i64 %indvars.iv11
  store double 0.000000e+00, double* %38, align 8
  %39 = getelementptr inbounds double, double* %21, i64 %indvars.iv11
  store double 0.000000e+00, double* %39, align 8
  %sunkaddr21 = shl i64 %indvars.iv11, 3
  %sunkaddr22 = add i64 %sunkaddr, %sunkaddr21
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to double*
  %sunkaddr25 = shl i64 %indvars.iv11, 3
  %sunkaddr26 = add i64 %sunkaddr24, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  %sunkaddr29 = shl i64 %indvars.iv11, 3
  %sunkaddr30 = add i64 %sunkaddr28, %sunkaddr29
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to double*
  %sunkaddr33 = shl i64 %indvars.iv11, 3
  %sunkaddr34 = add i64 %sunkaddr32, %sunkaddr33
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to double*
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge37 ]
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %27, i64 %indvars.iv11, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = load double, double* %sunkaddr23, align 8
  %46 = fadd double %44, %45
  store double %46, double* %sunkaddr27, align 8
  %47 = getelementptr inbounds [1300 x double], [1300 x double]* %30, i64 %indvars.iv11, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %sunkaddr31, align 8
  %53 = fadd double %51, %52
  store double %53, double* %sunkaddr35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = icmp slt i64 %indvars.iv.next, %35
  br i1 %54, label %._crit_edge37, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge37
  %55 = getelementptr inbounds double, double* %20, i64 %indvars.iv11
  %56 = load double, double* %55, align 8
  %57 = fmul double %25, %56
  %58 = getelementptr inbounds double, double* %21, i64 %indvars.iv11
  %59 = load double, double* %58, align 8
  %60 = fmul double %26, %59
  %61 = fadd double %57, %60
  %62 = getelementptr inbounds double, double* %21, i64 %indvars.iv11
  store double %61, double* %62, align 8
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %63 = icmp slt i64 %indvars.iv.next12, %37
  br i1 %63, label %.lr.ph3.split.us, label %._crit_edge4.loopexit

.lr.ph3.split:                                    ; preds = %.lr.ph3.split, %.lr.ph3.split.preheader
  %indvars.iv15 = phi i64 [ %32, %.lr.ph3.split.preheader ], [ %indvars.iv.next16, %.lr.ph3.split ]
  %64 = getelementptr inbounds double, double* %20, i64 %indvars.iv15
  store double 0.000000e+00, double* %64, align 8
  %65 = getelementptr inbounds double, double* %21, i64 %indvars.iv15
  store double 0.000000e+00, double* %65, align 8
  %66 = getelementptr inbounds double, double* %20, i64 %indvars.iv15
  %67 = load double, double* %66, align 8
  %68 = fmul double %25, %67
  %69 = fadd double %68, %33
  %70 = getelementptr inbounds double, double* %21, i64 %indvars.iv15
  store double %69, double* %70, align 8
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %71 = icmp slt i64 %indvars.iv.next16, %23
  br i1 %71, label %.lr.ph3.split, label %._crit_edge4.loopexit38

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4.loopexit38:                          ; preds = %.lr.ph3.split
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit38, %._crit_edge4.loopexit
  %.lcssa6.in = phi i64 [ %indvars.iv.next12, %._crit_edge4.loopexit ], [ %indvars.iv.next16, %._crit_edge4.loopexit38 ]
  %.lcssa6 = trunc i64 %.lcssa6.in to i32
  store i32 %.lcssa6, i32* %17, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %._crit_edge4
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
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %2
  %12 = load double*, double** %4, align 8
  %13 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  %14 = sext i32 %.promoted to i64
  %15 = sext i32 %13 to i64
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ %14, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge._crit_edge
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #5
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = icmp slt i64 %indvars.iv.next, %15
  br i1 %25, label %._crit_edge._crit_edge, label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge
  %26 = trunc i64 %indvars.iv.next to i32
  store i32 %26, i32* %5, align 4
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %2, %._crit_edge2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #4
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
