; ModuleID = 'tmp1.ll'
source_filename = "jccoefct.c"
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
%struct.my_coef_controller = type { %struct.jpeg_c_coef_controller, i32, i32, i32, i32, [10 x [64 x i16]*], [10 x %struct.jvirt_barray_control*] }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_c_coef_controller = private constant [23 x i8] c"jinit_c_coef_controller"
@__profn_tmp1.ll_start_pass_coef = private constant [23 x i8] c"tmp1.ll:start_pass_coef"
@__profn_tmp1.ll_start_iMCU_row = private constant [22 x i8] c"tmp1.ll:start_iMCU_row"
@__profn_tmp1.ll_compress_data = private constant [21 x i8] c"tmp1.ll:compress_data"
@__profn_tmp1.ll_compress_first_pass = private constant [27 x i8] c"tmp1.ll:compress_first_pass"
@__profn_tmp1.ll_compress_output = private constant [23 x i8] c"tmp1.ll:compress_output"
@__profc_jinit_c_coef_controller = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_c_coef_controller = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_c_coef_controller = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8233143248909794290, i64 844494421102449, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @jinit_c_coef_controller to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_c_coef_controller to i8*), i32 4, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_coef = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_coef = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_coef = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1041693909404696680, i64 1125982831796106, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef to i8*), i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_start_pass_coef to i8*), i32 7, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_iMCU_row = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_iMCU_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9129650727672949639, i64 43969736709, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_iMCU_row, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compress_data = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_compress_data = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_compress_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8875046722031893368, i64 563164599275126, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8***)* @compress_data to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_compress_data to i8*), i32 12, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compress_first_pass = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_compress_first_pass = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_compress_first_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4971129596401108828, i64 563159652305017, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8***)* @compress_first_pass to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_compress_first_pass to i8*), i32 12, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_compress_output = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_compress_output = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_compress_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6997231016594519111, i64 563105600710283, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, i8***)* @compress_output to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_compress_output to i8*), i32 8, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [13 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [93 x i8] c"\90\01Zx\DA\CB\CA\CC\CB,\89O\8EO\CEOM\03\12y%E\F999\A9E\8C%\B9\05\86z99V\C5%\89E%\F1\05\89\C5\C5`%h\E2\99\BE\CE\A1\F1E\F9\E5p\E1\E4\FC\DC\82\A2T\A0\E2\94\C4\92DL\D1\B4\CC\A2b\88i\98r\F9\A5%\05\A5%\00\87\E77\0B", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_coef_controller to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_coef to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_iMCU_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_first_pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_output to i8*), i8* bitcast ([13 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([93 x i8], [93 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_c_coef_controller(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_coef_controller*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca [64 x i16]*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 1
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i32 0, i32 0
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %15 to %struct.jpeg_common_struct*
  %17 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %14 to i64
  call void @__llvm_profile_instrument_target(i64 %17, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_coef_controller to i8*), i32 0)
  %18 = call i8* %14(%struct.jpeg_common_struct* %16, i32 1, i64 192)
  %19 = bitcast i8* %18 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %19, %struct.my_coef_controller** %5, align 8
  %20 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %21 = bitcast %struct.my_coef_controller* %20 to %struct.jpeg_c_coef_controller*
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 54
  store %struct.jpeg_c_coef_controller* %21, %struct.jpeg_c_coef_controller** %23, align 8
  %24 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %25 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %25, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef, void (%struct.jpeg_compress_struct*, i32)** %26, align 8
  %27 = load i32, i32* %4, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %85

; <label>:29:                                     ; preds = %2
  store i32 0, i32* %6, align 4
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i32 0, i32 14
  %32 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %31, align 8
  store %struct.jpeg_component_info* %32, %struct.jpeg_component_info** %7, align 8
  br label %33

; <label>:33:                                     ; preds = %78, %29
  %34 = load i32, i32* %6, align 4
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 12
  %37 = load i32, i32* %36, align 4
  %38 = icmp slt i32 %34, %37
  br i1 %38, label %39, label %83

; <label>:39:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i64 0, i64 0)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i64 0, i64 0)
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %41, i32 0, i32 1
  %43 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %43, i32 0, i32 5
  %45 = load %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %44, align 8
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %47 = bitcast %struct.jpeg_compress_struct* %46 to %struct.jpeg_common_struct*
  %48 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %49 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i32 0, i32 7
  %50 = load i32, i32* %49, align 4
  %51 = zext i32 %50 to i64
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i32 0, i32 2
  %54 = load i32, i32* %53, align 8
  %55 = sext i32 %54 to i64
  %56 = call i64 @jround_up(i64 %51, i64 %55)
  %57 = trunc i64 %56 to i32
  %58 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %59 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i32 0, i32 8
  %60 = load i32, i32* %59, align 8
  %61 = zext i32 %60 to i64
  %62 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %63 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %62, i32 0, i32 3
  %64 = load i32, i32* %63, align 4
  %65 = sext i32 %64 to i64
  %66 = call i64 @jround_up(i64 %61, i64 %65)
  %67 = trunc i64 %66 to i32
  %68 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %69 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %68, i32 0, i32 3
  %70 = load i32, i32* %69, align 4
  %71 = ptrtoint %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %71, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_coef_controller to i8*), i32 1)
  %72 = call %struct.jvirt_barray_control* %45(%struct.jpeg_common_struct* %47, i32 1, i32 0, i32 %57, i32 %67, i32 %70)
  %73 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %74 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %73, i32 0, i32 6
  %75 = load i32, i32* %6, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %74, i64 0, i64 %76
  store %struct.jvirt_barray_control* %72, %struct.jvirt_barray_control** %77, align 8
  br label %78

; <label>:78:                                     ; preds = %39
  %79 = load i32, i32* %6, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %6, align 4
  %81 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %81, i32 1
  store %struct.jpeg_component_info* %82, %struct.jpeg_component_info** %7, align 8
  br label %33

; <label>:83:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i64 0, i64 2)
  %84 = add i64 %pgocount1, 1
  store i64 %84, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i64 0, i64 2)
  br label %118

; <label>:85:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i64 0, i64 3)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i64 0, i64 3)
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %87, i32 0, i32 1
  %89 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %89, i32 0, i32 1
  %91 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %90, align 8
  %92 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %93 = bitcast %struct.jpeg_compress_struct* %92 to %struct.jpeg_common_struct*
  %94 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %91 to i64
  call void @__llvm_profile_instrument_target(i64 %94, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_coef_controller to i8*), i32 2)
  %95 = call i8* %91(%struct.jpeg_common_struct* %93, i32 1, i64 1280)
  %96 = bitcast i8* %95 to [64 x i16]*
  store [64 x i16]* %96, [64 x i16]** %8, align 8
  store i32 0, i32* %9, align 4
  br label %97

; <label>:97:                                     ; preds = %110, %85
  %98 = load i32, i32* %9, align 4
  %99 = icmp slt i32 %98, 10
  br i1 %99, label %100, label %114

; <label>:100:                                    ; preds = %97
  %101 = load [64 x i16]*, [64 x i16]** %8, align 8
  %102 = load i32, i32* %9, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [64 x i16], [64 x i16]* %101, i64 %103
  %105 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %106 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %105, i32 0, i32 5
  %107 = load i32, i32* %9, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %106, i64 0, i64 %108
  store [64 x i16]* %104, [64 x i16]** %109, align 8
  br label %110

; <label>:110:                                    ; preds = %100
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i64 0, i64 1)
  %111 = add i64 %pgocount3, 1
  store i64 %111, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_c_coef_controller, i64 0, i64 1)
  %112 = load i32, i32* %9, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %9, align 4
  br label %97

; <label>:114:                                    ; preds = %97
  %115 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %116 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %115, i32 0, i32 6
  %117 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %116, i64 0, i64 0
  store %struct.jvirt_barray_control* null, %struct.jvirt_barray_control** %117, align 8
  br label %118

; <label>:118:                                    ; preds = %114, %83
  ret void
}

; Function Attrs: nounwind uwtable
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
  %10 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %11 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %10, i32 0, i32 1
  store i32 0, i32* %11, align 8
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %12)
  %13 = load i32, i32* %4, align 4
  switch i32 %13, label %89 [
    i32 0, label %14
    i32 3, label %39
    i32 2, label %64
  ]

; <label>:14:                                     ; preds = %2
  %15 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %16 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %15, i32 0, i32 6
  %17 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %16, i64 0, i64 0
  %18 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %17, align 8
  %19 = icmp ne %struct.jvirt_barray_control* %18, null
  br i1 %19, label %20, label %34

; <label>:20:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 4)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 4)
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 5
  store i32 4, i32* %25, align 8
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 0
  %30 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %29, align 8
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %32 = bitcast %struct.jpeg_compress_struct* %31 to %struct.jpeg_common_struct*
  %33 = ptrtoint void (%struct.jpeg_common_struct*)* %30 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_coef to i8*), i32 0)
  call void %30(%struct.jpeg_common_struct* %32)
  br label %34

; <label>:34:                                     ; preds = %20, %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 0)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 0)
  %36 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %37 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %36, i32 0, i32 0
  %38 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %37, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_data, i32 (%struct.jpeg_compress_struct*, i8***)** %38, align 8
  br label %103

; <label>:39:                                     ; preds = %2
  %40 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %41 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %40, i32 0, i32 6
  %42 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %41, i64 0, i64 0
  %43 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %42, align 8
  %44 = icmp eq %struct.jvirt_barray_control* %43, null
  br i1 %44, label %45, label %59

; <label>:45:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 5)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 5)
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %47, i32 0, i32 0
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i32 0, i32 5
  store i32 4, i32* %50, align 8
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %51, i32 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i32 0, i32 0
  %55 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %54, align 8
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %57 = bitcast %struct.jpeg_compress_struct* %56 to %struct.jpeg_common_struct*
  %58 = ptrtoint void (%struct.jpeg_common_struct*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %58, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_coef to i8*), i32 1)
  call void %55(%struct.jpeg_common_struct* %57)
  br label %59

; <label>:59:                                     ; preds = %45, %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 1)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 1)
  %61 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %62 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %61, i32 0, i32 0
  %63 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %62, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_first_pass, i32 (%struct.jpeg_compress_struct*, i8***)** %63, align 8
  br label %103

; <label>:64:                                     ; preds = %2
  %65 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %66 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %65, i32 0, i32 6
  %67 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %66, i64 0, i64 0
  %68 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %67, align 8
  %69 = icmp eq %struct.jvirt_barray_control* %68, null
  br i1 %69, label %70, label %84

; <label>:70:                                     ; preds = %64
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 6)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 6)
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %72, i32 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %74, i32 0, i32 5
  store i32 4, i32* %75, align 8
  %76 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %77 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %76, i32 0, i32 0
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i32 0, i32 0
  %80 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %79, align 8
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %82 = bitcast %struct.jpeg_compress_struct* %81 to %struct.jpeg_common_struct*
  %83 = ptrtoint void (%struct.jpeg_common_struct*)* %80 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_coef to i8*), i32 2)
  call void %80(%struct.jpeg_common_struct* %82)
  br label %84

; <label>:84:                                     ; preds = %70, %64
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 2)
  %85 = add i64 %pgocount5, 1
  store i64 %85, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 2)
  %86 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %87 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %86, i32 0, i32 0
  %88 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %87, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_output, i32 (%struct.jpeg_compress_struct*, i8***)** %88, align 8
  br label %103

; <label>:89:                                     ; preds = %2
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 3)
  %90 = add i64 %pgocount6, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_pass_coef, i64 0, i64 3)
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 0
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i32 0, i32 5
  store i32 4, i32* %94, align 8
  %95 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %96 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %95, i32 0, i32 0
  %97 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %96, align 8
  %98 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %97, i32 0, i32 0
  %99 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %98, align 8
  %100 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %101 = bitcast %struct.jpeg_compress_struct* %100 to %struct.jpeg_common_struct*
  %102 = ptrtoint void (%struct.jpeg_common_struct*)* %99 to i64
  call void @__llvm_profile_instrument_target(i64 %102, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_coef to i8*), i32 3)
  call void %99(%struct.jpeg_common_struct* %101)
  br label %103

; <label>:103:                                    ; preds = %89, %84, %59, %34
  ret void
}

declare i64 @jround_up(i64, i64) #1

; Function Attrs: nounwind uwtable
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

; Function Attrs: nounwind uwtable
define internal i32 @compress_data(%struct.jpeg_compress_struct*, i8***) #0 {
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
  %17 = alloca i32, align 4
  %18 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8*** %1, i8**** %5, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 54
  %21 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %20, align 8
  %22 = bitcast %struct.jpeg_c_coef_controller* %21 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %22, %struct.my_coef_controller** %6, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 43
  %25 = load i32, i32* %24, align 8
  %26 = sub i32 %25, 1
  store i32 %26, i32* %8, align 4
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 40
  %29 = load i32, i32* %28, align 8
  %30 = sub i32 %29, 1
  store i32 %30, i32* %9, align 4
  %31 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %32 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %31, i32 0, i32 3
  %33 = load i32, i32* %32, align 8
  store i32 %33, i32* %14, align 4
  br label %34

; <label>:34:                                     ; preds = %278, %2
  %35 = load i32, i32* %14, align 4
  %36 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %37 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %36, i32 0, i32 4
  %38 = load i32, i32* %37, align 4
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %282

; <label>:40:                                     ; preds = %34
  %41 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %42 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %41, i32 0, i32 2
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %7, align 4
  br label %44

; <label>:44:                                     ; preds = %271, %40
  %45 = load i32, i32* %7, align 4
  %46 = load i32, i32* %8, align 4
  %47 = icmp ule i32 %45, %46
  br i1 %47, label %48, label %275

; <label>:48:                                     ; preds = %44
  store i32 0, i32* %10, align 4
  store i32 0, i32* %12, align 4
  br label %49

; <label>:49:                                     ; preds = %246, %48
  %50 = load i32, i32* %12, align 4
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %51, i32 0, i32 41
  %53 = load i32, i32* %52, align 4
  %54 = icmp slt i32 %50, %53
  br i1 %54, label %55, label %249

; <label>:55:                                     ; preds = %49
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 42
  %58 = load i32, i32* %12, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %57, i64 0, i64 %59
  %61 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %60, align 8
  store %struct.jpeg_component_info* %61, %struct.jpeg_component_info** %18, align 8
  %62 = load i32, i32* %7, align 4
  %63 = load i32, i32* %8, align 4
  %64 = icmp ult i32 %62, %63
  br i1 %64, label %65, label %70

; <label>:65:                                     ; preds = %55
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 6)
  %66 = add i64 %pgocount, 1
  store i64 %66, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 6)
  %67 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %68 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %67, i32 0, i32 13
  %69 = load i32, i32* %68, align 4
  br label %75

; <label>:70:                                     ; preds = %55
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 7)
  %71 = add i64 %pgocount1, 1
  store i64 %71, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 7)
  %72 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %73 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i32 0, i32 17
  %74 = load i32, i32* %73, align 4
  br label %75

; <label>:75:                                     ; preds = %70, %65
  %76 = phi i32 [ %69, %65 ], [ %74, %70 ]
  store i32 %76, i32* %15, align 4
  %77 = load i32, i32* %7, align 4
  %78 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %79 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %78, i32 0, i32 16
  %80 = load i32, i32* %79, align 8
  %81 = mul i32 %77, %80
  store i32 %81, i32* %17, align 4
  %82 = load i32, i32* %14, align 4
  %83 = mul nsw i32 %82, 8
  store i32 %83, i32* %16, align 4
  store i32 0, i32* %13, align 4
  br label %84

; <label>:84:                                     ; preds = %242, %75
  %85 = load i32, i32* %13, align 4
  %86 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %86, i32 0, i32 14
  %88 = load i32, i32* %87, align 8
  %89 = icmp slt i32 %85, %88
  br i1 %89, label %90, label %245

; <label>:90:                                     ; preds = %84
  %91 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %92 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %91, i32 0, i32 1
  %93 = load i32, i32* %92, align 8
  %94 = load i32, i32* %9, align 4
  %95 = icmp ult i32 %93, %94
  br i1 %95, label %105, label %96

; <label>:96:                                     ; preds = %90
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 3)
  %97 = add i64 %pgocount2, 1
  store i64 %97, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 3)
  %98 = load i32, i32* %14, align 4
  %99 = load i32, i32* %13, align 4
  %100 = add nsw i32 %98, %99
  %101 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i32 0, i32 18
  %103 = load i32, i32* %102, align 8
  %104 = icmp slt i32 %100, %103
  br i1 %104, label %105, label %188

; <label>:105:                                    ; preds = %96, %90
  %106 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %107 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %106, i32 0, i32 58
  %108 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %107, align 8
  %109 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %108, i32 0, i32 1
  %110 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %109, align 8
  %111 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %112 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %113 = load i8***, i8**** %5, align 8
  %114 = load i32, i32* %12, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8**, i8*** %113, i64 %115
  %117 = load i8**, i8*** %116, align 8
  %118 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %119 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %118, i32 0, i32 5
  %120 = load i32, i32* %10, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %119, i64 0, i64 %121
  %123 = load [64 x i16]*, [64 x i16]** %122, align 8
  %124 = load i32, i32* %16, align 4
  %125 = load i32, i32* %17, align 4
  %126 = load i32, i32* %15, align 4
  %127 = ptrtoint void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* %110 to i64
  call void @__llvm_profile_instrument_target(i64 %127, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_data to i8*), i32 0)
  call void %110(%struct.jpeg_compress_struct* %111, %struct.jpeg_component_info* %112, i8** %117, [64 x i16]* %123, i32 %124, i32 %125, i32 %126)
  %128 = load i32, i32* %15, align 4
  %129 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %130 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %129, i32 0, i32 13
  %131 = load i32, i32* %130, align 4
  %132 = icmp slt i32 %128, %131
  br i1 %132, label %133, label %186

; <label>:133:                                    ; preds = %105
  %134 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %135 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %134, i32 0, i32 5
  %136 = load i32, i32* %10, align 4
  %137 = load i32, i32* %15, align 4
  %138 = add nsw i32 %136, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %135, i64 0, i64 %139
  %141 = load [64 x i16]*, [64 x i16]** %140, align 8
  %142 = bitcast [64 x i16]* %141 to i8*
  %143 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %144 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %143, i32 0, i32 13
  %145 = load i32, i32* %144, align 4
  %146 = load i32, i32* %15, align 4
  %147 = sub nsw i32 %145, %146
  %148 = sext i32 %147 to i64
  %149 = mul i64 %148, 128
  call void @jzero_far(i8* %142, i64 %149)
  %150 = load i32, i32* %15, align 4
  store i32 %150, i32* %11, align 4
  br label %151

; <label>:151:                                    ; preds = %180, %133
  %152 = load i32, i32* %11, align 4
  %153 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %154 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %153, i32 0, i32 13
  %155 = load i32, i32* %154, align 4
  %156 = icmp slt i32 %152, %155
  br i1 %156, label %157, label %184

; <label>:157:                                    ; preds = %151
  %158 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %159 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %158, i32 0, i32 5
  %160 = load i32, i32* %10, align 4
  %161 = load i32, i32* %11, align 4
  %162 = add nsw i32 %160, %161
  %163 = sub nsw i32 %162, 1
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %159, i64 0, i64 %164
  %166 = load [64 x i16]*, [64 x i16]** %165, align 8
  %167 = getelementptr inbounds [64 x i16], [64 x i16]* %166, i64 0
  %168 = getelementptr inbounds [64 x i16], [64 x i16]* %167, i64 0, i64 0
  %169 = load i16, i16* %168, align 2
  %170 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %171 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %170, i32 0, i32 5
  %172 = load i32, i32* %10, align 4
  %173 = load i32, i32* %11, align 4
  %174 = add nsw i32 %172, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %171, i64 0, i64 %175
  %177 = load [64 x i16]*, [64 x i16]** %176, align 8
  %178 = getelementptr inbounds [64 x i16], [64 x i16]* %177, i64 0
  %179 = getelementptr inbounds [64 x i16], [64 x i16]* %178, i64 0, i64 0
  store i16 %169, i16* %179, align 2
  br label %180

; <label>:180:                                    ; preds = %157
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 0)
  %181 = add i64 %pgocount3, 1
  store i64 %181, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 0)
  %182 = load i32, i32* %11, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, i32* %11, align 4
  br label %151

; <label>:184:                                    ; preds = %151
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 4)
  %185 = add i64 %pgocount4, 1
  store i64 %185, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 4)
  br label %186

; <label>:186:                                    ; preds = %184, %105
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 2)
  %187 = add i64 %pgocount5, 1
  store i64 %187, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 2)
  br label %234

; <label>:188:                                    ; preds = %96
  %189 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %190 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %189, i32 0, i32 5
  %191 = load i32, i32* %10, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %190, i64 0, i64 %192
  %194 = load [64 x i16]*, [64 x i16]** %193, align 8
  %195 = bitcast [64 x i16]* %194 to i8*
  %196 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %197 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %196, i32 0, i32 13
  %198 = load i32, i32* %197, align 4
  %199 = sext i32 %198 to i64
  %200 = mul i64 %199, 128
  call void @jzero_far(i8* %195, i64 %200)
  store i32 0, i32* %11, align 4
  br label %201

; <label>:201:                                    ; preds = %228, %188
  %202 = load i32, i32* %11, align 4
  %203 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %204 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %203, i32 0, i32 13
  %205 = load i32, i32* %204, align 4
  %206 = icmp slt i32 %202, %205
  br i1 %206, label %207, label %232

; <label>:207:                                    ; preds = %201
  %208 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %209 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %208, i32 0, i32 5
  %210 = load i32, i32* %10, align 4
  %211 = sub nsw i32 %210, 1
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %209, i64 0, i64 %212
  %214 = load [64 x i16]*, [64 x i16]** %213, align 8
  %215 = getelementptr inbounds [64 x i16], [64 x i16]* %214, i64 0
  %216 = getelementptr inbounds [64 x i16], [64 x i16]* %215, i64 0, i64 0
  %217 = load i16, i16* %216, align 2
  %218 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %219 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %218, i32 0, i32 5
  %220 = load i32, i32* %10, align 4
  %221 = load i32, i32* %11, align 4
  %222 = add nsw i32 %220, %221
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %219, i64 0, i64 %223
  %225 = load [64 x i16]*, [64 x i16]** %224, align 8
  %226 = getelementptr inbounds [64 x i16], [64 x i16]* %225, i64 0
  %227 = getelementptr inbounds [64 x i16], [64 x i16]* %226, i64 0, i64 0
  store i16 %217, i16* %227, align 2
  br label %228

; <label>:228:                                    ; preds = %207
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 1)
  %229 = add i64 %pgocount6, 1
  store i64 %229, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 1)
  %230 = load i32, i32* %11, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, i32* %11, align 4
  br label %201

; <label>:232:                                    ; preds = %201
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 5)
  %233 = add i64 %pgocount7, 1
  store i64 %233, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 5)
  br label %234

; <label>:234:                                    ; preds = %232, %186
  %235 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %236 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %235, i32 0, i32 13
  %237 = load i32, i32* %236, align 4
  %238 = load i32, i32* %10, align 4
  %239 = add nsw i32 %238, %237
  store i32 %239, i32* %10, align 4
  %240 = load i32, i32* %16, align 4
  %241 = add i32 %240, 8
  store i32 %241, i32* %16, align 4
  br label %242

; <label>:242:                                    ; preds = %234
  %243 = load i32, i32* %13, align 4
  %244 = add nsw i32 %243, 1
  store i32 %244, i32* %13, align 4
  br label %84

; <label>:245:                                    ; preds = %84
  br label %246

; <label>:246:                                    ; preds = %245
  %247 = load i32, i32* %12, align 4
  %248 = add nsw i32 %247, 1
  store i32 %248, i32* %12, align 4
  br label %49

; <label>:249:                                    ; preds = %49
  %250 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %251 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %250, i32 0, i32 59
  %252 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %251, align 8
  %253 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %252, i32 0, i32 1
  %254 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %253, align 8
  %255 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %256 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %257 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %256, i32 0, i32 5
  %258 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %257, i32 0, i32 0
  %259 = ptrtoint i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* %254 to i64
  call void @__llvm_profile_instrument_target(i64 %259, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_data to i8*), i32 1)
  %260 = call i32 %254(%struct.jpeg_compress_struct* %255, [64 x i16]** %258)
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %270, label %262

; <label>:262:                                    ; preds = %249
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 10)
  %263 = add i64 %pgocount8, 1
  store i64 %263, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 10)
  %264 = load i32, i32* %14, align 4
  %265 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %266 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %265, i32 0, i32 3
  store i32 %264, i32* %266, align 8
  %267 = load i32, i32* %7, align 4
  %268 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %269 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %268, i32 0, i32 2
  store i32 %267, i32* %269, align 4
  store i32 0, i32* %3, align 4
  br label %289

; <label>:270:                                    ; preds = %249
  br label %271

; <label>:271:                                    ; preds = %270
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 8)
  %272 = add i64 %pgocount9, 1
  store i64 %272, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 8)
  %273 = load i32, i32* %7, align 4
  %274 = add i32 %273, 1
  store i32 %274, i32* %7, align 4
  br label %44

; <label>:275:                                    ; preds = %44
  %276 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %277 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %276, i32 0, i32 2
  store i32 0, i32* %277, align 4
  br label %278

; <label>:278:                                    ; preds = %275
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 9)
  %279 = add i64 %pgocount10, 1
  store i64 %279, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 9)
  %280 = load i32, i32* %14, align 4
  %281 = add nsw i32 %280, 1
  store i32 %281, i32* %14, align 4
  br label %34

; <label>:282:                                    ; preds = %34
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 11)
  %283 = add i64 %pgocount11, 1
  store i64 %283, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_data, i64 0, i64 11)
  %284 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %285 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %284, i32 0, i32 1
  %286 = load i32, i32* %285, align 8
  %287 = add i32 %286, 1
  store i32 %287, i32* %285, align 8
  %288 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %288)
  store i32 1, i32* %3, align 4
  br label %289

; <label>:289:                                    ; preds = %282, %262
  %290 = load i32, i32* %3, align 4
  ret i32 %290
}

; Function Attrs: nounwind uwtable
define internal i32 @compress_first_pass(%struct.jpeg_compress_struct*, i8***) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i8***, align 8
  %5 = alloca %struct.my_coef_controller*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i16, align 2
  %17 = alloca %struct.jpeg_component_info*, align 8
  %18 = alloca [64 x i16]**, align 8
  %19 = alloca [64 x i16]*, align 8
  %20 = alloca [64 x i16]*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i8*** %1, i8**** %4, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 54
  %23 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %22, align 8
  %24 = bitcast %struct.jpeg_c_coef_controller* %23 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %24, %struct.my_coef_controller** %5, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 40
  %27 = load i32, i32* %26, align 8
  %28 = sub i32 %27, 1
  store i32 %28, i32* %6, align 4
  store i32 0, i32* %11, align 4
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 14
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  store %struct.jpeg_component_info* %31, %struct.jpeg_component_info** %17, align 8
  br label %32

; <label>:32:                                     ; preds = %259, %2
  %33 = load i32, i32* %11, align 4
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 12
  %36 = load i32, i32* %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %264

; <label>:38:                                     ; preds = %32
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %39, i32 0, i32 1
  %41 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %41, i32 0, i32 8
  %43 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %42, align 8
  %44 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %45 = bitcast %struct.jpeg_compress_struct* %44 to %struct.jpeg_common_struct*
  %46 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %47 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %46, i32 0, i32 6
  %48 = load i32, i32* %11, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %47, i64 0, i64 %49
  %51 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %50, align 8
  %52 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %53 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %52, i32 0, i32 1
  %54 = load i32, i32* %53, align 8
  %55 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %55, i32 0, i32 3
  %57 = load i32, i32* %56, align 4
  %58 = mul i32 %54, %57
  %59 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %60 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %59, i32 0, i32 3
  %61 = load i32, i32* %60, align 4
  %62 = ptrtoint [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* %43 to i64
  call void @__llvm_profile_instrument_target(i64 %62, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_first_pass to i8*), i32 0)
  %63 = call [64 x i16]** %43(%struct.jpeg_common_struct* %45, %struct.jvirt_barray_control* %51, i32 %58, i32 %61, i32 1)
  store [64 x i16]** %63, [64 x i16]*** %18, align 8
  %64 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %65 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %64, i32 0, i32 1
  %66 = load i32, i32* %65, align 8
  %67 = load i32, i32* %6, align 4
  %68 = icmp ult i32 %66, %67
  br i1 %68, label %69, label %74

; <label>:69:                                     ; preds = %38
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 7)
  %70 = add i64 %pgocount, 1
  store i64 %70, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 7)
  %71 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %72 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %71, i32 0, i32 3
  %73 = load i32, i32* %72, align 4
  store i32 %73, i32* %14, align 4
  br label %91

; <label>:74:                                     ; preds = %38
  %75 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %76 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %75, i32 0, i32 8
  %77 = load i32, i32* %76, align 8
  %78 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %79 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %78, i32 0, i32 3
  %80 = load i32, i32* %79, align 4
  %81 = urem i32 %77, %80
  store i32 %81, i32* %14, align 4
  %82 = load i32, i32* %14, align 4
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %89

; <label>:84:                                     ; preds = %74
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 10)
  %85 = add i64 %pgocount1, 1
  store i64 %85, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 10)
  %86 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %86, i32 0, i32 3
  %88 = load i32, i32* %87, align 4
  store i32 %88, i32* %14, align 4
  br label %89

; <label>:89:                                     ; preds = %84, %74
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 8)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 8)
  br label %91

; <label>:91:                                     ; preds = %89, %69
  %92 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %92, i32 0, i32 7
  %94 = load i32, i32* %93, align 4
  store i32 %94, i32* %7, align 4
  %95 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %96 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %95, i32 0, i32 2
  %97 = load i32, i32* %96, align 8
  store i32 %97, i32* %12, align 4
  %98 = load i32, i32* %7, align 4
  %99 = load i32, i32* %12, align 4
  %100 = urem i32 %98, %99
  store i32 %100, i32* %15, align 4
  %101 = load i32, i32* %15, align 4
  %102 = icmp sgt i32 %101, 0
  br i1 %102, label %103, label %108

; <label>:103:                                    ; preds = %91
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 6)
  %104 = add i64 %pgocount3, 1
  store i64 %104, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 6)
  %105 = load i32, i32* %12, align 4
  %106 = load i32, i32* %15, align 4
  %107 = sub nsw i32 %105, %106
  store i32 %107, i32* %15, align 4
  br label %108

; <label>:108:                                    ; preds = %103, %91
  store i32 0, i32* %13, align 4
  br label %109

; <label>:109:                                    ; preds = %170, %108
  %110 = load i32, i32* %13, align 4
  %111 = load i32, i32* %14, align 4
  %112 = icmp slt i32 %110, %111
  br i1 %112, label %113, label %174

; <label>:113:                                    ; preds = %109
  %114 = load [64 x i16]**, [64 x i16]*** %18, align 8
  %115 = load i32, i32* %13, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [64 x i16]*, [64 x i16]** %114, i64 %116
  %118 = load [64 x i16]*, [64 x i16]** %117, align 8
  store [64 x i16]* %118, [64 x i16]** %19, align 8
  %119 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %120 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %119, i32 0, i32 58
  %121 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %120, align 8
  %122 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %121, i32 0, i32 1
  %123 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %122, align 8
  %124 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %125 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %126 = load i8***, i8**** %4, align 8
  %127 = load i32, i32* %11, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8**, i8*** %126, i64 %128
  %130 = load i8**, i8*** %129, align 8
  %131 = load [64 x i16]*, [64 x i16]** %19, align 8
  %132 = load i32, i32* %13, align 4
  %133 = mul nsw i32 %132, 8
  %134 = load i32, i32* %7, align 4
  %135 = ptrtoint void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* %123 to i64
  call void @__llvm_profile_instrument_target(i64 %135, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_first_pass to i8*), i32 1)
  call void %123(%struct.jpeg_compress_struct* %124, %struct.jpeg_component_info* %125, i8** %130, [64 x i16]* %131, i32 %133, i32 0, i32 %134)
  %136 = load i32, i32* %15, align 4
  %137 = icmp sgt i32 %136, 0
  br i1 %137, label %138, label %169

; <label>:138:                                    ; preds = %113
  %139 = load i32, i32* %7, align 4
  %140 = load [64 x i16]*, [64 x i16]** %19, align 8
  %141 = zext i32 %139 to i64
  %142 = getelementptr inbounds [64 x i16], [64 x i16]* %140, i64 %141
  store [64 x i16]* %142, [64 x i16]** %19, align 8
  %143 = load [64 x i16]*, [64 x i16]** %19, align 8
  %144 = bitcast [64 x i16]* %143 to i8*
  %145 = load i32, i32* %15, align 4
  %146 = sext i32 %145 to i64
  %147 = mul i64 %146, 128
  call void @jzero_far(i8* %144, i64 %147)
  %148 = load [64 x i16]*, [64 x i16]** %19, align 8
  %149 = getelementptr inbounds [64 x i16], [64 x i16]* %148, i64 -1
  %150 = getelementptr inbounds [64 x i16], [64 x i16]* %149, i64 0, i64 0
  %151 = load i16, i16* %150, align 2
  store i16 %151, i16* %16, align 2
  store i32 0, i32* %10, align 4
  br label %152

; <label>:152:                                    ; preds = %163, %138
  %153 = load i32, i32* %10, align 4
  %154 = load i32, i32* %15, align 4
  %155 = icmp slt i32 %153, %154
  br i1 %155, label %156, label %167

; <label>:156:                                    ; preds = %152
  %157 = load i16, i16* %16, align 2
  %158 = load [64 x i16]*, [64 x i16]** %19, align 8
  %159 = load i32, i32* %10, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [64 x i16], [64 x i16]* %158, i64 %160
  %162 = getelementptr inbounds [64 x i16], [64 x i16]* %161, i64 0, i64 0
  store i16 %157, i16* %162, align 2
  br label %163

; <label>:163:                                    ; preds = %156
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 1)
  %164 = add i64 %pgocount4, 1
  store i64 %164, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 1)
  %165 = load i32, i32* %10, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %10, align 4
  br label %152

; <label>:167:                                    ; preds = %152
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 4)
  %168 = add i64 %pgocount5, 1
  store i64 %168, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 4)
  br label %169

; <label>:169:                                    ; preds = %167, %113
  br label %170

; <label>:170:                                    ; preds = %169
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 3)
  %171 = add i64 %pgocount6, 1
  store i64 %171, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 3)
  %172 = load i32, i32* %13, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %13, align 4
  br label %109

; <label>:174:                                    ; preds = %109
  %175 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %176 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %175, i32 0, i32 1
  %177 = load i32, i32* %176, align 8
  %178 = load i32, i32* %6, align 4
  %179 = icmp eq i32 %177, %178
  br i1 %179, label %180, label %258

; <label>:180:                                    ; preds = %174
  %181 = load i32, i32* %15, align 4
  %182 = load i32, i32* %7, align 4
  %183 = add i32 %182, %181
  store i32 %183, i32* %7, align 4
  %184 = load i32, i32* %7, align 4
  %185 = load i32, i32* %12, align 4
  %186 = udiv i32 %184, %185
  store i32 %186, i32* %8, align 4
  %187 = load i32, i32* %14, align 4
  store i32 %187, i32* %13, align 4
  br label %188

; <label>:188:                                    ; preds = %252, %180
  %189 = load i32, i32* %13, align 4
  %190 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %191 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %190, i32 0, i32 3
  %192 = load i32, i32* %191, align 4
  %193 = icmp slt i32 %189, %192
  br i1 %193, label %194, label %256

; <label>:194:                                    ; preds = %188
  %195 = load [64 x i16]**, [64 x i16]*** %18, align 8
  %196 = load i32, i32* %13, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [64 x i16]*, [64 x i16]** %195, i64 %197
  %199 = load [64 x i16]*, [64 x i16]** %198, align 8
  store [64 x i16]* %199, [64 x i16]** %19, align 8
  %200 = load [64 x i16]**, [64 x i16]*** %18, align 8
  %201 = load i32, i32* %13, align 4
  %202 = sub nsw i32 %201, 1
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [64 x i16]*, [64 x i16]** %200, i64 %203
  %205 = load [64 x i16]*, [64 x i16]** %204, align 8
  store [64 x i16]* %205, [64 x i16]** %20, align 8
  %206 = load [64 x i16]*, [64 x i16]** %19, align 8
  %207 = bitcast [64 x i16]* %206 to i8*
  %208 = load i32, i32* %7, align 4
  %209 = zext i32 %208 to i64
  %210 = mul i64 %209, 128
  call void @jzero_far(i8* %207, i64 %210)
  store i32 0, i32* %9, align 4
  br label %211

; <label>:211:                                    ; preds = %247, %194
  %212 = load i32, i32* %9, align 4
  %213 = load i32, i32* %8, align 4
  %214 = icmp ult i32 %212, %213
  br i1 %214, label %215, label %251

; <label>:215:                                    ; preds = %211
  %216 = load [64 x i16]*, [64 x i16]** %20, align 8
  %217 = load i32, i32* %12, align 4
  %218 = sub nsw i32 %217, 1
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [64 x i16], [64 x i16]* %216, i64 %219
  %221 = getelementptr inbounds [64 x i16], [64 x i16]* %220, i64 0, i64 0
  %222 = load i16, i16* %221, align 2
  store i16 %222, i16* %16, align 2
  store i32 0, i32* %10, align 4
  br label %223

; <label>:223:                                    ; preds = %234, %215
  %224 = load i32, i32* %10, align 4
  %225 = load i32, i32* %12, align 4
  %226 = icmp slt i32 %224, %225
  br i1 %226, label %227, label %238

; <label>:227:                                    ; preds = %223
  %228 = load i16, i16* %16, align 2
  %229 = load [64 x i16]*, [64 x i16]** %19, align 8
  %230 = load i32, i32* %10, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [64 x i16], [64 x i16]* %229, i64 %231
  %233 = getelementptr inbounds [64 x i16], [64 x i16]* %232, i64 0, i64 0
  store i16 %228, i16* %233, align 2
  br label %234

; <label>:234:                                    ; preds = %227
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 0)
  %235 = add i64 %pgocount7, 1
  store i64 %235, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 0)
  %236 = load i32, i32* %10, align 4
  %237 = add nsw i32 %236, 1
  store i32 %237, i32* %10, align 4
  br label %223

; <label>:238:                                    ; preds = %223
  %239 = load i32, i32* %12, align 4
  %240 = load [64 x i16]*, [64 x i16]** %19, align 8
  %241 = sext i32 %239 to i64
  %242 = getelementptr inbounds [64 x i16], [64 x i16]* %240, i64 %241
  store [64 x i16]* %242, [64 x i16]** %19, align 8
  %243 = load i32, i32* %12, align 4
  %244 = load [64 x i16]*, [64 x i16]** %20, align 8
  %245 = sext i32 %243 to i64
  %246 = getelementptr inbounds [64 x i16], [64 x i16]* %244, i64 %245
  store [64 x i16]* %246, [64 x i16]** %20, align 8
  br label %247

; <label>:247:                                    ; preds = %238
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 2)
  %248 = add i64 %pgocount8, 1
  store i64 %248, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 2)
  %249 = load i32, i32* %9, align 4
  %250 = add i32 %249, 1
  store i32 %250, i32* %9, align 4
  br label %211

; <label>:251:                                    ; preds = %211
  br label %252

; <label>:252:                                    ; preds = %251
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 5)
  %253 = add i64 %pgocount9, 1
  store i64 %253, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 5)
  %254 = load i32, i32* %13, align 4
  %255 = add nsw i32 %254, 1
  store i32 %255, i32* %13, align 4
  br label %188

; <label>:256:                                    ; preds = %188
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 9)
  %257 = add i64 %pgocount10, 1
  store i64 %257, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 9)
  br label %258

; <label>:258:                                    ; preds = %256, %174
  br label %259

; <label>:259:                                    ; preds = %258
  %260 = load i32, i32* %11, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* %11, align 4
  %262 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %263 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %262, i32 1
  store %struct.jpeg_component_info* %263, %struct.jpeg_component_info** %17, align 8
  br label %32

; <label>:264:                                    ; preds = %32
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 11)
  %265 = add i64 %pgocount11, 1
  store i64 %265, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_compress_first_pass, i64 0, i64 11)
  %266 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %267 = load i8***, i8**** %4, align 8
  %268 = call i32 @compress_output(%struct.jpeg_compress_struct* %266, i8*** %267)
  ret i32 %268
}

; Function Attrs: nounwind uwtable
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
  %14 = alloca [4 x [64 x i16]**], align 16
  %15 = alloca [64 x i16]*, align 8
  %16 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8*** %1, i8**** %5, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 54
  %19 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %18, align 8
  %20 = bitcast %struct.jpeg_c_coef_controller* %19 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %20, %struct.my_coef_controller** %6, align 8
  store i32 0, i32* %9, align 4
  br label %21

; <label>:21:                                     ; preds = %64, %2
  %22 = load i32, i32* %9, align 4
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 41
  %25 = load i32, i32* %24, align 4
  %26 = icmp slt i32 %22, %25
  br i1 %26, label %27, label %68

; <label>:27:                                     ; preds = %21
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 42
  %30 = load i32, i32* %9, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %29, i64 0, i64 %31
  %33 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %32, align 8
  store %struct.jpeg_component_info* %33, %struct.jpeg_component_info** %16, align 8
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 1
  %36 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %36, i32 0, i32 8
  %38 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %37, align 8
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %40 = bitcast %struct.jpeg_compress_struct* %39 to %struct.jpeg_common_struct*
  %41 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %42 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %41, i32 0, i32 6
  %43 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %43, i32 0, i32 1
  %45 = load i32, i32* %44, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %42, i64 0, i64 %46
  %48 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %47, align 8
  %49 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %50 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %49, i32 0, i32 1
  %51 = load i32, i32* %50, align 8
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i32 0, i32 3
  %54 = load i32, i32* %53, align 4
  %55 = mul i32 %51, %54
  %56 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %57 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %56, i32 0, i32 3
  %58 = load i32, i32* %57, align 4
  %59 = ptrtoint [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %59, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_output to i8*), i32 0)
  %60 = call [64 x i16]** %38(%struct.jpeg_common_struct* %40, %struct.jvirt_barray_control* %48, i32 %55, i32 %58, i32 0)
  %61 = load i32, i32* %9, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %14, i64 0, i64 %62
  store [64 x i16]** %60, [64 x i16]*** %63, align 8
  br label %64

; <label>:64:                                     ; preds = %27
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 3)
  %65 = add i64 %pgocount, 1
  store i64 %65, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 3)
  %66 = load i32, i32* %9, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %9, align 4
  br label %21

; <label>:68:                                     ; preds = %21
  %69 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %70 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %69, i32 0, i32 3
  %71 = load i32, i32* %70, align 8
  store i32 %71, i32* %12, align 4
  br label %72

; <label>:72:                                     ; preds = %185, %68
  %73 = load i32, i32* %12, align 4
  %74 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %75 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %74, i32 0, i32 4
  %76 = load i32, i32* %75, align 4
  %77 = icmp slt i32 %73, %76
  br i1 %77, label %78, label %189

; <label>:78:                                     ; preds = %72
  %79 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %80 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %79, i32 0, i32 2
  %81 = load i32, i32* %80, align 4
  store i32 %81, i32* %7, align 4
  br label %82

; <label>:82:                                     ; preds = %178, %78
  %83 = load i32, i32* %7, align 4
  %84 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %84, i32 0, i32 43
  %86 = load i32, i32* %85, align 8
  %87 = icmp ult i32 %83, %86
  br i1 %87, label %88, label %182

; <label>:88:                                     ; preds = %82
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %89

; <label>:89:                                     ; preds = %152, %88
  %90 = load i32, i32* %9, align 4
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 41
  %93 = load i32, i32* %92, align 4
  %94 = icmp slt i32 %90, %93
  br i1 %94, label %95, label %156

; <label>:95:                                     ; preds = %89
  %96 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %97 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %96, i32 0, i32 42
  %98 = load i32, i32* %9, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %97, i64 0, i64 %99
  %101 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %100, align 8
  store %struct.jpeg_component_info* %101, %struct.jpeg_component_info** %16, align 8
  %102 = load i32, i32* %7, align 4
  %103 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %104 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %103, i32 0, i32 13
  %105 = load i32, i32* %104, align 4
  %106 = mul i32 %102, %105
  store i32 %106, i32* %13, align 4
  store i32 0, i32* %11, align 4
  br label %107

; <label>:107:                                    ; preds = %148, %95
  %108 = load i32, i32* %11, align 4
  %109 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %110 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %109, i32 0, i32 14
  %111 = load i32, i32* %110, align 8
  %112 = icmp slt i32 %108, %111
  br i1 %112, label %113, label %151

; <label>:113:                                    ; preds = %107
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 1)
  %114 = add i64 %pgocount1, 1
  store i64 %114, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 1)
  %115 = load i32, i32* %9, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %14, i64 0, i64 %116
  %118 = load [64 x i16]**, [64 x i16]*** %117, align 8
  %119 = load i32, i32* %11, align 4
  %120 = load i32, i32* %12, align 4
  %121 = add nsw i32 %119, %120
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [64 x i16]*, [64 x i16]** %118, i64 %122
  %124 = load [64 x i16]*, [64 x i16]** %123, align 8
  %125 = load i32, i32* %13, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds [64 x i16], [64 x i16]* %124, i64 %126
  store [64 x i16]* %127, [64 x i16]** %15, align 8
  store i32 0, i32* %10, align 4
  br label %128

; <label>:128:                                    ; preds = %143, %113
  %129 = load i32, i32* %10, align 4
  %130 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %131 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %130, i32 0, i32 13
  %132 = load i32, i32* %131, align 4
  %133 = icmp slt i32 %129, %132
  br i1 %133, label %134, label %147

; <label>:134:                                    ; preds = %128
  %135 = load [64 x i16]*, [64 x i16]** %15, align 8
  %136 = getelementptr inbounds [64 x i16], [64 x i16]* %135, i32 1
  store [64 x i16]* %136, [64 x i16]** %15, align 8
  %137 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %138 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %137, i32 0, i32 5
  %139 = load i32, i32* %8, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %8, align 4
  %141 = sext i32 %139 to i64
  %142 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %138, i64 0, i64 %141
  store [64 x i16]* %135, [64 x i16]** %142, align 8
  br label %143

; <label>:143:                                    ; preds = %134
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 0)
  %144 = add i64 %pgocount2, 1
  store i64 %144, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 0)
  %145 = load i32, i32* %10, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %10, align 4
  br label %128

; <label>:147:                                    ; preds = %128
  br label %148

; <label>:148:                                    ; preds = %147
  %149 = load i32, i32* %11, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %11, align 4
  br label %107

; <label>:151:                                    ; preds = %107
  br label %152

; <label>:152:                                    ; preds = %151
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 2)
  %153 = add i64 %pgocount3, 1
  store i64 %153, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 2)
  %154 = load i32, i32* %9, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %9, align 4
  br label %89

; <label>:156:                                    ; preds = %89
  %157 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %158 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %157, i32 0, i32 59
  %159 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %158, align 8
  %160 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %159, i32 0, i32 1
  %161 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %160, align 8
  %162 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %163 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %164 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %163, i32 0, i32 5
  %165 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %164, i32 0, i32 0
  %166 = ptrtoint i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* %161 to i64
  call void @__llvm_profile_instrument_target(i64 %166, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_compress_output to i8*), i32 1)
  %167 = call i32 %161(%struct.jpeg_compress_struct* %162, [64 x i16]** %165)
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %177, label %169

; <label>:169:                                    ; preds = %156
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 6)
  %170 = add i64 %pgocount4, 1
  store i64 %170, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 6)
  %171 = load i32, i32* %12, align 4
  %172 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %173 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %172, i32 0, i32 3
  store i32 %171, i32* %173, align 8
  %174 = load i32, i32* %7, align 4
  %175 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %176 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %175, i32 0, i32 2
  store i32 %174, i32* %176, align 4
  store i32 0, i32* %3, align 4
  br label %196

; <label>:177:                                    ; preds = %156
  br label %178

; <label>:178:                                    ; preds = %177
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 4)
  %179 = add i64 %pgocount5, 1
  store i64 %179, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 4)
  %180 = load i32, i32* %7, align 4
  %181 = add i32 %180, 1
  store i32 %181, i32* %7, align 4
  br label %82

; <label>:182:                                    ; preds = %82
  %183 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %184 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %183, i32 0, i32 2
  store i32 0, i32* %184, align 4
  br label %185

; <label>:185:                                    ; preds = %182
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 5)
  %186 = add i64 %pgocount6, 1
  store i64 %186, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 5)
  %187 = load i32, i32* %12, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %12, align 4
  br label %72

; <label>:189:                                    ; preds = %72
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 7)
  %190 = add i64 %pgocount7, 1
  store i64 %190, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_compress_output, i64 0, i64 7)
  %191 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %192 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %191, i32 0, i32 1
  %193 = load i32, i32* %192, align 8
  %194 = add i32 %193, 1
  store i32 %194, i32* %192, align 8
  %195 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %195)
  store i32 1, i32* %3, align 4
  br label %196

; <label>:196:                                    ; preds = %189, %169
  %197 = load i32, i32* %3, align 4
  ret i32 %197
}

declare void @jzero_far(i8*, i64) #1

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
