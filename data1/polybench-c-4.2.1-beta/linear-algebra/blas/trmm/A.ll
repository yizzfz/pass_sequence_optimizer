; ModuleID = 'trmm.c'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
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
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca [1000 x [1000 x double]]*, align 8
  %10 = alloca [1000 x [1200 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1000, i32* %6, align 4
  store i32 1200, i32* %7, align 4
  %11 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %12 = bitcast i8* %11 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %12, [1000 x [1000 x double]]** %9, align 8
  %13 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %14 = bitcast i8* %13 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %14, [1000 x [1200 x double]]** %10, align 8
  %15 = load i32, i32* %6, align 4
  %16 = load i32, i32* %7, align 4
  %17 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %18 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %17, i32 0, i32 0
  %19 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %20 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %19, i32 0, i32 0
  call void @init_array(i32 %15, i32 %16, double* %8, [1000 x double]* %18, [1200 x double]* %20)
  call void (...) @polybench_timer_start()
  %21 = load i32, i32* %6, align 4
  %22 = load i32, i32* %7, align 4
  %23 = load double, double* %8, align 8
  %24 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %25 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %24, i32 0, i32 0
  %26 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %27 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %26, i32 0, i32 0
  call void @kernel_trmm(i32 %21, i32 %22, double %23, [1000 x double]* %25, [1200 x double]* %27)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %28 = load i32, i32* %4, align 4
  %29 = icmp sgt i32 %28, 42
  br i1 %29, label %30, label %41

; <label>:30:                                     ; preds = %2
  %31 = load i8**, i8*** %5, align 8
  %32 = getelementptr inbounds i8*, i8** %31, i64 0
  %33 = load i8*, i8** %32, align 8
  %34 = call i32 @strcmp(i8* %33, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %41, label %36

; <label>:36:                                     ; preds = %30
  %37 = load i32, i32* %6, align 4
  %38 = load i32, i32* %7, align 4
  %39 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %40 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %39, i32 0, i32 0
  call void @print_array(i32 %37, i32 %38, [1200 x double]* %40)
  br label %41

; <label>:41:                                     ; preds = %36, %30, %2
  %42 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %43 = bitcast [1000 x [1000 x double]]* %42 to i8*
  call void @free(i8* %43) #5
  %44 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %10, align 8
  %45 = bitcast [1000 x [1200 x double]]* %44 to i8*
  call void @free(i8* %45) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, [1000 x double]*, [1200 x double]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store double* %2, double** %8, align 8
  store [1000 x double]* %3, [1000 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  %13 = load double*, double** %8, align 8
  store double 1.500000e+00, double* %13, align 8
  store i32 0, i32* %11, align 4
  br label %14

; <label>:14:                                     ; preds = %78, %5
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %81

; <label>:18:                                     ; preds = %14
  store i32 0, i32* %12, align 4
  br label %19

; <label>:19:                                     ; preds = %40, %18
  %20 = load i32, i32* %12, align 4
  %21 = load i32, i32* %11, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %43

; <label>:23:                                     ; preds = %19
  %24 = load i32, i32* %11, align 4
  %25 = load i32, i32* %12, align 4
  %26 = add nsw i32 %24, %25
  %27 = load i32, i32* %6, align 4
  %28 = srem i32 %26, %27
  %29 = sitofp i32 %28 to double
  %30 = load i32, i32* %6, align 4
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %29, %31
  %33 = load [1000 x double]*, [1000 x double]** %9, align 8
  %34 = load i32, i32* %11, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %35
  %37 = load i32, i32* %12, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %36, i64 0, i64 %38
  store double %32, double* %39, align 8
  br label %40

; <label>:40:                                     ; preds = %23
  %41 = load i32, i32* %12, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %12, align 4
  br label %19

; <label>:43:                                     ; preds = %19
  %44 = load [1000 x double]*, [1000 x double]** %9, align 8
  %45 = load i32, i32* %11, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %44, i64 %46
  %48 = load i32, i32* %11, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %47, i64 0, i64 %49
  store double 1.000000e+00, double* %50, align 8
  store i32 0, i32* %12, align 4
  br label %51

; <label>:51:                                     ; preds = %74, %43
  %52 = load i32, i32* %12, align 4
  %53 = load i32, i32* %7, align 4
  %54 = icmp slt i32 %52, %53
  br i1 %54, label %55, label %77

; <label>:55:                                     ; preds = %51
  %56 = load i32, i32* %7, align 4
  %57 = load i32, i32* %11, align 4
  %58 = load i32, i32* %12, align 4
  %59 = sub nsw i32 %57, %58
  %60 = add nsw i32 %56, %59
  %61 = load i32, i32* %7, align 4
  %62 = srem i32 %60, %61
  %63 = sitofp i32 %62 to double
  %64 = load i32, i32* %7, align 4
  %65 = sitofp i32 %64 to double
  %66 = fdiv double %63, %65
  %67 = load [1200 x double]*, [1200 x double]** %10, align 8
  %68 = load i32, i32* %11, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %69
  %71 = load i32, i32* %12, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 0, i64 %72
  store double %66, double* %73, align 8
  br label %74

; <label>:74:                                     ; preds = %55
  %75 = load i32, i32* %12, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %12, align 4
  br label %51

; <label>:77:                                     ; preds = %51
  br label %78

; <label>:78:                                     ; preds = %77
  %79 = load i32, i32* %11, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %11, align 4
  br label %14

; <label>:81:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store double %2, double* %8, align 8
  store [1000 x double]* %3, [1000 x double]** %9, align 8
  store [1200 x double]* %4, [1200 x double]** %10, align 8
  store i32 0, i32* %11, align 4
  br label %14

; <label>:14:                                     ; preds = %82, %5
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %85

; <label>:18:                                     ; preds = %14
  store i32 0, i32* %12, align 4
  br label %19

; <label>:19:                                     ; preds = %78, %18
  %20 = load i32, i32* %12, align 4
  %21 = load i32, i32* %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %81

; <label>:23:                                     ; preds = %19
  %24 = load i32, i32* %11, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %13, align 4
  br label %26

; <label>:26:                                     ; preds = %57, %23
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %6, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %60

; <label>:30:                                     ; preds = %26
  %31 = load [1000 x double]*, [1000 x double]** %9, align 8
  %32 = load i32, i32* %13, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %31, i64 %33
  %35 = load i32, i32* %11, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 0, i64 %36
  %38 = load double, double* %37, align 8
  %39 = load [1200 x double]*, [1200 x double]** %10, align 8
  %40 = load i32, i32* %13, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %39, i64 %41
  %43 = load i32, i32* %12, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %42, i64 0, i64 %44
  %46 = load double, double* %45, align 8
  %47 = fmul double %38, %46
  %48 = load [1200 x double]*, [1200 x double]** %10, align 8
  %49 = load i32, i32* %11, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %50
  %52 = load i32, i32* %12, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %51, i64 0, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %47
  store double %56, double* %54, align 8
  br label %57

; <label>:57:                                     ; preds = %30
  %58 = load i32, i32* %13, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %13, align 4
  br label %26

; <label>:60:                                     ; preds = %26
  %61 = load double, double* %8, align 8
  %62 = load [1200 x double]*, [1200 x double]** %10, align 8
  %63 = load i32, i32* %11, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %62, i64 %64
  %66 = load i32, i32* %12, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 0, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fmul double %61, %69
  %71 = load [1200 x double]*, [1200 x double]** %10, align 8
  %72 = load i32, i32* %11, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %73
  %75 = load i32, i32* %12, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 0, i64 %76
  store double %70, double* %77, align 8
  br label %78

; <label>:78:                                     ; preds = %60
  %79 = load i32, i32* %12, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %12, align 4
  br label %19

; <label>:81:                                     ; preds = %19
  br label %82

; <label>:82:                                     ; preds = %81
  %83 = load i32, i32* %11, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %11, align 4
  br label %14

; <label>:85:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %13

; <label>:13:                                     ; preds = %48, %3
  %14 = load i32, i32* %7, align 4
  %15 = load i32, i32* %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %51

; <label>:17:                                     ; preds = %13
  store i32 0, i32* %8, align 4
  br label %18

; <label>:18:                                     ; preds = %44, %17
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %47

; <label>:22:                                     ; preds = %18
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %4, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32, i32* %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %33

; <label>:30:                                     ; preds = %22
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %33

; <label>:33:                                     ; preds = %30, %22
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = load [1200 x double]*, [1200 x double]** %6, align 8
  %36 = load i32, i32* %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %35, i64 %37
  %39 = load i32, i32* %8, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %38, i64 0, i64 %40
  %42 = load double, double* %41, align 8
  %43 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %42)
  br label %44

; <label>:44:                                     ; preds = %33
  %45 = load i32, i32* %8, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %8, align 4
  br label %18

; <label>:47:                                     ; preds = %18
  br label %48

; <label>:48:                                     ; preds = %47
  %49 = load i32, i32* %7, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %7, align 4
  br label %13

; <label>:51:                                     ; preds = %13
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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
