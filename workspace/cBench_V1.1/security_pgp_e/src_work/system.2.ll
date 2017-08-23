; ModuleID = 'tmp1.ll'
source_filename = "system.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct.rusage = type { %struct.timeval, %struct.timeval, %union.anon, %union.anon.0, %union.anon.1, %union.anon.2, %union.anon.3, %union.anon.4, %union.anon.5, %union.anon.6, %union.anon.7, %union.anon.8, %union.anon.9, %union.anon.10, %union.anon.11, %union.anon.12 }
%struct.timeval = type { i64, i64 }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%union.anon.1 = type { i64 }
%union.anon.2 = type { i64 }
%union.anon.3 = type { i64 }
%union.anon.4 = type { i64 }
%union.anon.5 = type { i64 }
%union.anon.6 = type { i64 }
%union.anon.7 = type { i64 }
%union.anon.8 = type { i64 }
%union.anon.9 = type { i64 }
%union.anon.10 = type { i64 }
%union.anon.11 = type { i64 }
%union.anon.12 = type { i64 }

$__llvm_profile_raw_version = comdat any

@ttyfd = internal global i32 -1, align 4
@.str = private unnamed_addr constant [9 x i8] c"/dev/tty\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [30 x i8] c"cannot open tty, using stdin\0A\00", align 1
@tio = internal global %struct.termios zeroinitializer, align 4
@.str.2 = private unnamed_addr constant [42 x i8] c"\0AUnable to get terminal characteristics: \00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"ioctl\00", align 1
@itio = internal global %struct.termios zeroinitializer, align 4
@gottio = internal global i32 0, align 4
@savesig = internal global void (i32)* null, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_ttycbreak = private constant [9 x i8] c"ttycbreak"
@__profn_tmp1.ll_setsigs = private constant [15 x i8] c"tmp1.ll:setsigs"
@__profn_ttynorm = private constant [7 x i8] c"ttynorm"
@__profn_tmp1.ll_rmsigs = private constant [14 x i8] c"tmp1.ll:rmsigs"
@__profn_getch = private constant [5 x i8] c"getch"
@__profn_Clock = private constant [5 x i8] c"Clock"
@__profn_strlwr = private constant [6 x i8] c"strlwr"
@__profn_tmp1.ll_sig1 = private constant [12 x i8] c"tmp1.ll:sig1"
@__profn_tmp1.ll_sig2 = private constant [12 x i8] c"tmp1.ll:sig2"
@__profc_ttycbreak = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ttycbreak = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 834923633165583219, i64 48207172959, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i32 0, i32 0), i8* bitcast (void ()* @ttycbreak to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_setsigs = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_setsigs = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5961893520530330497, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setsigs, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ttynorm = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ttynorm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3876609797928430515, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ttynorm, i32 0, i32 0), i8* bitcast (void ()* @ttynorm to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_rmsigs = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_rmsigs = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2425236094143708924, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_rmsigs, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_getch = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getch = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2700244209204774783, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getch, i32 0, i32 0), i8* bitcast (i32 ()* @getch to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Clock = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Clock = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9109597169138882408, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Clock, i32 0, i32 0), i8* bitcast (i64 ()* @Clock to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_strlwr = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_strlwr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7971358862632839704, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_strlwr, i32 0, i32 0), i8* bitcast (i8* (i8*)* @strlwr to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_sig1 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_sig1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4246843456088652980, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig1, i32 0, i32 0), i8* bitcast (void (i32)* @sig1 to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_sig2 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_sig2 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7115542068272274569, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig2, i32 0, i32 0), i8* bitcast (void (i32)* @sig2 to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [74 x i8] c"]Hx\DA+)\A9LN*JM\CCf,\C9-0\D4\CB\C9\B1*N-)\CEL/f,)\A9\CC\CB/\CA\85\8B\17\E5\82\85\D3SK\923\18\9Ds\F2\93\B3\19\8BK\8Ar\CA\8B\10:3\D3\0D\919F\00?\D2!\1C", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ttycbreak to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_setsigs to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ttynorm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_rmsigs to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getch to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Clock to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_strlwr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sig1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sig2 to i8*), i8* getelementptr inbounds ([74 x i8], [74 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @ttycbreak() #0 {
  %1 = load i32, i32* @ttyfd, align 4
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %3, label %12

; <label>:3:                                      ; preds = %0
  %4 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 2)
  store i32 %4, i32* @ttyfd, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %10

; <label>:6:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i64 0, i64 3)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i64 0, i64 3)
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0))
  store i32 0, i32* @ttyfd, align 4
  br label %10

; <label>:10:                                     ; preds = %6, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i64 0, i64 1)
  br label %12

; <label>:12:                                     ; preds = %10, %0
  %13 = load i32, i32* @ttyfd, align 4
  %14 = call i32 @tcgetattr(i32 %13, %struct.termios* @tio) #4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %20

; <label>:16:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i64 0, i64 2)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i64 0, i64 2)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i32 0, i32 0))
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  call void @exitPGP(i32 1)
  br label %20

; <label>:20:                                     ; preds = %16, %12
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i64 0, i64 0)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_ttycbreak, i64 0, i64 0)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.termios* @itio to i8*), i8* bitcast (%struct.termios* @tio to i8*), i64 60, i32 4, i1 false)
  call void @setsigs()
  store i32 1, i32* @gottio, align 4
  store i8 1, i8* getelementptr inbounds (%struct.termios, %struct.termios* @tio, i32 0, i32 5, i64 6), align 1
  store i8 0, i8* getelementptr inbounds (%struct.termios, %struct.termios* @tio, i32 0, i32 5, i64 5), align 1
  %22 = load i32, i32* getelementptr inbounds (%struct.termios, %struct.termios* @tio, i32 0, i32 3), align 4
  %23 = and i32 %22, -11
  store i32 %23, i32* getelementptr inbounds (%struct.termios, %struct.termios* @tio, i32 0, i32 3), align 4
  %24 = load i32, i32* @ttyfd, align 4
  %25 = call i32 @tcsetattr(i32 %24, i32 2, %struct.termios* @tio) #4
  ret void
}

declare i32 @open(i8*, i32, ...) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i32 @tcgetattr(i32, %struct.termios*) #2

declare void @perror(i8*) #1

declare void @exitPGP(i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal void @setsigs() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setsigs, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_setsigs, i64 0, i64 0)
  %2 = call void (i32)* @signal(i32 2, void (i32)* @sig1) #4
  store void (i32)* %2, void (i32)** @savesig, align 8
  %3 = call void (i32)* @signal(i32 18, void (i32)* @sig2) #4
  %4 = call void (i32)* @signal(i32 20, void (i32)* @sig1) #4
  ret void
}

; Function Attrs: nounwind
declare i32 @tcsetattr(i32, i32, %struct.termios*) #2

; Function Attrs: nounwind uwtable
define void @ttynorm() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ttynorm, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ttynorm, i64 0, i64 0)
  store i32 0, i32* @gottio, align 4
  %2 = load i32, i32* @ttyfd, align 4
  %3 = call i32 @tcsetattr(i32 %2, i32 2, %struct.termios* @itio) #4
  call void @rmsigs()
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @rmsigs() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_rmsigs, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_rmsigs, i64 0, i64 0)
  %2 = load void (i32)*, void (i32)** @savesig, align 8
  %3 = call void (i32)* @signal(i32 2, void (i32)* %2) #4
  %4 = call void (i32)* @signal(i32 18, void (i32)* null) #4
  %5 = call void (i32)* @signal(i32 20, void (i32)* null) #4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @getch() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getch, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getch, i64 0, i64 0)
  %2 = alloca i8, align 1
  store i8 0, i8* %2, align 1
  %3 = load i32, i32* @ttyfd, align 4
  %4 = call i64 @read(i32 %3, i8* %2, i64 1)
  %5 = load i8, i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = and i32 %6, 255
  ret i32 %7
}

declare i64 @read(i32, i8*, i64) #1

; Function Attrs: nounwind uwtable
define i64 @Clock() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Clock, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_Clock, i64 0, i64 0)
  %2 = alloca %struct.rusage, align 8
  %3 = call i32 @getrusage(i32 0, %struct.rusage* %2) #4
  %4 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 0
  %5 = getelementptr inbounds %struct.timeval, %struct.timeval* %4, i32 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 0
  %8 = getelementptr inbounds %struct.timeval, %struct.timeval* %7, i32 0, i32 1
  %9 = load i64, i64* %8, align 8
  %10 = add nsw i64 %6, %9
  %11 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 1
  %12 = getelementptr inbounds %struct.timeval, %struct.timeval* %11, i32 0, i32 0
  %13 = load i64, i64* %12, align 8
  %14 = add nsw i64 %10, %13
  %15 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 1
  %16 = getelementptr inbounds %struct.timeval, %struct.timeval* %15, i32 0, i32 1
  %17 = load i64, i64* %16, align 8
  %18 = add nsw i64 %14, %17
  %19 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 6
  %20 = bitcast %union.anon.3* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = add nsw i64 %18, %21
  %23 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 7
  %24 = bitcast %union.anon.4* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = add nsw i64 %22, %25
  %27 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 9
  %28 = bitcast %union.anon.6* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = add nsw i64 %26, %29
  %31 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 10
  %32 = bitcast %union.anon.7* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = add nsw i64 %30, %33
  %35 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 2
  %36 = bitcast %union.anon* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = add nsw i64 %34, %37
  %39 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 14
  %40 = bitcast %union.anon.11* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = add nsw i64 %38, %41
  %43 = getelementptr inbounds %struct.rusage, %struct.rusage* %2, i32 0, i32 15
  %44 = bitcast %union.anon.12* %43 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = add nsw i64 %42, %45
  ret i64 %46
}

; Function Attrs: nounwind
declare i32 @getrusage(i32, %struct.rusage*) #2

; Function Attrs: nounwind uwtable
define i8* @strlwr(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  store i8* %5, i8** %4, align 8
  br label %6

; <label>:6:                                      ; preds = %11, %1
  %7 = load i8*, i8** %4, align 8
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  store i32 %9, i32* %3, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %18

; <label>:11:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_strlwr, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_strlwr, i64 0, i64 0)
  %13 = load i32, i32* %3, align 4
  %14 = call i32 @to_lower(i32 %13)
  %15 = trunc i32 %14 to i8
  %16 = load i8*, i8** %4, align 8
  %17 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %17, i8** %4, align 8
  store i8 %15, i8* %16, align 1
  br label %6

; <label>:18:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_strlwr, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_strlwr, i64 0, i64 1)
  %20 = load i8*, i8** %2, align 8
  ret i8* %20
}

declare i32 @to_lower(i32) #1

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) #2

; Function Attrs: nounwind uwtable
define internal void @sig1(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* @ttyfd, align 4
  %4 = call i32 @tcsetattr(i32 %3, i32 0, %struct.termios* @itio) #4
  %5 = load i32, i32* %2, align 4
  %6 = call void (i32)* @signal(i32 %5, void (i32)* null) #4
  %7 = load i32, i32* %2, align 4
  %8 = icmp eq i32 %7, 2
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig1, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig1, i64 0, i64 1)
  call void @breakHandler(i32 2)
  br label %11

; <label>:11:                                     ; preds = %9, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig1, i64 0, i64 0)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig1, i64 0, i64 0)
  %13 = call i32 @getpid() #4
  %14 = load i32, i32* %2, align 4
  %15 = call i32 @kill(i32 %13, i32 %14) #4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @sig2(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* @gottio, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig2, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig2, i64 0, i64 0)
  call void @ttycbreak()
  br label %9

; <label>:7:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig2, i64 0, i64 1)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sig2, i64 0, i64 1)
  call void @setsigs()
  br label %9

; <label>:9:                                      ; preds = %7, %5
  ret void
}

declare void @breakHandler(i32) #1

; Function Attrs: nounwind
declare i32 @kill(i32, i32) #2

; Function Attrs: nounwind
declare i32 @getpid() #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
