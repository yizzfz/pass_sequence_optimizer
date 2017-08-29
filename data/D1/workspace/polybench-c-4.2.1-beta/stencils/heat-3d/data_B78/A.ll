; ModuleID = 'heat-3d.c'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
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
  %8 = alloca [120 x [120 x [120 x double]]]*, align 8
  %9 = alloca [120 x [120 x [120 x double]]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 120, i32* %6, align 4
  store i32 500, i32* %7, align 4
  %10 = call i8* @polybench_alloc_data(i64 1728000, i32 8)
  %11 = bitcast i8* %10 to [120 x [120 x [120 x double]]]*
  store [120 x [120 x [120 x double]]]* %11, [120 x [120 x [120 x double]]]** %8, align 8
  %12 = call i8* @polybench_alloc_data(i64 1728000, i32 8)
  %13 = bitcast i8* %12 to [120 x [120 x [120 x double]]]*
  store [120 x [120 x [120 x double]]]* %13, [120 x [120 x [120 x double]]]** %9, align 8
  %14 = load i32, i32* %6, align 4
  %15 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %8, align 8
  %16 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %15, i32 0, i32 0
  %17 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %9, align 8
  %18 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %17, i32 0, i32 0
  call void @init_array(i32 %14, [120 x [120 x double]]* %16, [120 x [120 x double]]* %18)
  call void (...) @polybench_timer_start()
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %6, align 4
  %21 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %8, align 8
  %22 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %21, i32 0, i32 0
  %23 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %9, align 8
  %24 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %23, i32 0, i32 0
  call void @kernel_heat_3d(i32 %19, i32 %20, [120 x [120 x double]]* %22, [120 x [120 x double]]* %24)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %25 = load i32, i32* %4, align 4
  %26 = icmp sgt i32 %25, 42
  br i1 %26, label %27, label %37

; <label>:27:                                     ; preds = %2
  %28 = load i8**, i8*** %5, align 8
  %29 = getelementptr inbounds i8*, i8** %28, i64 0
  %30 = load i8*, i8** %29, align 8
  %31 = call i32 @strcmp(i8* %30, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %37, label %33

; <label>:33:                                     ; preds = %27
  %34 = load i32, i32* %6, align 4
  %35 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %8, align 8
  %36 = getelementptr inbounds [120 x [120 x [120 x double]]], [120 x [120 x [120 x double]]]* %35, i32 0, i32 0
  call void @print_array(i32 %34, [120 x [120 x double]]* %36)
  br label %37

; <label>:37:                                     ; preds = %33, %27, %2
  %38 = load [120 x [120 x [120 x double]]]*, [120 x [120 x [120 x double]]]** %8, align 8
  %39 = bitcast [120 x [120 x [120 x double]]]* %38 to i8*
  call void @free(i8* %39) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca [120 x [120 x double]]*, align 8
  %6 = alloca [120 x [120 x double]]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %5, align 8
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %6, align 8
  store i32 0, i32* %7, align 4
  br label %10

; <label>:10:                                     ; preds = %65, %3
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %68

; <label>:14:                                     ; preds = %10
  store i32 0, i32* %8, align 4
  br label %15

; <label>:15:                                     ; preds = %61, %14
  %16 = load i32, i32* %8, align 4
  %17 = load i32, i32* %4, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %64

; <label>:19:                                     ; preds = %15
  store i32 0, i32* %9, align 4
  br label %20

; <label>:20:                                     ; preds = %57, %19
  %21 = load i32, i32* %9, align 4
  %22 = load i32, i32* %4, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %60

; <label>:24:                                     ; preds = %20
  %25 = load i32, i32* %7, align 4
  %26 = load i32, i32* %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, i32* %4, align 4
  %29 = load i32, i32* %9, align 4
  %30 = sub nsw i32 %28, %29
  %31 = add nsw i32 %27, %30
  %32 = sitofp i32 %31 to double
  %33 = fmul double %32, 1.000000e+01
  %34 = load i32, i32* %4, align 4
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %33, %35
  %37 = load [120 x [120 x double]]*, [120 x [120 x double]]** %6, align 8
  %38 = load i32, i32* %7, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %37, i64 %39
  %41 = load i32, i32* %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %40, i64 0, i64 %42
  %44 = load i32, i32* %9, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [120 x double], [120 x double]* %43, i64 0, i64 %45
  store double %36, double* %46, align 8
  %47 = load [120 x [120 x double]]*, [120 x [120 x double]]** %5, align 8
  %48 = load i32, i32* %7, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %47, i64 %49
  %51 = load i32, i32* %8, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %50, i64 0, i64 %52
  %54 = load i32, i32* %9, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [120 x double], [120 x double]* %53, i64 0, i64 %55
  store double %36, double* %56, align 8
  br label %57

; <label>:57:                                     ; preds = %24
  %58 = load i32, i32* %9, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %9, align 4
  br label %20

; <label>:60:                                     ; preds = %20
  br label %61

; <label>:61:                                     ; preds = %60
  %62 = load i32, i32* %8, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %8, align 4
  br label %15

; <label>:64:                                     ; preds = %15
  br label %65

; <label>:65:                                     ; preds = %64
  %66 = load i32, i32* %7, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %7, align 4
  br label %10

; <label>:68:                                     ; preds = %10
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [120 x [120 x double]]*, align 8
  %8 = alloca [120 x [120 x double]]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [120 x [120 x double]]* %2, [120 x [120 x double]]** %7, align 8
  store [120 x [120 x double]]* %3, [120 x [120 x double]]** %8, align 8
  store i32 1, i32* %9, align 4
  br label %13

; <label>:13:                                     ; preds = %359, %4
  %14 = load i32, i32* %9, align 4
  %15 = icmp sle i32 %14, 500
  br i1 %15, label %16, label %362

; <label>:16:                                     ; preds = %13
  store i32 1, i32* %10, align 4
  br label %17

; <label>:17:                                     ; preds = %184, %16
  %18 = load i32, i32* %10, align 4
  %19 = load i32, i32* %6, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp slt i32 %18, %20
  br i1 %21, label %22, label %187

; <label>:22:                                     ; preds = %17
  store i32 1, i32* %11, align 4
  br label %23

; <label>:23:                                     ; preds = %180, %22
  %24 = load i32, i32* %11, align 4
  %25 = load i32, i32* %6, align 4
  %26 = sub nsw i32 %25, 1
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %28, label %183

; <label>:28:                                     ; preds = %23
  store i32 1, i32* %12, align 4
  br label %29

; <label>:29:                                     ; preds = %176, %28
  %30 = load i32, i32* %12, align 4
  %31 = load i32, i32* %6, align 4
  %32 = sub nsw i32 %31, 1
  %33 = icmp slt i32 %30, %32
  br i1 %33, label %34, label %179

; <label>:34:                                     ; preds = %29
  %35 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %36 = load i32, i32* %10, align 4
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %35, i64 %38
  %40 = load i32, i32* %11, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %39, i64 0, i64 %41
  %43 = load i32, i32* %12, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [120 x double], [120 x double]* %42, i64 0, i64 %44
  %46 = load double, double* %45, align 8
  %47 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %48 = load i32, i32* %10, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %47, i64 %49
  %51 = load i32, i32* %11, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %50, i64 0, i64 %52
  %54 = load i32, i32* %12, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [120 x double], [120 x double]* %53, i64 0, i64 %55
  %57 = load double, double* %56, align 8
  %58 = fmul double 2.000000e+00, %57
  %59 = fsub double %46, %58
  %60 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %61 = load i32, i32* %10, align 4
  %62 = sub nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %60, i64 %63
  %65 = load i32, i32* %11, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %64, i64 0, i64 %66
  %68 = load i32, i32* %12, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [120 x double], [120 x double]* %67, i64 0, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fadd double %59, %71
  %73 = fmul double 1.250000e-01, %72
  %74 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %75 = load i32, i32* %10, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %74, i64 %76
  %78 = load i32, i32* %11, align 4
  %79 = add nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %77, i64 0, i64 %80
  %82 = load i32, i32* %12, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [120 x double], [120 x double]* %81, i64 0, i64 %83
  %85 = load double, double* %84, align 8
  %86 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %87 = load i32, i32* %10, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %86, i64 %88
  %90 = load i32, i32* %11, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %89, i64 0, i64 %91
  %93 = load i32, i32* %12, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [120 x double], [120 x double]* %92, i64 0, i64 %94
  %96 = load double, double* %95, align 8
  %97 = fmul double 2.000000e+00, %96
  %98 = fsub double %85, %97
  %99 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %100 = load i32, i32* %10, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %99, i64 %101
  %103 = load i32, i32* %11, align 4
  %104 = sub nsw i32 %103, 1
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %102, i64 0, i64 %105
  %107 = load i32, i32* %12, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [120 x double], [120 x double]* %106, i64 0, i64 %108
  %110 = load double, double* %109, align 8
  %111 = fadd double %98, %110
  %112 = fmul double 1.250000e-01, %111
  %113 = fadd double %73, %112
  %114 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %115 = load i32, i32* %10, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %114, i64 %116
  %118 = load i32, i32* %11, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %117, i64 0, i64 %119
  %121 = load i32, i32* %12, align 4
  %122 = add nsw i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [120 x double], [120 x double]* %120, i64 0, i64 %123
  %125 = load double, double* %124, align 8
  %126 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %127 = load i32, i32* %10, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %126, i64 %128
  %130 = load i32, i32* %11, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %129, i64 0, i64 %131
  %133 = load i32, i32* %12, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [120 x double], [120 x double]* %132, i64 0, i64 %134
  %136 = load double, double* %135, align 8
  %137 = fmul double 2.000000e+00, %136
  %138 = fsub double %125, %137
  %139 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %140 = load i32, i32* %10, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %139, i64 %141
  %143 = load i32, i32* %11, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %142, i64 0, i64 %144
  %146 = load i32, i32* %12, align 4
  %147 = sub nsw i32 %146, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [120 x double], [120 x double]* %145, i64 0, i64 %148
  %150 = load double, double* %149, align 8
  %151 = fadd double %138, %150
  %152 = fmul double 1.250000e-01, %151
  %153 = fadd double %113, %152
  %154 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %155 = load i32, i32* %10, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %154, i64 %156
  %158 = load i32, i32* %11, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %157, i64 0, i64 %159
  %161 = load i32, i32* %12, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [120 x double], [120 x double]* %160, i64 0, i64 %162
  %164 = load double, double* %163, align 8
  %165 = fadd double %153, %164
  %166 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %167 = load i32, i32* %10, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %166, i64 %168
  %170 = load i32, i32* %11, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %169, i64 0, i64 %171
  %173 = load i32, i32* %12, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [120 x double], [120 x double]* %172, i64 0, i64 %174
  store double %165, double* %175, align 8
  br label %176

; <label>:176:                                    ; preds = %34
  %177 = load i32, i32* %12, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %12, align 4
  br label %29

; <label>:179:                                    ; preds = %29
  br label %180

; <label>:180:                                    ; preds = %179
  %181 = load i32, i32* %11, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, i32* %11, align 4
  br label %23

; <label>:183:                                    ; preds = %23
  br label %184

; <label>:184:                                    ; preds = %183
  %185 = load i32, i32* %10, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %10, align 4
  br label %17

; <label>:187:                                    ; preds = %17
  store i32 1, i32* %10, align 4
  br label %188

; <label>:188:                                    ; preds = %355, %187
  %189 = load i32, i32* %10, align 4
  %190 = load i32, i32* %6, align 4
  %191 = sub nsw i32 %190, 1
  %192 = icmp slt i32 %189, %191
  br i1 %192, label %193, label %358

; <label>:193:                                    ; preds = %188
  store i32 1, i32* %11, align 4
  br label %194

; <label>:194:                                    ; preds = %351, %193
  %195 = load i32, i32* %11, align 4
  %196 = load i32, i32* %6, align 4
  %197 = sub nsw i32 %196, 1
  %198 = icmp slt i32 %195, %197
  br i1 %198, label %199, label %354

; <label>:199:                                    ; preds = %194
  store i32 1, i32* %12, align 4
  br label %200

; <label>:200:                                    ; preds = %347, %199
  %201 = load i32, i32* %12, align 4
  %202 = load i32, i32* %6, align 4
  %203 = sub nsw i32 %202, 1
  %204 = icmp slt i32 %201, %203
  br i1 %204, label %205, label %350

; <label>:205:                                    ; preds = %200
  %206 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %207 = load i32, i32* %10, align 4
  %208 = add nsw i32 %207, 1
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %206, i64 %209
  %211 = load i32, i32* %11, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %210, i64 0, i64 %212
  %214 = load i32, i32* %12, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [120 x double], [120 x double]* %213, i64 0, i64 %215
  %217 = load double, double* %216, align 8
  %218 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %219 = load i32, i32* %10, align 4
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %218, i64 %220
  %222 = load i32, i32* %11, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %221, i64 0, i64 %223
  %225 = load i32, i32* %12, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [120 x double], [120 x double]* %224, i64 0, i64 %226
  %228 = load double, double* %227, align 8
  %229 = fmul double 2.000000e+00, %228
  %230 = fsub double %217, %229
  %231 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %232 = load i32, i32* %10, align 4
  %233 = sub nsw i32 %232, 1
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %231, i64 %234
  %236 = load i32, i32* %11, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %235, i64 0, i64 %237
  %239 = load i32, i32* %12, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [120 x double], [120 x double]* %238, i64 0, i64 %240
  %242 = load double, double* %241, align 8
  %243 = fadd double %230, %242
  %244 = fmul double 1.250000e-01, %243
  %245 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %246 = load i32, i32* %10, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %245, i64 %247
  %249 = load i32, i32* %11, align 4
  %250 = add nsw i32 %249, 1
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %248, i64 0, i64 %251
  %253 = load i32, i32* %12, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [120 x double], [120 x double]* %252, i64 0, i64 %254
  %256 = load double, double* %255, align 8
  %257 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %258 = load i32, i32* %10, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %257, i64 %259
  %261 = load i32, i32* %11, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %260, i64 0, i64 %262
  %264 = load i32, i32* %12, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [120 x double], [120 x double]* %263, i64 0, i64 %265
  %267 = load double, double* %266, align 8
  %268 = fmul double 2.000000e+00, %267
  %269 = fsub double %256, %268
  %270 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %271 = load i32, i32* %10, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %270, i64 %272
  %274 = load i32, i32* %11, align 4
  %275 = sub nsw i32 %274, 1
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %273, i64 0, i64 %276
  %278 = load i32, i32* %12, align 4
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [120 x double], [120 x double]* %277, i64 0, i64 %279
  %281 = load double, double* %280, align 8
  %282 = fadd double %269, %281
  %283 = fmul double 1.250000e-01, %282
  %284 = fadd double %244, %283
  %285 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %286 = load i32, i32* %10, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %285, i64 %287
  %289 = load i32, i32* %11, align 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %288, i64 0, i64 %290
  %292 = load i32, i32* %12, align 4
  %293 = add nsw i32 %292, 1
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds [120 x double], [120 x double]* %291, i64 0, i64 %294
  %296 = load double, double* %295, align 8
  %297 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %298 = load i32, i32* %10, align 4
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %297, i64 %299
  %301 = load i32, i32* %11, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %300, i64 0, i64 %302
  %304 = load i32, i32* %12, align 4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [120 x double], [120 x double]* %303, i64 0, i64 %305
  %307 = load double, double* %306, align 8
  %308 = fmul double 2.000000e+00, %307
  %309 = fsub double %296, %308
  %310 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %311 = load i32, i32* %10, align 4
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %310, i64 %312
  %314 = load i32, i32* %11, align 4
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %313, i64 0, i64 %315
  %317 = load i32, i32* %12, align 4
  %318 = sub nsw i32 %317, 1
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [120 x double], [120 x double]* %316, i64 0, i64 %319
  %321 = load double, double* %320, align 8
  %322 = fadd double %309, %321
  %323 = fmul double 1.250000e-01, %322
  %324 = fadd double %284, %323
  %325 = load [120 x [120 x double]]*, [120 x [120 x double]]** %8, align 8
  %326 = load i32, i32* %10, align 4
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %325, i64 %327
  %329 = load i32, i32* %11, align 4
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %328, i64 0, i64 %330
  %332 = load i32, i32* %12, align 4
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [120 x double], [120 x double]* %331, i64 0, i64 %333
  %335 = load double, double* %334, align 8
  %336 = fadd double %324, %335
  %337 = load [120 x [120 x double]]*, [120 x [120 x double]]** %7, align 8
  %338 = load i32, i32* %10, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %337, i64 %339
  %341 = load i32, i32* %11, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %340, i64 0, i64 %342
  %344 = load i32, i32* %12, align 4
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds [120 x double], [120 x double]* %343, i64 0, i64 %345
  store double %336, double* %346, align 8
  br label %347

; <label>:347:                                    ; preds = %205
  %348 = load i32, i32* %12, align 4
  %349 = add nsw i32 %348, 1
  store i32 %349, i32* %12, align 4
  br label %200

; <label>:350:                                    ; preds = %200
  br label %351

; <label>:351:                                    ; preds = %350
  %352 = load i32, i32* %11, align 4
  %353 = add nsw i32 %352, 1
  store i32 %353, i32* %11, align 4
  br label %194

; <label>:354:                                    ; preds = %194
  br label %355

; <label>:355:                                    ; preds = %354
  %356 = load i32, i32* %10, align 4
  %357 = add nsw i32 %356, 1
  store i32 %357, i32* %10, align 4
  br label %188

; <label>:358:                                    ; preds = %188
  br label %359

; <label>:359:                                    ; preds = %358
  %360 = load i32, i32* %9, align 4
  %361 = add nsw i32 %360, 1
  store i32 %361, i32* %9, align 4
  br label %13

; <label>:362:                                    ; preds = %13
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [120 x [120 x double]]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [120 x [120 x double]]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [120 x [120 x double]]* %1, [120 x [120 x double]]** %4, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %65, %2
  %13 = load i32, i32* %5, align 4
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %68

; <label>:16:                                     ; preds = %12
  store i32 0, i32* %6, align 4
  br label %17

; <label>:17:                                     ; preds = %61, %16
  %18 = load i32, i32* %6, align 4
  %19 = load i32, i32* %3, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %64

; <label>:21:                                     ; preds = %17
  store i32 0, i32* %7, align 4
  br label %22

; <label>:22:                                     ; preds = %57, %21
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %3, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %60

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %5, align 4
  %28 = load i32, i32* %3, align 4
  %29 = mul nsw i32 %27, %28
  %30 = load i32, i32* %3, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32, i32* %6, align 4
  %33 = load i32, i32* %3, align 4
  %34 = mul nsw i32 %32, %33
  %35 = add nsw i32 %31, %34
  %36 = load i32, i32* %7, align 4
  %37 = add nsw i32 %35, %36
  %38 = srem i32 %37, 20
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %26
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %43

; <label>:43:                                     ; preds = %40, %26
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = load [120 x [120 x double]]*, [120 x [120 x double]]** %4, align 8
  %46 = load i32, i32* %5, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %45, i64 %47
  %49 = load i32, i32* %6, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %48, i64 0, i64 %50
  %52 = load i32, i32* %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [120 x double], [120 x double]* %51, i64 0, i64 %53
  %55 = load double, double* %54, align 8
  %56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %55)
  br label %57

; <label>:57:                                     ; preds = %43
  %58 = load i32, i32* %7, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %7, align 4
  br label %22

; <label>:60:                                     ; preds = %22
  br label %61

; <label>:61:                                     ; preds = %60
  %62 = load i32, i32* %6, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %6, align 4
  br label %17

; <label>:64:                                     ; preds = %17
  br label %65

; <label>:65:                                     ; preds = %64
  %66 = load i32, i32* %5, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %5, align 4
  br label %12

; <label>:68:                                     ; preds = %12
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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
