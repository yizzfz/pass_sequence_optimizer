; ModuleID = 'linuxplay.2.ll'
source_filename = "linuxplay.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

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
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_audio_init = private constant [10 x i8] c"audio_init"
@__profn_tmp1.ll_audio_open = private constant [18 x i8] c"tmp1.ll:audio_open"
@__profn_audio_term = private constant [10 x i8] c"audio_term"
@__profn_audio_play = private constant [10 x i8] c"audio_play"
@__profc_audio_init = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4932233829781214254, i64 66895255965, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @audio_init to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_audio_open = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_audio_open = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7042694985559008244, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_audio_open, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_term = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_term = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1453401662938965388, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_audio_term, i32 0, i32 0), i8* bitcast (void ()* @audio_term to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_audio_play = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_audio_play = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8826959486273796182, i64 107581790051, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i32 0, i32 0), i8* bitcast (void (i32, i16*)* @audio_play to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [53 x i8] c"3\00audio_init\01tmp1.ll:audio_open\01audio_term\01audio_play", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_audio_open to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_term to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_audio_play to i8*), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
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
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 0)
  %18 = load i32, i32* %4, align 4
  store i32 %18, i32* %3, align 4
  br label %44

; <label>:19:                                     ; preds = %2
  %20 = load i32, i32* %7, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %25

; <label>:22:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 2)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 2)
  %24 = call i32 @audio_open()
  br label %25

; <label>:25:                                     ; preds = %22, %19
  %26 = load i32, i32* %6, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 3)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 3)
  %30 = load i32, i32* %6, align 4
  %31 = sext i32 %30 to i64
  store i64 %31, i64* @samp_rate, align 8
  br label %32

; <label>:32:                                     ; preds = %28, %25
  %33 = load i32, i32* @dev_fd, align 4
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %41

; <label>:35:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 4)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 4)
  %37 = load i32, i32* @dev_fd, align 4
  %38 = call i32 (i32, i64, ...) @ioctl(i32 %37, i64 3221508098, i64* @samp_rate) #4
  %39 = load i64, i64* @samp_rate, align 8
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i32 0, i32 0), i64 %39)
  br label %41

; <label>:41:                                     ; preds = %35, %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 1)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_audio_init, i64 0, i64 1)
  %43 = load i32, i32* %4, align 4
  store i32 %43, i32* %3, align 4
  br label %44

; <label>:44:                                     ; preds = %41, %16
  %45 = load i32, i32* %3, align 4
  ret i32 %45
}

declare i32 @getargs(i8*, i32, i8**, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @audio_open() #0 {
  %1 = alloca i32, align 4
  %2 = load i8*, i8** @dev_file, align 8
  %3 = call i32 (i8*, i32, ...) @open(i8* %2, i32 2049)
  store i32 %3, i32* @dev_fd, align 4
  %4 = load i32, i32* @dev_fd, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_audio_open, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_audio_open, i64 0, i64 1)
  %8 = load i8*, i8** @dev_file, align 8
  call void @perror(i8* %8)
  store i32 0, i32* %1, align 4
  br label %11

; <label>:9:                                      ; preds = %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_audio_open, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_audio_open, i64 0, i64 0)
  store i32 1, i32* %1, align 4
  br label %11

; <label>:11:                                     ; preds = %9, %6
  %12 = load i32, i32* %1, align 4
  ret i32 %12
}

; Function Attrs: nounwind
declare i32 @ioctl(i32, i64, ...) #2

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define void @audio_term() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @dev_fd, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %10

; <label>:4:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_audio_term, i64 0, i64 1)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_audio_term, i64 0, i64 1)
  %6 = load i32, i32* @dev_fd, align 4
  %7 = call i32 (i32, i64, ...) @ioctl(i32 %6, i64 20481, i32* %1) #4
  %8 = load i32, i32* @dev_fd, align 4
  %9 = call i32 @close(i32 %8)
  store i32 -1, i32* @dev_fd, align 4
  br label %10

; <label>:10:                                     ; preds = %4, %0
  %11 = load i32, i32* @linear_fd, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %21

; <label>:13:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_audio_term, i64 0, i64 2)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_audio_term, i64 0, i64 2)
  %15 = load i32, i32* @linear_fd, align 4
  %16 = load i32, i32* @linear_fd, align 4
  %17 = call i64 @lseek(i32 %16, i64 0, i32 1) #4
  %18 = call i32 @ftruncate(i32 %15, i64 %17) #4
  %19 = load i32, i32* @linear_fd, align 4
  %20 = call i32 @close(i32 %19)
  store i32 -1, i32* @linear_fd, align 4
  br label %21

; <label>:21:                                     ; preds = %13, %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_audio_term, i64 0, i64 0)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_audio_term, i64 0, i64 0)
  ret void
}

declare i32 @close(i32) #1

; Function Attrs: nounwind
declare i32 @ftruncate(i32, i64) #2

; Function Attrs: nounwind
declare i64 @lseek(i32, i64, i32) #2

; Function Attrs: noinline nounwind uwtable
define void @audio_play(i32, i16*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i16*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i16* %1, i16** %4, align 8
  %7 = load i32, i32* %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %77

; <label>:9:                                      ; preds = %2
  %10 = load i32, i32* %3, align 4
  %11 = sext i32 %10 to i64
  %12 = call noalias i8* @malloc(i64 %11) #4
  store i8* %12, i8** %5, align 8
  %13 = load i8*, i8** %5, align 8
  %14 = icmp eq i8* %13, null
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 7)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 7)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.9, i32 0, i32 0))
  call void @exit(i32 3) #5
  unreachable

; <label>:19:                                     ; preds = %9
  store i32 0, i32* %6, align 4
  br label %20

; <label>:20:                                     ; preds = %38, %19
  %21 = load i32, i32* %6, align 4
  %22 = load i32, i32* %3, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %42

; <label>:24:                                     ; preds = %20
  %25 = load i16*, i16** %4, align 8
  %26 = load i32, i32* %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i16, i16* %25, i64 %27
  %29 = load i16, i16* %28, align 2
  %30 = sext i16 %29 to i32
  %31 = sub nsw i32 %30, 32768
  %32 = sdiv i32 %31, 256
  %33 = trunc i32 %32 to i8
  %34 = load i8*, i8** %5, align 8
  %35 = load i32, i32* %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %34, i64 %36
  store i8 %33, i8* %37, align 1
  br label %38

; <label>:38:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 0)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 0)
  %40 = load i32, i32* %6, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %6, align 4
  br label %20

; <label>:42:                                     ; preds = %20
  %43 = load i32, i32* @linear_fd, align 4
  %44 = icmp sge i32 %43, 0
  br i1 %44, label %45, label %58

; <label>:45:                                     ; preds = %42
  %46 = load i32, i32* @linear_fd, align 4
  %47 = load i8*, i8** %5, align 8
  %48 = load i32, i32* %3, align 4
  %49 = sext i32 %48 to i64
  %50 = call i64 @write(i32 %46, i8* %47, i64 %49)
  %51 = load i32, i32* %3, align 4
  %52 = sext i32 %51 to i64
  %53 = icmp ne i64 %50, %52
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 5)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 5)
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0))
  br label %56

; <label>:56:                                     ; preds = %54, %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 3)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 3)
  br label %58

; <label>:58:                                     ; preds = %56, %42
  %59 = load i32, i32* @dev_fd, align 4
  %60 = icmp sge i32 %59, 0
  br i1 %60, label %61, label %74

; <label>:61:                                     ; preds = %58
  %62 = load i32, i32* @dev_fd, align 4
  %63 = load i8*, i8** %5, align 8
  %64 = load i32, i32* %3, align 4
  %65 = sext i32 %64 to i64
  %66 = call i64 @write(i32 %62, i8* %63, i64 %65)
  %67 = load i32, i32* %3, align 4
  %68 = sext i32 %67 to i64
  %69 = icmp ne i64 %66, %68
  br i1 %69, label %70, label %72

; <label>:70:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 6)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 6)
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0))
  br label %72

; <label>:72:                                     ; preds = %70, %61
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 4)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 4)
  br label %74

; <label>:74:                                     ; preds = %72, %58
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 2)
  %75 = add i64 %pgocount6, 1
  store i64 %75, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 2)
  %76 = load i8*, i8** %5, align 8
  call void @free(i8* %76) #4
  br label %77

; <label>:77:                                     ; preds = %74, %2
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 1)
  %78 = add i64 %pgocount7, 1
  store i64 %78, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_audio_play, i64 0, i64 1)
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

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
