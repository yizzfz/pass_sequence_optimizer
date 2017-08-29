; ModuleID = 'mainmpglib.2.ll'
source_filename = "mainmpglib.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mpstr = type { %struct.buf*, %struct.buf*, i32, i32, i32, %struct.frame, [2 x [2304 x i8]], [2 x [2 x [576 x double]]], [2 x i32], i64, i32, [2 x [2 x [272 x double]]], i32 }
%struct.buf = type { i8*, i64, i64, %struct.buf*, %struct.buf* }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.VBRTAGDATA = type { i32, i32, i32, i32, i32, i32, [100 x i8] }

$__llvm_profile_raw_version = comdat any

@mp = common global %struct.mpstr zeroinitializer, align 8
@buf = internal global [16384 x i8] zeroinitializer, align 16
@out = internal global [8192 x i8] zeroinitializer, align 16
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [50 x i8] c"Opps: first frame of mpglib output will be lost \0A\00", align 1
@freqs = external global [9 x i64], align 16
@tabsel_123 = external global [2 x [3 x [16 x i32]]], align 16
@.str.1 = private unnamed_addr constant [66 x i8] c"Opps: mpg123 returned more than one frame!  Cant handle this... \0A\00", align 1
@.str.2 = private unnamed_addr constant [66 x i8] c"Opps: mpg123 returned more than one frame!  shouldn't happen... \0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_is_syncword = private constant [11 x i8] c"is_syncword"
@__profn_lame_decode_initfile = private constant [20 x i8] c"lame_decode_initfile"
@__profn_lame_decode_init = private constant [16 x i8] c"lame_decode_init"
@__profn_lame_decode_fromfile = private constant [20 x i8] c"lame_decode_fromfile"
@__profn_lame_decode = private constant [11 x i8] c"lame_decode"
@__profc_is_syncword = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_is_syncword = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3511917107424149704, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_is_syncword, i32 0, i32 0), i8* bitcast (i32 (i8*)* @is_syncword to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_decode_initfile = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_decode_initfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3179997703710407091, i64 72057706200126947, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, i32*, i32*, i32*, i64*)* @lame_decode_initfile to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_decode_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_decode_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 416994289540303359, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_decode_init, i32 0, i32 0), i8* bitcast (i32 ()* @lame_decode_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_decode_fromfile = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_decode_fromfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8469315503857552122, i64 177437928674, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, i16*, i16*)* @lame_decode_fromfile to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lame_decode = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lame_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5929678322772697711, i64 113840786377, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i16*, i16*)* @lame_decode to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [84 x i8] c"R\00is_syncword\01lame_decode_initfile\01lame_decode_init\01lame_decode_fromfile\01lame_decode", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_is_syncword to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_decode_initfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_decode_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_decode_fromfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lame_decode to i8*), i8* getelementptr inbounds ([84 x i8], [84 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @is_syncword(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %8, label %16

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_is_syncword, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_is_syncword, i64 0, i64 1)
  %10 = load i8*, i8** %2, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 1
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = and i32 %13, -16
  %15 = icmp eq i32 %14, -16
  br label %16

; <label>:16:                                     ; preds = %8, %1
  %17 = phi i1 [ false, %1 ], [ %15, %8 ]
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_is_syncword, i64 0, i64 0)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_is_syncword, i64 0, i64 0)
  %19 = zext i1 %17 to i32
  ret i32 %19
}

; Function Attrs: noinline nounwind uwtable
define i32 @lame_decode_initfile(%struct._IO_FILE*, i32*, i32*, i32*, i64*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i64*, align 8
  %12 = alloca %struct.VBRTAGDATA, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %7, align 8
  store i32* %1, i32** %8, align 8
  store i32* %2, i32** %9, align 8
  store i32* %3, i32** %10, align 8
  store i64* %4, i64** %11, align 8
  store i64 0, i64* %16, align 8
  %19 = call i32 @InitMP3(%struct.mpstr* @mp)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0), i8 0, i64 16384, i32 16, i1 false)
  br label %20

; <label>:20:                                     ; preds = %31, %5
  %21 = call i32 @is_syncword(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0))
  %22 = icmp ne i32 %21, 0
  %23 = xor i1 %22, true
  br i1 %23, label %24, label %33

; <label>:24:                                     ; preds = %20
  %25 = load i8, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 1), align 1
  store i8 %25, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 0), align 16
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %27 = call i64 @fread(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 1), i64 1, i64 1, %struct._IO_FILE* %26)
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 1)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 1)
  store i32 -1, i32* %6, align 4
  br label %107

; <label>:31:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 0)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 0)
  br label %20

; <label>:33:                                     ; preds = %20
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %35 = call i64 @fread(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i64 0, i64 2), i64 1, i64 46, %struct._IO_FILE* %34)
  store i64 %35, i64* %17, align 8
  %36 = load i64, i64* %17, align 8
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 6)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 6)
  store i32 -1, i32* %6, align 4
  br label %107

; <label>:40:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 2)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 2)
  %42 = load i64, i64* %17, align 8
  %43 = add i64 %42, 2
  store i64 %43, i64* %17, align 8
  %44 = call i32 @GetVbrTag(%struct.VBRTAGDATA* %12, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0))
  store i32 %44, i32* %18, align 4
  %45 = load i32, i32* %18, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %52

; <label>:47:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 3)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 3)
  %49 = getelementptr inbounds %struct.VBRTAGDATA, %struct.VBRTAGDATA* %12, i32 0, i32 3
  %50 = load i32, i32* %49, align 4
  %51 = sext i32 %50 to i64
  store i64 %51, i64* %16, align 8
  br label %52

; <label>:52:                                     ; preds = %47, %40
  store i32 0, i32* %14, align 4
  %53 = load i64, i64* %17, align 8
  %54 = trunc i64 %53 to i32
  %55 = call i32 @decodeMP3(%struct.mpstr* @mp, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0), i32 %54, i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @out, i32 0, i32 0), i32 8192, i32* %14)
  store i32 %55, i32* %13, align 4
  %56 = load i32, i32* %14, align 4
  %57 = icmp sgt i32 %56, 0
  br i1 %57, label %58, label %66

; <label>:58:                                     ; preds = %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 4)
  %59 = add i64 %pgocount5, 1
  store i64 %59, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 4)
  %60 = load i32, i32* %18, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %66, label %62

; <label>:62:                                     ; preds = %58
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 8)
  %63 = add i64 %pgocount6, 1
  store i64 %63, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 8)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str, i32 0, i32 0))
  br label %66

; <label>:66:                                     ; preds = %62, %58, %52
  %67 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 0), align 4
  %68 = load i32*, i32** %8, align 8
  store i32 %67, i32* %68, align 4
  %69 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 9), align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [9 x i64], [9 x i64]* @freqs, i64 0, i64 %70
  %72 = load i64, i64* %71, align 8
  %73 = trunc i64 %72 to i32
  %74 = load i32*, i32** %9, align 8
  store i32 %73, i32* %74, align 4
  %75 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 3), align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [2 x [3 x [16 x i32]]], [2 x [3 x [16 x i32]]]* @tabsel_123, i64 0, i64 %76
  %78 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 6), align 4
  %79 = sub nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [3 x [16 x i32]], [3 x [16 x i32]]* %77, i64 0, i64 %80
  %82 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 8), align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [16 x i32], [16 x i32]* %81, i64 0, i64 %83
  %85 = load i32, i32* %84, align 4
  %86 = load i32*, i32** %10, align 8
  store i32 %85, i32* %86, align 4
  %87 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 3), align 4
  %88 = icmp eq i32 %87, 0
  %89 = zext i1 %88 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 9)
  %90 = add i64 %pgocount7, %89
  store i64 %90, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 9)
  %91 = select i1 %88, i32 1152, i32 576
  store i32 %91, i32* %15, align 4
  %92 = load i64*, i64** %11, align 8
  store i64 4294967295, i64* %92, align 8
  %93 = load i32, i32* %18, align 4
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %106

; <label>:95:                                     ; preds = %66
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 5)
  %96 = add i64 %pgocount8, 1
  store i64 %96, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 5)
  %97 = load i64, i64* %16, align 8
  %98 = icmp ne i64 %97, 0
  br i1 %98, label %99, label %106

; <label>:99:                                     ; preds = %95
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 7)
  %100 = add i64 %pgocount9, 1
  store i64 %100, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_lame_decode_initfile, i64 0, i64 7)
  %101 = load i32, i32* %15, align 4
  %102 = sext i32 %101 to i64
  %103 = load i64, i64* %16, align 8
  %104 = mul i64 %102, %103
  %105 = load i64*, i64** %11, align 8
  store i64 %104, i64* %105, align 8
  br label %106

; <label>:106:                                    ; preds = %99, %95, %66
  store i32 0, i32* %6, align 4
  br label %107

; <label>:107:                                    ; preds = %106, %38, %29
  %108 = load i32, i32* %6, align 4
  ret i32 %108
}

declare i32 @InitMP3(%struct.mpstr*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @GetVbrTag(%struct.VBRTAGDATA*, i8*) #1

declare i32 @decodeMP3(%struct.mpstr*, i8*, i32, i8*, i32, i32*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define i32 @lame_decode_init() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_decode_init, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_lame_decode_init, i64 0, i64 0)
  %2 = call i32 @InitMP3(%struct.mpstr* @mp)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0), i8 0, i64 16384, i32 16, i1 false)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define i32 @lame_decode_fromfile(%struct._IO_FILE*, i16*, i16*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %5, align 8
  store i16* %1, i16** %6, align 8
  store i16* %2, i16** %7, align 8
  store i32 0, i32* %10, align 4
  store i32 0, i32* %8, align 4
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %16 = call i64 @fread(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0), i64 1, i64 64, %struct._IO_FILE* %15)
  store i64 %16, i64* %14, align 8
  %17 = load i64, i64* %14, align 8
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 5)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 5)
  store i32 0, i32* %4, align 4
  br label %126

; <label>:21:                                     ; preds = %3
  %22 = load i64, i64* %14, align 8
  %23 = trunc i64 %22 to i32
  %24 = call i32 @decodeMP3(%struct.mpstr* @mp, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0), i32 %23, i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @out, i32 0, i32 0), i32 8192, i32* %8)
  store i32 %24, i32* %13, align 4
  br label %25

; <label>:25:                                     ; preds = %42, %21
  %26 = load i32, i32* %13, align 4
  %27 = icmp eq i32 %26, 1
  br i1 %27, label %33, label %28

; <label>:28:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 3)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 3)
  %30 = load i32, i32* %8, align 4
  %31 = icmp ne i32 %30, 0
  %32 = xor i1 %31, true
  br label %33

; <label>:33:                                     ; preds = %28, %25
  %34 = phi i1 [ true, %25 ], [ %32, %28 ]
  br i1 %34, label %35, label %47

; <label>:35:                                     ; preds = %33
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %37 = call i64 @fread(i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0), i64 1, i64 100, %struct._IO_FILE* %36)
  store i64 %37, i64* %14, align 8
  %38 = load i64, i64* %14, align 8
  %39 = icmp eq i64 %38, 0
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 6)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 6)
  store i32 -1, i32* %4, align 4
  br label %126

; <label>:42:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 2)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 2)
  %44 = load i64, i64* %14, align 8
  %45 = trunc i64 %44 to i32
  %46 = call i32 @decodeMP3(%struct.mpstr* @mp, i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @buf, i32 0, i32 0), i32 %45, i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @out, i32 0, i32 0), i32 8192, i32* %8)
  store i32 %46, i32* %13, align 4
  br label %25

; <label>:47:                                     ; preds = %33
  %48 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 0), align 4
  store i32 %48, i32* %9, align 4
  %49 = load i32, i32* %13, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %118

; <label>:51:                                     ; preds = %47
  %52 = load i32, i32* %8, align 4
  %53 = load i32, i32* %9, align 4
  %54 = mul nsw i32 2, %53
  %55 = sdiv i32 %52, %54
  store i32 %55, i32* %10, align 4
  %56 = load i32, i32* %10, align 4
  %57 = icmp ne i32 %56, 576
  br i1 %57, label %58, label %66

; <label>:58:                                     ; preds = %51
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 10)
  %59 = add i64 %pgocount4, 1
  store i64 %59, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 10)
  %60 = load i32, i32* %10, align 4
  %61 = icmp ne i32 %60, 1152
  br i1 %61, label %62, label %66

; <label>:62:                                     ; preds = %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 11)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 11)
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 -50) #5
  unreachable

; <label>:66:                                     ; preds = %58, %51
  store i32 0, i32* %11, align 4
  br label %67

; <label>:67:                                     ; preds = %112, %66
  %68 = load i32, i32* %11, align 4
  %69 = load i32, i32* %9, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %116

; <label>:71:                                     ; preds = %67
  store i32 0, i32* %12, align 4
  br label %72

; <label>:72:                                     ; preds = %108, %71
  %73 = load i32, i32* %12, align 4
  %74 = load i32, i32* %10, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %111

; <label>:76:                                     ; preds = %72
  %77 = load i32, i32* %11, align 4
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %93

; <label>:79:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 0)
  %80 = add i64 %pgocount6, 1
  store i64 %80, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 0)
  %81 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 0), align 4
  %82 = load i32, i32* %12, align 4
  %83 = mul nsw i32 %81, %82
  %84 = load i32, i32* %11, align 4
  %85 = add nsw i32 %83, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %86
  %88 = load i16, i16* %87, align 2
  %89 = load i16*, i16** %6, align 8
  %90 = load i32, i32* %12, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i16, i16* %89, i64 %91
  store i16 %88, i16* %92, align 2
  br label %107

; <label>:93:                                     ; preds = %76
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 1)
  %94 = add i64 %pgocount7, 1
  store i64 %94, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 1)
  %95 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 0), align 4
  %96 = load i32, i32* %12, align 4
  %97 = mul nsw i32 %95, %96
  %98 = load i32, i32* %11, align 4
  %99 = add nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %100
  %102 = load i16, i16* %101, align 2
  %103 = load i16*, i16** %7, align 8
  %104 = load i32, i32* %12, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i16, i16* %103, i64 %105
  store i16 %102, i16* %106, align 2
  br label %107

; <label>:107:                                    ; preds = %93, %79
  br label %108

; <label>:108:                                    ; preds = %107
  %109 = load i32, i32* %12, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %12, align 4
  br label %72

; <label>:111:                                    ; preds = %72
  br label %112

; <label>:112:                                    ; preds = %111
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 4)
  %113 = add i64 %pgocount8, 1
  store i64 %113, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 4)
  %114 = load i32, i32* %11, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %11, align 4
  br label %67

; <label>:116:                                    ; preds = %67
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 9)
  %117 = add i64 %pgocount9, 1
  store i64 %117, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 9)
  br label %118

; <label>:118:                                    ; preds = %116, %47
  %119 = load i32, i32* %13, align 4
  %120 = icmp eq i32 %119, -1
  br i1 %120, label %121, label %123

; <label>:121:                                    ; preds = %118
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 8)
  %122 = add i64 %pgocount10, 1
  store i64 %122, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 8)
  store i32 -1, i32* %4, align 4
  br label %126

; <label>:123:                                    ; preds = %118
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 7)
  %124 = add i64 %pgocount11, 1
  store i64 %124, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_lame_decode_fromfile, i64 0, i64 7)
  %125 = load i32, i32* %10, align 4
  store i32 %125, i32* %4, align 4
  br label %126

; <label>:126:                                    ; preds = %123, %121, %40, %19
  %127 = load i32, i32* %4, align 4
  ret i32 %127
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define i32 @lame_decode(i8*, i32, i16*, i16*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i8* %0, i8** %6, align 8
  store i32 %1, i32* %7, align 4
  store i16* %2, i16** %8, align 8
  store i16* %3, i16** %9, align 8
  store i32 0, i32* %11, align 4
  %15 = load i8*, i8** %6, align 8
  %16 = load i32, i32* %7, align 4
  %17 = call i32 @decodeMP3(%struct.mpstr* @mp, i8* %15, i32 %16, i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @out, i32 0, i32 0), i32 8192, i32* %10)
  store i32 %17, i32* %14, align 4
  %18 = load i32, i32* %14, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %83

; <label>:20:                                     ; preds = %4
  %21 = load i32, i32* %10, align 4
  %22 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 0), align 4
  %23 = mul nsw i32 2, %22
  %24 = sdiv i32 %21, %23
  store i32 %24, i32* %11, align 4
  %25 = load i32, i32* %11, align 4
  %26 = icmp sgt i32 %25, 1152
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 6)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 6)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 -50) #5
  unreachable

; <label>:31:                                     ; preds = %20
  store i32 0, i32* %12, align 4
  br label %32

; <label>:32:                                     ; preds = %77, %31
  %33 = load i32, i32* %12, align 4
  %34 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 0), align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %81

; <label>:36:                                     ; preds = %32
  store i32 0, i32* %13, align 4
  br label %37

; <label>:37:                                     ; preds = %73, %36
  %38 = load i32, i32* %13, align 4
  %39 = load i32, i32* %11, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %76

; <label>:41:                                     ; preds = %37
  %42 = load i32, i32* %12, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %58

; <label>:44:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 0)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 0)
  %46 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 0), align 4
  %47 = load i32, i32* %13, align 4
  %48 = mul nsw i32 %46, %47
  %49 = load i32, i32* %12, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %51
  %53 = load i16, i16* %52, align 2
  %54 = load i16*, i16** %8, align 8
  %55 = load i32, i32* %13, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i16, i16* %54, i64 %56
  store i16 %53, i16* %57, align 2
  br label %72

; <label>:58:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 1)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 1)
  %60 = load i32, i32* getelementptr inbounds (%struct.mpstr, %struct.mpstr* @mp, i32 0, i32 5, i32 0), align 4
  %61 = load i32, i32* %13, align 4
  %62 = mul nsw i32 %60, %61
  %63 = load i32, i32* %12, align 4
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16* bitcast ([8192 x i8]* @out to i16*), i64 %65
  %67 = load i16, i16* %66, align 2
  %68 = load i16*, i16** %9, align 8
  %69 = load i32, i32* %13, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, i16* %68, i64 %70
  store i16 %67, i16* %71, align 2
  br label %72

; <label>:72:                                     ; preds = %58, %44
  br label %73

; <label>:73:                                     ; preds = %72
  %74 = load i32, i32* %13, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %13, align 4
  br label %37

; <label>:76:                                     ; preds = %37
  br label %77

; <label>:77:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 2)
  %78 = add i64 %pgocount3, 1
  store i64 %78, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 2)
  %79 = load i32, i32* %12, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %12, align 4
  br label %32

; <label>:81:                                     ; preds = %32
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 5)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 5)
  br label %83

; <label>:83:                                     ; preds = %81, %4
  %84 = load i32, i32* %14, align 4
  %85 = icmp eq i32 %84, -1
  br i1 %85, label %86, label %88

; <label>:86:                                     ; preds = %83
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 4)
  %87 = add i64 %pgocount5, 1
  store i64 %87, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 4)
  store i32 -1, i32* %5, align 4
  br label %91

; <label>:88:                                     ; preds = %83
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 3)
  %89 = add i64 %pgocount6, 1
  store i64 %89, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_lame_decode, i64 0, i64 3)
  %90 = load i32, i32* %11, align 4
  store i32 %90, i32* %5, align 4
  br label %91

; <label>:91:                                     ; preds = %88, %86
  %92 = load i32, i32* %5, align 4
  ret i32 %92
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
