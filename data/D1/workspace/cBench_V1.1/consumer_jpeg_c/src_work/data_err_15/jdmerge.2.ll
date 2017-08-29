; ModuleID = 'tmp1.ll'
source_filename = "jdmerge.c"
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
%struct.my_upsampler = type { %struct.jpeg_upsampler, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)*, i32*, i32*, i64*, i64*, i8*, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_merged_upsampler = private constant [22 x i8] c"jinit_merged_upsampler"
@__profn_tmp1.ll_start_pass_merged_upsample = private constant [34 x i8] c"tmp1.ll:start_pass_merged_upsample"
@__profn_tmp1.ll_merged_2v_upsample = private constant [26 x i8] c"tmp1.ll:merged_2v_upsample"
@__profn_tmp1.ll_h2v2_merged_upsample = private constant [28 x i8] c"tmp1.ll:h2v2_merged_upsample"
@__profn_tmp1.ll_merged_1v_upsample = private constant [26 x i8] c"tmp1.ll:merged_1v_upsample"
@__profn_tmp1.ll_h2v1_merged_upsample = private constant [28 x i8] c"tmp1.ll:h2v1_merged_upsample"
@__profn_tmp1.ll_build_ycc_rgb_table = private constant [27 x i8] c"tmp1.ll:build_ycc_rgb_table"
@__profc_jinit_merged_upsampler = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_merged_upsampler = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_merged_upsampler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 650823236019431640, i64 562979620969108, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_merged_upsampler, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_merged_upsampler to i8*), i8* bitcast ([2 x i64]* @__profvp_jinit_merged_upsampler to i8*), i32 2, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_merged_upsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_pass_merged_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3557083523637809101, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_merged_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_pass_merged_upsample to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_merged_2v_upsample = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_merged_2v_upsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_merged_2v_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2476576706351640704, i64 281559867834408, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @merged_2v_upsample to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_merged_2v_upsample to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v2_merged_upsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v2_merged_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7684002251862737433, i64 44592619267, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_merged_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* @h2v2_merged_upsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_merged_1v_upsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_merged_1v_upsample = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_merged_1v_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8571470851096616084, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_merged_1v_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @merged_1v_upsample to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_merged_1v_upsample to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_h2v1_merged_upsample = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_h2v1_merged_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5075496817349995343, i64 44592619267, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_merged_upsample, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* @h2v1_merged_upsample to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_build_ycc_rgb_table = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_build_ycc_rgb_table = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_build_ycc_rgb_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5273068293917428044, i64 1125934044502940, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i32 0, i32 0), i8* null, i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_build_ycc_rgb_table to i8*), i32 2, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [16 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [200 x i8] c"\C5\01\00jinit_merged_upsampler\01tmp1.ll:start_pass_merged_upsample\01tmp1.ll:merged_2v_upsample\01tmp1.ll:h2v2_merged_upsample\01tmp1.ll:merged_1v_upsample\01tmp1.ll:h2v1_merged_upsample\01tmp1.ll:build_ycc_rgb_table", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_merged_upsampler to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_merged_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_merged_2v_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v2_merged_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_merged_1v_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_h2v1_merged_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i8* bitcast ([16 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([200 x i8], [200 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_merged_upsampler(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_upsampler*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i32 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = bitcast %struct.jpeg_decompress_struct* %9 to %struct.jpeg_common_struct*
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_merged_upsampler to i8*), i32 0)
  %12 = call i8* %8(%struct.jpeg_common_struct* %10, i32 1, i64 88)
  %13 = bitcast i8* %12 to %struct.my_upsampler*
  store %struct.my_upsampler* %13, %struct.my_upsampler** %3, align 8
  %14 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %15 = bitcast %struct.my_upsampler* %14 to %struct.jpeg_upsampler*
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 81
  store %struct.jpeg_upsampler* %15, %struct.jpeg_upsampler** %17, align 8
  %18 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %19 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %19, i32 0, i32 0
  %21 = bitcast {}** %20 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_merged_upsample, void (%struct.jpeg_decompress_struct*)** %21, align 8
  %22 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %23 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %23, i32 0, i32 2
  store i32 0, i32* %24, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 26
  %27 = load i32, i32* %26, align 8
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 28
  %30 = load i32, i32* %29, align 8
  %31 = mul i32 %27, %30
  %32 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %33 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %32, i32 0, i32 8
  store i32 %31, i32* %33, align 4
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 58
  %36 = load i32, i32* %35, align 8
  %37 = icmp eq i32 %36, 2
  br i1 %37, label %38, label %61

; <label>:38:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_merged_upsampler, i64 0, i64 0)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_merged_upsampler, i64 0, i64 0)
  %40 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %41 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %40, i32 0, i32 0
  %42 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %41, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @merged_2v_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %42, align 8
  %43 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %44 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %43, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* @h2v2_merged_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %44, align 8
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 1
  %47 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %47, i32 0, i32 1
  %49 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %48, align 8
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %51 = bitcast %struct.jpeg_decompress_struct* %50 to %struct.jpeg_common_struct*
  %52 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %53 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %52, i32 0, i32 8
  %54 = load i32, i32* %53, align 4
  %55 = zext i32 %54 to i64
  %56 = mul i64 %55, 1
  %57 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_merged_upsampler to i8*), i32 1)
  %58 = call i8* %49(%struct.jpeg_common_struct* %51, i32 1, i64 %56)
  %59 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %60 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %59, i32 0, i32 6
  store i8* %58, i8** %60, align 8
  br label %70

; <label>:61:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_merged_upsampler, i64 0, i64 1)
  %62 = add i64 %pgocount1, 1
  store i64 %62, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_merged_upsampler, i64 0, i64 1)
  %63 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %64 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %63, i32 0, i32 0
  %65 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %64, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @merged_1v_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %65, align 8
  %66 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %67 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %66, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* @h2v1_merged_upsample, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %67, align 8
  %68 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %69 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %68, i32 0, i32 6
  store i8* null, i8** %69, align 8
  br label %70

; <label>:70:                                     ; preds = %61, %38
  %71 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @build_ycc_rgb_table(%struct.jpeg_decompress_struct* %71)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_merged_upsample(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_merged_upsample, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_pass_merged_upsample, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_upsampler*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 81
  %7 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %6, align 8
  %8 = bitcast %struct.jpeg_upsampler* %7 to %struct.my_upsampler*
  store %struct.my_upsampler* %8, %struct.my_upsampler** %4, align 8
  %9 = load %struct.my_upsampler*, %struct.my_upsampler** %4, align 8
  %10 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %9, i32 0, i32 7
  store i32 0, i32* %10, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 27
  %13 = load i32, i32* %12, align 4
  %14 = load %struct.my_upsampler*, %struct.my_upsampler** %4, align 8
  %15 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %14, i32 0, i32 9
  store i32 %13, i32* %15, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @merged_2v_upsample(%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32) #0 {
  %8 = alloca %struct.jpeg_decompress_struct*, align 8
  %9 = alloca i8***, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8**, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_upsampler*, align 8
  %16 = alloca [2 x i8*], align 16
  %17 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %8, align 8
  store i8*** %1, i8**** %9, align 8
  store i32* %2, i32** %10, align 8
  store i32 %3, i32* %11, align 4
  store i8** %4, i8*** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 81
  %20 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %19, align 8
  %21 = bitcast %struct.jpeg_upsampler* %20 to %struct.my_upsampler*
  store %struct.my_upsampler* %21, %struct.my_upsampler** %15, align 8
  %22 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %23 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %22, i32 0, i32 7
  %24 = load i32, i32* %23, align 8
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %40

; <label>:26:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 0)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 0)
  %28 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %29 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %28, i32 0, i32 6
  %30 = load i8**, i8*** %12, align 8
  %31 = load i32*, i32** %13, align 8
  %32 = load i32, i32* %31, align 4
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i8*, i8** %30, i64 %33
  %35 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %36 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %35, i32 0, i32 8
  %37 = load i32, i32* %36, align 4
  call void @jcopy_sample_rows(i8** %29, i32 0, i8** %34, i32 0, i32 1, i32 %37)
  store i32 1, i32* %17, align 4
  %38 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %39 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %38, i32 0, i32 7
  store i32 0, i32* %39, align 8
  br label %100

; <label>:40:                                     ; preds = %7
  store i32 2, i32* %17, align 4
  %41 = load i32, i32* %17, align 4
  %42 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %43 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %42, i32 0, i32 9
  %44 = load i32, i32* %43, align 8
  %45 = icmp ugt i32 %41, %44
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 2)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 2)
  %48 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %49 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %48, i32 0, i32 9
  %50 = load i32, i32* %49, align 8
  store i32 %50, i32* %17, align 4
  br label %51

; <label>:51:                                     ; preds = %46, %40
  %52 = load i32*, i32** %13, align 8
  %53 = load i32, i32* %52, align 4
  %54 = load i32, i32* %14, align 4
  %55 = sub i32 %54, %53
  store i32 %55, i32* %14, align 4
  %56 = load i32, i32* %17, align 4
  %57 = load i32, i32* %14, align 4
  %58 = icmp ugt i32 %56, %57
  br i1 %58, label %59, label %62

; <label>:59:                                     ; preds = %51
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 3)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 3)
  %61 = load i32, i32* %14, align 4
  store i32 %61, i32* %17, align 4
  br label %62

; <label>:62:                                     ; preds = %59, %51
  %63 = load i8**, i8*** %12, align 8
  %64 = load i32*, i32** %13, align 8
  %65 = load i32, i32* %64, align 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8*, i8** %63, i64 %66
  %68 = load i8*, i8** %67, align 8
  %69 = getelementptr inbounds [2 x i8*], [2 x i8*]* %16, i64 0, i64 0
  store i8* %68, i8** %69, align 16
  %70 = load i32, i32* %17, align 4
  %71 = icmp ugt i32 %70, 1
  br i1 %71, label %72, label %82

; <label>:72:                                     ; preds = %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 4)
  %73 = add i64 %pgocount3, 1
  store i64 %73, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 4)
  %74 = load i8**, i8*** %12, align 8
  %75 = load i32*, i32** %13, align 8
  %76 = load i32, i32* %75, align 4
  %77 = add i32 %76, 1
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8*, i8** %74, i64 %78
  %80 = load i8*, i8** %79, align 8
  %81 = getelementptr inbounds [2 x i8*], [2 x i8*]* %16, i64 0, i64 1
  store i8* %80, i8** %81, align 8
  br label %90

; <label>:82:                                     ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 5)
  %83 = add i64 %pgocount4, 1
  store i64 %83, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 5)
  %84 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %85 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %84, i32 0, i32 6
  %86 = load i8*, i8** %85, align 8
  %87 = getelementptr inbounds [2 x i8*], [2 x i8*]* %16, i64 0, i64 1
  store i8* %86, i8** %87, align 8
  %88 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %89 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %88, i32 0, i32 7
  store i32 1, i32* %89, align 8
  br label %90

; <label>:90:                                     ; preds = %82, %72
  %91 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %92 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %91, i32 0, i32 1
  %93 = load void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %92, align 8
  %94 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %95 = load i8***, i8**** %9, align 8
  %96 = load i32*, i32** %10, align 8
  %97 = load i32, i32* %96, align 4
  %98 = getelementptr inbounds [2 x i8*], [2 x i8*]* %16, i32 0, i32 0
  %99 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* %93 to i64
  call void @__llvm_profile_instrument_target(i64 %99, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_merged_2v_upsample to i8*), i32 0)
  call void %93(%struct.jpeg_decompress_struct* %94, i8*** %95, i32 %97, i8** %98)
  br label %100

; <label>:100:                                    ; preds = %90, %26
  %101 = load i32, i32* %17, align 4
  %102 = load i32*, i32** %13, align 8
  %103 = load i32, i32* %102, align 4
  %104 = add i32 %103, %101
  store i32 %104, i32* %102, align 4
  %105 = load i32, i32* %17, align 4
  %106 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %107 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %106, i32 0, i32 9
  %108 = load i32, i32* %107, align 8
  %109 = sub i32 %108, %105
  store i32 %109, i32* %107, align 8
  %110 = load %struct.my_upsampler*, %struct.my_upsampler** %15, align 8
  %111 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %110, i32 0, i32 7
  %112 = load i32, i32* %111, align 8
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %119, label %114

; <label>:114:                                    ; preds = %100
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 1)
  %115 = add i64 %pgocount5, 1
  store i64 %115, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_merged_2v_upsample, i64 0, i64 1)
  %116 = load i32*, i32** %10, align 8
  %117 = load i32, i32* %116, align 4
  %118 = add i32 %117, 1
  store i32 %118, i32* %116, align 4
  br label %119

; <label>:119:                                    ; preds = %114, %100
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @h2v2_merged_upsample(%struct.jpeg_decompress_struct*, i8***, i32, i8**) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8***, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8**, align 8
  %9 = alloca %struct.my_upsampler*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i32, align 4
  %23 = alloca i8*, align 8
  %24 = alloca i32*, align 8
  %25 = alloca i32*, align 8
  %26 = alloca i64*, align 8
  %27 = alloca i64*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8*** %1, i8**** %6, align 8
  store i32 %2, i32* %7, align 4
  store i8** %3, i8*** %8, align 8
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 81
  %30 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %29, align 8
  %31 = bitcast %struct.jpeg_upsampler* %30 to %struct.my_upsampler*
  store %struct.my_upsampler* %31, %struct.my_upsampler** %9, align 8
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 61
  %34 = load i8*, i8** %33, align 8
  store i8* %34, i8** %23, align 8
  %35 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %36 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %35, i32 0, i32 2
  %37 = load i32*, i32** %36, align 8
  store i32* %37, i32** %24, align 8
  %38 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %39 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %38, i32 0, i32 3
  %40 = load i32*, i32** %39, align 8
  store i32* %40, i32** %25, align 8
  %41 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %42 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %41, i32 0, i32 4
  %43 = load i64*, i64** %42, align 8
  store i64* %43, i64** %26, align 8
  %44 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %45 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %44, i32 0, i32 5
  %46 = load i64*, i64** %45, align 8
  store i64* %46, i64** %27, align 8
  %47 = load i8***, i8**** %6, align 8
  %48 = getelementptr inbounds i8**, i8*** %47, i64 0
  %49 = load i8**, i8*** %48, align 8
  %50 = load i32, i32* %7, align 4
  %51 = mul i32 %50, 2
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i8*, i8** %49, i64 %52
  %54 = load i8*, i8** %53, align 8
  store i8* %54, i8** %18, align 8
  %55 = load i8***, i8**** %6, align 8
  %56 = getelementptr inbounds i8**, i8*** %55, i64 0
  %57 = load i8**, i8*** %56, align 8
  %58 = load i32, i32* %7, align 4
  %59 = mul i32 %58, 2
  %60 = add i32 %59, 1
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i8*, i8** %57, i64 %61
  %63 = load i8*, i8** %62, align 8
  store i8* %63, i8** %19, align 8
  %64 = load i8***, i8**** %6, align 8
  %65 = getelementptr inbounds i8**, i8*** %64, i64 1
  %66 = load i8**, i8*** %65, align 8
  %67 = load i32, i32* %7, align 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i8*, i8** %66, i64 %68
  %70 = load i8*, i8** %69, align 8
  store i8* %70, i8** %20, align 8
  %71 = load i8***, i8**** %6, align 8
  %72 = getelementptr inbounds i8**, i8*** %71, i64 2
  %73 = load i8**, i8*** %72, align 8
  %74 = load i32, i32* %7, align 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8*, i8** %73, i64 %75
  %77 = load i8*, i8** %76, align 8
  store i8* %77, i8** %21, align 8
  %78 = load i8**, i8*** %8, align 8
  %79 = getelementptr inbounds i8*, i8** %78, i64 0
  %80 = load i8*, i8** %79, align 8
  store i8* %80, i8** %16, align 8
  %81 = load i8**, i8*** %8, align 8
  %82 = getelementptr inbounds i8*, i8** %81, i64 1
  %83 = load i8*, i8** %82, align 8
  store i8* %83, i8** %17, align 8
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 26
  %86 = load i32, i32* %85, align 8
  %87 = lshr i32 %86, 1
  store i32 %87, i32* %22, align 4
  br label %88

; <label>:88:                                     ; preds = %255, %4
  %89 = load i32, i32* %22, align 4
  %90 = icmp ugt i32 %89, 0
  br i1 %90, label %91, label %259

; <label>:91:                                     ; preds = %88
  %92 = load i8*, i8** %20, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %20, align 8
  %94 = load i8, i8* %92, align 1
  %95 = zext i8 %94 to i32
  store i32 %95, i32* %14, align 4
  %96 = load i8*, i8** %21, align 8
  %97 = getelementptr inbounds i8, i8* %96, i32 1
  store i8* %97, i8** %21, align 8
  %98 = load i8, i8* %96, align 1
  %99 = zext i8 %98 to i32
  store i32 %99, i32* %15, align 4
  %100 = load i32*, i32** %24, align 8
  %101 = load i32, i32* %15, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32* %100, i64 %102
  %104 = load i32, i32* %103, align 4
  store i32 %104, i32* %11, align 4
  %105 = load i64*, i64** %27, align 8
  %106 = load i32, i32* %14, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i64, i64* %105, i64 %107
  %109 = load i64, i64* %108, align 8
  %110 = load i64*, i64** %26, align 8
  %111 = load i32, i32* %15, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i64, i64* %110, i64 %112
  %114 = load i64, i64* %113, align 8
  %115 = add nsw i64 %109, %114
  %116 = ashr i64 %115, 16
  %117 = trunc i64 %116 to i32
  store i32 %117, i32* %12, align 4
  %118 = load i32*, i32** %25, align 8
  %119 = load i32, i32* %14, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32* %118, i64 %120
  %122 = load i32, i32* %121, align 4
  store i32 %122, i32* %13, align 4
  %123 = load i8*, i8** %18, align 8
  %124 = getelementptr inbounds i8, i8* %123, i32 1
  store i8* %124, i8** %18, align 8
  %125 = load i8, i8* %123, align 1
  %126 = zext i8 %125 to i32
  store i32 %126, i32* %10, align 4
  %127 = load i8*, i8** %23, align 8
  %128 = load i32, i32* %10, align 4
  %129 = load i32, i32* %11, align 4
  %130 = add nsw i32 %128, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8, i8* %127, i64 %131
  %133 = load i8, i8* %132, align 1
  %134 = load i8*, i8** %16, align 8
  %135 = getelementptr inbounds i8, i8* %134, i64 0
  store i8 %133, i8* %135, align 1
  %136 = load i8*, i8** %23, align 8
  %137 = load i32, i32* %10, align 4
  %138 = load i32, i32* %12, align 4
  %139 = add nsw i32 %137, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, i8* %136, i64 %140
  %142 = load i8, i8* %141, align 1
  %143 = load i8*, i8** %16, align 8
  %144 = getelementptr inbounds i8, i8* %143, i64 1
  store i8 %142, i8* %144, align 1
  %145 = load i8*, i8** %23, align 8
  %146 = load i32, i32* %10, align 4
  %147 = load i32, i32* %13, align 4
  %148 = add nsw i32 %146, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i8, i8* %145, i64 %149
  %151 = load i8, i8* %150, align 1
  %152 = load i8*, i8** %16, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 2
  store i8 %151, i8* %153, align 1
  %154 = load i8*, i8** %16, align 8
  %155 = getelementptr inbounds i8, i8* %154, i64 3
  store i8* %155, i8** %16, align 8
  %156 = load i8*, i8** %18, align 8
  %157 = getelementptr inbounds i8, i8* %156, i32 1
  store i8* %157, i8** %18, align 8
  %158 = load i8, i8* %156, align 1
  %159 = zext i8 %158 to i32
  store i32 %159, i32* %10, align 4
  %160 = load i8*, i8** %23, align 8
  %161 = load i32, i32* %10, align 4
  %162 = load i32, i32* %11, align 4
  %163 = add nsw i32 %161, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i8, i8* %160, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = load i8*, i8** %16, align 8
  %168 = getelementptr inbounds i8, i8* %167, i64 0
  store i8 %166, i8* %168, align 1
  %169 = load i8*, i8** %23, align 8
  %170 = load i32, i32* %10, align 4
  %171 = load i32, i32* %12, align 4
  %172 = add nsw i32 %170, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i8, i8* %169, i64 %173
  %175 = load i8, i8* %174, align 1
  %176 = load i8*, i8** %16, align 8
  %177 = getelementptr inbounds i8, i8* %176, i64 1
  store i8 %175, i8* %177, align 1
  %178 = load i8*, i8** %23, align 8
  %179 = load i32, i32* %10, align 4
  %180 = load i32, i32* %13, align 4
  %181 = add nsw i32 %179, %180
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8, i8* %178, i64 %182
  %184 = load i8, i8* %183, align 1
  %185 = load i8*, i8** %16, align 8
  %186 = getelementptr inbounds i8, i8* %185, i64 2
  store i8 %184, i8* %186, align 1
  %187 = load i8*, i8** %16, align 8
  %188 = getelementptr inbounds i8, i8* %187, i64 3
  store i8* %188, i8** %16, align 8
  %189 = load i8*, i8** %19, align 8
  %190 = getelementptr inbounds i8, i8* %189, i32 1
  store i8* %190, i8** %19, align 8
  %191 = load i8, i8* %189, align 1
  %192 = zext i8 %191 to i32
  store i32 %192, i32* %10, align 4
  %193 = load i8*, i8** %23, align 8
  %194 = load i32, i32* %10, align 4
  %195 = load i32, i32* %11, align 4
  %196 = add nsw i32 %194, %195
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds i8, i8* %193, i64 %197
  %199 = load i8, i8* %198, align 1
  %200 = load i8*, i8** %17, align 8
  %201 = getelementptr inbounds i8, i8* %200, i64 0
  store i8 %199, i8* %201, align 1
  %202 = load i8*, i8** %23, align 8
  %203 = load i32, i32* %10, align 4
  %204 = load i32, i32* %12, align 4
  %205 = add nsw i32 %203, %204
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i8, i8* %202, i64 %206
  %208 = load i8, i8* %207, align 1
  %209 = load i8*, i8** %17, align 8
  %210 = getelementptr inbounds i8, i8* %209, i64 1
  store i8 %208, i8* %210, align 1
  %211 = load i8*, i8** %23, align 8
  %212 = load i32, i32* %10, align 4
  %213 = load i32, i32* %13, align 4
  %214 = add nsw i32 %212, %213
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i8, i8* %211, i64 %215
  %217 = load i8, i8* %216, align 1
  %218 = load i8*, i8** %17, align 8
  %219 = getelementptr inbounds i8, i8* %218, i64 2
  store i8 %217, i8* %219, align 1
  %220 = load i8*, i8** %17, align 8
  %221 = getelementptr inbounds i8, i8* %220, i64 3
  store i8* %221, i8** %17, align 8
  %222 = load i8*, i8** %19, align 8
  %223 = getelementptr inbounds i8, i8* %222, i32 1
  store i8* %223, i8** %19, align 8
  %224 = load i8, i8* %222, align 1
  %225 = zext i8 %224 to i32
  store i32 %225, i32* %10, align 4
  %226 = load i8*, i8** %23, align 8
  %227 = load i32, i32* %10, align 4
  %228 = load i32, i32* %11, align 4
  %229 = add nsw i32 %227, %228
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds i8, i8* %226, i64 %230
  %232 = load i8, i8* %231, align 1
  %233 = load i8*, i8** %17, align 8
  %234 = getelementptr inbounds i8, i8* %233, i64 0
  store i8 %232, i8* %234, align 1
  %235 = load i8*, i8** %23, align 8
  %236 = load i32, i32* %10, align 4
  %237 = load i32, i32* %12, align 4
  %238 = add nsw i32 %236, %237
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds i8, i8* %235, i64 %239
  %241 = load i8, i8* %240, align 1
  %242 = load i8*, i8** %17, align 8
  %243 = getelementptr inbounds i8, i8* %242, i64 1
  store i8 %241, i8* %243, align 1
  %244 = load i8*, i8** %23, align 8
  %245 = load i32, i32* %10, align 4
  %246 = load i32, i32* %13, align 4
  %247 = add nsw i32 %245, %246
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i8, i8* %244, i64 %248
  %250 = load i8, i8* %249, align 1
  %251 = load i8*, i8** %17, align 8
  %252 = getelementptr inbounds i8, i8* %251, i64 2
  store i8 %250, i8* %252, align 1
  %253 = load i8*, i8** %17, align 8
  %254 = getelementptr inbounds i8, i8* %253, i64 3
  store i8* %254, i8** %17, align 8
  br label %255

; <label>:255:                                    ; preds = %91
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_merged_upsample, i64 0, i64 0)
  %256 = add i64 %pgocount, 1
  store i64 %256, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_merged_upsample, i64 0, i64 0)
  %257 = load i32, i32* %22, align 4
  %258 = add i32 %257, -1
  store i32 %258, i32* %22, align 4
  br label %88

; <label>:259:                                    ; preds = %88
  %260 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %261 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %260, i32 0, i32 26
  %262 = load i32, i32* %261, align 8
  %263 = and i32 %262, 1
  %264 = icmp ne i32 %263, 0
  br i1 %264, label %265, label %356

; <label>:265:                                    ; preds = %259
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_merged_upsample, i64 0, i64 2)
  %266 = add i64 %pgocount1, 1
  store i64 %266, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_merged_upsample, i64 0, i64 2)
  %267 = load i8*, i8** %20, align 8
  %268 = load i8, i8* %267, align 1
  %269 = zext i8 %268 to i32
  store i32 %269, i32* %14, align 4
  %270 = load i8*, i8** %21, align 8
  %271 = load i8, i8* %270, align 1
  %272 = zext i8 %271 to i32
  store i32 %272, i32* %15, align 4
  %273 = load i32*, i32** %24, align 8
  %274 = load i32, i32* %15, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i32, i32* %273, i64 %275
  %277 = load i32, i32* %276, align 4
  store i32 %277, i32* %11, align 4
  %278 = load i64*, i64** %27, align 8
  %279 = load i32, i32* %14, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i64, i64* %278, i64 %280
  %282 = load i64, i64* %281, align 8
  %283 = load i64*, i64** %26, align 8
  %284 = load i32, i32* %15, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i64, i64* %283, i64 %285
  %287 = load i64, i64* %286, align 8
  %288 = add nsw i64 %282, %287
  %289 = ashr i64 %288, 16
  %290 = trunc i64 %289 to i32
  store i32 %290, i32* %12, align 4
  %291 = load i32*, i32** %25, align 8
  %292 = load i32, i32* %14, align 4
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i32, i32* %291, i64 %293
  %295 = load i32, i32* %294, align 4
  store i32 %295, i32* %13, align 4
  %296 = load i8*, i8** %18, align 8
  %297 = load i8, i8* %296, align 1
  %298 = zext i8 %297 to i32
  store i32 %298, i32* %10, align 4
  %299 = load i8*, i8** %23, align 8
  %300 = load i32, i32* %10, align 4
  %301 = load i32, i32* %11, align 4
  %302 = add nsw i32 %300, %301
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i8, i8* %299, i64 %303
  %305 = load i8, i8* %304, align 1
  %306 = load i8*, i8** %16, align 8
  %307 = getelementptr inbounds i8, i8* %306, i64 0
  store i8 %305, i8* %307, align 1
  %308 = load i8*, i8** %23, align 8
  %309 = load i32, i32* %10, align 4
  %310 = load i32, i32* %12, align 4
  %311 = add nsw i32 %309, %310
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds i8, i8* %308, i64 %312
  %314 = load i8, i8* %313, align 1
  %315 = load i8*, i8** %16, align 8
  %316 = getelementptr inbounds i8, i8* %315, i64 1
  store i8 %314, i8* %316, align 1
  %317 = load i8*, i8** %23, align 8
  %318 = load i32, i32* %10, align 4
  %319 = load i32, i32* %13, align 4
  %320 = add nsw i32 %318, %319
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds i8, i8* %317, i64 %321
  %323 = load i8, i8* %322, align 1
  %324 = load i8*, i8** %16, align 8
  %325 = getelementptr inbounds i8, i8* %324, i64 2
  store i8 %323, i8* %325, align 1
  %326 = load i8*, i8** %19, align 8
  %327 = load i8, i8* %326, align 1
  %328 = zext i8 %327 to i32
  store i32 %328, i32* %10, align 4
  %329 = load i8*, i8** %23, align 8
  %330 = load i32, i32* %10, align 4
  %331 = load i32, i32* %11, align 4
  %332 = add nsw i32 %330, %331
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds i8, i8* %329, i64 %333
  %335 = load i8, i8* %334, align 1
  %336 = load i8*, i8** %17, align 8
  %337 = getelementptr inbounds i8, i8* %336, i64 0
  store i8 %335, i8* %337, align 1
  %338 = load i8*, i8** %23, align 8
  %339 = load i32, i32* %10, align 4
  %340 = load i32, i32* %12, align 4
  %341 = add nsw i32 %339, %340
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds i8, i8* %338, i64 %342
  %344 = load i8, i8* %343, align 1
  %345 = load i8*, i8** %17, align 8
  %346 = getelementptr inbounds i8, i8* %345, i64 1
  store i8 %344, i8* %346, align 1
  %347 = load i8*, i8** %23, align 8
  %348 = load i32, i32* %10, align 4
  %349 = load i32, i32* %13, align 4
  %350 = add nsw i32 %348, %349
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds i8, i8* %347, i64 %351
  %353 = load i8, i8* %352, align 1
  %354 = load i8*, i8** %17, align 8
  %355 = getelementptr inbounds i8, i8* %354, i64 2
  store i8 %353, i8* %355, align 1
  br label %356

; <label>:356:                                    ; preds = %265, %259
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_merged_upsample, i64 0, i64 1)
  %357 = add i64 %pgocount2, 1
  store i64 %357, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v2_merged_upsample, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @merged_1v_upsample(%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_merged_1v_upsample, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_merged_1v_upsample, i64 0, i64 0)
  %9 = alloca %struct.jpeg_decompress_struct*, align 8
  %10 = alloca i8***, align 8
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i8**, align 8
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca %struct.my_upsampler*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %9, align 8
  store i8*** %1, i8**** %10, align 8
  store i32* %2, i32** %11, align 8
  store i32 %3, i32* %12, align 4
  store i8** %4, i8*** %13, align 8
  store i32* %5, i32** %14, align 8
  store i32 %6, i32* %15, align 4
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %9, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 81
  %19 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %18, align 8
  %20 = bitcast %struct.jpeg_upsampler* %19 to %struct.my_upsampler*
  store %struct.my_upsampler* %20, %struct.my_upsampler** %16, align 8
  %21 = load %struct.my_upsampler*, %struct.my_upsampler** %16, align 8
  %22 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %21, i32 0, i32 1
  %23 = load void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)** %22, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %9, align 8
  %25 = load i8***, i8**** %10, align 8
  %26 = load i32*, i32** %11, align 8
  %27 = load i32, i32* %26, align 4
  %28 = load i8**, i8*** %13, align 8
  %29 = load i32*, i32** %14, align 8
  %30 = load i32, i32* %29, align 4
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i8*, i8** %28, i64 %31
  %33 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32, i8**)* %23 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_merged_1v_upsample to i8*), i32 0)
  call void %23(%struct.jpeg_decompress_struct* %24, i8*** %25, i32 %27, i8** %32)
  %34 = load i32*, i32** %14, align 8
  %35 = load i32, i32* %34, align 4
  %36 = add i32 %35, 1
  store i32 %36, i32* %34, align 4
  %37 = load i32*, i32** %11, align 8
  %38 = load i32, i32* %37, align 4
  %39 = add i32 %38, 1
  store i32 %39, i32* %37, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @h2v1_merged_upsample(%struct.jpeg_decompress_struct*, i8***, i32, i8**) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8***, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8**, align 8
  %9 = alloca %struct.my_upsampler*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca i8*, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 8
  %22 = alloca i32*, align 8
  %23 = alloca i32*, align 8
  %24 = alloca i64*, align 8
  %25 = alloca i64*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8*** %1, i8**** %6, align 8
  store i32 %2, i32* %7, align 4
  store i8** %3, i8*** %8, align 8
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 81
  %28 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %27, align 8
  %29 = bitcast %struct.jpeg_upsampler* %28 to %struct.my_upsampler*
  store %struct.my_upsampler* %29, %struct.my_upsampler** %9, align 8
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 61
  %32 = load i8*, i8** %31, align 8
  store i8* %32, i8** %21, align 8
  %33 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %34 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %33, i32 0, i32 2
  %35 = load i32*, i32** %34, align 8
  store i32* %35, i32** %22, align 8
  %36 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %37 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %36, i32 0, i32 3
  %38 = load i32*, i32** %37, align 8
  store i32* %38, i32** %23, align 8
  %39 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %40 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %39, i32 0, i32 4
  %41 = load i64*, i64** %40, align 8
  store i64* %41, i64** %24, align 8
  %42 = load %struct.my_upsampler*, %struct.my_upsampler** %9, align 8
  %43 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %42, i32 0, i32 5
  %44 = load i64*, i64** %43, align 8
  store i64* %44, i64** %25, align 8
  %45 = load i8***, i8**** %6, align 8
  %46 = getelementptr inbounds i8**, i8*** %45, i64 0
  %47 = load i8**, i8*** %46, align 8
  %48 = load i32, i32* %7, align 4
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i8*, i8** %47, i64 %49
  %51 = load i8*, i8** %50, align 8
  store i8* %51, i8** %17, align 8
  %52 = load i8***, i8**** %6, align 8
  %53 = getelementptr inbounds i8**, i8*** %52, i64 1
  %54 = load i8**, i8*** %53, align 8
  %55 = load i32, i32* %7, align 4
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i8*, i8** %54, i64 %56
  %58 = load i8*, i8** %57, align 8
  store i8* %58, i8** %18, align 8
  %59 = load i8***, i8**** %6, align 8
  %60 = getelementptr inbounds i8**, i8*** %59, i64 2
  %61 = load i8**, i8*** %60, align 8
  %62 = load i32, i32* %7, align 4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i8*, i8** %61, i64 %63
  %65 = load i8*, i8** %64, align 8
  store i8* %65, i8** %19, align 8
  %66 = load i8**, i8*** %8, align 8
  %67 = getelementptr inbounds i8*, i8** %66, i64 0
  %68 = load i8*, i8** %67, align 8
  store i8* %68, i8** %16, align 8
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i32 0, i32 26
  %71 = load i32, i32* %70, align 8
  %72 = lshr i32 %71, 1
  store i32 %72, i32* %20, align 4
  br label %73

; <label>:73:                                     ; preds = %174, %4
  %74 = load i32, i32* %20, align 4
  %75 = icmp ugt i32 %74, 0
  br i1 %75, label %76, label %178

; <label>:76:                                     ; preds = %73
  %77 = load i8*, i8** %18, align 8
  %78 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %78, i8** %18, align 8
  %79 = load i8, i8* %77, align 1
  %80 = zext i8 %79 to i32
  store i32 %80, i32* %14, align 4
  %81 = load i8*, i8** %19, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %19, align 8
  %83 = load i8, i8* %81, align 1
  %84 = zext i8 %83 to i32
  store i32 %84, i32* %15, align 4
  %85 = load i32*, i32** %22, align 8
  %86 = load i32, i32* %15, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %85, i64 %87
  %89 = load i32, i32* %88, align 4
  store i32 %89, i32* %11, align 4
  %90 = load i64*, i64** %25, align 8
  %91 = load i32, i32* %14, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i64, i64* %90, i64 %92
  %94 = load i64, i64* %93, align 8
  %95 = load i64*, i64** %24, align 8
  %96 = load i32, i32* %15, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i64, i64* %95, i64 %97
  %99 = load i64, i64* %98, align 8
  %100 = add nsw i64 %94, %99
  %101 = ashr i64 %100, 16
  %102 = trunc i64 %101 to i32
  store i32 %102, i32* %12, align 4
  %103 = load i32*, i32** %23, align 8
  %104 = load i32, i32* %14, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32* %103, i64 %105
  %107 = load i32, i32* %106, align 4
  store i32 %107, i32* %13, align 4
  %108 = load i8*, i8** %17, align 8
  %109 = getelementptr inbounds i8, i8* %108, i32 1
  store i8* %109, i8** %17, align 8
  %110 = load i8, i8* %108, align 1
  %111 = zext i8 %110 to i32
  store i32 %111, i32* %10, align 4
  %112 = load i8*, i8** %21, align 8
  %113 = load i32, i32* %10, align 4
  %114 = load i32, i32* %11, align 4
  %115 = add nsw i32 %113, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8* %112, i64 %116
  %118 = load i8, i8* %117, align 1
  %119 = load i8*, i8** %16, align 8
  %120 = getelementptr inbounds i8, i8* %119, i64 0
  store i8 %118, i8* %120, align 1
  %121 = load i8*, i8** %21, align 8
  %122 = load i32, i32* %10, align 4
  %123 = load i32, i32* %12, align 4
  %124 = add nsw i32 %122, %123
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8* %121, i64 %125
  %127 = load i8, i8* %126, align 1
  %128 = load i8*, i8** %16, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 1
  store i8 %127, i8* %129, align 1
  %130 = load i8*, i8** %21, align 8
  %131 = load i32, i32* %10, align 4
  %132 = load i32, i32* %13, align 4
  %133 = add nsw i32 %131, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i8, i8* %130, i64 %134
  %136 = load i8, i8* %135, align 1
  %137 = load i8*, i8** %16, align 8
  %138 = getelementptr inbounds i8, i8* %137, i64 2
  store i8 %136, i8* %138, align 1
  %139 = load i8*, i8** %16, align 8
  %140 = getelementptr inbounds i8, i8* %139, i64 3
  store i8* %140, i8** %16, align 8
  %141 = load i8*, i8** %17, align 8
  %142 = getelementptr inbounds i8, i8* %141, i32 1
  store i8* %142, i8** %17, align 8
  %143 = load i8, i8* %141, align 1
  %144 = zext i8 %143 to i32
  store i32 %144, i32* %10, align 4
  %145 = load i8*, i8** %21, align 8
  %146 = load i32, i32* %10, align 4
  %147 = load i32, i32* %11, align 4
  %148 = add nsw i32 %146, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i8, i8* %145, i64 %149
  %151 = load i8, i8* %150, align 1
  %152 = load i8*, i8** %16, align 8
  %153 = getelementptr inbounds i8, i8* %152, i64 0
  store i8 %151, i8* %153, align 1
  %154 = load i8*, i8** %21, align 8
  %155 = load i32, i32* %10, align 4
  %156 = load i32, i32* %12, align 4
  %157 = add nsw i32 %155, %156
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8* %154, i64 %158
  %160 = load i8, i8* %159, align 1
  %161 = load i8*, i8** %16, align 8
  %162 = getelementptr inbounds i8, i8* %161, i64 1
  store i8 %160, i8* %162, align 1
  %163 = load i8*, i8** %21, align 8
  %164 = load i32, i32* %10, align 4
  %165 = load i32, i32* %13, align 4
  %166 = add nsw i32 %164, %165
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i8, i8* %163, i64 %167
  %169 = load i8, i8* %168, align 1
  %170 = load i8*, i8** %16, align 8
  %171 = getelementptr inbounds i8, i8* %170, i64 2
  store i8 %169, i8* %171, align 1
  %172 = load i8*, i8** %16, align 8
  %173 = getelementptr inbounds i8, i8* %172, i64 3
  store i8* %173, i8** %16, align 8
  br label %174

; <label>:174:                                    ; preds = %76
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_merged_upsample, i64 0, i64 0)
  %175 = add i64 %pgocount, 1
  store i64 %175, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_merged_upsample, i64 0, i64 0)
  %176 = load i32, i32* %20, align 4
  %177 = add i32 %176, -1
  store i32 %177, i32* %20, align 4
  br label %73

; <label>:178:                                    ; preds = %73
  %179 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %180 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %179, i32 0, i32 26
  %181 = load i32, i32* %180, align 8
  %182 = and i32 %181, 1
  %183 = icmp ne i32 %182, 0
  br i1 %183, label %184, label %245

; <label>:184:                                    ; preds = %178
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_merged_upsample, i64 0, i64 2)
  %185 = add i64 %pgocount1, 1
  store i64 %185, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_merged_upsample, i64 0, i64 2)
  %186 = load i8*, i8** %18, align 8
  %187 = load i8, i8* %186, align 1
  %188 = zext i8 %187 to i32
  store i32 %188, i32* %14, align 4
  %189 = load i8*, i8** %19, align 8
  %190 = load i8, i8* %189, align 1
  %191 = zext i8 %190 to i32
  store i32 %191, i32* %15, align 4
  %192 = load i32*, i32** %22, align 8
  %193 = load i32, i32* %15, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds i32, i32* %192, i64 %194
  %196 = load i32, i32* %195, align 4
  store i32 %196, i32* %11, align 4
  %197 = load i64*, i64** %25, align 8
  %198 = load i32, i32* %14, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds i64, i64* %197, i64 %199
  %201 = load i64, i64* %200, align 8
  %202 = load i64*, i64** %24, align 8
  %203 = load i32, i32* %15, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds i64, i64* %202, i64 %204
  %206 = load i64, i64* %205, align 8
  %207 = add nsw i64 %201, %206
  %208 = ashr i64 %207, 16
  %209 = trunc i64 %208 to i32
  store i32 %209, i32* %12, align 4
  %210 = load i32*, i32** %23, align 8
  %211 = load i32, i32* %14, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, i32* %210, i64 %212
  %214 = load i32, i32* %213, align 4
  store i32 %214, i32* %13, align 4
  %215 = load i8*, i8** %17, align 8
  %216 = load i8, i8* %215, align 1
  %217 = zext i8 %216 to i32
  store i32 %217, i32* %10, align 4
  %218 = load i8*, i8** %21, align 8
  %219 = load i32, i32* %10, align 4
  %220 = load i32, i32* %11, align 4
  %221 = add nsw i32 %219, %220
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds i8, i8* %218, i64 %222
  %224 = load i8, i8* %223, align 1
  %225 = load i8*, i8** %16, align 8
  %226 = getelementptr inbounds i8, i8* %225, i64 0
  store i8 %224, i8* %226, align 1
  %227 = load i8*, i8** %21, align 8
  %228 = load i32, i32* %10, align 4
  %229 = load i32, i32* %12, align 4
  %230 = add nsw i32 %228, %229
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i8, i8* %227, i64 %231
  %233 = load i8, i8* %232, align 1
  %234 = load i8*, i8** %16, align 8
  %235 = getelementptr inbounds i8, i8* %234, i64 1
  store i8 %233, i8* %235, align 1
  %236 = load i8*, i8** %21, align 8
  %237 = load i32, i32* %10, align 4
  %238 = load i32, i32* %13, align 4
  %239 = add nsw i32 %237, %238
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i8, i8* %236, i64 %240
  %242 = load i8, i8* %241, align 1
  %243 = load i8*, i8** %16, align 8
  %244 = getelementptr inbounds i8, i8* %243, i64 2
  store i8 %242, i8* %244, align 1
  br label %245

; <label>:245:                                    ; preds = %184, %178
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_merged_upsample, i64 0, i64 1)
  %246 = add i64 %pgocount2, 1
  store i64 %246, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_h2v1_merged_upsample, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @build_ycc_rgb_table(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_upsampler*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 81
  %8 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %7, align 8
  %9 = bitcast %struct.jpeg_upsampler* %8 to %struct.my_upsampler*
  store %struct.my_upsampler* %9, %struct.my_upsampler** %3, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 1
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i32 0, i32 0
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %16 = bitcast %struct.jpeg_decompress_struct* %15 to %struct.jpeg_common_struct*
  %17 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %17, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i32 0)
  %18 = call i8* %14(%struct.jpeg_common_struct* %16, i32 1, i64 1024)
  %19 = bitcast i8* %18 to i32*
  %20 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %21 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %20, i32 0, i32 2
  store i32* %19, i32** %21, align 8
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 1
  %24 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %24, i32 0, i32 0
  %26 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %25, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %28 = bitcast %struct.jpeg_decompress_struct* %27 to %struct.jpeg_common_struct*
  %29 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i32 1)
  %30 = call i8* %26(%struct.jpeg_common_struct* %28, i32 1, i64 1024)
  %31 = bitcast i8* %30 to i32*
  %32 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %33 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %32, i32 0, i32 3
  store i32* %31, i32** %33, align 8
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 1
  %36 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %36, i32 0, i32 0
  %38 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %37, align 8
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %40 = bitcast %struct.jpeg_decompress_struct* %39 to %struct.jpeg_common_struct*
  %41 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i32 2)
  %42 = call i8* %38(%struct.jpeg_common_struct* %40, i32 1, i64 2048)
  %43 = bitcast i8* %42 to i64*
  %44 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %45 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %44, i32 0, i32 4
  store i64* %43, i64** %45, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 1
  %48 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %48, i32 0, i32 0
  %50 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %49, align 8
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = bitcast %struct.jpeg_decompress_struct* %51 to %struct.jpeg_common_struct*
  %53 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %50 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_build_ycc_rgb_table to i8*), i32 3)
  %54 = call i8* %50(%struct.jpeg_common_struct* %52, i32 1, i64 2048)
  %55 = bitcast i8* %54 to i64*
  %56 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %57 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %56, i32 0, i32 5
  store i64* %55, i64** %57, align 8
  store i32 0, i32* %4, align 4
  store i64 -128, i64* %5, align 8
  br label %58

; <label>:58:                                     ; preds = %101, %1
  %59 = load i32, i32* %4, align 4
  %60 = icmp sle i32 %59, 255
  br i1 %60, label %61, label %107

; <label>:61:                                     ; preds = %58
  %62 = load i64, i64* %5, align 8
  %63 = mul nsw i64 91881, %62
  %64 = add nsw i64 %63, 32768
  %65 = ashr i64 %64, 16
  %66 = trunc i64 %65 to i32
  %67 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %68 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %67, i32 0, i32 2
  %69 = load i32*, i32** %68, align 8
  %70 = load i32, i32* %4, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32* %69, i64 %71
  store i32 %66, i32* %72, align 4
  %73 = load i64, i64* %5, align 8
  %74 = mul nsw i64 116130, %73
  %75 = add nsw i64 %74, 32768
  %76 = ashr i64 %75, 16
  %77 = trunc i64 %76 to i32
  %78 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %79 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %78, i32 0, i32 3
  %80 = load i32*, i32** %79, align 8
  %81 = load i32, i32* %4, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32* %80, i64 %82
  store i32 %77, i32* %83, align 4
  %84 = load i64, i64* %5, align 8
  %85 = mul nsw i64 -46802, %84
  %86 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %87 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %86, i32 0, i32 4
  %88 = load i64*, i64** %87, align 8
  %89 = load i32, i32* %4, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i64, i64* %88, i64 %90
  store i64 %85, i64* %91, align 8
  %92 = load i64, i64* %5, align 8
  %93 = mul nsw i64 -22554, %92
  %94 = add nsw i64 %93, 32768
  %95 = load %struct.my_upsampler*, %struct.my_upsampler** %3, align 8
  %96 = getelementptr inbounds %struct.my_upsampler, %struct.my_upsampler* %95, i32 0, i32 5
  %97 = load i64*, i64** %96, align 8
  %98 = load i32, i32* %4, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i64, i64* %97, i64 %99
  store i64 %94, i64* %100, align 8
  br label %101

; <label>:101:                                    ; preds = %61
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i64 0, i64 0)
  %102 = add i64 %pgocount, 1
  store i64 %102, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i64 0, i64 0)
  %103 = load i32, i32* %4, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %4, align 4
  %105 = load i64, i64* %5, align 8
  %106 = add nsw i64 %105, 1
  store i64 %106, i64* %5, align 8
  br label %58

; <label>:107:                                    ; preds = %58
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i64 0, i64 1)
  %108 = add i64 %pgocount1, 1
  store i64 %108, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_build_ycc_rgb_table, i64 0, i64 1)
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
