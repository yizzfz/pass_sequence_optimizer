; ModuleID = 'jquant1.ll'
source_filename = "jquant1.c"
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
%struct.my_cquantizer = type { %struct.jpeg_color_quantizer, i8**, i32, i8**, i32, [4 x i32], i32, [4 x [16 x i32]*], [4 x i16*], i32 }

@base_dither_matrix = internal constant [16 x [16 x i8]] [[16 x i8] c"\00\C00\F0\0C\CC<\FC\03\C33\F3\0F\CF?\FF", [16 x i8] c"\80@\B0p\8CL\BC|\83C\B3s\8FO\BF\7F", [16 x i8] c" \E0\10\D0,\EC\1C\DC#\E3\13\D3/\EF\1F\DF", [16 x i8] c"\A0`\90P\ACl\9C\5C\A3c\93S\AFo\9F_", [16 x i8] c"\08\C88\F8\04\C44\F4\0B\CB;\FB\07\C77\F7", [16 x i8] c"\88H\B8x\84D\B4t\8BK\BB{\87G\B7w", [16 x i8] c"(\E8\18\D8$\E4\14\D4+\EB\1B\DB'\E7\17\D7", [16 x i8] c"\A8h\98X\A4d\94T\ABk\9B[\A7g\97W", [16 x i8] c"\02\C22\F2\0E\CE>\FE\01\C11\F1\0D\CD=\FD", [16 x i8] c"\82B\B2r\8EN\BE~\81A\B1q\8DM\BD}", [16 x i8] c"\22\E2\12\D2.\EE\1E\DE!\E1\11\D1-\ED\1D\DD", [16 x i8] c"\A2b\92R\AEn\9E^\A1a\91Q\ADm\9D]", [16 x i8] c"\0A\CA:\FA\06\C66\F6\09\C99\F9\05\C55\F5", [16 x i8] c"\8AJ\BAz\86F\B6v\89I\B9y\85E\B5u", [16 x i8] c"*\EA\1A\DA&\E6\16\D6)\E9\19\D9%\E5\15\D5", [16 x i8] c"\AAj\9AZ\A6f\96V\A9i\99Y\A5e\95U"], align 16
@select_ncolors.RGB_order = internal constant [3 x i32] [i32 1, i32 0, i32 2], align 4

; Function Attrs: noinline nounwind uwtable
define void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 152) #5
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %9 = bitcast %struct.jpeg_color_quantizer** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_1_quant, void (%struct.jpeg_decompress_struct*, i32)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 16
  %12 = bitcast i8* %11 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_pass_1_quant, void (%struct.jpeg_decompress_struct*)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 24
  %14 = bitcast i8* %13 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @new_color_map_1_quant, void (%struct.jpeg_decompress_struct*)** %14, align 8
  %15 = getelementptr inbounds i8, i8* %7, i64 112
  %16 = bitcast i8* %15 to i16**
  store i16* null, i16** %16, align 8
  %17 = getelementptr inbounds i8, i8* %7, i64 80
  %18 = bitcast i8* %17 to [16 x i32]**
  store [16 x i32]* null, [16 x i32]** %18, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %20 = load i32, i32* %19, align 8
  %21 = icmp sgt i32 %20, 4
  br i1 %21, label %22, label %31

; <label>:22:                                     ; preds = %1
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 5
  store i32 54, i32* %25, align 8
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i64 0, i32 6, i32 0, i64 0
  store i32 4, i32* %27, align 4
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i64 0, i32 0
  %30 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %29, align 8
  tail call void %30(%struct.jpeg_common_struct* %6) #5
  br label %31

; <label>:31:                                     ; preds = %22, %1
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %33 = load i32, i32* %32, align 8
  %34 = icmp sgt i32 %33, 256
  br i1 %34, label %35, label %44

; <label>:35:                                     ; preds = %31
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i64 0, i32 5
  store i32 56, i32* %38, align 8
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i64 0, i32 6, i32 0, i64 0
  store i32 256, i32* %40, align 4
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i64 0, i32 0
  %43 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %42, align 8
  tail call void %43(%struct.jpeg_common_struct* nonnull %6) #5
  br label %44

; <label>:44:                                     ; preds = %35, %31
  tail call void @create_colormap(%struct.jpeg_decompress_struct* nonnull %0)
  tail call void @create_colorindex(%struct.jpeg_decompress_struct* nonnull %0)
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %46 = load i32, i32* %45, align 8
  %47 = icmp eq i32 %46, 2
  br i1 %47, label %48, label %49

; <label>:48:                                     ; preds = %44
  tail call void @alloc_fs_workspace(%struct.jpeg_decompress_struct* nonnull %0)
  br label %49

; <label>:49:                                     ; preds = %48, %44
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_1_quant(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %4 = bitcast %struct.jpeg_color_quantizer** %3 to %struct.my_cquantizer**
  %5 = load %struct.my_cquantizer*, %struct.my_cquantizer** %4, align 8
  %6 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 1
  %7 = bitcast i8*** %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 32
  %10 = bitcast i8*** %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 2
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 31
  store i32 %12, i32* %13, align 4
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %15 = load i32, i32* %14, align 8
  switch i32 %15, label %58 [
    i32 0, label %16
    i32 1, label %21
    i32 2, label %36
  ]

; <label>:16:                                     ; preds = %2
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 3
  %20 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 0, i32 1
  %color_quantize.sink = select i1 %19, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @color_quantize3, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @color_quantize
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* %color_quantize.sink, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %20, align 8
  br label %.loopexit

; <label>:21:                                     ; preds = %2
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 3
  %25 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 0, i32 1
  %quantize_ord_dither.sink = select i1 %24, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize3_ord_dither, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize_ord_dither
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* %quantize_ord_dither.sink, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %25, align 8
  %26 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 6
  store i32 0, i32* %26, align 4
  %27 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 4
  %28 = load i32, i32* %27, align 8
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %31

; <label>:30:                                     ; preds = %21
  tail call void @create_colorindex(%struct.jpeg_decompress_struct* nonnull %0)
  br label %31

; <label>:31:                                     ; preds = %21, %30
  %32 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 7, i64 0
  %33 = load [16 x i32]*, [16 x i32]** %32, align 8
  %34 = icmp eq [16 x i32]* %33, null
  br i1 %34, label %35, label %.loopexit

; <label>:35:                                     ; preds = %31
  tail call void @create_odither_tables(%struct.jpeg_decompress_struct* nonnull %0)
  br label %.loopexit

; <label>:36:                                     ; preds = %2
  %37 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)* @quantize_fs_dither, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %37, align 8
  %38 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 9
  store i32 0, i32* %38, align 8
  %39 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 8, i64 0
  %40 = load i16*, i16** %39, align 8
  %41 = icmp eq i16* %40, null
  br i1 %41, label %42, label %43

; <label>:42:                                     ; preds = %36
  tail call void @alloc_fs_workspace(%struct.jpeg_decompress_struct* nonnull %0)
  br label %43

; <label>:43:                                     ; preds = %42, %36
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %45 = load i32, i32* %44, align 8
  %46 = add i32 %45, 2
  %47 = zext i32 %46 to i64
  %48 = shl nuw nsw i64 %47, 1
  %49 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %50 = load i32, i32* %49, align 8
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %43
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %52 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 8, i64 %indvars.iv1
  %53 = bitcast i16** %52 to i8**
  %54 = load i8*, i8** %53, align 8
  tail call void @jzero_far(i8* %54, i64 %48) #5
  %indvars.iv.next = add nuw i64 %indvars.iv1, 1
  %55 = load i32, i32* %49, align 8
  %56 = sext i32 %55 to i64
  %57 = icmp slt i64 %indvars.iv.next, %56
  br i1 %57, label %.lr.ph, label %.loopexit.loopexit

; <label>:58:                                     ; preds = %2
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i64 0, i32 5
  store i32 47, i32* %61, align 8
  %62 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %63 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %62, i64 0, i32 0
  %64 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %63, align 8
  %65 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %64(%struct.jpeg_common_struct* %65) #5
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %43, %31, %35, %58, %16
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @finish_pass_1_quant(%struct.jpeg_decompress_struct* nocapture) #1 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @new_color_map_1_quant(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %3 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %3, i64 0, i32 5
  store i32 45, i32* %4, align 8
  %5 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %5, i64 0, i32 0
  %7 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %6, align 8
  %8 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %7(%struct.jpeg_common_struct* %8) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @create_colormap(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %3 = bitcast %struct.jpeg_color_quantizer** %2 to %struct.my_cquantizer**
  %4 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %5 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5
  %6 = getelementptr inbounds [4 x i32], [4 x i32]* %5, i64 0, i64 0
  %7 = tail call i32 @select_ncolors(%struct.jpeg_decompress_struct* %0, i32* %6)
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 3
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  br i1 %10, label %13, label %30

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 0
  store i32 %7, i32* %14, align 4
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* %5, i64 0, i64 0
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 1
  store i32 %16, i32* %17, align 4
  %18 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 1
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 2
  store i32 %19, i32* %20, align 4
  %21 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 2
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 3
  store i32 %22, i32* %23, align 4
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i64 0, i32 5
  store i32 93, i32* %25, align 8
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i64 0, i32 1
  %28 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %27, align 8
  %29 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %28(%struct.jpeg_common_struct* %29, i32 1) #5
  br label %38

; <label>:30:                                     ; preds = %1
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 94, i32* %31, align 8
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 6, i32 0, i64 0
  store i32 %7, i32* %33, align 4
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i64 0, i32 1
  %36 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %35, align 8
  %37 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %36(%struct.jpeg_common_struct* %37, i32 1) #5
  br label %38

; <label>:38:                                     ; preds = %30, %13
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %40 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %40, i64 0, i32 2
  %42 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %41, align 8
  %43 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %44 = load i32, i32* %8, align 8
  %45 = tail call i8** %42(%struct.jpeg_common_struct* %43, i32 1, i32 %7, i32 %44) #5
  %46 = sext i32 %7 to i64
  %47 = load i32, i32* %8, align 8
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %.lr.ph33.preheader, label %._crit_edge34

.lr.ph33.preheader:                               ; preds = %38
  %.not = icmp slt i32 %7, 1
  br label %.lr.ph33

.lr.ph33:                                         ; preds = %.lr.ph33.preheader, %._crit_edge19
  %.0131 = phi i32 [ %51, %._crit_edge19 ], [ %7, %.lr.ph33.preheader ]
  %indvars.iv930 = phi i64 [ %indvars.iv.next10, %._crit_edge19 ], [ 0, %.lr.ph33.preheader ]
  %49 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv930
  %50 = load i32, i32* %49, align 4
  %51 = sdiv i32 %.0131, %50
  %52 = sext i32 %51 to i64
  %53 = sext i32 %.0131 to i64
  %54 = icmp sgt i32 %50, 0
  br i1 %54, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.lr.ph33
  %55 = add nsw i32 %50, -1
  %56 = icmp sgt i32 %51, 0
  %57 = getelementptr inbounds i8*, i8** %45, i64 %indvars.iv930
  br i1 %56, label %.lr.ph18.split.us.preheader, label %.lr.ph18.split.preheader

.lr.ph18.split.preheader:                         ; preds = %.lr.ph18
  %xtraiter = and i32 %50, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %brmerge = or i1 %lcmp.mod, %.not
  %not.lcmp.mod = xor i1 %lcmp.mod, true
  %.mux = zext i1 %not.lcmp.mod to i32
  %.mux42 = select i1 %lcmp.mod, i32 0, i32 %51
  br i1 %brmerge, label %.lr.ph18.split.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.lr.ph18.split.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader, %.preheader.prol
  %indvars.iv712.prol = phi i64 [ %indvars.iv.next8.prol, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %indvars.iv.next8.prol = add i64 %indvars.iv712.prol, %53
  %58 = icmp slt i64 %indvars.iv.next8.prol, %46
  br i1 %58, label %.preheader.prol, label %.lr.ph18.split.prol.loopexit.loopexit

.lr.ph18.split.prol.loopexit.loopexit:            ; preds = %.preheader.prol
  br label %.lr.ph18.split.prol.loopexit

.lr.ph18.split.prol.loopexit:                     ; preds = %.lr.ph18.split.prol.loopexit.loopexit, %.lr.ph18.split.preheader
  %.0316.unr.ph = phi i32 [ %.mux, %.lr.ph18.split.preheader ], [ 1, %.lr.ph18.split.prol.loopexit.loopexit ]
  %indvars.iv515.unr.ph = phi i32 [ %.mux42, %.lr.ph18.split.preheader ], [ %51, %.lr.ph18.split.prol.loopexit.loopexit ]
  %59 = icmp eq i32 %50, 1
  br i1 %59, label %._crit_edge19, label %.lr.ph18.split.preheader45

.lr.ph18.split.preheader45:                       ; preds = %.lr.ph18.split.prol.loopexit
  br label %.lr.ph18.split

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %60 = add nsw i64 %52, -1
  %xtraiter36 = and i64 %52, 3
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  %61 = icmp ult i64 %60, 3
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %._crit_edge14.us-lcssa.us.us, %.lr.ph18.split.us.preheader
  %.0316.us = phi i32 [ %63, %._crit_edge14.us-lcssa.us.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %indvars.iv515.us = phi i32 [ %indvars.iv.next6.us, %._crit_edge14.us-lcssa.us.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %62 = icmp slt i32 %indvars.iv515.us, %7
  br i1 %62, label %.preheader.lr.ph.us, label %._crit_edge14.us-lcssa.us.us

._crit_edge14.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge14.us-lcssa.us.us

._crit_edge14.us-lcssa.us.us:                     ; preds = %._crit_edge14.us-lcssa.us.us.loopexit, %.lr.ph18.split.us
  %63 = add nuw nsw i32 %.0316.us, 1
  %indvars.iv.next6.us = add i32 %indvars.iv515.us, %51
  %exitcond = icmp eq i32 %63, %50
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

.preheader.lr.ph.us:                              ; preds = %.lr.ph18.split.us
  %64 = sext i32 %indvars.iv515.us to i64
  %65 = tail call i32 @output_value(i32 %.0316.us, i32 %55)
  %66 = trunc i32 %65 to i8
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.lr.ph.us, %._crit_edge.us.us
  %indvars.iv712.us.us = phi i64 [ %64, %.preheader.lr.ph.us ], [ %indvars.iv.next8.us.us, %._crit_edge.us.us ]
  br i1 %lcmp.mod37, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv11.us.us.prol = phi i64 [ %indvars.iv.next.us.us.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter36, %.prol.preheader.preheader ]
  %67 = load i8*, i8** %57, align 8
  %68 = add nsw i64 %indvars.iv11.us.us.prol, %indvars.iv712.us.us
  %69 = getelementptr inbounds i8, i8* %67, i64 %68
  store i8 %66, i8* %69, align 1
  %indvars.iv.next.us.us.prol = add nuw nsw i64 %indvars.iv11.us.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us.us
  %indvars.iv11.us.us.unr = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.us.us.prol, %.prol.loopexit.loopexit ]
  br i1 %61, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next8.us.us = add i64 %indvars.iv712.us.us, %53
  %70 = icmp slt i64 %indvars.iv.next8.us.us, %46
  br i1 %70, label %.preheader.us.us, label %._crit_edge14.us-lcssa.us.us.loopexit

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv11.us.us = phi i64 [ %indvars.iv.next.us.us.3, %.preheader.us.us.new ], [ %indvars.iv11.us.us.unr, %.preheader.us.us.new.preheader ]
  %71 = load i8*, i8** %57, align 8
  %72 = add nsw i64 %indvars.iv11.us.us, %indvars.iv712.us.us
  %73 = getelementptr inbounds i8, i8* %71, i64 %72
  store i8 %66, i8* %73, align 1
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv11.us.us, 1
  %74 = load i8*, i8** %57, align 8
  %75 = add nsw i64 %indvars.iv.next.us.us, %indvars.iv712.us.us
  %76 = getelementptr inbounds i8, i8* %74, i64 %75
  store i8 %66, i8* %76, align 1
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv11.us.us, 2
  %77 = load i8*, i8** %57, align 8
  %78 = add nsw i64 %indvars.iv.next.us.us.1, %indvars.iv712.us.us
  %79 = getelementptr inbounds i8, i8* %77, i64 %78
  store i8 %66, i8* %79, align 1
  %indvars.iv.next.us.us.2 = add nsw i64 %indvars.iv11.us.us, 3
  %80 = load i8*, i8** %57, align 8
  %81 = add nsw i64 %indvars.iv.next.us.us.2, %indvars.iv712.us.us
  %82 = getelementptr inbounds i8, i8* %80, i64 %81
  store i8 %66, i8* %82, align 1
  %indvars.iv.next.us.us.3 = add nsw i64 %indvars.iv11.us.us, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.us.us.3, %52
  br i1 %exitcond.3, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

.lr.ph18.split:                                   ; preds = %.lr.ph18.split.preheader45, %._crit_edge14.1
  %.0316 = phi i32 [ %94, %._crit_edge14.1 ], [ %.0316.unr.ph, %.lr.ph18.split.preheader45 ]
  %indvars.iv515 = phi i32 [ %indvars.iv.next6.1, %._crit_edge14.1 ], [ %indvars.iv515.unr.ph, %.lr.ph18.split.preheader45 ]
  %83 = icmp slt i32 %indvars.iv515, %7
  br i1 %83, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.lr.ph18.split
  %84 = sext i32 %indvars.iv515 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %.preheader
  %indvars.iv712 = phi i64 [ %84, %.preheader.lr.ph ], [ %indvars.iv.next8, %.preheader ]
  %indvars.iv.next8 = add i64 %indvars.iv712, %53
  %85 = icmp slt i64 %indvars.iv.next8, %46
  br i1 %85, label %.preheader, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %.preheader
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.lr.ph18.split
  %indvars.iv.next6 = add i32 %indvars.iv515, %51
  %86 = icmp slt i32 %indvars.iv.next6, %7
  br i1 %86, label %.preheader.lr.ph.1, label %._crit_edge14.1

._crit_edge19.loopexit:                           ; preds = %._crit_edge14.us-lcssa.us.us
  br label %._crit_edge19

._crit_edge19.loopexit46:                         ; preds = %._crit_edge14.1
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit46, %._crit_edge19.loopexit, %.lr.ph18.split.prol.loopexit, %.lr.ph33
  %indvars.iv.next10 = add nuw i64 %indvars.iv930, 1
  %87 = load i32, i32* %8, align 8
  %88 = sext i32 %87 to i64
  %89 = icmp slt i64 %indvars.iv.next10, %88
  br i1 %89, label %.lr.ph33, label %._crit_edge34.loopexit

._crit_edge34.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %38
  %90 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 1
  store i8** %45, i8*** %90, align 8
  %91 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 2
  store i32 %7, i32* %91, align 8
  ret void

.preheader.lr.ph.1:                               ; preds = %._crit_edge14
  %92 = sext i32 %indvars.iv.next6 to i64
  br label %.preheader.1

.preheader.1:                                     ; preds = %.preheader.1, %.preheader.lr.ph.1
  %indvars.iv712.1 = phi i64 [ %92, %.preheader.lr.ph.1 ], [ %indvars.iv.next8.1, %.preheader.1 ]
  %indvars.iv.next8.1 = add i64 %indvars.iv712.1, %53
  %93 = icmp slt i64 %indvars.iv.next8.1, %46
  br i1 %93, label %.preheader.1, label %._crit_edge14.1.loopexit

._crit_edge14.1.loopexit:                         ; preds = %.preheader.1
  br label %._crit_edge14.1

._crit_edge14.1:                                  ; preds = %._crit_edge14.1.loopexit, %._crit_edge14
  %94 = add nsw i32 %.0316, 2
  %indvars.iv.next6.1 = add i32 %indvars.iv.next6, %51
  %exitcond.1 = icmp eq i32 %94, %50
  br i1 %exitcond.1, label %._crit_edge19.loopexit46, label %.lr.ph18.split
}

; Function Attrs: noinline nounwind uwtable
define internal void @create_colorindex(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %3 = bitcast %struct.jpeg_color_quantizer** %2 to %struct.my_cquantizer**
  %4 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %6, 1
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 4
  %.sink = zext i1 %7 to i32
  store i32 %.sink, i32* %8, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %10 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %10, i64 0, i32 2
  %12 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %11, align 8
  %13 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %14 = select i1 %7, i32 766, i32 256
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %16 = load i32, i32* %15, align 8
  %17 = tail call i8** %12(%struct.jpeg_common_struct* %13, i32 1, i32 %14, i32 %16) #5
  %18 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 3
  store i8** %17, i8*** %18, align 8
  %19 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 2
  %20 = load i32, i32* %19, align 8
  %21 = load i32, i32* %15, align 8
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %.lr.ph23, label %._crit_edge24

.lr.ph23:                                         ; preds = %1
  br i1 %7, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  br label %.lr.ph23.split

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader, %.loopexit.us
  %.0221.us = phi i32 [ %25, %.loopexit.us ], [ %20, %.lr.ph23.split.us.preheader ]
  %indvars.iv1120.us = phi i64 [ %indvars.iv.next12.us, %.loopexit.us ], [ 0, %.lr.ph23.split.us.preheader ]
  %23 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv1120.us
  %24 = load i32, i32* %23, align 4
  %25 = sdiv i32 %.0221.us, %24
  %26 = load i8**, i8*** %18, align 8
  %27 = getelementptr inbounds i8*, i8** %26, i64 %indvars.iv1120.us
  %28 = load i8*, i8** %27, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 255
  store i8* %29, i8** %27, align 8
  %30 = load i8**, i8*** %18, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 %indvars.iv1120.us
  %32 = load i8*, i8** %31, align 8
  %33 = add nsw i32 %24, -1
  %34 = tail call i32 @largest_input_value(i32 0, i32 %33)
  br label %.preheader.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %.17.lcssa.us = phi i32 [ %.0617.us, %.preheader.us ], [ %39, %._crit_edge.us.loopexit ]
  %.1.lcssa.us = phi i32 [ %.0118.us, %.preheader.us ], [ %38, %._crit_edge.us.loopexit ]
  %35 = mul nsw i32 %.1.lcssa.us, %25
  %36 = trunc i32 %35 to i8
  %37 = getelementptr inbounds i8, i8* %32, i64 %indvars.iv16.us
  store i8 %36, i8* %37, align 1
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv16.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 256
  br i1 %exitcond.us, label %.preheader13.us, label %.preheader.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.lr.ph.us
  %.114.us = phi i32 [ %38, %.lr.ph.us ], [ %.0118.us, %.lr.ph.us.preheader ]
  %38 = add nsw i32 %.114.us, 1
  %39 = tail call i32 @largest_input_value(i32 %38, i32 %33)
  %40 = sext i32 %39 to i64
  %41 = icmp sgt i64 %indvars.iv16.us, %40
  br i1 %41, label %.lr.ph.us, label %._crit_edge.us.loopexit

; <label>:42:                                     ; preds = %42, %.preheader13.us
  %indvars.iv819.us = phi i64 [ 1, %.preheader13.us ], [ %indvars.iv.next9.us.2, %42 ]
  %43 = load i8, i8* %32, align 1
  %44 = sub nsw i64 0, %indvars.iv819.us
  %45 = getelementptr inbounds i8, i8* %32, i64 %44
  store i8 %43, i8* %45, align 1
  %46 = load i8, i8* %63, align 1
  %47 = add nuw nsw i64 %indvars.iv819.us, 255
  %48 = getelementptr inbounds i8, i8* %32, i64 %47
  store i8 %46, i8* %48, align 1
  %49 = load i8, i8* %32, align 1
  %50 = xor i64 %indvars.iv819.us, -1
  %51 = getelementptr inbounds i8, i8* %32, i64 %50
  store i8 %49, i8* %51, align 1
  %52 = load i8, i8* %63, align 1
  %53 = add nsw i64 %indvars.iv819.us, 256
  %54 = getelementptr inbounds i8, i8* %32, i64 %53
  store i8 %52, i8* %54, align 1
  %55 = load i8, i8* %32, align 1
  %56 = sub i64 -2, %indvars.iv819.us
  %57 = getelementptr inbounds i8, i8* %32, i64 %56
  store i8 %55, i8* %57, align 1
  %58 = load i8, i8* %63, align 1
  %59 = add nsw i64 %indvars.iv819.us, 257
  %60 = getelementptr inbounds i8, i8* %32, i64 %59
  store i8 %58, i8* %60, align 1
  %indvars.iv.next9.us.2 = add nsw i64 %indvars.iv819.us, 3
  %exitcond10.us.2 = icmp eq i64 %indvars.iv.next9.us.2, 256
  br i1 %exitcond10.us.2, label %.loopexit.us, label %42

.preheader.us:                                    ; preds = %._crit_edge.us, %.lr.ph23.split.us
  %.0118.us = phi i32 [ 0, %.lr.ph23.split.us ], [ %.1.lcssa.us, %._crit_edge.us ]
  %.0617.us = phi i32 [ %34, %.lr.ph23.split.us ], [ %.17.lcssa.us, %._crit_edge.us ]
  %indvars.iv16.us = phi i64 [ 0, %.lr.ph23.split.us ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %61 = sext i32 %.0617.us to i64
  %62 = icmp sgt i64 %indvars.iv16.us, %61
  br i1 %62, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  br label %.lr.ph.us

.preheader13.us:                                  ; preds = %._crit_edge.us
  %63 = getelementptr inbounds i8, i8* %32, i64 255
  br label %42

.loopexit.us:                                     ; preds = %42
  %indvars.iv.next12.us = add nuw i64 %indvars.iv1120.us, 1
  %64 = load i32, i32* %15, align 8
  %65 = sext i32 %64 to i64
  %66 = icmp slt i64 %indvars.iv.next12.us, %65
  br i1 %66, label %.lr.ph23.split.us, label %._crit_edge24.loopexit

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader, %84
  %.0221 = phi i32 [ %69, %84 ], [ %20, %.lr.ph23.split.preheader ]
  %indvars.iv1120 = phi i64 [ %indvars.iv.next12, %84 ], [ 0, %.lr.ph23.split.preheader ]
  %67 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv1120
  %68 = load i32, i32* %67, align 4
  %69 = sdiv i32 %.0221, %68
  %70 = load i8**, i8*** %18, align 8
  %71 = getelementptr inbounds i8*, i8** %70, i64 %indvars.iv1120
  %72 = load i8*, i8** %71, align 8
  %73 = add nsw i32 %68, -1
  %74 = tail call i32 @largest_input_value(i32 0, i32 %73)
  br label %.preheader

.preheader:                                       ; preds = %.lr.ph23.split, %._crit_edge
  %.0118 = phi i32 [ 0, %.lr.ph23.split ], [ %.1.lcssa, %._crit_edge ]
  %.0617 = phi i32 [ %74, %.lr.ph23.split ], [ %.17.lcssa, %._crit_edge ]
  %indvars.iv16 = phi i64 [ 0, %.lr.ph23.split ], [ %indvars.iv.next, %._crit_edge ]
  %75 = sext i32 %.0617 to i64
  %76 = icmp sgt i64 %indvars.iv16, %75
  br i1 %76, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.114 = phi i32 [ %77, %.lr.ph ], [ %.0118, %.lr.ph.preheader ]
  %77 = add nsw i32 %.114, 1
  %78 = tail call i32 @largest_input_value(i32 %77, i32 %73)
  %79 = sext i32 %78 to i64
  %80 = icmp sgt i64 %indvars.iv16, %79
  br i1 %80, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.17.lcssa = phi i32 [ %.0617, %.preheader ], [ %78, %._crit_edge.loopexit ]
  %.1.lcssa = phi i32 [ %.0118, %.preheader ], [ %77, %._crit_edge.loopexit ]
  %81 = mul nsw i32 %.1.lcssa, %69
  %82 = trunc i32 %81 to i8
  %83 = getelementptr inbounds i8, i8* %72, i64 %indvars.iv16
  store i8 %82, i8* %83, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %84, label %.preheader

; <label>:84:                                     ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw i64 %indvars.iv1120, 1
  %85 = load i32, i32* %15, align 8
  %86 = sext i32 %85 to i64
  %87 = icmp slt i64 %indvars.iv.next12, %86
  br i1 %87, label %.lr.ph23.split, label %._crit_edge24.loopexit37

._crit_edge24.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge24

._crit_edge24.loopexit37:                         ; preds = %84
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit37, %._crit_edge24.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @alloc_fs_workspace(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %3 = bitcast %struct.jpeg_color_quantizer** %2 to %struct.my_cquantizer**
  %4 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %6 = load i32, i32* %5, align 8
  %7 = add i32 %6, 2
  %8 = zext i32 %7 to i64
  %9 = shl nuw nsw i64 %8, 1
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %11 = load i32, i32* %10, align 8
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %14 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %15
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %16 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %13, align 8
  %17 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %16, i64 0, i32 1
  %18 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %17, align 8
  %19 = tail call i8* %18(%struct.jpeg_common_struct* %14, i32 1, i64 %9) #5
  %20 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 8, i64 %indvars.iv1
  %21 = bitcast i16** %20 to i8**
  store i8* %19, i8** %21, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv1, 1
  %22 = load i32, i32* %10, align 8
  %23 = sext i32 %22 to i64
  %24 = icmp slt i64 %indvars.iv.next, %23
  br i1 %24, label %15, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %15
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @color_quantize3(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly, i32) #2 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 3
  %9 = load i8**, i8*** %8, align 8
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds i8*, i8** %9, i64 1
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8*, i8** %9, i64 2
  %14 = load i8*, i8** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %16 = load i32, i32* %15, align 8
  %17 = sext i32 %3 to i64
  %18 = icmp slt i32 %3, 1
  %19 = icmp eq i32 %16, 0
  %or.cond = or i1 %18, %19
  br i1 %or.cond, label %._crit_edge10, label %.lr.ph9.split.preheader

.lr.ph9.split.preheader:                          ; preds = %4
  %xtraiter = and i32 %16, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %20 = icmp eq i32 %16, 1
  %21 = add i32 %16, -1
  br label %.lr.ph9.split

.lr.ph9.split:                                    ; preds = %.lr.ph9.split.preheader, %._crit_edge
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph9.split.preheader ]
  %22 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv7
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv7
  %25 = load i8*, i8** %24, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph9.split
  %26 = getelementptr inbounds i8, i8* %23, i64 1
  %27 = load i8, i8* %23, align 1
  %28 = zext i8 %27 to i64
  %29 = getelementptr inbounds i8, i8* %10, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = getelementptr inbounds i8, i8* %23, i64 2
  %32 = load i8, i8* %26, align 1
  %33 = zext i8 %32 to i64
  %34 = getelementptr inbounds i8, i8* %12, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = add i8 %35, %30
  %37 = getelementptr inbounds i8, i8* %23, i64 3
  %38 = load i8, i8* %31, align 1
  %39 = zext i8 %38 to i64
  %40 = getelementptr inbounds i8, i8* %14, i64 %39
  %41 = load i8, i8* %40, align 1
  %42 = add i8 %36, %41
  %43 = getelementptr inbounds i8, i8* %25, i64 1
  store i8 %42, i8* %25, align 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph9.split
  %.06.unr.ph = phi i32 [ %21, %.prol.preheader ], [ %16, %.lr.ph9.split ]
  %.025.unr.ph = phi i8* [ %43, %.prol.preheader ], [ %25, %.lr.ph9.split ]
  %.034.unr.ph = phi i8* [ %37, %.prol.preheader ], [ %23, %.lr.ph9.split ]
  br i1 %20, label %._crit_edge, label %.lr.ph9.split.new.preheader

.lr.ph9.split.new.preheader:                      ; preds = %.prol.loopexit
  br label %.lr.ph9.split.new

.lr.ph9.split.new:                                ; preds = %.lr.ph9.split.new.preheader, %.lr.ph9.split.new
  %.06 = phi i32 [ %80, %.lr.ph9.split.new ], [ %.06.unr.ph, %.lr.ph9.split.new.preheader ]
  %.025 = phi i8* [ %79, %.lr.ph9.split.new ], [ %.025.unr.ph, %.lr.ph9.split.new.preheader ]
  %.034 = phi i8* [ %73, %.lr.ph9.split.new ], [ %.034.unr.ph, %.lr.ph9.split.new.preheader ]
  %44 = getelementptr inbounds i8, i8* %.034, i64 1
  %45 = load i8, i8* %.034, align 1
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds i8, i8* %10, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = getelementptr inbounds i8, i8* %.034, i64 2
  %50 = load i8, i8* %44, align 1
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds i8, i8* %12, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = add i8 %53, %48
  %55 = getelementptr inbounds i8, i8* %.034, i64 3
  %56 = load i8, i8* %49, align 1
  %57 = zext i8 %56 to i64
  %58 = getelementptr inbounds i8, i8* %14, i64 %57
  %59 = load i8, i8* %58, align 1
  %60 = add i8 %54, %59
  %61 = getelementptr inbounds i8, i8* %.025, i64 1
  store i8 %60, i8* %.025, align 1
  %62 = getelementptr inbounds i8, i8* %.034, i64 4
  %63 = load i8, i8* %55, align 1
  %64 = zext i8 %63 to i64
  %65 = getelementptr inbounds i8, i8* %10, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds i8, i8* %.034, i64 5
  %68 = load i8, i8* %62, align 1
  %69 = zext i8 %68 to i64
  %70 = getelementptr inbounds i8, i8* %12, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = add i8 %71, %66
  %73 = getelementptr inbounds i8, i8* %.034, i64 6
  %74 = load i8, i8* %67, align 1
  %75 = zext i8 %74 to i64
  %76 = getelementptr inbounds i8, i8* %14, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = add i8 %72, %77
  %79 = getelementptr inbounds i8, i8* %.025, i64 2
  store i8 %78, i8* %61, align 1
  %80 = add i32 %.06, -2
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %._crit_edge.loopexit, label %.lr.ph9.split.new

._crit_edge.loopexit:                             ; preds = %.lr.ph9.split.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %17
  br i1 %exitcond, label %._crit_edge10.loopexit, label %.lr.ph9.split

._crit_edge10.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @color_quantize(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly, i32) #2 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 3
  %9 = load i8**, i8*** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %13 = load i32, i32* %12, align 8
  %14 = sext i32 %13 to i64
  %15 = sext i32 %3 to i64
  %16 = icmp slt i32 %3, 1
  %17 = icmp eq i32 %11, 0
  %or.cond = or i1 %16, %17
  br i1 %or.cond, label %._crit_edge19, label %.lr.ph18.split

.lr.ph18.split:                                   ; preds = %4
  %18 = icmp sgt i32 %13, 0
  br i1 %18, label %.lr.ph18.split.split.us.preheader, label %.lr.ph18.split.split.preheader

.lr.ph18.split.split.us.preheader:                ; preds = %.lr.ph18.split
  %xtraiter = and i64 %14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = icmp eq i32 %13, 1
  br label %.lr.ph18.split.split.us

.lr.ph18.split.split.preheader:                   ; preds = %.lr.ph18.split
  %20 = add i32 %11, -1
  %21 = zext i32 %20 to i64
  %22 = add nuw nsw i64 %21, 1
  %23 = add nsw i64 %15, -1
  %xtraiter77 = and i64 %15, 3
  %lcmp.mod78 = icmp eq i64 %xtraiter77, 0
  br i1 %lcmp.mod78, label %.lr.ph18.split.split.prol.loopexit, label %._crit_edge15.prol.preheader

._crit_edge15.prol.preheader:                     ; preds = %.lr.ph18.split.split.preheader
  br label %._crit_edge15.prol

._crit_edge15.prol:                               ; preds = %._crit_edge15.prol.preheader, %._crit_edge15.prol
  %indvars.iv616.prol = phi i64 [ %indvars.iv.next7.prol, %._crit_edge15.prol ], [ 0, %._crit_edge15.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge15.prol ], [ %xtraiter77, %._crit_edge15.prol.preheader ]
  %24 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv616.prol
  %25 = load i8*, i8** %24, align 8
  call void @llvm.memset.p0i8.i64(i8* %25, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.prol = add nuw nsw i64 %indvars.iv616.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph18.split.split.prol.loopexit.loopexit, label %._crit_edge15.prol, !llvm.loop !3

.lr.ph18.split.split.prol.loopexit.loopexit:      ; preds = %._crit_edge15.prol
  br label %.lr.ph18.split.split.prol.loopexit

.lr.ph18.split.split.prol.loopexit:               ; preds = %.lr.ph18.split.split.prol.loopexit.loopexit, %.lr.ph18.split.split.preheader
  %indvars.iv616.unr = phi i64 [ 0, %.lr.ph18.split.split.preheader ], [ %indvars.iv.next7.prol, %.lr.ph18.split.split.prol.loopexit.loopexit ]
  %26 = icmp ult i64 %23, 3
  br i1 %26, label %._crit_edge19, label %._crit_edge15.3.preheader

._crit_edge15.3.preheader:                        ; preds = %.lr.ph18.split.split.prol.loopexit
  %27 = add nsw i64 %15, -4
  %28 = sub i64 %27, %indvars.iv616.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod86 = icmp eq i64 %30, 0
  br i1 %lcmp.mod86, label %._crit_edge15.3.prol.preheader, label %._crit_edge15.3.prol.loopexit

._crit_edge15.3.prol.preheader:                   ; preds = %._crit_edge15.3.preheader
  br label %._crit_edge15.3.prol

._crit_edge15.3.prol:                             ; preds = %._crit_edge15.3.prol.preheader
  %31 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv616.unr
  %32 = load i8*, i8** %31, align 8
  call void @llvm.memset.p0i8.i64(i8* %32, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.prol88 = add nuw nsw i64 %indvars.iv616.unr, 1
  %33 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.prol88
  %34 = load i8*, i8** %33, align 8
  call void @llvm.memset.p0i8.i64(i8* %34, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.1.prol = add nsw i64 %indvars.iv616.unr, 2
  %35 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.1.prol
  %36 = load i8*, i8** %35, align 8
  call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.2.prol = add nsw i64 %indvars.iv616.unr, 3
  %37 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.2.prol
  %38 = load i8*, i8** %37, align 8
  call void @llvm.memset.p0i8.i64(i8* %38, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.3.prol = add nsw i64 %indvars.iv616.unr, 4
  br label %._crit_edge15.3.prol.loopexit

._crit_edge15.3.prol.loopexit:                    ; preds = %._crit_edge15.3.prol, %._crit_edge15.3.preheader
  %indvars.iv616.unr89 = phi i64 [ %indvars.iv616.unr, %._crit_edge15.3.preheader ], [ %indvars.iv.next7.3.prol, %._crit_edge15.3.prol ]
  %39 = icmp eq i64 %29, 0
  br i1 %39, label %._crit_edge19.loopexit83, label %._crit_edge15.3.preheader.new

._crit_edge15.3.preheader.new:                    ; preds = %._crit_edge15.3.prol.loopexit
  br label %._crit_edge15.3

.lr.ph18.split.split.us:                          ; preds = %.lr.ph18.split.split.us.preheader, %._crit_edge15.us-lcssa.us.us71
  %indvars.iv616.us36 = phi i64 [ %indvars.iv.next7.us43, %._crit_edge15.us-lcssa.us.us71 ], [ 0, %.lr.ph18.split.split.us.preheader ]
  %40 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv616.us36
  %41 = load i8*, i8** %40, align 8
  %42 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv616.us36
  %43 = load i8*, i8** %42, align 8
  br label %.preheader.us.us56

.preheader.us.us56:                               ; preds = %.lr.ph18.split.split.us, %._crit_edge.us.us63
  %.014.us.us57 = phi i32 [ %11, %.lr.ph18.split.split.us ], [ %53, %._crit_edge.us.us63 ]
  %.0213.us.us58 = phi i8* [ %43, %.lr.ph18.split.split.us ], [ %52, %._crit_edge.us.us63 ]
  %.0312.us.us59 = phi i8* [ %41, %.lr.ph18.split.split.us ], [ %scevgep, %._crit_edge.us.us63 ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us56
  %44 = load i8*, i8** %9, align 8
  %45 = getelementptr inbounds i8, i8* %.0312.us.us59, i64 1
  %46 = load i8, i8* %.0312.us.us59, align 1
  %47 = zext i8 %46 to i64
  %48 = getelementptr inbounds i8, i8* %44, i64 %47
  %49 = load i8, i8* %48, align 1
  %50 = zext i8 %49 to i32
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us56
  %.110.us.us66.unr.ph = phi i8* [ %45, %.prol.preheader ], [ %.0312.us.us59, %.preheader.us.us56 ]
  %.059.us.us67.unr.ph = phi i32 [ %50, %.prol.preheader ], [ 0, %.preheader.us.us56 ]
  %indvars.iv8.us.us68.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us56 ]
  %.lcssa.unr.ph = phi i32 [ %50, %.prol.preheader ], [ undef, %.preheader.us.us56 ]
  br i1 %19, label %._crit_edge.us.us63, label %.preheader.us.us56.new.preheader

.preheader.us.us56.new.preheader:                 ; preds = %.prol.loopexit
  br label %.preheader.us.us56.new

._crit_edge.us.us63.loopexit:                     ; preds = %.preheader.us.us56.new
  br label %._crit_edge.us.us63

._crit_edge.us.us63:                              ; preds = %._crit_edge.us.us63.loopexit, %.prol.loopexit
  %.lcssa = phi i32 [ %.lcssa.unr.ph, %.prol.loopexit ], [ %72, %._crit_edge.us.us63.loopexit ]
  %scevgep = getelementptr i8, i8* %.0312.us.us59, i64 %14
  %51 = trunc i32 %.lcssa to i8
  %52 = getelementptr inbounds i8, i8* %.0213.us.us58, i64 1
  store i8 %51, i8* %.0213.us.us58, align 1
  %53 = add i32 %.014.us.us57, -1
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %._crit_edge15.us-lcssa.us.us71, label %.preheader.us.us56

.preheader.us.us56.new:                           ; preds = %.preheader.us.us56.new.preheader, %.preheader.us.us56.new
  %.110.us.us66 = phi i8* [ %66, %.preheader.us.us56.new ], [ %.110.us.us66.unr.ph, %.preheader.us.us56.new.preheader ]
  %.059.us.us67 = phi i32 [ %72, %.preheader.us.us56.new ], [ %.059.us.us67.unr.ph, %.preheader.us.us56.new.preheader ]
  %indvars.iv8.us.us68 = phi i64 [ %indvars.iv.next.us.us69.1, %.preheader.us.us56.new ], [ %indvars.iv8.us.us68.unr.ph, %.preheader.us.us56.new.preheader ]
  %55 = getelementptr inbounds i8*, i8** %9, i64 %indvars.iv8.us.us68
  %56 = load i8*, i8** %55, align 8
  %57 = getelementptr inbounds i8, i8* %.110.us.us66, i64 1
  %58 = load i8, i8* %.110.us.us66, align 1
  %59 = zext i8 %58 to i64
  %60 = getelementptr inbounds i8, i8* %56, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = add nsw i32 %62, %.059.us.us67
  %indvars.iv.next.us.us69 = add nuw nsw i64 %indvars.iv8.us.us68, 1
  %64 = getelementptr inbounds i8*, i8** %9, i64 %indvars.iv.next.us.us69
  %65 = load i8*, i8** %64, align 8
  %66 = getelementptr inbounds i8, i8* %.110.us.us66, i64 2
  %67 = load i8, i8* %57, align 1
  %68 = zext i8 %67 to i64
  %69 = getelementptr inbounds i8, i8* %65, i64 %68
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = add nsw i32 %71, %63
  %indvars.iv.next.us.us69.1 = add nsw i64 %indvars.iv8.us.us68, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us69.1, %14
  br i1 %exitcond.1, label %._crit_edge.us.us63.loopexit, label %.preheader.us.us56.new

._crit_edge15.us-lcssa.us.us71:                   ; preds = %._crit_edge.us.us63
  %indvars.iv.next7.us43 = add nuw nsw i64 %indvars.iv616.us36, 1
  %exitcond = icmp eq i64 %indvars.iv.next7.us43, %15
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.lr.ph18.split.split.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge15.us-lcssa.us.us71
  br label %._crit_edge19

._crit_edge19.loopexit83.unr-lcssa:               ; preds = %._crit_edge15.3
  br label %._crit_edge19.loopexit83

._crit_edge19.loopexit83:                         ; preds = %._crit_edge15.3.prol.loopexit, %._crit_edge19.loopexit83.unr-lcssa
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit83, %._crit_edge19.loopexit, %4, %.lr.ph18.split.split.prol.loopexit
  ret void

._crit_edge15.3:                                  ; preds = %._crit_edge15.3, %._crit_edge15.3.preheader.new
  %indvars.iv616 = phi i64 [ %indvars.iv616.unr89, %._crit_edge15.3.preheader.new ], [ %indvars.iv.next7.3.1, %._crit_edge15.3 ]
  %73 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv616
  %74 = load i8*, i8** %73, align 8
  call void @llvm.memset.p0i8.i64(i8* %74, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv616, 1
  %75 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7
  %76 = load i8*, i8** %75, align 8
  call void @llvm.memset.p0i8.i64(i8* %76, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv616, 2
  %77 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.1
  %78 = load i8*, i8** %77, align 8
  call void @llvm.memset.p0i8.i64(i8* %78, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.2 = add nsw i64 %indvars.iv616, 3
  %79 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.2
  %80 = load i8*, i8** %79, align 8
  call void @llvm.memset.p0i8.i64(i8* %80, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.3 = add nsw i64 %indvars.iv616, 4
  %81 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.3
  %82 = load i8*, i8** %81, align 8
  call void @llvm.memset.p0i8.i64(i8* %82, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.190 = add nsw i64 %indvars.iv616, 5
  %83 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.190
  %84 = load i8*, i8** %83, align 8
  call void @llvm.memset.p0i8.i64(i8* %84, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.1.1 = add nsw i64 %indvars.iv616, 6
  %85 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.1.1
  %86 = load i8*, i8** %85, align 8
  call void @llvm.memset.p0i8.i64(i8* %86, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.2.1 = add nsw i64 %indvars.iv616, 7
  %87 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next7.2.1
  %88 = load i8*, i8** %87, align 8
  call void @llvm.memset.p0i8.i64(i8* %88, i8 0, i64 %22, i32 1, i1 false)
  %indvars.iv.next7.3.1 = add nsw i64 %indvars.iv616, 8
  %exitcond76.3.1 = icmp eq i64 %indvars.iv.next7.3.1, %15
  br i1 %exitcond76.3.1, label %._crit_edge19.loopexit83.unr-lcssa, label %._crit_edge15.3
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @quantize3_ord_dither(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly, i32) #2 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 3
  %9 = load i8**, i8*** %8, align 8
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds i8*, i8** %9, i64 1
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8*, i8** %9, i64 2
  %14 = load i8*, i8** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %16 = load i32, i32* %15, align 8
  %17 = sext i32 %3 to i64
  %18 = icmp sgt i32 %3, 0
  br i1 %18, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %4
  %19 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 6
  %20 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 7, i64 0
  %21 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 7, i64 1
  %22 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 7, i64 2
  %23 = icmp eq i32 %16, 0
  br i1 %23, label %.lr.ph11.split.us.preheader, label %.lr.ph11.split.preheader

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  br label %.lr.ph11.split

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  %24 = add nsw i64 %17, -1
  %xtraiter = and i64 %17, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph11.split.us.prol.loopexit, label %.lr.ph11.split.us.prol.preheader

.lr.ph11.split.us.prol.preheader:                 ; preds = %.lr.ph11.split.us.preheader
  %.promoted16 = load i32, i32* %19, align 4
  br label %.lr.ph11.split.us.prol

.lr.ph11.split.us.prol:                           ; preds = %.lr.ph11.split.us.prol.preheader, %.lr.ph11.split.us.prol
  %25 = phi i32 [ %27, %.lr.ph11.split.us.prol ], [ %.promoted16, %.lr.ph11.split.us.prol.preheader ]
  %indvars.iv9.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.lr.ph11.split.us.prol ], [ 0, %.lr.ph11.split.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph11.split.us.prol ], [ %xtraiter, %.lr.ph11.split.us.prol.preheader ]
  %26 = add nsw i32 %25, 1
  %27 = and i32 %26, 15
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv9.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph11.split.us.prol.loopexit.loopexit, label %.lr.ph11.split.us.prol, !llvm.loop !4

.lr.ph11.split.us.prol.loopexit.loopexit:         ; preds = %.lr.ph11.split.us.prol
  store i32 %27, i32* %19, align 4
  br label %.lr.ph11.split.us.prol.loopexit

.lr.ph11.split.us.prol.loopexit:                  ; preds = %.lr.ph11.split.us.prol.loopexit.loopexit, %.lr.ph11.split.us.preheader
  %indvars.iv9.us.unr = phi i64 [ 0, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next.us.prol, %.lr.ph11.split.us.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %24, 3
  br i1 %28, label %._crit_edge12, label %.lr.ph11.split.us.preheader14

.lr.ph11.split.us.preheader14:                    ; preds = %.lr.ph11.split.us.prol.loopexit
  %.promoted = load i32, i32* %19, align 4
  %29 = add nsw i64 %17, -4
  %30 = sub i64 %29, %indvars.iv9.us.unr
  %31 = lshr i64 %30, 2
  %32 = add nuw nsw i64 %31, 1
  %xtraiter24 = and i64 %32, 7
  %lcmp.mod25 = icmp eq i64 %xtraiter24, 0
  br i1 %lcmp.mod25, label %.lr.ph11.split.us.prol.loopexit23, label %.lr.ph11.split.us.prol.preheader22

.lr.ph11.split.us.prol.preheader22:               ; preds = %.lr.ph11.split.us.preheader14
  br label %.lr.ph11.split.us.prol26

.lr.ph11.split.us.prol26:                         ; preds = %.lr.ph11.split.us.prol26, %.lr.ph11.split.us.prol.preheader22
  %33 = phi i32 [ %35, %.lr.ph11.split.us.prol26 ], [ %.promoted, %.lr.ph11.split.us.prol.preheader22 ]
  %indvars.iv9.us.prol27 = phi i64 [ %indvars.iv.next.us.3.prol, %.lr.ph11.split.us.prol26 ], [ %indvars.iv9.us.unr, %.lr.ph11.split.us.prol.preheader22 ]
  %prol.iter28 = phi i64 [ %prol.iter28.sub, %.lr.ph11.split.us.prol26 ], [ %xtraiter24, %.lr.ph11.split.us.prol.preheader22 ]
  %34 = add i32 %33, 4
  %35 = and i32 %34, 15
  %indvars.iv.next.us.3.prol = add nsw i64 %indvars.iv9.us.prol27, 4
  %prol.iter28.sub = add i64 %prol.iter28, -1
  %prol.iter28.cmp = icmp eq i64 %prol.iter28.sub, 0
  br i1 %prol.iter28.cmp, label %.lr.ph11.split.us.prol.loopexit23.unr-lcssa, label %.lr.ph11.split.us.prol26, !llvm.loop !5

.lr.ph11.split.us.prol.loopexit23.unr-lcssa:      ; preds = %.lr.ph11.split.us.prol26
  br label %.lr.ph11.split.us.prol.loopexit23

.lr.ph11.split.us.prol.loopexit23:                ; preds = %.lr.ph11.split.us.preheader14, %.lr.ph11.split.us.prol.loopexit23.unr-lcssa
  %.lcssa.unr = phi i32 [ undef, %.lr.ph11.split.us.preheader14 ], [ %35, %.lr.ph11.split.us.prol.loopexit23.unr-lcssa ]
  %.unr = phi i32 [ %.promoted, %.lr.ph11.split.us.preheader14 ], [ %35, %.lr.ph11.split.us.prol.loopexit23.unr-lcssa ]
  %indvars.iv9.us.unr29 = phi i64 [ %indvars.iv9.us.unr, %.lr.ph11.split.us.preheader14 ], [ %indvars.iv.next.us.3.prol, %.lr.ph11.split.us.prol.loopexit23.unr-lcssa ]
  %36 = icmp ult i64 %30, 28
  br i1 %36, label %._crit_edge12.loopexit, label %.lr.ph11.split.us.preheader14.new

.lr.ph11.split.us.preheader14.new:                ; preds = %.lr.ph11.split.us.prol.loopexit23
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us, %.lr.ph11.split.us.preheader14.new
  %37 = phi i32 [ %.unr, %.lr.ph11.split.us.preheader14.new ], [ %38, %.lr.ph11.split.us ]
  %indvars.iv9.us = phi i64 [ %indvars.iv9.us.unr29, %.lr.ph11.split.us.preheader14.new ], [ %indvars.iv.next.us.3.7, %.lr.ph11.split.us ]
  %38 = and i32 %37, 15
  %indvars.iv.next.us.3.7 = add nsw i64 %indvars.iv9.us, 32
  %exitcond.3.7 = icmp eq i64 %indvars.iv.next.us.3.7, %17
  br i1 %exitcond.3.7, label %._crit_edge12.loopexit.unr-lcssa, label %.lr.ph11.split.us

.lr.ph11.split:                                   ; preds = %.lr.ph11.split.preheader, %._crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph11.split.preheader ]
  %39 = load i32, i32* %19, align 4
  %40 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv9
  %41 = load i8*, i8** %40, align 8
  %42 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv9
  %43 = load i8*, i8** %42, align 8
  %44 = load [16 x i32]*, [16 x i32]** %20, align 8
  %45 = sext i32 %39 to i64
  %46 = load [16 x i32]*, [16 x i32]** %21, align 8
  %47 = load [16 x i32]*, [16 x i32]** %22, align 8
  br label %48

; <label>:48:                                     ; preds = %.lr.ph11.split, %48
  %.08 = phi i32 [ %16, %.lr.ph11.split ], [ %82, %48 ]
  %.027 = phi i32 [ 0, %.lr.ph11.split ], [ %81, %48 ]
  %.036 = phi i8* [ %43, %.lr.ph11.split ], [ %79, %48 ]
  %.045 = phi i8* [ %41, %.lr.ph11.split ], [ %69, %48 ]
  %49 = getelementptr inbounds i8, i8* %.045, i64 1
  %50 = load i8, i8* %.045, align 1
  %51 = zext i8 %50 to i32
  %52 = zext i32 %.027 to i64
  %53 = getelementptr inbounds [16 x i32], [16 x i32]* %44, i64 %45, i64 %52
  %54 = load i32, i32* %53, align 4
  %55 = add nsw i32 %51, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8* %10, i64 %56
  %58 = load i8, i8* %57, align 1
  %59 = getelementptr inbounds i8, i8* %.045, i64 2
  %60 = load i8, i8* %49, align 1
  %61 = zext i8 %60 to i32
  %62 = getelementptr inbounds [16 x i32], [16 x i32]* %46, i64 %45, i64 %52
  %63 = load i32, i32* %62, align 4
  %64 = add nsw i32 %61, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8* %12, i64 %65
  %67 = load i8, i8* %66, align 1
  %68 = add i8 %67, %58
  %69 = getelementptr inbounds i8, i8* %.045, i64 3
  %70 = load i8, i8* %59, align 1
  %71 = zext i8 %70 to i32
  %72 = getelementptr inbounds [16 x i32], [16 x i32]* %47, i64 %45, i64 %52
  %73 = load i32, i32* %72, align 4
  %74 = add nsw i32 %71, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %14, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = add i8 %68, %77
  %79 = getelementptr inbounds i8, i8* %.036, i64 1
  store i8 %78, i8* %.036, align 1
  %80 = add nuw nsw i32 %.027, 1
  %81 = and i32 %80, 15
  %82 = add i32 %.08, -1
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %._crit_edge, label %48

._crit_edge:                                      ; preds = %48
  %84 = add nsw i32 %39, 1
  %85 = and i32 %84, 15
  store i32 %85, i32* %19, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %17
  br i1 %exitcond, label %._crit_edge12.loopexit20, label %.lr.ph11.split

._crit_edge12.loopexit.unr-lcssa:                 ; preds = %.lr.ph11.split.us
  br label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %.lr.ph11.split.us.prol.loopexit23, %._crit_edge12.loopexit.unr-lcssa
  %.lcssa = phi i32 [ %.lcssa.unr, %.lr.ph11.split.us.prol.loopexit23 ], [ %38, %._crit_edge12.loopexit.unr-lcssa ]
  store i32 %.lcssa, i32* %19, align 4
  br label %._crit_edge12

._crit_edge12.loopexit20:                         ; preds = %._crit_edge
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit20, %._crit_edge12.loopexit, %.lr.ph11.split.us.prol.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @quantize_ord_dither(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = sext i32 %9 to i64
  %13 = sext i32 %3 to i64
  %14 = icmp sgt i32 %3, 0
  br i1 %14, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %4
  %15 = zext i32 %11 to i64
  %16 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 6
  %17 = icmp sgt i32 %9, 0
  %18 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 3
  %19 = icmp eq i32 %11, 0
  br i1 %17, label %.lr.ph18.split.us.preheader, label %.lr.ph18.split.preheader

.lr.ph18.split.preheader:                         ; preds = %.lr.ph18
  br label %.lr.ph18.split

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %xtraiter = and i32 %11, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %20 = icmp eq i32 %11, 1
  %21 = add i32 %11, -1
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %._crit_edge15.us
  %indvars.iv616.us = phi i64 [ %indvars.iv.next7.us, %._crit_edge15.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %22 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv616.us
  %23 = load i8*, i8** %22, align 8
  tail call void @jzero_far(i8* %23, i64 %15) #5
  %24 = load i32, i32* %16, align 4
  %25 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv616.us
  %26 = sext i32 %24 to i64
  br i1 %19, label %._crit_edge15.us, label %.lr.ph.us26.preheader

.lr.ph.us26.preheader:                            ; preds = %.lr.ph18.split.us
  br label %.lr.ph.us26

.lr.ph.us26:                                      ; preds = %.lr.ph.us26.preheader, %._crit_edge.us27
  %indvars.iv12.us20 = phi i64 [ %indvars.iv.next.us25, %._crit_edge.us27 ], [ 0, %.lr.ph.us26.preheader ]
  %27 = load i8*, i8** %25, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 %indvars.iv12.us20
  %29 = load i8*, i8** %22, align 8
  %30 = load i8**, i8*** %18, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 %indvars.iv12.us20
  %32 = load i8*, i8** %31, align 8
  %33 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 7, i64 %indvars.iv12.us20
  %34 = load [16 x i32]*, [16 x i32]** %33, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us26
  %35 = load i8, i8* %28, align 1
  %36 = zext i8 %35 to i32
  %37 = getelementptr inbounds [16 x i32], [16 x i32]* %34, i64 %26, i64 0
  %38 = load i32, i32* %37, align 4
  %39 = add nsw i32 %36, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* %32, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = load i8, i8* %29, align 1
  %44 = add i8 %43, %42
  store i8 %44, i8* %29, align 1
  %45 = getelementptr inbounds i8, i8* %28, i64 %12
  %46 = getelementptr inbounds i8, i8* %29, i64 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us26
  %.011.us21.unr.ph = phi i32 [ %21, %.prol.preheader ], [ %11, %.lr.ph.us26 ]
  %.0310.us22.unr.ph = phi i32 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us26 ]
  %.049.us23.unr.ph = phi i8* [ %45, %.prol.preheader ], [ %28, %.lr.ph.us26 ]
  %.058.us24.unr.ph = phi i8* [ %46, %.prol.preheader ], [ %29, %.lr.ph.us26 ]
  br i1 %20, label %._crit_edge.us27, label %.lr.ph.us26.new.preheader

.lr.ph.us26.new.preheader:                        ; preds = %.prol.loopexit
  br label %.lr.ph.us26.new

.lr.ph.us26.new:                                  ; preds = %.lr.ph.us26.new.preheader, %.lr.ph.us26.new
  %.011.us21 = phi i32 [ %77, %.lr.ph.us26.new ], [ %.011.us21.unr.ph, %.lr.ph.us26.new.preheader ]
  %.0310.us22 = phi i32 [ %76, %.lr.ph.us26.new ], [ %.0310.us22.unr.ph, %.lr.ph.us26.new.preheader ]
  %.049.us23 = phi i8* [ %73, %.lr.ph.us26.new ], [ %.049.us23.unr.ph, %.lr.ph.us26.new.preheader ]
  %.058.us24 = phi i8* [ %74, %.lr.ph.us26.new ], [ %.058.us24.unr.ph, %.lr.ph.us26.new.preheader ]
  %47 = load i8, i8* %.049.us23, align 1
  %48 = zext i8 %47 to i32
  %49 = zext i32 %.0310.us22 to i64
  %50 = getelementptr inbounds [16 x i32], [16 x i32]* %34, i64 %26, i64 %49
  %51 = load i32, i32* %50, align 4
  %52 = add nsw i32 %48, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %32, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = load i8, i8* %.058.us24, align 1
  %57 = add i8 %56, %55
  store i8 %57, i8* %.058.us24, align 1
  %58 = getelementptr inbounds i8, i8* %.049.us23, i64 %12
  %59 = getelementptr inbounds i8, i8* %.058.us24, i64 1
  %60 = add nuw nsw i32 %.0310.us22, 1
  %61 = and i32 %60, 15
  %62 = load i8, i8* %58, align 1
  %63 = zext i8 %62 to i32
  %64 = zext i32 %61 to i64
  %65 = getelementptr inbounds [16 x i32], [16 x i32]* %34, i64 %26, i64 %64
  %66 = load i32, i32* %65, align 4
  %67 = add nsw i32 %63, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8* %32, i64 %68
  %70 = load i8, i8* %69, align 1
  %71 = load i8, i8* %59, align 1
  %72 = add i8 %71, %70
  store i8 %72, i8* %59, align 1
  %73 = getelementptr inbounds i8, i8* %58, i64 %12
  %74 = getelementptr inbounds i8, i8* %.058.us24, i64 2
  %75 = add nsw i32 %.0310.us22, 2
  %76 = and i32 %75, 15
  %77 = add i32 %.011.us21, -2
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %._crit_edge.us27.loopexit, label %.lr.ph.us26.new

._crit_edge.us27.loopexit:                        ; preds = %.lr.ph.us26.new
  br label %._crit_edge.us27

._crit_edge.us27:                                 ; preds = %._crit_edge.us27.loopexit, %.prol.loopexit
  %indvars.iv.next.us25 = add nuw nsw i64 %indvars.iv12.us20, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us25, %12
  br i1 %exitcond, label %._crit_edge15.us.loopexit, label %.lr.ph.us26

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge.us27
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %.lr.ph18.split.us
  %79 = add nsw i32 %24, 1
  %80 = and i32 %79, 15
  store i32 %80, i32* %16, align 4
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv616.us, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next7.us, %13
  br i1 %exitcond33, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

.lr.ph18.split:                                   ; preds = %.lr.ph18.split.preheader, %.lr.ph18.split
  %indvars.iv616 = phi i64 [ %indvars.iv.next7, %.lr.ph18.split ], [ 0, %.lr.ph18.split.preheader ]
  %81 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv616
  %82 = load i8*, i8** %81, align 8
  tail call void @jzero_far(i8* %82, i64 %15) #5
  %83 = load i32, i32* %16, align 4
  %84 = add nsw i32 %83, 1
  %85 = and i32 %84, 15
  store i32 %85, i32* %16, align 4
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv616, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next7, %13
  br i1 %exitcond34, label %._crit_edge19.loopexit37, label %.lr.ph18.split

._crit_edge19.loopexit:                           ; preds = %._crit_edge15.us
  br label %._crit_edge19

._crit_edge19.loopexit37:                         ; preds = %.lr.ph18.split
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit37, %._crit_edge19.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @create_odither_tables(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %3 = bitcast %struct.jpeg_color_quantizer** %2 to %struct.my_cquantizer**
  %4 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph9.preheader, label %._crit_edge

.lr.ph9.preheader:                                ; preds = %1
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %21
  %indvars.iv48 = phi i64 [ %indvars.iv.next5, %21 ], [ 0, %.lr.ph9.preheader ]
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv48
  %9 = load i32, i32* %8, align 4
  %10 = icmp sgt i64 %indvars.iv48, 0
  br i1 %10, label %.lr.ph.preheader, label %.loopexit.thread

.lr.ph.preheader:                                 ; preds = %.lr.ph9
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %14
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph.preheader ]
  %11 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv7
  %12 = load i32, i32* %11, align 4
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %.loopexit, label %14

; <label>:14:                                     ; preds = %.lr.ph
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %15 = icmp slt i64 %indvars.iv.next, %indvars.iv48
  br i1 %15, label %.lr.ph, label %.loopexit.thread.loopexit

.loopexit:                                        ; preds = %.lr.ph
  %sext = shl i64 %indvars.iv7, 32
  %16 = ashr exact i64 %sext, 32
  %17 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 7, i64 %16
  %18 = load [16 x i32]*, [16 x i32]** %17, align 8
  %19 = icmp eq [16 x i32]* %18, null
  br i1 %19, label %.loopexit.thread, label %21

.loopexit.thread.loopexit:                        ; preds = %14
  br label %.loopexit.thread

.loopexit.thread:                                 ; preds = %.loopexit.thread.loopexit, %.lr.ph9, %.loopexit
  %20 = tail call [16 x i32]* @make_odither_array(%struct.jpeg_decompress_struct* %0, i32 %9)
  br label %21

; <label>:21:                                     ; preds = %.loopexit.thread, %.loopexit
  %.1 = phi [16 x i32]* [ %20, %.loopexit.thread ], [ %18, %.loopexit ]
  %22 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 7, i64 %indvars.iv48
  store [16 x i32]* %.1, [16 x i32]** %22, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv48, 1
  %23 = load i32, i32* %5, align 8
  %24 = sext i32 %23 to i64
  %25 = icmp slt i64 %indvars.iv.next5, %24
  br i1 %25, label %.lr.ph9, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %21
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @quantize_fs_dither(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %13 = load i8*, i8** %12, align 8
  %14 = zext i32 %11 to i64
  %15 = sext i32 %9 to i64
  %16 = sext i32 %3 to i64
  %17 = icmp sgt i32 %3, 0
  br i1 %17, label %.lr.ph28, label %._crit_edge29

.lr.ph28:                                         ; preds = %4
  %18 = icmp sgt i32 %9, 0
  %19 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 9
  %20 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 3
  %21 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 1
  %22 = icmp eq i32 %11, 0
  %23 = add i32 %11, -1
  %24 = mul i32 %23, %9
  %25 = zext i32 %24 to i64
  %26 = zext i32 %23 to i64
  %27 = sub nsw i32 0, %9
  %28 = add i32 %11, 1
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 9
  %xtraiter = and i64 %15, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %31 = icmp eq i32 %9, 1
  %32 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 0
  %33 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 0
  br label %34

; <label>:34:                                     ; preds = %._crit_edge25, %.lr.ph28
  %indvars.iv1326 = phi i64 [ 0, %.lr.ph28 ], [ %indvars.iv.next14, %._crit_edge25 ]
  %35 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv1326
  %36 = load i8*, i8** %35, align 8
  tail call void @jzero_far(i8* %36, i64 %14) #5
  br i1 %18, label %.lr.ph24, label %._crit_edge25

.lr.ph24:                                         ; preds = %34
  %37 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv1326
  br i1 %22, label %.lr.ph24.split.us.preheader, label %.lr.ph24.split.preheader

.lr.ph24.split.preheader:                         ; preds = %.lr.ph24
  br label %.lr.ph24.split

.lr.ph24.split.us.preheader:                      ; preds = %.lr.ph24
  br i1 %lcmp.mod, label %.lr.ph24.split.us.prol.loopexit, label %.lr.ph24.split.us.prol

.lr.ph24.split.us.prol:                           ; preds = %.lr.ph24.split.us.preheader
  %38 = load i32, i32* %19, align 8
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %43, label %40

; <label>:40:                                     ; preds = %.lr.ph24.split.us.prol
  %41 = load i16*, i16** %33, align 8
  %42 = getelementptr inbounds i16, i16* %41, i64 %29
  br label %45

; <label>:43:                                     ; preds = %.lr.ph24.split.us.prol
  %44 = load i16*, i16** %32, align 8
  br label %45

; <label>:45:                                     ; preds = %43, %40
  %.011.us.prol = phi i16* [ %42, %40 ], [ %44, %43 ]
  %.04.us.prol = phi i64 [ -1, %40 ], [ 1, %43 ]
  %46 = mul nsw i64 %.04.us.prol, %14
  %scevgep.us.prol = getelementptr i16, i16* %.011.us.prol, i64 %46
  store i16 0, i16* %scevgep.us.prol, align 2
  br label %.lr.ph24.split.us.prol.loopexit

.lr.ph24.split.us.prol.loopexit:                  ; preds = %45, %.lr.ph24.split.us.preheader
  %indvars.iv22.us.unr.ph = phi i64 [ 1, %45 ], [ 0, %.lr.ph24.split.us.preheader ]
  br i1 %31, label %._crit_edge25, label %.lr.ph24.split.us.preheader38

.lr.ph24.split.us.preheader38:                    ; preds = %.lr.ph24.split.us.prol.loopexit
  br label %.lr.ph24.split.us

.lr.ph24.split.us:                                ; preds = %.lr.ph24.split.us.preheader38, %.lr.ph24.split.us
  %indvars.iv22.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph24.split.us ], [ %indvars.iv22.us.unr.ph, %.lr.ph24.split.us.preheader38 ]
  %47 = load i32, i32* %19, align 8
  %48 = icmp eq i32 %47, 0
  %49 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 %indvars.iv22.us
  %50 = load i16*, i16** %49, align 8
  %51 = getelementptr inbounds i16, i16* %50, i64 %29
  %.011.us = select i1 %48, i16* %50, i16* %51
  %.04.us = select i1 %48, i64 1, i64 -1
  %52 = mul nsw i64 %.04.us, %14
  %scevgep.us = getelementptr i16, i16* %.011.us, i64 %52
  store i16 0, i16* %scevgep.us, align 2
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv22.us, 1
  %53 = load i32, i32* %19, align 8
  %54 = icmp eq i32 %53, 0
  %55 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 %indvars.iv.next.us
  %56 = load i16*, i16** %55, align 8
  %57 = getelementptr inbounds i16, i16* %56, i64 %29
  %.011.us.1 = select i1 %54, i16* %56, i16* %57
  %.04.us.1 = select i1 %54, i64 1, i64 -1
  %58 = mul nsw i64 %.04.us.1, %14
  %scevgep.us.1 = getelementptr i16, i16* %.011.us.1, i64 %58
  store i16 0, i16* %scevgep.us.1, align 2
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv22.us, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next.us.1, %15
  br i1 %exitcond31.1, label %._crit_edge25.loopexit, label %.lr.ph24.split.us

.lr.ph24.split:                                   ; preds = %.lr.ph24.split.preheader, %._crit_edge
  %indvars.iv22 = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph24.split.preheader ]
  %59 = load i8*, i8** %37, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 %indvars.iv22
  %61 = load i8*, i8** %35, align 8
  %62 = load i32, i32* %19, align 8
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %70, label %64

; <label>:64:                                     ; preds = %.lr.ph24.split
  %65 = getelementptr inbounds i8, i8* %60, i64 %25
  %66 = getelementptr inbounds i8, i8* %61, i64 %26
  %67 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 %indvars.iv22
  %68 = load i16*, i16** %67, align 8
  %69 = getelementptr inbounds i16, i16* %68, i64 %29
  br label %.lr.ph

; <label>:70:                                     ; preds = %.lr.ph24.split
  %71 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 %indvars.iv22
  %72 = load i16*, i16** %71, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %70, %64
  %.011 = phi i16* [ %69, %64 ], [ %72, %70 ]
  %.09 = phi i8* [ %65, %64 ], [ %60, %70 ]
  %.08 = phi i8* [ %66, %64 ], [ %61, %70 ]
  %.04 = phi i64 [ -1, %64 ], [ 1, %70 ]
  %.03 = phi i32 [ %27, %64 ], [ %9, %70 ]
  %73 = load i8**, i8*** %20, align 8
  %74 = getelementptr inbounds i8*, i8** %73, i64 %indvars.iv22
  %75 = load i8*, i8** %74, align 8
  %76 = load i8**, i8*** %21, align 8
  %77 = getelementptr inbounds i8*, i8** %76, i64 %indvars.iv22
  %78 = load i8*, i8** %77, align 8
  %79 = sext i32 %.03 to i64
  br label %80

; <label>:80:                                     ; preds = %.lr.ph, %80
  %.021 = phi i32 [ %11, %.lr.ph ], [ %112, %80 ]
  %.0520 = phi i32 [ 0, %.lr.ph ], [ %109, %80 ]
  %.0619 = phi i32 [ 0, %.lr.ph ], [ %103, %80 ]
  %.0718 = phi i32 [ 0, %.lr.ph ], [ %108, %80 ]
  %.117 = phi i8* [ %.08, %.lr.ph ], [ %111, %80 ]
  %.11016 = phi i8* [ %.09, %.lr.ph ], [ %110, %80 ]
  %.11215 = phi i16* [ %.011, %.lr.ph ], [ %81, %80 ]
  %81 = getelementptr inbounds i16, i16* %.11215, i64 %.04
  %82 = load i16, i16* %81, align 2
  %83 = sext i16 %82 to i32
  %84 = add i32 %.0520, 8
  %85 = add i32 %84, %83
  %86 = ashr i32 %85, 4
  %87 = load i8, i8* %.11016, align 1
  %88 = zext i8 %87 to i32
  %89 = add nsw i32 %86, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8* %13, i64 %90
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = zext i8 %92 to i64
  %95 = getelementptr inbounds i8, i8* %75, i64 %94
  %96 = load i8, i8* %95, align 1
  %97 = load i8, i8* %.117, align 1
  %98 = add i8 %97, %96
  store i8 %98, i8* %.117, align 1
  %99 = zext i8 %96 to i64
  %100 = getelementptr inbounds i8, i8* %78, i64 %99
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i32
  %103 = sub nsw i32 %93, %102
  %104 = mul nsw i32 %103, 3
  %105 = add nsw i32 %104, %.0718
  %106 = trunc i32 %105 to i16
  store i16 %106, i16* %.11215, align 2
  %107 = mul nsw i32 %103, 5
  %108 = add nsw i32 %107, %.0619
  %109 = mul nsw i32 %103, 7
  %110 = getelementptr inbounds i8, i8* %.11016, i64 %79
  %111 = getelementptr inbounds i8, i8* %.117, i64 %.04
  %112 = add i32 %.021, -1
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %._crit_edge, label %80

._crit_edge:                                      ; preds = %80
  %114 = mul nsw i64 %.04, %14
  %scevgep = getelementptr i16, i16* %.011, i64 %114
  %115 = trunc i32 %108 to i16
  store i16 %115, i16* %scevgep, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %15
  br i1 %exitcond, label %._crit_edge25.loopexit39, label %.lr.ph24.split

._crit_edge25.loopexit:                           ; preds = %.lr.ph24.split.us
  br label %._crit_edge25

._crit_edge25.loopexit39:                         ; preds = %._crit_edge
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit39, %._crit_edge25.loopexit, %.lr.ph24.split.us.prol.loopexit, %34
  %116 = load i32, i32* %30, align 8
  %not. = icmp eq i32 %116, 0
  %117 = zext i1 %not. to i32
  store i32 %117, i32* %30, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1326, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next14, %16
  br i1 %exitcond33, label %._crit_edge29.loopexit, label %34

._crit_edge29.loopexit:                           ; preds = %._crit_edge25
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %4
  ret void
}

declare void @jzero_far(i8*, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal [16 x i32]* @make_odither_array(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %4, i64 0, i32 0
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 1024) #5
  %9 = bitcast i8* %8 to [16 x i32]*
  %10 = add nsw i32 %1, -1
  %11 = sext i32 %10 to i64
  %12 = shl nsw i64 %11, 9
  br label %.preheader

.preheader:                                       ; preds = %2, %middle.block
  %indvars.iv26 = phi i64 [ 0, %2 ], [ %indvars.iv.next3, %middle.block ]
  br label %vector.body

vector.body:                                      ; preds = %pred.sdiv.continue20, %.preheader
  %index = phi i64 [ 0, %.preheader ], [ %index.next, %pred.sdiv.continue20 ]
  %13 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @base_dither_matrix, i64 0, i64 %indvars.iv26, i64 %index
  %14 = bitcast i8* %13 to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %14, align 4
  %15 = zext <4 x i8> %wide.load to <4 x i32>
  %16 = shl nuw nsw <4 x i32> %15, <i32 1, i32 1, i32 1, i32 1>
  %17 = sub nsw <4 x i32> <i32 255, i32 255, i32 255, i32 255>, %16
  %18 = mul nsw <4 x i32> %17, <i32 255, i32 255, i32 255, i32 255>
  %19 = sext <4 x i32> %18 to <4 x i64>
  %20 = icmp slt <4 x i32> %17, zeroinitializer
  %21 = xor <4 x i1> %20, <i1 true, i1 true, i1 true, i1 true>
  %22 = extractelement <4 x i1> %21, i32 0
  br i1 %22, label %pred.sdiv.if, label %pred.sdiv.continue

pred.sdiv.if:                                     ; preds = %vector.body
  %23 = extractelement <4 x i64> %19, i32 0
  %24 = sdiv i64 %23, %12
  %25 = insertelement <4 x i64> undef, i64 %24, i32 0
  br label %pred.sdiv.continue

pred.sdiv.continue:                               ; preds = %pred.sdiv.if, %vector.body
  %26 = phi <4 x i64> [ undef, %vector.body ], [ %25, %pred.sdiv.if ]
  %27 = extractelement <4 x i1> %21, i32 1
  br i1 %27, label %pred.sdiv.if7, label %pred.sdiv.continue8

pred.sdiv.if7:                                    ; preds = %pred.sdiv.continue
  %28 = extractelement <4 x i64> %19, i32 1
  %29 = sdiv i64 %28, %12
  %30 = insertelement <4 x i64> %26, i64 %29, i32 1
  br label %pred.sdiv.continue8

pred.sdiv.continue8:                              ; preds = %pred.sdiv.if7, %pred.sdiv.continue
  %31 = phi <4 x i64> [ %26, %pred.sdiv.continue ], [ %30, %pred.sdiv.if7 ]
  %32 = extractelement <4 x i1> %21, i32 2
  br i1 %32, label %pred.sdiv.if9, label %pred.sdiv.continue10

pred.sdiv.if9:                                    ; preds = %pred.sdiv.continue8
  %33 = extractelement <4 x i64> %19, i32 2
  %34 = sdiv i64 %33, %12
  %35 = insertelement <4 x i64> %31, i64 %34, i32 2
  br label %pred.sdiv.continue10

pred.sdiv.continue10:                             ; preds = %pred.sdiv.if9, %pred.sdiv.continue8
  %36 = phi <4 x i64> [ %31, %pred.sdiv.continue8 ], [ %35, %pred.sdiv.if9 ]
  %37 = extractelement <4 x i1> %21, i32 3
  br i1 %37, label %pred.sdiv.if11, label %pred.sdiv.continue12

pred.sdiv.if11:                                   ; preds = %pred.sdiv.continue10
  %38 = extractelement <4 x i64> %19, i32 3
  %39 = sdiv i64 %38, %12
  %40 = insertelement <4 x i64> %36, i64 %39, i32 3
  br label %pred.sdiv.continue12

pred.sdiv.continue12:                             ; preds = %pred.sdiv.if11, %pred.sdiv.continue10
  %41 = phi <4 x i64> [ %36, %pred.sdiv.continue10 ], [ %40, %pred.sdiv.if11 ]
  %42 = extractelement <4 x i1> %20, i32 0
  br i1 %42, label %pred.sdiv.if13, label %pred.sdiv.continue14

pred.sdiv.if13:                                   ; preds = %pred.sdiv.continue12
  %43 = extractelement <4 x i64> %19, i32 0
  %44 = sub nsw i64 0, %43
  %45 = sdiv i64 %44, %12
  %46 = insertelement <4 x i64> undef, i64 %45, i32 0
  br label %pred.sdiv.continue14

pred.sdiv.continue14:                             ; preds = %pred.sdiv.if13, %pred.sdiv.continue12
  %47 = phi <4 x i64> [ undef, %pred.sdiv.continue12 ], [ %46, %pred.sdiv.if13 ]
  %48 = extractelement <4 x i1> %20, i32 1
  br i1 %48, label %pred.sdiv.if15, label %pred.sdiv.continue16

pred.sdiv.if15:                                   ; preds = %pred.sdiv.continue14
  %49 = extractelement <4 x i64> %19, i32 1
  %50 = sub nsw i64 0, %49
  %51 = sdiv i64 %50, %12
  %52 = insertelement <4 x i64> %47, i64 %51, i32 1
  br label %pred.sdiv.continue16

pred.sdiv.continue16:                             ; preds = %pred.sdiv.if15, %pred.sdiv.continue14
  %53 = phi <4 x i64> [ %47, %pred.sdiv.continue14 ], [ %52, %pred.sdiv.if15 ]
  %54 = extractelement <4 x i1> %20, i32 2
  br i1 %54, label %pred.sdiv.if17, label %pred.sdiv.continue18

pred.sdiv.if17:                                   ; preds = %pred.sdiv.continue16
  %55 = extractelement <4 x i64> %19, i32 2
  %56 = sub nsw i64 0, %55
  %57 = sdiv i64 %56, %12
  %58 = insertelement <4 x i64> %53, i64 %57, i32 2
  br label %pred.sdiv.continue18

pred.sdiv.continue18:                             ; preds = %pred.sdiv.if17, %pred.sdiv.continue16
  %59 = phi <4 x i64> [ %53, %pred.sdiv.continue16 ], [ %58, %pred.sdiv.if17 ]
  %60 = extractelement <4 x i1> %20, i32 3
  br i1 %60, label %pred.sdiv.if19, label %pred.sdiv.continue20

pred.sdiv.if19:                                   ; preds = %pred.sdiv.continue18
  %61 = extractelement <4 x i64> %19, i32 3
  %62 = sub nsw i64 0, %61
  %63 = sdiv i64 %62, %12
  %64 = insertelement <4 x i64> %59, i64 %63, i32 3
  br label %pred.sdiv.continue20

pred.sdiv.continue20:                             ; preds = %pred.sdiv.if19, %pred.sdiv.continue18
  %65 = phi <4 x i64> [ %59, %pred.sdiv.continue18 ], [ %64, %pred.sdiv.if19 ]
  %66 = sub nsw <4 x i64> zeroinitializer, %65
  %predphi = select <4 x i1> %20, <4 x i64> %66, <4 x i64> %41
  %67 = trunc <4 x i64> %predphi to <4 x i32>
  %68 = getelementptr inbounds [16 x i32], [16 x i32]* %9, i64 %indvars.iv26, i64 %index
  %69 = bitcast i32* %68 to <4 x i32>*
  store <4 x i32> %67, <4 x i32>* %69, align 4
  %index.next = add i64 %index, 4
  %70 = icmp eq i64 %index.next, 16
  br i1 %70, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %pred.sdiv.continue20
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 16
  br i1 %exitcond4, label %71, label %.preheader

; <label>:71:                                     ; preds = %middle.block
  ret [16 x i32]* %9
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @select_ncolors(%struct.jpeg_decompress_struct*, i32* nocapture) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %4 = load i32, i32* %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %6 = load i32, i32* %5, align 8
  %7 = sext i32 %6 to i64
  %8 = icmp sgt i32 %4, 1
  br i1 %8, label %.split.us.preheader, label %.us-lcssa30.us.loopexit32

.split.us.preheader:                              ; preds = %2
  %9 = add i32 %4, 7
  %10 = add i32 %4, -2
  %xtraiter35 = and i32 %9, 7
  %lcmp.mod36 = icmp eq i32 %xtraiter35, 0
  %11 = icmp ult i32 %10, 7
  %12 = add i32 %4, -8
  br label %.split.us

.split.us:                                        ; preds = %.split.us.preheader, %._crit_edge.us
  %indvars.iv13.us = phi i64 [ %indvars.iv.next14.us, %._crit_edge.us ], [ 1, %.split.us.preheader ]
  %indvars.iv.next14.us = add nuw i64 %indvars.iv13.us, 1
  br i1 %lcmp.mod36, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.split.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %.027.us.prol = phi i64 [ %13, %.prol.preheader ], [ %indvars.iv.next14.us, %.prol.preheader.preheader ]
  %.0226.us.prol = phi i32 [ %14, %.prol.preheader ], [ 1, %.prol.preheader.preheader ]
  %prol.iter38 = phi i32 [ %prol.iter38.sub, %.prol.preheader ], [ %xtraiter35, %.prol.preheader.preheader ]
  %13 = mul nsw i64 %.027.us.prol, %indvars.iv.next14.us
  %14 = add nuw nsw i32 %.0226.us.prol, 1
  %prol.iter38.sub = add i32 %prol.iter38, -1
  %prol.iter38.cmp = icmp eq i32 %prol.iter38.sub, 0
  br i1 %prol.iter38.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !9

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.split.us
  %.027.us.unr = phi i64 [ %indvars.iv.next14.us, %.split.us ], [ %13, %.prol.loopexit.loopexit ]
  %.0226.us.unr = phi i32 [ 1, %.split.us ], [ %14, %.prol.loopexit.loopexit ]
  %.lcssa33.unr = phi i64 [ undef, %.split.us ], [ %13, %.prol.loopexit.loopexit ]
  br i1 %11, label %._crit_edge.us, label %.split.us.new.preheader

.split.us.new.preheader:                          ; preds = %.prol.loopexit
  %15 = sub i32 %12, %.0226.us.unr
  %16 = lshr i32 %15, 3
  %17 = and i32 %16, 1
  %lcmp.mod66 = icmp eq i32 %17, 0
  br i1 %lcmp.mod66, label %.split.us.new.prol.preheader, label %.split.us.new.prol.loopexit.unr-lcssa

.split.us.new.prol.preheader:                     ; preds = %.split.us.new.preheader
  br label %.split.us.new.prol

.split.us.new.prol:                               ; preds = %.split.us.new.prol.preheader
  %18 = mul nsw i64 %.027.us.unr, %indvars.iv.next14.us
  %19 = mul nsw i64 %18, %indvars.iv.next14.us
  %20 = mul nsw i64 %19, %indvars.iv.next14.us
  %21 = mul nsw i64 %20, %indvars.iv.next14.us
  %22 = mul nsw i64 %21, %indvars.iv.next14.us
  %23 = mul nsw i64 %22, %indvars.iv.next14.us
  %24 = mul nsw i64 %23, %indvars.iv.next14.us
  %25 = mul nsw i64 %24, %indvars.iv.next14.us
  %26 = add nsw i32 %.0226.us.unr, 8
  br label %.split.us.new.prol.loopexit.unr-lcssa

.split.us.new.prol.loopexit.unr-lcssa:            ; preds = %.split.us.new.preheader, %.split.us.new.prol
  %.lcssa64.unr.ph = phi i64 [ %25, %.split.us.new.prol ], [ undef, %.split.us.new.preheader ]
  %.027.us.unr69.ph = phi i64 [ %25, %.split.us.new.prol ], [ %.027.us.unr, %.split.us.new.preheader ]
  %.0226.us.unr70.ph = phi i32 [ %26, %.split.us.new.prol ], [ %.0226.us.unr, %.split.us.new.preheader ]
  br label %.split.us.new.prol.loopexit

.split.us.new.prol.loopexit:                      ; preds = %.split.us.new.prol.loopexit.unr-lcssa
  %27 = icmp eq i32 %16, 0
  br i1 %27, label %._crit_edge.us.loopexit, label %.split.us.new.preheader.new

.split.us.new.preheader.new:                      ; preds = %.split.us.new.prol.loopexit
  br label %.split.us.new

.split.us.new:                                    ; preds = %.split.us.new, %.split.us.new.preheader.new
  %.027.us = phi i64 [ %.027.us.unr69.ph, %.split.us.new.preheader.new ], [ %43, %.split.us.new ]
  %.0226.us = phi i32 [ %.0226.us.unr70.ph, %.split.us.new.preheader.new ], [ %44, %.split.us.new ]
  %28 = mul nsw i64 %.027.us, %indvars.iv.next14.us
  %29 = mul nsw i64 %28, %indvars.iv.next14.us
  %30 = mul nsw i64 %29, %indvars.iv.next14.us
  %31 = mul nsw i64 %30, %indvars.iv.next14.us
  %32 = mul nsw i64 %31, %indvars.iv.next14.us
  %33 = mul nsw i64 %32, %indvars.iv.next14.us
  %34 = mul nsw i64 %33, %indvars.iv.next14.us
  %35 = mul nsw i64 %34, %indvars.iv.next14.us
  %36 = mul nsw i64 %35, %indvars.iv.next14.us
  %37 = mul nsw i64 %36, %indvars.iv.next14.us
  %38 = mul nsw i64 %37, %indvars.iv.next14.us
  %39 = mul nsw i64 %38, %indvars.iv.next14.us
  %40 = mul nsw i64 %39, %indvars.iv.next14.us
  %41 = mul nsw i64 %40, %indvars.iv.next14.us
  %42 = mul nsw i64 %41, %indvars.iv.next14.us
  %43 = mul nsw i64 %42, %indvars.iv.next14.us
  %44 = add nsw i32 %.0226.us, 16
  %exitcond.739.1 = icmp eq i32 %44, %4
  br i1 %exitcond.739.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.split.us.new

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.split.us.new
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.split.us.new.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  %.lcssa64 = phi i64 [ %.lcssa64.unr.ph, %.split.us.new.prol.loopexit ], [ %43, %._crit_edge.us.loopexit.unr-lcssa ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %.lcssa33 = phi i64 [ %.lcssa33.unr, %.prol.loopexit ], [ %.lcssa64, %._crit_edge.us.loopexit ]
  %45 = icmp sgt i64 %.lcssa33, %7
  br i1 %45, label %.us-lcssa30.us.loopexit, label %.split.us

.us-lcssa30.us.loopexit32:                        ; preds = %2
  %46 = add nsw i64 %7, 1
  %47 = icmp sgt i64 %46, 2
  %smax = select i1 %47, i64 %46, i64 2
  br label %.us-lcssa30.us

.us-lcssa30.us.loopexit:                          ; preds = %._crit_edge.us
  br label %.us-lcssa30.us

.us-lcssa30.us:                                   ; preds = %.us-lcssa30.us.loopexit, %.us-lcssa30.us.loopexit32
  %indvars.iv.next14.lcssa = phi i64 [ %smax, %.us-lcssa30.us.loopexit32 ], [ %indvars.iv.next14.us, %.us-lcssa30.us.loopexit ]
  %.0.lcssa.lcssa = phi i64 [ %smax, %.us-lcssa30.us.loopexit32 ], [ %.lcssa33, %.us-lcssa30.us.loopexit ]
  %48 = trunc i64 %indvars.iv.next14.lcssa to i32
  %49 = add nsw i32 %48, -1
  %50 = icmp slt i32 %48, 3
  br i1 %50, label %51, label %62

; <label>:51:                                     ; preds = %.us-lcssa30.us
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i64 0, i32 5
  store i32 55, i32* %54, align 8
  %55 = trunc i64 %.0.lcssa.lcssa to i32
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 6, i32 0, i64 0
  store i32 %55, i32* %57, align 4
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 0
  %60 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %59, align 8
  %61 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %60(%struct.jpeg_common_struct* %61) #5
  br label %62

; <label>:62:                                     ; preds = %51, %.us-lcssa30.us
  %63 = sext i32 %4 to i64
  %64 = icmp sgt i32 %4, 0
  br i1 %64, label %.lr.ph24.preheader, label %.us-lcssa.us

.lr.ph24.preheader:                               ; preds = %62
  %65 = add nsw i64 %63, -1
  %xtraiter = and i64 %63, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph24.prol.loopexit, label %.lr.ph24.prol.preheader

.lr.ph24.prol.preheader:                          ; preds = %.lr.ph24.preheader
  br label %.lr.ph24.prol

.lr.ph24.prol:                                    ; preds = %.lr.ph24.prol.preheader, %.lr.ph24.prol
  %.0423.prol = phi i32 [ %67, %.lr.ph24.prol ], [ 1, %.lr.ph24.prol.preheader ]
  %indvars.iv1122.prol = phi i64 [ %indvars.iv.next12.prol, %.lr.ph24.prol ], [ 0, %.lr.ph24.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph24.prol ], [ %xtraiter, %.lr.ph24.prol.preheader ]
  %66 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv1122.prol
  store i32 %49, i32* %66, align 4
  %67 = mul nsw i32 %.0423.prol, %49
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv1122.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph24.prol.loopexit.loopexit, label %.lr.ph24.prol, !llvm.loop !10

.lr.ph24.prol.loopexit.loopexit:                  ; preds = %.lr.ph24.prol
  br label %.lr.ph24.prol.loopexit

.lr.ph24.prol.loopexit:                           ; preds = %.lr.ph24.prol.loopexit.loopexit, %.lr.ph24.preheader
  %.0423.unr = phi i32 [ 1, %.lr.ph24.preheader ], [ %67, %.lr.ph24.prol.loopexit.loopexit ]
  %indvars.iv1122.unr = phi i64 [ 0, %.lr.ph24.preheader ], [ %indvars.iv.next12.prol, %.lr.ph24.prol.loopexit.loopexit ]
  %.lcssa.unr = phi i32 [ undef, %.lr.ph24.preheader ], [ %67, %.lr.ph24.prol.loopexit.loopexit ]
  %68 = icmp ult i64 %65, 7
  br i1 %68, label %.preheader, label %.lr.ph24.preheader57

.lr.ph24.preheader57:                             ; preds = %.lr.ph24.prol.loopexit
  br label %.lr.ph24

.preheader.loopexit:                              ; preds = %.lr.ph24
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph24.prol.loopexit
  %.04.lcssa = phi i32 [ %.lcssa.unr, %.lr.ph24.prol.loopexit ], [ %109, %.preheader.loopexit ]
  %69 = icmp sgt i32 %4, 0
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 10
  br i1 %69, label %.preheader.split.us.preheader, label %.us-lcssa.us

.preheader.split.us.preheader:                    ; preds = %.preheader
  br label %.preheader.split.us

.preheader.split.us.loopexit:                     ; preds = %90
  br label %.preheader.split.us.backedge

.preheader.split.us:                              ; preds = %.preheader.split.us.backedge, %.preheader.split.us.preheader
  %.15.us = phi i32 [ %.04.lcssa, %.preheader.split.us.preheader ], [ %.15.us.be, %.preheader.split.us.backedge ]
  br label %71

; <label>:71:                                     ; preds = %.preheader.split.us, %90
  %.0117.us = phi i32 [ 0, %.preheader.split.us ], [ 1, %90 ]
  %.2616.us = phi i32 [ %.15.us, %.preheader.split.us ], [ %91, %90 ]
  %indvars.iv15.us = phi i64 [ 0, %.preheader.split.us ], [ %indvars.iv.next.us, %90 ]
  %72 = load i32, i32* %70, align 8
  %73 = icmp eq i32 %72, 2
  br i1 %73, label %76, label %74

; <label>:74:                                     ; preds = %71
  %75 = trunc i64 %indvars.iv15.us to i32
  br label %79

; <label>:76:                                     ; preds = %71
  %77 = getelementptr inbounds [3 x i32], [3 x i32]* @select_ncolors.RGB_order, i64 0, i64 %indvars.iv15.us
  %78 = load i32, i32* %77, align 4
  br label %79

; <label>:79:                                     ; preds = %76, %74
  %80 = phi i32 [ %78, %76 ], [ %75, %74 ]
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32* %1, i64 %81
  %83 = load i32, i32* %82, align 4
  %84 = sdiv i32 %.2616.us, %83
  %85 = sext i32 %84 to i64
  %86 = add nsw i32 %83, 1
  %87 = sext i32 %86 to i64
  %88 = mul nsw i64 %85, %87
  %89 = icmp sgt i64 %88, %7
  br i1 %89, label %.loopexit.us, label %90

; <label>:90:                                     ; preds = %79
  store i32 %86, i32* %82, align 4
  %91 = trunc i64 %88 to i32
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %92 = icmp slt i64 %indvars.iv.next.us, %63
  br i1 %92, label %71, label %.preheader.split.us.loopexit

.loopexit.us:                                     ; preds = %79
  %93 = icmp eq i32 %.0117.us, 0
  br i1 %93, label %.us-lcssa.us.loopexit, label %.preheader.split.us.backedge

.preheader.split.us.backedge:                     ; preds = %.loopexit.us, %.preheader.split.us.loopexit
  %.15.us.be = phi i32 [ %.2616.us, %.loopexit.us ], [ %91, %.preheader.split.us.loopexit ]
  br label %.preheader.split.us

.lr.ph24:                                         ; preds = %.lr.ph24.preheader57, %.lr.ph24
  %.0423 = phi i32 [ %109, %.lr.ph24 ], [ %.0423.unr, %.lr.ph24.preheader57 ]
  %indvars.iv1122 = phi i64 [ %indvars.iv.next12.7, %.lr.ph24 ], [ %indvars.iv1122.unr, %.lr.ph24.preheader57 ]
  %94 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv1122
  store i32 %49, i32* %94, align 4
  %95 = mul nsw i32 %.0423, %49
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1122, 1
  %96 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next12
  store i32 %49, i32* %96, align 4
  %97 = mul nsw i32 %95, %49
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1122, 2
  %98 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next12.1
  store i32 %49, i32* %98, align 4
  %99 = mul nsw i32 %97, %49
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv1122, 3
  %100 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next12.2
  store i32 %49, i32* %100, align 4
  %101 = mul nsw i32 %99, %49
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv1122, 4
  %102 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next12.3
  store i32 %49, i32* %102, align 4
  %103 = mul nsw i32 %101, %49
  %indvars.iv.next12.4 = add nsw i64 %indvars.iv1122, 5
  %104 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next12.4
  store i32 %49, i32* %104, align 4
  %105 = mul nsw i32 %103, %49
  %indvars.iv.next12.5 = add nsw i64 %indvars.iv1122, 6
  %106 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next12.5
  store i32 %49, i32* %106, align 4
  %107 = mul nsw i32 %105, %49
  %indvars.iv.next12.6 = add nsw i64 %indvars.iv1122, 7
  %108 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next12.6
  store i32 %49, i32* %108, align 4
  %109 = mul nsw i32 %107, %49
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv1122, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next12.7, %63
  br i1 %exitcond.7, label %.preheader.loopexit, label %.lr.ph24

.us-lcssa.us.loopexit:                            ; preds = %.loopexit.us
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit, %62, %.preheader
  %.26.lcssa.lcssa = phi i32 [ %.04.lcssa, %.preheader ], [ 1, %62 ], [ %.2616.us, %.us-lcssa.us.loopexit ]
  ret i32 %.26.lcssa.lcssa
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @output_value(i32, i32) #1 {
  %3 = sext i32 %0 to i64
  %4 = mul nsw i64 %3, 255
  %5 = sdiv i32 %1, 2
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %6, %4
  %8 = sext i32 %1 to i64
  %9 = sdiv i64 %7, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @largest_input_value(i32, i32) #1 {
  %3 = shl nsw i32 %0, 1
  %4 = or i32 %3, 1
  %5 = sext i32 %4 to i64
  %6 = mul nsw i64 %5, 255
  %7 = sext i32 %1 to i64
  %8 = add nsw i64 %6, %7
  %9 = shl nsw i32 %1, 1
  %10 = sext i32 %9 to i64
  %11 = sdiv i64 %8, %10
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !2}
!10 = distinct !{!10, !2}
