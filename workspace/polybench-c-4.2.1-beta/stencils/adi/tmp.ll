; ModuleID = 'B.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1000 x [1000 x double]]*, align 8
  %9 = alloca [1000 x [1000 x double]]*, align 8
  %10 = alloca [1000 x [1000 x double]]*, align 8
  %11 = alloca [1000 x [1000 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1000, i32* %6, align 4
  store i32 500, i32* %7, align 4
  %12 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %13 = bitcast i8* %12 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %13, [1000 x [1000 x double]]** %8, align 8
  %14 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %15 = bitcast i8* %14 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %15, [1000 x [1000 x double]]** %9, align 8
  %16 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %17 = bitcast i8* %16 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %17, [1000 x [1000 x double]]** %10, align 8
  %18 = call i8* @polybench_alloc_data(i64 1000000, i32 8)
  %19 = bitcast i8* %18 to [1000 x [1000 x double]]*
  store [1000 x [1000 x double]]* %19, [1000 x [1000 x double]]** %11, align 8
  %20 = load i32, i32* %6, align 4
  %21 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %8, align 8
  %22 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %21, i32 0, i32 0
  call void @init_array(i32 %20, [1000 x double]* %22)
  call void (...) @polybench_timer_start()
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %6, align 4
  %25 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %8, align 8
  %26 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %25, i32 0, i32 0
  %27 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %28 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %27, i32 0, i32 0
  %29 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %10, align 8
  %30 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %29, i32 0, i32 0
  %31 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %11, align 8
  %32 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %31, i32 0, i32 0
  call void @kernel_adi(i32 %23, i32 %24, [1000 x double]* %26, [1000 x double]* %28, [1000 x double]* %30, [1000 x double]* %32)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %33 = load i32, i32* %4, align 4
  %34 = icmp sgt i32 %33, 42
  br i1 %34, label %35, label %45

; <label>:35:                                     ; preds = %2
  %36 = load i8**, i8*** %5, align 8
  %37 = getelementptr inbounds i8*, i8** %36, i64 0
  %38 = load i8*, i8** %37, align 8
  %39 = call i32 @strcmp(i8* %38, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %45, label %41

; <label>:41:                                     ; preds = %35
  %42 = load i32, i32* %6, align 4
  %43 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %8, align 8
  %44 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %43, i32 0, i32 0
  call void @print_array(i32 %42, [1000 x double]* %44)
  br label %45

; <label>:45:                                     ; preds = %41, %35, %2
  %46 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %8, align 8
  %47 = bitcast [1000 x [1000 x double]]* %46 to i8*
  call void @free(i8* %47) #5
  %48 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %49 = bitcast [1000 x [1000 x double]]* %48 to i8*
  call void @free(i8* %49) #5
  %50 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %10, align 8
  %51 = bitcast [1000 x [1000 x double]]* %50 to i8*
  call void @free(i8* %51) #5
  %52 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %11, align 8
  %53 = bitcast [1000 x [1000 x double]]* %52 to i8*
  call void @free(i8* %53) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: nounwind uwtable
define internal void @init_array(i32, [1000 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1000 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1000 x double]* %1, [1000 x double]** %4, align 8
  store i32 0, i32* %5, align 4
  br label %7

; <label>:7:                                      ; preds = %37, %2
  %8 = load i32, i32* %5, align 4
  %9 = load i32, i32* %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %40

; <label>:11:                                     ; preds = %7
  store i32 0, i32* %6, align 4
  br label %12

; <label>:12:                                     ; preds = %33, %11
  %13 = load i32, i32* %6, align 4
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %36

; <label>:16:                                     ; preds = %12
  %17 = load i32, i32* %5, align 4
  %18 = load i32, i32* %3, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, i32* %6, align 4
  %21 = sub nsw i32 %19, %20
  %22 = sitofp i32 %21 to double
  %23 = load i32, i32* %3, align 4
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %22, %24
  %26 = load [1000 x double]*, [1000 x double]** %4, align 8
  %27 = load i32, i32* %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %28
  %30 = load i32, i32* %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %29, i64 0, i64 %31
  store double %25, double* %32, align 8
  br label %33

; <label>:33:                                     ; preds = %16
  %34 = load i32, i32* %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %6, align 4
  br label %12

; <label>:36:                                     ; preds = %12
  br label %37

; <label>:37:                                     ; preds = %36
  %38 = load i32, i32* %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %5, align 4
  br label %7

; <label>:40:                                     ; preds = %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: nounwind uwtable
define internal void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca [1000 x double]*, align 8
  %11 = alloca [1000 x double]*, align 8
  %12 = alloca [1000 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  %25 = alloca double, align 8
  %26 = alloca double, align 8
  %27 = alloca double, align 8
  %28 = alloca double, align 8
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [1000 x double]* %2, [1000 x double]** %9, align 8
  store [1000 x double]* %3, [1000 x double]** %10, align 8
  store [1000 x double]* %4, [1000 x double]** %11, align 8
  store [1000 x double]* %5, [1000 x double]** %12, align 8
  %29 = load i32, i32* %8, align 4
  %30 = sitofp i32 %29 to double
  %31 = fdiv double 1.000000e+00, %30
  store double %31, double* %16, align 8
  %32 = load i32, i32* %8, align 4
  %33 = sitofp i32 %32 to double
  %34 = fdiv double 1.000000e+00, %33
  store double %34, double* %17, align 8
  %35 = load i32, i32* %7, align 4
  %36 = sitofp i32 %35 to double
  %37 = fdiv double 1.000000e+00, %36
  store double %37, double* %18, align 8
  store double 2.000000e+00, double* %19, align 8
  store double 1.000000e+00, double* %20, align 8
  %38 = load double, double* %19, align 8
  %39 = load double, double* %18, align 8
  %40 = fmul double %38, %39
  %41 = load double, double* %16, align 8
  %42 = load double, double* %16, align 8
  %43 = fmul double %41, %42
  %44 = fdiv double %40, %43
  store double %44, double* %21, align 8
  %45 = load double, double* %20, align 8
  %46 = load double, double* %18, align 8
  %47 = fmul double %45, %46
  %48 = load double, double* %17, align 8
  %49 = load double, double* %17, align 8
  %50 = fmul double %48, %49
  %51 = fdiv double %47, %50
  store double %51, double* %22, align 8
  %52 = load double, double* %21, align 8
  %53 = fsub double -0.000000e+00, %52
  %54 = fdiv double %53, 2.000000e+00
  store double %54, double* %23, align 8
  %55 = load double, double* %21, align 8
  %56 = fadd double 1.000000e+00, %55
  store double %56, double* %24, align 8
  %57 = load double, double* %23, align 8
  store double %57, double* %25, align 8
  %58 = load double, double* %22, align 8
  %59 = fsub double -0.000000e+00, %58
  %60 = fdiv double %59, 2.000000e+00
  store double %60, double* %26, align 8
  %61 = load double, double* %22, align 8
  %62 = fadd double 1.000000e+00, %61
  store double %62, double* %27, align 8
  %63 = load double, double* %26, align 8
  store double %63, double* %28, align 8
  store i32 1, i32* %13, align 4
  br label %64

; <label>:64:                                     ; preds = %441, %6
  %65 = load i32, i32* %13, align 4
  %66 = load i32, i32* %7, align 4
  %67 = icmp sle i32 %65, %66
  br i1 %67, label %68, label %444

; <label>:68:                                     ; preds = %64
  store i32 1, i32* %14, align 4
  br label %69

; <label>:69:                                     ; preds = %251, %68
  %70 = load i32, i32* %14, align 4
  %71 = load i32, i32* %8, align 4
  %72 = sub nsw i32 %71, 1
  %73 = icmp slt i32 %70, %72
  br i1 %73, label %74, label %254

; <label>:74:                                     ; preds = %69
  %75 = load [1000 x double]*, [1000 x double]** %10, align 8
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 0
  %77 = load i32, i32* %14, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 0, i64 %78
  store double 1.000000e+00, double* %79, align 8
  %80 = load [1000 x double]*, [1000 x double]** %11, align 8
  %81 = load i32, i32* %14, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %83, i64 0, i64 0
  store double 0.000000e+00, double* %84, align 8
  %85 = load [1000 x double]*, [1000 x double]** %10, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 0
  %87 = load i32, i32* %14, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %86, i64 0, i64 %88
  %90 = load double, double* %89, align 8
  %91 = load [1000 x double]*, [1000 x double]** %12, align 8
  %92 = load i32, i32* %14, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %91, i64 %93
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %94, i64 0, i64 0
  store double %90, double* %95, align 8
  store i32 1, i32* %15, align 4
  br label %96

; <label>:96:                                     ; preds = %195, %74
  %97 = load i32, i32* %15, align 4
  %98 = load i32, i32* %8, align 4
  %99 = sub nsw i32 %98, 1
  %100 = icmp slt i32 %97, %99
  br i1 %100, label %101, label %198

; <label>:101:                                    ; preds = %96
  %102 = load double, double* %25, align 8
  %103 = fsub double -0.000000e+00, %102
  %104 = load double, double* %23, align 8
  %105 = load [1000 x double]*, [1000 x double]** %11, align 8
  %106 = load i32, i32* %14, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %105, i64 %107
  %109 = load i32, i32* %15, align 4
  %110 = sub nsw i32 %109, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %108, i64 0, i64 %111
  %113 = load double, double* %112, align 8
  %114 = fmul double %104, %113
  %115 = load double, double* %24, align 8
  %116 = fadd double %114, %115
  %117 = fdiv double %103, %116
  %118 = load [1000 x double]*, [1000 x double]** %11, align 8
  %119 = load i32, i32* %14, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %118, i64 %120
  %122 = load i32, i32* %15, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %121, i64 0, i64 %123
  store double %117, double* %124, align 8
  %125 = load double, double* %26, align 8
  %126 = fsub double -0.000000e+00, %125
  %127 = load [1000 x double]*, [1000 x double]** %9, align 8
  %128 = load i32, i32* %15, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %127, i64 %129
  %131 = load i32, i32* %14, align 4
  %132 = sub nsw i32 %131, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %130, i64 0, i64 %133
  %135 = load double, double* %134, align 8
  %136 = fmul double %126, %135
  %137 = load double, double* %26, align 8
  %138 = fmul double 2.000000e+00, %137
  %139 = fadd double 1.000000e+00, %138
  %140 = load [1000 x double]*, [1000 x double]** %9, align 8
  %141 = load i32, i32* %15, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %140, i64 %142
  %144 = load i32, i32* %14, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %143, i64 0, i64 %145
  %147 = load double, double* %146, align 8
  %148 = fmul double %139, %147
  %149 = fadd double %136, %148
  %150 = load double, double* %28, align 8
  %151 = load [1000 x double]*, [1000 x double]** %9, align 8
  %152 = load i32, i32* %15, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %151, i64 %153
  %155 = load i32, i32* %14, align 4
  %156 = add nsw i32 %155, 1
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %154, i64 0, i64 %157
  %159 = load double, double* %158, align 8
  %160 = fmul double %150, %159
  %161 = fsub double %149, %160
  %162 = load double, double* %23, align 8
  %163 = load [1000 x double]*, [1000 x double]** %12, align 8
  %164 = load i32, i32* %14, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [1000 x double], [1000 x double]* %163, i64 %165
  %167 = load i32, i32* %15, align 4
  %168 = sub nsw i32 %167, 1
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [1000 x double], [1000 x double]* %166, i64 0, i64 %169
  %171 = load double, double* %170, align 8
  %172 = fmul double %162, %171
  %173 = fsub double %161, %172
  %174 = load double, double* %23, align 8
  %175 = load [1000 x double]*, [1000 x double]** %11, align 8
  %176 = load i32, i32* %14, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [1000 x double], [1000 x double]* %175, i64 %177
  %179 = load i32, i32* %15, align 4
  %180 = sub nsw i32 %179, 1
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [1000 x double], [1000 x double]* %178, i64 0, i64 %181
  %183 = load double, double* %182, align 8
  %184 = fmul double %174, %183
  %185 = load double, double* %24, align 8
  %186 = fadd double %184, %185
  %187 = fdiv double %173, %186
  %188 = load [1000 x double]*, [1000 x double]** %12, align 8
  %189 = load i32, i32* %14, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [1000 x double], [1000 x double]* %188, i64 %190
  %192 = load i32, i32* %15, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [1000 x double], [1000 x double]* %191, i64 0, i64 %193
  store double %187, double* %194, align 8
  br label %195

; <label>:195:                                    ; preds = %101
  %196 = load i32, i32* %15, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, i32* %15, align 4
  br label %96

; <label>:198:                                    ; preds = %96
  %199 = load [1000 x double]*, [1000 x double]** %10, align 8
  %200 = load i32, i32* %8, align 4
  %201 = sub nsw i32 %200, 1
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [1000 x double], [1000 x double]* %199, i64 %202
  %204 = load i32, i32* %14, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [1000 x double], [1000 x double]* %203, i64 0, i64 %205
  store double 1.000000e+00, double* %206, align 8
  %207 = load i32, i32* %8, align 4
  %208 = sub nsw i32 %207, 2
  store i32 %208, i32* %15, align 4
  br label %209

; <label>:209:                                    ; preds = %247, %198
  %210 = load i32, i32* %15, align 4
  %211 = icmp sge i32 %210, 1
  br i1 %211, label %212, label %250

; <label>:212:                                    ; preds = %209
  %213 = load [1000 x double]*, [1000 x double]** %11, align 8
  %214 = load i32, i32* %14, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [1000 x double], [1000 x double]* %213, i64 %215
  %217 = load i32, i32* %15, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [1000 x double], [1000 x double]* %216, i64 0, i64 %218
  %220 = load double, double* %219, align 8
  %221 = load [1000 x double]*, [1000 x double]** %10, align 8
  %222 = load i32, i32* %15, align 4
  %223 = add nsw i32 %222, 1
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [1000 x double], [1000 x double]* %221, i64 %224
  %226 = load i32, i32* %14, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [1000 x double], [1000 x double]* %225, i64 0, i64 %227
  %229 = load double, double* %228, align 8
  %230 = fmul double %220, %229
  %231 = load [1000 x double]*, [1000 x double]** %12, align 8
  %232 = load i32, i32* %14, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [1000 x double], [1000 x double]* %231, i64 %233
  %235 = load i32, i32* %15, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [1000 x double], [1000 x double]* %234, i64 0, i64 %236
  %238 = load double, double* %237, align 8
  %239 = fadd double %230, %238
  %240 = load [1000 x double]*, [1000 x double]** %10, align 8
  %241 = load i32, i32* %15, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [1000 x double], [1000 x double]* %240, i64 %242
  %244 = load i32, i32* %14, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [1000 x double], [1000 x double]* %243, i64 0, i64 %245
  store double %239, double* %246, align 8
  br label %247

; <label>:247:                                    ; preds = %212
  %248 = load i32, i32* %15, align 4
  %249 = add nsw i32 %248, -1
  store i32 %249, i32* %15, align 4
  br label %209

; <label>:250:                                    ; preds = %209
  br label %251

; <label>:251:                                    ; preds = %250
  %252 = load i32, i32* %14, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, i32* %14, align 4
  br label %69

; <label>:254:                                    ; preds = %69
  store i32 1, i32* %14, align 4
  br label %255

; <label>:255:                                    ; preds = %437, %254
  %256 = load i32, i32* %14, align 4
  %257 = load i32, i32* %8, align 4
  %258 = sub nsw i32 %257, 1
  %259 = icmp slt i32 %256, %258
  br i1 %259, label %260, label %440

; <label>:260:                                    ; preds = %255
  %261 = load [1000 x double]*, [1000 x double]** %9, align 8
  %262 = load i32, i32* %14, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [1000 x double], [1000 x double]* %261, i64 %263
  %265 = getelementptr inbounds [1000 x double], [1000 x double]* %264, i64 0, i64 0
  store double 1.000000e+00, double* %265, align 8
  %266 = load [1000 x double]*, [1000 x double]** %11, align 8
  %267 = load i32, i32* %14, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [1000 x double], [1000 x double]* %266, i64 %268
  %270 = getelementptr inbounds [1000 x double], [1000 x double]* %269, i64 0, i64 0
  store double 0.000000e+00, double* %270, align 8
  %271 = load [1000 x double]*, [1000 x double]** %9, align 8
  %272 = load i32, i32* %14, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [1000 x double], [1000 x double]* %271, i64 %273
  %275 = getelementptr inbounds [1000 x double], [1000 x double]* %274, i64 0, i64 0
  %276 = load double, double* %275, align 8
  %277 = load [1000 x double]*, [1000 x double]** %12, align 8
  %278 = load i32, i32* %14, align 4
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [1000 x double], [1000 x double]* %277, i64 %279
  %281 = getelementptr inbounds [1000 x double], [1000 x double]* %280, i64 0, i64 0
  store double %276, double* %281, align 8
  store i32 1, i32* %15, align 4
  br label %282

; <label>:282:                                    ; preds = %381, %260
  %283 = load i32, i32* %15, align 4
  %284 = load i32, i32* %8, align 4
  %285 = sub nsw i32 %284, 1
  %286 = icmp slt i32 %283, %285
  br i1 %286, label %287, label %384

; <label>:287:                                    ; preds = %282
  %288 = load double, double* %28, align 8
  %289 = fsub double -0.000000e+00, %288
  %290 = load double, double* %26, align 8
  %291 = load [1000 x double]*, [1000 x double]** %11, align 8
  %292 = load i32, i32* %14, align 4
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds [1000 x double], [1000 x double]* %291, i64 %293
  %295 = load i32, i32* %15, align 4
  %296 = sub nsw i32 %295, 1
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [1000 x double], [1000 x double]* %294, i64 0, i64 %297
  %299 = load double, double* %298, align 8
  %300 = fmul double %290, %299
  %301 = load double, double* %27, align 8
  %302 = fadd double %300, %301
  %303 = fdiv double %289, %302
  %304 = load [1000 x double]*, [1000 x double]** %11, align 8
  %305 = load i32, i32* %14, align 4
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds [1000 x double], [1000 x double]* %304, i64 %306
  %308 = load i32, i32* %15, align 4
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [1000 x double], [1000 x double]* %307, i64 0, i64 %309
  store double %303, double* %310, align 8
  %311 = load double, double* %23, align 8
  %312 = fsub double -0.000000e+00, %311
  %313 = load [1000 x double]*, [1000 x double]** %10, align 8
  %314 = load i32, i32* %14, align 4
  %315 = sub nsw i32 %314, 1
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [1000 x double], [1000 x double]* %313, i64 %316
  %318 = load i32, i32* %15, align 4
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [1000 x double], [1000 x double]* %317, i64 0, i64 %319
  %321 = load double, double* %320, align 8
  %322 = fmul double %312, %321
  %323 = load double, double* %23, align 8
  %324 = fmul double 2.000000e+00, %323
  %325 = fadd double 1.000000e+00, %324
  %326 = load [1000 x double]*, [1000 x double]** %10, align 8
  %327 = load i32, i32* %14, align 4
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [1000 x double], [1000 x double]* %326, i64 %328
  %330 = load i32, i32* %15, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds [1000 x double], [1000 x double]* %329, i64 0, i64 %331
  %333 = load double, double* %332, align 8
  %334 = fmul double %325, %333
  %335 = fadd double %322, %334
  %336 = load double, double* %25, align 8
  %337 = load [1000 x double]*, [1000 x double]** %10, align 8
  %338 = load i32, i32* %14, align 4
  %339 = add nsw i32 %338, 1
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds [1000 x double], [1000 x double]* %337, i64 %340
  %342 = load i32, i32* %15, align 4
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds [1000 x double], [1000 x double]* %341, i64 0, i64 %343
  %345 = load double, double* %344, align 8
  %346 = fmul double %336, %345
  %347 = fsub double %335, %346
  %348 = load double, double* %26, align 8
  %349 = load [1000 x double]*, [1000 x double]** %12, align 8
  %350 = load i32, i32* %14, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds [1000 x double], [1000 x double]* %349, i64 %351
  %353 = load i32, i32* %15, align 4
  %354 = sub nsw i32 %353, 1
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds [1000 x double], [1000 x double]* %352, i64 0, i64 %355
  %357 = load double, double* %356, align 8
  %358 = fmul double %348, %357
  %359 = fsub double %347, %358
  %360 = load double, double* %26, align 8
  %361 = load [1000 x double]*, [1000 x double]** %11, align 8
  %362 = load i32, i32* %14, align 4
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds [1000 x double], [1000 x double]* %361, i64 %363
  %365 = load i32, i32* %15, align 4
  %366 = sub nsw i32 %365, 1
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [1000 x double], [1000 x double]* %364, i64 0, i64 %367
  %369 = load double, double* %368, align 8
  %370 = fmul double %360, %369
  %371 = load double, double* %27, align 8
  %372 = fadd double %370, %371
  %373 = fdiv double %359, %372
  %374 = load [1000 x double]*, [1000 x double]** %12, align 8
  %375 = load i32, i32* %14, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds [1000 x double], [1000 x double]* %374, i64 %376
  %378 = load i32, i32* %15, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [1000 x double], [1000 x double]* %377, i64 0, i64 %379
  store double %373, double* %380, align 8
  br label %381

; <label>:381:                                    ; preds = %287
  %382 = load i32, i32* %15, align 4
  %383 = add nsw i32 %382, 1
  store i32 %383, i32* %15, align 4
  br label %282

; <label>:384:                                    ; preds = %282
  %385 = load [1000 x double]*, [1000 x double]** %9, align 8
  %386 = load i32, i32* %14, align 4
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [1000 x double], [1000 x double]* %385, i64 %387
  %389 = load i32, i32* %8, align 4
  %390 = sub nsw i32 %389, 1
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds [1000 x double], [1000 x double]* %388, i64 0, i64 %391
  store double 1.000000e+00, double* %392, align 8
  %393 = load i32, i32* %8, align 4
  %394 = sub nsw i32 %393, 2
  store i32 %394, i32* %15, align 4
  br label %395

; <label>:395:                                    ; preds = %433, %384
  %396 = load i32, i32* %15, align 4
  %397 = icmp sge i32 %396, 1
  br i1 %397, label %398, label %436

; <label>:398:                                    ; preds = %395
  %399 = load [1000 x double]*, [1000 x double]** %11, align 8
  %400 = load i32, i32* %14, align 4
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds [1000 x double], [1000 x double]* %399, i64 %401
  %403 = load i32, i32* %15, align 4
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds [1000 x double], [1000 x double]* %402, i64 0, i64 %404
  %406 = load double, double* %405, align 8
  %407 = load [1000 x double]*, [1000 x double]** %9, align 8
  %408 = load i32, i32* %14, align 4
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds [1000 x double], [1000 x double]* %407, i64 %409
  %411 = load i32, i32* %15, align 4
  %412 = add nsw i32 %411, 1
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [1000 x double], [1000 x double]* %410, i64 0, i64 %413
  %415 = load double, double* %414, align 8
  %416 = fmul double %406, %415
  %417 = load [1000 x double]*, [1000 x double]** %12, align 8
  %418 = load i32, i32* %14, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds [1000 x double], [1000 x double]* %417, i64 %419
  %421 = load i32, i32* %15, align 4
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds [1000 x double], [1000 x double]* %420, i64 0, i64 %422
  %424 = load double, double* %423, align 8
  %425 = fadd double %416, %424
  %426 = load [1000 x double]*, [1000 x double]** %9, align 8
  %427 = load i32, i32* %14, align 4
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds [1000 x double], [1000 x double]* %426, i64 %428
  %430 = load i32, i32* %15, align 4
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds [1000 x double], [1000 x double]* %429, i64 0, i64 %431
  store double %425, double* %432, align 8
  br label %433

; <label>:433:                                    ; preds = %398
  %434 = load i32, i32* %15, align 4
  %435 = add nsw i32 %434, -1
  store i32 %435, i32* %15, align 4
  br label %395

; <label>:436:                                    ; preds = %395
  br label %437

; <label>:437:                                    ; preds = %436
  %438 = load i32, i32* %14, align 4
  %439 = add nsw i32 %438, 1
  store i32 %439, i32* %14, align 4
  br label %255

; <label>:440:                                    ; preds = %255
  br label %441

; <label>:441:                                    ; preds = %440
  %442 = load i32, i32* %13, align 4
  %443 = add nsw i32 %442, 1
  store i32 %443, i32* %13, align 4
  br label %64

; <label>:444:                                    ; preds = %64
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define internal void @print_array(i32, [1000 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1000 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1000 x double]* %1, [1000 x double]** %4, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
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
  %33 = load [1000 x double]*, [1000 x double]** %4, align 8
  %34 = load i32, i32* %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %33, i64 %35
  %37 = load i32, i32* %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %36, i64 0, i64 %38
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
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
