; ModuleID = 'toast_audio.ll'
source_filename = "toast_audio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@in = external global %struct._IO_FILE*, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [100 x i8] c"%s: bad (missing?) header in Sun audio file \22%s\22;\0A\09Try one of -u, -a, -l instead (%s -h for help).\0A\00", align 1
@progname = external global i8*, align 8
@inname = external global i8*, align 8
@.str.1 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@input = external global i32 (i16*)*, align 8
@.str.2 = private unnamed_addr constant [76 x i8] c"%s: warning: file format #%lu for %s not implemented, defaulting to u-law.\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c".snd\00", align 1
@out = external global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind uwtable
define i32 @audio_init_input() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %5 = call i32 @fgetc(%struct._IO_FILE* %4)
  %6 = icmp ne i32 %5, 46
  br i1 %6, label %37, label %7

; <label>:7:                                      ; preds = %0
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %9 = call i32 @fgetc(%struct._IO_FILE* %8)
  %10 = icmp ne i32 %9, 115
  br i1 %10, label %37, label %11

; <label>:11:                                     ; preds = %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %13 = call i32 @fgetc(%struct._IO_FILE* %12)
  %14 = icmp ne i32 %13, 110
  br i1 %14, label %37, label %15

; <label>:15:                                     ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %17 = call i32 @fgetc(%struct._IO_FILE* %16)
  %18 = icmp ne i32 %17, 100
  br i1 %18, label %37, label %19

; <label>:19:                                     ; preds = %15
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %21 = call i32 @get_u32(%struct._IO_FILE* %20, i64* %2)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %37, label %23

; <label>:23:                                     ; preds = %19
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %25 = call i32 @get_u32(%struct._IO_FILE* %24, i64* %3)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %37, label %27

; <label>:27:                                     ; preds = %23
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %29 = call i32 @get_u32(%struct._IO_FILE* %28, i64* %3)
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %37, label %31

; <label>:31:                                     ; preds = %27
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %33 = load i64, i64* %2, align 8
  %34 = sub i64 %33, 16
  %35 = call i32 @fseek(%struct._IO_FILE* %32, i64 %34, i32 1)
  %36 = icmp slt i32 %35, 0
  br i1 %36, label %37, label %49

; <label>:37:                                     ; preds = %31, %27, %23, %19, %15, %11, %7, %0
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = load i8*, i8** @progname, align 8
  %40 = load i8*, i8** @inname, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %37
  %43 = load i8*, i8** @inname, align 8
  br label %45

; <label>:44:                                     ; preds = %37
  br label %45

; <label>:45:                                     ; preds = %44, %42
  %46 = phi i8* [ %43, %42 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), %44 ]
  %47 = load i8*, i8** @progname, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str, i32 0, i32 0), i8* %39, i8* %46, i8* %47)
  store i32 -1, i32* %1, align 4
  br label %61

; <label>:49:                                     ; preds = %31
  %50 = load i64, i64* %3, align 8
  switch i64 %50, label %54 [
    i64 1, label %51
    i64 2, label %52
    i64 3, label %53
  ]

; <label>:51:                                     ; preds = %49
  store i32 (i16*)* @ulaw_input, i32 (i16*)** @input, align 8
  br label %60

; <label>:52:                                     ; preds = %49
  store i32 (i16*)* @alaw_input, i32 (i16*)** @input, align 8
  br label %60

; <label>:53:                                     ; preds = %49
  store i32 (i16*)* @linear_input, i32 (i16*)** @input, align 8
  br label %60

; <label>:54:                                     ; preds = %49
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %56 = load i8*, i8** @progname, align 8
  %57 = load i64, i64* %3, align 8
  %58 = load i8*, i8** @inname, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.2, i32 0, i32 0), i8* %56, i64 %57, i8* %58)
  store i32 (i16*)* @ulaw_input, i32 (i16*)** @input, align 8
  br label %60

; <label>:60:                                     ; preds = %54, %53, %52, %51
  store i32 0, i32* %1, align 4
  br label %61

; <label>:61:                                     ; preds = %60, %45
  %62 = load i32, i32* %1, align 4
  ret i32 %62
}

declare i32 @fgetc(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_u32(%struct._IO_FILE*, i64*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i64* %1, i64** %5, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %9 = call i32 @_IO_getc(%struct._IO_FILE* %8)
  store i32 %9, i32* %6, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %38, label %11

; <label>:11:                                     ; preds = %2
  %12 = load i32, i32* %6, align 4
  %13 = trunc i32 %12 to i8
  %14 = zext i8 %13 to i64
  store i64 %14, i64* %7, align 8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %16 = call i32 @_IO_getc(%struct._IO_FILE* %15)
  store i32 %16, i32* %6, align 4
  %17 = icmp eq i32 %16, -1
  br i1 %17, label %38, label %18

; <label>:18:                                     ; preds = %11
  %19 = load i64, i64* %7, align 8
  %20 = shl i64 %19, 8
  %21 = load i32, i32* %6, align 4
  %22 = trunc i32 %21 to i8
  %23 = zext i8 %22 to i64
  %24 = or i64 %20, %23
  store i64 %24, i64* %7, align 8
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %26 = call i32 @_IO_getc(%struct._IO_FILE* %25)
  store i32 %26, i32* %6, align 4
  %27 = icmp eq i32 %26, -1
  br i1 %27, label %38, label %28

; <label>:28:                                     ; preds = %18
  %29 = load i64, i64* %7, align 8
  %30 = shl i64 %29, 8
  %31 = load i32, i32* %6, align 4
  %32 = trunc i32 %31 to i8
  %33 = zext i8 %32 to i64
  %34 = or i64 %30, %33
  store i64 %34, i64* %7, align 8
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %36 = call i32 @_IO_getc(%struct._IO_FILE* %35)
  store i32 %36, i32* %6, align 4
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %38, label %39

; <label>:38:                                     ; preds = %28, %18, %11, %2
  store i32 -1, i32* %3, align 4
  br label %47

; <label>:39:                                     ; preds = %28
  %40 = load i64, i64* %7, align 8
  %41 = shl i64 %40, 8
  %42 = load i32, i32* %6, align 4
  %43 = trunc i32 %42 to i8
  %44 = zext i8 %43 to i64
  %45 = or i64 %41, %44
  %46 = load i64*, i64** %5, align 8
  store i64 %45, i64* %46, align 8
  store i32 0, i32* %3, align 4
  br label %47

; <label>:47:                                     ; preds = %39, %38
  %48 = load i32, i32* %3, align 4
  ret i32 %48
}

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @ulaw_input(i16*) #1

declare i32 @alaw_input(i16*) #1

declare i32 @linear_input(i16*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @audio_init_output() #0 {
  %1 = alloca i32, align 4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %3 = call i32 @fputs(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), %struct._IO_FILE* %2)
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %33, label %5

; <label>:5:                                      ; preds = %0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %7 = call i32 @put_u32(%struct._IO_FILE* %6, i64 32)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %33, label %9

; <label>:9:                                      ; preds = %5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %11 = call i32 @put_u32(%struct._IO_FILE* %10, i64 -1)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %33, label %13

; <label>:13:                                     ; preds = %9
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %15 = call i32 @put_u32(%struct._IO_FILE* %14, i64 1)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %33, label %17

; <label>:17:                                     ; preds = %13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %19 = call i32 @put_u32(%struct._IO_FILE* %18, i64 8000)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %33, label %21

; <label>:21:                                     ; preds = %17
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %23 = call i32 @put_u32(%struct._IO_FILE* %22, i64 1)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %33, label %25

; <label>:25:                                     ; preds = %21
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %27 = call i32 @put_u32(%struct._IO_FILE* %26, i64 0)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %33, label %29

; <label>:29:                                     ; preds = %25
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %31 = call i32 @put_u32(%struct._IO_FILE* %30, i64 0)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %34

; <label>:33:                                     ; preds = %29, %25, %21, %17, %13, %9, %5, %0
  store i32 -1, i32* %1, align 4
  br label %35

; <label>:34:                                     ; preds = %29
  store i32 0, i32* %1, align 4
  br label %35

; <label>:35:                                     ; preds = %34, %33
  %36 = load i32, i32* %1, align 4
  ret i32 %36
}

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @put_u32(%struct._IO_FILE*, i64) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = lshr i64 %6, 24
  %8 = and i64 %7, 255
  %9 = trunc i64 %8 to i8
  %10 = sext i8 %9 to i32
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %12 = call i32 @_IO_putc(i32 %10, %struct._IO_FILE* %11)
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %40, label %14

; <label>:14:                                     ; preds = %2
  %15 = load i64, i64* %5, align 8
  %16 = lshr i64 %15, 16
  %17 = and i64 %16, 255
  %18 = trunc i64 %17 to i8
  %19 = sext i8 %18 to i32
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %21 = call i32 @_IO_putc(i32 %19, %struct._IO_FILE* %20)
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %40, label %23

; <label>:23:                                     ; preds = %14
  %24 = load i64, i64* %5, align 8
  %25 = lshr i64 %24, 8
  %26 = and i64 %25, 255
  %27 = trunc i64 %26 to i8
  %28 = sext i8 %27 to i32
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %30 = call i32 @_IO_putc(i32 %28, %struct._IO_FILE* %29)
  %31 = icmp eq i32 %30, -1
  br i1 %31, label %40, label %32

; <label>:32:                                     ; preds = %23
  %33 = load i64, i64* %5, align 8
  %34 = and i64 %33, 255
  %35 = trunc i64 %34 to i8
  %36 = sext i8 %35 to i32
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %38 = call i32 @_IO_putc(i32 %36, %struct._IO_FILE* %37)
  %39 = icmp eq i32 %38, -1
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %32, %23, %14, %2
  store i32 -1, i32* %3, align 4
  br label %42

; <label>:41:                                     ; preds = %32
  store i32 0, i32* %3, align 4
  br label %42

; <label>:42:                                     ; preds = %41, %40
  %43 = load i32, i32* %3, align 4
  ret i32 %43
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
