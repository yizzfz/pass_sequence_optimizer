; ModuleID = 'toast_audio.1.ll'
source_filename = "toast_audio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@in = external local_unnamed_addr global %struct._IO_FILE*, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [100 x i8] c"%s: bad (missing?) header in Sun audio file \22%s\22;\0A\09Try one of -u, -a, -l instead (%s -h for help).\0A\00", align 1
@progname = external local_unnamed_addr global i8*, align 8
@inname = external local_unnamed_addr global i8*, align 8
@.str.1 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@input = external local_unnamed_addr global i32 (i16*)*, align 8
@.str.2 = private unnamed_addr constant [76 x i8] c"%s: warning: file format #%lu for %s not implemented, defaulting to u-law.\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c".snd\00", align 1
@out = external local_unnamed_addr global %struct._IO_FILE*, align 8
@switch.table = private unnamed_addr constant [3 x i32 (i16*)*] [i32 (i16*)* @ulaw_input, i32 (i16*)* @alaw_input, i32 (i16*)* @linear_input]

; Function Attrs: noinline nounwind uwtable
define i32 @audio_init_input() local_unnamed_addr #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %4 = tail call i32 @fgetc(%struct._IO_FILE* %3)
  %5 = icmp eq i32 %4, 46
  br i1 %5, label %6, label %36

; <label>:6:                                      ; preds = %0
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %8 = tail call i32 @fgetc(%struct._IO_FILE* %7)
  %9 = icmp eq i32 %8, 115
  br i1 %9, label %10, label %36

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %12 = tail call i32 @fgetc(%struct._IO_FILE* %11)
  %13 = icmp eq i32 %12, 110
  br i1 %13, label %14, label %36

; <label>:14:                                     ; preds = %10
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %16 = tail call i32 @fgetc(%struct._IO_FILE* %15)
  %17 = icmp eq i32 %16, 100
  br i1 %17, label %18, label %36

; <label>:18:                                     ; preds = %14
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %20 = call fastcc i32 @get_u32(%struct._IO_FILE* %19, i64* nonnull %1)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %36

; <label>:22:                                     ; preds = %18
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %24 = call fastcc i32 @get_u32(%struct._IO_FILE* %23, i64* nonnull %2)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %36

; <label>:26:                                     ; preds = %22
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %28 = call fastcc i32 @get_u32(%struct._IO_FILE* %27, i64* nonnull %2)
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %36

; <label>:30:                                     ; preds = %26
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %32 = load i64, i64* %1, align 8
  %33 = add i64 %32, -16
  %34 = tail call i32 @fseek(%struct._IO_FILE* %31, i64 %33, i32 1)
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %43

; <label>:36:                                     ; preds = %30, %26, %22, %18, %14, %10, %6, %0
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = load i8*, i8** @progname, align 8
  %39 = load i8*, i8** @inname, align 8
  %40 = icmp eq i8* %39, null
  %41 = select i1 %40, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i8* %39
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str, i64 0, i64 0), i8* %38, i8* %41, i8* %38) #3
  br label %52

; <label>:43:                                     ; preds = %30
  %44 = load i64, i64* %2, align 8
  %switch.tableidx = add i64 %44, -1
  %45 = icmp ult i64 %switch.tableidx, 3
  br i1 %45, label %switch.lookup, label %46

; <label>:46:                                     ; preds = %43
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = load i8*, i8** @progname, align 8
  %49 = load i8*, i8** @inname, align 8
  %50 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.2, i64 0, i64 0), i8* %48, i64 %44, i8* %49) #3
  br label %51

switch.lookup:                                    ; preds = %43
  %switch.gep = getelementptr inbounds [3 x i32 (i16*)*], [3 x i32 (i16*)*]* @switch.table, i64 0, i64 %switch.tableidx
  %switch.load = load i32 (i16*)*, i32 (i16*)** %switch.gep, align 8
  br label %51

; <label>:51:                                     ; preds = %switch.lookup, %46
  %ulaw_input.sink = phi i32 (i16*)* [ @ulaw_input, %46 ], [ %switch.load, %switch.lookup ]
  store i32 (i16*)* %ulaw_input.sink, i32 (i16*)** @input, align 8
  br label %52

; <label>:52:                                     ; preds = %51, %36
  %.0 = phi i32 [ -1, %36 ], [ 0, %51 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @get_u32(%struct._IO_FILE* nocapture, i64* nocapture) unnamed_addr #0 {
  %3 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %26, label %5

; <label>:5:                                      ; preds = %2
  %6 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %26, label %8

; <label>:8:                                      ; preds = %5
  %9 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %26, label %11

; <label>:11:                                     ; preds = %8
  %12 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %26, label %14

; <label>:14:                                     ; preds = %11
  %15 = shl i32 %3, 8
  %16 = and i32 %15, 65280
  %17 = and i32 %6, 255
  %18 = or i32 %17, %16
  %19 = shl nuw nsw i32 %18, 8
  %20 = and i32 %9, 255
  %21 = or i32 %20, %19
  %22 = shl nuw i32 %21, 8
  %23 = and i32 %12, 255
  %24 = or i32 %23, %22
  %25 = zext i32 %24 to i64
  store i64 %25, i64* %1, align 8
  br label %26

; <label>:26:                                     ; preds = %14, %11, %8, %5, %2
  %.0 = phi i32 [ 0, %14 ], [ -1, %11 ], [ -1, %8 ], [ -1, %5 ], [ -1, %2 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fseek(%struct._IO_FILE* nocapture, i64, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #1

declare i32 @ulaw_input(i16*) #2

declare i32 @alaw_input(i16*) #2

declare i32 @linear_input(i16*) #2

; Function Attrs: noinline nounwind uwtable
define i32 @audio_init_output() local_unnamed_addr #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %2 = tail call i32 @fputs(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), %struct._IO_FILE* %1)
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %31, label %4

; <label>:4:                                      ; preds = %0
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %6 = tail call fastcc i32 @put_u32(%struct._IO_FILE* %5, i64 32)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %31

; <label>:8:                                      ; preds = %4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %10 = tail call fastcc i32 @put_u32(%struct._IO_FILE* %9, i64 -1)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %31

; <label>:12:                                     ; preds = %8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %14 = tail call fastcc i32 @put_u32(%struct._IO_FILE* %13, i64 1)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %31

; <label>:16:                                     ; preds = %12
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %18 = tail call fastcc i32 @put_u32(%struct._IO_FILE* %17, i64 8000)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %31

; <label>:20:                                     ; preds = %16
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %22 = tail call fastcc i32 @put_u32(%struct._IO_FILE* %21, i64 1)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %31

; <label>:24:                                     ; preds = %20
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %26 = tail call fastcc i32 @put_u32(%struct._IO_FILE* %25, i64 0)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %24
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %30 = tail call fastcc i32 @put_u32(%struct._IO_FILE* %29, i64 0)
  %not. = icmp ne i32 %30, 0
  %. = sext i1 %not. to i32
  ret i32 %.

; <label>:31:                                     ; preds = %24, %20, %16, %12, %8, %4, %0
  ret i32 -1
}

; Function Attrs: nounwind
declare i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @put_u32(%struct._IO_FILE* nocapture, i64) unnamed_addr #0 {
  %3 = trunc i64 %1 to i32
  %sext = ashr i32 %3, 24
  %4 = tail call i32 @_IO_putc(i32 %sext, %struct._IO_FILE* %0)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %20, label %6

; <label>:6:                                      ; preds = %2
  %7 = lshr i64 %1, 16
  %sext23 = shl i64 %7, 24
  %sext2 = trunc i64 %sext23 to i32
  %8 = ashr exact i32 %sext2, 24
  %9 = tail call i32 @_IO_putc(i32 %8, %struct._IO_FILE* %0)
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %20, label %11

; <label>:11:                                     ; preds = %6
  %12 = lshr i64 %1, 8
  %sext45 = shl i64 %12, 24
  %sext4 = trunc i64 %sext45 to i32
  %13 = ashr exact i32 %sext4, 24
  %14 = tail call i32 @_IO_putc(i32 %13, %struct._IO_FILE* %0)
  %15 = icmp eq i32 %14, -1
  br i1 %15, label %20, label %16

; <label>:16:                                     ; preds = %11
  %sext6 = shl i32 %3, 24
  %17 = ashr exact i32 %sext6, 24
  %18 = tail call i32 @_IO_putc(i32 %17, %struct._IO_FILE* %0)
  %19 = icmp eq i32 %18, -1
  %. = sext i1 %19 to i32
  ret i32 %.

; <label>:20:                                     ; preds = %11, %6, %2
  ret i32 -1
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
