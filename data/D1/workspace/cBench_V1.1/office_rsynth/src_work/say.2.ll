; ModuleID = 'tmp1.ll'
source_filename = "say.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.klatt_global_t = type { i32, i32, i32, i32, i64, i64, i64, i64 }
%struct.darray_t = type { i8*, i32, i32, i16, i16 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [60 x i8] c"$Id: say.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@say_id = global i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str, i32 0, i32 0), align 8
@.str.1 = private unnamed_addr constant [4 x i8] c"say\00", align 1
@program = global i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [17 x i8] c"Spelling '%.*s'\0A\00", align 1
@ASCII = external global [0 x i8*], align 8
@klatt_global = external global %struct.klatt_global_t, align 8
@.str.3 = private unnamed_addr constant [6 x i8] c"%.*s\0A\00", align 1
@file_write = external global void (i32, i16*)*, align 8
@once = internal global i32 0, align 4
@.str.4 = private unnamed_addr constant [6 x i8] c"point\00", align 1
@verbose = internal global i32 0, align 4
@.str.5 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"Misc\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@.str.11 = private unnamed_addr constant [28 x i8] c"Verbose, show phonetic form\00", align 1
@help_only = external global i32, align 4
@.str.12 = private unnamed_addr constant [43 x i8] c"Usage: %s [options as above] words to say\0A\00", align 1
@.str.13 = private unnamed_addr constant [44 x i8] c"or     %s [options as above] < file-to-say\0A\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"(%s)\0A\00", align 1
@Revision = external global i8*, align 8
@stdin = external global %struct._IO_FILE*, align 8
@file_term = external global void ()*, align 8
@dict = external global i8*, align 8
@dialect = external global i8**, align 8
@.str.15 = private unnamed_addr constant [17 x i8] c"Guess %p '%.*s'\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_spell_out = private constant [9 x i8] c"spell_out"
@__profn_xlate_string = private constant [12 x i8] c"xlate_string"
@__profn_suspect_word = private constant [12 x i8] c"suspect_word"
@__profn_say_phones = private constant [10 x i8] c"say_phones"
@__profn_tmp1.ll_darray_init = private constant [19 x i8] c"tmp1.ll:darray_init"
@__profn_tmp1.ll_darray_find = private constant [19 x i8] c"tmp1.ll:darray_find"
@__profn_tmp1.ll_xlate_word = private constant [18 x i8] c"tmp1.ll:xlate_word"
@__profn_concat_args = private constant [11 x i8] c"concat_args"
@__profn_say_string = private constant [10 x i8] c"say_string"
@__profn_darray_fget = private constant [11 x i8] c"darray_fget"
@__profn_say_file = private constant [8 x i8] c"say_file"
@__profn_main = private constant [4 x i8] c"main"
@__profc_spell_out = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_spell_out = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2049180097302435038, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_spell_out, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, %struct.darray_t*)* @spell_out to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_xlate_string = private global [50 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_xlate_string = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4053021336585319642, i64 72058164701870591, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.darray_t*)* @xlate_string to i8*), i8* null, i32 50, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_suspect_word = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_suspect_word = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4422314967605836697, i64 160541415325, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i32 0, i32 0), i8* bitcast (i32 (i8*, i32)* @suspect_word to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_say_phones = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_say_phones = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_say_phones = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5478147910850334769, i64 281545955320979, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32)* @say_phones to i8*), i8* bitcast ([1 x i64]* @__profvp_say_phones to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_darray_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_darray_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8473163803832655679, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_darray_init, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_darray_find = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_darray_find = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4594349971239127650, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_xlate_word = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_xlate_word = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5126096581624902080, i64 210150288393, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_concat_args = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_concat_args = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7356582683883550835, i64 96010343569, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i32 0, i32 0), i8* bitcast (i8* (i32, i8**)* @concat_args to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_say_string = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_say_string = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -829547572616072654, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_say_string, i32 0, i32 0), i8* bitcast (void (i8*)* @say_string to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_darray_fget = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_darray_fget = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2370055618975958641, i64 42164326106, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_darray_fget, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct.darray_t*)* @darray_fget to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_say_file = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_say_file = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5571988749288803597, i64 88987879704, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i32 0, i32 0), i8* bitcast (void (%struct._IO_FILE*)* @say_file to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_main = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 281558874200000, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**, i8**)* @main to i8*), i8* bitcast ([1 x i64]* @__profvp_main to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [157 x i8] c"\9A\01\00spell_out\01xlate_string\01suspect_word\01say_phones\01tmp1.ll:darray_init\01tmp1.ll:darray_find\01tmp1.ll:xlate_word\01concat_args\01say_string\01darray_fget\01say_file\01main", section "__llvm_prf_names"
@llvm.used = appending global [14 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_spell_out to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_xlate_string to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_suspect_word to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_say_phones to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_darray_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_darray_find to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_xlate_word to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_concat_args to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_say_string to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_darray_fget to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_say_file to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([157 x i8], [157 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @spell_out(i8*, i32, %struct.darray_t*) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.darray_t*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.darray_t* %2, %struct.darray_t** %6, align 8
  store i32 0, i32* %7, align 4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = load i32, i32* %5, align 4
  %10 = load i8*, i8** %4, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), i32 %9, i8* %10)
  br label %12

; <label>:12:                                     ; preds = %16, %3
  %13 = load i32, i32* %5, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %5, align 4
  %15 = icmp sgt i32 %13, 0
  br i1 %15, label %16, label %30

; <label>:16:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_spell_out, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_spell_out, i64 0, i64 0)
  %18 = load i8*, i8** %4, align 8
  %19 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %19, i8** %4, align 8
  %20 = load i8, i8* %18, align 1
  %21 = sext i8 %20 to i32
  %22 = and i32 %21, 127
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [0 x i8*], [0 x i8*]* @ASCII, i64 0, i64 %23
  %25 = load i8*, i8** %24, align 8
  %26 = load %struct.darray_t*, %struct.darray_t** %6, align 8
  %27 = call i32 @xlate_string(i8* %25, %struct.darray_t* %26)
  %28 = load i32, i32* %7, align 4
  %29 = add i32 %28, %27
  store i32 %29, i32* %7, align 4
  br label %12

; <label>:30:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_spell_out, i64 0, i64 1)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_spell_out, i64 0, i64 1)
  %32 = load i32, i32* %7, align 4
  ret i32 %32
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define i32 @xlate_string(i8*, %struct.darray_t*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.darray_t*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i8, align 1
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store %struct.darray_t* %1, %struct.darray_t** %4, align 8
  store i32 0, i32* %5, align 4
  %13 = load i8*, i8** %3, align 8
  store i8* %13, i8** %6, align 8
  br label %14

; <label>:14:                                     ; preds = %26, %2
  %15 = call i16** @__ctype_b_loc() #7
  %16 = load i16*, i16** %15, align 8
  %17 = load i8*, i8** %6, align 8
  %18 = load i8, i8* %17, align 1
  store i8 %18, i8* %7, align 1
  %19 = sext i8 %18 to i32
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, i16* %16, i64 %20
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = and i32 %23, 8192
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 23)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 23)
  %28 = load i8*, i8** %6, align 8
  %29 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %29, i8** %6, align 8
  br label %14

; <label>:30:                                     ; preds = %14
  br label %31

; <label>:31:                                     ; preds = %554, %30
  %32 = load i8*, i8** %6, align 8
  %33 = load i8, i8* %32, align 1
  store i8 %33, i8* %7, align 1
  %34 = icmp ne i8 %33, 0
  br i1 %34, label %35, label %555

; <label>:35:                                     ; preds = %31
  %36 = load i8*, i8** %6, align 8
  store i8* %36, i8** %8, align 8
  %37 = call i16** @__ctype_b_loc() #7
  %38 = load i16*, i16** %37, align 8
  %39 = load i8, i8* %7, align 1
  %40 = sext i8 %39 to i32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16, i16* %38, i64 %41
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = and i32 %44, 1024
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %211

; <label>:47:                                     ; preds = %35
  br label %48

; <label>:48:                                     ; preds = %93, %47
  %49 = call i16** @__ctype_b_loc() #7
  %50 = load i16*, i16** %49, align 8
  %51 = load i8*, i8** %6, align 8
  %52 = load i8, i8* %51, align 1
  store i8 %52, i8* %7, align 1
  %53 = sext i8 %52 to i32
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i16, i16* %50, i64 %54
  %56 = load i16, i16* %55, align 2
  %57 = zext i16 %56 to i32
  %58 = and i32 %57, 1024
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %91, label %60

; <label>:60:                                     ; preds = %48
  %61 = load i8, i8* %7, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp eq i32 %62, 39
  br i1 %63, label %74, label %64

; <label>:64:                                     ; preds = %60
  %pgocount9 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 14)
  %65 = add i64 %pgocount9, 1
  store i64 %65, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 14)
  %66 = load i8, i8* %7, align 1
  %67 = sext i8 %66 to i32
  %68 = icmp eq i32 %67, 45
  br i1 %68, label %74, label %69

; <label>:69:                                     ; preds = %64
  %pgocount10 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 16)
  %70 = add i64 %pgocount10, 1
  store i64 %70, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 16)
  %71 = load i8, i8* %7, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp eq i32 %72, 46
  br i1 %73, label %74, label %88

; <label>:74:                                     ; preds = %69, %64, %60
  %pgocount11 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 4)
  %75 = add i64 %pgocount11, 1
  store i64 %75, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 4)
  %76 = call i16** @__ctype_b_loc() #7
  %77 = load i16*, i16** %76, align 8
  %78 = load i8*, i8** %6, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 1
  %80 = load i8, i8* %79, align 1
  %81 = sext i8 %80 to i32
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i16, i16* %77, i64 %82
  %84 = load i16, i16* %83, align 2
  %85 = zext i16 %84 to i32
  %86 = and i32 %85, 1024
  %87 = icmp ne i32 %86, 0
  br label %88

; <label>:88:                                     ; preds = %74, %69
  %89 = phi i1 [ false, %69 ], [ %87, %74 ]
  %pgocount12 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 3)
  %90 = add i64 %pgocount12, 1
  store i64 %90, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 3)
  br label %91

; <label>:91:                                     ; preds = %88, %48
  %92 = phi i1 [ true, %48 ], [ %89, %88 ]
  br i1 %92, label %93, label %97

; <label>:93:                                     ; preds = %91
  %pgocount13 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 1)
  %94 = add i64 %pgocount13, 1
  store i64 %94, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 1)
  %95 = load i8*, i8** %6, align 8
  %96 = getelementptr inbounds i8, i8* %95, i32 1
  store i8* %96, i8** %6, align 8
  br label %48

; <label>:97:                                     ; preds = %91
  %98 = load i8, i8* %7, align 1
  %99 = icmp ne i8 %98, 0
  br i1 %99, label %100, label %147

; <label>:100:                                    ; preds = %97
  %pgocount14 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 26)
  %101 = add i64 %pgocount14, 1
  store i64 %101, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 26)
  %102 = call i16** @__ctype_b_loc() #7
  %103 = load i16*, i16** %102, align 8
  %104 = load i8, i8* %7, align 1
  %105 = sext i8 %104 to i32
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i16, i16* %103, i64 %106
  %108 = load i16, i16* %107, align 2
  %109 = zext i16 %108 to i32
  %110 = and i32 %109, 8192
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %147, label %112

; <label>:112:                                    ; preds = %100
  %pgocount15 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 29)
  %113 = add i64 %pgocount15, 1
  store i64 %113, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 29)
  %114 = call i16** @__ctype_b_loc() #7
  %115 = load i16*, i16** %114, align 8
  %116 = load i8, i8* %7, align 1
  %117 = sext i8 %116 to i32
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i16, i16* %115, i64 %118
  %120 = load i16, i16* %119, align 2
  %121 = zext i16 %120 to i32
  %122 = and i32 %121, 4
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %147, label %124

; <label>:124:                                    ; preds = %112
  %pgocount16 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 35)
  %125 = add i64 %pgocount16, 1
  store i64 %125, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 35)
  %126 = call i16** @__ctype_b_loc() #7
  %127 = load i16*, i16** %126, align 8
  %128 = load i8, i8* %7, align 1
  %129 = sext i8 %128 to i32
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i16, i16* %127, i64 %130
  %132 = load i16, i16* %131, align 2
  %133 = zext i16 %132 to i32
  %134 = and i32 %133, 2048
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %160

; <label>:136:                                    ; preds = %124
  %pgocount17 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 40)
  %137 = add i64 %pgocount17, 1
  store i64 %137, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 40)
  %138 = load i8*, i8** %8, align 8
  %139 = load i8*, i8** %6, align 8
  %140 = load i8*, i8** %8, align 8
  %141 = ptrtoint i8* %139 to i64
  %142 = ptrtoint i8* %140 to i64
  %143 = sub i64 %141, %142
  %144 = trunc i64 %143 to i32
  %145 = call i32 @suspect_word(i8* %138, i32 %144)
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %160, label %147

; <label>:147:                                    ; preds = %136, %112, %100, %97
  %pgocount18 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 25)
  %148 = add i64 %pgocount18, 1
  store i64 %148, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 25)
  %149 = load i8*, i8** %8, align 8
  %150 = load i8*, i8** %6, align 8
  %151 = load i8*, i8** %8, align 8
  %152 = ptrtoint i8* %150 to i64
  %153 = ptrtoint i8* %151 to i64
  %154 = sub i64 %152, %153
  %155 = trunc i64 %154 to i32
  %156 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %157 = call i32 @xlate_word(i8* %149, i32 %155, %struct.darray_t* %156)
  %158 = load i32, i32* %5, align 4
  %159 = add i32 %158, %157
  store i32 %159, i32* %5, align 4
  br label %210

; <label>:160:                                    ; preds = %136, %124
  br label %161

; <label>:161:                                    ; preds = %193, %160
  %162 = load i8*, i8** %6, align 8
  %163 = load i8, i8* %162, align 1
  store i8 %163, i8* %7, align 1
  %164 = sext i8 %163 to i32
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %191

; <label>:166:                                    ; preds = %161
  %pgocount19 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 21)
  %167 = add i64 %pgocount19, 1
  store i64 %167, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 21)
  %168 = call i16** @__ctype_b_loc() #7
  %169 = load i16*, i16** %168, align 8
  %170 = load i8, i8* %7, align 1
  %171 = sext i8 %170 to i32
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i16, i16* %169, i64 %172
  %174 = load i16, i16* %173, align 2
  %175 = zext i16 %174 to i32
  %176 = and i32 %175, 8192
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %191, label %178

; <label>:178:                                    ; preds = %166
  %pgocount20 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 24)
  %179 = add i64 %pgocount20, 1
  store i64 %179, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 24)
  %180 = call i16** @__ctype_b_loc() #7
  %181 = load i16*, i16** %180, align 8
  %182 = load i8, i8* %7, align 1
  %183 = sext i8 %182 to i32
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i16, i16* %181, i64 %184
  %186 = load i16, i16* %185, align 2
  %187 = zext i16 %186 to i32
  %188 = and i32 %187, 4
  %189 = icmp ne i32 %188, 0
  %190 = xor i1 %189, true
  br label %191

; <label>:191:                                    ; preds = %178, %166, %161
  %192 = phi i1 [ false, %166 ], [ false, %161 ], [ %190, %178 ]
  br i1 %192, label %193, label %197

; <label>:193:                                    ; preds = %191
  %pgocount21 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 18)
  %194 = add i64 %pgocount21, 1
  store i64 %194, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 18)
  %195 = load i8*, i8** %6, align 8
  %196 = getelementptr inbounds i8, i8* %195, i32 1
  store i8* %196, i8** %6, align 8
  br label %161

; <label>:197:                                    ; preds = %191
  %pgocount22 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 38)
  %198 = add i64 %pgocount22, 1
  store i64 %198, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 38)
  %199 = load i8*, i8** %8, align 8
  %200 = load i8*, i8** %6, align 8
  %201 = load i8*, i8** %8, align 8
  %202 = ptrtoint i8* %200 to i64
  %203 = ptrtoint i8* %201 to i64
  %204 = sub i64 %202, %203
  %205 = trunc i64 %204 to i32
  %206 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %207 = call i32 @spell_out(i8* %199, i32 %205, %struct.darray_t* %206)
  %208 = load i32, i32* %5, align 4
  %209 = add i32 %208, %207
  store i32 %209, i32* %5, align 4
  br label %210

; <label>:210:                                    ; preds = %197, %147
  br label %537

; <label>:211:                                    ; preds = %35
  %212 = call i16** @__ctype_b_loc() #7
  %213 = load i16*, i16** %212, align 8
  %214 = load i8, i8* %7, align 1
  %215 = sext i8 %214 to i32
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i16, i16* %213, i64 %216
  %218 = load i16, i16* %217, align 2
  %219 = zext i16 %218 to i32
  %220 = and i32 %219, 2048
  %221 = icmp ne i32 %220, 0
  br i1 %221, label %241, label %222

; <label>:222:                                    ; preds = %211
  %pgocount23 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 27)
  %223 = add i64 %pgocount23, 1
  store i64 %223, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 27)
  %224 = load i8, i8* %7, align 1
  %225 = sext i8 %224 to i32
  %226 = icmp eq i32 %225, 45
  br i1 %226, label %227, label %351

; <label>:227:                                    ; preds = %222
  %pgocount24 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 31)
  %228 = add i64 %pgocount24, 1
  store i64 %228, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 31)
  %229 = call i16** @__ctype_b_loc() #7
  %230 = load i16*, i16** %229, align 8
  %231 = load i8*, i8** %6, align 8
  %232 = getelementptr inbounds i8, i8* %231, i64 1
  %233 = load i8, i8* %232, align 1
  %234 = sext i8 %233 to i32
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i16, i16* %230, i64 %235
  %237 = load i16, i16* %236, align 2
  %238 = zext i16 %237 to i32
  %239 = and i32 %238, 2048
  %240 = icmp ne i32 %239, 0
  br i1 %240, label %241, label %351

; <label>:241:                                    ; preds = %227, %211
  %242 = load i8, i8* %7, align 1
  %243 = sext i8 %242 to i32
  %244 = icmp eq i32 %243, 45
  %245 = zext i1 %244 to i64
  %pgocount25 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 49)
  %246 = add i64 %pgocount25, %245
  store i64 %246, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 49)
  %247 = select i1 %244, i32 -1, i32 1
  store i32 %247, i32* %9, align 4
  store i64 0, i64* %10, align 8
  %248 = load i32, i32* %9, align 4
  %249 = icmp slt i32 %248, 0
  br i1 %249, label %250, label %255

; <label>:250:                                    ; preds = %241
  %pgocount26 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 32)
  %251 = add i64 %pgocount26, 1
  store i64 %251, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 32)
  %252 = load i8*, i8** %6, align 8
  %253 = getelementptr inbounds i8, i8* %252, i32 1
  store i8* %253, i8** %6, align 8
  %254 = load i8, i8* %253, align 1
  store i8 %254, i8* %7, align 1
  br label %255

; <label>:255:                                    ; preds = %250, %241
  br label %256

; <label>:256:                                    ; preds = %268, %255
  %257 = call i16** @__ctype_b_loc() #7
  %258 = load i16*, i16** %257, align 8
  %259 = load i8*, i8** %6, align 8
  %260 = load i8, i8* %259, align 1
  store i8 %260, i8* %7, align 1
  %261 = sext i8 %260 to i32
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds i16, i16* %258, i64 %262
  %264 = load i16, i16* %263, align 2
  %265 = zext i16 %264 to i32
  %266 = and i32 %265, 2048
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %278

; <label>:268:                                    ; preds = %256
  %pgocount27 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 2)
  %269 = add i64 %pgocount27, 1
  store i64 %269, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 2)
  %270 = load i64, i64* %10, align 8
  %271 = mul nsw i64 %270, 10
  %272 = load i8, i8* %7, align 1
  %273 = sext i8 %272 to i64
  %274 = add nsw i64 %271, %273
  %275 = sub nsw i64 %274, 48
  store i64 %275, i64* %10, align 8
  %276 = load i8*, i8** %6, align 8
  %277 = getelementptr inbounds i8, i8* %276, i32 1
  store i8* %277, i8** %6, align 8
  br label %256

; <label>:278:                                    ; preds = %256
  %279 = load i8, i8* %7, align 1
  %280 = sext i8 %279 to i32
  %281 = icmp eq i32 %280, 46
  br i1 %281, label %282, label %340

; <label>:282:                                    ; preds = %278
  %pgocount28 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 30)
  %283 = add i64 %pgocount28, 1
  store i64 %283, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 30)
  %284 = call i16** @__ctype_b_loc() #7
  %285 = load i16*, i16** %284, align 8
  %286 = load i8*, i8** %6, align 8
  %287 = getelementptr inbounds i8, i8* %286, i64 1
  %288 = load i8, i8* %287, align 1
  %289 = sext i8 %288 to i32
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i16, i16* %285, i64 %290
  %292 = load i16, i16* %291, align 2
  %293 = zext i16 %292 to i32
  %294 = and i32 %293, 2048
  %295 = icmp ne i32 %294, 0
  br i1 %295, label %296, label %340

; <label>:296:                                    ; preds = %282
  %297 = load i8*, i8** %6, align 8
  %298 = getelementptr inbounds i8, i8* %297, i32 1
  store i8* %298, i8** %6, align 8
  store i8* %298, i8** %8, align 8
  %299 = load i64, i64* %10, align 8
  %300 = load i32, i32* %9, align 4
  %301 = sext i32 %300 to i64
  %302 = mul nsw i64 %299, %301
  %303 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %304 = call i32 @xlate_cardinal(i64 %302, %struct.darray_t* %303)
  %305 = load i32, i32* %5, align 4
  %306 = add i32 %305, %304
  store i32 %306, i32* %5, align 4
  %307 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %308 = call i32 @xlate_string(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), %struct.darray_t* %307)
  %309 = load i32, i32* %5, align 4
  %310 = add i32 %309, %308
  store i32 %310, i32* %5, align 4
  br label %311

; <label>:311:                                    ; preds = %323, %296
  %312 = call i16** @__ctype_b_loc() #7
  %313 = load i16*, i16** %312, align 8
  %314 = load i8*, i8** %6, align 8
  %315 = load i8, i8* %314, align 1
  store i8 %315, i8* %7, align 1
  %316 = sext i8 %315 to i32
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds i16, i16* %313, i64 %317
  %319 = load i16, i16* %318, align 2
  %320 = zext i16 %319 to i32
  %321 = and i32 %320, 2048
  %322 = icmp ne i32 %321, 0
  br i1 %322, label %323, label %327

; <label>:323:                                    ; preds = %311
  %pgocount29 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 15)
  %324 = add i64 %pgocount29, 1
  store i64 %324, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 15)
  %325 = load i8*, i8** %6, align 8
  %326 = getelementptr inbounds i8, i8* %325, i32 1
  store i8* %326, i8** %6, align 8
  br label %311

; <label>:327:                                    ; preds = %311
  %pgocount30 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 36)
  %328 = add i64 %pgocount30, 1
  store i64 %328, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 36)
  %329 = load i8*, i8** %8, align 8
  %330 = load i8*, i8** %6, align 8
  %331 = load i8*, i8** %8, align 8
  %332 = ptrtoint i8* %330 to i64
  %333 = ptrtoint i8* %331 to i64
  %334 = sub i64 %332, %333
  %335 = trunc i64 %334 to i32
  %336 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %337 = call i32 @spell_out(i8* %329, i32 %335, %struct.darray_t* %336)
  %338 = load i32, i32* %5, align 4
  %339 = add i32 %338, %337
  store i32 %339, i32* %5, align 4
  br label %350

; <label>:340:                                    ; preds = %282, %278
  %pgocount31 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 28)
  %341 = add i64 %pgocount31, 1
  store i64 %341, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 28)
  %342 = load i64, i64* %10, align 8
  %343 = load i32, i32* %9, align 4
  %344 = sext i32 %343 to i64
  %345 = mul nsw i64 %342, %344
  %346 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %347 = call i32 @xlate_cardinal(i64 %345, %struct.darray_t* %346)
  %348 = load i32, i32* %5, align 4
  %349 = add i32 %348, %347
  store i32 %349, i32* %5, align 4
  br label %350

; <label>:350:                                    ; preds = %340, %327
  br label %536

; <label>:351:                                    ; preds = %227, %222
  %352 = load i8, i8* %7, align 1
  %353 = sext i8 %352 to i32
  %354 = icmp eq i32 %353, 91
  br i1 %354, label %355, label %391

; <label>:355:                                    ; preds = %351
  %pgocount32 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 34)
  %356 = add i64 %pgocount32, 1
  store i64 %356, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 34)
  %357 = load i8*, i8** %6, align 8
  %358 = call i8* @strchr(i8* %357, i32 93) #8
  %359 = icmp ne i8* %358, null
  br i1 %359, label %360, label %391

; <label>:360:                                    ; preds = %355
  %361 = load i8*, i8** %6, align 8
  store i8* %361, i8** %11, align 8
  br label %362

; <label>:362:                                    ; preds = %376, %360
  %363 = load i8*, i8** %6, align 8
  %364 = load i8, i8* %363, align 1
  %365 = sext i8 %364 to i32
  %366 = icmp ne i32 %365, 0
  br i1 %366, label %367, label %374

; <label>:367:                                    ; preds = %362
  %pgocount33 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 22)
  %368 = add i64 %pgocount33, 1
  store i64 %368, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 22)
  %369 = load i8*, i8** %6, align 8
  %370 = getelementptr inbounds i8, i8* %369, i32 1
  store i8* %370, i8** %6, align 8
  %371 = load i8, i8* %369, align 1
  %372 = sext i8 %371 to i32
  %373 = icmp ne i32 %372, 93
  br label %374

; <label>:374:                                    ; preds = %367, %362
  %375 = phi i1 [ false, %362 ], [ %373, %367 ]
  br i1 %375, label %376, label %378

; <label>:376:                                    ; preds = %374
  %pgocount34 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 19)
  %377 = add i64 %pgocount34, 1
  store i64 %377, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 19)
  br label %362

; <label>:378:                                    ; preds = %374
  %pgocount35 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 39)
  %379 = add i64 %pgocount35, 1
  store i64 %379, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 39)
  %380 = load i8*, i8** %11, align 8
  %381 = load i8*, i8** %6, align 8
  %382 = load i8*, i8** %11, align 8
  %383 = ptrtoint i8* %381 to i64
  %384 = ptrtoint i8* %382 to i64
  %385 = sub i64 %383, %384
  %386 = trunc i64 %385 to i32
  %387 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %388 = call i32 @xlate_word(i8* %380, i32 %386, %struct.darray_t* %387)
  %389 = load i32, i32* %5, align 4
  %390 = add i32 %389, %388
  store i32 %390, i32* %5, align 4
  br label %535

; <label>:391:                                    ; preds = %355, %351
  %392 = call i16** @__ctype_b_loc() #7
  %393 = load i16*, i16** %392, align 8
  %394 = load i8, i8* %7, align 1
  %395 = sext i8 %394 to i32
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds i16, i16* %393, i64 %396
  %398 = load i16, i16* %397, align 2
  %399 = zext i16 %398 to i32
  %400 = and i32 %399, 4
  %401 = icmp ne i32 %400, 0
  br i1 %401, label %402, label %496

; <label>:402:                                    ; preds = %391
  %403 = load i8, i8* %7, align 1
  %404 = sext i8 %403 to i32
  switch i32 %404, label %486 [
    i32 33, label %._crit_edge
    i32 63, label %._crit_edge1
    i32 46, label %413
    i32 34, label %._crit_edge2
    i32 58, label %._crit_edge3
    i32 45, label %._crit_edge4
    i32 59, label %._crit_edge5
    i32 44, label %._crit_edge6
    i32 40, label %._crit_edge7
    i32 41, label %454
    i32 91, label %460
  ]

._crit_edge7:                                     ; preds = %402
  %pgocount36 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 12)
  %405 = add i64 %pgocount36, 1
  store i64 %405, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 12)
  br label %454

._crit_edge6:                                     ; preds = %402
  %pgocount37 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 11)
  %406 = add i64 %pgocount37, 1
  store i64 %406, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 11)
  br label %454

._crit_edge5:                                     ; preds = %402
  %pgocount38 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 10)
  %407 = add i64 %pgocount38, 1
  store i64 %407, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 10)
  br label %454

._crit_edge4:                                     ; preds = %402
  %pgocount39 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 9)
  %408 = add i64 %pgocount39, 1
  store i64 %408, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 9)
  br label %454

._crit_edge3:                                     ; preds = %402
  %pgocount40 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 8)
  %409 = add i64 %pgocount40, 1
  store i64 %409, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 8)
  br label %454

._crit_edge2:                                     ; preds = %402
  %pgocount41 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 7)
  %410 = add i64 %pgocount41, 1
  store i64 %410, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 7)
  br label %454

._crit_edge1:                                     ; preds = %402
  %pgocount42 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 6)
  %411 = add i64 %pgocount42, 1
  store i64 %411, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 6)
  br label %413

._crit_edge:                                      ; preds = %402
  %pgocount43 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 5)
  %412 = add i64 %pgocount43, 1
  store i64 %412, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 5)
  br label %413

; <label>:413:                                    ; preds = %._crit_edge1, %._crit_edge, %402
  %414 = load i8*, i8** %6, align 8
  %415 = getelementptr inbounds i8, i8* %414, i64 1
  %416 = load i8, i8* %415, align 1
  %417 = icmp ne i8 %416, 0
  br i1 %417, label %418, label %432

; <label>:418:                                    ; preds = %413
  %pgocount44 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 44)
  %419 = add i64 %pgocount44, 1
  store i64 %419, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 44)
  %420 = call i16** @__ctype_b_loc() #7
  %421 = load i16*, i16** %420, align 8
  %422 = load i8*, i8** %6, align 8
  %423 = getelementptr inbounds i8, i8* %422, i64 1
  %424 = load i8, i8* %423, align 1
  %425 = sext i8 %424 to i32
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds i16, i16* %421, i64 %426
  %428 = load i16, i16* %427, align 2
  %429 = zext i16 %428 to i32
  %430 = and i32 %429, 8192
  %431 = icmp ne i32 %430, 0
  br i1 %431, label %432, label %448

; <label>:432:                                    ; preds = %418, %413
  %433 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %434 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %433, i32 0, i32 1
  %435 = load i32, i32* %434, align 8
  %436 = icmp ne i32 %435, 0
  br i1 %436, label %438, label %._crit_edge8

._crit_edge8:                                     ; preds = %432
  %pgocount45 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 13)
  %437 = add i64 %pgocount45, 1
  store i64 %437, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 13)
  br label %448

; <label>:438:                                    ; preds = %432
  %pgocount46 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 46)
  %439 = add i64 %pgocount46, 1
  store i64 %439, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 46)
  %440 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %441 = call i8* @darray_find(%struct.darray_t* %440, i32 0)
  %442 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %443 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %442, i32 0, i32 1
  %444 = load i32, i32* %443, align 8
  %445 = load i32, i32* @verbose, align 4
  call void @say_phones(i8* %441, i32 %444, i32 %445)
  %446 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %447 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %446, i32 0, i32 1
  store i32 0, i32* %447, align 8
  br label %448

; <label>:448:                                    ; preds = %._crit_edge8, %438, %418
  %pgocount47 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 43)
  %449 = add i64 %pgocount47, 1
  store i64 %449, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 43)
  %450 = load i8*, i8** %6, align 8
  %451 = getelementptr inbounds i8, i8* %450, i32 1
  store i8* %451, i8** %6, align 8
  %452 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %453 = call i32 @phone_append(%struct.darray_t* %452, i32 32)
  br label %495

; <label>:454:                                    ; preds = %._crit_edge7, %._crit_edge6, %._crit_edge5, %._crit_edge4, %._crit_edge3, %._crit_edge2, %402
  %pgocount48 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 41)
  %455 = add i64 %pgocount48, 1
  store i64 %455, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 41)
  %456 = load i8*, i8** %6, align 8
  %457 = getelementptr inbounds i8, i8* %456, i32 1
  store i8* %457, i8** %6, align 8
  %458 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %459 = call i32 @phone_append(%struct.darray_t* %458, i32 32)
  br label %495

; <label>:460:                                    ; preds = %402
  %461 = load i8*, i8** %6, align 8
  %462 = call i8* @strchr(i8* %461, i32 93) #8
  store i8* %462, i8** %12, align 8
  %463 = load i8*, i8** %12, align 8
  %464 = icmp ne i8* %463, null
  br i1 %464, label %465, label %484

; <label>:465:                                    ; preds = %460
  %466 = load i8*, i8** %6, align 8
  %467 = getelementptr inbounds i8, i8* %466, i32 1
  store i8* %467, i8** %6, align 8
  br label %468

; <label>:468:                                    ; preds = %472, %465
  %469 = load i8*, i8** %6, align 8
  %470 = load i8*, i8** %12, align 8
  %471 = icmp ult i8* %469, %470
  br i1 %471, label %472, label %480

; <label>:472:                                    ; preds = %468
  %pgocount49 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 33)
  %473 = add i64 %pgocount49, 1
  store i64 %473, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 33)
  %474 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %475 = load i8*, i8** %6, align 8
  %476 = getelementptr inbounds i8, i8* %475, i32 1
  store i8* %476, i8** %6, align 8
  %477 = load i8, i8* %475, align 1
  %478 = sext i8 %477 to i32
  %479 = call i32 @phone_append(%struct.darray_t* %474, i32 %478)
  br label %468

; <label>:480:                                    ; preds = %468
  %pgocount50 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 47)
  %481 = add i64 %pgocount50, 1
  store i64 %481, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 47)
  %482 = load i8*, i8** %12, align 8
  %483 = getelementptr inbounds i8, i8* %482, i64 1
  store i8* %483, i8** %6, align 8
  br label %495

; <label>:484:                                    ; preds = %460
  %pgocount51 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 48)
  %485 = add i64 %pgocount51, 1
  store i64 %485, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 48)
  br label %486

; <label>:486:                                    ; preds = %484, %402
  %pgocount52 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 45)
  %487 = add i64 %pgocount52, 1
  store i64 %487, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 45)
  %488 = load i8*, i8** %8, align 8
  %489 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %490 = call i32 @spell_out(i8* %488, i32 1, %struct.darray_t* %489)
  %491 = load i32, i32* %5, align 4
  %492 = add i32 %491, %490
  store i32 %492, i32* %5, align 4
  %493 = load i8*, i8** %6, align 8
  %494 = getelementptr inbounds i8, i8* %493, i32 1
  store i8* %494, i8** %6, align 8
  br label %495

; <label>:495:                                    ; preds = %486, %480, %454, %448
  br label %534

; <label>:496:                                    ; preds = %391
  br label %497

; <label>:497:                                    ; preds = %517, %496
  %498 = load i8*, i8** %6, align 8
  %499 = load i8, i8* %498, align 1
  store i8 %499, i8* %7, align 1
  %500 = sext i8 %499 to i32
  %501 = icmp ne i32 %500, 0
  br i1 %501, label %502, label %515

; <label>:502:                                    ; preds = %497
  %pgocount53 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 20)
  %503 = add i64 %pgocount53, 1
  store i64 %503, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 20)
  %504 = call i16** @__ctype_b_loc() #7
  %505 = load i16*, i16** %504, align 8
  %506 = load i8, i8* %7, align 1
  %507 = sext i8 %506 to i32
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds i16, i16* %505, i64 %508
  %510 = load i16, i16* %509, align 2
  %511 = zext i16 %510 to i32
  %512 = and i32 %511, 8192
  %513 = icmp ne i32 %512, 0
  %514 = xor i1 %513, true
  br label %515

; <label>:515:                                    ; preds = %502, %497
  %516 = phi i1 [ false, %497 ], [ %514, %502 ]
  br i1 %516, label %517, label %521

; <label>:517:                                    ; preds = %515
  %pgocount54 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 17)
  %518 = add i64 %pgocount54, 1
  store i64 %518, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 17)
  %519 = load i8*, i8** %6, align 8
  %520 = getelementptr inbounds i8, i8* %519, i32 1
  store i8* %520, i8** %6, align 8
  br label %497

; <label>:521:                                    ; preds = %515
  %pgocount55 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 37)
  %522 = add i64 %pgocount55, 1
  store i64 %522, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 37)
  %523 = load i8*, i8** %8, align 8
  %524 = load i8*, i8** %6, align 8
  %525 = load i8*, i8** %8, align 8
  %526 = ptrtoint i8* %524 to i64
  %527 = ptrtoint i8* %525 to i64
  %528 = sub i64 %526, %527
  %529 = trunc i64 %528 to i32
  %530 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %531 = call i32 @spell_out(i8* %523, i32 %529, %struct.darray_t* %530)
  %532 = load i32, i32* %5, align 4
  %533 = add i32 %532, %531
  store i32 %533, i32* %5, align 4
  br label %534

; <label>:534:                                    ; preds = %521, %495
  br label %535

; <label>:535:                                    ; preds = %534, %378
  br label %536

; <label>:536:                                    ; preds = %535, %350
  br label %537

; <label>:537:                                    ; preds = %536, %210
  br label %538

; <label>:538:                                    ; preds = %550, %537
  %539 = call i16** @__ctype_b_loc() #7
  %540 = load i16*, i16** %539, align 8
  %541 = load i8*, i8** %6, align 8
  %542 = load i8, i8* %541, align 1
  store i8 %542, i8* %7, align 1
  %543 = sext i8 %542 to i32
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds i16, i16* %540, i64 %544
  %546 = load i16, i16* %545, align 2
  %547 = zext i16 %546 to i32
  %548 = and i32 %547, 8192
  %549 = icmp ne i32 %548, 0
  br i1 %549, label %550, label %554

; <label>:550:                                    ; preds = %538
  %pgocount56 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 0)
  %551 = add i64 %pgocount56, 1
  store i64 %551, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 0)
  %552 = load i8*, i8** %6, align 8
  %553 = getelementptr inbounds i8, i8* %552, i32 1
  store i8* %553, i8** %6, align 8
  br label %538

; <label>:554:                                    ; preds = %538
  br label %31

; <label>:555:                                    ; preds = %31
  %pgocount57 = load i64, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 42)
  %556 = add i64 %pgocount57, 1
  store i64 %556, i64* getelementptr inbounds ([50 x i64], [50 x i64]* @__profc_xlate_string, i64 0, i64 42)
  %557 = load i32, i32* %5, align 4
  ret i32 %557
}

; Function Attrs: noinline nounwind uwtable
define i32 @suspect_word(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 0, i32* %5, align 4
  br label %11

; <label>:11:                                     ; preds = %90, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %94

; <label>:15:                                     ; preds = %11
  %16 = load i8*, i8** %3, align 8
  %17 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %17, i8** %3, align 8
  %18 = load i8, i8* %16, align 1
  store i8 %18, i8* %10, align 1
  %19 = load i32, i32* %5, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %39

; <label>:21:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 2)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 2)
  %23 = load i32, i32* %9, align 4
  %24 = icmp ne i32 %23, 45
  br i1 %24, label %25, label %39

; <label>:25:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 5)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 5)
  %27 = call i16** @__ctype_b_loc() #7
  %28 = load i16*, i16** %27, align 8
  %29 = load i8, i8* %10, align 1
  %30 = sext i8 %29 to i32
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16, i16* %28, i64 %31
  %33 = load i16, i16* %32, align 2
  %34 = zext i16 %33 to i32
  %35 = and i32 %34, 256
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 7)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 7)
  store i32 1, i32* %7, align 4
  br label %39

; <label>:39:                                     ; preds = %37, %25, %21, %15
  %40 = call i16** @__ctype_b_loc() #7
  %41 = load i16*, i16** %40, align 8
  %42 = load i8, i8* %10, align 1
  %43 = sext i8 %42 to i32
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i16, i16* %41, i64 %44
  %46 = load i16, i16* %45, align 2
  %47 = zext i16 %46 to i32
  %48 = and i32 %47, 512
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %56

; <label>:50:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 3)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 3)
  store i32 1, i32* %6, align 4
  %52 = load i8, i8* %10, align 1
  %53 = sext i8 %52 to i32
  %54 = call i32 @toupper(i32 %53) #8
  %55 = trunc i32 %54 to i8
  store i8 %55, i8* %10, align 1
  br label %56

; <label>:56:                                     ; preds = %50, %39
  %57 = load i8, i8* %10, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp eq i32 %58, 65
  br i1 %59, label %85, label %60

; <label>:60:                                     ; preds = %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 4)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 4)
  %62 = load i8, i8* %10, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp eq i32 %63, 69
  br i1 %64, label %85, label %65

; <label>:65:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 6)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 6)
  %67 = load i8, i8* %10, align 1
  %68 = sext i8 %67 to i32
  %69 = icmp eq i32 %68, 73
  br i1 %69, label %85, label %70

; <label>:70:                                     ; preds = %65
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 8)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 8)
  %72 = load i8, i8* %10, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %73, 79
  br i1 %74, label %85, label %75

; <label>:75:                                     ; preds = %70
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 9)
  %76 = add i64 %pgocount7, 1
  store i64 %76, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 9)
  %77 = load i8, i8* %10, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp eq i32 %78, 85
  br i1 %79, label %85, label %80

; <label>:80:                                     ; preds = %75
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 11)
  %81 = add i64 %pgocount8, 1
  store i64 %81, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 11)
  %82 = load i8, i8* %10, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp eq i32 %83, 89
  br i1 %84, label %85, label %87

; <label>:85:                                     ; preds = %80, %75, %70, %65, %60, %56
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 1)
  %86 = add i64 %pgocount9, 1
  store i64 %86, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 1)
  store i32 1, i32* %8, align 4
  br label %87

; <label>:87:                                     ; preds = %85, %80
  %88 = load i8, i8* %10, align 1
  %89 = sext i8 %88 to i32
  store i32 %89, i32* %9, align 4
  br label %90

; <label>:90:                                     ; preds = %87
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 0)
  %91 = add i64 %pgocount10, 1
  store i64 %91, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 0)
  %92 = load i32, i32* %5, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %5, align 4
  br label %11

; <label>:94:                                     ; preds = %11
  %95 = load i32, i32* %8, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %110

; <label>:97:                                     ; preds = %94
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 12)
  %98 = add i64 %pgocount11, 1
  store i64 %98, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 12)
  %99 = load i32, i32* %7, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %105

; <label>:101:                                    ; preds = %97
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 13)
  %102 = add i64 %pgocount12, 1
  store i64 %102, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 13)
  %103 = load i32, i32* %6, align 4
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %110, label %105

; <label>:105:                                    ; preds = %101, %97
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 14)
  %106 = add i64 %pgocount13, 1
  store i64 %106, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 14)
  %107 = load i32, i32* %6, align 4
  %108 = icmp ne i32 %107, 0
  %109 = xor i1 %108, true
  br label %110

; <label>:110:                                    ; preds = %105, %101, %94
  %111 = phi i1 [ true, %101 ], [ true, %94 ], [ %109, %105 ]
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 10)
  %112 = add i64 %pgocount14, 1
  store i64 %112, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_suspect_word, i64 0, i64 10)
  %113 = zext i1 %111 to i32
  ret i32 %113
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #2

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #3

; Function Attrs: noinline nounwind uwtable
define void @say_phones(i8*, i32, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.darray_t, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i16*, align 8
  %11 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %12 = load i32, i32* %5, align 4
  call void @darray_init(%struct.darray_t* %7, i32 1, i32 %12)
  %13 = load i8*, i8** %4, align 8
  %14 = load i32, i32* %5, align 4
  %15 = call i32 @phone_to_elm(i8* %13, i32 %14, %struct.darray_t* %7)
  store i32 %15, i32* %8, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %64

; <label>:17:                                     ; preds = %3
  %18 = load i32, i32* %8, align 4
  %19 = zext i32 %18 to i64
  %20 = load i64, i64* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 7), align 8
  %21 = mul nsw i64 %19, %20
  %22 = trunc i64 %21 to i32
  store i32 %22, i32* %9, align 4
  %23 = load i32, i32* %9, align 4
  %24 = zext i32 %23 to i64
  %25 = mul i64 2, %24
  %26 = call noalias i8* @malloc(i64 %25) #6
  %27 = bitcast i8* %26 to i16*
  store i16* %27, i16** %10, align 8
  %28 = load i32, i32* %6, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %36

; <label>:30:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 2)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = load i32, i32* %5, align 4
  %34 = load i8*, i8** %4, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i32 %33, i8* %34)
  br label %36

; <label>:36:                                     ; preds = %30, %17
  %37 = load i16*, i16** %10, align 8
  %38 = icmp ne i16* %37, null
  br i1 %38, label %39, label %62

; <label>:39:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 3)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 3)
  %41 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %7, i32 0, i32 1
  %42 = load i32, i32* %41, align 8
  %43 = call i8* @darray_find(%struct.darray_t* %7, i32 0)
  %44 = load i32, i32* %9, align 4
  %45 = load i16*, i16** %10, align 8
  %46 = call i32 @holmes(i32 %42, i8* %43, i32 %44, i16* %45)
  store i32 %46, i32* %11, align 4
  %47 = load void (i32, i16*)*, void (i32, i16*)** @file_write, align 8
  %48 = icmp ne void (i32, i16*)* %47, null
  br i1 %48, label %49, label %59

; <label>:49:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 4)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 4)
  %51 = load i32, i32* @once, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %59

; <label>:53:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 5)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 5)
  %55 = load void (i32, i16*)*, void (i32, i16*)** @file_write, align 8
  %56 = load i32, i32* %11, align 4
  %57 = load i16*, i16** %10, align 8
  %58 = ptrtoint void (i32, i16*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %58, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_say_phones to i8*), i32 0)
  call void %55(i32 %56, i16* %57)
  br label %59

; <label>:59:                                     ; preds = %53, %49, %39
  %60 = load i16*, i16** %10, align 8
  %61 = bitcast i16* %60 to i8*
  call void @free(i8* %61) #6
  br label %62

; <label>:62:                                     ; preds = %59, %36
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 1)
  %63 = add i64 %pgocount4, 1
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 1)
  br label %64

; <label>:64:                                     ; preds = %62, %3
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 0)
  %65 = add i64 %pgocount5, 1
  store i64 %65, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_phones, i64 0, i64 0)
  call void @darray_free(%struct.darray_t* %7)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @darray_init(%struct.darray_t*, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_darray_init, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_darray_init, i64 0, i64 0)
  %5 = alloca %struct.darray_t*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.darray_t* %0, %struct.darray_t** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %8 = load i32, i32* %6, align 4
  %9 = trunc i32 %8 to i16
  %10 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %11 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %10, i32 0, i32 3
  store i16 %9, i16* %11, align 8
  %12 = load i32, i32* %7, align 4
  %13 = trunc i32 %12 to i16
  %14 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %15 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %14, i32 0, i32 4
  store i16 %13, i16* %15, align 2
  %16 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %17 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %16, i32 0, i32 2
  store i32 0, i32* %17, align 4
  %18 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %19 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %18, i32 0, i32 1
  store i32 0, i32* %19, align 8
  %20 = load %struct.darray_t*, %struct.darray_t** %5, align 8
  %21 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %20, i32 0, i32 0
  store i8* null, i8** %21, align 8
  ret void
}

declare i32 @phone_to_elm(i8*, i32, %struct.darray_t*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare i32 @holmes(i32, i8*, i32, i16*) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @darray_find(%struct.darray_t*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.darray_t*, align 8
  %5 = alloca i32, align 4
  store %struct.darray_t* %0, %struct.darray_t** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %8 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %7, i32 0, i32 2
  %9 = load i32, i32* %8, align 4
  %10 = icmp ult i32 %6, %9
  br i1 %10, label %11, label %31

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 1)
  %13 = load i32, i32* %5, align 4
  %14 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %15 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = icmp ult i32 %13, %16
  br i1 %17, label %18, label %31

; <label>:18:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 2)
  %20 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %21 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %20, i32 0, i32 0
  %22 = load i8*, i8** %21, align 8
  %23 = load i32, i32* %5, align 4
  %24 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %25 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %24, i32 0, i32 3
  %26 = load i16, i16* %25, align 8
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %22, i64 %29
  store i8* %30, i8** %3, align 8
  br label %36

; <label>:31:                                     ; preds = %11, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 0)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 0)
  %33 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %34 = load i32, i32* %5, align 4
  %35 = call i8* @Darray_find(%struct.darray_t* %33, i32 %34)
  store i8* %35, i8** %3, align 8
  br label %36

; <label>:36:                                     ; preds = %31, %18
  %37 = load i8*, i8** %3, align 8
  ret i8* %37
}

; Function Attrs: nounwind
declare void @free(i8*) #4

declare void @darray_free(%struct.darray_t*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @xlate_word(i8*, i32, %struct.darray_t*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.darray_t*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.darray_t* %2, %struct.darray_t** %7, align 8
  store i32 0, i32* %8, align 4
  %13 = load i8*, i8** %5, align 8
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 91
  br i1 %16, label %17, label %155

; <label>:17:                                     ; preds = %3
  %18 = load i8*, i8** @dict, align 8
  %19 = icmp ne i8* %18, null
  br i1 %19, label %20, label %121

; <label>:20:                                     ; preds = %17
  %21 = load i8*, i8** %5, align 8
  %22 = load i32, i32* %6, align 4
  %23 = call i8* @dict_find(i8* %21, i32 %22)
  store i8* %23, i8** %9, align 8
  %24 = load i8*, i8** %9, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %26, label %64

; <label>:26:                                     ; preds = %20
  %27 = load i8*, i8** %9, align 8
  store i8* %27, i8** %10, align 8
  br label %28

; <label>:28:                                     ; preds = %55, %26
  %29 = load i8*, i8** %10, align 8
  %30 = load i8, i8* %29, align 1
  %31 = icmp ne i8 %30, 0
  br i1 %31, label %32, label %57

; <label>:32:                                     ; preds = %28
  %33 = load i8**, i8*** @dialect, align 8
  %34 = load i8*, i8** %10, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %10, align 8
  %36 = load i8, i8* %34, align 1
  %37 = zext i8 %36 to i32
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i8*, i8** %33, i64 %38
  %40 = load i8*, i8** %39, align 8
  store i8* %40, i8** %11, align 8
  br label %41

; <label>:41:                                     ; preds = %45, %32
  %42 = load i8*, i8** %11, align 8
  %43 = load i8, i8* %42, align 1
  %44 = icmp ne i8 %43, 0
  br i1 %44, label %45, label %55

; <label>:45:                                     ; preds = %41
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 0)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 0)
  %47 = load %struct.darray_t*, %struct.darray_t** %7, align 8
  %48 = load i8*, i8** %11, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %11, align 8
  %50 = load i8, i8* %48, align 1
  %51 = sext i8 %50 to i32
  %52 = call i32 @phone_append(%struct.darray_t* %47, i32 %51)
  %53 = load i32, i32* %8, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* %8, align 4
  br label %41

; <label>:55:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 2)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 2)
  br label %28

; <label>:57:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 7)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 7)
  %59 = load %struct.darray_t*, %struct.darray_t** %7, align 8
  %60 = call i32 @phone_append(%struct.darray_t* %59, i32 32)
  %61 = load i8*, i8** %9, align 8
  call void @free(i8* %61) #6
  %62 = load i32, i32* %8, align 4
  %63 = add i32 %62, 1
  store i32 %63, i32* %4, align 4
  br label %192

; <label>:64:                                     ; preds = %20
  %65 = load i8*, i8** %5, align 8
  store i8* %65, i8** %12, align 8
  br label %66

; <label>:66:                                     ; preds = %116, %64
  %67 = load i8*, i8** %12, align 8
  %68 = load i8*, i8** %5, align 8
  %69 = load i32, i32* %6, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %68, i64 %70
  %72 = icmp ult i8* %67, %71
  br i1 %72, label %73, label %118

; <label>:73:                                     ; preds = %66
  %74 = load i8*, i8** %12, align 8
  %75 = load i8, i8* %74, align 1
  %76 = sext i8 %75 to i32
  %77 = icmp eq i32 %76, 46
  br i1 %77, label %84, label %78

; <label>:78:                                     ; preds = %73
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 3)
  %79 = add i64 %pgocount3, 1
  store i64 %79, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 3)
  %80 = load i8*, i8** %12, align 8
  %81 = load i8, i8* %80, align 1
  %82 = sext i8 %81 to i32
  %83 = icmp eq i32 %82, 45
  br i1 %83, label %84, label %113

; <label>:84:                                     ; preds = %78, %73
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 10)
  %85 = add i64 %pgocount4, 1
  store i64 %85, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 10)
  %86 = load i8*, i8** %5, align 8
  %87 = load i8*, i8** %12, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %12, align 8
  %89 = load i8*, i8** %5, align 8
  %90 = ptrtoint i8* %87 to i64
  %91 = ptrtoint i8* %89 to i64
  %92 = sub i64 %90, %91
  %93 = trunc i64 %92 to i32
  %94 = load %struct.darray_t*, %struct.darray_t** %7, align 8
  %95 = call i32 @xlate_word(i8* %86, i32 %93, %struct.darray_t* %94)
  %96 = load i32, i32* %8, align 4
  %97 = add i32 %96, %95
  store i32 %97, i32* %8, align 4
  %98 = load i8*, i8** %12, align 8
  %99 = load i8*, i8** %5, align 8
  %100 = load i32, i32* %6, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8* %99, i64 %101
  %103 = load i8*, i8** %12, align 8
  %104 = ptrtoint i8* %102 to i64
  %105 = ptrtoint i8* %103 to i64
  %106 = sub i64 %104, %105
  %107 = trunc i64 %106 to i32
  %108 = load %struct.darray_t*, %struct.darray_t** %7, align 8
  %109 = call i32 @xlate_word(i8* %98, i32 %107, %struct.darray_t* %108)
  %110 = load i32, i32* %8, align 4
  %111 = add i32 %110, %109
  store i32 %111, i32* %8, align 4
  %112 = load i32, i32* %8, align 4
  store i32 %112, i32* %4, align 4
  br label %192

; <label>:113:                                    ; preds = %78
  %114 = load i8*, i8** %12, align 8
  %115 = getelementptr inbounds i8, i8* %114, i32 1
  store i8* %115, i8** %12, align 8
  br label %116

; <label>:116:                                    ; preds = %113
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 4)
  %117 = add i64 %pgocount5, 1
  store i64 %117, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 4)
  br label %66

; <label>:118:                                    ; preds = %66
  br label %119

; <label>:119:                                    ; preds = %118
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 12)
  %120 = add i64 %pgocount6, 1
  store i64 %120, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 12)
  br label %121

; <label>:121:                                    ; preds = %119, %17
  %122 = load i8*, i8** %5, align 8
  %123 = load i32, i32* %6, align 4
  %124 = call i32 @suspect_word(i8* %122, i32 %123)
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %132

; <label>:126:                                    ; preds = %121
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 8)
  %127 = add i64 %pgocount7, 1
  store i64 %127, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 8)
  %128 = load i8*, i8** %5, align 8
  %129 = load i32, i32* %6, align 4
  %130 = load %struct.darray_t*, %struct.darray_t** %7, align 8
  %131 = call i32 @spell_out(i8* %128, i32 %129, %struct.darray_t* %130)
  store i32 %131, i32* %4, align 4
  br label %192

; <label>:132:                                    ; preds = %121
  %133 = load i8*, i8** @dict, align 8
  %134 = icmp ne i8* %133, null
  br i1 %134, label %139, label %135

; <label>:135:                                    ; preds = %132
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 13)
  %136 = add i64 %pgocount8, 1
  store i64 %136, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 13)
  %137 = load i32, i32* @verbose, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %146

; <label>:139:                                    ; preds = %135, %132
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 11)
  %140 = add i64 %pgocount9, 1
  store i64 %140, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 11)
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %142 = load i8*, i8** @dict, align 8
  %143 = load i32, i32* %6, align 4
  %144 = load i8*, i8** %5, align 8
  %145 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %141, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.15, i32 0, i32 0), i8* %142, i32 %143, i8* %144)
  br label %146

; <label>:146:                                    ; preds = %139, %135
  %147 = load i8*, i8** %5, align 8
  %148 = load i32, i32* %6, align 4
  %149 = load %struct.darray_t*, %struct.darray_t** %7, align 8
  %150 = call i32 @NRL(i8* %147, i32 %148, %struct.darray_t* %149)
  %151 = load i32, i32* %8, align 4
  %152 = add i32 %151, %150
  store i32 %152, i32* %8, align 4
  br label %153

; <label>:153:                                    ; preds = %146
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 9)
  %154 = add i64 %pgocount10, 1
  store i64 %154, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 9)
  br label %187

; <label>:155:                                    ; preds = %3
  %156 = load i8*, i8** %5, align 8
  %157 = getelementptr inbounds i8, i8* %156, i32 1
  store i8* %157, i8** %5, align 8
  %158 = load i32, i32* %6, align 4
  %159 = add nsw i32 %158, -1
  store i32 %159, i32* %6, align 4
  %160 = sub nsw i32 %159, 1
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i8, i8* %157, i64 %161
  %163 = load i8, i8* %162, align 1
  %164 = sext i8 %163 to i32
  %165 = icmp eq i32 %164, 93
  br i1 %165, label %166, label %170

; <label>:166:                                    ; preds = %155
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 6)
  %167 = add i64 %pgocount11, 1
  store i64 %167, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 6)
  %168 = load i32, i32* %6, align 4
  %169 = add nsw i32 %168, -1
  store i32 %169, i32* %6, align 4
  br label %170

; <label>:170:                                    ; preds = %166, %155
  br label %171

; <label>:171:                                    ; preds = %175, %170
  %172 = load i32, i32* %6, align 4
  %173 = add nsw i32 %172, -1
  store i32 %173, i32* %6, align 4
  %174 = icmp sgt i32 %172, 0
  br i1 %174, label %175, label %185

; <label>:175:                                    ; preds = %171
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 1)
  %176 = add i64 %pgocount12, 1
  store i64 %176, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 1)
  %177 = load %struct.darray_t*, %struct.darray_t** %7, align 8
  %178 = load i8*, i8** %5, align 8
  %179 = getelementptr inbounds i8, i8* %178, i32 1
  store i8* %179, i8** %5, align 8
  %180 = load i8, i8* %178, align 1
  %181 = sext i8 %180 to i32
  %182 = call i32 @phone_append(%struct.darray_t* %177, i32 %181)
  %183 = load i32, i32* %8, align 4
  %184 = add i32 %183, 1
  store i32 %184, i32* %8, align 4
  br label %171

; <label>:185:                                    ; preds = %171
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 5)
  %186 = add i64 %pgocount13, 1
  store i64 %186, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_xlate_word, i64 0, i64 5)
  br label %187

; <label>:187:                                    ; preds = %185, %153
  %188 = load %struct.darray_t*, %struct.darray_t** %7, align 8
  %189 = call i32 @phone_append(%struct.darray_t* %188, i32 32)
  %190 = load i32, i32* %8, align 4
  %191 = add i32 %190, 1
  store i32 %191, i32* %4, align 4
  br label %192

; <label>:192:                                    ; preds = %187, %126, %84, %57
  %193 = load i32, i32* %4, align 4
  ret i32 %193
}

declare i32 @xlate_cardinal(i64, %struct.darray_t*) #1

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #3

declare i32 @phone_append(%struct.darray_t*, i32) #1

; Function Attrs: noinline nounwind uwtable
define i8* @concat_args(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 0, i32* %5, align 4
  store i32 1, i32* %6, align 4
  br label %10

; <label>:10:                                     ; preds = %26, %2
  %11 = load i32, i32* %6, align 4
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %10
  %15 = load i8**, i8*** %4, align 8
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8*, i8** %15, i64 %17
  %19 = load i8*, i8** %18, align 8
  %20 = call i64 @strlen(i8* %19) #8
  %21 = add i64 %20, 1
  %22 = load i32, i32* %5, align 4
  %23 = sext i32 %22 to i64
  %24 = add i64 %23, %21
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %5, align 4
  br label %26

; <label>:26:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 1)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 1)
  %28 = load i32, i32* %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %6, align 4
  br label %10

; <label>:30:                                     ; preds = %10
  %31 = load i32, i32* %5, align 4
  %32 = sext i32 %31 to i64
  %33 = call noalias i8* @malloc(i64 %32) #6
  store i8* %33, i8** %7, align 8
  %34 = load i8*, i8** %7, align 8
  %35 = icmp ne i8* %34, null
  br i1 %35, label %36, label %74

; <label>:36:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 5)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 5)
  %38 = load i8*, i8** %7, align 8
  store i8* %38, i8** %8, align 8
  store i32 1, i32* %6, align 4
  br label %39

; <label>:39:                                     ; preds = %72, %36
  %40 = load i32, i32* %6, align 4
  %41 = load i32, i32* %3, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %73

; <label>:43:                                     ; preds = %39
  %44 = load i8**, i8*** %4, align 8
  %45 = load i32, i32* %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %6, align 4
  %47 = sext i32 %45 to i64
  %48 = getelementptr inbounds i8*, i8** %44, i64 %47
  %49 = load i8*, i8** %48, align 8
  store i8* %49, i8** %9, align 8
  br label %50

; <label>:50:                                     ; preds = %54, %43
  %51 = load i8*, i8** %9, align 8
  %52 = load i8, i8* %51, align 1
  %53 = icmp ne i8 %52, 0
  br i1 %53, label %54, label %61

; <label>:54:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 0)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 0)
  %56 = load i8*, i8** %9, align 8
  %57 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %57, i8** %9, align 8
  %58 = load i8, i8* %56, align 1
  %59 = load i8*, i8** %8, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %8, align 8
  store i8 %58, i8* %59, align 1
  br label %50

; <label>:61:                                     ; preds = %50
  %62 = load i32, i32* %6, align 4
  %63 = load i32, i32* %3, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 2)
  %66 = add i64 %pgocount3, 1
  store i64 %66, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 2)
  %67 = load i8*, i8** %8, align 8
  %68 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %68, i8** %8, align 8
  store i8 32, i8* %67, align 1
  br label %72

; <label>:69:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 3)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 3)
  %71 = load i8*, i8** %8, align 8
  store i8 0, i8* %71, align 1
  br label %72

; <label>:72:                                     ; preds = %69, %65
  br label %39

; <label>:73:                                     ; preds = %39
  br label %74

; <label>:74:                                     ; preds = %73, %30
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 4)
  %75 = add i64 %pgocount5, 1
  store i64 %75, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_concat_args, i64 0, i64 4)
  %76 = load i8*, i8** %7, align 8
  ret i8* %76
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind uwtable
define void @say_string(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.darray_t, align 8
  store i8* %0, i8** %2, align 8
  call void @darray_init(%struct.darray_t* %3, i32 1, i32 128)
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 @xlate_string(i8* %4, %struct.darray_t* %3)
  %6 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %3, i32 0, i32 1
  %7 = load i32, i32* %6, align 8
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %15

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_say_string, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_say_string, i64 0, i64 1)
  %11 = call i8* @darray_find(%struct.darray_t* %3, i32 0)
  %12 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %3, i32 0, i32 1
  %13 = load i32, i32* %12, align 8
  %14 = load i32, i32* @verbose, align 4
  call void @say_phones(i8* %11, i32 %13, i32 %14)
  br label %15

; <label>:15:                                     ; preds = %9, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_say_string, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_say_string, i64 0, i64 0)
  call void @darray_free(%struct.darray_t* %3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @darray_fget(%struct._IO_FILE*, %struct.darray_t*) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct.darray_t*, align 8
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store %struct.darray_t* %1, %struct.darray_t** %4, align 8
  br label %6

; <label>:6:                                      ; preds = %18, %2
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i32 @fgetc(%struct._IO_FILE* %7)
  store i32 %8, i32* %5, align 4
  %9 = icmp ne i32 %8, -1
  br i1 %9, label %10, label %20

; <label>:10:                                     ; preds = %6
  %11 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %12 = load i32, i32* %5, align 4
  %13 = call i32 @phone_append(%struct.darray_t* %11, i32 %12)
  %14 = load i32, i32* %5, align 4
  %15 = icmp eq i32 %14, 10
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_darray_fget, i64 0, i64 2)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_darray_fget, i64 0, i64 2)
  br label %20

; <label>:18:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_darray_fget, i64 0, i64 0)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_darray_fget, i64 0, i64 0)
  br label %6

; <label>:20:                                     ; preds = %16, %6
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_darray_fget, i64 0, i64 1)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_darray_fget, i64 0, i64 1)
  %22 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %23 = call i32 @phone_append(%struct.darray_t* %22, i32 0)
  %24 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %25 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %24, i32 0, i32 1
  %26 = load i32, i32* %25, align 8
  %27 = sub i32 %26, 1
  ret i32 %27
}

declare i32 @fgetc(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define void @say_file(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.darray_t, align 8
  %8 = alloca %struct.darray_t, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %3, align 8
  %9 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %9, %struct._IO_FILE** %3, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 5)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 5)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

; <label>:15:                                     ; preds = %1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i64* %5)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %19 = call i32 @fclose(%struct._IO_FILE* %18)
  store i64 0, i64* %6, align 8
  call void @darray_init(%struct.darray_t* %7, i32 1, i32 128)
  call void @darray_init(%struct.darray_t* %8, i32 1, i32 128)
  br label %20

; <label>:20:                                     ; preds = %30, %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %22 = call i32 @darray_fget(%struct._IO_FILE* %21, %struct.darray_t* %7)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 1)
  %26 = load i64, i64* %6, align 8
  %27 = icmp slt i64 %26, 500
  br label %28

; <label>:28:                                     ; preds = %24, %20
  %29 = phi i1 [ false, %20 ], [ %27, %24 ]
  br i1 %29, label %30, label %37

; <label>:30:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 0)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 0)
  %32 = load i64, i64* %6, align 8
  %33 = add nsw i64 %32, 1
  store i64 %33, i64* %6, align 8
  %34 = call i8* @darray_find(%struct.darray_t* %7, i32 0)
  %35 = call i32 @xlate_string(i8* %34, %struct.darray_t* %8)
  %36 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %7, i32 0, i32 1
  store i32 0, i32* %36, align 8
  br label %20

; <label>:37:                                     ; preds = %28
  %38 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %8, i32 0, i32 1
  %39 = load i32, i32* %38, align 8
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %57

; <label>:41:                                     ; preds = %37
  store i64 0, i64* %4, align 8
  br label %42

; <label>:42:                                     ; preds = %51, %41
  %43 = load i64, i64* %4, align 8
  %44 = load i64, i64* %5, align 8
  %45 = icmp slt i64 %43, %44
  br i1 %45, label %46, label %55

; <label>:46:                                     ; preds = %42
  %47 = call i8* @darray_find(%struct.darray_t* %8, i32 0)
  %48 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %8, i32 0, i32 1
  %49 = load i32, i32* %48, align 8
  %50 = load i32, i32* @verbose, align 4
  call void @say_phones(i8* %47, i32 %49, i32 %50)
  store i32 1, i32* @once, align 4
  br label %51

; <label>:51:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 2)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 2)
  %53 = load i64, i64* %4, align 8
  %54 = add nsw i64 %53, 1
  store i64 %54, i64* %4, align 8
  br label %42

; <label>:55:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 4)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 4)
  br label %57

; <label>:57:                                     ; preds = %55, %37
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 3)
  %58 = add i64 %pgocount5, 1
  store i64 %58, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_say_file, i64 0, i64 3)
  call void @darray_free(%struct.darray_t* %8)
  call void @darray_free(%struct.darray_t* %7)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**, i8**) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8**, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8*, align 8
  store i32 0, i32* %4, align 4
  store i32 %0, i32* %5, align 4
  store i8** %1, i8*** %6, align 8
  store i8** %2, i8*** %7, align 8
  %9 = load i8**, i8*** %6, align 8
  %10 = getelementptr inbounds i8*, i8** %9, i64 0
  %11 = load i8*, i8** %10, align 8
  store i8* %11, i8** @program, align 8
  %12 = load i32, i32* %5, align 4
  %13 = load i8**, i8*** %6, align 8
  %14 = call i32 @audio_init(i32 %12, i8** %13)
  store i32 %14, i32* %5, align 4
  %15 = load i32, i32* %5, align 4
  %16 = load i8**, i8*** %6, align 8
  %17 = call i32 @init_synth(i32 %15, i8** %16)
  store i32 %17, i32* %5, align 4
  %18 = load i32, i32* %5, align 4
  %19 = load i8**, i8*** %6, align 8
  %20 = call i32 @init_holmes(i32 %18, i8** %19)
  store i32 %20, i32* %5, align 4
  %21 = load i32, i32* %5, align 4
  %22 = load i8**, i8*** %6, align 8
  %23 = call i32 @dict_init(i32 %21, i8** %22)
  store i32 %23, i32* %5, align 4
  %24 = load i32, i32* %5, align 4
  %25 = load i8**, i8*** %6, align 8
  %26 = call i32 @file_init(i32 %24, i8** %25)
  store i32 %26, i32* %5, align 4
  %27 = load i32, i32* %5, align 4
  %28 = load i8**, i8*** %6, align 8
  %29 = call i32 (i8*, i32, i8**, ...) @getargs(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 %27, i8** %28, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0), i8* null, i32* @verbose, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.11, i32 0, i32 0), i8* null)
  store i32 %29, i32* %5, align 4
  %30 = load i32, i32* @help_only, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %43

; <label>:32:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 0)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 0)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = load i8*, i8** @program, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12, i32 0, i32 0), i8* %35)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = load i8*, i8** @program, align 8
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.13, i32 0, i32 0), i8* %38)
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = load i8*, i8** @Revision, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0), i8* %41)
  br label %62

; <label>:43:                                     ; preds = %3
  %44 = load i32, i32* %5, align 4
  %45 = icmp sgt i32 %44, 1
  br i1 %45, label %46, label %58

; <label>:46:                                     ; preds = %43
  %47 = load i32, i32* %5, align 4
  %48 = load i8**, i8*** %6, align 8
  %49 = call i8* @concat_args(i32 %47, i8** %48)
  store i8* %49, i8** %8, align 8
  %50 = load i8*, i8** %8, align 8
  %51 = icmp ne i8* %50, null
  br i1 %51, label %52, label %56

; <label>:52:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 5)
  %53 = add i64 %pgocount1, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 5)
  %54 = load i8*, i8** %8, align 8
  call void @say_string(i8* %54)
  %55 = load i8*, i8** %8, align 8
  call void @free(i8* %55) #6
  br label %56

; <label>:56:                                     ; preds = %52, %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 3)
  %57 = add i64 %pgocount2, 1
  store i64 %57, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 3)
  br label %61

; <label>:58:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 4)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 4)
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  call void @say_file(%struct._IO_FILE* %60)
  br label %61

; <label>:61:                                     ; preds = %58, %56
  br label %62

; <label>:62:                                     ; preds = %61, %32
  %63 = load void ()*, void ()** @file_term, align 8
  %64 = icmp ne void ()* %63, null
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 1)
  %66 = add i64 %pgocount4, 1
  store i64 %66, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 1)
  %67 = load void ()*, void ()** @file_term, align 8
  %68 = ptrtoint void ()* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %68, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i32 0)
  call void %67()
  br label %69

; <label>:69:                                     ; preds = %65, %62
  call void @audio_term()
  call void @term_holmes()
  %70 = load i8*, i8** @dict, align 8
  %71 = icmp ne i8* %70, null
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 2)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main, i64 0, i64 2)
  call void @dict_term()
  br label %74

; <label>:74:                                     ; preds = %72, %69
  ret i32 0
}

declare i32 @audio_init(i32, i8**) #1

declare i32 @init_synth(i32, i8**) #1

declare i32 @init_holmes(i32, i8**) #1

declare i32 @dict_init(i32, i8**) #1

declare i32 @file_init(i32, i8**) #1

declare i32 @getargs(i8*, i32, i8**, ...) #1

declare void @audio_term() #1

declare void @term_holmes() #1

declare void @dict_term() #1

declare i8* @Darray_find(%struct.darray_t*, i32) #1

declare i8* @dict_find(i8*, i32) #1

declare i32 @NRL(i8*, i32, %struct.darray_t*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #6

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
