; ModuleID = 'main.ll'
source_filename = "main.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [2 x i8] c"-\00", align 1
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [24 x i8] c"Could not create \22%s\22.\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"mp3 buffer is not big enough... \0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"Error writing mp3 output\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca [16384 x i8], align 16
  %4 = alloca [2 x [1152 x i16]], align 16
  %5 = alloca %struct.lame_global_flags, align 8
  call void @lame_init(%struct.lame_global_flags* nonnull %5) #5
  %6 = icmp eq i32 %0, 1
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %2
  %8 = load i8*, i8** %1, align 8
  call void @lame_usage(%struct.lame_global_flags* nonnull %5, i8* %8) #5
  br label %9

; <label>:9:                                      ; preds = %7, %2
  call void @lame_parse_args(%struct.lame_global_flags* nonnull %5, i32 %0, i8** %1) #5
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %5, i64 0, i32 4
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %27

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %5, i64 0, i32 32
  %15 = load i8*, i8** %14, align 8
  %16 = call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #6
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  br label %27

; <label>:20:                                     ; preds = %13
  %21 = call %struct._IO_FILE* @fopen(i8* %15, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  %22 = icmp eq %struct._IO_FILE* %21, null
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %20
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = load i8*, i8** %14, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i8* %25) #7
  call void @exit(i32 1) #8
  unreachable

; <label>:27:                                     ; preds = %18, %20, %9
  %.1 = phi %struct._IO_FILE* [ null, %9 ], [ %19, %18 ], [ %21, %20 ]
  call void @lame_init_infile(%struct.lame_global_flags* nonnull %5) #5
  call void @lame_init_params(%struct.lame_global_flags* nonnull %5) #5
  call void @lame_print_config(%struct.lame_global_flags* nonnull %5) #5
  %28 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %4, i64 0, i64 0
  %29 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %4, i64 0, i64 0, i64 0
  %30 = getelementptr inbounds [2 x [1152 x i16]], [2 x [1152 x i16]]* %4, i64 0, i64 1, i64 0
  %31 = getelementptr inbounds [16384 x i8], [16384 x i8]* %3, i64 0, i64 0
  br label %32

; <label>:32:                                     ; preds = %46, %27
  %33 = call i32 @lame_readframe(%struct.lame_global_flags* nonnull %5, [1152 x i16]* nonnull %28) #5
  %34 = call i32 @lame_encode_buffer(%struct.lame_global_flags* nonnull %5, i16* nonnull %29, i16* %30, i32 %33, i8* nonnull %31, i32 16384) #5
  %35 = icmp eq i32 %34, -1
  br i1 %35, label %36, label %39

; <label>:36:                                     ; preds = %32
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i64 @fwrite(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i64 33, i64 1, %struct._IO_FILE* %37) #7
  call void @exit(i32 1) #8
  unreachable

; <label>:39:                                     ; preds = %32
  %40 = sext i32 %34 to i64
  %41 = call i64 @fwrite(i8* nonnull %31, i64 1, i64 %40, %struct._IO_FILE* %.1)
  %42 = icmp eq i64 %41, %40
  br i1 %42, label %46, label %43

; <label>:43:                                     ; preds = %39
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %44) #7
  call void @exit(i32 1) #8
  unreachable

; <label>:46:                                     ; preds = %39
  %47 = icmp eq i32 %33, 0
  br i1 %47, label %48, label %32

; <label>:48:                                     ; preds = %46
  %49 = call i32 @lame_encode_finish(%struct.lame_global_flags* nonnull %5, i8* nonnull %31, i32 16384) #5
  %50 = sext i32 %49 to i64
  %51 = call i64 @fwrite(i8* nonnull %31, i64 1, i64 %50, %struct._IO_FILE* %.1)
  %52 = call i32 @fclose(%struct._IO_FILE* %.1)
  call void @lame_close_infile(%struct.lame_global_flags* nonnull %5) #5
  call void @lame_mp3_tags(%struct.lame_global_flags* nonnull %5) #5
  ret i32 0
}

declare void @lame_init(%struct.lame_global_flags*) local_unnamed_addr #1

declare void @lame_usage(%struct.lame_global_flags*, i8*) local_unnamed_addr #1

declare void @lame_parse_args(%struct.lame_global_flags*, i32, i8**) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

declare void @lame_init_infile(%struct.lame_global_flags*) local_unnamed_addr #1

declare void @lame_init_params(%struct.lame_global_flags*) local_unnamed_addr #1

declare void @lame_print_config(%struct.lame_global_flags*) local_unnamed_addr #1

declare i32 @lame_readframe(%struct.lame_global_flags*, [1152 x i16]*) local_unnamed_addr #1

declare i32 @lame_encode_buffer(%struct.lame_global_flags*, i16*, i16*, i32, i8*, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

declare i32 @lame_encode_finish(%struct.lame_global_flags*, i8*, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

declare void @lame_close_infile(%struct.lame_global_flags*) local_unnamed_addr #1

declare void @lame_mp3_tags(%struct.lame_global_flags*) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
