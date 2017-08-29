; ModuleID = 'wrbmp.2.ll'
source_filename = "wrbmp.c"
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
%struct.bmp_dest_struct = type { %struct.djpeg_dest_struct, i32, %struct.jvirt_sarray_control*, i32, i32, i32, i32 }
%struct.cdjpeg_progress_mgr = type { %struct.jpeg_progress_mgr, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_write_bmp = private constant [15 x i8] c"jinit_write_bmp"
@__profn_tmp1.ll_start_output_bmp = private constant [24 x i8] c"tmp1.ll:start_output_bmp"
@__profn_tmp1.ll_finish_output_bmp = private constant [25 x i8] c"tmp1.ll:finish_output_bmp"
@__profn_tmp1.ll_put_gray_rows = private constant [21 x i8] c"tmp1.ll:put_gray_rows"
@__profn_tmp1.ll_put_pixel_rows = private constant [22 x i8] c"tmp1.ll:put_pixel_rows"
@__profn_tmp1.ll_write_os2_header = private constant [24 x i8] c"tmp1.ll:write_os2_header"
@__profn_tmp1.ll_write_bmp_header = private constant [24 x i8] c"tmp1.ll:write_bmp_header"
@__profn_tmp1.ll_write_colormap = private constant [22 x i8] c"tmp1.ll:write_colormap"
@__profc_jinit_write_bmp = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_write_bmp = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_write_bmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2688081510043080424, i64 1125992506253960, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i32 0, i32 0), i8* bitcast (%struct.djpeg_dest_struct* (%struct.jpeg_decompress_struct*, i32)* @jinit_write_bmp to i8*), i8* bitcast ([4 x i64]* @__profvp_jinit_write_bmp to i8*), i32 6, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_output_bmp = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_start_output_bmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 892519182503581737, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_output_bmp, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_bmp to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_output_bmp = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_finish_output_bmp = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_finish_output_bmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4098772809631439744, i64 844535819366580, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_bmp to i8*), i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_finish_output_bmp to i8*), i32 7, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_gray_rows = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_put_gray_rows = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_put_gray_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -856501299774802929, i64 281523705829244, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_gray_rows, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_put_gray_rows to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_pixel_rows = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_put_pixel_rows = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_put_pixel_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7264417600277484566, i64 281523705829244, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_pixel_rows, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_put_pixel_rows to i8*), i32 3, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_os2_header = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_write_os2_header = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_write_os2_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7406859163342459862, i64 563035685310687, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_write_os2_header to i8*), i32 6, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_bmp_header = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_write_bmp_header = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_write_bmp_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4079948801898333159, i64 563047211108776, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_write_bmp_header to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_colormap = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_write_colormap = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_write_colormap = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5103676162523029884, i64 281671131377255, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_write_colormap to i8*), i32 12, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [14 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [187 x i8] c"\B8\01\00jinit_write_bmp\01tmp1.ll:start_output_bmp\01tmp1.ll:finish_output_bmp\01tmp1.ll:put_gray_rows\01tmp1.ll:put_pixel_rows\01tmp1.ll:write_os2_header\01tmp1.ll:write_bmp_header\01tmp1.ll:write_colormap", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_bmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_output_bmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_bmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_gray_rows to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_pixel_rows to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_os2_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_bmp_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_colormap to i8*), i8* bitcast ([14 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([187 x i8], [187 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.djpeg_dest_struct* @jinit_write_bmp(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.bmp_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.cdjpeg_progress_mgr*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %8 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %8, i32 0, i32 1
  %10 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %10, i32 0, i32 0
  %12 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %11, align 8
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %14 = bitcast %struct.jpeg_decompress_struct* %13 to %struct.jpeg_common_struct*
  %15 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %15, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_bmp to i8*), i32 0)
  %16 = call i8* %12(%struct.jpeg_common_struct* %14, i32 1, i64 80)
  %17 = bitcast i8* %16 to %struct.bmp_dest_struct*
  store %struct.bmp_dest_struct* %17, %struct.bmp_dest_struct** %5, align 8
  %18 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %19 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %19, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_bmp, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %20, align 8
  %21 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %22 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %22, i32 0, i32 2
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_bmp, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %23, align 8
  %24 = load i32, i32* %4, align 4
  %25 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %26 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %25, i32 0, i32 1
  store i32 %24, i32* %26, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 10
  %29 = load i32, i32* %28, align 8
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %36

; <label>:31:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 2)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 2)
  %33 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %34 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %33, i32 0, i32 0
  %35 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %34, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %35, align 8
  br label %72

; <label>:36:                                     ; preds = %2
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 10
  %39 = load i32, i32* %38, align 8
  %40 = icmp eq i32 %39, 2
  br i1 %40, label %41, label %57

; <label>:41:                                     ; preds = %36
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 19
  %44 = load i32, i32* %43, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 4)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 4)
  %48 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %49 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %49, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %50, align 8
  br label %56

; <label>:51:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 5)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 5)
  %53 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %54 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %53, i32 0, i32 0
  %55 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %54, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %55, align 8
  br label %56

; <label>:56:                                     ; preds = %51, %46
  br label %71

; <label>:57:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 3)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 3)
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i32 0, i32 5
  store i32 1005, i32* %62, align 8
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 0
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i32 0, i32 0
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %69 = bitcast %struct.jpeg_decompress_struct* %68 to %struct.jpeg_common_struct*
  %70 = ptrtoint void (%struct.jpeg_common_struct*)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_bmp to i8*), i32 1)
  call void %67(%struct.jpeg_common_struct* %69)
  br label %71

; <label>:71:                                     ; preds = %57, %56
  br label %72

; <label>:72:                                     ; preds = %71, %31
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %73)
  %74 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %75 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %74, i32 0, i32 26
  %76 = load i32, i32* %75, align 8
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i32 0, i32 29
  %79 = load i32, i32* %78, align 4
  %80 = mul i32 %76, %79
  store i32 %80, i32* %6, align 4
  %81 = load i32, i32* %6, align 4
  %82 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %83 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %82, i32 0, i32 3
  store i32 %81, i32* %83, align 8
  br label %84

; <label>:84:                                     ; preds = %88, %72
  %85 = load i32, i32* %6, align 4
  %86 = and i32 %85, 3
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %92

; <label>:88:                                     ; preds = %84
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 0)
  %89 = add i64 %pgocount4, 1
  store i64 %89, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 0)
  %90 = load i32, i32* %6, align 4
  %91 = add i32 %90, 1
  store i32 %91, i32* %6, align 4
  br label %84

; <label>:92:                                     ; preds = %84
  %93 = load i32, i32* %6, align 4
  %94 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %95 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %94, i32 0, i32 4
  store i32 %93, i32* %95, align 4
  %96 = load i32, i32* %6, align 4
  %97 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %98 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %97, i32 0, i32 3
  %99 = load i32, i32* %98, align 8
  %100 = sub i32 %96, %99
  %101 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %102 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %101, i32 0, i32 5
  store i32 %100, i32* %102, align 8
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 1
  %105 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %105, i32 0, i32 4
  %107 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %106, align 8
  %108 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %109 = bitcast %struct.jpeg_decompress_struct* %108 to %struct.jpeg_common_struct*
  %110 = load i32, i32* %6, align 4
  %111 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %111, i32 0, i32 27
  %113 = load i32, i32* %112, align 4
  %114 = ptrtoint %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)* %107 to i64
  call void @__llvm_profile_instrument_target(i64 %114, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_bmp to i8*), i32 2)
  %115 = call %struct.jvirt_sarray_control* %107(%struct.jpeg_common_struct* %109, i32 1, i32 0, i32 %110, i32 %113, i32 1)
  %116 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %117 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %116, i32 0, i32 2
  store %struct.jvirt_sarray_control* %115, %struct.jvirt_sarray_control** %117, align 8
  %118 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %119 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %118, i32 0, i32 6
  store i32 0, i32* %119, align 4
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %120, i32 0, i32 2
  %122 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %121, align 8
  %123 = icmp ne %struct.jpeg_progress_mgr* %122, null
  br i1 %123, label %124, label %134

; <label>:124:                                    ; preds = %92
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 1)
  %125 = add i64 %pgocount5, 1
  store i64 %125, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_write_bmp, i64 0, i64 1)
  %126 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %127 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %126, i32 0, i32 2
  %128 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %127, align 8
  %129 = bitcast %struct.jpeg_progress_mgr* %128 to %struct.cdjpeg_progress_mgr*
  store %struct.cdjpeg_progress_mgr* %129, %struct.cdjpeg_progress_mgr** %7, align 8
  %130 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %7, align 8
  %131 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %130, i32 0, i32 2
  %132 = load i32, i32* %131, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %131, align 4
  br label %134

; <label>:134:                                    ; preds = %124, %92
  %135 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %136 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %135, i32 0, i32 1
  %137 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %136, align 8
  %138 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %137, i32 0, i32 2
  %139 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %138, align 8
  %140 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %141 = bitcast %struct.jpeg_decompress_struct* %140 to %struct.jpeg_common_struct*
  %142 = load i32, i32* %6, align 4
  %143 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %139 to i64
  call void @__llvm_profile_instrument_target(i64 %143, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_bmp to i8*), i32 3)
  %144 = call i8** %139(%struct.jpeg_common_struct* %141, i32 1, i32 %142, i32 1)
  %145 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %146 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %145, i32 0, i32 0
  %147 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %146, i32 0, i32 4
  store i8** %144, i8*** %147, align 8
  %148 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %149 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %148, i32 0, i32 0
  %150 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %149, i32 0, i32 5
  store i32 1, i32* %150, align 8
  %151 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %152 = bitcast %struct.bmp_dest_struct* %151 to %struct.djpeg_dest_struct*
  ret %struct.djpeg_dest_struct* %152
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_output_bmp(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_output_bmp, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_start_output_bmp, i64 0, i64 0)
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_output_bmp(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.djpeg_dest_struct*, align 8
  %5 = alloca %struct.bmp_dest_struct*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.cdjpeg_progress_mgr*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %4, align 8
  %12 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %13 = bitcast %struct.djpeg_dest_struct* %12 to %struct.bmp_dest_struct*
  store %struct.bmp_dest_struct* %13, %struct.bmp_dest_struct** %5, align 8
  %14 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %15 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %14, i32 0, i32 0
  %16 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %15, i32 0, i32 3
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %16, align 8
  store %struct._IO_FILE* %17, %struct._IO_FILE** %6, align 8
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 2
  %20 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %19, align 8
  %21 = bitcast %struct.jpeg_progress_mgr* %20 to %struct.cdjpeg_progress_mgr*
  store %struct.cdjpeg_progress_mgr* %21, %struct.cdjpeg_progress_mgr** %11, align 8
  %22 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %23 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %22, i32 0, i32 1
  %24 = load i32, i32* %23, align 8
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 3)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 3)
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %29 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  call void @write_os2_header(%struct.jpeg_decompress_struct* %28, %struct.bmp_dest_struct* %29)
  br label %34

; <label>:30:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 6)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 6)
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  call void @write_bmp_header(%struct.jpeg_decompress_struct* %32, %struct.bmp_dest_struct* %33)
  br label %34

; <label>:34:                                     ; preds = %30, %26
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 27
  %37 = load i32, i32* %36, align 4
  store i32 %37, i32* %9, align 4
  br label %38

; <label>:38:                                     ; preds = %108, %34
  %39 = load i32, i32* %9, align 4
  %40 = icmp ugt i32 %39, 0
  br i1 %40, label %41, label %111

; <label>:41:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 1)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 1)
  %43 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %11, align 8
  %44 = icmp ne %struct.cdjpeg_progress_mgr* %43, null
  br i1 %44, label %45, label %71

; <label>:45:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 2)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 2)
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 27
  %49 = load i32, i32* %48, align 4
  %50 = load i32, i32* %9, align 4
  %51 = sub i32 %49, %50
  %52 = zext i32 %51 to i64
  %53 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %11, align 8
  %54 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %53, i32 0, i32 0
  %55 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %54, i32 0, i32 1
  store i64 %52, i64* %55, align 8
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 27
  %58 = load i32, i32* %57, align 4
  %59 = zext i32 %58 to i64
  %60 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %11, align 8
  %61 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %60, i32 0, i32 0
  %62 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %61, i32 0, i32 2
  store i64 %59, i64* %62, align 8
  %63 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %11, align 8
  %64 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %63, i32 0, i32 0
  %65 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %64, i32 0, i32 0
  %66 = bitcast {}** %65 to void (%struct.jpeg_common_struct*)**
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %69 = bitcast %struct.jpeg_decompress_struct* %68 to %struct.jpeg_common_struct*
  %70 = ptrtoint void (%struct.jpeg_common_struct*)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_bmp to i8*), i32 0)
  call void %67(%struct.jpeg_common_struct* %69)
  br label %71

; <label>:71:                                     ; preds = %45, %41
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 1
  %74 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %74, i32 0, i32 7
  %76 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %75, align 8
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %78 = bitcast %struct.jpeg_decompress_struct* %77 to %struct.jpeg_common_struct*
  %79 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %80 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %79, i32 0, i32 2
  %81 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %80, align 8
  %82 = load i32, i32* %9, align 4
  %83 = sub i32 %82, 1
  %84 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %76 to i64
  call void @__llvm_profile_instrument_target(i64 %84, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_bmp to i8*), i32 1)
  %85 = call i8** %76(%struct.jpeg_common_struct* %78, %struct.jvirt_sarray_control* %81, i32 %83, i32 1, i32 0)
  store i8** %85, i8*** %7, align 8
  %86 = load i8**, i8*** %7, align 8
  %87 = getelementptr inbounds i8*, i8** %86, i64 0
  %88 = load i8*, i8** %87, align 8
  store i8* %88, i8** %8, align 8
  %89 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %5, align 8
  %90 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %89, i32 0, i32 4
  %91 = load i32, i32* %90, align 4
  store i32 %91, i32* %10, align 4
  br label %92

; <label>:92:                                     ; preds = %104, %71
  %93 = load i32, i32* %10, align 4
  %94 = icmp ugt i32 %93, 0
  br i1 %94, label %95, label %107

; <label>:95:                                     ; preds = %92
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 0)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 0)
  %97 = load i8*, i8** %8, align 8
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %101 = call i32 @_IO_putc(i32 %99, %struct._IO_FILE* %100)
  %102 = load i8*, i8** %8, align 8
  %103 = getelementptr inbounds i8, i8* %102, i32 1
  store i8* %103, i8** %8, align 8
  br label %104

; <label>:104:                                    ; preds = %95
  %105 = load i32, i32* %10, align 4
  %106 = add i32 %105, -1
  store i32 %106, i32* %10, align 4
  br label %92

; <label>:107:                                    ; preds = %92
  br label %108

; <label>:108:                                    ; preds = %107
  %109 = load i32, i32* %9, align 4
  %110 = add i32 %109, -1
  store i32 %110, i32* %9, align 4
  br label %38

; <label>:111:                                    ; preds = %38
  %112 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %11, align 8
  %113 = icmp ne %struct.cdjpeg_progress_mgr* %112, null
  br i1 %113, label %114, label %120

; <label>:114:                                    ; preds = %111
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 4)
  %115 = add i64 %pgocount5, 1
  store i64 %115, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 4)
  %116 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %11, align 8
  %117 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %116, i32 0, i32 1
  %118 = load i32, i32* %117, align 8
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %117, align 8
  br label %120

; <label>:120:                                    ; preds = %114, %111
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %122 = call i32 @fflush(%struct._IO_FILE* %121)
  %123 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %124 = call i32 @ferror(%struct._IO_FILE* %123) #4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %140

; <label>:126:                                    ; preds = %120
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 5)
  %127 = add i64 %pgocount6, 1
  store i64 %127, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_finish_output_bmp, i64 0, i64 5)
  %128 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %129 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %128, i32 0, i32 0
  %130 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %129, align 8
  %131 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %130, i32 0, i32 5
  store i32 36, i32* %131, align 8
  %132 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %133 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %132, i32 0, i32 0
  %134 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %133, align 8
  %135 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %134, i32 0, i32 0
  %136 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %135, align 8
  %137 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %138 = bitcast %struct.jpeg_decompress_struct* %137 to %struct.jpeg_common_struct*
  %139 = ptrtoint void (%struct.jpeg_common_struct*)* %136 to i64
  call void @__llvm_profile_instrument_target(i64 %139, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_bmp to i8*), i32 2)
  call void %136(%struct.jpeg_common_struct* %138)
  br label %140

; <label>:140:                                    ; preds = %126, %120
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_gray_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.bmp_dest_struct*, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %13 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %14 = bitcast %struct.djpeg_dest_struct* %13 to %struct.bmp_dest_struct*
  store %struct.bmp_dest_struct* %14, %struct.bmp_dest_struct** %7, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 1
  %17 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %17, i32 0, i32 7
  %19 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %18, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %21 = bitcast %struct.jpeg_decompress_struct* %20 to %struct.jpeg_common_struct*
  %22 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %23 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %22, i32 0, i32 2
  %24 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %23, align 8
  %25 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %26 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %25, i32 0, i32 6
  %27 = load i32, i32* %26, align 4
  %28 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %19 to i64
  call void @__llvm_profile_instrument_target(i64 %28, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_gray_rows to i8*), i32 0)
  %29 = call i8** %19(%struct.jpeg_common_struct* %21, %struct.jvirt_sarray_control* %24, i32 %27, i32 1, i32 1)
  store i8** %29, i8*** %8, align 8
  %30 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %31 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %30, i32 0, i32 6
  %32 = load i32, i32* %31, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %31, align 4
  %34 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %35 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %34, i32 0, i32 0
  %36 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %35, i32 0, i32 4
  %37 = load i8**, i8*** %36, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 0
  %39 = load i8*, i8** %38, align 8
  store i8* %39, i8** %9, align 8
  %40 = load i8**, i8*** %8, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 0
  %42 = load i8*, i8** %41, align 8
  store i8* %42, i8** %10, align 8
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %43, i32 0, i32 26
  %45 = load i32, i32* %44, align 8
  store i32 %45, i32* %11, align 4
  br label %46

; <label>:46:                                     ; preds = %55, %3
  %47 = load i32, i32* %11, align 4
  %48 = icmp ugt i32 %47, 0
  br i1 %48, label %49, label %59

; <label>:49:                                     ; preds = %46
  %50 = load i8*, i8** %9, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %9, align 8
  %52 = load i8, i8* %50, align 1
  %53 = load i8*, i8** %10, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %10, align 8
  store i8 %52, i8* %53, align 1
  br label %55

; <label>:55:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 0)
  %56 = add i64 %pgocount, 1
  store i64 %56, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 0)
  %57 = load i32, i32* %11, align 4
  %58 = add i32 %57, -1
  store i32 %58, i32* %11, align 4
  br label %46

; <label>:59:                                     ; preds = %46
  %60 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %61 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %60, i32 0, i32 5
  %62 = load i32, i32* %61, align 8
  store i32 %62, i32* %12, align 4
  br label %63

; <label>:63:                                     ; preds = %67, %59
  %64 = load i32, i32* %12, align 4
  %65 = add nsw i32 %64, -1
  store i32 %65, i32* %12, align 4
  %66 = icmp sge i32 %65, 0
  br i1 %66, label %67, label %71

; <label>:67:                                     ; preds = %63
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 1)
  %68 = add i64 %pgocount1, 1
  store i64 %68, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 1)
  %69 = load i8*, i8** %10, align 8
  %70 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %70, i8** %10, align 8
  store i8 0, i8* %69, align 1
  br label %63

; <label>:71:                                     ; preds = %63
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 2)
  %72 = add i64 %pgocount2, 1
  store i64 %72, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @put_pixel_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.bmp_dest_struct*, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %13 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %14 = bitcast %struct.djpeg_dest_struct* %13 to %struct.bmp_dest_struct*
  store %struct.bmp_dest_struct* %14, %struct.bmp_dest_struct** %7, align 8
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 1
  %17 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %17, i32 0, i32 7
  %19 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %18, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %21 = bitcast %struct.jpeg_decompress_struct* %20 to %struct.jpeg_common_struct*
  %22 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %23 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %22, i32 0, i32 2
  %24 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %23, align 8
  %25 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %26 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %25, i32 0, i32 6
  %27 = load i32, i32* %26, align 4
  %28 = ptrtoint i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)* %19 to i64
  call void @__llvm_profile_instrument_target(i64 %28, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_pixel_rows to i8*), i32 0)
  %29 = call i8** %19(%struct.jpeg_common_struct* %21, %struct.jvirt_sarray_control* %24, i32 %27, i32 1, i32 1)
  store i8** %29, i8*** %8, align 8
  %30 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %31 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %30, i32 0, i32 6
  %32 = load i32, i32* %31, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %31, align 4
  %34 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %35 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %34, i32 0, i32 0
  %36 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %35, i32 0, i32 4
  %37 = load i8**, i8*** %36, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 0
  %39 = load i8*, i8** %38, align 8
  store i8* %39, i8** %9, align 8
  %40 = load i8**, i8*** %8, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 0
  %42 = load i8*, i8** %41, align 8
  store i8* %42, i8** %10, align 8
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %43, i32 0, i32 26
  %45 = load i32, i32* %44, align 8
  store i32 %45, i32* %11, align 4
  br label %46

; <label>:46:                                     ; preds = %67, %3
  %47 = load i32, i32* %11, align 4
  %48 = icmp ugt i32 %47, 0
  br i1 %48, label %49, label %71

; <label>:49:                                     ; preds = %46
  %50 = load i8*, i8** %9, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %9, align 8
  %52 = load i8, i8* %50, align 1
  %53 = load i8*, i8** %10, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 2
  store i8 %52, i8* %54, align 1
  %55 = load i8*, i8** %9, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %9, align 8
  %57 = load i8, i8* %55, align 1
  %58 = load i8*, i8** %10, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 1
  store i8 %57, i8* %59, align 1
  %60 = load i8*, i8** %9, align 8
  %61 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %61, i8** %9, align 8
  %62 = load i8, i8* %60, align 1
  %63 = load i8*, i8** %10, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 0
  store i8 %62, i8* %64, align 1
  %65 = load i8*, i8** %10, align 8
  %66 = getelementptr inbounds i8, i8* %65, i64 3
  store i8* %66, i8** %10, align 8
  br label %67

; <label>:67:                                     ; preds = %49
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 0)
  %68 = add i64 %pgocount, 1
  store i64 %68, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 0)
  %69 = load i32, i32* %11, align 4
  %70 = add i32 %69, -1
  store i32 %70, i32* %11, align 4
  br label %46

; <label>:71:                                     ; preds = %46
  %72 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %7, align 8
  %73 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %72, i32 0, i32 5
  %74 = load i32, i32* %73, align 8
  store i32 %74, i32* %12, align 4
  br label %75

; <label>:75:                                     ; preds = %79, %71
  %76 = load i32, i32* %12, align 4
  %77 = add nsw i32 %76, -1
  store i32 %77, i32* %12, align 4
  %78 = icmp sge i32 %77, 0
  br i1 %78, label %79, label %83

; <label>:79:                                     ; preds = %75
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 1)
  %80 = add i64 %pgocount1, 1
  store i64 %80, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 1)
  %81 = load i8*, i8** %10, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %10, align 8
  store i8 0, i8* %81, align 1
  br label %75

; <label>:83:                                     ; preds = %75
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 2)
  %84 = add i64 %pgocount2, 1
  store i64 %84, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 2)
  ret void
}

declare void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @write_os2_header(%struct.jpeg_decompress_struct*, %struct.bmp_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.bmp_dest_struct*, align 8
  %5 = alloca [14 x i8], align 1
  %6 = alloca [12 x i8], align 1
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.bmp_dest_struct* %1, %struct.bmp_dest_struct** %4, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 10
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 2
  br i1 %14, label %15, label %25

; <label>:15:                                     ; preds = %2
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 19
  %18 = load i32, i32* %17, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 4)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 4)
  store i32 8, i32* %9, align 4
  store i32 256, i32* %10, align 4
  br label %24

; <label>:22:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 5)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 5)
  store i32 24, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %24

; <label>:24:                                     ; preds = %22, %20
  br label %27

; <label>:25:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 1)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 1)
  store i32 8, i32* %9, align 4
  store i32 256, i32* %10, align 4
  br label %27

; <label>:27:                                     ; preds = %25, %24
  %28 = load i32, i32* %10, align 4
  %29 = mul nsw i32 %28, 3
  %30 = add nsw i32 26, %29
  %31 = sext i32 %30 to i64
  store i64 %31, i64* %7, align 8
  %32 = load i64, i64* %7, align 8
  %33 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %4, align 8
  %34 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %33, i32 0, i32 4
  %35 = load i32, i32* %34, align 4
  %36 = zext i32 %35 to i64
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 27
  %39 = load i32, i32* %38, align 4
  %40 = zext i32 %39 to i64
  %41 = mul nsw i64 %36, %40
  %42 = add nsw i64 %32, %41
  store i64 %42, i64* %8, align 8
  %43 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 14, i32 1, i1 false)
  %44 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %44, i8 0, i64 12, i32 1, i1 false)
  %45 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 0
  store i8 66, i8* %45, align 1
  %46 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 1
  store i8 77, i8* %46, align 1
  %47 = load i64, i64* %8, align 8
  %48 = and i64 %47, 255
  %49 = trunc i64 %48 to i8
  %50 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 2
  store i8 %49, i8* %50, align 1
  %51 = load i64, i64* %8, align 8
  %52 = ashr i64 %51, 8
  %53 = and i64 %52, 255
  %54 = trunc i64 %53 to i8
  %55 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 3
  store i8 %54, i8* %55, align 1
  %56 = load i64, i64* %8, align 8
  %57 = ashr i64 %56, 16
  %58 = and i64 %57, 255
  %59 = trunc i64 %58 to i8
  %60 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 4
  store i8 %59, i8* %60, align 1
  %61 = load i64, i64* %8, align 8
  %62 = ashr i64 %61, 24
  %63 = and i64 %62, 255
  %64 = trunc i64 %63 to i8
  %65 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 5
  store i8 %64, i8* %65, align 1
  %66 = load i64, i64* %7, align 8
  %67 = and i64 %66, 255
  %68 = trunc i64 %67 to i8
  %69 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 10
  store i8 %68, i8* %69, align 1
  %70 = load i64, i64* %7, align 8
  %71 = ashr i64 %70, 8
  %72 = and i64 %71, 255
  %73 = trunc i64 %72 to i8
  %74 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 11
  store i8 %73, i8* %74, align 1
  %75 = load i64, i64* %7, align 8
  %76 = ashr i64 %75, 16
  %77 = and i64 %76, 255
  %78 = trunc i64 %77 to i8
  %79 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 12
  store i8 %78, i8* %79, align 1
  %80 = load i64, i64* %7, align 8
  %81 = ashr i64 %80, 24
  %82 = and i64 %81, 255
  %83 = trunc i64 %82 to i8
  %84 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 13
  store i8 %83, i8* %84, align 1
  %85 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 0
  store i8 12, i8* %85, align 1
  %86 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 1
  store i8 0, i8* %86, align 1
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %87, i32 0, i32 26
  %89 = load i32, i32* %88, align 8
  %90 = and i32 %89, 255
  %91 = trunc i32 %90 to i8
  %92 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 4
  store i8 %91, i8* %92, align 1
  %93 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %94 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %93, i32 0, i32 26
  %95 = load i32, i32* %94, align 8
  %96 = lshr i32 %95, 8
  %97 = and i32 %96, 255
  %98 = trunc i32 %97 to i8
  %99 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 5
  store i8 %98, i8* %99, align 1
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %100, i32 0, i32 27
  %102 = load i32, i32* %101, align 4
  %103 = and i32 %102, 255
  %104 = trunc i32 %103 to i8
  %105 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 6
  store i8 %104, i8* %105, align 1
  %106 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %107 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %106, i32 0, i32 27
  %108 = load i32, i32* %107, align 4
  %109 = lshr i32 %108, 8
  %110 = and i32 %109, 255
  %111 = trunc i32 %110 to i8
  %112 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 7
  store i8 %111, i8* %112, align 1
  %113 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 8
  store i8 1, i8* %113, align 1
  %114 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 9
  store i8 0, i8* %114, align 1
  %115 = load i32, i32* %9, align 4
  %116 = and i32 %115, 255
  %117 = trunc i32 %116 to i8
  %118 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 10
  store i8 %117, i8* %118, align 1
  %119 = load i32, i32* %9, align 4
  %120 = ashr i32 %119, 8
  %121 = and i32 %120, 255
  %122 = trunc i32 %121 to i8
  %123 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i64 0, i64 11
  store i8 %122, i8* %123, align 1
  %124 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i32 0, i32 0
  %125 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %4, align 8
  %126 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %125, i32 0, i32 0
  %127 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %126, i32 0, i32 3
  %128 = load %struct._IO_FILE*, %struct._IO_FILE** %127, align 8
  %129 = call i64 @fwrite(i8* %124, i64 1, i64 14, %struct._IO_FILE* %128)
  %130 = icmp ne i64 %129, 14
  br i1 %130, label %131, label %145

; <label>:131:                                    ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 2)
  %132 = add i64 %pgocount3, 1
  store i64 %132, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 2)
  %133 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %134 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %133, i32 0, i32 0
  %135 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %134, align 8
  %136 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %135, i32 0, i32 5
  store i32 36, i32* %136, align 8
  %137 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %138 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %137, i32 0, i32 0
  %139 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %138, align 8
  %140 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %139, i32 0, i32 0
  %141 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %140, align 8
  %142 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %143 = bitcast %struct.jpeg_decompress_struct* %142 to %struct.jpeg_common_struct*
  %144 = ptrtoint void (%struct.jpeg_common_struct*)* %141 to i64
  call void @__llvm_profile_instrument_target(i64 %144, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_os2_header to i8*), i32 0)
  call void %141(%struct.jpeg_common_struct* %143)
  br label %145

; <label>:145:                                    ; preds = %131, %27
  %146 = getelementptr inbounds [12 x i8], [12 x i8]* %6, i32 0, i32 0
  %147 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %4, align 8
  %148 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %147, i32 0, i32 0
  %149 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %148, i32 0, i32 3
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %149, align 8
  %151 = call i64 @fwrite(i8* %146, i64 1, i64 12, %struct._IO_FILE* %150)
  %152 = icmp ne i64 %151, 12
  br i1 %152, label %153, label %167

; <label>:153:                                    ; preds = %145
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 3)
  %154 = add i64 %pgocount4, 1
  store i64 %154, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 3)
  %155 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %155, i32 0, i32 0
  %157 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %156, align 8
  %158 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %157, i32 0, i32 5
  store i32 36, i32* %158, align 8
  %159 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %160 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %159, i32 0, i32 0
  %161 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %160, align 8
  %162 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %161, i32 0, i32 0
  %163 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %162, align 8
  %164 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %165 = bitcast %struct.jpeg_decompress_struct* %164 to %struct.jpeg_common_struct*
  %166 = ptrtoint void (%struct.jpeg_common_struct*)* %163 to i64
  call void @__llvm_profile_instrument_target(i64 %166, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_os2_header to i8*), i32 1)
  call void %163(%struct.jpeg_common_struct* %165)
  br label %167

; <label>:167:                                    ; preds = %153, %145
  %168 = load i32, i32* %10, align 4
  %169 = icmp sgt i32 %168, 0
  br i1 %169, label %170, label %175

; <label>:170:                                    ; preds = %167
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 0)
  %171 = add i64 %pgocount5, 1
  store i64 %171, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_write_os2_header, i64 0, i64 0)
  %172 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %173 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %4, align 8
  %174 = load i32, i32* %10, align 4
  call void @write_colormap(%struct.jpeg_decompress_struct* %172, %struct.bmp_dest_struct* %173, i32 %174, i32 3)
  br label %175

; <label>:175:                                    ; preds = %170, %167
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_bmp_header(%struct.jpeg_decompress_struct*, %struct.bmp_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.bmp_dest_struct*, align 8
  %5 = alloca [14 x i8], align 1
  %6 = alloca [40 x i8], align 16
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.bmp_dest_struct* %1, %struct.bmp_dest_struct** %4, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 10
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 2
  br i1 %14, label %15, label %25

; <label>:15:                                     ; preds = %2
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 19
  %18 = load i32, i32* %17, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 5)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 5)
  store i32 8, i32* %9, align 4
  store i32 256, i32* %10, align 4
  br label %24

; <label>:22:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 6)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 6)
  store i32 24, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %24

; <label>:24:                                     ; preds = %22, %20
  br label %27

; <label>:25:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 1)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 1)
  store i32 8, i32* %9, align 4
  store i32 256, i32* %10, align 4
  br label %27

; <label>:27:                                     ; preds = %25, %24
  %28 = load i32, i32* %10, align 4
  %29 = mul nsw i32 %28, 4
  %30 = add nsw i32 54, %29
  %31 = sext i32 %30 to i64
  store i64 %31, i64* %7, align 8
  %32 = load i64, i64* %7, align 8
  %33 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %4, align 8
  %34 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %33, i32 0, i32 4
  %35 = load i32, i32* %34, align 4
  %36 = zext i32 %35 to i64
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 27
  %39 = load i32, i32* %38, align 4
  %40 = zext i32 %39 to i64
  %41 = mul nsw i64 %36, %40
  %42 = add nsw i64 %32, %41
  store i64 %42, i64* %8, align 8
  %43 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %43, i8 0, i64 14, i32 1, i1 false)
  %44 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %44, i8 0, i64 40, i32 16, i1 false)
  %45 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 0
  store i8 66, i8* %45, align 1
  %46 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 1
  store i8 77, i8* %46, align 1
  %47 = load i64, i64* %8, align 8
  %48 = and i64 %47, 255
  %49 = trunc i64 %48 to i8
  %50 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 2
  store i8 %49, i8* %50, align 1
  %51 = load i64, i64* %8, align 8
  %52 = ashr i64 %51, 8
  %53 = and i64 %52, 255
  %54 = trunc i64 %53 to i8
  %55 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 3
  store i8 %54, i8* %55, align 1
  %56 = load i64, i64* %8, align 8
  %57 = ashr i64 %56, 16
  %58 = and i64 %57, 255
  %59 = trunc i64 %58 to i8
  %60 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 4
  store i8 %59, i8* %60, align 1
  %61 = load i64, i64* %8, align 8
  %62 = ashr i64 %61, 24
  %63 = and i64 %62, 255
  %64 = trunc i64 %63 to i8
  %65 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 5
  store i8 %64, i8* %65, align 1
  %66 = load i64, i64* %7, align 8
  %67 = and i64 %66, 255
  %68 = trunc i64 %67 to i8
  %69 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 10
  store i8 %68, i8* %69, align 1
  %70 = load i64, i64* %7, align 8
  %71 = ashr i64 %70, 8
  %72 = and i64 %71, 255
  %73 = trunc i64 %72 to i8
  %74 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 11
  store i8 %73, i8* %74, align 1
  %75 = load i64, i64* %7, align 8
  %76 = ashr i64 %75, 16
  %77 = and i64 %76, 255
  %78 = trunc i64 %77 to i8
  %79 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 12
  store i8 %78, i8* %79, align 1
  %80 = load i64, i64* %7, align 8
  %81 = ashr i64 %80, 24
  %82 = and i64 %81, 255
  %83 = trunc i64 %82 to i8
  %84 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i64 0, i64 13
  store i8 %83, i8* %84, align 1
  %85 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 0
  store i8 40, i8* %85, align 16
  %86 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 1
  store i8 0, i8* %86, align 1
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %88 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %87, i32 0, i32 26
  %89 = load i32, i32* %88, align 8
  %90 = and i32 %89, 255
  %91 = trunc i32 %90 to i8
  %92 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 4
  store i8 %91, i8* %92, align 4
  %93 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %94 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %93, i32 0, i32 26
  %95 = load i32, i32* %94, align 8
  %96 = lshr i32 %95, 8
  %97 = and i32 %96, 255
  %98 = trunc i32 %97 to i8
  %99 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 5
  store i8 %98, i8* %99, align 1
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %101 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %100, i32 0, i32 26
  %102 = load i32, i32* %101, align 8
  %103 = lshr i32 %102, 16
  %104 = and i32 %103, 255
  %105 = trunc i32 %104 to i8
  %106 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 6
  store i8 %105, i8* %106, align 2
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %107, i32 0, i32 26
  %109 = load i32, i32* %108, align 8
  %110 = lshr i32 %109, 24
  %111 = and i32 %110, 255
  %112 = trunc i32 %111 to i8
  %113 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 7
  store i8 %112, i8* %113, align 1
  %114 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %115 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %114, i32 0, i32 27
  %116 = load i32, i32* %115, align 4
  %117 = and i32 %116, 255
  %118 = trunc i32 %117 to i8
  %119 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 8
  store i8 %118, i8* %119, align 8
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %120, i32 0, i32 27
  %122 = load i32, i32* %121, align 4
  %123 = lshr i32 %122, 8
  %124 = and i32 %123, 255
  %125 = trunc i32 %124 to i8
  %126 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 9
  store i8 %125, i8* %126, align 1
  %127 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %128 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %127, i32 0, i32 27
  %129 = load i32, i32* %128, align 4
  %130 = lshr i32 %129, 16
  %131 = and i32 %130, 255
  %132 = trunc i32 %131 to i8
  %133 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 10
  store i8 %132, i8* %133, align 2
  %134 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %135 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %134, i32 0, i32 27
  %136 = load i32, i32* %135, align 4
  %137 = lshr i32 %136, 24
  %138 = and i32 %137, 255
  %139 = trunc i32 %138 to i8
  %140 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 11
  store i8 %139, i8* %140, align 1
  %141 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 12
  store i8 1, i8* %141, align 4
  %142 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 13
  store i8 0, i8* %142, align 1
  %143 = load i32, i32* %9, align 4
  %144 = and i32 %143, 255
  %145 = trunc i32 %144 to i8
  %146 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 14
  store i8 %145, i8* %146, align 2
  %147 = load i32, i32* %9, align 4
  %148 = ashr i32 %147, 8
  %149 = and i32 %148, 255
  %150 = trunc i32 %149 to i8
  %151 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 15
  store i8 %150, i8* %151, align 1
  %152 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %153 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %152, i32 0, i32 51
  %154 = load i8, i8* %153, align 8
  %155 = zext i8 %154 to i32
  %156 = icmp eq i32 %155, 2
  br i1 %156, label %157, label %237

; <label>:157:                                    ; preds = %27
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 2)
  %158 = add i64 %pgocount3, 1
  store i64 %158, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 2)
  %159 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %160 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %159, i32 0, i32 52
  %161 = load i16, i16* %160, align 2
  %162 = zext i16 %161 to i32
  %163 = mul nsw i32 %162, 100
  %164 = sext i32 %163 to i64
  %165 = and i64 %164, 255
  %166 = trunc i64 %165 to i8
  %167 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 24
  store i8 %166, i8* %167, align 8
  %168 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %169 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %168, i32 0, i32 52
  %170 = load i16, i16* %169, align 2
  %171 = zext i16 %170 to i32
  %172 = mul nsw i32 %171, 100
  %173 = sext i32 %172 to i64
  %174 = ashr i64 %173, 8
  %175 = and i64 %174, 255
  %176 = trunc i64 %175 to i8
  %177 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 25
  store i8 %176, i8* %177, align 1
  %178 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %179 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %178, i32 0, i32 52
  %180 = load i16, i16* %179, align 2
  %181 = zext i16 %180 to i32
  %182 = mul nsw i32 %181, 100
  %183 = sext i32 %182 to i64
  %184 = ashr i64 %183, 16
  %185 = and i64 %184, 255
  %186 = trunc i64 %185 to i8
  %187 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 26
  store i8 %186, i8* %187, align 2
  %188 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %189 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %188, i32 0, i32 52
  %190 = load i16, i16* %189, align 2
  %191 = zext i16 %190 to i32
  %192 = mul nsw i32 %191, 100
  %193 = sext i32 %192 to i64
  %194 = ashr i64 %193, 24
  %195 = and i64 %194, 255
  %196 = trunc i64 %195 to i8
  %197 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 27
  store i8 %196, i8* %197, align 1
  %198 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %199 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %198, i32 0, i32 53
  %200 = load i16, i16* %199, align 4
  %201 = zext i16 %200 to i32
  %202 = mul nsw i32 %201, 100
  %203 = sext i32 %202 to i64
  %204 = and i64 %203, 255
  %205 = trunc i64 %204 to i8
  %206 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 28
  store i8 %205, i8* %206, align 4
  %207 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %208 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %207, i32 0, i32 53
  %209 = load i16, i16* %208, align 4
  %210 = zext i16 %209 to i32
  %211 = mul nsw i32 %210, 100
  %212 = sext i32 %211 to i64
  %213 = ashr i64 %212, 8
  %214 = and i64 %213, 255
  %215 = trunc i64 %214 to i8
  %216 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 29
  store i8 %215, i8* %216, align 1
  %217 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %218 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %217, i32 0, i32 53
  %219 = load i16, i16* %218, align 4
  %220 = zext i16 %219 to i32
  %221 = mul nsw i32 %220, 100
  %222 = sext i32 %221 to i64
  %223 = ashr i64 %222, 16
  %224 = and i64 %223, 255
  %225 = trunc i64 %224 to i8
  %226 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 30
  store i8 %225, i8* %226, align 2
  %227 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %228 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %227, i32 0, i32 53
  %229 = load i16, i16* %228, align 4
  %230 = zext i16 %229 to i32
  %231 = mul nsw i32 %230, 100
  %232 = sext i32 %231 to i64
  %233 = ashr i64 %232, 24
  %234 = and i64 %233, 255
  %235 = trunc i64 %234 to i8
  %236 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 31
  store i8 %235, i8* %236, align 1
  br label %237

; <label>:237:                                    ; preds = %157, %27
  %238 = load i32, i32* %10, align 4
  %239 = and i32 %238, 255
  %240 = trunc i32 %239 to i8
  %241 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 32
  store i8 %240, i8* %241, align 16
  %242 = load i32, i32* %10, align 4
  %243 = ashr i32 %242, 8
  %244 = and i32 %243, 255
  %245 = trunc i32 %244 to i8
  %246 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i64 0, i64 33
  store i8 %245, i8* %246, align 1
  %247 = getelementptr inbounds [14 x i8], [14 x i8]* %5, i32 0, i32 0
  %248 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %4, align 8
  %249 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %248, i32 0, i32 0
  %250 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %249, i32 0, i32 3
  %251 = load %struct._IO_FILE*, %struct._IO_FILE** %250, align 8
  %252 = call i64 @fwrite(i8* %247, i64 1, i64 14, %struct._IO_FILE* %251)
  %253 = icmp ne i64 %252, 14
  br i1 %253, label %254, label %268

; <label>:254:                                    ; preds = %237
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 3)
  %255 = add i64 %pgocount4, 1
  store i64 %255, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 3)
  %256 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %257 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %256, i32 0, i32 0
  %258 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %257, align 8
  %259 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %258, i32 0, i32 5
  store i32 36, i32* %259, align 8
  %260 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %261 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %260, i32 0, i32 0
  %262 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %261, align 8
  %263 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %262, i32 0, i32 0
  %264 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %263, align 8
  %265 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %266 = bitcast %struct.jpeg_decompress_struct* %265 to %struct.jpeg_common_struct*
  %267 = ptrtoint void (%struct.jpeg_common_struct*)* %264 to i64
  call void @__llvm_profile_instrument_target(i64 %267, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_bmp_header to i8*), i32 0)
  call void %264(%struct.jpeg_common_struct* %266)
  br label %268

; <label>:268:                                    ; preds = %254, %237
  %269 = getelementptr inbounds [40 x i8], [40 x i8]* %6, i32 0, i32 0
  %270 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %4, align 8
  %271 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %270, i32 0, i32 0
  %272 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %271, i32 0, i32 3
  %273 = load %struct._IO_FILE*, %struct._IO_FILE** %272, align 8
  %274 = call i64 @fwrite(i8* %269, i64 1, i64 40, %struct._IO_FILE* %273)
  %275 = icmp ne i64 %274, 40
  br i1 %275, label %276, label %290

; <label>:276:                                    ; preds = %268
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 4)
  %277 = add i64 %pgocount5, 1
  store i64 %277, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 4)
  %278 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %279 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %278, i32 0, i32 0
  %280 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %279, align 8
  %281 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %280, i32 0, i32 5
  store i32 36, i32* %281, align 8
  %282 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %283 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %282, i32 0, i32 0
  %284 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %283, align 8
  %285 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %284, i32 0, i32 0
  %286 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %285, align 8
  %287 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %288 = bitcast %struct.jpeg_decompress_struct* %287 to %struct.jpeg_common_struct*
  %289 = ptrtoint void (%struct.jpeg_common_struct*)* %286 to i64
  call void @__llvm_profile_instrument_target(i64 %289, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_bmp_header to i8*), i32 1)
  call void %286(%struct.jpeg_common_struct* %288)
  br label %290

; <label>:290:                                    ; preds = %276, %268
  %291 = load i32, i32* %10, align 4
  %292 = icmp sgt i32 %291, 0
  br i1 %292, label %293, label %298

; <label>:293:                                    ; preds = %290
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 0)
  %294 = add i64 %pgocount6, 1
  store i64 %294, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_bmp_header, i64 0, i64 0)
  %295 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %296 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %4, align 8
  %297 = load i32, i32* %10, align 4
  call void @write_colormap(%struct.jpeg_decompress_struct* %295, %struct.bmp_dest_struct* %296, i32 %297, i32 4)
  br label %298

; <label>:298:                                    ; preds = %293, %290
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @write_colormap(%struct.jpeg_decompress_struct*, %struct.bmp_dest_struct*, i32, i32) #0 {
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca %struct.bmp_dest_struct*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct._IO_FILE*, align 8
  %12 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store %struct.bmp_dest_struct* %1, %struct.bmp_dest_struct** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %13 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %13, i32 0, i32 32
  %15 = load i8**, i8*** %14, align 8
  store i8** %15, i8*** %9, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 31
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %10, align 4
  %19 = load %struct.bmp_dest_struct*, %struct.bmp_dest_struct** %6, align 8
  %20 = getelementptr inbounds %struct.bmp_dest_struct, %struct.bmp_dest_struct* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %20, i32 0, i32 3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %21, align 8
  store %struct._IO_FILE* %22, %struct._IO_FILE** %11, align 8
  %23 = load i8**, i8*** %9, align 8
  %24 = icmp ne i8** %23, null
  br i1 %24, label %25, label %129

; <label>:25:                                     ; preds = %4
  %26 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %26, i32 0, i32 28
  %28 = load i32, i32* %27, align 8
  %29 = icmp eq i32 %28, 3
  br i1 %29, label %30, label %79

; <label>:30:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 10)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 10)
  store i32 0, i32* %12, align 4
  br label %32

; <label>:32:                                     ; preds = %74, %30
  %33 = load i32, i32* %12, align 4
  %34 = load i32, i32* %10, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %78

; <label>:36:                                     ; preds = %32
  %37 = load i8**, i8*** %9, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 2
  %39 = load i8*, i8** %38, align 8
  %40 = load i32, i32* %12, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8* %39, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %46 = call i32 @_IO_putc(i32 %44, %struct._IO_FILE* %45)
  %47 = load i8**, i8*** %9, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 1
  %49 = load i8*, i8** %48, align 8
  %50 = load i32, i32* %12, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %56 = call i32 @_IO_putc(i32 %54, %struct._IO_FILE* %55)
  %57 = load i8**, i8*** %9, align 8
  %58 = getelementptr inbounds i8*, i8** %57, i64 0
  %59 = load i8*, i8** %58, align 8
  %60 = load i32, i32* %12, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8* %59, i64 %61
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %66 = call i32 @_IO_putc(i32 %64, %struct._IO_FILE* %65)
  %67 = load i32, i32* %8, align 4
  %68 = icmp eq i32 %67, 4
  br i1 %68, label %69, label %73

; <label>:69:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 6)
  %70 = add i64 %pgocount1, 1
  store i64 %70, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 6)
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %72 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %71)
  br label %73

; <label>:73:                                     ; preds = %69, %36
  br label %74

; <label>:74:                                     ; preds = %73
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 3)
  %75 = add i64 %pgocount2, 1
  store i64 %75, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 3)
  %76 = load i32, i32* %12, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %12, align 4
  br label %32

; <label>:78:                                     ; preds = %32
  br label %128

; <label>:79:                                     ; preds = %25
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 11)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 11)
  store i32 0, i32* %12, align 4
  br label %81

; <label>:81:                                     ; preds = %123, %79
  %82 = load i32, i32* %12, align 4
  %83 = load i32, i32* %10, align 4
  %84 = icmp slt i32 %82, %83
  br i1 %84, label %85, label %127

; <label>:85:                                     ; preds = %81
  %86 = load i8**, i8*** %9, align 8
  %87 = getelementptr inbounds i8*, i8** %86, i64 0
  %88 = load i8*, i8** %87, align 8
  %89 = load i32, i32* %12, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8* %88, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %95 = call i32 @_IO_putc(i32 %93, %struct._IO_FILE* %94)
  %96 = load i8**, i8*** %9, align 8
  %97 = getelementptr inbounds i8*, i8** %96, i64 0
  %98 = load i8*, i8** %97, align 8
  %99 = load i32, i32* %12, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8* %98, i64 %100
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %105 = call i32 @_IO_putc(i32 %103, %struct._IO_FILE* %104)
  %106 = load i8**, i8*** %9, align 8
  %107 = getelementptr inbounds i8*, i8** %106, i64 0
  %108 = load i8*, i8** %107, align 8
  %109 = load i32, i32* %12, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8* %108, i64 %110
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %115 = call i32 @_IO_putc(i32 %113, %struct._IO_FILE* %114)
  %116 = load i32, i32* %8, align 4
  %117 = icmp eq i32 %116, 4
  br i1 %117, label %118, label %122

; <label>:118:                                    ; preds = %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 7)
  %119 = add i64 %pgocount4, 1
  store i64 %119, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 7)
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %121 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %120)
  br label %122

; <label>:122:                                    ; preds = %118, %85
  br label %123

; <label>:123:                                    ; preds = %122
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 4)
  %124 = add i64 %pgocount5, 1
  store i64 %124, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 4)
  %125 = load i32, i32* %12, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %12, align 4
  br label %81

; <label>:127:                                    ; preds = %81
  br label %128

; <label>:128:                                    ; preds = %127, %78
  br label %156

; <label>:129:                                    ; preds = %4
  store i32 0, i32* %12, align 4
  br label %130

; <label>:130:                                    ; preds = %150, %129
  %131 = load i32, i32* %12, align 4
  %132 = icmp slt i32 %131, 256
  br i1 %132, label %133, label %154

; <label>:133:                                    ; preds = %130
  %134 = load i32, i32* %12, align 4
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %136 = call i32 @_IO_putc(i32 %134, %struct._IO_FILE* %135)
  %137 = load i32, i32* %12, align 4
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %139 = call i32 @_IO_putc(i32 %137, %struct._IO_FILE* %138)
  %140 = load i32, i32* %12, align 4
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %142 = call i32 @_IO_putc(i32 %140, %struct._IO_FILE* %141)
  %143 = load i32, i32* %8, align 4
  %144 = icmp eq i32 %143, 4
  br i1 %144, label %145, label %149

; <label>:145:                                    ; preds = %133
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 5)
  %146 = add i64 %pgocount6, 1
  store i64 %146, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 5)
  %147 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %148 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %147)
  br label %149

; <label>:149:                                    ; preds = %145, %133
  br label %150

; <label>:150:                                    ; preds = %149
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 2)
  %151 = add i64 %pgocount7, 1
  store i64 %151, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 2)
  %152 = load i32, i32* %12, align 4
  %153 = add nsw i32 %152, 1
  store i32 %153, i32* %12, align 4
  br label %130

; <label>:154:                                    ; preds = %130
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 9)
  %155 = add i64 %pgocount8, 1
  store i64 %155, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 9)
  br label %156

; <label>:156:                                    ; preds = %154, %128
  %157 = load i32, i32* %12, align 4
  %158 = load i32, i32* %7, align 4
  %159 = icmp sgt i32 %157, %158
  br i1 %159, label %160, label %181

; <label>:160:                                    ; preds = %156
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 8)
  %161 = add i64 %pgocount9, 1
  store i64 %161, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 8)
  %162 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %163 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %162, i32 0, i32 0
  %164 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %163, align 8
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %164, i32 0, i32 5
  store i32 1039, i32* %165, align 8
  %166 = load i32, i32* %12, align 4
  %167 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %168 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %167, i32 0, i32 0
  %169 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %168, align 8
  %170 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %169, i32 0, i32 6
  %171 = bitcast %union.anon* %170 to [8 x i32]*
  %172 = getelementptr inbounds [8 x i32], [8 x i32]* %171, i64 0, i64 0
  store i32 %166, i32* %172, align 4
  %173 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %174 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %173, i32 0, i32 0
  %175 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %174, align 8
  %176 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %175, i32 0, i32 0
  %177 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %176, align 8
  %178 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %179 = bitcast %struct.jpeg_decompress_struct* %178 to %struct.jpeg_common_struct*
  %180 = ptrtoint void (%struct.jpeg_common_struct*)* %177 to i64
  call void @__llvm_profile_instrument_target(i64 %180, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_colormap to i8*), i32 0)
  call void %177(%struct.jpeg_common_struct* %179)
  br label %181

; <label>:181:                                    ; preds = %160, %156
  br label %182

; <label>:182:                                    ; preds = %200, %181
  %183 = load i32, i32* %12, align 4
  %184 = load i32, i32* %7, align 4
  %185 = icmp slt i32 %183, %184
  br i1 %185, label %186, label %204

; <label>:186:                                    ; preds = %182
  %187 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %188 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %187)
  %189 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %190 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %189)
  %191 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %192 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %191)
  %193 = load i32, i32* %8, align 4
  %194 = icmp eq i32 %193, 4
  br i1 %194, label %195, label %199

; <label>:195:                                    ; preds = %186
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 1)
  %196 = add i64 %pgocount10, 1
  store i64 %196, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 1)
  %197 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %198 = call i32 @_IO_putc(i32 0, %struct._IO_FILE* %197)
  br label %199

; <label>:199:                                    ; preds = %195, %186
  br label %200

; <label>:200:                                    ; preds = %199
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 0)
  %201 = add i64 %pgocount11, 1
  store i64 %201, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_write_colormap, i64 0, i64 0)
  %202 = load i32, i32* %12, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* %12, align 4
  br label %182

; <label>:204:                                    ; preds = %182
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
