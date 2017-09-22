; ModuleID = 'tmp1.ll'
source_filename = "audio_raw.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.audio_stats = type { i64, i32, i32 }
%union.audio_control = type { %struct.audio_play }
%struct.audio_play = type { i32, i32, [2 x i32*], i32, %struct.audio_stats* }
%struct.audio_init = type { i32, i8* }
%struct.audio_config = type { i32, i32, i32, i32 }
%struct.audio_stop = type { i32, i32 }
%struct.audio_finish = type { i32 }

$__llvm_profile_raw_version = comdat any

@audio_error = external global i8*, align 8
@.str = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@outfile = internal global %struct._IO_FILE* null, align 8
@.str.2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@stdout = external global %struct._IO_FILE*, align 8
@audio_pcm = internal global i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* null, align 8
@.str.3 = private unnamed_addr constant [8 x i8] c":fwrite\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c":fclose\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_audio_raw = private constant [9 x i8] c"audio_raw"
@__profn_tmp1.ll_init = private constant [12 x i8] c"tmp1.ll:init"
@__profn_tmp1.ll_config = private constant [14 x i8] c"tmp1.ll:config"
@__profn_tmp1.ll_play = private constant [12 x i8] c"tmp1.ll:play"
@__profn_tmp1.ll_stop = private constant [12 x i8] c"tmp1.ll:stop"
@__profn_tmp1.ll_finish = private constant [14 x i8] c"tmp1.ll:finish"
@__profc_audio_raw = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_raw = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2611658845092310218, i64 60466382370, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i32 0, i32 0), i8* bitcast (i32 (%union.audio_control*)* @audio_raw to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_init = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7926974878722176714, i64 53109869912, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_config = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_config = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -864342662826341704, i64 79958827094, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_play = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_play = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_play = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2566291084709189174, i64 281504644258452, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_play to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_stop = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_stop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4914394816370643532, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_stop, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1977734372644750396, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_finish, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [80 x i8] c"N\00audio_raw\01tmp1.ll:init\01tmp1.ll:config\01tmp1.ll:play\01tmp1.ll:stop\01tmp1.ll:finish", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_raw to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_config to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_play to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_stop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @audio_raw(%union.audio_control*) #0 {
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
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 1)
  %9 = load %union.audio_control*, %union.audio_control** %3, align 8
  %10 = bitcast %union.audio_control* %9 to %struct.audio_init*
  %11 = call i32 @init(%struct.audio_init* %10)
  store i32 %11, i32* %2, align 4
  br label %34

; <label>:12:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 2)
  %14 = load %union.audio_control*, %union.audio_control** %3, align 8
  %15 = bitcast %union.audio_control* %14 to %struct.audio_config*
  %16 = call i32 @config(%struct.audio_config* %15)
  store i32 %16, i32* %2, align 4
  br label %34

; <label>:17:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 3)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 3)
  %19 = load %union.audio_control*, %union.audio_control** %3, align 8
  %20 = bitcast %union.audio_control* %19 to %struct.audio_play*
  %21 = call i32 @play(%struct.audio_play* %20)
  store i32 %21, i32* %2, align 4
  br label %34

; <label>:22:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 4)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 4)
  %24 = load %union.audio_control*, %union.audio_control** %3, align 8
  %25 = bitcast %union.audio_control* %24 to %struct.audio_stop*
  %26 = call i32 @stop(%struct.audio_stop* %25)
  store i32 %26, i32* %2, align 4
  br label %34

; <label>:27:                                     ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 5)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 5)
  %29 = load %union.audio_control*, %union.audio_control** %3, align 8
  %30 = bitcast %union.audio_control* %29 to %struct.audio_finish*
  %31 = call i32 @finish(%struct.audio_finish* %30)
  store i32 %31, i32* %2, align 4
  br label %34

; <label>:32:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 0)
  %33 = add i64 %pgocount5, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_raw, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %34

; <label>:34:                                     ; preds = %32, %27, %22, %17, %12, %7
  %35 = load i32, i32* %2, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @init(%struct.audio_init*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.audio_init*, align 8
  store %struct.audio_init* %0, %struct.audio_init** %3, align 8
  %4 = load %struct.audio_init*, %struct.audio_init** %3, align 8
  %5 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %4, i32 0, i32 1
  %6 = load i8*, i8** %5, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %8, label %26

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 0)
  %10 = load %struct.audio_init*, %struct.audio_init** %3, align 8
  %11 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %10, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8
  %13 = call i32 @strcmp(i8* %12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)) #4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %26

; <label>:15:                                     ; preds = %8
  %16 = load %struct.audio_init*, %struct.audio_init** %3, align 8
  %17 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %16, i32 0, i32 1
  %18 = load i8*, i8** %17, align 8
  %19 = call %struct._IO_FILE* @fopen(i8* %18, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %19, %struct._IO_FILE** @outfile, align 8
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %21 = icmp eq %struct._IO_FILE* %20, null
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 3)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 3)
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %30

; <label>:24:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 2)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 2)
  br label %29

; <label>:26:                                     ; preds = %8, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 1)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 1)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %28, %struct._IO_FILE** @outfile, align 8
  br label %29

; <label>:29:                                     ; preds = %26, %24
  store i32 0, i32* %2, align 4
  br label %30

; <label>:30:                                     ; preds = %29, %22
  %31 = load i32, i32* %2, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @config(%struct.audio_config*) #0 {
  %2 = alloca %struct.audio_config*, align 8
  %3 = alloca i32, align 4
  store %struct.audio_config* %0, %struct.audio_config** %2, align 8
  %4 = load %struct.audio_config*, %struct.audio_config** %2, align 8
  %5 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %4, i32 0, i32 3
  %6 = load i32, i32* %5, align 4
  %7 = and i32 %6, -8
  store i32 %7, i32* %3, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 1)
  store i32 16, i32* %3, align 4
  br label %19

; <label>:12:                                     ; preds = %1
  %13 = load i32, i32* %3, align 4
  %14 = icmp ugt i32 %13, 32
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 2)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 2)
  store i32 32, i32* %3, align 4
  br label %17

; <label>:17:                                     ; preds = %15, %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 0)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 0)
  br label %19

; <label>:19:                                     ; preds = %17, %10
  %20 = load i32, i32* %3, align 4
  %21 = load %struct.audio_config*, %struct.audio_config** %2, align 8
  %22 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %21, i32 0, i32 3
  store i32 %20, i32* %22, align 4
  switch i32 %20, label %31 [
    i32 8, label %23
    i32 16, label %25
    i32 24, label %27
    i32 32, label %29
  ]

; <label>:23:                                     ; preds = %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 3)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 3)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_u8, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  br label %31

; <label>:25:                                     ; preds = %19
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 4)
  %26 = add i64 %pgocount4, 1
  store i64 %26, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 4)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s16le, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  br label %31

; <label>:27:                                     ; preds = %19
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 5)
  %28 = add i64 %pgocount5, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 5)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s24le, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  br label %31

; <label>:29:                                     ; preds = %19
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 6)
  %30 = add i64 %pgocount6, 1
  store i64 %30, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_config, i64 0, i64 6)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s32le, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  br label %31

; <label>:31:                                     ; preds = %29, %27, %25, %23, %19
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @play(%struct.audio_play*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.audio_play*, align 8
  %4 = alloca [27648 x i8], align 16
  %5 = alloca i32, align 4
  store %struct.audio_play* %0, %struct.audio_play** %3, align 8
  %6 = load i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)*, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  %7 = getelementptr inbounds [27648 x i8], [27648 x i8]* %4, i32 0, i32 0
  %8 = load %struct.audio_play*, %struct.audio_play** %3, align 8
  %9 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 4
  %11 = load %struct.audio_play*, %struct.audio_play** %3, align 8
  %12 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %11, i32 0, i32 2
  %13 = getelementptr inbounds [2 x i32*], [2 x i32*]* %12, i64 0, i64 0
  %14 = load i32*, i32** %13, align 8
  %15 = load %struct.audio_play*, %struct.audio_play** %3, align 8
  %16 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %15, i32 0, i32 2
  %17 = getelementptr inbounds [2 x i32*], [2 x i32*]* %16, i64 0, i64 1
  %18 = load i32*, i32** %17, align 8
  %19 = load %struct.audio_play*, %struct.audio_play** %3, align 8
  %20 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %19, i32 0, i32 3
  %21 = load i32, i32* %20, align 8
  %22 = load %struct.audio_play*, %struct.audio_play** %3, align 8
  %23 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %22, i32 0, i32 4
  %24 = load %struct.audio_stats*, %struct.audio_stats** %23, align 8
  %25 = ptrtoint i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* %6 to i64
  call void @__llvm_profile_instrument_target(i64 %25, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_play to i8*), i32 0)
  %26 = call i32 %6(i8* %7, i32 %10, i32* %14, i32* %18, i32 %21, %struct.audio_stats* %24)
  store i32 %26, i32* %5, align 4
  %27 = getelementptr inbounds [27648 x i8], [27648 x i8]* %4, i32 0, i32 0
  %28 = load i32, i32* %5, align 4
  %29 = zext i32 %28 to i64
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %31 = call i64 @fwrite(i8* %27, i64 %29, i64 1, %struct._IO_FILE* %30)
  %32 = icmp ne i64 %31, 1
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 0)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 0)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %37

; <label>:35:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %37

; <label>:37:                                     ; preds = %35, %33
  %38 = load i32, i32* %2, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @stop(%struct.audio_stop*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_stop, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_stop, i64 0, i64 0)
  %3 = alloca %struct.audio_stop*, align 8
  store %struct.audio_stop* %0, %struct.audio_stop** %3, align 8
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @finish(%struct.audio_finish*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.audio_finish*, align 8
  store %struct.audio_finish* %0, %struct.audio_finish** %3, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %6 = icmp ne %struct._IO_FILE* %4, %5
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 1)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %10 = call i32 @fclose(%struct._IO_FILE* %9)
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 2)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %16

; <label>:14:                                     ; preds = %7, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 0)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %16

; <label>:16:                                     ; preds = %14, %12
  %17 = load i32, i32* %2, align 4
  ret i32 %17
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @audio_pcm_u8(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #2

declare i32 @audio_pcm_s16le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #2

declare i32 @audio_pcm_s24le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #2

declare i32 @audio_pcm_s32le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
