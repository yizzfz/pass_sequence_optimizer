; ModuleID = 'tmp1.ll'
source_filename = "audio_oss.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.audio_stats = type { i64, i32, i32 }
%union.audio_control = type { %struct.audio_play }
%struct.audio_play = type { i32, i32, [2 x i32*], i32, %struct.audio_stats* }
%struct.audio_init = type { i32, i8* }
%struct.audio_config = type { i32, i32, i32, i32 }
%struct.audio_stop = type { i32, i32 }
%struct.audio_finish = type { i32 }

$__llvm_profile_raw_version = comdat any

@audio_error = external global i8*, align 8
@sfd = internal global i32 0, align 4
@.str = private unnamed_addr constant [15 x i8] c"/dev/sound/dsp\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"/dev/dsp\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c":ioctl(SNDCTL_DSP_SYNC)\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c":ioctl(SNDCTL_DSP_SETFMT)\00", align 1
@audio_pcm = internal global i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* null, align 8
@.str.5 = private unnamed_addr constant [36 x i8] c"no supported audio format available\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c":ioctl(SNDCTL_DSP_CHANNELS)\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c":ioctl(SNDCTL_DSP_SPEED)\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c":write\00", align 1
@.str.9 = private unnamed_addr constant [25 x i8] c":ioctl(SNDCTL_DSP_RESET)\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c":close\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_audio_oss = private constant [9 x i8] c"audio_oss"
@__profn_tmp1.ll_init = private constant [12 x i8] c"tmp1.ll:init"
@__profn_tmp1.ll_config = private constant [14 x i8] c"tmp1.ll:config"
@__profn_tmp1.ll_play = private constant [12 x i8] c"tmp1.ll:play"
@__profn_tmp1.ll_stop = private constant [12 x i8] c"tmp1.ll:stop"
@__profn_tmp1.ll_finish = private constant [14 x i8] c"tmp1.ll:finish"
@__profn_tmp1.ll_output = private constant [14 x i8] c"tmp1.ll:output"
@__profc_audio_oss = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_oss = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3164460081136932546, i64 60466382370, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i32 0, i32 0), i8* bitcast (i32 (%union.audio_control*)* @audio_oss to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_init = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7926974878722176714, i64 59473753045, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_config = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_config = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -864342662826341704, i64 156771054396, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i32 0, i32 0), i8* null, i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_play = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_play = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_play = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2566291084709189174, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_play, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_play to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_stop = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_stop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4914394816370643532, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1977734372644750396, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_output = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2124609546817397435, i64 56747664950, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [65 x i8] c"]?x\DAK,M\C9\CC\8F\CF/.f,\C9-0\D4\CB\C9\B1\CA\CC\CB,\81s\92\F3\F3\D22\D3\E1\DC\82\9C\C4J8\A7\B8$\BF\00\CEI\03j+\CE\80s\F3KK\0AJK\00\135!1", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_oss to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_config to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_play to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_stop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([65 x i8], [65 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @audio_oss(%union.audio_control*) #0 {
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
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 1)
  %9 = load %union.audio_control*, %union.audio_control** %3, align 8
  %10 = bitcast %union.audio_control* %9 to %struct.audio_init*
  %11 = call i32 @init(%struct.audio_init* %10)
  store i32 %11, i32* %2, align 4
  br label %34

; <label>:12:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 2)
  %14 = load %union.audio_control*, %union.audio_control** %3, align 8
  %15 = bitcast %union.audio_control* %14 to %struct.audio_config*
  %16 = call i32 @config(%struct.audio_config* %15)
  store i32 %16, i32* %2, align 4
  br label %34

; <label>:17:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 3)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 3)
  %19 = load %union.audio_control*, %union.audio_control** %3, align 8
  %20 = bitcast %union.audio_control* %19 to %struct.audio_play*
  %21 = call i32 @play(%struct.audio_play* %20)
  store i32 %21, i32* %2, align 4
  br label %34

; <label>:22:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 4)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 4)
  %24 = load %union.audio_control*, %union.audio_control** %3, align 8
  %25 = bitcast %union.audio_control* %24 to %struct.audio_stop*
  %26 = call i32 @stop(%struct.audio_stop* %25)
  store i32 %26, i32* %2, align 4
  br label %34

; <label>:27:                                     ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 5)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 5)
  %29 = load %union.audio_control*, %union.audio_control** %3, align 8
  %30 = bitcast %union.audio_control* %29 to %struct.audio_finish*
  %31 = call i32 @finish(%struct.audio_finish* %30)
  store i32 %31, i32* %2, align 4
  br label %34

; <label>:32:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 0)
  %33 = add i64 %pgocount5, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_oss, i64 0, i64 0)
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
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %1
  %9 = load %struct.audio_init*, %struct.audio_init** %3, align 8
  %10 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %9, i32 0, i32 1
  %11 = load i8*, i8** %10, align 8
  %12 = call i32 (i8*, i32, ...) @open(i8* %11, i32 1)
  store i32 %12, i32* @sfd, align 4
  br label %26

; <label>:13:                                     ; preds = %1
  %14 = load %struct.audio_init*, %struct.audio_init** %3, align 8
  %15 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %14, i32 0, i32 1
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8** %15, align 8
  %16 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i32 1)
  store i32 %16, i32* @sfd, align 4
  %17 = load i32, i32* @sfd, align 4
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %24

; <label>:19:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 3)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 3)
  %21 = load %struct.audio_init*, %struct.audio_init** %3, align 8
  %22 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %21, i32 0, i32 1
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i8** %22, align 8
  %23 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 1)
  store i32 %23, i32* @sfd, align 4
  br label %24

; <label>:24:                                     ; preds = %19, %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 1)
  br label %26

; <label>:26:                                     ; preds = %24, %8
  %27 = load i32, i32* @sfd, align 4
  %28 = icmp eq i32 %27, -1
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 2)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 2)
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %33

; <label>:31:                                     ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 0)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_init, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %33

; <label>:33:                                     ; preds = %31, %29
  %34 = load i32, i32* %2, align 4
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define internal i32 @config(%struct.audio_config*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.audio_config*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.audio_config* %0, %struct.audio_config** %3, align 8
  %6 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %7 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %6, i32 0, i32 3
  %8 = load i32, i32* %7, align 4
  %9 = and i32 %8, -8
  store i32 %9, i32* %4, align 4
  %10 = load i32, i32* %4, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %16, label %12

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 1)
  %14 = load i32, i32* %4, align 4
  %15 = icmp ugt i32 %14, 16
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %12, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 0)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 0)
  store i32 16, i32* %4, align 4
  br label %18

; <label>:18:                                     ; preds = %16, %12
  %19 = load i32, i32* @sfd, align 4
  %20 = call i32 (i32, i64, ...) @ioctl(i32 %19, i64 20481, i32 0) #4
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 2)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 2)
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %69

; <label>:24:                                     ; preds = %18
  %25 = load i32, i32* %4, align 4
  switch i32 %25, label %30 [
    i32 8, label %26
    i32 16, label %28
  ]

; <label>:26:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 4)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 4)
  store i32 8, i32* %5, align 4
  br label %30

; <label>:28:                                     ; preds = %24
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 5)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 5)
  store i32 16, i32* %5, align 4
  br label %30

; <label>:30:                                     ; preds = %28, %26, %24
  br label %31

; <label>:31:                                     ; preds = %30
  %32 = load i32, i32* @sfd, align 4
  %33 = call i32 (i32, i64, ...) @ioctl(i32 %32, i64 3221508101, i32* %5) #4
  %34 = icmp eq i32 %33, -1
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %31
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 3)
  %36 = add i64 %pgocount5, 1
  store i64 %36, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 3)
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %69

; <label>:37:                                     ; preds = %31
  %38 = load i32, i32* %5, align 4
  switch i32 %38, label %47 [
    i32 16, label %39
    i32 32, label %41
    i32 8, label %43
    i32 1, label %45
  ]

; <label>:39:                                     ; preds = %37
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 7)
  %40 = add i64 %pgocount6, 1
  store i64 %40, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 7)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s16le, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  store i32 16, i32* %4, align 4
  br label %49

; <label>:41:                                     ; preds = %37
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 8)
  %42 = add i64 %pgocount7, 1
  store i64 %42, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 8)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s16be, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  store i32 16, i32* %4, align 4
  br label %49

; <label>:43:                                     ; preds = %37
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 9)
  %44 = add i64 %pgocount8, 1
  store i64 %44, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 9)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_u8, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  store i32 8, i32* %4, align 4
  br label %49

; <label>:45:                                     ; preds = %37
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 10)
  %46 = add i64 %pgocount9, 1
  store i64 %46, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 10)
  store i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_mulaw, i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)** @audio_pcm, align 8
  store i32 8, i32* %4, align 4
  br label %49

; <label>:47:                                     ; preds = %37
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 11)
  %48 = add i64 %pgocount10, 1
  store i64 %48, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 11)
  store i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %69

; <label>:49:                                     ; preds = %45, %43, %41, %39
  %50 = load i32, i32* %4, align 4
  %51 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %52 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %51, i32 0, i32 3
  store i32 %50, i32* %52, align 4
  %53 = load i32, i32* @sfd, align 4
  %54 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %55 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %54, i32 0, i32 1
  %56 = call i32 (i32, i64, ...) @ioctl(i32 %53, i64 3221508102, i32* %55) #4
  %57 = icmp eq i32 %56, -1
  br i1 %57, label %58, label %60

; <label>:58:                                     ; preds = %49
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 6)
  %59 = add i64 %pgocount11, 1
  store i64 %59, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 6)
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.6, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %69

; <label>:60:                                     ; preds = %49
  %61 = load i32, i32* @sfd, align 4
  %62 = load %struct.audio_config*, %struct.audio_config** %3, align 8
  %63 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %62, i32 0, i32 2
  %64 = call i32 (i32, i64, ...) @ioctl(i32 %61, i64 3221508098, i32* %63) #4
  %65 = icmp eq i32 %64, -1
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %60
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 12)
  %67 = add i64 %pgocount12, 1
  store i64 %67, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_config, i64 0, i64 12)
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.7, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %69

; <label>:68:                                     ; preds = %60
  store i32 0, i32* %2, align 4
  br label %69

; <label>:69:                                     ; preds = %68, %66, %58, %47, %35, %22
  %70 = load i32, i32* %2, align 4
  ret i32 %70
}

; Function Attrs: nounwind uwtable
define internal i32 @play(%struct.audio_play*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_play, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_play, i64 0, i64 0)
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
  %29 = call i32 @output(i8* %27, i32 %28)
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define internal i32 @stop(%struct.audio_stop*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.audio_stop*, align 8
  store %struct.audio_stop* %0, %struct.audio_stop** %3, align 8
  %4 = load i32, i32* @sfd, align 4
  %5 = call i32 (i32, i64, ...) @ioctl(i32 %4, i64 20480, i32 0) #4
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop, i64 0, i64 1)
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.9, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %11

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_stop, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %11

; <label>:11:                                     ; preds = %9, %7
  %12 = load i32, i32* %2, align 4
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define internal i32 @finish(%struct.audio_finish*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.audio_finish*, align 8
  store %struct.audio_finish* %0, %struct.audio_finish** %3, align 8
  %4 = load i32, i32* @sfd, align 4
  %5 = call i32 @close(i32 %4)
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 1)
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %2, align 4
  br label %11

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %11

; <label>:11:                                     ; preds = %9, %7
  %12 = load i32, i32* %2, align 4
  ret i32 %12
}

declare i32 @open(i8*, i32, ...) #1

; Function Attrs: nounwind
declare i32 @ioctl(i32, i64, ...) #2

declare i32 @audio_pcm_s16le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #1

declare i32 @audio_pcm_s16be(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #1

declare i32 @audio_pcm_u8(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #1

declare i32 @audio_pcm_mulaw(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #1

; Function Attrs: nounwind uwtable
define internal i32 @output(i8*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  br label %7

; <label>:7:                                      ; preds = %27, %23, %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %36

; <label>:10:                                     ; preds = %7
  %11 = load i32, i32* @sfd, align 4
  %12 = load i8*, i8** %4, align 8
  %13 = load i32, i32* %5, align 4
  %14 = zext i32 %13 to i64
  %15 = call i64 @write(i32 %11, i8* %12, i64 %14)
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %6, align 4
  %17 = load i32, i32* %6, align 4
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %27

; <label>:19:                                     ; preds = %10
  %20 = call i32* @__errno_location() #5
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 4
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i64 0, i64 1)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i64 0, i64 1)
  br label %7

; <label>:25:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i64 0, i64 3)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i64 0, i64 3)
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8** @audio_error, align 8
  store i32 -1, i32* %3, align 4
  br label %38

; <label>:27:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i64 0, i64 0)
  %29 = load i32, i32* %6, align 4
  %30 = load i8*, i8** %4, align 8
  %31 = sext i32 %29 to i64
  %32 = getelementptr inbounds i8, i8* %30, i64 %31
  store i8* %32, i8** %4, align 8
  %33 = load i32, i32* %6, align 4
  %34 = load i32, i32* %5, align 4
  %35 = sub i32 %34, %33
  store i32 %35, i32* %5, align 4
  br label %7

; <label>:36:                                     ; preds = %7
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i64 0, i64 2)
  %37 = add i64 %pgocount3, 1
  store i64 %37, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_output, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %38

; <label>:38:                                     ; preds = %36, %25
  %39 = load i32, i32* %3, align 4
  ret i32 %39
}

declare i64 @write(i32, i8*, i64) #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #3

declare i32 @close(i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
