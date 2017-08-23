; ModuleID = 'jdcoefct.2.ll'
source_filename = "jdcoefct.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
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
%struct.jpeg_color_quantizer = type { {}*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }
%struct.my_coef_controller = type { %struct.jpeg_d_coef_controller, i32, i32, i32, [10 x [64 x i16]*], [10 x %struct.jvirt_barray_control*], i32* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_d_coef_controller = private constant [23 x i8] c"jinit_d_coef_controller"
@__profn_tmp1.ll_start_input_pass = private constant [24 x i8] c"tmp1.ll:start_input_pass"
@__profn_tmp1.ll_start_output_pass = private constant [25 x i8] c"tmp1.ll:start_output_pass"
@__profn_tmp1.ll_consume_data = private constant [20 x i8] c"tmp1.ll:consume_data"
@__profn_tmp1.ll_decompress_data = private constant [23 x i8] c"tmp1.ll:decompress_data"
@__profn_tmp1.ll_dummy_consume_data = private constant [26 x i8] c"tmp1.ll:dummy_consume_data"
@__profn_tmp1.ll_decompress_onepass = private constant [26 x i8] c"tmp1.ll:decompress_onepass"
@__profn_tmp1.ll_start_iMCU_row = private constant [22 x i8] c"tmp1.ll:start_iMCU_row"
@__profn_tmp1.ll_smoothing_ok = private constant [20 x i8] c"tmp1.ll:smoothing_ok"
@__profn_tmp1.ll_decompress_smooth_data = private constant [30 x i8] c"tmp1.ll:decompress_smooth_data"
@__profc_jinit_d_coef_controller = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_d_coef_controller = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_d_coef_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2798749000096746290, i64 844508271664963, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32)* @jinit_d_coef_controller to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_d_coef_controller to i8*), i32 5, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_input_pass = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_input_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8654036061110059940, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_input_pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_input_pass to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_output_pass = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_output_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5787042072528226424, i64 50761624137, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_output_pass to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_consume_data = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_consume_data = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_consume_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9002756027749051560, i64 844592455448928, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @consume_data to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_consume_data to i8*), i32 9, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decompress_data = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_decompress_data = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_decompress_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5949537919182155056, i64 844615438686967, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_data to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_decompress_data to i8*), i32 12, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_dummy_consume_data = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_dummy_consume_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4521879197034614682, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dummy_consume_data, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @dummy_consume_data to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decompress_onepass = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_decompress_onepass = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_decompress_onepass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8760280026225736789, i64 844625864177486, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_onepass to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_decompress_onepass to i8*), i32 12, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_iMCU_row = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_iMCU_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9129650727672949639, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_smoothing_ok = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_smoothing_ok = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_smoothing_ok = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3398188804670941462, i64 281659920146079, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_smoothing_ok to i8*), i32 15, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decompress_smooth_data = private global [55 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_decompress_smooth_data = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_decompress_smooth_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1945034409903002909, i64 73184189295337707, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_smooth_data to i8*), i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_decompress_smooth_data to i8*), i32 55, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [17 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [123 x i8] c"\F8\01xx\DA\85\8D\C1\0A\C2@\0CD\E9\0F\09\BDz\F5\EC\D1sX\BA\B1\A6n\92%\C9\22\FD{\8B\05\0B\B5\E0e\0E\EF13\13\09\05d\18\14\EFKH\98\96\82\D6\05\D7\FET\CA\D9#Y\00Im\015\B9\EF\84\B6\F81\CB\8A7F\C8)\D2\17f\1C\94\AB\A1\FB\8E7\E6\19\FEUT\F0\E0\9C\AE\97\1B\98\BE6\CC\AA\F1 \19A\9FG3\AB\FF\BC\BC\01\1B5^y", section "__llvm_prf_names"
@llvm.used = appending global [12 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_coef_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_input_pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_output_pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_consume_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dummy_consume_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_onepass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_iMCU_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_smoothing_ok to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_smooth_data to i8*), i8* bitcast ([17 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([123 x i8], [123 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_coef_controller*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.jpeg_component_info*, align 8
  %9 = alloca [64 x i16]*, align 8
  %10 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 1
  %13 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %13, i32 0, i32 0
  %15 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %14, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = bitcast %struct.jpeg_decompress_struct* %16 to %struct.jpeg_common_struct*
  %18 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %15 to i64
  call void @__llvm_profile_instrument_target(i64 %18, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_coef_controller to i8*), i32 0)
  %19 = call i8* %15(%struct.jpeg_common_struct* %17, i32 1, i64 224)
  %20 = bitcast i8* %19 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %20, %struct.my_coef_controller** %5, align 8
  %21 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %22 = bitcast %struct.my_coef_controller* %21 to %struct.jpeg_d_coef_controller*
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 75
  store %struct.jpeg_d_coef_controller* %22, %struct.jpeg_d_coef_controller** %24, align 8
  %25 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %26 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %26, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*)* @start_input_pass, void (%struct.jpeg_decompress_struct*)** %27, align 8
  %28 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %29 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %28, i32 0, i32 0
  %30 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %29, i32 0, i32 2
  store void (%struct.jpeg_decompress_struct*)* @start_output_pass, void (%struct.jpeg_decompress_struct*)** %30, align 8
  %31 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %32 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %31, i32 0, i32 6
  store i32* null, i32** %32, align 8
  %33 = load i32, i32* %4, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %113

; <label>:35:                                     ; preds = %2
  store i32 0, i32* %6, align 4
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 43
  %38 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %37, align 8
  store %struct.jpeg_component_info* %38, %struct.jpeg_component_info** %8, align 8
  br label %39

; <label>:39:                                     ; preds = %94, %35
  %40 = load i32, i32* %6, align 4
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 8
  %43 = load i32, i32* %42, align 8
  %44 = icmp slt i32 %40, %43
  br i1 %44, label %45, label %99

; <label>:45:                                     ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 0)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 0)
  %47 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %48 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %47, i32 0, i32 3
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %7, align 4
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 44
  %52 = load i32, i32* %51, align 8
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %58

; <label>:54:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 1)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 1)
  %56 = load i32, i32* %7, align 4
  %57 = mul nsw i32 %56, 3
  store i32 %57, i32* %7, align 4
  br label %58

; <label>:58:                                     ; preds = %54, %45
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 1
  %61 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %61, i32 0, i32 5
  %63 = load %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %62, align 8
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %65 = bitcast %struct.jpeg_decompress_struct* %64 to %struct.jpeg_common_struct*
  %66 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i32 0, i32 7
  %68 = load i32, i32* %67, align 4
  %69 = zext i32 %68 to i64
  %70 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %71 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i32 0, i32 2
  %72 = load i32, i32* %71, align 8
  %73 = sext i32 %72 to i64
  %74 = call i64 @jround_up(i64 %69, i64 %73)
  %75 = trunc i64 %74 to i32
  %76 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %76, i32 0, i32 8
  %78 = load i32, i32* %77, align 8
  %79 = zext i32 %78 to i64
  %80 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %81 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %80, i32 0, i32 3
  %82 = load i32, i32* %81, align 4
  %83 = sext i32 %82 to i64
  %84 = call i64 @jround_up(i64 %79, i64 %83)
  %85 = trunc i64 %84 to i32
  %86 = load i32, i32* %7, align 4
  %87 = ptrtoint %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* %63 to i64
  call void @__llvm_profile_instrument_target(i64 %87, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_coef_controller to i8*), i32 1)
  %88 = call %struct.jvirt_barray_control* %63(%struct.jpeg_common_struct* %65, i32 1, i32 1, i32 %75, i32 %85, i32 %86)
  %89 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %90 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %89, i32 0, i32 5
  %91 = load i32, i32* %6, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %90, i64 0, i64 %92
  store %struct.jvirt_barray_control* %88, %struct.jvirt_barray_control** %93, align 8
  br label %94

; <label>:94:                                     ; preds = %58
  %95 = load i32, i32* %6, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %6, align 4
  %97 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %98 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %97, i32 1
  store %struct.jpeg_component_info* %98, %struct.jpeg_component_info** %8, align 8
  br label %39

; <label>:99:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 3)
  %100 = add i64 %pgocount2, 1
  store i64 %100, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 3)
  %101 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %102 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %101, i32 0, i32 0
  %103 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %102, i32 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*)* @consume_data, i32 (%struct.jpeg_decompress_struct*)** %103, align 8
  %104 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %105 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %104, i32 0, i32 0
  %106 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %105, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_data, i32 (%struct.jpeg_decompress_struct*, i8***)** %106, align 8
  %107 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %108 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %107, i32 0, i32 5
  %109 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %108, i32 0, i32 0
  %110 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %111 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %110, i32 0, i32 0
  %112 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %111, i32 0, i32 4
  store %struct.jvirt_barray_control** %109, %struct.jvirt_barray_control*** %112, align 8
  br label %152

; <label>:113:                                    ; preds = %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 4)
  %114 = add i64 %pgocount3, 1
  store i64 %114, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 4)
  %115 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %116 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %115, i32 0, i32 1
  %117 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %116, align 8
  %118 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %117, i32 0, i32 1
  %119 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %118, align 8
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %121 = bitcast %struct.jpeg_decompress_struct* %120 to %struct.jpeg_common_struct*
  %122 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %119 to i64
  call void @__llvm_profile_instrument_target(i64 %122, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_coef_controller to i8*), i32 2)
  %123 = call i8* %119(%struct.jpeg_common_struct* %121, i32 1, i64 1280)
  %124 = bitcast i8* %123 to [64 x i16]*
  store [64 x i16]* %124, [64 x i16]** %9, align 8
  store i32 0, i32* %10, align 4
  br label %125

; <label>:125:                                    ; preds = %138, %113
  %126 = load i32, i32* %10, align 4
  %127 = icmp slt i32 %126, 10
  br i1 %127, label %128, label %142

; <label>:128:                                    ; preds = %125
  %129 = load [64 x i16]*, [64 x i16]** %9, align 8
  %130 = load i32, i32* %10, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [64 x i16], [64 x i16]* %129, i64 %131
  %133 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %134 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %133, i32 0, i32 4
  %135 = load i32, i32* %10, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %134, i64 0, i64 %136
  store [64 x i16]* %132, [64 x i16]** %137, align 8
  br label %138

; <label>:138:                                    ; preds = %128
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 2)
  %139 = add i64 %pgocount4, 1
  store i64 %139, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jinit_d_coef_controller, i64 0, i64 2)
  %140 = load i32, i32* %10, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* %10, align 4
  br label %125

; <label>:142:                                    ; preds = %125
  %143 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %144 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %143, i32 0, i32 0
  %145 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %144, i32 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*)* @dummy_consume_data, i32 (%struct.jpeg_decompress_struct*)** %145, align 8
  %146 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %147 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %146, i32 0, i32 0
  %148 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %147, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_onepass, i32 (%struct.jpeg_decompress_struct*, i8***)** %148, align 8
  %149 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %150 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %149, i32 0, i32 0
  %151 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %150, i32 0, i32 4
  store %struct.jvirt_barray_control** null, %struct.jvirt_barray_control*** %151, align 8
  br label %152

; <label>:152:                                    ; preds = %142, %99
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_input_pass(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_input_pass, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_input_pass, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 35
  store i32 0, i32* %5, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @start_iMCU_row(%struct.jpeg_decompress_struct* %6)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_output_pass(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_coef_controller*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 75
  %6 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %5, align 8
  %7 = bitcast %struct.jpeg_d_coef_controller* %6 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %7, %struct.my_coef_controller** %3, align 8
  %8 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %9 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %8, i32 0, i32 0
  %10 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %9, i32 0, i32 4
  %11 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %10, align 8
  %12 = icmp ne %struct.jvirt_barray_control** %11, null
  br i1 %12, label %13, label %34

; <label>:13:                                     ; preds = %1
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 18
  %16 = load i32, i32* %15, align 8
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %28

; <label>:18:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i64 0, i64 1)
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %21 = call i32 @smoothing_ok(%struct.jpeg_decompress_struct* %20)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %28

; <label>:23:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i64 0, i64 3)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i64 0, i64 3)
  %25 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %26 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %26, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_smooth_data, i32 (%struct.jpeg_decompress_struct*, i8***)** %27, align 8
  br label %33

; <label>:28:                                     ; preds = %18, %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i64 0, i64 2)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i64 0, i64 2)
  %30 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %31 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %30, i32 0, i32 0
  %32 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %31, i32 0, i32 3
  store i32 (%struct.jpeg_decompress_struct*, i8***)* @decompress_data, i32 (%struct.jpeg_decompress_struct*, i8***)** %32, align 8
  br label %33

; <label>:33:                                     ; preds = %28, %23
  br label %34

; <label>:34:                                     ; preds = %33, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i64 0, i64 0)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_start_output_pass, i64 0, i64 0)
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 37
  store i32 0, i32* %37, align 8
  ret void
}

declare i64 @jround_up(i64, i64) #1

; Function Attrs: nounwind uwtable
define internal i32 @consume_data(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_coef_controller*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [4 x [64 x i16]**], align 16
  %13 = alloca [64 x i16]*, align 8
  %14 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 75
  %17 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %16, align 8
  %18 = bitcast %struct.jpeg_d_coef_controller* %17 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %18, %struct.my_coef_controller** %4, align 8
  store i32 0, i32* %7, align 4
  br label %19

; <label>:19:                                     ; preds = %62, %1
  %20 = load i32, i32* %7, align 4
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 62
  %23 = load i32, i32* %22, align 8
  %24 = icmp slt i32 %20, %23
  br i1 %24, label %25, label %66

; <label>:25:                                     ; preds = %19
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 63
  %28 = load i32, i32* %7, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %27, i64 0, i64 %29
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  store %struct.jpeg_component_info* %31, %struct.jpeg_component_info** %14, align 8
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 1
  %34 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %34, i32 0, i32 8
  %36 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %35, align 8
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %38 = bitcast %struct.jpeg_decompress_struct* %37 to %struct.jpeg_common_struct*
  %39 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %40 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %39, i32 0, i32 5
  %41 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %40, i64 0, i64 %44
  %46 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %45, align 8
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 35
  %49 = load i32, i32* %48, align 8
  %50 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %50, i32 0, i32 3
  %52 = load i32, i32* %51, align 4
  %53 = mul i32 %49, %52
  %54 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %55 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %54, i32 0, i32 3
  %56 = load i32, i32* %55, align 4
  %57 = ptrtoint [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_consume_data to i8*), i32 0)
  %58 = call [64 x i16]** %36(%struct.jpeg_common_struct* %38, %struct.jvirt_barray_control* %46, i32 %53, i32 %56, i32 1)
  %59 = load i32, i32* %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %12, i64 0, i64 %60
  store [64 x i16]** %58, [64 x i16]*** %61, align 8
  br label %62

; <label>:62:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 3)
  %63 = add i64 %pgocount, 1
  store i64 %63, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 3)
  %64 = load i32, i32* %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %7, align 4
  br label %19

; <label>:66:                                     ; preds = %19
  %67 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %68 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %67, i32 0, i32 2
  %69 = load i32, i32* %68, align 4
  store i32 %69, i32* %10, align 4
  br label %70

; <label>:70:                                     ; preds = %183, %66
  %71 = load i32, i32* %10, align 4
  %72 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %73 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %72, i32 0, i32 3
  %74 = load i32, i32* %73, align 8
  %75 = icmp slt i32 %71, %74
  br i1 %75, label %76, label %187

; <label>:76:                                     ; preds = %70
  %77 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %78 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %77, i32 0, i32 1
  %79 = load i32, i32* %78, align 8
  store i32 %79, i32* %5, align 4
  br label %80

; <label>:80:                                     ; preds = %176, %76
  %81 = load i32, i32* %5, align 4
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 64
  %84 = load i32, i32* %83, align 8
  %85 = icmp ult i32 %81, %84
  br i1 %85, label %86, label %180

; <label>:86:                                     ; preds = %80
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %87

; <label>:87:                                     ; preds = %150, %86
  %88 = load i32, i32* %7, align 4
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %89, i32 0, i32 62
  %91 = load i32, i32* %90, align 8
  %92 = icmp slt i32 %88, %91
  br i1 %92, label %93, label %154

; <label>:93:                                     ; preds = %87
  %94 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %94, i32 0, i32 63
  %96 = load i32, i32* %7, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %95, i64 0, i64 %97
  %99 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %98, align 8
  store %struct.jpeg_component_info* %99, %struct.jpeg_component_info** %14, align 8
  %100 = load i32, i32* %5, align 4
  %101 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i32 0, i32 13
  %103 = load i32, i32* %102, align 4
  %104 = mul i32 %100, %103
  store i32 %104, i32* %11, align 4
  store i32 0, i32* %9, align 4
  br label %105

; <label>:105:                                    ; preds = %145, %93
  %106 = load i32, i32* %9, align 4
  %107 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %108 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %107, i32 0, i32 14
  %109 = load i32, i32* %108, align 8
  %110 = icmp slt i32 %106, %109
  br i1 %110, label %111, label %149

; <label>:111:                                    ; preds = %105
  %112 = load i32, i32* %7, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %12, i64 0, i64 %113
  %115 = load [64 x i16]**, [64 x i16]*** %114, align 8
  %116 = load i32, i32* %9, align 4
  %117 = load i32, i32* %10, align 4
  %118 = add nsw i32 %116, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [64 x i16]*, [64 x i16]** %115, i64 %119
  %121 = load [64 x i16]*, [64 x i16]** %120, align 8
  %122 = load i32, i32* %11, align 4
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds [64 x i16], [64 x i16]* %121, i64 %123
  store [64 x i16]* %124, [64 x i16]** %13, align 8
  store i32 0, i32* %8, align 4
  br label %125

; <label>:125:                                    ; preds = %140, %111
  %126 = load i32, i32* %8, align 4
  %127 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %128 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i32 0, i32 13
  %129 = load i32, i32* %128, align 4
  %130 = icmp slt i32 %126, %129
  br i1 %130, label %131, label %144

; <label>:131:                                    ; preds = %125
  %132 = load [64 x i16]*, [64 x i16]** %13, align 8
  %133 = getelementptr inbounds [64 x i16], [64 x i16]* %132, i32 1
  store [64 x i16]* %133, [64 x i16]** %13, align 8
  %134 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %135 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %134, i32 0, i32 4
  %136 = load i32, i32* %6, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %6, align 4
  %138 = sext i32 %136 to i64
  %139 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %135, i64 0, i64 %138
  store [64 x i16]* %132, [64 x i16]** %139, align 8
  br label %140

; <label>:140:                                    ; preds = %131
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 0)
  %141 = add i64 %pgocount1, 1
  store i64 %141, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 0)
  %142 = load i32, i32* %8, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %8, align 4
  br label %125

; <label>:144:                                    ; preds = %125
  br label %145

; <label>:145:                                    ; preds = %144
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 1)
  %146 = add i64 %pgocount2, 1
  store i64 %146, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 1)
  %147 = load i32, i32* %9, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, i32* %9, align 4
  br label %105

; <label>:149:                                    ; preds = %105
  br label %150

; <label>:150:                                    ; preds = %149
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 2)
  %151 = add i64 %pgocount3, 1
  store i64 %151, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 2)
  %152 = load i32, i32* %7, align 4
  %153 = add nsw i32 %152, 1
  store i32 %153, i32* %7, align 4
  br label %87

; <label>:154:                                    ; preds = %87
  %155 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %155, i32 0, i32 79
  %157 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %156, align 8
  %158 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %157, i32 0, i32 1
  %159 = load i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %158, align 8
  %160 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %161 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %162 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %161, i32 0, i32 4
  %163 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %162, i32 0, i32 0
  %164 = ptrtoint i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* %159 to i64
  call void @__llvm_profile_instrument_target(i64 %164, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_consume_data to i8*), i32 1)
  %165 = call i32 %159(%struct.jpeg_decompress_struct* %160, [64 x i16]** %163)
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %175, label %167

; <label>:167:                                    ; preds = %154
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 6)
  %168 = add i64 %pgocount4, 1
  store i64 %168, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 6)
  %169 = load i32, i32* %10, align 4
  %170 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %171 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %170, i32 0, i32 2
  store i32 %169, i32* %171, align 4
  %172 = load i32, i32* %5, align 4
  %173 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %174 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %173, i32 0, i32 1
  store i32 %172, i32* %174, align 8
  store i32 0, i32* %2, align 4
  br label %208

; <label>:175:                                    ; preds = %154
  br label %176

; <label>:176:                                    ; preds = %175
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 4)
  %177 = add i64 %pgocount5, 1
  store i64 %177, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 4)
  %178 = load i32, i32* %5, align 4
  %179 = add i32 %178, 1
  store i32 %179, i32* %5, align 4
  br label %80

; <label>:180:                                    ; preds = %80
  %181 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %182 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %181, i32 0, i32 1
  store i32 0, i32* %182, align 8
  br label %183

; <label>:183:                                    ; preds = %180
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 5)
  %184 = add i64 %pgocount6, 1
  store i64 %184, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 5)
  %185 = load i32, i32* %10, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %10, align 4
  br label %70

; <label>:187:                                    ; preds = %70
  %188 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %189 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %188, i32 0, i32 35
  %190 = load i32, i32* %189, align 8
  %191 = add i32 %190, 1
  store i32 %191, i32* %189, align 8
  %192 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %193 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %192, i32 0, i32 60
  %194 = load i32, i32* %193, align 8
  %195 = icmp ult i32 %191, %194
  br i1 %195, label %196, label %199

; <label>:196:                                    ; preds = %187
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 7)
  %197 = add i64 %pgocount7, 1
  store i64 %197, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 7)
  %198 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @start_iMCU_row(%struct.jpeg_decompress_struct* %198)
  store i32 3, i32* %2, align 4
  br label %208

; <label>:199:                                    ; preds = %187
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 8)
  %200 = add i64 %pgocount8, 1
  store i64 %200, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_consume_data, i64 0, i64 8)
  %201 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %202 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %201, i32 0, i32 77
  %203 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %202, align 8
  %204 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %203, i32 0, i32 3
  %205 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %204, align 8
  %206 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %207 = ptrtoint void (%struct.jpeg_decompress_struct*)* %205 to i64
  call void @__llvm_profile_instrument_target(i64 %207, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_consume_data to i8*), i32 2)
  call void %205(%struct.jpeg_decompress_struct* %206)
  store i32 4, i32* %2, align 4
  br label %208

; <label>:208:                                    ; preds = %199, %196, %167
  %209 = load i32, i32* %2, align 4
  ret i32 %209
}

; Function Attrs: nounwind uwtable
define internal i32 @decompress_data(%struct.jpeg_decompress_struct*, i8***) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca i8***, align 8
  %6 = alloca %struct.my_coef_controller*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [64 x i16]**, align 8
  %13 = alloca [64 x i16]*, align 8
  %14 = alloca i8**, align 8
  %15 = alloca i32, align 4
  %16 = alloca %struct.jpeg_component_info*, align 8
  %17 = alloca void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store i8*** %1, i8**** %5, align 8
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 75
  %20 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %19, align 8
  %21 = bitcast %struct.jpeg_d_coef_controller* %20 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %21, %struct.my_coef_controller** %6, align 8
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 60
  %24 = load i32, i32* %23, align 8
  %25 = sub i32 %24, 1
  store i32 %25, i32* %7, align 4
  br label %26

; <label>:26:                                     ; preds = %68, %2
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 34
  %29 = load i32, i32* %28, align 4
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 36
  %32 = load i32, i32* %31, align 4
  %33 = icmp slt i32 %29, %32
  br i1 %33, label %54, label %34

; <label>:34:                                     ; preds = %26
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 34
  %37 = load i32, i32* %36, align 4
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 36
  %40 = load i32, i32* %39, align 4
  %41 = icmp eq i32 %37, %40
  br i1 %41, label %42, label %51

; <label>:42:                                     ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 7)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 7)
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 35
  %46 = load i32, i32* %45, align 8
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 37
  %49 = load i32, i32* %48, align 8
  %50 = icmp ule i32 %46, %49
  br label %51

; <label>:51:                                     ; preds = %42, %34
  %52 = phi i1 [ false, %34 ], [ %50, %42 ]
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 3)
  %53 = add i64 %pgocount1, 1
  store i64 %53, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 3)
  br label %54

; <label>:54:                                     ; preds = %51, %26
  %55 = phi i1 [ true, %26 ], [ %52, %51 ]
  br i1 %55, label %56, label %70

; <label>:56:                                     ; preds = %54
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 77
  %59 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %59, i32 0, i32 0
  %61 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %60, align 8
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %63 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %61 to i64
  call void @__llvm_profile_instrument_target(i64 %63, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_data to i8*), i32 0)
  %64 = call i32 %61(%struct.jpeg_decompress_struct* %62)
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %68

; <label>:66:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 9)
  %67 = add i64 %pgocount2, 1
  store i64 %67, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 9)
  store i32 0, i32* %3, align 4
  br label %220

; <label>:68:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 2)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 2)
  br label %26

; <label>:70:                                     ; preds = %54
  store i32 0, i32* %9, align 4
  %71 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %71, i32 0, i32 43
  %73 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %72, align 8
  store %struct.jpeg_component_info* %73, %struct.jpeg_component_info** %16, align 8
  br label %74

; <label>:74:                                     ; preds = %202, %70
  %75 = load i32, i32* %9, align 4
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 8
  %78 = load i32, i32* %77, align 8
  %79 = icmp slt i32 %75, %78
  br i1 %79, label %80, label %207

; <label>:80:                                     ; preds = %74
  %81 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %81, i32 0, i32 12
  %83 = load i32, i32* %82, align 8
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %87, label %85

; <label>:85:                                     ; preds = %80
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 4)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 4)
  br label %202

; <label>:87:                                     ; preds = %80
  %88 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %88, i32 0, i32 1
  %90 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %89, align 8
  %91 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %90, i32 0, i32 8
  %92 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %91, align 8
  %93 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %94 = bitcast %struct.jpeg_decompress_struct* %93 to %struct.jpeg_common_struct*
  %95 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %96 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %95, i32 0, i32 5
  %97 = load i32, i32* %9, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %96, i64 0, i64 %98
  %100 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %99, align 8
  %101 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %102 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %101, i32 0, i32 37
  %103 = load i32, i32* %102, align 8
  %104 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %105 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %104, i32 0, i32 3
  %106 = load i32, i32* %105, align 4
  %107 = mul i32 %103, %106
  %108 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %109 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %108, i32 0, i32 3
  %110 = load i32, i32* %109, align 4
  %111 = ptrtoint [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* %92 to i64
  call void @__llvm_profile_instrument_target(i64 %111, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_data to i8*), i32 1)
  %112 = call [64 x i16]** %92(%struct.jpeg_common_struct* %94, %struct.jvirt_barray_control* %100, i32 %107, i32 %110, i32 0)
  store [64 x i16]** %112, [64 x i16]*** %12, align 8
  %113 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %114 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %113, i32 0, i32 37
  %115 = load i32, i32* %114, align 8
  %116 = load i32, i32* %7, align 4
  %117 = icmp ult i32 %115, %116
  br i1 %117, label %118, label %123

; <label>:118:                                    ; preds = %87
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 5)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 5)
  %120 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %121 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %120, i32 0, i32 3
  %122 = load i32, i32* %121, align 4
  store i32 %122, i32* %11, align 4
  br label %140

; <label>:123:                                    ; preds = %87
  %124 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %125 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %124, i32 0, i32 8
  %126 = load i32, i32* %125, align 8
  %127 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %128 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i32 0, i32 3
  %129 = load i32, i32* %128, align 4
  %130 = urem i32 %126, %129
  store i32 %130, i32* %11, align 4
  %131 = load i32, i32* %11, align 4
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %138

; <label>:133:                                    ; preds = %123
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 8)
  %134 = add i64 %pgocount6, 1
  store i64 %134, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 8)
  %135 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %136 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %135, i32 0, i32 3
  %137 = load i32, i32* %136, align 4
  store i32 %137, i32* %11, align 4
  br label %138

; <label>:138:                                    ; preds = %133, %123
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 6)
  %139 = add i64 %pgocount7, 1
  store i64 %139, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 6)
  br label %140

; <label>:140:                                    ; preds = %138, %118
  %141 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %142 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %141, i32 0, i32 80
  %143 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %143, i32 0, i32 1
  %145 = load i32, i32* %9, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*]* %144, i64 0, i64 %146
  %148 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %147, align 8
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* %148, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %17, align 8
  %149 = load i8***, i8**** %5, align 8
  %150 = load i32, i32* %9, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i8**, i8*** %149, i64 %151
  %153 = load i8**, i8*** %152, align 8
  store i8** %153, i8*** %14, align 8
  store i32 0, i32* %10, align 4
  br label %154

; <label>:154:                                    ; preds = %197, %140
  %155 = load i32, i32* %10, align 4
  %156 = load i32, i32* %11, align 4
  %157 = icmp slt i32 %155, %156
  br i1 %157, label %158, label %201

; <label>:158:                                    ; preds = %154
  %159 = load [64 x i16]**, [64 x i16]*** %12, align 8
  %160 = load i32, i32* %10, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [64 x i16]*, [64 x i16]** %159, i64 %161
  %163 = load [64 x i16]*, [64 x i16]** %162, align 8
  store [64 x i16]* %163, [64 x i16]** %13, align 8
  store i32 0, i32* %15, align 4
  store i32 0, i32* %8, align 4
  br label %164

; <label>:164:                                    ; preds = %186, %158
  %165 = load i32, i32* %8, align 4
  %166 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %167 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %166, i32 0, i32 7
  %168 = load i32, i32* %167, align 4
  %169 = icmp ult i32 %165, %168
  br i1 %169, label %170, label %190

; <label>:170:                                    ; preds = %164
  %171 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %17, align 8
  %172 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %173 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %174 = load [64 x i16]*, [64 x i16]** %13, align 8
  %175 = bitcast [64 x i16]* %174 to i16*
  %176 = load i8**, i8*** %14, align 8
  %177 = load i32, i32* %15, align 4
  %178 = ptrtoint void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* %171 to i64
  call void @__llvm_profile_instrument_target(i64 %178, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_data to i8*), i32 2)
  call void %171(%struct.jpeg_decompress_struct* %172, %struct.jpeg_component_info* %173, i16* %175, i8** %176, i32 %177)
  %179 = load [64 x i16]*, [64 x i16]** %13, align 8
  %180 = getelementptr inbounds [64 x i16], [64 x i16]* %179, i32 1
  store [64 x i16]* %180, [64 x i16]** %13, align 8
  %181 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %182 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %181, i32 0, i32 9
  %183 = load i32, i32* %182, align 4
  %184 = load i32, i32* %15, align 4
  %185 = add i32 %184, %183
  store i32 %185, i32* %15, align 4
  br label %186

; <label>:186:                                    ; preds = %170
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 0)
  %187 = add i64 %pgocount8, 1
  store i64 %187, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 0)
  %188 = load i32, i32* %8, align 4
  %189 = add i32 %188, 1
  store i32 %189, i32* %8, align 4
  br label %164

; <label>:190:                                    ; preds = %164
  %191 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %192 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %191, i32 0, i32 9
  %193 = load i32, i32* %192, align 4
  %194 = load i8**, i8*** %14, align 8
  %195 = sext i32 %193 to i64
  %196 = getelementptr inbounds i8*, i8** %194, i64 %195
  store i8** %196, i8*** %14, align 8
  br label %197

; <label>:197:                                    ; preds = %190
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 1)
  %198 = add i64 %pgocount9, 1
  store i64 %198, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 1)
  %199 = load i32, i32* %10, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %10, align 4
  br label %154

; <label>:201:                                    ; preds = %154
  br label %202

; <label>:202:                                    ; preds = %201, %85
  %203 = load i32, i32* %9, align 4
  %204 = add nsw i32 %203, 1
  store i32 %204, i32* %9, align 4
  %205 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %206 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %205, i32 1
  store %struct.jpeg_component_info* %206, %struct.jpeg_component_info** %16, align 8
  br label %74

; <label>:207:                                    ; preds = %74
  %208 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %209 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %208, i32 0, i32 37
  %210 = load i32, i32* %209, align 8
  %211 = add i32 %210, 1
  store i32 %211, i32* %209, align 8
  %212 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %213 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %212, i32 0, i32 60
  %214 = load i32, i32* %213, align 8
  %215 = icmp ult i32 %211, %214
  br i1 %215, label %216, label %218

; <label>:216:                                    ; preds = %207
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 10)
  %217 = add i64 %pgocount10, 1
  store i64 %217, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 10)
  store i32 3, i32* %3, align 4
  br label %220

; <label>:218:                                    ; preds = %207
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 11)
  %219 = add i64 %pgocount11, 1
  store i64 %219, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_data, i64 0, i64 11)
  store i32 4, i32* %3, align 4
  br label %220

; <label>:220:                                    ; preds = %218, %216, %66
  %221 = load i32, i32* %3, align 4
  ret i32 %221
}

; Function Attrs: nounwind uwtable
define internal i32 @dummy_consume_data(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dummy_consume_data, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_dummy_consume_data, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @decompress_onepass(%struct.jpeg_decompress_struct*, i8***) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
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
  %16 = alloca i8**, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca %struct.jpeg_component_info*, align 8
  %20 = alloca void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store i8*** %1, i8**** %5, align 8
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 75
  %23 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %22, align 8
  %24 = bitcast %struct.jpeg_d_coef_controller* %23 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %24, %struct.my_coef_controller** %6, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 64
  %27 = load i32, i32* %26, align 8
  %28 = sub i32 %27, 1
  store i32 %28, i32* %8, align 4
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 60
  %31 = load i32, i32* %30, align 8
  %32 = sub i32 %31, 1
  store i32 %32, i32* %9, align 4
  %33 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %34 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %33, i32 0, i32 2
  %35 = load i32, i32* %34, align 4
  store i32 %35, i32* %14, align 4
  br label %36

; <label>:36:                                     ; preds = %231, %2
  %37 = load i32, i32* %14, align 4
  %38 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %39 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %38, i32 0, i32 3
  %40 = load i32, i32* %39, align 8
  %41 = icmp slt i32 %37, %40
  br i1 %41, label %42, label %235

; <label>:42:                                     ; preds = %36
  %43 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %44 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %43, i32 0, i32 1
  %45 = load i32, i32* %44, align 8
  store i32 %45, i32* %7, align 4
  br label %46

; <label>:46:                                     ; preds = %224, %42
  %47 = load i32, i32* %7, align 4
  %48 = load i32, i32* %8, align 4
  %49 = icmp ule i32 %47, %48
  br i1 %49, label %50, label %228

; <label>:50:                                     ; preds = %46
  %51 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %52 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %51, i32 0, i32 4
  %53 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %52, i64 0, i64 0
  %54 = load [64 x i16]*, [64 x i16]** %53, align 8
  %55 = bitcast [64 x i16]* %54 to i8*
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 66
  %58 = load i32, i32* %57, align 8
  %59 = sext i32 %58 to i64
  %60 = mul i64 %59, 128
  call void @jzero_far(i8* %55, i64 %60)
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %61, i32 0, i32 79
  %63 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %63, i32 0, i32 1
  %65 = load i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %64, align 8
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %67 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %68 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %67, i32 0, i32 4
  %69 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %68, i32 0, i32 0
  %70 = ptrtoint i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* %65 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_onepass to i8*), i32 0)
  %71 = call i32 %65(%struct.jpeg_decompress_struct* %66, [64 x i16]** %69)
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %81, label %73

; <label>:73:                                     ; preds = %50
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 9)
  %74 = add i64 %pgocount, 1
  store i64 %74, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 9)
  %75 = load i32, i32* %14, align 4
  %76 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %77 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %76, i32 0, i32 2
  store i32 %75, i32* %77, align 4
  %78 = load i32, i32* %7, align 4
  %79 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %80 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %79, i32 0, i32 1
  store i32 %78, i32* %80, align 8
  store i32 0, i32* %3, align 4
  br label %260

; <label>:81:                                     ; preds = %50
  store i32 0, i32* %10, align 4
  store i32 0, i32* %11, align 4
  br label %82

; <label>:82:                                     ; preds = %220, %81
  %83 = load i32, i32* %11, align 4
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 62
  %86 = load i32, i32* %85, align 8
  %87 = icmp slt i32 %83, %86
  br i1 %87, label %88, label %223

; <label>:88:                                     ; preds = %82
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %89, i32 0, i32 63
  %91 = load i32, i32* %11, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %90, i64 0, i64 %92
  %94 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %93, align 8
  store %struct.jpeg_component_info* %94, %struct.jpeg_component_info** %19, align 8
  %95 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %96 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %95, i32 0, i32 12
  %97 = load i32, i32* %96, align 8
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %106, label %99

; <label>:99:                                     ; preds = %88
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 4)
  %100 = add i64 %pgocount1, 1
  store i64 %100, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 4)
  %101 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i32 0, i32 15
  %103 = load i32, i32* %102, align 4
  %104 = load i32, i32* %10, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, i32* %10, align 4
  br label %220

; <label>:106:                                    ; preds = %88
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %107, i32 0, i32 80
  %109 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %108, align 8
  %110 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %109, i32 0, i32 1
  %111 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %112 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %111, i32 0, i32 1
  %113 = load i32, i32* %112, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*]* %110, i64 0, i64 %114
  %116 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %115, align 8
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* %116, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %20, align 8
  %117 = load i32, i32* %7, align 4
  %118 = load i32, i32* %8, align 4
  %119 = icmp ult i32 %117, %118
  br i1 %119, label %120, label %125

; <label>:120:                                    ; preds = %106
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 5)
  %121 = add i64 %pgocount2, 1
  store i64 %121, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 5)
  %122 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %123 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %122, i32 0, i32 13
  %124 = load i32, i32* %123, align 4
  br label %130

; <label>:125:                                    ; preds = %106
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 6)
  %126 = add i64 %pgocount3, 1
  store i64 %126, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 6)
  %127 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %128 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i32 0, i32 17
  %129 = load i32, i32* %128, align 4
  br label %130

; <label>:130:                                    ; preds = %125, %120
  %131 = phi i32 [ %124, %120 ], [ %129, %125 ]
  store i32 %131, i32* %15, align 4
  %132 = load i8***, i8**** %5, align 8
  %133 = load i32, i32* %11, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i8**, i8*** %132, i64 %134
  %136 = load i8**, i8*** %135, align 8
  %137 = load i32, i32* %14, align 4
  %138 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %139 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %138, i32 0, i32 9
  %140 = load i32, i32* %139, align 4
  %141 = mul nsw i32 %137, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8*, i8** %136, i64 %142
  store i8** %143, i8*** %16, align 8
  %144 = load i32, i32* %7, align 4
  %145 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %146 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %145, i32 0, i32 16
  %147 = load i32, i32* %146, align 8
  %148 = mul i32 %144, %147
  store i32 %148, i32* %17, align 4
  store i32 0, i32* %13, align 4
  br label %149

; <label>:149:                                    ; preds = %215, %130
  %150 = load i32, i32* %13, align 4
  %151 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %152 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %151, i32 0, i32 14
  %153 = load i32, i32* %152, align 8
  %154 = icmp slt i32 %150, %153
  br i1 %154, label %155, label %219

; <label>:155:                                    ; preds = %149
  %156 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %157 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %156, i32 0, i32 35
  %158 = load i32, i32* %157, align 8
  %159 = load i32, i32* %9, align 4
  %160 = icmp ult i32 %158, %159
  br i1 %160, label %170, label %161

; <label>:161:                                    ; preds = %155
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 3)
  %162 = add i64 %pgocount4, 1
  store i64 %162, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 3)
  %163 = load i32, i32* %14, align 4
  %164 = load i32, i32* %13, align 4
  %165 = add nsw i32 %163, %164
  %166 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %167 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %166, i32 0, i32 18
  %168 = load i32, i32* %167, align 8
  %169 = icmp slt i32 %165, %168
  br i1 %169, label %170, label %203

; <label>:170:                                    ; preds = %161, %155
  %171 = load i32, i32* %17, align 4
  store i32 %171, i32* %18, align 4
  store i32 0, i32* %12, align 4
  br label %172

; <label>:172:                                    ; preds = %198, %170
  %173 = load i32, i32* %12, align 4
  %174 = load i32, i32* %15, align 4
  %175 = icmp slt i32 %173, %174
  br i1 %175, label %176, label %201

; <label>:176:                                    ; preds = %172
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 0)
  %177 = add i64 %pgocount5, 1
  store i64 %177, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 0)
  %178 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %20, align 8
  %179 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %180 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %181 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %182 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %181, i32 0, i32 4
  %183 = load i32, i32* %10, align 4
  %184 = load i32, i32* %12, align 4
  %185 = add nsw i32 %183, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %182, i64 0, i64 %186
  %188 = load [64 x i16]*, [64 x i16]** %187, align 8
  %189 = bitcast [64 x i16]* %188 to i16*
  %190 = load i8**, i8*** %16, align 8
  %191 = load i32, i32* %18, align 4
  %192 = ptrtoint void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* %178 to i64
  call void @__llvm_profile_instrument_target(i64 %192, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_onepass to i8*), i32 1)
  call void %178(%struct.jpeg_decompress_struct* %179, %struct.jpeg_component_info* %180, i16* %189, i8** %190, i32 %191)
  %193 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %194 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %193, i32 0, i32 9
  %195 = load i32, i32* %194, align 4
  %196 = load i32, i32* %18, align 4
  %197 = add i32 %196, %195
  store i32 %197, i32* %18, align 4
  br label %198

; <label>:198:                                    ; preds = %176
  %199 = load i32, i32* %12, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %12, align 4
  br label %172

; <label>:201:                                    ; preds = %172
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 2)
  %202 = add i64 %pgocount6, 1
  store i64 %202, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 2)
  br label %203

; <label>:203:                                    ; preds = %201, %161
  %204 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %205 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %204, i32 0, i32 13
  %206 = load i32, i32* %205, align 4
  %207 = load i32, i32* %10, align 4
  %208 = add nsw i32 %207, %206
  store i32 %208, i32* %10, align 4
  %209 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %210 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %209, i32 0, i32 9
  %211 = load i32, i32* %210, align 4
  %212 = load i8**, i8*** %16, align 8
  %213 = sext i32 %211 to i64
  %214 = getelementptr inbounds i8*, i8** %212, i64 %213
  store i8** %214, i8*** %16, align 8
  br label %215

; <label>:215:                                    ; preds = %203
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 1)
  %216 = add i64 %pgocount7, 1
  store i64 %216, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 1)
  %217 = load i32, i32* %13, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %13, align 4
  br label %149

; <label>:219:                                    ; preds = %149
  br label %220

; <label>:220:                                    ; preds = %219, %99
  %221 = load i32, i32* %11, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %11, align 4
  br label %82

; <label>:223:                                    ; preds = %82
  br label %224

; <label>:224:                                    ; preds = %223
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 7)
  %225 = add i64 %pgocount8, 1
  store i64 %225, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 7)
  %226 = load i32, i32* %7, align 4
  %227 = add i32 %226, 1
  store i32 %227, i32* %7, align 4
  br label %46

; <label>:228:                                    ; preds = %46
  %229 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %230 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %229, i32 0, i32 1
  store i32 0, i32* %230, align 8
  br label %231

; <label>:231:                                    ; preds = %228
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 8)
  %232 = add i64 %pgocount9, 1
  store i64 %232, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 8)
  %233 = load i32, i32* %14, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %14, align 4
  br label %36

; <label>:235:                                    ; preds = %36
  %236 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %237 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %236, i32 0, i32 37
  %238 = load i32, i32* %237, align 8
  %239 = add i32 %238, 1
  store i32 %239, i32* %237, align 8
  %240 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %241 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %240, i32 0, i32 35
  %242 = load i32, i32* %241, align 8
  %243 = add i32 %242, 1
  store i32 %243, i32* %241, align 8
  %244 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %245 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %244, i32 0, i32 60
  %246 = load i32, i32* %245, align 8
  %247 = icmp ult i32 %243, %246
  br i1 %247, label %248, label %251

; <label>:248:                                    ; preds = %235
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 10)
  %249 = add i64 %pgocount10, 1
  store i64 %249, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 10)
  %250 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  call void @start_iMCU_row(%struct.jpeg_decompress_struct* %250)
  store i32 3, i32* %3, align 4
  br label %260

; <label>:251:                                    ; preds = %235
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 11)
  %252 = add i64 %pgocount11, 1
  store i64 %252, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_decompress_onepass, i64 0, i64 11)
  %253 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %254 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %253, i32 0, i32 77
  %255 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %254, align 8
  %256 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %255, i32 0, i32 3
  %257 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %256, align 8
  %258 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %259 = ptrtoint void (%struct.jpeg_decompress_struct*)* %257 to i64
  call void @__llvm_profile_instrument_target(i64 %259, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_onepass to i8*), i32 2)
  call void %257(%struct.jpeg_decompress_struct* %258)
  store i32 4, i32* %3, align 4
  br label %260

; <label>:260:                                    ; preds = %251, %248, %73
  %261 = load i32, i32* %3, align 4
  ret i32 %261
}

; Function Attrs: nounwind uwtable
define internal void @start_iMCU_row(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_coef_controller*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 75
  %6 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %5, align 8
  %7 = bitcast %struct.jpeg_d_coef_controller* %6 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %7, %struct.my_coef_controller** %3, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 62
  %10 = load i32, i32* %9, align 8
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 0)
  %14 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %15 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %14, i32 0, i32 3
  store i32 1, i32* %15, align 8
  br label %46

; <label>:16:                                     ; preds = %1
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 35
  %19 = load i32, i32* %18, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 60
  %22 = load i32, i32* %21, align 8
  %23 = sub i32 %22, 1
  %24 = icmp ult i32 %19, %23
  br i1 %24, label %25, label %35

; <label>:25:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 1)
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 63
  %29 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %28, i64 0, i64 0
  %30 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %30, i32 0, i32 3
  %32 = load i32, i32* %31, align 4
  %33 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %34 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %33, i32 0, i32 3
  store i32 %32, i32* %34, align 8
  br label %45

; <label>:35:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 2)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i64 0, i64 2)
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 63
  %39 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %38, i64 0, i64 0
  %40 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %40, i32 0, i32 18
  %42 = load i32, i32* %41, align 8
  %43 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %44 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %43, i32 0, i32 3
  store i32 %42, i32* %44, align 8
  br label %45

; <label>:45:                                     ; preds = %35, %25
  br label %46

; <label>:46:                                     ; preds = %45, %12
  %47 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %48 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %47, i32 0, i32 1
  store i32 0, i32* %48, align 8
  %49 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %50 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %49, i32 0, i32 2
  store i32 0, i32* %50, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @smoothing_ok(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_coef_controller*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.jpeg_component_info*, align 8
  %9 = alloca %struct.JQUANT_TBL*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 75
  %14 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %13, align 8
  %15 = bitcast %struct.jpeg_d_coef_controller* %14 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %15, %struct.my_coef_controller** %4, align 8
  store i32 0, i32* %5, align 4
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 44
  %18 = load i32, i32* %17, align 8
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %26

; <label>:20:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 8)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 8)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 38
  %24 = load [64 x i32]*, [64 x i32]** %23, align 8
  %25 = icmp eq [64 x i32]* %24, null
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %20, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 9)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 9)
  store i32 0, i32* %2, align 4
  br label %174

; <label>:28:                                     ; preds = %20
  %29 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %30 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %29, i32 0, i32 6
  %31 = load i32*, i32** %30, align 8
  %32 = icmp eq i32* %31, null
  br i1 %32, label %33, label %52

; <label>:33:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 11)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 11)
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 1
  %37 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %37, i32 0, i32 0
  %39 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %38, align 8
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %41 = bitcast %struct.jpeg_decompress_struct* %40 to %struct.jpeg_common_struct*
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 8
  %44 = load i32, i32* %43, align 8
  %45 = sext i32 %44 to i64
  %46 = mul i64 %45, 24
  %47 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_smoothing_ok to i8*), i32 0)
  %48 = call i8* %39(%struct.jpeg_common_struct* %41, i32 1, i64 %46)
  %49 = bitcast i8* %48 to i32*
  %50 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %51 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %50, i32 0, i32 6
  store i32* %49, i32** %51, align 8
  br label %52

; <label>:52:                                     ; preds = %33, %28
  %53 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %54 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %53, i32 0, i32 6
  %55 = load i32*, i32** %54, align 8
  store i32* %55, i32** %11, align 8
  store i32 0, i32* %6, align 4
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 43
  %58 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %57, align 8
  store %struct.jpeg_component_info* %58, %struct.jpeg_component_info** %8, align 8
  br label %59

; <label>:59:                                     ; preds = %165, %52
  %60 = load i32, i32* %6, align 4
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %61, i32 0, i32 8
  %63 = load i32, i32* %62, align 8
  %64 = icmp slt i32 %60, %63
  br i1 %64, label %65, label %171

; <label>:65:                                     ; preds = %59
  %66 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i32 0, i32 19
  %68 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %67, align 8
  store %struct.JQUANT_TBL* %68, %struct.JQUANT_TBL** %9, align 8
  %69 = icmp eq %struct.JQUANT_TBL* %68, null
  br i1 %69, label %70, label %72

; <label>:70:                                     ; preds = %65
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 13)
  %71 = add i64 %pgocount3, 1
  store i64 %71, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 13)
  store i32 0, i32* %2, align 4
  br label %174

; <label>:72:                                     ; preds = %65
  %73 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %74 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %73, i32 0, i32 0
  %75 = getelementptr inbounds [64 x i16], [64 x i16]* %74, i64 0, i64 0
  %76 = load i16, i16* %75, align 4
  %77 = zext i16 %76 to i32
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %119, label %79

; <label>:79:                                     ; preds = %72
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 2)
  %80 = add i64 %pgocount4, 1
  store i64 %80, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 2)
  %81 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %82 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %81, i32 0, i32 0
  %83 = getelementptr inbounds [64 x i16], [64 x i16]* %82, i64 0, i64 1
  %84 = load i16, i16* %83, align 2
  %85 = zext i16 %84 to i32
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %119, label %87

; <label>:87:                                     ; preds = %79
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 3)
  %88 = add i64 %pgocount5, 1
  store i64 %88, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 3)
  %89 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %90 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %89, i32 0, i32 0
  %91 = getelementptr inbounds [64 x i16], [64 x i16]* %90, i64 0, i64 8
  %92 = load i16, i16* %91, align 4
  %93 = zext i16 %92 to i32
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %119, label %95

; <label>:95:                                     ; preds = %87
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 4)
  %96 = add i64 %pgocount6, 1
  store i64 %96, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 4)
  %97 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %98 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %97, i32 0, i32 0
  %99 = getelementptr inbounds [64 x i16], [64 x i16]* %98, i64 0, i64 16
  %100 = load i16, i16* %99, align 4
  %101 = zext i16 %100 to i32
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %119, label %103

; <label>:103:                                    ; preds = %95
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 5)
  %104 = add i64 %pgocount7, 1
  store i64 %104, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 5)
  %105 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %106 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %105, i32 0, i32 0
  %107 = getelementptr inbounds [64 x i16], [64 x i16]* %106, i64 0, i64 9
  %108 = load i16, i16* %107, align 2
  %109 = zext i16 %108 to i32
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %119, label %111

; <label>:111:                                    ; preds = %103
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 6)
  %112 = add i64 %pgocount8, 1
  store i64 %112, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 6)
  %113 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %9, align 8
  %114 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %113, i32 0, i32 0
  %115 = getelementptr inbounds [64 x i16], [64 x i16]* %114, i64 0, i64 2
  %116 = load i16, i16* %115, align 4
  %117 = zext i16 %116 to i32
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %121

; <label>:119:                                    ; preds = %111, %103, %95, %87, %79, %72
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 10)
  %120 = add i64 %pgocount9, 1
  store i64 %120, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 10)
  store i32 0, i32* %2, align 4
  br label %174

; <label>:121:                                    ; preds = %111
  %122 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %123 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %122, i32 0, i32 38
  %124 = load [64 x i32]*, [64 x i32]** %123, align 8
  %125 = load i32, i32* %6, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [64 x i32], [64 x i32]* %124, i64 %126
  %128 = getelementptr inbounds [64 x i32], [64 x i32]* %127, i32 0, i32 0
  store i32* %128, i32** %10, align 8
  %129 = load i32*, i32** %10, align 8
  %130 = getelementptr inbounds i32, i32* %129, i64 0
  %131 = load i32, i32* %130, align 4
  %132 = icmp slt i32 %131, 0
  br i1 %132, label %133, label %135

; <label>:133:                                    ; preds = %121
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 14)
  %134 = add i64 %pgocount10, 1
  store i64 %134, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 14)
  store i32 0, i32* %2, align 4
  br label %174

; <label>:135:                                    ; preds = %121
  store i32 1, i32* %7, align 4
  br label %136

; <label>:136:                                    ; preds = %158, %135
  %137 = load i32, i32* %7, align 4
  %138 = icmp sle i32 %137, 5
  br i1 %138, label %139, label %162

; <label>:139:                                    ; preds = %136
  %140 = load i32*, i32** %10, align 8
  %141 = load i32, i32* %7, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32* %140, i64 %142
  %144 = load i32, i32* %143, align 4
  %145 = load i32*, i32** %11, align 8
  %146 = load i32, i32* %7, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i32, i32* %145, i64 %147
  store i32 %144, i32* %148, align 4
  %149 = load i32*, i32** %10, align 8
  %150 = load i32, i32* %7, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32* %149, i64 %151
  %153 = load i32, i32* %152, align 4
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %157

; <label>:155:                                    ; preds = %139
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 1)
  %156 = add i64 %pgocount11, 1
  store i64 %156, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 1)
  store i32 1, i32* %5, align 4
  br label %157

; <label>:157:                                    ; preds = %155, %139
  br label %158

; <label>:158:                                    ; preds = %157
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 0)
  %159 = add i64 %pgocount12, 1
  store i64 %159, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 0)
  %160 = load i32, i32* %7, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, i32* %7, align 4
  br label %136

; <label>:162:                                    ; preds = %136
  %163 = load i32*, i32** %11, align 8
  %164 = getelementptr inbounds i32, i32* %163, i64 6
  store i32* %164, i32** %11, align 8
  br label %165

; <label>:165:                                    ; preds = %162
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 7)
  %166 = add i64 %pgocount13, 1
  store i64 %166, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 7)
  %167 = load i32, i32* %6, align 4
  %168 = add nsw i32 %167, 1
  store i32 %168, i32* %6, align 4
  %169 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %170 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %169, i32 1
  store %struct.jpeg_component_info* %170, %struct.jpeg_component_info** %8, align 8
  br label %59

; <label>:171:                                    ; preds = %59
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 12)
  %172 = add i64 %pgocount14, 1
  store i64 %172, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_smoothing_ok, i64 0, i64 12)
  %173 = load i32, i32* %5, align 4
  store i32 %173, i32* %2, align 4
  br label %174

; <label>:174:                                    ; preds = %171, %133, %119, %70, %26
  %175 = load i32, i32* %2, align 4
  ret i32 %175
}

; Function Attrs: nounwind uwtable
define internal i32 @decompress_smooth_data(%struct.jpeg_decompress_struct*, i8***) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca i8***, align 8
  %6 = alloca %struct.my_coef_controller*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [64 x i16]**, align 8
  %15 = alloca [64 x i16]*, align 8
  %16 = alloca [64 x i16]*, align 8
  %17 = alloca [64 x i16]*, align 8
  %18 = alloca i8**, align 8
  %19 = alloca i32, align 4
  %20 = alloca %struct.jpeg_component_info*, align 8
  %21 = alloca void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca [64 x i16], align 16
  %25 = alloca i32*, align 8
  %26 = alloca %struct.JQUANT_TBL*, align 8
  %27 = alloca i64, align 8
  %28 = alloca i64, align 8
  %29 = alloca i64, align 8
  %30 = alloca i64, align 8
  %31 = alloca i64, align 8
  %32 = alloca i64, align 8
  %33 = alloca i64, align 8
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store i8*** %1, i8**** %5, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 75
  %48 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %47, align 8
  %49 = bitcast %struct.jpeg_d_coef_controller* %48 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %49, %struct.my_coef_controller** %6, align 8
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 60
  %52 = load i32, i32* %51, align 8
  %53 = sub i32 %52, 1
  store i32 %53, i32* %7, align 4
  br label %54

; <label>:54:                                     ; preds = %114, %2
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 34
  %57 = load i32, i32* %56, align 4
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 36
  %60 = load i32, i32* %59, align 4
  %61 = icmp sle i32 %57, %60
  br i1 %61, label %62, label %71

; <label>:62:                                     ; preds = %54
  %pgocount = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 44)
  %63 = add i64 %pgocount, 1
  store i64 %63, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 44)
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %64, i32 0, i32 77
  %66 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %65, align 8
  %67 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %66, i32 0, i32 5
  %68 = load i32, i32* %67, align 4
  %69 = icmp ne i32 %68, 0
  %70 = xor i1 %69, true
  br label %71

; <label>:71:                                     ; preds = %62, %54
  %72 = phi i1 [ false, %54 ], [ %70, %62 ]
  br i1 %72, label %73, label %116

; <label>:73:                                     ; preds = %71
  %74 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %74, i32 0, i32 34
  %76 = load i32, i32* %75, align 4
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i32 0, i32 36
  %79 = load i32, i32* %78, align 4
  %80 = icmp eq i32 %76, %79
  br i1 %80, label %81, label %102

; <label>:81:                                     ; preds = %73
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 68
  %84 = load i32, i32* %83, align 4
  %85 = icmp eq i32 %84, 0
  %86 = zext i1 %85 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 54)
  %87 = add i64 %pgocount1, %86
  store i64 %87, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 54)
  %88 = select i1 %85, i32 1, i32 0
  store i32 %88, i32* %45, align 4
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %89, i32 0, i32 35
  %91 = load i32, i32* %90, align 8
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %92, i32 0, i32 37
  %94 = load i32, i32* %93, align 8
  %95 = load i32, i32* %45, align 4
  %96 = add i32 %94, %95
  %97 = icmp ugt i32 %91, %96
  br i1 %97, label %98, label %100

; <label>:98:                                     ; preds = %81
  %pgocount2 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 53)
  %99 = add i64 %pgocount2, 1
  store i64 %99, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 53)
  br label %116

; <label>:100:                                    ; preds = %81
  %pgocount3 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 45)
  %101 = add i64 %pgocount3, 1
  store i64 %101, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 45)
  br label %102

; <label>:102:                                    ; preds = %100, %73
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 77
  %105 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %105, i32 0, i32 0
  %107 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %106, align 8
  %108 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %109 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %107 to i64
  call void @__llvm_profile_instrument_target(i64 %109, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_smooth_data to i8*), i32 0)
  %110 = call i32 %107(%struct.jpeg_decompress_struct* %108)
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %112, label %114

; <label>:112:                                    ; preds = %102
  %pgocount4 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 50)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 50)
  store i32 0, i32* %3, align 4
  br label %814

; <label>:114:                                    ; preds = %102
  %pgocount5 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 42)
  %115 = add i64 %pgocount5, 1
  store i64 %115, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 42)
  br label %54

; <label>:116:                                    ; preds = %98, %71
  store i32 0, i32* %10, align 4
  %117 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %118 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %117, i32 0, i32 43
  %119 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %118, align 8
  store %struct.jpeg_component_info* %119, %struct.jpeg_component_info** %20, align 8
  br label %120

; <label>:120:                                    ; preds = %796, %116
  %121 = load i32, i32* %10, align 4
  %122 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %123 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %122, i32 0, i32 8
  %124 = load i32, i32* %123, align 8
  %125 = icmp slt i32 %121, %124
  br i1 %125, label %126, label %801

; <label>:126:                                    ; preds = %120
  %127 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %128 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i32 0, i32 12
  %129 = load i32, i32* %128, align 8
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %133, label %131

; <label>:131:                                    ; preds = %126
  %pgocount6 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 43)
  %132 = add i64 %pgocount6, 1
  store i64 %132, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 43)
  br label %796

; <label>:133:                                    ; preds = %126
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %134, i32 0, i32 37
  %136 = load i32, i32* %135, align 8
  %137 = load i32, i32* %7, align 4
  %138 = icmp ult i32 %136, %137
  br i1 %138, label %139, label %145

; <label>:139:                                    ; preds = %133
  %140 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %141 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %140, i32 0, i32 3
  %142 = load i32, i32* %141, align 4
  store i32 %142, i32* %12, align 4
  %143 = load i32, i32* %12, align 4
  %144 = mul nsw i32 %143, 2
  store i32 %144, i32* %13, align 4
  store i32 0, i32* %23, align 4
  br label %163

; <label>:145:                                    ; preds = %133
  %146 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %147 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %146, i32 0, i32 8
  %148 = load i32, i32* %147, align 8
  %149 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %150 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %149, i32 0, i32 3
  %151 = load i32, i32* %150, align 4
  %152 = urem i32 %148, %151
  store i32 %152, i32* %12, align 4
  %153 = load i32, i32* %12, align 4
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %155, label %160

; <label>:155:                                    ; preds = %145
  %pgocount7 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 49)
  %156 = add i64 %pgocount7, 1
  store i64 %156, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 49)
  %157 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %158 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %157, i32 0, i32 3
  %159 = load i32, i32* %158, align 4
  store i32 %159, i32* %12, align 4
  br label %160

; <label>:160:                                    ; preds = %155, %145
  %pgocount8 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 46)
  %161 = add i64 %pgocount8, 1
  store i64 %161, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 46)
  %162 = load i32, i32* %12, align 4
  store i32 %162, i32* %13, align 4
  store i32 1, i32* %23, align 4
  br label %163

; <label>:163:                                    ; preds = %160, %139
  %164 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %165 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %164, i32 0, i32 37
  %166 = load i32, i32* %165, align 8
  %167 = icmp ugt i32 %166, 0
  br i1 %167, label %168, label %205

; <label>:168:                                    ; preds = %163
  %pgocount9 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 47)
  %169 = add i64 %pgocount9, 1
  store i64 %169, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 47)
  %170 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %171 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %170, i32 0, i32 3
  %172 = load i32, i32* %171, align 4
  %173 = load i32, i32* %13, align 4
  %174 = add nsw i32 %173, %172
  store i32 %174, i32* %13, align 4
  %175 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %176 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %175, i32 0, i32 1
  %177 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %176, align 8
  %178 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %177, i32 0, i32 8
  %179 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %178, align 8
  %180 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %181 = bitcast %struct.jpeg_decompress_struct* %180 to %struct.jpeg_common_struct*
  %182 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %183 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %182, i32 0, i32 5
  %184 = load i32, i32* %10, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %183, i64 0, i64 %185
  %187 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %186, align 8
  %188 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %189 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %188, i32 0, i32 37
  %190 = load i32, i32* %189, align 8
  %191 = sub i32 %190, 1
  %192 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %193 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %192, i32 0, i32 3
  %194 = load i32, i32* %193, align 4
  %195 = mul i32 %191, %194
  %196 = load i32, i32* %13, align 4
  %197 = ptrtoint [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* %179 to i64
  call void @__llvm_profile_instrument_target(i64 %197, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_smooth_data to i8*), i32 1)
  %198 = call [64 x i16]** %179(%struct.jpeg_common_struct* %181, %struct.jvirt_barray_control* %187, i32 %195, i32 %196, i32 0)
  store [64 x i16]** %198, [64 x i16]*** %14, align 8
  %199 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %200 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %199, i32 0, i32 3
  %201 = load i32, i32* %200, align 4
  %202 = load [64 x i16]**, [64 x i16]*** %14, align 8
  %203 = sext i32 %201 to i64
  %204 = getelementptr inbounds [64 x i16]*, [64 x i16]** %202, i64 %203
  store [64 x i16]** %204, [64 x i16]*** %14, align 8
  store i32 0, i32* %22, align 4
  br label %223

; <label>:205:                                    ; preds = %163
  %pgocount10 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 48)
  %206 = add i64 %pgocount10, 1
  store i64 %206, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 48)
  %207 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %208 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %207, i32 0, i32 1
  %209 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %208, align 8
  %210 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %209, i32 0, i32 8
  %211 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %210, align 8
  %212 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %213 = bitcast %struct.jpeg_decompress_struct* %212 to %struct.jpeg_common_struct*
  %214 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %215 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %214, i32 0, i32 5
  %216 = load i32, i32* %10, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %215, i64 0, i64 %217
  %219 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %218, align 8
  %220 = load i32, i32* %13, align 4
  %221 = ptrtoint [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* %211 to i64
  call void @__llvm_profile_instrument_target(i64 %221, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_smooth_data to i8*), i32 2)
  %222 = call [64 x i16]** %211(%struct.jpeg_common_struct* %213, %struct.jvirt_barray_control* %219, i32 0, i32 %220, i32 0)
  store [64 x i16]** %222, [64 x i16]*** %14, align 8
  store i32 1, i32* %22, align 4
  br label %223

; <label>:223:                                    ; preds = %205, %168
  %224 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %225 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %224, i32 0, i32 6
  %226 = load i32*, i32** %225, align 8
  %227 = load i32, i32* %10, align 4
  %228 = mul nsw i32 %227, 6
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds i32, i32* %226, i64 %229
  store i32* %230, i32** %25, align 8
  %231 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %232 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %231, i32 0, i32 19
  %233 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %232, align 8
  store %struct.JQUANT_TBL* %233, %struct.JQUANT_TBL** %26, align 8
  %234 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %26, align 8
  %235 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %234, i32 0, i32 0
  %236 = getelementptr inbounds [64 x i16], [64 x i16]* %235, i64 0, i64 0
  %237 = load i16, i16* %236, align 4
  %238 = zext i16 %237 to i64
  store i64 %238, i64* %27, align 8
  %239 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %26, align 8
  %240 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %239, i32 0, i32 0
  %241 = getelementptr inbounds [64 x i16], [64 x i16]* %240, i64 0, i64 1
  %242 = load i16, i16* %241, align 2
  %243 = zext i16 %242 to i64
  store i64 %243, i64* %28, align 8
  %244 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %26, align 8
  %245 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %244, i32 0, i32 0
  %246 = getelementptr inbounds [64 x i16], [64 x i16]* %245, i64 0, i64 8
  %247 = load i16, i16* %246, align 4
  %248 = zext i16 %247 to i64
  store i64 %248, i64* %30, align 8
  %249 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %26, align 8
  %250 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %249, i32 0, i32 0
  %251 = getelementptr inbounds [64 x i16], [64 x i16]* %250, i64 0, i64 16
  %252 = load i16, i16* %251, align 4
  %253 = zext i16 %252 to i64
  store i64 %253, i64* %32, align 8
  %254 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %26, align 8
  %255 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %254, i32 0, i32 0
  %256 = getelementptr inbounds [64 x i16], [64 x i16]* %255, i64 0, i64 9
  %257 = load i16, i16* %256, align 2
  %258 = zext i16 %257 to i64
  store i64 %258, i64* %31, align 8
  %259 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %26, align 8
  %260 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %259, i32 0, i32 0
  %261 = getelementptr inbounds [64 x i16], [64 x i16]* %260, i64 0, i64 2
  %262 = load i16, i16* %261, align 4
  %263 = zext i16 %262 to i64
  store i64 %263, i64* %29, align 8
  %264 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %265 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %264, i32 0, i32 80
  %266 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %265, align 8
  %267 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %266, i32 0, i32 1
  %268 = load i32, i32* %10, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*], [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*]* %267, i64 0, i64 %269
  %271 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %270, align 8
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* %271, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %21, align 8
  %272 = load i8***, i8**** %5, align 8
  %273 = load i32, i32* %10, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds i8**, i8*** %272, i64 %274
  %276 = load i8**, i8*** %275, align 8
  store i8** %276, i8*** %18, align 8
  store i32 0, i32* %11, align 4
  br label %277

; <label>:277:                                    ; preds = %792, %223
  %278 = load i32, i32* %11, align 4
  %279 = load i32, i32* %12, align 4
  %280 = icmp slt i32 %278, %279
  br i1 %280, label %281, label %795

; <label>:281:                                    ; preds = %277
  %282 = load [64 x i16]**, [64 x i16]*** %14, align 8
  %283 = load i32, i32* %11, align 4
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds [64 x i16]*, [64 x i16]** %282, i64 %284
  %286 = load [64 x i16]*, [64 x i16]** %285, align 8
  store [64 x i16]* %286, [64 x i16]** %15, align 8
  %287 = load i32, i32* %22, align 4
  %288 = icmp ne i32 %287, 0
  br i1 %288, label %289, label %296

; <label>:289:                                    ; preds = %281
  %pgocount11 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 38)
  %290 = add i64 %pgocount11, 1
  store i64 %290, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 38)
  %291 = load i32, i32* %11, align 4
  %292 = icmp eq i32 %291, 0
  br i1 %292, label %293, label %296

; <label>:293:                                    ; preds = %289
  %pgocount12 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 41)
  %294 = add i64 %pgocount12, 1
  store i64 %294, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 41)
  %295 = load [64 x i16]*, [64 x i16]** %15, align 8
  store [64 x i16]* %295, [64 x i16]** %16, align 8
  br label %303

; <label>:296:                                    ; preds = %289, %281
  %297 = load [64 x i16]**, [64 x i16]*** %14, align 8
  %298 = load i32, i32* %11, align 4
  %299 = sub nsw i32 %298, 1
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [64 x i16]*, [64 x i16]** %297, i64 %300
  %302 = load [64 x i16]*, [64 x i16]** %301, align 8
  store [64 x i16]* %302, [64 x i16]** %16, align 8
  br label %303

; <label>:303:                                    ; preds = %296, %293
  %304 = load i32, i32* %23, align 4
  %305 = icmp ne i32 %304, 0
  br i1 %305, label %306, label %315

; <label>:306:                                    ; preds = %303
  %pgocount13 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 39)
  %307 = add i64 %pgocount13, 1
  store i64 %307, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 39)
  %308 = load i32, i32* %11, align 4
  %309 = load i32, i32* %12, align 4
  %310 = sub nsw i32 %309, 1
  %311 = icmp eq i32 %308, %310
  br i1 %311, label %312, label %315

; <label>:312:                                    ; preds = %306
  %pgocount14 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 40)
  %313 = add i64 %pgocount14, 1
  store i64 %313, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 40)
  %314 = load [64 x i16]*, [64 x i16]** %15, align 8
  store [64 x i16]* %314, [64 x i16]** %17, align 8
  br label %323

; <label>:315:                                    ; preds = %306, %303
  %pgocount15 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 37)
  %316 = add i64 %pgocount15, 1
  store i64 %316, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 37)
  %317 = load [64 x i16]**, [64 x i16]*** %14, align 8
  %318 = load i32, i32* %11, align 4
  %319 = add nsw i32 %318, 1
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds [64 x i16]*, [64 x i16]** %317, i64 %320
  %322 = load [64 x i16]*, [64 x i16]** %321, align 8
  store [64 x i16]* %322, [64 x i16]** %17, align 8
  br label %323

; <label>:323:                                    ; preds = %315, %312
  %324 = load [64 x i16]*, [64 x i16]** %16, align 8
  %325 = getelementptr inbounds [64 x i16], [64 x i16]* %324, i64 0
  %326 = getelementptr inbounds [64 x i16], [64 x i16]* %325, i64 0, i64 0
  %327 = load i16, i16* %326, align 2
  %328 = sext i16 %327 to i32
  store i32 %328, i32* %36, align 4
  store i32 %328, i32* %35, align 4
  store i32 %328, i32* %34, align 4
  %329 = load [64 x i16]*, [64 x i16]** %15, align 8
  %330 = getelementptr inbounds [64 x i16], [64 x i16]* %329, i64 0
  %331 = getelementptr inbounds [64 x i16], [64 x i16]* %330, i64 0, i64 0
  %332 = load i16, i16* %331, align 2
  %333 = sext i16 %332 to i32
  store i32 %333, i32* %39, align 4
  store i32 %333, i32* %38, align 4
  store i32 %333, i32* %37, align 4
  %334 = load [64 x i16]*, [64 x i16]** %17, align 8
  %335 = getelementptr inbounds [64 x i16], [64 x i16]* %334, i64 0
  %336 = getelementptr inbounds [64 x i16], [64 x i16]* %335, i64 0, i64 0
  %337 = load i16, i16* %336, align 2
  %338 = sext i16 %337 to i32
  store i32 %338, i32* %42, align 4
  store i32 %338, i32* %41, align 4
  store i32 %338, i32* %40, align 4
  store i32 0, i32* %19, align 4
  %339 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %340 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %339, i32 0, i32 7
  %341 = load i32, i32* %340, align 4
  %342 = sub i32 %341, 1
  store i32 %342, i32* %9, align 4
  store i32 0, i32* %8, align 4
  br label %343

; <label>:343:                                    ; preds = %781, %323
  %344 = load i32, i32* %8, align 4
  %345 = load i32, i32* %9, align 4
  %346 = icmp ule i32 %344, %345
  br i1 %346, label %347, label %785

; <label>:347:                                    ; preds = %343
  %348 = load [64 x i16]*, [64 x i16]** %15, align 8
  %349 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i32 0, i32 0
  %350 = bitcast i16* %349 to [64 x i16]*
  call void @jcopy_block_row([64 x i16]* %348, [64 x i16]* %350, i32 1)
  %351 = load i32, i32* %8, align 4
  %352 = load i32, i32* %9, align 4
  %353 = icmp ult i32 %351, %352
  br i1 %353, label %354, label %371

; <label>:354:                                    ; preds = %347
  %pgocount16 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 6)
  %355 = add i64 %pgocount16, 1
  store i64 %355, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 6)
  %356 = load [64 x i16]*, [64 x i16]** %16, align 8
  %357 = getelementptr inbounds [64 x i16], [64 x i16]* %356, i64 1
  %358 = getelementptr inbounds [64 x i16], [64 x i16]* %357, i64 0, i64 0
  %359 = load i16, i16* %358, align 2
  %360 = sext i16 %359 to i32
  store i32 %360, i32* %36, align 4
  %361 = load [64 x i16]*, [64 x i16]** %15, align 8
  %362 = getelementptr inbounds [64 x i16], [64 x i16]* %361, i64 1
  %363 = getelementptr inbounds [64 x i16], [64 x i16]* %362, i64 0, i64 0
  %364 = load i16, i16* %363, align 2
  %365 = sext i16 %364 to i32
  store i32 %365, i32* %39, align 4
  %366 = load [64 x i16]*, [64 x i16]** %17, align 8
  %367 = getelementptr inbounds [64 x i16], [64 x i16]* %366, i64 1
  %368 = getelementptr inbounds [64 x i16], [64 x i16]* %367, i64 0, i64 0
  %369 = load i16, i16* %368, align 2
  %370 = sext i16 %369 to i32
  store i32 %370, i32* %42, align 4
  br label %371

; <label>:371:                                    ; preds = %354, %347
  %372 = load i32*, i32** %25, align 8
  %373 = getelementptr inbounds i32, i32* %372, i64 1
  %374 = load i32, i32* %373, align 4
  store i32 %374, i32* %43, align 4
  %375 = icmp ne i32 %374, 0
  br i1 %375, label %376, label %446

; <label>:376:                                    ; preds = %371
  %pgocount17 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 1)
  %377 = add i64 %pgocount17, 1
  store i64 %377, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 1)
  %378 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 1
  %379 = load i16, i16* %378, align 2
  %380 = sext i16 %379 to i32
  %381 = icmp eq i32 %380, 0
  br i1 %381, label %382, label %446

; <label>:382:                                    ; preds = %376
  %383 = load i64, i64* %27, align 8
  %384 = mul nsw i64 36, %383
  %385 = load i32, i32* %37, align 4
  %386 = load i32, i32* %39, align 4
  %387 = sub nsw i32 %385, %386
  %388 = sext i32 %387 to i64
  %389 = mul nsw i64 %384, %388
  store i64 %389, i64* %33, align 8
  %390 = load i64, i64* %33, align 8
  %391 = icmp sge i64 %390, 0
  br i1 %391, label %392, label %416

; <label>:392:                                    ; preds = %382
  %393 = load i64, i64* %28, align 8
  %394 = shl i64 %393, 7
  %395 = load i64, i64* %33, align 8
  %396 = add nsw i64 %394, %395
  %397 = load i64, i64* %28, align 8
  %398 = shl i64 %397, 8
  %399 = sdiv i64 %396, %398
  %400 = trunc i64 %399 to i32
  store i32 %400, i32* %44, align 4
  %401 = load i32, i32* %43, align 4
  %402 = icmp sgt i32 %401, 0
  br i1 %402, label %403, label %414

; <label>:403:                                    ; preds = %392
  %pgocount18 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 17)
  %404 = add i64 %pgocount18, 1
  store i64 %404, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 17)
  %405 = load i32, i32* %44, align 4
  %406 = load i32, i32* %43, align 4
  %407 = shl i32 1, %406
  %408 = icmp sge i32 %405, %407
  br i1 %408, label %409, label %414

; <label>:409:                                    ; preds = %403
  %pgocount19 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 27)
  %410 = add i64 %pgocount19, 1
  store i64 %410, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 27)
  %411 = load i32, i32* %43, align 4
  %412 = shl i32 1, %411
  %413 = sub nsw i32 %412, 1
  store i32 %413, i32* %44, align 4
  br label %414

; <label>:414:                                    ; preds = %409, %403, %392
  %pgocount20 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 7)
  %415 = add i64 %pgocount20, 1
  store i64 %415, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 7)
  br label %442

; <label>:416:                                    ; preds = %382
  %417 = load i64, i64* %28, align 8
  %418 = shl i64 %417, 7
  %419 = load i64, i64* %33, align 8
  %420 = sub nsw i64 %418, %419
  %421 = load i64, i64* %28, align 8
  %422 = shl i64 %421, 8
  %423 = sdiv i64 %420, %422
  %424 = trunc i64 %423 to i32
  store i32 %424, i32* %44, align 4
  %425 = load i32, i32* %43, align 4
  %426 = icmp sgt i32 %425, 0
  br i1 %426, label %427, label %438

; <label>:427:                                    ; preds = %416
  %pgocount21 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 18)
  %428 = add i64 %pgocount21, 1
  store i64 %428, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 18)
  %429 = load i32, i32* %44, align 4
  %430 = load i32, i32* %43, align 4
  %431 = shl i32 1, %430
  %432 = icmp sge i32 %429, %431
  br i1 %432, label %433, label %438

; <label>:433:                                    ; preds = %427
  %pgocount22 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 28)
  %434 = add i64 %pgocount22, 1
  store i64 %434, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 28)
  %435 = load i32, i32* %43, align 4
  %436 = shl i32 1, %435
  %437 = sub nsw i32 %436, 1
  store i32 %437, i32* %44, align 4
  br label %438

; <label>:438:                                    ; preds = %433, %427, %416
  %pgocount23 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 8)
  %439 = add i64 %pgocount23, 1
  store i64 %439, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 8)
  %440 = load i32, i32* %44, align 4
  %441 = sub nsw i32 0, %440
  store i32 %441, i32* %44, align 4
  br label %442

; <label>:442:                                    ; preds = %438, %414
  %443 = load i32, i32* %44, align 4
  %444 = trunc i32 %443 to i16
  %445 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 1
  store i16 %444, i16* %445, align 2
  br label %446

; <label>:446:                                    ; preds = %442, %376, %371
  %447 = load i32*, i32** %25, align 8
  %448 = getelementptr inbounds i32, i32* %447, i64 2
  %449 = load i32, i32* %448, align 4
  store i32 %449, i32* %43, align 4
  %450 = icmp ne i32 %449, 0
  br i1 %450, label %451, label %521

; <label>:451:                                    ; preds = %446
  %pgocount24 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 2)
  %452 = add i64 %pgocount24, 1
  store i64 %452, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 2)
  %453 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 8
  %454 = load i16, i16* %453, align 16
  %455 = sext i16 %454 to i32
  %456 = icmp eq i32 %455, 0
  br i1 %456, label %457, label %521

; <label>:457:                                    ; preds = %451
  %458 = load i64, i64* %27, align 8
  %459 = mul nsw i64 36, %458
  %460 = load i32, i32* %35, align 4
  %461 = load i32, i32* %41, align 4
  %462 = sub nsw i32 %460, %461
  %463 = sext i32 %462 to i64
  %464 = mul nsw i64 %459, %463
  store i64 %464, i64* %33, align 8
  %465 = load i64, i64* %33, align 8
  %466 = icmp sge i64 %465, 0
  br i1 %466, label %467, label %491

; <label>:467:                                    ; preds = %457
  %468 = load i64, i64* %30, align 8
  %469 = shl i64 %468, 7
  %470 = load i64, i64* %33, align 8
  %471 = add nsw i64 %469, %470
  %472 = load i64, i64* %30, align 8
  %473 = shl i64 %472, 8
  %474 = sdiv i64 %471, %473
  %475 = trunc i64 %474 to i32
  store i32 %475, i32* %44, align 4
  %476 = load i32, i32* %43, align 4
  %477 = icmp sgt i32 %476, 0
  br i1 %477, label %478, label %489

; <label>:478:                                    ; preds = %467
  %pgocount25 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 19)
  %479 = add i64 %pgocount25, 1
  store i64 %479, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 19)
  %480 = load i32, i32* %44, align 4
  %481 = load i32, i32* %43, align 4
  %482 = shl i32 1, %481
  %483 = icmp sge i32 %480, %482
  br i1 %483, label %484, label %489

; <label>:484:                                    ; preds = %478
  %pgocount26 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 29)
  %485 = add i64 %pgocount26, 1
  store i64 %485, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 29)
  %486 = load i32, i32* %43, align 4
  %487 = shl i32 1, %486
  %488 = sub nsw i32 %487, 1
  store i32 %488, i32* %44, align 4
  br label %489

; <label>:489:                                    ; preds = %484, %478, %467
  %pgocount27 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 9)
  %490 = add i64 %pgocount27, 1
  store i64 %490, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 9)
  br label %517

; <label>:491:                                    ; preds = %457
  %492 = load i64, i64* %30, align 8
  %493 = shl i64 %492, 7
  %494 = load i64, i64* %33, align 8
  %495 = sub nsw i64 %493, %494
  %496 = load i64, i64* %30, align 8
  %497 = shl i64 %496, 8
  %498 = sdiv i64 %495, %497
  %499 = trunc i64 %498 to i32
  store i32 %499, i32* %44, align 4
  %500 = load i32, i32* %43, align 4
  %501 = icmp sgt i32 %500, 0
  br i1 %501, label %502, label %513

; <label>:502:                                    ; preds = %491
  %pgocount28 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 20)
  %503 = add i64 %pgocount28, 1
  store i64 %503, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 20)
  %504 = load i32, i32* %44, align 4
  %505 = load i32, i32* %43, align 4
  %506 = shl i32 1, %505
  %507 = icmp sge i32 %504, %506
  br i1 %507, label %508, label %513

; <label>:508:                                    ; preds = %502
  %pgocount29 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 30)
  %509 = add i64 %pgocount29, 1
  store i64 %509, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 30)
  %510 = load i32, i32* %43, align 4
  %511 = shl i32 1, %510
  %512 = sub nsw i32 %511, 1
  store i32 %512, i32* %44, align 4
  br label %513

; <label>:513:                                    ; preds = %508, %502, %491
  %pgocount30 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 10)
  %514 = add i64 %pgocount30, 1
  store i64 %514, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 10)
  %515 = load i32, i32* %44, align 4
  %516 = sub nsw i32 0, %515
  store i32 %516, i32* %44, align 4
  br label %517

; <label>:517:                                    ; preds = %513, %489
  %518 = load i32, i32* %44, align 4
  %519 = trunc i32 %518 to i16
  %520 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 8
  store i16 %519, i16* %520, align 16
  br label %521

; <label>:521:                                    ; preds = %517, %451, %446
  %522 = load i32*, i32** %25, align 8
  %523 = getelementptr inbounds i32, i32* %522, i64 3
  %524 = load i32, i32* %523, align 4
  store i32 %524, i32* %43, align 4
  %525 = icmp ne i32 %524, 0
  br i1 %525, label %526, label %599

; <label>:526:                                    ; preds = %521
  %pgocount31 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 3)
  %527 = add i64 %pgocount31, 1
  store i64 %527, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 3)
  %528 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 16
  %529 = load i16, i16* %528, align 16
  %530 = sext i16 %529 to i32
  %531 = icmp eq i32 %530, 0
  br i1 %531, label %532, label %599

; <label>:532:                                    ; preds = %526
  %533 = load i64, i64* %27, align 8
  %534 = mul nsw i64 9, %533
  %535 = load i32, i32* %35, align 4
  %536 = load i32, i32* %41, align 4
  %537 = add nsw i32 %535, %536
  %538 = load i32, i32* %38, align 4
  %539 = mul nsw i32 2, %538
  %540 = sub nsw i32 %537, %539
  %541 = sext i32 %540 to i64
  %542 = mul nsw i64 %534, %541
  store i64 %542, i64* %33, align 8
  %543 = load i64, i64* %33, align 8
  %544 = icmp sge i64 %543, 0
  br i1 %544, label %545, label %569

; <label>:545:                                    ; preds = %532
  %546 = load i64, i64* %32, align 8
  %547 = shl i64 %546, 7
  %548 = load i64, i64* %33, align 8
  %549 = add nsw i64 %547, %548
  %550 = load i64, i64* %32, align 8
  %551 = shl i64 %550, 8
  %552 = sdiv i64 %549, %551
  %553 = trunc i64 %552 to i32
  store i32 %553, i32* %44, align 4
  %554 = load i32, i32* %43, align 4
  %555 = icmp sgt i32 %554, 0
  br i1 %555, label %556, label %567

; <label>:556:                                    ; preds = %545
  %pgocount32 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 21)
  %557 = add i64 %pgocount32, 1
  store i64 %557, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 21)
  %558 = load i32, i32* %44, align 4
  %559 = load i32, i32* %43, align 4
  %560 = shl i32 1, %559
  %561 = icmp sge i32 %558, %560
  br i1 %561, label %562, label %567

; <label>:562:                                    ; preds = %556
  %pgocount33 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 31)
  %563 = add i64 %pgocount33, 1
  store i64 %563, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 31)
  %564 = load i32, i32* %43, align 4
  %565 = shl i32 1, %564
  %566 = sub nsw i32 %565, 1
  store i32 %566, i32* %44, align 4
  br label %567

; <label>:567:                                    ; preds = %562, %556, %545
  %pgocount34 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 11)
  %568 = add i64 %pgocount34, 1
  store i64 %568, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 11)
  br label %595

; <label>:569:                                    ; preds = %532
  %570 = load i64, i64* %32, align 8
  %571 = shl i64 %570, 7
  %572 = load i64, i64* %33, align 8
  %573 = sub nsw i64 %571, %572
  %574 = load i64, i64* %32, align 8
  %575 = shl i64 %574, 8
  %576 = sdiv i64 %573, %575
  %577 = trunc i64 %576 to i32
  store i32 %577, i32* %44, align 4
  %578 = load i32, i32* %43, align 4
  %579 = icmp sgt i32 %578, 0
  br i1 %579, label %580, label %591

; <label>:580:                                    ; preds = %569
  %pgocount35 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 22)
  %581 = add i64 %pgocount35, 1
  store i64 %581, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 22)
  %582 = load i32, i32* %44, align 4
  %583 = load i32, i32* %43, align 4
  %584 = shl i32 1, %583
  %585 = icmp sge i32 %582, %584
  br i1 %585, label %586, label %591

; <label>:586:                                    ; preds = %580
  %pgocount36 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 32)
  %587 = add i64 %pgocount36, 1
  store i64 %587, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 32)
  %588 = load i32, i32* %43, align 4
  %589 = shl i32 1, %588
  %590 = sub nsw i32 %589, 1
  store i32 %590, i32* %44, align 4
  br label %591

; <label>:591:                                    ; preds = %586, %580, %569
  %pgocount37 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 12)
  %592 = add i64 %pgocount37, 1
  store i64 %592, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 12)
  %593 = load i32, i32* %44, align 4
  %594 = sub nsw i32 0, %593
  store i32 %594, i32* %44, align 4
  br label %595

; <label>:595:                                    ; preds = %591, %567
  %596 = load i32, i32* %44, align 4
  %597 = trunc i32 %596 to i16
  %598 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 16
  store i16 %597, i16* %598, align 16
  br label %599

; <label>:599:                                    ; preds = %595, %526, %521
  %600 = load i32*, i32** %25, align 8
  %601 = getelementptr inbounds i32, i32* %600, i64 4
  %602 = load i32, i32* %601, align 4
  store i32 %602, i32* %43, align 4
  %603 = icmp ne i32 %602, 0
  br i1 %603, label %604, label %678

; <label>:604:                                    ; preds = %599
  %pgocount38 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 4)
  %605 = add i64 %pgocount38, 1
  store i64 %605, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 4)
  %606 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 9
  %607 = load i16, i16* %606, align 2
  %608 = sext i16 %607 to i32
  %609 = icmp eq i32 %608, 0
  br i1 %609, label %610, label %678

; <label>:610:                                    ; preds = %604
  %611 = load i64, i64* %27, align 8
  %612 = mul nsw i64 5, %611
  %613 = load i32, i32* %34, align 4
  %614 = load i32, i32* %36, align 4
  %615 = sub nsw i32 %613, %614
  %616 = load i32, i32* %40, align 4
  %617 = sub nsw i32 %615, %616
  %618 = load i32, i32* %42, align 4
  %619 = add nsw i32 %617, %618
  %620 = sext i32 %619 to i64
  %621 = mul nsw i64 %612, %620
  store i64 %621, i64* %33, align 8
  %622 = load i64, i64* %33, align 8
  %623 = icmp sge i64 %622, 0
  br i1 %623, label %624, label %648

; <label>:624:                                    ; preds = %610
  %625 = load i64, i64* %31, align 8
  %626 = shl i64 %625, 7
  %627 = load i64, i64* %33, align 8
  %628 = add nsw i64 %626, %627
  %629 = load i64, i64* %31, align 8
  %630 = shl i64 %629, 8
  %631 = sdiv i64 %628, %630
  %632 = trunc i64 %631 to i32
  store i32 %632, i32* %44, align 4
  %633 = load i32, i32* %43, align 4
  %634 = icmp sgt i32 %633, 0
  br i1 %634, label %635, label %646

; <label>:635:                                    ; preds = %624
  %pgocount39 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 23)
  %636 = add i64 %pgocount39, 1
  store i64 %636, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 23)
  %637 = load i32, i32* %44, align 4
  %638 = load i32, i32* %43, align 4
  %639 = shl i32 1, %638
  %640 = icmp sge i32 %637, %639
  br i1 %640, label %641, label %646

; <label>:641:                                    ; preds = %635
  %pgocount40 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 33)
  %642 = add i64 %pgocount40, 1
  store i64 %642, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 33)
  %643 = load i32, i32* %43, align 4
  %644 = shl i32 1, %643
  %645 = sub nsw i32 %644, 1
  store i32 %645, i32* %44, align 4
  br label %646

; <label>:646:                                    ; preds = %641, %635, %624
  %pgocount41 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 13)
  %647 = add i64 %pgocount41, 1
  store i64 %647, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 13)
  br label %674

; <label>:648:                                    ; preds = %610
  %649 = load i64, i64* %31, align 8
  %650 = shl i64 %649, 7
  %651 = load i64, i64* %33, align 8
  %652 = sub nsw i64 %650, %651
  %653 = load i64, i64* %31, align 8
  %654 = shl i64 %653, 8
  %655 = sdiv i64 %652, %654
  %656 = trunc i64 %655 to i32
  store i32 %656, i32* %44, align 4
  %657 = load i32, i32* %43, align 4
  %658 = icmp sgt i32 %657, 0
  br i1 %658, label %659, label %670

; <label>:659:                                    ; preds = %648
  %pgocount42 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 24)
  %660 = add i64 %pgocount42, 1
  store i64 %660, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 24)
  %661 = load i32, i32* %44, align 4
  %662 = load i32, i32* %43, align 4
  %663 = shl i32 1, %662
  %664 = icmp sge i32 %661, %663
  br i1 %664, label %665, label %670

; <label>:665:                                    ; preds = %659
  %pgocount43 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 34)
  %666 = add i64 %pgocount43, 1
  store i64 %666, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 34)
  %667 = load i32, i32* %43, align 4
  %668 = shl i32 1, %667
  %669 = sub nsw i32 %668, 1
  store i32 %669, i32* %44, align 4
  br label %670

; <label>:670:                                    ; preds = %665, %659, %648
  %pgocount44 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 14)
  %671 = add i64 %pgocount44, 1
  store i64 %671, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 14)
  %672 = load i32, i32* %44, align 4
  %673 = sub nsw i32 0, %672
  store i32 %673, i32* %44, align 4
  br label %674

; <label>:674:                                    ; preds = %670, %646
  %675 = load i32, i32* %44, align 4
  %676 = trunc i32 %675 to i16
  %677 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 9
  store i16 %676, i16* %677, align 2
  br label %678

; <label>:678:                                    ; preds = %674, %604, %599
  %679 = load i32*, i32** %25, align 8
  %680 = getelementptr inbounds i32, i32* %679, i64 5
  %681 = load i32, i32* %680, align 4
  store i32 %681, i32* %43, align 4
  %682 = icmp ne i32 %681, 0
  br i1 %682, label %683, label %756

; <label>:683:                                    ; preds = %678
  %pgocount45 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 5)
  %684 = add i64 %pgocount45, 1
  store i64 %684, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 5)
  %685 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 2
  %686 = load i16, i16* %685, align 4
  %687 = sext i16 %686 to i32
  %688 = icmp eq i32 %687, 0
  br i1 %688, label %689, label %756

; <label>:689:                                    ; preds = %683
  %690 = load i64, i64* %27, align 8
  %691 = mul nsw i64 9, %690
  %692 = load i32, i32* %37, align 4
  %693 = load i32, i32* %39, align 4
  %694 = add nsw i32 %692, %693
  %695 = load i32, i32* %38, align 4
  %696 = mul nsw i32 2, %695
  %697 = sub nsw i32 %694, %696
  %698 = sext i32 %697 to i64
  %699 = mul nsw i64 %691, %698
  store i64 %699, i64* %33, align 8
  %700 = load i64, i64* %33, align 8
  %701 = icmp sge i64 %700, 0
  br i1 %701, label %702, label %726

; <label>:702:                                    ; preds = %689
  %703 = load i64, i64* %29, align 8
  %704 = shl i64 %703, 7
  %705 = load i64, i64* %33, align 8
  %706 = add nsw i64 %704, %705
  %707 = load i64, i64* %29, align 8
  %708 = shl i64 %707, 8
  %709 = sdiv i64 %706, %708
  %710 = trunc i64 %709 to i32
  store i32 %710, i32* %44, align 4
  %711 = load i32, i32* %43, align 4
  %712 = icmp sgt i32 %711, 0
  br i1 %712, label %713, label %724

; <label>:713:                                    ; preds = %702
  %pgocount46 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 25)
  %714 = add i64 %pgocount46, 1
  store i64 %714, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 25)
  %715 = load i32, i32* %44, align 4
  %716 = load i32, i32* %43, align 4
  %717 = shl i32 1, %716
  %718 = icmp sge i32 %715, %717
  br i1 %718, label %719, label %724

; <label>:719:                                    ; preds = %713
  %pgocount47 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 35)
  %720 = add i64 %pgocount47, 1
  store i64 %720, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 35)
  %721 = load i32, i32* %43, align 4
  %722 = shl i32 1, %721
  %723 = sub nsw i32 %722, 1
  store i32 %723, i32* %44, align 4
  br label %724

; <label>:724:                                    ; preds = %719, %713, %702
  %pgocount48 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 15)
  %725 = add i64 %pgocount48, 1
  store i64 %725, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 15)
  br label %752

; <label>:726:                                    ; preds = %689
  %727 = load i64, i64* %29, align 8
  %728 = shl i64 %727, 7
  %729 = load i64, i64* %33, align 8
  %730 = sub nsw i64 %728, %729
  %731 = load i64, i64* %29, align 8
  %732 = shl i64 %731, 8
  %733 = sdiv i64 %730, %732
  %734 = trunc i64 %733 to i32
  store i32 %734, i32* %44, align 4
  %735 = load i32, i32* %43, align 4
  %736 = icmp sgt i32 %735, 0
  br i1 %736, label %737, label %748

; <label>:737:                                    ; preds = %726
  %pgocount49 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 26)
  %738 = add i64 %pgocount49, 1
  store i64 %738, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 26)
  %739 = load i32, i32* %44, align 4
  %740 = load i32, i32* %43, align 4
  %741 = shl i32 1, %740
  %742 = icmp sge i32 %739, %741
  br i1 %742, label %743, label %748

; <label>:743:                                    ; preds = %737
  %pgocount50 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 36)
  %744 = add i64 %pgocount50, 1
  store i64 %744, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 36)
  %745 = load i32, i32* %43, align 4
  %746 = shl i32 1, %745
  %747 = sub nsw i32 %746, 1
  store i32 %747, i32* %44, align 4
  br label %748

; <label>:748:                                    ; preds = %743, %737, %726
  %pgocount51 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 16)
  %749 = add i64 %pgocount51, 1
  store i64 %749, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 16)
  %750 = load i32, i32* %44, align 4
  %751 = sub nsw i32 0, %750
  store i32 %751, i32* %44, align 4
  br label %752

; <label>:752:                                    ; preds = %748, %724
  %753 = load i32, i32* %44, align 4
  %754 = trunc i32 %753 to i16
  %755 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i64 0, i64 2
  store i16 %754, i16* %755, align 4
  br label %756

; <label>:756:                                    ; preds = %752, %683, %678
  %757 = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %21, align 8
  %758 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %759 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %760 = getelementptr inbounds [64 x i16], [64 x i16]* %24, i32 0, i32 0
  %761 = load i8**, i8*** %18, align 8
  %762 = load i32, i32* %19, align 4
  %763 = ptrtoint void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* %757 to i64
  call void @__llvm_profile_instrument_target(i64 %763, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decompress_smooth_data to i8*), i32 3)
  call void %757(%struct.jpeg_decompress_struct* %758, %struct.jpeg_component_info* %759, i16* %760, i8** %761, i32 %762)
  %764 = load i32, i32* %35, align 4
  store i32 %764, i32* %34, align 4
  %765 = load i32, i32* %36, align 4
  store i32 %765, i32* %35, align 4
  %766 = load i32, i32* %38, align 4
  store i32 %766, i32* %37, align 4
  %767 = load i32, i32* %39, align 4
  store i32 %767, i32* %38, align 4
  %768 = load i32, i32* %41, align 4
  store i32 %768, i32* %40, align 4
  %769 = load i32, i32* %42, align 4
  store i32 %769, i32* %41, align 4
  %770 = load [64 x i16]*, [64 x i16]** %15, align 8
  %771 = getelementptr inbounds [64 x i16], [64 x i16]* %770, i32 1
  store [64 x i16]* %771, [64 x i16]** %15, align 8
  %772 = load [64 x i16]*, [64 x i16]** %16, align 8
  %773 = getelementptr inbounds [64 x i16], [64 x i16]* %772, i32 1
  store [64 x i16]* %773, [64 x i16]** %16, align 8
  %774 = load [64 x i16]*, [64 x i16]** %17, align 8
  %775 = getelementptr inbounds [64 x i16], [64 x i16]* %774, i32 1
  store [64 x i16]* %775, [64 x i16]** %17, align 8
  %776 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %777 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %776, i32 0, i32 9
  %778 = load i32, i32* %777, align 4
  %779 = load i32, i32* %19, align 4
  %780 = add i32 %779, %778
  store i32 %780, i32* %19, align 4
  br label %781

; <label>:781:                                    ; preds = %756
  %pgocount52 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 0)
  %782 = add i64 %pgocount52, 1
  store i64 %782, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 0)
  %783 = load i32, i32* %8, align 4
  %784 = add i32 %783, 1
  store i32 %784, i32* %8, align 4
  br label %343

; <label>:785:                                    ; preds = %343
  %786 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %787 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %786, i32 0, i32 9
  %788 = load i32, i32* %787, align 4
  %789 = load i8**, i8*** %18, align 8
  %790 = sext i32 %788 to i64
  %791 = getelementptr inbounds i8*, i8** %789, i64 %790
  store i8** %791, i8*** %18, align 8
  br label %792

; <label>:792:                                    ; preds = %785
  %793 = load i32, i32* %11, align 4
  %794 = add nsw i32 %793, 1
  store i32 %794, i32* %11, align 4
  br label %277

; <label>:795:                                    ; preds = %277
  br label %796

; <label>:796:                                    ; preds = %795, %131
  %797 = load i32, i32* %10, align 4
  %798 = add nsw i32 %797, 1
  store i32 %798, i32* %10, align 4
  %799 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %800 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %799, i32 1
  store %struct.jpeg_component_info* %800, %struct.jpeg_component_info** %20, align 8
  br label %120

; <label>:801:                                    ; preds = %120
  %802 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %803 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %802, i32 0, i32 37
  %804 = load i32, i32* %803, align 8
  %805 = add i32 %804, 1
  store i32 %805, i32* %803, align 8
  %806 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %807 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %806, i32 0, i32 60
  %808 = load i32, i32* %807, align 8
  %809 = icmp ult i32 %805, %808
  br i1 %809, label %810, label %812

; <label>:810:                                    ; preds = %801
  %pgocount53 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 51)
  %811 = add i64 %pgocount53, 1
  store i64 %811, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 51)
  store i32 3, i32* %3, align 4
  br label %814

; <label>:812:                                    ; preds = %801
  %pgocount54 = load i64, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 52)
  %813 = add i64 %pgocount54, 1
  store i64 %813, i64* getelementptr inbounds ([55 x i64], [55 x i64]* @__profc_tmp1.ll_decompress_smooth_data, i64 0, i64 52)
  store i32 4, i32* %3, align 4
  br label %814

; <label>:814:                                    ; preds = %812, %810, %112
  %815 = load i32, i32* %3, align 4
  ret i32 %815
}

declare void @jcopy_block_row([64 x i16]*, [64 x i16]*, i32) #1

declare void @jzero_far(i8*, i64) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
