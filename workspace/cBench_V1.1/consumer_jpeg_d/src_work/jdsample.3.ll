; ModuleID = 'jdsample.2.ll'
source_filename = "jdsample.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, {}* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { {}*, {}*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, {}*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, {}*, {}*, {}*, i32, i32 }
%struct.jpeg_marker_reader = type { {}*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { {}*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { {}*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { {}*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, {}*, {}* }
%struct.my_upsampler = type { %struct.jpeg_upsampler, [10 x i8**], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], i32, i32, [10 x i32], [10 x i8], [10 x i8] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_upsampler = private constant [15 x i8] c"jinit_upsampler"
@__profn_tmp1.ll_start_pass_upsample = private constant [27 x i8] c"tmp1.ll:start_pass_upsample"
@__profn_tmp1.ll_sep_upsample = private constant [20 x i8] c"tmp1.ll:sep_upsample"
@__profn_tmp1.ll_noop_upsample = private constant [21 x i8] c"tmp1.ll:noop_upsample"
@__profn_tmp1.ll_fullsize_upsample = private constant [25 x i8] c"tmp1.ll:fullsize_upsample"
@__profn_tmp1.ll_h2v1_fancy_upsample = private constant [27 x i8] c"tmp1.ll:h2v1_fancy_upsample"
@__profn_tmp1.ll_h2v1_upsample = private constant [21 x i8] c"tmp1.ll:h2v1_upsample"
@__profn_tmp1.ll_h2v2_fancy_upsample = private constant [27 x i8] c"tmp1.ll:h2v2_fancy_upsample"
@__profn_tmp1.ll_h2v2_upsample = private constant [21 x i8] c"tmp1.ll:h2v2_upsample"
@__profn_tmp1.ll_int_upsample = private constant [20 x i8] c"tmp1.ll:int_upsample"
@__profc_jinit_upsampler = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_upsampler = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_upsampler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1772429071673114015, i64 1126141199816339, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_upsampler to i8*), i8* bitcast ([4 x i64]* @__profvp_jinit_upsampler to i8*), i32 18, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_upsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_pass_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1232154448198470542, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_pass_upsample to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_sep_upsample = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_sep_upsample = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_sep_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3162288944759322794, i64 563033257293690, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @sep_upsample to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_sep_upsample to i8*), i32 6, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_noop_upsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_noop_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3613091119919624867, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_noop_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @noop_upsample to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fullsize_upsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fullsize_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4828384743705289825, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fullsize_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @fullsize_upsample to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v1_fancy_upsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v1_fancy_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5585015240090836653, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_fancy_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v1_fancy_upsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v1_upsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v1_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5617324737342831197, i64 50929804412, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v1_upsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v2_fancy_upsample = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v2_fancy_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -747413565290337010, i64 87863537030, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v2_fancy_upsample to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v2_upsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v2_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5855500904964460270, i64 44484962468, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v2_upsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_int_upsample = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_int_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3685181122923231452, i64 78547714983, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @int_upsample to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [12 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [92 x i8] c"\E9\01Yx\DA\CB\CA\CC\CB,\89/-(N\CC-\C8I-b,\C9-0\D4\CB\C9\B1*.I,*\89/H,.\86K\22\E4R\0B0\05\F3\F2\F3\B1\88\A6\95\E6\E4\14gV\A5b\CAd\18\95\19\C6\A7%\E6%W\E2\90\C3&j\84G\87\11\A6hf\1E\C2k\007\94W\0F", section "__llvm_prf_names"
@llvm.used = appending global [12 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_upsampler to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sep_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_noop_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fullsize_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v1_fancy_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v1_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v2_fancy_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v2_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_int_upsample to i8*), i8* bitcast ([12 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([92 x i8], [92 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_upsampler(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_upsampler*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_component_info*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 1
  %14 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %14, i32 0, i32 0
  %16 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %15, align 8
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %17 to %struct.jpeg_common_struct*
  %19 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %16 to i64
  call void @__llvm_profile_instrument_target(i64 %19, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_upsampler to i8*), i32 0)
  %20 = call i8* %16(%struct.jpeg_common_struct* %18, i32 1, i64 256)
  %21 = bitcast i8* %20 to %struct.my_upsampler*
  store %struct.my_upsampler* %21, %struct.my_upsampler** %3, align 8
  %22 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %23 = bitcast %struct.my_upsampler* %22 to %struct.jpeg_upsampler*
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 81
  store %struct.jpeg_upsampler* %23, %struct.jpeg_upsampler** %25, align 8
  %26 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %27 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %26, i32 0, i32 0
  %28 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %27, i32 0, i32 0
  %29 = bitcast {}** %28 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_upsample, void (%struct.jpeg_decompress_struct*)** %29, align 8
  %30 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %31 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %30, i32 0, i32 0
  %32 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %31, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @sep_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %32, align 8
  %33 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %34 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %33, i32 0, i32 0
  %35 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %34, i32 0, i32 2
  store i32 0, i32* %35, align 8
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 56
  %38 = load i32, i32* %37, align 8
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %54

; <label>:40:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 16)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 16)
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 0
  %44 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %44, i32 0, i32 5
  store i32 23, i32* %45, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i32 0, i32 0
  %50 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %49, align 8
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = bitcast %struct.jpeg_decompress_struct* %51 to %struct.jpeg_common_struct*
  %53 = ptrtoint void (%struct.jpeg_common_struct*)* %50 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_upsampler to i8*), i32 1)
  call void %50(%struct.jpeg_common_struct* %52)
  br label %54

; <label>:54:                                     ; preds = %40, %1
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 17
  %57 = load i32, i32* %56, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %65

; <label>:59:                                     ; preds = %54
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 17)
  %60 = add i64 %pgocount1, 1
  store i64 %60, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 17)
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %61, i32 0, i32 59
  %63 = load i32, i32* %62, align 4
  %64 = icmp sgt i32 %63, 1
  br label %65

; <label>:65:                                     ; preds = %59, %54
  %66 = phi i1 [ false, %54 ], [ %64, %59 ]
  %67 = zext i1 %66 to i32
  store i32 %67, i32* %7, align 4
  store i32 0, i32* %4, align 4
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %68, i32 0, i32 43
  %70 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %69, align 8
  store %struct.jpeg_component_info* %70, %struct.jpeg_component_info** %5, align 8
  br label %71

; <label>:71:                                     ; preds = %298, %65
  %72 = load i32, i32* %4, align 4
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i32 0, i32 8
  %75 = load i32, i32* %74, align 8
  %76 = icmp slt i32 %72, %75
  br i1 %76, label %77, label %303

; <label>:77:                                     ; preds = %71
  %78 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %79 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %78, i32 0, i32 2
  %80 = load i32, i32* %79, align 8
  %81 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %81, i32 0, i32 9
  %83 = load i32, i32* %82, align 4
  %84 = mul nsw i32 %80, %83
  %85 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %85, i32 0, i32 59
  %87 = load i32, i32* %86, align 4
  %88 = sdiv i32 %84, %87
  store i32 %88, i32* %8, align 4
  %89 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %90 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i32 0, i32 3
  %91 = load i32, i32* %90, align 4
  %92 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %92, i32 0, i32 9
  %94 = load i32, i32* %93, align 4
  %95 = mul nsw i32 %91, %94
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %96, i32 0, i32 59
  %98 = load i32, i32* %97, align 4
  %99 = sdiv i32 %95, %98
  store i32 %99, i32* %9, align 4
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %100, i32 0, i32 57
  %102 = load i32, i32* %101, align 4
  store i32 %102, i32* %10, align 4
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 58
  %105 = load i32, i32* %104, align 8
  store i32 %105, i32* %11, align 4
  %106 = load i32, i32* %9, align 4
  %107 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %108 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %107, i32 0, i32 5
  %109 = load i32, i32* %4, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [10 x i32], [10 x i32]* %108, i64 0, i64 %110
  store i32 %106, i32* %111, align 4
  store i32 1, i32* %6, align 4
  %112 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %113 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %112, i32 0, i32 12
  %114 = load i32, i32* %113, align 8
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %123, label %116

; <label>:116:                                    ; preds = %77
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 1)
  %117 = add i64 %pgocount2, 1
  store i64 %117, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 1)
  %118 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %119 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %118, i32 0, i32 2
  %120 = load i32, i32* %4, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %119, i64 0, i64 %121
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @noop_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %122, align 8
  store i32 0, i32* %6, align 4
  br label %265

; <label>:123:                                    ; preds = %77
  %124 = load i32, i32* %8, align 4
  %125 = load i32, i32* %10, align 4
  %126 = icmp eq i32 %124, %125
  br i1 %126, label %127, label %139

; <label>:127:                                    ; preds = %123
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 2)
  %128 = add i64 %pgocount3, 1
  store i64 %128, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 2)
  %129 = load i32, i32* %9, align 4
  %130 = load i32, i32* %11, align 4
  %131 = icmp eq i32 %129, %130
  br i1 %131, label %132, label %139

; <label>:132:                                    ; preds = %127
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 6)
  %133 = add i64 %pgocount4, 1
  store i64 %133, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 6)
  %134 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %135 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %134, i32 0, i32 2
  %136 = load i32, i32* %4, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %135, i64 0, i64 %137
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @fullsize_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %138, align 8
  store i32 0, i32* %6, align 4
  br label %264

; <label>:139:                                    ; preds = %127, %123
  %140 = load i32, i32* %8, align 4
  %141 = mul nsw i32 %140, 2
  %142 = load i32, i32* %10, align 4
  %143 = icmp eq i32 %141, %142
  br i1 %143, label %144, label %173

; <label>:144:                                    ; preds = %139
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 3)
  %145 = add i64 %pgocount5, 1
  store i64 %145, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 3)
  %146 = load i32, i32* %9, align 4
  %147 = load i32, i32* %11, align 4
  %148 = icmp eq i32 %146, %147
  br i1 %148, label %149, label %173

; <label>:149:                                    ; preds = %144
  %150 = load i32, i32* %7, align 4
  %151 = icmp ne i32 %150, 0
  br i1 %151, label %152, label %165

; <label>:152:                                    ; preds = %149
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 9)
  %153 = add i64 %pgocount6, 1
  store i64 %153, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 9)
  %154 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %155 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %154, i32 0, i32 10
  %156 = load i32, i32* %155, align 8
  %157 = icmp ugt i32 %156, 2
  br i1 %157, label %158, label %165

; <label>:158:                                    ; preds = %152
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 12)
  %159 = add i64 %pgocount7, 1
  store i64 %159, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 12)
  %160 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %161 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %160, i32 0, i32 2
  %162 = load i32, i32* %4, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %161, i64 0, i64 %163
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v1_fancy_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %164, align 8
  br label %172

; <label>:165:                                    ; preds = %152, %149
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 8)
  %166 = add i64 %pgocount8, 1
  store i64 %166, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 8)
  %167 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %168 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %167, i32 0, i32 2
  %169 = load i32, i32* %4, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %168, i64 0, i64 %170
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v1_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %171, align 8
  br label %172

; <label>:172:                                    ; preds = %165, %158
  br label %263

; <label>:173:                                    ; preds = %144, %139
  %174 = load i32, i32* %8, align 4
  %175 = mul nsw i32 %174, 2
  %176 = load i32, i32* %10, align 4
  %177 = icmp eq i32 %175, %176
  br i1 %177, label %178, label %211

; <label>:178:                                    ; preds = %173
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 5)
  %179 = add i64 %pgocount9, 1
  store i64 %179, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 5)
  %180 = load i32, i32* %9, align 4
  %181 = mul nsw i32 %180, 2
  %182 = load i32, i32* %11, align 4
  %183 = icmp eq i32 %181, %182
  br i1 %183, label %184, label %211

; <label>:184:                                    ; preds = %178
  %185 = load i32, i32* %7, align 4
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %203

; <label>:187:                                    ; preds = %184
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 11)
  %188 = add i64 %pgocount10, 1
  store i64 %188, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 11)
  %189 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %190 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %189, i32 0, i32 10
  %191 = load i32, i32* %190, align 8
  %192 = icmp ugt i32 %191, 2
  br i1 %192, label %193, label %203

; <label>:193:                                    ; preds = %187
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 15)
  %194 = add i64 %pgocount11, 1
  store i64 %194, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 15)
  %195 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %196 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %195, i32 0, i32 2
  %197 = load i32, i32* %4, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %196, i64 0, i64 %198
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v2_fancy_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %199, align 8
  %200 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %201 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %200, i32 0, i32 0
  %202 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %201, i32 0, i32 2
  store i32 1, i32* %202, align 8
  br label %210

; <label>:203:                                    ; preds = %187, %184
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 10)
  %204 = add i64 %pgocount12, 1
  store i64 %204, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 10)
  %205 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %206 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %205, i32 0, i32 2
  %207 = load i32, i32* %4, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %206, i64 0, i64 %208
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @h2v2_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %209, align 8
  br label %210

; <label>:210:                                    ; preds = %203, %193
  br label %262

; <label>:211:                                    ; preds = %178, %173
  %212 = load i32, i32* %10, align 4
  %213 = load i32, i32* %8, align 4
  %214 = srem i32 %212, %213
  %215 = icmp eq i32 %214, 0
  br i1 %215, label %216, label %247

; <label>:216:                                    ; preds = %211
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 7)
  %217 = add i64 %pgocount13, 1
  store i64 %217, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 7)
  %218 = load i32, i32* %11, align 4
  %219 = load i32, i32* %9, align 4
  %220 = srem i32 %218, %219
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %222, label %247

; <label>:222:                                    ; preds = %216
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 13)
  %223 = add i64 %pgocount14, 1
  store i64 %223, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 13)
  %224 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %225 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %224, i32 0, i32 2
  %226 = load i32, i32* %4, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %225, i64 0, i64 %227
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* @int_upsample, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %228, align 8
  %229 = load i32, i32* %10, align 4
  %230 = load i32, i32* %8, align 4
  %231 = sdiv i32 %229, %230
  %232 = trunc i32 %231 to i8
  %233 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %234 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %233, i32 0, i32 6
  %235 = load i32, i32* %4, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [10 x i8], [10 x i8]* %234, i64 0, i64 %236
  store i8 %232, i8* %237, align 1
  %238 = load i32, i32* %11, align 4
  %239 = load i32, i32* %9, align 4
  %240 = sdiv i32 %238, %239
  %241 = trunc i32 %240 to i8
  %242 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %243 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %242, i32 0, i32 7
  %244 = load i32, i32* %4, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [10 x i8], [10 x i8]* %243, i64 0, i64 %245
  store i8 %241, i8* %246, align 1
  br label %261

; <label>:247:                                    ; preds = %216, %211
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 4)
  %248 = add i64 %pgocount15, 1
  store i64 %248, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 4)
  %249 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %250 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %249, i32 0, i32 0
  %251 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %250, align 8
  %252 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %251, i32 0, i32 5
  store i32 37, i32* %252, align 8
  %253 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %254 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %253, i32 0, i32 0
  %255 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %254, align 8
  %256 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %255, i32 0, i32 0
  %257 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %256, align 8
  %258 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %259 = bitcast %struct.jpeg_decompress_struct* %258 to %struct.jpeg_common_struct*
  %260 = ptrtoint void (%struct.jpeg_common_struct*)* %257 to i64
  call void @__llvm_profile_instrument_target(i64 %260, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_upsampler to i8*), i32 2)
  call void %257(%struct.jpeg_common_struct* %259)
  br label %261

; <label>:261:                                    ; preds = %247, %222
  br label %262

; <label>:262:                                    ; preds = %261, %210
  br label %263

; <label>:263:                                    ; preds = %262, %172
  br label %264

; <label>:264:                                    ; preds = %263, %132
  br label %265

; <label>:265:                                    ; preds = %264, %116
  %266 = load i32, i32* %6, align 4
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %297

; <label>:268:                                    ; preds = %265
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 0)
  %269 = add i64 %pgocount16, 1
  store i64 %269, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 0)
  %270 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %271 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %270, i32 0, i32 1
  %272 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %271, align 8
  %273 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %272, i32 0, i32 2
  %274 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %273, align 8
  %275 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %276 = bitcast %struct.jpeg_decompress_struct* %275 to %struct.jpeg_common_struct*
  %277 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %278 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %277, i32 0, i32 26
  %279 = load i32, i32* %278, align 8
  %280 = zext i32 %279 to i64
  %281 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %282 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %281, i32 0, i32 57
  %283 = load i32, i32* %282, align 4
  %284 = sext i32 %283 to i64
  %285 = call i64 @jround_up(i64 %280, i64 %284)
  %286 = trunc i64 %285 to i32
  %287 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %288 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %287, i32 0, i32 58
  %289 = load i32, i32* %288, align 8
  %290 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %274 to i64
  call void @__llvm_profile_instrument_target(i64 %290, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_upsampler to i8*), i32 3)
  %291 = call i8** %274(%struct.jpeg_common_struct* %276, i32 1, i32 %286, i32 %289)
  %292 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %293 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %292, i32 0, i32 1
  %294 = load i32, i32* %4, align 4
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds [10 x i8**], [10 x i8**]* %293, i64 0, i64 %295
  store i8** %291, i8*** %296, align 8
  br label %297

; <label>:297:                                    ; preds = %268, %265
  br label %298

; <label>:298:                                    ; preds = %297
  %299 = load i32, i32* %4, align 4
  %300 = add nsw i32 %299, 1
  store i32 %300, i32* %4, align 4
  %301 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %302 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %301, i32 1
  store %struct.jpeg_component_info* %302, %struct.jpeg_component_info** %5, align 8
  br label %71

; <label>:303:                                    ; preds = %71
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 14)
  %304 = add i64 %pgocount17, 1
  store i64 %304, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_jinit_upsampler, i64 0, i64 14)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_pass_upsample(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_upsample, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_upsample, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_upsampler*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 81
  %7 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %6, align 8
  %8 = bitcast %struct.jpeg_upsampler* %7 to %struct.my_upsampler*
  store %struct.my_upsampler* %8, %struct.my_upsampler** %4, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 58
  %11 = load i32, i32* %10, align 8
  %12 = load %struct.my_upsampler*, %struct.my_upsampler** %4, align 8
  %13 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %12, i32 0, i32 3
  store i32 %11, i32* %13, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 27
  %16 = load i32, i32* %15, align 4
  %17 = load %struct.my_upsampler*, %struct.my_upsampler** %4, align 8
  %18 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %17, i32 0, i32 4
  store i32 %16, i32* %18, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @sep_upsample(%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32) #0 {
  %8 = alloca %struct.jpeg_decompress_struct*, align 8
  %9 = alloca i8***, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8**, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_upsampler*, align 8
  %16 = alloca i32, align 4
  %17 = alloca %struct.jpeg_component_info*, align 8
  %18 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %8, align 8
  store i8*** %1, i8**** %9, align 8
  store i32* %2, i32** %10, align 8
  store i32 %3, i32* %11, align 4
  store i8** %4, i8*** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 81
  %21 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %20, align 8
  %22 = bitcast %struct.jpeg_upsampler* %21 to %struct.my_upsampler*
  store %struct.my_upsampler* %22, %struct.my_upsampler** %15, align 8
  %23 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %24 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %23, i32 0, i32 3
  %25 = load i32, i32* %24, align 8
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 58
  %28 = load i32, i32* %27, align 8
  %29 = icmp sge i32 %25, %28
  br i1 %29, label %30, label %82

; <label>:30:                                     ; preds = %7
  store i32 0, i32* %16, align 4
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 43
  %33 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %32, align 8
  store %struct.jpeg_component_info* %33, %struct.jpeg_component_info** %17, align 8
  br label %34

; <label>:34:                                     ; preds = %72, %30
  %35 = load i32, i32* %16, align 4
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 8
  %38 = load i32, i32* %37, align 8
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %78

; <label>:40:                                     ; preds = %34
  %41 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %42 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %41, i32 0, i32 2
  %43 = load i32, i32* %16, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*]* %42, i64 0, i64 %44
  %46 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)** %45, align 8
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %48 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %49 = load i8***, i8**** %9, align 8
  %50 = load i32, i32* %16, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8**, i8*** %49, i64 %51
  %53 = load i8**, i8*** %52, align 8
  %54 = load i32*, i32** %10, align 8
  %55 = load i32, i32* %54, align 4
  %56 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %57 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %56, i32 0, i32 5
  %58 = load i32, i32* %16, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [10 x i32], [10 x i32]* %57, i64 0, i64 %59
  %61 = load i32, i32* %60, align 4
  %62 = mul i32 %55, %61
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i8*, i8** %53, i64 %63
  %65 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %66 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %65, i32 0, i32 1
  %67 = getelementptr inbounds [10 x i8**], [10 x i8**]* %66, i32 0, i32 0
  %68 = load i32, i32* %16, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8**, i8*** %67, i64 %69
  %71 = ptrtoint void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***)* %46 to i64
  call void @__llvm_profile_instrument_target(i64 %71, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sep_upsample to i8*), i32 0)
  call void %46(%struct.jpeg_decompress_struct* %47, %struct.jpeg_component_info* %48, i8** %64, i8*** %70)
  br label %72

; <label>:72:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 0)
  %73 = add i64 %pgocount, 1
  store i64 %73, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 0)
  %74 = load i32, i32* %16, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %16, align 4
  %76 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %76, i32 1
  store %struct.jpeg_component_info* %77, %struct.jpeg_component_info** %17, align 8
  br label %34

; <label>:78:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 2)
  %79 = add i64 %pgocount1, 1
  store i64 %79, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 2)
  %80 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %81 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %80, i32 0, i32 3
  store i32 0, i32* %81, align 8
  br label %82

; <label>:82:                                     ; preds = %78, %7
  %83 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %83, i32 0, i32 58
  %85 = load i32, i32* %84, align 8
  %86 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %87 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %86, i32 0, i32 3
  %88 = load i32, i32* %87, align 8
  %89 = sub nsw i32 %85, %88
  store i32 %89, i32* %18, align 4
  %90 = load i32, i32* %18, align 4
  %91 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %92 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %91, i32 0, i32 4
  %93 = load i32, i32* %92, align 4
  %94 = icmp ugt i32 %90, %93
  br i1 %94, label %95, label %100

; <label>:95:                                     ; preds = %82
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 3)
  %96 = add i64 %pgocount2, 1
  store i64 %96, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 3)
  %97 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %98 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %97, i32 0, i32 4
  %99 = load i32, i32* %98, align 4
  store i32 %99, i32* %18, align 4
  br label %100

; <label>:100:                                    ; preds = %95, %82
  %101 = load i32*, i32** %13, align 8
  %102 = load i32, i32* %101, align 4
  %103 = load i32, i32* %14, align 4
  %104 = sub i32 %103, %102
  store i32 %104, i32* %14, align 4
  %105 = load i32, i32* %18, align 4
  %106 = load i32, i32* %14, align 4
  %107 = icmp ugt i32 %105, %106
  br i1 %107, label %108, label %111

; <label>:108:                                    ; preds = %100
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 4)
  %109 = add i64 %pgocount3, 1
  store i64 %109, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 4)
  %110 = load i32, i32* %14, align 4
  store i32 %110, i32* %18, align 4
  br label %111

; <label>:111:                                    ; preds = %108, %100
  %112 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %113 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %112, i32 0, i32 82
  %114 = load %struct.jpeg_color_deconverter*, %struct.jpeg_color_deconverter** %113, align 8
  %115 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %114, i32 0, i32 1
  %116 = load void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)** %115, align 8
  %117 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %118 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %119 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %118, i32 0, i32 1
  %120 = getelementptr inbounds [10 x i8**], [10 x i8**]* %119, i32 0, i32 0
  %121 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %122 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %121, i32 0, i32 3
  %123 = load i32, i32* %122, align 8
  %124 = load i8**, i8*** %12, align 8
  %125 = load i32*, i32** %13, align 8
  %126 = load i32, i32* %125, align 4
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i8*, i8** %124, i64 %127
  %129 = load i32, i32* %18, align 4
  %130 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* %116 to i64
  call void @__llvm_profile_instrument_target(i64 %130, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_sep_upsample to i8*), i32 1)
  call void %116(%struct.jpeg_decompress_struct* %117, i8*** %120, i32 %123, i8** %128, i32 %129)
  %131 = load i32, i32* %18, align 4
  %132 = load i32*, i32** %13, align 8
  %133 = load i32, i32* %132, align 4
  %134 = add i32 %133, %131
  store i32 %134, i32* %132, align 4
  %135 = load i32, i32* %18, align 4
  %136 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %137 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %136, i32 0, i32 4
  %138 = load i32, i32* %137, align 4
  %139 = sub i32 %138, %135
  store i32 %139, i32* %137, align 4
  %140 = load i32, i32* %18, align 4
  %141 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %142 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %141, i32 0, i32 3
  %143 = load i32, i32* %142, align 8
  %144 = add i32 %143, %140
  store i32 %144, i32* %142, align 8
  %145 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %146 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %145, i32 0, i32 3
  %147 = load i32, i32* %146, align 8
  %148 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %149 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %148, i32 0, i32 58
  %150 = load i32, i32* %149, align 8
  %151 = icmp sge i32 %147, %150
  br i1 %151, label %152, label %157

; <label>:152:                                    ; preds = %111
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 5)
  %153 = add i64 %pgocount4, 1
  store i64 %153, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 5)
  %154 = load i32*, i32** %10, align 8
  %155 = load i32, i32* %154, align 4
  %156 = add i32 %155, 1
  store i32 %156, i32* %154, align 4
  br label %157

; <label>:157:                                    ; preds = %152, %111
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 1)
  %158 = add i64 %pgocount5, 1
  store i64 %158, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_sep_upsample, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @noop_upsample(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_noop_upsample, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_noop_upsample, i64 0, i64 0)
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i8***, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %7, align 8
  store i8** %2, i8*** %8, align 8
  store i8*** %3, i8**** %9, align 8
  %10 = load i8***, i8**** %9, align 8
  store i8** null, i8*** %10, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @fullsize_upsample(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fullsize_upsample, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fullsize_upsample, i64 0, i64 0)
  %6 = alloca %struct.jpeg_decompress_struct*, align 8
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i8***, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %6, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %7, align 8
  store i8** %2, i8*** %8, align 8
  store i8*** %3, i8**** %9, align 8
  %10 = load i8**, i8*** %8, align 8
  %11 = load i8***, i8**** %9, align 8
  store i8** %10, i8*** %11, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @h2v1_fancy_upsample(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8*** %3, i8**** %8, align 8
  %15 = load i8***, i8**** %8, align 8
  %16 = load i8**, i8*** %15, align 8
  store i8** %16, i8*** %9, align 8
  store i32 0, i32* %14, align 4
  br label %17

; <label>:17:                                     ; preds = %111, %4
  %18 = load i32, i32* %14, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 58
  %21 = load i32, i32* %20, align 8
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %23, label %115

; <label>:23:                                     ; preds = %17
  %24 = load i8**, i8*** %7, align 8
  %25 = load i32, i32* %14, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8*, i8** %24, i64 %26
  %28 = load i8*, i8** %27, align 8
  store i8* %28, i8** %10, align 8
  %29 = load i8**, i8*** %9, align 8
  %30 = load i32, i32* %14, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8*, i8** %29, i64 %31
  %33 = load i8*, i8** %32, align 8
  store i8* %33, i8** %11, align 8
  %34 = load i8*, i8** %10, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %10, align 8
  %36 = load i8, i8* %34, align 1
  %37 = zext i8 %36 to i32
  store i32 %37, i32* %12, align 4
  %38 = load i32, i32* %12, align 4
  %39 = trunc i32 %38 to i8
  %40 = load i8*, i8** %11, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %11, align 8
  store i8 %39, i8* %40, align 1
  %42 = load i32, i32* %12, align 4
  %43 = mul nsw i32 %42, 3
  %44 = load i8*, i8** %10, align 8
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = add nsw i32 %43, %46
  %48 = add nsw i32 %47, 2
  %49 = ashr i32 %48, 2
  %50 = trunc i32 %49 to i8
  %51 = load i8*, i8** %11, align 8
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %11, align 8
  store i8 %50, i8* %51, align 1
  %53 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %54 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %53, i32 0, i32 10
  %55 = load i32, i32* %54, align 8
  %56 = sub i32 %55, 2
  store i32 %56, i32* %13, align 4
  br label %57

; <label>:57:                                     ; preds = %87, %23
  %58 = load i32, i32* %13, align 4
  %59 = icmp ugt i32 %58, 0
  br i1 %59, label %60, label %91

; <label>:60:                                     ; preds = %57
  %61 = load i8*, i8** %10, align 8
  %62 = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %62, i8** %10, align 8
  %63 = load i8, i8* %61, align 1
  %64 = zext i8 %63 to i32
  %65 = mul nsw i32 %64, 3
  store i32 %65, i32* %12, align 4
  %66 = load i32, i32* %12, align 4
  %67 = load i8*, i8** %10, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 -2
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = add nsw i32 %66, %70
  %72 = add nsw i32 %71, 1
  %73 = ashr i32 %72, 2
  %74 = trunc i32 %73 to i8
  %75 = load i8*, i8** %11, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %11, align 8
  store i8 %74, i8* %75, align 1
  %77 = load i32, i32* %12, align 4
  %78 = load i8*, i8** %10, align 8
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = add nsw i32 %77, %80
  %82 = add nsw i32 %81, 2
  %83 = ashr i32 %82, 2
  %84 = trunc i32 %83 to i8
  %85 = load i8*, i8** %11, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %86, i8** %11, align 8
  store i8 %84, i8* %85, align 1
  br label %87

; <label>:87:                                     ; preds = %60
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_fancy_upsample, i64 0, i64 0)
  %88 = add i64 %pgocount, 1
  store i64 %88, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_fancy_upsample, i64 0, i64 0)
  %89 = load i32, i32* %13, align 4
  %90 = add i32 %89, -1
  store i32 %90, i32* %13, align 4
  br label %57

; <label>:91:                                     ; preds = %57
  %92 = load i8*, i8** %10, align 8
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  store i32 %94, i32* %12, align 4
  %95 = load i32, i32* %12, align 4
  %96 = mul nsw i32 %95, 3
  %97 = load i8*, i8** %10, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 -1
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = add nsw i32 %96, %100
  %102 = add nsw i32 %101, 1
  %103 = ashr i32 %102, 2
  %104 = trunc i32 %103 to i8
  %105 = load i8*, i8** %11, align 8
  %106 = getelementptr inbounds i8, i8* %105, i32 1
  store i8* %106, i8** %11, align 8
  store i8 %104, i8* %105, align 1
  %107 = load i32, i32* %12, align 4
  %108 = trunc i32 %107 to i8
  %109 = load i8*, i8** %11, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %110, i8** %11, align 8
  store i8 %108, i8* %109, align 1
  br label %111

; <label>:111:                                    ; preds = %91
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_fancy_upsample, i64 0, i64 1)
  %112 = add i64 %pgocount1, 1
  store i64 %112, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_fancy_upsample, i64 0, i64 1)
  %113 = load i32, i32* %14, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %14, align 4
  br label %17

; <label>:115:                                    ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_fancy_upsample, i64 0, i64 2)
  %116 = add i64 %pgocount2, 1
  store i64 %116, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_fancy_upsample, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @h2v1_upsample(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8, align 1
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8*** %3, i8**** %8, align 8
  %15 = load i8***, i8**** %8, align 8
  %16 = load i8**, i8*** %15, align 8
  store i8** %16, i8*** %9, align 8
  store i32 0, i32* %14, align 4
  br label %17

; <label>:17:                                     ; preds = %56, %4
  %18 = load i32, i32* %14, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 58
  %21 = load i32, i32* %20, align 8
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %23, label %60

; <label>:23:                                     ; preds = %17
  %24 = load i8**, i8*** %7, align 8
  %25 = load i32, i32* %14, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8*, i8** %24, i64 %26
  %28 = load i8*, i8** %27, align 8
  store i8* %28, i8** %10, align 8
  %29 = load i8**, i8*** %9, align 8
  %30 = load i32, i32* %14, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8*, i8** %29, i64 %31
  %33 = load i8*, i8** %32, align 8
  store i8* %33, i8** %11, align 8
  %34 = load i8*, i8** %11, align 8
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 26
  %37 = load i32, i32* %36, align 8
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8* %34, i64 %38
  store i8* %39, i8** %13, align 8
  br label %40

; <label>:40:                                     ; preds = %44, %23
  %41 = load i8*, i8** %11, align 8
  %42 = load i8*, i8** %13, align 8
  %43 = icmp ult i8* %41, %42
  br i1 %43, label %44, label %55

; <label>:44:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_upsample, i64 0, i64 0)
  %45 = add i64 %pgocount, 1
  store i64 %45, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_upsample, i64 0, i64 0)
  %46 = load i8*, i8** %10, align 8
  %47 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %47, i8** %10, align 8
  %48 = load i8, i8* %46, align 1
  store i8 %48, i8* %12, align 1
  %49 = load i8, i8* %12, align 1
  %50 = load i8*, i8** %11, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %11, align 8
  store i8 %49, i8* %50, align 1
  %52 = load i8, i8* %12, align 1
  %53 = load i8*, i8** %11, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %11, align 8
  store i8 %52, i8* %53, align 1
  br label %40

; <label>:55:                                     ; preds = %40
  br label %56

; <label>:56:                                     ; preds = %55
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_upsample, i64 0, i64 1)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_upsample, i64 0, i64 1)
  %58 = load i32, i32* %14, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %14, align 4
  br label %17

; <label>:60:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_upsample, i64 0, i64 2)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_upsample, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @h2v2_fancy_upsample(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8*** %3, i8**** %8, align 8
  %20 = load i8***, i8**** %8, align 8
  %21 = load i8**, i8*** %20, align 8
  store i8** %21, i8*** %9, align 8
  store i32 0, i32* %18, align 4
  store i32 0, i32* %17, align 4
  br label %22

; <label>:22:                                     ; preds = %163, %4
  %23 = load i32, i32* %18, align 4
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 58
  %26 = load i32, i32* %25, align 8
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %167

; <label>:28:                                     ; preds = %22
  store i32 0, i32* %19, align 4
  br label %29

; <label>:29:                                     ; preds = %160, %28
  %30 = load i32, i32* %19, align 4
  %31 = icmp slt i32 %30, 2
  br i1 %31, label %32, label %163

; <label>:32:                                     ; preds = %29
  %33 = load i8**, i8*** %7, align 8
  %34 = load i32, i32* %17, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8*, i8** %33, i64 %35
  %37 = load i8*, i8** %36, align 8
  store i8* %37, i8** %10, align 8
  %38 = load i32, i32* %19, align 4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %48

; <label>:40:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 2)
  %41 = add i64 %pgocount, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 2)
  %42 = load i8**, i8*** %7, align 8
  %43 = load i32, i32* %17, align 4
  %44 = sub nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8*, i8** %42, i64 %45
  %47 = load i8*, i8** %46, align 8
  store i8* %47, i8** %11, align 8
  br label %56

; <label>:48:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 1)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 1)
  %50 = load i8**, i8*** %7, align 8
  %51 = load i32, i32* %17, align 4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8*, i8** %50, i64 %53
  %55 = load i8*, i8** %54, align 8
  store i8* %55, i8** %11, align 8
  br label %56

; <label>:56:                                     ; preds = %48, %40
  %57 = load i8**, i8*** %9, align 8
  %58 = load i32, i32* %18, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %18, align 4
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds i8*, i8** %57, i64 %60
  %62 = load i8*, i8** %61, align 8
  store i8* %62, i8** %12, align 8
  %63 = load i8*, i8** %10, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %10, align 8
  %65 = load i8, i8* %63, align 1
  %66 = zext i8 %65 to i32
  %67 = mul nsw i32 %66, 3
  %68 = load i8*, i8** %11, align 8
  %69 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %69, i8** %11, align 8
  %70 = load i8, i8* %68, align 1
  %71 = zext i8 %70 to i32
  %72 = add nsw i32 %67, %71
  store i32 %72, i32* %13, align 4
  %73 = load i8*, i8** %10, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %10, align 8
  %75 = load i8, i8* %73, align 1
  %76 = zext i8 %75 to i32
  %77 = mul nsw i32 %76, 3
  %78 = load i8*, i8** %11, align 8
  %79 = getelementptr inbounds i8, i8* %78, i32 1
  store i8* %79, i8** %11, align 8
  %80 = load i8, i8* %78, align 1
  %81 = zext i8 %80 to i32
  %82 = add nsw i32 %77, %81
  store i32 %82, i32* %15, align 4
  %83 = load i32, i32* %13, align 4
  %84 = mul nsw i32 %83, 4
  %85 = add nsw i32 %84, 8
  %86 = ashr i32 %85, 4
  %87 = trunc i32 %86 to i8
  %88 = load i8*, i8** %12, align 8
  %89 = getelementptr inbounds i8, i8* %88, i32 1
  store i8* %89, i8** %12, align 8
  store i8 %87, i8* %88, align 1
  %90 = load i32, i32* %13, align 4
  %91 = mul nsw i32 %90, 3
  %92 = load i32, i32* %15, align 4
  %93 = add nsw i32 %91, %92
  %94 = add nsw i32 %93, 7
  %95 = ashr i32 %94, 4
  %96 = trunc i32 %95 to i8
  %97 = load i8*, i8** %12, align 8
  %98 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %98, i8** %12, align 8
  store i8 %96, i8* %97, align 1
  %99 = load i32, i32* %13, align 4
  store i32 %99, i32* %14, align 4
  %100 = load i32, i32* %15, align 4
  store i32 %100, i32* %13, align 4
  %101 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i32 0, i32 10
  %103 = load i32, i32* %102, align 8
  %104 = sub i32 %103, 2
  store i32 %104, i32* %16, align 4
  br label %105

; <label>:105:                                    ; preds = %139, %56
  %106 = load i32, i32* %16, align 4
  %107 = icmp ugt i32 %106, 0
  br i1 %107, label %108, label %143

; <label>:108:                                    ; preds = %105
  %109 = load i8*, i8** %10, align 8
  %110 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %110, i8** %10, align 8
  %111 = load i8, i8* %109, align 1
  %112 = zext i8 %111 to i32
  %113 = mul nsw i32 %112, 3
  %114 = load i8*, i8** %11, align 8
  %115 = getelementptr inbounds i8, i8* %114, i32 1
  store i8* %115, i8** %11, align 8
  %116 = load i8, i8* %114, align 1
  %117 = zext i8 %116 to i32
  %118 = add nsw i32 %113, %117
  store i32 %118, i32* %15, align 4
  %119 = load i32, i32* %13, align 4
  %120 = mul nsw i32 %119, 3
  %121 = load i32, i32* %14, align 4
  %122 = add nsw i32 %120, %121
  %123 = add nsw i32 %122, 8
  %124 = ashr i32 %123, 4
  %125 = trunc i32 %124 to i8
  %126 = load i8*, i8** %12, align 8
  %127 = getelementptr inbounds i8, i8* %126, i32 1
  store i8* %127, i8** %12, align 8
  store i8 %125, i8* %126, align 1
  %128 = load i32, i32* %13, align 4
  %129 = mul nsw i32 %128, 3
  %130 = load i32, i32* %15, align 4
  %131 = add nsw i32 %129, %130
  %132 = add nsw i32 %131, 7
  %133 = ashr i32 %132, 4
  %134 = trunc i32 %133 to i8
  %135 = load i8*, i8** %12, align 8
  %136 = getelementptr inbounds i8, i8* %135, i32 1
  store i8* %136, i8** %12, align 8
  store i8 %134, i8* %135, align 1
  %137 = load i32, i32* %13, align 4
  store i32 %137, i32* %14, align 4
  %138 = load i32, i32* %15, align 4
  store i32 %138, i32* %13, align 4
  br label %139

; <label>:139:                                    ; preds = %108
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 0)
  %140 = add i64 %pgocount2, 1
  store i64 %140, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 0)
  %141 = load i32, i32* %16, align 4
  %142 = add i32 %141, -1
  store i32 %142, i32* %16, align 4
  br label %105

; <label>:143:                                    ; preds = %105
  %144 = load i32, i32* %13, align 4
  %145 = mul nsw i32 %144, 3
  %146 = load i32, i32* %14, align 4
  %147 = add nsw i32 %145, %146
  %148 = add nsw i32 %147, 8
  %149 = ashr i32 %148, 4
  %150 = trunc i32 %149 to i8
  %151 = load i8*, i8** %12, align 8
  %152 = getelementptr inbounds i8, i8* %151, i32 1
  store i8* %152, i8** %12, align 8
  store i8 %150, i8* %151, align 1
  %153 = load i32, i32* %13, align 4
  %154 = mul nsw i32 %153, 4
  %155 = add nsw i32 %154, 7
  %156 = ashr i32 %155, 4
  %157 = trunc i32 %156 to i8
  %158 = load i8*, i8** %12, align 8
  %159 = getelementptr inbounds i8, i8* %158, i32 1
  store i8* %159, i8** %12, align 8
  store i8 %157, i8* %158, align 1
  br label %160

; <label>:160:                                    ; preds = %143
  %161 = load i32, i32* %19, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %19, align 4
  br label %29

; <label>:163:                                    ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 3)
  %164 = add i64 %pgocount3, 1
  store i64 %164, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 3)
  %165 = load i32, i32* %17, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %17, align 4
  br label %22

; <label>:167:                                    ; preds = %22
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 4)
  %168 = add i64 %pgocount4, 1
  store i64 %168, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_h2v2_fancy_upsample, i64 0, i64 4)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @h2v2_upsample(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8, align 1
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8*** %3, i8**** %8, align 8
  %16 = load i8***, i8**** %8, align 8
  %17 = load i8**, i8*** %16, align 8
  store i8** %17, i8*** %9, align 8
  store i32 0, i32* %15, align 4
  store i32 0, i32* %14, align 4
  br label %18

; <label>:18:                                     ; preds = %56, %4
  %19 = load i32, i32* %15, align 4
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 58
  %22 = load i32, i32* %21, align 8
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %70

; <label>:24:                                     ; preds = %18
  %25 = load i8**, i8*** %7, align 8
  %26 = load i32, i32* %14, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8*, i8** %25, i64 %27
  %29 = load i8*, i8** %28, align 8
  store i8* %29, i8** %10, align 8
  %30 = load i8**, i8*** %9, align 8
  %31 = load i32, i32* %15, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8*, i8** %30, i64 %32
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i8** %11, align 8
  %35 = load i8*, i8** %11, align 8
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 26
  %38 = load i32, i32* %37, align 8
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8* %35, i64 %39
  store i8* %40, i8** %13, align 8
  br label %41

; <label>:41:                                     ; preds = %45, %24
  %42 = load i8*, i8** %11, align 8
  %43 = load i8*, i8** %13, align 8
  %44 = icmp ult i8* %42, %43
  br i1 %44, label %45, label %56

; <label>:45:                                     ; preds = %41
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_upsample, i64 0, i64 0)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_upsample, i64 0, i64 0)
  %47 = load i8*, i8** %10, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %10, align 8
  %49 = load i8, i8* %47, align 1
  store i8 %49, i8* %12, align 1
  %50 = load i8, i8* %12, align 1
  %51 = load i8*, i8** %11, align 8
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %11, align 8
  store i8 %50, i8* %51, align 1
  %53 = load i8, i8* %12, align 1
  %54 = load i8*, i8** %11, align 8
  %55 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %55, i8** %11, align 8
  store i8 %53, i8* %54, align 1
  br label %41

; <label>:56:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_upsample, i64 0, i64 1)
  %57 = add i64 %pgocount1, 1
  store i64 %57, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_upsample, i64 0, i64 1)
  %58 = load i8**, i8*** %9, align 8
  %59 = load i32, i32* %15, align 4
  %60 = load i8**, i8*** %9, align 8
  %61 = load i32, i32* %15, align 4
  %62 = add nsw i32 %61, 1
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 26
  %65 = load i32, i32* %64, align 8
  call void @jcopy_sample_rows(i8** %58, i32 %59, i8** %60, i32 %62, i32 1, i32 %65)
  %66 = load i32, i32* %14, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %14, align 4
  %68 = load i32, i32* %15, align 4
  %69 = add nsw i32 %68, 2
  store i32 %69, i32* %15, align 4
  br label %18

; <label>:70:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_upsample, i64 0, i64 2)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_upsample, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @int_upsample(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i8**, i8***) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8***, align 8
  %9 = alloca %struct.my_upsampler*, align 8
  %10 = alloca i8**, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store %struct.jpeg_component_info* %1, %struct.jpeg_component_info** %6, align 8
  store i8** %2, i8*** %7, align 8
  store i8*** %3, i8**** %8, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 81
  %22 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %21, align 8
  %23 = bitcast %struct.jpeg_upsampler* %22 to %struct.my_upsampler*
  store %struct.my_upsampler* %23, %struct.my_upsampler** %9, align 8
  %24 = load i8***, i8**** %8, align 8
  %25 = load i8**, i8*** %24, align 8
  store i8** %25, i8*** %10, align 8
  %26 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %27 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %26, i32 0, i32 6
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i32 0, i32 1
  %30 = load i32, i32* %29, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [10 x i8], [10 x i8]* %27, i64 0, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  store i32 %34, i32* %16, align 4
  %35 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %36 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %35, i32 0, i32 7
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i32 0, i32 1
  %39 = load i32, i32* %38, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [10 x i8], [10 x i8]* %36, i64 0, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  store i32 %43, i32* %17, align 4
  store i32 0, i32* %19, align 4
  store i32 0, i32* %18, align 4
  br label %44

; <label>:44:                                     ; preds = %104, %4
  %45 = load i32, i32* %19, align 4
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 58
  %48 = load i32, i32* %47, align 8
  %49 = icmp slt i32 %45, %48
  br i1 %49, label %50, label %111

; <label>:50:                                     ; preds = %44
  %51 = load i8**, i8*** %7, align 8
  %52 = load i32, i32* %18, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8*, i8** %51, i64 %53
  %55 = load i8*, i8** %54, align 8
  store i8* %55, i8** %11, align 8
  %56 = load i8**, i8*** %10, align 8
  %57 = load i32, i32* %19, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8*, i8** %56, i64 %58
  %60 = load i8*, i8** %59, align 8
  store i8* %60, i8** %12, align 8
  %61 = load i8*, i8** %12, align 8
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 26
  %64 = load i32, i32* %63, align 8
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8* %61, i64 %65
  store i8* %66, i8** %15, align 8
  br label %67

; <label>:67:                                     ; preds = %87, %50
  %68 = load i8*, i8** %12, align 8
  %69 = load i8*, i8** %15, align 8
  %70 = icmp ult i8* %68, %69
  br i1 %70, label %71, label %89

; <label>:71:                                     ; preds = %67
  %72 = load i8*, i8** %11, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %11, align 8
  %74 = load i8, i8* %72, align 1
  store i8 %74, i8* %13, align 1
  %75 = load i32, i32* %16, align 4
  store i32 %75, i32* %14, align 4
  br label %76

; <label>:76:                                     ; preds = %83, %71
  %77 = load i32, i32* %14, align 4
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %79, label %87

; <label>:79:                                     ; preds = %76
  %80 = load i8, i8* %13, align 1
  %81 = load i8*, i8** %12, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %12, align 8
  store i8 %80, i8* %81, align 1
  br label %83

; <label>:83:                                     ; preds = %79
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 0)
  %84 = add i64 %pgocount, 1
  store i64 %84, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 0)
  %85 = load i32, i32* %14, align 4
  %86 = add nsw i32 %85, -1
  store i32 %86, i32* %14, align 4
  br label %76

; <label>:87:                                     ; preds = %76
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 1)
  %88 = add i64 %pgocount1, 1
  store i64 %88, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 1)
  br label %67

; <label>:89:                                     ; preds = %67
  %90 = load i32, i32* %17, align 4
  %91 = icmp sgt i32 %90, 1
  br i1 %91, label %92, label %104

; <label>:92:                                     ; preds = %89
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 3)
  %93 = add i64 %pgocount2, 1
  store i64 %93, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 3)
  %94 = load i8**, i8*** %10, align 8
  %95 = load i32, i32* %19, align 4
  %96 = load i8**, i8*** %10, align 8
  %97 = load i32, i32* %19, align 4
  %98 = add nsw i32 %97, 1
  %99 = load i32, i32* %17, align 4
  %100 = sub nsw i32 %99, 1
  %101 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %102 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %101, i32 0, i32 26
  %103 = load i32, i32* %102, align 8
  call void @jcopy_sample_rows(i8** %94, i32 %95, i8** %96, i32 %98, i32 %100, i32 %103)
  br label %104

; <label>:104:                                    ; preds = %92, %89
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 2)
  %105 = add i64 %pgocount3, 1
  store i64 %105, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 2)
  %106 = load i32, i32* %18, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %18, align 4
  %108 = load i32, i32* %17, align 4
  %109 = load i32, i32* %19, align 4
  %110 = add nsw i32 %109, %108
  store i32 %110, i32* %19, align 4
  br label %44

; <label>:111:                                    ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 4)
  %112 = add i64 %pgocount4, 1
  store i64 %112, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_int_upsample, i64 0, i64 4)
  ret void
}

declare i64 @jround_up(i64, i64) #1

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
