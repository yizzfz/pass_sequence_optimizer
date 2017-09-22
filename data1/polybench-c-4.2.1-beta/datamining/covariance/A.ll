; ModuleID = 'covariance.c'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
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
  %9 = alloca [1400 x [1200 x double]]*, align 8
  %10 = alloca [1200 x [1200 x double]]*, align 8
  %11 = alloca [1200 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1400, i32* %6, align 4
  store i32 1200, i32* %7, align 4
  %12 = call i8* @polybench_alloc_data(i64 1680000, i32 8)
  %13 = bitcast i8* %12 to [1400 x [1200 x double]]*
  store [1400 x [1200 x double]]* %13, [1400 x [1200 x double]]** %9, align 8
  %14 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %15 = bitcast i8* %14 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %15, [1200 x [1200 x double]]** %10, align 8
  %16 = call i8* @polybench_alloc_data(i64 1200, i32 8)
  %17 = bitcast i8* %16 to [1200 x double]*
  store [1200 x double]* %17, [1200 x double]** %11, align 8
  %18 = load i32, i32* %7, align 4
  %19 = load i32, i32* %6, align 4
  %20 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %21 = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %20, i32 0, i32 0
  call void @init_array(i32 %18, i32 %19, double* %8, [1200 x double]* %21)
  call void (...) @polybench_timer_start()
  %22 = load i32, i32* %7, align 4
  %23 = load i32, i32* %6, align 4
  %24 = load double, double* %8, align 8
  %25 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %26 = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %25, i32 0, i32 0
  %27 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %28 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %27, i32 0, i32 0
  %29 = load [1200 x double]*, [1200 x double]** %11, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %29, i32 0, i32 0
  call void @kernel_covariance(i32 %22, i32 %23, double %24, [1200 x double]* %26, [1200 x double]* %28, double* %30)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %31 = load i32, i32* %4, align 4
  %32 = icmp sgt i32 %31, 42
  br i1 %32, label %33, label %43

; <label>:33:                                     ; preds = %2
  %34 = load i8**, i8*** %5, align 8
  %35 = getelementptr inbounds i8*, i8** %34, i64 0
  %36 = load i8*, i8** %35, align 8
  %37 = call i32 @strcmp(i8* %36, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %43, label %39

; <label>:39:                                     ; preds = %33
  %40 = load i32, i32* %7, align 4
  %41 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %42 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %41, i32 0, i32 0
  call void @print_array(i32 %40, [1200 x double]* %42)
  br label %43

; <label>:43:                                     ; preds = %39, %33, %2
  %44 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %45 = bitcast [1400 x [1200 x double]]* %44 to i8*
  call void @free(i8* %45) #5
  %46 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %47 = bitcast [1200 x [1200 x double]]* %46 to i8*
  call void @free(i8* %47) #5
  %48 = load [1200 x double]*, [1200 x double]** %11, align 8
  %49 = bitcast [1200 x double]* %48 to i8*
  call void @free(i8* %49) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, [1200 x double]*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double*, align 8
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store double* %2, double** %7, align 8
  store [1200 x double]* %3, [1200 x double]** %8, align 8
  %11 = load i32, i32* %6, align 4
  %12 = sitofp i32 %11 to double
  %13 = load double*, double** %7, align 8
  store double %12, double* %13, align 8
  store i32 0, i32* %9, align 4
  br label %14

; <label>:14:                                     ; preds = %39, %4
  %15 = load i32, i32* %9, align 4
  %16 = icmp slt i32 %15, 1400
  br i1 %16, label %17, label %42

; <label>:17:                                     ; preds = %14
  store i32 0, i32* %10, align 4
  br label %18

; <label>:18:                                     ; preds = %35, %17
  %19 = load i32, i32* %10, align 4
  %20 = icmp slt i32 %19, 1200
  br i1 %20, label %21, label %38

; <label>:21:                                     ; preds = %18
  %22 = load i32, i32* %9, align 4
  %23 = sitofp i32 %22 to double
  %24 = load i32, i32* %10, align 4
  %25 = sitofp i32 %24 to double
  %26 = fmul double %23, %25
  %27 = fdiv double %26, 1.200000e+03
  %28 = load [1200 x double]*, [1200 x double]** %8, align 8
  %29 = load i32, i32* %9, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %28, i64 %30
  %32 = load i32, i32* %10, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 0, i64 %33
  store double %27, double* %34, align 8
  br label %35

; <label>:35:                                     ; preds = %21
  %36 = load i32, i32* %10, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %10, align 4
  br label %18

; <label>:38:                                     ; preds = %18
  br label %39

; <label>:39:                                     ; preds = %38
  %40 = load i32, i32* %9, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %9, align 4
  br label %14

; <label>:42:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca [1200 x double]*, align 8
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store double %2, double* %9, align 8
  store [1200 x double]* %3, [1200 x double]** %10, align 8
  store [1200 x double]* %4, [1200 x double]** %11, align 8
  store double* %5, double** %12, align 8
  store i32 0, i32* %14, align 4
  br label %16

; <label>:16:                                     ; preds = %55, %6
  %17 = load i32, i32* %14, align 4
  %18 = load i32, i32* %7, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %58

; <label>:20:                                     ; preds = %16
  %21 = load double*, double** %12, align 8
  %22 = load i32, i32* %14, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, double* %21, i64 %23
  store double 0.000000e+00, double* %24, align 8
  store i32 0, i32* %13, align 4
  br label %25

; <label>:25:                                     ; preds = %44, %20
  %26 = load i32, i32* %13, align 4
  %27 = load i32, i32* %8, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %47

; <label>:29:                                     ; preds = %25
  %30 = load [1200 x double]*, [1200 x double]** %10, align 8
  %31 = load i32, i32* %13, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %30, i64 %32
  %34 = load i32, i32* %14, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 0, i64 %35
  %37 = load double, double* %36, align 8
  %38 = load double*, double** %12, align 8
  %39 = load i32, i32* %14, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double* %38, i64 %40
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %37
  store double %43, double* %41, align 8
  br label %44

; <label>:44:                                     ; preds = %29
  %45 = load i32, i32* %13, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %13, align 4
  br label %25

; <label>:47:                                     ; preds = %25
  %48 = load double, double* %9, align 8
  %49 = load double*, double** %12, align 8
  %50 = load i32, i32* %14, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double* %49, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fdiv double %53, %48
  store double %54, double* %52, align 8
  br label %55

; <label>:55:                                     ; preds = %47
  %56 = load i32, i32* %14, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %14, align 4
  br label %16

; <label>:58:                                     ; preds = %16
  store i32 0, i32* %13, align 4
  br label %59

; <label>:59:                                     ; preds = %87, %58
  %60 = load i32, i32* %13, align 4
  %61 = load i32, i32* %8, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %90

; <label>:63:                                     ; preds = %59
  store i32 0, i32* %14, align 4
  br label %64

; <label>:64:                                     ; preds = %83, %63
  %65 = load i32, i32* %14, align 4
  %66 = load i32, i32* %7, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %68, label %86

; <label>:68:                                     ; preds = %64
  %69 = load double*, double** %12, align 8
  %70 = load i32, i32* %14, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double* %69, i64 %71
  %73 = load double, double* %72, align 8
  %74 = load [1200 x double]*, [1200 x double]** %10, align 8
  %75 = load i32, i32* %13, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %74, i64 %76
  %78 = load i32, i32* %14, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %77, i64 0, i64 %79
  %81 = load double, double* %80, align 8
  %82 = fsub double %81, %73
  store double %82, double* %80, align 8
  br label %83

; <label>:83:                                     ; preds = %68
  %84 = load i32, i32* %14, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %14, align 4
  br label %64

; <label>:86:                                     ; preds = %64
  br label %87

; <label>:87:                                     ; preds = %86
  %88 = load i32, i32* %13, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %13, align 4
  br label %59

; <label>:90:                                     ; preds = %59
  store i32 0, i32* %13, align 4
  br label %91

; <label>:91:                                     ; preds = %174, %90
  %92 = load i32, i32* %13, align 4
  %93 = load i32, i32* %7, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %177

; <label>:95:                                     ; preds = %91
  %96 = load i32, i32* %13, align 4
  store i32 %96, i32* %14, align 4
  br label %97

; <label>:97:                                     ; preds = %170, %95
  %98 = load i32, i32* %14, align 4
  %99 = load i32, i32* %7, align 4
  %100 = icmp slt i32 %98, %99
  br i1 %100, label %101, label %173

; <label>:101:                                    ; preds = %97
  %102 = load [1200 x double]*, [1200 x double]** %11, align 8
  %103 = load i32, i32* %13, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %102, i64 %104
  %106 = load i32, i32* %14, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %105, i64 0, i64 %107
  store double 0.000000e+00, double* %108, align 8
  store i32 0, i32* %15, align 4
  br label %109

; <label>:109:                                    ; preds = %140, %101
  %110 = load i32, i32* %15, align 4
  %111 = load i32, i32* %8, align 4
  %112 = icmp slt i32 %110, %111
  br i1 %112, label %113, label %143

; <label>:113:                                    ; preds = %109
  %114 = load [1200 x double]*, [1200 x double]** %10, align 8
  %115 = load i32, i32* %15, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %114, i64 %116
  %118 = load i32, i32* %13, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %117, i64 0, i64 %119
  %121 = load double, double* %120, align 8
  %122 = load [1200 x double]*, [1200 x double]** %10, align 8
  %123 = load i32, i32* %15, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %122, i64 %124
  %126 = load i32, i32* %14, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %125, i64 0, i64 %127
  %129 = load double, double* %128, align 8
  %130 = fmul double %121, %129
  %131 = load [1200 x double]*, [1200 x double]** %11, align 8
  %132 = load i32, i32* %13, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %131, i64 %133
  %135 = load i32, i32* %14, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %134, i64 0, i64 %136
  %138 = load double, double* %137, align 8
  %139 = fadd double %138, %130
  store double %139, double* %137, align 8
  br label %140

; <label>:140:                                    ; preds = %113
  %141 = load i32, i32* %15, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %15, align 4
  br label %109

; <label>:143:                                    ; preds = %109
  %144 = load double, double* %9, align 8
  %145 = fsub double %144, 1.000000e+00
  %146 = load [1200 x double]*, [1200 x double]** %11, align 8
  %147 = load i32, i32* %13, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %146, i64 %148
  %150 = load i32, i32* %14, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %149, i64 0, i64 %151
  %153 = load double, double* %152, align 8
  %154 = fdiv double %153, %145
  store double %154, double* %152, align 8
  %155 = load [1200 x double]*, [1200 x double]** %11, align 8
  %156 = load i32, i32* %13, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %155, i64 %157
  %159 = load i32, i32* %14, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %158, i64 0, i64 %160
  %162 = load double, double* %161, align 8
  %163 = load [1200 x double]*, [1200 x double]** %11, align 8
  %164 = load i32, i32* %14, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %163, i64 %165
  %167 = load i32, i32* %13, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %166, i64 0, i64 %168
  store double %162, double* %169, align 8
  br label %170

; <label>:170:                                    ; preds = %143
  %171 = load i32, i32* %14, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %14, align 4
  br label %97

; <label>:173:                                    ; preds = %97
  br label %174

; <label>:174:                                    ; preds = %173
  %175 = load i32, i32* %13, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %13, align 4
  br label %91

; <label>:177:                                    ; preds = %91
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1200 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1200 x double]* %1, [1200 x double]** %4, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %11

; <label>:11:                                     ; preds = %46, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %49

; <label>:15:                                     ; preds = %11
  store i32 0, i32* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %42, %15
  %17 = load i32, i32* %6, align 4
  %18 = load i32, i32* %3, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %45

; <label>:20:                                     ; preds = %16
  %21 = load i32, i32* %5, align 4
  %22 = load i32, i32* %3, align 4
  %23 = mul nsw i32 %21, %22
  %24 = load i32, i32* %6, align 4
  %25 = add nsw i32 %23, %24
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %20
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %31

; <label>:31:                                     ; preds = %28, %20
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = load [1200 x double]*, [1200 x double]** %4, align 8
  %34 = load i32, i32* %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %35
  %37 = load i32, i32* %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 0, i64 %38
  %40 = load double, double* %39, align 8
  %41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %40)
  br label %42

; <label>:42:                                     ; preds = %31
  %43 = load i32, i32* %6, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %6, align 4
  br label %16

; <label>:45:                                     ; preds = %16
  br label %46

; <label>:46:                                     ; preds = %45
  %47 = load i32, i32* %5, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %5, align 4
  br label %11

; <label>:49:                                     ; preds = %11
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0))
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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
