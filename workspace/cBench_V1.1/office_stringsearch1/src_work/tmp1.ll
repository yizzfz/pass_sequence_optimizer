; ModuleID = 'pbmsrch_large.ll'
source_filename = "pbmsrch_large.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

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

; Function Attrs: nounwind uwtable
define void @init_search(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i64 @strlen(i8* %4) #5
  store i64 %5, i64* @len, align 8
  store i64 0, i64* %3, align 8
  br label %6

; <label>:6:                                      ; preds = %13, %1
  %7 = load i64, i64* %3, align 8
  %8 = icmp ule i64 %7, 255
  br i1 %8, label %9, label %16

; <label>:9:                                      ; preds = %6
  %10 = load i64, i64* @len, align 8
  %11 = load i64, i64* %3, align 8
  %12 = getelementptr inbounds [256 x i64], [256 x i64]* @table, i64 0, i64 %11
  store i64 %10, i64* %12, align 8
  br label %13

; <label>:13:                                     ; preds = %9
  %14 = load i64, i64* %3, align 8
  %15 = add i64 %14, 1
  store i64 %15, i64* %3, align 8
  br label %6

; <label>:16:                                     ; preds = %6
  store i64 0, i64* %3, align 8
  br label %17

; <label>:17:                                     ; preds = %32, %16
  %18 = load i64, i64* %3, align 8
  %19 = load i64, i64* @len, align 8
  %20 = icmp ult i64 %18, %19
  br i1 %20, label %21, label %35

; <label>:21:                                     ; preds = %17
  %22 = load i64, i64* @len, align 8
  %23 = load i64, i64* %3, align 8
  %24 = sub i64 %22, %23
  %25 = sub i64 %24, 1
  %26 = load i8*, i8** %2, align 8
  %27 = load i64, i64* %3, align 8
  %28 = getelementptr inbounds i8, i8* %26, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i64
  %31 = getelementptr inbounds [256 x i64], [256 x i64]* @table, i64 0, i64 %30
  store i64 %25, i64* %31, align 8
  br label %32

; <label>:32:                                     ; preds = %21
  %33 = load i64, i64* %3, align 8
  %34 = add i64 %33, 1
  store i64 %34, i64* %3, align 8
  br label %17

; <label>:35:                                     ; preds = %17
  %36 = load i8*, i8** %2, align 8
  store i8* %36, i8** @findme, align 8
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
  %11 = call i64 @strlen(i8* %10) #5
  store i64 %11, i64* %7, align 8
  br label %12

; <label>:12:                                     ; preds = %56, %1
  %13 = load i64, i64* %5, align 8
  %14 = load i64, i64* %7, align 8
  %15 = icmp ult i64 %13, %14
  br i1 %15, label %16, label %57

; <label>:16:                                     ; preds = %12
  br label %17

; <label>:17:                                     ; preds = %32, %16
  %18 = load i64, i64* %5, align 8
  %19 = load i64, i64* %7, align 8
  %20 = icmp ult i64 %18, %19
  br i1 %20, label %21, label %30

; <label>:21:                                     ; preds = %17
  %22 = load i8*, i8** %3, align 8
  %23 = load i64, i64* %5, align 8
  %24 = getelementptr inbounds i8, i8* %22, i64 %23
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i64
  %27 = getelementptr inbounds [256 x i64], [256 x i64]* @table, i64 0, i64 %26
  %28 = load i64, i64* %27, align 8
  store i64 %28, i64* %4, align 8
  %29 = icmp ugt i64 %28, 0
  br label %30

; <label>:30:                                     ; preds = %21, %17
  %31 = phi i1 [ false, %17 ], [ %29, %21 ]
  br i1 %31, label %32, label %36

; <label>:32:                                     ; preds = %30
  %33 = load i64, i64* %4, align 8
  %34 = load i64, i64* %5, align 8
  %35 = add i64 %34, %33
  store i64 %35, i64* %5, align 8
  br label %17

; <label>:36:                                     ; preds = %30
  %37 = load i64, i64* %4, align 8
  %38 = icmp eq i64 0, %37
  br i1 %38, label %39, label %56

; <label>:39:                                     ; preds = %36
  %40 = load i8*, i8** @findme, align 8
  %41 = load i8*, i8** %3, align 8
  %42 = load i64, i64* %5, align 8
  %43 = load i64, i64* @len, align 8
  %44 = sub i64 %42, %43
  %45 = add i64 %44, 1
  %46 = getelementptr inbounds i8, i8* %41, i64 %45
  store i8* %46, i8** %6, align 8
  %47 = load i64, i64* @len, align 8
  %48 = call i32 @strncmp(i8* %40, i8* %46, i64 %47) #5
  %49 = icmp eq i32 0, %48
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %39
  %51 = load i8*, i8** %6, align 8
  store i8* %51, i8** %2, align 8
  br label %58

; <label>:52:                                     ; preds = %39
  %53 = load i64, i64* %5, align 8
  %54 = add i64 %53, 1
  store i64 %54, i64* %5, align 8
  br label %55

; <label>:55:                                     ; preds = %52
  br label %56

; <label>:56:                                     ; preds = %55, %36
  br label %12

; <label>:57:                                     ; preds = %12
  store i8* null, i8** %2, align 8
  br label %58

; <label>:58:                                     ; preds = %57, %50
  %59 = load i8*, i8** %2, align 8
  ret i8* %59
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
  br i1 %23, label %24, label %27

; <label>:24:                                     ; preds = %2
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:27:                                     ; preds = %2
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64* %13)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load i32, i32* %4, align 4
  %33 = icmp slt i32 %32, 3
  br i1 %33, label %34, label %37

; <label>:34:                                     ; preds = %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:37:                                     ; preds = %27
  %38 = load i8**, i8*** %5, align 8
  %39 = getelementptr inbounds i8*, i8** %38, i64 1
  %40 = load i8*, i8** %39, align 8
  %41 = call %struct._IO_FILE* @fopen(i8* %40, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %41, %struct._IO_FILE** %9, align 8
  %42 = icmp eq %struct._IO_FILE* %41, null
  br i1 %42, label %43, label %46

; <label>:43:                                     ; preds = %37
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:46:                                     ; preds = %37
  %47 = load i8**, i8*** %5, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 2
  %49 = load i8*, i8** %48, align 8
  %50 = call %struct._IO_FILE* @fopen(i8* %49, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %50, %struct._IO_FILE** %10, align 8
  %51 = icmp eq %struct._IO_FILE* %50, null
  br i1 %51, label %52, label %55

; <label>:52:                                     ; preds = %46
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:55:                                     ; preds = %46
  store i64 0, i64* %18, align 8
  br label %56

; <label>:56:                                     ; preds = %66, %55
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %58 = call i8* @fgets(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0), i32 1024, %struct._IO_FILE* %57)
  %59 = icmp ne i8* %58, null
  br i1 %59, label %60, label %64

; <label>:60:                                     ; preds = %56
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %62 = call i32 @feof(%struct._IO_FILE* %61) #7
  %63 = icmp eq i32 %62, 0
  br label %64

; <label>:64:                                     ; preds = %60, %56
  %65 = phi i1 [ false, %56 ], [ %63, %60 ]
  br i1 %65, label %66, label %73

; <label>:66:                                     ; preds = %64
  %67 = load i64, i64* %18, align 8
  %68 = add nsw i64 %67, 1
  store i64 %68, i64* %18, align 8
  %69 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %70 = add i64 %69, 1
  %71 = load i64, i64* %14, align 8
  %72 = add i64 %71, %70
  store i64 %72, i64* %14, align 8
  br label %56

; <label>:73:                                     ; preds = %64
  store i64 0, i64* %19, align 8
  br label %74

; <label>:74:                                     ; preds = %84, %73
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %76 = call i8* @fgets(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0), i32 1024, %struct._IO_FILE* %75)
  %77 = icmp ne i8* %76, null
  br i1 %77, label %78, label %82

; <label>:78:                                     ; preds = %74
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %80 = call i32 @feof(%struct._IO_FILE* %79) #7
  %81 = icmp eq i32 %80, 0
  br label %82

; <label>:82:                                     ; preds = %78, %74
  %83 = phi i1 [ false, %74 ], [ %81, %78 ]
  br i1 %83, label %84, label %91

; <label>:84:                                     ; preds = %82
  %85 = load i64, i64* %19, align 8
  %86 = add nsw i64 %85, 1
  store i64 %86, i64* %19, align 8
  %87 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %88 = add i64 %87, 1
  %89 = load i64, i64* %15, align 8
  %90 = add i64 %89, %88
  store i64 %90, i64* %15, align 8
  br label %74

; <label>:91:                                     ; preds = %82
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %93 = call i32 @fclose(%struct._IO_FILE* %92)
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %95 = call i32 @fclose(%struct._IO_FILE* %94)
  %96 = load i64, i64* %14, align 8
  %97 = load i64, i64* %15, align 8
  %98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i32 0, i32 0), i64 %96, i64 %97)
  %99 = load i64, i64* %14, align 8
  %100 = mul i64 1, %99
  %101 = call noalias i8* @malloc(i64 %100) #7
  store i8* %101, i8** %20, align 8
  %102 = load i64, i64* %15, align 8
  %103 = mul i64 1, %102
  %104 = call noalias i8* @malloc(i64 %103) #7
  store i8* %104, i8** %21, align 8
  %105 = load i8**, i8*** %5, align 8
  %106 = getelementptr inbounds i8*, i8** %105, i64 1
  %107 = load i8*, i8** %106, align 8
  %108 = call %struct._IO_FILE* @fopen(i8* %107, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %108, %struct._IO_FILE** %9, align 8
  %109 = icmp eq %struct._IO_FILE* %108, null
  br i1 %109, label %110, label %113

; <label>:110:                                    ; preds = %91
  %111 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %112 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %111, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:113:                                    ; preds = %91
  %114 = load i8**, i8*** %5, align 8
  %115 = getelementptr inbounds i8*, i8** %114, i64 2
  %116 = load i8*, i8** %115, align 8
  %117 = call %struct._IO_FILE* @fopen(i8* %116, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %117, %struct._IO_FILE** %10, align 8
  %118 = icmp eq %struct._IO_FILE* %117, null
  br i1 %118, label %119, label %122

; <label>:119:                                    ; preds = %113
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %121 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %120, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:122:                                    ; preds = %113
  store i64 0, i64* %18, align 8
  store i64 0, i64* %14, align 8
  br label %123

; <label>:123:                                    ; preds = %140, %122
  %124 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %125 = call i8* @fgets(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0), i32 1024, %struct._IO_FILE* %124)
  %126 = icmp ne i8* %125, null
  br i1 %126, label %127, label %131

; <label>:127:                                    ; preds = %123
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %129 = call i32 @feof(%struct._IO_FILE* %128) #7
  %130 = icmp eq i32 %129, 0
  br label %131

; <label>:131:                                    ; preds = %127, %123
  %132 = phi i1 [ false, %123 ], [ %130, %127 ]
  br i1 %132, label %133, label %156

; <label>:133:                                    ; preds = %131
  %134 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %135 = icmp ugt i64 %134, 0
  br i1 %135, label %136, label %140

; <label>:136:                                    ; preds = %133
  %137 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %138 = sub i64 %137, 1
  %139 = getelementptr inbounds [1024 x i8], [1024 x i8]* @str_misc, i64 0, i64 %138
  store i8 0, i8* %139, align 1
  br label %140

; <label>:140:                                    ; preds = %136, %133
  %141 = load i8*, i8** %20, align 8
  %142 = load i64, i64* %14, align 8
  %143 = getelementptr inbounds i8, i8* %141, i64 %142
  %144 = call i8* @strcpy(i8* %143, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #7
  %145 = load i8*, i8** %20, align 8
  %146 = load i64, i64* %14, align 8
  %147 = getelementptr inbounds i8, i8* %145, i64 %146
  %148 = load i64, i64* %18, align 8
  %149 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %16, i64 0, i64 %148
  store i8* %147, i8** %149, align 8
  %150 = load i64, i64* %18, align 8
  %151 = add nsw i64 %150, 1
  store i64 %151, i64* %18, align 8
  %152 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %153 = add i64 %152, 1
  %154 = load i64, i64* %14, align 8
  %155 = add i64 %154, %153
  store i64 %155, i64* %14, align 8
  br label %123

; <label>:156:                                    ; preds = %131
  %157 = load i64, i64* %18, align 8
  %158 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %16, i64 0, i64 %157
  store i8* null, i8** %158, align 8
  store i64 0, i64* %19, align 8
  store i64 0, i64* %15, align 8
  br label %159

; <label>:159:                                    ; preds = %176, %156
  %160 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %161 = call i8* @fgets(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0), i32 1024, %struct._IO_FILE* %160)
  %162 = icmp ne i8* %161, null
  br i1 %162, label %163, label %167

; <label>:163:                                    ; preds = %159
  %164 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %165 = call i32 @feof(%struct._IO_FILE* %164) #7
  %166 = icmp eq i32 %165, 0
  br label %167

; <label>:167:                                    ; preds = %163, %159
  %168 = phi i1 [ false, %159 ], [ %166, %163 ]
  br i1 %168, label %169, label %192

; <label>:169:                                    ; preds = %167
  %170 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %171 = icmp ugt i64 %170, 0
  br i1 %171, label %172, label %176

; <label>:172:                                    ; preds = %169
  %173 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %174 = sub i64 %173, 1
  %175 = getelementptr inbounds [1024 x i8], [1024 x i8]* @str_misc, i64 0, i64 %174
  store i8 0, i8* %175, align 1
  br label %176

; <label>:176:                                    ; preds = %172, %169
  %177 = load i8*, i8** %21, align 8
  %178 = load i64, i64* %15, align 8
  %179 = getelementptr inbounds i8, i8* %177, i64 %178
  %180 = call i8* @strcpy(i8* %179, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #7
  %181 = load i8*, i8** %21, align 8
  %182 = load i64, i64* %15, align 8
  %183 = getelementptr inbounds i8, i8* %181, i64 %182
  %184 = load i64, i64* %19, align 8
  %185 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %184
  store i8* %183, i8** %185, align 8
  %186 = load i64, i64* %19, align 8
  %187 = add nsw i64 %186, 1
  store i64 %187, i64* %19, align 8
  %188 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @str_misc, i32 0, i32 0)) #5
  %189 = add i64 %188, 1
  %190 = load i64, i64* %15, align 8
  %191 = add i64 %190, %189
  store i64 %191, i64* %15, align 8
  br label %159

; <label>:192:                                    ; preds = %167
  %193 = load i64, i64* %19, align 8
  %194 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %193
  store i8* null, i8** %194, align 8
  %195 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %196 = call i32 @fclose(%struct._IO_FILE* %195)
  %197 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %198 = call i32 @fclose(%struct._IO_FILE* %197)
  %199 = load i8**, i8*** %5, align 8
  %200 = getelementptr inbounds i8*, i8** %199, i64 3
  %201 = load i8*, i8** %200, align 8
  %202 = call %struct._IO_FILE* @fopen(i8* %201, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
  store %struct._IO_FILE* %202, %struct._IO_FILE** %11, align 8
  %203 = icmp eq %struct._IO_FILE* %202, null
  br i1 %203, label %204, label %207

; <label>:204:                                    ; preds = %192
  %205 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %206 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %205, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.9, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:207:                                    ; preds = %192
  store i32 0, i32* %7, align 4
  br label %208

; <label>:208:                                    ; preds = %255, %207
  %209 = load i32, i32* %7, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %210
  %212 = load i8*, i8** %211, align 8
  %213 = icmp ne i8* %212, null
  br i1 %213, label %214, label %258

; <label>:214:                                    ; preds = %208
  %215 = load i32, i32* %7, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %216
  %218 = load i8*, i8** %217, align 8
  call void @init_search(i8* %218)
  store i64 0, i64* %12, align 8
  br label %219

; <label>:219:                                    ; preds = %229, %214
  %220 = load i64, i64* %12, align 8
  %221 = load i64, i64* %13, align 8
  %222 = icmp slt i64 %220, %221
  br i1 %222, label %223, label %232

; <label>:223:                                    ; preds = %219
  %224 = load i32, i32* %7, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %16, i64 0, i64 %225
  %227 = load i8*, i8** %226, align 8
  %228 = call i8* @strsearch(i8* %227)
  store i8* %228, i8** %6, align 8
  br label %229

; <label>:229:                                    ; preds = %223
  %230 = load i64, i64* %12, align 8
  %231 = add nsw i64 %230, 1
  store i64 %231, i64* %12, align 8
  br label %219

; <label>:232:                                    ; preds = %219
  %233 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %234 = load i32, i32* %7, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %17, i64 0, i64 %235
  %237 = load i8*, i8** %236, align 8
  %238 = load i8*, i8** %6, align 8
  %239 = icmp ne i8* %238, null
  %240 = select i1 %239, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0)
  %241 = load i32, i32* %7, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [128000 x i8*], [128000 x i8*]* %16, i64 0, i64 %242
  %244 = load i8*, i8** %243, align 8
  %245 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %233, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i32 0, i32 0), i8* %237, i8* %240, i8* %244)
  %246 = load i8*, i8** %6, align 8
  %247 = icmp ne i8* %246, null
  br i1 %247, label %248, label %252

; <label>:248:                                    ; preds = %232
  %249 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %250 = load i8*, i8** %6, align 8
  %251 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %249, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i32 0, i32 0), i8* %250)
  br label %252

; <label>:252:                                    ; preds = %248, %232
  %253 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %254 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %253, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0))
  br label %255

; <label>:255:                                    ; preds = %252
  %256 = load i32, i32* %7, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, i32* %7, align 4
  br label %208

; <label>:258:                                    ; preds = %208
  %259 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %260 = call i32 @fclose(%struct._IO_FILE* %259)
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

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
