; ModuleID = 'linuxplay.ll'
source_filename = "linuxplay.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@samp_rate = global i64 8000, align 8
@.str = private unnamed_addr constant [11 x i8] c"/dev/sbdsp\00", align 1
@dev_file = global i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), align 8
@.str.1 = private unnamed_addr constant [6 x i8] c"hplay\00", align 1
@prog = global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), align 8
@.str.2 = private unnamed_addr constant [12 x i8] c"linux Audio\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"Sample rate\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Audio enable\00", align 1
@help_only = external global i32, align 4
@dev_fd = internal global i32 -1, align 4
@.str.8 = private unnamed_addr constant [24 x i8] c"Actual sound rate: %ld\0A\00", align 1
@linear_fd = internal global i32 -1, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [42 x i8] c"Could not allocate memory for conversion\0A\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"write\00", align 1

; Function Attrs: nounwind uwtable
define i32 @audio_init(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %6, align 4
  store i32 1, i32* %7, align 4
  %8 = load i8**, i8*** %5, align 8
  %9 = getelementptr inbounds i8*, i8** %8, i64 0
  %10 = load i8*, i8** %9, align 8
  store i8* %10, i8** @prog, align 8
  %11 = load i32, i32* %4, align 4
  %12 = load i8**, i8*** %5, align 8
  %13 = call i32 (i8*, i32, i8**, ...) @getargs(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 %11, i8** %12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %6, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* null, i32* %7, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i8* null)
  store i32 %13, i32* %4, align 4
  %14 = load i32, i32* @help_only, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %2
  %17 = load i32, i32* %4, align 4
  store i32 %17, i32* %3, align 4
  br label %39

; <label>:18:                                     ; preds = %2
  %19 = load i32, i32* %7, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = call i32 @audio_open()
  br label %23

; <label>:23:                                     ; preds = %21, %18
  %24 = load i32, i32* %6, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %29

; <label>:26:                                     ; preds = %23
  %27 = load i32, i32* %6, align 4
  %28 = sext i32 %27 to i64
  store i64 %28, i64* @samp_rate, align 8
  br label %29

; <label>:29:                                     ; preds = %26, %23
  %30 = load i32, i32* @dev_fd, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %37

; <label>:32:                                     ; preds = %29
  %33 = load i32, i32* @dev_fd, align 4
  %34 = call i32 (i32, i64, ...) @ioctl(i32 %33, i64 3221508098, i64* @samp_rate) #4
  %35 = load i64, i64* @samp_rate, align 8
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i32 0, i32 0), i64 %35)
  br label %37

; <label>:37:                                     ; preds = %32, %29
  %38 = load i32, i32* %4, align 4
  store i32 %38, i32* %3, align 4
  br label %39

; <label>:39:                                     ; preds = %37, %16
  %40 = load i32, i32* %3, align 4
  ret i32 %40
}

declare i32 @getargs(i8*, i32, i8**, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @audio_open() #0 {
  %1 = alloca i32, align 4
  %2 = load i8*, i8** @dev_file, align 8
  %3 = call i32 (i8*, i32, ...) @open(i8* %2, i32 2049)
  store i32 %3, i32* @dev_fd, align 4
  %4 = load i32, i32* @dev_fd, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %0
  %7 = load i8*, i8** @dev_file, align 8
  call void @perror(i8* %7)
  store i32 0, i32* %1, align 4
  br label %9

; <label>:8:                                      ; preds = %0
  store i32 1, i32* %1, align 4
  br label %9

; <label>:9:                                      ; preds = %8, %6
  %10 = load i32, i32* %1, align 4
  ret i32 %10
}

; Function Attrs: nounwind
declare i32 @ioctl(i32, i64, ...) #2

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @audio_term() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @dev_fd, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %9

; <label>:4:                                      ; preds = %0
  %5 = load i32, i32* @dev_fd, align 4
  %6 = call i32 (i32, i64, ...) @ioctl(i32 %5, i64 20481, i32* %1) #4
  %7 = load i32, i32* @dev_fd, align 4
  %8 = call i32 @close(i32 %7)
  store i32 -1, i32* @dev_fd, align 4
  br label %9

; <label>:9:                                      ; preds = %4, %0
  %10 = load i32, i32* @linear_fd, align 4
  %11 = icmp sge i32 %10, 0
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %9
  %13 = load i32, i32* @linear_fd, align 4
  %14 = load i32, i32* @linear_fd, align 4
  %15 = call i64 @lseek(i32 %14, i64 0, i32 1) #4
  %16 = call i32 @ftruncate(i32 %13, i64 %15) #4
  %17 = load i32, i32* @linear_fd, align 4
  %18 = call i32 @close(i32 %17)
  store i32 -1, i32* @linear_fd, align 4
  br label %19

; <label>:19:                                     ; preds = %12, %9
  ret void
}

declare i32 @close(i32) #1

; Function Attrs: nounwind
declare i32 @ftruncate(i32, i64) #2

; Function Attrs: nounwind
declare i64 @lseek(i32, i64, i32) #2

; Function Attrs: nounwind uwtable
define void @audio_play(i32, i16*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i16*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i16* %1, i16** %4, align 8
  %7 = load i32, i32* %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %70

; <label>:9:                                      ; preds = %2
  %10 = load i32, i32* %3, align 4
  %11 = sext i32 %10 to i64
  %12 = call noalias i8* @malloc(i64 %11) #4
  store i8* %12, i8** %5, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = icmp eq i8* %13, null
  br i1 %14, label %15, label %18

; <label>:15:                                     ; preds = %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.9, i32 0, i32 0))
  call void @exit(i32 3) #5
  unreachable

; <label>:18:                                     ; preds = %9
  store i32 0, i32* %6, align 4
  br label %19

; <label>:19:                                     ; preds = %37, %18
  %20 = load i32, i32* %6, align 4
  %21 = load i32, i32* %3, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %40

; <label>:23:                                     ; preds = %19
  %24 = load i16*, i16** %4, align 8
  %25 = load i32, i32* %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i16, i16* %24, i64 %26
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = sub nsw i32 %29, 32768
  %31 = sdiv i32 %30, 256
  %32 = trunc i32 %31 to i8
  %33 = load i8*, i8** %5, align 8
  %34 = load i32, i32* %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8* %33, i64 %35
  store i8 %32, i8* %36, align 1
  br label %37

; <label>:37:                                     ; preds = %23
  %38 = load i32, i32* %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %6, align 4
  br label %19

; <label>:40:                                     ; preds = %19
  %41 = load i32, i32* @linear_fd, align 4
  %42 = icmp sge i32 %41, 0
  br i1 %42, label %43, label %54

; <label>:43:                                     ; preds = %40
  %44 = load i32, i32* @linear_fd, align 4
  %45 = load i8*, i8** %5, align 8
  %46 = load i32, i32* %3, align 4
  %47 = sext i32 %46 to i64
  %48 = call i64 @write(i32 %44, i8* %45, i64 %47)
  %49 = load i32, i32* %3, align 4
  %50 = sext i32 %49 to i64
  %51 = icmp ne i64 %48, %50
  br i1 %51, label %52, label %53

; <label>:52:                                     ; preds = %43
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0))
  br label %53

; <label>:53:                                     ; preds = %52, %43
  br label %54

; <label>:54:                                     ; preds = %53, %40
  %55 = load i32, i32* @dev_fd, align 4
  %56 = icmp sge i32 %55, 0
  br i1 %56, label %57, label %68

; <label>:57:                                     ; preds = %54
  %58 = load i32, i32* @dev_fd, align 4
  %59 = load i8*, i8** %5, align 8
  %60 = load i32, i32* %3, align 4
  %61 = sext i32 %60 to i64
  %62 = call i64 @write(i32 %58, i8* %59, i64 %61)
  %63 = load i32, i32* %3, align 4
  %64 = sext i32 %63 to i64
  %65 = icmp ne i64 %62, %64
  br i1 %65, label %66, label %67

; <label>:66:                                     ; preds = %57
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0))
  br label %67

; <label>:67:                                     ; preds = %66, %57
  br label %68

; <label>:68:                                     ; preds = %67, %54
  %69 = load i8*, i8** %5, align 8
  call void @free(i8* %69) #4
  br label %70

; <label>:70:                                     ; preds = %68, %2
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i64 @write(i32, i8*, i64) #1

declare void @perror(i8*) #1

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @open(i8*, i32, ...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
