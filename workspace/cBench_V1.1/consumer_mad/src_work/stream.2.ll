; ModuleID = 'tmp1.ll'
source_filename = "stream.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mad_stream = type { i8*, i8*, i64, i32, i64, i8*, i8*, %struct.mad_bitptr, %struct.mad_bitptr, i32, [2567 x i8]*, i32, i32, i32 }
%struct.mad_bitptr = type { i8*, i16, i16 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [9 x i8] c"no error\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"input buffer too small (or EOF)\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"invalid (null) buffer pointer\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"not enough memory\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"lost synchronization\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"reserved header layer value\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"forbidden bitrate value\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"reserved sample frequency value\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"reserved emphasis value\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"CRC check failed\00", align 1
@.str.10 = private unnamed_addr constant [31 x i8] c"forbidden bit allocation value\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"bad scalefactor index\00", align 1
@.str.12 = private unnamed_addr constant [17 x i8] c"bad frame length\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"bad big_values count\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"reserved block_type\00", align 1
@.str.15 = private unnamed_addr constant [31 x i8] c"bad scalefactor selection info\00", align 1
@.str.16 = private unnamed_addr constant [28 x i8] c"bad main_data_begin pointer\00", align 1
@.str.17 = private unnamed_addr constant [22 x i8] c"bad audio data length\00", align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"bad Huffman table select\00", align 1
@.str.19 = private unnamed_addr constant [21 x i8] c"Huffman data overrun\00", align 1
@.str.20 = private unnamed_addr constant [31 x i8] c"incompatible block_type for JS\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_mad_stream_init = private constant [15 x i8] c"mad_stream_init"
@__profn_mad_stream_finish = private constant [17 x i8] c"mad_stream_finish"
@__profn_mad_stream_buffer = private constant [17 x i8] c"mad_stream_buffer"
@__profn_mad_stream_skip = private constant [15 x i8] c"mad_stream_skip"
@__profn_mad_stream_sync = private constant [15 x i8] c"mad_stream_sync"
@__profn_mad_stream_errorstr = private constant [19 x i8] c"mad_stream_errorstr"
@__profc_mad_stream_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_stream_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 920736262126503624, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_init, i32 0, i32 0), i8* bitcast (void (%struct.mad_stream*)* @mad_stream_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_stream_finish = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_stream_finish = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4610333156777493439, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_stream_finish, i32 0, i32 0), i8* bitcast (void (%struct.mad_stream*)* @mad_stream_finish to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_stream_buffer = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_stream_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5506589159083111851, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_buffer, i32 0, i32 0), i8* bitcast (void (%struct.mad_stream*, i8*, i64)* @mad_stream_buffer to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_stream_skip = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_stream_skip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8762716506060757420, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_skip, i32 0, i32 0), i8* bitcast (void (%struct.mad_stream*, i64)* @mad_stream_skip to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_stream_sync = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_stream_sync = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1710786961622209779, i64 71233526746, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i32 0, i32 0), i8* bitcast (i32 (%struct.mad_stream*)* @mad_stream_sync to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mad_stream_errorstr = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_stream_errorstr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2247801051308122654, i64 201121703396, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i32 0, i32 0), i8* bitcast (i8* (%struct.mad_stream*)* @mad_stream_errorstr to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [61 x i8] c"g;x\DA\CBML\89/.)JM\CC\8D\CF\CC\CB,a\CCE\F0\D3\80\02\C5\19\C8\22I\A5ii\A9E\C8\22\C5\D9\99\05(\FC\CA\BCdd~jQQ~\11\90\0D\000u(\94", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_stream_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_stream_finish to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_stream_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_stream_skip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_stream_sync to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_stream_errorstr to i8*), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @mad_stream_init(%struct.mad_stream*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_init, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_init, i64 0, i64 0)
  %3 = alloca %struct.mad_stream*, align 8
  store %struct.mad_stream* %0, %struct.mad_stream** %3, align 8
  %4 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %5 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %4, i32 0, i32 0
  store i8* null, i8** %5, align 8
  %6 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %7 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %6, i32 0, i32 1
  store i8* null, i8** %7, align 8
  %8 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %9 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %8, i32 0, i32 2
  store i64 0, i64* %9, align 8
  %10 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %11 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %10, i32 0, i32 3
  store i32 0, i32* %11, align 8
  %12 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %13 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %12, i32 0, i32 4
  store i64 0, i64* %13, align 8
  %14 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %15 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %14, i32 0, i32 5
  store i8* null, i8** %15, align 8
  %16 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %17 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %16, i32 0, i32 6
  store i8* null, i8** %17, align 8
  %18 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %19 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %18, i32 0, i32 7
  call void @mad_bit_init(%struct.mad_bitptr* %19, i8* null)
  %20 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %21 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %20, i32 0, i32 8
  call void @mad_bit_init(%struct.mad_bitptr* %21, i8* null)
  %22 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %23 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %22, i32 0, i32 9
  store i32 0, i32* %23, align 8
  %24 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %25 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %24, i32 0, i32 10
  store [2567 x i8]* null, [2567 x i8]** %25, align 8
  %26 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %27 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %26, i32 0, i32 11
  store i32 0, i32* %27, align 8
  %28 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %29 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %28, i32 0, i32 12
  store i32 0, i32* %29, align 4
  %30 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %31 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %30, i32 0, i32 13
  store i32 0, i32* %31, align 8
  ret void
}

declare void @mad_bit_init(%struct.mad_bitptr*, i8*) #1

; Function Attrs: nounwind uwtable
define void @mad_stream_finish(%struct.mad_stream*) #0 {
  %2 = alloca %struct.mad_stream*, align 8
  store %struct.mad_stream* %0, %struct.mad_stream** %2, align 8
  %3 = load %struct.mad_stream*, %struct.mad_stream** %2, align 8
  %4 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %3, i32 0, i32 10
  %5 = load [2567 x i8]*, [2567 x i8]** %4, align 8
  %6 = icmp ne [2567 x i8]* %5, null
  br i1 %6, label %7, label %15

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_stream_finish, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_stream_finish, i64 0, i64 1)
  %9 = load %struct.mad_stream*, %struct.mad_stream** %2, align 8
  %10 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %9, i32 0, i32 10
  %11 = load [2567 x i8]*, [2567 x i8]** %10, align 8
  %12 = bitcast [2567 x i8]* %11 to i8*
  call void @free(i8* %12) #3
  %13 = load %struct.mad_stream*, %struct.mad_stream** %2, align 8
  %14 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %13, i32 0, i32 10
  store [2567 x i8]* null, [2567 x i8]** %14, align 8
  br label %15

; <label>:15:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_stream_finish, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_stream_finish, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @mad_stream_buffer(%struct.mad_stream*, i8*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_buffer, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_buffer, i64 0, i64 0)
  %5 = alloca %struct.mad_stream*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store %struct.mad_stream* %0, %struct.mad_stream** %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load i8*, i8** %6, align 8
  %9 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %10 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %9, i32 0, i32 0
  store i8* %8, i8** %10, align 8
  %11 = load i8*, i8** %6, align 8
  %12 = load i64, i64* %7, align 8
  %13 = getelementptr inbounds i8, i8* %11, i64 %12
  %14 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %15 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %14, i32 0, i32 1
  store i8* %13, i8** %15, align 8
  %16 = load i8*, i8** %6, align 8
  %17 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %18 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %17, i32 0, i32 5
  store i8* %16, i8** %18, align 8
  %19 = load i8*, i8** %6, align 8
  %20 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %21 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %20, i32 0, i32 6
  store i8* %19, i8** %21, align 8
  %22 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %23 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %22, i32 0, i32 3
  store i32 1, i32* %23, align 8
  %24 = load %struct.mad_stream*, %struct.mad_stream** %5, align 8
  %25 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %24, i32 0, i32 7
  %26 = load i8*, i8** %6, align 8
  call void @mad_bit_init(%struct.mad_bitptr* %25, i8* %26)
  ret void
}

; Function Attrs: nounwind uwtable
define void @mad_stream_skip(%struct.mad_stream*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_skip, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mad_stream_skip, i64 0, i64 0)
  %4 = alloca %struct.mad_stream*, align 8
  %5 = alloca i64, align 8
  store %struct.mad_stream* %0, %struct.mad_stream** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = load %struct.mad_stream*, %struct.mad_stream** %4, align 8
  %8 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %7, i32 0, i32 2
  %9 = load i64, i64* %8, align 8
  %10 = add i64 %9, %6
  store i64 %10, i64* %8, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @mad_stream_sync(%struct.mad_stream*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.mad_stream*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store %struct.mad_stream* %0, %struct.mad_stream** %3, align 8
  %6 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %7 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %6, i32 0, i32 7
  %8 = call i8* @mad_bit_nextbyte(%struct.mad_bitptr* %7)
  store i8* %8, i8** %4, align 8
  %9 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %10 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %9, i32 0, i32 1
  %11 = load i8*, i8** %10, align 8
  store i8* %11, i8** %5, align 8
  br label %12

; <label>:12:                                     ; preds = %37, %1
  %13 = load i8*, i8** %4, align 8
  %14 = load i8*, i8** %5, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 -1
  %16 = icmp ult i8* %13, %15
  br i1 %16, label %17, label %35

; <label>:17:                                     ; preds = %12
  %18 = load i8*, i8** %4, align 8
  %19 = getelementptr inbounds i8, i8* %18, i64 0
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp eq i32 %21, 255
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 2)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 2)
  %25 = load i8*, i8** %4, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 1
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = and i32 %28, 224
  %30 = icmp eq i32 %29, 224
  br label %31

; <label>:31:                                     ; preds = %23, %17
  %32 = phi i1 [ false, %17 ], [ %30, %23 ]
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 1)
  %34 = xor i1 %32, true
  br label %35

; <label>:35:                                     ; preds = %31, %12
  %36 = phi i1 [ false, %12 ], [ %34, %31 ]
  br i1 %36, label %37, label %41

; <label>:37:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 0)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 0)
  %39 = load i8*, i8** %4, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %4, align 8
  br label %12

; <label>:41:                                     ; preds = %35
  %42 = load i8*, i8** %5, align 8
  %43 = load i8*, i8** %4, align 8
  %44 = ptrtoint i8* %42 to i64
  %45 = ptrtoint i8* %43 to i64
  %46 = sub i64 %44, %45
  %47 = icmp slt i64 %46, 8
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 3)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 3)
  store i32 -1, i32* %2, align 4
  br label %55

; <label>:50:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 4)
  %51 = add i64 %pgocount4, 1
  store i64 %51, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mad_stream_sync, i64 0, i64 4)
  %52 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %53 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %52, i32 0, i32 7
  %54 = load i8*, i8** %4, align 8
  call void @mad_bit_init(%struct.mad_bitptr* %53, i8* %54)
  store i32 0, i32* %2, align 4
  br label %55

; <label>:55:                                     ; preds = %50, %48
  %56 = load i32, i32* %2, align 4
  ret i32 %56
}

declare i8* @mad_bit_nextbyte(%struct.mad_bitptr*) #1

; Function Attrs: nounwind uwtable
define i8* @mad_stream_errorstr(%struct.mad_stream*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.mad_stream*, align 8
  store %struct.mad_stream* %0, %struct.mad_stream** %3, align 8
  %4 = load %struct.mad_stream*, %struct.mad_stream** %3, align 8
  %5 = getelementptr inbounds %struct.mad_stream, %struct.mad_stream* %4, i32 0, i32 13
  %6 = load i32, i32* %5, align 8
  switch i32 %6, label %49 [
    i32 0, label %7
    i32 1, label %9
    i32 2, label %11
    i32 49, label %13
    i32 257, label %15
    i32 258, label %17
    i32 259, label %19
    i32 260, label %21
    i32 261, label %23
    i32 513, label %25
    i32 529, label %27
    i32 545, label %29
    i32 561, label %31
    i32 562, label %33
    i32 563, label %35
    i32 564, label %37
    i32 565, label %39
    i32 566, label %41
    i32 567, label %43
    i32 568, label %45
    i32 569, label %47
  ]

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 1)
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 2)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 2)
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:11:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 3)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 3)
  store i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:13:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 4)
  %14 = add i64 %pgocount3, 1
  store i64 %14, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 4)
  store i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:15:                                     ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 5)
  %16 = add i64 %pgocount4, 1
  store i64 %16, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 5)
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:17:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 6)
  %18 = add i64 %pgocount5, 1
  store i64 %18, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 6)
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:19:                                     ; preds = %1
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 7)
  %20 = add i64 %pgocount6, 1
  store i64 %20, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 7)
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:21:                                     ; preds = %1
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 8)
  %22 = add i64 %pgocount7, 1
  store i64 %22, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 8)
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:23:                                     ; preds = %1
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 9)
  %24 = add i64 %pgocount8, 1
  store i64 %24, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 9)
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:25:                                     ; preds = %1
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 10)
  %26 = add i64 %pgocount9, 1
  store i64 %26, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 10)
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:27:                                     ; preds = %1
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 11)
  %28 = add i64 %pgocount10, 1
  store i64 %28, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 11)
  store i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.10, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:29:                                     ; preds = %1
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 12)
  %30 = add i64 %pgocount11, 1
  store i64 %30, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 12)
  store i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.11, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:31:                                     ; preds = %1
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 13)
  %32 = add i64 %pgocount12, 1
  store i64 %32, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 13)
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.12, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:33:                                     ; preds = %1
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 14)
  %34 = add i64 %pgocount13, 1
  store i64 %34, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 14)
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.13, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:35:                                     ; preds = %1
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 15)
  %36 = add i64 %pgocount14, 1
  store i64 %36, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 15)
  store i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:37:                                     ; preds = %1
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 16)
  %38 = add i64 %pgocount15, 1
  store i64 %38, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 16)
  store i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.15, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:39:                                     ; preds = %1
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 17)
  %40 = add i64 %pgocount16, 1
  store i64 %40, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 17)
  store i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.16, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:41:                                     ; preds = %1
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 18)
  %42 = add i64 %pgocount17, 1
  store i64 %42, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 18)
  store i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.17, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:43:                                     ; preds = %1
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 19)
  %44 = add i64 %pgocount18, 1
  store i64 %44, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 19)
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.18, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:45:                                     ; preds = %1
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 20)
  %46 = add i64 %pgocount19, 1
  store i64 %46, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 20)
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.19, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:47:                                     ; preds = %1
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 21)
  %48 = add i64 %pgocount20, 1
  store i64 %48, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 21)
  store i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.20, i32 0, i32 0), i8** %2, align 8
  br label %51

; <label>:49:                                     ; preds = %1
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 0)
  %50 = add i64 %pgocount21, 1
  store i64 %50, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_mad_stream_errorstr, i64 0, i64 0)
  store i8* null, i8** %2, align 8
  br label %51

; <label>:51:                                     ; preds = %49, %47, %45, %43, %41, %39, %37, %35, %33, %31, %29, %27, %25, %23, %21, %19, %17, %15, %13, %11, %9, %7
  %52 = load i8*, i8** %2, align 8
  ret i8* %52
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
