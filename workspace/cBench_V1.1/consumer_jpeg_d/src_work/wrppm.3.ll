; ModuleID = 'wrppm.2.ll'
source_filename = "wrppm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.djpeg_dest_struct = type { void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, %struct._IO_FILE*, i8**, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
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
%struct.jpeg_decomp_master = type opaque
%struct.jpeg_d_main_controller = type opaque
%struct.jpeg_d_coef_controller = type opaque
%struct.jpeg_d_post_controller = type opaque
%struct.jpeg_input_controller = type opaque
%struct.jpeg_marker_reader = type opaque
%struct.jpeg_entropy_decoder = type opaque
%struct.jpeg_inverse_dct = type opaque
%struct.jpeg_upsampler = type opaque
%struct.jpeg_color_deconverter = type opaque
%struct.jpeg_color_quantizer = type opaque
%struct.ppm_dest_struct = type { %struct.djpeg_dest_struct, i8*, i8*, i64, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [15 x i8] c"P5\0A%ld %ld\0A%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"P6\0A%ld %ld\0A%d\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_write_ppm = private constant [15 x i8] c"jinit_write_ppm"
@__profn_tmp1.ll_start_output_ppm = private constant [24 x i8] c"tmp1.ll:start_output_ppm"
@__profn_tmp1.ll_finish_output_ppm = private constant [25 x i8] c"tmp1.ll:finish_output_ppm"
@__profn_tmp1.ll_copy_pixel_rows = private constant [23 x i8] c"tmp1.ll:copy_pixel_rows"
@__profn_tmp1.ll_put_demapped_gray = private constant [25 x i8] c"tmp1.ll:put_demapped_gray"
@__profn_tmp1.ll_put_demapped_rgb = private constant [24 x i8] c"tmp1.ll:put_demapped_rgb"
@__profn_tmp1.ll_put_pixel_rows = private constant [22 x i8] c"tmp1.ll:put_pixel_rows"
@__profc_jinit_write_ppm = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_write_ppm = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_write_ppm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7260887762630564614, i64 844488784310301, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i32 0, i32 0), i8* bitcast (%struct.djpeg_dest_struct* (%struct.jpeg_decompress_struct*)* @jinit_write_ppm to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_write_ppm to i8*), i32 4, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_output_ppm = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_output_ppm = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_output_ppm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4284196263570939635, i64 281509755908571, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_output_ppm, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_ppm to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_start_output_ppm to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_output_ppm = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_finish_output_ppm = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_finish_output_ppm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5273348698845992022, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_ppm, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_ppm to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_finish_output_ppm to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_copy_pixel_rows = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_copy_pixel_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2204530336417187631, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copy_pixel_rows, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @copy_pixel_rows to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_demapped_gray = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_demapped_gray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 105734626384875677, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_gray to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_demapped_rgb = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_demapped_rgb = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7303851447891262040, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_rgb, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_rgb to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_pixel_rows = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_pixel_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7264417600277484566, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_pixel_rows, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [94 x i8] c"\A4\01[x\DAm\CCA\0E\80 \0C\04\C0\F8!\13\AF~\A6A\A9X\03\D2\94\12\E4\F7\EAEC\C2ugw\0F:I\A1\08)\02s\184\F04z?'5\A2\10\B3r\D6\06\B6g\90\F6\9E\AC\91+0]\E8AbI_\FE\F6,\06\C3\8C\16\9C\98\DA\17qK\03\FF\D3\0Dca?\14", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_ppm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_output_ppm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_ppm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_copy_pixel_rows to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_demapped_gray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_demapped_rgb to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_pixel_rows to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([94 x i8], [94 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define %struct.djpeg_dest_struct* @jinit_write_ppm(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca %struct.ppm_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i32 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %10 = bitcast %struct.jpeg_decompress_struct* %9 to %struct.jpeg_common_struct*
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_ppm to i8*), i32 0)
  %12 = call i8* %8(%struct.jpeg_common_struct* %10, i32 1, i64 80)
  %13 = bitcast i8* %12 to %struct.ppm_dest_struct*
  store %struct.ppm_dest_struct* %13, %struct.ppm_dest_struct** %3, align 8
  %14 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %15 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %14, i32 0, i32 0
  %16 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %15, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_ppm, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %16, align 8
  %17 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %18 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %18, i32 0, i32 2
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_ppm, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %19, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %20)
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 26
  %23 = load i32, i32* %22, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 28
  %26 = load i32, i32* %25, align 8
  %27 = mul i32 %23, %26
  %28 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %29 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %28, i32 0, i32 4
  store i32 %27, i32* %29, align 8
  %30 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %31 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %30, i32 0, i32 4
  %32 = load i32, i32* %31, align 8
  %33 = zext i32 %32 to i64
  %34 = mul i64 %33, 1
  %35 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %36 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %35, i32 0, i32 3
  store i64 %34, i64* %36, align 8
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 1
  %39 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %39, i32 0, i32 0
  %41 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %40, align 8
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %43 = bitcast %struct.jpeg_decompress_struct* %42 to %struct.jpeg_common_struct*
  %44 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %45 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %44, i32 0, i32 3
  %46 = load i64, i64* %45, align 8
  %47 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %41 to i64
  call void @__llvm_profile_instrument_target(i64 %47, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_ppm to i8*), i32 1)
  %48 = call i8* %41(%struct.jpeg_common_struct* %43, i32 1, i64 %46)
  %49 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %50 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %49, i32 0, i32 1
  store i8* %48, i8** %50, align 8
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 19
  %53 = load i32, i32* %52, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %104

; <label>:55:                                     ; preds = %1
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 1
  %58 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %58, i32 0, i32 2
  %60 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %59, align 8
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %62 = bitcast %struct.jpeg_decompress_struct* %61 to %struct.jpeg_common_struct*
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 26
  %65 = load i32, i32* %64, align 8
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %67 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %66, i32 0, i32 29
  %68 = load i32, i32* %67, align 4
  %69 = mul i32 %65, %68
  %70 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %60 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_ppm to i8*), i32 2)
  %71 = call i8** %60(%struct.jpeg_common_struct* %62, i32 1, i32 %69, i32 1)
  %72 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %73 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %72, i32 0, i32 0
  %74 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %73, i32 0, i32 4
  store i8** %71, i8*** %74, align 8
  %75 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %76 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %75, i32 0, i32 0
  %77 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %76, i32 0, i32 5
  store i32 1, i32* %77, align 8
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 19
  %80 = load i32, i32* %79, align 4
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %87, label %82

; <label>:82:                                     ; preds = %55
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i64 0, i64 1)
  %83 = add i64 %pgocount, 1
  store i64 %83, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i64 0, i64 1)
  %84 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %85 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %84, i32 0, i32 0
  %86 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %85, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @copy_pixel_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %86, align 8
  br label %103

; <label>:87:                                     ; preds = %55
  %88 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %88, i32 0, i32 10
  %90 = load i32, i32* %89, align 8
  %91 = icmp eq i32 %90, 1
  br i1 %91, label %92, label %97

; <label>:92:                                     ; preds = %87
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i64 0, i64 2)
  %93 = add i64 %pgocount1, 1
  store i64 %93, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i64 0, i64 2)
  %94 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %95 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %94, i32 0, i32 0
  %96 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %95, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_gray, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %96, align 8
  br label %102

; <label>:97:                                     ; preds = %87
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i64 0, i64 3)
  %98 = add i64 %pgocount2, 1
  store i64 %98, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i64 0, i64 3)
  %99 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %100 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %99, i32 0, i32 0
  %101 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %100, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_rgb, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %101, align 8
  br label %102

; <label>:102:                                    ; preds = %97, %92
  br label %103

; <label>:103:                                    ; preds = %102, %82
  br label %122

; <label>:104:                                    ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i64 0, i64 0)
  %105 = add i64 %pgocount3, 1
  store i64 %105, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jinit_write_ppm, i64 0, i64 0)
  %106 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %107 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %106, i32 0, i32 1
  %108 = load i8*, i8** %107, align 8
  %109 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %110 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %109, i32 0, i32 2
  store i8* %108, i8** %110, align 8
  %111 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %112 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %111, i32 0, i32 2
  %113 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %114 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %113, i32 0, i32 0
  %115 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %114, i32 0, i32 4
  store i8** %112, i8*** %115, align 8
  %116 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %117 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %116, i32 0, i32 0
  %118 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %117, i32 0, i32 5
  store i32 1, i32* %118, align 8
  %119 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %120 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %119, i32 0, i32 0
  %121 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %120, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %121, align 8
  br label %122

; <label>:122:                                    ; preds = %104, %103
  %123 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %3, align 8
  %124 = bitcast %struct.ppm_dest_struct* %123 to %struct.djpeg_dest_struct*
  ret %struct.djpeg_dest_struct* %124
}

; Function Attrs: nounwind uwtable
define internal void @start_output_ppm(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.djpeg_dest_struct*, align 8
  %5 = alloca %struct.ppm_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %4, align 8
  %6 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %7 = bitcast %struct.djpeg_dest_struct* %6 to %struct.ppm_dest_struct*
  store %struct.ppm_dest_struct* %7, %struct.ppm_dest_struct** %5, align 8
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 10
  %10 = load i32, i32* %9, align 8
  switch i32 %10, label %41 [
    i32 1, label %11
    i32 2, label %26
  ]

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_output_ppm, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_output_ppm, i64 0, i64 1)
  %13 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %5, align 8
  %14 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %13, i32 0, i32 0
  %15 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %14, i32 0, i32 3
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 26
  %19 = load i32, i32* %18, align 8
  %20 = zext i32 %19 to i64
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 27
  %23 = load i32, i32* %22, align 4
  %24 = zext i32 %23 to i64
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i64 %20, i64 %24, i32 255)
  br label %55

; <label>:26:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_output_ppm, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_output_ppm, i64 0, i64 0)
  %28 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %5, align 8
  %29 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %28, i32 0, i32 0
  %30 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %29, i32 0, i32 3
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %30, align 8
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 26
  %34 = load i32, i32* %33, align 8
  %35 = zext i32 %34 to i64
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 27
  %38 = load i32, i32* %37, align 4
  %39 = zext i32 %38 to i64
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i64 %35, i64 %39, i32 255)
  br label %55

; <label>:41:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_output_ppm, i64 0, i64 2)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_start_output_ppm, i64 0, i64 2)
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %43, i32 0, i32 0
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i32 0, i32 5
  store i32 1025, i32* %46, align 8
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 0
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i32 0, i32 0
  %51 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %50, align 8
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %53 = bitcast %struct.jpeg_decompress_struct* %52 to %struct.jpeg_common_struct*
  %54 = ptrtoint void (%struct.jpeg_common_struct*)* %51 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_output_ppm to i8*), i32 0)
  call void %51(%struct.jpeg_common_struct* %53)
  br label %55

; <label>:55:                                     ; preds = %41, %26, %11
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @finish_output_ppm(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.djpeg_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %4, align 8
  %5 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %6 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %5, i32 0, i32 3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %8 = call i32 @fflush(%struct._IO_FILE* %7)
  %9 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %10 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %9, i32 0, i32 3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %12 = call i32 @ferror(%struct._IO_FILE* %11) #3
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_ppm, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_ppm, i64 0, i64 1)
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 5
  store i32 36, i32* %19, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i32 0, i32 0
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = bitcast %struct.jpeg_decompress_struct* %25 to %struct.jpeg_common_struct*
  %27 = ptrtoint void (%struct.jpeg_common_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %27, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_ppm to i8*), i32 0)
  call void %24(%struct.jpeg_common_struct* %26)
  br label %28

; <label>:28:                                     ; preds = %14, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_ppm, i64 0, i64 0)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_ppm, i64 0, i64 0)
  ret void
}

declare void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #1

; Function Attrs: nounwind uwtable
define internal void @copy_pixel_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.ppm_dest_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %11 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %12 = bitcast %struct.djpeg_dest_struct* %11 to %struct.ppm_dest_struct*
  store %struct.ppm_dest_struct* %12, %struct.ppm_dest_struct** %7, align 8
  %13 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %14 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %13, i32 0, i32 0
  %15 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %14, i32 0, i32 4
  %16 = load i8**, i8*** %15, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 0
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %9, align 8
  %19 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %20 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %19, i32 0, i32 1
  %21 = load i8*, i8** %20, align 8
  store i8* %21, i8** %8, align 8
  %22 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %23 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %22, i32 0, i32 4
  %24 = load i32, i32* %23, align 8
  store i32 %24, i32* %10, align 4
  br label %25

; <label>:25:                                     ; preds = %36, %3
  %26 = load i32, i32* %10, align 4
  %27 = icmp ugt i32 %26, 0
  br i1 %27, label %28, label %40

; <label>:28:                                     ; preds = %25
  %29 = load i8*, i8** %9, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %9, align 8
  %31 = load i8, i8* %29, align 1
  %32 = zext i8 %31 to i32
  %33 = trunc i32 %32 to i8
  %34 = load i8*, i8** %8, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %8, align 8
  store i8 %33, i8* %34, align 1
  br label %36

; <label>:36:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copy_pixel_rows, i64 0, i64 0)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copy_pixel_rows, i64 0, i64 0)
  %38 = load i32, i32* %10, align 4
  %39 = add i32 %38, -1
  store i32 %39, i32* %10, align 4
  br label %25

; <label>:40:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copy_pixel_rows, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_copy_pixel_rows, i64 0, i64 1)
  %42 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %43 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %42, i32 0, i32 1
  %44 = load i8*, i8** %43, align 8
  %45 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %46 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %45, i32 0, i32 3
  %47 = load i64, i64* %46, align 8
  %48 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %49 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %49, i32 0, i32 3
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %50, align 8
  %52 = call i64 @fwrite(i8* %44, i64 1, i64 %47, %struct._IO_FILE* %51)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @put_demapped_gray(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.ppm_dest_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %12 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %13 = bitcast %struct.djpeg_dest_struct* %12 to %struct.ppm_dest_struct*
  store %struct.ppm_dest_struct* %13, %struct.ppm_dest_struct** %7, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 32
  %16 = load i8**, i8*** %15, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 0
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %10, align 8
  %19 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %20 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %20, i32 0, i32 4
  %22 = load i8**, i8*** %21, align 8
  %23 = getelementptr inbounds i8*, i8** %22, i64 0
  %24 = load i8*, i8** %23, align 8
  store i8* %24, i8** %9, align 8
  %25 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %26 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %25, i32 0, i32 1
  %27 = load i8*, i8** %26, align 8
  store i8* %27, i8** %8, align 8
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 26
  %30 = load i32, i32* %29, align 8
  store i32 %30, i32* %11, align 4
  br label %31

; <label>:31:                                     ; preds = %47, %3
  %32 = load i32, i32* %11, align 4
  %33 = icmp ugt i32 %32, 0
  br i1 %33, label %34, label %51

; <label>:34:                                     ; preds = %31
  %35 = load i8*, i8** %10, align 8
  %36 = load i8*, i8** %9, align 8
  %37 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %37, i8** %9, align 8
  %38 = load i8, i8* %36, align 1
  %39 = zext i8 %38 to i32
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* %35, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = trunc i32 %43 to i8
  %45 = load i8*, i8** %8, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %8, align 8
  store i8 %44, i8* %45, align 1
  br label %47

; <label>:47:                                     ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i64 0, i64 0)
  %48 = add i64 %pgocount, 1
  store i64 %48, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i64 0, i64 0)
  %49 = load i32, i32* %11, align 4
  %50 = add i32 %49, -1
  store i32 %50, i32* %11, align 4
  br label %31

; <label>:51:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i64 0, i64 1)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i64 0, i64 1)
  %53 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %54 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %53, i32 0, i32 1
  %55 = load i8*, i8** %54, align 8
  %56 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %57 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %56, i32 0, i32 3
  %58 = load i64, i64* %57, align 8
  %59 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %60 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %59, i32 0, i32 0
  %61 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %60, i32 0, i32 3
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** %61, align 8
  %63 = call i64 @fwrite(i8* %55, i64 1, i64 %58, %struct._IO_FILE* %62)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @put_demapped_rgb(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.ppm_dest_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %15 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %16 = bitcast %struct.djpeg_dest_struct* %15 to %struct.ppm_dest_struct*
  store %struct.ppm_dest_struct* %16, %struct.ppm_dest_struct** %7, align 8
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 32
  %19 = load i8**, i8*** %18, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i64 0
  %21 = load i8*, i8** %20, align 8
  store i8* %21, i8** %11, align 8
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 32
  %24 = load i8**, i8*** %23, align 8
  %25 = getelementptr inbounds i8*, i8** %24, i64 1
  %26 = load i8*, i8** %25, align 8
  store i8* %26, i8** %12, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 32
  %29 = load i8**, i8*** %28, align 8
  %30 = getelementptr inbounds i8*, i8** %29, i64 2
  %31 = load i8*, i8** %30, align 8
  store i8* %31, i8** %13, align 8
  %32 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %33 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %33, i32 0, i32 4
  %35 = load i8**, i8*** %34, align 8
  %36 = getelementptr inbounds i8*, i8** %35, i64 0
  %37 = load i8*, i8** %36, align 8
  store i8* %37, i8** %10, align 8
  %38 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %39 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %38, i32 0, i32 1
  %40 = load i8*, i8** %39, align 8
  store i8* %40, i8** %8, align 8
  %41 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %41, i32 0, i32 26
  %43 = load i32, i32* %42, align 8
  store i32 %43, i32* %14, align 4
  br label %44

; <label>:44:                                     ; preds = %79, %3
  %45 = load i32, i32* %14, align 4
  %46 = icmp ugt i32 %45, 0
  br i1 %46, label %47, label %83

; <label>:47:                                     ; preds = %44
  %48 = load i8*, i8** %10, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %10, align 8
  %50 = load i8, i8* %48, align 1
  %51 = zext i8 %50 to i32
  store i32 %51, i32* %9, align 4
  %52 = load i8*, i8** %11, align 8
  %53 = load i32, i32* %9, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8* %52, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = trunc i32 %57 to i8
  %59 = load i8*, i8** %8, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %8, align 8
  store i8 %58, i8* %59, align 1
  %61 = load i8*, i8** %12, align 8
  %62 = load i32, i32* %9, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %61, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = trunc i32 %66 to i8
  %68 = load i8*, i8** %8, align 8
  %69 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %69, i8** %8, align 8
  store i8 %67, i8* %68, align 1
  %70 = load i8*, i8** %13, align 8
  %71 = load i32, i32* %9, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %70, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = trunc i32 %75 to i8
  %77 = load i8*, i8** %8, align 8
  %78 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %78, i8** %8, align 8
  store i8 %76, i8* %77, align 1
  br label %79

; <label>:79:                                     ; preds = %47
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_rgb, i64 0, i64 0)
  %80 = add i64 %pgocount, 1
  store i64 %80, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_rgb, i64 0, i64 0)
  %81 = load i32, i32* %14, align 4
  %82 = add i32 %81, -1
  store i32 %82, i32* %14, align 4
  br label %44

; <label>:83:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_rgb, i64 0, i64 1)
  %84 = add i64 %pgocount1, 1
  store i64 %84, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_rgb, i64 0, i64 1)
  %85 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %86 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %85, i32 0, i32 1
  %87 = load i8*, i8** %86, align 8
  %88 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %89 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %88, i32 0, i32 3
  %90 = load i64, i64* %89, align 8
  %91 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %7, align 8
  %92 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %91, i32 0, i32 0
  %93 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %92, i32 0, i32 3
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %93, align 8
  %95 = call i64 @fwrite(i8* %87, i64 1, i64 %90, %struct._IO_FILE* %94)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @put_pixel_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 0)
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca %struct.djpeg_dest_struct*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.ppm_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %6, align 8
  %10 = bitcast %struct.djpeg_dest_struct* %9 to %struct.ppm_dest_struct*
  store %struct.ppm_dest_struct* %10, %struct.ppm_dest_struct** %8, align 8
  %11 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %8, align 8
  %12 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %11, i32 0, i32 1
  %13 = load i8*, i8** %12, align 8
  %14 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %8, align 8
  %15 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %14, i32 0, i32 3
  %16 = load i64, i64* %15, align 8
  %17 = load %struct.ppm_dest_struct*, %struct.ppm_dest_struct** %8, align 8
  %18 = getelementptr inbounds %struct.ppm_dest_struct, %struct.ppm_dest_struct* %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %18, i32 0, i32 3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %21 = call i64 @fwrite(i8* %13, i64 1, i64 %16, %struct._IO_FILE* %20)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
