; ModuleID = 'tmp1.ll'
source_filename = "pbmsrch_large.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@len = internal global i64 0, align 8
@table = internal global [256 x i64] zeroinitializer, align 16
@findme = internal global i8* null, align 8
@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Error: too few parameters!\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"\0AError: Can't find text!\0A\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"\0AError: Can't find search strings!\0A\00", align 1
@str_misc = internal global [1024 x i8] zeroinitializer, align 16
@.str.7 = private unnamed_addr constant [22 x i8] c"Size1=%lu, size2=%lu\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.9 = private unnamed_addr constant [38 x i8] c"\0AError: Can't open file for writing!\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"\22%s\22 is%s in \22%s\22\00", align 1
@.str.11 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.12 = private unnamed_addr constant [5 x i8] c" not\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c" [\22%s\22]\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_init_search = private constant [11 x i8] c"init_search"
@__profn_strsearch = private constant [9 x i8] c"strsearch"
@__profn_main = private constant [4 x i8] c"main"
@__profc_init_search = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_init_search = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5148267834805225464, i64 52028904346, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_search, i32 0, i32 0), i8* bitcast (void (i8*)* @init_search to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_strsearch = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_strsearch = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5556949575252845840, i64 90497930792, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i32 0, i32 0), i8* bitcast (i8* (i8*)* @strsearch to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 72057895849683786, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [30 x i8] c"\1A\1Cx\DA\CB\CC\CB,\89/NM,J\CE`,.)\82\B2r\133\F3\00\8A?\0A\00", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_init_search to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_strsearch to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @init_search(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i64 @strlen(i8* %4) #6
  store i64 %5, i64* @len, align 8
  store i64 0, i64* %3, align 8
  br label %6

; <label>:6:                                      ; preds = %13, %1
  %7 = load i64, i64* %3, align 8
  %8 = icmp ule i64 %7, 255
  br i1 %8, label %9, label %17

; <label>:9:                                      ; preds = %6
  %10 = load i64, i64* @len, align 8
  %11 = load i64, i64* %3, align 8
  %12 = getelementptr inbounds [256 x i64], [256 x i64]* @table, i64 0, i64 %11
  store i64 %10, i64* %12, align 8
  br label %13

; <label>:13:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_search, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_search, i64 0, i64 0)
  %15 = load i64, i64* %3, align 8
  %16 = add i64 %15, 1
  store i64 %16, i64* %3, align 8
  br label %6

; <label>:17:                                     ; preds = %6
  store i64 0, i64* %3, align 8
  br label %18

; <label>:18:                                     ; preds = %33, %17
  %19 = load i64, i64* %3, align 8
  %20 = load i64, i64* @len, align 8
  %21 = icmp ult i64 %19, %20
  br i1 %21, label %22, label %37

; <label>:22:                                     ; preds = %18
  %23 = load i64, i64* @len, align 8
  %24 = load i64, i64* %3, align 8
  %25 = sub i64 %23, %24
  %26 = sub i64 %25, 1
  %27 = load i8*, i8** %2, align 8
  %28 = load i64, i64* %3, align 8
  %29 = getelementptr inbounds i8, i8* %27, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i64
  %32 = getelementptr inbounds [256 x i64], [256 x i64]* @table, i64 0, i64 %31
  store i64 %26, i64* %32, align 8
  br label %33

; <label>:33:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_search, i64 0, i64 1)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_search, i64 0, i64 1)
  %35 = load i64, i64* %3, align 8
  %36 = add i64 %35, 1
  store i64 %36, i64* %3, align 8
  br label %18

; <label>:37:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_search, i64 0, i64 2)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_search, i64 0, i64 2)
  %39 = load i8*, i8** %2, align 8
  store i8* %39, i8** @findme, align 8
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: nounwind uwtable
define i8* @strsearch(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  %8 = load i64, i64* @len, align 8
  %9 = sub i64 %8, 1
  store i64 %9, i64* %5, align 8
  %10 = load i8*, i8** %3, align 8
  %11 = call i64 @strlen(i8* %10) #6
  store i64 %11, i64* %7, align 8
  br label %12

; <label>:12:                                     ; preds = %60, %1
  %13 = load i64, i64* %5, align 8
  %14 = load i64, i64* %7, align 8
  %15 = icmp ult i64 %13, %14
  br i1 %15, label %16, label %62

; <label>:16:                                     ; preds = %12
  br label %17

; <label>:17:                                     ; preds = %33, %16
  %18 = load i64, i64* %5, align 8
  %19 = load i64, i64* %7, align 8
  %20 = icmp ult i64 %18, %19
  br i1 %20, label %21, label %31

; <label>:21:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 1)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 1)
  %23 = load i8*, i8** %3, align 8
  %24 = load i64, i64* %5, align 8
  %25 = getelementptr inbounds i8, i8* %23, i64 %24
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i64
  %28 = getelementptr inbounds [256 x i64], [256 x i64]* @table, i64 0, i64 %27
  %29 = load i64, i64* %28, align 8
  store i64 %29, i64* %4, align 8
  %30 = icmp ugt i64 %29, 0
  br label %31

; <label>:31:                                     ; preds = %21, %17
  %32 = phi i1 [ false, %17 ], [ %30, %21 ]
  br i1 %32, label %33, label %38

; <label>:33:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 0)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 0)
  %35 = load i64, i64* %4, align 8
  %36 = load i64, i64* %5, align 8
  %37 = add i64 %36, %35
  store i64 %37, i64* %5, align 8
  br label %17

; <label>:38:                                     ; preds = %31
  %39 = load i64, i64* %4, align 8
  %40 = icmp eq i64 0, %39
  br i1 %40, label %41, label %60

; <label>:41:                                     ; preds = %38
  %42 = load i8*, i8** @findme, align 8
  %43 = load i8*, i8** %3, align 8
  %44 = load i64, i64* %5, align 8
  %45 = load i64, i64* @len, align 8
  %46 = sub i64 %44, %45
  %47 = add i64 %46, 1
  %48 = getelementptr inbounds i8, i8* %43, i64 %47
  store i8* %48, i8** %6, align 8
  %49 = load i64, i64* @len, align 8
  %50 = call i32 @strncmp(i8* %42, i8* %48, i64 %49) #6
  %51 = icmp eq i32 0, %50
  br i1 %51, label %52, label %55

; <label>:52:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 5)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 5)
  %54 = load i8*, i8** %6, align 8
  store i8* %54, i8** %2, align 8
  br label %64

; <label>:55:                                     ; preds = %41
  %56 = load i64, i64* %5, align 8
  %57 = add i64 %56, 1
  store i64 %57, i64* %5, align 8
  br label %58

; <label>:58:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 3)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 3)
  br label %60

; <label>:60:                                     ; preds = %58, %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 2)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 2)
  br label %12

; <label>:62:                                     ; preds = %12
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 4)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_strsearch, i64 0, i64 4)
  store i8* null, i8** %2, align 8
  br label %64

; <label>:64:                                     ; preds = %62, %52
  %65 = load i8*, i8** %2, align 8
  ret i8* %65
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  %10 = alloca %struct._IO_FILE*, align 8
  %11 = alloca %struct._IO_FILE*, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca [128000 x i8*], align 16
  %17 = alloca [128000 x i8*], align 16
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i8*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i8* null, i8** %6, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %8, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %9, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %10, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %11, align 8
  store i64 0, i64* %14, align 8
  store i64 0, i64* %15, align 8
  store i64 0, i64* %18, align 8
  store i64 0, i64* %19, align 8
  %22 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %22, %struct._IO_FILE** %8, align 8
  %23 = icmp eq %struct._IO_FILE* %22, null
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 14)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 14)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:28:                                     ; preds = %2
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64* %13)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %32 = call i32 @fclose(%struct._IO_FILE* %31)
  %33 = load i32, i32* %4, align 4
  %34 = icmp slt i32 %33, 3
  br i1 %34, label %35, label %39

; <label>:35:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 15)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 15)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:39:                                     ; preds = %28
  %40 = load i8**, i8*** %5, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 1
  %42 = load i8*, i8** %41, align 8
  %43 = call %struct._IO_FILE* @fopen(i8* %42, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %43, %struct._IO_FILE** %9, align 8
  %44 = icmp eq %struct._IO_FILE* %43, null
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 16)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 16)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:49:                                     ; preds = %39
  %50 = load i8**, i8*** %5, align 8
  %51 = getelementptr inbounds i8*, i8** %50, i64 2
  %52 = load i8*, i8** %51, align 8
  %53 = call %struct._IO_FILE* @fopen(i8* %52, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %53, %struct._IO_FILE** %10, align 8
  %54 = icmp eq %struct._IO_FILE* %53, null
  br i1 %54, label %55, label %59

; <label>:55:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 17)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 17)
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:59:                                     ; preds = %49
  store i64 0, i64* %18, align 8
  br label %60

; <label>:60:                                     ; preds = %71, %59
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %62 = call i8* @fgets(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0), i32 1024, %struct._IO_FILE* %61)
  %63 = icmp ne i8* %62, null
  br i1 %63, label %64, label %69

; <label>:64:                                     ; preds = %60
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 6)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 6)
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %67 = call i32 @feof(%struct._IO_FILE* %66) #5
  %68 = icmp eq i32 %67, 0
  br label %69

; <label>:69:                                     ; preds = %64, %60
  %70 = phi i1 [ false, %60 ], [ %68, %64 ]
  br i1 %70, label %71, label %79

; <label>:71:                                     ; preds = %69
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 1)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 1)
  %73 = load i64, i64* %18, align 8
  %74 = add nsw i64 %73, 1
  store i64 %74, i64* %18, align 8
  %75 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #6
  %76 = add i64 %75, 1
  %77 = load i64, i64* %14, align 8
  %78 = add i64 %77, %76
  store i64 %78, i64* %14, align 8
  br label %60

; <label>:79:                                     ; preds = %69
  store i64 0, i64* %19, align 8
  br label %80

; <label>:80:                                     ; preds = %91, %79
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %82 = call i8* @fgets(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0), i32 1024, %struct._IO_FILE* %81)
  %83 = icmp ne i8* %82, null
  br i1 %83, label %84, label %89

; <label>:84:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 7)
  %85 = add i64 %pgocount6, 1
  store i64 %85, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 7)
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %87 = call i32 @feof(%struct._IO_FILE* %86) #5
  %88 = icmp eq i32 %87, 0
  br label %89

; <label>:89:                                     ; preds = %84, %80
  %90 = phi i1 [ false, %80 ], [ %88, %84 ]
  br i1 %90, label %91, label %99

; <label>:91:                                     ; preds = %89
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 2)
  %92 = add i64 %pgocount7, 1
  store i64 %92, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 2)
  %93 = load i64, i64* %19, align 8
  %94 = add nsw i64 %93, 1
  store i64 %94, i64* %19, align 8
  %95 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #6
  %96 = add i64 %95, 1
  %97 = load i64, i64* %15, align 8
  %98 = add i64 %97, %96
  store i64 %98, i64* %15, align 8
  br label %80

; <label>:99:                                     ; preds = %89
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %101 = call i32 @fclose(%struct._IO_FILE* %100)
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %103 = call i32 @fclose(%struct._IO_FILE* %102)
  %104 = load i64, i64* %14, align 8
  %105 = load i64, i64* %15, align 8
  %106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i32 0, i32 0), i64 %104, i64 %105)
  %107 = load i64, i64* %14, align 8
  %108 = mul i64 1, %107
  %109 = call noalias i8* @malloc(i64 %108) #5
  store i8* %109, i8** %20, align 8
  %110 = load i64, i64* %15, align 8
  %111 = mul i64 1, %110
  %112 = call noalias i8* @malloc(i64 %111) #5
  store i8* %112, i8** %21, align 8
  %113 = load i8**, i8*** %5, align 8
  %114 = getelementptr inbounds i8*, i8** %113, i64 1
  %115 = load i8*, i8** %114, align 8
  %116 = call %struct._IO_FILE* @fopen(i8* %115, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %116, %struct._IO_FILE** %9, align 8
  %117 = icmp eq %struct._IO_FILE* %116, null
  br i1 %117, label %118, label %122

; <label>:118:                                    ; preds = %99
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 18)
  %119 = add i64 %pgocount8, 1
  store i64 %119, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 18)
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %121 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %120, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:122:                                    ; preds = %99
  %123 = load i8**, i8*** %5, align 8
  %124 = getelementptr inbounds i8*, i8** %123, i64 2
  %125 = load i8*, i8** %124, align 8
  %126 = call %struct._IO_FILE* @fopen(i8* %125, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %126, %struct._IO_FILE** %10, align 8
  %127 = icmp eq %struct._IO_FILE* %126, null
  br i1 %127, label %128, label %132

; <label>:128:                                    ; preds = %122
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 19)
  %129 = add i64 %pgocount9, 1
  store i64 %129, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 19)
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %131 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %130, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:132:                                    ; preds = %122
  store i64 0, i64* %18, align 8
  store i64 0, i64* %14, align 8
  br label %133

; <label>:133:                                    ; preds = %152, %132
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %135 = call i8* @fgets(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0), i32 1024, %struct._IO_FILE* %134)
  %136 = icmp ne i8* %135, null
  br i1 %136, label %137, label %142

; <label>:137:                                    ; preds = %133
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 8)
  %138 = add i64 %pgocount10, 1
  store i64 %138, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 8)
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %140 = call i32 @feof(%struct._IO_FILE* %139) #5
  %141 = icmp eq i32 %140, 0
  br label %142

; <label>:142:                                    ; preds = %137, %133
  %143 = phi i1 [ false, %133 ], [ %141, %137 ]
  br i1 %143, label %144, label %169

; <label>:144:                                    ; preds = %142
  %145 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #6
  %146 = icmp ugt i64 %145, 0
  br i1 %146, label %147, label %152

; <label>:147:                                    ; preds = %144
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 11)
  %148 = add i64 %pgocount11, 1
  store i64 %148, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 11)
  %149 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #6
  %150 = sub i64 %149, 1
  %151 = getelementptr inbounds [1024 x i8], [1024 x i8]* @str_misc, i64 0, i64 %150
  store i8 0, i8* %151, align 1
  br label %152

; <label>:152:                                    ; preds = %147, %144
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 3)
  %153 = add i64 %pgocount12, 1
  store i64 %153, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 3)
  %154 = load i8*, i8** %20, align 8
  %155 = load i64, i64* %14, align 8
  %156 = getelementptr inbounds i8, i8* %154, i64 %155
  %157 = call i8* @strcpy(i8* %156, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %158 = load i8*, i8** %20, align 8
  %159 = load i64, i64* %14, align 8
  %160 = getelementptr inbounds i8, i8* %158, i64 %159
  %161 = load i64, i64* %18, align 8
  %162 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %16, i64 0, i64 %161
  store i8* %160, i8** %162, align 8
  %163 = load i64, i64* %18, align 8
  %164 = add nsw i64 %163, 1
  store i64 %164, i64* %18, align 8
  %165 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #6
  %166 = add i64 %165, 1
  %167 = load i64, i64* %14, align 8
  %168 = add i64 %167, %166
  store i64 %168, i64* %14, align 8
  br label %133

; <label>:169:                                    ; preds = %142
  %170 = load i64, i64* %18, align 8
  %171 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %16, i64 0, i64 %170
  store i8* null, i8** %171, align 8
  store i64 0, i64* %19, align 8
  store i64 0, i64* %15, align 8
  br label %172

; <label>:172:                                    ; preds = %191, %169
  %173 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %174 = call i8* @fgets(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0), i32 1024, %struct._IO_FILE* %173)
  %175 = icmp ne i8* %174, null
  br i1 %175, label %176, label %181

; <label>:176:                                    ; preds = %172
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 9)
  %177 = add i64 %pgocount13, 1
  store i64 %177, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 9)
  %178 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %179 = call i32 @feof(%struct._IO_FILE* %178) #5
  %180 = icmp eq i32 %179, 0
  br label %181

; <label>:181:                                    ; preds = %176, %172
  %182 = phi i1 [ false, %172 ], [ %180, %176 ]
  br i1 %182, label %183, label %208

; <label>:183:                                    ; preds = %181
  %184 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #6
  %185 = icmp ugt i64 %184, 0
  br i1 %185, label %186, label %191

; <label>:186:                                    ; preds = %183
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 12)
  %187 = add i64 %pgocount14, 1
  store i64 %187, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 12)
  %188 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #6
  %189 = sub i64 %188, 1
  %190 = getelementptr inbounds [1024 x i8], [1024 x i8]* @str_misc, i64 0, i64 %189
  store i8 0, i8* %190, align 1
  br label %191

; <label>:191:                                    ; preds = %186, %183
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 4)
  %192 = add i64 %pgocount15, 1
  store i64 %192, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 4)
  %193 = load i8*, i8** %21, align 8
  %194 = load i64, i64* %15, align 8
  %195 = getelementptr inbounds i8, i8* %193, i64 %194
  %196 = call i8* @strcpy(i8* %195, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %197 = load i8*, i8** %21, align 8
  %198 = load i64, i64* %15, align 8
  %199 = getelementptr inbounds i8, i8* %197, i64 %198
  %200 = load i64, i64* %19, align 8
  %201 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %200
  store i8* %199, i8** %201, align 8
  %202 = load i64, i64* %19, align 8
  %203 = add nsw i64 %202, 1
  store i64 %203, i64* %19, align 8
  %204 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #6
  %205 = add i64 %204, 1
  %206 = load i64, i64* %15, align 8
  %207 = add i64 %206, %205
  store i64 %207, i64* %15, align 8
  br label %172

; <label>:208:                                    ; preds = %181
  %209 = load i64, i64* %19, align 8
  %210 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %209
  store i8* null, i8** %210, align 8
  %211 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %212 = call i32 @fclose(%struct._IO_FILE* %211)
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %214 = call i32 @fclose(%struct._IO_FILE* %213)
  %215 = load i8**, i8*** %5, align 8
  %216 = getelementptr inbounds i8*, i8** %215, i64 3
  %217 = load i8*, i8** %216, align 8
  %218 = call %struct._IO_FILE* @fopen(i8* %217, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
  store %struct._IO_FILE* %218, %struct._IO_FILE** %11, align 8
  %219 = icmp eq %struct._IO_FILE* %218, null
  br i1 %219, label %220, label %224

; <label>:220:                                    ; preds = %208
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 20)
  %221 = add i64 %pgocount16, 1
  store i64 %221, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 20)
  %222 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %223 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %222, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.9, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:224:                                    ; preds = %208
  store i32 0, i32* %7, align 4
  br label %225

; <label>:225:                                    ; preds = %276, %224
  %226 = load i32, i32* %7, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %227
  %229 = load i8*, i8** %228, align 8
  %230 = icmp ne i8* %229, null
  br i1 %230, label %231, label %280

; <label>:231:                                    ; preds = %225
  %232 = load i32, i32* %7, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %233
  %235 = load i8*, i8** %234, align 8
  call void @init_search(i8* %235)
  store i64 0, i64* %12, align 8
  br label %236

; <label>:236:                                    ; preds = %246, %231
  %237 = load i64, i64* %12, align 8
  %238 = load i64, i64* %13, align 8
  %239 = icmp slt i64 %237, %238
  br i1 %239, label %240, label %250

; <label>:240:                                    ; preds = %236
  %241 = load i32, i32* %7, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %16, i64 0, i64 %242
  %244 = load i8*, i8** %243, align 8
  %245 = call i8* @strsearch(i8* %244)
  store i8* %245, i8** %6, align 8
  br label %246

; <label>:246:                                    ; preds = %240
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 0)
  %247 = add i64 %pgocount17, 1
  store i64 %247, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 0)
  %248 = load i64, i64* %12, align 8
  %249 = add nsw i64 %248, 1
  store i64 %249, i64* %12, align 8
  br label %236

; <label>:250:                                    ; preds = %236
  %251 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %252 = load i32, i32* %7, align 4
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %253
  %255 = load i8*, i8** %254, align 8
  %256 = load i8*, i8** %6, align 8
  %257 = icmp ne i8* %256, null
  %258 = zext i1 %257 to i64
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 21)
  %259 = add i64 %pgocount18, %258
  store i64 %259, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 21)
  %260 = select i1 %257, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0)
  %261 = load i32, i32* %7, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %16, i64 0, i64 %262
  %264 = load i8*, i8** %263, align 8
  %265 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %251, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i32 0, i32 0), i8* %255, i8* %260, i8* %264)
  %266 = load i8*, i8** %6, align 8
  %267 = icmp ne i8* %266, null
  br i1 %267, label %268, label %273

; <label>:268:                                    ; preds = %250
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 10)
  %269 = add i64 %pgocount19, 1
  store i64 %269, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 10)
  %270 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %271 = load i8*, i8** %6, align 8
  %272 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %270, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i32 0, i32 0), i8* %271)
  br label %273

; <label>:273:                                    ; preds = %268, %250
  %274 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %275 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %274, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0))
  br label %276

; <label>:276:                                    ; preds = %273
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 5)
  %277 = add i64 %pgocount20, 1
  store i64 %277, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 5)
  %278 = load i32, i32* %7, align 4
  %279 = add nsw i32 %278, 1
  store i32 %279, i32* %7, align 4
  br label %225

; <label>:280:                                    ; preds = %225
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 13)
  %281 = add i64 %pgocount21, 1
  store i64 %281, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_main, i64 0, i64 13)
  %282 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %283 = call i32 @fclose(%struct._IO_FILE* %282)
  ret i32 0
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fclose(%struct._IO_FILE*) #2

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #4

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
