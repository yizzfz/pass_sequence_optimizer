; ModuleID = 'tmp1.ll'
source_filename = "aufile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@file_write = global void (i32, i16*)* null, align 8
@file_term = global void ()* null, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"File output\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@linear_file = internal global i8* null, align 8
@.str.3 = private unnamed_addr constant [27 x i8] c"Raw 16-bit linear pathname\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"o\00", align 1
@au_file = internal global i8* null, align 8
@.str.5 = private unnamed_addr constant [25 x i8] c"Sun/Next audio file name\00", align 1
@help_only = external global i32, align 4
@.str.6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@au_fd = internal global i32 -1, align 4
@samp_rate = external global i64, align 8
@au_encoding = internal global i32 1, align 4
@au_size = internal global i32 0, align 4
@linear_fd = internal global i32 -1, align 4
@.str.7 = private unnamed_addr constant [6 x i8] c"write\00", align 1
@_l2u = external global i8*, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str.8 = private unnamed_addr constant [30 x i8] c"%s : No memory for ulaw data\0A\00", align 1
@program = external global i8*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_au_header = private constant [9 x i8] c"au_header"
@__profn_tmp1.ll_wblong = private constant [14 x i8] c"tmp1.ll:wblong"
@__profn_file_init = private constant [9 x i8] c"file_init"
@__profn_tmp1.ll_aufile_write = private constant [20 x i8] c"tmp1.ll:aufile_write"
@__profn_tmp1.ll_aufile_term = private constant [19 x i8] c"tmp1.ll:aufile_term"
@__profc_au_header = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_au_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -948471666336030291, i64 22759827559, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_au_header, i32 0, i32 0), i8* bitcast (void (i32, i32, i32, i32, i8*)* @au_header to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_wblong = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_wblong = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 862800598444096884, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wblong, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_file_init = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_file_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8949054633172373898, i64 167066365702, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @file_init to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_aufile_write = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_aufile_write = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4920689867627109376, i64 164436865575, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i32 0, i32 0), i8* bitcast (void (i32, i16*)* @aufile_write to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_aufile_term = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_aufile_term = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6404685603741444893, i64 88662242760, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i32 0, i32 0), i8* bitcast (void ()* @aufile_term to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [77 x i8] c"K\00au_header\01tmp1.ll:wblong\01file_init\01tmp1.ll:aufile_write\01tmp1.ll:aufile_term", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_au_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_wblong to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_file_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_aufile_write to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_aufile_term to i8*), i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @au_header(i32, i32, i32, i32, i8*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i8* %4, i8** %10, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = icmp ne i8* %11, null
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_au_header, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_au_header, i64 0, i64 1)
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** %10, align 8
  br label %15

; <label>:15:                                     ; preds = %13, %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_au_header, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_au_header, i64 0, i64 0)
  %17 = load i32, i32* %6, align 4
  call void @wblong(i32 %17, i64 779316836)
  %18 = load i32, i32* %6, align 4
  %19 = load i8*, i8** %10, align 8
  %20 = call i64 @strlen(i8* %19) #6
  %21 = add i64 24, %20
  call void @wblong(i32 %18, i64 %21)
  %22 = load i32, i32* %6, align 4
  %23 = load i32, i32* %9, align 4
  %24 = zext i32 %23 to i64
  call void @wblong(i32 %22, i64 %24)
  %25 = load i32, i32* %6, align 4
  %26 = load i32, i32* %7, align 4
  %27 = zext i32 %26 to i64
  call void @wblong(i32 %25, i64 %27)
  %28 = load i32, i32* %6, align 4
  %29 = load i32, i32* %8, align 4
  %30 = zext i32 %29 to i64
  call void @wblong(i32 %28, i64 %30)
  %31 = load i32, i32* %6, align 4
  call void @wblong(i32 %31, i64 1)
  %32 = load i32, i32* %6, align 4
  %33 = load i8*, i8** %10, align 8
  %34 = load i8*, i8** %10, align 8
  %35 = call i64 @strlen(i8* %34) #6
  %36 = call i64 @write(i32 %32, i8* %33, i64 %35)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @wblong(i32, i64) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  store i32 %0, i32* %3, align 4
  store i64 %1, i64* %4, align 8
  store i32 24, i32* %5, align 4
  br label %7

; <label>:7:                                      ; preds = %19, %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp sge i32 %8, 0
  br i1 %9, label %10, label %23

; <label>:10:                                     ; preds = %7
  %11 = load i64, i64* %4, align 8
  %12 = load i32, i32* %5, align 4
  %13 = zext i32 %12 to i64
  %14 = lshr i64 %11, %13
  %15 = and i64 %14, 255
  %16 = trunc i64 %15 to i8
  store i8 %16, i8* %6, align 1
  %17 = load i32, i32* %3, align 4
  %18 = call i64 @write(i32 %17, i8* %6, i64 1)
  br label %19

; <label>:19:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wblong, i64 0, i64 0)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wblong, i64 0, i64 0)
  %21 = load i32, i32* %5, align 4
  %22 = sub nsw i32 %21, 8
  store i32 %22, i32* %5, align 4
  br label %7

; <label>:23:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wblong, i64 0, i64 1)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_wblong, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

declare i64 @write(i32, i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define i32 @file_init(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %6 = load i32, i32* %4, align 4
  %7 = load i8**, i8*** %5, align 8
  %8 = call i32 (i8*, i32, i8**, ...) @getargs(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 %6, i8** %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** @linear_file, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i8** @au_file, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i32 0, i32 0), i8* null)
  store i32 %8, i32* %4, align 4
  %9 = load i32, i32* @help_only, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 0)
  %13 = load i32, i32* %4, align 4
  store i32 %13, i32* %3, align 4
  br label %81

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** @au_file, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %49

; <label>:17:                                     ; preds = %14
  %18 = load i8*, i8** @au_file, align 8
  %19 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0)) #6
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 6)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 6)
  store i32 1, i32* @au_fd, align 4
  br label %33

; <label>:23:                                     ; preds = %17
  %24 = load i8*, i8** @au_file, align 8
  %25 = call i32 (i8*, i32, ...) @open(i8* %24, i32 577, i32 438)
  store i32 %25, i32* @au_fd, align 4
  %26 = load i32, i32* @au_fd, align 4
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 10)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 10)
  %30 = load i8*, i8** @au_file, align 8
  call void @perror(i8* %30)
  br label %31

; <label>:31:                                     ; preds = %28, %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 4)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 4)
  br label %33

; <label>:33:                                     ; preds = %31, %21
  %34 = load i32, i32* @au_fd, align 4
  %35 = icmp sge i32 %34, 0
  br i1 %35, label %36, label %48

; <label>:36:                                     ; preds = %33
  %37 = load i64, i64* @samp_rate, align 8
  %38 = icmp sgt i64 %37, 8000
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 8)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 8)
  store i32 3, i32* @au_encoding, align 4
  br label %43

; <label>:41:                                     ; preds = %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 9)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 9)
  store i32 1, i32* @au_encoding, align 4
  br label %43

; <label>:43:                                     ; preds = %41, %39
  %44 = load i32, i32* @au_fd, align 4
  %45 = load i32, i32* @au_encoding, align 4
  %46 = load i64, i64* @samp_rate, align 8
  %47 = trunc i64 %46 to i32
  call void @au_header(i32 %44, i32 %45, i32 %47, i32 -1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* @au_size, align 4
  br label %48

; <label>:48:                                     ; preds = %43, %33
  br label %49

; <label>:49:                                     ; preds = %48, %14
  %50 = load i8*, i8** @linear_file, align 8
  %51 = icmp ne i8* %50, null
  br i1 %51, label %52, label %69

; <label>:52:                                     ; preds = %49
  %53 = load i8*, i8** @linear_file, align 8
  %54 = call i32 @strcmp(i8* %53, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0)) #6
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %58

; <label>:56:                                     ; preds = %52
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 7)
  %57 = add i64 %pgocount6, 1
  store i64 %57, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 7)
  store i32 1, i32* @linear_fd, align 4
  br label %68

; <label>:58:                                     ; preds = %52
  %59 = load i8*, i8** @linear_file, align 8
  %60 = call i32 (i8*, i32, ...) @open(i8* %59, i32 577, i32 438)
  store i32 %60, i32* @linear_fd, align 4
  %61 = load i32, i32* @linear_fd, align 4
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %63, label %66

; <label>:63:                                     ; preds = %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 11)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 11)
  %65 = load i8*, i8** @linear_file, align 8
  call void @perror(i8* %65)
  br label %66

; <label>:66:                                     ; preds = %63, %58
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 5)
  %67 = add i64 %pgocount8, 1
  store i64 %67, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 5)
  br label %68

; <label>:68:                                     ; preds = %66, %56
  br label %69

; <label>:69:                                     ; preds = %68, %49
  %70 = load i32, i32* @au_fd, align 4
  %71 = icmp sge i32 %70, 0
  br i1 %71, label %76, label %72

; <label>:72:                                     ; preds = %69
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 3)
  %73 = add i64 %pgocount9, 1
  store i64 %73, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 3)
  %74 = load i32, i32* @linear_fd, align 4
  %75 = icmp sge i32 %74, 0
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %72, %69
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 2)
  %77 = add i64 %pgocount10, 1
  store i64 %77, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 2)
  store void (i32, i16*)* @aufile_write, void (i32, i16*)** @file_write, align 8
  store void ()* @aufile_term, void ()** @file_term, align 8
  br label %78

; <label>:78:                                     ; preds = %76, %72
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 1)
  %79 = add i64 %pgocount11, 1
  store i64 %79, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_file_init, i64 0, i64 1)
  %80 = load i32, i32* %4, align 4
  store i32 %80, i32* %3, align 4
  br label %81

; <label>:81:                                     ; preds = %78, %11
  %82 = load i32, i32* %3, align 4
  ret i32 %82
}

declare i32 @getargs(i8*, i32, i8**, ...) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

declare i32 @open(i8*, i32, ...) #2

declare void @perror(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @aufile_write(i32, i16*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i16*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i16* %1, i16** %4, align 8
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %125

; <label>:12:                                     ; preds = %2
  %13 = load i32, i32* @linear_fd, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %34

; <label>:15:                                     ; preds = %12
  %16 = load i32, i32* %3, align 4
  %17 = sext i32 %16 to i64
  %18 = mul i64 %17, 2
  %19 = trunc i64 %18 to i32
  store i32 %19, i32* %5, align 4
  %20 = load i32, i32* @linear_fd, align 4
  %21 = load i16*, i16** %4, align 8
  %22 = bitcast i16* %21 to i8*
  %23 = load i32, i32* %3, align 4
  %24 = sext i32 %23 to i64
  %25 = mul i64 %24, 2
  %26 = call i64 @write(i32 %20, i8* %22, i64 %25)
  %27 = load i32, i32* %5, align 4
  %28 = zext i32 %27 to i64
  %29 = icmp ne i64 %26, %28
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 4)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 4)
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0))
  br label %32

; <label>:32:                                     ; preds = %30, %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 3)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 3)
  br label %34

; <label>:34:                                     ; preds = %32, %12
  %35 = load i32, i32* @au_fd, align 4
  %36 = icmp sge i32 %35, 0
  br i1 %36, label %37, label %123

; <label>:37:                                     ; preds = %34
  %38 = load i32, i32* @au_encoding, align 4
  %39 = icmp eq i32 %38, 3
  br i1 %39, label %40, label %62

; <label>:40:                                     ; preds = %37
  %41 = load i32, i32* %3, align 4
  %42 = sext i32 %41 to i64
  %43 = mul i64 %42, 2
  %44 = trunc i64 %43 to i32
  store i32 %44, i32* %6, align 4
  %45 = load i32, i32* @au_fd, align 4
  %46 = load i16*, i16** %4, align 8
  %47 = bitcast i16* %46 to i8*
  %48 = load i32, i32* %6, align 4
  %49 = zext i32 %48 to i64
  %50 = call i64 @write(i32 %45, i8* %47, i64 %49)
  %51 = load i32, i32* %6, align 4
  %52 = zext i32 %51 to i64
  %53 = icmp ne i64 %50, %52
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 5)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 5)
  call void @perror(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0))
  br label %61

; <label>:56:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 6)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 6)
  %58 = load i32, i32* %6, align 4
  %59 = load i32, i32* @au_size, align 4
  %60 = add i32 %59, %58
  store i32 %60, i32* @au_size, align 4
  br label %61

; <label>:61:                                     ; preds = %56, %54
  br label %122

; <label>:62:                                     ; preds = %37
  %63 = load i32, i32* @au_encoding, align 4
  %64 = icmp eq i32 %63, 1
  br i1 %64, label %65, label %119

; <label>:65:                                     ; preds = %62
  %66 = load i32, i32* %3, align 4
  %67 = sext i32 %66 to i64
  %68 = call noalias i8* @malloc(i64 %67) #5
  store i8* %68, i8** %7, align 8
  %69 = load i8*, i8** %7, align 8
  %70 = icmp ne i8* %69, null
  br i1 %70, label %71, label %113

; <label>:71:                                     ; preds = %65
  %72 = load i8*, i8** %7, align 8
  store i8* %72, i8** %8, align 8
  %73 = load i8*, i8** %8, align 8
  %74 = load i32, i32* %3, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %73, i64 %75
  store i8* %76, i8** %9, align 8
  br label %77

; <label>:77:                                     ; preds = %81, %71
  %78 = load i8*, i8** %8, align 8
  %79 = load i8*, i8** %9, align 8
  %80 = icmp ult i8* %78, %79
  br i1 %80, label %81, label %94

; <label>:81:                                     ; preds = %77
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 0)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 0)
  %83 = load i8*, i8** @_l2u, align 8
  %84 = load i16*, i16** %4, align 8
  %85 = getelementptr inbounds i16, i16* %84, i32 1
  store i16* %85, i16** %4, align 8
  %86 = load i16, i16* %84, align 2
  %87 = sext i16 %86 to i32
  %88 = ashr i32 %87, 3
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8* %83, i64 %89
  %91 = load i8, i8* %90, align 1
  %92 = load i8*, i8** %8, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %8, align 8
  store i8 %91, i8* %92, align 1
  br label %77

; <label>:94:                                     ; preds = %77
  %95 = load i32, i32* @au_fd, align 4
  %96 = load i8*, i8** %7, align 8
  %97 = load i32, i32* %3, align 4
  %98 = sext i32 %97 to i64
  %99 = call i64 @write(i32 %95, i8* %96, i64 %98)
  %100 = load i32, i32* %3, align 4
  %101 = sext i32 %100 to i64
  %102 = icmp ne i64 %99, %101
  br i1 %102, label %103, label %106

; <label>:103:                                    ; preds = %94
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 8)
  %104 = add i64 %pgocount5, 1
  store i64 %104, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 8)
  %105 = load i8*, i8** @au_file, align 8
  call void @perror(i8* %105)
  br label %111

; <label>:106:                                    ; preds = %94
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 9)
  %107 = add i64 %pgocount6, 1
  store i64 %107, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 9)
  %108 = load i32, i32* %3, align 4
  %109 = load i32, i32* @au_size, align 4
  %110 = add i32 %109, %108
  store i32 %110, i32* @au_size, align 4
  br label %111

; <label>:111:                                    ; preds = %106, %103
  %112 = load i8*, i8** %7, align 8
  call void @free(i8* %112) #5
  br label %118

; <label>:113:                                    ; preds = %65
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 7)
  %114 = add i64 %pgocount7, 1
  store i64 %114, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 7)
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %116 = load i8*, i8** @program, align 8
  %117 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %115, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.8, i32 0, i32 0), i8* %116)
  br label %118

; <label>:118:                                    ; preds = %113, %111
  br label %121

; <label>:119:                                    ; preds = %62
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 10)
  %120 = add i64 %pgocount8, 1
  store i64 %120, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 10)
  call void @abort() #7
  unreachable

; <label>:121:                                    ; preds = %118
  br label %122

; <label>:122:                                    ; preds = %121, %61
  br label %123

; <label>:123:                                    ; preds = %122, %34
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 2)
  %124 = add i64 %pgocount9, 1
  store i64 %124, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 2)
  br label %125

; <label>:125:                                    ; preds = %123, %2
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 1)
  %126 = add i64 %pgocount10, 1
  store i64 %126, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_aufile_write, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @aufile_term() #0 {
  %1 = alloca i64, align 8
  %2 = load i32, i32* @au_fd, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %32

; <label>:4:                                      ; preds = %0
  %5 = load i32, i32* @au_fd, align 4
  %6 = call i64 @lseek(i32 %5, i64 0, i32 1) #5
  store i64 %6, i64* %1, align 8
  %7 = load i64, i64* %1, align 8
  %8 = icmp sge i64 %7, 0
  br i1 %8, label %9, label %23

; <label>:9:                                      ; preds = %4
  %10 = load i32, i32* @au_fd, align 4
  %11 = load i64, i64* %1, align 8
  %12 = call i32 @ftruncate(i32 %10, i64 %11) #5
  %13 = load i32, i32* @au_fd, align 4
  %14 = call i64 @lseek(i32 %13, i64 8, i32 0) #5
  %15 = icmp eq i64 %14, 8
  br i1 %15, label %16, label %21

; <label>:16:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 6)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 6)
  %18 = load i32, i32* @au_fd, align 4
  %19 = load i32, i32* @au_size, align 4
  %20 = zext i32 %19 to i64
  call void @wblong(i32 %18, i64 %20)
  br label %21

; <label>:21:                                     ; preds = %16, %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 3)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 3)
  br label %23

; <label>:23:                                     ; preds = %21, %4
  %24 = load i32, i32* @au_fd, align 4
  %25 = icmp ne i32 %24, 1
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 4)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 4)
  %28 = load i32, i32* @au_fd, align 4
  %29 = call i32 @close(i32 %28)
  br label %30

; <label>:30:                                     ; preds = %26, %23
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 1)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 1)
  store i32 -1, i32* @au_fd, align 4
  br label %32

; <label>:32:                                     ; preds = %30, %0
  %33 = load i32, i32* @linear_fd, align 4
  %34 = icmp sge i32 %33, 0
  br i1 %34, label %35, label %48

; <label>:35:                                     ; preds = %32
  %36 = load i32, i32* @linear_fd, align 4
  %37 = load i32, i32* @linear_fd, align 4
  %38 = call i64 @lseek(i32 %37, i64 0, i32 1) #5
  %39 = call i32 @ftruncate(i32 %36, i64 %38) #5
  %40 = load i32, i32* @linear_fd, align 4
  %41 = icmp ne i32 %40, 1
  br i1 %41, label %42, label %46

; <label>:42:                                     ; preds = %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 5)
  %43 = add i64 %pgocount4, 1
  store i64 %43, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 5)
  %44 = load i32, i32* @linear_fd, align 4
  %45 = call i32 @close(i32 %44)
  br label %46

; <label>:46:                                     ; preds = %42, %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 2)
  %47 = add i64 %pgocount5, 1
  store i64 %47, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 2)
  store i32 -1, i32* @linear_fd, align 4
  br label %48

; <label>:48:                                     ; preds = %46, %32
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 0)
  %49 = add i64 %pgocount6, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_aufile_term, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @abort() #4

; Function Attrs: nounwind
declare i64 @lseek(i32, i64, i32) #3

; Function Attrs: nounwind
declare i32 @ftruncate(i32, i64) #3

declare i32 @close(i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
