; ModuleID = 'tmp1.ll'
source_filename = "jdhuff.c"
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
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.d_derived_tbl = type { [17 x i64], [18 x i64], [17 x i32], %struct.JHUFF_TBL*, [256 x i32], [256 x i8] }
%struct.bitread_working_state = type { i8*, i64, i32, i64, i32, %struct.jpeg_decompress_struct*, i32* }
%struct.huff_entropy_decoder = type { %struct.jpeg_entropy_decoder, %struct.bitread_perm_state, %struct.savable_state, i32, [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*] }
%struct.bitread_perm_state = type { i64, i32, i32 }
%struct.savable_state = type { [4 x i32] }

$__llvm_profile_raw_version = comdat any

@extend_test = internal constant [16 x i32] [i32 0, i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256, i32 512, i32 1024, i32 2048, i32 4096, i32 8192, i32 16384], align 16
@extend_offset = internal constant [16 x i32] [i32 0, i32 -1, i32 -3, i32 -7, i32 -15, i32 -31, i32 -63, i32 -127, i32 -255, i32 -511, i32 -1023, i32 -2047, i32 -4095, i32 -8191, i32 -16383, i32 -32767], align 16
@jpeg_natural_order = external constant [0 x i32], align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_make_d_derived_tbl = private constant [23 x i8] c"jpeg_make_d_derived_tbl"
@__profn_jpeg_fill_bit_buffer = private constant [20 x i8] c"jpeg_fill_bit_buffer"
@__profn_jpeg_huff_decode = private constant [16 x i8] c"jpeg_huff_decode"
@__profn_jinit_huff_decoder = private constant [18 x i8] c"jinit_huff_decoder"
@__profn_tmp1.ll_start_pass_huff_decoder = private constant [31 x i8] c"tmp1.ll:start_pass_huff_decoder"
@__profn_tmp1.ll_decode_mcu = private constant [18 x i8] c"tmp1.ll:decode_mcu"
@__profn_tmp1.ll_process_restart = private constant [23 x i8] c"tmp1.ll:process_restart"
@__profc_jpeg_make_d_derived_tbl = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_make_d_derived_tbl = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_make_d_derived_tbl = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -689166607066026354, i64 281679907857236, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.JHUFF_TBL*, %struct.d_derived_tbl**)* @jpeg_make_d_derived_tbl to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_make_d_derived_tbl to i8*), i32 11, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_fill_bit_buffer = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_fill_bit_buffer = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_fill_bit_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6172195034075007846, i64 844599468023903, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i32 0, i32 0), i8* bitcast (i32 (%struct.bitread_working_state*, i64, i32, i32)* @jpeg_fill_bit_buffer to i8*), i8* bitcast ([3 x i64]* @__profvp_jpeg_fill_bit_buffer to i8*), i32 12, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_jpeg_huff_decode = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_huff_decode = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_huff_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4279240416990332837, i64 281570384253843, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i32 0, i32 0), i8* bitcast (i32 (%struct.bitread_working_state*, i64, i32, %struct.d_derived_tbl*, i32)* @jpeg_huff_decode to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_huff_decode to i8*), i32 7, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jinit_huff_decoder = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_huff_decoder = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_huff_decoder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6358763255504480299, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_decoder, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @jinit_huff_decoder to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_huff_decoder to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_huff_decoder = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_huff_decoder = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_huff_decoder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7613898208025341624, i64 844556478488914, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*)* @start_pass_huff_decoder to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_start_pass_huff_decoder to i8*), i32 12, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_decode_mcu = private global [37 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_decode_mcu = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8054466724734099888, i64 556720811915, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu to i8*), i8* null, i32 37, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_process_restart = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_process_restart = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_process_restart = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7400019580802070602, i64 281526439145375, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_process_restart, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_process_restart to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [103 x i8] c"\9B\01dx\DAm\8BK\0E\80 \0CD\C3\85L\DCz\99\86OQ\B0\08)\C5\F3\8B\92\18\17\EEf\DE\9B\89\05WHzGp\E0\90\C3\89\0E\C4\90\8A7\F7\81\08L\100\CD{\E4\01\B7\9E\FB\D4f\87*\86\A3\DB\0Fa%\A9\CC\13\D1RE\B3@\D1\B5\FE\FB\D1!\D9\F6\A2\C2\D9b\DF3>\E7\0B5\AE;q", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_make_d_derived_tbl to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_fill_bit_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_huff_decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_huff_decoder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff_decoder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_decode_mcu to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_process_restart to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([103 x i8], [103 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct*, %struct.JHUFF_TBL*, %struct.d_derived_tbl**) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.JHUFF_TBL*, align 8
  %6 = alloca %struct.d_derived_tbl**, align 8
  %7 = alloca %struct.d_derived_tbl*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [257 x i8], align 16
  %15 = alloca [257 x i32], align 16
  %16 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.JHUFF_TBL* %1, %struct.JHUFF_TBL** %5, align 8
  store %struct.d_derived_tbl** %2, %struct.d_derived_tbl*** %6, align 8
  %17 = load %struct.d_derived_tbl**, %struct.d_derived_tbl*** %6, align 8
  %18 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %19 = icmp eq %struct.d_derived_tbl* %18, null
  br i1 %19, label %20, label %33

; <label>:20:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 10)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 10)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 1
  %24 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %24, i32 0, i32 0
  %26 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %25, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %28 = bitcast %struct.jpeg_decompress_struct* %27 to %struct.jpeg_common_struct*
  %29 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_make_d_derived_tbl to i8*), i32 0)
  %30 = call i8* %26(%struct.jpeg_common_struct* %28, i32 1, i64 1640)
  %31 = bitcast i8* %30 to %struct.d_derived_tbl*
  %32 = load %struct.d_derived_tbl**, %struct.d_derived_tbl*** %6, align 8
  store %struct.d_derived_tbl* %31, %struct.d_derived_tbl** %32, align 8
  br label %33

; <label>:33:                                     ; preds = %20, %3
  %34 = load %struct.d_derived_tbl**, %struct.d_derived_tbl*** %6, align 8
  %35 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %34, align 8
  store %struct.d_derived_tbl* %35, %struct.d_derived_tbl** %7, align 8
  %36 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %37 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %38 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %37, i32 0, i32 3
  store %struct.JHUFF_TBL* %36, %struct.JHUFF_TBL** %38, align 8
  store i32 0, i32* %8, align 4
  store i32 1, i32* %10, align 4
  br label %39

; <label>:39:                                     ; preds = %66, %33
  %40 = load i32, i32* %10, align 4
  %41 = icmp sle i32 %40, 16
  br i1 %41, label %42, label %69

; <label>:42:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 4)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 4)
  store i32 1, i32* %9, align 4
  br label %44

; <label>:44:                                     ; preds = %62, %42
  %45 = load i32, i32* %9, align 4
  %46 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %47 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %46, i32 0, i32 0
  %48 = load i32, i32* %10, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [17 x i8], [17 x i8]* %47, i64 0, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = icmp sle i32 %45, %52
  br i1 %53, label %54, label %65

; <label>:54:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 1)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 1)
  %56 = load i32, i32* %10, align 4
  %57 = trunc i32 %56 to i8
  %58 = load i32, i32* %8, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %8, align 4
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds [257 x i8], [257 x i8]* %14, i64 0, i64 %60
  store i8 %57, i8* %61, align 1
  br label %62

; <label>:62:                                     ; preds = %54
  %63 = load i32, i32* %9, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %9, align 4
  br label %44

; <label>:65:                                     ; preds = %44
  br label %66

; <label>:66:                                     ; preds = %65
  %67 = load i32, i32* %10, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %10, align 4
  br label %39

; <label>:69:                                     ; preds = %39
  %70 = load i32, i32* %8, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [257 x i8], [257 x i8]* %14, i64 0, i64 %71
  store i8 0, i8* %72, align 1
  store i32 0, i32* %16, align 4
  %73 = getelementptr inbounds [257 x i8], [257 x i8]* %14, i64 0, i64 0
  %74 = load i8, i8* %73, align 16
  %75 = sext i8 %74 to i32
  store i32 %75, i32* %11, align 4
  store i32 0, i32* %8, align 4
  br label %76

; <label>:76:                                     ; preds = %101, %69
  %77 = load i32, i32* %8, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [257 x i8], [257 x i8]* %14, i64 0, i64 %78
  %80 = load i8, i8* %79, align 1
  %81 = icmp ne i8 %80, 0
  br i1 %81, label %82, label %106

; <label>:82:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 5)
  %83 = add i64 %pgocount3, 1
  store i64 %83, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 5)
  br label %84

; <label>:84:                                     ; preds = %92, %82
  %85 = load i32, i32* %8, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [257 x i8], [257 x i8]* %14, i64 0, i64 %86
  %88 = load i8, i8* %87, align 1
  %89 = sext i8 %88 to i32
  %90 = load i32, i32* %11, align 4
  %91 = icmp eq i32 %89, %90
  br i1 %91, label %92, label %101

; <label>:92:                                     ; preds = %84
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 2)
  %93 = add i64 %pgocount4, 1
  store i64 %93, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 2)
  %94 = load i32, i32* %16, align 4
  %95 = load i32, i32* %8, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %8, align 4
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds [257 x i32], [257 x i32]* %15, i64 0, i64 %97
  store i32 %94, i32* %98, align 4
  %99 = load i32, i32* %16, align 4
  %100 = add i32 %99, 1
  store i32 %100, i32* %16, align 4
  br label %84

; <label>:101:                                    ; preds = %84
  %102 = load i32, i32* %16, align 4
  %103 = shl i32 %102, 1
  store i32 %103, i32* %16, align 4
  %104 = load i32, i32* %11, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %11, align 4
  br label %76

; <label>:106:                                    ; preds = %76
  store i32 0, i32* %8, align 4
  store i32 1, i32* %10, align 4
  br label %107

; <label>:107:                                    ; preds = %164, %106
  %108 = load i32, i32* %10, align 4
  %109 = icmp sle i32 %108, 16
  br i1 %109, label %110, label %167

; <label>:110:                                    ; preds = %107
  %111 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %112 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %111, i32 0, i32 0
  %113 = load i32, i32* %10, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [17 x i8], [17 x i8]* %112, i64 0, i64 %114
  %116 = load i8, i8* %115, align 1
  %117 = icmp ne i8 %116, 0
  br i1 %117, label %118, label %156

; <label>:118:                                    ; preds = %110
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 7)
  %119 = add i64 %pgocount5, 1
  store i64 %119, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 7)
  %120 = load i32, i32* %8, align 4
  %121 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %122 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %121, i32 0, i32 2
  %123 = load i32, i32* %10, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [17 x i32], [17 x i32]* %122, i64 0, i64 %124
  store i32 %120, i32* %125, align 4
  %126 = load i32, i32* %8, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [257 x i32], [257 x i32]* %15, i64 0, i64 %127
  %129 = load i32, i32* %128, align 4
  %130 = zext i32 %129 to i64
  %131 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %132 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %131, i32 0, i32 0
  %133 = load i32, i32* %10, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [17 x i64], [17 x i64]* %132, i64 0, i64 %134
  store i64 %130, i64* %135, align 8
  %136 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %137 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %136, i32 0, i32 0
  %138 = load i32, i32* %10, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [17 x i8], [17 x i8]* %137, i64 0, i64 %139
  %141 = load i8, i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = load i32, i32* %8, align 4
  %144 = add nsw i32 %143, %142
  store i32 %144, i32* %8, align 4
  %145 = load i32, i32* %8, align 4
  %146 = sub nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [257 x i32], [257 x i32]* %15, i64 0, i64 %147
  %149 = load i32, i32* %148, align 4
  %150 = zext i32 %149 to i64
  %151 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %152 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %151, i32 0, i32 1
  %153 = load i32, i32* %10, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [18 x i64], [18 x i64]* %152, i64 0, i64 %154
  store i64 %150, i64* %155, align 8
  br label %163

; <label>:156:                                    ; preds = %110
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 8)
  %157 = add i64 %pgocount6, 1
  store i64 %157, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 8)
  %158 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %159 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %158, i32 0, i32 1
  %160 = load i32, i32* %10, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [18 x i64], [18 x i64]* %159, i64 0, i64 %161
  store i64 -1, i64* %162, align 8
  br label %163

; <label>:163:                                    ; preds = %156, %118
  br label %164

; <label>:164:                                    ; preds = %163
  %165 = load i32, i32* %10, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %10, align 4
  br label %107

; <label>:167:                                    ; preds = %107
  %168 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %169 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %168, i32 0, i32 1
  %170 = getelementptr inbounds [18 x i64], [18 x i64]* %169, i64 0, i64 17
  store i64 1048575, i64* %170, align 8
  %171 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %172 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %171, i32 0, i32 4
  %173 = getelementptr inbounds [256 x i32], [256 x i32]* %172, i32 0, i32 0
  %174 = bitcast i32* %173 to i8*
  call void @llvm.memset.p0i8.i64(i8* %174, i8 0, i64 1024, i32 8, i1 false)
  store i32 0, i32* %8, align 4
  store i32 1, i32* %10, align 4
  br label %175

; <label>:175:                                    ; preds = %236, %167
  %176 = load i32, i32* %10, align 4
  %177 = icmp sle i32 %176, 8
  br i1 %177, label %178, label %239

; <label>:178:                                    ; preds = %175
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 6)
  %179 = add i64 %pgocount7, 1
  store i64 %179, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 6)
  store i32 1, i32* %9, align 4
  br label %180

; <label>:180:                                    ; preds = %230, %178
  %181 = load i32, i32* %9, align 4
  %182 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %183 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %182, i32 0, i32 0
  %184 = load i32, i32* %10, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [17 x i8], [17 x i8]* %183, i64 0, i64 %185
  %187 = load i8, i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = icmp sle i32 %181, %188
  br i1 %189, label %190, label %235

; <label>:190:                                    ; preds = %180
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 3)
  %191 = add i64 %pgocount8, 1
  store i64 %191, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 3)
  %192 = load i32, i32* %8, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [257 x i32], [257 x i32]* %15, i64 0, i64 %193
  %195 = load i32, i32* %194, align 4
  %196 = load i32, i32* %10, align 4
  %197 = sub nsw i32 8, %196
  %198 = shl i32 %195, %197
  store i32 %198, i32* %12, align 4
  %199 = load i32, i32* %10, align 4
  %200 = sub nsw i32 8, %199
  %201 = shl i32 1, %200
  store i32 %201, i32* %13, align 4
  br label %202

; <label>:202:                                    ; preds = %226, %190
  %203 = load i32, i32* %13, align 4
  %204 = icmp sgt i32 %203, 0
  br i1 %204, label %205, label %229

; <label>:205:                                    ; preds = %202
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 0)
  %206 = add i64 %pgocount9, 1
  store i64 %206, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 0)
  %207 = load i32, i32* %10, align 4
  %208 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %209 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %208, i32 0, i32 4
  %210 = load i32, i32* %12, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [256 x i32], [256 x i32]* %209, i64 0, i64 %211
  store i32 %207, i32* %212, align 4
  %213 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %214 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %213, i32 0, i32 1
  %215 = load i32, i32* %8, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [256 x i8], [256 x i8]* %214, i64 0, i64 %216
  %218 = load i8, i8* %217, align 1
  %219 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %7, align 8
  %220 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %219, i32 0, i32 5
  %221 = load i32, i32* %12, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [256 x i8], [256 x i8]* %220, i64 0, i64 %222
  store i8 %218, i8* %223, align 1
  %224 = load i32, i32* %12, align 4
  %225 = add nsw i32 %224, 1
  store i32 %225, i32* %12, align 4
  br label %226

; <label>:226:                                    ; preds = %205
  %227 = load i32, i32* %13, align 4
  %228 = add nsw i32 %227, -1
  store i32 %228, i32* %13, align 4
  br label %202

; <label>:229:                                    ; preds = %202
  br label %230

; <label>:230:                                    ; preds = %229
  %231 = load i32, i32* %9, align 4
  %232 = add nsw i32 %231, 1
  store i32 %232, i32* %9, align 4
  %233 = load i32, i32* %8, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %8, align 4
  br label %180

; <label>:235:                                    ; preds = %180
  br label %236

; <label>:236:                                    ; preds = %235
  %237 = load i32, i32* %10, align 4
  %238 = add nsw i32 %237, 1
  store i32 %238, i32* %10, align 4
  br label %175

; <label>:239:                                    ; preds = %175
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 9)
  %240 = add i64 %pgocount10, 1
  store i64 %240, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_make_d_derived_tbl, i64 0, i64 9)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state*, i64, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.bitread_working_state*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  store %struct.bitread_working_state* %0, %struct.bitread_working_state** %6, align 8
  store i64 %1, i64* %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %13 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %14 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %13, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8
  store i8* %15, i8** %10, align 8
  %16 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %17 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %16, i32 0, i32 1
  %18 = load i64, i64* %17, align 8
  store i64 %18, i64* %11, align 8
  br label %19

; <label>:19:                                     ; preds = %168, %4
  %20 = load i32, i32* %8, align 4
  %21 = icmp slt i32 %20, 25
  br i1 %21, label %22, label %176

; <label>:22:                                     ; preds = %19
  %23 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %24 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %23, i32 0, i32 2
  %25 = load i32, i32* %24, align 8
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 2)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 2)
  br label %131

; <label>:29:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 3)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 3)
  %31 = load i64, i64* %11, align 8
  %32 = icmp eq i64 %31, 0
  br i1 %32, label %33, label %65

; <label>:33:                                     ; preds = %29
  %34 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %35 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %34, i32 0, i32 5
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 5
  %38 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %38, i32 0, i32 3
  %40 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %39, align 8
  %41 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %42 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %41, i32 0, i32 5
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %42, align 8
  %44 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %40 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_fill_bit_buffer to i8*), i32 0)
  %45 = call i32 %40(%struct.jpeg_decompress_struct* %43)
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %49, label %47

; <label>:47:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 11)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 11)
  store i32 0, i32* %5, align 4
  br label %190

; <label>:49:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 5)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 5)
  %51 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %52 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %51, i32 0, i32 5
  %53 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %53, i32 0, i32 5
  %55 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %55, i32 0, i32 0
  %57 = load i8*, i8** %56, align 8
  store i8* %57, i8** %10, align 8
  %58 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %59 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %58, i32 0, i32 5
  %60 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %60, i32 0, i32 5
  %62 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %62, i32 0, i32 1
  %64 = load i64, i64* %63, align 8
  store i64 %64, i64* %11, align 8
  br label %65

; <label>:65:                                     ; preds = %49, %29
  %66 = load i64, i64* %11, align 8
  %67 = add i64 %66, -1
  store i64 %67, i64* %11, align 8
  %68 = load i8*, i8** %10, align 8
  %69 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %69, i8** %10, align 8
  %70 = load i8, i8* %68, align 1
  %71 = zext i8 %70 to i32
  store i32 %71, i32* %12, align 4
  %72 = load i32, i32* %12, align 4
  %73 = icmp eq i32 %72, 255
  br i1 %73, label %74, label %168

; <label>:74:                                     ; preds = %65
  br label %75

; <label>:75:                                     ; preds = %118, %74
  %76 = load i64, i64* %11, align 8
  %77 = icmp eq i64 %76, 0
  br i1 %77, label %78, label %110

; <label>:78:                                     ; preds = %75
  %79 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %80 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %79, i32 0, i32 5
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %80, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 5
  %83 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %83, i32 0, i32 3
  %85 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %84, align 8
  %86 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %87 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %86, i32 0, i32 5
  %88 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %87, align 8
  %89 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %85 to i64
  call void @__llvm_profile_instrument_target(i64 %89, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_fill_bit_buffer to i8*), i32 1)
  %90 = call i32 %85(%struct.jpeg_decompress_struct* %88)
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %94, label %92

; <label>:92:                                     ; preds = %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 8)
  %93 = add i64 %pgocount4, 1
  store i64 %93, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 8)
  store i32 0, i32* %5, align 4
  br label %190

; <label>:94:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 1)
  %95 = add i64 %pgocount5, 1
  store i64 %95, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 1)
  %96 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %97 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %96, i32 0, i32 5
  %98 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %98, i32 0, i32 5
  %100 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %99, align 8
  %101 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %100, i32 0, i32 0
  %102 = load i8*, i8** %101, align 8
  store i8* %102, i8** %10, align 8
  %103 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %104 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %103, i32 0, i32 5
  %105 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %105, i32 0, i32 5
  %107 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %106, align 8
  %108 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %107, i32 0, i32 1
  %109 = load i64, i64* %108, align 8
  store i64 %109, i64* %11, align 8
  br label %110

; <label>:110:                                    ; preds = %94, %75
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 0)
  %111 = add i64 %pgocount6, 1
  store i64 %111, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 0)
  %112 = load i64, i64* %11, align 8
  %113 = add i64 %112, -1
  store i64 %113, i64* %11, align 8
  %114 = load i8*, i8** %10, align 8
  %115 = getelementptr inbounds i8, i8* %114, i32 1
  store i8* %115, i8** %10, align 8
  %116 = load i8, i8* %114, align 1
  %117 = zext i8 %116 to i32
  store i32 %117, i32* %12, align 4
  br label %118

; <label>:118:                                    ; preds = %110
  %119 = load i32, i32* %12, align 4
  %120 = icmp eq i32 %119, 255
  br i1 %120, label %75, label %121

; <label>:121:                                    ; preds = %118
  %122 = load i32, i32* %12, align 4
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %126

; <label>:124:                                    ; preds = %121
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 9)
  %125 = add i64 %pgocount7, 1
  store i64 %125, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 9)
  store i32 255, i32* %12, align 4
  br label %167

; <label>:126:                                    ; preds = %121
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 6)
  %127 = add i64 %pgocount8, 1
  store i64 %127, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 6)
  %128 = load i32, i32* %12, align 4
  %129 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %130 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %129, i32 0, i32 2
  store i32 %128, i32* %130, align 8
  br label %131

; <label>:131:                                    ; preds = %126, %27
  %132 = load i32, i32* %8, align 4
  %133 = load i32, i32* %9, align 4
  %134 = icmp sge i32 %132, %133
  br i1 %134, label %135, label %137

; <label>:135:                                    ; preds = %131
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 10)
  %136 = add i64 %pgocount9, 1
  store i64 %136, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 10)
  br label %176

; <label>:137:                                    ; preds = %131
  %138 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %139 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %138, i32 0, i32 6
  %140 = load i32*, i32** %139, align 8
  %141 = load i32, i32* %140, align 4
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %166, label %143

; <label>:143:                                    ; preds = %137
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 4)
  %144 = add i64 %pgocount10, 1
  store i64 %144, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 4)
  %145 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %146 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %145, i32 0, i32 5
  %147 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %146, align 8
  %148 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %147, i32 0, i32 0
  %149 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %148, align 8
  %150 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %149, i32 0, i32 5
  store i32 113, i32* %150, align 8
  %151 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %152 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %151, i32 0, i32 5
  %153 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %152, align 8
  %154 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %153, i32 0, i32 0
  %155 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %154, align 8
  %156 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %155, i32 0, i32 1
  %157 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %156, align 8
  %158 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %159 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %158, i32 0, i32 5
  %160 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %159, align 8
  %161 = bitcast %struct.jpeg_decompress_struct* %160 to %struct.jpeg_common_struct*
  %162 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %157 to i64
  call void @__llvm_profile_instrument_target(i64 %162, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_fill_bit_buffer to i8*), i32 2)
  call void %157(%struct.jpeg_common_struct* %161, i32 -1)
  %163 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %164 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %163, i32 0, i32 6
  %165 = load i32*, i32** %164, align 8
  store i32 1, i32* %165, align 4
  br label %166

; <label>:166:                                    ; preds = %143, %137
  store i32 0, i32* %12, align 4
  br label %167

; <label>:167:                                    ; preds = %166, %124
  br label %168

; <label>:168:                                    ; preds = %167, %65
  %169 = load i64, i64* %7, align 8
  %170 = shl i64 %169, 8
  %171 = load i32, i32* %12, align 4
  %172 = sext i32 %171 to i64
  %173 = or i64 %170, %172
  store i64 %173, i64* %7, align 8
  %174 = load i32, i32* %8, align 4
  %175 = add nsw i32 %174, 8
  store i32 %175, i32* %8, align 4
  br label %19

; <label>:176:                                    ; preds = %135, %19
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 7)
  %177 = add i64 %pgocount11, 1
  store i64 %177, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_jpeg_fill_bit_buffer, i64 0, i64 7)
  %178 = load i8*, i8** %10, align 8
  %179 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %180 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %179, i32 0, i32 0
  store i8* %178, i8** %180, align 8
  %181 = load i64, i64* %11, align 8
  %182 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %183 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %182, i32 0, i32 1
  store i64 %181, i64* %183, align 8
  %184 = load i64, i64* %7, align 8
  %185 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %186 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %185, i32 0, i32 3
  store i64 %184, i64* %186, align 8
  %187 = load i32, i32* %8, align 4
  %188 = load %struct.bitread_working_state*, %struct.bitread_working_state** %6, align 8
  %189 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %188, i32 0, i32 4
  store i32 %187, i32* %189, align 8
  store i32 1, i32* %5, align 4
  br label %190

; <label>:190:                                    ; preds = %176, %92, %47
  %191 = load i32, i32* %5, align 4
  ret i32 %191
}

; Function Attrs: nounwind uwtable
define i32 @jpeg_huff_decode(%struct.bitread_working_state*, i64, i32, %struct.d_derived_tbl*, i32) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.bitread_working_state*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.d_derived_tbl*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  store %struct.bitread_working_state* %0, %struct.bitread_working_state** %7, align 8
  store i64 %1, i64* %8, align 8
  store i32 %2, i32* %9, align 4
  store %struct.d_derived_tbl* %3, %struct.d_derived_tbl** %10, align 8
  store i32 %4, i32* %11, align 4
  %14 = load i32, i32* %11, align 4
  store i32 %14, i32* %12, align 4
  %15 = load i32, i32* %9, align 4
  %16 = load i32, i32* %12, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %35

; <label>:18:                                     ; preds = %5
  %19 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %20 = load i64, i64* %8, align 8
  %21 = load i32, i32* %9, align 4
  %22 = load i32, i32* %12, align 4
  %23 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %19, i64 %20, i32 %21, i32 %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %27, label %25

; <label>:25:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 6)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 6)
  store i32 -1, i32* %6, align 4
  br label %147

; <label>:27:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 2)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 2)
  %29 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %30 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %29, i32 0, i32 3
  %31 = load i64, i64* %30, align 8
  store i64 %31, i64* %8, align 8
  %32 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %33 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %32, i32 0, i32 4
  %34 = load i32, i32* %33, align 8
  store i32 %34, i32* %9, align 4
  br label %35

; <label>:35:                                     ; preds = %27, %5
  %36 = load i64, i64* %8, align 8
  %37 = load i32, i32* %12, align 4
  %38 = load i32, i32* %9, align 4
  %39 = sub nsw i32 %38, %37
  store i32 %39, i32* %9, align 4
  %40 = zext i32 %39 to i64
  %41 = ashr i64 %36, %40
  %42 = trunc i64 %41 to i32
  %43 = load i32, i32* %12, align 4
  %44 = shl i32 1, %43
  %45 = sub nsw i32 %44, 1
  %46 = and i32 %42, %45
  %47 = sext i32 %46 to i64
  store i64 %47, i64* %13, align 8
  br label %48

; <label>:48:                                     ; preds = %78, %35
  %49 = load i64, i64* %13, align 8
  %50 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %10, align 8
  %51 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %50, i32 0, i32 1
  %52 = load i32, i32* %12, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [18 x i64], [18 x i64]* %51, i64 0, i64 %53
  %55 = load i64, i64* %54, align 8
  %56 = icmp sgt i64 %49, %55
  br i1 %56, label %57, label %92

; <label>:57:                                     ; preds = %48
  %58 = load i64, i64* %13, align 8
  %59 = shl i64 %58, 1
  store i64 %59, i64* %13, align 8
  %60 = load i32, i32* %9, align 4
  %61 = icmp slt i32 %60, 1
  br i1 %61, label %62, label %78

; <label>:62:                                     ; preds = %57
  %63 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %64 = load i64, i64* %8, align 8
  %65 = load i32, i32* %9, align 4
  %66 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %63, i64 %64, i32 %65, i32 1)
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %70, label %68

; <label>:68:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 5)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 5)
  store i32 -1, i32* %6, align 4
  br label %147

; <label>:70:                                     ; preds = %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 1)
  %71 = add i64 %pgocount3, 1
  store i64 %71, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 1)
  %72 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %73 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %72, i32 0, i32 3
  %74 = load i64, i64* %73, align 8
  store i64 %74, i64* %8, align 8
  %75 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %76 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %75, i32 0, i32 4
  %77 = load i32, i32* %76, align 8
  store i32 %77, i32* %9, align 4
  br label %78

; <label>:78:                                     ; preds = %70, %57
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 0)
  %79 = add i64 %pgocount4, 1
  store i64 %79, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 0)
  %80 = load i64, i64* %8, align 8
  %81 = load i32, i32* %9, align 4
  %82 = sub nsw i32 %81, 1
  store i32 %82, i32* %9, align 4
  %83 = zext i32 %82 to i64
  %84 = ashr i64 %80, %83
  %85 = trunc i64 %84 to i32
  %86 = and i32 %85, 1
  %87 = sext i32 %86 to i64
  %88 = load i64, i64* %13, align 8
  %89 = or i64 %88, %87
  store i64 %89, i64* %13, align 8
  %90 = load i32, i32* %12, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %12, align 4
  br label %48

; <label>:92:                                     ; preds = %48
  %93 = load i64, i64* %8, align 8
  %94 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %95 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %94, i32 0, i32 3
  store i64 %93, i64* %95, align 8
  %96 = load i32, i32* %9, align 4
  %97 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %98 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %97, i32 0, i32 4
  store i32 %96, i32* %98, align 8
  %99 = load i32, i32* %12, align 4
  %100 = icmp sgt i32 %99, 16
  br i1 %100, label %101, label %121

; <label>:101:                                    ; preds = %92
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 3)
  %102 = add i64 %pgocount5, 1
  store i64 %102, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 3)
  %103 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %104 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %103, i32 0, i32 5
  %105 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %105, i32 0, i32 0
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %106, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i32 0, i32 5
  store i32 114, i32* %108, align 8
  %109 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %110 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %109, i32 0, i32 5
  %111 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %110, align 8
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %111, i32 0, i32 0
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %112, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i32 0, i32 1
  %115 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %114, align 8
  %116 = load %struct.bitread_working_state*, %struct.bitread_working_state** %7, align 8
  %117 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %116, i32 0, i32 5
  %118 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %117, align 8
  %119 = bitcast %struct.jpeg_decompress_struct* %118 to %struct.jpeg_common_struct*
  %120 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %115 to i64
  call void @__llvm_profile_instrument_target(i64 %120, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_huff_decode to i8*), i32 0)
  call void %115(%struct.jpeg_common_struct* %119, i32 -1)
  store i32 0, i32* %6, align 4
  br label %147

; <label>:121:                                    ; preds = %92
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 4)
  %122 = add i64 %pgocount6, 1
  store i64 %122, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_huff_decode, i64 0, i64 4)
  %123 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %10, align 8
  %124 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %123, i32 0, i32 3
  %125 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %124, align 8
  %126 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %125, i32 0, i32 1
  %127 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %10, align 8
  %128 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %127, i32 0, i32 2
  %129 = load i32, i32* %12, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [17 x i32], [17 x i32]* %128, i64 0, i64 %130
  %132 = load i32, i32* %131, align 4
  %133 = load i64, i64* %13, align 8
  %134 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %10, align 8
  %135 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %134, i32 0, i32 0
  %136 = load i32, i32* %12, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [17 x i64], [17 x i64]* %135, i64 0, i64 %137
  %139 = load i64, i64* %138, align 8
  %140 = sub nsw i64 %133, %139
  %141 = trunc i64 %140 to i32
  %142 = add nsw i32 %132, %141
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [256 x i8], [256 x i8]* %126, i64 0, i64 %143
  %145 = load i8, i8* %144, align 1
  %146 = zext i8 %145 to i32
  store i32 %146, i32* %6, align 4
  br label %147

; <label>:147:                                    ; preds = %121, %101, %68, %25
  %148 = load i32, i32* %6, align 4
  ret i32 %148
}

; Function Attrs: nounwind uwtable
define void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.huff_entropy_decoder*, align 8
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
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_huff_decoder to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 120)
  %14 = bitcast i8* %13 to %struct.huff_entropy_decoder*
  store %struct.huff_entropy_decoder* %14, %struct.huff_entropy_decoder** %3, align 8
  %15 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %16 = bitcast %struct.huff_entropy_decoder* %15 to %struct.jpeg_entropy_decoder*
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 79
  store %struct.jpeg_entropy_decoder* %16, %struct.jpeg_entropy_decoder** %18, align 8
  %19 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %20 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %20, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*)* @start_pass_huff_decoder, void (%struct.jpeg_decompress_struct*)** %21, align 8
  %22 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %23 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %22, i32 0, i32 0
  %24 = getelementptr inbounds %struct.jpeg_entropy_decoder, %struct.jpeg_entropy_decoder* %23, i32 0, i32 1
  store i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* @decode_mcu, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)** %24, align 8
  store i32 0, i32* %4, align 4
  br label %25

; <label>:25:                                     ; preds = %39, %1
  %26 = load i32, i32* %4, align 4
  %27 = icmp slt i32 %26, 4
  br i1 %27, label %28, label %43

; <label>:28:                                     ; preds = %25
  %29 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %30 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %29, i32 0, i32 5
  %31 = load i32, i32* %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %30, i64 0, i64 %32
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %33, align 8
  %34 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %35 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %34, i32 0, i32 4
  %36 = load i32, i32* %4, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %35, i64 0, i64 %37
  store %struct.d_derived_tbl* null, %struct.d_derived_tbl** %38, align 8
  br label %39

; <label>:39:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_decoder, i64 0, i64 0)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_decoder, i64 0, i64 0)
  %41 = load i32, i32* %4, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %4, align 4
  br label %25

; <label>:43:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_decoder, i64 0, i64 1)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_decoder, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_pass_huff_decoder(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.huff_entropy_decoder*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 79
  %10 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %9, align 8
  %11 = bitcast %struct.jpeg_entropy_decoder* %10 to %struct.huff_entropy_decoder*
  store %struct.huff_entropy_decoder* %11, %struct.huff_entropy_decoder** %3, align 8
  %12 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %12, i32 0, i32 68
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %34, label %16

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 9)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 9)
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 69
  %20 = load i32, i32* %19, align 8
  %21 = icmp ne i32 %20, 63
  br i1 %21, label %34, label %22

; <label>:22:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 10)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 10)
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 70
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %34, label %28

; <label>:28:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 11)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 11)
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 71
  %32 = load i32, i32* %31, align 8
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %48

; <label>:34:                                     ; preds = %28, %22, %16, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 8)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 8)
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i32 0, i32 5
  store i32 118, i32* %39, align 8
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %40, i32 0, i32 0
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i32 0, i32 1
  %44 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %43, align 8
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %46 = bitcast %struct.jpeg_decompress_struct* %45 to %struct.jpeg_common_struct*
  %47 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %44 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff_decoder to i8*), i32 0)
  call void %44(%struct.jpeg_common_struct* %46, i32 -1)
  br label %48

; <label>:48:                                     ; preds = %34, %28
  store i32 0, i32* %4, align 4
  br label %49

; <label>:49:                                     ; preds = %173, %48
  %50 = load i32, i32* %4, align 4
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 62
  %53 = load i32, i32* %52, align 8
  %54 = icmp slt i32 %50, %53
  br i1 %54, label %55, label %176

; <label>:55:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 0)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 0)
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 63
  %59 = load i32, i32* %4, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %58, i64 0, i64 %60
  %62 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %61, align 8
  store %struct.jpeg_component_info* %62, %struct.jpeg_component_info** %7, align 8
  %63 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %64 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %63, i32 0, i32 5
  %65 = load i32, i32* %64, align 4
  store i32 %65, i32* %5, align 4
  %66 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i32 0, i32 6
  %68 = load i32, i32* %67, align 8
  store i32 %68, i32* %6, align 4
  %69 = load i32, i32* %5, align 4
  %70 = icmp slt i32 %69, 0
  br i1 %70, label %84, label %71

; <label>:71:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 3)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 3)
  %73 = load i32, i32* %5, align 4
  %74 = icmp sge i32 %73, 4
  br i1 %74, label %84, label %75

; <label>:75:                                     ; preds = %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 5)
  %76 = add i64 %pgocount6, 1
  store i64 %76, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 5)
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i32 0, i32 40
  %79 = load i32, i32* %5, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %78, i64 0, i64 %80
  %82 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %81, align 8
  %83 = icmp eq %struct.JHUFF_TBL* %82, null
  br i1 %83, label %84, label %105

; <label>:84:                                     ; preds = %75, %71, %55
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 1)
  %85 = add i64 %pgocount7, 1
  store i64 %85, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 1)
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %86, i32 0, i32 0
  %88 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %87, align 8
  %89 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %88, i32 0, i32 5
  store i32 49, i32* %89, align 8
  %90 = load i32, i32* %5, align 4
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 0
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i32 0, i32 6
  %95 = bitcast %union.anon* %94 to [8 x i32]*
  %96 = getelementptr inbounds [8 x i32], [8 x i32]* %95, i64 0, i64 0
  store i32 %90, i32* %96, align 4
  %97 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %97, i32 0, i32 0
  %99 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %98, align 8
  %100 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %99, i32 0, i32 0
  %101 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %100, align 8
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %103 = bitcast %struct.jpeg_decompress_struct* %102 to %struct.jpeg_common_struct*
  %104 = ptrtoint void (%struct.jpeg_common_struct*)* %101 to i64
  call void @__llvm_profile_instrument_target(i64 %104, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff_decoder to i8*), i32 1)
  call void %101(%struct.jpeg_common_struct* %103)
  br label %105

; <label>:105:                                    ; preds = %84, %75
  %106 = load i32, i32* %6, align 4
  %107 = icmp slt i32 %106, 0
  br i1 %107, label %121, label %108

; <label>:108:                                    ; preds = %105
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 4)
  %109 = add i64 %pgocount8, 1
  store i64 %109, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 4)
  %110 = load i32, i32* %6, align 4
  %111 = icmp sge i32 %110, 4
  br i1 %111, label %121, label %112

; <label>:112:                                    ; preds = %108
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 6)
  %113 = add i64 %pgocount9, 1
  store i64 %113, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 6)
  %114 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %115 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %114, i32 0, i32 41
  %116 = load i32, i32* %6, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %115, i64 0, i64 %117
  %119 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %118, align 8
  %120 = icmp eq %struct.JHUFF_TBL* %119, null
  br i1 %120, label %121, label %142

; <label>:121:                                    ; preds = %112, %108, %105
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 2)
  %122 = add i64 %pgocount10, 1
  store i64 %122, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 2)
  %123 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %124 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %123, i32 0, i32 0
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %124, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i32 0, i32 5
  store i32 49, i32* %126, align 8
  %127 = load i32, i32* %6, align 4
  %128 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %129 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %128, i32 0, i32 0
  %130 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %129, align 8
  %131 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %130, i32 0, i32 6
  %132 = bitcast %union.anon* %131 to [8 x i32]*
  %133 = getelementptr inbounds [8 x i32], [8 x i32]* %132, i64 0, i64 0
  store i32 %127, i32* %133, align 4
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %134, i32 0, i32 0
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %135, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i32 0, i32 0
  %138 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %137, align 8
  %139 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %140 = bitcast %struct.jpeg_decompress_struct* %139 to %struct.jpeg_common_struct*
  %141 = ptrtoint void (%struct.jpeg_common_struct*)* %138 to i64
  call void @__llvm_profile_instrument_target(i64 %141, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff_decoder to i8*), i32 2)
  call void %138(%struct.jpeg_common_struct* %140)
  br label %142

; <label>:142:                                    ; preds = %121, %112
  %143 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %144 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %145 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %144, i32 0, i32 40
  %146 = load i32, i32* %5, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %145, i64 0, i64 %147
  %149 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %148, align 8
  %150 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %151 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %150, i32 0, i32 4
  %152 = load i32, i32* %5, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %151, i64 0, i64 %153
  call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* %143, %struct.JHUFF_TBL* %149, %struct.d_derived_tbl** %154)
  %155 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %156 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %157 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %156, i32 0, i32 41
  %158 = load i32, i32* %6, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %157, i64 0, i64 %159
  %161 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %160, align 8
  %162 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %163 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %162, i32 0, i32 5
  %164 = load i32, i32* %6, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %163, i64 0, i64 %165
  call void @jpeg_make_d_derived_tbl(%struct.jpeg_decompress_struct* %155, %struct.JHUFF_TBL* %161, %struct.d_derived_tbl** %166)
  %167 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %168 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %167, i32 0, i32 2
  %169 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %168, i32 0, i32 0
  %170 = load i32, i32* %4, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [4 x i32], [4 x i32]* %169, i64 0, i64 %171
  store i32 0, i32* %172, align 4
  br label %173

; <label>:173:                                    ; preds = %142
  %174 = load i32, i32* %4, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %4, align 4
  br label %49

; <label>:176:                                    ; preds = %49
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 7)
  %177 = add i64 %pgocount11, 1
  store i64 %177, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_start_pass_huff_decoder, i64 0, i64 7)
  %178 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %179 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %178, i32 0, i32 1
  %180 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %179, i32 0, i32 1
  store i32 0, i32* %180, align 8
  %181 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %182 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %181, i32 0, i32 1
  %183 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %182, i32 0, i32 0
  store i64 0, i64* %183, align 8
  %184 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %185 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %184, i32 0, i32 1
  %186 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %185, i32 0, i32 2
  store i32 0, i32* %186, align 4
  %187 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %188 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %187, i32 0, i32 49
  %189 = load i32, i32* %188, align 8
  %190 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %3, align 8
  %191 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %190, i32 0, i32 3
  store i32 %189, i32* %191, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @decode_mcu(%struct.jpeg_decompress_struct*, [64 x i16]**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca [64 x i16]**, align 8
  %6 = alloca %struct.huff_entropy_decoder*, align 8
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
  %18 = alloca %struct.d_derived_tbl*, align 8
  %19 = alloca %struct.jpeg_component_info*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store [64 x i16]** %1, [64 x i16]*** %5, align 8
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 79
  %28 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %27, align 8
  %29 = bitcast %struct.jpeg_entropy_decoder* %28 to %struct.huff_entropy_decoder*
  store %struct.huff_entropy_decoder* %29, %struct.huff_entropy_decoder** %6, align 8
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 49
  %32 = load i32, i32* %31, align 8
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %49

; <label>:34:                                     ; preds = %2
  %35 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %36 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %35, i32 0, i32 3
  %37 = load i32, i32* %36, align 8
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %47

; <label>:39:                                     ; preds = %34
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %41 = call i32 @process_restart(%struct.jpeg_decompress_struct* %40)
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %45, label %43

; <label>:43:                                     ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 30)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 30)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:45:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 26)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 26)
  br label %47

; <label>:47:                                     ; preds = %45, %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 14)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 14)
  br label %49

; <label>:49:                                     ; preds = %47, %2
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %51 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 5
  store %struct.jpeg_decompress_struct* %50, %struct.jpeg_decompress_struct** %51, align 8
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i32 0, i32 5
  %54 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %54, i32 0, i32 0
  %56 = load i8*, i8** %55, align 8
  %57 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 0
  store i8* %56, i8** %57, align 8
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 5
  %60 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %60, i32 0, i32 1
  %62 = load i64, i64* %61, align 8
  %63 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 1
  store i64 %62, i64* %63, align 8
  %64 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %64, i32 0, i32 72
  %66 = load i32, i32* %65, align 4
  %67 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 2
  store i32 %66, i32* %67, align 8
  %68 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %69 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %68, i32 0, i32 1
  %70 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %69, i32 0, i32 0
  %71 = load i64, i64* %70, align 8
  store i64 %71, i64* %13, align 8
  %72 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %73 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %72, i32 0, i32 1
  %74 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %73, i32 0, i32 1
  %75 = load i32, i32* %74, align 8
  store i32 %75, i32* %14, align 4
  %76 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %77 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %76, i32 0, i32 1
  %78 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %77, i32 0, i32 2
  %79 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 6
  store i32* %78, i32** %79, align 8
  %80 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %81 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %80, i32 0, i32 2
  %82 = bitcast %struct.savable_state* %16 to i8*
  %83 = bitcast %struct.savable_state* %81 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %82, i8* %83, i64 16, i32 4, i1 false)
  store i32 0, i32* %10, align 4
  br label %84

; <label>:84:                                     ; preds = %533, %49
  %85 = load i32, i32* %10, align 4
  %86 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %86, i32 0, i32 66
  %88 = load i32, i32* %87, align 8
  %89 = icmp slt i32 %85, %88
  br i1 %89, label %90, label %536

; <label>:90:                                     ; preds = %84
  %91 = load [64 x i16]**, [64 x i16]*** %5, align 8
  %92 = load i32, i32* %10, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [64 x i16]*, [64 x i16]** %91, i64 %93
  %95 = load [64 x i16]*, [64 x i16]** %94, align 8
  store [64 x i16]* %95, [64 x i16]** %12, align 8
  %96 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %97 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %96, i32 0, i32 67
  %98 = load i32, i32* %10, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [10 x i32], [10 x i32]* %97, i64 0, i64 %99
  %101 = load i32, i32* %100, align 4
  store i32 %101, i32* %11, align 4
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %103 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %102, i32 0, i32 63
  %104 = load i32, i32* %11, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %103, i64 0, i64 %105
  %107 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %106, align 8
  store %struct.jpeg_component_info* %107, %struct.jpeg_component_info** %19, align 8
  %108 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %109 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %108, i32 0, i32 4
  %110 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %111 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %110, i32 0, i32 5
  %112 = load i32, i32* %111, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %109, i64 0, i64 %113
  %115 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %114, align 8
  store %struct.d_derived_tbl* %115, %struct.d_derived_tbl** %17, align 8
  %116 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %117 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %116, i32 0, i32 5
  %118 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %119 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %118, i32 0, i32 6
  %120 = load i32, i32* %119, align 8
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [4 x %struct.d_derived_tbl*], [4 x %struct.d_derived_tbl*]* %117, i64 0, i64 %121
  %123 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %122, align 8
  store %struct.d_derived_tbl* %123, %struct.d_derived_tbl** %18, align 8
  %124 = load i32, i32* %14, align 4
  %125 = icmp slt i32 %124, 8
  br i1 %125, label %126, label %144

; <label>:126:                                    ; preds = %90
  %127 = load i64, i64* %13, align 8
  %128 = load i32, i32* %14, align 4
  %129 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %15, i64 %127, i32 %128, i32 0)
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %133, label %131

; <label>:131:                                    ; preds = %126
  %pgocount3 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 34)
  %132 = add i64 %pgocount3, 1
  store i64 %132, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 34)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:133:                                    ; preds = %126
  %134 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %135 = load i64, i64* %134, align 8
  store i64 %135, i64* %13, align 8
  %136 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %137 = load i32, i32* %136, align 8
  store i32 %137, i32* %14, align 4
  %138 = load i32, i32* %14, align 4
  %139 = icmp slt i32 %138, 8
  br i1 %139, label %140, label %142

; <label>:140:                                    ; preds = %133
  %pgocount4 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 20)
  %141 = add i64 %pgocount4, 1
  store i64 %141, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 20)
  store i32 1, i32* %20, align 4
  br label %172

; <label>:142:                                    ; preds = %133
  %pgocount5 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 21)
  %143 = add i64 %pgocount5, 1
  store i64 %143, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 21)
  br label %144

; <label>:144:                                    ; preds = %142, %90
  %145 = load i64, i64* %13, align 8
  %146 = load i32, i32* %14, align 4
  %147 = sub nsw i32 %146, 8
  %148 = zext i32 %147 to i64
  %149 = ashr i64 %145, %148
  %150 = trunc i64 %149 to i32
  %151 = and i32 %150, 255
  store i32 %151, i32* %21, align 4
  %152 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %153 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %152, i32 0, i32 4
  %154 = load i32, i32* %21, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [256 x i32], [256 x i32]* %153, i64 0, i64 %155
  %157 = load i32, i32* %156, align 4
  store i32 %157, i32* %20, align 4
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %170

; <label>:159:                                    ; preds = %144
  %160 = load i32, i32* %20, align 4
  %161 = load i32, i32* %14, align 4
  %162 = sub nsw i32 %161, %160
  store i32 %162, i32* %14, align 4
  %163 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %164 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %163, i32 0, i32 5
  %165 = load i32, i32* %21, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [256 x i8], [256 x i8]* %164, i64 0, i64 %166
  %168 = load i8, i8* %167, align 1
  %169 = zext i8 %168 to i32
  store i32 %169, i32* %7, align 4
  br label %186

; <label>:170:                                    ; preds = %144
  %pgocount6 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 19)
  %171 = add i64 %pgocount6, 1
  store i64 %171, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 19)
  store i32 9, i32* %20, align 4
  br label %172

; <label>:172:                                    ; preds = %170, %140
  %173 = load i64, i64* %13, align 8
  %174 = load i32, i32* %14, align 4
  %175 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %17, align 8
  %176 = load i32, i32* %20, align 4
  %177 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* %15, i64 %173, i32 %174, %struct.d_derived_tbl* %175, i32 %176)
  store i32 %177, i32* %7, align 4
  %178 = icmp slt i32 %177, 0
  br i1 %178, label %179, label %181

; <label>:179:                                    ; preds = %172
  %pgocount7 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 35)
  %180 = add i64 %pgocount7, 1
  store i64 %180, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 35)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:181:                                    ; preds = %172
  %182 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %183 = load i64, i64* %182, align 8
  store i64 %183, i64* %13, align 8
  %184 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %185 = load i32, i32* %184, align 8
  store i32 %185, i32* %14, align 4
  br label %186

; <label>:186:                                    ; preds = %181, %159
  %187 = load i32, i32* %7, align 4
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %189, label %238

; <label>:189:                                    ; preds = %186
  %190 = load i32, i32* %14, align 4
  %191 = load i32, i32* %7, align 4
  %192 = icmp slt i32 %190, %191
  br i1 %192, label %193, label %207

; <label>:193:                                    ; preds = %189
  %194 = load i64, i64* %13, align 8
  %195 = load i32, i32* %14, align 4
  %196 = load i32, i32* %7, align 4
  %197 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %15, i64 %194, i32 %195, i32 %196)
  %198 = icmp ne i32 %197, 0
  br i1 %198, label %201, label %199

; <label>:199:                                    ; preds = %193
  %pgocount8 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 36)
  %200 = add i64 %pgocount8, 1
  store i64 %200, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 36)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:201:                                    ; preds = %193
  %pgocount9 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 18)
  %202 = add i64 %pgocount9, 1
  store i64 %202, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 18)
  %203 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %204 = load i64, i64* %203, align 8
  store i64 %204, i64* %13, align 8
  %205 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %206 = load i32, i32* %205, align 8
  store i32 %206, i32* %14, align 4
  br label %207

; <label>:207:                                    ; preds = %201, %189
  %208 = load i64, i64* %13, align 8
  %209 = load i32, i32* %7, align 4
  %210 = load i32, i32* %14, align 4
  %211 = sub nsw i32 %210, %209
  store i32 %211, i32* %14, align 4
  %212 = zext i32 %211 to i64
  %213 = ashr i64 %208, %212
  %214 = trunc i64 %213 to i32
  %215 = load i32, i32* %7, align 4
  %216 = shl i32 1, %215
  %217 = sub nsw i32 %216, 1
  %218 = and i32 %214, %217
  store i32 %218, i32* %9, align 4
  %219 = load i32, i32* %9, align 4
  %220 = load i32, i32* %7, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %221
  %223 = load i32, i32* %222, align 4
  %224 = icmp slt i32 %219, %223
  br i1 %224, label %225, label %233

; <label>:225:                                    ; preds = %207
  %pgocount10 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 16)
  %226 = add i64 %pgocount10, 1
  store i64 %226, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 16)
  %227 = load i32, i32* %9, align 4
  %228 = load i32, i32* %7, align 4
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %229
  %231 = load i32, i32* %230, align 4
  %232 = add nsw i32 %227, %231
  br label %236

; <label>:233:                                    ; preds = %207
  %pgocount11 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 17)
  %234 = add i64 %pgocount11, 1
  store i64 %234, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 17)
  %235 = load i32, i32* %9, align 4
  br label %236

; <label>:236:                                    ; preds = %233, %225
  %237 = phi i32 [ %232, %225 ], [ %235, %233 ]
  store i32 %237, i32* %7, align 4
  br label %238

; <label>:238:                                    ; preds = %236, %186
  %239 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %240 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %239, i32 0, i32 12
  %241 = load i32, i32* %240, align 8
  %242 = icmp ne i32 %241, 0
  br i1 %242, label %244, label %243

; <label>:243:                                    ; preds = %238
  br label %417

; <label>:244:                                    ; preds = %238
  %245 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %16, i32 0, i32 0
  %246 = load i32, i32* %11, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [4 x i32], [4 x i32]* %245, i64 0, i64 %247
  %249 = load i32, i32* %248, align 4
  %250 = load i32, i32* %7, align 4
  %251 = add nsw i32 %250, %249
  store i32 %251, i32* %7, align 4
  %252 = load i32, i32* %7, align 4
  %253 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %16, i32 0, i32 0
  %254 = load i32, i32* %11, align 4
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [4 x i32], [4 x i32]* %253, i64 0, i64 %255
  store i32 %252, i32* %256, align 4
  %257 = load i32, i32* %7, align 4
  %258 = trunc i32 %257 to i16
  %259 = load [64 x i16]*, [64 x i16]** %12, align 8
  %260 = getelementptr inbounds [64 x i16], [64 x i16]* %259, i64 0, i64 0
  store i16 %258, i16* %260, align 2
  %261 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %262 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %261, i32 0, i32 9
  %263 = load i32, i32* %262, align 4
  %264 = icmp sgt i32 %263, 1
  br i1 %264, label %265, label %415

; <label>:265:                                    ; preds = %244
  store i32 1, i32* %8, align 4
  br label %266

; <label>:266:                                    ; preds = %410, %265
  %267 = load i32, i32* %8, align 4
  %268 = icmp slt i32 %267, 64
  br i1 %268, label %269, label %413

; <label>:269:                                    ; preds = %266
  %270 = load i32, i32* %14, align 4
  %271 = icmp slt i32 %270, 8
  br i1 %271, label %272, label %290

; <label>:272:                                    ; preds = %269
  %273 = load i64, i64* %13, align 8
  %274 = load i32, i32* %14, align 4
  %275 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %15, i64 %273, i32 %274, i32 0)
  %276 = icmp ne i32 %275, 0
  br i1 %276, label %279, label %277

; <label>:277:                                    ; preds = %272
  %pgocount12 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 29)
  %278 = add i64 %pgocount12, 1
  store i64 %278, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 29)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:279:                                    ; preds = %272
  %280 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %281 = load i64, i64* %280, align 8
  store i64 %281, i64* %13, align 8
  %282 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %283 = load i32, i32* %282, align 8
  store i32 %283, i32* %14, align 4
  %284 = load i32, i32* %14, align 4
  %285 = icmp slt i32 %284, 8
  br i1 %285, label %286, label %288

; <label>:286:                                    ; preds = %279
  %pgocount13 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 11)
  %287 = add i64 %pgocount13, 1
  store i64 %287, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 11)
  store i32 1, i32* %22, align 4
  br label %318

; <label>:288:                                    ; preds = %279
  %pgocount14 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 12)
  %289 = add i64 %pgocount14, 1
  store i64 %289, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 12)
  br label %290

; <label>:290:                                    ; preds = %288, %269
  %291 = load i64, i64* %13, align 8
  %292 = load i32, i32* %14, align 4
  %293 = sub nsw i32 %292, 8
  %294 = zext i32 %293 to i64
  %295 = ashr i64 %291, %294
  %296 = trunc i64 %295 to i32
  %297 = and i32 %296, 255
  store i32 %297, i32* %23, align 4
  %298 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %18, align 8
  %299 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %298, i32 0, i32 4
  %300 = load i32, i32* %23, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [256 x i32], [256 x i32]* %299, i64 0, i64 %301
  %303 = load i32, i32* %302, align 4
  store i32 %303, i32* %22, align 4
  %304 = icmp ne i32 %303, 0
  br i1 %304, label %305, label %316

; <label>:305:                                    ; preds = %290
  %306 = load i32, i32* %22, align 4
  %307 = load i32, i32* %14, align 4
  %308 = sub nsw i32 %307, %306
  store i32 %308, i32* %14, align 4
  %309 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %18, align 8
  %310 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %309, i32 0, i32 5
  %311 = load i32, i32* %23, align 4
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [256 x i8], [256 x i8]* %310, i64 0, i64 %312
  %314 = load i8, i8* %313, align 1
  %315 = zext i8 %314 to i32
  store i32 %315, i32* %7, align 4
  br label %332

; <label>:316:                                    ; preds = %290
  %pgocount15 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 10)
  %317 = add i64 %pgocount15, 1
  store i64 %317, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 10)
  store i32 9, i32* %22, align 4
  br label %318

; <label>:318:                                    ; preds = %316, %286
  %319 = load i64, i64* %13, align 8
  %320 = load i32, i32* %14, align 4
  %321 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %18, align 8
  %322 = load i32, i32* %22, align 4
  %323 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* %15, i64 %319, i32 %320, %struct.d_derived_tbl* %321, i32 %322)
  store i32 %323, i32* %7, align 4
  %324 = icmp slt i32 %323, 0
  br i1 %324, label %325, label %327

; <label>:325:                                    ; preds = %318
  %pgocount16 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 28)
  %326 = add i64 %pgocount16, 1
  store i64 %326, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 28)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:327:                                    ; preds = %318
  %328 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %329 = load i64, i64* %328, align 8
  store i64 %329, i64* %13, align 8
  %330 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %331 = load i32, i32* %330, align 8
  store i32 %331, i32* %14, align 4
  br label %332

; <label>:332:                                    ; preds = %327, %305
  %333 = load i32, i32* %7, align 4
  %334 = ashr i32 %333, 4
  store i32 %334, i32* %9, align 4
  %335 = load i32, i32* %7, align 4
  %336 = and i32 %335, 15
  store i32 %336, i32* %7, align 4
  %337 = load i32, i32* %7, align 4
  %338 = icmp ne i32 %337, 0
  br i1 %338, label %339, label %400

; <label>:339:                                    ; preds = %332
  %340 = load i32, i32* %9, align 4
  %341 = load i32, i32* %8, align 4
  %342 = add nsw i32 %341, %340
  store i32 %342, i32* %8, align 4
  %343 = load i32, i32* %14, align 4
  %344 = load i32, i32* %7, align 4
  %345 = icmp slt i32 %343, %344
  br i1 %345, label %346, label %360

; <label>:346:                                    ; preds = %339
  %347 = load i64, i64* %13, align 8
  %348 = load i32, i32* %14, align 4
  %349 = load i32, i32* %7, align 4
  %350 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %15, i64 %347, i32 %348, i32 %349)
  %351 = icmp ne i32 %350, 0
  br i1 %351, label %354, label %352

; <label>:352:                                    ; preds = %346
  %pgocount17 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 32)
  %353 = add i64 %pgocount17, 1
  store i64 %353, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 32)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:354:                                    ; preds = %346
  %pgocount18 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 9)
  %355 = add i64 %pgocount18, 1
  store i64 %355, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 9)
  %356 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %357 = load i64, i64* %356, align 8
  store i64 %357, i64* %13, align 8
  %358 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %359 = load i32, i32* %358, align 8
  store i32 %359, i32* %14, align 4
  br label %360

; <label>:360:                                    ; preds = %354, %339
  %361 = load i64, i64* %13, align 8
  %362 = load i32, i32* %7, align 4
  %363 = load i32, i32* %14, align 4
  %364 = sub nsw i32 %363, %362
  store i32 %364, i32* %14, align 4
  %365 = zext i32 %364 to i64
  %366 = ashr i64 %361, %365
  %367 = trunc i64 %366 to i32
  %368 = load i32, i32* %7, align 4
  %369 = shl i32 1, %368
  %370 = sub nsw i32 %369, 1
  %371 = and i32 %367, %370
  store i32 %371, i32* %9, align 4
  %372 = load i32, i32* %9, align 4
  %373 = load i32, i32* %7, align 4
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_test, i64 0, i64 %374
  %376 = load i32, i32* %375, align 4
  %377 = icmp slt i32 %372, %376
  br i1 %377, label %378, label %386

; <label>:378:                                    ; preds = %360
  %pgocount19 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 7)
  %379 = add i64 %pgocount19, 1
  store i64 %379, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 7)
  %380 = load i32, i32* %9, align 4
  %381 = load i32, i32* %7, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [16 x i32], [16 x i32]* @extend_offset, i64 0, i64 %382
  %384 = load i32, i32* %383, align 4
  %385 = add nsw i32 %380, %384
  br label %389

; <label>:386:                                    ; preds = %360
  %pgocount20 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 8)
  %387 = add i64 %pgocount20, 1
  store i64 %387, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 8)
  %388 = load i32, i32* %9, align 4
  br label %389

; <label>:389:                                    ; preds = %386, %378
  %390 = phi i32 [ %385, %378 ], [ %388, %386 ]
  store i32 %390, i32* %7, align 4
  %391 = load i32, i32* %7, align 4
  %392 = trunc i32 %391 to i16
  %393 = load [64 x i16]*, [64 x i16]** %12, align 8
  %394 = load i32, i32* %8, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %395
  %397 = load i32, i32* %396, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [64 x i16], [64 x i16]* %393, i64 0, i64 %398
  store i16 %392, i16* %399, align 2
  br label %409

; <label>:400:                                    ; preds = %332
  %401 = load i32, i32* %9, align 4
  %402 = icmp ne i32 %401, 15
  br i1 %402, label %403, label %405

; <label>:403:                                    ; preds = %400
  %pgocount21 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 31)
  %404 = add i64 %pgocount21, 1
  store i64 %404, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 31)
  br label %413

; <label>:405:                                    ; preds = %400
  %pgocount22 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 6)
  %406 = add i64 %pgocount22, 1
  store i64 %406, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 6)
  %407 = load i32, i32* %8, align 4
  %408 = add nsw i32 %407, 15
  store i32 %408, i32* %8, align 4
  br label %409

; <label>:409:                                    ; preds = %405, %389
  br label %410

; <label>:410:                                    ; preds = %409
  %411 = load i32, i32* %8, align 4
  %412 = add nsw i32 %411, 1
  store i32 %412, i32* %8, align 4
  br label %266

; <label>:413:                                    ; preds = %403, %266
  %pgocount23 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 22)
  %414 = add i64 %pgocount23, 1
  store i64 %414, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 22)
  br label %532

; <label>:415:                                    ; preds = %244
  %pgocount24 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 15)
  %416 = add i64 %pgocount24, 1
  store i64 %416, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 15)
  br label %417

; <label>:417:                                    ; preds = %415, %243
  store i32 1, i32* %8, align 4
  br label %418

; <label>:418:                                    ; preds = %527, %417
  %419 = load i32, i32* %8, align 4
  %420 = icmp slt i32 %419, 64
  br i1 %420, label %421, label %530

; <label>:421:                                    ; preds = %418
  %422 = load i32, i32* %14, align 4
  %423 = icmp slt i32 %422, 8
  br i1 %423, label %424, label %442

; <label>:424:                                    ; preds = %421
  %425 = load i64, i64* %13, align 8
  %426 = load i32, i32* %14, align 4
  %427 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %15, i64 %425, i32 %426, i32 0)
  %428 = icmp ne i32 %427, 0
  br i1 %428, label %431, label %429

; <label>:429:                                    ; preds = %424
  %pgocount25 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 24)
  %430 = add i64 %pgocount25, 1
  store i64 %430, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 24)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:431:                                    ; preds = %424
  %432 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %433 = load i64, i64* %432, align 8
  store i64 %433, i64* %13, align 8
  %434 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %435 = load i32, i32* %434, align 8
  store i32 %435, i32* %14, align 4
  %436 = load i32, i32* %14, align 4
  %437 = icmp slt i32 %436, 8
  br i1 %437, label %438, label %440

; <label>:438:                                    ; preds = %431
  %pgocount26 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 4)
  %439 = add i64 %pgocount26, 1
  store i64 %439, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 4)
  store i32 1, i32* %24, align 4
  br label %471

; <label>:440:                                    ; preds = %431
  %pgocount27 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 5)
  %441 = add i64 %pgocount27, 1
  store i64 %441, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 5)
  br label %442

; <label>:442:                                    ; preds = %440, %421
  %443 = load i64, i64* %13, align 8
  %444 = load i32, i32* %14, align 4
  %445 = sub nsw i32 %444, 8
  %446 = zext i32 %445 to i64
  %447 = ashr i64 %443, %446
  %448 = trunc i64 %447 to i32
  %449 = and i32 %448, 255
  store i32 %449, i32* %25, align 4
  %450 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %18, align 8
  %451 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %450, i32 0, i32 4
  %452 = load i32, i32* %25, align 4
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds [256 x i32], [256 x i32]* %451, i64 0, i64 %453
  %455 = load i32, i32* %454, align 4
  store i32 %455, i32* %24, align 4
  %456 = icmp ne i32 %455, 0
  br i1 %456, label %457, label %469

; <label>:457:                                    ; preds = %442
  %pgocount28 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 0)
  %458 = add i64 %pgocount28, 1
  store i64 %458, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 0)
  %459 = load i32, i32* %24, align 4
  %460 = load i32, i32* %14, align 4
  %461 = sub nsw i32 %460, %459
  store i32 %461, i32* %14, align 4
  %462 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %18, align 8
  %463 = getelementptr inbounds %struct.d_derived_tbl, %struct.d_derived_tbl* %462, i32 0, i32 5
  %464 = load i32, i32* %25, align 4
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds [256 x i8], [256 x i8]* %463, i64 0, i64 %465
  %467 = load i8, i8* %466, align 1
  %468 = zext i8 %467 to i32
  store i32 %468, i32* %7, align 4
  br label %485

; <label>:469:                                    ; preds = %442
  %pgocount29 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 3)
  %470 = add i64 %pgocount29, 1
  store i64 %470, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 3)
  store i32 9, i32* %24, align 4
  br label %471

; <label>:471:                                    ; preds = %469, %438
  %472 = load i64, i64* %13, align 8
  %473 = load i32, i32* %14, align 4
  %474 = load %struct.d_derived_tbl*, %struct.d_derived_tbl** %18, align 8
  %475 = load i32, i32* %24, align 4
  %476 = call i32 @jpeg_huff_decode(%struct.bitread_working_state* %15, i64 %472, i32 %473, %struct.d_derived_tbl* %474, i32 %475)
  store i32 %476, i32* %7, align 4
  %477 = icmp slt i32 %476, 0
  br i1 %477, label %478, label %480

; <label>:478:                                    ; preds = %471
  %pgocount30 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 23)
  %479 = add i64 %pgocount30, 1
  store i64 %479, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 23)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:480:                                    ; preds = %471
  %481 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %482 = load i64, i64* %481, align 8
  store i64 %482, i64* %13, align 8
  %483 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %484 = load i32, i32* %483, align 8
  store i32 %484, i32* %14, align 4
  br label %485

; <label>:485:                                    ; preds = %480, %457
  %486 = load i32, i32* %7, align 4
  %487 = ashr i32 %486, 4
  store i32 %487, i32* %9, align 4
  %488 = load i32, i32* %7, align 4
  %489 = and i32 %488, 15
  store i32 %489, i32* %7, align 4
  %490 = load i32, i32* %7, align 4
  %491 = icmp ne i32 %490, 0
  br i1 %491, label %492, label %517

; <label>:492:                                    ; preds = %485
  %493 = load i32, i32* %9, align 4
  %494 = load i32, i32* %8, align 4
  %495 = add nsw i32 %494, %493
  store i32 %495, i32* %8, align 4
  %496 = load i32, i32* %14, align 4
  %497 = load i32, i32* %7, align 4
  %498 = icmp slt i32 %496, %497
  br i1 %498, label %499, label %513

; <label>:499:                                    ; preds = %492
  %500 = load i64, i64* %13, align 8
  %501 = load i32, i32* %14, align 4
  %502 = load i32, i32* %7, align 4
  %503 = call i32 @jpeg_fill_bit_buffer(%struct.bitread_working_state* %15, i64 %500, i32 %501, i32 %502)
  %504 = icmp ne i32 %503, 0
  br i1 %504, label %507, label %505

; <label>:505:                                    ; preds = %499
  %pgocount31 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 27)
  %506 = add i64 %pgocount31, 1
  store i64 %506, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 27)
  store i32 0, i32* %3, align 4
  br label %570

; <label>:507:                                    ; preds = %499
  %pgocount32 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 2)
  %508 = add i64 %pgocount32, 1
  store i64 %508, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 2)
  %509 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 3
  %510 = load i64, i64* %509, align 8
  store i64 %510, i64* %13, align 8
  %511 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 4
  %512 = load i32, i32* %511, align 8
  store i32 %512, i32* %14, align 4
  br label %513

; <label>:513:                                    ; preds = %507, %492
  %514 = load i32, i32* %7, align 4
  %515 = load i32, i32* %14, align 4
  %516 = sub nsw i32 %515, %514
  store i32 %516, i32* %14, align 4
  br label %526

; <label>:517:                                    ; preds = %485
  %518 = load i32, i32* %9, align 4
  %519 = icmp ne i32 %518, 15
  br i1 %519, label %520, label %522

; <label>:520:                                    ; preds = %517
  %pgocount33 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 25)
  %521 = add i64 %pgocount33, 1
  store i64 %521, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 25)
  br label %530

; <label>:522:                                    ; preds = %517
  %pgocount34 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 1)
  %523 = add i64 %pgocount34, 1
  store i64 %523, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 1)
  %524 = load i32, i32* %8, align 4
  %525 = add nsw i32 %524, 15
  store i32 %525, i32* %8, align 4
  br label %526

; <label>:526:                                    ; preds = %522, %513
  br label %527

; <label>:527:                                    ; preds = %526
  %528 = load i32, i32* %8, align 4
  %529 = add nsw i32 %528, 1
  store i32 %529, i32* %8, align 4
  br label %418

; <label>:530:                                    ; preds = %520, %418
  %pgocount35 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 13)
  %531 = add i64 %pgocount35, 1
  store i64 %531, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 13)
  br label %532

; <label>:532:                                    ; preds = %530, %413
  br label %533

; <label>:533:                                    ; preds = %532
  %534 = load i32, i32* %10, align 4
  %535 = add nsw i32 %534, 1
  store i32 %535, i32* %10, align 4
  br label %84

; <label>:536:                                    ; preds = %84
  %pgocount36 = load i64, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 33)
  %537 = add i64 %pgocount36, 1
  store i64 %537, i64* getelementptr inbounds ([37 x i64], [37 x i64]* @__profc_tmp1.ll_decode_mcu, i64 0, i64 33)
  %538 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 0
  %539 = load i8*, i8** %538, align 8
  %540 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %541 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %540, i32 0, i32 5
  %542 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %541, align 8
  %543 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %542, i32 0, i32 0
  store i8* %539, i8** %543, align 8
  %544 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 1
  %545 = load i64, i64* %544, align 8
  %546 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %547 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %546, i32 0, i32 5
  %548 = load %struct.jpeg_source_mgr*, %struct.jpeg_source_mgr** %547, align 8
  %549 = getelementptr inbounds %struct.jpeg_source_mgr, %struct.jpeg_source_mgr* %548, i32 0, i32 1
  store i64 %545, i64* %549, align 8
  %550 = getelementptr inbounds %struct.bitread_working_state, %struct.bitread_working_state* %15, i32 0, i32 2
  %551 = load i32, i32* %550, align 8
  %552 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %553 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %552, i32 0, i32 72
  store i32 %551, i32* %553, align 4
  %554 = load i64, i64* %13, align 8
  %555 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %556 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %555, i32 0, i32 1
  %557 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %556, i32 0, i32 0
  store i64 %554, i64* %557, align 8
  %558 = load i32, i32* %14, align 4
  %559 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %560 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %559, i32 0, i32 1
  %561 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %560, i32 0, i32 1
  store i32 %558, i32* %561, align 8
  %562 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %563 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %562, i32 0, i32 2
  %564 = bitcast %struct.savable_state* %563 to i8*
  %565 = bitcast %struct.savable_state* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %564, i8* %565, i64 16, i32 4, i1 false)
  %566 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %6, align 8
  %567 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %566, i32 0, i32 3
  %568 = load i32, i32* %567, align 8
  %569 = add i32 %568, -1
  store i32 %569, i32* %567, align 8
  store i32 1, i32* %3, align 4
  br label %570

; <label>:570:                                    ; preds = %536, %505, %478, %429, %352, %325, %277, %199, %179, %131, %43
  %571 = load i32, i32* %3, align 4
  ret i32 %571
}

; Function Attrs: nounwind uwtable
define internal i32 @process_restart(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.huff_entropy_decoder*, align 8
  %5 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %6 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %6, i32 0, i32 79
  %8 = load %struct.jpeg_entropy_decoder*, %struct.jpeg_entropy_decoder** %7, align 8
  %9 = bitcast %struct.jpeg_entropy_decoder* %8 to %struct.huff_entropy_decoder*
  store %struct.huff_entropy_decoder* %9, %struct.huff_entropy_decoder** %4, align 8
  %10 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %4, align 8
  %11 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %10, i32 0, i32 1
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
  %21 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %4, align 8
  %22 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %21, i32 0, i32 1
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
  br label %63

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
  %44 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %4, align 8
  %45 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %44, i32 0, i32 2
  %46 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %45, i32 0, i32 0
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
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %55, i32 0, i32 49
  %57 = load i32, i32* %56, align 8
  %58 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %4, align 8
  %59 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %58, i32 0, i32 3
  store i32 %57, i32* %59, align 8
  %60 = load %struct.huff_entropy_decoder*, %struct.huff_entropy_decoder** %4, align 8
  %61 = getelementptr inbounds %struct.huff_entropy_decoder, %struct.huff_entropy_decoder* %60, i32 0, i32 1
  %62 = getelementptr inbounds %struct.bitread_perm_state, %struct.bitread_perm_state* %61, i32 0, i32 2
  store i32 0, i32* %62, align 4
  store i32 1, i32* %2, align 4
  br label %63

; <label>:63:                                     ; preds = %53, %33
  %64 = load i32, i32* %2, align 4
  ret i32 %64
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
