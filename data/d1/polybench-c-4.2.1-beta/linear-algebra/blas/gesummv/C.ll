; ModuleID = 'B.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_gesummv = private constant [19 x i8] c"B.ll:kernel_gesummv"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_gesummv = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_gesummv = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5160380007768952582, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_kernel_gesummv, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_gesummv\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_gesummv to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca [1300 x [1300 x double]]*, align 8
  %10 = alloca [1300 x [1300 x double]]*, align 8
  %11 = alloca [1300 x double]*, align 8
  %12 = alloca [1300 x double]*, align 8
  %13 = alloca [1300 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 1300, i32* %6, align 4
  %14 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %15 = bitcast i8* %14 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %15, [1300 x [1300 x double]]** %9, align 8
  %16 = call i8* @polybench_alloc_data(i64 1690000, i32 8)
  %17 = bitcast i8* %16 to [1300 x [1300 x double]]*
  store [1300 x [1300 x double]]* %17, [1300 x [1300 x double]]** %10, align 8
  %18 = call i8* @polybench_alloc_data(i64 1300, i32 8)
  %19 = bitcast i8* %18 to [1300 x double]*
  store [1300 x double]* %19, [1300 x double]** %11, align 8
  %20 = call i8* @polybench_alloc_data(i64 1300, i32 8)
  %21 = bitcast i8* %20 to [1300 x double]*
  store [1300 x double]* %21, [1300 x double]** %12, align 8
  %22 = call i8* @polybench_alloc_data(i64 1300, i32 8)
  %23 = bitcast i8* %22 to [1300 x double]*
  store [1300 x double]* %23, [1300 x double]** %13, align 8
  %24 = load i32, i32* %6, align 4
  %25 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %26 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %25, i32 0, i32 0
  %27 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %10, align 8
  %28 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %27, i32 0, i32 0
  %29 = load [1300 x double]*, [1300 x double]** %12, align 8
  %30 = getelementptr inbounds [1300 x double], [1300 x double]* %29, i32 0, i32 0
  call void @init_array(i32 %24, double* %7, double* %8, [1300 x double]* %26, [1300 x double]* %28, double* %30)
  call void (...) @polybench_timer_start()
  %31 = load i32, i32* %6, align 4
  %32 = load double, double* %7, align 8
  %33 = load double, double* %8, align 8
  %34 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %35 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %34, i32 0, i32 0
  %36 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %10, align 8
  %37 = getelementptr inbounds [1300 x [1300 x double]], [1300 x [1300 x double]]* %36, i32 0, i32 0
  %38 = load [1300 x double]*, [1300 x double]** %11, align 8
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %38, i32 0, i32 0
  %40 = load [1300 x double]*, [1300 x double]** %12, align 8
  %41 = getelementptr inbounds [1300 x double], [1300 x double]* %40, i32 0, i32 0
  %42 = load [1300 x double]*, [1300 x double]** %13, align 8
  %43 = getelementptr inbounds [1300 x double], [1300 x double]* %42, i32 0, i32 0
  call void @kernel_gesummv(i32 %31, double %32, double %33, [1300 x double]* %35, [1300 x double]* %37, double* %39, double* %41, double* %43)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %44 = load i32, i32* %4, align 4
  %45 = icmp sgt i32 %44, 42
  br i1 %45, label %46, label %58

; <label>:46:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %48 = load i8**, i8*** %5, align 8
  %49 = getelementptr inbounds i8*, i8** %48, i64 0
  %50 = load i8*, i8** %49, align 8
  %51 = call i32 @strcmp(i8* %50, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %58, label %53

; <label>:53:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %55 = load i32, i32* %6, align 4
  %56 = load [1300 x double]*, [1300 x double]** %13, align 8
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %56, i32 0, i32 0
  call void @print_array(i32 %55, double* %57)
  br label %58

; <label>:58:                                     ; preds = %53, %46, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %60 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %9, align 8
  %61 = bitcast [1300 x [1300 x double]]* %60 to i8*
  call void @free(i8* %61) #4
  %62 = load [1300 x [1300 x double]]*, [1300 x [1300 x double]]** %10, align 8
  %63 = bitcast [1300 x [1300 x double]]* %62 to i8*
  call void @free(i8* %63) #4
  %64 = load [1300 x double]*, [1300 x double]** %11, align 8
  %65 = bitcast [1300 x double]* %64 to i8*
  call void @free(i8* %65) #4
  %66 = load [1300 x double]*, [1300 x double]** %12, align 8
  %67 = bitcast [1300 x double]* %66 to i8*
  call void @free(i8* %67) #4
  %68 = load [1300 x double]*, [1300 x double]** %13, align 8
  %69 = bitcast [1300 x double]* %68 to i8*
  call void @free(i8* %69) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, double*, double*, [1300 x double]*, [1300 x double]*, double*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca [1300 x double]*, align 8
  %11 = alloca [1300 x double]*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store double* %2, double** %9, align 8
  store [1300 x double]* %3, [1300 x double]** %10, align 8
  store [1300 x double]* %4, [1300 x double]** %11, align 8
  store double* %5, double** %12, align 8
  %15 = load double*, double** %8, align 8
  store double 1.500000e+00, double* %15, align 8
  %16 = load double*, double** %9, align 8
  store double 1.200000e+00, double* %16, align 8
  store i32 0, i32* %13, align 4
  br label %17

; <label>:17:                                     ; preds = %77, %6
  %18 = load i32, i32* %13, align 4
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %81

; <label>:21:                                     ; preds = %17
  %22 = load i32, i32* %13, align 4
  %23 = load i32, i32* %7, align 4
  %24 = srem i32 %22, %23
  %25 = sitofp i32 %24 to double
  %26 = load i32, i32* %7, align 4
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %25, %27
  %29 = load double*, double** %12, align 8
  %30 = load i32, i32* %13, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds double, double* %29, i64 %31
  store double %28, double* %32, align 8
  store i32 0, i32* %14, align 4
  br label %33

; <label>:33:                                     ; preds = %72, %21
  %34 = load i32, i32* %14, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %76

; <label>:37:                                     ; preds = %33
  %38 = load i32, i32* %13, align 4
  %39 = load i32, i32* %14, align 4
  %40 = mul nsw i32 %38, %39
  %41 = add nsw i32 %40, 1
  %42 = load i32, i32* %7, align 4
  %43 = srem i32 %41, %42
  %44 = sitofp i32 %43 to double
  %45 = load i32, i32* %7, align 4
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %44, %46
  %48 = load [1300 x double]*, [1300 x double]** %10, align 8
  %49 = load i32, i32* %13, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %48, i64 %50
  %52 = load i32, i32* %14, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %51, i64 0, i64 %53
  store double %47, double* %54, align 8
  %55 = load i32, i32* %13, align 4
  %56 = load i32, i32* %14, align 4
  %57 = mul nsw i32 %55, %56
  %58 = add nsw i32 %57, 2
  %59 = load i32, i32* %7, align 4
  %60 = srem i32 %58, %59
  %61 = sitofp i32 %60 to double
  %62 = load i32, i32* %7, align 4
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %61, %63
  %65 = load [1300 x double]*, [1300 x double]** %11, align 8
  %66 = load i32, i32* %13, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %65, i64 %67
  %69 = load i32, i32* %14, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1300 x double], [1300 x double]* %68, i64 0, i64 %70
  store double %64, double* %71, align 8
  br label %72

; <label>:72:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %73 = add i64 %pgocount, 1
  store i64 %73, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %74 = load i32, i32* %14, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %14, align 4
  br label %33

; <label>:76:                                     ; preds = %33
  br label %77

; <label>:77:                                     ; preds = %76
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %78 = add i64 %pgocount1, 1
  store i64 %78, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %79 = load i32, i32* %13, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %13, align 4
  br label %17

; <label>:81:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %82 = add i64 %pgocount2, 1
  store i64 %82, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gesummv(i32, double, double, [1300 x double]*, [1300 x double]*, double*, double*, double*) #0 {
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca [1300 x double]*, align 8
  %13 = alloca [1300 x double]*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store double %1, double* %10, align 8
  store double %2, double* %11, align 8
  store [1300 x double]* %3, [1300 x double]** %12, align 8
  store [1300 x double]* %4, [1300 x double]** %13, align 8
  store double* %5, double** %14, align 8
  store double* %6, double** %15, align 8
  store double* %7, double** %16, align 8
  store i32 0, i32* %17, align 4
  br label %19

; <label>:19:                                     ; preds = %109, %8
  %20 = load i32, i32* %17, align 4
  %21 = load i32, i32* %9, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %113

; <label>:23:                                     ; preds = %19
  %24 = load double*, double** %14, align 8
  %25 = load i32, i32* %17, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  store double 0.000000e+00, double* %27, align 8
  %28 = load double*, double** %16, align 8
  %29 = load i32, i32* %17, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double* %28, i64 %30
  store double 0.000000e+00, double* %31, align 8
  store i32 0, i32* %18, align 4
  br label %32

; <label>:32:                                     ; preds = %85, %23
  %33 = load i32, i32* %18, align 4
  %34 = load i32, i32* %9, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %89

; <label>:36:                                     ; preds = %32
  %37 = load [1300 x double]*, [1300 x double]** %12, align 8
  %38 = load i32, i32* %17, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %37, i64 %39
  %41 = load i32, i32* %18, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [1300 x double], [1300 x double]* %40, i64 0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = load double*, double** %15, align 8
  %46 = load i32, i32* %18, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %45, i64 %47
  %49 = load double, double* %48, align 8
  %50 = fmul double %44, %49
  %51 = load double*, double** %14, align 8
  %52 = load i32, i32* %17, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double* %51, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %50, %55
  %57 = load double*, double** %14, align 8
  %58 = load i32, i32* %17, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double* %57, i64 %59
  store double %56, double* %60, align 8
  %61 = load [1300 x double]*, [1300 x double]** %13, align 8
  %62 = load i32, i32* %17, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %61, i64 %63
  %65 = load i32, i32* %18, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %64, i64 0, i64 %66
  %68 = load double, double* %67, align 8
  %69 = load double*, double** %15, align 8
  %70 = load i32, i32* %18, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double* %69, i64 %71
  %73 = load double, double* %72, align 8
  %74 = fmul double %68, %73
  %75 = load double*, double** %16, align 8
  %76 = load i32, i32* %17, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double* %75, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fadd double %74, %79
  %81 = load double*, double** %16, align 8
  %82 = load i32, i32* %17, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double* %81, i64 %83
  store double %80, double* %84, align 8
  br label %85

; <label>:85:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_kernel_gesummv, i64 0, i64 0)
  %86 = add i64 %pgocount, 1
  store i64 %86, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_kernel_gesummv, i64 0, i64 0)
  %87 = load i32, i32* %18, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %18, align 4
  br label %32

; <label>:89:                                     ; preds = %32
  %90 = load double, double* %10, align 8
  %91 = load double*, double** %14, align 8
  %92 = load i32, i32* %17, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds double, double* %91, i64 %93
  %95 = load double, double* %94, align 8
  %96 = fmul double %90, %95
  %97 = load double, double* %11, align 8
  %98 = load double*, double** %16, align 8
  %99 = load i32, i32* %17, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double* %98, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fmul double %97, %102
  %104 = fadd double %96, %103
  %105 = load double*, double** %16, align 8
  %106 = load i32, i32* %17, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double* %105, i64 %107
  store double %104, double* %108, align 8
  br label %109

; <label>:109:                                    ; preds = %89
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_kernel_gesummv, i64 0, i64 1)
  %110 = add i64 %pgocount1, 1
  store i64 %110, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_kernel_gesummv, i64 0, i64 1)
  %111 = load i32, i32* %17, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %17, align 4
  br label %19

; <label>:113:                                    ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_kernel_gesummv, i64 0, i64 2)
  %114 = add i64 %pgocount2, 1
  store i64 %114, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_kernel_gesummv, i64 0, i64 2)
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
