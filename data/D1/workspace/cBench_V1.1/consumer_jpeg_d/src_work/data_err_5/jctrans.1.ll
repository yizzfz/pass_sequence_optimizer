; ModuleID = 'jctrans.ll'
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

; Function Attrs: noinline nounwind uwtable
define void @jpeg_write_coefficients(%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 100
  br i1 %5, label %17, label %6

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 5
  store i32 18, i32* %9, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr, 28
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %10 = load i32, i32* %sunkaddr8, align 4
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 0
  store i32 %10, i32* %12, align 4
  %13 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #4
  br label %17

; <label>:17:                                     ; preds = %2, %6
  tail call void @jpeg_suppress_tables(%struct.jpeg_compress_struct* nonnull %0, i32 0) #4
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 4
  %21 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %20, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %21(%struct.jpeg_common_struct* %22) #4
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %24 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %24, i64 0, i32 2
  %26 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %25, align 8
  tail call void %26(%struct.jpeg_compress_struct* nonnull %0) #4
  tail call void @transencode_master_selection(%struct.jpeg_compress_struct* nonnull %0, %struct.jvirt_barray_control** %1)
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 36
  store i32 0, i32* %27, align 8
  %sunkaddr9 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 28
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  store i32 103, i32* %sunkaddr11, align 4
  ret void
}

declare void @jpeg_suppress_tables(%struct.jpeg_compress_struct*, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @transencode_master_selection(%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 1, i32* %3, align 8
  tail call void @jinit_c_master_control(%struct.jpeg_compress_struct* %0, i32 1) #4
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  %5 = load i32, i32* %4, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %15, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 1, i32* %10, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %12 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %11, align 8
  %13 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %12, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %13(%struct.jpeg_common_struct* %14) #4
  br label %21

; <label>:15:                                     ; preds = %2
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %20, label %19

; <label>:19:                                     ; preds = %15
  tail call void @jinit_phuff_encoder(%struct.jpeg_compress_struct* nonnull %0) #4
  br label %21

; <label>:20:                                     ; preds = %15
  tail call void @jinit_huff_encoder(%struct.jpeg_compress_struct* nonnull %0) #4
  br label %21

; <label>:21:                                     ; preds = %19, %20, %7
  tail call void @transencode_coef_controller(%struct.jpeg_compress_struct* nonnull %0, %struct.jvirt_barray_control** %1)
  tail call void @jinit_marker_writer(%struct.jpeg_compress_struct* nonnull %0) #4
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %23 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %23, i64 0, i32 6
  %25 = bitcast {}** %24 to void (%struct.jpeg_common_struct*)**
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %26(%struct.jpeg_common_struct* %27) #4
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %29 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %29, i64 0, i32 1
  %31 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %30, align 8
  tail call void %31(%struct.jpeg_compress_struct* nonnull %0) #4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_copy_critical_parameters(%struct.jpeg_decompress_struct*, %struct.jpeg_compress_struct*) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 100
  br i1 %5, label %17, label %6

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 0
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 5
  store i32 18, i32* %9, align 8
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr59 = add i64 %sunkaddr, 28
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to i32*
  %10 = load i32, i32* %sunkaddr60, align 4
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %7, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 0
  store i32 %10, i32* %12, align 4
  %13 = bitcast %struct.jpeg_compress_struct* %1 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #4
  br label %17

; <label>:17:                                     ; preds = %6, %2
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 6
  store i32 %19, i32* %20, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 7
  store i32 %22, i32* %23, align 4
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %25 = load i32, i32* %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 8
  store i32 %25, i32* %26, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 9
  %28 = load i32, i32* %27, align 4
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 9
  store i32 %28, i32* %29, align 4
  tail call void @jpeg_set_defaults(%struct.jpeg_compress_struct* nonnull %1) #4
  %30 = load i32, i32* %27, align 4
  tail call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* nonnull %1, i32 %30) #4
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 42
  %32 = load i32, i32* %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 11
  store i32 %32, i32* %33, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 56
  %35 = load i32, i32* %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 26
  store i32 %35, i32* %36, align 4
  %37 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %sunkaddr61 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr66 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr71 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr76 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 0
  %39 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %38, align 8
  %40 = icmp eq %struct.JQUANT_TBL* %39, null
  br i1 %40, label %52, label %41

; <label>:41:                                     ; preds = %17
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 15, i64 0
  %43 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %42, align 8
  %44 = icmp eq %struct.JQUANT_TBL* %43, null
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %41
  %46 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %37) #4
  %sunkaddr64 = add i64 %sunkaddr61, 88
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %46, %struct.JQUANT_TBL** %sunkaddr65, align 8
  br label %47

; <label>:47:                                     ; preds = %45, %41
  %sunkaddr69 = add i64 %sunkaddr66, 88
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to i8**
  %48 = load i8*, i8** %sunkaddr70, align 8
  %sunkaddr74 = add i64 %sunkaddr71, 192
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i8**
  %49 = load i8*, i8** %sunkaddr75, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %48, i8* %49, i64 128, i32 4, i1 false)
  %sunkaddr79 = add i64 %sunkaddr76, 88
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to %struct.JQUANT_TBL**
  %50 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr80, align 8
  %51 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %50, i64 0, i32 1
  store i32 0, i32* %51, align 4
  br label %52

; <label>:52:                                     ; preds = %47, %17
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 1
  %54 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %53, align 8
  %55 = icmp eq %struct.JQUANT_TBL* %54, null
  br i1 %55, label %153, label %142

; <label>:56:                                     ; preds = %183
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 0
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 5
  store i32 24, i32* %59, align 8
  %sunkaddr84 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr85 = add i64 %sunkaddr84, 68
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to i32*
  %60 = load i32, i32* %sunkaddr86, align 4
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i64 0, i32 6, i32 0, i64 0
  store i32 %60, i32* %62, align 4
  %63 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %64 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %63, i64 0, i32 6, i32 0, i64 1
  store i32 10, i32* %64, align 4
  %65 = bitcast %struct.jpeg_compress_struct* %1 to void (%struct.jpeg_common_struct*)***
  %66 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %65, align 8
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  %.cast3 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  tail call void %67(%struct.jpeg_common_struct* %.cast3) #4
  br label %68

; <label>:68:                                     ; preds = %183, %56
  %sunkaddr87 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr88 = add i64 %sunkaddr87, 68
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to i32*
  %69 = load i32, i32* %sunkaddr89, align 4
  %70 = icmp sgt i32 %69, 0
  br i1 %70, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %68
  %71 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 14
  %72 = bitcast %struct.jpeg_component_info** %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %75 = bitcast %struct.jpeg_component_info** %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 0
  %.cast2 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 0
  %.cast = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %79 = bitcast %struct.jpeg_compress_struct* %1 to void (%struct.jpeg_common_struct*)***
  %80 = bitcast %struct.jpeg_compress_struct* %1 to void (%struct.jpeg_common_struct*)***
  br label %81

; <label>:81:                                     ; preds = %.lr.ph, %.loopexit
  %.sroa.022.093 = phi i64 [ %76, %.lr.ph ], [ %137, %.loopexit ]
  %.092 = phi i32 [ 0, %.lr.ph ], [ %135, %.loopexit ]
  %.sroa.018.091 = phi i64 [ %73, %.lr.ph ], [ %139, %.loopexit ]
  %82 = inttoptr i64 %.sroa.022.093 to %struct.jpeg_component_info*
  %83 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 0
  %84 = load i32, i32* %83, align 8
  %85 = inttoptr i64 %.sroa.018.091 to %struct.jpeg_component_info*
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %85, i64 0, i32 0
  store i32 %84, i32* %86, align 8
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 2
  %88 = load i32, i32* %87, align 8
  %89 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %85, i64 0, i32 2
  store i32 %88, i32* %89, align 8
  %90 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 3
  %91 = load i32, i32* %90, align 4
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %85, i64 0, i32 3
  store i32 %91, i32* %92, align 4
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %82, i64 0, i32 4
  %94 = load i32, i32* %93, align 8
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %85, i64 0, i32 4
  store i32 %94, i32* %96, align 8
  %97 = icmp ugt i32 %94, 3
  br i1 %97, label %103, label %98

; <label>:98:                                     ; preds = %81
  %99 = sext i32 %94 to i64
  %100 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 %99
  %101 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %100, align 8
  %102 = icmp eq %struct.JQUANT_TBL* %101, null
  br i1 %102, label %103, label %110

; <label>:103:                                    ; preds = %98, %81
  %104 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %105 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %104, i64 0, i32 5
  store i32 51, i32* %105, align 8
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %77, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i64 0, i32 6, i32 0, i64 0
  store i32 %94, i32* %107, align 4
  %108 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %79, align 8
  %109 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %108, align 8
  tail call void %109(%struct.jpeg_common_struct* %.cast2) #4
  br label %110

; <label>:110:                                    ; preds = %103, %98
  %111 = inttoptr i64 %.sroa.022.093 to %struct.jpeg_component_info*
  %112 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 %95
  %113 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %112, align 8
  %114 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %111, i64 0, i32 19
  %115 = bitcast %struct.JQUANT_TBL** %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = icmp eq i64 %116, 0
  br i1 %117, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %110
  %118 = inttoptr i64 %116 to %struct.JQUANT_TBL*
  br label %119

; <label>:119:                                    ; preds = %132, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %132 ]
  %120 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %118, i64 0, i32 0, i64 %indvars.iv
  %121 = load i16, i16* %120, align 2
  %122 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %113, i64 0, i32 0, i64 %indvars.iv
  %123 = load i16, i16* %122, align 2
  %124 = icmp eq i16 %121, %123
  br i1 %124, label %132, label %125

; <label>:125:                                    ; preds = %119
  %126 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %127 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %126, i64 0, i32 5
  store i32 43, i32* %127, align 8
  %128 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %129 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i64 0, i32 6, i32 0, i64 0
  store i32 %94, i32* %129, align 4
  %130 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %80, align 8
  %131 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %130, align 8
  tail call void %131(%struct.jpeg_common_struct* %.cast) #4
  br label %132

; <label>:132:                                    ; preds = %125, %119
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond, label %.loopexit.loopexit, label %119

.loopexit.loopexit:                               ; preds = %132
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %110
  %133 = inttoptr i64 %.sroa.018.091 to %struct.jpeg_component_info*
  %134 = inttoptr i64 %.sroa.022.093 to %struct.jpeg_component_info*
  %135 = add nuw nsw i32 %.092, 1
  %136 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %134, i64 1
  %137 = ptrtoint %struct.jpeg_component_info* %136 to i64
  %138 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %133, i64 1
  %139 = ptrtoint %struct.jpeg_component_info* %138 to i64
  %140 = load i32, i32* %sunkaddr89, align 4
  %141 = icmp slt i32 %135, %140
  br i1 %141, label %81, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %68
  ret void

; <label>:142:                                    ; preds = %52
  %143 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 15, i64 1
  %144 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %143, align 8
  %145 = icmp eq %struct.JQUANT_TBL* %144, null
  br i1 %145, label %146, label %148

; <label>:146:                                    ; preds = %142
  %147 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %37) #4
  %sunkaddr64.1 = add i64 %sunkaddr61, 96
  %sunkaddr65.1 = inttoptr i64 %sunkaddr64.1 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %147, %struct.JQUANT_TBL** %sunkaddr65.1, align 8
  br label %148

; <label>:148:                                    ; preds = %146, %142
  %sunkaddr69.1 = add i64 %sunkaddr66, 96
  %sunkaddr70.1 = inttoptr i64 %sunkaddr69.1 to i8**
  %149 = load i8*, i8** %sunkaddr70.1, align 8
  %sunkaddr74.1 = add i64 %sunkaddr71, 200
  %sunkaddr75.1 = inttoptr i64 %sunkaddr74.1 to i8**
  %150 = load i8*, i8** %sunkaddr75.1, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %149, i8* %150, i64 128, i32 4, i1 false)
  %sunkaddr79.1 = add i64 %sunkaddr76, 96
  %sunkaddr80.1 = inttoptr i64 %sunkaddr79.1 to %struct.JQUANT_TBL**
  %151 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr80.1, align 8
  %152 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %151, i64 0, i32 1
  store i32 0, i32* %152, align 4
  br label %153

; <label>:153:                                    ; preds = %148, %52
  %154 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 2
  %155 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %154, align 8
  %156 = icmp eq %struct.JQUANT_TBL* %155, null
  br i1 %156, label %168, label %157

; <label>:157:                                    ; preds = %153
  %158 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 15, i64 2
  %159 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %158, align 8
  %160 = icmp eq %struct.JQUANT_TBL* %159, null
  br i1 %160, label %161, label %163

; <label>:161:                                    ; preds = %157
  %162 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %37) #4
  %sunkaddr64.2 = add i64 %sunkaddr61, 104
  %sunkaddr65.2 = inttoptr i64 %sunkaddr64.2 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %162, %struct.JQUANT_TBL** %sunkaddr65.2, align 8
  br label %163

; <label>:163:                                    ; preds = %161, %157
  %sunkaddr69.2 = add i64 %sunkaddr66, 104
  %sunkaddr70.2 = inttoptr i64 %sunkaddr69.2 to i8**
  %164 = load i8*, i8** %sunkaddr70.2, align 8
  %sunkaddr74.2 = add i64 %sunkaddr71, 208
  %sunkaddr75.2 = inttoptr i64 %sunkaddr74.2 to i8**
  %165 = load i8*, i8** %sunkaddr75.2, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %164, i8* %165, i64 128, i32 4, i1 false)
  %sunkaddr79.2 = add i64 %sunkaddr76, 104
  %sunkaddr80.2 = inttoptr i64 %sunkaddr79.2 to %struct.JQUANT_TBL**
  %166 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr80.2, align 8
  %167 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %166, i64 0, i32 1
  store i32 0, i32* %167, align 4
  br label %168

; <label>:168:                                    ; preds = %163, %153
  %169 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 3
  %170 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %169, align 8
  %171 = icmp eq %struct.JQUANT_TBL* %170, null
  br i1 %171, label %183, label %172

; <label>:172:                                    ; preds = %168
  %173 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 15, i64 3
  %174 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %173, align 8
  %175 = icmp eq %struct.JQUANT_TBL* %174, null
  br i1 %175, label %176, label %178

; <label>:176:                                    ; preds = %172
  %177 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %37) #4
  %sunkaddr64.3 = add i64 %sunkaddr61, 112
  %sunkaddr65.3 = inttoptr i64 %sunkaddr64.3 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %177, %struct.JQUANT_TBL** %sunkaddr65.3, align 8
  br label %178

; <label>:178:                                    ; preds = %176, %172
  %sunkaddr69.3 = add i64 %sunkaddr66, 112
  %sunkaddr70.3 = inttoptr i64 %sunkaddr69.3 to i8**
  %179 = load i8*, i8** %sunkaddr70.3, align 8
  %sunkaddr74.3 = add i64 %sunkaddr71, 216
  %sunkaddr75.3 = inttoptr i64 %sunkaddr74.3 to i8**
  %180 = load i8*, i8** %sunkaddr75.3, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %179, i8* %180, i64 128, i32 4, i1 false)
  %sunkaddr79.3 = add i64 %sunkaddr76, 112
  %sunkaddr80.3 = inttoptr i64 %sunkaddr79.3 to %struct.JQUANT_TBL**
  %181 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr80.3, align 8
  %182 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %181, i64 0, i32 1
  store i32 0, i32* %182, align 4
  br label %183

; <label>:183:                                    ; preds = %178, %168
  %sunkaddr81 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr82 = add i64 %sunkaddr81, 48
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to i32*
  %184 = load i32, i32* %sunkaddr83, align 8
  %185 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 12
  store i32 %184, i32* %185, align 4
  %.off = add i32 %184, -1
  %186 = icmp ugt i32 %.off, 9
  br i1 %186, label %56, label %68
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
  %3 = ptrtoint %struct.jvirt_barray_control** %1 to i64
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %5 = bitcast %struct.jpeg_memory_mgr** %4 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %5, align 8
  %7 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %6, align 8
  %8 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %9 = tail call i8* %7(%struct.jpeg_common_struct* %8, i32 1, i64 120) #4
  %.cast = ptrtoint i8* %9 to i64
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %11 = bitcast %struct.jpeg_c_coef_controller** %10 to i64*
  store i64 %.cast, i64* %11, align 8
  %12 = bitcast i8* %9 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef, void (%struct.jpeg_compress_struct*, i32)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %9, i64 8
  %14 = bitcast i8* %13 to i32 (%struct.jpeg_compress_struct*, i8***)**
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_output, i32 (%struct.jpeg_compress_struct*, i8***)** %14, align 8
  %15 = getelementptr inbounds i8, i8* %9, i64 32
  %16 = bitcast i8* %15 to i64*
  store i64 %3, i64* %16, align 8
  %17 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %4, align 8
  %18 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %17, i64 0, i32 1
  %19 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %18, align 8
  %20 = tail call i8* %19(%struct.jpeg_common_struct* %8, i32 1, i64 1280) #4
  tail call void @jzero_far(i8* %20, i64 1280) #4
  %21 = getelementptr inbounds i8, i8* %9, i64 40
  %22 = bitcast i8* %21 to i8**
  store i8* %20, i8** %22, align 8
  %23 = getelementptr inbounds i8, i8* %20, i64 128
  %24 = getelementptr inbounds i8, i8* %9, i64 48
  %25 = bitcast i8* %24 to i8**
  store i8* %23, i8** %25, align 8
  %26 = getelementptr inbounds i8, i8* %20, i64 256
  %27 = getelementptr inbounds i8, i8* %9, i64 56
  %28 = bitcast i8* %27 to i8**
  store i8* %26, i8** %28, align 8
  %29 = getelementptr inbounds i8, i8* %20, i64 384
  %30 = getelementptr inbounds i8, i8* %9, i64 64
  %31 = bitcast i8* %30 to i8**
  store i8* %29, i8** %31, align 8
  %32 = getelementptr inbounds i8, i8* %20, i64 512
  %33 = getelementptr inbounds i8, i8* %9, i64 72
  %34 = bitcast i8* %33 to i8**
  store i8* %32, i8** %34, align 8
  %35 = getelementptr inbounds i8, i8* %20, i64 640
  %36 = getelementptr inbounds i8, i8* %9, i64 80
  %37 = bitcast i8* %36 to i8**
  store i8* %35, i8** %37, align 8
  %38 = getelementptr inbounds i8, i8* %20, i64 768
  %39 = getelementptr inbounds i8, i8* %9, i64 88
  %40 = bitcast i8* %39 to i8**
  store i8* %38, i8** %40, align 8
  %41 = getelementptr inbounds i8, i8* %20, i64 896
  %42 = getelementptr inbounds i8, i8* %9, i64 96
  %43 = bitcast i8* %42 to i8**
  store i8* %41, i8** %43, align 8
  %44 = getelementptr inbounds i8, i8* %20, i64 1024
  %45 = getelementptr inbounds i8, i8* %9, i64 104
  %46 = bitcast i8* %45 to i8**
  store i8* %44, i8** %46, align 8
  %47 = getelementptr inbounds i8, i8* %20, i64 1152
  %48 = getelementptr inbounds i8, i8* %9, i64 112
  %49 = bitcast i8* %48 to i8**
  store i8* %47, i8** %49, align 8
  ret void
}

declare void @jinit_marker_writer(%struct.jpeg_compress_struct*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_coef(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %4 = bitcast %struct.jpeg_c_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = icmp eq i32 %1, 2
  br i1 %6, label %15, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 4, i32* %10, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %12 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %11, align 8
  %13 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %12, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %13(%struct.jpeg_common_struct* %14) #4
  br label %15

; <label>:15:                                     ; preds = %2, %7
  %16 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 1
  store i32 0, i32* %16, align 8
  tail call void @start_iMCU_row(%struct.jpeg_compress_struct* nonnull %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @compress_output(%struct.jpeg_compress_struct*, i8*** nocapture readnone) #0 {
  %3 = alloca [4 x [64 x i16]**], align 16
  %4 = alloca [10 x [64 x i16]*], align 16
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %6 = bitcast %struct.jpeg_c_coef_controller** %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  %9 = load i32, i32* %8, align 8
  %10 = add i32 %9, -1
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  %12 = load i32, i32* %11, align 8
  %13 = add i32 %12, -1
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %15 = load i32, i32* %14, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %.lr.ph100, label %._crit_edge101

.lr.ph100:                                        ; preds = %2
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %.cast7 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %18 = inttoptr i64 %7 to %struct.my_coef_controller*
  %19 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %18, i64 0, i32 5
  %20 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %18, i64 0, i32 1
  br label %21

; <label>:21:                                     ; preds = %.lr.ph100, %21
  %indvars.iv118 = phi i64 [ 0, %.lr.ph100 ], [ %indvars.iv.next119, %21 ]
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv118
  %23 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %22, align 8
  %24 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %17, align 8
  %25 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %24, i64 0, i32 8
  %26 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %25, align 8
  %27 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %19, align 8
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %23, i64 0, i32 1
  %29 = load i32, i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %27, i64 %30
  %32 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %31, align 8
  %33 = load i32, i32* %20, align 8
  %34 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %23, i64 0, i32 3
  %35 = load i32, i32* %34, align 4
  %36 = mul i32 %35, %33
  %37 = tail call [64 x i16]** %26(%struct.jpeg_common_struct* %.cast7, %struct.jvirt_barray_control* %32, i32 %36, i32 %35, i32 0) #4
  %38 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %3, i64 0, i64 %indvars.iv118
  store [64 x i16]** %37, [64 x i16]*** %38, align 8
  %indvars.iv.next119 = add nuw i64 %indvars.iv118, 1
  %39 = load i32, i32* %14, align 4
  %40 = sext i32 %39 to i64
  %41 = icmp slt i64 %indvars.iv.next119, %40
  br i1 %41, label %21, label %._crit_edge101.loopexit

._crit_edge101.loopexit:                          ; preds = %21
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %2
  %42 = inttoptr i64 %7 to %struct.my_coef_controller*
  %43 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %42, i64 0, i32 3
  %44 = load i32, i32* %43, align 8
  %45 = inttoptr i64 %7 to %struct.my_coef_controller*
  %46 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %45, i64 0, i32 4
  %47 = load i32, i32* %46, align 4
  %48 = icmp slt i32 %44, %47
  br i1 %48, label %.lr.ph96, label %._crit_edge97

.lr.ph96:                                         ; preds = %._crit_edge101
  %49 = inttoptr i64 %7 to %struct.my_coef_controller*
  %50 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %49, i64 0, i32 2
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr58 = add i64 %sunkaddr, 352
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i32*
  %sunkaddr67 = add i64 %7, 20
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to i32*
  %sunkaddr60 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr61 = add i64 %sunkaddr60, 316
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to i32*
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %52 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 0
  %53 = inttoptr i64 %7 to %struct.my_coef_controller*
  %54 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %53, i64 0, i32 1
  %55 = inttoptr i64 %7 to %struct.my_coef_controller*
  %56 = sext i32 %44 to i64
  br label %57

; <label>:57:                                     ; preds = %.lr.ph96, %._crit_edge92
  %indvars.iv116 = phi i64 [ %56, %.lr.ph96 ], [ %indvars.iv.next117, %._crit_edge92 ]
  %58 = load i32, i32* %50, align 4
  %59 = load i32, i32* %sunkaddr59, align 8
  %60 = icmp ult i32 %58, %59
  br i1 %60, label %.preheader69.preheader, label %._crit_edge92

.preheader69.preheader:                           ; preds = %57
  br label %.preheader69

.preheader69:                                     ; preds = %.preheader69.preheader, %176
  %indvars.iv128 = phi i32 [ %indvars.iv.next129, %176 ], [ %58, %.preheader69.preheader ]
  %61 = load i32, i32* %sunkaddr62, align 4
  %62 = icmp sgt i32 %61, 0
  br i1 %62, label %.lr.ph89, label %._crit_edge90

.lr.ph89:                                         ; preds = %.preheader69
  %63 = icmp ult i32 %indvars.iv128, %10
  br label %64

; <label>:64:                                     ; preds = %.lr.ph89, %._crit_edge85
  %indvars.iv114 = phi i64 [ 0, %.lr.ph89 ], [ %indvars.iv.next115, %._crit_edge85 ]
  %.05687 = phi i32 [ 0, %.lr.ph89 ], [ %.1.lcssa, %._crit_edge85 ]
  %65 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv114
  %66 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %65, align 8
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i64 0, i32 13
  %68 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i64 0, i32 17
  %.in = select i1 %63, i32* %67, i32* %68
  %69 = load i32, i32* %.in, align 4
  %70 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i64 0, i32 14
  %71 = load i32, i32* %70, align 8
  %72 = icmp sgt i32 %71, 0
  br i1 %72, label %.lr.ph84, label %._crit_edge85

.lr.ph84:                                         ; preds = %64
  %73 = load i32, i32* %67, align 4
  %74 = mul i32 %73, %indvars.iv128
  %75 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %3, i64 0, i64 %indvars.iv114
  %76 = zext i32 %74 to i64
  %77 = icmp sgt i32 %69, 0
  %78 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i64 0, i32 18
  br i1 %77, label %.lr.ph84.split.us.preheader, label %.lr.ph84.split.preheader

.lr.ph84.split.preheader:                         ; preds = %.lr.ph84
  br label %.lr.ph84.split

.lr.ph84.split.us.preheader:                      ; preds = %.lr.ph84
  %79 = add i32 %69, -1
  %xtraiter = and i32 %69, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %80 = icmp ult i32 %79, 7
  %81 = mul i32 %indvars.iv128, %73
  %82 = zext i32 %81 to i64
  %83 = add nsw i32 %xtraiter, -1
  %84 = zext i32 %83 to i64
  %85 = add nuw nsw i64 %82, %84
  %86 = shl nuw nsw i64 %85, 6
  %87 = add nuw nsw i64 %84, 1
  br label %.lr.ph84.split.us

.lr.ph84.split.us:                                ; preds = %.lr.ph84.split.us.preheader, %._crit_edge.us
  %indvars.iv112 = phi i64 [ 0, %.lr.ph84.split.us.preheader ], [ %indvars.iv.next113, %._crit_edge.us ]
  %.180.us = phi i32 [ %.05687, %.lr.ph84.split.us.preheader ], [ %.3.lcssa.us, %._crit_edge.us ]
  %88 = load i32, i32* %54, align 8
  %89 = icmp ult i32 %88, %13
  br i1 %89, label %.lr.ph.us, label %90

; <label>:90:                                     ; preds = %.lr.ph84.split.us
  %91 = add nsw i64 %indvars.iv112, %indvars.iv116
  %92 = load i32, i32* %78, align 8
  %93 = sext i32 %92 to i64
  %94 = icmp slt i64 %91, %93
  br i1 %94, label %.lr.ph.us, label %.preheader.us

.lr.ph.us:                                        ; preds = %90, %.lr.ph84.split.us
  %95 = load [64 x i16]**, [64 x i16]*** %75, align 8
  %96 = add nsw i64 %indvars.iv112, %indvars.iv116
  %97 = getelementptr inbounds [64 x i16]*, [64 x i16]** %95, i64 %96
  %98 = load [64 x i16]*, [64 x i16]** %97, align 8
  %99 = getelementptr inbounds [64 x i16], [64 x i16]* %98, i64 %76
  %100 = sext i32 %.180.us to i64
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  %scevgep130 = getelementptr [64 x i16], [64 x i16]* %98, i64 1, i64 %86
  %scevgep130131 = bitcast i16* %scevgep130 to [64 x i16]*
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv108.prol = phi i64 [ %indvars.iv.next109.prol, %.prol.preheader ], [ %100, %.prol.preheader.preheader ]
  %.073.us.prol = phi [64 x i16]* [ %101, %.prol.preheader ], [ %99, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %101 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us.prol, i64 1
  %indvars.iv.next109.prol = add nsw i64 %indvars.iv108.prol, 1
  %102 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv108.prol
  store [64 x i16]* %.073.us.prol, [64 x i16]** %102, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %103 = add nsw i64 %87, %100
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv108.unr = phi i64 [ %100, %.lr.ph.us ], [ %103, %.prol.loopexit.loopexit ]
  %storemerge674.us.unr = phi i32 [ 0, %.lr.ph.us ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.073.us.unr = phi [64 x i16]* [ %99, %.lr.ph.us ], [ %scevgep130131, %.prol.loopexit.loopexit ]
  br i1 %80, label %.preheader.us.loopexit, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph78.us
  %104 = trunc i64 %indvars.iv.next111 to i32
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %.3.lcssa.us = phi i32 [ %.3.ph.us, %.preheader.us ], [ %104, %._crit_edge.us.loopexit ]
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %105 = load i32, i32* %70, align 8
  %106 = sext i32 %105 to i64
  %107 = icmp slt i64 %indvars.iv.next113, %106
  br i1 %107, label %.lr.ph84.split.us, label %._crit_edge85.loopexit

.lr.ph78.us:                                      ; preds = %.lr.ph78.us.preheader, %.lr.ph78.us
  %indvars.iv110 = phi i64 [ %143, %.lr.ph78.us.preheader ], [ %indvars.iv.next111, %.lr.ph78.us ]
  %.05776.us = phi i32 [ %.057.ph.us, %.lr.ph78.us.preheader ], [ %120, %.lr.ph78.us ]
  %108 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %55, i64 0, i32 6, i64 %indvars.iv110
  %109 = bitcast [64 x i16]** %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv110
  %112 = bitcast [64 x i16]** %111 to i64*
  store i64 %110, i64* %112, align 8
  %113 = add nsw i64 %indvars.iv110, -1
  %114 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %113
  %115 = bitcast [64 x i16]** %114 to i16**
  %116 = load i16*, i16** %115, align 8
  %117 = load i16, i16* %116, align 2
  %118 = bitcast [64 x i16]** %111 to i16**
  %119 = load i16*, i16** %118, align 8
  store i16 %117, i16* %119, align 2
  %indvars.iv.next111 = add i64 %indvars.iv110, 1
  %120 = add nsw i32 %.05776.us, 1
  %121 = load i32, i32* %67, align 4
  %122 = icmp slt i32 %120, %121
  br i1 %122, label %.lr.ph78.us, label %._crit_edge.us.loopexit

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv108 = phi i64 [ %indvars.iv.next109.7, %.lr.ph.us.new ], [ %indvars.iv108.unr, %.lr.ph.us.new.preheader ]
  %storemerge674.us = phi i32 [ %139, %.lr.ph.us.new ], [ %storemerge674.us.unr, %.lr.ph.us.new.preheader ]
  %.073.us = phi [64 x i16]* [ %137, %.lr.ph.us.new ], [ %.073.us.unr, %.lr.ph.us.new.preheader ]
  %123 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us, i64 1
  %indvars.iv.next109 = add nsw i64 %indvars.iv108, 1
  %124 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv108
  store [64 x i16]* %.073.us, [64 x i16]** %124, align 8
  %125 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us, i64 2
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  %126 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next109
  store [64 x i16]* %123, [64 x i16]** %126, align 8
  %127 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us, i64 3
  %indvars.iv.next109.2 = add nsw i64 %indvars.iv108, 3
  %128 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next109.1
  store [64 x i16]* %125, [64 x i16]** %128, align 8
  %129 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us, i64 4
  %indvars.iv.next109.3 = add nsw i64 %indvars.iv108, 4
  %130 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next109.2
  store [64 x i16]* %127, [64 x i16]** %130, align 8
  %131 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us, i64 5
  %indvars.iv.next109.4 = add nsw i64 %indvars.iv108, 5
  %132 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next109.3
  store [64 x i16]* %129, [64 x i16]** %132, align 8
  %133 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us, i64 6
  %indvars.iv.next109.5 = add nsw i64 %indvars.iv108, 6
  %134 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next109.4
  store [64 x i16]* %131, [64 x i16]** %134, align 8
  %135 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us, i64 7
  %indvars.iv.next109.6 = add nsw i64 %indvars.iv108, 7
  %136 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next109.5
  store [64 x i16]* %133, [64 x i16]** %136, align 8
  %137 = getelementptr inbounds [64 x i16], [64 x i16]* %.073.us, i64 8
  %indvars.iv.next109.7 = add nsw i64 %indvars.iv108, 8
  %138 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next109.6
  store [64 x i16]* %135, [64 x i16]** %138, align 8
  %139 = add nuw nsw i32 %storemerge674.us, 8
  %exitcond.7 = icmp eq i32 %139, %69
  br i1 %exitcond.7, label %.preheader.us.loopexit.loopexit, label %.lr.ph.us.new

.preheader.us.loopexit.loopexit:                  ; preds = %.lr.ph.us.new
  br label %.preheader.us.loopexit

.preheader.us.loopexit:                           ; preds = %.preheader.us.loopexit.loopexit, %.prol.loopexit
  %140 = add i32 %69, %.180.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %90
  %.057.ph.us = phi i32 [ 0, %90 ], [ %69, %.preheader.us.loopexit ]
  %.3.ph.us = phi i32 [ %.180.us, %90 ], [ %140, %.preheader.us.loopexit ]
  %141 = load i32, i32* %67, align 4
  %142 = icmp slt i32 %.057.ph.us, %141
  br i1 %142, label %.lr.ph78.us.preheader, label %._crit_edge.us

.lr.ph78.us.preheader:                            ; preds = %.preheader.us
  %143 = sext i32 %.3.ph.us to i64
  br label %.lr.ph78.us

.lr.ph84.split:                                   ; preds = %.lr.ph84.split.preheader, %._crit_edge
  %storemerge581 = phi i32 [ %163, %._crit_edge ], [ 0, %.lr.ph84.split.preheader ]
  %.180 = phi i32 [ %.3.lcssa, %._crit_edge ], [ %.05687, %.lr.ph84.split.preheader ]
  %144 = load i32, i32* %67, align 4
  %145 = icmp sgt i32 %144, 0
  br i1 %145, label %.lr.ph78.preheader, label %._crit_edge

.lr.ph78.preheader:                               ; preds = %.lr.ph84.split
  %146 = sext i32 %.180 to i64
  br label %.lr.ph78

.lr.ph78:                                         ; preds = %.lr.ph78.preheader, %.lr.ph78
  %indvars.iv = phi i64 [ %146, %.lr.ph78.preheader ], [ %indvars.iv.next, %.lr.ph78 ]
  %.05776 = phi i32 [ 0, %.lr.ph78.preheader ], [ %159, %.lr.ph78 ]
  %147 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %55, i64 0, i32 6, i64 %indvars.iv
  %148 = bitcast [64 x i16]** %147 to i64*
  %149 = load i64, i64* %148, align 8
  %150 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv
  %151 = bitcast [64 x i16]** %150 to i64*
  store i64 %149, i64* %151, align 8
  %152 = add nsw i64 %indvars.iv, -1
  %153 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %152
  %154 = bitcast [64 x i16]** %153 to i16**
  %155 = load i16*, i16** %154, align 8
  %156 = load i16, i16* %155, align 2
  %157 = bitcast [64 x i16]** %150 to i16**
  %158 = load i16*, i16** %157, align 8
  store i16 %156, i16* %158, align 2
  %indvars.iv.next = add i64 %indvars.iv, 1
  %159 = add nuw nsw i32 %.05776, 1
  %160 = load i32, i32* %67, align 4
  %161 = icmp slt i32 %159, %160
  br i1 %161, label %.lr.ph78, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph78
  %162 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph84.split
  %.3.lcssa = phi i32 [ %.180, %.lr.ph84.split ], [ %162, %._crit_edge.loopexit ]
  %163 = add nuw nsw i32 %storemerge581, 1
  %164 = load i32, i32* %70, align 8
  %165 = icmp slt i32 %163, %164
  br i1 %165, label %.lr.ph84.split, label %._crit_edge85.loopexit132

._crit_edge85.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge85

._crit_edge85.loopexit132:                        ; preds = %._crit_edge
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85.loopexit132, %._crit_edge85.loopexit, %64
  %.1.lcssa = phi i32 [ %.05687, %64 ], [ %.3.lcssa.us, %._crit_edge85.loopexit ], [ %.3.lcssa, %._crit_edge85.loopexit132 ]
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %166 = load i32, i32* %sunkaddr62, align 4
  %167 = sext i32 %166 to i64
  %168 = icmp slt i64 %indvars.iv.next115, %167
  br i1 %168, label %64, label %._crit_edge90.loopexit

._crit_edge90.loopexit:                           ; preds = %._crit_edge85
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90.loopexit, %.preheader69
  %169 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %51, align 8
  %170 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %169, i64 0, i32 1
  %171 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %170, align 8
  %172 = call i32 %171(%struct.jpeg_compress_struct* nonnull %0, [64 x i16]** nonnull %52) #4
  %173 = icmp eq i32 %172, 0
  br i1 %173, label %174, label %176

; <label>:174:                                    ; preds = %._crit_edge90
  %175 = trunc i64 %indvars.iv116 to i32
  %sunkaddr63 = add i64 %7, 24
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i32*
  store i32 %175, i32* %sunkaddr64, align 8
  %sunkaddr65 = add i64 %7, 20
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i32*
  store i32 %indvars.iv128, i32* %sunkaddr66, align 4
  br label %186

; <label>:176:                                    ; preds = %._crit_edge90
  %indvars.iv.next129 = add i32 %indvars.iv128, 1
  %177 = load i32, i32* %sunkaddr59, align 8
  %178 = icmp ult i32 %indvars.iv.next129, %177
  br i1 %178, label %.preheader69, label %._crit_edge92.loopexit

._crit_edge92.loopexit:                           ; preds = %176
  br label %._crit_edge92

._crit_edge92:                                    ; preds = %._crit_edge92.loopexit, %57
  store i32 0, i32* %sunkaddr68, align 4
  %indvars.iv.next117 = add i64 %indvars.iv116, 1
  %179 = load i32, i32* %46, align 4
  %180 = sext i32 %179 to i64
  %181 = icmp slt i64 %indvars.iv.next117, %180
  br i1 %181, label %57, label %._crit_edge97.loopexit

._crit_edge97.loopexit:                           ; preds = %._crit_edge92
  br label %._crit_edge97

._crit_edge97:                                    ; preds = %._crit_edge97.loopexit, %._crit_edge101
  %182 = inttoptr i64 %7 to %struct.my_coef_controller*
  %183 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %182, i64 0, i32 1
  %184 = load i32, i32* %183, align 8
  %185 = add i32 %184, 1
  store i32 %185, i32* %183, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %0)
  br label %186

; <label>:186:                                    ; preds = %._crit_edge97, %174
  %storemerge2 = phi i32 [ 1, %._crit_edge97 ], [ 0, %174 ]
  ret i32 %storemerge2
}

declare void @jzero_far(i8*, i64) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @start_iMCU_row(%struct.jpeg_compress_struct*) #3 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %3 = bitcast %struct.jpeg_c_coef_controller** %2 to %struct.my_coef_controller**
  %4 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %6 = load i32, i32* %5, align 4
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %23, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  %12 = load i32, i32* %11, align 8
  %13 = add i32 %12, -1
  %14 = icmp ult i32 %10, %13
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 0
  %16 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %15, align 8
  br i1 %14, label %17, label %20

; <label>:17:                                     ; preds = %8
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %16, i64 0, i32 3
  %19 = load i32, i32* %18, align 4
  br label %23

; <label>:20:                                     ; preds = %8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %16, i64 0, i32 18
  %22 = load i32, i32* %21, align 8
  br label %23

; <label>:23:                                     ; preds = %17, %20, %1
  %.sink.sink = phi i32 [ 1, %1 ], [ %22, %20 ], [ %19, %17 ]
  %24 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 4
  store i32 %.sink.sink, i32* %24, align 4
  %25 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 2
  store i32 0, i32* %25, align 4
  %26 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 3
  store i32 0, i32* %26, align 8
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
