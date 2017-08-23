; ModuleID = 'tmp1.ll'
source_filename = "filter.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mad_frame = type { %struct.mad_header, i32, [2 x [36 x [32 x i32]]], [2 x [32 x [18 x i32]]]* }
%struct.mad_header = type { i32, i32, i32, i32, i64, i32, i16, i16, i32, i32, %struct.mad_timer_t }
%struct.mad_timer_t = type { i64, i64 }
%struct.filter = type { i32, i32 (i8*, %struct.mad_frame*)*, i8*, %struct.filter* }
%struct.player = type { i32, i32, i32, i32, %struct.playlist, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, %struct.input, %struct.output, %struct.stats }
%struct.playlist = type { i8**, i32, i32 }
%struct.input = type { i8*, i32, i8*, i8*, i64, i32, %struct.xing }
%struct.xing = type { i64, i64, i64, [100 x i8], i64 }
%struct.output = type { i32, i32, %struct.filter*, i32, i32, i32, i32, i32, i32, i32, i8*, i32 (%union.audio_control*)*, [2 x %struct.resample_state], [2 x [3456 x i32]]* }
%union.audio_control = type { %struct.audio_play }
%struct.audio_play = type { i32, i32, [2 x i32*], i32, %struct.audio_stats* }
%struct.audio_stats = type { i64, i32, i32 }
%struct.resample_state = type { i32, i32, i32 }
%struct.stats = type { i32, i8*, i64, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, %struct.mad_timer_t, i64, i64, i64, i64, i64, i32, i32, i64, i64, i64, %struct.audio_stats }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_filter_init = private constant [11 x i8] c"filter_init"
@__profn_filter_new = private constant [10 x i8] c"filter_new"
@__profn_filter_free = private constant [11 x i8] c"filter_free"
@__profn_filter_run = private constant [10 x i8] c"filter_run"
@__profn_mono_filter = private constant [11 x i8] c"mono_filter"
@__profn_fadein_filter = private constant [13 x i8] c"fadein_filter"
@__profc_filter_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_filter_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 604176083506701345, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_filter_init, i32 0, i32 0), i8* bitcast (void (%struct.filter*, i32 (i8*, %struct.mad_frame*)*, i8*, %struct.filter*)* @filter_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_filter_new = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_filter_new = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2526703950087260701, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_filter_new, i32 0, i32 0), i8* bitcast (%struct.filter* (i32 (i8*, %struct.mad_frame*)*, i8*, %struct.filter*)* @filter_new to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_filter_free = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_filter_free = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6780550434062361473, i64 43380092889, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_free, i32 0, i32 0), i8* bitcast (void (%struct.filter*)* @filter_free to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_filter_run = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_filter_run = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_filter_run = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9165242455522065793, i64 281519647707535, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_run, i32 0, i32 0), i8* bitcast (i32 (%struct.filter*, %struct.mad_frame*)* @filter_run to i8*), i8* bitcast ([1 x i64]* @__profvp_filter_run to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_mono_filter = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mono_filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5483930069427937792, i64 72057690686369106, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_frame*)* @mono_filter to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_fadein_filter = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fadein_filter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4756418663363934031, i64 144115317311923919, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.mad_frame*)* @fadein_filter to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [54 x i8] c"G4x\DAK\CB\CC)I-\8A\CF\CC\CB,aL\83\B0\F3R\CBa\CC\B4\A2\D4T\18\BB\A84\8F17?/?\1E\C2gLKLI\CD\CC\83\F2\00\DC\B4\1By", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_filter_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_filter_new to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_filter_free to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_filter_run to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mono_filter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fadein_filter to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @filter_init(%struct.filter*, i32 (i8*, %struct.mad_frame*)*, i8*, %struct.filter*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_filter_init, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_filter_init, i64 0, i64 0)
  %6 = alloca %struct.filter*, align 8
  %7 = alloca i32 (i8*, %struct.mad_frame*)*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca %struct.filter*, align 8
  store %struct.filter* %0, %struct.filter** %6, align 8
  store i32 (i8*, %struct.mad_frame*)* %1, i32 (i8*, %struct.mad_frame*)** %7, align 8
  store i8* %2, i8** %8, align 8
  store %struct.filter* %3, %struct.filter** %9, align 8
  %10 = load %struct.filter*, %struct.filter** %6, align 8
  %11 = getelementptr inbounds %struct.filter, %struct.filter* %10, i32 0, i32 0
  store i32 0, i32* %11, align 8
  %12 = load i32 (i8*, %struct.mad_frame*)*, i32 (i8*, %struct.mad_frame*)** %7, align 8
  %13 = load %struct.filter*, %struct.filter** %6, align 8
  %14 = getelementptr inbounds %struct.filter, %struct.filter* %13, i32 0, i32 1
  store i32 (i8*, %struct.mad_frame*)* %12, i32 (i8*, %struct.mad_frame*)** %14, align 8
  %15 = load i8*, i8** %8, align 8
  %16 = load %struct.filter*, %struct.filter** %6, align 8
  %17 = getelementptr inbounds %struct.filter, %struct.filter* %16, i32 0, i32 2
  store i8* %15, i8** %17, align 8
  %18 = load %struct.filter*, %struct.filter** %9, align 8
  %19 = load %struct.filter*, %struct.filter** %6, align 8
  %20 = getelementptr inbounds %struct.filter, %struct.filter* %19, i32 0, i32 3
  store %struct.filter* %18, %struct.filter** %20, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.filter* @filter_new(i32 (i8*, %struct.mad_frame*)*, i8*, %struct.filter*) #0 {
  %4 = alloca i32 (i8*, %struct.mad_frame*)*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.filter*, align 8
  %7 = alloca %struct.filter*, align 8
  store i32 (i8*, %struct.mad_frame*)* %0, i32 (i8*, %struct.mad_frame*)** %4, align 8
  store i8* %1, i8** %5, align 8
  store %struct.filter* %2, %struct.filter** %6, align 8
  %8 = call noalias i8* @malloc(i64 32) #4
  %9 = bitcast i8* %8 to %struct.filter*
  store %struct.filter* %9, %struct.filter** %7, align 8
  %10 = load %struct.filter*, %struct.filter** %7, align 8
  %11 = icmp ne %struct.filter* %10, null
  br i1 %11, label %12, label %22

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_filter_new, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_filter_new, i64 0, i64 1)
  %14 = load %struct.filter*, %struct.filter** %7, align 8
  %15 = load i32 (i8*, %struct.mad_frame*)*, i32 (i8*, %struct.mad_frame*)** %4, align 8
  %16 = load i8*, i8** %5, align 8
  %17 = load %struct.filter*, %struct.filter** %6, align 8
  call void @filter_init(%struct.filter* %14, i32 (i8*, %struct.mad_frame*)* %15, i8* %16, %struct.filter* %17)
  %18 = load %struct.filter*, %struct.filter** %7, align 8
  %19 = getelementptr inbounds %struct.filter, %struct.filter* %18, i32 0, i32 0
  %20 = load i32, i32* %19, align 8
  %21 = or i32 %20, 1
  store i32 %21, i32* %19, align 8
  br label %22

; <label>:22:                                     ; preds = %12, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_filter_new, i64 0, i64 0)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_filter_new, i64 0, i64 0)
  %24 = load %struct.filter*, %struct.filter** %7, align 8
  ret %struct.filter* %24
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @filter_free(%struct.filter*) #0 {
  %2 = alloca %struct.filter*, align 8
  %3 = alloca %struct.filter*, align 8
  store %struct.filter* %0, %struct.filter** %2, align 8
  br label %4

; <label>:4:                                      ; preds = %24, %1
  %5 = load %struct.filter*, %struct.filter** %2, align 8
  %6 = icmp ne %struct.filter* %5, null
  br i1 %6, label %7, label %26

; <label>:7:                                      ; preds = %4
  %8 = load %struct.filter*, %struct.filter** %2, align 8
  %9 = getelementptr inbounds %struct.filter, %struct.filter* %8, i32 0, i32 3
  %10 = load %struct.filter*, %struct.filter** %9, align 8
  store %struct.filter* %10, %struct.filter** %3, align 8
  %11 = load %struct.filter*, %struct.filter** %2, align 8
  %12 = getelementptr inbounds %struct.filter, %struct.filter* %11, i32 0, i32 0
  %13 = load i32, i32* %12, align 8
  %14 = and i32 %13, 1
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_free, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_free, i64 0, i64 0)
  %18 = load %struct.filter*, %struct.filter** %2, align 8
  %19 = bitcast %struct.filter* %18 to i8*
  call void @free(i8* %19) #4
  br label %24

; <label>:20:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_free, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_free, i64 0, i64 1)
  %22 = load %struct.filter*, %struct.filter** %2, align 8
  %23 = getelementptr inbounds %struct.filter, %struct.filter* %22, i32 0, i32 3
  store %struct.filter* null, %struct.filter** %23, align 8
  br label %24

; <label>:24:                                     ; preds = %20, %16
  %25 = load %struct.filter*, %struct.filter** %3, align 8
  store %struct.filter* %25, %struct.filter** %2, align 8
  br label %4

; <label>:26:                                     ; preds = %4
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_free, i64 0, i64 2)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_free, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @filter_run(%struct.filter*, %struct.mad_frame*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.filter*, align 8
  %5 = alloca %struct.mad_frame*, align 8
  %6 = alloca i32, align 4
  store %struct.filter* %0, %struct.filter** %4, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %5, align 8
  br label %7

; <label>:7:                                      ; preds = %25, %2
  %8 = load %struct.filter*, %struct.filter** %4, align 8
  %9 = icmp ne %struct.filter* %8, null
  br i1 %9, label %10, label %30

; <label>:10:                                     ; preds = %7
  %11 = load %struct.filter*, %struct.filter** %4, align 8
  %12 = getelementptr inbounds %struct.filter, %struct.filter* %11, i32 0, i32 1
  %13 = load i32 (i8*, %struct.mad_frame*)*, i32 (i8*, %struct.mad_frame*)** %12, align 8
  %14 = load %struct.filter*, %struct.filter** %4, align 8
  %15 = getelementptr inbounds %struct.filter, %struct.filter* %14, i32 0, i32 2
  %16 = load i8*, i8** %15, align 8
  %17 = load %struct.mad_frame*, %struct.mad_frame** %5, align 8
  %18 = ptrtoint i32 (i8*, %struct.mad_frame*)* %13 to i64
  call void @__llvm_profile_instrument_target(i64 %18, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_filter_run to i8*), i32 0)
  %19 = call i32 %13(i8* %16, %struct.mad_frame* %17)
  store i32 %19, i32* %6, align 4
  %20 = load i32, i32* %6, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %25

; <label>:22:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_run, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_run, i64 0, i64 2)
  %24 = load i32, i32* %6, align 4
  store i32 %24, i32* %3, align 4
  br label %32

; <label>:25:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_run, i64 0, i64 0)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_run, i64 0, i64 0)
  %27 = load %struct.filter*, %struct.filter** %4, align 8
  %28 = getelementptr inbounds %struct.filter, %struct.filter* %27, i32 0, i32 3
  %29 = load %struct.filter*, %struct.filter** %28, align 8
  store %struct.filter* %29, %struct.filter** %4, align 8
  br label %7

; <label>:30:                                     ; preds = %7
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_run, i64 0, i64 1)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_filter_run, i64 0, i64 1)
  store i32 0, i32* %3, align 4
  br label %32

; <label>:32:                                     ; preds = %30, %22
  %33 = load i32, i32* %3, align 4
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define i32 @mono_filter(i8*, %struct.mad_frame*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.mad_frame*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %4, align 8
  %10 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %11 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %100

; <label>:15:                                     ; preds = %2
  %16 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %17 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %16, i32 0, i32 0
  %18 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 8
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 3)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 3)
  br label %43

; <label>:23:                                     ; preds = %15
  %24 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %25 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %25, i32 0, i32 0
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 3
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 5)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 5)
  %31 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %32 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %31, i32 0, i32 0
  %33 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %32, i32 0, i32 8
  %34 = load i32, i32* %33, align 8
  %35 = and i32 %34, 4096
  %36 = icmp ne i32 %35, 0
  br label %37

; <label>:37:                                     ; preds = %29, %23
  %38 = phi i1 [ false, %23 ], [ %36, %29 ]
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 4)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 4)
  %40 = zext i1 %38 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 6)
  %41 = add i64 %pgocount3, %40
  store i64 %41, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 6)
  %42 = select i1 %38, i32 18, i32 36
  br label %43

; <label>:43:                                     ; preds = %37, %21
  %44 = phi i32 [ 12, %21 ], [ %42, %37 ]
  store i32 %44, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %45

; <label>:45:                                     ; preds = %92, %43
  %46 = load i32, i32* %6, align 4
  %47 = load i32, i32* %5, align 4
  %48 = icmp ult i32 %46, %47
  br i1 %48, label %49, label %96

; <label>:49:                                     ; preds = %45
  store i32 0, i32* %7, align 4
  br label %50

; <label>:50:                                     ; preds = %87, %49
  %51 = load i32, i32* %7, align 4
  %52 = icmp ult i32 %51, 32
  br i1 %52, label %53, label %91

; <label>:53:                                     ; preds = %50
  %54 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %55 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %54, i32 0, i32 2
  %56 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %55, i64 0, i64 0
  %57 = load i32, i32* %6, align 4
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %56, i64 0, i64 %58
  %60 = load i32, i32* %7, align 4
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds [32 x i32], [32 x i32]* %59, i64 0, i64 %61
  %63 = load i32, i32* %62, align 4
  store i32 %63, i32* %8, align 4
  %64 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %65 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %64, i32 0, i32 2
  %66 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %65, i64 0, i64 1
  %67 = load i32, i32* %6, align 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %66, i64 0, i64 %68
  %70 = load i32, i32* %7, align 4
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds [32 x i32], [32 x i32]* %69, i64 0, i64 %71
  %73 = load i32, i32* %72, align 4
  store i32 %73, i32* %9, align 4
  %74 = load i32, i32* %8, align 4
  %75 = load i32, i32* %9, align 4
  %76 = add nsw i32 %74, %75
  %77 = sdiv i32 %76, 2
  %78 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %79 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %78, i32 0, i32 2
  %80 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %79, i64 0, i64 0
  %81 = load i32, i32* %6, align 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %80, i64 0, i64 %82
  %84 = load i32, i32* %7, align 4
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [32 x i32], [32 x i32]* %83, i64 0, i64 %85
  store i32 %77, i32* %86, align 4
  br label %87

; <label>:87:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 0)
  %88 = add i64 %pgocount4, 1
  store i64 %88, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 0)
  %89 = load i32, i32* %7, align 4
  %90 = add i32 %89, 1
  store i32 %90, i32* %7, align 4
  br label %50

; <label>:91:                                     ; preds = %50
  br label %92

; <label>:92:                                     ; preds = %91
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 1)
  %93 = add i64 %pgocount5, 1
  store i64 %93, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 1)
  %94 = load i32, i32* %6, align 4
  %95 = add i32 %94, 1
  store i32 %95, i32* %6, align 4
  br label %45

; <label>:96:                                     ; preds = %45
  %97 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %98 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %97, i32 0, i32 0
  %99 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %98, i32 0, i32 1
  store i32 0, i32* %99, align 4
  br label %100

; <label>:100:                                    ; preds = %96, %2
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 2)
  %101 = add i64 %pgocount6, 1
  store i64 %101, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_mono_filter, i64 0, i64 2)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @fadein_filter(i8*, %struct.mad_frame*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.mad_frame*, align 8
  %5 = alloca %struct.player*, align 8
  %6 = alloca %struct.mad_timer_t, align 8
  %7 = alloca %struct.mad_timer_t, align 8
  %8 = alloca %struct.mad_timer_t, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.mad_timer_t, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %4, align 8
  %17 = load i8*, i8** %3, align 8
  %18 = bitcast i8* %17 to %struct.player*
  store %struct.player* %18, %struct.player** %5, align 8
  %19 = load %struct.player*, %struct.player** %5, align 8
  %20 = getelementptr inbounds %struct.player, %struct.player* %19, i32 0, i32 12
  %21 = getelementptr inbounds %struct.stats, %struct.stats* %20, i32 0, i32 6
  %22 = load %struct.player*, %struct.player** %5, align 8
  %23 = getelementptr inbounds %struct.player, %struct.player* %22, i32 0, i32 7
  %24 = bitcast %struct.mad_timer_t* %21 to { i64, i64 }*
  %25 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %24, i32 0, i32 0
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %24, i32 0, i32 1
  %28 = load i64, i64* %27, align 8
  %29 = bitcast %struct.mad_timer_t* %23 to { i64, i64 }*
  %30 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %29, i32 0, i32 0
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %29, i32 0, i32 1
  %33 = load i64, i64* %32, align 8
  %34 = call i32 @mad_timer_compare(i64 %26, i64 %28, i64 %31, i64 %33)
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %255

; <label>:36:                                     ; preds = %2
  %37 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %38 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %38, i32 0, i32 0
  %40 = load i32, i32* %39, align 8
  %41 = icmp eq i32 %40, 1
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 4)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 4)
  br label %64

; <label>:44:                                     ; preds = %36
  %45 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %46 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %45, i32 0, i32 0
  %47 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %46, i32 0, i32 0
  %48 = load i32, i32* %47, align 8
  %49 = icmp eq i32 %48, 3
  br i1 %49, label %50, label %58

; <label>:50:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 7)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 7)
  %52 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %53 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %52, i32 0, i32 0
  %54 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %53, i32 0, i32 8
  %55 = load i32, i32* %54, align 8
  %56 = and i32 %55, 4096
  %57 = icmp ne i32 %56, 0
  br label %58

; <label>:58:                                     ; preds = %50, %44
  %59 = phi i1 [ false, %44 ], [ %57, %50 ]
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 5)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 5)
  %61 = zext i1 %59 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 8)
  %62 = add i64 %pgocount3, %61
  store i64 %62, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 8)
  %63 = select i1 %59, i32 18, i32 36
  br label %64

; <label>:64:                                     ; preds = %58, %42
  %65 = phi i32 [ 12, %42 ], [ %63, %58 ]
  store i32 %65, i32* %10, align 4
  %66 = load %struct.player*, %struct.player** %5, align 8
  %67 = getelementptr inbounds %struct.player, %struct.player* %66, i32 0, i32 12
  %68 = getelementptr inbounds %struct.stats, %struct.stats* %67, i32 0, i32 6
  %69 = bitcast %struct.mad_timer_t* %7 to i8*
  %70 = bitcast %struct.mad_timer_t* %68 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %69, i8* %70, i64 16, i32 8, i1 false)
  %71 = bitcast %struct.mad_timer_t* %6 to i8*
  %72 = bitcast %struct.mad_timer_t* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %71, i8* %72, i64 16, i32 8, i1 false)
  %73 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %74 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %73, i32 0, i32 0
  %75 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %74, i32 0, i32 10
  %76 = bitcast %struct.mad_timer_t* %75 to { i64, i64 }*
  %77 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 0
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 1
  %80 = load i64, i64* %79, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %7, i64 %78, i64 %80)
  %81 = load %struct.player*, %struct.player** %5, align 8
  %82 = getelementptr inbounds %struct.player, %struct.player* %81, i32 0, i32 7
  %83 = bitcast %struct.mad_timer_t* %82 to { i64, i64 }*
  %84 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %83, i32 0, i32 0
  %85 = load i64, i64* %84, align 8
  %86 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %83, i32 0, i32 1
  %87 = load i64, i64* %86, align 8
  %88 = bitcast %struct.mad_timer_t* %7 to { i64, i64 }*
  %89 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %88, i32 0, i32 0
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %88, i32 0, i32 1
  %92 = load i64, i64* %91, align 8
  %93 = call i32 @mad_timer_compare(i64 %85, i64 %87, i64 %90, i64 %92)
  %94 = icmp slt i32 %93, 0
  br i1 %94, label %95, label %138

; <label>:95:                                     ; preds = %64
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 6)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 6)
  %97 = bitcast %struct.mad_timer_t* %14 to i8*
  %98 = bitcast %struct.mad_timer_t* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %97, i8* %98, i64 16, i32 8, i1 false)
  call void @mad_timer_negate(%struct.mad_timer_t* %14)
  %99 = load %struct.player*, %struct.player** %5, align 8
  %100 = getelementptr inbounds %struct.player, %struct.player* %99, i32 0, i32 7
  %101 = bitcast %struct.mad_timer_t* %100 to { i64, i64 }*
  %102 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %101, i32 0, i32 0
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %101, i32 0, i32 1
  %105 = load i64, i64* %104, align 8
  call void @mad_timer_add(%struct.mad_timer_t* %14, i64 %103, i64 %105)
  %106 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %107 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %106, i32 0, i32 0
  %108 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %107, i32 0, i32 5
  %109 = load i32, i32* %108, align 8
  %110 = bitcast %struct.mad_timer_t* %14 to { i64, i64 }*
  %111 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %110, i32 0, i32 0
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %110, i32 0, i32 1
  %114 = load i64, i64* %113, align 8
  %115 = call i64 @mad_timer_count(i64 %112, i64 %114, i32 %109)
  %116 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %117 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %116, i32 0, i32 0
  %118 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %117, i32 0, i32 10
  %119 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %120 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %119, i32 0, i32 0
  %121 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %120, i32 0, i32 5
  %122 = load i32, i32* %121, align 8
  %123 = bitcast %struct.mad_timer_t* %118 to { i64, i64 }*
  %124 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %123, i32 0, i32 0
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %123, i32 0, i32 1
  %127 = load i64, i64* %126, align 8
  %128 = call i64 @mad_timer_count(i64 %125, i64 %127, i32 %122)
  call void @mad_timer_set(%struct.mad_timer_t* %8, i64 0, i64 %115, i64 %128)
  %129 = load i32, i32* %10, align 4
  %130 = zext i32 %129 to i64
  %131 = bitcast %struct.mad_timer_t* %8 to { i64, i64 }*
  %132 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %131, i32 0, i32 0
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %131, i32 0, i32 1
  %135 = load i64, i64* %134, align 8
  %136 = call i64 @mad_timer_fraction(i64 %133, i64 %135, i64 %130)
  %137 = trunc i64 %136 to i32
  store i32 %137, i32* %10, align 4
  br label %138

; <label>:138:                                    ; preds = %95, %64
  %139 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %140 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %139, i32 0, i32 0
  %141 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %140, i32 0, i32 5
  %142 = load i32, i32* %141, align 8
  %143 = bitcast %struct.mad_timer_t* %6 to { i64, i64 }*
  %144 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %143, i32 0, i32 0
  %145 = load i64, i64* %144, align 8
  %146 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %143, i32 0, i32 1
  %147 = load i64, i64* %146, align 8
  %148 = call i64 @mad_timer_count(i64 %145, i64 %147, i32 %142)
  %149 = load %struct.player*, %struct.player** %5, align 8
  %150 = getelementptr inbounds %struct.player, %struct.player* %149, i32 0, i32 7
  %151 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %152 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %151, i32 0, i32 0
  %153 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %152, i32 0, i32 5
  %154 = load i32, i32* %153, align 8
  %155 = bitcast %struct.mad_timer_t* %150 to { i64, i64 }*
  %156 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %155, i32 0, i32 0
  %157 = load i64, i64* %156, align 8
  %158 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %155, i32 0, i32 1
  %159 = load i64, i64* %158, align 8
  %160 = call i64 @mad_timer_count(i64 %157, i64 %159, i32 %154)
  call void @mad_timer_set(%struct.mad_timer_t* %8, i64 0, i64 %148, i64 %160)
  %161 = bitcast %struct.mad_timer_t* %8 to { i64, i64 }*
  %162 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %161, i32 0, i32 0
  %163 = load i64, i64* %162, align 8
  %164 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %161, i32 0, i32 1
  %165 = load i64, i64* %164, align 8
  %166 = call i64 @mad_timer_fraction(i64 %163, i64 %165, i64 268435456)
  %167 = trunc i64 %166 to i32
  store i32 %167, i32* %13, align 4
  %168 = load %struct.player*, %struct.player** %5, align 8
  %169 = getelementptr inbounds %struct.player, %struct.player* %168, i32 0, i32 7
  %170 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %171 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %170, i32 0, i32 0
  %172 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %171, i32 0, i32 5
  %173 = load i32, i32* %172, align 8
  %174 = bitcast %struct.mad_timer_t* %169 to { i64, i64 }*
  %175 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %174, i32 0, i32 0
  %176 = load i64, i64* %175, align 8
  %177 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %174, i32 0, i32 1
  %178 = load i64, i64* %177, align 8
  %179 = call i64 @mad_timer_count(i64 %176, i64 %178, i32 %173)
  %180 = sdiv i64 %179, 32
  %181 = sdiv i64 268435456, %180
  %182 = trunc i64 %181 to i32
  store i32 %182, i32* %12, align 4
  %183 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %184 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %183, i32 0, i32 0
  %185 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %184, i32 0, i32 1
  %186 = load i32, i32* %185, align 4
  %187 = icmp ne i32 %186, 0
  %188 = zext i1 %187 to i64
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 9)
  %189 = add i64 %pgocount5, %188
  store i64 %189, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 9)
  %190 = select i1 %187, i32 2, i32 1
  store i32 %190, i32* %9, align 4
  store i32 0, i32* %11, align 4
  br label %191

; <label>:191:                                    ; preds = %250, %138
  %192 = load i32, i32* %11, align 4
  %193 = load i32, i32* %10, align 4
  %194 = icmp ult i32 %192, %193
  br i1 %194, label %195, label %254

; <label>:195:                                    ; preds = %191
  store i32 0, i32* %15, align 4
  br label %196

; <label>:196:                                    ; preds = %242, %195
  %197 = load i32, i32* %15, align 4
  %198 = load i32, i32* %9, align 4
  %199 = icmp ult i32 %197, %198
  br i1 %199, label %200, label %246

; <label>:200:                                    ; preds = %196
  store i32 0, i32* %16, align 4
  br label %201

; <label>:201:                                    ; preds = %237, %200
  %202 = load i32, i32* %16, align 4
  %203 = icmp ult i32 %202, 32
  br i1 %203, label %204, label %241

; <label>:204:                                    ; preds = %201
  %205 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %206 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %205, i32 0, i32 2
  %207 = load i32, i32* %15, align 4
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %206, i64 0, i64 %208
  %210 = load i32, i32* %11, align 4
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %209, i64 0, i64 %211
  %213 = load i32, i32* %16, align 4
  %214 = zext i32 %213 to i64
  %215 = getelementptr inbounds [32 x i32], [32 x i32]* %212, i64 0, i64 %214
  %216 = load i32, i32* %215, align 4
  %217 = sext i32 %216 to i64
  %218 = add nsw i64 %217, 2048
  %219 = ashr i64 %218, 12
  %220 = load i32, i32* %13, align 4
  %221 = sext i32 %220 to i64
  %222 = add nsw i64 %221, 32768
  %223 = ashr i64 %222, 16
  %224 = mul nsw i64 %219, %223
  %225 = trunc i64 %224 to i32
  %226 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %227 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %226, i32 0, i32 2
  %228 = load i32, i32* %15, align 4
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %227, i64 0, i64 %229
  %231 = load i32, i32* %11, align 4
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %230, i64 0, i64 %232
  %234 = load i32, i32* %16, align 4
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds [32 x i32], [32 x i32]* %233, i64 0, i64 %235
  store i32 %225, i32* %236, align 4
  br label %237

; <label>:237:                                    ; preds = %204
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 0)
  %238 = add i64 %pgocount6, 1
  store i64 %238, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 0)
  %239 = load i32, i32* %16, align 4
  %240 = add i32 %239, 1
  store i32 %240, i32* %16, align 4
  br label %201

; <label>:241:                                    ; preds = %201
  br label %242

; <label>:242:                                    ; preds = %241
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 1)
  %243 = add i64 %pgocount7, 1
  store i64 %243, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 1)
  %244 = load i32, i32* %15, align 4
  %245 = add i32 %244, 1
  store i32 %245, i32* %15, align 4
  br label %196

; <label>:246:                                    ; preds = %196
  %247 = load i32, i32* %12, align 4
  %248 = load i32, i32* %13, align 4
  %249 = add nsw i32 %248, %247
  store i32 %249, i32* %13, align 4
  br label %250

; <label>:250:                                    ; preds = %246
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 2)
  %251 = add i64 %pgocount8, 1
  store i64 %251, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 2)
  %252 = load i32, i32* %11, align 4
  %253 = add i32 %252, 1
  store i32 %253, i32* %11, align 4
  br label %191

; <label>:254:                                    ; preds = %191
  br label %255

; <label>:255:                                    ; preds = %254, %2
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 3)
  %256 = add i64 %pgocount9, 1
  store i64 %256, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_fadein_filter, i64 0, i64 3)
  ret i32 0
}

declare i32 @mad_timer_compare(i64, i64, i64, i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare void @mad_timer_add(%struct.mad_timer_t*, i64, i64) #2

declare void @mad_timer_negate(%struct.mad_timer_t*) #2

declare void @mad_timer_set(%struct.mad_timer_t*, i64, i64, i64) #2

declare i64 @mad_timer_count(i64, i64, i32) #2

declare i64 @mad_timer_fraction(i64, i64, i64) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
