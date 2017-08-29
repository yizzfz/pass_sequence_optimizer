; ModuleID = 'util.ll'
source_filename = "util.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%union.anon = type { i64 }
%struct.bit_stream_struc = type { i8*, i32, %struct._IO_FILE*, i8*, i32, i64, i32, i32 }

@s_freq_table = local_unnamed_addr global [2 x [4 x double]] [[4 x double] [double 2.205000e+01, double 2.400000e+01, double 1.600000e+01, double 0.000000e+00], [4 x double] [double 4.410000e+01, double 4.800000e+01, double 3.200000e+01, double 0.000000e+00]], align 16
@bitrate_table = local_unnamed_addr global [2 x [15 x i32]] [[15 x i32] [i32 0, i32 8, i32 16, i32 24, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 144, i32 160], [15 x i32] [i32 0, i32 32, i32 40, i32 48, i32 56, i32 64, i32 80, i32 96, i32 112, i32 128, i32 160, i32 192, i32 224, i32 256, i32 320]], align 16
@NativeByteOrder = local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"MPEG1 samplerates(kHz): 32 44.1 48 \0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"bitrates(kbs): \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%i \00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"MPEG2 samplerates(kHz): 16 22.05 24 \0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [51 x i8] c"Bitrate %dkbs not legal for %iHz output sampling.\0A\00", align 1
@.str.6 = private unnamed_addr constant [47 x i8] c"SmpFrqIndex: %ldHz is not a legal sample rate\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"Unable to allocate %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"ABCD\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"DCBA\00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"j == (bs->buf_size-1 - bs->buf_byte_idx)\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"util.c\00", align 1
@__PRETTY_FUNCTION__.copy_buffer = private unnamed_addr constant [49 x i8] c"int copy_buffer(char *, int, Bit_stream_struc *)\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"buffer\00", align 1
@putmask = local_unnamed_addr global [9 x i32] [i32 0, i32 1, i32 3, i32 7, i32 15, i32 31, i32 63, i32 127, i32 255], align 16
@.str.13 = private unnamed_addr constant [51 x i8] c"Cannot read or write more than %d bits at a time.\0A\00", align 1
@.str.14 = private unnamed_addr constant [22 x i8] c"bs->buf_byte_idx >= 0\00", align 1
@__PRETTY_FUNCTION__.putbits = private unnamed_addr constant [52 x i8] c"void putbits(Bit_stream_struc *, unsigned int, int)\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @getframebits(%struct.lame_global_flags* nocapture readonly, i32* nocapture, i32* nocapture) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 3
  %5 = load i32, i32* %4, align 8
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %9 = load i32, i32* %8, align 8
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 50
  %12 = load i32, i32* %11, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 %10, i64 %13
  %15 = load i32, i32* %14, align 4
  %16 = sitofp i32 %15 to double
  %17 = icmp eq i32 %9, 1
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %19, 1
  %. = select i1 %20, i32 168, i32 288
  %.4 = select i1 %20, i32 104, i32 168
  %.2 = select i1 %17, i32 %., i32 %.4
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 14
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  %24 = or i32 %.2, 16
  %.2. = select i1 %23, i32 %.2, i32 %24
  %25 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 42
  %26 = load i32, i32* %25, align 4
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %7
  %29 = fmul double %16, 1.250000e-01
  %30 = fmul double %29, %28
  %31 = fadd double %30, 1.000000e-09
  %32 = tail call double @floor(double %31) #8
  %33 = fptosi double %32 to i32
  %34 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 44
  %35 = load i32, i32* %34, align 4
  %36 = add i32 %33, %35
  %37 = shl i32 %36, 3
  store i32 %37, i32* %1, align 4
  %38 = sub nsw i32 %37, %.2.
  %39 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %40 = load i32, i32* %39, align 8
  %41 = sdiv i32 %38, %40
  store i32 %41, i32* %2, align 4
  ret void
}

; Function Attrs: nounwind readnone
declare double @floor(double) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @display_bitrates(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %0)
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.1, i64 0, i64 0), i64 36, i64 1, %struct._IO_FILE* %0)
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %0)
  %4 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 1), align 4
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %4)
  %6 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 2), align 4
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %6)
  %8 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 3), align 4
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %8)
  %10 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 4), align 4
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %10)
  %12 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 5), align 4
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %12)
  %14 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 6), align 4
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %14)
  %16 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 7), align 4
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %16)
  %18 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 8), align 4
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %18)
  %20 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 9), align 4
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %20)
  %22 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 10), align 4
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %22)
  %24 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 11), align 4
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %24)
  %26 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 12), align 4
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %26)
  %28 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 13), align 4
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %28)
  %30 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 1, i64 14), align 4
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %30)
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %0)
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %0)
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %0)
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %0)
  %34 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 1), align 4
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %34)
  %36 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 2), align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %36)
  %38 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 3), align 4
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %38)
  %40 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 4), align 16
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %40)
  %42 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 5), align 4
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %42)
  %44 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 6), align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %44)
  %46 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 7), align 4
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %46)
  %48 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 8), align 16
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %48)
  %50 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 9), align 4
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %50)
  %52 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 10), align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %52)
  %54 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 11), align 4
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %54)
  %56 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 12), align 16
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %56)
  %58 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 13), align 4
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %58)
  %60 = load i32, i32* getelementptr inbounds ([2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 0, i64 14), align 8
  %61 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %60)
  %fputc9 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @BitrateIndex(i32, i32, i32) local_unnamed_addr #0 {
  %4 = sext i32 %1 to i64
  br label %5

; <label>:5:                                      ; preds = %3, %5
  %.024 = phi i32 [ 0, %3 ], [ %.13, %5 ]
  %6 = sext i32 %.024 to i64
  %7 = getelementptr inbounds [2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 %4, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %8, %0
  %not. = xor i1 %9, true
  %10 = zext i1 %not. to i32
  %.13 = add nsw i32 %10, %.024
  %11 = xor i1 %9, true
  %12 = icmp slt i32 %.13, 15
  %. = and i1 %12, %11
  br i1 %., label %5, label %13

; <label>:13:                                     ; preds = %5
  br i1 %9, label %17, label %14

; <label>:14:                                     ; preds = %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.5, i64 0, i64 0), i32 %0, i32 %2) #9
  br label %17

; <label>:17:                                     ; preds = %13, %14
  %.0 = phi i32 [ -1, %14 ], [ %.13, %13 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @SmpFrqIndex(i64, i32* nocapture) local_unnamed_addr #0 {
  store i32 0, i32* %1, align 4
  switch i64 %0, label %9 [
    i64 44100, label %3
    i64 48000, label %4
    i64 32000, label %5
    i64 24000, label %6
    i64 22050, label %7
    i64 16000, label %8
  ]

; <label>:3:                                      ; preds = %2
  store i32 1, i32* %1, align 4
  br label %12

; <label>:4:                                      ; preds = %2
  store i32 1, i32* %1, align 4
  br label %12

; <label>:5:                                      ; preds = %2
  store i32 1, i32* %1, align 4
  br label %12

; <label>:6:                                      ; preds = %2
  store i32 0, i32* %1, align 4
  br label %12

; <label>:7:                                      ; preds = %2
  store i32 0, i32* %1, align 4
  br label %12

; <label>:8:                                      ; preds = %2
  store i32 0, i32* %1, align 4
  br label %12

; <label>:9:                                      ; preds = %2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.6, i64 0, i64 0), i64 %0) #9
  br label %12

; <label>:12:                                     ; preds = %9, %8, %7, %6, %5, %4, %3
  %.0 = phi i32 [ 0, %3 ], [ 1, %4 ], [ 2, %5 ], [ 1, %6 ], [ 0, %7 ], [ 2, %8 ], [ -1, %9 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define noalias i8* @mem_alloc(i64, i8*) local_unnamed_addr #0 {
  %3 = tail call noalias i8* @malloc(i64 %0) #7
  %4 = icmp eq i8* %3, null
  br i1 %4, label %6, label %5

; <label>:5:                                      ; preds = %2
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %3, i8 0, i64 %0, i32 1, i1 false)
  ret i8* %3

; <label>:6:                                      ; preds = %2
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i8* %1) #9
  tail call void @exit(i32 1) #10
  unreachable
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define i32 @DetermineByteOrder() local_unnamed_addr #0 {
  %1 = alloca [9 x i8], align 1
  %2 = alloca %union.anon, align 8
  %3 = getelementptr inbounds %union.anon, %union.anon* %2, i64 0, i32 0
  store i64 1094861636, i64* %3, align 8
  %4 = getelementptr inbounds [9 x i8], [9 x i8]* %1, i64 0, i64 0
  %5 = bitcast %union.anon* %2 to i8*
  %6 = call i8* @strncpy(i8* nonnull %4, i8* nonnull %5, i64 8) #7
  %7 = getelementptr inbounds [9 x i8], [9 x i8]* %1, i64 0, i64 8
  store i8 0, i8* %7, align 1
  %8 = call i32 @strcmp(i8* nonnull %4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0)) #11
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %13, label %10

; <label>:10:                                     ; preds = %0
  %11 = call i32 @strcmp(i8* nonnull %4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i64 0, i64 0)) #11
  %12 = icmp eq i32 %11, 0
  %. = select i1 %12, i32 2, i32 0
  br label %13

; <label>:13:                                     ; preds = %10, %0
  %.0 = phi i32 [ 1, %0 ], [ %., %10 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i64) local_unnamed_addr #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #5

; Function Attrs: noinline norecurse nounwind uwtable
define void @SwapBytesInWords(i16* nocapture, i32) local_unnamed_addr #6 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %4 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.03.prol = phi i16* [ %8, %.lr.ph.prol ], [ %0, %.lr.ph.prol.preheader ]
  %.012.prol = phi i32 [ %9, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %5 = load i16, i16* %.03.prol, align 2
  %.sroa.0.0.extract.trunc.prol = trunc i16 %5 to i8
  %.sroa.2.0.extract.shift.prol = lshr i16 %5, 8
  %.sroa.2.0.extract.trunc.prol = trunc i16 %.sroa.2.0.extract.shift.prol to i8
  %6 = bitcast i16* %.03.prol to i8*
  store i8 %.sroa.2.0.extract.trunc.prol, i8* %6, align 1
  %7 = getelementptr inbounds i8, i8* %6, i64 1
  store i8 %.sroa.0.0.extract.trunc.prol, i8* %7, align 1
  %8 = getelementptr inbounds i16, i16* %.03.prol, i64 1
  %9 = add nuw nsw i32 %.012.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.03.unr = phi i16* [ %0, %.lr.ph.preheader ], [ %8, %.lr.ph.prol.loopexit.loopexit ]
  %.012.unr = phi i32 [ 0, %.lr.ph.preheader ], [ %9, %.lr.ph.prol.loopexit.loopexit ]
  %10 = icmp ult i32 %4, 3
  br i1 %10, label %._crit_edge, label %.lr.ph.preheader8

.lr.ph.preheader8:                                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader8, %.lr.ph
  %.03 = phi i16* [ %26, %.lr.ph ], [ %.03.unr, %.lr.ph.preheader8 ]
  %.012 = phi i32 [ %27, %.lr.ph ], [ %.012.unr, %.lr.ph.preheader8 ]
  %11 = load i16, i16* %.03, align 2
  %.sroa.0.0.extract.trunc = trunc i16 %11 to i8
  %.sroa.2.0.extract.shift = lshr i16 %11, 8
  %.sroa.2.0.extract.trunc = trunc i16 %.sroa.2.0.extract.shift to i8
  %12 = bitcast i16* %.03 to i8*
  store i8 %.sroa.2.0.extract.trunc, i8* %12, align 1
  %13 = getelementptr inbounds i8, i8* %12, i64 1
  store i8 %.sroa.0.0.extract.trunc, i8* %13, align 1
  %14 = getelementptr inbounds i16, i16* %.03, i64 1
  %15 = load i16, i16* %14, align 2
  %.sroa.0.0.extract.trunc.1 = trunc i16 %15 to i8
  %.sroa.2.0.extract.shift.1 = lshr i16 %15, 8
  %.sroa.2.0.extract.trunc.1 = trunc i16 %.sroa.2.0.extract.shift.1 to i8
  %16 = bitcast i16* %14 to i8*
  store i8 %.sroa.2.0.extract.trunc.1, i8* %16, align 1
  %17 = getelementptr inbounds i8, i8* %16, i64 1
  store i8 %.sroa.0.0.extract.trunc.1, i8* %17, align 1
  %18 = getelementptr inbounds i16, i16* %.03, i64 2
  %19 = load i16, i16* %18, align 2
  %.sroa.0.0.extract.trunc.2 = trunc i16 %19 to i8
  %.sroa.2.0.extract.shift.2 = lshr i16 %19, 8
  %.sroa.2.0.extract.trunc.2 = trunc i16 %.sroa.2.0.extract.shift.2 to i8
  %20 = bitcast i16* %18 to i8*
  store i8 %.sroa.2.0.extract.trunc.2, i8* %20, align 1
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  store i8 %.sroa.0.0.extract.trunc.2, i8* %21, align 1
  %22 = getelementptr inbounds i16, i16* %.03, i64 3
  %23 = load i16, i16* %22, align 2
  %.sroa.0.0.extract.trunc.3 = trunc i16 %23 to i8
  %.sroa.2.0.extract.shift.3 = lshr i16 %23, 8
  %.sroa.2.0.extract.trunc.3 = trunc i16 %.sroa.2.0.extract.shift.3 to i8
  %24 = bitcast i16* %22 to i8*
  store i8 %.sroa.2.0.extract.trunc.3, i8* %24, align 1
  %25 = getelementptr inbounds i8, i8* %24, i64 1
  store i8 %.sroa.0.0.extract.trunc.3, i8* %25, align 1
  %26 = getelementptr inbounds i16, i16* %.03, i64 4
  %27 = add nsw i32 %.012, 4
  %exitcond.3 = icmp eq i32 %27, %1
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @empty_buffer(%struct.bit_stream_struc* nocapture) local_unnamed_addr #6 {
  %2 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 6
  %3 = load i32, i32* %2, align 8
  %4 = add nsw i32 %3, 1
  %5 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 4
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, %4
  br i1 %7, label %8, label %15

; <label>:8:                                      ; preds = %1
  %9 = add nsw i32 %6, -1
  store i32 %9, i32* %2, align 8
  %10 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 7
  store i32 8, i32* %10, align 4
  %11 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 3
  %12 = load i8*, i8** %11, align 8
  %13 = sext i32 %9 to i64
  %14 = getelementptr inbounds i8, i8* %12, i64 %13
  store i8 0, i8* %14, align 1
  br label %15

; <label>:15:                                     ; preds = %1, %8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @copy_buffer(i8* nocapture, i32, %struct.bit_stream_struc* nocapture) local_unnamed_addr #0 {
  %4 = icmp eq i32 %1, 0
  br i1 %4, label %13, label %5

; <label>:5:                                      ; preds = %3
  %6 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %2, i64 0, i32 4
  %7 = load i32, i32* %6, align 8
  %8 = add nsw i32 %7, -1
  %9 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %2, i64 0, i32 6
  %10 = load i32, i32* %9, align 8
  %11 = sub i32 %8, %10
  %12 = icmp sgt i32 %11, %1
  br i1 %12, label %36, label %13

; <label>:13:                                     ; preds = %3, %5
  %14 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %2, i64 0, i32 4
  %15 = load i32, i32* %14, align 8
  %.024 = add nsw i32 %15, -1
  %16 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %2, i64 0, i32 6
  %17 = load i32, i32* %16, align 8
  %18 = icmp sgt i32 %.024, %17
  br i1 %18, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %13
  %19 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %2, i64 0, i32 3
  %20 = sext i32 %.024 to i64
  br label %21

; <label>:21:                                     ; preds = %.lr.ph, %21
  %indvars.iv10 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next11, %21 ]
  %indvars.iv = phi i64 [ %20, %.lr.ph ], [ %indvars.iv.next, %21 ]
  %22 = load i8*, i8** %19, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 %indvars.iv
  %24 = load i8, i8* %23, align 1
  %25 = getelementptr inbounds i8, i8* %0, i64 %indvars.iv10
  store i8 %24, i8* %25, align 1
  %indvars.iv.next11 = add nuw i64 %indvars.iv10, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %26 = load i32, i32* %16, align 8
  %27 = sext i32 %26 to i64
  %28 = icmp sgt i64 %indvars.iv.next, %27
  br i1 %28, label %21, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %21
  %29 = trunc i64 %indvars.iv.next11 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %13
  %.01.lcssa = phi i32 [ 0, %13 ], [ %29, %._crit_edge.loopexit ]
  %.lcssa = phi i32 [ %17, %13 ], [ %26, %._crit_edge.loopexit ]
  %30 = load i32, i32* %14, align 8
  %31 = xor i32 %.lcssa, -1
  %32 = add i32 %30, %31
  %33 = icmp eq i32 %.01.lcssa, %32
  br i1 %33, label %35, label %34

; <label>:34:                                     ; preds = %._crit_edge
  tail call void @__assert_fail(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i64 0, i64 0), i32 270, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__PRETTY_FUNCTION__.copy_buffer, i64 0, i64 0)) #10
  unreachable

; <label>:35:                                     ; preds = %._crit_edge
  tail call void @empty_buffer(%struct.bit_stream_struc* nonnull %2)
  br label %36

; <label>:36:                                     ; preds = %5, %35
  %.0 = phi i32 [ %.01.lcssa, %35 ], [ -1, %5 ]
  ret i32 %.0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define void @init_bit_stream_w(%struct.bit_stream_struc* nocapture) local_unnamed_addr #0 {
  tail call void @alloc_buffer(%struct.bit_stream_struc* %0, i32 16384)
  %2 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 6
  store i32 16383, i32* %2, align 8
  %3 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 7
  store i32 8, i32* %3, align 4
  %4 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 5
  store i64 0, i64* %4, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @alloc_buffer(%struct.bit_stream_struc* nocapture, i32) local_unnamed_addr #0 {
  %3 = sext i32 %1 to i64
  %4 = tail call i8* @mem_alloc(i64 %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i64 0, i64 0))
  %5 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 3
  store i8* %4, i8** %5, align 8
  %6 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 4
  store i32 %1, i32* %6, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @desalloc_buffer(%struct.bit_stream_struc* nocapture readonly) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 3
  %3 = load i8*, i8** %2, align 8
  tail call void @free(i8* %3) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @putbits(%struct.bit_stream_struc* nocapture, i32, i32) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 32
  br i1 %4, label %.thread, label %11

.thread:                                          ; preds = %3
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.13, i64 0, i64 0), i32 32) #9
  %7 = sext i32 %2 to i64
  %8 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 5
  %9 = load i64, i64* %8, align 8
  %10 = add i64 %9, %7
  store i64 %10, i64* %8, align 8
  br label %.lr.ph

; <label>:11:                                     ; preds = %3
  %12 = sext i32 %2 to i64
  %13 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 5
  %14 = load i64, i64* %13, align 8
  %15 = add i64 %14, %12
  store i64 %15, i64* %13, align 8
  %16 = icmp sgt i32 %2, 0
  br i1 %16, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.thread, %11
  %17 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 7
  %18 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 3
  %19 = getelementptr inbounds %struct.bit_stream_struc, %struct.bit_stream_struc* %0, i64 0, i32 6
  br label %20

; <label>:20:                                     ; preds = %.lr.ph, %.backedge
  %.01 = phi i32 [ %2, %.lr.ph ], [ %23, %.backedge ]
  %21 = load i32, i32* %17, align 4
  %22 = icmp slt i32 %.01, %21
  %.0. = select i1 %22, i32 %.01, i32 %21
  %23 = sub nsw i32 %.01, %.0.
  %24 = lshr i32 %1, %23
  %25 = sext i32 %.0. to i64
  %26 = getelementptr inbounds [9 x i32], [9 x i32]* @putmask, i64 0, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = and i32 %24, %27
  %29 = load i32, i32* %17, align 4
  %30 = sub nsw i32 %29, %.0.
  %31 = shl i32 %28, %30
  %32 = load i8*, i8** %18, align 8
  %33 = load i32, i32* %19, align 8
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* %32, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = or i32 %37, %31
  %39 = trunc i32 %38 to i8
  store i8 %39, i8* %35, align 1
  %40 = load i32, i32* %17, align 4
  %41 = sub nsw i32 %40, %.0.
  store i32 %41, i32* %17, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %44, label %.backedge

.backedge:                                        ; preds = %20, %49
  %43 = icmp sgt i32 %23, 0
  br i1 %43, label %20, label %._crit_edge.loopexit

; <label>:44:                                     ; preds = %20
  store i32 8, i32* %17, align 4
  %45 = load i32, i32* %19, align 8
  %46 = add nsw i32 %45, -1
  store i32 %46, i32* %19, align 8
  %47 = icmp sgt i32 %45, 0
  br i1 %47, label %49, label %48

; <label>:48:                                     ; preds = %44
  tail call void @__assert_fail(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i64 0, i64 0), i32 328, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.putbits, i64 0, i64 0)) #10
  unreachable

; <label>:49:                                     ; preds = %44
  %50 = load i8*, i8** %18, align 8
  %51 = sext i32 %46 to i64
  %52 = getelementptr inbounds i8, i8* %50, i64 %51
  store i8 0, i8* %52, align 1
  br label %.backedge

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %11
  ret void
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #7

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #7

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
