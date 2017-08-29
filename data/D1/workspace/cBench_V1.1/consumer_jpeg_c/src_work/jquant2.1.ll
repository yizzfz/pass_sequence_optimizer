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
define void @jinit_2pass_quantizer(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
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
  br i1 %19, label %28, label %20

; <label>:20:                                     ; preds = %1
  %21 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 5
  store i32 46, i32* %24, align 8
  %25 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %26 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %25, align 8
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %26, align 8
  tail call void %27(%struct.jpeg_common_struct* %21) #5
  br label %28

; <label>:28:                                     ; preds = %1, %20
  %29 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr3 = add i64 %sunkaddr, 8
  %30 = inttoptr i64 %sunkaddr3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %31 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %30, align 8
  %32 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %31, align 8
  %33 = tail call i8* %32(%struct.jpeg_common_struct* %29, i32 1, i64 256) #5
  %34 = getelementptr inbounds i8, i8* %7, i64 48
  %35 = bitcast i8* %34 to i8**
  store i8* %33, i8** %35, align 8
  %36 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr25 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 8
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to %struct.jpeg_memory_mgr**
  %sunkaddr28 = ptrtoint i8* %7 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 48
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to [32 x i16]***
  br label %37

; <label>:37:                                     ; preds = %37, %28
  %indvars.iv = phi i64 [ 0, %28 ], [ %indvars.iv.next, %37 ]
  %38 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr27, align 8
  %39 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %38, i64 0, i32 1
  %40 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %39, align 8
  %41 = tail call i8* %40(%struct.jpeg_common_struct* nonnull %36, i32 1, i64 4096) #5
  %42 = load [32 x i16]**, [32 x i16]*** %sunkaddr30, align 8
  %43 = getelementptr inbounds [32 x i16]*, [32 x i16]** %42, i64 %indvars.iv
  %44 = bitcast [32 x i16]** %43 to i8**
  store i8* %41, i8** %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond, label %45, label %37

; <label>:45:                                     ; preds = %37
  %46 = getelementptr inbounds i8, i8* %7, i64 56
  %47 = bitcast i8* %46 to i32*
  store i32 1, i32* %47, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 25
  %49 = load i32, i32* %48, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %86, label %51

; <label>:51:                                     ; preds = %45
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %53 = load i32, i32* %52, align 8
  %54 = icmp slt i32 %53, 8
  br i1 %54, label %.thread, label %64

.thread:                                          ; preds = %51
  %55 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %56 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i64 0, i32 5
  store i32 55, i32* %58, align 8
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i64 0, i32 6, i32 0, i64 0
  store i32 8, i32* %60, align 4
  %61 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %62 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %61, align 8
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  tail call void %63(%struct.jpeg_common_struct* nonnull %55) #5
  br label %76

; <label>:64:                                     ; preds = %51
  %65 = icmp sgt i32 %53, 256
  br i1 %65, label %66, label %76

; <label>:66:                                     ; preds = %64
  %67 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %68, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 5
  store i32 56, i32* %70, align 8
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %68, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 6, i32 0, i64 0
  store i32 256, i32* %72, align 4
  %73 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %74 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %73, align 8
  %75 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %74, align 8
  tail call void %75(%struct.jpeg_common_struct* nonnull %67) #5
  br label %76

; <label>:76:                                     ; preds = %64, %.thread, %66
  %77 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr11 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 8
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to %struct.jpeg_memory_mgr**
  %78 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr13, align 8
  %79 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %78, i64 0, i32 2
  %80 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %79, align 8
  %81 = tail call i8** %80(%struct.jpeg_common_struct* nonnull %77, i32 1, i32 %53, i32 3) #5
  %82 = getelementptr inbounds i8, i8* %7, i64 32
  %83 = bitcast i8* %82 to i8***
  store i8** %81, i8*** %83, align 8
  %84 = getelementptr inbounds i8, i8* %7, i64 40
  %85 = bitcast i8* %84 to i32*
  store i32 %53, i32* %85, align 8
  br label %89

; <label>:86:                                     ; preds = %45
  %87 = getelementptr inbounds i8, i8* %7, i64 32
  %88 = bitcast i8* %87 to i8***
  store i8** null, i8*** %88, align 8
  br label %89

; <label>:89:                                     ; preds = %86, %76
  %90 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %91 = load i32, i32* %90, align 8
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %104, label %93

; <label>:93:                                     ; preds = %89
  %94 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr14 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 104
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  store i32 2, i32* %sunkaddr16, align 8
  %sunkaddr17 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 8
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to %struct.jpeg_memory_mgr**
  %95 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr19, align 8
  %96 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %95, i64 0, i32 1
  %97 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %96, align 8
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %99 = load i32, i32* %98, align 8
  %100 = add i32 %99, 2
  %101 = zext i32 %100 to i64
  %102 = mul nuw nsw i64 %101, 6
  %103 = tail call i8* %97(%struct.jpeg_common_struct* nonnull %94, i32 1, i64 %102) #5
  %sunkaddr20 = ptrtoint i8* %7 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 64
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i8**
  store i8* %103, i8** %sunkaddr22, align 8
  tail call fastcc void @init_error_limit(%struct.jpeg_decompress_struct* nonnull %0)
  ret void

; <label>:104:                                    ; preds = %89
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
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr2 = add i64 %sunkaddr, 104
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i32*
  store i32 2, i32* %sunkaddr3, align 8
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
  br label %76

; <label>:19:                                     ; preds = %12
  %sunkaddr4 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr5 = add i64 %sunkaddr4, 104
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i32*
  %20 = load i32, i32* %sunkaddr6, align 8
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
  %33 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %34 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %33, align 8
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
  %45 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %46 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %45, align 8
  %47 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %46, align 8
  %48 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %47(%struct.jpeg_common_struct* %48) #5
  br label %49

; <label>:49:                                     ; preds = %37, %.thread, %39
  %sunkaddr7 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr8 = add i64 %sunkaddr7, 104
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  %50 = load i32, i32* %sunkaddr9, align 8
  %51 = icmp eq i32 %50, 2
  br i1 %51, label %52, label %76

; <label>:52:                                     ; preds = %49
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %54 = load i32, i32* %53, align 8
  %55 = add i32 %54, 2
  %56 = zext i32 %55 to i64
  %57 = mul nuw nsw i64 %56, 6
  %58 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 5
  %59 = load i16*, i16** %58, align 8
  %60 = icmp eq i16* %59, null
  br i1 %60, label %61, label %68

; <label>:61:                                     ; preds = %52
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %63 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %63, i64 0, i32 1
  %65 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %64, align 8
  %66 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %67 = tail call i8* %65(%struct.jpeg_common_struct* %66, i32 1, i64 %57) #5
  %sunkaddr10 = ptrtoint %struct.my_cquantizer* %5 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 64
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i8**
  store i8* %67, i8** %sunkaddr12, align 8
  br label %68

; <label>:68:                                     ; preds = %52, %61
  %sunkaddr13 = ptrtoint %struct.my_cquantizer* %5 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 64
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i8**
  %69 = load i8*, i8** %sunkaddr15, align 8
  tail call void @jzero_far(i8* %69, i64 %57) #5
  %70 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 7
  %71 = load i32*, i32** %70, align 8
  %72 = icmp eq i32* %71, null
  br i1 %72, label %73, label %74

; <label>:73:                                     ; preds = %68
  tail call fastcc void @init_error_limit(%struct.jpeg_decompress_struct* nonnull %0)
  br label %74

; <label>:74:                                     ; preds = %68, %73
  %75 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 6
  store i32 0, i32* %75, align 8
  br label %76

; <label>:76:                                     ; preds = %49, %74, %14
  %77 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 4
  %78 = load i32, i32* %77, align 8
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %84, label %.preheader.preheader

.preheader.preheader:                             ; preds = %76
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %.preheader.preheader ]
  %80 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv
  %81 = bitcast [32 x i16]** %80 to i8**
  %82 = load i8*, i8** %81, align 8
  tail call void @jzero_far(i8* %82, i64 4096) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond, label %83, label %.preheader

; <label>:83:                                     ; preds = %.preheader
  %sunkaddr16 = ptrtoint %struct.my_cquantizer* %5 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 56
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i32*
  store i32 0, i32* %sunkaddr18, align 8
  br label %84

; <label>:84:                                     ; preds = %76, %83
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
define internal fastcc void @init_error_limit(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
.lr.ph7.preheader.new:
  %1 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %2 = bitcast %struct.jpeg_color_quantizer** %1 to %struct.my_cquantizer**
  %3 = load %struct.my_cquantizer*, %struct.my_cquantizer** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %5 = bitcast %struct.jpeg_memory_mgr** %4 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %5, align 8
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
  %74 = bitcast i8* %10 to i32*
  %75 = bitcast i8* %10 to i32*
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7, %.lr.ph7.preheader.new
  %indvars.iv14 = phi i64 [ 16, %.lr.ph7.preheader.new ], [ %indvars.iv.next15.1.1, %.lr.ph7 ]
  %.16 = phi i32 [ 16, %.lr.ph7.preheader.new ], [ %93, %.lr.ph7 ]
  %76 = getelementptr inbounds i32, i32* %74, i64 %indvars.iv14
  store i32 %.16, i32* %76, align 4
  %77 = sub nsw i32 0, %.16
  %78 = sub nsw i64 0, %indvars.iv14
  %79 = getelementptr inbounds i32, i32* %74, i64 %78
  store i32 %77, i32* %79, align 4
  %indvars.iv.next15 = or i64 %indvars.iv14, 1
  %80 = getelementptr inbounds i32, i32* %74, i64 %indvars.iv.next15
  store i32 %.16, i32* %80, align 4
  %81 = sub nsw i32 0, %.16
  %82 = xor i64 %indvars.iv14, -1
  %83 = getelementptr inbounds i32, i32* %74, i64 %82
  store i32 %81, i32* %83, align 4
  %indvars.iv.next15.1 = or i64 %indvars.iv14, 2
  %84 = or i32 %.16, 1
  %85 = getelementptr inbounds i32, i32* %75, i64 %indvars.iv.next15.1
  store i32 %84, i32* %85, align 4
  %86 = xor i32 %.16, -1
  %87 = sub i64 -2, %indvars.iv14
  %88 = getelementptr inbounds i32, i32* %75, i64 %87
  store i32 %86, i32* %88, align 4
  %indvars.iv.next15.125 = or i64 %indvars.iv14, 3
  %89 = getelementptr inbounds i32, i32* %75, i64 %indvars.iv.next15.125
  store i32 %84, i32* %89, align 4
  %90 = xor i32 %.16, -1
  %91 = sub i64 -3, %indvars.iv14
  %92 = getelementptr inbounds i32, i32* %75, i64 %91
  store i32 %90, i32* %92, align 4
  %indvars.iv.next15.1.1 = add nsw i64 %indvars.iv14, 4
  %93 = add nsw i32 %.16, 2
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next15.1.1, 48
  br i1 %exitcond.1.1, label %.lr.ph.new.preheader, label %.lr.ph7

.lr.ph.new.preheader:                             ; preds = %.lr.ph7
  %94 = bitcast i8* %10 to i32*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 48, %.lr.ph.new.preheader ]
  %95 = getelementptr inbounds i32, i32* %94, i64 %indvars.iv
  store i32 32, i32* %95, align 4
  %96 = sub nsw i64 0, %indvars.iv
  %97 = getelementptr inbounds i32, i32* %94, i64 %96
  store i32 -32, i32* %97, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %98 = getelementptr inbounds i32, i32* %94, i64 %indvars.iv.next
  store i32 32, i32* %98, align 4
  %99 = xor i64 %indvars.iv, -1
  %100 = getelementptr inbounds i32, i32* %94, i64 %99
  store i32 -32, i32* %100, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %101 = getelementptr inbounds i32, i32* %94, i64 %indvars.iv.next.1
  store i32 32, i32* %101, align 4
  %102 = sub nuw nsw i64 -2, %indvars.iv
  %103 = getelementptr inbounds i32, i32* %94, i64 %102
  store i32 -32, i32* %103, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %104 = getelementptr inbounds i32, i32* %94, i64 %indvars.iv.next.2
  store i32 32, i32* %104, align 4
  %105 = sub nuw nsw i64 -3, %indvars.iv
  %106 = getelementptr inbounds i32, i32* %94, i64 %105
  store i32 -32, i32* %106, align 4
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 256
  br i1 %exitcond.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
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
  %12 = icmp slt i32 %3, 1
  %13 = icmp eq i32 %11, 0
  %or.cond = or i1 %12, %13
  br i1 %or.cond, label %._crit_edge8, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %4
  %wide.trip.count = zext i32 %3 to i64
  br label %.lr.ph7.split

.lr.ph7.split:                                    ; preds = %._crit_edge, %.lr.ph7.split.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph7.split.preheader ]
  %14 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv
  %15 = load i8*, i8** %14, align 8
  br label %16

; <label>:16:                                     ; preds = %16, %.lr.ph7.split
  %.04 = phi i32 [ %11, %.lr.ph7.split ], [ %35, %16 ]
  %.023 = phi i8* [ %15, %.lr.ph7.split ], [ %34, %16 ]
  %17 = load i8, i8* %.023, align 1
  %18 = zext i8 %17 to i64
  %19 = lshr i64 %18, 3
  %20 = getelementptr inbounds [32 x i16]*, [32 x i16]** %9, i64 %19
  %21 = load [32 x i16]*, [32 x i16]** %20, align 8
  %22 = getelementptr inbounds i8, i8* %.023, i64 1
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i64
  %25 = lshr i64 %24, 2
  %26 = getelementptr inbounds i8, i8* %.023, i64 2
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i64
  %29 = lshr i64 %28, 3
  %30 = getelementptr inbounds [32 x i16], [32 x i16]* %21, i64 %25, i64 %29
  %31 = load i16, i16* %30, align 2
  %32 = add i16 %31, 1
  %33 = icmp eq i16 %32, 0
  %. = select i1 %33, i16 %31, i16 %32
  store i16 %., i16* %30, align 2
  %34 = getelementptr inbounds i8, i8* %.023, i64 3
  %35 = add i32 %.04, -1
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %._crit_edge, label %16

._crit_edge:                                      ; preds = %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
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
  tail call fastcc void @select_colors(%struct.jpeg_decompress_struct* %0, i32 %11)
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
  %23 = icmp sgt i32 %3, 0
  br i1 %23, label %.lr.ph37, label %._crit_edge38

.lr.ph37:                                         ; preds = %4
  %24 = mul i32 %11, 3
  %25 = add i32 %24, -3
  %26 = zext i32 %25 to i64
  %27 = add i32 %11, -1
  %28 = zext i32 %27 to i64
  %29 = add i32 %24, 3
  %30 = zext i32 %29 to i64
  %31 = shl nuw nsw i64 %28, 1
  %32 = add nuw nsw i64 %31, 2
  %wide.trip.count = zext i32 %3 to i64
  %sunkaddr68 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr69 = add i64 %sunkaddr68, 72
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to i32*
  %sunkaddr73 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr74 = add i64 %sunkaddr73, 64
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i16**
  %33 = icmp eq i32 %11, 0
  %sunkaddr76 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr77 = add i64 %sunkaddr76, 72
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %sunkaddr = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr71 = add i64 %sunkaddr, 64
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i16**
  br label %34

; <label>:34:                                     ; preds = %._crit_edge, %.lr.ph37
  %indvars.iv = phi i64 [ 0, %.lr.ph37 ], [ %indvars.iv.next, %._crit_edge ]
  %35 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %38 = load i8*, i8** %37, align 8
  %39 = load i32, i32* %sunkaddr70, align 8
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %46, label %41

; <label>:41:                                     ; preds = %34
  %42 = getelementptr inbounds i8, i8* %36, i64 %26
  %43 = getelementptr inbounds i8, i8* %38, i64 %28
  %44 = load i16*, i16** %sunkaddr72, align 8
  %45 = getelementptr inbounds i16, i16* %44, i64 %30
  br label %48

; <label>:46:                                     ; preds = %34
  %47 = load i16*, i16** %sunkaddr75, align 8
  br label %48

; <label>:48:                                     ; preds = %46, %41
  %.sink = phi i32 [ 1, %46 ], [ 0, %41 ]
  %.016 = phi i16* [ %47, %46 ], [ %45, %41 ]
  %.05 = phi i8* [ %36, %46 ], [ %42, %41 ]
  %.04 = phi i8* [ %38, %46 ], [ %43, %41 ]
  %.03 = phi i64 [ 1, %46 ], [ -1, %41 ]
  %.02 = phi i32 [ 3, %46 ], [ -3, %41 ]
  store i32 %.sink, i32* %sunkaddr78, align 8
  br i1 %33, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %48
  %49 = sext i32 %.02 to i64
  %50 = add nsw i32 %.02, 1
  %51 = sext i32 %50 to i64
  %52 = add nsw i32 %.02, 2
  %53 = sext i32 %52 to i64
  %54 = mul nsw i64 %32, %49
  br label %55

; <label>:55:                                     ; preds = %112, %.lr.ph
  %.031 = phi i32 [ %11, %.lr.ph ], [ %150, %112 ]
  %.130 = phi i8* [ %.04, %.lr.ph ], [ %139, %112 ]
  %.1629 = phi i8* [ %.05, %.lr.ph ], [ %140, %112 ]
  %.0728 = phi i32 [ 0, %.lr.ph ], [ %148, %112 ]
  %.0827 = phi i32 [ 0, %.lr.ph ], [ %145, %112 ]
  %.0926 = phi i32 [ 0, %.lr.ph ], [ %142, %112 ]
  %.01025 = phi i32 [ 0, %.lr.ph ], [ %119, %112 ]
  %.01124 = phi i32 [ 0, %.lr.ph ], [ %123, %112 ]
  %.01223 = phi i32 [ 0, %.lr.ph ], [ %127, %112 ]
  %.01322 = phi i32 [ 0, %.lr.ph ], [ %149, %112 ]
  %.01421 = phi i32 [ 0, %.lr.ph ], [ %146, %112 ]
  %.01520 = phi i32 [ 0, %.lr.ph ], [ %143, %112 ]
  %.11719 = phi i16* [ %.016, %.lr.ph ], [ %56, %112 ]
  %56 = getelementptr inbounds i16, i16* %.11719, i64 %49
  %57 = load i16, i16* %56, align 2
  %58 = sext i16 %57 to i32
  %59 = add i32 %.0728, 8
  %60 = add i32 %59, %58
  %61 = ashr i32 %60, 4
  %62 = getelementptr inbounds i16, i16* %.11719, i64 %51
  %63 = load i16, i16* %62, align 2
  %64 = sext i16 %63 to i32
  %65 = add i32 %.0827, 8
  %66 = add i32 %65, %64
  %67 = ashr i32 %66, 4
  %68 = getelementptr inbounds i16, i16* %.11719, i64 %53
  %69 = load i16, i16* %68, align 2
  %70 = sext i16 %69 to i32
  %71 = add i32 %.0926, 8
  %72 = add i32 %71, %70
  %73 = ashr i32 %72, 4
  %74 = sext i32 %61 to i64
  %75 = getelementptr inbounds i32, i32* %15, i64 %74
  %76 = load i32, i32* %75, align 4
  %77 = sext i32 %67 to i64
  %78 = getelementptr inbounds i32, i32* %15, i64 %77
  %79 = load i32, i32* %78, align 4
  %80 = sext i32 %73 to i64
  %81 = getelementptr inbounds i32, i32* %15, i64 %80
  %82 = load i32, i32* %81, align 4
  %83 = load i8, i8* %.1629, align 1
  %promoted55 = zext i8 %83 to i64
  %promoted = sext i32 %76 to i64
  %84 = add nsw i64 %promoted55, %promoted
  %85 = getelementptr inbounds i8, i8* %.1629, i64 1
  %86 = load i8, i8* %85, align 1
  %promoted57 = zext i8 %86 to i64
  %promoted56 = sext i32 %79 to i64
  %87 = add nsw i64 %promoted57, %promoted56
  %88 = getelementptr inbounds i8, i8* %.1629, i64 2
  %89 = load i8, i8* %88, align 1
  %promoted59 = zext i8 %89 to i64
  %promoted58 = sext i32 %82 to i64
  %90 = add nsw i64 %promoted59, %promoted58
  %91 = getelementptr inbounds i8, i8* %13, i64 %84
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = getelementptr inbounds i8, i8* %13, i64 %87
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = getelementptr inbounds i8, i8* %13, i64 %90
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = lshr i32 %93, 3
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds [32 x i16]*, [32 x i16]** %9, i64 %101
  %103 = load [32 x i16]*, [32 x i16]** %102, align 8
  %104 = lshr i32 %96, 2
  %105 = zext i32 %104 to i64
  %106 = lshr i32 %99, 3
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds [32 x i16], [32 x i16]* %103, i64 %105, i64 %107
  %109 = load i16, i16* %108, align 2
  %110 = icmp eq i16 %109, 0
  br i1 %110, label %111, label %112

; <label>:111:                                    ; preds = %55
  tail call fastcc void @fill_inverse_cmap(%struct.jpeg_decompress_struct* %0, i32 %100, i32 %104, i32 %106)
  br label %112

; <label>:112:                                    ; preds = %55, %111
  %113 = load i16, i16* %108, align 2
  %promoted61 = zext i16 %113 to i64
  %114 = add nsw i64 %promoted61, -1
  %115 = trunc i64 %114 to i8
  store i8 %115, i8* %.130, align 1
  %116 = getelementptr inbounds i8, i8* %18, i64 %114
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = sub nsw i32 %93, %118
  %120 = getelementptr inbounds i8, i8* %20, i64 %114
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = sub nsw i32 %96, %122
  %124 = getelementptr inbounds i8, i8* %22, i64 %114
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = sub nsw i32 %99, %126
  %128 = mul nsw i32 %119, 3
  %129 = add nsw i32 %128, %.01322
  %130 = trunc i32 %129 to i16
  store i16 %130, i16* %.11719, align 2
  %131 = mul nsw i32 %123, 3
  %132 = add nsw i32 %131, %.01421
  %133 = trunc i32 %132 to i16
  %134 = getelementptr inbounds i16, i16* %.11719, i64 1
  store i16 %133, i16* %134, align 2
  %135 = mul nsw i32 %127, 3
  %136 = add nsw i32 %135, %.01520
  %137 = trunc i32 %136 to i16
  %138 = getelementptr inbounds i16, i16* %.11719, i64 2
  store i16 %137, i16* %138, align 2
  %139 = getelementptr inbounds i8, i8* %.130, i64 %.03
  %140 = getelementptr inbounds i8, i8* %.1629, i64 %49
  %141 = mul nsw i32 %127, 5
  %142 = mul nsw i32 %127, 7
  %143 = add nsw i32 %141, %.01223
  %144 = mul nsw i32 %123, 5
  %145 = mul nsw i32 %123, 7
  %146 = add nsw i32 %144, %.01124
  %147 = mul nsw i32 %119, 5
  %148 = mul nsw i32 %119, 7
  %149 = add nsw i32 %147, %.01025
  %150 = add i32 %.031, -1
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %._crit_edge.loopexit, label %55

._crit_edge.loopexit:                             ; preds = %112
  %.01642 = bitcast i16* %.016 to i8*
  %uglygep = getelementptr i8, i8* %.01642, i64 %54
  %uglygep43 = bitcast i8* %uglygep to i16*
  br label %._crit_edge

._crit_edge:                                      ; preds = %48, %._crit_edge.loopexit
  %.117.lcssa = phi i16* [ %uglygep43, %._crit_edge.loopexit ], [ %.016, %48 ]
  %.015.lcssa = phi i32 [ %143, %._crit_edge.loopexit ], [ 0, %48 ]
  %.014.lcssa = phi i32 [ %146, %._crit_edge.loopexit ], [ 0, %48 ]
  %.013.lcssa = phi i32 [ %149, %._crit_edge.loopexit ], [ 0, %48 ]
  %152 = trunc i32 %.013.lcssa to i16
  store i16 %152, i16* %.117.lcssa, align 2
  %153 = trunc i32 %.014.lcssa to i16
  %154 = getelementptr inbounds i16, i16* %.117.lcssa, i64 1
  store i16 %153, i16* %154, align 2
  %155 = trunc i32 %.015.lcssa to i16
  %156 = getelementptr inbounds i16, i16* %.117.lcssa, i64 2
  store i16 %155, i16* %156, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge38.loopexit, label %34

._crit_edge38.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %4
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
  %12 = icmp slt i32 %3, 1
  %13 = icmp eq i32 %11, 0
  %or.cond = or i1 %12, %13
  br i1 %or.cond, label %._crit_edge10, label %.lr.ph9.split.preheader

.lr.ph9.split.preheader:                          ; preds = %4
  %wide.trip.count = zext i32 %3 to i64
  br label %.lr.ph9.split

.lr.ph9.split:                                    ; preds = %._crit_edge, %.lr.ph9.split.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph9.split.preheader ]
  %14 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %17 = load i8*, i8** %16, align 8
  br label %18

; <label>:18:                                     ; preds = %40, %.lr.ph9.split
  %.06 = phi i32 [ %11, %.lr.ph9.split ], [ %45, %40 ]
  %.025 = phi i8* [ %17, %.lr.ph9.split ], [ %44, %40 ]
  %.034 = phi i8* [ %15, %.lr.ph9.split ], [ %27, %40 ]
  %19 = getelementptr inbounds i8, i8* %.034, i64 1
  %20 = load i8, i8* %.034, align 1
  %21 = zext i8 %20 to i32
  %22 = lshr i32 %21, 3
  %23 = getelementptr inbounds i8, i8* %.034, i64 2
  %24 = load i8, i8* %19, align 1
  %25 = zext i8 %24 to i32
  %26 = lshr i32 %25, 2
  %27 = getelementptr inbounds i8, i8* %.034, i64 3
  %28 = load i8, i8* %23, align 1
  %29 = zext i8 %28 to i32
  %30 = lshr i32 %29, 3
  %31 = zext i32 %22 to i64
  %32 = getelementptr inbounds [32 x i16]*, [32 x i16]** %9, i64 %31
  %33 = load [32 x i16]*, [32 x i16]** %32, align 8
  %34 = zext i32 %26 to i64
  %35 = zext i32 %30 to i64
  %36 = getelementptr inbounds [32 x i16], [32 x i16]* %33, i64 %34, i64 %35
  %37 = load i16, i16* %36, align 2
  %38 = icmp eq i16 %37, 0
  br i1 %38, label %39, label %40

; <label>:39:                                     ; preds = %18
  tail call fastcc void @fill_inverse_cmap(%struct.jpeg_decompress_struct* %0, i32 %22, i32 %26, i32 %30)
  br label %40

; <label>:40:                                     ; preds = %18, %39
  %41 = load i16, i16* %36, align 2
  %42 = trunc i16 %41 to i8
  %43 = add i8 %42, -1
  store i8 %43, i8* %.025, align 1
  %44 = getelementptr inbounds i8, i8* %.025, i64 1
  %45 = add i32 %.06, -1
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %._crit_edge, label %18

._crit_edge:                                      ; preds = %40
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
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

declare void @jzero_far(i8*, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @select_colors(%struct.jpeg_decompress_struct*, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
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
  tail call fastcc void @update_box(%struct.jpeg_decompress_struct* %0, %struct.box* %11)
  %23 = tail call fastcc i32 @median_cut(%struct.jpeg_decompress_struct* %0, %struct.box* %11, i32 %1)
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %23 to i64
  %25 = bitcast i8* %10 to %struct.box*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %26 = getelementptr inbounds %struct.box, %struct.box* %25, i64 %indvars.iv
  %27 = trunc i64 %indvars.iv to i32
  tail call fastcc void @compute_color(%struct.jpeg_decompress_struct* %0, %struct.box* %26, i32 %27)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %28 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  store i32 %23, i32* %29, align 4
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i64 0, i32 5
  store i32 95, i32* %32, align 8
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 6, i32 0, i64 0
  store i32 %23, i32* %34, align 4
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 1
  %37 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %36, align 8
  tail call void %37(%struct.jpeg_common_struct* %28, i32 1) #5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @update_box(%struct.jpeg_decompress_struct* nocapture readonly, %struct.box* nocapture) unnamed_addr #1 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %4 = bitcast %struct.jpeg_color_quantizer** %3 to %struct.my_cquantizer**
  %5 = load %struct.my_cquantizer*, %struct.my_cquantizer** %4, align 8
  %6 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 3
  %7 = load [32 x i16]**, [32 x i16]*** %6, align 8
  %8 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = sext i32 %12 to i64
  %14 = sext i32 %12 to i64
  %15 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 2
  %16 = load i32, i32* %15, align 8
  %17 = sext i32 %16 to i64
  %18 = sext i32 %16 to i64
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 3
  %21 = load i32, i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = sext i32 %21 to i64
  %24 = sext i32 %21 to i64
  %25 = sext i32 %21 to i64
  %26 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 4
  %27 = load i32, i32* %26, align 8
  %28 = sext i32 %27 to i64
  %29 = sext i32 %27 to i64
  %30 = sext i32 %27 to i64
  %31 = sext i32 %27 to i64
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 5
  %34 = load i32, i32* %33, align 4
  %35 = sext i32 %34 to i64
  %36 = sext i32 %34 to i64
  %37 = icmp sle i32 %12, %9
  %38 = icmp sgt i32 %16, %21
  %or.cond = or i1 %37, %38
  %39 = icmp sgt i32 %27, %34
  %or.cond404 = or i1 %or.cond, %39
  br i1 %or.cond404, label %.loopexit48, label %..preheader46_crit_edge

..preheader46_crit_edge:                          ; preds = %2
  %40 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %10
  %41 = load [32 x i16]*, [32 x i16]** %40, align 8
  %42 = getelementptr inbounds [32 x i16], [32 x i16]* %41, i64 %19, i64 %32
  %43 = load i16, i16* %42, align 2
  %44 = icmp eq i16 %43, 0
  br i1 %44, label %.lr.ph478.lr.ph.preheader, label %.us-lcssa316

.lr.ph478.lr.ph.preheader:                        ; preds = %..preheader46_crit_edge
  %sunkaddr486 = ptrtoint [32 x i16]** %7 to i64
  br label %.lr.ph478.lr.ph

.preheader46:                                     ; preds = %._crit_edge124
  %sunkaddr487 = shl i64 %indvars.iv388484, 3
  %sunkaddr488 = add i64 %sunkaddr486, %sunkaddr487
  %sunkaddr489 = add i64 %sunkaddr488, 8
  %sunkaddr490 = inttoptr i64 %sunkaddr489 to [32 x i16]**
  %45 = load [32 x i16]*, [32 x i16]** %sunkaddr490, align 8
  %46 = getelementptr inbounds [32 x i16], [32 x i16]* %45, i64 %19, i64 %32
  %47 = load i16, i16* %46, align 2
  %48 = icmp eq i16 %47, 0
  br i1 %48, label %.lr.ph478.lr.ph, label %.us-lcssa316.loopexit579

.lr.ph478.lr.ph:                                  ; preds = %.lr.ph478.lr.ph.preheader, %.preheader46
  %49 = phi i16* [ %46, %.preheader46 ], [ %42, %.lr.ph478.lr.ph.preheader ]
  %50 = phi [32 x i16]* [ %45, %.preheader46 ], [ %41, %.lr.ph478.lr.ph.preheader ]
  %indvars.iv388484 = phi i64 [ %indvars.iv.next389, %.preheader46 ], [ %10, %.lr.ph478.lr.ph.preheader ]
  br label %.lr.ph478

.lr.ph120:                                        ; preds = %._crit_edge121
  %51 = getelementptr inbounds [32 x i16], [32 x i16]* %50, i64 %indvars.iv.next387, i64 %32
  %52 = load i16, i16* %51, align 2
  %53 = icmp eq i16 %52, 0
  br i1 %53, label %.lr.ph478, label %.us-lcssa316.loopexit578

.lr.ph478:                                        ; preds = %.lr.ph478.lr.ph, %.lr.ph120
  %54 = phi i16* [ %49, %.lr.ph478.lr.ph ], [ %51, %.lr.ph120 ]
  %indvars.iv386481 = phi i64 [ %19, %.lr.ph478.lr.ph ], [ %indvars.iv.next387, %.lr.ph120 ]
  br label %61

; <label>:55:                                     ; preds = %61
  %56 = add nsw i32 %.022117477, 1
  %57 = load i16, i16* %62, align 2
  %58 = icmp eq i16 %57, 0
  br i1 %58, label %61, label %.us-lcssa316.loopexit

.us-lcssa316.loopexit:                            ; preds = %55
  br label %.us-lcssa316

.us-lcssa316.loopexit578:                         ; preds = %.lr.ph120
  br label %.us-lcssa316

.us-lcssa316.loopexit579:                         ; preds = %.preheader46
  br label %.us-lcssa316

.us-lcssa316:                                     ; preds = %.us-lcssa316.loopexit579, %.us-lcssa316.loopexit578, %.us-lcssa316.loopexit, %..preheader46_crit_edge
  %indvars.iv388.lcssa = phi i64 [ %10, %..preheader46_crit_edge ], [ %indvars.iv388484, %.us-lcssa316.loopexit ], [ %indvars.iv388484, %.us-lcssa316.loopexit578 ], [ %indvars.iv.next389, %.us-lcssa316.loopexit579 ]
  %59 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 0
  %60 = trunc i64 %indvars.iv388.lcssa to i32
  store i32 %60, i32* %59, align 8
  br label %.loopexit48

; <label>:61:                                     ; preds = %.lr.ph478, %55
  %.022117477 = phi i32 [ %27, %.lr.ph478 ], [ %56, %55 ]
  %.04118476 = phi i16* [ %54, %.lr.ph478 ], [ %62, %55 ]
  %62 = getelementptr inbounds i16, i16* %.04118476, i64 1
  %63 = icmp slt i32 %.022117477, %34
  br i1 %63, label %55, label %._crit_edge121

._crit_edge121:                                   ; preds = %61
  %indvars.iv.next387 = add nsw i64 %indvars.iv386481, 1
  %64 = icmp slt i64 %indvars.iv386481, %25
  br i1 %64, label %.lr.ph120, label %._crit_edge124

._crit_edge124:                                   ; preds = %._crit_edge121
  %indvars.iv.next389 = add nsw i64 %indvars.iv388484, 1
  %65 = icmp slt i64 %indvars.iv388484, %14
  br i1 %65, label %.preheader46, label %.loopexit48.loopexit

.loopexit48.loopexit:                             ; preds = %._crit_edge124
  br label %.loopexit48

.loopexit48:                                      ; preds = %.loopexit48.loopexit, %2, %.us-lcssa316
  %.029 = phi i32 [ %60, %.us-lcssa316 ], [ %9, %2 ], [ %9, %.loopexit48.loopexit ]
  %66 = icmp sle i32 %12, %.029
  %67 = icmp sgt i32 %16, %21
  %or.cond405 = or i1 %66, %67
  %68 = icmp sgt i32 %27, %34
  %or.cond406 = or i1 %or.cond405, %68
  br i1 %or.cond406, label %.loopexit45, label %.preheader43.preheader

.preheader43.preheader:                           ; preds = %.loopexit48
  %69 = sext i32 %.029 to i64
  %70 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %13
  %71 = load [32 x i16]*, [32 x i16]** %70, align 8
  %72 = getelementptr inbounds [32 x i16], [32 x i16]* %71, i64 %18, i64 %31
  %73 = load i16, i16* %72, align 2
  %74 = icmp eq i16 %73, 0
  br i1 %74, label %.lr.ph468.lr.ph.preheader, label %.us-lcssa288

.lr.ph468.lr.ph.preheader:                        ; preds = %.preheader43.preheader
  %sunkaddr491 = ptrtoint [32 x i16]** %7 to i64
  br label %.lr.ph468.lr.ph

.preheader43:                                     ; preds = %._crit_edge114
  %sunkaddr492 = shl i64 %indvars.iv384474, 3
  %sunkaddr493 = add i64 %sunkaddr491, %sunkaddr492
  %sunkaddr494 = add i64 %sunkaddr493, -8
  %sunkaddr495 = inttoptr i64 %sunkaddr494 to [32 x i16]**
  %75 = load [32 x i16]*, [32 x i16]** %sunkaddr495, align 8
  %76 = getelementptr inbounds [32 x i16], [32 x i16]* %75, i64 %18, i64 %31
  %77 = load i16, i16* %76, align 2
  %78 = icmp eq i16 %77, 0
  br i1 %78, label %.lr.ph468.lr.ph, label %.us-lcssa288.loopexit577

.lr.ph468.lr.ph:                                  ; preds = %.lr.ph468.lr.ph.preheader, %.preheader43
  %79 = phi i16* [ %76, %.preheader43 ], [ %72, %.lr.ph468.lr.ph.preheader ]
  %80 = phi [32 x i16]* [ %75, %.preheader43 ], [ %71, %.lr.ph468.lr.ph.preheader ]
  %indvars.iv384474 = phi i64 [ %indvars.iv.next385, %.preheader43 ], [ %13, %.lr.ph468.lr.ph.preheader ]
  br label %.lr.ph468

.lr.ph110:                                        ; preds = %._crit_edge111
  %81 = getelementptr inbounds [32 x i16], [32 x i16]* %80, i64 %indvars.iv.next383, i64 %31
  %82 = load i16, i16* %81, align 2
  %83 = icmp eq i16 %82, 0
  br i1 %83, label %.lr.ph468, label %.us-lcssa288.loopexit576

.lr.ph468:                                        ; preds = %.lr.ph468.lr.ph, %.lr.ph110
  %84 = phi i16* [ %79, %.lr.ph468.lr.ph ], [ %81, %.lr.ph110 ]
  %indvars.iv382471 = phi i64 [ %18, %.lr.ph468.lr.ph ], [ %indvars.iv.next383, %.lr.ph110 ]
  br label %90

; <label>:85:                                     ; preds = %90
  %86 = add nsw i32 %.123107467, 1
  %87 = load i16, i16* %91, align 2
  %88 = icmp eq i16 %87, 0
  br i1 %88, label %90, label %.us-lcssa288.loopexit

.us-lcssa288.loopexit:                            ; preds = %85
  br label %.us-lcssa288

.us-lcssa288.loopexit576:                         ; preds = %.lr.ph110
  br label %.us-lcssa288

.us-lcssa288.loopexit577:                         ; preds = %.preheader43
  br label %.us-lcssa288

.us-lcssa288:                                     ; preds = %.us-lcssa288.loopexit577, %.us-lcssa288.loopexit576, %.us-lcssa288.loopexit, %.preheader43.preheader
  %indvars.iv384.lcssa = phi i64 [ %13, %.preheader43.preheader ], [ %indvars.iv384474, %.us-lcssa288.loopexit ], [ %indvars.iv384474, %.us-lcssa288.loopexit576 ], [ %indvars.iv.next385, %.us-lcssa288.loopexit577 ]
  %89 = trunc i64 %indvars.iv384.lcssa to i32
  %sunkaddr = ptrtoint %struct.box* %1 to i64
  %sunkaddr390 = add i64 %sunkaddr, 4
  %sunkaddr391 = inttoptr i64 %sunkaddr390 to i32*
  store i32 %89, i32* %sunkaddr391, align 4
  br label %.loopexit45

; <label>:90:                                     ; preds = %.lr.ph468, %85
  %.123107467 = phi i32 [ %27, %.lr.ph468 ], [ %86, %85 ]
  %.15108466 = phi i16* [ %84, %.lr.ph468 ], [ %91, %85 ]
  %91 = getelementptr inbounds i16, i16* %.15108466, i64 1
  %92 = icmp slt i32 %.123107467, %34
  br i1 %92, label %85, label %._crit_edge111

._crit_edge111:                                   ; preds = %90
  %indvars.iv.next383 = add nsw i64 %indvars.iv382471, 1
  %93 = icmp slt i64 %indvars.iv382471, %24
  br i1 %93, label %.lr.ph110, label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge111
  %indvars.iv.next385 = add nsw i64 %indvars.iv384474, -1
  %94 = icmp sgt i64 %indvars.iv384474, %69
  br i1 %94, label %.preheader43, label %.loopexit45.loopexit

.loopexit45.loopexit:                             ; preds = %._crit_edge114
  br label %.loopexit45

.loopexit45:                                      ; preds = %.loopexit45.loopexit, %.loopexit48, %.us-lcssa288
  %.030 = phi i32 [ %89, %.us-lcssa288 ], [ %12, %.loopexit48 ], [ %12, %.loopexit45.loopexit ]
  %95 = icmp sle i32 %21, %16
  %96 = icmp slt i32 %.030, %.029
  %or.cond407 = or i1 %95, %96
  %97 = icmp sgt i32 %27, %34
  %or.cond408 = or i1 %or.cond407, %97
  br i1 %or.cond408, label %.loopexit42, label %.preheader40.preheader

.preheader40.preheader:                           ; preds = %.loopexit45
  %98 = sext i32 %.029 to i64
  %99 = sext i32 %.030 to i64
  %100 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %98
  %101 = load [32 x i16]*, [32 x i16]** %100, align 8
  %102 = getelementptr inbounds [32 x i16], [32 x i16]* %101, i64 %17, i64 %30
  %103 = load i16, i16* %102, align 2
  %104 = icmp eq i16 %103, 0
  br i1 %104, label %.lr.ph458.lr.ph.preheader, label %.us-lcssa260

.lr.ph458.lr.ph.preheader:                        ; preds = %.preheader40.preheader
  %sunkaddr500 = ptrtoint [32 x i16]** %7 to i64
  %sunkaddr496 = ptrtoint [32 x i16]** %7 to i64
  %sunkaddr497 = shl nsw i64 %98, 3
  %sunkaddr498 = add i64 %sunkaddr496, %sunkaddr497
  %sunkaddr499 = inttoptr i64 %sunkaddr498 to [32 x i16]**
  br label %.lr.ph458.lr.ph

.preheader40:                                     ; preds = %._crit_edge104
  %105 = load [32 x i16]*, [32 x i16]** %sunkaddr499, align 8
  %106 = getelementptr inbounds [32 x i16], [32 x i16]* %105, i64 %indvars.iv.next381, i64 %30
  %107 = load i16, i16* %106, align 2
  %108 = icmp eq i16 %107, 0
  br i1 %108, label %.lr.ph458.lr.ph, label %.us-lcssa260.loopexit575

.lr.ph458.lr.ph:                                  ; preds = %.lr.ph458.lr.ph.preheader, %.preheader40
  %109 = phi i16* [ %106, %.preheader40 ], [ %102, %.lr.ph458.lr.ph.preheader ]
  %indvars.iv380464 = phi i64 [ %indvars.iv.next381, %.preheader40 ], [ %17, %.lr.ph458.lr.ph.preheader ]
  br label %.lr.ph458

.lr.ph100:                                        ; preds = %._crit_edge101
  %indvars.iv.next379 = add nsw i64 %indvars.iv378461, 1
  %sunkaddr501 = shl i64 %indvars.iv378461, 3
  %sunkaddr502 = add i64 %sunkaddr500, %sunkaddr501
  %sunkaddr503 = add i64 %sunkaddr502, 8
  %sunkaddr504 = inttoptr i64 %sunkaddr503 to [32 x i16]**
  %110 = load [32 x i16]*, [32 x i16]** %sunkaddr504, align 8
  %111 = getelementptr inbounds [32 x i16], [32 x i16]* %110, i64 %indvars.iv380464, i64 %30
  %112 = load i16, i16* %111, align 2
  %113 = icmp eq i16 %112, 0
  br i1 %113, label %.lr.ph458, label %.us-lcssa260.loopexit574

.lr.ph458:                                        ; preds = %.lr.ph458.lr.ph, %.lr.ph100
  %114 = phi i16* [ %109, %.lr.ph458.lr.ph ], [ %111, %.lr.ph100 ]
  %indvars.iv378461 = phi i64 [ %98, %.lr.ph458.lr.ph ], [ %indvars.iv.next379, %.lr.ph100 ]
  br label %120

; <label>:115:                                    ; preds = %120
  %116 = add nsw i32 %.22497457, 1
  %117 = load i16, i16* %121, align 2
  %118 = icmp eq i16 %117, 0
  br i1 %118, label %120, label %.us-lcssa260.loopexit

.us-lcssa260.loopexit:                            ; preds = %115
  br label %.us-lcssa260

.us-lcssa260.loopexit574:                         ; preds = %.lr.ph100
  br label %.us-lcssa260

.us-lcssa260.loopexit575:                         ; preds = %.preheader40
  br label %.us-lcssa260

.us-lcssa260:                                     ; preds = %.us-lcssa260.loopexit575, %.us-lcssa260.loopexit574, %.us-lcssa260.loopexit, %.preheader40.preheader
  %indvars.iv380.lcssa = phi i64 [ %17, %.preheader40.preheader ], [ %indvars.iv380464, %.us-lcssa260.loopexit ], [ %indvars.iv380464, %.us-lcssa260.loopexit574 ], [ %indvars.iv.next381, %.us-lcssa260.loopexit575 ]
  %119 = trunc i64 %indvars.iv380.lcssa to i32
  %sunkaddr392 = ptrtoint %struct.box* %1 to i64
  %sunkaddr393 = add i64 %sunkaddr392, 8
  %sunkaddr394 = inttoptr i64 %sunkaddr393 to i32*
  store i32 %119, i32* %sunkaddr394, align 8
  br label %.loopexit42

; <label>:120:                                    ; preds = %.lr.ph458, %115
  %.22497457 = phi i32 [ %27, %.lr.ph458 ], [ %116, %115 ]
  %.2698456 = phi i16* [ %114, %.lr.ph458 ], [ %121, %115 ]
  %121 = getelementptr inbounds i16, i16* %.2698456, i64 1
  %122 = icmp slt i32 %.22497457, %34
  br i1 %122, label %115, label %._crit_edge101

._crit_edge101:                                   ; preds = %120
  %123 = icmp slt i64 %indvars.iv378461, %99
  br i1 %123, label %.lr.ph100, label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge101
  %indvars.iv.next381 = add nsw i64 %indvars.iv380464, 1
  %124 = icmp slt i64 %indvars.iv380464, %23
  br i1 %124, label %.preheader40, label %.loopexit42.loopexit

.loopexit42.loopexit:                             ; preds = %._crit_edge104
  br label %.loopexit42

.loopexit42:                                      ; preds = %.loopexit42.loopexit, %.loopexit45, %.us-lcssa260
  %.031 = phi i32 [ %119, %.us-lcssa260 ], [ %16, %.loopexit45 ], [ %16, %.loopexit42.loopexit ]
  %125 = icmp sle i32 %21, %.031
  %126 = icmp slt i32 %.030, %.029
  %or.cond409 = or i1 %125, %126
  %127 = icmp sgt i32 %27, %34
  %or.cond410 = or i1 %or.cond409, %127
  br i1 %or.cond410, label %.loopexit39, label %.preheader37.preheader

.preheader37.preheader:                           ; preds = %.loopexit42
  %128 = sext i32 %.029 to i64
  %129 = sext i32 %.030 to i64
  %130 = sext i32 %.031 to i64
  %131 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %128
  %132 = load [32 x i16]*, [32 x i16]** %131, align 8
  %133 = getelementptr inbounds [32 x i16], [32 x i16]* %132, i64 %22, i64 %29
  %134 = load i16, i16* %133, align 2
  %135 = icmp eq i16 %134, 0
  br i1 %135, label %.lr.ph448.lr.ph.preheader, label %.us-lcssa232

.lr.ph448.lr.ph.preheader:                        ; preds = %.preheader37.preheader
  %sunkaddr509 = ptrtoint [32 x i16]** %7 to i64
  %sunkaddr505 = ptrtoint [32 x i16]** %7 to i64
  %sunkaddr506 = shl nsw i64 %128, 3
  %sunkaddr507 = add i64 %sunkaddr505, %sunkaddr506
  %sunkaddr508 = inttoptr i64 %sunkaddr507 to [32 x i16]**
  br label %.lr.ph448.lr.ph

.preheader37:                                     ; preds = %._crit_edge94
  %136 = load [32 x i16]*, [32 x i16]** %sunkaddr508, align 8
  %137 = getelementptr inbounds [32 x i16], [32 x i16]* %136, i64 %indvars.iv.next377, i64 %29
  %138 = load i16, i16* %137, align 2
  %139 = icmp eq i16 %138, 0
  br i1 %139, label %.lr.ph448.lr.ph, label %.us-lcssa232.loopexit573

.lr.ph448.lr.ph:                                  ; preds = %.lr.ph448.lr.ph.preheader, %.preheader37
  %140 = phi i16* [ %137, %.preheader37 ], [ %133, %.lr.ph448.lr.ph.preheader ]
  %indvars.iv376454 = phi i64 [ %indvars.iv.next377, %.preheader37 ], [ %22, %.lr.ph448.lr.ph.preheader ]
  br label %.lr.ph448

.lr.ph90:                                         ; preds = %._crit_edge91
  %indvars.iv.next375 = add nsw i64 %indvars.iv374451, 1
  %sunkaddr510 = shl i64 %indvars.iv374451, 3
  %sunkaddr511 = add i64 %sunkaddr509, %sunkaddr510
  %sunkaddr512 = add i64 %sunkaddr511, 8
  %sunkaddr513 = inttoptr i64 %sunkaddr512 to [32 x i16]**
  %141 = load [32 x i16]*, [32 x i16]** %sunkaddr513, align 8
  %142 = getelementptr inbounds [32 x i16], [32 x i16]* %141, i64 %indvars.iv376454, i64 %29
  %143 = load i16, i16* %142, align 2
  %144 = icmp eq i16 %143, 0
  br i1 %144, label %.lr.ph448, label %.us-lcssa232.loopexit572

.lr.ph448:                                        ; preds = %.lr.ph448.lr.ph, %.lr.ph90
  %145 = phi i16* [ %140, %.lr.ph448.lr.ph ], [ %142, %.lr.ph90 ]
  %indvars.iv374451 = phi i64 [ %128, %.lr.ph448.lr.ph ], [ %indvars.iv.next375, %.lr.ph90 ]
  br label %151

; <label>:146:                                    ; preds = %151
  %147 = add nsw i32 %.32587447, 1
  %148 = load i16, i16* %152, align 2
  %149 = icmp eq i16 %148, 0
  br i1 %149, label %151, label %.us-lcssa232.loopexit

.us-lcssa232.loopexit:                            ; preds = %146
  br label %.us-lcssa232

.us-lcssa232.loopexit572:                         ; preds = %.lr.ph90
  br label %.us-lcssa232

.us-lcssa232.loopexit573:                         ; preds = %.preheader37
  br label %.us-lcssa232

.us-lcssa232:                                     ; preds = %.us-lcssa232.loopexit573, %.us-lcssa232.loopexit572, %.us-lcssa232.loopexit, %.preheader37.preheader
  %indvars.iv376.lcssa = phi i64 [ %22, %.preheader37.preheader ], [ %indvars.iv376454, %.us-lcssa232.loopexit ], [ %indvars.iv376454, %.us-lcssa232.loopexit572 ], [ %indvars.iv.next377, %.us-lcssa232.loopexit573 ]
  %150 = trunc i64 %indvars.iv376.lcssa to i32
  %sunkaddr395 = ptrtoint %struct.box* %1 to i64
  %sunkaddr396 = add i64 %sunkaddr395, 12
  %sunkaddr397 = inttoptr i64 %sunkaddr396 to i32*
  store i32 %150, i32* %sunkaddr397, align 4
  br label %.loopexit39

; <label>:151:                                    ; preds = %.lr.ph448, %146
  %.32587447 = phi i32 [ %27, %.lr.ph448 ], [ %147, %146 ]
  %.3788446 = phi i16* [ %145, %.lr.ph448 ], [ %152, %146 ]
  %152 = getelementptr inbounds i16, i16* %.3788446, i64 1
  %153 = icmp slt i32 %.32587447, %34
  br i1 %153, label %146, label %._crit_edge91

._crit_edge91:                                    ; preds = %151
  %154 = icmp slt i64 %indvars.iv374451, %129
  br i1 %154, label %.lr.ph90, label %._crit_edge94

._crit_edge94:                                    ; preds = %._crit_edge91
  %indvars.iv.next377 = add nsw i64 %indvars.iv376454, -1
  %155 = icmp sgt i64 %indvars.iv376454, %130
  br i1 %155, label %.preheader37, label %.loopexit39.loopexit

.loopexit39.loopexit:                             ; preds = %._crit_edge94
  br label %.loopexit39

.loopexit39:                                      ; preds = %.loopexit39.loopexit, %.loopexit42, %.us-lcssa232
  %.03 = phi i32 [ %150, %.us-lcssa232 ], [ %21, %.loopexit42 ], [ %21, %.loopexit39.loopexit ]
  %156 = icmp sgt i32 %34, %27
  br i1 %156, label %.preheader34.lr.ph, label %.loopexit36

.preheader34.lr.ph:                               ; preds = %.loopexit39
  %157 = icmp slt i32 %.030, %.029
  %158 = sext i32 %.031 to i64
  %159 = icmp slt i32 %.03, %.031
  %or.cond411 = or i1 %157, %159
  br i1 %or.cond411, label %.loopexit36, label %.preheader34.preheader

.preheader34.preheader:                           ; preds = %.preheader34.lr.ph
  %160 = sext i32 %.029 to i64
  %161 = sext i32 %.030 to i64
  %162 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %160
  %163 = load [32 x i16]*, [32 x i16]** %162, align 8
  %164 = getelementptr inbounds [32 x i16], [32 x i16]* %163, i64 %158, i64 %28
  %165 = load i16, i16* %164, align 2
  %166 = icmp eq i16 %165, 0
  br i1 %166, label %.lr.ph438.lr.ph.preheader, label %.us-lcssa204

.lr.ph438.lr.ph.preheader:                        ; preds = %.preheader34.preheader
  %sunkaddr518 = ptrtoint [32 x i16]** %7 to i64
  %sunkaddr514 = ptrtoint [32 x i16]** %7 to i64
  %sunkaddr515 = shl nsw i64 %160, 3
  %sunkaddr516 = add i64 %sunkaddr514, %sunkaddr515
  %sunkaddr517 = inttoptr i64 %sunkaddr516 to [32 x i16]**
  br label %.lr.ph438.lr.ph

.preheader34:                                     ; preds = %._crit_edge84
  %167 = load [32 x i16]*, [32 x i16]** %sunkaddr517, align 8
  %168 = getelementptr inbounds [32 x i16], [32 x i16]* %167, i64 %158, i64 %indvars.iv.next373
  %169 = load i16, i16* %168, align 2
  %170 = icmp eq i16 %169, 0
  br i1 %170, label %.lr.ph438.lr.ph, label %.us-lcssa204.loopexit571

.lr.ph438.lr.ph:                                  ; preds = %.lr.ph438.lr.ph.preheader, %.preheader34
  %171 = phi i16* [ %168, %.preheader34 ], [ %164, %.lr.ph438.lr.ph.preheader ]
  %indvars.iv372444 = phi i64 [ %indvars.iv.next373, %.preheader34 ], [ %28, %.lr.ph438.lr.ph.preheader ]
  br label %.lr.ph438

.lr.ph80:                                         ; preds = %._crit_edge81
  %indvars.iv.next371 = add nsw i64 %indvars.iv370441, 1
  %sunkaddr519 = shl i64 %indvars.iv370441, 3
  %sunkaddr520 = add i64 %sunkaddr518, %sunkaddr519
  %sunkaddr521 = add i64 %sunkaddr520, 8
  %sunkaddr522 = inttoptr i64 %sunkaddr521 to [32 x i16]**
  %172 = load [32 x i16]*, [32 x i16]** %sunkaddr522, align 8
  %173 = getelementptr inbounds [32 x i16], [32 x i16]* %172, i64 %158, i64 %indvars.iv372444
  %174 = load i16, i16* %173, align 2
  %175 = icmp eq i16 %174, 0
  br i1 %175, label %.lr.ph438, label %.us-lcssa204.loopexit570

.lr.ph438:                                        ; preds = %.lr.ph438.lr.ph, %.lr.ph80
  %176 = phi i16* [ %171, %.lr.ph438.lr.ph ], [ %173, %.lr.ph80 ]
  %indvars.iv370441 = phi i64 [ %160, %.lr.ph438.lr.ph ], [ %indvars.iv.next371, %.lr.ph80 ]
  br label %182

; <label>:177:                                    ; preds = %182
  %178 = add nsw i32 %.41977437, 1
  %179 = load i16, i16* %183, align 2
  %180 = icmp eq i16 %179, 0
  br i1 %180, label %182, label %.us-lcssa204.loopexit

.us-lcssa204.loopexit:                            ; preds = %177
  br label %.us-lcssa204

.us-lcssa204.loopexit570:                         ; preds = %.lr.ph80
  br label %.us-lcssa204

.us-lcssa204.loopexit571:                         ; preds = %.preheader34
  br label %.us-lcssa204

.us-lcssa204:                                     ; preds = %.us-lcssa204.loopexit571, %.us-lcssa204.loopexit570, %.us-lcssa204.loopexit, %.preheader34.preheader
  %indvars.iv372.lcssa = phi i64 [ %28, %.preheader34.preheader ], [ %indvars.iv372444, %.us-lcssa204.loopexit ], [ %indvars.iv372444, %.us-lcssa204.loopexit570 ], [ %indvars.iv.next373, %.us-lcssa204.loopexit571 ]
  %181 = trunc i64 %indvars.iv372.lcssa to i32
  %sunkaddr398 = ptrtoint %struct.box* %1 to i64
  %sunkaddr399 = add i64 %sunkaddr398, 16
  %sunkaddr400 = inttoptr i64 %sunkaddr399 to i32*
  store i32 %181, i32* %sunkaddr400, align 8
  br label %.loopexit36

; <label>:182:                                    ; preds = %.lr.ph438, %177
  %.41977437 = phi i32 [ %.031, %.lr.ph438 ], [ %178, %177 ]
  %.478436 = phi i16* [ %176, %.lr.ph438 ], [ %183, %177 ]
  %183 = getelementptr inbounds i16, i16* %.478436, i64 32
  %184 = icmp slt i32 %.41977437, %.03
  br i1 %184, label %177, label %._crit_edge81

._crit_edge81:                                    ; preds = %182
  %185 = icmp slt i64 %indvars.iv370441, %161
  br i1 %185, label %.lr.ph80, label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge81
  %indvars.iv.next373 = add nsw i64 %indvars.iv372444, 1
  %186 = icmp slt i64 %indvars.iv372444, %36
  br i1 %186, label %.preheader34, label %.loopexit36.loopexit

.loopexit36.loopexit:                             ; preds = %._crit_edge84
  br label %.loopexit36

.loopexit36:                                      ; preds = %.loopexit36.loopexit, %.preheader34.lr.ph, %.loopexit39, %.us-lcssa204
  %.02 = phi i32 [ %181, %.us-lcssa204 ], [ %27, %.loopexit39 ], [ %27, %.preheader34.lr.ph ], [ %27, %.loopexit36.loopexit ]
  %187 = icmp sgt i32 %34, %.02
  br i1 %187, label %.preheader32.lr.ph, label %.loopexit

.preheader32.lr.ph:                               ; preds = %.loopexit36
  %188 = icmp slt i32 %.030, %.029
  %189 = sext i32 %.031 to i64
  %190 = icmp slt i32 %.03, %.031
  %or.cond412 = or i1 %188, %190
  br i1 %or.cond412, label %.loopexit, label %.preheader32.preheader

.preheader32.preheader:                           ; preds = %.preheader32.lr.ph
  %191 = sext i32 %.029 to i64
  %192 = sext i32 %.030 to i64
  %193 = sext i32 %.02 to i64
  %194 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %191
  %195 = load [32 x i16]*, [32 x i16]** %194, align 8
  %196 = getelementptr inbounds [32 x i16], [32 x i16]* %195, i64 %189, i64 %35
  %197 = load i16, i16* %196, align 2
  %198 = icmp eq i16 %197, 0
  br i1 %198, label %.lr.ph429.lr.ph.preheader, label %.us-lcssa

.lr.ph429.lr.ph.preheader:                        ; preds = %.preheader32.preheader
  %sunkaddr527 = ptrtoint [32 x i16]** %7 to i64
  %sunkaddr523 = ptrtoint [32 x i16]** %7 to i64
  %sunkaddr524 = shl nsw i64 %191, 3
  %sunkaddr525 = add i64 %sunkaddr523, %sunkaddr524
  %sunkaddr526 = inttoptr i64 %sunkaddr525 to [32 x i16]**
  br label %.lr.ph429.lr.ph

.preheader32:                                     ; preds = %._crit_edge74
  %199 = load [32 x i16]*, [32 x i16]** %sunkaddr526, align 8
  %200 = getelementptr inbounds [32 x i16], [32 x i16]* %199, i64 %189, i64 %indvars.iv.next369
  %201 = load i16, i16* %200, align 2
  %202 = icmp eq i16 %201, 0
  br i1 %202, label %.lr.ph429.lr.ph, label %.us-lcssa.loopexit569

.lr.ph429.lr.ph:                                  ; preds = %.lr.ph429.lr.ph.preheader, %.preheader32
  %203 = phi i16* [ %200, %.preheader32 ], [ %196, %.lr.ph429.lr.ph.preheader ]
  %indvars.iv368434 = phi i64 [ %indvars.iv.next369, %.preheader32 ], [ %35, %.lr.ph429.lr.ph.preheader ]
  br label %.lr.ph429

.lr.ph70:                                         ; preds = %._crit_edge71
  %indvars.iv.next367 = add nsw i64 %indvars.iv366431, 1
  %sunkaddr528 = shl i64 %indvars.iv366431, 3
  %sunkaddr529 = add i64 %sunkaddr527, %sunkaddr528
  %sunkaddr530 = add i64 %sunkaddr529, 8
  %sunkaddr531 = inttoptr i64 %sunkaddr530 to [32 x i16]**
  %204 = load [32 x i16]*, [32 x i16]** %sunkaddr531, align 8
  %205 = getelementptr inbounds [32 x i16], [32 x i16]* %204, i64 %189, i64 %indvars.iv368434
  %206 = load i16, i16* %205, align 2
  %207 = icmp eq i16 %206, 0
  br i1 %207, label %.lr.ph429, label %.us-lcssa.loopexit568

.lr.ph429:                                        ; preds = %.lr.ph429.lr.ph, %.lr.ph70
  %208 = phi i16* [ %203, %.lr.ph429.lr.ph ], [ %205, %.lr.ph70 ]
  %indvars.iv366431 = phi i64 [ %191, %.lr.ph429.lr.ph ], [ %indvars.iv.next367, %.lr.ph70 ]
  br label %214

; <label>:209:                                    ; preds = %214
  %210 = add nsw i32 %.52067428, 1
  %211 = load i16, i16* %215, align 2
  %212 = icmp eq i16 %211, 0
  br i1 %212, label %214, label %.us-lcssa.loopexit

.us-lcssa.loopexit:                               ; preds = %209
  br label %.us-lcssa

.us-lcssa.loopexit568:                            ; preds = %.lr.ph70
  br label %.us-lcssa

.us-lcssa.loopexit569:                            ; preds = %.preheader32
  br label %.us-lcssa

.us-lcssa:                                        ; preds = %.us-lcssa.loopexit569, %.us-lcssa.loopexit568, %.us-lcssa.loopexit, %.preheader32.preheader
  %indvars.iv368.lcssa = phi i64 [ %35, %.preheader32.preheader ], [ %indvars.iv368434, %.us-lcssa.loopexit ], [ %indvars.iv368434, %.us-lcssa.loopexit568 ], [ %indvars.iv.next369, %.us-lcssa.loopexit569 ]
  %213 = trunc i64 %indvars.iv368.lcssa to i32
  %sunkaddr401 = ptrtoint %struct.box* %1 to i64
  %sunkaddr402 = add i64 %sunkaddr401, 20
  %sunkaddr403 = inttoptr i64 %sunkaddr402 to i32*
  store i32 %213, i32* %sunkaddr403, align 4
  br label %.loopexit

; <label>:214:                                    ; preds = %.lr.ph429, %209
  %.52067428 = phi i32 [ %.031, %.lr.ph429 ], [ %210, %209 ]
  %.568427 = phi i16* [ %208, %.lr.ph429 ], [ %215, %209 ]
  %215 = getelementptr inbounds i16, i16* %.568427, i64 32
  %216 = icmp slt i32 %.52067428, %.03
  br i1 %216, label %209, label %._crit_edge71

._crit_edge71:                                    ; preds = %214
  %217 = icmp slt i64 %indvars.iv366431, %192
  br i1 %217, label %.lr.ph70, label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge71
  %indvars.iv.next369 = add nsw i64 %indvars.iv368434, -1
  %218 = icmp sgt i64 %indvars.iv368434, %193
  br i1 %218, label %.preheader32, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge74
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader32.lr.ph, %.loopexit36, %.us-lcssa
  %.01 = phi i32 [ %213, %.us-lcssa ], [ %34, %.loopexit36 ], [ %34, %.preheader32.lr.ph ], [ %34, %.loopexit.loopexit ]
  %219 = sub nsw i32 %.030, %.029
  %220 = shl i32 %219, 4
  %221 = sext i32 %220 to i64
  %222 = sub nsw i32 %.03, %.031
  %223 = mul i32 %222, 12
  %224 = sext i32 %223 to i64
  %225 = sub nsw i32 %.01, %.02
  %226 = shl i32 %225, 3
  %227 = sext i32 %226 to i64
  %228 = mul nsw i64 %221, %221
  %229 = mul nsw i64 %224, %224
  %230 = add nuw nsw i64 %229, %228
  %231 = mul nsw i64 %227, %227
  %232 = add nuw nsw i64 %230, %231
  %233 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 6
  store i64 %232, i64* %233, align 8
  %234 = icmp slt i32 %.030, %.029
  br i1 %234, label %._crit_edge65, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.loopexit
  %235 = icmp slt i32 %.03, %.031
  %236 = sext i32 %.02 to i64
  %237 = icmp slt i32 %.01, %.02
  %or.cond413 = or i1 %235, %237
  br i1 %or.cond413, label %._crit_edge65, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %238 = sext i32 %.031 to i64
  %239 = sext i32 %.03 to i64
  %240 = sext i32 %.029 to i64
  %241 = sext i32 %.030 to i64
  %242 = add nsw i64 %239, 1
  %243 = sub nsw i64 %242, %238
  %xtraiter = and i64 %243, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %indvars.iv.next.prol = add nsw i64 %238, 1
  %244 = icmp eq i32 %.03, %.031
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge61, %.preheader.preheader
  %indvars.iv364 = phi i64 [ %240, %.preheader.preheader ], [ %indvars.iv.next365, %._crit_edge61 ]
  %.064 = phi i64 [ 0, %.preheader.preheader ], [ %.2..lcssa.lcssa, %._crit_edge61 ]
  %245 = getelementptr inbounds [32 x i16]*, [32 x i16]** %7, i64 %indvars.iv364
  %246 = load [32 x i16]*, [32 x i16]** %245, align 8
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %247 = getelementptr inbounds [32 x i16], [32 x i16]* %246, i64 %238, i64 %236
  br label %248

; <label>:248:                                    ; preds = %248, %.lr.ph.prol
  %.257.prol = phi i64 [ %.064, %.lr.ph.prol ], [ %.2..prol, %248 ]
  %.656.prol = phi i16* [ %247, %.lr.ph.prol ], [ %252, %248 ]
  %.62855.prol = phi i32 [ %.02, %.lr.ph.prol ], [ %251, %248 ]
  %249 = load i16, i16* %.656.prol, align 2
  %not..prol = icmp ne i16 %249, 0
  %250 = zext i1 %not..prol to i64
  %.2..prol = add nsw i64 %250, %.257.prol
  %251 = add nsw i32 %.62855.prol, 1
  %252 = getelementptr inbounds i16, i16* %.656.prol, i64 1
  %253 = icmp slt i32 %.62855.prol, %.01
  br i1 %253, label %248, label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %248
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.preheader, %._crit_edge.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %._crit_edge.prol ], [ %238, %.preheader ]
  %.159.unr.ph = phi i64 [ %.2..prol, %._crit_edge.prol ], [ %.064, %.preheader ]
  %.2..lcssa.lcssa.unr.ph = phi i64 [ %.2..prol, %._crit_edge.prol ], [ undef, %.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  br i1 %244, label %._crit_edge61, label %.preheader.new

.preheader.new:                                   ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge.1, %.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.new ], [ %indvars.iv.next.1, %._crit_edge.1 ]
  %.159 = phi i64 [ %.159.unr.ph, %.preheader.new ], [ %.2..1, %._crit_edge.1 ]
  %254 = getelementptr inbounds [32 x i16], [32 x i16]* %246, i64 %indvars.iv, i64 %236
  br label %255

; <label>:255:                                    ; preds = %255, %.lr.ph
  %.257 = phi i64 [ %.159, %.lr.ph ], [ %.2., %255 ]
  %.656 = phi i16* [ %254, %.lr.ph ], [ %259, %255 ]
  %.62855 = phi i32 [ %.02, %.lr.ph ], [ %258, %255 ]
  %256 = load i16, i16* %.656, align 2
  %not. = icmp ne i16 %256, 0
  %257 = zext i1 %not. to i64
  %.2. = add nsw i64 %257, %.257
  %258 = add nsw i32 %.62855, 1
  %259 = getelementptr inbounds i16, i16* %.656, i64 1
  %260 = icmp slt i32 %.62855, %.01
  br i1 %260, label %255, label %._crit_edge

._crit_edge:                                      ; preds = %255
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %261 = getelementptr inbounds [32 x i16], [32 x i16]* %246, i64 %indvars.iv.next, i64 %236
  br label %264

._crit_edge61.unr-lcssa:                          ; preds = %._crit_edge.1
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %.lr.ph.prol.loopexit, %._crit_edge61.unr-lcssa
  %.2..lcssa.lcssa = phi i64 [ %.2..lcssa.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %.2..1, %._crit_edge61.unr-lcssa ]
  %indvars.iv.next365 = add nsw i64 %indvars.iv364, 1
  %262 = icmp slt i64 %indvars.iv364, %241
  br i1 %262, label %.preheader, label %._crit_edge65.loopexit

._crit_edge65.loopexit:                           ; preds = %._crit_edge61
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %.preheader.lr.ph, %.loopexit
  %.0.lcssa = phi i64 [ 0, %.loopexit ], [ 0, %.preheader.lr.ph ], [ %.2..lcssa.lcssa, %._crit_edge65.loopexit ]
  %263 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 7
  store i64 %.0.lcssa, i64* %263, align 8
  ret void

; <label>:264:                                    ; preds = %264, %._crit_edge
  %.257.1 = phi i64 [ %.2., %._crit_edge ], [ %.2..1, %264 ]
  %.656.1 = phi i16* [ %261, %._crit_edge ], [ %268, %264 ]
  %.62855.1 = phi i32 [ %.02, %._crit_edge ], [ %267, %264 ]
  %265 = load i16, i16* %.656.1, align 2
  %not..1 = icmp ne i16 %265, 0
  %266 = zext i1 %not..1 to i64
  %.2..1 = add nsw i64 %266, %.257.1
  %267 = add nsw i32 %.62855.1, 1
  %268 = getelementptr inbounds i16, i16* %.656.1, i64 1
  %269 = icmp slt i32 %.62855.1, %.01
  br i1 %269, label %264, label %._crit_edge.1

._crit_edge.1:                                    ; preds = %264
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %270 = icmp slt i64 %indvars.iv.next, %239
  br i1 %270, label %.lr.ph, label %._crit_edge61.unr-lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @median_cut(%struct.jpeg_decompress_struct* nocapture readonly, %struct.box*, i32) unnamed_addr #1 {
  %4 = icmp sgt i32 %2, 1
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = sext i32 %2 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %61, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next, %61 ]
  %.027 = phi i32 [ 1, %.lr.ph.preheader ], [ %62, %61 ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = shl nsw i32 %6, 1
  %8 = icmp sgt i32 %7, %2
  %9 = trunc i64 %indvars.iv to i32
  br i1 %8, label %12, label %10

; <label>:10:                                     ; preds = %.lr.ph
  %11 = tail call fastcc %struct.box* @find_biggest_color_pop(%struct.box* %1, i32 %9)
  br label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = tail call fastcc %struct.box* @find_biggest_volume(%struct.box* %1, i32 %9)
  br label %14

; <label>:14:                                     ; preds = %12, %10
  %.0 = phi %struct.box* [ %11, %10 ], [ %13, %12 ]
  %15 = icmp eq %struct.box* %.0, null
  %16 = trunc i64 %indvars.iv to i32
  br i1 %15, label %._crit_edge.loopexit, label %17

; <label>:17:                                     ; preds = %14
  %18 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv
  %19 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 1
  %20 = load i32, i32* %19, align 4
  %21 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv, i32 1
  store i32 %20, i32* %21, align 4
  %22 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 3
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv, i32 3
  store i32 %23, i32* %24, align 4
  %25 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 5
  %26 = load i32, i32* %25, align 4
  %27 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv, i32 5
  store i32 %26, i32* %27, align 4
  %28 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 0
  %29 = load i32, i32* %28, align 8
  %30 = getelementptr inbounds %struct.box, %struct.box* %18, i64 0, i32 0
  store i32 %29, i32* %30, align 8
  %31 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 2
  %32 = load i32, i32* %31, align 8
  %33 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv, i32 2
  store i32 %32, i32* %33, align 8
  %34 = getelementptr inbounds %struct.box, %struct.box* %.0, i64 0, i32 4
  %35 = load i32, i32* %34, align 8
  %36 = getelementptr inbounds %struct.box, %struct.box* %1, i64 %indvars.iv, i32 4
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
  %.4 = select i1 %49, i32 %40, i32 %44
  %50 = icmp sgt i32 %48, %.4
  %51 = zext i1 %not. to i2
  %trunc = select i1 %50, i2 -2, i2 %51
  switch i2 %trunc, label %61 [
    i2 0, label %52
    i2 1, label %55
    i2 -2, label %57
  ]

; <label>:52:                                     ; preds = %17
  %53 = getelementptr inbounds %struct.box, %struct.box* %18, i64 0, i32 0
  %54 = add nsw i32 %38, %37
  br label %.sink.split

; <label>:55:                                     ; preds = %17
  %56 = add nsw i32 %42, %41
  br label %.sink.split

; <label>:57:                                     ; preds = %17
  %58 = add nsw i32 %46, %45
  br label %.sink.split

.sink.split:                                      ; preds = %52, %55, %57
  %.sink1 = phi i32 [ %54, %52 ], [ %56, %55 ], [ %58, %57 ]
  %.sink18 = phi i64 [ 4, %52 ], [ 12, %55 ], [ 20, %57 ]
  %.sink5 = phi i32* [ %53, %52 ], [ %33, %55 ], [ %36, %57 ]
  %59 = sdiv i32 %.sink1, 2
  %sunkaddr = ptrtoint %struct.box* %.0 to i64
  %sunkaddr10 = add i64 %sunkaddr, %.sink18
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  store i32 %59, i32* %sunkaddr11, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %.sink5, align 8
  br label %61

; <label>:61:                                     ; preds = %17, %.sink.split
  tail call fastcc void @update_box(%struct.jpeg_decompress_struct* %0, %struct.box* nonnull %.0)
  tail call fastcc void @update_box(%struct.jpeg_decompress_struct* %0, %struct.box* %18)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %62 = add nuw nsw i32 %.027, 1
  %63 = icmp slt i64 %indvars.iv.next, %5
  br i1 %63, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %14, %61
  %.02.lcssa.ph = phi i32 [ %16, %14 ], [ %62, %61 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %.02.lcssa = phi i32 [ 1, %3 ], [ %.02.lcssa.ph, %._crit_edge.loopexit ]
  ret i32 %.02.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @compute_color(%struct.jpeg_decompress_struct* nocapture readonly, %struct.box* nocapture readonly, i32) unnamed_addr #1 {
  %4 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %5 = bitcast %struct.jpeg_color_quantizer** %4 to %struct.my_cquantizer**
  %6 = load %struct.my_cquantizer*, %struct.my_cquantizer** %5, align 8
  %7 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %6, i64 0, i32 3
  %8 = load [32 x i16]**, [32 x i16]*** %7, align 8
  %9 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 0
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 1
  %12 = load i32, i32* %11, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 2
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 3
  %18 = load i32, i32* %17, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 4
  %21 = load i32, i32* %20, align 8
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.box, %struct.box* %1, i64 0, i32 5
  %24 = load i32, i32* %23, align 4
  %25 = sext i32 %24 to i64
  %26 = icmp sgt i32 %10, %12
  %27 = icmp sgt i32 %15, %18
  %or.cond = or i1 %26, %27
  br i1 %or.cond, label %._crit_edge42, label %.preheader.preheader

.preheader.preheader:                             ; preds = %3
  %28 = sext i32 %10 to i64
  %29 = icmp sgt i32 %21, %24
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge32
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge32 ], [ %28, %.preheader.preheader ]
  %.041 = phi i64 [ %split36, %._crit_edge32 ], [ 0, %.preheader.preheader ]
  %.0140 = phi i64 [ %split35, %._crit_edge32 ], [ 0, %.preheader.preheader ]
  %.0539 = phi i64 [ %split34, %._crit_edge32 ], [ 0, %.preheader.preheader ]
  %.0938 = phi i64 [ %split33, %._crit_edge32 ], [ 0, %.preheader.preheader ]
  %30 = getelementptr inbounds [32 x i16]*, [32 x i16]** %8, i64 %indvars.iv82
  %31 = load [32 x i16]*, [32 x i16]** %30, align 8
  %32 = trunc i64 %indvars.iv82 to i32
  %33 = shl i32 %32, 3
  %34 = or i32 %33, 4
  %35 = sext i32 %34 to i64
  br i1 %29, label %._crit_edge32, label %.lr.ph31.split.preheader

.lr.ph31.split.preheader:                         ; preds = %.preheader
  br label %.lr.ph31.split

.lr.ph31.split:                                   ; preds = %.lr.ph31.split.preheader, %._crit_edge
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge ], [ %16, %.lr.ph31.split.preheader ]
  %.130 = phi i64 [ %.3, %._crit_edge ], [ %.041, %.lr.ph31.split.preheader ]
  %.1229 = phi i64 [ %.34, %._crit_edge ], [ %.0140, %.lr.ph31.split.preheader ]
  %.1628 = phi i64 [ %.38, %._crit_edge ], [ %.0539, %.lr.ph31.split.preheader ]
  %.11027 = phi i64 [ %.312, %._crit_edge ], [ %.0938, %.lr.ph31.split.preheader ]
  %36 = getelementptr inbounds [32 x i16], [32 x i16]* %31, i64 %indvars.iv80, i64 %22
  %37 = trunc i64 %indvars.iv80 to i32
  %38 = shl i32 %37, 2
  %39 = or i32 %38, 2
  %40 = sext i32 %39 to i64
  br label %41

; <label>:41:                                     ; preds = %58, %.lr.ph31.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %58 ], [ %22, %.lr.ph31.split ]
  %.222 = phi i64 [ %.3, %58 ], [ %.130, %.lr.ph31.split ]
  %.2321 = phi i64 [ %.34, %58 ], [ %.1229, %.lr.ph31.split ]
  %.2720 = phi i64 [ %.38, %58 ], [ %.1628, %.lr.ph31.split ]
  %.21119 = phi i64 [ %.312, %58 ], [ %.11027, %.lr.ph31.split ]
  %.01417 = phi i16* [ %42, %58 ], [ %36, %.lr.ph31.split ]
  %42 = getelementptr inbounds i16, i16* %.01417, i64 1
  %43 = load i16, i16* %.01417, align 2
  %44 = zext i16 %43 to i64
  %45 = icmp eq i16 %43, 0
  br i1 %45, label %58, label %46

; <label>:46:                                     ; preds = %41
  %47 = add nsw i64 %44, %.21119
  %48 = mul nsw i64 %44, %35
  %49 = add nsw i64 %48, %.2720
  %50 = mul nsw i64 %44, %40
  %51 = add nsw i64 %50, %.2321
  %52 = trunc i64 %indvars.iv to i32
  %53 = shl i32 %52, 3
  %54 = or i32 %53, 4
  %55 = sext i32 %54 to i64
  %56 = mul nsw i64 %44, %55
  %57 = add nsw i64 %56, %.222
  br label %58

; <label>:58:                                     ; preds = %41, %46
  %.312 = phi i64 [ %47, %46 ], [ %.21119, %41 ]
  %.38 = phi i64 [ %49, %46 ], [ %.2720, %41 ]
  %.34 = phi i64 [ %51, %46 ], [ %.2321, %41 ]
  %.3 = phi i64 [ %57, %46 ], [ %.222, %41 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %59 = icmp slt i64 %indvars.iv, %25
  br i1 %59, label %41, label %._crit_edge

._crit_edge:                                      ; preds = %58
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, 1
  %60 = icmp slt i64 %indvars.iv80, %19
  br i1 %60, label %.lr.ph31.split, label %._crit_edge32.loopexit

._crit_edge32.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.preheader
  %split33 = phi i64 [ %.0938, %.preheader ], [ %.312, %._crit_edge32.loopexit ]
  %split34 = phi i64 [ %.0539, %.preheader ], [ %.38, %._crit_edge32.loopexit ]
  %split35 = phi i64 [ %.0140, %.preheader ], [ %.34, %._crit_edge32.loopexit ]
  %split36 = phi i64 [ %.041, %.preheader ], [ %.3, %._crit_edge32.loopexit ]
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %61 = icmp slt i64 %indvars.iv82, %13
  br i1 %61, label %.preheader, label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %._crit_edge32
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %3
  %.09.lcssa = phi i64 [ 0, %3 ], [ %split33, %._crit_edge42.loopexit ]
  %.05.lcssa = phi i64 [ 0, %3 ], [ %split34, %._crit_edge42.loopexit ]
  %.01.lcssa = phi i64 [ 0, %3 ], [ %split35, %._crit_edge42.loopexit ]
  %.0.lcssa = phi i64 [ 0, %3 ], [ %split36, %._crit_edge42.loopexit ]
  %62 = ashr i64 %.09.lcssa, 1
  %63 = add nsw i64 %.05.lcssa, %62
  %64 = sdiv i64 %63, %.09.lcssa
  %65 = trunc i64 %64 to i8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %67 = load i8**, i8*** %66, align 8
  %68 = load i8*, i8** %67, align 8
  %69 = sext i32 %2 to i64
  %70 = getelementptr inbounds i8, i8* %68, i64 %69
  store i8 %65, i8* %70, align 1
  %71 = add nsw i64 %.01.lcssa, %62
  %72 = sdiv i64 %71, %.09.lcssa
  %73 = trunc i64 %72 to i8
  %74 = load i8**, i8*** %66, align 8
  %75 = getelementptr inbounds i8*, i8** %74, i64 1
  %76 = load i8*, i8** %75, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 %69
  store i8 %73, i8* %77, align 1
  %78 = add nsw i64 %.0.lcssa, %62
  %79 = sdiv i64 %78, %.09.lcssa
  %80 = trunc i64 %79 to i8
  %81 = load i8**, i8*** %66, align 8
  %82 = getelementptr inbounds i8*, i8** %81, i64 2
  %83 = load i8*, i8** %82, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 %69
  store i8 %80, i8* %84, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc %struct.box* @find_biggest_color_pop(%struct.box* readonly, i32) unnamed_addr #4 {
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

; <label>:11:                                     ; preds = %.lr.ph.prol, %7
  %.12.prol = phi i64 [ %..01.prol, %7 ], [ 0, %.lr.ph.prol ]
  %.1.prol = phi %struct.box* [ %.03..0.prol, %7 ], [ null, %.lr.ph.prol ]
  %12 = getelementptr inbounds %struct.box, %struct.box* %0, i64 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %11
  %.08.unr = phi %struct.box* [ %.1.prol, %11 ], [ null, %.lr.ph.preheader ]
  %.017.unr = phi i64 [ %.12.prol, %11 ], [ 0, %.lr.ph.preheader ]
  %.036.unr = phi %struct.box* [ %12, %11 ], [ %0, %.lr.ph.preheader ]
  %.045.unr = phi i32 [ 1, %11 ], [ 0, %.lr.ph.preheader ]
  %.1.lcssa.unr = phi %struct.box* [ %.1.prol, %11 ], [ undef, %.lr.ph.preheader ]
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

.lr.ph.19:                                        ; preds = %.lr.ph, %17
  %.12 = phi i64 [ %..01, %17 ], [ %.017, %.lr.ph ]
  %.1 = phi %struct.box* [ %.03..0, %17 ], [ %.08, %.lr.ph ]
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

; <label>:29:                                     ; preds = %.lr.ph.19, %24
  %.12.1 = phi i64 [ %..01.1, %24 ], [ %.12, %.lr.ph.19 ]
  %.1.1 = phi %struct.box* [ %.03..0.1, %24 ], [ %.1, %.lr.ph.19 ]
  %30 = add nuw nsw i32 %.045, 2
  %31 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 2
  %exitcond.1 = icmp eq i32 %30, %1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc %struct.box* @find_biggest_volume(%struct.box* readonly, i32) unnamed_addr #4 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %4 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.preheader..lr.ph.prol_crit_edge

.lr.ph.preheader..lr.ph.prol_crit_edge:           ; preds = %.lr.ph.preheader
  %5 = add nsw i32 %xtraiter, -1
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, 1
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.preheader..lr.ph.prol_crit_edge
  %.08.prol = phi %struct.box* [ %.03..0.prol, %.lr.ph.prol ], [ null, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %.017.prol = phi i64 [ %..01.prol, %.lr.ph.prol ], [ 0, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %.036.prol = phi %struct.box* [ %11, %.lr.ph.prol ], [ %0, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %8 = getelementptr inbounds %struct.box, %struct.box* %.036.prol, i64 0, i32 6
  %9 = load i64, i64* %8, align 8
  %10 = icmp sgt i64 %9, %.017.prol
  %..01.prol = select i1 %10, i64 %9, i64 %.017.prol
  %.03..0.prol = select i1 %10, %struct.box* %.036.prol, %struct.box* %.08.prol
  %11 = getelementptr inbounds %struct.box, %struct.box* %.036.prol, i64 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol..lr.ph.prol.loopexit_crit_edge:       ; preds = %.lr.ph.prol
  %scevgep = getelementptr %struct.box, %struct.box* %0, i64 %7
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge
  %.08.unr = phi %struct.box* [ %.03..0.prol, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ null, %.lr.ph.preheader ]
  %.017.unr = phi i64 [ %..01.prol, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ 0, %.lr.ph.preheader ]
  %.036.unr = phi %struct.box* [ %scevgep, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ %0, %.lr.ph.preheader ]
  %.045.unr = phi i32 [ %xtraiter, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ 0, %.lr.ph.preheader ]
  %.03..0.lcssa.unr = phi %struct.box* [ %.03..0.prol, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ], [ undef, %.lr.ph.preheader ]
  %12 = icmp ult i32 %4, 3
  br i1 %12, label %._crit_edge, label %.lr.ph.preheader12

.lr.ph.preheader12:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader12, %.lr.ph
  %.08 = phi %struct.box* [ %.03..0.3, %.lr.ph ], [ %.08.unr, %.lr.ph.preheader12 ]
  %.017 = phi i64 [ %..01.3, %.lr.ph ], [ %.017.unr, %.lr.ph.preheader12 ]
  %.036 = phi %struct.box* [ %29, %.lr.ph ], [ %.036.unr, %.lr.ph.preheader12 ]
  %.045 = phi i32 [ %28, %.lr.ph ], [ %.045.unr, %.lr.ph.preheader12 ]
  %13 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 0, i32 6
  %14 = load i64, i64* %13, align 8
  %15 = icmp sgt i64 %14, %.017
  %..01 = select i1 %15, i64 %14, i64 %.017
  %.03..0 = select i1 %15, %struct.box* %.036, %struct.box* %.08
  %16 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 1
  %17 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 1, i32 6
  %18 = load i64, i64* %17, align 8
  %19 = icmp sgt i64 %18, %..01
  %..01.1 = select i1 %19, i64 %18, i64 %..01
  %.03..0.1 = select i1 %19, %struct.box* %16, %struct.box* %.03..0
  %20 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 2
  %21 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 2, i32 6
  %22 = load i64, i64* %21, align 8
  %23 = icmp sgt i64 %22, %..01.1
  %..01.2 = select i1 %23, i64 %22, i64 %..01.1
  %.03..0.2 = select i1 %23, %struct.box* %20, %struct.box* %.03..0.1
  %24 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 3
  %25 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 3, i32 6
  %26 = load i64, i64* %25, align 8
  %27 = icmp sgt i64 %26, %..01.2
  %..01.3 = select i1 %27, i64 %26, i64 %..01.2
  %.03..0.3 = select i1 %27, %struct.box* %24, %struct.box* %.03..0.2
  %28 = add nsw i32 %.045, 4
  %29 = getelementptr inbounds %struct.box, %struct.box* %.036, i64 4
  %exitcond.3 = icmp eq i32 %28, %1
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  %.0.lcssa = phi %struct.box* [ null, %2 ], [ %.03..0.lcssa.unr, %.lr.ph.prol.loopexit ], [ %.03..0.3, %._crit_edge.loopexit ]
  ret %struct.box* %.0.lcssa
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @fill_inverse_cmap(%struct.jpeg_decompress_struct* nocapture readonly, i32, i32, i32) unnamed_addr #1 {
  %5 = alloca [256 x i8], align 16
  %6 = alloca [128 x i8], align 16
  %.sub16 = getelementptr inbounds [256 x i8], [256 x i8]* %5, i64 0, i64 0
  %.sub = getelementptr inbounds [128 x i8], [128 x i8]* %6, i64 0, i64 0
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
  %21 = call fastcc i32 @find_nearby_colors(%struct.jpeg_decompress_struct* %0, i32 %16, i32 %18, i32 %20, i8* nonnull %.sub16)
  call fastcc void @find_best_colors(%struct.jpeg_decompress_struct* %0, i32 %16, i32 %18, i32 %20, i32 %21, i8* nonnull %.sub16, i8* nonnull %.sub)
  %22 = shl nsw i32 %12, 2
  %23 = shl nsw i32 %13, 3
  %24 = shl nsw i32 %14, 2
  %25 = sext i32 %24 to i64
  %26 = sext i32 %23 to i64
  %27 = sext i32 %22 to i64
  %28 = or i64 %26, 1
  %29 = or i64 %26, 2
  %30 = or i64 %26, 3
  %31 = or i64 %26, 4
  %32 = or i64 %26, 5
  %33 = or i64 %26, 6
  %34 = or i64 %26, 7
  br label %36

; <label>:35:                                     ; preds = %36
  ret void

; <label>:36:                                     ; preds = %36, %4
  %indvars.iv = phi i64 [ 0, %4 ], [ %indvars.iv.next, %36 ]
  %.0111 = phi i8* [ %.sub, %4 ], [ %scevgep12, %36 ]
  %37 = add nuw nsw i64 %indvars.iv, %27
  %38 = getelementptr inbounds [32 x i16]*, [32 x i16]** %11, i64 %37
  %39 = load [32 x i16]*, [32 x i16]** %38, align 8
  %40 = getelementptr inbounds [32 x i16], [32 x i16]* %39, i64 %26, i64 %25
  %41 = load i8, i8* %.0111, align 1
  %42 = zext i8 %41 to i16
  %43 = add nuw nsw i16 %42, 1
  store i16 %43, i16* %40, align 2
  %44 = getelementptr inbounds i16, i16* %40, i64 1
  %45 = getelementptr inbounds i8, i8* %.0111, i64 1
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i16
  %48 = add nuw nsw i16 %47, 1
  store i16 %48, i16* %44, align 2
  %49 = getelementptr inbounds i16, i16* %40, i64 2
  %50 = getelementptr inbounds i8, i8* %.0111, i64 2
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i16
  %53 = add nuw nsw i16 %52, 1
  store i16 %53, i16* %49, align 2
  %54 = getelementptr inbounds i16, i16* %40, i64 3
  %55 = getelementptr inbounds i8, i8* %.0111, i64 3
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i16
  %58 = add nuw nsw i16 %57, 1
  store i16 %58, i16* %54, align 2
  %59 = load [32 x i16]*, [32 x i16]** %38, align 8
  %60 = getelementptr inbounds [32 x i16], [32 x i16]* %59, i64 %28, i64 %25
  %scevgep = getelementptr i8, i8* %.0111, i64 4
  %61 = load i8, i8* %scevgep, align 1
  %62 = zext i8 %61 to i16
  %63 = add nuw nsw i16 %62, 1
  store i16 %63, i16* %60, align 2
  %64 = getelementptr inbounds i16, i16* %60, i64 1
  %65 = getelementptr inbounds i8, i8* %.0111, i64 5
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i16
  %68 = add nuw nsw i16 %67, 1
  store i16 %68, i16* %64, align 2
  %69 = getelementptr inbounds i16, i16* %60, i64 2
  %70 = getelementptr inbounds i8, i8* %.0111, i64 6
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i16
  %73 = add nuw nsw i16 %72, 1
  store i16 %73, i16* %69, align 2
  %74 = getelementptr inbounds i16, i16* %60, i64 3
  %75 = getelementptr inbounds i8, i8* %.0111, i64 7
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i16
  %78 = add nuw nsw i16 %77, 1
  store i16 %78, i16* %74, align 2
  %79 = load [32 x i16]*, [32 x i16]** %38, align 8
  %80 = getelementptr inbounds [32 x i16], [32 x i16]* %79, i64 %29, i64 %25
  %scevgep.1 = getelementptr i8, i8* %.0111, i64 8
  %81 = load i8, i8* %scevgep.1, align 1
  %82 = zext i8 %81 to i16
  %83 = add nuw nsw i16 %82, 1
  store i16 %83, i16* %80, align 2
  %84 = getelementptr inbounds i16, i16* %80, i64 1
  %85 = getelementptr inbounds i8, i8* %.0111, i64 9
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i16
  %88 = add nuw nsw i16 %87, 1
  store i16 %88, i16* %84, align 2
  %89 = getelementptr inbounds i16, i16* %80, i64 2
  %90 = getelementptr inbounds i8, i8* %.0111, i64 10
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i16
  %93 = add nuw nsw i16 %92, 1
  store i16 %93, i16* %89, align 2
  %94 = getelementptr inbounds i16, i16* %80, i64 3
  %95 = getelementptr inbounds i8, i8* %.0111, i64 11
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i16
  %98 = add nuw nsw i16 %97, 1
  store i16 %98, i16* %94, align 2
  %99 = load [32 x i16]*, [32 x i16]** %38, align 8
  %100 = getelementptr inbounds [32 x i16], [32 x i16]* %99, i64 %30, i64 %25
  %scevgep.2 = getelementptr i8, i8* %.0111, i64 12
  %101 = load i8, i8* %scevgep.2, align 1
  %102 = zext i8 %101 to i16
  %103 = add nuw nsw i16 %102, 1
  store i16 %103, i16* %100, align 2
  %104 = getelementptr inbounds i16, i16* %100, i64 1
  %105 = getelementptr inbounds i8, i8* %.0111, i64 13
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i16
  %108 = add nuw nsw i16 %107, 1
  store i16 %108, i16* %104, align 2
  %109 = getelementptr inbounds i16, i16* %100, i64 2
  %110 = getelementptr inbounds i8, i8* %.0111, i64 14
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i16
  %113 = add nuw nsw i16 %112, 1
  store i16 %113, i16* %109, align 2
  %114 = getelementptr inbounds i16, i16* %100, i64 3
  %115 = getelementptr inbounds i8, i8* %.0111, i64 15
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i16
  %118 = add nuw nsw i16 %117, 1
  store i16 %118, i16* %114, align 2
  %119 = load [32 x i16]*, [32 x i16]** %38, align 8
  %120 = getelementptr inbounds [32 x i16], [32 x i16]* %119, i64 %31, i64 %25
  %scevgep.3 = getelementptr i8, i8* %.0111, i64 16
  %121 = load i8, i8* %scevgep.3, align 1
  %122 = zext i8 %121 to i16
  %123 = add nuw nsw i16 %122, 1
  store i16 %123, i16* %120, align 2
  %124 = getelementptr inbounds i16, i16* %120, i64 1
  %125 = getelementptr inbounds i8, i8* %.0111, i64 17
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i16
  %128 = add nuw nsw i16 %127, 1
  store i16 %128, i16* %124, align 2
  %129 = getelementptr inbounds i16, i16* %120, i64 2
  %130 = getelementptr inbounds i8, i8* %.0111, i64 18
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i16
  %133 = add nuw nsw i16 %132, 1
  store i16 %133, i16* %129, align 2
  %134 = getelementptr inbounds i16, i16* %120, i64 3
  %135 = getelementptr inbounds i8, i8* %.0111, i64 19
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i16
  %138 = add nuw nsw i16 %137, 1
  store i16 %138, i16* %134, align 2
  %139 = load [32 x i16]*, [32 x i16]** %38, align 8
  %140 = getelementptr inbounds [32 x i16], [32 x i16]* %139, i64 %32, i64 %25
  %scevgep.4 = getelementptr i8, i8* %.0111, i64 20
  %141 = load i8, i8* %scevgep.4, align 1
  %142 = zext i8 %141 to i16
  %143 = add nuw nsw i16 %142, 1
  store i16 %143, i16* %140, align 2
  %144 = getelementptr inbounds i16, i16* %140, i64 1
  %145 = getelementptr inbounds i8, i8* %.0111, i64 21
  %146 = load i8, i8* %145, align 1
  %147 = zext i8 %146 to i16
  %148 = add nuw nsw i16 %147, 1
  store i16 %148, i16* %144, align 2
  %149 = getelementptr inbounds i16, i16* %140, i64 2
  %150 = getelementptr inbounds i8, i8* %.0111, i64 22
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i16
  %153 = add nuw nsw i16 %152, 1
  store i16 %153, i16* %149, align 2
  %154 = getelementptr inbounds i16, i16* %140, i64 3
  %155 = getelementptr inbounds i8, i8* %.0111, i64 23
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i16
  %158 = add nuw nsw i16 %157, 1
  store i16 %158, i16* %154, align 2
  %159 = load [32 x i16]*, [32 x i16]** %38, align 8
  %160 = getelementptr inbounds [32 x i16], [32 x i16]* %159, i64 %33, i64 %25
  %scevgep.5 = getelementptr i8, i8* %.0111, i64 24
  %161 = load i8, i8* %scevgep.5, align 1
  %162 = zext i8 %161 to i16
  %163 = add nuw nsw i16 %162, 1
  store i16 %163, i16* %160, align 2
  %164 = getelementptr inbounds i16, i16* %160, i64 1
  %165 = getelementptr inbounds i8, i8* %.0111, i64 25
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i16
  %168 = add nuw nsw i16 %167, 1
  store i16 %168, i16* %164, align 2
  %169 = getelementptr inbounds i16, i16* %160, i64 2
  %170 = getelementptr inbounds i8, i8* %.0111, i64 26
  %171 = load i8, i8* %170, align 1
  %172 = zext i8 %171 to i16
  %173 = add nuw nsw i16 %172, 1
  store i16 %173, i16* %169, align 2
  %174 = getelementptr inbounds i16, i16* %160, i64 3
  %175 = getelementptr inbounds i8, i8* %.0111, i64 27
  %176 = load i8, i8* %175, align 1
  %177 = zext i8 %176 to i16
  %178 = add nuw nsw i16 %177, 1
  store i16 %178, i16* %174, align 2
  %179 = load [32 x i16]*, [32 x i16]** %38, align 8
  %180 = getelementptr inbounds [32 x i16], [32 x i16]* %179, i64 %34, i64 %25
  %scevgep.6 = getelementptr i8, i8* %.0111, i64 28
  %181 = load i8, i8* %scevgep.6, align 1
  %182 = zext i8 %181 to i16
  %183 = add nuw nsw i16 %182, 1
  store i16 %183, i16* %180, align 2
  %184 = getelementptr inbounds i16, i16* %180, i64 1
  %185 = getelementptr inbounds i8, i8* %.0111, i64 29
  %186 = load i8, i8* %185, align 1
  %187 = zext i8 %186 to i16
  %188 = add nuw nsw i16 %187, 1
  store i16 %188, i16* %184, align 2
  %189 = getelementptr inbounds i16, i16* %180, i64 2
  %190 = getelementptr inbounds i8, i8* %.0111, i64 30
  %191 = load i8, i8* %190, align 1
  %192 = zext i8 %191 to i16
  %193 = add nuw nsw i16 %192, 1
  store i16 %193, i16* %189, align 2
  %194 = getelementptr inbounds i16, i16* %180, i64 3
  %195 = getelementptr inbounds i8, i8* %.0111, i64 31
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i16
  %198 = add nuw nsw i16 %197, 1
  store i16 %198, i16* %194, align 2
  %scevgep12 = getelementptr i8, i8* %.0111, i64 32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4
  br i1 %exitcond, label %35, label %36
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc i32 @find_nearby_colors(%struct.jpeg_decompress_struct* nocapture readonly, i32, i32, i32, i8* nocapture) unnamed_addr #1 {
  %6 = alloca [256 x i64], align 16
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  %8 = load i32, i32* %7, align 4
  %wide.trip.count.1 = zext i32 %8 to i64
  %wide.trip.count28 = zext i32 %8 to i64
  %9 = add nsw i32 %1, 24
  %10 = add nsw i32 %9, %1
  %11 = ashr i32 %10, 1
  %12 = add nsw i32 %2, 28
  %13 = add nsw i32 %12, %2
  %14 = ashr i32 %13, 1
  %15 = add nsw i32 %3, 24
  %16 = add nsw i32 %15, %3
  %17 = ashr i32 %16, 1
  %18 = icmp sgt i32 %8, 0
  br i1 %18, label %.lr.ph23, label %._crit_edge

.lr.ph23:                                         ; preds = %5
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %20 = load i8**, i8*** %19, align 8
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8*, i8** %20, i64 1
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr inbounds i8*, i8** %20, i64 2
  %25 = load i8*, i8** %24, align 8
  %promoted = sext i32 %1 to i64
  %promoted31 = sext i32 %9 to i64
  %promoted41 = sext i32 %2 to i64
  %promoted43 = sext i32 %12 to i64
  %promoted53 = sext i32 %3 to i64
  %promoted55 = sext i32 %15 to i64
  %promoted57 = sext i32 %15 to i64
  %promoted59 = sext i32 %3 to i64
  %promoted63 = sext i32 %3 to i64
  %promoted61 = sext i32 %15 to i64
  %promoted45 = sext i32 %12 to i64
  %promoted47 = sext i32 %2 to i64
  %promoted51 = sext i32 %2 to i64
  %promoted49 = sext i32 %12 to i64
  %promoted33 = sext i32 %9 to i64
  %promoted35 = sext i32 %1 to i64
  %promoted39 = sext i32 %1 to i64
  %promoted37 = sext i32 %9 to i64
  br label %32

.preheader:                                       ; preds = %123
  %26 = icmp sgt i32 %8, 0
  br i1 %26, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %8, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %27 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 0
  %28 = load i64, i64* %27, align 16
  %29 = icmp sgt i64 %28, %.8..07
  br i1 %29, label %.lr.ph.prol.loopexit, label %30

; <label>:30:                                     ; preds = %.lr.ph.prol
  store i8 0, i8* %4, align 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader, %30
  %indvars.iv.unr = phi i64 [ 1, %30 ], [ 0, %.lr.ph.preheader ], [ 1, %.lr.ph.prol ]
  %.0919.unr = phi i32 [ 1, %30 ], [ 0, %.lr.ph.preheader ], [ 0, %.lr.ph.prol ]
  %.110.lcssa.unr = phi i32 [ 1, %30 ], [ undef, %.lr.ph.preheader ], [ 0, %.lr.ph.prol ]
  %31 = icmp eq i32 %8, 1
  br i1 %31, label %._crit_edge, label %.lr.ph.preheader112

.lr.ph.preheader112:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

; <label>:32:                                     ; preds = %123, %.lr.ph23
  %indvars.iv26 = phi i64 [ 0, %.lr.ph23 ], [ %indvars.iv.next27, %123 ]
  %.0721 = phi i64 [ 2147483647, %.lr.ph23 ], [ %.8..07, %123 ]
  %33 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv26
  %34 = load i8, i8* %33, align 1
  %promoted40 = zext i8 %34 to i64
  %promoted38 = zext i8 %34 to i64
  %promoted36 = zext i8 %34 to i64
  %promoted34 = zext i8 %34 to i64
  %35 = zext i8 %34 to i32
  %36 = icmp slt i32 %35, %1
  br i1 %36, label %37, label %44

; <label>:37:                                     ; preds = %32
  %promoted30 = zext i8 %34 to i64
  %promoted32 = zext i8 %34 to i64
  %38 = sub nsw i64 %promoted30, %promoted
  %39 = shl nsw i64 %38, 1
  %40 = mul nsw i64 %39, %39
  %41 = sub nsw i64 %promoted32, %promoted31
  %42 = shl nsw i64 %41, 1
  %43 = mul nsw i64 %42, %42
  br label %63

; <label>:44:                                     ; preds = %32
  %45 = icmp sgt i32 %35, %9
  br i1 %45, label %46, label %53

; <label>:46:                                     ; preds = %44
  %47 = sub nsw i64 %promoted34, %promoted33
  %48 = shl nsw i64 %47, 1
  %49 = mul nsw i64 %48, %48
  %50 = sub nsw i64 %promoted36, %promoted35
  %51 = shl nsw i64 %50, 1
  %52 = mul nsw i64 %51, %51
  br label %63

; <label>:53:                                     ; preds = %44
  %54 = icmp sgt i32 %35, %11
  br i1 %54, label %59, label %55

; <label>:55:                                     ; preds = %53
  %56 = sub nsw i64 %promoted38, %promoted37
  %57 = shl nsw i64 %56, 1
  %58 = mul nsw i64 %57, %57
  br label %63

; <label>:59:                                     ; preds = %53
  %60 = sub nsw i64 %promoted40, %promoted39
  %61 = shl nsw i64 %60, 1
  %62 = mul nsw i64 %61, %61
  br label %63

; <label>:63:                                     ; preds = %46, %59, %55, %37
  %.12 = phi i64 [ %40, %37 ], [ %49, %46 ], [ 0, %59 ], [ 0, %55 ]
  %.2 = phi i64 [ %43, %37 ], [ %52, %46 ], [ %62, %59 ], [ %58, %55 ]
  %64 = getelementptr inbounds i8, i8* %23, i64 %indvars.iv26
  %65 = load i8, i8* %64, align 1
  %promoted52 = zext i8 %65 to i64
  %promoted50 = zext i8 %65 to i64
  %promoted48 = zext i8 %65 to i64
  %promoted46 = zext i8 %65 to i64
  %66 = zext i8 %65 to i32
  %67 = icmp slt i32 %66, %2
  br i1 %67, label %68, label %76

; <label>:68:                                     ; preds = %63
  %promoted42 = zext i8 %65 to i64
  %promoted44 = zext i8 %65 to i64
  %69 = sub nsw i64 %promoted42, %promoted41
  %70 = mul nsw i64 %69, 3
  %71 = mul nsw i64 %70, %70
  %72 = add nuw nsw i64 %71, %.12
  %73 = sub nsw i64 %promoted44, %promoted43
  %74 = mul nsw i64 %73, 3
  %75 = mul nsw i64 %74, %74
  br label %96

; <label>:76:                                     ; preds = %63
  %77 = icmp sgt i32 %66, %12
  br i1 %77, label %78, label %86

; <label>:78:                                     ; preds = %76
  %79 = sub nsw i64 %promoted46, %promoted45
  %80 = mul nsw i64 %79, 3
  %81 = mul nsw i64 %80, %80
  %82 = add nuw nsw i64 %81, %.12
  %83 = sub nsw i64 %promoted48, %promoted47
  %84 = mul nsw i64 %83, 3
  %85 = mul nsw i64 %84, %84
  br label %96

; <label>:86:                                     ; preds = %76
  %87 = icmp sgt i32 %66, %14
  br i1 %87, label %92, label %88

; <label>:88:                                     ; preds = %86
  %89 = sub nsw i64 %promoted50, %promoted49
  %90 = mul nsw i64 %89, 3
  %91 = mul nsw i64 %90, %90
  br label %96

; <label>:92:                                     ; preds = %86
  %93 = sub nsw i64 %promoted52, %promoted51
  %94 = mul nsw i64 %93, 3
  %95 = mul nsw i64 %94, %94
  br label %96

; <label>:96:                                     ; preds = %78, %92, %88, %68
  %.34 = phi i64 [ %72, %68 ], [ %82, %78 ], [ %.12, %92 ], [ %.12, %88 ]
  %.pn14 = phi i64 [ %75, %68 ], [ %85, %78 ], [ %95, %92 ], [ %91, %88 ]
  %.5 = add nuw nsw i64 %.pn14, %.2
  %97 = getelementptr inbounds i8, i8* %25, i64 %indvars.iv26
  %98 = load i8, i8* %97, align 1
  %promoted64 = zext i8 %98 to i64
  %promoted62 = zext i8 %98 to i64
  %promoted60 = zext i8 %98 to i64
  %promoted58 = zext i8 %98 to i64
  %99 = zext i8 %98 to i32
  %100 = icmp slt i32 %99, %3
  br i1 %100, label %101, label %107

; <label>:101:                                    ; preds = %96
  %promoted54 = zext i8 %98 to i64
  %promoted56 = zext i8 %98 to i64
  %102 = sub nsw i64 %promoted54, %promoted53
  %103 = mul nsw i64 %102, %102
  %104 = add nsw i64 %103, %.34
  %105 = sub nsw i64 %promoted56, %promoted55
  %106 = mul nsw i64 %105, %105
  br label %123

; <label>:107:                                    ; preds = %96
  %108 = icmp sgt i32 %99, %15
  br i1 %108, label %109, label %115

; <label>:109:                                    ; preds = %107
  %110 = sub nsw i64 %promoted58, %promoted57
  %111 = mul nsw i64 %110, %110
  %112 = add nsw i64 %111, %.34
  %113 = sub nsw i64 %promoted60, %promoted59
  %114 = mul nsw i64 %113, %113
  br label %123

; <label>:115:                                    ; preds = %107
  %116 = icmp sgt i32 %99, %17
  br i1 %116, label %120, label %117

; <label>:117:                                    ; preds = %115
  %118 = sub nsw i64 %promoted62, %promoted61
  %119 = mul nsw i64 %118, %118
  br label %123

; <label>:120:                                    ; preds = %115
  %121 = sub nsw i64 %promoted64, %promoted63
  %122 = mul nsw i64 %121, %121
  br label %123

; <label>:123:                                    ; preds = %109, %120, %117, %101
  %.56 = phi i64 [ %104, %101 ], [ %112, %109 ], [ %.34, %120 ], [ %.34, %117 ]
  %.pn17 = phi i64 [ %106, %101 ], [ %114, %109 ], [ %122, %120 ], [ %119, %117 ]
  %.8 = add nuw nsw i64 %.5, %.pn17
  %124 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %indvars.iv26
  store i64 %.56, i64* %124, align 8
  %125 = icmp slt i64 %.8, %.0721
  %.8..07 = select i1 %125, i64 %.8, i64 %.0721
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond, label %.preheader, label %32

.lr.ph:                                           ; preds = %.lr.ph.preheader112, %142
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %142 ], [ %indvars.iv.unr, %.lr.ph.preheader112 ]
  %.0919 = phi i32 [ %.110.1, %142 ], [ %.0919.unr, %.lr.ph.preheader112 ]
  %126 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %indvars.iv
  %127 = load i64, i64* %126, align 8
  %128 = icmp sgt i64 %127, %.8..07
  br i1 %128, label %.lr.ph.125, label %129

; <label>:129:                                    ; preds = %.lr.ph
  %130 = sext i32 %.0919 to i64
  %131 = getelementptr inbounds i8, i8* %4, i64 %130
  %132 = add nsw i32 %.0919, 1
  %133 = trunc i64 %indvars.iv to i8
  store i8 %133, i8* %131, align 1
  br label %.lr.ph.125

.lr.ph.125:                                       ; preds = %.lr.ph, %129
  %.110 = phi i32 [ %132, %129 ], [ %.0919, %.lr.ph ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %134 = getelementptr inbounds [256 x i64], [256 x i64]* %6, i64 0, i64 %indvars.iv.next
  %135 = load i64, i64* %134, align 8
  %136 = icmp sgt i64 %135, %.8..07
  br i1 %136, label %142, label %137

._crit_edge.loopexit:                             ; preds = %142
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader, %5
  %.09.lcssa = phi i32 [ 0, %5 ], [ 0, %.preheader ], [ %.110.lcssa.unr, %.lr.ph.prol.loopexit ], [ %.110.1, %._crit_edge.loopexit ]
  ret i32 %.09.lcssa

; <label>:137:                                    ; preds = %.lr.ph.125
  %138 = sext i32 %.110 to i64
  %139 = getelementptr inbounds i8, i8* %4, i64 %138
  %140 = add nsw i32 %.110, 1
  %141 = trunc i64 %indvars.iv.next to i8
  store i8 %141, i8* %139, align 1
  br label %142

; <label>:142:                                    ; preds = %.lr.ph.125, %137
  %.110.1 = phi i32 [ %140, %137 ], [ %.110, %.lr.ph.125 ]
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @find_best_colors(%struct.jpeg_decompress_struct* nocapture readonly, i32, i32, i32, i32, i8* nocapture readonly, i8* nocapture) unnamed_addr #1 {
  %8 = alloca [128 x i64], align 16
  br label %.preheader1663

.lr.ph:                                           ; preds = %.preheader1663
  %9 = sext i32 %1 to i64
  %10 = sext i32 %2 to i64
  %11 = sext i32 %3 to i64
  %wide.trip.count = zext i32 %4 to i64
  %12 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 0
  %sunkaddr60 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr61 = add i64 %sunkaddr60, 152
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to i8***
  br label %142

.preheader1663:                                   ; preds = %7
  %13 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 0
  store i64 2147483647, i64* %13, align 16
  %14 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 1
  store i64 2147483647, i64* %14, align 8
  %15 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 2
  store i64 2147483647, i64* %15, align 16
  %16 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 3
  store i64 2147483647, i64* %16, align 8
  %17 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 4
  store i64 2147483647, i64* %17, align 16
  %18 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 5
  store i64 2147483647, i64* %18, align 8
  %19 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 6
  store i64 2147483647, i64* %19, align 16
  %20 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 7
  store i64 2147483647, i64* %20, align 8
  %21 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 8
  store i64 2147483647, i64* %21, align 16
  %22 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 9
  store i64 2147483647, i64* %22, align 8
  %23 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 10
  store i64 2147483647, i64* %23, align 16
  %24 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 11
  store i64 2147483647, i64* %24, align 8
  %25 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 12
  store i64 2147483647, i64* %25, align 16
  %26 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 13
  store i64 2147483647, i64* %26, align 8
  %27 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 14
  store i64 2147483647, i64* %27, align 16
  %28 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 15
  store i64 2147483647, i64* %28, align 8
  %29 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 16
  store i64 2147483647, i64* %29, align 16
  %30 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 17
  store i64 2147483647, i64* %30, align 8
  %31 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 18
  store i64 2147483647, i64* %31, align 16
  %32 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 19
  store i64 2147483647, i64* %32, align 8
  %33 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 20
  store i64 2147483647, i64* %33, align 16
  %34 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 21
  store i64 2147483647, i64* %34, align 8
  %35 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 22
  store i64 2147483647, i64* %35, align 16
  %36 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 23
  store i64 2147483647, i64* %36, align 8
  %37 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 24
  store i64 2147483647, i64* %37, align 16
  %38 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 25
  store i64 2147483647, i64* %38, align 8
  %39 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 26
  store i64 2147483647, i64* %39, align 16
  %40 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 27
  store i64 2147483647, i64* %40, align 8
  %41 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 28
  store i64 2147483647, i64* %41, align 16
  %42 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 29
  store i64 2147483647, i64* %42, align 8
  %43 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 30
  store i64 2147483647, i64* %43, align 16
  %44 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 31
  store i64 2147483647, i64* %44, align 8
  %45 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 32
  store i64 2147483647, i64* %45, align 16
  %46 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 33
  store i64 2147483647, i64* %46, align 8
  %47 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 34
  store i64 2147483647, i64* %47, align 16
  %48 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 35
  store i64 2147483647, i64* %48, align 8
  %49 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 36
  store i64 2147483647, i64* %49, align 16
  %50 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 37
  store i64 2147483647, i64* %50, align 8
  %51 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 38
  store i64 2147483647, i64* %51, align 16
  %52 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 39
  store i64 2147483647, i64* %52, align 8
  %53 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 40
  store i64 2147483647, i64* %53, align 16
  %54 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 41
  store i64 2147483647, i64* %54, align 8
  %55 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 42
  store i64 2147483647, i64* %55, align 16
  %56 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 43
  store i64 2147483647, i64* %56, align 8
  %57 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 44
  store i64 2147483647, i64* %57, align 16
  %58 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 45
  store i64 2147483647, i64* %58, align 8
  %59 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 46
  store i64 2147483647, i64* %59, align 16
  %60 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 47
  store i64 2147483647, i64* %60, align 8
  %61 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 48
  store i64 2147483647, i64* %61, align 16
  %62 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 49
  store i64 2147483647, i64* %62, align 8
  %63 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 50
  store i64 2147483647, i64* %63, align 16
  %64 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 51
  store i64 2147483647, i64* %64, align 8
  %65 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 52
  store i64 2147483647, i64* %65, align 16
  %66 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 53
  store i64 2147483647, i64* %66, align 8
  %67 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 54
  store i64 2147483647, i64* %67, align 16
  %68 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 55
  store i64 2147483647, i64* %68, align 8
  %69 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 56
  store i64 2147483647, i64* %69, align 16
  %70 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 57
  store i64 2147483647, i64* %70, align 8
  %71 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 58
  store i64 2147483647, i64* %71, align 16
  %72 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 59
  store i64 2147483647, i64* %72, align 8
  %73 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 60
  store i64 2147483647, i64* %73, align 16
  %74 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 61
  store i64 2147483647, i64* %74, align 8
  %75 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 62
  store i64 2147483647, i64* %75, align 16
  %76 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 63
  store i64 2147483647, i64* %76, align 8
  %77 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 64
  store i64 2147483647, i64* %77, align 16
  %78 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 65
  store i64 2147483647, i64* %78, align 8
  %79 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 66
  store i64 2147483647, i64* %79, align 16
  %80 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 67
  store i64 2147483647, i64* %80, align 8
  %81 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 68
  store i64 2147483647, i64* %81, align 16
  %82 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 69
  store i64 2147483647, i64* %82, align 8
  %83 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 70
  store i64 2147483647, i64* %83, align 16
  %84 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 71
  store i64 2147483647, i64* %84, align 8
  %85 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 72
  store i64 2147483647, i64* %85, align 16
  %86 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 73
  store i64 2147483647, i64* %86, align 8
  %87 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 74
  store i64 2147483647, i64* %87, align 16
  %88 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 75
  store i64 2147483647, i64* %88, align 8
  %89 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 76
  store i64 2147483647, i64* %89, align 16
  %90 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 77
  store i64 2147483647, i64* %90, align 8
  %91 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 78
  store i64 2147483647, i64* %91, align 16
  %92 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 79
  store i64 2147483647, i64* %92, align 8
  %93 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 80
  store i64 2147483647, i64* %93, align 16
  %94 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 81
  store i64 2147483647, i64* %94, align 8
  %95 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 82
  store i64 2147483647, i64* %95, align 16
  %96 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 83
  store i64 2147483647, i64* %96, align 8
  %97 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 84
  store i64 2147483647, i64* %97, align 16
  %98 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 85
  store i64 2147483647, i64* %98, align 8
  %99 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 86
  store i64 2147483647, i64* %99, align 16
  %100 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 87
  store i64 2147483647, i64* %100, align 8
  %101 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 88
  store i64 2147483647, i64* %101, align 16
  %102 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 89
  store i64 2147483647, i64* %102, align 8
  %103 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 90
  store i64 2147483647, i64* %103, align 16
  %104 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 91
  store i64 2147483647, i64* %104, align 8
  %105 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 92
  store i64 2147483647, i64* %105, align 16
  %106 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 93
  store i64 2147483647, i64* %106, align 8
  %107 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 94
  store i64 2147483647, i64* %107, align 16
  %108 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 95
  store i64 2147483647, i64* %108, align 8
  %109 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 96
  store i64 2147483647, i64* %109, align 16
  %110 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 97
  store i64 2147483647, i64* %110, align 8
  %111 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 98
  store i64 2147483647, i64* %111, align 16
  %112 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 99
  store i64 2147483647, i64* %112, align 8
  %113 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 100
  store i64 2147483647, i64* %113, align 16
  %114 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 101
  store i64 2147483647, i64* %114, align 8
  %115 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 102
  store i64 2147483647, i64* %115, align 16
  %116 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 103
  store i64 2147483647, i64* %116, align 8
  %117 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 104
  store i64 2147483647, i64* %117, align 16
  %118 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 105
  store i64 2147483647, i64* %118, align 8
  %119 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 106
  store i64 2147483647, i64* %119, align 16
  %120 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 107
  store i64 2147483647, i64* %120, align 8
  %121 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 108
  store i64 2147483647, i64* %121, align 16
  %122 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 109
  store i64 2147483647, i64* %122, align 8
  %123 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 110
  store i64 2147483647, i64* %123, align 16
  %124 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 111
  store i64 2147483647, i64* %124, align 8
  %125 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 112
  store i64 2147483647, i64* %125, align 16
  %126 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 113
  store i64 2147483647, i64* %126, align 8
  %127 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 114
  store i64 2147483647, i64* %127, align 16
  %128 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 115
  store i64 2147483647, i64* %128, align 8
  %129 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 116
  store i64 2147483647, i64* %129, align 16
  %130 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 117
  store i64 2147483647, i64* %130, align 8
  %131 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 118
  store i64 2147483647, i64* %131, align 16
  %132 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 119
  store i64 2147483647, i64* %132, align 8
  %133 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 120
  store i64 2147483647, i64* %133, align 16
  %134 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 121
  store i64 2147483647, i64* %134, align 8
  %135 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 122
  store i64 2147483647, i64* %135, align 16
  %136 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 123
  store i64 2147483647, i64* %136, align 8
  %137 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 124
  store i64 2147483647, i64* %137, align 16
  %138 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 125
  store i64 2147483647, i64* %138, align 8
  %139 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 126
  store i64 2147483647, i64* %139, align 16
  %140 = getelementptr inbounds [128 x i64], [128 x i64]* %8, i64 0, i64 127
  store i64 2147483647, i64* %140, align 8
  %141 = icmp sgt i32 %4, 0
  br i1 %141, label %.lr.ph, label %._crit_edge

; <label>:142:                                    ; preds = %190, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %190 ]
  %143 = getelementptr inbounds i8, i8* %5, i64 %indvars.iv
  %144 = load i8, i8* %143, align 1
  %145 = load i8**, i8*** %sunkaddr62, align 8
  %146 = load i8*, i8** %145, align 8
  %147 = zext i8 %144 to i64
  %148 = getelementptr inbounds i8, i8* %146, i64 %147
  %149 = load i8, i8* %148, align 1
  %promoted41 = zext i8 %149 to i64
  %150 = sub nsw i64 %9, %promoted41
  %151 = shl nsw i64 %150, 1
  %152 = mul nsw i64 %151, %151
  %153 = getelementptr inbounds i8*, i8** %145, i64 1
  %154 = load i8*, i8** %153, align 8
  %155 = getelementptr inbounds i8, i8* %154, i64 %147
  %156 = load i8, i8* %155, align 1
  %promoted42 = zext i8 %156 to i64
  %157 = sub nsw i64 %10, %promoted42
  %158 = mul nsw i64 %157, 3
  %159 = mul nsw i64 %158, %158
  %160 = add nuw nsw i64 %159, %152
  %161 = getelementptr inbounds i8*, i8** %145, i64 2
  %162 = load i8*, i8** %161, align 8
  %163 = getelementptr inbounds i8, i8* %162, i64 %147
  %164 = load i8, i8* %163, align 1
  %promoted43 = zext i8 %164 to i64
  %165 = sub nsw i64 %11, %promoted43
  %166 = mul nsw i64 %165, %165
  %167 = add nuw nsw i64 %160, %166
  %168 = shl nsw i64 %150, 6
  %169 = add nsw i64 %168, 256
  %170 = mul nsw i64 %157, 72
  %171 = add nsw i64 %170, 144
  %172 = shl nsw i64 %165, 4
  %173 = add nsw i64 %172, 64
  %174 = add nsw i64 %172, 192
  %175 = add nsw i64 %172, 320
  br label %.preheader15

.preheader15:                                     ; preds = %185, %142
  %.0231 = phi i64 [ %169, %142 ], [ %186, %185 ]
  %.0530 = phi i32 [ 3, %142 ], [ %188, %185 ]
  %.0929 = phi i64 [ %167, %142 ], [ %187, %185 ]
  %.11128 = phi i64* [ %12, %142 ], [ %scevgep38, %185 ]
  %.01227 = phi i8* [ %6, %142 ], [ %scevgep37, %185 ]
  br label %176

; <label>:176:                                    ; preds = %207, %.preheader15
  %.0126 = phi i64 [ %171, %.preheader15 ], [ %208, %207 ]
  %.0425 = phi i64 [ %.0929, %.preheader15 ], [ %209, %207 ]
  %.0624 = phi i32 [ 7, %.preheader15 ], [ %210, %207 ]
  %.223 = phi i64* [ %.11128, %.preheader15 ], [ %scevgep36, %207 ]
  %.11322 = phi i8* [ %.01227, %.preheader15 ], [ %scevgep, %207 ]
  %scevgep = getelementptr i8, i8* %.11322, i64 4
  %177 = load i64, i64* %.223, align 8
  %178 = icmp slt i64 %.0425, %177
  br i1 %178, label %179, label %180

; <label>:179:                                    ; preds = %176
  store i64 %.0425, i64* %.223, align 8
  store i8 %144, i8* %.11322, align 1
  br label %180

; <label>:180:                                    ; preds = %176, %179
  %181 = getelementptr inbounds i64, i64* %.223, i64 1
  %182 = add nsw i64 %173, %.0425
  %183 = load i64, i64* %181, align 8
  %184 = icmp slt i64 %182, %183
  br i1 %184, label %191, label %193

; <label>:185:                                    ; preds = %207
  %scevgep37 = getelementptr i8, i8* %.01227, i64 32
  %scevgep38 = getelementptr i64, i64* %.11128, i64 32
  %186 = add nsw i64 %.0231, 512
  %187 = add nsw i64 %.0231, %.0929
  %188 = add nsw i32 %.0530, -1
  %189 = icmp sgt i32 %.0530, 0
  br i1 %189, label %.preheader15, label %190

; <label>:190:                                    ; preds = %185
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %142

._crit_edge.loopexit:                             ; preds = %190
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader1663
  ret void

; <label>:191:                                    ; preds = %180
  %192 = getelementptr inbounds i8, i8* %.11322, i64 1
  %sunkaddr44 = ptrtoint i64* %.223 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 8
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i64*
  store i64 %182, i64* %sunkaddr46, align 8
  store i8 %144, i8* %192, align 1
  br label %193

; <label>:193:                                    ; preds = %180, %191
  %194 = getelementptr inbounds i64, i64* %.223, i64 2
  %195 = add nsw i64 %174, %182
  %196 = load i64, i64* %194, align 8
  %197 = icmp slt i64 %195, %196
  br i1 %197, label %198, label %200

; <label>:198:                                    ; preds = %193
  %199 = getelementptr inbounds i8, i8* %.11322, i64 2
  %sunkaddr47 = ptrtoint i64* %.223 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 16
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i64*
  store i64 %195, i64* %sunkaddr49, align 8
  store i8 %144, i8* %199, align 1
  br label %200

; <label>:200:                                    ; preds = %193, %198
  %201 = getelementptr inbounds i64, i64* %.223, i64 3
  %202 = add nsw i64 %175, %195
  %203 = load i64, i64* %201, align 8
  %204 = icmp slt i64 %202, %203
  br i1 %204, label %205, label %207

; <label>:205:                                    ; preds = %200
  %206 = getelementptr inbounds i8, i8* %.11322, i64 3
  %sunkaddr50 = ptrtoint i64* %.223 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 24
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i64*
  store i64 %202, i64* %sunkaddr52, align 8
  store i8 %144, i8* %206, align 1
  br label %207

; <label>:207:                                    ; preds = %200, %205
  %scevgep36 = getelementptr i64, i64* %.223, i64 4
  %208 = add nsw i64 %.0126, 288
  %209 = add nsw i64 %.0126, %.0425
  %210 = add nsw i32 %.0624, -1
  %211 = icmp sgt i32 %.0624, 0
  br i1 %211, label %176, label %185
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
