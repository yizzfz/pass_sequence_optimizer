; ModuleID = 'correlation.c'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
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
  %12 = alloca [1200 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1400, i32* %6, align 4
  store i32 1200, i32* %7, align 4
  %13 = call i8* @polybench_alloc_data(i64 1680000, i32 8)
  %14 = bitcast i8* %13 to [1400 x [1200 x double]]*
  store [1400 x [1200 x double]]* %14, [1400 x [1200 x double]]** %9, align 8
  %15 = call i8* @polybench_alloc_data(i64 1440000, i32 8)
  %16 = bitcast i8* %15 to [1200 x [1200 x double]]*
  store [1200 x [1200 x double]]* %16, [1200 x [1200 x double]]** %10, align 8
  %17 = call i8* @polybench_alloc_data(i64 1200, i32 8)
  %18 = bitcast i8* %17 to [1200 x double]*
  store [1200 x double]* %18, [1200 x double]** %11, align 8
  %19 = call i8* @polybench_alloc_data(i64 1200, i32 8)
  %20 = bitcast i8* %19 to [1200 x double]*
  store [1200 x double]* %20, [1200 x double]** %12, align 8
  %21 = load i32, i32* %7, align 4
  %22 = load i32, i32* %6, align 4
  %23 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %24 = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %23, i32 0, i32 0
  call void @init_array(i32 %21, i32 %22, double* %8, [1200 x double]* %24)
  call void (...) @polybench_timer_start()
  %25 = load i32, i32* %7, align 4
  %26 = load i32, i32* %6, align 4
  %27 = load double, double* %8, align 8
  %28 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %29 = getelementptr inbounds [1400 x [1200 x double]], [1400 x [1200 x double]]* %28, i32 0, i32 0
  %30 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %31 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %30, i32 0, i32 0
  %32 = load [1200 x double]*, [1200 x double]** %11, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %32, i32 0, i32 0
  %34 = load [1200 x double]*, [1200 x double]** %12, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %34, i32 0, i32 0
  call void @kernel_correlation(i32 %25, i32 %26, double %27, [1200 x double]* %29, [1200 x double]* %31, double* %33, double* %35)
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
  %46 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %47 = getelementptr inbounds [1200 x [1200 x double]], [1200 x [1200 x double]]* %46, i32 0, i32 0
  call void @print_array(i32 %45, [1200 x double]* %47)
  br label %48

; <label>:48:                                     ; preds = %44, %38, %2
  %49 = load [1400 x [1200 x double]]*, [1400 x [1200 x double]]** %9, align 8
  %50 = bitcast [1400 x [1200 x double]]* %49 to i8*
  call void @free(i8* %50) #5
  %51 = load [1200 x [1200 x double]]*, [1200 x [1200 x double]]** %10, align 8
  %52 = bitcast [1200 x [1200 x double]]* %51 to i8*
  call void @free(i8* %52) #5
  %53 = load [1200 x double]*, [1200 x double]** %11, align 8
  %54 = bitcast [1200 x double]* %53 to i8*
  call void @free(i8* %54) #5
  %55 = load [1200 x double]*, [1200 x double]** %12, align 8
  %56 = bitcast [1200 x double]* %55 to i8*
  call void @free(i8* %56) #5
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
  %11 = load double*, double** %7, align 8
  store double 1.400000e+03, double* %11, align 8
  store i32 0, i32* %9, align 4
  br label %12

; <label>:12:                                     ; preds = %39, %4
  %13 = load i32, i32* %9, align 4
  %14 = icmp slt i32 %13, 1400
  br i1 %14, label %15, label %42

; <label>:15:                                     ; preds = %12
  store i32 0, i32* %10, align 4
  br label %16

; <label>:16:                                     ; preds = %35, %15
  %17 = load i32, i32* %10, align 4
  %18 = icmp slt i32 %17, 1200
  br i1 %18, label %19, label %38

; <label>:19:                                     ; preds = %16
  %20 = load i32, i32* %9, align 4
  %21 = load i32, i32* %10, align 4
  %22 = mul nsw i32 %20, %21
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.200000e+03
  %25 = load i32, i32* %9, align 4
  %26 = sitofp i32 %25 to double
  %27 = fadd double %24, %26
  %28 = load [1200 x double]*, [1200 x double]** %8, align 8
  %29 = load i32, i32* %9, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %28, i64 %30
  %32 = load i32, i32* %10, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %31, i64 0, i64 %33
  store double %27, double* %34, align 8
  br label %35

; <label>:35:                                     ; preds = %19
  %36 = load i32, i32* %10, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %10, align 4
  br label %16

; <label>:38:                                     ; preds = %16
  br label %39

; <label>:39:                                     ; preds = %38
  %40 = load i32, i32* %9, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %9, align 4
  br label %12

; <label>:42:                                     ; preds = %12
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca [1200 x double]*, align 8
  %12 = alloca [1200 x double]*, align 8
  %13 = alloca double*, align 8
  %14 = alloca double*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca double, align 8
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store double %2, double* %10, align 8
  store [1200 x double]* %3, [1200 x double]** %11, align 8
  store [1200 x double]* %4, [1200 x double]** %12, align 8
  store double* %5, double** %13, align 8
  store double* %6, double** %14, align 8
  store double 1.000000e-01, double* %18, align 8
  store i32 0, i32* %16, align 4
  br label %19

; <label>:19:                                     ; preds = %58, %7
  %20 = load i32, i32* %16, align 4
  %21 = load i32, i32* %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %61

; <label>:23:                                     ; preds = %19
  %24 = load double*, double** %13, align 8
  %25 = load i32, i32* %16, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  store double 0.000000e+00, double* %27, align 8
  store i32 0, i32* %15, align 4
  br label %28

; <label>:28:                                     ; preds = %47, %23
  %29 = load i32, i32* %15, align 4
  %30 = load i32, i32* %9, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %50

; <label>:32:                                     ; preds = %28
  %33 = load [1200 x double]*, [1200 x double]** %11, align 8
  %34 = load i32, i32* %15, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %35
  %37 = load i32, i32* %16, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 0, i64 %38
  %40 = load double, double* %39, align 8
  %41 = load double*, double** %13, align 8
  %42 = load i32, i32* %16, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double* %41, i64 %43
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %40
  store double %46, double* %44, align 8
  br label %47

; <label>:47:                                     ; preds = %32
  %48 = load i32, i32* %15, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %15, align 4
  br label %28

; <label>:50:                                     ; preds = %28
  %51 = load double, double* %10, align 8
  %52 = load double*, double** %13, align 8
  %53 = load i32, i32* %16, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double* %52, i64 %54
  %56 = load double, double* %55, align 8
  %57 = fdiv double %56, %51
  store double %57, double* %55, align 8
  br label %58

; <label>:58:                                     ; preds = %50
  %59 = load i32, i32* %16, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %16, align 4
  br label %19

; <label>:61:                                     ; preds = %19
  store i32 0, i32* %16, align 4
  br label %62

; <label>:62:                                     ; preds = %152, %61
  %63 = load i32, i32* %16, align 4
  %64 = load i32, i32* %8, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %155

; <label>:66:                                     ; preds = %62
  %67 = load double*, double** %14, align 8
  %68 = load i32, i32* %16, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double* %67, i64 %69
  store double 0.000000e+00, double* %70, align 8
  store i32 0, i32* %15, align 4
  br label %71

; <label>:71:                                     ; preds = %111, %66
  %72 = load i32, i32* %15, align 4
  %73 = load i32, i32* %9, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %114

; <label>:75:                                     ; preds = %71
  %76 = load [1200 x double]*, [1200 x double]** %11, align 8
  %77 = load i32, i32* %15, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %76, i64 %78
  %80 = load i32, i32* %16, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %79, i64 0, i64 %81
  %83 = load double, double* %82, align 8
  %84 = load double*, double** %13, align 8
  %85 = load i32, i32* %16, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double* %84, i64 %86
  %88 = load double, double* %87, align 8
  %89 = fsub double %83, %88
  %90 = load [1200 x double]*, [1200 x double]** %11, align 8
  %91 = load i32, i32* %15, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %90, i64 %92
  %94 = load i32, i32* %16, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %93, i64 0, i64 %95
  %97 = load double, double* %96, align 8
  %98 = load double*, double** %13, align 8
  %99 = load i32, i32* %16, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double* %98, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fsub double %97, %102
  %104 = fmul double %89, %103
  %105 = load double*, double** %14, align 8
  %106 = load i32, i32* %16, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double* %105, i64 %107
  %109 = load double, double* %108, align 8
  %110 = fadd double %109, %104
  store double %110, double* %108, align 8
  br label %111

; <label>:111:                                    ; preds = %75
  %112 = load i32, i32* %15, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %15, align 4
  br label %71

; <label>:114:                                    ; preds = %71
  %115 = load double, double* %10, align 8
  %116 = load double*, double** %14, align 8
  %117 = load i32, i32* %16, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double* %116, i64 %118
  %120 = load double, double* %119, align 8
  %121 = fdiv double %120, %115
  store double %121, double* %119, align 8
  %122 = load double*, double** %14, align 8
  %123 = load i32, i32* %16, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double* %122, i64 %124
  %126 = load double, double* %125, align 8
  %127 = call double @sqrt(double %126) #5
  %128 = load double*, double** %14, align 8
  %129 = load i32, i32* %16, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, double* %128, i64 %130
  store double %127, double* %131, align 8
  %132 = load double*, double** %14, align 8
  %133 = load i32, i32* %16, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds double, double* %132, i64 %134
  %136 = load double, double* %135, align 8
  %137 = load double, double* %18, align 8
  %138 = fcmp ole double %136, %137
  br i1 %138, label %139, label %140

; <label>:139:                                    ; preds = %114
  br label %146

; <label>:140:                                    ; preds = %114
  %141 = load double*, double** %14, align 8
  %142 = load i32, i32* %16, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double, double* %141, i64 %143
  %145 = load double, double* %144, align 8
  br label %146

; <label>:146:                                    ; preds = %140, %139
  %147 = phi double [ 1.000000e+00, %139 ], [ %145, %140 ]
  %148 = load double*, double** %14, align 8
  %149 = load i32, i32* %16, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds double, double* %148, i64 %150
  store double %147, double* %151, align 8
  br label %152

; <label>:152:                                    ; preds = %146
  %153 = load i32, i32* %16, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %16, align 4
  br label %62

; <label>:155:                                    ; preds = %62
  store i32 0, i32* %15, align 4
  br label %156

; <label>:156:                                    ; preds = %201, %155
  %157 = load i32, i32* %15, align 4
  %158 = load i32, i32* %9, align 4
  %159 = icmp slt i32 %157, %158
  br i1 %159, label %160, label %204

; <label>:160:                                    ; preds = %156
  store i32 0, i32* %16, align 4
  br label %161

; <label>:161:                                    ; preds = %197, %160
  %162 = load i32, i32* %16, align 4
  %163 = load i32, i32* %8, align 4
  %164 = icmp slt i32 %162, %163
  br i1 %164, label %165, label %200

; <label>:165:                                    ; preds = %161
  %166 = load double*, double** %13, align 8
  %167 = load i32, i32* %16, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds double, double* %166, i64 %168
  %170 = load double, double* %169, align 8
  %171 = load [1200 x double]*, [1200 x double]** %11, align 8
  %172 = load i32, i32* %15, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %171, i64 %173
  %175 = load i32, i32* %16, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %174, i64 0, i64 %176
  %178 = load double, double* %177, align 8
  %179 = fsub double %178, %170
  store double %179, double* %177, align 8
  %180 = load double, double* %10, align 8
  %181 = call double @sqrt(double %180) #5
  %182 = load double*, double** %14, align 8
  %183 = load i32, i32* %16, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds double, double* %182, i64 %184
  %186 = load double, double* %185, align 8
  %187 = fmul double %181, %186
  %188 = load [1200 x double]*, [1200 x double]** %11, align 8
  %189 = load i32, i32* %15, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %188, i64 %190
  %192 = load i32, i32* %16, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [1200 x double], [1200 x double]* %191, i64 0, i64 %193
  %195 = load double, double* %194, align 8
  %196 = fdiv double %195, %187
  store double %196, double* %194, align 8
  br label %197

; <label>:197:                                    ; preds = %165
  %198 = load i32, i32* %16, align 4
  %199 = add nsw i32 %198, 1
  store i32 %199, i32* %16, align 4
  br label %161

; <label>:200:                                    ; preds = %161
  br label %201

; <label>:201:                                    ; preds = %200
  %202 = load i32, i32* %15, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* %15, align 4
  br label %156

; <label>:204:                                    ; preds = %156
  store i32 0, i32* %15, align 4
  br label %205

; <label>:205:                                    ; preds = %286, %204
  %206 = load i32, i32* %15, align 4
  %207 = load i32, i32* %8, align 4
  %208 = sub nsw i32 %207, 1
  %209 = icmp slt i32 %206, %208
  br i1 %209, label %210, label %289

; <label>:210:                                    ; preds = %205
  %211 = load [1200 x double]*, [1200 x double]** %12, align 8
  %212 = load i32, i32* %15, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [1200 x double], [1200 x double]* %211, i64 %213
  %215 = load i32, i32* %15, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [1200 x double], [1200 x double]* %214, i64 0, i64 %216
  store double 1.000000e+00, double* %217, align 8
  %218 = load i32, i32* %15, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %16, align 4
  br label %220

; <label>:220:                                    ; preds = %282, %210
  %221 = load i32, i32* %16, align 4
  %222 = load i32, i32* %8, align 4
  %223 = icmp slt i32 %221, %222
  br i1 %223, label %224, label %285

; <label>:224:                                    ; preds = %220
  %225 = load [1200 x double]*, [1200 x double]** %12, align 8
  %226 = load i32, i32* %15, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [1200 x double], [1200 x double]* %225, i64 %227
  %229 = load i32, i32* %16, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [1200 x double], [1200 x double]* %228, i64 0, i64 %230
  store double 0.000000e+00, double* %231, align 8
  store i32 0, i32* %17, align 4
  br label %232

; <label>:232:                                    ; preds = %263, %224
  %233 = load i32, i32* %17, align 4
  %234 = load i32, i32* %9, align 4
  %235 = icmp slt i32 %233, %234
  br i1 %235, label %236, label %266

; <label>:236:                                    ; preds = %232
  %237 = load [1200 x double]*, [1200 x double]** %11, align 8
  %238 = load i32, i32* %17, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [1200 x double], [1200 x double]* %237, i64 %239
  %241 = load i32, i32* %15, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [1200 x double], [1200 x double]* %240, i64 0, i64 %242
  %244 = load double, double* %243, align 8
  %245 = load [1200 x double]*, [1200 x double]** %11, align 8
  %246 = load i32, i32* %17, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [1200 x double], [1200 x double]* %245, i64 %247
  %249 = load i32, i32* %16, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [1200 x double], [1200 x double]* %248, i64 0, i64 %250
  %252 = load double, double* %251, align 8
  %253 = fmul double %244, %252
  %254 = load [1200 x double]*, [1200 x double]** %12, align 8
  %255 = load i32, i32* %15, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [1200 x double], [1200 x double]* %254, i64 %256
  %258 = load i32, i32* %16, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds [1200 x double], [1200 x double]* %257, i64 0, i64 %259
  %261 = load double, double* %260, align 8
  %262 = fadd double %261, %253
  store double %262, double* %260, align 8
  br label %263

; <label>:263:                                    ; preds = %236
  %264 = load i32, i32* %17, align 4
  %265 = add nsw i32 %264, 1
  store i32 %265, i32* %17, align 4
  br label %232

; <label>:266:                                    ; preds = %232
  %267 = load [1200 x double]*, [1200 x double]** %12, align 8
  %268 = load i32, i32* %15, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds [1200 x double], [1200 x double]* %267, i64 %269
  %271 = load i32, i32* %16, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [1200 x double], [1200 x double]* %270, i64 0, i64 %272
  %274 = load double, double* %273, align 8
  %275 = load [1200 x double]*, [1200 x double]** %12, align 8
  %276 = load i32, i32* %16, align 4
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [1200 x double], [1200 x double]* %275, i64 %277
  %279 = load i32, i32* %15, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [1200 x double], [1200 x double]* %278, i64 0, i64 %280
  store double %274, double* %281, align 8
  br label %282

; <label>:282:                                    ; preds = %266
  %283 = load i32, i32* %16, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, i32* %16, align 4
  br label %220

; <label>:285:                                    ; preds = %220
  br label %286

; <label>:286:                                    ; preds = %285
  %287 = load i32, i32* %15, align 4
  %288 = add nsw i32 %287, 1
  store i32 %288, i32* %15, align 4
  br label %205

; <label>:289:                                    ; preds = %205
  %290 = load [1200 x double]*, [1200 x double]** %12, align 8
  %291 = load i32, i32* %8, align 4
  %292 = sub nsw i32 %291, 1
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds [1200 x double], [1200 x double]* %290, i64 %293
  %295 = load i32, i32* %8, align 4
  %296 = sub nsw i32 %295, 1
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [1200 x double], [1200 x double]* %294, i64 0, i64 %297
  store double 1.000000e+00, double* %298, align 8
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
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
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
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
