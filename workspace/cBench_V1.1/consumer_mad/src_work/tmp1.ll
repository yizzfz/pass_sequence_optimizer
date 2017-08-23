; ModuleID = 'synth.ll'
source_filename = "synth.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mad_synth = type { [2 x [2 x [2 x [16 x [8 x i32]]]]], i32, %struct.mad_pcm }
%struct.mad_pcm = type { i32, i16, i16, [2 x [1152 x i32]] }
%struct.mad_frame = type { %struct.mad_header, i32, [2 x [36 x [32 x i32]]], [2 x [32 x [18 x i32]]]* }
%struct.mad_header = type { i32, i32, i32, i32, i64, i32, i16, i16, i32, i32, %struct.mad_timer_t }
%struct.mad_timer_t = type { i64, i64 }

@D = internal constant [17 x [32 x i32]] [[32 x i32] [i32 0, i32 -7, i32 53, i32 -115, i32 509, i32 -1288, i32 1644, i32 -9372, i32 18760, i32 9372, i32 1644, i32 1288, i32 509, i32 115, i32 53, i32 7, i32 0, i32 -7, i32 53, i32 -115, i32 509, i32 -1288, i32 1644, i32 -9372, i32 18760, i32 9372, i32 1644, i32 1288, i32 509, i32 115, i32 53, i32 7], [32 x i32] [i32 0, i32 -8, i32 55, i32 -130, i32 500, i32 -1379, i32 1490, i32 -9834, i32 18748, i32 8910, i32 1784, i32 1197, i32 516, i32 100, i32 52, i32 7, i32 0, i32 -8, i32 55, i32 -130, i32 500, i32 -1379, i32 1490, i32 -9834, i32 18748, i32 8910, i32 1784, i32 1197, i32 516, i32 100, i32 52, i32 7], [32 x i32] [i32 0, i32 -9, i32 56, i32 -145, i32 488, i32 -1470, i32 1322, i32 -10294, i32 18714, i32 8448, i32 1910, i32 1106, i32 520, i32 87, i32 51, i32 6, i32 0, i32 -9, i32 56, i32 -145, i32 488, i32 -1470, i32 1322, i32 -10294, i32 18714, i32 8448, i32 1910, i32 1106, i32 520, i32 87, i32 51, i32 6], [32 x i32] [i32 0, i32 -10, i32 56, i32 -161, i32 473, i32 -1559, i32 1140, i32 -10752, i32 18658, i32 7987, i32 2023, i32 1016, i32 522, i32 74, i32 49, i32 5, i32 0, i32 -10, i32 56, i32 -161, i32 473, i32 -1559, i32 1140, i32 -10752, i32 18658, i32 7987, i32 2023, i32 1016, i32 522, i32 74, i32 49, i32 5], [32 x i32] [i32 0, i32 -10, i32 57, i32 -178, i32 456, i32 -1647, i32 944, i32 -11205, i32 18578, i32 7528, i32 2123, i32 926, i32 521, i32 61, i32 48, i32 5, i32 0, i32 -10, i32 57, i32 -178, i32 456, i32 -1647, i32 944, i32 -11205, i32 18578, i32 7528, i32 2123, i32 926, i32 521, i32 61, i32 48, i32 5], [32 x i32] [i32 0, i32 -11, i32 57, i32 -195, i32 435, i32 -1734, i32 734, i32 -11654, i32 18477, i32 7072, i32 2210, i32 838, i32 519, i32 49, i32 46, i32 4, i32 0, i32 -11, i32 57, i32 -195, i32 435, i32 -1734, i32 734, i32 -11654, i32 18477, i32 7072, i32 2210, i32 838, i32 519, i32 49, i32 46, i32 4], [32 x i32] [i32 0, i32 -12, i32 57, i32 -212, i32 411, i32 -1818, i32 509, i32 -12098, i32 18354, i32 6621, i32 2285, i32 751, i32 514, i32 38, i32 44, i32 4, i32 0, i32 -12, i32 57, i32 -212, i32 411, i32 -1818, i32 509, i32 -12098, i32 18354, i32 6621, i32 2285, i32 751, i32 514, i32 38, i32 44, i32 4], [32 x i32] [i32 -1, i32 -13, i32 57, i32 -230, i32 384, i32 -1899, i32 271, i32 -12534, i32 18209, i32 6174, i32 2347, i32 666, i32 508, i32 28, i32 42, i32 4, i32 -1, i32 -13, i32 57, i32 -230, i32 384, i32 -1899, i32 271, i32 -12534, i32 18209, i32 6174, i32 2347, i32 666, i32 508, i32 28, i32 42, i32 4], [32 x i32] [i32 -1, i32 -15, i32 56, i32 -248, i32 354, i32 -1978, i32 18, i32 -12963, i32 18042, i32 5732, i32 2398, i32 583, i32 500, i32 18, i32 40, i32 3, i32 -1, i32 -15, i32 56, i32 -248, i32 354, i32 -1978, i32 18, i32 -12963, i32 18042, i32 5732, i32 2398, i32 583, i32 500, i32 18, i32 40, i32 3], [32 x i32] [i32 -1, i32 -16, i32 55, i32 -266, i32 320, i32 -2052, i32 -250, i32 -13384, i32 17855, i32 5297, i32 2438, i32 502, i32 491, i32 9, i32 39, i32 3, i32 -1, i32 -16, i32 55, i32 -266, i32 320, i32 -2052, i32 -250, i32 -13384, i32 17855, i32 5297, i32 2438, i32 502, i32 491, i32 9, i32 39, i32 3], [32 x i32] [i32 -1, i32 -17, i32 54, i32 -284, i32 283, i32 -2123, i32 -531, i32 -13795, i32 17648, i32 4870, i32 2466, i32 423, i32 480, i32 1, i32 37, i32 3, i32 -1, i32 -17, i32 54, i32 -284, i32 283, i32 -2123, i32 -531, i32 -13795, i32 17648, i32 4870, i32 2466, i32 423, i32 480, i32 1, i32 37, i32 3], [32 x i32] [i32 -1, i32 -18, i32 52, i32 -303, i32 243, i32 -2189, i32 -825, i32 -14195, i32 17420, i32 4450, i32 2484, i32 347, i32 468, i32 -7, i32 35, i32 2, i32 -1, i32 -18, i32 52, i32 -303, i32 243, i32 -2189, i32 -825, i32 -14195, i32 17420, i32 4450, i32 2484, i32 347, i32 468, i32 -7, i32 35, i32 2], [32 x i32] [i32 -1, i32 -20, i32 50, i32 -321, i32 199, i32 -2250, i32 -1133, i32 -14583, i32 17173, i32 4039, i32 2492, i32 274, i32 454, i32 -14, i32 33, i32 2, i32 -1, i32 -20, i32 50, i32 -321, i32 199, i32 -2250, i32 -1133, i32 -14583, i32 17173, i32 4039, i32 2492, i32 274, i32 454, i32 -14, i32 33, i32 2], [32 x i32] [i32 -1, i32 -21, i32 47, i32 -339, i32 151, i32 -2305, i32 -1455, i32 -14960, i32 16907, i32 3637, i32 2490, i32 204, i32 440, i32 -21, i32 31, i32 2, i32 -1, i32 -21, i32 47, i32 -339, i32 151, i32 -2305, i32 -1455, i32 -14960, i32 16907, i32 3637, i32 2490, i32 204, i32 440, i32 -21, i32 31, i32 2], [32 x i32] [i32 -1, i32 -23, i32 44, i32 -357, i32 101, i32 -2354, i32 -1789, i32 -15322, i32 16624, i32 3245, i32 2479, i32 136, i32 425, i32 -27, i32 29, i32 2, i32 -1, i32 -23, i32 44, i32 -357, i32 101, i32 -2354, i32 -1789, i32 -15322, i32 16624, i32 3245, i32 2479, i32 136, i32 425, i32 -27, i32 29, i32 2], [32 x i32] [i32 -1, i32 -24, i32 41, i32 -375, i32 46, i32 -2396, i32 -2135, i32 -15671, i32 16323, i32 2864, i32 2460, i32 72, i32 409, i32 -32, i32 28, i32 2, i32 -1, i32 -24, i32 41, i32 -375, i32 46, i32 -2396, i32 -2135, i32 -15671, i32 16323, i32 2864, i32 2460, i32 72, i32 409, i32 -32, i32 28, i32 2], [32 x i32] [i32 -1, i32 -26, i32 37, i32 -392, i32 -11, i32 -2432, i32 -2494, i32 -16005, i32 16005, i32 2494, i32 2432, i32 11, i32 392, i32 -37, i32 26, i32 1, i32 -1, i32 -26, i32 37, i32 -392, i32 -11, i32 -2432, i32 -2494, i32 -16005, i32 16005, i32 2494, i32 2432, i32 11, i32 392, i32 -37, i32 26, i32 1]], align 16

; Function Attrs: nounwind uwtable
define void @mad_synth_init(%struct.mad_synth*) #0 {
  %2 = alloca %struct.mad_synth*, align 8
  store %struct.mad_synth* %0, %struct.mad_synth** %2, align 8
  %3 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  call void @mad_synth_mute(%struct.mad_synth* %3)
  %4 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  %5 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %4, i32 0, i32 1
  store i32 0, i32* %5, align 4
  %6 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  %7 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %6, i32 0, i32 2
  %8 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %7, i32 0, i32 0
  store i32 0, i32* %8, align 4
  %9 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  %10 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %9, i32 0, i32 2
  %11 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %10, i32 0, i32 1
  store i16 0, i16* %11, align 4
  %12 = load %struct.mad_synth*, %struct.mad_synth** %2, align 8
  %13 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %12, i32 0, i32 2
  %14 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %13, i32 0, i32 2
  store i16 0, i16* %14, align 2
  ret void
}

; Function Attrs: nounwind uwtable
define void @mad_synth_mute(%struct.mad_synth*) #0 {
  %2 = alloca %struct.mad_synth*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.mad_synth* %0, %struct.mad_synth** %2, align 8
  store i32 0, i32* %3, align 4
  br label %6

; <label>:6:                                      ; preds = %78, %1
  %7 = load i32, i32* %3, align 4
  %8 = icmp ult i32 %7, 2
  br i1 %8, label %9, label %81

; <label>:9:                                      ; preds = %6
  store i32 0, i32* %4, align 4
  br label %10

; <label>:10:                                     ; preds = %74, %9
  %11 = load i32, i32* %4, align 4
  %12 = icmp ult i32 %11, 16
  br i1 %12, label %13, label %77

; <label>:13:                                     ; preds = %10
  store i32 0, i32* %5, align 4
  br label %14

; <label>:14:                                     ; preds = %70, %13
  %15 = load i32, i32* %5, align 4
  %16 = icmp ult i32 %15, 8
  br i1 %16, label %17, label %73

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
  %71 = load i32, i32* %5, align 4
  %72 = add i32 %71, 1
  store i32 %72, i32* %5, align 4
  br label %14

; <label>:73:                                     ; preds = %14
  br label %74

; <label>:74:                                     ; preds = %73
  %75 = load i32, i32* %4, align 4
  %76 = add i32 %75, 1
  store i32 %76, i32* %4, align 4
  br label %10

; <label>:77:                                     ; preds = %10
  br label %78

; <label>:78:                                     ; preds = %77
  %79 = load i32, i32* %3, align 4
  %80 = add i32 %79, 1
  store i32 %80, i32* %3, align 4
  br label %6

; <label>:81:                                     ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
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
  %13 = select i1 %12, i32 2, i32 1
  store i32 %13, i32* %5, align 4
  %14 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %15 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %14, i32 0, i32 0
  %16 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 8
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %2
  br label %36

; <label>:20:                                     ; preds = %2
  %21 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %22 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %22, i32 0, i32 0
  %24 = load i32, i32* %23, align 8
  %25 = icmp eq i32 %24, 3
  br i1 %25, label %26, label %33

; <label>:26:                                     ; preds = %20
  %27 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %28 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %27, i32 0, i32 0
  %29 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %28, i32 0, i32 8
  %30 = load i32, i32* %29, align 8
  %31 = and i32 %30, 4096
  %32 = icmp ne i32 %31, 0
  br label %33

; <label>:33:                                     ; preds = %26, %20
  %34 = phi i1 [ false, %20 ], [ %32, %26 ]
  %35 = select i1 %34, i32 18, i32 36
  br label %36

; <label>:36:                                     ; preds = %33, %19
  %37 = phi i32 [ 12, %19 ], [ %35, %33 ]
  store i32 %37, i32* %6, align 4
  %38 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %39 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %38, i32 0, i32 0
  %40 = getelementptr inbounds %struct.mad_header, %struct.mad_header* %39, i32 0, i32 5
  %41 = load i32, i32* %40, align 8
  %42 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %43 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %42, i32 0, i32 2
  %44 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %43, i32 0, i32 0
  store i32 %41, i32* %44, align 4
  %45 = load i32, i32* %5, align 4
  %46 = trunc i32 %45 to i16
  %47 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %48 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %47, i32 0, i32 2
  %49 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %48, i32 0, i32 1
  store i16 %46, i16* %49, align 4
  %50 = load i32, i32* %6, align 4
  %51 = mul i32 32, %50
  %52 = trunc i32 %51 to i16
  %53 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %54 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %53, i32 0, i32 2
  %55 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %54, i32 0, i32 2
  store i16 %52, i16* %55, align 2
  store void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)* @synth_full, void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)** %7, align 8
  %56 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %57 = getelementptr inbounds %struct.mad_frame, %struct.mad_frame* %56, i32 0, i32 1
  %58 = load i32, i32* %57, align 8
  %59 = and i32 %58, 2
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %74

; <label>:61:                                     ; preds = %36
  %62 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %63 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %62, i32 0, i32 2
  %64 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %63, i32 0, i32 0
  %65 = load i32, i32* %64, align 4
  %66 = udiv i32 %65, 2
  store i32 %66, i32* %64, align 4
  %67 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %68 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %67, i32 0, i32 2
  %69 = getelementptr inbounds %struct.mad_pcm, %struct.mad_pcm* %68, i32 0, i32 2
  %70 = load i16, i16* %69, align 2
  %71 = zext i16 %70 to i32
  %72 = sdiv i32 %71, 2
  %73 = trunc i32 %72 to i16
  store i16 %73, i16* %69, align 2
  store void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)* @synth_half, void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)** %7, align 8
  br label %74

; <label>:74:                                     ; preds = %61, %36
  %75 = load void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)*, void (%struct.mad_synth*, %struct.mad_frame*, i32, i32)** %7, align 8
  %76 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %77 = load %struct.mad_frame*, %struct.mad_frame** %4, align 8
  %78 = load i32, i32* %5, align 4
  %79 = load i32, i32* %6, align 4
  call void %75(%struct.mad_synth* %76, %struct.mad_frame* %77, i32 %78, i32 %79)
  %80 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %81 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %80, i32 0, i32 1
  %82 = load i32, i32* %81, align 4
  %83 = load i32, i32* %6, align 4
  %84 = add i32 %82, %83
  %85 = urem i32 %84, 16
  %86 = load %struct.mad_synth*, %struct.mad_synth** %3, align 8
  %87 = getelementptr inbounds %struct.mad_synth, %struct.mad_synth* %86, i32 0, i32 1
  store i32 %85, i32* %87, align 4
  ret void
}

; Function Attrs: nounwind uwtable
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

; <label>:26:                                     ; preds = %690, %4
  %27 = load i32, i32* %10, align 4
  %28 = load i32, i32* %7, align 4
  %29 = icmp ult i32 %27, %28
  br i1 %29, label %30, label %693

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

; <label>:51:                                     ; preds = %686, %30
  %52 = load i32, i32* %11, align 4
  %53 = load i32, i32* %8, align 4
  %54 = icmp ult i32 %52, %53
  br i1 %54, label %55, label %689

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
  br i1 %269, label %270, label %598

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
  %596 = load i32, i32* %12, align 4
  %597 = add i32 %596, 1
  store i32 %597, i32* %12, align 4
  br label %267

; <label>:598:                                    ; preds = %267
  %599 = load [32 x i32]*, [32 x i32]** %22, align 8
  %600 = getelementptr inbounds [32 x i32], [32 x i32]* %599, i32 1
  store [32 x i32]* %600, [32 x i32]** %22, align 8
  %601 = load [32 x i32]*, [32 x i32]** %22, align 8
  %602 = getelementptr inbounds [32 x i32], [32 x i32]* %601, i32 0, i32 0
  %603 = load i32, i32* %14, align 4
  %604 = zext i32 %603 to i64
  %605 = getelementptr inbounds i32, i32* %602, i64 %604
  store i32* %605, i32** %23, align 8
  %606 = load [8 x i32]*, [8 x i32]** %21, align 8
  %607 = getelementptr inbounds [8 x i32], [8 x i32]* %606, i64 0, i64 0
  %608 = load i32, i32* %607, align 4
  %609 = load i32*, i32** %23, align 8
  %610 = getelementptr inbounds i32, i32* %609, i64 0
  %611 = load i32, i32* %610, align 4
  %612 = mul nsw i32 %608, %611
  store i32 %612, i32* %25, align 4
  %613 = load [8 x i32]*, [8 x i32]** %21, align 8
  %614 = getelementptr inbounds [8 x i32], [8 x i32]* %613, i64 0, i64 1
  %615 = load i32, i32* %614, align 4
  %616 = load i32*, i32** %23, align 8
  %617 = getelementptr inbounds i32, i32* %616, i64 14
  %618 = load i32, i32* %617, align 4
  %619 = mul nsw i32 %615, %618
  %620 = load i32, i32* %25, align 4
  %621 = add i32 %620, %619
  store i32 %621, i32* %25, align 4
  %622 = load [8 x i32]*, [8 x i32]** %21, align 8
  %623 = getelementptr inbounds [8 x i32], [8 x i32]* %622, i64 0, i64 2
  %624 = load i32, i32* %623, align 4
  %625 = load i32*, i32** %23, align 8
  %626 = getelementptr inbounds i32, i32* %625, i64 12
  %627 = load i32, i32* %626, align 4
  %628 = mul nsw i32 %624, %627
  %629 = load i32, i32* %25, align 4
  %630 = add i32 %629, %628
  store i32 %630, i32* %25, align 4
  %631 = load [8 x i32]*, [8 x i32]** %21, align 8
  %632 = getelementptr inbounds [8 x i32], [8 x i32]* %631, i64 0, i64 3
  %633 = load i32, i32* %632, align 4
  %634 = load i32*, i32** %23, align 8
  %635 = getelementptr inbounds i32, i32* %634, i64 10
  %636 = load i32, i32* %635, align 4
  %637 = mul nsw i32 %633, %636
  %638 = load i32, i32* %25, align 4
  %639 = add i32 %638, %637
  store i32 %639, i32* %25, align 4
  %640 = load [8 x i32]*, [8 x i32]** %21, align 8
  %641 = getelementptr inbounds [8 x i32], [8 x i32]* %640, i64 0, i64 4
  %642 = load i32, i32* %641, align 4
  %643 = load i32*, i32** %23, align 8
  %644 = getelementptr inbounds i32, i32* %643, i64 8
  %645 = load i32, i32* %644, align 4
  %646 = mul nsw i32 %642, %645
  %647 = load i32, i32* %25, align 4
  %648 = add i32 %647, %646
  store i32 %648, i32* %25, align 4
  %649 = load [8 x i32]*, [8 x i32]** %21, align 8
  %650 = getelementptr inbounds [8 x i32], [8 x i32]* %649, i64 0, i64 5
  %651 = load i32, i32* %650, align 4
  %652 = load i32*, i32** %23, align 8
  %653 = getelementptr inbounds i32, i32* %652, i64 6
  %654 = load i32, i32* %653, align 4
  %655 = mul nsw i32 %651, %654
  %656 = load i32, i32* %25, align 4
  %657 = add i32 %656, %655
  store i32 %657, i32* %25, align 4
  %658 = load [8 x i32]*, [8 x i32]** %21, align 8
  %659 = getelementptr inbounds [8 x i32], [8 x i32]* %658, i64 0, i64 6
  %660 = load i32, i32* %659, align 4
  %661 = load i32*, i32** %23, align 8
  %662 = getelementptr inbounds i32, i32* %661, i64 4
  %663 = load i32, i32* %662, align 4
  %664 = mul nsw i32 %660, %663
  %665 = load i32, i32* %25, align 4
  %666 = add i32 %665, %664
  store i32 %666, i32* %25, align 4
  %667 = load [8 x i32]*, [8 x i32]** %21, align 8
  %668 = getelementptr inbounds [8 x i32], [8 x i32]* %667, i64 0, i64 7
  %669 = load i32, i32* %668, align 4
  %670 = load i32*, i32** %23, align 8
  %671 = getelementptr inbounds i32, i32* %670, i64 2
  %672 = load i32, i32* %671, align 4
  %673 = mul nsw i32 %669, %672
  %674 = load i32, i32* %25, align 4
  %675 = add i32 %674, %673
  store i32 %675, i32* %25, align 4
  %676 = load i32, i32* %24, align 4
  %677 = load i32, i32* %25, align 4
  %678 = sub nsw i32 0, %677
  %679 = ashr i32 %678, 2
  %680 = load i32*, i32** %15, align 8
  store i32 %679, i32* %680, align 4
  %681 = load i32*, i32** %15, align 8
  %682 = getelementptr inbounds i32, i32* %681, i64 16
  store i32* %682, i32** %15, align 8
  %683 = load i32, i32* %9, align 4
  %684 = add i32 %683, 1
  %685 = urem i32 %684, 16
  store i32 %685, i32* %9, align 4
  br label %686

; <label>:686:                                    ; preds = %598
  %687 = load i32, i32* %11, align 4
  %688 = add i32 %687, 1
  store i32 %688, i32* %11, align 4
  br label %51

; <label>:689:                                    ; preds = %51
  br label %690

; <label>:690:                                    ; preds = %689
  %691 = load i32, i32* %10, align 4
  %692 = add i32 %691, 1
  store i32 %692, i32* %10, align 4
  br label %26

; <label>:693:                                    ; preds = %26
  ret void
}

; Function Attrs: nounwind uwtable
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

; <label>:26:                                     ; preds = %695, %4
  %27 = load i32, i32* %10, align 4
  %28 = load i32, i32* %7, align 4
  %29 = icmp ult i32 %27, %28
  br i1 %29, label %30, label %698

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

; <label>:51:                                     ; preds = %691, %30
  %52 = load i32, i32* %11, align 4
  %53 = load i32, i32* %8, align 4
  %54 = icmp ult i32 %52, %53
  br i1 %54, label %55, label %694

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

; <label>:267:                                    ; preds = %600, %55
  %268 = load i32, i32* %12, align 4
  %269 = icmp ult i32 %268, 16
  br i1 %269, label %270, label %603

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
  br i1 %277, label %597, label %278

; <label>:278:                                    ; preds = %270
  %279 = load [32 x i32]*, [32 x i32]** %22, align 8
  %280 = getelementptr inbounds [32 x i32], [32 x i32]* %279, i32 0, i32 0
  %281 = load i32, i32* %14, align 4
  %282 = zext i32 %281 to i64
  %283 = getelementptr inbounds i32, i32* %280, i64 %282
  store i32* %283, i32** %23, align 8
  %284 = load [8 x i32]*, [8 x i32]** %21, align 8
  %285 = getelementptr inbounds [8 x i32], [8 x i32]* %284, i64 0, i64 0
  %286 = load i32, i32* %285, align 4
  %287 = load i32*, i32** %23, align 8
  %288 = getelementptr inbounds i32, i32* %287, i64 0
  %289 = load i32, i32* %288, align 4
  %290 = mul nsw i32 %286, %289
  store i32 %290, i32* %25, align 4
  %291 = load [8 x i32]*, [8 x i32]** %21, align 8
  %292 = getelementptr inbounds [8 x i32], [8 x i32]* %291, i64 0, i64 1
  %293 = load i32, i32* %292, align 4
  %294 = load i32*, i32** %23, align 8
  %295 = getelementptr inbounds i32, i32* %294, i64 14
  %296 = load i32, i32* %295, align 4
  %297 = mul nsw i32 %293, %296
  %298 = load i32, i32* %25, align 4
  %299 = add i32 %298, %297
  store i32 %299, i32* %25, align 4
  %300 = load [8 x i32]*, [8 x i32]** %21, align 8
  %301 = getelementptr inbounds [8 x i32], [8 x i32]* %300, i64 0, i64 2
  %302 = load i32, i32* %301, align 4
  %303 = load i32*, i32** %23, align 8
  %304 = getelementptr inbounds i32, i32* %303, i64 12
  %305 = load i32, i32* %304, align 4
  %306 = mul nsw i32 %302, %305
  %307 = load i32, i32* %25, align 4
  %308 = add i32 %307, %306
  store i32 %308, i32* %25, align 4
  %309 = load [8 x i32]*, [8 x i32]** %21, align 8
  %310 = getelementptr inbounds [8 x i32], [8 x i32]* %309, i64 0, i64 3
  %311 = load i32, i32* %310, align 4
  %312 = load i32*, i32** %23, align 8
  %313 = getelementptr inbounds i32, i32* %312, i64 10
  %314 = load i32, i32* %313, align 4
  %315 = mul nsw i32 %311, %314
  %316 = load i32, i32* %25, align 4
  %317 = add i32 %316, %315
  store i32 %317, i32* %25, align 4
  %318 = load [8 x i32]*, [8 x i32]** %21, align 8
  %319 = getelementptr inbounds [8 x i32], [8 x i32]* %318, i64 0, i64 4
  %320 = load i32, i32* %319, align 4
  %321 = load i32*, i32** %23, align 8
  %322 = getelementptr inbounds i32, i32* %321, i64 8
  %323 = load i32, i32* %322, align 4
  %324 = mul nsw i32 %320, %323
  %325 = load i32, i32* %25, align 4
  %326 = add i32 %325, %324
  store i32 %326, i32* %25, align 4
  %327 = load [8 x i32]*, [8 x i32]** %21, align 8
  %328 = getelementptr inbounds [8 x i32], [8 x i32]* %327, i64 0, i64 5
  %329 = load i32, i32* %328, align 4
  %330 = load i32*, i32** %23, align 8
  %331 = getelementptr inbounds i32, i32* %330, i64 6
  %332 = load i32, i32* %331, align 4
  %333 = mul nsw i32 %329, %332
  %334 = load i32, i32* %25, align 4
  %335 = add i32 %334, %333
  store i32 %335, i32* %25, align 4
  %336 = load [8 x i32]*, [8 x i32]** %21, align 8
  %337 = getelementptr inbounds [8 x i32], [8 x i32]* %336, i64 0, i64 6
  %338 = load i32, i32* %337, align 4
  %339 = load i32*, i32** %23, align 8
  %340 = getelementptr inbounds i32, i32* %339, i64 4
  %341 = load i32, i32* %340, align 4
  %342 = mul nsw i32 %338, %341
  %343 = load i32, i32* %25, align 4
  %344 = add i32 %343, %342
  store i32 %344, i32* %25, align 4
  %345 = load [8 x i32]*, [8 x i32]** %21, align 8
  %346 = getelementptr inbounds [8 x i32], [8 x i32]* %345, i64 0, i64 7
  %347 = load i32, i32* %346, align 4
  %348 = load i32*, i32** %23, align 8
  %349 = getelementptr inbounds i32, i32* %348, i64 2
  %350 = load i32, i32* %349, align 4
  %351 = mul nsw i32 %347, %350
  %352 = load i32, i32* %25, align 4
  %353 = add i32 %352, %351
  store i32 %353, i32* %25, align 4
  %354 = load i32, i32* %25, align 4
  %355 = sub i32 0, %354
  store i32 %355, i32* %25, align 4
  %356 = load [32 x i32]*, [32 x i32]** %22, align 8
  %357 = getelementptr inbounds [32 x i32], [32 x i32]* %356, i32 0, i32 0
  %358 = load i32, i32* %13, align 4
  %359 = zext i32 %358 to i64
  %360 = getelementptr inbounds i32, i32* %357, i64 %359
  store i32* %360, i32** %23, align 8
  %361 = load [8 x i32]*, [8 x i32]** %19, align 8
  %362 = getelementptr inbounds [8 x i32], [8 x i32]* %361, i64 0, i64 7
  %363 = load i32, i32* %362, align 4
  %364 = load i32*, i32** %23, align 8
  %365 = getelementptr inbounds i32, i32* %364, i64 2
  %366 = load i32, i32* %365, align 4
  %367 = mul nsw i32 %363, %366
  %368 = load i32, i32* %25, align 4
  %369 = add i32 %368, %367
  store i32 %369, i32* %25, align 4
  %370 = load [8 x i32]*, [8 x i32]** %19, align 8
  %371 = getelementptr inbounds [8 x i32], [8 x i32]* %370, i64 0, i64 6
  %372 = load i32, i32* %371, align 4
  %373 = load i32*, i32** %23, align 8
  %374 = getelementptr inbounds i32, i32* %373, i64 4
  %375 = load i32, i32* %374, align 4
  %376 = mul nsw i32 %372, %375
  %377 = load i32, i32* %25, align 4
  %378 = add i32 %377, %376
  store i32 %378, i32* %25, align 4
  %379 = load [8 x i32]*, [8 x i32]** %19, align 8
  %380 = getelementptr inbounds [8 x i32], [8 x i32]* %379, i64 0, i64 5
  %381 = load i32, i32* %380, align 4
  %382 = load i32*, i32** %23, align 8
  %383 = getelementptr inbounds i32, i32* %382, i64 6
  %384 = load i32, i32* %383, align 4
  %385 = mul nsw i32 %381, %384
  %386 = load i32, i32* %25, align 4
  %387 = add i32 %386, %385
  store i32 %387, i32* %25, align 4
  %388 = load [8 x i32]*, [8 x i32]** %19, align 8
  %389 = getelementptr inbounds [8 x i32], [8 x i32]* %388, i64 0, i64 4
  %390 = load i32, i32* %389, align 4
  %391 = load i32*, i32** %23, align 8
  %392 = getelementptr inbounds i32, i32* %391, i64 8
  %393 = load i32, i32* %392, align 4
  %394 = mul nsw i32 %390, %393
  %395 = load i32, i32* %25, align 4
  %396 = add i32 %395, %394
  store i32 %396, i32* %25, align 4
  %397 = load [8 x i32]*, [8 x i32]** %19, align 8
  %398 = getelementptr inbounds [8 x i32], [8 x i32]* %397, i64 0, i64 3
  %399 = load i32, i32* %398, align 4
  %400 = load i32*, i32** %23, align 8
  %401 = getelementptr inbounds i32, i32* %400, i64 10
  %402 = load i32, i32* %401, align 4
  %403 = mul nsw i32 %399, %402
  %404 = load i32, i32* %25, align 4
  %405 = add i32 %404, %403
  store i32 %405, i32* %25, align 4
  %406 = load [8 x i32]*, [8 x i32]** %19, align 8
  %407 = getelementptr inbounds [8 x i32], [8 x i32]* %406, i64 0, i64 2
  %408 = load i32, i32* %407, align 4
  %409 = load i32*, i32** %23, align 8
  %410 = getelementptr inbounds i32, i32* %409, i64 12
  %411 = load i32, i32* %410, align 4
  %412 = mul nsw i32 %408, %411
  %413 = load i32, i32* %25, align 4
  %414 = add i32 %413, %412
  store i32 %414, i32* %25, align 4
  %415 = load [8 x i32]*, [8 x i32]** %19, align 8
  %416 = getelementptr inbounds [8 x i32], [8 x i32]* %415, i64 0, i64 1
  %417 = load i32, i32* %416, align 4
  %418 = load i32*, i32** %23, align 8
  %419 = getelementptr inbounds i32, i32* %418, i64 14
  %420 = load i32, i32* %419, align 4
  %421 = mul nsw i32 %417, %420
  %422 = load i32, i32* %25, align 4
  %423 = add i32 %422, %421
  store i32 %423, i32* %25, align 4
  %424 = load [8 x i32]*, [8 x i32]** %19, align 8
  %425 = getelementptr inbounds [8 x i32], [8 x i32]* %424, i64 0, i64 0
  %426 = load i32, i32* %425, align 4
  %427 = load i32*, i32** %23, align 8
  %428 = getelementptr inbounds i32, i32* %427, i64 0
  %429 = load i32, i32* %428, align 4
  %430 = mul nsw i32 %426, %429
  %431 = load i32, i32* %25, align 4
  %432 = add i32 %431, %430
  store i32 %432, i32* %25, align 4
  %433 = load i32, i32* %24, align 4
  %434 = load i32, i32* %25, align 4
  %435 = ashr i32 %434, 2
  %436 = load i32*, i32** %15, align 8
  %437 = getelementptr inbounds i32, i32* %436, i32 1
  store i32* %437, i32** %15, align 8
  store i32 %435, i32* %436, align 4
  %438 = load [32 x i32]*, [32 x i32]** %22, align 8
  %439 = getelementptr inbounds [32 x i32], [32 x i32]* %438, i32 0, i32 0
  %440 = load i32, i32* %14, align 4
  %441 = zext i32 %440 to i64
  %442 = sub i64 0, %441
  %443 = getelementptr inbounds i32, i32* %439, i64 %442
  store i32* %443, i32** %23, align 8
  %444 = load [8 x i32]*, [8 x i32]** %21, align 8
  %445 = getelementptr inbounds [8 x i32], [8 x i32]* %444, i64 0, i64 7
  %446 = load i32, i32* %445, align 4
  %447 = load i32*, i32** %23, align 8
  %448 = getelementptr inbounds i32, i32* %447, i64 29
  %449 = load i32, i32* %448, align 4
  %450 = mul nsw i32 %446, %449
  store i32 %450, i32* %25, align 4
  %451 = load [8 x i32]*, [8 x i32]** %21, align 8
  %452 = getelementptr inbounds [8 x i32], [8 x i32]* %451, i64 0, i64 6
  %453 = load i32, i32* %452, align 4
  %454 = load i32*, i32** %23, align 8
  %455 = getelementptr inbounds i32, i32* %454, i64 27
  %456 = load i32, i32* %455, align 4
  %457 = mul nsw i32 %453, %456
  %458 = load i32, i32* %25, align 4
  %459 = add i32 %458, %457
  store i32 %459, i32* %25, align 4
  %460 = load [8 x i32]*, [8 x i32]** %21, align 8
  %461 = getelementptr inbounds [8 x i32], [8 x i32]* %460, i64 0, i64 5
  %462 = load i32, i32* %461, align 4
  %463 = load i32*, i32** %23, align 8
  %464 = getelementptr inbounds i32, i32* %463, i64 25
  %465 = load i32, i32* %464, align 4
  %466 = mul nsw i32 %462, %465
  %467 = load i32, i32* %25, align 4
  %468 = add i32 %467, %466
  store i32 %468, i32* %25, align 4
  %469 = load [8 x i32]*, [8 x i32]** %21, align 8
  %470 = getelementptr inbounds [8 x i32], [8 x i32]* %469, i64 0, i64 4
  %471 = load i32, i32* %470, align 4
  %472 = load i32*, i32** %23, align 8
  %473 = getelementptr inbounds i32, i32* %472, i64 23
  %474 = load i32, i32* %473, align 4
  %475 = mul nsw i32 %471, %474
  %476 = load i32, i32* %25, align 4
  %477 = add i32 %476, %475
  store i32 %477, i32* %25, align 4
  %478 = load [8 x i32]*, [8 x i32]** %21, align 8
  %479 = getelementptr inbounds [8 x i32], [8 x i32]* %478, i64 0, i64 3
  %480 = load i32, i32* %479, align 4
  %481 = load i32*, i32** %23, align 8
  %482 = getelementptr inbounds i32, i32* %481, i64 21
  %483 = load i32, i32* %482, align 4
  %484 = mul nsw i32 %480, %483
  %485 = load i32, i32* %25, align 4
  %486 = add i32 %485, %484
  store i32 %486, i32* %25, align 4
  %487 = load [8 x i32]*, [8 x i32]** %21, align 8
  %488 = getelementptr inbounds [8 x i32], [8 x i32]* %487, i64 0, i64 2
  %489 = load i32, i32* %488, align 4
  %490 = load i32*, i32** %23, align 8
  %491 = getelementptr inbounds i32, i32* %490, i64 19
  %492 = load i32, i32* %491, align 4
  %493 = mul nsw i32 %489, %492
  %494 = load i32, i32* %25, align 4
  %495 = add i32 %494, %493
  store i32 %495, i32* %25, align 4
  %496 = load [8 x i32]*, [8 x i32]** %21, align 8
  %497 = getelementptr inbounds [8 x i32], [8 x i32]* %496, i64 0, i64 1
  %498 = load i32, i32* %497, align 4
  %499 = load i32*, i32** %23, align 8
  %500 = getelementptr inbounds i32, i32* %499, i64 17
  %501 = load i32, i32* %500, align 4
  %502 = mul nsw i32 %498, %501
  %503 = load i32, i32* %25, align 4
  %504 = add i32 %503, %502
  store i32 %504, i32* %25, align 4
  %505 = load [8 x i32]*, [8 x i32]** %21, align 8
  %506 = getelementptr inbounds [8 x i32], [8 x i32]* %505, i64 0, i64 0
  %507 = load i32, i32* %506, align 4
  %508 = load i32*, i32** %23, align 8
  %509 = getelementptr inbounds i32, i32* %508, i64 15
  %510 = load i32, i32* %509, align 4
  %511 = mul nsw i32 %507, %510
  %512 = load i32, i32* %25, align 4
  %513 = add i32 %512, %511
  store i32 %513, i32* %25, align 4
  %514 = load [32 x i32]*, [32 x i32]** %22, align 8
  %515 = getelementptr inbounds [32 x i32], [32 x i32]* %514, i32 0, i32 0
  %516 = load i32, i32* %13, align 4
  %517 = zext i32 %516 to i64
  %518 = sub i64 0, %517
  %519 = getelementptr inbounds i32, i32* %515, i64 %518
  store i32* %519, i32** %23, align 8
  %520 = load [8 x i32]*, [8 x i32]** %19, align 8
  %521 = getelementptr inbounds [8 x i32], [8 x i32]* %520, i64 0, i64 0
  %522 = load i32, i32* %521, align 4
  %523 = load i32*, i32** %23, align 8
  %524 = getelementptr inbounds i32, i32* %523, i64 15
  %525 = load i32, i32* %524, align 4
  %526 = mul nsw i32 %522, %525
  %527 = load i32, i32* %25, align 4
  %528 = add i32 %527, %526
  store i32 %528, i32* %25, align 4
  %529 = load [8 x i32]*, [8 x i32]** %19, align 8
  %530 = getelementptr inbounds [8 x i32], [8 x i32]* %529, i64 0, i64 1
  %531 = load i32, i32* %530, align 4
  %532 = load i32*, i32** %23, align 8
  %533 = getelementptr inbounds i32, i32* %532, i64 17
  %534 = load i32, i32* %533, align 4
  %535 = mul nsw i32 %531, %534
  %536 = load i32, i32* %25, align 4
  %537 = add i32 %536, %535
  store i32 %537, i32* %25, align 4
  %538 = load [8 x i32]*, [8 x i32]** %19, align 8
  %539 = getelementptr inbounds [8 x i32], [8 x i32]* %538, i64 0, i64 2
  %540 = load i32, i32* %539, align 4
  %541 = load i32*, i32** %23, align 8
  %542 = getelementptr inbounds i32, i32* %541, i64 19
  %543 = load i32, i32* %542, align 4
  %544 = mul nsw i32 %540, %543
  %545 = load i32, i32* %25, align 4
  %546 = add i32 %545, %544
  store i32 %546, i32* %25, align 4
  %547 = load [8 x i32]*, [8 x i32]** %19, align 8
  %548 = getelementptr inbounds [8 x i32], [8 x i32]* %547, i64 0, i64 3
  %549 = load i32, i32* %548, align 4
  %550 = load i32*, i32** %23, align 8
  %551 = getelementptr inbounds i32, i32* %550, i64 21
  %552 = load i32, i32* %551, align 4
  %553 = mul nsw i32 %549, %552
  %554 = load i32, i32* %25, align 4
  %555 = add i32 %554, %553
  store i32 %555, i32* %25, align 4
  %556 = load [8 x i32]*, [8 x i32]** %19, align 8
  %557 = getelementptr inbounds [8 x i32], [8 x i32]* %556, i64 0, i64 4
  %558 = load i32, i32* %557, align 4
  %559 = load i32*, i32** %23, align 8
  %560 = getelementptr inbounds i32, i32* %559, i64 23
  %561 = load i32, i32* %560, align 4
  %562 = mul nsw i32 %558, %561
  %563 = load i32, i32* %25, align 4
  %564 = add i32 %563, %562
  store i32 %564, i32* %25, align 4
  %565 = load [8 x i32]*, [8 x i32]** %19, align 8
  %566 = getelementptr inbounds [8 x i32], [8 x i32]* %565, i64 0, i64 5
  %567 = load i32, i32* %566, align 4
  %568 = load i32*, i32** %23, align 8
  %569 = getelementptr inbounds i32, i32* %568, i64 25
  %570 = load i32, i32* %569, align 4
  %571 = mul nsw i32 %567, %570
  %572 = load i32, i32* %25, align 4
  %573 = add i32 %572, %571
  store i32 %573, i32* %25, align 4
  %574 = load [8 x i32]*, [8 x i32]** %19, align 8
  %575 = getelementptr inbounds [8 x i32], [8 x i32]* %574, i64 0, i64 6
  %576 = load i32, i32* %575, align 4
  %577 = load i32*, i32** %23, align 8
  %578 = getelementptr inbounds i32, i32* %577, i64 27
  %579 = load i32, i32* %578, align 4
  %580 = mul nsw i32 %576, %579
  %581 = load i32, i32* %25, align 4
  %582 = add i32 %581, %580
  store i32 %582, i32* %25, align 4
  %583 = load [8 x i32]*, [8 x i32]** %19, align 8
  %584 = getelementptr inbounds [8 x i32], [8 x i32]* %583, i64 0, i64 7
  %585 = load i32, i32* %584, align 4
  %586 = load i32*, i32** %23, align 8
  %587 = getelementptr inbounds i32, i32* %586, i64 29
  %588 = load i32, i32* %587, align 4
  %589 = mul nsw i32 %585, %588
  %590 = load i32, i32* %25, align 4
  %591 = add i32 %590, %589
  store i32 %591, i32* %25, align 4
  %592 = load i32, i32* %24, align 4
  %593 = load i32, i32* %25, align 4
  %594 = ashr i32 %593, 2
  %595 = load i32*, i32** %16, align 8
  %596 = getelementptr inbounds i32, i32* %595, i32 -1
  store i32* %596, i32** %16, align 8
  store i32 %594, i32* %595, align 4
  br label %597

; <label>:597:                                    ; preds = %278, %270
  %598 = load [8 x i32]*, [8 x i32]** %21, align 8
  %599 = getelementptr inbounds [8 x i32], [8 x i32]* %598, i32 1
  store [8 x i32]* %599, [8 x i32]** %21, align 8
  br label %600

; <label>:600:                                    ; preds = %597
  %601 = load i32, i32* %12, align 4
  %602 = add i32 %601, 1
  store i32 %602, i32* %12, align 4
  br label %267

; <label>:603:                                    ; preds = %267
  %604 = load [32 x i32]*, [32 x i32]** %22, align 8
  %605 = getelementptr inbounds [32 x i32], [32 x i32]* %604, i32 1
  store [32 x i32]* %605, [32 x i32]** %22, align 8
  %606 = load [32 x i32]*, [32 x i32]** %22, align 8
  %607 = getelementptr inbounds [32 x i32], [32 x i32]* %606, i32 0, i32 0
  %608 = load i32, i32* %14, align 4
  %609 = zext i32 %608 to i64
  %610 = getelementptr inbounds i32, i32* %607, i64 %609
  store i32* %610, i32** %23, align 8
  %611 = load [8 x i32]*, [8 x i32]** %21, align 8
  %612 = getelementptr inbounds [8 x i32], [8 x i32]* %611, i64 0, i64 0
  %613 = load i32, i32* %612, align 4
  %614 = load i32*, i32** %23, align 8
  %615 = getelementptr inbounds i32, i32* %614, i64 0
  %616 = load i32, i32* %615, align 4
  %617 = mul nsw i32 %613, %616
  store i32 %617, i32* %25, align 4
  %618 = load [8 x i32]*, [8 x i32]** %21, align 8
  %619 = getelementptr inbounds [8 x i32], [8 x i32]* %618, i64 0, i64 1
  %620 = load i32, i32* %619, align 4
  %621 = load i32*, i32** %23, align 8
  %622 = getelementptr inbounds i32, i32* %621, i64 14
  %623 = load i32, i32* %622, align 4
  %624 = mul nsw i32 %620, %623
  %625 = load i32, i32* %25, align 4
  %626 = add i32 %625, %624
  store i32 %626, i32* %25, align 4
  %627 = load [8 x i32]*, [8 x i32]** %21, align 8
  %628 = getelementptr inbounds [8 x i32], [8 x i32]* %627, i64 0, i64 2
  %629 = load i32, i32* %628, align 4
  %630 = load i32*, i32** %23, align 8
  %631 = getelementptr inbounds i32, i32* %630, i64 12
  %632 = load i32, i32* %631, align 4
  %633 = mul nsw i32 %629, %632
  %634 = load i32, i32* %25, align 4
  %635 = add i32 %634, %633
  store i32 %635, i32* %25, align 4
  %636 = load [8 x i32]*, [8 x i32]** %21, align 8
  %637 = getelementptr inbounds [8 x i32], [8 x i32]* %636, i64 0, i64 3
  %638 = load i32, i32* %637, align 4
  %639 = load i32*, i32** %23, align 8
  %640 = getelementptr inbounds i32, i32* %639, i64 10
  %641 = load i32, i32* %640, align 4
  %642 = mul nsw i32 %638, %641
  %643 = load i32, i32* %25, align 4
  %644 = add i32 %643, %642
  store i32 %644, i32* %25, align 4
  %645 = load [8 x i32]*, [8 x i32]** %21, align 8
  %646 = getelementptr inbounds [8 x i32], [8 x i32]* %645, i64 0, i64 4
  %647 = load i32, i32* %646, align 4
  %648 = load i32*, i32** %23, align 8
  %649 = getelementptr inbounds i32, i32* %648, i64 8
  %650 = load i32, i32* %649, align 4
  %651 = mul nsw i32 %647, %650
  %652 = load i32, i32* %25, align 4
  %653 = add i32 %652, %651
  store i32 %653, i32* %25, align 4
  %654 = load [8 x i32]*, [8 x i32]** %21, align 8
  %655 = getelementptr inbounds [8 x i32], [8 x i32]* %654, i64 0, i64 5
  %656 = load i32, i32* %655, align 4
  %657 = load i32*, i32** %23, align 8
  %658 = getelementptr inbounds i32, i32* %657, i64 6
  %659 = load i32, i32* %658, align 4
  %660 = mul nsw i32 %656, %659
  %661 = load i32, i32* %25, align 4
  %662 = add i32 %661, %660
  store i32 %662, i32* %25, align 4
  %663 = load [8 x i32]*, [8 x i32]** %21, align 8
  %664 = getelementptr inbounds [8 x i32], [8 x i32]* %663, i64 0, i64 6
  %665 = load i32, i32* %664, align 4
  %666 = load i32*, i32** %23, align 8
  %667 = getelementptr inbounds i32, i32* %666, i64 4
  %668 = load i32, i32* %667, align 4
  %669 = mul nsw i32 %665, %668
  %670 = load i32, i32* %25, align 4
  %671 = add i32 %670, %669
  store i32 %671, i32* %25, align 4
  %672 = load [8 x i32]*, [8 x i32]** %21, align 8
  %673 = getelementptr inbounds [8 x i32], [8 x i32]* %672, i64 0, i64 7
  %674 = load i32, i32* %673, align 4
  %675 = load i32*, i32** %23, align 8
  %676 = getelementptr inbounds i32, i32* %675, i64 2
  %677 = load i32, i32* %676, align 4
  %678 = mul nsw i32 %674, %677
  %679 = load i32, i32* %25, align 4
  %680 = add i32 %679, %678
  store i32 %680, i32* %25, align 4
  %681 = load i32, i32* %24, align 4
  %682 = load i32, i32* %25, align 4
  %683 = sub nsw i32 0, %682
  %684 = ashr i32 %683, 2
  %685 = load i32*, i32** %15, align 8
  store i32 %684, i32* %685, align 4
  %686 = load i32*, i32** %15, align 8
  %687 = getelementptr inbounds i32, i32* %686, i64 8
  store i32* %687, i32** %15, align 8
  %688 = load i32, i32* %9, align 4
  %689 = add i32 %688, 1
  %690 = urem i32 %689, 16
  store i32 %690, i32* %9, align 4
  br label %691

; <label>:691:                                    ; preds = %603
  %692 = load i32, i32* %11, align 4
  %693 = add i32 %692, 1
  store i32 %693, i32* %11, align 4
  br label %51

; <label>:694:                                    ; preds = %51
  br label %695

; <label>:695:                                    ; preds = %694
  %696 = load i32, i32* %10, align 4
  %697 = add i32 %696, 1
  store i32 %697, i32* %10, align 4
  br label %26

; <label>:698:                                    ; preds = %26
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @dct32(i32*, i32, [8 x i32]*, [8 x i32]*) #0 {
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca [8 x i32]*, align 8
  %8 = alloca [8 x i32]*, align 8
  %9 = alloca i32, align 4
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
  store i32* %0, i32** %5, align 8
  store i32 %1, i32* %6, align 4
  store [8 x i32]* %2, [8 x i32]** %7, align 8
  store [8 x i32]* %3, [8 x i32]** %8, align 8
  %186 = load i32*, i32** %5, align 8
  %187 = getelementptr inbounds i32, i32* %186, i64 0
  %188 = load i32, i32* %187, align 4
  %189 = load i32*, i32** %5, align 8
  %190 = getelementptr inbounds i32, i32* %189, i64 31
  %191 = load i32, i32* %190, align 4
  %192 = add nsw i32 %188, %191
  store i32 %192, i32* %9, align 4
  %193 = load i32*, i32** %5, align 8
  %194 = getelementptr inbounds i32, i32* %193, i64 0
  %195 = load i32, i32* %194, align 4
  %196 = load i32*, i32** %5, align 8
  %197 = getelementptr inbounds i32, i32* %196, i64 31
  %198 = load i32, i32* %197, align 4
  %199 = sub nsw i32 %195, %198
  %200 = sext i32 %199 to i64
  %201 = add nsw i64 %200, 2048
  %202 = ashr i64 %201, 12
  %203 = mul nsw i64 %202, 4091
  %204 = trunc i64 %203 to i32
  store i32 %204, i32* %25, align 4
  %205 = load i32*, i32** %5, align 8
  %206 = getelementptr inbounds i32, i32* %205, i64 15
  %207 = load i32, i32* %206, align 4
  %208 = load i32*, i32** %5, align 8
  %209 = getelementptr inbounds i32, i32* %208, i64 16
  %210 = load i32, i32* %209, align 4
  %211 = add nsw i32 %207, %210
  store i32 %211, i32* %10, align 4
  %212 = load i32*, i32** %5, align 8
  %213 = getelementptr inbounds i32, i32* %212, i64 15
  %214 = load i32, i32* %213, align 4
  %215 = load i32*, i32** %5, align 8
  %216 = getelementptr inbounds i32, i32* %215, i64 16
  %217 = load i32, i32* %216, align 4
  %218 = sub nsw i32 %214, %217
  %219 = sext i32 %218 to i64
  %220 = add nsw i64 %219, 2048
  %221 = ashr i64 %220, 12
  %222 = mul nsw i64 %221, 201
  %223 = trunc i64 %222 to i32
  store i32 %223, i32* %26, align 4
  %224 = load i32, i32* %25, align 4
  %225 = load i32, i32* %26, align 4
  %226 = add nsw i32 %224, %225
  store i32 %226, i32* %50, align 4
  %227 = load i32, i32* %25, align 4
  %228 = load i32, i32* %26, align 4
  %229 = sub nsw i32 %227, %228
  %230 = sext i32 %229 to i64
  %231 = add nsw i64 %230, 2048
  %232 = ashr i64 %231, 12
  %233 = mul nsw i64 %232, 4076
  %234 = trunc i64 %233 to i32
  store i32 %234, i32* %68, align 4
  %235 = load i32, i32* %9, align 4
  %236 = load i32, i32* %10, align 4
  %237 = add nsw i32 %235, %236
  store i32 %237, i32* %42, align 4
  %238 = load i32, i32* %9, align 4
  %239 = load i32, i32* %10, align 4
  %240 = sub nsw i32 %238, %239
  %241 = sext i32 %240 to i64
  %242 = add nsw i64 %241, 2048
  %243 = ashr i64 %242, 12
  %244 = mul nsw i64 %243, 4076
  %245 = trunc i64 %244 to i32
  store i32 %245, i32* %59, align 4
  %246 = load i32*, i32** %5, align 8
  %247 = getelementptr inbounds i32, i32* %246, i64 7
  %248 = load i32, i32* %247, align 4
  %249 = load i32*, i32** %5, align 8
  %250 = getelementptr inbounds i32, i32* %249, i64 24
  %251 = load i32, i32* %250, align 4
  %252 = add nsw i32 %248, %251
  store i32 %252, i32* %11, align 4
  %253 = load i32*, i32** %5, align 8
  %254 = getelementptr inbounds i32, i32* %253, i64 7
  %255 = load i32, i32* %254, align 4
  %256 = load i32*, i32** %5, align 8
  %257 = getelementptr inbounds i32, i32* %256, i64 24
  %258 = load i32, i32* %257, align 4
  %259 = sub nsw i32 %255, %258
  %260 = sext i32 %259 to i64
  %261 = add nsw i64 %260, 2048
  %262 = ashr i64 %261, 12
  %263 = mul nsw i64 %262, 3035
  %264 = trunc i64 %263 to i32
  store i32 %264, i32* %27, align 4
  %265 = load i32*, i32** %5, align 8
  %266 = getelementptr inbounds i32, i32* %265, i64 8
  %267 = load i32, i32* %266, align 4
  %268 = load i32*, i32** %5, align 8
  %269 = getelementptr inbounds i32, i32* %268, i64 23
  %270 = load i32, i32* %269, align 4
  %271 = add nsw i32 %267, %270
  store i32 %271, i32* %12, align 4
  %272 = load i32*, i32** %5, align 8
  %273 = getelementptr inbounds i32, i32* %272, i64 8
  %274 = load i32, i32* %273, align 4
  %275 = load i32*, i32** %5, align 8
  %276 = getelementptr inbounds i32, i32* %275, i64 23
  %277 = load i32, i32* %276, align 4
  %278 = sub nsw i32 %274, %277
  %279 = sext i32 %278 to i64
  %280 = add nsw i64 %279, 2048
  %281 = ashr i64 %280, 12
  %282 = mul nsw i64 %281, 2751
  %283 = trunc i64 %282 to i32
  store i32 %283, i32* %28, align 4
  %284 = load i32, i32* %27, align 4
  %285 = load i32, i32* %28, align 4
  %286 = add nsw i32 %284, %285
  store i32 %286, i32* %51, align 4
  %287 = load i32, i32* %27, align 4
  %288 = load i32, i32* %28, align 4
  %289 = sub nsw i32 %287, %288
  %290 = sext i32 %289 to i64
  %291 = add nsw i64 %290, 2048
  %292 = ashr i64 %291, 12
  %293 = mul nsw i64 %292, 401
  %294 = trunc i64 %293 to i32
  store i32 %294, i32* %69, align 4
  %295 = load i32, i32* %11, align 4
  %296 = load i32, i32* %12, align 4
  %297 = add nsw i32 %295, %296
  store i32 %297, i32* %43, align 4
  %298 = load i32, i32* %11, align 4
  %299 = load i32, i32* %12, align 4
  %300 = sub nsw i32 %298, %299
  %301 = sext i32 %300 to i64
  %302 = add nsw i64 %301, 2048
  %303 = ashr i64 %302, 12
  %304 = mul nsw i64 %303, 401
  %305 = trunc i64 %304 to i32
  store i32 %305, i32* %60, align 4
  %306 = load i32*, i32** %5, align 8
  %307 = getelementptr inbounds i32, i32* %306, i64 3
  %308 = load i32, i32* %307, align 4
  %309 = load i32*, i32** %5, align 8
  %310 = getelementptr inbounds i32, i32* %309, i64 28
  %311 = load i32, i32* %310, align 4
  %312 = add nsw i32 %308, %311
  store i32 %312, i32* %13, align 4
  %313 = load i32*, i32** %5, align 8
  %314 = getelementptr inbounds i32, i32* %313, i64 3
  %315 = load i32, i32* %314, align 4
  %316 = load i32*, i32** %5, align 8
  %317 = getelementptr inbounds i32, i32* %316, i64 28
  %318 = load i32, i32* %317, align 4
  %319 = sub nsw i32 %315, %318
  %320 = sext i32 %319 to i64
  %321 = add nsw i64 %320, 2048
  %322 = ashr i64 %321, 12
  %323 = mul nsw i64 %322, 3857
  %324 = trunc i64 %323 to i32
  store i32 %324, i32* %29, align 4
  %325 = load i32*, i32** %5, align 8
  %326 = getelementptr inbounds i32, i32* %325, i64 12
  %327 = load i32, i32* %326, align 4
  %328 = load i32*, i32** %5, align 8
  %329 = getelementptr inbounds i32, i32* %328, i64 19
  %330 = load i32, i32* %329, align 4
  %331 = add nsw i32 %327, %330
  store i32 %331, i32* %14, align 4
  %332 = load i32*, i32** %5, align 8
  %333 = getelementptr inbounds i32, i32* %332, i64 12
  %334 = load i32, i32* %333, align 4
  %335 = load i32*, i32** %5, align 8
  %336 = getelementptr inbounds i32, i32* %335, i64 19
  %337 = load i32, i32* %336, align 4
  %338 = sub nsw i32 %334, %337
  %339 = sext i32 %338 to i64
  %340 = add nsw i64 %339, 2048
  %341 = ashr i64 %340, 12
  %342 = mul nsw i64 %341, 1380
  %343 = trunc i64 %342 to i32
  store i32 %343, i32* %30, align 4
  %344 = load i32, i32* %29, align 4
  %345 = load i32, i32* %30, align 4
  %346 = add nsw i32 %344, %345
  store i32 %346, i32* %52, align 4
  %347 = load i32, i32* %29, align 4
  %348 = load i32, i32* %30, align 4
  %349 = sub nsw i32 %347, %348
  %350 = sext i32 %349 to i64
  %351 = add nsw i64 %350, 2048
  %352 = ashr i64 %351, 12
  %353 = mul nsw i64 %352, 3166
  %354 = trunc i64 %353 to i32
  store i32 %354, i32* %70, align 4
  %355 = load i32, i32* %13, align 4
  %356 = load i32, i32* %14, align 4
  %357 = add nsw i32 %355, %356
  store i32 %357, i32* %44, align 4
  %358 = load i32, i32* %13, align 4
  %359 = load i32, i32* %14, align 4
  %360 = sub nsw i32 %358, %359
  %361 = sext i32 %360 to i64
  %362 = add nsw i64 %361, 2048
  %363 = ashr i64 %362, 12
  %364 = mul nsw i64 %363, 3166
  %365 = trunc i64 %364 to i32
  store i32 %365, i32* %61, align 4
  %366 = load i32*, i32** %5, align 8
  %367 = getelementptr inbounds i32, i32* %366, i64 4
  %368 = load i32, i32* %367, align 4
  %369 = load i32*, i32** %5, align 8
  %370 = getelementptr inbounds i32, i32* %369, i64 27
  %371 = load i32, i32* %370, align 4
  %372 = add nsw i32 %368, %371
  store i32 %372, i32* %15, align 4
  %373 = load i32*, i32** %5, align 8
  %374 = getelementptr inbounds i32, i32* %373, i64 4
  %375 = load i32, i32* %374, align 4
  %376 = load i32*, i32** %5, align 8
  %377 = getelementptr inbounds i32, i32* %376, i64 27
  %378 = load i32, i32* %377, align 4
  %379 = sub nsw i32 %375, %378
  %380 = sext i32 %379 to i64
  %381 = add nsw i64 %380, 2048
  %382 = ashr i64 %381, 12
  %383 = mul nsw i64 %382, 3703
  %384 = trunc i64 %383 to i32
  store i32 %384, i32* %31, align 4
  %385 = load i32*, i32** %5, align 8
  %386 = getelementptr inbounds i32, i32* %385, i64 11
  %387 = load i32, i32* %386, align 4
  %388 = load i32*, i32** %5, align 8
  %389 = getelementptr inbounds i32, i32* %388, i64 20
  %390 = load i32, i32* %389, align 4
  %391 = add nsw i32 %387, %390
  store i32 %391, i32* %16, align 4
  %392 = load i32*, i32** %5, align 8
  %393 = getelementptr inbounds i32, i32* %392, i64 11
  %394 = load i32, i32* %393, align 4
  %395 = load i32*, i32** %5, align 8
  %396 = getelementptr inbounds i32, i32* %395, i64 20
  %397 = load i32, i32* %396, align 4
  %398 = sub nsw i32 %394, %397
  %399 = sext i32 %398 to i64
  %400 = add nsw i64 %399, 2048
  %401 = ashr i64 %400, 12
  %402 = mul nsw i64 %401, 1751
  %403 = trunc i64 %402 to i32
  store i32 %403, i32* %32, align 4
  %404 = load i32, i32* %31, align 4
  %405 = load i32, i32* %32, align 4
  %406 = add nsw i32 %404, %405
  store i32 %406, i32* %53, align 4
  %407 = load i32, i32* %31, align 4
  %408 = load i32, i32* %32, align 4
  %409 = sub nsw i32 %407, %408
  %410 = sext i32 %409 to i64
  %411 = add nsw i64 %410, 2048
  %412 = ashr i64 %411, 12
  %413 = mul nsw i64 %412, 2598
  %414 = trunc i64 %413 to i32
  store i32 %414, i32* %71, align 4
  %415 = load i32, i32* %15, align 4
  %416 = load i32, i32* %16, align 4
  %417 = add nsw i32 %415, %416
  store i32 %417, i32* %45, align 4
  %418 = load i32, i32* %15, align 4
  %419 = load i32, i32* %16, align 4
  %420 = sub nsw i32 %418, %419
  %421 = sext i32 %420 to i64
  %422 = add nsw i64 %421, 2048
  %423 = ashr i64 %422, 12
  %424 = mul nsw i64 %423, 2598
  %425 = trunc i64 %424 to i32
  store i32 %425, i32* %62, align 4
  %426 = load i32*, i32** %5, align 8
  %427 = getelementptr inbounds i32, i32* %426, i64 1
  %428 = load i32, i32* %427, align 4
  %429 = load i32*, i32** %5, align 8
  %430 = getelementptr inbounds i32, i32* %429, i64 30
  %431 = load i32, i32* %430, align 4
  %432 = add nsw i32 %428, %431
  store i32 %432, i32* %17, align 4
  %433 = load i32*, i32** %5, align 8
  %434 = getelementptr inbounds i32, i32* %433, i64 1
  %435 = load i32, i32* %434, align 4
  %436 = load i32*, i32** %5, align 8
  %437 = getelementptr inbounds i32, i32* %436, i64 30
  %438 = load i32, i32* %437, align 4
  %439 = sub nsw i32 %435, %438
  %440 = sext i32 %439 to i64
  %441 = add nsw i64 %440, 2048
  %442 = ashr i64 %441, 12
  %443 = mul nsw i64 %442, 4052
  %444 = trunc i64 %443 to i32
  store i32 %444, i32* %33, align 4
  %445 = load i32*, i32** %5, align 8
  %446 = getelementptr inbounds i32, i32* %445, i64 14
  %447 = load i32, i32* %446, align 4
  %448 = load i32*, i32** %5, align 8
  %449 = getelementptr inbounds i32, i32* %448, i64 17
  %450 = load i32, i32* %449, align 4
  %451 = add nsw i32 %447, %450
  store i32 %451, i32* %18, align 4
  %452 = load i32*, i32** %5, align 8
  %453 = getelementptr inbounds i32, i32* %452, i64 14
  %454 = load i32, i32* %453, align 4
  %455 = load i32*, i32** %5, align 8
  %456 = getelementptr inbounds i32, i32* %455, i64 17
  %457 = load i32, i32* %456, align 4
  %458 = sub nsw i32 %454, %457
  %459 = sext i32 %458 to i64
  %460 = add nsw i64 %459, 2048
  %461 = ashr i64 %460, 12
  %462 = mul nsw i64 %461, 601
  %463 = trunc i64 %462 to i32
  store i32 %463, i32* %34, align 4
  %464 = load i32, i32* %33, align 4
  %465 = load i32, i32* %34, align 4
  %466 = add nsw i32 %464, %465
  store i32 %466, i32* %54, align 4
  %467 = load i32, i32* %33, align 4
  %468 = load i32, i32* %34, align 4
  %469 = sub nsw i32 %467, %468
  %470 = sext i32 %469 to i64
  %471 = add nsw i64 %470, 2048
  %472 = ashr i64 %471, 12
  %473 = mul nsw i64 %472, 3920
  %474 = trunc i64 %473 to i32
  store i32 %474, i32* %72, align 4
  %475 = load i32, i32* %17, align 4
  %476 = load i32, i32* %18, align 4
  %477 = add nsw i32 %475, %476
  store i32 %477, i32* %46, align 4
  %478 = load i32, i32* %17, align 4
  %479 = load i32, i32* %18, align 4
  %480 = sub nsw i32 %478, %479
  %481 = sext i32 %480 to i64
  %482 = add nsw i64 %481, 2048
  %483 = ashr i64 %482, 12
  %484 = mul nsw i64 %483, 3920
  %485 = trunc i64 %484 to i32
  store i32 %485, i32* %63, align 4
  %486 = load i32*, i32** %5, align 8
  %487 = getelementptr inbounds i32, i32* %486, i64 6
  %488 = load i32, i32* %487, align 4
  %489 = load i32*, i32** %5, align 8
  %490 = getelementptr inbounds i32, i32* %489, i64 25
  %491 = load i32, i32* %490, align 4
  %492 = add nsw i32 %488, %491
  store i32 %492, i32* %19, align 4
  %493 = load i32*, i32** %5, align 8
  %494 = getelementptr inbounds i32, i32* %493, i64 6
  %495 = load i32, i32* %494, align 4
  %496 = load i32*, i32** %5, align 8
  %497 = getelementptr inbounds i32, i32* %496, i64 25
  %498 = load i32, i32* %497, align 4
  %499 = sub nsw i32 %495, %498
  %500 = sext i32 %499 to i64
  %501 = add nsw i64 %500, 2048
  %502 = ashr i64 %501, 12
  %503 = mul nsw i64 %502, 3290
  %504 = trunc i64 %503 to i32
  store i32 %504, i32* %35, align 4
  %505 = load i32*, i32** %5, align 8
  %506 = getelementptr inbounds i32, i32* %505, i64 9
  %507 = load i32, i32* %506, align 4
  %508 = load i32*, i32** %5, align 8
  %509 = getelementptr inbounds i32, i32* %508, i64 22
  %510 = load i32, i32* %509, align 4
  %511 = add nsw i32 %507, %510
  store i32 %511, i32* %20, align 4
  %512 = load i32*, i32** %5, align 8
  %513 = getelementptr inbounds i32, i32* %512, i64 9
  %514 = load i32, i32* %513, align 4
  %515 = load i32*, i32** %5, align 8
  %516 = getelementptr inbounds i32, i32* %515, i64 22
  %517 = load i32, i32* %516, align 4
  %518 = sub nsw i32 %514, %517
  %519 = sext i32 %518 to i64
  %520 = add nsw i64 %519, 2048
  %521 = ashr i64 %520, 12
  %522 = mul nsw i64 %521, 2440
  %523 = trunc i64 %522 to i32
  store i32 %523, i32* %36, align 4
  %524 = load i32, i32* %35, align 4
  %525 = load i32, i32* %36, align 4
  %526 = add nsw i32 %524, %525
  store i32 %526, i32* %55, align 4
  %527 = load i32, i32* %35, align 4
  %528 = load i32, i32* %36, align 4
  %529 = sub nsw i32 %527, %528
  %530 = sext i32 %529 to i64
  %531 = add nsw i64 %530, 2048
  %532 = ashr i64 %531, 12
  %533 = mul nsw i64 %532, 1189
  %534 = trunc i64 %533 to i32
  store i32 %534, i32* %73, align 4
  %535 = load i32, i32* %19, align 4
  %536 = load i32, i32* %20, align 4
  %537 = add nsw i32 %535, %536
  store i32 %537, i32* %47, align 4
  %538 = load i32, i32* %19, align 4
  %539 = load i32, i32* %20, align 4
  %540 = sub nsw i32 %538, %539
  %541 = sext i32 %540 to i64
  %542 = add nsw i64 %541, 2048
  %543 = ashr i64 %542, 12
  %544 = mul nsw i64 %543, 1189
  %545 = trunc i64 %544 to i32
  store i32 %545, i32* %64, align 4
  %546 = load i32*, i32** %5, align 8
  %547 = getelementptr inbounds i32, i32* %546, i64 2
  %548 = load i32, i32* %547, align 4
  %549 = load i32*, i32** %5, align 8
  %550 = getelementptr inbounds i32, i32* %549, i64 29
  %551 = load i32, i32* %550, align 4
  %552 = add nsw i32 %548, %551
  store i32 %552, i32* %21, align 4
  %553 = load i32*, i32** %5, align 8
  %554 = getelementptr inbounds i32, i32* %553, i64 2
  %555 = load i32, i32* %554, align 4
  %556 = load i32*, i32** %5, align 8
  %557 = getelementptr inbounds i32, i32* %556, i64 29
  %558 = load i32, i32* %557, align 4
  %559 = sub nsw i32 %555, %558
  %560 = sext i32 %559 to i64
  %561 = add nsw i64 %560, 2048
  %562 = ashr i64 %561, 12
  %563 = mul nsw i64 %562, 3973
  %564 = trunc i64 %563 to i32
  store i32 %564, i32* %37, align 4
  %565 = load i32*, i32** %5, align 8
  %566 = getelementptr inbounds i32, i32* %565, i64 13
  %567 = load i32, i32* %566, align 4
  %568 = load i32*, i32** %5, align 8
  %569 = getelementptr inbounds i32, i32* %568, i64 18
  %570 = load i32, i32* %569, align 4
  %571 = add nsw i32 %567, %570
  store i32 %571, i32* %22, align 4
  %572 = load i32*, i32** %5, align 8
  %573 = getelementptr inbounds i32, i32* %572, i64 13
  %574 = load i32, i32* %573, align 4
  %575 = load i32*, i32** %5, align 8
  %576 = getelementptr inbounds i32, i32* %575, i64 18
  %577 = load i32, i32* %576, align 4
  %578 = sub nsw i32 %574, %577
  %579 = sext i32 %578 to i64
  %580 = add nsw i64 %579, 2048
  %581 = ashr i64 %580, 12
  %582 = mul nsw i64 %581, 995
  %583 = trunc i64 %582 to i32
  store i32 %583, i32* %38, align 4
  %584 = load i32, i32* %37, align 4
  %585 = load i32, i32* %38, align 4
  %586 = add nsw i32 %584, %585
  store i32 %586, i32* %56, align 4
  %587 = load i32, i32* %37, align 4
  %588 = load i32, i32* %38, align 4
  %589 = sub nsw i32 %587, %588
  %590 = sext i32 %589 to i64
  %591 = add nsw i64 %590, 2048
  %592 = ashr i64 %591, 12
  %593 = mul nsw i64 %592, 3612
  %594 = trunc i64 %593 to i32
  store i32 %594, i32* %74, align 4
  %595 = load i32, i32* %21, align 4
  %596 = load i32, i32* %22, align 4
  %597 = add nsw i32 %595, %596
  store i32 %597, i32* %48, align 4
  %598 = load i32, i32* %21, align 4
  %599 = load i32, i32* %22, align 4
  %600 = sub nsw i32 %598, %599
  %601 = sext i32 %600 to i64
  %602 = add nsw i64 %601, 2048
  %603 = ashr i64 %602, 12
  %604 = mul nsw i64 %603, 3612
  %605 = trunc i64 %604 to i32
  store i32 %605, i32* %65, align 4
  %606 = load i32*, i32** %5, align 8
  %607 = getelementptr inbounds i32, i32* %606, i64 5
  %608 = load i32, i32* %607, align 4
  %609 = load i32*, i32** %5, align 8
  %610 = getelementptr inbounds i32, i32* %609, i64 26
  %611 = load i32, i32* %610, align 4
  %612 = add nsw i32 %608, %611
  store i32 %612, i32* %23, align 4
  %613 = load i32*, i32** %5, align 8
  %614 = getelementptr inbounds i32, i32* %613, i64 5
  %615 = load i32, i32* %614, align 4
  %616 = load i32*, i32** %5, align 8
  %617 = getelementptr inbounds i32, i32* %616, i64 26
  %618 = load i32, i32* %617, align 4
  %619 = sub nsw i32 %615, %618
  %620 = sext i32 %619 to i64
  %621 = add nsw i64 %620, 2048
  %622 = ashr i64 %621, 12
  %623 = mul nsw i64 %622, 3513
  %624 = trunc i64 %623 to i32
  store i32 %624, i32* %39, align 4
  %625 = load i32*, i32** %5, align 8
  %626 = getelementptr inbounds i32, i32* %625, i64 10
  %627 = load i32, i32* %626, align 4
  %628 = load i32*, i32** %5, align 8
  %629 = getelementptr inbounds i32, i32* %628, i64 21
  %630 = load i32, i32* %629, align 4
  %631 = add nsw i32 %627, %630
  store i32 %631, i32* %24, align 4
  %632 = load i32*, i32** %5, align 8
  %633 = getelementptr inbounds i32, i32* %632, i64 10
  %634 = load i32, i32* %633, align 4
  %635 = load i32*, i32** %5, align 8
  %636 = getelementptr inbounds i32, i32* %635, i64 21
  %637 = load i32, i32* %636, align 4
  %638 = sub nsw i32 %634, %637
  %639 = sext i32 %638 to i64
  %640 = add nsw i64 %639, 2048
  %641 = ashr i64 %640, 12
  %642 = mul nsw i64 %641, 2106
  %643 = trunc i64 %642 to i32
  store i32 %643, i32* %40, align 4
  %644 = load i32, i32* %39, align 4
  %645 = load i32, i32* %40, align 4
  %646 = add nsw i32 %644, %645
  store i32 %646, i32* %57, align 4
  %647 = load i32, i32* %39, align 4
  %648 = load i32, i32* %40, align 4
  %649 = sub nsw i32 %647, %648
  %650 = sext i32 %649 to i64
  %651 = add nsw i64 %650, 2048
  %652 = ashr i64 %651, 12
  %653 = mul nsw i64 %652, 1931
  %654 = trunc i64 %653 to i32
  store i32 %654, i32* %75, align 4
  %655 = load i32, i32* %23, align 4
  %656 = load i32, i32* %24, align 4
  %657 = add nsw i32 %655, %656
  store i32 %657, i32* %49, align 4
  %658 = load i32, i32* %23, align 4
  %659 = load i32, i32* %24, align 4
  %660 = sub nsw i32 %658, %659
  %661 = sext i32 %660 to i64
  %662 = add nsw i64 %661, 2048
  %663 = ashr i64 %662, 12
  %664 = mul nsw i64 %663, 1931
  %665 = trunc i64 %664 to i32
  store i32 %665, i32* %66, align 4
  %666 = load i32, i32* %42, align 4
  %667 = load i32, i32* %43, align 4
  %668 = add nsw i32 %666, %667
  store i32 %668, i32* %78, align 4
  %669 = load i32, i32* %42, align 4
  %670 = load i32, i32* %43, align 4
  %671 = sub nsw i32 %669, %670
  %672 = sext i32 %671 to i64
  %673 = add nsw i64 %672, 2048
  %674 = ashr i64 %673, 12
  %675 = mul nsw i64 %674, 4017
  %676 = trunc i64 %675 to i32
  store i32 %676, i32* %98, align 4
  %677 = load i32, i32* %44, align 4
  %678 = load i32, i32* %45, align 4
  %679 = add nsw i32 %677, %678
  store i32 %679, i32* %79, align 4
  %680 = load i32, i32* %44, align 4
  %681 = load i32, i32* %45, align 4
  %682 = sub nsw i32 %680, %681
  %683 = sext i32 %682 to i64
  %684 = add nsw i64 %683, 2048
  %685 = ashr i64 %684, 12
  %686 = mul nsw i64 %685, 799
  %687 = trunc i64 %686 to i32
  store i32 %687, i32* %99, align 4
  %688 = load i32, i32* %46, align 4
  %689 = load i32, i32* %47, align 4
  %690 = add nsw i32 %688, %689
  store i32 %690, i32* %80, align 4
  %691 = load i32, i32* %46, align 4
  %692 = load i32, i32* %47, align 4
  %693 = sub nsw i32 %691, %692
  %694 = sext i32 %693 to i64
  %695 = add nsw i64 %694, 2048
  %696 = ashr i64 %695, 12
  %697 = mul nsw i64 %696, 3406
  %698 = trunc i64 %697 to i32
  store i32 %698, i32* %100, align 4
  %699 = load i32, i32* %48, align 4
  %700 = load i32, i32* %49, align 4
  %701 = add nsw i32 %699, %700
  store i32 %701, i32* %81, align 4
  %702 = load i32, i32* %48, align 4
  %703 = load i32, i32* %49, align 4
  %704 = sub nsw i32 %702, %703
  %705 = sext i32 %704 to i64
  %706 = add nsw i64 %705, 2048
  %707 = ashr i64 %706, 12
  %708 = mul nsw i64 %707, 2276
  %709 = trunc i64 %708 to i32
  store i32 %709, i32* %101, align 4
  %710 = load i32, i32* %50, align 4
  %711 = load i32, i32* %51, align 4
  %712 = add nsw i32 %710, %711
  store i32 %712, i32* %82, align 4
  %713 = load i32, i32* %50, align 4
  %714 = load i32, i32* %51, align 4
  %715 = sub nsw i32 %713, %714
  %716 = sext i32 %715 to i64
  %717 = add nsw i64 %716, 2048
  %718 = ashr i64 %717, 12
  %719 = mul nsw i64 %718, 4017
  %720 = trunc i64 %719 to i32
  store i32 %720, i32* %103, align 4
  %721 = load i32, i32* %52, align 4
  %722 = load i32, i32* %53, align 4
  %723 = add nsw i32 %721, %722
  store i32 %723, i32* %83, align 4
  %724 = load i32, i32* %52, align 4
  %725 = load i32, i32* %53, align 4
  %726 = sub nsw i32 %724, %725
  %727 = sext i32 %726 to i64
  %728 = add nsw i64 %727, 2048
  %729 = ashr i64 %728, 12
  %730 = mul nsw i64 %729, 799
  %731 = trunc i64 %730 to i32
  store i32 %731, i32* %104, align 4
  %732 = load i32, i32* %54, align 4
  %733 = load i32, i32* %55, align 4
  %734 = add nsw i32 %732, %733
  store i32 %734, i32* %84, align 4
  %735 = load i32, i32* %54, align 4
  %736 = load i32, i32* %55, align 4
  %737 = sub nsw i32 %735, %736
  %738 = sext i32 %737 to i64
  %739 = add nsw i64 %738, 2048
  %740 = ashr i64 %739, 12
  %741 = mul nsw i64 %740, 3406
  %742 = trunc i64 %741 to i32
  store i32 %742, i32* %105, align 4
  %743 = load i32, i32* %56, align 4
  %744 = load i32, i32* %57, align 4
  %745 = add nsw i32 %743, %744
  store i32 %745, i32* %85, align 4
  %746 = load i32, i32* %56, align 4
  %747 = load i32, i32* %57, align 4
  %748 = sub nsw i32 %746, %747
  %749 = sext i32 %748 to i64
  %750 = add nsw i64 %749, 2048
  %751 = ashr i64 %750, 12
  %752 = mul nsw i64 %751, 2276
  %753 = trunc i64 %752 to i32
  store i32 %753, i32* %106, align 4
  %754 = load i32, i32* %59, align 4
  %755 = load i32, i32* %60, align 4
  %756 = add nsw i32 %754, %755
  store i32 %756, i32* %87, align 4
  %757 = load i32, i32* %59, align 4
  %758 = load i32, i32* %60, align 4
  %759 = sub nsw i32 %757, %758
  %760 = sext i32 %759 to i64
  %761 = add nsw i64 %760, 2048
  %762 = ashr i64 %761, 12
  %763 = mul nsw i64 %762, 4017
  %764 = trunc i64 %763 to i32
  store i32 %764, i32* %109, align 4
  %765 = load i32, i32* %61, align 4
  %766 = load i32, i32* %62, align 4
  %767 = add nsw i32 %765, %766
  store i32 %767, i32* %88, align 4
  %768 = load i32, i32* %61, align 4
  %769 = load i32, i32* %62, align 4
  %770 = sub nsw i32 %768, %769
  %771 = sext i32 %770 to i64
  %772 = add nsw i64 %771, 2048
  %773 = ashr i64 %772, 12
  %774 = mul nsw i64 %773, 799
  %775 = trunc i64 %774 to i32
  store i32 %775, i32* %110, align 4
  %776 = load i32, i32* %63, align 4
  %777 = load i32, i32* %64, align 4
  %778 = add nsw i32 %776, %777
  store i32 %778, i32* %89, align 4
  %779 = load i32, i32* %63, align 4
  %780 = load i32, i32* %64, align 4
  %781 = sub nsw i32 %779, %780
  %782 = sext i32 %781 to i64
  %783 = add nsw i64 %782, 2048
  %784 = ashr i64 %783, 12
  %785 = mul nsw i64 %784, 3406
  %786 = trunc i64 %785 to i32
  store i32 %786, i32* %111, align 4
  %787 = load i32, i32* %65, align 4
  %788 = load i32, i32* %66, align 4
  %789 = add nsw i32 %787, %788
  store i32 %789, i32* %90, align 4
  %790 = load i32, i32* %65, align 4
  %791 = load i32, i32* %66, align 4
  %792 = sub nsw i32 %790, %791
  %793 = sext i32 %792 to i64
  %794 = add nsw i64 %793, 2048
  %795 = ashr i64 %794, 12
  %796 = mul nsw i64 %795, 2276
  %797 = trunc i64 %796 to i32
  store i32 %797, i32* %112, align 4
  %798 = load i32, i32* %68, align 4
  %799 = load i32, i32* %69, align 4
  %800 = add nsw i32 %798, %799
  store i32 %800, i32* %92, align 4
  %801 = load i32, i32* %68, align 4
  %802 = load i32, i32* %69, align 4
  %803 = sub nsw i32 %801, %802
  %804 = sext i32 %803 to i64
  %805 = add nsw i64 %804, 2048
  %806 = ashr i64 %805, 12
  %807 = mul nsw i64 %806, 4017
  %808 = trunc i64 %807 to i32
  store i32 %808, i32* %115, align 4
  %809 = load i32, i32* %70, align 4
  %810 = load i32, i32* %71, align 4
  %811 = add nsw i32 %809, %810
  store i32 %811, i32* %93, align 4
  %812 = load i32, i32* %70, align 4
  %813 = load i32, i32* %71, align 4
  %814 = sub nsw i32 %812, %813
  %815 = sext i32 %814 to i64
  %816 = add nsw i64 %815, 2048
  %817 = ashr i64 %816, 12
  %818 = mul nsw i64 %817, 799
  %819 = trunc i64 %818 to i32
  store i32 %819, i32* %116, align 4
  %820 = load i32, i32* %72, align 4
  %821 = load i32, i32* %73, align 4
  %822 = add nsw i32 %820, %821
  store i32 %822, i32* %94, align 4
  %823 = load i32, i32* %72, align 4
  %824 = load i32, i32* %73, align 4
  %825 = sub nsw i32 %823, %824
  %826 = sext i32 %825 to i64
  %827 = add nsw i64 %826, 2048
  %828 = ashr i64 %827, 12
  %829 = mul nsw i64 %828, 3406
  %830 = trunc i64 %829 to i32
  store i32 %830, i32* %117, align 4
  %831 = load i32, i32* %74, align 4
  %832 = load i32, i32* %75, align 4
  %833 = add nsw i32 %831, %832
  store i32 %833, i32* %95, align 4
  %834 = load i32, i32* %74, align 4
  %835 = load i32, i32* %75, align 4
  %836 = sub nsw i32 %834, %835
  %837 = sext i32 %836 to i64
  %838 = add nsw i64 %837, 2048
  %839 = ashr i64 %838, 12
  %840 = mul nsw i64 %839, 2276
  %841 = trunc i64 %840 to i32
  store i32 %841, i32* %118, align 4
  %842 = load i32, i32* %78, align 4
  %843 = load i32, i32* %79, align 4
  %844 = add nsw i32 %842, %843
  store i32 %844, i32* %122, align 4
  %845 = load i32, i32* %80, align 4
  %846 = load i32, i32* %81, align 4
  %847 = add nsw i32 %845, %846
  store i32 %847, i32* %123, align 4
  %848 = load i32, i32* %122, align 4
  %849 = load i32, i32* %123, align 4
  %850 = add nsw i32 %848, %849
  %851 = sext i32 %850 to i64
  %852 = add nsw i64 %851, 2048
  %853 = ashr i64 %852, 12
  %854 = trunc i64 %853 to i32
  %855 = load [8 x i32]*, [8 x i32]** %8, align 8
  %856 = getelementptr inbounds [8 x i32], [8 x i32]* %855, i64 15
  %857 = load i32, i32* %6, align 4
  %858 = zext i32 %857 to i64
  %859 = getelementptr inbounds [8 x i32], [8 x i32]* %856, i64 0, i64 %858
  store i32 %854, i32* %859, align 4
  %860 = load i32, i32* %122, align 4
  %861 = load i32, i32* %123, align 4
  %862 = sub nsw i32 %860, %861
  %863 = sext i32 %862 to i64
  %864 = add nsw i64 %863, 2048
  %865 = ashr i64 %864, 12
  %866 = mul nsw i64 %865, 2896
  %867 = add nsw i64 %866, 2048
  %868 = ashr i64 %867, 12
  %869 = trunc i64 %868 to i32
  %870 = load [8 x i32]*, [8 x i32]** %7, align 8
  %871 = getelementptr inbounds [8 x i32], [8 x i32]* %870, i64 0
  %872 = load i32, i32* %6, align 4
  %873 = zext i32 %872 to i64
  %874 = getelementptr inbounds [8 x i32], [8 x i32]* %871, i64 0, i64 %873
  store i32 %869, i32* %874, align 4
  %875 = load i32, i32* %82, align 4
  %876 = load i32, i32* %83, align 4
  %877 = add nsw i32 %875, %876
  store i32 %877, i32* %124, align 4
  %878 = load i32, i32* %84, align 4
  %879 = load i32, i32* %85, align 4
  %880 = add nsw i32 %878, %879
  store i32 %880, i32* %125, align 4
  %881 = load i32, i32* %124, align 4
  %882 = load i32, i32* %125, align 4
  %883 = add nsw i32 %881, %882
  store i32 %883, i32* %41, align 4
  %884 = load i32, i32* %41, align 4
  %885 = sext i32 %884 to i64
  %886 = add nsw i64 %885, 2048
  %887 = ashr i64 %886, 12
  %888 = trunc i64 %887 to i32
  %889 = load [8 x i32]*, [8 x i32]** %8, align 8
  %890 = getelementptr inbounds [8 x i32], [8 x i32]* %889, i64 14
  %891 = load i32, i32* %6, align 4
  %892 = zext i32 %891 to i64
  %893 = getelementptr inbounds [8 x i32], [8 x i32]* %890, i64 0, i64 %892
  store i32 %888, i32* %893, align 4
  %894 = load i32, i32* %87, align 4
  %895 = load i32, i32* %88, align 4
  %896 = add nsw i32 %894, %895
  store i32 %896, i32* %127, align 4
  %897 = load i32, i32* %89, align 4
  %898 = load i32, i32* %90, align 4
  %899 = add nsw i32 %897, %898
  store i32 %899, i32* %128, align 4
  %900 = load i32, i32* %127, align 4
  %901 = load i32, i32* %128, align 4
  %902 = add nsw i32 %900, %901
  store i32 %902, i32* %67, align 4
  %903 = load i32, i32* %67, align 4
  %904 = sext i32 %903 to i64
  %905 = add nsw i64 %904, 2048
  %906 = ashr i64 %905, 12
  %907 = trunc i64 %906 to i32
  %908 = load [8 x i32]*, [8 x i32]** %8, align 8
  %909 = getelementptr inbounds [8 x i32], [8 x i32]* %908, i64 13
  %910 = load i32, i32* %6, align 4
  %911 = zext i32 %910 to i64
  %912 = getelementptr inbounds [8 x i32], [8 x i32]* %909, i64 0, i64 %911
  store i32 %907, i32* %912, align 4
  %913 = load i32, i32* %92, align 4
  %914 = load i32, i32* %93, align 4
  %915 = add nsw i32 %913, %914
  store i32 %915, i32* %130, align 4
  %916 = load i32, i32* %94, align 4
  %917 = load i32, i32* %95, align 4
  %918 = add nsw i32 %916, %917
  store i32 %918, i32* %131, align 4
  %919 = load i32, i32* %130, align 4
  %920 = load i32, i32* %131, align 4
  %921 = add nsw i32 %919, %920
  store i32 %921, i32* %76, align 4
  %922 = load i32, i32* %76, align 4
  %923 = mul nsw i32 %922, 2
  %924 = load i32, i32* %41, align 4
  %925 = sub nsw i32 %923, %924
  store i32 %925, i32* %58, align 4
  %926 = load i32, i32* %58, align 4
  %927 = sext i32 %926 to i64
  %928 = add nsw i64 %927, 2048
  %929 = ashr i64 %928, 12
  %930 = trunc i64 %929 to i32
  %931 = load [8 x i32]*, [8 x i32]** %8, align 8
  %932 = getelementptr inbounds [8 x i32], [8 x i32]* %931, i64 12
  %933 = load i32, i32* %6, align 4
  %934 = zext i32 %933 to i64
  %935 = getelementptr inbounds [8 x i32], [8 x i32]* %932, i64 0, i64 %934
  store i32 %930, i32* %935, align 4
  %936 = load i32, i32* %98, align 4
  %937 = load i32, i32* %99, align 4
  %938 = add nsw i32 %936, %937
  store i32 %938, i32* %134, align 4
  %939 = load i32, i32* %100, align 4
  %940 = load i32, i32* %101, align 4
  %941 = add nsw i32 %939, %940
  store i32 %941, i32* %135, align 4
  %942 = load i32, i32* %134, align 4
  %943 = load i32, i32* %135, align 4
  %944 = add nsw i32 %942, %943
  store i32 %944, i32* %102, align 4
  %945 = load i32, i32* %102, align 4
  %946 = sext i32 %945 to i64
  %947 = add nsw i64 %946, 2048
  %948 = ashr i64 %947, 12
  %949 = trunc i64 %948 to i32
  %950 = load [8 x i32]*, [8 x i32]** %8, align 8
  %951 = getelementptr inbounds [8 x i32], [8 x i32]* %950, i64 11
  %952 = load i32, i32* %6, align 4
  %953 = zext i32 %952 to i64
  %954 = getelementptr inbounds [8 x i32], [8 x i32]* %951, i64 0, i64 %953
  store i32 %949, i32* %954, align 4
  %955 = load i32, i32* %103, align 4
  %956 = load i32, i32* %104, align 4
  %957 = add nsw i32 %955, %956
  store i32 %957, i32* %137, align 4
  %958 = load i32, i32* %105, align 4
  %959 = load i32, i32* %106, align 4
  %960 = add nsw i32 %958, %959
  store i32 %960, i32* %138, align 4
  %961 = load i32, i32* %137, align 4
  %962 = load i32, i32* %138, align 4
  %963 = add nsw i32 %961, %962
  store i32 %963, i32* %107, align 4
  %964 = load i32, i32* %107, align 4
  %965 = mul nsw i32 %964, 2
  %966 = load i32, i32* %58, align 4
  %967 = sub nsw i32 %965, %966
  store i32 %967, i32* %77, align 4
  %968 = load i32, i32* %77, align 4
  %969 = sext i32 %968 to i64
  %970 = add nsw i64 %969, 2048
  %971 = ashr i64 %970, 12
  %972 = trunc i64 %971 to i32
  %973 = load [8 x i32]*, [8 x i32]** %8, align 8
  %974 = getelementptr inbounds [8 x i32], [8 x i32]* %973, i64 10
  %975 = load i32, i32* %6, align 4
  %976 = zext i32 %975 to i64
  %977 = getelementptr inbounds [8 x i32], [8 x i32]* %974, i64 0, i64 %976
  store i32 %972, i32* %977, align 4
  %978 = load i32, i32* %109, align 4
  %979 = load i32, i32* %110, align 4
  %980 = add nsw i32 %978, %979
  store i32 %980, i32* %141, align 4
  %981 = load i32, i32* %111, align 4
  %982 = load i32, i32* %112, align 4
  %983 = add nsw i32 %981, %982
  store i32 %983, i32* %142, align 4
  %984 = load i32, i32* %141, align 4
  %985 = load i32, i32* %142, align 4
  %986 = add nsw i32 %984, %985
  store i32 %986, i32* %113, align 4
  %987 = load i32, i32* %113, align 4
  %988 = mul nsw i32 %987, 2
  %989 = load i32, i32* %67, align 4
  %990 = sub nsw i32 %988, %989
  store i32 %990, i32* %91, align 4
  %991 = load i32, i32* %91, align 4
  %992 = sext i32 %991 to i64
  %993 = add nsw i64 %992, 2048
  %994 = ashr i64 %993, 12
  %995 = trunc i64 %994 to i32
  %996 = load [8 x i32]*, [8 x i32]** %8, align 8
  %997 = getelementptr inbounds [8 x i32], [8 x i32]* %996, i64 9
  %998 = load i32, i32* %6, align 4
  %999 = zext i32 %998 to i64
  %1000 = getelementptr inbounds [8 x i32], [8 x i32]* %997, i64 0, i64 %999
  store i32 %995, i32* %1000, align 4
  %1001 = load i32, i32* %115, align 4
  %1002 = load i32, i32* %116, align 4
  %1003 = add nsw i32 %1001, %1002
  store i32 %1003, i32* %145, align 4
  %1004 = load i32, i32* %117, align 4
  %1005 = load i32, i32* %118, align 4
  %1006 = add nsw i32 %1004, %1005
  store i32 %1006, i32* %146, align 4
  %1007 = load i32, i32* %145, align 4
  %1008 = load i32, i32* %146, align 4
  %1009 = add nsw i32 %1007, %1008
  store i32 %1009, i32* %119, align 4
  %1010 = load i32, i32* %119, align 4
  %1011 = mul nsw i32 %1010, 2
  %1012 = load i32, i32* %76, align 4
  %1013 = sub nsw i32 %1011, %1012
  store i32 %1013, i32* %96, align 4
  %1014 = load i32, i32* %96, align 4
  %1015 = mul nsw i32 %1014, 2
  %1016 = load i32, i32* %77, align 4
  %1017 = sub nsw i32 %1015, %1016
  store i32 %1017, i32* %86, align 4
  %1018 = load i32, i32* %86, align 4
  %1019 = sext i32 %1018 to i64
  %1020 = add nsw i64 %1019, 2048
  %1021 = ashr i64 %1020, 12
  %1022 = trunc i64 %1021 to i32
  %1023 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1024 = getelementptr inbounds [8 x i32], [8 x i32]* %1023, i64 8
  %1025 = load i32, i32* %6, align 4
  %1026 = zext i32 %1025 to i64
  %1027 = getelementptr inbounds [8 x i32], [8 x i32]* %1024, i64 0, i64 %1026
  store i32 %1022, i32* %1027, align 4
  %1028 = load i32, i32* %78, align 4
  %1029 = load i32, i32* %79, align 4
  %1030 = sub nsw i32 %1028, %1029
  %1031 = sext i32 %1030 to i64
  %1032 = add nsw i64 %1031, 2048
  %1033 = ashr i64 %1032, 12
  %1034 = mul nsw i64 %1033, 3784
  %1035 = trunc i64 %1034 to i32
  store i32 %1035, i32* %150, align 4
  %1036 = load i32, i32* %80, align 4
  %1037 = load i32, i32* %81, align 4
  %1038 = sub nsw i32 %1036, %1037
  %1039 = sext i32 %1038 to i64
  %1040 = add nsw i64 %1039, 2048
  %1041 = ashr i64 %1040, 12
  %1042 = mul nsw i64 %1041, 1567
  %1043 = trunc i64 %1042 to i32
  store i32 %1043, i32* %151, align 4
  %1044 = load i32, i32* %150, align 4
  %1045 = load i32, i32* %151, align 4
  %1046 = add nsw i32 %1044, %1045
  store i32 %1046, i32* %152, align 4
  %1047 = load i32, i32* %152, align 4
  %1048 = sext i32 %1047 to i64
  %1049 = add nsw i64 %1048, 2048
  %1050 = ashr i64 %1049, 12
  %1051 = trunc i64 %1050 to i32
  %1052 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1053 = getelementptr inbounds [8 x i32], [8 x i32]* %1052, i64 7
  %1054 = load i32, i32* %6, align 4
  %1055 = zext i32 %1054 to i64
  %1056 = getelementptr inbounds [8 x i32], [8 x i32]* %1053, i64 0, i64 %1055
  store i32 %1051, i32* %1056, align 4
  %1057 = load i32, i32* %150, align 4
  %1058 = load i32, i32* %151, align 4
  %1059 = sub nsw i32 %1057, %1058
  %1060 = sext i32 %1059 to i64
  %1061 = add nsw i64 %1060, 2048
  %1062 = ashr i64 %1061, 12
  %1063 = mul nsw i64 %1062, 2896
  %1064 = mul nsw i64 %1063, 2
  %1065 = load i32, i32* %152, align 4
  %1066 = sext i32 %1065 to i64
  %1067 = sub nsw i64 %1064, %1066
  %1068 = add nsw i64 %1067, 2048
  %1069 = ashr i64 %1068, 12
  %1070 = trunc i64 %1069 to i32
  %1071 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1072 = getelementptr inbounds [8 x i32], [8 x i32]* %1071, i64 8
  %1073 = load i32, i32* %6, align 4
  %1074 = zext i32 %1073 to i64
  %1075 = getelementptr inbounds [8 x i32], [8 x i32]* %1072, i64 0, i64 %1074
  store i32 %1070, i32* %1075, align 4
  %1076 = load i32, i32* %82, align 4
  %1077 = load i32, i32* %83, align 4
  %1078 = sub nsw i32 %1076, %1077
  %1079 = sext i32 %1078 to i64
  %1080 = add nsw i64 %1079, 2048
  %1081 = ashr i64 %1080, 12
  %1082 = mul nsw i64 %1081, 3784
  %1083 = trunc i64 %1082 to i32
  store i32 %1083, i32* %153, align 4
  %1084 = load i32, i32* %84, align 4
  %1085 = load i32, i32* %85, align 4
  %1086 = sub nsw i32 %1084, %1085
  %1087 = sext i32 %1086 to i64
  %1088 = add nsw i64 %1087, 2048
  %1089 = ashr i64 %1088, 12
  %1090 = mul nsw i64 %1089, 1567
  %1091 = trunc i64 %1090 to i32
  store i32 %1091, i32* %154, align 4
  %1092 = load i32, i32* %153, align 4
  %1093 = load i32, i32* %154, align 4
  %1094 = add nsw i32 %1092, %1093
  store i32 %1094, i32* %155, align 4
  %1095 = load i32, i32* %155, align 4
  %1096 = mul nsw i32 %1095, 2
  %1097 = load i32, i32* %86, align 4
  %1098 = sub nsw i32 %1096, %1097
  store i32 %1098, i32* %97, align 4
  %1099 = load i32, i32* %97, align 4
  %1100 = sext i32 %1099 to i64
  %1101 = add nsw i64 %1100, 2048
  %1102 = ashr i64 %1101, 12
  %1103 = trunc i64 %1102 to i32
  %1104 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1105 = getelementptr inbounds [8 x i32], [8 x i32]* %1104, i64 6
  %1106 = load i32, i32* %6, align 4
  %1107 = zext i32 %1106 to i64
  %1108 = getelementptr inbounds [8 x i32], [8 x i32]* %1105, i64 0, i64 %1107
  store i32 %1103, i32* %1108, align 4
  %1109 = load i32, i32* %87, align 4
  %1110 = load i32, i32* %88, align 4
  %1111 = sub nsw i32 %1109, %1110
  %1112 = sext i32 %1111 to i64
  %1113 = add nsw i64 %1112, 2048
  %1114 = ashr i64 %1113, 12
  %1115 = mul nsw i64 %1114, 3784
  %1116 = trunc i64 %1115 to i32
  store i32 %1116, i32* %157, align 4
  %1117 = load i32, i32* %89, align 4
  %1118 = load i32, i32* %90, align 4
  %1119 = sub nsw i32 %1117, %1118
  %1120 = sext i32 %1119 to i64
  %1121 = add nsw i64 %1120, 2048
  %1122 = ashr i64 %1121, 12
  %1123 = mul nsw i64 %1122, 1567
  %1124 = trunc i64 %1123 to i32
  store i32 %1124, i32* %158, align 4
  %1125 = load i32, i32* %157, align 4
  %1126 = load i32, i32* %158, align 4
  %1127 = add nsw i32 %1125, %1126
  store i32 %1127, i32* %159, align 4
  %1128 = load i32, i32* %159, align 4
  %1129 = mul nsw i32 %1128, 2
  %1130 = load i32, i32* %91, align 4
  %1131 = sub nsw i32 %1129, %1130
  store i32 %1131, i32* %114, align 4
  %1132 = load i32, i32* %114, align 4
  %1133 = sext i32 %1132 to i64
  %1134 = add nsw i64 %1133, 2048
  %1135 = ashr i64 %1134, 12
  %1136 = trunc i64 %1135 to i32
  %1137 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1138 = getelementptr inbounds [8 x i32], [8 x i32]* %1137, i64 5
  %1139 = load i32, i32* %6, align 4
  %1140 = zext i32 %1139 to i64
  %1141 = getelementptr inbounds [8 x i32], [8 x i32]* %1138, i64 0, i64 %1140
  store i32 %1136, i32* %1141, align 4
  %1142 = load i32, i32* %92, align 4
  %1143 = load i32, i32* %93, align 4
  %1144 = sub nsw i32 %1142, %1143
  %1145 = sext i32 %1144 to i64
  %1146 = add nsw i64 %1145, 2048
  %1147 = ashr i64 %1146, 12
  %1148 = mul nsw i64 %1147, 3784
  %1149 = trunc i64 %1148 to i32
  store i32 %1149, i32* %161, align 4
  %1150 = load i32, i32* %94, align 4
  %1151 = load i32, i32* %95, align 4
  %1152 = sub nsw i32 %1150, %1151
  %1153 = sext i32 %1152 to i64
  %1154 = add nsw i64 %1153, 2048
  %1155 = ashr i64 %1154, 12
  %1156 = mul nsw i64 %1155, 1567
  %1157 = trunc i64 %1156 to i32
  store i32 %1157, i32* %162, align 4
  %1158 = load i32, i32* %161, align 4
  %1159 = load i32, i32* %162, align 4
  %1160 = add nsw i32 %1158, %1159
  store i32 %1160, i32* %163, align 4
  %1161 = load i32, i32* %163, align 4
  %1162 = mul nsw i32 %1161, 2
  %1163 = load i32, i32* %96, align 4
  %1164 = sub nsw i32 %1162, %1163
  store i32 %1164, i32* %120, align 4
  %1165 = load i32, i32* %120, align 4
  %1166 = mul nsw i32 %1165, 2
  %1167 = load i32, i32* %97, align 4
  %1168 = sub nsw i32 %1166, %1167
  store i32 %1168, i32* %108, align 4
  %1169 = load i32, i32* %108, align 4
  %1170 = sext i32 %1169 to i64
  %1171 = add nsw i64 %1170, 2048
  %1172 = ashr i64 %1171, 12
  %1173 = trunc i64 %1172 to i32
  %1174 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1175 = getelementptr inbounds [8 x i32], [8 x i32]* %1174, i64 4
  %1176 = load i32, i32* %6, align 4
  %1177 = zext i32 %1176 to i64
  %1178 = getelementptr inbounds [8 x i32], [8 x i32]* %1175, i64 0, i64 %1177
  store i32 %1173, i32* %1178, align 4
  %1179 = load i32, i32* %98, align 4
  %1180 = load i32, i32* %99, align 4
  %1181 = sub nsw i32 %1179, %1180
  %1182 = sext i32 %1181 to i64
  %1183 = add nsw i64 %1182, 2048
  %1184 = ashr i64 %1183, 12
  %1185 = mul nsw i64 %1184, 3784
  %1186 = trunc i64 %1185 to i32
  store i32 %1186, i32* %166, align 4
  %1187 = load i32, i32* %100, align 4
  %1188 = load i32, i32* %101, align 4
  %1189 = sub nsw i32 %1187, %1188
  %1190 = sext i32 %1189 to i64
  %1191 = add nsw i64 %1190, 2048
  %1192 = ashr i64 %1191, 12
  %1193 = mul nsw i64 %1192, 1567
  %1194 = trunc i64 %1193 to i32
  store i32 %1194, i32* %167, align 4
  %1195 = load i32, i32* %166, align 4
  %1196 = load i32, i32* %167, align 4
  %1197 = add nsw i32 %1195, %1196
  store i32 %1197, i32* %168, align 4
  %1198 = load i32, i32* %168, align 4
  %1199 = mul nsw i32 %1198, 2
  %1200 = load i32, i32* %102, align 4
  %1201 = sub nsw i32 %1199, %1200
  store i32 %1201, i32* %136, align 4
  %1202 = load i32, i32* %136, align 4
  %1203 = sext i32 %1202 to i64
  %1204 = add nsw i64 %1203, 2048
  %1205 = ashr i64 %1204, 12
  %1206 = trunc i64 %1205 to i32
  %1207 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1208 = getelementptr inbounds [8 x i32], [8 x i32]* %1207, i64 3
  %1209 = load i32, i32* %6, align 4
  %1210 = zext i32 %1209 to i64
  %1211 = getelementptr inbounds [8 x i32], [8 x i32]* %1208, i64 0, i64 %1210
  store i32 %1206, i32* %1211, align 4
  %1212 = load i32, i32* %134, align 4
  %1213 = load i32, i32* %135, align 4
  %1214 = sub nsw i32 %1212, %1213
  %1215 = sext i32 %1214 to i64
  %1216 = add nsw i64 %1215, 2048
  %1217 = ashr i64 %1216, 12
  %1218 = mul nsw i64 %1217, 2896
  %1219 = mul nsw i64 %1218, 2
  %1220 = load i32, i32* %136, align 4
  %1221 = sext i32 %1220 to i64
  %1222 = sub nsw i64 %1219, %1221
  %1223 = trunc i64 %1222 to i32
  store i32 %1223, i32* %169, align 4
  %1224 = load i32, i32* %169, align 4
  %1225 = sext i32 %1224 to i64
  %1226 = add nsw i64 %1225, 2048
  %1227 = ashr i64 %1226, 12
  %1228 = trunc i64 %1227 to i32
  %1229 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1230 = getelementptr inbounds [8 x i32], [8 x i32]* %1229, i64 4
  %1231 = load i32, i32* %6, align 4
  %1232 = zext i32 %1231 to i64
  %1233 = getelementptr inbounds [8 x i32], [8 x i32]* %1230, i64 0, i64 %1232
  store i32 %1228, i32* %1233, align 4
  %1234 = load i32, i32* %166, align 4
  %1235 = load i32, i32* %167, align 4
  %1236 = sub nsw i32 %1234, %1235
  %1237 = sext i32 %1236 to i64
  %1238 = add nsw i64 %1237, 2048
  %1239 = ashr i64 %1238, 12
  %1240 = mul nsw i64 %1239, 2896
  %1241 = mul nsw i64 %1240, 2
  %1242 = load i32, i32* %168, align 4
  %1243 = sext i32 %1242 to i64
  %1244 = sub nsw i64 %1241, %1243
  %1245 = mul nsw i64 %1244, 2
  %1246 = load i32, i32* %169, align 4
  %1247 = sext i32 %1246 to i64
  %1248 = sub nsw i64 %1245, %1247
  %1249 = add nsw i64 %1248, 2048
  %1250 = ashr i64 %1249, 12
  %1251 = trunc i64 %1250 to i32
  %1252 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1253 = getelementptr inbounds [8 x i32], [8 x i32]* %1252, i64 12
  %1254 = load i32, i32* %6, align 4
  %1255 = zext i32 %1254 to i64
  %1256 = getelementptr inbounds [8 x i32], [8 x i32]* %1253, i64 0, i64 %1255
  store i32 %1251, i32* %1256, align 4
  %1257 = load i32, i32* %103, align 4
  %1258 = load i32, i32* %104, align 4
  %1259 = sub nsw i32 %1257, %1258
  %1260 = sext i32 %1259 to i64
  %1261 = add nsw i64 %1260, 2048
  %1262 = ashr i64 %1261, 12
  %1263 = mul nsw i64 %1262, 3784
  %1264 = trunc i64 %1263 to i32
  store i32 %1264, i32* %170, align 4
  %1265 = load i32, i32* %105, align 4
  %1266 = load i32, i32* %106, align 4
  %1267 = sub nsw i32 %1265, %1266
  %1268 = sext i32 %1267 to i64
  %1269 = add nsw i64 %1268, 2048
  %1270 = ashr i64 %1269, 12
  %1271 = mul nsw i64 %1270, 1567
  %1272 = trunc i64 %1271 to i32
  store i32 %1272, i32* %171, align 4
  %1273 = load i32, i32* %170, align 4
  %1274 = load i32, i32* %171, align 4
  %1275 = add nsw i32 %1273, %1274
  store i32 %1275, i32* %172, align 4
  %1276 = load i32, i32* %172, align 4
  %1277 = mul nsw i32 %1276, 2
  %1278 = load i32, i32* %107, align 4
  %1279 = sub nsw i32 %1277, %1278
  store i32 %1279, i32* %139, align 4
  %1280 = load i32, i32* %139, align 4
  %1281 = mul nsw i32 %1280, 2
  %1282 = load i32, i32* %108, align 4
  %1283 = sub nsw i32 %1281, %1282
  store i32 %1283, i32* %121, align 4
  %1284 = load i32, i32* %121, align 4
  %1285 = sext i32 %1284 to i64
  %1286 = add nsw i64 %1285, 2048
  %1287 = ashr i64 %1286, 12
  %1288 = trunc i64 %1287 to i32
  %1289 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1290 = getelementptr inbounds [8 x i32], [8 x i32]* %1289, i64 2
  %1291 = load i32, i32* %6, align 4
  %1292 = zext i32 %1291 to i64
  %1293 = getelementptr inbounds [8 x i32], [8 x i32]* %1290, i64 0, i64 %1292
  store i32 %1288, i32* %1293, align 4
  %1294 = load i32, i32* %137, align 4
  %1295 = load i32, i32* %138, align 4
  %1296 = sub nsw i32 %1294, %1295
  %1297 = sext i32 %1296 to i64
  %1298 = add nsw i64 %1297, 2048
  %1299 = ashr i64 %1298, 12
  %1300 = mul nsw i64 %1299, 2896
  %1301 = mul nsw i64 %1300, 2
  %1302 = load i32, i32* %139, align 4
  %1303 = sext i32 %1302 to i64
  %1304 = sub nsw i64 %1301, %1303
  %1305 = trunc i64 %1304 to i32
  store i32 %1305, i32* %173, align 4
  %1306 = load i32, i32* %109, align 4
  %1307 = load i32, i32* %110, align 4
  %1308 = sub nsw i32 %1306, %1307
  %1309 = sext i32 %1308 to i64
  %1310 = add nsw i64 %1309, 2048
  %1311 = ashr i64 %1310, 12
  %1312 = mul nsw i64 %1311, 3784
  %1313 = trunc i64 %1312 to i32
  store i32 %1313, i32* %175, align 4
  %1314 = load i32, i32* %111, align 4
  %1315 = load i32, i32* %112, align 4
  %1316 = sub nsw i32 %1314, %1315
  %1317 = sext i32 %1316 to i64
  %1318 = add nsw i64 %1317, 2048
  %1319 = ashr i64 %1318, 12
  %1320 = mul nsw i64 %1319, 1567
  %1321 = trunc i64 %1320 to i32
  store i32 %1321, i32* %176, align 4
  %1322 = load i32, i32* %175, align 4
  %1323 = load i32, i32* %176, align 4
  %1324 = add nsw i32 %1322, %1323
  store i32 %1324, i32* %177, align 4
  %1325 = load i32, i32* %177, align 4
  %1326 = mul nsw i32 %1325, 2
  %1327 = load i32, i32* %113, align 4
  %1328 = sub nsw i32 %1326, %1327
  store i32 %1328, i32* %143, align 4
  %1329 = load i32, i32* %143, align 4
  %1330 = mul nsw i32 %1329, 2
  %1331 = load i32, i32* %114, align 4
  %1332 = sub nsw i32 %1330, %1331
  store i32 %1332, i32* %129, align 4
  %1333 = load i32, i32* %129, align 4
  %1334 = sext i32 %1333 to i64
  %1335 = add nsw i64 %1334, 2048
  %1336 = ashr i64 %1335, 12
  %1337 = trunc i64 %1336 to i32
  %1338 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1339 = getelementptr inbounds [8 x i32], [8 x i32]* %1338, i64 1
  %1340 = load i32, i32* %6, align 4
  %1341 = zext i32 %1340 to i64
  %1342 = getelementptr inbounds [8 x i32], [8 x i32]* %1339, i64 0, i64 %1341
  store i32 %1337, i32* %1342, align 4
  %1343 = load i32, i32* %127, align 4
  %1344 = load i32, i32* %128, align 4
  %1345 = sub nsw i32 %1343, %1344
  %1346 = sext i32 %1345 to i64
  %1347 = add nsw i64 %1346, 2048
  %1348 = ashr i64 %1347, 12
  %1349 = mul nsw i64 %1348, 2896
  %1350 = mul nsw i64 %1349, 2
  %1351 = load i32, i32* %129, align 4
  %1352 = sext i32 %1351 to i64
  %1353 = sub nsw i64 %1350, %1352
  %1354 = trunc i64 %1353 to i32
  store i32 %1354, i32* %144, align 4
  %1355 = load i32, i32* %144, align 4
  %1356 = sext i32 %1355 to i64
  %1357 = add nsw i64 %1356, 2048
  %1358 = ashr i64 %1357, 12
  %1359 = trunc i64 %1358 to i32
  %1360 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1361 = getelementptr inbounds [8 x i32], [8 x i32]* %1360, i64 2
  %1362 = load i32, i32* %6, align 4
  %1363 = zext i32 %1362 to i64
  %1364 = getelementptr inbounds [8 x i32], [8 x i32]* %1361, i64 0, i64 %1363
  store i32 %1359, i32* %1364, align 4
  %1365 = load i32, i32* %141, align 4
  %1366 = load i32, i32* %142, align 4
  %1367 = sub nsw i32 %1365, %1366
  %1368 = sext i32 %1367 to i64
  %1369 = add nsw i64 %1368, 2048
  %1370 = ashr i64 %1369, 12
  %1371 = mul nsw i64 %1370, 2896
  %1372 = mul nsw i64 %1371, 2
  %1373 = load i32, i32* %143, align 4
  %1374 = sext i32 %1373 to i64
  %1375 = sub nsw i64 %1372, %1374
  %1376 = trunc i64 %1375 to i32
  store i32 %1376, i32* %178, align 4
  %1377 = load i32, i32* %178, align 4
  %1378 = mul nsw i32 %1377, 2
  %1379 = load i32, i32* %144, align 4
  %1380 = sub nsw i32 %1378, %1379
  store i32 %1380, i32* %160, align 4
  %1381 = load i32, i32* %160, align 4
  %1382 = sext i32 %1381 to i64
  %1383 = add nsw i64 %1382, 2048
  %1384 = ashr i64 %1383, 12
  %1385 = trunc i64 %1384 to i32
  %1386 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1387 = getelementptr inbounds [8 x i32], [8 x i32]* %1386, i64 6
  %1388 = load i32, i32* %6, align 4
  %1389 = zext i32 %1388 to i64
  %1390 = getelementptr inbounds [8 x i32], [8 x i32]* %1387, i64 0, i64 %1389
  store i32 %1385, i32* %1390, align 4
  %1391 = load i32, i32* %157, align 4
  %1392 = load i32, i32* %158, align 4
  %1393 = sub nsw i32 %1391, %1392
  %1394 = sext i32 %1393 to i64
  %1395 = add nsw i64 %1394, 2048
  %1396 = ashr i64 %1395, 12
  %1397 = mul nsw i64 %1396, 2896
  %1398 = mul nsw i64 %1397, 2
  %1399 = load i32, i32* %159, align 4
  %1400 = sext i32 %1399 to i64
  %1401 = sub nsw i64 %1398, %1400
  %1402 = mul nsw i64 %1401, 2
  %1403 = load i32, i32* %160, align 4
  %1404 = sext i32 %1403 to i64
  %1405 = sub nsw i64 %1402, %1404
  %1406 = trunc i64 %1405 to i32
  store i32 %1406, i32* %179, align 4
  %1407 = load i32, i32* %179, align 4
  %1408 = sext i32 %1407 to i64
  %1409 = add nsw i64 %1408, 2048
  %1410 = ashr i64 %1409, 12
  %1411 = trunc i64 %1410 to i32
  %1412 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1413 = getelementptr inbounds [8 x i32], [8 x i32]* %1412, i64 10
  %1414 = load i32, i32* %6, align 4
  %1415 = zext i32 %1414 to i64
  %1416 = getelementptr inbounds [8 x i32], [8 x i32]* %1413, i64 0, i64 %1415
  store i32 %1411, i32* %1416, align 4
  %1417 = load i32, i32* %175, align 4
  %1418 = load i32, i32* %176, align 4
  %1419 = sub nsw i32 %1417, %1418
  %1420 = sext i32 %1419 to i64
  %1421 = add nsw i64 %1420, 2048
  %1422 = ashr i64 %1421, 12
  %1423 = mul nsw i64 %1422, 2896
  %1424 = mul nsw i64 %1423, 2
  %1425 = load i32, i32* %177, align 4
  %1426 = sext i32 %1425 to i64
  %1427 = sub nsw i64 %1424, %1426
  %1428 = mul nsw i64 %1427, 2
  %1429 = load i32, i32* %178, align 4
  %1430 = sext i32 %1429 to i64
  %1431 = sub nsw i64 %1428, %1430
  %1432 = mul nsw i64 %1431, 2
  %1433 = load i32, i32* %179, align 4
  %1434 = sext i32 %1433 to i64
  %1435 = sub nsw i64 %1432, %1434
  %1436 = add nsw i64 %1435, 2048
  %1437 = ashr i64 %1436, 12
  %1438 = trunc i64 %1437 to i32
  %1439 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1440 = getelementptr inbounds [8 x i32], [8 x i32]* %1439, i64 14
  %1441 = load i32, i32* %6, align 4
  %1442 = zext i32 %1441 to i64
  %1443 = getelementptr inbounds [8 x i32], [8 x i32]* %1440, i64 0, i64 %1442
  store i32 %1438, i32* %1443, align 4
  %1444 = load i32, i32* %115, align 4
  %1445 = load i32, i32* %116, align 4
  %1446 = sub nsw i32 %1444, %1445
  %1447 = sext i32 %1446 to i64
  %1448 = add nsw i64 %1447, 2048
  %1449 = ashr i64 %1448, 12
  %1450 = mul nsw i64 %1449, 3784
  %1451 = trunc i64 %1450 to i32
  store i32 %1451, i32* %180, align 4
  %1452 = load i32, i32* %117, align 4
  %1453 = load i32, i32* %118, align 4
  %1454 = sub nsw i32 %1452, %1453
  %1455 = sext i32 %1454 to i64
  %1456 = add nsw i64 %1455, 2048
  %1457 = ashr i64 %1456, 12
  %1458 = mul nsw i64 %1457, 1567
  %1459 = trunc i64 %1458 to i32
  store i32 %1459, i32* %181, align 4
  %1460 = load i32, i32* %180, align 4
  %1461 = load i32, i32* %181, align 4
  %1462 = add nsw i32 %1460, %1461
  store i32 %1462, i32* %182, align 4
  %1463 = load i32, i32* %182, align 4
  %1464 = mul nsw i32 %1463, 2
  %1465 = load i32, i32* %119, align 4
  %1466 = sub nsw i32 %1464, %1465
  store i32 %1466, i32* %147, align 4
  %1467 = load i32, i32* %147, align 4
  %1468 = mul nsw i32 %1467, 2
  %1469 = load i32, i32* %120, align 4
  %1470 = sub nsw i32 %1468, %1469
  store i32 %1470, i32* %132, align 4
  %1471 = load i32, i32* %130, align 4
  %1472 = load i32, i32* %131, align 4
  %1473 = sub nsw i32 %1471, %1472
  %1474 = sext i32 %1473 to i64
  %1475 = add nsw i64 %1474, 2048
  %1476 = ashr i64 %1475, 12
  %1477 = mul nsw i64 %1476, 2896
  %1478 = mul nsw i64 %1477, 2
  %1479 = load i32, i32* %132, align 4
  %1480 = sext i32 %1479 to i64
  %1481 = sub nsw i64 %1478, %1480
  %1482 = trunc i64 %1481 to i32
  store i32 %1482, i32* %148, align 4
  %1483 = load i32, i32* %132, align 4
  %1484 = mul nsw i32 %1483, 2
  %1485 = load i32, i32* %121, align 4
  %1486 = sub nsw i32 %1484, %1485
  store i32 %1486, i32* %126, align 4
  %1487 = load i32, i32* %126, align 4
  %1488 = sext i32 %1487 to i64
  %1489 = add nsw i64 %1488, 2048
  %1490 = ashr i64 %1489, 12
  %1491 = trunc i64 %1490 to i32
  %1492 = load [8 x i32]*, [8 x i32]** %8, align 8
  %1493 = getelementptr inbounds [8 x i32], [8 x i32]* %1492, i64 0
  %1494 = load i32, i32* %6, align 4
  %1495 = zext i32 %1494 to i64
  %1496 = getelementptr inbounds [8 x i32], [8 x i32]* %1493, i64 0, i64 %1495
  store i32 %1491, i32* %1496, align 4
  %1497 = load i32, i32* %124, align 4
  %1498 = load i32, i32* %125, align 4
  %1499 = sub nsw i32 %1497, %1498
  %1500 = sext i32 %1499 to i64
  %1501 = add nsw i64 %1500, 2048
  %1502 = ashr i64 %1501, 12
  %1503 = mul nsw i64 %1502, 2896
  %1504 = mul nsw i64 %1503, 2
  %1505 = load i32, i32* %126, align 4
  %1506 = sext i32 %1505 to i64
  %1507 = sub nsw i64 %1504, %1506
  %1508 = trunc i64 %1507 to i32
  store i32 %1508, i32* %133, align 4
  %1509 = load i32, i32* %133, align 4
  %1510 = sext i32 %1509 to i64
  %1511 = add nsw i64 %1510, 2048
  %1512 = ashr i64 %1511, 12
  %1513 = trunc i64 %1512 to i32
  %1514 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1515 = getelementptr inbounds [8 x i32], [8 x i32]* %1514, i64 1
  %1516 = load i32, i32* %6, align 4
  %1517 = zext i32 %1516 to i64
  %1518 = getelementptr inbounds [8 x i32], [8 x i32]* %1515, i64 0, i64 %1517
  store i32 %1513, i32* %1518, align 4
  %1519 = load i32, i32* %148, align 4
  %1520 = mul nsw i32 %1519, 2
  %1521 = load i32, i32* %133, align 4
  %1522 = sub nsw i32 %1520, %1521
  store i32 %1522, i32* %140, align 4
  %1523 = load i32, i32* %140, align 4
  %1524 = sext i32 %1523 to i64
  %1525 = add nsw i64 %1524, 2048
  %1526 = ashr i64 %1525, 12
  %1527 = trunc i64 %1526 to i32
  %1528 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1529 = getelementptr inbounds [8 x i32], [8 x i32]* %1528, i64 3
  %1530 = load i32, i32* %6, align 4
  %1531 = zext i32 %1530 to i64
  %1532 = getelementptr inbounds [8 x i32], [8 x i32]* %1529, i64 0, i64 %1531
  store i32 %1527, i32* %1532, align 4
  %1533 = load i32, i32* %173, align 4
  %1534 = mul nsw i32 %1533, 2
  %1535 = load i32, i32* %140, align 4
  %1536 = sub nsw i32 %1534, %1535
  store i32 %1536, i32* %149, align 4
  %1537 = load i32, i32* %149, align 4
  %1538 = sext i32 %1537 to i64
  %1539 = add nsw i64 %1538, 2048
  %1540 = ashr i64 %1539, 12
  %1541 = trunc i64 %1540 to i32
  %1542 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1543 = getelementptr inbounds [8 x i32], [8 x i32]* %1542, i64 5
  %1544 = load i32, i32* %6, align 4
  %1545 = zext i32 %1544 to i64
  %1546 = getelementptr inbounds [8 x i32], [8 x i32]* %1543, i64 0, i64 %1545
  store i32 %1541, i32* %1546, align 4
  %1547 = load i32, i32* %145, align 4
  %1548 = load i32, i32* %146, align 4
  %1549 = sub nsw i32 %1547, %1548
  %1550 = sext i32 %1549 to i64
  %1551 = add nsw i64 %1550, 2048
  %1552 = ashr i64 %1551, 12
  %1553 = mul nsw i64 %1552, 2896
  %1554 = mul nsw i64 %1553, 2
  %1555 = load i32, i32* %147, align 4
  %1556 = sext i32 %1555 to i64
  %1557 = sub nsw i64 %1554, %1556
  %1558 = trunc i64 %1557 to i32
  store i32 %1558, i32* %183, align 4
  %1559 = load i32, i32* %183, align 4
  %1560 = mul nsw i32 %1559, 2
  %1561 = load i32, i32* %148, align 4
  %1562 = sub nsw i32 %1560, %1561
  store i32 %1562, i32* %164, align 4
  %1563 = load i32, i32* %164, align 4
  %1564 = mul nsw i32 %1563, 2
  %1565 = load i32, i32* %149, align 4
  %1566 = sub nsw i32 %1564, %1565
  store i32 %1566, i32* %156, align 4
  %1567 = load i32, i32* %156, align 4
  %1568 = sext i32 %1567 to i64
  %1569 = add nsw i64 %1568, 2048
  %1570 = ashr i64 %1569, 12
  %1571 = trunc i64 %1570 to i32
  %1572 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1573 = getelementptr inbounds [8 x i32], [8 x i32]* %1572, i64 7
  %1574 = load i32, i32* %6, align 4
  %1575 = zext i32 %1574 to i64
  %1576 = getelementptr inbounds [8 x i32], [8 x i32]* %1573, i64 0, i64 %1575
  store i32 %1571, i32* %1576, align 4
  %1577 = load i32, i32* %153, align 4
  %1578 = load i32, i32* %154, align 4
  %1579 = sub nsw i32 %1577, %1578
  %1580 = sext i32 %1579 to i64
  %1581 = add nsw i64 %1580, 2048
  %1582 = ashr i64 %1581, 12
  %1583 = mul nsw i64 %1582, 2896
  %1584 = mul nsw i64 %1583, 2
  %1585 = load i32, i32* %155, align 4
  %1586 = sext i32 %1585 to i64
  %1587 = sub nsw i64 %1584, %1586
  %1588 = mul nsw i64 %1587, 2
  %1589 = load i32, i32* %156, align 4
  %1590 = sext i32 %1589 to i64
  %1591 = sub nsw i64 %1588, %1590
  %1592 = trunc i64 %1591 to i32
  store i32 %1592, i32* %165, align 4
  %1593 = load i32, i32* %165, align 4
  %1594 = sext i32 %1593 to i64
  %1595 = add nsw i64 %1594, 2048
  %1596 = ashr i64 %1595, 12
  %1597 = trunc i64 %1596 to i32
  %1598 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1599 = getelementptr inbounds [8 x i32], [8 x i32]* %1598, i64 9
  %1600 = load i32, i32* %6, align 4
  %1601 = zext i32 %1600 to i64
  %1602 = getelementptr inbounds [8 x i32], [8 x i32]* %1599, i64 0, i64 %1601
  store i32 %1597, i32* %1602, align 4
  %1603 = load i32, i32* %161, align 4
  %1604 = load i32, i32* %162, align 4
  %1605 = sub nsw i32 %1603, %1604
  %1606 = sext i32 %1605 to i64
  %1607 = add nsw i64 %1606, 2048
  %1608 = ashr i64 %1607, 12
  %1609 = mul nsw i64 %1608, 2896
  %1610 = mul nsw i64 %1609, 2
  %1611 = load i32, i32* %163, align 4
  %1612 = sext i32 %1611 to i64
  %1613 = sub nsw i64 %1610, %1612
  %1614 = mul nsw i64 %1613, 2
  %1615 = load i32, i32* %164, align 4
  %1616 = sext i32 %1615 to i64
  %1617 = sub nsw i64 %1614, %1616
  %1618 = trunc i64 %1617 to i32
  store i32 %1618, i32* %184, align 4
  %1619 = load i32, i32* %184, align 4
  %1620 = mul nsw i32 %1619, 2
  %1621 = load i32, i32* %165, align 4
  %1622 = sub nsw i32 %1620, %1621
  store i32 %1622, i32* %174, align 4
  %1623 = load i32, i32* %174, align 4
  %1624 = sext i32 %1623 to i64
  %1625 = add nsw i64 %1624, 2048
  %1626 = ashr i64 %1625, 12
  %1627 = trunc i64 %1626 to i32
  %1628 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1629 = getelementptr inbounds [8 x i32], [8 x i32]* %1628, i64 11
  %1630 = load i32, i32* %6, align 4
  %1631 = zext i32 %1630 to i64
  %1632 = getelementptr inbounds [8 x i32], [8 x i32]* %1629, i64 0, i64 %1631
  store i32 %1627, i32* %1632, align 4
  %1633 = load i32, i32* %170, align 4
  %1634 = load i32, i32* %171, align 4
  %1635 = sub nsw i32 %1633, %1634
  %1636 = sext i32 %1635 to i64
  %1637 = add nsw i64 %1636, 2048
  %1638 = ashr i64 %1637, 12
  %1639 = mul nsw i64 %1638, 2896
  %1640 = mul nsw i64 %1639, 2
  %1641 = load i32, i32* %172, align 4
  %1642 = sext i32 %1641 to i64
  %1643 = sub nsw i64 %1640, %1642
  %1644 = mul nsw i64 %1643, 2
  %1645 = load i32, i32* %173, align 4
  %1646 = sext i32 %1645 to i64
  %1647 = sub nsw i64 %1644, %1646
  %1648 = mul nsw i64 %1647, 2
  %1649 = load i32, i32* %174, align 4
  %1650 = sext i32 %1649 to i64
  %1651 = sub nsw i64 %1648, %1650
  %1652 = trunc i64 %1651 to i32
  store i32 %1652, i32* %185, align 4
  %1653 = load i32, i32* %185, align 4
  %1654 = sext i32 %1653 to i64
  %1655 = add nsw i64 %1654, 2048
  %1656 = ashr i64 %1655, 12
  %1657 = trunc i64 %1656 to i32
  %1658 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1659 = getelementptr inbounds [8 x i32], [8 x i32]* %1658, i64 13
  %1660 = load i32, i32* %6, align 4
  %1661 = zext i32 %1660 to i64
  %1662 = getelementptr inbounds [8 x i32], [8 x i32]* %1659, i64 0, i64 %1661
  store i32 %1657, i32* %1662, align 4
  %1663 = load i32, i32* %180, align 4
  %1664 = load i32, i32* %181, align 4
  %1665 = sub nsw i32 %1663, %1664
  %1666 = sext i32 %1665 to i64
  %1667 = add nsw i64 %1666, 2048
  %1668 = ashr i64 %1667, 12
  %1669 = mul nsw i64 %1668, 2896
  %1670 = mul nsw i64 %1669, 2
  %1671 = load i32, i32* %182, align 4
  %1672 = sext i32 %1671 to i64
  %1673 = sub nsw i64 %1670, %1672
  %1674 = mul nsw i64 %1673, 2
  %1675 = load i32, i32* %183, align 4
  %1676 = sext i32 %1675 to i64
  %1677 = sub nsw i64 %1674, %1676
  %1678 = mul nsw i64 %1677, 2
  %1679 = load i32, i32* %184, align 4
  %1680 = sext i32 %1679 to i64
  %1681 = sub nsw i64 %1678, %1680
  %1682 = mul nsw i64 %1681, 2
  %1683 = load i32, i32* %185, align 4
  %1684 = sext i32 %1683 to i64
  %1685 = sub nsw i64 %1682, %1684
  %1686 = add nsw i64 %1685, 2048
  %1687 = ashr i64 %1686, 12
  %1688 = trunc i64 %1687 to i32
  %1689 = load [8 x i32]*, [8 x i32]** %7, align 8
  %1690 = getelementptr inbounds [8 x i32], [8 x i32]* %1689, i64 15
  %1691 = load i32, i32* %6, align 4
  %1692 = zext i32 %1691 to i64
  %1693 = getelementptr inbounds [8 x i32], [8 x i32]* %1690, i64 0, i64 %1692
  store i32 %1688, i32* %1693, align 4
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
