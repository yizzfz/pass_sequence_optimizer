; ModuleID = 'tmp1.ll'
source_filename = "jmemansi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, void (%struct.jpeg_common_struct*)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { void (%struct.jpeg_common_struct*)*, i64, i64, i32, i32 }
%struct.backing_store_struct = type { void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, %struct._IO_FILE*, [64 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_get_small = private constant [14 x i8] c"jpeg_get_small"
@__profn_jpeg_free_small = private constant [15 x i8] c"jpeg_free_small"
@__profn_jpeg_get_large = private constant [14 x i8] c"jpeg_get_large"
@__profn_jpeg_free_large = private constant [15 x i8] c"jpeg_free_large"
@__profn_jpeg_mem_available = private constant [18 x i8] c"jpeg_mem_available"
@__profn_jpeg_open_backing_store = private constant [23 x i8] c"jpeg_open_backing_store"
@__profn_tmp1.ll_read_backing_store = private constant [26 x i8] c"tmp1.ll:read_backing_store"
@__profn_tmp1.ll_write_backing_store = private constant [27 x i8] c"tmp1.ll:write_backing_store"
@__profn_tmp1.ll_close_backing_store = private constant [27 x i8] c"tmp1.ll:close_backing_store"
@__profn_jpeg_mem_init = private constant [13 x i8] c"jpeg_mem_init"
@__profn_jpeg_mem_term = private constant [13 x i8] c"jpeg_mem_term"
@__profc_jpeg_get_small = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_get_small = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7910350896890927404, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_get_small, i32 0, i32 0), i8* bitcast (i8* (%struct.jpeg_common_struct*, i64)* @jpeg_get_small to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_free_small = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_free_small = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5767801597442313778, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_free_small, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, i8*, i64)* @jpeg_free_small to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_get_large = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_get_large = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5823603467302276071, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_get_large, i32 0, i32 0), i8* bitcast (i8* (%struct.jpeg_common_struct*, i64)* @jpeg_get_large to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_free_large = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_free_large = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8226871333763862292, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_free_large, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, i8*, i64)* @jpeg_free_large to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_mem_available = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_mem_available = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8853826619619605765, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_available, i32 0, i32 0), i8* bitcast (i64 (%struct.jpeg_common_struct*, i64, i64, i64)* @jpeg_mem_available to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_open_backing_store = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_open_backing_store = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_open_backing_store = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -242372745779538155, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_open_backing_store, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i64)* @jpeg_open_backing_store to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_open_backing_store to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_read_backing_store = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_read_backing_store = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_read_backing_store = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5340980766429193364, i64 562986449946049, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_backing_store, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* @read_backing_store to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_read_backing_store to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_backing_store = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_write_backing_store = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_write_backing_store = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3096494529907331664, i64 562986449946049, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_backing_store, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* @write_backing_store to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_write_backing_store to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_close_backing_store = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_close_backing_store = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7546507289963868333, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_close_backing_store, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)* @close_backing_store to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_mem_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_mem_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1505324007382027789, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_init, i32 0, i32 0), i8* bitcast (i64 (%struct.jpeg_common_struct*)* @jpeg_mem_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_mem_term = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_mem_term = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 481761321795278727, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_term, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @jpeg_mem_term to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [218 x i8] c"\D7\01\00jpeg_get_small\01jpeg_free_small\01jpeg_get_large\01jpeg_free_large\01jpeg_mem_available\01jpeg_open_backing_store\01tmp1.ll:read_backing_store\01tmp1.ll:write_backing_store\01tmp1.ll:close_backing_store\01jpeg_mem_init\01jpeg_mem_term", section "__llvm_prf_names"
@llvm.used = appending global [13 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_get_small to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_free_small to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_get_large to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_free_large to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_mem_available to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_open_backing_store to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_backing_store to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_backing_store to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_close_backing_store to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_mem_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_mem_term to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([218 x i8], [218 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i8* @jpeg_get_small(%struct.jpeg_common_struct*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_get_small, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_get_small, i64 0, i64 0)
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = call noalias i8* @malloc(i64 %6) #3
  ret i8* %7
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define void @jpeg_free_small(%struct.jpeg_common_struct*, i8*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_free_small, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_free_small, i64 0, i64 0)
  %5 = alloca %struct.jpeg_common_struct*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load i8*, i8** %6, align 8
  call void @free(i8* %8) #3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @jpeg_get_large(%struct.jpeg_common_struct*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_get_large, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_get_large, i64 0, i64 0)
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = call noalias i8* @malloc(i64 %6) #3
  ret i8* %7
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_free_large(%struct.jpeg_common_struct*, i8*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_free_large, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_free_large, i64 0, i64 0)
  %5 = alloca %struct.jpeg_common_struct*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load i8*, i8** %6, align 8
  call void @free(i8* %8) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i64 @jpeg_mem_available(%struct.jpeg_common_struct*, i64, i64, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_available, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_available, i64 0, i64 0)
  %6 = alloca %struct.jpeg_common_struct*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %6, align 8
  store i64 %1, i64* %7, align 8
  store i64 %2, i64* %8, align 8
  store i64 %3, i64* %9, align 8
  %10 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %10, i32 0, i32 1
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i32 0, i32 11
  %14 = load i64, i64* %13, align 8
  %15 = load i64, i64* %9, align 8
  %16 = sub nsw i64 %14, %15
  ret i64 %16
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_open_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct*, i64) #0 {
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca %struct.backing_store_struct*, align 8
  %6 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store %struct.backing_store_struct* %1, %struct.backing_store_struct** %5, align 8
  store i64 %2, i64* %6, align 8
  %7 = call %struct._IO_FILE* @tmpfile()
  %8 = load %struct.backing_store_struct*, %struct.backing_store_struct** %5, align 8
  %9 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %8, i32 0, i32 3
  store %struct._IO_FILE* %7, %struct._IO_FILE** %9, align 8
  %10 = icmp eq %struct._IO_FILE* %7, null
  br i1 %10, label %11, label %31

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_open_backing_store, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_open_backing_store, i64 0, i64 1)
  %13 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %14 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %13, i32 0, i32 0
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i32 0, i32 5
  store i32 62, i32* %16, align 8
  %17 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %18 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %17, i32 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i32 0, i32 6
  %21 = bitcast %union.anon* %20 to [80 x i8]*
  %22 = getelementptr inbounds [80 x i8], [80 x i8]* %21, i32 0, i32 0
  %23 = call i8* @strncpy(i8* %22, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0), i64 80) #3
  %24 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %25 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %24, i32 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 0
  %28 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %27, align 8
  %29 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %30 = ptrtoint void (%struct.jpeg_common_struct*)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %30, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_open_backing_store to i8*), i32 0)
  call void %28(%struct.jpeg_common_struct* %29)
  br label %31

; <label>:31:                                     ; preds = %11, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_open_backing_store, i64 0, i64 0)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_open_backing_store, i64 0, i64 0)
  %33 = load %struct.backing_store_struct*, %struct.backing_store_struct** %5, align 8
  %34 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %33, i32 0, i32 0
  store void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* @read_backing_store, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %34, align 8
  %35 = load %struct.backing_store_struct*, %struct.backing_store_struct** %5, align 8
  %36 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %35, i32 0, i32 1
  store void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* @write_backing_store, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %36, align 8
  %37 = load %struct.backing_store_struct*, %struct.backing_store_struct** %5, align 8
  %38 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %37, i32 0, i32 2
  store void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)* @close_backing_store, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)** %38, align 8
  ret void
}

declare %struct._IO_FILE* @tmpfile() #2

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal void @read_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64) #0 {
  %6 = alloca %struct.jpeg_common_struct*, align 8
  %7 = alloca %struct.backing_store_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %6, align 8
  store %struct.backing_store_struct* %1, %struct.backing_store_struct** %7, align 8
  store i8* %2, i8** %8, align 8
  store i64 %3, i64* %9, align 8
  store i64 %4, i64* %10, align 8
  %11 = load %struct.backing_store_struct*, %struct.backing_store_struct** %7, align 8
  %12 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %11, i32 0, i32 3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = load i64, i64* %9, align 8
  %15 = call i32 @fseek(%struct._IO_FILE* %13, i64 %14, i32 0)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %30

; <label>:17:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_backing_store, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_backing_store, i64 0, i64 1)
  %19 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %20 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 5
  store i32 64, i32* %22, align 8
  %23 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %24 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 0
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %26, align 8
  %28 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %29 = ptrtoint void (%struct.jpeg_common_struct*)* %27 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_backing_store to i8*), i32 0)
  call void %27(%struct.jpeg_common_struct* %28)
  br label %30

; <label>:30:                                     ; preds = %17, %5
  %31 = load i8*, i8** %8, align 8
  %32 = load i64, i64* %10, align 8
  %33 = load %struct.backing_store_struct*, %struct.backing_store_struct** %7, align 8
  %34 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %33, i32 0, i32 3
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %34, align 8
  %36 = call i64 @fread(i8* %31, i64 1, i64 %32, %struct._IO_FILE* %35)
  %37 = load i64, i64* %10, align 8
  %38 = icmp ne i64 %36, %37
  br i1 %38, label %39, label %52

; <label>:39:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_backing_store, i64 0, i64 2)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_backing_store, i64 0, i64 2)
  %41 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %42 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 5
  store i32 63, i32* %44, align 8
  %45 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %46 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %45, i32 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i32 0, i32 0
  %49 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %48, align 8
  %50 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %51 = ptrtoint void (%struct.jpeg_common_struct*)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %51, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_read_backing_store to i8*), i32 1)
  call void %49(%struct.jpeg_common_struct* %50)
  br label %52

; <label>:52:                                     ; preds = %39, %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_backing_store, i64 0, i64 0)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_read_backing_store, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64) #0 {
  %6 = alloca %struct.jpeg_common_struct*, align 8
  %7 = alloca %struct.backing_store_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %6, align 8
  store %struct.backing_store_struct* %1, %struct.backing_store_struct** %7, align 8
  store i8* %2, i8** %8, align 8
  store i64 %3, i64* %9, align 8
  store i64 %4, i64* %10, align 8
  %11 = load %struct.backing_store_struct*, %struct.backing_store_struct** %7, align 8
  %12 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %11, i32 0, i32 3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = load i64, i64* %9, align 8
  %15 = call i32 @fseek(%struct._IO_FILE* %13, i64 %14, i32 0)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %30

; <label>:17:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_backing_store, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_backing_store, i64 0, i64 1)
  %19 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %20 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 5
  store i32 64, i32* %22, align 8
  %23 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %24 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 0
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %26, align 8
  %28 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %29 = ptrtoint void (%struct.jpeg_common_struct*)* %27 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_backing_store to i8*), i32 0)
  call void %27(%struct.jpeg_common_struct* %28)
  br label %30

; <label>:30:                                     ; preds = %17, %5
  %31 = load i8*, i8** %8, align 8
  %32 = load i64, i64* %10, align 8
  %33 = load %struct.backing_store_struct*, %struct.backing_store_struct** %7, align 8
  %34 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %33, i32 0, i32 3
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %34, align 8
  %36 = call i64 @fwrite(i8* %31, i64 1, i64 %32, %struct._IO_FILE* %35)
  %37 = load i64, i64* %10, align 8
  %38 = icmp ne i64 %36, %37
  br i1 %38, label %39, label %52

; <label>:39:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_backing_store, i64 0, i64 2)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_backing_store, i64 0, i64 2)
  %41 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %42 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 5
  store i32 65, i32* %44, align 8
  %45 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %46 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %45, i32 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i32 0, i32 0
  %49 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %48, align 8
  %50 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %51 = ptrtoint void (%struct.jpeg_common_struct*)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %51, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_backing_store to i8*), i32 1)
  call void %49(%struct.jpeg_common_struct* %50)
  br label %52

; <label>:52:                                     ; preds = %39, %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_backing_store, i64 0, i64 0)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_backing_store, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @close_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_close_backing_store, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_close_backing_store, i64 0, i64 0)
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca %struct.backing_store_struct*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store %struct.backing_store_struct* %1, %struct.backing_store_struct** %5, align 8
  %6 = load %struct.backing_store_struct*, %struct.backing_store_struct** %5, align 8
  %7 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %6, i32 0, i32 3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %9 = call i32 @fclose(%struct._IO_FILE* %8)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i64 @jpeg_mem_init(%struct.jpeg_common_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_init, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_init, i64 0, i64 0)
  %3 = alloca %struct.jpeg_common_struct*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  ret i64 1000000
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_mem_term(%struct.jpeg_common_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_term, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_mem_term, i64 0, i64 0)
  %3 = alloca %struct.jpeg_common_struct*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  ret void
}

declare i32 @fseek(%struct._IO_FILE*, i64, i32) #2

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
