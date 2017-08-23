; ModuleID = 'tmp1.ll'
source_filename = "term.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [8 x i8] c"COLUMNS\00", align 1
@co = external global i32, align 4
@.str.1 = private unnamed_addr constant [6 x i8] c"LINES\00", align 1
@li = external global i32, align 4
@contextsize = external global i32, align 4
@cbench_print = external global i32, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [43 x i8] c"Screen too small:  need at least %d lines\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"Can't deal with non-interactive use yet.\0A\00", align 1
@osbuf = internal global %struct.termios zeroinitializer, align 4
@termchanged = internal global i32 0, align 4
@sbuf = internal global %struct.termios zeroinitializer, align 4
@uerasechar = external global i32, align 4
@ukillchar = external global i32, align 4
@oldint = internal global void (...)* null, align 8
@oldterm = internal global void (...)* null, align 8
@oldttin = internal global void (...)* null, align 8
@oldttou = internal global void (...)* null, align 8
@oldtstp = internal global void (...)* null, align 8
@tempfile = external global [4096 x i8], align 16
@.str.4 = private unnamed_addr constant [28 x i8] c"Couldn't fork, try later.\0D\0A\00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"\0A-- Type space to continue --\00", align 1
@outfile1 = external global %struct._IO_FILE*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_erase = private constant [5 x i8] c"erase"
@__profn_move = private constant [4 x i8] c"move"
@__profn_inverse = private constant [7 x i8] c"inverse"
@__profn_normal = private constant [6 x i8] c"normal"
@__profn_backup = private constant [6 x i8] c"backup"
@__profn_terminit = private constant [8 x i8] c"terminit"
@__profn_done = private constant [4 x i8] c"done"
@__profn_tmp1.ll_onstop = private constant [14 x i8] c"tmp1.ll:onstop"
@__profn_stop = private constant [4 x i8] c"stop"
@__profn_shellescape = private constant [11 x i8] c"shellescape"
@__profc_erase = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_erase = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7129317723210388698, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_erase, i32 0, i32 0), i8* bitcast (void ()* @erase to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_move = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_move = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5527849675573873609, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_move, i32 0, i32 0), i8* bitcast (void (i32, i32)* @move to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_inverse = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_inverse = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3334362191075205975, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_inverse, i32 0, i32 0), i8* bitcast (void ()* @inverse to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_normal = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_normal = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2451604731764170498, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_normal, i32 0, i32 0), i8* bitcast (void ()* @normal to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_backup = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_backup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6142051452520947648, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_backup, i32 0, i32 0), i8* bitcast (void ()* @backup to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_terminit = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_terminit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5687623525886406256, i64 228090615367, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i32 0, i32 0), i8* bitcast (void ()* @terminit to i8*), i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_done = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_done = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 235342596919864683, i64 40791492033, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_done, i32 0, i32 0), i8* bitcast (void (i32)* @done to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_onstop = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_onstop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4617953387929294072, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_onstop, i32 0, i32 0), i8* bitcast (void (i32)* @onstop to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_stop = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_stop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8913586028063439343, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_stop, i32 0, i32 0), i8* bitcast (void ()* @stop to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_shellescape = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_shellescape = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8640029139008527903, i64 72057864427703472, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i32 0, i32 0), i8* bitcast (i32 (i8*)* @shellescape to i8*), i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [74 x i8] c"NHx\DA%\C7K\0A\800\0C\05@r!\C1\AD\B7\89\ED\03\8B\F9\91\C6\9E_\C1\CD\C0 y\82\D4\17h\D8B~1Oe\A1\93\DB\FD\04\15R\87\8D\A2\EE\06*\8D}\139\DCfy\D0\CF\05\11\CC\C6\81\17^t\1C\92", section "__llvm_prf_names"
@llvm.used = appending global [11 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_erase to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_move to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_inverse to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_normal to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_backup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_terminit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_done to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_onstop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_stop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_shellescape to i8*), i8* getelementptr inbounds ([74 x i8], [74 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @erase() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_erase, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_erase, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define void @move(i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_move, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_move, i64 0, i64 0)
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @inverse() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_inverse, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_inverse, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define void @normal() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_normal, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_normal, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define void @backup() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_backup, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_backup, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define void @terminit() #0 {
  %1 = call i8* @getenv(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0)) #7
  %2 = icmp ne i8* %1, null
  br i1 %2, label %3, label %7

; <label>:3:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 0)
  %5 = call i8* @getenv(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0)) #7
  %6 = call i32 @atoi(i8* %5) #8
  store i32 %6, i32* @co, align 4
  br label %7

; <label>:7:                                      ; preds = %3, %0
  %8 = call i8* @getenv(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0)) #7
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 1)
  %12 = call i8* @getenv(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0)) #7
  %13 = call i32 @atoi(i8* %12) #8
  store i32 %13, i32* @li, align 4
  br label %14

; <label>:14:                                     ; preds = %10, %7
  %15 = load i32, i32* @contextsize, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 11)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 11)
  %19 = load i32, i32* @li, align 4
  %20 = mul nsw i32 %19, 10
  %21 = sdiv i32 %20, 100
  store i32 %21, i32* @contextsize, align 4
  br label %22

; <label>:22:                                     ; preds = %17, %14
  %23 = load i32, i32* @contextsize, align 4
  %24 = icmp sgt i32 %23, 10
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %22
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 7)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 7)
  store i32 10, i32* @contextsize, align 4
  br label %34

; <label>:27:                                     ; preds = %22
  %28 = load i32, i32* @contextsize, align 4
  %29 = icmp slt i32 %28, 2
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %27
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 13)
  %31 = add i64 %pgocount4, 1
  store i64 %31, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 13)
  store i32 2, i32* @contextsize, align 4
  br label %32

; <label>:32:                                     ; preds = %30, %27
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 8)
  %33 = add i64 %pgocount5, 1
  store i64 %33, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 8)
  br label %34

; <label>:34:                                     ; preds = %32, %25
  %35 = load i32, i32* @li, align 4
  %36 = load i32, i32* @contextsize, align 4
  %37 = add nsw i32 %36, 8
  %38 = icmp slt i32 %35, %37
  br i1 %38, label %39, label %52

; <label>:39:                                     ; preds = %34
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 9)
  %40 = add i64 %pgocount6, 1
  store i64 %40, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 9)
  %41 = load i32, i32* @contextsize, align 4
  %42 = icmp sgt i32 %41, 2
  br i1 %42, label %43, label %52

; <label>:43:                                     ; preds = %39
  %44 = load i32, i32* @li, align 4
  %45 = sub nsw i32 %44, 8
  store i32 %45, i32* @contextsize, align 4
  %46 = load i32, i32* @contextsize, align 4
  %47 = icmp slt i32 %46, 2
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %43
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 15)
  %49 = add i64 %pgocount7, 1
  store i64 %49, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 15)
  store i32 2, i32* @contextsize, align 4
  br label %50

; <label>:50:                                     ; preds = %48, %43
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 14)
  %51 = add i64 %pgocount8, 1
  store i64 %51, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 14)
  br label %52

; <label>:52:                                     ; preds = %50, %39, %34
  %53 = load i32, i32* @li, align 4
  %54 = icmp slt i32 %53, 10
  br i1 %54, label %55, label %64

; <label>:55:                                     ; preds = %52
  %56 = load i32, i32* @cbench_print, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %62

; <label>:58:                                     ; preds = %55
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 12)
  %59 = add i64 %pgocount9, 1
  store i64 %59, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 12)
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.2, i32 0, i32 0), i32 10)
  br label %62

; <label>:62:                                     ; preds = %58, %55
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 10)
  %63 = add i64 %pgocount10, 1
  store i64 %63, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 10)
  br label %64

; <label>:64:                                     ; preds = %62, %52
  %65 = call i32 @isatty(i32 0) #7
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %76, label %67

; <label>:67:                                     ; preds = %64
  %68 = load i32, i32* @cbench_print, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %74

; <label>:70:                                     ; preds = %67
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 17)
  %71 = add i64 %pgocount11, 1
  store i64 %71, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 17)
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %73 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0))
  br label %74

; <label>:74:                                     ; preds = %70, %67
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 16)
  %75 = add i64 %pgocount12, 1
  store i64 %75, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 16)
  call void @exit(i32 1) #9
  unreachable

; <label>:76:                                     ; preds = %64
  %77 = call i32 @tcgetattr(i32 0, %struct.termios* @osbuf) #7
  store i32 1, i32* @termchanged, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.termios* @sbuf to i8*), i8* bitcast (%struct.termios* @osbuf to i8*), i64 60, i32 4, i1 false)
  %78 = load i32, i32* getelementptr inbounds (%struct.termios, %struct.termios* @sbuf, i32 0, i32 3), align 4
  %79 = and i32 %78, -107
  store i32 %79, i32* getelementptr inbounds (%struct.termios, %struct.termios* @sbuf, i32 0, i32 3), align 4
  %80 = load i32, i32* getelementptr inbounds (%struct.termios, %struct.termios* @sbuf, i32 0, i32 1), align 4
  %81 = and i32 %80, -2
  store i32 %81, i32* getelementptr inbounds (%struct.termios, %struct.termios* @sbuf, i32 0, i32 1), align 4
  %82 = load i32, i32* getelementptr inbounds (%struct.termios, %struct.termios* @sbuf, i32 0, i32 0), align 4
  %83 = and i32 %82, -449
  store i32 %83, i32* getelementptr inbounds (%struct.termios, %struct.termios* @sbuf, i32 0, i32 0), align 4
  store i8 1, i8* getelementptr inbounds (%struct.termios, %struct.termios* @sbuf, i32 0, i32 5, i64 6), align 1
  store i8 1, i8* getelementptr inbounds (%struct.termios, %struct.termios* @sbuf, i32 0, i32 5, i64 5), align 1
  %84 = call i32 @tcsetattr(i32 0, i32 0, %struct.termios* @sbuf) #7
  %85 = load i8, i8* getelementptr inbounds (%struct.termios, %struct.termios* @osbuf, i32 0, i32 5, i64 2), align 1
  %86 = zext i8 %85 to i32
  store i32 %86, i32* @uerasechar, align 4
  %87 = load i8, i8* getelementptr inbounds (%struct.termios, %struct.termios* @osbuf, i32 0, i32 5, i64 3), align 1
  %88 = zext i8 %87 to i32
  store i32 %88, i32* @ukillchar, align 4
  %89 = call void (i32)* @signal(i32 2, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  %90 = bitcast void (i32)* %89 to void (...)*
  store void (...)* %90, void (...)** @oldint, align 8
  %91 = icmp ne void (...)* %90, inttoptr (i64 1 to void (...)*)
  br i1 %91, label %92, label %95

; <label>:92:                                     ; preds = %76
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 2)
  %93 = add i64 %pgocount13, 1
  store i64 %93, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 2)
  %94 = call void (i32)* @signal(i32 2, void (i32)* @done) #7
  br label %95

; <label>:95:                                     ; preds = %92, %76
  %96 = call void (i32)* @signal(i32 15, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  %97 = bitcast void (i32)* %96 to void (...)*
  store void (...)* %97, void (...)** @oldterm, align 8
  %98 = icmp ne void (...)* %97, inttoptr (i64 1 to void (...)*)
  br i1 %98, label %99, label %102

; <label>:99:                                     ; preds = %95
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 3)
  %100 = add i64 %pgocount14, 1
  store i64 %100, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 3)
  %101 = call void (i32)* @signal(i32 15, void (i32)* @done) #7
  br label %102

; <label>:102:                                    ; preds = %99, %95
  %103 = call void (i32)* @signal(i32 21, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  %104 = bitcast void (i32)* %103 to void (...)*
  store void (...)* %104, void (...)** @oldttin, align 8
  %105 = icmp ne void (...)* %104, inttoptr (i64 1 to void (...)*)
  br i1 %105, label %106, label %109

; <label>:106:                                    ; preds = %102
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 4)
  %107 = add i64 %pgocount15, 1
  store i64 %107, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 4)
  %108 = call void (i32)* @signal(i32 21, void (i32)* @onstop) #7
  br label %109

; <label>:109:                                    ; preds = %106, %102
  %110 = call void (i32)* @signal(i32 22, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  %111 = bitcast void (i32)* %110 to void (...)*
  store void (...)* %111, void (...)** @oldttou, align 8
  %112 = icmp ne void (...)* %111, inttoptr (i64 1 to void (...)*)
  br i1 %112, label %113, label %116

; <label>:113:                                    ; preds = %109
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 5)
  %114 = add i64 %pgocount16, 1
  store i64 %114, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 5)
  %115 = call void (i32)* @signal(i32 22, void (i32)* @onstop) #7
  br label %116

; <label>:116:                                    ; preds = %113, %109
  %117 = call void (i32)* @signal(i32 20, void (i32)* inttoptr (i64 1 to void (i32)*)) #7
  %118 = bitcast void (i32)* %117 to void (...)*
  store void (...)* %118, void (...)** @oldtstp, align 8
  %119 = icmp ne void (...)* %118, inttoptr (i64 1 to void (...)*)
  br i1 %119, label %120, label %123

; <label>:120:                                    ; preds = %116
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 6)
  %121 = add i64 %pgocount17, 1
  store i64 %121, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_terminit, i64 0, i64 6)
  %122 = call void (i32)* @signal(i32 20, void (i32)* @onstop) #7
  br label %123

; <label>:123:                                    ; preds = %120, %116
  ret void
}

; Function Attrs: nounwind
declare i8* @getenv(i8*) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind
declare i32 @isatty(i32) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare i32 @tcgetattr(i32, %struct.termios*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind
declare i32 @tcsetattr(i32, i32, %struct.termios*) #1

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) #1

; Function Attrs: nounwind uwtable
define void @done(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i8, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i64 0, i64 0), align 16
  %4 = sext i8 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_done, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_done, i64 0, i64 1)
  %8 = call i32 @unlink(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tempfile, i32 0, i32 0)) #7
  br label %9

; <label>:9:                                      ; preds = %6, %1
  %10 = load i32, i32* @termchanged, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_done, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_done, i64 0, i64 2)
  br label %14

; <label>:14:                                     ; preds = %12, %9
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_done, i64 0, i64 0)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_done, i64 0, i64 0)
  call void @exit(i32 0) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @onstop(i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_onstop, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_onstop, i64 0, i64 0)
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = call i32 @tcsetattr(i32 0, i32 0, %struct.termios* @osbuf) #7
  %5 = load i32, i32* %3, align 4
  %6 = call void (i32)* @signal(i32 %5, void (i32)* null) #7
  %7 = load i32, i32* %3, align 4
  %8 = call i32 @kill(i32 0, i32 %7) #7
  %9 = load i32, i32* %3, align 4
  %10 = call void (i32)* @signal(i32 %9, void (i32)* @onstop) #7
  %11 = call i32 @tcsetattr(i32 0, i32 0, %struct.termios* @sbuf) #7
  ret void
}

; Function Attrs: nounwind
declare i32 @unlink(i8*) #1

; Function Attrs: nounwind uwtable
define void @stop() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_stop, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_stop, i64 0, i64 0)
  call void @onstop(i32 20)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @shellescape(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca [100 x i8*], align 16
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %7 = load i8*, i8** %2, align 8
  store i8* %7, i8** %4, align 8
  store i32 0, i32* %5, align 4
  br label %8

; <label>:8:                                      ; preds = %77, %1
  %9 = load i8*, i8** %4, align 8
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %78

; <label>:13:                                     ; preds = %8
  br label %14

; <label>:14:                                     ; preds = %28, %13
  %15 = load i8*, i8** %4, align 8
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 32
  br i1 %18, label %._crit_edge2, label %20

._crit_edge2:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 4)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 4)
  br label %26

; <label>:20:                                     ; preds = %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 1)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 1)
  %22 = load i8*, i8** %4, align 8
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 9
  br label %26

; <label>:26:                                     ; preds = %._crit_edge2, %20
  %27 = phi i1 [ true, %._crit_edge2 ], [ %25, %20 ]
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %26
  %29 = load i8*, i8** %4, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %4, align 8
  br label %14

; <label>:31:                                     ; preds = %26
  %32 = load i8*, i8** %4, align 8
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 16)
  %37 = add i64 %pgocount4, 1
  store i64 %37, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 16)
  br label %78

; <label>:38:                                     ; preds = %31
  %pgocount5 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 7)
  %39 = add i64 %pgocount5, 1
  store i64 %39, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 7)
  %40 = load i8*, i8** %4, align 8
  %41 = load i32, i32* %5, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %5, align 4
  %43 = sext i32 %41 to i64
  %44 = getelementptr inbounds [100 x i8*], [100 x i8*]* %3, i64 0, i64 %43
  store i8* %40, i8** %44, align 8
  br label %45

; <label>:45:                                     ; preds = %65, %38
  %46 = load i8*, i8** %4, align 8
  %47 = load i8, i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp ne i32 %48, 32
  br i1 %49, label %51, label %._crit_edge

._crit_edge:                                      ; preds = %45
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 0)
  %50 = add i64 %pgocount6, 1
  store i64 %50, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 0)
  br label %63

; <label>:51:                                     ; preds = %45
  %52 = load i8*, i8** %4, align 8
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp ne i32 %54, 9
  br i1 %55, label %57, label %._crit_edge1

._crit_edge1:                                     ; preds = %51
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 2)
  %56 = add i64 %pgocount7, 1
  store i64 %56, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 2)
  br label %63

; <label>:57:                                     ; preds = %51
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 3)
  %58 = add i64 %pgocount8, 1
  store i64 %58, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 3)
  %59 = load i8*, i8** %4, align 8
  %60 = load i8, i8* %59, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp ne i32 %61, 0
  br label %63

; <label>:63:                                     ; preds = %._crit_edge1, %._crit_edge, %57
  %64 = phi i1 [ false, %._crit_edge1 ], [ false, %._crit_edge ], [ %62, %57 ]
  br i1 %64, label %65, label %68

; <label>:65:                                     ; preds = %63
  %66 = load i8*, i8** %4, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %4, align 8
  br label %45

; <label>:68:                                     ; preds = %63
  %69 = load i8*, i8** %4, align 8
  %70 = load i8, i8* %69, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %77

; <label>:73:                                     ; preds = %68
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 8)
  %74 = add i64 %pgocount9, 1
  store i64 %74, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 8)
  %75 = load i8*, i8** %4, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %4, align 8
  store i8 0, i8* %75, align 1
  br label %77

; <label>:77:                                     ; preds = %73, %68
  br label %8

; <label>:78:                                     ; preds = %36, %8
  %79 = load i32, i32* %5, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [100 x i8*], [100 x i8*]* %3, i64 0, i64 %80
  store i8* null, i8** %81, align 8
  %82 = call i32 @tcsetattr(i32 0, i32 0, %struct.termios* @osbuf) #7
  %83 = load void (...)*, void (...)** @oldint, align 8
  %84 = bitcast void (...)* %83 to void (i32)*
  %85 = call void (i32)* @signal(i32 2, void (i32)* %84) #7
  %86 = load void (...)*, void (...)** @oldterm, align 8
  %87 = bitcast void (...)* %86 to void (i32)*
  %88 = call void (i32)* @signal(i32 15, void (i32)* %87) #7
  %89 = load void (...)*, void (...)** @oldttin, align 8
  %90 = bitcast void (...)* %89 to void (i32)*
  %91 = call void (i32)* @signal(i32 21, void (i32)* %90) #7
  %92 = load void (...)*, void (...)** @oldttou, align 8
  %93 = bitcast void (...)* %92 to void (i32)*
  %94 = call void (i32)* @signal(i32 22, void (i32)* %93) #7
  %95 = load void (...)*, void (...)** @oldtstp, align 8
  %96 = bitcast void (...)* %95 to void (i32)*
  %97 = call void (i32)* @signal(i32 20, void (i32)* %96) #7
  %98 = call i32 @fork() #7
  store i32 %98, i32* %5, align 4
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %106

; <label>:100:                                    ; preds = %78
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 18)
  %101 = add i64 %pgocount10, 1
  store i64 %101, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 18)
  %102 = getelementptr inbounds [100 x i8*], [100 x i8*]* %3, i64 0, i64 0
  %103 = load i8*, i8** %102, align 16
  %104 = getelementptr inbounds [100 x i8*], [100 x i8*]* %3, i32 0, i32 0
  %105 = call i32 @execvp(i8* %103, i8** %104) #7
  call void @_exit(i32 123) #10
  unreachable

; <label>:106:                                    ; preds = %78
  %107 = load i32, i32* %5, align 4
  %108 = icmp sgt i32 %107, 0
  br i1 %108, label %109, label %123

; <label>:109:                                    ; preds = %106
  br label %110

; <label>:110:                                    ; preds = %114, %109
  %111 = call i32 (i32*, ...) bitcast (i32 (...)* @wait to i32 (i32*, ...)*)(i32* %6)
  %112 = load i32, i32* %5, align 4
  %113 = icmp ne i32 %111, %112
  br i1 %113, label %114, label %116

; <label>:114:                                    ; preds = %110
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 5)
  %115 = add i64 %pgocount11, 1
  store i64 %115, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 5)
  br label %110

; <label>:116:                                    ; preds = %110
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 9)
  %117 = add i64 %pgocount12, 1
  store i64 %117, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 9)
  %118 = load i32, i32* %6, align 4
  %119 = icmp eq i32 %118, 31488
  %120 = zext i1 %119 to i64
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 19)
  %121 = add i64 %pgocount13, %120
  store i64 %121, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 19)
  %122 = select i1 %119, i32 0, i32 -1
  store i32 %122, i32* %6, align 4
  br label %126

; <label>:123:                                    ; preds = %106
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 17)
  %124 = add i64 %pgocount14, 1
  store i64 %124, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 17)
  %125 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  store i32 -1, i32* %6, align 4
  br label %126

; <label>:126:                                    ; preds = %123, %116
  br label %127

; <label>:127:                                    ; preds = %126
  %128 = load void (...)*, void (...)** @oldint, align 8
  %129 = icmp ne void (...)* %128, inttoptr (i64 1 to void (...)*)
  br i1 %129, label %130, label %133

; <label>:130:                                    ; preds = %127
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 10)
  %131 = add i64 %pgocount15, 1
  store i64 %131, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 10)
  %132 = call void (i32)* @signal(i32 2, void (i32)* @done) #7
  br label %133

; <label>:133:                                    ; preds = %130, %127
  %134 = load void (...)*, void (...)** @oldterm, align 8
  %135 = icmp ne void (...)* %134, inttoptr (i64 1 to void (...)*)
  br i1 %135, label %136, label %139

; <label>:136:                                    ; preds = %133
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 11)
  %137 = add i64 %pgocount16, 1
  store i64 %137, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 11)
  %138 = call void (i32)* @signal(i32 15, void (i32)* @done) #7
  br label %139

; <label>:139:                                    ; preds = %136, %133
  %140 = load void (...)*, void (...)** @oldttin, align 8
  %141 = icmp ne void (...)* %140, inttoptr (i64 1 to void (...)*)
  br i1 %141, label %142, label %145

; <label>:142:                                    ; preds = %139
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 12)
  %143 = add i64 %pgocount17, 1
  store i64 %143, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 12)
  %144 = call void (i32)* @signal(i32 21, void (i32)* @onstop) #7
  br label %145

; <label>:145:                                    ; preds = %142, %139
  %146 = load void (...)*, void (...)** @oldttou, align 8
  %147 = icmp ne void (...)* %146, inttoptr (i64 1 to void (...)*)
  br i1 %147, label %148, label %151

; <label>:148:                                    ; preds = %145
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 13)
  %149 = add i64 %pgocount18, 1
  store i64 %149, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 13)
  %150 = call void (i32)* @signal(i32 22, void (i32)* @onstop) #7
  br label %151

; <label>:151:                                    ; preds = %148, %145
  %152 = load void (...)*, void (...)** @oldtstp, align 8
  %153 = icmp ne void (...)* %152, inttoptr (i64 1 to void (...)*)
  br i1 %153, label %154, label %157

; <label>:154:                                    ; preds = %151
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 14)
  %155 = add i64 %pgocount19, 1
  store i64 %155, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 14)
  %156 = call void (i32)* @signal(i32 20, void (i32)* @onstop) #7
  br label %157

; <label>:157:                                    ; preds = %154, %151
  %158 = call i32 @tcsetattr(i32 0, i32 0, %struct.termios* @sbuf) #7
  %159 = load i32, i32* %6, align 4
  %160 = icmp ne i32 %159, 0
  br i1 %160, label %161, label %172

; <label>:161:                                    ; preds = %157
  %162 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.5, i32 0, i32 0))
  %163 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %164 = call i32 @fflush(%struct._IO_FILE* %163)
  br label %165

; <label>:165:                                    ; preds = %168, %161
  %166 = call i32 @getchar()
  %167 = icmp ne i32 %166, 32
  br i1 %167, label %168, label %170

; <label>:168:                                    ; preds = %165
  %pgocount20 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 6)
  %169 = add i64 %pgocount20, 1
  store i64 %169, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 6)
  br label %165

; <label>:170:                                    ; preds = %165
  %pgocount21 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 15)
  %171 = add i64 %pgocount21, 1
  store i64 %171, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_shellescape, i64 0, i64 15)
  br label %172

; <label>:172:                                    ; preds = %170, %157
  %173 = load i32, i32* %6, align 4
  ret i32 %173
}

; Function Attrs: nounwind
declare i32 @fork() #1

; Function Attrs: nounwind
declare i32 @execvp(i8*, i8**) #1

; Function Attrs: noreturn
declare void @_exit(i32) #6

declare i32 @wait(...) #3

declare i32 @printf(i8*, ...) #3

declare i32 @fflush(%struct._IO_FILE*) #3

declare i32 @getchar() #3

; Function Attrs: nounwind
declare i32 @kill(i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #7

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }
attributes #10 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
