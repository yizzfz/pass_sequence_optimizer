; ModuleID = 'loop-wrap.ll'
source_filename = "loop-wrap.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %6, align 8
  %9 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %9, %struct._IO_FILE** %6, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %2
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0))
  store i32 1, i32* %3, align 4
  br label %30

; <label>:14:                                     ; preds = %2
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64* %8)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %18 = call i32 @fclose(%struct._IO_FILE* %17)
  store i64 0, i64* %7, align 8
  br label %19

; <label>:19:                                     ; preds = %26, %14
  %20 = load i64, i64* %7, align 8
  %21 = load i64, i64* %8, align 8
  %22 = icmp slt i64 %20, %21
  br i1 %22, label %23, label %29

; <label>:23:                                     ; preds = %19
  %24 = load i32, i32* %4, align 4
  %25 = load i8**, i8*** %5, align 8
  call void @main1(i32 %24, i8** %25)
  br label %26

; <label>:26:                                     ; preds = %23
  %27 = load i64, i64* %7, align 8
  %28 = add nsw i64 %27, 1
  store i64 %28, i64* %7, align 8
  br label %19

; <label>:29:                                     ; preds = %19
  store i32 0, i32* %3, align 4
  br label %30

; <label>:30:                                     ; preds = %29, %11
  %31 = load i32, i32* %3, align 4
  ret i32 %31
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare void @main1(i32, i8**) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
