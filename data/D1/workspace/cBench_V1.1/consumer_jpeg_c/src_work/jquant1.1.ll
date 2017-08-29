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

@base_dither_matrix = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"\00\C00\F0\0C\CC<\FC\03\C33\F3\0F\CF?\FF", [16 x i8] c"\80@\B0p\8CL\BC|\83C\B3s\8FO\BF\7F", [16 x i8] c" \E0\10\D0,\EC\1C\DC#\E3\13\D3/\EF\1F\DF", [16 x i8] c"\A0`\90P\ACl\9C\5C\A3c\93S\AFo\9F_", [16 x i8] c"\08\C88\F8\04\C44\F4\0B\CB;\FB\07\C77\F7", [16 x i8] c"\88H\B8x\84D\B4t\8BK\BB{\87G\B7w", [16 x i8] c"(\E8\18\D8$\E4\14\D4+\EB\1B\DB'\E7\17\D7", [16 x i8] c"\A8h\98X\A4d\94T\ABk\9B[\A7g\97W", [16 x i8] c"\02\C22\F2\0E\CE>\FE\01\C11\F1\0D\CD=\FD", [16 x i8] c"\82B\B2r\8EN\BE~\81A\B1q\8DM\BD}", [16 x i8] c"\22\E2\12\D2.\EE\1E\DE!\E1\11\D1-\ED\1D\DD", [16 x i8] c"\A2b\92R\AEn\9E^\A1a\91Q\ADm\9D]", [16 x i8] c"\0A\CA:\FA\06\C66\F6\09\C99\F9\05\C55\F5", [16 x i8] c"\8AJ\BAz\86F\B6v\89I\B9y\85E\B5u", [16 x i8] c"*\EA\1A\DA&\E6\16\D6)\E9\19\D9%\E5\15\D5", [16 x i8] c"\AAj\9AZ\A6f\96V\A9i\99Y\A5e\95U"], align 16
@select_ncolors.RGB_order = internal unnamed_addr constant [3 x i32] [i32 1, i32 0, i32 2], align 4

; Function Attrs: noinline nounwind uwtable
define void @jinit_1pass_quantizer(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
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
  br i1 %21, label %22, label %32

; <label>:22:                                     ; preds = %1
  %23 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 54, i32* %26, align 8
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 6, i32 0, i64 0
  store i32 4, i32* %28, align 4
  %29 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %30 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %29, align 8
  %31 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %30, align 8
  tail call void %31(%struct.jpeg_common_struct* %23) #5
  br label %32

; <label>:32:                                     ; preds = %1, %22
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %34 = load i32, i32* %33, align 8
  %35 = icmp sgt i32 %34, 256
  br i1 %35, label %36, label %46

; <label>:36:                                     ; preds = %32
  %37 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i64 0, i32 5
  store i32 56, i32* %40, align 8
  %41 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %42 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %41, i64 0, i32 6, i32 0, i64 0
  store i32 256, i32* %42, align 4
  %43 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %44 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %43, align 8
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  tail call void %45(%struct.jpeg_common_struct* nonnull %37) #5
  br label %46

; <label>:46:                                     ; preds = %32, %36
  tail call fastcc void @create_colormap(%struct.jpeg_decompress_struct* nonnull %0)
  tail call fastcc void @create_colorindex(%struct.jpeg_decompress_struct* nonnull %0)
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 20
  %48 = load i32, i32* %47, align 8
  %49 = icmp eq i32 %48, 2
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %46
  tail call fastcc void @alloc_fs_workspace(%struct.jpeg_decompress_struct* nonnull %0)
  ret void

; <label>:51:                                     ; preds = %46
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
  tail call fastcc void @create_colorindex(%struct.jpeg_decompress_struct* nonnull %0)
  br label %31

; <label>:31:                                     ; preds = %21, %30
  %32 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 7, i64 0
  %33 = load [16 x i32]*, [16 x i32]** %32, align 8
  %34 = icmp eq [16 x i32]* %33, null
  br i1 %34, label %35, label %.loopexit

; <label>:35:                                     ; preds = %31
  tail call fastcc void @create_odither_tables(%struct.jpeg_decompress_struct* nonnull %0)
  ret void

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
  tail call fastcc void @alloc_fs_workspace(%struct.jpeg_decompress_struct* nonnull %0)
  br label %43

; <label>:43:                                     ; preds = %36, %42
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
  %sunkaddr6 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 136
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %52 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %5, i64 0, i32 8, i64 %indvars.iv
  %53 = bitcast i16** %52 to i8**
  %54 = load i8*, i8** %53, align 8
  tail call void @jzero_far(i8* %54, i64 %48) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %55 = load i32, i32* %sunkaddr8, align 8
  %56 = sext i32 %55 to i64
  %57 = icmp slt i64 %indvars.iv.next, %56
  br i1 %57, label %.lr.ph, label %.loopexit.loopexit

; <label>:58:                                     ; preds = %2
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i64 0, i32 5
  store i32 47, i32* %61, align 8
  %62 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %63 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %62, align 8
  %64 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %63, align 8
  %65 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %64(%struct.jpeg_common_struct* %65) #5
  ret void

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %43, %31, %16
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
  %5 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %6 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %5, align 8
  %7 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %6, align 8
  %8 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %7(%struct.jpeg_common_struct* %8) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @create_colormap(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %3 = bitcast %struct.jpeg_color_quantizer** %2 to %struct.my_cquantizer**
  %4 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %5 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 0
  %6 = tail call fastcc i32 @select_ncolors(%struct.jpeg_decompress_struct* %0, i32* %5)
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %8 = load i32, i32* %7, align 8
  %9 = icmp eq i32 %8, 3
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  br i1 %9, label %13, label %29

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 0
  store i32 %6, i32* %14, align 4
  %sunkaddr = ptrtoint %struct.my_cquantizer* %4 to i64
  %sunkaddr33 = add i64 %sunkaddr, 60
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  %15 = load i32, i32* %sunkaddr34, align 4
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 1
  store i32 %15, i32* %16, align 4
  %17 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 1
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 2
  store i32 %18, i32* %19, align 4
  %20 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 2
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 3
  store i32 %21, i32* %22, align 4
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 5
  store i32 93, i32* %24, align 8
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 1
  %27 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %26, align 8
  %28 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %27(%struct.jpeg_common_struct* %28, i32 1) #5
  br label %37

; <label>:29:                                     ; preds = %1
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 5
  store i32 94, i32* %30, align 8
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i64 0, i32 6, i32 0, i64 0
  store i32 %6, i32* %32, align 4
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 1
  %35 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %34, align 8
  %36 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %35(%struct.jpeg_common_struct* %36, i32 1) #5
  br label %37

; <label>:37:                                     ; preds = %29, %13
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %39 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %39, i64 0, i32 2
  %41 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %40, align 8
  %42 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr35 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 136
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i32*
  %43 = load i32, i32* %sunkaddr37, align 8
  %44 = tail call i8** %41(%struct.jpeg_common_struct* %42, i32 1, i32 %6, i32 %43) #5
  %45 = load i32, i32* %sunkaddr37, align 8
  %46 = icmp sgt i32 %45, 0
  br i1 %46, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %37
  %47 = sext i32 %6 to i64
  %sunkaddr53 = ptrtoint i8** %44 to i64
  %sunkaddr49 = ptrtoint i8** %44 to i64
  %sunkaddr57 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr58 = add i64 %sunkaddr57, 136
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i32*
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %._crit_edge12, %.lr.ph16.preheader
  %indvars.iv31 = phi i64 [ 0, %.lr.ph16.preheader ], [ %indvars.iv.next32, %._crit_edge12 ]
  %.0114 = phi i32 [ %6, %.lr.ph16.preheader ], [ %50, %._crit_edge12 ]
  %48 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv31
  %49 = load i32, i32* %48, align 4
  %50 = sdiv i32 %.0114, %49
  %51 = icmp sgt i32 %49, 0
  br i1 %51, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %.lr.ph16
  %52 = add nsw i32 %49, -1
  %53 = icmp sgt i32 %50, 0
  br i1 %53, label %.lr.ph11.split.us.preheader, label %._crit_edge12

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  %54 = add i32 %50, -1
  %55 = sext i32 %.0114 to i64
  %xtraiter = and i32 %50, 3
  %wide.trip.count.3 = zext i32 %50 to i64
  %56 = add nsw i32 %xtraiter, -1
  %57 = zext i32 %56 to i64
  %58 = add nuw nsw i64 %57, 1
  %59 = icmp eq i32 %xtraiter, 0
  %60 = icmp ult i32 %54, 3
  %sunkaddr54 = shl i64 %indvars.iv31, 3
  %sunkaddr55 = add i64 %sunkaddr53, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to i8**
  %sunkaddr50 = shl i64 %indvars.iv31, 3
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i8**
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge8.us-lcssa.us.us, %.lr.ph11.split.us.preheader
  %indvars.iv27 = phi i32 [ 0, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next28, %._crit_edge8.us-lcssa.us.us ]
  %.039.us = phi i32 [ 0, %.lr.ph11.split.us.preheader ], [ %66, %._crit_edge8.us-lcssa.us.us ]
  %61 = mul nsw i32 %.039.us, %50
  %62 = icmp slt i32 %61, %6
  br i1 %62, label %.preheader.lr.ph.us, label %._crit_edge8.us-lcssa.us.us

.preheader.lr.ph.us:                              ; preds = %.lr.ph11.split.us
  %63 = sext i32 %indvars.iv27 to i64
  %64 = tail call fastcc i32 @output_value(i32 %.039.us, i32 %52)
  %65 = trunc i32 %64 to i8
  br label %.preheader.us.us

._crit_edge8.us-lcssa.us.us.loopexit:             ; preds = %._crit_edge.us.us
  br label %._crit_edge8.us-lcssa.us.us

._crit_edge8.us-lcssa.us.us:                      ; preds = %._crit_edge8.us-lcssa.us.us.loopexit, %.lr.ph11.split.us
  %66 = add nuw nsw i32 %.039.us, 1
  %indvars.iv.next28 = add i32 %indvars.iv27, %50
  %exitcond = icmp eq i32 %66, %49
  br i1 %exitcond, label %._crit_edge12.loopexit, label %.lr.ph11.split.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.lr.ph.us
  %indvars.iv29 = phi i64 [ %63, %.preheader.lr.ph.us ], [ %indvars.iv.next30, %._crit_edge.us.us ]
  br i1 %59, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %67 = load i8*, i8** %sunkaddr52, align 8
  %68 = add nsw i64 %indvars.iv.prol, %indvars.iv29
  %69 = getelementptr inbounds i8, i8* %67, i64 %68
  store i8 %65, i8* %69, align 1
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us.us ], [ %58, %.prol.loopexit.loopexit ]
  br i1 %60, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next30 = add i64 %indvars.iv29, %55
  %70 = icmp slt i64 %indvars.iv.next30, %47
  br i1 %70, label %.preheader.us.us, label %._crit_edge8.us-lcssa.us.us.loopexit

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.us.new ], [ %indvars.iv.unr, %.preheader.us.us.new.preheader ]
  %71 = load i8*, i8** %sunkaddr56, align 8
  %72 = add nsw i64 %indvars.iv, %indvars.iv29
  %73 = getelementptr inbounds i8, i8* %71, i64 %72
  store i8 %65, i8* %73, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %74 = load i8*, i8** %sunkaddr56, align 8
  %75 = add nsw i64 %indvars.iv.next, %indvars.iv29
  %76 = getelementptr inbounds i8, i8* %74, i64 %75
  store i8 %65, i8* %76, align 1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %77 = load i8*, i8** %sunkaddr56, align 8
  %78 = add nsw i64 %indvars.iv.next.1, %indvars.iv29
  %79 = getelementptr inbounds i8, i8* %77, i64 %78
  store i8 %65, i8* %79, align 1
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %80 = load i8*, i8** %sunkaddr56, align 8
  %81 = add nsw i64 %indvars.iv.next.2, %indvars.iv29
  %82 = getelementptr inbounds i8, i8* %80, i64 %81
  store i8 %65, i8* %82, align 1
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge12.loopexit:                           ; preds = %._crit_edge8.us-lcssa.us.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.lr.ph11, %.lr.ph16
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %83 = load i32, i32* %sunkaddr59, align 8
  %84 = sext i32 %83 to i64
  %85 = icmp slt i64 %indvars.iv.next32, %84
  br i1 %85, label %.lr.ph16, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %37
  %86 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 1
  store i8** %44, i8*** %86, align 8
  %87 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 2
  store i32 %6, i32* %87, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @create_colorindex(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
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
  br i1 %22, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %1
  %23 = icmp eq i32 %6, 1
  br i1 %23, label %.lr.ph18.split.us.preheader, label %.lr.ph18.split.preheader

.lr.ph18.split.preheader:                         ; preds = %.lr.ph18
  %sunkaddr67 = ptrtoint %struct.my_cquantizer* %4 to i64
  %sunkaddr68 = add i64 %sunkaddr67, 48
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i8***
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr70 = add i64 %sunkaddr, 136
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to i32*
  br label %.lr.ph18.split

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %sunkaddr58 = ptrtoint %struct.my_cquantizer* %4 to i64
  %sunkaddr59 = add i64 %sunkaddr58, 48
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to i8***
  %sunkaddr64 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr65 = add i64 %sunkaddr64, 136
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i32*
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.lr.ph18.split.us.preheader, %.loopexit.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %.loopexit.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %.0216.us = phi i32 [ %26, %.loopexit.us ], [ %20, %.lr.ph18.split.us.preheader ]
  %24 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv27
  %25 = load i32, i32* %24, align 4
  %26 = sdiv i32 %.0216.us, %25
  %27 = load i8**, i8*** %sunkaddr60, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv27
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 255
  store i8* %30, i8** %28, align 8
  %31 = load i8**, i8*** %sunkaddr60, align 8
  %32 = getelementptr inbounds i8*, i8** %31, i64 %indvars.iv27
  %33 = load i8*, i8** %32, align 8
  %34 = add nsw i32 %25, -1
  %35 = tail call fastcc i32 @largest_input_value(i32 0, i32 %34)
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.lr.ph18.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.lr.ph18.split.us ]
  %.0113.us = phi i32 [ %.1.lcssa.us, %._crit_edge.us ], [ 0, %.lr.ph18.split.us ]
  %.0611.us = phi i32 [ %.17.lcssa.us, %._crit_edge.us ], [ %35, %.lr.ph18.split.us ]
  %36 = sext i32 %.0611.us to i64
  %37 = icmp sgt i64 %indvars.iv, %36
  br i1 %37, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.lr.ph.us
  %.19.us = phi i32 [ %38, %.lr.ph.us ], [ %.0113.us, %.lr.ph.us.preheader ]
  %38 = add nsw i32 %.19.us, 1
  %39 = tail call fastcc i32 @largest_input_value(i32 %38, i32 %34)
  %40 = sext i32 %39 to i64
  %41 = icmp sgt i64 %indvars.iv, %40
  br i1 %41, label %.lr.ph.us, label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %.17.lcssa.us = phi i32 [ %.0611.us, %.preheader.us ], [ %39, %._crit_edge.us.loopexit ]
  %.1.lcssa.us = phi i32 [ %.0113.us, %.preheader.us ], [ %38, %._crit_edge.us.loopexit ]
  %42 = mul nsw i32 %.1.lcssa.us, %26
  %43 = trunc i32 %42 to i8
  %44 = getelementptr inbounds i8, i8* %33, i64 %indvars.iv
  store i8 %43, i8* %44, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond, label %.preheader8.us.preheader, label %.preheader.us

.preheader8.us.preheader:                         ; preds = %._crit_edge.us
  %sunkaddr61 = ptrtoint i8* %33 to i64
  %sunkaddr62 = add i64 %sunkaddr61, 255
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to i8*
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %.preheader8.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.2, %.preheader8.us ], [ 1, %.preheader8.us.preheader ]
  %45 = load i8, i8* %33, align 1
  %46 = sub nsw i64 0, %indvars.iv24
  %47 = getelementptr inbounds i8, i8* %33, i64 %46
  store i8 %45, i8* %47, align 1
  %48 = load i8, i8* %sunkaddr63, align 1
  %49 = add nuw nsw i64 %indvars.iv24, 255
  %50 = getelementptr inbounds i8, i8* %33, i64 %49
  store i8 %48, i8* %50, align 1
  %51 = load i8, i8* %33, align 1
  %52 = xor i64 %indvars.iv24, -1
  %53 = getelementptr inbounds i8, i8* %33, i64 %52
  store i8 %51, i8* %53, align 1
  %54 = load i8, i8* %sunkaddr63, align 1
  %55 = add nuw nsw i64 %indvars.iv24, 256
  %56 = getelementptr inbounds i8, i8* %33, i64 %55
  store i8 %54, i8* %56, align 1
  %57 = load i8, i8* %33, align 1
  %58 = sub nuw nsw i64 -2, %indvars.iv24
  %59 = getelementptr inbounds i8, i8* %33, i64 %58
  store i8 %57, i8* %59, align 1
  %60 = load i8, i8* %sunkaddr63, align 1
  %61 = add nuw nsw i64 %indvars.iv24, 257
  %62 = getelementptr inbounds i8, i8* %33, i64 %61
  store i8 %60, i8* %62, align 1
  %indvars.iv.next25.2 = add nuw nsw i64 %indvars.iv24, 3
  %exitcond26.2 = icmp eq i64 %indvars.iv.next25.2, 256
  br i1 %exitcond26.2, label %.loopexit.us, label %.preheader8.us

.loopexit.us:                                     ; preds = %.preheader8.us
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %63 = load i32, i32* %sunkaddr66, align 8
  %64 = sext i32 %63 to i64
  %65 = icmp slt i64 %indvars.iv.next28, %64
  br i1 %65, label %.lr.ph18.split.us, label %._crit_edge19.loopexit

.lr.ph18.split:                                   ; preds = %.lr.ph18.split.preheader, %83
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %83 ], [ 0, %.lr.ph18.split.preheader ]
  %.0216 = phi i32 [ %68, %83 ], [ %20, %.lr.ph18.split.preheader ]
  %66 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv32
  %67 = load i32, i32* %66, align 4
  %68 = sdiv i32 %.0216, %67
  %69 = load i8**, i8*** %sunkaddr69, align 8
  %70 = getelementptr inbounds i8*, i8** %69, i64 %indvars.iv32
  %71 = load i8*, i8** %70, align 8
  %72 = add nsw i32 %67, -1
  %73 = tail call fastcc i32 @largest_input_value(i32 0, i32 %72)
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.lr.ph18.split
  %indvars.iv29 = phi i64 [ 0, %.lr.ph18.split ], [ %indvars.iv.next30, %._crit_edge ]
  %.0113 = phi i32 [ 0, %.lr.ph18.split ], [ %.1.lcssa, %._crit_edge ]
  %.0611 = phi i32 [ %73, %.lr.ph18.split ], [ %.17.lcssa, %._crit_edge ]
  %74 = sext i32 %.0611 to i64
  %75 = icmp sgt i64 %indvars.iv29, %74
  br i1 %75, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.19 = phi i32 [ %76, %.lr.ph ], [ %.0113, %.lr.ph.preheader ]
  %76 = add nsw i32 %.19, 1
  %77 = tail call fastcc i32 @largest_input_value(i32 %76, i32 %72)
  %78 = sext i32 %77 to i64
  %79 = icmp sgt i64 %indvars.iv29, %78
  br i1 %79, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.17.lcssa = phi i32 [ %.0611, %.preheader ], [ %77, %._crit_edge.loopexit ]
  %.1.lcssa = phi i32 [ %.0113, %.preheader ], [ %76, %._crit_edge.loopexit ]
  %80 = mul nsw i32 %.1.lcssa, %68
  %81 = trunc i32 %80 to i8
  %82 = getelementptr inbounds i8, i8* %71, i64 %indvars.iv29
  store i8 %81, i8* %82, align 1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 256
  br i1 %exitcond31, label %83, label %.preheader

; <label>:83:                                     ; preds = %._crit_edge
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %84 = load i32, i32* %sunkaddr71, align 8
  %85 = sext i32 %84 to i64
  %86 = icmp slt i64 %indvars.iv.next33, %85
  br i1 %86, label %.lr.ph18.split, label %._crit_edge19.loopexit76

._crit_edge19.loopexit:                           ; preds = %.loopexit.us
  br label %._crit_edge19

._crit_edge19.loopexit76:                         ; preds = %83
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit76, %._crit_edge19.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @alloc_fs_workspace(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
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
  br i1 %12, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %1
  %13 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr9 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 8
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to %struct.jpeg_memory_mgr**
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr12 = add i64 %sunkaddr, 136
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %14 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr11, align 8
  %15 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %14, i64 0, i32 1
  %16 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %15, align 8
  %17 = tail call i8* %16(%struct.jpeg_common_struct* %13, i32 1, i64 %9) #5
  %18 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 8, i64 %indvars.iv
  %19 = bitcast i16** %18 to i8**
  store i8* %17, i8** %19, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %20 = load i32, i32* %sunkaddr13, align 8
  %21 = sext i32 %20 to i64
  %22 = icmp slt i64 %indvars.iv.next, %21
  br i1 %22, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
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
  %17 = icmp slt i32 %3, 1
  %18 = icmp eq i32 %16, 0
  %or.cond = or i1 %17, %18
  br i1 %or.cond, label %._crit_edge10, label %.lr.ph9.split.preheader

.lr.ph9.split.preheader:                          ; preds = %4
  %xtraiter = and i32 %16, 1
  %wide.trip.count = zext i32 %3 to i64
  %19 = add i32 %16, -1
  %20 = icmp eq i32 %xtraiter, 0
  %21 = icmp eq i32 %16, 1
  br label %.lr.ph9.split

.lr.ph9.split:                                    ; preds = %._crit_edge, %.lr.ph9.split.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph9.split.preheader ]
  %22 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %25 = load i8*, i8** %24, align 8
  br i1 %20, label %.prol.loopexit, label %.prol.preheader

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
  %37 = load i8, i8* %31, align 1
  %38 = zext i8 %37 to i64
  %39 = getelementptr inbounds i8, i8* %14, i64 %38
  %40 = load i8, i8* %39, align 1
  %41 = add i8 %36, %40
  store i8 %41, i8* %25, align 1
  %42 = getelementptr inbounds i8, i8* %25, i64 1
  %43 = getelementptr inbounds i8, i8* %23, i64 3
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph9.split, %.prol.preheader
  %.06.unr.ph = phi i32 [ %19, %.prol.preheader ], [ %16, %.lr.ph9.split ]
  %.025.unr.ph = phi i8* [ %42, %.prol.preheader ], [ %25, %.lr.ph9.split ]
  %.034.unr.ph = phi i8* [ %43, %.prol.preheader ], [ %23, %.lr.ph9.split ]
  br i1 %21, label %._crit_edge, label %.lr.ph9.split.new.preheader

.lr.ph9.split.new.preheader:                      ; preds = %.prol.loopexit
  br label %.lr.ph9.split.new

.lr.ph9.split.new:                                ; preds = %.lr.ph9.split.new.preheader, %.lr.ph9.split.new
  %.06 = phi i32 [ %80, %.lr.ph9.split.new ], [ %.06.unr.ph, %.lr.ph9.split.new.preheader ]
  %.025 = phi i8* [ %78, %.lr.ph9.split.new ], [ %.025.unr.ph, %.lr.ph9.split.new.preheader ]
  %.034 = phi i8* [ %79, %.lr.ph9.split.new ], [ %.034.unr.ph, %.lr.ph9.split.new.preheader ]
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
  %55 = load i8, i8* %49, align 1
  %56 = zext i8 %55 to i64
  %57 = getelementptr inbounds i8, i8* %14, i64 %56
  %58 = load i8, i8* %57, align 1
  %59 = add i8 %54, %58
  store i8 %59, i8* %.025, align 1
  %60 = getelementptr inbounds i8, i8* %.025, i64 1
  %61 = getelementptr inbounds i8, i8* %.034, i64 3
  %62 = getelementptr inbounds i8, i8* %.034, i64 4
  %63 = load i8, i8* %61, align 1
  %64 = zext i8 %63 to i64
  %65 = getelementptr inbounds i8, i8* %10, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds i8, i8* %.034, i64 5
  %68 = load i8, i8* %62, align 1
  %69 = zext i8 %68 to i64
  %70 = getelementptr inbounds i8, i8* %12, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = add i8 %71, %66
  %73 = load i8, i8* %67, align 1
  %74 = zext i8 %73 to i64
  %75 = getelementptr inbounds i8, i8* %14, i64 %74
  %76 = load i8, i8* %75, align 1
  %77 = add i8 %72, %76
  store i8 %77, i8* %60, align 1
  %78 = getelementptr inbounds i8, i8* %.025, i64 2
  %79 = getelementptr inbounds i8, i8* %.034, i64 6
  %80 = add i32 %.06, -2
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %._crit_edge.loopexit, label %.lr.ph9.split.new

._crit_edge.loopexit:                             ; preds = %.lr.ph9.split.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
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
  %wide.trip.count.1 = zext i32 %13 to i64
  %14 = icmp slt i32 %3, 1
  %15 = icmp eq i32 %11, 0
  %or.cond = or i1 %14, %15
  br i1 %or.cond, label %._crit_edge17, label %.lr.ph16.split

.lr.ph16.split:                                   ; preds = %4
  %16 = icmp sgt i32 %13, 0
  br i1 %16, label %.lr.ph16.split.split.us.preheader, label %.lr.ph16.split.split.preheader

.lr.ph16.split.split.preheader:                   ; preds = %.lr.ph16.split
  %17 = add i32 %11, -1
  %18 = zext i32 %17 to i64
  %19 = add nuw nsw i64 %18, 1
  %20 = add i32 %3, -1
  %xtraiter77 = and i32 %3, 3
  %lcmp.mod78 = icmp eq i32 %xtraiter77, 0
  br i1 %lcmp.mod78, label %.lr.ph16.split.split.prol.loopexit, label %.lr.ph16.split.split.preheader.._crit_edge13.prol_crit_edge

.lr.ph16.split.split.preheader.._crit_edge13.prol_crit_edge: ; preds = %.lr.ph16.split.split.preheader
  %21 = add nsw i32 %xtraiter77, -1
  %22 = zext i32 %21 to i64
  br label %._crit_edge13.prol

._crit_edge13.prol:                               ; preds = %._crit_edge13.prol, %.lr.ph16.split.split.preheader.._crit_edge13.prol_crit_edge
  %indvars.iv73.prol = phi i64 [ %indvars.iv.next74.prol, %._crit_edge13.prol ], [ 0, %.lr.ph16.split.split.preheader.._crit_edge13.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge13.prol ], [ %xtraiter77, %.lr.ph16.split.split.preheader.._crit_edge13.prol_crit_edge ]
  %23 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv73.prol
  %24 = load i8*, i8** %23, align 8
  call void @llvm.memset.p0i8.i64(i8* %24, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.prol = add nuw nsw i64 %indvars.iv73.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge13.prol..lr.ph16.split.split.prol.loopexit_crit_edge, label %._crit_edge13.prol, !llvm.loop !3

._crit_edge13.prol..lr.ph16.split.split.prol.loopexit_crit_edge: ; preds = %._crit_edge13.prol
  %25 = add nuw nsw i64 %22, 1
  br label %.lr.ph16.split.split.prol.loopexit

.lr.ph16.split.split.prol.loopexit:               ; preds = %.lr.ph16.split.split.preheader, %._crit_edge13.prol..lr.ph16.split.split.prol.loopexit_crit_edge
  %indvars.iv73.unr = phi i64 [ %25, %._crit_edge13.prol..lr.ph16.split.split.prol.loopexit_crit_edge ], [ 0, %.lr.ph16.split.split.preheader ]
  %26 = icmp ult i32 %20, 3
  br i1 %26, label %._crit_edge17, label %._crit_edge13.3.preheader

._crit_edge13.3.preheader:                        ; preds = %.lr.ph16.split.split.prol.loopexit
  %wide.trip.count75.3 = zext i32 %3 to i64
  %27 = add nsw i64 %wide.trip.count75.3, -4
  %28 = sub nsw i64 %27, %indvars.iv73.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod = icmp eq i64 %30, 0
  br i1 %lcmp.mod, label %._crit_edge13.3.prol.preheader, label %._crit_edge13.3.prol.loopexit

._crit_edge13.3.prol.preheader:                   ; preds = %._crit_edge13.3.preheader
  br label %._crit_edge13.3.prol

._crit_edge13.3.prol:                             ; preds = %._crit_edge13.3.prol.preheader
  %31 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv73.unr
  %32 = load i8*, i8** %31, align 8
  call void @llvm.memset.p0i8.i64(i8* %32, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.prol85 = add nuw nsw i64 %indvars.iv73.unr, 1
  %33 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.prol85
  %34 = load i8*, i8** %33, align 8
  call void @llvm.memset.p0i8.i64(i8* %34, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.1.prol = add nsw i64 %indvars.iv73.unr, 2
  %35 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.1.prol
  %36 = load i8*, i8** %35, align 8
  call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.2.prol = add nsw i64 %indvars.iv73.unr, 3
  %37 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.2.prol
  %38 = load i8*, i8** %37, align 8
  call void @llvm.memset.p0i8.i64(i8* %38, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.3.prol = add nsw i64 %indvars.iv73.unr, 4
  br label %._crit_edge13.3.prol.loopexit

._crit_edge13.3.prol.loopexit:                    ; preds = %._crit_edge13.3.prol, %._crit_edge13.3.preheader
  %indvars.iv73.unr86 = phi i64 [ %indvars.iv73.unr, %._crit_edge13.3.preheader ], [ %indvars.iv.next74.3.prol, %._crit_edge13.3.prol ]
  %39 = icmp eq i64 %29, 0
  br i1 %39, label %._crit_edge17.loopexit82, label %._crit_edge13.3.preheader.new

._crit_edge13.3.preheader.new:                    ; preds = %._crit_edge13.3.prol.loopexit
  br label %._crit_edge13.3

.lr.ph16.split.split.us.preheader:                ; preds = %.lr.ph16.split
  %40 = add i32 %13, -1
  %41 = zext i32 %40 to i64
  %42 = add nuw nsw i64 %41, 1
  %xtraiter = and i32 %13, 1
  %wide.trip.count72 = zext i32 %3 to i64
  %43 = icmp eq i32 %xtraiter, 0
  %44 = icmp eq i32 %40, 0
  br label %.lr.ph16.split.split.us

.lr.ph16.split.split.us:                          ; preds = %._crit_edge13.us-lcssa.us.us65, %.lr.ph16.split.split.us.preheader
  %indvars.iv70 = phi i64 [ 0, %.lr.ph16.split.split.us.preheader ], [ %indvars.iv.next71, %._crit_edge13.us-lcssa.us.us65 ]
  %45 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv70
  %46 = load i8*, i8** %45, align 8
  %47 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv70
  %48 = load i8*, i8** %47, align 8
  br label %.preheader.us.us51

.preheader.us.us51:                               ; preds = %._crit_edge.us.us56, %.lr.ph16.split.split.us
  %.012.us.us52 = phi i32 [ %11, %.lr.ph16.split.split.us ], [ %58, %._crit_edge.us.us56 ]
  %.0211.us.us53 = phi i8* [ %48, %.lr.ph16.split.split.us ], [ %57, %._crit_edge.us.us56 ]
  %.0310.us.us54 = phi i8* [ %46, %.lr.ph16.split.split.us ], [ %scevgep, %._crit_edge.us.us56 ]
  br i1 %43, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us51
  %49 = load i8*, i8** %9, align 8
  %50 = load i8, i8* %.0310.us.us54, align 1
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = getelementptr inbounds i8, i8* %.0310.us.us54, i64 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us51, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us51 ]
  %.18.us.us61.unr.ph = phi i8* [ %55, %.prol.preheader ], [ %.0310.us.us54, %.preheader.us.us51 ]
  %.056.us.us63.unr.ph = phi i32 [ %54, %.prol.preheader ], [ 0, %.preheader.us.us51 ]
  %.lcssa69.unr.ph = phi i32 [ %54, %.prol.preheader ], [ undef, %.preheader.us.us51 ]
  br i1 %44, label %._crit_edge.us.us56, label %.preheader.us.us51.new.preheader

.preheader.us.us51.new.preheader:                 ; preds = %.prol.loopexit
  br label %.preheader.us.us51.new

._crit_edge.us.us56.loopexit:                     ; preds = %.preheader.us.us51.new
  br label %._crit_edge.us.us56

._crit_edge.us.us56:                              ; preds = %._crit_edge.us.us56.loopexit, %.prol.loopexit
  %.lcssa69 = phi i32 [ %.lcssa69.unr.ph, %.prol.loopexit ], [ %76, %._crit_edge.us.us56.loopexit ]
  %scevgep = getelementptr i8, i8* %.0310.us.us54, i64 %42
  %56 = trunc i32 %.lcssa69 to i8
  store i8 %56, i8* %.0211.us.us53, align 1
  %57 = getelementptr inbounds i8, i8* %.0211.us.us53, i64 1
  %58 = add i32 %.012.us.us52, -1
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %._crit_edge13.us-lcssa.us.us65, label %.preheader.us.us51

.preheader.us.us51.new:                           ; preds = %.preheader.us.us51.new.preheader, %.preheader.us.us51.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us51.new ], [ %indvars.iv.unr.ph, %.preheader.us.us51.new.preheader ]
  %.18.us.us61 = phi i8* [ %77, %.preheader.us.us51.new ], [ %.18.us.us61.unr.ph, %.preheader.us.us51.new.preheader ]
  %.056.us.us63 = phi i32 [ %76, %.preheader.us.us51.new ], [ %.056.us.us63.unr.ph, %.preheader.us.us51.new.preheader ]
  %60 = getelementptr inbounds i8*, i8** %9, i64 %indvars.iv
  %61 = load i8*, i8** %60, align 8
  %62 = load i8, i8* %.18.us.us61, align 1
  %63 = zext i8 %62 to i64
  %64 = getelementptr inbounds i8, i8* %61, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = add nsw i32 %66, %.056.us.us63
  %68 = getelementptr inbounds i8, i8* %.18.us.us61, i64 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %69 = getelementptr inbounds i8*, i8** %9, i64 %indvars.iv.next
  %70 = load i8*, i8** %69, align 8
  %71 = load i8, i8* %68, align 1
  %72 = zext i8 %71 to i64
  %73 = getelementptr inbounds i8, i8* %70, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = add nsw i32 %75, %67
  %77 = getelementptr inbounds i8, i8* %.18.us.us61, i64 2
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us56.loopexit, label %.preheader.us.us51.new

._crit_edge13.us-lcssa.us.us65:                   ; preds = %._crit_edge.us.us56
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.lr.ph16.split.split.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge13.us-lcssa.us.us65
  br label %._crit_edge17

._crit_edge17.loopexit82.unr-lcssa:               ; preds = %._crit_edge13.3
  br label %._crit_edge17.loopexit82

._crit_edge17.loopexit82:                         ; preds = %._crit_edge13.3.prol.loopexit, %._crit_edge17.loopexit82.unr-lcssa
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit82, %._crit_edge17.loopexit, %.lr.ph16.split.split.prol.loopexit, %4
  ret void

._crit_edge13.3:                                  ; preds = %._crit_edge13.3, %._crit_edge13.3.preheader.new
  %indvars.iv73 = phi i64 [ %indvars.iv73.unr86, %._crit_edge13.3.preheader.new ], [ %indvars.iv.next74.3.1, %._crit_edge13.3 ]
  %78 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv73
  %79 = load i8*, i8** %78, align 8
  call void @llvm.memset.p0i8.i64(i8* %79, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %80 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74
  %81 = load i8*, i8** %80, align 8
  call void @llvm.memset.p0i8.i64(i8* %81, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv73, 2
  %82 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.1
  %83 = load i8*, i8** %82, align 8
  call void @llvm.memset.p0i8.i64(i8* %83, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.2 = add nsw i64 %indvars.iv73, 3
  %84 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.2
  %85 = load i8*, i8** %84, align 8
  call void @llvm.memset.p0i8.i64(i8* %85, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.3 = add nsw i64 %indvars.iv73, 4
  %86 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.3
  %87 = load i8*, i8** %86, align 8
  call void @llvm.memset.p0i8.i64(i8* %87, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.187 = add nsw i64 %indvars.iv73, 5
  %88 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.187
  %89 = load i8*, i8** %88, align 8
  call void @llvm.memset.p0i8.i64(i8* %89, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.1.1 = add nsw i64 %indvars.iv73, 6
  %90 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.1.1
  %91 = load i8*, i8** %90, align 8
  call void @llvm.memset.p0i8.i64(i8* %91, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.2.1 = add nsw i64 %indvars.iv73, 7
  %92 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv.next74.2.1
  %93 = load i8*, i8** %92, align 8
  call void @llvm.memset.p0i8.i64(i8* %93, i8 0, i64 %19, i32 1, i1 false)
  %indvars.iv.next74.3.1 = add nsw i64 %indvars.iv73, 8
  %exitcond76.3.1 = icmp eq i64 %indvars.iv.next74.3.1, %wide.trip.count75.3
  br i1 %exitcond76.3.1, label %._crit_edge17.loopexit82.unr-lcssa, label %._crit_edge13.3
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
  %17 = icmp sgt i32 %3, 0
  br i1 %17, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %4
  %18 = icmp eq i32 %16, 0
  br i1 %18, label %.lr.ph11.split.us.preheader, label %.lr.ph11.split.preheader

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  %wide.trip.count = zext i32 %3 to i64
  %sunkaddr50 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 76
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i32*
  %sunkaddr53 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr54 = add i64 %sunkaddr53, 80
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to [16 x i32]**
  %sunkaddr56 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr57 = add i64 %sunkaddr56, 88
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to [16 x i32]**
  %sunkaddr59 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr60 = add i64 %sunkaddr59, 96
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to [16 x i32]**
  %sunkaddr62 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr63 = add i64 %sunkaddr62, 76
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i32*
  br label %.lr.ph11.split

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  %19 = add i32 %3, -1
  %xtraiter = and i32 %3, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph11.split.us.prol.loopexit, label %.lr.ph11.split.us.prol.preheader

.lr.ph11.split.us.prol.preheader:                 ; preds = %.lr.ph11.split.us.preheader
  %sunkaddr = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr16 = add i64 %sunkaddr, 76
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %sunkaddr17.promoted = load i32, i32* %sunkaddr17, align 4
  br label %.lr.ph11.split.us.prol

.lr.ph11.split.us.prol:                           ; preds = %.lr.ph11.split.us.prol, %.lr.ph11.split.us.prol.preheader
  %20 = phi i32 [ %22, %.lr.ph11.split.us.prol ], [ %sunkaddr17.promoted, %.lr.ph11.split.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph11.split.us.prol ], [ %xtraiter, %.lr.ph11.split.us.prol.preheader ]
  %21 = add nsw i32 %20, 1
  %22 = and i32 %21, 15
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph11.split.us.prol.loopexit.loopexit, label %.lr.ph11.split.us.prol, !llvm.loop !4

.lr.ph11.split.us.prol.loopexit.loopexit:         ; preds = %.lr.ph11.split.us.prol
  %sunkaddr47 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 76
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32*
  store i32 %22, i32* %sunkaddr49, align 4
  br label %.lr.ph11.split.us.prol.loopexit

.lr.ph11.split.us.prol.loopexit:                  ; preds = %.lr.ph11.split.us.preheader, %.lr.ph11.split.us.prol.loopexit.loopexit
  %.019.us.unr = phi i32 [ %xtraiter, %.lr.ph11.split.us.prol.loopexit.loopexit ], [ 0, %.lr.ph11.split.us.preheader ]
  %23 = icmp ult i32 %19, 3
  br i1 %23, label %._crit_edge12, label %.lr.ph11.split.us.preheader14

.lr.ph11.split.us.preheader14:                    ; preds = %.lr.ph11.split.us.prol.loopexit
  %sunkaddr18 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 76
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  %sunkaddr20.promoted = load i32, i32* %sunkaddr20, align 4
  %24 = add i32 %3, -4
  %25 = sub i32 %24, %.019.us.unr
  %26 = lshr i32 %25, 2
  %27 = add nuw nsw i32 %26, 1
  %xtraiter74 = and i32 %27, 7
  %lcmp.mod75 = icmp eq i32 %xtraiter74, 0
  br i1 %lcmp.mod75, label %.lr.ph11.split.us.prol.loopexit73, label %.lr.ph11.split.us.prol.preheader72

.lr.ph11.split.us.prol.preheader72:               ; preds = %.lr.ph11.split.us.preheader14
  br label %.lr.ph11.split.us.prol76

.lr.ph11.split.us.prol76:                         ; preds = %.lr.ph11.split.us.prol76, %.lr.ph11.split.us.prol.preheader72
  %28 = phi i32 [ %30, %.lr.ph11.split.us.prol76 ], [ %sunkaddr20.promoted, %.lr.ph11.split.us.prol.preheader72 ]
  %.019.us.prol = phi i32 [ %31, %.lr.ph11.split.us.prol76 ], [ %.019.us.unr, %.lr.ph11.split.us.prol.preheader72 ]
  %prol.iter77 = phi i32 [ %prol.iter77.sub, %.lr.ph11.split.us.prol76 ], [ %xtraiter74, %.lr.ph11.split.us.prol.preheader72 ]
  %29 = add i32 %28, 4
  %30 = and i32 %29, 15
  %31 = add nsw i32 %.019.us.prol, 4
  %prol.iter77.sub = add i32 %prol.iter77, -1
  %prol.iter77.cmp = icmp eq i32 %prol.iter77.sub, 0
  br i1 %prol.iter77.cmp, label %.lr.ph11.split.us.prol.loopexit73.unr-lcssa, label %.lr.ph11.split.us.prol76, !llvm.loop !5

.lr.ph11.split.us.prol.loopexit73.unr-lcssa:      ; preds = %.lr.ph11.split.us.prol76
  br label %.lr.ph11.split.us.prol.loopexit73

.lr.ph11.split.us.prol.loopexit73:                ; preds = %.lr.ph11.split.us.preheader14, %.lr.ph11.split.us.prol.loopexit73.unr-lcssa
  %.lcssa.unr = phi i32 [ undef, %.lr.ph11.split.us.preheader14 ], [ %30, %.lr.ph11.split.us.prol.loopexit73.unr-lcssa ]
  %.unr = phi i32 [ %sunkaddr20.promoted, %.lr.ph11.split.us.preheader14 ], [ %30, %.lr.ph11.split.us.prol.loopexit73.unr-lcssa ]
  %.019.us.unr78 = phi i32 [ %.019.us.unr, %.lr.ph11.split.us.preheader14 ], [ %31, %.lr.ph11.split.us.prol.loopexit73.unr-lcssa ]
  %32 = icmp ult i32 %25, 28
  br i1 %32, label %._crit_edge12.loopexit, label %.lr.ph11.split.us.preheader14.new

.lr.ph11.split.us.preheader14.new:                ; preds = %.lr.ph11.split.us.prol.loopexit73
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us, %.lr.ph11.split.us.preheader14.new
  %33 = phi i32 [ %.unr, %.lr.ph11.split.us.preheader14.new ], [ %34, %.lr.ph11.split.us ]
  %.019.us = phi i32 [ %.019.us.unr78, %.lr.ph11.split.us.preheader14.new ], [ %35, %.lr.ph11.split.us ]
  %34 = and i32 %33, 15
  %35 = add nsw i32 %.019.us, 32
  %exitcond.3.7 = icmp eq i32 %35, %3
  br i1 %exitcond.3.7, label %._crit_edge12.loopexit.unr-lcssa, label %.lr.ph11.split.us

.lr.ph11.split:                                   ; preds = %._crit_edge, %.lr.ph11.split.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph11.split.preheader ]
  %36 = load i32, i32* %sunkaddr52, align 4
  %37 = getelementptr inbounds i8*, i8** %1, i64 %indvars.iv
  %38 = load i8*, i8** %37, align 8
  %39 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv
  %40 = load i8*, i8** %39, align 8
  %41 = load [16 x i32]*, [16 x i32]** %sunkaddr55, align 8
  %42 = sext i32 %36 to i64
  %43 = load [16 x i32]*, [16 x i32]** %sunkaddr58, align 8
  %44 = load [16 x i32]*, [16 x i32]** %sunkaddr61, align 8
  br label %45

; <label>:45:                                     ; preds = %45, %.lr.ph11.split
  %.08 = phi i32 [ %16, %.lr.ph11.split ], [ %73, %45 ]
  %.027 = phi i32 [ 0, %.lr.ph11.split ], [ %70, %45 ]
  %.036 = phi i8* [ %40, %.lr.ph11.split ], [ %71, %45 ]
  %.045 = phi i8* [ %38, %.lr.ph11.split ], [ %72, %45 ]
  %46 = getelementptr inbounds i8, i8* %.045, i64 1
  %47 = load i8, i8* %.045, align 1
  %promoted33 = zext i8 %47 to i64
  %48 = zext i32 %.027 to i64
  %49 = getelementptr inbounds [16 x i32], [16 x i32]* %41, i64 %42, i64 %48
  %50 = load i32, i32* %49, align 4
  %promoted = sext i32 %50 to i64
  %51 = add nsw i64 %promoted33, %promoted
  %52 = getelementptr inbounds i8, i8* %10, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = getelementptr inbounds i8, i8* %.045, i64 2
  %55 = load i8, i8* %46, align 1
  %promoted35 = zext i8 %55 to i64
  %56 = getelementptr inbounds [16 x i32], [16 x i32]* %43, i64 %42, i64 %48
  %57 = load i32, i32* %56, align 4
  %promoted34 = sext i32 %57 to i64
  %58 = add nsw i64 %promoted35, %promoted34
  %59 = getelementptr inbounds i8, i8* %12, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = add i8 %60, %53
  %62 = load i8, i8* %54, align 1
  %promoted37 = zext i8 %62 to i64
  %63 = getelementptr inbounds [16 x i32], [16 x i32]* %44, i64 %42, i64 %48
  %64 = load i32, i32* %63, align 4
  %promoted36 = sext i32 %64 to i64
  %65 = add nsw i64 %promoted37, %promoted36
  %66 = getelementptr inbounds i8, i8* %14, i64 %65
  %67 = load i8, i8* %66, align 1
  %68 = add i8 %61, %67
  store i8 %68, i8* %.036, align 1
  %69 = add nuw nsw i32 %.027, 1
  %70 = and i32 %69, 15
  %71 = getelementptr inbounds i8, i8* %.036, i64 1
  %72 = getelementptr inbounds i8, i8* %.045, i64 3
  %73 = add i32 %.08, -1
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %._crit_edge, label %45

._crit_edge:                                      ; preds = %45
  %75 = add nsw i32 %36, 1
  %76 = and i32 %75, 15
  store i32 %76, i32* %sunkaddr64, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge12.loopexit70, label %.lr.ph11.split

._crit_edge12.loopexit.unr-lcssa:                 ; preds = %.lr.ph11.split.us
  br label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %.lr.ph11.split.us.prol.loopexit73, %._crit_edge12.loopexit.unr-lcssa
  %.lcssa = phi i32 [ %.lcssa.unr, %.lr.ph11.split.us.prol.loopexit73 ], [ %34, %._crit_edge12.loopexit.unr-lcssa ]
  %sunkaddr65 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr66 = add i64 %sunkaddr65, 76
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to i32*
  store i32 %.lcssa, i32* %sunkaddr67, align 4
  br label %._crit_edge12

._crit_edge12.loopexit70:                         ; preds = %._crit_edge
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit70, %.lr.ph11.split.us.prol.loopexit, %4, %._crit_edge12.loopexit
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @quantize_ord_dither(%struct.jpeg_decompress_struct* nocapture readonly, i8** nocapture readonly, i8** nocapture readonly, i32) #0 {
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %6 = bitcast %struct.jpeg_color_quantizer** %5 to %struct.my_cquantizer**
  %7 = load %struct.my_cquantizer*, %struct.my_cquantizer** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %9 = load i32, i32* %8, align 8
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %12 = load i32, i32* %11, align 8
  %13 = zext i32 %12 to i64
  %14 = icmp sgt i32 %3, 0
  br i1 %14, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %4
  %15 = icmp sgt i32 %9, 0
  %wide.trip.count32 = zext i32 %3 to i64
  br i1 %15, label %.lr.ph16.split.us.preheader, label %.lr.ph16.split.preheader

.lr.ph16.split.preheader:                         ; preds = %.lr.ph16
  %sunkaddr80 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr81 = add i64 %sunkaddr80, 76
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to i32*
  br label %.lr.ph16.split

.lr.ph16.split.us.preheader:                      ; preds = %.lr.ph16
  %xtraiter = and i32 %12, 1
  %wide.trip.count = zext i32 %9 to i64
  %16 = add i32 %12, -1
  %17 = icmp eq i32 %12, 0
  %sunkaddr64 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr65 = add i64 %sunkaddr64, 76
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i32*
  %sunkaddr77 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr78 = add i64 %sunkaddr77, 76
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i32*
  %18 = icmp eq i32 %xtraiter, 0
  %sunkaddr = ptrtoint i8** %1 to i64
  %sunkaddr70 = ptrtoint i8** %2 to i64
  %sunkaddr74 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 48
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i8***
  %19 = icmp eq i32 %12, 1
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge13.us, %.lr.ph16.split.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge13.us ], [ 0, %.lr.ph16.split.us.preheader ]
  %20 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv30
  %21 = load i8*, i8** %20, align 8
  tail call void @jzero_far(i8* %21, i64 %13) #5
  %22 = load i32, i32* %sunkaddr66, align 4
  %23 = sext i32 %22 to i64
  br i1 %17, label %._crit_edge13.us, label %.lr.ph.us19.preheader

.lr.ph.us19.preheader:                            ; preds = %.lr.ph16.split.us
  %sunkaddr67 = shl i64 %indvars.iv30, 3
  %sunkaddr68 = add i64 %sunkaddr, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i8**
  %sunkaddr71 = shl i64 %indvars.iv30, 3
  %sunkaddr72 = add i64 %sunkaddr70, %sunkaddr71
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to i8**
  br label %.lr.ph.us19

.lr.ph.us19:                                      ; preds = %.lr.ph.us19.preheader, %._crit_edge.us24
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us24 ], [ 0, %.lr.ph.us19.preheader ]
  %24 = load i8*, i8** %sunkaddr69, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv
  %26 = load i8*, i8** %sunkaddr73, align 8
  %27 = load i8**, i8*** %sunkaddr76, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 %indvars.iv
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 7, i64 %indvars.iv
  %31 = load [16 x i32]*, [16 x i32]** %30, align 8
  br i1 %18, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us19
  %32 = load i8, i8* %25, align 1
  %promoted52 = zext i8 %32 to i64
  %33 = getelementptr inbounds [16 x i32], [16 x i32]* %31, i64 %23, i64 0
  %34 = load i32, i32* %33, align 4
  %promoted = sext i32 %34 to i64
  %35 = add nsw i64 %promoted52, %promoted
  %36 = getelementptr inbounds i8, i8* %29, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = load i8, i8* %26, align 1
  %39 = add i8 %38, %37
  store i8 %39, i8* %26, align 1
  %40 = getelementptr inbounds i8, i8* %26, i64 1
  %41 = getelementptr inbounds i8, i8* %25, i64 %10
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us19, %.prol.preheader
  %.09.us20.unr.ph = phi i32 [ %16, %.prol.preheader ], [ %12, %.lr.ph.us19 ]
  %.038.us21.unr.ph = phi i32 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us19 ]
  %.047.us22.unr.ph = phi i8* [ %41, %.prol.preheader ], [ %25, %.lr.ph.us19 ]
  %.056.us23.unr.ph = phi i8* [ %40, %.prol.preheader ], [ %26, %.lr.ph.us19 ]
  br i1 %19, label %._crit_edge.us24, label %.lr.ph.us19.new.preheader

.lr.ph.us19.new.preheader:                        ; preds = %.prol.loopexit
  br label %.lr.ph.us19.new

.lr.ph.us19.new:                                  ; preds = %.lr.ph.us19.new.preheader, %.lr.ph.us19.new
  %.09.us20 = phi i32 [ %68, %.lr.ph.us19.new ], [ %.09.us20.unr.ph, %.lr.ph.us19.new.preheader ]
  %.038.us21 = phi i32 [ %65, %.lr.ph.us19.new ], [ %.038.us21.unr.ph, %.lr.ph.us19.new.preheader ]
  %.047.us22 = phi i8* [ %67, %.lr.ph.us19.new ], [ %.047.us22.unr.ph, %.lr.ph.us19.new.preheader ]
  %.056.us23 = phi i8* [ %66, %.lr.ph.us19.new ], [ %.056.us23.unr.ph, %.lr.ph.us19.new.preheader ]
  %42 = load i8, i8* %.047.us22, align 1
  %promoted54 = zext i8 %42 to i64
  %43 = zext i32 %.038.us21 to i64
  %44 = getelementptr inbounds [16 x i32], [16 x i32]* %31, i64 %23, i64 %43
  %45 = load i32, i32* %44, align 4
  %promoted53 = sext i32 %45 to i64
  %46 = add nsw i64 %promoted54, %promoted53
  %47 = getelementptr inbounds i8, i8* %29, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = load i8, i8* %.056.us23, align 1
  %50 = add i8 %49, %48
  store i8 %50, i8* %.056.us23, align 1
  %51 = add nuw nsw i32 %.038.us21, 1
  %52 = and i32 %51, 15
  %53 = getelementptr inbounds i8, i8* %.056.us23, i64 1
  %54 = getelementptr inbounds i8, i8* %.047.us22, i64 %10
  %55 = load i8, i8* %54, align 1
  %promoted56 = zext i8 %55 to i64
  %56 = zext i32 %52 to i64
  %57 = getelementptr inbounds [16 x i32], [16 x i32]* %31, i64 %23, i64 %56
  %58 = load i32, i32* %57, align 4
  %promoted55 = sext i32 %58 to i64
  %59 = add nsw i64 %promoted56, %promoted55
  %60 = getelementptr inbounds i8, i8* %29, i64 %59
  %61 = load i8, i8* %60, align 1
  %62 = load i8, i8* %53, align 1
  %63 = add i8 %62, %61
  store i8 %63, i8* %53, align 1
  %64 = add nsw i32 %.038.us21, 2
  %65 = and i32 %64, 15
  %66 = getelementptr inbounds i8, i8* %.056.us23, i64 2
  %67 = getelementptr inbounds i8, i8* %54, i64 %10
  %68 = add i32 %.09.us20, -2
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %._crit_edge.us24.loopexit, label %.lr.ph.us19.new

._crit_edge.us24.loopexit:                        ; preds = %.lr.ph.us19.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge13.us.loopexit, label %.lr.ph.us19

._crit_edge13.us.loopexit:                        ; preds = %._crit_edge.us24
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.lr.ph16.split.us
  %70 = add nsw i32 %22, 1
  %71 = and i32 %70, 15
  store i32 %71, i32* %sunkaddr79, align 4
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %._crit_edge17.loopexit, label %.lr.ph16.split.us

.lr.ph16.split:                                   ; preds = %.lr.ph16.split.preheader, %.lr.ph16.split
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %.lr.ph16.split ], [ 0, %.lr.ph16.split.preheader ]
  %72 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv34
  %73 = load i8*, i8** %72, align 8
  tail call void @jzero_far(i8* %73, i64 %13) #5
  %74 = load i32, i32* %sunkaddr82, align 4
  %75 = add nsw i32 %74, 1
  %76 = and i32 %75, 15
  store i32 %76, i32* %sunkaddr82, align 4
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count32
  br i1 %exitcond37, label %._crit_edge17.loopexit84, label %.lr.ph16.split

._crit_edge17.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge17

._crit_edge17.loopexit84:                         ; preds = %.lr.ph16.split
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit84, %._crit_edge17.loopexit, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @create_odither_tables(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %3 = bitcast %struct.jpeg_color_quantizer** %2 to %struct.my_cquantizer**
  %4 = load %struct.my_cquantizer*, %struct.my_cquantizer** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph5.preheader, label %._crit_edge

.lr.ph5.preheader:                                ; preds = %1
  %8 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 0
  %sunkaddr17 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 136
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph5.preheader, %22
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %22 ], [ 0, %.lr.ph5.preheader ]
  %9 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv7
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i64 %indvars.iv7, 0
  br i1 %11, label %.lr.ph5..lr.ph_crit_edge, label %.thread

.lr.ph5..lr.ph_crit_edge:                         ; preds = %.lr.ph5
  %12 = load i32, i32* %8, align 4
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %.loopexit, label %.lr.ph16.preheader

.lr.ph16.preheader:                               ; preds = %.lr.ph5..lr.ph_crit_edge
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16.preheader, %.lr.ph
  %indvars.iv.next15 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 1, %.lr.ph16.preheader ]
  %14 = icmp slt i64 %indvars.iv.next15, %indvars.iv7
  br i1 %14, label %.lr.ph, label %.thread.loopexit

.lr.ph:                                           ; preds = %.lr.ph16
  %15 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 5, i64 %indvars.iv.next15
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %10, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv.next15, 1
  br i1 %17, label %.loopexit.loopexit, label %.lr.ph16

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph5..lr.ph_crit_edge
  %indvars.iv.lcssa = phi i64 [ 0, %.lr.ph5..lr.ph_crit_edge ], [ %indvars.iv.next15, %.loopexit.loopexit ]
  %18 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 7, i64 %indvars.iv.lcssa
  %19 = load [16 x i32]*, [16 x i32]** %18, align 8
  %20 = icmp eq [16 x i32]* %19, null
  br i1 %20, label %.thread, label %22

.thread.loopexit:                                 ; preds = %.lr.ph16
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %.loopexit, %.lr.ph5
  %21 = tail call fastcc [16 x i32]* @make_odither_array(%struct.jpeg_decompress_struct* %0, i32 %10)
  br label %22

; <label>:22:                                     ; preds = %.loopexit, %.thread
  %.1 = phi [16 x i32]* [ %21, %.thread ], [ %19, %.loopexit ]
  %23 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %4, i64 0, i32 7, i64 %indvars.iv7
  store [16 x i32]* %.1, [16 x i32]** %23, align 8
  %indvars.iv.next8 = add nuw i64 %indvars.iv7, 1
  %24 = load i32, i32* %sunkaddr19, align 8
  %25 = sext i32 %24 to i64
  %26 = icmp slt i64 %indvars.iv.next8, %25
  br i1 %26, label %.lr.ph5, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %22
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
  %wide.trip.count35.1 = zext i32 %9 to i64
  %wide.trip.count = zext i32 %9 to i64
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %11 = load i32, i32* %10, align 8
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 61
  %14 = load i8*, i8** %13, align 8
  %15 = icmp sgt i32 %3, 0
  br i1 %15, label %.lr.ph27, label %._crit_edge28

.lr.ph27:                                         ; preds = %4
  %16 = add i32 %11, -1
  %17 = mul i32 %16, %9
  %18 = zext i32 %17 to i64
  %19 = zext i32 %16 to i64
  %20 = sub nsw i32 0, %9
  %21 = add i32 %11, 1
  %22 = zext i32 %21 to i64
  %23 = shl nuw nsw i64 %19, 1
  %24 = add nuw nsw i64 %23, 2
  %xtraiter = and i32 %9, 1
  %wide.trip.count40 = zext i32 %3 to i64
  %25 = icmp sgt i32 %9, 0
  %26 = icmp eq i32 %11, 0
  %27 = icmp eq i32 %xtraiter, 0
  %28 = icmp eq i32 %9, 1
  %sunkaddr97 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr98 = add i64 %sunkaddr97, 144
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  %sunkaddr100 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 144
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to i32*
  %sunkaddr128 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr89 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr90 = add i64 %sunkaddr89, 144
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to i32*
  %sunkaddr94 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr95 = add i64 %sunkaddr94, 112
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i16**
  %sunkaddr103 = ptrtoint i8** %1 to i64
  %sunkaddr107 = ptrtoint i8** %2 to i64
  %sunkaddr111 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr112 = add i64 %sunkaddr111, 144
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to i32*
  %sunkaddr114 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr115 = add i64 %sunkaddr114, 48
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to i8***
  %sunkaddr117 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr118 = add i64 %sunkaddr117, 32
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to i8***
  %sunkaddr120 = ptrtoint %struct.my_cquantizer* %7 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 144
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to i32*
  br label %29

; <label>:29:                                     ; preds = %._crit_edge24, %.lr.ph27
  %indvars.iv38 = phi i64 [ 0, %.lr.ph27 ], [ %indvars.iv.next39, %._crit_edge24 ]
  %30 = getelementptr inbounds i8*, i8** %2, i64 %indvars.iv38
  %31 = load i8*, i8** %30, align 8
  tail call void @jzero_far(i8* %31, i64 %12) #5
  br i1 %25, label %.lr.ph23, label %._crit_edge24

.lr.ph23:                                         ; preds = %29
  br i1 %26, label %.lr.ph23.split.us.preheader, label %.lr.ph23.split.preheader

.lr.ph23.split.preheader:                         ; preds = %.lr.ph23
  %sunkaddr104 = shl i64 %indvars.iv38, 3
  %sunkaddr105 = add i64 %sunkaddr103, %sunkaddr104
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to i8**
  %sunkaddr108 = shl i64 %indvars.iv38, 3
  %sunkaddr109 = add i64 %sunkaddr107, %sunkaddr108
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to i8**
  br label %.lr.ph23.split

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph23
  br i1 %27, label %.lr.ph23.split.us.prol.loopexit, label %.lr.ph23.split.us.prol

.lr.ph23.split.us.prol:                           ; preds = %.lr.ph23.split.us.preheader
  %32 = load i32, i32* %sunkaddr91, align 8
  %33 = icmp eq i32 %32, 0
  %34 = load i16*, i16** %sunkaddr96, align 8
  %35 = getelementptr inbounds i16, i16* %34, i64 %22
  %.011.us.prol = select i1 %33, i16* %34, i16* %35
  store i16 0, i16* %.011.us.prol, align 2
  br label %.lr.ph23.split.us.prol.loopexit

.lr.ph23.split.us.prol.loopexit:                  ; preds = %.lr.ph23.split.us.preheader, %.lr.ph23.split.us.prol
  %indvars.iv33.unr.ph = phi i64 [ 1, %.lr.ph23.split.us.prol ], [ 0, %.lr.ph23.split.us.preheader ]
  br i1 %28, label %._crit_edge24, label %.lr.ph23.split.us.preheader134

.lr.ph23.split.us.preheader134:                   ; preds = %.lr.ph23.split.us.prol.loopexit
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader134, %.lr.ph23.split.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.lr.ph23.split.us ], [ %indvars.iv33.unr.ph, %.lr.ph23.split.us.preheader134 ]
  %36 = load i32, i32* %sunkaddr99, align 8
  %37 = icmp eq i32 %36, 0
  %38 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 %indvars.iv33
  %39 = load i16*, i16** %38, align 8
  %40 = getelementptr inbounds i16, i16* %39, i64 %22
  %.011.us = select i1 %37, i16* %39, i16* %40
  store i16 0, i16* %.011.us, align 2
  %41 = load i32, i32* %sunkaddr102, align 8
  %42 = icmp eq i32 %41, 0
  %sunkaddr129 = shl i64 %indvars.iv33, 3
  %sunkaddr130 = add i64 %sunkaddr128, %sunkaddr129
  %sunkaddr131 = add i64 %sunkaddr130, 120
  %sunkaddr132 = inttoptr i64 %sunkaddr131 to i16**
  %43 = load i16*, i16** %sunkaddr132, align 8
  %44 = getelementptr inbounds i16, i16* %43, i64 %22
  %.011.us.1 = select i1 %42, i16* %43, i16* %44
  store i16 0, i16* %.011.us.1, align 2
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next34.1, %wide.trip.count35.1
  br i1 %exitcond36.1, label %._crit_edge24.loopexit, label %.lr.ph23.split.us

.lr.ph23.split:                                   ; preds = %.lr.ph23.split.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph23.split.preheader ]
  %45 = load i8*, i8** %sunkaddr106, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 %indvars.iv
  %47 = load i8*, i8** %sunkaddr110, align 8
  %48 = load i32, i32* %sunkaddr113, align 8
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %56, label %50

; <label>:50:                                     ; preds = %.lr.ph23.split
  %51 = getelementptr inbounds i8, i8* %46, i64 %18
  %52 = getelementptr inbounds i8, i8* %47, i64 %19
  %53 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 %indvars.iv
  %54 = load i16*, i16** %53, align 8
  %55 = getelementptr inbounds i16, i16* %54, i64 %22
  br label %.lr.ph

; <label>:56:                                     ; preds = %.lr.ph23.split
  %57 = getelementptr inbounds %struct.my_cquantizer, %struct.my_cquantizer* %7, i64 0, i32 8, i64 %indvars.iv
  %58 = load i16*, i16** %57, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %56, %50
  %.011 = phi i16* [ %55, %50 ], [ %58, %56 ]
  %.09 = phi i8* [ %51, %50 ], [ %46, %56 ]
  %.08 = phi i8* [ %52, %50 ], [ %47, %56 ]
  %.04 = phi i64 [ -1, %50 ], [ 1, %56 ]
  %.03 = phi i32 [ %20, %50 ], [ %9, %56 ]
  %59 = load i8**, i8*** %sunkaddr116, align 8
  %60 = getelementptr inbounds i8*, i8** %59, i64 %indvars.iv
  %61 = load i8*, i8** %60, align 8
  %62 = load i8**, i8*** %sunkaddr119, align 8
  %63 = getelementptr inbounds i8*, i8** %62, i64 %indvars.iv
  %64 = load i8*, i8** %63, align 8
  %65 = sext i32 %.03 to i64
  br label %66

; <label>:66:                                     ; preds = %66, %.lr.ph
  %.019 = phi i32 [ %11, %.lr.ph ], [ %97, %66 ]
  %.0518 = phi i32 [ 0, %.lr.ph ], [ %95, %66 ]
  %.0617 = phi i32 [ 0, %.lr.ph ], [ %88, %66 ]
  %.0716 = phi i32 [ 0, %.lr.ph ], [ %96, %66 ]
  %.115 = phi i8* [ %.08, %.lr.ph ], [ %92, %66 ]
  %.11014 = phi i8* [ %.09, %.lr.ph ], [ %93, %66 ]
  %.11213 = phi i16* [ %.011, %.lr.ph ], [ %67, %66 ]
  %67 = getelementptr inbounds i16, i16* %.11213, i64 %.04
  %68 = load i16, i16* %67, align 2
  %69 = sext i16 %68 to i32
  %70 = add i32 %.0518, 8
  %71 = add i32 %70, %69
  %72 = ashr i32 %71, 4
  %73 = load i8, i8* %.11014, align 1
  %promoted69 = zext i8 %73 to i64
  %74 = sext i32 %72 to i64
  %75 = add nsw i64 %74, %promoted69
  %76 = getelementptr inbounds i8, i8* %14, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = zext i8 %77 to i64
  %80 = getelementptr inbounds i8, i8* %61, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = load i8, i8* %.115, align 1
  %83 = add i8 %82, %81
  store i8 %83, i8* %.115, align 1
  %84 = zext i8 %81 to i64
  %85 = getelementptr inbounds i8, i8* %64, i64 %84
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = sub nsw i32 %78, %87
  %89 = mul nsw i32 %88, 3
  %90 = add nsw i32 %89, %.0716
  %91 = trunc i32 %90 to i16
  store i16 %91, i16* %.11213, align 2
  %92 = getelementptr inbounds i8, i8* %.115, i64 %.04
  %93 = getelementptr inbounds i8, i8* %.11014, i64 %65
  %94 = mul nsw i32 %88, 5
  %95 = mul nsw i32 %88, 7
  %96 = add nsw i32 %94, %.0617
  %97 = add i32 %.019, -1
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %._crit_edge, label %66

._crit_edge:                                      ; preds = %66
  %99 = mul nsw i64 %24, %.04
  %100 = trunc i32 %96 to i16
  %sunkaddr70 = ptrtoint i16* %.011 to i64
  %sunkaddr71 = add i64 %sunkaddr70, %99
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i16*
  store i16 %100, i16* %sunkaddr72, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge24.loopexit135, label %.lr.ph23.split

._crit_edge24.loopexit:                           ; preds = %.lr.ph23.split.us
  br label %._crit_edge24

._crit_edge24.loopexit135:                        ; preds = %._crit_edge
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit135, %._crit_edge24.loopexit, %.lr.ph23.split.us.prol.loopexit, %29
  %101 = load i32, i32* %sunkaddr122, align 8
  %not. = icmp eq i32 %101, 0
  %102 = zext i1 %not. to i32
  store i32 %102, i32* %sunkaddr122, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %._crit_edge28.loopexit, label %29

._crit_edge28.loopexit:                           ; preds = %._crit_edge24
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %4
  ret void
}

declare void @jzero_far(i8*, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc [16 x i32]* @make_odither_array(%struct.jpeg_decompress_struct*, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 1024) #5
  %9 = add nsw i32 %1, -1
  %10 = sext i32 %9 to i64
  %11 = shl nsw i64 %10, 9
  %12 = bitcast i8* %8 to [16 x i32]*
  br label %.preheader

.preheader:                                       ; preds = %29, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %29 ]
  br label %13

; <label>:13:                                     ; preds = %25, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %25 ]
  %14 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @base_dither_matrix, i64 0, i64 %indvars.iv4, i64 %indvars.iv
  %15 = load i8, i8* %14, align 1
  %promoted7 = zext i8 %15 to i64
  %16 = shl nuw nsw i64 %promoted7, 1
  %17 = sub nsw i64 255, %16
  %promoted = trunc i64 %17 to i32
  %mulconv = mul nsw i64 %17, 255
  %18 = icmp slt i32 %promoted, 0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %13
  %20 = sub nsw i64 0, %mulconv
  %21 = sdiv i64 %20, %11
  %22 = sub nsw i64 0, %21
  br label %25

; <label>:23:                                     ; preds = %13
  %24 = sdiv i64 %mulconv, %11
  br label %25

; <label>:25:                                     ; preds = %23, %19
  %26 = phi i64 [ %22, %19 ], [ %24, %23 ]
  %27 = trunc i64 %26 to i32
  %28 = getelementptr inbounds [16 x i32], [16 x i32]* %12, i64 %indvars.iv4, i64 %indvars.iv
  store i32 %27, i32* %28, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond, label %29, label %13

; <label>:29:                                     ; preds = %25
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 16
  br i1 %exitcond6, label %30, label %.preheader

; <label>:30:                                     ; preds = %29
  %31 = bitcast i8* %8 to [16 x i32]*
  ret [16 x i32]* %31
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @select_ncolors(%struct.jpeg_decompress_struct*, i32* nocapture) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %4 = load i32, i32* %3, align 8
  %wide.trip.count.7 = zext i32 %4 to i64
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 22
  %7 = load i32, i32* %6, align 8
  %8 = sext i32 %7 to i64
  %9 = icmp sgt i32 %4, 1
  br i1 %9, label %.split.us.preheader, label %.split.preheader

.split.preheader:                                 ; preds = %2
  %10 = sext i32 %7 to i64
  %11 = icmp sgt i64 %8, 1
  %smax = select i1 %11, i64 %8, i64 1
  br label %.split

.split.us.preheader:                              ; preds = %2
  %12 = add i32 %4, 7
  %13 = add i32 %4, -2
  %xtraiter33 = and i32 %12, 7
  %14 = add nuw nsw i32 %xtraiter33, 1
  %15 = add i32 %4, -8
  %16 = icmp eq i32 %xtraiter33, 0
  %17 = icmp ult i32 %13, 7
  br label %.split.us

.split.us:                                        ; preds = %._crit_edge23.us, %.split.us.preheader
  %indvars.iv38 = phi i64 [ 1, %.split.us.preheader ], [ %indvars.iv.next39, %._crit_edge23.us ]
  %indvars.iv.next39 = add nuw i64 %indvars.iv38, 1
  br i1 %16, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.split.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %.020.us.prol = phi i64 [ %18, %.prol.preheader ], [ %indvars.iv.next39, %.prol.preheader.preheader ]
  %prol.iter36 = phi i32 [ %prol.iter36.sub, %.prol.preheader ], [ %xtraiter33, %.prol.preheader.preheader ]
  %18 = mul nsw i64 %.020.us.prol, %indvars.iv.next39
  %prol.iter36.sub = add nsw i32 %prol.iter36, -1
  %prol.iter36.cmp = icmp eq i32 %prol.iter36.sub, 0
  br i1 %prol.iter36.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !6

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.split.us
  %.020.us.unr = phi i64 [ %indvars.iv.next39, %.split.us ], [ %18, %.prol.loopexit.loopexit ]
  %.0219.us.unr = phi i32 [ 1, %.split.us ], [ %14, %.prol.loopexit.loopexit ]
  %.lcssa28.unr = phi i64 [ undef, %.split.us ], [ %18, %.prol.loopexit.loopexit ]
  br i1 %17, label %._crit_edge23.us, label %.split.us.new.preheader

.split.us.new.preheader:                          ; preds = %.prol.loopexit
  %19 = sub i32 %15, %.0219.us.unr
  %20 = lshr i32 %19, 3
  %21 = and i32 %20, 1
  %lcmp.mod84 = icmp eq i32 %21, 0
  br i1 %lcmp.mod84, label %.split.us.new.prol.preheader, label %.split.us.new.prol.loopexit.unr-lcssa

.split.us.new.prol.preheader:                     ; preds = %.split.us.new.preheader
  br label %.split.us.new.prol

.split.us.new.prol:                               ; preds = %.split.us.new.prol.preheader
  %22 = mul nsw i64 %.020.us.unr, %indvars.iv.next39
  %23 = mul nsw i64 %22, %indvars.iv.next39
  %24 = mul nsw i64 %23, %indvars.iv.next39
  %25 = mul nsw i64 %24, %indvars.iv.next39
  %26 = mul nsw i64 %25, %indvars.iv.next39
  %27 = mul nsw i64 %26, %indvars.iv.next39
  %28 = mul nsw i64 %27, %indvars.iv.next39
  %29 = mul nsw i64 %28, %indvars.iv.next39
  %30 = add nsw i32 %.0219.us.unr, 8
  br label %.split.us.new.prol.loopexit.unr-lcssa

.split.us.new.prol.loopexit.unr-lcssa:            ; preds = %.split.us.new.preheader, %.split.us.new.prol
  %.lcssa82.unr.ph = phi i64 [ %29, %.split.us.new.prol ], [ undef, %.split.us.new.preheader ]
  %.020.us.unr86.ph = phi i64 [ %29, %.split.us.new.prol ], [ %.020.us.unr, %.split.us.new.preheader ]
  %.0219.us.unr87.ph = phi i32 [ %30, %.split.us.new.prol ], [ %.0219.us.unr, %.split.us.new.preheader ]
  br label %.split.us.new.prol.loopexit

.split.us.new.prol.loopexit:                      ; preds = %.split.us.new.prol.loopexit.unr-lcssa
  %31 = icmp eq i32 %20, 0
  br i1 %31, label %._crit_edge23.us.loopexit, label %.split.us.new.preheader.new

.split.us.new.preheader.new:                      ; preds = %.split.us.new.prol.loopexit
  br label %.split.us.new

.split.us.new:                                    ; preds = %.split.us.new, %.split.us.new.preheader.new
  %.020.us = phi i64 [ %.020.us.unr86.ph, %.split.us.new.preheader.new ], [ %47, %.split.us.new ]
  %.0219.us = phi i32 [ %.0219.us.unr87.ph, %.split.us.new.preheader.new ], [ %48, %.split.us.new ]
  %32 = mul nsw i64 %.020.us, %indvars.iv.next39
  %33 = mul nsw i64 %32, %indvars.iv.next39
  %34 = mul nsw i64 %33, %indvars.iv.next39
  %35 = mul nsw i64 %34, %indvars.iv.next39
  %36 = mul nsw i64 %35, %indvars.iv.next39
  %37 = mul nsw i64 %36, %indvars.iv.next39
  %38 = mul nsw i64 %37, %indvars.iv.next39
  %39 = mul nsw i64 %38, %indvars.iv.next39
  %40 = mul nsw i64 %39, %indvars.iv.next39
  %41 = mul nsw i64 %40, %indvars.iv.next39
  %42 = mul nsw i64 %41, %indvars.iv.next39
  %43 = mul nsw i64 %42, %indvars.iv.next39
  %44 = mul nsw i64 %43, %indvars.iv.next39
  %45 = mul nsw i64 %44, %indvars.iv.next39
  %46 = mul nsw i64 %45, %indvars.iv.next39
  %47 = mul nsw i64 %46, %indvars.iv.next39
  %48 = add nsw i32 %.0219.us, 16
  %exitcond.737.1 = icmp eq i32 %48, %4
  br i1 %exitcond.737.1, label %._crit_edge23.us.loopexit.unr-lcssa, label %.split.us.new

._crit_edge23.us.loopexit.unr-lcssa:              ; preds = %.split.us.new
  br label %._crit_edge23.us.loopexit

._crit_edge23.us.loopexit:                        ; preds = %.split.us.new.prol.loopexit, %._crit_edge23.us.loopexit.unr-lcssa
  %.lcssa82 = phi i64 [ %.lcssa82.unr.ph, %.split.us.new.prol.loopexit ], [ %47, %._crit_edge23.us.loopexit.unr-lcssa ]
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %._crit_edge23.us.loopexit, %.prol.loopexit
  %.lcssa28 = phi i64 [ %.lcssa28.unr, %.prol.loopexit ], [ %.lcssa82, %._crit_edge23.us.loopexit ]
  %49 = icmp sgt i64 %.lcssa28, %8
  br i1 %49, label %.us-lcssa25.us.loopexit, label %.split.us

.split:                                           ; preds = %.split, %.split.preheader
  %indvars.iv40 = phi i64 [ 1, %.split.preheader ], [ %indvars.iv.next41, %.split ]
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %50 = icmp slt i64 %indvars.iv40, %10
  br i1 %50, label %.split, label %.split..us-lcssa25.us_crit_edge

.split..us-lcssa25.us_crit_edge:                  ; preds = %.split
  %51 = add nuw nsw i64 %smax, 1
  br label %.us-lcssa25.us

.us-lcssa25.us.loopexit:                          ; preds = %._crit_edge23.us
  br label %.us-lcssa25.us

.us-lcssa25.us:                                   ; preds = %.us-lcssa25.us.loopexit, %.split..us-lcssa25.us_crit_edge
  %.03.lcssa.in = phi i64 [ %smax, %.split..us-lcssa25.us_crit_edge ], [ %indvars.iv38, %.us-lcssa25.us.loopexit ]
  %.0.lcssa.lcssa = phi i64 [ %51, %.split..us-lcssa25.us_crit_edge ], [ %.lcssa28, %.us-lcssa25.us.loopexit ]
  %.03.lcssa = trunc i64 %.03.lcssa.in to i32
  %52 = icmp slt i32 %.03.lcssa, 2
  br i1 %52, label %53, label %.preheader7

; <label>:53:                                     ; preds = %.us-lcssa25.us
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 5
  store i32 55, i32* %56, align 8
  %57 = trunc i64 %.0.lcssa.lcssa to i32
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 6, i32 0, i64 0
  store i32 %57, i32* %59, align 4
  %60 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %61 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %60, align 8
  %62 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %61, align 8
  %63 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %62(%struct.jpeg_common_struct* %63) #5
  br label %.preheader7

.preheader7:                                      ; preds = %.us-lcssa25.us, %53
  %64 = icmp sgt i32 %4, 0
  br i1 %64, label %.lr.ph17.preheader, label %.us-lcssa.us

.lr.ph17.preheader:                               ; preds = %.preheader7
  %65 = add i32 %4, -1
  %xtraiter = and i32 %4, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph17.prol.loopexit, label %.lr.ph17.preheader..lr.ph17.prol_crit_edge

.lr.ph17.preheader..lr.ph17.prol_crit_edge:       ; preds = %.lr.ph17.preheader
  %66 = add nsw i32 %xtraiter, -1
  %67 = zext i32 %66 to i64
  br label %.lr.ph17.prol

.lr.ph17.prol:                                    ; preds = %.lr.ph17.prol, %.lr.ph17.preheader..lr.ph17.prol_crit_edge
  %indvars.iv31.prol = phi i64 [ %indvars.iv.next32.prol, %.lr.ph17.prol ], [ 0, %.lr.ph17.preheader..lr.ph17.prol_crit_edge ]
  %.0415.prol = phi i32 [ %69, %.lr.ph17.prol ], [ 1, %.lr.ph17.preheader..lr.ph17.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph17.prol ], [ %xtraiter, %.lr.ph17.preheader..lr.ph17.prol_crit_edge ]
  %68 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv31.prol
  store i32 %.03.lcssa, i32* %68, align 4
  %69 = mul nsw i32 %.0415.prol, %.03.lcssa
  %indvars.iv.next32.prol = add nuw nsw i64 %indvars.iv31.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph17.prol..lr.ph17.prol.loopexit_crit_edge, label %.lr.ph17.prol, !llvm.loop !7

.lr.ph17.prol..lr.ph17.prol.loopexit_crit_edge:   ; preds = %.lr.ph17.prol
  %70 = add nuw nsw i64 %67, 1
  br label %.lr.ph17.prol.loopexit

.lr.ph17.prol.loopexit:                           ; preds = %.lr.ph17.preheader, %.lr.ph17.prol..lr.ph17.prol.loopexit_crit_edge
  %indvars.iv31.unr = phi i64 [ %70, %.lr.ph17.prol..lr.ph17.prol.loopexit_crit_edge ], [ 0, %.lr.ph17.preheader ]
  %.0415.unr = phi i32 [ %69, %.lr.ph17.prol..lr.ph17.prol.loopexit_crit_edge ], [ 1, %.lr.ph17.preheader ]
  %.lcssa.unr = phi i32 [ %69, %.lr.ph17.prol..lr.ph17.prol.loopexit_crit_edge ], [ undef, %.lr.ph17.preheader ]
  %71 = icmp ult i32 %65, 7
  br i1 %71, label %.preheader.split.us.preheader, label %.lr.ph17.preheader76

.lr.ph17.preheader76:                             ; preds = %.lr.ph17.prol.loopexit
  br label %.lr.ph17

.preheader:                                       ; preds = %.lr.ph17
  %72 = icmp sgt i32 %4, 0
  br i1 %72, label %.preheader.split.us.preheader, label %.us-lcssa.us

.preheader.split.us.preheader:                    ; preds = %.preheader, %.lr.ph17.prol.loopexit
  %.15.us.ph = phi i32 [ %111, %.preheader ], [ %.lcssa.unr, %.lr.ph17.prol.loopexit ]
  %sunkaddr67 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr68 = add i64 %sunkaddr67, 56
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i32*
  %73 = ptrtoint i32* %1 to i64
  br label %.preheader.split.us

.preheader.split.us.loopexit:                     ; preds = %92
  br label %.preheader.split.us.backedge

.preheader.split.us:                              ; preds = %.preheader.split.us.backedge, %.preheader.split.us.preheader
  %.15.us = phi i32 [ %.15.us.ph, %.preheader.split.us.preheader ], [ %.15.us.be, %.preheader.split.us.backedge ]
  br label %74

; <label>:74:                                     ; preds = %92, %.preheader.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %92 ], [ 0, %.preheader.split.us ]
  %.0110.us = phi i32 [ 1, %92 ], [ 0, %.preheader.split.us ]
  %.268.us = phi i32 [ %93, %92 ], [ %.15.us, %.preheader.split.us ]
  %75 = load i32, i32* %sunkaddr69, align 8
  %76 = icmp eq i32 %75, 2
  %77 = trunc i64 %indvars.iv to i32
  br i1 %76, label %78, label %81

; <label>:78:                                     ; preds = %74
  %79 = getelementptr inbounds [3 x i32], [3 x i32]* @select_ncolors.RGB_order, i64 0, i64 %indvars.iv
  %80 = load i32, i32* %79, align 4
  br label %81

; <label>:81:                                     ; preds = %74, %78
  %82 = phi i32 [ %80, %78 ], [ %77, %74 ]
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32* %1, i64 %83
  %85 = load i32, i32* %84, align 4
  %86 = sext i32 %85 to i64
  %87 = sdiv i32 %.268.us, %85
  %88 = sext i32 %87 to i64
  %89 = add nsw i64 %86, 1
  %90 = mul nsw i64 %88, %89
  %91 = icmp sgt i64 %90, %8
  br i1 %91, label %._crit_edge.us, label %92

; <label>:92:                                     ; preds = %81
  %promoted = trunc i64 %89 to i32
  %sunkaddr50 = shl nsw i64 %83, 2
  %sunkaddr51 = add i64 %73, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i32*
  store i32 %promoted, i32* %sunkaddr52, align 4
  %93 = trunc i64 %90 to i32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %94 = icmp slt i64 %indvars.iv.next, %5
  br i1 %94, label %74, label %.preheader.split.us.loopexit

._crit_edge.us:                                   ; preds = %81
  %95 = icmp eq i32 %.0110.us, 0
  br i1 %95, label %.us-lcssa.us.loopexit, label %.preheader.split.us.backedge

.preheader.split.us.backedge:                     ; preds = %._crit_edge.us, %.preheader.split.us.loopexit
  %.15.us.be = phi i32 [ %.268.us, %._crit_edge.us ], [ %93, %.preheader.split.us.loopexit ]
  br label %.preheader.split.us

.lr.ph17:                                         ; preds = %.lr.ph17.preheader76, %.lr.ph17
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.7, %.lr.ph17 ], [ %indvars.iv31.unr, %.lr.ph17.preheader76 ]
  %.0415 = phi i32 [ %111, %.lr.ph17 ], [ %.0415.unr, %.lr.ph17.preheader76 ]
  %96 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv31
  store i32 %.03.lcssa, i32* %96, align 4
  %97 = mul nsw i32 %.0415, %.03.lcssa
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %98 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next32
  store i32 %.03.lcssa, i32* %98, align 4
  %99 = mul nsw i32 %97, %.03.lcssa
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %100 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next32.1
  store i32 %.03.lcssa, i32* %100, align 4
  %101 = mul nsw i32 %99, %.03.lcssa
  %indvars.iv.next32.2 = add nsw i64 %indvars.iv31, 3
  %102 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next32.2
  store i32 %.03.lcssa, i32* %102, align 4
  %103 = mul nsw i32 %101, %.03.lcssa
  %indvars.iv.next32.3 = add nsw i64 %indvars.iv31, 4
  %104 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next32.3
  store i32 %.03.lcssa, i32* %104, align 4
  %105 = mul nsw i32 %103, %.03.lcssa
  %indvars.iv.next32.4 = add nsw i64 %indvars.iv31, 5
  %106 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next32.4
  store i32 %.03.lcssa, i32* %106, align 4
  %107 = mul nsw i32 %105, %.03.lcssa
  %indvars.iv.next32.5 = add nsw i64 %indvars.iv31, 6
  %108 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next32.5
  store i32 %.03.lcssa, i32* %108, align 4
  %109 = mul nsw i32 %107, %.03.lcssa
  %indvars.iv.next32.6 = add nsw i64 %indvars.iv31, 7
  %110 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next32.6
  store i32 %.03.lcssa, i32* %110, align 4
  %111 = mul nsw i32 %109, %.03.lcssa
  %indvars.iv.next32.7 = add nsw i64 %indvars.iv31, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next32.7, %wide.trip.count.7
  br i1 %exitcond.7, label %.preheader, label %.lr.ph17

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit, %.preheader, %.preheader7
  %.26.lcssa.lcssa = phi i32 [ 1, %.preheader7 ], [ %111, %.preheader ], [ %.268.us, %.us-lcssa.us.loopexit ]
  ret i32 %.26.lcssa.lcssa
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal fastcc i32 @output_value(i32, i32) unnamed_addr #1 {
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
define internal fastcc i32 @largest_input_value(i32, i32) unnamed_addr #1 {
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
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
