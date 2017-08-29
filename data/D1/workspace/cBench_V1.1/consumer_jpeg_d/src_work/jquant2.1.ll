; ModuleID = 'jquant2.ll'
source_filename = "jquant2.c"
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
%struct.my_cquantizer = type { %struct.jpeg_color_quantizer, i8**, i32, [32 x i16]**, i32, i16*, i32, i32* }
%struct.box = type { i32, i32, i32, i32, i32, i32, i64, i64 }

; Function Attrs: noinline nounwind uwtable
define void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 88) #5
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %9 = bitcast %struct.jpeg_color_quantizer** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_2_quant, void (%struct.jpeg_decompress_struct*, i32)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 24
  %12 = bitcast i8* %11 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @new_color_map_2_quant, void (%struct.jpeg_decompress_struct*)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 64
  %14 = bitcast i8* %13 to i16**
  store i16* null, i16** %14, align 8
  %15 = getelementptr inbounds i8, i8* %7, i64 80
  %16 = bitcast i8* %15 to i32**
  store i32* null, i32** %16, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 3
  br i1 %19, label %27, label %20

; <label>:20:                                     ; preds = %1
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 5
  store i32 46, i32* %23, align 8
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 0
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  tail call void %26(%struct.jpeg_common_struct* %6) #5
  br label %27

; <label>:27:                                     ; preds = %1, %20
  %28 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %28, i64 0, i32 0
  %30 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %29, align 8
  %31 = tail call i8* %30(%struct.jpeg_common_struct* %6, i32 1, i64 256) #5
  %32 = getelementptr inbounds i8, i8* %7, i64 48
  %33 = bitcast i8* %32 to [32 x i16]***
  %34 = bitcast i8* %32 to i8**
  store i8* %31, i8** %34, align 8
  br label %35

; <label>:35:                                     ; preds = %27, %35
  %indvars.iv2 = phi i64 [ 0, %27 ], [ %indvars.iv.next, %35 ]
  %36 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %36, i64 0, i32 1
  %38 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %37, align 8
  %39 = tail call i8* %38(%struct.jpeg_common_struct* nonnull %6, i32 1, i64 4096) #5
  %40 = load [32 x i16]**, [32 x i16]*** %33, align 8
  %41 = getelementptr inbounds [32 x i16]*, [32 x i16]** %40, i64 %indvars.iv2
  %42 = bitcast [32 x i16]** %41 to i8**
  store i8* %39, i8** %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond, label %43, label %35

; <label>:43:                                     ; preds = %35
  %44 = getelementptr inbounds i8, i8* %7, i64 56
  %45 = bitcast i8* %44 to i32*
  store i32 1, i32* %45, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %47 = load i32, i32* %46, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %81, label %49

; <label>:49:                                     ; preds = %43
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %51 = load i32, i32* %50, align 8
  %52 = icmp slt i32 %51, 8
  br i1 %52, label %.thread, label %61

.thread:                                          ; preds = %49
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %54 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %54, i64 0, i32 5
  store i32 55, i32* %55, align 8
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 6, i32 0, i64 0
  store i32 8, i32* %57, align 4
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 0
  %60 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %59, align 8
  tail call void %60(%struct.jpeg_common_struct* nonnull %6) #5
  br label %72

; <label>:61:                                     ; preds = %49
  %62 = icmp sgt i32 %51, 256
  br i1 %62, label %63, label %72

; <label>:63:                                     ; preds = %61
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i64 0, i32 5
  store i32 56, i32* %66, align 8
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i64 0, i32 6, i32 0, i64 0
  store i32 256, i32* %68, align 4
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 0
  %71 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %70, align 8
  tail call void %71(%struct.jpeg_common_struct* nonnull %6) #5
  br label %72

; <label>:72:                                     ; preds = %.thread, %63, %61
  %73 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %74 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %73, i64 0, i32 2
  %75 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %74, align 8
  %76 = tail call i8** %75(%struct.jpeg_common_struct* nonnull %6, i32 1, i32 %51, i32 3) #5
  %77 = getelementptr inbounds i8, i8* %7, i64 32
  %78 = bitcast i8* %77 to i8***
  store i8** %76, i8*** %78, align 8
  %79 = getelementptr inbounds i8, i8* %7, i64 40
  %80 = bitcast i8* %79 to i32*
  store i32 %51, i32* %80, align 8
  br label %84

; <label>:81:                                     ; preds = %43
  %82 = getelementptr inbounds i8, i8* %7, i64 32
  %83 = bitcast i8* %82 to i8***
  store i8** null, i8*** %83, align 8
  br label %84

; <label>:84:                                     ; preds = %81, %72
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %86 = load i32, i32* %85, align 8
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %99, label %88

; <label>:88:                                     ; preds = %84
  store i32 2, i32* %85, align 8
  %89 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %90 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %89, i64 0, i32 1
  %91 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %90, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %93 = load i32, i32* %92, align 8
  %94 = add i32 %93, 2
  %95 = zext i32 %94 to i64
  %96 = mul nuw nsw i64 %95, 6
  %97 = tail call i8* %91(%struct.jpeg_common_struct* nonnull %6, i32 1, i64 %96) #5
  %98 = bitcast i8* %13 to i8**
  store i8* %97, i8** %98, align 8
  tail call void @init_error_limit(%struct.jpeg_decompress_struct* nonnull %0)
  br label %99

; <label>:99:                                     ; preds = %84, %88
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_2_quant(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %4 = bitcast %struct.jpeg_color_quantizer** %3 to %struct.my_cquantizer**
  %5 = load %struct.my_cquantizer*, %struct.my_cquantizer** %4, align 8
  %6 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 3
  %7 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11:                                     ; preds = %2
  store i32 2, i32* %8, align 8
  br label %12

; <label>:12:                                     ; preds = %2, %11
  %13 = icmp eq i32 %1, 0
  br i1 %13, label %19, label %14

; <label>:14:                                     ; preds = %12
  %15 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @prescan_quantize, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %15, align 8
  %16 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 0, i32 2
  %17 = bitcast {}** %16 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_pass1, void (%struct.jpeg_decompress_struct*)** %17, align 8
  %18 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 4
  store i32 1, i32* %18, align 8
  br label %78

; <label>:19:                                     ; preds = %12
  %20 = load i32, i32* %8, align 8
  %21 = icmp eq i32 %20, 2
  %22 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 0, i32 1
  %pass2_no_dither.sink = select i1 %21, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @pass2_fs_dither, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @pass2_no_dither
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* %pass2_no_dither.sink, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %22, align 8
  %23 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 0, i32 2
  %24 = bitcast {}** %23 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_pass2, void (%struct.jpeg_decompress_struct*)** %24, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  %26 = load i32, i32* %25, align 4
  %27 = icmp slt i32 %26, 1
  br i1 %27, label %.thread, label %37

.thread:                                          ; preds = %19
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 5
  store i32 55, i32* %30, align 8
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i64 0, i32 6, i32 0, i64 0
  store i32 1, i32* %32, align 4
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 0
  %35 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %34, align 8
  %36 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %35(%struct.jpeg_common_struct* %36) #5
  br label %49

; <label>:37:                                     ; preds = %19
  %38 = icmp sgt i32 %26, 256
  br i1 %38, label %39, label %49

; <label>:39:                                     ; preds = %37
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i64 0, i32 5
  store i32 56, i32* %42, align 8
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 6, i32 0, i64 0
  store i32 256, i32* %44, align 4
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 0
  %47 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %46, align 8
  %48 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %47(%struct.jpeg_common_struct* %48) #5
  br label %49

; <label>:49:                                     ; preds = %.thread, %39, %37
  %50 = load i32, i32* %8, align 8
  %51 = icmp eq i32 %50, 2
  br i1 %51, label %52, label %78

; <label>:52:                                     ; preds = %49
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %54 = load i32, i32* %53, align 8
  %55 = add i32 %54, 2
  %56 = zext i32 %55 to i64
  %57 = mul nuw nsw i64 %56, 6
  %58 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 5
  %59 = load i16*, i16** %58, align 8
  %60 = icmp eq i16* %59, null
  br i1 %60, label %61, label %69

; <label>:61:                                     ; preds = %52
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %63 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %63, i64 0, i32 1
  %65 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %64, align 8
  %66 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %67 = tail call i8* %65(%struct.jpeg_common_struct* %66, i32 1, i64 %57) #5
  %68 = bitcast i16** %58 to i8**
  store i8* %67, i8** %68, align 8
  br label %69

; <label>:69:                                     ; preds = %61, %52
  %70 = bitcast i16** %58 to i8**
  %71 = load i8*, i8** %70, align 8
  tail call void @jzero_far(i8* %71, i64 %57) #5
  %72 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 7
  %73 = load i32*, i32** %72, align 8
  %74 = icmp eq i32* %73, null
  br i1 %74, label %75, label %76

; <label>:75:                                     ; preds = %69
  tail call void @init_error_limit(%struct.jpeg_decompress_struct* nonnull %0)
  br label %76

; <label>:76:                                     ; preds = %75, %69
  %77 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 6
  store i32 0, i32* %77, align 8
  br label %78

; <label>:78:                                     ; preds = %49, %76, %14
  %79 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 4
  %80 = load i32, i32* %79, align 8
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %86, label %.preheader.preheader

.preheader.preheader:                             ; preds = %78
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %.preheader.preheader ]
  %82 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv1
  %83 = bitcast [32 x i16]** %82 to i8**
  %84 = load i8*, i8** %83, align 8
  tail call void @jzero_far(i8* %84, i64 4096) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond, label %85, label %.preheader

; <label>:85:                                     ; preds = %.preheader
  store i32 0, i32* %79, align 8
  br label %86

; <label>:86:                                     ; preds = %78, %85
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @new_color_map_2_quant(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %3 = bitcast %struct.jpeg_color_quantizer** %2 to %struct.my_cquantizer**
  %4 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %5 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 4
  store i32 1, i32* %5, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @init_error_limit(%struct.jpeg_decompress_struct*) #0 {
.preheader.preheader13:
  %1 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %2 = bitcast %struct.jpeg_color_quantizer** %1 to %struct.my_cquantizer**
  %3 = load %struct.my_cquantizer*, %struct.my_cquantizer** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %5 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %5, i64 0, i32 0
  %7 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %6, align 8
  %8 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %9 = tail call i8* %7(%struct.jpeg_common_struct* %8, i32 1, i64 2044) #5
  %10 = getelementptr inbounds i8, i8* %9, i64 1020
  %11 = bitcast i8* %10 to i32*
  %12 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %3, i64 0, i32 7
  %13 = bitcast i32** %12 to i8**
  store i8* %10, i8** %13, align 8
  store i32 0, i32* %11, align 4
  %14 = getelementptr inbounds i8, i8* %9, i64 1024
  %15 = bitcast i8* %14 to i32*
  store i32 1, i32* %15, align 4
  %16 = getelementptr inbounds i8, i8* %9, i64 1016
  %17 = bitcast i8* %16 to i32*
  store i32 -1, i32* %17, align 4
  %18 = getelementptr inbounds i8, i8* %9, i64 1028
  %19 = bitcast i8* %18 to i32*
  store i32 2, i32* %19, align 4
  %20 = getelementptr inbounds i8, i8* %9, i64 1012
  %21 = bitcast i8* %20 to i32*
  store i32 -2, i32* %21, align 4
  %22 = getelementptr inbounds i8, i8* %9, i64 1032
  %23 = bitcast i8* %22 to i32*
  store i32 3, i32* %23, align 4
  %24 = getelementptr inbounds i8, i8* %9, i64 1008
  %25 = bitcast i8* %24 to i32*
  store i32 -3, i32* %25, align 4
  %26 = getelementptr inbounds i8, i8* %9, i64 1036
  %27 = bitcast i8* %26 to i32*
  store i32 4, i32* %27, align 4
  %28 = getelementptr inbounds i8, i8* %9, i64 1004
  %29 = bitcast i8* %28 to i32*
  store i32 -4, i32* %29, align 4
  %30 = getelementptr inbounds i8, i8* %9, i64 1040
  %31 = bitcast i8* %30 to i32*
  store i32 5, i32* %31, align 4
  %32 = getelementptr inbounds i8, i8* %9, i64 1000
  %33 = bitcast i8* %32 to i32*
  store i32 -5, i32* %33, align 4
  %34 = getelementptr inbounds i8, i8* %9, i64 1044
  %35 = bitcast i8* %34 to i32*
  store i32 6, i32* %35, align 4
  %36 = getelementptr inbounds i8, i8* %9, i64 996
  %37 = bitcast i8* %36 to i32*
  store i32 -6, i32* %37, align 4
  %38 = getelementptr inbounds i8, i8* %9, i64 1048
  %39 = bitcast i8* %38 to i32*
  store i32 7, i32* %39, align 4
  %40 = getelementptr inbounds i8, i8* %9, i64 992
  %41 = bitcast i8* %40 to i32*
  store i32 -7, i32* %41, align 4
  %42 = getelementptr inbounds i8, i8* %9, i64 1052
  %43 = bitcast i8* %42 to i32*
  store i32 8, i32* %43, align 4
  %44 = getelementptr inbounds i8, i8* %9, i64 988
  %45 = bitcast i8* %44 to i32*
  store i32 -8, i32* %45, align 4
  %46 = getelementptr inbounds i8, i8* %9, i64 1056
  %47 = bitcast i8* %46 to i32*
  store i32 9, i32* %47, align 4
  %48 = getelementptr inbounds i8, i8* %9, i64 984
  %49 = bitcast i8* %48 to i32*
  store i32 -9, i32* %49, align 4
  %50 = getelementptr inbounds i8, i8* %9, i64 1060
  %51 = bitcast i8* %50 to i32*
  store i32 10, i32* %51, align 4
  %52 = getelementptr inbounds i8, i8* %9, i64 980
  %53 = bitcast i8* %52 to i32*
  store i32 -10, i32* %53, align 4
  %54 = getelementptr inbounds i8, i8* %9, i64 1064
  %55 = bitcast i8* %54 to i32*
  store i32 11, i32* %55, align 4
  %56 = getelementptr inbounds i8, i8* %9, i64 976
  %57 = bitcast i8* %56 to i32*
  store i32 -11, i32* %57, align 4
  %58 = getelementptr inbounds i8, i8* %9, i64 1068
  %59 = bitcast i8* %58 to i32*
  store i32 12, i32* %59, align 4
  %60 = getelementptr inbounds i8, i8* %9, i64 972
  %61 = bitcast i8* %60 to i32*
  store i32 -12, i32* %61, align 4
  %62 = getelementptr inbounds i8, i8* %9, i64 1072
  %63 = bitcast i8* %62 to i32*
  store i32 13, i32* %63, align 4
  %64 = getelementptr inbounds i8, i8* %9, i64 968
  %65 = bitcast i8* %64 to i32*
  store i32 -13, i32* %65, align 4
  %66 = getelementptr inbounds i8, i8* %9, i64 1076
  %67 = bitcast i8* %66 to i32*
  store i32 14, i32* %67, align 4
  %68 = getelementptr inbounds i8, i8* %9, i64 964
  %69 = bitcast i8* %68 to i32*
  store i32 -14, i32* %69, align 4
  %70 = getelementptr inbounds i8, i8* %9, i64 1080
  %71 = bitcast i8* %70 to i32*
  store i32 15, i32* %71, align 4
  %72 = getelementptr inbounds i8, i8* %9, i64 960
  %73 = bitcast i8* %72 to i32*
  store i32 -15, i32* %73, align 4
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader13
  %.19 = phi i32 [ 16, %.preheader.preheader13 ], [ %91, %.preheader ]
  %indvars.iv38 = phi i64 [ 16, %.preheader.preheader13 ], [ %indvars.iv.next4.1.1, %.preheader ]
  %74 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv38
  store i32 %.19, i32* %74, align 4
  %75 = sub nsw i32 0, %.19
  %76 = sub nsw i64 0, %indvars.iv38
  %77 = getelementptr inbounds i32, i32* %11, i64 %76
  store i32 %75, i32* %77, align 4
  %indvars.iv.next4 = or i64 %indvars.iv38, 1
  %78 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.next4
  store i32 %.19, i32* %78, align 4
  %79 = sub nsw i32 0, %.19
  %80 = xor i64 %indvars.iv38, -1
  %81 = getelementptr inbounds i32, i32* %11, i64 %80
  store i32 %79, i32* %81, align 4
  %indvars.iv.next4.1 = or i64 %indvars.iv38, 2
  %82 = or i32 %.19, 1
  %83 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.next4.1
  store i32 %82, i32* %83, align 4
  %84 = xor i32 %.19, -1
  %85 = sub i64 -2, %indvars.iv38
  %86 = getelementptr inbounds i32, i32* %11, i64 %85
  store i32 %84, i32* %86, align 4
  %indvars.iv.next4.114 = or i64 %indvars.iv38, 3
  %87 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.next4.114
  store i32 %82, i32* %87, align 4
  %88 = xor i32 %.19, -1
  %89 = sub i64 -3, %indvars.iv38
  %90 = getelementptr inbounds i32, i32* %11, i64 %89
  store i32 %88, i32* %90, align 4
  %indvars.iv.next4.1.1 = add nsw i64 %indvars.iv38, 4
  %91 = add nsw i32 %.19, 2
  %exitcond12.1.1 = icmp eq i64 %indvars.iv.next4.1.1, 48
  br i1 %exitcond12.1.1, label %.lr.ph.preheader, label %.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv7 = phi i64 [ 48, %.lr.ph.preheader ], [ %indvars.iv.next.3, %.lr.ph ]
  %92 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv7
  store i32 32, i32* %92, align 4
  %93 = sub nsw i64 0, %indvars.iv7
  %94 = getelementptr inbounds i32, i32* %11, i64 %93
  store i32 -32, i32* %94, align 4
  %indvars.iv.next = or i64 %indvars.iv7, 1
  %95 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.next
  store i32 32, i32* %95, align 4
  %96 = xor i64 %indvars.iv7, -1
  %97 = getelementptr inbounds i32, i32* %11, i64 %96
  store i32 -32, i32* %97, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv7, 2
  %98 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.next.1
  store i32 32, i32* %98, align 4
  %99 = sub i64 -2, %indvars.iv7
  %100 = getelementptr inbounds i32, i32* %11, i64 %99
  store i32 -32, i32* %100, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv7, 3
  %101 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv.next.2
  store i32 32, i32* %101, align 4
  %102 = sub i64 -3, %indvars.iv7
  %103 = getelementptr inbounds i32, i32* %11, i64 %102
  store i32 -32, i32* %103, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv7, 4
  %104 = icmp slt i64 %indvars.iv.next.3, 256
  br i1 %104, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @prescan_quantize(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readnone, i32) #1 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 3
  %9 = load [32 x i16]**, [32 x i16]*** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = sext i32 %3 to i64
  %13 = icmp slt i32 %3, 1
  %14 = icmp eq i32 %11, 0
  %or.cond = or i1 %13, %14
  br i1 %or.cond, label %._crit_edge8, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %4
  br label %.lr.ph7.split

.lr.ph7.split:                                    ; preds = %.lr.ph7.split.preheader, %._crit_edge
  %indvars.iv5 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph7.split.preheader ]
  %15 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv5
  %16 = load i8*, i8** %15, align 8
  br label %17

; <label>:17:                                     ; preds = %.lr.ph7.split, %17
  %.04 = phi i32 [ %11, %.lr.ph7.split ], [ %36, %17 ]
  %.023 = phi i8* [ %16, %.lr.ph7.split ], [ %35, %17 ]
  %18 = load i8, i8* %.023, align 1
  %19 = zext i8 %18 to i64
  %20 = lshr i64 %19, 3
  %21 = getelementptr inbounds [32 x i16]*, [32 x i16]** %9, i64 %20
  %22 = load [32 x i16]*, [32 x i16]** %21, align 8
  %23 = getelementptr inbounds i8, i8* %.023, i64 1
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i64
  %26 = lshr i64 %25, 2
  %27 = getelementptr inbounds i8, i8* %.023, i64 2
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = lshr i64 %29, 3
  %31 = getelementptr inbounds [32 x i16], [32 x i16]* %22, i64 %26, i64 %30
  %32 = load i16, i16* %31, align 2
  %33 = add i16 %32, 1
  %34 = icmp eq i16 %33, 0
  %. = select i1 %34, i16 %32, i16 %33
  store i16 %., i16* %31, align 2
  %35 = getelementptr inbounds i8, i8* %.023, i64 3
  %36 = add i32 %.04, -1
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %._crit_edge, label %17

._crit_edge:                                      ; preds = %17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %12
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.lr.ph7.split

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass1(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %3 = bitcast %struct.jpeg_color_quantizer** %2 to %struct.my_cquantizer**
  %4 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %5 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 1
  %6 = bitcast i8*** %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %9 = bitcast i8*** %8 to i64*
  store i64 %7, i64* %9, align 8
  %10 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 2
  %11 = load i32, i32* %10, align 8
  tail call void @select_colors(%struct.jpeg_decompress_struct* %0, i32 %11)
  %12 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 4
  store i32 1, i32* %12, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @pass2_fs_dither(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly, i32) #1 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 3
  %9 = load [32 x i16]**, [32 x i16]*** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 7
  %15 = load i32*, i32** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %17 = load i8**, i8*** %16, align 8
  %18 = load i8*, i8** %17, align 8
  %19 = getelementptr inbounds i8*, i8** %17, i64 1
  %20 = load i8*, i8** %19, align 8
  %21 = getelementptr inbounds i8*, i8** %17, i64 2
  %22 = load i8*, i8** %21, align 8
  %23 = zext i32 %11 to i64
  %24 = sext i32 %3 to i64
  %25 = icmp sgt i32 %3, 0
  br i1 %25, label %.lr.ph36, label %._crit_edge37

.lr.ph36:                                         ; preds = %4
  %26 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 6
  %27 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 5
  %28 = icmp eq i32 %11, 0
  %29 = add i32 %11, -1
  %30 = mul i32 %29, 3
  %31 = zext i32 %30 to i64
  %32 = zext i32 %29 to i64
  %33 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 5
  %34 = mul i32 %11, 3
  %35 = add i32 %34, 3
  %36 = zext i32 %35 to i64
  br label %37

; <label>:37:                                     ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv34 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next, %._crit_edge ]
  %38 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv34
  %39 = load i8*, i8** %38, align 8
  %40 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv34
  %41 = load i8*, i8** %40, align 8
  %42 = load i32, i32* %26, align 8
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %49, label %44

; <label>:44:                                     ; preds = %37
  %45 = getelementptr inbounds i8, i8* %39, i64 %31
  %46 = getelementptr inbounds i8, i8* %41, i64 %32
  %47 = load i16*, i16** %33, align 8
  %48 = getelementptr inbounds i16, i16* %47, i64 %36
  br label %51

; <label>:49:                                     ; preds = %37
  %50 = load i16*, i16** %27, align 8
  br label %51

; <label>:51:                                     ; preds = %49, %44
  %.sink = phi i32 [ 1, %49 ], [ 0, %44 ]
  %.016 = phi i16* [ %50, %49 ], [ %48, %44 ]
  %.05 = phi i8* [ %39, %49 ], [ %45, %44 ]
  %.04 = phi i8* [ %41, %49 ], [ %46, %44 ]
  %.03 = phi i64 [ 1, %49 ], [ -1, %44 ]
  %.02 = phi i32 [ 3, %49 ], [ -3, %44 ]
  store i32 %.sink, i32* %26, align 8
  %52 = sext i32 %.02 to i64
  %53 = mul nsw i64 %52, %23
  br i1 %28, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %51
  %54 = add nsw i32 %.02, 1
  %55 = sext i32 %54 to i64
  %56 = add nsw i32 %.02, 2
  %57 = sext i32 %56 to i64
  br label %58

; <label>:58:                                     ; preds = %.lr.ph, %121
  %.031 = phi i32 [ %11, %.lr.ph ], [ %161, %121 ]
  %.130 = phi i8* [ %.04, %.lr.ph ], [ %160, %121 ]
  %.1629 = phi i8* [ %.05, %.lr.ph ], [ %159, %121 ]
  %.0728 = phi i32 [ 0, %.lr.ph ], [ %144, %121 ]
  %.0827 = phi i32 [ 0, %.lr.ph ], [ %151, %121 ]
  %.0926 = phi i32 [ 0, %.lr.ph ], [ %158, %121 ]
  %.01025 = phi i32 [ 0, %.lr.ph ], [ %130, %121 ]
  %.01124 = phi i32 [ 0, %.lr.ph ], [ %134, %121 ]
  %.01223 = phi i32 [ 0, %.lr.ph ], [ %138, %121 ]
  %.01322 = phi i32 [ 0, %.lr.ph ], [ %143, %121 ]
  %.01421 = phi i32 [ 0, %.lr.ph ], [ %150, %121 ]
  %.01520 = phi i32 [ 0, %.lr.ph ], [ %157, %121 ]
  %.11719 = phi i16* [ %.016, %.lr.ph ], [ %59, %121 ]
  %59 = getelementptr inbounds i16, i16* %.11719, i64 %52
  %60 = load i16, i16* %59, align 2
  %61 = sext i16 %60 to i32
  %62 = add i32 %.0728, 8
  %63 = add i32 %62, %61
  %64 = ashr i32 %63, 4
  %65 = getelementptr inbounds i16, i16* %.11719, i64 %55
  %66 = load i16, i16* %65, align 2
  %67 = sext i16 %66 to i32
  %68 = add i32 %.0827, 8
  %69 = add i32 %68, %67
  %70 = ashr i32 %69, 4
  %71 = getelementptr inbounds i16, i16* %.11719, i64 %57
  %72 = load i16, i16* %71, align 2
  %73 = sext i16 %72 to i32
  %74 = add i32 %.0926, 8
  %75 = add i32 %74, %73
  %76 = ashr i32 %75, 4
  %77 = sext i32 %64 to i64
  %78 = getelementptr inbounds i32, i32* %15, i64 %77
  %79 = load i32, i32* %78, align 4
  %80 = sext i32 %70 to i64
  %81 = getelementptr inbounds i32, i32* %15, i64 %80
  %82 = load i32, i32* %81, align 4
  %83 = sext i32 %76 to i64
  %84 = getelementptr inbounds i32, i32* %15, i64 %83
  %85 = load i32, i32* %84, align 4
  %86 = load i8, i8* %.1629, align 1
  %87 = zext i8 %86 to i32
  %88 = add nsw i32 %87, %79
  %89 = getelementptr inbounds i8, i8* %.1629, i64 1
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = add nsw i32 %91, %82
  %93 = getelementptr inbounds i8, i8* %.1629, i64 2
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = add nsw i32 %95, %85
  %97 = sext i32 %88 to i64
  %98 = getelementptr inbounds i8, i8* %13, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = sext i32 %92 to i64
  %102 = getelementptr inbounds i8, i8* %13, i64 %101
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = sext i32 %96 to i64
  %106 = getelementptr inbounds i8, i8* %13, i64 %105
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = lshr i32 %100, 3
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds [32 x i16]*, [32 x i16]** %9, i64 %110
  %112 = load [32 x i16]*, [32 x i16]** %111, align 8
  %113 = lshr i32 %104, 2
  %114 = zext i32 %113 to i64
  %115 = lshr i32 %108, 3
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds [32 x i16], [32 x i16]* %112, i64 %114, i64 %116
  %118 = load i16, i16* %117, align 2
  %119 = icmp eq i16 %118, 0
  br i1 %119, label %120, label %121

; <label>:120:                                    ; preds = %58
  tail call void @fill_inverse_cmap(%struct.jpeg_decompress_struct* %0, i32 %109, i32 %113, i32 %115)
  br label %121

; <label>:121:                                    ; preds = %120, %58
  %122 = load i16, i16* %117, align 2
  %123 = zext i16 %122 to i32
  %124 = add nsw i32 %123, -1
  %125 = trunc i32 %124 to i8
  store i8 %125, i8* %.130, align 1
  %126 = sext i32 %124 to i64
  %127 = getelementptr inbounds i8, i8* %18, i64 %126
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i32
  %130 = sub nsw i32 %100, %129
  %131 = getelementptr inbounds i8, i8* %20, i64 %126
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = sub nsw i32 %104, %133
  %135 = getelementptr inbounds i8, i8* %22, i64 %126
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i32
  %138 = sub nsw i32 %108, %137
  %139 = mul nsw i32 %130, 3
  %140 = add nsw i32 %139, %.01322
  %141 = trunc i32 %140 to i16
  store i16 %141, i16* %.11719, align 2
  %142 = mul nsw i32 %130, 5
  %143 = add nsw i32 %142, %.01025
  %144 = mul nsw i32 %130, 7
  %145 = mul nsw i32 %134, 3
  %146 = add nsw i32 %145, %.01421
  %147 = trunc i32 %146 to i16
  %148 = getelementptr inbounds i16, i16* %.11719, i64 1
  store i16 %147, i16* %148, align 2
  %149 = mul nsw i32 %134, 5
  %150 = add nsw i32 %149, %.01124
  %151 = mul nsw i32 %134, 7
  %152 = mul nsw i32 %138, 3
  %153 = add nsw i32 %152, %.01520
  %154 = trunc i32 %153 to i16
  %155 = getelementptr inbounds i16, i16* %.11719, i64 2
  store i16 %154, i16* %155, align 2
  %156 = mul nsw i32 %138, 5
  %157 = add nsw i32 %156, %.01223
  %158 = mul nsw i32 %138, 7
  %159 = getelementptr inbounds i8, i8* %.1629, i64 %52
  %160 = getelementptr inbounds i8, i8* %.130, i64 %.03
  %161 = add i32 %.031, -1
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %._crit_edge.loopexit, label %58

._crit_edge.loopexit:                             ; preds = %121
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %51
  %.015.lcssa = phi i32 [ 0, %51 ], [ %157, %._crit_edge.loopexit ]
  %.014.lcssa = phi i32 [ 0, %51 ], [ %150, %._crit_edge.loopexit ]
  %.013.lcssa = phi i32 [ 0, %51 ], [ %143, %._crit_edge.loopexit ]
  %scevgep = getelementptr i16, i16* %.016, i64 %53
  %163 = trunc i32 %.013.lcssa to i16
  store i16 %163, i16* %scevgep, align 2
  %164 = trunc i32 %.014.lcssa to i16
  %165 = getelementptr inbounds i16, i16* %scevgep, i64 1
  store i16 %164, i16* %165, align 2
  %166 = trunc i32 %.015.lcssa to i16
  %167 = getelementptr inbounds i16, i16* %scevgep, i64 2
  store i16 %166, i16* %167, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %24
  br i1 %exitcond, label %._crit_edge37.loopexit, label %37

._crit_edge37.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @pass2_no_dither(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly, i32) #1 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 3
  %9 = load [32 x i16]**, [32 x i16]*** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = sext i32 %3 to i64
  %13 = icmp slt i32 %3, 1
  %14 = icmp eq i32 %11, 0
  %or.cond = or i1 %13, %14
  br i1 %or.cond, label %._crit_edge10, label %.lr.ph9.split.preheader

.lr.ph9.split.preheader:                          ; preds = %4
  br label %.lr.ph9.split

.lr.ph9.split:                                    ; preds = %.lr.ph9.split.preheader, %._crit_edge
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph9.split.preheader ]
  %15 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv7
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv7
  %18 = load i8*, i8** %17, align 8
  br label %19

; <label>:19:                                     ; preds = %.lr.ph9.split, %41
  %.06 = phi i32 [ %11, %.lr.ph9.split ], [ %46, %41 ]
  %.025 = phi i8* [ %18, %.lr.ph9.split ], [ %45, %41 ]
  %.034 = phi i8* [ %16, %.lr.ph9.split ], [ %28, %41 ]
  %20 = getelementptr inbounds i8, i8* %.034, i64 1
  %21 = load i8, i8* %.034, align 1
  %22 = zext i8 %21 to i32
  %23 = lshr i32 %22, 3
  %24 = getelementptr inbounds i8, i8* %.034, i64 2
  %25 = load i8, i8* %20, align 1
  %26 = zext i8 %25 to i32
  %27 = lshr i32 %26, 2
  %28 = getelementptr inbounds i8, i8* %.034, i64 3
  %29 = load i8, i8* %24, align 1
  %30 = zext i8 %29 to i32
  %31 = lshr i32 %30, 3
  %32 = zext i32 %23 to i64
  %33 = getelementptr inbounds [32 x i16]*, [32 x i16]** %9, i64 %32
  %34 = load [32 x i16]*, [32 x i16]** %33, align 8
  %35 = zext i32 %27 to i64
  %36 = zext i32 %31 to i64
  %37 = getelementptr inbounds [32 x i16], [32 x i16]* %34, i64 %35, i64 %36
  %38 = load i16, i16* %37, align 2
  %39 = icmp eq i16 %38, 0
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %19
  tail call void @fill_inverse_cmap(%struct.jpeg_decompress_struct* %0, i32 %23, i32 %27, i32 %31)
  br label %41

; <label>:41:                                     ; preds = %40, %19
  %42 = load i16, i16* %37, align 2
  %43 = trunc i16 %42 to i8
  %44 = add i8 %43, -1
  %45 = getelementptr inbounds i8, i8* %.025, i64 1
  store i8 %44, i8* %.025, align 1
  %46 = add i32 %.06, -1
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %._crit_edge, label %19

._crit_edge:                                      ; preds = %41
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %12
  br i1 %exitcond, label %._crit_edge10.loopexit, label %.lr.ph9.split

._crit_edge10.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @finish_pass2(%struct.jpeg_decompress_struct* nocapture) #2 {
  ret void
}

declare void @jzero_far(i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @select_colors(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %4, i64 0, i32 0
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = sext i32 %1 to i64
  %9 = mul nsw i64 %8, 40
  %10 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 %9) #5
  %11 = bitcast i8* %10 to %struct.box*
  %12 = bitcast i8* %10 to i32*
  store i32 0, i32* %12, align 8
  %13 = getelementptr inbounds i8, i8* %10, i64 4
  %14 = bitcast i8* %13 to i32*
  store i32 31, i32* %14, align 4
  %15 = getelementptr inbounds i8, i8* %10, i64 8
  %16 = bitcast i8* %15 to i32*
  store i32 0, i32* %16, align 8
  %17 = getelementptr inbounds i8, i8* %10, i64 12
  %18 = bitcast i8* %17 to i32*
  store i32 63, i32* %18, align 4
  %19 = getelementptr inbounds i8, i8* %10, i64 16
  %20 = bitcast i8* %19 to i32*
  store i32 0, i32* %20, align 8
  %21 = getelementptr inbounds i8, i8* %10, i64 20
  %22 = bitcast i8* %21 to i32*
  store i32 31, i32* %22, align 4
  tail call void @update_box(%struct.jpeg_decompress_struct* %0, %struct.box* %11)
  %23 = tail call i32 @median_cut(%struct.jpeg_decompress_struct* %0, %struct.box* %11, i32 1, i32 %1)
  %24 = sext i32 %23 to i64
  %25 = icmp sgt i32 %23, 0
  br i1 %25, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %26 = getelementptr inbounds %struct.box, %struct.box* %11, i64 %indvars.iv1
  %27 = trunc i64 %indvars.iv1 to i32
  tail call void @compute_color(%struct.jpeg_decompress_struct* %0, %struct.box* %26, i32 %27)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %24
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  store i32 %23, i32* %28, align 4
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i64 0, i32 5
  store i32 95, i32* %31, align 8
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 6, i32 0, i64 0
  store i32 %23, i32* %33, align 4
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i64 0, i32 1
  %36 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %35, align 8
  tail call void %36(%struct.jpeg_common_struct* %7, i32 1) #5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @update_box(%struct.jpeg_decompress_struct* nocapture readonly, %struct.box* nocapture) #1 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %4 = bitcast %struct.jpeg_color_quantizer** %3 to %struct.my_cquantizer**
  %5 = load %struct.my_cquantizer*, %struct.my_cquantizer** %4, align 8
  %6 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 3
  %7 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %8 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 1
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 2
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 3
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 4
  %17 = load i32, i32* %16, align 8
  %18 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 5
  %19 = load i32, i32* %18, align 4
  %20 = icmp sgt i32 %11, %9
  br i1 %20, label %.preheader73.lr.ph, label %.loopexit74

.preheader73.lr.ph:                               ; preds = %2
  %21 = sext i32 %13 to i64
  %22 = sext i32 %15 to i64
  %23 = sext i32 %11 to i64
  %24 = icmp sgt i32 %13, %15
  %25 = sext i32 %17 to i64
  %26 = icmp sgt i32 %17, %19
  %or.cond = or i1 %24, %26
  br i1 %or.cond, label %.loopexit74, label %.preheader73.preheader

.preheader73.preheader:                           ; preds = %.preheader73.lr.ph
  %27 = sext i32 %9 to i64
  br label %.preheader73

.preheader73:                                     ; preds = %.preheader73.preheader, %._crit_edge370
  %indvars.iv62372 = phi i64 [ %indvars.iv.next63, %._crit_edge370 ], [ %27, %.preheader73.preheader ]
  %28 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv62372
  %29 = load [32 x i16]*, [32 x i16]** %28, align 8
  br label %.lr.ph366

.lr.ph366:                                        ; preds = %._crit_edge367, %.preheader73
  %indvars.iv60368 = phi i64 [ %21, %.preheader73 ], [ %indvars.iv.next61, %._crit_edge367 ]
  %30 = getelementptr inbounds [32 x i16], [32 x i16]* %29, i64 %indvars.iv60368, i64 %25
  br label %31

; <label>:31:                                     ; preds = %35, %.lr.ph366
  %.04364 = phi i16* [ %30, %.lr.ph366 ], [ %36, %35 ]
  %.022363 = phi i32 [ %17, %.lr.ph366 ], [ %37, %35 ]
  %32 = load i16, i16* %.04364, align 2
  %33 = icmp eq i16 %32, 0
  br i1 %33, label %35, label %.us-lcssa371

.us-lcssa371:                                     ; preds = %31
  %34 = trunc i64 %indvars.iv62372 to i32
  store i32 %34, i32* %8, align 8
  br label %.loopexit74

; <label>:35:                                     ; preds = %31
  %36 = getelementptr inbounds i16, i16* %.04364, i64 1
  %37 = add nsw i32 %.022363, 1
  %38 = icmp slt i32 %.022363, %19
  br i1 %38, label %31, label %._crit_edge367

._crit_edge367:                                   ; preds = %35
  %indvars.iv.next61 = add nsw i64 %indvars.iv60368, 1
  %39 = icmp slt i64 %indvars.iv60368, %22
  br i1 %39, label %.lr.ph366, label %._crit_edge370

._crit_edge370:                                   ; preds = %._crit_edge367
  %indvars.iv.next63 = add nsw i64 %indvars.iv62372, 1
  %40 = icmp slt i64 %indvars.iv62372, %23
  br i1 %40, label %.preheader73, label %.loopexit74.loopexit

.loopexit74.loopexit:                             ; preds = %._crit_edge370
  br label %.loopexit74

.loopexit74:                                      ; preds = %.loopexit74.loopexit, %.preheader73.lr.ph, %2, %.us-lcssa371
  %.029 = phi i32 [ %34, %.us-lcssa371 ], [ %9, %2 ], [ %9, %.preheader73.lr.ph ], [ %9, %.loopexit74.loopexit ]
  %41 = icmp sgt i32 %11, %.029
  br i1 %41, label %.preheader71.lr.ph, label %.loopexit72

.preheader71.lr.ph:                               ; preds = %.loopexit74
  %42 = sext i32 %13 to i64
  %43 = sext i32 %15 to i64
  %44 = sext i32 %.029 to i64
  %45 = icmp sgt i32 %13, %15
  %46 = sext i32 %17 to i64
  %47 = icmp sgt i32 %17, %19
  %or.cond433 = or i1 %45, %47
  br i1 %or.cond433, label %.loopexit72, label %.preheader71.preheader

.preheader71.preheader:                           ; preds = %.preheader71.lr.ph
  %48 = sext i32 %11 to i64
  br label %.preheader71

.preheader71:                                     ; preds = %.preheader71.preheader, %._crit_edge326
  %indvars.iv58328 = phi i64 [ %indvars.iv.next59, %._crit_edge326 ], [ %48, %.preheader71.preheader ]
  %49 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv58328
  %50 = load [32 x i16]*, [32 x i16]** %49, align 8
  br label %.lr.ph322

.lr.ph322:                                        ; preds = %._crit_edge323, %.preheader71
  %indvars.iv56324 = phi i64 [ %42, %.preheader71 ], [ %indvars.iv.next57, %._crit_edge323 ]
  %51 = getelementptr inbounds [32 x i16], [32 x i16]* %50, i64 %indvars.iv56324, i64 %46
  br label %52

; <label>:52:                                     ; preds = %56, %.lr.ph322
  %.15320 = phi i16* [ %51, %.lr.ph322 ], [ %57, %56 ]
  %.123319 = phi i32 [ %17, %.lr.ph322 ], [ %58, %56 ]
  %53 = load i16, i16* %.15320, align 2
  %54 = icmp eq i16 %53, 0
  br i1 %54, label %56, label %.us-lcssa327

.us-lcssa327:                                     ; preds = %52
  %55 = trunc i64 %indvars.iv58328 to i32
  store i32 %55, i32* %10, align 4
  br label %.loopexit72

; <label>:56:                                     ; preds = %52
  %57 = getelementptr inbounds i16, i16* %.15320, i64 1
  %58 = add nsw i32 %.123319, 1
  %59 = icmp slt i32 %.123319, %19
  br i1 %59, label %52, label %._crit_edge323

._crit_edge323:                                   ; preds = %56
  %indvars.iv.next57 = add nsw i64 %indvars.iv56324, 1
  %60 = icmp slt i64 %indvars.iv56324, %43
  br i1 %60, label %.lr.ph322, label %._crit_edge326

._crit_edge326:                                   ; preds = %._crit_edge323
  %indvars.iv.next59 = add nsw i64 %indvars.iv58328, -1
  %61 = icmp sgt i64 %indvars.iv58328, %44
  br i1 %61, label %.preheader71, label %.loopexit72.loopexit

.loopexit72.loopexit:                             ; preds = %._crit_edge326
  br label %.loopexit72

.loopexit72:                                      ; preds = %.loopexit72.loopexit, %.preheader71.lr.ph, %.loopexit74, %.us-lcssa327
  %.030 = phi i32 [ %55, %.us-lcssa327 ], [ %11, %.loopexit74 ], [ %11, %.preheader71.lr.ph ], [ %11, %.loopexit72.loopexit ]
  %62 = icmp sgt i32 %15, %13
  br i1 %62, label %.preheader69.lr.ph, label %.loopexit70

.preheader69.lr.ph:                               ; preds = %.loopexit72
  %63 = sext i32 %.029 to i64
  %64 = sext i32 %.030 to i64
  %65 = sext i32 %15 to i64
  %66 = icmp slt i32 %.030, %.029
  %67 = sext i32 %17 to i64
  %68 = icmp sgt i32 %17, %19
  %or.cond434 = or i1 %66, %68
  br i1 %or.cond434, label %.loopexit70, label %.preheader69.preheader

.preheader69.preheader:                           ; preds = %.preheader69.lr.ph
  %69 = sext i32 %13 to i64
  br label %.preheader69

.preheader69:                                     ; preds = %.preheader69.preheader, %._crit_edge282
  %indvars.iv54284 = phi i64 [ %indvars.iv.next55, %._crit_edge282 ], [ %69, %.preheader69.preheader ]
  br label %.lr.ph278

.lr.ph278:                                        ; preds = %._crit_edge279, %.preheader69
  %indvars.iv52280 = phi i64 [ %63, %.preheader69 ], [ %indvars.iv.next53, %._crit_edge279 ]
  %70 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv52280
  %71 = load [32 x i16]*, [32 x i16]** %70, align 8
  %72 = getelementptr inbounds [32 x i16], [32 x i16]* %71, i64 %indvars.iv54284, i64 %67
  br label %73

; <label>:73:                                     ; preds = %77, %.lr.ph278
  %.26276 = phi i16* [ %72, %.lr.ph278 ], [ %78, %77 ]
  %.224275 = phi i32 [ %17, %.lr.ph278 ], [ %79, %77 ]
  %74 = load i16, i16* %.26276, align 2
  %75 = icmp eq i16 %74, 0
  br i1 %75, label %77, label %.us-lcssa283

.us-lcssa283:                                     ; preds = %73
  %76 = trunc i64 %indvars.iv54284 to i32
  store i32 %76, i32* %12, align 8
  br label %.loopexit70

; <label>:77:                                     ; preds = %73
  %78 = getelementptr inbounds i16, i16* %.26276, i64 1
  %79 = add nsw i32 %.224275, 1
  %80 = icmp slt i32 %.224275, %19
  br i1 %80, label %73, label %._crit_edge279

._crit_edge279:                                   ; preds = %77
  %indvars.iv.next53 = add nsw i64 %indvars.iv52280, 1
  %81 = icmp slt i64 %indvars.iv52280, %64
  br i1 %81, label %.lr.ph278, label %._crit_edge282

._crit_edge282:                                   ; preds = %._crit_edge279
  %indvars.iv.next55 = add nsw i64 %indvars.iv54284, 1
  %82 = icmp slt i64 %indvars.iv54284, %65
  br i1 %82, label %.preheader69, label %.loopexit70.loopexit

.loopexit70.loopexit:                             ; preds = %._crit_edge282
  br label %.loopexit70

.loopexit70:                                      ; preds = %.loopexit70.loopexit, %.preheader69.lr.ph, %.loopexit72, %.us-lcssa283
  %.031 = phi i32 [ %76, %.us-lcssa283 ], [ %13, %.loopexit72 ], [ %13, %.preheader69.lr.ph ], [ %13, %.loopexit70.loopexit ]
  %83 = icmp sgt i32 %15, %.031
  br i1 %83, label %.preheader67.lr.ph, label %.loopexit68

.preheader67.lr.ph:                               ; preds = %.loopexit70
  %84 = sext i32 %.029 to i64
  %85 = sext i32 %.030 to i64
  %86 = sext i32 %.031 to i64
  %87 = icmp slt i32 %.030, %.029
  %88 = sext i32 %17 to i64
  %89 = icmp sgt i32 %17, %19
  %or.cond435 = or i1 %87, %89
  br i1 %or.cond435, label %.loopexit68, label %.preheader67.preheader

.preheader67.preheader:                           ; preds = %.preheader67.lr.ph
  %90 = sext i32 %15 to i64
  br label %.preheader67

.preheader67:                                     ; preds = %.preheader67.preheader, %._crit_edge238
  %indvars.iv50240 = phi i64 [ %indvars.iv.next51, %._crit_edge238 ], [ %90, %.preheader67.preheader ]
  br label %.lr.ph234

.lr.ph234:                                        ; preds = %._crit_edge235, %.preheader67
  %indvars.iv48236 = phi i64 [ %84, %.preheader67 ], [ %indvars.iv.next49, %._crit_edge235 ]
  %91 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv48236
  %92 = load [32 x i16]*, [32 x i16]** %91, align 8
  %93 = getelementptr inbounds [32 x i16], [32 x i16]* %92, i64 %indvars.iv50240, i64 %88
  br label %94

; <label>:94:                                     ; preds = %98, %.lr.ph234
  %.37232 = phi i16* [ %93, %.lr.ph234 ], [ %99, %98 ]
  %.325231 = phi i32 [ %17, %.lr.ph234 ], [ %100, %98 ]
  %95 = load i16, i16* %.37232, align 2
  %96 = icmp eq i16 %95, 0
  br i1 %96, label %98, label %.us-lcssa239

.us-lcssa239:                                     ; preds = %94
  %97 = trunc i64 %indvars.iv50240 to i32
  store i32 %97, i32* %14, align 4
  br label %.loopexit68

; <label>:98:                                     ; preds = %94
  %99 = getelementptr inbounds i16, i16* %.37232, i64 1
  %100 = add nsw i32 %.325231, 1
  %101 = icmp slt i32 %.325231, %19
  br i1 %101, label %94, label %._crit_edge235

._crit_edge235:                                   ; preds = %98
  %indvars.iv.next49 = add nsw i64 %indvars.iv48236, 1
  %102 = icmp slt i64 %indvars.iv48236, %85
  br i1 %102, label %.lr.ph234, label %._crit_edge238

._crit_edge238:                                   ; preds = %._crit_edge235
  %indvars.iv.next51 = add nsw i64 %indvars.iv50240, -1
  %103 = icmp sgt i64 %indvars.iv50240, %86
  br i1 %103, label %.preheader67, label %.loopexit68.loopexit

.loopexit68.loopexit:                             ; preds = %._crit_edge238
  br label %.loopexit68

.loopexit68:                                      ; preds = %.loopexit68.loopexit, %.preheader67.lr.ph, %.loopexit70, %.us-lcssa239
  %.03 = phi i32 [ %97, %.us-lcssa239 ], [ %15, %.loopexit70 ], [ %15, %.preheader67.lr.ph ], [ %15, %.loopexit68.loopexit ]
  %104 = icmp sgt i32 %19, %17
  br i1 %104, label %.preheader65.lr.ph, label %.loopexit66

.preheader65.lr.ph:                               ; preds = %.loopexit68
  %105 = sext i32 %.029 to i64
  %106 = sext i32 %.030 to i64
  %107 = sext i32 %19 to i64
  %108 = icmp slt i32 %.030, %.029
  %109 = sext i32 %.031 to i64
  %110 = icmp slt i32 %.03, %.031
  %or.cond436 = or i1 %108, %110
  br i1 %or.cond436, label %.loopexit66, label %.preheader65.preheader

.preheader65.preheader:                           ; preds = %.preheader65.lr.ph
  %111 = sext i32 %17 to i64
  br label %.preheader65

.preheader65:                                     ; preds = %.preheader65.preheader, %._crit_edge194
  %indvars.iv46196 = phi i64 [ %indvars.iv.next47, %._crit_edge194 ], [ %111, %.preheader65.preheader ]
  br label %.lr.ph190

.lr.ph190:                                        ; preds = %._crit_edge191, %.preheader65
  %indvars.iv44192 = phi i64 [ %105, %.preheader65 ], [ %indvars.iv.next45, %._crit_edge191 ]
  %112 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv44192
  %113 = load [32 x i16]*, [32 x i16]** %112, align 8
  %114 = getelementptr inbounds [32 x i16], [32 x i16]* %113, i64 %109, i64 %indvars.iv46196
  br label %115

; <label>:115:                                    ; preds = %119, %.lr.ph190
  %.4188 = phi i16* [ %114, %.lr.ph190 ], [ %121, %119 ]
  %.419187 = phi i32 [ %.031, %.lr.ph190 ], [ %120, %119 ]
  %116 = load i16, i16* %.4188, align 2
  %117 = icmp eq i16 %116, 0
  br i1 %117, label %119, label %.us-lcssa195

.us-lcssa195:                                     ; preds = %115
  %118 = trunc i64 %indvars.iv46196 to i32
  store i32 %118, i32* %16, align 8
  br label %.loopexit66

; <label>:119:                                    ; preds = %115
  %120 = add nsw i32 %.419187, 1
  %121 = getelementptr inbounds i16, i16* %.4188, i64 32
  %122 = icmp slt i32 %.419187, %.03
  br i1 %122, label %115, label %._crit_edge191

._crit_edge191:                                   ; preds = %119
  %indvars.iv.next45 = add nsw i64 %indvars.iv44192, 1
  %123 = icmp slt i64 %indvars.iv44192, %106
  br i1 %123, label %.lr.ph190, label %._crit_edge194

._crit_edge194:                                   ; preds = %._crit_edge191
  %indvars.iv.next47 = add nsw i64 %indvars.iv46196, 1
  %124 = icmp slt i64 %indvars.iv46196, %107
  br i1 %124, label %.preheader65, label %.loopexit66.loopexit

.loopexit66.loopexit:                             ; preds = %._crit_edge194
  br label %.loopexit66

.loopexit66:                                      ; preds = %.loopexit66.loopexit, %.preheader65.lr.ph, %.loopexit68, %.us-lcssa195
  %.02 = phi i32 [ %118, %.us-lcssa195 ], [ %17, %.loopexit68 ], [ %17, %.preheader65.lr.ph ], [ %17, %.loopexit66.loopexit ]
  %125 = icmp sgt i32 %19, %.02
  br i1 %125, label %.preheader64.lr.ph, label %.loopexit

.preheader64.lr.ph:                               ; preds = %.loopexit66
  %126 = sext i32 %.029 to i64
  %127 = sext i32 %.030 to i64
  %128 = sext i32 %.02 to i64
  %129 = icmp slt i32 %.030, %.029
  %130 = sext i32 %.031 to i64
  %131 = icmp slt i32 %.03, %.031
  %or.cond437 = or i1 %129, %131
  br i1 %or.cond437, label %.loopexit, label %.preheader64.preheader

.preheader64.preheader:                           ; preds = %.preheader64.lr.ph
  %132 = sext i32 %19 to i64
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64.preheader, %._crit_edge151
  %indvars.iv42152 = phi i64 [ %indvars.iv.next43, %._crit_edge151 ], [ %132, %.preheader64.preheader ]
  br label %.lr.ph147

.lr.ph147:                                        ; preds = %._crit_edge148, %.preheader64
  %indvars.iv40149 = phi i64 [ %126, %.preheader64 ], [ %indvars.iv.next41, %._crit_edge148 ]
  %133 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv40149
  %134 = load [32 x i16]*, [32 x i16]** %133, align 8
  %135 = getelementptr inbounds [32 x i16], [32 x i16]* %134, i64 %130, i64 %indvars.iv42152
  br label %136

; <label>:136:                                    ; preds = %140, %.lr.ph147
  %.5145 = phi i16* [ %135, %.lr.ph147 ], [ %142, %140 ]
  %.520144 = phi i32 [ %.031, %.lr.ph147 ], [ %141, %140 ]
  %137 = load i16, i16* %.5145, align 2
  %138 = icmp eq i16 %137, 0
  br i1 %138, label %140, label %.us-lcssa

.us-lcssa:                                        ; preds = %136
  %139 = trunc i64 %indvars.iv42152 to i32
  store i32 %139, i32* %18, align 4
  br label %.loopexit

; <label>:140:                                    ; preds = %136
  %141 = add nsw i32 %.520144, 1
  %142 = getelementptr inbounds i16, i16* %.5145, i64 32
  %143 = icmp slt i32 %.520144, %.03
  br i1 %143, label %136, label %._crit_edge148

._crit_edge148:                                   ; preds = %140
  %indvars.iv.next41 = add nsw i64 %indvars.iv40149, 1
  %144 = icmp slt i64 %indvars.iv40149, %127
  br i1 %144, label %.lr.ph147, label %._crit_edge151

._crit_edge151:                                   ; preds = %._crit_edge148
  %indvars.iv.next43 = add nsw i64 %indvars.iv42152, -1
  %145 = icmp sgt i64 %indvars.iv42152, %128
  br i1 %145, label %.preheader64, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge151
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader64.lr.ph, %.loopexit66, %.us-lcssa
  %.01 = phi i32 [ %139, %.us-lcssa ], [ %19, %.loopexit66 ], [ %19, %.preheader64.lr.ph ], [ %19, %.loopexit.loopexit ]
  %146 = sub nsw i32 %.030, %.029
  %147 = shl i32 %146, 4
  %148 = sext i32 %147 to i64
  %149 = sub nsw i32 %.03, %.031
  %150 = mul i32 %149, 12
  %151 = sext i32 %150 to i64
  %152 = sub nsw i32 %.01, %.02
  %153 = shl i32 %152, 3
  %154 = sext i32 %153 to i64
  %155 = mul nsw i64 %148, %148
  %156 = mul nsw i64 %151, %151
  %157 = add nuw nsw i64 %156, %155
  %158 = mul nsw i64 %154, %154
  %159 = add nuw nsw i64 %157, %158
  %160 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 6
  store i64 %159, i64* %160, align 8
  %161 = sext i32 %.031 to i64
  %162 = sext i32 %.03 to i64
  %163 = sext i32 %.030 to i64
  %164 = icmp slt i32 %.030, %.029
  br i1 %164, label %._crit_edge91, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.loopexit
  %165 = icmp slt i32 %.03, %.031
  %166 = sext i32 %.02 to i64
  %167 = icmp slt i32 %.01, %.02
  %or.cond438 = or i1 %165, %167
  br i1 %or.cond438, label %._crit_edge91, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %168 = sext i32 %.029 to i64
  %169 = add nsw i64 %162, 1
  %170 = sub nsw i64 %169, %161
  %xtraiter = and i64 %170, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %indvars.iv.next.prol = add nsw i64 %161, 1
  %171 = icmp eq i32 %.03, %.031
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge87
  %.090 = phi i64 [ %..2.lcssa.lcssa, %._crit_edge87 ], [ 0, %.preheader.preheader ]
  %indvars.iv3889 = phi i64 [ %indvars.iv.next39, %._crit_edge87 ], [ %168, %.preheader.preheader ]
  %172 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv3889
  %173 = load [32 x i16]*, [32 x i16]** %172, align 8
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %174 = getelementptr inbounds [32 x i16], [32 x i16]* %173, i64 %161, i64 %166
  br label %175

; <label>:175:                                    ; preds = %175, %.lr.ph.prol
  %.283.prol = phi i64 [ %.090, %.lr.ph.prol ], [ %..2.prol, %175 ]
  %.682.prol = phi i16* [ %174, %.lr.ph.prol ], [ %180, %175 ]
  %.62881.prol = phi i32 [ %.02, %.lr.ph.prol ], [ %179, %175 ]
  %176 = load i16, i16* %.682.prol, align 2
  %177 = icmp ne i16 %176, 0
  %178 = zext i1 %177 to i64
  %..2.prol = add nsw i64 %178, %.283.prol
  %179 = add nsw i32 %.62881.prol, 1
  %180 = getelementptr inbounds i16, i16* %.682.prol, i64 1
  %181 = icmp slt i32 %.62881.prol, %.01
  br i1 %181, label %175, label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %175
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.preheader, %._crit_edge.prol
  %.185.unr.ph = phi i64 [ %..2.prol, %._crit_edge.prol ], [ %.090, %.preheader ]
  %indvars.iv84.unr.ph = phi i64 [ %indvars.iv.next.prol, %._crit_edge.prol ], [ %161, %.preheader ]
  %..2.lcssa.lcssa.unr.ph = phi i64 [ %..2.prol, %._crit_edge.prol ], [ undef, %.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  br i1 %171, label %._crit_edge87, label %.preheader.new

.preheader.new:                                   ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge.1, %.preheader.new
  %.185 = phi i64 [ %.185.unr.ph, %.preheader.new ], [ %..2.1, %._crit_edge.1 ]
  %indvars.iv84 = phi i64 [ %indvars.iv84.unr.ph, %.preheader.new ], [ %indvars.iv.next.1, %._crit_edge.1 ]
  %182 = getelementptr inbounds [32 x i16], [32 x i16]* %173, i64 %indvars.iv84, i64 %166
  br label %183

; <label>:183:                                    ; preds = %183, %.lr.ph
  %.283 = phi i64 [ %.185, %.lr.ph ], [ %..2, %183 ]
  %.682 = phi i16* [ %182, %.lr.ph ], [ %188, %183 ]
  %.62881 = phi i32 [ %.02, %.lr.ph ], [ %187, %183 ]
  %184 = load i16, i16* %.682, align 2
  %185 = icmp ne i16 %184, 0
  %186 = zext i1 %185 to i64
  %..2 = add nsw i64 %186, %.283
  %187 = add nsw i32 %.62881, 1
  %188 = getelementptr inbounds i16, i16* %.682, i64 1
  %189 = icmp slt i32 %.62881, %.01
  br i1 %189, label %183, label %._crit_edge

._crit_edge:                                      ; preds = %183
  %indvars.iv.next = add nsw i64 %indvars.iv84, 1
  %190 = getelementptr inbounds [32 x i16], [32 x i16]* %173, i64 %indvars.iv.next, i64 %166
  br label %193

._crit_edge87.unr-lcssa:                          ; preds = %._crit_edge.1
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %.lr.ph.prol.loopexit, %._crit_edge87.unr-lcssa
  %..2.lcssa.lcssa = phi i64 [ %..2.lcssa.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %..2.1, %._crit_edge87.unr-lcssa ]
  %indvars.iv.next39 = add nsw i64 %indvars.iv3889, 1
  %191 = icmp slt i64 %indvars.iv3889, %163
  br i1 %191, label %.preheader, label %._crit_edge91.loopexit

._crit_edge91.loopexit:                           ; preds = %._crit_edge87
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91.loopexit, %.preheader.lr.ph, %.loopexit
  %.0.lcssa = phi i64 [ 0, %.loopexit ], [ 0, %.preheader.lr.ph ], [ %..2.lcssa.lcssa, %._crit_edge91.loopexit ]
  %192 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 7
  store i64 %.0.lcssa, i64* %192, align 8
  ret void

; <label>:193:                                    ; preds = %193, %._crit_edge
  %.283.1 = phi i64 [ %..2, %._crit_edge ], [ %..2.1, %193 ]
  %.682.1 = phi i16* [ %190, %._crit_edge ], [ %198, %193 ]
  %.62881.1 = phi i32 [ %.02, %._crit_edge ], [ %197, %193 ]
  %194 = load i16, i16* %.682.1, align 2
  %195 = icmp ne i16 %194, 0
  %196 = zext i1 %195 to i64
  %..2.1 = add nsw i64 %196, %.283.1
  %197 = add nsw i32 %.62881.1, 1
  %198 = getelementptr inbounds i16, i16* %.682.1, i64 1
  %199 = icmp slt i32 %.62881.1, %.01
  br i1 %199, label %193, label %._crit_edge.1

._crit_edge.1:                                    ; preds = %193
  %indvars.iv.next.1 = add nsw i64 %indvars.iv84, 2
  %200 = icmp slt i64 %indvars.iv.next, %162
  br i1 %200, label %.lr.ph, label %._crit_edge87.unr-lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal i32 @median_cut(%struct.jpeg_decompress_struct* nocapture readonly, %struct.box*, i32, i32) #1 {
  %5 = sext i32 %2 to i64
  %6 = sext i32 %3 to i64
  %7 = icmp slt i32 %2, %3
  br i1 %7, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %62
  %indvars.iv9 = phi i64 [ %indvars.iv.next, %62 ], [ %5, %.lr.ph.preheader ]
  %8 = shl nsw i64 %indvars.iv9, 1
  %9 = icmp sgt i64 %8, %6
  %10 = trunc i64 %indvars.iv9 to i32
  br i1 %9, label %13, label %11

; <label>:11:                                     ; preds = %.lr.ph
  %12 = tail call %struct.box* @find_biggest_color_pop(%struct.box* %1, i32 %10)
  br label %15

; <label>:13:                                     ; preds = %.lr.ph
  %14 = tail call %struct.box* @find_biggest_volume(%struct.box* %1, i32 %10)
  br label %15

; <label>:15:                                     ; preds = %13, %11
  %.0 = phi %struct.box* [ %12, %11 ], [ %14, %13 ]
  %16 = icmp eq %struct.box* %.0, null
  br i1 %16, label %.loopexit.loopexit, label %17

; <label>:17:                                     ; preds = %15
  %18 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv9
  %19 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 1
  %20 = load i32, i32* %19, align 4
  %21 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv9, i32 1
  store i32 %20, i32* %21, align 4
  %22 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 3
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv9, i32 3
  store i32 %23, i32* %24, align 4
  %25 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 5
  %26 = load i32, i32* %25, align 4
  %27 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv9, i32 5
  store i32 %26, i32* %27, align 4
  %28 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 0
  %29 = load i32, i32* %28, align 8
  %30 = getelementptr inbounds %struct.box, %struct.box* %18, i64 0, i32 0
  store i32 %29, i32* %30, align 8
  %31 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 2
  %32 = load i32, i32* %31, align 8
  %33 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv9, i32 2
  store i32 %32, i32* %33, align 8
  %34 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 4
  %35 = load i32, i32* %34, align 8
  %36 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv9, i32 4
  store i32 %35, i32* %36, align 8
  %37 = load i32, i32* %19, align 4
  %38 = load i32, i32* %28, align 8
  %39 = sub nsw i32 %37, %38
  %40 = shl i32 %39, 4
  %41 = load i32, i32* %22, align 4
  %42 = load i32, i32* %31, align 8
  %43 = sub nsw i32 %41, %42
  %44 = mul i32 %43, 12
  %45 = load i32, i32* %25, align 4
  %46 = load i32, i32* %34, align 8
  %47 = sub nsw i32 %45, %46
  %48 = shl i32 %47, 3
  %49 = icmp sgt i32 %40, %44
  %not. = xor i1 %49, true
  %.6 = select i1 %49, i32 %40, i32 %44
  %50 = icmp sgt i32 %48, %.6
  %51 = zext i1 %not. to i2
  %trunc = select i1 %50, i2 -2, i2 %51
  switch i2 %trunc, label %62 [
    i2 0, label %52
    i2 1, label %55
    i2 -2, label %58
  ]

; <label>:52:                                     ; preds = %17
  %53 = add nsw i32 %38, %37
  %54 = sdiv i32 %53, 2
  store i32 %54, i32* %19, align 4
  br label %.sink.split

; <label>:55:                                     ; preds = %17
  %56 = add nsw i32 %42, %41
  %57 = sdiv i32 %56, 2
  store i32 %57, i32* %22, align 4
  br label %.sink.split

; <label>:58:                                     ; preds = %17
  %59 = add nsw i32 %46, %45
  %60 = sdiv i32 %59, 2
  store i32 %60, i32* %25, align 4
  br label %.sink.split

.sink.split:                                      ; preds = %52, %55, %58
  %.sink8 = phi i32 [ %60, %58 ], [ %57, %55 ], [ %54, %52 ]
  %.sink7 = phi i32* [ %36, %58 ], [ %33, %55 ], [ %30, %52 ]
  %61 = add nsw i32 %.sink8, 1
  store i32 %61, i32* %.sink7, align 8
  br label %62

; <label>:62:                                     ; preds = %.sink.split, %17
  tail call void @update_box(%struct.jpeg_decompress_struct* %0, %struct.box* nonnull %.0)
  tail call void @update_box(%struct.jpeg_decompress_struct* %0, %struct.box* %18)
  %indvars.iv.next = add nsw i64 %indvars.iv9, 1
  %63 = icmp slt i64 %indvars.iv.next, %6
  br i1 %63, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %15, %62
  %indvars.iv.lcssa.ph = phi i64 [ %indvars.iv9, %15 ], [ %indvars.iv.next, %62 ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
  %indvars.iv.lcssa = phi i64 [ %5, %4 ], [ %indvars.iv.lcssa.ph, %.loopexit.loopexit ]
  %64 = trunc i64 %indvars.iv.lcssa to i32
  ret i32 %64
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @compute_color(%struct.jpeg_decompress_struct* nocapture readonly, %struct.box* nocapture readonly, i32) #1 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %5 = bitcast %struct.jpeg_color_quantizer** %4 to %struct.my_cquantizer**
  %6 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %7 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %6, i64 0, i32 3
  %8 = load [32 x i16]**, [32 x i16]*** %7, align 8
  %9 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 0
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 2
  %14 = load i32, i32* %13, align 8
  %15 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 4
  %18 = load i32, i32* %17, align 8
  %19 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 5
  %20 = load i32, i32* %19, align 4
  %21 = sext i32 %18 to i64
  %22 = sext i32 %20 to i64
  %23 = sext i32 %14 to i64
  %24 = sext i32 %16 to i64
  %25 = sext i32 %12 to i64
  %26 = icmp sgt i32 %10, %12
  br i1 %26, label %._crit_edge46, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %3
  %27 = icmp sgt i32 %14, %16
  %28 = icmp sgt i32 %18, %20
  br i1 %27, label %._crit_edge46, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %29 = sext i32 %10 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge36
  %.045 = phi i64 [ %split40, %._crit_edge36 ], [ 0, %.preheader.preheader ]
  %.0144 = phi i64 [ %split39, %._crit_edge36 ], [ 0, %.preheader.preheader ]
  %.0543 = phi i64 [ %split38, %._crit_edge36 ], [ 0, %.preheader.preheader ]
  %.0942 = phi i64 [ %split37, %._crit_edge36 ], [ 0, %.preheader.preheader ]
  %indvars.iv1941 = phi i64 [ %indvars.iv.next20, %._crit_edge36 ], [ %29, %.preheader.preheader ]
  %30 = getelementptr inbounds [32 x i16]*, [32 x i16]** %8, i64 %indvars.iv1941
  %31 = load [32 x i16]*, [32 x i16]** %30, align 8
  %32 = trunc i64 %indvars.iv1941 to i32
  %33 = shl i32 %32, 3
  %34 = or i32 %33, 4
  %35 = sext i32 %34 to i64
  br i1 %28, label %._crit_edge36, label %.lr.ph35.split.preheader

.lr.ph35.split.preheader:                         ; preds = %.preheader
  br label %.lr.ph35.split

.lr.ph35.split:                                   ; preds = %.lr.ph35.split.preheader, %._crit_edge
  %.134 = phi i64 [ %.3, %._crit_edge ], [ %.045, %.lr.ph35.split.preheader ]
  %.1233 = phi i64 [ %.34, %._crit_edge ], [ %.0144, %.lr.ph35.split.preheader ]
  %.1632 = phi i64 [ %.38, %._crit_edge ], [ %.0543, %.lr.ph35.split.preheader ]
  %.11031 = phi i64 [ %.312, %._crit_edge ], [ %.0942, %.lr.ph35.split.preheader ]
  %indvars.iv1730 = phi i64 [ %indvars.iv.next18, %._crit_edge ], [ %23, %.lr.ph35.split.preheader ]
  %36 = getelementptr inbounds [32 x i16], [32 x i16]* %31, i64 %indvars.iv1730, i64 %21
  %37 = trunc i64 %indvars.iv1730 to i32
  %38 = shl i32 %37, 2
  %39 = or i32 %38, 2
  %40 = sext i32 %39 to i64
  br label %41

; <label>:41:                                     ; preds = %.lr.ph35.split, %58
  %.226 = phi i64 [ %.134, %.lr.ph35.split ], [ %.3, %58 ]
  %.2325 = phi i64 [ %.1233, %.lr.ph35.split ], [ %.34, %58 ]
  %.2724 = phi i64 [ %.1632, %.lr.ph35.split ], [ %.38, %58 ]
  %.21123 = phi i64 [ %.11031, %.lr.ph35.split ], [ %.312, %58 ]
  %.01422 = phi i16* [ %36, %.lr.ph35.split ], [ %42, %58 ]
  %indvars.iv21 = phi i64 [ %21, %.lr.ph35.split ], [ %indvars.iv.next, %58 ]
  %42 = getelementptr inbounds i16, i16* %.01422, i64 1
  %43 = load i16, i16* %.01422, align 2
  %44 = zext i16 %43 to i64
  %45 = icmp eq i16 %43, 0
  br i1 %45, label %58, label %46

; <label>:46:                                     ; preds = %41
  %47 = add nsw i64 %44, %.21123
  %48 = mul nsw i64 %44, %35
  %49 = add nsw i64 %48, %.2724
  %50 = mul nsw i64 %44, %40
  %51 = add nsw i64 %50, %.2325
  %52 = trunc i64 %indvars.iv21 to i32
  %53 = shl i32 %52, 3
  %54 = or i32 %53, 4
  %55 = sext i32 %54 to i64
  %56 = mul nsw i64 %44, %55
  %57 = add nsw i64 %56, %.226
  br label %58

; <label>:58:                                     ; preds = %41, %46
  %.312 = phi i64 [ %47, %46 ], [ %.21123, %41 ]
  %.38 = phi i64 [ %49, %46 ], [ %.2724, %41 ]
  %.34 = phi i64 [ %51, %46 ], [ %.2325, %41 ]
  %.3 = phi i64 [ %57, %46 ], [ %.226, %41 ]
  %indvars.iv.next = add nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv21, %22
  br i1 %exitcond, label %._crit_edge, label %41

._crit_edge:                                      ; preds = %58
  %indvars.iv.next18 = add nsw i64 %indvars.iv1730, 1
  %exitcond86 = icmp eq i64 %indvars.iv1730, %24
  br i1 %exitcond86, label %._crit_edge36.loopexit, label %.lr.ph35.split

._crit_edge36.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36.loopexit, %.preheader
  %split37 = phi i64 [ %.0942, %.preheader ], [ %.312, %._crit_edge36.loopexit ]
  %split38 = phi i64 [ %.0543, %.preheader ], [ %.38, %._crit_edge36.loopexit ]
  %split39 = phi i64 [ %.0144, %.preheader ], [ %.34, %._crit_edge36.loopexit ]
  %split40 = phi i64 [ %.045, %.preheader ], [ %.3, %._crit_edge36.loopexit ]
  %indvars.iv.next20 = add nsw i64 %indvars.iv1941, 1
  %exitcond88 = icmp eq i64 %indvars.iv1941, %25
  br i1 %exitcond88, label %._crit_edge46.loopexit, label %.preheader

._crit_edge46.loopexit:                           ; preds = %._crit_edge36
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %.preheader.lr.ph, %3
  %.09.lcssa = phi i64 [ 0, %3 ], [ 0, %.preheader.lr.ph ], [ %split37, %._crit_edge46.loopexit ]
  %.05.lcssa = phi i64 [ 0, %3 ], [ 0, %.preheader.lr.ph ], [ %split38, %._crit_edge46.loopexit ]
  %.01.lcssa = phi i64 [ 0, %3 ], [ 0, %.preheader.lr.ph ], [ %split39, %._crit_edge46.loopexit ]
  %.0.lcssa = phi i64 [ 0, %3 ], [ 0, %.preheader.lr.ph ], [ %split40, %._crit_edge46.loopexit ]
  %59 = ashr i64 %.09.lcssa, 1
  %60 = add nsw i64 %.05.lcssa, %59
  %61 = sdiv i64 %60, %.09.lcssa
  %62 = trunc i64 %61 to i8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %64 = load i8**, i8*** %63, align 8
  %65 = load i8*, i8** %64, align 8
  %66 = sext i32 %2 to i64
  %67 = getelementptr inbounds i8, i8* %65, i64 %66
  store i8 %62, i8* %67, align 1
  %68 = add nsw i64 %.01.lcssa, %59
  %69 = sdiv i64 %68, %.09.lcssa
  %70 = trunc i64 %69 to i8
  %71 = load i8**, i8*** %63, align 8
  %72 = getelementptr inbounds i8*, i8** %71, i64 1
  %73 = load i8*, i8** %72, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 %66
  store i8 %70, i8* %74, align 1
  %75 = add nsw i64 %.0.lcssa, %59
  %76 = sdiv i64 %75, %.09.lcssa
  %77 = trunc i64 %76 to i8
  %78 = load i8**, i8*** %63, align 8
  %79 = getelementptr inbounds i8*, i8** %78, i64 2
  %80 = load i8*, i8** %79, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 %66
  store i8 %77, i8* %81, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal %struct.box* @find_biggest_color_pop(%struct.box* readonly, i32) #4 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %4 = getelementptr inbounds %struct.box, %struct.box* %0, i64 0, i32 7
  %5 = load i64, i64* %4, align 8
  %6 = icmp sgt i64 %5, 0
  br i1 %6, label %7, label %11

; <label>:7:                                      ; preds = %.lr.ph.prol
  %8 = getelementptr inbounds %struct.box, %struct.box* %0, i64 0, i32 6
  %9 = load i64, i64* %8, align 8
  %10 = icmp sgt i64 %9, 0
  %..01.prol = select i1 %10, i64 %5, i64 0
  %.03..0.prol = select i1 %10, %struct.box* %0, %struct.box* null
  br label %11

; <label>:11:                                     ; preds = %7, %.lr.ph.prol
  %.12.prol = phi i64 [ 0, %.lr.ph.prol ], [ %..01.prol, %7 ]
  %.1.prol = phi %struct.box* [ null, %.lr.ph.prol ], [ %.03..0.prol, %7 ]
  %12 = getelementptr inbounds %struct.box, %struct.box* %0, i64 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %11
  %.08.unr = phi %struct.box* [ null, %.lr.ph.preheader ], [ %.1.prol, %11 ]
  %.017.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %.12.prol, %11 ]
  %.036.unr = phi %struct.box* [ %0, %.lr.ph.preheader ], [ %12, %11 ]
  %.045.unr = phi i32 [ 0, %.lr.ph.preheader ], [ 1, %11 ]
  %.1.lcssa.unr = phi %struct.box* [ undef, %.lr.ph.preheader ], [ %.1.prol, %11 ]
  %13 = icmp eq i32 %1, 1
  br i1 %13, label %._crit_edge, label %.lr.ph.preheader12

.lr.ph.preheader12:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader12, %29
  %.08 = phi %struct.box* [ %.1.1, %29 ], [ %.08.unr, %.lr.ph.preheader12 ]
  %.017 = phi i64 [ %.12.1, %29 ], [ %.017.unr, %.lr.ph.preheader12 ]
  %.036 = phi %struct.box* [ %31, %29 ], [ %.036.unr, %.lr.ph.preheader12 ]
  %.045 = phi i32 [ %30, %29 ], [ %.045.unr, %.lr.ph.preheader12 ]
  %14 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 0, i32 7
  %15 = load i64, i64* %14, align 8
  %16 = icmp sgt i64 %15, %.017
  br i1 %16, label %17, label %.lr.ph.19

; <label>:17:                                     ; preds = %.lr.ph
  %18 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 0, i32 6
  %19 = load i64, i64* %18, align 8
  %20 = icmp sgt i64 %19, 0
  %..01 = select i1 %20, i64 %15, i64 %.017
  %.03..0 = select i1 %20, %struct.box* %.036, %struct.box* %.08
  br label %.lr.ph.19

.lr.ph.19:                                        ; preds = %17, %.lr.ph
  %.12 = phi i64 [ %.017, %.lr.ph ], [ %..01, %17 ]
  %.1 = phi %struct.box* [ %.08, %.lr.ph ], [ %.03..0, %17 ]
  %21 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 1, i32 7
  %22 = load i64, i64* %21, align 8
  %23 = icmp sgt i64 %22, %.12
  br i1 %23, label %24, label %29

._crit_edge.loopexit:                             ; preds = %29
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  %.0.lcssa = phi %struct.box* [ null, %2 ], [ %.1.lcssa.unr, %.lr.ph.prol.loopexit ], [ %.1.1, %._crit_edge.loopexit ]
  ret %struct.box* %.0.lcssa

; <label>:24:                                     ; preds = %.lr.ph.19
  %25 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 1
  %26 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 1, i32 6
  %27 = load i64, i64* %26, align 8
  %28 = icmp sgt i64 %27, 0
  %..01.1 = select i1 %28, i64 %22, i64 %.12
  %.03..0.1 = select i1 %28, %struct.box* %25, %struct.box* %.1
  br label %29

; <label>:29:                                     ; preds = %24, %.lr.ph.19
  %.12.1 = phi i64 [ %.12, %.lr.ph.19 ], [ %..01.1, %24 ]
  %.1.1 = phi %struct.box* [ %.1, %.lr.ph.19 ], [ %.03..0.1, %24 ]
  %30 = add nsw i32 %.045, 2
  %31 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 2
  %exitcond.1 = icmp eq i32 %30, %1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal %struct.box* @find_biggest_volume(%struct.box* readonly, i32) #4 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %4 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.08.prol = phi %struct.box* [ %.03..0.prol, %.lr.ph.prol ], [ null, %.lr.ph.prol.preheader ]
  %.017.prol = phi i64 [ %..01.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %.036.prol = phi %struct.box* [ %9, %.lr.ph.prol ], [ %0, %.lr.ph.prol.preheader ]
  %.045.prol = phi i32 [ %8, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %5 = getelementptr inbounds %struct.box, %struct.box* %.036.prol, i64 0, i32 6
  %6 = load i64, i64* %5, align 8
  %7 = icmp sgt i64 %6, %.017.prol
  %..01.prol = select i1 %7, i64 %6, i64 %.017.prol
  %.03..0.prol = select i1 %7, %struct.box* %.036.prol, %struct.box* %.08.prol
  %8 = add nuw nsw i32 %.045.prol, 1
  %9 = getelementptr inbounds %struct.box, %struct.box* %.036.prol, i64 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.08.unr = phi %struct.box* [ null, %.lr.ph.preheader ], [ %.03..0.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.017.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %..01.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.036.unr = phi %struct.box* [ %0, %.lr.ph.preheader ], [ %9, %.lr.ph.prol.loopexit.loopexit ]
  %.045.unr = phi i32 [ 0, %.lr.ph.preheader ], [ %8, %.lr.ph.prol.loopexit.loopexit ]
  %.03..0.lcssa.unr = phi %struct.box* [ undef, %.lr.ph.preheader ], [ %.03..0.prol, %.lr.ph.prol.loopexit.loopexit ]
  %10 = icmp ult i32 %4, 3
  br i1 %10, label %._crit_edge, label %.lr.ph.preheader13

.lr.ph.preheader13:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader13, %.lr.ph
  %.08 = phi %struct.box* [ %.03..0.3, %.lr.ph ], [ %.08.unr, %.lr.ph.preheader13 ]
  %.017 = phi i64 [ %..01.3, %.lr.ph ], [ %.017.unr, %.lr.ph.preheader13 ]
  %.036 = phi %struct.box* [ %27, %.lr.ph ], [ %.036.unr, %.lr.ph.preheader13 ]
  %.045 = phi i32 [ %26, %.lr.ph ], [ %.045.unr, %.lr.ph.preheader13 ]
  %11 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 0, i32 6
  %12 = load i64, i64* %11, align 8
  %13 = icmp sgt i64 %12, %.017
  %..01 = select i1 %13, i64 %12, i64 %.017
  %.03..0 = select i1 %13, %struct.box* %.036, %struct.box* %.08
  %14 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 1
  %15 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 1, i32 6
  %16 = load i64, i64* %15, align 8
  %17 = icmp sgt i64 %16, %..01
  %..01.1 = select i1 %17, i64 %16, i64 %..01
  %.03..0.1 = select i1 %17, %struct.box* %14, %struct.box* %.03..0
  %18 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 2
  %19 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 2, i32 6
  %20 = load i64, i64* %19, align 8
  %21 = icmp sgt i64 %20, %..01.1
  %..01.2 = select i1 %21, i64 %20, i64 %..01.1
  %.03..0.2 = select i1 %21, %struct.box* %18, %struct.box* %.03..0.1
  %22 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 3
  %23 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 3, i32 6
  %24 = load i64, i64* %23, align 8
  %25 = icmp sgt i64 %24, %..01.2
  %..01.3 = select i1 %25, i64 %24, i64 %..01.2
  %.03..0.3 = select i1 %25, %struct.box* %22, %struct.box* %.03..0.2
  %26 = add nsw i32 %.045, 4
  %27 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 4
  %exitcond.3 = icmp eq i32 %26, %1
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  %.0.lcssa = phi %struct.box* [ null, %2 ], [ %.03..0.lcssa.unr, %.lr.ph.prol.loopexit ], [ %.03..0.3, %._crit_edge.loopexit ]
  ret %struct.box* %.0.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @fill_inverse_cmap(%struct.jpeg_decompress_struct* nocapture readonly, i32, i32, i32) #1 {
  %5 = alloca [256 x i8], align 16
  %6 = alloca [128 x i8], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %8 = bitcast %struct.jpeg_color_quantizer** %7 to %struct.my_cquantizer**
  %9 = load %struct.my_cquantizer*, %struct.my_cquantizer** %8, align 8
  %10 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %9, i64 0, i32 3
  %11 = load [32 x i16]**, [32 x i16]*** %10, align 8
  %12 = ashr i32 %1, 2
  %13 = ashr i32 %2, 3
  %14 = ashr i32 %3, 2
  %15 = shl i32 %12, 5
  %16 = or i32 %15, 4
  %17 = shl i32 %13, 5
  %18 = or i32 %17, 2
  %19 = shl i32 %14, 5
  %20 = or i32 %19, 4
  %21 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i64 0, i64 0
  %22 = call i32 @find_nearby_colors(%struct.jpeg_decompress_struct* %0, i32 %16, i32 %18, i32 %20, i8* nonnull %21)
  %23 = getelementptr inbounds [128 x i8], [128 x i8]* %6, i64 0, i64 0
  call void @find_best_colors(%struct.jpeg_decompress_struct* %0, i32 %16, i32 %18, i32 %20, i32 %22, i8* nonnull %21, i8* nonnull %23)
  %24 = shl nsw i32 %12, 2
  %25 = shl nsw i32 %13, 3
  %26 = shl nsw i32 %14, 2
  %27 = sext i32 %25 to i64
  %28 = sext i32 %24 to i64
  %29 = sext i32 %26 to i64
  %30 = or i64 %27, 1
  %31 = or i64 %27, 2
  %32 = or i64 %27, 3
  %33 = or i64 %27, 4
  %34 = or i64 %27, 5
  %35 = or i64 %27, 6
  %36 = or i64 %27, 7
  br label %38

; <label>:37:                                     ; preds = %38
  ret void

; <label>:38:                                     ; preds = %38, %4
  %.0115 = phi i8* [ %23, %4 ], [ %scevgep5, %38 ]
  %indvars.iv714 = phi i64 [ 0, %4 ], [ %indvars.iv.next8, %38 ]
  %39 = add nsw i64 %indvars.iv714, %28
  %40 = getelementptr inbounds [32 x i16]*, [32 x i16]** %11, i64 %39
  %41 = load [32 x i16]*, [32 x i16]** %40, align 8
  %42 = getelementptr inbounds [32 x i16], [32 x i16]* %41, i64 %27, i64 %29
  %lftr.limit = getelementptr i8, i8* %.0115, i64 4
  %43 = getelementptr inbounds i8, i8* %.0115, i64 1
  %44 = load i8, i8* %.0115, align 1
  %45 = zext i8 %44 to i16
  %46 = add nuw nsw i16 %45, 1
  %47 = getelementptr inbounds i16, i16* %42, i64 1
  store i16 %46, i16* %42, align 2
  %48 = getelementptr inbounds i8, i8* %.0115, i64 2
  %49 = load i8, i8* %43, align 1
  %50 = zext i8 %49 to i16
  %51 = add nuw nsw i16 %50, 1
  %52 = getelementptr inbounds i16, i16* %42, i64 2
  store i16 %51, i16* %47, align 2
  %53 = getelementptr inbounds i8, i8* %.0115, i64 3
  %54 = load i8, i8* %48, align 1
  %55 = zext i8 %54 to i16
  %56 = add nuw nsw i16 %55, 1
  %57 = getelementptr inbounds i16, i16* %42, i64 3
  store i16 %56, i16* %52, align 2
  %58 = load i8, i8* %53, align 1
  %59 = zext i8 %58 to i16
  %60 = add nuw nsw i16 %59, 1
  store i16 %60, i16* %57, align 2
  %61 = load [32 x i16]*, [32 x i16]** %40, align 8
  %62 = getelementptr inbounds [32 x i16], [32 x i16]* %61, i64 %30, i64 %29
  %lftr.limit.1 = getelementptr i8, i8* %.0115, i64 8
  %63 = getelementptr inbounds i8, i8* %.0115, i64 5
  %64 = load i8, i8* %lftr.limit, align 1
  %65 = zext i8 %64 to i16
  %66 = add nuw nsw i16 %65, 1
  %67 = getelementptr inbounds i16, i16* %62, i64 1
  store i16 %66, i16* %62, align 2
  %68 = getelementptr inbounds i8, i8* %.0115, i64 6
  %69 = load i8, i8* %63, align 1
  %70 = zext i8 %69 to i16
  %71 = add nuw nsw i16 %70, 1
  %72 = getelementptr inbounds i16, i16* %62, i64 2
  store i16 %71, i16* %67, align 2
  %73 = getelementptr inbounds i8, i8* %.0115, i64 7
  %74 = load i8, i8* %68, align 1
  %75 = zext i8 %74 to i16
  %76 = add nuw nsw i16 %75, 1
  %77 = getelementptr inbounds i16, i16* %62, i64 3
  store i16 %76, i16* %72, align 2
  %78 = load i8, i8* %73, align 1
  %79 = zext i8 %78 to i16
  %80 = add nuw nsw i16 %79, 1
  store i16 %80, i16* %77, align 2
  %81 = load [32 x i16]*, [32 x i16]** %40, align 8
  %82 = getelementptr inbounds [32 x i16], [32 x i16]* %81, i64 %31, i64 %29
  %lftr.limit.2 = getelementptr i8, i8* %.0115, i64 12
  %83 = getelementptr inbounds i8, i8* %.0115, i64 9
  %84 = load i8, i8* %lftr.limit.1, align 1
  %85 = zext i8 %84 to i16
  %86 = add nuw nsw i16 %85, 1
  %87 = getelementptr inbounds i16, i16* %82, i64 1
  store i16 %86, i16* %82, align 2
  %88 = getelementptr inbounds i8, i8* %.0115, i64 10
  %89 = load i8, i8* %83, align 1
  %90 = zext i8 %89 to i16
  %91 = add nuw nsw i16 %90, 1
  %92 = getelementptr inbounds i16, i16* %82, i64 2
  store i16 %91, i16* %87, align 2
  %93 = getelementptr inbounds i8, i8* %.0115, i64 11
  %94 = load i8, i8* %88, align 1
  %95 = zext i8 %94 to i16
  %96 = add nuw nsw i16 %95, 1
  %97 = getelementptr inbounds i16, i16* %82, i64 3
  store i16 %96, i16* %92, align 2
  %98 = load i8, i8* %93, align 1
  %99 = zext i8 %98 to i16
  %100 = add nuw nsw i16 %99, 1
  store i16 %100, i16* %97, align 2
  %101 = load [32 x i16]*, [32 x i16]** %40, align 8
  %102 = getelementptr inbounds [32 x i16], [32 x i16]* %101, i64 %32, i64 %29
  %lftr.limit.3 = getelementptr i8, i8* %.0115, i64 16
  %103 = getelementptr inbounds i8, i8* %.0115, i64 13
  %104 = load i8, i8* %lftr.limit.2, align 1
  %105 = zext i8 %104 to i16
  %106 = add nuw nsw i16 %105, 1
  %107 = getelementptr inbounds i16, i16* %102, i64 1
  store i16 %106, i16* %102, align 2
  %108 = getelementptr inbounds i8, i8* %.0115, i64 14
  %109 = load i8, i8* %103, align 1
  %110 = zext i8 %109 to i16
  %111 = add nuw nsw i16 %110, 1
  %112 = getelementptr inbounds i16, i16* %102, i64 2
  store i16 %111, i16* %107, align 2
  %113 = getelementptr inbounds i8, i8* %.0115, i64 15
  %114 = load i8, i8* %108, align 1
  %115 = zext i8 %114 to i16
  %116 = add nuw nsw i16 %115, 1
  %117 = getelementptr inbounds i16, i16* %102, i64 3
  store i16 %116, i16* %112, align 2
  %118 = load i8, i8* %113, align 1
  %119 = zext i8 %118 to i16
  %120 = add nuw nsw i16 %119, 1
  store i16 %120, i16* %117, align 2
  %121 = load [32 x i16]*, [32 x i16]** %40, align 8
  %122 = getelementptr inbounds [32 x i16], [32 x i16]* %121, i64 %33, i64 %29
  %lftr.limit.4 = getelementptr i8, i8* %.0115, i64 20
  %123 = getelementptr inbounds i8, i8* %.0115, i64 17
  %124 = load i8, i8* %lftr.limit.3, align 1
  %125 = zext i8 %124 to i16
  %126 = add nuw nsw i16 %125, 1
  %127 = getelementptr inbounds i16, i16* %122, i64 1
  store i16 %126, i16* %122, align 2
  %128 = getelementptr inbounds i8, i8* %.0115, i64 18
  %129 = load i8, i8* %123, align 1
  %130 = zext i8 %129 to i16
  %131 = add nuw nsw i16 %130, 1
  %132 = getelementptr inbounds i16, i16* %122, i64 2
  store i16 %131, i16* %127, align 2
  %133 = getelementptr inbounds i8, i8* %.0115, i64 19
  %134 = load i8, i8* %128, align 1
  %135 = zext i8 %134 to i16
  %136 = add nuw nsw i16 %135, 1
  %137 = getelementptr inbounds i16, i16* %122, i64 3
  store i16 %136, i16* %132, align 2
  %138 = load i8, i8* %133, align 1
  %139 = zext i8 %138 to i16
  %140 = add nuw nsw i16 %139, 1
  store i16 %140, i16* %137, align 2
  %141 = load [32 x i16]*, [32 x i16]** %40, align 8
  %142 = getelementptr inbounds [32 x i16], [32 x i16]* %141, i64 %34, i64 %29
  %lftr.limit.5 = getelementptr i8, i8* %.0115, i64 24
  %143 = getelementptr inbounds i8, i8* %.0115, i64 21
  %144 = load i8, i8* %lftr.limit.4, align 1
  %145 = zext i8 %144 to i16
  %146 = add nuw nsw i16 %145, 1
  %147 = getelementptr inbounds i16, i16* %142, i64 1
  store i16 %146, i16* %142, align 2
  %148 = getelementptr inbounds i8, i8* %.0115, i64 22
  %149 = load i8, i8* %143, align 1
  %150 = zext i8 %149 to i16
  %151 = add nuw nsw i16 %150, 1
  %152 = getelementptr inbounds i16, i16* %142, i64 2
  store i16 %151, i16* %147, align 2
  %153 = getelementptr inbounds i8, i8* %.0115, i64 23
  %154 = load i8, i8* %148, align 1
  %155 = zext i8 %154 to i16
  %156 = add nuw nsw i16 %155, 1
  %157 = getelementptr inbounds i16, i16* %142, i64 3
  store i16 %156, i16* %152, align 2
  %158 = load i8, i8* %153, align 1
  %159 = zext i8 %158 to i16
  %160 = add nuw nsw i16 %159, 1
  store i16 %160, i16* %157, align 2
  %161 = load [32 x i16]*, [32 x i16]** %40, align 8
  %162 = getelementptr inbounds [32 x i16], [32 x i16]* %161, i64 %35, i64 %29
  %lftr.limit.6 = getelementptr i8, i8* %.0115, i64 28
  %163 = getelementptr inbounds i8, i8* %.0115, i64 25
  %164 = load i8, i8* %lftr.limit.5, align 1
  %165 = zext i8 %164 to i16
  %166 = add nuw nsw i16 %165, 1
  %167 = getelementptr inbounds i16, i16* %162, i64 1
  store i16 %166, i16* %162, align 2
  %168 = getelementptr inbounds i8, i8* %.0115, i64 26
  %169 = load i8, i8* %163, align 1
  %170 = zext i8 %169 to i16
  %171 = add nuw nsw i16 %170, 1
  %172 = getelementptr inbounds i16, i16* %162, i64 2
  store i16 %171, i16* %167, align 2
  %173 = getelementptr inbounds i8, i8* %.0115, i64 27
  %174 = load i8, i8* %168, align 1
  %175 = zext i8 %174 to i16
  %176 = add nuw nsw i16 %175, 1
  %177 = getelementptr inbounds i16, i16* %162, i64 3
  store i16 %176, i16* %172, align 2
  %178 = load i8, i8* %173, align 1
  %179 = zext i8 %178 to i16
  %180 = add nuw nsw i16 %179, 1
  store i16 %180, i16* %177, align 2
  %181 = load [32 x i16]*, [32 x i16]** %40, align 8
  %182 = getelementptr inbounds [32 x i16], [32 x i16]* %181, i64 %36, i64 %29
  %183 = getelementptr inbounds i8, i8* %.0115, i64 29
  %184 = load i8, i8* %lftr.limit.6, align 1
  %185 = zext i8 %184 to i16
  %186 = add nuw nsw i16 %185, 1
  %187 = getelementptr inbounds i16, i16* %182, i64 1
  store i16 %186, i16* %182, align 2
  %188 = getelementptr inbounds i8, i8* %.0115, i64 30
  %189 = load i8, i8* %183, align 1
  %190 = zext i8 %189 to i16
  %191 = add nuw nsw i16 %190, 1
  %192 = getelementptr inbounds i16, i16* %182, i64 2
  store i16 %191, i16* %187, align 2
  %193 = getelementptr inbounds i8, i8* %.0115, i64 31
  %194 = load i8, i8* %188, align 1
  %195 = zext i8 %194 to i16
  %196 = add nuw nsw i16 %195, 1
  %197 = getelementptr inbounds i16, i16* %182, i64 3
  store i16 %196, i16* %192, align 2
  %198 = load i8, i8* %193, align 1
  %199 = zext i8 %198 to i16
  %200 = add nuw nsw i16 %199, 1
  store i16 %200, i16* %197, align 2
  %scevgep5 = getelementptr i8, i8* %.0115, i64 32
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv714, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 4
  br i1 %exitcond9, label %37, label %38
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal i32 @find_nearby_colors(%struct.jpeg_decompress_struct* nocapture readonly, i32, i32, i32, i8* nocapture) #1 {
  %6 = alloca [256 x i64], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  %8 = load i32, i32* %7, align 4
  %9 = add nsw i32 %1, 24
  %10 = add nsw i32 %9, %1
  %11 = ashr i32 %10, 1
  %12 = add nsw i32 %2, 28
  %13 = add nsw i32 %12, %2
  %14 = ashr i32 %13, 1
  %15 = add nsw i32 %3, 24
  %16 = add nsw i32 %15, %3
  %17 = ashr i32 %16, 1
  %18 = sext i32 %8 to i64
  %19 = icmp sgt i32 %8, 0
  br i1 %19, label %.lr.ph21, label %._crit_edge

.lr.ph21:                                         ; preds = %5
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %21 = load i8**, i8*** %20, align 8
  %22 = load i8*, i8** %21, align 8
  %23 = getelementptr inbounds i8*, i8** %21, i64 1
  %24 = load i8*, i8** %23, align 8
  %25 = getelementptr inbounds i8*, i8** %21, i64 2
  %26 = load i8*, i8** %25, align 8
  br label %33

.preheader:                                       ; preds = %143
  %27 = icmp sgt i32 %8, 0
  br i1 %27, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %28 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 0
  %29 = load i64, i64* %28, align 16
  %30 = icmp sgt i64 %29, %..07
  br i1 %30, label %.lr.ph.prol.loopexit, label %31

; <label>:31:                                     ; preds = %.lr.ph.prol
  store i8 0, i8* %4, align 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %31, %.lr.ph.preheader
  %.0917.unr = phi i32 [ 0, %.lr.ph.preheader ], [ 1, %31 ], [ 0, %.lr.ph.prol ]
  %indvars.iv16.unr = phi i64 [ 0, %.lr.ph.preheader ], [ 1, %31 ], [ 1, %.lr.ph.prol ]
  %.110.lcssa.unr = phi i32 [ undef, %.lr.ph.preheader ], [ 1, %31 ], [ 0, %.lr.ph.prol ]
  %32 = icmp eq i32 %8, 1
  br i1 %32, label %._crit_edge, label %.lr.ph.preheader26

.lr.ph.preheader26:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

; <label>:33:                                     ; preds = %143, %.lr.ph21
  %.0719 = phi i64 [ 2147483647, %.lr.ph21 ], [ %..07, %143 ]
  %indvars.iv1318 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next14, %143 ]
  %34 = getelementptr inbounds i8, i8* %22, i64 %indvars.iv1318
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = icmp slt i32 %36, %1
  br i1 %37, label %38, label %47

; <label>:38:                                     ; preds = %33
  %39 = sub nsw i32 %36, %1
  %40 = shl nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = mul nsw i64 %41, %41
  %43 = sub nsw i32 %36, %9
  %44 = shl nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = mul nsw i64 %45, %45
  br label %70

; <label>:47:                                     ; preds = %33
  %48 = icmp sgt i32 %36, %9
  br i1 %48, label %49, label %58

; <label>:49:                                     ; preds = %47
  %50 = sub nsw i32 %36, %9
  %51 = shl nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = mul nsw i64 %52, %52
  %54 = sub nsw i32 %36, %1
  %55 = shl nsw i32 %54, 1
  %56 = sext i32 %55 to i64
  %57 = mul nsw i64 %56, %56
  br label %70

; <label>:58:                                     ; preds = %47
  %59 = icmp sgt i32 %36, %11
  br i1 %59, label %65, label %60

; <label>:60:                                     ; preds = %58
  %61 = sub nsw i32 %36, %9
  %62 = shl nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = mul nsw i64 %63, %63
  br label %70

; <label>:65:                                     ; preds = %58
  %66 = sub nsw i32 %36, %1
  %67 = shl nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = mul nsw i64 %68, %68
  br label %70

; <label>:70:                                     ; preds = %49, %65, %60, %38
  %.12 = phi i64 [ %42, %38 ], [ %53, %49 ], [ 0, %65 ], [ 0, %60 ]
  %.2 = phi i64 [ %46, %38 ], [ %57, %49 ], [ %69, %65 ], [ %64, %60 ]
  %71 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv1318
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp slt i32 %73, %2
  br i1 %74, label %75, label %85

; <label>:75:                                     ; preds = %70
  %76 = sub nsw i32 %73, %2
  %77 = mul nsw i32 %76, 3
  %78 = sext i32 %77 to i64
  %79 = mul nsw i64 %78, %78
  %80 = add nuw nsw i64 %79, %.12
  %81 = sub nsw i32 %73, %12
  %82 = mul nsw i32 %81, 3
  %83 = sext i32 %82 to i64
  %84 = mul nsw i64 %83, %83
  br label %109

; <label>:85:                                     ; preds = %70
  %86 = icmp sgt i32 %73, %12
  br i1 %86, label %87, label %97

; <label>:87:                                     ; preds = %85
  %88 = sub nsw i32 %73, %12
  %89 = mul nsw i32 %88, 3
  %90 = sext i32 %89 to i64
  %91 = mul nsw i64 %90, %90
  %92 = add nuw nsw i64 %91, %.12
  %93 = sub nsw i32 %73, %2
  %94 = mul nsw i32 %93, 3
  %95 = sext i32 %94 to i64
  %96 = mul nsw i64 %95, %95
  br label %109

; <label>:97:                                     ; preds = %85
  %98 = icmp sgt i32 %73, %14
  br i1 %98, label %104, label %99

; <label>:99:                                     ; preds = %97
  %100 = sub nsw i32 %73, %12
  %101 = mul nsw i32 %100, 3
  %102 = sext i32 %101 to i64
  %103 = mul nsw i64 %102, %102
  br label %109

; <label>:104:                                    ; preds = %97
  %105 = sub nsw i32 %73, %2
  %106 = mul nsw i32 %105, 3
  %107 = sext i32 %106 to i64
  %108 = mul nsw i64 %107, %107
  br label %109

; <label>:109:                                    ; preds = %87, %104, %99, %75
  %.sink.sink.sink = phi i64 [ %84, %75 ], [ %96, %87 ], [ %108, %104 ], [ %103, %99 ]
  %.34 = phi i64 [ %80, %75 ], [ %92, %87 ], [ %.12, %104 ], [ %.12, %99 ]
  %110 = add nuw nsw i64 %.sink.sink.sink, %.2
  %111 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv1318
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp slt i32 %113, %3
  br i1 %114, label %115, label %123

; <label>:115:                                    ; preds = %109
  %116 = sub nsw i32 %113, %3
  %117 = sext i32 %116 to i64
  %118 = mul nsw i64 %117, %117
  %119 = add nsw i64 %118, %.34
  %120 = sub nsw i32 %113, %15
  %121 = sext i32 %120 to i64
  %122 = mul nsw i64 %121, %121
  br label %143

; <label>:123:                                    ; preds = %109
  %124 = icmp sgt i32 %113, %15
  br i1 %124, label %125, label %133

; <label>:125:                                    ; preds = %123
  %126 = sub nsw i32 %113, %15
  %127 = sext i32 %126 to i64
  %128 = mul nsw i64 %127, %127
  %129 = add nsw i64 %128, %.34
  %130 = sub nsw i32 %113, %3
  %131 = sext i32 %130 to i64
  %132 = mul nsw i64 %131, %131
  br label %143

; <label>:133:                                    ; preds = %123
  %134 = icmp sgt i32 %113, %17
  br i1 %134, label %139, label %135

; <label>:135:                                    ; preds = %133
  %136 = sub nsw i32 %113, %15
  %137 = sext i32 %136 to i64
  %138 = mul nsw i64 %137, %137
  br label %143

; <label>:139:                                    ; preds = %133
  %140 = sub nsw i32 %113, %3
  %141 = sext i32 %140 to i64
  %142 = mul nsw i64 %141, %141
  br label %143

; <label>:143:                                    ; preds = %125, %139, %135, %115
  %.sink15.sink.sink = phi i64 [ %122, %115 ], [ %132, %125 ], [ %142, %139 ], [ %138, %135 ]
  %.56 = phi i64 [ %119, %115 ], [ %129, %125 ], [ %.34, %139 ], [ %.34, %135 ]
  %144 = add nuw nsw i64 %110, %.sink15.sink.sink
  %145 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %indvars.iv1318
  store i64 %.56, i64* %145, align 8
  %146 = icmp slt i64 %144, %.0719
  %..07 = select i1 %146, i64 %144, i64 %.0719
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1318, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %18
  br i1 %exitcond, label %.preheader, label %33

.lr.ph:                                           ; preds = %.lr.ph.preheader26, %163
  %.0917 = phi i32 [ %.110.1, %163 ], [ %.0917.unr, %.lr.ph.preheader26 ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next.1, %163 ], [ %indvars.iv16.unr, %.lr.ph.preheader26 ]
  %147 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %indvars.iv16
  %148 = load i64, i64* %147, align 8
  %149 = icmp sgt i64 %148, %..07
  br i1 %149, label %.lr.ph.123, label %150

; <label>:150:                                    ; preds = %.lr.ph
  %151 = sext i32 %.0917 to i64
  %152 = getelementptr inbounds i8, i8* %4, i64 %151
  %153 = add nsw i32 %.0917, 1
  %154 = trunc i64 %indvars.iv16 to i8
  store i8 %154, i8* %152, align 1
  br label %.lr.ph.123

.lr.ph.123:                                       ; preds = %.lr.ph, %150
  %.110 = phi i32 [ %153, %150 ], [ %.0917, %.lr.ph ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv16, 1
  %155 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %indvars.iv.next
  %156 = load i64, i64* %155, align 8
  %157 = icmp sgt i64 %156, %..07
  br i1 %157, label %163, label %158

._crit_edge.loopexit:                             ; preds = %163
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5, %.lr.ph.prol.loopexit, %.preheader
  %.09.lcssa = phi i32 [ 0, %.preheader ], [ %.110.lcssa.unr, %.lr.ph.prol.loopexit ], [ 0, %5 ], [ %.110.1, %._crit_edge.loopexit ]
  ret i32 %.09.lcssa

; <label>:158:                                    ; preds = %.lr.ph.123
  %159 = sext i32 %.110 to i64
  %160 = getelementptr inbounds i8, i8* %4, i64 %159
  %161 = add nsw i32 %.110, 1
  %162 = trunc i64 %indvars.iv.next to i8
  store i8 %162, i8* %160, align 1
  br label %163

; <label>:163:                                    ; preds = %158, %.lr.ph.123
  %.110.1 = phi i32 [ %161, %158 ], [ %.110, %.lr.ph.123 ]
  %indvars.iv.next.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %18
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @find_best_colors(%struct.jpeg_decompress_struct* nocapture readonly, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture) #1 {
  %8 = alloca [128 x i64], align 16
  %9 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 0
  br label %10

; <label>:10:                                     ; preds = %7
  %11 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 1
  store i64 2147483647, i64* %9, align 16
  %12 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 2
  store i64 2147483647, i64* %11, align 8
  %13 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 3
  store i64 2147483647, i64* %12, align 16
  %14 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 4
  store i64 2147483647, i64* %13, align 8
  %15 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 5
  store i64 2147483647, i64* %14, align 16
  %16 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 6
  store i64 2147483647, i64* %15, align 8
  %17 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 7
  store i64 2147483647, i64* %16, align 16
  %18 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 8
  store i64 2147483647, i64* %17, align 8
  %19 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 9
  store i64 2147483647, i64* %18, align 16
  %20 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 10
  store i64 2147483647, i64* %19, align 8
  %21 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 11
  store i64 2147483647, i64* %20, align 16
  %22 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 12
  store i64 2147483647, i64* %21, align 8
  %23 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 13
  store i64 2147483647, i64* %22, align 16
  %24 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 14
  store i64 2147483647, i64* %23, align 8
  %25 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 15
  store i64 2147483647, i64* %24, align 16
  %26 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 16
  store i64 2147483647, i64* %25, align 8
  %27 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 17
  store i64 2147483647, i64* %26, align 16
  %28 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 18
  store i64 2147483647, i64* %27, align 8
  %29 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 19
  store i64 2147483647, i64* %28, align 16
  %30 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 20
  store i64 2147483647, i64* %29, align 8
  %31 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 21
  store i64 2147483647, i64* %30, align 16
  %32 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 22
  store i64 2147483647, i64* %31, align 8
  %33 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 23
  store i64 2147483647, i64* %32, align 16
  %34 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 24
  store i64 2147483647, i64* %33, align 8
  %35 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 25
  store i64 2147483647, i64* %34, align 16
  %36 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 26
  store i64 2147483647, i64* %35, align 8
  %37 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 27
  store i64 2147483647, i64* %36, align 16
  %38 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 28
  store i64 2147483647, i64* %37, align 8
  %39 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 29
  store i64 2147483647, i64* %38, align 16
  %40 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 30
  store i64 2147483647, i64* %39, align 8
  %41 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 31
  store i64 2147483647, i64* %40, align 16
  %42 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 32
  store i64 2147483647, i64* %41, align 8
  %43 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 33
  store i64 2147483647, i64* %42, align 16
  %44 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 34
  store i64 2147483647, i64* %43, align 8
  %45 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 35
  store i64 2147483647, i64* %44, align 16
  %46 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 36
  store i64 2147483647, i64* %45, align 8
  %47 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 37
  store i64 2147483647, i64* %46, align 16
  %48 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 38
  store i64 2147483647, i64* %47, align 8
  %49 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 39
  store i64 2147483647, i64* %48, align 16
  %50 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 40
  store i64 2147483647, i64* %49, align 8
  %51 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 41
  store i64 2147483647, i64* %50, align 16
  %52 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 42
  store i64 2147483647, i64* %51, align 8
  %53 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 43
  store i64 2147483647, i64* %52, align 16
  %54 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 44
  store i64 2147483647, i64* %53, align 8
  %55 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 45
  store i64 2147483647, i64* %54, align 16
  %56 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 46
  store i64 2147483647, i64* %55, align 8
  %57 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 47
  store i64 2147483647, i64* %56, align 16
  %58 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 48
  store i64 2147483647, i64* %57, align 8
  %59 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 49
  store i64 2147483647, i64* %58, align 16
  %60 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 50
  store i64 2147483647, i64* %59, align 8
  %61 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 51
  store i64 2147483647, i64* %60, align 16
  %62 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 52
  store i64 2147483647, i64* %61, align 8
  %63 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 53
  store i64 2147483647, i64* %62, align 16
  %64 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 54
  store i64 2147483647, i64* %63, align 8
  %65 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 55
  store i64 2147483647, i64* %64, align 16
  %66 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 56
  store i64 2147483647, i64* %65, align 8
  %67 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 57
  store i64 2147483647, i64* %66, align 16
  %68 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 58
  store i64 2147483647, i64* %67, align 8
  %69 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 59
  store i64 2147483647, i64* %68, align 16
  %70 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 60
  store i64 2147483647, i64* %69, align 8
  %71 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 61
  store i64 2147483647, i64* %70, align 16
  %72 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 62
  store i64 2147483647, i64* %71, align 8
  %73 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 63
  store i64 2147483647, i64* %72, align 16
  %74 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 64
  store i64 2147483647, i64* %73, align 8
  %75 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 65
  store i64 2147483647, i64* %74, align 16
  %76 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 66
  store i64 2147483647, i64* %75, align 8
  %77 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 67
  store i64 2147483647, i64* %76, align 16
  %78 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 68
  store i64 2147483647, i64* %77, align 8
  %79 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 69
  store i64 2147483647, i64* %78, align 16
  %80 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 70
  store i64 2147483647, i64* %79, align 8
  %81 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 71
  store i64 2147483647, i64* %80, align 16
  %82 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 72
  store i64 2147483647, i64* %81, align 8
  %83 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 73
  store i64 2147483647, i64* %82, align 16
  %84 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 74
  store i64 2147483647, i64* %83, align 8
  %85 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 75
  store i64 2147483647, i64* %84, align 16
  %86 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 76
  store i64 2147483647, i64* %85, align 8
  %87 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 77
  store i64 2147483647, i64* %86, align 16
  %88 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 78
  store i64 2147483647, i64* %87, align 8
  %89 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 79
  store i64 2147483647, i64* %88, align 16
  %90 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 80
  store i64 2147483647, i64* %89, align 8
  %91 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 81
  store i64 2147483647, i64* %90, align 16
  %92 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 82
  store i64 2147483647, i64* %91, align 8
  %93 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 83
  store i64 2147483647, i64* %92, align 16
  %94 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 84
  store i64 2147483647, i64* %93, align 8
  %95 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 85
  store i64 2147483647, i64* %94, align 16
  %96 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 86
  store i64 2147483647, i64* %95, align 8
  %97 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 87
  store i64 2147483647, i64* %96, align 16
  %98 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 88
  store i64 2147483647, i64* %97, align 8
  %99 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 89
  store i64 2147483647, i64* %98, align 16
  %100 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 90
  store i64 2147483647, i64* %99, align 8
  %101 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 91
  store i64 2147483647, i64* %100, align 16
  %102 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 92
  store i64 2147483647, i64* %101, align 8
  %103 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 93
  store i64 2147483647, i64* %102, align 16
  %104 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 94
  store i64 2147483647, i64* %103, align 8
  %105 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 95
  store i64 2147483647, i64* %104, align 16
  %106 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 96
  store i64 2147483647, i64* %105, align 8
  %107 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 97
  store i64 2147483647, i64* %106, align 16
  %108 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 98
  store i64 2147483647, i64* %107, align 8
  %109 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 99
  store i64 2147483647, i64* %108, align 16
  %110 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 100
  store i64 2147483647, i64* %109, align 8
  %111 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 101
  store i64 2147483647, i64* %110, align 16
  %112 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 102
  store i64 2147483647, i64* %111, align 8
  %113 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 103
  store i64 2147483647, i64* %112, align 16
  %114 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 104
  store i64 2147483647, i64* %113, align 8
  %115 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 105
  store i64 2147483647, i64* %114, align 16
  %116 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 106
  store i64 2147483647, i64* %115, align 8
  %117 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 107
  store i64 2147483647, i64* %116, align 16
  %118 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 108
  store i64 2147483647, i64* %117, align 8
  %119 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 109
  store i64 2147483647, i64* %118, align 16
  %120 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 110
  store i64 2147483647, i64* %119, align 8
  %121 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 111
  store i64 2147483647, i64* %120, align 16
  %122 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 112
  store i64 2147483647, i64* %121, align 8
  %123 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 113
  store i64 2147483647, i64* %122, align 16
  %124 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 114
  store i64 2147483647, i64* %123, align 8
  %125 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 115
  store i64 2147483647, i64* %124, align 16
  %126 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 116
  store i64 2147483647, i64* %125, align 8
  %127 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 117
  store i64 2147483647, i64* %126, align 16
  %128 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 118
  store i64 2147483647, i64* %127, align 8
  %129 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 119
  store i64 2147483647, i64* %128, align 16
  %130 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 120
  store i64 2147483647, i64* %129, align 8
  %131 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 121
  store i64 2147483647, i64* %130, align 16
  %132 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 122
  store i64 2147483647, i64* %131, align 8
  %133 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 123
  store i64 2147483647, i64* %132, align 16
  %134 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 124
  store i64 2147483647, i64* %133, align 8
  %135 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 125
  store i64 2147483647, i64* %134, align 16
  %136 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 126
  store i64 2147483647, i64* %135, align 8
  %137 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 127
  store i64 2147483647, i64* %136, align 16
  store i64 2147483647, i64* %137, align 8
  %138 = sext i32 %4 to i64
  %139 = icmp sgt i32 %4, 0
  br i1 %139, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %10
  %140 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %scevgep16 = getelementptr i8, i8* %6, i64 32
  %scevgep17 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 32
  %scevgep16.1 = getelementptr i8, i8* %6, i64 64
  %scevgep17.1 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 64
  %scevgep16.2 = getelementptr i8, i8* %6, i64 96
  %scevgep17.2 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 96
  br label %141

; <label>:141:                                    ; preds = %310, %.lr.ph
  %indvars.iv33 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %310 ]
  %142 = getelementptr inbounds i8, i8* %5, i64 %indvars.iv33
  %143 = load i8, i8* %142, align 1
  %144 = load i8**, i8*** %140, align 8
  %145 = load i8*, i8** %144, align 8
  %146 = zext i8 %143 to i64
  %147 = getelementptr inbounds i8, i8* %145, i64 %146
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i32
  %150 = sub nsw i32 %1, %149
  %151 = shl nsw i32 %150, 1
  %152 = sext i32 %151 to i64
  %153 = mul nsw i64 %152, %152
  %154 = getelementptr inbounds i8*, i8** %144, i64 1
  %155 = load i8*, i8** %154, align 8
  %156 = getelementptr inbounds i8, i8* %155, i64 %146
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i32
  %159 = sub nsw i32 %2, %158
  %160 = mul nsw i32 %159, 3
  %161 = sext i32 %160 to i64
  %162 = mul nsw i64 %161, %161
  %163 = add nuw nsw i64 %162, %153
  %164 = getelementptr inbounds i8*, i8** %144, i64 2
  %165 = load i8*, i8** %164, align 8
  %166 = getelementptr inbounds i8, i8* %165, i64 %146
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = sub nsw i32 %3, %168
  %170 = sext i32 %169 to i64
  %171 = mul nsw i64 %170, %170
  %172 = add nuw nsw i64 %163, %171
  %173 = shl nsw i64 %152, 5
  %174 = add nsw i64 %173, 256
  %175 = mul nsw i64 %161, 24
  %176 = add nsw i64 %175, 144
  %177 = shl nsw i64 %170, 4
  %178 = add nsw i64 %177, 64
  %179 = add nsw i64 %177, 192
  %180 = add nsw i64 %177, 320
  br label %181

; <label>:181:                                    ; preds = %141
  br label %182

; <label>:182:                                    ; preds = %210, %181
  %.0127 = phi i64 [ %176, %181 ], [ %212, %210 ]
  %.0426 = phi i64 [ %172, %181 ], [ %211, %210 ]
  %.0625 = phi i32 [ 7, %181 ], [ %213, %210 ]
  %.224 = phi i64* [ %9, %181 ], [ %scevgep15, %210 ]
  %.11323 = phi i8* [ %6, %181 ], [ %scevgep, %210 ]
  %183 = load i64, i64* %.224, align 8
  %184 = icmp slt i64 %.0426, %183
  br i1 %184, label %185, label %186

; <label>:185:                                    ; preds = %182
  store i64 %.0426, i64* %.224, align 8
  store i8 %143, i8* %.11323, align 1
  br label %186

; <label>:186:                                    ; preds = %185, %182
  %187 = add nsw i64 %178, %.0426
  %188 = getelementptr inbounds i64, i64* %.224, i64 1
  %189 = load i64, i64* %188, align 8
  %190 = icmp slt i64 %187, %189
  br i1 %190, label %194, label %196

; <label>:191:                                    ; preds = %210
  %192 = add nsw i64 %174, %172
  %193 = add nsw i64 %173, 768
  br label %215

._crit_edge.loopexit:                             ; preds = %310
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %10
  ret void

; <label>:194:                                    ; preds = %186
  %195 = getelementptr inbounds i8, i8* %.11323, i64 1
  store i64 %187, i64* %188, align 8
  store i8 %143, i8* %195, align 1
  br label %196

; <label>:196:                                    ; preds = %194, %186
  %197 = add nsw i64 %179, %187
  %198 = getelementptr inbounds i64, i64* %.224, i64 2
  %199 = load i64, i64* %198, align 8
  %200 = icmp slt i64 %197, %199
  br i1 %200, label %201, label %203

; <label>:201:                                    ; preds = %196
  %202 = getelementptr inbounds i8, i8* %.11323, i64 2
  store i64 %197, i64* %198, align 8
  store i8 %143, i8* %202, align 1
  br label %203

; <label>:203:                                    ; preds = %201, %196
  %204 = add nsw i64 %180, %197
  %205 = getelementptr inbounds i64, i64* %.224, i64 3
  %206 = load i64, i64* %205, align 8
  %207 = icmp slt i64 %204, %206
  br i1 %207, label %208, label %210

; <label>:208:                                    ; preds = %203
  %209 = getelementptr inbounds i8, i8* %.11323, i64 3
  store i64 %204, i64* %205, align 8
  store i8 %143, i8* %209, align 1
  br label %210

; <label>:210:                                    ; preds = %208, %203
  %scevgep = getelementptr i8, i8* %.11323, i64 4
  %scevgep15 = getelementptr i64, i64* %.224, i64 4
  %211 = add nsw i64 %.0127, %.0426
  %212 = add nsw i64 %.0127, 288
  %213 = add nsw i32 %.0625, -1
  %214 = icmp sgt i32 %.0625, 0
  br i1 %214, label %182, label %191

; <label>:215:                                    ; preds = %240, %191
  %.0127.1 = phi i64 [ %176, %191 ], [ %242, %240 ]
  %.0426.1 = phi i64 [ %192, %191 ], [ %241, %240 ]
  %.0625.1 = phi i32 [ 7, %191 ], [ %243, %240 ]
  %.224.1 = phi i64* [ %scevgep17, %191 ], [ %scevgep15.1, %240 ]
  %.11323.1 = phi i8* [ %scevgep16, %191 ], [ %scevgep.1, %240 ]
  %216 = load i64, i64* %.224.1, align 8
  %217 = icmp slt i64 %.0426.1, %216
  br i1 %217, label %218, label %219

; <label>:218:                                    ; preds = %215
  store i64 %.0426.1, i64* %.224.1, align 8
  store i8 %143, i8* %.11323.1, align 1
  br label %219

; <label>:219:                                    ; preds = %218, %215
  %220 = add nsw i64 %178, %.0426.1
  %221 = getelementptr inbounds i64, i64* %.224.1, i64 1
  %222 = load i64, i64* %221, align 8
  %223 = icmp slt i64 %220, %222
  br i1 %223, label %224, label %226

; <label>:224:                                    ; preds = %219
  %225 = getelementptr inbounds i8, i8* %.11323.1, i64 1
  store i64 %220, i64* %221, align 8
  store i8 %143, i8* %225, align 1
  br label %226

; <label>:226:                                    ; preds = %224, %219
  %227 = add nsw i64 %179, %220
  %228 = getelementptr inbounds i64, i64* %.224.1, i64 2
  %229 = load i64, i64* %228, align 8
  %230 = icmp slt i64 %227, %229
  br i1 %230, label %231, label %233

; <label>:231:                                    ; preds = %226
  %232 = getelementptr inbounds i8, i8* %.11323.1, i64 2
  store i64 %227, i64* %228, align 8
  store i8 %143, i8* %232, align 1
  br label %233

; <label>:233:                                    ; preds = %231, %226
  %234 = add nsw i64 %180, %227
  %235 = getelementptr inbounds i64, i64* %.224.1, i64 3
  %236 = load i64, i64* %235, align 8
  %237 = icmp slt i64 %234, %236
  br i1 %237, label %238, label %240

; <label>:238:                                    ; preds = %233
  %239 = getelementptr inbounds i8, i8* %.11323.1, i64 3
  store i64 %234, i64* %235, align 8
  store i8 %143, i8* %239, align 1
  br label %240

; <label>:240:                                    ; preds = %238, %233
  %scevgep.1 = getelementptr i8, i8* %.11323.1, i64 4
  %scevgep15.1 = getelementptr i64, i64* %.224.1, i64 4
  %241 = add nsw i64 %.0127.1, %.0426.1
  %242 = add nsw i64 %.0127.1, 288
  %243 = add nsw i32 %.0625.1, -1
  %244 = icmp sgt i32 %.0625.1, 0
  br i1 %244, label %215, label %245

; <label>:245:                                    ; preds = %240
  %246 = add nsw i64 %193, %192
  %247 = add nsw i64 %173, 1280
  br label %248

; <label>:248:                                    ; preds = %273, %245
  %.0127.2 = phi i64 [ %176, %245 ], [ %275, %273 ]
  %.0426.2 = phi i64 [ %246, %245 ], [ %274, %273 ]
  %.0625.2 = phi i32 [ 7, %245 ], [ %276, %273 ]
  %.224.2 = phi i64* [ %scevgep17.1, %245 ], [ %scevgep15.2, %273 ]
  %.11323.2 = phi i8* [ %scevgep16.1, %245 ], [ %scevgep.2, %273 ]
  %249 = load i64, i64* %.224.2, align 8
  %250 = icmp slt i64 %.0426.2, %249
  br i1 %250, label %251, label %252

; <label>:251:                                    ; preds = %248
  store i64 %.0426.2, i64* %.224.2, align 8
  store i8 %143, i8* %.11323.2, align 1
  br label %252

; <label>:252:                                    ; preds = %251, %248
  %253 = add nsw i64 %178, %.0426.2
  %254 = getelementptr inbounds i64, i64* %.224.2, i64 1
  %255 = load i64, i64* %254, align 8
  %256 = icmp slt i64 %253, %255
  br i1 %256, label %257, label %259

; <label>:257:                                    ; preds = %252
  %258 = getelementptr inbounds i8, i8* %.11323.2, i64 1
  store i64 %253, i64* %254, align 8
  store i8 %143, i8* %258, align 1
  br label %259

; <label>:259:                                    ; preds = %257, %252
  %260 = add nsw i64 %179, %253
  %261 = getelementptr inbounds i64, i64* %.224.2, i64 2
  %262 = load i64, i64* %261, align 8
  %263 = icmp slt i64 %260, %262
  br i1 %263, label %264, label %266

; <label>:264:                                    ; preds = %259
  %265 = getelementptr inbounds i8, i8* %.11323.2, i64 2
  store i64 %260, i64* %261, align 8
  store i8 %143, i8* %265, align 1
  br label %266

; <label>:266:                                    ; preds = %264, %259
  %267 = add nsw i64 %180, %260
  %268 = getelementptr inbounds i64, i64* %.224.2, i64 3
  %269 = load i64, i64* %268, align 8
  %270 = icmp slt i64 %267, %269
  br i1 %270, label %271, label %273

; <label>:271:                                    ; preds = %266
  %272 = getelementptr inbounds i8, i8* %.11323.2, i64 3
  store i64 %267, i64* %268, align 8
  store i8 %143, i8* %272, align 1
  br label %273

; <label>:273:                                    ; preds = %271, %266
  %scevgep.2 = getelementptr i8, i8* %.11323.2, i64 4
  %scevgep15.2 = getelementptr i64, i64* %.224.2, i64 4
  %274 = add nsw i64 %.0127.2, %.0426.2
  %275 = add nsw i64 %.0127.2, 288
  %276 = add nsw i32 %.0625.2, -1
  %277 = icmp sgt i32 %.0625.2, 0
  br i1 %277, label %248, label %278

; <label>:278:                                    ; preds = %273
  %279 = add nsw i64 %247, %246
  br label %280

; <label>:280:                                    ; preds = %305, %278
  %.0127.3 = phi i64 [ %176, %278 ], [ %307, %305 ]
  %.0426.3 = phi i64 [ %279, %278 ], [ %306, %305 ]
  %.0625.3 = phi i32 [ 7, %278 ], [ %308, %305 ]
  %.224.3 = phi i64* [ %scevgep17.2, %278 ], [ %scevgep15.3, %305 ]
  %.11323.3 = phi i8* [ %scevgep16.2, %278 ], [ %scevgep.3, %305 ]
  %281 = load i64, i64* %.224.3, align 8
  %282 = icmp slt i64 %.0426.3, %281
  br i1 %282, label %283, label %284

; <label>:283:                                    ; preds = %280
  store i64 %.0426.3, i64* %.224.3, align 8
  store i8 %143, i8* %.11323.3, align 1
  br label %284

; <label>:284:                                    ; preds = %283, %280
  %285 = add nsw i64 %178, %.0426.3
  %286 = getelementptr inbounds i64, i64* %.224.3, i64 1
  %287 = load i64, i64* %286, align 8
  %288 = icmp slt i64 %285, %287
  br i1 %288, label %289, label %291

; <label>:289:                                    ; preds = %284
  %290 = getelementptr inbounds i8, i8* %.11323.3, i64 1
  store i64 %285, i64* %286, align 8
  store i8 %143, i8* %290, align 1
  br label %291

; <label>:291:                                    ; preds = %289, %284
  %292 = add nsw i64 %179, %285
  %293 = getelementptr inbounds i64, i64* %.224.3, i64 2
  %294 = load i64, i64* %293, align 8
  %295 = icmp slt i64 %292, %294
  br i1 %295, label %296, label %298

; <label>:296:                                    ; preds = %291
  %297 = getelementptr inbounds i8, i8* %.11323.3, i64 2
  store i64 %292, i64* %293, align 8
  store i8 %143, i8* %297, align 1
  br label %298

; <label>:298:                                    ; preds = %296, %291
  %299 = add nsw i64 %180, %292
  %300 = getelementptr inbounds i64, i64* %.224.3, i64 3
  %301 = load i64, i64* %300, align 8
  %302 = icmp slt i64 %299, %301
  br i1 %302, label %303, label %305

; <label>:303:                                    ; preds = %298
  %304 = getelementptr inbounds i8, i8* %.11323.3, i64 3
  store i64 %299, i64* %300, align 8
  store i8 %143, i8* %304, align 1
  br label %305

; <label>:305:                                    ; preds = %303, %298
  %scevgep.3 = getelementptr i8, i8* %.11323.3, i64 4
  %scevgep15.3 = getelementptr i64, i64* %.224.3, i64 4
  %306 = add nsw i64 %.0127.3, %.0426.3
  %307 = add nsw i64 %.0127.3, 288
  %308 = add nsw i32 %.0625.3, -1
  %309 = icmp sgt i32 %.0625.3, 0
  br i1 %309, label %280, label %310

; <label>:310:                                    ; preds = %305
  %indvars.iv.next = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %138
  br i1 %exitcond, label %._crit_edge.loopexit, label %141
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
