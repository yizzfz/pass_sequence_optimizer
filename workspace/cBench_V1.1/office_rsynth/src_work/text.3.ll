; ModuleID = 'text.2.ll'
source_filename = "text.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.darray_t = type { i8*, i32, i32, i16, i16 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [61 x i8] c"$Id: text.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@text_id = global i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str, i32 0, i32 0), align 8
@Rules = external global [0 x [4 x i8*]*], align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [42 x i8] c"Error: Can't find rule for: '%c' in \22%s\22\0A\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Bad char in left rule: '%c'\0A\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Bad char in right rule:'%c'\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_isvowel = private constant [7 x i8] c"isvowel"
@__profn_isconsonant = private constant [11 x i8] c"isconsonant"
@__profn_NRL = private constant [3 x i8] c"NRL"
@__profn_tmp1.ll_guess_word = private constant [18 x i8] c"tmp1.ll:guess_word"
@__profn_tmp1.ll_phone_cat = private constant [17 x i8] c"tmp1.ll:phone_cat"
@__profn_tmp1.ll_find_rule = private constant [17 x i8] c"tmp1.ll:find_rule"
@__profn_tmp1.ll_leftmatch = private constant [17 x i8] c"tmp1.ll:leftmatch"
@__profn_tmp1.ll_rightmatch = private constant [18 x i8] c"tmp1.ll:rightmatch"
@__profc_isvowel = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_isvowel = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3041694457004310222, i64 51395000978, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i32 0, i32 0), i8* bitcast (i32 (i32)* @isvowel to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_isconsonant = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_isconsonant = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2090919457122968105, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_isconsonant, i32 0, i32 0), i8* bitcast (i32 (i32)* @isconsonant to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_NRL = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_NRL = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2424295472398749075, i64 41122367911, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_NRL, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, %struct.darray_t*)* @NRL to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_guess_word = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_guess_word = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8275635584495143291, i64 46522476818, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_guess_word, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_phone_cat = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_phone_cat = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -700528794933340582, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_phone_cat, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @phone_cat to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find_rule = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_find_rule = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_find_rule = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5263755531069492017, i64 281578540297860, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_find_rule to i8*), i32 7, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_leftmatch = private global [31 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_leftmatch = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6248894156927637732, i64 340577352484, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i32 0, i32 0), i8* null, i8* null, i32 31, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_rightmatch = private global [40 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_rightmatch = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7848349150213493537, i64 451076070394, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i32 0, i32 0), i8* null, i8* null, i32 40, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [117 x i8] c"s\00isvowel\01isconsonant\01NRL\01tmp1.ll:guess_word\01tmp1.ll:phone_cat\01tmp1.ll:find_rule\01tmp1.ll:leftmatch\01tmp1.ll:rightmatch", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_isvowel to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_isconsonant to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_NRL to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_guess_word to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_phone_cat to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find_rule to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_leftmatch to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_rightmatch to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([117 x i8], [117 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @isvowel(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 65
  br i1 %4, label %21, label %5

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 1)
  %7 = load i32, i32* %2, align 4
  %8 = icmp eq i32 %7, 69
  br i1 %8, label %21, label %9

; <label>:9:                                      ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 2)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 2)
  %11 = load i32, i32* %2, align 4
  %12 = icmp eq i32 %11, 73
  br i1 %12, label %21, label %13

; <label>:13:                                     ; preds = %9
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 3)
  %14 = add i64 %pgocount2, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 3)
  %15 = load i32, i32* %2, align 4
  %16 = icmp eq i32 %15, 79
  br i1 %16, label %21, label %17

; <label>:17:                                     ; preds = %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 4)
  %18 = add i64 %pgocount3, 1
  store i64 %18, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 4)
  %19 = load i32, i32* %2, align 4
  %20 = icmp eq i32 %19, 85
  br label %21

; <label>:21:                                     ; preds = %17, %13, %9, %5, %1
  %22 = phi i1 [ true, %13 ], [ true, %9 ], [ true, %5 ], [ true, %1 ], [ %20, %17 ]
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 0)
  %23 = add i64 %pgocount4, 1
  store i64 %23, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_isvowel, i64 0, i64 0)
  %24 = zext i1 %22 to i32
  ret i32 %24
}

; Function Attrs: noinline nounwind uwtable
define i32 @isconsonant(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = call i16** @__ctype_b_loc() #6
  %4 = load i16*, i16** %3, align 8
  %5 = load i32, i32* %2, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i16, i16* %4, i64 %6
  %8 = load i16, i16* %7, align 2
  %9 = zext i16 %8 to i32
  %10 = and i32 %9, 256
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_isconsonant, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_isconsonant, i64 0, i64 1)
  %14 = load i32, i32* %2, align 4
  %15 = call i32 @isvowel(i32 %14)
  %16 = icmp ne i32 %15, 0
  %17 = xor i1 %16, true
  br label %18

; <label>:18:                                     ; preds = %12, %1
  %19 = phi i1 [ false, %1 ], [ %17, %12 ]
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_isconsonant, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_isconsonant, i64 0, i64 0)
  %21 = zext i1 %19 to i32
  ret i32 %21
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: noinline nounwind uwtable
define i32 @NRL(i8*, i32, %struct.darray_t*) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.darray_t*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8, align 1
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.darray_t* %2, %struct.darray_t** %6, align 8
  %11 = load %struct.darray_t*, %struct.darray_t** %6, align 8
  %12 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 8
  store i32 %13, i32* %7, align 4
  %14 = load i32, i32* %5, align 4
  %15 = add i32 %14, 3
  %16 = zext i32 %15 to i64
  %17 = call noalias i8* @malloc(i64 %16) #5
  store i8* %17, i8** %8, align 8
  %18 = load i8*, i8** %8, align 8
  store i8* %18, i8** %9, align 8
  %19 = load i8*, i8** %9, align 8
  %20 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %20, i8** %9, align 8
  store i8 32, i8* %19, align 1
  br label %21

; <label>:21:                                     ; preds = %45, %3
  %22 = load i32, i32* %5, align 4
  %23 = add i32 %22, -1
  store i32 %23, i32* %5, align 4
  %24 = icmp ugt i32 %22, 0
  br i1 %24, label %25, label %50

; <label>:25:                                     ; preds = %21
  %26 = load i8*, i8** %4, align 8
  %27 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %27, i8** %4, align 8
  %28 = load i8, i8* %26, align 1
  store i8 %28, i8* %10, align 1
  %29 = call i16** @__ctype_b_loc() #6
  %30 = load i16*, i16** %29, align 8
  %31 = load i8, i8* %10, align 1
  %32 = sext i8 %31 to i32
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i16, i16* %30, i64 %33
  %35 = load i16, i16* %34, align 2
  %36 = zext i16 %35 to i32
  %37 = and i32 %36, 512
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %45

; <label>:39:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_NRL, i64 0, i64 1)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_NRL, i64 0, i64 1)
  %41 = load i8, i8* %10, align 1
  %42 = sext i8 %41 to i32
  %43 = call i32 @toupper(i32 %42) #7
  %44 = trunc i32 %43 to i8
  store i8 %44, i8* %10, align 1
  br label %45

; <label>:45:                                     ; preds = %39, %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_NRL, i64 0, i64 0)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_NRL, i64 0, i64 0)
  %47 = load i8, i8* %10, align 1
  %48 = load i8*, i8** %9, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %9, align 8
  store i8 %47, i8* %48, align 1
  br label %21

; <label>:50:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_NRL, i64 0, i64 2)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_NRL, i64 0, i64 2)
  %52 = load i8*, i8** %9, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %9, align 8
  store i8 32, i8* %52, align 1
  %54 = load i8*, i8** %9, align 8
  store i8 0, i8* %54, align 1
  %55 = load %struct.darray_t*, %struct.darray_t** %6, align 8
  %56 = bitcast %struct.darray_t* %55 to i8*
  %57 = load i8*, i8** %8, align 8
  call void @guess_word(i8* %56, void (i8*, i8*)* @phone_cat, i8* %57)
  %58 = load i8*, i8** %8, align 8
  call void @free(i8* %58) #5
  %59 = load %struct.darray_t*, %struct.darray_t** %6, align 8
  %60 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %59, i32 0, i32 1
  %61 = load i32, i32* %60, align 8
  %62 = load i32, i32* %7, align 4
  %63 = sub i32 %61, %62
  ret i32 %63
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @guess_word(i8*, void (i8*, i8*)*, i8*) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca void (i8*, i8*)*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store void (i8*, i8*)* %1, void (i8*, i8*)** %5, align 8
  store i8* %2, i8** %6, align 8
  store i32 1, i32* %7, align 4
  br label %9

; <label>:9:                                      ; preds = %46, %3
  %10 = call i16** @__ctype_b_loc() #6
  %11 = load i16*, i16** %10, align 8
  %12 = load i8*, i8** %6, align 8
  %13 = load i32, i32* %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %12, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i16, i16* %11, i64 %18
  %20 = load i16, i16* %19, align 2
  %21 = zext i16 %20 to i32
  %22 = and i32 %21, 256
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %34

; <label>:24:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_guess_word, i64 0, i64 0)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_guess_word, i64 0, i64 0)
  %26 = load i8*, i8** %6, align 8
  %27 = load i32, i32* %7, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8* %26, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = sub nsw i32 %31, 65
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %8, align 4
  br label %36

; <label>:34:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_guess_word, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_guess_word, i64 0, i64 1)
  store i32 0, i32* %8, align 4
  br label %36

; <label>:36:                                     ; preds = %34, %24
  %37 = load i8*, i8** %4, align 8
  %38 = load void (i8*, i8*)*, void (i8*, i8*)** %5, align 8
  %39 = load i8*, i8** %6, align 8
  %40 = load i32, i32* %7, align 4
  %41 = load i32, i32* %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [0 x [4 x i8*]*], [0 x [4 x i8*]*]* @Rules, i64 0, i64 %42
  %44 = load [4 x i8*]*, [4 x i8*]** %43, align 8
  %45 = call i32 @find_rule(i8* %37, void (i8*, i8*)* %38, i8* %39, i32 %40, [4 x i8*]* %44)
  store i32 %45, i32* %7, align 4
  br label %46

; <label>:46:                                     ; preds = %36
  %47 = load i8*, i8** %6, align 8
  %48 = load i32, i32* %7, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* %47, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = sext i8 %51 to i32
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %9, label %54

; <label>:54:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_guess_word, i64 0, i64 2)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_guess_word, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @phone_cat(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.darray_t*, align 8
  %6 = alloca i8, align 1
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to %struct.darray_t*
  store %struct.darray_t* %8, %struct.darray_t** %5, align 8
  br label %9

; <label>:9:                                      ; preds = %14, %2
  %10 = load i8*, i8** %4, align 8
  %11 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %11, i8** %4, align 8
  %12 = load i8, i8* %10, align 1
  store i8 %12, i8* %6, align 1
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_phone_cat, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_phone_cat, i64 0, i64 0)
  %16 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %17 = load i8, i8* %6, align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 @phone_append(%struct.darray_t* %16, i32 %18)
  br label %9

; <label>:20:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_phone_cat, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_phone_cat, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @find_rule(i8*, void (i8*, i8*)*, i8*, i32, [4 x i8*]*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca void (i8*, i8*)*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca [4 x i8*]*, align 8
  %12 = alloca [4 x i8*]*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i32, align 4
  store i8* %0, i8** %7, align 8
  store void (i8*, i8*)* %1, void (i8*, i8*)** %8, align 8
  store i8* %2, i8** %9, align 8
  store i32 %3, i32* %10, align 4
  store [4 x i8*]* %4, [4 x i8*]** %11, align 8
  br label %18

; <label>:18:                                     ; preds = %98, %88, %71, %5
  %19 = load [4 x i8*]*, [4 x i8*]** %11, align 8
  %20 = getelementptr inbounds [4 x i8*], [4 x i8*]* %19, i32 1
  store [4 x i8*]* %20, [4 x i8*]** %11, align 8
  store [4 x i8*]* %19, [4 x i8*]** %12, align 8
  %21 = load [4 x i8*]*, [4 x i8*]** %12, align 8
  %22 = getelementptr inbounds [4 x i8*], [4 x i8*]* %21, i64 0, i64 1
  %23 = load i8*, i8** %22, align 8
  store i8* %23, i8** %14, align 8
  %24 = load i8*, i8** %14, align 8
  %25 = icmp eq i8* %24, null
  br i1 %25, label %26, label %39

; <label>:26:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 5)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 5)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = load i8*, i8** %9, align 8
  %30 = load i32, i32* %10, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8* %29, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = load i8*, i8** %9, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i32 0, i32 0), i32 %34, i8* %35)
  %37 = load i32, i32* %10, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %6, align 4
  br label %110

; <label>:39:                                     ; preds = %18
  %40 = load i32, i32* %10, align 4
  store i32 %40, i32* %17, align 4
  br label %41

; <label>:41:                                     ; preds = %61, %39
  %42 = load i8*, i8** %14, align 8
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %66

; <label>:46:                                     ; preds = %41
  %47 = load i8*, i8** %14, align 8
  %48 = load i8, i8* %47, align 1
  %49 = sext i8 %48 to i32
  %50 = load i8*, i8** %9, align 8
  %51 = load i32, i32* %17, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8* %50, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp ne i32 %49, %55
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 2)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 2)
  br label %66

; <label>:59:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 0)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 0)
  br label %61

; <label>:61:                                     ; preds = %59
  %62 = load i8*, i8** %14, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %14, align 8
  %64 = load i32, i32* %17, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %17, align 4
  br label %41

; <label>:66:                                     ; preds = %57, %41
  %67 = load i8*, i8** %14, align 8
  %68 = load i8, i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %66
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 1)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 1)
  br label %18

; <label>:73:                                     ; preds = %66
  %74 = load [4 x i8*]*, [4 x i8*]** %12, align 8
  %75 = getelementptr inbounds [4 x i8*], [4 x i8*]* %74, i64 0, i64 0
  %76 = load i8*, i8** %75, align 8
  store i8* %76, i8** %13, align 8
  %77 = load [4 x i8*]*, [4 x i8*]** %12, align 8
  %78 = getelementptr inbounds [4 x i8*], [4 x i8*]* %77, i64 0, i64 2
  %79 = load i8*, i8** %78, align 8
  store i8* %79, i8** %15, align 8
  %80 = load i8*, i8** %13, align 8
  %81 = load i8*, i8** %9, align 8
  %82 = load i32, i32* %10, align 4
  %83 = sub nsw i32 %82, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, i8* %81, i64 %84
  %86 = call i32 @leftmatch(i8* %80, i8* %85)
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %90, label %88

; <label>:88:                                     ; preds = %73
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 4)
  %89 = add i64 %pgocount4, 1
  store i64 %89, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 4)
  br label %18

; <label>:90:                                     ; preds = %73
  %91 = load i8*, i8** %15, align 8
  %92 = load i8*, i8** %9, align 8
  %93 = load i32, i32* %17, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8* %92, i64 %94
  %96 = call i32 @rightmatch(i8* %91, i8* %95)
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %100, label %98

; <label>:98:                                     ; preds = %90
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 3)
  %99 = add i64 %pgocount5, 1
  store i64 %99, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 3)
  br label %18

; <label>:100:                                    ; preds = %90
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 6)
  %101 = add i64 %pgocount6, 1
  store i64 %101, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_find_rule, i64 0, i64 6)
  %102 = load [4 x i8*]*, [4 x i8*]** %12, align 8
  %103 = getelementptr inbounds [4 x i8*], [4 x i8*]* %102, i64 0, i64 3
  %104 = load i8*, i8** %103, align 8
  store i8* %104, i8** %16, align 8
  %105 = load void (i8*, i8*)*, void (i8*, i8*)** %8, align 8
  %106 = load i8*, i8** %7, align 8
  %107 = load i8*, i8** %16, align 8
  %108 = ptrtoint void (i8*, i8*)* %105 to i64
  call void @__llvm_profile_instrument_target(i64 %108, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find_rule to i8*), i32 0)
  call void %105(i8* %106, i8* %107)
  %109 = load i32, i32* %17, align 4
  store i32 %109, i32* %6, align 4
  br label %110

; <label>:110:                                    ; preds = %100, %26
  %111 = load i32, i32* %6, align 4
  ret i32 %111
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @leftmatch(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 5)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 5)
  store i32 1, i32* %3, align 4
  br label %229

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %4, align 8
  %17 = call i64 @strlen(i8* %16) #7
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %8, align 4
  %19 = load i8*, i8** %4, align 8
  %20 = load i32, i32* %8, align 4
  %21 = sub nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8* %19, i64 %22
  store i8* %23, i8** %6, align 8
  %24 = load i8*, i8** %5, align 8
  store i8* %24, i8** %7, align 8
  br label %25

; <label>:25:                                     ; preds = %222, %15
  %26 = load i32, i32* %8, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %227

; <label>:28:                                     ; preds = %25
  %29 = call i16** @__ctype_b_loc() #6
  %30 = load i16*, i16** %29, align 8
  %31 = load i8*, i8** %6, align 8
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i16, i16* %30, i64 %34
  %36 = load i16, i16* %35, align 2
  %37 = zext i16 %36 to i32
  %38 = and i32 %37, 1024
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %52, label %40

; <label>:40:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 3)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 3)
  %42 = load i8*, i8** %6, align 8
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp eq i32 %44, 39
  br i1 %45, label %52, label %46

; <label>:46:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 4)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 4)
  %48 = load i8*, i8** %6, align 8
  %49 = load i8, i8* %48, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp eq i32 %50, 32
  br i1 %51, label %52, label %66

; <label>:52:                                     ; preds = %46, %40, %28
  %53 = load i8*, i8** %6, align 8
  %54 = load i8, i8* %53, align 1
  %55 = sext i8 %54 to i32
  %56 = load i8*, i8** %7, align 8
  %57 = load i8, i8* %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp ne i32 %55, %58
  br i1 %59, label %60, label %62

; <label>:60:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 7)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 7)
  store i32 0, i32* %3, align 4
  br label %229

; <label>:62:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 0)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 0)
  %64 = load i8*, i8** %7, align 8
  %65 = getelementptr inbounds i8, i8* %64, i32 -1
  store i8* %65, i8** %7, align 8
  br label %222

; <label>:66:                                     ; preds = %46
  %67 = load i8*, i8** %6, align 8
  %68 = load i8, i8* %67, align 1
  %69 = sext i8 %68 to i32
  switch i32 %69, label %214 [
    i32 35, label %70
    i32 58, label %93
    i32 94, label %106
    i32 46, label %118
    i32 43, label %189
    i32 37, label %212
  ]

; <label>:70:                                     ; preds = %66
  %71 = load i8*, i8** %7, align 8
  %72 = load i8, i8* %71, align 1
  %73 = sext i8 %72 to i32
  %74 = call i32 @isvowel(i32 %73)
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %78, label %76

; <label>:76:                                     ; preds = %70
  %pgocount5 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 21)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 21)
  store i32 0, i32* %3, align 4
  br label %229

; <label>:78:                                     ; preds = %70
  %79 = load i8*, i8** %7, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 -1
  store i8* %80, i8** %7, align 8
  br label %81

; <label>:81:                                     ; preds = %87, %78
  %82 = load i8*, i8** %7, align 8
  %83 = load i8, i8* %82, align 1
  %84 = sext i8 %83 to i32
  %85 = call i32 @isvowel(i32 %84)
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %91

; <label>:87:                                     ; preds = %81
  %pgocount6 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 2)
  %88 = add i64 %pgocount6, 1
  store i64 %88, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 2)
  %89 = load i8*, i8** %7, align 8
  %90 = getelementptr inbounds i8, i8* %89, i32 -1
  store i8* %90, i8** %7, align 8
  br label %81

; <label>:91:                                     ; preds = %81
  %pgocount7 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 11)
  %92 = add i64 %pgocount7, 1
  store i64 %92, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 11)
  br label %221

; <label>:93:                                     ; preds = %66
  br label %94

; <label>:94:                                     ; preds = %100, %93
  %95 = load i8*, i8** %7, align 8
  %96 = load i8, i8* %95, align 1
  %97 = sext i8 %96 to i32
  %98 = call i32 @isconsonant(i32 %97)
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %104

; <label>:100:                                    ; preds = %94
  %pgocount8 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 1)
  %101 = add i64 %pgocount8, 1
  store i64 %101, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 1)
  %102 = load i8*, i8** %7, align 8
  %103 = getelementptr inbounds i8, i8* %102, i32 -1
  store i8* %103, i8** %7, align 8
  br label %94

; <label>:104:                                    ; preds = %94
  %pgocount9 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 8)
  %105 = add i64 %pgocount9, 1
  store i64 %105, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 8)
  br label %221

; <label>:106:                                    ; preds = %66
  %107 = load i8*, i8** %7, align 8
  %108 = load i8, i8* %107, align 1
  %109 = sext i8 %108 to i32
  %110 = call i32 @isconsonant(i32 %109)
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %114, label %112

; <label>:112:                                    ; preds = %106
  %pgocount10 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 22)
  %113 = add i64 %pgocount10, 1
  store i64 %113, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 22)
  store i32 0, i32* %3, align 4
  br label %229

; <label>:114:                                    ; preds = %106
  %pgocount11 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 12)
  %115 = add i64 %pgocount11, 1
  store i64 %115, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 12)
  %116 = load i8*, i8** %7, align 8
  %117 = getelementptr inbounds i8, i8* %116, i32 -1
  store i8* %117, i8** %7, align 8
  br label %221

; <label>:118:                                    ; preds = %66
  %119 = load i8*, i8** %7, align 8
  %120 = load i8, i8* %119, align 1
  %121 = sext i8 %120 to i32
  %122 = icmp ne i32 %121, 66
  br i1 %122, label %123, label %185

; <label>:123:                                    ; preds = %118
  %pgocount12 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 13)
  %124 = add i64 %pgocount12, 1
  store i64 %124, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 13)
  %125 = load i8*, i8** %7, align 8
  %126 = load i8, i8* %125, align 1
  %127 = sext i8 %126 to i32
  %128 = icmp ne i32 %127, 68
  br i1 %128, label %129, label %185

; <label>:129:                                    ; preds = %123
  %pgocount13 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 15)
  %130 = add i64 %pgocount13, 1
  store i64 %130, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 15)
  %131 = load i8*, i8** %7, align 8
  %132 = load i8, i8* %131, align 1
  %133 = sext i8 %132 to i32
  %134 = icmp ne i32 %133, 86
  br i1 %134, label %135, label %185

; <label>:135:                                    ; preds = %129
  %pgocount14 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 18)
  %136 = add i64 %pgocount14, 1
  store i64 %136, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 18)
  %137 = load i8*, i8** %7, align 8
  %138 = load i8, i8* %137, align 1
  %139 = sext i8 %138 to i32
  %140 = icmp ne i32 %139, 71
  br i1 %140, label %141, label %185

; <label>:141:                                    ; preds = %135
  %pgocount15 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 20)
  %142 = add i64 %pgocount15, 1
  store i64 %142, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 20)
  %143 = load i8*, i8** %7, align 8
  %144 = load i8, i8* %143, align 1
  %145 = sext i8 %144 to i32
  %146 = icmp ne i32 %145, 74
  br i1 %146, label %147, label %185

; <label>:147:                                    ; preds = %141
  %pgocount16 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 23)
  %148 = add i64 %pgocount16, 1
  store i64 %148, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 23)
  %149 = load i8*, i8** %7, align 8
  %150 = load i8, i8* %149, align 1
  %151 = sext i8 %150 to i32
  %152 = icmp ne i32 %151, 76
  br i1 %152, label %153, label %185

; <label>:153:                                    ; preds = %147
  %pgocount17 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 24)
  %154 = add i64 %pgocount17, 1
  store i64 %154, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 24)
  %155 = load i8*, i8** %7, align 8
  %156 = load i8, i8* %155, align 1
  %157 = sext i8 %156 to i32
  %158 = icmp ne i32 %157, 77
  br i1 %158, label %159, label %185

; <label>:159:                                    ; preds = %153
  %pgocount18 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 25)
  %160 = add i64 %pgocount18, 1
  store i64 %160, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 25)
  %161 = load i8*, i8** %7, align 8
  %162 = load i8, i8* %161, align 1
  %163 = sext i8 %162 to i32
  %164 = icmp ne i32 %163, 78
  br i1 %164, label %165, label %185

; <label>:165:                                    ; preds = %159
  %pgocount19 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 27)
  %166 = add i64 %pgocount19, 1
  store i64 %166, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 27)
  %167 = load i8*, i8** %7, align 8
  %168 = load i8, i8* %167, align 1
  %169 = sext i8 %168 to i32
  %170 = icmp ne i32 %169, 82
  br i1 %170, label %171, label %185

; <label>:171:                                    ; preds = %165
  %pgocount20 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 28)
  %172 = add i64 %pgocount20, 1
  store i64 %172, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 28)
  %173 = load i8*, i8** %7, align 8
  %174 = load i8, i8* %173, align 1
  %175 = sext i8 %174 to i32
  %176 = icmp ne i32 %175, 87
  br i1 %176, label %177, label %185

; <label>:177:                                    ; preds = %171
  %pgocount21 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 29)
  %178 = add i64 %pgocount21, 1
  store i64 %178, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 29)
  %179 = load i8*, i8** %7, align 8
  %180 = load i8, i8* %179, align 1
  %181 = sext i8 %180 to i32
  %182 = icmp ne i32 %181, 90
  br i1 %182, label %183, label %185

; <label>:183:                                    ; preds = %177
  %pgocount22 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 30)
  %184 = add i64 %pgocount22, 1
  store i64 %184, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 30)
  store i32 0, i32* %3, align 4
  br label %229

; <label>:185:                                    ; preds = %177, %171, %165, %159, %153, %147, %141, %135, %129, %123, %118
  %pgocount23 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 9)
  %186 = add i64 %pgocount23, 1
  store i64 %186, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 9)
  %187 = load i8*, i8** %7, align 8
  %188 = getelementptr inbounds i8, i8* %187, i32 -1
  store i8* %188, i8** %7, align 8
  br label %221

; <label>:189:                                    ; preds = %66
  %190 = load i8*, i8** %7, align 8
  %191 = load i8, i8* %190, align 1
  %192 = sext i8 %191 to i32
  %193 = icmp ne i32 %192, 69
  br i1 %193, label %194, label %208

; <label>:194:                                    ; preds = %189
  %pgocount24 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 14)
  %195 = add i64 %pgocount24, 1
  store i64 %195, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 14)
  %196 = load i8*, i8** %7, align 8
  %197 = load i8, i8* %196, align 1
  %198 = sext i8 %197 to i32
  %199 = icmp ne i32 %198, 73
  br i1 %199, label %200, label %208

; <label>:200:                                    ; preds = %194
  %pgocount25 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 16)
  %201 = add i64 %pgocount25, 1
  store i64 %201, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 16)
  %202 = load i8*, i8** %7, align 8
  %203 = load i8, i8* %202, align 1
  %204 = sext i8 %203 to i32
  %205 = icmp ne i32 %204, 89
  br i1 %205, label %206, label %208

; <label>:206:                                    ; preds = %200
  %pgocount26 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 26)
  %207 = add i64 %pgocount26, 1
  store i64 %207, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 26)
  store i32 0, i32* %3, align 4
  br label %229

; <label>:208:                                    ; preds = %200, %194, %189
  %pgocount27 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 10)
  %209 = add i64 %pgocount27, 1
  store i64 %209, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 10)
  %210 = load i8*, i8** %7, align 8
  %211 = getelementptr inbounds i8, i8* %210, i32 -1
  store i8* %211, i8** %7, align 8
  br label %221

; <label>:212:                                    ; preds = %66
  %pgocount28 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 19)
  %213 = add i64 %pgocount28, 1
  store i64 %213, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 19)
  br label %214

; <label>:214:                                    ; preds = %212, %66
  %pgocount29 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 17)
  %215 = add i64 %pgocount29, 1
  store i64 %215, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 17)
  %216 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %217 = load i8*, i8** %6, align 8
  %218 = load i8, i8* %217, align 1
  %219 = sext i8 %218 to i32
  %220 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %216, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0), i32 %219)
  store i32 0, i32* %3, align 4
  br label %229

; <label>:221:                                    ; preds = %208, %185, %114, %104, %91
  br label %222

; <label>:222:                                    ; preds = %221, %62
  %223 = load i8*, i8** %6, align 8
  %224 = getelementptr inbounds i8, i8* %223, i32 -1
  store i8* %224, i8** %6, align 8
  %225 = load i32, i32* %8, align 4
  %226 = add nsw i32 %225, -1
  store i32 %226, i32* %8, align 4
  br label %25

; <label>:227:                                    ; preds = %25
  %pgocount30 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 6)
  %228 = add i64 %pgocount30, 1
  store i64 %228, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_tmp1.ll_leftmatch, i64 0, i64 6)
  store i32 1, i32* %3, align 4
  br label %229

; <label>:229:                                    ; preds = %227, %214, %206, %183, %112, %76, %60, %13
  %230 = load i32, i32* %3, align 4
  ret i32 %230
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @rightmatch(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 5)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 5)
  store i32 1, i32* %3, align 4
  br label %300

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %4, align 8
  store i8* %15, i8** %6, align 8
  %16 = load i8*, i8** %5, align 8
  store i8* %16, i8** %7, align 8
  %17 = load i8*, i8** %4, align 8
  store i8* %17, i8** %6, align 8
  br label %18

; <label>:18:                                     ; preds = %295, %14
  %19 = load i8*, i8** %6, align 8
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %298

; <label>:23:                                     ; preds = %18
  %24 = call i16** @__ctype_b_loc() #6
  %25 = load i16*, i16** %24, align 8
  %26 = load i8*, i8** %6, align 8
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i16, i16* %25, i64 %29
  %31 = load i16, i16* %30, align 2
  %32 = zext i16 %31 to i32
  %33 = and i32 %32, 1024
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %47, label %35

; <label>:35:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 3)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 3)
  %37 = load i8*, i8** %6, align 8
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 39
  br i1 %40, label %47, label %41

; <label>:41:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 4)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 4)
  %43 = load i8*, i8** %6, align 8
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 32
  br i1 %46, label %47, label %61

; <label>:47:                                     ; preds = %41, %35, %23
  %48 = load i8*, i8** %6, align 8
  %49 = load i8, i8* %48, align 1
  %50 = sext i8 %49 to i32
  %51 = load i8*, i8** %7, align 8
  %52 = load i8, i8* %51, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp ne i32 %50, %53
  br i1 %54, label %55, label %57

; <label>:55:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 7)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 7)
  store i32 0, i32* %3, align 4
  br label %300

; <label>:57:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 0)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 0)
  %59 = load i8*, i8** %7, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %7, align 8
  br label %295

; <label>:61:                                     ; preds = %41
  %62 = load i8*, i8** %6, align 8
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  switch i32 %64, label %287 [
    i32 35, label %65
    i32 58, label %88
    i32 94, label %101
    i32 46, label %113
    i32 43, label %184
    i32 37, label %207
  ]

; <label>:65:                                     ; preds = %61
  %66 = load i8*, i8** %7, align 8
  %67 = load i8, i8* %66, align 1
  %68 = sext i8 %67 to i32
  %69 = call i32 @isvowel(i32 %68)
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %73, label %71

; <label>:71:                                     ; preds = %65
  %pgocount5 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 27)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 27)
  store i32 0, i32* %3, align 4
  br label %300

; <label>:73:                                     ; preds = %65
  %pgocount6 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 11)
  %74 = add i64 %pgocount6, 1
  store i64 %74, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 11)
  %75 = load i8*, i8** %7, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %7, align 8
  br label %77

; <label>:77:                                     ; preds = %83, %73
  %78 = load i8*, i8** %7, align 8
  %79 = load i8, i8* %78, align 1
  %80 = sext i8 %79 to i32
  %81 = call i32 @isvowel(i32 %80)
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %77
  %pgocount7 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 2)
  %84 = add i64 %pgocount7, 1
  store i64 %84, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 2)
  %85 = load i8*, i8** %7, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %86, i8** %7, align 8
  br label %77

; <label>:87:                                     ; preds = %77
  br label %294

; <label>:88:                                     ; preds = %61
  br label %89

; <label>:89:                                     ; preds = %95, %88
  %90 = load i8*, i8** %7, align 8
  %91 = load i8, i8* %90, align 1
  %92 = sext i8 %91 to i32
  %93 = call i32 @isconsonant(i32 %92)
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %99

; <label>:95:                                     ; preds = %89
  %pgocount8 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 1)
  %96 = add i64 %pgocount8, 1
  store i64 %96, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 1)
  %97 = load i8*, i8** %7, align 8
  %98 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %98, i8** %7, align 8
  br label %89

; <label>:99:                                     ; preds = %89
  %pgocount9 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 8)
  %100 = add i64 %pgocount9, 1
  store i64 %100, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 8)
  br label %294

; <label>:101:                                    ; preds = %61
  %102 = load i8*, i8** %7, align 8
  %103 = load i8, i8* %102, align 1
  %104 = sext i8 %103 to i32
  %105 = call i32 @isconsonant(i32 %104)
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %109, label %107

; <label>:107:                                    ; preds = %101
  %pgocount10 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 28)
  %108 = add i64 %pgocount10, 1
  store i64 %108, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 28)
  store i32 0, i32* %3, align 4
  br label %300

; <label>:109:                                    ; preds = %101
  %pgocount11 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 12)
  %110 = add i64 %pgocount11, 1
  store i64 %110, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 12)
  %111 = load i8*, i8** %7, align 8
  %112 = getelementptr inbounds i8, i8* %111, i32 1
  store i8* %112, i8** %7, align 8
  br label %294

; <label>:113:                                    ; preds = %61
  %114 = load i8*, i8** %7, align 8
  %115 = load i8, i8* %114, align 1
  %116 = sext i8 %115 to i32
  %117 = icmp ne i32 %116, 66
  br i1 %117, label %118, label %180

; <label>:118:                                    ; preds = %113
  %pgocount12 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 13)
  %119 = add i64 %pgocount12, 1
  store i64 %119, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 13)
  %120 = load i8*, i8** %7, align 8
  %121 = load i8, i8* %120, align 1
  %122 = sext i8 %121 to i32
  %123 = icmp ne i32 %122, 68
  br i1 %123, label %124, label %180

; <label>:124:                                    ; preds = %118
  %pgocount13 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 16)
  %125 = add i64 %pgocount13, 1
  store i64 %125, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 16)
  %126 = load i8*, i8** %7, align 8
  %127 = load i8, i8* %126, align 1
  %128 = sext i8 %127 to i32
  %129 = icmp ne i32 %128, 86
  br i1 %129, label %130, label %180

; <label>:130:                                    ; preds = %124
  %pgocount14 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 21)
  %131 = add i64 %pgocount14, 1
  store i64 %131, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 21)
  %132 = load i8*, i8** %7, align 8
  %133 = load i8, i8* %132, align 1
  %134 = sext i8 %133 to i32
  %135 = icmp ne i32 %134, 71
  br i1 %135, label %136, label %180

; <label>:136:                                    ; preds = %130
  %pgocount15 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 25)
  %137 = add i64 %pgocount15, 1
  store i64 %137, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 25)
  %138 = load i8*, i8** %7, align 8
  %139 = load i8, i8* %138, align 1
  %140 = sext i8 %139 to i32
  %141 = icmp ne i32 %140, 74
  br i1 %141, label %142, label %180

; <label>:142:                                    ; preds = %136
  %pgocount16 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 29)
  %143 = add i64 %pgocount16, 1
  store i64 %143, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 29)
  %144 = load i8*, i8** %7, align 8
  %145 = load i8, i8* %144, align 1
  %146 = sext i8 %145 to i32
  %147 = icmp ne i32 %146, 76
  br i1 %147, label %148, label %180

; <label>:148:                                    ; preds = %142
  %pgocount17 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 31)
  %149 = add i64 %pgocount17, 1
  store i64 %149, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 31)
  %150 = load i8*, i8** %7, align 8
  %151 = load i8, i8* %150, align 1
  %152 = sext i8 %151 to i32
  %153 = icmp ne i32 %152, 77
  br i1 %153, label %154, label %180

; <label>:154:                                    ; preds = %148
  %pgocount18 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 34)
  %155 = add i64 %pgocount18, 1
  store i64 %155, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 34)
  %156 = load i8*, i8** %7, align 8
  %157 = load i8, i8* %156, align 1
  %158 = sext i8 %157 to i32
  %159 = icmp ne i32 %158, 78
  br i1 %159, label %160, label %180

; <label>:160:                                    ; preds = %154
  %pgocount19 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 36)
  %161 = add i64 %pgocount19, 1
  store i64 %161, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 36)
  %162 = load i8*, i8** %7, align 8
  %163 = load i8, i8* %162, align 1
  %164 = sext i8 %163 to i32
  %165 = icmp ne i32 %164, 82
  br i1 %165, label %166, label %180

; <label>:166:                                    ; preds = %160
  %pgocount20 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 37)
  %167 = add i64 %pgocount20, 1
  store i64 %167, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 37)
  %168 = load i8*, i8** %7, align 8
  %169 = load i8, i8* %168, align 1
  %170 = sext i8 %169 to i32
  %171 = icmp ne i32 %170, 87
  br i1 %171, label %172, label %180

; <label>:172:                                    ; preds = %166
  %pgocount21 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 38)
  %173 = add i64 %pgocount21, 1
  store i64 %173, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 38)
  %174 = load i8*, i8** %7, align 8
  %175 = load i8, i8* %174, align 1
  %176 = sext i8 %175 to i32
  %177 = icmp ne i32 %176, 90
  br i1 %177, label %178, label %180

; <label>:178:                                    ; preds = %172
  %pgocount22 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 39)
  %179 = add i64 %pgocount22, 1
  store i64 %179, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 39)
  store i32 0, i32* %3, align 4
  br label %300

; <label>:180:                                    ; preds = %172, %166, %160, %154, %148, %142, %136, %130, %124, %118, %113
  %pgocount23 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 9)
  %181 = add i64 %pgocount23, 1
  store i64 %181, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 9)
  %182 = load i8*, i8** %7, align 8
  %183 = getelementptr inbounds i8, i8* %182, i32 1
  store i8* %183, i8** %7, align 8
  br label %294

; <label>:184:                                    ; preds = %61
  %185 = load i8*, i8** %7, align 8
  %186 = load i8, i8* %185, align 1
  %187 = sext i8 %186 to i32
  %188 = icmp ne i32 %187, 69
  br i1 %188, label %189, label %203

; <label>:189:                                    ; preds = %184
  %pgocount24 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 14)
  %190 = add i64 %pgocount24, 1
  store i64 %190, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 14)
  %191 = load i8*, i8** %7, align 8
  %192 = load i8, i8* %191, align 1
  %193 = sext i8 %192 to i32
  %194 = icmp ne i32 %193, 73
  br i1 %194, label %195, label %203

; <label>:195:                                    ; preds = %189
  %pgocount25 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 17)
  %196 = add i64 %pgocount25, 1
  store i64 %196, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 17)
  %197 = load i8*, i8** %7, align 8
  %198 = load i8, i8* %197, align 1
  %199 = sext i8 %198 to i32
  %200 = icmp ne i32 %199, 89
  br i1 %200, label %201, label %203

; <label>:201:                                    ; preds = %195
  %pgocount26 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 35)
  %202 = add i64 %pgocount26, 1
  store i64 %202, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 35)
  store i32 0, i32* %3, align 4
  br label %300

; <label>:203:                                    ; preds = %195, %189, %184
  %pgocount27 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 10)
  %204 = add i64 %pgocount27, 1
  store i64 %204, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 10)
  %205 = load i8*, i8** %7, align 8
  %206 = getelementptr inbounds i8, i8* %205, i32 1
  store i8* %206, i8** %7, align 8
  br label %294

; <label>:207:                                    ; preds = %61
  %208 = load i8*, i8** %7, align 8
  %209 = load i8, i8* %208, align 1
  %210 = sext i8 %209 to i32
  %211 = icmp eq i32 %210, 69
  br i1 %211, label %212, label %258

; <label>:212:                                    ; preds = %207
  %213 = load i8*, i8** %7, align 8
  %214 = getelementptr inbounds i8, i8* %213, i32 1
  store i8* %214, i8** %7, align 8
  %215 = load i8*, i8** %7, align 8
  %216 = load i8, i8* %215, align 1
  %217 = sext i8 %216 to i32
  %218 = icmp eq i32 %217, 76
  br i1 %218, label %219, label %234

; <label>:219:                                    ; preds = %212
  %220 = load i8*, i8** %7, align 8
  %221 = getelementptr inbounds i8, i8* %220, i32 1
  store i8* %221, i8** %7, align 8
  %222 = load i8*, i8** %7, align 8
  %223 = load i8, i8* %222, align 1
  %224 = sext i8 %223 to i32
  %225 = icmp eq i32 %224, 89
  br i1 %225, label %226, label %230

; <label>:226:                                    ; preds = %219
  %pgocount28 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 22)
  %227 = add i64 %pgocount28, 1
  store i64 %227, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 22)
  %228 = load i8*, i8** %7, align 8
  %229 = getelementptr inbounds i8, i8* %228, i32 1
  store i8* %229, i8** %7, align 8
  br label %294

; <label>:230:                                    ; preds = %219
  %pgocount29 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 23)
  %231 = add i64 %pgocount29, 1
  store i64 %231, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 23)
  %232 = load i8*, i8** %7, align 8
  %233 = getelementptr inbounds i8, i8* %232, i32 -1
  store i8* %233, i8** %7, align 8
  br label %294

; <label>:234:                                    ; preds = %212
  %235 = load i8*, i8** %7, align 8
  %236 = load i8, i8* %235, align 1
  %237 = sext i8 %236 to i32
  %238 = icmp eq i32 %237, 82
  br i1 %238, label %251, label %239

; <label>:239:                                    ; preds = %234
  %pgocount30 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 24)
  %240 = add i64 %pgocount30, 1
  store i64 %240, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 24)
  %241 = load i8*, i8** %7, align 8
  %242 = load i8, i8* %241, align 1
  %243 = sext i8 %242 to i32
  %244 = icmp eq i32 %243, 83
  br i1 %244, label %251, label %245

; <label>:245:                                    ; preds = %239
  %pgocount31 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 26)
  %246 = add i64 %pgocount31, 1
  store i64 %246, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 26)
  %247 = load i8*, i8** %7, align 8
  %248 = load i8, i8* %247, align 1
  %249 = sext i8 %248 to i32
  %250 = icmp eq i32 %249, 68
  br i1 %250, label %251, label %255

; <label>:251:                                    ; preds = %245, %239, %234
  %pgocount32 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 19)
  %252 = add i64 %pgocount32, 1
  store i64 %252, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 19)
  %253 = load i8*, i8** %7, align 8
  %254 = getelementptr inbounds i8, i8* %253, i32 1
  store i8* %254, i8** %7, align 8
  br label %255

; <label>:255:                                    ; preds = %251, %245
  br label %256

; <label>:256:                                    ; preds = %255
  %pgocount33 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 18)
  %257 = add i64 %pgocount33, 1
  store i64 %257, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 18)
  br label %294

; <label>:258:                                    ; preds = %207
  %259 = load i8*, i8** %7, align 8
  %260 = load i8, i8* %259, align 1
  %261 = sext i8 %260 to i32
  %262 = icmp eq i32 %261, 73
  br i1 %262, label %263, label %285

; <label>:263:                                    ; preds = %258
  %264 = load i8*, i8** %7, align 8
  %265 = getelementptr inbounds i8, i8* %264, i32 1
  store i8* %265, i8** %7, align 8
  %266 = load i8*, i8** %7, align 8
  %267 = load i8, i8* %266, align 1
  %268 = sext i8 %267 to i32
  %269 = icmp eq i32 %268, 78
  br i1 %269, label %270, label %283

; <label>:270:                                    ; preds = %263
  %271 = load i8*, i8** %7, align 8
  %272 = getelementptr inbounds i8, i8* %271, i32 1
  store i8* %272, i8** %7, align 8
  %273 = load i8*, i8** %7, align 8
  %274 = load i8, i8* %273, align 1
  %275 = sext i8 %274 to i32
  %276 = icmp eq i32 %275, 71
  br i1 %276, label %277, label %281

; <label>:277:                                    ; preds = %270
  %pgocount34 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 15)
  %278 = add i64 %pgocount34, 1
  store i64 %278, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 15)
  %279 = load i8*, i8** %7, align 8
  %280 = getelementptr inbounds i8, i8* %279, i32 1
  store i8* %280, i8** %7, align 8
  br label %294

; <label>:281:                                    ; preds = %270
  %pgocount35 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 33)
  %282 = add i64 %pgocount35, 1
  store i64 %282, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 33)
  br label %283

; <label>:283:                                    ; preds = %281, %263
  %pgocount36 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 30)
  %284 = add i64 %pgocount36, 1
  store i64 %284, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 30)
  store i32 0, i32* %3, align 4
  br label %300

; <label>:285:                                    ; preds = %258
  %pgocount37 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 32)
  %286 = add i64 %pgocount37, 1
  store i64 %286, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 32)
  store i32 0, i32* %3, align 4
  br label %300

; <label>:287:                                    ; preds = %61
  %pgocount38 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 20)
  %288 = add i64 %pgocount38, 1
  store i64 %288, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 20)
  %289 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %290 = load i8*, i8** %6, align 8
  %291 = load i8, i8* %290, align 1
  %292 = sext i8 %291 to i32
  %293 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %289, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0), i32 %292)
  store i32 0, i32* %3, align 4
  br label %300

; <label>:294:                                    ; preds = %277, %256, %230, %226, %203, %180, %109, %99, %87
  br label %295

; <label>:295:                                    ; preds = %294, %57
  %296 = load i8*, i8** %6, align 8
  %297 = getelementptr inbounds i8, i8* %296, i32 1
  store i8* %297, i8** %6, align 8
  br label %18

; <label>:298:                                    ; preds = %18
  %pgocount39 = load i64, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 6)
  %299 = add i64 %pgocount39, 1
  store i64 %299, i64* getelementptr inbounds ([40 x i64], [40 x i64]* @__profc_tmp1.ll_rightmatch, i64 0, i64 6)
  store i32 1, i32* %3, align 4
  br label %300

; <label>:300:                                    ; preds = %298, %287, %285, %283, %201, %178, %107, %71, %55, %12
  %301 = load i32, i32* %3, align 4
  ret i32 %301
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

declare i32 @phone_append(%struct.darray_t*, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #5

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
