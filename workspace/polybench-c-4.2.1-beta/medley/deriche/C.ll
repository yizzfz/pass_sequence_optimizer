; ModuleID = 'B.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_deriche = private constant [19 x i8] c"B.ll:kernel_deriche"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_deriche = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_deriche = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3963923321610283555, i64 267398641768, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i32 0, i32 0), i8* null, i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [53 x i8] c"93x\DA\CBM\CC\CCct\D2\CB\C9\B1\CA\CC\CB,\89O,*J\AC\84\F0\B3S\8B\F2Rs\E2SR\8B2\933R!b\05E\99yPE\00Ip\14\C0", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_deriche to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = alloca [4096 x [2160 x float]]*, align 8
  %10 = alloca [4096 x [2160 x float]]*, align 8
  %11 = alloca [4096 x [2160 x float]]*, align 8
  %12 = alloca [4096 x [2160 x float]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 4096, i32* %6, align 4
  store i32 2160, i32* %7, align 4
  %13 = call i8* @polybench_alloc_data(i64 8847360, i32 4)
  %14 = bitcast i8* %13 to [4096 x [2160 x float]]*
  store [4096 x [2160 x float]]* %14, [4096 x [2160 x float]]** %9, align 8
  %15 = call i8* @polybench_alloc_data(i64 8847360, i32 4)
  %16 = bitcast i8* %15 to [4096 x [2160 x float]]*
  store [4096 x [2160 x float]]* %16, [4096 x [2160 x float]]** %10, align 8
  %17 = call i8* @polybench_alloc_data(i64 8847360, i32 4)
  %18 = bitcast i8* %17 to [4096 x [2160 x float]]*
  store [4096 x [2160 x float]]* %18, [4096 x [2160 x float]]** %11, align 8
  %19 = call i8* @polybench_alloc_data(i64 8847360, i32 4)
  %20 = bitcast i8* %19 to [4096 x [2160 x float]]*
  store [4096 x [2160 x float]]* %20, [4096 x [2160 x float]]** %12, align 8
  %21 = load i32, i32* %6, align 4
  %22 = load i32, i32* %7, align 4
  %23 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %9, align 8
  %24 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %23, i32 0, i32 0
  %25 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %10, align 8
  %26 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %25, i32 0, i32 0
  call void @init_array(i32 %21, i32 %22, float* %8, [2160 x float]* %24, [2160 x float]* %26)
  call void (...) @polybench_timer_start()
  %27 = load i32, i32* %6, align 4
  %28 = load i32, i32* %7, align 4
  %29 = load float, float* %8, align 4
  %30 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %9, align 8
  %31 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %30, i32 0, i32 0
  %32 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %10, align 8
  %33 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %32, i32 0, i32 0
  %34 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %11, align 8
  %35 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %34, i32 0, i32 0
  %36 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %12, align 8
  %37 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %36, i32 0, i32 0
  call void @kernel_deriche(i32 %27, i32 %28, float %29, [2160 x float]* %31, [2160 x float]* %33, [2160 x float]* %35, [2160 x float]* %37)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %38 = load i32, i32* %4, align 4
  %39 = icmp sgt i32 %38, 42
  br i1 %39, label %40, label %53

; <label>:40:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %42 = load i8**, i8*** %5, align 8
  %43 = getelementptr inbounds i8*, i8** %42, i64 0
  %44 = load i8*, i8** %43, align 8
  %45 = call i32 @strcmp(i8* %44, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %53, label %47

; <label>:47:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %49 = load i32, i32* %6, align 4
  %50 = load i32, i32* %7, align 4
  %51 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %10, align 8
  %52 = getelementptr inbounds [4096 x [2160 x float]], [4096 x [2160 x float]]* %51, i32 0, i32 0
  call void @print_array(i32 %49, i32 %50, [2160 x float]* %52)
  br label %53

; <label>:53:                                     ; preds = %47, %40, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %55 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %9, align 8
  %56 = bitcast [4096 x [2160 x float]]* %55 to i8*
  call void @free(i8* %56) #4
  %57 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %10, align 8
  %58 = bitcast [4096 x [2160 x float]]* %57 to i8*
  call void @free(i8* %58) #4
  %59 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %11, align 8
  %60 = bitcast [4096 x [2160 x float]]* %59 to i8*
  call void @free(i8* %60) #4
  %61 = load [4096 x [2160 x float]]*, [4096 x [2160 x float]]** %12, align 8
  %62 = bitcast [4096 x [2160 x float]]* %61 to i8*
  call void @free(i8* %62) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: nounwind uwtable
define internal void @init_array(i32, i32, float*, [2160 x float]*, [2160 x float]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca float*, align 8
  %9 = alloca [2160 x float]*, align 8
  %10 = alloca [2160 x float]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store float* %2, float** %8, align 8
  store [2160 x float]* %3, [2160 x float]** %9, align 8
  store [2160 x float]* %4, [2160 x float]** %10, align 8
  %13 = load float*, float** %8, align 8
  store float 2.500000e-01, float* %13, align 4
  store i32 0, i32* %11, align 4
  br label %14

; <label>:14:                                     ; preds = %44, %5
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %48

; <label>:18:                                     ; preds = %14
  store i32 0, i32* %12, align 4
  br label %19

; <label>:19:                                     ; preds = %39, %18
  %20 = load i32, i32* %12, align 4
  %21 = load i32, i32* %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %43

; <label>:23:                                     ; preds = %19
  %24 = load i32, i32* %11, align 4
  %25 = mul nsw i32 313, %24
  %26 = load i32, i32* %12, align 4
  %27 = mul nsw i32 991, %26
  %28 = add nsw i32 %25, %27
  %29 = srem i32 %28, 65536
  %30 = sitofp i32 %29 to float
  %31 = fdiv float %30, 6.553500e+04
  %32 = load [2160 x float]*, [2160 x float]** %9, align 8
  %33 = load i32, i32* %11, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [2160 x float], [2160 x float]* %32, i64 %34
  %36 = load i32, i32* %12, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [2160 x float], [2160 x float]* %35, i64 0, i64 %37
  store float %31, float* %38, align 4
  br label %39

; <label>:39:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %41 = load i32, i32* %12, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %12, align 4
  br label %19

; <label>:43:                                     ; preds = %19
  br label %44

; <label>:44:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %46 = load i32, i32* %11, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %11, align 4
  br label %14

; <label>:48:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %49 = add i64 %pgocount2, 1
  store i64 %49, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]*, [2160 x float]*, [2160 x float]*, [2160 x float]*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca [2160 x float]*, align 8
  %12 = alloca [2160 x float]*, align 8
  %13 = alloca [2160 x float]*, align 8
  %14 = alloca [2160 x float]*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  %24 = alloca float, align 4
  %25 = alloca float, align 4
  %26 = alloca float, align 4
  %27 = alloca float, align 4
  %28 = alloca float, align 4
  %29 = alloca float, align 4
  %30 = alloca float, align 4
  %31 = alloca float, align 4
  %32 = alloca float, align 4
  %33 = alloca float, align 4
  %34 = alloca float, align 4
  %35 = alloca float, align 4
  %36 = alloca float, align 4
  %37 = alloca float, align 4
  %38 = alloca float, align 4
  %39 = alloca float, align 4
  store i32 %0, i32* %8, align 4
  store i32 %1, i32* %9, align 4
  store float %2, float* %10, align 4
  store [2160 x float]* %3, [2160 x float]** %11, align 8
  store [2160 x float]* %4, [2160 x float]** %12, align 8
  store [2160 x float]* %5, [2160 x float]** %13, align 8
  store [2160 x float]* %6, [2160 x float]** %14, align 8
  %40 = load float, float* %10, align 4
  %41 = fsub float -0.000000e+00, %40
  %42 = call float @expf(float %41) #4
  %43 = fsub float 1.000000e+00, %42
  %44 = load float, float* %10, align 4
  %45 = fsub float -0.000000e+00, %44
  %46 = call float @expf(float %45) #4
  %47 = fsub float 1.000000e+00, %46
  %48 = fmul float %43, %47
  %49 = load float, float* %10, align 4
  %50 = fmul float 2.000000e+00, %49
  %51 = load float, float* %10, align 4
  %52 = fsub float -0.000000e+00, %51
  %53 = call float @expf(float %52) #4
  %54 = fmul float %50, %53
  %55 = fadd float 1.000000e+00, %54
  %56 = load float, float* %10, align 4
  %57 = fmul float 2.000000e+00, %56
  %58 = call float @expf(float %57) #4
  %59 = fsub float %55, %58
  %60 = fdiv float %48, %59
  store float %60, float* %27, align 4
  %61 = load float, float* %27, align 4
  store float %61, float* %32, align 4
  store float %61, float* %28, align 4
  %62 = load float, float* %27, align 4
  %63 = load float, float* %10, align 4
  %64 = fsub float -0.000000e+00, %63
  %65 = call float @expf(float %64) #4
  %66 = fmul float %62, %65
  %67 = load float, float* %10, align 4
  %68 = fsub float %67, 1.000000e+00
  %69 = fmul float %66, %68
  store float %69, float* %33, align 4
  store float %69, float* %29, align 4
  %70 = load float, float* %27, align 4
  %71 = load float, float* %10, align 4
  %72 = fsub float -0.000000e+00, %71
  %73 = call float @expf(float %72) #4
  %74 = fmul float %70, %73
  %75 = load float, float* %10, align 4
  %76 = fadd float %75, 1.000000e+00
  %77 = fmul float %74, %76
  store float %77, float* %34, align 4
  store float %77, float* %30, align 4
  %78 = load float, float* %27, align 4
  %79 = fsub float -0.000000e+00, %78
  %80 = load float, float* %10, align 4
  %81 = fmul float -2.000000e+00, %80
  %82 = call float @expf(float %81) #4
  %83 = fmul float %79, %82
  store float %83, float* %35, align 4
  store float %83, float* %31, align 4
  %84 = load float, float* %10, align 4
  %85 = fsub float -0.000000e+00, %84
  %86 = call float @powf(float 2.000000e+00, float %85) #4
  store float %86, float* %36, align 4
  %87 = load float, float* %10, align 4
  %88 = fmul float -2.000000e+00, %87
  %89 = call float @expf(float %88) #4
  %90 = fsub float -0.000000e+00, %89
  store float %90, float* %37, align 4
  store float 1.000000e+00, float* %39, align 4
  store float 1.000000e+00, float* %38, align 4
  store i32 0, i32* %15, align 4
  br label %91

; <label>:91:                                     ; preds = %152, %7
  %92 = load i32, i32* %15, align 4
  %93 = load i32, i32* %8, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %156

; <label>:95:                                     ; preds = %91
  store float 0.000000e+00, float* %19, align 4
  store float 0.000000e+00, float* %20, align 4
  store float 0.000000e+00, float* %17, align 4
  store i32 0, i32* %16, align 4
  br label %96

; <label>:96:                                     ; preds = %147, %95
  %97 = load i32, i32* %16, align 4
  %98 = load i32, i32* %9, align 4
  %99 = icmp slt i32 %97, %98
  br i1 %99, label %100, label %151

; <label>:100:                                    ; preds = %96
  %101 = load float, float* %28, align 4
  %102 = load [2160 x float]*, [2160 x float]** %11, align 8
  %103 = load i32, i32* %15, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %102, i64 %104
  %106 = load i32, i32* %16, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %105, i64 0, i64 %107
  %109 = load float, float* %108, align 4
  %110 = fmul float %101, %109
  %111 = load float, float* %29, align 4
  %112 = load float, float* %17, align 4
  %113 = fmul float %111, %112
  %114 = fadd float %110, %113
  %115 = load float, float* %36, align 4
  %116 = load float, float* %19, align 4
  %117 = fmul float %115, %116
  %118 = fadd float %114, %117
  %119 = load float, float* %37, align 4
  %120 = load float, float* %20, align 4
  %121 = fmul float %119, %120
  %122 = fadd float %118, %121
  %123 = load [2160 x float]*, [2160 x float]** %13, align 8
  %124 = load i32, i32* %15, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %123, i64 %125
  %127 = load i32, i32* %16, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %126, i64 0, i64 %128
  store float %122, float* %129, align 4
  %130 = load [2160 x float]*, [2160 x float]** %11, align 8
  %131 = load i32, i32* %15, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %130, i64 %132
  %134 = load i32, i32* %16, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [2160 x float], [2160 x float]* %133, i64 0, i64 %135
  %137 = load float, float* %136, align 4
  store float %137, float* %17, align 4
  %138 = load float, float* %19, align 4
  store float %138, float* %20, align 4
  %139 = load [2160 x float]*, [2160 x float]** %13, align 8
  %140 = load i32, i32* %15, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %139, i64 %141
  %143 = load i32, i32* %16, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %142, i64 0, i64 %144
  %146 = load float, float* %145, align 4
  store float %146, float* %19, align 4
  br label %147

; <label>:147:                                    ; preds = %100
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 0)
  %148 = add i64 %pgocount, 1
  store i64 %148, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 0)
  %149 = load i32, i32* %16, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %16, align 4
  br label %96

; <label>:151:                                    ; preds = %96
  br label %152

; <label>:152:                                    ; preds = %151
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 6)
  %153 = add i64 %pgocount1, 1
  store i64 %153, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 6)
  %154 = load i32, i32* %15, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %15, align 4
  br label %91

; <label>:156:                                    ; preds = %91
  store i32 0, i32* %15, align 4
  br label %157

; <label>:157:                                    ; preds = %213, %156
  %158 = load i32, i32* %15, align 4
  %159 = load i32, i32* %8, align 4
  %160 = icmp slt i32 %158, %159
  br i1 %160, label %161, label %217

; <label>:161:                                    ; preds = %157
  store float 0.000000e+00, float* %25, align 4
  store float 0.000000e+00, float* %26, align 4
  store float 0.000000e+00, float* %21, align 4
  store float 0.000000e+00, float* %22, align 4
  %162 = load i32, i32* %9, align 4
  %163 = sub nsw i32 %162, 1
  store i32 %163, i32* %16, align 4
  br label %164

; <label>:164:                                    ; preds = %208, %161
  %165 = load i32, i32* %16, align 4
  %166 = icmp sge i32 %165, 0
  br i1 %166, label %167, label %212

; <label>:167:                                    ; preds = %164
  %168 = load float, float* %30, align 4
  %169 = load float, float* %21, align 4
  %170 = fmul float %168, %169
  %171 = load float, float* %31, align 4
  %172 = load float, float* %22, align 4
  %173 = fmul float %171, %172
  %174 = fadd float %170, %173
  %175 = load float, float* %36, align 4
  %176 = load float, float* %25, align 4
  %177 = fmul float %175, %176
  %178 = fadd float %174, %177
  %179 = load float, float* %37, align 4
  %180 = load float, float* %26, align 4
  %181 = fmul float %179, %180
  %182 = fadd float %178, %181
  %183 = load [2160 x float]*, [2160 x float]** %14, align 8
  %184 = load i32, i32* %15, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [2160 x float], [2160 x float]* %183, i64 %185
  %187 = load i32, i32* %16, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [2160 x float], [2160 x float]* %186, i64 0, i64 %188
  store float %182, float* %189, align 4
  %190 = load float, float* %21, align 4
  store float %190, float* %22, align 4
  %191 = load [2160 x float]*, [2160 x float]** %11, align 8
  %192 = load i32, i32* %15, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [2160 x float], [2160 x float]* %191, i64 %193
  %195 = load i32, i32* %16, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %194, i64 0, i64 %196
  %198 = load float, float* %197, align 4
  store float %198, float* %21, align 4
  %199 = load float, float* %25, align 4
  store float %199, float* %26, align 4
  %200 = load [2160 x float]*, [2160 x float]** %14, align 8
  %201 = load i32, i32* %15, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %200, i64 %202
  %204 = load i32, i32* %16, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %203, i64 0, i64 %205
  %207 = load float, float* %206, align 4
  store float %207, float* %25, align 4
  br label %208

; <label>:208:                                    ; preds = %167
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 1)
  %209 = add i64 %pgocount2, 1
  store i64 %209, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 1)
  %210 = load i32, i32* %16, align 4
  %211 = add nsw i32 %210, -1
  store i32 %211, i32* %16, align 4
  br label %164

; <label>:212:                                    ; preds = %164
  br label %213

; <label>:213:                                    ; preds = %212
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 7)
  %214 = add i64 %pgocount3, 1
  store i64 %214, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 7)
  %215 = load i32, i32* %15, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, i32* %15, align 4
  br label %157

; <label>:217:                                    ; preds = %157
  store i32 0, i32* %15, align 4
  br label %218

; <label>:218:                                    ; preds = %259, %217
  %219 = load i32, i32* %15, align 4
  %220 = load i32, i32* %8, align 4
  %221 = icmp slt i32 %219, %220
  br i1 %221, label %222, label %263

; <label>:222:                                    ; preds = %218
  store i32 0, i32* %16, align 4
  br label %223

; <label>:223:                                    ; preds = %254, %222
  %224 = load i32, i32* %16, align 4
  %225 = load i32, i32* %9, align 4
  %226 = icmp slt i32 %224, %225
  br i1 %226, label %227, label %258

; <label>:227:                                    ; preds = %223
  %228 = load float, float* %38, align 4
  %229 = load [2160 x float]*, [2160 x float]** %13, align 8
  %230 = load i32, i32* %15, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [2160 x float], [2160 x float]* %229, i64 %231
  %233 = load i32, i32* %16, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [2160 x float], [2160 x float]* %232, i64 0, i64 %234
  %236 = load float, float* %235, align 4
  %237 = load [2160 x float]*, [2160 x float]** %14, align 8
  %238 = load i32, i32* %15, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [2160 x float], [2160 x float]* %237, i64 %239
  %241 = load i32, i32* %16, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [2160 x float], [2160 x float]* %240, i64 0, i64 %242
  %244 = load float, float* %243, align 4
  %245 = fadd float %236, %244
  %246 = fmul float %228, %245
  %247 = load [2160 x float]*, [2160 x float]** %12, align 8
  %248 = load i32, i32* %15, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [2160 x float], [2160 x float]* %247, i64 %249
  %251 = load i32, i32* %16, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [2160 x float], [2160 x float]* %250, i64 0, i64 %252
  store float %246, float* %253, align 4
  br label %254

; <label>:254:                                    ; preds = %227
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 2)
  %255 = add i64 %pgocount4, 1
  store i64 %255, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 2)
  %256 = load i32, i32* %16, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, i32* %16, align 4
  br label %223

; <label>:258:                                    ; preds = %223
  br label %259

; <label>:259:                                    ; preds = %258
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 8)
  %260 = add i64 %pgocount5, 1
  store i64 %260, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 8)
  %261 = load i32, i32* %15, align 4
  %262 = add nsw i32 %261, 1
  store i32 %262, i32* %15, align 4
  br label %218

; <label>:263:                                    ; preds = %218
  store i32 0, i32* %16, align 4
  br label %264

; <label>:264:                                    ; preds = %325, %263
  %265 = load i32, i32* %16, align 4
  %266 = load i32, i32* %9, align 4
  %267 = icmp slt i32 %265, %266
  br i1 %267, label %268, label %329

; <label>:268:                                    ; preds = %264
  store float 0.000000e+00, float* %18, align 4
  store float 0.000000e+00, float* %19, align 4
  store float 0.000000e+00, float* %20, align 4
  store i32 0, i32* %15, align 4
  br label %269

; <label>:269:                                    ; preds = %320, %268
  %270 = load i32, i32* %15, align 4
  %271 = load i32, i32* %8, align 4
  %272 = icmp slt i32 %270, %271
  br i1 %272, label %273, label %324

; <label>:273:                                    ; preds = %269
  %274 = load float, float* %32, align 4
  %275 = load [2160 x float]*, [2160 x float]** %12, align 8
  %276 = load i32, i32* %15, align 4
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [2160 x float], [2160 x float]* %275, i64 %277
  %279 = load i32, i32* %16, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [2160 x float], [2160 x float]* %278, i64 0, i64 %280
  %282 = load float, float* %281, align 4
  %283 = fmul float %274, %282
  %284 = load float, float* %33, align 4
  %285 = load float, float* %18, align 4
  %286 = fmul float %284, %285
  %287 = fadd float %283, %286
  %288 = load float, float* %36, align 4
  %289 = load float, float* %19, align 4
  %290 = fmul float %288, %289
  %291 = fadd float %287, %290
  %292 = load float, float* %37, align 4
  %293 = load float, float* %20, align 4
  %294 = fmul float %292, %293
  %295 = fadd float %291, %294
  %296 = load [2160 x float]*, [2160 x float]** %13, align 8
  %297 = load i32, i32* %15, align 4
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [2160 x float], [2160 x float]* %296, i64 %298
  %300 = load i32, i32* %16, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [2160 x float], [2160 x float]* %299, i64 0, i64 %301
  store float %295, float* %302, align 4
  %303 = load [2160 x float]*, [2160 x float]** %12, align 8
  %304 = load i32, i32* %15, align 4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [2160 x float], [2160 x float]* %303, i64 %305
  %307 = load i32, i32* %16, align 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [2160 x float], [2160 x float]* %306, i64 0, i64 %308
  %310 = load float, float* %309, align 4
  store float %310, float* %18, align 4
  %311 = load float, float* %19, align 4
  store float %311, float* %20, align 4
  %312 = load [2160 x float]*, [2160 x float]** %13, align 8
  %313 = load i32, i32* %15, align 4
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [2160 x float], [2160 x float]* %312, i64 %314
  %316 = load i32, i32* %16, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [2160 x float], [2160 x float]* %315, i64 0, i64 %317
  %319 = load float, float* %318, align 4
  store float %319, float* %19, align 4
  br label %320

; <label>:320:                                    ; preds = %273
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 3)
  %321 = add i64 %pgocount6, 1
  store i64 %321, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 3)
  %322 = load i32, i32* %15, align 4
  %323 = add nsw i32 %322, 1
  store i32 %323, i32* %15, align 4
  br label %269

; <label>:324:                                    ; preds = %269
  br label %325

; <label>:325:                                    ; preds = %324
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 9)
  %326 = add i64 %pgocount7, 1
  store i64 %326, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 9)
  %327 = load i32, i32* %16, align 4
  %328 = add nsw i32 %327, 1
  store i32 %328, i32* %16, align 4
  br label %264

; <label>:329:                                    ; preds = %264
  store i32 0, i32* %16, align 4
  br label %330

; <label>:330:                                    ; preds = %386, %329
  %331 = load i32, i32* %16, align 4
  %332 = load i32, i32* %9, align 4
  %333 = icmp slt i32 %331, %332
  br i1 %333, label %334, label %390

; <label>:334:                                    ; preds = %330
  store float 0.000000e+00, float* %23, align 4
  store float 0.000000e+00, float* %24, align 4
  store float 0.000000e+00, float* %25, align 4
  store float 0.000000e+00, float* %26, align 4
  %335 = load i32, i32* %8, align 4
  %336 = sub nsw i32 %335, 1
  store i32 %336, i32* %15, align 4
  br label %337

; <label>:337:                                    ; preds = %381, %334
  %338 = load i32, i32* %15, align 4
  %339 = icmp sge i32 %338, 0
  br i1 %339, label %340, label %385

; <label>:340:                                    ; preds = %337
  %341 = load float, float* %34, align 4
  %342 = load float, float* %23, align 4
  %343 = fmul float %341, %342
  %344 = load float, float* %35, align 4
  %345 = load float, float* %24, align 4
  %346 = fmul float %344, %345
  %347 = fadd float %343, %346
  %348 = load float, float* %36, align 4
  %349 = load float, float* %25, align 4
  %350 = fmul float %348, %349
  %351 = fadd float %347, %350
  %352 = load float, float* %37, align 4
  %353 = load float, float* %26, align 4
  %354 = fmul float %352, %353
  %355 = fadd float %351, %354
  %356 = load [2160 x float]*, [2160 x float]** %14, align 8
  %357 = load i32, i32* %15, align 4
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds [2160 x float], [2160 x float]* %356, i64 %358
  %360 = load i32, i32* %16, align 4
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds [2160 x float], [2160 x float]* %359, i64 0, i64 %361
  store float %355, float* %362, align 4
  %363 = load float, float* %23, align 4
  store float %363, float* %24, align 4
  %364 = load [2160 x float]*, [2160 x float]** %12, align 8
  %365 = load i32, i32* %15, align 4
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds [2160 x float], [2160 x float]* %364, i64 %366
  %368 = load i32, i32* %16, align 4
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds [2160 x float], [2160 x float]* %367, i64 0, i64 %369
  %371 = load float, float* %370, align 4
  store float %371, float* %23, align 4
  %372 = load float, float* %25, align 4
  store float %372, float* %26, align 4
  %373 = load [2160 x float]*, [2160 x float]** %14, align 8
  %374 = load i32, i32* %15, align 4
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds [2160 x float], [2160 x float]* %373, i64 %375
  %377 = load i32, i32* %16, align 4
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds [2160 x float], [2160 x float]* %376, i64 0, i64 %378
  %380 = load float, float* %379, align 4
  store float %380, float* %25, align 4
  br label %381

; <label>:381:                                    ; preds = %340
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 4)
  %382 = add i64 %pgocount8, 1
  store i64 %382, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 4)
  %383 = load i32, i32* %15, align 4
  %384 = add nsw i32 %383, -1
  store i32 %384, i32* %15, align 4
  br label %337

; <label>:385:                                    ; preds = %337
  br label %386

; <label>:386:                                    ; preds = %385
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 10)
  %387 = add i64 %pgocount9, 1
  store i64 %387, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 10)
  %388 = load i32, i32* %16, align 4
  %389 = add nsw i32 %388, 1
  store i32 %389, i32* %16, align 4
  br label %330

; <label>:390:                                    ; preds = %330
  store i32 0, i32* %15, align 4
  br label %391

; <label>:391:                                    ; preds = %432, %390
  %392 = load i32, i32* %15, align 4
  %393 = load i32, i32* %8, align 4
  %394 = icmp slt i32 %392, %393
  br i1 %394, label %395, label %436

; <label>:395:                                    ; preds = %391
  store i32 0, i32* %16, align 4
  br label %396

; <label>:396:                                    ; preds = %427, %395
  %397 = load i32, i32* %16, align 4
  %398 = load i32, i32* %9, align 4
  %399 = icmp slt i32 %397, %398
  br i1 %399, label %400, label %431

; <label>:400:                                    ; preds = %396
  %401 = load float, float* %39, align 4
  %402 = load [2160 x float]*, [2160 x float]** %13, align 8
  %403 = load i32, i32* %15, align 4
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds [2160 x float], [2160 x float]* %402, i64 %404
  %406 = load i32, i32* %16, align 4
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds [2160 x float], [2160 x float]* %405, i64 0, i64 %407
  %409 = load float, float* %408, align 4
  %410 = load [2160 x float]*, [2160 x float]** %14, align 8
  %411 = load i32, i32* %15, align 4
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds [2160 x float], [2160 x float]* %410, i64 %412
  %414 = load i32, i32* %16, align 4
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds [2160 x float], [2160 x float]* %413, i64 0, i64 %415
  %417 = load float, float* %416, align 4
  %418 = fadd float %409, %417
  %419 = fmul float %401, %418
  %420 = load [2160 x float]*, [2160 x float]** %12, align 8
  %421 = load i32, i32* %15, align 4
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds [2160 x float], [2160 x float]* %420, i64 %422
  %424 = load i32, i32* %16, align 4
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds [2160 x float], [2160 x float]* %423, i64 0, i64 %425
  store float %419, float* %426, align 4
  br label %427

; <label>:427:                                    ; preds = %400
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 5)
  %428 = add i64 %pgocount10, 1
  store i64 %428, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 5)
  %429 = load i32, i32* %16, align 4
  %430 = add nsw i32 %429, 1
  store i32 %430, i32* %16, align 4
  br label %396

; <label>:431:                                    ; preds = %396
  br label %432

; <label>:432:                                    ; preds = %431
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 11)
  %433 = add i64 %pgocount11, 1
  store i64 %433, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 11)
  %434 = load i32, i32* %15, align 4
  %435 = add nsw i32 %434, 1
  store i32 %435, i32* %15, align 4
  br label %391

; <label>:436:                                    ; preds = %391
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 12)
  %437 = add i64 %pgocount12, 1
  store i64 %437, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 12)
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [2160 x float]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [2160 x float]* %2, [2160 x float]** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %13

; <label>:13:                                     ; preds = %51, %3
  %14 = load i32, i32* %7, align 4
  %15 = load i32, i32* %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %55

; <label>:17:                                     ; preds = %13
  store i32 0, i32* %8, align 4
  br label %18

; <label>:18:                                     ; preds = %46, %17
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %50

; <label>:22:                                     ; preds = %18
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %5, align 4
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
  %36 = load [2160 x float]*, [2160 x float]** %6, align 8
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %36, i64 %38
  %40 = load i32, i32* %8, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [2160 x float], [2160 x float]* %39, i64 0, i64 %41
  %43 = load float, float* %42, align 4
  %44 = fpext float %43 to double
  %45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), double %44)
  br label %46

; <label>:46:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %48 = load i32, i32* %8, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %8, align 4
  br label %18

; <label>:50:                                     ; preds = %18
  br label %51

; <label>:51:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %53 = load i32, i32* %7, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %7, align 4
  br label %13

; <label>:55:                                     ; preds = %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare float @expf(float) #3

; Function Attrs: nounwind
declare float @powf(float, float) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
