; ModuleID = 'tmp1.ll'
source_filename = "aesxam.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.aes = type { i64, i64, [64 x i64], [64 x i64], i8 }
%struct._G_fpos_t = type { i64, %struct.__mbstate_t }
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }

$__llvm_profile_raw_version = comdat any

@fillrand.a = internal global [2 x i64] zeroinitializer, align 16
@fillrand.mt = internal global i64 1, align 8
@fillrand.count = internal global i64 4, align 8
@fillrand.r = internal global [4 x i8] zeroinitializer, align 1
@.str = private unnamed_addr constant [34 x i8] c"Error writing to output file: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Error reading from input file: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"\0AThe input file is corrupt\00", align 1
@.str.3 = private unnamed_addr constant [59 x i8] c"usage: rijndael in_filename out_filename [d/e] key_in_hex\0A\00", align 1
@.str.4 = private unnamed_addr constant [37 x i8] c"key must be in hexadecimal notation\0A\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"The key value is too long\0A\00", align 1
@.str.6 = private unnamed_addr constant [56 x i8] c"The key length must be 32, 48 or 64 hexadecimal digits\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.8 = private unnamed_addr constant [40 x i8] c"The input file: %s could not be opened\0A\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"The output file: %s could not be opened\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_fillrand = private constant [8 x i8] c"fillrand"
@__profn_encfile = private constant [7 x i8] c"encfile"
@__profn_decfile = private constant [7 x i8] c"decfile"
@__profn_main1 = private constant [5 x i8] c"main1"
@__profc_fillrand = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_fillrand = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4934616263153746467, i64 58593681436, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i32 0, i32 0), i8* bitcast (void (i8*, i32)* @fillrand to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_encfile = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_encfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8839004598665009719, i64 155084929092, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct._IO_FILE*, %struct.aes*, i8*)* @encfile to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_decfile = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_decfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3596697558253041363, i64 72057744736675087, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct._IO_FILE*, %struct.aes*, i8*, i8*)* @decfile to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main1 = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 248793699033, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main1 to i8*), i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [35 x i8] c"\1E!x\DAK\CB\CC\C9)J\CCKaL\CDKN\CB\CCIeLI\85\D0\B9\89\99y\86\00\AC\86\0A\C8", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_fillrand to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_encfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_decfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @fillrand(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i64, i64* @fillrand.mt, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i64 0, i64 3)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i64 0, i64 3)
  store i64 0, i64* @fillrand.mt, align 8
  store i64 60147, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @fillrand.a, i64 0, i64 0), align 16
  store i64 13822, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @fillrand.a, i64 0, i64 1), align 8
  br label %10

; <label>:10:                                     ; preds = %8, %2
  store i32 0, i32* %5, align 4
  br label %11

; <label>:11:                                     ; preds = %43, %10
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %47

; <label>:15:                                     ; preds = %11
  %16 = load i64, i64* @fillrand.count, align 8
  %17 = icmp eq i64 %16, 4
  br i1 %17, label %18, label %34

; <label>:18:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i64 0, i64 1)
  %20 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @fillrand.a, i64 0, i64 0), align 16
  %21 = and i64 %20, 65535
  %22 = mul i64 36969, %21
  %23 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @fillrand.a, i64 0, i64 0), align 16
  %24 = lshr i64 %23, 16
  %25 = add i64 %22, %24
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @fillrand.a, i64 0, i64 0), align 16
  %26 = shl i64 %25, 16
  %27 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @fillrand.a, i64 0, i64 1), align 8
  %28 = and i64 %27, 65535
  %29 = mul i64 18000, %28
  %30 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @fillrand.a, i64 0, i64 1), align 8
  %31 = lshr i64 %30, 16
  %32 = add i64 %29, %31
  store i64 %32, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @fillrand.a, i64 0, i64 1), align 8
  %33 = add i64 %26, %32
  store i64 %33, i64* bitcast ([4 x i8]* @fillrand.r to i64*), align 1
  store i64 0, i64* @fillrand.count, align 8
  br label %34

; <label>:34:                                     ; preds = %18, %15
  %35 = load i64, i64* @fillrand.count, align 8
  %36 = add i64 %35, 1
  store i64 %36, i64* @fillrand.count, align 8
  %37 = getelementptr inbounds [4 x i8], [4 x i8]* @fillrand.r, i64 0, i64 %35
  %38 = load i8, i8* %37, align 1
  %39 = load i8*, i8** %3, align 8
  %40 = load i32, i32* %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8* %39, i64 %41
  store i8 %38, i8* %42, align 1
  br label %43

; <label>:43:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i64 0, i64 0)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i64 0, i64 0)
  %45 = load i32, i32* %5, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %5, align 4
  br label %11

; <label>:47:                                     ; preds = %11
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i64 0, i64 2)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_fillrand, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @encfile(%struct._IO_FILE*, %struct._IO_FILE*, %struct.aes*, i8*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca %struct.aes*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca [16 x i8], align 16
  %11 = alloca [16 x i8], align 16
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %6, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %7, align 8
  store %struct.aes* %2, %struct.aes** %8, align 8
  store i8* %3, i8** %9, align 8
  store i64 0, i64* %13, align 8
  store i64 0, i64* %14, align 8
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i32 0, i32 0
  call void @fillrand(i8* %15, i32 16)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %17 = call i32 @fseek(%struct._IO_FILE* %16, i64 0, i32 2)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %19 = bitcast i64* %12 to %struct._G_fpos_t*
  %20 = call i32 @fgetpos(%struct._IO_FILE* %18, %struct._G_fpos_t* %19)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %22 = call i32 @fseek(%struct._IO_FILE* %21, i64 0, i32 0)
  %23 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i32 0, i32 0
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %25 = call i64 @fwrite(i8* %23, i64 1, i64 16, %struct._IO_FILE* %24)
  %26 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i32 0, i32 0
  call void @fillrand(i8* %26, i32 1)
  store i64 15, i64* %14, align 8
  %27 = load i64, i64* %12, align 8
  %28 = trunc i64 %27 to i8
  %29 = sext i8 %28 to i32
  %30 = and i32 %29, 15
  %31 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i64 0, i64 0
  %32 = load i8, i8* %31, align 16
  %33 = sext i8 %32 to i32
  %34 = and i32 %33, -16
  %35 = or i32 %30, %34
  %36 = trunc i32 %35 to i8
  %37 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i64 0, i64 0
  store i8 %36, i8* %37, align 16
  br label %38

; <label>:38:                                     ; preds = %89, %4
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %40 = call i32 @feof(%struct._IO_FILE* %39) #4
  %41 = icmp ne i32 %40, 0
  %42 = xor i1 %41, true
  br i1 %42, label %43, label %91

; <label>:43:                                     ; preds = %38
  %44 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i32 0, i32 0
  %45 = getelementptr inbounds i8, i8* %44, i64 16
  %46 = load i64, i64* %14, align 8
  %47 = sub i64 0, %46
  %48 = getelementptr inbounds i8, i8* %45, i64 %47
  %49 = load i64, i64* %14, align 8
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %51 = call i64 @fread(i8* %48, i64 1, i64 %49, %struct._IO_FILE* %50)
  store i64 %51, i64* %13, align 8
  %52 = load i64, i64* %13, align 8
  %53 = load i64, i64* %14, align 8
  %54 = icmp ult i64 %52, %53
  br i1 %54, label %55, label %57

; <label>:55:                                     ; preds = %43
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 5)
  %56 = add i64 %pgocount, 1
  store i64 %56, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 5)
  br label %91

; <label>:57:                                     ; preds = %43
  store i64 0, i64* %13, align 8
  br label %58

; <label>:58:                                     ; preds = %72, %57
  %59 = load i64, i64* %13, align 8
  %60 = icmp ult i64 %59, 16
  br i1 %60, label %61, label %76

; <label>:61:                                     ; preds = %58
  %62 = load i64, i64* %13, align 8
  %63 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i64 0, i64 %62
  %64 = load i8, i8* %63, align 1
  %65 = sext i8 %64 to i32
  %66 = load i64, i64* %13, align 8
  %67 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i64 0, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = xor i32 %69, %65
  %71 = trunc i32 %70 to i8
  store i8 %71, i8* %67, align 1
  br label %72

; <label>:72:                                     ; preds = %61
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 0)
  %73 = add i64 %pgocount1, 1
  store i64 %73, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 0)
  %74 = load i64, i64* %13, align 8
  %75 = add i64 %74, 1
  store i64 %75, i64* %13, align 8
  br label %58

; <label>:76:                                     ; preds = %58
  %77 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i32 0, i32 0
  %78 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i32 0, i32 0
  %79 = load %struct.aes*, %struct.aes** %8, align 8
  %80 = call signext i16 @encrypt(i8* %77, i8* %78, %struct.aes* %79)
  %81 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i32 0, i32 0
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %83 = call i64 @fwrite(i8* %81, i64 1, i64 16, %struct._IO_FILE* %82)
  %84 = icmp ne i64 %83, 16
  br i1 %84, label %85, label %89

; <label>:85:                                     ; preds = %76
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 6)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 6)
  %87 = load i8*, i8** %9, align 8
  %88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0), i8* %87)
  store i32 -7, i32* %5, align 4
  br label %146

; <label>:89:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 3)
  %90 = add i64 %pgocount3, 1
  store i64 %90, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 3)
  store i64 16, i64* %14, align 8
  br label %38

; <label>:91:                                     ; preds = %55, %38
  %92 = load i64, i64* %14, align 8
  %93 = icmp eq i64 %92, 15
  br i1 %93, label %94, label %98

; <label>:94:                                     ; preds = %91
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 7)
  %95 = add i64 %pgocount4, 1
  store i64 %95, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 7)
  %96 = load i64, i64* %13, align 8
  %97 = add i64 %96, 1
  store i64 %97, i64* %13, align 8
  br label %98

; <label>:98:                                     ; preds = %94, %91
  %99 = load i64, i64* %13, align 8
  %100 = icmp ne i64 %99, 0
  br i1 %100, label %101, label %144

; <label>:101:                                    ; preds = %98
  br label %102

; <label>:102:                                    ; preds = %105, %101
  %103 = load i64, i64* %13, align 8
  %104 = icmp ult i64 %103, 16
  br i1 %104, label %105, label %110

; <label>:105:                                    ; preds = %102
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 1)
  %106 = add i64 %pgocount5, 1
  store i64 %106, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 1)
  %107 = load i64, i64* %13, align 8
  %108 = add i64 %107, 1
  store i64 %108, i64* %13, align 8
  %109 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i64 0, i64 %107
  store i8 0, i8* %109, align 1
  br label %102

; <label>:110:                                    ; preds = %102
  store i64 0, i64* %13, align 8
  br label %111

; <label>:111:                                    ; preds = %125, %110
  %112 = load i64, i64* %13, align 8
  %113 = icmp ult i64 %112, 16
  br i1 %113, label %114, label %129

; <label>:114:                                    ; preds = %111
  %115 = load i64, i64* %13, align 8
  %116 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i64 0, i64 %115
  %117 = load i8, i8* %116, align 1
  %118 = sext i8 %117 to i32
  %119 = load i64, i64* %13, align 8
  %120 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i64 0, i64 %119
  %121 = load i8, i8* %120, align 1
  %122 = sext i8 %121 to i32
  %123 = xor i32 %122, %118
  %124 = trunc i32 %123 to i8
  store i8 %124, i8* %120, align 1
  br label %125

; <label>:125:                                    ; preds = %114
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 2)
  %126 = add i64 %pgocount6, 1
  store i64 %126, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 2)
  %127 = load i64, i64* %13, align 8
  %128 = add i64 %127, 1
  store i64 %128, i64* %13, align 8
  br label %111

; <label>:129:                                    ; preds = %111
  %130 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i32 0, i32 0
  %131 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i32 0, i32 0
  %132 = load %struct.aes*, %struct.aes** %8, align 8
  %133 = call signext i16 @encrypt(i8* %130, i8* %131, %struct.aes* %132)
  %134 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i32 0, i32 0
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %136 = call i64 @fwrite(i8* %134, i64 1, i64 16, %struct._IO_FILE* %135)
  %137 = icmp ne i64 %136, 16
  br i1 %137, label %138, label %142

; <label>:138:                                    ; preds = %129
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 8)
  %139 = add i64 %pgocount7, 1
  store i64 %139, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 8)
  %140 = load i8*, i8** %9, align 8
  %141 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0), i8* %140)
  store i32 -8, i32* %5, align 4
  br label %146

; <label>:142:                                    ; preds = %129
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 9)
  %143 = add i64 %pgocount8, 1
  store i64 %143, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 9)
  br label %144

; <label>:144:                                    ; preds = %142, %98
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 4)
  %145 = add i64 %pgocount9, 1
  store i64 %145, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_encfile, i64 0, i64 4)
  store i32 0, i32* %5, align 4
  br label %146

; <label>:146:                                    ; preds = %144, %138, %85
  %147 = load i32, i32* %5, align 4
  ret i32 %147
}

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #1

declare i32 @fgetpos(%struct._IO_FILE*, %struct._G_fpos_t*) #1

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #2

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare signext i16 @encrypt(i8*, i8*, %struct.aes*) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @decfile(%struct._IO_FILE*, %struct._IO_FILE*, %struct.aes*, i8*, i8*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca %struct._IO_FILE*, align 8
  %9 = alloca %struct.aes*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca [16 x i8], align 16
  %13 = alloca [16 x i8], align 16
  %14 = alloca [16 x i8], align 16
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %7, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %8, align 8
  store %struct.aes* %2, %struct.aes** %9, align 8
  store i8* %3, i8** %10, align 8
  store i8* %4, i8** %11, align 8
  %21 = getelementptr inbounds [16 x i8], [16 x i8]* %12, i32 0, i32 0
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %23 = call i64 @fread(i8* %21, i64 1, i64 16, %struct._IO_FILE* %22)
  %24 = icmp ne i64 %23, 16
  br i1 %24, label %25, label %29

; <label>:25:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 3)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 3)
  %27 = load i8*, i8** %10, align 8
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i32 0, i32 0), i8* %27)
  store i32 9, i32* %6, align 4
  br label %165

; <label>:29:                                     ; preds = %5
  %30 = getelementptr inbounds [16 x i8], [16 x i8]* %13, i32 0, i32 0
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %32 = call i64 @fread(i8* %30, i64 1, i64 16, %struct._IO_FILE* %31)
  %33 = trunc i64 %32 to i32
  store i32 %33, i32* %18, align 4
  %34 = load i32, i32* %18, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %43

; <label>:36:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 4)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 4)
  %38 = load i32, i32* %18, align 4
  %39 = icmp ne i32 %38, 16
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 6)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 6)
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i32 0, i32 0))
  store i32 -10, i32* %6, align 4
  br label %165

; <label>:43:                                     ; preds = %36, %29
  %44 = getelementptr inbounds [16 x i8], [16 x i8]* %13, i32 0, i32 0
  %45 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i32 0, i32 0
  %46 = load %struct.aes*, %struct.aes** %9, align 8
  %47 = call signext i16 @decrypt(i8* %44, i8* %45, %struct.aes* %46)
  store i32 0, i32* %18, align 4
  br label %48

; <label>:48:                                     ; preds = %65, %43
  %49 = load i32, i32* %18, align 4
  %50 = icmp slt i32 %49, 16
  br i1 %50, label %51, label %68

; <label>:51:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 1)
  %52 = add i64 %pgocount3, 1
  store i64 %52, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 1)
  %53 = load i32, i32* %18, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [16 x i8], [16 x i8]* %12, i64 0, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = load i32, i32* %18, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i64 0, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = xor i32 %62, %57
  %64 = trunc i32 %63 to i8
  store i8 %64, i8* %60, align 1
  br label %65

; <label>:65:                                     ; preds = %51
  %66 = load i32, i32* %18, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %18, align 4
  br label %48

; <label>:68:                                     ; preds = %48
  %69 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i64 0, i64 0
  %70 = load i8, i8* %69, align 16
  %71 = sext i8 %70 to i32
  %72 = and i32 %71, 15
  store i32 %72, i32* %20, align 4
  store i32 15, i32* %19, align 4
  %73 = getelementptr inbounds [16 x i8], [16 x i8]* %12, i32 0, i32 0
  store i8* %73, i8** %15, align 8
  %74 = getelementptr inbounds [16 x i8], [16 x i8]* %13, i32 0, i32 0
  store i8* %74, i8** %16, align 8
  br label %75

; <label>:75:                                     ; preds = %127, %68
  %76 = load i8*, i8** %15, align 8
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %78 = call i64 @fread(i8* %76, i64 1, i64 16, %struct._IO_FILE* %77)
  %79 = trunc i64 %78 to i32
  store i32 %79, i32* %18, align 4
  %80 = load i32, i32* %18, align 4
  %81 = icmp ne i32 %80, 16
  br i1 %81, label %82, label %83

; <label>:82:                                     ; preds = %75
  br label %133

; <label>:83:                                     ; preds = %75
  %84 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i32 0, i32 0
  %85 = getelementptr inbounds i8, i8* %84, i64 16
  %86 = load i32, i32* %19, align 4
  %87 = sext i32 %86 to i64
  %88 = sub i64 0, %87
  %89 = getelementptr inbounds i8, i8* %85, i64 %88
  %90 = load i32, i32* %19, align 4
  %91 = sext i32 %90 to i64
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %93 = call i64 @fwrite(i8* %89, i64 1, i64 %91, %struct._IO_FILE* %92)
  %94 = load i32, i32* %19, align 4
  %95 = sext i32 %94 to i64
  %96 = icmp ne i64 %93, %95
  br i1 %96, label %97, label %101

; <label>:97:                                     ; preds = %83
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 5)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 5)
  %99 = load i8*, i8** %11, align 8
  %100 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0), i8* %99)
  store i32 -11, i32* %6, align 4
  br label %165

; <label>:101:                                    ; preds = %83
  %102 = load i8*, i8** %15, align 8
  %103 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i32 0, i32 0
  %104 = load %struct.aes*, %struct.aes** %9, align 8
  %105 = call signext i16 @decrypt(i8* %102, i8* %103, %struct.aes* %104)
  store i32 0, i32* %18, align 4
  br label %106

; <label>:106:                                    ; preds = %123, %101
  %107 = load i32, i32* %18, align 4
  %108 = icmp slt i32 %107, 16
  br i1 %108, label %109, label %127

; <label>:109:                                    ; preds = %106
  %110 = load i8*, i8** %16, align 8
  %111 = load i32, i32* %18, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8, i8* %110, i64 %112
  %114 = load i8, i8* %113, align 1
  %115 = sext i8 %114 to i32
  %116 = load i32, i32* %18, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i64 0, i64 %117
  %119 = load i8, i8* %118, align 1
  %120 = sext i8 %119 to i32
  %121 = xor i32 %120, %115
  %122 = trunc i32 %121 to i8
  store i8 %122, i8* %118, align 1
  br label %123

; <label>:123:                                    ; preds = %109
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 0)
  %124 = add i64 %pgocount5, 1
  store i64 %124, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 0)
  %125 = load i32, i32* %18, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %18, align 4
  br label %106

; <label>:127:                                    ; preds = %106
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 2)
  %128 = add i64 %pgocount6, 1
  store i64 %128, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 2)
  %129 = load i32, i32* %18, align 4
  store i32 %129, i32* %19, align 4
  %130 = load i8*, i8** %15, align 8
  store i8* %130, i8** %17, align 8
  %131 = load i8*, i8** %16, align 8
  store i8* %131, i8** %15, align 8
  %132 = load i8*, i8** %17, align 8
  store i8* %132, i8** %16, align 8
  br label %75

; <label>:133:                                    ; preds = %82
  %134 = load i32, i32* %19, align 4
  %135 = icmp eq i32 %134, 15
  %136 = zext i1 %135 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 10)
  %137 = add i64 %pgocount7, %136
  store i64 %137, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 10)
  %138 = select i1 %135, i32 1, i32 0
  store i32 %138, i32* %19, align 4
  %139 = load i32, i32* %19, align 4
  %140 = sub nsw i32 1, %139
  %141 = load i32, i32* %20, align 4
  %142 = add nsw i32 %141, %140
  store i32 %142, i32* %20, align 4
  %143 = load i32, i32* %20, align 4
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %145, label %163

; <label>:145:                                    ; preds = %133
  %146 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i32 0, i32 0
  %147 = load i32, i32* %19, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i8, i8* %146, i64 %148
  %150 = load i32, i32* %20, align 4
  %151 = sext i32 %150 to i64
  %152 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %153 = call i64 @fwrite(i8* %149, i64 1, i64 %151, %struct._IO_FILE* %152)
  %154 = load i32, i32* %20, align 4
  %155 = sext i32 %154 to i64
  %156 = icmp ne i64 %153, %155
  br i1 %156, label %157, label %161

; <label>:157:                                    ; preds = %145
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 8)
  %158 = add i64 %pgocount8, 1
  store i64 %158, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 8)
  %159 = load i8*, i8** %11, align 8
  %160 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0), i8* %159)
  store i32 -12, i32* %6, align 4
  br label %165

; <label>:161:                                    ; preds = %145
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 9)
  %162 = add i64 %pgocount9, 1
  store i64 %162, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 9)
  br label %163

; <label>:163:                                    ; preds = %161, %133
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 7)
  %164 = add i64 %pgocount10, 1
  store i64 %164, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decfile, i64 0, i64 7)
  store i32 0, i32* %6, align 4
  br label %165

; <label>:165:                                    ; preds = %163, %157, %97, %40, %25
  %166 = load i32, i32* %6, align 4
  ret i32 %166
}

declare signext i16 @decrypt(i8*, i8*, %struct.aes*) #1

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8, align 1
  %9 = alloca [32 x i8], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [1 x %struct.aes], align 16
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %5, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %6, align 8
  store i32 0, i32* %10, align 4
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  store i32 0, i32* %13, align 4
  %15 = load i32, i32* %3, align 4
  %16 = icmp ne i32 %15, 5
  br i1 %16, label %35, label %17

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 9)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 9)
  %19 = load i8**, i8*** %4, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i64 3
  %21 = load i8*, i8** %20, align 8
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = call i32 @toupper(i32 %23) #5
  %25 = icmp ne i32 %24, 68
  br i1 %25, label %26, label %38

; <label>:26:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 10)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 10)
  %28 = load i8**, i8*** %4, align 8
  %29 = getelementptr inbounds i8*, i8** %28, i64 3
  %30 = load i8*, i8** %29, align 8
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = call i32 @toupper(i32 %32) #5
  %34 = icmp ne i32 %33, 69
  br i1 %34, label %35, label %38

; <label>:35:                                     ; preds = %26, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 6)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 6)
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i32 0, i32 0))
  store i32 -1, i32* %13, align 4
  br label %199

; <label>:38:                                     ; preds = %26, %17
  %39 = load i8**, i8*** %4, align 8
  %40 = getelementptr inbounds i8*, i8** %39, i64 4
  %41 = load i8*, i8** %40, align 8
  store i8* %41, i8** %7, align 8
  store i32 0, i32* %10, align 4
  br label %42

; <label>:42:                                     ; preds = %113, %38
  %43 = load i32, i32* %10, align 4
  %44 = icmp slt i32 %43, 64
  br i1 %44, label %45, label %51

; <label>:45:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 2)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 2)
  %47 = load i8*, i8** %7, align 8
  %48 = load i8, i8* %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp ne i32 %49, 0
  br label %51

; <label>:51:                                     ; preds = %45, %42
  %52 = phi i1 [ false, %42 ], [ %50, %45 ]
  br i1 %52, label %53, label %114

; <label>:53:                                     ; preds = %51
  %54 = load i8*, i8** %7, align 8
  %55 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %55, i8** %7, align 8
  %56 = load i8, i8* %54, align 1
  %57 = sext i8 %56 to i32
  %58 = call i32 @toupper(i32 %57) #5
  %59 = trunc i32 %58 to i8
  store i8 %59, i8* %8, align 1
  %60 = load i8, i8* %8, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp sge i32 %61, 48
  br i1 %62, label %63, label %76

; <label>:63:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 3)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 3)
  %65 = load i8, i8* %8, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp sle i32 %66, 57
  br i1 %67, label %68, label %76

; <label>:68:                                     ; preds = %63
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 5)
  %69 = add i64 %pgocount5, 1
  store i64 %69, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 5)
  %70 = load i32, i32* %11, align 4
  %71 = shl i32 %70, 4
  %72 = load i8, i8* %8, align 1
  %73 = sext i8 %72 to i32
  %74 = add nsw i32 %71, %73
  %75 = sub nsw i32 %74, 48
  store i32 %75, i32* %11, align 4
  br label %98

; <label>:76:                                     ; preds = %63, %53
  %77 = load i8, i8* %8, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp sge i32 %78, 65
  br i1 %79, label %80, label %93

; <label>:80:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 0)
  %81 = add i64 %pgocount6, 1
  store i64 %81, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 0)
  %82 = load i8, i8* %8, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp sle i32 %83, 70
  br i1 %84, label %85, label %93

; <label>:85:                                     ; preds = %80
  %86 = load i32, i32* %11, align 4
  %87 = shl i32 %86, 4
  %88 = load i8, i8* %8, align 1
  %89 = sext i8 %88 to i32
  %90 = add nsw i32 %87, %89
  %91 = sub nsw i32 %90, 65
  %92 = add nsw i32 %91, 10
  store i32 %92, i32* %11, align 4
  br label %96

; <label>:93:                                     ; preds = %80, %76
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 11)
  %94 = add i64 %pgocount7, 1
  store i64 %94, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 11)
  %95 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.4, i32 0, i32 0))
  store i32 -2, i32* %13, align 4
  br label %199

; <label>:96:                                     ; preds = %85
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 1)
  %97 = add i64 %pgocount8, 1
  store i64 %97, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 1)
  br label %98

; <label>:98:                                     ; preds = %96, %68
  %99 = load i32, i32* %10, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %10, align 4
  %101 = and i32 %99, 1
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %113

; <label>:103:                                    ; preds = %98
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 4)
  %104 = add i64 %pgocount9, 1
  store i64 %104, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 4)
  %105 = load i32, i32* %11, align 4
  %106 = and i32 %105, 255
  %107 = trunc i32 %106 to i8
  %108 = load i32, i32* %10, align 4
  %109 = sdiv i32 %108, 2
  %110 = sub nsw i32 %109, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [32 x i8], [32 x i8]* %9, i64 0, i64 %111
  store i8 %107, i8* %112, align 1
  br label %113

; <label>:113:                                    ; preds = %103, %98
  br label %42

; <label>:114:                                    ; preds = %51
  %115 = load i8*, i8** %7, align 8
  %116 = load i8, i8* %115, align 1
  %117 = icmp ne i8 %116, 0
  br i1 %117, label %118, label %121

; <label>:118:                                    ; preds = %114
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 12)
  %119 = add i64 %pgocount10, 1
  store i64 %119, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 12)
  %120 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.5, i32 0, i32 0))
  store i32 -3, i32* %13, align 4
  br label %199

; <label>:121:                                    ; preds = %114
  %122 = load i32, i32* %10, align 4
  %123 = icmp slt i32 %122, 32
  br i1 %123, label %129, label %124

; <label>:124:                                    ; preds = %121
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 14)
  %125 = add i64 %pgocount11, 1
  store i64 %125, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 14)
  %126 = load i32, i32* %10, align 4
  %127 = and i32 %126, 15
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %129, label %132

; <label>:129:                                    ; preds = %124, %121
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 13)
  %130 = add i64 %pgocount12, 1
  store i64 %130, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 13)
  %131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.6, i32 0, i32 0))
  store i32 -4, i32* %13, align 4
  br label %199

; <label>:132:                                    ; preds = %124
  br label %133

; <label>:133:                                    ; preds = %132
  %134 = load i32, i32* %10, align 4
  %135 = sdiv i32 %134, 2
  store i32 %135, i32* %12, align 4
  %136 = load i8**, i8*** %4, align 8
  %137 = getelementptr inbounds i8*, i8** %136, i64 1
  %138 = load i8*, i8** %137, align 8
  %139 = call %struct._IO_FILE* @fopen(i8* %138, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %139, %struct._IO_FILE** %5, align 8
  %140 = icmp ne %struct._IO_FILE* %139, null
  br i1 %140, label %147, label %141

; <label>:141:                                    ; preds = %133
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 15)
  %142 = add i64 %pgocount13, 1
  store i64 %142, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 15)
  %143 = load i8**, i8*** %4, align 8
  %144 = getelementptr inbounds i8*, i8** %143, i64 1
  %145 = load i8*, i8** %144, align 8
  %146 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.8, i32 0, i32 0), i8* %145)
  store i32 -5, i32* %13, align 4
  br label %199

; <label>:147:                                    ; preds = %133
  %148 = load i8**, i8*** %4, align 8
  %149 = getelementptr inbounds i8*, i8** %148, i64 2
  %150 = load i8*, i8** %149, align 8
  %151 = call %struct._IO_FILE* @fopen(i8* %150, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0))
  store %struct._IO_FILE* %151, %struct._IO_FILE** %6, align 8
  %152 = icmp ne %struct._IO_FILE* %151, null
  br i1 %152, label %159, label %153

; <label>:153:                                    ; preds = %147
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 16)
  %154 = add i64 %pgocount14, 1
  store i64 %154, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 16)
  %155 = load i8**, i8*** %4, align 8
  %156 = getelementptr inbounds i8*, i8** %155, i64 1
  %157 = load i8*, i8** %156, align 8
  %158 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.10, i32 0, i32 0), i8* %157)
  store i32 -6, i32* %13, align 4
  br label %199

; <label>:159:                                    ; preds = %147
  %160 = load i8**, i8*** %4, align 8
  %161 = getelementptr inbounds i8*, i8** %160, i64 3
  %162 = load i8*, i8** %161, align 8
  %163 = load i8, i8* %162, align 1
  %164 = sext i8 %163 to i32
  %165 = call i32 @toupper(i32 %164) #5
  %166 = icmp eq i32 %165, 69
  br i1 %166, label %167, label %181

; <label>:167:                                    ; preds = %159
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 17)
  %168 = add i64 %pgocount15, 1
  store i64 %168, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 17)
  %169 = getelementptr inbounds [32 x i8], [32 x i8]* %9, i32 0, i32 0
  %170 = load i32, i32* %12, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [1 x %struct.aes], [1 x %struct.aes]* %14, i32 0, i32 0
  %173 = call signext i16 @set_key(i8* %169, i64 %171, i32 1, %struct.aes* %172)
  %174 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %175 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %176 = getelementptr inbounds [1 x %struct.aes], [1 x %struct.aes]* %14, i32 0, i32 0
  %177 = load i8**, i8*** %4, align 8
  %178 = getelementptr inbounds i8*, i8** %177, i64 1
  %179 = load i8*, i8** %178, align 8
  %180 = call i32 @encfile(%struct._IO_FILE* %174, %struct._IO_FILE* %175, %struct.aes* %176, i8* %179)
  store i32 %180, i32* %13, align 4
  br label %198

; <label>:181:                                    ; preds = %159
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 18)
  %182 = add i64 %pgocount16, 1
  store i64 %182, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 18)
  %183 = getelementptr inbounds [32 x i8], [32 x i8]* %9, i32 0, i32 0
  %184 = load i32, i32* %12, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [1 x %struct.aes], [1 x %struct.aes]* %14, i32 0, i32 0
  %187 = call signext i16 @set_key(i8* %183, i64 %185, i32 2, %struct.aes* %186)
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %189 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %190 = getelementptr inbounds [1 x %struct.aes], [1 x %struct.aes]* %14, i32 0, i32 0
  %191 = load i8**, i8*** %4, align 8
  %192 = getelementptr inbounds i8*, i8** %191, i64 1
  %193 = load i8*, i8** %192, align 8
  %194 = load i8**, i8*** %4, align 8
  %195 = getelementptr inbounds i8*, i8** %194, i64 2
  %196 = load i8*, i8** %195, align 8
  %197 = call i32 @decfile(%struct._IO_FILE* %188, %struct._IO_FILE* %189, %struct.aes* %190, i8* %193, i8* %196)
  store i32 %197, i32* %13, align 4
  br label %198

; <label>:198:                                    ; preds = %181, %167
  br label %199

; <label>:199:                                    ; preds = %198, %153, %141, %129, %118, %93, %35
  %200 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %201 = icmp ne %struct._IO_FILE* %200, null
  br i1 %201, label %202, label %206

; <label>:202:                                    ; preds = %199
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 7)
  %203 = add i64 %pgocount17, 1
  store i64 %203, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 7)
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %205 = call i32 @fclose(%struct._IO_FILE* %204)
  br label %206

; <label>:206:                                    ; preds = %202, %199
  %207 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %208 = icmp ne %struct._IO_FILE* %207, null
  br i1 %208, label %209, label %213

; <label>:209:                                    ; preds = %206
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 8)
  %210 = add i64 %pgocount18, 1
  store i64 %210, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_main1, i64 0, i64 8)
  %211 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %212 = call i32 @fclose(%struct._IO_FILE* %211)
  br label %213

; <label>:213:                                    ; preds = %209, %206
  %214 = load i32, i32* %13, align 4
  ret i32 %214
}

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare signext i16 @set_key(i8*, i64, i32, %struct.aes*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
