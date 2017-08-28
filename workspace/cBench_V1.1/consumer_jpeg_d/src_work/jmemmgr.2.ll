; ModuleID = 'tmp1.ll'
source_filename = "jmemmgr.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%struct.jpeg_error_mgr = type { {}*, void (%struct.jpeg_common_struct*, i32)*, {}*, void (%struct.jpeg_common_struct*, i8*)*, {}*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type { i8**, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.jvirt_sarray_control*, %struct.backing_store_struct }
%struct.backing_store_struct = type { void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, %struct._IO_FILE*, [64 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.jvirt_barray_control = type { [64 x i16]**, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.jvirt_barray_control*, %struct.backing_store_struct }
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.my_memory_mgr = type { %struct.jpeg_memory_mgr, [2 x %union.small_pool_struct*], [2 x %union.large_pool_struct*], %struct.jvirt_sarray_control*, %struct.jvirt_barray_control*, i64, i32 }
%union.small_pool_struct = type { %struct.anon }
%struct.anon = type { %union.small_pool_struct*, i64, i64 }
%union.large_pool_struct = type { %struct.anon.0 }
%struct.anon.0 = type { %union.large_pool_struct*, i64, i64 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [8 x i8] c"JPEGMEM\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%ld%c\00", align 1
@first_pool_slop = internal constant [2 x i64] [i64 1600, i64 16000], align 16
@extra_pool_slop = internal constant [2 x i64] [i64 0, i64 5000], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_memory_mgr = private constant [16 x i8] c"jinit_memory_mgr"
@__profn_tmp1.ll_alloc_small = private constant [19 x i8] c"tmp1.ll:alloc_small"
@__profn_tmp1.ll_alloc_large = private constant [19 x i8] c"tmp1.ll:alloc_large"
@__profn_tmp1.ll_alloc_sarray = private constant [20 x i8] c"tmp1.ll:alloc_sarray"
@__profn_tmp1.ll_alloc_barray = private constant [20 x i8] c"tmp1.ll:alloc_barray"
@__profn_tmp1.ll_request_virt_sarray = private constant [27 x i8] c"tmp1.ll:request_virt_sarray"
@__profn_tmp1.ll_request_virt_barray = private constant [27 x i8] c"tmp1.ll:request_virt_barray"
@__profn_tmp1.ll_realize_virt_arrays = private constant [27 x i8] c"tmp1.ll:realize_virt_arrays"
@__profn_tmp1.ll_access_virt_sarray = private constant [26 x i8] c"tmp1.ll:access_virt_sarray"
@__profn_tmp1.ll_access_virt_barray = private constant [26 x i8] c"tmp1.ll:access_virt_barray"
@__profn_tmp1.ll_free_pool = private constant [17 x i8] c"tmp1.ll:free_pool"
@__profn_tmp1.ll_self_destruct = private constant [21 x i8] c"tmp1.ll:self_destruct"
@__profn_tmp1.ll_out_of_memory = private constant [21 x i8] c"tmp1.ll:out_of_memory"
@__profn_tmp1.ll_do_sarray_io = private constant [20 x i8] c"tmp1.ll:do_sarray_io"
@__profn_tmp1.ll_do_barray_io = private constant [20 x i8] c"tmp1.ll:do_barray_io"
@__profc_jinit_memory_mgr = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_memory_mgr = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_memory_mgr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2418096502473085914, i64 563056935656969, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @jinit_memory_mgr to i8*), i8* bitcast ([2 x i64]* @__profvp_jinit_memory_mgr to i8*), i32 8, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_alloc_small = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_alloc_small = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_alloc_small = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6937980898740366943, i64 281658823991160, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i32 0, i32 0), i8* bitcast (i8* (%struct.jpeg_common_struct*, i32, i64)* @alloc_small to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_alloc_small to i8*), i32 13, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_alloc_large = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_alloc_large = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_alloc_large = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1552669511423296090, i64 281547483171205, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i32 0, i32 0), i8* bitcast (i8* (%struct.jpeg_common_struct*, i32, i64)* @alloc_large to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_alloc_large to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_alloc_sarray = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_alloc_sarray = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_alloc_sarray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8871650824520045480, i64 281572210269672, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i32 0, i32 0), i8* bitcast (i8** (%struct.jpeg_common_struct*, i32, i32, i32)* @alloc_sarray to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_alloc_sarray to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_alloc_barray = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_alloc_barray = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_alloc_barray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -80731889031409167, i64 281572210269672, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i32 0, i32 0), i8* bitcast ([64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)* @alloc_barray to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_alloc_barray to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_request_virt_sarray = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_request_virt_sarray = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_request_virt_sarray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1889481822322802067, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_sarray, i32 0, i32 0), i8* bitcast (%struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* @request_virt_sarray to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_request_virt_sarray to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_request_virt_barray = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_request_virt_barray = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_request_virt_barray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3600292128061610290, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_barray, i32 0, i32 0), i8* bitcast (%struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* @request_virt_barray to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_request_virt_barray to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_realize_virt_arrays = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_realize_virt_arrays = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3756427109436334190, i64 224290899816, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @realize_virt_arrays to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_access_virt_sarray = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_access_virt_sarray = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_access_virt_sarray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5851652073840487254, i64 1126134320686665, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i32 0, i32 0), i8* bitcast (i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* @access_virt_sarray to i8*), i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_access_virt_sarray to i8*), i32 18, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_access_virt_barray = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_access_virt_barray = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_access_virt_barray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2089611565210623717, i64 1126134320686665, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i32 0, i32 0), i8* bitcast ([64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* @access_virt_barray to i8*), i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_access_virt_barray to i8*), i32 18, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_free_pool = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_free_pool = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_free_pool = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7905381304004803010, i64 844571508725366, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*, i32)* @free_pool to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_free_pool to i8*), i32 10, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_self_destruct = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_self_destruct = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8517548566067555916, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_self_destruct, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_common_struct*)* @self_destruct to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_out_of_memory = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_out_of_memory = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_out_of_memory = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4001169229240112202, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_out_of_memory, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_out_of_memory to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_do_sarray_io = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_do_sarray_io = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_do_sarray_io = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7724224049170172749, i64 563063084734001, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_do_sarray_io to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_do_barray_io = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_do_barray_io = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_do_barray_io = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1393040486455402022, i64 563063084734001, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_do_barray_io to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [24 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [343 x i8] c"\D4\02\00jinit_memory_mgr\01tmp1.ll:alloc_small\01tmp1.ll:alloc_large\01tmp1.ll:alloc_sarray\01tmp1.ll:alloc_barray\01tmp1.ll:request_virt_sarray\01tmp1.ll:request_virt_barray\01tmp1.ll:realize_virt_arrays\01tmp1.ll:access_virt_sarray\01tmp1.ll:access_virt_barray\01tmp1.ll:free_pool\01tmp1.ll:self_destruct\01tmp1.ll:out_of_memory\01tmp1.ll:do_sarray_io\01tmp1.ll:do_barray_io", section "__llvm_prf_names"
@llvm.used = appending global [17 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_memory_mgr to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_small to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_large to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_sarray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_barray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_request_virt_sarray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_request_virt_barray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_realize_virt_arrays to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_sarray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_barray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_free_pool to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_self_destruct to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_out_of_memory to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_sarray_io to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_barray_io to i8*), i8* bitcast ([24 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([343 x i8], [343 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_memory_mgr(%struct.jpeg_common_struct*) #0 {
  %2 = alloca %struct.jpeg_common_struct*, align 8
  %3 = alloca %struct.my_memory_mgr*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8, align 1
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %2, align 8
  %9 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %9, i32 0, i32 1
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %10, align 8
  store i64 1000000000, i64* %6, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ne i64 %11, 1000000000
  br i1 %12, label %13, label %27

; <label>:13:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 3)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 3)
  %15 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 3, i32* %18, align 8
  %19 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 0
  %23 = bitcast {}** %22 to void (%struct.jpeg_common_struct*)**
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %26 = ptrtoint void (%struct.jpeg_common_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %26, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_memory_mgr to i8*), i32 0)
  call void %24(%struct.jpeg_common_struct* %25)
  br label %27

; <label>:27:                                     ; preds = %13, %1
  %28 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %29 = call i64 @jpeg_mem_init(%struct.jpeg_common_struct* %28)
  store i64 %29, i64* %4, align 8
  %30 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %31 = call i8* @jpeg_get_small(%struct.jpeg_common_struct* %30, i64 160)
  %32 = bitcast i8* %31 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %32, %struct.my_memory_mgr** %3, align 8
  %33 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %34 = icmp eq %struct.my_memory_mgr* %33, null
  br i1 %34, label %35, label %56

; <label>:35:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 4)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 4)
  %37 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  call void @jpeg_mem_term(%struct.jpeg_common_struct* %37)
  %38 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 5
  store i32 53, i32* %41, align 8
  %42 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %43 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %42, i32 0, i32 0
  %44 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %44, i32 0, i32 6
  %46 = bitcast %union.anon* %45 to [8 x i32]*
  %47 = getelementptr inbounds [8 x i32], [8 x i32]* %46, i64 0, i64 0
  store i32 0, i32* %47, align 4
  %48 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %49 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %48, i32 0, i32 0
  %50 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %50, i32 0, i32 0
  %52 = bitcast {}** %51 to void (%struct.jpeg_common_struct*)**
  %53 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %52, align 8
  %54 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %55 = ptrtoint void (%struct.jpeg_common_struct*)* %53 to i64
  call void @__llvm_profile_instrument_target(i64 %55, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_memory_mgr to i8*), i32 1)
  call void %53(%struct.jpeg_common_struct* %54)
  br label %56

; <label>:56:                                     ; preds = %35, %27
  %57 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %58 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %57, i32 0, i32 0
  %59 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %58, i32 0, i32 0
  store i8* (%struct.jpeg_common_struct*, i32, i64)* @alloc_small, i8* (%struct.jpeg_common_struct*, i32, i64)** %59, align 8
  %60 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %61 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %60, i32 0, i32 0
  %62 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %61, i32 0, i32 1
  store i8* (%struct.jpeg_common_struct*, i32, i64)* @alloc_large, i8* (%struct.jpeg_common_struct*, i32, i64)** %62, align 8
  %63 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %64 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %63, i32 0, i32 0
  %65 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %64, i32 0, i32 2
  store i8** (%struct.jpeg_common_struct*, i32, i32, i32)* @alloc_sarray, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %65, align 8
  %66 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %67 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %66, i32 0, i32 0
  %68 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %67, i32 0, i32 3
  store [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)* @alloc_barray, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)** %68, align 8
  %69 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %70 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %69, i32 0, i32 0
  %71 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %70, i32 0, i32 4
  store %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* @request_virt_sarray, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %71, align 8
  %72 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %73 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %72, i32 0, i32 0
  %74 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %73, i32 0, i32 5
  store %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* @request_virt_barray, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %74, align 8
  %75 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %76 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %75, i32 0, i32 0
  %77 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %76, i32 0, i32 6
  %78 = bitcast {}** %77 to void (%struct.jpeg_common_struct*)**
  store void (%struct.jpeg_common_struct*)* @realize_virt_arrays, void (%struct.jpeg_common_struct*)** %78, align 8
  %79 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %80 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %79, i32 0, i32 0
  %81 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %80, i32 0, i32 7
  store i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* @access_virt_sarray, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %81, align 8
  %82 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %83 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %82, i32 0, i32 0
  %84 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %83, i32 0, i32 8
  store [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* @access_virt_barray, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %84, align 8
  %85 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %86 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %85, i32 0, i32 0
  %87 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %86, i32 0, i32 9
  store void (%struct.jpeg_common_struct*, i32)* @free_pool, void (%struct.jpeg_common_struct*, i32)** %87, align 8
  %88 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %89 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %88, i32 0, i32 0
  %90 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %89, i32 0, i32 10
  %91 = bitcast {}** %90 to void (%struct.jpeg_common_struct*)**
  store void (%struct.jpeg_common_struct*)* @self_destruct, void (%struct.jpeg_common_struct*)** %91, align 8
  %92 = load i64, i64* %4, align 8
  %93 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %94 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %93, i32 0, i32 0
  %95 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %94, i32 0, i32 11
  store i64 %92, i64* %95, align 8
  store i32 1, i32* %5, align 4
  br label %96

; <label>:96:                                     ; preds = %110, %56
  %97 = load i32, i32* %5, align 4
  %98 = icmp sge i32 %97, 0
  br i1 %98, label %99, label %114

; <label>:99:                                     ; preds = %96
  %100 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %101 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %100, i32 0, i32 1
  %102 = load i32, i32* %5, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [2 x %union.small_pool_struct*], [2 x %union.small_pool_struct*]* %101, i64 0, i64 %103
  store %union.small_pool_struct* null, %union.small_pool_struct** %104, align 8
  %105 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %106 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %105, i32 0, i32 2
  %107 = load i32, i32* %5, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [2 x %union.large_pool_struct*], [2 x %union.large_pool_struct*]* %106, i64 0, i64 %108
  store %union.large_pool_struct* null, %union.large_pool_struct** %109, align 8
  br label %110

; <label>:110:                                    ; preds = %99
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 0)
  %111 = add i64 %pgocount2, 1
  store i64 %111, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 0)
  %112 = load i32, i32* %5, align 4
  %113 = add nsw i32 %112, -1
  store i32 %113, i32* %5, align 4
  br label %96

; <label>:114:                                    ; preds = %96
  %115 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %116 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %115, i32 0, i32 3
  store %struct.jvirt_sarray_control* null, %struct.jvirt_sarray_control** %116, align 8
  %117 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %118 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %117, i32 0, i32 4
  store %struct.jvirt_barray_control* null, %struct.jvirt_barray_control** %118, align 8
  %119 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %120 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %119, i32 0, i32 5
  store i64 160, i64* %120, align 8
  %121 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %122 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %121, i32 0, i32 0
  %123 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %124 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %123, i32 0, i32 1
  store %struct.jpeg_memory_mgr* %122, %struct.jpeg_memory_mgr** %124, align 8
  %125 = call i8* @getenv(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0)) #3
  store i8* %125, i8** %7, align 8
  %126 = icmp ne i8* %125, null
  br i1 %126, label %127, label %153

; <label>:127:                                    ; preds = %114
  store i8 120, i8* %8, align 1
  %128 = load i8*, i8** %7, align 8
  %129 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %128, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i64* %4, i8* %8) #3
  %130 = icmp sgt i32 %129, 0
  br i1 %130, label %131, label %151

; <label>:131:                                    ; preds = %127
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 5)
  %132 = add i64 %pgocount3, 1
  store i64 %132, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 5)
  %133 = load i8, i8* %8, align 1
  %134 = sext i8 %133 to i32
  %135 = icmp eq i32 %134, 109
  br i1 %135, label %141, label %136

; <label>:136:                                    ; preds = %131
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 7)
  %137 = add i64 %pgocount4, 1
  store i64 %137, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 7)
  %138 = load i8, i8* %8, align 1
  %139 = sext i8 %138 to i32
  %140 = icmp eq i32 %139, 77
  br i1 %140, label %141, label %145

; <label>:141:                                    ; preds = %136, %131
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 6)
  %142 = add i64 %pgocount5, 1
  store i64 %142, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 6)
  %143 = load i64, i64* %4, align 8
  %144 = mul nsw i64 %143, 1000
  store i64 %144, i64* %4, align 8
  br label %145

; <label>:145:                                    ; preds = %141, %136
  %146 = load i64, i64* %4, align 8
  %147 = mul nsw i64 %146, 1000
  %148 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %149 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %148, i32 0, i32 0
  %150 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %149, i32 0, i32 11
  store i64 %147, i64* %150, align 8
  br label %151

; <label>:151:                                    ; preds = %145, %127
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 2)
  %152 = add i64 %pgocount6, 1
  store i64 %152, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 2)
  br label %153

; <label>:153:                                    ; preds = %151, %114
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 1)
  %154 = add i64 %pgocount7, 1
  store i64 %154, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jinit_memory_mgr, i64 0, i64 1)
  ret void
}

declare i64 @jpeg_mem_init(%struct.jpeg_common_struct*) #1

declare i8* @jpeg_get_small(%struct.jpeg_common_struct*, i64) #1

declare void @jpeg_mem_term(%struct.jpeg_common_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @alloc_small(%struct.jpeg_common_struct*, i32, i64) #0 {
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca %struct.my_memory_mgr*, align 8
  %8 = alloca %union.small_pool_struct*, align 8
  %9 = alloca %union.small_pool_struct*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i64 %2, i64* %6, align 8
  %14 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %15 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %14, i32 0, i32 1
  %16 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %15, align 8
  %17 = bitcast %struct.jpeg_memory_mgr* %16 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %17, %struct.my_memory_mgr** %7, align 8
  %18 = load i64, i64* %6, align 8
  %19 = icmp ugt i64 %18, 999999976
  br i1 %19, label %20, label %23

; <label>:20:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 6)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 6)
  %22 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  call void @out_of_memory(%struct.jpeg_common_struct* %22, i32 1)
  br label %23

; <label>:23:                                     ; preds = %20, %3
  %24 = load i64, i64* %6, align 8
  %25 = urem i64 %24, 8
  store i64 %25, i64* %11, align 8
  %26 = load i64, i64* %11, align 8
  %27 = icmp ugt i64 %26, 0
  br i1 %27, label %28, label %34

; <label>:28:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 7)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 7)
  %30 = load i64, i64* %11, align 8
  %31 = sub i64 8, %30
  %32 = load i64, i64* %6, align 8
  %33 = add i64 %32, %31
  store i64 %33, i64* %6, align 8
  br label %34

; <label>:34:                                     ; preds = %28, %23
  %35 = load i32, i32* %5, align 4
  %36 = icmp slt i32 %35, 0
  br i1 %36, label %41, label %37

; <label>:37:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 5)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 5)
  %39 = load i32, i32* %5, align 4
  %40 = icmp sge i32 %39, 2
  br i1 %40, label %41, label %62

; <label>:41:                                     ; preds = %37, %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 4)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 4)
  %43 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %44 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %43, i32 0, i32 0
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i32 0, i32 5
  store i32 12, i32* %46, align 8
  %47 = load i32, i32* %5, align 4
  %48 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %49 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %48, i32 0, i32 0
  %50 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %50, i32 0, i32 6
  %52 = bitcast %union.anon* %51 to [8 x i32]*
  %53 = getelementptr inbounds [8 x i32], [8 x i32]* %52, i64 0, i64 0
  store i32 %47, i32* %53, align 4
  %54 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %55 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %54, i32 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i32 0, i32 0
  %58 = bitcast {}** %57 to void (%struct.jpeg_common_struct*)**
  %59 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %58, align 8
  %60 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %61 = ptrtoint void (%struct.jpeg_common_struct*)* %59 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_small to i8*), i32 0)
  call void %59(%struct.jpeg_common_struct* %60)
  br label %62

; <label>:62:                                     ; preds = %41, %37
  store %union.small_pool_struct* null, %union.small_pool_struct** %9, align 8
  %63 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %7, align 8
  %64 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %63, i32 0, i32 1
  %65 = load i32, i32* %5, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [2 x %union.small_pool_struct*], [2 x %union.small_pool_struct*]* %64, i64 0, i64 %66
  %68 = load %union.small_pool_struct*, %union.small_pool_struct** %67, align 8
  store %union.small_pool_struct* %68, %union.small_pool_struct** %8, align 8
  br label %69

; <label>:69:                                     ; preds = %81, %62
  %70 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %71 = icmp ne %union.small_pool_struct* %70, null
  br i1 %71, label %72, label %88

; <label>:72:                                     ; preds = %69
  %73 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %74 = bitcast %union.small_pool_struct* %73 to %struct.anon*
  %75 = getelementptr inbounds %struct.anon, %struct.anon* %74, i32 0, i32 2
  %76 = load i64, i64* %75, align 8
  %77 = load i64, i64* %6, align 8
  %78 = icmp uge i64 %76, %77
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %72
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 8)
  %80 = add i64 %pgocount4, 1
  store i64 %80, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 8)
  br label %88

; <label>:81:                                     ; preds = %72
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 0)
  %82 = add i64 %pgocount5, 1
  store i64 %82, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 0)
  %83 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  store %union.small_pool_struct* %83, %union.small_pool_struct** %9, align 8
  %84 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %85 = bitcast %union.small_pool_struct* %84 to %struct.anon*
  %86 = getelementptr inbounds %struct.anon, %struct.anon* %85, i32 0, i32 0
  %87 = load %union.small_pool_struct*, %union.small_pool_struct** %86, align 8
  store %union.small_pool_struct* %87, %union.small_pool_struct** %8, align 8
  br label %69

; <label>:88:                                     ; preds = %79, %69
  %89 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %90 = icmp eq %union.small_pool_struct* %89, null
  br i1 %90, label %91, label %174

; <label>:91:                                     ; preds = %88
  %92 = load i64, i64* %6, align 8
  %93 = add i64 %92, 24
  store i64 %93, i64* %12, align 8
  %94 = load %union.small_pool_struct*, %union.small_pool_struct** %9, align 8
  %95 = icmp eq %union.small_pool_struct* %94, null
  br i1 %95, label %96, label %102

; <label>:96:                                     ; preds = %91
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 11)
  %97 = add i64 %pgocount6, 1
  store i64 %97, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 11)
  %98 = load i32, i32* %5, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [2 x i64], [2 x i64]* @first_pool_slop, i64 0, i64 %99
  %101 = load i64, i64* %100, align 8
  store i64 %101, i64* %13, align 8
  br label %107

; <label>:102:                                    ; preds = %91
  %103 = load i32, i32* %5, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [2 x i64], [2 x i64]* @extra_pool_slop, i64 0, i64 %104
  %106 = load i64, i64* %105, align 8
  store i64 %106, i64* %13, align 8
  br label %107

; <label>:107:                                    ; preds = %102, %96
  %108 = load i64, i64* %13, align 8
  %109 = load i64, i64* %12, align 8
  %110 = sub i64 1000000000, %109
  %111 = icmp ugt i64 %108, %110
  br i1 %111, label %112, label %116

; <label>:112:                                    ; preds = %107
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 10)
  %113 = add i64 %pgocount7, 1
  store i64 %113, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 10)
  %114 = load i64, i64* %12, align 8
  %115 = sub i64 1000000000, %114
  store i64 %115, i64* %13, align 8
  br label %116

; <label>:116:                                    ; preds = %112, %107
  br label %117

; <label>:117:                                    ; preds = %136, %116
  %118 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %119 = load i64, i64* %12, align 8
  %120 = load i64, i64* %13, align 8
  %121 = add i64 %119, %120
  %122 = call i8* @jpeg_get_small(%struct.jpeg_common_struct* %118, i64 %121)
  %123 = bitcast i8* %122 to %union.small_pool_struct*
  store %union.small_pool_struct* %123, %union.small_pool_struct** %8, align 8
  %124 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %125 = icmp ne %union.small_pool_struct* %124, null
  br i1 %125, label %126, label %127

; <label>:126:                                    ; preds = %117
  br label %137

; <label>:127:                                    ; preds = %117
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 1)
  %128 = add i64 %pgocount8, 1
  store i64 %128, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 1)
  %129 = load i64, i64* %13, align 8
  %130 = udiv i64 %129, 2
  store i64 %130, i64* %13, align 8
  %131 = load i64, i64* %13, align 8
  %132 = icmp ult i64 %131, 50
  br i1 %132, label %133, label %136

; <label>:133:                                    ; preds = %127
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 2)
  %134 = add i64 %pgocount9, 1
  store i64 %134, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 2)
  %135 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  call void @out_of_memory(%struct.jpeg_common_struct* %135, i32 2)
  br label %136

; <label>:136:                                    ; preds = %133, %127
  br label %117

; <label>:137:                                    ; preds = %126
  %138 = load i64, i64* %12, align 8
  %139 = load i64, i64* %13, align 8
  %140 = add i64 %138, %139
  %141 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %7, align 8
  %142 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %141, i32 0, i32 5
  %143 = load i64, i64* %142, align 8
  %144 = add i64 %143, %140
  store i64 %144, i64* %142, align 8
  %145 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %146 = bitcast %union.small_pool_struct* %145 to %struct.anon*
  %147 = getelementptr inbounds %struct.anon, %struct.anon* %146, i32 0, i32 0
  store %union.small_pool_struct* null, %union.small_pool_struct** %147, align 8
  %148 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %149 = bitcast %union.small_pool_struct* %148 to %struct.anon*
  %150 = getelementptr inbounds %struct.anon, %struct.anon* %149, i32 0, i32 1
  store i64 0, i64* %150, align 8
  %151 = load i64, i64* %6, align 8
  %152 = load i64, i64* %13, align 8
  %153 = add i64 %151, %152
  %154 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %155 = bitcast %union.small_pool_struct* %154 to %struct.anon*
  %156 = getelementptr inbounds %struct.anon, %struct.anon* %155, i32 0, i32 2
  store i64 %153, i64* %156, align 8
  %157 = load %union.small_pool_struct*, %union.small_pool_struct** %9, align 8
  %158 = icmp eq %union.small_pool_struct* %157, null
  br i1 %158, label %159, label %167

; <label>:159:                                    ; preds = %137
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 12)
  %160 = add i64 %pgocount10, 1
  store i64 %160, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 12)
  %161 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %162 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %7, align 8
  %163 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %162, i32 0, i32 1
  %164 = load i32, i32* %5, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [2 x %union.small_pool_struct*], [2 x %union.small_pool_struct*]* %163, i64 0, i64 %165
  store %union.small_pool_struct* %161, %union.small_pool_struct** %166, align 8
  br label %173

; <label>:167:                                    ; preds = %137
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 9)
  %168 = add i64 %pgocount11, 1
  store i64 %168, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 9)
  %169 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %170 = load %union.small_pool_struct*, %union.small_pool_struct** %9, align 8
  %171 = bitcast %union.small_pool_struct* %170 to %struct.anon*
  %172 = getelementptr inbounds %struct.anon, %struct.anon* %171, i32 0, i32 0
  store %union.small_pool_struct* %169, %union.small_pool_struct** %172, align 8
  br label %173

; <label>:173:                                    ; preds = %167, %159
  br label %174

; <label>:174:                                    ; preds = %173, %88
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 3)
  %175 = add i64 %pgocount12, 1
  store i64 %175, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_alloc_small, i64 0, i64 3)
  %176 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %177 = getelementptr inbounds %union.small_pool_struct, %union.small_pool_struct* %176, i64 1
  %178 = bitcast %union.small_pool_struct* %177 to i8*
  store i8* %178, i8** %10, align 8
  %179 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %180 = bitcast %union.small_pool_struct* %179 to %struct.anon*
  %181 = getelementptr inbounds %struct.anon, %struct.anon* %180, i32 0, i32 1
  %182 = load i64, i64* %181, align 8
  %183 = load i8*, i8** %10, align 8
  %184 = getelementptr inbounds i8, i8* %183, i64 %182
  store i8* %184, i8** %10, align 8
  %185 = load i64, i64* %6, align 8
  %186 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %187 = bitcast %union.small_pool_struct* %186 to %struct.anon*
  %188 = getelementptr inbounds %struct.anon, %struct.anon* %187, i32 0, i32 1
  %189 = load i64, i64* %188, align 8
  %190 = add i64 %189, %185
  store i64 %190, i64* %188, align 8
  %191 = load i64, i64* %6, align 8
  %192 = load %union.small_pool_struct*, %union.small_pool_struct** %8, align 8
  %193 = bitcast %union.small_pool_struct* %192 to %struct.anon*
  %194 = getelementptr inbounds %struct.anon, %struct.anon* %193, i32 0, i32 2
  %195 = load i64, i64* %194, align 8
  %196 = sub i64 %195, %191
  store i64 %196, i64* %194, align 8
  %197 = load i8*, i8** %10, align 8
  ret i8* %197
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @alloc_large(%struct.jpeg_common_struct*, i32, i64) #0 {
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca %struct.my_memory_mgr*, align 8
  %8 = alloca %union.large_pool_struct*, align 8
  %9 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i64 %2, i64* %6, align 8
  %10 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %11 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %10, i32 0, i32 1
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %11, align 8
  %13 = bitcast %struct.jpeg_memory_mgr* %12 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %13, %struct.my_memory_mgr** %7, align 8
  %14 = load i64, i64* %6, align 8
  %15 = icmp ugt i64 %14, 999999976
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 3)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 3)
  %18 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  call void @out_of_memory(%struct.jpeg_common_struct* %18, i32 3)
  br label %19

; <label>:19:                                     ; preds = %16, %3
  %20 = load i64, i64* %6, align 8
  %21 = urem i64 %20, 8
  store i64 %21, i64* %9, align 8
  %22 = load i64, i64* %9, align 8
  %23 = icmp ugt i64 %22, 0
  br i1 %23, label %24, label %30

; <label>:24:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 4)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 4)
  %26 = load i64, i64* %9, align 8
  %27 = sub i64 8, %26
  %28 = load i64, i64* %6, align 8
  %29 = add i64 %28, %27
  store i64 %29, i64* %6, align 8
  br label %30

; <label>:30:                                     ; preds = %24, %19
  %31 = load i32, i32* %5, align 4
  %32 = icmp slt i32 %31, 0
  br i1 %32, label %37, label %33

; <label>:33:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 2)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 2)
  %35 = load i32, i32* %5, align 4
  %36 = icmp sge i32 %35, 2
  br i1 %36, label %37, label %58

; <label>:37:                                     ; preds = %33, %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 1)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 1)
  %39 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %40 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %39, i32 0, i32 0
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i32 0, i32 5
  store i32 12, i32* %42, align 8
  %43 = load i32, i32* %5, align 4
  %44 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %45 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %44, i32 0, i32 0
  %46 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %46, i32 0, i32 6
  %48 = bitcast %union.anon* %47 to [8 x i32]*
  %49 = getelementptr inbounds [8 x i32], [8 x i32]* %48, i64 0, i64 0
  store i32 %43, i32* %49, align 4
  %50 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %51 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %50, i32 0, i32 0
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i32 0, i32 0
  %54 = bitcast {}** %53 to void (%struct.jpeg_common_struct*)**
  %55 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %54, align 8
  %56 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %57 = ptrtoint void (%struct.jpeg_common_struct*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_large to i8*), i32 0)
  call void %55(%struct.jpeg_common_struct* %56)
  br label %58

; <label>:58:                                     ; preds = %37, %33
  %59 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %60 = load i64, i64* %6, align 8
  %61 = add i64 %60, 24
  %62 = call i8* @jpeg_get_large(%struct.jpeg_common_struct* %59, i64 %61)
  %63 = bitcast i8* %62 to %union.large_pool_struct*
  store %union.large_pool_struct* %63, %union.large_pool_struct** %8, align 8
  %64 = load %union.large_pool_struct*, %union.large_pool_struct** %8, align 8
  %65 = icmp eq %union.large_pool_struct* %64, null
  br i1 %65, label %66, label %69

; <label>:66:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 5)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 5)
  %68 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  call void @out_of_memory(%struct.jpeg_common_struct* %68, i32 4)
  br label %69

; <label>:69:                                     ; preds = %66, %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 0)
  %70 = add i64 %pgocount5, 1
  store i64 %70, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_large, i64 0, i64 0)
  %71 = load i64, i64* %6, align 8
  %72 = add i64 %71, 24
  %73 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %7, align 8
  %74 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %73, i32 0, i32 5
  %75 = load i64, i64* %74, align 8
  %76 = add i64 %75, %72
  store i64 %76, i64* %74, align 8
  %77 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %7, align 8
  %78 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %77, i32 0, i32 2
  %79 = load i32, i32* %5, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [2 x %union.large_pool_struct*], [2 x %union.large_pool_struct*]* %78, i64 0, i64 %80
  %82 = load %union.large_pool_struct*, %union.large_pool_struct** %81, align 8
  %83 = load %union.large_pool_struct*, %union.large_pool_struct** %8, align 8
  %84 = bitcast %union.large_pool_struct* %83 to %struct.anon.0*
  %85 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %84, i32 0, i32 0
  store %union.large_pool_struct* %82, %union.large_pool_struct** %85, align 8
  %86 = load i64, i64* %6, align 8
  %87 = load %union.large_pool_struct*, %union.large_pool_struct** %8, align 8
  %88 = bitcast %union.large_pool_struct* %87 to %struct.anon.0*
  %89 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %88, i32 0, i32 1
  store i64 %86, i64* %89, align 8
  %90 = load %union.large_pool_struct*, %union.large_pool_struct** %8, align 8
  %91 = bitcast %union.large_pool_struct* %90 to %struct.anon.0*
  %92 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %91, i32 0, i32 2
  store i64 0, i64* %92, align 8
  %93 = load %union.large_pool_struct*, %union.large_pool_struct** %8, align 8
  %94 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %7, align 8
  %95 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %94, i32 0, i32 2
  %96 = load i32, i32* %5, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [2 x %union.large_pool_struct*], [2 x %union.large_pool_struct*]* %95, i64 0, i64 %97
  store %union.large_pool_struct* %93, %union.large_pool_struct** %98, align 8
  %99 = load %union.large_pool_struct*, %union.large_pool_struct** %8, align 8
  %100 = getelementptr inbounds %union.large_pool_struct, %union.large_pool_struct* %99, i64 1
  %101 = bitcast %union.large_pool_struct* %100 to i8*
  ret i8* %101
}

; Function Attrs: noinline nounwind uwtable
define internal i8** @alloc_sarray(%struct.jpeg_common_struct*, i32, i32, i32) #0 {
  %5 = alloca %struct.jpeg_common_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_memory_mgr*, align 8
  %10 = alloca i8**, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %16 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %17 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %16, i32 0, i32 1
  %18 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %17, align 8
  %19 = bitcast %struct.jpeg_memory_mgr* %18 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %19, %struct.my_memory_mgr** %9, align 8
  %20 = load i32, i32* %7, align 4
  %21 = zext i32 %20 to i64
  %22 = mul i64 %21, 1
  %23 = udiv i64 999999976, %22
  store i64 %23, i64* %15, align 8
  %24 = load i64, i64* %15, align 8
  %25 = icmp sle i64 %24, 0
  br i1 %25, label %26, label %40

; <label>:26:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 3)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 3)
  %28 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 5
  store i32 69, i32* %31, align 8
  %32 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %33 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 0
  %36 = bitcast {}** %35 to void (%struct.jpeg_common_struct*)**
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  %38 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %39 = ptrtoint void (%struct.jpeg_common_struct*)* %37 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_sarray to i8*), i32 0)
  call void %37(%struct.jpeg_common_struct* %38)
  br label %40

; <label>:40:                                     ; preds = %26, %4
  %41 = load i64, i64* %15, align 8
  %42 = load i32, i32* %8, align 4
  %43 = zext i32 %42 to i64
  %44 = icmp slt i64 %41, %43
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 4)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 4)
  %47 = load i64, i64* %15, align 8
  %48 = trunc i64 %47 to i32
  store i32 %48, i32* %12, align 4
  br label %52

; <label>:49:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 5)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 5)
  %51 = load i32, i32* %8, align 4
  store i32 %51, i32* %12, align 4
  br label %52

; <label>:52:                                     ; preds = %49, %45
  %53 = load i32, i32* %12, align 4
  %54 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %9, align 8
  %55 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %54, i32 0, i32 6
  store i32 %53, i32* %55, align 8
  %56 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %57 = load i32, i32* %6, align 4
  %58 = load i32, i32* %8, align 4
  %59 = zext i32 %58 to i64
  %60 = mul i64 %59, 8
  %61 = call i8* @alloc_small(%struct.jpeg_common_struct* %56, i32 %57, i64 %60)
  %62 = bitcast i8* %61 to i8**
  store i8** %62, i8*** %10, align 8
  store i32 0, i32* %13, align 4
  br label %63

; <label>:63:                                     ; preds = %111, %52
  %64 = load i32, i32* %13, align 4
  %65 = load i32, i32* %8, align 4
  %66 = icmp ult i32 %64, %65
  br i1 %66, label %67, label %112

; <label>:67:                                     ; preds = %63
  %68 = load i32, i32* %12, align 4
  %69 = load i32, i32* %8, align 4
  %70 = load i32, i32* %13, align 4
  %71 = sub i32 %69, %70
  %72 = icmp ult i32 %68, %71
  br i1 %72, label %73, label %76

; <label>:73:                                     ; preds = %67
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 1)
  %74 = add i64 %pgocount3, 1
  store i64 %74, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 1)
  %75 = load i32, i32* %12, align 4
  br label %81

; <label>:76:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 2)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 2)
  %78 = load i32, i32* %8, align 4
  %79 = load i32, i32* %13, align 4
  %80 = sub i32 %78, %79
  br label %81

; <label>:81:                                     ; preds = %76, %73
  %82 = phi i32 [ %75, %73 ], [ %80, %76 ]
  store i32 %82, i32* %12, align 4
  %83 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %84 = load i32, i32* %6, align 4
  %85 = load i32, i32* %12, align 4
  %86 = zext i32 %85 to i64
  %87 = load i32, i32* %7, align 4
  %88 = zext i32 %87 to i64
  %89 = mul i64 %86, %88
  %90 = mul i64 %89, 1
  %91 = call i8* @alloc_large(%struct.jpeg_common_struct* %83, i32 %84, i64 %90)
  store i8* %91, i8** %11, align 8
  %92 = load i32, i32* %12, align 4
  store i32 %92, i32* %14, align 4
  br label %93

; <label>:93:                                     ; preds = %107, %81
  %94 = load i32, i32* %14, align 4
  %95 = icmp ugt i32 %94, 0
  br i1 %95, label %96, label %111

; <label>:96:                                     ; preds = %93
  %97 = load i8*, i8** %11, align 8
  %98 = load i8**, i8*** %10, align 8
  %99 = load i32, i32* %13, align 4
  %100 = add i32 %99, 1
  store i32 %100, i32* %13, align 4
  %101 = zext i32 %99 to i64
  %102 = getelementptr inbounds i8*, i8** %98, i64 %101
  store i8* %97, i8** %102, align 8
  %103 = load i32, i32* %7, align 4
  %104 = load i8*, i8** %11, align 8
  %105 = zext i32 %103 to i64
  %106 = getelementptr inbounds i8, i8* %104, i64 %105
  store i8* %106, i8** %11, align 8
  br label %107

; <label>:107:                                    ; preds = %96
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 0)
  %108 = add i64 %pgocount5, 1
  store i64 %108, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_sarray, i64 0, i64 0)
  %109 = load i32, i32* %14, align 4
  %110 = add i32 %109, -1
  store i32 %110, i32* %14, align 4
  br label %93

; <label>:111:                                    ; preds = %93
  br label %63

; <label>:112:                                    ; preds = %63
  %113 = load i8**, i8*** %10, align 8
  ret i8** %113
}

; Function Attrs: noinline nounwind uwtable
define internal [64 x i16]** @alloc_barray(%struct.jpeg_common_struct*, i32, i32, i32) #0 {
  %5 = alloca %struct.jpeg_common_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.my_memory_mgr*, align 8
  %10 = alloca [64 x i16]**, align 8
  %11 = alloca [64 x i16]*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %16 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %17 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %16, i32 0, i32 1
  %18 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %17, align 8
  %19 = bitcast %struct.jpeg_memory_mgr* %18 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %19, %struct.my_memory_mgr** %9, align 8
  %20 = load i32, i32* %7, align 4
  %21 = zext i32 %20 to i64
  %22 = mul i64 %21, 128
  %23 = udiv i64 999999976, %22
  store i64 %23, i64* %15, align 8
  %24 = load i64, i64* %15, align 8
  %25 = icmp sle i64 %24, 0
  br i1 %25, label %26, label %40

; <label>:26:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 3)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 3)
  %28 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 5
  store i32 69, i32* %31, align 8
  %32 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %33 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 0
  %36 = bitcast {}** %35 to void (%struct.jpeg_common_struct*)**
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  %38 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %39 = ptrtoint void (%struct.jpeg_common_struct*)* %37 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_alloc_barray to i8*), i32 0)
  call void %37(%struct.jpeg_common_struct* %38)
  br label %40

; <label>:40:                                     ; preds = %26, %4
  %41 = load i64, i64* %15, align 8
  %42 = load i32, i32* %8, align 4
  %43 = zext i32 %42 to i64
  %44 = icmp slt i64 %41, %43
  br i1 %44, label %45, label %49

; <label>:45:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 4)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 4)
  %47 = load i64, i64* %15, align 8
  %48 = trunc i64 %47 to i32
  store i32 %48, i32* %12, align 4
  br label %52

; <label>:49:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 5)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 5)
  %51 = load i32, i32* %8, align 4
  store i32 %51, i32* %12, align 4
  br label %52

; <label>:52:                                     ; preds = %49, %45
  %53 = load i32, i32* %12, align 4
  %54 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %9, align 8
  %55 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %54, i32 0, i32 6
  store i32 %53, i32* %55, align 8
  %56 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %57 = load i32, i32* %6, align 4
  %58 = load i32, i32* %8, align 4
  %59 = zext i32 %58 to i64
  %60 = mul i64 %59, 8
  %61 = call i8* @alloc_small(%struct.jpeg_common_struct* %56, i32 %57, i64 %60)
  %62 = bitcast i8* %61 to [64 x i16]**
  store [64 x i16]** %62, [64 x i16]*** %10, align 8
  store i32 0, i32* %13, align 4
  br label %63

; <label>:63:                                     ; preds = %112, %52
  %64 = load i32, i32* %13, align 4
  %65 = load i32, i32* %8, align 4
  %66 = icmp ult i32 %64, %65
  br i1 %66, label %67, label %113

; <label>:67:                                     ; preds = %63
  %68 = load i32, i32* %12, align 4
  %69 = load i32, i32* %8, align 4
  %70 = load i32, i32* %13, align 4
  %71 = sub i32 %69, %70
  %72 = icmp ult i32 %68, %71
  br i1 %72, label %73, label %76

; <label>:73:                                     ; preds = %67
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 1)
  %74 = add i64 %pgocount3, 1
  store i64 %74, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 1)
  %75 = load i32, i32* %12, align 4
  br label %81

; <label>:76:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 2)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 2)
  %78 = load i32, i32* %8, align 4
  %79 = load i32, i32* %13, align 4
  %80 = sub i32 %78, %79
  br label %81

; <label>:81:                                     ; preds = %76, %73
  %82 = phi i32 [ %75, %73 ], [ %80, %76 ]
  store i32 %82, i32* %12, align 4
  %83 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %5, align 8
  %84 = load i32, i32* %6, align 4
  %85 = load i32, i32* %12, align 4
  %86 = zext i32 %85 to i64
  %87 = load i32, i32* %7, align 4
  %88 = zext i32 %87 to i64
  %89 = mul i64 %86, %88
  %90 = mul i64 %89, 128
  %91 = call i8* @alloc_large(%struct.jpeg_common_struct* %83, i32 %84, i64 %90)
  %92 = bitcast i8* %91 to [64 x i16]*
  store [64 x i16]* %92, [64 x i16]** %11, align 8
  %93 = load i32, i32* %12, align 4
  store i32 %93, i32* %14, align 4
  br label %94

; <label>:94:                                     ; preds = %108, %81
  %95 = load i32, i32* %14, align 4
  %96 = icmp ugt i32 %95, 0
  br i1 %96, label %97, label %112

; <label>:97:                                     ; preds = %94
  %98 = load [64 x i16]*, [64 x i16]** %11, align 8
  %99 = load [64 x i16]**, [64 x i16]*** %10, align 8
  %100 = load i32, i32* %13, align 4
  %101 = add i32 %100, 1
  store i32 %101, i32* %13, align 4
  %102 = zext i32 %100 to i64
  %103 = getelementptr inbounds [64 x i16]*, [64 x i16]** %99, i64 %102
  store [64 x i16]* %98, [64 x i16]** %103, align 8
  %104 = load i32, i32* %7, align 4
  %105 = load [64 x i16]*, [64 x i16]** %11, align 8
  %106 = zext i32 %104 to i64
  %107 = getelementptr inbounds [64 x i16], [64 x i16]* %105, i64 %106
  store [64 x i16]* %107, [64 x i16]** %11, align 8
  br label %108

; <label>:108:                                    ; preds = %97
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 0)
  %109 = add i64 %pgocount5, 1
  store i64 %109, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_alloc_barray, i64 0, i64 0)
  %110 = load i32, i32* %14, align 4
  %111 = add i32 %110, -1
  store i32 %111, i32* %14, align 4
  br label %94

; <label>:112:                                    ; preds = %94
  br label %63

; <label>:113:                                    ; preds = %63
  %114 = load [64 x i16]**, [64 x i16]*** %10, align 8
  ret [64 x i16]** %114
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.jvirt_sarray_control* @request_virt_sarray(%struct.jpeg_common_struct*, i32, i32, i32, i32, i32) #0 {
  %7 = alloca %struct.jpeg_common_struct*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.my_memory_mgr*, align 8
  %14 = alloca %struct.jvirt_sarray_control*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %15 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %16 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %15, i32 0, i32 1
  %17 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %16, align 8
  %18 = bitcast %struct.jpeg_memory_mgr* %17 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %18, %struct.my_memory_mgr** %13, align 8
  %19 = load i32, i32* %8, align 4
  %20 = icmp ne i32 %19, 1
  br i1 %20, label %21, label %42

; <label>:21:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_sarray, i64 0, i64 1)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_sarray, i64 0, i64 1)
  %23 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %24 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 5
  store i32 12, i32* %26, align 8
  %27 = load i32, i32* %8, align 4
  %28 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %29 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 6
  %32 = bitcast %union.anon* %31 to [8 x i32]*
  %33 = getelementptr inbounds [8 x i32], [8 x i32]* %32, i64 0, i64 0
  store i32 %27, i32* %33, align 4
  %34 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %35 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %34, i32 0, i32 0
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i32 0, i32 0
  %38 = bitcast {}** %37 to void (%struct.jpeg_common_struct*)**
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  %40 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %41 = ptrtoint void (%struct.jpeg_common_struct*)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_request_virt_sarray to i8*), i32 0)
  call void %39(%struct.jpeg_common_struct* %40)
  br label %42

; <label>:42:                                     ; preds = %21, %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_sarray, i64 0, i64 0)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_sarray, i64 0, i64 0)
  %44 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %45 = load i32, i32* %8, align 4
  %46 = call i8* @alloc_small(%struct.jpeg_common_struct* %44, i32 %45, i64 152)
  %47 = bitcast i8* %46 to %struct.jvirt_sarray_control*
  store %struct.jvirt_sarray_control* %47, %struct.jvirt_sarray_control** %14, align 8
  %48 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  %49 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %48, i32 0, i32 0
  store i8** null, i8*** %49, align 8
  %50 = load i32, i32* %11, align 4
  %51 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  %52 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %51, i32 0, i32 1
  store i32 %50, i32* %52, align 8
  %53 = load i32, i32* %10, align 4
  %54 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  %55 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %54, i32 0, i32 2
  store i32 %53, i32* %55, align 4
  %56 = load i32, i32* %12, align 4
  %57 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  %58 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %57, i32 0, i32 3
  store i32 %56, i32* %58, align 8
  %59 = load i32, i32* %9, align 4
  %60 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  %61 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %60, i32 0, i32 8
  store i32 %59, i32* %61, align 4
  %62 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  %63 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %62, i32 0, i32 10
  store i32 0, i32* %63, align 4
  %64 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %13, align 8
  %65 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %64, i32 0, i32 3
  %66 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %65, align 8
  %67 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  %68 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %67, i32 0, i32 11
  store %struct.jvirt_sarray_control* %66, %struct.jvirt_sarray_control** %68, align 8
  %69 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  %70 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %13, align 8
  %71 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %70, i32 0, i32 3
  store %struct.jvirt_sarray_control* %69, %struct.jvirt_sarray_control** %71, align 8
  %72 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %14, align 8
  ret %struct.jvirt_sarray_control* %72
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.jvirt_barray_control* @request_virt_barray(%struct.jpeg_common_struct*, i32, i32, i32, i32, i32) #0 {
  %7 = alloca %struct.jpeg_common_struct*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.my_memory_mgr*, align 8
  %14 = alloca %struct.jvirt_barray_control*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %15 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %16 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %15, i32 0, i32 1
  %17 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %16, align 8
  %18 = bitcast %struct.jpeg_memory_mgr* %17 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %18, %struct.my_memory_mgr** %13, align 8
  %19 = load i32, i32* %8, align 4
  %20 = icmp ne i32 %19, 1
  br i1 %20, label %21, label %42

; <label>:21:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_barray, i64 0, i64 1)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_barray, i64 0, i64 1)
  %23 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %24 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 5
  store i32 12, i32* %26, align 8
  %27 = load i32, i32* %8, align 4
  %28 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %29 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 6
  %32 = bitcast %union.anon* %31 to [8 x i32]*
  %33 = getelementptr inbounds [8 x i32], [8 x i32]* %32, i64 0, i64 0
  store i32 %27, i32* %33, align 4
  %34 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %35 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %34, i32 0, i32 0
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i32 0, i32 0
  %38 = bitcast {}** %37 to void (%struct.jpeg_common_struct*)**
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  %40 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %41 = ptrtoint void (%struct.jpeg_common_struct*)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_request_virt_barray to i8*), i32 0)
  call void %39(%struct.jpeg_common_struct* %40)
  br label %42

; <label>:42:                                     ; preds = %21, %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_barray, i64 0, i64 0)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_request_virt_barray, i64 0, i64 0)
  %44 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %7, align 8
  %45 = load i32, i32* %8, align 4
  %46 = call i8* @alloc_small(%struct.jpeg_common_struct* %44, i32 %45, i64 152)
  %47 = bitcast i8* %46 to %struct.jvirt_barray_control*
  store %struct.jvirt_barray_control* %47, %struct.jvirt_barray_control** %14, align 8
  %48 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  %49 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %48, i32 0, i32 0
  store [64 x i16]** null, [64 x i16]*** %49, align 8
  %50 = load i32, i32* %11, align 4
  %51 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  %52 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %51, i32 0, i32 1
  store i32 %50, i32* %52, align 8
  %53 = load i32, i32* %10, align 4
  %54 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  %55 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %54, i32 0, i32 2
  store i32 %53, i32* %55, align 4
  %56 = load i32, i32* %12, align 4
  %57 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  %58 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %57, i32 0, i32 3
  store i32 %56, i32* %58, align 8
  %59 = load i32, i32* %9, align 4
  %60 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  %61 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %60, i32 0, i32 8
  store i32 %59, i32* %61, align 4
  %62 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  %63 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %62, i32 0, i32 10
  store i32 0, i32* %63, align 4
  %64 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %13, align 8
  %65 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %64, i32 0, i32 4
  %66 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %65, align 8
  %67 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  %68 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %67, i32 0, i32 11
  store %struct.jvirt_barray_control* %66, %struct.jvirt_barray_control** %68, align 8
  %69 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  %70 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %13, align 8
  %71 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %70, i32 0, i32 4
  store %struct.jvirt_barray_control* %69, %struct.jvirt_barray_control** %71, align 8
  %72 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %14, align 8
  ret %struct.jvirt_barray_control* %72
}

; Function Attrs: noinline nounwind uwtable
define internal void @realize_virt_arrays(%struct.jpeg_common_struct*) #0 {
  %2 = alloca %struct.jpeg_common_struct*, align 8
  %3 = alloca %struct.my_memory_mgr*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca %struct.jvirt_sarray_control*, align 8
  %10 = alloca %struct.jvirt_barray_control*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %2, align 8
  %11 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %12 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %11, i32 0, i32 1
  %13 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %12, align 8
  %14 = bitcast %struct.jpeg_memory_mgr* %13 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %14, %struct.my_memory_mgr** %3, align 8
  store i64 0, i64* %4, align 8
  store i64 0, i64* %5, align 8
  %15 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %16 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %15, i32 0, i32 3
  %17 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %16, align 8
  store %struct.jvirt_sarray_control* %17, %struct.jvirt_sarray_control** %9, align 8
  br label %18

; <label>:18:                                     ; preds = %53, %1
  %19 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %20 = icmp ne %struct.jvirt_sarray_control* %19, null
  br i1 %20, label %21, label %58

; <label>:21:                                     ; preds = %18
  %22 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %23 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %22, i32 0, i32 0
  %24 = load i8**, i8*** %23, align 8
  %25 = icmp eq i8** %24, null
  br i1 %25, label %26, label %52

; <label>:26:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 4)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 4)
  %28 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %29 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %28, i32 0, i32 3
  %30 = load i32, i32* %29, align 8
  %31 = zext i32 %30 to i64
  %32 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %33 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %32, i32 0, i32 2
  %34 = load i32, i32* %33, align 4
  %35 = zext i32 %34 to i64
  %36 = mul nsw i64 %31, %35
  %37 = mul i64 %36, 1
  %38 = load i64, i64* %4, align 8
  %39 = add i64 %38, %37
  store i64 %39, i64* %4, align 8
  %40 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %41 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %40, i32 0, i32 1
  %42 = load i32, i32* %41, align 8
  %43 = zext i32 %42 to i64
  %44 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %45 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %44, i32 0, i32 2
  %46 = load i32, i32* %45, align 4
  %47 = zext i32 %46 to i64
  %48 = mul nsw i64 %43, %47
  %49 = mul i64 %48, 1
  %50 = load i64, i64* %5, align 8
  %51 = add i64 %50, %49
  store i64 %51, i64* %5, align 8
  br label %52

; <label>:52:                                     ; preds = %26, %21
  br label %53

; <label>:53:                                     ; preds = %52
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 0)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 0)
  %55 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %56 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %55, i32 0, i32 11
  %57 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %56, align 8
  store %struct.jvirt_sarray_control* %57, %struct.jvirt_sarray_control** %9, align 8
  br label %18

; <label>:58:                                     ; preds = %18
  %59 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %60 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %59, i32 0, i32 4
  %61 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %60, align 8
  store %struct.jvirt_barray_control* %61, %struct.jvirt_barray_control** %10, align 8
  br label %62

; <label>:62:                                     ; preds = %97, %58
  %63 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %64 = icmp ne %struct.jvirt_barray_control* %63, null
  br i1 %64, label %65, label %102

; <label>:65:                                     ; preds = %62
  %66 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %67 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %66, i32 0, i32 0
  %68 = load [64 x i16]**, [64 x i16]*** %67, align 8
  %69 = icmp eq [64 x i16]** %68, null
  br i1 %69, label %70, label %96

; <label>:70:                                     ; preds = %65
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 5)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 5)
  %72 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %73 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %72, i32 0, i32 3
  %74 = load i32, i32* %73, align 8
  %75 = zext i32 %74 to i64
  %76 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %77 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %76, i32 0, i32 2
  %78 = load i32, i32* %77, align 4
  %79 = zext i32 %78 to i64
  %80 = mul nsw i64 %75, %79
  %81 = mul i64 %80, 128
  %82 = load i64, i64* %4, align 8
  %83 = add i64 %82, %81
  store i64 %83, i64* %4, align 8
  %84 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %85 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %84, i32 0, i32 1
  %86 = load i32, i32* %85, align 8
  %87 = zext i32 %86 to i64
  %88 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %89 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %88, i32 0, i32 2
  %90 = load i32, i32* %89, align 4
  %91 = zext i32 %90 to i64
  %92 = mul nsw i64 %87, %91
  %93 = mul i64 %92, 128
  %94 = load i64, i64* %5, align 8
  %95 = add i64 %94, %93
  store i64 %95, i64* %5, align 8
  br label %96

; <label>:96:                                     ; preds = %70, %65
  br label %97

; <label>:97:                                     ; preds = %96
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 1)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 1)
  %99 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %100 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %99, i32 0, i32 11
  %101 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %100, align 8
  store %struct.jvirt_barray_control* %101, %struct.jvirt_barray_control** %10, align 8
  br label %62

; <label>:102:                                    ; preds = %62
  %103 = load i64, i64* %4, align 8
  %104 = icmp sle i64 %103, 0
  br i1 %104, label %105, label %107

; <label>:105:                                    ; preds = %102
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 10)
  %106 = add i64 %pgocount4, 1
  store i64 %106, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 10)
  br label %306

; <label>:107:                                    ; preds = %102
  %108 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %109 = load i64, i64* %4, align 8
  %110 = load i64, i64* %5, align 8
  %111 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %112 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %111, i32 0, i32 5
  %113 = load i64, i64* %112, align 8
  %114 = call i64 @jpeg_mem_available(%struct.jpeg_common_struct* %108, i64 %109, i64 %110, i64 %113)
  store i64 %114, i64* %6, align 8
  %115 = load i64, i64* %6, align 8
  %116 = load i64, i64* %5, align 8
  %117 = icmp sge i64 %115, %116
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %107
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 11)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 11)
  store i64 1000000000, i64* %8, align 8
  br label %130

; <label>:120:                                    ; preds = %107
  %121 = load i64, i64* %6, align 8
  %122 = load i64, i64* %4, align 8
  %123 = sdiv i64 %121, %122
  store i64 %123, i64* %8, align 8
  %124 = load i64, i64* %8, align 8
  %125 = icmp sle i64 %124, 0
  br i1 %125, label %126, label %128

; <label>:126:                                    ; preds = %120
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 13)
  %127 = add i64 %pgocount6, 1
  store i64 %127, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 13)
  store i64 1, i64* %8, align 8
  br label %128

; <label>:128:                                    ; preds = %126, %120
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 12)
  %129 = add i64 %pgocount7, 1
  store i64 %129, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 12)
  br label %130

; <label>:130:                                    ; preds = %128, %118
  %131 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %132 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %131, i32 0, i32 3
  %133 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %132, align 8
  store %struct.jvirt_sarray_control* %133, %struct.jvirt_sarray_control** %9, align 8
  br label %134

; <label>:134:                                    ; preds = %213, %130
  %135 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %136 = icmp ne %struct.jvirt_sarray_control* %135, null
  br i1 %136, label %137, label %218

; <label>:137:                                    ; preds = %134
  %138 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %139 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %138, i32 0, i32 0
  %140 = load i8**, i8*** %139, align 8
  %141 = icmp eq i8** %140, null
  br i1 %141, label %142, label %212

; <label>:142:                                    ; preds = %137
  %143 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %144 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %143, i32 0, i32 1
  %145 = load i32, i32* %144, align 8
  %146 = zext i32 %145 to i64
  %147 = sub nsw i64 %146, 1
  %148 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %149 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %148, i32 0, i32 3
  %150 = load i32, i32* %149, align 8
  %151 = zext i32 %150 to i64
  %152 = sdiv i64 %147, %151
  %153 = add nsw i64 %152, 1
  store i64 %153, i64* %7, align 8
  %154 = load i64, i64* %7, align 8
  %155 = load i64, i64* %8, align 8
  %156 = icmp sle i64 %154, %155
  br i1 %156, label %157, label %164

; <label>:157:                                    ; preds = %142
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 6)
  %158 = add i64 %pgocount8, 1
  store i64 %158, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 6)
  %159 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %160 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %159, i32 0, i32 1
  %161 = load i32, i32* %160, align 8
  %162 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %163 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %162, i32 0, i32 4
  store i32 %161, i32* %163, align 4
  br label %190

; <label>:164:                                    ; preds = %142
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 7)
  %165 = add i64 %pgocount9, 1
  store i64 %165, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 7)
  %166 = load i64, i64* %8, align 8
  %167 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %168 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %167, i32 0, i32 3
  %169 = load i32, i32* %168, align 8
  %170 = zext i32 %169 to i64
  %171 = mul nsw i64 %166, %170
  %172 = trunc i64 %171 to i32
  %173 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %174 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %173, i32 0, i32 4
  store i32 %172, i32* %174, align 4
  %175 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %176 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %177 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %176, i32 0, i32 12
  %178 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %179 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %178, i32 0, i32 1
  %180 = load i32, i32* %179, align 8
  %181 = zext i32 %180 to i64
  %182 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %183 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %182, i32 0, i32 2
  %184 = load i32, i32* %183, align 4
  %185 = zext i32 %184 to i64
  %186 = mul nsw i64 %181, %185
  %187 = mul nsw i64 %186, 1
  call void @jpeg_open_backing_store(%struct.jpeg_common_struct* %175, %struct.backing_store_struct* %177, i64 %187)
  %188 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %189 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %188, i32 0, i32 10
  store i32 1, i32* %189, align 4
  br label %190

; <label>:190:                                    ; preds = %164, %157
  %191 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %192 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %193 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %192, i32 0, i32 2
  %194 = load i32, i32* %193, align 4
  %195 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %196 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %195, i32 0, i32 4
  %197 = load i32, i32* %196, align 4
  %198 = call i8** @alloc_sarray(%struct.jpeg_common_struct* %191, i32 1, i32 %194, i32 %197)
  %199 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %200 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %199, i32 0, i32 0
  store i8** %198, i8*** %200, align 8
  %201 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %202 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %201, i32 0, i32 6
  %203 = load i32, i32* %202, align 8
  %204 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %205 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %204, i32 0, i32 5
  store i32 %203, i32* %205, align 8
  %206 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %207 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %206, i32 0, i32 6
  store i32 0, i32* %207, align 4
  %208 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %209 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %208, i32 0, i32 7
  store i32 0, i32* %209, align 8
  %210 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %211 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %210, i32 0, i32 9
  store i32 0, i32* %211, align 8
  br label %212

; <label>:212:                                    ; preds = %190, %137
  br label %213

; <label>:213:                                    ; preds = %212
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 2)
  %214 = add i64 %pgocount10, 1
  store i64 %214, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 2)
  %215 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %216 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %215, i32 0, i32 11
  %217 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %216, align 8
  store %struct.jvirt_sarray_control* %217, %struct.jvirt_sarray_control** %9, align 8
  br label %134

; <label>:218:                                    ; preds = %134
  %219 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %220 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %219, i32 0, i32 4
  %221 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %220, align 8
  store %struct.jvirt_barray_control* %221, %struct.jvirt_barray_control** %10, align 8
  br label %222

; <label>:222:                                    ; preds = %301, %218
  %223 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %224 = icmp ne %struct.jvirt_barray_control* %223, null
  br i1 %224, label %225, label %306

; <label>:225:                                    ; preds = %222
  %226 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %227 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %226, i32 0, i32 0
  %228 = load [64 x i16]**, [64 x i16]*** %227, align 8
  %229 = icmp eq [64 x i16]** %228, null
  br i1 %229, label %230, label %300

; <label>:230:                                    ; preds = %225
  %231 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %232 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %231, i32 0, i32 1
  %233 = load i32, i32* %232, align 8
  %234 = zext i32 %233 to i64
  %235 = sub nsw i64 %234, 1
  %236 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %237 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %236, i32 0, i32 3
  %238 = load i32, i32* %237, align 8
  %239 = zext i32 %238 to i64
  %240 = sdiv i64 %235, %239
  %241 = add nsw i64 %240, 1
  store i64 %241, i64* %7, align 8
  %242 = load i64, i64* %7, align 8
  %243 = load i64, i64* %8, align 8
  %244 = icmp sle i64 %242, %243
  br i1 %244, label %245, label %252

; <label>:245:                                    ; preds = %230
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 8)
  %246 = add i64 %pgocount11, 1
  store i64 %246, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 8)
  %247 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %248 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %247, i32 0, i32 1
  %249 = load i32, i32* %248, align 8
  %250 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %251 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %250, i32 0, i32 4
  store i32 %249, i32* %251, align 4
  br label %278

; <label>:252:                                    ; preds = %230
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 9)
  %253 = add i64 %pgocount12, 1
  store i64 %253, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 9)
  %254 = load i64, i64* %8, align 8
  %255 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %256 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %255, i32 0, i32 3
  %257 = load i32, i32* %256, align 8
  %258 = zext i32 %257 to i64
  %259 = mul nsw i64 %254, %258
  %260 = trunc i64 %259 to i32
  %261 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %262 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %261, i32 0, i32 4
  store i32 %260, i32* %262, align 4
  %263 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %264 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %265 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %264, i32 0, i32 12
  %266 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %267 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %266, i32 0, i32 1
  %268 = load i32, i32* %267, align 8
  %269 = zext i32 %268 to i64
  %270 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %271 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %270, i32 0, i32 2
  %272 = load i32, i32* %271, align 4
  %273 = zext i32 %272 to i64
  %274 = mul nsw i64 %269, %273
  %275 = mul nsw i64 %274, 128
  call void @jpeg_open_backing_store(%struct.jpeg_common_struct* %263, %struct.backing_store_struct* %265, i64 %275)
  %276 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %277 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %276, i32 0, i32 10
  store i32 1, i32* %277, align 4
  br label %278

; <label>:278:                                    ; preds = %252, %245
  %279 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %280 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %281 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %280, i32 0, i32 2
  %282 = load i32, i32* %281, align 4
  %283 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %284 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %283, i32 0, i32 4
  %285 = load i32, i32* %284, align 4
  %286 = call [64 x i16]** @alloc_barray(%struct.jpeg_common_struct* %279, i32 1, i32 %282, i32 %285)
  %287 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %288 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %287, i32 0, i32 0
  store [64 x i16]** %286, [64 x i16]*** %288, align 8
  %289 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %3, align 8
  %290 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %289, i32 0, i32 6
  %291 = load i32, i32* %290, align 8
  %292 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %293 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %292, i32 0, i32 5
  store i32 %291, i32* %293, align 8
  %294 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %295 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %294, i32 0, i32 6
  store i32 0, i32* %295, align 4
  %296 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %297 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %296, i32 0, i32 7
  store i32 0, i32* %297, align 8
  %298 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %299 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %298, i32 0, i32 9
  store i32 0, i32* %299, align 8
  br label %300

; <label>:300:                                    ; preds = %278, %225
  br label %301

; <label>:301:                                    ; preds = %300
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 3)
  %302 = add i64 %pgocount13, 1
  store i64 %302, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_realize_virt_arrays, i64 0, i64 3)
  %303 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %304 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %303, i32 0, i32 11
  %305 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %304, align 8
  store %struct.jvirt_barray_control* %305, %struct.jvirt_barray_control** %10, align 8
  br label %222

; <label>:306:                                    ; preds = %222, %105
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i8** @access_virt_sarray(%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32) #0 {
  %6 = alloca %struct.jpeg_common_struct*, align 8
  %7 = alloca %struct.jvirt_sarray_control*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %6, align 8
  store %struct.jvirt_sarray_control* %1, %struct.jvirt_sarray_control** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %15 = load i32, i32* %8, align 4
  %16 = load i32, i32* %9, align 4
  %17 = add i32 %15, %16
  store i32 %17, i32* %11, align 4
  %18 = load i32, i32* %11, align 4
  %19 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %20 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %19, i32 0, i32 1
  %21 = load i32, i32* %20, align 8
  %22 = icmp ugt i32 %18, %21
  br i1 %22, label %36, label %23

; <label>:23:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 4)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 4)
  %25 = load i32, i32* %9, align 4
  %26 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %27 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %26, i32 0, i32 3
  %28 = load i32, i32* %27, align 8
  %29 = icmp ugt i32 %25, %28
  br i1 %29, label %36, label %30

; <label>:30:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 11)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 11)
  %32 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %33 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %32, i32 0, i32 0
  %34 = load i8**, i8*** %33, align 8
  %35 = icmp eq i8** %34, null
  br i1 %35, label %36, label %50

; <label>:36:                                     ; preds = %30, %23, %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 2)
  %38 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %39 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 5
  store i32 20, i32* %41, align 8
  %42 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %43 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %42, i32 0, i32 0
  %44 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %44, i32 0, i32 0
  %46 = bitcast {}** %45 to void (%struct.jpeg_common_struct*)**
  %47 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %46, align 8
  %48 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %49 = ptrtoint void (%struct.jpeg_common_struct*)* %47 to i64
  call void @__llvm_profile_instrument_target(i64 %49, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_sarray to i8*), i32 0)
  call void %47(%struct.jpeg_common_struct* %48)
  br label %50

; <label>:50:                                     ; preds = %36, %30
  %51 = load i32, i32* %8, align 4
  %52 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %53 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %52, i32 0, i32 6
  %54 = load i32, i32* %53, align 4
  %55 = icmp ult i32 %51, %54
  br i1 %55, label %67, label %56

; <label>:56:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 5)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 5)
  %58 = load i32, i32* %11, align 4
  %59 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %60 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %59, i32 0, i32 6
  %61 = load i32, i32* %60, align 4
  %62 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %63 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %62, i32 0, i32 4
  %64 = load i32, i32* %63, align 4
  %65 = add i32 %61, %64
  %66 = icmp ugt i32 %58, %65
  br i1 %66, label %67, label %129

; <label>:67:                                     ; preds = %56, %50
  %68 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %69 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %68, i32 0, i32 10
  %70 = load i32, i32* %69, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %86, label %72

; <label>:72:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 10)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 10)
  %74 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %75 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %74, i32 0, i32 0
  %76 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %77 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %76, i32 0, i32 5
  store i32 68, i32* %77, align 8
  %78 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %79 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 0
  %82 = bitcast {}** %81 to void (%struct.jpeg_common_struct*)**
  %83 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %82, align 8
  %84 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %85 = ptrtoint void (%struct.jpeg_common_struct*)* %83 to i64
  call void @__llvm_profile_instrument_target(i64 %85, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_sarray to i8*), i32 1)
  call void %83(%struct.jpeg_common_struct* %84)
  br label %86

; <label>:86:                                     ; preds = %72, %67
  %87 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %88 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %87, i32 0, i32 9
  %89 = load i32, i32* %88, align 8
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %97

; <label>:91:                                     ; preds = %86
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 6)
  %92 = add i64 %pgocount5, 1
  store i64 %92, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 6)
  %93 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %94 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  call void @do_sarray_io(%struct.jpeg_common_struct* %93, %struct.jvirt_sarray_control* %94, i32 1)
  %95 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %96 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %95, i32 0, i32 9
  store i32 0, i32* %96, align 8
  br label %97

; <label>:97:                                     ; preds = %91, %86
  %98 = load i32, i32* %8, align 4
  %99 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %100 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %99, i32 0, i32 6
  %101 = load i32, i32* %100, align 4
  %102 = icmp ugt i32 %98, %101
  br i1 %102, label %103, label %108

; <label>:103:                                    ; preds = %97
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 7)
  %104 = add i64 %pgocount6, 1
  store i64 %104, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 7)
  %105 = load i32, i32* %8, align 4
  %106 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %107 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %106, i32 0, i32 6
  store i32 %105, i32* %107, align 4
  br label %126

; <label>:108:                                    ; preds = %97
  %109 = load i32, i32* %11, align 4
  %110 = zext i32 %109 to i64
  %111 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %112 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %111, i32 0, i32 4
  %113 = load i32, i32* %112, align 4
  %114 = zext i32 %113 to i64
  %115 = sub nsw i64 %110, %114
  store i64 %115, i64* %13, align 8
  %116 = load i64, i64* %13, align 8
  %117 = icmp slt i64 %116, 0
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %108
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 16)
  %119 = add i64 %pgocount7, 1
  store i64 %119, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 16)
  store i64 0, i64* %13, align 8
  br label %120

; <label>:120:                                    ; preds = %118, %108
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 8)
  %121 = add i64 %pgocount8, 1
  store i64 %121, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 8)
  %122 = load i64, i64* %13, align 8
  %123 = trunc i64 %122 to i32
  %124 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %125 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %124, i32 0, i32 6
  store i32 %123, i32* %125, align 4
  br label %126

; <label>:126:                                    ; preds = %120, %103
  %127 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %128 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  call void @do_sarray_io(%struct.jpeg_common_struct* %127, %struct.jvirt_sarray_control* %128, i32 0)
  br label %129

; <label>:129:                                    ; preds = %126, %56
  %130 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %131 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %130, i32 0, i32 7
  %132 = load i32, i32* %131, align 8
  %133 = load i32, i32* %11, align 4
  %134 = icmp ult i32 %132, %133
  br i1 %134, label %135, label %232

; <label>:135:                                    ; preds = %129
  %136 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %137 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %136, i32 0, i32 7
  %138 = load i32, i32* %137, align 8
  %139 = load i32, i32* %8, align 4
  %140 = icmp ult i32 %138, %139
  br i1 %140, label %141, label %161

; <label>:141:                                    ; preds = %135
  %142 = load i32, i32* %10, align 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %144, label %158

; <label>:144:                                    ; preds = %141
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 15)
  %145 = add i64 %pgocount9, 1
  store i64 %145, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 15)
  %146 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %147 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %146, i32 0, i32 0
  %148 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %147, align 8
  %149 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %148, i32 0, i32 5
  store i32 20, i32* %149, align 8
  %150 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %151 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %150, i32 0, i32 0
  %152 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %151, align 8
  %153 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %152, i32 0, i32 0
  %154 = bitcast {}** %153 to void (%struct.jpeg_common_struct*)**
  %155 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %154, align 8
  %156 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %157 = ptrtoint void (%struct.jpeg_common_struct*)* %155 to i64
  call void @__llvm_profile_instrument_target(i64 %157, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_sarray to i8*), i32 2)
  call void %155(%struct.jpeg_common_struct* %156)
  br label %158

; <label>:158:                                    ; preds = %144, %141
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 12)
  %159 = add i64 %pgocount10, 1
  store i64 %159, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 12)
  %160 = load i32, i32* %8, align 4
  store i32 %160, i32* %12, align 4
  br label %166

; <label>:161:                                    ; preds = %135
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 13)
  %162 = add i64 %pgocount11, 1
  store i64 %162, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 13)
  %163 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %164 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %163, i32 0, i32 7
  %165 = load i32, i32* %164, align 8
  store i32 %165, i32* %12, align 4
  br label %166

; <label>:166:                                    ; preds = %161, %158
  %167 = load i32, i32* %10, align 4
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %169, label %174

; <label>:169:                                    ; preds = %166
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 9)
  %170 = add i64 %pgocount12, 1
  store i64 %170, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 9)
  %171 = load i32, i32* %11, align 4
  %172 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %173 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %172, i32 0, i32 7
  store i32 %171, i32* %173, align 8
  br label %174

; <label>:174:                                    ; preds = %169, %166
  %175 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %176 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %175, i32 0, i32 8
  %177 = load i32, i32* %176, align 4
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %179, label %212

; <label>:179:                                    ; preds = %174
  %180 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %181 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %180, i32 0, i32 2
  %182 = load i32, i32* %181, align 4
  %183 = zext i32 %182 to i64
  %184 = mul i64 %183, 1
  store i64 %184, i64* %14, align 8
  %185 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %186 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %185, i32 0, i32 6
  %187 = load i32, i32* %186, align 4
  %188 = load i32, i32* %12, align 4
  %189 = sub i32 %188, %187
  store i32 %189, i32* %12, align 4
  %190 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %191 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %190, i32 0, i32 6
  %192 = load i32, i32* %191, align 4
  %193 = load i32, i32* %11, align 4
  %194 = sub i32 %193, %192
  store i32 %194, i32* %11, align 4
  br label %195

; <label>:195:                                    ; preds = %199, %179
  %196 = load i32, i32* %12, align 4
  %197 = load i32, i32* %11, align 4
  %198 = icmp ult i32 %196, %197
  br i1 %198, label %199, label %211

; <label>:199:                                    ; preds = %195
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 0)
  %200 = add i64 %pgocount13, 1
  store i64 %200, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 0)
  %201 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %202 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %201, i32 0, i32 0
  %203 = load i8**, i8*** %202, align 8
  %204 = load i32, i32* %12, align 4
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds i8*, i8** %203, i64 %205
  %207 = load i8*, i8** %206, align 8
  %208 = load i64, i64* %14, align 8
  call void @jzero_far(i8* %207, i64 %208)
  %209 = load i32, i32* %12, align 4
  %210 = add i32 %209, 1
  store i32 %210, i32* %12, align 4
  br label %195

; <label>:211:                                    ; preds = %195
  br label %231

; <label>:212:                                    ; preds = %174
  %213 = load i32, i32* %10, align 4
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %229, label %215

; <label>:215:                                    ; preds = %212
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 17)
  %216 = add i64 %pgocount14, 1
  store i64 %216, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 17)
  %217 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %218 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %217, i32 0, i32 0
  %219 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %218, align 8
  %220 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %219, i32 0, i32 5
  store i32 20, i32* %220, align 8
  %221 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %222 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %221, i32 0, i32 0
  %223 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %222, align 8
  %224 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %223, i32 0, i32 0
  %225 = bitcast {}** %224 to void (%struct.jpeg_common_struct*)**
  %226 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %225, align 8
  %227 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %228 = ptrtoint void (%struct.jpeg_common_struct*)* %226 to i64
  call void @__llvm_profile_instrument_target(i64 %228, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_sarray to i8*), i32 3)
  call void %226(%struct.jpeg_common_struct* %227)
  br label %229

; <label>:229:                                    ; preds = %215, %212
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 14)
  %230 = add i64 %pgocount15, 1
  store i64 %230, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 14)
  br label %231

; <label>:231:                                    ; preds = %229, %211
  br label %232

; <label>:232:                                    ; preds = %231, %129
  %233 = load i32, i32* %10, align 4
  %234 = icmp ne i32 %233, 0
  br i1 %234, label %235, label %239

; <label>:235:                                    ; preds = %232
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 3)
  %236 = add i64 %pgocount16, 1
  store i64 %236, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 3)
  %237 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %238 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %237, i32 0, i32 9
  store i32 1, i32* %238, align 8
  br label %239

; <label>:239:                                    ; preds = %235, %232
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 1)
  %240 = add i64 %pgocount17, 1
  store i64 %240, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_sarray, i64 0, i64 1)
  %241 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %242 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %241, i32 0, i32 0
  %243 = load i8**, i8*** %242, align 8
  %244 = load i32, i32* %8, align 4
  %245 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %7, align 8
  %246 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %245, i32 0, i32 6
  %247 = load i32, i32* %246, align 4
  %248 = sub i32 %244, %247
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds i8*, i8** %243, i64 %249
  ret i8** %250
}

; Function Attrs: noinline nounwind uwtable
define internal [64 x i16]** @access_virt_barray(%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32) #0 {
  %6 = alloca %struct.jpeg_common_struct*, align 8
  %7 = alloca %struct.jvirt_barray_control*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %6, align 8
  store %struct.jvirt_barray_control* %1, %struct.jvirt_barray_control** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %15 = load i32, i32* %8, align 4
  %16 = load i32, i32* %9, align 4
  %17 = add i32 %15, %16
  store i32 %17, i32* %11, align 4
  %18 = load i32, i32* %11, align 4
  %19 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %20 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %19, i32 0, i32 1
  %21 = load i32, i32* %20, align 8
  %22 = icmp ugt i32 %18, %21
  br i1 %22, label %36, label %23

; <label>:23:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 4)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 4)
  %25 = load i32, i32* %9, align 4
  %26 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %27 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %26, i32 0, i32 3
  %28 = load i32, i32* %27, align 8
  %29 = icmp ugt i32 %25, %28
  br i1 %29, label %36, label %30

; <label>:30:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 11)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 11)
  %32 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %33 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %32, i32 0, i32 0
  %34 = load [64 x i16]**, [64 x i16]*** %33, align 8
  %35 = icmp eq [64 x i16]** %34, null
  br i1 %35, label %36, label %50

; <label>:36:                                     ; preds = %30, %23, %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 2)
  %38 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %39 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 5
  store i32 20, i32* %41, align 8
  %42 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %43 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %42, i32 0, i32 0
  %44 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %44, i32 0, i32 0
  %46 = bitcast {}** %45 to void (%struct.jpeg_common_struct*)**
  %47 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %46, align 8
  %48 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %49 = ptrtoint void (%struct.jpeg_common_struct*)* %47 to i64
  call void @__llvm_profile_instrument_target(i64 %49, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_barray to i8*), i32 0)
  call void %47(%struct.jpeg_common_struct* %48)
  br label %50

; <label>:50:                                     ; preds = %36, %30
  %51 = load i32, i32* %8, align 4
  %52 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %53 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %52, i32 0, i32 6
  %54 = load i32, i32* %53, align 4
  %55 = icmp ult i32 %51, %54
  br i1 %55, label %67, label %56

; <label>:56:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 5)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 5)
  %58 = load i32, i32* %11, align 4
  %59 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %60 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %59, i32 0, i32 6
  %61 = load i32, i32* %60, align 4
  %62 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %63 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %62, i32 0, i32 4
  %64 = load i32, i32* %63, align 4
  %65 = add i32 %61, %64
  %66 = icmp ugt i32 %58, %65
  br i1 %66, label %67, label %129

; <label>:67:                                     ; preds = %56, %50
  %68 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %69 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %68, i32 0, i32 10
  %70 = load i32, i32* %69, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %86, label %72

; <label>:72:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 10)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 10)
  %74 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %75 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %74, i32 0, i32 0
  %76 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %77 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %76, i32 0, i32 5
  store i32 68, i32* %77, align 8
  %78 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %79 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 0
  %82 = bitcast {}** %81 to void (%struct.jpeg_common_struct*)**
  %83 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %82, align 8
  %84 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %85 = ptrtoint void (%struct.jpeg_common_struct*)* %83 to i64
  call void @__llvm_profile_instrument_target(i64 %85, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_barray to i8*), i32 1)
  call void %83(%struct.jpeg_common_struct* %84)
  br label %86

; <label>:86:                                     ; preds = %72, %67
  %87 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %88 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %87, i32 0, i32 9
  %89 = load i32, i32* %88, align 8
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %97

; <label>:91:                                     ; preds = %86
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 6)
  %92 = add i64 %pgocount5, 1
  store i64 %92, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 6)
  %93 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %94 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  call void @do_barray_io(%struct.jpeg_common_struct* %93, %struct.jvirt_barray_control* %94, i32 1)
  %95 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %96 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %95, i32 0, i32 9
  store i32 0, i32* %96, align 8
  br label %97

; <label>:97:                                     ; preds = %91, %86
  %98 = load i32, i32* %8, align 4
  %99 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %100 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %99, i32 0, i32 6
  %101 = load i32, i32* %100, align 4
  %102 = icmp ugt i32 %98, %101
  br i1 %102, label %103, label %108

; <label>:103:                                    ; preds = %97
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 7)
  %104 = add i64 %pgocount6, 1
  store i64 %104, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 7)
  %105 = load i32, i32* %8, align 4
  %106 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %107 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %106, i32 0, i32 6
  store i32 %105, i32* %107, align 4
  br label %126

; <label>:108:                                    ; preds = %97
  %109 = load i32, i32* %11, align 4
  %110 = zext i32 %109 to i64
  %111 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %112 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %111, i32 0, i32 4
  %113 = load i32, i32* %112, align 4
  %114 = zext i32 %113 to i64
  %115 = sub nsw i64 %110, %114
  store i64 %115, i64* %13, align 8
  %116 = load i64, i64* %13, align 8
  %117 = icmp slt i64 %116, 0
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %108
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 16)
  %119 = add i64 %pgocount7, 1
  store i64 %119, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 16)
  store i64 0, i64* %13, align 8
  br label %120

; <label>:120:                                    ; preds = %118, %108
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 8)
  %121 = add i64 %pgocount8, 1
  store i64 %121, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 8)
  %122 = load i64, i64* %13, align 8
  %123 = trunc i64 %122 to i32
  %124 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %125 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %124, i32 0, i32 6
  store i32 %123, i32* %125, align 4
  br label %126

; <label>:126:                                    ; preds = %120, %103
  %127 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %128 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  call void @do_barray_io(%struct.jpeg_common_struct* %127, %struct.jvirt_barray_control* %128, i32 0)
  br label %129

; <label>:129:                                    ; preds = %126, %56
  %130 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %131 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %130, i32 0, i32 7
  %132 = load i32, i32* %131, align 8
  %133 = load i32, i32* %11, align 4
  %134 = icmp ult i32 %132, %133
  br i1 %134, label %135, label %233

; <label>:135:                                    ; preds = %129
  %136 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %137 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %136, i32 0, i32 7
  %138 = load i32, i32* %137, align 8
  %139 = load i32, i32* %8, align 4
  %140 = icmp ult i32 %138, %139
  br i1 %140, label %141, label %161

; <label>:141:                                    ; preds = %135
  %142 = load i32, i32* %10, align 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %144, label %158

; <label>:144:                                    ; preds = %141
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 15)
  %145 = add i64 %pgocount9, 1
  store i64 %145, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 15)
  %146 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %147 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %146, i32 0, i32 0
  %148 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %147, align 8
  %149 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %148, i32 0, i32 5
  store i32 20, i32* %149, align 8
  %150 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %151 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %150, i32 0, i32 0
  %152 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %151, align 8
  %153 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %152, i32 0, i32 0
  %154 = bitcast {}** %153 to void (%struct.jpeg_common_struct*)**
  %155 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %154, align 8
  %156 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %157 = ptrtoint void (%struct.jpeg_common_struct*)* %155 to i64
  call void @__llvm_profile_instrument_target(i64 %157, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_barray to i8*), i32 2)
  call void %155(%struct.jpeg_common_struct* %156)
  br label %158

; <label>:158:                                    ; preds = %144, %141
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 12)
  %159 = add i64 %pgocount10, 1
  store i64 %159, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 12)
  %160 = load i32, i32* %8, align 4
  store i32 %160, i32* %12, align 4
  br label %166

; <label>:161:                                    ; preds = %135
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 13)
  %162 = add i64 %pgocount11, 1
  store i64 %162, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 13)
  %163 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %164 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %163, i32 0, i32 7
  %165 = load i32, i32* %164, align 8
  store i32 %165, i32* %12, align 4
  br label %166

; <label>:166:                                    ; preds = %161, %158
  %167 = load i32, i32* %10, align 4
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %169, label %174

; <label>:169:                                    ; preds = %166
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 9)
  %170 = add i64 %pgocount12, 1
  store i64 %170, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 9)
  %171 = load i32, i32* %11, align 4
  %172 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %173 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %172, i32 0, i32 7
  store i32 %171, i32* %173, align 8
  br label %174

; <label>:174:                                    ; preds = %169, %166
  %175 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %176 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %175, i32 0, i32 8
  %177 = load i32, i32* %176, align 4
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %179, label %213

; <label>:179:                                    ; preds = %174
  %180 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %181 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %180, i32 0, i32 2
  %182 = load i32, i32* %181, align 4
  %183 = zext i32 %182 to i64
  %184 = mul i64 %183, 128
  store i64 %184, i64* %14, align 8
  %185 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %186 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %185, i32 0, i32 6
  %187 = load i32, i32* %186, align 4
  %188 = load i32, i32* %12, align 4
  %189 = sub i32 %188, %187
  store i32 %189, i32* %12, align 4
  %190 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %191 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %190, i32 0, i32 6
  %192 = load i32, i32* %191, align 4
  %193 = load i32, i32* %11, align 4
  %194 = sub i32 %193, %192
  store i32 %194, i32* %11, align 4
  br label %195

; <label>:195:                                    ; preds = %199, %179
  %196 = load i32, i32* %12, align 4
  %197 = load i32, i32* %11, align 4
  %198 = icmp ult i32 %196, %197
  br i1 %198, label %199, label %212

; <label>:199:                                    ; preds = %195
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 0)
  %200 = add i64 %pgocount13, 1
  store i64 %200, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 0)
  %201 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %202 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %201, i32 0, i32 0
  %203 = load [64 x i16]**, [64 x i16]*** %202, align 8
  %204 = load i32, i32* %12, align 4
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds [64 x i16]*, [64 x i16]** %203, i64 %205
  %207 = load [64 x i16]*, [64 x i16]** %206, align 8
  %208 = bitcast [64 x i16]* %207 to i8*
  %209 = load i64, i64* %14, align 8
  call void @jzero_far(i8* %208, i64 %209)
  %210 = load i32, i32* %12, align 4
  %211 = add i32 %210, 1
  store i32 %211, i32* %12, align 4
  br label %195

; <label>:212:                                    ; preds = %195
  br label %232

; <label>:213:                                    ; preds = %174
  %214 = load i32, i32* %10, align 4
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %230, label %216

; <label>:216:                                    ; preds = %213
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 17)
  %217 = add i64 %pgocount14, 1
  store i64 %217, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 17)
  %218 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %219 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %218, i32 0, i32 0
  %220 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %219, align 8
  %221 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %220, i32 0, i32 5
  store i32 20, i32* %221, align 8
  %222 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %223 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %222, i32 0, i32 0
  %224 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %223, align 8
  %225 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %224, i32 0, i32 0
  %226 = bitcast {}** %225 to void (%struct.jpeg_common_struct*)**
  %227 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %226, align 8
  %228 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %6, align 8
  %229 = ptrtoint void (%struct.jpeg_common_struct*)* %227 to i64
  call void @__llvm_profile_instrument_target(i64 %229, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_access_virt_barray to i8*), i32 3)
  call void %227(%struct.jpeg_common_struct* %228)
  br label %230

; <label>:230:                                    ; preds = %216, %213
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 14)
  %231 = add i64 %pgocount15, 1
  store i64 %231, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 14)
  br label %232

; <label>:232:                                    ; preds = %230, %212
  br label %233

; <label>:233:                                    ; preds = %232, %129
  %234 = load i32, i32* %10, align 4
  %235 = icmp ne i32 %234, 0
  br i1 %235, label %236, label %240

; <label>:236:                                    ; preds = %233
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 3)
  %237 = add i64 %pgocount16, 1
  store i64 %237, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 3)
  %238 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %239 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %238, i32 0, i32 9
  store i32 1, i32* %239, align 8
  br label %240

; <label>:240:                                    ; preds = %236, %233
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 1)
  %241 = add i64 %pgocount17, 1
  store i64 %241, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_access_virt_barray, i64 0, i64 1)
  %242 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %243 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %242, i32 0, i32 0
  %244 = load [64 x i16]**, [64 x i16]*** %243, align 8
  %245 = load i32, i32* %8, align 4
  %246 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %7, align 8
  %247 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %246, i32 0, i32 6
  %248 = load i32, i32* %247, align 4
  %249 = sub i32 %245, %248
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds [64 x i16]*, [64 x i16]** %244, i64 %250
  ret [64 x i16]** %251
}

; Function Attrs: noinline nounwind uwtable
define internal void @free_pool(%struct.jpeg_common_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_common_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_memory_mgr*, align 8
  %6 = alloca %union.small_pool_struct*, align 8
  %7 = alloca %union.large_pool_struct*, align 8
  %8 = alloca i64, align 8
  %9 = alloca %struct.jvirt_sarray_control*, align 8
  %10 = alloca %struct.jvirt_barray_control*, align 8
  %11 = alloca %union.large_pool_struct*, align 8
  %12 = alloca %union.small_pool_struct*, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %13 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %14 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %13, i32 0, i32 1
  %15 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %14, align 8
  %16 = bitcast %struct.jpeg_memory_mgr* %15 to %struct.my_memory_mgr*
  store %struct.my_memory_mgr* %16, %struct.my_memory_mgr** %5, align 8
  %17 = load i32, i32* %4, align 4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %23, label %19

; <label>:19:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 8)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 8)
  %21 = load i32, i32* %4, align 4
  %22 = icmp sge i32 %21, 2
  br i1 %22, label %23, label %44

; <label>:23:                                     ; preds = %19, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 7)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 7)
  %25 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 5
  store i32 12, i32* %28, align 8
  %29 = load i32, i32* %4, align 4
  %30 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %30, i32 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i32 0, i32 6
  %34 = bitcast %union.anon* %33 to [8 x i32]*
  %35 = getelementptr inbounds [8 x i32], [8 x i32]* %34, i64 0, i64 0
  store i32 %29, i32* %35, align 4
  %36 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %36, i32 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i32 0, i32 0
  %40 = bitcast {}** %39 to void (%struct.jpeg_common_struct*)**
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  %42 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %43 = ptrtoint void (%struct.jpeg_common_struct*)* %41 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_free_pool to i8*), i32 0)
  call void %41(%struct.jpeg_common_struct* %42)
  br label %44

; <label>:44:                                     ; preds = %23, %19
  %45 = load i32, i32* %4, align 4
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %113

; <label>:47:                                     ; preds = %44
  %48 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %49 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %48, i32 0, i32 3
  %50 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %49, align 8
  store %struct.jvirt_sarray_control* %50, %struct.jvirt_sarray_control** %9, align 8
  br label %51

; <label>:51:                                     ; preds = %72, %47
  %52 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %53 = icmp ne %struct.jvirt_sarray_control* %52, null
  br i1 %53, label %54, label %77

; <label>:54:                                     ; preds = %51
  %55 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %56 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %55, i32 0, i32 10
  %57 = load i32, i32* %56, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %71

; <label>:59:                                     ; preds = %54
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 4)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 4)
  %61 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %62 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %61, i32 0, i32 10
  store i32 0, i32* %62, align 4
  %63 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %64 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %63, i32 0, i32 12
  %65 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %64, i32 0, i32 2
  %66 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)** %65, align 8
  %67 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %68 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %69 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %68, i32 0, i32 12
  %70 = ptrtoint void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)* %66 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_free_pool to i8*), i32 1)
  call void %66(%struct.jpeg_common_struct* %67, %struct.backing_store_struct* %69)
  br label %71

; <label>:71:                                     ; preds = %59, %54
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 2)
  %73 = add i64 %pgocount3, 1
  store i64 %73, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 2)
  %74 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %9, align 8
  %75 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %74, i32 0, i32 11
  %76 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %75, align 8
  store %struct.jvirt_sarray_control* %76, %struct.jvirt_sarray_control** %9, align 8
  br label %51

; <label>:77:                                     ; preds = %51
  %78 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %79 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %78, i32 0, i32 3
  store %struct.jvirt_sarray_control* null, %struct.jvirt_sarray_control** %79, align 8
  %80 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %81 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %80, i32 0, i32 4
  %82 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %81, align 8
  store %struct.jvirt_barray_control* %82, %struct.jvirt_barray_control** %10, align 8
  br label %83

; <label>:83:                                     ; preds = %104, %77
  %84 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %85 = icmp ne %struct.jvirt_barray_control* %84, null
  br i1 %85, label %86, label %109

; <label>:86:                                     ; preds = %83
  %87 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %88 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %87, i32 0, i32 10
  %89 = load i32, i32* %88, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %103

; <label>:91:                                     ; preds = %86
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 5)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 5)
  %93 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %94 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %93, i32 0, i32 10
  store i32 0, i32* %94, align 4
  %95 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %96 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %95, i32 0, i32 12
  %97 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %96, i32 0, i32 2
  %98 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)** %97, align 8
  %99 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %100 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %101 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %100, i32 0, i32 12
  %102 = ptrtoint void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)* %98 to i64
  call void @__llvm_profile_instrument_target(i64 %102, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_free_pool to i8*), i32 2)
  call void %98(%struct.jpeg_common_struct* %99, %struct.backing_store_struct* %101)
  br label %103

; <label>:103:                                    ; preds = %91, %86
  br label %104

; <label>:104:                                    ; preds = %103
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 3)
  %105 = add i64 %pgocount5, 1
  store i64 %105, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 3)
  %106 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %10, align 8
  %107 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %106, i32 0, i32 11
  %108 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %107, align 8
  store %struct.jvirt_barray_control* %108, %struct.jvirt_barray_control** %10, align 8
  br label %83

; <label>:109:                                    ; preds = %83
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 9)
  %110 = add i64 %pgocount6, 1
  store i64 %110, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 9)
  %111 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %112 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %111, i32 0, i32 4
  store %struct.jvirt_barray_control* null, %struct.jvirt_barray_control** %112, align 8
  br label %113

; <label>:113:                                    ; preds = %109, %44
  %114 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %115 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %114, i32 0, i32 2
  %116 = load i32, i32* %4, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [2 x %union.large_pool_struct*], [2 x %union.large_pool_struct*]* %115, i64 0, i64 %117
  %119 = load %union.large_pool_struct*, %union.large_pool_struct** %118, align 8
  store %union.large_pool_struct* %119, %union.large_pool_struct** %7, align 8
  %120 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %121 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %120, i32 0, i32 2
  %122 = load i32, i32* %4, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [2 x %union.large_pool_struct*], [2 x %union.large_pool_struct*]* %121, i64 0, i64 %123
  store %union.large_pool_struct* null, %union.large_pool_struct** %124, align 8
  br label %125

; <label>:125:                                    ; preds = %128, %113
  %126 = load %union.large_pool_struct*, %union.large_pool_struct** %7, align 8
  %127 = icmp ne %union.large_pool_struct* %126, null
  br i1 %127, label %128, label %154

; <label>:128:                                    ; preds = %125
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 0)
  %129 = add i64 %pgocount7, 1
  store i64 %129, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 0)
  %130 = load %union.large_pool_struct*, %union.large_pool_struct** %7, align 8
  %131 = bitcast %union.large_pool_struct* %130 to %struct.anon.0*
  %132 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %131, i32 0, i32 0
  %133 = load %union.large_pool_struct*, %union.large_pool_struct** %132, align 8
  store %union.large_pool_struct* %133, %union.large_pool_struct** %11, align 8
  %134 = load %union.large_pool_struct*, %union.large_pool_struct** %7, align 8
  %135 = bitcast %union.large_pool_struct* %134 to %struct.anon.0*
  %136 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %135, i32 0, i32 1
  %137 = load i64, i64* %136, align 8
  %138 = load %union.large_pool_struct*, %union.large_pool_struct** %7, align 8
  %139 = bitcast %union.large_pool_struct* %138 to %struct.anon.0*
  %140 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %139, i32 0, i32 2
  %141 = load i64, i64* %140, align 8
  %142 = add i64 %137, %141
  %143 = add i64 %142, 24
  store i64 %143, i64* %8, align 8
  %144 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %145 = load %union.large_pool_struct*, %union.large_pool_struct** %7, align 8
  %146 = bitcast %union.large_pool_struct* %145 to i8*
  %147 = load i64, i64* %8, align 8
  call void @jpeg_free_large(%struct.jpeg_common_struct* %144, i8* %146, i64 %147)
  %148 = load i64, i64* %8, align 8
  %149 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %150 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %149, i32 0, i32 5
  %151 = load i64, i64* %150, align 8
  %152 = sub i64 %151, %148
  store i64 %152, i64* %150, align 8
  %153 = load %union.large_pool_struct*, %union.large_pool_struct** %11, align 8
  store %union.large_pool_struct* %153, %union.large_pool_struct** %7, align 8
  br label %125

; <label>:154:                                    ; preds = %125
  %155 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %156 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %155, i32 0, i32 1
  %157 = load i32, i32* %4, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [2 x %union.small_pool_struct*], [2 x %union.small_pool_struct*]* %156, i64 0, i64 %158
  %160 = load %union.small_pool_struct*, %union.small_pool_struct** %159, align 8
  store %union.small_pool_struct* %160, %union.small_pool_struct** %6, align 8
  %161 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %162 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %161, i32 0, i32 1
  %163 = load i32, i32* %4, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [2 x %union.small_pool_struct*], [2 x %union.small_pool_struct*]* %162, i64 0, i64 %164
  store %union.small_pool_struct* null, %union.small_pool_struct** %165, align 8
  br label %166

; <label>:166:                                    ; preds = %169, %154
  %167 = load %union.small_pool_struct*, %union.small_pool_struct** %6, align 8
  %168 = icmp ne %union.small_pool_struct* %167, null
  br i1 %168, label %169, label %195

; <label>:169:                                    ; preds = %166
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 1)
  %170 = add i64 %pgocount8, 1
  store i64 %170, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 1)
  %171 = load %union.small_pool_struct*, %union.small_pool_struct** %6, align 8
  %172 = bitcast %union.small_pool_struct* %171 to %struct.anon*
  %173 = getelementptr inbounds %struct.anon, %struct.anon* %172, i32 0, i32 0
  %174 = load %union.small_pool_struct*, %union.small_pool_struct** %173, align 8
  store %union.small_pool_struct* %174, %union.small_pool_struct** %12, align 8
  %175 = load %union.small_pool_struct*, %union.small_pool_struct** %6, align 8
  %176 = bitcast %union.small_pool_struct* %175 to %struct.anon*
  %177 = getelementptr inbounds %struct.anon, %struct.anon* %176, i32 0, i32 1
  %178 = load i64, i64* %177, align 8
  %179 = load %union.small_pool_struct*, %union.small_pool_struct** %6, align 8
  %180 = bitcast %union.small_pool_struct* %179 to %struct.anon*
  %181 = getelementptr inbounds %struct.anon, %struct.anon* %180, i32 0, i32 2
  %182 = load i64, i64* %181, align 8
  %183 = add i64 %178, %182
  %184 = add i64 %183, 24
  store i64 %184, i64* %8, align 8
  %185 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %3, align 8
  %186 = load %union.small_pool_struct*, %union.small_pool_struct** %6, align 8
  %187 = bitcast %union.small_pool_struct* %186 to i8*
  %188 = load i64, i64* %8, align 8
  call void @jpeg_free_small(%struct.jpeg_common_struct* %185, i8* %187, i64 %188)
  %189 = load i64, i64* %8, align 8
  %190 = load %struct.my_memory_mgr*, %struct.my_memory_mgr** %5, align 8
  %191 = getelementptr inbounds %struct.my_memory_mgr, %struct.my_memory_mgr* %190, i32 0, i32 5
  %192 = load i64, i64* %191, align 8
  %193 = sub i64 %192, %189
  store i64 %193, i64* %191, align 8
  %194 = load %union.small_pool_struct*, %union.small_pool_struct** %12, align 8
  store %union.small_pool_struct* %194, %union.small_pool_struct** %6, align 8
  br label %166

; <label>:195:                                    ; preds = %166
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 6)
  %196 = add i64 %pgocount9, 1
  store i64 %196, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_tmp1.ll_free_pool, i64 0, i64 6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @self_destruct(%struct.jpeg_common_struct*) #0 {
  %2 = alloca %struct.jpeg_common_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %2, align 8
  store i32 1, i32* %3, align 4
  br label %4

; <label>:4:                                      ; preds = %10, %1
  %5 = load i32, i32* %3, align 4
  %6 = icmp sge i32 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %4
  %8 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %9 = load i32, i32* %3, align 4
  call void @free_pool(%struct.jpeg_common_struct* %8, i32 %9)
  br label %10

; <label>:10:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_self_destruct, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_self_destruct, i64 0, i64 0)
  %12 = load i32, i32* %3, align 4
  %13 = add nsw i32 %12, -1
  store i32 %13, i32* %3, align 4
  br label %4

; <label>:14:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_self_destruct, i64 0, i64 1)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_self_destruct, i64 0, i64 1)
  %16 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %17 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %17, i32 0, i32 1
  %19 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %18, align 8
  %20 = bitcast %struct.jpeg_memory_mgr* %19 to i8*
  call void @jpeg_free_small(%struct.jpeg_common_struct* %16, i8* %20, i64 160)
  %21 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %21, i32 0, i32 1
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %22, align 8
  %23 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %2, align 8
  call void @jpeg_mem_term(%struct.jpeg_common_struct* %23)
  ret void
}

; Function Attrs: nounwind
declare i8* @getenv(i8*) #2

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @out_of_memory(%struct.jpeg_common_struct*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_out_of_memory, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_out_of_memory, i64 0, i64 0)
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca i32, align 4
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %7 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %6, i32 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i32 0, i32 5
  store i32 53, i32* %9, align 8
  %10 = load i32, i32* %5, align 4
  %11 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %12 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %11, i32 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i32 0, i32 6
  %15 = bitcast %union.anon* %14 to [8 x i32]*
  %16 = getelementptr inbounds [8 x i32], [8 x i32]* %15, i64 0, i64 0
  store i32 %10, i32* %16, align 4
  %17 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %18 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %17, i32 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i32 0, i32 0
  %21 = bitcast {}** %20 to void (%struct.jpeg_common_struct*)**
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %24 = ptrtoint void (%struct.jpeg_common_struct*)* %22 to i64
  call void @__llvm_profile_instrument_target(i64 %24, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_out_of_memory to i8*), i32 0)
  call void %22(%struct.jpeg_common_struct* %23)
  ret void
}

declare i8* @jpeg_get_large(%struct.jpeg_common_struct*, i64) #1

declare i64 @jpeg_mem_available(%struct.jpeg_common_struct*, i64, i64, i64) #1

declare void @jpeg_open_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal void @do_sarray_io(%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32) #0 {
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca %struct.jvirt_sarray_control*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store %struct.jvirt_sarray_control* %1, %struct.jvirt_sarray_control** %5, align 8
  store i32 %2, i32* %6, align 4
  %13 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %14 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %13, i32 0, i32 2
  %15 = load i32, i32* %14, align 4
  %16 = zext i32 %15 to i64
  %17 = mul i64 %16, 1
  store i64 %17, i64* %7, align 8
  %18 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %19 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %18, i32 0, i32 6
  %20 = load i32, i32* %19, align 4
  %21 = zext i32 %20 to i64
  %22 = load i64, i64* %7, align 8
  %23 = mul nsw i64 %21, %22
  store i64 %23, i64* %8, align 8
  store i64 0, i64* %12, align 8
  br label %24

; <label>:24:                                     ; preds = %154, %3
  %25 = load i64, i64* %12, align 8
  %26 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %27 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %26, i32 0, i32 4
  %28 = load i32, i32* %27, align 4
  %29 = zext i32 %28 to i64
  %30 = icmp slt i64 %25, %29
  br i1 %30, label %31, label %161

; <label>:31:                                     ; preds = %24
  %32 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %33 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %32, i32 0, i32 5
  %34 = load i32, i32* %33, align 8
  %35 = zext i32 %34 to i64
  %36 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %37 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %36, i32 0, i32 4
  %38 = load i32, i32* %37, align 4
  %39 = zext i32 %38 to i64
  %40 = load i64, i64* %12, align 8
  %41 = sub nsw i64 %39, %40
  %42 = icmp slt i64 %35, %41
  br i1 %42, label %43, label %48

; <label>:43:                                     ; preds = %31
  %44 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %45 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %44, i32 0, i32 5
  %46 = load i32, i32* %45, align 8
  %47 = zext i32 %46 to i64
  br label %56

; <label>:48:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 0)
  %49 = add i64 %pgocount, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 0)
  %50 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %51 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %50, i32 0, i32 4
  %52 = load i32, i32* %51, align 4
  %53 = zext i32 %52 to i64
  %54 = load i64, i64* %12, align 8
  %55 = sub nsw i64 %53, %54
  br label %56

; <label>:56:                                     ; preds = %48, %43
  %57 = phi i64 [ %47, %43 ], [ %55, %48 ]
  store i64 %57, i64* %10, align 8
  %58 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %59 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %58, i32 0, i32 6
  %60 = load i32, i32* %59, align 4
  %61 = zext i32 %60 to i64
  %62 = load i64, i64* %12, align 8
  %63 = add nsw i64 %61, %62
  store i64 %63, i64* %11, align 8
  %64 = load i64, i64* %10, align 8
  %65 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %66 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %65, i32 0, i32 7
  %67 = load i32, i32* %66, align 8
  %68 = zext i32 %67 to i64
  %69 = load i64, i64* %11, align 8
  %70 = sub nsw i64 %68, %69
  %71 = icmp slt i64 %64, %70
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %56
  %73 = load i64, i64* %10, align 8
  br label %82

; <label>:74:                                     ; preds = %56
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 1)
  %75 = add i64 %pgocount1, 1
  store i64 %75, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 1)
  %76 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %77 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %76, i32 0, i32 7
  %78 = load i32, i32* %77, align 8
  %79 = zext i32 %78 to i64
  %80 = load i64, i64* %11, align 8
  %81 = sub nsw i64 %79, %80
  br label %82

; <label>:82:                                     ; preds = %74, %72
  %83 = phi i64 [ %73, %72 ], [ %81, %74 ]
  store i64 %83, i64* %10, align 8
  %84 = load i64, i64* %10, align 8
  %85 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %86 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %85, i32 0, i32 1
  %87 = load i32, i32* %86, align 8
  %88 = zext i32 %87 to i64
  %89 = load i64, i64* %11, align 8
  %90 = sub nsw i64 %88, %89
  %91 = icmp slt i64 %84, %90
  br i1 %91, label %92, label %95

; <label>:92:                                     ; preds = %82
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 2)
  %93 = add i64 %pgocount2, 1
  store i64 %93, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 2)
  %94 = load i64, i64* %10, align 8
  br label %103

; <label>:95:                                     ; preds = %82
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 3)
  %96 = add i64 %pgocount3, 1
  store i64 %96, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 3)
  %97 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %98 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %97, i32 0, i32 1
  %99 = load i32, i32* %98, align 8
  %100 = zext i32 %99 to i64
  %101 = load i64, i64* %11, align 8
  %102 = sub nsw i64 %100, %101
  br label %103

; <label>:103:                                    ; preds = %95, %92
  %104 = phi i64 [ %94, %92 ], [ %102, %95 ]
  store i64 %104, i64* %10, align 8
  %105 = load i64, i64* %10, align 8
  %106 = icmp sle i64 %105, 0
  br i1 %106, label %107, label %109

; <label>:107:                                    ; preds = %103
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 6)
  %108 = add i64 %pgocount4, 1
  store i64 %108, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 6)
  br label %161

; <label>:109:                                    ; preds = %103
  %110 = load i64, i64* %10, align 8
  %111 = load i64, i64* %7, align 8
  %112 = mul nsw i64 %110, %111
  store i64 %112, i64* %9, align 8
  %113 = load i32, i32* %6, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %132

; <label>:115:                                    ; preds = %109
  %116 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %117 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %116, i32 0, i32 12
  %118 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %117, i32 0, i32 1
  %119 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %118, align 8
  %120 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %121 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %122 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %121, i32 0, i32 12
  %123 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %124 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %123, i32 0, i32 0
  %125 = load i8**, i8*** %124, align 8
  %126 = load i64, i64* %12, align 8
  %127 = getelementptr inbounds i8*, i8** %125, i64 %126
  %128 = load i8*, i8** %127, align 8
  %129 = load i64, i64* %8, align 8
  %130 = load i64, i64* %9, align 8
  %131 = ptrtoint void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* %119 to i64
  call void @__llvm_profile_instrument_target(i64 %131, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_sarray_io to i8*), i32 0)
  call void %119(%struct.jpeg_common_struct* %120, %struct.backing_store_struct* %122, i8* %128, i64 %129, i64 %130)
  br label %150

; <label>:132:                                    ; preds = %109
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 4)
  %133 = add i64 %pgocount5, 1
  store i64 %133, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 4)
  %134 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %135 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %134, i32 0, i32 12
  %136 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %135, i32 0, i32 0
  %137 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %136, align 8
  %138 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %139 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %140 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %139, i32 0, i32 12
  %141 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %142 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %141, i32 0, i32 0
  %143 = load i8**, i8*** %142, align 8
  %144 = load i64, i64* %12, align 8
  %145 = getelementptr inbounds i8*, i8** %143, i64 %144
  %146 = load i8*, i8** %145, align 8
  %147 = load i64, i64* %8, align 8
  %148 = load i64, i64* %9, align 8
  %149 = ptrtoint void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* %137 to i64
  call void @__llvm_profile_instrument_target(i64 %149, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_sarray_io to i8*), i32 1)
  call void %137(%struct.jpeg_common_struct* %138, %struct.backing_store_struct* %140, i8* %146, i64 %147, i64 %148)
  br label %150

; <label>:150:                                    ; preds = %132, %115
  %151 = load i64, i64* %9, align 8
  %152 = load i64, i64* %8, align 8
  %153 = add nsw i64 %152, %151
  store i64 %153, i64* %8, align 8
  br label %154

; <label>:154:                                    ; preds = %150
  %155 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %5, align 8
  %156 = getelementptr inbounds %struct.jvirt_sarray_control, %struct.jvirt_sarray_control* %155, i32 0, i32 5
  %157 = load i32, i32* %156, align 8
  %158 = zext i32 %157 to i64
  %159 = load i64, i64* %12, align 8
  %160 = add nsw i64 %159, %158
  store i64 %160, i64* %12, align 8
  br label %24

; <label>:161:                                    ; preds = %107, %24
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 5)
  %162 = add i64 %pgocount6, 1
  store i64 %162, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_sarray_io, i64 0, i64 5)
  ret void
}

declare void @jzero_far(i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal void @do_barray_io(%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32) #0 {
  %4 = alloca %struct.jpeg_common_struct*, align 8
  %5 = alloca %struct.jvirt_barray_control*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store %struct.jpeg_common_struct* %0, %struct.jpeg_common_struct** %4, align 8
  store %struct.jvirt_barray_control* %1, %struct.jvirt_barray_control** %5, align 8
  store i32 %2, i32* %6, align 4
  %13 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %14 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %13, i32 0, i32 2
  %15 = load i32, i32* %14, align 4
  %16 = zext i32 %15 to i64
  %17 = mul i64 %16, 128
  store i64 %17, i64* %7, align 8
  %18 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %19 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %18, i32 0, i32 6
  %20 = load i32, i32* %19, align 4
  %21 = zext i32 %20 to i64
  %22 = load i64, i64* %7, align 8
  %23 = mul nsw i64 %21, %22
  store i64 %23, i64* %8, align 8
  store i64 0, i64* %12, align 8
  br label %24

; <label>:24:                                     ; preds = %156, %3
  %25 = load i64, i64* %12, align 8
  %26 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %27 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %26, i32 0, i32 4
  %28 = load i32, i32* %27, align 4
  %29 = zext i32 %28 to i64
  %30 = icmp slt i64 %25, %29
  br i1 %30, label %31, label %163

; <label>:31:                                     ; preds = %24
  %32 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %33 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %32, i32 0, i32 5
  %34 = load i32, i32* %33, align 8
  %35 = zext i32 %34 to i64
  %36 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %37 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %36, i32 0, i32 4
  %38 = load i32, i32* %37, align 4
  %39 = zext i32 %38 to i64
  %40 = load i64, i64* %12, align 8
  %41 = sub nsw i64 %39, %40
  %42 = icmp slt i64 %35, %41
  br i1 %42, label %43, label %48

; <label>:43:                                     ; preds = %31
  %44 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %45 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %44, i32 0, i32 5
  %46 = load i32, i32* %45, align 8
  %47 = zext i32 %46 to i64
  br label %56

; <label>:48:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 0)
  %49 = add i64 %pgocount, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 0)
  %50 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %51 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %50, i32 0, i32 4
  %52 = load i32, i32* %51, align 4
  %53 = zext i32 %52 to i64
  %54 = load i64, i64* %12, align 8
  %55 = sub nsw i64 %53, %54
  br label %56

; <label>:56:                                     ; preds = %48, %43
  %57 = phi i64 [ %47, %43 ], [ %55, %48 ]
  store i64 %57, i64* %10, align 8
  %58 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %59 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %58, i32 0, i32 6
  %60 = load i32, i32* %59, align 4
  %61 = zext i32 %60 to i64
  %62 = load i64, i64* %12, align 8
  %63 = add nsw i64 %61, %62
  store i64 %63, i64* %11, align 8
  %64 = load i64, i64* %10, align 8
  %65 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %66 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %65, i32 0, i32 7
  %67 = load i32, i32* %66, align 8
  %68 = zext i32 %67 to i64
  %69 = load i64, i64* %11, align 8
  %70 = sub nsw i64 %68, %69
  %71 = icmp slt i64 %64, %70
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %56
  %73 = load i64, i64* %10, align 8
  br label %82

; <label>:74:                                     ; preds = %56
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 1)
  %75 = add i64 %pgocount1, 1
  store i64 %75, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 1)
  %76 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %77 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %76, i32 0, i32 7
  %78 = load i32, i32* %77, align 8
  %79 = zext i32 %78 to i64
  %80 = load i64, i64* %11, align 8
  %81 = sub nsw i64 %79, %80
  br label %82

; <label>:82:                                     ; preds = %74, %72
  %83 = phi i64 [ %73, %72 ], [ %81, %74 ]
  store i64 %83, i64* %10, align 8
  %84 = load i64, i64* %10, align 8
  %85 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %86 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %85, i32 0, i32 1
  %87 = load i32, i32* %86, align 8
  %88 = zext i32 %87 to i64
  %89 = load i64, i64* %11, align 8
  %90 = sub nsw i64 %88, %89
  %91 = icmp slt i64 %84, %90
  br i1 %91, label %92, label %95

; <label>:92:                                     ; preds = %82
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 2)
  %93 = add i64 %pgocount2, 1
  store i64 %93, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 2)
  %94 = load i64, i64* %10, align 8
  br label %103

; <label>:95:                                     ; preds = %82
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 3)
  %96 = add i64 %pgocount3, 1
  store i64 %96, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 3)
  %97 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %98 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %97, i32 0, i32 1
  %99 = load i32, i32* %98, align 8
  %100 = zext i32 %99 to i64
  %101 = load i64, i64* %11, align 8
  %102 = sub nsw i64 %100, %101
  br label %103

; <label>:103:                                    ; preds = %95, %92
  %104 = phi i64 [ %94, %92 ], [ %102, %95 ]
  store i64 %104, i64* %10, align 8
  %105 = load i64, i64* %10, align 8
  %106 = icmp sle i64 %105, 0
  br i1 %106, label %107, label %109

; <label>:107:                                    ; preds = %103
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 6)
  %108 = add i64 %pgocount4, 1
  store i64 %108, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 6)
  br label %163

; <label>:109:                                    ; preds = %103
  %110 = load i64, i64* %10, align 8
  %111 = load i64, i64* %7, align 8
  %112 = mul nsw i64 %110, %111
  store i64 %112, i64* %9, align 8
  %113 = load i32, i32* %6, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %133

; <label>:115:                                    ; preds = %109
  %116 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %117 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %116, i32 0, i32 12
  %118 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %117, i32 0, i32 1
  %119 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %118, align 8
  %120 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %121 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %122 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %121, i32 0, i32 12
  %123 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %124 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %123, i32 0, i32 0
  %125 = load [64 x i16]**, [64 x i16]*** %124, align 8
  %126 = load i64, i64* %12, align 8
  %127 = getelementptr inbounds [64 x i16]*, [64 x i16]** %125, i64 %126
  %128 = load [64 x i16]*, [64 x i16]** %127, align 8
  %129 = bitcast [64 x i16]* %128 to i8*
  %130 = load i64, i64* %8, align 8
  %131 = load i64, i64* %9, align 8
  %132 = ptrtoint void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* %119 to i64
  call void @__llvm_profile_instrument_target(i64 %132, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_barray_io to i8*), i32 0)
  call void %119(%struct.jpeg_common_struct* %120, %struct.backing_store_struct* %122, i8* %129, i64 %130, i64 %131)
  br label %152

; <label>:133:                                    ; preds = %109
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 4)
  %134 = add i64 %pgocount5, 1
  store i64 %134, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 4)
  %135 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %136 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %135, i32 0, i32 12
  %137 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %136, i32 0, i32 0
  %138 = load void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %137, align 8
  %139 = load %struct.jpeg_common_struct*, %struct.jpeg_common_struct** %4, align 8
  %140 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %141 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %140, i32 0, i32 12
  %142 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %143 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %142, i32 0, i32 0
  %144 = load [64 x i16]**, [64 x i16]*** %143, align 8
  %145 = load i64, i64* %12, align 8
  %146 = getelementptr inbounds [64 x i16]*, [64 x i16]** %144, i64 %145
  %147 = load [64 x i16]*, [64 x i16]** %146, align 8
  %148 = bitcast [64 x i16]* %147 to i8*
  %149 = load i64, i64* %8, align 8
  %150 = load i64, i64* %9, align 8
  %151 = ptrtoint void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* %138 to i64
  call void @__llvm_profile_instrument_target(i64 %151, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_do_barray_io to i8*), i32 1)
  call void %138(%struct.jpeg_common_struct* %139, %struct.backing_store_struct* %141, i8* %148, i64 %149, i64 %150)
  br label %152

; <label>:152:                                    ; preds = %133, %115
  %153 = load i64, i64* %9, align 8
  %154 = load i64, i64* %8, align 8
  %155 = add nsw i64 %154, %153
  store i64 %155, i64* %8, align 8
  br label %156

; <label>:156:                                    ; preds = %152
  %157 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %5, align 8
  %158 = getelementptr inbounds %struct.jvirt_barray_control, %struct.jvirt_barray_control* %157, i32 0, i32 5
  %159 = load i32, i32* %158, align 8
  %160 = zext i32 %159 to i64
  %161 = load i64, i64* %12, align 8
  %162 = add nsw i64 %161, %160
  store i64 %162, i64* %12, align 8
  br label %24

; <label>:163:                                    ; preds = %107, %24
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 5)
  %164 = add i64 %pgocount6, 1
  store i64 %164, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_do_barray_io, i64 0, i64 5)
  ret void
}

declare void @jpeg_free_large(%struct.jpeg_common_struct*, i8*, i64) #1

declare void @jpeg_free_small(%struct.jpeg_common_struct*, i8*, i64) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
