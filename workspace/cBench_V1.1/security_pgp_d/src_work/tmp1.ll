; ModuleID = 'mdfile.ll'
source_filename = "mdfile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.MD5Context = type { [4 x i64], [2 x i64], [64 x i8] }

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@pgpout = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [24 x i8] c"\0A\07Can't open file '%s'\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @MDfile0_len(%struct.MD5Context*, %struct._IO_FILE*, i64) #0 {
  %4 = alloca %struct.MD5Context*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca [1024 x i8], align 16
  store %struct.MD5Context* %0, %struct.MD5Context** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i64 %2, i64* %6, align 8
  %9 = load %struct.MD5Context*, %struct.MD5Context** %4, align 8
  call void @MD5Init(%struct.MD5Context* %9)
  br label %10

; <label>:10:                                     ; preds = %35, %3
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %11, 1024
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = load i64, i64* %6, align 8
  %15 = trunc i64 %14 to i32
  store i32 %15, i32* %7, align 4
  br label %17

; <label>:16:                                     ; preds = %10
  store i32 1024, i32* %7, align 4
  br label %17

; <label>:17:                                     ; preds = %16, %13
  %18 = getelementptr inbounds [1024 x i8], [1024 x i8]* %8, i32 0, i32 0
  %19 = load i32, i32* %7, align 4
  %20 = sext i32 %19 to i64
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %22 = call i64 @fread(i8* %18, i64 1, i64 %20, %struct._IO_FILE* %21)
  %23 = trunc i64 %22 to i32
  store i32 %23, i32* %7, align 4
  %24 = load i32, i32* %7, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %26, label %34

; <label>:26:                                     ; preds = %17
  %27 = load %struct.MD5Context*, %struct.MD5Context** %4, align 8
  %28 = getelementptr inbounds [1024 x i8], [1024 x i8]* %8, i32 0, i32 0
  %29 = load i32, i32* %7, align 4
  call void @MD5Update(%struct.MD5Context* %27, i8* %28, i32 %29)
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %32 = load i64, i64* %6, align 8
  %33 = sub i64 %32, %31
  store i64 %33, i64* %6, align 8
  br label %34

; <label>:34:                                     ; preds = %26, %17
  br label %35

; <label>:35:                                     ; preds = %34
  %36 = load i32, i32* %7, align 4
  %37 = icmp eq i32 %36, 1024
  br i1 %37, label %10, label %38

; <label>:38:                                     ; preds = %35
  ret i32 0
}

declare void @MD5Init(%struct.MD5Context*) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare void @MD5Update(%struct.MD5Context*, i8*, i32) #1

; Function Attrs: nounwind uwtable
define i32 @MDfile(%struct.MD5Context*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.MD5Context*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store %struct.MD5Context* %0, %struct.MD5Context** %4, align 8
  store i8* %1, i8** %5, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %2
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %13 = call i8* @LANG(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i32 0, i32 0))
  %14 = load i8*, i8** %5, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* %13, i8* %14)
  store i32 -1, i32* %3, align 4
  br label %22

; <label>:16:                                     ; preds = %2
  %17 = load %struct.MD5Context*, %struct.MD5Context** %4, align 8
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %19 = call i32 @MDfile0(%struct.MD5Context* %17, %struct._IO_FILE* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %21 = call i32 @fclose(%struct._IO_FILE* %20)
  store i32 0, i32* %3, align 4
  br label %22

; <label>:22:                                     ; preds = %16, %11
  %23 = load i32, i32* %3, align 4
  ret i32 %23
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @LANG(i8*) #1

; Function Attrs: nounwind uwtable
define internal i32 @MDfile0(%struct.MD5Context*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.MD5Context*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca [1024 x i8], align 16
  store %struct.MD5Context* %0, %struct.MD5Context** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %7 = load %struct.MD5Context*, %struct.MD5Context** %3, align 8
  call void @MD5Init(%struct.MD5Context* %7)
  br label %8

; <label>:8:                                      ; preds = %14, %2
  %9 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i32 0, i32 0
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %11 = call i64 @fread(i8* %9, i64 1, i64 1024, %struct._IO_FILE* %10)
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %5, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %8
  %15 = load %struct.MD5Context*, %struct.MD5Context** %3, align 8
  %16 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i32 0, i32 0
  %17 = load i32, i32* %5, align 4
  call void @MD5Update(%struct.MD5Context* %15, i8* %16, i32 %17)
  br label %8

; <label>:18:                                     ; preds = %8
  ret i32 0
}

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @MD_addbuffer(%struct.MD5Context*, i8*, i32, i8*) #0 {
  %5 = alloca %struct.MD5Context*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct.MD5Context* %0, %struct.MD5Context** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i8* %3, i8** %8, align 8
  %9 = load %struct.MD5Context*, %struct.MD5Context** %5, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = load i32, i32* %7, align 4
  call void @MD5Update(%struct.MD5Context* %9, i8* %10, i32 %11)
  %12 = load i8*, i8** %8, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %4
  %15 = load i8*, i8** %8, align 8
  %16 = load %struct.MD5Context*, %struct.MD5Context** %5, align 8
  call void @MD5Final(i8* %15, %struct.MD5Context* %16)
  %17 = load %struct.MD5Context*, %struct.MD5Context** %5, align 8
  %18 = bitcast %struct.MD5Context* %17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 112, i32 1, i1 false)
  br label %19

; <label>:19:                                     ; preds = %14, %4
  ret void
}

declare void @MD5Final(i8*, %struct.MD5Context*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
