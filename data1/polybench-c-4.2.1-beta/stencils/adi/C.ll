; ModuleID = 'B.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_adi = private constant [15 x i8] c"B.ll:kernel_adi"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_adi = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_adi = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3151364952666595362, i64 160769555378, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_adi\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_adi to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
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
  br i1 %34, label %35, label %47

; <label>:35:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %37 = load i8**, i8*** %5, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 0
  %39 = load i8*, i8** %38, align 8
  %40 = call i32 @strcmp(i8* %39, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %47, label %42

; <label>:42:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %44 = load i32, i32* %6, align 4
  %45 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %8, align 8
  %46 = getelementptr inbounds [1000 x [1000 x double]], [1000 x [1000 x double]]* %45, i32 0, i32 0
  call void @print_array(i32 %44, [1000 x double]* %46)
  br label %47

; <label>:47:                                     ; preds = %42, %35, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %49 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %8, align 8
  %50 = bitcast [1000 x [1000 x double]]* %49 to i8*
  call void @free(i8* %50) #4
  %51 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %9, align 8
  %52 = bitcast [1000 x [1000 x double]]* %51 to i8*
  call void @free(i8* %52) #4
  %53 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %10, align 8
  %54 = bitcast [1000 x [1000 x double]]* %53 to i8*
  call void @free(i8* %54) #4
  %55 = load [1000 x [1000 x double]]*, [1000 x [1000 x double]]** %11, align 8
  %56 = bitcast [1000 x [1000 x double]]* %55 to i8*
  call void @free(i8* %56) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [1000 x double]*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [1000 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store [1000 x double]* %1, [1000 x double]** %4, align 8
  store i32 0, i32* %5, align 4
  br label %7

; <label>:7:                                      ; preds = %38, %2
  %8 = load i32, i32* %5, align 4
  %9 = load i32, i32* %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %42

; <label>:11:                                     ; preds = %7
  store i32 0, i32* %6, align 4
  br label %12

; <label>:12:                                     ; preds = %33, %11
  %13 = load i32, i32* %6, align 4
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %37

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
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %35 = load i32, i32* %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %6, align 4
  br label %12

; <label>:37:                                     ; preds = %12
  br label %38

; <label>:38:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %40 = load i32, i32* %5, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %5, align 4
  br label %7

; <label>:42:                                     ; preds = %7
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
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

; <label>:64:                                     ; preds = %447, %6
  %65 = load i32, i32* %13, align 4
  %66 = load i32, i32* %7, align 4
  %67 = icmp sle i32 %65, %66
  br i1 %67, label %68, label %451

; <label>:68:                                     ; preds = %64
  store i32 1, i32* %14, align 4
  br label %69

; <label>:69:                                     ; preds = %253, %68
  %70 = load i32, i32* %14, align 4
  %71 = load i32, i32* %8, align 4
  %72 = sub nsw i32 %71, 1
  %73 = icmp slt i32 %70, %72
  br i1 %73, label %74, label %257

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
  br i1 %100, label %101, label %199

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
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 0)
  %196 = add i64 %pgocount, 1
  store i64 %196, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 0)
  %197 = load i32, i32* %15, align 4
  %198 = add nsw i32 %197, 1
  store i32 %198, i32* %15, align 4
  br label %96

; <label>:199:                                    ; preds = %96
  %200 = load [1000 x double]*, [1000 x double]** %10, align 8
  %201 = load i32, i32* %8, align 4
  %202 = sub nsw i32 %201, 1
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [1000 x double], [1000 x double]* %200, i64 %203
  %205 = load i32, i32* %14, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [1000 x double], [1000 x double]* %204, i64 0, i64 %206
  store double 1.000000e+00, double* %207, align 8
  %208 = load i32, i32* %8, align 4
  %209 = sub nsw i32 %208, 2
  store i32 %209, i32* %15, align 4
  br label %210

; <label>:210:                                    ; preds = %248, %199
  %211 = load i32, i32* %15, align 4
  %212 = icmp sge i32 %211, 1
  br i1 %212, label %213, label %252

; <label>:213:                                    ; preds = %210
  %214 = load [1000 x double]*, [1000 x double]** %11, align 8
  %215 = load i32, i32* %14, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [1000 x double], [1000 x double]* %214, i64 %216
  %218 = load i32, i32* %15, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [1000 x double], [1000 x double]* %217, i64 0, i64 %219
  %221 = load double, double* %220, align 8
  %222 = load [1000 x double]*, [1000 x double]** %10, align 8
  %223 = load i32, i32* %15, align 4
  %224 = add nsw i32 %223, 1
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [1000 x double], [1000 x double]* %222, i64 %225
  %227 = load i32, i32* %14, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [1000 x double], [1000 x double]* %226, i64 0, i64 %228
  %230 = load double, double* %229, align 8
  %231 = fmul double %221, %230
  %232 = load [1000 x double]*, [1000 x double]** %12, align 8
  %233 = load i32, i32* %14, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [1000 x double], [1000 x double]* %232, i64 %234
  %236 = load i32, i32* %15, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [1000 x double], [1000 x double]* %235, i64 0, i64 %237
  %239 = load double, double* %238, align 8
  %240 = fadd double %231, %239
  %241 = load [1000 x double]*, [1000 x double]** %10, align 8
  %242 = load i32, i32* %15, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [1000 x double], [1000 x double]* %241, i64 %243
  %245 = load i32, i32* %14, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [1000 x double], [1000 x double]* %244, i64 0, i64 %246
  store double %240, double* %247, align 8
  br label %248

; <label>:248:                                    ; preds = %213
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 1)
  %249 = add i64 %pgocount1, 1
  store i64 %249, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 1)
  %250 = load i32, i32* %15, align 4
  %251 = add nsw i32 %250, -1
  store i32 %251, i32* %15, align 4
  br label %210

; <label>:252:                                    ; preds = %210
  br label %253

; <label>:253:                                    ; preds = %252
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 4)
  %254 = add i64 %pgocount2, 1
  store i64 %254, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 4)
  %255 = load i32, i32* %14, align 4
  %256 = add nsw i32 %255, 1
  store i32 %256, i32* %14, align 4
  br label %69

; <label>:257:                                    ; preds = %69
  store i32 1, i32* %14, align 4
  br label %258

; <label>:258:                                    ; preds = %442, %257
  %259 = load i32, i32* %14, align 4
  %260 = load i32, i32* %8, align 4
  %261 = sub nsw i32 %260, 1
  %262 = icmp slt i32 %259, %261
  br i1 %262, label %263, label %446

; <label>:263:                                    ; preds = %258
  %264 = load [1000 x double]*, [1000 x double]** %9, align 8
  %265 = load i32, i32* %14, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [1000 x double], [1000 x double]* %264, i64 %266
  %268 = getelementptr inbounds [1000 x double], [1000 x double]* %267, i64 0, i64 0
  store double 1.000000e+00, double* %268, align 8
  %269 = load [1000 x double]*, [1000 x double]** %11, align 8
  %270 = load i32, i32* %14, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [1000 x double], [1000 x double]* %269, i64 %271
  %273 = getelementptr inbounds [1000 x double], [1000 x double]* %272, i64 0, i64 0
  store double 0.000000e+00, double* %273, align 8
  %274 = load [1000 x double]*, [1000 x double]** %9, align 8
  %275 = load i32, i32* %14, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [1000 x double], [1000 x double]* %274, i64 %276
  %278 = getelementptr inbounds [1000 x double], [1000 x double]* %277, i64 0, i64 0
  %279 = load double, double* %278, align 8
  %280 = load [1000 x double]*, [1000 x double]** %12, align 8
  %281 = load i32, i32* %14, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [1000 x double], [1000 x double]* %280, i64 %282
  %284 = getelementptr inbounds [1000 x double], [1000 x double]* %283, i64 0, i64 0
  store double %279, double* %284, align 8
  store i32 1, i32* %15, align 4
  br label %285

; <label>:285:                                    ; preds = %384, %263
  %286 = load i32, i32* %15, align 4
  %287 = load i32, i32* %8, align 4
  %288 = sub nsw i32 %287, 1
  %289 = icmp slt i32 %286, %288
  br i1 %289, label %290, label %388

; <label>:290:                                    ; preds = %285
  %291 = load double, double* %28, align 8
  %292 = fsub double -0.000000e+00, %291
  %293 = load double, double* %26, align 8
  %294 = load [1000 x double]*, [1000 x double]** %11, align 8
  %295 = load i32, i32* %14, align 4
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds [1000 x double], [1000 x double]* %294, i64 %296
  %298 = load i32, i32* %15, align 4
  %299 = sub nsw i32 %298, 1
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [1000 x double], [1000 x double]* %297, i64 0, i64 %300
  %302 = load double, double* %301, align 8
  %303 = fmul double %293, %302
  %304 = load double, double* %27, align 8
  %305 = fadd double %303, %304
  %306 = fdiv double %292, %305
  %307 = load [1000 x double]*, [1000 x double]** %11, align 8
  %308 = load i32, i32* %14, align 4
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [1000 x double], [1000 x double]* %307, i64 %309
  %311 = load i32, i32* %15, align 4
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [1000 x double], [1000 x double]* %310, i64 0, i64 %312
  store double %306, double* %313, align 8
  %314 = load double, double* %23, align 8
  %315 = fsub double -0.000000e+00, %314
  %316 = load [1000 x double]*, [1000 x double]** %10, align 8
  %317 = load i32, i32* %14, align 4
  %318 = sub nsw i32 %317, 1
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [1000 x double], [1000 x double]* %316, i64 %319
  %321 = load i32, i32* %15, align 4
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [1000 x double], [1000 x double]* %320, i64 0, i64 %322
  %324 = load double, double* %323, align 8
  %325 = fmul double %315, %324
  %326 = load double, double* %23, align 8
  %327 = fmul double 2.000000e+00, %326
  %328 = fadd double 1.000000e+00, %327
  %329 = load [1000 x double]*, [1000 x double]** %10, align 8
  %330 = load i32, i32* %14, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds [1000 x double], [1000 x double]* %329, i64 %331
  %333 = load i32, i32* %15, align 4
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds [1000 x double], [1000 x double]* %332, i64 0, i64 %334
  %336 = load double, double* %335, align 8
  %337 = fmul double %328, %336
  %338 = fadd double %325, %337
  %339 = load double, double* %25, align 8
  %340 = load [1000 x double]*, [1000 x double]** %10, align 8
  %341 = load i32, i32* %14, align 4
  %342 = add nsw i32 %341, 1
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds [1000 x double], [1000 x double]* %340, i64 %343
  %345 = load i32, i32* %15, align 4
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds [1000 x double], [1000 x double]* %344, i64 0, i64 %346
  %348 = load double, double* %347, align 8
  %349 = fmul double %339, %348
  %350 = fsub double %338, %349
  %351 = load double, double* %26, align 8
  %352 = load [1000 x double]*, [1000 x double]** %12, align 8
  %353 = load i32, i32* %14, align 4
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [1000 x double], [1000 x double]* %352, i64 %354
  %356 = load i32, i32* %15, align 4
  %357 = sub nsw i32 %356, 1
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds [1000 x double], [1000 x double]* %355, i64 0, i64 %358
  %360 = load double, double* %359, align 8
  %361 = fmul double %351, %360
  %362 = fsub double %350, %361
  %363 = load double, double* %26, align 8
  %364 = load [1000 x double]*, [1000 x double]** %11, align 8
  %365 = load i32, i32* %14, align 4
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds [1000 x double], [1000 x double]* %364, i64 %366
  %368 = load i32, i32* %15, align 4
  %369 = sub nsw i32 %368, 1
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [1000 x double], [1000 x double]* %367, i64 0, i64 %370
  %372 = load double, double* %371, align 8
  %373 = fmul double %363, %372
  %374 = load double, double* %27, align 8
  %375 = fadd double %373, %374
  %376 = fdiv double %362, %375
  %377 = load [1000 x double]*, [1000 x double]** %12, align 8
  %378 = load i32, i32* %14, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [1000 x double], [1000 x double]* %377, i64 %379
  %381 = load i32, i32* %15, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [1000 x double], [1000 x double]* %380, i64 0, i64 %382
  store double %376, double* %383, align 8
  br label %384

; <label>:384:                                    ; preds = %290
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 2)
  %385 = add i64 %pgocount3, 1
  store i64 %385, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 2)
  %386 = load i32, i32* %15, align 4
  %387 = add nsw i32 %386, 1
  store i32 %387, i32* %15, align 4
  br label %285

; <label>:388:                                    ; preds = %285
  %389 = load [1000 x double]*, [1000 x double]** %9, align 8
  %390 = load i32, i32* %14, align 4
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds [1000 x double], [1000 x double]* %389, i64 %391
  %393 = load i32, i32* %8, align 4
  %394 = sub nsw i32 %393, 1
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [1000 x double], [1000 x double]* %392, i64 0, i64 %395
  store double 1.000000e+00, double* %396, align 8
  %397 = load i32, i32* %8, align 4
  %398 = sub nsw i32 %397, 2
  store i32 %398, i32* %15, align 4
  br label %399

; <label>:399:                                    ; preds = %437, %388
  %400 = load i32, i32* %15, align 4
  %401 = icmp sge i32 %400, 1
  br i1 %401, label %402, label %441

; <label>:402:                                    ; preds = %399
  %403 = load [1000 x double]*, [1000 x double]** %11, align 8
  %404 = load i32, i32* %14, align 4
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds [1000 x double], [1000 x double]* %403, i64 %405
  %407 = load i32, i32* %15, align 4
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds [1000 x double], [1000 x double]* %406, i64 0, i64 %408
  %410 = load double, double* %409, align 8
  %411 = load [1000 x double]*, [1000 x double]** %9, align 8
  %412 = load i32, i32* %14, align 4
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [1000 x double], [1000 x double]* %411, i64 %413
  %415 = load i32, i32* %15, align 4
  %416 = add nsw i32 %415, 1
  %417 = sext i32 %416 to i64
  %418 = getelementptr inbounds [1000 x double], [1000 x double]* %414, i64 0, i64 %417
  %419 = load double, double* %418, align 8
  %420 = fmul double %410, %419
  %421 = load [1000 x double]*, [1000 x double]** %12, align 8
  %422 = load i32, i32* %14, align 4
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds [1000 x double], [1000 x double]* %421, i64 %423
  %425 = load i32, i32* %15, align 4
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds [1000 x double], [1000 x double]* %424, i64 0, i64 %426
  %428 = load double, double* %427, align 8
  %429 = fadd double %420, %428
  %430 = load [1000 x double]*, [1000 x double]** %9, align 8
  %431 = load i32, i32* %14, align 4
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds [1000 x double], [1000 x double]* %430, i64 %432
  %434 = load i32, i32* %15, align 4
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds [1000 x double], [1000 x double]* %433, i64 0, i64 %435
  store double %429, double* %436, align 8
  br label %437

; <label>:437:                                    ; preds = %402
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 3)
  %438 = add i64 %pgocount4, 1
  store i64 %438, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 3)
  %439 = load i32, i32* %15, align 4
  %440 = add nsw i32 %439, -1
  store i32 %440, i32* %15, align 4
  br label %399

; <label>:441:                                    ; preds = %399
  br label %442

; <label>:442:                                    ; preds = %441
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 5)
  %443 = add i64 %pgocount5, 1
  store i64 %443, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 5)
  %444 = load i32, i32* %14, align 4
  %445 = add nsw i32 %444, 1
  store i32 %445, i32* %14, align 4
  br label %258

; <label>:446:                                    ; preds = %258
  br label %447

; <label>:447:                                    ; preds = %446
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 6)
  %448 = add i64 %pgocount6, 1
  store i64 %448, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 6)
  %449 = load i32, i32* %13, align 4
  %450 = add nsw i32 %449, 1
  store i32 %450, i32* %13, align 4
  br label %64

; <label>:451:                                    ; preds = %64
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 7)
  %452 = add i64 %pgocount7, 1
  store i64 %452, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 7)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
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

; <label>:11:                                     ; preds = %48, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %52

; <label>:15:                                     ; preds = %11
  store i32 0, i32* %6, align 4
  br label %16

; <label>:16:                                     ; preds = %43, %15
  %17 = load i32, i32* %6, align 4
  %18 = load i32, i32* %3, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %47

; <label>:20:                                     ; preds = %16
  %21 = load i32, i32* %5, align 4
  %22 = load i32, i32* %3, align 4
  %23 = mul nsw i32 %21, %22
  %24 = load i32, i32* %6, align 4
  %25 = add nsw i32 %23, %24
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %32

; <label>:32:                                     ; preds = %28, %20
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = load [1000 x double]*, [1000 x double]** %4, align 8
  %35 = load i32, i32* %5, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %36
  %38 = load i32, i32* %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %37, i64 0, i64 %39
  %41 = load double, double* %40, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %41)
  br label %43

; <label>:43:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %45 = load i32, i32* %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %6, align 4
  br label %16

; <label>:47:                                     ; preds = %16
  br label %48

; <label>:48:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %50 = load i32, i32* %5, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %5, align 4
  br label %11

; <label>:52:                                     ; preds = %11
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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
