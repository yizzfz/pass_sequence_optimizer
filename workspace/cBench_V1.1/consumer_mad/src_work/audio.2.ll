; ModuleID = 'tmp1.ll'
source_filename = "audio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.map = type { i8*, i32 (%union.audio_control*)* }
%union.audio_control = type { %struct.audio_play }
%struct.audio_play = type { i32, i32, [2 x i32*], i32, %struct.audio_stats* }
%struct.audio_stats = type { i64, i32, i32 }
%struct.audio_dither = type { [3 x i32], i32 }
%struct.audio_init = type { i32, i8* }
%struct.audio_config = type { i32, i32, i32, i32 }
%struct.audio_stop = type { i32, i32 }

$__llvm_profile_raw_version = comdat any

@audio_output.prefixes = internal constant [10 x %struct.map] [%struct.map { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 (%union.audio_control*)* @audio_cdda }, %struct.map { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 (%union.audio_control*)* @audio_aiff }, %struct.map { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i32 (%union.audio_control*)* @audio_wave }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 (%union.audio_control*)* @audio_wave }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i32 (%union.audio_control*)* @audio_snd }, %struct.map { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 (%union.audio_control*)* @audio_snd }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i32 (%union.audio_control*)* @audio_raw }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 (%union.audio_control*)* @audio_raw }, %struct.map { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i32 (%union.audio_control*)* @audio_null }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 (%union.audio_control*)* @audio_null }], align 16
@.str = private unnamed_addr constant [5 x i8] c"cdda\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"aiff\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"wave\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"wav\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"snd\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"au\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"raw\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"pcm\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"null\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"nul\00", align 1
@audio_output.extensions = internal constant [12 x %struct.map] [%struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i32 (%union.audio_control*)* @audio_cdda }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i32 (%union.audio_control*)* @audio_cdda }, %struct.map { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 (%union.audio_control*)* @audio_cdda }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i32 (%union.audio_control*)* @audio_aiff }, %struct.map { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 (%union.audio_control*)* @audio_aiff }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 (%union.audio_control*)* @audio_wave }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i32 (%union.audio_control*)* @audio_snd }, %struct.map { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i32 (%union.audio_control*)* @audio_snd }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i32 (%union.audio_control*)* @audio_raw }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 (%union.audio_control*)* @audio_raw }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i32 (%union.audio_control*)* @audio_raw }, %struct.map { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i32 (%union.audio_control*)* @audio_raw }], align 16
@.str.10 = private unnamed_addr constant [4 x i8] c"cdr\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"cda\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"aif\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"out\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"bin\00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"/dev/null\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"/dev/\00", align 1
@left_dither = internal global %struct.audio_dither zeroinitializer, align 4
@right_dither = internal global %struct.audio_dither zeroinitializer, align 4
@audio_error = common global i8* null, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_audio_output = private constant [12 x i8] c"audio_output"
@__profn_audio_control_init = private constant [18 x i8] c"audio_control_init"
@__profn_audio_linear_round = private constant [18 x i8] c"audio_linear_round"
@__profn_tmp1.ll_clip = private constant [12 x i8] c"tmp1.ll:clip"
@__profn_audio_linear_dither = private constant [19 x i8] c"audio_linear_dither"
@__profn_tmp1.ll_prng = private constant [12 x i8] c"tmp1.ll:prng"
@__profn_audio_pcm_u8 = private constant [12 x i8] c"audio_pcm_u8"
@__profn_audio_pcm_s8 = private constant [12 x i8] c"audio_pcm_s8"
@__profn_audio_pcm_s16le = private constant [15 x i8] c"audio_pcm_s16le"
@__profn_audio_pcm_s16be = private constant [15 x i8] c"audio_pcm_s16be"
@__profn_audio_pcm_s24le = private constant [15 x i8] c"audio_pcm_s24le"
@__profn_audio_pcm_s24be = private constant [15 x i8] c"audio_pcm_s24be"
@__profn_audio_pcm_s32le = private constant [15 x i8] c"audio_pcm_s32le"
@__profn_audio_pcm_s32be = private constant [15 x i8] c"audio_pcm_s32be"
@__profn_audio_mulaw_round = private constant [17 x i8] c"audio_mulaw_round"
@__profn_tmp1.ll_linear2mulaw = private constant [20 x i8] c"tmp1.ll:linear2mulaw"
@__profn_audio_mulaw_dither = private constant [18 x i8] c"audio_mulaw_dither"
@__profn_tmp1.ll_mulaw2linear = private constant [20 x i8] c"tmp1.ll:mulaw2linear"
@__profn_audio_pcm_mulaw = private constant [15 x i8] c"audio_pcm_mulaw"
@__profc_audio_output = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4280542921748112837, i64 155785428994, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i32 0, i32 0), i8* bitcast (i32 (%union.audio_control*)* (i8**)* @audio_output to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_control_init = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_control_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1715346375886084840, i64 59188585735, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i32 0, i32 0), i8* bitcast (void (%union.audio_control*, i32)* @audio_control_init to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_linear_round = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_linear_round = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5650344218128586702, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_linear_round, i32 0, i32 0), i8* bitcast (i64 (i32, i32, %struct.audio_stats*)* @audio_linear_round to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_clip = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_clip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2244344486361539745, i64 91321806608, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_linear_dither = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_linear_dither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1263137373761003191, i64 116610846326, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i32 0, i32 0), i8* bitcast (i64 (i32, i32, %struct.audio_dither*, %struct.audio_stats*)* @audio_linear_dither to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_prng = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_prng = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 903224560752281514, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_prng, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_u8 = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_u8 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -608364131218047963, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_u8 to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_s8 = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_s8 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3535466731426391261, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s8 to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_s16le = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_s16le = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4446608109711851096, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s16le to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_s16be = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_s16be = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4853584666506189546, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s16be to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_s24le = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_s24le = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6602329100205221436, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s24le to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_s24be = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_s24be = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -77651887808526918, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s24be to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_s32le = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_s32le = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2544691452313183193, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s32le to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_s32be = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_s32be = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2666334697032304530, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_s32be to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_mulaw_round = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_mulaw_round = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7325264251946831609, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_mulaw_round, i32 0, i32 0), i8* bitcast (i8 (i32, %struct.audio_stats*)* @audio_mulaw_round to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_linear2mulaw = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_linear2mulaw = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4264027224500484154, i64 63643354701, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_mulaw_dither = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_mulaw_dither = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3187388684046646696, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_mulaw_dither, i32 0, i32 0), i8* bitcast (i8 (i32, %struct.audio_dither*, %struct.audio_stats*)* @audio_mulaw_dither to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mulaw2linear = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mulaw2linear = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5945497813741356157, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mulaw2linear, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_pcm_mulaw = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_pcm_mulaw = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6807032034061766137, i64 147980402162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32*, i32*, i32, %struct.audio_stats*)* @audio_pcm_mulaw to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [127 x i8] c"\B9\02|x\DA]\8FQ\0A\021\0CD\D9\0B\09[E\C4\CB\94\DA\16\0D\A4I\A8\09^_\E8\EA\B2\E9\E7\9By\84I\B2\02\1C\D9TL\974 3ig\8C@\F0\8F\10\A8\A6\1E;\1B\95E\9B\AC'\C4{F\10\DF\17\D0W\ED\BB \9D\9E?Ar\8Bv;\C0\DB\C1z\C5\EA\F9\E18\5Cpb\DF\9F\03N\BC\F7\CD0}\A6\E5\DB\DC0*\A7M\0F\8C0l\F6\E1\FC\88\BF\C0\B0t\85", section "__llvm_prf_names"
@llvm.used = appending global [20 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_output to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_control_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_linear_round to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_clip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_linear_dither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prng to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_u8 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_s8 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_s16le to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_s16be to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_s24le to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_s24be to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_s32le to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_s32be to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_mulaw_round to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_linear2mulaw to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_mulaw_dither to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mulaw2linear to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_pcm_mulaw to i8*), i8* getelementptr inbounds ([127 x i8], [127 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 (%union.audio_control*)* @audio_output(i8**) #0 {
  %2 = alloca i32 (%union.audio_control*)*, align 8
  %3 = alloca i8**, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  store i8** %0, i8*** %3, align 8
  %7 = load i8**, i8*** %3, align 8
  %8 = icmp eq i8** %7, null
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 3)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 3)
  store i32 (%union.audio_control*)* @audio_oss, i32 (%union.audio_control*)** %2, align 8
  br label %123

; <label>:11:                                     ; preds = %1
  %12 = load i8**, i8*** %3, align 8
  %13 = load i8*, i8** %12, align 8
  %14 = call i8* @strchr(i8* %13, i32 58) #5
  store i8* %14, i8** %4, align 8
  %15 = load i8*, i8** %4, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %71

; <label>:17:                                     ; preds = %11
  %18 = load i8**, i8*** %3, align 8
  %19 = load i8*, i8** %18, align 8
  store i8* %19, i8** %6, align 8
  %20 = load i8*, i8** %4, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  %22 = load i8**, i8*** %3, align 8
  store i8* %21, i8** %22, align 8
  store i32 0, i32* %5, align 4
  br label %23

; <label>:23:                                     ; preds = %63, %17
  %24 = load i32, i32* %5, align 4
  %25 = sext i32 %24 to i64
  %26 = icmp ult i64 %25, 10
  br i1 %26, label %27, label %67

; <label>:27:                                     ; preds = %23
  %28 = load i8*, i8** %6, align 8
  %29 = load i32, i32* %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [10 x %struct.map], [10 x %struct.map]* @audio_output.prefixes, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.map, %struct.map* %31, i32 0, i32 0
  %33 = load i8*, i8** %32, align 16
  %34 = load i8*, i8** %4, align 8
  %35 = load i8*, i8** %6, align 8
  %36 = ptrtoint i8* %34 to i64
  %37 = ptrtoint i8* %35 to i64
  %38 = sub i64 %36, %37
  %39 = call i32 @strncasecmp(i8* %28, i8* %33, i64 %38) #5
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %62

; <label>:41:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 1)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 1)
  %43 = load i32, i32* %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [10 x %struct.map], [10 x %struct.map]* @audio_output.prefixes, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.map, %struct.map* %45, i32 0, i32 0
  %47 = load i8*, i8** %46, align 16
  %48 = call i64 @strlen(i8* %47) #5
  %49 = load i8*, i8** %4, align 8
  %50 = load i8*, i8** %6, align 8
  %51 = ptrtoint i8* %49 to i64
  %52 = ptrtoint i8* %50 to i64
  %53 = sub i64 %51, %52
  %54 = icmp eq i64 %48, %53
  br i1 %54, label %55, label %62

; <label>:55:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 5)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 5)
  %57 = load i32, i32* %5, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [10 x %struct.map], [10 x %struct.map]* @audio_output.prefixes, i64 0, i64 %58
  %60 = getelementptr inbounds %struct.map, %struct.map* %59, i32 0, i32 1
  %61 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %60, align 8
  store i32 (%union.audio_control*)* %61, i32 (%union.audio_control*)** %2, align 8
  br label %123

; <label>:62:                                     ; preds = %41, %27
  br label %63

; <label>:63:                                     ; preds = %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 0)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 0)
  %65 = load i32, i32* %5, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %5, align 4
  br label %23

; <label>:67:                                     ; preds = %23
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 4)
  %68 = add i64 %pgocount4, 1
  store i64 %68, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 4)
  %69 = load i8*, i8** %6, align 8
  %70 = load i8**, i8*** %3, align 8
  store i8* %69, i8** %70, align 8
  store i32 (%union.audio_control*)* null, i32 (%union.audio_control*)** %2, align 8
  br label %123

; <label>:71:                                     ; preds = %11
  %72 = load i8**, i8*** %3, align 8
  %73 = load i8*, i8** %72, align 8
  %74 = call i32 @strcmp(i8* %73, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i32 0, i32 0)) #5
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 6)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 6)
  store i32 (%union.audio_control*)* @audio_null, i32 (%union.audio_control*)** %2, align 8
  br label %123

; <label>:78:                                     ; preds = %71
  %79 = load i8**, i8*** %3, align 8
  %80 = load i8*, i8** %79, align 8
  %81 = call i32 @strncmp(i8* %80, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i64 5) #5
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %85

; <label>:83:                                     ; preds = %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 8)
  %84 = add i64 %pgocount6, 1
  store i64 %84, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 8)
  store i32 (%union.audio_control*)* @audio_oss, i32 (%union.audio_control*)** %2, align 8
  br label %123

; <label>:85:                                     ; preds = %78
  %86 = load i8**, i8*** %3, align 8
  %87 = load i8*, i8** %86, align 8
  %88 = call i8* @strrchr(i8* %87, i32 46) #5
  store i8* %88, i8** %4, align 8
  %89 = load i8*, i8** %4, align 8
  %90 = icmp ne i8* %89, null
  br i1 %90, label %91, label %121

; <label>:91:                                     ; preds = %85
  %92 = load i8*, i8** %4, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %4, align 8
  store i32 0, i32* %5, align 4
  br label %94

; <label>:94:                                     ; preds = %115, %91
  %95 = load i32, i32* %5, align 4
  %96 = sext i32 %95 to i64
  %97 = icmp ult i64 %96, 12
  br i1 %97, label %98, label %119

; <label>:98:                                     ; preds = %94
  %99 = load i8*, i8** %4, align 8
  %100 = load i32, i32* %5, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [12 x %struct.map], [12 x %struct.map]* @audio_output.extensions, i64 0, i64 %101
  %103 = getelementptr inbounds %struct.map, %struct.map* %102, i32 0, i32 0
  %104 = load i8*, i8** %103, align 16
  %105 = call i32 @strcasecmp(i8* %99, i8* %104) #5
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %107, label %114

; <label>:107:                                    ; preds = %98
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 10)
  %108 = add i64 %pgocount7, 1
  store i64 %108, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 10)
  %109 = load i32, i32* %5, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [12 x %struct.map], [12 x %struct.map]* @audio_output.extensions, i64 0, i64 %110
  %112 = getelementptr inbounds %struct.map, %struct.map* %111, i32 0, i32 1
  %113 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %112, align 8
  store i32 (%union.audio_control*)* %113, i32 (%union.audio_control*)** %2, align 8
  br label %123

; <label>:114:                                    ; preds = %98
  br label %115

; <label>:115:                                    ; preds = %114
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 2)
  %116 = add i64 %pgocount8, 1
  store i64 %116, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 2)
  %117 = load i32, i32* %5, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %5, align 4
  br label %94

; <label>:119:                                    ; preds = %94
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 9)
  %120 = add i64 %pgocount9, 1
  store i64 %120, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 9)
  br label %121

; <label>:121:                                    ; preds = %119, %85
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 7)
  %122 = add i64 %pgocount10, 1
  store i64 %122, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_audio_output, i64 0, i64 7)
  store i32 (%union.audio_control*)* null, i32 (%union.audio_control*)** %2, align 8
  br label %123

; <label>:123:                                    ; preds = %121, %107, %83, %76, %67, %55, %9
  %124 = load i32 (%union.audio_control*)*, i32 (%union.audio_control*)** %2, align 8
  ret i32 (%union.audio_control*)* %124
}

declare i32 @audio_cdda(%union.audio_control*) #1

declare i32 @audio_aiff(%union.audio_control*) #1

declare i32 @audio_wave(%union.audio_control*) #1

declare i32 @audio_snd(%union.audio_control*) #1

declare i32 @audio_raw(%union.audio_control*) #1

declare i32 @audio_null(%union.audio_control*) #1

declare i32 @audio_oss(%union.audio_control*) #1

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

; Function Attrs: nounwind readonly
declare i32 @strncasecmp(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly
declare i8* @strrchr(i8*, i32) #2

; Function Attrs: nounwind readonly
declare i32 @strcasecmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define void @audio_control_init(%union.audio_control*, i32) #0 {
  %3 = alloca %union.audio_control*, align 8
  %4 = alloca i32, align 4
  store %union.audio_control* %0, %union.audio_control** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load %union.audio_control*, %union.audio_control** %3, align 8
  %7 = bitcast %union.audio_control* %6 to i32*
  store i32 %5, i32* %7, align 8
  switch i32 %5, label %50 [
    i32 0, label %8
    i32 1, label %13
    i32 2, label %24
    i32 3, label %43
    i32 4, label %48
  ]

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 1)
  %10 = load %union.audio_control*, %union.audio_control** %3, align 8
  %11 = bitcast %union.audio_control* %10 to %struct.audio_init*
  %12 = getelementptr inbounds %struct.audio_init, %struct.audio_init* %11, i32 0, i32 1
  store i8* null, i8** %12, align 8
  br label %50

; <label>:13:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 2)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 2)
  %15 = load %union.audio_control*, %union.audio_control** %3, align 8
  %16 = bitcast %union.audio_control* %15 to %struct.audio_config*
  %17 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %16, i32 0, i32 1
  store i32 0, i32* %17, align 4
  %18 = load %union.audio_control*, %union.audio_control** %3, align 8
  %19 = bitcast %union.audio_control* %18 to %struct.audio_config*
  %20 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %19, i32 0, i32 2
  store i32 0, i32* %20, align 8
  %21 = load %union.audio_control*, %union.audio_control** %3, align 8
  %22 = bitcast %union.audio_control* %21 to %struct.audio_config*
  %23 = getelementptr inbounds %struct.audio_config, %struct.audio_config* %22, i32 0, i32 3
  store i32 0, i32* %23, align 4
  br label %50

; <label>:24:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 3)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 3)
  %26 = load %union.audio_control*, %union.audio_control** %3, align 8
  %27 = bitcast %union.audio_control* %26 to %struct.audio_play*
  %28 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %27, i32 0, i32 1
  store i32 0, i32* %28, align 4
  %29 = load %union.audio_control*, %union.audio_control** %3, align 8
  %30 = bitcast %union.audio_control* %29 to %struct.audio_play*
  %31 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %30, i32 0, i32 2
  %32 = getelementptr inbounds [2 x i32*], [2 x i32*]* %31, i64 0, i64 0
  store i32* null, i32** %32, align 8
  %33 = load %union.audio_control*, %union.audio_control** %3, align 8
  %34 = bitcast %union.audio_control* %33 to %struct.audio_play*
  %35 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %34, i32 0, i32 2
  %36 = getelementptr inbounds [2 x i32*], [2 x i32*]* %35, i64 0, i64 1
  store i32* null, i32** %36, align 8
  %37 = load %union.audio_control*, %union.audio_control** %3, align 8
  %38 = bitcast %union.audio_control* %37 to %struct.audio_play*
  %39 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %38, i32 0, i32 3
  store i32 1, i32* %39, align 8
  %40 = load %union.audio_control*, %union.audio_control** %3, align 8
  %41 = bitcast %union.audio_control* %40 to %struct.audio_play*
  %42 = getelementptr inbounds %struct.audio_play, %struct.audio_play* %41, i32 0, i32 4
  store %struct.audio_stats* null, %struct.audio_stats** %42, align 8
  br label %50

; <label>:43:                                     ; preds = %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 4)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 4)
  %45 = load %union.audio_control*, %union.audio_control** %3, align 8
  %46 = bitcast %union.audio_control* %45 to %struct.audio_stop*
  %47 = getelementptr inbounds %struct.audio_stop, %struct.audio_stop* %46, i32 0, i32 1
  store i32 0, i32* %47, align 4
  br label %50

; <label>:48:                                     ; preds = %2
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 5)
  %49 = add i64 %pgocount4, 1
  store i64 %49, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 5)
  br label %50

; <label>:50:                                     ; preds = %48, %43, %24, %13, %8, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 0)
  %51 = add i64 %pgocount5, 1
  store i64 %51, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_audio_control_init, i64 0, i64 0)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define i64 @audio_linear_round(i32, i32, %struct.audio_stats*) #3 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_linear_round, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_linear_round, i64 0, i64 0)
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.audio_stats*, align 8
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store %struct.audio_stats* %2, %struct.audio_stats** %7, align 8
  %8 = load i32, i32* %5, align 4
  %9 = sub i32 28, %8
  %10 = zext i32 %9 to i64
  %11 = shl i64 1, %10
  %12 = load i32, i32* %6, align 4
  %13 = sext i32 %12 to i64
  %14 = add nsw i64 %13, %11
  %15 = trunc i64 %14 to i32
  store i32 %15, i32* %6, align 4
  %16 = load %struct.audio_stats*, %struct.audio_stats** %7, align 8
  call void @clip(i32* %6, %struct.audio_stats* %16)
  %17 = load i32, i32* %6, align 4
  %18 = load i32, i32* %5, align 4
  %19 = sub i32 29, %18
  %20 = ashr i32 %17, %19
  %21 = sext i32 %20 to i64
  ret i64 %21
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @clip(i32*, %struct.audio_stats*) #3 {
  %3 = alloca i32*, align 8
  %4 = alloca %struct.audio_stats*, align 8
  store i32* %0, i32** %3, align 8
  store %struct.audio_stats* %1, %struct.audio_stats** %4, align 8
  %5 = load i32*, i32** %3, align 8
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %8 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %7, i32 0, i32 2
  %9 = load i32, i32* %8, align 4
  %10 = icmp sge i32 %6, %9
  br i1 %10, label %11, label %43

; <label>:11:                                     ; preds = %2
  %12 = load i32*, i32** %3, align 8
  %13 = load i32, i32* %12, align 4
  %14 = icmp sgt i32 %13, 268435455
  br i1 %14, label %15, label %37

; <label>:15:                                     ; preds = %11
  %16 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %17 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %16, i32 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = add i64 %18, 1
  store i64 %19, i64* %17, align 8
  %20 = load i32*, i32** %3, align 8
  %21 = load i32, i32* %20, align 4
  %22 = sub nsw i32 %21, 268435455
  %23 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %24 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %23, i32 0, i32 1
  %25 = load i32, i32* %24, align 8
  %26 = icmp sgt i32 %22, %25
  br i1 %26, label %27, label %34

; <label>:27:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 4)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 4)
  %29 = load i32*, i32** %3, align 8
  %30 = load i32, i32* %29, align 4
  %31 = sub nsw i32 %30, 268435455
  %32 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %33 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %32, i32 0, i32 1
  store i32 %31, i32* %33, align 8
  br label %34

; <label>:34:                                     ; preds = %27, %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 2)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 2)
  %36 = load i32*, i32** %3, align 8
  store i32 268435455, i32* %36, align 4
  br label %37

; <label>:37:                                     ; preds = %34, %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 0)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 0)
  %39 = load i32*, i32** %3, align 8
  %40 = load i32, i32* %39, align 4
  %41 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %42 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %41, i32 0, i32 2
  store i32 %40, i32* %42, align 4
  br label %86

; <label>:43:                                     ; preds = %2
  %44 = load i32*, i32** %3, align 8
  %45 = load i32, i32* %44, align 4
  %46 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %47 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %46, i32 0, i32 2
  %48 = load i32, i32* %47, align 4
  %49 = sub nsw i32 0, %48
  %50 = icmp slt i32 %45, %49
  br i1 %50, label %51, label %84

; <label>:51:                                     ; preds = %43
  %52 = load i32*, i32** %3, align 8
  %53 = load i32, i32* %52, align 4
  %54 = icmp slt i32 %53, -268435456
  br i1 %54, label %55, label %77

; <label>:55:                                     ; preds = %51
  %56 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %57 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %56, i32 0, i32 0
  %58 = load i64, i64* %57, align 8
  %59 = add i64 %58, 1
  store i64 %59, i64* %57, align 8
  %60 = load i32*, i32** %3, align 8
  %61 = load i32, i32* %60, align 4
  %62 = sub nsw i32 -268435456, %61
  %63 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %64 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %63, i32 0, i32 1
  %65 = load i32, i32* %64, align 8
  %66 = icmp sgt i32 %62, %65
  br i1 %66, label %67, label %74

; <label>:67:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 6)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 6)
  %69 = load i32*, i32** %3, align 8
  %70 = load i32, i32* %69, align 4
  %71 = sub nsw i32 -268435456, %70
  %72 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %73 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %72, i32 0, i32 1
  store i32 %71, i32* %73, align 8
  br label %74

; <label>:74:                                     ; preds = %67, %55
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 5)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 5)
  %76 = load i32*, i32** %3, align 8
  store i32 -268435456, i32* %76, align 4
  br label %77

; <label>:77:                                     ; preds = %74, %51
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 3)
  %78 = add i64 %pgocount5, 1
  store i64 %78, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 3)
  %79 = load i32*, i32** %3, align 8
  %80 = load i32, i32* %79, align 4
  %81 = sub nsw i32 0, %80
  %82 = load %struct.audio_stats*, %struct.audio_stats** %4, align 8
  %83 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %82, i32 0, i32 2
  store i32 %81, i32* %83, align 4
  br label %84

; <label>:84:                                     ; preds = %77, %43
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 1)
  %85 = add i64 %pgocount6, 1
  store i64 %85, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_clip, i64 0, i64 1)
  br label %86

; <label>:86:                                     ; preds = %84, %37
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define i64 @audio_linear_dither(i32, i32, %struct.audio_dither*, %struct.audio_stats*) #3 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.audio_dither*, align 8
  %8 = alloca %struct.audio_stats*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store %struct.audio_dither* %2, %struct.audio_dither** %7, align 8
  store %struct.audio_stats* %3, %struct.audio_stats** %8, align 8
  %13 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %14 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %13, i32 0, i32 0
  %15 = getelementptr inbounds [3 x i32], [3 x i32]* %14, i64 0, i64 0
  %16 = load i32, i32* %15, align 4
  %17 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %18 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %17, i32 0, i32 0
  %19 = getelementptr inbounds [3 x i32], [3 x i32]* %18, i64 0, i64 1
  %20 = load i32, i32* %19, align 4
  %21 = sub nsw i32 %16, %20
  %22 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %23 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %22, i32 0, i32 0
  %24 = getelementptr inbounds [3 x i32], [3 x i32]* %23, i64 0, i64 2
  %25 = load i32, i32* %24, align 4
  %26 = add nsw i32 %21, %25
  %27 = load i32, i32* %6, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, i32* %6, align 4
  %29 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %30 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %29, i32 0, i32 0
  %31 = getelementptr inbounds [3 x i32], [3 x i32]* %30, i64 0, i64 1
  %32 = load i32, i32* %31, align 4
  %33 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %34 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %33, i32 0, i32 0
  %35 = getelementptr inbounds [3 x i32], [3 x i32]* %34, i64 0, i64 2
  store i32 %32, i32* %35, align 4
  %36 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %37 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %36, i32 0, i32 0
  %38 = getelementptr inbounds [3 x i32], [3 x i32]* %37, i64 0, i64 0
  %39 = load i32, i32* %38, align 4
  %40 = sdiv i32 %39, 2
  %41 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %42 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %41, i32 0, i32 0
  %43 = getelementptr inbounds [3 x i32], [3 x i32]* %42, i64 0, i64 1
  store i32 %40, i32* %43, align 4
  %44 = load i32, i32* %6, align 4
  %45 = sext i32 %44 to i64
  %46 = load i32, i32* %5, align 4
  %47 = sub i32 29, %46
  %48 = sub i32 %47, 1
  %49 = zext i32 %48 to i64
  %50 = shl i64 1, %49
  %51 = add nsw i64 %45, %50
  %52 = trunc i64 %51 to i32
  store i32 %52, i32* %10, align 4
  %53 = load i32, i32* %5, align 4
  %54 = sub i32 29, %53
  store i32 %54, i32* %9, align 4
  %55 = load i32, i32* %9, align 4
  %56 = zext i32 %55 to i64
  %57 = shl i64 1, %56
  %58 = sub nsw i64 %57, 1
  %59 = trunc i64 %58 to i32
  store i32 %59, i32* %11, align 4
  %60 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %61 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %60, i32 0, i32 1
  %62 = load i32, i32* %61, align 4
  %63 = sext i32 %62 to i64
  %64 = call i64 @prng(i64 %63)
  %65 = trunc i64 %64 to i32
  store i32 %65, i32* %12, align 4
  %66 = load i32, i32* %12, align 4
  %67 = load i32, i32* %11, align 4
  %68 = and i32 %66, %67
  %69 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %70 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %69, i32 0, i32 1
  %71 = load i32, i32* %70, align 4
  %72 = load i32, i32* %11, align 4
  %73 = and i32 %71, %72
  %74 = sub nsw i32 %68, %73
  %75 = load i32, i32* %10, align 4
  %76 = add nsw i32 %75, %74
  store i32 %76, i32* %10, align 4
  %77 = load i32, i32* %12, align 4
  %78 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %79 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %78, i32 0, i32 1
  store i32 %77, i32* %79, align 4
  %80 = load i32, i32* %10, align 4
  %81 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %82 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %81, i32 0, i32 2
  %83 = load i32, i32* %82, align 4
  %84 = icmp sge i32 %80, %83
  br i1 %84, label %85, label %117

; <label>:85:                                     ; preds = %4
  %86 = load i32, i32* %10, align 4
  %87 = icmp sgt i32 %86, 268435455
  br i1 %87, label %88, label %112

; <label>:88:                                     ; preds = %85
  %89 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %90 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %89, i32 0, i32 0
  %91 = load i64, i64* %90, align 8
  %92 = add i64 %91, 1
  store i64 %92, i64* %90, align 8
  %93 = load i32, i32* %10, align 4
  %94 = sub nsw i32 %93, 268435455
  %95 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %96 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %95, i32 0, i32 1
  %97 = load i32, i32* %96, align 8
  %98 = icmp sgt i32 %94, %97
  br i1 %98, label %99, label %105

; <label>:99:                                     ; preds = %88
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 4)
  %100 = add i64 %pgocount, 1
  store i64 %100, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 4)
  %101 = load i32, i32* %10, align 4
  %102 = sub nsw i32 %101, 268435455
  %103 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %104 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %103, i32 0, i32 1
  store i32 %102, i32* %104, align 8
  br label %105

; <label>:105:                                    ; preds = %99, %88
  store i32 268435455, i32* %10, align 4
  %106 = load i32, i32* %6, align 4
  %107 = icmp sgt i32 %106, 268435455
  br i1 %107, label %108, label %110

; <label>:108:                                    ; preds = %105
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 5)
  %109 = add i64 %pgocount1, 1
  store i64 %109, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 5)
  store i32 268435455, i32* %6, align 4
  br label %110

; <label>:110:                                    ; preds = %108, %105
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 2)
  %111 = add i64 %pgocount2, 1
  store i64 %111, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 2)
  br label %112

; <label>:112:                                    ; preds = %110, %85
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 0)
  %113 = add i64 %pgocount3, 1
  store i64 %113, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 0)
  %114 = load i32, i32* %10, align 4
  %115 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %116 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %115, i32 0, i32 2
  store i32 %114, i32* %116, align 4
  br label %159

; <label>:117:                                    ; preds = %4
  %118 = load i32, i32* %10, align 4
  %119 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %120 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %119, i32 0, i32 2
  %121 = load i32, i32* %120, align 4
  %122 = sub nsw i32 0, %121
  %123 = icmp slt i32 %118, %122
  br i1 %123, label %124, label %157

; <label>:124:                                    ; preds = %117
  %125 = load i32, i32* %10, align 4
  %126 = icmp slt i32 %125, -268435456
  br i1 %126, label %127, label %151

; <label>:127:                                    ; preds = %124
  %128 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %129 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %128, i32 0, i32 0
  %130 = load i64, i64* %129, align 8
  %131 = add i64 %130, 1
  store i64 %131, i64* %129, align 8
  %132 = load i32, i32* %10, align 4
  %133 = sub nsw i32 -268435456, %132
  %134 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %135 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %134, i32 0, i32 1
  %136 = load i32, i32* %135, align 8
  %137 = icmp sgt i32 %133, %136
  br i1 %137, label %138, label %144

; <label>:138:                                    ; preds = %127
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 7)
  %139 = add i64 %pgocount4, 1
  store i64 %139, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 7)
  %140 = load i32, i32* %10, align 4
  %141 = sub nsw i32 -268435456, %140
  %142 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %143 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %142, i32 0, i32 1
  store i32 %141, i32* %143, align 8
  br label %144

; <label>:144:                                    ; preds = %138, %127
  store i32 -268435456, i32* %10, align 4
  %145 = load i32, i32* %6, align 4
  %146 = icmp slt i32 %145, -268435456
  br i1 %146, label %147, label %149

; <label>:147:                                    ; preds = %144
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 8)
  %148 = add i64 %pgocount5, 1
  store i64 %148, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 8)
  store i32 -268435456, i32* %6, align 4
  br label %149

; <label>:149:                                    ; preds = %147, %144
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 6)
  %150 = add i64 %pgocount6, 1
  store i64 %150, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 6)
  br label %151

; <label>:151:                                    ; preds = %149, %124
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 3)
  %152 = add i64 %pgocount7, 1
  store i64 %152, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 3)
  %153 = load i32, i32* %10, align 4
  %154 = sub nsw i32 0, %153
  %155 = load %struct.audio_stats*, %struct.audio_stats** %8, align 8
  %156 = getelementptr inbounds %struct.audio_stats, %struct.audio_stats* %155, i32 0, i32 2
  store i32 %154, i32* %156, align 4
  br label %157

; <label>:157:                                    ; preds = %151, %117
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 1)
  %158 = add i64 %pgocount8, 1
  store i64 %158, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_linear_dither, i64 0, i64 1)
  br label %159

; <label>:159:                                    ; preds = %157, %112
  %160 = load i32, i32* %11, align 4
  %161 = xor i32 %160, -1
  %162 = load i32, i32* %10, align 4
  %163 = and i32 %162, %161
  store i32 %163, i32* %10, align 4
  %164 = load i32, i32* %6, align 4
  %165 = load i32, i32* %10, align 4
  %166 = sub nsw i32 %164, %165
  %167 = load %struct.audio_dither*, %struct.audio_dither** %7, align 8
  %168 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %167, i32 0, i32 0
  %169 = getelementptr inbounds [3 x i32], [3 x i32]* %168, i64 0, i64 0
  store i32 %166, i32* %169, align 4
  %170 = load i32, i32* %10, align 4
  %171 = load i32, i32* %9, align 4
  %172 = ashr i32 %170, %171
  %173 = sext i32 %172 to i64
  ret i64 %173
}

; Function Attrs: inlinehint nounwind uwtable
define internal i64 @prng(i64) #3 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_prng, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_prng, i64 0, i64 0)
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = mul i64 %4, 1664525
  %6 = add i64 %5, 1013904223
  %7 = and i64 %6, 4294967295
  ret i64 %7
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_u8(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %15 = load i32, i32* %9, align 4
  store i32 %15, i32* %14, align 4
  %16 = load i32*, i32** %11, align 8
  %17 = icmp ne i32* %16, null
  br i1 %17, label %18, label %83

; <label>:18:                                     ; preds = %6
  %19 = load i32, i32* %12, align 4
  switch i32 %19, label %78 [
    i32 0, label %20
    i32 1, label %49
  ]

; <label>:20:                                     ; preds = %18
  br label %21

; <label>:21:                                     ; preds = %25, %20
  %22 = load i32, i32* %14, align 4
  %23 = add i32 %22, -1
  store i32 %23, i32* %14, align 4
  %24 = icmp ne i32 %22, 0
  br i1 %24, label %25, label %47

; <label>:25:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 0)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 0)
  %27 = load i32*, i32** %10, align 8
  %28 = getelementptr inbounds i32, i32* %27, i32 1
  store i32* %28, i32** %10, align 8
  %29 = load i32, i32* %27, align 4
  %30 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %31 = call i64 @audio_linear_round(i32 8, i32 %29, %struct.audio_stats* %30)
  %32 = xor i64 %31, 128
  %33 = trunc i64 %32 to i8
  %34 = load i8*, i8** %8, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 0
  store i8 %33, i8* %35, align 1
  %36 = load i32*, i32** %11, align 8
  %37 = getelementptr inbounds i32, i32* %36, i32 1
  store i32* %37, i32** %11, align 8
  %38 = load i32, i32* %36, align 4
  %39 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %40 = call i64 @audio_linear_round(i32 8, i32 %38, %struct.audio_stats* %39)
  %41 = xor i64 %40, 128
  %42 = trunc i64 %41 to i8
  %43 = load i8*, i8** %8, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 1
  store i8 %42, i8* %44, align 1
  %45 = load i8*, i8** %8, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 2
  store i8* %46, i8** %8, align 8
  br label %21

; <label>:47:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 4)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 4)
  br label %80

; <label>:49:                                     ; preds = %18
  br label %50

; <label>:50:                                     ; preds = %54, %49
  %51 = load i32, i32* %14, align 4
  %52 = add i32 %51, -1
  store i32 %52, i32* %14, align 4
  %53 = icmp ne i32 %51, 0
  br i1 %53, label %54, label %76

; <label>:54:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 1)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 1)
  %56 = load i32*, i32** %10, align 8
  %57 = getelementptr inbounds i32, i32* %56, i32 1
  store i32* %57, i32** %10, align 8
  %58 = load i32, i32* %56, align 4
  %59 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %60 = call i64 @audio_linear_dither(i32 8, i32 %58, %struct.audio_dither* @left_dither, %struct.audio_stats* %59)
  %61 = xor i64 %60, 128
  %62 = trunc i64 %61 to i8
  %63 = load i8*, i8** %8, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 0
  store i8 %62, i8* %64, align 1
  %65 = load i32*, i32** %11, align 8
  %66 = getelementptr inbounds i32, i32* %65, i32 1
  store i32* %66, i32** %11, align 8
  %67 = load i32, i32* %65, align 4
  %68 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %69 = call i64 @audio_linear_dither(i32 8, i32 %67, %struct.audio_dither* @right_dither, %struct.audio_stats* %68)
  %70 = xor i64 %69, 128
  %71 = trunc i64 %70 to i8
  %72 = load i8*, i8** %8, align 8
  %73 = getelementptr inbounds i8, i8* %72, i64 1
  store i8 %71, i8* %73, align 1
  %74 = load i8*, i8** %8, align 8
  %75 = getelementptr inbounds i8, i8* %74, i64 2
  store i8* %75, i8** %8, align 8
  br label %50

; <label>:76:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 5)
  %77 = add i64 %pgocount3, 1
  store i64 %77, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 5)
  br label %80

; <label>:78:                                     ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 6)
  %79 = add i64 %pgocount4, 1
  store i64 %79, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %125

; <label>:80:                                     ; preds = %76, %47
  %81 = load i32, i32* %9, align 4
  %82 = mul i32 %81, 2
  store i32 %82, i32* %7, align 4
  br label %125

; <label>:83:                                     ; preds = %6
  %84 = load i32, i32* %12, align 4
  switch i32 %84, label %121 [
    i32 0, label %85
    i32 1, label %103
  ]

; <label>:85:                                     ; preds = %83
  br label %86

; <label>:86:                                     ; preds = %90, %85
  %87 = load i32, i32* %14, align 4
  %88 = add i32 %87, -1
  store i32 %88, i32* %14, align 4
  %89 = icmp ne i32 %87, 0
  br i1 %89, label %90, label %101

; <label>:90:                                     ; preds = %86
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 3)
  %91 = add i64 %pgocount5, 1
  store i64 %91, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 3)
  %92 = load i32*, i32** %10, align 8
  %93 = getelementptr inbounds i32, i32* %92, i32 1
  store i32* %93, i32** %10, align 8
  %94 = load i32, i32* %92, align 4
  %95 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %96 = call i64 @audio_linear_round(i32 8, i32 %94, %struct.audio_stats* %95)
  %97 = xor i64 %96, 128
  %98 = trunc i64 %97 to i8
  %99 = load i8*, i8** %8, align 8
  %100 = getelementptr inbounds i8, i8* %99, i32 1
  store i8* %100, i8** %8, align 8
  store i8 %98, i8* %99, align 1
  br label %86

; <label>:101:                                    ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 8)
  %102 = add i64 %pgocount6, 1
  store i64 %102, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 8)
  br label %123

; <label>:103:                                    ; preds = %83
  br label %104

; <label>:104:                                    ; preds = %108, %103
  %105 = load i32, i32* %14, align 4
  %106 = add i32 %105, -1
  store i32 %106, i32* %14, align 4
  %107 = icmp ne i32 %105, 0
  br i1 %107, label %108, label %119

; <label>:108:                                    ; preds = %104
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 2)
  %109 = add i64 %pgocount7, 1
  store i64 %109, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 2)
  %110 = load i32*, i32** %10, align 8
  %111 = getelementptr inbounds i32, i32* %110, i32 1
  store i32* %111, i32** %10, align 8
  %112 = load i32, i32* %110, align 4
  %113 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %114 = call i64 @audio_linear_dither(i32 8, i32 %112, %struct.audio_dither* @left_dither, %struct.audio_stats* %113)
  %115 = xor i64 %114, 128
  %116 = trunc i64 %115 to i8
  %117 = load i8*, i8** %8, align 8
  %118 = getelementptr inbounds i8, i8* %117, i32 1
  store i8* %118, i8** %8, align 8
  store i8 %116, i8* %117, align 1
  br label %104

; <label>:119:                                    ; preds = %104
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 7)
  %120 = add i64 %pgocount8, 1
  store i64 %120, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 7)
  br label %123

; <label>:121:                                    ; preds = %83
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 9)
  %122 = add i64 %pgocount9, 1
  store i64 %122, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_u8, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %125

; <label>:123:                                    ; preds = %119, %101
  %124 = load i32, i32* %9, align 4
  store i32 %124, i32* %7, align 4
  br label %125

; <label>:125:                                    ; preds = %123, %121, %80, %78
  %126 = load i32, i32* %7, align 4
  ret i32 %126
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_s8(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %15 = load i32, i32* %9, align 4
  store i32 %15, i32* %14, align 4
  %16 = load i32*, i32** %11, align 8
  %17 = icmp ne i32* %16, null
  br i1 %17, label %18, label %79

; <label>:18:                                     ; preds = %6
  %19 = load i32, i32* %12, align 4
  switch i32 %19, label %74 [
    i32 0, label %20
    i32 1, label %47
  ]

; <label>:20:                                     ; preds = %18
  br label %21

; <label>:21:                                     ; preds = %25, %20
  %22 = load i32, i32* %14, align 4
  %23 = add i32 %22, -1
  store i32 %23, i32* %14, align 4
  %24 = icmp ne i32 %22, 0
  br i1 %24, label %25, label %45

; <label>:25:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 0)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 0)
  %27 = load i32*, i32** %10, align 8
  %28 = getelementptr inbounds i32, i32* %27, i32 1
  store i32* %28, i32** %10, align 8
  %29 = load i32, i32* %27, align 4
  %30 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %31 = call i64 @audio_linear_round(i32 8, i32 %29, %struct.audio_stats* %30)
  %32 = trunc i64 %31 to i8
  %33 = load i8*, i8** %8, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 0
  store i8 %32, i8* %34, align 1
  %35 = load i32*, i32** %11, align 8
  %36 = getelementptr inbounds i32, i32* %35, i32 1
  store i32* %36, i32** %11, align 8
  %37 = load i32, i32* %35, align 4
  %38 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %39 = call i64 @audio_linear_round(i32 8, i32 %37, %struct.audio_stats* %38)
  %40 = trunc i64 %39 to i8
  %41 = load i8*, i8** %8, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 1
  store i8 %40, i8* %42, align 1
  %43 = load i8*, i8** %8, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 2
  store i8* %44, i8** %8, align 8
  br label %21

; <label>:45:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 4)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 4)
  br label %76

; <label>:47:                                     ; preds = %18
  br label %48

; <label>:48:                                     ; preds = %52, %47
  %49 = load i32, i32* %14, align 4
  %50 = add i32 %49, -1
  store i32 %50, i32* %14, align 4
  %51 = icmp ne i32 %49, 0
  br i1 %51, label %52, label %72

; <label>:52:                                     ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 1)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 1)
  %54 = load i32*, i32** %10, align 8
  %55 = getelementptr inbounds i32, i32* %54, i32 1
  store i32* %55, i32** %10, align 8
  %56 = load i32, i32* %54, align 4
  %57 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %58 = call i64 @audio_linear_dither(i32 8, i32 %56, %struct.audio_dither* @left_dither, %struct.audio_stats* %57)
  %59 = trunc i64 %58 to i8
  %60 = load i8*, i8** %8, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 0
  store i8 %59, i8* %61, align 1
  %62 = load i32*, i32** %11, align 8
  %63 = getelementptr inbounds i32, i32* %62, i32 1
  store i32* %63, i32** %11, align 8
  %64 = load i32, i32* %62, align 4
  %65 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %66 = call i64 @audio_linear_dither(i32 8, i32 %64, %struct.audio_dither* @right_dither, %struct.audio_stats* %65)
  %67 = trunc i64 %66 to i8
  %68 = load i8*, i8** %8, align 8
  %69 = getelementptr inbounds i8, i8* %68, i64 1
  store i8 %67, i8* %69, align 1
  %70 = load i8*, i8** %8, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 2
  store i8* %71, i8** %8, align 8
  br label %48

; <label>:72:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 5)
  %73 = add i64 %pgocount3, 1
  store i64 %73, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 5)
  br label %76

; <label>:74:                                     ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 6)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %119

; <label>:76:                                     ; preds = %72, %45
  %77 = load i32, i32* %9, align 4
  %78 = mul i32 %77, 2
  store i32 %78, i32* %7, align 4
  br label %119

; <label>:79:                                     ; preds = %6
  %80 = load i32, i32* %12, align 4
  switch i32 %80, label %115 [
    i32 0, label %81
    i32 1, label %98
  ]

; <label>:81:                                     ; preds = %79
  br label %82

; <label>:82:                                     ; preds = %86, %81
  %83 = load i32, i32* %14, align 4
  %84 = add i32 %83, -1
  store i32 %84, i32* %14, align 4
  %85 = icmp ne i32 %83, 0
  br i1 %85, label %86, label %96

; <label>:86:                                     ; preds = %82
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 3)
  %87 = add i64 %pgocount5, 1
  store i64 %87, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 3)
  %88 = load i32*, i32** %10, align 8
  %89 = getelementptr inbounds i32, i32* %88, i32 1
  store i32* %89, i32** %10, align 8
  %90 = load i32, i32* %88, align 4
  %91 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %92 = call i64 @audio_linear_round(i32 8, i32 %90, %struct.audio_stats* %91)
  %93 = trunc i64 %92 to i8
  %94 = load i8*, i8** %8, align 8
  %95 = getelementptr inbounds i8, i8* %94, i32 1
  store i8* %95, i8** %8, align 8
  store i8 %93, i8* %94, align 1
  br label %82

; <label>:96:                                     ; preds = %82
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 8)
  %97 = add i64 %pgocount6, 1
  store i64 %97, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 8)
  br label %117

; <label>:98:                                     ; preds = %79
  br label %99

; <label>:99:                                     ; preds = %103, %98
  %100 = load i32, i32* %14, align 4
  %101 = add i32 %100, -1
  store i32 %101, i32* %14, align 4
  %102 = icmp ne i32 %100, 0
  br i1 %102, label %103, label %113

; <label>:103:                                    ; preds = %99
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 2)
  %104 = add i64 %pgocount7, 1
  store i64 %104, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 2)
  %105 = load i32*, i32** %10, align 8
  %106 = getelementptr inbounds i32, i32* %105, i32 1
  store i32* %106, i32** %10, align 8
  %107 = load i32, i32* %105, align 4
  %108 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %109 = call i64 @audio_linear_dither(i32 8, i32 %107, %struct.audio_dither* @left_dither, %struct.audio_stats* %108)
  %110 = trunc i64 %109 to i8
  %111 = load i8*, i8** %8, align 8
  %112 = getelementptr inbounds i8, i8* %111, i32 1
  store i8* %112, i8** %8, align 8
  store i8 %110, i8* %111, align 1
  br label %99

; <label>:113:                                    ; preds = %99
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 7)
  %114 = add i64 %pgocount8, 1
  store i64 %114, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 7)
  br label %117

; <label>:115:                                    ; preds = %79
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 9)
  %116 = add i64 %pgocount9, 1
  store i64 %116, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s8, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %119

; <label>:117:                                    ; preds = %113, %96
  %118 = load i32, i32* %9, align 4
  store i32 %118, i32* %7, align 4
  br label %119

; <label>:119:                                    ; preds = %117, %115, %76, %74
  %120 = load i32, i32* %7, align 4
  ret i32 %120
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_s16le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %17 = load i32, i32* %9, align 4
  store i32 %17, i32* %14, align 4
  %18 = load i32*, i32** %11, align 8
  %19 = icmp ne i32* %18, null
  br i1 %19, label %20, label %114

; <label>:20:                                     ; preds = %6
  %21 = load i32, i32* %12, align 4
  switch i32 %21, label %108 [
    i32 0, label %22
    i32 1, label %65
  ]

; <label>:22:                                     ; preds = %20
  br label %23

; <label>:23:                                     ; preds = %27, %22
  %24 = load i32, i32* %14, align 4
  %25 = add i32 %24, -1
  store i32 %25, i32* %14, align 4
  %26 = icmp ne i32 %24, 0
  br i1 %26, label %27, label %63

; <label>:27:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 0)
  %29 = load i32*, i32** %10, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 1
  store i32* %30, i32** %10, align 8
  %31 = load i32, i32* %29, align 4
  %32 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %33 = call i64 @audio_linear_round(i32 16, i32 %31, %struct.audio_stats* %32)
  %34 = trunc i64 %33 to i32
  store i32 %34, i32* %15, align 4
  %35 = load i32*, i32** %11, align 8
  %36 = getelementptr inbounds i32, i32* %35, i32 1
  store i32* %36, i32** %11, align 8
  %37 = load i32, i32* %35, align 4
  %38 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %39 = call i64 @audio_linear_round(i32 16, i32 %37, %struct.audio_stats* %38)
  %40 = trunc i64 %39 to i32
  store i32 %40, i32* %16, align 4
  %41 = load i32, i32* %15, align 4
  %42 = ashr i32 %41, 0
  %43 = trunc i32 %42 to i8
  %44 = load i8*, i8** %8, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 0
  store i8 %43, i8* %45, align 1
  %46 = load i32, i32* %15, align 4
  %47 = ashr i32 %46, 8
  %48 = trunc i32 %47 to i8
  %49 = load i8*, i8** %8, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 1
  store i8 %48, i8* %50, align 1
  %51 = load i32, i32* %16, align 4
  %52 = ashr i32 %51, 0
  %53 = trunc i32 %52 to i8
  %54 = load i8*, i8** %8, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 2
  store i8 %53, i8* %55, align 1
  %56 = load i32, i32* %16, align 4
  %57 = ashr i32 %56, 8
  %58 = trunc i32 %57 to i8
  %59 = load i8*, i8** %8, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 3
  store i8 %58, i8* %60, align 1
  %61 = load i8*, i8** %8, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 4
  store i8* %62, i8** %8, align 8
  br label %23

; <label>:63:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 4)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 4)
  br label %110

; <label>:65:                                     ; preds = %20
  br label %66

; <label>:66:                                     ; preds = %70, %65
  %67 = load i32, i32* %14, align 4
  %68 = add i32 %67, -1
  store i32 %68, i32* %14, align 4
  %69 = icmp ne i32 %67, 0
  br i1 %69, label %70, label %106

; <label>:70:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 1)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 1)
  %72 = load i32*, i32** %10, align 8
  %73 = getelementptr inbounds i32, i32* %72, i32 1
  store i32* %73, i32** %10, align 8
  %74 = load i32, i32* %72, align 4
  %75 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %76 = call i64 @audio_linear_dither(i32 16, i32 %74, %struct.audio_dither* @left_dither, %struct.audio_stats* %75)
  %77 = trunc i64 %76 to i32
  store i32 %77, i32* %15, align 4
  %78 = load i32*, i32** %11, align 8
  %79 = getelementptr inbounds i32, i32* %78, i32 1
  store i32* %79, i32** %11, align 8
  %80 = load i32, i32* %78, align 4
  %81 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %82 = call i64 @audio_linear_dither(i32 16, i32 %80, %struct.audio_dither* @right_dither, %struct.audio_stats* %81)
  %83 = trunc i64 %82 to i32
  store i32 %83, i32* %16, align 4
  %84 = load i32, i32* %15, align 4
  %85 = ashr i32 %84, 0
  %86 = trunc i32 %85 to i8
  %87 = load i8*, i8** %8, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 0
  store i8 %86, i8* %88, align 1
  %89 = load i32, i32* %15, align 4
  %90 = ashr i32 %89, 8
  %91 = trunc i32 %90 to i8
  %92 = load i8*, i8** %8, align 8
  %93 = getelementptr inbounds i8, i8* %92, i64 1
  store i8 %91, i8* %93, align 1
  %94 = load i32, i32* %16, align 4
  %95 = ashr i32 %94, 0
  %96 = trunc i32 %95 to i8
  %97 = load i8*, i8** %8, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 2
  store i8 %96, i8* %98, align 1
  %99 = load i32, i32* %16, align 4
  %100 = ashr i32 %99, 8
  %101 = trunc i32 %100 to i8
  %102 = load i8*, i8** %8, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 3
  store i8 %101, i8* %103, align 1
  %104 = load i8*, i8** %8, align 8
  %105 = getelementptr inbounds i8, i8* %104, i64 4
  store i8* %105, i8** %8, align 8
  br label %66

; <label>:106:                                    ; preds = %66
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 5)
  %107 = add i64 %pgocount3, 1
  store i64 %107, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 5)
  br label %110

; <label>:108:                                    ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 6)
  %109 = add i64 %pgocount4, 1
  store i64 %109, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %175

; <label>:110:                                    ; preds = %106, %63
  %111 = load i32, i32* %9, align 4
  %112 = mul i32 %111, 2
  %113 = mul i32 %112, 2
  store i32 %113, i32* %7, align 4
  br label %175

; <label>:114:                                    ; preds = %6
  %115 = load i32, i32* %12, align 4
  switch i32 %115, label %170 [
    i32 0, label %116
    i32 1, label %143
  ]

; <label>:116:                                    ; preds = %114
  br label %117

; <label>:117:                                    ; preds = %121, %116
  %118 = load i32, i32* %14, align 4
  %119 = add i32 %118, -1
  store i32 %119, i32* %14, align 4
  %120 = icmp ne i32 %118, 0
  br i1 %120, label %121, label %141

; <label>:121:                                    ; preds = %117
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 3)
  %122 = add i64 %pgocount5, 1
  store i64 %122, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 3)
  %123 = load i32*, i32** %10, align 8
  %124 = getelementptr inbounds i32, i32* %123, i32 1
  store i32* %124, i32** %10, align 8
  %125 = load i32, i32* %123, align 4
  %126 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %127 = call i64 @audio_linear_round(i32 16, i32 %125, %struct.audio_stats* %126)
  %128 = trunc i64 %127 to i32
  store i32 %128, i32* %15, align 4
  %129 = load i32, i32* %15, align 4
  %130 = ashr i32 %129, 0
  %131 = trunc i32 %130 to i8
  %132 = load i8*, i8** %8, align 8
  %133 = getelementptr inbounds i8, i8* %132, i64 0
  store i8 %131, i8* %133, align 1
  %134 = load i32, i32* %15, align 4
  %135 = ashr i32 %134, 8
  %136 = trunc i32 %135 to i8
  %137 = load i8*, i8** %8, align 8
  %138 = getelementptr inbounds i8, i8* %137, i64 1
  store i8 %136, i8* %138, align 1
  %139 = load i8*, i8** %8, align 8
  %140 = getelementptr inbounds i8, i8* %139, i64 2
  store i8* %140, i8** %8, align 8
  br label %117

; <label>:141:                                    ; preds = %117
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 8)
  %142 = add i64 %pgocount6, 1
  store i64 %142, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 8)
  br label %172

; <label>:143:                                    ; preds = %114
  br label %144

; <label>:144:                                    ; preds = %148, %143
  %145 = load i32, i32* %14, align 4
  %146 = add i32 %145, -1
  store i32 %146, i32* %14, align 4
  %147 = icmp ne i32 %145, 0
  br i1 %147, label %148, label %168

; <label>:148:                                    ; preds = %144
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 2)
  %149 = add i64 %pgocount7, 1
  store i64 %149, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 2)
  %150 = load i32*, i32** %10, align 8
  %151 = getelementptr inbounds i32, i32* %150, i32 1
  store i32* %151, i32** %10, align 8
  %152 = load i32, i32* %150, align 4
  %153 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %154 = call i64 @audio_linear_dither(i32 16, i32 %152, %struct.audio_dither* @left_dither, %struct.audio_stats* %153)
  %155 = trunc i64 %154 to i32
  store i32 %155, i32* %15, align 4
  %156 = load i32, i32* %15, align 4
  %157 = ashr i32 %156, 0
  %158 = trunc i32 %157 to i8
  %159 = load i8*, i8** %8, align 8
  %160 = getelementptr inbounds i8, i8* %159, i64 0
  store i8 %158, i8* %160, align 1
  %161 = load i32, i32* %15, align 4
  %162 = ashr i32 %161, 8
  %163 = trunc i32 %162 to i8
  %164 = load i8*, i8** %8, align 8
  %165 = getelementptr inbounds i8, i8* %164, i64 1
  store i8 %163, i8* %165, align 1
  %166 = load i8*, i8** %8, align 8
  %167 = getelementptr inbounds i8, i8* %166, i64 2
  store i8* %167, i8** %8, align 8
  br label %144

; <label>:168:                                    ; preds = %144
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 7)
  %169 = add i64 %pgocount8, 1
  store i64 %169, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 7)
  br label %172

; <label>:170:                                    ; preds = %114
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 9)
  %171 = add i64 %pgocount9, 1
  store i64 %171, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16le, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %175

; <label>:172:                                    ; preds = %168, %141
  %173 = load i32, i32* %9, align 4
  %174 = mul i32 %173, 2
  store i32 %174, i32* %7, align 4
  br label %175

; <label>:175:                                    ; preds = %172, %170, %110, %108
  %176 = load i32, i32* %7, align 4
  ret i32 %176
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_s16be(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %17 = load i32, i32* %9, align 4
  store i32 %17, i32* %14, align 4
  %18 = load i32*, i32** %11, align 8
  %19 = icmp ne i32* %18, null
  br i1 %19, label %20, label %114

; <label>:20:                                     ; preds = %6
  %21 = load i32, i32* %12, align 4
  switch i32 %21, label %108 [
    i32 0, label %22
    i32 1, label %65
  ]

; <label>:22:                                     ; preds = %20
  br label %23

; <label>:23:                                     ; preds = %27, %22
  %24 = load i32, i32* %14, align 4
  %25 = add i32 %24, -1
  store i32 %25, i32* %14, align 4
  %26 = icmp ne i32 %24, 0
  br i1 %26, label %27, label %63

; <label>:27:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 0)
  %29 = load i32*, i32** %10, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 1
  store i32* %30, i32** %10, align 8
  %31 = load i32, i32* %29, align 4
  %32 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %33 = call i64 @audio_linear_round(i32 16, i32 %31, %struct.audio_stats* %32)
  %34 = trunc i64 %33 to i32
  store i32 %34, i32* %15, align 4
  %35 = load i32*, i32** %11, align 8
  %36 = getelementptr inbounds i32, i32* %35, i32 1
  store i32* %36, i32** %11, align 8
  %37 = load i32, i32* %35, align 4
  %38 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %39 = call i64 @audio_linear_round(i32 16, i32 %37, %struct.audio_stats* %38)
  %40 = trunc i64 %39 to i32
  store i32 %40, i32* %16, align 4
  %41 = load i32, i32* %15, align 4
  %42 = ashr i32 %41, 8
  %43 = trunc i32 %42 to i8
  %44 = load i8*, i8** %8, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 0
  store i8 %43, i8* %45, align 1
  %46 = load i32, i32* %15, align 4
  %47 = ashr i32 %46, 0
  %48 = trunc i32 %47 to i8
  %49 = load i8*, i8** %8, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 1
  store i8 %48, i8* %50, align 1
  %51 = load i32, i32* %16, align 4
  %52 = ashr i32 %51, 8
  %53 = trunc i32 %52 to i8
  %54 = load i8*, i8** %8, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 2
  store i8 %53, i8* %55, align 1
  %56 = load i32, i32* %16, align 4
  %57 = ashr i32 %56, 0
  %58 = trunc i32 %57 to i8
  %59 = load i8*, i8** %8, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 3
  store i8 %58, i8* %60, align 1
  %61 = load i8*, i8** %8, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 4
  store i8* %62, i8** %8, align 8
  br label %23

; <label>:63:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 4)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 4)
  br label %110

; <label>:65:                                     ; preds = %20
  br label %66

; <label>:66:                                     ; preds = %70, %65
  %67 = load i32, i32* %14, align 4
  %68 = add i32 %67, -1
  store i32 %68, i32* %14, align 4
  %69 = icmp ne i32 %67, 0
  br i1 %69, label %70, label %106

; <label>:70:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 1)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 1)
  %72 = load i32*, i32** %10, align 8
  %73 = getelementptr inbounds i32, i32* %72, i32 1
  store i32* %73, i32** %10, align 8
  %74 = load i32, i32* %72, align 4
  %75 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %76 = call i64 @audio_linear_dither(i32 16, i32 %74, %struct.audio_dither* @left_dither, %struct.audio_stats* %75)
  %77 = trunc i64 %76 to i32
  store i32 %77, i32* %15, align 4
  %78 = load i32*, i32** %11, align 8
  %79 = getelementptr inbounds i32, i32* %78, i32 1
  store i32* %79, i32** %11, align 8
  %80 = load i32, i32* %78, align 4
  %81 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %82 = call i64 @audio_linear_dither(i32 16, i32 %80, %struct.audio_dither* @right_dither, %struct.audio_stats* %81)
  %83 = trunc i64 %82 to i32
  store i32 %83, i32* %16, align 4
  %84 = load i32, i32* %15, align 4
  %85 = ashr i32 %84, 8
  %86 = trunc i32 %85 to i8
  %87 = load i8*, i8** %8, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 0
  store i8 %86, i8* %88, align 1
  %89 = load i32, i32* %15, align 4
  %90 = ashr i32 %89, 0
  %91 = trunc i32 %90 to i8
  %92 = load i8*, i8** %8, align 8
  %93 = getelementptr inbounds i8, i8* %92, i64 1
  store i8 %91, i8* %93, align 1
  %94 = load i32, i32* %16, align 4
  %95 = ashr i32 %94, 8
  %96 = trunc i32 %95 to i8
  %97 = load i8*, i8** %8, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 2
  store i8 %96, i8* %98, align 1
  %99 = load i32, i32* %16, align 4
  %100 = ashr i32 %99, 0
  %101 = trunc i32 %100 to i8
  %102 = load i8*, i8** %8, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 3
  store i8 %101, i8* %103, align 1
  %104 = load i8*, i8** %8, align 8
  %105 = getelementptr inbounds i8, i8* %104, i64 4
  store i8* %105, i8** %8, align 8
  br label %66

; <label>:106:                                    ; preds = %66
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 5)
  %107 = add i64 %pgocount3, 1
  store i64 %107, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 5)
  br label %110

; <label>:108:                                    ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 6)
  %109 = add i64 %pgocount4, 1
  store i64 %109, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %175

; <label>:110:                                    ; preds = %106, %63
  %111 = load i32, i32* %9, align 4
  %112 = mul i32 %111, 2
  %113 = mul i32 %112, 2
  store i32 %113, i32* %7, align 4
  br label %175

; <label>:114:                                    ; preds = %6
  %115 = load i32, i32* %12, align 4
  switch i32 %115, label %170 [
    i32 0, label %116
    i32 1, label %143
  ]

; <label>:116:                                    ; preds = %114
  br label %117

; <label>:117:                                    ; preds = %121, %116
  %118 = load i32, i32* %14, align 4
  %119 = add i32 %118, -1
  store i32 %119, i32* %14, align 4
  %120 = icmp ne i32 %118, 0
  br i1 %120, label %121, label %141

; <label>:121:                                    ; preds = %117
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 3)
  %122 = add i64 %pgocount5, 1
  store i64 %122, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 3)
  %123 = load i32*, i32** %10, align 8
  %124 = getelementptr inbounds i32, i32* %123, i32 1
  store i32* %124, i32** %10, align 8
  %125 = load i32, i32* %123, align 4
  %126 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %127 = call i64 @audio_linear_round(i32 16, i32 %125, %struct.audio_stats* %126)
  %128 = trunc i64 %127 to i32
  store i32 %128, i32* %15, align 4
  %129 = load i32, i32* %15, align 4
  %130 = ashr i32 %129, 8
  %131 = trunc i32 %130 to i8
  %132 = load i8*, i8** %8, align 8
  %133 = getelementptr inbounds i8, i8* %132, i64 0
  store i8 %131, i8* %133, align 1
  %134 = load i32, i32* %15, align 4
  %135 = ashr i32 %134, 0
  %136 = trunc i32 %135 to i8
  %137 = load i8*, i8** %8, align 8
  %138 = getelementptr inbounds i8, i8* %137, i64 1
  store i8 %136, i8* %138, align 1
  %139 = load i8*, i8** %8, align 8
  %140 = getelementptr inbounds i8, i8* %139, i64 2
  store i8* %140, i8** %8, align 8
  br label %117

; <label>:141:                                    ; preds = %117
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 8)
  %142 = add i64 %pgocount6, 1
  store i64 %142, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 8)
  br label %172

; <label>:143:                                    ; preds = %114
  br label %144

; <label>:144:                                    ; preds = %148, %143
  %145 = load i32, i32* %14, align 4
  %146 = add i32 %145, -1
  store i32 %146, i32* %14, align 4
  %147 = icmp ne i32 %145, 0
  br i1 %147, label %148, label %168

; <label>:148:                                    ; preds = %144
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 2)
  %149 = add i64 %pgocount7, 1
  store i64 %149, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 2)
  %150 = load i32*, i32** %10, align 8
  %151 = getelementptr inbounds i32, i32* %150, i32 1
  store i32* %151, i32** %10, align 8
  %152 = load i32, i32* %150, align 4
  %153 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %154 = call i64 @audio_linear_dither(i32 16, i32 %152, %struct.audio_dither* @left_dither, %struct.audio_stats* %153)
  %155 = trunc i64 %154 to i32
  store i32 %155, i32* %15, align 4
  %156 = load i32, i32* %15, align 4
  %157 = ashr i32 %156, 8
  %158 = trunc i32 %157 to i8
  %159 = load i8*, i8** %8, align 8
  %160 = getelementptr inbounds i8, i8* %159, i64 0
  store i8 %158, i8* %160, align 1
  %161 = load i32, i32* %15, align 4
  %162 = ashr i32 %161, 0
  %163 = trunc i32 %162 to i8
  %164 = load i8*, i8** %8, align 8
  %165 = getelementptr inbounds i8, i8* %164, i64 1
  store i8 %163, i8* %165, align 1
  %166 = load i8*, i8** %8, align 8
  %167 = getelementptr inbounds i8, i8* %166, i64 2
  store i8* %167, i8** %8, align 8
  br label %144

; <label>:168:                                    ; preds = %144
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 7)
  %169 = add i64 %pgocount8, 1
  store i64 %169, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 7)
  br label %172

; <label>:170:                                    ; preds = %114
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 9)
  %171 = add i64 %pgocount9, 1
  store i64 %171, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s16be, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %175

; <label>:172:                                    ; preds = %168, %141
  %173 = load i32, i32* %9, align 4
  %174 = mul i32 %173, 2
  store i32 %174, i32* %7, align 4
  br label %175

; <label>:175:                                    ; preds = %172, %170, %110, %108
  %176 = load i32, i32* %7, align 4
  ret i32 %176
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_s24le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %17 = load i32, i32* %9, align 4
  store i32 %17, i32* %14, align 4
  %18 = load i32*, i32** %11, align 8
  %19 = icmp ne i32* %18, null
  br i1 %19, label %20, label %130

; <label>:20:                                     ; preds = %6
  %21 = load i32, i32* %12, align 4
  switch i32 %21, label %124 [
    i32 0, label %22
    i32 1, label %73
  ]

; <label>:22:                                     ; preds = %20
  br label %23

; <label>:23:                                     ; preds = %27, %22
  %24 = load i32, i32* %14, align 4
  %25 = add i32 %24, -1
  store i32 %25, i32* %14, align 4
  %26 = icmp ne i32 %24, 0
  br i1 %26, label %27, label %71

; <label>:27:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 0)
  %29 = load i32*, i32** %10, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 1
  store i32* %30, i32** %10, align 8
  %31 = load i32, i32* %29, align 4
  %32 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %33 = call i64 @audio_linear_round(i32 24, i32 %31, %struct.audio_stats* %32)
  store i64 %33, i64* %15, align 8
  %34 = load i32*, i32** %11, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 1
  store i32* %35, i32** %11, align 8
  %36 = load i32, i32* %34, align 4
  %37 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %38 = call i64 @audio_linear_round(i32 24, i32 %36, %struct.audio_stats* %37)
  store i64 %38, i64* %16, align 8
  %39 = load i64, i64* %15, align 8
  %40 = ashr i64 %39, 0
  %41 = trunc i64 %40 to i8
  %42 = load i8*, i8** %8, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 0
  store i8 %41, i8* %43, align 1
  %44 = load i64, i64* %15, align 8
  %45 = ashr i64 %44, 8
  %46 = trunc i64 %45 to i8
  %47 = load i8*, i8** %8, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 1
  store i8 %46, i8* %48, align 1
  %49 = load i64, i64* %15, align 8
  %50 = ashr i64 %49, 16
  %51 = trunc i64 %50 to i8
  %52 = load i8*, i8** %8, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 2
  store i8 %51, i8* %53, align 1
  %54 = load i64, i64* %16, align 8
  %55 = ashr i64 %54, 0
  %56 = trunc i64 %55 to i8
  %57 = load i8*, i8** %8, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 3
  store i8 %56, i8* %58, align 1
  %59 = load i64, i64* %16, align 8
  %60 = ashr i64 %59, 8
  %61 = trunc i64 %60 to i8
  %62 = load i8*, i8** %8, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 4
  store i8 %61, i8* %63, align 1
  %64 = load i64, i64* %16, align 8
  %65 = ashr i64 %64, 16
  %66 = trunc i64 %65 to i8
  %67 = load i8*, i8** %8, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 5
  store i8 %66, i8* %68, align 1
  %69 = load i8*, i8** %8, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 6
  store i8* %70, i8** %8, align 8
  br label %23

; <label>:71:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 4)
  %72 = add i64 %pgocount1, 1
  store i64 %72, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 4)
  br label %126

; <label>:73:                                     ; preds = %20
  br label %74

; <label>:74:                                     ; preds = %78, %73
  %75 = load i32, i32* %14, align 4
  %76 = add i32 %75, -1
  store i32 %76, i32* %14, align 4
  %77 = icmp ne i32 %75, 0
  br i1 %77, label %78, label %122

; <label>:78:                                     ; preds = %74
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 1)
  %79 = add i64 %pgocount2, 1
  store i64 %79, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 1)
  %80 = load i32*, i32** %10, align 8
  %81 = getelementptr inbounds i32, i32* %80, i32 1
  store i32* %81, i32** %10, align 8
  %82 = load i32, i32* %80, align 4
  %83 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %84 = call i64 @audio_linear_dither(i32 24, i32 %82, %struct.audio_dither* @left_dither, %struct.audio_stats* %83)
  store i64 %84, i64* %15, align 8
  %85 = load i32*, i32** %11, align 8
  %86 = getelementptr inbounds i32, i32* %85, i32 1
  store i32* %86, i32** %11, align 8
  %87 = load i32, i32* %85, align 4
  %88 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %89 = call i64 @audio_linear_dither(i32 24, i32 %87, %struct.audio_dither* @right_dither, %struct.audio_stats* %88)
  store i64 %89, i64* %16, align 8
  %90 = load i64, i64* %15, align 8
  %91 = ashr i64 %90, 0
  %92 = trunc i64 %91 to i8
  %93 = load i8*, i8** %8, align 8
  %94 = getelementptr inbounds i8, i8* %93, i64 0
  store i8 %92, i8* %94, align 1
  %95 = load i64, i64* %15, align 8
  %96 = ashr i64 %95, 8
  %97 = trunc i64 %96 to i8
  %98 = load i8*, i8** %8, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 1
  store i8 %97, i8* %99, align 1
  %100 = load i64, i64* %15, align 8
  %101 = ashr i64 %100, 16
  %102 = trunc i64 %101 to i8
  %103 = load i8*, i8** %8, align 8
  %104 = getelementptr inbounds i8, i8* %103, i64 2
  store i8 %102, i8* %104, align 1
  %105 = load i64, i64* %16, align 8
  %106 = ashr i64 %105, 0
  %107 = trunc i64 %106 to i8
  %108 = load i8*, i8** %8, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 3
  store i8 %107, i8* %109, align 1
  %110 = load i64, i64* %16, align 8
  %111 = ashr i64 %110, 8
  %112 = trunc i64 %111 to i8
  %113 = load i8*, i8** %8, align 8
  %114 = getelementptr inbounds i8, i8* %113, i64 4
  store i8 %112, i8* %114, align 1
  %115 = load i64, i64* %16, align 8
  %116 = ashr i64 %115, 16
  %117 = trunc i64 %116 to i8
  %118 = load i8*, i8** %8, align 8
  %119 = getelementptr inbounds i8, i8* %118, i64 5
  store i8 %117, i8* %119, align 1
  %120 = load i8*, i8** %8, align 8
  %121 = getelementptr inbounds i8, i8* %120, i64 6
  store i8* %121, i8** %8, align 8
  br label %74

; <label>:122:                                    ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 5)
  %123 = add i64 %pgocount3, 1
  store i64 %123, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 5)
  br label %126

; <label>:124:                                    ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 6)
  %125 = add i64 %pgocount4, 1
  store i64 %125, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %199

; <label>:126:                                    ; preds = %122, %71
  %127 = load i32, i32* %9, align 4
  %128 = mul i32 %127, 3
  %129 = mul i32 %128, 2
  store i32 %129, i32* %7, align 4
  br label %199

; <label>:130:                                    ; preds = %6
  %131 = load i32, i32* %12, align 4
  switch i32 %131, label %194 [
    i32 0, label %132
    i32 1, label %163
  ]

; <label>:132:                                    ; preds = %130
  br label %133

; <label>:133:                                    ; preds = %137, %132
  %134 = load i32, i32* %14, align 4
  %135 = add i32 %134, -1
  store i32 %135, i32* %14, align 4
  %136 = icmp ne i32 %134, 0
  br i1 %136, label %137, label %161

; <label>:137:                                    ; preds = %133
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 3)
  %138 = add i64 %pgocount5, 1
  store i64 %138, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 3)
  %139 = load i32*, i32** %10, align 8
  %140 = getelementptr inbounds i32, i32* %139, i32 1
  store i32* %140, i32** %10, align 8
  %141 = load i32, i32* %139, align 4
  %142 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %143 = call i64 @audio_linear_round(i32 24, i32 %141, %struct.audio_stats* %142)
  store i64 %143, i64* %15, align 8
  %144 = load i64, i64* %15, align 8
  %145 = ashr i64 %144, 0
  %146 = trunc i64 %145 to i8
  %147 = load i8*, i8** %8, align 8
  %148 = getelementptr inbounds i8, i8* %147, i64 0
  store i8 %146, i8* %148, align 1
  %149 = load i64, i64* %15, align 8
  %150 = ashr i64 %149, 8
  %151 = trunc i64 %150 to i8
  %152 = load i8*, i8** %8, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 1
  store i8 %151, i8* %153, align 1
  %154 = load i64, i64* %15, align 8
  %155 = ashr i64 %154, 16
  %156 = trunc i64 %155 to i8
  %157 = load i8*, i8** %8, align 8
  %158 = getelementptr inbounds i8, i8* %157, i64 2
  store i8 %156, i8* %158, align 1
  %159 = load i8*, i8** %8, align 8
  %160 = getelementptr inbounds i8, i8* %159, i64 3
  store i8* %160, i8** %8, align 8
  br label %133

; <label>:161:                                    ; preds = %133
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 8)
  %162 = add i64 %pgocount6, 1
  store i64 %162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 8)
  br label %196

; <label>:163:                                    ; preds = %130
  br label %164

; <label>:164:                                    ; preds = %168, %163
  %165 = load i32, i32* %14, align 4
  %166 = add i32 %165, -1
  store i32 %166, i32* %14, align 4
  %167 = icmp ne i32 %165, 0
  br i1 %167, label %168, label %192

; <label>:168:                                    ; preds = %164
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 2)
  %169 = add i64 %pgocount7, 1
  store i64 %169, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 2)
  %170 = load i32*, i32** %10, align 8
  %171 = getelementptr inbounds i32, i32* %170, i32 1
  store i32* %171, i32** %10, align 8
  %172 = load i32, i32* %170, align 4
  %173 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %174 = call i64 @audio_linear_dither(i32 24, i32 %172, %struct.audio_dither* @left_dither, %struct.audio_stats* %173)
  store i64 %174, i64* %15, align 8
  %175 = load i64, i64* %15, align 8
  %176 = ashr i64 %175, 0
  %177 = trunc i64 %176 to i8
  %178 = load i8*, i8** %8, align 8
  %179 = getelementptr inbounds i8, i8* %178, i64 0
  store i8 %177, i8* %179, align 1
  %180 = load i64, i64* %15, align 8
  %181 = ashr i64 %180, 8
  %182 = trunc i64 %181 to i8
  %183 = load i8*, i8** %8, align 8
  %184 = getelementptr inbounds i8, i8* %183, i64 1
  store i8 %182, i8* %184, align 1
  %185 = load i64, i64* %15, align 8
  %186 = ashr i64 %185, 16
  %187 = trunc i64 %186 to i8
  %188 = load i8*, i8** %8, align 8
  %189 = getelementptr inbounds i8, i8* %188, i64 2
  store i8 %187, i8* %189, align 1
  %190 = load i8*, i8** %8, align 8
  %191 = getelementptr inbounds i8, i8* %190, i64 3
  store i8* %191, i8** %8, align 8
  br label %164

; <label>:192:                                    ; preds = %164
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 7)
  %193 = add i64 %pgocount8, 1
  store i64 %193, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 7)
  br label %196

; <label>:194:                                    ; preds = %130
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 9)
  %195 = add i64 %pgocount9, 1
  store i64 %195, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24le, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %199

; <label>:196:                                    ; preds = %192, %161
  %197 = load i32, i32* %9, align 4
  %198 = mul i32 %197, 3
  store i32 %198, i32* %7, align 4
  br label %199

; <label>:199:                                    ; preds = %196, %194, %126, %124
  %200 = load i32, i32* %7, align 4
  ret i32 %200
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_s24be(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %17 = load i32, i32* %9, align 4
  store i32 %17, i32* %14, align 4
  %18 = load i32*, i32** %11, align 8
  %19 = icmp ne i32* %18, null
  br i1 %19, label %20, label %130

; <label>:20:                                     ; preds = %6
  %21 = load i32, i32* %12, align 4
  switch i32 %21, label %124 [
    i32 0, label %22
    i32 1, label %73
  ]

; <label>:22:                                     ; preds = %20
  br label %23

; <label>:23:                                     ; preds = %27, %22
  %24 = load i32, i32* %14, align 4
  %25 = add i32 %24, -1
  store i32 %25, i32* %14, align 4
  %26 = icmp ne i32 %24, 0
  br i1 %26, label %27, label %71

; <label>:27:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 0)
  %29 = load i32*, i32** %10, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 1
  store i32* %30, i32** %10, align 8
  %31 = load i32, i32* %29, align 4
  %32 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %33 = call i64 @audio_linear_round(i32 24, i32 %31, %struct.audio_stats* %32)
  store i64 %33, i64* %15, align 8
  %34 = load i32*, i32** %11, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 1
  store i32* %35, i32** %11, align 8
  %36 = load i32, i32* %34, align 4
  %37 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %38 = call i64 @audio_linear_round(i32 24, i32 %36, %struct.audio_stats* %37)
  store i64 %38, i64* %16, align 8
  %39 = load i64, i64* %15, align 8
  %40 = ashr i64 %39, 16
  %41 = trunc i64 %40 to i8
  %42 = load i8*, i8** %8, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 0
  store i8 %41, i8* %43, align 1
  %44 = load i64, i64* %15, align 8
  %45 = ashr i64 %44, 8
  %46 = trunc i64 %45 to i8
  %47 = load i8*, i8** %8, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 1
  store i8 %46, i8* %48, align 1
  %49 = load i64, i64* %15, align 8
  %50 = ashr i64 %49, 0
  %51 = trunc i64 %50 to i8
  %52 = load i8*, i8** %8, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 2
  store i8 %51, i8* %53, align 1
  %54 = load i64, i64* %16, align 8
  %55 = ashr i64 %54, 16
  %56 = trunc i64 %55 to i8
  %57 = load i8*, i8** %8, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 3
  store i8 %56, i8* %58, align 1
  %59 = load i64, i64* %16, align 8
  %60 = ashr i64 %59, 8
  %61 = trunc i64 %60 to i8
  %62 = load i8*, i8** %8, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 4
  store i8 %61, i8* %63, align 1
  %64 = load i64, i64* %16, align 8
  %65 = ashr i64 %64, 0
  %66 = trunc i64 %65 to i8
  %67 = load i8*, i8** %8, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 5
  store i8 %66, i8* %68, align 1
  %69 = load i8*, i8** %8, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 6
  store i8* %70, i8** %8, align 8
  br label %23

; <label>:71:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 4)
  %72 = add i64 %pgocount1, 1
  store i64 %72, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 4)
  br label %126

; <label>:73:                                     ; preds = %20
  br label %74

; <label>:74:                                     ; preds = %78, %73
  %75 = load i32, i32* %14, align 4
  %76 = add i32 %75, -1
  store i32 %76, i32* %14, align 4
  %77 = icmp ne i32 %75, 0
  br i1 %77, label %78, label %122

; <label>:78:                                     ; preds = %74
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 1)
  %79 = add i64 %pgocount2, 1
  store i64 %79, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 1)
  %80 = load i32*, i32** %10, align 8
  %81 = getelementptr inbounds i32, i32* %80, i32 1
  store i32* %81, i32** %10, align 8
  %82 = load i32, i32* %80, align 4
  %83 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %84 = call i64 @audio_linear_dither(i32 24, i32 %82, %struct.audio_dither* @left_dither, %struct.audio_stats* %83)
  store i64 %84, i64* %15, align 8
  %85 = load i32*, i32** %11, align 8
  %86 = getelementptr inbounds i32, i32* %85, i32 1
  store i32* %86, i32** %11, align 8
  %87 = load i32, i32* %85, align 4
  %88 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %89 = call i64 @audio_linear_dither(i32 24, i32 %87, %struct.audio_dither* @right_dither, %struct.audio_stats* %88)
  store i64 %89, i64* %16, align 8
  %90 = load i64, i64* %15, align 8
  %91 = ashr i64 %90, 16
  %92 = trunc i64 %91 to i8
  %93 = load i8*, i8** %8, align 8
  %94 = getelementptr inbounds i8, i8* %93, i64 0
  store i8 %92, i8* %94, align 1
  %95 = load i64, i64* %15, align 8
  %96 = ashr i64 %95, 8
  %97 = trunc i64 %96 to i8
  %98 = load i8*, i8** %8, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 1
  store i8 %97, i8* %99, align 1
  %100 = load i64, i64* %15, align 8
  %101 = ashr i64 %100, 0
  %102 = trunc i64 %101 to i8
  %103 = load i8*, i8** %8, align 8
  %104 = getelementptr inbounds i8, i8* %103, i64 2
  store i8 %102, i8* %104, align 1
  %105 = load i64, i64* %16, align 8
  %106 = ashr i64 %105, 16
  %107 = trunc i64 %106 to i8
  %108 = load i8*, i8** %8, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 3
  store i8 %107, i8* %109, align 1
  %110 = load i64, i64* %16, align 8
  %111 = ashr i64 %110, 8
  %112 = trunc i64 %111 to i8
  %113 = load i8*, i8** %8, align 8
  %114 = getelementptr inbounds i8, i8* %113, i64 4
  store i8 %112, i8* %114, align 1
  %115 = load i64, i64* %16, align 8
  %116 = ashr i64 %115, 0
  %117 = trunc i64 %116 to i8
  %118 = load i8*, i8** %8, align 8
  %119 = getelementptr inbounds i8, i8* %118, i64 5
  store i8 %117, i8* %119, align 1
  %120 = load i8*, i8** %8, align 8
  %121 = getelementptr inbounds i8, i8* %120, i64 6
  store i8* %121, i8** %8, align 8
  br label %74

; <label>:122:                                    ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 5)
  %123 = add i64 %pgocount3, 1
  store i64 %123, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 5)
  br label %126

; <label>:124:                                    ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 6)
  %125 = add i64 %pgocount4, 1
  store i64 %125, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %199

; <label>:126:                                    ; preds = %122, %71
  %127 = load i32, i32* %9, align 4
  %128 = mul i32 %127, 3
  %129 = mul i32 %128, 2
  store i32 %129, i32* %7, align 4
  br label %199

; <label>:130:                                    ; preds = %6
  %131 = load i32, i32* %12, align 4
  switch i32 %131, label %194 [
    i32 0, label %132
    i32 1, label %163
  ]

; <label>:132:                                    ; preds = %130
  br label %133

; <label>:133:                                    ; preds = %137, %132
  %134 = load i32, i32* %14, align 4
  %135 = add i32 %134, -1
  store i32 %135, i32* %14, align 4
  %136 = icmp ne i32 %134, 0
  br i1 %136, label %137, label %161

; <label>:137:                                    ; preds = %133
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 3)
  %138 = add i64 %pgocount5, 1
  store i64 %138, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 3)
  %139 = load i32*, i32** %10, align 8
  %140 = getelementptr inbounds i32, i32* %139, i32 1
  store i32* %140, i32** %10, align 8
  %141 = load i32, i32* %139, align 4
  %142 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %143 = call i64 @audio_linear_round(i32 24, i32 %141, %struct.audio_stats* %142)
  store i64 %143, i64* %15, align 8
  %144 = load i64, i64* %15, align 8
  %145 = ashr i64 %144, 16
  %146 = trunc i64 %145 to i8
  %147 = load i8*, i8** %8, align 8
  %148 = getelementptr inbounds i8, i8* %147, i64 0
  store i8 %146, i8* %148, align 1
  %149 = load i64, i64* %15, align 8
  %150 = ashr i64 %149, 8
  %151 = trunc i64 %150 to i8
  %152 = load i8*, i8** %8, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 1
  store i8 %151, i8* %153, align 1
  %154 = load i64, i64* %15, align 8
  %155 = ashr i64 %154, 0
  %156 = trunc i64 %155 to i8
  %157 = load i8*, i8** %8, align 8
  %158 = getelementptr inbounds i8, i8* %157, i64 2
  store i8 %156, i8* %158, align 1
  %159 = load i8*, i8** %8, align 8
  %160 = getelementptr inbounds i8, i8* %159, i64 3
  store i8* %160, i8** %8, align 8
  br label %133

; <label>:161:                                    ; preds = %133
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 8)
  %162 = add i64 %pgocount6, 1
  store i64 %162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 8)
  br label %196

; <label>:163:                                    ; preds = %130
  br label %164

; <label>:164:                                    ; preds = %168, %163
  %165 = load i32, i32* %14, align 4
  %166 = add i32 %165, -1
  store i32 %166, i32* %14, align 4
  %167 = icmp ne i32 %165, 0
  br i1 %167, label %168, label %192

; <label>:168:                                    ; preds = %164
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 2)
  %169 = add i64 %pgocount7, 1
  store i64 %169, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 2)
  %170 = load i32*, i32** %10, align 8
  %171 = getelementptr inbounds i32, i32* %170, i32 1
  store i32* %171, i32** %10, align 8
  %172 = load i32, i32* %170, align 4
  %173 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %174 = call i64 @audio_linear_dither(i32 24, i32 %172, %struct.audio_dither* @left_dither, %struct.audio_stats* %173)
  store i64 %174, i64* %16, align 8
  %175 = load i64, i64* %16, align 8
  %176 = ashr i64 %175, 16
  %177 = trunc i64 %176 to i8
  %178 = load i8*, i8** %8, align 8
  %179 = getelementptr inbounds i8, i8* %178, i64 0
  store i8 %177, i8* %179, align 1
  %180 = load i64, i64* %16, align 8
  %181 = ashr i64 %180, 8
  %182 = trunc i64 %181 to i8
  %183 = load i8*, i8** %8, align 8
  %184 = getelementptr inbounds i8, i8* %183, i64 1
  store i8 %182, i8* %184, align 1
  %185 = load i64, i64* %16, align 8
  %186 = ashr i64 %185, 0
  %187 = trunc i64 %186 to i8
  %188 = load i8*, i8** %8, align 8
  %189 = getelementptr inbounds i8, i8* %188, i64 2
  store i8 %187, i8* %189, align 1
  %190 = load i8*, i8** %8, align 8
  %191 = getelementptr inbounds i8, i8* %190, i64 3
  store i8* %191, i8** %8, align 8
  br label %164

; <label>:192:                                    ; preds = %164
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 7)
  %193 = add i64 %pgocount8, 1
  store i64 %193, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 7)
  br label %196

; <label>:194:                                    ; preds = %130
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 9)
  %195 = add i64 %pgocount9, 1
  store i64 %195, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s24be, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %199

; <label>:196:                                    ; preds = %192, %161
  %197 = load i32, i32* %9, align 4
  %198 = mul i32 %197, 3
  store i32 %198, i32* %7, align 4
  br label %199

; <label>:199:                                    ; preds = %196, %194, %126, %124
  %200 = load i32, i32* %7, align 4
  ret i32 %200
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_s32le(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %17 = load i32, i32* %9, align 4
  store i32 %17, i32* %14, align 4
  %18 = load i32*, i32** %11, align 8
  %19 = icmp ne i32* %18, null
  br i1 %19, label %20, label %138

; <label>:20:                                     ; preds = %6
  %21 = load i32, i32* %12, align 4
  switch i32 %21, label %132 [
    i32 0, label %22
    i32 1, label %77
  ]

; <label>:22:                                     ; preds = %20
  br label %23

; <label>:23:                                     ; preds = %27, %22
  %24 = load i32, i32* %14, align 4
  %25 = add i32 %24, -1
  store i32 %25, i32* %14, align 4
  %26 = icmp ne i32 %24, 0
  br i1 %26, label %27, label %75

; <label>:27:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 0)
  %29 = load i32*, i32** %10, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 1
  store i32* %30, i32** %10, align 8
  %31 = load i32, i32* %29, align 4
  %32 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %33 = call i64 @audio_linear_round(i32 24, i32 %31, %struct.audio_stats* %32)
  store i64 %33, i64* %15, align 8
  %34 = load i32*, i32** %11, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 1
  store i32* %35, i32** %11, align 8
  %36 = load i32, i32* %34, align 4
  %37 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %38 = call i64 @audio_linear_round(i32 24, i32 %36, %struct.audio_stats* %37)
  store i64 %38, i64* %16, align 8
  %39 = load i8*, i8** %8, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 0
  store i8 0, i8* %40, align 1
  %41 = load i64, i64* %15, align 8
  %42 = ashr i64 %41, 0
  %43 = trunc i64 %42 to i8
  %44 = load i8*, i8** %8, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 1
  store i8 %43, i8* %45, align 1
  %46 = load i64, i64* %15, align 8
  %47 = ashr i64 %46, 8
  %48 = trunc i64 %47 to i8
  %49 = load i8*, i8** %8, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 2
  store i8 %48, i8* %50, align 1
  %51 = load i64, i64* %15, align 8
  %52 = ashr i64 %51, 16
  %53 = trunc i64 %52 to i8
  %54 = load i8*, i8** %8, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 3
  store i8 %53, i8* %55, align 1
  %56 = load i8*, i8** %8, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 4
  store i8 0, i8* %57, align 1
  %58 = load i64, i64* %16, align 8
  %59 = ashr i64 %58, 0
  %60 = trunc i64 %59 to i8
  %61 = load i8*, i8** %8, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 5
  store i8 %60, i8* %62, align 1
  %63 = load i64, i64* %16, align 8
  %64 = ashr i64 %63, 8
  %65 = trunc i64 %64 to i8
  %66 = load i8*, i8** %8, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 6
  store i8 %65, i8* %67, align 1
  %68 = load i64, i64* %16, align 8
  %69 = ashr i64 %68, 16
  %70 = trunc i64 %69 to i8
  %71 = load i8*, i8** %8, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 7
  store i8 %70, i8* %72, align 1
  %73 = load i8*, i8** %8, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 8
  store i8* %74, i8** %8, align 8
  br label %23

; <label>:75:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 4)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 4)
  br label %134

; <label>:77:                                     ; preds = %20
  br label %78

; <label>:78:                                     ; preds = %82, %77
  %79 = load i32, i32* %14, align 4
  %80 = add i32 %79, -1
  store i32 %80, i32* %14, align 4
  %81 = icmp ne i32 %79, 0
  br i1 %81, label %82, label %130

; <label>:82:                                     ; preds = %78
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 1)
  %83 = add i64 %pgocount2, 1
  store i64 %83, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 1)
  %84 = load i32*, i32** %10, align 8
  %85 = getelementptr inbounds i32, i32* %84, i32 1
  store i32* %85, i32** %10, align 8
  %86 = load i32, i32* %84, align 4
  %87 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %88 = call i64 @audio_linear_dither(i32 24, i32 %86, %struct.audio_dither* @left_dither, %struct.audio_stats* %87)
  store i64 %88, i64* %15, align 8
  %89 = load i32*, i32** %11, align 8
  %90 = getelementptr inbounds i32, i32* %89, i32 1
  store i32* %90, i32** %11, align 8
  %91 = load i32, i32* %89, align 4
  %92 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %93 = call i64 @audio_linear_dither(i32 24, i32 %91, %struct.audio_dither* @right_dither, %struct.audio_stats* %92)
  store i64 %93, i64* %16, align 8
  %94 = load i8*, i8** %8, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 0
  store i8 0, i8* %95, align 1
  %96 = load i64, i64* %15, align 8
  %97 = ashr i64 %96, 0
  %98 = trunc i64 %97 to i8
  %99 = load i8*, i8** %8, align 8
  %100 = getelementptr inbounds i8, i8* %99, i64 1
  store i8 %98, i8* %100, align 1
  %101 = load i64, i64* %15, align 8
  %102 = ashr i64 %101, 8
  %103 = trunc i64 %102 to i8
  %104 = load i8*, i8** %8, align 8
  %105 = getelementptr inbounds i8, i8* %104, i64 2
  store i8 %103, i8* %105, align 1
  %106 = load i64, i64* %15, align 8
  %107 = ashr i64 %106, 16
  %108 = trunc i64 %107 to i8
  %109 = load i8*, i8** %8, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 3
  store i8 %108, i8* %110, align 1
  %111 = load i8*, i8** %8, align 8
  %112 = getelementptr inbounds i8, i8* %111, i64 4
  store i8 0, i8* %112, align 1
  %113 = load i64, i64* %16, align 8
  %114 = ashr i64 %113, 0
  %115 = trunc i64 %114 to i8
  %116 = load i8*, i8** %8, align 8
  %117 = getelementptr inbounds i8, i8* %116, i64 5
  store i8 %115, i8* %117, align 1
  %118 = load i64, i64* %16, align 8
  %119 = ashr i64 %118, 8
  %120 = trunc i64 %119 to i8
  %121 = load i8*, i8** %8, align 8
  %122 = getelementptr inbounds i8, i8* %121, i64 6
  store i8 %120, i8* %122, align 1
  %123 = load i64, i64* %16, align 8
  %124 = ashr i64 %123, 16
  %125 = trunc i64 %124 to i8
  %126 = load i8*, i8** %8, align 8
  %127 = getelementptr inbounds i8, i8* %126, i64 7
  store i8 %125, i8* %127, align 1
  %128 = load i8*, i8** %8, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 8
  store i8* %129, i8** %8, align 8
  br label %78

; <label>:130:                                    ; preds = %78
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 5)
  %131 = add i64 %pgocount3, 1
  store i64 %131, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 5)
  br label %134

; <label>:132:                                    ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 6)
  %133 = add i64 %pgocount4, 1
  store i64 %133, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %211

; <label>:134:                                    ; preds = %130, %75
  %135 = load i32, i32* %9, align 4
  %136 = mul i32 %135, 4
  %137 = mul i32 %136, 2
  store i32 %137, i32* %7, align 4
  br label %211

; <label>:138:                                    ; preds = %6
  %139 = load i32, i32* %12, align 4
  switch i32 %139, label %206 [
    i32 0, label %140
    i32 1, label %173
  ]

; <label>:140:                                    ; preds = %138
  br label %141

; <label>:141:                                    ; preds = %145, %140
  %142 = load i32, i32* %14, align 4
  %143 = add i32 %142, -1
  store i32 %143, i32* %14, align 4
  %144 = icmp ne i32 %142, 0
  br i1 %144, label %145, label %171

; <label>:145:                                    ; preds = %141
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 3)
  %146 = add i64 %pgocount5, 1
  store i64 %146, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 3)
  %147 = load i32*, i32** %10, align 8
  %148 = getelementptr inbounds i32, i32* %147, i32 1
  store i32* %148, i32** %10, align 8
  %149 = load i32, i32* %147, align 4
  %150 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %151 = call i64 @audio_linear_round(i32 24, i32 %149, %struct.audio_stats* %150)
  store i64 %151, i64* %15, align 8
  %152 = load i8*, i8** %8, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 0
  store i8 0, i8* %153, align 1
  %154 = load i64, i64* %15, align 8
  %155 = ashr i64 %154, 0
  %156 = trunc i64 %155 to i8
  %157 = load i8*, i8** %8, align 8
  %158 = getelementptr inbounds i8, i8* %157, i64 1
  store i8 %156, i8* %158, align 1
  %159 = load i64, i64* %15, align 8
  %160 = ashr i64 %159, 8
  %161 = trunc i64 %160 to i8
  %162 = load i8*, i8** %8, align 8
  %163 = getelementptr inbounds i8, i8* %162, i64 2
  store i8 %161, i8* %163, align 1
  %164 = load i64, i64* %15, align 8
  %165 = ashr i64 %164, 16
  %166 = trunc i64 %165 to i8
  %167 = load i8*, i8** %8, align 8
  %168 = getelementptr inbounds i8, i8* %167, i64 3
  store i8 %166, i8* %168, align 1
  %169 = load i8*, i8** %8, align 8
  %170 = getelementptr inbounds i8, i8* %169, i64 4
  store i8* %170, i8** %8, align 8
  br label %141

; <label>:171:                                    ; preds = %141
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 8)
  %172 = add i64 %pgocount6, 1
  store i64 %172, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 8)
  br label %208

; <label>:173:                                    ; preds = %138
  br label %174

; <label>:174:                                    ; preds = %178, %173
  %175 = load i32, i32* %14, align 4
  %176 = add i32 %175, -1
  store i32 %176, i32* %14, align 4
  %177 = icmp ne i32 %175, 0
  br i1 %177, label %178, label %204

; <label>:178:                                    ; preds = %174
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 2)
  %179 = add i64 %pgocount7, 1
  store i64 %179, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 2)
  %180 = load i32*, i32** %10, align 8
  %181 = getelementptr inbounds i32, i32* %180, i32 1
  store i32* %181, i32** %10, align 8
  %182 = load i32, i32* %180, align 4
  %183 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %184 = call i64 @audio_linear_dither(i32 24, i32 %182, %struct.audio_dither* @left_dither, %struct.audio_stats* %183)
  store i64 %184, i64* %15, align 8
  %185 = load i8*, i8** %8, align 8
  %186 = getelementptr inbounds i8, i8* %185, i64 0
  store i8 0, i8* %186, align 1
  %187 = load i64, i64* %15, align 8
  %188 = ashr i64 %187, 0
  %189 = trunc i64 %188 to i8
  %190 = load i8*, i8** %8, align 8
  %191 = getelementptr inbounds i8, i8* %190, i64 1
  store i8 %189, i8* %191, align 1
  %192 = load i64, i64* %15, align 8
  %193 = ashr i64 %192, 8
  %194 = trunc i64 %193 to i8
  %195 = load i8*, i8** %8, align 8
  %196 = getelementptr inbounds i8, i8* %195, i64 2
  store i8 %194, i8* %196, align 1
  %197 = load i64, i64* %15, align 8
  %198 = ashr i64 %197, 16
  %199 = trunc i64 %198 to i8
  %200 = load i8*, i8** %8, align 8
  %201 = getelementptr inbounds i8, i8* %200, i64 3
  store i8 %199, i8* %201, align 1
  %202 = load i8*, i8** %8, align 8
  %203 = getelementptr inbounds i8, i8* %202, i64 4
  store i8* %203, i8** %8, align 8
  br label %174

; <label>:204:                                    ; preds = %174
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 7)
  %205 = add i64 %pgocount8, 1
  store i64 %205, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 7)
  br label %208

; <label>:206:                                    ; preds = %138
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 9)
  %207 = add i64 %pgocount9, 1
  store i64 %207, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32le, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %211

; <label>:208:                                    ; preds = %204, %171
  %209 = load i32, i32* %9, align 4
  %210 = mul i32 %209, 4
  store i32 %210, i32* %7, align 4
  br label %211

; <label>:211:                                    ; preds = %208, %206, %134, %132
  %212 = load i32, i32* %7, align 4
  ret i32 %212
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_s32be(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %17 = load i32, i32* %9, align 4
  store i32 %17, i32* %14, align 4
  %18 = load i32*, i32** %11, align 8
  %19 = icmp ne i32* %18, null
  br i1 %19, label %20, label %138

; <label>:20:                                     ; preds = %6
  %21 = load i32, i32* %12, align 4
  switch i32 %21, label %132 [
    i32 0, label %22
    i32 1, label %77
  ]

; <label>:22:                                     ; preds = %20
  br label %23

; <label>:23:                                     ; preds = %27, %22
  %24 = load i32, i32* %14, align 4
  %25 = add i32 %24, -1
  store i32 %25, i32* %14, align 4
  %26 = icmp ne i32 %24, 0
  br i1 %26, label %27, label %75

; <label>:27:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 0)
  %29 = load i32*, i32** %10, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 1
  store i32* %30, i32** %10, align 8
  %31 = load i32, i32* %29, align 4
  %32 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %33 = call i64 @audio_linear_round(i32 24, i32 %31, %struct.audio_stats* %32)
  store i64 %33, i64* %15, align 8
  %34 = load i32*, i32** %11, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 1
  store i32* %35, i32** %11, align 8
  %36 = load i32, i32* %34, align 4
  %37 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %38 = call i64 @audio_linear_round(i32 24, i32 %36, %struct.audio_stats* %37)
  store i64 %38, i64* %16, align 8
  %39 = load i64, i64* %15, align 8
  %40 = ashr i64 %39, 16
  %41 = trunc i64 %40 to i8
  %42 = load i8*, i8** %8, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 0
  store i8 %41, i8* %43, align 1
  %44 = load i64, i64* %15, align 8
  %45 = ashr i64 %44, 8
  %46 = trunc i64 %45 to i8
  %47 = load i8*, i8** %8, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 1
  store i8 %46, i8* %48, align 1
  %49 = load i64, i64* %15, align 8
  %50 = ashr i64 %49, 0
  %51 = trunc i64 %50 to i8
  %52 = load i8*, i8** %8, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 2
  store i8 %51, i8* %53, align 1
  %54 = load i8*, i8** %8, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 3
  store i8 0, i8* %55, align 1
  %56 = load i64, i64* %16, align 8
  %57 = ashr i64 %56, 16
  %58 = trunc i64 %57 to i8
  %59 = load i8*, i8** %8, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 4
  store i8 %58, i8* %60, align 1
  %61 = load i64, i64* %16, align 8
  %62 = ashr i64 %61, 8
  %63 = trunc i64 %62 to i8
  %64 = load i8*, i8** %8, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 5
  store i8 %63, i8* %65, align 1
  %66 = load i64, i64* %16, align 8
  %67 = ashr i64 %66, 0
  %68 = trunc i64 %67 to i8
  %69 = load i8*, i8** %8, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 6
  store i8 %68, i8* %70, align 1
  %71 = load i8*, i8** %8, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 7
  store i8 0, i8* %72, align 1
  %73 = load i8*, i8** %8, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 8
  store i8* %74, i8** %8, align 8
  br label %23

; <label>:75:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 4)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 4)
  br label %134

; <label>:77:                                     ; preds = %20
  br label %78

; <label>:78:                                     ; preds = %82, %77
  %79 = load i32, i32* %14, align 4
  %80 = add i32 %79, -1
  store i32 %80, i32* %14, align 4
  %81 = icmp ne i32 %79, 0
  br i1 %81, label %82, label %130

; <label>:82:                                     ; preds = %78
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 1)
  %83 = add i64 %pgocount2, 1
  store i64 %83, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 1)
  %84 = load i32*, i32** %10, align 8
  %85 = getelementptr inbounds i32, i32* %84, i32 1
  store i32* %85, i32** %10, align 8
  %86 = load i32, i32* %84, align 4
  %87 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %88 = call i64 @audio_linear_dither(i32 24, i32 %86, %struct.audio_dither* @left_dither, %struct.audio_stats* %87)
  store i64 %88, i64* %15, align 8
  %89 = load i32*, i32** %11, align 8
  %90 = getelementptr inbounds i32, i32* %89, i32 1
  store i32* %90, i32** %11, align 8
  %91 = load i32, i32* %89, align 4
  %92 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %93 = call i64 @audio_linear_dither(i32 24, i32 %91, %struct.audio_dither* @right_dither, %struct.audio_stats* %92)
  store i64 %93, i64* %16, align 8
  %94 = load i64, i64* %15, align 8
  %95 = ashr i64 %94, 16
  %96 = trunc i64 %95 to i8
  %97 = load i8*, i8** %8, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 0
  store i8 %96, i8* %98, align 1
  %99 = load i64, i64* %15, align 8
  %100 = ashr i64 %99, 8
  %101 = trunc i64 %100 to i8
  %102 = load i8*, i8** %8, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 1
  store i8 %101, i8* %103, align 1
  %104 = load i64, i64* %15, align 8
  %105 = ashr i64 %104, 0
  %106 = trunc i64 %105 to i8
  %107 = load i8*, i8** %8, align 8
  %108 = getelementptr inbounds i8, i8* %107, i64 2
  store i8 %106, i8* %108, align 1
  %109 = load i8*, i8** %8, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 3
  store i8 0, i8* %110, align 1
  %111 = load i64, i64* %16, align 8
  %112 = ashr i64 %111, 16
  %113 = trunc i64 %112 to i8
  %114 = load i8*, i8** %8, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 4
  store i8 %113, i8* %115, align 1
  %116 = load i64, i64* %16, align 8
  %117 = ashr i64 %116, 8
  %118 = trunc i64 %117 to i8
  %119 = load i8*, i8** %8, align 8
  %120 = getelementptr inbounds i8, i8* %119, i64 5
  store i8 %118, i8* %120, align 1
  %121 = load i64, i64* %16, align 8
  %122 = ashr i64 %121, 0
  %123 = trunc i64 %122 to i8
  %124 = load i8*, i8** %8, align 8
  %125 = getelementptr inbounds i8, i8* %124, i64 6
  store i8 %123, i8* %125, align 1
  %126 = load i8*, i8** %8, align 8
  %127 = getelementptr inbounds i8, i8* %126, i64 7
  store i8 0, i8* %127, align 1
  %128 = load i8*, i8** %8, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 8
  store i8* %129, i8** %8, align 8
  br label %78

; <label>:130:                                    ; preds = %78
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 5)
  %131 = add i64 %pgocount3, 1
  store i64 %131, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 5)
  br label %134

; <label>:132:                                    ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 6)
  %133 = add i64 %pgocount4, 1
  store i64 %133, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %211

; <label>:134:                                    ; preds = %130, %75
  %135 = load i32, i32* %9, align 4
  %136 = mul i32 %135, 4
  %137 = mul i32 %136, 2
  store i32 %137, i32* %7, align 4
  br label %211

; <label>:138:                                    ; preds = %6
  %139 = load i32, i32* %12, align 4
  switch i32 %139, label %206 [
    i32 0, label %140
    i32 1, label %173
  ]

; <label>:140:                                    ; preds = %138
  br label %141

; <label>:141:                                    ; preds = %145, %140
  %142 = load i32, i32* %14, align 4
  %143 = add i32 %142, -1
  store i32 %143, i32* %14, align 4
  %144 = icmp ne i32 %142, 0
  br i1 %144, label %145, label %171

; <label>:145:                                    ; preds = %141
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 3)
  %146 = add i64 %pgocount5, 1
  store i64 %146, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 3)
  %147 = load i32*, i32** %10, align 8
  %148 = getelementptr inbounds i32, i32* %147, i32 1
  store i32* %148, i32** %10, align 8
  %149 = load i32, i32* %147, align 4
  %150 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %151 = call i64 @audio_linear_round(i32 24, i32 %149, %struct.audio_stats* %150)
  store i64 %151, i64* %15, align 8
  %152 = load i64, i64* %15, align 8
  %153 = ashr i64 %152, 16
  %154 = trunc i64 %153 to i8
  %155 = load i8*, i8** %8, align 8
  %156 = getelementptr inbounds i8, i8* %155, i64 0
  store i8 %154, i8* %156, align 1
  %157 = load i64, i64* %15, align 8
  %158 = ashr i64 %157, 8
  %159 = trunc i64 %158 to i8
  %160 = load i8*, i8** %8, align 8
  %161 = getelementptr inbounds i8, i8* %160, i64 1
  store i8 %159, i8* %161, align 1
  %162 = load i64, i64* %15, align 8
  %163 = ashr i64 %162, 0
  %164 = trunc i64 %163 to i8
  %165 = load i8*, i8** %8, align 8
  %166 = getelementptr inbounds i8, i8* %165, i64 2
  store i8 %164, i8* %166, align 1
  %167 = load i8*, i8** %8, align 8
  %168 = getelementptr inbounds i8, i8* %167, i64 3
  store i8 0, i8* %168, align 1
  %169 = load i8*, i8** %8, align 8
  %170 = getelementptr inbounds i8, i8* %169, i64 4
  store i8* %170, i8** %8, align 8
  br label %141

; <label>:171:                                    ; preds = %141
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 8)
  %172 = add i64 %pgocount6, 1
  store i64 %172, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 8)
  br label %208

; <label>:173:                                    ; preds = %138
  br label %174

; <label>:174:                                    ; preds = %178, %173
  %175 = load i32, i32* %14, align 4
  %176 = add i32 %175, -1
  store i32 %176, i32* %14, align 4
  %177 = icmp ne i32 %175, 0
  br i1 %177, label %178, label %204

; <label>:178:                                    ; preds = %174
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 2)
  %179 = add i64 %pgocount7, 1
  store i64 %179, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 2)
  %180 = load i32*, i32** %10, align 8
  %181 = getelementptr inbounds i32, i32* %180, i32 1
  store i32* %181, i32** %10, align 8
  %182 = load i32, i32* %180, align 4
  %183 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %184 = call i64 @audio_linear_dither(i32 24, i32 %182, %struct.audio_dither* @left_dither, %struct.audio_stats* %183)
  store i64 %184, i64* %15, align 8
  %185 = load i64, i64* %15, align 8
  %186 = ashr i64 %185, 16
  %187 = trunc i64 %186 to i8
  %188 = load i8*, i8** %8, align 8
  %189 = getelementptr inbounds i8, i8* %188, i64 0
  store i8 %187, i8* %189, align 1
  %190 = load i64, i64* %15, align 8
  %191 = ashr i64 %190, 8
  %192 = trunc i64 %191 to i8
  %193 = load i8*, i8** %8, align 8
  %194 = getelementptr inbounds i8, i8* %193, i64 1
  store i8 %192, i8* %194, align 1
  %195 = load i64, i64* %15, align 8
  %196 = ashr i64 %195, 0
  %197 = trunc i64 %196 to i8
  %198 = load i8*, i8** %8, align 8
  %199 = getelementptr inbounds i8, i8* %198, i64 2
  store i8 %197, i8* %199, align 1
  %200 = load i8*, i8** %8, align 8
  %201 = getelementptr inbounds i8, i8* %200, i64 3
  store i8 0, i8* %201, align 1
  %202 = load i8*, i8** %8, align 8
  %203 = getelementptr inbounds i8, i8* %202, i64 4
  store i8* %203, i8** %8, align 8
  br label %174

; <label>:204:                                    ; preds = %174
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 7)
  %205 = add i64 %pgocount8, 1
  store i64 %205, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 7)
  br label %208

; <label>:206:                                    ; preds = %138
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 9)
  %207 = add i64 %pgocount9, 1
  store i64 %207, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_s32be, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %211

; <label>:208:                                    ; preds = %204, %171
  %209 = load i32, i32* %9, align 4
  %210 = mul i32 %209, 4
  store i32 %210, i32* %7, align 4
  br label %211

; <label>:211:                                    ; preds = %208, %206, %134, %132
  %212 = load i32, i32* %7, align 4
  ret i32 %212
}

; Function Attrs: inlinehint nounwind uwtable
define zeroext i8 @audio_mulaw_round(i32, %struct.audio_stats*) #3 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_mulaw_round, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_mulaw_round, i64 0, i64 0)
  %4 = alloca i32, align 4
  %5 = alloca %struct.audio_stats*, align 8
  store i32 %0, i32* %4, align 4
  store %struct.audio_stats* %1, %struct.audio_stats** %5, align 8
  %6 = load %struct.audio_stats*, %struct.audio_stats** %5, align 8
  call void @clip(i32* %4, %struct.audio_stats* %6)
  %7 = load i32, i32* %4, align 4
  %8 = call zeroext i8 @linear2mulaw(i32 %7)
  ret i8 %8
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @linear2mulaw(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store i32 %0, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i64 0, i64 3)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i64 0, i64 3)
  %11 = load i32, i32* %2, align 4
  %12 = sub nsw i32 1081344, %11
  store i32 %12, i32* %2, align 4
  store i32 127, i32* %3, align 4
  br label %17

; <label>:13:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i64 0, i64 1)
  %15 = load i32, i32* %2, align 4
  %16 = add nsw i32 1081344, %15
  store i32 %16, i32* %2, align 4
  store i32 255, i32* %3, align 4
  br label %17

; <label>:17:                                     ; preds = %13, %9
  store i32 127, i32* %4, align 4
  %18 = load i32, i32* %2, align 4
  %19 = icmp slt i32 %18, 268435456
  br i1 %19, label %20, label %47

; <label>:20:                                     ; preds = %17
  store i32 7, i32* %5, align 4
  store i64 134217728, i64* %6, align 8
  br label %21

; <label>:21:                                     ; preds = %31, %20
  %22 = load i32, i32* %2, align 4
  %23 = sext i32 %22 to i64
  %24 = load i64, i64* %6, align 8
  %25 = and i64 %23, %24
  %26 = icmp ne i64 %25, 0
  %27 = xor i1 %26, true
  br i1 %27, label %28, label %35

; <label>:28:                                     ; preds = %21
  %29 = load i32, i32* %5, align 4
  %30 = add i32 %29, -1
  store i32 %30, i32* %5, align 4
  br label %31

; <label>:31:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i64 0, i64 0)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i64 0, i64 0)
  %33 = load i64, i64* %6, align 8
  %34 = lshr i64 %33, 1
  store i64 %34, i64* %6, align 8
  br label %21

; <label>:35:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i64 0, i64 2)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_linear2mulaw, i64 0, i64 2)
  %37 = load i32, i32* %5, align 4
  %38 = shl i32 %37, 4
  %39 = load i32, i32* %2, align 4
  %40 = load i32, i32* %5, align 4
  %41 = sub i32 7, %40
  %42 = sub i32 27, %41
  %43 = sub i32 %42, 4
  %44 = ashr i32 %39, %43
  %45 = and i32 %44, 15
  %46 = or i32 %38, %45
  store i32 %46, i32* %4, align 4
  br label %47

; <label>:47:                                     ; preds = %35, %17
  %48 = load i32, i32* %3, align 4
  %49 = load i32, i32* %4, align 4
  %50 = xor i32 %49, %48
  store i32 %50, i32* %4, align 4
  %51 = load i32, i32* %4, align 4
  %52 = trunc i32 %51 to i8
  ret i8 %52
}

; Function Attrs: inlinehint nounwind uwtable
define zeroext i8 @audio_mulaw_dither(i32, %struct.audio_dither*, %struct.audio_stats*) #3 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_mulaw_dither, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_audio_mulaw_dither, i64 0, i64 0)
  %5 = alloca i32, align 4
  %6 = alloca %struct.audio_dither*, align 8
  %7 = alloca %struct.audio_stats*, align 8
  %8 = alloca i8, align 1
  store i32 %0, i32* %5, align 4
  store %struct.audio_dither* %1, %struct.audio_dither** %6, align 8
  store %struct.audio_stats* %2, %struct.audio_stats** %7, align 8
  %9 = load %struct.audio_dither*, %struct.audio_dither** %6, align 8
  %10 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %9, i32 0, i32 0
  %11 = getelementptr inbounds [3 x i32], [3 x i32]* %10, i64 0, i64 0
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %5, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, i32* %5, align 4
  %15 = load %struct.audio_stats*, %struct.audio_stats** %7, align 8
  call void @clip(i32* %5, %struct.audio_stats* %15)
  %16 = load i32, i32* %5, align 4
  %17 = call zeroext i8 @linear2mulaw(i32 %16)
  store i8 %17, i8* %8, align 1
  %18 = load i32, i32* %5, align 4
  %19 = load i8, i8* %8, align 1
  %20 = call i32 @mulaw2linear(i8 zeroext %19)
  %21 = sub nsw i32 %18, %20
  %22 = load %struct.audio_dither*, %struct.audio_dither** %6, align 8
  %23 = getelementptr inbounds %struct.audio_dither, %struct.audio_dither* %22, i32 0, i32 0
  %24 = getelementptr inbounds [3 x i32], [3 x i32]* %23, i64 0, i64 0
  store i32 %21, i32* %24, align 4
  %25 = load i8, i8* %8, align 1
  ret i8 %25
}

; Function Attrs: nounwind uwtable
define internal i32 @mulaw2linear(i8 zeroext) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8 %0, i8* %2, align 1
  %7 = load i8, i8* %2, align 1
  %8 = zext i8 %7 to i32
  %9 = xor i32 %8, -1
  %10 = trunc i32 %9 to i8
  store i8 %10, i8* %2, align 1
  %11 = load i8, i8* %2, align 1
  %12 = zext i8 %11 to i32
  %13 = ashr i32 %12, 7
  %14 = and i32 %13, 1
  store i32 %14, i32* %3, align 4
  %15 = load i8, i8* %2, align 1
  %16 = zext i8 %15 to i32
  %17 = ashr i32 %16, 4
  %18 = and i32 %17, 7
  store i32 %18, i32* %4, align 4
  %19 = load i8, i8* %2, align 1
  %20 = zext i8 %19 to i32
  %21 = ashr i32 %20, 0
  %22 = and i32 %21, 15
  store i32 %22, i32* %5, align 4
  %23 = load i32, i32* %5, align 4
  %24 = shl i32 %23, 1
  %25 = or i32 33, %24
  %26 = load i32, i32* %4, align 4
  %27 = shl i32 %25, %26
  %28 = sub nsw i32 %27, 33
  store i32 %28, i32* %6, align 4
  %29 = load i32, i32* %3, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %35

; <label>:31:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mulaw2linear, i64 0, i64 1)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mulaw2linear, i64 0, i64 1)
  %33 = load i32, i32* %6, align 4
  %34 = sub nsw i32 0, %33
  store i32 %34, i32* %6, align 4
  br label %35

; <label>:35:                                     ; preds = %31, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mulaw2linear, i64 0, i64 0)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mulaw2linear, i64 0, i64 0)
  %37 = load i32, i32* %6, align 4
  %38 = shl i32 %37, 15
  ret i32 %38
}

; Function Attrs: nounwind uwtable
define i32 @audio_pcm_mulaw(i8*, i32, i32*, i32*, i32, %struct.audio_stats*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.audio_stats*, align 8
  %14 = alloca i32, align 4
  store i8* %0, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %2, i32** %10, align 8
  store i32* %3, i32** %11, align 8
  store i32 %4, i32* %12, align 4
  store %struct.audio_stats* %5, %struct.audio_stats** %13, align 8
  %15 = load i32, i32* %9, align 4
  store i32 %15, i32* %14, align 4
  %16 = load i32*, i32** %11, align 8
  %17 = icmp ne i32* %16, null
  br i1 %17, label %18, label %75

; <label>:18:                                     ; preds = %6
  %19 = load i32, i32* %12, align 4
  switch i32 %19, label %70 [
    i32 0, label %20
    i32 1, label %45
  ]

; <label>:20:                                     ; preds = %18
  br label %21

; <label>:21:                                     ; preds = %25, %20
  %22 = load i32, i32* %14, align 4
  %23 = add i32 %22, -1
  store i32 %23, i32* %14, align 4
  %24 = icmp ne i32 %22, 0
  br i1 %24, label %25, label %43

; <label>:25:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 0)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 0)
  %27 = load i32*, i32** %10, align 8
  %28 = getelementptr inbounds i32, i32* %27, i32 1
  store i32* %28, i32** %10, align 8
  %29 = load i32, i32* %27, align 4
  %30 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %31 = call zeroext i8 @audio_mulaw_round(i32 %29, %struct.audio_stats* %30)
  %32 = load i8*, i8** %8, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 0
  store i8 %31, i8* %33, align 1
  %34 = load i32*, i32** %11, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 1
  store i32* %35, i32** %11, align 8
  %36 = load i32, i32* %34, align 4
  %37 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %38 = call zeroext i8 @audio_mulaw_round(i32 %36, %struct.audio_stats* %37)
  %39 = load i8*, i8** %8, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 1
  store i8 %38, i8* %40, align 1
  %41 = load i8*, i8** %8, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 2
  store i8* %42, i8** %8, align 8
  br label %21

; <label>:43:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 4)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 4)
  br label %72

; <label>:45:                                     ; preds = %18
  br label %46

; <label>:46:                                     ; preds = %50, %45
  %47 = load i32, i32* %14, align 4
  %48 = add i32 %47, -1
  store i32 %48, i32* %14, align 4
  %49 = icmp ne i32 %47, 0
  br i1 %49, label %50, label %68

; <label>:50:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 1)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 1)
  %52 = load i32*, i32** %10, align 8
  %53 = getelementptr inbounds i32, i32* %52, i32 1
  store i32* %53, i32** %10, align 8
  %54 = load i32, i32* %52, align 4
  %55 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %56 = call zeroext i8 @audio_mulaw_dither(i32 %54, %struct.audio_dither* @left_dither, %struct.audio_stats* %55)
  %57 = load i8*, i8** %8, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 0
  store i8 %56, i8* %58, align 1
  %59 = load i32*, i32** %11, align 8
  %60 = getelementptr inbounds i32, i32* %59, i32 1
  store i32* %60, i32** %11, align 8
  %61 = load i32, i32* %59, align 4
  %62 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %63 = call zeroext i8 @audio_mulaw_dither(i32 %61, %struct.audio_dither* @right_dither, %struct.audio_stats* %62)
  %64 = load i8*, i8** %8, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 1
  store i8 %63, i8* %65, align 1
  %66 = load i8*, i8** %8, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 2
  store i8* %67, i8** %8, align 8
  br label %46

; <label>:68:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 5)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 5)
  br label %72

; <label>:70:                                     ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 6)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 6)
  store i32 0, i32* %7, align 4
  br label %113

; <label>:72:                                     ; preds = %68, %43
  %73 = load i32, i32* %9, align 4
  %74 = mul i32 %73, 2
  store i32 %74, i32* %7, align 4
  br label %113

; <label>:75:                                     ; preds = %6
  %76 = load i32, i32* %12, align 4
  switch i32 %76, label %109 [
    i32 0, label %77
    i32 1, label %93
  ]

; <label>:77:                                     ; preds = %75
  br label %78

; <label>:78:                                     ; preds = %82, %77
  %79 = load i32, i32* %14, align 4
  %80 = add i32 %79, -1
  store i32 %80, i32* %14, align 4
  %81 = icmp ne i32 %79, 0
  br i1 %81, label %82, label %91

; <label>:82:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 3)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 3)
  %84 = load i32*, i32** %10, align 8
  %85 = getelementptr inbounds i32, i32* %84, i32 1
  store i32* %85, i32** %10, align 8
  %86 = load i32, i32* %84, align 4
  %87 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %88 = call zeroext i8 @audio_mulaw_round(i32 %86, %struct.audio_stats* %87)
  %89 = load i8*, i8** %8, align 8
  %90 = getelementptr inbounds i8, i8* %89, i32 1
  store i8* %90, i8** %8, align 8
  store i8 %88, i8* %89, align 1
  br label %78

; <label>:91:                                     ; preds = %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 8)
  %92 = add i64 %pgocount6, 1
  store i64 %92, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 8)
  br label %111

; <label>:93:                                     ; preds = %75
  br label %94

; <label>:94:                                     ; preds = %98, %93
  %95 = load i32, i32* %14, align 4
  %96 = add i32 %95, -1
  store i32 %96, i32* %14, align 4
  %97 = icmp ne i32 %95, 0
  br i1 %97, label %98, label %107

; <label>:98:                                     ; preds = %94
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 2)
  %99 = add i64 %pgocount7, 1
  store i64 %99, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 2)
  %100 = load i32*, i32** %10, align 8
  %101 = getelementptr inbounds i32, i32* %100, i32 1
  store i32* %101, i32** %10, align 8
  %102 = load i32, i32* %100, align 4
  %103 = load %struct.audio_stats*, %struct.audio_stats** %13, align 8
  %104 = call zeroext i8 @audio_mulaw_dither(i32 %102, %struct.audio_dither* @left_dither, %struct.audio_stats* %103)
  %105 = load i8*, i8** %8, align 8
  %106 = getelementptr inbounds i8, i8* %105, i32 1
  store i8* %106, i8** %8, align 8
  store i8 %104, i8* %105, align 1
  br label %94

; <label>:107:                                    ; preds = %94
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 7)
  %108 = add i64 %pgocount8, 1
  store i64 %108, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 7)
  br label %111

; <label>:109:                                    ; preds = %75
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 9)
  %110 = add i64 %pgocount9, 1
  store i64 %110, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_audio_pcm_mulaw, i64 0, i64 9)
  store i32 0, i32* %7, align 4
  br label %113

; <label>:111:                                    ; preds = %107, %91
  %112 = load i32, i32* %9, align 4
  store i32 %112, i32* %7, align 4
  br label %113

; <label>:113:                                    ; preds = %111, %109, %72, %70
  %114 = load i32, i32* %7, align 4
  ret i32 %114
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
