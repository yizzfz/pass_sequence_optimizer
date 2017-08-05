; ModuleID = 'B.ll'
source_filename = "jacobi-2d.c"
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

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1300 x [1300 x double]]*, align 8
  %9 = alloca [1300 x [1300 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1300, i32* %6, align 4
  store i32 500, i32* %7, align 4
  %10 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %11 = bitcast i8* %10 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %11, [1300 x [1300 x double]]** %8, align 8
  %12 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %13 = bitcast i8* %12 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %13, [1300 x [1300 x double]]** %9, align 8
  %14 = load i32, i32* %6, align 4
  %15 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %8, align 8
  %16 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %15, i32 0, i32 0
  %17 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %18 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %17, i32 0, i32 0
  call void @init_array(i32 %14, [1300 x double]* %16, [1300 x double]* %18)
  call void (...) @polybench_timer_start()
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %6, align 4
  %21 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %8, align 8
  %22 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %21, i32 0, i32 0
  %23 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %24 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %23, i32 0, i32 0
  call void @kernel_jacobi_2d(i32 %19, i32 %20, [1300 x double]* %22, [1300 x double]* %24)
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
  %35 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %8, align 8
  %36 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %35, i32 0, i32 0
  call void @print_array(i32 %34, [1300 x double]* %36)
  br label %37

; <label>:37:                                     ; preds = %33, %27, %2
  %38 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %8, align 8
  %39 = bitcast [1300 x [1300 x double]]* %38 to i8*
  call void @free(i8* %39) #5
  %40 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %41 = bitcast [1300 x [1300 x double]]* %40 to i8*
  call void @free(i8* %41) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: nounwind uwtable
define internal void @init_array(i32, [1300 x double]*, [1300 x double]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca [1300 x double]*, align 8
  %6 = alloca [1300 x double]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store [1300 x double]* %1, [1300 x double]** %5, align 8
  store [1300 x double]* %2, [1300 x double]** %6, align 8
  store i32 0, i32* %7, align 4
  br label %9

; <label>:9:                                      ; preds = %57, %3
  %10 = load i32, i32* %7, align 4
  %11 = load i32, i32* %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %60

; <label>:13:                                     ; preds = %9
  store i32 0, i32* %8, align 4
  br label %14

; <label>:14:                                     ; preds = %53, %13
  %15 = load i32, i32* %8, align 4
  %16 = load i32, i32* %4, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %56

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %7, align 4
  %20 = sitofp i32 %19 to double
  %21 = load i32, i32* %8, align 4
  %22 = add nsw i32 %21, 2
  %23 = sitofp i32 %22 to double
  %24 = fmul double %20, %23
  %25 = fadd double %24, 2.000000e+00
  %26 = load i32, i32* %4, align 4
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %25, %27
  %29 = load [1300 x double]*, [1300 x double]** %5, align 8
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %29, i64 %31
  %33 = load i32, i32* %8, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1300 x double], [1300 x double]* %32, i64 0, i64 %34
  store double %28, double* %35, align 8
  %36 = load i32, i32* %7, align 4
  %37 = sitofp i32 %36 to double
  %38 = load i32, i32* %8, align 4
  %39 = add nsw i32 %38, 3
  %40 = sitofp i32 %39 to double
  %41 = fmul double %37, %40
  %42 = fadd double %41, 3.000000e+00
  %43 = load i32, i32* %4, align 4
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %42, %44
  %46 = load [1300 x double]*, [1300 x double]** %6, align 8
  %47 = load i32, i32* %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %46, i64 %48
  %50 = load i32, i32* %8, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %49, i64 0, i64 %51
  store double %45, double* %52, align 8
  br label %53

; <label>:53:                                     ; preds = %18
  %54 = load i32, i32* %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %8, align 4
  br label %14

; <label>:56:                                     ; preds = %14
  br label %57

; <label>:57:                                     ; preds = %56
  %58 = load i32, i32* %7, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %7, align 4
  br label %9

; <label>:60:                                     ; preds = %9
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: nounwind uwtable
define internal void @kernel_jacobi_2d(i32, i32, [1300 x double]*, [1300 x double]*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1300 x double]*, align 8
  %8 = alloca [1300 x double]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [1300 x double]* %2, [1300 x double]** %7, align 8
  store [1300 x double]* %3, [1300 x double]** %8, align 8
  store i32 0, i32* %9, align 4
  br label %12

; <label>:12:                                     ; preds = %169, %4
  %13 = load i32, i32* %9, align 4
  %14 = load i32, i32* %5, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %172

; <label>:16:                                     ; preds = %12
  store i32 1, i32* %10, align 4
  br label %17

; <label>:17:                                     ; preds = %89, %16
  %18 = load i32, i32* %10, align 4
  %19 = load i32, i32* %6, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp slt i32 %18, %20
  br i1 %21, label %22, label %92

; <label>:22:                                     ; preds = %17
  store i32 1, i32* %11, align 4
  br label %23

; <label>:23:                                     ; preds = %85, %22
  %24 = load i32, i32* %11, align 4
  %25 = load i32, i32* %6, align 4
  %26 = sub nsw i32 %25, 1
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %28, label %88

; <label>:28:                                     ; preds = %23
  %29 = load [1300 x double]*, [1300 x double]** %7, align 8
  %30 = load i32, i32* %10, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %29, i64 %31
  %33 = load i32, i32* %11, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1300 x double], [1300 x double]* %32, i64 0, i64 %34
  %36 = load double, double* %35, align 8
  %37 = load [1300 x double]*, [1300 x double]** %7, align 8
  %38 = load i32, i32* %10, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %37, i64 %39
  %41 = load i32, i32* %11, align 4
  %42 = sub nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %40, i64 0, i64 %43
  %45 = load double, double* %44, align 8
  %46 = fadd double %36, %45
  %47 = load [1300 x double]*, [1300 x double]** %7, align 8
  %48 = load i32, i32* %10, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %47, i64 %49
  %51 = load i32, i32* %11, align 4
  %52 = add nsw i32 1, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %50, i64 0, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %46, %55
  %57 = load [1300 x double]*, [1300 x double]** %7, align 8
  %58 = load i32, i32* %10, align 4
  %59 = add nsw i32 1, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %57, i64 %60
  %62 = load i32, i32* %11, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %61, i64 0, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %56, %65
  %67 = load [1300 x double]*, [1300 x double]** %7, align 8
  %68 = load i32, i32* %10, align 4
  %69 = sub nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1300 x double], [1300 x double]* %67, i64 %70
  %72 = load i32, i32* %11, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %71, i64 0, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %66, %75
  %77 = fmul double 2.000000e-01, %76
  %78 = load [1300 x double]*, [1300 x double]** %8, align 8
  %79 = load i32, i32* %10, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [1300 x double], [1300 x double]* %78, i64 %80
  %82 = load i32, i32* %11, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [1300 x double], [1300 x double]* %81, i64 0, i64 %83
  store double %77, double* %84, align 8
  br label %85

; <label>:85:                                     ; preds = %28
  %86 = load i32, i32* %11, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %11, align 4
  br label %23

; <label>:88:                                     ; preds = %23
  br label %89

; <label>:89:                                     ; preds = %88
  %90 = load i32, i32* %10, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %10, align 4
  br label %17

; <label>:92:                                     ; preds = %17
  store i32 1, i32* %10, align 4
  br label %93

; <label>:93:                                     ; preds = %165, %92
  %94 = load i32, i32* %10, align 4
  %95 = load i32, i32* %6, align 4
  %96 = sub nsw i32 %95, 1
  %97 = icmp slt i32 %94, %96
  br i1 %97, label %98, label %168

; <label>:98:                                     ; preds = %93
  store i32 1, i32* %11, align 4
  br label %99

; <label>:99:                                     ; preds = %161, %98
  %100 = load i32, i32* %11, align 4
  %101 = load i32, i32* %6, align 4
  %102 = sub nsw i32 %101, 1
  %103 = icmp slt i32 %100, %102
  br i1 %103, label %104, label %164

; <label>:104:                                    ; preds = %99
  %105 = load [1300 x double]*, [1300 x double]** %8, align 8
  %106 = load i32, i32* %10, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [1300 x double], [1300 x double]* %105, i64 %107
  %109 = load i32, i32* %11, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [1300 x double], [1300 x double]* %108, i64 0, i64 %110
  %112 = load double, double* %111, align 8
  %113 = load [1300 x double]*, [1300 x double]** %8, align 8
  %114 = load i32, i32* %10, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [1300 x double], [1300 x double]* %113, i64 %115
  %117 = load i32, i32* %11, align 4
  %118 = sub nsw i32 %117, 1
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [1300 x double], [1300 x double]* %116, i64 0, i64 %119
  %121 = load double, double* %120, align 8
  %122 = fadd double %112, %121
  %123 = load [1300 x double]*, [1300 x double]** %8, align 8
  %124 = load i32, i32* %10, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [1300 x double], [1300 x double]* %123, i64 %125
  %127 = load i32, i32* %11, align 4
  %128 = add nsw i32 1, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [1300 x double], [1300 x double]* %126, i64 0, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fadd double %122, %131
  %133 = load [1300 x double]*, [1300 x double]** %8, align 8
  %134 = load i32, i32* %10, align 4
  %135 = add nsw i32 1, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [1300 x double], [1300 x double]* %133, i64 %136
  %138 = load i32, i32* %11, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [1300 x double], [1300 x double]* %137, i64 0, i64 %139
  %141 = load double, double* %140, align 8
  %142 = fadd double %132, %141
  %143 = load [1300 x double]*, [1300 x double]** %8, align 8
  %144 = load i32, i32* %10, align 4
  %145 = sub nsw i32 %144, 1
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [1300 x double], [1300 x double]* %143, i64 %146
  %148 = load i32, i32* %11, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [1300 x double], [1300 x double]* %147, i64 0, i64 %149
  %151 = load double, double* %150, align 8
  %152 = fadd double %142, %151
  %153 = fmul double 2.000000e-01, %152
  %154 = load [1300 x double]*, [1300 x double]** %7, align 8
  %155 = load i32, i32* %10, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [1300 x double], [1300 x double]* %154, i64 %156
  %158 = load i32, i32* %11, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [1300 x double], [1300 x double]* %157, i64 0, i64 %159
  store double %153, double* %160, align 8
  br label %161

; <label>:161:                                    ; preds = %104
  %162 = load i32, i32* %11, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %11, align 4
  br label %99

; <label>:164:                                    ; preds = %99
  br label %165

; <label>:165:                                    ; preds = %164
  %166 = load i32, i32* %10, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %10, align 4
  br label %93

; <label>:168:                                    ; preds = %93
  br label %169

; <label>:169:                                    ; preds = %168
  %170 = load i32, i32* %9, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %9, align 4
  br label %12

; <label>:172:                                    ; preds = %12
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define internal void @print_array(i32, [1300 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1300 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1300 x double]* %1, [1300 x double]** %4, align 8
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
  %33 = load [1300 x double]*, [1300 x double]** %4, align 8
  %34 = load i32, i32* %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1300 x double], [1300 x double]* %33, i64 %35
  %37 = load i32, i32* %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %36, i64 0, i64 %38
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
