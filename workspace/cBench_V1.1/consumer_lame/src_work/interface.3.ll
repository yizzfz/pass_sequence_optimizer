; ModuleID = 'interface.2.ll'
source_filename = "interface.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mpstr = type { %struct.buf*, %struct.buf*, i32, i32, i32, %struct.frame, [2 x [2304 x i8]], [2 x [2 x [576 x double]]], [2 x i32], i64, i32, [2 x [2 x [272 x double]]], i32 }
%struct.buf = type { i8*, i64, i64, %struct.buf*, %struct.buf* }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@gmp = common global %struct.mpstr* null, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [19 x i8] c"To less out space\0A\00", align 1
@wordpointer = external global i8*, align 8
@bitindex = external global i32, align 4
@.str.1 = private unnamed_addr constant [22 x i8] c"Can't step back %ld!\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Out of memory!\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Fatal error!\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_InitMP3 = private constant [7 x i8] c"InitMP3"
@__profn_ExitMP3 = private constant [7 x i8] c"ExitMP3"
@__profn_decodeMP3 = private constant [9 x i8] c"decodeMP3"
@__profn_tmp1.ll_addbuf = private constant [14 x i8] c"tmp1.ll:addbuf"
@__profn_tmp1.ll_read_head = private constant [17 x i8] c"tmp1.ll:read_head"
@__profn_tmp1.ll_remove_buf = private constant [18 x i8] c"tmp1.ll:remove_buf"
@__profn_set_pointer = private constant [11 x i8] c"set_pointer"
@__profn_tmp1.ll_read_buf_byte = private constant [21 x i8] c"tmp1.ll:read_buf_byte"
@__profc_InitMP3 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_InitMP3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1332909923196878423, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_InitMP3, i32 0, i32 0), i8* bitcast (i32 (%struct.mpstr*)* @InitMP3 to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ExitMP3 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ExitMP3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8775172018029606233, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ExitMP3, i32 0, i32 0), i8* bitcast (void (%struct.mpstr*)* @ExitMP3 to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_decodeMP3 = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_decodeMP3 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3688911905035076204, i64 151642084908, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i32 0, i32 0), i8* bitcast (i32 (%struct.mpstr*, i8*, i32, i8*, i32, i32*)* @decodeMP3 to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_addbuf = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_addbuf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4489650629628193612, i64 57065472408, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_head = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_read_head = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4287388902576016708, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_read_head, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_remove_buf = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_remove_buf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 43529677685548951, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_remove_buf, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_set_pointer = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_set_pointer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7594687749007205548, i64 50509324029, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i32 0, i32 0), i8* bitcast (i32 (i64)* @set_pointer to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_buf_byte = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_read_buf_byte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4098554827888046447, i64 38828265089, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_buf_byte, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [81 x i8] c"oOx\DA\F3\CC\CB,\F1\0D0ft\AD\80\D0)\A9\C9\F9)\A9 VIn\81\A1^N\8EUbJJRi\1A\9C[\94\9A\98\12\9F\01$\90Dr\F3\CBR\E3A\8A\8ASK\E2\0B\F23\F3JR\8BP5\00%\E3\93*KR\01:\9B'&", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_InitMP3 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ExitMP3 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_decodeMP3 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_addbuf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_head to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_remove_buf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_set_pointer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_buf_byte to i8*), i8* getelementptr inbounds ([81 x i8], [81 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @InitMP3(%struct.mpstr*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_InitMP3, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_InitMP3, i64 0, i64 0)
  %3 = alloca %struct.mpstr*, align 8
  store %struct.mpstr* %0, %struct.mpstr** %3, align 8
  %4 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %5 = bitcast %struct.mpstr* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 31880, i32 8, i1 false)
  %6 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %7 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %6, i32 0, i32 3
  store i32 0, i32* %7, align 4
  %8 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %9 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %8, i32 0, i32 4
  store i32 -1, i32* %9, align 8
  %10 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %11 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %10, i32 0, i32 2
  store i32 0, i32* %11, align 8
  %12 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %13 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %12, i32 0, i32 1
  store %struct.buf* null, %struct.buf** %13, align 8
  %14 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %15 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %14, i32 0, i32 0
  store %struct.buf* null, %struct.buf** %15, align 8
  %16 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %17 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %16, i32 0, i32 5
  %18 = getelementptr inbounds %struct.frame, %struct.frame* %17, i32 0, i32 2
  store i32 -1, i32* %18, align 4
  %19 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %20 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %19, i32 0, i32 10
  store i32 0, i32* %20, align 8
  %21 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %22 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %21, i32 0, i32 12
  store i32 1, i32* %22, align 8
  call void @make_decode_tables(i64 32767)
  call void @init_layer3(i32 32)
  ret i32 1
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @make_decode_tables(i64) #2

declare void @init_layer3(i32) #2

; Function Attrs: nounwind uwtable
define void @ExitMP3(%struct.mpstr*) #0 {
  %2 = alloca %struct.mpstr*, align 8
  %3 = alloca %struct.buf*, align 8
  %4 = alloca %struct.buf*, align 8
  store %struct.mpstr* %0, %struct.mpstr** %2, align 8
  %5 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %6 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %5, i32 0, i32 1
  %7 = load %struct.buf*, %struct.buf** %6, align 8
  store %struct.buf* %7, %struct.buf** %3, align 8
  br label %8

; <label>:8:                                      ; preds = %11, %1
  %9 = load %struct.buf*, %struct.buf** %3, align 8
  %10 = icmp ne %struct.buf* %9, null
  br i1 %10, label %11, label %22

; <label>:11:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ExitMP3, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ExitMP3, i64 0, i64 0)
  %13 = load %struct.buf*, %struct.buf** %3, align 8
  %14 = getelementptr inbounds %struct.buf, %struct.buf* %13, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8
  call void @free(i8* %15) #5
  %16 = load %struct.buf*, %struct.buf** %3, align 8
  %17 = getelementptr inbounds %struct.buf, %struct.buf* %16, i32 0, i32 3
  %18 = load %struct.buf*, %struct.buf** %17, align 8
  store %struct.buf* %18, %struct.buf** %4, align 8
  %19 = load %struct.buf*, %struct.buf** %3, align 8
  %20 = bitcast %struct.buf* %19 to i8*
  call void @free(i8* %20) #5
  %21 = load %struct.buf*, %struct.buf** %4, align 8
  store %struct.buf* %21, %struct.buf** %3, align 8
  br label %8

; <label>:22:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ExitMP3, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ExitMP3, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @decodeMP3(%struct.mpstr*, i8*, i32, i8*, i32, i32*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.mpstr*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store %struct.mpstr* %0, %struct.mpstr** %8, align 8
  store i8* %1, i8** %9, align 8
  store i32 %2, i32* %10, align 4
  store i8* %3, i8** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32* %5, i32** %13, align 8
  %17 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  store %struct.mpstr* %17, %struct.mpstr** @gmp, align 8
  %18 = load i32, i32* %12, align 4
  %19 = icmp slt i32 %18, 4608
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 3)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 3)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0))
  store i32 -1, i32* %7, align 4
  br label %201

; <label>:24:                                     ; preds = %6
  %25 = load i8*, i8** %9, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %37

; <label>:27:                                     ; preds = %24
  %28 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %29 = load i8*, i8** %9, align 8
  %30 = load i32, i32* %10, align 4
  %31 = call %struct.buf* @addbuf(%struct.mpstr* %28, i8* %29, i32 %30)
  %32 = icmp eq %struct.buf* %31, null
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 7)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 7)
  store i32 -1, i32* %7, align 4
  br label %201

; <label>:35:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 4)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 4)
  br label %37

; <label>:37:                                     ; preds = %35, %24
  %38 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %39 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %38, i32 0, i32 3
  %40 = load i32, i32* %39, align 4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %64

; <label>:42:                                     ; preds = %37
  %43 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %44 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %43, i32 0, i32 2
  %45 = load i32, i32* %44, align 8
  %46 = icmp slt i32 %45, 4
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 9)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 9)
  store i32 1, i32* %7, align 4
  br label %201

; <label>:49:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 10)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 10)
  %51 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  call void @read_head(%struct.mpstr* %51)
  %52 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %53 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %52, i32 0, i32 5
  %54 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %55 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %54, i32 0, i32 9
  %56 = load i64, i64* %55, align 8
  %57 = call i32 @decode_header(%struct.frame* %53, i64 %56)
  %58 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %59 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %58, i32 0, i32 5
  %60 = getelementptr inbounds %struct.frame, %struct.frame* %59, i32 0, i32 17
  %61 = load i32, i32* %60, align 4
  %62 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %63 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %62, i32 0, i32 3
  store i32 %61, i32* %63, align 4
  br label %64

; <label>:64:                                     ; preds = %49, %37
  %65 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %66 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %65, i32 0, i32 5
  %67 = getelementptr inbounds %struct.frame, %struct.frame* %66, i32 0, i32 17
  %68 = load i32, i32* %67, align 4
  %69 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %70 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %69, i32 0, i32 2
  %71 = load i32, i32* %70, align 8
  %72 = icmp sgt i32 %68, %71
  br i1 %72, label %73, label %75

; <label>:73:                                     ; preds = %64
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 5)
  %74 = add i64 %pgocount5, 1
  store i64 %74, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 5)
  store i32 1, i32* %7, align 4
  br label %201

; <label>:75:                                     ; preds = %64
  %76 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %77 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %76, i32 0, i32 6
  %78 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %79 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %78, i32 0, i32 10
  %80 = load i32, i32* %79, align 8
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [2 x [2304 x i8]], [2 x [2304 x i8]]* %77, i64 0, i64 %81
  %83 = getelementptr inbounds [2304 x i8], [2304 x i8]* %82, i32 0, i32 0
  %84 = getelementptr inbounds i8, i8* %83, i64 512
  store i8* %84, i8** @wordpointer, align 8
  %85 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %86 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %85, i32 0, i32 10
  %87 = load i32, i32* %86, align 8
  %88 = add nsw i32 %87, 1
  %89 = and i32 %88, 1
  %90 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %91 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %90, i32 0, i32 10
  store i32 %89, i32* %91, align 8
  store i32 0, i32* @bitindex, align 4
  store i32 0, i32* %14, align 4
  br label %92

; <label>:92:                                     ; preds = %176, %75
  %93 = load i32, i32* %14, align 4
  %94 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %95 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %94, i32 0, i32 3
  %96 = load i32, i32* %95, align 4
  %97 = icmp slt i32 %93, %96
  br i1 %97, label %98, label %177

; <label>:98:                                     ; preds = %92
  %99 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %100 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %99, i32 0, i32 1
  %101 = load %struct.buf*, %struct.buf** %100, align 8
  %102 = getelementptr inbounds %struct.buf, %struct.buf* %101, i32 0, i32 1
  %103 = load i64, i64* %102, align 8
  %104 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %105 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %104, i32 0, i32 1
  %106 = load %struct.buf*, %struct.buf** %105, align 8
  %107 = getelementptr inbounds %struct.buf, %struct.buf* %106, i32 0, i32 2
  %108 = load i64, i64* %107, align 8
  %109 = sub nsw i64 %103, %108
  %110 = trunc i64 %109 to i32
  store i32 %110, i32* %16, align 4
  %111 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %112 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %111, i32 0, i32 3
  %113 = load i32, i32* %112, align 4
  %114 = load i32, i32* %14, align 4
  %115 = sub nsw i32 %113, %114
  %116 = load i32, i32* %16, align 4
  %117 = icmp sle i32 %115, %116
  br i1 %117, label %118, label %125

; <label>:118:                                    ; preds = %98
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 0)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 0)
  %120 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %121 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %120, i32 0, i32 3
  %122 = load i32, i32* %121, align 4
  %123 = load i32, i32* %14, align 4
  %124 = sub nsw i32 %122, %123
  store i32 %124, i32* %15, align 4
  br label %128

; <label>:125:                                    ; preds = %98
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 1)
  %126 = add i64 %pgocount7, 1
  store i64 %126, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 1)
  %127 = load i32, i32* %16, align 4
  store i32 %127, i32* %15, align 4
  br label %128

; <label>:128:                                    ; preds = %125, %118
  %129 = load i8*, i8** @wordpointer, align 8
  %130 = load i32, i32* %14, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8, i8* %129, i64 %131
  %133 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %134 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %133, i32 0, i32 1
  %135 = load %struct.buf*, %struct.buf** %134, align 8
  %136 = getelementptr inbounds %struct.buf, %struct.buf* %135, i32 0, i32 0
  %137 = load i8*, i8** %136, align 8
  %138 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %139 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %138, i32 0, i32 1
  %140 = load %struct.buf*, %struct.buf** %139, align 8
  %141 = getelementptr inbounds %struct.buf, %struct.buf* %140, i32 0, i32 2
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds i8, i8* %137, i64 %142
  %144 = load i32, i32* %15, align 4
  %145 = sext i32 %144 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %132, i8* %143, i64 %145, i32 1, i1 false)
  %146 = load i32, i32* %15, align 4
  %147 = load i32, i32* %14, align 4
  %148 = add nsw i32 %147, %146
  store i32 %148, i32* %14, align 4
  %149 = load i32, i32* %15, align 4
  %150 = sext i32 %149 to i64
  %151 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %152 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %151, i32 0, i32 1
  %153 = load %struct.buf*, %struct.buf** %152, align 8
  %154 = getelementptr inbounds %struct.buf, %struct.buf* %153, i32 0, i32 2
  %155 = load i64, i64* %154, align 8
  %156 = add nsw i64 %155, %150
  store i64 %156, i64* %154, align 8
  %157 = load i32, i32* %15, align 4
  %158 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %159 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %158, i32 0, i32 2
  %160 = load i32, i32* %159, align 8
  %161 = sub nsw i32 %160, %157
  store i32 %161, i32* %159, align 8
  %162 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %163 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %162, i32 0, i32 1
  %164 = load %struct.buf*, %struct.buf** %163, align 8
  %165 = getelementptr inbounds %struct.buf, %struct.buf* %164, i32 0, i32 2
  %166 = load i64, i64* %165, align 8
  %167 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %168 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %167, i32 0, i32 1
  %169 = load %struct.buf*, %struct.buf** %168, align 8
  %170 = getelementptr inbounds %struct.buf, %struct.buf* %169, i32 0, i32 1
  %171 = load i64, i64* %170, align 8
  %172 = icmp eq i64 %166, %171
  br i1 %172, label %173, label %176

; <label>:173:                                    ; preds = %128
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 2)
  %174 = add i64 %pgocount8, 1
  store i64 %174, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 2)
  %175 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  call void @remove_buf(%struct.mpstr* %175)
  br label %176

; <label>:176:                                    ; preds = %173, %128
  br label %92

; <label>:177:                                    ; preds = %92
  %178 = load i32*, i32** %13, align 8
  store i32 0, i32* %178, align 4
  %179 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %180 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %179, i32 0, i32 5
  %181 = getelementptr inbounds %struct.frame, %struct.frame* %180, i32 0, i32 7
  %182 = load i32, i32* %181, align 4
  %183 = icmp ne i32 %182, 0
  br i1 %183, label %184, label %187

; <label>:184:                                    ; preds = %177
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 8)
  %185 = add i64 %pgocount9, 1
  store i64 %185, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 8)
  %186 = call i32 @getbits(i32 16)
  br label %187

; <label>:187:                                    ; preds = %184, %177
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 6)
  %188 = add i64 %pgocount10, 1
  store i64 %188, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_decodeMP3, i64 0, i64 6)
  %189 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %190 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %189, i32 0, i32 5
  %191 = load i8*, i8** %11, align 8
  %192 = load i32*, i32** %13, align 8
  %193 = call i32 @do_layer3(%struct.frame* %190, i8* %191, i32* %192)
  %194 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %195 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %194, i32 0, i32 3
  %196 = load i32, i32* %195, align 4
  %197 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %198 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %197, i32 0, i32 4
  store i32 %196, i32* %198, align 8
  %199 = load %struct.mpstr*, %struct.mpstr** %8, align 8
  %200 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %199, i32 0, i32 3
  store i32 0, i32* %200, align 4
  store i32 0, i32* %7, align 4
  br label %201

; <label>:201:                                    ; preds = %187, %73, %47, %33, %20
  %202 = load i32, i32* %7, align 4
  ret i32 %202
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal %struct.buf* @addbuf(%struct.mpstr*, i8*, i32) #0 {
  %4 = alloca %struct.buf*, align 8
  %5 = alloca %struct.mpstr*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.buf*, align 8
  store %struct.mpstr* %0, %struct.mpstr** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = call noalias i8* @malloc(i64 40) #5
  %10 = bitcast i8* %9 to %struct.buf*
  store %struct.buf* %10, %struct.buf** %8, align 8
  %11 = load %struct.buf*, %struct.buf** %8, align 8
  %12 = icmp ne %struct.buf* %11, null
  br i1 %12, label %17, label %13

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i64 0, i64 0)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  store %struct.buf* null, %struct.buf** %4, align 8
  br label %77

; <label>:17:                                     ; preds = %3
  %18 = load i32, i32* %7, align 4
  %19 = sext i32 %18 to i64
  %20 = call noalias i8* @malloc(i64 %19) #5
  %21 = load %struct.buf*, %struct.buf** %8, align 8
  %22 = getelementptr inbounds %struct.buf, %struct.buf* %21, i32 0, i32 0
  store i8* %20, i8** %22, align 8
  %23 = load %struct.buf*, %struct.buf** %8, align 8
  %24 = getelementptr inbounds %struct.buf, %struct.buf* %23, i32 0, i32 0
  %25 = load i8*, i8** %24, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %31, label %27

; <label>:27:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i64 0, i64 2)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i64 0, i64 2)
  %29 = load %struct.buf*, %struct.buf** %8, align 8
  %30 = bitcast %struct.buf* %29 to i8*
  call void @free(i8* %30) #5
  store %struct.buf* null, %struct.buf** %4, align 8
  br label %77

; <label>:31:                                     ; preds = %17
  %32 = load i32, i32* %7, align 4
  %33 = sext i32 %32 to i64
  %34 = load %struct.buf*, %struct.buf** %8, align 8
  %35 = getelementptr inbounds %struct.buf, %struct.buf* %34, i32 0, i32 1
  store i64 %33, i64* %35, align 8
  %36 = load %struct.buf*, %struct.buf** %8, align 8
  %37 = getelementptr inbounds %struct.buf, %struct.buf* %36, i32 0, i32 0
  %38 = load i8*, i8** %37, align 8
  %39 = load i8*, i8** %6, align 8
  %40 = load i32, i32* %7, align 4
  %41 = sext i32 %40 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* %39, i64 %41, i32 1, i1 false)
  %42 = load %struct.buf*, %struct.buf** %8, align 8
  %43 = getelementptr inbounds %struct.buf, %struct.buf* %42, i32 0, i32 3
  store %struct.buf* null, %struct.buf** %43, align 8
  %44 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %45 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %44, i32 0, i32 0
  %46 = load %struct.buf*, %struct.buf** %45, align 8
  %47 = load %struct.buf*, %struct.buf** %8, align 8
  %48 = getelementptr inbounds %struct.buf, %struct.buf* %47, i32 0, i32 4
  store %struct.buf* %46, %struct.buf** %48, align 8
  %49 = load %struct.buf*, %struct.buf** %8, align 8
  %50 = getelementptr inbounds %struct.buf, %struct.buf* %49, i32 0, i32 2
  store i64 0, i64* %50, align 8
  %51 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %52 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %51, i32 0, i32 1
  %53 = load %struct.buf*, %struct.buf** %52, align 8
  %54 = icmp ne %struct.buf* %53, null
  br i1 %54, label %60, label %55

; <label>:55:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i64 0, i64 3)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i64 0, i64 3)
  %57 = load %struct.buf*, %struct.buf** %8, align 8
  %58 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %59 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %58, i32 0, i32 1
  store %struct.buf* %57, %struct.buf** %59, align 8
  br label %67

; <label>:60:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i64 0, i64 1)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_addbuf, i64 0, i64 1)
  %62 = load %struct.buf*, %struct.buf** %8, align 8
  %63 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %64 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %63, i32 0, i32 0
  %65 = load %struct.buf*, %struct.buf** %64, align 8
  %66 = getelementptr inbounds %struct.buf, %struct.buf* %65, i32 0, i32 3
  store %struct.buf* %62, %struct.buf** %66, align 8
  br label %67

; <label>:67:                                     ; preds = %60, %55
  %68 = load %struct.buf*, %struct.buf** %8, align 8
  %69 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %70 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %69, i32 0, i32 0
  store %struct.buf* %68, %struct.buf** %70, align 8
  %71 = load i32, i32* %7, align 4
  %72 = load %struct.mpstr*, %struct.mpstr** %5, align 8
  %73 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %72, i32 0, i32 2
  %74 = load i32, i32* %73, align 8
  %75 = add nsw i32 %74, %71
  store i32 %75, i32* %73, align 8
  %76 = load %struct.buf*, %struct.buf** %8, align 8
  store %struct.buf* %76, %struct.buf** %4, align 8
  br label %77

; <label>:77:                                     ; preds = %67, %27, %13
  %78 = load %struct.buf*, %struct.buf** %4, align 8
  ret %struct.buf* %78
}

; Function Attrs: nounwind uwtable
define internal void @read_head(%struct.mpstr*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_read_head, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_read_head, i64 0, i64 0)
  %3 = alloca %struct.mpstr*, align 8
  %4 = alloca i64, align 8
  store %struct.mpstr* %0, %struct.mpstr** %3, align 8
  %5 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %6 = call i32 @read_buf_byte(%struct.mpstr* %5)
  %7 = sext i32 %6 to i64
  store i64 %7, i64* %4, align 8
  %8 = load i64, i64* %4, align 8
  %9 = shl i64 %8, 8
  store i64 %9, i64* %4, align 8
  %10 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %11 = call i32 @read_buf_byte(%struct.mpstr* %10)
  %12 = sext i32 %11 to i64
  %13 = load i64, i64* %4, align 8
  %14 = or i64 %13, %12
  store i64 %14, i64* %4, align 8
  %15 = load i64, i64* %4, align 8
  %16 = shl i64 %15, 8
  store i64 %16, i64* %4, align 8
  %17 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %18 = call i32 @read_buf_byte(%struct.mpstr* %17)
  %19 = sext i32 %18 to i64
  %20 = load i64, i64* %4, align 8
  %21 = or i64 %20, %19
  store i64 %21, i64* %4, align 8
  %22 = load i64, i64* %4, align 8
  %23 = shl i64 %22, 8
  store i64 %23, i64* %4, align 8
  %24 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %25 = call i32 @read_buf_byte(%struct.mpstr* %24)
  %26 = sext i32 %25 to i64
  %27 = load i64, i64* %4, align 8
  %28 = or i64 %27, %26
  store i64 %28, i64* %4, align 8
  %29 = load i64, i64* %4, align 8
  %30 = load %struct.mpstr*, %struct.mpstr** %3, align 8
  %31 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %30, i32 0, i32 9
  store i64 %29, i64* %31, align 8
  ret void
}

declare i32 @decode_header(%struct.frame*, i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define internal void @remove_buf(%struct.mpstr*) #0 {
  %2 = alloca %struct.mpstr*, align 8
  %3 = alloca %struct.buf*, align 8
  store %struct.mpstr* %0, %struct.mpstr** %2, align 8
  %4 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %5 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %4, i32 0, i32 1
  %6 = load %struct.buf*, %struct.buf** %5, align 8
  store %struct.buf* %6, %struct.buf** %3, align 8
  %7 = load %struct.buf*, %struct.buf** %3, align 8
  %8 = getelementptr inbounds %struct.buf, %struct.buf* %7, i32 0, i32 3
  %9 = load %struct.buf*, %struct.buf** %8, align 8
  %10 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %11 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %10, i32 0, i32 1
  store %struct.buf* %9, %struct.buf** %11, align 8
  %12 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %13 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %12, i32 0, i32 1
  %14 = load %struct.buf*, %struct.buf** %13, align 8
  %15 = icmp ne %struct.buf* %14, null
  br i1 %15, label %16, label %22

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_remove_buf, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_remove_buf, i64 0, i64 0)
  %18 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %19 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %18, i32 0, i32 1
  %20 = load %struct.buf*, %struct.buf** %19, align 8
  %21 = getelementptr inbounds %struct.buf, %struct.buf* %20, i32 0, i32 4
  store %struct.buf* null, %struct.buf** %21, align 8
  br label %28

; <label>:22:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_remove_buf, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_remove_buf, i64 0, i64 1)
  %24 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %25 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %24, i32 0, i32 0
  store %struct.buf* null, %struct.buf** %25, align 8
  %26 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %27 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %26, i32 0, i32 1
  store %struct.buf* null, %struct.buf** %27, align 8
  br label %28

; <label>:28:                                     ; preds = %22, %16
  %29 = load %struct.buf*, %struct.buf** %3, align 8
  %30 = getelementptr inbounds %struct.buf, %struct.buf* %29, i32 0, i32 0
  %31 = load i8*, i8** %30, align 8
  call void @free(i8* %31) #5
  %32 = load %struct.buf*, %struct.buf** %3, align 8
  %33 = bitcast %struct.buf* %32 to i8*
  call void @free(i8* %33) #5
  ret void
}

declare i32 @getbits(i32) #2

declare i32 @do_layer3(%struct.frame*, i8*, i32*) #2

; Function Attrs: nounwind uwtable
define i32 @set_pointer(i64) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  %5 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %6 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %5, i32 0, i32 4
  %7 = load i32, i32* %6, align 8
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %18

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i64 0, i64 2)
  %11 = load i64, i64* %3, align 8
  %12 = icmp sgt i64 %11, 0
  br i1 %12, label %13, label %18

; <label>:13:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i64 0, i64 3)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i64 0, i64 3)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = load i64, i64* %3, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i64 %16)
  store i32 -1, i32* %2, align 4
  br label %49

; <label>:18:                                     ; preds = %9, %1
  %19 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %20 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %19, i32 0, i32 6
  %21 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %22 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %21, i32 0, i32 10
  %23 = load i32, i32* %22, align 8
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [2 x [2304 x i8]], [2 x [2304 x i8]]* %20, i64 0, i64 %24
  %26 = getelementptr inbounds [2304 x i8], [2304 x i8]* %25, i32 0, i32 0
  %27 = getelementptr inbounds i8, i8* %26, i64 512
  store i8* %27, i8** %4, align 8
  %28 = load i64, i64* %3, align 8
  %29 = load i8*, i8** @wordpointer, align 8
  %30 = sub i64 0, %28
  %31 = getelementptr inbounds i8, i8* %29, i64 %30
  store i8* %31, i8** @wordpointer, align 8
  %32 = load i64, i64* %3, align 8
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %47

; <label>:34:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i64 0, i64 1)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i64 0, i64 1)
  %36 = load i8*, i8** @wordpointer, align 8
  %37 = load i8*, i8** %4, align 8
  %38 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %39 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %38, i32 0, i32 4
  %40 = load i32, i32* %39, align 8
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8* %37, i64 %41
  %43 = load i64, i64* %3, align 8
  %44 = sub i64 0, %43
  %45 = getelementptr inbounds i8, i8* %42, i64 %44
  %46 = load i64, i64* %3, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %45, i64 %46, i32 1, i1 false)
  br label %47

; <label>:47:                                     ; preds = %34, %18
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i64 0, i64 0)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_set_pointer, i64 0, i64 0)
  store i32 0, i32* @bitindex, align 4
  store i32 0, i32* %2, align 4
  br label %49

; <label>:49:                                     ; preds = %47, %13
  %50 = load i32, i32* %2, align 4
  ret i32 %50
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define internal i32 @read_buf_byte(%struct.mpstr*) #0 {
  %2 = alloca %struct.mpstr*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct.mpstr* %0, %struct.mpstr** %2, align 8
  %5 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %6 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %5, i32 0, i32 1
  %7 = load %struct.buf*, %struct.buf** %6, align 8
  %8 = getelementptr inbounds %struct.buf, %struct.buf* %7, i32 0, i32 2
  %9 = load i64, i64* %8, align 8
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %4, align 4
  br label %11

; <label>:11:                                     ; preds = %36, %1
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %15 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %14, i32 0, i32 1
  %16 = load %struct.buf*, %struct.buf** %15, align 8
  %17 = getelementptr inbounds %struct.buf, %struct.buf* %16, i32 0, i32 1
  %18 = load i64, i64* %17, align 8
  %19 = icmp sge i64 %13, %18
  br i1 %19, label %20, label %38

; <label>:20:                                     ; preds = %11
  %21 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  call void @remove_buf(%struct.mpstr* %21)
  %22 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %23 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %22, i32 0, i32 1
  %24 = load %struct.buf*, %struct.buf** %23, align 8
  %25 = getelementptr inbounds %struct.buf, %struct.buf* %24, i32 0, i32 2
  %26 = load i64, i64* %25, align 8
  %27 = trunc i64 %26 to i32
  store i32 %27, i32* %4, align 4
  %28 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %29 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %28, i32 0, i32 1
  %30 = load %struct.buf*, %struct.buf** %29, align 8
  %31 = icmp ne %struct.buf* %30, null
  br i1 %31, label %36, label %32

; <label>:32:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_buf_byte, i64 0, i64 2)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_buf_byte, i64 0, i64 2)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:36:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_buf_byte, i64 0, i64 0)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_buf_byte, i64 0, i64 0)
  br label %11

; <label>:38:                                     ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_buf_byte, i64 0, i64 1)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_buf_byte, i64 0, i64 1)
  %40 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %41 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %40, i32 0, i32 1
  %42 = load %struct.buf*, %struct.buf** %41, align 8
  %43 = getelementptr inbounds %struct.buf, %struct.buf* %42, i32 0, i32 0
  %44 = load i8*, i8** %43, align 8
  %45 = load i32, i32* %4, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %44, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  store i32 %49, i32* %3, align 4
  %50 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %51 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %50, i32 0, i32 2
  %52 = load i32, i32* %51, align 8
  %53 = add nsw i32 %52, -1
  store i32 %53, i32* %51, align 8
  %54 = load %struct.mpstr*, %struct.mpstr** %2, align 8
  %55 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %54, i32 0, i32 1
  %56 = load %struct.buf*, %struct.buf** %55, align 8
  %57 = getelementptr inbounds %struct.buf, %struct.buf* %56, i32 0, i32 2
  %58 = load i64, i64* %57, align 8
  %59 = add nsw i64 %58, 1
  store i64 %59, i64* %57, align 8
  %60 = load i32, i32* %3, align 4
  ret i32 %60
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
