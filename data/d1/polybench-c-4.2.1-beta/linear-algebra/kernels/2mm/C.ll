; ModuleID = 'B.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_2mm = private constant [15 x i8] c"B.ll:kernel_2mm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 34129958376, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 184201888009, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_2mm = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_2mm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8177580728753112165, i64 138620659286, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 65463102764, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_2mm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_2mm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

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
  br i1 %56, label %57, label %70

; <label>:57:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %59 = load i8**, i8*** %5, align 8
  %60 = getelementptr inbounds i8*, i8** %59, i64 0
  %61 = load i8*, i8** %60, align 8
  %62 = call i32 @strcmp(i8* %61, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #5
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %70, label %64

; <label>:64:                                     ; preds = %57
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %65 = add i64 %pgocount1, 1
  store i64 %65, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %66 = load i32, i32* %6, align 4
  %67 = load i32, i32* %9, align 4
  %68 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %16, align 8
  %69 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %68, i32 0, i32 0
  call void @print_array(i32 %66, i32 %67, [1200 x double]* %69)
  br label %70

; <label>:70:                                     ; preds = %64, %57, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %72 = load [800 x [900 x double]]*, [800 x [900 x double]]** %12, align 8
  %73 = bitcast [800 x [900 x double]]* %72 to i8*
  call void @free(i8* %73) #4
  %74 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %13, align 8
  %75 = bitcast [800 x [1100 x double]]* %74 to i8*
  call void @free(i8* %75) #4
  %76 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %14, align 8
  %77 = bitcast [1100 x [900 x double]]* %76 to i8*
  call void @free(i8* %77) #4
  %78 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %15, align 8
  %79 = bitcast [900 x [1200 x double]]* %78 to i8*
  call void @free(i8* %79) #4
  %80 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %16, align 8
  %81 = bitcast [800 x [1200 x double]]* %80 to i8*
  call void @free(i8* %81) #4
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

; <label>:25:                                     ; preds = %57, %10
  %26 = load i32, i32* %21, align 4
  %27 = load i32, i32* %11, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %61

; <label>:29:                                     ; preds = %25
  store i32 0, i32* %22, align 4
  br label %30

; <label>:30:                                     ; preds = %52, %29
  %31 = load i32, i32* %22, align 4
  %32 = load i32, i32* %13, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %56

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
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %53 = add i64 %pgocount, 1
  store i64 %53, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %54 = load i32, i32* %22, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %22, align 4
  br label %30

; <label>:56:                                     ; preds = %30
  br label %57

; <label>:57:                                     ; preds = %56
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %59 = load i32, i32* %21, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %21, align 4
  br label %25

; <label>:61:                                     ; preds = %25
  store i32 0, i32* %21, align 4
  br label %62

; <label>:62:                                     ; preds = %94, %61
  %63 = load i32, i32* %21, align 4
  %64 = load i32, i32* %13, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %98

; <label>:66:                                     ; preds = %62
  store i32 0, i32* %22, align 4
  br label %67

; <label>:67:                                     ; preds = %89, %66
  %68 = load i32, i32* %22, align 4
  %69 = load i32, i32* %12, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %93

; <label>:71:                                     ; preds = %67
  %72 = load i32, i32* %21, align 4
  %73 = load i32, i32* %22, align 4
  %74 = add nsw i32 %73, 1
  %75 = mul nsw i32 %72, %74
  %76 = load i32, i32* %12, align 4
  %77 = srem i32 %75, %76
  %78 = sitofp i32 %77 to double
  %79 = load i32, i32* %12, align 4
  %80 = sitofp i32 %79 to double
  %81 = fdiv double %78, %80
  %82 = load [900 x double]*, [900 x double]** %18, align 8
  %83 = load i32, i32* %21, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [900 x double], [900 x double]* %82, i64 %84
  %86 = load i32, i32* %22, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [900 x double], [900 x double]* %85, i64 0, i64 %87
  store double %81, double* %88, align 8
  br label %89

; <label>:89:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %91 = load i32, i32* %22, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %22, align 4
  br label %67

; <label>:93:                                     ; preds = %67
  br label %94

; <label>:94:                                     ; preds = %93
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %95 = add i64 %pgocount3, 1
  store i64 %95, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %96 = load i32, i32* %21, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %21, align 4
  br label %62

; <label>:98:                                     ; preds = %62
  store i32 0, i32* %21, align 4
  br label %99

; <label>:99:                                     ; preds = %132, %98
  %100 = load i32, i32* %21, align 4
  %101 = load i32, i32* %12, align 4
  %102 = icmp slt i32 %100, %101
  br i1 %102, label %103, label %136

; <label>:103:                                    ; preds = %99
  store i32 0, i32* %22, align 4
  br label %104

; <label>:104:                                    ; preds = %127, %103
  %105 = load i32, i32* %22, align 4
  %106 = load i32, i32* %14, align 4
  %107 = icmp slt i32 %105, %106
  br i1 %107, label %108, label %131

; <label>:108:                                    ; preds = %104
  %109 = load i32, i32* %21, align 4
  %110 = load i32, i32* %22, align 4
  %111 = add nsw i32 %110, 3
  %112 = mul nsw i32 %109, %111
  %113 = add nsw i32 %112, 1
  %114 = load i32, i32* %14, align 4
  %115 = srem i32 %113, %114
  %116 = sitofp i32 %115 to double
  %117 = load i32, i32* %14, align 4
  %118 = sitofp i32 %117 to double
  %119 = fdiv double %116, %118
  %120 = load [1200 x double]*, [1200 x double]** %19, align 8
  %121 = load i32, i32* %21, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %120, i64 %122
  %124 = load i32, i32* %22, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %123, i64 0, i64 %125
  store double %119, double* %126, align 8
  br label %127

; <label>:127:                                    ; preds = %108
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %128 = add i64 %pgocount4, 1
  store i64 %128, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %129 = load i32, i32* %22, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %22, align 4
  br label %104

; <label>:131:                                    ; preds = %104
  br label %132

; <label>:132:                                    ; preds = %131
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %133 = add i64 %pgocount5, 1
  store i64 %133, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %134 = load i32, i32* %21, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %21, align 4
  br label %99

; <label>:136:                                    ; preds = %99
  store i32 0, i32* %21, align 4
  br label %137

; <label>:137:                                    ; preds = %169, %136
  %138 = load i32, i32* %21, align 4
  %139 = load i32, i32* %11, align 4
  %140 = icmp slt i32 %138, %139
  br i1 %140, label %141, label %173

; <label>:141:                                    ; preds = %137
  store i32 0, i32* %22, align 4
  br label %142

; <label>:142:                                    ; preds = %164, %141
  %143 = load i32, i32* %22, align 4
  %144 = load i32, i32* %14, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %168

; <label>:146:                                    ; preds = %142
  %147 = load i32, i32* %21, align 4
  %148 = load i32, i32* %22, align 4
  %149 = add nsw i32 %148, 2
  %150 = mul nsw i32 %147, %149
  %151 = load i32, i32* %13, align 4
  %152 = srem i32 %150, %151
  %153 = sitofp i32 %152 to double
  %154 = load i32, i32* %13, align 4
  %155 = sitofp i32 %154 to double
  %156 = fdiv double %153, %155
  %157 = load [1200 x double]*, [1200 x double]** %20, align 8
  %158 = load i32, i32* %21, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %157, i64 %159
  %161 = load i32, i32* %22, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %160, i64 0, i64 %162
  store double %156, double* %163, align 8
  br label %164

; <label>:164:                                    ; preds = %146
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %165 = add i64 %pgocount6, 1
  store i64 %165, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %166 = load i32, i32* %22, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %22, align 4
  br label %142

; <label>:168:                                    ; preds = %142
  br label %169

; <label>:169:                                    ; preds = %168
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %170 = add i64 %pgocount7, 1
  store i64 %170, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %171 = load i32, i32* %21, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %21, align 4
  br label %137

; <label>:173:                                    ; preds = %137
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %174 = add i64 %pgocount8, 1
  store i64 %174, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
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

; <label>:26:                                     ; preds = %86, %11
  %27 = load i32, i32* %23, align 4
  %28 = load i32, i32* %12, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %90

; <label>:30:                                     ; preds = %26
  store i32 0, i32* %24, align 4
  br label %31

; <label>:31:                                     ; preds = %81, %30
  %32 = load i32, i32* %24, align 4
  %33 = load i32, i32* %13, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %85

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
  br i1 %46, label %47, label %80

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
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 0)
  %77 = add i64 %pgocount, 1
  store i64 %77, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 0)
  %78 = load i32, i32* %25, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %25, align 4
  br label %43

; <label>:80:                                     ; preds = %43
  br label %81

; <label>:81:                                     ; preds = %80
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 2)
  %82 = add i64 %pgocount1, 1
  store i64 %82, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 2)
  %83 = load i32, i32* %24, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %24, align 4
  br label %31

; <label>:85:                                     ; preds = %31
  br label %86

; <label>:86:                                     ; preds = %85
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 4)
  %87 = add i64 %pgocount2, 1
  store i64 %87, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 4)
  %88 = load i32, i32* %23, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %23, align 4
  br label %26

; <label>:90:                                     ; preds = %26
  store i32 0, i32* %23, align 4
  br label %91

; <label>:91:                                     ; preds = %152, %90
  %92 = load i32, i32* %23, align 4
  %93 = load i32, i32* %12, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %156

; <label>:95:                                     ; preds = %91
  store i32 0, i32* %24, align 4
  br label %96

; <label>:96:                                     ; preds = %147, %95
  %97 = load i32, i32* %24, align 4
  %98 = load i32, i32* %15, align 4
  %99 = icmp slt i32 %97, %98
  br i1 %99, label %100, label %151

; <label>:100:                                    ; preds = %96
  %101 = load double, double* %17, align 8
  %102 = load [1200 x double]*, [1200 x double]** %22, align 8
  %103 = load i32, i32* %23, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %102, i64 %104
  %106 = load i32, i32* %24, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %105, i64 0, i64 %107
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, %101
  store double %110, double* %108, align 8
  store i32 0, i32* %25, align 4
  br label %111

; <label>:111:                                    ; preds = %142, %100
  %112 = load i32, i32* %25, align 4
  %113 = load i32, i32* %13, align 4
  %114 = icmp slt i32 %112, %113
  br i1 %114, label %115, label %146

; <label>:115:                                    ; preds = %111
  %116 = load [900 x double]*, [900 x double]** %18, align 8
  %117 = load i32, i32* %23, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [900 x double], [900 x double]* %116, i64 %118
  %120 = load i32, i32* %25, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [900 x double], [900 x double]* %119, i64 0, i64 %121
  %123 = load double, double* %122, align 8
  %124 = load [1200 x double]*, [1200 x double]** %21, align 8
  %125 = load i32, i32* %25, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %124, i64 %126
  %128 = load i32, i32* %24, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %127, i64 0, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fmul double %123, %131
  %133 = load [1200 x double]*, [1200 x double]** %22, align 8
  %134 = load i32, i32* %23, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %133, i64 %135
  %137 = load i32, i32* %24, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %136, i64 0, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fadd double %140, %132
  store double %141, double* %139, align 8
  br label %142

; <label>:142:                                    ; preds = %115
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 1)
  %143 = add i64 %pgocount3, 1
  store i64 %143, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 1)
  %144 = load i32, i32* %25, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, i32* %25, align 4
  br label %111

; <label>:146:                                    ; preds = %111
  br label %147

; <label>:147:                                    ; preds = %146
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 3)
  %148 = add i64 %pgocount4, 1
  store i64 %148, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 3)
  %149 = load i32, i32* %24, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %24, align 4
  br label %96

; <label>:151:                                    ; preds = %96
  br label %152

; <label>:152:                                    ; preds = %151
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 5)
  %153 = add i64 %pgocount5, 1
  store i64 %153, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 5)
  %154 = load i32, i32* %23, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %23, align 4
  br label %91

; <label>:156:                                    ; preds = %91
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 6)
  %157 = add i64 %pgocount6, 1
  store i64 %157, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 6)
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
  %36 = load [1200 x double]*, [1200 x double]** %6, align 8
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 %38
  %40 = load i32, i32* %8, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %39, i64 0, i64 %41
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
