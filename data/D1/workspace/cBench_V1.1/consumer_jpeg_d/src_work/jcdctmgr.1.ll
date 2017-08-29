; ModuleID = 'jcdctmgr.ll'
source_filename = "jcdctmgr.c"
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
%struct.jpeg_destination_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_compress_struct*)*, {}* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { {}*, {}*, {}*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, {}*, {}*, {}*, {}*, {}* }
%struct.jpeg_color_converter = type { {}*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { {}*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { {}*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, {}* }
%struct.my_fdct_controller = type { %struct.jpeg_forward_dct, void (i32*)*, [4 x i32*], void (float*)*, [4 x float*] }

@start_pass_fdctmgr.aanscales = internal constant [64 x i16] [i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 22725, i16 31521, i16 29692, i16 26722, i16 22725, i16 17855, i16 12299, i16 6270, i16 21407, i16 29692, i16 27969, i16 25172, i16 21407, i16 16819, i16 11585, i16 5906, i16 19266, i16 26722, i16 25172, i16 22654, i16 19266, i16 15137, i16 10426, i16 5315, i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 12873, i16 17855, i16 16819, i16 15137, i16 12873, i16 10114, i16 6967, i16 3552, i16 8867, i16 12299, i16 11585, i16 10426, i16 8867, i16 6967, i16 4799, i16 2446, i16 4520, i16 6270, i16 5906, i16 5315, i16 4520, i16 3552, i16 2446, i16 1247], align 16
@start_pass_fdctmgr.aanscalefactor = internal constant [8 x double] [double 1.000000e+00, double 0x3FF63150B14861EF, double 0x3FF4E7AE914D6FCA, double 0x3FF2D062EF6C11AA, double 1.000000e+00, double 0x3FE92469C0A7BF3B, double 5.411961e-01, double 0x3FD1A855DE72AB5D], align 16

; Function Attrs: noinline nounwind uwtable
define void @jinit_forward_dct(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 96) #2
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 58
  %9 = bitcast %struct.jpeg_forward_dct** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @start_pass_fdctmgr, void (%struct.jpeg_compress_struct*)** %10, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 28
  %12 = load i32, i32* %11, align 4
  switch i32 %12, label %28 [
    i32 0, label %13
    i32 1, label %18
    i32 2, label %23
  ]

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds i8, i8* %7, i64 8
  %15 = bitcast i8* %14 to void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)**
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* @forward_DCT, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %15, align 8
  %16 = getelementptr inbounds i8, i8* %7, i64 16
  %17 = bitcast i8* %16 to void (i32*)**
  store void (i32*)* @jpeg_fdct_islow, void (i32*)** %17, align 8
  br label %.preheader

; <label>:18:                                     ; preds = %1
  %19 = getelementptr inbounds i8, i8* %7, i64 8
  %20 = bitcast i8* %19 to void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)**
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* @forward_DCT, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %20, align 8
  %21 = getelementptr inbounds i8, i8* %7, i64 16
  %22 = bitcast i8* %21 to void (i32*)**
  store void (i32*)* @jpeg_fdct_ifast, void (i32*)** %22, align 8
  br label %.preheader

; <label>:23:                                     ; preds = %1
  %24 = getelementptr inbounds i8, i8* %7, i64 8
  %25 = bitcast i8* %24 to void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)**
  store void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* @forward_DCT_float, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %25, align 8
  %26 = getelementptr inbounds i8, i8* %7, i64 56
  %27 = bitcast i8* %26 to void (float*)**
  store void (float*)* @jpeg_fdct_float, void (float*)** %27, align 8
  br label %.preheader

; <label>:28:                                     ; preds = %1
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i64 0, i32 5
  store i32 47, i32* %31, align 8
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 0
  %34 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %33, align 8
  tail call void %34(%struct.jpeg_common_struct* %6) #2
  br label %.preheader

.preheader:                                       ; preds = %13, %18, %23, %28
  %35 = getelementptr inbounds i8, i8* %7, i64 64
  %36 = getelementptr inbounds i8, i8* %7, i64 24
  %37 = bitcast i8* %36 to i32**
  store i32* null, i32** %37, align 8
  %38 = bitcast i8* %35 to float**
  store float* null, float** %38, align 8
  %39 = getelementptr inbounds i8, i8* %7, i64 32
  %40 = bitcast i8* %39 to i32**
  store i32* null, i32** %40, align 8
  %41 = getelementptr inbounds i8, i8* %7, i64 72
  %42 = bitcast i8* %41 to float**
  store float* null, float** %42, align 8
  %43 = getelementptr inbounds i8, i8* %7, i64 40
  %44 = bitcast i8* %43 to i32**
  store i32* null, i32** %44, align 8
  %45 = getelementptr inbounds i8, i8* %7, i64 80
  %46 = bitcast i8* %45 to float**
  store float* null, float** %46, align 8
  %47 = getelementptr inbounds i8, i8* %7, i64 48
  %48 = bitcast i8* %47 to i32**
  store i32* null, i32** %48, align 8
  %49 = getelementptr inbounds i8, i8* %7, i64 88
  %50 = bitcast i8* %49 to float**
  store float* null, float** %50, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_fdctmgr(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 58
  %3 = bitcast %struct.jpeg_forward_dct** %2 to %struct.my_fdct_controller**
  %4 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %6 = load i32, i32* %5, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %9 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %11 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 28
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %20 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  br label %21

; <label>:21:                                     ; preds = %.lr.ph, %.loopexit
  %.0227 = phi i32 [ 0, %.lr.ph ], [ %255, %.loopexit ]
  %.0426 = phi %struct.jpeg_component_info* [ %9, %.lr.ph ], [ %256, %.loopexit ]
  %22 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0426, i64 0, i32 4
  %23 = load i32, i32* %22, align 8
  %24 = icmp ugt i32 %23, 3
  br i1 %24, label %30, label %25

; <label>:25:                                     ; preds = %21
  %26 = sext i32 %23 to i64
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 %26
  %28 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %27, align 8
  %29 = icmp eq %struct.JQUANT_TBL* %28, null
  br i1 %29, label %30, label %38

; <label>:30:                                     ; preds = %25, %21
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i64 0, i32 5
  store i32 51, i32* %32, align 8
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 6, i32 0, i64 0
  store i32 %23, i32* %34, align 4
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 0
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  tail call void %37(%struct.jpeg_common_struct* %11) #2
  br label %38

; <label>:38:                                     ; preds = %30, %25
  %39 = sext i32 %23 to i64
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 %39
  %41 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %40, align 8
  %42 = load i32, i32* %12, align 4
  switch i32 %42, label %249 [
    i32 0, label %43
    i32 1, label %129
    i32 2, label %164
  ]

; <label>:43:                                     ; preds = %38
  %44 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %4, i64 0, i32 2, i64 %39
  %45 = load i32*, i32** %44, align 8
  %46 = icmp eq i32* %45, null
  br i1 %46, label %47, label %min.iters.checked

; <label>:47:                                     ; preds = %43
  %48 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %15, align 8
  %49 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %48, i64 0, i32 0
  %50 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %49, align 8
  %51 = tail call i8* %50(%struct.jpeg_common_struct* nonnull %16, i32 1, i64 256) #2
  %52 = bitcast i32** %44 to i8**
  store i8* %51, i8** %52, align 8
  br label %min.iters.checked

min.iters.checked:                                ; preds = %47, %43
  %53 = load i32*, i32** %44, align 8
  %scevgep = getelementptr i32, i32* %53, i64 64
  %scevgep35 = getelementptr %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 1
  %bound0 = icmp ult i32* %53, %scevgep35
  %54 = bitcast i32* %scevgep to %struct.JQUANT_TBL*
  %bound1 = icmp ult %struct.JQUANT_TBL* %41, %54
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

scalar.ph.preheader:                              ; preds = %min.iters.checked
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader
  %55 = bitcast %struct.JQUANT_TBL* %41 to <16 x i16>*
  %wide.vec = load <16 x i16>, <16 x i16>* %55, align 2, !alias.scope !1
  %strided.vec = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec37 = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec38 = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec39 = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %56 = zext <4 x i16> %strided.vec to <4 x i32>
  %57 = shl nuw nsw <4 x i32> %56, <i32 3, i32 3, i32 3, i32 3>
  %58 = zext <4 x i16> %strided.vec37 to <4 x i32>
  %59 = shl nuw nsw <4 x i32> %58, <i32 3, i32 3, i32 3, i32 3>
  %60 = zext <4 x i16> %strided.vec38 to <4 x i32>
  %61 = shl nuw nsw <4 x i32> %60, <i32 3, i32 3, i32 3, i32 3>
  %62 = zext <4 x i16> %strided.vec39 to <4 x i32>
  %63 = shl nuw nsw <4 x i32> %62, <i32 3, i32 3, i32 3, i32 3>
  %64 = bitcast i32* %53 to <16 x i32>*
  %65 = shufflevector <4 x i32> %57, <4 x i32> %59, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %66 = shufflevector <4 x i32> %61, <4 x i32> %63, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec = shufflevector <8 x i32> %65, <8 x i32> %66, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec, <16 x i32>* %64, align 4, !alias.scope !4, !noalias !1
  %67 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 16
  %68 = bitcast i16* %67 to <16 x i16>*
  %wide.vec.1 = load <16 x i16>, <16 x i16>* %68, align 2, !alias.scope !1
  %strided.vec.1 = shufflevector <16 x i16> %wide.vec.1, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec37.1 = shufflevector <16 x i16> %wide.vec.1, <16 x i16> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec38.1 = shufflevector <16 x i16> %wide.vec.1, <16 x i16> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec39.1 = shufflevector <16 x i16> %wide.vec.1, <16 x i16> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %69 = zext <4 x i16> %strided.vec.1 to <4 x i32>
  %70 = shl nuw nsw <4 x i32> %69, <i32 3, i32 3, i32 3, i32 3>
  %71 = zext <4 x i16> %strided.vec37.1 to <4 x i32>
  %72 = shl nuw nsw <4 x i32> %71, <i32 3, i32 3, i32 3, i32 3>
  %73 = zext <4 x i16> %strided.vec38.1 to <4 x i32>
  %74 = shl nuw nsw <4 x i32> %73, <i32 3, i32 3, i32 3, i32 3>
  %75 = zext <4 x i16> %strided.vec39.1 to <4 x i32>
  %76 = shl nuw nsw <4 x i32> %75, <i32 3, i32 3, i32 3, i32 3>
  %77 = getelementptr i32, i32* %53, i64 16
  %78 = bitcast i32* %77 to <16 x i32>*
  %79 = shufflevector <4 x i32> %70, <4 x i32> %72, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %80 = shufflevector <4 x i32> %74, <4 x i32> %76, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec.1 = shufflevector <8 x i32> %79, <8 x i32> %80, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec.1, <16 x i32>* %78, align 4, !alias.scope !4, !noalias !1
  %81 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 32
  %82 = bitcast i16* %81 to <16 x i16>*
  %wide.vec.2 = load <16 x i16>, <16 x i16>* %82, align 2, !alias.scope !1
  %strided.vec.2 = shufflevector <16 x i16> %wide.vec.2, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec37.2 = shufflevector <16 x i16> %wide.vec.2, <16 x i16> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec38.2 = shufflevector <16 x i16> %wide.vec.2, <16 x i16> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec39.2 = shufflevector <16 x i16> %wide.vec.2, <16 x i16> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %83 = zext <4 x i16> %strided.vec.2 to <4 x i32>
  %84 = shl nuw nsw <4 x i32> %83, <i32 3, i32 3, i32 3, i32 3>
  %85 = zext <4 x i16> %strided.vec37.2 to <4 x i32>
  %86 = shl nuw nsw <4 x i32> %85, <i32 3, i32 3, i32 3, i32 3>
  %87 = zext <4 x i16> %strided.vec38.2 to <4 x i32>
  %88 = shl nuw nsw <4 x i32> %87, <i32 3, i32 3, i32 3, i32 3>
  %89 = zext <4 x i16> %strided.vec39.2 to <4 x i32>
  %90 = shl nuw nsw <4 x i32> %89, <i32 3, i32 3, i32 3, i32 3>
  %91 = getelementptr i32, i32* %53, i64 32
  %92 = bitcast i32* %91 to <16 x i32>*
  %93 = shufflevector <4 x i32> %84, <4 x i32> %86, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %94 = shufflevector <4 x i32> %88, <4 x i32> %90, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec.2 = shufflevector <8 x i32> %93, <8 x i32> %94, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec.2, <16 x i32>* %92, align 4, !alias.scope !4, !noalias !1
  %95 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 48
  %96 = bitcast i16* %95 to <16 x i16>*
  %wide.vec.3 = load <16 x i16>, <16 x i16>* %96, align 2, !alias.scope !1
  %strided.vec.3 = shufflevector <16 x i16> %wide.vec.3, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec37.3 = shufflevector <16 x i16> %wide.vec.3, <16 x i16> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec38.3 = shufflevector <16 x i16> %wide.vec.3, <16 x i16> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec39.3 = shufflevector <16 x i16> %wide.vec.3, <16 x i16> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %97 = zext <4 x i16> %strided.vec.3 to <4 x i32>
  %98 = shl nuw nsw <4 x i32> %97, <i32 3, i32 3, i32 3, i32 3>
  %99 = zext <4 x i16> %strided.vec37.3 to <4 x i32>
  %100 = shl nuw nsw <4 x i32> %99, <i32 3, i32 3, i32 3, i32 3>
  %101 = zext <4 x i16> %strided.vec38.3 to <4 x i32>
  %102 = shl nuw nsw <4 x i32> %101, <i32 3, i32 3, i32 3, i32 3>
  %103 = zext <4 x i16> %strided.vec39.3 to <4 x i32>
  %104 = shl nuw nsw <4 x i32> %103, <i32 3, i32 3, i32 3, i32 3>
  %105 = getelementptr i32, i32* %53, i64 48
  %106 = bitcast i32* %105 to <16 x i32>*
  %107 = shufflevector <4 x i32> %98, <4 x i32> %100, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %108 = shufflevector <4 x i32> %102, <4 x i32> %104, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec.3 = shufflevector <8 x i32> %107, <8 x i32> %108, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec.3, <16 x i32>* %106, align 4, !alias.scope !4, !noalias !1
  br label %.loopexit

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1525 = phi i64 [ %indvars.iv.next16.3, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %109 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv1525
  %110 = load i16, i16* %109, align 2
  %111 = zext i16 %110 to i32
  %112 = shl nuw nsw i32 %111, 3
  %113 = getelementptr inbounds i32, i32* %53, i64 %indvars.iv1525
  store i32 %112, i32* %113, align 4
  %indvars.iv.next16 = or i64 %indvars.iv1525, 1
  %114 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next16
  %115 = load i16, i16* %114, align 2
  %116 = zext i16 %115 to i32
  %117 = shl nuw nsw i32 %116, 3
  %118 = getelementptr inbounds i32, i32* %53, i64 %indvars.iv.next16
  store i32 %117, i32* %118, align 4
  %indvars.iv.next16.1 = or i64 %indvars.iv1525, 2
  %119 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next16.1
  %120 = load i16, i16* %119, align 2
  %121 = zext i16 %120 to i32
  %122 = shl nuw nsw i32 %121, 3
  %123 = getelementptr inbounds i32, i32* %53, i64 %indvars.iv.next16.1
  store i32 %122, i32* %123, align 4
  %indvars.iv.next16.2 = or i64 %indvars.iv1525, 3
  %124 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next16.2
  %125 = load i16, i16* %124, align 2
  %126 = zext i16 %125 to i32
  %127 = shl nuw nsw i32 %126, 3
  %128 = getelementptr inbounds i32, i32* %53, i64 %indvars.iv.next16.2
  store i32 %127, i32* %128, align 4
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv1525, 4
  %exitcond17.3 = icmp eq i64 %indvars.iv.next16.3, 64
  br i1 %exitcond17.3, label %.loopexit.loopexit, label %scalar.ph, !llvm.loop !6

; <label>:129:                                    ; preds = %38
  %130 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %4, i64 0, i32 2, i64 %39
  %131 = load i32*, i32** %130, align 8
  %132 = icmp eq i32* %131, null
  br i1 %132, label %133, label %139

; <label>:133:                                    ; preds = %129
  %134 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %17, align 8
  %135 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %134, i64 0, i32 0
  %136 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %135, align 8
  %137 = tail call i8* %136(%struct.jpeg_common_struct* nonnull %18, i32 1, i64 256) #2
  %138 = bitcast i32** %130 to i8**
  store i8* %137, i8** %138, align 8
  br label %139

; <label>:139:                                    ; preds = %133, %129
  %140 = load i32*, i32** %130, align 8
  br label %141

; <label>:141:                                    ; preds = %141, %139
  %indvars.iv1224 = phi i64 [ 0, %139 ], [ %indvars.iv.next13.1, %141 ]
  %142 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv1224
  %143 = load i16, i16* %142, align 2
  %144 = zext i16 %143 to i64
  %145 = getelementptr inbounds [64 x i16], [64 x i16]* @start_pass_fdctmgr.aanscales, i64 0, i64 %indvars.iv1224
  %146 = load i16, i16* %145, align 4
  %147 = sext i16 %146 to i64
  %148 = mul nsw i64 %147, %144
  %149 = add nsw i64 %148, 1024
  %150 = lshr i64 %149, 11
  %151 = trunc i64 %150 to i32
  %152 = getelementptr inbounds i32, i32* %140, i64 %indvars.iv1224
  store i32 %151, i32* %152, align 4
  %indvars.iv.next13 = or i64 %indvars.iv1224, 1
  %153 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next13
  %154 = load i16, i16* %153, align 2
  %155 = zext i16 %154 to i64
  %156 = getelementptr inbounds [64 x i16], [64 x i16]* @start_pass_fdctmgr.aanscales, i64 0, i64 %indvars.iv.next13
  %157 = load i16, i16* %156, align 2
  %158 = sext i16 %157 to i64
  %159 = mul nsw i64 %158, %155
  %160 = add nsw i64 %159, 1024
  %161 = lshr i64 %160, 11
  %162 = trunc i64 %161 to i32
  %163 = getelementptr inbounds i32, i32* %140, i64 %indvars.iv.next13
  store i32 %162, i32* %163, align 4
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1224, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next13.1, 64
  br i1 %exitcond14.1, label %.loopexit.loopexit41, label %141

; <label>:164:                                    ; preds = %38
  %165 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %4, i64 0, i32 4, i64 %39
  %166 = load float*, float** %165, align 8
  %167 = icmp eq float* %166, null
  br i1 %167, label %168, label %174

; <label>:168:                                    ; preds = %164
  %169 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %19, align 8
  %170 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %169, i64 0, i32 0
  %171 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %170, align 8
  %172 = tail call i8* %171(%struct.jpeg_common_struct* nonnull %20, i32 1, i64 256) #2
  %173 = bitcast float** %165 to i8**
  store i8* %172, i8** %173, align 8
  br label %174

; <label>:174:                                    ; preds = %168, %164
  %175 = load float*, float** %165, align 8
  br label %176

; <label>:176:                                    ; preds = %176, %174
  %indvars.iv723 = phi i64 [ 0, %174 ], [ %indvars.iv.next8, %176 ]
  %indvars.iv922 = phi i64 [ 0, %174 ], [ %indvars.iv.next10, %176 ]
  %177 = getelementptr inbounds [8 x double], [8 x double]* @start_pass_fdctmgr.aanscalefactor, i64 0, i64 %indvars.iv922
  %178 = load double, double* %177, align 8
  %179 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv723
  %180 = load i16, i16* %179, align 2
  %181 = uitofp i16 %180 to double
  %182 = fmul double %181, %178
  %183 = fmul double %182, 8.000000e+00
  %184 = fdiv double 1.000000e+00, %183
  %185 = fptrunc double %184 to float
  %186 = getelementptr inbounds float, float* %175, i64 %indvars.iv723
  store float %185, float* %186, align 4
  %indvars.iv.next = or i64 %indvars.iv723, 1
  %187 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next
  %188 = load i16, i16* %187, align 2
  %189 = uitofp i16 %188 to double
  %190 = fmul double %189, %178
  %191 = fmul double %190, 0x3FF63150B14861EF
  %192 = fmul double %191, 8.000000e+00
  %193 = fdiv double 1.000000e+00, %192
  %194 = fptrunc double %193 to float
  %195 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next
  store float %194, float* %195, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1
  %196 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next.1
  %197 = load i16, i16* %196, align 2
  %198 = uitofp i16 %197 to double
  %199 = fmul double %198, %178
  %200 = fmul double %199, 0x3FF4E7AE914D6FCA
  %201 = fmul double %200, 8.000000e+00
  %202 = fdiv double 1.000000e+00, %201
  %203 = fptrunc double %202 to float
  %204 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next.1
  store float %203, float* %204, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv723, 3
  %205 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next.2
  %206 = load i16, i16* %205, align 2
  %207 = uitofp i16 %206 to double
  %208 = fmul double %207, %178
  %209 = fmul double %208, 0x3FF2D062EF6C11AA
  %210 = fmul double %209, 8.000000e+00
  %211 = fdiv double 1.000000e+00, %210
  %212 = fptrunc double %211 to float
  %213 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next.2
  store float %212, float* %213, align 4
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1
  %214 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next.3
  %215 = load i16, i16* %214, align 2
  %216 = uitofp i16 %215 to double
  %217 = fmul double %216, %178
  %218 = fmul double %217, 8.000000e+00
  %219 = fdiv double 1.000000e+00, %218
  %220 = fptrunc double %219 to float
  %221 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next.3
  store float %220, float* %221, align 4
  %indvars.iv.next.4 = add nsw i64 %indvars.iv.next.2, 2
  %222 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next.4
  %223 = load i16, i16* %222, align 2
  %224 = uitofp i16 %223 to double
  %225 = fmul double %224, %178
  %226 = fmul double %225, 0x3FE92469C0A7BF3B
  %227 = fmul double %226, 8.000000e+00
  %228 = fdiv double 1.000000e+00, %227
  %229 = fptrunc double %228 to float
  %230 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next.4
  store float %229, float* %230, align 4
  %indvars.iv.next.5 = add nsw i64 %indvars.iv.next.2, 3
  %231 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next.5
  %232 = load i16, i16* %231, align 2
  %233 = uitofp i16 %232 to double
  %234 = fmul double %233, %178
  %235 = fmul double %234, 5.411961e-01
  %236 = fmul double %235, 8.000000e+00
  %237 = fdiv double 1.000000e+00, %236
  %238 = fptrunc double %237 to float
  %239 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next.5
  store float %238, float* %239, align 4
  %indvars.iv.next.6 = or i64 %indvars.iv723, 7
  %240 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %41, i64 0, i32 0, i64 %indvars.iv.next.6
  %241 = load i16, i16* %240, align 2
  %242 = uitofp i16 %241 to double
  %243 = fmul double %242, %178
  %244 = fmul double %243, 0x3FD1A855DE72AB5D
  %245 = fmul double %244, 8.000000e+00
  %246 = fdiv double 1.000000e+00, %245
  %247 = fptrunc double %246 to float
  %248 = getelementptr inbounds float, float* %175, i64 %indvars.iv.next.6
  store float %247, float* %248, align 4
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv922, 1
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv723, 8
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 8
  br i1 %exitcond11, label %.loopexit.loopexit42, label %176

; <label>:249:                                    ; preds = %38
  %250 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %251 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %250, i64 0, i32 5
  store i32 47, i32* %251, align 8
  %252 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %253 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %252, i64 0, i32 0
  %254 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %253, align 8
  tail call void %254(%struct.jpeg_common_struct* nonnull %14) #2
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit.loopexit41:                             ; preds = %141
  br label %.loopexit

.loopexit.loopexit42:                             ; preds = %176
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit42, %.loopexit.loopexit41, %vector.body, %.loopexit.loopexit, %249
  %255 = add nuw nsw i32 %.0227, 1
  %256 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0426, i64 1
  %257 = load i32, i32* %5, align 4
  %258 = icmp slt i32 %255, %257
  br i1 %258, label %21, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @forward_DCT(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, [64 x i16]* nocapture, i32, i32, i32) #0 {
  %8 = alloca [64 x i32], align 16
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 58
  %10 = bitcast %struct.jpeg_forward_dct** %9 to %struct.my_fdct_controller**
  %11 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %10, align 8
  %12 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %11, i64 0, i32 1
  %13 = load void (i32*)*, void (i32*)** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 4
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %11, i64 0, i32 2, i64 %16
  %18 = load i32*, i32** %17, align 8
  %19 = zext i32 %4 to i64
  %20 = getelementptr inbounds i8*, i8** %2, i64 %19
  %wide.trip.count = zext i32 %6 to i64
  %exitcond1115 = icmp eq i32 %6, 0
  br i1 %exitcond1115, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %7
  %21 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 0, i64 0
  %scevgep21 = getelementptr i32, i32* %18, i64 64
  %scevgep23 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 1, i64 0
  %22 = bitcast i32* %scevgep21 to i16*
  %23 = bitcast i32* %scevgep23 to i16*
  br label %24

; <label>:24:                                     ; preds = %.lr.ph, %middle.block
  %.0417 = phi i32 [ %5, %.lr.ph ], [ %164, %middle.block ]
  %indvars.iv916 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next10, %middle.block ]
  %scevgep = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv916, i64 0
  %25 = add i64 %indvars.iv916, 1
  %scevgep19 = getelementptr [64 x i16], [64 x i16]* %3, i64 %25, i64 0
  %26 = zext i32 %.0417 to i64
  br label %27

; <label>:27:                                     ; preds = %24, %27
  %.0313 = phi i32* [ %21, %24 ], [ %69, %27 ]
  %indvars.iv12 = phi i64 [ 0, %24 ], [ %indvars.iv.next, %27 ]
  %28 = getelementptr inbounds i8*, i8** %20, i64 %indvars.iv12
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 %26
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  %32 = load i8, i8* %30, align 1
  %33 = zext i8 %32 to i32
  %34 = add nsw i32 %33, -128
  %35 = getelementptr inbounds i32, i32* %.0313, i64 1
  store i32 %34, i32* %.0313, align 4
  %36 = getelementptr inbounds i8, i8* %31, i64 1
  %37 = load i8, i8* %31, align 1
  %38 = zext i8 %37 to i32
  %39 = add nsw i32 %38, -128
  %40 = getelementptr inbounds i32, i32* %.0313, i64 2
  store i32 %39, i32* %35, align 4
  %41 = getelementptr inbounds i8, i8* %36, i64 1
  %42 = load i8, i8* %36, align 1
  %43 = zext i8 %42 to i32
  %44 = add nsw i32 %43, -128
  %45 = getelementptr inbounds i32, i32* %.0313, i64 3
  store i32 %44, i32* %40, align 4
  %46 = getelementptr inbounds i8, i8* %41, i64 1
  %47 = load i8, i8* %41, align 1
  %48 = zext i8 %47 to i32
  %49 = add nsw i32 %48, -128
  %50 = getelementptr inbounds i32, i32* %.0313, i64 4
  store i32 %49, i32* %45, align 4
  %51 = getelementptr inbounds i8, i8* %46, i64 1
  %52 = load i8, i8* %46, align 1
  %53 = zext i8 %52 to i32
  %54 = add nsw i32 %53, -128
  %55 = getelementptr inbounds i32, i32* %.0313, i64 5
  store i32 %54, i32* %50, align 4
  %56 = getelementptr inbounds i8, i8* %51, i64 1
  %57 = load i8, i8* %51, align 1
  %58 = zext i8 %57 to i32
  %59 = add nsw i32 %58, -128
  %60 = getelementptr inbounds i32, i32* %.0313, i64 6
  store i32 %59, i32* %55, align 4
  %61 = getelementptr inbounds i8, i8* %56, i64 1
  %62 = load i8, i8* %56, align 1
  %63 = zext i8 %62 to i32
  %64 = add nsw i32 %63, -128
  %65 = getelementptr inbounds i32, i32* %.0313, i64 7
  store i32 %64, i32* %60, align 4
  %66 = load i8, i8* %61, align 1
  %67 = zext i8 %66 to i32
  %68 = add nsw i32 %67, -128
  %69 = getelementptr inbounds i32, i32* %.0313, i64 8
  store i32 %68, i32* %65, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %min.iters.checked, label %27

min.iters.checked:                                ; preds = %27
  call void %13(i32* nonnull %21) #2
  %bound0 = icmp ult i16* %scevgep, %22
  %70 = bitcast i16* %scevgep19 to i32*
  %bound1 = icmp ult i32* %18, %70
  %found.conflict = and i1 %bound0, %bound1
  %bound025 = icmp ult i16* %scevgep, %23
  %71 = bitcast i16* %scevgep19 to [64 x i32]*
  %bound126 = icmp ult [64 x i32]* %8, %71
  %found.conflict27 = and i1 %bound025, %bound126
  %conflict.rdx = or i1 %found.conflict, %found.conflict27
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

scalar.ph.preheader:                              ; preds = %min.iters.checked
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %pred.sdiv.continue44
  %index = phi i64 [ %index.next, %pred.sdiv.continue44 ], [ 0, %vector.body.preheader ]
  %72 = getelementptr inbounds i32, i32* %18, i64 %index
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !9
  %74 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 0, i64 %index
  %75 = bitcast i32* %74 to <4 x i32>*
  %wide.load28 = load <4 x i32>, <4 x i32>* %75, align 16, !alias.scope !12
  %76 = icmp slt <4 x i32> %wide.load28, zeroinitializer
  %77 = ashr <4 x i32> %wide.load, <i32 1, i32 1, i32 1, i32 1>
  %78 = add nsw <4 x i32> %wide.load28, %77
  %79 = icmp slt <4 x i32> %78, %wide.load
  %80 = xor <4 x i1> %76, <i1 true, i1 true, i1 true, i1 true>
  %81 = xor <4 x i1> %79, <i1 true, i1 true, i1 true, i1 true>
  %82 = and <4 x i1> %81, %80
  %83 = extractelement <4 x i1> %82, i32 0
  br i1 %83, label %pred.sdiv.if, label %pred.sdiv.continue

pred.sdiv.if:                                     ; preds = %vector.body
  %84 = extractelement <4 x i32> %78, i32 0
  %85 = extractelement <4 x i32> %wide.load, i32 0
  %86 = sdiv i32 %84, %85
  %87 = insertelement <4 x i32> undef, i32 %86, i32 0
  br label %pred.sdiv.continue

pred.sdiv.continue:                               ; preds = %pred.sdiv.if, %vector.body
  %88 = phi <4 x i32> [ undef, %vector.body ], [ %87, %pred.sdiv.if ]
  %89 = extractelement <4 x i1> %82, i32 1
  br i1 %89, label %pred.sdiv.if31, label %pred.sdiv.continue32

pred.sdiv.if31:                                   ; preds = %pred.sdiv.continue
  %90 = extractelement <4 x i32> %78, i32 1
  %91 = extractelement <4 x i32> %wide.load, i32 1
  %92 = sdiv i32 %90, %91
  %93 = insertelement <4 x i32> %88, i32 %92, i32 1
  br label %pred.sdiv.continue32

pred.sdiv.continue32:                             ; preds = %pred.sdiv.if31, %pred.sdiv.continue
  %94 = phi <4 x i32> [ %88, %pred.sdiv.continue ], [ %93, %pred.sdiv.if31 ]
  %95 = extractelement <4 x i1> %82, i32 2
  br i1 %95, label %pred.sdiv.if33, label %pred.sdiv.continue34

pred.sdiv.if33:                                   ; preds = %pred.sdiv.continue32
  %96 = extractelement <4 x i32> %78, i32 2
  %97 = extractelement <4 x i32> %wide.load, i32 2
  %98 = sdiv i32 %96, %97
  %99 = insertelement <4 x i32> %94, i32 %98, i32 2
  br label %pred.sdiv.continue34

pred.sdiv.continue34:                             ; preds = %pred.sdiv.if33, %pred.sdiv.continue32
  %100 = phi <4 x i32> [ %94, %pred.sdiv.continue32 ], [ %99, %pred.sdiv.if33 ]
  %101 = extractelement <4 x i1> %82, i32 3
  br i1 %101, label %pred.sdiv.if35, label %pred.sdiv.continue36

pred.sdiv.if35:                                   ; preds = %pred.sdiv.continue34
  %102 = extractelement <4 x i32> %78, i32 3
  %103 = extractelement <4 x i32> %wide.load, i32 3
  %104 = sdiv i32 %102, %103
  %105 = insertelement <4 x i32> %100, i32 %104, i32 3
  br label %pred.sdiv.continue36

pred.sdiv.continue36:                             ; preds = %pred.sdiv.if35, %pred.sdiv.continue34
  %106 = phi <4 x i32> [ %100, %pred.sdiv.continue34 ], [ %105, %pred.sdiv.if35 ]
  %107 = sub <4 x i32> %77, %wide.load28
  %108 = icmp slt <4 x i32> %107, %wide.load
  %109 = xor <4 x i1> %108, <i1 true, i1 true, i1 true, i1 true>
  %110 = and <4 x i1> %76, %109
  %111 = extractelement <4 x i1> %110, i32 0
  br i1 %111, label %pred.sdiv.if37, label %pred.sdiv.continue38

pred.sdiv.if37:                                   ; preds = %pred.sdiv.continue36
  %112 = extractelement <4 x i32> %107, i32 0
  %113 = extractelement <4 x i32> %wide.load, i32 0
  %114 = sdiv i32 %112, %113
  %115 = insertelement <4 x i32> undef, i32 %114, i32 0
  br label %pred.sdiv.continue38

pred.sdiv.continue38:                             ; preds = %pred.sdiv.if37, %pred.sdiv.continue36
  %116 = phi <4 x i32> [ undef, %pred.sdiv.continue36 ], [ %115, %pred.sdiv.if37 ]
  %117 = extractelement <4 x i1> %110, i32 1
  br i1 %117, label %pred.sdiv.if39, label %pred.sdiv.continue40

pred.sdiv.if39:                                   ; preds = %pred.sdiv.continue38
  %118 = extractelement <4 x i32> %107, i32 1
  %119 = extractelement <4 x i32> %wide.load, i32 1
  %120 = sdiv i32 %118, %119
  %121 = insertelement <4 x i32> %116, i32 %120, i32 1
  br label %pred.sdiv.continue40

pred.sdiv.continue40:                             ; preds = %pred.sdiv.if39, %pred.sdiv.continue38
  %122 = phi <4 x i32> [ %116, %pred.sdiv.continue38 ], [ %121, %pred.sdiv.if39 ]
  %123 = extractelement <4 x i1> %110, i32 2
  br i1 %123, label %pred.sdiv.if41, label %pred.sdiv.continue42

pred.sdiv.if41:                                   ; preds = %pred.sdiv.continue40
  %124 = extractelement <4 x i32> %107, i32 2
  %125 = extractelement <4 x i32> %wide.load, i32 2
  %126 = sdiv i32 %124, %125
  %127 = insertelement <4 x i32> %122, i32 %126, i32 2
  br label %pred.sdiv.continue42

pred.sdiv.continue42:                             ; preds = %pred.sdiv.if41, %pred.sdiv.continue40
  %128 = phi <4 x i32> [ %122, %pred.sdiv.continue40 ], [ %127, %pred.sdiv.if41 ]
  %129 = extractelement <4 x i1> %110, i32 3
  br i1 %129, label %pred.sdiv.if43, label %pred.sdiv.continue44

pred.sdiv.if43:                                   ; preds = %pred.sdiv.continue42
  %130 = extractelement <4 x i32> %107, i32 3
  %131 = extractelement <4 x i32> %wide.load, i32 3
  %132 = sdiv i32 %130, %131
  %133 = insertelement <4 x i32> %128, i32 %132, i32 3
  br label %pred.sdiv.continue44

pred.sdiv.continue44:                             ; preds = %pred.sdiv.if43, %pred.sdiv.continue42
  %134 = phi <4 x i32> [ %128, %pred.sdiv.continue42 ], [ %133, %pred.sdiv.if43 ]
  %135 = and <4 x i1> %108, %76
  %.op = sub <4 x i32> zeroinitializer, %134
  %136 = select <4 x i1> %135, <4 x i32> zeroinitializer, <4 x i32> %.op
  %predphi29 = select <4 x i1> %82, <4 x i32> %106, <4 x i32> %136
  %137 = and <4 x i1> %79, %80
  %138 = trunc <4 x i32> %predphi29 to <4 x i16>
  %139 = select <4 x i1> %137, <4 x i16> zeroinitializer, <4 x i16> %138
  %140 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 %indvars.iv916, i64 %index
  %141 = bitcast i16* %140 to <4 x i16>*
  store <4 x i16> %139, <4 x i16>* %141, align 2, !alias.scope !14, !noalias !16
  %index.next = add i64 %index, 4
  %142 = icmp eq i64 %index.next, 64
  br i1 %142, label %middle.block.loopexit45, label %vector.body, !llvm.loop !17

scalar.ph:                                        ; preds = %scalar.ph.preheader, %161
  %indvars.iv614 = phi i64 [ %indvars.iv.next7, %161 ], [ 0, %scalar.ph.preheader ]
  %143 = getelementptr inbounds i32, i32* %18, i64 %indvars.iv614
  %144 = load i32, i32* %143, align 4
  %145 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 0, i64 %indvars.iv614
  %146 = load i32, i32* %145, align 4
  %147 = icmp slt i32 %146, 0
  %148 = ashr i32 %144, 1
  br i1 %147, label %149, label %156

; <label>:149:                                    ; preds = %scalar.ph
  %150 = sub i32 %148, %146
  %151 = icmp slt i32 %150, %144
  br i1 %151, label %154, label %152

; <label>:152:                                    ; preds = %149
  %153 = sdiv i32 %150, %144
  br label %154

; <label>:154:                                    ; preds = %149, %152
  %.01 = phi i32 [ %153, %152 ], [ 0, %149 ]
  %155 = sub nsw i32 0, %.01
  br label %161

; <label>:156:                                    ; preds = %scalar.ph
  %157 = add nsw i32 %146, %148
  %158 = icmp slt i32 %157, %144
  br i1 %158, label %161, label %159

; <label>:159:                                    ; preds = %156
  %160 = sdiv i32 %157, %144
  br label %161

; <label>:161:                                    ; preds = %156, %159, %154
  %.2 = phi i32 [ %155, %154 ], [ %160, %159 ], [ 0, %156 ]
  %162 = trunc i32 %.2 to i16
  %163 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 %indvars.iv916, i64 %indvars.iv614
  store i16 %162, i16* %163, align 2
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv614, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 64
  br i1 %exitcond8, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !18

middle.block.loopexit:                            ; preds = %161
  br label %middle.block

middle.block.loopexit45:                          ; preds = %pred.sdiv.continue44
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit45, %middle.block.loopexit
  %164 = add i32 %.0417, 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv916, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, %wide.trip.count
  br i1 %exitcond11, label %._crit_edge.loopexit, label %24

._crit_edge.loopexit:                             ; preds = %middle.block
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %7
  ret void
}

declare void @jpeg_fdct_islow(i32*) #1

declare void @jpeg_fdct_ifast(i32*) #1

; Function Attrs: noinline nounwind uwtable
define internal void @forward_DCT_float(%struct.jpeg_compress_struct* nocapture readonly, %struct.jpeg_component_info* nocapture readonly, i8** nocapture readonly, [64 x i16]* nocapture, i32, i32, i32) #0 {
  %8 = alloca [64 x float], align 16
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 58
  %10 = bitcast %struct.jpeg_forward_dct** %9 to %struct.my_fdct_controller**
  %11 = load %struct.my_fdct_controller*, %struct.my_fdct_controller** %10, align 8
  %12 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %11, i64 0, i32 3
  %13 = load void (float*)*, void (float*)** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %1, i64 0, i32 4
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %11, i64 0, i32 4, i64 %16
  %18 = load float*, float** %17, align 8
  %19 = zext i32 %4 to i64
  %20 = getelementptr inbounds i8*, i8** %2, i64 %19
  %wide.trip.count = zext i32 %6 to i64
  %exitcond1014 = icmp eq i32 %6, 0
  br i1 %exitcond1014, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %7
  %21 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 0
  %scevgep20 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 1, i64 0
  %scevgep22 = getelementptr float, float* %18, i64 64
  %22 = bitcast float* %scevgep20 to i16*
  %23 = bitcast float* %scevgep22 to i16*
  %24 = bitcast [64 x float]* %8 to <8 x float>*
  %25 = bitcast float* %18 to <8 x float>*
  %26 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 8
  %27 = bitcast float* %26 to <8 x float>*
  %28 = getelementptr inbounds float, float* %18, i64 8
  %29 = bitcast float* %28 to <8 x float>*
  %30 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 16
  %31 = bitcast float* %30 to <8 x float>*
  %32 = getelementptr inbounds float, float* %18, i64 16
  %33 = bitcast float* %32 to <8 x float>*
  %34 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 24
  %35 = bitcast float* %34 to <8 x float>*
  %36 = getelementptr inbounds float, float* %18, i64 24
  %37 = bitcast float* %36 to <8 x float>*
  %38 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 32
  %39 = bitcast float* %38 to <8 x float>*
  %40 = getelementptr inbounds float, float* %18, i64 32
  %41 = bitcast float* %40 to <8 x float>*
  %42 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 40
  %43 = bitcast float* %42 to <8 x float>*
  %44 = getelementptr inbounds float, float* %18, i64 40
  %45 = bitcast float* %44 to <8 x float>*
  %46 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 48
  %47 = bitcast float* %46 to <8 x float>*
  %48 = getelementptr inbounds float, float* %18, i64 48
  %49 = bitcast float* %48 to <8 x float>*
  %50 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 56
  %51 = bitcast float* %50 to <8 x float>*
  %52 = getelementptr inbounds float, float* %18, i64 56
  %53 = bitcast float* %52 to <8 x float>*
  br label %54

; <label>:54:                                     ; preds = %.lr.ph, %middle.block
  %.0416 = phi i32 [ %5, %.lr.ph ], [ %242, %middle.block ]
  %indvars.iv815 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next9, %middle.block ]
  %scevgep = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 0
  %55 = add i64 %indvars.iv815, 1
  %scevgep18 = getelementptr [64 x i16], [64 x i16]* %3, i64 %55, i64 0
  %56 = zext i32 %.0416 to i64
  br label %57

; <label>:57:                                     ; preds = %54, %57
  %.0212 = phi float* [ %21, %54 ], [ %107, %57 ]
  %indvars.iv11 = phi i64 [ 0, %54 ], [ %indvars.iv.next, %57 ]
  %58 = getelementptr inbounds i8*, i8** %20, i64 %indvars.iv11
  %59 = load i8*, i8** %58, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 %56
  %61 = getelementptr inbounds i8, i8* %60, i64 1
  %62 = load i8, i8* %60, align 1
  %63 = zext i8 %62 to i32
  %64 = add nsw i32 %63, -128
  %65 = sitofp i32 %64 to float
  %66 = getelementptr inbounds float, float* %.0212, i64 1
  store float %65, float* %.0212, align 4
  %67 = getelementptr inbounds i8, i8* %61, i64 1
  %68 = load i8, i8* %61, align 1
  %69 = zext i8 %68 to i32
  %70 = add nsw i32 %69, -128
  %71 = sitofp i32 %70 to float
  %72 = getelementptr inbounds float, float* %.0212, i64 2
  store float %71, float* %66, align 4
  %73 = getelementptr inbounds i8, i8* %67, i64 1
  %74 = load i8, i8* %67, align 1
  %75 = zext i8 %74 to i32
  %76 = add nsw i32 %75, -128
  %77 = sitofp i32 %76 to float
  %78 = getelementptr inbounds float, float* %.0212, i64 3
  store float %77, float* %72, align 4
  %79 = getelementptr inbounds i8, i8* %73, i64 1
  %80 = load i8, i8* %73, align 1
  %81 = zext i8 %80 to i32
  %82 = add nsw i32 %81, -128
  %83 = sitofp i32 %82 to float
  %84 = getelementptr inbounds float, float* %.0212, i64 4
  store float %83, float* %78, align 4
  %85 = getelementptr inbounds i8, i8* %79, i64 1
  %86 = load i8, i8* %79, align 1
  %87 = zext i8 %86 to i32
  %88 = add nsw i32 %87, -128
  %89 = sitofp i32 %88 to float
  %90 = getelementptr inbounds float, float* %.0212, i64 5
  store float %89, float* %84, align 4
  %91 = getelementptr inbounds i8, i8* %85, i64 1
  %92 = load i8, i8* %85, align 1
  %93 = zext i8 %92 to i32
  %94 = add nsw i32 %93, -128
  %95 = sitofp i32 %94 to float
  %96 = getelementptr inbounds float, float* %.0212, i64 6
  store float %95, float* %90, align 4
  %97 = getelementptr inbounds i8, i8* %91, i64 1
  %98 = load i8, i8* %91, align 1
  %99 = zext i8 %98 to i32
  %100 = add nsw i32 %99, -128
  %101 = sitofp i32 %100 to float
  %102 = getelementptr inbounds float, float* %.0212, i64 7
  store float %101, float* %96, align 4
  %103 = load i8, i8* %97, align 1
  %104 = zext i8 %103 to i32
  %105 = add nsw i32 %104, -128
  %106 = sitofp i32 %105 to float
  %107 = getelementptr inbounds float, float* %.0212, i64 8
  store float %106, float* %102, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %min.iters.checked, label %57

min.iters.checked:                                ; preds = %57
  call void %13(float* nonnull %21) #2
  %bound0 = icmp ult i16* %scevgep, %22
  %108 = bitcast i16* %scevgep18 to [64 x float]*
  %bound1 = icmp ult [64 x float]* %8, %108
  %found.conflict = and i1 %bound0, %bound1
  %bound024 = icmp ult i16* %scevgep, %23
  %109 = bitcast i16* %scevgep18 to float*
  %bound125 = icmp ult float* %18, %109
  %found.conflict26 = and i1 %bound024, %bound125
  %conflict.rdx = or i1 %found.conflict, %found.conflict26
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

scalar.ph.preheader:                              ; preds = %min.iters.checked
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader
  %wide.vec = load <8 x float>, <8 x float>* %24, align 16, !alias.scope !19
  %wide.vec28 = load <8 x float>, <8 x float>* %25, align 4, !alias.scope !22
  %110 = fmul <8 x float> %wide.vec, %wide.vec28
  %111 = shufflevector <8 x float> %110, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %112 = fadd <4 x float> %111, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %113 = fptosi <4 x float> %112 to <4 x i32>
  %114 = add <4 x i32> %113, <i32 49152, i32 49152, i32 49152, i32 49152>
  %115 = trunc <4 x i32> %114 to <4 x i16>
  %116 = fmul <8 x float> %wide.vec, %wide.vec28
  %117 = shufflevector <8 x float> %116, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %118 = fadd <4 x float> %117, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %119 = fptosi <4 x float> %118 to <4 x i32>
  %120 = add <4 x i32> %119, <i32 49152, i32 49152, i32 49152, i32 49152>
  %121 = trunc <4 x i32> %120 to <4 x i16>
  %122 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 0
  %123 = bitcast i16* %122 to <8 x i16>*
  %interleaved.vec = shufflevector <4 x i16> %115, <4 x i16> %121, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec, <8 x i16>* %123, align 2, !alias.scope !24, !noalias !26
  %wide.vec.1 = load <8 x float>, <8 x float>* %27, align 16, !alias.scope !19
  %wide.vec28.1 = load <8 x float>, <8 x float>* %29, align 4, !alias.scope !22
  %124 = fmul <8 x float> %wide.vec.1, %wide.vec28.1
  %125 = shufflevector <8 x float> %124, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %126 = fadd <4 x float> %125, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %127 = fptosi <4 x float> %126 to <4 x i32>
  %128 = add <4 x i32> %127, <i32 49152, i32 49152, i32 49152, i32 49152>
  %129 = trunc <4 x i32> %128 to <4 x i16>
  %130 = fmul <8 x float> %wide.vec.1, %wide.vec28.1
  %131 = shufflevector <8 x float> %130, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %132 = fadd <4 x float> %131, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %133 = fptosi <4 x float> %132 to <4 x i32>
  %134 = add <4 x i32> %133, <i32 49152, i32 49152, i32 49152, i32 49152>
  %135 = trunc <4 x i32> %134 to <4 x i16>
  %136 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 8
  %137 = bitcast i16* %136 to <8 x i16>*
  %interleaved.vec.1 = shufflevector <4 x i16> %129, <4 x i16> %135, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.1, <8 x i16>* %137, align 2, !alias.scope !24, !noalias !26
  %wide.vec.2 = load <8 x float>, <8 x float>* %31, align 16, !alias.scope !19
  %wide.vec28.2 = load <8 x float>, <8 x float>* %33, align 4, !alias.scope !22
  %138 = fmul <8 x float> %wide.vec.2, %wide.vec28.2
  %139 = shufflevector <8 x float> %138, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %140 = fadd <4 x float> %139, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %141 = fptosi <4 x float> %140 to <4 x i32>
  %142 = add <4 x i32> %141, <i32 49152, i32 49152, i32 49152, i32 49152>
  %143 = trunc <4 x i32> %142 to <4 x i16>
  %144 = fmul <8 x float> %wide.vec.2, %wide.vec28.2
  %145 = shufflevector <8 x float> %144, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %146 = fadd <4 x float> %145, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %147 = fptosi <4 x float> %146 to <4 x i32>
  %148 = add <4 x i32> %147, <i32 49152, i32 49152, i32 49152, i32 49152>
  %149 = trunc <4 x i32> %148 to <4 x i16>
  %150 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 16
  %151 = bitcast i16* %150 to <8 x i16>*
  %interleaved.vec.2 = shufflevector <4 x i16> %143, <4 x i16> %149, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.2, <8 x i16>* %151, align 2, !alias.scope !24, !noalias !26
  %wide.vec.3 = load <8 x float>, <8 x float>* %35, align 16, !alias.scope !19
  %wide.vec28.3 = load <8 x float>, <8 x float>* %37, align 4, !alias.scope !22
  %152 = fmul <8 x float> %wide.vec.3, %wide.vec28.3
  %153 = shufflevector <8 x float> %152, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %154 = fadd <4 x float> %153, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %155 = fptosi <4 x float> %154 to <4 x i32>
  %156 = add <4 x i32> %155, <i32 49152, i32 49152, i32 49152, i32 49152>
  %157 = trunc <4 x i32> %156 to <4 x i16>
  %158 = fmul <8 x float> %wide.vec.3, %wide.vec28.3
  %159 = shufflevector <8 x float> %158, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %160 = fadd <4 x float> %159, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %161 = fptosi <4 x float> %160 to <4 x i32>
  %162 = add <4 x i32> %161, <i32 49152, i32 49152, i32 49152, i32 49152>
  %163 = trunc <4 x i32> %162 to <4 x i16>
  %164 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 24
  %165 = bitcast i16* %164 to <8 x i16>*
  %interleaved.vec.3 = shufflevector <4 x i16> %157, <4 x i16> %163, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.3, <8 x i16>* %165, align 2, !alias.scope !24, !noalias !26
  %wide.vec.4 = load <8 x float>, <8 x float>* %39, align 16, !alias.scope !19
  %wide.vec28.4 = load <8 x float>, <8 x float>* %41, align 4, !alias.scope !22
  %166 = fmul <8 x float> %wide.vec.4, %wide.vec28.4
  %167 = shufflevector <8 x float> %166, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %168 = fadd <4 x float> %167, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %169 = fptosi <4 x float> %168 to <4 x i32>
  %170 = add <4 x i32> %169, <i32 49152, i32 49152, i32 49152, i32 49152>
  %171 = trunc <4 x i32> %170 to <4 x i16>
  %172 = fmul <8 x float> %wide.vec.4, %wide.vec28.4
  %173 = shufflevector <8 x float> %172, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %174 = fadd <4 x float> %173, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %175 = fptosi <4 x float> %174 to <4 x i32>
  %176 = add <4 x i32> %175, <i32 49152, i32 49152, i32 49152, i32 49152>
  %177 = trunc <4 x i32> %176 to <4 x i16>
  %178 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 32
  %179 = bitcast i16* %178 to <8 x i16>*
  %interleaved.vec.4 = shufflevector <4 x i16> %171, <4 x i16> %177, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.4, <8 x i16>* %179, align 2, !alias.scope !24, !noalias !26
  %wide.vec.5 = load <8 x float>, <8 x float>* %43, align 16, !alias.scope !19
  %wide.vec28.5 = load <8 x float>, <8 x float>* %45, align 4, !alias.scope !22
  %180 = fmul <8 x float> %wide.vec.5, %wide.vec28.5
  %181 = shufflevector <8 x float> %180, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %182 = fadd <4 x float> %181, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %183 = fptosi <4 x float> %182 to <4 x i32>
  %184 = add <4 x i32> %183, <i32 49152, i32 49152, i32 49152, i32 49152>
  %185 = trunc <4 x i32> %184 to <4 x i16>
  %186 = fmul <8 x float> %wide.vec.5, %wide.vec28.5
  %187 = shufflevector <8 x float> %186, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %188 = fadd <4 x float> %187, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %189 = fptosi <4 x float> %188 to <4 x i32>
  %190 = add <4 x i32> %189, <i32 49152, i32 49152, i32 49152, i32 49152>
  %191 = trunc <4 x i32> %190 to <4 x i16>
  %192 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 40
  %193 = bitcast i16* %192 to <8 x i16>*
  %interleaved.vec.5 = shufflevector <4 x i16> %185, <4 x i16> %191, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.5, <8 x i16>* %193, align 2, !alias.scope !24, !noalias !26
  %wide.vec.6 = load <8 x float>, <8 x float>* %47, align 16, !alias.scope !19
  %wide.vec28.6 = load <8 x float>, <8 x float>* %49, align 4, !alias.scope !22
  %194 = fmul <8 x float> %wide.vec.6, %wide.vec28.6
  %195 = shufflevector <8 x float> %194, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %196 = fadd <4 x float> %195, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %197 = fptosi <4 x float> %196 to <4 x i32>
  %198 = add <4 x i32> %197, <i32 49152, i32 49152, i32 49152, i32 49152>
  %199 = trunc <4 x i32> %198 to <4 x i16>
  %200 = fmul <8 x float> %wide.vec.6, %wide.vec28.6
  %201 = shufflevector <8 x float> %200, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %202 = fadd <4 x float> %201, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %203 = fptosi <4 x float> %202 to <4 x i32>
  %204 = add <4 x i32> %203, <i32 49152, i32 49152, i32 49152, i32 49152>
  %205 = trunc <4 x i32> %204 to <4 x i16>
  %206 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 48
  %207 = bitcast i16* %206 to <8 x i16>*
  %interleaved.vec.6 = shufflevector <4 x i16> %199, <4 x i16> %205, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.6, <8 x i16>* %207, align 2, !alias.scope !24, !noalias !26
  %wide.vec.7 = load <8 x float>, <8 x float>* %51, align 16, !alias.scope !19
  %wide.vec28.7 = load <8 x float>, <8 x float>* %53, align 4, !alias.scope !22
  %208 = fmul <8 x float> %wide.vec.7, %wide.vec28.7
  %209 = shufflevector <8 x float> %208, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %210 = fadd <4 x float> %209, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %211 = fptosi <4 x float> %210 to <4 x i32>
  %212 = add <4 x i32> %211, <i32 49152, i32 49152, i32 49152, i32 49152>
  %213 = trunc <4 x i32> %212 to <4 x i16>
  %214 = fmul <8 x float> %wide.vec.7, %wide.vec28.7
  %215 = shufflevector <8 x float> %214, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %216 = fadd <4 x float> %215, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %217 = fptosi <4 x float> %216 to <4 x i32>
  %218 = add <4 x i32> %217, <i32 49152, i32 49152, i32 49152, i32 49152>
  %219 = trunc <4 x i32> %218 to <4 x i16>
  %220 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 56
  %221 = bitcast i16* %220 to <8 x i16>*
  %interleaved.vec.7 = shufflevector <4 x i16> %213, <4 x i16> %219, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.7, <8 x i16>* %221, align 2, !alias.scope !24, !noalias !26
  br label %middle.block

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv513 = phi i64 [ %indvars.iv.next6.1, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %222 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 %indvars.iv513
  %223 = load float, float* %222, align 8
  %224 = getelementptr inbounds float, float* %18, i64 %indvars.iv513
  %225 = load float, float* %224, align 4
  %226 = fmul float %223, %225
  %227 = fadd float %226, 1.638450e+04
  %228 = fptosi float %227 to i32
  %229 = add i32 %228, 49152
  %230 = trunc i32 %229 to i16
  %231 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 %indvars.iv513
  store i16 %230, i16* %231, align 2
  %indvars.iv.next6 = or i64 %indvars.iv513, 1
  %232 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 %indvars.iv.next6
  %233 = load float, float* %232, align 4
  %234 = getelementptr inbounds float, float* %18, i64 %indvars.iv.next6
  %235 = load float, float* %234, align 4
  %236 = fmul float %233, %235
  %237 = fadd float %236, 1.638450e+04
  %238 = fptosi float %237 to i32
  %239 = add i32 %238, 49152
  %240 = trunc i32 %239 to i16
  %241 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 %indvars.iv815, i64 %indvars.iv.next6
  store i16 %240, i16* %241, align 2
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv513, 2
  %exitcond7.1 = icmp eq i64 %indvars.iv.next6.1, 64
  br i1 %exitcond7.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !27

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block:                                     ; preds = %vector.body, %middle.block.loopexit
  %242 = add i32 %.0416, 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv815, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, %wide.trip.count
  br i1 %exitcond10, label %._crit_edge.loopexit, label %54

._crit_edge.loopexit:                             ; preds = %middle.block
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %7
  ret void
}

declare void @jpeg_fdct_float(float*) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!10, !13}
!17 = distinct !{!17, !7, !8}
!18 = distinct !{!18, !7, !8}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = !{!25}
!25 = distinct !{!25, !21}
!26 = !{!20, !23}
!27 = distinct !{!27, !7, !8}
