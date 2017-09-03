; ModuleID = 'B.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_gemm = private constant [16 x i8] c"B.ll:kernel_gemm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 138796785053, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_gemm = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_gemm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5961606765684520061, i64 96569690461, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_gemm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_gemm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca [1000 x [1100 x double]]*, align 8
  %12 = alloca [1000 x [1200 x double]]*, align 8
  %13 = alloca [1200 x [1100 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1000, i32* %6, align 4
  store i32 1100, i32* %7, align 4
  store i32 1200, i32* %8, align 4
  %14 = call i8* @polybench_alloc_data(i64 1100000, i32 8)
  %15 = bitcast i8* %14 to [1000 x [1100 x double]]*
  store [1000 x [1100 x double]]* %15, [1000 x [1100 x double]]** %11, align 8
  %16 = call i8* @polybench_alloc_data(i64 1200000, i32 8)
  %17 = bitcast i8* %16 to [1000 x [1200 x double]]*
  store [1000 x [1200 x double]]* %17, [1000 x [1200 x double]]** %12, align 8
  %18 = call i8* @polybench_alloc_data(i64 1320000, i32 8)
  %19 = bitcast i8* %18 to [1200 x [1100 x double]]*
  store [1200 x [1100 x double]]* %19, [1200 x [1100 x double]]** %13, align 8
  %20 = load i32, i32* %6, align 4
  %21 = load i32, i32* %7, align 4
  %22 = load i32, i32* %8, align 4
  %23 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %11, align 8
  %24 = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %23, i32 0, i32 0
  %25 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %26 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %25, i32 0, i32 0
  %27 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %13, align 8
  %28 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %27, i32 0, i32 0
  call void @init_array(i32 %20, i32 %21, i32 %22, double* %9, double* %10, [1100 x double]* %24, [1200 x double]* %26, [1100 x double]* %28)
  call void (...) @polybench_timer_start()
  %29 = load i32, i32* %6, align 4
  %30 = load i32, i32* %7, align 4
  %31 = load i32, i32* %8, align 4
  %32 = load double, double* %9, align 8
  %33 = load double, double* %10, align 8
  %34 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %11, align 8
  %35 = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %34, i32 0, i32 0
  %36 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %37 = getelementptr inbounds [1000 x [1200 x double]], [1000 x [1200 x double]]* %36, i32 0, i32 0
  %38 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %13, align 8
  %39 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %38, i32 0, i32 0
  call void @kernel_gemm(i32 %29, i32 %30, i32 %31, double %32, double %33, [1100 x double]* %35, [1200 x double]* %37, [1100 x double]* %39)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %40 = load i32, i32* %4, align 4
  %41 = icmp sgt i32 %40, 42
  br i1 %41, label %42, label %55

; <label>:42:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %44 = load i8**, i8*** %5, align 8
  %45 = getelementptr inbounds i8*, i8** %44, i64 0
  %46 = load i8*, i8** %45, align 8
  %47 = call i32 @strcmp(i8* %46, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %55, label %49

; <label>:49:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %51 = load i32, i32* %6, align 4
  %52 = load i32, i32* %7, align 4
  %53 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %11, align 8
  %54 = getelementptr inbounds [1000 x [1100 x double]], [1000 x [1100 x double]]* %53, i32 0, i32 0
  call void @print_array(i32 %51, i32 %52, [1100 x double]* %54)
  br label %55

; <label>:55:                                     ; preds = %49, %42, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %57 = load [1000 x [1100 x double]]*, [1000 x [1100 x double]]** %11, align 8
  %58 = bitcast [1000 x [1100 x double]]* %57 to i8*
  call void @free(i8* %58) #4
  %59 = load [1000 x [1200 x double]]*, [1000 x [1200 x double]]** %12, align 8
  %60 = bitcast [1000 x [1200 x double]]* %59 to i8*
  call void @free(i8* %60) #4
  %61 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %13, align 8
  %62 = bitcast [1200 x [1100 x double]]* %61 to i8*
  call void @free(i8* %62) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, double*, double*, [1100 x double]*, [1200 x double]*, [1100 x double]*) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double*, align 8
  %13 = alloca double*, align 8
  %14 = alloca [1100 x double]*, align 8
  %15 = alloca [1200 x double]*, align 8
  %16 = alloca [1100 x double]*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store i32 %1, i32* %10, align 4
  store i32 %2, i32* %11, align 4
  store double* %3, double** %12, align 8
  store double* %4, double** %13, align 8
  store [1100 x double]* %5, [1100 x double]** %14, align 8
  store [1200 x double]* %6, [1200 x double]** %15, align 8
  store [1100 x double]* %7, [1100 x double]** %16, align 8
  %19 = load double*, double** %12, align 8
  store double 1.500000e+00, double* %19, align 8
  %20 = load double*, double** %13, align 8
  store double 1.200000e+00, double* %20, align 8
  store i32 0, i32* %17, align 4
  br label %21

; <label>:21:                                     ; preds = %53, %8
  %22 = load i32, i32* %17, align 4
  %23 = load i32, i32* %9, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %57

; <label>:25:                                     ; preds = %21
  store i32 0, i32* %18, align 4
  br label %26

; <label>:26:                                     ; preds = %48, %25
  %27 = load i32, i32* %18, align 4
  %28 = load i32, i32* %10, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %52

; <label>:30:                                     ; preds = %26
  %31 = load i32, i32* %17, align 4
  %32 = load i32, i32* %18, align 4
  %33 = mul nsw i32 %31, %32
  %34 = add nsw i32 %33, 1
  %35 = load i32, i32* %9, align 4
  %36 = srem i32 %34, %35
  %37 = sitofp i32 %36 to double
  %38 = load i32, i32* %9, align 4
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %37, %39
  %41 = load [1100 x double]*, [1100 x double]** %14, align 8
  %42 = load i32, i32* %17, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %41, i64 %43
  %45 = load i32, i32* %18, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %44, i64 0, i64 %46
  store double %40, double* %47, align 8
  br label %48

; <label>:48:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %49 = add i64 %pgocount, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %50 = load i32, i32* %18, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %18, align 4
  br label %26

; <label>:52:                                     ; preds = %26
  br label %53

; <label>:53:                                     ; preds = %52
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %55 = load i32, i32* %17, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %17, align 4
  br label %21

; <label>:57:                                     ; preds = %21
  store i32 0, i32* %17, align 4
  br label %58

; <label>:58:                                     ; preds = %90, %57
  %59 = load i32, i32* %17, align 4
  %60 = load i32, i32* %9, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %94

; <label>:62:                                     ; preds = %58
  store i32 0, i32* %18, align 4
  br label %63

; <label>:63:                                     ; preds = %85, %62
  %64 = load i32, i32* %18, align 4
  %65 = load i32, i32* %11, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %89

; <label>:67:                                     ; preds = %63
  %68 = load i32, i32* %17, align 4
  %69 = load i32, i32* %18, align 4
  %70 = add nsw i32 %69, 1
  %71 = mul nsw i32 %68, %70
  %72 = load i32, i32* %11, align 4
  %73 = srem i32 %71, %72
  %74 = sitofp i32 %73 to double
  %75 = load i32, i32* %11, align 4
  %76 = sitofp i32 %75 to double
  %77 = fdiv double %74, %76
  %78 = load [1200 x double]*, [1200 x double]** %15, align 8
  %79 = load i32, i32* %17, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %78, i64 %80
  %82 = load i32, i32* %18, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %81, i64 0, i64 %83
  store double %77, double* %84, align 8
  br label %85

; <label>:85:                                     ; preds = %67
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %87 = load i32, i32* %18, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %18, align 4
  br label %63

; <label>:89:                                     ; preds = %63
  br label %90

; <label>:90:                                     ; preds = %89
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %92 = load i32, i32* %17, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %17, align 4
  br label %58

; <label>:94:                                     ; preds = %58
  store i32 0, i32* %17, align 4
  br label %95

; <label>:95:                                     ; preds = %127, %94
  %96 = load i32, i32* %17, align 4
  %97 = load i32, i32* %11, align 4
  %98 = icmp slt i32 %96, %97
  br i1 %98, label %99, label %131

; <label>:99:                                     ; preds = %95
  store i32 0, i32* %18, align 4
  br label %100

; <label>:100:                                    ; preds = %122, %99
  %101 = load i32, i32* %18, align 4
  %102 = load i32, i32* %10, align 4
  %103 = icmp slt i32 %101, %102
  br i1 %103, label %104, label %126

; <label>:104:                                    ; preds = %100
  %105 = load i32, i32* %17, align 4
  %106 = load i32, i32* %18, align 4
  %107 = add nsw i32 %106, 2
  %108 = mul nsw i32 %105, %107
  %109 = load i32, i32* %10, align 4
  %110 = srem i32 %108, %109
  %111 = sitofp i32 %110 to double
  %112 = load i32, i32* %10, align 4
  %113 = sitofp i32 %112 to double
  %114 = fdiv double %111, %113
  %115 = load [1100 x double]*, [1100 x double]** %16, align 8
  %116 = load i32, i32* %17, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [1100 x double], [1100 x double]* %115, i64 %117
  %119 = load i32, i32* %18, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [1100 x double], [1100 x double]* %118, i64 0, i64 %120
  store double %114, double* %121, align 8
  br label %122

; <label>:122:                                    ; preds = %104
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %123 = add i64 %pgocount4, 1
  store i64 %123, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %124 = load i32, i32* %18, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %18, align 4
  br label %100

; <label>:126:                                    ; preds = %100
  br label %127

; <label>:127:                                    ; preds = %126
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %128 = add i64 %pgocount5, 1
  store i64 %128, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %129 = load i32, i32* %17, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %17, align 4
  br label %95

; <label>:131:                                    ; preds = %95
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %132 = add i64 %pgocount6, 1
  store i64 %132, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca [1100 x double]*, align 8
  %15 = alloca [1200 x double]*, align 8
  %16 = alloca [1100 x double]*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store i32 %1, i32* %10, align 4
  store i32 %2, i32* %11, align 4
  store double %3, double* %12, align 8
  store double %4, double* %13, align 8
  store [1100 x double]* %5, [1100 x double]** %14, align 8
  store [1200 x double]* %6, [1200 x double]** %15, align 8
  store [1100 x double]* %7, [1100 x double]** %16, align 8
  store i32 0, i32* %17, align 4
  br label %20

; <label>:20:                                     ; preds = %93, %8
  %21 = load i32, i32* %17, align 4
  %22 = load i32, i32* %9, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %97

; <label>:24:                                     ; preds = %20
  store i32 0, i32* %18, align 4
  br label %25

; <label>:25:                                     ; preds = %40, %24
  %26 = load i32, i32* %18, align 4
  %27 = load i32, i32* %10, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %44

; <label>:29:                                     ; preds = %25
  %30 = load double, double* %13, align 8
  %31 = load [1100 x double]*, [1100 x double]** %14, align 8
  %32 = load i32, i32* %17, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %31, i64 %33
  %35 = load i32, i32* %18, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %34, i64 0, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %30
  store double %39, double* %37, align 8
  br label %40

; <label>:40:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 1)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 1)
  %42 = load i32, i32* %18, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %18, align 4
  br label %25

; <label>:44:                                     ; preds = %25
  store i32 0, i32* %19, align 4
  br label %45

; <label>:45:                                     ; preds = %88, %44
  %46 = load i32, i32* %19, align 4
  %47 = load i32, i32* %11, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %92

; <label>:49:                                     ; preds = %45
  store i32 0, i32* %18, align 4
  br label %50

; <label>:50:                                     ; preds = %83, %49
  %51 = load i32, i32* %18, align 4
  %52 = load i32, i32* %10, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %87

; <label>:54:                                     ; preds = %50
  %55 = load double, double* %12, align 8
  %56 = load [1200 x double]*, [1200 x double]** %15, align 8
  %57 = load i32, i32* %17, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %56, i64 %58
  %60 = load i32, i32* %19, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %59, i64 0, i64 %61
  %63 = load double, double* %62, align 8
  %64 = fmul double %55, %63
  %65 = load [1100 x double]*, [1100 x double]** %16, align 8
  %66 = load i32, i32* %19, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %65, i64 %67
  %69 = load i32, i32* %18, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1100 x double], [1100 x double]* %68, i64 0, i64 %70
  %72 = load double, double* %71, align 8
  %73 = fmul double %64, %72
  %74 = load [1100 x double]*, [1100 x double]** %14, align 8
  %75 = load i32, i32* %17, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [1100 x double], [1100 x double]* %74, i64 %76
  %78 = load i32, i32* %18, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %77, i64 0, i64 %79
  %81 = load double, double* %80, align 8
  %82 = fadd double %81, %73
  store double %82, double* %80, align 8
  br label %83

; <label>:83:                                     ; preds = %54
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 0)
  %84 = add i64 %pgocount1, 1
  store i64 %84, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 0)
  %85 = load i32, i32* %18, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %18, align 4
  br label %50

; <label>:87:                                     ; preds = %50
  br label %88

; <label>:88:                                     ; preds = %87
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 2)
  %89 = add i64 %pgocount2, 1
  store i64 %89, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 2)
  %90 = load i32, i32* %19, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %19, align 4
  br label %45

; <label>:92:                                     ; preds = %45
  br label %93

; <label>:93:                                     ; preds = %92
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 3)
  %94 = add i64 %pgocount3, 1
  store i64 %94, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 3)
  %95 = load i32, i32* %17, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %17, align 4
  br label %20

; <label>:97:                                     ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 4)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1100 x double]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [1100 x double]* %2, [1100 x double]** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %13

; <label>:13:                                     ; preds = %50, %3
  %14 = load i32, i32* %7, align 4
  %15 = load i32, i32* %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %54

; <label>:17:                                     ; preds = %13
  store i32 0, i32* %8, align 4
  br label %18

; <label>:18:                                     ; preds = %45, %17
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %49

; <label>:22:                                     ; preds = %18
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %4, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32, i32* %8, align 4
  %27 = add nsw i32 %25, %26
  %28 = srem i32 %27, 20
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %34

; <label>:34:                                     ; preds = %30, %22
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = load [1100 x double]*, [1100 x double]** %6, align 8
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %36, i64 %38
  %40 = load i32, i32* %8, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %39, i64 0, i64 %41
  %43 = load double, double* %42, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %43)
  br label %45

; <label>:45:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %47 = load i32, i32* %8, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %8, align 4
  br label %18

; <label>:49:                                     ; preds = %18
  br label %50

; <label>:50:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %52 = load i32, i32* %7, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %7, align 4
  br label %13

; <label>:54:                                     ; preds = %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
