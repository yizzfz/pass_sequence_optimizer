; ModuleID = 'gemver.c'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca [2000 x [2000 x double]]*, align 8
  %10 = alloca [2000 x double]*, align 8
  %11 = alloca [2000 x double]*, align 8
  %12 = alloca [2000 x double]*, align 8
  %13 = alloca [2000 x double]*, align 8
  %14 = alloca [2000 x double]*, align 8
  %15 = alloca [2000 x double]*, align 8
  %16 = alloca [2000 x double]*, align 8
  %17 = alloca [2000 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 2000, i32* %6, align 4
  %18 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %19, [2000 x [2000 x double]]** %9, align 8
  %20 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %21 = bitcast i8* %20 to [2000 x double]*
  store [2000 x double]* %21, [2000 x double]** %10, align 8
  %22 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %23 = bitcast i8* %22 to [2000 x double]*
  store [2000 x double]* %23, [2000 x double]** %11, align 8
  %24 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %25 = bitcast i8* %24 to [2000 x double]*
  store [2000 x double]* %25, [2000 x double]** %12, align 8
  %26 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %27 = bitcast i8* %26 to [2000 x double]*
  store [2000 x double]* %27, [2000 x double]** %13, align 8
  %28 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %29 = bitcast i8* %28 to [2000 x double]*
  store [2000 x double]* %29, [2000 x double]** %14, align 8
  %30 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %31 = bitcast i8* %30 to [2000 x double]*
  store [2000 x double]* %31, [2000 x double]** %15, align 8
  %32 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %33 = bitcast i8* %32 to [2000 x double]*
  store [2000 x double]* %33, [2000 x double]** %16, align 8
  %34 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %35 = bitcast i8* %34 to [2000 x double]*
  store [2000 x double]* %35, [2000 x double]** %17, align 8
  %36 = load i32, i32* %6, align 4
  %37 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %9, align 8
  %38 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i32 0, i32 0
  %39 = load [2000 x double]*, [2000 x double]** %10, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %39, i32 0, i32 0
  %41 = load [2000 x double]*, [2000 x double]** %11, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i32 0, i32 0
  %43 = load [2000 x double]*, [2000 x double]** %12, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i32 0, i32 0
  %45 = load [2000 x double]*, [2000 x double]** %13, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %45, i32 0, i32 0
  %47 = load [2000 x double]*, [2000 x double]** %14, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i32 0, i32 0
  %49 = load [2000 x double]*, [2000 x double]** %15, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i32 0, i32 0
  %51 = load [2000 x double]*, [2000 x double]** %16, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %51, i32 0, i32 0
  %53 = load [2000 x double]*, [2000 x double]** %17, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %53, i32 0, i32 0
  call void @init_array(i32 %36, double* %7, double* %8, [2000 x double]* %38, double* %40, double* %42, double* %44, double* %46, double* %48, double* %50, double* %52, double* %54)
  call void (...) @polybench_timer_start()
  %55 = load i32, i32* %6, align 4
  %56 = load double, double* %7, align 8
  %57 = load double, double* %8, align 8
  %58 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %9, align 8
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i32 0, i32 0
  %60 = load [2000 x double]*, [2000 x double]** %10, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i32 0, i32 0
  %62 = load [2000 x double]*, [2000 x double]** %11, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %62, i32 0, i32 0
  %64 = load [2000 x double]*, [2000 x double]** %12, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %64, i32 0, i32 0
  %66 = load [2000 x double]*, [2000 x double]** %13, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i32 0, i32 0
  %68 = load [2000 x double]*, [2000 x double]** %14, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i32 0, i32 0
  %70 = load [2000 x double]*, [2000 x double]** %15, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %70, i32 0, i32 0
  %72 = load [2000 x double]*, [2000 x double]** %16, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i32 0, i32 0
  %74 = load [2000 x double]*, [2000 x double]** %17, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i32 0, i32 0
  call void @kernel_gemver(i32 %55, double %56, double %57, [2000 x double]* %59, double* %61, double* %63, double* %65, double* %67, double* %69, double* %71, double* %73, double* %75)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %76 = load i32, i32* %4, align 4
  %77 = icmp sgt i32 %76, 42
  br i1 %77, label %78, label %88

; <label>:78:                                     ; preds = %2
  %79 = load i8**, i8*** %5, align 8
  %80 = getelementptr inbounds i8*, i8** %79, i64 0
  %81 = load i8*, i8** %80, align 8
  %82 = call i32 @strcmp(i8* %81, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %88, label %84

; <label>:84:                                     ; preds = %78
  %85 = load i32, i32* %6, align 4
  %86 = load [2000 x double]*, [2000 x double]** %14, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %86, i32 0, i32 0
  call void @print_array(i32 %85, double* %87)
  br label %88

; <label>:88:                                     ; preds = %84, %78, %2
  %89 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %9, align 8
  %90 = bitcast [2000 x [2000 x double]]* %89 to i8*
  call void @free(i8* %90) #5
  %91 = load [2000 x double]*, [2000 x double]** %10, align 8
  %92 = bitcast [2000 x double]* %91 to i8*
  call void @free(i8* %92) #5
  %93 = load [2000 x double]*, [2000 x double]** %11, align 8
  %94 = bitcast [2000 x double]* %93 to i8*
  call void @free(i8* %94) #5
  %95 = load [2000 x double]*, [2000 x double]** %12, align 8
  %96 = bitcast [2000 x double]* %95 to i8*
  call void @free(i8* %96) #5
  %97 = load [2000 x double]*, [2000 x double]** %13, align 8
  %98 = bitcast [2000 x double]* %97 to i8*
  call void @free(i8* %98) #5
  %99 = load [2000 x double]*, [2000 x double]** %14, align 8
  %100 = bitcast [2000 x double]* %99 to i8*
  call void @free(i8* %100) #5
  %101 = load [2000 x double]*, [2000 x double]** %15, align 8
  %102 = bitcast [2000 x double]* %101 to i8*
  call void @free(i8* %102) #5
  %103 = load [2000 x double]*, [2000 x double]** %16, align 8
  %104 = bitcast [2000 x double]* %103 to i8*
  call void @free(i8* %104) #5
  %105 = load [2000 x double]*, [2000 x double]** %17, align 8
  %106 = bitcast [2000 x double]* %105 to i8*
  call void @free(i8* %106) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, double*, double*, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) #0 {
  %13 = alloca i32, align 4
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca [2000 x double]*, align 8
  %17 = alloca double*, align 8
  %18 = alloca double*, align 8
  %19 = alloca double*, align 8
  %20 = alloca double*, align 8
  %21 = alloca double*, align 8
  %22 = alloca double*, align 8
  %23 = alloca double*, align 8
  %24 = alloca double*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca double, align 8
  store i32 %0, i32* %13, align 4
  store double* %1, double** %14, align 8
  store double* %2, double** %15, align 8
  store [2000 x double]* %3, [2000 x double]** %16, align 8
  store double* %4, double** %17, align 8
  store double* %5, double** %18, align 8
  store double* %6, double** %19, align 8
  store double* %7, double** %20, align 8
  store double* %8, double** %21, align 8
  store double* %9, double** %22, align 8
  store double* %10, double** %23, align 8
  store double* %11, double** %24, align 8
  %28 = load double*, double** %14, align 8
  store double 1.500000e+00, double* %28, align 8
  %29 = load double*, double** %15, align 8
  store double 1.200000e+00, double* %29, align 8
  %30 = load i32, i32* %13, align 4
  %31 = sitofp i32 %30 to double
  store double %31, double* %27, align 8
  store i32 0, i32* %25, align 4
  br label %32

; <label>:32:                                     ; preds = %126, %12
  %33 = load i32, i32* %25, align 4
  %34 = load i32, i32* %13, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %129

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* %25, align 4
  %38 = sitofp i32 %37 to double
  %39 = load double*, double** %17, align 8
  %40 = load i32, i32* %25, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double* %39, i64 %41
  store double %38, double* %42, align 8
  %43 = load i32, i32* %25, align 4
  %44 = add nsw i32 %43, 1
  %45 = sitofp i32 %44 to double
  %46 = load double, double* %27, align 8
  %47 = fdiv double %45, %46
  %48 = fdiv double %47, 2.000000e+00
  %49 = load double*, double** %19, align 8
  %50 = load i32, i32* %25, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double* %49, i64 %51
  store double %48, double* %52, align 8
  %53 = load i32, i32* %25, align 4
  %54 = add nsw i32 %53, 1
  %55 = sitofp i32 %54 to double
  %56 = load double, double* %27, align 8
  %57 = fdiv double %55, %56
  %58 = fdiv double %57, 4.000000e+00
  %59 = load double*, double** %18, align 8
  %60 = load i32, i32* %25, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double* %59, i64 %61
  store double %58, double* %62, align 8
  %63 = load i32, i32* %25, align 4
  %64 = add nsw i32 %63, 1
  %65 = sitofp i32 %64 to double
  %66 = load double, double* %27, align 8
  %67 = fdiv double %65, %66
  %68 = fdiv double %67, 6.000000e+00
  %69 = load double*, double** %20, align 8
  %70 = load i32, i32* %25, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double* %69, i64 %71
  store double %68, double* %72, align 8
  %73 = load i32, i32* %25, align 4
  %74 = add nsw i32 %73, 1
  %75 = sitofp i32 %74 to double
  %76 = load double, double* %27, align 8
  %77 = fdiv double %75, %76
  %78 = fdiv double %77, 8.000000e+00
  %79 = load double*, double** %23, align 8
  %80 = load i32, i32* %25, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double* %79, i64 %81
  store double %78, double* %82, align 8
  %83 = load i32, i32* %25, align 4
  %84 = add nsw i32 %83, 1
  %85 = sitofp i32 %84 to double
  %86 = load double, double* %27, align 8
  %87 = fdiv double %85, %86
  %88 = fdiv double %87, 9.000000e+00
  %89 = load double*, double** %24, align 8
  %90 = load i32, i32* %25, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double* %89, i64 %91
  store double %88, double* %92, align 8
  %93 = load double*, double** %22, align 8
  %94 = load i32, i32* %25, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double* %93, i64 %95
  store double 0.000000e+00, double* %96, align 8
  %97 = load double*, double** %21, align 8
  %98 = load i32, i32* %25, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double* %97, i64 %99
  store double 0.000000e+00, double* %100, align 8
  store i32 0, i32* %26, align 4
  br label %101

; <label>:101:                                    ; preds = %122, %36
  %102 = load i32, i32* %26, align 4
  %103 = load i32, i32* %13, align 4
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %105, label %125

; <label>:105:                                    ; preds = %101
  %106 = load i32, i32* %25, align 4
  %107 = load i32, i32* %26, align 4
  %108 = mul nsw i32 %106, %107
  %109 = load i32, i32* %13, align 4
  %110 = srem i32 %108, %109
  %111 = sitofp i32 %110 to double
  %112 = load i32, i32* %13, align 4
  %113 = sitofp i32 %112 to double
  %114 = fdiv double %111, %113
  %115 = load [2000 x double]*, [2000 x double]** %16, align 8
  %116 = load i32, i32* %25, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %115, i64 %117
  %119 = load i32, i32* %26, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %118, i64 0, i64 %120
  store double %114, double* %121, align 8
  br label %122

; <label>:122:                                    ; preds = %105
  %123 = load i32, i32* %26, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, i32* %26, align 4
  br label %101

; <label>:125:                                    ; preds = %101
  br label %126

; <label>:126:                                    ; preds = %125
  %127 = load i32, i32* %25, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %25, align 4
  br label %32

; <label>:129:                                    ; preds = %32
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gemver(i32, double, double, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) #0 {
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca [2000 x double]*, align 8
  %17 = alloca double*, align 8
  %18 = alloca double*, align 8
  %19 = alloca double*, align 8
  %20 = alloca double*, align 8
  %21 = alloca double*, align 8
  %22 = alloca double*, align 8
  %23 = alloca double*, align 8
  %24 = alloca double*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  store i32 %0, i32* %13, align 4
  store double %1, double* %14, align 8
  store double %2, double* %15, align 8
  store [2000 x double]* %3, [2000 x double]** %16, align 8
  store double* %4, double** %17, align 8
  store double* %5, double** %18, align 8
  store double* %6, double** %19, align 8
  store double* %7, double** %20, align 8
  store double* %8, double** %21, align 8
  store double* %9, double** %22, align 8
  store double* %10, double** %23, align 8
  store double* %11, double** %24, align 8
  store i32 0, i32* %25, align 4
  br label %27

; <label>:27:                                     ; preds = %80, %12
  %28 = load i32, i32* %25, align 4
  %29 = load i32, i32* %13, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %83

; <label>:31:                                     ; preds = %27
  store i32 0, i32* %26, align 4
  br label %32

; <label>:32:                                     ; preds = %76, %31
  %33 = load i32, i32* %26, align 4
  %34 = load i32, i32* %13, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %79

; <label>:36:                                     ; preds = %32
  %37 = load [2000 x double]*, [2000 x double]** %16, align 8
  %38 = load i32, i32* %25, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %37, i64 %39
  %41 = load i32, i32* %26, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = load double*, double** %17, align 8
  %46 = load i32, i32* %25, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %45, i64 %47
  %49 = load double, double* %48, align 8
  %50 = load double*, double** %18, align 8
  %51 = load i32, i32* %26, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double* %50, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fmul double %49, %54
  %56 = fadd double %44, %55
  %57 = load double*, double** %19, align 8
  %58 = load i32, i32* %25, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double* %57, i64 %59
  %61 = load double, double* %60, align 8
  %62 = load double*, double** %20, align 8
  %63 = load i32, i32* %26, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double* %62, i64 %64
  %66 = load double, double* %65, align 8
  %67 = fmul double %61, %66
  %68 = fadd double %56, %67
  %69 = load [2000 x double]*, [2000 x double]** %16, align 8
  %70 = load i32, i32* %25, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %69, i64 %71
  %73 = load i32, i32* %26, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 0, i64 %74
  store double %68, double* %75, align 8
  br label %76

; <label>:76:                                     ; preds = %36
  %77 = load i32, i32* %26, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %26, align 4
  br label %32

; <label>:79:                                     ; preds = %32
  br label %80

; <label>:80:                                     ; preds = %79
  %81 = load i32, i32* %25, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %25, align 4
  br label %27

; <label>:83:                                     ; preds = %27
  store i32 0, i32* %25, align 4
  br label %84

; <label>:84:                                     ; preds = %124, %83
  %85 = load i32, i32* %25, align 4
  %86 = load i32, i32* %13, align 4
  %87 = icmp slt i32 %85, %86
  br i1 %87, label %88, label %127

; <label>:88:                                     ; preds = %84
  store i32 0, i32* %26, align 4
  br label %89

; <label>:89:                                     ; preds = %120, %88
  %90 = load i32, i32* %26, align 4
  %91 = load i32, i32* %13, align 4
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %93, label %123

; <label>:93:                                     ; preds = %89
  %94 = load double*, double** %22, align 8
  %95 = load i32, i32* %25, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, double* %94, i64 %96
  %98 = load double, double* %97, align 8
  %99 = load double, double* %15, align 8
  %100 = load [2000 x double]*, [2000 x double]** %16, align 8
  %101 = load i32, i32* %26, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %100, i64 %102
  %104 = load i32, i32* %25, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %103, i64 0, i64 %105
  %107 = load double, double* %106, align 8
  %108 = fmul double %99, %107
  %109 = load double*, double** %23, align 8
  %110 = load i32, i32* %26, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, double* %109, i64 %111
  %113 = load double, double* %112, align 8
  %114 = fmul double %108, %113
  %115 = fadd double %98, %114
  %116 = load double*, double** %22, align 8
  %117 = load i32, i32* %25, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double* %116, i64 %118
  store double %115, double* %119, align 8
  br label %120

; <label>:120:                                    ; preds = %93
  %121 = load i32, i32* %26, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %26, align 4
  br label %89

; <label>:123:                                    ; preds = %89
  br label %124

; <label>:124:                                    ; preds = %123
  %125 = load i32, i32* %25, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %25, align 4
  br label %84

; <label>:127:                                    ; preds = %84
  store i32 0, i32* %25, align 4
  br label %128

; <label>:128:                                    ; preds = %148, %127
  %129 = load i32, i32* %25, align 4
  %130 = load i32, i32* %13, align 4
  %131 = icmp slt i32 %129, %130
  br i1 %131, label %132, label %151

; <label>:132:                                    ; preds = %128
  %133 = load double*, double** %22, align 8
  %134 = load i32, i32* %25, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds double, double* %133, i64 %135
  %137 = load double, double* %136, align 8
  %138 = load double*, double** %24, align 8
  %139 = load i32, i32* %25, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double* %138, i64 %140
  %142 = load double, double* %141, align 8
  %143 = fadd double %137, %142
  %144 = load double*, double** %22, align 8
  %145 = load i32, i32* %25, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double* %144, i64 %146
  store double %143, double* %147, align 8
  br label %148

; <label>:148:                                    ; preds = %132
  %149 = load i32, i32* %25, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %25, align 4
  br label %128

; <label>:151:                                    ; preds = %128
  store i32 0, i32* %25, align 4
  br label %152

; <label>:152:                                    ; preds = %192, %151
  %153 = load i32, i32* %25, align 4
  %154 = load i32, i32* %13, align 4
  %155 = icmp slt i32 %153, %154
  br i1 %155, label %156, label %195

; <label>:156:                                    ; preds = %152
  store i32 0, i32* %26, align 4
  br label %157

; <label>:157:                                    ; preds = %188, %156
  %158 = load i32, i32* %26, align 4
  %159 = load i32, i32* %13, align 4
  %160 = icmp slt i32 %158, %159
  br i1 %160, label %161, label %191

; <label>:161:                                    ; preds = %157
  %162 = load double*, double** %21, align 8
  %163 = load i32, i32* %25, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds double, double* %162, i64 %164
  %166 = load double, double* %165, align 8
  %167 = load double, double* %14, align 8
  %168 = load [2000 x double]*, [2000 x double]** %16, align 8
  %169 = load i32, i32* %25, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [2000 x double], [2000 x double]* %168, i64 %170
  %172 = load i32, i32* %26, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [2000 x double], [2000 x double]* %171, i64 0, i64 %173
  %175 = load double, double* %174, align 8
  %176 = fmul double %167, %175
  %177 = load double*, double** %22, align 8
  %178 = load i32, i32* %26, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds double, double* %177, i64 %179
  %181 = load double, double* %180, align 8
  %182 = fmul double %176, %181
  %183 = fadd double %166, %182
  %184 = load double*, double** %21, align 8
  %185 = load i32, i32* %25, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds double, double* %184, i64 %186
  store double %183, double* %187, align 8
  br label %188

; <label>:188:                                    ; preds = %161
  %189 = load i32, i32* %26, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %26, align 4
  br label %157

; <label>:191:                                    ; preds = %157
  br label %192

; <label>:192:                                    ; preds = %191
  %193 = load i32, i32* %25, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %25, align 4
  br label %152

; <label>:195:                                    ; preds = %152
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store double* %1, double** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %10

; <label>:10:                                     ; preds = %29, %2
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %32

; <label>:14:                                     ; preds = %10
  %15 = load i32, i32* %5, align 4
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %14
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %21

; <label>:21:                                     ; preds = %18, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = load double*, double** %4, align 8
  %24 = load i32, i32* %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double* %23, i64 %25
  %27 = load double, double* %26, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %27)
  br label %29

; <label>:29:                                     ; preds = %21
  %30 = load i32, i32* %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %5, align 4
  br label %10

; <label>:32:                                     ; preds = %10
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
