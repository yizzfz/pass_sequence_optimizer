; ModuleID = 'tmp1.ll'
source_filename = "audio_wave.c"
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
@.str.3 = private unnamed_addr constant [13 x i8] c"RIFF\FF\FF\FF\FFWAVE\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c":fwrite\00", align 1
@riff_len = internal global i64 0, align 8
@data_chunk = internal global i64 0, align 8
@config_channels = internal global i32 0, align 4
@config_speed = internal global i32 0, align 4
@config_precision = internal global i32 0, align 4
@.str.5 = private unnamed_addr constant [5 x i8] c"fmt \00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"data\FF\FF\FF\FF\00", align 1
@data_len = internal global i64 0, align 8
@audio_pcm = internal global i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* null, align 8
@.str.7 = private unnamed_addr constant [7 x i8] c":fputc\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c":fclose\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c":fseek\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_audio_wave = private constant [10 x i8] c"audio_wave"
@__profn_tmp1.ll_init = private constant [12 x i8] c"tmp1.ll:init"
@__profn_tmp1.ll_config = private constant [14 x i8] c"tmp1.ll:config"
@__profn_tmp1.ll_play = private constant [12 x i8] c"tmp1.ll:play"
@__profn_tmp1.ll_stop = private constant [12 x i8] c"tmp1.ll:stop"
@__profn_tmp1.ll_finish = private constant [14 x i8] c"tmp1.ll:finish"
@__profn_tmp1.ll_int32 = private constant [13 x i8] c"tmp1.ll:int32"
@__profn_tmp1.ll_int16 = private constant [13 x i8] c"tmp1.ll:int16"
@__profn_tmp1.ll_patch_int32 = private constant [19 x i8] c"tmp1.ll:patch_int32"
@__profc_audio_wave = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_wave = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7363135999578269043, i64 60466382370, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i32 0, i32 0), i8* bitcast (i32 (%union.audio_control*)* @audio_wave to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_init = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7926974878722176714, i64 65153087820, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_config = private global [38 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_config = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -864342662826341704, i64 243091994210, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i32 0, i32 0), i8* null, i8* null, i32 38, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_play = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_play = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_play = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2566291084709189174, i64 281504644258452, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_play to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_stop = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_stop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4914394816370643532, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_stop, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1977734372644750396, i64 130976426199, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_int32 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_int32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2147194446201517572, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_int32, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_int16 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_int16 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3897629438498739659, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_int16, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_patch_int32 = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_patch_int32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8404616122088659339, i64 53954356755, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [77 x i8] c"\7FKx\DAK,M\C9\CC\8F/O,Ke,\C9-0\D4\CB\C9\B1\CA\CC\CB,\81s\92\F3\F3\D22\D3\E1\DC\82\9C\C4J8\A7\B8$\BF\00\CEI\03j+\CE@2\A4\C4\D8\08\99gh\860$\B1$9#\1E\AC\02\00&\F6+\E5", section "__llvm_prf_names"
@llvm.used = appending global [11 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_wave to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_config to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_play to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_stop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_int32 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_int16 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_patch_int32 to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @audio_wave(%union.audio_control*) #0 {
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
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 1)
  %9 = load %union.audio_control*, %union.audio_control** %3, align 8
  %10 = bitcast %union.audio_control* %9 to %struct.audio_init*
  %11 = call i32 @init(%struct.audio_init* %10)
  store i32 %11, i32* %2, align 4
  br label %34

; <label>:12:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 2)
  %14 = load %union.audio_control*, %union.audio_control** %3, align 8
  %15 = bitcast %union.audio_control* %14 to %struct.audio_config*
  %16 = call i32 @config(%struct.audio_config* %15)
  store i32 %16, i32* %2, align 4
  br label %34

; <label>:17:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 3)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 3)
  %19 = load %union.audio_control*, %union.audio_control** %3, align 8
  %20 = bitcast %union.audio_control* %19 to %struct.audio_play*
  %21 = call i32 @play(%struct.audio_play* %20)
  store i32 %21, i32* %2, align 4
  br label %34

; <label>:22:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 4)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 4)
  %24 = load %union.audio_control*, %union.audio_control** %3, align 8
  %25 = bitcast %union.audio_control* %24 to %struct.audio_stop*
  %26 = call i32 @stop(%struct.audio_stop* %25)
  store i32 %26, i32* %2, align 4
  br label %34

; <label>:27:                                     ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 5)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 5)
  %29 = load %union.audio_control*, %union.audio_control** %3, align 8
  %30 = bitcast %union.audio_control* %29 to %struct.audio_finish*
  %31 = call i32 @finish(%struct.audio_finish* %30)
  store i32 %31, i32* %2, align 4
  br label %34

; <label>:32:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 0)
  %33 = add i64 %pgocount5, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_wave, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %34

; <label>:34:                                     ; preds = %32, %27, %22, %17, %12, %7
  %35 = load i32, i32* %2, align 4
  ret i32 %35
}

; Function Attrs: nounwind uwtable
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
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 0)
  %10 = load %struct.audio_init*, %struct.audio_init** %3, align 8
  %11 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %10, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8
  %13 = call i32 @strcmp(i8* %12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)) #5
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
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 4)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 4)
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %36

; <label>:24:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 3)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 3)
  br label %28

; <label>:26:                                     ; preds = %8, %1
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %27, %struct._IO_FILE** @outfile, align 8
  br label %28

; <label>:28:                                     ; preds = %26, %24
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %30 = call i64 @fwrite(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), i64 12, i64 1, %struct._IO_FILE* %29)
  %31 = icmp ne i64 %30, 1
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %28
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 1)
  %33 = add i64 %pgocount3, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 1)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %36

; <label>:34:                                     ; preds = %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 2)
  %35 = add i64 %pgocount4, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_init, i64 0, i64 2)
  store i64 4, i64* @riff_len, align 8
  store i64 -1, i64* @data_chunk, align 8
  store i32 0, i32* @config_channels, align 4
  store i32 0, i32* @config_speed, align 4
  store i32 0, i32* @config_precision, align 4
  store i32 0, i32* %2, align 4
  br label %36

; <label>:36:                                     ; preds = %34, %32, %22
  %37 = load i32, i32* %2, align 4
  ret i32 %37
}

; Function Attrs: nounwind uwtable
define internal i32 @config(%struct.audio_config*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.audio_config*, align 8
  %4 = alloca [24 x i8], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  store %struct.audio_config* %0, %struct.audio_config** %3, align 8
  %8 = load i32, i32* @config_precision, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %21

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 28)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 28)
  %12 = load i32, i32* @config_channels, align 4
  %13 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %14 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %13, i32 0, i32 1
  store i32 %12, i32* %14, align 4
  %15 = load i32, i32* @config_speed, align 4
  %16 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %17 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %16, i32 0, i32 2
  store i32 %15, i32* %17, align 4
  %18 = load i32, i32* @config_precision, align 4
  %19 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %20 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %19, i32 0, i32 3
  store i32 %18, i32* %20, align 4
  store i32 0, i32* %2, align 4
  br label %136

; <label>:21:                                     ; preds = %1
  %22 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %23 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %22, i32 0, i32 3
  %24 = load i32, i32* %23, align 4
  store i32 %24, i32* %6, align 4
  %25 = load i32, i32* %6, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %21
  %pgocount28 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 30)
  %28 = add i64 %pgocount28, 1
  store i64 %28, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 30)
  store i32 16, i32* %6, align 4
  br label %35

; <label>:29:                                     ; preds = %21
  %30 = load i32, i32* %6, align 4
  %31 = icmp ugt i32 %30, 32
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %29
  %pgocount29 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 31)
  %33 = add i64 %pgocount29, 1
  store i64 %33, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 31)
  store i32 32, i32* %6, align 4
  br label %34

; <label>:34:                                     ; preds = %32, %29
  br label %35

; <label>:35:                                     ; preds = %34, %27
  %36 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %37 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  %39 = load i32, i32* %6, align 4
  %40 = add i32 %39, 7
  %41 = udiv i32 %40, 8
  %42 = mul i32 %38, %41
  store i32 %42, i32* %5, align 4
  %43 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %44 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %43, i32 0, i32 2
  %45 = load i32, i32* %44, align 4
  %46 = load i32, i32* %5, align 4
  %47 = mul i32 %45, %46
  %48 = zext i32 %47 to i64
  store i64 %48, i64* %7, align 8
  %49 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i64 4, i32 1, i1 false)
  %50 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 4
  call void @int32(i8* %50, i64 16)
  %51 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 8
  call void @int16(i8* %51, i32 1)
  %52 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 10
  %53 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %54 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %53, i32 0, i32 1
  %55 = load i32, i32* %54, align 4
  call void @int16(i8* %52, i32 %55)
  %56 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 12
  %57 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %58 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %57, i32 0, i32 2
  %59 = load i32, i32* %58, align 4
  %60 = zext i32 %59 to i64
  call void @int32(i8* %56, i64 %60)
  %61 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 16
  %62 = load i64, i64* %7, align 8
  call void @int32(i8* %61, i64 %62)
  %63 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 20
  %64 = load i32, i32* %5, align 4
  call void @int16(i8* %63, i32 %64)
  %65 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 22
  %66 = load i32, i32* %6, align 4
  call void @int16(i8* %65, i32 %66)
  %67 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i32 0, i32 0
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %69 = call i64 @fwrite(i8* %67, i64 24, i64 1, %struct._IO_FILE* %68)
  %70 = icmp ne i64 %69, 1
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %35
  %pgocount30 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 29)
  %72 = add i64 %pgocount30, 1
  store i64 %72, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 29)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %136

; <label>:73:                                     ; preds = %35
  %74 = load i64, i64* @riff_len, align 8
  %75 = add i64 %74, 24
  store i64 %75, i64* @riff_len, align 8
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %77 = call i64 @ftell(%struct._IO_FILE* %76)
  store i64 %77, i64* @data_chunk, align 8
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %79 = call i64 @fwrite(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0), i64 8, i64 1, %struct._IO_FILE* %78)
  %80 = icmp ne i64 %79, 1
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %73
  %pgocount31 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 32)
  %82 = add i64 %pgocount31, 1
  store i64 %82, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 32)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %136

; <label>:83:                                     ; preds = %73
  %84 = load i64, i64* @riff_len, align 8
  %85 = add i64 %84, 8
  store i64 %85, i64* @riff_len, align 8
  store i64 0, i64* @data_len, align 8
  %86 = load i32, i32* %6, align 4
  %87 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %88 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %87, i32 0, i32 3
  store i32 %86, i32* %88, align 4
  switch i32 %86, label %125 [
    i32 1, label %._crit_edge
    i32 2, label %._crit_edge1
    i32 3, label %._crit_edge2
    i32 4, label %._crit_edge3
    i32 5, label %._crit_edge4
    i32 6, label %._crit_edge5
    i32 7, label %._crit_edge6
    i32 8, label %117
    i32 9, label %._crit_edge7
    i32 10, label %._crit_edge8
    i32 11, label %._crit_edge9
    i32 12, label %._crit_edge10
    i32 13, label %._crit_edge11
    i32 14, label %._crit_edge12
    i32 15, label %._crit_edge13
    i32 16, label %119
    i32 17, label %._crit_edge14
    i32 18, label %._crit_edge15
    i32 19, label %._crit_edge16
    i32 20, label %._crit_edge17
    i32 21, label %._crit_edge18
    i32 22, label %._crit_edge19
    i32 23, label %._crit_edge20
    i32 24, label %121
    i32 25, label %._crit_edge21
    i32 26, label %._crit_edge22
    i32 27, label %._crit_edge23
    i32 28, label %._crit_edge24
    i32 29, label %._crit_edge25
    i32 30, label %._crit_edge26
    i32 31, label %._crit_edge27
    i32 32, label %123
  ]

._crit_edge27:                                    ; preds = %83
  %pgocount32 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 27)
  %89 = add i64 %pgocount32, 1
  store i64 %89, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 27)
  br label %123

._crit_edge26:                                    ; preds = %83
  %pgocount33 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 26)
  %90 = add i64 %pgocount33, 1
  store i64 %90, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 26)
  br label %123

._crit_edge25:                                    ; preds = %83
  %pgocount34 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 25)
  %91 = add i64 %pgocount34, 1
  store i64 %91, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 25)
  br label %123

._crit_edge24:                                    ; preds = %83
  %pgocount35 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 24)
  %92 = add i64 %pgocount35, 1
  store i64 %92, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 24)
  br label %123

._crit_edge23:                                    ; preds = %83
  %pgocount36 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 23)
  %93 = add i64 %pgocount36, 1
  store i64 %93, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 23)
  br label %123

._crit_edge22:                                    ; preds = %83
  %pgocount37 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 22)
  %94 = add i64 %pgocount37, 1
  store i64 %94, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 22)
  br label %123

._crit_edge21:                                    ; preds = %83
  %pgocount38 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 21)
  %95 = add i64 %pgocount38, 1
  store i64 %95, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 21)
  br label %123

._crit_edge20:                                    ; preds = %83
  %pgocount39 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 20)
  %96 = add i64 %pgocount39, 1
  store i64 %96, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 20)
  br label %121

._crit_edge19:                                    ; preds = %83
  %pgocount40 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 19)
  %97 = add i64 %pgocount40, 1
  store i64 %97, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 19)
  br label %121

._crit_edge18:                                    ; preds = %83
  %pgocount41 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 18)
  %98 = add i64 %pgocount41, 1
  store i64 %98, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 18)
  br label %121

._crit_edge17:                                    ; preds = %83
  %pgocount42 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 17)
  %99 = add i64 %pgocount42, 1
  store i64 %99, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 17)
  br label %121

._crit_edge16:                                    ; preds = %83
  %pgocount43 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 16)
  %100 = add i64 %pgocount43, 1
  store i64 %100, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 16)
  br label %121

._crit_edge15:                                    ; preds = %83
  %pgocount44 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 15)
  %101 = add i64 %pgocount44, 1
  store i64 %101, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 15)
  br label %121

._crit_edge14:                                    ; preds = %83
  %pgocount45 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 14)
  %102 = add i64 %pgocount45, 1
  store i64 %102, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 14)
  br label %121

._crit_edge13:                                    ; preds = %83
  %pgocount46 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 13)
  %103 = add i64 %pgocount46, 1
  store i64 %103, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 13)
  br label %119

._crit_edge12:                                    ; preds = %83
  %pgocount47 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 12)
  %104 = add i64 %pgocount47, 1
  store i64 %104, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 12)
  br label %119

._crit_edge11:                                    ; preds = %83
  %pgocount48 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 11)
  %105 = add i64 %pgocount48, 1
  store i64 %105, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 11)
  br label %119

._crit_edge10:                                    ; preds = %83
  %pgocount49 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 10)
  %106 = add i64 %pgocount49, 1
  store i64 %106, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 10)
  br label %119

._crit_edge9:                                     ; preds = %83
  %pgocount50 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 9)
  %107 = add i64 %pgocount50, 1
  store i64 %107, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 9)
  br label %119

._crit_edge8:                                     ; preds = %83
  %pgocount51 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 8)
  %108 = add i64 %pgocount51, 1
  store i64 %108, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 8)
  br label %119

._crit_edge7:                                     ; preds = %83
  %pgocount52 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 7)
  %109 = add i64 %pgocount52, 1
  store i64 %109, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 7)
  br label %119

._crit_edge6:                                     ; preds = %83
  %pgocount53 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 6)
  %110 = add i64 %pgocount53, 1
  store i64 %110, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 6)
  br label %117

._crit_edge5:                                     ; preds = %83
  %pgocount54 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 5)
  %111 = add i64 %pgocount54, 1
  store i64 %111, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 5)
  br label %117

._crit_edge4:                                     ; preds = %83
  %pgocount55 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 4)
  %112 = add i64 %pgocount55, 1
  store i64 %112, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 4)
  br label %117

._crit_edge3:                                     ; preds = %83
  %pgocount56 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 3)
  %113 = add i64 %pgocount56, 1
  store i64 %113, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 3)
  br label %117

._crit_edge2:                                     ; preds = %83
  %pgocount57 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 2)
  %114 = add i64 %pgocount57, 1
  store i64 %114, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 2)
  br label %117

._crit_edge1:                                     ; preds = %83
  %pgocount58 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 1)
  %115 = add i64 %pgocount58, 1
  store i64 %115, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 1)
  br label %117

._crit_edge:                                      ; preds = %83
  %pgocount59 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 0)
  %116 = add i64 %pgocount59, 1
  store i64 %116, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 0)
  br label %117

; <label>:117:                                    ; preds = %._crit_edge6, %._crit_edge5, %._crit_edge4, %._crit_edge3, %._crit_edge2, %._crit_edge1, %._crit_edge, %83
  %pgocount60 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 34)
  %118 = add i64 %pgocount60, 1
  store i64 %118, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 34)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_u8, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  br label %125

; <label>:119:                                    ; preds = %._crit_edge13, %._crit_edge12, %._crit_edge11, %._crit_edge10, %._crit_edge9, %._crit_edge8, %._crit_edge7, %83
  %pgocount61 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 35)
  %120 = add i64 %pgocount61, 1
  store i64 %120, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 35)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s16le, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  br label %125

; <label>:121:                                    ; preds = %._crit_edge20, %._crit_edge19, %._crit_edge18, %._crit_edge17, %._crit_edge16, %._crit_edge15, %._crit_edge14, %83
  %pgocount62 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 36)
  %122 = add i64 %pgocount62, 1
  store i64 %122, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 36)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s24le, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  br label %125

; <label>:123:                                    ; preds = %._crit_edge27, %._crit_edge26, %._crit_edge25, %._crit_edge24, %._crit_edge23, %._crit_edge22, %._crit_edge21, %83
  %pgocount63 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 37)
  %124 = add i64 %pgocount63, 1
  store i64 %124, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 37)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s32le, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  br label %125

; <label>:125:                                    ; preds = %123, %121, %119, %117, %83
  %pgocount64 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 33)
  %126 = add i64 %pgocount64, 1
  store i64 %126, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_config, i64 0, i64 33)
  %127 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %128 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %127, i32 0, i32 1
  %129 = load i32, i32* %128, align 4
  store i32 %129, i32* @config_channels, align 4
  %130 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %131 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %130, i32 0, i32 2
  %132 = load i32, i32* %131, align 4
  store i32 %132, i32* @config_speed, align 4
  %133 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %134 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %133, i32 0, i32 3
  %135 = load i32, i32* %134, align 4
  store i32 %135, i32* @config_precision, align 4
  store i32 0, i32* %2, align 4
  br label %136

; <label>:136:                                    ; preds = %125, %81, %71, %10
  %137 = load i32, i32* %2, align 4
  ret i32 %137
}

; Function Attrs: nounwind uwtable
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
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %45

; <label>:35:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_play, i64 0, i64 1)
  %37 = load i32, i32* %5, align 4
  %38 = zext i32 %37 to i64
  %39 = load i64, i64* @data_len, align 8
  %40 = add i64 %39, %38
  store i64 %40, i64* @data_len, align 8
  %41 = load i32, i32* %5, align 4
  %42 = zext i32 %41 to i64
  %43 = load i64, i64* @riff_len, align 8
  %44 = add i64 %43, %42
  store i64 %44, i64* @riff_len, align 8
  store i32 0, i32* %2, align 4
  br label %45

; <label>:45:                                     ; preds = %35, %33
  %46 = load i32, i32* %2, align 4
  ret i32 %46
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
  %2 = alloca %struct.audio_finish*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.audio_config, align 4
  store %struct.audio_finish* %0, %struct.audio_finish** %2, align 8
  store i32 0, i32* %3, align 4
  %5 = load i32, i32* @config_precision, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 3)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 3)
  %9 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %4, i32 0, i32 0
  store i32 1, i32* %9, align 4
  %10 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %4, i32 0, i32 1
  store i32 2, i32* %10, align 4
  %11 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %4, i32 0, i32 2
  store i32 44100, i32* %11, align 4
  %12 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %4, i32 0, i32 3
  store i32 0, i32* %12, align 4
  %13 = call i32 @config(%struct.audio_config* %4)
  store i32 %13, i32* %3, align 4
  br label %14

; <label>:14:                                     ; preds = %7, %1
  %15 = load i64, i64* @data_len, align 8
  %16 = and i64 %15, 1
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %32

; <label>:18:                                     ; preds = %14
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %20 = call i32 @fputc(i32 0, %struct._IO_FILE* %19)
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %28

; <label>:22:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 8)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 8)
  %24 = load i32, i32* %3, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 11)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 11)
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %3, align 4
  br label %28

; <label>:28:                                     ; preds = %26, %22, %18
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 2)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 2)
  %30 = load i64, i64* @riff_len, align 8
  %31 = add i64 %30, 1
  store i64 %31, i64* @riff_len, align 8
  br label %32

; <label>:32:                                     ; preds = %28, %14
  %33 = load i32, i32* %3, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %48

; <label>:35:                                     ; preds = %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 4)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 4)
  %37 = load i64, i64* @data_chunk, align 8
  %38 = icmp ne i64 %37, -1
  br i1 %38, label %39, label %48

; <label>:39:                                     ; preds = %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 6)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 6)
  %41 = load i64, i64* @data_chunk, align 8
  %42 = add nsw i64 %41, 4
  %43 = load i64, i64* @data_len, align 8
  %44 = call i32 @patch_int32(i64 %42, i64 %43)
  %45 = icmp eq i32 %44, -1
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %39
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 9)
  %47 = add i64 %pgocount6, 1
  store i64 %47, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 9)
  store i32 -1, i32* %3, align 4
  br label %48

; <label>:48:                                     ; preds = %46, %39, %35, %32
  %49 = load i32, i32* %3, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %48
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 5)
  %52 = add i64 %pgocount7, 1
  store i64 %52, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 5)
  %53 = load i64, i64* @riff_len, align 8
  %54 = call i32 @patch_int32(i64 4, i64 %53)
  br label %55

; <label>:55:                                     ; preds = %51, %48
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %58 = icmp ne %struct._IO_FILE* %56, %57
  br i1 %58, label %59, label %70

; <label>:59:                                     ; preds = %55
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 1)
  %60 = add i64 %pgocount8, 1
  store i64 %60, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 1)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %62 = call i32 @fclose(%struct._IO_FILE* %61)
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %64, label %70

; <label>:64:                                     ; preds = %59
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 7)
  %65 = add i64 %pgocount9, 1
  store i64 %65, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 7)
  %66 = load i32, i32* %3, align 4
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %70

; <label>:68:                                     ; preds = %64
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 10)
  %69 = add i64 %pgocount10, 1
  store i64 %69, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 10)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %3, align 4
  br label %70

; <label>:70:                                     ; preds = %68, %64, %59, %55
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 0)
  %71 = add i64 %pgocount11, 1
  store i64 %71, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 0)
  %72 = load i32, i32* %3, align 4
  ret i32 %72
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal void @int32(i8*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_int32, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_int32, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = lshr i64 %6, 0
  %8 = trunc i64 %7 to i8
  %9 = load i8*, i8** %4, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  store i8 %8, i8* %10, align 1
  %11 = load i64, i64* %5, align 8
  %12 = lshr i64 %11, 8
  %13 = trunc i64 %12 to i8
  %14 = load i8*, i8** %4, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 1
  store i8 %13, i8* %15, align 1
  %16 = load i64, i64* %5, align 8
  %17 = lshr i64 %16, 16
  %18 = trunc i64 %17 to i8
  %19 = load i8*, i8** %4, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 2
  store i8 %18, i8* %20, align 1
  %21 = load i64, i64* %5, align 8
  %22 = lshr i64 %21, 24
  %23 = trunc i64 %22 to i8
  %24 = load i8*, i8** %4, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 3
  store i8 %23, i8* %25, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @int16(i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_int16, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_int16, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = lshr i32 %6, 0
  %8 = trunc i32 %7 to i8
  %9 = load i8*, i8** %4, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  store i8 %8, i8* %10, align 1
  %11 = load i32, i32* %5, align 4
  %12 = lshr i32 %11, 8
  %13 = trunc i32 %12 to i8
  %14 = load i8*, i8** %4, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 1
  store i8 %13, i8* %15, align 1
  ret void
}

declare i64 @ftell(%struct._IO_FILE*) #2

declare i32 @audio_pcm_u8(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #2

declare i32 @audio_pcm_s16le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #2

declare i32 @audio_pcm_s24le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #2

declare i32 @audio_pcm_s32le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #2

declare i32 @fputc(i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define internal i32 @patch_int32(i64, i64) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca [4 x i8], align 1
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %8 = load i64, i64* %4, align 8
  %9 = call i32 @fseek(%struct._IO_FILE* %7, i64 %8, i32 0)
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i64 0, i64 0)
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %3, align 4
  br label %30

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i32 0, i32 0
  %15 = load i64, i64* %5, align 8
  call void @int32(i8* %14, i64 %15)
  %16 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i32 0, i32 0
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %18 = call i64 @fwrite(i8* %16, i64 4, i64 1, %struct._IO_FILE* %17)
  %19 = icmp ne i64 %18, 1
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i64 0, i64 1)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %3, align 4
  br label %30

; <label>:22:                                     ; preds = %13
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile, align 8
  %24 = call i32 @fseek(%struct._IO_FILE* %23, i64 0, i32 2)
  %25 = icmp eq i32 %24, -1
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i64 0, i64 3)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i64 0, i64 3)
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %3, align 4
  br label %30

; <label>:28:                                     ; preds = %22
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i64 0, i64 2)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_patch_int32, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %30

; <label>:30:                                     ; preds = %28, %26, %20, %11
  %31 = load i32, i32* %3, align 4
  ret i32 %31
}

declare i32 @fclose(%struct._IO_FILE*) #2

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
