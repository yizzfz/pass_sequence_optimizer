; ModuleID = 'jcsample.2.ll'
source_filename = "jcsample.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_compress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_destination_mgr*, i32, i32, i32, i32, double, i32, i32, i32, %struct.jpeg_component_info*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], [16 x i8], [16 x i8], [16 x i8], i32, %struct.jpeg_scan_info*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i16, i16, i32, i32, i32, i32, i32, i32, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, %struct.jpeg_comp_master*, %struct.jpeg_c_main_controller*, %struct.jpeg_c_prep_controller*, %struct.jpeg_c_coef_controller*, %struct.jpeg_marker_writer*, %struct.jpeg_color_converter*, %struct.jpeg_downsampler*, %struct.jpeg_forward_dct*, %struct.jpeg_entropy_encoder* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_destination_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_compress_struct*)*, {}* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { {}*, {}*, {}*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, {}*, {}*, {}*, {}*, {}* }
%struct.jpeg_color_converter = type { {}*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { {}*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { {}*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, {}* }
%struct.my_downsampler = type { %struct.jpeg_downsampler, [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_downsampler = private constant [17 x i8] c"jinit_downsampler"
@__profn_tmp1.ll_start_pass_downsample = private constant [29 x i8] c"tmp1.ll:start_pass_downsample"
@__profn_tmp1.ll_sep_downsample = private constant [22 x i8] c"tmp1.ll:sep_downsample"
@__profn_tmp1.ll_fullsize_smooth_downsample = private constant [34 x i8] c"tmp1.ll:fullsize_smooth_downsample"
@__profn_tmp1.ll_fullsize_downsample = private constant [27 x i8] c"tmp1.ll:fullsize_downsample"
@__profn_tmp1.ll_h2v1_downsample = private constant [23 x i8] c"tmp1.ll:h2v1_downsample"
@__profn_tmp1.ll_h2v2_smooth_downsample = private constant [30 x i8] c"tmp1.ll:h2v2_smooth_downsample"
@__profn_tmp1.ll_h2v2_downsample = private constant [23 x i8] c"tmp1.ll:h2v2_downsample"
@__profn_tmp1.ll_int_downsample = private constant [22 x i8] c"tmp1.ll:int_downsample"
@__profn_tmp1.ll_expand_right_edge = private constant [25 x i8] c"tmp1.ll:expand_right_edge"
@__profc_jinit_downsampler = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_downsampler = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_downsampler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 317715948077395767, i64 1126102938796602, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jinit_downsampler to i8*), i8* bitcast ([4 x i64]* @__profvp_jinit_downsampler to i8*), i32 15, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_downsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_pass_downsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3148556734717493824, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_downsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @start_pass_downsample to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_sep_downsample = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_sep_downsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_sep_downsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8600617651541077830, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sep_downsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)* @sep_downsample to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_sep_downsample to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fullsize_smooth_downsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fullsize_smooth_downsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -110097660384273344, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fullsize_smooth_downsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @fullsize_smooth_downsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fullsize_downsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fullsize_downsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9150262258091636808, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fullsize_downsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @fullsize_downsample to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v1_downsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v1_downsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2908954665823502392, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_downsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v1_downsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v2_smooth_downsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v2_smooth_downsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7066799132833595895, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_smooth_downsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v2_smooth_downsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v2_downsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v2_downsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2855816844749104792, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_downsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v2_downsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_int_downsample = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_int_downsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5511174064155553832, i64 96618552840, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @int_downsample to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_expand_right_edge = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_expand_right_edge = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5817643029939627609, i64 64754353256, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [264 x i8] c"\85\02\00jinit_downsampler\01tmp1.ll:start_pass_downsample\01tmp1.ll:sep_downsample\01tmp1.ll:fullsize_smooth_downsample\01tmp1.ll:fullsize_downsample\01tmp1.ll:h2v1_downsample\01tmp1.ll:h2v2_smooth_downsample\01tmp1.ll:h2v2_downsample\01tmp1.ll:int_downsample\01tmp1.ll:expand_right_edge", section "__llvm_prf_names"
@llvm.used = appending global [12 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_downsampler to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_downsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sep_downsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fullsize_smooth_downsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fullsize_downsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v1_downsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v2_smooth_downsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v2_downsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_int_downsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_expand_right_edge to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([264 x i8], [264 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_downsampler(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_downsampler*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_component_info*, align 8
  %6 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  store i32 1, i32* %6, align 4
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %7, i32 0, i32 1
  %9 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %9, i32 0, i32 0
  %11 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %10, align 8
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %13 = bitcast %struct.jpeg_compress_struct* %12 to %struct.jpeg_common_struct*
  %14 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %11 to i64
  call void @__llvm_profile_instrument_target(i64 %14, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_downsampler to i8*), i32 0)
  %15 = call i8* %11(%struct.jpeg_common_struct* %13, i32 1, i64 104)
  %16 = bitcast i8* %15 to %struct.my_downsampler*
  store %struct.my_downsampler* %16, %struct.my_downsampler** %3, align 8
  %17 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %18 = bitcast %struct.my_downsampler* %17 to %struct.jpeg_downsampler*
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 57
  store %struct.jpeg_downsampler* %18, %struct.jpeg_downsampler** %20, align 8
  %21 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %22 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %22, i32 0, i32 0
  %24 = bitcast {}** %23 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @start_pass_downsample, void (%struct.jpeg_compress_struct*)** %24, align 8
  %25 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %26 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %26, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)* @sep_downsample, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)** %27, align 8
  %28 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %29 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %28, i32 0, i32 0
  %30 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %29, i32 0, i32 2
  store i32 0, i32* %30, align 8
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %31, i32 0, i32 26
  %33 = load i32, i32* %32, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %49

; <label>:35:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 12)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 12)
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i32 0, i32 5
  store i32 23, i32* %40, align 8
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 0
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %47 = bitcast %struct.jpeg_compress_struct* %46 to %struct.jpeg_common_struct*
  %48 = ptrtoint void (%struct.jpeg_common_struct*)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %48, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_downsampler to i8*), i32 1)
  call void %45(%struct.jpeg_common_struct* %47)
  br label %49

; <label>:49:                                     ; preds = %35, %1
  store i32 0, i32* %4, align 4
  %50 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %50, i32 0, i32 14
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %51, align 8
  store %struct.jpeg_component_info* %52, %struct.jpeg_component_info** %5, align 8
  br label %53

; <label>:53:                                     ; preds = %210, %49
  %54 = load i32, i32* %4, align 4
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 12
  %57 = load i32, i32* %56, align 4
  %58 = icmp slt i32 %54, %57
  br i1 %58, label %59, label %215

; <label>:59:                                     ; preds = %53
  %60 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %61 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %60, i32 0, i32 2
  %62 = load i32, i32* %61, align 8
  %63 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %63, i32 0, i32 38
  %65 = load i32, i32* %64, align 8
  %66 = icmp eq i32 %62, %65
  br i1 %66, label %67, label %99

; <label>:67:                                     ; preds = %59
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 0)
  %68 = add i64 %pgocount1, 1
  store i64 %68, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 0)
  %69 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %70 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %69, i32 0, i32 3
  %71 = load i32, i32* %70, align 4
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %72, i32 0, i32 39
  %74 = load i32, i32* %73, align 4
  %75 = icmp eq i32 %71, %74
  br i1 %75, label %76, label %99

; <label>:76:                                     ; preds = %67
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %77, i32 0, i32 27
  %79 = load i32, i32* %78, align 8
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %91

; <label>:81:                                     ; preds = %76
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 6)
  %82 = add i64 %pgocount2, 1
  store i64 %82, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 6)
  %83 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %84 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %83, i32 0, i32 1
  %85 = load i32, i32* %4, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %84, i64 0, i64 %86
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @fullsize_smooth_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %87, align 8
  %88 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %89 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %88, i32 0, i32 0
  %90 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %89, i32 0, i32 2
  store i32 1, i32* %90, align 8
  br label %98

; <label>:91:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 7)
  %92 = add i64 %pgocount3, 1
  store i64 %92, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 7)
  %93 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %94 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %93, i32 0, i32 1
  %95 = load i32, i32* %4, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %94, i64 0, i64 %96
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @fullsize_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %97, align 8
  br label %98

; <label>:98:                                     ; preds = %91, %81
  br label %209

; <label>:99:                                     ; preds = %67, %59
  %100 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %101 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %100, i32 0, i32 2
  %102 = load i32, i32* %101, align 8
  %103 = mul nsw i32 %102, 2
  %104 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %104, i32 0, i32 38
  %106 = load i32, i32* %105, align 8
  %107 = icmp eq i32 %103, %106
  br i1 %107, label %108, label %124

; <label>:108:                                    ; preds = %99
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 1)
  %109 = add i64 %pgocount4, 1
  store i64 %109, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 1)
  %110 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %111 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %110, i32 0, i32 3
  %112 = load i32, i32* %111, align 4
  %113 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %114 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %113, i32 0, i32 39
  %115 = load i32, i32* %114, align 4
  %116 = icmp eq i32 %112, %115
  br i1 %116, label %117, label %124

; <label>:117:                                    ; preds = %108
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 4)
  %118 = add i64 %pgocount5, 1
  store i64 %118, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 4)
  store i32 0, i32* %6, align 4
  %119 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %120 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %119, i32 0, i32 1
  %121 = load i32, i32* %4, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %120, i64 0, i64 %122
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v1_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %123, align 8
  br label %208

; <label>:124:                                    ; preds = %108, %99
  %125 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %126 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %125, i32 0, i32 2
  %127 = load i32, i32* %126, align 8
  %128 = mul nsw i32 %127, 2
  %129 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %130 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %129, i32 0, i32 38
  %131 = load i32, i32* %130, align 8
  %132 = icmp eq i32 %128, %131
  br i1 %132, label %133, label %166

; <label>:133:                                    ; preds = %124
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 3)
  %134 = add i64 %pgocount6, 1
  store i64 %134, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 3)
  %135 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %136 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %135, i32 0, i32 3
  %137 = load i32, i32* %136, align 4
  %138 = mul nsw i32 %137, 2
  %139 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %140 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %139, i32 0, i32 39
  %141 = load i32, i32* %140, align 4
  %142 = icmp eq i32 %138, %141
  br i1 %142, label %143, label %166

; <label>:143:                                    ; preds = %133
  %144 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %145 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %144, i32 0, i32 27
  %146 = load i32, i32* %145, align 8
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %148, label %158

; <label>:148:                                    ; preds = %143
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 8)
  %149 = add i64 %pgocount7, 1
  store i64 %149, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 8)
  %150 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %151 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %150, i32 0, i32 1
  %152 = load i32, i32* %4, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %151, i64 0, i64 %153
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v2_smooth_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %154, align 8
  %155 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %156 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %155, i32 0, i32 0
  %157 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %156, i32 0, i32 2
  store i32 1, i32* %157, align 8
  br label %165

; <label>:158:                                    ; preds = %143
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 10)
  %159 = add i64 %pgocount8, 1
  store i64 %159, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 10)
  %160 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %161 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %160, i32 0, i32 1
  %162 = load i32, i32* %4, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %161, i64 0, i64 %163
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @h2v2_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %164, align 8
  br label %165

; <label>:165:                                    ; preds = %158, %148
  br label %207

; <label>:166:                                    ; preds = %133, %124
  %167 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %168 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %167, i32 0, i32 38
  %169 = load i32, i32* %168, align 8
  %170 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %171 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %170, i32 0, i32 2
  %172 = load i32, i32* %171, align 8
  %173 = srem i32 %169, %172
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %175, label %192

; <label>:175:                                    ; preds = %166
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 5)
  %176 = add i64 %pgocount9, 1
  store i64 %176, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 5)
  %177 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %178 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %177, i32 0, i32 39
  %179 = load i32, i32* %178, align 4
  %180 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %181 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %180, i32 0, i32 3
  %182 = load i32, i32* %181, align 4
  %183 = srem i32 %179, %182
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %192

; <label>:185:                                    ; preds = %175
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 9)
  %186 = add i64 %pgocount10, 1
  store i64 %186, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 9)
  store i32 0, i32* %6, align 4
  %187 = load %struct.my_downsampler*, %struct.my_downsampler** %3, align 8
  %188 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %187, i32 0, i32 1
  %189 = load i32, i32* %4, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %188, i64 0, i64 %190
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* @int_downsample, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %191, align 8
  br label %206

; <label>:192:                                    ; preds = %175, %166
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 2)
  %193 = add i64 %pgocount11, 1
  store i64 %193, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 2)
  %194 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %195 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %194, i32 0, i32 0
  %196 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %195, align 8
  %197 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %196, i32 0, i32 5
  store i32 37, i32* %197, align 8
  %198 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %199 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %198, i32 0, i32 0
  %200 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %199, align 8
  %201 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %200, i32 0, i32 0
  %202 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %201, align 8
  %203 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %204 = bitcast %struct.jpeg_compress_struct* %203 to %struct.jpeg_common_struct*
  %205 = ptrtoint void (%struct.jpeg_common_struct*)* %202 to i64
  call void @__llvm_profile_instrument_target(i64 %205, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_downsampler to i8*), i32 2)
  call void %202(%struct.jpeg_common_struct* %204)
  br label %206

; <label>:206:                                    ; preds = %192, %185
  br label %207

; <label>:207:                                    ; preds = %206, %165
  br label %208

; <label>:208:                                    ; preds = %207, %117
  br label %209

; <label>:209:                                    ; preds = %208, %98
  br label %210

; <label>:210:                                    ; preds = %209
  %211 = load i32, i32* %4, align 4
  %212 = add nsw i32 %211, 1
  store i32 %212, i32* %4, align 4
  %213 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %214 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %213, i32 1
  store %struct.jpeg_component_info* %214, %struct.jpeg_component_info** %5, align 8
  br label %53

; <label>:215:                                    ; preds = %53
  %216 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %217 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %216, i32 0, i32 27
  %218 = load i32, i32* %217, align 8
  %219 = icmp ne i32 %218, 0
  br i1 %219, label %220, label %238

; <label>:220:                                    ; preds = %215
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 13)
  %221 = add i64 %pgocount12, 1
  store i64 %221, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 13)
  %222 = load i32, i32* %6, align 4
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %238, label %224

; <label>:224:                                    ; preds = %220
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 14)
  %225 = add i64 %pgocount13, 1
  store i64 %225, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 14)
  %226 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %227 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %226, i32 0, i32 0
  %228 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %227, align 8
  %229 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %228, i32 0, i32 5
  store i32 98, i32* %229, align 8
  %230 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %231 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %230, i32 0, i32 0
  %232 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %231, align 8
  %233 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %232, i32 0, i32 1
  %234 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %233, align 8
  %235 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %236 = bitcast %struct.jpeg_compress_struct* %235 to %struct.jpeg_common_struct*
  %237 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %234 to i64
  call void @__llvm_profile_instrument_target(i64 %237, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_downsampler to i8*), i32 3)
  call void %234(%struct.jpeg_common_struct* %236, i32 0)
  br label %238

; <label>:238:                                    ; preds = %224, %220, %215
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 11)
  %239 = add i64 %pgocount14, 1
  store i64 %239, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_jinit_downsampler, i64 0, i64 11)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_downsample(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_downsample, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_downsample, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @sep_downsample(%struct.jpeg_compress_struct*, i8***, i32, i8***, i32) #0 {
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i8***, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8***, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.my_downsampler*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.jpeg_component_info*, align 8
  %14 = alloca i8**, align 8
  %15 = alloca i8**, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i8*** %1, i8**** %7, align 8
  store i32 %2, i32* %8, align 4
  store i8*** %3, i8**** %9, align 8
  store i32 %4, i32* %10, align 4
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 57
  %18 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %17, align 8
  %19 = bitcast %struct.jpeg_downsampler* %18 to %struct.my_downsampler*
  store %struct.my_downsampler* %19, %struct.my_downsampler** %11, align 8
  store i32 0, i32* %12, align 4
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 14
  %22 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %21, align 8
  store %struct.jpeg_component_info* %22, %struct.jpeg_component_info** %13, align 8
  br label %23

; <label>:23:                                     ; preds = %61, %5
  %24 = load i32, i32* %12, align 4
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 12
  %27 = load i32, i32* %26, align 4
  %28 = icmp slt i32 %24, %27
  br i1 %28, label %29, label %67

; <label>:29:                                     ; preds = %23
  %30 = load i8***, i8**** %7, align 8
  %31 = load i32, i32* %12, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8**, i8*** %30, i64 %32
  %34 = load i8**, i8*** %33, align 8
  %35 = load i32, i32* %8, align 4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8*, i8** %34, i64 %36
  store i8** %37, i8*** %14, align 8
  %38 = load i8***, i8**** %9, align 8
  %39 = load i32, i32* %12, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8**, i8*** %38, i64 %40
  %42 = load i8**, i8*** %41, align 8
  %43 = load i32, i32* %10, align 4
  %44 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %13, align 8
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %44, i32 0, i32 3
  %46 = load i32, i32* %45, align 4
  %47 = mul i32 %43, %46
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i8*, i8** %42, i64 %48
  store i8** %49, i8*** %15, align 8
  %50 = load %struct.my_downsampler*, %struct.my_downsampler** %11, align 8
  %51 = getelementptr inbounds %struct.my_downsampler, %struct.my_downsampler* %50, i32 0, i32 1
  %52 = load i32, i32* %12, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*], [10 x void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*]* %51, i64 0, i64 %53
  %55 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)** %54, align 8
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %57 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %13, align 8
  %58 = load i8**, i8*** %14, align 8
  %59 = load i8**, i8*** %15, align 8
  %60 = ptrtoint void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %60, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sep_downsample to i8*), i32 0)
  call void %55(%struct.jpeg_compress_struct* %56, %struct.jpeg_component_info* %57, i8** %58, i8** %59)
  br label %61

; <label>:61:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sep_downsample, i64 0, i64 0)
  %62 = add i64 %pgocount, 1
  store i64 %62, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sep_downsample, i64 0, i64 0)
  %63 = load i32, i32* %12, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %12, align 4
  %65 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %13, align 8
  %66 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i32 1
  store %struct.jpeg_component_info* %66, %struct.jpeg_component_info** %13, align 8
  br label %23

; <label>:67:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sep_downsample, i64 0, i64 1)
  %68 = add i64 %pgocount1, 1
  store i64 %68, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_sep_downsample, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @fullsize_smooth_downsample(%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8** %3, i8*** %8, align 8
  %23 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %23, i32 0, i32 7
  %25 = load i32, i32* %24, align 4
  %26 = mul i32 %25, 8
  store i32 %26, i32* %11, align 4
  %27 = load i8**, i8*** %7, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 -1
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 39
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %31, 2
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 6
  %35 = load i32, i32* %34, align 8
  %36 = load i32, i32* %11, align 4
  call void @expand_right_edge(i8** %28, i32 %32, i32 %35, i32 %36)
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 27
  %39 = load i32, i32* %38, align 8
  %40 = sext i32 %39 to i64
  %41 = mul nsw i64 %40, 512
  %42 = sub nsw i64 65536, %41
  store i64 %42, i64* %18, align 8
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %43, i32 0, i32 27
  %45 = load i32, i32* %44, align 8
  %46 = mul nsw i32 %45, 64
  %47 = sext i32 %46 to i64
  store i64 %47, i64* %19, align 8
  store i32 0, i32* %9, align 4
  br label %48

; <label>:48:                                     ; preds = %213, %4
  %49 = load i32, i32* %9, align 4
  %50 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %50, i32 0, i32 3
  %52 = load i32, i32* %51, align 4
  %53 = icmp slt i32 %49, %52
  br i1 %53, label %54, label %217

; <label>:54:                                     ; preds = %48
  %55 = load i8**, i8*** %8, align 8
  %56 = load i32, i32* %9, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8*, i8** %55, i64 %57
  %59 = load i8*, i8** %58, align 8
  store i8* %59, i8** %15, align 8
  %60 = load i8**, i8*** %7, align 8
  %61 = load i32, i32* %9, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8*, i8** %60, i64 %62
  %64 = load i8*, i8** %63, align 8
  store i8* %64, i8** %12, align 8
  %65 = load i8**, i8*** %7, align 8
  %66 = load i32, i32* %9, align 4
  %67 = sub nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8*, i8** %65, i64 %68
  %70 = load i8*, i8** %69, align 8
  store i8* %70, i8** %13, align 8
  %71 = load i8**, i8*** %7, align 8
  %72 = load i32, i32* %9, align 4
  %73 = add nsw i32 %72, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8*, i8** %71, i64 %74
  %76 = load i8*, i8** %75, align 8
  store i8* %76, i8** %14, align 8
  %77 = load i8*, i8** %13, align 8
  %78 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %78, i8** %13, align 8
  %79 = load i8, i8* %77, align 1
  %80 = zext i8 %79 to i32
  %81 = load i8*, i8** %14, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %14, align 8
  %83 = load i8, i8* %81, align 1
  %84 = zext i8 %83 to i32
  %85 = add nsw i32 %80, %84
  %86 = load i8*, i8** %12, align 8
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = add nsw i32 %85, %88
  store i32 %89, i32* %20, align 4
  %90 = load i8*, i8** %12, align 8
  %91 = getelementptr inbounds i8, i8* %90, i32 1
  store i8* %91, i8** %12, align 8
  %92 = load i8, i8* %90, align 1
  %93 = zext i8 %92 to i32
  %94 = sext i32 %93 to i64
  store i64 %94, i64* %16, align 8
  %95 = load i8*, i8** %13, align 8
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  %98 = load i8*, i8** %14, align 8
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = add nsw i32 %97, %100
  %102 = load i8*, i8** %12, align 8
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = add nsw i32 %101, %104
  store i32 %105, i32* %22, align 4
  %106 = load i32, i32* %20, align 4
  %107 = sext i32 %106 to i64
  %108 = load i32, i32* %20, align 4
  %109 = sext i32 %108 to i64
  %110 = load i64, i64* %16, align 8
  %111 = sub nsw i64 %109, %110
  %112 = add nsw i64 %107, %111
  %113 = load i32, i32* %22, align 4
  %114 = sext i32 %113 to i64
  %115 = add nsw i64 %112, %114
  store i64 %115, i64* %17, align 8
  %116 = load i64, i64* %16, align 8
  %117 = load i64, i64* %18, align 8
  %118 = mul nsw i64 %116, %117
  %119 = load i64, i64* %17, align 8
  %120 = load i64, i64* %19, align 8
  %121 = mul nsw i64 %119, %120
  %122 = add nsw i64 %118, %121
  store i64 %122, i64* %16, align 8
  %123 = load i64, i64* %16, align 8
  %124 = add nsw i64 %123, 32768
  %125 = ashr i64 %124, 16
  %126 = trunc i64 %125 to i8
  %127 = load i8*, i8** %15, align 8
  %128 = getelementptr inbounds i8, i8* %127, i32 1
  store i8* %128, i8** %15, align 8
  store i8 %126, i8* %127, align 1
  %129 = load i32, i32* %20, align 4
  store i32 %129, i32* %21, align 4
  %130 = load i32, i32* %22, align 4
  store i32 %130, i32* %20, align 4
  %131 = load i32, i32* %11, align 4
  %132 = sub i32 %131, 2
  store i32 %132, i32* %10, align 4
  br label %133

; <label>:133:                                    ; preds = %182, %54
  %134 = load i32, i32* %10, align 4
  %135 = icmp ugt i32 %134, 0
  br i1 %135, label %136, label %186

; <label>:136:                                    ; preds = %133
  %137 = load i8*, i8** %12, align 8
  %138 = getelementptr inbounds i8, i8* %137, i32 1
  store i8* %138, i8** %12, align 8
  %139 = load i8, i8* %137, align 1
  %140 = zext i8 %139 to i32
  %141 = sext i32 %140 to i64
  store i64 %141, i64* %16, align 8
  %142 = load i8*, i8** %13, align 8
  %143 = getelementptr inbounds i8, i8* %142, i32 1
  store i8* %143, i8** %13, align 8
  %144 = load i8*, i8** %14, align 8
  %145 = getelementptr inbounds i8, i8* %144, i32 1
  store i8* %145, i8** %14, align 8
  %146 = load i8*, i8** %13, align 8
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %149 = load i8*, i8** %14, align 8
  %150 = load i8, i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = add nsw i32 %148, %151
  %153 = load i8*, i8** %12, align 8
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = add nsw i32 %152, %155
  store i32 %156, i32* %22, align 4
  %157 = load i32, i32* %21, align 4
  %158 = sext i32 %157 to i64
  %159 = load i32, i32* %20, align 4
  %160 = sext i32 %159 to i64
  %161 = load i64, i64* %16, align 8
  %162 = sub nsw i64 %160, %161
  %163 = add nsw i64 %158, %162
  %164 = load i32, i32* %22, align 4
  %165 = sext i32 %164 to i64
  %166 = add nsw i64 %163, %165
  store i64 %166, i64* %17, align 8
  %167 = load i64, i64* %16, align 8
  %168 = load i64, i64* %18, align 8
  %169 = mul nsw i64 %167, %168
  %170 = load i64, i64* %17, align 8
  %171 = load i64, i64* %19, align 8
  %172 = mul nsw i64 %170, %171
  %173 = add nsw i64 %169, %172
  store i64 %173, i64* %16, align 8
  %174 = load i64, i64* %16, align 8
  %175 = add nsw i64 %174, 32768
  %176 = ashr i64 %175, 16
  %177 = trunc i64 %176 to i8
  %178 = load i8*, i8** %15, align 8
  %179 = getelementptr inbounds i8, i8* %178, i32 1
  store i8* %179, i8** %15, align 8
  store i8 %177, i8* %178, align 1
  %180 = load i32, i32* %20, align 4
  store i32 %180, i32* %21, align 4
  %181 = load i32, i32* %22, align 4
  store i32 %181, i32* %20, align 4
  br label %182

; <label>:182:                                    ; preds = %136
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fullsize_smooth_downsample, i64 0, i64 0)
  %183 = add i64 %pgocount, 1
  store i64 %183, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fullsize_smooth_downsample, i64 0, i64 0)
  %184 = load i32, i32* %10, align 4
  %185 = add i32 %184, -1
  store i32 %185, i32* %10, align 4
  br label %133

; <label>:186:                                    ; preds = %133
  %187 = load i8*, i8** %12, align 8
  %188 = load i8, i8* %187, align 1
  %189 = zext i8 %188 to i32
  %190 = sext i32 %189 to i64
  store i64 %190, i64* %16, align 8
  %191 = load i32, i32* %21, align 4
  %192 = sext i32 %191 to i64
  %193 = load i32, i32* %20, align 4
  %194 = sext i32 %193 to i64
  %195 = load i64, i64* %16, align 8
  %196 = sub nsw i64 %194, %195
  %197 = add nsw i64 %192, %196
  %198 = load i32, i32* %20, align 4
  %199 = sext i32 %198 to i64
  %200 = add nsw i64 %197, %199
  store i64 %200, i64* %17, align 8
  %201 = load i64, i64* %16, align 8
  %202 = load i64, i64* %18, align 8
  %203 = mul nsw i64 %201, %202
  %204 = load i64, i64* %17, align 8
  %205 = load i64, i64* %19, align 8
  %206 = mul nsw i64 %204, %205
  %207 = add nsw i64 %203, %206
  store i64 %207, i64* %16, align 8
  %208 = load i64, i64* %16, align 8
  %209 = add nsw i64 %208, 32768
  %210 = ashr i64 %209, 16
  %211 = trunc i64 %210 to i8
  %212 = load i8*, i8** %15, align 8
  store i8 %211, i8* %212, align 1
  br label %213

; <label>:213:                                    ; preds = %186
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fullsize_smooth_downsample, i64 0, i64 1)
  %214 = add i64 %pgocount1, 1
  store i64 %214, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fullsize_smooth_downsample, i64 0, i64 1)
  %215 = load i32, i32* %9, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, i32* %9, align 4
  br label %48

; <label>:217:                                    ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fullsize_smooth_downsample, i64 0, i64 2)
  %218 = add i64 %pgocount2, 1
  store i64 %218, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fullsize_smooth_downsample, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @fullsize_downsample(%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fullsize_downsample, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fullsize_downsample, i64 0, i64 0)
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i8**, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %7, align 8
  store i8** %2, i8*** %8, align 8
  store i8** %3, i8*** %9, align 8
  %10 = load i8**, i8*** %8, align 8
  %11 = load i8**, i8*** %9, align 8
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %12, i32 0, i32 39
  %14 = load i32, i32* %13, align 4
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 6
  %17 = load i32, i32* %16, align 8
  call void @jcopy_sample_rows(i8** %10, i32 0, i8** %11, i32 0, i32 %14, i32 %17)
  %18 = load i8**, i8*** %9, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 39
  %21 = load i32, i32* %20, align 4
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 6
  %24 = load i32, i32* %23, align 8
  %25 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %26 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %25, i32 0, i32 7
  %27 = load i32, i32* %26, align 4
  %28 = mul i32 %27, 8
  call void @expand_right_edge(i8** %18, i32 %21, i32 %24, i32 %28)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @h2v1_downsample(%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8** %3, i8*** %8, align 8
  %15 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %16 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %15, i32 0, i32 7
  %17 = load i32, i32* %16, align 4
  %18 = mul i32 %17, 8
  store i32 %18, i32* %11, align 4
  %19 = load i8**, i8*** %7, align 8
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 39
  %22 = load i32, i32* %21, align 4
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 6
  %25 = load i32, i32* %24, align 8
  %26 = load i32, i32* %11, align 4
  %27 = mul i32 %26, 2
  call void @expand_right_edge(i8** %19, i32 %22, i32 %25, i32 %27)
  store i32 0, i32* %9, align 4
  br label %28

; <label>:28:                                     ; preds = %73, %4
  %29 = load i32, i32* %9, align 4
  %30 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %31 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %30, i32 0, i32 3
  %32 = load i32, i32* %31, align 4
  %33 = icmp slt i32 %29, %32
  br i1 %33, label %34, label %77

; <label>:34:                                     ; preds = %28
  %35 = load i8**, i8*** %8, align 8
  %36 = load i32, i32* %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8*, i8** %35, i64 %37
  %39 = load i8*, i8** %38, align 8
  store i8* %39, i8** %13, align 8
  %40 = load i8**, i8*** %7, align 8
  %41 = load i32, i32* %9, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8*, i8** %40, i64 %42
  %44 = load i8*, i8** %43, align 8
  store i8* %44, i8** %12, align 8
  store i32 0, i32* %14, align 4
  store i32 0, i32* %10, align 4
  br label %45

; <label>:45:                                     ; preds = %68, %34
  %46 = load i32, i32* %10, align 4
  %47 = load i32, i32* %11, align 4
  %48 = icmp ult i32 %46, %47
  br i1 %48, label %49, label %72

; <label>:49:                                     ; preds = %45
  %50 = load i8*, i8** %12, align 8
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = load i8*, i8** %12, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 1
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = add nsw i32 %52, %56
  %58 = load i32, i32* %14, align 4
  %59 = add nsw i32 %57, %58
  %60 = ashr i32 %59, 1
  %61 = trunc i32 %60 to i8
  %62 = load i8*, i8** %13, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %13, align 8
  store i8 %61, i8* %62, align 1
  %64 = load i32, i32* %14, align 4
  %65 = xor i32 %64, 1
  store i32 %65, i32* %14, align 4
  %66 = load i8*, i8** %12, align 8
  %67 = getelementptr inbounds i8, i8* %66, i64 2
  store i8* %67, i8** %12, align 8
  br label %68

; <label>:68:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_downsample, i64 0, i64 0)
  %69 = add i64 %pgocount, 1
  store i64 %69, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_downsample, i64 0, i64 0)
  %70 = load i32, i32* %10, align 4
  %71 = add i32 %70, 1
  store i32 %71, i32* %10, align 4
  br label %45

; <label>:72:                                     ; preds = %45
  br label %73

; <label>:73:                                     ; preds = %72
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_downsample, i64 0, i64 1)
  %74 = add i64 %pgocount1, 1
  store i64 %74, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_downsample, i64 0, i64 1)
  %75 = load i32, i32* %9, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %9, align 4
  br label %28

; <label>:77:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_downsample, i64 0, i64 2)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_downsample, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @h2v2_smooth_downsample(%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8** %3, i8*** %8, align 8
  %22 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %23 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %22, i32 0, i32 7
  %24 = load i32, i32* %23, align 4
  %25 = mul i32 %24, 8
  store i32 %25, i32* %12, align 4
  %26 = load i8**, i8*** %7, align 8
  %27 = getelementptr inbounds i8*, i8** %26, i64 -1
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 39
  %30 = load i32, i32* %29, align 4
  %31 = add nsw i32 %30, 2
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 6
  %34 = load i32, i32* %33, align 8
  %35 = load i32, i32* %12, align 4
  %36 = mul i32 %35, 2
  call void @expand_right_edge(i8** %27, i32 %31, i32 %34, i32 %36)
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 27
  %39 = load i32, i32* %38, align 8
  %40 = mul nsw i32 %39, 80
  %41 = sub nsw i32 16384, %40
  %42 = sext i32 %41 to i64
  store i64 %42, i64* %20, align 8
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %43, i32 0, i32 27
  %45 = load i32, i32* %44, align 8
  %46 = mul nsw i32 %45, 16
  %47 = sext i32 %46 to i64
  store i64 %47, i64* %21, align 8
  store i32 0, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %48

; <label>:48:                                     ; preds = %389, %4
  %49 = load i32, i32* %10, align 4
  %50 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %50, i32 0, i32 3
  %52 = load i32, i32* %51, align 4
  %53 = icmp slt i32 %49, %52
  br i1 %53, label %54, label %393

; <label>:54:                                     ; preds = %48
  %55 = load i8**, i8*** %8, align 8
  %56 = load i32, i32* %10, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8*, i8** %55, i64 %57
  %59 = load i8*, i8** %58, align 8
  store i8* %59, i8** %17, align 8
  %60 = load i8**, i8*** %7, align 8
  %61 = load i32, i32* %9, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8*, i8** %60, i64 %62
  %64 = load i8*, i8** %63, align 8
  store i8* %64, i8** %13, align 8
  %65 = load i8**, i8*** %7, align 8
  %66 = load i32, i32* %9, align 4
  %67 = add nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8*, i8** %65, i64 %68
  %70 = load i8*, i8** %69, align 8
  store i8* %70, i8** %14, align 8
  %71 = load i8**, i8*** %7, align 8
  %72 = load i32, i32* %9, align 4
  %73 = sub nsw i32 %72, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8*, i8** %71, i64 %74
  %76 = load i8*, i8** %75, align 8
  store i8* %76, i8** %15, align 8
  %77 = load i8**, i8*** %7, align 8
  %78 = load i32, i32* %9, align 4
  %79 = add nsw i32 %78, 2
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8*, i8** %77, i64 %80
  %82 = load i8*, i8** %81, align 8
  store i8* %82, i8** %16, align 8
  %83 = load i8*, i8** %13, align 8
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = load i8*, i8** %13, align 8
  %87 = getelementptr inbounds i8, i8* %86, i64 1
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = add nsw i32 %85, %89
  %91 = load i8*, i8** %14, align 8
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = add nsw i32 %90, %93
  %95 = load i8*, i8** %14, align 8
  %96 = getelementptr inbounds i8, i8* %95, i64 1
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = add nsw i32 %94, %98
  %100 = sext i32 %99 to i64
  store i64 %100, i64* %18, align 8
  %101 = load i8*, i8** %15, align 8
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = load i8*, i8** %15, align 8
  %105 = getelementptr inbounds i8, i8* %104, i64 1
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = add nsw i32 %103, %107
  %109 = load i8*, i8** %16, align 8
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = add nsw i32 %108, %111
  %113 = load i8*, i8** %16, align 8
  %114 = getelementptr inbounds i8, i8* %113, i64 1
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i32
  %117 = add nsw i32 %112, %116
  %118 = load i8*, i8** %13, align 8
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i32
  %121 = add nsw i32 %117, %120
  %122 = load i8*, i8** %13, align 8
  %123 = getelementptr inbounds i8, i8* %122, i64 2
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i32
  %126 = add nsw i32 %121, %125
  %127 = load i8*, i8** %14, align 8
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i32
  %130 = add nsw i32 %126, %129
  %131 = load i8*, i8** %14, align 8
  %132 = getelementptr inbounds i8, i8* %131, i64 2
  %133 = load i8, i8* %132, align 1
  %134 = zext i8 %133 to i32
  %135 = add nsw i32 %130, %134
  %136 = sext i32 %135 to i64
  store i64 %136, i64* %19, align 8
  %137 = load i64, i64* %19, align 8
  %138 = load i64, i64* %19, align 8
  %139 = add nsw i64 %138, %137
  store i64 %139, i64* %19, align 8
  %140 = load i8*, i8** %15, align 8
  %141 = load i8, i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = load i8*, i8** %15, align 8
  %144 = getelementptr inbounds i8, i8* %143, i64 2
  %145 = load i8, i8* %144, align 1
  %146 = zext i8 %145 to i32
  %147 = add nsw i32 %142, %146
  %148 = load i8*, i8** %16, align 8
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = add nsw i32 %147, %150
  %152 = load i8*, i8** %16, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 2
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = add nsw i32 %151, %155
  %157 = sext i32 %156 to i64
  %158 = load i64, i64* %19, align 8
  %159 = add nsw i64 %158, %157
  store i64 %159, i64* %19, align 8
  %160 = load i64, i64* %18, align 8
  %161 = load i64, i64* %20, align 8
  %162 = mul nsw i64 %160, %161
  %163 = load i64, i64* %19, align 8
  %164 = load i64, i64* %21, align 8
  %165 = mul nsw i64 %163, %164
  %166 = add nsw i64 %162, %165
  store i64 %166, i64* %18, align 8
  %167 = load i64, i64* %18, align 8
  %168 = add nsw i64 %167, 32768
  %169 = ashr i64 %168, 16
  %170 = trunc i64 %169 to i8
  %171 = load i8*, i8** %17, align 8
  %172 = getelementptr inbounds i8, i8* %171, i32 1
  store i8* %172, i8** %17, align 8
  store i8 %170, i8* %171, align 1
  %173 = load i8*, i8** %13, align 8
  %174 = getelementptr inbounds i8, i8* %173, i64 2
  store i8* %174, i8** %13, align 8
  %175 = load i8*, i8** %14, align 8
  %176 = getelementptr inbounds i8, i8* %175, i64 2
  store i8* %176, i8** %14, align 8
  %177 = load i8*, i8** %15, align 8
  %178 = getelementptr inbounds i8, i8* %177, i64 2
  store i8* %178, i8** %15, align 8
  %179 = load i8*, i8** %16, align 8
  %180 = getelementptr inbounds i8, i8* %179, i64 2
  store i8* %180, i8** %16, align 8
  %181 = load i32, i32* %12, align 4
  %182 = sub i32 %181, 2
  store i32 %182, i32* %11, align 4
  br label %183

; <label>:183:                                    ; preds = %289, %54
  %184 = load i32, i32* %11, align 4
  %185 = icmp ugt i32 %184, 0
  br i1 %185, label %186, label %293

; <label>:186:                                    ; preds = %183
  %187 = load i8*, i8** %13, align 8
  %188 = load i8, i8* %187, align 1
  %189 = zext i8 %188 to i32
  %190 = load i8*, i8** %13, align 8
  %191 = getelementptr inbounds i8, i8* %190, i64 1
  %192 = load i8, i8* %191, align 1
  %193 = zext i8 %192 to i32
  %194 = add nsw i32 %189, %193
  %195 = load i8*, i8** %14, align 8
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i32
  %198 = add nsw i32 %194, %197
  %199 = load i8*, i8** %14, align 8
  %200 = getelementptr inbounds i8, i8* %199, i64 1
  %201 = load i8, i8* %200, align 1
  %202 = zext i8 %201 to i32
  %203 = add nsw i32 %198, %202
  %204 = sext i32 %203 to i64
  store i64 %204, i64* %18, align 8
  %205 = load i8*, i8** %15, align 8
  %206 = load i8, i8* %205, align 1
  %207 = zext i8 %206 to i32
  %208 = load i8*, i8** %15, align 8
  %209 = getelementptr inbounds i8, i8* %208, i64 1
  %210 = load i8, i8* %209, align 1
  %211 = zext i8 %210 to i32
  %212 = add nsw i32 %207, %211
  %213 = load i8*, i8** %16, align 8
  %214 = load i8, i8* %213, align 1
  %215 = zext i8 %214 to i32
  %216 = add nsw i32 %212, %215
  %217 = load i8*, i8** %16, align 8
  %218 = getelementptr inbounds i8, i8* %217, i64 1
  %219 = load i8, i8* %218, align 1
  %220 = zext i8 %219 to i32
  %221 = add nsw i32 %216, %220
  %222 = load i8*, i8** %13, align 8
  %223 = getelementptr inbounds i8, i8* %222, i64 -1
  %224 = load i8, i8* %223, align 1
  %225 = zext i8 %224 to i32
  %226 = add nsw i32 %221, %225
  %227 = load i8*, i8** %13, align 8
  %228 = getelementptr inbounds i8, i8* %227, i64 2
  %229 = load i8, i8* %228, align 1
  %230 = zext i8 %229 to i32
  %231 = add nsw i32 %226, %230
  %232 = load i8*, i8** %14, align 8
  %233 = getelementptr inbounds i8, i8* %232, i64 -1
  %234 = load i8, i8* %233, align 1
  %235 = zext i8 %234 to i32
  %236 = add nsw i32 %231, %235
  %237 = load i8*, i8** %14, align 8
  %238 = getelementptr inbounds i8, i8* %237, i64 2
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = add nsw i32 %236, %240
  %242 = sext i32 %241 to i64
  store i64 %242, i64* %19, align 8
  %243 = load i64, i64* %19, align 8
  %244 = load i64, i64* %19, align 8
  %245 = add nsw i64 %244, %243
  store i64 %245, i64* %19, align 8
  %246 = load i8*, i8** %15, align 8
  %247 = getelementptr inbounds i8, i8* %246, i64 -1
  %248 = load i8, i8* %247, align 1
  %249 = zext i8 %248 to i32
  %250 = load i8*, i8** %15, align 8
  %251 = getelementptr inbounds i8, i8* %250, i64 2
  %252 = load i8, i8* %251, align 1
  %253 = zext i8 %252 to i32
  %254 = add nsw i32 %249, %253
  %255 = load i8*, i8** %16, align 8
  %256 = getelementptr inbounds i8, i8* %255, i64 -1
  %257 = load i8, i8* %256, align 1
  %258 = zext i8 %257 to i32
  %259 = add nsw i32 %254, %258
  %260 = load i8*, i8** %16, align 8
  %261 = getelementptr inbounds i8, i8* %260, i64 2
  %262 = load i8, i8* %261, align 1
  %263 = zext i8 %262 to i32
  %264 = add nsw i32 %259, %263
  %265 = sext i32 %264 to i64
  %266 = load i64, i64* %19, align 8
  %267 = add nsw i64 %266, %265
  store i64 %267, i64* %19, align 8
  %268 = load i64, i64* %18, align 8
  %269 = load i64, i64* %20, align 8
  %270 = mul nsw i64 %268, %269
  %271 = load i64, i64* %19, align 8
  %272 = load i64, i64* %21, align 8
  %273 = mul nsw i64 %271, %272
  %274 = add nsw i64 %270, %273
  store i64 %274, i64* %18, align 8
  %275 = load i64, i64* %18, align 8
  %276 = add nsw i64 %275, 32768
  %277 = ashr i64 %276, 16
  %278 = trunc i64 %277 to i8
  %279 = load i8*, i8** %17, align 8
  %280 = getelementptr inbounds i8, i8* %279, i32 1
  store i8* %280, i8** %17, align 8
  store i8 %278, i8* %279, align 1
  %281 = load i8*, i8** %13, align 8
  %282 = getelementptr inbounds i8, i8* %281, i64 2
  store i8* %282, i8** %13, align 8
  %283 = load i8*, i8** %14, align 8
  %284 = getelementptr inbounds i8, i8* %283, i64 2
  store i8* %284, i8** %14, align 8
  %285 = load i8*, i8** %15, align 8
  %286 = getelementptr inbounds i8, i8* %285, i64 2
  store i8* %286, i8** %15, align 8
  %287 = load i8*, i8** %16, align 8
  %288 = getelementptr inbounds i8, i8* %287, i64 2
  store i8* %288, i8** %16, align 8
  br label %289

; <label>:289:                                    ; preds = %186
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_smooth_downsample, i64 0, i64 0)
  %290 = add i64 %pgocount, 1
  store i64 %290, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_smooth_downsample, i64 0, i64 0)
  %291 = load i32, i32* %11, align 4
  %292 = add i32 %291, -1
  store i32 %292, i32* %11, align 4
  br label %183

; <label>:293:                                    ; preds = %183
  %294 = load i8*, i8** %13, align 8
  %295 = load i8, i8* %294, align 1
  %296 = zext i8 %295 to i32
  %297 = load i8*, i8** %13, align 8
  %298 = getelementptr inbounds i8, i8* %297, i64 1
  %299 = load i8, i8* %298, align 1
  %300 = zext i8 %299 to i32
  %301 = add nsw i32 %296, %300
  %302 = load i8*, i8** %14, align 8
  %303 = load i8, i8* %302, align 1
  %304 = zext i8 %303 to i32
  %305 = add nsw i32 %301, %304
  %306 = load i8*, i8** %14, align 8
  %307 = getelementptr inbounds i8, i8* %306, i64 1
  %308 = load i8, i8* %307, align 1
  %309 = zext i8 %308 to i32
  %310 = add nsw i32 %305, %309
  %311 = sext i32 %310 to i64
  store i64 %311, i64* %18, align 8
  %312 = load i8*, i8** %15, align 8
  %313 = load i8, i8* %312, align 1
  %314 = zext i8 %313 to i32
  %315 = load i8*, i8** %15, align 8
  %316 = getelementptr inbounds i8, i8* %315, i64 1
  %317 = load i8, i8* %316, align 1
  %318 = zext i8 %317 to i32
  %319 = add nsw i32 %314, %318
  %320 = load i8*, i8** %16, align 8
  %321 = load i8, i8* %320, align 1
  %322 = zext i8 %321 to i32
  %323 = add nsw i32 %319, %322
  %324 = load i8*, i8** %16, align 8
  %325 = getelementptr inbounds i8, i8* %324, i64 1
  %326 = load i8, i8* %325, align 1
  %327 = zext i8 %326 to i32
  %328 = add nsw i32 %323, %327
  %329 = load i8*, i8** %13, align 8
  %330 = getelementptr inbounds i8, i8* %329, i64 -1
  %331 = load i8, i8* %330, align 1
  %332 = zext i8 %331 to i32
  %333 = add nsw i32 %328, %332
  %334 = load i8*, i8** %13, align 8
  %335 = getelementptr inbounds i8, i8* %334, i64 1
  %336 = load i8, i8* %335, align 1
  %337 = zext i8 %336 to i32
  %338 = add nsw i32 %333, %337
  %339 = load i8*, i8** %14, align 8
  %340 = getelementptr inbounds i8, i8* %339, i64 -1
  %341 = load i8, i8* %340, align 1
  %342 = zext i8 %341 to i32
  %343 = add nsw i32 %338, %342
  %344 = load i8*, i8** %14, align 8
  %345 = getelementptr inbounds i8, i8* %344, i64 1
  %346 = load i8, i8* %345, align 1
  %347 = zext i8 %346 to i32
  %348 = add nsw i32 %343, %347
  %349 = sext i32 %348 to i64
  store i64 %349, i64* %19, align 8
  %350 = load i64, i64* %19, align 8
  %351 = load i64, i64* %19, align 8
  %352 = add nsw i64 %351, %350
  store i64 %352, i64* %19, align 8
  %353 = load i8*, i8** %15, align 8
  %354 = getelementptr inbounds i8, i8* %353, i64 -1
  %355 = load i8, i8* %354, align 1
  %356 = zext i8 %355 to i32
  %357 = load i8*, i8** %15, align 8
  %358 = getelementptr inbounds i8, i8* %357, i64 1
  %359 = load i8, i8* %358, align 1
  %360 = zext i8 %359 to i32
  %361 = add nsw i32 %356, %360
  %362 = load i8*, i8** %16, align 8
  %363 = getelementptr inbounds i8, i8* %362, i64 -1
  %364 = load i8, i8* %363, align 1
  %365 = zext i8 %364 to i32
  %366 = add nsw i32 %361, %365
  %367 = load i8*, i8** %16, align 8
  %368 = getelementptr inbounds i8, i8* %367, i64 1
  %369 = load i8, i8* %368, align 1
  %370 = zext i8 %369 to i32
  %371 = add nsw i32 %366, %370
  %372 = sext i32 %371 to i64
  %373 = load i64, i64* %19, align 8
  %374 = add nsw i64 %373, %372
  store i64 %374, i64* %19, align 8
  %375 = load i64, i64* %18, align 8
  %376 = load i64, i64* %20, align 8
  %377 = mul nsw i64 %375, %376
  %378 = load i64, i64* %19, align 8
  %379 = load i64, i64* %21, align 8
  %380 = mul nsw i64 %378, %379
  %381 = add nsw i64 %377, %380
  store i64 %381, i64* %18, align 8
  %382 = load i64, i64* %18, align 8
  %383 = add nsw i64 %382, 32768
  %384 = ashr i64 %383, 16
  %385 = trunc i64 %384 to i8
  %386 = load i8*, i8** %17, align 8
  store i8 %385, i8* %386, align 1
  %387 = load i32, i32* %9, align 4
  %388 = add nsw i32 %387, 2
  store i32 %388, i32* %9, align 4
  br label %389

; <label>:389:                                    ; preds = %293
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_smooth_downsample, i64 0, i64 1)
  %390 = add i64 %pgocount1, 1
  store i64 %390, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_smooth_downsample, i64 0, i64 1)
  %391 = load i32, i32* %10, align 4
  %392 = add nsw i32 %391, 1
  store i32 %392, i32* %10, align 4
  br label %48

; <label>:393:                                    ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_smooth_downsample, i64 0, i64 2)
  %394 = add i64 %pgocount2, 1
  store i64 %394, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_smooth_downsample, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @h2v2_downsample(%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8** %3, i8*** %8, align 8
  %17 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %17, i32 0, i32 7
  %19 = load i32, i32* %18, align 4
  %20 = mul i32 %19, 8
  store i32 %20, i32* %12, align 4
  %21 = load i8**, i8*** %7, align 8
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 39
  %24 = load i32, i32* %23, align 4
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 6
  %27 = load i32, i32* %26, align 8
  %28 = load i32, i32* %12, align 4
  %29 = mul i32 %28, 2
  call void @expand_right_edge(i8** %21, i32 %24, i32 %27, i32 %29)
  store i32 0, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %30

; <label>:30:                                     ; preds = %94, %4
  %31 = load i32, i32* %10, align 4
  %32 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %33 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %32, i32 0, i32 3
  %34 = load i32, i32* %33, align 4
  %35 = icmp slt i32 %31, %34
  br i1 %35, label %36, label %98

; <label>:36:                                     ; preds = %30
  %37 = load i8**, i8*** %8, align 8
  %38 = load i32, i32* %10, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8*, i8** %37, i64 %39
  %41 = load i8*, i8** %40, align 8
  store i8* %41, i8** %15, align 8
  %42 = load i8**, i8*** %7, align 8
  %43 = load i32, i32* %9, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8*, i8** %42, i64 %44
  %46 = load i8*, i8** %45, align 8
  store i8* %46, i8** %13, align 8
  %47 = load i8**, i8*** %7, align 8
  %48 = load i32, i32* %9, align 4
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8*, i8** %47, i64 %50
  %52 = load i8*, i8** %51, align 8
  store i8* %52, i8** %14, align 8
  store i32 1, i32* %16, align 4
  store i32 0, i32* %11, align 4
  br label %53

; <label>:53:                                     ; preds = %87, %36
  %54 = load i32, i32* %11, align 4
  %55 = load i32, i32* %12, align 4
  %56 = icmp ult i32 %54, %55
  br i1 %56, label %57, label %91

; <label>:57:                                     ; preds = %53
  %58 = load i8*, i8** %13, align 8
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = load i8*, i8** %13, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 1
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = add nsw i32 %60, %64
  %66 = load i8*, i8** %14, align 8
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = add nsw i32 %65, %68
  %70 = load i8*, i8** %14, align 8
  %71 = getelementptr inbounds i8, i8* %70, i64 1
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = add nsw i32 %69, %73
  %75 = load i32, i32* %16, align 4
  %76 = add nsw i32 %74, %75
  %77 = ashr i32 %76, 2
  %78 = trunc i32 %77 to i8
  %79 = load i8*, i8** %15, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %80, i8** %15, align 8
  store i8 %78, i8* %79, align 1
  %81 = load i32, i32* %16, align 4
  %82 = xor i32 %81, 3
  store i32 %82, i32* %16, align 4
  %83 = load i8*, i8** %13, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 2
  store i8* %84, i8** %13, align 8
  %85 = load i8*, i8** %14, align 8
  %86 = getelementptr inbounds i8, i8* %85, i64 2
  store i8* %86, i8** %14, align 8
  br label %87

; <label>:87:                                     ; preds = %57
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_downsample, i64 0, i64 0)
  %88 = add i64 %pgocount, 1
  store i64 %88, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_downsample, i64 0, i64 0)
  %89 = load i32, i32* %11, align 4
  %90 = add i32 %89, 1
  store i32 %90, i32* %11, align 4
  br label %53

; <label>:91:                                     ; preds = %53
  %92 = load i32, i32* %9, align 4
  %93 = add nsw i32 %92, 2
  store i32 %93, i32* %9, align 4
  br label %94

; <label>:94:                                     ; preds = %91
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_downsample, i64 0, i64 1)
  %95 = add i64 %pgocount1, 1
  store i64 %95, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_downsample, i64 0, i64 1)
  %96 = load i32, i32* %10, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %10, align 4
  br label %30

; <label>:98:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_downsample, i64 0, i64 2)
  %99 = add i64 %pgocount2, 1
  store i64 %99, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_downsample, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @int_downsample(%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, i8**) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i8*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i64, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8** %3, i8*** %8, align 8
  %23 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %23, i32 0, i32 7
  %25 = load i32, i32* %24, align 4
  %26 = mul i32 %25, 8
  store i32 %26, i32* %19, align 4
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 38
  %29 = load i32, i32* %28, align 8
  %30 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %31 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %30, i32 0, i32 2
  %32 = load i32, i32* %31, align 8
  %33 = sdiv i32 %29, %32
  store i32 %33, i32* %11, align 4
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 39
  %36 = load i32, i32* %35, align 4
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i32 0, i32 3
  %39 = load i32, i32* %38, align 4
  %40 = sdiv i32 %36, %39
  store i32 %40, i32* %12, align 4
  %41 = load i32, i32* %11, align 4
  %42 = load i32, i32* %12, align 4
  %43 = mul nsw i32 %41, %42
  store i32 %43, i32* %13, align 4
  %44 = load i32, i32* %13, align 4
  %45 = sdiv i32 %44, 2
  store i32 %45, i32* %14, align 4
  %46 = load i8**, i8*** %7, align 8
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %47, i32 0, i32 39
  %49 = load i32, i32* %48, align 4
  %50 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %50, i32 0, i32 6
  %52 = load i32, i32* %51, align 8
  %53 = load i32, i32* %19, align 4
  %54 = load i32, i32* %11, align 4
  %55 = mul i32 %53, %54
  call void @expand_right_edge(i8** %46, i32 %49, i32 %52, i32 %55)
  store i32 0, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %56

; <label>:56:                                     ; preds = %131, %4
  %57 = load i32, i32* %10, align 4
  %58 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %59 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i32 0, i32 3
  %60 = load i32, i32* %59, align 4
  %61 = icmp slt i32 %57, %60
  br i1 %61, label %62, label %135

; <label>:62:                                     ; preds = %56
  %63 = load i8**, i8*** %8, align 8
  %64 = load i32, i32* %10, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8*, i8** %63, i64 %65
  %67 = load i8*, i8** %66, align 8
  store i8* %67, i8** %21, align 8
  store i32 0, i32* %17, align 4
  store i32 0, i32* %18, align 4
  br label %68

; <label>:68:                                     ; preds = %120, %62
  %69 = load i32, i32* %17, align 4
  %70 = load i32, i32* %19, align 4
  %71 = icmp ult i32 %69, %70
  br i1 %71, label %72, label %127

; <label>:72:                                     ; preds = %68
  store i64 0, i64* %22, align 8
  store i32 0, i32* %16, align 4
  br label %73

; <label>:73:                                     ; preds = %105, %72
  %74 = load i32, i32* %16, align 4
  %75 = load i32, i32* %12, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %77, label %109

; <label>:77:                                     ; preds = %73
  %78 = load i8**, i8*** %7, align 8
  %79 = load i32, i32* %9, align 4
  %80 = load i32, i32* %16, align 4
  %81 = add nsw i32 %79, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8*, i8** %78, i64 %82
  %84 = load i8*, i8** %83, align 8
  %85 = load i32, i32* %18, align 4
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %84, i64 %86
  store i8* %87, i8** %20, align 8
  store i32 0, i32* %15, align 4
  br label %88

; <label>:88:                                     ; preds = %100, %77
  %89 = load i32, i32* %15, align 4
  %90 = load i32, i32* %11, align 4
  %91 = icmp slt i32 %89, %90
  br i1 %91, label %92, label %104

; <label>:92:                                     ; preds = %88
  %93 = load i8*, i8** %20, align 8
  %94 = getelementptr inbounds i8, i8* %93, i32 1
  store i8* %94, i8** %20, align 8
  %95 = load i8, i8* %93, align 1
  %96 = zext i8 %95 to i32
  %97 = sext i32 %96 to i64
  %98 = load i64, i64* %22, align 8
  %99 = add nsw i64 %98, %97
  store i64 %99, i64* %22, align 8
  br label %100

; <label>:100:                                    ; preds = %92
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 0)
  %101 = add i64 %pgocount, 1
  store i64 %101, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 0)
  %102 = load i32, i32* %15, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %15, align 4
  br label %88

; <label>:104:                                    ; preds = %88
  br label %105

; <label>:105:                                    ; preds = %104
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 1)
  %106 = add i64 %pgocount1, 1
  store i64 %106, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 1)
  %107 = load i32, i32* %16, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %16, align 4
  br label %73

; <label>:109:                                    ; preds = %73
  %110 = load i64, i64* %22, align 8
  %111 = load i32, i32* %14, align 4
  %112 = sext i32 %111 to i64
  %113 = add nsw i64 %110, %112
  %114 = load i32, i32* %13, align 4
  %115 = sext i32 %114 to i64
  %116 = sdiv i64 %113, %115
  %117 = trunc i64 %116 to i8
  %118 = load i8*, i8** %21, align 8
  %119 = getelementptr inbounds i8, i8* %118, i32 1
  store i8* %119, i8** %21, align 8
  store i8 %117, i8* %118, align 1
  br label %120

; <label>:120:                                    ; preds = %109
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 2)
  %121 = add i64 %pgocount2, 1
  store i64 %121, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 2)
  %122 = load i32, i32* %17, align 4
  %123 = add i32 %122, 1
  store i32 %123, i32* %17, align 4
  %124 = load i32, i32* %11, align 4
  %125 = load i32, i32* %18, align 4
  %126 = add i32 %125, %124
  store i32 %126, i32* %18, align 4
  br label %68

; <label>:127:                                    ; preds = %68
  %128 = load i32, i32* %12, align 4
  %129 = load i32, i32* %9, align 4
  %130 = add nsw i32 %129, %128
  store i32 %130, i32* %9, align 4
  br label %131

; <label>:131:                                    ; preds = %127
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 3)
  %132 = add i64 %pgocount3, 1
  store i64 %132, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 3)
  %133 = load i32, i32* %10, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %10, align 4
  br label %56

; <label>:135:                                    ; preds = %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 4)
  %136 = add i64 %pgocount4, 1
  store i64 %136, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_downsample, i64 0, i64 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @expand_right_edge(i8**, i32, i32, i32) #0 {
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8, align 1
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i8** %0, i8*** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %14 = load i32, i32* %8, align 4
  %15 = load i32, i32* %7, align 4
  %16 = sub i32 %14, %15
  store i32 %16, i32* %13, align 4
  %17 = load i32, i32* %13, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %55

; <label>:19:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i64 0, i64 3)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i64 0, i64 3)
  store i32 0, i32* %12, align 4
  br label %21

; <label>:21:                                     ; preds = %50, %19
  %22 = load i32, i32* %12, align 4
  %23 = load i32, i32* %6, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %54

; <label>:25:                                     ; preds = %21
  %26 = load i8**, i8*** %5, align 8
  %27 = load i32, i32* %12, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8*, i8** %26, i64 %28
  %30 = load i8*, i8** %29, align 8
  %31 = load i32, i32* %7, align 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  store i8* %33, i8** %9, align 8
  %34 = load i8*, i8** %9, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 -1
  %36 = load i8, i8* %35, align 1
  store i8 %36, i8* %10, align 1
  %37 = load i32, i32* %13, align 4
  store i32 %37, i32* %11, align 4
  br label %38

; <label>:38:                                     ; preds = %45, %25
  %39 = load i32, i32* %11, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %41, label %49

; <label>:41:                                     ; preds = %38
  %42 = load i8, i8* %10, align 1
  %43 = load i8*, i8** %9, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %9, align 8
  store i8 %42, i8* %43, align 1
  br label %45

; <label>:45:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i64 0, i64 0)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i64 0, i64 0)
  %47 = load i32, i32* %11, align 4
  %48 = add nsw i32 %47, -1
  store i32 %48, i32* %11, align 4
  br label %38

; <label>:49:                                     ; preds = %38
  br label %50

; <label>:50:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i64 0, i64 1)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i64 0, i64 1)
  %52 = load i32, i32* %12, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %12, align 4
  br label %21

; <label>:54:                                     ; preds = %21
  br label %55

; <label>:55:                                     ; preds = %54, %4
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i64 0, i64 2)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_expand_right_edge, i64 0, i64 2)
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
