; ModuleID = 'toast_audio.2.ll'
source_filename = "toast_audio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

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
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_audio_init_input = private constant [16 x i8] c"audio_init_input"
@__profn_tmp1.ll_get_u32 = private constant [15 x i8] c"tmp1.ll:get_u32"
@__profn_audio_init_output = private constant [17 x i8] c"audio_init_output"
@__profn_tmp1.ll_put_u32 = private constant [15 x i8] c"tmp1.ll:put_u32"
@__profc_audio_init_input = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_init_input = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9104222573446787908, i64 137713325214, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i32 0, i32 0), i8* bitcast (i32 ()* @audio_init_input to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_get_u32 = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_get_u32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3018037423752617996, i64 54830550829, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_init_output = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_init_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4819429574254577593, i64 85962641568, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i32 0, i32 0), i8* bitcast (i32 ()* @audio_init_output to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_u32 = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_u32 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3939318982441997162, i64 54830550829, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [53 x i8] c"B3x\DAK,M\C9\CC\8F\CF\CC\CB,\01\12\05\A5%\8C%\B9\05\86z99V\E9\A9%\F1\A5\C6F\8C\89\08\05\F9\A5%\C8*\80l\90\0A\00DJ\18|", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_init_input to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_get_u32 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_init_output to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_u32 to i8*), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @audio_init_input() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %5 = call i32 @fgetc(%struct._IO_FILE* %4)
  %6 = icmp ne i32 %5, 46
  br i1 %6, label %44, label %7

; <label>:7:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 1)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %10 = call i32 @fgetc(%struct._IO_FILE* %9)
  %11 = icmp ne i32 %10, 115
  br i1 %11, label %44, label %12

; <label>:12:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 3)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 3)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %15 = call i32 @fgetc(%struct._IO_FILE* %14)
  %16 = icmp ne i32 %15, 110
  br i1 %16, label %44, label %17

; <label>:17:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 4)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 4)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %20 = call i32 @fgetc(%struct._IO_FILE* %19)
  %21 = icmp ne i32 %20, 100
  br i1 %21, label %44, label %22

; <label>:22:                                     ; preds = %17
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 5)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 5)
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %25 = call i32 @get_u32(%struct._IO_FILE* %24, i64* %2)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %44, label %27

; <label>:27:                                     ; preds = %22
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 6)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 6)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %30 = call i32 @get_u32(%struct._IO_FILE* %29, i64* %3)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %44, label %32

; <label>:32:                                     ; preds = %27
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 7)
  %33 = add i64 %pgocount5, 1
  store i64 %33, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 7)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %35 = call i32 @get_u32(%struct._IO_FILE* %34, i64* %3)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %44, label %37

; <label>:37:                                     ; preds = %32
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 8)
  %38 = add i64 %pgocount6, 1
  store i64 %38, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 8)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %40 = load i64, i64* %2, align 8
  %41 = sub i64 %40, 16
  %42 = call i32 @fseek(%struct._IO_FILE* %39, i64 %41, i32 1)
  %43 = icmp slt i32 %42, 0
  br i1 %43, label %44, label %58

; <label>:44:                                     ; preds = %37, %32, %27, %22, %17, %12, %7, %0
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = load i8*, i8** @progname, align 8
  %47 = load i8*, i8** @inname, align 8
  %48 = icmp ne i8* %47, null
  br i1 %48, label %49, label %52

; <label>:49:                                     ; preds = %44
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 0)
  %50 = add i64 %pgocount7, 1
  store i64 %50, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 0)
  %51 = load i8*, i8** @inname, align 8
  br label %54

; <label>:52:                                     ; preds = %44
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 2)
  %53 = add i64 %pgocount8, 1
  store i64 %53, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 2)
  br label %54

; <label>:54:                                     ; preds = %52, %49
  %55 = phi i8* [ %51, %49 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), %52 ]
  %56 = load i8*, i8** @progname, align 8
  %57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str, i32 0, i32 0), i8* %46, i8* %55, i8* %56)
  store i32 -1, i32* %1, align 4
  br label %74

; <label>:58:                                     ; preds = %37
  %59 = load i64, i64* %3, align 8
  switch i64 %59, label %66 [
    i64 1, label %60
    i64 2, label %62
    i64 3, label %64
  ]

; <label>:60:                                     ; preds = %58
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 9)
  %61 = add i64 %pgocount9, 1
  store i64 %61, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 9)
  store i32 (i16*)* @ulaw_input, i32 (i16*)** @input, align 8
  br label %73

; <label>:62:                                     ; preds = %58
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 10)
  %63 = add i64 %pgocount10, 1
  store i64 %63, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 10)
  store i32 (i16*)* @alaw_input, i32 (i16*)** @input, align 8
  br label %73

; <label>:64:                                     ; preds = %58
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 11)
  %65 = add i64 %pgocount11, 1
  store i64 %65, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 11)
  store i32 (i16*)* @linear_input, i32 (i16*)** @input, align 8
  br label %73

; <label>:66:                                     ; preds = %58
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 12)
  %67 = add i64 %pgocount12, 1
  store i64 %67, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_audio_init_input, i64 0, i64 12)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %69 = load i8*, i8** @progname, align 8
  %70 = load i64, i64* %3, align 8
  %71 = load i8*, i8** @inname, align 8
  %72 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.2, i32 0, i32 0), i8* %69, i64 %70, i8* %71)
  store i32 (i16*)* @ulaw_input, i32 (i16*)** @input, align 8
  br label %73

; <label>:73:                                     ; preds = %66, %64, %62, %60
  store i32 0, i32* %1, align 4
  br label %74

; <label>:74:                                     ; preds = %73, %54
  %75 = load i32, i32* %1, align 4
  ret i32 %75
}

declare i32 @fgetc(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
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
  br i1 %10, label %41, label %11

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 1)
  %13 = load i32, i32* %6, align 4
  %14 = trunc i32 %13 to i8
  %15 = zext i8 %14 to i64
  store i64 %15, i64* %7, align 8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %17 = call i32 @_IO_getc(%struct._IO_FILE* %16)
  store i32 %17, i32* %6, align 4
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %41, label %19

; <label>:19:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 2)
  %21 = load i64, i64* %7, align 8
  %22 = shl i64 %21, 8
  %23 = load i32, i32* %6, align 4
  %24 = trunc i32 %23 to i8
  %25 = zext i8 %24 to i64
  %26 = or i64 %22, %25
  store i64 %26, i64* %7, align 8
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %28 = call i32 @_IO_getc(%struct._IO_FILE* %27)
  store i32 %28, i32* %6, align 4
  %29 = icmp eq i32 %28, -1
  br i1 %29, label %41, label %30

; <label>:30:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 3)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 3)
  %32 = load i64, i64* %7, align 8
  %33 = shl i64 %32, 8
  %34 = load i32, i32* %6, align 4
  %35 = trunc i32 %34 to i8
  %36 = zext i8 %35 to i64
  %37 = or i64 %33, %36
  store i64 %37, i64* %7, align 8
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %39 = call i32 @_IO_getc(%struct._IO_FILE* %38)
  store i32 %39, i32* %6, align 4
  %40 = icmp eq i32 %39, -1
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %30, %19, %11, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 0)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %52

; <label>:43:                                     ; preds = %30
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 4)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_get_u32, i64 0, i64 4)
  %45 = load i64, i64* %7, align 8
  %46 = shl i64 %45, 8
  %47 = load i32, i32* %6, align 4
  %48 = trunc i32 %47 to i8
  %49 = zext i8 %48 to i64
  %50 = or i64 %46, %49
  %51 = load i64*, i64** %5, align 8
  store i64 %50, i64* %51, align 8
  store i32 0, i32* %3, align 4
  br label %52

; <label>:52:                                     ; preds = %43, %41
  %53 = load i32, i32* %3, align 4
  ret i32 %53
}

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @ulaw_input(i16*) #1

declare i32 @alaw_input(i16*) #1

declare i32 @linear_input(i16*) #1

; Function Attrs: nounwind uwtable
define i32 @audio_init_output() #0 {
  %1 = alloca i32, align 4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %3 = call i32 @fputs(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), %struct._IO_FILE* %2)
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %40, label %5

; <label>:5:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 1)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %8 = call i32 @put_u32(%struct._IO_FILE* %7, i64 32)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %40, label %10

; <label>:10:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 2)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 2)
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %13 = call i32 @put_u32(%struct._IO_FILE* %12, i64 -1)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %40, label %15

; <label>:15:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 3)
  %16 = add i64 %pgocount2, 1
  store i64 %16, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 3)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %18 = call i32 @put_u32(%struct._IO_FILE* %17, i64 1)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %40, label %20

; <label>:20:                                     ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 4)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 4)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %23 = call i32 @put_u32(%struct._IO_FILE* %22, i64 8000)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %40, label %25

; <label>:25:                                     ; preds = %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 5)
  %26 = add i64 %pgocount4, 1
  store i64 %26, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 5)
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %28 = call i32 @put_u32(%struct._IO_FILE* %27, i64 1)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %40, label %30

; <label>:30:                                     ; preds = %25
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 6)
  %31 = add i64 %pgocount5, 1
  store i64 %31, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 6)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %33 = call i32 @put_u32(%struct._IO_FILE* %32, i64 0)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %40, label %35

; <label>:35:                                     ; preds = %30
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 7)
  %36 = add i64 %pgocount6, 1
  store i64 %36, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 7)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %38 = call i32 @put_u32(%struct._IO_FILE* %37, i64 0)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %35, %30, %25, %20, %15, %10, %5, %0
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 0)
  %41 = add i64 %pgocount7, 1
  store i64 %41, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 0)
  store i32 -1, i32* %1, align 4
  br label %44

; <label>:42:                                     ; preds = %35
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 8)
  %43 = add i64 %pgocount8, 1
  store i64 %43, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_audio_init_output, i64 0, i64 8)
  store i32 0, i32* %1, align 4
  br label %44

; <label>:44:                                     ; preds = %42, %40
  %45 = load i32, i32* %1, align 4
  ret i32 %45
}

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
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
  br i1 %13, label %43, label %14

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 1)
  %16 = load i64, i64* %5, align 8
  %17 = lshr i64 %16, 16
  %18 = and i64 %17, 255
  %19 = trunc i64 %18 to i8
  %20 = sext i8 %19 to i32
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %22 = call i32 @_IO_putc(i32 %20, %struct._IO_FILE* %21)
  %23 = icmp eq i32 %22, -1
  br i1 %23, label %43, label %24

; <label>:24:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 2)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 2)
  %26 = load i64, i64* %5, align 8
  %27 = lshr i64 %26, 8
  %28 = and i64 %27, 255
  %29 = trunc i64 %28 to i8
  %30 = sext i8 %29 to i32
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %32 = call i32 @_IO_putc(i32 %30, %struct._IO_FILE* %31)
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %43, label %34

; <label>:34:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 3)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 3)
  %36 = load i64, i64* %5, align 8
  %37 = and i64 %36, 255
  %38 = trunc i64 %37 to i8
  %39 = sext i8 %38 to i32
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %41 = call i32 @_IO_putc(i32 %39, %struct._IO_FILE* %40)
  %42 = icmp eq i32 %41, -1
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %34, %24, %14, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 0)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 0)
  store i32 -1, i32* %3, align 4
  br label %47

; <label>:45:                                     ; preds = %34
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 4)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_put_u32, i64 0, i64 4)
  store i32 0, i32* %3, align 4
  br label %47

; <label>:47:                                     ; preds = %45, %43
  %48 = load i32, i32* %3, align 4
  ret i32 %48
}

declare i32 @_IO_getc(%struct._IO_FILE*) #1

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
