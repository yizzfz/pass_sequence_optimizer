; ModuleID = 'tmp1.ll'
source_filename = "synth.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mad_synth = type { [2 x [2 x [2 x [16 x [8 x i32]]]]], i32, %struct.mad_pcm }
%struct.mad_pcm = type { i32, i16, i16, [2 x [1152 x i32]] }
%struct.mad_frame = type { %struct.mad_header, i32, [2 x [36 x [32 x i32]]], [2 x [32 x [18 x i32]]]* }
%struct.mad_header = type { i32, i32, i32, i32, i64, i32, i16, i16, i32, i32, %struct.mad_timer_t }
%struct.mad_timer_t = type { i64, i64 }

$__llvm_profile_raw_version = comdat any

@D = internal constant [17 x [32 x i32]] [[32 x i32] [i32 0, i32 -7, i32 53, i32 -115, i32 509, i32 -1288, i32 1644, i32 -9372, i32 18760, i32 9372, i32 1644, i32 1288, i32 509, i32 115, i32 53, i32 7, i32 0, i32 -7, i32 53, i32 -115, i32 509, i32 -1288, i32 1644, i32 -9372, i32 18760, i32 9372, i32 1644, i32 1288, i32 509, i32 115, i32 53, i32 7], [32 x i32] [i32 0, i32 -8, i32 55, i32 -130, i32 500, i32 -1379, i32 1490, i32 -9834, i32 18748, i32 8910, i32 1784, i32 1197, i32 516, i32 100, i32 52, i32 7, i32 0, i32 -8, i32 55, i32 -130, i32 500, i32 -1379, i32 1490, i32 -9834, i32 18748, i32 8910, i32 1784, i32 1197, i32 516, i32 100, i32 52, i32 7], [32 x i32] [i32 0, i32 -9, i32 56, i32 -145, i32 488, i32 -1470, i32 1322, i32 -10294, i32 18714, i32 8448, i32 1910, i32 1106, i32 520, i32 87, i32 51, i32 6, i32 0, i32 -9, i32 56, i32 -145, i32 488, i32 -1470, i32 1322, i32 -10294, i32 18714, i32 8448, i32 1910, i32 1106, i32 520, i32 87, i32 51, i32 6], [32 x i32] [i32 0, i32 -10, i32 56, i32 -161, i32 473, i32 -1559, i32 1140, i32 -10752, i32 18658, i32 7987, i32 2023, i32 1016, i32 522, i32 74, i32 49, i32 5, i32 0, i32 -10, i32 56, i32 -161, i32 473, i32 -1559, i32 1140, i32 -10752, i32 18658, i32 7987, i32 2023, i32 1016, i32 522, i32 74, i32 49, i32 5], [32 x i32] [i32 0, i32 -10, i32 57, i32 -178, i32 456, i32 -1647, i32 944, i32 -11205, i32 18578, i32 7528, i32 2123, i32 926, i32 521, i32 61, i32 48, i32 5, i32 0, i32 -10, i32 57, i32 -178, i32 456, i32 -1647, i32 944, i32 -11205, i32 18578, i32 7528, i32 2123, i32 926, i32 521, i32 61, i32 48, i32 5], [32 x i32] [i32 0, i32 -11, i32 57, i32 -195, i32 435, i32 -1734, i32 734, i32 -11654, i32 18477, i32 7072, i32 2210, i32 838, i32 519, i32 49, i32 46, i32 4, i32 0, i32 -11, i32 57, i32 -195, i32 435, i32 -1734, i32 734, i32 -11654, i32 18477, i32 7072, i32 2210, i32 838, i32 519, i32 49, i32 46, i32 4], [32 x i32] [i32 0, i32 -12, i32 57, i32 -212, i32 411, i32 -1818, i32 509, i32 -12098, i32 18354, i32 6621, i32 2285, i32 751, i32 514, i32 38, i32 44, i32 4, i32 0, i32 -12, i32 57, i32 -212, i32 411, i32 -1818, i32 509, i32 -12098, i32 18354, i32 6621, i32 2285, i32 751, i32 514, i32 38, i32 44, i32 4], [32 x i32] [i32 -1, i32 -13, i32 57, i32 -230, i32 384, i32 -1899, i32 271, i32 -12534, i32 18209, i32 6174, i32 2347, i32 666, i32 508, i32 28, i32 42, i32 4, i32 -1, i32 -13, i32 57, i32 -230, i32 384, i32 -1899, i32 271, i32 -12534, i32 18209, i32 6174, i32 2347, i32 666, i32 508, i32 28, i32 42, i32 4], [32 x i32] [i32 -1, i32 -15, i32 56, i32 -248, i32 354, i32 -1978, i32 18, i32 -12963, i32 18042, i32 5732, i32 2398, i32 583, i32 500, i32 18, i32 40, i32 3, i32 -1, i32 -15, i32 56, i32 -248, i32 354, i32 -1978, i32 18, i32 -12963, i32 18042, i32 5732, i32 2398, i32 583, i32 500, i32 18, i32 40, i32 3], [32 x i32] [i32 -1, i32 -16, i32 55, i32 -266, i32 320, i32 -2052, i32 -250, i32 -13384, i32 17855, i32 5297, i32 2438, i32 502, i32 491, i32 9, i32 39, i32 3, i32 -1, i32 -16, i32 55, i32 -266, i32 320, i32 -2052, i32 -250, i32 -13384, i32 17855, i32 5297, i32 2438, i32 502, i32 491, i32 9, i32 39, i32 3], [32 x i32] [i32 -1, i32 -17, i32 54, i32 -284, i32 283, i32 -2123, i32 -531, i32 -13795, i32 17648, i32 4870, i32 2466, i32 423, i32 480, i32 1, i32 37, i32 3, i32 -1, i32 -17, i32 54, i32 -284, i32 283, i32 -2123, i32 -531, i32 -13795, i32 17648, i32 4870, i32 2466, i32 423, i32 480, i32 1, i32 37, i32 3], [32 x i32] [i32 -1, i32 -18, i32 52, i32 -303, i32 243, i32 -2189, i32 -825, i32 -14195, i32 17420, i32 4450, i32 2484, i32 347, i32 468, i32 -7, i32 35, i32 2, i32 -1, i32 -18, i32 52, i32 -303, i32 243, i32 -2189, i32 -825, i32 -14195, i32 17420, i32 4450, i32 2484, i32 347, i32 468, i32 -7, i32 35, i32 2], [32 x i32] [i32 -1, i32 -20, i32 50, i32 -321, i32 199, i32 -2250, i32 -1133, i32 -14583, i32 17173, i32 4039, i32 2492, i32 274, i32 454, i32 -14, i32 33, i32 2, i32 -1, i32 -20, i32 50, i32 -321, i32 199, i32 -2250, i32 -1133, i32 -14583, i32 17173, i32 4039, i32 2492, i32 274, i32 454, i32 -14, i32 33, i32 2], [32 x i32] [i32 -1, i32 -21, i32 47, i32 -339, i32 151, i32 -2305, i32 -1455, i32 -14960, i32 16907, i32 3637, i32 2490, i32 204, i32 440, i32 -21, i32 31, i32 2, i32 -1, i32 -21, i32 47, i32 -339, i32 151, i32 -2305, i32 -1455, i32 -14960, i32 16907, i32 3637, i32 2490, i32 204, i32 440, i32 -21, i32 31, i32 2], [32 x i32] [i32 -1, i32 -23, i32 44, i32 -357, i32 101, i32 -2354, i32 -1789, i32 -15322, i32 16624, i32 3245, i32 2479, i32 136, i32 425, i32 -27, i32 29, i32 2, i32 -1, i32 -23, i32 44, i32 -357, i32 101, i32 -2354, i32 -1789, i32 -15322, i32 16624, i32 3245, i32 2479, i32 136, i32 425, i32 -27, i32 29, i32 2], [32 x i32] [i32 -1, i32 -24, i32 41, i32 -375, i32 46, i32 -2396, i32 -2135, i32 -15671, i32 16323, i32 2864, i32 2460, i32 72, i32 409, i32 -32, i32 28, i32 2, i32 -1, i32 -24, i32 41, i32 -375, i32 46, i32 -2396, i32 -2135, i32 -15671, i32 16323, i32 2864, i32 2460, i32 72, i32 409, i32 -32, i32 28, i32 2], [32 x i32] [i32 -1, i32 -26, i32 37, i32 -392, i32 -11, i32 -2432, i32 -2494, i32 -16005, i32 16005, i32 2494, i32 2432, i32 11, i32 392, i32 -37, i32 26, i32 1, i32 -1, i32 -26, i32 37, i32 -392, i32 -11, i32 -2432, i32 -2494, i32 -16005, i32 16005, i32 2494, i32 2432, i32 11, i32 392, i32 -37, i32 26, i32 1]], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_mad_synth_init = private constant [14 x i8] c"mad_synth_init"
@__profn_mad_synth_mute = private constant [14 x i8] c"mad_synth_mute"
@__profn_mad_synth_frame = private constant [15 x i8] c"mad_synth_frame"
@__profn_tmp1.ll_synth_full = private constant [18 x i8] c"tmp1.ll:synth_full"
@__profn_tmp1.ll_synth_half = private constant [18 x i8] c"tmp1.ll:synth_half"
@__profn_tmp1.ll_dct32 = private constant [13 x i8] c"tmp1.ll:dct32"
@__profc_mad_synth_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_synth_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -994113669918087047, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_synth_init, i32 0, i32 0), i8* bitcast (void (%struct.mad_synth*)* @mad_synth_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_synth_mute = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_synth_mute = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5799317980045846481, i64 74483645111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i32 0, i32 0), i8* bitcast (void (%struct.mad_synth*)* @mad_synth_mute to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_synth_frame = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_mad_synth_frame = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_mad_synth_frame = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4172331888813274644, i64 144396714642887147, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i32 0, i32 0), i8* bitcast (void (%struct.mad_synth*, %struct.mad_frame*)* @mad_synth_frame to i8*), i8* bitcast ([1 x i64]* @__profvp_mad_synth_frame to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_synth_full = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_synth_full = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4521586269464094113, i64 74483645111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i32 0, i32 0), i8* bitcast (void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)* @synth_full to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_synth_half = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_synth_half = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3658930675231773449, i64 89547517119, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i32 0, i32 0), i8* bitcast (void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)* @synth_half to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_dct32 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_dct32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4995107942224090985, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dct32, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [99 x i8] c"a\00mad_synth_init\01mad_synth_mute\01mad_synth_frame\01tmp1.ll:synth_full\01tmp1.ll:synth_half\01tmp1.ll:dct32", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_synth_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_synth_mute to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_synth_frame to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_synth_full to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_synth_half to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dct32 to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([99 x i8], [99 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @mad_synth_init(%struct.mad_synth*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_synth_init, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_synth_init, i64 0, i64 0)
  %3 = alloca %struct.mad_synth*, align 8
  store %struct.mad_synth* %0, %struct.mad_synth** %3, align 8
  %4 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  call void @mad_synth_mute(%struct.mad_synth* %4)
  %5 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %6 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %5, i32 0, i32 1
  store i32 0, i32* %6, align 4
  %7 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %8 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %7, i32 0, i32 2
  %9 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %8, i32 0, i32 0
  store i32 0, i32* %9, align 4
  %10 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %11 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %10, i32 0, i32 2
  %12 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %11, i32 0, i32 1
  store i16 0, i16* %12, align 4
  %13 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %14 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %13, i32 0, i32 2
  %15 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %14, i32 0, i32 2
  store i16 0, i16* %15, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @mad_synth_mute(%struct.mad_synth*) #0 {
  %2 = alloca %struct.mad_synth*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.mad_synth* %0, %struct.mad_synth** %2, align 8
  store i32 0, i32* %3, align 4
  br label %6

; <label>:6:                                      ; preds = %80, %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp ult i32 %7, 2
  br i1 %8, label %9, label %84

; <label>:9:                                      ; preds = %6
  store i32 0, i32* %4, align 4
  br label %10

; <label>:10:                                     ; preds = %75, %9
  %11 = load i32, i32* %4, align 4
  %12 = icmp ult i32 %11, 16
  br i1 %12, label %13, label %79

; <label>:13:                                     ; preds = %10
  store i32 0, i32* %5, align 4
  br label %14

; <label>:14:                                     ; preds = %70, %13
  %15 = load i32, i32* %5, align 4
  %16 = icmp ult i32 %15, 8
  br i1 %16, label %17, label %74

; <label>:17:                                     ; preds = %14
  %18 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  %19 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %18, i32 0, i32 0
  %20 = load i32, i32* %3, align 4
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds [2 x [2 x [2 x [16 x [8 x i32]]]]], [2 x [2 x [2 x [16 x [8 x i32]]]]]* %19, i64 0, i64 %21
  %23 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %22, i64 0, i64 1
  %24 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %23, i64 0, i64 1
  %25 = load i32, i32* %4, align 4
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %24, i64 0, i64 %26
  %28 = load i32, i32* %5, align 4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds [8 x i32], [8 x i32]* %27, i64 0, i64 %29
  store i32 0, i32* %30, align 4
  %31 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  %32 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %31, i32 0, i32 0
  %33 = load i32, i32* %3, align 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds [2 x [2 x [2 x [16 x [8 x i32]]]]], [2 x [2 x [2 x [16 x [8 x i32]]]]]* %32, i64 0, i64 %34
  %36 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %35, i64 0, i64 1
  %37 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %36, i64 0, i64 0
  %38 = load i32, i32* %4, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %37, i64 0, i64 %39
  %41 = load i32, i32* %5, align 4
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds [8 x i32], [8 x i32]* %40, i64 0, i64 %42
  store i32 0, i32* %43, align 4
  %44 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  %45 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %44, i32 0, i32 0
  %46 = load i32, i32* %3, align 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds [2 x [2 x [2 x [16 x [8 x i32]]]]], [2 x [2 x [2 x [16 x [8 x i32]]]]]* %45, i64 0, i64 %47
  %49 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %48, i64 0, i64 0
  %50 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %49, i64 0, i64 1
  %51 = load i32, i32* %4, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %50, i64 0, i64 %52
  %54 = load i32, i32* %5, align 4
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds [8 x i32], [8 x i32]* %53, i64 0, i64 %55
  store i32 0, i32* %56, align 4
  %57 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  %58 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %57, i32 0, i32 0
  %59 = load i32, i32* %3, align 4
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds [2 x [2 x [2 x [16 x [8 x i32]]]]], [2 x [2 x [2 x [16 x [8 x i32]]]]]* %58, i64 0, i64 %60
  %62 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %61, i64 0, i64 0
  %63 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %62, i64 0, i64 0
  %64 = load i32, i32* %4, align 4
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %63, i64 0, i64 %65
  %67 = load i32, i32* %5, align 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds [8 x i32], [8 x i32]* %66, i64 0, i64 %68
  store i32 0, i32* %69, align 4
  br label %70

; <label>:70:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i64 0, i64 0)
  %71 = add i64 %pgocount, 1
  store i64 %71, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i64 0, i64 0)
  %72 = load i32, i32* %5, align 4
  %73 = add i32 %72, 1
  store i32 %73, i32* %5, align 4
  br label %14

; <label>:74:                                     ; preds = %14
  br label %75

; <label>:75:                                     ; preds = %74
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i64 0, i64 1)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i64 0, i64 1)
  %77 = load i32, i32* %4, align 4
  %78 = add i32 %77, 1
  store i32 %78, i32* %4, align 4
  br label %10

; <label>:79:                                     ; preds = %10
  br label %80

; <label>:80:                                     ; preds = %79
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i64 0, i64 2)
  %81 = add i64 %pgocount2, 1
  store i64 %81, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i64 0, i64 2)
  %82 = load i32, i32* %3, align 4
  %83 = add i32 %82, 1
  store i32 %83, i32* %3, align 4
  br label %6

; <label>:84:                                     ; preds = %6
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i64 0, i64 3)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mad_synth_mute, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @mad_synth_frame(%struct.mad_synth*, %struct.mad_frame*) #0 {
  %3 = alloca %struct.mad_synth*, align 8
  %4 = alloca %struct.mad_frame*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)*, align 8
  store %struct.mad_synth* %0, %struct.mad_synth** %3, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %4, align 8
  %8 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %9 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %8, i32 0, i32 0
  %10 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %9, i32 0, i32 1
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 0
  %13 = zext i1 %12 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 4)
  %14 = add i64 %pgocount, %13
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 4)
  %15 = select i1 %12, i32 2, i32 1
  store i32 %15, i32* %5, align 4
  %16 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %17 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %16, i32 0, i32 0
  %18 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 8
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 0)
  br label %43

; <label>:23:                                     ; preds = %2
  %24 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %25 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %25, i32 0, i32 0
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 3
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 3)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 3)
  %31 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %32 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %31, i32 0, i32 0
  %33 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %32, i32 0, i32 8
  %34 = load i32, i32* %33, align 8
  %35 = and i32 %34, 4096
  %36 = icmp ne i32 %35, 0
  br label %37

; <label>:37:                                     ; preds = %29, %23
  %38 = phi i1 [ false, %23 ], [ %36, %29 ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 1)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 1)
  %40 = zext i1 %38 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 5)
  %41 = add i64 %pgocount4, %40
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 5)
  %42 = select i1 %38, i32 18, i32 36
  br label %43

; <label>:43:                                     ; preds = %37, %21
  %44 = phi i32 [ 12, %21 ], [ %42, %37 ]
  store i32 %44, i32* %6, align 4
  %45 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %46 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %45, i32 0, i32 0
  %47 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %46, i32 0, i32 5
  %48 = load i32, i32* %47, align 8
  %49 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %50 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %49, i32 0, i32 2
  %51 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %50, i32 0, i32 0
  store i32 %48, i32* %51, align 4
  %52 = load i32, i32* %5, align 4
  %53 = trunc i32 %52 to i16
  %54 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %55 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %54, i32 0, i32 2
  %56 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %55, i32 0, i32 1
  store i16 %53, i16* %56, align 4
  %57 = load i32, i32* %6, align 4
  %58 = mul i32 32, %57
  %59 = trunc i32 %58 to i16
  %60 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %61 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %60, i32 0, i32 2
  %62 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %61, i32 0, i32 2
  store i16 %59, i16* %62, align 2
  store void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)* @synth_full, void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)** %7, align 8
  %63 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %64 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %63, i32 0, i32 1
  %65 = load i32, i32* %64, align 8
  %66 = and i32 %65, 2
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %82

; <label>:68:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 2)
  %69 = add i64 %pgocount5, 1
  store i64 %69, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mad_synth_frame, i64 0, i64 2)
  %70 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %71 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %70, i32 0, i32 2
  %72 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %71, i32 0, i32 0
  %73 = load i32, i32* %72, align 4
  %74 = udiv i32 %73, 2
  store i32 %74, i32* %72, align 4
  %75 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %76 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %75, i32 0, i32 2
  %77 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %76, i32 0, i32 2
  %78 = load i16, i16* %77, align 2
  %79 = zext i16 %78 to i32
  %80 = sdiv i32 %79, 2
  %81 = trunc i32 %80 to i16
  store i16 %81, i16* %77, align 2
  store void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)* @synth_half, void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)** %7, align 8
  br label %82

; <label>:82:                                     ; preds = %68, %43
  %83 = load void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)*, void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)** %7, align 8
  %84 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %85 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %86 = load i32, i32* %5, align 4
  %87 = load i32, i32* %6, align 4
  %88 = ptrtoint void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)* %83 to i64
  call void @__llvm_profile_instrument_target(i64 %88, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_synth_frame to i8*), i32 0)
  call void %83(%struct.mad_synth* %84, %struct.mad_frame* %85, i32 %86, i32 %87)
  %89 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %90 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %89, i32 0, i32 1
  %91 = load i32, i32* %90, align 4
  %92 = load i32, i32* %6, align 4
  %93 = add i32 %91, %92
  %94 = urem i32 %93, 16
  %95 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %96 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %95, i32 0, i32 1
  store i32 %94, i32* %96, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @synth_full(%struct.mad_synth*, %struct.mad_frame*, i32, i32) #0 {
  %5 = alloca %struct.mad_synth*, align 8
  %6 = alloca %struct.mad_frame*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca [2 x [2 x [16 x [8 x i32]]]]*, align 8
  %18 = alloca [36 x [32 x i32]]*, align 8
  %19 = alloca [8 x i32]*, align 8
  %20 = alloca [8 x i32]*, align 8
  %21 = alloca [8 x i32]*, align 8
  %22 = alloca [32 x i32]*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store %struct.mad_synth* %0, %struct.mad_synth** %5, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %10, align 4
  br label %26

; <label>:26:                                     ; preds = %692, %4
  %27 = load i32, i32* %10, align 4
  %28 = load i32, i32* %7, align 4
  %29 = icmp ult i32 %27, %28
  br i1 %29, label %30, label %696

; <label>:30:                                     ; preds = %26
  %31 = load %struct.mad_frame*, %struct.mad_frame** %6, align 8
  %32 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %31, i32 0, i32 2
  %33 = load i32, i32* %10, align 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %32, i64 0, i64 %34
  store [36 x [32 x i32]]* %35, [36 x [32 x i32]]** %18, align 8
  %36 = load %struct.mad_synth*, %struct.mad_synth** %5, align 8
  %37 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %36, i32 0, i32 0
  %38 = load i32, i32* %10, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [2 x [2 x [2 x [16 x [8 x i32]]]]], [2 x [2 x [2 x [16 x [8 x i32]]]]]* %37, i64 0, i64 %39
  store [2 x [2 x [16 x [8 x i32]]]]* %40, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %41 = load %struct.mad_synth*, %struct.mad_synth** %5, align 8
  %42 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %9, align 4
  %44 = load %struct.mad_synth*, %struct.mad_synth** %5, align 8
  %45 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %44, i32 0, i32 2
  %46 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %45, i32 0, i32 3
  %47 = load i32, i32* %10, align 4
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds [2 x [1152 x i32]], [2 x [1152 x i32]]* %46, i64 0, i64 %48
  %50 = getelementptr inbounds [1152 x i32], [1152 x i32]* %49, i32 0, i32 0
  store i32* %50, i32** %15, align 8
  store i32 0, i32* %11, align 4
  br label %51

; <label>:51:                                     ; preds = %687, %30
  %52 = load i32, i32* %11, align 4
  %53 = load i32, i32* %8, align 4
  %54 = icmp ult i32 %52, %53
  br i1 %54, label %55, label %691

; <label>:55:                                     ; preds = %51
  %56 = load [36 x [32 x i32]]*, [36 x [32 x i32]]** %18, align 8
  %57 = load i32, i32* %11, align 4
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %56, i64 0, i64 %58
  %60 = getelementptr inbounds [32 x i32], [32 x i32]* %59, i32 0, i32 0
  %61 = load i32, i32* %9, align 4
  %62 = lshr i32 %61, 1
  %63 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %64 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %63, i64 0, i64 0
  %65 = load i32, i32* %9, align 4
  %66 = and i32 %65, 1
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %64, i64 0, i64 %67
  %69 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %68, i32 0, i32 0
  %70 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %71 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %70, i64 0, i64 1
  %72 = load i32, i32* %9, align 4
  %73 = and i32 %72, 1
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %71, i64 0, i64 %74
  %76 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %75, i32 0, i32 0
  call void @dct32(i32* %60, i32 %62, [8 x i32]* %69, [8 x i32]* %76)
  %77 = load i32, i32* %9, align 4
  %78 = and i32 %77, -2
  store i32 %78, i32* %13, align 4
  %79 = load i32, i32* %9, align 4
  %80 = sub i32 %79, 1
  %81 = and i32 %80, 15
  %82 = or i32 %81, 1
  store i32 %82, i32* %14, align 4
  %83 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %84 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %83, i64 0, i64 0
  %85 = load i32, i32* %9, align 4
  %86 = and i32 %85, 1
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %84, i64 0, i64 %87
  %89 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %88, i64 0, i64 0
  store [8 x i32]* %89, [8 x i32]** %19, align 8
  %90 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %91 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %90, i64 0, i64 0
  %92 = load i32, i32* %9, align 4
  %93 = xor i32 %92, -1
  %94 = and i32 %93, 1
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %91, i64 0, i64 %95
  %97 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %96, i64 0, i64 0
  store [8 x i32]* %97, [8 x i32]** %20, align 8
  %98 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %99 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %98, i64 0, i64 1
  %100 = load i32, i32* %9, align 4
  %101 = xor i32 %100, -1
  %102 = and i32 %101, 1
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %99, i64 0, i64 %103
  %105 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %104, i64 0, i64 0
  store [8 x i32]* %105, [8 x i32]** %21, align 8
  store [32 x i32]* getelementptr inbounds ([17 x [32 x i32]], [17 x [32 x i32]]* @D, i64 0, i64 0), [32 x i32]** %22, align 8
  %106 = load [32 x i32]*, [32 x i32]** %22, align 8
  %107 = getelementptr inbounds [32 x i32], [32 x i32]* %106, i32 0, i32 0
  %108 = load i32, i32* %14, align 4
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32* %107, i64 %109
  store i32* %110, i32** %23, align 8
  %111 = load [8 x i32]*, [8 x i32]** %20, align 8
  %112 = getelementptr inbounds [8 x i32], [8 x i32]* %111, i64 0, i64 0
  %113 = load i32, i32* %112, align 4
  %114 = load i32*, i32** %23, align 8
  %115 = getelementptr inbounds i32, i32* %114, i64 0
  %116 = load i32, i32* %115, align 4
  %117 = mul nsw i32 %113, %116
  store i32 %117, i32* %25, align 4
  %118 = load [8 x i32]*, [8 x i32]** %20, align 8
  %119 = getelementptr inbounds [8 x i32], [8 x i32]* %118, i64 0, i64 1
  %120 = load i32, i32* %119, align 4
  %121 = load i32*, i32** %23, align 8
  %122 = getelementptr inbounds i32, i32* %121, i64 14
  %123 = load i32, i32* %122, align 4
  %124 = mul nsw i32 %120, %123
  %125 = load i32, i32* %25, align 4
  %126 = add i32 %125, %124
  store i32 %126, i32* %25, align 4
  %127 = load [8 x i32]*, [8 x i32]** %20, align 8
  %128 = getelementptr inbounds [8 x i32], [8 x i32]* %127, i64 0, i64 2
  %129 = load i32, i32* %128, align 4
  %130 = load i32*, i32** %23, align 8
  %131 = getelementptr inbounds i32, i32* %130, i64 12
  %132 = load i32, i32* %131, align 4
  %133 = mul nsw i32 %129, %132
  %134 = load i32, i32* %25, align 4
  %135 = add i32 %134, %133
  store i32 %135, i32* %25, align 4
  %136 = load [8 x i32]*, [8 x i32]** %20, align 8
  %137 = getelementptr inbounds [8 x i32], [8 x i32]* %136, i64 0, i64 3
  %138 = load i32, i32* %137, align 4
  %139 = load i32*, i32** %23, align 8
  %140 = getelementptr inbounds i32, i32* %139, i64 10
  %141 = load i32, i32* %140, align 4
  %142 = mul nsw i32 %138, %141
  %143 = load i32, i32* %25, align 4
  %144 = add i32 %143, %142
  store i32 %144, i32* %25, align 4
  %145 = load [8 x i32]*, [8 x i32]** %20, align 8
  %146 = getelementptr inbounds [8 x i32], [8 x i32]* %145, i64 0, i64 4
  %147 = load i32, i32* %146, align 4
  %148 = load i32*, i32** %23, align 8
  %149 = getelementptr inbounds i32, i32* %148, i64 8
  %150 = load i32, i32* %149, align 4
  %151 = mul nsw i32 %147, %150
  %152 = load i32, i32* %25, align 4
  %153 = add i32 %152, %151
  store i32 %153, i32* %25, align 4
  %154 = load [8 x i32]*, [8 x i32]** %20, align 8
  %155 = getelementptr inbounds [8 x i32], [8 x i32]* %154, i64 0, i64 5
  %156 = load i32, i32* %155, align 4
  %157 = load i32*, i32** %23, align 8
  %158 = getelementptr inbounds i32, i32* %157, i64 6
  %159 = load i32, i32* %158, align 4
  %160 = mul nsw i32 %156, %159
  %161 = load i32, i32* %25, align 4
  %162 = add i32 %161, %160
  store i32 %162, i32* %25, align 4
  %163 = load [8 x i32]*, [8 x i32]** %20, align 8
  %164 = getelementptr inbounds [8 x i32], [8 x i32]* %163, i64 0, i64 6
  %165 = load i32, i32* %164, align 4
  %166 = load i32*, i32** %23, align 8
  %167 = getelementptr inbounds i32, i32* %166, i64 4
  %168 = load i32, i32* %167, align 4
  %169 = mul nsw i32 %165, %168
  %170 = load i32, i32* %25, align 4
  %171 = add i32 %170, %169
  store i32 %171, i32* %25, align 4
  %172 = load [8 x i32]*, [8 x i32]** %20, align 8
  %173 = getelementptr inbounds [8 x i32], [8 x i32]* %172, i64 0, i64 7
  %174 = load i32, i32* %173, align 4
  %175 = load i32*, i32** %23, align 8
  %176 = getelementptr inbounds i32, i32* %175, i64 2
  %177 = load i32, i32* %176, align 4
  %178 = mul nsw i32 %174, %177
  %179 = load i32, i32* %25, align 4
  %180 = add i32 %179, %178
  store i32 %180, i32* %25, align 4
  %181 = load i32, i32* %25, align 4
  %182 = sub i32 0, %181
  store i32 %182, i32* %25, align 4
  %183 = load [32 x i32]*, [32 x i32]** %22, align 8
  %184 = getelementptr inbounds [32 x i32], [32 x i32]* %183, i32 0, i32 0
  %185 = load i32, i32* %13, align 4
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds i32, i32* %184, i64 %186
  store i32* %187, i32** %23, align 8
  %188 = load [8 x i32]*, [8 x i32]** %19, align 8
  %189 = getelementptr inbounds [8 x i32], [8 x i32]* %188, i64 0, i64 0
  %190 = load i32, i32* %189, align 4
  %191 = load i32*, i32** %23, align 8
  %192 = getelementptr inbounds i32, i32* %191, i64 0
  %193 = load i32, i32* %192, align 4
  %194 = mul nsw i32 %190, %193
  %195 = load i32, i32* %25, align 4
  %196 = add i32 %195, %194
  store i32 %196, i32* %25, align 4
  %197 = load [8 x i32]*, [8 x i32]** %19, align 8
  %198 = getelementptr inbounds [8 x i32], [8 x i32]* %197, i64 0, i64 1
  %199 = load i32, i32* %198, align 4
  %200 = load i32*, i32** %23, align 8
  %201 = getelementptr inbounds i32, i32* %200, i64 14
  %202 = load i32, i32* %201, align 4
  %203 = mul nsw i32 %199, %202
  %204 = load i32, i32* %25, align 4
  %205 = add i32 %204, %203
  store i32 %205, i32* %25, align 4
  %206 = load [8 x i32]*, [8 x i32]** %19, align 8
  %207 = getelementptr inbounds [8 x i32], [8 x i32]* %206, i64 0, i64 2
  %208 = load i32, i32* %207, align 4
  %209 = load i32*, i32** %23, align 8
  %210 = getelementptr inbounds i32, i32* %209, i64 12
  %211 = load i32, i32* %210, align 4
  %212 = mul nsw i32 %208, %211
  %213 = load i32, i32* %25, align 4
  %214 = add i32 %213, %212
  store i32 %214, i32* %25, align 4
  %215 = load [8 x i32]*, [8 x i32]** %19, align 8
  %216 = getelementptr inbounds [8 x i32], [8 x i32]* %215, i64 0, i64 3
  %217 = load i32, i32* %216, align 4
  %218 = load i32*, i32** %23, align 8
  %219 = getelementptr inbounds i32, i32* %218, i64 10
  %220 = load i32, i32* %219, align 4
  %221 = mul nsw i32 %217, %220
  %222 = load i32, i32* %25, align 4
  %223 = add i32 %222, %221
  store i32 %223, i32* %25, align 4
  %224 = load [8 x i32]*, [8 x i32]** %19, align 8
  %225 = getelementptr inbounds [8 x i32], [8 x i32]* %224, i64 0, i64 4
  %226 = load i32, i32* %225, align 4
  %227 = load i32*, i32** %23, align 8
  %228 = getelementptr inbounds i32, i32* %227, i64 8
  %229 = load i32, i32* %228, align 4
  %230 = mul nsw i32 %226, %229
  %231 = load i32, i32* %25, align 4
  %232 = add i32 %231, %230
  store i32 %232, i32* %25, align 4
  %233 = load [8 x i32]*, [8 x i32]** %19, align 8
  %234 = getelementptr inbounds [8 x i32], [8 x i32]* %233, i64 0, i64 5
  %235 = load i32, i32* %234, align 4
  %236 = load i32*, i32** %23, align 8
  %237 = getelementptr inbounds i32, i32* %236, i64 6
  %238 = load i32, i32* %237, align 4
  %239 = mul nsw i32 %235, %238
  %240 = load i32, i32* %25, align 4
  %241 = add i32 %240, %239
  store i32 %241, i32* %25, align 4
  %242 = load [8 x i32]*, [8 x i32]** %19, align 8
  %243 = getelementptr inbounds [8 x i32], [8 x i32]* %242, i64 0, i64 6
  %244 = load i32, i32* %243, align 4
  %245 = load i32*, i32** %23, align 8
  %246 = getelementptr inbounds i32, i32* %245, i64 4
  %247 = load i32, i32* %246, align 4
  %248 = mul nsw i32 %244, %247
  %249 = load i32, i32* %25, align 4
  %250 = add i32 %249, %248
  store i32 %250, i32* %25, align 4
  %251 = load [8 x i32]*, [8 x i32]** %19, align 8
  %252 = getelementptr inbounds [8 x i32], [8 x i32]* %251, i64 0, i64 7
  %253 = load i32, i32* %252, align 4
  %254 = load i32*, i32** %23, align 8
  %255 = getelementptr inbounds i32, i32* %254, i64 2
  %256 = load i32, i32* %255, align 4
  %257 = mul nsw i32 %253, %256
  %258 = load i32, i32* %25, align 4
  %259 = add i32 %258, %257
  store i32 %259, i32* %25, align 4
  %260 = load i32, i32* %24, align 4
  %261 = load i32, i32* %25, align 4
  %262 = ashr i32 %261, 2
  %263 = load i32*, i32** %15, align 8
  %264 = getelementptr inbounds i32, i32* %263, i32 1
  store i32* %264, i32** %15, align 8
  store i32 %262, i32* %263, align 4
  %265 = load i32*, i32** %15, align 8
  %266 = getelementptr inbounds i32, i32* %265, i64 30
  store i32* %266, i32** %16, align 8
  store i32 1, i32* %12, align 4
  br label %267

; <label>:267:                                    ; preds = %595, %55
  %268 = load i32, i32* %12, align 4
  %269 = icmp ult i32 %268, 16
  br i1 %269, label %270, label %599

; <label>:270:                                    ; preds = %267
  %271 = load [8 x i32]*, [8 x i32]** %19, align 8
  %272 = getelementptr inbounds [8 x i32], [8 x i32]* %271, i32 1
  store [8 x i32]* %272, [8 x i32]** %19, align 8
  %273 = load [32 x i32]*, [32 x i32]** %22, align 8
  %274 = getelementptr inbounds [32 x i32], [32 x i32]* %273, i32 1
  store [32 x i32]* %274, [32 x i32]** %22, align 8
  %275 = load [32 x i32]*, [32 x i32]** %22, align 8
  %276 = getelementptr inbounds [32 x i32], [32 x i32]* %275, i32 0, i32 0
  %277 = load i32, i32* %14, align 4
  %278 = zext i32 %277 to i64
  %279 = getelementptr inbounds i32, i32* %276, i64 %278
  store i32* %279, i32** %23, align 8
  %280 = load [8 x i32]*, [8 x i32]** %21, align 8
  %281 = getelementptr inbounds [8 x i32], [8 x i32]* %280, i64 0, i64 0
  %282 = load i32, i32* %281, align 4
  %283 = load i32*, i32** %23, align 8
  %284 = getelementptr inbounds i32, i32* %283, i64 0
  %285 = load i32, i32* %284, align 4
  %286 = mul nsw i32 %282, %285
  store i32 %286, i32* %25, align 4
  %287 = load [8 x i32]*, [8 x i32]** %21, align 8
  %288 = getelementptr inbounds [8 x i32], [8 x i32]* %287, i64 0, i64 1
  %289 = load i32, i32* %288, align 4
  %290 = load i32*, i32** %23, align 8
  %291 = getelementptr inbounds i32, i32* %290, i64 14
  %292 = load i32, i32* %291, align 4
  %293 = mul nsw i32 %289, %292
  %294 = load i32, i32* %25, align 4
  %295 = add i32 %294, %293
  store i32 %295, i32* %25, align 4
  %296 = load [8 x i32]*, [8 x i32]** %21, align 8
  %297 = getelementptr inbounds [8 x i32], [8 x i32]* %296, i64 0, i64 2
  %298 = load i32, i32* %297, align 4
  %299 = load i32*, i32** %23, align 8
  %300 = getelementptr inbounds i32, i32* %299, i64 12
  %301 = load i32, i32* %300, align 4
  %302 = mul nsw i32 %298, %301
  %303 = load i32, i32* %25, align 4
  %304 = add i32 %303, %302
  store i32 %304, i32* %25, align 4
  %305 = load [8 x i32]*, [8 x i32]** %21, align 8
  %306 = getelementptr inbounds [8 x i32], [8 x i32]* %305, i64 0, i64 3
  %307 = load i32, i32* %306, align 4
  %308 = load i32*, i32** %23, align 8
  %309 = getelementptr inbounds i32, i32* %308, i64 10
  %310 = load i32, i32* %309, align 4
  %311 = mul nsw i32 %307, %310
  %312 = load i32, i32* %25, align 4
  %313 = add i32 %312, %311
  store i32 %313, i32* %25, align 4
  %314 = load [8 x i32]*, [8 x i32]** %21, align 8
  %315 = getelementptr inbounds [8 x i32], [8 x i32]* %314, i64 0, i64 4
  %316 = load i32, i32* %315, align 4
  %317 = load i32*, i32** %23, align 8
  %318 = getelementptr inbounds i32, i32* %317, i64 8
  %319 = load i32, i32* %318, align 4
  %320 = mul nsw i32 %316, %319
  %321 = load i32, i32* %25, align 4
  %322 = add i32 %321, %320
  store i32 %322, i32* %25, align 4
  %323 = load [8 x i32]*, [8 x i32]** %21, align 8
  %324 = getelementptr inbounds [8 x i32], [8 x i32]* %323, i64 0, i64 5
  %325 = load i32, i32* %324, align 4
  %326 = load i32*, i32** %23, align 8
  %327 = getelementptr inbounds i32, i32* %326, i64 6
  %328 = load i32, i32* %327, align 4
  %329 = mul nsw i32 %325, %328
  %330 = load i32, i32* %25, align 4
  %331 = add i32 %330, %329
  store i32 %331, i32* %25, align 4
  %332 = load [8 x i32]*, [8 x i32]** %21, align 8
  %333 = getelementptr inbounds [8 x i32], [8 x i32]* %332, i64 0, i64 6
  %334 = load i32, i32* %333, align 4
  %335 = load i32*, i32** %23, align 8
  %336 = getelementptr inbounds i32, i32* %335, i64 4
  %337 = load i32, i32* %336, align 4
  %338 = mul nsw i32 %334, %337
  %339 = load i32, i32* %25, align 4
  %340 = add i32 %339, %338
  store i32 %340, i32* %25, align 4
  %341 = load [8 x i32]*, [8 x i32]** %21, align 8
  %342 = getelementptr inbounds [8 x i32], [8 x i32]* %341, i64 0, i64 7
  %343 = load i32, i32* %342, align 4
  %344 = load i32*, i32** %23, align 8
  %345 = getelementptr inbounds i32, i32* %344, i64 2
  %346 = load i32, i32* %345, align 4
  %347 = mul nsw i32 %343, %346
  %348 = load i32, i32* %25, align 4
  %349 = add i32 %348, %347
  store i32 %349, i32* %25, align 4
  %350 = load i32, i32* %25, align 4
  %351 = sub i32 0, %350
  store i32 %351, i32* %25, align 4
  %352 = load [32 x i32]*, [32 x i32]** %22, align 8
  %353 = getelementptr inbounds [32 x i32], [32 x i32]* %352, i32 0, i32 0
  %354 = load i32, i32* %13, align 4
  %355 = zext i32 %354 to i64
  %356 = getelementptr inbounds i32, i32* %353, i64 %355
  store i32* %356, i32** %23, align 8
  %357 = load [8 x i32]*, [8 x i32]** %19, align 8
  %358 = getelementptr inbounds [8 x i32], [8 x i32]* %357, i64 0, i64 7
  %359 = load i32, i32* %358, align 4
  %360 = load i32*, i32** %23, align 8
  %361 = getelementptr inbounds i32, i32* %360, i64 2
  %362 = load i32, i32* %361, align 4
  %363 = mul nsw i32 %359, %362
  %364 = load i32, i32* %25, align 4
  %365 = add i32 %364, %363
  store i32 %365, i32* %25, align 4
  %366 = load [8 x i32]*, [8 x i32]** %19, align 8
  %367 = getelementptr inbounds [8 x i32], [8 x i32]* %366, i64 0, i64 6
  %368 = load i32, i32* %367, align 4
  %369 = load i32*, i32** %23, align 8
  %370 = getelementptr inbounds i32, i32* %369, i64 4
  %371 = load i32, i32* %370, align 4
  %372 = mul nsw i32 %368, %371
  %373 = load i32, i32* %25, align 4
  %374 = add i32 %373, %372
  store i32 %374, i32* %25, align 4
  %375 = load [8 x i32]*, [8 x i32]** %19, align 8
  %376 = getelementptr inbounds [8 x i32], [8 x i32]* %375, i64 0, i64 5
  %377 = load i32, i32* %376, align 4
  %378 = load i32*, i32** %23, align 8
  %379 = getelementptr inbounds i32, i32* %378, i64 6
  %380 = load i32, i32* %379, align 4
  %381 = mul nsw i32 %377, %380
  %382 = load i32, i32* %25, align 4
  %383 = add i32 %382, %381
  store i32 %383, i32* %25, align 4
  %384 = load [8 x i32]*, [8 x i32]** %19, align 8
  %385 = getelementptr inbounds [8 x i32], [8 x i32]* %384, i64 0, i64 4
  %386 = load i32, i32* %385, align 4
  %387 = load i32*, i32** %23, align 8
  %388 = getelementptr inbounds i32, i32* %387, i64 8
  %389 = load i32, i32* %388, align 4
  %390 = mul nsw i32 %386, %389
  %391 = load i32, i32* %25, align 4
  %392 = add i32 %391, %390
  store i32 %392, i32* %25, align 4
  %393 = load [8 x i32]*, [8 x i32]** %19, align 8
  %394 = getelementptr inbounds [8 x i32], [8 x i32]* %393, i64 0, i64 3
  %395 = load i32, i32* %394, align 4
  %396 = load i32*, i32** %23, align 8
  %397 = getelementptr inbounds i32, i32* %396, i64 10
  %398 = load i32, i32* %397, align 4
  %399 = mul nsw i32 %395, %398
  %400 = load i32, i32* %25, align 4
  %401 = add i32 %400, %399
  store i32 %401, i32* %25, align 4
  %402 = load [8 x i32]*, [8 x i32]** %19, align 8
  %403 = getelementptr inbounds [8 x i32], [8 x i32]* %402, i64 0, i64 2
  %404 = load i32, i32* %403, align 4
  %405 = load i32*, i32** %23, align 8
  %406 = getelementptr inbounds i32, i32* %405, i64 12
  %407 = load i32, i32* %406, align 4
  %408 = mul nsw i32 %404, %407
  %409 = load i32, i32* %25, align 4
  %410 = add i32 %409, %408
  store i32 %410, i32* %25, align 4
  %411 = load [8 x i32]*, [8 x i32]** %19, align 8
  %412 = getelementptr inbounds [8 x i32], [8 x i32]* %411, i64 0, i64 1
  %413 = load i32, i32* %412, align 4
  %414 = load i32*, i32** %23, align 8
  %415 = getelementptr inbounds i32, i32* %414, i64 14
  %416 = load i32, i32* %415, align 4
  %417 = mul nsw i32 %413, %416
  %418 = load i32, i32* %25, align 4
  %419 = add i32 %418, %417
  store i32 %419, i32* %25, align 4
  %420 = load [8 x i32]*, [8 x i32]** %19, align 8
  %421 = getelementptr inbounds [8 x i32], [8 x i32]* %420, i64 0, i64 0
  %422 = load i32, i32* %421, align 4
  %423 = load i32*, i32** %23, align 8
  %424 = getelementptr inbounds i32, i32* %423, i64 0
  %425 = load i32, i32* %424, align 4
  %426 = mul nsw i32 %422, %425
  %427 = load i32, i32* %25, align 4
  %428 = add i32 %427, %426
  store i32 %428, i32* %25, align 4
  %429 = load i32, i32* %24, align 4
  %430 = load i32, i32* %25, align 4
  %431 = ashr i32 %430, 2
  %432 = load i32*, i32** %15, align 8
  %433 = getelementptr inbounds i32, i32* %432, i32 1
  store i32* %433, i32** %15, align 8
  store i32 %431, i32* %432, align 4
  %434 = load [32 x i32]*, [32 x i32]** %22, align 8
  %435 = getelementptr inbounds [32 x i32], [32 x i32]* %434, i32 0, i32 0
  %436 = load i32, i32* %13, align 4
  %437 = zext i32 %436 to i64
  %438 = sub i64 0, %437
  %439 = getelementptr inbounds i32, i32* %435, i64 %438
  store i32* %439, i32** %23, align 8
  %440 = load [8 x i32]*, [8 x i32]** %19, align 8
  %441 = getelementptr inbounds [8 x i32], [8 x i32]* %440, i64 0, i64 0
  %442 = load i32, i32* %441, align 4
  %443 = load i32*, i32** %23, align 8
  %444 = getelementptr inbounds i32, i32* %443, i64 15
  %445 = load i32, i32* %444, align 4
  %446 = mul nsw i32 %442, %445
  store i32 %446, i32* %25, align 4
  %447 = load [8 x i32]*, [8 x i32]** %19, align 8
  %448 = getelementptr inbounds [8 x i32], [8 x i32]* %447, i64 0, i64 1
  %449 = load i32, i32* %448, align 4
  %450 = load i32*, i32** %23, align 8
  %451 = getelementptr inbounds i32, i32* %450, i64 17
  %452 = load i32, i32* %451, align 4
  %453 = mul nsw i32 %449, %452
  %454 = load i32, i32* %25, align 4
  %455 = add i32 %454, %453
  store i32 %455, i32* %25, align 4
  %456 = load [8 x i32]*, [8 x i32]** %19, align 8
  %457 = getelementptr inbounds [8 x i32], [8 x i32]* %456, i64 0, i64 2
  %458 = load i32, i32* %457, align 4
  %459 = load i32*, i32** %23, align 8
  %460 = getelementptr inbounds i32, i32* %459, i64 19
  %461 = load i32, i32* %460, align 4
  %462 = mul nsw i32 %458, %461
  %463 = load i32, i32* %25, align 4
  %464 = add i32 %463, %462
  store i32 %464, i32* %25, align 4
  %465 = load [8 x i32]*, [8 x i32]** %19, align 8
  %466 = getelementptr inbounds [8 x i32], [8 x i32]* %465, i64 0, i64 3
  %467 = load i32, i32* %466, align 4
  %468 = load i32*, i32** %23, align 8
  %469 = getelementptr inbounds i32, i32* %468, i64 21
  %470 = load i32, i32* %469, align 4
  %471 = mul nsw i32 %467, %470
  %472 = load i32, i32* %25, align 4
  %473 = add i32 %472, %471
  store i32 %473, i32* %25, align 4
  %474 = load [8 x i32]*, [8 x i32]** %19, align 8
  %475 = getelementptr inbounds [8 x i32], [8 x i32]* %474, i64 0, i64 4
  %476 = load i32, i32* %475, align 4
  %477 = load i32*, i32** %23, align 8
  %478 = getelementptr inbounds i32, i32* %477, i64 23
  %479 = load i32, i32* %478, align 4
  %480 = mul nsw i32 %476, %479
  %481 = load i32, i32* %25, align 4
  %482 = add i32 %481, %480
  store i32 %482, i32* %25, align 4
  %483 = load [8 x i32]*, [8 x i32]** %19, align 8
  %484 = getelementptr inbounds [8 x i32], [8 x i32]* %483, i64 0, i64 5
  %485 = load i32, i32* %484, align 4
  %486 = load i32*, i32** %23, align 8
  %487 = getelementptr inbounds i32, i32* %486, i64 25
  %488 = load i32, i32* %487, align 4
  %489 = mul nsw i32 %485, %488
  %490 = load i32, i32* %25, align 4
  %491 = add i32 %490, %489
  store i32 %491, i32* %25, align 4
  %492 = load [8 x i32]*, [8 x i32]** %19, align 8
  %493 = getelementptr inbounds [8 x i32], [8 x i32]* %492, i64 0, i64 6
  %494 = load i32, i32* %493, align 4
  %495 = load i32*, i32** %23, align 8
  %496 = getelementptr inbounds i32, i32* %495, i64 27
  %497 = load i32, i32* %496, align 4
  %498 = mul nsw i32 %494, %497
  %499 = load i32, i32* %25, align 4
  %500 = add i32 %499, %498
  store i32 %500, i32* %25, align 4
  %501 = load [8 x i32]*, [8 x i32]** %19, align 8
  %502 = getelementptr inbounds [8 x i32], [8 x i32]* %501, i64 0, i64 7
  %503 = load i32, i32* %502, align 4
  %504 = load i32*, i32** %23, align 8
  %505 = getelementptr inbounds i32, i32* %504, i64 29
  %506 = load i32, i32* %505, align 4
  %507 = mul nsw i32 %503, %506
  %508 = load i32, i32* %25, align 4
  %509 = add i32 %508, %507
  store i32 %509, i32* %25, align 4
  %510 = load [32 x i32]*, [32 x i32]** %22, align 8
  %511 = getelementptr inbounds [32 x i32], [32 x i32]* %510, i32 0, i32 0
  %512 = load i32, i32* %14, align 4
  %513 = zext i32 %512 to i64
  %514 = sub i64 0, %513
  %515 = getelementptr inbounds i32, i32* %511, i64 %514
  store i32* %515, i32** %23, align 8
  %516 = load [8 x i32]*, [8 x i32]** %21, align 8
  %517 = getelementptr inbounds [8 x i32], [8 x i32]* %516, i64 0, i64 7
  %518 = load i32, i32* %517, align 4
  %519 = load i32*, i32** %23, align 8
  %520 = getelementptr inbounds i32, i32* %519, i64 29
  %521 = load i32, i32* %520, align 4
  %522 = mul nsw i32 %518, %521
  %523 = load i32, i32* %25, align 4
  %524 = add i32 %523, %522
  store i32 %524, i32* %25, align 4
  %525 = load [8 x i32]*, [8 x i32]** %21, align 8
  %526 = getelementptr inbounds [8 x i32], [8 x i32]* %525, i64 0, i64 6
  %527 = load i32, i32* %526, align 4
  %528 = load i32*, i32** %23, align 8
  %529 = getelementptr inbounds i32, i32* %528, i64 27
  %530 = load i32, i32* %529, align 4
  %531 = mul nsw i32 %527, %530
  %532 = load i32, i32* %25, align 4
  %533 = add i32 %532, %531
  store i32 %533, i32* %25, align 4
  %534 = load [8 x i32]*, [8 x i32]** %21, align 8
  %535 = getelementptr inbounds [8 x i32], [8 x i32]* %534, i64 0, i64 5
  %536 = load i32, i32* %535, align 4
  %537 = load i32*, i32** %23, align 8
  %538 = getelementptr inbounds i32, i32* %537, i64 25
  %539 = load i32, i32* %538, align 4
  %540 = mul nsw i32 %536, %539
  %541 = load i32, i32* %25, align 4
  %542 = add i32 %541, %540
  store i32 %542, i32* %25, align 4
  %543 = load [8 x i32]*, [8 x i32]** %21, align 8
  %544 = getelementptr inbounds [8 x i32], [8 x i32]* %543, i64 0, i64 4
  %545 = load i32, i32* %544, align 4
  %546 = load i32*, i32** %23, align 8
  %547 = getelementptr inbounds i32, i32* %546, i64 23
  %548 = load i32, i32* %547, align 4
  %549 = mul nsw i32 %545, %548
  %550 = load i32, i32* %25, align 4
  %551 = add i32 %550, %549
  store i32 %551, i32* %25, align 4
  %552 = load [8 x i32]*, [8 x i32]** %21, align 8
  %553 = getelementptr inbounds [8 x i32], [8 x i32]* %552, i64 0, i64 3
  %554 = load i32, i32* %553, align 4
  %555 = load i32*, i32** %23, align 8
  %556 = getelementptr inbounds i32, i32* %555, i64 21
  %557 = load i32, i32* %556, align 4
  %558 = mul nsw i32 %554, %557
  %559 = load i32, i32* %25, align 4
  %560 = add i32 %559, %558
  store i32 %560, i32* %25, align 4
  %561 = load [8 x i32]*, [8 x i32]** %21, align 8
  %562 = getelementptr inbounds [8 x i32], [8 x i32]* %561, i64 0, i64 2
  %563 = load i32, i32* %562, align 4
  %564 = load i32*, i32** %23, align 8
  %565 = getelementptr inbounds i32, i32* %564, i64 19
  %566 = load i32, i32* %565, align 4
  %567 = mul nsw i32 %563, %566
  %568 = load i32, i32* %25, align 4
  %569 = add i32 %568, %567
  store i32 %569, i32* %25, align 4
  %570 = load [8 x i32]*, [8 x i32]** %21, align 8
  %571 = getelementptr inbounds [8 x i32], [8 x i32]* %570, i64 0, i64 1
  %572 = load i32, i32* %571, align 4
  %573 = load i32*, i32** %23, align 8
  %574 = getelementptr inbounds i32, i32* %573, i64 17
  %575 = load i32, i32* %574, align 4
  %576 = mul nsw i32 %572, %575
  %577 = load i32, i32* %25, align 4
  %578 = add i32 %577, %576
  store i32 %578, i32* %25, align 4
  %579 = load [8 x i32]*, [8 x i32]** %21, align 8
  %580 = getelementptr inbounds [8 x i32], [8 x i32]* %579, i64 0, i64 0
  %581 = load i32, i32* %580, align 4
  %582 = load i32*, i32** %23, align 8
  %583 = getelementptr inbounds i32, i32* %582, i64 15
  %584 = load i32, i32* %583, align 4
  %585 = mul nsw i32 %581, %584
  %586 = load i32, i32* %25, align 4
  %587 = add i32 %586, %585
  store i32 %587, i32* %25, align 4
  %588 = load i32, i32* %24, align 4
  %589 = load i32, i32* %25, align 4
  %590 = ashr i32 %589, 2
  %591 = load i32*, i32** %16, align 8
  %592 = getelementptr inbounds i32, i32* %591, i32 -1
  store i32* %592, i32** %16, align 8
  store i32 %590, i32* %591, align 4
  %593 = load [8 x i32]*, [8 x i32]** %21, align 8
  %594 = getelementptr inbounds [8 x i32], [8 x i32]* %593, i32 1
  store [8 x i32]* %594, [8 x i32]** %21, align 8
  br label %595

; <label>:595:                                    ; preds = %270
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i64 0, i64 0)
  %596 = add i64 %pgocount, 1
  store i64 %596, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i64 0, i64 0)
  %597 = load i32, i32* %12, align 4
  %598 = add i32 %597, 1
  store i32 %598, i32* %12, align 4
  br label %267

; <label>:599:                                    ; preds = %267
  %600 = load [32 x i32]*, [32 x i32]** %22, align 8
  %601 = getelementptr inbounds [32 x i32], [32 x i32]* %600, i32 1
  store [32 x i32]* %601, [32 x i32]** %22, align 8
  %602 = load [32 x i32]*, [32 x i32]** %22, align 8
  %603 = getelementptr inbounds [32 x i32], [32 x i32]* %602, i32 0, i32 0
  %604 = load i32, i32* %14, align 4
  %605 = zext i32 %604 to i64
  %606 = getelementptr inbounds i32, i32* %603, i64 %605
  store i32* %606, i32** %23, align 8
  %607 = load [8 x i32]*, [8 x i32]** %21, align 8
  %608 = getelementptr inbounds [8 x i32], [8 x i32]* %607, i64 0, i64 0
  %609 = load i32, i32* %608, align 4
  %610 = load i32*, i32** %23, align 8
  %611 = getelementptr inbounds i32, i32* %610, i64 0
  %612 = load i32, i32* %611, align 4
  %613 = mul nsw i32 %609, %612
  store i32 %613, i32* %25, align 4
  %614 = load [8 x i32]*, [8 x i32]** %21, align 8
  %615 = getelementptr inbounds [8 x i32], [8 x i32]* %614, i64 0, i64 1
  %616 = load i32, i32* %615, align 4
  %617 = load i32*, i32** %23, align 8
  %618 = getelementptr inbounds i32, i32* %617, i64 14
  %619 = load i32, i32* %618, align 4
  %620 = mul nsw i32 %616, %619
  %621 = load i32, i32* %25, align 4
  %622 = add i32 %621, %620
  store i32 %622, i32* %25, align 4
  %623 = load [8 x i32]*, [8 x i32]** %21, align 8
  %624 = getelementptr inbounds [8 x i32], [8 x i32]* %623, i64 0, i64 2
  %625 = load i32, i32* %624, align 4
  %626 = load i32*, i32** %23, align 8
  %627 = getelementptr inbounds i32, i32* %626, i64 12
  %628 = load i32, i32* %627, align 4
  %629 = mul nsw i32 %625, %628
  %630 = load i32, i32* %25, align 4
  %631 = add i32 %630, %629
  store i32 %631, i32* %25, align 4
  %632 = load [8 x i32]*, [8 x i32]** %21, align 8
  %633 = getelementptr inbounds [8 x i32], [8 x i32]* %632, i64 0, i64 3
  %634 = load i32, i32* %633, align 4
  %635 = load i32*, i32** %23, align 8
  %636 = getelementptr inbounds i32, i32* %635, i64 10
  %637 = load i32, i32* %636, align 4
  %638 = mul nsw i32 %634, %637
  %639 = load i32, i32* %25, align 4
  %640 = add i32 %639, %638
  store i32 %640, i32* %25, align 4
  %641 = load [8 x i32]*, [8 x i32]** %21, align 8
  %642 = getelementptr inbounds [8 x i32], [8 x i32]* %641, i64 0, i64 4
  %643 = load i32, i32* %642, align 4
  %644 = load i32*, i32** %23, align 8
  %645 = getelementptr inbounds i32, i32* %644, i64 8
  %646 = load i32, i32* %645, align 4
  %647 = mul nsw i32 %643, %646
  %648 = load i32, i32* %25, align 4
  %649 = add i32 %648, %647
  store i32 %649, i32* %25, align 4
  %650 = load [8 x i32]*, [8 x i32]** %21, align 8
  %651 = getelementptr inbounds [8 x i32], [8 x i32]* %650, i64 0, i64 5
  %652 = load i32, i32* %651, align 4
  %653 = load i32*, i32** %23, align 8
  %654 = getelementptr inbounds i32, i32* %653, i64 6
  %655 = load i32, i32* %654, align 4
  %656 = mul nsw i32 %652, %655
  %657 = load i32, i32* %25, align 4
  %658 = add i32 %657, %656
  store i32 %658, i32* %25, align 4
  %659 = load [8 x i32]*, [8 x i32]** %21, align 8
  %660 = getelementptr inbounds [8 x i32], [8 x i32]* %659, i64 0, i64 6
  %661 = load i32, i32* %660, align 4
  %662 = load i32*, i32** %23, align 8
  %663 = getelementptr inbounds i32, i32* %662, i64 4
  %664 = load i32, i32* %663, align 4
  %665 = mul nsw i32 %661, %664
  %666 = load i32, i32* %25, align 4
  %667 = add i32 %666, %665
  store i32 %667, i32* %25, align 4
  %668 = load [8 x i32]*, [8 x i32]** %21, align 8
  %669 = getelementptr inbounds [8 x i32], [8 x i32]* %668, i64 0, i64 7
  %670 = load i32, i32* %669, align 4
  %671 = load i32*, i32** %23, align 8
  %672 = getelementptr inbounds i32, i32* %671, i64 2
  %673 = load i32, i32* %672, align 4
  %674 = mul nsw i32 %670, %673
  %675 = load i32, i32* %25, align 4
  %676 = add i32 %675, %674
  store i32 %676, i32* %25, align 4
  %677 = load i32, i32* %24, align 4
  %678 = load i32, i32* %25, align 4
  %679 = sub nsw i32 0, %678
  %680 = ashr i32 %679, 2
  %681 = load i32*, i32** %15, align 8
  store i32 %680, i32* %681, align 4
  %682 = load i32*, i32** %15, align 8
  %683 = getelementptr inbounds i32, i32* %682, i64 16
  store i32* %683, i32** %15, align 8
  %684 = load i32, i32* %9, align 4
  %685 = add i32 %684, 1
  %686 = urem i32 %685, 16
  store i32 %686, i32* %9, align 4
  br label %687

; <label>:687:                                    ; preds = %599
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i64 0, i64 1)
  %688 = add i64 %pgocount1, 1
  store i64 %688, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i64 0, i64 1)
  %689 = load i32, i32* %11, align 4
  %690 = add i32 %689, 1
  store i32 %690, i32* %11, align 4
  br label %51

; <label>:691:                                    ; preds = %51
  br label %692

; <label>:692:                                    ; preds = %691
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i64 0, i64 2)
  %693 = add i64 %pgocount2, 1
  store i64 %693, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i64 0, i64 2)
  %694 = load i32, i32* %10, align 4
  %695 = add i32 %694, 1
  store i32 %695, i32* %10, align 4
  br label %26

; <label>:696:                                    ; preds = %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i64 0, i64 3)
  %697 = add i64 %pgocount3, 1
  store i64 %697, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_synth_full, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @synth_half(%struct.mad_synth*, %struct.mad_frame*, i32, i32) #0 {
  %5 = alloca %struct.mad_synth*, align 8
  %6 = alloca %struct.mad_frame*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca [2 x [2 x [16 x [8 x i32]]]]*, align 8
  %18 = alloca [36 x [32 x i32]]*, align 8
  %19 = alloca [8 x i32]*, align 8
  %20 = alloca [8 x i32]*, align 8
  %21 = alloca [8 x i32]*, align 8
  %22 = alloca [32 x i32]*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store %struct.mad_synth* %0, %struct.mad_synth** %5, align 8
  store %struct.mad_frame* %1, %struct.mad_frame** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i32 0, i32* %10, align 4
  br label %26

; <label>:26:                                     ; preds = %698, %4
  %27 = load i32, i32* %10, align 4
  %28 = load i32, i32* %7, align 4
  %29 = icmp ult i32 %27, %28
  br i1 %29, label %30, label %702

; <label>:30:                                     ; preds = %26
  %31 = load %struct.mad_frame*, %struct.mad_frame** %6, align 8
  %32 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %31, i32 0, i32 2
  %33 = load i32, i32* %10, align 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds [2 x [36 x [32 x i32]]], [2 x [36 x [32 x i32]]]* %32, i64 0, i64 %34
  store [36 x [32 x i32]]* %35, [36 x [32 x i32]]** %18, align 8
  %36 = load %struct.mad_synth*, %struct.mad_synth** %5, align 8
  %37 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %36, i32 0, i32 0
  %38 = load i32, i32* %10, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [2 x [2 x [2 x [16 x [8 x i32]]]]], [2 x [2 x [2 x [16 x [8 x i32]]]]]* %37, i64 0, i64 %39
  store [2 x [2 x [16 x [8 x i32]]]]* %40, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %41 = load %struct.mad_synth*, %struct.mad_synth** %5, align 8
  %42 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %9, align 4
  %44 = load %struct.mad_synth*, %struct.mad_synth** %5, align 8
  %45 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %44, i32 0, i32 2
  %46 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %45, i32 0, i32 3
  %47 = load i32, i32* %10, align 4
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds [2 x [1152 x i32]], [2 x [1152 x i32]]* %46, i64 0, i64 %48
  %50 = getelementptr inbounds [1152 x i32], [1152 x i32]* %49, i32 0, i32 0
  store i32* %50, i32** %15, align 8
  store i32 0, i32* %11, align 4
  br label %51

; <label>:51:                                     ; preds = %693, %30
  %52 = load i32, i32* %11, align 4
  %53 = load i32, i32* %8, align 4
  %54 = icmp ult i32 %52, %53
  br i1 %54, label %55, label %697

; <label>:55:                                     ; preds = %51
  %56 = load [36 x [32 x i32]]*, [36 x [32 x i32]]** %18, align 8
  %57 = load i32, i32* %11, align 4
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds [36 x [32 x i32]], [36 x [32 x i32]]* %56, i64 0, i64 %58
  %60 = getelementptr inbounds [32 x i32], [32 x i32]* %59, i32 0, i32 0
  %61 = load i32, i32* %9, align 4
  %62 = lshr i32 %61, 1
  %63 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %64 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %63, i64 0, i64 0
  %65 = load i32, i32* %9, align 4
  %66 = and i32 %65, 1
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %64, i64 0, i64 %67
  %69 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %68, i32 0, i32 0
  %70 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %71 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %70, i64 0, i64 1
  %72 = load i32, i32* %9, align 4
  %73 = and i32 %72, 1
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %71, i64 0, i64 %74
  %76 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %75, i32 0, i32 0
  call void @dct32(i32* %60, i32 %62, [8 x i32]* %69, [8 x i32]* %76)
  %77 = load i32, i32* %9, align 4
  %78 = and i32 %77, -2
  store i32 %78, i32* %13, align 4
  %79 = load i32, i32* %9, align 4
  %80 = sub i32 %79, 1
  %81 = and i32 %80, 15
  %82 = or i32 %81, 1
  store i32 %82, i32* %14, align 4
  %83 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %84 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %83, i64 0, i64 0
  %85 = load i32, i32* %9, align 4
  %86 = and i32 %85, 1
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %84, i64 0, i64 %87
  %89 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %88, i64 0, i64 0
  store [8 x i32]* %89, [8 x i32]** %19, align 8
  %90 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %91 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %90, i64 0, i64 0
  %92 = load i32, i32* %9, align 4
  %93 = xor i32 %92, -1
  %94 = and i32 %93, 1
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %91, i64 0, i64 %95
  %97 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %96, i64 0, i64 0
  store [8 x i32]* %97, [8 x i32]** %20, align 8
  %98 = load [2 x [2 x [16 x [8 x i32]]]]*, [2 x [2 x [16 x [8 x i32]]]]** %17, align 8
  %99 = getelementptr inbounds [2 x [2 x [16 x [8 x i32]]]], [2 x [2 x [16 x [8 x i32]]]]* %98, i64 0, i64 1
  %100 = load i32, i32* %9, align 4
  %101 = xor i32 %100, -1
  %102 = and i32 %101, 1
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds [2 x [16 x [8 x i32]]], [2 x [16 x [8 x i32]]]* %99, i64 0, i64 %103
  %105 = getelementptr inbounds [16 x [8 x i32]], [16 x [8 x i32]]* %104, i64 0, i64 0
  store [8 x i32]* %105, [8 x i32]** %21, align 8
  store [32 x i32]* getelementptr inbounds ([17 x [32 x i32]], [17 x [32 x i32]]* @D, i64 0, i64 0), [32 x i32]** %22, align 8
  %106 = load [32 x i32]*, [32 x i32]** %22, align 8
  %107 = getelementptr inbounds [32 x i32], [32 x i32]* %106, i32 0, i32 0
  %108 = load i32, i32* %14, align 4
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32* %107, i64 %109
  store i32* %110, i32** %23, align 8
  %111 = load [8 x i32]*, [8 x i32]** %20, align 8
  %112 = getelementptr inbounds [8 x i32], [8 x i32]* %111, i64 0, i64 0
  %113 = load i32, i32* %112, align 4
  %114 = load i32*, i32** %23, align 8
  %115 = getelementptr inbounds i32, i32* %114, i64 0
  %116 = load i32, i32* %115, align 4
  %117 = mul nsw i32 %113, %116
  store i32 %117, i32* %25, align 4
  %118 = load [8 x i32]*, [8 x i32]** %20, align 8
  %119 = getelementptr inbounds [8 x i32], [8 x i32]* %118, i64 0, i64 1
  %120 = load i32, i32* %119, align 4
  %121 = load i32*, i32** %23, align 8
  %122 = getelementptr inbounds i32, i32* %121, i64 14
  %123 = load i32, i32* %122, align 4
  %124 = mul nsw i32 %120, %123
  %125 = load i32, i32* %25, align 4
  %126 = add i32 %125, %124
  store i32 %126, i32* %25, align 4
  %127 = load [8 x i32]*, [8 x i32]** %20, align 8
  %128 = getelementptr inbounds [8 x i32], [8 x i32]* %127, i64 0, i64 2
  %129 = load i32, i32* %128, align 4
  %130 = load i32*, i32** %23, align 8
  %131 = getelementptr inbounds i32, i32* %130, i64 12
  %132 = load i32, i32* %131, align 4
  %133 = mul nsw i32 %129, %132
  %134 = load i32, i32* %25, align 4
  %135 = add i32 %134, %133
  store i32 %135, i32* %25, align 4
  %136 = load [8 x i32]*, [8 x i32]** %20, align 8
  %137 = getelementptr inbounds [8 x i32], [8 x i32]* %136, i64 0, i64 3
  %138 = load i32, i32* %137, align 4
  %139 = load i32*, i32** %23, align 8
  %140 = getelementptr inbounds i32, i32* %139, i64 10
  %141 = load i32, i32* %140, align 4
  %142 = mul nsw i32 %138, %141
  %143 = load i32, i32* %25, align 4
  %144 = add i32 %143, %142
  store i32 %144, i32* %25, align 4
  %145 = load [8 x i32]*, [8 x i32]** %20, align 8
  %146 = getelementptr inbounds [8 x i32], [8 x i32]* %145, i64 0, i64 4
  %147 = load i32, i32* %146, align 4
  %148 = load i32*, i32** %23, align 8
  %149 = getelementptr inbounds i32, i32* %148, i64 8
  %150 = load i32, i32* %149, align 4
  %151 = mul nsw i32 %147, %150
  %152 = load i32, i32* %25, align 4
  %153 = add i32 %152, %151
  store i32 %153, i32* %25, align 4
  %154 = load [8 x i32]*, [8 x i32]** %20, align 8
  %155 = getelementptr inbounds [8 x i32], [8 x i32]* %154, i64 0, i64 5
  %156 = load i32, i32* %155, align 4
  %157 = load i32*, i32** %23, align 8
  %158 = getelementptr inbounds i32, i32* %157, i64 6
  %159 = load i32, i32* %158, align 4
  %160 = mul nsw i32 %156, %159
  %161 = load i32, i32* %25, align 4
  %162 = add i32 %161, %160
  store i32 %162, i32* %25, align 4
  %163 = load [8 x i32]*, [8 x i32]** %20, align 8
  %164 = getelementptr inbounds [8 x i32], [8 x i32]* %163, i64 0, i64 6
  %165 = load i32, i32* %164, align 4
  %166 = load i32*, i32** %23, align 8
  %167 = getelementptr inbounds i32, i32* %166, i64 4
  %168 = load i32, i32* %167, align 4
  %169 = mul nsw i32 %165, %168
  %170 = load i32, i32* %25, align 4
  %171 = add i32 %170, %169
  store i32 %171, i32* %25, align 4
  %172 = load [8 x i32]*, [8 x i32]** %20, align 8
  %173 = getelementptr inbounds [8 x i32], [8 x i32]* %172, i64 0, i64 7
  %174 = load i32, i32* %173, align 4
  %175 = load i32*, i32** %23, align 8
  %176 = getelementptr inbounds i32, i32* %175, i64 2
  %177 = load i32, i32* %176, align 4
  %178 = mul nsw i32 %174, %177
  %179 = load i32, i32* %25, align 4
  %180 = add i32 %179, %178
  store i32 %180, i32* %25, align 4
  %181 = load i32, i32* %25, align 4
  %182 = sub i32 0, %181
  store i32 %182, i32* %25, align 4
  %183 = load [32 x i32]*, [32 x i32]** %22, align 8
  %184 = getelementptr inbounds [32 x i32], [32 x i32]* %183, i32 0, i32 0
  %185 = load i32, i32* %13, align 4
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds i32, i32* %184, i64 %186
  store i32* %187, i32** %23, align 8
  %188 = load [8 x i32]*, [8 x i32]** %19, align 8
  %189 = getelementptr inbounds [8 x i32], [8 x i32]* %188, i64 0, i64 0
  %190 = load i32, i32* %189, align 4
  %191 = load i32*, i32** %23, align 8
  %192 = getelementptr inbounds i32, i32* %191, i64 0
  %193 = load i32, i32* %192, align 4
  %194 = mul nsw i32 %190, %193
  %195 = load i32, i32* %25, align 4
  %196 = add i32 %195, %194
  store i32 %196, i32* %25, align 4
  %197 = load [8 x i32]*, [8 x i32]** %19, align 8
  %198 = getelementptr inbounds [8 x i32], [8 x i32]* %197, i64 0, i64 1
  %199 = load i32, i32* %198, align 4
  %200 = load i32*, i32** %23, align 8
  %201 = getelementptr inbounds i32, i32* %200, i64 14
  %202 = load i32, i32* %201, align 4
  %203 = mul nsw i32 %199, %202
  %204 = load i32, i32* %25, align 4
  %205 = add i32 %204, %203
  store i32 %205, i32* %25, align 4
  %206 = load [8 x i32]*, [8 x i32]** %19, align 8
  %207 = getelementptr inbounds [8 x i32], [8 x i32]* %206, i64 0, i64 2
  %208 = load i32, i32* %207, align 4
  %209 = load i32*, i32** %23, align 8
  %210 = getelementptr inbounds i32, i32* %209, i64 12
  %211 = load i32, i32* %210, align 4
  %212 = mul nsw i32 %208, %211
  %213 = load i32, i32* %25, align 4
  %214 = add i32 %213, %212
  store i32 %214, i32* %25, align 4
  %215 = load [8 x i32]*, [8 x i32]** %19, align 8
  %216 = getelementptr inbounds [8 x i32], [8 x i32]* %215, i64 0, i64 3
  %217 = load i32, i32* %216, align 4
  %218 = load i32*, i32** %23, align 8
  %219 = getelementptr inbounds i32, i32* %218, i64 10
  %220 = load i32, i32* %219, align 4
  %221 = mul nsw i32 %217, %220
  %222 = load i32, i32* %25, align 4
  %223 = add i32 %222, %221
  store i32 %223, i32* %25, align 4
  %224 = load [8 x i32]*, [8 x i32]** %19, align 8
  %225 = getelementptr inbounds [8 x i32], [8 x i32]* %224, i64 0, i64 4
  %226 = load i32, i32* %225, align 4
  %227 = load i32*, i32** %23, align 8
  %228 = getelementptr inbounds i32, i32* %227, i64 8
  %229 = load i32, i32* %228, align 4
  %230 = mul nsw i32 %226, %229
  %231 = load i32, i32* %25, align 4
  %232 = add i32 %231, %230
  store i32 %232, i32* %25, align 4
  %233 = load [8 x i32]*, [8 x i32]** %19, align 8
  %234 = getelementptr inbounds [8 x i32], [8 x i32]* %233, i64 0, i64 5
  %235 = load i32, i32* %234, align 4
  %236 = load i32*, i32** %23, align 8
  %237 = getelementptr inbounds i32, i32* %236, i64 6
  %238 = load i32, i32* %237, align 4
  %239 = mul nsw i32 %235, %238
  %240 = load i32, i32* %25, align 4
  %241 = add i32 %240, %239
  store i32 %241, i32* %25, align 4
  %242 = load [8 x i32]*, [8 x i32]** %19, align 8
  %243 = getelementptr inbounds [8 x i32], [8 x i32]* %242, i64 0, i64 6
  %244 = load i32, i32* %243, align 4
  %245 = load i32*, i32** %23, align 8
  %246 = getelementptr inbounds i32, i32* %245, i64 4
  %247 = load i32, i32* %246, align 4
  %248 = mul nsw i32 %244, %247
  %249 = load i32, i32* %25, align 4
  %250 = add i32 %249, %248
  store i32 %250, i32* %25, align 4
  %251 = load [8 x i32]*, [8 x i32]** %19, align 8
  %252 = getelementptr inbounds [8 x i32], [8 x i32]* %251, i64 0, i64 7
  %253 = load i32, i32* %252, align 4
  %254 = load i32*, i32** %23, align 8
  %255 = getelementptr inbounds i32, i32* %254, i64 2
  %256 = load i32, i32* %255, align 4
  %257 = mul nsw i32 %253, %256
  %258 = load i32, i32* %25, align 4
  %259 = add i32 %258, %257
  store i32 %259, i32* %25, align 4
  %260 = load i32, i32* %24, align 4
  %261 = load i32, i32* %25, align 4
  %262 = ashr i32 %261, 2
  %263 = load i32*, i32** %15, align 8
  %264 = getelementptr inbounds i32, i32* %263, i32 1
  store i32* %264, i32** %15, align 8
  store i32 %262, i32* %263, align 4
  %265 = load i32*, i32** %15, align 8
  %266 = getelementptr inbounds i32, i32* %265, i64 14
  store i32* %266, i32** %16, align 8
  store i32 1, i32* %12, align 4
  br label %267

; <label>:267:                                    ; preds = %601, %55
  %268 = load i32, i32* %12, align 4
  %269 = icmp ult i32 %268, 16
  br i1 %269, label %270, label %605

; <label>:270:                                    ; preds = %267
  %271 = load [8 x i32]*, [8 x i32]** %19, align 8
  %272 = getelementptr inbounds [8 x i32], [8 x i32]* %271, i32 1
  store [8 x i32]* %272, [8 x i32]** %19, align 8
  %273 = load [32 x i32]*, [32 x i32]** %22, align 8
  %274 = getelementptr inbounds [32 x i32], [32 x i32]* %273, i32 1
  store [32 x i32]* %274, [32 x i32]** %22, align 8
  %275 = load i32, i32* %12, align 4
  %276 = and i32 %275, 1
  %277 = icmp ne i32 %276, 0
  br i1 %277, label %598, label %278

; <label>:278:                                    ; preds = %270
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 1)
  %279 = add i64 %pgocount, 1
  store i64 %279, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 1)
  %280 = load [32 x i32]*, [32 x i32]** %22, align 8
  %281 = getelementptr inbounds [32 x i32], [32 x i32]* %280, i32 0, i32 0
  %282 = load i32, i32* %14, align 4
  %283 = zext i32 %282 to i64
  %284 = getelementptr inbounds i32, i32* %281, i64 %283
  store i32* %284, i32** %23, align 8
  %285 = load [8 x i32]*, [8 x i32]** %21, align 8
  %286 = getelementptr inbounds [8 x i32], [8 x i32]* %285, i64 0, i64 0
  %287 = load i32, i32* %286, align 4
  %288 = load i32*, i32** %23, align 8
  %289 = getelementptr inbounds i32, i32* %288, i64 0
  %290 = load i32, i32* %289, align 4
  %291 = mul nsw i32 %287, %290
  store i32 %291, i32* %25, align 4
  %292 = load [8 x i32]*, [8 x i32]** %21, align 8
  %293 = getelementptr inbounds [8 x i32], [8 x i32]* %292, i64 0, i64 1
  %294 = load i32, i32* %293, align 4
  %295 = load i32*, i32** %23, align 8
  %296 = getelementptr inbounds i32, i32* %295, i64 14
  %297 = load i32, i32* %296, align 4
  %298 = mul nsw i32 %294, %297
  %299 = load i32, i32* %25, align 4
  %300 = add i32 %299, %298
  store i32 %300, i32* %25, align 4
  %301 = load [8 x i32]*, [8 x i32]** %21, align 8
  %302 = getelementptr inbounds [8 x i32], [8 x i32]* %301, i64 0, i64 2
  %303 = load i32, i32* %302, align 4
  %304 = load i32*, i32** %23, align 8
  %305 = getelementptr inbounds i32, i32* %304, i64 12
  %306 = load i32, i32* %305, align 4
  %307 = mul nsw i32 %303, %306
  %308 = load i32, i32* %25, align 4
  %309 = add i32 %308, %307
  store i32 %309, i32* %25, align 4
  %310 = load [8 x i32]*, [8 x i32]** %21, align 8
  %311 = getelementptr inbounds [8 x i32], [8 x i32]* %310, i64 0, i64 3
  %312 = load i32, i32* %311, align 4
  %313 = load i32*, i32** %23, align 8
  %314 = getelementptr inbounds i32, i32* %313, i64 10
  %315 = load i32, i32* %314, align 4
  %316 = mul nsw i32 %312, %315
  %317 = load i32, i32* %25, align 4
  %318 = add i32 %317, %316
  store i32 %318, i32* %25, align 4
  %319 = load [8 x i32]*, [8 x i32]** %21, align 8
  %320 = getelementptr inbounds [8 x i32], [8 x i32]* %319, i64 0, i64 4
  %321 = load i32, i32* %320, align 4
  %322 = load i32*, i32** %23, align 8
  %323 = getelementptr inbounds i32, i32* %322, i64 8
  %324 = load i32, i32* %323, align 4
  %325 = mul nsw i32 %321, %324
  %326 = load i32, i32* %25, align 4
  %327 = add i32 %326, %325
  store i32 %327, i32* %25, align 4
  %328 = load [8 x i32]*, [8 x i32]** %21, align 8
  %329 = getelementptr inbounds [8 x i32], [8 x i32]* %328, i64 0, i64 5
  %330 = load i32, i32* %329, align 4
  %331 = load i32*, i32** %23, align 8
  %332 = getelementptr inbounds i32, i32* %331, i64 6
  %333 = load i32, i32* %332, align 4
  %334 = mul nsw i32 %330, %333
  %335 = load i32, i32* %25, align 4
  %336 = add i32 %335, %334
  store i32 %336, i32* %25, align 4
  %337 = load [8 x i32]*, [8 x i32]** %21, align 8
  %338 = getelementptr inbounds [8 x i32], [8 x i32]* %337, i64 0, i64 6
  %339 = load i32, i32* %338, align 4
  %340 = load i32*, i32** %23, align 8
  %341 = getelementptr inbounds i32, i32* %340, i64 4
  %342 = load i32, i32* %341, align 4
  %343 = mul nsw i32 %339, %342
  %344 = load i32, i32* %25, align 4
  %345 = add i32 %344, %343
  store i32 %345, i32* %25, align 4
  %346 = load [8 x i32]*, [8 x i32]** %21, align 8
  %347 = getelementptr inbounds [8 x i32], [8 x i32]* %346, i64 0, i64 7
  %348 = load i32, i32* %347, align 4
  %349 = load i32*, i32** %23, align 8
  %350 = getelementptr inbounds i32, i32* %349, i64 2
  %351 = load i32, i32* %350, align 4
  %352 = mul nsw i32 %348, %351
  %353 = load i32, i32* %25, align 4
  %354 = add i32 %353, %352
  store i32 %354, i32* %25, align 4
  %355 = load i32, i32* %25, align 4
  %356 = sub i32 0, %355
  store i32 %356, i32* %25, align 4
  %357 = load [32 x i32]*, [32 x i32]** %22, align 8
  %358 = getelementptr inbounds [32 x i32], [32 x i32]* %357, i32 0, i32 0
  %359 = load i32, i32* %13, align 4
  %360 = zext i32 %359 to i64
  %361 = getelementptr inbounds i32, i32* %358, i64 %360
  store i32* %361, i32** %23, align 8
  %362 = load [8 x i32]*, [8 x i32]** %19, align 8
  %363 = getelementptr inbounds [8 x i32], [8 x i32]* %362, i64 0, i64 7
  %364 = load i32, i32* %363, align 4
  %365 = load i32*, i32** %23, align 8
  %366 = getelementptr inbounds i32, i32* %365, i64 2
  %367 = load i32, i32* %366, align 4
  %368 = mul nsw i32 %364, %367
  %369 = load i32, i32* %25, align 4
  %370 = add i32 %369, %368
  store i32 %370, i32* %25, align 4
  %371 = load [8 x i32]*, [8 x i32]** %19, align 8
  %372 = getelementptr inbounds [8 x i32], [8 x i32]* %371, i64 0, i64 6
  %373 = load i32, i32* %372, align 4
  %374 = load i32*, i32** %23, align 8
  %375 = getelementptr inbounds i32, i32* %374, i64 4
  %376 = load i32, i32* %375, align 4
  %377 = mul nsw i32 %373, %376
  %378 = load i32, i32* %25, align 4
  %379 = add i32 %378, %377
  store i32 %379, i32* %25, align 4
  %380 = load [8 x i32]*, [8 x i32]** %19, align 8
  %381 = getelementptr inbounds [8 x i32], [8 x i32]* %380, i64 0, i64 5
  %382 = load i32, i32* %381, align 4
  %383 = load i32*, i32** %23, align 8
  %384 = getelementptr inbounds i32, i32* %383, i64 6
  %385 = load i32, i32* %384, align 4
  %386 = mul nsw i32 %382, %385
  %387 = load i32, i32* %25, align 4
  %388 = add i32 %387, %386
  store i32 %388, i32* %25, align 4
  %389 = load [8 x i32]*, [8 x i32]** %19, align 8
  %390 = getelementptr inbounds [8 x i32], [8 x i32]* %389, i64 0, i64 4
  %391 = load i32, i32* %390, align 4
  %392 = load i32*, i32** %23, align 8
  %393 = getelementptr inbounds i32, i32* %392, i64 8
  %394 = load i32, i32* %393, align 4
  %395 = mul nsw i32 %391, %394
  %396 = load i32, i32* %25, align 4
  %397 = add i32 %396, %395
  store i32 %397, i32* %25, align 4
  %398 = load [8 x i32]*, [8 x i32]** %19, align 8
  %399 = getelementptr inbounds [8 x i32], [8 x i32]* %398, i64 0, i64 3
  %400 = load i32, i32* %399, align 4
  %401 = load i32*, i32** %23, align 8
  %402 = getelementptr inbounds i32, i32* %401, i64 10
  %403 = load i32, i32* %402, align 4
  %404 = mul nsw i32 %400, %403
  %405 = load i32, i32* %25, align 4
  %406 = add i32 %405, %404
  store i32 %406, i32* %25, align 4
  %407 = load [8 x i32]*, [8 x i32]** %19, align 8
  %408 = getelementptr inbounds [8 x i32], [8 x i32]* %407, i64 0, i64 2
  %409 = load i32, i32* %408, align 4
  %410 = load i32*, i32** %23, align 8
  %411 = getelementptr inbounds i32, i32* %410, i64 12
  %412 = load i32, i32* %411, align 4
  %413 = mul nsw i32 %409, %412
  %414 = load i32, i32* %25, align 4
  %415 = add i32 %414, %413
  store i32 %415, i32* %25, align 4
  %416 = load [8 x i32]*, [8 x i32]** %19, align 8
  %417 = getelementptr inbounds [8 x i32], [8 x i32]* %416, i64 0, i64 1
  %418 = load i32, i32* %417, align 4
  %419 = load i32*, i32** %23, align 8
  %420 = getelementptr inbounds i32, i32* %419, i64 14
  %421 = load i32, i32* %420, align 4
  %422 = mul nsw i32 %418, %421
  %423 = load i32, i32* %25, align 4
  %424 = add i32 %423, %422
  store i32 %424, i32* %25, align 4
  %425 = load [8 x i32]*, [8 x i32]** %19, align 8
  %426 = getelementptr inbounds [8 x i32], [8 x i32]* %425, i64 0, i64 0
  %427 = load i32, i32* %426, align 4
  %428 = load i32*, i32** %23, align 8
  %429 = getelementptr inbounds i32, i32* %428, i64 0
  %430 = load i32, i32* %429, align 4
  %431 = mul nsw i32 %427, %430
  %432 = load i32, i32* %25, align 4
  %433 = add i32 %432, %431
  store i32 %433, i32* %25, align 4
  %434 = load i32, i32* %24, align 4
  %435 = load i32, i32* %25, align 4
  %436 = ashr i32 %435, 2
  %437 = load i32*, i32** %15, align 8
  %438 = getelementptr inbounds i32, i32* %437, i32 1
  store i32* %438, i32** %15, align 8
  store i32 %436, i32* %437, align 4
  %439 = load [32 x i32]*, [32 x i32]** %22, align 8
  %440 = getelementptr inbounds [32 x i32], [32 x i32]* %439, i32 0, i32 0
  %441 = load i32, i32* %14, align 4
  %442 = zext i32 %441 to i64
  %443 = sub i64 0, %442
  %444 = getelementptr inbounds i32, i32* %440, i64 %443
  store i32* %444, i32** %23, align 8
  %445 = load [8 x i32]*, [8 x i32]** %21, align 8
  %446 = getelementptr inbounds [8 x i32], [8 x i32]* %445, i64 0, i64 7
  %447 = load i32, i32* %446, align 4
  %448 = load i32*, i32** %23, align 8
  %449 = getelementptr inbounds i32, i32* %448, i64 29
  %450 = load i32, i32* %449, align 4
  %451 = mul nsw i32 %447, %450
  store i32 %451, i32* %25, align 4
  %452 = load [8 x i32]*, [8 x i32]** %21, align 8
  %453 = getelementptr inbounds [8 x i32], [8 x i32]* %452, i64 0, i64 6
  %454 = load i32, i32* %453, align 4
  %455 = load i32*, i32** %23, align 8
  %456 = getelementptr inbounds i32, i32* %455, i64 27
  %457 = load i32, i32* %456, align 4
  %458 = mul nsw i32 %454, %457
  %459 = load i32, i32* %25, align 4
  %460 = add i32 %459, %458
  store i32 %460, i32* %25, align 4
  %461 = load [8 x i32]*, [8 x i32]** %21, align 8
  %462 = getelementptr inbounds [8 x i32], [8 x i32]* %461, i64 0, i64 5
  %463 = load i32, i32* %462, align 4
  %464 = load i32*, i32** %23, align 8
  %465 = getelementptr inbounds i32, i32* %464, i64 25
  %466 = load i32, i32* %465, align 4
  %467 = mul nsw i32 %463, %466
  %468 = load i32, i32* %25, align 4
  %469 = add i32 %468, %467
  store i32 %469, i32* %25, align 4
  %470 = load [8 x i32]*, [8 x i32]** %21, align 8
  %471 = getelementptr inbounds [8 x i32], [8 x i32]* %470, i64 0, i64 4
  %472 = load i32, i32* %471, align 4
  %473 = load i32*, i32** %23, align 8
  %474 = getelementptr inbounds i32, i32* %473, i64 23
  %475 = load i32, i32* %474, align 4
  %476 = mul nsw i32 %472, %475
  %477 = load i32, i32* %25, align 4
  %478 = add i32 %477, %476
  store i32 %478, i32* %25, align 4
  %479 = load [8 x i32]*, [8 x i32]** %21, align 8
  %480 = getelementptr inbounds [8 x i32], [8 x i32]* %479, i64 0, i64 3
  %481 = load i32, i32* %480, align 4
  %482 = load i32*, i32** %23, align 8
  %483 = getelementptr inbounds i32, i32* %482, i64 21
  %484 = load i32, i32* %483, align 4
  %485 = mul nsw i32 %481, %484
  %486 = load i32, i32* %25, align 4
  %487 = add i32 %486, %485
  store i32 %487, i32* %25, align 4
  %488 = load [8 x i32]*, [8 x i32]** %21, align 8
  %489 = getelementptr inbounds [8 x i32], [8 x i32]* %488, i64 0, i64 2
  %490 = load i32, i32* %489, align 4
  %491 = load i32*, i32** %23, align 8
  %492 = getelementptr inbounds i32, i32* %491, i64 19
  %493 = load i32, i32* %492, align 4
  %494 = mul nsw i32 %490, %493
  %495 = load i32, i32* %25, align 4
  %496 = add i32 %495, %494
  store i32 %496, i32* %25, align 4
  %497 = load [8 x i32]*, [8 x i32]** %21, align 8
  %498 = getelementptr inbounds [8 x i32], [8 x i32]* %497, i64 0, i64 1
  %499 = load i32, i32* %498, align 4
  %500 = load i32*, i32** %23, align 8
  %501 = getelementptr inbounds i32, i32* %500, i64 17
  %502 = load i32, i32* %501, align 4
  %503 = mul nsw i32 %499, %502
  %504 = load i32, i32* %25, align 4
  %505 = add i32 %504, %503
  store i32 %505, i32* %25, align 4
  %506 = load [8 x i32]*, [8 x i32]** %21, align 8
  %507 = getelementptr inbounds [8 x i32], [8 x i32]* %506, i64 0, i64 0
  %508 = load i32, i32* %507, align 4
  %509 = load i32*, i32** %23, align 8
  %510 = getelementptr inbounds i32, i32* %509, i64 15
  %511 = load i32, i32* %510, align 4
  %512 = mul nsw i32 %508, %511
  %513 = load i32, i32* %25, align 4
  %514 = add i32 %513, %512
  store i32 %514, i32* %25, align 4
  %515 = load [32 x i32]*, [32 x i32]** %22, align 8
  %516 = getelementptr inbounds [32 x i32], [32 x i32]* %515, i32 0, i32 0
  %517 = load i32, i32* %13, align 4
  %518 = zext i32 %517 to i64
  %519 = sub i64 0, %518
  %520 = getelementptr inbounds i32, i32* %516, i64 %519
  store i32* %520, i32** %23, align 8
  %521 = load [8 x i32]*, [8 x i32]** %19, align 8
  %522 = getelementptr inbounds [8 x i32], [8 x i32]* %521, i64 0, i64 0
  %523 = load i32, i32* %522, align 4
  %524 = load i32*, i32** %23, align 8
  %525 = getelementptr inbounds i32, i32* %524, i64 15
  %526 = load i32, i32* %525, align 4
  %527 = mul nsw i32 %523, %526
  %528 = load i32, i32* %25, align 4
  %529 = add i32 %528, %527
  store i32 %529, i32* %25, align 4
  %530 = load [8 x i32]*, [8 x i32]** %19, align 8
  %531 = getelementptr inbounds [8 x i32], [8 x i32]* %530, i64 0, i64 1
  %532 = load i32, i32* %531, align 4
  %533 = load i32*, i32** %23, align 8
  %534 = getelementptr inbounds i32, i32* %533, i64 17
  %535 = load i32, i32* %534, align 4
  %536 = mul nsw i32 %532, %535
  %537 = load i32, i32* %25, align 4
  %538 = add i32 %537, %536
  store i32 %538, i32* %25, align 4
  %539 = load [8 x i32]*, [8 x i32]** %19, align 8
  %540 = getelementptr inbounds [8 x i32], [8 x i32]* %539, i64 0, i64 2
  %541 = load i32, i32* %540, align 4
  %542 = load i32*, i32** %23, align 8
  %543 = getelementptr inbounds i32, i32* %542, i64 19
  %544 = load i32, i32* %543, align 4
  %545 = mul nsw i32 %541, %544
  %546 = load i32, i32* %25, align 4
  %547 = add i32 %546, %545
  store i32 %547, i32* %25, align 4
  %548 = load [8 x i32]*, [8 x i32]** %19, align 8
  %549 = getelementptr inbounds [8 x i32], [8 x i32]* %548, i64 0, i64 3
  %550 = load i32, i32* %549, align 4
  %551 = load i32*, i32** %23, align 8
  %552 = getelementptr inbounds i32, i32* %551, i64 21
  %553 = load i32, i32* %552, align 4
  %554 = mul nsw i32 %550, %553
  %555 = load i32, i32* %25, align 4
  %556 = add i32 %555, %554
  store i32 %556, i32* %25, align 4
  %557 = load [8 x i32]*, [8 x i32]** %19, align 8
  %558 = getelementptr inbounds [8 x i32], [8 x i32]* %557, i64 0, i64 4
  %559 = load i32, i32* %558, align 4
  %560 = load i32*, i32** %23, align 8
  %561 = getelementptr inbounds i32, i32* %560, i64 23
  %562 = load i32, i32* %561, align 4
  %563 = mul nsw i32 %559, %562
  %564 = load i32, i32* %25, align 4
  %565 = add i32 %564, %563
  store i32 %565, i32* %25, align 4
  %566 = load [8 x i32]*, [8 x i32]** %19, align 8
  %567 = getelementptr inbounds [8 x i32], [8 x i32]* %566, i64 0, i64 5
  %568 = load i32, i32* %567, align 4
  %569 = load i32*, i32** %23, align 8
  %570 = getelementptr inbounds i32, i32* %569, i64 25
  %571 = load i32, i32* %570, align 4
  %572 = mul nsw i32 %568, %571
  %573 = load i32, i32* %25, align 4
  %574 = add i32 %573, %572
  store i32 %574, i32* %25, align 4
  %575 = load [8 x i32]*, [8 x i32]** %19, align 8
  %576 = getelementptr inbounds [8 x i32], [8 x i32]* %575, i64 0, i64 6
  %577 = load i32, i32* %576, align 4
  %578 = load i32*, i32** %23, align 8
  %579 = getelementptr inbounds i32, i32* %578, i64 27
  %580 = load i32, i32* %579, align 4
  %581 = mul nsw i32 %577, %580
  %582 = load i32, i32* %25, align 4
  %583 = add i32 %582, %581
  store i32 %583, i32* %25, align 4
  %584 = load [8 x i32]*, [8 x i32]** %19, align 8
  %585 = getelementptr inbounds [8 x i32], [8 x i32]* %584, i64 0, i64 7
  %586 = load i32, i32* %585, align 4
  %587 = load i32*, i32** %23, align 8
  %588 = getelementptr inbounds i32, i32* %587, i64 29
  %589 = load i32, i32* %588, align 4
  %590 = mul nsw i32 %586, %589
  %591 = load i32, i32* %25, align 4
  %592 = add i32 %591, %590
  store i32 %592, i32* %25, align 4
  %593 = load i32, i32* %24, align 4
  %594 = load i32, i32* %25, align 4
  %595 = ashr i32 %594, 2
  %596 = load i32*, i32** %16, align 8
  %597 = getelementptr inbounds i32, i32* %596, i32 -1
  store i32* %597, i32** %16, align 8
  store i32 %595, i32* %596, align 4
  br label %598

; <label>:598:                                    ; preds = %278, %270
  %599 = load [8 x i32]*, [8 x i32]** %21, align 8
  %600 = getelementptr inbounds [8 x i32], [8 x i32]* %599, i32 1
  store [8 x i32]* %600, [8 x i32]** %21, align 8
  br label %601

; <label>:601:                                    ; preds = %598
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 0)
  %602 = add i64 %pgocount1, 1
  store i64 %602, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 0)
  %603 = load i32, i32* %12, align 4
  %604 = add i32 %603, 1
  store i32 %604, i32* %12, align 4
  br label %267

; <label>:605:                                    ; preds = %267
  %606 = load [32 x i32]*, [32 x i32]** %22, align 8
  %607 = getelementptr inbounds [32 x i32], [32 x i32]* %606, i32 1
  store [32 x i32]* %607, [32 x i32]** %22, align 8
  %608 = load [32 x i32]*, [32 x i32]** %22, align 8
  %609 = getelementptr inbounds [32 x i32], [32 x i32]* %608, i32 0, i32 0
  %610 = load i32, i32* %14, align 4
  %611 = zext i32 %610 to i64
  %612 = getelementptr inbounds i32, i32* %609, i64 %611
  store i32* %612, i32** %23, align 8
  %613 = load [8 x i32]*, [8 x i32]** %21, align 8
  %614 = getelementptr inbounds [8 x i32], [8 x i32]* %613, i64 0, i64 0
  %615 = load i32, i32* %614, align 4
  %616 = load i32*, i32** %23, align 8
  %617 = getelementptr inbounds i32, i32* %616, i64 0
  %618 = load i32, i32* %617, align 4
  %619 = mul nsw i32 %615, %618
  store i32 %619, i32* %25, align 4
  %620 = load [8 x i32]*, [8 x i32]** %21, align 8
  %621 = getelementptr inbounds [8 x i32], [8 x i32]* %620, i64 0, i64 1
  %622 = load i32, i32* %621, align 4
  %623 = load i32*, i32** %23, align 8
  %624 = getelementptr inbounds i32, i32* %623, i64 14
  %625 = load i32, i32* %624, align 4
  %626 = mul nsw i32 %622, %625
  %627 = load i32, i32* %25, align 4
  %628 = add i32 %627, %626
  store i32 %628, i32* %25, align 4
  %629 = load [8 x i32]*, [8 x i32]** %21, align 8
  %630 = getelementptr inbounds [8 x i32], [8 x i32]* %629, i64 0, i64 2
  %631 = load i32, i32* %630, align 4
  %632 = load i32*, i32** %23, align 8
  %633 = getelementptr inbounds i32, i32* %632, i64 12
  %634 = load i32, i32* %633, align 4
  %635 = mul nsw i32 %631, %634
  %636 = load i32, i32* %25, align 4
  %637 = add i32 %636, %635
  store i32 %637, i32* %25, align 4
  %638 = load [8 x i32]*, [8 x i32]** %21, align 8
  %639 = getelementptr inbounds [8 x i32], [8 x i32]* %638, i64 0, i64 3
  %640 = load i32, i32* %639, align 4
  %641 = load i32*, i32** %23, align 8
  %642 = getelementptr inbounds i32, i32* %641, i64 10
  %643 = load i32, i32* %642, align 4
  %644 = mul nsw i32 %640, %643
  %645 = load i32, i32* %25, align 4
  %646 = add i32 %645, %644
  store i32 %646, i32* %25, align 4
  %647 = load [8 x i32]*, [8 x i32]** %21, align 8
  %648 = getelementptr inbounds [8 x i32], [8 x i32]* %647, i64 0, i64 4
  %649 = load i32, i32* %648, align 4
  %650 = load i32*, i32** %23, align 8
  %651 = getelementptr inbounds i32, i32* %650, i64 8
  %652 = load i32, i32* %651, align 4
  %653 = mul nsw i32 %649, %652
  %654 = load i32, i32* %25, align 4
  %655 = add i32 %654, %653
  store i32 %655, i32* %25, align 4
  %656 = load [8 x i32]*, [8 x i32]** %21, align 8
  %657 = getelementptr inbounds [8 x i32], [8 x i32]* %656, i64 0, i64 5
  %658 = load i32, i32* %657, align 4
  %659 = load i32*, i32** %23, align 8
  %660 = getelementptr inbounds i32, i32* %659, i64 6
  %661 = load i32, i32* %660, align 4
  %662 = mul nsw i32 %658, %661
  %663 = load i32, i32* %25, align 4
  %664 = add i32 %663, %662
  store i32 %664, i32* %25, align 4
  %665 = load [8 x i32]*, [8 x i32]** %21, align 8
  %666 = getelementptr inbounds [8 x i32], [8 x i32]* %665, i64 0, i64 6
  %667 = load i32, i32* %666, align 4
  %668 = load i32*, i32** %23, align 8
  %669 = getelementptr inbounds i32, i32* %668, i64 4
  %670 = load i32, i32* %669, align 4
  %671 = mul nsw i32 %667, %670
  %672 = load i32, i32* %25, align 4
  %673 = add i32 %672, %671
  store i32 %673, i32* %25, align 4
  %674 = load [8 x i32]*, [8 x i32]** %21, align 8
  %675 = getelementptr inbounds [8 x i32], [8 x i32]* %674, i64 0, i64 7
  %676 = load i32, i32* %675, align 4
  %677 = load i32*, i32** %23, align 8
  %678 = getelementptr inbounds i32, i32* %677, i64 2
  %679 = load i32, i32* %678, align 4
  %680 = mul nsw i32 %676, %679
  %681 = load i32, i32* %25, align 4
  %682 = add i32 %681, %680
  store i32 %682, i32* %25, align 4
  %683 = load i32, i32* %24, align 4
  %684 = load i32, i32* %25, align 4
  %685 = sub nsw i32 0, %684
  %686 = ashr i32 %685, 2
  %687 = load i32*, i32** %15, align 8
  store i32 %686, i32* %687, align 4
  %688 = load i32*, i32** %15, align 8
  %689 = getelementptr inbounds i32, i32* %688, i64 8
  store i32* %689, i32** %15, align 8
  %690 = load i32, i32* %9, align 4
  %691 = add i32 %690, 1
  %692 = urem i32 %691, 16
  store i32 %692, i32* %9, align 4
  br label %693

; <label>:693:                                    ; preds = %605
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 2)
  %694 = add i64 %pgocount2, 1
  store i64 %694, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 2)
  %695 = load i32, i32* %11, align 4
  %696 = add i32 %695, 1
  store i32 %696, i32* %11, align 4
  br label %51

; <label>:697:                                    ; preds = %51
  br label %698

; <label>:698:                                    ; preds = %697
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 3)
  %699 = add i64 %pgocount3, 1
  store i64 %699, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 3)
  %700 = load i32, i32* %10, align 4
  %701 = add i32 %700, 1
  store i32 %701, i32* %10, align 4
  br label %26

; <label>:702:                                    ; preds = %26
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 4)
  %703 = add i64 %pgocount4, 1
  store i64 %703, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_synth_half, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @dct32(i32*, i32, [8 x i32]*, [8 x i32]*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dct32, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dct32, i64 0, i64 0)
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca [8 x i32]*, align 8
  %9 = alloca [8 x i32]*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca i32, align 4
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca i32, align 4
  %56 = alloca i32, align 4
  %57 = alloca i32, align 4
  %58 = alloca i32, align 4
  %59 = alloca i32, align 4
  %60 = alloca i32, align 4
  %61 = alloca i32, align 4
  %62 = alloca i32, align 4
  %63 = alloca i32, align 4
  %64 = alloca i32, align 4
  %65 = alloca i32, align 4
  %66 = alloca i32, align 4
  %67 = alloca i32, align 4
  %68 = alloca i32, align 4
  %69 = alloca i32, align 4
  %70 = alloca i32, align 4
  %71 = alloca i32, align 4
  %72 = alloca i32, align 4
  %73 = alloca i32, align 4
  %74 = alloca i32, align 4
  %75 = alloca i32, align 4
  %76 = alloca i32, align 4
  %77 = alloca i32, align 4
  %78 = alloca i32, align 4
  %79 = alloca i32, align 4
  %80 = alloca i32, align 4
  %81 = alloca i32, align 4
  %82 = alloca i32, align 4
  %83 = alloca i32, align 4
  %84 = alloca i32, align 4
  %85 = alloca i32, align 4
  %86 = alloca i32, align 4
  %87 = alloca i32, align 4
  %88 = alloca i32, align 4
  %89 = alloca i32, align 4
  %90 = alloca i32, align 4
  %91 = alloca i32, align 4
  %92 = alloca i32, align 4
  %93 = alloca i32, align 4
  %94 = alloca i32, align 4
  %95 = alloca i32, align 4
  %96 = alloca i32, align 4
  %97 = alloca i32, align 4
  %98 = alloca i32, align 4
  %99 = alloca i32, align 4
  %100 = alloca i32, align 4
  %101 = alloca i32, align 4
  %102 = alloca i32, align 4
  %103 = alloca i32, align 4
  %104 = alloca i32, align 4
  %105 = alloca i32, align 4
  %106 = alloca i32, align 4
  %107 = alloca i32, align 4
  %108 = alloca i32, align 4
  %109 = alloca i32, align 4
  %110 = alloca i32, align 4
  %111 = alloca i32, align 4
  %112 = alloca i32, align 4
  %113 = alloca i32, align 4
  %114 = alloca i32, align 4
  %115 = alloca i32, align 4
  %116 = alloca i32, align 4
  %117 = alloca i32, align 4
  %118 = alloca i32, align 4
  %119 = alloca i32, align 4
  %120 = alloca i32, align 4
  %121 = alloca i32, align 4
  %122 = alloca i32, align 4
  %123 = alloca i32, align 4
  %124 = alloca i32, align 4
  %125 = alloca i32, align 4
  %126 = alloca i32, align 4
  %127 = alloca i32, align 4
  %128 = alloca i32, align 4
  %129 = alloca i32, align 4
  %130 = alloca i32, align 4
  %131 = alloca i32, align 4
  %132 = alloca i32, align 4
  %133 = alloca i32, align 4
  %134 = alloca i32, align 4
  %135 = alloca i32, align 4
  %136 = alloca i32, align 4
  %137 = alloca i32, align 4
  %138 = alloca i32, align 4
  %139 = alloca i32, align 4
  %140 = alloca i32, align 4
  %141 = alloca i32, align 4
  %142 = alloca i32, align 4
  %143 = alloca i32, align 4
  %144 = alloca i32, align 4
  %145 = alloca i32, align 4
  %146 = alloca i32, align 4
  %147 = alloca i32, align 4
  %148 = alloca i32, align 4
  %149 = alloca i32, align 4
  %150 = alloca i32, align 4
  %151 = alloca i32, align 4
  %152 = alloca i32, align 4
  %153 = alloca i32, align 4
  %154 = alloca i32, align 4
  %155 = alloca i32, align 4
  %156 = alloca i32, align 4
  %157 = alloca i32, align 4
  %158 = alloca i32, align 4
  %159 = alloca i32, align 4
  %160 = alloca i32, align 4
  %161 = alloca i32, align 4
  %162 = alloca i32, align 4
  %163 = alloca i32, align 4
  %164 = alloca i32, align 4
  %165 = alloca i32, align 4
  %166 = alloca i32, align 4
  %167 = alloca i32, align 4
  %168 = alloca i32, align 4
  %169 = alloca i32, align 4
  %170 = alloca i32, align 4
  %171 = alloca i32, align 4
  %172 = alloca i32, align 4
  %173 = alloca i32, align 4
  %174 = alloca i32, align 4
  %175 = alloca i32, align 4
  %176 = alloca i32, align 4
  %177 = alloca i32, align 4
  %178 = alloca i32, align 4
  %179 = alloca i32, align 4
  %180 = alloca i32, align 4
  %181 = alloca i32, align 4
  %182 = alloca i32, align 4
  %183 = alloca i32, align 4
  %184 = alloca i32, align 4
  %185 = alloca i32, align 4
  %186 = alloca i32, align 4
  store i32* %0, i32** %6, align 8
  store i32 %1, i32* %7, align 4
  store [8 x i32]* %2, [8 x i32]** %8, align 8
  store [8 x i32]* %3, [8 x i32]** %9, align 8
  %187 = load i32*, i32** %6, align 8
  %188 = getelementptr inbounds i32, i32* %187, i64 0
  %189 = load i32, i32* %188, align 4
  %190 = load i32*, i32** %6, align 8
  %191 = getelementptr inbounds i32, i32* %190, i64 31
  %192 = load i32, i32* %191, align 4
  %193 = add nsw i32 %189, %192
  store i32 %193, i32* %10, align 4
  %194 = load i32*, i32** %6, align 8
  %195 = getelementptr inbounds i32, i32* %194, i64 0
  %196 = load i32, i32* %195, align 4
  %197 = load i32*, i32** %6, align 8
  %198 = getelementptr inbounds i32, i32* %197, i64 31
  %199 = load i32, i32* %198, align 4
  %200 = sub nsw i32 %196, %199
  %201 = sext i32 %200 to i64
  %202 = add nsw i64 %201, 2048
  %203 = ashr i64 %202, 12
  %204 = mul nsw i64 %203, 4091
  %205 = trunc i64 %204 to i32
  store i32 %205, i32* %26, align 4
  %206 = load i32*, i32** %6, align 8
  %207 = getelementptr inbounds i32, i32* %206, i64 15
  %208 = load i32, i32* %207, align 4
  %209 = load i32*, i32** %6, align 8
  %210 = getelementptr inbounds i32, i32* %209, i64 16
  %211 = load i32, i32* %210, align 4
  %212 = add nsw i32 %208, %211
  store i32 %212, i32* %11, align 4
  %213 = load i32*, i32** %6, align 8
  %214 = getelementptr inbounds i32, i32* %213, i64 15
  %215 = load i32, i32* %214, align 4
  %216 = load i32*, i32** %6, align 8
  %217 = getelementptr inbounds i32, i32* %216, i64 16
  %218 = load i32, i32* %217, align 4
  %219 = sub nsw i32 %215, %218
  %220 = sext i32 %219 to i64
  %221 = add nsw i64 %220, 2048
  %222 = ashr i64 %221, 12
  %223 = mul nsw i64 %222, 201
  %224 = trunc i64 %223 to i32
  store i32 %224, i32* %27, align 4
  %225 = load i32, i32* %26, align 4
  %226 = load i32, i32* %27, align 4
  %227 = add nsw i32 %225, %226
  store i32 %227, i32* %51, align 4
  %228 = load i32, i32* %26, align 4
  %229 = load i32, i32* %27, align 4
  %230 = sub nsw i32 %228, %229
  %231 = sext i32 %230 to i64
  %232 = add nsw i64 %231, 2048
  %233 = ashr i64 %232, 12
  %234 = mul nsw i64 %233, 4076
  %235 = trunc i64 %234 to i32
  store i32 %235, i32* %69, align 4
  %236 = load i32, i32* %10, align 4
  %237 = load i32, i32* %11, align 4
  %238 = add nsw i32 %236, %237
  store i32 %238, i32* %43, align 4
  %239 = load i32, i32* %10, align 4
  %240 = load i32, i32* %11, align 4
  %241 = sub nsw i32 %239, %240
  %242 = sext i32 %241 to i64
  %243 = add nsw i64 %242, 2048
  %244 = ashr i64 %243, 12
  %245 = mul nsw i64 %244, 4076
  %246 = trunc i64 %245 to i32
  store i32 %246, i32* %60, align 4
  %247 = load i32*, i32** %6, align 8
  %248 = getelementptr inbounds i32, i32* %247, i64 7
  %249 = load i32, i32* %248, align 4
  %250 = load i32*, i32** %6, align 8
  %251 = getelementptr inbounds i32, i32* %250, i64 24
  %252 = load i32, i32* %251, align 4
  %253 = add nsw i32 %249, %252
  store i32 %253, i32* %12, align 4
  %254 = load i32*, i32** %6, align 8
  %255 = getelementptr inbounds i32, i32* %254, i64 7
  %256 = load i32, i32* %255, align 4
  %257 = load i32*, i32** %6, align 8
  %258 = getelementptr inbounds i32, i32* %257, i64 24
  %259 = load i32, i32* %258, align 4
  %260 = sub nsw i32 %256, %259
  %261 = sext i32 %260 to i64
  %262 = add nsw i64 %261, 2048
  %263 = ashr i64 %262, 12
  %264 = mul nsw i64 %263, 3035
  %265 = trunc i64 %264 to i32
  store i32 %265, i32* %28, align 4
  %266 = load i32*, i32** %6, align 8
  %267 = getelementptr inbounds i32, i32* %266, i64 8
  %268 = load i32, i32* %267, align 4
  %269 = load i32*, i32** %6, align 8
  %270 = getelementptr inbounds i32, i32* %269, i64 23
  %271 = load i32, i32* %270, align 4
  %272 = add nsw i32 %268, %271
  store i32 %272, i32* %13, align 4
  %273 = load i32*, i32** %6, align 8
  %274 = getelementptr inbounds i32, i32* %273, i64 8
  %275 = load i32, i32* %274, align 4
  %276 = load i32*, i32** %6, align 8
  %277 = getelementptr inbounds i32, i32* %276, i64 23
  %278 = load i32, i32* %277, align 4
  %279 = sub nsw i32 %275, %278
  %280 = sext i32 %279 to i64
  %281 = add nsw i64 %280, 2048
  %282 = ashr i64 %281, 12
  %283 = mul nsw i64 %282, 2751
  %284 = trunc i64 %283 to i32
  store i32 %284, i32* %29, align 4
  %285 = load i32, i32* %28, align 4
  %286 = load i32, i32* %29, align 4
  %287 = add nsw i32 %285, %286
  store i32 %287, i32* %52, align 4
  %288 = load i32, i32* %28, align 4
  %289 = load i32, i32* %29, align 4
  %290 = sub nsw i32 %288, %289
  %291 = sext i32 %290 to i64
  %292 = add nsw i64 %291, 2048
  %293 = ashr i64 %292, 12
  %294 = mul nsw i64 %293, 401
  %295 = trunc i64 %294 to i32
  store i32 %295, i32* %70, align 4
  %296 = load i32, i32* %12, align 4
  %297 = load i32, i32* %13, align 4
  %298 = add nsw i32 %296, %297
  store i32 %298, i32* %44, align 4
  %299 = load i32, i32* %12, align 4
  %300 = load i32, i32* %13, align 4
  %301 = sub nsw i32 %299, %300
  %302 = sext i32 %301 to i64
  %303 = add nsw i64 %302, 2048
  %304 = ashr i64 %303, 12
  %305 = mul nsw i64 %304, 401
  %306 = trunc i64 %305 to i32
  store i32 %306, i32* %61, align 4
  %307 = load i32*, i32** %6, align 8
  %308 = getelementptr inbounds i32, i32* %307, i64 3
  %309 = load i32, i32* %308, align 4
  %310 = load i32*, i32** %6, align 8
  %311 = getelementptr inbounds i32, i32* %310, i64 28
  %312 = load i32, i32* %311, align 4
  %313 = add nsw i32 %309, %312
  store i32 %313, i32* %14, align 4
  %314 = load i32*, i32** %6, align 8
  %315 = getelementptr inbounds i32, i32* %314, i64 3
  %316 = load i32, i32* %315, align 4
  %317 = load i32*, i32** %6, align 8
  %318 = getelementptr inbounds i32, i32* %317, i64 28
  %319 = load i32, i32* %318, align 4
  %320 = sub nsw i32 %316, %319
  %321 = sext i32 %320 to i64
  %322 = add nsw i64 %321, 2048
  %323 = ashr i64 %322, 12
  %324 = mul nsw i64 %323, 3857
  %325 = trunc i64 %324 to i32
  store i32 %325, i32* %30, align 4
  %326 = load i32*, i32** %6, align 8
  %327 = getelementptr inbounds i32, i32* %326, i64 12
  %328 = load i32, i32* %327, align 4
  %329 = load i32*, i32** %6, align 8
  %330 = getelementptr inbounds i32, i32* %329, i64 19
  %331 = load i32, i32* %330, align 4
  %332 = add nsw i32 %328, %331
  store i32 %332, i32* %15, align 4
  %333 = load i32*, i32** %6, align 8
  %334 = getelementptr inbounds i32, i32* %333, i64 12
  %335 = load i32, i32* %334, align 4
  %336 = load i32*, i32** %6, align 8
  %337 = getelementptr inbounds i32, i32* %336, i64 19
  %338 = load i32, i32* %337, align 4
  %339 = sub nsw i32 %335, %338
  %340 = sext i32 %339 to i64
  %341 = add nsw i64 %340, 2048
  %342 = ashr i64 %341, 12
  %343 = mul nsw i64 %342, 1380
  %344 = trunc i64 %343 to i32
  store i32 %344, i32* %31, align 4
  %345 = load i32, i32* %30, align 4
  %346 = load i32, i32* %31, align 4
  %347 = add nsw i32 %345, %346
  store i32 %347, i32* %53, align 4
  %348 = load i32, i32* %30, align 4
  %349 = load i32, i32* %31, align 4
  %350 = sub nsw i32 %348, %349
  %351 = sext i32 %350 to i64
  %352 = add nsw i64 %351, 2048
  %353 = ashr i64 %352, 12
  %354 = mul nsw i64 %353, 3166
  %355 = trunc i64 %354 to i32
  store i32 %355, i32* %71, align 4
  %356 = load i32, i32* %14, align 4
  %357 = load i32, i32* %15, align 4
  %358 = add nsw i32 %356, %357
  store i32 %358, i32* %45, align 4
  %359 = load i32, i32* %14, align 4
  %360 = load i32, i32* %15, align 4
  %361 = sub nsw i32 %359, %360
  %362 = sext i32 %361 to i64
  %363 = add nsw i64 %362, 2048
  %364 = ashr i64 %363, 12
  %365 = mul nsw i64 %364, 3166
  %366 = trunc i64 %365 to i32
  store i32 %366, i32* %62, align 4
  %367 = load i32*, i32** %6, align 8
  %368 = getelementptr inbounds i32, i32* %367, i64 4
  %369 = load i32, i32* %368, align 4
  %370 = load i32*, i32** %6, align 8
  %371 = getelementptr inbounds i32, i32* %370, i64 27
  %372 = load i32, i32* %371, align 4
  %373 = add nsw i32 %369, %372
  store i32 %373, i32* %16, align 4
  %374 = load i32*, i32** %6, align 8
  %375 = getelementptr inbounds i32, i32* %374, i64 4
  %376 = load i32, i32* %375, align 4
  %377 = load i32*, i32** %6, align 8
  %378 = getelementptr inbounds i32, i32* %377, i64 27
  %379 = load i32, i32* %378, align 4
  %380 = sub nsw i32 %376, %379
  %381 = sext i32 %380 to i64
  %382 = add nsw i64 %381, 2048
  %383 = ashr i64 %382, 12
  %384 = mul nsw i64 %383, 3703
  %385 = trunc i64 %384 to i32
  store i32 %385, i32* %32, align 4
  %386 = load i32*, i32** %6, align 8
  %387 = getelementptr inbounds i32, i32* %386, i64 11
  %388 = load i32, i32* %387, align 4
  %389 = load i32*, i32** %6, align 8
  %390 = getelementptr inbounds i32, i32* %389, i64 20
  %391 = load i32, i32* %390, align 4
  %392 = add nsw i32 %388, %391
  store i32 %392, i32* %17, align 4
  %393 = load i32*, i32** %6, align 8
  %394 = getelementptr inbounds i32, i32* %393, i64 11
  %395 = load i32, i32* %394, align 4
  %396 = load i32*, i32** %6, align 8
  %397 = getelementptr inbounds i32, i32* %396, i64 20
  %398 = load i32, i32* %397, align 4
  %399 = sub nsw i32 %395, %398
  %400 = sext i32 %399 to i64
  %401 = add nsw i64 %400, 2048
  %402 = ashr i64 %401, 12
  %403 = mul nsw i64 %402, 1751
  %404 = trunc i64 %403 to i32
  store i32 %404, i32* %33, align 4
  %405 = load i32, i32* %32, align 4
  %406 = load i32, i32* %33, align 4
  %407 = add nsw i32 %405, %406
  store i32 %407, i32* %54, align 4
  %408 = load i32, i32* %32, align 4
  %409 = load i32, i32* %33, align 4
  %410 = sub nsw i32 %408, %409
  %411 = sext i32 %410 to i64
  %412 = add nsw i64 %411, 2048
  %413 = ashr i64 %412, 12
  %414 = mul nsw i64 %413, 2598
  %415 = trunc i64 %414 to i32
  store i32 %415, i32* %72, align 4
  %416 = load i32, i32* %16, align 4
  %417 = load i32, i32* %17, align 4
  %418 = add nsw i32 %416, %417
  store i32 %418, i32* %46, align 4
  %419 = load i32, i32* %16, align 4
  %420 = load i32, i32* %17, align 4
  %421 = sub nsw i32 %419, %420
  %422 = sext i32 %421 to i64
  %423 = add nsw i64 %422, 2048
  %424 = ashr i64 %423, 12
  %425 = mul nsw i64 %424, 2598
  %426 = trunc i64 %425 to i32
  store i32 %426, i32* %63, align 4
  %427 = load i32*, i32** %6, align 8
  %428 = getelementptr inbounds i32, i32* %427, i64 1
  %429 = load i32, i32* %428, align 4
  %430 = load i32*, i32** %6, align 8
  %431 = getelementptr inbounds i32, i32* %430, i64 30
  %432 = load i32, i32* %431, align 4
  %433 = add nsw i32 %429, %432
  store i32 %433, i32* %18, align 4
  %434 = load i32*, i32** %6, align 8
  %435 = getelementptr inbounds i32, i32* %434, i64 1
  %436 = load i32, i32* %435, align 4
  %437 = load i32*, i32** %6, align 8
  %438 = getelementptr inbounds i32, i32* %437, i64 30
  %439 = load i32, i32* %438, align 4
  %440 = sub nsw i32 %436, %439
  %441 = sext i32 %440 to i64
  %442 = add nsw i64 %441, 2048
  %443 = ashr i64 %442, 12
  %444 = mul nsw i64 %443, 4052
  %445 = trunc i64 %444 to i32
  store i32 %445, i32* %34, align 4
  %446 = load i32*, i32** %6, align 8
  %447 = getelementptr inbounds i32, i32* %446, i64 14
  %448 = load i32, i32* %447, align 4
  %449 = load i32*, i32** %6, align 8
  %450 = getelementptr inbounds i32, i32* %449, i64 17
  %451 = load i32, i32* %450, align 4
  %452 = add nsw i32 %448, %451
  store i32 %452, i32* %19, align 4
  %453 = load i32*, i32** %6, align 8
  %454 = getelementptr inbounds i32, i32* %453, i64 14
  %455 = load i32, i32* %454, align 4
  %456 = load i32*, i32** %6, align 8
  %457 = getelementptr inbounds i32, i32* %456, i64 17
  %458 = load i32, i32* %457, align 4
  %459 = sub nsw i32 %455, %458
  %460 = sext i32 %459 to i64
  %461 = add nsw i64 %460, 2048
  %462 = ashr i64 %461, 12
  %463 = mul nsw i64 %462, 601
  %464 = trunc i64 %463 to i32
  store i32 %464, i32* %35, align 4
  %465 = load i32, i32* %34, align 4
  %466 = load i32, i32* %35, align 4
  %467 = add nsw i32 %465, %466
  store i32 %467, i32* %55, align 4
  %468 = load i32, i32* %34, align 4
  %469 = load i32, i32* %35, align 4
  %470 = sub nsw i32 %468, %469
  %471 = sext i32 %470 to i64
  %472 = add nsw i64 %471, 2048
  %473 = ashr i64 %472, 12
  %474 = mul nsw i64 %473, 3920
  %475 = trunc i64 %474 to i32
  store i32 %475, i32* %73, align 4
  %476 = load i32, i32* %18, align 4
  %477 = load i32, i32* %19, align 4
  %478 = add nsw i32 %476, %477
  store i32 %478, i32* %47, align 4
  %479 = load i32, i32* %18, align 4
  %480 = load i32, i32* %19, align 4
  %481 = sub nsw i32 %479, %480
  %482 = sext i32 %481 to i64
  %483 = add nsw i64 %482, 2048
  %484 = ashr i64 %483, 12
  %485 = mul nsw i64 %484, 3920
  %486 = trunc i64 %485 to i32
  store i32 %486, i32* %64, align 4
  %487 = load i32*, i32** %6, align 8
  %488 = getelementptr inbounds i32, i32* %487, i64 6
  %489 = load i32, i32* %488, align 4
  %490 = load i32*, i32** %6, align 8
  %491 = getelementptr inbounds i32, i32* %490, i64 25
  %492 = load i32, i32* %491, align 4
  %493 = add nsw i32 %489, %492
  store i32 %493, i32* %20, align 4
  %494 = load i32*, i32** %6, align 8
  %495 = getelementptr inbounds i32, i32* %494, i64 6
  %496 = load i32, i32* %495, align 4
  %497 = load i32*, i32** %6, align 8
  %498 = getelementptr inbounds i32, i32* %497, i64 25
  %499 = load i32, i32* %498, align 4
  %500 = sub nsw i32 %496, %499
  %501 = sext i32 %500 to i64
  %502 = add nsw i64 %501, 2048
  %503 = ashr i64 %502, 12
  %504 = mul nsw i64 %503, 3290
  %505 = trunc i64 %504 to i32
  store i32 %505, i32* %36, align 4
  %506 = load i32*, i32** %6, align 8
  %507 = getelementptr inbounds i32, i32* %506, i64 9
  %508 = load i32, i32* %507, align 4
  %509 = load i32*, i32** %6, align 8
  %510 = getelementptr inbounds i32, i32* %509, i64 22
  %511 = load i32, i32* %510, align 4
  %512 = add nsw i32 %508, %511
  store i32 %512, i32* %21, align 4
  %513 = load i32*, i32** %6, align 8
  %514 = getelementptr inbounds i32, i32* %513, i64 9
  %515 = load i32, i32* %514, align 4
  %516 = load i32*, i32** %6, align 8
  %517 = getelementptr inbounds i32, i32* %516, i64 22
  %518 = load i32, i32* %517, align 4
  %519 = sub nsw i32 %515, %518
  %520 = sext i32 %519 to i64
  %521 = add nsw i64 %520, 2048
  %522 = ashr i64 %521, 12
  %523 = mul nsw i64 %522, 2440
  %524 = trunc i64 %523 to i32
  store i32 %524, i32* %37, align 4
  %525 = load i32, i32* %36, align 4
  %526 = load i32, i32* %37, align 4
  %527 = add nsw i32 %525, %526
  store i32 %527, i32* %56, align 4
  %528 = load i32, i32* %36, align 4
  %529 = load i32, i32* %37, align 4
  %530 = sub nsw i32 %528, %529
  %531 = sext i32 %530 to i64
  %532 = add nsw i64 %531, 2048
  %533 = ashr i64 %532, 12
  %534 = mul nsw i64 %533, 1189
  %535 = trunc i64 %534 to i32
  store i32 %535, i32* %74, align 4
  %536 = load i32, i32* %20, align 4
  %537 = load i32, i32* %21, align 4
  %538 = add nsw i32 %536, %537
  store i32 %538, i32* %48, align 4
  %539 = load i32, i32* %20, align 4
  %540 = load i32, i32* %21, align 4
  %541 = sub nsw i32 %539, %540
  %542 = sext i32 %541 to i64
  %543 = add nsw i64 %542, 2048
  %544 = ashr i64 %543, 12
  %545 = mul nsw i64 %544, 1189
  %546 = trunc i64 %545 to i32
  store i32 %546, i32* %65, align 4
  %547 = load i32*, i32** %6, align 8
  %548 = getelementptr inbounds i32, i32* %547, i64 2
  %549 = load i32, i32* %548, align 4
  %550 = load i32*, i32** %6, align 8
  %551 = getelementptr inbounds i32, i32* %550, i64 29
  %552 = load i32, i32* %551, align 4
  %553 = add nsw i32 %549, %552
  store i32 %553, i32* %22, align 4
  %554 = load i32*, i32** %6, align 8
  %555 = getelementptr inbounds i32, i32* %554, i64 2
  %556 = load i32, i32* %555, align 4
  %557 = load i32*, i32** %6, align 8
  %558 = getelementptr inbounds i32, i32* %557, i64 29
  %559 = load i32, i32* %558, align 4
  %560 = sub nsw i32 %556, %559
  %561 = sext i32 %560 to i64
  %562 = add nsw i64 %561, 2048
  %563 = ashr i64 %562, 12
  %564 = mul nsw i64 %563, 3973
  %565 = trunc i64 %564 to i32
  store i32 %565, i32* %38, align 4
  %566 = load i32*, i32** %6, align 8
  %567 = getelementptr inbounds i32, i32* %566, i64 13
  %568 = load i32, i32* %567, align 4
  %569 = load i32*, i32** %6, align 8
  %570 = getelementptr inbounds i32, i32* %569, i64 18
  %571 = load i32, i32* %570, align 4
  %572 = add nsw i32 %568, %571
  store i32 %572, i32* %23, align 4
  %573 = load i32*, i32** %6, align 8
  %574 = getelementptr inbounds i32, i32* %573, i64 13
  %575 = load i32, i32* %574, align 4
  %576 = load i32*, i32** %6, align 8
  %577 = getelementptr inbounds i32, i32* %576, i64 18
  %578 = load i32, i32* %577, align 4
  %579 = sub nsw i32 %575, %578
  %580 = sext i32 %579 to i64
  %581 = add nsw i64 %580, 2048
  %582 = ashr i64 %581, 12
  %583 = mul nsw i64 %582, 995
  %584 = trunc i64 %583 to i32
  store i32 %584, i32* %39, align 4
  %585 = load i32, i32* %38, align 4
  %586 = load i32, i32* %39, align 4
  %587 = add nsw i32 %585, %586
  store i32 %587, i32* %57, align 4
  %588 = load i32, i32* %38, align 4
  %589 = load i32, i32* %39, align 4
  %590 = sub nsw i32 %588, %589
  %591 = sext i32 %590 to i64
  %592 = add nsw i64 %591, 2048
  %593 = ashr i64 %592, 12
  %594 = mul nsw i64 %593, 3612
  %595 = trunc i64 %594 to i32
  store i32 %595, i32* %75, align 4
  %596 = load i32, i32* %22, align 4
  %597 = load i32, i32* %23, align 4
  %598 = add nsw i32 %596, %597
  store i32 %598, i32* %49, align 4
  %599 = load i32, i32* %22, align 4
  %600 = load i32, i32* %23, align 4
  %601 = sub nsw i32 %599, %600
  %602 = sext i32 %601 to i64
  %603 = add nsw i64 %602, 2048
  %604 = ashr i64 %603, 12
  %605 = mul nsw i64 %604, 3612
  %606 = trunc i64 %605 to i32
  store i32 %606, i32* %66, align 4
  %607 = load i32*, i32** %6, align 8
  %608 = getelementptr inbounds i32, i32* %607, i64 5
  %609 = load i32, i32* %608, align 4
  %610 = load i32*, i32** %6, align 8
  %611 = getelementptr inbounds i32, i32* %610, i64 26
  %612 = load i32, i32* %611, align 4
  %613 = add nsw i32 %609, %612
  store i32 %613, i32* %24, align 4
  %614 = load i32*, i32** %6, align 8
  %615 = getelementptr inbounds i32, i32* %614, i64 5
  %616 = load i32, i32* %615, align 4
  %617 = load i32*, i32** %6, align 8
  %618 = getelementptr inbounds i32, i32* %617, i64 26
  %619 = load i32, i32* %618, align 4
  %620 = sub nsw i32 %616, %619
  %621 = sext i32 %620 to i64
  %622 = add nsw i64 %621, 2048
  %623 = ashr i64 %622, 12
  %624 = mul nsw i64 %623, 3513
  %625 = trunc i64 %624 to i32
  store i32 %625, i32* %40, align 4
  %626 = load i32*, i32** %6, align 8
  %627 = getelementptr inbounds i32, i32* %626, i64 10
  %628 = load i32, i32* %627, align 4
  %629 = load i32*, i32** %6, align 8
  %630 = getelementptr inbounds i32, i32* %629, i64 21
  %631 = load i32, i32* %630, align 4
  %632 = add nsw i32 %628, %631
  store i32 %632, i32* %25, align 4
  %633 = load i32*, i32** %6, align 8
  %634 = getelementptr inbounds i32, i32* %633, i64 10
  %635 = load i32, i32* %634, align 4
  %636 = load i32*, i32** %6, align 8
  %637 = getelementptr inbounds i32, i32* %636, i64 21
  %638 = load i32, i32* %637, align 4
  %639 = sub nsw i32 %635, %638
  %640 = sext i32 %639 to i64
  %641 = add nsw i64 %640, 2048
  %642 = ashr i64 %641, 12
  %643 = mul nsw i64 %642, 2106
  %644 = trunc i64 %643 to i32
  store i32 %644, i32* %41, align 4
  %645 = load i32, i32* %40, align 4
  %646 = load i32, i32* %41, align 4
  %647 = add nsw i32 %645, %646
  store i32 %647, i32* %58, align 4
  %648 = load i32, i32* %40, align 4
  %649 = load i32, i32* %41, align 4
  %650 = sub nsw i32 %648, %649
  %651 = sext i32 %650 to i64
  %652 = add nsw i64 %651, 2048
  %653 = ashr i64 %652, 12
  %654 = mul nsw i64 %653, 1931
  %655 = trunc i64 %654 to i32
  store i32 %655, i32* %76, align 4
  %656 = load i32, i32* %24, align 4
  %657 = load i32, i32* %25, align 4
  %658 = add nsw i32 %656, %657
  store i32 %658, i32* %50, align 4
  %659 = load i32, i32* %24, align 4
  %660 = load i32, i32* %25, align 4
  %661 = sub nsw i32 %659, %660
  %662 = sext i32 %661 to i64
  %663 = add nsw i64 %662, 2048
  %664 = ashr i64 %663, 12
  %665 = mul nsw i64 %664, 1931
  %666 = trunc i64 %665 to i32
  store i32 %666, i32* %67, align 4
  %667 = load i32, i32* %43, align 4
  %668 = load i32, i32* %44, align 4
  %669 = add nsw i32 %667, %668
  store i32 %669, i32* %79, align 4
  %670 = load i32, i32* %43, align 4
  %671 = load i32, i32* %44, align 4
  %672 = sub nsw i32 %670, %671
  %673 = sext i32 %672 to i64
  %674 = add nsw i64 %673, 2048
  %675 = ashr i64 %674, 12
  %676 = mul nsw i64 %675, 4017
  %677 = trunc i64 %676 to i32
  store i32 %677, i32* %99, align 4
  %678 = load i32, i32* %45, align 4
  %679 = load i32, i32* %46, align 4
  %680 = add nsw i32 %678, %679
  store i32 %680, i32* %80, align 4
  %681 = load i32, i32* %45, align 4
  %682 = load i32, i32* %46, align 4
  %683 = sub nsw i32 %681, %682
  %684 = sext i32 %683 to i64
  %685 = add nsw i64 %684, 2048
  %686 = ashr i64 %685, 12
  %687 = mul nsw i64 %686, 799
  %688 = trunc i64 %687 to i32
  store i32 %688, i32* %100, align 4
  %689 = load i32, i32* %47, align 4
  %690 = load i32, i32* %48, align 4
  %691 = add nsw i32 %689, %690
  store i32 %691, i32* %81, align 4
  %692 = load i32, i32* %47, align 4
  %693 = load i32, i32* %48, align 4
  %694 = sub nsw i32 %692, %693
  %695 = sext i32 %694 to i64
  %696 = add nsw i64 %695, 2048
  %697 = ashr i64 %696, 12
  %698 = mul nsw i64 %697, 3406
  %699 = trunc i64 %698 to i32
  store i32 %699, i32* %101, align 4
  %700 = load i32, i32* %49, align 4
  %701 = load i32, i32* %50, align 4
  %702 = add nsw i32 %700, %701
  store i32 %702, i32* %82, align 4
  %703 = load i32, i32* %49, align 4
  %704 = load i32, i32* %50, align 4
  %705 = sub nsw i32 %703, %704
  %706 = sext i32 %705 to i64
  %707 = add nsw i64 %706, 2048
  %708 = ashr i64 %707, 12
  %709 = mul nsw i64 %708, 2276
  %710 = trunc i64 %709 to i32
  store i32 %710, i32* %102, align 4
  %711 = load i32, i32* %51, align 4
  %712 = load i32, i32* %52, align 4
  %713 = add nsw i32 %711, %712
  store i32 %713, i32* %83, align 4
  %714 = load i32, i32* %51, align 4
  %715 = load i32, i32* %52, align 4
  %716 = sub nsw i32 %714, %715
  %717 = sext i32 %716 to i64
  %718 = add nsw i64 %717, 2048
  %719 = ashr i64 %718, 12
  %720 = mul nsw i64 %719, 4017
  %721 = trunc i64 %720 to i32
  store i32 %721, i32* %104, align 4
  %722 = load i32, i32* %53, align 4
  %723 = load i32, i32* %54, align 4
  %724 = add nsw i32 %722, %723
  store i32 %724, i32* %84, align 4
  %725 = load i32, i32* %53, align 4
  %726 = load i32, i32* %54, align 4
  %727 = sub nsw i32 %725, %726
  %728 = sext i32 %727 to i64
  %729 = add nsw i64 %728, 2048
  %730 = ashr i64 %729, 12
  %731 = mul nsw i64 %730, 799
  %732 = trunc i64 %731 to i32
  store i32 %732, i32* %105, align 4
  %733 = load i32, i32* %55, align 4
  %734 = load i32, i32* %56, align 4
  %735 = add nsw i32 %733, %734
  store i32 %735, i32* %85, align 4
  %736 = load i32, i32* %55, align 4
  %737 = load i32, i32* %56, align 4
  %738 = sub nsw i32 %736, %737
  %739 = sext i32 %738 to i64
  %740 = add nsw i64 %739, 2048
  %741 = ashr i64 %740, 12
  %742 = mul nsw i64 %741, 3406
  %743 = trunc i64 %742 to i32
  store i32 %743, i32* %106, align 4
  %744 = load i32, i32* %57, align 4
  %745 = load i32, i32* %58, align 4
  %746 = add nsw i32 %744, %745
  store i32 %746, i32* %86, align 4
  %747 = load i32, i32* %57, align 4
  %748 = load i32, i32* %58, align 4
  %749 = sub nsw i32 %747, %748
  %750 = sext i32 %749 to i64
  %751 = add nsw i64 %750, 2048
  %752 = ashr i64 %751, 12
  %753 = mul nsw i64 %752, 2276
  %754 = trunc i64 %753 to i32
  store i32 %754, i32* %107, align 4
  %755 = load i32, i32* %60, align 4
  %756 = load i32, i32* %61, align 4
  %757 = add nsw i32 %755, %756
  store i32 %757, i32* %88, align 4
  %758 = load i32, i32* %60, align 4
  %759 = load i32, i32* %61, align 4
  %760 = sub nsw i32 %758, %759
  %761 = sext i32 %760 to i64
  %762 = add nsw i64 %761, 2048
  %763 = ashr i64 %762, 12
  %764 = mul nsw i64 %763, 4017
  %765 = trunc i64 %764 to i32
  store i32 %765, i32* %110, align 4
  %766 = load i32, i32* %62, align 4
  %767 = load i32, i32* %63, align 4
  %768 = add nsw i32 %766, %767
  store i32 %768, i32* %89, align 4
  %769 = load i32, i32* %62, align 4
  %770 = load i32, i32* %63, align 4
  %771 = sub nsw i32 %769, %770
  %772 = sext i32 %771 to i64
  %773 = add nsw i64 %772, 2048
  %774 = ashr i64 %773, 12
  %775 = mul nsw i64 %774, 799
  %776 = trunc i64 %775 to i32
  store i32 %776, i32* %111, align 4
  %777 = load i32, i32* %64, align 4
  %778 = load i32, i32* %65, align 4
  %779 = add nsw i32 %777, %778
  store i32 %779, i32* %90, align 4
  %780 = load i32, i32* %64, align 4
  %781 = load i32, i32* %65, align 4
  %782 = sub nsw i32 %780, %781
  %783 = sext i32 %782 to i64
  %784 = add nsw i64 %783, 2048
  %785 = ashr i64 %784, 12
  %786 = mul nsw i64 %785, 3406
  %787 = trunc i64 %786 to i32
  store i32 %787, i32* %112, align 4
  %788 = load i32, i32* %66, align 4
  %789 = load i32, i32* %67, align 4
  %790 = add nsw i32 %788, %789
  store i32 %790, i32* %91, align 4
  %791 = load i32, i32* %66, align 4
  %792 = load i32, i32* %67, align 4
  %793 = sub nsw i32 %791, %792
  %794 = sext i32 %793 to i64
  %795 = add nsw i64 %794, 2048
  %796 = ashr i64 %795, 12
  %797 = mul nsw i64 %796, 2276
  %798 = trunc i64 %797 to i32
  store i32 %798, i32* %113, align 4
  %799 = load i32, i32* %69, align 4
  %800 = load i32, i32* %70, align 4
  %801 = add nsw i32 %799, %800
  store i32 %801, i32* %93, align 4
  %802 = load i32, i32* %69, align 4
  %803 = load i32, i32* %70, align 4
  %804 = sub nsw i32 %802, %803
  %805 = sext i32 %804 to i64
  %806 = add nsw i64 %805, 2048
  %807 = ashr i64 %806, 12
  %808 = mul nsw i64 %807, 4017
  %809 = trunc i64 %808 to i32
  store i32 %809, i32* %116, align 4
  %810 = load i32, i32* %71, align 4
  %811 = load i32, i32* %72, align 4
  %812 = add nsw i32 %810, %811
  store i32 %812, i32* %94, align 4
  %813 = load i32, i32* %71, align 4
  %814 = load i32, i32* %72, align 4
  %815 = sub nsw i32 %813, %814
  %816 = sext i32 %815 to i64
  %817 = add nsw i64 %816, 2048
  %818 = ashr i64 %817, 12
  %819 = mul nsw i64 %818, 799
  %820 = trunc i64 %819 to i32
  store i32 %820, i32* %117, align 4
  %821 = load i32, i32* %73, align 4
  %822 = load i32, i32* %74, align 4
  %823 = add nsw i32 %821, %822
  store i32 %823, i32* %95, align 4
  %824 = load i32, i32* %73, align 4
  %825 = load i32, i32* %74, align 4
  %826 = sub nsw i32 %824, %825
  %827 = sext i32 %826 to i64
  %828 = add nsw i64 %827, 2048
  %829 = ashr i64 %828, 12
  %830 = mul nsw i64 %829, 3406
  %831 = trunc i64 %830 to i32
  store i32 %831, i32* %118, align 4
  %832 = load i32, i32* %75, align 4
  %833 = load i32, i32* %76, align 4
  %834 = add nsw i32 %832, %833
  store i32 %834, i32* %96, align 4
  %835 = load i32, i32* %75, align 4
  %836 = load i32, i32* %76, align 4
  %837 = sub nsw i32 %835, %836
  %838 = sext i32 %837 to i64
  %839 = add nsw i64 %838, 2048
  %840 = ashr i64 %839, 12
  %841 = mul nsw i64 %840, 2276
  %842 = trunc i64 %841 to i32
  store i32 %842, i32* %119, align 4
  %843 = load i32, i32* %79, align 4
  %844 = load i32, i32* %80, align 4
  %845 = add nsw i32 %843, %844
  store i32 %845, i32* %123, align 4
  %846 = load i32, i32* %81, align 4
  %847 = load i32, i32* %82, align 4
  %848 = add nsw i32 %846, %847
  store i32 %848, i32* %124, align 4
  %849 = load i32, i32* %123, align 4
  %850 = load i32, i32* %124, align 4
  %851 = add nsw i32 %849, %850
  %852 = sext i32 %851 to i64
  %853 = add nsw i64 %852, 2048
  %854 = ashr i64 %853, 12
  %855 = trunc i64 %854 to i32
  %856 = load [8 x i32]*, [8 x i32]** %9, align 8
  %857 = getelementptr inbounds [8 x i32], [8 x i32]* %856, i64 15
  %858 = load i32, i32* %7, align 4
  %859 = zext i32 %858 to i64
  %860 = getelementptr inbounds [8 x i32], [8 x i32]* %857, i64 0, i64 %859
  store i32 %855, i32* %860, align 4
  %861 = load i32, i32* %123, align 4
  %862 = load i32, i32* %124, align 4
  %863 = sub nsw i32 %861, %862
  %864 = sext i32 %863 to i64
  %865 = add nsw i64 %864, 2048
  %866 = ashr i64 %865, 12
  %867 = mul nsw i64 %866, 2896
  %868 = add nsw i64 %867, 2048
  %869 = ashr i64 %868, 12
  %870 = trunc i64 %869 to i32
  %871 = load [8 x i32]*, [8 x i32]** %8, align 8
  %872 = getelementptr inbounds [8 x i32], [8 x i32]* %871, i64 0
  %873 = load i32, i32* %7, align 4
  %874 = zext i32 %873 to i64
  %875 = getelementptr inbounds [8 x i32], [8 x i32]* %872, i64 0, i64 %874
  store i32 %870, i32* %875, align 4
  %876 = load i32, i32* %83, align 4
  %877 = load i32, i32* %84, align 4
  %878 = add nsw i32 %876, %877
  store i32 %878, i32* %125, align 4
  %879 = load i32, i32* %85, align 4
  %880 = load i32, i32* %86, align 4
  %881 = add nsw i32 %879, %880
  store i32 %881, i32* %126, align 4
  %882 = load i32, i32* %125, align 4
  %883 = load i32, i32* %126, align 4
  %884 = add nsw i32 %882, %883
  store i32 %884, i32* %42, align 4
  %885 = load i32, i32* %42, align 4
  %886 = sext i32 %885 to i64
  %887 = add nsw i64 %886, 2048
  %888 = ashr i64 %887, 12
  %889 = trunc i64 %888 to i32
  %890 = load [8 x i32]*, [8 x i32]** %9, align 8
  %891 = getelementptr inbounds [8 x i32], [8 x i32]* %890, i64 14
  %892 = load i32, i32* %7, align 4
  %893 = zext i32 %892 to i64
  %894 = getelementptr inbounds [8 x i32], [8 x i32]* %891, i64 0, i64 %893
  store i32 %889, i32* %894, align 4
  %895 = load i32, i32* %88, align 4
  %896 = load i32, i32* %89, align 4
  %897 = add nsw i32 %895, %896
  store i32 %897, i32* %128, align 4
  %898 = load i32, i32* %90, align 4
  %899 = load i32, i32* %91, align 4
  %900 = add nsw i32 %898, %899
  store i32 %900, i32* %129, align 4
  %901 = load i32, i32* %128, align 4
  %902 = load i32, i32* %129, align 4
  %903 = add nsw i32 %901, %902
  store i32 %903, i32* %68, align 4
  %904 = load i32, i32* %68, align 4
  %905 = sext i32 %904 to i64
  %906 = add nsw i64 %905, 2048
  %907 = ashr i64 %906, 12
  %908 = trunc i64 %907 to i32
  %909 = load [8 x i32]*, [8 x i32]** %9, align 8
  %910 = getelementptr inbounds [8 x i32], [8 x i32]* %909, i64 13
  %911 = load i32, i32* %7, align 4
  %912 = zext i32 %911 to i64
  %913 = getelementptr inbounds [8 x i32], [8 x i32]* %910, i64 0, i64 %912
  store i32 %908, i32* %913, align 4
  %914 = load i32, i32* %93, align 4
  %915 = load i32, i32* %94, align 4
  %916 = add nsw i32 %914, %915
  store i32 %916, i32* %131, align 4
  %917 = load i32, i32* %95, align 4
  %918 = load i32, i32* %96, align 4
  %919 = add nsw i32 %917, %918
  store i32 %919, i32* %132, align 4
  %920 = load i32, i32* %131, align 4
  %921 = load i32, i32* %132, align 4
  %922 = add nsw i32 %920, %921
  store i32 %922, i32* %77, align 4
  %923 = load i32, i32* %77, align 4
  %924 = mul nsw i32 %923, 2
  %925 = load i32, i32* %42, align 4
  %926 = sub nsw i32 %924, %925
  store i32 %926, i32* %59, align 4
  %927 = load i32, i32* %59, align 4
  %928 = sext i32 %927 to i64
  %929 = add nsw i64 %928, 2048
  %930 = ashr i64 %929, 12
  %931 = trunc i64 %930 to i32
  %932 = load [8 x i32]*, [8 x i32]** %9, align 8
  %933 = getelementptr inbounds [8 x i32], [8 x i32]* %932, i64 12
  %934 = load i32, i32* %7, align 4
  %935 = zext i32 %934 to i64
  %936 = getelementptr inbounds [8 x i32], [8 x i32]* %933, i64 0, i64 %935
  store i32 %931, i32* %936, align 4
  %937 = load i32, i32* %99, align 4
  %938 = load i32, i32* %100, align 4
  %939 = add nsw i32 %937, %938
  store i32 %939, i32* %135, align 4
  %940 = load i32, i32* %101, align 4
  %941 = load i32, i32* %102, align 4
  %942 = add nsw i32 %940, %941
  store i32 %942, i32* %136, align 4
  %943 = load i32, i32* %135, align 4
  %944 = load i32, i32* %136, align 4
  %945 = add nsw i32 %943, %944
  store i32 %945, i32* %103, align 4
  %946 = load i32, i32* %103, align 4
  %947 = sext i32 %946 to i64
  %948 = add nsw i64 %947, 2048
  %949 = ashr i64 %948, 12
  %950 = trunc i64 %949 to i32
  %951 = load [8 x i32]*, [8 x i32]** %9, align 8
  %952 = getelementptr inbounds [8 x i32], [8 x i32]* %951, i64 11
  %953 = load i32, i32* %7, align 4
  %954 = zext i32 %953 to i64
  %955 = getelementptr inbounds [8 x i32], [8 x i32]* %952, i64 0, i64 %954
  store i32 %950, i32* %955, align 4
  %956 = load i32, i32* %104, align 4
  %957 = load i32, i32* %105, align 4
  %958 = add nsw i32 %956, %957
  store i32 %958, i32* %138, align 4
  %959 = load i32, i32* %106, align 4
  %960 = load i32, i32* %107, align 4
  %961 = add nsw i32 %959, %960
  store i32 %961, i32* %139, align 4
  %962 = load i32, i32* %138, align 4
  %963 = load i32, i32* %139, align 4
  %964 = add nsw i32 %962, %963
  store i32 %964, i32* %108, align 4
  %965 = load i32, i32* %108, align 4
  %966 = mul nsw i32 %965, 2
  %967 = load i32, i32* %59, align 4
  %968 = sub nsw i32 %966, %967
  store i32 %968, i32* %78, align 4
  %969 = load i32, i32* %78, align 4
  %970 = sext i32 %969 to i64
  %971 = add nsw i64 %970, 2048
  %972 = ashr i64 %971, 12
  %973 = trunc i64 %972 to i32
  %974 = load [8 x i32]*, [8 x i32]** %9, align 8
  %975 = getelementptr inbounds [8 x i32], [8 x i32]* %974, i64 10
  %976 = load i32, i32* %7, align 4
  %977 = zext i32 %976 to i64
  %978 = getelementptr inbounds [8 x i32], [8 x i32]* %975, i64 0, i64 %977
  store i32 %973, i32* %978, align 4
  %979 = load i32, i32* %110, align 4
  %980 = load i32, i32* %111, align 4
  %981 = add nsw i32 %979, %980
  store i32 %981, i32* %142, align 4
  %982 = load i32, i32* %112, align 4
  %983 = load i32, i32* %113, align 4
  %984 = add nsw i32 %982, %983
  store i32 %984, i32* %143, align 4
  %985 = load i32, i32* %142, align 4
  %986 = load i32, i32* %143, align 4
  %987 = add nsw i32 %985, %986
  store i32 %987, i32* %114, align 4
  %988 = load i32, i32* %114, align 4
  %989 = mul nsw i32 %988, 2
  %990 = load i32, i32* %68, align 4
  %991 = sub nsw i32 %989, %990
  store i32 %991, i32* %92, align 4
  %992 = load i32, i32* %92, align 4
  %993 = sext i32 %992 to i64
  %994 = add nsw i64 %993, 2048
  %995 = ashr i64 %994, 12
  %996 = trunc i64 %995 to i32
  %997 = load [8 x i32]*, [8 x i32]** %9, align 8
  %998 = getelementptr inbounds [8 x i32], [8 x i32]* %997, i64 9
  %999 = load i32, i32* %7, align 4
  %1000 = zext i32 %999 to i64
  %1001 = getelementptr inbounds [8 x i32], [8 x i32]* %998, i64 0, i64 %1000
  store i32 %996, i32* %1001, align 4
  %1002 = load i32, i32* %116, align 4
  %1003 = load i32, i32* %117, align 4
  %1004 = add nsw i32 %1002, %1003
  store i32 %1004, i32* %146, align 4
  %1005 = load i32, i32* %118, align 4
  %1006 = load i32, i32* %119, align 4
  %1007 = add nsw i32 %1005, %1006
  store i32 %1007, i32* %147, align 4
  %1008 = load i32, i32* %146, align 4
  %1009 = load i32, i32* %147, align 4
  %1010 = add nsw i32 %1008, %1009
  store i32 %1010, i32* %120, align 4
  %1011 = load i32, i32* %120, align 4
  %1012 = mul nsw i32 %1011, 2
  %1013 = load i32, i32* %77, align 4
  %1014 = sub nsw i32 %1012, %1013
  store i32 %1014, i32* %97, align 4
  %1015 = load i32, i32* %97, align 4
  %1016 = mul nsw i32 %1015, 2
  %1017 = load i32, i32* %78, align 4
  %1018 = sub nsw i32 %1016, %1017
  store i32 %1018, i32* %87, align 4
  %1019 = load i32, i32* %87, align 4
  %1020 = sext i32 %1019 to i64
  %1021 = add nsw i64 %1020, 2048
  %1022 = ashr i64 %1021, 12
  %1023 = trunc i64 %1022 to i32
  %1024 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1025 = getelementptr inbounds [8 x i32], [8 x i32]* %1024, i64 8
  %1026 = load i32, i32* %7, align 4
  %1027 = zext i32 %1026 to i64
  %1028 = getelementptr inbounds [8 x i32], [8 x i32]* %1025, i64 0, i64 %1027
  store i32 %1023, i32* %1028, align 4
  %1029 = load i32, i32* %79, align 4
  %1030 = load i32, i32* %80, align 4
  %1031 = sub nsw i32 %1029, %1030
  %1032 = sext i32 %1031 to i64
  %1033 = add nsw i64 %1032, 2048
  %1034 = ashr i64 %1033, 12
  %1035 = mul nsw i64 %1034, 3784
  %1036 = trunc i64 %1035 to i32
  store i32 %1036, i32* %151, align 4
  %1037 = load i32, i32* %81, align 4
  %1038 = load i32, i32* %82, align 4
  %1039 = sub nsw i32 %1037, %1038
  %1040 = sext i32 %1039 to i64
  %1041 = add nsw i64 %1040, 2048
  %1042 = ashr i64 %1041, 12
  %1043 = mul nsw i64 %1042, 1567
  %1044 = trunc i64 %1043 to i32
  store i32 %1044, i32* %152, align 4
  %1045 = load i32, i32* %151, align 4
  %1046 = load i32, i32* %152, align 4
  %1047 = add nsw i32 %1045, %1046
  store i32 %1047, i32* %153, align 4
  %1048 = load i32, i32* %153, align 4
  %1049 = sext i32 %1048 to i64
  %1050 = add nsw i64 %1049, 2048
  %1051 = ashr i64 %1050, 12
  %1052 = trunc i64 %1051 to i32
  %1053 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1054 = getelementptr inbounds [8 x i32], [8 x i32]* %1053, i64 7
  %1055 = load i32, i32* %7, align 4
  %1056 = zext i32 %1055 to i64
  %1057 = getelementptr inbounds [8 x i32], [8 x i32]* %1054, i64 0, i64 %1056
  store i32 %1052, i32* %1057, align 4
  %1058 = load i32, i32* %151, align 4
  %1059 = load i32, i32* %152, align 4
  %1060 = sub nsw i32 %1058, %1059
  %1061 = sext i32 %1060 to i64
  %1062 = add nsw i64 %1061, 2048
  %1063 = ashr i64 %1062, 12
  %1064 = mul nsw i64 %1063, 2896
  %1065 = mul nsw i64 %1064, 2
  %1066 = load i32, i32* %153, align 4
  %1067 = sext i32 %1066 to i64
  %1068 = sub nsw i64 %1065, %1067
  %1069 = add nsw i64 %1068, 2048
  %1070 = ashr i64 %1069, 12
  %1071 = trunc i64 %1070 to i32
  %1072 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1073 = getelementptr inbounds [8 x i32], [8 x i32]* %1072, i64 8
  %1074 = load i32, i32* %7, align 4
  %1075 = zext i32 %1074 to i64
  %1076 = getelementptr inbounds [8 x i32], [8 x i32]* %1073, i64 0, i64 %1075
  store i32 %1071, i32* %1076, align 4
  %1077 = load i32, i32* %83, align 4
  %1078 = load i32, i32* %84, align 4
  %1079 = sub nsw i32 %1077, %1078
  %1080 = sext i32 %1079 to i64
  %1081 = add nsw i64 %1080, 2048
  %1082 = ashr i64 %1081, 12
  %1083 = mul nsw i64 %1082, 3784
  %1084 = trunc i64 %1083 to i32
  store i32 %1084, i32* %154, align 4
  %1085 = load i32, i32* %85, align 4
  %1086 = load i32, i32* %86, align 4
  %1087 = sub nsw i32 %1085, %1086
  %1088 = sext i32 %1087 to i64
  %1089 = add nsw i64 %1088, 2048
  %1090 = ashr i64 %1089, 12
  %1091 = mul nsw i64 %1090, 1567
  %1092 = trunc i64 %1091 to i32
  store i32 %1092, i32* %155, align 4
  %1093 = load i32, i32* %154, align 4
  %1094 = load i32, i32* %155, align 4
  %1095 = add nsw i32 %1093, %1094
  store i32 %1095, i32* %156, align 4
  %1096 = load i32, i32* %156, align 4
  %1097 = mul nsw i32 %1096, 2
  %1098 = load i32, i32* %87, align 4
  %1099 = sub nsw i32 %1097, %1098
  store i32 %1099, i32* %98, align 4
  %1100 = load i32, i32* %98, align 4
  %1101 = sext i32 %1100 to i64
  %1102 = add nsw i64 %1101, 2048
  %1103 = ashr i64 %1102, 12
  %1104 = trunc i64 %1103 to i32
  %1105 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1106 = getelementptr inbounds [8 x i32], [8 x i32]* %1105, i64 6
  %1107 = load i32, i32* %7, align 4
  %1108 = zext i32 %1107 to i64
  %1109 = getelementptr inbounds [8 x i32], [8 x i32]* %1106, i64 0, i64 %1108
  store i32 %1104, i32* %1109, align 4
  %1110 = load i32, i32* %88, align 4
  %1111 = load i32, i32* %89, align 4
  %1112 = sub nsw i32 %1110, %1111
  %1113 = sext i32 %1112 to i64
  %1114 = add nsw i64 %1113, 2048
  %1115 = ashr i64 %1114, 12
  %1116 = mul nsw i64 %1115, 3784
  %1117 = trunc i64 %1116 to i32
  store i32 %1117, i32* %158, align 4
  %1118 = load i32, i32* %90, align 4
  %1119 = load i32, i32* %91, align 4
  %1120 = sub nsw i32 %1118, %1119
  %1121 = sext i32 %1120 to i64
  %1122 = add nsw i64 %1121, 2048
  %1123 = ashr i64 %1122, 12
  %1124 = mul nsw i64 %1123, 1567
  %1125 = trunc i64 %1124 to i32
  store i32 %1125, i32* %159, align 4
  %1126 = load i32, i32* %158, align 4
  %1127 = load i32, i32* %159, align 4
  %1128 = add nsw i32 %1126, %1127
  store i32 %1128, i32* %160, align 4
  %1129 = load i32, i32* %160, align 4
  %1130 = mul nsw i32 %1129, 2
  %1131 = load i32, i32* %92, align 4
  %1132 = sub nsw i32 %1130, %1131
  store i32 %1132, i32* %115, align 4
  %1133 = load i32, i32* %115, align 4
  %1134 = sext i32 %1133 to i64
  %1135 = add nsw i64 %1134, 2048
  %1136 = ashr i64 %1135, 12
  %1137 = trunc i64 %1136 to i32
  %1138 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1139 = getelementptr inbounds [8 x i32], [8 x i32]* %1138, i64 5
  %1140 = load i32, i32* %7, align 4
  %1141 = zext i32 %1140 to i64
  %1142 = getelementptr inbounds [8 x i32], [8 x i32]* %1139, i64 0, i64 %1141
  store i32 %1137, i32* %1142, align 4
  %1143 = load i32, i32* %93, align 4
  %1144 = load i32, i32* %94, align 4
  %1145 = sub nsw i32 %1143, %1144
  %1146 = sext i32 %1145 to i64
  %1147 = add nsw i64 %1146, 2048
  %1148 = ashr i64 %1147, 12
  %1149 = mul nsw i64 %1148, 3784
  %1150 = trunc i64 %1149 to i32
  store i32 %1150, i32* %162, align 4
  %1151 = load i32, i32* %95, align 4
  %1152 = load i32, i32* %96, align 4
  %1153 = sub nsw i32 %1151, %1152
  %1154 = sext i32 %1153 to i64
  %1155 = add nsw i64 %1154, 2048
  %1156 = ashr i64 %1155, 12
  %1157 = mul nsw i64 %1156, 1567
  %1158 = trunc i64 %1157 to i32
  store i32 %1158, i32* %163, align 4
  %1159 = load i32, i32* %162, align 4
  %1160 = load i32, i32* %163, align 4
  %1161 = add nsw i32 %1159, %1160
  store i32 %1161, i32* %164, align 4
  %1162 = load i32, i32* %164, align 4
  %1163 = mul nsw i32 %1162, 2
  %1164 = load i32, i32* %97, align 4
  %1165 = sub nsw i32 %1163, %1164
  store i32 %1165, i32* %121, align 4
  %1166 = load i32, i32* %121, align 4
  %1167 = mul nsw i32 %1166, 2
  %1168 = load i32, i32* %98, align 4
  %1169 = sub nsw i32 %1167, %1168
  store i32 %1169, i32* %109, align 4
  %1170 = load i32, i32* %109, align 4
  %1171 = sext i32 %1170 to i64
  %1172 = add nsw i64 %1171, 2048
  %1173 = ashr i64 %1172, 12
  %1174 = trunc i64 %1173 to i32
  %1175 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1176 = getelementptr inbounds [8 x i32], [8 x i32]* %1175, i64 4
  %1177 = load i32, i32* %7, align 4
  %1178 = zext i32 %1177 to i64
  %1179 = getelementptr inbounds [8 x i32], [8 x i32]* %1176, i64 0, i64 %1178
  store i32 %1174, i32* %1179, align 4
  %1180 = load i32, i32* %99, align 4
  %1181 = load i32, i32* %100, align 4
  %1182 = sub nsw i32 %1180, %1181
  %1183 = sext i32 %1182 to i64
  %1184 = add nsw i64 %1183, 2048
  %1185 = ashr i64 %1184, 12
  %1186 = mul nsw i64 %1185, 3784
  %1187 = trunc i64 %1186 to i32
  store i32 %1187, i32* %167, align 4
  %1188 = load i32, i32* %101, align 4
  %1189 = load i32, i32* %102, align 4
  %1190 = sub nsw i32 %1188, %1189
  %1191 = sext i32 %1190 to i64
  %1192 = add nsw i64 %1191, 2048
  %1193 = ashr i64 %1192, 12
  %1194 = mul nsw i64 %1193, 1567
  %1195 = trunc i64 %1194 to i32
  store i32 %1195, i32* %168, align 4
  %1196 = load i32, i32* %167, align 4
  %1197 = load i32, i32* %168, align 4
  %1198 = add nsw i32 %1196, %1197
  store i32 %1198, i32* %169, align 4
  %1199 = load i32, i32* %169, align 4
  %1200 = mul nsw i32 %1199, 2
  %1201 = load i32, i32* %103, align 4
  %1202 = sub nsw i32 %1200, %1201
  store i32 %1202, i32* %137, align 4
  %1203 = load i32, i32* %137, align 4
  %1204 = sext i32 %1203 to i64
  %1205 = add nsw i64 %1204, 2048
  %1206 = ashr i64 %1205, 12
  %1207 = trunc i64 %1206 to i32
  %1208 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1209 = getelementptr inbounds [8 x i32], [8 x i32]* %1208, i64 3
  %1210 = load i32, i32* %7, align 4
  %1211 = zext i32 %1210 to i64
  %1212 = getelementptr inbounds [8 x i32], [8 x i32]* %1209, i64 0, i64 %1211
  store i32 %1207, i32* %1212, align 4
  %1213 = load i32, i32* %135, align 4
  %1214 = load i32, i32* %136, align 4
  %1215 = sub nsw i32 %1213, %1214
  %1216 = sext i32 %1215 to i64
  %1217 = add nsw i64 %1216, 2048
  %1218 = ashr i64 %1217, 12
  %1219 = mul nsw i64 %1218, 2896
  %1220 = mul nsw i64 %1219, 2
  %1221 = load i32, i32* %137, align 4
  %1222 = sext i32 %1221 to i64
  %1223 = sub nsw i64 %1220, %1222
  %1224 = trunc i64 %1223 to i32
  store i32 %1224, i32* %170, align 4
  %1225 = load i32, i32* %170, align 4
  %1226 = sext i32 %1225 to i64
  %1227 = add nsw i64 %1226, 2048
  %1228 = ashr i64 %1227, 12
  %1229 = trunc i64 %1228 to i32
  %1230 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1231 = getelementptr inbounds [8 x i32], [8 x i32]* %1230, i64 4
  %1232 = load i32, i32* %7, align 4
  %1233 = zext i32 %1232 to i64
  %1234 = getelementptr inbounds [8 x i32], [8 x i32]* %1231, i64 0, i64 %1233
  store i32 %1229, i32* %1234, align 4
  %1235 = load i32, i32* %167, align 4
  %1236 = load i32, i32* %168, align 4
  %1237 = sub nsw i32 %1235, %1236
  %1238 = sext i32 %1237 to i64
  %1239 = add nsw i64 %1238, 2048
  %1240 = ashr i64 %1239, 12
  %1241 = mul nsw i64 %1240, 2896
  %1242 = mul nsw i64 %1241, 2
  %1243 = load i32, i32* %169, align 4
  %1244 = sext i32 %1243 to i64
  %1245 = sub nsw i64 %1242, %1244
  %1246 = mul nsw i64 %1245, 2
  %1247 = load i32, i32* %170, align 4
  %1248 = sext i32 %1247 to i64
  %1249 = sub nsw i64 %1246, %1248
  %1250 = add nsw i64 %1249, 2048
  %1251 = ashr i64 %1250, 12
  %1252 = trunc i64 %1251 to i32
  %1253 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1254 = getelementptr inbounds [8 x i32], [8 x i32]* %1253, i64 12
  %1255 = load i32, i32* %7, align 4
  %1256 = zext i32 %1255 to i64
  %1257 = getelementptr inbounds [8 x i32], [8 x i32]* %1254, i64 0, i64 %1256
  store i32 %1252, i32* %1257, align 4
  %1258 = load i32, i32* %104, align 4
  %1259 = load i32, i32* %105, align 4
  %1260 = sub nsw i32 %1258, %1259
  %1261 = sext i32 %1260 to i64
  %1262 = add nsw i64 %1261, 2048
  %1263 = ashr i64 %1262, 12
  %1264 = mul nsw i64 %1263, 3784
  %1265 = trunc i64 %1264 to i32
  store i32 %1265, i32* %171, align 4
  %1266 = load i32, i32* %106, align 4
  %1267 = load i32, i32* %107, align 4
  %1268 = sub nsw i32 %1266, %1267
  %1269 = sext i32 %1268 to i64
  %1270 = add nsw i64 %1269, 2048
  %1271 = ashr i64 %1270, 12
  %1272 = mul nsw i64 %1271, 1567
  %1273 = trunc i64 %1272 to i32
  store i32 %1273, i32* %172, align 4
  %1274 = load i32, i32* %171, align 4
  %1275 = load i32, i32* %172, align 4
  %1276 = add nsw i32 %1274, %1275
  store i32 %1276, i32* %173, align 4
  %1277 = load i32, i32* %173, align 4
  %1278 = mul nsw i32 %1277, 2
  %1279 = load i32, i32* %108, align 4
  %1280 = sub nsw i32 %1278, %1279
  store i32 %1280, i32* %140, align 4
  %1281 = load i32, i32* %140, align 4
  %1282 = mul nsw i32 %1281, 2
  %1283 = load i32, i32* %109, align 4
  %1284 = sub nsw i32 %1282, %1283
  store i32 %1284, i32* %122, align 4
  %1285 = load i32, i32* %122, align 4
  %1286 = sext i32 %1285 to i64
  %1287 = add nsw i64 %1286, 2048
  %1288 = ashr i64 %1287, 12
  %1289 = trunc i64 %1288 to i32
  %1290 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1291 = getelementptr inbounds [8 x i32], [8 x i32]* %1290, i64 2
  %1292 = load i32, i32* %7, align 4
  %1293 = zext i32 %1292 to i64
  %1294 = getelementptr inbounds [8 x i32], [8 x i32]* %1291, i64 0, i64 %1293
  store i32 %1289, i32* %1294, align 4
  %1295 = load i32, i32* %138, align 4
  %1296 = load i32, i32* %139, align 4
  %1297 = sub nsw i32 %1295, %1296
  %1298 = sext i32 %1297 to i64
  %1299 = add nsw i64 %1298, 2048
  %1300 = ashr i64 %1299, 12
  %1301 = mul nsw i64 %1300, 2896
  %1302 = mul nsw i64 %1301, 2
  %1303 = load i32, i32* %140, align 4
  %1304 = sext i32 %1303 to i64
  %1305 = sub nsw i64 %1302, %1304
  %1306 = trunc i64 %1305 to i32
  store i32 %1306, i32* %174, align 4
  %1307 = load i32, i32* %110, align 4
  %1308 = load i32, i32* %111, align 4
  %1309 = sub nsw i32 %1307, %1308
  %1310 = sext i32 %1309 to i64
  %1311 = add nsw i64 %1310, 2048
  %1312 = ashr i64 %1311, 12
  %1313 = mul nsw i64 %1312, 3784
  %1314 = trunc i64 %1313 to i32
  store i32 %1314, i32* %176, align 4
  %1315 = load i32, i32* %112, align 4
  %1316 = load i32, i32* %113, align 4
  %1317 = sub nsw i32 %1315, %1316
  %1318 = sext i32 %1317 to i64
  %1319 = add nsw i64 %1318, 2048
  %1320 = ashr i64 %1319, 12
  %1321 = mul nsw i64 %1320, 1567
  %1322 = trunc i64 %1321 to i32
  store i32 %1322, i32* %177, align 4
  %1323 = load i32, i32* %176, align 4
  %1324 = load i32, i32* %177, align 4
  %1325 = add nsw i32 %1323, %1324
  store i32 %1325, i32* %178, align 4
  %1326 = load i32, i32* %178, align 4
  %1327 = mul nsw i32 %1326, 2
  %1328 = load i32, i32* %114, align 4
  %1329 = sub nsw i32 %1327, %1328
  store i32 %1329, i32* %144, align 4
  %1330 = load i32, i32* %144, align 4
  %1331 = mul nsw i32 %1330, 2
  %1332 = load i32, i32* %115, align 4
  %1333 = sub nsw i32 %1331, %1332
  store i32 %1333, i32* %130, align 4
  %1334 = load i32, i32* %130, align 4
  %1335 = sext i32 %1334 to i64
  %1336 = add nsw i64 %1335, 2048
  %1337 = ashr i64 %1336, 12
  %1338 = trunc i64 %1337 to i32
  %1339 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1340 = getelementptr inbounds [8 x i32], [8 x i32]* %1339, i64 1
  %1341 = load i32, i32* %7, align 4
  %1342 = zext i32 %1341 to i64
  %1343 = getelementptr inbounds [8 x i32], [8 x i32]* %1340, i64 0, i64 %1342
  store i32 %1338, i32* %1343, align 4
  %1344 = load i32, i32* %128, align 4
  %1345 = load i32, i32* %129, align 4
  %1346 = sub nsw i32 %1344, %1345
  %1347 = sext i32 %1346 to i64
  %1348 = add nsw i64 %1347, 2048
  %1349 = ashr i64 %1348, 12
  %1350 = mul nsw i64 %1349, 2896
  %1351 = mul nsw i64 %1350, 2
  %1352 = load i32, i32* %130, align 4
  %1353 = sext i32 %1352 to i64
  %1354 = sub nsw i64 %1351, %1353
  %1355 = trunc i64 %1354 to i32
  store i32 %1355, i32* %145, align 4
  %1356 = load i32, i32* %145, align 4
  %1357 = sext i32 %1356 to i64
  %1358 = add nsw i64 %1357, 2048
  %1359 = ashr i64 %1358, 12
  %1360 = trunc i64 %1359 to i32
  %1361 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1362 = getelementptr inbounds [8 x i32], [8 x i32]* %1361, i64 2
  %1363 = load i32, i32* %7, align 4
  %1364 = zext i32 %1363 to i64
  %1365 = getelementptr inbounds [8 x i32], [8 x i32]* %1362, i64 0, i64 %1364
  store i32 %1360, i32* %1365, align 4
  %1366 = load i32, i32* %142, align 4
  %1367 = load i32, i32* %143, align 4
  %1368 = sub nsw i32 %1366, %1367
  %1369 = sext i32 %1368 to i64
  %1370 = add nsw i64 %1369, 2048
  %1371 = ashr i64 %1370, 12
  %1372 = mul nsw i64 %1371, 2896
  %1373 = mul nsw i64 %1372, 2
  %1374 = load i32, i32* %144, align 4
  %1375 = sext i32 %1374 to i64
  %1376 = sub nsw i64 %1373, %1375
  %1377 = trunc i64 %1376 to i32
  store i32 %1377, i32* %179, align 4
  %1378 = load i32, i32* %179, align 4
  %1379 = mul nsw i32 %1378, 2
  %1380 = load i32, i32* %145, align 4
  %1381 = sub nsw i32 %1379, %1380
  store i32 %1381, i32* %161, align 4
  %1382 = load i32, i32* %161, align 4
  %1383 = sext i32 %1382 to i64
  %1384 = add nsw i64 %1383, 2048
  %1385 = ashr i64 %1384, 12
  %1386 = trunc i64 %1385 to i32
  %1387 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1388 = getelementptr inbounds [8 x i32], [8 x i32]* %1387, i64 6
  %1389 = load i32, i32* %7, align 4
  %1390 = zext i32 %1389 to i64
  %1391 = getelementptr inbounds [8 x i32], [8 x i32]* %1388, i64 0, i64 %1390
  store i32 %1386, i32* %1391, align 4
  %1392 = load i32, i32* %158, align 4
  %1393 = load i32, i32* %159, align 4
  %1394 = sub nsw i32 %1392, %1393
  %1395 = sext i32 %1394 to i64
  %1396 = add nsw i64 %1395, 2048
  %1397 = ashr i64 %1396, 12
  %1398 = mul nsw i64 %1397, 2896
  %1399 = mul nsw i64 %1398, 2
  %1400 = load i32, i32* %160, align 4
  %1401 = sext i32 %1400 to i64
  %1402 = sub nsw i64 %1399, %1401
  %1403 = mul nsw i64 %1402, 2
  %1404 = load i32, i32* %161, align 4
  %1405 = sext i32 %1404 to i64
  %1406 = sub nsw i64 %1403, %1405
  %1407 = trunc i64 %1406 to i32
  store i32 %1407, i32* %180, align 4
  %1408 = load i32, i32* %180, align 4
  %1409 = sext i32 %1408 to i64
  %1410 = add nsw i64 %1409, 2048
  %1411 = ashr i64 %1410, 12
  %1412 = trunc i64 %1411 to i32
  %1413 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1414 = getelementptr inbounds [8 x i32], [8 x i32]* %1413, i64 10
  %1415 = load i32, i32* %7, align 4
  %1416 = zext i32 %1415 to i64
  %1417 = getelementptr inbounds [8 x i32], [8 x i32]* %1414, i64 0, i64 %1416
  store i32 %1412, i32* %1417, align 4
  %1418 = load i32, i32* %176, align 4
  %1419 = load i32, i32* %177, align 4
  %1420 = sub nsw i32 %1418, %1419
  %1421 = sext i32 %1420 to i64
  %1422 = add nsw i64 %1421, 2048
  %1423 = ashr i64 %1422, 12
  %1424 = mul nsw i64 %1423, 2896
  %1425 = mul nsw i64 %1424, 2
  %1426 = load i32, i32* %178, align 4
  %1427 = sext i32 %1426 to i64
  %1428 = sub nsw i64 %1425, %1427
  %1429 = mul nsw i64 %1428, 2
  %1430 = load i32, i32* %179, align 4
  %1431 = sext i32 %1430 to i64
  %1432 = sub nsw i64 %1429, %1431
  %1433 = mul nsw i64 %1432, 2
  %1434 = load i32, i32* %180, align 4
  %1435 = sext i32 %1434 to i64
  %1436 = sub nsw i64 %1433, %1435
  %1437 = add nsw i64 %1436, 2048
  %1438 = ashr i64 %1437, 12
  %1439 = trunc i64 %1438 to i32
  %1440 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1441 = getelementptr inbounds [8 x i32], [8 x i32]* %1440, i64 14
  %1442 = load i32, i32* %7, align 4
  %1443 = zext i32 %1442 to i64
  %1444 = getelementptr inbounds [8 x i32], [8 x i32]* %1441, i64 0, i64 %1443
  store i32 %1439, i32* %1444, align 4
  %1445 = load i32, i32* %116, align 4
  %1446 = load i32, i32* %117, align 4
  %1447 = sub nsw i32 %1445, %1446
  %1448 = sext i32 %1447 to i64
  %1449 = add nsw i64 %1448, 2048
  %1450 = ashr i64 %1449, 12
  %1451 = mul nsw i64 %1450, 3784
  %1452 = trunc i64 %1451 to i32
  store i32 %1452, i32* %181, align 4
  %1453 = load i32, i32* %118, align 4
  %1454 = load i32, i32* %119, align 4
  %1455 = sub nsw i32 %1453, %1454
  %1456 = sext i32 %1455 to i64
  %1457 = add nsw i64 %1456, 2048
  %1458 = ashr i64 %1457, 12
  %1459 = mul nsw i64 %1458, 1567
  %1460 = trunc i64 %1459 to i32
  store i32 %1460, i32* %182, align 4
  %1461 = load i32, i32* %181, align 4
  %1462 = load i32, i32* %182, align 4
  %1463 = add nsw i32 %1461, %1462
  store i32 %1463, i32* %183, align 4
  %1464 = load i32, i32* %183, align 4
  %1465 = mul nsw i32 %1464, 2
  %1466 = load i32, i32* %120, align 4
  %1467 = sub nsw i32 %1465, %1466
  store i32 %1467, i32* %148, align 4
  %1468 = load i32, i32* %148, align 4
  %1469 = mul nsw i32 %1468, 2
  %1470 = load i32, i32* %121, align 4
  %1471 = sub nsw i32 %1469, %1470
  store i32 %1471, i32* %133, align 4
  %1472 = load i32, i32* %131, align 4
  %1473 = load i32, i32* %132, align 4
  %1474 = sub nsw i32 %1472, %1473
  %1475 = sext i32 %1474 to i64
  %1476 = add nsw i64 %1475, 2048
  %1477 = ashr i64 %1476, 12
  %1478 = mul nsw i64 %1477, 2896
  %1479 = mul nsw i64 %1478, 2
  %1480 = load i32, i32* %133, align 4
  %1481 = sext i32 %1480 to i64
  %1482 = sub nsw i64 %1479, %1481
  %1483 = trunc i64 %1482 to i32
  store i32 %1483, i32* %149, align 4
  %1484 = load i32, i32* %133, align 4
  %1485 = mul nsw i32 %1484, 2
  %1486 = load i32, i32* %122, align 4
  %1487 = sub nsw i32 %1485, %1486
  store i32 %1487, i32* %127, align 4
  %1488 = load i32, i32* %127, align 4
  %1489 = sext i32 %1488 to i64
  %1490 = add nsw i64 %1489, 2048
  %1491 = ashr i64 %1490, 12
  %1492 = trunc i64 %1491 to i32
  %1493 = load [8 x i32]*, [8 x i32]** %9, align 8
  %1494 = getelementptr inbounds [8 x i32], [8 x i32]* %1493, i64 0
  %1495 = load i32, i32* %7, align 4
  %1496 = zext i32 %1495 to i64
  %1497 = getelementptr inbounds [8 x i32], [8 x i32]* %1494, i64 0, i64 %1496
  store i32 %1492, i32* %1497, align 4
  %1498 = load i32, i32* %125, align 4
  %1499 = load i32, i32* %126, align 4
  %1500 = sub nsw i32 %1498, %1499
  %1501 = sext i32 %1500 to i64
  %1502 = add nsw i64 %1501, 2048
  %1503 = ashr i64 %1502, 12
  %1504 = mul nsw i64 %1503, 2896
  %1505 = mul nsw i64 %1504, 2
  %1506 = load i32, i32* %127, align 4
  %1507 = sext i32 %1506 to i64
  %1508 = sub nsw i64 %1505, %1507
  %1509 = trunc i64 %1508 to i32
  store i32 %1509, i32* %134, align 4
  %1510 = load i32, i32* %134, align 4
  %1511 = sext i32 %1510 to i64
  %1512 = add nsw i64 %1511, 2048
  %1513 = ashr i64 %1512, 12
  %1514 = trunc i64 %1513 to i32
  %1515 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1516 = getelementptr inbounds [8 x i32], [8 x i32]* %1515, i64 1
  %1517 = load i32, i32* %7, align 4
  %1518 = zext i32 %1517 to i64
  %1519 = getelementptr inbounds [8 x i32], [8 x i32]* %1516, i64 0, i64 %1518
  store i32 %1514, i32* %1519, align 4
  %1520 = load i32, i32* %149, align 4
  %1521 = mul nsw i32 %1520, 2
  %1522 = load i32, i32* %134, align 4
  %1523 = sub nsw i32 %1521, %1522
  store i32 %1523, i32* %141, align 4
  %1524 = load i32, i32* %141, align 4
  %1525 = sext i32 %1524 to i64
  %1526 = add nsw i64 %1525, 2048
  %1527 = ashr i64 %1526, 12
  %1528 = trunc i64 %1527 to i32
  %1529 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1530 = getelementptr inbounds [8 x i32], [8 x i32]* %1529, i64 3
  %1531 = load i32, i32* %7, align 4
  %1532 = zext i32 %1531 to i64
  %1533 = getelementptr inbounds [8 x i32], [8 x i32]* %1530, i64 0, i64 %1532
  store i32 %1528, i32* %1533, align 4
  %1534 = load i32, i32* %174, align 4
  %1535 = mul nsw i32 %1534, 2
  %1536 = load i32, i32* %141, align 4
  %1537 = sub nsw i32 %1535, %1536
  store i32 %1537, i32* %150, align 4
  %1538 = load i32, i32* %150, align 4
  %1539 = sext i32 %1538 to i64
  %1540 = add nsw i64 %1539, 2048
  %1541 = ashr i64 %1540, 12
  %1542 = trunc i64 %1541 to i32
  %1543 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1544 = getelementptr inbounds [8 x i32], [8 x i32]* %1543, i64 5
  %1545 = load i32, i32* %7, align 4
  %1546 = zext i32 %1545 to i64
  %1547 = getelementptr inbounds [8 x i32], [8 x i32]* %1544, i64 0, i64 %1546
  store i32 %1542, i32* %1547, align 4
  %1548 = load i32, i32* %146, align 4
  %1549 = load i32, i32* %147, align 4
  %1550 = sub nsw i32 %1548, %1549
  %1551 = sext i32 %1550 to i64
  %1552 = add nsw i64 %1551, 2048
  %1553 = ashr i64 %1552, 12
  %1554 = mul nsw i64 %1553, 2896
  %1555 = mul nsw i64 %1554, 2
  %1556 = load i32, i32* %148, align 4
  %1557 = sext i32 %1556 to i64
  %1558 = sub nsw i64 %1555, %1557
  %1559 = trunc i64 %1558 to i32
  store i32 %1559, i32* %184, align 4
  %1560 = load i32, i32* %184, align 4
  %1561 = mul nsw i32 %1560, 2
  %1562 = load i32, i32* %149, align 4
  %1563 = sub nsw i32 %1561, %1562
  store i32 %1563, i32* %165, align 4
  %1564 = load i32, i32* %165, align 4
  %1565 = mul nsw i32 %1564, 2
  %1566 = load i32, i32* %150, align 4
  %1567 = sub nsw i32 %1565, %1566
  store i32 %1567, i32* %157, align 4
  %1568 = load i32, i32* %157, align 4
  %1569 = sext i32 %1568 to i64
  %1570 = add nsw i64 %1569, 2048
  %1571 = ashr i64 %1570, 12
  %1572 = trunc i64 %1571 to i32
  %1573 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1574 = getelementptr inbounds [8 x i32], [8 x i32]* %1573, i64 7
  %1575 = load i32, i32* %7, align 4
  %1576 = zext i32 %1575 to i64
  %1577 = getelementptr inbounds [8 x i32], [8 x i32]* %1574, i64 0, i64 %1576
  store i32 %1572, i32* %1577, align 4
  %1578 = load i32, i32* %154, align 4
  %1579 = load i32, i32* %155, align 4
  %1580 = sub nsw i32 %1578, %1579
  %1581 = sext i32 %1580 to i64
  %1582 = add nsw i64 %1581, 2048
  %1583 = ashr i64 %1582, 12
  %1584 = mul nsw i64 %1583, 2896
  %1585 = mul nsw i64 %1584, 2
  %1586 = load i32, i32* %156, align 4
  %1587 = sext i32 %1586 to i64
  %1588 = sub nsw i64 %1585, %1587
  %1589 = mul nsw i64 %1588, 2
  %1590 = load i32, i32* %157, align 4
  %1591 = sext i32 %1590 to i64
  %1592 = sub nsw i64 %1589, %1591
  %1593 = trunc i64 %1592 to i32
  store i32 %1593, i32* %166, align 4
  %1594 = load i32, i32* %166, align 4
  %1595 = sext i32 %1594 to i64
  %1596 = add nsw i64 %1595, 2048
  %1597 = ashr i64 %1596, 12
  %1598 = trunc i64 %1597 to i32
  %1599 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1600 = getelementptr inbounds [8 x i32], [8 x i32]* %1599, i64 9
  %1601 = load i32, i32* %7, align 4
  %1602 = zext i32 %1601 to i64
  %1603 = getelementptr inbounds [8 x i32], [8 x i32]* %1600, i64 0, i64 %1602
  store i32 %1598, i32* %1603, align 4
  %1604 = load i32, i32* %162, align 4
  %1605 = load i32, i32* %163, align 4
  %1606 = sub nsw i32 %1604, %1605
  %1607 = sext i32 %1606 to i64
  %1608 = add nsw i64 %1607, 2048
  %1609 = ashr i64 %1608, 12
  %1610 = mul nsw i64 %1609, 2896
  %1611 = mul nsw i64 %1610, 2
  %1612 = load i32, i32* %164, align 4
  %1613 = sext i32 %1612 to i64
  %1614 = sub nsw i64 %1611, %1613
  %1615 = mul nsw i64 %1614, 2
  %1616 = load i32, i32* %165, align 4
  %1617 = sext i32 %1616 to i64
  %1618 = sub nsw i64 %1615, %1617
  %1619 = trunc i64 %1618 to i32
  store i32 %1619, i32* %185, align 4
  %1620 = load i32, i32* %185, align 4
  %1621 = mul nsw i32 %1620, 2
  %1622 = load i32, i32* %166, align 4
  %1623 = sub nsw i32 %1621, %1622
  store i32 %1623, i32* %175, align 4
  %1624 = load i32, i32* %175, align 4
  %1625 = sext i32 %1624 to i64
  %1626 = add nsw i64 %1625, 2048
  %1627 = ashr i64 %1626, 12
  %1628 = trunc i64 %1627 to i32
  %1629 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1630 = getelementptr inbounds [8 x i32], [8 x i32]* %1629, i64 11
  %1631 = load i32, i32* %7, align 4
  %1632 = zext i32 %1631 to i64
  %1633 = getelementptr inbounds [8 x i32], [8 x i32]* %1630, i64 0, i64 %1632
  store i32 %1628, i32* %1633, align 4
  %1634 = load i32, i32* %171, align 4
  %1635 = load i32, i32* %172, align 4
  %1636 = sub nsw i32 %1634, %1635
  %1637 = sext i32 %1636 to i64
  %1638 = add nsw i64 %1637, 2048
  %1639 = ashr i64 %1638, 12
  %1640 = mul nsw i64 %1639, 2896
  %1641 = mul nsw i64 %1640, 2
  %1642 = load i32, i32* %173, align 4
  %1643 = sext i32 %1642 to i64
  %1644 = sub nsw i64 %1641, %1643
  %1645 = mul nsw i64 %1644, 2
  %1646 = load i32, i32* %174, align 4
  %1647 = sext i32 %1646 to i64
  %1648 = sub nsw i64 %1645, %1647
  %1649 = mul nsw i64 %1648, 2
  %1650 = load i32, i32* %175, align 4
  %1651 = sext i32 %1650 to i64
  %1652 = sub nsw i64 %1649, %1651
  %1653 = trunc i64 %1652 to i32
  store i32 %1653, i32* %186, align 4
  %1654 = load i32, i32* %186, align 4
  %1655 = sext i32 %1654 to i64
  %1656 = add nsw i64 %1655, 2048
  %1657 = ashr i64 %1656, 12
  %1658 = trunc i64 %1657 to i32
  %1659 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1660 = getelementptr inbounds [8 x i32], [8 x i32]* %1659, i64 13
  %1661 = load i32, i32* %7, align 4
  %1662 = zext i32 %1661 to i64
  %1663 = getelementptr inbounds [8 x i32], [8 x i32]* %1660, i64 0, i64 %1662
  store i32 %1658, i32* %1663, align 4
  %1664 = load i32, i32* %181, align 4
  %1665 = load i32, i32* %182, align 4
  %1666 = sub nsw i32 %1664, %1665
  %1667 = sext i32 %1666 to i64
  %1668 = add nsw i64 %1667, 2048
  %1669 = ashr i64 %1668, 12
  %1670 = mul nsw i64 %1669, 2896
  %1671 = mul nsw i64 %1670, 2
  %1672 = load i32, i32* %183, align 4
  %1673 = sext i32 %1672 to i64
  %1674 = sub nsw i64 %1671, %1673
  %1675 = mul nsw i64 %1674, 2
  %1676 = load i32, i32* %184, align 4
  %1677 = sext i32 %1676 to i64
  %1678 = sub nsw i64 %1675, %1677
  %1679 = mul nsw i64 %1678, 2
  %1680 = load i32, i32* %185, align 4
  %1681 = sext i32 %1680 to i64
  %1682 = sub nsw i64 %1679, %1681
  %1683 = mul nsw i64 %1682, 2
  %1684 = load i32, i32* %186, align 4
  %1685 = sext i32 %1684 to i64
  %1686 = sub nsw i64 %1683, %1685
  %1687 = add nsw i64 %1686, 2048
  %1688 = ashr i64 %1687, 12
  %1689 = trunc i64 %1688 to i32
  %1690 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1691 = getelementptr inbounds [8 x i32], [8 x i32]* %1690, i64 15
  %1692 = load i32, i32* %7, align 4
  %1693 = zext i32 %1692 to i64
  %1694 = getelementptr inbounds [8 x i32], [8 x i32]* %1691, i64 0, i64 %1693
  store i32 %1689, i32* %1694, align 4
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #1

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
