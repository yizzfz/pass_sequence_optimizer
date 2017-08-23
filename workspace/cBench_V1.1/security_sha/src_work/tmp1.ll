; ModuleID = 'sha_driver.ll'
source_filename = "sha_driver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.SHA_INFO = type { [5 x i64], i64, i64, [16 x i64] }

@stdin = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [30 x i8] c"error opening %s for reading\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca %struct.SHA_INFO, align 8
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load i32, i32* %4, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %18

; <label>:11:                                     ; preds = %3
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %12, %struct._IO_FILE** %7, align 8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @sha_stream(%struct.SHA_INFO* %8, %struct._IO_FILE* %13)
  %14 = load i32, i32* %6, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %11
  call void @sha_print(%struct.SHA_INFO* %8)
  br label %17

; <label>:17:                                     ; preds = %16, %11
  br label %45

; <label>:18:                                     ; preds = %3
  br label %19

; <label>:19:                                     ; preds = %43, %18
  %20 = load i32, i32* %4, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, i32* %4, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %44

; <label>:23:                                     ; preds = %19
  %24 = load i8**, i8*** %5, align 8
  %25 = getelementptr inbounds i8*, i8** %24, i32 1
  store i8** %25, i8*** %5, align 8
  %26 = load i8*, i8** %25, align 8
  %27 = call %struct._IO_FILE* @fopen(i8* %26, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %27, %struct._IO_FILE** %7, align 8
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %29 = icmp eq %struct._IO_FILE* %28, null
  br i1 %29, label %30, label %35

; <label>:30:                                     ; preds = %23
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = load i8**, i8*** %5, align 8
  %33 = load i8*, i8** %32, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0), i8* %33)
  call void @exit(i32 1) #3
  unreachable

; <label>:35:                                     ; preds = %23
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  call void @sha_stream(%struct.SHA_INFO* %8, %struct._IO_FILE* %36)
  %37 = load i32, i32* %6, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %40

; <label>:39:                                     ; preds = %35
  call void @sha_print(%struct.SHA_INFO* %8)
  br label %40

; <label>:40:                                     ; preds = %39, %35
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %42 = call i32 @fclose(%struct._IO_FILE* %41)
  br label %43

; <label>:43:                                     ; preds = %40
  br label %19

; <label>:44:                                     ; preds = %19
  br label %45

; <label>:45:                                     ; preds = %44, %17
  ret i32 0
}

declare void @sha_stream(%struct.SHA_INFO*, %struct._IO_FILE*) #1

declare void @sha_print(%struct.SHA_INFO*) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
