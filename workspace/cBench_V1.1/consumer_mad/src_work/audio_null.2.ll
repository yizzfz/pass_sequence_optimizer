; ModuleID = 'tmp1.ll'
source_filename = "audio_null.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.audio_control = type { %struct.audio_play }
%struct.audio_play = type { i32, i32, [2 x i32*], i32, %struct.audio_stats* }
%struct.audio_stats = type { i64, i32, i32 }
%struct.audio_init = type { i32, i8* }
%struct.audio_config = type { i32, i32, i32, i32 }
%struct.audio_stop = type { i32, i32 }
%struct.audio_finish = type { i32 }

$__llvm_profile_raw_version = comdat any

@audio_error = external global i8*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_audio_null = private constant [10 x i8] c"audio_null"
@__profn_tmp1.ll_init = private constant [12 x i8] c"tmp1.ll:init"
@__profn_tmp1.ll_config = private constant [14 x i8] c"tmp1.ll:config"
@__profn_tmp1.ll_play = private constant [12 x i8] c"tmp1.ll:play"
@__profn_tmp1.ll_stop = private constant [12 x i8] c"tmp1.ll:stop"
@__profn_tmp1.ll_finish = private constant [14 x i8] c"tmp1.ll:finish"
@__profn_tmp1.ll_update_stats = private constant [20 x i8] c"tmp1.ll:update_stats"
@__profc_audio_null = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_null = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8433830428459064883, i64 60466382370, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i32 0, i32 0), i8* bitcast (i32 (%union.audio_control*)* @audio_null to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7926974878722176714, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_config = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_config = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -864342662826341704, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_config, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_play = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_play = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2566291084709189174, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_stop = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_stop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4914394816370643532, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_stop, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1977734372644750396, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_update_stats = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_update_stats = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -407622132197201597, i64 99793918471, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [72 x i8] c"dFx\DAK,M\C9\CC\8F\CF+\CD\C9a,\C9-0\D4\CB\C9\B1\CA\CC\CB,\81s\92\F3\F3\D22\D3\E1\DC\82\9C\C4J8\A7\B8$\BF\00\CEI\03j+\CE\80sK\0BR\12KR\E3\8BK\12K\8A\01\09\AD#\F7", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_null to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_config to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_play to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_stop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_update_stats to i8*), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @audio_null(%union.audio_control*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %union.audio_control*, align 8
  store %union.audio_control* %0, %union.audio_control** %3, align 8
  store i8* null, i8** @audio_error, align 8
  %4 = load %union.audio_control*, %union.audio_control** %3, align 8
  %5 = bitcast %union.audio_control* %4 to i32*
  %6 = load i32, i32* %5, align 8
  switch i32 %6, label %32 [
    i32 0, label %7
    i32 1, label %12
    i32 2, label %17
    i32 3, label %22
    i32 4, label %27
  ]

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 1)
  %9 = load %union.audio_control*, %union.audio_control** %3, align 8
  %10 = bitcast %union.audio_control* %9 to %struct.audio_init*
  %11 = call i32 @init(%struct.audio_init* %10)
  store i32 %11, i32* %2, align 4
  br label %34

; <label>:12:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 2)
  %14 = load %union.audio_control*, %union.audio_control** %3, align 8
  %15 = bitcast %union.audio_control* %14 to %struct.audio_config*
  %16 = call i32 @config(%struct.audio_config* %15)
  store i32 %16, i32* %2, align 4
  br label %34

; <label>:17:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 3)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 3)
  %19 = load %union.audio_control*, %union.audio_control** %3, align 8
  %20 = bitcast %union.audio_control* %19 to %struct.audio_play*
  %21 = call i32 @play(%struct.audio_play* %20)
  store i32 %21, i32* %2, align 4
  br label %34

; <label>:22:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 4)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 4)
  %24 = load %union.audio_control*, %union.audio_control** %3, align 8
  %25 = bitcast %union.audio_control* %24 to %struct.audio_stop*
  %26 = call i32 @stop(%struct.audio_stop* %25)
  store i32 %26, i32* %2, align 4
  br label %34

; <label>:27:                                     ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 5)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 5)
  %29 = load %union.audio_control*, %union.audio_control** %3, align 8
  %30 = bitcast %union.audio_control* %29 to %struct.audio_finish*
  %31 = call i32 @finish(%struct.audio_finish* %30)
  store i32 %31, i32* %2, align 4
  br label %34

; <label>:32:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 0)
  %33 = add i64 %pgocount5, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_null, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %34

; <label>:34:                                     ; preds = %32, %27, %22, %17, %12, %7
  %35 = load i32, i32* %2, align 4
  ret i32 %35
}

; Function Attrs: nounwind uwtable
define internal i32 @init(%struct.audio_init*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_init, i64 0, i64 0)
  %3 = alloca %struct.audio_init*, align 8
  store %struct.audio_init* %0, %struct.audio_init** %3, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @config(%struct.audio_config*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_config, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_config, i64 0, i64 0)
  %3 = alloca %struct.audio_config*, align 8
  store %struct.audio_config* %0, %struct.audio_config** %3, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @play(%struct.audio_play*) #0 {
  %2 = alloca %struct.audio_play*, align 8
  store %struct.audio_play* %0, %struct.audio_play** %2, align 8
  %3 = load %struct.audio_play*, %struct.audio_play** %2, align 8
  %4 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %3, i32 0, i32 4
  %5 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %6 = load %struct.audio_play*, %struct.audio_play** %2, align 8
  %7 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %6, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = load %struct.audio_play*, %struct.audio_play** %2, align 8
  %10 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %9, i32 0, i32 2
  %11 = getelementptr inbounds [2 x i32*], [2 x i32*]* %10, i64 0, i64 0
  %12 = load i32*, i32** %11, align 8
  call void @update_stats(%struct.audio_stats* %5, i32 %8, i32* %12)
  %13 = load %struct.audio_play*, %struct.audio_play** %2, align 8
  %14 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %13, i32 0, i32 2
  %15 = getelementptr inbounds [2 x i32*], [2 x i32*]* %14, i64 0, i64 1
  %16 = load i32*, i32** %15, align 8
  %17 = icmp ne i32* %16, null
  br i1 %17, label %18, label %30

; <label>:18:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 1)
  %20 = load %struct.audio_play*, %struct.audio_play** %2, align 8
  %21 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %20, i32 0, i32 4
  %22 = load %struct.audio_stats*, %struct.audio_stats** %21, align 8
  %23 = load %struct.audio_play*, %struct.audio_play** %2, align 8
  %24 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %23, i32 0, i32 1
  %25 = load i32, i32* %24, align 4
  %26 = load %struct.audio_play*, %struct.audio_play** %2, align 8
  %27 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %26, i32 0, i32 2
  %28 = getelementptr inbounds [2 x i32*], [2 x i32*]* %27, i64 0, i64 1
  %29 = load i32*, i32** %28, align 8
  call void @update_stats(%struct.audio_stats* %22, i32 %25, i32* %29)
  br label %30

; <label>:30:                                     ; preds = %18, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 0)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 0)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @stop(%struct.audio_stop*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_stop, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_stop, i64 0, i64 0)
  %3 = alloca %struct.audio_stop*, align 8
  store %struct.audio_stop* %0, %struct.audio_stop** %3, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @finish(%struct.audio_finish*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 0)
  %3 = alloca %struct.audio_finish*, align 8
  store %struct.audio_finish* %0, %struct.audio_finish** %3, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @update_stats(%struct.audio_stats*, i32, i32*) #0 {
  %4 = alloca %struct.audio_stats*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  store %struct.audio_stats* %0, %struct.audio_stats** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32* %2, i32** %6, align 8
  br label %7

; <label>:7:                                      ; preds = %81, %3
  %8 = load i32, i32* %5, align 4
  %9 = add i32 %8, -1
  store i32 %9, i32* %5, align 4
  %10 = icmp ne i32 %8, 0
  br i1 %10, label %11, label %84

; <label>:11:                                     ; preds = %7
  %12 = load i32*, i32** %6, align 8
  %13 = load i32, i32* %12, align 4
  %14 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %15 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %14, i32 0, i32 2
  %16 = load i32, i32* %15, align 4
  %17 = icmp sge i32 %13, %16
  br i1 %17, label %18, label %44

; <label>:18:                                     ; preds = %11
  %19 = load i32*, i32** %6, align 8
  %20 = load i32, i32* %19, align 4
  %21 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %22 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %21, i32 0, i32 2
  store i32 %20, i32* %22, align 4
  %23 = load i32*, i32** %6, align 8
  %24 = load i32, i32* %23, align 4
  %25 = icmp sgt i32 %24, 268435455
  br i1 %25, label %26, label %42

; <label>:26:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 2)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 2)
  %28 = load i32*, i32** %6, align 8
  %29 = load i32, i32* %28, align 4
  %30 = sub nsw i32 %29, 268435455
  %31 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %32 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %31, i32 0, i32 1
  %33 = load i32, i32* %32, align 8
  %34 = icmp sgt i32 %30, %33
  br i1 %34, label %35, label %42

; <label>:35:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 4)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 4)
  %37 = load i32*, i32** %6, align 8
  %38 = load i32, i32* %37, align 4
  %39 = sub nsw i32 %38, 268435455
  %40 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %41 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %40, i32 0, i32 1
  store i32 %39, i32* %41, align 8
  br label %42

; <label>:42:                                     ; preds = %35, %26, %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 0)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 0)
  br label %81

; <label>:44:                                     ; preds = %11
  %45 = load i32*, i32** %6, align 8
  %46 = load i32, i32* %45, align 4
  %47 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %48 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %47, i32 0, i32 2
  %49 = load i32, i32* %48, align 4
  %50 = sub nsw i32 0, %49
  %51 = icmp slt i32 %46, %50
  br i1 %51, label %52, label %79

; <label>:52:                                     ; preds = %44
  %53 = load i32*, i32** %6, align 8
  %54 = load i32, i32* %53, align 4
  %55 = sub nsw i32 0, %54
  %56 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %57 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %56, i32 0, i32 2
  store i32 %55, i32* %57, align 4
  %58 = load i32*, i32** %6, align 8
  %59 = load i32, i32* %58, align 4
  %60 = icmp slt i32 %59, -268435456
  br i1 %60, label %61, label %77

; <label>:61:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 5)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 5)
  %63 = load i32*, i32** %6, align 8
  %64 = load i32, i32* %63, align 4
  %65 = sub nsw i32 -268435456, %64
  %66 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %67 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %66, i32 0, i32 1
  %68 = load i32, i32* %67, align 8
  %69 = icmp sgt i32 %65, %68
  br i1 %69, label %70, label %77

; <label>:70:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 6)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 6)
  %72 = load i32*, i32** %6, align 8
  %73 = load i32, i32* %72, align 4
  %74 = sub nsw i32 -268435456, %73
  %75 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %76 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %75, i32 0, i32 1
  store i32 %74, i32* %76, align 8
  br label %77

; <label>:77:                                     ; preds = %70, %61, %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 3)
  %78 = add i64 %pgocount5, 1
  store i64 %78, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 3)
  br label %79

; <label>:79:                                     ; preds = %77, %44
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 1)
  %80 = add i64 %pgocount6, 1
  store i64 %80, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 1)
  br label %81

; <label>:81:                                     ; preds = %79, %42
  %82 = load i32*, i32** %6, align 8
  %83 = getelementptr inbounds i32, i32* %82, i32 1
  store i32* %83, i32** %6, align 8
  br label %7

; <label>:84:                                     ; preds = %7
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 7)
  %85 = add i64 %pgocount7, 1
  store i64 %85, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_update_stats, i64 0, i64 7)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
