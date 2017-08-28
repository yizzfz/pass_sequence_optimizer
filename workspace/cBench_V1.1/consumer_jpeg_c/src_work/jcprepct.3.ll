; ModuleID = 'jcprepct.2.ll'
source_filename = "jcprepct.c"
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
%struct.jpeg_entropy_encoder = type { {}*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }
%struct.my_prep_controller = type { %struct.jpeg_c_prep_controller, [10 x i8**], i32, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_c_prep_controller = private constant [23 x i8] c"jinit_c_prep_controller"
@__profn_tmp1.ll_start_pass_prep = private constant [23 x i8] c"tmp1.ll:start_pass_prep"
@__profn_tmp1.ll_pre_process_context = private constant [27 x i8] c"tmp1.ll:pre_process_context"
@__profn_tmp1.ll_create_context_buffer = private constant [29 x i8] c"tmp1.ll:create_context_buffer"
@__profn_tmp1.ll_pre_process_data = private constant [24 x i8] c"tmp1.ll:pre_process_data"
@__profn_tmp1.ll_expand_bottom_edge = private constant [26 x i8] c"tmp1.ll:expand_bottom_edge"
@__profc_jinit_c_prep_controller = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_c_prep_controller = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_c_prep_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2514098733615350193, i64 844485786170650, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @jinit_c_prep_controller to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_c_prep_controller to i8*), i32 4, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_prep = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_prep = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_prep = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3112554574905927241, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_prep, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @start_pass_prep to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_start_pass_prep to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pre_process_context = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_pre_process_context = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_pre_process_context = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7052678073189117611, i64 563155747522718, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* @pre_process_context to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_pre_process_context to i8*), i32 13, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_create_context_buffer = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_create_context_buffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_create_context_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7936312407053931796, i64 563003882489600, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_create_context_buffer, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_create_context_buffer to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pre_process_data = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_pre_process_data = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_pre_process_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7886805063832875015, i64 563107160713210, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* @pre_process_data to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_pre_process_data to i8*), i32 11, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_expand_bottom_edge = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_expand_bottom_edge = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8192657236354200495, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_expand_bottom_edge, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [160 x i8] c"\9D\01\00jinit_c_prep_controller\01tmp1.ll:start_pass_prep\01tmp1.ll:pre_process_context\01tmp1.ll:create_context_buffer\01tmp1.ll:pre_process_data\01tmp1.ll:expand_bottom_edge", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_prep_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_prep to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pre_process_context to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_context_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pre_process_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_expand_bottom_edge to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([160 x i8], [160 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_c_prep_controller(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_prep_controller*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %24

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i64 0, i64 1)
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %12, i32 0, i32 0
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i32 0, i32 5
  store i32 4, i32* %15, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 0
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %21 to %struct.jpeg_common_struct*
  %23 = ptrtoint void (%struct.jpeg_common_struct*)* %20 to i64
  call void @__llvm_profile_instrument_target(i64 %23, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_prep_controller to i8*), i32 0)
  call void %20(%struct.jpeg_common_struct* %22)
  br label %24

; <label>:24:                                     ; preds = %10, %2
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 1
  %27 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %27, i32 0, i32 0
  %29 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %28, align 8
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %31 = bitcast %struct.jpeg_compress_struct* %30 to %struct.jpeg_common_struct*
  %32 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %29 to i64
  call void @__llvm_profile_instrument_target(i64 %32, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_prep_controller to i8*), i32 1)
  %33 = call i8* %29(%struct.jpeg_common_struct* %31, i32 1, i64 112)
  %34 = bitcast i8* %33 to %struct.my_prep_controller*
  store %struct.my_prep_controller* %34, %struct.my_prep_controller** %5, align 8
  %35 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %36 = bitcast %struct.my_prep_controller* %35 to %struct.jpeg_c_prep_controller*
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 53
  store %struct.jpeg_c_prep_controller* %36, %struct.jpeg_c_prep_controller** %38, align 8
  %39 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %40 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %39, i32 0, i32 0
  %41 = getelementptr inbounds %struct.jpeg_c_prep_controller, %struct.jpeg_c_prep_controller* %40, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_prep, void (%struct.jpeg_compress_struct*, i32)** %41, align 8
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %42, i32 0, i32 57
  %44 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %44, i32 0, i32 2
  %46 = load i32, i32* %45, align 8
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %54

; <label>:48:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i64 0, i64 2)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i64 0, i64 2)
  %50 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %51 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %50, i32 0, i32 0
  %52 = getelementptr inbounds %struct.jpeg_c_prep_controller, %struct.jpeg_c_prep_controller* %51, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* @pre_process_context, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %52, align 8
  %53 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @create_context_buffer(%struct.jpeg_compress_struct* %53)
  br label %109

; <label>:54:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i64 0, i64 3)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i64 0, i64 3)
  %56 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %57 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %56, i32 0, i32 0
  %58 = getelementptr inbounds %struct.jpeg_c_prep_controller, %struct.jpeg_c_prep_controller* %57, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* @pre_process_data, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %58, align 8
  store i32 0, i32* %6, align 4
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 14
  %61 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %60, align 8
  store %struct.jpeg_component_info* %61, %struct.jpeg_component_info** %7, align 8
  br label %62

; <label>:62:                                     ; preds = %102, %54
  %63 = load i32, i32* %6, align 4
  %64 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %65 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %64, i32 0, i32 12
  %66 = load i32, i32* %65, align 4
  %67 = icmp slt i32 %63, %66
  br i1 %67, label %68, label %108

; <label>:68:                                     ; preds = %62
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 1
  %71 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %71, i32 0, i32 2
  %73 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %72, align 8
  %74 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %75 = bitcast %struct.jpeg_compress_struct* %74 to %struct.jpeg_common_struct*
  %76 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %76, i32 0, i32 7
  %78 = load i32, i32* %77, align 4
  %79 = zext i32 %78 to i64
  %80 = mul nsw i64 %79, 8
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %81, i32 0, i32 38
  %83 = load i32, i32* %82, align 8
  %84 = sext i32 %83 to i64
  %85 = mul nsw i64 %80, %84
  %86 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %86, i32 0, i32 2
  %88 = load i32, i32* %87, align 8
  %89 = sext i32 %88 to i64
  %90 = sdiv i64 %85, %89
  %91 = trunc i64 %90 to i32
  %92 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %92, i32 0, i32 39
  %94 = load i32, i32* %93, align 4
  %95 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %73 to i64
  call void @__llvm_profile_instrument_target(i64 %95, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_prep_controller to i8*), i32 2)
  %96 = call i8** %73(%struct.jpeg_common_struct* %75, i32 1, i32 %91, i32 %94)
  %97 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %98 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %97, i32 0, i32 1
  %99 = load i32, i32* %6, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [10 x i8**], [10 x i8**]* %98, i64 0, i64 %100
  store i8** %96, i8*** %101, align 8
  br label %102

; <label>:102:                                    ; preds = %68
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i64 0, i64 0)
  %103 = add i64 %pgocount3, 1
  store i64 %103, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_prep_controller, i64 0, i64 0)
  %104 = load i32, i32* %6, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %6, align 4
  %106 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %107 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %106, i32 1
  store %struct.jpeg_component_info* %107, %struct.jpeg_component_info** %7, align 8
  br label %62

; <label>:108:                                    ; preds = %62
  br label %109

; <label>:109:                                    ; preds = %108, %48
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_prep(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_prep_controller*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 53
  %8 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %7, align 8
  %9 = bitcast %struct.jpeg_c_prep_controller* %8 to %struct.my_prep_controller*
  store %struct.my_prep_controller* %9, %struct.my_prep_controller** %5, align 8
  %10 = load i32, i32* %4, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %26

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_prep, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_prep, i64 0, i64 1)
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
  call void @__llvm_profile_instrument_target(i64 %25, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_prep to i8*), i32 0)
  call void %22(%struct.jpeg_common_struct* %24)
  br label %26

; <label>:26:                                     ; preds = %12, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_prep, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_start_pass_prep, i64 0, i64 0)
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 7
  %30 = load i32, i32* %29, align 4
  %31 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %32 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %31, i32 0, i32 2
  store i32 %30, i32* %32, align 8
  %33 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %34 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %33, i32 0, i32 3
  store i32 0, i32* %34, align 4
  %35 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %36 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %35, i32 0, i32 4
  store i32 0, i32* %36, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 39
  %39 = load i32, i32* %38, align 4
  %40 = mul nsw i32 2, %39
  %41 = load %struct.my_prep_controller*, %struct.my_prep_controller** %5, align 8
  %42 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %41, i32 0, i32 5
  store i32 %40, i32* %42, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @pre_process_context(%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32) #0 {
  %8 = alloca %struct.jpeg_compress_struct*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8***, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_prep_controller*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %8, align 8
  store i8** %1, i8*** %9, align 8
  store i32* %2, i32** %10, align 8
  store i32 %3, i32* %11, align 4
  store i8*** %4, i8**** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 53
  %23 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %22, align 8
  %24 = bitcast %struct.jpeg_c_prep_controller* %23 to %struct.my_prep_controller*
  store %struct.my_prep_controller* %24, %struct.my_prep_controller** %15, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 39
  %27 = load i32, i32* %26, align 4
  %28 = mul nsw i32 %27, 3
  store i32 %28, i32* %18, align 4
  br label %29

; <label>:29:                                     ; preds = %262, %7
  %30 = load i32*, i32** %13, align 8
  %31 = load i32, i32* %30, align 4
  %32 = load i32, i32* %14, align 4
  %33 = icmp ult i32 %31, %32
  br i1 %33, label %34, label %263

; <label>:34:                                     ; preds = %29
  %35 = load i32*, i32** %10, align 8
  %36 = load i32, i32* %35, align 4
  %37 = load i32, i32* %11, align 4
  %38 = icmp ult i32 %36, %37
  br i1 %38, label %39, label %146

; <label>:39:                                     ; preds = %34
  %40 = load i32, i32* %11, align 4
  %41 = load i32*, i32** %10, align 8
  %42 = load i32, i32* %41, align 4
  %43 = sub i32 %40, %42
  store i32 %43, i32* %19, align 4
  %44 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %45 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %44, i32 0, i32 5
  %46 = load i32, i32* %45, align 4
  %47 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %48 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %47, i32 0, i32 3
  %49 = load i32, i32* %48, align 4
  %50 = sub nsw i32 %46, %49
  store i32 %50, i32* %16, align 4
  %51 = load i32, i32* %16, align 4
  %52 = load i32, i32* %19, align 4
  %53 = icmp ult i32 %51, %52
  br i1 %53, label %54, label %57

; <label>:54:                                     ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 5)
  %55 = add i64 %pgocount, 1
  store i64 %55, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 5)
  %56 = load i32, i32* %16, align 4
  br label %60

; <label>:57:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 6)
  %58 = add i64 %pgocount1, 1
  store i64 %58, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 6)
  %59 = load i32, i32* %19, align 4
  br label %60

; <label>:60:                                     ; preds = %57, %54
  %61 = phi i32 [ %56, %54 ], [ %59, %57 ]
  store i32 %61, i32* %16, align 4
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %62, i32 0, i32 56
  %64 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %64, i32 0, i32 1
  %66 = load void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %65, align 8
  %67 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %68 = load i8**, i8*** %9, align 8
  %69 = load i32*, i32** %10, align 8
  %70 = load i32, i32* %69, align 4
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8*, i8** %68, i64 %71
  %73 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %74 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %73, i32 0, i32 1
  %75 = getelementptr inbounds [10 x i8**], [10 x i8**]* %74, i32 0, i32 0
  %76 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %77 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %76, i32 0, i32 3
  %78 = load i32, i32* %77, align 4
  %79 = load i32, i32* %16, align 4
  %80 = ptrtoint void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* %66 to i64
  call void @__llvm_profile_instrument_target(i64 %80, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pre_process_context to i8*), i32 0)
  call void %66(%struct.jpeg_compress_struct* %67, i8** %72, i8*** %75, i32 %78, i32 %79)
  %81 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %82 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %81, i32 0, i32 2
  %83 = load i32, i32* %82, align 8
  %84 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %84, i32 0, i32 7
  %86 = load i32, i32* %85, align 4
  %87 = icmp eq i32 %83, %86
  br i1 %87, label %88, label %131

; <label>:88:                                     ; preds = %60
  store i32 0, i32* %17, align 4
  br label %89

; <label>:89:                                     ; preds = %125, %88
  %90 = load i32, i32* %17, align 4
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 12
  %93 = load i32, i32* %92, align 4
  %94 = icmp slt i32 %90, %93
  br i1 %94, label %95, label %129

; <label>:95:                                     ; preds = %89
  store i32 1, i32* %20, align 4
  br label %96

; <label>:96:                                     ; preds = %120, %95
  %97 = load i32, i32* %20, align 4
  %98 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %99 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %98, i32 0, i32 39
  %100 = load i32, i32* %99, align 4
  %101 = icmp sle i32 %97, %100
  br i1 %101, label %102, label %124

; <label>:102:                                    ; preds = %96
  %103 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %104 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %103, i32 0, i32 1
  %105 = load i32, i32* %17, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [10 x i8**], [10 x i8**]* %104, i64 0, i64 %106
  %108 = load i8**, i8*** %107, align 8
  %109 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %110 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %109, i32 0, i32 1
  %111 = load i32, i32* %17, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [10 x i8**], [10 x i8**]* %110, i64 0, i64 %112
  %114 = load i8**, i8*** %113, align 8
  %115 = load i32, i32* %20, align 4
  %116 = sub nsw i32 0, %115
  %117 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %118 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %117, i32 0, i32 6
  %119 = load i32, i32* %118, align 8
  call void @jcopy_sample_rows(i8** %108, i32 0, i8** %114, i32 %116, i32 1, i32 %119)
  br label %120

; <label>:120:                                    ; preds = %102
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 0)
  %121 = add i64 %pgocount2, 1
  store i64 %121, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 0)
  %122 = load i32, i32* %20, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %20, align 4
  br label %96

; <label>:124:                                    ; preds = %96
  br label %125

; <label>:125:                                    ; preds = %124
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 1)
  %126 = add i64 %pgocount3, 1
  store i64 %126, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 1)
  %127 = load i32, i32* %17, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %17, align 4
  br label %89

; <label>:129:                                    ; preds = %89
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 7)
  %130 = add i64 %pgocount4, 1
  store i64 %130, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 7)
  br label %131

; <label>:131:                                    ; preds = %129, %60
  %132 = load i32, i32* %16, align 4
  %133 = load i32*, i32** %10, align 8
  %134 = load i32, i32* %133, align 4
  %135 = add i32 %134, %132
  store i32 %135, i32* %133, align 4
  %136 = load i32, i32* %16, align 4
  %137 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %138 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %137, i32 0, i32 3
  %139 = load i32, i32* %138, align 4
  %140 = add nsw i32 %139, %136
  store i32 %140, i32* %138, align 4
  %141 = load i32, i32* %16, align 4
  %142 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %143 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %142, i32 0, i32 2
  %144 = load i32, i32* %143, align 8
  %145 = sub i32 %144, %141
  store i32 %145, i32* %143, align 8
  br label %197

; <label>:146:                                    ; preds = %34
  %147 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %148 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %147, i32 0, i32 2
  %149 = load i32, i32* %148, align 8
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %153

; <label>:151:                                    ; preds = %146
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 12)
  %152 = add i64 %pgocount5, 1
  store i64 %152, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 12)
  br label %263

; <label>:153:                                    ; preds = %146
  %154 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %155 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %154, i32 0, i32 3
  %156 = load i32, i32* %155, align 4
  %157 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %158 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %157, i32 0, i32 5
  %159 = load i32, i32* %158, align 4
  %160 = icmp slt i32 %156, %159
  br i1 %160, label %161, label %195

; <label>:161:                                    ; preds = %153
  store i32 0, i32* %17, align 4
  br label %162

; <label>:162:                                    ; preds = %184, %161
  %163 = load i32, i32* %17, align 4
  %164 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %165 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %164, i32 0, i32 12
  %166 = load i32, i32* %165, align 4
  %167 = icmp slt i32 %163, %166
  br i1 %167, label %168, label %188

; <label>:168:                                    ; preds = %162
  %169 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %170 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %169, i32 0, i32 1
  %171 = load i32, i32* %17, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [10 x i8**], [10 x i8**]* %170, i64 0, i64 %172
  %174 = load i8**, i8*** %173, align 8
  %175 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %176 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %175, i32 0, i32 6
  %177 = load i32, i32* %176, align 8
  %178 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %179 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %178, i32 0, i32 3
  %180 = load i32, i32* %179, align 4
  %181 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %182 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %181, i32 0, i32 5
  %183 = load i32, i32* %182, align 4
  call void @expand_bottom_edge(i8** %174, i32 %177, i32 %180, i32 %183)
  br label %184

; <label>:184:                                    ; preds = %168
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 2)
  %185 = add i64 %pgocount6, 1
  store i64 %185, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 2)
  %186 = load i32, i32* %17, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %17, align 4
  br label %162

; <label>:188:                                    ; preds = %162
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 10)
  %189 = add i64 %pgocount7, 1
  store i64 %189, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 10)
  %190 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %191 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %190, i32 0, i32 5
  %192 = load i32, i32* %191, align 4
  %193 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %194 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %193, i32 0, i32 3
  store i32 %192, i32* %194, align 4
  br label %195

; <label>:195:                                    ; preds = %188, %153
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 4)
  %196 = add i64 %pgocount8, 1
  store i64 %196, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 4)
  br label %197

; <label>:197:                                    ; preds = %195, %131
  %198 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %199 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %198, i32 0, i32 3
  %200 = load i32, i32* %199, align 4
  %201 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %202 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %201, i32 0, i32 5
  %203 = load i32, i32* %202, align 4
  %204 = icmp eq i32 %200, %203
  br i1 %204, label %205, label %262

; <label>:205:                                    ; preds = %197
  %206 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %207 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %206, i32 0, i32 57
  %208 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %207, align 8
  %209 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %208, i32 0, i32 1
  %210 = load void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)** %209, align 8
  %211 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %212 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %213 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %212, i32 0, i32 1
  %214 = getelementptr inbounds [10 x i8**], [10 x i8**]* %213, i32 0, i32 0
  %215 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %216 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %215, i32 0, i32 4
  %217 = load i32, i32* %216, align 8
  %218 = load i8***, i8**** %12, align 8
  %219 = load i32*, i32** %13, align 8
  %220 = load i32, i32* %219, align 4
  %221 = ptrtoint void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)* %210 to i64
  call void @__llvm_profile_instrument_target(i64 %221, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pre_process_context to i8*), i32 1)
  call void %210(%struct.jpeg_compress_struct* %211, i8*** %214, i32 %217, i8*** %218, i32 %220)
  %222 = load i32*, i32** %13, align 8
  %223 = load i32, i32* %222, align 4
  %224 = add i32 %223, 1
  store i32 %224, i32* %222, align 4
  %225 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %226 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %225, i32 0, i32 39
  %227 = load i32, i32* %226, align 4
  %228 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %229 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %228, i32 0, i32 4
  %230 = load i32, i32* %229, align 8
  %231 = add nsw i32 %230, %227
  store i32 %231, i32* %229, align 8
  %232 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %233 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %232, i32 0, i32 4
  %234 = load i32, i32* %233, align 8
  %235 = load i32, i32* %18, align 4
  %236 = icmp sge i32 %234, %235
  br i1 %236, label %237, label %241

; <label>:237:                                    ; preds = %205
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 8)
  %238 = add i64 %pgocount9, 1
  store i64 %238, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 8)
  %239 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %240 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %239, i32 0, i32 4
  store i32 0, i32* %240, align 8
  br label %241

; <label>:241:                                    ; preds = %237, %205
  %242 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %243 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %242, i32 0, i32 3
  %244 = load i32, i32* %243, align 4
  %245 = load i32, i32* %18, align 4
  %246 = icmp sge i32 %244, %245
  br i1 %246, label %247, label %251

; <label>:247:                                    ; preds = %241
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 9)
  %248 = add i64 %pgocount10, 1
  store i64 %248, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 9)
  %249 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %250 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %249, i32 0, i32 3
  store i32 0, i32* %250, align 4
  br label %251

; <label>:251:                                    ; preds = %247, %241
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 3)
  %252 = add i64 %pgocount11, 1
  store i64 %252, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 3)
  %253 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %254 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %253, i32 0, i32 3
  %255 = load i32, i32* %254, align 4
  %256 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %257 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %256, i32 0, i32 39
  %258 = load i32, i32* %257, align 4
  %259 = add nsw i32 %255, %258
  %260 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %261 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %260, i32 0, i32 5
  store i32 %259, i32* %261, align 4
  br label %262

; <label>:262:                                    ; preds = %251, %197
  br label %29

; <label>:263:                                    ; preds = %151, %29
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 11)
  %264 = add i64 %pgocount12, 1
  store i64 %264, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_pre_process_context, i64 0, i64 11)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @create_context_buffer(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_prep_controller*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i8**, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 53
  %12 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %11, align 8
  %13 = bitcast %struct.jpeg_c_prep_controller* %12 to %struct.my_prep_controller*
  store %struct.my_prep_controller* %13, %struct.my_prep_controller** %3, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 39
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %4, align 4
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 1
  %19 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %19, i32 0, i32 0
  %21 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %20, align 8
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %22 to %struct.jpeg_common_struct*
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 12
  %26 = load i32, i32* %25, align 4
  %27 = mul nsw i32 %26, 5
  %28 = load i32, i32* %4, align 4
  %29 = mul nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 8
  %32 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %21 to i64
  call void @__llvm_profile_instrument_target(i64 %32, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_context_buffer to i8*), i32 0)
  %33 = call i8* %21(%struct.jpeg_common_struct* %23, i32 1, i64 %31)
  %34 = bitcast i8* %33 to i8**
  store i8** %34, i8*** %9, align 8
  store i32 0, i32* %5, align 4
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 14
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %36, align 8
  store %struct.jpeg_component_info* %37, %struct.jpeg_component_info** %7, align 8
  br label %38

; <label>:38:                                     ; preds = %131, %1
  %39 = load i32, i32* %5, align 4
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 12
  %42 = load i32, i32* %41, align 4
  %43 = icmp slt i32 %39, %42
  br i1 %43, label %44, label %137

; <label>:44:                                     ; preds = %38
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %45, i32 0, i32 1
  %47 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %47, i32 0, i32 2
  %49 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %48, align 8
  %50 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %51 = bitcast %struct.jpeg_compress_struct* %50 to %struct.jpeg_common_struct*
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i32 0, i32 7
  %54 = load i32, i32* %53, align 4
  %55 = zext i32 %54 to i64
  %56 = mul nsw i64 %55, 8
  %57 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %57, i32 0, i32 38
  %59 = load i32, i32* %58, align 8
  %60 = sext i32 %59 to i64
  %61 = mul nsw i64 %56, %60
  %62 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %63 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %62, i32 0, i32 2
  %64 = load i32, i32* %63, align 8
  %65 = sext i32 %64 to i64
  %66 = sdiv i64 %61, %65
  %67 = trunc i64 %66 to i32
  %68 = load i32, i32* %4, align 4
  %69 = mul nsw i32 3, %68
  %70 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_create_context_buffer to i8*), i32 1)
  %71 = call i8** %49(%struct.jpeg_common_struct* %51, i32 1, i32 %67, i32 %69)
  store i8** %71, i8*** %8, align 8
  %72 = load i8**, i8*** %9, align 8
  %73 = load i32, i32* %4, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8*, i8** %72, i64 %74
  %76 = bitcast i8** %75 to i8*
  %77 = load i8**, i8*** %8, align 8
  %78 = bitcast i8** %77 to i8*
  %79 = load i32, i32* %4, align 4
  %80 = mul nsw i32 3, %79
  %81 = sext i32 %80 to i64
  %82 = mul i64 %81, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %76, i8* %78, i64 %82, i32 1, i1 false)
  store i32 0, i32* %6, align 4
  br label %83

; <label>:83:                                     ; preds = %112, %44
  %84 = load i32, i32* %6, align 4
  %85 = load i32, i32* %4, align 4
  %86 = icmp slt i32 %84, %85
  br i1 %86, label %87, label %116

; <label>:87:                                     ; preds = %83
  %88 = load i8**, i8*** %8, align 8
  %89 = load i32, i32* %4, align 4
  %90 = mul nsw i32 2, %89
  %91 = load i32, i32* %6, align 4
  %92 = add nsw i32 %90, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8*, i8** %88, i64 %93
  %95 = load i8*, i8** %94, align 8
  %96 = load i8**, i8*** %9, align 8
  %97 = load i32, i32* %6, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8*, i8** %96, i64 %98
  store i8* %95, i8** %99, align 8
  %100 = load i8**, i8*** %8, align 8
  %101 = load i32, i32* %6, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8*, i8** %100, i64 %102
  %104 = load i8*, i8** %103, align 8
  %105 = load i8**, i8*** %9, align 8
  %106 = load i32, i32* %4, align 4
  %107 = mul nsw i32 4, %106
  %108 = load i32, i32* %6, align 4
  %109 = add nsw i32 %107, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8*, i8** %105, i64 %110
  store i8* %104, i8** %111, align 8
  br label %112

; <label>:112:                                    ; preds = %87
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_create_context_buffer, i64 0, i64 0)
  %113 = add i64 %pgocount, 1
  store i64 %113, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_create_context_buffer, i64 0, i64 0)
  %114 = load i32, i32* %6, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %6, align 4
  br label %83

; <label>:116:                                    ; preds = %83
  %117 = load i8**, i8*** %9, align 8
  %118 = load i32, i32* %4, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8*, i8** %117, i64 %119
  %121 = load %struct.my_prep_controller*, %struct.my_prep_controller** %3, align 8
  %122 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %121, i32 0, i32 1
  %123 = load i32, i32* %5, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [10 x i8**], [10 x i8**]* %122, i64 0, i64 %124
  store i8** %120, i8*** %125, align 8
  %126 = load i32, i32* %4, align 4
  %127 = mul nsw i32 5, %126
  %128 = load i8**, i8*** %9, align 8
  %129 = sext i32 %127 to i64
  %130 = getelementptr inbounds i8*, i8** %128, i64 %129
  store i8** %130, i8*** %9, align 8
  br label %131

; <label>:131:                                    ; preds = %116
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_create_context_buffer, i64 0, i64 1)
  %132 = add i64 %pgocount1, 1
  store i64 %132, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_create_context_buffer, i64 0, i64 1)
  %133 = load i32, i32* %5, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %5, align 4
  %135 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %136 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %135, i32 1
  store %struct.jpeg_component_info* %136, %struct.jpeg_component_info** %7, align 8
  br label %38

; <label>:137:                                    ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_create_context_buffer, i64 0, i64 2)
  %138 = add i64 %pgocount2, 1
  store i64 %138, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_create_context_buffer, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @pre_process_data(%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32) #0 {
  %8 = alloca %struct.jpeg_compress_struct*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8***, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_prep_controller*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %8, align 8
  store i8** %1, i8*** %9, align 8
  store i32* %2, i32** %10, align 8
  store i32 %3, i32* %11, align 4
  store i8*** %4, i8**** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 53
  %22 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %21, align 8
  %23 = bitcast %struct.jpeg_c_prep_controller* %22 to %struct.my_prep_controller*
  store %struct.my_prep_controller* %23, %struct.my_prep_controller** %15, align 8
  br label %24

; <label>:24:                                     ; preds = %220, %7
  %25 = load i32*, i32** %10, align 8
  %26 = load i32, i32* %25, align 4
  %27 = load i32, i32* %11, align 4
  %28 = icmp ult i32 %26, %27
  br i1 %28, label %29, label %35

; <label>:29:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 1)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 1)
  %31 = load i32*, i32** %13, align 8
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* %14, align 4
  %34 = icmp ult i32 %32, %33
  br label %35

; <label>:35:                                     ; preds = %29, %24
  %36 = phi i1 [ false, %24 ], [ %34, %29 ]
  br i1 %36, label %37, label %221

; <label>:37:                                     ; preds = %35
  %38 = load i32, i32* %11, align 4
  %39 = load i32*, i32** %10, align 8
  %40 = load i32, i32* %39, align 4
  %41 = sub i32 %38, %40
  store i32 %41, i32* %18, align 4
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %42, i32 0, i32 39
  %44 = load i32, i32* %43, align 4
  %45 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %46 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %45, i32 0, i32 3
  %47 = load i32, i32* %46, align 4
  %48 = sub nsw i32 %44, %47
  store i32 %48, i32* %16, align 4
  %49 = load i32, i32* %16, align 4
  %50 = load i32, i32* %18, align 4
  %51 = icmp ult i32 %49, %50
  br i1 %51, label %52, label %55

; <label>:52:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 2)
  %53 = add i64 %pgocount1, 1
  store i64 %53, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 2)
  %54 = load i32, i32* %16, align 4
  br label %58

; <label>:55:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 3)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 3)
  %57 = load i32, i32* %18, align 4
  br label %58

; <label>:58:                                     ; preds = %55, %52
  %59 = phi i32 [ %54, %52 ], [ %57, %55 ]
  store i32 %59, i32* %16, align 4
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i32 0, i32 56
  %62 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %62, i32 0, i32 1
  %64 = load void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %63, align 8
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %66 = load i8**, i8*** %9, align 8
  %67 = load i32*, i32** %10, align 8
  %68 = load i32, i32* %67, align 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i8*, i8** %66, i64 %69
  %71 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %72 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %71, i32 0, i32 1
  %73 = getelementptr inbounds [10 x i8**], [10 x i8**]* %72, i32 0, i32 0
  %74 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %75 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %74, i32 0, i32 3
  %76 = load i32, i32* %75, align 4
  %77 = load i32, i32* %16, align 4
  %78 = ptrtoint void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %78, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pre_process_data to i8*), i32 0)
  call void %64(%struct.jpeg_compress_struct* %65, i8** %70, i8*** %73, i32 %76, i32 %77)
  %79 = load i32, i32* %16, align 4
  %80 = load i32*, i32** %10, align 8
  %81 = load i32, i32* %80, align 4
  %82 = add i32 %81, %79
  store i32 %82, i32* %80, align 4
  %83 = load i32, i32* %16, align 4
  %84 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %85 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %84, i32 0, i32 3
  %86 = load i32, i32* %85, align 4
  %87 = add nsw i32 %86, %83
  store i32 %87, i32* %85, align 4
  %88 = load i32, i32* %16, align 4
  %89 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %90 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %89, i32 0, i32 2
  %91 = load i32, i32* %90, align 8
  %92 = sub i32 %91, %88
  store i32 %92, i32* %90, align 8
  %93 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %94 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %93, i32 0, i32 2
  %95 = load i32, i32* %94, align 8
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %140

; <label>:97:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 5)
  %98 = add i64 %pgocount3, 1
  store i64 %98, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 5)
  %99 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %100 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %99, i32 0, i32 3
  %101 = load i32, i32* %100, align 4
  %102 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %103 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %102, i32 0, i32 39
  %104 = load i32, i32* %103, align 4
  %105 = icmp slt i32 %101, %104
  br i1 %105, label %106, label %140

; <label>:106:                                    ; preds = %97
  store i32 0, i32* %17, align 4
  br label %107

; <label>:107:                                    ; preds = %129, %106
  %108 = load i32, i32* %17, align 4
  %109 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %110 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %109, i32 0, i32 12
  %111 = load i32, i32* %110, align 4
  %112 = icmp slt i32 %108, %111
  br i1 %112, label %113, label %133

; <label>:113:                                    ; preds = %107
  %114 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %115 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %114, i32 0, i32 1
  %116 = load i32, i32* %17, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [10 x i8**], [10 x i8**]* %115, i64 0, i64 %117
  %119 = load i8**, i8*** %118, align 8
  %120 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %121 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %120, i32 0, i32 6
  %122 = load i32, i32* %121, align 8
  %123 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %124 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %123, i32 0, i32 3
  %125 = load i32, i32* %124, align 4
  %126 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %127 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %126, i32 0, i32 39
  %128 = load i32, i32* %127, align 4
  call void @expand_bottom_edge(i8** %119, i32 %122, i32 %125, i32 %128)
  br label %129

; <label>:129:                                    ; preds = %113
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 0)
  %130 = add i64 %pgocount4, 1
  store i64 %130, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 0)
  %131 = load i32, i32* %17, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %17, align 4
  br label %107

; <label>:133:                                    ; preds = %107
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 8)
  %134 = add i64 %pgocount5, 1
  store i64 %134, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 8)
  %135 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %136 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %135, i32 0, i32 39
  %137 = load i32, i32* %136, align 4
  %138 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %139 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %138, i32 0, i32 3
  store i32 %137, i32* %139, align 4
  br label %140

; <label>:140:                                    ; preds = %133, %97, %58
  %141 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %142 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %141, i32 0, i32 3
  %143 = load i32, i32* %142, align 4
  %144 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %145 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %144, i32 0, i32 39
  %146 = load i32, i32* %145, align 4
  %147 = icmp eq i32 %143, %146
  br i1 %147, label %148, label %168

; <label>:148:                                    ; preds = %140
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 4)
  %149 = add i64 %pgocount6, 1
  store i64 %149, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 4)
  %150 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %151 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %150, i32 0, i32 57
  %152 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %151, align 8
  %153 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %152, i32 0, i32 1
  %154 = load void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)** %153, align 8
  %155 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %156 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %157 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %156, i32 0, i32 1
  %158 = getelementptr inbounds [10 x i8**], [10 x i8**]* %157, i32 0, i32 0
  %159 = load i8***, i8**** %12, align 8
  %160 = load i32*, i32** %13, align 8
  %161 = load i32, i32* %160, align 4
  %162 = ptrtoint void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)* %154 to i64
  call void @__llvm_profile_instrument_target(i64 %162, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pre_process_data to i8*), i32 1)
  call void %154(%struct.jpeg_compress_struct* %155, i8*** %158, i32 0, i8*** %159, i32 %161)
  %163 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %164 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %163, i32 0, i32 3
  store i32 0, i32* %164, align 4
  %165 = load i32*, i32** %13, align 8
  %166 = load i32, i32* %165, align 4
  %167 = add i32 %166, 1
  store i32 %167, i32* %165, align 4
  br label %168

; <label>:168:                                    ; preds = %148, %140
  %169 = load %struct.my_prep_controller*, %struct.my_prep_controller** %15, align 8
  %170 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %169, i32 0, i32 2
  %171 = load i32, i32* %170, align 8
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %173, label %220

; <label>:173:                                    ; preds = %168
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 6)
  %174 = add i64 %pgocount7, 1
  store i64 %174, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 6)
  %175 = load i32*, i32** %13, align 8
  %176 = load i32, i32* %175, align 4
  %177 = load i32, i32* %14, align 4
  %178 = icmp ult i32 %176, %177
  br i1 %178, label %179, label %220

; <label>:179:                                    ; preds = %173
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 10)
  %180 = add i64 %pgocount8, 1
  store i64 %180, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 10)
  store i32 0, i32* %17, align 4
  %181 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %182 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %181, i32 0, i32 14
  %183 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %182, align 8
  store %struct.jpeg_component_info* %183, %struct.jpeg_component_info** %19, align 8
  br label %184

; <label>:184:                                    ; preds = %211, %179
  %185 = load i32, i32* %17, align 4
  %186 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %8, align 8
  %187 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %186, i32 0, i32 12
  %188 = load i32, i32* %187, align 4
  %189 = icmp slt i32 %185, %188
  br i1 %189, label %190, label %217

; <label>:190:                                    ; preds = %184
  %191 = load i8***, i8**** %12, align 8
  %192 = load i32, i32* %17, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i8**, i8*** %191, i64 %193
  %195 = load i8**, i8*** %194, align 8
  %196 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %197 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %196, i32 0, i32 7
  %198 = load i32, i32* %197, align 4
  %199 = mul i32 %198, 8
  %200 = load i32*, i32** %13, align 8
  %201 = load i32, i32* %200, align 4
  %202 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %203 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %202, i32 0, i32 3
  %204 = load i32, i32* %203, align 4
  %205 = mul i32 %201, %204
  %206 = load i32, i32* %14, align 4
  %207 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %208 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %207, i32 0, i32 3
  %209 = load i32, i32* %208, align 4
  %210 = mul i32 %206, %209
  call void @expand_bottom_edge(i8** %195, i32 %199, i32 %205, i32 %210)
  br label %211

; <label>:211:                                    ; preds = %190
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 7)
  %212 = add i64 %pgocount9, 1
  store i64 %212, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 7)
  %213 = load i32, i32* %17, align 4
  %214 = add nsw i32 %213, 1
  store i32 %214, i32* %17, align 4
  %215 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %216 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %215, i32 1
  store %struct.jpeg_component_info* %216, %struct.jpeg_component_info** %19, align 8
  br label %184

; <label>:217:                                    ; preds = %184
  %218 = load i32, i32* %14, align 4
  %219 = load i32*, i32** %13, align 8
  store i32 %218, i32* %219, align 4
  br label %221

; <label>:220:                                    ; preds = %173, %168
  br label %24

; <label>:221:                                    ; preds = %217, %35
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 9)
  %222 = add i64 %pgocount10, 1
  store i64 %222, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_tmp1.ll_pre_process_data, i64 0, i64 9)
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @expand_bottom_edge(i8**, i32, i32, i32) #0 {
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8** %0, i8*** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load i32, i32* %7, align 4
  store i32 %10, i32* %9, align 4
  br label %11

; <label>:11:                                     ; preds = %22, %4
  %12 = load i32, i32* %9, align 4
  %13 = load i32, i32* %8, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %26

; <label>:15:                                     ; preds = %11
  %16 = load i8**, i8*** %5, align 8
  %17 = load i32, i32* %7, align 4
  %18 = sub nsw i32 %17, 1
  %19 = load i8**, i8*** %5, align 8
  %20 = load i32, i32* %9, align 4
  %21 = load i32, i32* %6, align 4
  call void @jcopy_sample_rows(i8** %16, i32 %18, i8** %19, i32 %20, i32 1, i32 %21)
  br label %22

; <label>:22:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_expand_bottom_edge, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_expand_bottom_edge, i64 0, i64 0)
  %24 = load i32, i32* %9, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %9, align 4
  br label %11

; <label>:26:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_expand_bottom_edge, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_expand_bottom_edge, i64 0, i64 1)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

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
