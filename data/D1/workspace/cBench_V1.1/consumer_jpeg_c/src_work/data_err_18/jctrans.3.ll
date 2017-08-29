; ModuleID = 'jctrans.2.ll'
source_filename = "jctrans.c"
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
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_color_converter = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }
%struct.my_coef_controller = type { %struct.jpeg_c_coef_controller, i32, i32, i32, i32, %struct.jvirt_barray_control**, [10 x [64 x i16]*] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_write_coefficients = private constant [23 x i8] c"jpeg_write_coefficients"
@__profn_tmp1.ll_transencode_master_selection = private constant [36 x i8] c"tmp1.ll:transencode_master_selection"
@__profn_jpeg_copy_critical_parameters = private constant [29 x i8] c"jpeg_copy_critical_parameters"
@__profn_tmp1.ll_transencode_coef_controller = private constant [35 x i8] c"tmp1.ll:transencode_coef_controller"
@__profn_tmp1.ll_start_pass_coef = private constant [23 x i8] c"tmp1.ll:start_pass_coef"
@__profn_tmp1.ll_compress_output = private constant [23 x i8] c"tmp1.ll:compress_output"
@__profn_tmp1.ll_start_iMCU_row = private constant [22 x i8] c"tmp1.ll:start_iMCU_row"
@__profc_jpeg_write_coefficients = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_write_coefficients = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_write_coefficients = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7359668566393405830, i64 844450501431042, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_coefficients, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**)* @jpeg_write_coefficients to i8*), i8* bitcast ([3 x i64]* @__profvp_jpeg_write_coefficients to i8*), i32 2, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_transencode_master_selection = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_transencode_master_selection = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_transencode_master_selection = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1546303974168843488, i64 844468899868677, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_transencode_master_selection, i32 0, i32 0), i8* null, i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_transencode_master_selection to i8*), i32 3, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_jpeg_copy_critical_parameters = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_copy_critical_parameters = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_copy_critical_parameters = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9181573792260303828, i64 1126092597255869, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.jpeg_compress_struct*)* @jpeg_copy_critical_parameters to i8*), i8* bitcast ([4 x i64]* @__profvp_jpeg_copy_critical_parameters to i8*), i32 14, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_transencode_coef_controller = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_transencode_coef_controller = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_transencode_coef_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 192071576084004662, i64 562984091081628, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_transencode_coef_controller, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_transencode_coef_controller to i8*), i32 2, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_coef = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_coef = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_coef = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1041693909404696680, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_coef, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_start_pass_coef to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compress_output = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_compress_output = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_compress_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6997231016594519111, i64 563172272203739, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8***)* @compress_output to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_compress_output to i8*), i32 12, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_iMCU_row = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_iMCU_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9129650727672949639, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [15 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [200 x i8] c"\C5\01\00jpeg_write_coefficients\01tmp1.ll:transencode_master_selection\01jpeg_copy_critical_parameters\01tmp1.ll:transencode_coef_controller\01tmp1.ll:start_pass_coef\01tmp1.ll:compress_output\01tmp1.ll:start_iMCU_row", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_coefficients to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transencode_master_selection to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_copy_critical_parameters to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transencode_coef_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_coef to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_output to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_iMCU_row to i8*), i8* bitcast ([15 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([200 x i8], [200 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jpeg_write_coefficients(%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.jvirt_barray_control**, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.jvirt_barray_control** %1, %struct.jvirt_barray_control*** %4, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 100
  br i1 %8, label %9, label %32

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_coefficients, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_coefficients, i64 0, i64 1)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %11, i32 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i32 0, i32 5
  store i32 18, i32* %14, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 4
  %17 = load i32, i32* %16, align 4
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 6
  %22 = bitcast %union.anon* %21 to [8 x i32]*
  %23 = getelementptr inbounds [8 x i32], [8 x i32]* %22, i64 0, i64 0
  store i32 %17, i32* %23, align 4
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 0
  %28 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %27, align 8
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %30 = bitcast %struct.jpeg_compress_struct* %29 to %struct.jpeg_common_struct*
  %31 = ptrtoint void (%struct.jpeg_common_struct*)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %31, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_coefficients to i8*), i32 0)
  call void %28(%struct.jpeg_common_struct* %30)
  br label %32

; <label>:32:                                     ; preds = %9, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_coefficients, i64 0, i64 0)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_coefficients, i64 0, i64 0)
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @jpeg_suppress_tables(%struct.jpeg_compress_struct* %34, i32 0)
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 4
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %41 = bitcast %struct.jpeg_compress_struct* %40 to %struct.jpeg_common_struct*
  %42 = ptrtoint void (%struct.jpeg_common_struct*)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %42, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_coefficients to i8*), i32 1)
  call void %39(%struct.jpeg_common_struct* %41)
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %43, i32 0, i32 5
  %45 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %45, i32 0, i32 2
  %47 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %46, align 8
  %48 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %49 = ptrtoint void (%struct.jpeg_compress_struct*)* %47 to i64
  call void @__llvm_profile_instrument_target(i64 %49, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_coefficients to i8*), i32 2)
  call void %47(%struct.jpeg_compress_struct* %48)
  %50 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %51 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %4, align 8
  call void @transencode_master_selection(%struct.jpeg_compress_struct* %50, %struct.jvirt_barray_control** %51)
  %52 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %52, i32 0, i32 36
  store i32 0, i32* %53, align 8
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %54, i32 0, i32 4
  store i32 103, i32* %55, align 4
  ret void
}

declare void @jpeg_suppress_tables(%struct.jpeg_compress_struct*, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @transencode_master_selection(%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.jvirt_barray_control**, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.jvirt_barray_control** %1, %struct.jvirt_barray_control*** %4, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 8
  store i32 1, i32* %6, align 8
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @jinit_c_master_control(%struct.jpeg_compress_struct* %7, i32 1)
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %8, i32 0, i32 24
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %26

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_transencode_master_selection, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_transencode_master_selection, i64 0, i64 0)
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i32 0, i32 5
  store i32 1, i32* %17, align 8
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 0
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %23 to %struct.jpeg_common_struct*
  %25 = ptrtoint void (%struct.jpeg_common_struct*)* %22 to i64
  call void @__llvm_profile_instrument_target(i64 %25, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transencode_master_selection to i8*), i32 0)
  call void %22(%struct.jpeg_common_struct* %24)
  br label %38

; <label>:26:                                     ; preds = %2
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 37
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_transencode_master_selection, i64 0, i64 1)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_transencode_master_selection, i64 0, i64 1)
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @jinit_phuff_encoder(%struct.jpeg_compress_struct* %33)
  br label %37

; <label>:34:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_transencode_master_selection, i64 0, i64 2)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_transencode_master_selection, i64 0, i64 2)
  %36 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @jinit_huff_encoder(%struct.jpeg_compress_struct* %36)
  br label %37

; <label>:37:                                     ; preds = %34, %31
  br label %38

; <label>:38:                                     ; preds = %37, %12
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %40 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %4, align 8
  call void @transencode_coef_controller(%struct.jpeg_compress_struct* %39, %struct.jvirt_barray_control** %40)
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @jinit_marker_writer(%struct.jpeg_compress_struct* %41)
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %42, i32 0, i32 1
  %44 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %44, i32 0, i32 6
  %46 = bitcast {}** %45 to void (%struct.jpeg_common_struct*)**
  %47 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %46, align 8
  %48 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %49 = bitcast %struct.jpeg_compress_struct* %48 to %struct.jpeg_common_struct*
  %50 = ptrtoint void (%struct.jpeg_common_struct*)* %47 to i64
  call void @__llvm_profile_instrument_target(i64 %50, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transencode_master_selection to i8*), i32 1)
  call void %47(%struct.jpeg_common_struct* %49)
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %51, i32 0, i32 55
  %53 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %53, i32 0, i32 1
  %55 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %54, align 8
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %57 = ptrtoint void (%struct.jpeg_compress_struct*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transencode_master_selection to i8*), i32 2)
  call void %55(%struct.jpeg_compress_struct* %56)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_copy_critical_parameters(%struct.jpeg_decompress_struct*, %struct.jpeg_compress_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct.JQUANT_TBL**, align 8
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca %struct.JQUANT_TBL*, align 8
  %9 = alloca %struct.JQUANT_TBL*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.jpeg_compress_struct* %1, %struct.jpeg_compress_struct** %4, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 4
  %15 = load i32, i32* %14, align 4
  %16 = icmp ne i32 %15, 100
  br i1 %16, label %17, label %40

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 13)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 13)
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 5
  store i32 18, i32* %22, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 4
  %25 = load i32, i32* %24, align 4
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 6
  %30 = bitcast %union.anon* %29 to [8 x i32]*
  %31 = getelementptr inbounds [8 x i32], [8 x i32]* %30, i64 0, i64 0
  store i32 %25, i32* %31, align 4
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 0
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %38 = bitcast %struct.jpeg_compress_struct* %37 to %struct.jpeg_common_struct*
  %39 = ptrtoint void (%struct.jpeg_common_struct*)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_copy_critical_parameters to i8*), i32 0)
  call void %36(%struct.jpeg_common_struct* %38)
  br label %40

; <label>:40:                                     ; preds = %17, %2
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 6
  %43 = load i32, i32* %42, align 8
  %44 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %45 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %44, i32 0, i32 6
  store i32 %43, i32* %45, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 7
  %48 = load i32, i32* %47, align 4
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 7
  store i32 %48, i32* %50, align 4
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 8
  %53 = load i32, i32* %52, align 8
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %54, i32 0, i32 8
  store i32 %53, i32* %55, align 8
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 9
  %58 = load i32, i32* %57, align 4
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 9
  store i32 %58, i32* %60, align 4
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  call void @jpeg_set_defaults(%struct.jpeg_compress_struct* %61)
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 9
  %65 = load i32, i32* %64, align 4
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %62, i32 %65)
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 42
  %68 = load i32, i32* %67, align 8
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 11
  store i32 %68, i32* %70, align 8
  %71 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %71, i32 0, i32 56
  %73 = load i32, i32* %72, align 8
  %74 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %75 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %74, i32 0, i32 26
  store i32 %73, i32* %75, align 4
  store i32 0, i32* %10, align 4
  br label %76

; <label>:76:                                     ; preds = %122, %40
  %77 = load i32, i32* %10, align 4
  %78 = icmp slt i32 %77, 4
  br i1 %78, label %79, label %126

; <label>:79:                                     ; preds = %76
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %81 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %80, i32 0, i32 39
  %82 = load i32, i32* %10, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %81, i64 0, i64 %83
  %85 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %84, align 8
  %86 = icmp ne %struct.JQUANT_TBL* %85, null
  br i1 %86, label %87, label %121

; <label>:87:                                     ; preds = %79
  %88 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %89 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %88, i32 0, i32 15
  %90 = load i32, i32* %10, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %89, i64 0, i64 %91
  store %struct.JQUANT_TBL** %92, %struct.JQUANT_TBL*** %5, align 8
  %93 = load %struct.JQUANT_TBL**, %struct.JQUANT_TBL*** %5, align 8
  %94 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %93, align 8
  %95 = icmp eq %struct.JQUANT_TBL* %94, null
  br i1 %95, label %96, label %102

; <label>:96:                                     ; preds = %87
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 9)
  %97 = add i64 %pgocount1, 1
  store i64 %97, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 9)
  %98 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %99 = bitcast %struct.jpeg_compress_struct* %98 to %struct.jpeg_common_struct*
  %100 = call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* %99)
  %101 = load %struct.JQUANT_TBL**, %struct.JQUANT_TBL*** %5, align 8
  store %struct.JQUANT_TBL* %100, %struct.JQUANT_TBL** %101, align 8
  br label %102

; <label>:102:                                    ; preds = %96, %87
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 5)
  %103 = add i64 %pgocount2, 1
  store i64 %103, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 5)
  %104 = load %struct.JQUANT_TBL**, %struct.JQUANT_TBL*** %5, align 8
  %105 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %104, align 8
  %106 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %105, i32 0, i32 0
  %107 = getelementptr inbounds [64 x i16], [64 x i16]* %106, i32 0, i32 0
  %108 = bitcast i16* %107 to i8*
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 39
  %111 = load i32, i32* %10, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %110, i64 0, i64 %112
  %114 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %113, align 8
  %115 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %114, i32 0, i32 0
  %116 = getelementptr inbounds [64 x i16], [64 x i16]* %115, i32 0, i32 0
  %117 = bitcast i16* %116 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %108, i8* %117, i64 128, i32 4, i1 false)
  %118 = load %struct.JQUANT_TBL**, %struct.JQUANT_TBL*** %5, align 8
  %119 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %118, align 8
  %120 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %119, i32 0, i32 1
  store i32 0, i32* %120, align 4
  br label %121

; <label>:121:                                    ; preds = %102, %79
  br label %122

; <label>:122:                                    ; preds = %121
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 2)
  %123 = add i64 %pgocount3, 1
  store i64 %123, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 2)
  %124 = load i32, i32* %10, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %10, align 4
  br label %76

; <label>:126:                                    ; preds = %76
  %127 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %127, i32 0, i32 8
  %129 = load i32, i32* %128, align 8
  %130 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %131 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %130, i32 0, i32 12
  store i32 %129, i32* %131, align 4
  %132 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %133 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %132, i32 0, i32 12
  %134 = load i32, i32* %133, align 4
  %135 = icmp slt i32 %134, 1
  br i1 %135, label %142, label %136

; <label>:136:                                    ; preds = %126
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 12)
  %137 = add i64 %pgocount4, 1
  store i64 %137, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 12)
  %138 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %139 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %138, i32 0, i32 12
  %140 = load i32, i32* %139, align 4
  %141 = icmp sgt i32 %140, 10
  br i1 %141, label %142, label %171

; <label>:142:                                    ; preds = %136, %126
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 11)
  %143 = add i64 %pgocount5, 1
  store i64 %143, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 11)
  %144 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %145 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %144, i32 0, i32 0
  %146 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %145, align 8
  %147 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %146, i32 0, i32 5
  store i32 24, i32* %147, align 8
  %148 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %149 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %148, i32 0, i32 12
  %150 = load i32, i32* %149, align 4
  %151 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %152 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %151, i32 0, i32 0
  %153 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %152, align 8
  %154 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i32 0, i32 6
  %155 = bitcast %union.anon* %154 to [8 x i32]*
  %156 = getelementptr inbounds [8 x i32], [8 x i32]* %155, i64 0, i64 0
  store i32 %150, i32* %156, align 4
  %157 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %158 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %157, i32 0, i32 0
  %159 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %158, align 8
  %160 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %159, i32 0, i32 6
  %161 = bitcast %union.anon* %160 to [8 x i32]*
  %162 = getelementptr inbounds [8 x i32], [8 x i32]* %161, i64 0, i64 1
  store i32 10, i32* %162, align 4
  %163 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %164 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %163, i32 0, i32 0
  %165 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %164, align 8
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %165, i32 0, i32 0
  %167 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %166, align 8
  %168 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %169 = bitcast %struct.jpeg_compress_struct* %168 to %struct.jpeg_common_struct*
  %170 = ptrtoint void (%struct.jpeg_common_struct*)* %167 to i64
  call void @__llvm_profile_instrument_target(i64 %170, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_copy_critical_parameters to i8*), i32 1)
  call void %167(%struct.jpeg_common_struct* %169)
  br label %171

; <label>:171:                                    ; preds = %142, %136
  store i32 0, i32* %11, align 4
  %172 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %173 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %172, i32 0, i32 43
  %174 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %173, align 8
  store %struct.jpeg_component_info* %174, %struct.jpeg_component_info** %6, align 8
  %175 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %176 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %175, i32 0, i32 14
  %177 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %176, align 8
  store %struct.jpeg_component_info* %177, %struct.jpeg_component_info** %7, align 8
  br label %178

; <label>:178:                                    ; preds = %305, %171
  %179 = load i32, i32* %11, align 4
  %180 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %181 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %180, i32 0, i32 12
  %182 = load i32, i32* %181, align 4
  %183 = icmp slt i32 %179, %182
  br i1 %183, label %184, label %313

; <label>:184:                                    ; preds = %178
  %185 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %186 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %185, i32 0, i32 0
  %187 = load i32, i32* %186, align 8
  %188 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %189 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %188, i32 0, i32 0
  store i32 %187, i32* %189, align 8
  %190 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %191 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %190, i32 0, i32 2
  %192 = load i32, i32* %191, align 8
  %193 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %194 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %193, i32 0, i32 2
  store i32 %192, i32* %194, align 8
  %195 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %196 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %195, i32 0, i32 3
  %197 = load i32, i32* %196, align 4
  %198 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %199 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %198, i32 0, i32 3
  store i32 %197, i32* %199, align 4
  %200 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %201 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %200, i32 0, i32 4
  %202 = load i32, i32* %201, align 8
  %203 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %204 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %203, i32 0, i32 4
  store i32 %202, i32* %204, align 8
  %205 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %206 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %205, i32 0, i32 4
  %207 = load i32, i32* %206, align 8
  store i32 %207, i32* %10, align 4
  %208 = load i32, i32* %10, align 4
  %209 = icmp slt i32 %208, 0
  br i1 %209, label %223, label %210

; <label>:210:                                    ; preds = %184
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 6)
  %211 = add i64 %pgocount6, 1
  store i64 %211, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 6)
  %212 = load i32, i32* %10, align 4
  %213 = icmp sge i32 %212, 4
  br i1 %213, label %223, label %214

; <label>:214:                                    ; preds = %210
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 8)
  %215 = add i64 %pgocount7, 1
  store i64 %215, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 8)
  %216 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %217 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %216, i32 0, i32 39
  %218 = load i32, i32* %10, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %217, i64 0, i64 %219
  %221 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %220, align 8
  %222 = icmp eq %struct.JQUANT_TBL* %221, null
  br i1 %222, label %223, label %244

; <label>:223:                                    ; preds = %214, %210, %184
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 4)
  %224 = add i64 %pgocount8, 1
  store i64 %224, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 4)
  %225 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %226 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %225, i32 0, i32 0
  %227 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %226, align 8
  %228 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %227, i32 0, i32 5
  store i32 51, i32* %228, align 8
  %229 = load i32, i32* %10, align 4
  %230 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %231 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %230, i32 0, i32 0
  %232 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %231, align 8
  %233 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %232, i32 0, i32 6
  %234 = bitcast %union.anon* %233 to [8 x i32]*
  %235 = getelementptr inbounds [8 x i32], [8 x i32]* %234, i64 0, i64 0
  store i32 %229, i32* %235, align 4
  %236 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %237 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %236, i32 0, i32 0
  %238 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %237, align 8
  %239 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %238, i32 0, i32 0
  %240 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %239, align 8
  %241 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %242 = bitcast %struct.jpeg_compress_struct* %241 to %struct.jpeg_common_struct*
  %243 = ptrtoint void (%struct.jpeg_common_struct*)* %240 to i64
  call void @__llvm_profile_instrument_target(i64 %243, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_copy_critical_parameters to i8*), i32 2)
  call void %240(%struct.jpeg_common_struct* %242)
  br label %244

; <label>:244:                                    ; preds = %223, %214
  %245 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %246 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %245, i32 0, i32 39
  %247 = load i32, i32* %10, align 4
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %246, i64 0, i64 %248
  %250 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %249, align 8
  store %struct.JQUANT_TBL* %250, %struct.JQUANT_TBL** %9, align 8
  %251 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %252 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %251, i32 0, i32 19
  %253 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %252, align 8
  store %struct.JQUANT_TBL* %253, %struct.JQUANT_TBL** %8, align 8
  %254 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %8, align 8
  %255 = icmp ne %struct.JQUANT_TBL* %254, null
  br i1 %255, label %256, label %304

; <label>:256:                                    ; preds = %244
  store i32 0, i32* %12, align 4
  br label %257

; <label>:257:                                    ; preds = %298, %256
  %258 = load i32, i32* %12, align 4
  %259 = icmp slt i32 %258, 64
  br i1 %259, label %260, label %302

; <label>:260:                                    ; preds = %257
  %261 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %8, align 8
  %262 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %261, i32 0, i32 0
  %263 = load i32, i32* %12, align 4
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds [64 x i16], [64 x i16]* %262, i64 0, i64 %264
  %266 = load i16, i16* %265, align 2
  %267 = zext i16 %266 to i32
  %268 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %269 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %268, i32 0, i32 0
  %270 = load i32, i32* %12, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [64 x i16], [64 x i16]* %269, i64 0, i64 %271
  %273 = load i16, i16* %272, align 2
  %274 = zext i16 %273 to i32
  %275 = icmp ne i32 %267, %274
  br i1 %275, label %276, label %297

; <label>:276:                                    ; preds = %260
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 1)
  %277 = add i64 %pgocount9, 1
  store i64 %277, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 1)
  %278 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %279 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %278, i32 0, i32 0
  %280 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %279, align 8
  %281 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %280, i32 0, i32 5
  store i32 43, i32* %281, align 8
  %282 = load i32, i32* %10, align 4
  %283 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %284 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %283, i32 0, i32 0
  %285 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %284, align 8
  %286 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %285, i32 0, i32 6
  %287 = bitcast %union.anon* %286 to [8 x i32]*
  %288 = getelementptr inbounds [8 x i32], [8 x i32]* %287, i64 0, i64 0
  store i32 %282, i32* %288, align 4
  %289 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %290 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %289, i32 0, i32 0
  %291 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %290, align 8
  %292 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %291, i32 0, i32 0
  %293 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %292, align 8
  %294 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %295 = bitcast %struct.jpeg_compress_struct* %294 to %struct.jpeg_common_struct*
  %296 = ptrtoint void (%struct.jpeg_common_struct*)* %293 to i64
  call void @__llvm_profile_instrument_target(i64 %296, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_copy_critical_parameters to i8*), i32 3)
  call void %293(%struct.jpeg_common_struct* %295)
  br label %297

; <label>:297:                                    ; preds = %276, %260
  br label %298

; <label>:298:                                    ; preds = %297
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 0)
  %299 = add i64 %pgocount10, 1
  store i64 %299, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 0)
  %300 = load i32, i32* %12, align 4
  %301 = add nsw i32 %300, 1
  store i32 %301, i32* %12, align 4
  br label %257

; <label>:302:                                    ; preds = %257
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 7)
  %303 = add i64 %pgocount11, 1
  store i64 %303, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 7)
  br label %304

; <label>:304:                                    ; preds = %302, %244
  br label %305

; <label>:305:                                    ; preds = %304
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 3)
  %306 = add i64 %pgocount12, 1
  store i64 %306, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 3)
  %307 = load i32, i32* %11, align 4
  %308 = add nsw i32 %307, 1
  store i32 %308, i32* %11, align 4
  %309 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %310 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %309, i32 1
  store %struct.jpeg_component_info* %310, %struct.jpeg_component_info** %6, align 8
  %311 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %312 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %311, i32 1
  store %struct.jpeg_component_info* %312, %struct.jpeg_component_info** %7, align 8
  br label %178

; <label>:313:                                    ; preds = %178
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 10)
  %314 = add i64 %pgocount13, 1
  store i64 %314, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_jpeg_copy_critical_parameters, i64 0, i64 10)
  ret void
}

declare void @jpeg_set_defaults(%struct.jpeg_compress_struct*) #1

declare void @jpeg_set_colorspace(%struct.jpeg_compress_struct*, i32) #1

declare %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @jinit_c_master_control(%struct.jpeg_compress_struct*, i32) #1

declare void @jinit_phuff_encoder(%struct.jpeg_compress_struct*) #1

declare void @jinit_huff_encoder(%struct.jpeg_compress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @transencode_coef_controller(%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca %struct.jvirt_barray_control**, align 8
  %5 = alloca %struct.my_coef_controller*, align 8
  %6 = alloca [64 x i16]*, align 8
  %7 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store %struct.jvirt_barray_control** %1, %struct.jvirt_barray_control*** %4, align 8
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %8, i32 0, i32 1
  %10 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %10, i32 0, i32 0
  %12 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %11, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %13 to %struct.jpeg_common_struct*
  %15 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %15, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transencode_coef_controller to i8*), i32 0)
  %16 = call i8* %12(%struct.jpeg_common_struct* %14, i32 1, i64 120)
  %17 = bitcast i8* %16 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %17, %struct.my_coef_controller** %5, align 8
  %18 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %19 = bitcast %struct.my_coef_controller* %18 to %struct.jpeg_c_coef_controller*
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 54
  store %struct.jpeg_c_coef_controller* %19, %struct.jpeg_c_coef_controller** %21, align 8
  %22 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %23 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %23, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef, void (%struct.jpeg_compress_struct*, i32)** %24, align 8
  %25 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %26 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %26, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_output, i32 (%struct.jpeg_compress_struct*, i8***)** %27, align 8
  %28 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %4, align 8
  %29 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %30 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %29, i32 0, i32 5
  store %struct.jvirt_barray_control** %28, %struct.jvirt_barray_control*** %30, align 8
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %31, i32 0, i32 1
  %33 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %33, i32 0, i32 1
  %35 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %34, align 8
  %36 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %37 = bitcast %struct.jpeg_compress_struct* %36 to %struct.jpeg_common_struct*
  %38 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %35 to i64
  call void @__llvm_profile_instrument_target(i64 %38, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transencode_coef_controller to i8*), i32 1)
  %39 = call i8* %35(%struct.jpeg_common_struct* %37, i32 1, i64 1280)
  %40 = bitcast i8* %39 to [64 x i16]*
  store [64 x i16]* %40, [64 x i16]** %6, align 8
  %41 = load [64 x i16]*, [64 x i16]** %6, align 8
  %42 = bitcast [64 x i16]* %41 to i8*
  call void @jzero_far(i8* %42, i64 1280)
  store i32 0, i32* %7, align 4
  br label %43

; <label>:43:                                     ; preds = %56, %2
  %44 = load i32, i32* %7, align 4
  %45 = icmp slt i32 %44, 10
  br i1 %45, label %46, label %60

; <label>:46:                                     ; preds = %43
  %47 = load [64 x i16]*, [64 x i16]** %6, align 8
  %48 = load i32, i32* %7, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [64 x i16], [64 x i16]* %47, i64 %49
  %51 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %52 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %51, i32 0, i32 6
  %53 = load i32, i32* %7, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %52, i64 0, i64 %54
  store [64 x i16]* %50, [64 x i16]** %55, align 8
  br label %56

; <label>:56:                                     ; preds = %46
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_transencode_coef_controller, i64 0, i64 0)
  %57 = add i64 %pgocount, 1
  store i64 %57, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_transencode_coef_controller, i64 0, i64 0)
  %58 = load i32, i32* %7, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %7, align 4
  br label %43

; <label>:60:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_transencode_coef_controller, i64 0, i64 1)
  %61 = add i64 %pgocount1, 1
  store i64 %61, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_transencode_coef_controller, i64 0, i64 1)
  ret void
}

declare void @jinit_marker_writer(%struct.jpeg_compress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_coef(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_coef_controller*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 54
  %8 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %7, align 8
  %9 = bitcast %struct.jpeg_c_coef_controller* %8 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %9, %struct.my_coef_controller** %5, align 8
  %10 = load i32, i32* %4, align 4
  %11 = icmp ne i32 %10, 2
  br i1 %11, label %12, label %26

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 1)
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i32 0, i32 5
  store i32 4, i32* %17, align 8
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i32 0, i32 0
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %23 to %struct.jpeg_common_struct*
  %25 = ptrtoint void (%struct.jpeg_common_struct*)* %22 to i64
  call void @__llvm_profile_instrument_target(i64 %25, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_coef to i8*), i32 0)
  call void %22(%struct.jpeg_common_struct* %24)
  br label %26

; <label>:26:                                     ; preds = %12, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 0)
  %28 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %29 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %28, i32 0, i32 1
  store i32 0, i32* %29, align 8
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %30)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @compress_output(%struct.jpeg_compress_struct*, i8***) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i8***, align 8
  %6 = alloca %struct.my_coef_controller*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca [4 x [64 x i16]**], align 16
  %18 = alloca [10 x [64 x i16]*], align 16
  %19 = alloca [64 x i16]*, align 8
  %20 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8*** %1, i8**** %5, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 54
  %23 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %22, align 8
  %24 = bitcast %struct.jpeg_c_coef_controller* %23 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %24, %struct.my_coef_controller** %6, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 43
  %27 = load i32, i32* %26, align 8
  %28 = sub i32 %27, 1
  store i32 %28, i32* %8, align 4
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 40
  %31 = load i32, i32* %30, align 8
  %32 = sub i32 %31, 1
  store i32 %32, i32* %9, align 4
  store i32 0, i32* %11, align 4
  br label %33

; <label>:33:                                     ; preds = %77, %2
  %34 = load i32, i32* %11, align 4
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 41
  %37 = load i32, i32* %36, align 4
  %38 = icmp slt i32 %34, %37
  br i1 %38, label %39, label %81

; <label>:39:                                     ; preds = %33
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 42
  %42 = load i32, i32* %11, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %41, i64 0, i64 %43
  %45 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %44, align 8
  store %struct.jpeg_component_info* %45, %struct.jpeg_component_info** %20, align 8
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 1
  %48 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %48, i32 0, i32 8
  %50 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %49, align 8
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %52 = bitcast %struct.jpeg_compress_struct* %51 to %struct.jpeg_common_struct*
  %53 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %54 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %53, i32 0, i32 5
  %55 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %54, align 8
  %56 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %57 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %56, i32 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %55, i64 %59
  %61 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %60, align 8
  %62 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %63 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %62, i32 0, i32 1
  %64 = load i32, i32* %63, align 8
  %65 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %66 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i32 0, i32 3
  %67 = load i32, i32* %66, align 4
  %68 = mul i32 %64, %67
  %69 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %70 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %69, i32 0, i32 3
  %71 = load i32, i32* %70, align 4
  %72 = ptrtoint [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* %50 to i64
  call void @__llvm_profile_instrument_target(i64 %72, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_output to i8*), i32 0)
  %73 = call [64 x i16]** %50(%struct.jpeg_common_struct* %52, %struct.jvirt_barray_control* %61, i32 %68, i32 %71, i32 0)
  %74 = load i32, i32* %11, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %17, i64 0, i64 %75
  store [64 x i16]** %73, [64 x i16]*** %76, align 8
  br label %77

; <label>:77:                                     ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 7)
  %78 = add i64 %pgocount, 1
  store i64 %78, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 7)
  %79 = load i32, i32* %11, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %11, align 4
  br label %33

; <label>:81:                                     ; preds = %33
  %82 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %83 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %82, i32 0, i32 3
  %84 = load i32, i32* %83, align 8
  store i32 %84, i32* %14, align 4
  br label %85

; <label>:85:                                     ; preds = %261, %81
  %86 = load i32, i32* %14, align 4
  %87 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %88 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %87, i32 0, i32 4
  %89 = load i32, i32* %88, align 4
  %90 = icmp slt i32 %86, %89
  br i1 %90, label %91, label %265

; <label>:91:                                     ; preds = %85
  %92 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %93 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %92, i32 0, i32 2
  %94 = load i32, i32* %93, align 4
  store i32 %94, i32* %7, align 4
  br label %95

; <label>:95:                                     ; preds = %254, %91
  %96 = load i32, i32* %7, align 4
  %97 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %98 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %97, i32 0, i32 43
  %99 = load i32, i32* %98, align 8
  %100 = icmp ult i32 %96, %99
  br i1 %100, label %101, label %258

; <label>:101:                                    ; preds = %95
  store i32 0, i32* %10, align 4
  store i32 0, i32* %11, align 4
  br label %102

; <label>:102:                                    ; preds = %231, %101
  %103 = load i32, i32* %11, align 4
  %104 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %104, i32 0, i32 41
  %106 = load i32, i32* %105, align 4
  %107 = icmp slt i32 %103, %106
  br i1 %107, label %108, label %234

; <label>:108:                                    ; preds = %102
  %109 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %110 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %109, i32 0, i32 42
  %111 = load i32, i32* %11, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %110, i64 0, i64 %112
  %114 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %113, align 8
  store %struct.jpeg_component_info* %114, %struct.jpeg_component_info** %20, align 8
  %115 = load i32, i32* %7, align 4
  %116 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %117 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %116, i32 0, i32 13
  %118 = load i32, i32* %117, align 4
  %119 = mul i32 %115, %118
  store i32 %119, i32* %16, align 4
  %120 = load i32, i32* %7, align 4
  %121 = load i32, i32* %8, align 4
  %122 = icmp ult i32 %120, %121
  br i1 %122, label %123, label %128

; <label>:123:                                    ; preds = %108
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 5)
  %124 = add i64 %pgocount1, 1
  store i64 %124, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 5)
  %125 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %126 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %125, i32 0, i32 13
  %127 = load i32, i32* %126, align 4
  br label %133

; <label>:128:                                    ; preds = %108
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 6)
  %129 = add i64 %pgocount2, 1
  store i64 %129, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 6)
  %130 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %131 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %130, i32 0, i32 17
  %132 = load i32, i32* %131, align 4
  br label %133

; <label>:133:                                    ; preds = %128, %123
  %134 = phi i32 [ %127, %123 ], [ %132, %128 ]
  store i32 %134, i32* %15, align 4
  store i32 0, i32* %13, align 4
  br label %135

; <label>:135:                                    ; preds = %227, %133
  %136 = load i32, i32* %13, align 4
  %137 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %138 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %137, i32 0, i32 14
  %139 = load i32, i32* %138, align 8
  %140 = icmp slt i32 %136, %139
  br i1 %140, label %141, label %230

; <label>:141:                                    ; preds = %135
  %142 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %143 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %142, i32 0, i32 1
  %144 = load i32, i32* %143, align 8
  %145 = load i32, i32* %9, align 4
  %146 = icmp ult i32 %144, %145
  br i1 %146, label %156, label %147

; <label>:147:                                    ; preds = %141
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 3)
  %148 = add i64 %pgocount3, 1
  store i64 %148, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 3)
  %149 = load i32, i32* %13, align 4
  %150 = load i32, i32* %14, align 4
  %151 = add nsw i32 %149, %150
  %152 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %153 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %152, i32 0, i32 18
  %154 = load i32, i32* %153, align 8
  %155 = icmp slt i32 %151, %154
  br i1 %155, label %156, label %187

; <label>:156:                                    ; preds = %147, %141
  %157 = load i32, i32* %11, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %17, i64 0, i64 %158
  %160 = load [64 x i16]**, [64 x i16]*** %159, align 8
  %161 = load i32, i32* %13, align 4
  %162 = load i32, i32* %14, align 4
  %163 = add nsw i32 %161, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [64 x i16]*, [64 x i16]** %160, i64 %164
  %166 = load [64 x i16]*, [64 x i16]** %165, align 8
  %167 = load i32, i32* %16, align 4
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds [64 x i16], [64 x i16]* %166, i64 %168
  store [64 x i16]* %169, [64 x i16]** %19, align 8
  store i32 0, i32* %12, align 4
  br label %170

; <label>:170:                                    ; preds = %181, %156
  %171 = load i32, i32* %12, align 4
  %172 = load i32, i32* %15, align 4
  %173 = icmp slt i32 %171, %172
  br i1 %173, label %174, label %185

; <label>:174:                                    ; preds = %170
  %175 = load [64 x i16]*, [64 x i16]** %19, align 8
  %176 = getelementptr inbounds [64 x i16], [64 x i16]* %175, i32 1
  store [64 x i16]* %176, [64 x i16]** %19, align 8
  %177 = load i32, i32* %10, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %10, align 4
  %179 = sext i32 %177 to i64
  %180 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %18, i64 0, i64 %179
  store [64 x i16]* %175, [64 x i16]** %180, align 8
  br label %181

; <label>:181:                                    ; preds = %174
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 1)
  %182 = add i64 %pgocount4, 1
  store i64 %182, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 1)
  %183 = load i32, i32* %12, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, i32* %12, align 4
  br label %170

; <label>:185:                                    ; preds = %170
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 2)
  %186 = add i64 %pgocount5, 1
  store i64 %186, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 2)
  br label %189

; <label>:187:                                    ; preds = %147
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 4)
  %188 = add i64 %pgocount6, 1
  store i64 %188, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 4)
  store i32 0, i32* %12, align 4
  br label %189

; <label>:189:                                    ; preds = %187, %185
  br label %190

; <label>:190:                                    ; preds = %222, %189
  %191 = load i32, i32* %12, align 4
  %192 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %193 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %192, i32 0, i32 13
  %194 = load i32, i32* %193, align 4
  %195 = icmp slt i32 %191, %194
  br i1 %195, label %196, label %226

; <label>:196:                                    ; preds = %190
  %197 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %198 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %197, i32 0, i32 6
  %199 = load i32, i32* %10, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %198, i64 0, i64 %200
  %202 = load [64 x i16]*, [64 x i16]** %201, align 8
  %203 = load i32, i32* %10, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %18, i64 0, i64 %204
  store [64 x i16]* %202, [64 x i16]** %205, align 8
  %206 = load i32, i32* %10, align 4
  %207 = sub nsw i32 %206, 1
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %18, i64 0, i64 %208
  %210 = load [64 x i16]*, [64 x i16]** %209, align 8
  %211 = getelementptr inbounds [64 x i16], [64 x i16]* %210, i64 0
  %212 = getelementptr inbounds [64 x i16], [64 x i16]* %211, i64 0, i64 0
  %213 = load i16, i16* %212, align 2
  %214 = load i32, i32* %10, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %18, i64 0, i64 %215
  %217 = load [64 x i16]*, [64 x i16]** %216, align 8
  %218 = getelementptr inbounds [64 x i16], [64 x i16]* %217, i64 0
  %219 = getelementptr inbounds [64 x i16], [64 x i16]* %218, i64 0, i64 0
  store i16 %213, i16* %219, align 2
  %220 = load i32, i32* %10, align 4
  %221 = add nsw i32 %220, 1
  store i32 %221, i32* %10, align 4
  br label %222

; <label>:222:                                    ; preds = %196
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 0)
  %223 = add i64 %pgocount7, 1
  store i64 %223, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 0)
  %224 = load i32, i32* %12, align 4
  %225 = add nsw i32 %224, 1
  store i32 %225, i32* %12, align 4
  br label %190

; <label>:226:                                    ; preds = %190
  br label %227

; <label>:227:                                    ; preds = %226
  %228 = load i32, i32* %13, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, i32* %13, align 4
  br label %135

; <label>:230:                                    ; preds = %135
  br label %231

; <label>:231:                                    ; preds = %230
  %232 = load i32, i32* %11, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, i32* %11, align 4
  br label %102

; <label>:234:                                    ; preds = %102
  %235 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %236 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %235, i32 0, i32 59
  %237 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %236, align 8
  %238 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %237, i32 0, i32 1
  %239 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %238, align 8
  %240 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %241 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %18, i32 0, i32 0
  %242 = ptrtoint i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* %239 to i64
  call void @__llvm_profile_instrument_target(i64 %242, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_output to i8*), i32 1)
  %243 = call i32 %239(%struct.jpeg_compress_struct* %240, [64 x i16]** %241)
  %244 = icmp ne i32 %243, 0
  br i1 %244, label %253, label %245

; <label>:245:                                    ; preds = %234
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 10)
  %246 = add i64 %pgocount8, 1
  store i64 %246, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 10)
  %247 = load i32, i32* %14, align 4
  %248 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %249 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %248, i32 0, i32 3
  store i32 %247, i32* %249, align 8
  %250 = load i32, i32* %7, align 4
  %251 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %252 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %251, i32 0, i32 2
  store i32 %250, i32* %252, align 4
  store i32 0, i32* %3, align 4
  br label %272

; <label>:253:                                    ; preds = %234
  br label %254

; <label>:254:                                    ; preds = %253
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 8)
  %255 = add i64 %pgocount9, 1
  store i64 %255, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 8)
  %256 = load i32, i32* %7, align 4
  %257 = add i32 %256, 1
  store i32 %257, i32* %7, align 4
  br label %95

; <label>:258:                                    ; preds = %95
  %259 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %260 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %259, i32 0, i32 2
  store i32 0, i32* %260, align 4
  br label %261

; <label>:261:                                    ; preds = %258
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 9)
  %262 = add i64 %pgocount10, 1
  store i64 %262, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 9)
  %263 = load i32, i32* %14, align 4
  %264 = add nsw i32 %263, 1
  store i32 %264, i32* %14, align 4
  br label %85

; <label>:265:                                    ; preds = %85
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 11)
  %266 = add i64 %pgocount11, 1
  store i64 %266, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 11)
  %267 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %268 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %267, i32 0, i32 1
  %269 = load i32, i32* %268, align 8
  %270 = add i32 %269, 1
  store i32 %270, i32* %268, align 8
  %271 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %271)
  store i32 1, i32* %3, align 4
  br label %272

; <label>:272:                                    ; preds = %265, %245
  %273 = load i32, i32* %3, align 4
  ret i32 %273
}

declare void @jzero_far(i8*, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal void @start_iMCU_row(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_coef_controller*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 54
  %6 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %5, align 8
  %7 = bitcast %struct.jpeg_c_coef_controller* %6 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %7, %struct.my_coef_controller** %3, align 8
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %8, i32 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 0)
  %14 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %15 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %14, i32 0, i32 4
  store i32 1, i32* %15, align 4
  br label %46

; <label>:16:                                     ; preds = %1
  %17 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %18 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 8
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 40
  %22 = load i32, i32* %21, align 8
  %23 = sub i32 %22, 1
  %24 = icmp ult i32 %19, %23
  br i1 %24, label %25, label %35

; <label>:25:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 1)
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 42
  %29 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %28, i64 0, i64 0
  %30 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %30, i32 0, i32 3
  %32 = load i32, i32* %31, align 4
  %33 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %34 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %33, i32 0, i32 4
  store i32 %32, i32* %34, align 4
  br label %45

; <label>:35:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 2)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 2)
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 42
  %39 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %38, i64 0, i64 0
  %40 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %40, i32 0, i32 18
  %42 = load i32, i32* %41, align 8
  %43 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %44 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %43, i32 0, i32 4
  store i32 %42, i32* %44, align 4
  br label %45

; <label>:45:                                     ; preds = %35, %25
  br label %46

; <label>:46:                                     ; preds = %45, %12
  %47 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %48 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %47, i32 0, i32 2
  store i32 0, i32* %48, align 4
  %49 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %50 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %49, i32 0, i32 3
  store i32 0, i32* %50, align 8
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
