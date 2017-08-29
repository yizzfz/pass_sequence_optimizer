; ModuleID = 'tmp1.ll'
source_filename = "jdphuff.c"
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
%struct.phuff_entropy_decoder = type { %struct.jpeg_entropy_decoder, %struct.bitread_perm_state, %struct.savable_state, i32, [4 x %struct.d_derived_tbl*], %struct.d_derived_tbl* }
%struct.bitread_perm_state = type { i64, i32, i32 }
%struct.savable_state = type { i32, [4 x i32] }
%struct.d_derived_tbl = type { [17 x i64], [18 x i64], [17 x i32], %struct.JHUFF_TBL*, [256 x i32], [256 x i8] }
%struct.bitread_working_state = type { i8*, i64, i32, i64, i32, %struct.jpeg_decompress_struct*, i32* }

$__llvm_profile_raw_version = comdat any

@extend_test = internal constant [16 x i32] [i32 0, i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384], align 16
@extend_offset = internal constant [16 x i32] [i32 0, i32 -1, i32 -3, i32 -7, i32 -15, i32 -31, i32 -63, i32 -127, i32 -255, i32 -511, i32 -1023, i32 -2047, i32 -4095, i32 -8191, i32 -16383, i32 -32767], align 16
@jpeg_natural_order = external constant [0 x i32], align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_phuff_decoder = private constant [19 x i8] c"jinit_phuff_decoder"
@__profn_tmp1.ll_start_pass_phuff_decoder = private constant [32 x i8] c"tmp1.ll:start_pass_phuff_decoder"
@__profn_tmp1.ll_decode_mcu_DC_first = private constant [27 x i8] c"tmp1.ll:decode_mcu_DC_first"
@__profn_tmp1.ll_decode_mcu_AC_first = private constant [27 x i8] c"tmp1.ll:decode_mcu_AC_first"
@__profn_tmp1.ll_decode_mcu_DC_refine = private constant [28 x i8] c"tmp1.ll:decode_mcu_DC_refine"
@__profn_tmp1.ll_decode_mcu_AC_refine = private constant [28 x i8] c"tmp1.ll:decode_mcu_AC_refine"
@__profn_tmp1.ll_process_restart = private constant [23 x i8] c"tmp1.ll:process_restart"
@__profc_jinit_phuff_decoder = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_phuff_decoder = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_phuff_decoder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3107163692801937303, i64 563023698078601, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_phuff_decoder to i8*), i8* bitcast ([2 x i64]* @__profvp_jinit_phuff_decoder to i8*), i32 4, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_phuff_decoder = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_phuff_decoder = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_phuff_decoder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1611258130234261665, i64 1407760256831928, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_pass_phuff_decoder to i8*), i8* bitcast ([5 x i64]* @__profvp_tmp1.ll_start_pass_phuff_decoder to i8*), i32 28, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_mcu_DC_first = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_mcu_DC_first = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -774864665184064541, i64 205266592573, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_DC_first to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_mcu_AC_first = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_mcu_AC_first = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3082066983968829742, i64 282548598066, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_AC_first to i8*), i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_mcu_DC_refine = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_mcu_DC_refine = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4106925862720152879, i64 112433657820, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_DC_refine to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_mcu_AC_refine = private global [38 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_decode_mcu_AC_refine = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_decode_mcu_AC_refine = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5636224317085446321, i64 282025583550719, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_AC_refine to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_decode_mcu_AC_refine to i8*), i32 38, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process_restart = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process_restart = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process_restart = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7400019580802070602, i64 281526439145375, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_process_restart, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_process_restart to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [18 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [193 x i8] c"\BE\01\00jinit_phuff_decoder\01tmp1.ll:start_pass_phuff_decoder\01tmp1.ll:decode_mcu_DC_first\01tmp1.ll:decode_mcu_AC_first\01tmp1.ll:decode_mcu_DC_refine\01tmp1.ll:decode_mcu_AC_refine\01tmp1.ll:process_restart", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_phuff_decoder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff_decoder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_mcu_DC_first to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_mcu_AC_first to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_mcu_DC_refine to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_mcu_AC_refine to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_restart to i8*), i8* bitcast ([18 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([193 x i8], [193 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.phuff_entropy_decoder*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %7 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %7, i32 0, i32 1
  %9 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %9, i32 0, i32 0
  %11 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %10, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = bitcast %struct.jpeg_decompress_struct* %12 to %struct.jpeg_common_struct*
  %14 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %11 to i64
  call void @__llvm_profile_instrument_target(i64 %14, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_phuff_decoder to i8*), i32 0)
  %15 = call i8* %11(%struct.jpeg_common_struct* %13, i32 1, i64 96)
  %16 = bitcast i8* %15 to %struct.phuff_entropy_decoder*
  store %struct.phuff_entropy_decoder* %16, %struct.phuff_entropy_decoder** %3, align 8
  %17 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %18 = bitcast %struct.phuff_entropy_decoder* %17 to %struct.jpeg_entropy_decoder*
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 79
  store %struct.jpeg_entropy_decoder* %18, %struct.jpeg_entropy_decoder** %20, align 8
  %21 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %22 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %22, i32 0, i32 0
  %24 = bitcast {}** %23 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass_phuff_decoder, void (%struct.jpeg_decompress_struct*)** %24, align 8
  store i32 0, i32* %6, align 4
  br label %25

; <label>:25:                                     ; preds = %34, %1
  %26 = load i32, i32* %6, align 4
  %27 = icmp slt i32 %26, 4
  br i1 %27, label %28, label %38

; <label>:28:                                     ; preds = %25
  %29 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %30 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %29, i32 0, i32 4
  %31 = load i32, i32* %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %30, i64 0, i64 %32
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %33, align 8
  br label %34

; <label>:34:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i64 0, i64 1)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i64 0, i64 1)
  %36 = load i32, i32* %6, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %6, align 4
  br label %25

; <label>:38:                                     ; preds = %25
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 1
  %41 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %41, i32 0, i32 0
  %43 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %42, align 8
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %45 = bitcast %struct.jpeg_decompress_struct* %44 to %struct.jpeg_common_struct*
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 8
  %48 = load i32, i32* %47, align 8
  %49 = mul nsw i32 %48, 64
  %50 = sext i32 %49 to i64
  %51 = mul i64 %50, 4
  %52 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %43 to i64
  call void @__llvm_profile_instrument_target(i64 %52, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_phuff_decoder to i8*), i32 1)
  %53 = call i8* %43(%struct.jpeg_common_struct* %45, i32 1, i64 %51)
  %54 = bitcast i8* %53 to [64 x i32]*
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 38
  store [64 x i32]* %54, [64 x i32]** %56, align 8
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 38
  %59 = load [64 x i32]*, [64 x i32]** %58, align 8
  %60 = getelementptr inbounds [64 x i32], [64 x i32]* %59, i64 0
  %61 = getelementptr inbounds [64 x i32], [64 x i32]* %60, i64 0, i64 0
  store i32* %61, i32** %4, align 8
  store i32 0, i32* %5, align 4
  br label %62

; <label>:62:                                     ; preds = %80, %38
  %63 = load i32, i32* %5, align 4
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %64, i32 0, i32 8
  %66 = load i32, i32* %65, align 8
  %67 = icmp slt i32 %63, %66
  br i1 %67, label %68, label %84

; <label>:68:                                     ; preds = %62
  store i32 0, i32* %6, align 4
  br label %69

; <label>:69:                                     ; preds = %75, %68
  %70 = load i32, i32* %6, align 4
  %71 = icmp slt i32 %70, 64
  br i1 %71, label %72, label %79

; <label>:72:                                     ; preds = %69
  %73 = load i32*, i32** %4, align 8
  %74 = getelementptr inbounds i32, i32* %73, i32 1
  store i32* %74, i32** %4, align 8
  store i32 -1, i32* %73, align 4
  br label %75

; <label>:75:                                     ; preds = %72
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i64 0, i64 0)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i64 0, i64 0)
  %77 = load i32, i32* %6, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %6, align 4
  br label %69

; <label>:79:                                     ; preds = %69
  br label %80

; <label>:80:                                     ; preds = %79
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i64 0, i64 2)
  %81 = add i64 %pgocount2, 1
  store i64 %81, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i64 0, i64 2)
  %82 = load i32, i32* %5, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %5, align 4
  br label %62

; <label>:84:                                     ; preds = %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i64 0, i64 3)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_phuff_decoder, i64 0, i64 3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_phuff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.phuff_entropy_decoder*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32*, align 8
  %10 = alloca %struct.jpeg_component_info*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %13, i32 0, i32 79
  %15 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %14, align 8
  %16 = bitcast %struct.jpeg_entropy_decoder* %15 to %struct.phuff_entropy_decoder*
  store %struct.phuff_entropy_decoder* %16, %struct.phuff_entropy_decoder** %3, align 8
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 68
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %19, 0
  %21 = zext i1 %20 to i32
  store i32 %21, i32* %4, align 4
  store i32 0, i32* %5, align 4
  %22 = load i32, i32* %4, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %32

; <label>:24:                                     ; preds = %1
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 69
  %27 = load i32, i32* %26, align 8
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 18)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 18)
  store i32 1, i32* %5, align 4
  br label %31

; <label>:31:                                     ; preds = %29, %24
  br label %57

; <label>:32:                                     ; preds = %1
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %33, i32 0, i32 68
  %35 = load i32, i32* %34, align 4
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 69
  %38 = load i32, i32* %37, align 8
  %39 = icmp sgt i32 %35, %38
  br i1 %39, label %46, label %40

; <label>:40:                                     ; preds = %32
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 25)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 25)
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 69
  %44 = load i32, i32* %43, align 8
  %45 = icmp sge i32 %44, 64
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %40, %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 22)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 22)
  store i32 1, i32* %5, align 4
  br label %48

; <label>:48:                                     ; preds = %46, %40
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %49, i32 0, i32 62
  %51 = load i32, i32* %50, align 8
  %52 = icmp ne i32 %51, 1
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %48
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 26)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 26)
  store i32 1, i32* %5, align 4
  br label %55

; <label>:55:                                     ; preds = %53, %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 19)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 19)
  br label %57

; <label>:57:                                     ; preds = %55, %31
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 70
  %60 = load i32, i32* %59, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %75

; <label>:62:                                     ; preds = %57
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 71
  %65 = load i32, i32* %64, align 8
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 70
  %68 = load i32, i32* %67, align 4
  %69 = sub nsw i32 %68, 1
  %70 = icmp ne i32 %65, %69
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %62
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 21)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 21)
  store i32 1, i32* %5, align 4
  br label %73

; <label>:73:                                     ; preds = %71, %62
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 15)
  %74 = add i64 %pgocount6, 1
  store i64 %74, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 15)
  br label %75

; <label>:75:                                     ; preds = %73, %57
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 71
  %78 = load i32, i32* %77, align 8
  %79 = icmp sgt i32 %78, 13
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %75
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 17)
  %81 = add i64 %pgocount7, 1
  store i64 %81, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 17)
  store i32 1, i32* %5, align 4
  br label %82

; <label>:82:                                     ; preds = %80, %75
  %83 = load i32, i32* %5, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %135

; <label>:85:                                     ; preds = %82
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 16)
  %86 = add i64 %pgocount8, 1
  store i64 %86, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 16)
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %87, i32 0, i32 0
  %89 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %89, i32 0, i32 5
  store i32 14, i32* %90, align 8
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 68
  %93 = load i32, i32* %92, align 4
  %94 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %94, i32 0, i32 0
  %96 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %95, align 8
  %97 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %96, i32 0, i32 6
  %98 = bitcast %union.anon* %97 to [8 x i32]*
  %99 = getelementptr inbounds [8 x i32], [8 x i32]* %98, i64 0, i64 0
  store i32 %93, i32* %99, align 4
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %100, i32 0, i32 69
  %102 = load i32, i32* %101, align 8
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 0
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i32 0, i32 6
  %107 = bitcast %union.anon* %106 to [8 x i32]*
  %108 = getelementptr inbounds [8 x i32], [8 x i32]* %107, i64 0, i64 1
  store i32 %102, i32* %108, align 4
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 70
  %111 = load i32, i32* %110, align 4
  %112 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %113 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %112, i32 0, i32 0
  %114 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %113, align 8
  %115 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %114, i32 0, i32 6
  %116 = bitcast %union.anon* %115 to [8 x i32]*
  %117 = getelementptr inbounds [8 x i32], [8 x i32]* %116, i64 0, i64 2
  store i32 %111, i32* %117, align 4
  %118 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %119 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %118, i32 0, i32 71
  %120 = load i32, i32* %119, align 8
  %121 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %122 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %121, i32 0, i32 0
  %123 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %122, align 8
  %124 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %123, i32 0, i32 6
  %125 = bitcast %union.anon* %124 to [8 x i32]*
  %126 = getelementptr inbounds [8 x i32], [8 x i32]* %125, i64 0, i64 3
  store i32 %120, i32* %126, align 4
  %127 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %127, i32 0, i32 0
  %129 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %128, align 8
  %130 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %129, i32 0, i32 0
  %131 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %130, align 8
  %132 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %133 = bitcast %struct.jpeg_decompress_struct* %132 to %struct.jpeg_common_struct*
  %134 = ptrtoint void (%struct.jpeg_common_struct*)* %131 to i64
  call void @__llvm_profile_instrument_target(i64 %134, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff_decoder to i8*), i32 0)
  call void %131(%struct.jpeg_common_struct* %133)
  br label %135

; <label>:135:                                    ; preds = %85, %82
  store i32 0, i32* %6, align 4
  br label %136

; <label>:136:                                    ; preds = %266, %135
  %137 = load i32, i32* %6, align 4
  %138 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %139 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %138, i32 0, i32 62
  %140 = load i32, i32* %139, align 8
  %141 = icmp slt i32 %137, %140
  br i1 %141, label %142, label %270

; <label>:142:                                    ; preds = %136
  %143 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %144 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %143, i32 0, i32 63
  %145 = load i32, i32* %6, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %144, i64 0, i64 %146
  %148 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %147, align 8
  %149 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %148, i32 0, i32 1
  %150 = load i32, i32* %149, align 4
  store i32 %150, i32* %11, align 4
  %151 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %151, i32 0, i32 38
  %153 = load [64 x i32]*, [64 x i32]** %152, align 8
  %154 = load i32, i32* %11, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [64 x i32], [64 x i32]* %153, i64 %155
  %157 = getelementptr inbounds [64 x i32], [64 x i32]* %156, i64 0, i64 0
  store i32* %157, i32** %9, align 8
  %158 = load i32, i32* %4, align 4
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %193, label %160

; <label>:160:                                    ; preds = %142
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 5)
  %161 = add i64 %pgocount9, 1
  store i64 %161, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 5)
  %162 = load i32*, i32** %9, align 8
  %163 = getelementptr inbounds i32, i32* %162, i64 0
  %164 = load i32, i32* %163, align 4
  %165 = icmp slt i32 %164, 0
  br i1 %165, label %166, label %193

; <label>:166:                                    ; preds = %160
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 12)
  %167 = add i64 %pgocount10, 1
  store i64 %167, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 12)
  %168 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %169 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %168, i32 0, i32 0
  %170 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %169, align 8
  %171 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %170, i32 0, i32 5
  store i32 111, i32* %171, align 8
  %172 = load i32, i32* %11, align 4
  %173 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %174 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %173, i32 0, i32 0
  %175 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %174, align 8
  %176 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %175, i32 0, i32 6
  %177 = bitcast %union.anon* %176 to [8 x i32]*
  %178 = getelementptr inbounds [8 x i32], [8 x i32]* %177, i64 0, i64 0
  store i32 %172, i32* %178, align 4
  %179 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %180 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %179, i32 0, i32 0
  %181 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %180, align 8
  %182 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %181, i32 0, i32 6
  %183 = bitcast %union.anon* %182 to [8 x i32]*
  %184 = getelementptr inbounds [8 x i32], [8 x i32]* %183, i64 0, i64 1
  store i32 0, i32* %184, align 4
  %185 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %186 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %185, i32 0, i32 0
  %187 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %186, align 8
  %188 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %187, i32 0, i32 1
  %189 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %188, align 8
  %190 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %191 = bitcast %struct.jpeg_decompress_struct* %190 to %struct.jpeg_common_struct*
  %192 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %189 to i64
  call void @__llvm_profile_instrument_target(i64 %192, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff_decoder to i8*), i32 1)
  call void %189(%struct.jpeg_common_struct* %191, i32 -1)
  br label %193

; <label>:193:                                    ; preds = %166, %160, %142
  %194 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %195 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %194, i32 0, i32 68
  %196 = load i32, i32* %195, align 4
  store i32 %196, i32* %7, align 4
  br label %197

; <label>:197:                                    ; preds = %262, %193
  %198 = load i32, i32* %7, align 4
  %199 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %200 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %199, i32 0, i32 69
  %201 = load i32, i32* %200, align 8
  %202 = icmp sle i32 %198, %201
  br i1 %202, label %203, label %265

; <label>:203:                                    ; preds = %197
  %204 = load i32*, i32** %9, align 8
  %205 = load i32, i32* %7, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i32, i32* %204, i64 %206
  %208 = load i32, i32* %207, align 4
  %209 = icmp slt i32 %208, 0
  br i1 %209, label %210, label %212

; <label>:210:                                    ; preds = %203
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 2)
  %211 = add i64 %pgocount11, 1
  store i64 %211, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 2)
  br label %219

; <label>:212:                                    ; preds = %203
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 0)
  %213 = add i64 %pgocount12, 1
  store i64 %213, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 0)
  %214 = load i32*, i32** %9, align 8
  %215 = load i32, i32* %7, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i32, i32* %214, i64 %216
  %218 = load i32, i32* %217, align 4
  br label %219

; <label>:219:                                    ; preds = %212, %210
  %220 = phi i32 [ 0, %210 ], [ %218, %212 ]
  store i32 %220, i32* %12, align 4
  %221 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %222 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %221, i32 0, i32 70
  %223 = load i32, i32* %222, align 4
  %224 = load i32, i32* %12, align 4
  %225 = icmp ne i32 %223, %224
  br i1 %225, label %226, label %254

; <label>:226:                                    ; preds = %219
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 1)
  %227 = add i64 %pgocount13, 1
  store i64 %227, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 1)
  %228 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %229 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %228, i32 0, i32 0
  %230 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %229, align 8
  %231 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %230, i32 0, i32 5
  store i32 111, i32* %231, align 8
  %232 = load i32, i32* %11, align 4
  %233 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %234 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %233, i32 0, i32 0
  %235 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %234, align 8
  %236 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %235, i32 0, i32 6
  %237 = bitcast %union.anon* %236 to [8 x i32]*
  %238 = getelementptr inbounds [8 x i32], [8 x i32]* %237, i64 0, i64 0
  store i32 %232, i32* %238, align 4
  %239 = load i32, i32* %7, align 4
  %240 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %241 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %240, i32 0, i32 0
  %242 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %241, align 8
  %243 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %242, i32 0, i32 6
  %244 = bitcast %union.anon* %243 to [8 x i32]*
  %245 = getelementptr inbounds [8 x i32], [8 x i32]* %244, i64 0, i64 1
  store i32 %239, i32* %245, align 4
  %246 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %247 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %246, i32 0, i32 0
  %248 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %247, align 8
  %249 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %248, i32 0, i32 1
  %250 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %249, align 8
  %251 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %252 = bitcast %struct.jpeg_decompress_struct* %251 to %struct.jpeg_common_struct*
  %253 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %250 to i64
  call void @__llvm_profile_instrument_target(i64 %253, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff_decoder to i8*), i32 2)
  call void %250(%struct.jpeg_common_struct* %252, i32 -1)
  br label %254

; <label>:254:                                    ; preds = %226, %219
  %255 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %256 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %255, i32 0, i32 71
  %257 = load i32, i32* %256, align 8
  %258 = load i32*, i32** %9, align 8
  %259 = load i32, i32* %7, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i32, i32* %258, i64 %260
  store i32 %257, i32* %261, align 4
  br label %262

; <label>:262:                                    ; preds = %254
  %263 = load i32, i32* %7, align 4
  %264 = add nsw i32 %263, 1
  store i32 %264, i32* %7, align 4
  br label %197

; <label>:265:                                    ; preds = %197
  br label %266

; <label>:266:                                    ; preds = %265
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 3)
  %267 = add i64 %pgocount14, 1
  store i64 %267, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 3)
  %268 = load i32, i32* %6, align 4
  %269 = add nsw i32 %268, 1
  store i32 %269, i32* %6, align 4
  br label %136

; <label>:270:                                    ; preds = %136
  %271 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %272 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %271, i32 0, i32 70
  %273 = load i32, i32* %272, align 4
  %274 = icmp eq i32 %273, 0
  br i1 %274, label %275, label %289

; <label>:275:                                    ; preds = %270
  %276 = load i32, i32* %4, align 4
  %277 = icmp ne i32 %276, 0
  br i1 %277, label %278, label %283

; <label>:278:                                    ; preds = %275
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 23)
  %279 = add i64 %pgocount15, 1
  store i64 %279, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 23)
  %280 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %281 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %280, i32 0, i32 0
  %282 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %281, i32 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_DC_first, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %282, align 8
  br label %288

; <label>:283:                                    ; preds = %275
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 27)
  %284 = add i64 %pgocount16, 1
  store i64 %284, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 27)
  %285 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %286 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %285, i32 0, i32 0
  %287 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %286, i32 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_AC_first, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %287, align 8
  br label %288

; <label>:288:                                    ; preds = %283, %278
  br label %303

; <label>:289:                                    ; preds = %270
  %290 = load i32, i32* %4, align 4
  %291 = icmp ne i32 %290, 0
  br i1 %291, label %292, label %297

; <label>:292:                                    ; preds = %289
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 20)
  %293 = add i64 %pgocount17, 1
  store i64 %293, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 20)
  %294 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %295 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %294, i32 0, i32 0
  %296 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %295, i32 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_DC_refine, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %296, align 8
  br label %302

; <label>:297:                                    ; preds = %289
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 24)
  %298 = add i64 %pgocount18, 1
  store i64 %298, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 24)
  %299 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %300 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %299, i32 0, i32 0
  %301 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %300, i32 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu_AC_refine, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %301, align 8
  br label %302

; <label>:302:                                    ; preds = %297, %292
  br label %303

; <label>:303:                                    ; preds = %302, %288
  store i32 0, i32* %6, align 4
  br label %304

; <label>:304:                                    ; preds = %449, %303
  %305 = load i32, i32* %6, align 4
  %306 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %307 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %306, i32 0, i32 62
  %308 = load i32, i32* %307, align 8
  %309 = icmp slt i32 %305, %308
  br i1 %309, label %310, label %452

; <label>:310:                                    ; preds = %304
  %311 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %312 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %311, i32 0, i32 63
  %313 = load i32, i32* %6, align 4
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %312, i64 0, i64 %314
  %316 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %315, align 8
  store %struct.jpeg_component_info* %316, %struct.jpeg_component_info** %10, align 8
  %317 = load i32, i32* %4, align 4
  %318 = icmp ne i32 %317, 0
  br i1 %318, label %319, label %380

; <label>:319:                                    ; preds = %310
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 4)
  %320 = add i64 %pgocount19, 1
  store i64 %320, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 4)
  %321 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %322 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %321, i32 0, i32 70
  %323 = load i32, i32* %322, align 4
  %324 = icmp eq i32 %323, 0
  br i1 %324, label %325, label %379

; <label>:325:                                    ; preds = %319
  %326 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %327 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %326, i32 0, i32 5
  %328 = load i32, i32* %327, align 4
  store i32 %328, i32* %8, align 4
  %329 = load i32, i32* %8, align 4
  %330 = icmp slt i32 %329, 0
  br i1 %330, label %344, label %331

; <label>:331:                                    ; preds = %325
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 11)
  %332 = add i64 %pgocount20, 1
  store i64 %332, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 11)
  %333 = load i32, i32* %8, align 4
  %334 = icmp sge i32 %333, 4
  br i1 %334, label %344, label %335

; <label>:335:                                    ; preds = %331
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 14)
  %336 = add i64 %pgocount21, 1
  store i64 %336, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 14)
  %337 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %338 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %337, i32 0, i32 40
  %339 = load i32, i32* %8, align 4
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %338, i64 0, i64 %340
  %342 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %341, align 8
  %343 = icmp eq %struct.JHUFF_TBL* %342, null
  br i1 %343, label %344, label %365

; <label>:344:                                    ; preds = %335, %331, %325
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 10)
  %345 = add i64 %pgocount22, 1
  store i64 %345, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 10)
  %346 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %347 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %346, i32 0, i32 0
  %348 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %347, align 8
  %349 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %348, i32 0, i32 5
  store i32 49, i32* %349, align 8
  %350 = load i32, i32* %8, align 4
  %351 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %352 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %351, i32 0, i32 0
  %353 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %352, align 8
  %354 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %353, i32 0, i32 6
  %355 = bitcast %union.anon* %354 to [8 x i32]*
  %356 = getelementptr inbounds [8 x i32], [8 x i32]* %355, i64 0, i64 0
  store i32 %350, i32* %356, align 4
  %357 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %358 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %357, i32 0, i32 0
  %359 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %358, align 8
  %360 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %359, i32 0, i32 0
  %361 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %360, align 8
  %362 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %363 = bitcast %struct.jpeg_decompress_struct* %362 to %struct.jpeg_common_struct*
  %364 = ptrtoint void (%struct.jpeg_common_struct*)* %361 to i64
  call void @__llvm_profile_instrument_target(i64 %364, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff_decoder to i8*), i32 3)
  call void %361(%struct.jpeg_common_struct* %363)
  br label %365

; <label>:365:                                    ; preds = %344, %335
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 8)
  %366 = add i64 %pgocount23, 1
  store i64 %366, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 8)
  %367 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %368 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %369 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %368, i32 0, i32 40
  %370 = load i32, i32* %8, align 4
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %369, i64 0, i64 %371
  %373 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %372, align 8
  %374 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %375 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %374, i32 0, i32 4
  %376 = load i32, i32* %8, align 4
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %375, i64 0, i64 %377
  call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* %367, %struct.JHUFF_TBL* %373, %struct.d_derived_tbl** %378)
  br label %379

; <label>:379:                                    ; preds = %365, %319
  br label %442

; <label>:380:                                    ; preds = %310
  %381 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %382 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %381, i32 0, i32 6
  %383 = load i32, i32* %382, align 8
  store i32 %383, i32* %8, align 4
  %384 = load i32, i32* %8, align 4
  %385 = icmp slt i32 %384, 0
  br i1 %385, label %399, label %386

; <label>:386:                                    ; preds = %380
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 9)
  %387 = add i64 %pgocount24, 1
  store i64 %387, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 9)
  %388 = load i32, i32* %8, align 4
  %389 = icmp sge i32 %388, 4
  br i1 %389, label %399, label %390

; <label>:390:                                    ; preds = %386
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 13)
  %391 = add i64 %pgocount25, 1
  store i64 %391, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 13)
  %392 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %393 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %392, i32 0, i32 41
  %394 = load i32, i32* %8, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %393, i64 0, i64 %395
  %397 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %396, align 8
  %398 = icmp eq %struct.JHUFF_TBL* %397, null
  br i1 %398, label %399, label %420

; <label>:399:                                    ; preds = %390, %386, %380
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 7)
  %400 = add i64 %pgocount26, 1
  store i64 %400, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 7)
  %401 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %402 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %401, i32 0, i32 0
  %403 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %402, align 8
  %404 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %403, i32 0, i32 5
  store i32 49, i32* %404, align 8
  %405 = load i32, i32* %8, align 4
  %406 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %407 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %406, i32 0, i32 0
  %408 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %407, align 8
  %409 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %408, i32 0, i32 6
  %410 = bitcast %union.anon* %409 to [8 x i32]*
  %411 = getelementptr inbounds [8 x i32], [8 x i32]* %410, i64 0, i64 0
  store i32 %405, i32* %411, align 4
  %412 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %413 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %412, i32 0, i32 0
  %414 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %413, align 8
  %415 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %414, i32 0, i32 0
  %416 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %415, align 8
  %417 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %418 = bitcast %struct.jpeg_decompress_struct* %417 to %struct.jpeg_common_struct*
  %419 = ptrtoint void (%struct.jpeg_common_struct*)* %416 to i64
  call void @__llvm_profile_instrument_target(i64 %419, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_phuff_decoder to i8*), i32 4)
  call void %416(%struct.jpeg_common_struct* %418)
  br label %420

; <label>:420:                                    ; preds = %399, %390
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 6)
  %421 = add i64 %pgocount27, 1
  store i64 %421, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_tmp1.ll_start_pass_phuff_decoder, i64 0, i64 6)
  %422 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %423 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %424 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %423, i32 0, i32 41
  %425 = load i32, i32* %8, align 4
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %424, i64 0, i64 %426
  %428 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %427, align 8
  %429 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %430 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %429, i32 0, i32 4
  %431 = load i32, i32* %8, align 4
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %430, i64 0, i64 %432
  call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* %422, %struct.JHUFF_TBL* %428, %struct.d_derived_tbl** %433)
  %434 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %435 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %434, i32 0, i32 4
  %436 = load i32, i32* %8, align 4
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %435, i64 0, i64 %437
  %439 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %438, align 8
  %440 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %441 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %440, i32 0, i32 5
  store %struct.d_derived_tbl* %439, %struct.d_derived_tbl** %441, align 8
  br label %442

; <label>:442:                                    ; preds = %420, %379
  %443 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %444 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %443, i32 0, i32 2
  %445 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %444, i32 0, i32 1
  %446 = load i32, i32* %6, align 4
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [4 x i32], [4 x i32]* %445, i64 0, i64 %447
  store i32 0, i32* %448, align 4
  br label %449

; <label>:449:                                    ; preds = %442
  %450 = load i32, i32* %6, align 4
  %451 = add nsw i32 %450, 1
  store i32 %451, i32* %6, align 4
  br label %304

; <label>:452:                                    ; preds = %304
  %453 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %454 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %453, i32 0, i32 1
  %455 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %454, i32 0, i32 1
  store i32 0, i32* %455, align 8
  %456 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %457 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %456, i32 0, i32 1
  %458 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %457, i32 0, i32 0
  store i64 0, i64* %458, align 8
  %459 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %460 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %459, i32 0, i32 1
  %461 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %460, i32 0, i32 2
  store i32 0, i32* %461, align 4
  %462 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %463 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %462, i32 0, i32 2
  %464 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %463, i32 0, i32 0
  store i32 0, i32* %464, align 8
  %465 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %466 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %465, i32 0, i32 49
  %467 = load i32, i32* %466, align 8
  %468 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %3, align 8
  %469 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %468, i32 0, i32 3
  store i32 %467, i32* %469, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu_DC_first(%struct.jpeg_decompress_struct*, [64 x i16]**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca [64 x i16]**, align 8
  %6 = alloca %struct.phuff_entropy_decoder*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [64 x i16]*, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.bitread_working_state, align 8
  %16 = alloca %struct.savable_state, align 4
  %17 = alloca %struct.d_derived_tbl*, align 8
  %18 = alloca %struct.jpeg_component_info*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store [64 x i16]** %1, [64 x i16]*** %5, align 8
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 79
  %23 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %22, align 8
  %24 = bitcast %struct.jpeg_entropy_decoder* %23 to %struct.phuff_entropy_decoder*
  store %struct.phuff_entropy_decoder* %24, %struct.phuff_entropy_decoder** %6, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 71
  %27 = load i32, i32* %26, align 8
  store i32 %27, i32* %7, align 4
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 49
  %30 = load i32, i32* %29, align 8
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %47

; <label>:32:                                     ; preds = %2
  %33 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %34 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %33, i32 0, i32 3
  %35 = load i32, i32* %34, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %45

; <label>:37:                                     ; preds = %32
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %39 = call i32 @process_restart(%struct.jpeg_decompress_struct* %38)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %43, label %41

; <label>:41:                                     ; preds = %37
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 13)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 13)
  store i32 0, i32* %3, align 4
  br label %285

; <label>:43:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 11)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 11)
  br label %45

; <label>:45:                                     ; preds = %43, %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 7)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 7)
  br label %47

; <label>:47:                                     ; preds = %45, %2
  %48 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %49 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 5
  store %struct.jpeg_decompress_struct* %48, %struct.jpeg_decompress_struct** %49, align 8
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 5
  %52 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %52, i32 0, i32 0
  %54 = load i8*, i8** %53, align 8
  %55 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 0
  store i8* %54, i8** %55, align 8
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 5
  %58 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %58, i32 0, i32 1
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 1
  store i64 %60, i64* %61, align 8
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 72
  %64 = load i32, i32* %63, align 4
  %65 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 2
  store i32 %64, i32* %65, align 8
  %66 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %67 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %66, i32 0, i32 1
  %68 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %67, i32 0, i32 0
  %69 = load i64, i64* %68, align 8
  store i64 %69, i64* %13, align 8
  %70 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %71 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %70, i32 0, i32 1
  %72 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %71, i32 0, i32 1
  %73 = load i32, i32* %72, align 8
  store i32 %73, i32* %14, align 4
  %74 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %75 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %74, i32 0, i32 1
  %76 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %75, i32 0, i32 2
  %77 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 6
  store i32* %76, i32** %77, align 8
  %78 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %79 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %78, i32 0, i32 2
  %80 = bitcast %struct.savable_state* %16 to i8*
  %81 = bitcast %struct.savable_state* %79 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %80, i8* %81, i64 20, i32 4, i1 false)
  store i32 0, i32* %10, align 4
  br label %82

; <label>:82:                                     ; preds = %248, %47
  %83 = load i32, i32* %10, align 4
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 66
  %86 = load i32, i32* %85, align 8
  %87 = icmp slt i32 %83, %86
  br i1 %87, label %88, label %251

; <label>:88:                                     ; preds = %82
  %89 = load [64 x i16]**, [64 x i16]*** %5, align 8
  %90 = load i32, i32* %10, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [64 x i16]*, [64 x i16]** %89, i64 %91
  %93 = load [64 x i16]*, [64 x i16]** %92, align 8
  store [64 x i16]* %93, [64 x i16]** %12, align 8
  %94 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %94, i32 0, i32 67
  %96 = load i32, i32* %10, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [10 x i32], [10 x i32]* %95, i64 0, i64 %97
  %99 = load i32, i32* %98, align 4
  store i32 %99, i32* %11, align 4
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %100, i32 0, i32 63
  %102 = load i32, i32* %11, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %101, i64 0, i64 %103
  %105 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %104, align 8
  store %struct.jpeg_component_info* %105, %struct.jpeg_component_info** %18, align 8
  %106 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %107 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %106, i32 0, i32 4
  %108 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %109 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %108, i32 0, i32 5
  %110 = load i32, i32* %109, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %107, i64 0, i64 %111
  %113 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %112, align 8
  store %struct.d_derived_tbl* %113, %struct.d_derived_tbl** %17, align 8
  %114 = load i32, i32* %14, align 4
  %115 = icmp slt i32 %114, 8
  br i1 %115, label %116, label %134

; <label>:116:                                    ; preds = %88
  %117 = load i64, i64* %13, align 8
  %118 = load i32, i32* %14, align 4
  %119 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %15, i64 %117, i32 %118, i32 0)
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %123, label %121

; <label>:121:                                    ; preds = %116
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 10)
  %122 = add i64 %pgocount3, 1
  store i64 %122, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 10)
  store i32 0, i32* %3, align 4
  br label %285

; <label>:123:                                    ; preds = %116
  %124 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %125 = load i64, i64* %124, align 8
  store i64 %125, i64* %13, align 8
  %126 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %127 = load i32, i32* %126, align 8
  store i32 %127, i32* %14, align 4
  %128 = load i32, i32* %14, align 4
  %129 = icmp slt i32 %128, 8
  br i1 %129, label %130, label %132

; <label>:130:                                    ; preds = %123
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 5)
  %131 = add i64 %pgocount4, 1
  store i64 %131, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 5)
  store i32 1, i32* %19, align 4
  br label %163

; <label>:132:                                    ; preds = %123
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 6)
  %133 = add i64 %pgocount5, 1
  store i64 %133, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 6)
  br label %134

; <label>:134:                                    ; preds = %132, %88
  %135 = load i64, i64* %13, align 8
  %136 = load i32, i32* %14, align 4
  %137 = sub nsw i32 %136, 8
  %138 = zext i32 %137 to i64
  %139 = ashr i64 %135, %138
  %140 = trunc i64 %139 to i32
  %141 = and i32 %140, 255
  store i32 %141, i32* %20, align 4
  %142 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %143 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %142, i32 0, i32 4
  %144 = load i32, i32* %20, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [256 x i32], [256 x i32]* %143, i64 0, i64 %145
  %147 = load i32, i32* %146, align 4
  store i32 %147, i32* %19, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %161

; <label>:149:                                    ; preds = %134
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 0)
  %150 = add i64 %pgocount6, 1
  store i64 %150, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 0)
  %151 = load i32, i32* %19, align 4
  %152 = load i32, i32* %14, align 4
  %153 = sub nsw i32 %152, %151
  store i32 %153, i32* %14, align 4
  %154 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %155 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %154, i32 0, i32 5
  %156 = load i32, i32* %20, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [256 x i8], [256 x i8]* %155, i64 0, i64 %157
  %159 = load i8, i8* %158, align 1
  %160 = zext i8 %159 to i32
  store i32 %160, i32* %8, align 4
  br label %177

; <label>:161:                                    ; preds = %134
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 4)
  %162 = add i64 %pgocount7, 1
  store i64 %162, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 4)
  store i32 9, i32* %19, align 4
  br label %163

; <label>:163:                                    ; preds = %161, %130
  %164 = load i64, i64* %13, align 8
  %165 = load i32, i32* %14, align 4
  %166 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %167 = load i32, i32* %19, align 4
  %168 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* %15, i64 %164, i32 %165, %struct.d_derived_tbl* %166, i32 %167)
  store i32 %168, i32* %8, align 4
  %169 = icmp slt i32 %168, 0
  br i1 %169, label %170, label %172

; <label>:170:                                    ; preds = %163
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 9)
  %171 = add i64 %pgocount8, 1
  store i64 %171, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 9)
  store i32 0, i32* %3, align 4
  br label %285

; <label>:172:                                    ; preds = %163
  %173 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %174 = load i64, i64* %173, align 8
  store i64 %174, i64* %13, align 8
  %175 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %176 = load i32, i32* %175, align 8
  store i32 %176, i32* %14, align 4
  br label %177

; <label>:177:                                    ; preds = %172, %149
  %178 = load i32, i32* %8, align 4
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %229

; <label>:180:                                    ; preds = %177
  %181 = load i32, i32* %14, align 4
  %182 = load i32, i32* %8, align 4
  %183 = icmp slt i32 %181, %182
  br i1 %183, label %184, label %198

; <label>:184:                                    ; preds = %180
  %185 = load i64, i64* %13, align 8
  %186 = load i32, i32* %14, align 4
  %187 = load i32, i32* %8, align 4
  %188 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %15, i64 %185, i32 %186, i32 %187)
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %192, label %190

; <label>:190:                                    ; preds = %184
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 12)
  %191 = add i64 %pgocount9, 1
  store i64 %191, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 12)
  store i32 0, i32* %3, align 4
  br label %285

; <label>:192:                                    ; preds = %184
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 3)
  %193 = add i64 %pgocount10, 1
  store i64 %193, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 3)
  %194 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %195 = load i64, i64* %194, align 8
  store i64 %195, i64* %13, align 8
  %196 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %197 = load i32, i32* %196, align 8
  store i32 %197, i32* %14, align 4
  br label %198

; <label>:198:                                    ; preds = %192, %180
  %199 = load i64, i64* %13, align 8
  %200 = load i32, i32* %8, align 4
  %201 = load i32, i32* %14, align 4
  %202 = sub nsw i32 %201, %200
  store i32 %202, i32* %14, align 4
  %203 = zext i32 %202 to i64
  %204 = ashr i64 %199, %203
  %205 = trunc i64 %204 to i32
  %206 = load i32, i32* %8, align 4
  %207 = shl i32 1, %206
  %208 = sub nsw i32 %207, 1
  %209 = and i32 %205, %208
  store i32 %209, i32* %9, align 4
  %210 = load i32, i32* %9, align 4
  %211 = load i32, i32* %8, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %212
  %214 = load i32, i32* %213, align 4
  %215 = icmp slt i32 %210, %214
  br i1 %215, label %216, label %224

; <label>:216:                                    ; preds = %198
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 1)
  %217 = add i64 %pgocount11, 1
  store i64 %217, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 1)
  %218 = load i32, i32* %9, align 4
  %219 = load i32, i32* %8, align 4
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %220
  %222 = load i32, i32* %221, align 4
  %223 = add nsw i32 %218, %222
  br label %227

; <label>:224:                                    ; preds = %198
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 2)
  %225 = add i64 %pgocount12, 1
  store i64 %225, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 2)
  %226 = load i32, i32* %9, align 4
  br label %227

; <label>:227:                                    ; preds = %224, %216
  %228 = phi i32 [ %223, %216 ], [ %226, %224 ]
  store i32 %228, i32* %8, align 4
  br label %229

; <label>:229:                                    ; preds = %227, %177
  %230 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %16, i32 0, i32 1
  %231 = load i32, i32* %11, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [4 x i32], [4 x i32]* %230, i64 0, i64 %232
  %234 = load i32, i32* %233, align 4
  %235 = load i32, i32* %8, align 4
  %236 = add nsw i32 %235, %234
  store i32 %236, i32* %8, align 4
  %237 = load i32, i32* %8, align 4
  %238 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %16, i32 0, i32 1
  %239 = load i32, i32* %11, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [4 x i32], [4 x i32]* %238, i64 0, i64 %240
  store i32 %237, i32* %241, align 4
  %242 = load i32, i32* %8, align 4
  %243 = load i32, i32* %7, align 4
  %244 = shl i32 %242, %243
  %245 = trunc i32 %244 to i16
  %246 = load [64 x i16]*, [64 x i16]** %12, align 8
  %247 = getelementptr inbounds [64 x i16], [64 x i16]* %246, i64 0, i64 0
  store i16 %245, i16* %247, align 2
  br label %248

; <label>:248:                                    ; preds = %229
  %249 = load i32, i32* %10, align 4
  %250 = add nsw i32 %249, 1
  store i32 %250, i32* %10, align 4
  br label %82

; <label>:251:                                    ; preds = %82
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 8)
  %252 = add i64 %pgocount13, 1
  store i64 %252, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_decode_mcu_DC_first, i64 0, i64 8)
  %253 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 0
  %254 = load i8*, i8** %253, align 8
  %255 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %256 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %255, i32 0, i32 5
  %257 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %256, align 8
  %258 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %257, i32 0, i32 0
  store i8* %254, i8** %258, align 8
  %259 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 1
  %260 = load i64, i64* %259, align 8
  %261 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %262 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %261, i32 0, i32 5
  %263 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %262, align 8
  %264 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %263, i32 0, i32 1
  store i64 %260, i64* %264, align 8
  %265 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 2
  %266 = load i32, i32* %265, align 8
  %267 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %268 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %267, i32 0, i32 72
  store i32 %266, i32* %268, align 4
  %269 = load i64, i64* %13, align 8
  %270 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %271 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %270, i32 0, i32 1
  %272 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %271, i32 0, i32 0
  store i64 %269, i64* %272, align 8
  %273 = load i32, i32* %14, align 4
  %274 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %275 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %274, i32 0, i32 1
  %276 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %275, i32 0, i32 1
  store i32 %273, i32* %276, align 8
  %277 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %278 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %277, i32 0, i32 2
  %279 = bitcast %struct.savable_state* %278 to i8*
  %280 = bitcast %struct.savable_state* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %279, i8* %280, i64 20, i32 4, i1 false)
  %281 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %282 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %281, i32 0, i32 3
  %283 = load i32, i32* %282, align 4
  %284 = add i32 %283, -1
  store i32 %284, i32* %282, align 4
  store i32 1, i32* %3, align 4
  br label %285

; <label>:285:                                    ; preds = %251, %190, %170, %121, %41
  %286 = load i32, i32* %3, align 4
  ret i32 %286
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu_AC_first(%struct.jpeg_decompress_struct*, [64 x i16]**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca [64 x i16]**, align 8
  %6 = alloca %struct.phuff_entropy_decoder*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [64 x i16]*, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca %struct.bitread_working_state, align 8
  %17 = alloca %struct.d_derived_tbl*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store [64 x i16]** %1, [64 x i16]*** %5, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 79
  %22 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %21, align 8
  %23 = bitcast %struct.jpeg_entropy_decoder* %22 to %struct.phuff_entropy_decoder*
  store %struct.phuff_entropy_decoder* %23, %struct.phuff_entropy_decoder** %6, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 69
  %26 = load i32, i32* %25, align 8
  store i32 %26, i32* %7, align 4
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 71
  %29 = load i32, i32* %28, align 8
  store i32 %29, i32* %8, align 4
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 49
  %32 = load i32, i32* %31, align 8
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %49

; <label>:34:                                     ; preds = %2
  %35 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %36 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %35, i32 0, i32 3
  %37 = load i32, i32* %36, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %47

; <label>:39:                                     ; preds = %34
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %41 = call i32 @process_restart(%struct.jpeg_decompress_struct* %40)
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %45, label %43

; <label>:43:                                     ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 11)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 11)
  store i32 0, i32* %3, align 4
  br label %327

; <label>:45:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 10)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 10)
  br label %47

; <label>:47:                                     ; preds = %45, %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 7)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 7)
  br label %49

; <label>:49:                                     ; preds = %47, %2
  %50 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %51 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %50, i32 0, i32 2
  %52 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %51, i32 0, i32 0
  %53 = load i32, i32* %52, align 8
  store i32 %53, i32* %12, align 4
  %54 = load i32, i32* %12, align 4
  %55 = icmp ugt i32 %54, 0
  br i1 %55, label %56, label %60

; <label>:56:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 8)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 8)
  %58 = load i32, i32* %12, align 4
  %59 = add i32 %58, -1
  store i32 %59, i32* %12, align 4
  br label %318

; <label>:60:                                     ; preds = %49
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %62 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 5
  store %struct.jpeg_decompress_struct* %61, %struct.jpeg_decompress_struct** %62, align 8
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 5
  %65 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %65, i32 0, i32 0
  %67 = load i8*, i8** %66, align 8
  %68 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 0
  store i8* %67, i8** %68, align 8
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i32 0, i32 5
  %71 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %71, i32 0, i32 1
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 1
  store i64 %73, i64* %74, align 8
  %75 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %76 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %75, i32 0, i32 72
  %77 = load i32, i32* %76, align 4
  %78 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 2
  store i32 %77, i32* %78, align 8
  %79 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %80 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %79, i32 0, i32 1
  %81 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %80, i32 0, i32 0
  %82 = load i64, i64* %81, align 8
  store i64 %82, i64* %14, align 8
  %83 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %84 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %83, i32 0, i32 1
  %85 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %84, i32 0, i32 1
  %86 = load i32, i32* %85, align 8
  store i32 %86, i32* %15, align 4
  %87 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %88 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %87, i32 0, i32 1
  %89 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %88, i32 0, i32 2
  %90 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 6
  store i32* %89, i32** %90, align 8
  %91 = load [64 x i16]**, [64 x i16]*** %5, align 8
  %92 = getelementptr inbounds [64 x i16]*, [64 x i16]** %91, i64 0
  %93 = load [64 x i16]*, [64 x i16]** %92, align 8
  store [64 x i16]* %93, [64 x i16]** %13, align 8
  %94 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %95 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %94, i32 0, i32 5
  %96 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %95, align 8
  store %struct.d_derived_tbl* %96, %struct.d_derived_tbl** %17, align 8
  %97 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %97, i32 0, i32 68
  %99 = load i32, i32* %98, align 4
  store i32 %99, i32* %10, align 4
  br label %100

; <label>:100:                                    ; preds = %289, %60
  %101 = load i32, i32* %10, align 4
  %102 = load i32, i32* %7, align 4
  %103 = icmp sle i32 %101, %102
  br i1 %103, label %104, label %292

; <label>:104:                                    ; preds = %100
  %105 = load i32, i32* %15, align 4
  %106 = icmp slt i32 %105, 8
  br i1 %106, label %107, label %125

; <label>:107:                                    ; preds = %104
  %108 = load i64, i64* %14, align 8
  %109 = load i32, i32* %15, align 4
  %110 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %16, i64 %108, i32 %109, i32 0)
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %114, label %112

; <label>:112:                                    ; preds = %107
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 13)
  %113 = add i64 %pgocount4, 1
  store i64 %113, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 13)
  store i32 0, i32* %3, align 4
  br label %327

; <label>:114:                                    ; preds = %107
  %115 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 3
  %116 = load i64, i64* %115, align 8
  store i64 %116, i64* %14, align 8
  %117 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 4
  %118 = load i32, i32* %117, align 8
  store i32 %118, i32* %15, align 4
  %119 = load i32, i32* %15, align 4
  %120 = icmp slt i32 %119, 8
  br i1 %120, label %121, label %123

; <label>:121:                                    ; preds = %114
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 5)
  %122 = add i64 %pgocount5, 1
  store i64 %122, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 5)
  store i32 1, i32* %18, align 4
  br label %153

; <label>:123:                                    ; preds = %114
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 6)
  %124 = add i64 %pgocount6, 1
  store i64 %124, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 6)
  br label %125

; <label>:125:                                    ; preds = %123, %104
  %126 = load i64, i64* %14, align 8
  %127 = load i32, i32* %15, align 4
  %128 = sub nsw i32 %127, 8
  %129 = zext i32 %128 to i64
  %130 = ashr i64 %126, %129
  %131 = trunc i64 %130 to i32
  %132 = and i32 %131, 255
  store i32 %132, i32* %19, align 4
  %133 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %134 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %133, i32 0, i32 4
  %135 = load i32, i32* %19, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [256 x i32], [256 x i32]* %134, i64 0, i64 %136
  %138 = load i32, i32* %137, align 4
  store i32 %138, i32* %18, align 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %140, label %151

; <label>:140:                                    ; preds = %125
  %141 = load i32, i32* %18, align 4
  %142 = load i32, i32* %15, align 4
  %143 = sub nsw i32 %142, %141
  store i32 %143, i32* %15, align 4
  %144 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %145 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %144, i32 0, i32 5
  %146 = load i32, i32* %19, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [256 x i8], [256 x i8]* %145, i64 0, i64 %147
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  store i32 %150, i32* %9, align 4
  br label %167

; <label>:151:                                    ; preds = %125
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 4)
  %152 = add i64 %pgocount7, 1
  store i64 %152, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 4)
  store i32 9, i32* %18, align 4
  br label %153

; <label>:153:                                    ; preds = %151, %121
  %154 = load i64, i64* %14, align 8
  %155 = load i32, i32* %15, align 4
  %156 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %157 = load i32, i32* %18, align 4
  %158 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* %16, i64 %154, i32 %155, %struct.d_derived_tbl* %156, i32 %157)
  store i32 %158, i32* %9, align 4
  %159 = icmp slt i32 %158, 0
  br i1 %159, label %160, label %162

; <label>:160:                                    ; preds = %153
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 12)
  %161 = add i64 %pgocount8, 1
  store i64 %161, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 12)
  store i32 0, i32* %3, align 4
  br label %327

; <label>:162:                                    ; preds = %153
  %163 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 3
  %164 = load i64, i64* %163, align 8
  store i64 %164, i64* %14, align 8
  %165 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 4
  %166 = load i32, i32* %165, align 8
  store i32 %166, i32* %15, align 4
  br label %167

; <label>:167:                                    ; preds = %162, %140
  %168 = load i32, i32* %9, align 4
  %169 = ashr i32 %168, 4
  store i32 %169, i32* %11, align 4
  %170 = load i32, i32* %9, align 4
  %171 = and i32 %170, 15
  store i32 %171, i32* %9, align 4
  %172 = load i32, i32* %9, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %237

; <label>:174:                                    ; preds = %167
  %175 = load i32, i32* %11, align 4
  %176 = load i32, i32* %10, align 4
  %177 = add nsw i32 %176, %175
  store i32 %177, i32* %10, align 4
  %178 = load i32, i32* %15, align 4
  %179 = load i32, i32* %9, align 4
  %180 = icmp slt i32 %178, %179
  br i1 %180, label %181, label %195

; <label>:181:                                    ; preds = %174
  %182 = load i64, i64* %14, align 8
  %183 = load i32, i32* %15, align 4
  %184 = load i32, i32* %9, align 4
  %185 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %16, i64 %182, i32 %183, i32 %184)
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %189, label %187

; <label>:187:                                    ; preds = %181
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 15)
  %188 = add i64 %pgocount9, 1
  store i64 %188, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 15)
  store i32 0, i32* %3, align 4
  br label %327

; <label>:189:                                    ; preds = %181
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 3)
  %190 = add i64 %pgocount10, 1
  store i64 %190, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 3)
  %191 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 3
  %192 = load i64, i64* %191, align 8
  store i64 %192, i64* %14, align 8
  %193 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 4
  %194 = load i32, i32* %193, align 8
  store i32 %194, i32* %15, align 4
  br label %195

; <label>:195:                                    ; preds = %189, %174
  %196 = load i64, i64* %14, align 8
  %197 = load i32, i32* %9, align 4
  %198 = load i32, i32* %15, align 4
  %199 = sub nsw i32 %198, %197
  store i32 %199, i32* %15, align 4
  %200 = zext i32 %199 to i64
  %201 = ashr i64 %196, %200
  %202 = trunc i64 %201 to i32
  %203 = load i32, i32* %9, align 4
  %204 = shl i32 1, %203
  %205 = sub nsw i32 %204, 1
  %206 = and i32 %202, %205
  store i32 %206, i32* %11, align 4
  %207 = load i32, i32* %11, align 4
  %208 = load i32, i32* %9, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %209
  %211 = load i32, i32* %210, align 4
  %212 = icmp slt i32 %207, %211
  br i1 %212, label %213, label %221

; <label>:213:                                    ; preds = %195
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 1)
  %214 = add i64 %pgocount11, 1
  store i64 %214, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 1)
  %215 = load i32, i32* %11, align 4
  %216 = load i32, i32* %9, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %217
  %219 = load i32, i32* %218, align 4
  %220 = add nsw i32 %215, %219
  br label %224

; <label>:221:                                    ; preds = %195
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 2)
  %222 = add i64 %pgocount12, 1
  store i64 %222, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 2)
  %223 = load i32, i32* %11, align 4
  br label %224

; <label>:224:                                    ; preds = %221, %213
  %225 = phi i32 [ %220, %213 ], [ %223, %221 ]
  store i32 %225, i32* %9, align 4
  %226 = load i32, i32* %9, align 4
  %227 = load i32, i32* %8, align 4
  %228 = shl i32 %226, %227
  %229 = trunc i32 %228 to i16
  %230 = load [64 x i16]*, [64 x i16]** %13, align 8
  %231 = load i32, i32* %10, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %232
  %234 = load i32, i32* %233, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [64 x i16], [64 x i16]* %230, i64 0, i64 %235
  store i16 %229, i16* %236, align 2
  br label %288

; <label>:237:                                    ; preds = %167
  %238 = load i32, i32* %11, align 4
  %239 = icmp eq i32 %238, 15
  br i1 %239, label %240, label %244

; <label>:240:                                    ; preds = %237
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 0)
  %241 = add i64 %pgocount13, 1
  store i64 %241, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 0)
  %242 = load i32, i32* %10, align 4
  %243 = add nsw i32 %242, 15
  store i32 %243, i32* %10, align 4
  br label %287

; <label>:244:                                    ; preds = %237
  %245 = load i32, i32* %11, align 4
  %246 = shl i32 1, %245
  store i32 %246, i32* %12, align 4
  %247 = load i32, i32* %11, align 4
  %248 = icmp ne i32 %247, 0
  br i1 %248, label %249, label %283

; <label>:249:                                    ; preds = %244
  %250 = load i32, i32* %15, align 4
  %251 = load i32, i32* %11, align 4
  %252 = icmp slt i32 %250, %251
  br i1 %252, label %253, label %267

; <label>:253:                                    ; preds = %249
  %254 = load i64, i64* %14, align 8
  %255 = load i32, i32* %15, align 4
  %256 = load i32, i32* %11, align 4
  %257 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %16, i64 %254, i32 %255, i32 %256)
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %261, label %259

; <label>:259:                                    ; preds = %253
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 18)
  %260 = add i64 %pgocount14, 1
  store i64 %260, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 18)
  store i32 0, i32* %3, align 4
  br label %327

; <label>:261:                                    ; preds = %253
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 17)
  %262 = add i64 %pgocount15, 1
  store i64 %262, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 17)
  %263 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 3
  %264 = load i64, i64* %263, align 8
  store i64 %264, i64* %14, align 8
  %265 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 4
  %266 = load i32, i32* %265, align 8
  store i32 %266, i32* %15, align 4
  br label %267

; <label>:267:                                    ; preds = %261, %249
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 16)
  %268 = add i64 %pgocount16, 1
  store i64 %268, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 16)
  %269 = load i64, i64* %14, align 8
  %270 = load i32, i32* %11, align 4
  %271 = load i32, i32* %15, align 4
  %272 = sub nsw i32 %271, %270
  store i32 %272, i32* %15, align 4
  %273 = zext i32 %272 to i64
  %274 = ashr i64 %269, %273
  %275 = trunc i64 %274 to i32
  %276 = load i32, i32* %11, align 4
  %277 = shl i32 1, %276
  %278 = sub nsw i32 %277, 1
  %279 = and i32 %275, %278
  store i32 %279, i32* %11, align 4
  %280 = load i32, i32* %11, align 4
  %281 = load i32, i32* %12, align 4
  %282 = add i32 %281, %280
  store i32 %282, i32* %12, align 4
  br label %283

; <label>:283:                                    ; preds = %267, %244
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 14)
  %284 = add i64 %pgocount17, 1
  store i64 %284, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 14)
  %285 = load i32, i32* %12, align 4
  %286 = add i32 %285, -1
  store i32 %286, i32* %12, align 4
  br label %292

; <label>:287:                                    ; preds = %240
  br label %288

; <label>:288:                                    ; preds = %287, %224
  br label %289

; <label>:289:                                    ; preds = %288
  %290 = load i32, i32* %10, align 4
  %291 = add nsw i32 %290, 1
  store i32 %291, i32* %10, align 4
  br label %100

; <label>:292:                                    ; preds = %283, %100
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 9)
  %293 = add i64 %pgocount18, 1
  store i64 %293, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_tmp1.ll_decode_mcu_AC_first, i64 0, i64 9)
  %294 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 0
  %295 = load i8*, i8** %294, align 8
  %296 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %297 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %296, i32 0, i32 5
  %298 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %297, align 8
  %299 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %298, i32 0, i32 0
  store i8* %295, i8** %299, align 8
  %300 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 1
  %301 = load i64, i64* %300, align 8
  %302 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %303 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %302, i32 0, i32 5
  %304 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %303, align 8
  %305 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %304, i32 0, i32 1
  store i64 %301, i64* %305, align 8
  %306 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 2
  %307 = load i32, i32* %306, align 8
  %308 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %309 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %308, i32 0, i32 72
  store i32 %307, i32* %309, align 4
  %310 = load i64, i64* %14, align 8
  %311 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %312 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %311, i32 0, i32 1
  %313 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %312, i32 0, i32 0
  store i64 %310, i64* %313, align 8
  %314 = load i32, i32* %15, align 4
  %315 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %316 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %315, i32 0, i32 1
  %317 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %316, i32 0, i32 1
  store i32 %314, i32* %317, align 8
  br label %318

; <label>:318:                                    ; preds = %292, %56
  %319 = load i32, i32* %12, align 4
  %320 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %321 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %320, i32 0, i32 2
  %322 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %321, i32 0, i32 0
  store i32 %319, i32* %322, align 8
  %323 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %324 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %323, i32 0, i32 3
  %325 = load i32, i32* %324, align 4
  %326 = add i32 %325, -1
  store i32 %326, i32* %324, align 4
  store i32 1, i32* %3, align 4
  br label %327

; <label>:327:                                    ; preds = %318, %259, %187, %160, %112, %43
  %328 = load i32, i32* %3, align 4
  ret i32 %328
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu_DC_refine(%struct.jpeg_decompress_struct*, [64 x i16]**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca [64 x i16]**, align 8
  %6 = alloca %struct.phuff_entropy_decoder*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [64 x i16]*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.bitread_working_state, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store [64 x i16]** %1, [64 x i16]*** %5, align 8
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %13, i32 0, i32 79
  %15 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %14, align 8
  %16 = bitcast %struct.jpeg_entropy_decoder* %15 to %struct.phuff_entropy_decoder*
  store %struct.phuff_entropy_decoder* %16, %struct.phuff_entropy_decoder** %6, align 8
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 71
  %19 = load i32, i32* %18, align 8
  %20 = shl i32 1, %19
  store i32 %20, i32* %7, align 4
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 49
  %23 = load i32, i32* %22, align 8
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %40

; <label>:25:                                     ; preds = %2
  %26 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %27 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %26, i32 0, i32 3
  %28 = load i32, i32* %27, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %38

; <label>:30:                                     ; preds = %25
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %32 = call i32 @process_restart(%struct.jpeg_decompress_struct* %31)
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %36, label %34

; <label>:34:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 7)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 7)
  store i32 0, i32* %3, align 4
  br label %151

; <label>:36:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 6)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 6)
  br label %38

; <label>:38:                                     ; preds = %36, %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 4)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 4)
  br label %40

; <label>:40:                                     ; preds = %38, %2
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %42 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 5
  store %struct.jpeg_decompress_struct* %41, %struct.jpeg_decompress_struct** %42, align 8
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %43, i32 0, i32 5
  %45 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %45, i32 0, i32 0
  %47 = load i8*, i8** %46, align 8
  %48 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 0
  store i8* %47, i8** %48, align 8
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %49, i32 0, i32 5
  %51 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %51, i32 0, i32 1
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 1
  store i64 %53, i64* %54, align 8
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 72
  %57 = load i32, i32* %56, align 4
  %58 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 2
  store i32 %57, i32* %58, align 8
  %59 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %60 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %59, i32 0, i32 1
  %61 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %60, i32 0, i32 0
  %62 = load i64, i64* %61, align 8
  store i64 %62, i64* %10, align 8
  %63 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %64 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %63, i32 0, i32 1
  %65 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %64, i32 0, i32 1
  %66 = load i32, i32* %65, align 8
  store i32 %66, i32* %11, align 4
  %67 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %68 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %67, i32 0, i32 1
  %69 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %68, i32 0, i32 2
  %70 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 6
  store i32* %69, i32** %70, align 8
  store i32 0, i32* %8, align 4
  br label %71

; <label>:71:                                     ; preds = %117, %40
  %72 = load i32, i32* %8, align 4
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i32 0, i32 66
  %75 = load i32, i32* %74, align 8
  %76 = icmp slt i32 %72, %75
  br i1 %76, label %77, label %121

; <label>:77:                                     ; preds = %71
  %78 = load [64 x i16]**, [64 x i16]*** %5, align 8
  %79 = load i32, i32* %8, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [64 x i16]*, [64 x i16]** %78, i64 %80
  %82 = load [64 x i16]*, [64 x i16]** %81, align 8
  store [64 x i16]* %82, [64 x i16]** %9, align 8
  %83 = load i32, i32* %11, align 4
  %84 = icmp slt i32 %83, 1
  br i1 %84, label %85, label %98

; <label>:85:                                     ; preds = %77
  %86 = load i64, i64* %10, align 8
  %87 = load i32, i32* %11, align 4
  %88 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %12, i64 %86, i32 %87, i32 1)
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %92, label %90

; <label>:90:                                     ; preds = %85
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 5)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 5)
  store i32 0, i32* %3, align 4
  br label %151

; <label>:92:                                     ; preds = %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 2)
  %93 = add i64 %pgocount4, 1
  store i64 %93, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 2)
  %94 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 3
  %95 = load i64, i64* %94, align 8
  store i64 %95, i64* %10, align 8
  %96 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 4
  %97 = load i32, i32* %96, align 8
  store i32 %97, i32* %11, align 4
  br label %98

; <label>:98:                                     ; preds = %92, %77
  %99 = load i64, i64* %10, align 8
  %100 = load i32, i32* %11, align 4
  %101 = sub nsw i32 %100, 1
  store i32 %101, i32* %11, align 4
  %102 = zext i32 %101 to i64
  %103 = ashr i64 %99, %102
  %104 = trunc i64 %103 to i32
  %105 = and i32 %104, 1
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %116

; <label>:107:                                    ; preds = %98
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 1)
  %108 = add i64 %pgocount5, 1
  store i64 %108, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 1)
  %109 = load i32, i32* %7, align 4
  %110 = load [64 x i16]*, [64 x i16]** %9, align 8
  %111 = getelementptr inbounds [64 x i16], [64 x i16]* %110, i64 0, i64 0
  %112 = load i16, i16* %111, align 2
  %113 = sext i16 %112 to i32
  %114 = or i32 %113, %109
  %115 = trunc i32 %114 to i16
  store i16 %115, i16* %111, align 2
  br label %116

; <label>:116:                                    ; preds = %107, %98
  br label %117

; <label>:117:                                    ; preds = %116
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 0)
  %118 = add i64 %pgocount6, 1
  store i64 %118, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 0)
  %119 = load i32, i32* %8, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %8, align 4
  br label %71

; <label>:121:                                    ; preds = %71
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 3)
  %122 = add i64 %pgocount7, 1
  store i64 %122, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_decode_mcu_DC_refine, i64 0, i64 3)
  %123 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 0
  %124 = load i8*, i8** %123, align 8
  %125 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %126 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %125, i32 0, i32 5
  %127 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %127, i32 0, i32 0
  store i8* %124, i8** %128, align 8
  %129 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 1
  %130 = load i64, i64* %129, align 8
  %131 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %132 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %131, i32 0, i32 5
  %133 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %132, align 8
  %134 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %133, i32 0, i32 1
  store i64 %130, i64* %134, align 8
  %135 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %12, i32 0, i32 2
  %136 = load i32, i32* %135, align 8
  %137 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %138 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %137, i32 0, i32 72
  store i32 %136, i32* %138, align 4
  %139 = load i64, i64* %10, align 8
  %140 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %141 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %140, i32 0, i32 1
  %142 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %141, i32 0, i32 0
  store i64 %139, i64* %142, align 8
  %143 = load i32, i32* %11, align 4
  %144 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %145 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %144, i32 0, i32 1
  %146 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %145, i32 0, i32 1
  store i32 %143, i32* %146, align 8
  %147 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %148 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %147, i32 0, i32 3
  %149 = load i32, i32* %148, align 4
  %150 = add i32 %149, -1
  store i32 %150, i32* %148, align 4
  store i32 1, i32* %3, align 4
  br label %151

; <label>:151:                                    ; preds = %121, %90, %34
  %152 = load i32, i32* %3, align 4
  ret i32 %152
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @decode_mcu_AC_refine(%struct.jpeg_decompress_struct*, [64 x i16]**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca [64 x i16]**, align 8
  %6 = alloca %struct.phuff_entropy_decoder*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [64 x i16]*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  %18 = alloca %struct.bitread_working_state, align 8
  %19 = alloca %struct.d_derived_tbl*, align 8
  %20 = alloca i32, align 4
  %21 = alloca [64 x i32], align 16
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store [64 x i16]** %1, [64 x i16]*** %5, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 79
  %27 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %26, align 8
  %28 = bitcast %struct.jpeg_entropy_decoder* %27 to %struct.phuff_entropy_decoder*
  store %struct.phuff_entropy_decoder* %28, %struct.phuff_entropy_decoder** %6, align 8
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 69
  %31 = load i32, i32* %30, align 8
  store i32 %31, i32* %7, align 4
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 71
  %34 = load i32, i32* %33, align 8
  %35 = shl i32 1, %34
  store i32 %35, i32* %8, align 4
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 71
  %38 = load i32, i32* %37, align 8
  %39 = shl i32 -1, %38
  store i32 %39, i32* %9, align 4
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %40, i32 0, i32 49
  %42 = load i32, i32* %41, align 8
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %59

; <label>:44:                                     ; preds = %2
  %45 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %46 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %45, i32 0, i32 3
  %47 = load i32, i32* %46, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %57

; <label>:49:                                     ; preds = %44
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %51 = call i32 @process_restart(%struct.jpeg_decompress_struct* %50)
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %55, label %53

; <label>:53:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 28)
  %54 = add i64 %pgocount, 1
  store i64 %54, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 28)
  store i32 0, i32* %3, align 4
  br label %525

; <label>:55:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 27)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 27)
  br label %57

; <label>:57:                                     ; preds = %55, %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 14)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 14)
  br label %59

; <label>:59:                                     ; preds = %57, %2
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %61 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 5
  store %struct.jpeg_decompress_struct* %60, %struct.jpeg_decompress_struct** %61, align 8
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 5
  %64 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %64, i32 0, i32 0
  %66 = load i8*, i8** %65, align 8
  %67 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 0
  store i8* %66, i8** %67, align 8
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %68, i32 0, i32 5
  %70 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %69, align 8
  %71 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %70, i32 0, i32 1
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 1
  store i64 %72, i64* %73, align 8
  %74 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %74, i32 0, i32 72
  %76 = load i32, i32* %75, align 4
  %77 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 2
  store i32 %76, i32* %77, align 8
  %78 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %79 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %78, i32 0, i32 1
  %80 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %79, i32 0, i32 0
  %81 = load i64, i64* %80, align 8
  store i64 %81, i64* %16, align 8
  %82 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %83 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %82, i32 0, i32 1
  %84 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %83, i32 0, i32 1
  %85 = load i32, i32* %84, align 8
  store i32 %85, i32* %17, align 4
  %86 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %87 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %86, i32 0, i32 1
  %88 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %87, i32 0, i32 2
  %89 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 6
  store i32* %88, i32** %89, align 8
  %90 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %91 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %90, i32 0, i32 2
  %92 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %91, i32 0, i32 0
  %93 = load i32, i32* %92, align 8
  store i32 %93, i32* %13, align 4
  %94 = load [64 x i16]**, [64 x i16]*** %5, align 8
  %95 = getelementptr inbounds [64 x i16]*, [64 x i16]** %94, i64 0
  %96 = load [64 x i16]*, [64 x i16]** %95, align 8
  store [64 x i16]* %96, [64 x i16]** %14, align 8
  %97 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %98 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %97, i32 0, i32 5
  %99 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %98, align 8
  store %struct.d_derived_tbl* %99, %struct.d_derived_tbl** %19, align 8
  store i32 0, i32* %20, align 4
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %100, i32 0, i32 68
  %102 = load i32, i32* %101, align 4
  store i32 %102, i32* %11, align 4
  %103 = load i32, i32* %13, align 4
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %388

; <label>:105:                                    ; preds = %59
  br label %106

; <label>:106:                                    ; preds = %383, %105
  %107 = load i32, i32* %11, align 4
  %108 = load i32, i32* %7, align 4
  %109 = icmp sle i32 %107, %108
  br i1 %109, label %110, label %386

; <label>:110:                                    ; preds = %106
  %111 = load i32, i32* %17, align 4
  %112 = icmp slt i32 %111, 8
  br i1 %112, label %113, label %131

; <label>:113:                                    ; preds = %110
  %114 = load i64, i64* %16, align 8
  %115 = load i32, i32* %17, align 4
  %116 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %18, i64 %114, i32 %115, i32 0)
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %120, label %118

; <label>:118:                                    ; preds = %113
  %pgocount3 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 32)
  %119 = add i64 %pgocount3, 1
  store i64 %119, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 32)
  br label %510

; <label>:120:                                    ; preds = %113
  %121 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 3
  %122 = load i64, i64* %121, align 8
  store i64 %122, i64* %16, align 8
  %123 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 4
  %124 = load i32, i32* %123, align 8
  store i32 %124, i32* %17, align 4
  %125 = load i32, i32* %17, align 4
  %126 = icmp slt i32 %125, 8
  br i1 %126, label %127, label %129

; <label>:127:                                    ; preds = %120
  %pgocount4 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 21)
  %128 = add i64 %pgocount4, 1
  store i64 %128, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 21)
  store i32 1, i32* %22, align 4
  br label %159

; <label>:129:                                    ; preds = %120
  %pgocount5 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 22)
  %130 = add i64 %pgocount5, 1
  store i64 %130, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 22)
  br label %131

; <label>:131:                                    ; preds = %129, %110
  %132 = load i64, i64* %16, align 8
  %133 = load i32, i32* %17, align 4
  %134 = sub nsw i32 %133, 8
  %135 = zext i32 %134 to i64
  %136 = ashr i64 %132, %135
  %137 = trunc i64 %136 to i32
  %138 = and i32 %137, 255
  store i32 %138, i32* %23, align 4
  %139 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %19, align 8
  %140 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %139, i32 0, i32 4
  %141 = load i32, i32* %23, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [256 x i32], [256 x i32]* %140, i64 0, i64 %142
  %144 = load i32, i32* %143, align 4
  store i32 %144, i32* %22, align 4
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %157

; <label>:146:                                    ; preds = %131
  %147 = load i32, i32* %22, align 4
  %148 = load i32, i32* %17, align 4
  %149 = sub nsw i32 %148, %147
  store i32 %149, i32* %17, align 4
  %150 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %19, align 8
  %151 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %150, i32 0, i32 5
  %152 = load i32, i32* %23, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [256 x i8], [256 x i8]* %151, i64 0, i64 %153
  %155 = load i8, i8* %154, align 1
  %156 = zext i8 %155 to i32
  store i32 %156, i32* %10, align 4
  br label %173

; <label>:157:                                    ; preds = %131
  %pgocount6 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 20)
  %158 = add i64 %pgocount6, 1
  store i64 %158, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 20)
  store i32 9, i32* %22, align 4
  br label %159

; <label>:159:                                    ; preds = %157, %127
  %160 = load i64, i64* %16, align 8
  %161 = load i32, i32* %17, align 4
  %162 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %19, align 8
  %163 = load i32, i32* %22, align 4
  %164 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* %18, i64 %160, i32 %161, %struct.d_derived_tbl* %162, i32 %163)
  store i32 %164, i32* %10, align 4
  %165 = icmp slt i32 %164, 0
  br i1 %165, label %166, label %168

; <label>:166:                                    ; preds = %159
  %pgocount7 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 31)
  %167 = add i64 %pgocount7, 1
  store i64 %167, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 31)
  br label %510

; <label>:168:                                    ; preds = %159
  %169 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 3
  %170 = load i64, i64* %169, align 8
  store i64 %170, i64* %16, align 8
  %171 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 4
  %172 = load i32, i32* %171, align 8
  store i32 %172, i32* %17, align 4
  br label %173

; <label>:173:                                    ; preds = %168, %146
  %174 = load i32, i32* %10, align 4
  %175 = ashr i32 %174, 4
  store i32 %175, i32* %12, align 4
  %176 = load i32, i32* %10, align 4
  %177 = and i32 %176, 15
  store i32 %177, i32* %10, align 4
  %178 = load i32, i32* %10, align 4
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %229

; <label>:180:                                    ; preds = %173
  %181 = load i32, i32* %10, align 4
  %182 = icmp ne i32 %181, 1
  br i1 %182, label %183, label %197

; <label>:183:                                    ; preds = %180
  %pgocount8 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 15)
  %184 = add i64 %pgocount8, 1
  store i64 %184, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 15)
  %185 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %186 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %185, i32 0, i32 0
  %187 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %186, align 8
  %188 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %187, i32 0, i32 5
  store i32 114, i32* %188, align 8
  %189 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %190 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %189, i32 0, i32 0
  %191 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %190, align 8
  %192 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %191, i32 0, i32 1
  %193 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %192, align 8
  %194 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %195 = bitcast %struct.jpeg_decompress_struct* %194 to %struct.jpeg_common_struct*
  %196 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %193 to i64
  call void @__llvm_profile_instrument_target(i64 %196, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_mcu_AC_refine to i8*), i32 0)
  call void %193(%struct.jpeg_common_struct* %195, i32 -1)
  br label %197

; <label>:197:                                    ; preds = %183, %180
  %198 = load i32, i32* %17, align 4
  %199 = icmp slt i32 %198, 1
  br i1 %199, label %200, label %213

; <label>:200:                                    ; preds = %197
  %201 = load i64, i64* %16, align 8
  %202 = load i32, i32* %17, align 4
  %203 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %18, i64 %201, i32 %202, i32 1)
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %207, label %205

; <label>:205:                                    ; preds = %200
  %pgocount9 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 34)
  %206 = add i64 %pgocount9, 1
  store i64 %206, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 34)
  br label %510

; <label>:207:                                    ; preds = %200
  %pgocount10 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 24)
  %208 = add i64 %pgocount10, 1
  store i64 %208, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 24)
  %209 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 3
  %210 = load i64, i64* %209, align 8
  store i64 %210, i64* %16, align 8
  %211 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 4
  %212 = load i32, i32* %211, align 8
  store i32 %212, i32* %17, align 4
  br label %213

; <label>:213:                                    ; preds = %207, %197
  %214 = load i64, i64* %16, align 8
  %215 = load i32, i32* %17, align 4
  %216 = sub nsw i32 %215, 1
  store i32 %216, i32* %17, align 4
  %217 = zext i32 %216 to i64
  %218 = ashr i64 %214, %217
  %219 = trunc i64 %218 to i32
  %220 = and i32 %219, 1
  %221 = icmp ne i32 %220, 0
  br i1 %221, label %222, label %225

; <label>:222:                                    ; preds = %213
  %pgocount11 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 18)
  %223 = add i64 %pgocount11, 1
  store i64 %223, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 18)
  %224 = load i32, i32* %8, align 4
  store i32 %224, i32* %10, align 4
  br label %228

; <label>:225:                                    ; preds = %213
  %pgocount12 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 19)
  %226 = add i64 %pgocount12, 1
  store i64 %226, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 19)
  %227 = load i32, i32* %9, align 4
  store i32 %227, i32* %10, align 4
  br label %228

; <label>:228:                                    ; preds = %225, %222
  br label %275

; <label>:229:                                    ; preds = %173
  %230 = load i32, i32* %12, align 4
  %231 = icmp ne i32 %230, 15
  br i1 %231, label %232, label %273

; <label>:232:                                    ; preds = %229
  %233 = load i32, i32* %12, align 4
  %234 = shl i32 1, %233
  store i32 %234, i32* %13, align 4
  %235 = load i32, i32* %12, align 4
  %236 = icmp ne i32 %235, 0
  br i1 %236, label %237, label %271

; <label>:237:                                    ; preds = %232
  %238 = load i32, i32* %17, align 4
  %239 = load i32, i32* %12, align 4
  %240 = icmp slt i32 %238, %239
  br i1 %240, label %241, label %255

; <label>:241:                                    ; preds = %237
  %242 = load i64, i64* %16, align 8
  %243 = load i32, i32* %17, align 4
  %244 = load i32, i32* %12, align 4
  %245 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %18, i64 %242, i32 %243, i32 %244)
  %246 = icmp ne i32 %245, 0
  br i1 %246, label %249, label %247

; <label>:247:                                    ; preds = %241
  %pgocount13 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 37)
  %248 = add i64 %pgocount13, 1
  store i64 %248, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 37)
  br label %510

; <label>:249:                                    ; preds = %241
  %pgocount14 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 36)
  %250 = add i64 %pgocount14, 1
  store i64 %250, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 36)
  %251 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 3
  %252 = load i64, i64* %251, align 8
  store i64 %252, i64* %16, align 8
  %253 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 4
  %254 = load i32, i32* %253, align 8
  store i32 %254, i32* %17, align 4
  br label %255

; <label>:255:                                    ; preds = %249, %237
  %pgocount15 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 35)
  %256 = add i64 %pgocount15, 1
  store i64 %256, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 35)
  %257 = load i64, i64* %16, align 8
  %258 = load i32, i32* %12, align 4
  %259 = load i32, i32* %17, align 4
  %260 = sub nsw i32 %259, %258
  store i32 %260, i32* %17, align 4
  %261 = zext i32 %260 to i64
  %262 = ashr i64 %257, %261
  %263 = trunc i64 %262 to i32
  %264 = load i32, i32* %12, align 4
  %265 = shl i32 1, %264
  %266 = sub nsw i32 %265, 1
  %267 = and i32 %263, %266
  store i32 %267, i32* %12, align 4
  %268 = load i32, i32* %12, align 4
  %269 = load i32, i32* %13, align 4
  %270 = add i32 %269, %268
  store i32 %270, i32* %13, align 4
  br label %271

; <label>:271:                                    ; preds = %255, %232
  %pgocount16 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 33)
  %272 = add i64 %pgocount16, 1
  store i64 %272, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 33)
  br label %386

; <label>:273:                                    ; preds = %229
  %pgocount17 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 13)
  %274 = add i64 %pgocount17, 1
  store i64 %274, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 13)
  br label %275

; <label>:275:                                    ; preds = %273, %228
  br label %276

; <label>:276:                                    ; preds = %358, %275
  %277 = load [64 x i16]*, [64 x i16]** %14, align 8
  %278 = getelementptr inbounds [64 x i16], [64 x i16]* %277, i32 0, i32 0
  %279 = load i32, i32* %11, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %280
  %282 = load i32, i32* %281, align 4
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds i16, i16* %278, i64 %283
  store i16* %284, i16** %15, align 8
  %285 = load i16*, i16** %15, align 8
  %286 = load i16, i16* %285, align 2
  %287 = sext i16 %286 to i32
  %288 = icmp ne i32 %287, 0
  br i1 %288, label %289, label %347

; <label>:289:                                    ; preds = %276
  %290 = load i32, i32* %17, align 4
  %291 = icmp slt i32 %290, 1
  br i1 %291, label %292, label %305

; <label>:292:                                    ; preds = %289
  %293 = load i64, i64* %16, align 8
  %294 = load i32, i32* %17, align 4
  %295 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %18, i64 %293, i32 %294, i32 1)
  %296 = icmp ne i32 %295, 0
  br i1 %296, label %299, label %297

; <label>:297:                                    ; preds = %292
  %pgocount18 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 26)
  %298 = add i64 %pgocount18, 1
  store i64 %298, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 26)
  br label %510

; <label>:299:                                    ; preds = %292
  %pgocount19 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 5)
  %300 = add i64 %pgocount19, 1
  store i64 %300, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 5)
  %301 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 3
  %302 = load i64, i64* %301, align 8
  store i64 %302, i64* %16, align 8
  %303 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 4
  %304 = load i32, i32* %303, align 8
  store i32 %304, i32* %17, align 4
  br label %305

; <label>:305:                                    ; preds = %299, %289
  %306 = load i64, i64* %16, align 8
  %307 = load i32, i32* %17, align 4
  %308 = sub nsw i32 %307, 1
  store i32 %308, i32* %17, align 4
  %309 = zext i32 %308 to i64
  %310 = ashr i64 %306, %309
  %311 = trunc i64 %310 to i32
  %312 = and i32 %311, 1
  %313 = icmp ne i32 %312, 0
  br i1 %313, label %314, label %345

; <label>:314:                                    ; preds = %305
  %315 = load i16*, i16** %15, align 8
  %316 = load i16, i16* %315, align 2
  %317 = sext i16 %316 to i32
  %318 = load i32, i32* %8, align 4
  %319 = and i32 %317, %318
  %320 = icmp eq i32 %319, 0
  br i1 %320, label %321, label %343

; <label>:321:                                    ; preds = %314
  %322 = load i16*, i16** %15, align 8
  %323 = load i16, i16* %322, align 2
  %324 = sext i16 %323 to i32
  %325 = icmp sge i32 %324, 0
  br i1 %325, label %326, label %334

; <label>:326:                                    ; preds = %321
  %pgocount20 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 9)
  %327 = add i64 %pgocount20, 1
  store i64 %327, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 9)
  %328 = load i32, i32* %8, align 4
  %329 = load i16*, i16** %15, align 8
  %330 = load i16, i16* %329, align 2
  %331 = sext i16 %330 to i32
  %332 = add nsw i32 %331, %328
  %333 = trunc i32 %332 to i16
  store i16 %333, i16* %329, align 2
  br label %342

; <label>:334:                                    ; preds = %321
  %pgocount21 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 10)
  %335 = add i64 %pgocount21, 1
  store i64 %335, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 10)
  %336 = load i32, i32* %9, align 4
  %337 = load i16*, i16** %15, align 8
  %338 = load i16, i16* %337, align 2
  %339 = sext i16 %338 to i32
  %340 = add nsw i32 %339, %336
  %341 = trunc i32 %340 to i16
  store i16 %341, i16* %337, align 2
  br label %342

; <label>:342:                                    ; preds = %334, %326
  br label %343

; <label>:343:                                    ; preds = %342, %314
  %pgocount22 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 3)
  %344 = add i64 %pgocount22, 1
  store i64 %344, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 3)
  br label %345

; <label>:345:                                    ; preds = %343, %305
  %pgocount23 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 0)
  %346 = add i64 %pgocount23, 1
  store i64 %346, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 0)
  br label %355

; <label>:347:                                    ; preds = %276
  %348 = load i32, i32* %12, align 4
  %349 = add nsw i32 %348, -1
  store i32 %349, i32* %12, align 4
  %350 = icmp slt i32 %349, 0
  br i1 %350, label %351, label %353

; <label>:351:                                    ; preds = %347
  %pgocount24 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 23)
  %352 = add i64 %pgocount24, 1
  store i64 %352, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 23)
  br label %362

; <label>:353:                                    ; preds = %347
  %pgocount25 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 1)
  %354 = add i64 %pgocount25, 1
  store i64 %354, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 1)
  br label %355

; <label>:355:                                    ; preds = %353, %345
  %356 = load i32, i32* %11, align 4
  %357 = add nsw i32 %356, 1
  store i32 %357, i32* %11, align 4
  br label %358

; <label>:358:                                    ; preds = %355
  %359 = load i32, i32* %11, align 4
  %360 = load i32, i32* %7, align 4
  %361 = icmp sle i32 %359, %360
  br i1 %361, label %276, label %362

; <label>:362:                                    ; preds = %358, %351
  %363 = load i32, i32* %10, align 4
  %364 = icmp ne i32 %363, 0
  br i1 %364, label %365, label %382

; <label>:365:                                    ; preds = %362
  %pgocount26 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 11)
  %366 = add i64 %pgocount26, 1
  store i64 %366, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 11)
  %367 = load i32, i32* %11, align 4
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %368
  %370 = load i32, i32* %369, align 4
  store i32 %370, i32* %24, align 4
  %371 = load i32, i32* %10, align 4
  %372 = trunc i32 %371 to i16
  %373 = load [64 x i16]*, [64 x i16]** %14, align 8
  %374 = load i32, i32* %24, align 4
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds [64 x i16], [64 x i16]* %373, i64 0, i64 %375
  store i16 %372, i16* %376, align 2
  %377 = load i32, i32* %24, align 4
  %378 = load i32, i32* %20, align 4
  %379 = add nsw i32 %378, 1
  store i32 %379, i32* %20, align 4
  %380 = sext i32 %378 to i64
  %381 = getelementptr inbounds [64 x i32], [64 x i32]* %21, i64 0, i64 %380
  store i32 %377, i32* %381, align 4
  br label %382

; <label>:382:                                    ; preds = %365, %362
  br label %383

; <label>:383:                                    ; preds = %382
  %384 = load i32, i32* %11, align 4
  %385 = add nsw i32 %384, 1
  store i32 %385, i32* %11, align 4
  br label %106

; <label>:386:                                    ; preds = %271, %106
  %pgocount27 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 29)
  %387 = add i64 %pgocount27, 1
  store i64 %387, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 29)
  br label %388

; <label>:388:                                    ; preds = %386, %59
  %389 = load i32, i32* %13, align 4
  %390 = icmp ugt i32 %389, 0
  br i1 %390, label %391, label %476

; <label>:391:                                    ; preds = %388
  br label %392

; <label>:392:                                    ; preds = %468, %391
  %393 = load i32, i32* %11, align 4
  %394 = load i32, i32* %7, align 4
  %395 = icmp sle i32 %393, %394
  br i1 %395, label %396, label %472

; <label>:396:                                    ; preds = %392
  %397 = load [64 x i16]*, [64 x i16]** %14, align 8
  %398 = getelementptr inbounds [64 x i16], [64 x i16]* %397, i32 0, i32 0
  %399 = load i32, i32* %11, align 4
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %400
  %402 = load i32, i32* %401, align 4
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds i16, i16* %398, i64 %403
  store i16* %404, i16** %15, align 8
  %405 = load i16*, i16** %15, align 8
  %406 = load i16, i16* %405, align 2
  %407 = sext i16 %406 to i32
  %408 = icmp ne i32 %407, 0
  br i1 %408, label %409, label %467

; <label>:409:                                    ; preds = %396
  %410 = load i32, i32* %17, align 4
  %411 = icmp slt i32 %410, 1
  br i1 %411, label %412, label %425

; <label>:412:                                    ; preds = %409
  %413 = load i64, i64* %16, align 8
  %414 = load i32, i32* %17, align 4
  %415 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %18, i64 %413, i32 %414, i32 1)
  %416 = icmp ne i32 %415, 0
  br i1 %416, label %419, label %417

; <label>:417:                                    ; preds = %412
  %pgocount28 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 30)
  %418 = add i64 %pgocount28, 1
  store i64 %418, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 30)
  br label %510

; <label>:419:                                    ; preds = %412
  %pgocount29 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 8)
  %420 = add i64 %pgocount29, 1
  store i64 %420, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 8)
  %421 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 3
  %422 = load i64, i64* %421, align 8
  store i64 %422, i64* %16, align 8
  %423 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 4
  %424 = load i32, i32* %423, align 8
  store i32 %424, i32* %17, align 4
  br label %425

; <label>:425:                                    ; preds = %419, %409
  %426 = load i64, i64* %16, align 8
  %427 = load i32, i32* %17, align 4
  %428 = sub nsw i32 %427, 1
  store i32 %428, i32* %17, align 4
  %429 = zext i32 %428 to i64
  %430 = ashr i64 %426, %429
  %431 = trunc i64 %430 to i32
  %432 = and i32 %431, 1
  %433 = icmp ne i32 %432, 0
  br i1 %433, label %434, label %465

; <label>:434:                                    ; preds = %425
  %435 = load i16*, i16** %15, align 8
  %436 = load i16, i16* %435, align 2
  %437 = sext i16 %436 to i32
  %438 = load i32, i32* %8, align 4
  %439 = and i32 %437, %438
  %440 = icmp eq i32 %439, 0
  br i1 %440, label %441, label %463

; <label>:441:                                    ; preds = %434
  %442 = load i16*, i16** %15, align 8
  %443 = load i16, i16* %442, align 2
  %444 = sext i16 %443 to i32
  %445 = icmp sge i32 %444, 0
  br i1 %445, label %446, label %454

; <label>:446:                                    ; preds = %441
  %pgocount30 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 16)
  %447 = add i64 %pgocount30, 1
  store i64 %447, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 16)
  %448 = load i32, i32* %8, align 4
  %449 = load i16*, i16** %15, align 8
  %450 = load i16, i16* %449, align 2
  %451 = sext i16 %450 to i32
  %452 = add nsw i32 %451, %448
  %453 = trunc i32 %452 to i16
  store i16 %453, i16* %449, align 2
  br label %462

; <label>:454:                                    ; preds = %441
  %pgocount31 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 17)
  %455 = add i64 %pgocount31, 1
  store i64 %455, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 17)
  %456 = load i32, i32* %9, align 4
  %457 = load i16*, i16** %15, align 8
  %458 = load i16, i16* %457, align 2
  %459 = sext i16 %458 to i32
  %460 = add nsw i32 %459, %456
  %461 = trunc i32 %460 to i16
  store i16 %461, i16* %457, align 2
  br label %462

; <label>:462:                                    ; preds = %454, %446
  br label %463

; <label>:463:                                    ; preds = %462, %434
  %pgocount32 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 7)
  %464 = add i64 %pgocount32, 1
  store i64 %464, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 7)
  br label %465

; <label>:465:                                    ; preds = %463, %425
  %pgocount33 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 6)
  %466 = add i64 %pgocount33, 1
  store i64 %466, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 6)
  br label %467

; <label>:467:                                    ; preds = %465, %396
  br label %468

; <label>:468:                                    ; preds = %467
  %pgocount34 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 4)
  %469 = add i64 %pgocount34, 1
  store i64 %469, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 4)
  %470 = load i32, i32* %11, align 4
  %471 = add nsw i32 %470, 1
  store i32 %471, i32* %11, align 4
  br label %392

; <label>:472:                                    ; preds = %392
  %pgocount35 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 25)
  %473 = add i64 %pgocount35, 1
  store i64 %473, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 25)
  %474 = load i32, i32* %13, align 4
  %475 = add i32 %474, -1
  store i32 %475, i32* %13, align 4
  br label %476

; <label>:476:                                    ; preds = %472, %388
  %pgocount36 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 12)
  %477 = add i64 %pgocount36, 1
  store i64 %477, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 12)
  %478 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 0
  %479 = load i8*, i8** %478, align 8
  %480 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %481 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %480, i32 0, i32 5
  %482 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %481, align 8
  %483 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %482, i32 0, i32 0
  store i8* %479, i8** %483, align 8
  %484 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 1
  %485 = load i64, i64* %484, align 8
  %486 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %487 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %486, i32 0, i32 5
  %488 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %487, align 8
  %489 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %488, i32 0, i32 1
  store i64 %485, i64* %489, align 8
  %490 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %18, i32 0, i32 2
  %491 = load i32, i32* %490, align 8
  %492 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %493 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %492, i32 0, i32 72
  store i32 %491, i32* %493, align 4
  %494 = load i64, i64* %16, align 8
  %495 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %496 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %495, i32 0, i32 1
  %497 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %496, i32 0, i32 0
  store i64 %494, i64* %497, align 8
  %498 = load i32, i32* %17, align 4
  %499 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %500 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %499, i32 0, i32 1
  %501 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %500, i32 0, i32 1
  store i32 %498, i32* %501, align 8
  %502 = load i32, i32* %13, align 4
  %503 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %504 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %503, i32 0, i32 2
  %505 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %504, i32 0, i32 0
  store i32 %502, i32* %505, align 8
  %506 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %6, align 8
  %507 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %506, i32 0, i32 3
  %508 = load i32, i32* %507, align 4
  %509 = add i32 %508, -1
  store i32 %509, i32* %507, align 4
  store i32 1, i32* %3, align 4
  br label %525

; <label>:510:                                    ; preds = %417, %297, %247, %205, %166, %118
  br label %511

; <label>:511:                                    ; preds = %514, %510
  %512 = load i32, i32* %20, align 4
  %513 = icmp sgt i32 %512, 0
  br i1 %513, label %514, label %524

; <label>:514:                                    ; preds = %511
  %pgocount37 = load i64, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 2)
  %515 = add i64 %pgocount37, 1
  store i64 %515, i64* getelementptr inbounds ([38 x i64], [38 x i64]* @__profc_tmp1.ll_decode_mcu_AC_refine, i64 0, i64 2)
  %516 = load [64 x i16]*, [64 x i16]** %14, align 8
  %517 = load i32, i32* %20, align 4
  %518 = add nsw i32 %517, -1
  store i32 %518, i32* %20, align 4
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds [64 x i32], [64 x i32]* %21, i64 0, i64 %519
  %521 = load i32, i32* %520, align 4
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds [64 x i16], [64 x i16]* %516, i64 0, i64 %522
  store i16 0, i16* %523, align 2
  br label %511

; <label>:524:                                    ; preds = %511
  store i32 0, i32* %3, align 4
  br label %525

; <label>:525:                                    ; preds = %524, %476, %53
  %526 = load i32, i32* %3, align 4
  ret i32 %526
}

declare void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct*, %struct.JHUFF_TBL*, %struct.d_derived_tbl**) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @process_restart(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.phuff_entropy_decoder*, align 8
  %5 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 79
  %8 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %7, align 8
  %9 = bitcast %struct.jpeg_entropy_decoder* %8 to %struct.phuff_entropy_decoder*
  store %struct.phuff_entropy_decoder* %9, %struct.phuff_entropy_decoder** %4, align 8
  %10 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %4, align 8
  %11 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %10, i32 0, i32 1
  %12 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 8
  %14 = sdiv i32 %13, 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 78
  %17 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %17, i32 0, i32 8
  %19 = load i32, i32* %18, align 4
  %20 = add i32 %19, %14
  store i32 %20, i32* %18, align 4
  %21 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %4, align 8
  %22 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %21, i32 0, i32 1
  %23 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %22, i32 0, i32 1
  store i32 0, i32* %23, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 78
  %26 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %26, i32 0, i32 2
  %28 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %27, align 8
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %30 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %28 to i64
  call void @__llvm_profile_instrument_target(i64 %30, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_restart to i8*), i32 0)
  %31 = call i32 %28(%struct.jpeg_decompress_struct* %29)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %35, label %33

; <label>:33:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_process_restart, i64 0, i64 2)
  %34 = add i64 %pgocount, 1
  store i64 %34, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_process_restart, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %66

; <label>:35:                                     ; preds = %1
  store i32 0, i32* %5, align 4
  br label %36

; <label>:36:                                     ; preds = %50, %35
  %37 = load i32, i32* %5, align 4
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 62
  %40 = load i32, i32* %39, align 8
  %41 = icmp slt i32 %37, %40
  br i1 %41, label %42, label %53

; <label>:42:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_process_restart, i64 0, i64 0)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_process_restart, i64 0, i64 0)
  %44 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %4, align 8
  %45 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %44, i32 0, i32 2
  %46 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %45, i32 0, i32 1
  %47 = load i32, i32* %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [4 x i32], [4 x i32]* %46, i64 0, i64 %48
  store i32 0, i32* %49, align 4
  br label %50

; <label>:50:                                     ; preds = %42
  %51 = load i32, i32* %5, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %5, align 4
  br label %36

; <label>:53:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_process_restart, i64 0, i64 1)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_process_restart, i64 0, i64 1)
  %55 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %4, align 8
  %56 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %55, i32 0, i32 2
  %57 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %56, i32 0, i32 0
  store i32 0, i32* %57, align 8
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 49
  %60 = load i32, i32* %59, align 8
  %61 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %4, align 8
  %62 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %61, i32 0, i32 3
  store i32 %60, i32* %62, align 4
  %63 = load %struct.phuff_entropy_decoder*, %struct.phuff_entropy_decoder** %4, align 8
  %64 = getelementptr inbounds %struct.phuff_entropy_decoder, %struct.phuff_entropy_decoder* %63, i32 0, i32 1
  %65 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %64, i32 0, i32 2
  store i32 0, i32* %65, align 4
  store i32 1, i32* %2, align 4
  br label %66

; <label>:66:                                     ; preds = %53, %33
  %67 = load i32, i32* %2, align 4
  ret i32 %67
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state*, i64, i32, i32) #1

declare i32 @jpeg_huff_decode(%struct.bitread_working_state*, i64, i32, %struct.d_derived_tbl*, i32) #1

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
