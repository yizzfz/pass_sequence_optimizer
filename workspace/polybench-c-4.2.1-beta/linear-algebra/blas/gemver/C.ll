; ModuleID = 'B.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_gemver = private constant [18 x i8] c"B.ll:kernel_gemver"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_gemver = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_gemver = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1410264607072615041, i64 162654937605, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [58 x i8] c"8\00main\01B.ll:init_array\01B.ll:kernel_gemver\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_gemver to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

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
  br i1 %77, label %78, label %90

; <label>:78:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %79 = add i64 %pgocount, 1
  store i64 %79, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %80 = load i8**, i8*** %5, align 8
  %81 = getelementptr inbounds i8*, i8** %80, i64 0
  %82 = load i8*, i8** %81, align 8
  %83 = call i32 @strcmp(i8* %82, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %90, label %85

; <label>:85:                                     ; preds = %78
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %86 = add i64 %pgocount1, 1
  store i64 %86, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %87 = load i32, i32* %6, align 4
  %88 = load [2000 x double]*, [2000 x double]** %14, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %88, i32 0, i32 0
  call void @print_array(i32 %87, double* %89)
  br label %90

; <label>:90:                                     ; preds = %85, %78, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %91 = add i64 %pgocount2, 1
  store i64 %91, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %92 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %9, align 8
  %93 = bitcast [2000 x [2000 x double]]* %92 to i8*
  call void @free(i8* %93) #4
  %94 = load [2000 x double]*, [2000 x double]** %10, align 8
  %95 = bitcast [2000 x double]* %94 to i8*
  call void @free(i8* %95) #4
  %96 = load [2000 x double]*, [2000 x double]** %11, align 8
  %97 = bitcast [2000 x double]* %96 to i8*
  call void @free(i8* %97) #4
  %98 = load [2000 x double]*, [2000 x double]** %12, align 8
  %99 = bitcast [2000 x double]* %98 to i8*
  call void @free(i8* %99) #4
  %100 = load [2000 x double]*, [2000 x double]** %13, align 8
  %101 = bitcast [2000 x double]* %100 to i8*
  call void @free(i8* %101) #4
  %102 = load [2000 x double]*, [2000 x double]** %14, align 8
  %103 = bitcast [2000 x double]* %102 to i8*
  call void @free(i8* %103) #4
  %104 = load [2000 x double]*, [2000 x double]** %15, align 8
  %105 = bitcast [2000 x double]* %104 to i8*
  call void @free(i8* %105) #4
  %106 = load [2000 x double]*, [2000 x double]** %16, align 8
  %107 = bitcast [2000 x double]* %106 to i8*
  call void @free(i8* %107) #4
  %108 = load [2000 x double]*, [2000 x double]** %17, align 8
  %109 = bitcast [2000 x double]* %108 to i8*
  call void @free(i8* %109) #4
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

; <label>:32:                                     ; preds = %127, %12
  %33 = load i32, i32* %25, align 4
  %34 = load i32, i32* %13, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %131

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
  br i1 %104, label %105, label %126

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
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %123 = add i64 %pgocount, 1
  store i64 %123, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %124 = load i32, i32* %26, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %26, align 4
  br label %101

; <label>:126:                                    ; preds = %101
  br label %127

; <label>:127:                                    ; preds = %126
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %128 = add i64 %pgocount1, 1
  store i64 %128, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %129 = load i32, i32* %25, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %25, align 4
  br label %32

; <label>:131:                                    ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %132 = add i64 %pgocount2, 1
  store i64 %132, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
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

; <label>:27:                                     ; preds = %81, %12
  %28 = load i32, i32* %25, align 4
  %29 = load i32, i32* %13, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %85

; <label>:31:                                     ; preds = %27
  store i32 0, i32* %26, align 4
  br label %32

; <label>:32:                                     ; preds = %76, %31
  %33 = load i32, i32* %26, align 4
  %34 = load i32, i32* %13, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %80

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
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 0)
  %77 = add i64 %pgocount, 1
  store i64 %77, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 0)
  %78 = load i32, i32* %26, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %26, align 4
  br label %32

; <label>:80:                                     ; preds = %32
  br label %81

; <label>:81:                                     ; preds = %80
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 3)
  %82 = add i64 %pgocount1, 1
  store i64 %82, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 3)
  %83 = load i32, i32* %25, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %25, align 4
  br label %27

; <label>:85:                                     ; preds = %27
  store i32 0, i32* %25, align 4
  br label %86

; <label>:86:                                     ; preds = %127, %85
  %87 = load i32, i32* %25, align 4
  %88 = load i32, i32* %13, align 4
  %89 = icmp slt i32 %87, %88
  br i1 %89, label %90, label %131

; <label>:90:                                     ; preds = %86
  store i32 0, i32* %26, align 4
  br label %91

; <label>:91:                                     ; preds = %122, %90
  %92 = load i32, i32* %26, align 4
  %93 = load i32, i32* %13, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %126

; <label>:95:                                     ; preds = %91
  %96 = load double*, double** %22, align 8
  %97 = load i32, i32* %25, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, double* %96, i64 %98
  %100 = load double, double* %99, align 8
  %101 = load double, double* %15, align 8
  %102 = load [2000 x double]*, [2000 x double]** %16, align 8
  %103 = load i32, i32* %26, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %102, i64 %104
  %106 = load i32, i32* %25, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %105, i64 0, i64 %107
  %109 = load double, double* %108, align 8
  %110 = fmul double %101, %109
  %111 = load double*, double** %23, align 8
  %112 = load i32, i32* %26, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds double, double* %111, i64 %113
  %115 = load double, double* %114, align 8
  %116 = fmul double %110, %115
  %117 = fadd double %100, %116
  %118 = load double*, double** %22, align 8
  %119 = load i32, i32* %25, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds double, double* %118, i64 %120
  store double %117, double* %121, align 8
  br label %122

; <label>:122:                                    ; preds = %95
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 1)
  %123 = add i64 %pgocount2, 1
  store i64 %123, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 1)
  %124 = load i32, i32* %26, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %26, align 4
  br label %91

; <label>:126:                                    ; preds = %91
  br label %127

; <label>:127:                                    ; preds = %126
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 4)
  %128 = add i64 %pgocount3, 1
  store i64 %128, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 4)
  %129 = load i32, i32* %25, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %25, align 4
  br label %86

; <label>:131:                                    ; preds = %86
  store i32 0, i32* %25, align 4
  br label %132

; <label>:132:                                    ; preds = %152, %131
  %133 = load i32, i32* %25, align 4
  %134 = load i32, i32* %13, align 4
  %135 = icmp slt i32 %133, %134
  br i1 %135, label %136, label %156

; <label>:136:                                    ; preds = %132
  %137 = load double*, double** %22, align 8
  %138 = load i32, i32* %25, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, double* %137, i64 %139
  %141 = load double, double* %140, align 8
  %142 = load double*, double** %24, align 8
  %143 = load i32, i32* %25, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double, double* %142, i64 %144
  %146 = load double, double* %145, align 8
  %147 = fadd double %141, %146
  %148 = load double*, double** %22, align 8
  %149 = load i32, i32* %25, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds double, double* %148, i64 %150
  store double %147, double* %151, align 8
  br label %152

; <label>:152:                                    ; preds = %136
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 5)
  %153 = add i64 %pgocount4, 1
  store i64 %153, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 5)
  %154 = load i32, i32* %25, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %25, align 4
  br label %132

; <label>:156:                                    ; preds = %132
  store i32 0, i32* %25, align 4
  br label %157

; <label>:157:                                    ; preds = %198, %156
  %158 = load i32, i32* %25, align 4
  %159 = load i32, i32* %13, align 4
  %160 = icmp slt i32 %158, %159
  br i1 %160, label %161, label %202

; <label>:161:                                    ; preds = %157
  store i32 0, i32* %26, align 4
  br label %162

; <label>:162:                                    ; preds = %193, %161
  %163 = load i32, i32* %26, align 4
  %164 = load i32, i32* %13, align 4
  %165 = icmp slt i32 %163, %164
  br i1 %165, label %166, label %197

; <label>:166:                                    ; preds = %162
  %167 = load double*, double** %21, align 8
  %168 = load i32, i32* %25, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds double, double* %167, i64 %169
  %171 = load double, double* %170, align 8
  %172 = load double, double* %14, align 8
  %173 = load [2000 x double]*, [2000 x double]** %16, align 8
  %174 = load i32, i32* %25, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [2000 x double], [2000 x double]* %173, i64 %175
  %177 = load i32, i32* %26, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [2000 x double], [2000 x double]* %176, i64 0, i64 %178
  %180 = load double, double* %179, align 8
  %181 = fmul double %172, %180
  %182 = load double*, double** %22, align 8
  %183 = load i32, i32* %26, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds double, double* %182, i64 %184
  %186 = load double, double* %185, align 8
  %187 = fmul double %181, %186
  %188 = fadd double %171, %187
  %189 = load double*, double** %21, align 8
  %190 = load i32, i32* %25, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds double, double* %189, i64 %191
  store double %188, double* %192, align 8
  br label %193

; <label>:193:                                    ; preds = %166
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 2)
  %194 = add i64 %pgocount5, 1
  store i64 %194, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 2)
  %195 = load i32, i32* %26, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %26, align 4
  br label %162

; <label>:197:                                    ; preds = %162
  br label %198

; <label>:198:                                    ; preds = %197
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 6)
  %199 = add i64 %pgocount6, 1
  store i64 %199, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 6)
  %200 = load i32, i32* %25, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %25, align 4
  br label %157

; <label>:202:                                    ; preds = %157
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 7)
  %203 = add i64 %pgocount7, 1
  store i64 %203, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 7)
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

; <label>:10:                                     ; preds = %30, %2
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %34

; <label>:14:                                     ; preds = %10
  %15 = load i32, i32* %5, align 4
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %22

; <label>:22:                                     ; preds = %18, %14
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = load double*, double** %4, align 8
  %25 = load i32, i32* %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  %28 = load double, double* %27, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %28)
  br label %30

; <label>:30:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %32 = load i32, i32* %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %5, align 4
  br label %10

; <label>:34:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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
