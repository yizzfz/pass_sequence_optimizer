; ModuleID = 'B.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_3mm = private constant [15 x i8] c"B.ll:kernel_3mm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 184201888009, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_3mm = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_3mm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7165158374039736084, i64 206098438531, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_3mm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_3mm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [800 x [900 x double]]*, align 8
  %12 = alloca [800 x [1000 x double]]*, align 8
  %13 = alloca [1000 x [900 x double]]*, align 8
  %14 = alloca [900 x [1100 x double]]*, align 8
  %15 = alloca [900 x [1200 x double]]*, align 8
  %16 = alloca [1200 x [1100 x double]]*, align 8
  %17 = alloca [800 x [1100 x double]]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 800, i32* %6, align 4
  store i32 900, i32* %7, align 4
  store i32 1000, i32* %8, align 4
  store i32 1100, i32* %9, align 4
  store i32 1200, i32* %10, align 4
  %18 = call i8* @polybench_alloc_data(i64 720000, i32 8)
  %19 = bitcast i8* %18 to [800 x [900 x double]]*
  store [800 x [900 x double]]* %19, [800 x [900 x double]]** %11, align 8
  %20 = call i8* @polybench_alloc_data(i64 800000, i32 8)
  %21 = bitcast i8* %20 to [800 x [1000 x double]]*
  store [800 x [1000 x double]]* %21, [800 x [1000 x double]]** %12, align 8
  %22 = call i8* @polybench_alloc_data(i64 900000, i32 8)
  %23 = bitcast i8* %22 to [1000 x [900 x double]]*
  store [1000 x [900 x double]]* %23, [1000 x [900 x double]]** %13, align 8
  %24 = call i8* @polybench_alloc_data(i64 990000, i32 8)
  %25 = bitcast i8* %24 to [900 x [1100 x double]]*
  store [900 x [1100 x double]]* %25, [900 x [1100 x double]]** %14, align 8
  %26 = call i8* @polybench_alloc_data(i64 1080000, i32 8)
  %27 = bitcast i8* %26 to [900 x [1200 x double]]*
  store [900 x [1200 x double]]* %27, [900 x [1200 x double]]** %15, align 8
  %28 = call i8* @polybench_alloc_data(i64 1320000, i32 8)
  %29 = bitcast i8* %28 to [1200 x [1100 x double]]*
  store [1200 x [1100 x double]]* %29, [1200 x [1100 x double]]** %16, align 8
  %30 = call i8* @polybench_alloc_data(i64 880000, i32 8)
  %31 = bitcast i8* %30 to [800 x [1100 x double]]*
  store [800 x [1100 x double]]* %31, [800 x [1100 x double]]** %17, align 8
  %32 = load i32, i32* %6, align 4
  %33 = load i32, i32* %7, align 4
  %34 = load i32, i32* %8, align 4
  %35 = load i32, i32* %9, align 4
  %36 = load i32, i32* %10, align 4
  %37 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %12, align 8
  %38 = getelementptr inbounds [800 x [1000 x double]], [800 x [1000 x double]]* %37, i32 0, i32 0
  %39 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %13, align 8
  %40 = getelementptr inbounds [1000 x [900 x double]], [1000 x [900 x double]]* %39, i32 0, i32 0
  %41 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %15, align 8
  %42 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %41, i32 0, i32 0
  %43 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %16, align 8
  %44 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %43, i32 0, i32 0
  call void @init_array(i32 %32, i32 %33, i32 %34, i32 %35, i32 %36, [1000 x double]* %38, [900 x double]* %40, [1200 x double]* %42, [1100 x double]* %44)
  call void (...) @polybench_timer_start()
  %45 = load i32, i32* %6, align 4
  %46 = load i32, i32* %7, align 4
  %47 = load i32, i32* %8, align 4
  %48 = load i32, i32* %9, align 4
  %49 = load i32, i32* %10, align 4
  %50 = load [800 x [900 x double]]*, [800 x [900 x double]]** %11, align 8
  %51 = getelementptr inbounds [800 x [900 x double]], [800 x [900 x double]]* %50, i32 0, i32 0
  %52 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %12, align 8
  %53 = getelementptr inbounds [800 x [1000 x double]], [800 x [1000 x double]]* %52, i32 0, i32 0
  %54 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %13, align 8
  %55 = getelementptr inbounds [1000 x [900 x double]], [1000 x [900 x double]]* %54, i32 0, i32 0
  %56 = load [900 x [1100 x double]]*, [900 x [1100 x double]]** %14, align 8
  %57 = getelementptr inbounds [900 x [1100 x double]], [900 x [1100 x double]]* %56, i32 0, i32 0
  %58 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %15, align 8
  %59 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %58, i32 0, i32 0
  %60 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %16, align 8
  %61 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %60, i32 0, i32 0
  %62 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %17, align 8
  %63 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %62, i32 0, i32 0
  call void @kernel_3mm(i32 %45, i32 %46, i32 %47, i32 %48, i32 %49, [900 x double]* %51, [1000 x double]* %53, [900 x double]* %55, [1100 x double]* %57, [1200 x double]* %59, [1100 x double]* %61, [1100 x double]* %63)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %64 = load i32, i32* %4, align 4
  %65 = icmp sgt i32 %64, 42
  br i1 %65, label %66, label %79

; <label>:66:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %67 = add i64 %pgocount, 1
  store i64 %67, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %68 = load i8**, i8*** %5, align 8
  %69 = getelementptr inbounds i8*, i8** %68, i64 0
  %70 = load i8*, i8** %69, align 8
  %71 = call i32 @strcmp(i8* %70, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %79, label %73

; <label>:73:                                     ; preds = %66
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %74 = add i64 %pgocount1, 1
  store i64 %74, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %75 = load i32, i32* %6, align 4
  %76 = load i32, i32* %9, align 4
  %77 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %17, align 8
  %78 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %77, i32 0, i32 0
  call void @print_array(i32 %75, i32 %76, [1100 x double]* %78)
  br label %79

; <label>:79:                                     ; preds = %73, %66, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %80 = add i64 %pgocount2, 1
  store i64 %80, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %81 = load [800 x [900 x double]]*, [800 x [900 x double]]** %11, align 8
  %82 = bitcast [800 x [900 x double]]* %81 to i8*
  call void @free(i8* %82) #4
  %83 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %12, align 8
  %84 = bitcast [800 x [1000 x double]]* %83 to i8*
  call void @free(i8* %84) #4
  %85 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %13, align 8
  %86 = bitcast [1000 x [900 x double]]* %85 to i8*
  call void @free(i8* %86) #4
  %87 = load [900 x [1100 x double]]*, [900 x [1100 x double]]** %14, align 8
  %88 = bitcast [900 x [1100 x double]]* %87 to i8*
  call void @free(i8* %88) #4
  %89 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %15, align 8
  %90 = bitcast [900 x [1200 x double]]* %89 to i8*
  call void @free(i8* %90) #4
  %91 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %16, align 8
  %92 = bitcast [1200 x [1100 x double]]* %91 to i8*
  call void @free(i8* %92) #4
  %93 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %17, align 8
  %94 = bitcast [800 x [1100 x double]]* %93 to i8*
  call void @free(i8* %94) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, i32, [1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) #0 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca [1000 x double]*, align 8
  %16 = alloca [900 x double]*, align 8
  %17 = alloca [1200 x double]*, align 8
  %18 = alloca [1100 x double]*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store i32 %0, i32* %10, align 4
  store i32 %1, i32* %11, align 4
  store i32 %2, i32* %12, align 4
  store i32 %3, i32* %13, align 4
  store i32 %4, i32* %14, align 4
  store [1000 x double]* %5, [1000 x double]** %15, align 8
  store [900 x double]* %6, [900 x double]** %16, align 8
  store [1200 x double]* %7, [1200 x double]** %17, align 8
  store [1100 x double]* %8, [1100 x double]** %18, align 8
  store i32 0, i32* %19, align 4
  br label %21

; <label>:21:                                     ; preds = %54, %9
  %22 = load i32, i32* %19, align 4
  %23 = load i32, i32* %10, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %58

; <label>:25:                                     ; preds = %21
  store i32 0, i32* %20, align 4
  br label %26

; <label>:26:                                     ; preds = %49, %25
  %27 = load i32, i32* %20, align 4
  %28 = load i32, i32* %12, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %53

; <label>:30:                                     ; preds = %26
  %31 = load i32, i32* %19, align 4
  %32 = load i32, i32* %20, align 4
  %33 = mul nsw i32 %31, %32
  %34 = add nsw i32 %33, 1
  %35 = load i32, i32* %10, align 4
  %36 = srem i32 %34, %35
  %37 = sitofp i32 %36 to double
  %38 = load i32, i32* %10, align 4
  %39 = mul nsw i32 5, %38
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %37, %40
  %42 = load [1000 x double]*, [1000 x double]** %15, align 8
  %43 = load i32, i32* %19, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %44
  %46 = load i32, i32* %20, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 0, i64 %47
  store double %41, double* %48, align 8
  br label %49

; <label>:49:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %50 = add i64 %pgocount, 1
  store i64 %50, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %51 = load i32, i32* %20, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %20, align 4
  br label %26

; <label>:53:                                     ; preds = %26
  br label %54

; <label>:54:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %56 = load i32, i32* %19, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %19, align 4
  br label %21

; <label>:58:                                     ; preds = %21
  store i32 0, i32* %19, align 4
  br label %59

; <label>:59:                                     ; preds = %93, %58
  %60 = load i32, i32* %19, align 4
  %61 = load i32, i32* %12, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %97

; <label>:63:                                     ; preds = %59
  store i32 0, i32* %20, align 4
  br label %64

; <label>:64:                                     ; preds = %88, %63
  %65 = load i32, i32* %20, align 4
  %66 = load i32, i32* %11, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %68, label %92

; <label>:68:                                     ; preds = %64
  %69 = load i32, i32* %19, align 4
  %70 = load i32, i32* %20, align 4
  %71 = add nsw i32 %70, 1
  %72 = mul nsw i32 %69, %71
  %73 = add nsw i32 %72, 2
  %74 = load i32, i32* %11, align 4
  %75 = srem i32 %73, %74
  %76 = sitofp i32 %75 to double
  %77 = load i32, i32* %11, align 4
  %78 = mul nsw i32 5, %77
  %79 = sitofp i32 %78 to double
  %80 = fdiv double %76, %79
  %81 = load [900 x double]*, [900 x double]** %16, align 8
  %82 = load i32, i32* %19, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [900 x double], [900 x double]* %81, i64 %83
  %85 = load i32, i32* %20, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [900 x double], [900 x double]* %84, i64 0, i64 %86
  store double %80, double* %87, align 8
  br label %88

; <label>:88:                                     ; preds = %68
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %89 = add i64 %pgocount2, 1
  store i64 %89, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %90 = load i32, i32* %20, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %20, align 4
  br label %64

; <label>:92:                                     ; preds = %64
  br label %93

; <label>:93:                                     ; preds = %92
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %94 = add i64 %pgocount3, 1
  store i64 %94, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %95 = load i32, i32* %19, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %19, align 4
  br label %59

; <label>:97:                                     ; preds = %59
  store i32 0, i32* %19, align 4
  br label %98

; <label>:98:                                     ; preds = %131, %97
  %99 = load i32, i32* %19, align 4
  %100 = load i32, i32* %11, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %135

; <label>:102:                                    ; preds = %98
  store i32 0, i32* %20, align 4
  br label %103

; <label>:103:                                    ; preds = %126, %102
  %104 = load i32, i32* %20, align 4
  %105 = load i32, i32* %14, align 4
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %107, label %130

; <label>:107:                                    ; preds = %103
  %108 = load i32, i32* %19, align 4
  %109 = load i32, i32* %20, align 4
  %110 = add nsw i32 %109, 3
  %111 = mul nsw i32 %108, %110
  %112 = load i32, i32* %13, align 4
  %113 = srem i32 %111, %112
  %114 = sitofp i32 %113 to double
  %115 = load i32, i32* %13, align 4
  %116 = mul nsw i32 5, %115
  %117 = sitofp i32 %116 to double
  %118 = fdiv double %114, %117
  %119 = load [1200 x double]*, [1200 x double]** %17, align 8
  %120 = load i32, i32* %19, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %119, i64 %121
  %123 = load i32, i32* %20, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %122, i64 0, i64 %124
  store double %118, double* %125, align 8
  br label %126

; <label>:126:                                    ; preds = %107
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %127 = add i64 %pgocount4, 1
  store i64 %127, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %128 = load i32, i32* %20, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %20, align 4
  br label %103

; <label>:130:                                    ; preds = %103
  br label %131

; <label>:131:                                    ; preds = %130
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %132 = add i64 %pgocount5, 1
  store i64 %132, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %133 = load i32, i32* %19, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %19, align 4
  br label %98

; <label>:135:                                    ; preds = %98
  store i32 0, i32* %19, align 4
  br label %136

; <label>:136:                                    ; preds = %170, %135
  %137 = load i32, i32* %19, align 4
  %138 = load i32, i32* %14, align 4
  %139 = icmp slt i32 %137, %138
  br i1 %139, label %140, label %174

; <label>:140:                                    ; preds = %136
  store i32 0, i32* %20, align 4
  br label %141

; <label>:141:                                    ; preds = %165, %140
  %142 = load i32, i32* %20, align 4
  %143 = load i32, i32* %13, align 4
  %144 = icmp slt i32 %142, %143
  br i1 %144, label %145, label %169

; <label>:145:                                    ; preds = %141
  %146 = load i32, i32* %19, align 4
  %147 = load i32, i32* %20, align 4
  %148 = add nsw i32 %147, 2
  %149 = mul nsw i32 %146, %148
  %150 = add nsw i32 %149, 2
  %151 = load i32, i32* %12, align 4
  %152 = srem i32 %150, %151
  %153 = sitofp i32 %152 to double
  %154 = load i32, i32* %12, align 4
  %155 = mul nsw i32 5, %154
  %156 = sitofp i32 %155 to double
  %157 = fdiv double %153, %156
  %158 = load [1100 x double]*, [1100 x double]** %18, align 8
  %159 = load i32, i32* %19, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [1100 x double], [1100 x double]* %158, i64 %160
  %162 = load i32, i32* %20, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [1100 x double], [1100 x double]* %161, i64 0, i64 %163
  store double %157, double* %164, align 8
  br label %165

; <label>:165:                                    ; preds = %145
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %166 = add i64 %pgocount6, 1
  store i64 %166, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %167 = load i32, i32* %20, align 4
  %168 = add nsw i32 %167, 1
  store i32 %168, i32* %20, align 4
  br label %141

; <label>:169:                                    ; preds = %141
  br label %170

; <label>:170:                                    ; preds = %169
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %171 = add i64 %pgocount7, 1
  store i64 %171, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %172 = load i32, i32* %19, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %19, align 4
  br label %136

; <label>:174:                                    ; preds = %136
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %175 = add i64 %pgocount8, 1
  store i64 %175, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) #0 {
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca [900 x double]*, align 8
  %19 = alloca [1000 x double]*, align 8
  %20 = alloca [900 x double]*, align 8
  %21 = alloca [1100 x double]*, align 8
  %22 = alloca [1200 x double]*, align 8
  %23 = alloca [1100 x double]*, align 8
  %24 = alloca [1100 x double]*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  store i32 %0, i32* %13, align 4
  store i32 %1, i32* %14, align 4
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store [900 x double]* %5, [900 x double]** %18, align 8
  store [1000 x double]* %6, [1000 x double]** %19, align 8
  store [900 x double]* %7, [900 x double]** %20, align 8
  store [1100 x double]* %8, [1100 x double]** %21, align 8
  store [1200 x double]* %9, [1200 x double]** %22, align 8
  store [1100 x double]* %10, [1100 x double]** %23, align 8
  store [1100 x double]* %11, [1100 x double]** %24, align 8
  store i32 0, i32* %25, align 4
  br label %28

; <label>:28:                                     ; preds = %86, %12
  %29 = load i32, i32* %25, align 4
  %30 = load i32, i32* %13, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %90

; <label>:32:                                     ; preds = %28
  store i32 0, i32* %26, align 4
  br label %33

; <label>:33:                                     ; preds = %81, %32
  %34 = load i32, i32* %26, align 4
  %35 = load i32, i32* %14, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %85

; <label>:37:                                     ; preds = %33
  %38 = load [900 x double]*, [900 x double]** %18, align 8
  %39 = load i32, i32* %25, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [900 x double], [900 x double]* %38, i64 %40
  %42 = load i32, i32* %26, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [900 x double], [900 x double]* %41, i64 0, i64 %43
  store double 0.000000e+00, double* %44, align 8
  store i32 0, i32* %27, align 4
  br label %45

; <label>:45:                                     ; preds = %76, %37
  %46 = load i32, i32* %27, align 4
  %47 = load i32, i32* %15, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %80

; <label>:49:                                     ; preds = %45
  %50 = load [1000 x double]*, [1000 x double]** %19, align 8
  %51 = load i32, i32* %25, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %50, i64 %52
  %54 = load i32, i32* %27, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %53, i64 0, i64 %55
  %57 = load double, double* %56, align 8
  %58 = load [900 x double]*, [900 x double]** %20, align 8
  %59 = load i32, i32* %27, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [900 x double], [900 x double]* %58, i64 %60
  %62 = load i32, i32* %26, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [900 x double], [900 x double]* %61, i64 0, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fmul double %57, %65
  %67 = load [900 x double]*, [900 x double]** %18, align 8
  %68 = load i32, i32* %25, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [900 x double], [900 x double]* %67, i64 %69
  %71 = load i32, i32* %26, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [900 x double], [900 x double]* %70, i64 0, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %66
  store double %75, double* %73, align 8
  br label %76

; <label>:76:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 0)
  %77 = add i64 %pgocount, 1
  store i64 %77, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 0)
  %78 = load i32, i32* %27, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %27, align 4
  br label %45

; <label>:80:                                     ; preds = %45
  br label %81

; <label>:81:                                     ; preds = %80
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 3)
  %82 = add i64 %pgocount1, 1
  store i64 %82, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 3)
  %83 = load i32, i32* %26, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %26, align 4
  br label %33

; <label>:85:                                     ; preds = %33
  br label %86

; <label>:86:                                     ; preds = %85
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 6)
  %87 = add i64 %pgocount2, 1
  store i64 %87, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 6)
  %88 = load i32, i32* %25, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %25, align 4
  br label %28

; <label>:90:                                     ; preds = %28
  store i32 0, i32* %25, align 4
  br label %91

; <label>:91:                                     ; preds = %149, %90
  %92 = load i32, i32* %25, align 4
  %93 = load i32, i32* %14, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %153

; <label>:95:                                     ; preds = %91
  store i32 0, i32* %26, align 4
  br label %96

; <label>:96:                                     ; preds = %144, %95
  %97 = load i32, i32* %26, align 4
  %98 = load i32, i32* %16, align 4
  %99 = icmp slt i32 %97, %98
  br i1 %99, label %100, label %148

; <label>:100:                                    ; preds = %96
  %101 = load [1100 x double]*, [1100 x double]** %21, align 8
  %102 = load i32, i32* %25, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %101, i64 %103
  %105 = load i32, i32* %26, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [1100 x double], [1100 x double]* %104, i64 0, i64 %106
  store double 0.000000e+00, double* %107, align 8
  store i32 0, i32* %27, align 4
  br label %108

; <label>:108:                                    ; preds = %139, %100
  %109 = load i32, i32* %27, align 4
  %110 = load i32, i32* %17, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %143

; <label>:112:                                    ; preds = %108
  %113 = load [1200 x double]*, [1200 x double]** %22, align 8
  %114 = load i32, i32* %25, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %113, i64 %115
  %117 = load i32, i32* %27, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %116, i64 0, i64 %118
  %120 = load double, double* %119, align 8
  %121 = load [1100 x double]*, [1100 x double]** %23, align 8
  %122 = load i32, i32* %27, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [1100 x double], [1100 x double]* %121, i64 %123
  %125 = load i32, i32* %26, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [1100 x double], [1100 x double]* %124, i64 0, i64 %126
  %128 = load double, double* %127, align 8
  %129 = fmul double %120, %128
  %130 = load [1100 x double]*, [1100 x double]** %21, align 8
  %131 = load i32, i32* %25, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [1100 x double], [1100 x double]* %130, i64 %132
  %134 = load i32, i32* %26, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [1100 x double], [1100 x double]* %133, i64 0, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fadd double %137, %129
  store double %138, double* %136, align 8
  br label %139

; <label>:139:                                    ; preds = %112
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 1)
  %140 = add i64 %pgocount3, 1
  store i64 %140, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 1)
  %141 = load i32, i32* %27, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %27, align 4
  br label %108

; <label>:143:                                    ; preds = %108
  br label %144

; <label>:144:                                    ; preds = %143
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 4)
  %145 = add i64 %pgocount4, 1
  store i64 %145, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 4)
  %146 = load i32, i32* %26, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, i32* %26, align 4
  br label %96

; <label>:148:                                    ; preds = %96
  br label %149

; <label>:149:                                    ; preds = %148
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 7)
  %150 = add i64 %pgocount5, 1
  store i64 %150, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 7)
  %151 = load i32, i32* %25, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %25, align 4
  br label %91

; <label>:153:                                    ; preds = %91
  store i32 0, i32* %25, align 4
  br label %154

; <label>:154:                                    ; preds = %212, %153
  %155 = load i32, i32* %25, align 4
  %156 = load i32, i32* %13, align 4
  %157 = icmp slt i32 %155, %156
  br i1 %157, label %158, label %216

; <label>:158:                                    ; preds = %154
  store i32 0, i32* %26, align 4
  br label %159

; <label>:159:                                    ; preds = %207, %158
  %160 = load i32, i32* %26, align 4
  %161 = load i32, i32* %16, align 4
  %162 = icmp slt i32 %160, %161
  br i1 %162, label %163, label %211

; <label>:163:                                    ; preds = %159
  %164 = load [1100 x double]*, [1100 x double]** %24, align 8
  %165 = load i32, i32* %25, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [1100 x double], [1100 x double]* %164, i64 %166
  %168 = load i32, i32* %26, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [1100 x double], [1100 x double]* %167, i64 0, i64 %169
  store double 0.000000e+00, double* %170, align 8
  store i32 0, i32* %27, align 4
  br label %171

; <label>:171:                                    ; preds = %202, %163
  %172 = load i32, i32* %27, align 4
  %173 = load i32, i32* %14, align 4
  %174 = icmp slt i32 %172, %173
  br i1 %174, label %175, label %206

; <label>:175:                                    ; preds = %171
  %176 = load [900 x double]*, [900 x double]** %18, align 8
  %177 = load i32, i32* %25, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [900 x double], [900 x double]* %176, i64 %178
  %180 = load i32, i32* %27, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [900 x double], [900 x double]* %179, i64 0, i64 %181
  %183 = load double, double* %182, align 8
  %184 = load [1100 x double]*, [1100 x double]** %21, align 8
  %185 = load i32, i32* %27, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [1100 x double], [1100 x double]* %184, i64 %186
  %188 = load i32, i32* %26, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [1100 x double], [1100 x double]* %187, i64 0, i64 %189
  %191 = load double, double* %190, align 8
  %192 = fmul double %183, %191
  %193 = load [1100 x double]*, [1100 x double]** %24, align 8
  %194 = load i32, i32* %25, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [1100 x double], [1100 x double]* %193, i64 %195
  %197 = load i32, i32* %26, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [1100 x double], [1100 x double]* %196, i64 0, i64 %198
  %200 = load double, double* %199, align 8
  %201 = fadd double %200, %192
  store double %201, double* %199, align 8
  br label %202

; <label>:202:                                    ; preds = %175
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 2)
  %203 = add i64 %pgocount6, 1
  store i64 %203, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 2)
  %204 = load i32, i32* %27, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %27, align 4
  br label %171

; <label>:206:                                    ; preds = %171
  br label %207

; <label>:207:                                    ; preds = %206
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 5)
  %208 = add i64 %pgocount7, 1
  store i64 %208, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 5)
  %209 = load i32, i32* %26, align 4
  %210 = add nsw i32 %209, 1
  store i32 %210, i32* %26, align 4
  br label %159

; <label>:211:                                    ; preds = %159
  br label %212

; <label>:212:                                    ; preds = %211
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 8)
  %213 = add i64 %pgocount8, 1
  store i64 %213, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 8)
  %214 = load i32, i32* %25, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %25, align 4
  br label %154

; <label>:216:                                    ; preds = %154
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 9)
  %217 = add i64 %pgocount9, 1
  store i64 %217, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 9)
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
