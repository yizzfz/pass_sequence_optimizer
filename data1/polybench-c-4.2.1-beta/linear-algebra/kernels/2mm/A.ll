; ModuleID = '2mm.c'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
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
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [800 x [900 x double]]*, align 8
  %13 = alloca [800 x [1100 x double]]*, align 8
  %14 = alloca [1100 x [900 x double]]*, align 8
  %15 = alloca [900 x [1200 x double]]*, align 8
  %16 = alloca [800 x [1200 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 800, i32* %6, align 4
  store i32 900, i32* %7, align 4
  store i32 1100, i32* %8, align 4
  store i32 1200, i32* %9, align 4
  %17 = call i8* @polybench_alloc_data(i64 720000, i32 8)
  %18 = bitcast i8* %17 to [800 x [900 x double]]*
  store [800 x [900 x double]]* %18, [800 x [900 x double]]** %12, align 8
  %19 = call i8* @polybench_alloc_data(i64 880000, i32 8)
  %20 = bitcast i8* %19 to [800 x [1100 x double]]*
  store [800 x [1100 x double]]* %20, [800 x [1100 x double]]** %13, align 8
  %21 = call i8* @polybench_alloc_data(i64 990000, i32 8)
  %22 = bitcast i8* %21 to [1100 x [900 x double]]*
  store [1100 x [900 x double]]* %22, [1100 x [900 x double]]** %14, align 8
  %23 = call i8* @polybench_alloc_data(i64 1080000, i32 8)
  %24 = bitcast i8* %23 to [900 x [1200 x double]]*
  store [900 x [1200 x double]]* %24, [900 x [1200 x double]]** %15, align 8
  %25 = call i8* @polybench_alloc_data(i64 960000, i32 8)
  %26 = bitcast i8* %25 to [800 x [1200 x double]]*
  store [800 x [1200 x double]]* %26, [800 x [1200 x double]]** %16, align 8
  %27 = load i32, i32* %6, align 4
  %28 = load i32, i32* %7, align 4
  %29 = load i32, i32* %8, align 4
  %30 = load i32, i32* %9, align 4
  %31 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %13, align 8
  %32 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %31, i32 0, i32 0
  %33 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %14, align 8
  %34 = getelementptr inbounds [1100 x [900 x double]], [1100 x [900 x double]]* %33, i32 0, i32 0
  %35 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %15, align 8
  %36 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %35, i32 0, i32 0
  %37 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %16, align 8
  %38 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %37, i32 0, i32 0
  call void @init_array(i32 %27, i32 %28, i32 %29, i32 %30, double* %10, double* %11, [1100 x double]* %32, [900 x double]* %34, [1200 x double]* %36, [1200 x double]* %38)
  call void (...) @polybench_timer_start()
  %39 = load i32, i32* %6, align 4
  %40 = load i32, i32* %7, align 4
  %41 = load i32, i32* %8, align 4
  %42 = load i32, i32* %9, align 4
  %43 = load double, double* %10, align 8
  %44 = load double, double* %11, align 8
  %45 = load [800 x [900 x double]]*, [800 x [900 x double]]** %12, align 8
  %46 = getelementptr inbounds [800 x [900 x double]], [800 x [900 x double]]* %45, i32 0, i32 0
  %47 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %13, align 8
  %48 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %47, i32 0, i32 0
  %49 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %14, align 8
  %50 = getelementptr inbounds [1100 x [900 x double]], [1100 x [900 x double]]* %49, i32 0, i32 0
  %51 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %15, align 8
  %52 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %51, i32 0, i32 0
  %53 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %16, align 8
  %54 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %53, i32 0, i32 0
  call void @kernel_2mm(i32 %39, i32 %40, i32 %41, i32 %42, double %43, double %44, [900 x double]* %46, [1100 x double]* %48, [900 x double]* %50, [1200 x double]* %52, [1200 x double]* %54)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %55 = load i32, i32* %4, align 4
  %56 = icmp sgt i32 %55, 42
  br i1 %56, label %57, label %68

; <label>:57:                                     ; preds = %2
  %58 = load i8**, i8*** %5, align 8
  %59 = getelementptr inbounds i8*, i8** %58, i64 0
  %60 = load i8*, i8** %59, align 8
  %61 = call i32 @strcmp(i8* %60, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %68, label %63

; <label>:63:                                     ; preds = %57
  %64 = load i32, i32* %6, align 4
  %65 = load i32, i32* %9, align 4
  %66 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %16, align 8
  %67 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %66, i32 0, i32 0
  call void @print_array(i32 %64, i32 %65, [1200 x double]* %67)
  br label %68

; <label>:68:                                     ; preds = %63, %57, %2
  %69 = load [800 x [900 x double]]*, [800 x [900 x double]]** %12, align 8
  %70 = bitcast [800 x [900 x double]]* %69 to i8*
  call void @free(i8* %70) #5
  %71 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %13, align 8
  %72 = bitcast [800 x [1100 x double]]* %71 to i8*
  call void @free(i8* %72) #5
  %73 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %14, align 8
  %74 = bitcast [1100 x [900 x double]]* %73 to i8*
  call void @free(i8* %74) #5
  %75 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %15, align 8
  %76 = bitcast [900 x [1200 x double]]* %75 to i8*
  call void @free(i8* %76) #5
  %77 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %16, align 8
  %78 = bitcast [800 x [1200 x double]]* %77 to i8*
  call void @free(i8* %78) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, double*, double*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca [1100 x double]*, align 8
  %18 = alloca [900 x double]*, align 8
  %19 = alloca [1200 x double]*, align 8
  %20 = alloca [1200 x double]*, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store i32 %0, i32* %11, align 4
  store i32 %1, i32* %12, align 4
  store i32 %2, i32* %13, align 4
  store i32 %3, i32* %14, align 4
  store double* %4, double** %15, align 8
  store double* %5, double** %16, align 8
  store [1100 x double]* %6, [1100 x double]** %17, align 8
  store [900 x double]* %7, [900 x double]** %18, align 8
  store [1200 x double]* %8, [1200 x double]** %19, align 8
  store [1200 x double]* %9, [1200 x double]** %20, align 8
  %23 = load double*, double** %15, align 8
  store double 1.500000e+00, double* %23, align 8
  %24 = load double*, double** %16, align 8
  store double 1.200000e+00, double* %24, align 8
  store i32 0, i32* %21, align 4
  br label %25

; <label>:25:                                     ; preds = %56, %10
  %26 = load i32, i32* %21, align 4
  %27 = load i32, i32* %11, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %59

; <label>:29:                                     ; preds = %25
  store i32 0, i32* %22, align 4
  br label %30

; <label>:30:                                     ; preds = %52, %29
  %31 = load i32, i32* %22, align 4
  %32 = load i32, i32* %13, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %55

; <label>:34:                                     ; preds = %30
  %35 = load i32, i32* %21, align 4
  %36 = load i32, i32* %22, align 4
  %37 = mul nsw i32 %35, %36
  %38 = add nsw i32 %37, 1
  %39 = load i32, i32* %11, align 4
  %40 = srem i32 %38, %39
  %41 = sitofp i32 %40 to double
  %42 = load i32, i32* %11, align 4
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %41, %43
  %45 = load [1100 x double]*, [1100 x double]** %17, align 8
  %46 = load i32, i32* %21, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %45, i64 %47
  %49 = load i32, i32* %22, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %48, i64 0, i64 %50
  store double %44, double* %51, align 8
  br label %52

; <label>:52:                                     ; preds = %34
  %53 = load i32, i32* %22, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %22, align 4
  br label %30

; <label>:55:                                     ; preds = %30
  br label %56

; <label>:56:                                     ; preds = %55
  %57 = load i32, i32* %21, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %21, align 4
  br label %25

; <label>:59:                                     ; preds = %25
  store i32 0, i32* %21, align 4
  br label %60

; <label>:60:                                     ; preds = %91, %59
  %61 = load i32, i32* %21, align 4
  %62 = load i32, i32* %13, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %64, label %94

; <label>:64:                                     ; preds = %60
  store i32 0, i32* %22, align 4
  br label %65

; <label>:65:                                     ; preds = %87, %64
  %66 = load i32, i32* %22, align 4
  %67 = load i32, i32* %12, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %90

; <label>:69:                                     ; preds = %65
  %70 = load i32, i32* %21, align 4
  %71 = load i32, i32* %22, align 4
  %72 = add nsw i32 %71, 1
  %73 = mul nsw i32 %70, %72
  %74 = load i32, i32* %12, align 4
  %75 = srem i32 %73, %74
  %76 = sitofp i32 %75 to double
  %77 = load i32, i32* %12, align 4
  %78 = sitofp i32 %77 to double
  %79 = fdiv double %76, %78
  %80 = load [900 x double]*, [900 x double]** %18, align 8
  %81 = load i32, i32* %21, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [900 x double], [900 x double]* %80, i64 %82
  %84 = load i32, i32* %22, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [900 x double], [900 x double]* %83, i64 0, i64 %85
  store double %79, double* %86, align 8
  br label %87

; <label>:87:                                     ; preds = %69
  %88 = load i32, i32* %22, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %22, align 4
  br label %65

; <label>:90:                                     ; preds = %65
  br label %91

; <label>:91:                                     ; preds = %90
  %92 = load i32, i32* %21, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %21, align 4
  br label %60

; <label>:94:                                     ; preds = %60
  store i32 0, i32* %21, align 4
  br label %95

; <label>:95:                                     ; preds = %127, %94
  %96 = load i32, i32* %21, align 4
  %97 = load i32, i32* %12, align 4
  %98 = icmp slt i32 %96, %97
  br i1 %98, label %99, label %130

; <label>:99:                                     ; preds = %95
  store i32 0, i32* %22, align 4
  br label %100

; <label>:100:                                    ; preds = %123, %99
  %101 = load i32, i32* %22, align 4
  %102 = load i32, i32* %14, align 4
  %103 = icmp slt i32 %101, %102
  br i1 %103, label %104, label %126

; <label>:104:                                    ; preds = %100
  %105 = load i32, i32* %21, align 4
  %106 = load i32, i32* %22, align 4
  %107 = add nsw i32 %106, 3
  %108 = mul nsw i32 %105, %107
  %109 = add nsw i32 %108, 1
  %110 = load i32, i32* %14, align 4
  %111 = srem i32 %109, %110
  %112 = sitofp i32 %111 to double
  %113 = load i32, i32* %14, align 4
  %114 = sitofp i32 %113 to double
  %115 = fdiv double %112, %114
  %116 = load [1200 x double]*, [1200 x double]** %19, align 8
  %117 = load i32, i32* %21, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %116, i64 %118
  %120 = load i32, i32* %22, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %119, i64 0, i64 %121
  store double %115, double* %122, align 8
  br label %123

; <label>:123:                                    ; preds = %104
  %124 = load i32, i32* %22, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %22, align 4
  br label %100

; <label>:126:                                    ; preds = %100
  br label %127

; <label>:127:                                    ; preds = %126
  %128 = load i32, i32* %21, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %21, align 4
  br label %95

; <label>:130:                                    ; preds = %95
  store i32 0, i32* %21, align 4
  br label %131

; <label>:131:                                    ; preds = %162, %130
  %132 = load i32, i32* %21, align 4
  %133 = load i32, i32* %11, align 4
  %134 = icmp slt i32 %132, %133
  br i1 %134, label %135, label %165

; <label>:135:                                    ; preds = %131
  store i32 0, i32* %22, align 4
  br label %136

; <label>:136:                                    ; preds = %158, %135
  %137 = load i32, i32* %22, align 4
  %138 = load i32, i32* %14, align 4
  %139 = icmp slt i32 %137, %138
  br i1 %139, label %140, label %161

; <label>:140:                                    ; preds = %136
  %141 = load i32, i32* %21, align 4
  %142 = load i32, i32* %22, align 4
  %143 = add nsw i32 %142, 2
  %144 = mul nsw i32 %141, %143
  %145 = load i32, i32* %13, align 4
  %146 = srem i32 %144, %145
  %147 = sitofp i32 %146 to double
  %148 = load i32, i32* %13, align 4
  %149 = sitofp i32 %148 to double
  %150 = fdiv double %147, %149
  %151 = load [1200 x double]*, [1200 x double]** %20, align 8
  %152 = load i32, i32* %21, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %151, i64 %153
  %155 = load i32, i32* %22, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %154, i64 0, i64 %156
  store double %150, double* %157, align 8
  br label %158

; <label>:158:                                    ; preds = %140
  %159 = load i32, i32* %22, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, i32* %22, align 4
  br label %136

; <label>:161:                                    ; preds = %136
  br label %162

; <label>:162:                                    ; preds = %161
  %163 = load i32, i32* %21, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %21, align 4
  br label %131

; <label>:165:                                    ; preds = %131
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca [900 x double]*, align 8
  %19 = alloca [1100 x double]*, align 8
  %20 = alloca [900 x double]*, align 8
  %21 = alloca [1200 x double]*, align 8
  %22 = alloca [1200 x double]*, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store i32 %0, i32* %12, align 4
  store i32 %1, i32* %13, align 4
  store i32 %2, i32* %14, align 4
  store i32 %3, i32* %15, align 4
  store double %4, double* %16, align 8
  store double %5, double* %17, align 8
  store [900 x double]* %6, [900 x double]** %18, align 8
  store [1100 x double]* %7, [1100 x double]** %19, align 8
  store [900 x double]* %8, [900 x double]** %20, align 8
  store [1200 x double]* %9, [1200 x double]** %21, align 8
  store [1200 x double]* %10, [1200 x double]** %22, align 8
  store i32 0, i32* %23, align 4
  br label %26

; <label>:26:                                     ; preds = %84, %11
  %27 = load i32, i32* %23, align 4
  %28 = load i32, i32* %12, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %87

; <label>:30:                                     ; preds = %26
  store i32 0, i32* %24, align 4
  br label %31

; <label>:31:                                     ; preds = %80, %30
  %32 = load i32, i32* %24, align 4
  %33 = load i32, i32* %13, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %83

; <label>:35:                                     ; preds = %31
  %36 = load [900 x double]*, [900 x double]** %18, align 8
  %37 = load i32, i32* %23, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [900 x double], [900 x double]* %36, i64 %38
  %40 = load i32, i32* %24, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [900 x double], [900 x double]* %39, i64 0, i64 %41
  store double 0.000000e+00, double* %42, align 8
  store i32 0, i32* %25, align 4
  br label %43

; <label>:43:                                     ; preds = %76, %35
  %44 = load i32, i32* %25, align 4
  %45 = load i32, i32* %14, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %79

; <label>:47:                                     ; preds = %43
  %48 = load double, double* %16, align 8
  %49 = load [1100 x double]*, [1100 x double]** %19, align 8
  %50 = load i32, i32* %23, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %49, i64 %51
  %53 = load i32, i32* %25, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %52, i64 0, i64 %54
  %56 = load double, double* %55, align 8
  %57 = fmul double %48, %56
  %58 = load [900 x double]*, [900 x double]** %20, align 8
  %59 = load i32, i32* %25, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [900 x double], [900 x double]* %58, i64 %60
  %62 = load i32, i32* %24, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [900 x double], [900 x double]* %61, i64 0, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fmul double %57, %65
  %67 = load [900 x double]*, [900 x double]** %18, align 8
  %68 = load i32, i32* %23, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [900 x double], [900 x double]* %67, i64 %69
  %71 = load i32, i32* %24, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [900 x double], [900 x double]* %70, i64 0, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %66
  store double %75, double* %73, align 8
  br label %76

; <label>:76:                                     ; preds = %47
  %77 = load i32, i32* %25, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %25, align 4
  br label %43

; <label>:79:                                     ; preds = %43
  br label %80

; <label>:80:                                     ; preds = %79
  %81 = load i32, i32* %24, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %24, align 4
  br label %31

; <label>:83:                                     ; preds = %31
  br label %84

; <label>:84:                                     ; preds = %83
  %85 = load i32, i32* %23, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %23, align 4
  br label %26

; <label>:87:                                     ; preds = %26
  store i32 0, i32* %23, align 4
  br label %88

; <label>:88:                                     ; preds = %147, %87
  %89 = load i32, i32* %23, align 4
  %90 = load i32, i32* %12, align 4
  %91 = icmp slt i32 %89, %90
  br i1 %91, label %92, label %150

; <label>:92:                                     ; preds = %88
  store i32 0, i32* %24, align 4
  br label %93

; <label>:93:                                     ; preds = %143, %92
  %94 = load i32, i32* %24, align 4
  %95 = load i32, i32* %15, align 4
  %96 = icmp slt i32 %94, %95
  br i1 %96, label %97, label %146

; <label>:97:                                     ; preds = %93
  %98 = load double, double* %17, align 8
  %99 = load [1200 x double]*, [1200 x double]** %22, align 8
  %100 = load i32, i32* %23, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %99, i64 %101
  %103 = load i32, i32* %24, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %102, i64 0, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, %98
  store double %107, double* %105, align 8
  store i32 0, i32* %25, align 4
  br label %108

; <label>:108:                                    ; preds = %139, %97
  %109 = load i32, i32* %25, align 4
  %110 = load i32, i32* %13, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %142

; <label>:112:                                    ; preds = %108
  %113 = load [900 x double]*, [900 x double]** %18, align 8
  %114 = load i32, i32* %23, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [900 x double], [900 x double]* %113, i64 %115
  %117 = load i32, i32* %25, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [900 x double], [900 x double]* %116, i64 0, i64 %118
  %120 = load double, double* %119, align 8
  %121 = load [1200 x double]*, [1200 x double]** %21, align 8
  %122 = load i32, i32* %25, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %121, i64 %123
  %125 = load i32, i32* %24, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %124, i64 0, i64 %126
  %128 = load double, double* %127, align 8
  %129 = fmul double %120, %128
  %130 = load [1200 x double]*, [1200 x double]** %22, align 8
  %131 = load i32, i32* %23, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %130, i64 %132
  %134 = load i32, i32* %24, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %133, i64 0, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fadd double %137, %129
  store double %138, double* %136, align 8
  br label %139

; <label>:139:                                    ; preds = %112
  %140 = load i32, i32* %25, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* %25, align 4
  br label %108

; <label>:142:                                    ; preds = %108
  br label %143

; <label>:143:                                    ; preds = %142
  %144 = load i32, i32* %24, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, i32* %24, align 4
  br label %93

; <label>:146:                                    ; preds = %93
  br label %147

; <label>:147:                                    ; preds = %146
  %148 = load i32, i32* %23, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %23, align 4
  br label %88

; <label>:150:                                    ; preds = %88
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
