; ModuleID = 'tmp1.ll'
source_filename = "zfile_io.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@FillInBuf.eofonce = internal global i32 0, align 4
@zipfd = external global i32, align 4
@inbuf = external global i8*, align 8
@incnt = external global i32, align 4
@inptr = external global i8*, align 8
@outcnt = external global i32, align 4
@outfd = external global i32, align 4
@outout = external global i8*, align 8
@outpos = external global i64, align 8
@outbuf = external global i8*, align 8
@outptr = external global i8*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_FillInBuf = private constant [9 x i8] c"FillInBuf"
@__profn_FlushOutput = private constant [11 x i8] c"FlushOutput"
@__profc_FillInBuf = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_FillInBuf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9000248986250795631, i64 51190456801, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i32 0, i32 0), i8* bitcast (i32 ()* @FillInBuf to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_FlushOutput = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_FlushOutput = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -644289355763720186, i64 40073891988, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_FlushOutput, i32 0, i32 0), i8* bitcast (i32 ()* @FlushOutput to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [23 x i8] c"\15\00FillInBuf\01FlushOutput", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_FillInBuf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_FlushOutput to i8*), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @FillInBuf() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @zipfd, align 4
  %3 = load i8*, i8** @inbuf, align 8
  %4 = call i64 @read(i32 %2, i8* %3, i64 8192)
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* @incnt, align 4
  %6 = load i32, i32* @incnt, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i64 0, i64 0)
  %10 = load i8*, i8** @inbuf, align 8
  store i8* %10, i8** @inptr, align 8
  %11 = load i32, i32* @incnt, align 4
  %12 = add nsw i32 %11, -1
  store i32 %12, i32* @incnt, align 4
  store i32 0, i32* %1, align 4
  br label %27

; <label>:13:                                     ; preds = %0
  %14 = load i32, i32* @incnt, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %25

; <label>:16:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i64 0, i64 2)
  %18 = load i32, i32* @FillInBuf.eofonce, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %25, label %20

; <label>:20:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i64 0, i64 3)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i64 0, i64 3)
  %22 = load i32, i32* @FillInBuf.eofonce, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* @FillInBuf.eofonce, align 4
  store i32 2, i32* @incnt, align 4
  %24 = load i8*, i8** @inbuf, align 8
  store i8* %24, i8** @inptr, align 8
  store i32 0, i32* %1, align 4
  br label %27

; <label>:25:                                     ; preds = %16, %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i64 0, i64 1)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_FillInBuf, i64 0, i64 1)
  store i32 1, i32* %1, align 4
  br label %27

; <label>:27:                                     ; preds = %25, %20, %8
  %28 = load i32, i32* %1, align 4
  ret i32 %28
}

declare i64 @read(i32, i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @FlushOutput() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* @outcnt, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %24

; <label>:5:                                      ; preds = %0
  %6 = load i32, i32* @outcnt, align 4
  store i32 %6, i32* %2, align 4
  %7 = load i32, i32* @outfd, align 4
  %8 = load i8*, i8** @outout, align 8
  %9 = load i32, i32* %2, align 4
  %10 = sext i32 %9 to i64
  %11 = call i64 @write(i32 %7, i8* %8, i64 %10)
  %12 = load i32, i32* %2, align 4
  %13 = sext i32 %12 to i64
  %14 = icmp ne i64 %11, %13
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_FlushOutput, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_FlushOutput, i64 0, i64 1)
  store i32 50, i32* %1, align 4
  br label %26

; <label>:17:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_FlushOutput, i64 0, i64 2)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_FlushOutput, i64 0, i64 2)
  %19 = load i32, i32* @outcnt, align 4
  %20 = sext i32 %19 to i64
  %21 = load i64, i64* @outpos, align 8
  %22 = add nsw i64 %21, %20
  store i64 %22, i64* @outpos, align 8
  store i32 0, i32* @outcnt, align 4
  %23 = load i8*, i8** @outbuf, align 8
  store i8* %23, i8** @outptr, align 8
  br label %24

; <label>:24:                                     ; preds = %17, %0
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_FlushOutput, i64 0, i64 0)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_FlushOutput, i64 0, i64 0)
  store i32 0, i32* %1, align 4
  br label %26

; <label>:26:                                     ; preds = %24, %15
  %27 = load i32, i32* %1, align 4
  ret i32 %27
}

declare i64 @write(i32, i8*, i64) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
