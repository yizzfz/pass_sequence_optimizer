; ModuleID = 'jdpostct.2.ll'
source_filename = "jdpostct.c"
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
%struct.my_post_controller = type { %struct.jpeg_d_post_controller, %struct.jvirt_sarray_control*, i8**, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_d_post_controller = private constant [23 x i8] c"jinit_d_post_controller"
@__profn_tmp1.ll_start_pass_dpost = private constant [24 x i8] c"tmp1.ll:start_pass_dpost"
@__profn_tmp1.ll_post_process_1pass = private constant [26 x i8] c"tmp1.ll:post_process_1pass"
@__profn_tmp1.ll_post_process_prepass = private constant [28 x i8] c"tmp1.ll:post_process_prepass"
@__profn_tmp1.ll_post_process_2pass = private constant [26 x i8] c"tmp1.ll:post_process_2pass"
@__profc_jinit_d_post_controller = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_d_post_controller = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_d_post_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3289762397651281249, i64 844464317394626, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jinit_d_post_controller, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32)* @jinit_d_post_controller to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_d_post_controller to i8*), i32 3, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_dpost = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_dpost = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_dpost = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4861412598676114729, i64 1125999446977215, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i32)* @start_pass_dpost to i8*), i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_start_pass_dpost to i8*), i32 8, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_post_process_1pass = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_post_process_1pass = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_post_process_1pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6219858404820903029, i64 562975524720386, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_post_process_1pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_1pass to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_post_process_1pass to i8*), i32 2, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_post_process_prepass = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_post_process_prepass = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_post_process_prepass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4348806133627299514, i64 844476199398095, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_prepass to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_post_process_prepass to i8*), i32 4, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_post_process_2pass = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_post_process_2pass = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_post_process_2pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2302115506803311892, i64 563011516960107, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_2pass to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_post_process_2pass to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [14 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [134 x i8] c"\83\01\00jinit_d_post_controller\01tmp1.ll:start_pass_dpost\01tmp1.ll:post_process_1pass\01tmp1.ll:post_process_prepass\01tmp1.ll:post_process_2pass", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_post_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_dpost to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_1pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_prepass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_2pass to i8*), i8* bitcast ([14 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([134 x i8], [134 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_d_post_controller(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_post_controller*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 1
  %8 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %8, i32 0, i32 0
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = bitcast %struct.jpeg_decompress_struct* %11 to %struct.jpeg_common_struct*
  %13 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %10 to i64
  call void @__llvm_profile_instrument_target(i64 %13, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_post_controller to i8*), i32 0)
  %14 = call i8* %10(%struct.jpeg_common_struct* %12, i32 1, i64 48)
  %15 = bitcast i8* %14 to %struct.my_post_controller*
  store %struct.my_post_controller* %15, %struct.my_post_controller** %5, align 8
  %16 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %17 = bitcast %struct.my_post_controller* %16 to %struct.jpeg_d_post_controller*
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 76
  store %struct.jpeg_d_post_controller* %17, %struct.jpeg_d_post_controller** %19, align 8
  %20 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %21 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %20, i32 0, i32 0
  %22 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %21, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_dpost, void (%struct.jpeg_decompress_struct*, i32)** %22, align 8
  %23 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %24 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %23, i32 0, i32 1
  store %struct.jvirt_sarray_control* null, %struct.jvirt_sarray_control** %24, align 8
  %25 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %26 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %25, i32 0, i32 2
  store i8** null, i8*** %26, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 19
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %96

; <label>:31:                                     ; preds = %2
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 58
  %34 = load i32, i32* %33, align 8
  %35 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %36 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %35, i32 0, i32 3
  store i32 %34, i32* %36, align 8
  %37 = load i32, i32* %4, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %72

; <label>:39:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jinit_d_post_controller, i64 0, i64 1)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jinit_d_post_controller, i64 0, i64 1)
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 1
  %43 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %43, i32 0, i32 4
  %45 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %44, align 8
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %47 = bitcast %struct.jpeg_decompress_struct* %46 to %struct.jpeg_common_struct*
  %48 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %48, i32 0, i32 26
  %50 = load i32, i32* %49, align 8
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 28
  %53 = load i32, i32* %52, align 8
  %54 = mul i32 %50, %53
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 27
  %57 = load i32, i32* %56, align 4
  %58 = zext i32 %57 to i64
  %59 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %60 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %59, i32 0, i32 3
  %61 = load i32, i32* %60, align 8
  %62 = zext i32 %61 to i64
  %63 = call i64 @jround_up(i64 %58, i64 %62)
  %64 = trunc i64 %63 to i32
  %65 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %66 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %65, i32 0, i32 3
  %67 = load i32, i32* %66, align 8
  %68 = ptrtoint %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %68, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_post_controller to i8*), i32 1)
  %69 = call %struct.jvirt_sarray_control* %45(%struct.jpeg_common_struct* %47, i32 1, i32 0, i32 %54, i32 %64, i32 %67)
  %70 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %71 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %70, i32 0, i32 1
  store %struct.jvirt_sarray_control* %69, %struct.jvirt_sarray_control** %71, align 8
  br label %95

; <label>:72:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jinit_d_post_controller, i64 0, i64 2)
  %73 = add i64 %pgocount1, 1
  store i64 %73, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jinit_d_post_controller, i64 0, i64 2)
  %74 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %74, i32 0, i32 1
  %76 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %75, align 8
  %77 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %76, i32 0, i32 2
  %78 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %77, align 8
  %79 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %80 = bitcast %struct.jpeg_decompress_struct* %79 to %struct.jpeg_common_struct*
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 26
  %83 = load i32, i32* %82, align 8
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 28
  %86 = load i32, i32* %85, align 8
  %87 = mul i32 %83, %86
  %88 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %89 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %88, i32 0, i32 3
  %90 = load i32, i32* %89, align 8
  %91 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %78 to i64
  call void @__llvm_profile_instrument_target(i64 %91, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_d_post_controller to i8*), i32 2)
  %92 = call i8** %78(%struct.jpeg_common_struct* %80, i32 1, i32 %87, i32 %90)
  %93 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %94 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %93, i32 0, i32 2
  store i8** %92, i8*** %94, align 8
  br label %95

; <label>:95:                                     ; preds = %72, %39
  br label %96

; <label>:96:                                     ; preds = %95, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jinit_d_post_controller, i64 0, i64 0)
  %97 = add i64 %pgocount2, 1
  store i64 %97, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_jinit_d_post_controller, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_dpost(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_post_controller*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 76
  %8 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %7, align 8
  %9 = bitcast %struct.jpeg_d_post_controller* %8 to %struct.my_post_controller*
  store %struct.my_post_controller* %9, %struct.my_post_controller** %5, align 8
  %10 = load i32, i32* %4, align 4
  switch i32 %10, label %104 [
    i32 0, label %11
    i32 3, label %56
    i32 2, label %80
  ]

; <label>:11:                                     ; preds = %2
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 19
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %45

; <label>:16:                                     ; preds = %11
  %17 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %18 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %18, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_1pass, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %19, align 8
  %20 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %21 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %20, i32 0, i32 2
  %22 = load i8**, i8*** %21, align 8
  %23 = icmp eq i8** %22, null
  br i1 %23, label %24, label %43

; <label>:24:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 7)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 7)
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 1
  %28 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %28, i32 0, i32 7
  %30 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %29, align 8
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %32 = bitcast %struct.jpeg_decompress_struct* %31 to %struct.jpeg_common_struct*
  %33 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %34 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %33, i32 0, i32 1
  %35 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %34, align 8
  %36 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %37 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %36, i32 0, i32 3
  %38 = load i32, i32* %37, align 8
  %39 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %30 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_dpost to i8*), i32 0)
  %40 = call i8** %30(%struct.jpeg_common_struct* %32, %struct.jvirt_sarray_control* %35, i32 0, i32 %38, i32 1)
  %41 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %42 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %41, i32 0, i32 2
  store i8** %40, i8*** %42, align 8
  br label %43

; <label>:43:                                     ; preds = %24, %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 3)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 3)
  br label %55

; <label>:45:                                     ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 4)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 4)
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 81
  %49 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %49, i32 0, i32 1
  %51 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %50, align 8
  %52 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %53 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %52, i32 0, i32 0
  %54 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %53, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* %51, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %54, align 8
  br label %55

; <label>:55:                                     ; preds = %45, %43
  br label %118

; <label>:56:                                     ; preds = %2
  %57 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %58 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %57, i32 0, i32 1
  %59 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %58, align 8
  %60 = icmp eq %struct.jvirt_sarray_control* %59, null
  br i1 %60, label %61, label %75

; <label>:61:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 5)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 5)
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 0
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i32 0, i32 5
  store i32 4, i32* %66, align 8
  %67 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %67, i32 0, i32 0
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %68, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i32 0, i32 0
  %71 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %70, align 8
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %73 = bitcast %struct.jpeg_decompress_struct* %72 to %struct.jpeg_common_struct*
  %74 = ptrtoint void (%struct.jpeg_common_struct*)* %71 to i64
  call void @__llvm_profile_instrument_target(i64 %74, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_dpost to i8*), i32 1)
  call void %71(%struct.jpeg_common_struct* %73)
  br label %75

; <label>:75:                                     ; preds = %61, %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 0)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 0)
  %77 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %78 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %77, i32 0, i32 0
  %79 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %78, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_prepass, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %79, align 8
  br label %118

; <label>:80:                                     ; preds = %2
  %81 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %82 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %81, i32 0, i32 1
  %83 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %82, align 8
  %84 = icmp eq %struct.jvirt_sarray_control* %83, null
  br i1 %84, label %85, label %99

; <label>:85:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 6)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 6)
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %87, i32 0, i32 0
  %89 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %89, i32 0, i32 5
  store i32 4, i32* %90, align 8
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 0
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i32 0, i32 0
  %95 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %94, align 8
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %97 = bitcast %struct.jpeg_decompress_struct* %96 to %struct.jpeg_common_struct*
  %98 = ptrtoint void (%struct.jpeg_common_struct*)* %95 to i64
  call void @__llvm_profile_instrument_target(i64 %98, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_dpost to i8*), i32 2)
  call void %95(%struct.jpeg_common_struct* %97)
  br label %99

; <label>:99:                                     ; preds = %85, %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 1)
  %100 = add i64 %pgocount6, 1
  store i64 %100, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 1)
  %101 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %102 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %101, i32 0, i32 0
  %103 = getelementptr inbounds %struct.jpeg_d_post_controller, %struct.jpeg_d_post_controller* %102, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_2pass, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %103, align 8
  br label %118

; <label>:104:                                    ; preds = %2
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 2)
  %105 = add i64 %pgocount7, 1
  store i64 %105, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_start_pass_dpost, i64 0, i64 2)
  %106 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %107 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %106, i32 0, i32 0
  %108 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %107, align 8
  %109 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %108, i32 0, i32 5
  store i32 4, i32* %109, align 8
  %110 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %111 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %110, i32 0, i32 0
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %111, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i32 0, i32 0
  %114 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %113, align 8
  %115 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %116 = bitcast %struct.jpeg_decompress_struct* %115 to %struct.jpeg_common_struct*
  %117 = ptrtoint void (%struct.jpeg_common_struct*)* %114 to i64
  call void @__llvm_profile_instrument_target(i64 %117, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_dpost to i8*), i32 3)
  call void %114(%struct.jpeg_common_struct* %116)
  br label %118

; <label>:118:                                    ; preds = %104, %99, %75, %55
  %119 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %120 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %119, i32 0, i32 5
  store i32 0, i32* %120, align 8
  %121 = load %struct.my_post_controller*, %struct.my_post_controller** %5, align 8
  %122 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %121, i32 0, i32 4
  store i32 0, i32* %122, align 4
  ret void
}

declare i64 @jround_up(i64, i64) #1

; Function Attrs: noinline nounwind uwtable
define internal void @post_process_1pass(%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32) #0 {
  %8 = alloca %struct.jpeg_decompress_struct*, align 8
  %9 = alloca i8***, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8**, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_post_controller*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %8, align 8
  store i8*** %1, i8**** %9, align 8
  store i32* %2, i32** %10, align 8
  store i32 %3, i32* %11, align 4
  store i8** %4, i8*** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 76
  %20 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %19, align 8
  %21 = bitcast %struct.jpeg_d_post_controller* %20 to %struct.my_post_controller*
  store %struct.my_post_controller* %21, %struct.my_post_controller** %15, align 8
  %22 = load i32, i32* %14, align 4
  %23 = load i32*, i32** %13, align 8
  %24 = load i32, i32* %23, align 4
  %25 = sub i32 %22, %24
  store i32 %25, i32* %17, align 4
  %26 = load i32, i32* %17, align 4
  %27 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %28 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %27, i32 0, i32 3
  %29 = load i32, i32* %28, align 8
  %30 = icmp ugt i32 %26, %29
  br i1 %30, label %31, label %36

; <label>:31:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_post_process_1pass, i64 0, i64 1)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_post_process_1pass, i64 0, i64 1)
  %33 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %34 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %33, i32 0, i32 3
  %35 = load i32, i32* %34, align 8
  store i32 %35, i32* %17, align 4
  br label %36

; <label>:36:                                     ; preds = %31, %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_post_process_1pass, i64 0, i64 0)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_post_process_1pass, i64 0, i64 0)
  store i32 0, i32* %16, align 4
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 81
  %40 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %40, i32 0, i32 1
  %42 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %41, align 8
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %44 = load i8***, i8**** %9, align 8
  %45 = load i32*, i32** %10, align 8
  %46 = load i32, i32* %11, align 4
  %47 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %48 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %47, i32 0, i32 2
  %49 = load i8**, i8*** %48, align 8
  %50 = load i32, i32* %17, align 4
  %51 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %51, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_1pass to i8*), i32 0)
  call void %42(%struct.jpeg_decompress_struct* %43, i8*** %44, i32* %45, i32 %46, i8** %49, i32* %16, i32 %50)
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i32 0, i32 83
  %54 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %54, i32 0, i32 1
  %56 = load void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %55, align 8
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %58 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %59 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %58, i32 0, i32 2
  %60 = load i8**, i8*** %59, align 8
  %61 = load i8**, i8*** %12, align 8
  %62 = load i32*, i32** %13, align 8
  %63 = load i32, i32* %62, align 4
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i8*, i8** %61, i64 %64
  %66 = load i32, i32* %16, align 4
  %67 = ptrtoint void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* %56 to i64
  call void @__llvm_profile_instrument_target(i64 %67, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_1pass to i8*), i32 1)
  call void %56(%struct.jpeg_decompress_struct* %57, i8** %60, i8** %65, i32 %66)
  %68 = load i32, i32* %16, align 4
  %69 = load i32*, i32** %13, align 8
  %70 = load i32, i32* %69, align 4
  %71 = add i32 %70, %68
  store i32 %71, i32* %69, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @post_process_prepass(%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32) #0 {
  %8 = alloca %struct.jpeg_decompress_struct*, align 8
  %9 = alloca i8***, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8**, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_post_controller*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %8, align 8
  store i8*** %1, i8**** %9, align 8
  store i32* %2, i32** %10, align 8
  store i32 %3, i32* %11, align 4
  store i8** %4, i8*** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 76
  %20 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %19, align 8
  %21 = bitcast %struct.jpeg_d_post_controller* %20 to %struct.my_post_controller*
  store %struct.my_post_controller* %21, %struct.my_post_controller** %15, align 8
  %22 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %23 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %22, i32 0, i32 5
  %24 = load i32, i32* %23, align 8
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %48

; <label>:26:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i64 0, i64 3)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i64 0, i64 3)
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 1
  %30 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %30, i32 0, i32 7
  %32 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %31, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %33 to %struct.jpeg_common_struct*
  %35 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %36 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %35, i32 0, i32 1
  %37 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %36, align 8
  %38 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %39 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %38, i32 0, i32 4
  %40 = load i32, i32* %39, align 4
  %41 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %42 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %41, i32 0, i32 3
  %43 = load i32, i32* %42, align 8
  %44 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_prepass to i8*), i32 0)
  %45 = call i8** %32(%struct.jpeg_common_struct* %34, %struct.jvirt_sarray_control* %37, i32 %40, i32 %43, i32 1)
  %46 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %47 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %46, i32 0, i32 2
  store i8** %45, i8*** %47, align 8
  br label %48

; <label>:48:                                     ; preds = %26, %7
  %49 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %50 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %49, i32 0, i32 5
  %51 = load i32, i32* %50, align 8
  store i32 %51, i32* %16, align 4
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i32 0, i32 81
  %54 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %54, i32 0, i32 1
  %56 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %55, align 8
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %58 = load i8***, i8**** %9, align 8
  %59 = load i32*, i32** %10, align 8
  %60 = load i32, i32* %11, align 4
  %61 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %62 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %61, i32 0, i32 2
  %63 = load i8**, i8*** %62, align 8
  %64 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %65 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %64, i32 0, i32 5
  %66 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %67 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %66, i32 0, i32 3
  %68 = load i32, i32* %67, align 8
  %69 = ptrtoint void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* %56 to i64
  call void @__llvm_profile_instrument_target(i64 %69, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_prepass to i8*), i32 1)
  call void %56(%struct.jpeg_decompress_struct* %57, i8*** %58, i32* %59, i32 %60, i8** %63, i32* %65, i32 %68)
  %70 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %71 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %70, i32 0, i32 5
  %72 = load i32, i32* %71, align 8
  %73 = load i32, i32* %16, align 4
  %74 = icmp ugt i32 %72, %73
  br i1 %74, label %75, label %100

; <label>:75:                                     ; preds = %48
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i64 0, i64 1)
  %76 = add i64 %pgocount1, 1
  store i64 %76, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i64 0, i64 1)
  %77 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %78 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %77, i32 0, i32 5
  %79 = load i32, i32* %78, align 8
  %80 = load i32, i32* %16, align 4
  %81 = sub i32 %79, %80
  store i32 %81, i32* %17, align 4
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 83
  %84 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %84, i32 0, i32 1
  %86 = load void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %85, align 8
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %88 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %89 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %88, i32 0, i32 2
  %90 = load i8**, i8*** %89, align 8
  %91 = load i32, i32* %16, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i8*, i8** %90, i64 %92
  %94 = load i32, i32* %17, align 4
  %95 = ptrtoint void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %95, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_prepass to i8*), i32 2)
  call void %86(%struct.jpeg_decompress_struct* %87, i8** %93, i8** null, i32 %94)
  %96 = load i32, i32* %17, align 4
  %97 = load i32*, i32** %13, align 8
  %98 = load i32, i32* %97, align 4
  %99 = add i32 %98, %96
  store i32 %99, i32* %97, align 4
  br label %100

; <label>:100:                                    ; preds = %75, %48
  %101 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %102 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %101, i32 0, i32 5
  %103 = load i32, i32* %102, align 8
  %104 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %105 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %104, i32 0, i32 3
  %106 = load i32, i32* %105, align 8
  %107 = icmp uge i32 %103, %106
  br i1 %107, label %108, label %119

; <label>:108:                                    ; preds = %100
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i64 0, i64 2)
  %109 = add i64 %pgocount2, 1
  store i64 %109, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i64 0, i64 2)
  %110 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %111 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %110, i32 0, i32 3
  %112 = load i32, i32* %111, align 8
  %113 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %114 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %113, i32 0, i32 4
  %115 = load i32, i32* %114, align 4
  %116 = add i32 %115, %112
  store i32 %116, i32* %114, align 4
  %117 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %118 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %117, i32 0, i32 5
  store i32 0, i32* %118, align 8
  br label %119

; <label>:119:                                    ; preds = %108, %100
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i64 0, i64 0)
  %120 = add i64 %pgocount3, 1
  store i64 %120, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_post_process_prepass, i64 0, i64 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @post_process_2pass(%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32) #0 {
  %8 = alloca %struct.jpeg_decompress_struct*, align 8
  %9 = alloca i8***, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8**, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.my_post_controller*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %8, align 8
  store i8*** %1, i8**** %9, align 8
  store i32* %2, i32** %10, align 8
  store i32 %3, i32* %11, align 4
  store i8** %4, i8*** %12, align 8
  store i32* %5, i32** %13, align 8
  store i32 %6, i32* %14, align 4
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 76
  %20 = load %struct.jpeg_d_post_controller*, %struct.jpeg_d_post_controller** %19, align 8
  %21 = bitcast %struct.jpeg_d_post_controller* %20 to %struct.my_post_controller*
  store %struct.my_post_controller* %21, %struct.my_post_controller** %15, align 8
  %22 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %23 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %22, i32 0, i32 5
  %24 = load i32, i32* %23, align 8
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %48

; <label>:26:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 4)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 4)
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 1
  %30 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %30, i32 0, i32 7
  %32 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %31, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %33 to %struct.jpeg_common_struct*
  %35 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %36 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %35, i32 0, i32 1
  %37 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %36, align 8
  %38 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %39 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %38, i32 0, i32 4
  %40 = load i32, i32* %39, align 4
  %41 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %42 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %41, i32 0, i32 3
  %43 = load i32, i32* %42, align 8
  %44 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_2pass to i8*), i32 0)
  %45 = call i8** %32(%struct.jpeg_common_struct* %34, %struct.jvirt_sarray_control* %37, i32 %40, i32 %43, i32 0)
  %46 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %47 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %46, i32 0, i32 2
  store i8** %45, i8*** %47, align 8
  br label %48

; <label>:48:                                     ; preds = %26, %7
  %49 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %50 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %49, i32 0, i32 3
  %51 = load i32, i32* %50, align 8
  %52 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %53 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %52, i32 0, i32 5
  %54 = load i32, i32* %53, align 8
  %55 = sub i32 %51, %54
  store i32 %55, i32* %16, align 4
  %56 = load i32, i32* %14, align 4
  %57 = load i32*, i32** %13, align 8
  %58 = load i32, i32* %57, align 4
  %59 = sub i32 %56, %58
  store i32 %59, i32* %17, align 4
  %60 = load i32, i32* %16, align 4
  %61 = load i32, i32* %17, align 4
  %62 = icmp ugt i32 %60, %61
  br i1 %62, label %63, label %66

; <label>:63:                                     ; preds = %48
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 1)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 1)
  %65 = load i32, i32* %17, align 4
  store i32 %65, i32* %16, align 4
  br label %66

; <label>:66:                                     ; preds = %63, %48
  %67 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %67, i32 0, i32 27
  %69 = load i32, i32* %68, align 4
  %70 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %71 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %70, i32 0, i32 4
  %72 = load i32, i32* %71, align 4
  %73 = sub i32 %69, %72
  store i32 %73, i32* %17, align 4
  %74 = load i32, i32* %16, align 4
  %75 = load i32, i32* %17, align 4
  %76 = icmp ugt i32 %74, %75
  br i1 %76, label %77, label %80

; <label>:77:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 2)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 2)
  %79 = load i32, i32* %17, align 4
  store i32 %79, i32* %16, align 4
  br label %80

; <label>:80:                                     ; preds = %77, %66
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 83
  %83 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %83, i32 0, i32 1
  %85 = load void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %84, align 8
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %8, align 8
  %87 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %88 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %87, i32 0, i32 2
  %89 = load i8**, i8*** %88, align 8
  %90 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %91 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %90, i32 0, i32 5
  %92 = load i32, i32* %91, align 8
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i8*, i8** %89, i64 %93
  %95 = load i8**, i8*** %12, align 8
  %96 = load i32*, i32** %13, align 8
  %97 = load i32, i32* %96, align 4
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i8*, i8** %95, i64 %98
  %100 = load i32, i32* %16, align 4
  %101 = ptrtoint void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* %85 to i64
  call void @__llvm_profile_instrument_target(i64 %101, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_post_process_2pass to i8*), i32 1)
  call void %85(%struct.jpeg_decompress_struct* %86, i8** %94, i8** %99, i32 %100)
  %102 = load i32, i32* %16, align 4
  %103 = load i32*, i32** %13, align 8
  %104 = load i32, i32* %103, align 4
  %105 = add i32 %104, %102
  store i32 %105, i32* %103, align 4
  %106 = load i32, i32* %16, align 4
  %107 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %108 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %107, i32 0, i32 5
  %109 = load i32, i32* %108, align 8
  %110 = add i32 %109, %106
  store i32 %110, i32* %108, align 8
  %111 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %112 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %111, i32 0, i32 5
  %113 = load i32, i32* %112, align 8
  %114 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %115 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %114, i32 0, i32 3
  %116 = load i32, i32* %115, align 8
  %117 = icmp uge i32 %113, %116
  br i1 %117, label %118, label %129

; <label>:118:                                    ; preds = %80
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 3)
  %119 = add i64 %pgocount3, 1
  store i64 %119, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 3)
  %120 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %121 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %120, i32 0, i32 3
  %122 = load i32, i32* %121, align 8
  %123 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %124 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %123, i32 0, i32 4
  %125 = load i32, i32* %124, align 4
  %126 = add i32 %125, %122
  store i32 %126, i32* %124, align 4
  %127 = load %struct.my_post_controller*, %struct.my_post_controller** %15, align 8
  %128 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %127, i32 0, i32 5
  store i32 0, i32* %128, align 8
  br label %129

; <label>:129:                                    ; preds = %118, %80
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 0)
  %130 = add i64 %pgocount4, 1
  store i64 %130, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_post_process_2pass, i64 0, i64 0)
  ret void
}

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
