; ModuleID = 'debug.2.ll'
source_filename = "debug.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"%s [%d .. %d]: \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_debug_words = private constant [15 x i8] c"gsm_debug_words"
@__profn_gsm_debug_longwords = private constant [19 x i8] c"gsm_debug_longwords"
@__profn_gsm_debug_longword = private constant [18 x i8] c"gsm_debug_longword"
@__profn_gsm_debug_word = private constant [14 x i8] c"gsm_debug_word"
@__profc_gsm_debug_words = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_debug_words = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -161446383452641392, i64 54926726210, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32, i16*)* @gsm_debug_words to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_debug_longwords = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_debug_longwords = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6839975050528645555, i64 54926726210, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32, i64*)* @gsm_debug_longwords to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_debug_longword = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_debug_longword = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3836256802681382532, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_debug_longword, i32 0, i32 0), i8* bitcast (void (i8*, i64)* @gsm_debug_longword to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_gsm_debug_word = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_debug_word = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6271627456942564583, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_debug_word, i32 0, i32 0), i8* bitcast (void (i8*, i16)* @gsm_debug_word to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [38 x i8] c"E$x\DAK/\CE\8DOIM*M\8F/\CF/J)fL\87\F3s\F2\F3\D2q\89!\09\81\B8\00\BFo\1Bj", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_debug_words to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_debug_longwords to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_debug_longword to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_debug_word to i8*), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @gsm_debug_words(i8*, i32, i32, i16*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i16* %3, i16** %8, align 8
  store i32 0, i32* %9, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = load i8*, i8** %5, align 8
  %12 = load i32, i32* %6, align 4
  %13 = load i32, i32* %7, align 4
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i8* %11, i32 %12, i32 %13)
  br label %15

; <label>:15:                                     ; preds = %43, %4
  %16 = load i32, i32* %6, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp sle i32 %16, %17
  br i1 %18, label %19, label %45

; <label>:19:                                     ; preds = %15
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = load i16*, i16** %8, align 8
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i16, i16* %21, i64 %23
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %26)
  %28 = load i32, i32* %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %6, align 4
  %30 = load i32, i32* %9, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %9, align 4
  %32 = icmp sge i32 %30, 7
  br i1 %32, label %33, label %43

; <label>:33:                                     ; preds = %19
  store i32 0, i32* %9, align 4
  %34 = load i32, i32* %6, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %41

; <label>:37:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i64 0, i64 2)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i64 0, i64 2)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %39)
  br label %41

; <label>:41:                                     ; preds = %37, %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i64 0, i64 1)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i64 0, i64 1)
  br label %43

; <label>:43:                                     ; preds = %41, %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i64 0, i64 0)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i64 0, i64 0)
  br label %15

; <label>:45:                                     ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i64 0, i64 3)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_words, i64 0, i64 3)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %47)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @gsm_debug_longwords(i8*, i32, i32, i64*) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64*, align 8
  %9 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i64* %3, i64** %8, align 8
  store i32 0, i32* %9, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = load i8*, i8** %5, align 8
  %12 = load i32, i32* %6, align 4
  %13 = load i32, i32* %7, align 4
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i8* %11, i32 %12, i32 %13)
  br label %15

; <label>:15:                                     ; preds = %42, %4
  %16 = load i32, i32* %6, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp sle i32 %16, %17
  br i1 %18, label %19, label %44

; <label>:19:                                     ; preds = %15
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = load i64*, i64** %8, align 8
  %22 = load i32, i32* %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i64, i64* %21, i64 %23
  %25 = load i64, i64* %24, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i64 %25)
  %27 = load i32, i32* %6, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %6, align 4
  %29 = load i32, i32* %9, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %9, align 4
  %31 = icmp sge i32 %29, 7
  br i1 %31, label %32, label %42

; <label>:32:                                     ; preds = %19
  store i32 0, i32* %9, align 4
  %33 = load i32, i32* %6, align 4
  %34 = load i32, i32* %7, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %40

; <label>:36:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i64 0, i64 2)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i64 0, i64 2)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %38)
  br label %40

; <label>:40:                                     ; preds = %36, %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i64 0, i64 1)
  br label %42

; <label>:42:                                     ; preds = %40, %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i64 0, i64 0)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i64 0, i64 0)
  br label %15

; <label>:44:                                     ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i64 0, i64 3)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_debug_longwords, i64 0, i64 3)
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %46)
  ret void
}

; Function Attrs: nounwind uwtable
define void @gsm_debug_longword(i8*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_debug_longword, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_debug_longword, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = load i64, i64* %5, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i8* %7, i64 %8)
  ret void
}

; Function Attrs: nounwind uwtable
define void @gsm_debug_word(i8*, i16 signext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_debug_word, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gsm_debug_word, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i16, align 2
  store i8* %0, i8** %4, align 8
  store i16 %1, i16* %5, align 2
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = load i16, i16* %5, align 2
  %9 = sext i16 %8 to i64
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i8* %7, i64 %9)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
