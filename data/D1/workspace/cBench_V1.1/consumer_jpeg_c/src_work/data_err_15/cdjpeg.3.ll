; ModuleID = 'cdjpeg.2.ll'
source_filename = "cdjpeg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stdin = external global %struct._IO_FILE*, align 8
@stdout = external global %struct._IO_FILE*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_keymatch = private constant [8 x i8] c"keymatch"
@__profn_read_stdin = private constant [10 x i8] c"read_stdin"
@__profn_write_stdout = private constant [12 x i8] c"write_stdout"
@__profc_keymatch = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_keymatch = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9029413214109022396, i64 84790014983, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i32)* @keymatch to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_read_stdin = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_read_stdin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1333711731390187027, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_read_stdin, i32 0, i32 0), i8* bitcast (%struct._IO_FILE* ()* @read_stdin to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_write_stdout = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_write_stdout = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1926648594934994613, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_write_stdout, i32 0, i32 0), i8* bitcast (%struct._IO_FILE* ()* @write_stdout to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [34 x i8] c" \00keymatch\01read_stdin\01write_stdout", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_keymatch to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_stdin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_write_stdout to i8*), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @keymatch(i8*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 0, i32* %10, align 4
  br label %11

; <label>:11:                                     ; preds = %45, %3
  %12 = load i8*, i8** %5, align 8
  %13 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %13, i8** %5, align 8
  %14 = load i8, i8* %12, align 1
  %15 = sext i8 %14 to i32
  store i32 %15, i32* %8, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %49

; <label>:17:                                     ; preds = %11
  %18 = load i8*, i8** %6, align 8
  %19 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %19, i8** %6, align 8
  %20 = load i8, i8* %18, align 1
  %21 = sext i8 %20 to i32
  store i32 %21, i32* %9, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 2)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 2)
  store i32 0, i32* %4, align 4
  br label %57

; <label>:25:                                     ; preds = %17
  %26 = call i16** @__ctype_b_loc() #4
  %27 = load i16*, i16** %26, align 8
  %28 = load i32, i32* %8, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i16, i16* %27, i64 %29
  %31 = load i16, i16* %30, align 2
  %32 = zext i16 %31 to i32
  %33 = and i32 %32, 256
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 1)
  %37 = load i32, i32* %8, align 4
  %38 = call i32 @tolower(i32 %37) #5
  store i32 %38, i32* %8, align 4
  br label %39

; <label>:39:                                     ; preds = %35, %25
  %40 = load i32, i32* %8, align 4
  %41 = load i32, i32* %9, align 4
  %42 = icmp ne i32 %40, %41
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 3)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 3)
  store i32 0, i32* %4, align 4
  br label %57

; <label>:45:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 0)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 0)
  %47 = load i32, i32* %10, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %10, align 4
  br label %11

; <label>:49:                                     ; preds = %11
  %50 = load i32, i32* %10, align 4
  %51 = load i32, i32* %7, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 4)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 4)
  store i32 0, i32* %4, align 4
  br label %57

; <label>:55:                                     ; preds = %49
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 5)
  %56 = add i64 %pgocount5, 1
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_keymatch, i64 0, i64 5)
  store i32 1, i32* %4, align 4
  br label %57

; <label>:57:                                     ; preds = %55, %53, %43, %23
  %58 = load i32, i32* %4, align 4
  ret i32 %58
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #2

; Function Attrs: noinline nounwind uwtable
define %struct._IO_FILE* @read_stdin() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_read_stdin, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_read_stdin, i64 0, i64 0)
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** %2, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  ret %struct._IO_FILE* %4
}

; Function Attrs: noinline nounwind uwtable
define %struct._IO_FILE* @write_stdout() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_write_stdout, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_write_stdout, i64 0, i64 0)
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %3, %struct._IO_FILE** %2, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  ret %struct._IO_FILE* %4
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
