; ModuleID = 'jdmaster.2.ll'
source_filename = "jdmaster.c"
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
%struct.my_decomp_master = type { %struct.jpeg_decomp_master, i32, i32, %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_calc_output_dimensions = private constant [27 x i8] c"jpeg_calc_output_dimensions"
@__profn_tmp1.ll_use_merged_upsample = private constant [27 x i8] c"tmp1.ll:use_merged_upsample"
@__profn_jpeg_new_colormap = private constant [17 x i8] c"jpeg_new_colormap"
@__profn_jinit_master_decompress = private constant [23 x i8] c"jinit_master_decompress"
@__profn_tmp1.ll_prepare_for_output_pass = private constant [31 x i8] c"tmp1.ll:prepare_for_output_pass"
@__profn_tmp1.ll_finish_output_pass = private constant [26 x i8] c"tmp1.ll:finish_output_pass"
@__profn_tmp1.ll_master_selection = private constant [24 x i8] c"tmp1.ll:master_selection"
@__profn_tmp1.ll_prepare_range_limit_table = private constant [33 x i8] c"tmp1.ll:prepare_range_limit_table"
@__profc_jpeg_calc_output_dimensions = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_calc_output_dimensions = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_calc_output_dimensions = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4590333336821278899, i64 281708318305304, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jpeg_calc_output_dimensions to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_calc_output_dimensions to i8*), i32 17, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_use_merged_upsample = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_use_merged_upsample = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2856031351251286294, i64 162839384590, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_new_colormap = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_new_colormap = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_new_colormap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5725094973259907513, i64 844484934045538, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jpeg_new_colormap to i8*), i8* bitcast ([3 x i64]* @__profvp_jpeg_new_colormap to i8*), i32 5, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_jinit_master_decompress = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_master_decompress = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_master_decompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1444773058725863813, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_master_decompress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_master_decompress to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_master_decompress to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_prepare_for_output_pass = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_prepare_for_output_pass = private global [11 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_prepare_for_output_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5858923052188130326, i64 219269172932604171, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @prepare_for_output_pass to i8*), i8* bitcast ([11 x i64]* @__profvp_tmp1.ll_prepare_for_output_pass to i8*), i32 16, [1 x i16] [i16 11] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_output_pass = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_finish_output_pass = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_finish_output_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7430877992541018872, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @finish_output_pass to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_finish_output_pass to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_master_selection = private global [23 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_master_selection = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_master_selection = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7233108629843755959, i64 73465264771858429, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i32 0, i32 0), i8* null, i8* bitcast ([5 x i64]* @__profvp_tmp1.ll_master_selection to i8*), i32 23, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_prepare_range_limit_table = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_prepare_range_limit_table = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_prepare_range_limit_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6851147684187884227, i64 281527005615002, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_prepare_range_limit_table, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_prepare_range_limit_table to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [23 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [218 x i8] c"\D7\01\00jpeg_calc_output_dimensions\01tmp1.ll:use_merged_upsample\01jpeg_new_colormap\01jinit_master_decompress\01tmp1.ll:prepare_for_output_pass\01tmp1.ll:finish_output_pass\01tmp1.ll:master_selection\01tmp1.ll:prepare_range_limit_table", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_calc_output_dimensions to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_use_merged_upsample to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_new_colormap to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_master_decompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_master_selection to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_range_limit_table to i8*), i8* bitcast ([23 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([218 x i8], [218 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_component_info*, align 8
  %5 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 4
  %8 = load i32, i32* %7, align 4
  %9 = icmp ne i32 %8, 202
  br i1 %9, label %10, label %33

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 7)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 7)
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 0
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i32 0, i32 5
  store i32 18, i32* %15, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 4
  %18 = load i32, i32* %17, align 4
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 6
  %23 = bitcast %union.anon* %22 to [8 x i32]*
  %24 = getelementptr inbounds [8 x i32], [8 x i32]* %23, i64 0, i64 0
  store i32 %18, i32* %24, align 4
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 0
  %29 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %28, align 8
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %31 = bitcast %struct.jpeg_decompress_struct* %30 to %struct.jpeg_common_struct*
  %32 = ptrtoint void (%struct.jpeg_common_struct*)* %29 to i64
  call void @__llvm_profile_instrument_target(i64 %32, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_calc_output_dimensions to i8*), i32 0)
  call void %29(%struct.jpeg_common_struct* %31)
  br label %33

; <label>:33:                                     ; preds = %10, %1
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 11
  %36 = load i32, i32* %35, align 4
  %37 = mul i32 %36, 8
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 12
  %40 = load i32, i32* %39, align 8
  %41 = icmp ule i32 %37, %40
  br i1 %41, label %42, label %61

; <label>:42:                                     ; preds = %33
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %43, i32 0, i32 6
  %45 = load i32, i32* %44, align 8
  %46 = zext i32 %45 to i64
  %47 = call i64 @jdiv_round_up(i64 %46, i64 8)
  %48 = trunc i64 %47 to i32
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %49, i32 0, i32 26
  store i32 %48, i32* %50, align 8
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 7
  %53 = load i32, i32* %52, align 4
  %54 = zext i32 %53 to i64
  %55 = call i64 @jdiv_round_up(i64 %54, i64 8)
  %56 = trunc i64 %55 to i32
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 27
  store i32 %56, i32* %58, align 4
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 59
  store i32 1, i32* %60, align 4
  br label %135

; <label>:61:                                     ; preds = %33
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 11
  %64 = load i32, i32* %63, align 4
  %65 = mul i32 %64, 4
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 12
  %68 = load i32, i32* %67, align 8
  %69 = icmp ule i32 %65, %68
  br i1 %69, label %70, label %90

; <label>:70:                                     ; preds = %61
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 12)
  %71 = add i64 %pgocount2, 1
  store i64 %71, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 12)
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 6
  %74 = load i32, i32* %73, align 8
  %75 = zext i32 %74 to i64
  %76 = call i64 @jdiv_round_up(i64 %75, i64 4)
  %77 = trunc i64 %76 to i32
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 26
  store i32 %77, i32* %79, align 8
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %81 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %80, i32 0, i32 7
  %82 = load i32, i32* %81, align 4
  %83 = zext i32 %82 to i64
  %84 = call i64 @jdiv_round_up(i64 %83, i64 4)
  %85 = trunc i64 %84 to i32
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %86, i32 0, i32 27
  store i32 %85, i32* %87, align 4
  %88 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %88, i32 0, i32 59
  store i32 2, i32* %89, align 4
  br label %134

; <label>:90:                                     ; preds = %61
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 11
  %93 = load i32, i32* %92, align 4
  %94 = mul i32 %93, 2
  %95 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %96 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %95, i32 0, i32 12
  %97 = load i32, i32* %96, align 8
  %98 = icmp ule i32 %94, %97
  br i1 %98, label %99, label %119

; <label>:99:                                     ; preds = %90
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 15)
  %100 = add i64 %pgocount3, 1
  store i64 %100, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 15)
  %101 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %102 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %101, i32 0, i32 6
  %103 = load i32, i32* %102, align 8
  %104 = zext i32 %103 to i64
  %105 = call i64 @jdiv_round_up(i64 %104, i64 2)
  %106 = trunc i64 %105 to i32
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %107, i32 0, i32 26
  store i32 %106, i32* %108, align 8
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 7
  %111 = load i32, i32* %110, align 4
  %112 = zext i32 %111 to i64
  %113 = call i64 @jdiv_round_up(i64 %112, i64 2)
  %114 = trunc i64 %113 to i32
  %115 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %116 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %115, i32 0, i32 27
  store i32 %114, i32* %116, align 4
  %117 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %118 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %117, i32 0, i32 59
  store i32 4, i32* %118, align 4
  br label %133

; <label>:119:                                    ; preds = %90
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 16)
  %120 = add i64 %pgocount4, 1
  store i64 %120, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 16)
  %121 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %122 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %121, i32 0, i32 6
  %123 = load i32, i32* %122, align 8
  %124 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %125 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %124, i32 0, i32 26
  store i32 %123, i32* %125, align 8
  %126 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %127 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %126, i32 0, i32 7
  %128 = load i32, i32* %127, align 4
  %129 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %130 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %129, i32 0, i32 27
  store i32 %128, i32* %130, align 4
  %131 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %132 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %131, i32 0, i32 59
  store i32 8, i32* %132, align 4
  br label %133

; <label>:133:                                    ; preds = %119, %99
  br label %134

; <label>:134:                                    ; preds = %133, %70
  br label %135

; <label>:135:                                    ; preds = %134, %42
  store i32 0, i32* %3, align 4
  %136 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %137 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %136, i32 0, i32 43
  %138 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %137, align 8
  store %struct.jpeg_component_info* %138, %struct.jpeg_component_info** %4, align 8
  br label %139

; <label>:139:                                    ; preds = %194, %135
  %140 = load i32, i32* %3, align 4
  %141 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %142 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %141, i32 0, i32 8
  %143 = load i32, i32* %142, align 8
  %144 = icmp slt i32 %140, %143
  br i1 %144, label %145, label %200

; <label>:145:                                    ; preds = %139
  %146 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %147 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %146, i32 0, i32 59
  %148 = load i32, i32* %147, align 4
  store i32 %148, i32* %5, align 4
  br label %149

; <label>:149:                                    ; preds = %186, %145
  %150 = load i32, i32* %5, align 4
  %151 = icmp slt i32 %150, 8
  br i1 %151, label %152, label %184

; <label>:152:                                    ; preds = %149
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 1)
  %153 = add i64 %pgocount5, 1
  store i64 %153, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 1)
  %154 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %155 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %154, i32 0, i32 2
  %156 = load i32, i32* %155, align 8
  %157 = load i32, i32* %5, align 4
  %158 = mul nsw i32 %156, %157
  %159 = mul nsw i32 %158, 2
  %160 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %161 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %160, i32 0, i32 57
  %162 = load i32, i32* %161, align 4
  %163 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %164 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %163, i32 0, i32 59
  %165 = load i32, i32* %164, align 4
  %166 = mul nsw i32 %162, %165
  %167 = icmp sle i32 %159, %166
  br i1 %167, label %168, label %184

; <label>:168:                                    ; preds = %152
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 2)
  %169 = add i64 %pgocount6, 1
  store i64 %169, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 2)
  %170 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %171 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %170, i32 0, i32 3
  %172 = load i32, i32* %171, align 4
  %173 = load i32, i32* %5, align 4
  %174 = mul nsw i32 %172, %173
  %175 = mul nsw i32 %174, 2
  %176 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %177 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %176, i32 0, i32 58
  %178 = load i32, i32* %177, align 8
  %179 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %180 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %179, i32 0, i32 59
  %181 = load i32, i32* %180, align 4
  %182 = mul nsw i32 %178, %181
  %183 = icmp sle i32 %175, %182
  br label %184

; <label>:184:                                    ; preds = %168, %152, %149
  %185 = phi i1 [ false, %152 ], [ false, %149 ], [ %183, %168 ]
  br i1 %185, label %186, label %190

; <label>:186:                                    ; preds = %184
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 0)
  %187 = add i64 %pgocount7, 1
  store i64 %187, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 0)
  %188 = load i32, i32* %5, align 4
  %189 = mul nsw i32 %188, 2
  store i32 %189, i32* %5, align 4
  br label %149

; <label>:190:                                    ; preds = %184
  %191 = load i32, i32* %5, align 4
  %192 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %193 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %192, i32 0, i32 9
  store i32 %191, i32* %193, align 4
  br label %194

; <label>:194:                                    ; preds = %190
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 5)
  %195 = add i64 %pgocount8, 1
  store i64 %195, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 5)
  %196 = load i32, i32* %3, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, i32* %3, align 4
  %198 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %199 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %198, i32 1
  store %struct.jpeg_component_info* %199, %struct.jpeg_component_info** %4, align 8
  br label %139

; <label>:200:                                    ; preds = %139
  store i32 0, i32* %3, align 4
  %201 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %202 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %201, i32 0, i32 43
  %203 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %202, align 8
  store %struct.jpeg_component_info* %203, %struct.jpeg_component_info** %4, align 8
  br label %204

; <label>:204:                                    ; preds = %255, %200
  %205 = load i32, i32* %3, align 4
  %206 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %207 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %206, i32 0, i32 8
  %208 = load i32, i32* %207, align 8
  %209 = icmp slt i32 %205, %208
  br i1 %209, label %210, label %261

; <label>:210:                                    ; preds = %204
  %211 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %212 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %211, i32 0, i32 6
  %213 = load i32, i32* %212, align 8
  %214 = zext i32 %213 to i64
  %215 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %216 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %215, i32 0, i32 2
  %217 = load i32, i32* %216, align 8
  %218 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %219 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %218, i32 0, i32 9
  %220 = load i32, i32* %219, align 4
  %221 = mul nsw i32 %217, %220
  %222 = sext i32 %221 to i64
  %223 = mul nsw i64 %214, %222
  %224 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %225 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %224, i32 0, i32 57
  %226 = load i32, i32* %225, align 4
  %227 = mul nsw i32 %226, 8
  %228 = sext i32 %227 to i64
  %229 = call i64 @jdiv_round_up(i64 %223, i64 %228)
  %230 = trunc i64 %229 to i32
  %231 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %232 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %231, i32 0, i32 10
  store i32 %230, i32* %232, align 8
  %233 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %234 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %233, i32 0, i32 7
  %235 = load i32, i32* %234, align 4
  %236 = zext i32 %235 to i64
  %237 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %238 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %237, i32 0, i32 3
  %239 = load i32, i32* %238, align 4
  %240 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %241 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %240, i32 0, i32 9
  %242 = load i32, i32* %241, align 4
  %243 = mul nsw i32 %239, %242
  %244 = sext i32 %243 to i64
  %245 = mul nsw i64 %236, %244
  %246 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %247 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %246, i32 0, i32 58
  %248 = load i32, i32* %247, align 8
  %249 = mul nsw i32 %248, 8
  %250 = sext i32 %249 to i64
  %251 = call i64 @jdiv_round_up(i64 %245, i64 %250)
  %252 = trunc i64 %251 to i32
  %253 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %254 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %253, i32 0, i32 11
  store i32 %252, i32* %254, align 4
  br label %255

; <label>:255:                                    ; preds = %210
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 6)
  %256 = add i64 %pgocount9, 1
  store i64 %256, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 6)
  %257 = load i32, i32* %3, align 4
  %258 = add nsw i32 %257, 1
  store i32 %258, i32* %3, align 4
  %259 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %260 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %259, i32 1
  store %struct.jpeg_component_info* %260, %struct.jpeg_component_info** %4, align 8
  br label %204

; <label>:261:                                    ; preds = %204
  %262 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %263 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %262, i32 0, i32 10
  %264 = load i32, i32* %263, align 8
  switch i32 %264, label %279 [
    i32 1, label %267
    i32 2, label %._crit_edge
    i32 3, label %271
    i32 4, label %._crit_edge1
    i32 5, label %275
  ]

._crit_edge1:                                     ; preds = %261
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 4)
  %265 = add i64 %pgocount10, 1
  store i64 %265, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 4)
  br label %275

._crit_edge:                                      ; preds = %261
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 3)
  %266 = add i64 %pgocount11, 1
  store i64 %266, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 3)
  br label %271

; <label>:267:                                    ; preds = %261
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 13)
  %268 = add i64 %pgocount12, 1
  store i64 %268, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 13)
  %269 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %270 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %269, i32 0, i32 28
  store i32 1, i32* %270, align 8
  br label %286

; <label>:271:                                    ; preds = %._crit_edge, %261
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 10)
  %272 = add i64 %pgocount13, 1
  store i64 %272, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 10)
  %273 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %274 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %273, i32 0, i32 28
  store i32 3, i32* %274, align 8
  br label %286

; <label>:275:                                    ; preds = %._crit_edge1, %261
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 11)
  %276 = add i64 %pgocount14, 1
  store i64 %276, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 11)
  %277 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %278 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %277, i32 0, i32 28
  store i32 4, i32* %278, align 8
  br label %286

; <label>:279:                                    ; preds = %261
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 14)
  %280 = add i64 %pgocount15, 1
  store i64 %280, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 14)
  %281 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %282 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %281, i32 0, i32 8
  %283 = load i32, i32* %282, align 8
  %284 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %285 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %284, i32 0, i32 28
  store i32 %283, i32* %285, align 8
  br label %286

; <label>:286:                                    ; preds = %279, %275, %271, %267
  %287 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %288 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %287, i32 0, i32 19
  %289 = load i32, i32* %288, align 4
  %290 = icmp ne i32 %289, 0
  br i1 %290, label %291, label %292

; <label>:291:                                    ; preds = %286
  br label %297

; <label>:292:                                    ; preds = %286
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 8)
  %293 = add i64 %pgocount16, 1
  store i64 %293, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 8)
  %294 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %295 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %294, i32 0, i32 28
  %296 = load i32, i32* %295, align 8
  br label %297

; <label>:297:                                    ; preds = %292, %291
  %298 = phi i32 [ 1, %291 ], [ %296, %292 ]
  %299 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %300 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %299, i32 0, i32 29
  store i32 %298, i32* %300, align 4
  %301 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %302 = call i32 @use_merged_upsample(%struct.jpeg_decompress_struct* %301)
  %303 = icmp ne i32 %302, 0
  br i1 %303, label %304, label %310

; <label>:304:                                    ; preds = %297
  %305 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %306 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %305, i32 0, i32 58
  %307 = load i32, i32* %306, align 8
  %308 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %309 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %308, i32 0, i32 30
  store i32 %307, i32* %309, align 8
  br label %314

; <label>:310:                                    ; preds = %297
  %pgocount17 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 9)
  %311 = add i64 %pgocount17, 1
  store i64 %311, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_jpeg_calc_output_dimensions, i64 0, i64 9)
  %312 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %313 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %312, i32 0, i32 30
  store i32 1, i32* %313, align 8
  br label %314

; <label>:314:                                    ; preds = %310, %304
  ret void
}

declare i64 @jdiv_round_up(i64, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @use_merged_upsample(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 17
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %14, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 1)
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 56
  %12 = load i32, i32* %11, align 8
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %8, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %135

; <label>:16:                                     ; preds = %8
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 9
  %19 = load i32, i32* %18, align 4
  %20 = icmp ne i32 %19, 3
  br i1 %20, label %39, label %21

; <label>:21:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 3)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 3)
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 8
  %25 = load i32, i32* %24, align 8
  %26 = icmp ne i32 %25, 3
  br i1 %26, label %39, label %27

; <label>:27:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 4)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 4)
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 10
  %31 = load i32, i32* %30, align 8
  %32 = icmp ne i32 %31, 2
  br i1 %32, label %39, label %33

; <label>:33:                                     ; preds = %27
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 5)
  %34 = add i64 %pgocount4, 1
  store i64 %34, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 5)
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 28
  %37 = load i32, i32* %36, align 8
  %38 = icmp ne i32 %37, 3
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %33, %27, %21, %16
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 2)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %135

; <label>:41:                                     ; preds = %33
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 43
  %44 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %44, i64 0
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %45, i32 0, i32 2
  %47 = load i32, i32* %46, align 8
  %48 = icmp ne i32 %47, 2
  br i1 %48, label %94, label %49

; <label>:49:                                     ; preds = %41
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 7)
  %50 = add i64 %pgocount6, 1
  store i64 %50, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 7)
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 43
  %53 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %53, i64 1
  %55 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %54, i32 0, i32 2
  %56 = load i32, i32* %55, align 8
  %57 = icmp ne i32 %56, 1
  br i1 %57, label %94, label %58

; <label>:58:                                     ; preds = %49
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 8)
  %59 = add i64 %pgocount7, 1
  store i64 %59, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 8)
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %60, i32 0, i32 43
  %62 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %62, i64 2
  %64 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %63, i32 0, i32 2
  %65 = load i32, i32* %64, align 8
  %66 = icmp ne i32 %65, 1
  br i1 %66, label %94, label %67

; <label>:67:                                     ; preds = %58
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 9)
  %68 = add i64 %pgocount8, 1
  store i64 %68, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 9)
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i32 0, i32 43
  %71 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %71, i64 0
  %73 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i32 0, i32 3
  %74 = load i32, i32* %73, align 4
  %75 = icmp sgt i32 %74, 2
  br i1 %75, label %94, label %76

; <label>:76:                                     ; preds = %67
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 10)
  %77 = add i64 %pgocount9, 1
  store i64 %77, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 10)
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 43
  %80 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %80, i64 1
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %81, i32 0, i32 3
  %83 = load i32, i32* %82, align 4
  %84 = icmp ne i32 %83, 1
  br i1 %84, label %94, label %85

; <label>:85:                                     ; preds = %76
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 11)
  %86 = add i64 %pgocount10, 1
  store i64 %86, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 11)
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %87, i32 0, i32 43
  %89 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i64 2
  %91 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %90, i32 0, i32 3
  %92 = load i32, i32* %91, align 4
  %93 = icmp ne i32 %92, 1
  br i1 %93, label %94, label %96

; <label>:94:                                     ; preds = %85, %76, %67, %58, %49, %41
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 6)
  %95 = add i64 %pgocount11, 1
  store i64 %95, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 6)
  store i32 0, i32* %2, align 4
  br label %135

; <label>:96:                                     ; preds = %85
  %97 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %97, i32 0, i32 43
  %99 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %98, align 8
  %100 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %99, i64 0
  %101 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %100, i32 0, i32 9
  %102 = load i32, i32* %101, align 4
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 59
  %105 = load i32, i32* %104, align 4
  %106 = icmp ne i32 %102, %105
  br i1 %106, label %131, label %107

; <label>:107:                                    ; preds = %96
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 13)
  %108 = add i64 %pgocount12, 1
  store i64 %108, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 13)
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 43
  %111 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %110, align 8
  %112 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %111, i64 1
  %113 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %112, i32 0, i32 9
  %114 = load i32, i32* %113, align 4
  %115 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %116 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %115, i32 0, i32 59
  %117 = load i32, i32* %116, align 4
  %118 = icmp ne i32 %114, %117
  br i1 %118, label %131, label %119

; <label>:119:                                    ; preds = %107
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 14)
  %120 = add i64 %pgocount13, 1
  store i64 %120, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 14)
  %121 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %122 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %121, i32 0, i32 43
  %123 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %122, align 8
  %124 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %123, i64 2
  %125 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %124, i32 0, i32 9
  %126 = load i32, i32* %125, align 4
  %127 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %127, i32 0, i32 59
  %129 = load i32, i32* %128, align 4
  %130 = icmp ne i32 %126, %129
  br i1 %130, label %131, label %133

; <label>:131:                                    ; preds = %119, %107, %96
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 12)
  %132 = add i64 %pgocount14, 1
  store i64 %132, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 12)
  store i32 0, i32* %2, align 4
  br label %135

; <label>:133:                                    ; preds = %119
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 15)
  %134 = add i64 %pgocount15, 1
  store i64 %134, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_use_merged_upsample, i64 0, i64 15)
  store i32 1, i32* %2, align 4
  br label %135

; <label>:135:                                    ; preds = %133, %131, %94, %39, %14
  %136 = load i32, i32* %2, align 4
  ret i32 %136
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_new_colormap(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_decomp_master*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 73
  %6 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %5, align 8
  %7 = bitcast %struct.jpeg_decomp_master* %6 to %struct.my_decomp_master*
  store %struct.my_decomp_master* %7, %struct.my_decomp_master** %3, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 4
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 207
  br i1 %11, label %12, label %35

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 2)
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i32 0, i32 5
  store i32 18, i32* %17, align 8
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 4
  %20 = load i32, i32* %19, align 4
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i32 0, i32 6
  %25 = bitcast %union.anon* %24 to [8 x i32]*
  %26 = getelementptr inbounds [8 x i32], [8 x i32]* %25, i64 0, i64 0
  store i32 %20, i32* %26, align 4
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 0
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i32 0, i32 0
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %33 = bitcast %struct.jpeg_decompress_struct* %32 to %struct.jpeg_common_struct*
  %34 = ptrtoint void (%struct.jpeg_common_struct*)* %31 to i64
  call void @__llvm_profile_instrument_target(i64 %34, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_new_colormap to i8*), i32 0)
  call void %31(%struct.jpeg_common_struct* %33)
  br label %35

; <label>:35:                                     ; preds = %12, %1
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 19
  %38 = load i32, i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %70

; <label>:40:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 1)
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 24
  %44 = load i32, i32* %43, align 8
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %70

; <label>:46:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 3)
  %47 = add i64 %pgocount2, 1
  store i64 %47, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 3)
  %48 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %48, i32 0, i32 32
  %50 = load i8**, i8*** %49, align 8
  %51 = icmp ne i8** %50, null
  br i1 %51, label %52, label %70

; <label>:52:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 4)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 4)
  %54 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %55 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %54, i32 0, i32 4
  %56 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %55, align 8
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 83
  store %struct.jpeg_color_quantizer* %56, %struct.jpeg_color_quantizer** %58, align 8
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 83
  %61 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %61, i32 0, i32 3
  %63 = bitcast {}** %62 to void (%struct.jpeg_decompress_struct*)**
  %64 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %63, align 8
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %66 = ptrtoint void (%struct.jpeg_decompress_struct*)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %66, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_new_colormap to i8*), i32 1)
  call void %64(%struct.jpeg_decompress_struct* %65)
  %67 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %68 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %67, i32 0, i32 0
  %69 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %68, i32 0, i32 2
  store i32 0, i32* %69, align 8
  br label %84

; <label>:70:                                     ; preds = %46, %40, %35
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 0)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_new_colormap, i64 0, i64 0)
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i32 0, i32 5
  store i32 45, i32* %75, align 8
  %76 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %77 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %76, i32 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i32 0, i32 0
  %80 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %79, align 8
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %82 = bitcast %struct.jpeg_decompress_struct* %81 to %struct.jpeg_common_struct*
  %83 = ptrtoint void (%struct.jpeg_common_struct*)* %80 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_new_colormap to i8*), i32 2)
  call void %80(%struct.jpeg_common_struct* %82)
  br label %84

; <label>:84:                                     ; preds = %70, %52
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jinit_master_decompress(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_master_decompress, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_master_decompress, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.my_decomp_master*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_master_decompress to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 48)
  %14 = bitcast i8* %13 to %struct.my_decomp_master*
  store %struct.my_decomp_master* %14, %struct.my_decomp_master** %4, align 8
  %15 = load %struct.my_decomp_master*, %struct.my_decomp_master** %4, align 8
  %16 = bitcast %struct.my_decomp_master* %15 to %struct.jpeg_decomp_master*
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 73
  store %struct.jpeg_decomp_master* %16, %struct.jpeg_decomp_master** %18, align 8
  %19 = load %struct.my_decomp_master*, %struct.my_decomp_master** %4, align 8
  %20 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %20, i32 0, i32 0
  %22 = bitcast {}** %21 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @prepare_for_output_pass, void (%struct.jpeg_decompress_struct*)** %22, align 8
  %23 = load %struct.my_decomp_master*, %struct.my_decomp_master** %4, align 8
  %24 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %23, i32 0, i32 0
  %25 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %24, i32 0, i32 1
  %26 = bitcast {}** %25 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_output_pass, void (%struct.jpeg_decompress_struct*)** %26, align 8
  %27 = load %struct.my_decomp_master*, %struct.my_decomp_master** %4, align 8
  %28 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %27, i32 0, i32 0
  %29 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %28, i32 0, i32 2
  store i32 0, i32* %29, align 8
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @master_selection(%struct.jpeg_decompress_struct* %30)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @prepare_for_output_pass(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_decomp_master*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 73
  %6 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %5, align 8
  %7 = bitcast %struct.jpeg_decomp_master* %6 to %struct.my_decomp_master*
  store %struct.my_decomp_master* %7, %struct.my_decomp_master** %3, align 8
  %8 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %9 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %8, i32 0, i32 0
  %10 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %9, i32 0, i32 2
  %11 = load i32, i32* %10, align 8
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %39

; <label>:13:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 0)
  %15 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %16 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %16, i32 0, i32 2
  store i32 0, i32* %17, align 8
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 83
  %20 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %20, i32 0, i32 0
  %22 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %21, align 8
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %24 = ptrtoint void (%struct.jpeg_decompress_struct*, i32)* %22 to i64
  call void @__llvm_profile_instrument_target(i64 %24, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 0)
  call void %22(%struct.jpeg_decompress_struct* %23, i32 0)
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 76
  %27 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %27, i32 0, i32 0
  %29 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %28, align 8
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %31 = ptrtoint void (%struct.jpeg_decompress_struct*, i32)* %29 to i64
  call void @__llvm_profile_instrument_target(i64 %31, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 1)
  call void %29(%struct.jpeg_decompress_struct* %30, i32 2)
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 74
  %34 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %34, i32 0, i32 0
  %36 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %35, align 8
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %38 = ptrtoint void (%struct.jpeg_decompress_struct*, i32)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %38, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 2)
  call void %36(%struct.jpeg_decompress_struct* %37, i32 2)
  br label %187

; <label>:39:                                     ; preds = %1
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %40, i32 0, i32 19
  %42 = load i32, i32* %41, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %99

; <label>:44:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 4)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 4)
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 32
  %48 = load i8**, i8*** %47, align 8
  %49 = icmp eq i8** %48, null
  br i1 %49, label %50, label %99

; <label>:50:                                     ; preds = %44
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 21
  %53 = load i32, i32* %52, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %71

; <label>:55:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 8)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 8)
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 25
  %59 = load i32, i32* %58, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %71

; <label>:61:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 10)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 10)
  %63 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %64 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %63, i32 0, i32 4
  %65 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %64, align 8
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 83
  store %struct.jpeg_color_quantizer* %65, %struct.jpeg_color_quantizer** %67, align 8
  %68 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %69 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %68, i32 0, i32 0
  %70 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %69, i32 0, i32 2
  store i32 1, i32* %70, align 8
  br label %98

; <label>:71:                                     ; preds = %55, %50
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 23
  %74 = load i32, i32* %73, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %83

; <label>:76:                                     ; preds = %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 11)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 11)
  %78 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %79 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %78, i32 0, i32 3
  %80 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %79, align 8
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 83
  store %struct.jpeg_color_quantizer* %80, %struct.jpeg_color_quantizer** %82, align 8
  br label %97

; <label>:83:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 12)
  %84 = add i64 %pgocount5, 1
  store i64 %84, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 12)
  %85 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %85, i32 0, i32 0
  %87 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %87, i32 0, i32 5
  store i32 45, i32* %88, align 8
  %89 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %89, i32 0, i32 0
  %91 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %90, align 8
  %92 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %91, i32 0, i32 0
  %93 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %92, align 8
  %94 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %95 = bitcast %struct.jpeg_decompress_struct* %94 to %struct.jpeg_common_struct*
  %96 = ptrtoint void (%struct.jpeg_common_struct*)* %93 to i64
  call void @__llvm_profile_instrument_target(i64 %96, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 3)
  call void %93(%struct.jpeg_common_struct* %95)
  br label %97

; <label>:97:                                     ; preds = %83, %76
  br label %98

; <label>:98:                                     ; preds = %97, %61
  br label %99

; <label>:99:                                     ; preds = %98, %44, %39
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %100, i32 0, i32 80
  %102 = load %struct.jpeg_inverse_dct*, %struct.jpeg_inverse_dct** %101, align 8
  %103 = getelementptr inbounds %struct.jpeg_inverse_dct, %struct.jpeg_inverse_dct* %102, i32 0, i32 0
  %104 = bitcast {}** %103 to void (%struct.jpeg_decompress_struct*)**
  %105 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %104, align 8
  %106 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %107 = ptrtoint void (%struct.jpeg_decompress_struct*)* %105 to i64
  call void @__llvm_profile_instrument_target(i64 %107, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 4)
  call void %105(%struct.jpeg_decompress_struct* %106)
  %108 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %109 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %108, i32 0, i32 75
  %110 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %109, align 8
  %111 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %110, i32 0, i32 2
  %112 = bitcast {}** %111 to void (%struct.jpeg_decompress_struct*)**
  %113 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %112, align 8
  %114 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %115 = ptrtoint void (%struct.jpeg_decompress_struct*)* %113 to i64
  call void @__llvm_profile_instrument_target(i64 %115, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 5)
  call void %113(%struct.jpeg_decompress_struct* %114)
  %116 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %117 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %116, i32 0, i32 15
  %118 = load i32, i32* %117, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %185, label %120

; <label>:120:                                    ; preds = %99
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 6)
  %121 = add i64 %pgocount6, 1
  store i64 %121, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 6)
  %122 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %123 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %122, i32 0, i32 2
  %124 = load i32, i32* %123, align 4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %136, label %126

; <label>:126:                                    ; preds = %120
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 9)
  %127 = add i64 %pgocount7, 1
  store i64 %127, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 9)
  %128 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %129 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %128, i32 0, i32 82
  %130 = load %struct.jpeg_color_deconverter*, %struct.jpeg_color_deconverter** %129, align 8
  %131 = getelementptr inbounds %struct.jpeg_color_deconverter, %struct.jpeg_color_deconverter* %130, i32 0, i32 0
  %132 = bitcast {}** %131 to void (%struct.jpeg_decompress_struct*)**
  %133 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %132, align 8
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %135 = ptrtoint void (%struct.jpeg_decompress_struct*)* %133 to i64
  call void @__llvm_profile_instrument_target(i64 %135, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 6)
  call void %133(%struct.jpeg_decompress_struct* %134)
  br label %136

; <label>:136:                                    ; preds = %126, %120
  %137 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %138 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %137, i32 0, i32 81
  %139 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %138, align 8
  %140 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %139, i32 0, i32 0
  %141 = bitcast {}** %140 to void (%struct.jpeg_decompress_struct*)**
  %142 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %141, align 8
  %143 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %144 = ptrtoint void (%struct.jpeg_decompress_struct*)* %142 to i64
  call void @__llvm_profile_instrument_target(i64 %144, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 7)
  call void %142(%struct.jpeg_decompress_struct* %143)
  %145 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %146 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %145, i32 0, i32 19
  %147 = load i32, i32* %146, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %162

; <label>:149:                                    ; preds = %136
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 7)
  %150 = add i64 %pgocount8, 1
  store i64 %150, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 7)
  %151 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %152 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %151, i32 0, i32 83
  %153 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %152, align 8
  %154 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %153, i32 0, i32 0
  %155 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %154, align 8
  %156 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %157 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %158 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %157, i32 0, i32 0
  %159 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %158, i32 0, i32 2
  %160 = load i32, i32* %159, align 8
  %161 = ptrtoint void (%struct.jpeg_decompress_struct*, i32)* %155 to i64
  call void @__llvm_profile_instrument_target(i64 %161, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 8)
  call void %155(%struct.jpeg_decompress_struct* %156, i32 %160)
  br label %162

; <label>:162:                                    ; preds = %149, %136
  %163 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %164 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %163, i32 0, i32 76
  %165 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %164, align 8
  %166 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %165, i32 0, i32 0
  %167 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %166, align 8
  %168 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %169 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %170 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %169, i32 0, i32 0
  %171 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %170, i32 0, i32 2
  %172 = load i32, i32* %171, align 8
  %173 = icmp ne i32 %172, 0
  %174 = zext i1 %173 to i64
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 13)
  %175 = add i64 %pgocount9, %174
  store i64 %175, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 13)
  %176 = select i1 %173, i32 3, i32 0
  %177 = ptrtoint void (%struct.jpeg_decompress_struct*, i32)* %167 to i64
  call void @__llvm_profile_instrument_target(i64 %177, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 9)
  call void %167(%struct.jpeg_decompress_struct* %168, i32 %176)
  %178 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %179 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %178, i32 0, i32 74
  %180 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %179, align 8
  %181 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %180, i32 0, i32 0
  %182 = load void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i32)** %181, align 8
  %183 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %184 = ptrtoint void (%struct.jpeg_decompress_struct*, i32)* %182 to i64
  call void @__llvm_profile_instrument_target(i64 %184, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_output_pass to i8*), i32 10)
  call void %182(%struct.jpeg_decompress_struct* %183, i32 0)
  br label %185

; <label>:185:                                    ; preds = %162, %99
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 3)
  %186 = add i64 %pgocount10, 1
  store i64 %186, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 3)
  br label %187

; <label>:187:                                    ; preds = %185, %13
  %188 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %189 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %188, i32 0, i32 2
  %190 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %189, align 8
  %191 = icmp ne %struct.jpeg_progress_mgr* %190, null
  br i1 %191, label %192, label %245

; <label>:192:                                    ; preds = %187
  %193 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %194 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %193, i32 0, i32 1
  %195 = load i32, i32* %194, align 8
  %196 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %197 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %196, i32 0, i32 2
  %198 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %197, align 8
  %199 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %198, i32 0, i32 3
  store i32 %195, i32* %199, align 8
  %200 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %201 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %200, i32 0, i32 1
  %202 = load i32, i32* %201, align 8
  %203 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %204 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %203, i32 0, i32 0
  %205 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %204, i32 0, i32 2
  %206 = load i32, i32* %205, align 8
  %207 = icmp ne i32 %206, 0
  %208 = zext i1 %207 to i64
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 14)
  %209 = add i64 %pgocount11, %208
  store i64 %209, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 14)
  %210 = select i1 %207, i32 2, i32 1
  %211 = add nsw i32 %202, %210
  %212 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %213 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %212, i32 0, i32 2
  %214 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %213, align 8
  %215 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %214, i32 0, i32 4
  store i32 %211, i32* %215, align 4
  %216 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %217 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %216, i32 0, i32 14
  %218 = load i32, i32* %217, align 8
  %219 = icmp ne i32 %218, 0
  br i1 %219, label %220, label %243

; <label>:220:                                    ; preds = %192
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 2)
  %221 = add i64 %pgocount12, 1
  store i64 %221, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 2)
  %222 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %223 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %222, i32 0, i32 77
  %224 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %223, align 8
  %225 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %224, i32 0, i32 5
  %226 = load i32, i32* %225, align 4
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %243, label %228

; <label>:228:                                    ; preds = %220
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 5)
  %229 = add i64 %pgocount13, 1
  store i64 %229, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 5)
  %230 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %231 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %230, i32 0, i32 25
  %232 = load i32, i32* %231, align 4
  %233 = icmp ne i32 %232, 0
  %234 = zext i1 %233 to i64
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 15)
  %235 = add i64 %pgocount14, %234
  store i64 %235, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 15)
  %236 = select i1 %233, i32 2, i32 1
  %237 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %238 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %237, i32 0, i32 2
  %239 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %238, align 8
  %240 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %239, i32 0, i32 4
  %241 = load i32, i32* %240, align 4
  %242 = add nsw i32 %241, %236
  store i32 %242, i32* %240, align 4
  br label %243

; <label>:243:                                    ; preds = %228, %220, %192
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 1)
  %244 = add i64 %pgocount15, 1
  store i64 %244, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_prepare_for_output_pass, i64 0, i64 1)
  br label %245

; <label>:245:                                    ; preds = %243, %187
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_output_pass(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_decomp_master*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 73
  %6 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %5, align 8
  %7 = bitcast %struct.jpeg_decomp_master* %6 to %struct.my_decomp_master*
  store %struct.my_decomp_master* %7, %struct.my_decomp_master** %3, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 19
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %22

; <label>:12:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_pass, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_pass, i64 0, i64 1)
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 83
  %16 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %16, i32 0, i32 2
  %18 = bitcast {}** %17 to void (%struct.jpeg_decompress_struct*)**
  %19 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %18, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %21 = ptrtoint void (%struct.jpeg_decompress_struct*)* %19 to i64
  call void @__llvm_profile_instrument_target(i64 %21, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_pass to i8*), i32 0)
  call void %19(%struct.jpeg_decompress_struct* %20)
  br label %22

; <label>:22:                                     ; preds = %12, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_pass, i64 0, i64 0)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_pass, i64 0, i64 0)
  %24 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %25 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %24, i32 0, i32 1
  %26 = load i32, i32* %25, align 8
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %25, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @master_selection(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.my_decomp_master*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 73
  %10 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %9, align 8
  %11 = bitcast %struct.jpeg_decomp_master* %10 to %struct.my_decomp_master*
  store %struct.my_decomp_master* %11, %struct.my_decomp_master** %3, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %12)
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @prepare_range_limit_table(%struct.jpeg_decompress_struct* %13)
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 26
  %16 = load i32, i32* %15, align 8
  %17 = zext i32 %16 to i64
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 28
  %20 = load i32, i32* %19, align 8
  %21 = sext i32 %20 to i64
  %22 = mul nsw i64 %17, %21
  store i64 %22, i64* %5, align 8
  %23 = load i64, i64* %5, align 8
  %24 = trunc i64 %23 to i32
  store i32 %24, i32* %6, align 4
  %25 = load i32, i32* %6, align 4
  %26 = zext i32 %25 to i64
  %27 = load i64, i64* %5, align 8
  %28 = icmp ne i64 %26, %27
  br i1 %28, label %29, label %43

; <label>:29:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 5)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 5)
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i32 0, i32 5
  store i32 69, i32* %34, align 8
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 0
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %41 = bitcast %struct.jpeg_decompress_struct* %40 to %struct.jpeg_common_struct*
  %42 = ptrtoint void (%struct.jpeg_common_struct*)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %42, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_master_selection to i8*), i32 0)
  call void %39(%struct.jpeg_common_struct* %41)
  br label %43

; <label>:43:                                     ; preds = %29, %1
  %44 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %45 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %44, i32 0, i32 1
  store i32 0, i32* %45, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %47 = call i32 @use_merged_upsample(%struct.jpeg_decompress_struct* %46)
  %48 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %49 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %48, i32 0, i32 2
  store i32 %47, i32* %49, align 4
  %50 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %51 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %50, i32 0, i32 3
  store %struct.jpeg_color_quantizer* null, %struct.jpeg_color_quantizer** %51, align 8
  %52 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %53 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %52, i32 0, i32 4
  store %struct.jpeg_color_quantizer* null, %struct.jpeg_color_quantizer** %53, align 8
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %54, i32 0, i32 19
  %56 = load i32, i32* %55, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %64

; <label>:58:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 0)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 0)
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %60, i32 0, i32 14
  %62 = load i32, i32* %61, align 8
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %72, label %64

; <label>:64:                                     ; preds = %58, %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 3)
  %65 = add i64 %pgocount2, 1
  store i64 %65, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 3)
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 23
  store i32 0, i32* %67, align 4
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %69 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %68, i32 0, i32 24
  store i32 0, i32* %69, align 8
  %70 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %70, i32 0, i32 25
  store i32 0, i32* %71, align 4
  br label %72

; <label>:72:                                     ; preds = %64, %58
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i32 0, i32 19
  %75 = load i32, i32* %74, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %168

; <label>:77:                                     ; preds = %72
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 15
  %80 = load i32, i32* %79, align 4
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %96

; <label>:82:                                     ; preds = %77
  %pgocount3 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 6)
  %83 = add i64 %pgocount3, 1
  store i64 %83, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 6)
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 0
  %86 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %86, i32 0, i32 5
  store i32 46, i32* %87, align 8
  %88 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %88, i32 0, i32 0
  %90 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %91 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %90, i32 0, i32 0
  %92 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %91, align 8
  %93 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %94 = bitcast %struct.jpeg_decompress_struct* %93 to %struct.jpeg_common_struct*
  %95 = ptrtoint void (%struct.jpeg_common_struct*)* %92 to i64
  call void @__llvm_profile_instrument_target(i64 %95, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_master_selection to i8*), i32 1)
  call void %92(%struct.jpeg_common_struct* %94)
  br label %96

; <label>:96:                                     ; preds = %82, %77
  %97 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %97, i32 0, i32 28
  %99 = load i32, i32* %98, align 8
  %100 = icmp ne i32 %99, 3
  br i1 %100, label %101, label %111

; <label>:101:                                    ; preds = %96
  %pgocount4 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 10)
  %102 = add i64 %pgocount4, 1
  store i64 %102, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 10)
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 23
  store i32 1, i32* %104, align 4
  %105 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %106 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %105, i32 0, i32 24
  store i32 0, i32* %106, align 8
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %107, i32 0, i32 25
  store i32 0, i32* %108, align 4
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 32
  store i8** null, i8*** %110, align 8
  br label %135

; <label>:111:                                    ; preds = %96
  %112 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %113 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %112, i32 0, i32 32
  %114 = load i8**, i8*** %113, align 8
  %115 = icmp ne i8** %114, null
  br i1 %115, label %116, label %120

; <label>:116:                                    ; preds = %111
  %pgocount5 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 15)
  %117 = add i64 %pgocount5, 1
  store i64 %117, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 15)
  %118 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %119 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %118, i32 0, i32 24
  store i32 1, i32* %119, align 8
  br label %134

; <label>:120:                                    ; preds = %111
  %121 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %122 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %121, i32 0, i32 21
  %123 = load i32, i32* %122, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %125, label %129

; <label>:125:                                    ; preds = %120
  %pgocount6 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 19)
  %126 = add i64 %pgocount6, 1
  store i64 %126, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 19)
  %127 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %127, i32 0, i32 25
  store i32 1, i32* %128, align 4
  br label %133

; <label>:129:                                    ; preds = %120
  %pgocount7 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 21)
  %130 = add i64 %pgocount7, 1
  store i64 %130, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 21)
  %131 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %132 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %131, i32 0, i32 23
  store i32 1, i32* %132, align 4
  br label %133

; <label>:133:                                    ; preds = %129, %125
  br label %134

; <label>:134:                                    ; preds = %133, %116
  br label %135

; <label>:135:                                    ; preds = %134, %101
  %136 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %137 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %136, i32 0, i32 23
  %138 = load i32, i32* %137, align 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %140, label %148

; <label>:140:                                    ; preds = %135
  %pgocount8 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 7)
  %141 = add i64 %pgocount8, 1
  store i64 %141, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 7)
  %142 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct* %142)
  %143 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %144 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %143, i32 0, i32 83
  %145 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %144, align 8
  %146 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %147 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %146, i32 0, i32 3
  store %struct.jpeg_color_quantizer* %145, %struct.jpeg_color_quantizer** %147, align 8
  br label %148

; <label>:148:                                    ; preds = %140, %135
  %149 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %150 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %149, i32 0, i32 25
  %151 = load i32, i32* %150, align 4
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %159, label %153

; <label>:153:                                    ; preds = %148
  %pgocount9 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 11)
  %154 = add i64 %pgocount9, 1
  store i64 %154, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 11)
  %155 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %155, i32 0, i32 24
  %157 = load i32, i32* %156, align 8
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %167

; <label>:159:                                    ; preds = %153, %148
  %pgocount10 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 4)
  %160 = add i64 %pgocount10, 1
  store i64 %160, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 4)
  %161 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct* %161)
  %162 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %163 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %162, i32 0, i32 83
  %164 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %163, align 8
  %165 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %166 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %165, i32 0, i32 4
  store %struct.jpeg_color_quantizer* %164, %struct.jpeg_color_quantizer** %166, align 8
  br label %167

; <label>:167:                                    ; preds = %159, %153
  br label %168

; <label>:168:                                    ; preds = %167, %72
  %169 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %170 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %169, i32 0, i32 15
  %171 = load i32, i32* %170, align 4
  %172 = icmp ne i32 %171, 0
  br i1 %172, label %190, label %173

; <label>:173:                                    ; preds = %168
  %174 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %175 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %174, i32 0, i32 2
  %176 = load i32, i32* %175, align 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %181

; <label>:178:                                    ; preds = %173
  %pgocount11 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 12)
  %179 = add i64 %pgocount11, 1
  store i64 %179, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 12)
  %180 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_merged_upsampler(%struct.jpeg_decompress_struct* %180)
  br label %185

; <label>:181:                                    ; preds = %173
  %pgocount12 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 16)
  %182 = add i64 %pgocount12, 1
  store i64 %182, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 16)
  %183 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_color_deconverter(%struct.jpeg_decompress_struct* %183)
  %184 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_upsampler(%struct.jpeg_decompress_struct* %184)
  br label %185

; <label>:185:                                    ; preds = %181, %178
  %186 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %187 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %188 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %187, i32 0, i32 25
  %189 = load i32, i32* %188, align 4
  call void @jinit_d_post_controller(%struct.jpeg_decompress_struct* %186, i32 %189)
  br label %190

; <label>:190:                                    ; preds = %185, %168
  %191 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_inverse_dct(%struct.jpeg_decompress_struct* %191)
  %192 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %193 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %192, i32 0, i32 45
  %194 = load i32, i32* %193, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %210

; <label>:196:                                    ; preds = %190
  %pgocount13 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 1)
  %197 = add i64 %pgocount13, 1
  store i64 %197, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 1)
  %198 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %199 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %198, i32 0, i32 0
  %200 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %199, align 8
  %201 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %200, i32 0, i32 5
  store i32 1, i32* %201, align 8
  %202 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %203 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %202, i32 0, i32 0
  %204 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %203, align 8
  %205 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %204, i32 0, i32 0
  %206 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %205, align 8
  %207 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %208 = bitcast %struct.jpeg_decompress_struct* %207 to %struct.jpeg_common_struct*
  %209 = ptrtoint void (%struct.jpeg_common_struct*)* %206 to i64
  call void @__llvm_profile_instrument_target(i64 %209, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_master_selection to i8*), i32 2)
  call void %206(%struct.jpeg_common_struct* %208)
  br label %222

; <label>:210:                                    ; preds = %190
  %211 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %212 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %211, i32 0, i32 44
  %213 = load i32, i32* %212, align 8
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %218

; <label>:215:                                    ; preds = %210
  %pgocount14 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 13)
  %216 = add i64 %pgocount14, 1
  store i64 %216, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 13)
  %217 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_phuff_decoder(%struct.jpeg_decompress_struct* %217)
  br label %221

; <label>:218:                                    ; preds = %210
  %pgocount15 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 17)
  %219 = add i64 %pgocount15, 1
  store i64 %219, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 17)
  %220 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_huff_decoder(%struct.jpeg_decompress_struct* %220)
  br label %221

; <label>:221:                                    ; preds = %218, %215
  br label %222

; <label>:222:                                    ; preds = %221, %196
  %223 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %224 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %223, i32 0, i32 77
  %225 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %224, align 8
  %226 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %225, i32 0, i32 4
  %227 = load i32, i32* %226, align 8
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %235, label %229

; <label>:229:                                    ; preds = %222
  %pgocount16 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 8)
  %230 = add i64 %pgocount16, 1
  store i64 %230, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 8)
  %231 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %232 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %231, i32 0, i32 14
  %233 = load i32, i32* %232, align 8
  %234 = icmp ne i32 %233, 0
  br label %235

; <label>:235:                                    ; preds = %229, %222
  %236 = phi i1 [ true, %222 ], [ %234, %229 ]
  %237 = zext i1 %236 to i32
  store i32 %237, i32* %4, align 4
  %238 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %239 = load i32, i32* %4, align 4
  call void @jinit_d_coef_controller(%struct.jpeg_decompress_struct* %238, i32 %239)
  %240 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %241 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %240, i32 0, i32 15
  %242 = load i32, i32* %241, align 4
  %243 = icmp ne i32 %242, 0
  br i1 %243, label %247, label %244

; <label>:244:                                    ; preds = %235
  %pgocount17 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 9)
  %245 = add i64 %pgocount17, 1
  store i64 %245, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 9)
  %246 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_d_main_controller(%struct.jpeg_decompress_struct* %246, i32 0)
  br label %247

; <label>:247:                                    ; preds = %244, %235
  %248 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %249 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %248, i32 0, i32 1
  %250 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %249, align 8
  %251 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %250, i32 0, i32 6
  %252 = bitcast {}** %251 to void (%struct.jpeg_common_struct*)**
  %253 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %252, align 8
  %254 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %255 = bitcast %struct.jpeg_decompress_struct* %254 to %struct.jpeg_common_struct*
  %256 = ptrtoint void (%struct.jpeg_common_struct*)* %253 to i64
  call void @__llvm_profile_instrument_target(i64 %256, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_master_selection to i8*), i32 3)
  call void %253(%struct.jpeg_common_struct* %255)
  %257 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %258 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %257, i32 0, i32 77
  %259 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %258, align 8
  %260 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %259, i32 0, i32 2
  %261 = bitcast {}** %260 to void (%struct.jpeg_decompress_struct*)**
  %262 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %261, align 8
  %263 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %264 = ptrtoint void (%struct.jpeg_decompress_struct*)* %262 to i64
  call void @__llvm_profile_instrument_target(i64 %264, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_master_selection to i8*), i32 4)
  call void %262(%struct.jpeg_decompress_struct* %263)
  %265 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %266 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %265, i32 0, i32 2
  %267 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %266, align 8
  %268 = icmp ne %struct.jpeg_progress_mgr* %267, null
  br i1 %268, label %269, label %335

; <label>:269:                                    ; preds = %247
  %pgocount18 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 2)
  %270 = add i64 %pgocount18, 1
  store i64 %270, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 2)
  %271 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %272 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %271, i32 0, i32 14
  %273 = load i32, i32* %272, align 8
  %274 = icmp ne i32 %273, 0
  br i1 %274, label %335, label %275

; <label>:275:                                    ; preds = %269
  %pgocount19 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 14)
  %276 = add i64 %pgocount19, 1
  store i64 %276, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 14)
  %277 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %278 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %277, i32 0, i32 77
  %279 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %278, align 8
  %280 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %279, i32 0, i32 4
  %281 = load i32, i32* %280, align 8
  %282 = icmp ne i32 %281, 0
  br i1 %282, label %283, label %335

; <label>:283:                                    ; preds = %275
  %284 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %285 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %284, i32 0, i32 44
  %286 = load i32, i32* %285, align 8
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %295

; <label>:288:                                    ; preds = %283
  %pgocount20 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 18)
  %289 = add i64 %pgocount20, 1
  store i64 %289, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 18)
  %290 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %291 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %290, i32 0, i32 8
  %292 = load i32, i32* %291, align 8
  %293 = mul nsw i32 3, %292
  %294 = add nsw i32 2, %293
  store i32 %294, i32* %7, align 4
  br label %300

; <label>:295:                                    ; preds = %283
  %pgocount21 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 20)
  %296 = add i64 %pgocount21, 1
  store i64 %296, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 20)
  %297 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %298 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %297, i32 0, i32 8
  %299 = load i32, i32* %298, align 8
  store i32 %299, i32* %7, align 4
  br label %300

; <label>:300:                                    ; preds = %295, %288
  %301 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %302 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %301, i32 0, i32 2
  %303 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %302, align 8
  %304 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %303, i32 0, i32 1
  store i64 0, i64* %304, align 8
  %305 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %306 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %305, i32 0, i32 60
  %307 = load i32, i32* %306, align 8
  %308 = zext i32 %307 to i64
  %309 = load i32, i32* %7, align 4
  %310 = sext i32 %309 to i64
  %311 = mul nsw i64 %308, %310
  %312 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %313 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %312, i32 0, i32 2
  %314 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %313, align 8
  %315 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %314, i32 0, i32 2
  store i64 %311, i64* %315, align 8
  %316 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %317 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %316, i32 0, i32 2
  %318 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %317, align 8
  %319 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %318, i32 0, i32 3
  store i32 0, i32* %319, align 8
  %320 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %321 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %320, i32 0, i32 25
  %322 = load i32, i32* %321, align 4
  %323 = icmp ne i32 %322, 0
  %324 = zext i1 %323 to i64
  %pgocount22 = load i64, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 22)
  %325 = add i64 %pgocount22, %324
  store i64 %325, i64* getelementptr inbounds ([23 x i64], [23 x i64]* @__profc_tmp1.ll_master_selection, i64 0, i64 22)
  %326 = select i1 %323, i32 3, i32 2
  %327 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %328 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %327, i32 0, i32 2
  %329 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %328, align 8
  %330 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %329, i32 0, i32 4
  store i32 %326, i32* %330, align 4
  %331 = load %struct.my_decomp_master*, %struct.my_decomp_master** %3, align 8
  %332 = getelementptr inbounds %struct.my_decomp_master, %struct.my_decomp_master* %331, i32 0, i32 1
  %333 = load i32, i32* %332, align 8
  %334 = add nsw i32 %333, 1
  store i32 %334, i32* %332, align 8
  br label %335

; <label>:335:                                    ; preds = %300, %275, %269, %247
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @prepare_range_limit_table(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_range_limit_table to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 1408)
  store i8* %13, i8** %3, align 8
  %14 = load i8*, i8** %3, align 8
  %15 = getelementptr inbounds i8, i8* %14, i64 256
  store i8* %15, i8** %3, align 8
  %16 = load i8*, i8** %3, align 8
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 61
  store i8* %16, i8** %18, align 8
  %19 = load i8*, i8** %3, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 -256
  call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 256, i32 1, i1 false)
  store i32 0, i32* %4, align 4
  br label %21

; <label>:21:                                     ; preds = %31, %1
  %22 = load i32, i32* %4, align 4
  %23 = icmp sle i32 %22, 255
  br i1 %23, label %24, label %35

; <label>:24:                                     ; preds = %21
  %25 = load i32, i32* %4, align 4
  %26 = trunc i32 %25 to i8
  %27 = load i8*, i8** %3, align 8
  %28 = load i32, i32* %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %27, i64 %29
  store i8 %26, i8* %30, align 1
  br label %31

; <label>:31:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_prepare_range_limit_table, i64 0, i64 0)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_prepare_range_limit_table, i64 0, i64 0)
  %33 = load i32, i32* %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %4, align 4
  br label %21

; <label>:35:                                     ; preds = %21
  %36 = load i8*, i8** %3, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 128
  store i8* %37, i8** %3, align 8
  store i32 128, i32* %4, align 4
  br label %38

; <label>:38:                                     ; preds = %46, %35
  %39 = load i32, i32* %4, align 4
  %40 = icmp slt i32 %39, 512
  br i1 %40, label %41, label %50

; <label>:41:                                     ; preds = %38
  %42 = load i8*, i8** %3, align 8
  %43 = load i32, i32* %4, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* %42, i64 %44
  store i8 -1, i8* %45, align 1
  br label %46

; <label>:46:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_prepare_range_limit_table, i64 0, i64 1)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_prepare_range_limit_table, i64 0, i64 1)
  %48 = load i32, i32* %4, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %4, align 4
  br label %38

; <label>:50:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_prepare_range_limit_table, i64 0, i64 2)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_prepare_range_limit_table, i64 0, i64 2)
  %52 = load i8*, i8** %3, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 512
  call void @llvm.memset.p0i8.i64(i8* %53, i8 0, i64 384, i32 1, i1 false)
  %54 = load i8*, i8** %3, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 896
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 61
  %58 = load i8*, i8** %57, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %55, i8* %58, i64 128, i32 1, i1 false)
  ret void
}

declare void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct*) #1

declare void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct*) #1

declare void @jinit_merged_upsampler(%struct.jpeg_decompress_struct*) #1

declare void @jinit_color_deconverter(%struct.jpeg_decompress_struct*) #1

declare void @jinit_upsampler(%struct.jpeg_decompress_struct*) #1

declare void @jinit_d_post_controller(%struct.jpeg_decompress_struct*, i32) #1

declare void @jinit_inverse_dct(%struct.jpeg_decompress_struct*) #1

declare void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) #1

declare void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) #1

declare void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) #1

declare void @jinit_d_main_controller(%struct.jpeg_decompress_struct*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
