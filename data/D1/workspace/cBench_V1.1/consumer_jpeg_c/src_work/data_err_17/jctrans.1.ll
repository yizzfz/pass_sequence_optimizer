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
define void @jpeg_write_coefficients(%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**) local_unnamed_addr #0 {
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
  %sunkaddr1 = add i64 %sunkaddr, 28
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %10 = load i32, i32* %sunkaddr2, align 4
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
  tail call fastcc void @transencode_master_selection(%struct.jpeg_compress_struct* nonnull %0, %struct.jvirt_barray_control** %1)
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 36
  store i32 0, i32* %27, align 8
  %sunkaddr3 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 28
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  store i32 103, i32* %sunkaddr5, align 4
  ret void
}

declare void @jpeg_suppress_tables(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @transencode_master_selection(%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**) unnamed_addr #0 {
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
  tail call fastcc void @transencode_coef_controller(%struct.jpeg_compress_struct* nonnull %0, %struct.jvirt_barray_control** %1)
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
define void @jpeg_copy_critical_parameters(%struct.jpeg_decompress_struct* nocapture readonly, %struct.jpeg_compress_struct*) local_unnamed_addr #0 {
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
  %sunkaddr6 = add i64 %sunkaddr, 28
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i32*
  %10 = load i32, i32* %sunkaddr7, align 4
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
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 0
  %38 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %37, align 8
  %39 = icmp eq %struct.JQUANT_TBL* %38, null
  br i1 %39, label %56, label %40

; <label>:40:                                     ; preds = %17
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 15, i64 0
  %42 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %41, align 8
  %43 = icmp eq %struct.JQUANT_TBL* %42, null
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %40
  %45 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %46 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %47 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %46) #4
  %sunkaddr11 = add i64 %45, 88
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %47, %struct.JQUANT_TBL** %sunkaddr12, align 8
  br label %48

; <label>:48:                                     ; preds = %44, %40
  %49 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %50 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %51 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr16 = add i64 %51, 88
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i8**
  %52 = load i8*, i8** %sunkaddr17, align 8
  %sunkaddr21 = add i64 %50, 192
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i8**
  %53 = load i8*, i8** %sunkaddr22, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %52, i8* %53, i64 128, i32 4, i1 false)
  %sunkaddr26 = add i64 %49, 88
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to %struct.JQUANT_TBL**
  %54 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr27, align 8
  %55 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %54, i64 0, i32 1
  store i32 0, i32* %55, align 4
  br label %56

; <label>:56:                                     ; preds = %48, %17
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 1
  %58 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %57, align 8
  %59 = icmp eq %struct.JQUANT_TBL* %58, null
  br i1 %59, label %153, label %137

; <label>:60:                                     ; preds = %193
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 0
  %62 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %62, i64 0, i32 5
  store i32 24, i32* %63, align 8
  %sunkaddr31 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 68
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  %64 = load i32, i32* %sunkaddr33, align 4
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i64 0, i32 6, i32 0, i64 0
  store i32 %64, i32* %66, align 4
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i64 0, i32 6, i32 0, i64 1
  store i32 10, i32* %68, align 4
  %69 = bitcast %struct.jpeg_compress_struct* %1 to void (%struct.jpeg_common_struct*)***
  %70 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %69, align 8
  %71 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %70, align 8
  %72 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  tail call void %71(%struct.jpeg_common_struct* %72) #4
  br label %73

; <label>:73:                                     ; preds = %193, %60
  %sunkaddr34 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 68
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i32*
  %74 = load i32, i32* %sunkaddr36, align 4
  %75 = icmp sgt i32 %74, 0
  br i1 %75, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %73
  %76 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 14
  %77 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %76, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %79 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %78, align 8
  %80 = bitcast %struct.jpeg_compress_struct* %1 to void (%struct.jpeg_common_struct*)***
  %81 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 0
  %sunkaddr45 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 68
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to i32*
  %83 = bitcast %struct.jpeg_compress_struct* %1 to void (%struct.jpeg_common_struct*)***
  %84 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 0
  br label %86

; <label>:86:                                     ; preds = %.lr.ph, %.loopexit
  %.0140 = phi i32 [ 0, %.lr.ph ], [ %132, %.loopexit ]
  %.0339 = phi %struct.jpeg_component_info* [ %79, %.lr.ph ], [ %133, %.loopexit ]
  %.0438 = phi %struct.jpeg_component_info* [ %77, %.lr.ph ], [ %134, %.loopexit ]
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0339, i64 0, i32 0
  %88 = load i32, i32* %87, align 8
  %89 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0438, i64 0, i32 0
  store i32 %88, i32* %89, align 8
  %90 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0339, i64 0, i32 2
  %91 = load i32, i32* %90, align 8
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0438, i64 0, i32 2
  store i32 %91, i32* %92, align 8
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0339, i64 0, i32 3
  %94 = load i32, i32* %93, align 4
  %95 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0438, i64 0, i32 3
  store i32 %94, i32* %95, align 4
  %96 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0339, i64 0, i32 4
  %97 = load i32, i32* %96, align 8
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0438, i64 0, i32 4
  store i32 %97, i32* %99, align 8
  %100 = icmp ugt i32 %97, 3
  br i1 %100, label %106, label %101

; <label>:101:                                    ; preds = %86
  %102 = sext i32 %97 to i64
  %103 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 %102
  %104 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %103, align 8
  %105 = icmp eq %struct.JQUANT_TBL* %104, null
  br i1 %105, label %106, label %113

; <label>:106:                                    ; preds = %101, %86
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %82, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i64 0, i32 5
  store i32 51, i32* %108, align 8
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %82, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i64 0, i32 6, i32 0, i64 0
  store i32 %97, i32* %110, align 4
  %111 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %80, align 8
  %112 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %111, align 8
  tail call void %112(%struct.jpeg_common_struct* %81) #4
  br label %113

; <label>:113:                                    ; preds = %106, %101
  %114 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 %98
  %115 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %114, align 8
  %116 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0339, i64 0, i32 19
  %117 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %116, align 8
  %118 = icmp eq %struct.JQUANT_TBL* %117, null
  br i1 %118, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %113
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %131
  %indvars.iv = phi i64 [ %indvars.iv.next, %131 ], [ 0, %.preheader.preheader ]
  %119 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %117, i64 0, i32 0, i64 %indvars.iv
  %120 = load i16, i16* %119, align 2
  %121 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %115, i64 0, i32 0, i64 %indvars.iv
  %122 = load i16, i16* %121, align 2
  %123 = icmp eq i16 %120, %122
  br i1 %123, label %131, label %124

; <label>:124:                                    ; preds = %.preheader
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %85, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 5
  store i32 43, i32* %126, align 8
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %85, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i64 0, i32 6, i32 0, i64 0
  store i32 %97, i32* %128, align 4
  %129 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %83, align 8
  %130 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %129, align 8
  tail call void %130(%struct.jpeg_common_struct* %84) #4
  br label %131

; <label>:131:                                    ; preds = %124, %.preheader
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond, label %.loopexit.loopexit, label %.preheader

.loopexit.loopexit:                               ; preds = %131
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %113
  %132 = add nuw nsw i32 %.0140, 1
  %133 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0339, i64 1
  %134 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0438, i64 1
  %135 = load i32, i32* %sunkaddr47, align 4
  %136 = icmp slt i32 %132, %135
  br i1 %136, label %86, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %73
  ret void

; <label>:137:                                    ; preds = %56
  %138 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 15, i64 1
  %139 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %138, align 8
  %140 = icmp eq %struct.JQUANT_TBL* %139, null
  br i1 %140, label %141, label %145

; <label>:141:                                    ; preds = %137
  %142 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %143 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %144 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %143) #4
  %sunkaddr11.1 = add i64 %142, 96
  %sunkaddr12.1 = inttoptr i64 %sunkaddr11.1 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %144, %struct.JQUANT_TBL** %sunkaddr12.1, align 8
  br label %145

; <label>:145:                                    ; preds = %141, %137
  %146 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %147 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %148 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr16.1 = add i64 %148, 96
  %sunkaddr17.1 = inttoptr i64 %sunkaddr16.1 to i8**
  %149 = load i8*, i8** %sunkaddr17.1, align 8
  %sunkaddr21.1 = add i64 %147, 200
  %sunkaddr22.1 = inttoptr i64 %sunkaddr21.1 to i8**
  %150 = load i8*, i8** %sunkaddr22.1, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %149, i8* %150, i64 128, i32 4, i1 false)
  %sunkaddr26.1 = add i64 %146, 96
  %sunkaddr27.1 = inttoptr i64 %sunkaddr26.1 to %struct.JQUANT_TBL**
  %151 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr27.1, align 8
  %152 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %151, i64 0, i32 1
  store i32 0, i32* %152, align 4
  br label %153

; <label>:153:                                    ; preds = %145, %56
  %154 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 2
  %155 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %154, align 8
  %156 = icmp eq %struct.JQUANT_TBL* %155, null
  br i1 %156, label %173, label %157

; <label>:157:                                    ; preds = %153
  %158 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 15, i64 2
  %159 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %158, align 8
  %160 = icmp eq %struct.JQUANT_TBL* %159, null
  br i1 %160, label %161, label %165

; <label>:161:                                    ; preds = %157
  %162 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %163 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %164 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %163) #4
  %sunkaddr11.2 = add i64 %162, 104
  %sunkaddr12.2 = inttoptr i64 %sunkaddr11.2 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %164, %struct.JQUANT_TBL** %sunkaddr12.2, align 8
  br label %165

; <label>:165:                                    ; preds = %161, %157
  %166 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %167 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %168 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr16.2 = add i64 %168, 104
  %sunkaddr17.2 = inttoptr i64 %sunkaddr16.2 to i8**
  %169 = load i8*, i8** %sunkaddr17.2, align 8
  %sunkaddr21.2 = add i64 %167, 208
  %sunkaddr22.2 = inttoptr i64 %sunkaddr21.2 to i8**
  %170 = load i8*, i8** %sunkaddr22.2, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %169, i8* %170, i64 128, i32 4, i1 false)
  %sunkaddr26.2 = add i64 %166, 104
  %sunkaddr27.2 = inttoptr i64 %sunkaddr26.2 to %struct.JQUANT_TBL**
  %171 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr27.2, align 8
  %172 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %171, i64 0, i32 1
  store i32 0, i32* %172, align 4
  br label %173

; <label>:173:                                    ; preds = %165, %153
  %174 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 3
  %175 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %174, align 8
  %176 = icmp eq %struct.JQUANT_TBL* %175, null
  br i1 %176, label %193, label %177

; <label>:177:                                    ; preds = %173
  %178 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 15, i64 3
  %179 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %178, align 8
  %180 = icmp eq %struct.JQUANT_TBL* %179, null
  br i1 %180, label %181, label %185

; <label>:181:                                    ; preds = %177
  %182 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %183 = bitcast %struct.jpeg_compress_struct* %1 to %struct.jpeg_common_struct*
  %184 = tail call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* nonnull %183) #4
  %sunkaddr11.3 = add i64 %182, 112
  %sunkaddr12.3 = inttoptr i64 %sunkaddr11.3 to %struct.JQUANT_TBL**
  store %struct.JQUANT_TBL* %184, %struct.JQUANT_TBL** %sunkaddr12.3, align 8
  br label %185

; <label>:185:                                    ; preds = %181, %177
  %186 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %187 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %188 = ptrtoint %struct.jpeg_compress_struct* %1 to i64
  %sunkaddr16.3 = add i64 %188, 112
  %sunkaddr17.3 = inttoptr i64 %sunkaddr16.3 to i8**
  %189 = load i8*, i8** %sunkaddr17.3, align 8
  %sunkaddr21.3 = add i64 %187, 216
  %sunkaddr22.3 = inttoptr i64 %sunkaddr21.3 to i8**
  %190 = load i8*, i8** %sunkaddr22.3, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %189, i8* %190, i64 128, i32 4, i1 false)
  %sunkaddr26.3 = add i64 %186, 112
  %sunkaddr27.3 = inttoptr i64 %sunkaddr26.3 to %struct.JQUANT_TBL**
  %191 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %sunkaddr27.3, align 8
  %192 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %191, i64 0, i32 1
  store i32 0, i32* %192, align 4
  br label %193

; <label>:193:                                    ; preds = %185, %173
  %sunkaddr28 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 48
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  %194 = load i32, i32* %sunkaddr30, align 8
  %195 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %1, i64 0, i32 12
  store i32 %194, i32* %195, align 4
  %.off = add i32 %194, -1
  %196 = icmp ugt i32 %.off, 9
  br i1 %196, label %60, label %73
}

declare void @jpeg_set_defaults(%struct.jpeg_compress_struct*) local_unnamed_addr #1

declare void @jpeg_set_colorspace(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #1

declare %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

declare void @jinit_c_master_control(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #1

declare void @jinit_phuff_encoder(%struct.jpeg_compress_struct*) local_unnamed_addr #1

declare void @jinit_huff_encoder(%struct.jpeg_compress_struct*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @transencode_coef_controller(%struct.jpeg_compress_struct*, %struct.jvirt_barray_control**) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 120) #4
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %10 = bitcast %struct.jpeg_c_coef_controller** %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef, void (%struct.jpeg_compress_struct*, i32)** %11, align 8
  %12 = getelementptr inbounds i8, i8* %8, i64 8
  %13 = bitcast i8* %12 to i32 (%struct.jpeg_compress_struct*, i8***)**
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_output, i32 (%struct.jpeg_compress_struct*, i8***)** %13, align 8
  %14 = getelementptr inbounds i8, i8* %8, i64 32
  %15 = bitcast i8* %14 to %struct.jvirt_barray_control***
  store %struct.jvirt_barray_control** %1, %struct.jvirt_barray_control*** %15, align 8
  %16 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %16, i64 0, i32 1
  %18 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %17, align 8
  %19 = tail call i8* %18(%struct.jpeg_common_struct* %7, i32 1, i64 1280) #4
  tail call void @jzero_far(i8* %19, i64 1280) #4
  %20 = getelementptr inbounds i8, i8* %8, i64 40
  %21 = bitcast i8* %20 to i8**
  store i8* %19, i8** %21, align 8
  %22 = getelementptr inbounds i8, i8* %19, i64 128
  %23 = getelementptr inbounds i8, i8* %8, i64 48
  %24 = bitcast i8* %23 to i8**
  store i8* %22, i8** %24, align 8
  %25 = getelementptr inbounds i8, i8* %19, i64 256
  %26 = getelementptr inbounds i8, i8* %8, i64 56
  %27 = bitcast i8* %26 to i8**
  store i8* %25, i8** %27, align 8
  %28 = getelementptr inbounds i8, i8* %19, i64 384
  %29 = getelementptr inbounds i8, i8* %8, i64 64
  %30 = bitcast i8* %29 to i8**
  store i8* %28, i8** %30, align 8
  %31 = getelementptr inbounds i8, i8* %19, i64 512
  %32 = getelementptr inbounds i8, i8* %8, i64 72
  %33 = bitcast i8* %32 to i8**
  store i8* %31, i8** %33, align 8
  %34 = getelementptr inbounds i8, i8* %19, i64 640
  %35 = getelementptr inbounds i8, i8* %8, i64 80
  %36 = bitcast i8* %35 to i8**
  store i8* %34, i8** %36, align 8
  %37 = getelementptr inbounds i8, i8* %19, i64 768
  %38 = getelementptr inbounds i8, i8* %8, i64 88
  %39 = bitcast i8* %38 to i8**
  store i8* %37, i8** %39, align 8
  %40 = getelementptr inbounds i8, i8* %19, i64 896
  %41 = getelementptr inbounds i8, i8* %8, i64 96
  %42 = bitcast i8* %41 to i8**
  store i8* %40, i8** %42, align 8
  %43 = getelementptr inbounds i8, i8* %19, i64 1024
  %44 = getelementptr inbounds i8, i8* %8, i64 104
  %45 = bitcast i8* %44 to i8**
  store i8* %43, i8** %45, align 8
  %46 = getelementptr inbounds i8, i8* %19, i64 1152
  %47 = getelementptr inbounds i8, i8* %8, i64 112
  %48 = bitcast i8* %47 to i8**
  store i8* %46, i8** %48, align 8
  ret void
}

declare void @jinit_marker_writer(%struct.jpeg_compress_struct*) local_unnamed_addr #1

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
  tail call fastcc void @start_iMCU_row(%struct.jpeg_compress_struct* nonnull %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @compress_output(%struct.jpeg_compress_struct*, i8*** nocapture readnone) #0 {
  %3 = alloca [4 x [64 x i16]**], align 16
  %4 = alloca [10 x [64 x i16]*], align 16
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %6 = bitcast %struct.jpeg_c_coef_controller** %5 to %struct.my_coef_controller**
  %7 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  %9 = load i32, i32* %8, align 8
  %10 = add i32 %9, -1
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  %12 = load i32, i32* %11, align 8
  %13 = add i32 %12, -1
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %15 = load i32, i32* %14, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %.lr.ph56.preheader, label %._crit_edge57

.lr.ph56.preheader:                               ; preds = %2
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr80 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr81 = add i64 %sunkaddr80, 8
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to %struct.jpeg_memory_mgr**
  %sunkaddr83 = ptrtoint %struct.my_coef_controller* %7 to i64
  %sunkaddr84 = add i64 %sunkaddr83, 32
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to %struct.jvirt_barray_control***
  %sunkaddr86 = ptrtoint %struct.my_coef_controller* %7 to i64
  %sunkaddr87 = add i64 %sunkaddr86, 16
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to i32*
  %sunkaddr89 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr90 = add i64 %sunkaddr89, 316
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to i32*
  br label %.lr.ph56

.lr.ph56:                                         ; preds = %.lr.ph56.preheader, %.lr.ph56
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %.lr.ph56 ], [ 0, %.lr.ph56.preheader ]
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv74
  %19 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %20 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr82, align 8
  %21 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %20, i64 0, i32 8
  %22 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %21, align 8
  %23 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %sunkaddr85, align 8
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %19, i64 0, i32 1
  %25 = load i32, i32* %24, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %23, i64 %26
  %28 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %27, align 8
  %29 = load i32, i32* %sunkaddr88, align 8
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %19, i64 0, i32 3
  %31 = load i32, i32* %30, align 4
  %32 = mul i32 %31, %29
  %33 = tail call [64 x i16]** %22(%struct.jpeg_common_struct* %17, %struct.jvirt_barray_control* %28, i32 %32, i32 %31, i32 0) #4
  %34 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %3, i64 0, i64 %indvars.iv74
  store [64 x i16]** %33, [64 x i16]*** %34, align 8
  %indvars.iv.next75 = add nuw i64 %indvars.iv74, 1
  %35 = load i32, i32* %sunkaddr91, align 4
  %36 = sext i32 %35 to i64
  %37 = icmp slt i64 %indvars.iv.next75, %36
  br i1 %37, label %.lr.ph56, label %._crit_edge57.loopexit

._crit_edge57.loopexit:                           ; preds = %.lr.ph56
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57.loopexit, %2
  %38 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %7, i64 0, i32 3
  %39 = load i32, i32* %38, align 8
  %40 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %7, i64 0, i32 4
  %41 = load i32, i32* %40, align 4
  %42 = icmp slt i32 %39, %41
  br i1 %42, label %.lr.ph52.preheader, label %._crit_edge53

.lr.ph52.preheader:                               ; preds = %._crit_edge57
  %43 = sext i32 %39 to i64
  %sunkaddr92 = ptrtoint %struct.my_coef_controller* %7 to i64
  %sunkaddr93 = add i64 %sunkaddr92, 20
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to i32*
  %sunkaddr95 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr96 = add i64 %sunkaddr95, 352
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to i32*
  %sunkaddr = ptrtoint %struct.my_coef_controller* %7 to i64
  %sunkaddr129 = add i64 %sunkaddr, 20
  %sunkaddr130 = inttoptr i64 %sunkaddr129 to i32*
  %sunkaddr131 = ptrtoint %struct.my_coef_controller* %7 to i64
  %sunkaddr132 = add i64 %sunkaddr131, 28
  %sunkaddr133 = inttoptr i64 %sunkaddr132 to i32*
  %sunkaddr98 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr99 = add i64 %sunkaddr98, 316
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to i32*
  %44 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 0
  %sunkaddr123 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr124 = add i64 %sunkaddr123, 488
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to %struct.jpeg_entropy_encoder**
  %sunkaddr126 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr127 = add i64 %sunkaddr126, 352
  %sunkaddr128 = inttoptr i64 %sunkaddr127 to i32*
  %sunkaddr104 = ptrtoint %struct.my_coef_controller* %7 to i64
  %sunkaddr105 = add i64 %sunkaddr104, 16
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to i32*
  %sunkaddr110 = ptrtoint [4 x [64 x i16]**]* %3 to i64
  %sunkaddr120 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 316
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to i32*
  br label %.lr.ph52

.lr.ph52:                                         ; preds = %.lr.ph52.preheader, %._crit_edge48
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge48 ], [ %43, %.lr.ph52.preheader ]
  %45 = load i32, i32* %sunkaddr94, align 4
  %46 = load i32, i32* %sunkaddr97, align 8
  %47 = icmp ult i32 %45, %46
  br i1 %47, label %.preheader25.preheader, label %._crit_edge48

.preheader25.preheader:                           ; preds = %.lr.ph52
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.preheader, %154
  %.0347 = phi i32 [ %155, %154 ], [ %45, %.preheader25.preheader ]
  %48 = load i32, i32* %sunkaddr100, align 4
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %.lr.ph45.preheader, label %._crit_edge46

.lr.ph45.preheader:                               ; preds = %.preheader25
  %50 = icmp ult i32 %.0347, %10
  br label %.lr.ph45

.lr.ph45:                                         ; preds = %.lr.ph45.preheader, %._crit_edge41
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge41 ], [ 0, %.lr.ph45.preheader ]
  %.0644 = phi i32 [ %.17.lcssa, %._crit_edge41 ], [ 0, %.lr.ph45.preheader ]
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv70
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i64 0, i32 13
  %54 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i64 0, i32 17
  %.in = select i1 %50, i32* %53, i32* %54
  %55 = load i32, i32* %.in, align 4
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i64 0, i32 14
  %57 = load i32, i32* %56, align 8
  %58 = icmp sgt i32 %57, 0
  br i1 %58, label %.lr.ph40, label %._crit_edge41

.lr.ph40:                                         ; preds = %.lr.ph45
  %sunkaddr101 = ptrtoint %struct.jpeg_component_info* %52 to i64
  %sunkaddr102 = add i64 %sunkaddr101, 52
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to i32*
  %59 = load i32, i32* %sunkaddr103, align 4
  %60 = mul i32 %59, %.0347
  %61 = zext i32 %60 to i64
  %62 = icmp sgt i32 %55, 0
  br i1 %62, label %.lr.ph40.split.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.lr.ph40
  %sunkaddr117 = ptrtoint %struct.jpeg_component_info* %52 to i64
  %sunkaddr118 = add i64 %sunkaddr117, 56
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to i32*
  br label %.preheader

.lr.ph40.split.us.preheader:                      ; preds = %.lr.ph40
  %63 = add i32 %55, -1
  %xtraiter = and i32 %55, 7
  %64 = icmp eq i32 %xtraiter, 0
  %sunkaddr111 = shl i64 %indvars.iv70, 3
  %sunkaddr112 = add i64 %sunkaddr110, %sunkaddr111
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to [64 x i16]***
  %65 = icmp ult i32 %63, 7
  %sunkaddr114 = ptrtoint %struct.jpeg_component_info* %52 to i64
  %sunkaddr115 = add i64 %sunkaddr114, 56
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to i32*
  %sunkaddr107 = ptrtoint %struct.jpeg_component_info* %52 to i64
  %sunkaddr108 = add i64 %sunkaddr107, 72
  %sunkaddr109 = inttoptr i64 %sunkaddr108 to i32*
  br label %.lr.ph40.split.us

.lr.ph40.split.us:                                ; preds = %.lr.ph40.split.us.preheader, %._crit_edge.us
  %indvars.iv68 = phi i64 [ 0, %.lr.ph40.split.us.preheader ], [ %indvars.iv.next69, %._crit_edge.us ]
  %.1736.us = phi i32 [ %.0644, %.lr.ph40.split.us.preheader ], [ %.4.lcssa.us, %._crit_edge.us ]
  %66 = load i32, i32* %sunkaddr106, align 8
  %67 = icmp ult i32 %66, %13
  br i1 %67, label %.lr.ph.us, label %68

; <label>:68:                                     ; preds = %.lr.ph40.split.us
  %69 = add nsw i64 %indvars.iv68, %indvars.iv72
  %70 = load i32, i32* %sunkaddr109, align 8
  %71 = sext i32 %70 to i64
  %72 = icmp slt i64 %69, %71
  br i1 %72, label %.lr.ph.us, label %.preheader.us

.lr.ph.us:                                        ; preds = %68, %.lr.ph40.split.us
  %73 = load [64 x i16]**, [64 x i16]*** %sunkaddr113, align 8
  %74 = add nsw i64 %indvars.iv68, %indvars.iv72
  %75 = getelementptr inbounds [64 x i16]*, [64 x i16]** %73, i64 %74
  %76 = load [64 x i16]*, [64 x i16]** %75, align 8
  %77 = getelementptr inbounds [64 x i16], [64 x i16]* %76, i64 %61
  %78 = sext i32 %.1736.us to i64
  br i1 %64, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv64.prol = phi i64 [ %indvars.iv.next65.prol, %.prol.preheader ], [ %78, %.prol.preheader.preheader ]
  %.0130.us.prol = phi [64 x i16]* [ %80, %.prol.preheader ], [ %77, %.prol.preheader.preheader ]
  %.0529.us.prol = phi i32 [ %81, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %79 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv64.prol
  store [64 x i16]* %.0130.us.prol, [64 x i16]** %79, align 8
  %indvars.iv.next65.prol = add nsw i64 %indvars.iv64.prol, 1
  %80 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us.prol, i64 1
  %81 = add nuw nsw i32 %.0529.us.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv64.unr = phi i64 [ %78, %.lr.ph.us ], [ %indvars.iv.next65.prol, %.prol.loopexit.loopexit ]
  %.0130.us.unr = phi [64 x i16]* [ %77, %.lr.ph.us ], [ %80, %.prol.loopexit.loopexit ]
  %.0529.us.unr = phi i32 [ 0, %.lr.ph.us ], [ %81, %.prol.loopexit.loopexit ]
  br i1 %65, label %.preheader.us.loopexit, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph34.us
  %82 = trunc i64 %indvars.iv.next67 to i32
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %.4.lcssa.us = phi i32 [ %.4.ph.us, %.preheader.us ], [ %82, %._crit_edge.us.loopexit ]
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %83 = load i32, i32* %sunkaddr116, align 8
  %84 = sext i32 %83 to i64
  %85 = icmp slt i64 %indvars.iv.next69, %84
  br i1 %85, label %.lr.ph40.split.us, label %._crit_edge41.loopexit

.lr.ph34.us:                                      ; preds = %.lr.ph34.us.preheader, %.lr.ph34.us
  %indvars.iv66 = phi i64 [ %121, %.lr.ph34.us.preheader ], [ %indvars.iv.next67, %.lr.ph34.us ]
  %.233.us = phi i32 [ %.2.ph.us, %.lr.ph34.us.preheader ], [ %98, %.lr.ph34.us ]
  %86 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %7, i64 0, i32 6, i64 %indvars.iv66
  %87 = bitcast [64 x i16]** %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv66
  %90 = bitcast [64 x i16]** %89 to i64*
  store i64 %88, i64* %90, align 8
  %91 = add nsw i64 %indvars.iv66, -1
  %92 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %91
  %93 = bitcast [64 x i16]** %92 to i16**
  %94 = load i16*, i16** %93, align 8
  %95 = load i16, i16* %94, align 2
  %96 = bitcast [64 x i16]** %89 to i16**
  %97 = load i16*, i16** %96, align 8
  store i16 %95, i16* %97, align 2
  %indvars.iv.next67 = add i64 %indvars.iv66, 1
  %98 = add nsw i32 %.233.us, 1
  %99 = load i32, i32* %53, align 4
  %100 = icmp slt i32 %98, %99
  br i1 %100, label %.lr.ph34.us, label %._crit_edge.us.loopexit

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.7, %.lr.ph.us.new ], [ %indvars.iv64.unr, %.lr.ph.us.new.preheader ]
  %.0130.us = phi [64 x i16]* [ %116, %.lr.ph.us.new ], [ %.0130.us.unr, %.lr.ph.us.new.preheader ]
  %.0529.us = phi i32 [ %117, %.lr.ph.us.new ], [ %.0529.us.unr, %.lr.ph.us.new.preheader ]
  %101 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv64
  store [64 x i16]* %.0130.us, [64 x i16]** %101, align 8
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %102 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us, i64 1
  %103 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next65
  store [64 x i16]* %102, [64 x i16]** %103, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %104 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us, i64 2
  %105 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next65.1
  store [64 x i16]* %104, [64 x i16]** %105, align 8
  %indvars.iv.next65.2 = add nsw i64 %indvars.iv64, 3
  %106 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us, i64 3
  %107 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next65.2
  store [64 x i16]* %106, [64 x i16]** %107, align 8
  %indvars.iv.next65.3 = add nsw i64 %indvars.iv64, 4
  %108 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us, i64 4
  %109 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next65.3
  store [64 x i16]* %108, [64 x i16]** %109, align 8
  %indvars.iv.next65.4 = add nsw i64 %indvars.iv64, 5
  %110 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us, i64 5
  %111 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next65.4
  store [64 x i16]* %110, [64 x i16]** %111, align 8
  %indvars.iv.next65.5 = add nsw i64 %indvars.iv64, 6
  %112 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us, i64 6
  %113 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next65.5
  store [64 x i16]* %112, [64 x i16]** %113, align 8
  %indvars.iv.next65.6 = add nsw i64 %indvars.iv64, 7
  %114 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us, i64 7
  %115 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv.next65.6
  store [64 x i16]* %114, [64 x i16]** %115, align 8
  %indvars.iv.next65.7 = add nsw i64 %indvars.iv64, 8
  %116 = getelementptr inbounds [64 x i16], [64 x i16]* %.0130.us, i64 8
  %117 = add nsw i32 %.0529.us, 8
  %exitcond.7 = icmp eq i32 %117, %55
  br i1 %exitcond.7, label %.preheader.us.loopexit.loopexit, label %.lr.ph.us.new

.preheader.us.loopexit.loopexit:                  ; preds = %.lr.ph.us.new
  br label %.preheader.us.loopexit

.preheader.us.loopexit:                           ; preds = %.preheader.us.loopexit.loopexit, %.prol.loopexit
  %118 = add i32 %55, %.1736.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %68
  %.4.ph.us = phi i32 [ %.1736.us, %68 ], [ %118, %.preheader.us.loopexit ]
  %.2.ph.us = phi i32 [ 0, %68 ], [ %55, %.preheader.us.loopexit ]
  %119 = load i32, i32* %53, align 4
  %120 = icmp slt i32 %.2.ph.us, %119
  br i1 %120, label %.lr.ph34.us.preheader, label %._crit_edge.us

.lr.ph34.us.preheader:                            ; preds = %.preheader.us
  %121 = sext i32 %.4.ph.us to i64
  br label %.lr.ph34.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %.0437 = phi i32 [ %141, %._crit_edge ], [ 0, %.preheader.preheader ]
  %.1736 = phi i32 [ %.4.lcssa, %._crit_edge ], [ %.0644, %.preheader.preheader ]
  %122 = load i32, i32* %53, align 4
  %123 = icmp sgt i32 %122, 0
  br i1 %123, label %.lr.ph34.preheader, label %._crit_edge

.lr.ph34.preheader:                               ; preds = %.preheader
  %124 = sext i32 %.1736 to i64
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %.lr.ph34.preheader, %.lr.ph34
  %indvars.iv = phi i64 [ %124, %.lr.ph34.preheader ], [ %indvars.iv.next, %.lr.ph34 ]
  %.233 = phi i32 [ 0, %.lr.ph34.preheader ], [ %137, %.lr.ph34 ]
  %125 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %7, i64 0, i32 6, i64 %indvars.iv
  %126 = bitcast [64 x i16]** %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %indvars.iv
  %129 = bitcast [64 x i16]** %128 to i64*
  store i64 %127, i64* %129, align 8
  %130 = add nsw i64 %indvars.iv, -1
  %131 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %4, i64 0, i64 %130
  %132 = bitcast [64 x i16]** %131 to i16**
  %133 = load i16*, i16** %132, align 8
  %134 = load i16, i16* %133, align 2
  %135 = bitcast [64 x i16]** %128 to i16**
  %136 = load i16*, i16** %135, align 8
  store i16 %134, i16* %136, align 2
  %indvars.iv.next = add i64 %indvars.iv, 1
  %137 = add nuw nsw i32 %.233, 1
  %138 = load i32, i32* %53, align 4
  %139 = icmp slt i32 %137, %138
  br i1 %139, label %.lr.ph34, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph34
  %140 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.4.lcssa = phi i32 [ %.1736, %.preheader ], [ %140, %._crit_edge.loopexit ]
  %141 = add nuw nsw i32 %.0437, 1
  %142 = load i32, i32* %sunkaddr119, align 8
  %143 = icmp slt i32 %141, %142
  br i1 %143, label %.preheader, label %._crit_edge41.loopexit138

._crit_edge41.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge41

._crit_edge41.loopexit138:                        ; preds = %._crit_edge
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit138, %._crit_edge41.loopexit, %.lr.ph45
  %.17.lcssa = phi i32 [ %.0644, %.lr.ph45 ], [ %.4.lcssa.us, %._crit_edge41.loopexit ], [ %.4.lcssa, %._crit_edge41.loopexit138 ]
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %144 = load i32, i32* %sunkaddr122, align 4
  %145 = sext i32 %144 to i64
  %146 = icmp slt i64 %indvars.iv.next71, %145
  br i1 %146, label %.lr.ph45, label %._crit_edge46.loopexit

._crit_edge46.loopexit:                           ; preds = %._crit_edge41
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %.preheader25
  %147 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %sunkaddr125, align 8
  %148 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %147, i64 0, i32 1
  %149 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %148, align 8
  %150 = call i32 %149(%struct.jpeg_compress_struct* nonnull %0, [64 x i16]** nonnull %44) #4
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %152, label %154

; <label>:152:                                    ; preds = %._crit_edge46
  %153 = trunc i64 %indvars.iv72 to i32
  %sunkaddr16 = ptrtoint %struct.my_coef_controller* %7 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 24
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i32*
  store i32 %153, i32* %sunkaddr18, align 8
  %sunkaddr19 = ptrtoint %struct.my_coef_controller* %7 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 20
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i32*
  store i32 %.0347, i32* %sunkaddr21, align 4
  br label %164

; <label>:154:                                    ; preds = %._crit_edge46
  %155 = add i32 %.0347, 1
  %156 = load i32, i32* %sunkaddr128, align 8
  %157 = icmp ult i32 %155, %156
  br i1 %157, label %.preheader25, label %._crit_edge48.loopexit

._crit_edge48.loopexit:                           ; preds = %154
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %.lr.ph52
  store i32 0, i32* %sunkaddr130, align 4
  %indvars.iv.next73 = add i64 %indvars.iv72, 1
  %158 = load i32, i32* %sunkaddr133, align 4
  %159 = sext i32 %158 to i64
  %160 = icmp slt i64 %indvars.iv.next73, %159
  br i1 %160, label %.lr.ph52, label %._crit_edge53.loopexit

._crit_edge53.loopexit:                           ; preds = %._crit_edge48
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.loopexit, %._crit_edge57
  %161 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %7, i64 0, i32 1
  %162 = load i32, i32* %161, align 8
  %163 = add i32 %162, 1
  store i32 %163, i32* %161, align 8
  call fastcc void @start_iMCU_row(%struct.jpeg_compress_struct* %0)
  br label %164

; <label>:164:                                    ; preds = %._crit_edge53, %152
  %.0 = phi i32 [ 0, %152 ], [ 1, %._crit_edge53 ]
  ret i32 %.0
}

declare void @jzero_far(i8*, i64) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @start_iMCU_row(%struct.jpeg_compress_struct* nocapture readonly) unnamed_addr #3 {
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
