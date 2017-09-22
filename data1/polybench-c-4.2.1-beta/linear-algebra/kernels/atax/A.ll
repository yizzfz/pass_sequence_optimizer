; ModuleID = 'atax.c'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
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
  %8 = alloca [1900 x [2100 x double]]*, align 8
  %9 = alloca [2100 x double]*, align 8
  %10 = alloca [2100 x double]*, align 8
  %11 = alloca [1900 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1900, i32* %6, align 4
  store i32 2100, i32* %7, align 4
  %12 = call i8* @polybench_alloc_data(i64 3990000, i32 8)
  %13 = bitcast i8* %12 to [1900 x [2100 x double]]*
  store [1900 x [2100 x double]]* %13, [1900 x [2100 x double]]** %8, align 8
  %14 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %15 = bitcast i8* %14 to [2100 x double]*
  store [2100 x double]* %15, [2100 x double]** %9, align 8
  %16 = call i8* @polybench_alloc_data(i64 2100, i32 8)
  %17 = bitcast i8* %16 to [2100 x double]*
  store [2100 x double]* %17, [2100 x double]** %10, align 8
  %18 = call i8* @polybench_alloc_data(i64 1900, i32 8)
  %19 = bitcast i8* %18 to [1900 x double]*
  store [1900 x double]* %19, [1900 x double]** %11, align 8
  %20 = load i32, i32* %6, align 4
  %21 = load i32, i32* %7, align 4
  %22 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %8, align 8
  %23 = getelementptr inbounds [1900 x [2100 x double]], [1900 x [2100 x double]]* %22, i32 0, i32 0
  %24 = load [2100 x double]*, [2100 x double]** %9, align 8
  %25 = getelementptr inbounds [2100 x double], [2100 x double]* %24, i32 0, i32 0
  call void @init_array(i32 %20, i32 %21, [2100 x double]* %23, double* %25)
  call void (...) @polybench_timer_start()
  %26 = load i32, i32* %6, align 4
  %27 = load i32, i32* %7, align 4
  %28 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %8, align 8
  %29 = getelementptr inbounds [1900 x [2100 x double]], [1900 x [2100 x double]]* %28, i32 0, i32 0
  %30 = load [2100 x double]*, [2100 x double]** %9, align 8
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i32 0, i32 0
  %32 = load [2100 x double]*, [2100 x double]** %10, align 8
  %33 = getelementptr inbounds [2100 x double], [2100 x double]* %32, i32 0, i32 0
  %34 = load [1900 x double]*, [1900 x double]** %11, align 8
  %35 = getelementptr inbounds [1900 x double], [1900 x double]* %34, i32 0, i32 0
  call void @kernel_atax(i32 %26, i32 %27, [2100 x double]* %29, double* %31, double* %33, double* %35)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %36 = load i32, i32* %4, align 4
  %37 = icmp sgt i32 %36, 42
  br i1 %37, label %38, label %48

; <label>:38:                                     ; preds = %2
  %39 = load i8**, i8*** %5, align 8
  %40 = getelementptr inbounds i8*, i8** %39, i64 0
  %41 = load i8*, i8** %40, align 8
  %42 = call i32 @strcmp(i8* %41, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %48, label %44

; <label>:44:                                     ; preds = %38
  %45 = load i32, i32* %7, align 4
  %46 = load [2100 x double]*, [2100 x double]** %10, align 8
  %47 = getelementptr inbounds [2100 x double], [2100 x double]* %46, i32 0, i32 0
  call void @print_array(i32 %45, double* %47)
  br label %48

; <label>:48:                                     ; preds = %44, %38, %2
  %49 = load [1900 x [2100 x double]]*, [1900 x [2100 x double]]** %8, align 8
  %50 = bitcast [1900 x [2100 x double]]* %49 to i8*
  call void @free(i8* %50) #5
  %51 = load [2100 x double]*, [2100 x double]** %9, align 8
  %52 = bitcast [2100 x double]* %51 to i8*
  call void @free(i8* %52) #5
  %53 = load [2100 x double]*, [2100 x double]** %10, align 8
  %54 = bitcast [2100 x double]* %53 to i8*
  call void @free(i8* %54) #5
  %55 = load [1900 x double]*, [1900 x double]** %11, align 8
  %56 = bitcast [1900 x double]* %55 to i8*
  call void @free(i8* %56) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, [2100 x double]*, double*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [2100 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [2100 x double]* %2, [2100 x double]** %7, align 8
  store double* %3, double** %8, align 8
  %12 = load i32, i32* %6, align 4
  %13 = sitofp i32 %12 to double
  store double %13, double* %11, align 8
  store i32 0, i32* %9, align 4
  br label %14

; <label>:14:                                     ; preds = %28, %4
  %15 = load i32, i32* %9, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %31

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %9, align 4
  %20 = sitofp i32 %19 to double
  %21 = load double, double* %11, align 8
  %22 = fdiv double %20, %21
  %23 = fadd double 1.000000e+00, %22
  %24 = load double*, double** %8, align 8
  %25 = load i32, i32* %9, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  store double %23, double* %27, align 8
  br label %28

; <label>:28:                                     ; preds = %18
  %29 = load i32, i32* %9, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %9, align 4
  br label %14

; <label>:31:                                     ; preds = %14
  store i32 0, i32* %9, align 4
  br label %32

; <label>:32:                                     ; preds = %63, %31
  %33 = load i32, i32* %9, align 4
  %34 = load i32, i32* %5, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %66

; <label>:36:                                     ; preds = %32
  store i32 0, i32* %10, align 4
  br label %37

; <label>:37:                                     ; preds = %59, %36
  %38 = load i32, i32* %10, align 4
  %39 = load i32, i32* %6, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %62

; <label>:41:                                     ; preds = %37
  %42 = load i32, i32* %9, align 4
  %43 = load i32, i32* %10, align 4
  %44 = add nsw i32 %42, %43
  %45 = load i32, i32* %6, align 4
  %46 = srem i32 %44, %45
  %47 = sitofp i32 %46 to double
  %48 = load i32, i32* %5, align 4
  %49 = mul nsw i32 5, %48
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %47, %50
  %52 = load [2100 x double]*, [2100 x double]** %7, align 8
  %53 = load i32, i32* %9, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [2100 x double], [2100 x double]* %52, i64 %54
  %56 = load i32, i32* %10, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [2100 x double], [2100 x double]* %55, i64 0, i64 %57
  store double %51, double* %58, align 8
  br label %59

; <label>:59:                                     ; preds = %41
  %60 = load i32, i32* %10, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %10, align 4
  br label %37

; <label>:62:                                     ; preds = %37
  br label %63

; <label>:63:                                     ; preds = %62
  %64 = load i32, i32* %9, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %9, align 4
  br label %32

; <label>:66:                                     ; preds = %32
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [2100 x double]*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [2100 x double]* %2, [2100 x double]** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store double* %5, double** %12, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %24, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %8, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %15
  %20 = load double*, double** %11, align 8
  %21 = load i32, i32* %13, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double* %20, i64 %22
  store double 0.000000e+00, double* %23, align 8
  br label %24

; <label>:24:                                     ; preds = %19
  %25 = load i32, i32* %13, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %13, align 4
  br label %15

; <label>:27:                                     ; preds = %15
  store i32 0, i32* %13, align 4
  br label %28

; <label>:28:                                     ; preds = %103, %27
  %29 = load i32, i32* %13, align 4
  %30 = load i32, i32* %7, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %106

; <label>:32:                                     ; preds = %28
  %33 = load double*, double** %12, align 8
  %34 = load i32, i32* %13, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double* %33, i64 %35
  store double 0.000000e+00, double* %36, align 8
  store i32 0, i32* %14, align 4
  br label %37

; <label>:37:                                     ; preds = %66, %32
  %38 = load i32, i32* %14, align 4
  %39 = load i32, i32* %8, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %69

; <label>:41:                                     ; preds = %37
  %42 = load double*, double** %12, align 8
  %43 = load i32, i32* %13, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double* %42, i64 %44
  %46 = load double, double* %45, align 8
  %47 = load [2100 x double]*, [2100 x double]** %9, align 8
  %48 = load i32, i32* %13, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [2100 x double], [2100 x double]* %47, i64 %49
  %51 = load i32, i32* %14, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [2100 x double], [2100 x double]* %50, i64 0, i64 %52
  %54 = load double, double* %53, align 8
  %55 = load double*, double** %10, align 8
  %56 = load i32, i32* %14, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double* %55, i64 %57
  %59 = load double, double* %58, align 8
  %60 = fmul double %54, %59
  %61 = fadd double %46, %60
  %62 = load double*, double** %12, align 8
  %63 = load i32, i32* %13, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double* %62, i64 %64
  store double %61, double* %65, align 8
  br label %66

; <label>:66:                                     ; preds = %41
  %67 = load i32, i32* %14, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %14, align 4
  br label %37

; <label>:69:                                     ; preds = %37
  store i32 0, i32* %14, align 4
  br label %70

; <label>:70:                                     ; preds = %99, %69
  %71 = load i32, i32* %14, align 4
  %72 = load i32, i32* %8, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %102

; <label>:74:                                     ; preds = %70
  %75 = load double*, double** %11, align 8
  %76 = load i32, i32* %14, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double* %75, i64 %77
  %79 = load double, double* %78, align 8
  %80 = load [2100 x double]*, [2100 x double]** %9, align 8
  %81 = load i32, i32* %13, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [2100 x double], [2100 x double]* %80, i64 %82
  %84 = load i32, i32* %14, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [2100 x double], [2100 x double]* %83, i64 0, i64 %85
  %87 = load double, double* %86, align 8
  %88 = load double*, double** %12, align 8
  %89 = load i32, i32* %13, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double* %88, i64 %90
  %92 = load double, double* %91, align 8
  %93 = fmul double %87, %92
  %94 = fadd double %79, %93
  %95 = load double*, double** %11, align 8
  %96 = load i32, i32* %14, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double* %95, i64 %97
  store double %94, double* %98, align 8
  br label %99

; <label>:99:                                     ; preds = %74
  %100 = load i32, i32* %14, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %14, align 4
  br label %70

; <label>:102:                                    ; preds = %70
  br label %103

; <label>:103:                                    ; preds = %102
  %104 = load i32, i32* %13, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %13, align 4
  br label %28

; <label>:106:                                    ; preds = %28
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
