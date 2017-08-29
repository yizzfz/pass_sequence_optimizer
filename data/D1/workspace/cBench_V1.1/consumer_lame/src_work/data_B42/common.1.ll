; ModuleID = 'common.ll'
source_filename = "common.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.parameter = type { i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

@param = local_unnamed_addr global %struct.parameter { i32 1, i32 1, i32 0, i32 0 }, align 4
@tabsel_123 = local_unnamed_addr global [2 x [3 x [16 x i32]]] [[3 x [16 x i32]] [[16 x i32] [i32 0, i32 32, i32 64, i32 96, i32 128, i32 160, i32 192, i32 224, i32 256, i32 288, i32 320, i32 352, i32 384, i32 416, i32 448, i32 0], [16 x i32] [i32 0, i32 32, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 160, i32 192, i32 224, i32 256, i32 320, i32 384, i32 0], [16 x i32] [i32 0, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 160, i32 192, i32 224, i32 256, i32 320, i32 0]], [3 x [16 x i32]] [[16 x i32] [i32 0, i32 32, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 144, i32 160, i32 176, i32 192, i32 224, i32 256, i32 0], [16 x i32] [i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 144, i32 160, i32 0], [16 x i32] [i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 144, i32 160, i32 0]]], align 16
@freqs = local_unnamed_addr global [9 x i64] [i64 44100, i64 48000, i64 32000, i64 22050, i64 24000, i64 16000, i64 11025, i64 12000, i64 8000], align 16
@pcm_point = local_unnamed_addr global i32 0, align 4
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [14 x i8] c"Stream error\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Free format not supported.\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"layer=1 Not supported!\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"layer=2 Not supported!\0A\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Sorry, unknown layer type.\0A\00", align 1
@print_header.modes = internal unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.8, i32 0, i32 0)], align 16
@.str.5 = private unnamed_addr constant [7 x i8] c"Stereo\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"Joint-Stereo\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Dual-Channel\00", align 1
@.str.8 = private unnamed_addr constant [15 x i8] c"Single-Channel\00", align 1
@print_header.layers = internal unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0)], align 16
@.str.9 = private unnamed_addr constant [8 x i8] c"Unknown\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"I\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"II\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"III\00", align 1
@.str.13 = private unnamed_addr constant [63 x i8] c"MPEG %s, Layer: %s, Freq: %ld, mode: %s, modext: %d, BPF : %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"2.5\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"2.0\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"1.0\00", align 1
@.str.17 = private unnamed_addr constant [67 x i8] c"Channels: %d, copyright: %s, original: %s, CRC: %s, emphasis: %d.\0A\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@.str.20 = private unnamed_addr constant [42 x i8] c"Bitrate: %d Kbits/s, Extension value: %d\0A\00", align 1
@print_header_compact.modes = internal unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0)], align 16
@.str.21 = private unnamed_addr constant [7 x i8] c"stereo\00", align 1
@.str.22 = private unnamed_addr constant [13 x i8] c"joint-stereo\00", align 1
@.str.23 = private unnamed_addr constant [13 x i8] c"dual-channel\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"mono\00", align 1
@print_header_compact.layers = internal unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0)], align 16
@.str.25 = private unnamed_addr constant [40 x i8] c"MPEG %s layer %s, %d kbit/s, %ld Hz %s\0A\00", align 1
@wordpointer = common local_unnamed_addr global i8* null, align 8
@bitindex = common local_unnamed_addr global i32 0, align 4
@pcm_sample = common local_unnamed_addr global i8* null, align 8

; Function Attrs: noinline nounwind uwtable
define i32 @decode_header(%struct.frame*, i64) local_unnamed_addr #0 {
  %3 = and i64 %1, 1048576
  %4 = icmp eq i64 %3, 0
  %5 = lshr i64 %1, 19
  %6 = trunc i64 %5 to i32
  %7 = and i32 %6, 1
  %8 = xor i32 %7, 1
  %.sink2 = select i1 %4, i32 1, i32 %8
  %.lobit = lshr exact i64 %3, 20
  %9 = trunc i64 %.lobit to i32
  %10 = xor i32 %9, 1
  %11 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 3
  store i32 %.sink2, i32* %11, align 4
  %12 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 4
  store i32 %10, i32* %12, align 4
  %13 = lshr i64 %1, 17
  %14 = and i64 %13, 3
  %15 = sub nsw i64 4, %14
  %16 = trunc i64 %15 to i32
  %17 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 6
  store i32 %16, i32* %17, align 4
  %18 = and i64 %1, 3072
  %19 = icmp eq i64 %18, 3072
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i64 13, i64 1, %struct._IO_FILE* %21) #5
  tail call void @exit(i32 1) #6
  unreachable

; <label>:23:                                     ; preds = %2
  %24 = load i32, i32* %12, align 4
  %25 = icmp eq i32 %24, 0
  %26 = lshr i64 %1, 10
  %27 = and i64 %26, 3
  br i1 %25, label %28, label %32

; <label>:28:                                     ; preds = %23
  %29 = load i32, i32* %11, align 4
  %30 = mul nsw i32 %29, 3
  %31 = zext i32 %30 to i64
  br label %32

; <label>:32:                                     ; preds = %23, %28
  %.sink7 = phi i64 [ %31, %28 ], [ 6, %23 ]
  %33 = add nuw nsw i64 %.sink7, %27
  %34 = trunc i64 %33 to i32
  %35 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 9
  store i32 %34, i32* %35, align 4
  %36 = lshr i64 %1, 16
  %37 = trunc i64 %36 to i32
  %38 = and i32 %37, 1
  %39 = xor i32 %38, 1
  %40 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 7
  store i32 %39, i32* %40, align 4
  %41 = load i32, i32* %12, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %32
  %44 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 8
  %45 = lshr i64 %1, 12
  %46 = trunc i64 %45 to i32
  %47 = and i32 %46, 15
  store i32 %47, i32* %44, align 4
  br label %48

; <label>:48:                                     ; preds = %32, %43
  %49 = lshr i64 %1, 12
  %50 = trunc i64 %49 to i32
  %51 = and i32 %50, 15
  %52 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 8
  store i32 %51, i32* %52, align 4
  %53 = lshr i64 %1, 9
  %54 = trunc i64 %53 to i32
  %55 = and i32 %54, 1
  %56 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 10
  store i32 %55, i32* %56, align 4
  %57 = lshr i64 %1, 8
  %58 = trunc i64 %57 to i32
  %59 = and i32 %58, 1
  %60 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 11
  store i32 %59, i32* %60, align 4
  %61 = lshr i64 %1, 6
  %62 = trunc i64 %61 to i32
  %63 = and i32 %62, 3
  %64 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 12
  store i32 %63, i32* %64, align 4
  %65 = lshr i64 %1, 4
  %66 = trunc i64 %65 to i32
  %67 = and i32 %66, 3
  %68 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 13
  store i32 %67, i32* %68, align 4
  %69 = lshr i64 %1, 3
  %70 = trunc i64 %69 to i32
  %71 = and i32 %70, 1
  %72 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 14
  store i32 %71, i32* %72, align 4
  %73 = lshr i64 %1, 2
  %74 = trunc i64 %73 to i32
  %75 = and i32 %74, 1
  %76 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 15
  store i32 %75, i32* %76, align 4
  %77 = trunc i64 %1 to i32
  %78 = and i32 %77, 3
  %79 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 16
  store i32 %78, i32* %79, align 4
  %80 = load i32, i32* %64, align 4
  %81 = icmp eq i32 %80, 3
  %82 = select i1 %81, i32 1, i32 2
  %83 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 0
  store i32 %82, i32* %83, align 4
  %84 = load i32, i32* %52, align 4
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %89

; <label>:86:                                     ; preds = %48
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %88 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %87) #5
  br label %121

; <label>:89:                                     ; preds = %48
  %90 = load i32, i32* %17, align 4
  switch i32 %90, label %118 [
    i32 1, label %91
    i32 2, label %94
    i32 3, label %97
  ]

; <label>:91:                                     ; preds = %89
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %93 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %92) #5
  br label %121

; <label>:94:                                     ; preds = %89
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %96 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %95) #5
  br label %121

; <label>:97:                                     ; preds = %89
  %98 = load i32, i32* %11, align 4
  %99 = sext i32 %98 to i64
  %100 = sext i32 %84 to i64
  %101 = getelementptr inbounds [2 x [3 x [16 x i32]]], [2 x [3 x [16 x i32]]]* @tabsel_123, i64 0, i64 %99, i64 2, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = mul i32 %102, 144000
  %104 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 17
  store i32 %103, i32* %104, align 4
  %105 = load i32, i32* %35, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [9 x i64], [9 x i64]* @freqs, i64 0, i64 %106
  %108 = load i64, i64* %107, align 8
  %109 = load i32, i32* %11, align 4
  %110 = zext i32 %109 to i64
  %111 = shl i64 %108, %110
  %112 = sext i32 %103 to i64
  %113 = sdiv i64 %112, %111
  %114 = trunc i64 %113 to i32
  %115 = load i32, i32* %56, align 4
  %116 = add i32 %114, -4
  %117 = add i32 %116, %115
  store i32 %117, i32* %104, align 4
  br label %121

; <label>:118:                                    ; preds = %89
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %120 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %119) #5
  br label %121

; <label>:121:                                    ; preds = %91, %94, %97, %118, %86
  %.0 = phi i32 [ 0, %118 ], [ 0, %86 ], [ 1, %97 ], [ 1, %94 ], [ 1, %91 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @print_header(%struct.frame* nocapture readonly) local_unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 3
  %8 = load i32, i32* %7, align 4
  %9 = icmp ne i32 %8, 0
  %10 = select i1 %9, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i64 0, i64 0)
  br label %11

; <label>:11:                                     ; preds = %1, %6
  %12 = phi i8* [ %10, %6 ], [ getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0), %1 ]
  %13 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 6
  %14 = load i32, i32* %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [4 x i8*], [4 x i8*]* @print_header.layers, i64 0, i64 %15
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 9
  %19 = load i32, i32* %18, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [9 x i64], [9 x i64]* @freqs, i64 0, i64 %20
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 12
  %24 = load i32, i32* %23, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [4 x i8*], [4 x i8*]* @print_header.modes, i64 0, i64 %25
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 13
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 17
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %31, 4
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.13, i64 0, i64 0), i8* %12, i8* %17, i64 %22, i8* %27, i32 %29, i32 %32) #5
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 0
  %36 = load i32, i32* %35, align 4
  %37 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 14
  %38 = load i32, i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  %40 = select i1 %39, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i64 0, i64 0)
  %41 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 15
  %42 = load i32, i32* %41, align 4
  %43 = icmp ne i32 %42, 0
  %44 = select i1 %43, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i64 0, i64 0)
  %45 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 7
  %46 = load i32, i32* %45, align 4
  %47 = icmp ne i32 %46, 0
  %48 = select i1 %47, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i64 0, i64 0)
  %49 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 16
  %50 = load i32, i32* %49, align 4
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.17, i64 0, i64 0), i32 %36, i8* %40, i8* %44, i8* %48, i32 %50) #5
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 3
  %54 = load i32, i32* %53, align 4
  %55 = sext i32 %54 to i64
  %56 = load i32, i32* %13, align 4
  %57 = add nsw i32 %56, -1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 8
  %60 = load i32, i32* %59, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [2 x [3 x [16 x i32]]], [2 x [3 x [16 x i32]]]* @tabsel_123, i64 0, i64 %55, i64 %58, i64 %61
  %63 = load i32, i32* %62, align 4
  %64 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 11
  %65 = load i32, i32* %64, align 4
  %66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.20, i64 0, i64 0), i32 %63, i32 %65) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @print_header_compact(%struct.frame* nocapture readonly) local_unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 3
  %8 = load i32, i32* %7, align 4
  %9 = icmp ne i32 %8, 0
  %10 = select i1 %9, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i64 0, i64 0)
  br label %11

; <label>:11:                                     ; preds = %1, %6
  %12 = phi i8* [ %10, %6 ], [ getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0), %1 ]
  %13 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 6
  %14 = load i32, i32* %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [4 x i8*], [4 x i8*]* @print_header_compact.layers, i64 0, i64 %15
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 3
  %19 = load i32, i32* %18, align 4
  %20 = sext i32 %19 to i64
  %21 = add nsw i32 %14, -1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 8
  %24 = load i32, i32* %23, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [2 x [3 x [16 x i32]]], [2 x [3 x [16 x i32]]]* @tabsel_123, i64 0, i64 %20, i64 %22, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 9
  %29 = load i32, i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [9 x i64], [9 x i64]* @freqs, i64 0, i64 %30
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds %struct.frame, %struct.frame* %0, i64 0, i32 12
  %34 = load i32, i32* %33, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [4 x i8*], [4 x i8*]* @print_header_compact.modes, i64 0, i64 %35
  %37 = load i8*, i8** %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.25, i64 0, i64 0), i8* %12, i8* %17, i32 %27, i64 %32, i8* %37) #5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @getbits(i32) local_unnamed_addr #3 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %32, label %3

; <label>:3:                                      ; preds = %1
  %4 = load i8*, i8** @wordpointer, align 8
  %5 = load i8, i8* %4, align 1
  %6 = zext i8 %5 to i64
  %7 = shl nuw nsw i64 %6, 8
  %8 = getelementptr inbounds i8, i8* %4, i64 1
  %9 = load i8, i8* %8, align 1
  %10 = zext i8 %9 to i64
  %11 = or i64 %7, %10
  %12 = shl nuw nsw i64 %11, 8
  %13 = getelementptr inbounds i8, i8* %4, i64 2
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i64
  %16 = or i64 %12, %15
  %17 = load i32, i32* @bitindex, align 4
  %18 = zext i32 %17 to i64
  %19 = shl i64 %16, %18
  %20 = and i64 %19, 16777215
  %21 = add nsw i32 %17, %0
  store i32 %21, i32* @bitindex, align 4
  %22 = sub nsw i32 24, %0
  %23 = zext i32 %22 to i64
  %24 = lshr i64 %20, %23
  %25 = ashr i32 %21, 3
  %26 = load i8*, i8** @wordpointer, align 8
  %27 = sext i32 %25 to i64
  %28 = getelementptr inbounds i8, i8* %26, i64 %27
  store i8* %28, i8** @wordpointer, align 8
  %29 = load i32, i32* @bitindex, align 4
  %30 = and i32 %29, 7
  store i32 %30, i32* @bitindex, align 4
  %31 = trunc i64 %24 to i32
  br label %32

; <label>:32:                                     ; preds = %1, %3
  %.0 = phi i32 [ %31, %3 ], [ 0, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @getbits_fast(i32) local_unnamed_addr #3 {
  %2 = load i8*, i8** @wordpointer, align 8
  %3 = load i8, i8* %2, align 1
  %4 = zext i8 %3 to i64
  %5 = shl nuw nsw i64 %4, 8
  %6 = getelementptr inbounds i8, i8* %2, i64 1
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i64
  %9 = or i64 %5, %8
  %10 = load i32, i32* @bitindex, align 4
  %11 = zext i32 %10 to i64
  %12 = shl i64 %9, %11
  %13 = and i64 %12, 65535
  %14 = add nsw i32 %10, %0
  store i32 %14, i32* @bitindex, align 4
  %15 = sub nsw i32 16, %0
  %16 = zext i32 %15 to i64
  %17 = lshr i64 %13, %16
  %18 = ashr i32 %14, 3
  %19 = load i8*, i8** @wordpointer, align 8
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds i8, i8* %19, i64 %20
  store i8* %21, i8** @wordpointer, align 8
  %22 = load i32, i32* @bitindex, align 4
  %23 = and i32 %22, 7
  store i32 %23, i32* @bitindex, align 4
  %24 = trunc i64 %17 to i32
  ret i32 %24
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
