; ModuleID = 'tmp1.ll'
source_filename = "sha.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.SHA_INFO = type { [5 x i64], i64, i64, [16 x i64] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [31 x i8] c"%08lx %08lx %08lx %08lx %08lx\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_sha_init = private constant [8 x i8] c"sha_init"
@__profn_sha_update = private constant [10 x i8] c"sha_update"
@__profn_tmp1.ll_byte_reverse = private constant [20 x i8] c"tmp1.ll:byte_reverse"
@__profn_tmp1.ll_sha_transform = private constant [21 x i8] c"tmp1.ll:sha_transform"
@__profn_sha_final = private constant [9 x i8] c"sha_final"
@__profn_sha_stream = private constant [10 x i8] c"sha_stream"
@__profn_sha_print = private constant [9 x i8] c"sha_print"
@__profc_sha_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_sha_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7595033541577434166, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sha_init, i32 0, i32 0), i8* bitcast (void (%struct.SHA_INFO*)* @sha_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_sha_update = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_sha_update = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2045070118201597007, i64 41050452873, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_sha_update, i32 0, i32 0), i8* bitcast (void (%struct.SHA_INFO*, i8*, i32)* @sha_update to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_byte_reverse = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_byte_reverse = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -658027949905860731, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_byte_reverse, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_sha_transform = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_sha_transform = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7400576519868653898, i64 139908714957, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_sha_final = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_sha_final = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6714209107912125778, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_final, i32 0, i32 0), i8* bitcast (void (%struct.SHA_INFO*)* @sha_final to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_sha_stream = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_sha_stream = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9003579549049797697, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_stream, i32 0, i32 0), i8* bitcast (void (%struct.SHA_INFO*, %struct._IO_FILE*)* @sha_stream to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_sha_print = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_sha_print = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4085619413229390311, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sha_print, i32 0, i32 0), i8* bitcast (void (%struct.SHA_INFO*)* @sha_print to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [79 x i8] c"]Mx\DAE\8BA\0A\800\0C\04\E9\87\04\AF~\A6DL1\D0\A6!Y\05\7F\AF\D6\83\B7a\98\89\9D\B2\A8 \C5\03\87m\04Nh6O\B5.\EB\05\CE\CE'{\FC\F2\ED\E0\A4Q\BA\B7q\15Q\AA\83\02\CE\F4IsQ\DCfn#\12", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_sha_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_sha_update to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_byte_reverse to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sha_transform to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_sha_final to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_sha_stream to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_sha_print to i8*), i8* getelementptr inbounds ([79 x i8], [79 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @sha_init(%struct.SHA_INFO*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sha_init, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sha_init, i64 0, i64 0)
  %3 = alloca %struct.SHA_INFO*, align 8
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %3, align 8
  %4 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %5 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %4, i32 0, i32 0
  %6 = getelementptr inbounds [5 x i64], [5 x i64]* %5, i64 0, i64 0
  store i64 1732584193, i64* %6, align 8
  %7 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %8 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %7, i32 0, i32 0
  %9 = getelementptr inbounds [5 x i64], [5 x i64]* %8, i64 0, i64 1
  store i64 4023233417, i64* %9, align 8
  %10 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %11 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %10, i32 0, i32 0
  %12 = getelementptr inbounds [5 x i64], [5 x i64]* %11, i64 0, i64 2
  store i64 2562383102, i64* %12, align 8
  %13 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %14 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %13, i32 0, i32 0
  %15 = getelementptr inbounds [5 x i64], [5 x i64]* %14, i64 0, i64 3
  store i64 271733878, i64* %15, align 8
  %16 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %17 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %16, i32 0, i32 0
  %18 = getelementptr inbounds [5 x i64], [5 x i64]* %17, i64 0, i64 4
  store i64 3285377520, i64* %18, align 8
  %19 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %20 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %19, i32 0, i32 1
  store i64 0, i64* %20, align 8
  %21 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %22 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %21, i32 0, i32 2
  store i64 0, i64* %22, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @sha_update(%struct.SHA_INFO*, i8*, i32) #0 {
  %4 = alloca %struct.SHA_INFO*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %8 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %7, i32 0, i32 1
  %9 = load i64, i64* %8, align 8
  %10 = load i32, i32* %6, align 4
  %11 = sext i32 %10 to i64
  %12 = shl i64 %11, 3
  %13 = add i64 %9, %12
  %14 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %15 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %14, i32 0, i32 1
  %16 = load i64, i64* %15, align 8
  %17 = icmp ult i64 %13, %16
  br i1 %17, label %18, label %24

; <label>:18:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_sha_update, i64 0, i64 2)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_sha_update, i64 0, i64 2)
  %20 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %21 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %20, i32 0, i32 2
  %22 = load i64, i64* %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* %21, align 8
  br label %24

; <label>:24:                                     ; preds = %18, %3
  %25 = load i32, i32* %6, align 4
  %26 = sext i32 %25 to i64
  %27 = shl i64 %26, 3
  %28 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %29 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %28, i32 0, i32 1
  %30 = load i64, i64* %29, align 8
  %31 = add i64 %30, %27
  store i64 %31, i64* %29, align 8
  %32 = load i32, i32* %6, align 4
  %33 = sext i32 %32 to i64
  %34 = lshr i64 %33, 29
  %35 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %36 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %35, i32 0, i32 2
  %37 = load i64, i64* %36, align 8
  %38 = add i64 %37, %34
  store i64 %38, i64* %36, align 8
  br label %39

; <label>:39:                                     ; preds = %42, %24
  %40 = load i32, i32* %6, align 4
  %41 = icmp sge i32 %40, 64
  br i1 %41, label %42, label %57

; <label>:42:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_sha_update, i64 0, i64 0)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_sha_update, i64 0, i64 0)
  %44 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %45 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %44, i32 0, i32 3
  %46 = getelementptr inbounds [16 x i64], [16 x i64]* %45, i32 0, i32 0
  %47 = bitcast i64* %46 to i8*
  %48 = load i8*, i8** %5, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %47, i8* %48, i64 64, i32 1, i1 false)
  %49 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %50 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %49, i32 0, i32 3
  %51 = getelementptr inbounds [16 x i64], [16 x i64]* %50, i32 0, i32 0
  call void @byte_reverse(i64* %51, i32 64)
  %52 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  call void @sha_transform(%struct.SHA_INFO* %52)
  %53 = load i8*, i8** %5, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 64
  store i8* %54, i8** %5, align 8
  %55 = load i32, i32* %6, align 4
  %56 = sub nsw i32 %55, 64
  store i32 %56, i32* %6, align 4
  br label %39

; <label>:57:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_sha_update, i64 0, i64 1)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_sha_update, i64 0, i64 1)
  %59 = load %struct.SHA_INFO*, %struct.SHA_INFO** %4, align 8
  %60 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %59, i32 0, i32 3
  %61 = getelementptr inbounds [16 x i64], [16 x i64]* %60, i32 0, i32 0
  %62 = bitcast i64* %61 to i8*
  %63 = load i8*, i8** %5, align 8
  %64 = load i32, i32* %6, align 4
  %65 = sext i32 %64 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %62, i8* %63, i64 %65, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define internal void @byte_reverse(i64*, i32) #0 {
  %3 = alloca i64*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [4 x i8], align 1
  %7 = alloca i8*, align 8
  store i64* %0, i64** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load i32, i32* %4, align 4
  %9 = sext i32 %8 to i64
  %10 = udiv i64 %9, 8
  %11 = trunc i64 %10 to i32
  store i32 %11, i32* %4, align 4
  %12 = load i64*, i64** %3, align 8
  %13 = bitcast i64* %12 to i8*
  store i8* %13, i8** %7, align 8
  store i32 0, i32* %5, align 4
  br label %14

; <label>:14:                                     ; preds = %53, %2
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %4, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %57

; <label>:18:                                     ; preds = %14
  %19 = load i8*, i8** %7, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = load i8, i8* %20, align 1
  %22 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  store i8 %21, i8* %22, align 1
  %23 = load i8*, i8** %7, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 1
  %25 = load i8, i8* %24, align 1
  %26 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 1
  store i8 %25, i8* %26, align 1
  %27 = load i8*, i8** %7, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 2
  %29 = load i8, i8* %28, align 1
  %30 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 2
  store i8 %29, i8* %30, align 1
  %31 = load i8*, i8** %7, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 3
  %33 = load i8, i8* %32, align 1
  %34 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 3
  store i8 %33, i8* %34, align 1
  %35 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 3
  %36 = load i8, i8* %35, align 1
  %37 = load i8*, i8** %7, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 0
  store i8 %36, i8* %38, align 1
  %39 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 2
  %40 = load i8, i8* %39, align 1
  %41 = load i8*, i8** %7, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 1
  store i8 %40, i8* %42, align 1
  %43 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 1
  %44 = load i8, i8* %43, align 1
  %45 = load i8*, i8** %7, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 2
  store i8 %44, i8* %46, align 1
  %47 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  %48 = load i8, i8* %47, align 1
  %49 = load i8*, i8** %7, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 3
  store i8 %48, i8* %50, align 1
  %51 = load i8*, i8** %7, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 8
  store i8* %52, i8** %7, align 8
  br label %53

; <label>:53:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_byte_reverse, i64 0, i64 0)
  %54 = add i64 %pgocount, 1
  store i64 %54, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_byte_reverse, i64 0, i64 0)
  %55 = load i32, i32* %5, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %5, align 4
  br label %14

; <label>:57:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_byte_reverse, i64 0, i64 1)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_byte_reverse, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @sha_transform(%struct.SHA_INFO*) #0 {
  %2 = alloca %struct.SHA_INFO*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca [80 x i64], align 16
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %2, align 8
  store i32 0, i32* %3, align 4
  br label %11

; <label>:11:                                     ; preds = %24, %1
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %12, 16
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %11
  %15 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %16 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %15, i32 0, i32 3
  %17 = load i32, i32* %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [16 x i64], [16 x i64]* %16, i64 0, i64 %18
  %20 = load i64, i64* %19, align 8
  %21 = load i32, i32* %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %22
  store i64 %20, i64* %23, align 8
  br label %24

; <label>:24:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 0)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 0)
  %26 = load i32, i32* %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %3, align 4
  br label %11

; <label>:28:                                     ; preds = %11
  store i32 16, i32* %3, align 4
  br label %29

; <label>:29:                                     ; preds = %59, %28
  %30 = load i32, i32* %3, align 4
  %31 = icmp slt i32 %30, 80
  br i1 %31, label %32, label %63

; <label>:32:                                     ; preds = %29
  %33 = load i32, i32* %3, align 4
  %34 = sub nsw i32 %33, 3
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %35
  %37 = load i64, i64* %36, align 8
  %38 = load i32, i32* %3, align 4
  %39 = sub nsw i32 %38, 8
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %40
  %42 = load i64, i64* %41, align 8
  %43 = xor i64 %37, %42
  %44 = load i32, i32* %3, align 4
  %45 = sub nsw i32 %44, 14
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %46
  %48 = load i64, i64* %47, align 8
  %49 = xor i64 %43, %48
  %50 = load i32, i32* %3, align 4
  %51 = sub nsw i32 %50, 16
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %52
  %54 = load i64, i64* %53, align 8
  %55 = xor i64 %49, %54
  %56 = load i32, i32* %3, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %57
  store i64 %55, i64* %58, align 8
  br label %59

; <label>:59:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 1)
  %60 = add i64 %pgocount1, 1
  store i64 %60, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 1)
  %61 = load i32, i32* %3, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %3, align 4
  br label %29

; <label>:63:                                     ; preds = %29
  %64 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %65 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %64, i32 0, i32 0
  %66 = getelementptr inbounds [5 x i64], [5 x i64]* %65, i64 0, i64 0
  %67 = load i64, i64* %66, align 8
  store i64 %67, i64* %5, align 8
  %68 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %69 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %68, i32 0, i32 0
  %70 = getelementptr inbounds [5 x i64], [5 x i64]* %69, i64 0, i64 1
  %71 = load i64, i64* %70, align 8
  store i64 %71, i64* %6, align 8
  %72 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %73 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %72, i32 0, i32 0
  %74 = getelementptr inbounds [5 x i64], [5 x i64]* %73, i64 0, i64 2
  %75 = load i64, i64* %74, align 8
  store i64 %75, i64* %7, align 8
  %76 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %77 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %76, i32 0, i32 0
  %78 = getelementptr inbounds [5 x i64], [5 x i64]* %77, i64 0, i64 3
  %79 = load i64, i64* %78, align 8
  store i64 %79, i64* %8, align 8
  %80 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %81 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %80, i32 0, i32 0
  %82 = getelementptr inbounds [5 x i64], [5 x i64]* %81, i64 0, i64 4
  %83 = load i64, i64* %82, align 8
  store i64 %83, i64* %9, align 8
  store i32 0, i32* %3, align 4
  br label %84

; <label>:84:                                     ; preds = %119, %63
  %85 = load i32, i32* %3, align 4
  %86 = icmp slt i32 %85, 20
  br i1 %86, label %87, label %123

; <label>:87:                                     ; preds = %84
  %88 = load i64, i64* %5, align 8
  %89 = shl i64 %88, 5
  %90 = load i64, i64* %5, align 8
  %91 = lshr i64 %90, 27
  %92 = or i64 %89, %91
  %93 = load i64, i64* %6, align 8
  %94 = load i64, i64* %7, align 8
  %95 = and i64 %93, %94
  %96 = load i64, i64* %6, align 8
  %97 = xor i64 %96, -1
  %98 = load i64, i64* %8, align 8
  %99 = and i64 %97, %98
  %100 = or i64 %95, %99
  %101 = add i64 %92, %100
  %102 = load i64, i64* %9, align 8
  %103 = add i64 %101, %102
  %104 = load i32, i32* %3, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %105
  %107 = load i64, i64* %106, align 8
  %108 = add i64 %103, %107
  %109 = add i64 %108, 1518500249
  store i64 %109, i64* %4, align 8
  %110 = load i64, i64* %8, align 8
  store i64 %110, i64* %9, align 8
  %111 = load i64, i64* %7, align 8
  store i64 %111, i64* %8, align 8
  %112 = load i64, i64* %6, align 8
  %113 = shl i64 %112, 30
  %114 = load i64, i64* %6, align 8
  %115 = lshr i64 %114, 2
  %116 = or i64 %113, %115
  store i64 %116, i64* %7, align 8
  %117 = load i64, i64* %5, align 8
  store i64 %117, i64* %6, align 8
  %118 = load i64, i64* %4, align 8
  store i64 %118, i64* %5, align 8
  br label %119

; <label>:119:                                    ; preds = %87
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 2)
  %120 = add i64 %pgocount2, 1
  store i64 %120, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 2)
  %121 = load i32, i32* %3, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %3, align 4
  br label %84

; <label>:123:                                    ; preds = %84
  store i32 20, i32* %3, align 4
  br label %124

; <label>:124:                                    ; preds = %156, %123
  %125 = load i32, i32* %3, align 4
  %126 = icmp slt i32 %125, 40
  br i1 %126, label %127, label %160

; <label>:127:                                    ; preds = %124
  %128 = load i64, i64* %5, align 8
  %129 = shl i64 %128, 5
  %130 = load i64, i64* %5, align 8
  %131 = lshr i64 %130, 27
  %132 = or i64 %129, %131
  %133 = load i64, i64* %6, align 8
  %134 = load i64, i64* %7, align 8
  %135 = xor i64 %133, %134
  %136 = load i64, i64* %8, align 8
  %137 = xor i64 %135, %136
  %138 = add i64 %132, %137
  %139 = load i64, i64* %9, align 8
  %140 = add i64 %138, %139
  %141 = load i32, i32* %3, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %142
  %144 = load i64, i64* %143, align 8
  %145 = add i64 %140, %144
  %146 = add i64 %145, 1859775393
  store i64 %146, i64* %4, align 8
  %147 = load i64, i64* %8, align 8
  store i64 %147, i64* %9, align 8
  %148 = load i64, i64* %7, align 8
  store i64 %148, i64* %8, align 8
  %149 = load i64, i64* %6, align 8
  %150 = shl i64 %149, 30
  %151 = load i64, i64* %6, align 8
  %152 = lshr i64 %151, 2
  %153 = or i64 %150, %152
  store i64 %153, i64* %7, align 8
  %154 = load i64, i64* %5, align 8
  store i64 %154, i64* %6, align 8
  %155 = load i64, i64* %4, align 8
  store i64 %155, i64* %5, align 8
  br label %156

; <label>:156:                                    ; preds = %127
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 3)
  %157 = add i64 %pgocount3, 1
  store i64 %157, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 3)
  %158 = load i32, i32* %3, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, i32* %3, align 4
  br label %124

; <label>:160:                                    ; preds = %124
  store i32 40, i32* %3, align 4
  br label %161

; <label>:161:                                    ; preds = %199, %160
  %162 = load i32, i32* %3, align 4
  %163 = icmp slt i32 %162, 60
  br i1 %163, label %164, label %203

; <label>:164:                                    ; preds = %161
  %165 = load i64, i64* %5, align 8
  %166 = shl i64 %165, 5
  %167 = load i64, i64* %5, align 8
  %168 = lshr i64 %167, 27
  %169 = or i64 %166, %168
  %170 = load i64, i64* %6, align 8
  %171 = load i64, i64* %7, align 8
  %172 = and i64 %170, %171
  %173 = load i64, i64* %6, align 8
  %174 = load i64, i64* %8, align 8
  %175 = and i64 %173, %174
  %176 = or i64 %172, %175
  %177 = load i64, i64* %7, align 8
  %178 = load i64, i64* %8, align 8
  %179 = and i64 %177, %178
  %180 = or i64 %176, %179
  %181 = add i64 %169, %180
  %182 = load i64, i64* %9, align 8
  %183 = add i64 %181, %182
  %184 = load i32, i32* %3, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %185
  %187 = load i64, i64* %186, align 8
  %188 = add i64 %183, %187
  %189 = add i64 %188, 2400959708
  store i64 %189, i64* %4, align 8
  %190 = load i64, i64* %8, align 8
  store i64 %190, i64* %9, align 8
  %191 = load i64, i64* %7, align 8
  store i64 %191, i64* %8, align 8
  %192 = load i64, i64* %6, align 8
  %193 = shl i64 %192, 30
  %194 = load i64, i64* %6, align 8
  %195 = lshr i64 %194, 2
  %196 = or i64 %193, %195
  store i64 %196, i64* %7, align 8
  %197 = load i64, i64* %5, align 8
  store i64 %197, i64* %6, align 8
  %198 = load i64, i64* %4, align 8
  store i64 %198, i64* %5, align 8
  br label %199

; <label>:199:                                    ; preds = %164
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 4)
  %200 = add i64 %pgocount4, 1
  store i64 %200, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 4)
  %201 = load i32, i32* %3, align 4
  %202 = add nsw i32 %201, 1
  store i32 %202, i32* %3, align 4
  br label %161

; <label>:203:                                    ; preds = %161
  store i32 60, i32* %3, align 4
  br label %204

; <label>:204:                                    ; preds = %236, %203
  %205 = load i32, i32* %3, align 4
  %206 = icmp slt i32 %205, 80
  br i1 %206, label %207, label %240

; <label>:207:                                    ; preds = %204
  %208 = load i64, i64* %5, align 8
  %209 = shl i64 %208, 5
  %210 = load i64, i64* %5, align 8
  %211 = lshr i64 %210, 27
  %212 = or i64 %209, %211
  %213 = load i64, i64* %6, align 8
  %214 = load i64, i64* %7, align 8
  %215 = xor i64 %213, %214
  %216 = load i64, i64* %8, align 8
  %217 = xor i64 %215, %216
  %218 = add i64 %212, %217
  %219 = load i64, i64* %9, align 8
  %220 = add i64 %218, %219
  %221 = load i32, i32* %3, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [80 x i64], [80 x i64]* %10, i64 0, i64 %222
  %224 = load i64, i64* %223, align 8
  %225 = add i64 %220, %224
  %226 = add i64 %225, 3395469782
  store i64 %226, i64* %4, align 8
  %227 = load i64, i64* %8, align 8
  store i64 %227, i64* %9, align 8
  %228 = load i64, i64* %7, align 8
  store i64 %228, i64* %8, align 8
  %229 = load i64, i64* %6, align 8
  %230 = shl i64 %229, 30
  %231 = load i64, i64* %6, align 8
  %232 = lshr i64 %231, 2
  %233 = or i64 %230, %232
  store i64 %233, i64* %7, align 8
  %234 = load i64, i64* %5, align 8
  store i64 %234, i64* %6, align 8
  %235 = load i64, i64* %4, align 8
  store i64 %235, i64* %5, align 8
  br label %236

; <label>:236:                                    ; preds = %207
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 5)
  %237 = add i64 %pgocount5, 1
  store i64 %237, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 5)
  %238 = load i32, i32* %3, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* %3, align 4
  br label %204

; <label>:240:                                    ; preds = %204
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 6)
  %241 = add i64 %pgocount6, 1
  store i64 %241, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_sha_transform, i64 0, i64 6)
  %242 = load i64, i64* %5, align 8
  %243 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %244 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %243, i32 0, i32 0
  %245 = getelementptr inbounds [5 x i64], [5 x i64]* %244, i64 0, i64 0
  %246 = load i64, i64* %245, align 8
  %247 = add i64 %246, %242
  store i64 %247, i64* %245, align 8
  %248 = load i64, i64* %6, align 8
  %249 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %250 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %249, i32 0, i32 0
  %251 = getelementptr inbounds [5 x i64], [5 x i64]* %250, i64 0, i64 1
  %252 = load i64, i64* %251, align 8
  %253 = add i64 %252, %248
  store i64 %253, i64* %251, align 8
  %254 = load i64, i64* %7, align 8
  %255 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %256 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %255, i32 0, i32 0
  %257 = getelementptr inbounds [5 x i64], [5 x i64]* %256, i64 0, i64 2
  %258 = load i64, i64* %257, align 8
  %259 = add i64 %258, %254
  store i64 %259, i64* %257, align 8
  %260 = load i64, i64* %8, align 8
  %261 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %262 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %261, i32 0, i32 0
  %263 = getelementptr inbounds [5 x i64], [5 x i64]* %262, i64 0, i64 3
  %264 = load i64, i64* %263, align 8
  %265 = add i64 %264, %260
  store i64 %265, i64* %263, align 8
  %266 = load i64, i64* %9, align 8
  %267 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %268 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %267, i32 0, i32 0
  %269 = getelementptr inbounds [5 x i64], [5 x i64]* %268, i64 0, i64 4
  %270 = load i64, i64* %269, align 8
  %271 = add i64 %270, %266
  store i64 %271, i64* %269, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @sha_final(%struct.SHA_INFO*) #0 {
  %2 = alloca %struct.SHA_INFO*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %2, align 8
  %6 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %7 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %6, i32 0, i32 1
  %8 = load i64, i64* %7, align 8
  store i64 %8, i64* %4, align 8
  %9 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %10 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %9, i32 0, i32 2
  %11 = load i64, i64* %10, align 8
  store i64 %11, i64* %5, align 8
  %12 = load i64, i64* %4, align 8
  %13 = lshr i64 %12, 3
  %14 = and i64 %13, 63
  %15 = trunc i64 %14 to i32
  store i32 %15, i32* %3, align 4
  %16 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %17 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %16, i32 0, i32 3
  %18 = getelementptr inbounds [16 x i64], [16 x i64]* %17, i32 0, i32 0
  %19 = bitcast i64* %18 to i8*
  %20 = load i32, i32* %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %3, align 4
  %22 = sext i32 %20 to i64
  %23 = getelementptr inbounds i8, i8* %19, i64 %22
  store i8 -128, i8* %23, align 1
  %24 = load i32, i32* %3, align 4
  %25 = icmp sgt i32 %24, 56
  br i1 %25, label %26, label %44

; <label>:26:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_final, i64 0, i64 0)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_final, i64 0, i64 0)
  %28 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %29 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %28, i32 0, i32 3
  %30 = bitcast [16 x i64]* %29 to i8*
  %31 = load i32, i32* %3, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  %34 = load i32, i32* %3, align 4
  %35 = sub nsw i32 64, %34
  %36 = sext i32 %35 to i64
  call void @llvm.memset.p0i8.i64(i8* %33, i8 0, i64 %36, i32 1, i1 false)
  %37 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %38 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %37, i32 0, i32 3
  %39 = getelementptr inbounds [16 x i64], [16 x i64]* %38, i32 0, i32 0
  call void @byte_reverse(i64* %39, i32 64)
  %40 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  call void @sha_transform(%struct.SHA_INFO* %40)
  %41 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %42 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %41, i32 0, i32 3
  %43 = bitcast [16 x i64]* %42 to i8*
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 56, i32 8, i1 false)
  br label %55

; <label>:44:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_final, i64 0, i64 1)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_final, i64 0, i64 1)
  %46 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %47 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %46, i32 0, i32 3
  %48 = bitcast [16 x i64]* %47 to i8*
  %49 = load i32, i32* %3, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %48, i64 %50
  %52 = load i32, i32* %3, align 4
  %53 = sub nsw i32 56, %52
  %54 = sext i32 %53 to i64
  call void @llvm.memset.p0i8.i64(i8* %51, i8 0, i64 %54, i32 1, i1 false)
  br label %55

; <label>:55:                                     ; preds = %44, %26
  %56 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %57 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %56, i32 0, i32 3
  %58 = getelementptr inbounds [16 x i64], [16 x i64]* %57, i32 0, i32 0
  call void @byte_reverse(i64* %58, i32 64)
  %59 = load i64, i64* %5, align 8
  %60 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %61 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %60, i32 0, i32 3
  %62 = getelementptr inbounds [16 x i64], [16 x i64]* %61, i64 0, i64 14
  store i64 %59, i64* %62, align 8
  %63 = load i64, i64* %4, align 8
  %64 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  %65 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %64, i32 0, i32 3
  %66 = getelementptr inbounds [16 x i64], [16 x i64]* %65, i64 0, i64 15
  store i64 %63, i64* %66, align 8
  %67 = load %struct.SHA_INFO*, %struct.SHA_INFO** %2, align 8
  call void @sha_transform(%struct.SHA_INFO* %67)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @sha_stream(%struct.SHA_INFO*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.SHA_INFO*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca [8192 x i8], align 16
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %7 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  call void @sha_init(%struct.SHA_INFO* %7)
  br label %8

; <label>:8:                                      ; preds = %14, %2
  %9 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %11 = call i64 @fread(i8* %9, i64 1, i64 8192, %struct._IO_FILE* %10)
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_stream, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_stream, i64 0, i64 0)
  %16 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %17 = getelementptr inbounds [8192 x i8], [8192 x i8]* %6, i32 0, i32 0
  %18 = load i32, i32* %5, align 4
  call void @sha_update(%struct.SHA_INFO* %16, i8* %17, i32 %18)
  br label %8

; <label>:19:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_stream, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sha_stream, i64 0, i64 1)
  %21 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  call void @sha_final(%struct.SHA_INFO* %21)
  ret void
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @sha_print(%struct.SHA_INFO*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sha_print, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_sha_print, i64 0, i64 0)
  %3 = alloca %struct.SHA_INFO*, align 8
  store %struct.SHA_INFO* %0, %struct.SHA_INFO** %3, align 8
  %4 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %5 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %4, i32 0, i32 0
  %6 = getelementptr inbounds [5 x i64], [5 x i64]* %5, i64 0, i64 0
  %7 = load i64, i64* %6, align 8
  %8 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %9 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %8, i32 0, i32 0
  %10 = getelementptr inbounds [5 x i64], [5 x i64]* %9, i64 0, i64 1
  %11 = load i64, i64* %10, align 8
  %12 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %13 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %12, i32 0, i32 0
  %14 = getelementptr inbounds [5 x i64], [5 x i64]* %13, i64 0, i64 2
  %15 = load i64, i64* %14, align 8
  %16 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %17 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %16, i32 0, i32 0
  %18 = getelementptr inbounds [5 x i64], [5 x i64]* %17, i64 0, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = load %struct.SHA_INFO*, %struct.SHA_INFO** %3, align 8
  %21 = getelementptr inbounds %struct.SHA_INFO, %struct.SHA_INFO* %20, i32 0, i32 0
  %22 = getelementptr inbounds [5 x i64], [5 x i64]* %21, i64 0, i64 4
  %23 = load i64, i64* %22, align 8
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i32 0, i32 0), i64 %7, i64 %11, i64 %15, i64 %19, i64 %23)
  ret void
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
