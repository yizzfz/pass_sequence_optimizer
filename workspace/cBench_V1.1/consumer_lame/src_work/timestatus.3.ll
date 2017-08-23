; ModuleID = 'timestatus.2.ll'
source_filename = "timestatus.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ts_times = type { float, float, float, float }

$__llvm_profile_raw_version = comdat any

@ts_real_time.initial_time = internal global i64 0, align 8
@ts_process_time.initial_time = internal global i64 0, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [75 x i8] c"    Frame          |  CPU/estimated  |  time/estimated | play/CPU |   ETA\0A\00", align 1
@.str.1 = private unnamed_addr constant [96 x i8] c"\0D%6ld/%6ld(%3d%%)|%2d:%02d:%02d/%2d:%02d:%02d|%2d:%02d:%02d/%2d:%02d:%02d|%10.4f|%2d:%02d:%02d \00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_ts_real_time = private constant [12 x i8] c"ts_real_time"
@__profn_ts_process_time = private constant [15 x i8] c"ts_process_time"
@__profn_ts_calc_times = private constant [13 x i8] c"ts_calc_times"
@__profn_timestatus = private constant [10 x i8] c"timestatus"
@__profc_ts_real_time = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ts_real_time = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3794399550201237885, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_real_time, i32 0, i32 0), i8* bitcast (float (i64)* @ts_real_time to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ts_process_time = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ts_process_time = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2219954750888420105, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_process_time, i32 0, i32 0), i8* bitcast (float (i64)* @ts_process_time to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ts_calc_times = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ts_calc_times = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8163428027829719032, i64 46000771972, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ts_calc_times, i32 0, i32 0), i8* bitcast (void (%struct.ts_times*, i32, i64, i64, i32)* @ts_calc_times to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_timestatus = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_timestatus = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6013632386471242438, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_timestatus, i32 0, i32 0), i8* bitcast (void (i32, i64, i64, i32)* @timestatus to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [49 x i8] c"5/x\DA+)\8E/JM\CC\89/\C9\CCMe,)\8E/(\CAON-.\86\F3\93\13s\92\C1\9CbF0Y\92XRZ\0C\005\E0\14\FC", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ts_real_time to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ts_process_time to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ts_calc_times to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_timestatus to i8*), i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define float @ts_real_time(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %4 = call i64 @time(i64* %3) #4
  %5 = load i64, i64* %2, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_real_time, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_real_time, i64 0, i64 1)
  %9 = load i64, i64* %3, align 8
  store i64 %9, i64* @ts_real_time.initial_time, align 8
  br label %10

; <label>:10:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_real_time, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_real_time, i64 0, i64 0)
  %12 = load i64, i64* %3, align 8
  %13 = load i64, i64* @ts_real_time.initial_time, align 8
  %14 = call double @difftime(i64 %12, i64 %13) #5
  %15 = fptrunc double %14 to float
  ret float %15
}

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: nounwind readnone
declare double @difftime(i64, i64) #2

; Function Attrs: nounwind uwtable
define float @ts_process_time(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %4 = call i64 @clock() #4
  store i64 %4, i64* %3, align 8
  %5 = load i64, i64* %2, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_process_time, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_process_time, i64 0, i64 1)
  %9 = load i64, i64* %3, align 8
  store i64 %9, i64* @ts_process_time.initial_time, align 8
  br label %10

; <label>:10:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_process_time, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ts_process_time, i64 0, i64 0)
  %12 = load i64, i64* %3, align 8
  %13 = load i64, i64* @ts_process_time.initial_time, align 8
  %14 = sub nsw i64 %12, %13
  %15 = sitofp i64 %14 to float
  %16 = fdiv float %15, 1.000000e+06
  ret float %16
}

; Function Attrs: nounwind
declare i64 @clock() #1

; Function Attrs: nounwind uwtable
define void @ts_calc_times(%struct.ts_times*, i32, i64, i64, i32) #0 {
  %6 = alloca %struct.ts_times*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  store %struct.ts_times* %0, %struct.ts_times** %6, align 8
  store i32 %1, i32* %7, align 4
  store i64 %2, i64* %8, align 8
  store i64 %3, i64* %9, align 8
  store i32 %4, i32* %10, align 4
  %11 = load i64, i64* %8, align 8
  %12 = icmp sgt i64 %11, 0
  br i1 %12, label %13, label %62

; <label>:13:                                     ; preds = %5
  %14 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %15 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %14, i32 0, i32 0
  %16 = load float, float* %15, align 4
  %17 = load i64, i64* %9, align 8
  %18 = sitofp i64 %17 to float
  %19 = fmul float %16, %18
  %20 = load i64, i64* %8, align 8
  %21 = sitofp i64 %20 to float
  %22 = fdiv float %19, %21
  %23 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %24 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %23, i32 0, i32 1
  store float %22, float* %24, align 4
  %25 = load i32, i32* %7, align 4
  %26 = sitofp i32 %25 to float
  %27 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %28 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %27, i32 0, i32 1
  %29 = load float, float* %28, align 4
  %30 = fmul float %26, %29
  %31 = fcmp ogt float %30, 0.000000e+00
  br i1 %31, label %32, label %48

; <label>:32:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ts_calc_times, i64 0, i64 1)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ts_calc_times, i64 0, i64 1)
  %34 = load i64, i64* %9, align 8
  %35 = load i32, i32* %10, align 4
  %36 = sext i32 %35 to i64
  %37 = mul nsw i64 %34, %36
  %38 = sitofp i64 %37 to float
  %39 = load i32, i32* %7, align 4
  %40 = sitofp i32 %39 to float
  %41 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %42 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %41, i32 0, i32 1
  %43 = load float, float* %42, align 4
  %44 = fmul float %40, %43
  %45 = fdiv float %38, %44
  %46 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %47 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %46, i32 0, i32 2
  store float %45, float* %47, align 4
  br label %52

; <label>:48:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ts_calc_times, i64 0, i64 2)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ts_calc_times, i64 0, i64 2)
  %50 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %51 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %50, i32 0, i32 2
  store float 0.000000e+00, float* %51, align 4
  br label %52

; <label>:52:                                     ; preds = %48, %32
  %53 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %54 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %53, i32 0, i32 1
  %55 = load float, float* %54, align 4
  %56 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %57 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %56, i32 0, i32 0
  %58 = load float, float* %57, align 4
  %59 = fsub float %55, %58
  %60 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %61 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %60, i32 0, i32 3
  store float %59, float* %61, align 4
  br label %70

; <label>:62:                                     ; preds = %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ts_calc_times, i64 0, i64 0)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ts_calc_times, i64 0, i64 0)
  %64 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %65 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %64, i32 0, i32 1
  store float 0.000000e+00, float* %65, align 4
  %66 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %67 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %66, i32 0, i32 2
  store float 0.000000e+00, float* %67, align 4
  %68 = load %struct.ts_times*, %struct.ts_times** %6, align 8
  %69 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %68, i32 0, i32 3
  store float 0.000000e+00, float* %69, align 4
  br label %70

; <label>:70:                                     ; preds = %62, %52
  ret void
}

; Function Attrs: nounwind uwtable
define void @timestatus(i32, i64, i64, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.ts_times, align 4
  %10 = alloca %struct.ts_times, align 4
  %11 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i64 %1, i64* %6, align 8
  store i64 %2, i64* %7, align 8
  store i32 %3, i32* %8, align 4
  %12 = load i64, i64* %6, align 8
  %13 = call float @ts_real_time(i64 %12)
  %14 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 0
  store float %13, float* %14, align 4
  %15 = load i64, i64* %6, align 8
  %16 = call float @ts_process_time(i64 %15)
  %17 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %10, i32 0, i32 0
  store float %16, float* %17, align 4
  %18 = load i64, i64* %6, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_timestatus, i64 0, i64 0)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_timestatus, i64 0, i64 0)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i32 0, i32 0))
  br label %169

; <label>:24:                                     ; preds = %4
  %25 = load i32, i32* %5, align 4
  %26 = load i64, i64* %6, align 8
  %27 = load i64, i64* %7, align 8
  %28 = load i32, i32* %8, align 4
  call void @ts_calc_times(%struct.ts_times* %9, i32 %25, i64 %26, i64 %27, i32 %28)
  %29 = load i32, i32* %5, align 4
  %30 = load i64, i64* %6, align 8
  %31 = load i64, i64* %7, align 8
  %32 = load i32, i32* %8, align 4
  call void @ts_calc_times(%struct.ts_times* %10, i32 %29, i64 %30, i64 %31, i32 %32)
  %33 = load i64, i64* %7, align 8
  %34 = icmp sgt i64 %33, 1
  br i1 %34, label %35, label %45

; <label>:35:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_timestatus, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_timestatus, i64 0, i64 1)
  %37 = load i64, i64* %6, align 8
  %38 = sitofp i64 %37 to double
  %39 = fmul double 1.000000e+02, %38
  %40 = load i64, i64* %7, align 8
  %41 = sub nsw i64 %40, 1
  %42 = sitofp i64 %41 to double
  %43 = fdiv double %39, %42
  %44 = fptosi double %43 to i32
  store i32 %44, i32* %11, align 4
  br label %47

; <label>:45:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_timestatus, i64 0, i64 2)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_timestatus, i64 0, i64 2)
  store i32 100, i32* %11, align 4
  br label %47

; <label>:47:                                     ; preds = %45, %35
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = load i64, i64* %6, align 8
  %50 = load i64, i64* %7, align 8
  %51 = sub nsw i64 %50, 1
  %52 = load i32, i32* %11, align 4
  %53 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %10, i32 0, i32 0
  %54 = load float, float* %53, align 4
  %55 = fpext float %54 to double
  %56 = fadd double %55, 5.000000e-01
  %57 = fptosi double %56 to i64
  %58 = sdiv i64 %57, 3600
  %59 = trunc i64 %58 to i32
  %60 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %10, i32 0, i32 0
  %61 = load float, float* %60, align 4
  %62 = fpext float %61 to double
  %63 = fadd double %62, 5.000000e-01
  %64 = fdiv double %63, 6.000000e+01
  %65 = fptosi double %64 to i64
  %66 = srem i64 %65, 60
  %67 = trunc i64 %66 to i32
  %68 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %10, i32 0, i32 0
  %69 = load float, float* %68, align 4
  %70 = fpext float %69 to double
  %71 = fadd double %70, 5.000000e-01
  %72 = fptosi double %71 to i64
  %73 = srem i64 %72, 60
  %74 = trunc i64 %73 to i32
  %75 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %10, i32 0, i32 1
  %76 = load float, float* %75, align 4
  %77 = fpext float %76 to double
  %78 = fadd double %77, 5.000000e-01
  %79 = fptosi double %78 to i64
  %80 = sdiv i64 %79, 3600
  %81 = trunc i64 %80 to i32
  %82 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %10, i32 0, i32 1
  %83 = load float, float* %82, align 4
  %84 = fpext float %83 to double
  %85 = fadd double %84, 5.000000e-01
  %86 = fdiv double %85, 6.000000e+01
  %87 = fptosi double %86 to i64
  %88 = srem i64 %87, 60
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %10, i32 0, i32 1
  %91 = load float, float* %90, align 4
  %92 = fpext float %91 to double
  %93 = fadd double %92, 5.000000e-01
  %94 = fptosi double %93 to i64
  %95 = srem i64 %94, 60
  %96 = trunc i64 %95 to i32
  %97 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 0
  %98 = load float, float* %97, align 4
  %99 = fpext float %98 to double
  %100 = fadd double %99, 5.000000e-01
  %101 = fptosi double %100 to i64
  %102 = sdiv i64 %101, 3600
  %103 = trunc i64 %102 to i32
  %104 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 0
  %105 = load float, float* %104, align 4
  %106 = fpext float %105 to double
  %107 = fadd double %106, 5.000000e-01
  %108 = fdiv double %107, 6.000000e+01
  %109 = fptosi double %108 to i64
  %110 = srem i64 %109, 60
  %111 = trunc i64 %110 to i32
  %112 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 0
  %113 = load float, float* %112, align 4
  %114 = fpext float %113 to double
  %115 = fadd double %114, 5.000000e-01
  %116 = fptosi double %115 to i64
  %117 = srem i64 %116, 60
  %118 = trunc i64 %117 to i32
  %119 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 1
  %120 = load float, float* %119, align 4
  %121 = fpext float %120 to double
  %122 = fadd double %121, 5.000000e-01
  %123 = fptosi double %122 to i64
  %124 = sdiv i64 %123, 3600
  %125 = trunc i64 %124 to i32
  %126 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 1
  %127 = load float, float* %126, align 4
  %128 = fpext float %127 to double
  %129 = fadd double %128, 5.000000e-01
  %130 = fdiv double %129, 6.000000e+01
  %131 = fptosi double %130 to i64
  %132 = srem i64 %131, 60
  %133 = trunc i64 %132 to i32
  %134 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 1
  %135 = load float, float* %134, align 4
  %136 = fpext float %135 to double
  %137 = fadd double %136, 5.000000e-01
  %138 = fptosi double %137 to i64
  %139 = srem i64 %138, 60
  %140 = trunc i64 %139 to i32
  %141 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %10, i32 0, i32 2
  %142 = load float, float* %141, align 4
  %143 = fpext float %142 to double
  %144 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 3
  %145 = load float, float* %144, align 4
  %146 = fpext float %145 to double
  %147 = fadd double %146, 5.000000e-01
  %148 = fptosi double %147 to i64
  %149 = sdiv i64 %148, 3600
  %150 = trunc i64 %149 to i32
  %151 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 3
  %152 = load float, float* %151, align 4
  %153 = fpext float %152 to double
  %154 = fadd double %153, 5.000000e-01
  %155 = fdiv double %154, 6.000000e+01
  %156 = fptosi double %155 to i64
  %157 = srem i64 %156, 60
  %158 = trunc i64 %157 to i32
  %159 = getelementptr inbounds %struct.ts_times, %struct.ts_times* %9, i32 0, i32 3
  %160 = load float, float* %159, align 4
  %161 = fpext float %160 to double
  %162 = fadd double %161, 5.000000e-01
  %163 = fptosi double %162 to i64
  %164 = srem i64 %163, 60
  %165 = trunc i64 %164 to i32
  %166 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([96 x i8], [96 x i8]* @.str.1, i32 0, i32 0), i64 %49, i64 %51, i32 %52, i32 %59, i32 %67, i32 %74, i32 %81, i32 %89, i32 %96, i32 %103, i32 %111, i32 %118, i32 %125, i32 %133, i32 %140, double %143, i32 %150, i32 %158, i32 %165)
  %167 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %168 = call i32 @fflush(%struct._IO_FILE* %167)
  br label %169

; <label>:169:                                    ; preds = %47, %20
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare i32 @fflush(%struct._IO_FILE*) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
