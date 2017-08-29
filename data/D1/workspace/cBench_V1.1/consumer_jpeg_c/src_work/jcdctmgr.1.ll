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

@start_pass_fdctmgr.aanscales = internal unnamed_addr constant [64 x i16] [i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 22725, i16 31521, i16 29692, i16 26722, i16 22725, i16 17855, i16 12299, i16 6270, i16 21407, i16 29692, i16 27969, i16 25172, i16 21407, i16 16819, i16 11585, i16 5906, i16 19266, i16 26722, i16 25172, i16 22654, i16 19266, i16 15137, i16 10426, i16 5315, i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 12873, i16 17855, i16 16819, i16 15137, i16 12873, i16 10114, i16 6967, i16 3552, i16 8867, i16 12299, i16 11585, i16 10426, i16 8867, i16 6967, i16 4799, i16 2446, i16 4520, i16 6270, i16 5906, i16 5315, i16 4520, i16 3552, i16 2446, i16 1247], align 16
@start_pass_fdctmgr.aanscalefactor = internal unnamed_addr constant [8 x double] [double 1.000000e+00, double 0x3FF63150B14861EF, double 0x3FF4E7AE914D6FCA, double 0x3FF2D062EF6C11AA, double 1.000000e+00, double 0x3FE92469C0A7BF3B, double 5.411961e-01, double 0x3FD1A855DE72AB5D], align 16

; Function Attrs: noinline nounwind uwtable
define void @jinit_forward_dct(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
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
  %29 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i64 0, i32 5
  store i32 47, i32* %32, align 8
  %33 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %34 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %33, align 8
  %35 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %34, align 8
  tail call void %35(%struct.jpeg_common_struct* %29) #2
  br label %.preheader

.preheader:                                       ; preds = %13, %18, %23, %28
  %36 = getelementptr inbounds i8, i8* %7, i64 64
  %37 = getelementptr inbounds i8, i8* %7, i64 24
  %38 = bitcast i8* %37 to i32**
  store i32* null, i32** %38, align 8
  %39 = bitcast i8* %36 to float**
  store float* null, float** %39, align 8
  %40 = getelementptr inbounds i8, i8* %7, i64 32
  %41 = bitcast i8* %40 to i32**
  store i32* null, i32** %41, align 8
  %42 = getelementptr inbounds i8, i8* %7, i64 72
  %43 = bitcast i8* %42 to float**
  store float* null, float** %43, align 8
  %44 = getelementptr inbounds i8, i8* %7, i64 40
  %45 = bitcast i8* %44 to i32**
  store i32* null, i32** %45, align 8
  %46 = getelementptr inbounds i8, i8* %7, i64 80
  %47 = bitcast i8* %46 to float**
  store float* null, float** %47, align 8
  %48 = getelementptr inbounds i8, i8* %7, i64 48
  %49 = bitcast i8* %48 to i32**
  store i32* null, i32** %49, align 8
  %50 = getelementptr inbounds i8, i8* %7, i64 88
  %51 = bitcast i8* %50 to float**
  store float* null, float** %51, align 8
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
  %12 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr86 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr87 = add i64 %sunkaddr86, 268
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to i32*
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %15 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr97 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr98 = add i64 %sunkaddr97, 68
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  %16 = ptrtoint %struct.my_fdct_controller* %4 to i64
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr89 = add i64 %sunkaddr, 8
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %18 = ptrtoint %struct.my_fdct_controller* %4 to i64
  %19 = ptrtoint %struct.my_fdct_controller* %4 to i64
  %20 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr91 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr92 = add i64 %sunkaddr91, 8
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %21 = ptrtoint %struct.my_fdct_controller* %4 to i64
  %22 = ptrtoint %struct.my_fdct_controller* %4 to i64
  %23 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr94 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr95 = add i64 %sunkaddr94, 8
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %24 = ptrtoint %struct.my_fdct_controller* %4 to i64
  br label %25

; <label>:25:                                     ; preds = %.loopexit, %.lr.ph
  %.0214 = phi i32 [ 0, %.lr.ph ], [ %251, %.loopexit ]
  %.0413 = phi %struct.jpeg_component_info* [ %9, %.lr.ph ], [ %252, %.loopexit ]
  %26 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0413, i64 0, i32 4
  %27 = load i32, i32* %26, align 8
  %28 = sext i32 %27 to i64
  %29 = icmp ugt i32 %27, 3
  br i1 %29, label %35, label %30

; <label>:30:                                     ; preds = %25
  %31 = sext i32 %27 to i64
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 %31
  %33 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %32, align 8
  %34 = icmp eq %struct.JQUANT_TBL* %33, null
  br i1 %34, label %35, label %42

; <label>:35:                                     ; preds = %30, %25
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 5
  store i32 51, i32* %37, align 8
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i64 0, i32 6, i32 0, i64 0
  store i32 %27, i32* %39, align 4
  %40 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  tail call void %41(%struct.jpeg_common_struct* %11) #2
  br label %42

; <label>:42:                                     ; preds = %30, %35
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 %28
  %44 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %43, align 8
  %45 = load i32, i32* %sunkaddr88, align 4
  switch i32 %45, label %246 [
    i32 0, label %46
    i32 1, label %130
    i32 2, label %163
  ]

; <label>:46:                                     ; preds = %42
  %47 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %4, i64 0, i32 2, i64 %28
  %48 = load i32*, i32** %47, align 8
  %49 = icmp eq i32* %48, null
  br i1 %49, label %50, label %min.iters.checked

; <label>:50:                                     ; preds = %46
  %51 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr90, align 8
  %52 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %51, align 8
  %53 = tail call i8* %52(%struct.jpeg_common_struct* nonnull %17, i32 1, i64 256) #2
  %sunkaddr35 = shl nsw i64 %28, 3
  %sunkaddr36 = add i64 %16, %sunkaddr35
  %sunkaddr37 = add i64 %sunkaddr36, 24
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i8**
  store i8* %53, i8** %sunkaddr38, align 8
  br label %min.iters.checked

min.iters.checked:                                ; preds = %46, %50
  %sunkaddr40 = shl nsw i64 %28, 3
  %sunkaddr41 = add i64 %18, %sunkaddr40
  %sunkaddr42 = add i64 %sunkaddr41, 24
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i32**
  %54 = load i32*, i32** %sunkaddr43, align 8
  %scevgep = getelementptr i32, i32* %54, i64 64
  %scevgep103 = getelementptr %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 1
  %bound0 = icmp ult i32* %54, %scevgep103
  %55 = bitcast i32* %scevgep to %struct.JQUANT_TBL*
  %bound1 = icmp ult %struct.JQUANT_TBL* %44, %55
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

scalar.ph.preheader:                              ; preds = %min.iters.checked
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader
  %56 = bitcast %struct.JQUANT_TBL* %44 to <16 x i16>*
  %wide.vec = load <16 x i16>, <16 x i16>* %56, align 2, !alias.scope !1
  %strided.vec = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec105 = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec106 = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec107 = shufflevector <16 x i16> %wide.vec, <16 x i16> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %57 = zext <4 x i16> %strided.vec to <4 x i32>
  %58 = shl nuw nsw <4 x i32> %57, <i32 3, i32 3, i32 3, i32 3>
  %59 = zext <4 x i16> %strided.vec105 to <4 x i32>
  %60 = shl nuw nsw <4 x i32> %59, <i32 3, i32 3, i32 3, i32 3>
  %61 = zext <4 x i16> %strided.vec106 to <4 x i32>
  %62 = shl nuw nsw <4 x i32> %61, <i32 3, i32 3, i32 3, i32 3>
  %63 = zext <4 x i16> %strided.vec107 to <4 x i32>
  %64 = shl nuw nsw <4 x i32> %63, <i32 3, i32 3, i32 3, i32 3>
  %65 = bitcast i32* %54 to <16 x i32>*
  %66 = shufflevector <4 x i32> %58, <4 x i32> %60, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %67 = shufflevector <4 x i32> %62, <4 x i32> %64, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec = shufflevector <8 x i32> %66, <8 x i32> %67, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec, <16 x i32>* %65, align 4, !alias.scope !4, !noalias !1
  %68 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 16
  %69 = bitcast i16* %68 to <16 x i16>*
  %wide.vec.1 = load <16 x i16>, <16 x i16>* %69, align 2, !alias.scope !1
  %strided.vec.1 = shufflevector <16 x i16> %wide.vec.1, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec105.1 = shufflevector <16 x i16> %wide.vec.1, <16 x i16> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec106.1 = shufflevector <16 x i16> %wide.vec.1, <16 x i16> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec107.1 = shufflevector <16 x i16> %wide.vec.1, <16 x i16> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %70 = zext <4 x i16> %strided.vec.1 to <4 x i32>
  %71 = shl nuw nsw <4 x i32> %70, <i32 3, i32 3, i32 3, i32 3>
  %72 = zext <4 x i16> %strided.vec105.1 to <4 x i32>
  %73 = shl nuw nsw <4 x i32> %72, <i32 3, i32 3, i32 3, i32 3>
  %74 = zext <4 x i16> %strided.vec106.1 to <4 x i32>
  %75 = shl nuw nsw <4 x i32> %74, <i32 3, i32 3, i32 3, i32 3>
  %76 = zext <4 x i16> %strided.vec107.1 to <4 x i32>
  %77 = shl nuw nsw <4 x i32> %76, <i32 3, i32 3, i32 3, i32 3>
  %78 = getelementptr i32, i32* %54, i64 16
  %79 = bitcast i32* %78 to <16 x i32>*
  %80 = shufflevector <4 x i32> %71, <4 x i32> %73, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %81 = shufflevector <4 x i32> %75, <4 x i32> %77, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec.1 = shufflevector <8 x i32> %80, <8 x i32> %81, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec.1, <16 x i32>* %79, align 4, !alias.scope !4, !noalias !1
  %82 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 32
  %83 = bitcast i16* %82 to <16 x i16>*
  %wide.vec.2 = load <16 x i16>, <16 x i16>* %83, align 2, !alias.scope !1
  %strided.vec.2 = shufflevector <16 x i16> %wide.vec.2, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec105.2 = shufflevector <16 x i16> %wide.vec.2, <16 x i16> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec106.2 = shufflevector <16 x i16> %wide.vec.2, <16 x i16> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec107.2 = shufflevector <16 x i16> %wide.vec.2, <16 x i16> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %84 = zext <4 x i16> %strided.vec.2 to <4 x i32>
  %85 = shl nuw nsw <4 x i32> %84, <i32 3, i32 3, i32 3, i32 3>
  %86 = zext <4 x i16> %strided.vec105.2 to <4 x i32>
  %87 = shl nuw nsw <4 x i32> %86, <i32 3, i32 3, i32 3, i32 3>
  %88 = zext <4 x i16> %strided.vec106.2 to <4 x i32>
  %89 = shl nuw nsw <4 x i32> %88, <i32 3, i32 3, i32 3, i32 3>
  %90 = zext <4 x i16> %strided.vec107.2 to <4 x i32>
  %91 = shl nuw nsw <4 x i32> %90, <i32 3, i32 3, i32 3, i32 3>
  %92 = getelementptr i32, i32* %54, i64 32
  %93 = bitcast i32* %92 to <16 x i32>*
  %94 = shufflevector <4 x i32> %85, <4 x i32> %87, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %95 = shufflevector <4 x i32> %89, <4 x i32> %91, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec.2 = shufflevector <8 x i32> %94, <8 x i32> %95, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec.2, <16 x i32>* %93, align 4, !alias.scope !4, !noalias !1
  %96 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 48
  %97 = bitcast i16* %96 to <16 x i16>*
  %wide.vec.3 = load <16 x i16>, <16 x i16>* %97, align 2, !alias.scope !1
  %strided.vec.3 = shufflevector <16 x i16> %wide.vec.3, <16 x i16> undef, <4 x i32> <i32 0, i32 4, i32 8, i32 12>
  %strided.vec105.3 = shufflevector <16 x i16> %wide.vec.3, <16 x i16> undef, <4 x i32> <i32 1, i32 5, i32 9, i32 13>
  %strided.vec106.3 = shufflevector <16 x i16> %wide.vec.3, <16 x i16> undef, <4 x i32> <i32 2, i32 6, i32 10, i32 14>
  %strided.vec107.3 = shufflevector <16 x i16> %wide.vec.3, <16 x i16> undef, <4 x i32> <i32 3, i32 7, i32 11, i32 15>
  %98 = zext <4 x i16> %strided.vec.3 to <4 x i32>
  %99 = shl nuw nsw <4 x i32> %98, <i32 3, i32 3, i32 3, i32 3>
  %100 = zext <4 x i16> %strided.vec105.3 to <4 x i32>
  %101 = shl nuw nsw <4 x i32> %100, <i32 3, i32 3, i32 3, i32 3>
  %102 = zext <4 x i16> %strided.vec106.3 to <4 x i32>
  %103 = shl nuw nsw <4 x i32> %102, <i32 3, i32 3, i32 3, i32 3>
  %104 = zext <4 x i16> %strided.vec107.3 to <4 x i32>
  %105 = shl nuw nsw <4 x i32> %104, <i32 3, i32 3, i32 3, i32 3>
  %106 = getelementptr i32, i32* %54, i64 48
  %107 = bitcast i32* %106 to <16 x i32>*
  %108 = shufflevector <4 x i32> %99, <4 x i32> %101, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %109 = shufflevector <4 x i32> %103, <4 x i32> %105, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec.3 = shufflevector <8 x i32> %108, <8 x i32> %109, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  store <16 x i32> %interleaved.vec.3, <16 x i32>* %107, align 4, !alias.scope !4, !noalias !1
  br label %.loopexit

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.3, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %110 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv24
  %111 = load i16, i16* %110, align 2
  %112 = zext i16 %111 to i32
  %113 = shl nuw nsw i32 %112, 3
  %114 = getelementptr inbounds i32, i32* %54, i64 %indvars.iv24
  store i32 %113, i32* %114, align 4
  %indvars.iv.next25 = or i64 %indvars.iv24, 1
  %115 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next25
  %116 = load i16, i16* %115, align 2
  %117 = zext i16 %116 to i32
  %118 = shl nuw nsw i32 %117, 3
  %119 = getelementptr inbounds i32, i32* %54, i64 %indvars.iv.next25
  store i32 %118, i32* %119, align 4
  %indvars.iv.next25.1 = or i64 %indvars.iv24, 2
  %120 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next25.1
  %121 = load i16, i16* %120, align 2
  %122 = zext i16 %121 to i32
  %123 = shl nuw nsw i32 %122, 3
  %124 = getelementptr inbounds i32, i32* %54, i64 %indvars.iv.next25.1
  store i32 %123, i32* %124, align 4
  %indvars.iv.next25.2 = or i64 %indvars.iv24, 3
  %125 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next25.2
  %126 = load i16, i16* %125, align 2
  %127 = zext i16 %126 to i32
  %128 = shl nuw nsw i32 %127, 3
  %129 = getelementptr inbounds i32, i32* %54, i64 %indvars.iv.next25.2
  store i32 %128, i32* %129, align 4
  %indvars.iv.next25.3 = add nuw nsw i64 %indvars.iv24, 4
  %exitcond26.3 = icmp eq i64 %indvars.iv.next25.3, 64
  br i1 %exitcond26.3, label %.loopexit.loopexit, label %scalar.ph, !llvm.loop !6

; <label>:130:                                    ; preds = %42
  %131 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %4, i64 0, i32 2, i64 %28
  %132 = load i32*, i32** %131, align 8
  %133 = icmp eq i32* %132, null
  br i1 %133, label %134, label %138

; <label>:134:                                    ; preds = %130
  %135 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr93, align 8
  %136 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %135, align 8
  %137 = tail call i8* %136(%struct.jpeg_common_struct* nonnull %20, i32 1, i64 256) #2
  %sunkaddr48 = shl nsw i64 %28, 3
  %sunkaddr49 = add i64 %19, %sunkaddr48
  %sunkaddr50 = add i64 %sunkaddr49, 24
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i8**
  store i8* %137, i8** %sunkaddr51, align 8
  br label %138

; <label>:138:                                    ; preds = %130, %134
  %sunkaddr53 = shl nsw i64 %28, 3
  %sunkaddr54 = add i64 %21, %sunkaddr53
  %sunkaddr55 = add i64 %sunkaddr54, 24
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to i32**
  %139 = load i32*, i32** %sunkaddr56, align 8
  br label %140

; <label>:140:                                    ; preds = %140, %138
  %indvars.iv21 = phi i64 [ 0, %138 ], [ %indvars.iv.next22.1, %140 ]
  %141 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv21
  %142 = load i16, i16* %141, align 2
  %143 = zext i16 %142 to i64
  %144 = getelementptr inbounds [64 x i16], [64 x i16]* @start_pass_fdctmgr.aanscales, i64 0, i64 %indvars.iv21
  %145 = load i16, i16* %144, align 4
  %146 = sext i16 %145 to i64
  %147 = mul nsw i64 %146, %143
  %148 = add nsw i64 %147, 1024
  %149 = lshr i64 %148, 11
  %150 = trunc i64 %149 to i32
  %151 = getelementptr inbounds i32, i32* %139, i64 %indvars.iv21
  store i32 %150, i32* %151, align 4
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %152 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next22
  %153 = load i16, i16* %152, align 2
  %154 = zext i16 %153 to i64
  %155 = getelementptr inbounds [64 x i16], [64 x i16]* @start_pass_fdctmgr.aanscales, i64 0, i64 %indvars.iv.next22
  %156 = load i16, i16* %155, align 2
  %157 = sext i16 %156 to i64
  %158 = mul nsw i64 %157, %154
  %159 = add nsw i64 %158, 1024
  %160 = lshr i64 %159, 11
  %161 = trunc i64 %160 to i32
  %162 = getelementptr inbounds i32, i32* %139, i64 %indvars.iv.next22
  store i32 %161, i32* %162, align 4
  %indvars.iv.next22.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next22.1, 64
  br i1 %exitcond23.1, label %.loopexit.loopexit109, label %140

; <label>:163:                                    ; preds = %42
  %164 = getelementptr inbounds %struct.my_fdct_controller, %struct.my_fdct_controller* %4, i64 0, i32 4, i64 %28
  %165 = load float*, float** %164, align 8
  %166 = icmp eq float* %165, null
  br i1 %166, label %167, label %171

; <label>:167:                                    ; preds = %163
  %168 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr96, align 8
  %169 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %168, align 8
  %170 = tail call i8* %169(%struct.jpeg_common_struct* nonnull %23, i32 1, i64 256) #2
  %sunkaddr61 = shl nsw i64 %28, 3
  %sunkaddr62 = add i64 %22, %sunkaddr61
  %sunkaddr63 = add i64 %sunkaddr62, 64
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i8**
  store i8* %170, i8** %sunkaddr64, align 8
  br label %171

; <label>:171:                                    ; preds = %163, %167
  %sunkaddr66 = shl nsw i64 %28, 3
  %sunkaddr67 = add i64 %24, %sunkaddr66
  %sunkaddr68 = add i64 %sunkaddr67, 64
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to float**
  %172 = load float*, float** %sunkaddr69, align 8
  br label %173

; <label>:173:                                    ; preds = %173, %171
  %indvars.iv19 = phi i64 [ 0, %171 ], [ %indvars.iv.next20, %173 ]
  %indvars.iv = phi i64 [ 0, %171 ], [ %indvars.iv.next, %173 ]
  %174 = getelementptr inbounds [8 x double], [8 x double]* @start_pass_fdctmgr.aanscalefactor, i64 0, i64 %indvars.iv
  %175 = load double, double* %174, align 8
  %176 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv19
  %177 = load i16, i16* %176, align 2
  %178 = uitofp i16 %177 to double
  %179 = fmul double %178, %175
  %180 = fmul double %179, 8.000000e+00
  %181 = fdiv double 1.000000e+00, %180
  %182 = fptrunc double %181 to float
  %183 = getelementptr inbounds float, float* %172, i64 %indvars.iv19
  store float %182, float* %183, align 4
  %indvars.iv.next18 = or i64 %indvars.iv19, 1
  %184 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next18
  %185 = load i16, i16* %184, align 2
  %186 = uitofp i16 %185 to double
  %187 = fmul double %186, %175
  %188 = fmul double %187, 0x3FF63150B14861EF
  %189 = fmul double %188, 8.000000e+00
  %190 = fdiv double 1.000000e+00, %189
  %191 = fptrunc double %190 to float
  %192 = getelementptr inbounds float, float* %172, i64 %indvars.iv.next18
  store float %191, float* %192, align 4
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv.next18, 1
  %193 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next18.1
  %194 = load i16, i16* %193, align 2
  %195 = uitofp i16 %194 to double
  %196 = fmul double %195, %175
  %197 = fmul double %196, 0x3FF4E7AE914D6FCA
  %198 = fmul double %197, 8.000000e+00
  %199 = fdiv double 1.000000e+00, %198
  %200 = fptrunc double %199 to float
  %201 = getelementptr inbounds float, float* %172, i64 %indvars.iv.next18.1
  store float %200, float* %201, align 4
  %indvars.iv.next18.2 = or i64 %indvars.iv19, 3
  %202 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next18.2
  %203 = load i16, i16* %202, align 2
  %204 = uitofp i16 %203 to double
  %205 = fmul double %204, %175
  %206 = fmul double %205, 0x3FF2D062EF6C11AA
  %207 = fmul double %206, 8.000000e+00
  %208 = fdiv double 1.000000e+00, %207
  %209 = fptrunc double %208 to float
  %210 = getelementptr inbounds float, float* %172, i64 %indvars.iv.next18.2
  store float %209, float* %210, align 4
  %indvars.iv.next18.3 = add nuw nsw i64 %indvars.iv.next18.2, 1
  %211 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next18.3
  %212 = load i16, i16* %211, align 2
  %213 = uitofp i16 %212 to double
  %214 = fmul double %213, %175
  %215 = fmul double %214, 8.000000e+00
  %216 = fdiv double 1.000000e+00, %215
  %217 = fptrunc double %216 to float
  %218 = getelementptr inbounds float, float* %172, i64 %indvars.iv.next18.3
  store float %217, float* %218, align 4
  %indvars.iv.next18.4 = add nuw nsw i64 %indvars.iv.next18.2, 2
  %219 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next18.4
  %220 = load i16, i16* %219, align 2
  %221 = uitofp i16 %220 to double
  %222 = fmul double %221, %175
  %223 = fmul double %222, 0x3FE92469C0A7BF3B
  %224 = fmul double %223, 8.000000e+00
  %225 = fdiv double 1.000000e+00, %224
  %226 = fptrunc double %225 to float
  %227 = getelementptr inbounds float, float* %172, i64 %indvars.iv.next18.4
  store float %226, float* %227, align 4
  %indvars.iv.next18.5 = add nuw nsw i64 %indvars.iv.next18.2, 3
  %228 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next18.5
  %229 = load i16, i16* %228, align 2
  %230 = uitofp i16 %229 to double
  %231 = fmul double %230, %175
  %232 = fmul double %231, 5.411961e-01
  %233 = fmul double %232, 8.000000e+00
  %234 = fdiv double 1.000000e+00, %233
  %235 = fptrunc double %234 to float
  %236 = getelementptr inbounds float, float* %172, i64 %indvars.iv.next18.5
  store float %235, float* %236, align 4
  %indvars.iv.next18.6 = or i64 %indvars.iv19, 7
  %237 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i64 0, i32 0, i64 %indvars.iv.next18.6
  %238 = load i16, i16* %237, align 2
  %239 = uitofp i16 %238 to double
  %240 = fmul double %239, %175
  %241 = fmul double %240, 0x3FD1A855DE72AB5D
  %242 = fmul double %241, 8.000000e+00
  %243 = fdiv double 1.000000e+00, %242
  %244 = fptrunc double %243 to float
  %245 = getelementptr inbounds float, float* %172, i64 %indvars.iv.next18.6
  store float %244, float* %245, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 8
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %.loopexit.loopexit110, label %173

; <label>:246:                                    ; preds = %42
  %247 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %248 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %247, i64 0, i32 5
  store i32 47, i32* %248, align 8
  %249 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %250 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %249, align 8
  tail call void %250(%struct.jpeg_common_struct* nonnull %14) #2
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit.loopexit109:                            ; preds = %140
  br label %.loopexit

.loopexit.loopexit110:                            ; preds = %173
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit110, %.loopexit.loopexit109, %vector.body, %.loopexit.loopexit, %246
  %251 = add nuw nsw i32 %.0214, 1
  %252 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0413, i64 1
  %253 = load i32, i32* %sunkaddr99, align 4
  %254 = icmp slt i32 %251, %253
  br i1 %254, label %25, label %._crit_edge.loopexit

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
  %21 = icmp eq i32 %6, 0
  br i1 %21, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %7
  %wide.trip.count = zext i32 %6 to i64
  %scevgep26 = getelementptr i32, i32* %18, i64 64
  %scevgep28 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 1, i64 0
  %22 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 0, i64 0
  %23 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 0, i64 0
  %24 = bitcast i32* %scevgep26 to i16*
  %25 = bitcast i32* %scevgep28 to i16*
  br label %26

; <label>:26:                                     ; preds = %middle.block, %.lr.ph
  %indvars.iv14 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next15, %middle.block ]
  %.0410 = phi i32 [ %5, %.lr.ph ], [ %166, %middle.block ]
  %scevgep = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv14, i64 0
  %27 = add i64 %indvars.iv14, 1
  %scevgep24 = getelementptr [64 x i16], [64 x i16]* %3, i64 %27, i64 0
  %28 = zext i32 %.0410 to i64
  br label %29

; <label>:29:                                     ; preds = %29, %26
  %indvars.iv = phi i64 [ 0, %26 ], [ %indvars.iv.next, %29 ]
  %.036 = phi i32* [ %22, %26 ], [ %71, %29 ]
  %30 = getelementptr inbounds i8*, i8** %20, i64 %indvars.iv
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 %28
  %33 = getelementptr inbounds i8, i8* %32, i64 1
  %34 = load i8, i8* %32, align 1
  %35 = zext i8 %34 to i32
  %36 = add nsw i32 %35, -128
  %37 = getelementptr inbounds i32, i32* %.036, i64 1
  store i32 %36, i32* %.036, align 4
  %38 = getelementptr inbounds i8, i8* %33, i64 1
  %39 = load i8, i8* %33, align 1
  %40 = zext i8 %39 to i32
  %41 = add nsw i32 %40, -128
  %42 = getelementptr inbounds i32, i32* %.036, i64 2
  store i32 %41, i32* %37, align 4
  %43 = getelementptr inbounds i8, i8* %38, i64 1
  %44 = load i8, i8* %38, align 1
  %45 = zext i8 %44 to i32
  %46 = add nsw i32 %45, -128
  %47 = getelementptr inbounds i32, i32* %.036, i64 3
  store i32 %46, i32* %42, align 4
  %48 = getelementptr inbounds i8, i8* %43, i64 1
  %49 = load i8, i8* %43, align 1
  %50 = zext i8 %49 to i32
  %51 = add nsw i32 %50, -128
  %52 = getelementptr inbounds i32, i32* %.036, i64 4
  store i32 %51, i32* %47, align 4
  %53 = getelementptr inbounds i8, i8* %48, i64 1
  %54 = load i8, i8* %48, align 1
  %55 = zext i8 %54 to i32
  %56 = add nsw i32 %55, -128
  %57 = getelementptr inbounds i32, i32* %.036, i64 5
  store i32 %56, i32* %52, align 4
  %58 = getelementptr inbounds i8, i8* %53, i64 1
  %59 = load i8, i8* %53, align 1
  %60 = zext i8 %59 to i32
  %61 = add nsw i32 %60, -128
  %62 = getelementptr inbounds i32, i32* %.036, i64 6
  store i32 %61, i32* %57, align 4
  %63 = getelementptr inbounds i8, i8* %58, i64 1
  %64 = load i8, i8* %58, align 1
  %65 = zext i8 %64 to i32
  %66 = add nsw i32 %65, -128
  %67 = getelementptr inbounds i32, i32* %.036, i64 7
  store i32 %66, i32* %62, align 4
  %68 = load i8, i8* %63, align 1
  %69 = zext i8 %68 to i32
  %70 = add nsw i32 %69, -128
  store i32 %70, i32* %67, align 4
  %71 = getelementptr inbounds i32, i32* %.036, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %min.iters.checked, label %29

min.iters.checked:                                ; preds = %29
  call void %13(i32* nonnull %23) #2
  %bound0 = icmp ult i16* %scevgep, %24
  %72 = bitcast i16* %scevgep24 to i32*
  %bound1 = icmp ult i32* %18, %72
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ult i16* %scevgep, %25
  %73 = bitcast i16* %scevgep24 to [64 x i32]*
  %bound131 = icmp ult [64 x i32]* %8, %73
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

scalar.ph.preheader:                              ; preds = %min.iters.checked
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %pred.sdiv.continue49
  %index = phi i64 [ %index.next, %pred.sdiv.continue49 ], [ 0, %vector.body.preheader ]
  %74 = getelementptr inbounds i32, i32* %18, i64 %index
  %75 = bitcast i32* %74 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %75, align 4, !alias.scope !9
  %76 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 0, i64 %index
  %77 = bitcast i32* %76 to <4 x i32>*
  %wide.load33 = load <4 x i32>, <4 x i32>* %77, align 16, !alias.scope !12
  %78 = icmp slt <4 x i32> %wide.load33, zeroinitializer
  %79 = ashr <4 x i32> %wide.load, <i32 1, i32 1, i32 1, i32 1>
  %80 = add nsw <4 x i32> %wide.load33, %79
  %81 = icmp slt <4 x i32> %80, %wide.load
  %82 = xor <4 x i1> %78, <i1 true, i1 true, i1 true, i1 true>
  %83 = xor <4 x i1> %81, <i1 true, i1 true, i1 true, i1 true>
  %84 = and <4 x i1> %83, %82
  %85 = extractelement <4 x i1> %84, i32 0
  br i1 %85, label %pred.sdiv.if, label %pred.sdiv.continue

pred.sdiv.if:                                     ; preds = %vector.body
  %86 = extractelement <4 x i32> %80, i32 0
  %87 = extractelement <4 x i32> %wide.load, i32 0
  %88 = sdiv i32 %86, %87
  %89 = insertelement <4 x i32> undef, i32 %88, i32 0
  br label %pred.sdiv.continue

pred.sdiv.continue:                               ; preds = %pred.sdiv.if, %vector.body
  %90 = phi <4 x i32> [ undef, %vector.body ], [ %89, %pred.sdiv.if ]
  %91 = extractelement <4 x i1> %84, i32 1
  br i1 %91, label %pred.sdiv.if36, label %pred.sdiv.continue37

pred.sdiv.if36:                                   ; preds = %pred.sdiv.continue
  %92 = extractelement <4 x i32> %80, i32 1
  %93 = extractelement <4 x i32> %wide.load, i32 1
  %94 = sdiv i32 %92, %93
  %95 = insertelement <4 x i32> %90, i32 %94, i32 1
  br label %pred.sdiv.continue37

pred.sdiv.continue37:                             ; preds = %pred.sdiv.if36, %pred.sdiv.continue
  %96 = phi <4 x i32> [ %90, %pred.sdiv.continue ], [ %95, %pred.sdiv.if36 ]
  %97 = extractelement <4 x i1> %84, i32 2
  br i1 %97, label %pred.sdiv.if38, label %pred.sdiv.continue39

pred.sdiv.if38:                                   ; preds = %pred.sdiv.continue37
  %98 = extractelement <4 x i32> %80, i32 2
  %99 = extractelement <4 x i32> %wide.load, i32 2
  %100 = sdiv i32 %98, %99
  %101 = insertelement <4 x i32> %96, i32 %100, i32 2
  br label %pred.sdiv.continue39

pred.sdiv.continue39:                             ; preds = %pred.sdiv.if38, %pred.sdiv.continue37
  %102 = phi <4 x i32> [ %96, %pred.sdiv.continue37 ], [ %101, %pred.sdiv.if38 ]
  %103 = extractelement <4 x i1> %84, i32 3
  br i1 %103, label %pred.sdiv.if40, label %pred.sdiv.continue41

pred.sdiv.if40:                                   ; preds = %pred.sdiv.continue39
  %104 = extractelement <4 x i32> %80, i32 3
  %105 = extractelement <4 x i32> %wide.load, i32 3
  %106 = sdiv i32 %104, %105
  %107 = insertelement <4 x i32> %102, i32 %106, i32 3
  br label %pred.sdiv.continue41

pred.sdiv.continue41:                             ; preds = %pred.sdiv.if40, %pred.sdiv.continue39
  %108 = phi <4 x i32> [ %102, %pred.sdiv.continue39 ], [ %107, %pred.sdiv.if40 ]
  %109 = sub <4 x i32> %79, %wide.load33
  %110 = icmp slt <4 x i32> %109, %wide.load
  %111 = xor <4 x i1> %110, <i1 true, i1 true, i1 true, i1 true>
  %112 = and <4 x i1> %78, %111
  %113 = extractelement <4 x i1> %112, i32 0
  br i1 %113, label %pred.sdiv.if42, label %pred.sdiv.continue43

pred.sdiv.if42:                                   ; preds = %pred.sdiv.continue41
  %114 = extractelement <4 x i32> %109, i32 0
  %115 = extractelement <4 x i32> %wide.load, i32 0
  %116 = sdiv i32 %114, %115
  %117 = insertelement <4 x i32> undef, i32 %116, i32 0
  br label %pred.sdiv.continue43

pred.sdiv.continue43:                             ; preds = %pred.sdiv.if42, %pred.sdiv.continue41
  %118 = phi <4 x i32> [ undef, %pred.sdiv.continue41 ], [ %117, %pred.sdiv.if42 ]
  %119 = extractelement <4 x i1> %112, i32 1
  br i1 %119, label %pred.sdiv.if44, label %pred.sdiv.continue45

pred.sdiv.if44:                                   ; preds = %pred.sdiv.continue43
  %120 = extractelement <4 x i32> %109, i32 1
  %121 = extractelement <4 x i32> %wide.load, i32 1
  %122 = sdiv i32 %120, %121
  %123 = insertelement <4 x i32> %118, i32 %122, i32 1
  br label %pred.sdiv.continue45

pred.sdiv.continue45:                             ; preds = %pred.sdiv.if44, %pred.sdiv.continue43
  %124 = phi <4 x i32> [ %118, %pred.sdiv.continue43 ], [ %123, %pred.sdiv.if44 ]
  %125 = extractelement <4 x i1> %112, i32 2
  br i1 %125, label %pred.sdiv.if46, label %pred.sdiv.continue47

pred.sdiv.if46:                                   ; preds = %pred.sdiv.continue45
  %126 = extractelement <4 x i32> %109, i32 2
  %127 = extractelement <4 x i32> %wide.load, i32 2
  %128 = sdiv i32 %126, %127
  %129 = insertelement <4 x i32> %124, i32 %128, i32 2
  br label %pred.sdiv.continue47

pred.sdiv.continue47:                             ; preds = %pred.sdiv.if46, %pred.sdiv.continue45
  %130 = phi <4 x i32> [ %124, %pred.sdiv.continue45 ], [ %129, %pred.sdiv.if46 ]
  %131 = extractelement <4 x i1> %112, i32 3
  br i1 %131, label %pred.sdiv.if48, label %pred.sdiv.continue49

pred.sdiv.if48:                                   ; preds = %pred.sdiv.continue47
  %132 = extractelement <4 x i32> %109, i32 3
  %133 = extractelement <4 x i32> %wide.load, i32 3
  %134 = sdiv i32 %132, %133
  %135 = insertelement <4 x i32> %130, i32 %134, i32 3
  br label %pred.sdiv.continue49

pred.sdiv.continue49:                             ; preds = %pred.sdiv.if48, %pred.sdiv.continue47
  %136 = phi <4 x i32> [ %130, %pred.sdiv.continue47 ], [ %135, %pred.sdiv.if48 ]
  %137 = and <4 x i1> %110, %78
  %.op = sub <4 x i32> zeroinitializer, %136
  %138 = select <4 x i1> %137, <4 x i32> zeroinitializer, <4 x i32> %.op
  %predphi34 = select <4 x i1> %84, <4 x i32> %108, <4 x i32> %138
  %139 = and <4 x i1> %81, %82
  %140 = trunc <4 x i32> %predphi34 to <4 x i16>
  %141 = select <4 x i1> %139, <4 x i16> zeroinitializer, <4 x i16> %140
  %142 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 %indvars.iv14, i64 %index
  %143 = bitcast i16* %142 to <4 x i16>*
  store <4 x i16> %141, <4 x i16>* %143, align 2, !alias.scope !14, !noalias !16
  %index.next = add i64 %index, 4
  %144 = icmp eq i64 %index.next, 64
  br i1 %144, label %middle.block.loopexit50, label %vector.body, !llvm.loop !17

scalar.ph:                                        ; preds = %scalar.ph.preheader, %163
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %163 ], [ 0, %scalar.ph.preheader ]
  %145 = getelementptr inbounds i32, i32* %18, i64 %indvars.iv11
  %146 = load i32, i32* %145, align 4
  %147 = getelementptr inbounds [64 x i32], [64 x i32]* %8, i64 0, i64 %indvars.iv11
  %148 = load i32, i32* %147, align 4
  %149 = icmp slt i32 %148, 0
  %150 = ashr i32 %146, 1
  br i1 %149, label %151, label %158

; <label>:151:                                    ; preds = %scalar.ph
  %152 = sub i32 %150, %148
  %153 = icmp slt i32 %152, %146
  br i1 %153, label %156, label %154

; <label>:154:                                    ; preds = %151
  %155 = sdiv i32 %152, %146
  br label %156

; <label>:156:                                    ; preds = %151, %154
  %.01 = phi i32 [ %155, %154 ], [ 0, %151 ]
  %157 = sub nsw i32 0, %.01
  br label %163

; <label>:158:                                    ; preds = %scalar.ph
  %159 = add nsw i32 %148, %150
  %160 = icmp slt i32 %159, %146
  br i1 %160, label %163, label %161

; <label>:161:                                    ; preds = %158
  %162 = sdiv i32 %159, %146
  br label %163

; <label>:163:                                    ; preds = %158, %161, %156
  %.2 = phi i32 [ %157, %156 ], [ %162, %161 ], [ 0, %158 ]
  %164 = trunc i32 %.2 to i16
  %165 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 %indvars.iv14, i64 %indvars.iv11
  store i16 %164, i16* %165, align 2
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 64
  br i1 %exitcond13, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !18

middle.block.loopexit:                            ; preds = %163
  br label %middle.block

middle.block.loopexit50:                          ; preds = %pred.sdiv.continue49
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit50, %middle.block.loopexit
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %166 = add i32 %.0410, 8
  %exitcond16 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond16, label %._crit_edge.loopexit, label %26

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
  %21 = icmp eq i32 %6, 0
  br i1 %21, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %7
  %wide.trip.count = zext i32 %6 to i64
  %scevgep23 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 1, i64 0
  %scevgep25 = getelementptr float, float* %18, i64 64
  %22 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 0
  %23 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 0
  %24 = bitcast float* %scevgep23 to i16*
  %25 = bitcast float* %scevgep25 to i16*
  %26 = bitcast [64 x float]* %8 to <8 x float>*
  %27 = bitcast float* %18 to <8 x float>*
  %28 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 8
  %29 = bitcast float* %28 to <8 x float>*
  %30 = getelementptr inbounds float, float* %18, i64 8
  %31 = bitcast float* %30 to <8 x float>*
  %32 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 16
  %33 = bitcast float* %32 to <8 x float>*
  %34 = getelementptr inbounds float, float* %18, i64 16
  %35 = bitcast float* %34 to <8 x float>*
  %36 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 24
  %37 = bitcast float* %36 to <8 x float>*
  %38 = getelementptr inbounds float, float* %18, i64 24
  %39 = bitcast float* %38 to <8 x float>*
  %40 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 32
  %41 = bitcast float* %40 to <8 x float>*
  %42 = getelementptr inbounds float, float* %18, i64 32
  %43 = bitcast float* %42 to <8 x float>*
  %44 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 40
  %45 = bitcast float* %44 to <8 x float>*
  %46 = getelementptr inbounds float, float* %18, i64 40
  %47 = bitcast float* %46 to <8 x float>*
  %48 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 48
  %49 = bitcast float* %48 to <8 x float>*
  %50 = getelementptr inbounds float, float* %18, i64 48
  %51 = bitcast float* %50 to <8 x float>*
  %52 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 56
  %53 = bitcast float* %52 to <8 x float>*
  %54 = getelementptr inbounds float, float* %18, i64 56
  %55 = bitcast float* %54 to <8 x float>*
  br label %56

; <label>:56:                                     ; preds = %middle.block, %.lr.ph
  %indvars.iv13 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next14, %middle.block ]
  %.048 = phi i32 [ %5, %.lr.ph ], [ %244, %middle.block ]
  %scevgep = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 0
  %57 = add i64 %indvars.iv13, 1
  %scevgep21 = getelementptr [64 x i16], [64 x i16]* %3, i64 %57, i64 0
  %58 = zext i32 %.048 to i64
  br label %59

; <label>:59:                                     ; preds = %59, %56
  %indvars.iv = phi i64 [ 0, %56 ], [ %indvars.iv.next, %59 ]
  %.025 = phi float* [ %22, %56 ], [ %109, %59 ]
  %60 = getelementptr inbounds i8*, i8** %20, i64 %indvars.iv
  %61 = load i8*, i8** %60, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 %58
  %63 = getelementptr inbounds i8, i8* %62, i64 1
  %64 = load i8, i8* %62, align 1
  %65 = zext i8 %64 to i32
  %66 = add nsw i32 %65, -128
  %67 = sitofp i32 %66 to float
  %68 = getelementptr inbounds float, float* %.025, i64 1
  store float %67, float* %.025, align 4
  %69 = getelementptr inbounds i8, i8* %63, i64 1
  %70 = load i8, i8* %63, align 1
  %71 = zext i8 %70 to i32
  %72 = add nsw i32 %71, -128
  %73 = sitofp i32 %72 to float
  %74 = getelementptr inbounds float, float* %.025, i64 2
  store float %73, float* %68, align 4
  %75 = getelementptr inbounds i8, i8* %69, i64 1
  %76 = load i8, i8* %69, align 1
  %77 = zext i8 %76 to i32
  %78 = add nsw i32 %77, -128
  %79 = sitofp i32 %78 to float
  %80 = getelementptr inbounds float, float* %.025, i64 3
  store float %79, float* %74, align 4
  %81 = getelementptr inbounds i8, i8* %75, i64 1
  %82 = load i8, i8* %75, align 1
  %83 = zext i8 %82 to i32
  %84 = add nsw i32 %83, -128
  %85 = sitofp i32 %84 to float
  %86 = getelementptr inbounds float, float* %.025, i64 4
  store float %85, float* %80, align 4
  %87 = getelementptr inbounds i8, i8* %81, i64 1
  %88 = load i8, i8* %81, align 1
  %89 = zext i8 %88 to i32
  %90 = add nsw i32 %89, -128
  %91 = sitofp i32 %90 to float
  %92 = getelementptr inbounds float, float* %.025, i64 5
  store float %91, float* %86, align 4
  %93 = getelementptr inbounds i8, i8* %87, i64 1
  %94 = load i8, i8* %87, align 1
  %95 = zext i8 %94 to i32
  %96 = add nsw i32 %95, -128
  %97 = sitofp i32 %96 to float
  %98 = getelementptr inbounds float, float* %.025, i64 6
  store float %97, float* %92, align 4
  %99 = getelementptr inbounds i8, i8* %93, i64 1
  %100 = load i8, i8* %93, align 1
  %101 = zext i8 %100 to i32
  %102 = add nsw i32 %101, -128
  %103 = sitofp i32 %102 to float
  %104 = getelementptr inbounds float, float* %.025, i64 7
  store float %103, float* %98, align 4
  %105 = load i8, i8* %99, align 1
  %106 = zext i8 %105 to i32
  %107 = add nsw i32 %106, -128
  %108 = sitofp i32 %107 to float
  store float %108, float* %104, align 4
  %109 = getelementptr inbounds float, float* %.025, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %min.iters.checked, label %59

min.iters.checked:                                ; preds = %59
  call void %13(float* nonnull %23) #2
  %bound0 = icmp ult i16* %scevgep, %24
  %110 = bitcast i16* %scevgep21 to [64 x float]*
  %bound1 = icmp ult [64 x float]* %8, %110
  %found.conflict = and i1 %bound0, %bound1
  %bound027 = icmp ult i16* %scevgep, %25
  %111 = bitcast i16* %scevgep21 to float*
  %bound128 = icmp ult float* %18, %111
  %found.conflict29 = and i1 %bound027, %bound128
  %conflict.rdx = or i1 %found.conflict, %found.conflict29
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

scalar.ph.preheader:                              ; preds = %min.iters.checked
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader
  %wide.vec = load <8 x float>, <8 x float>* %26, align 16, !alias.scope !19
  %wide.vec31 = load <8 x float>, <8 x float>* %27, align 4, !alias.scope !22
  %112 = fmul <8 x float> %wide.vec, %wide.vec31
  %113 = shufflevector <8 x float> %112, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %114 = fadd <4 x float> %113, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %115 = fptosi <4 x float> %114 to <4 x i32>
  %116 = add <4 x i32> %115, <i32 49152, i32 49152, i32 49152, i32 49152>
  %117 = trunc <4 x i32> %116 to <4 x i16>
  %118 = fmul <8 x float> %wide.vec, %wide.vec31
  %119 = shufflevector <8 x float> %118, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %120 = fadd <4 x float> %119, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %121 = fptosi <4 x float> %120 to <4 x i32>
  %122 = add <4 x i32> %121, <i32 49152, i32 49152, i32 49152, i32 49152>
  %123 = trunc <4 x i32> %122 to <4 x i16>
  %124 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 0
  %125 = bitcast i16* %124 to <8 x i16>*
  %interleaved.vec = shufflevector <4 x i16> %117, <4 x i16> %123, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec, <8 x i16>* %125, align 2, !alias.scope !24, !noalias !26
  %wide.vec.1 = load <8 x float>, <8 x float>* %29, align 16, !alias.scope !19
  %wide.vec31.1 = load <8 x float>, <8 x float>* %31, align 4, !alias.scope !22
  %126 = fmul <8 x float> %wide.vec.1, %wide.vec31.1
  %127 = shufflevector <8 x float> %126, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %128 = fadd <4 x float> %127, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %129 = fptosi <4 x float> %128 to <4 x i32>
  %130 = add <4 x i32> %129, <i32 49152, i32 49152, i32 49152, i32 49152>
  %131 = trunc <4 x i32> %130 to <4 x i16>
  %132 = fmul <8 x float> %wide.vec.1, %wide.vec31.1
  %133 = shufflevector <8 x float> %132, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %134 = fadd <4 x float> %133, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %135 = fptosi <4 x float> %134 to <4 x i32>
  %136 = add <4 x i32> %135, <i32 49152, i32 49152, i32 49152, i32 49152>
  %137 = trunc <4 x i32> %136 to <4 x i16>
  %138 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 8
  %139 = bitcast i16* %138 to <8 x i16>*
  %interleaved.vec.1 = shufflevector <4 x i16> %131, <4 x i16> %137, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.1, <8 x i16>* %139, align 2, !alias.scope !24, !noalias !26
  %wide.vec.2 = load <8 x float>, <8 x float>* %33, align 16, !alias.scope !19
  %wide.vec31.2 = load <8 x float>, <8 x float>* %35, align 4, !alias.scope !22
  %140 = fmul <8 x float> %wide.vec.2, %wide.vec31.2
  %141 = shufflevector <8 x float> %140, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %142 = fadd <4 x float> %141, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %143 = fptosi <4 x float> %142 to <4 x i32>
  %144 = add <4 x i32> %143, <i32 49152, i32 49152, i32 49152, i32 49152>
  %145 = trunc <4 x i32> %144 to <4 x i16>
  %146 = fmul <8 x float> %wide.vec.2, %wide.vec31.2
  %147 = shufflevector <8 x float> %146, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %148 = fadd <4 x float> %147, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %149 = fptosi <4 x float> %148 to <4 x i32>
  %150 = add <4 x i32> %149, <i32 49152, i32 49152, i32 49152, i32 49152>
  %151 = trunc <4 x i32> %150 to <4 x i16>
  %152 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 16
  %153 = bitcast i16* %152 to <8 x i16>*
  %interleaved.vec.2 = shufflevector <4 x i16> %145, <4 x i16> %151, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.2, <8 x i16>* %153, align 2, !alias.scope !24, !noalias !26
  %wide.vec.3 = load <8 x float>, <8 x float>* %37, align 16, !alias.scope !19
  %wide.vec31.3 = load <8 x float>, <8 x float>* %39, align 4, !alias.scope !22
  %154 = fmul <8 x float> %wide.vec.3, %wide.vec31.3
  %155 = shufflevector <8 x float> %154, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %156 = fadd <4 x float> %155, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %157 = fptosi <4 x float> %156 to <4 x i32>
  %158 = add <4 x i32> %157, <i32 49152, i32 49152, i32 49152, i32 49152>
  %159 = trunc <4 x i32> %158 to <4 x i16>
  %160 = fmul <8 x float> %wide.vec.3, %wide.vec31.3
  %161 = shufflevector <8 x float> %160, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %162 = fadd <4 x float> %161, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %163 = fptosi <4 x float> %162 to <4 x i32>
  %164 = add <4 x i32> %163, <i32 49152, i32 49152, i32 49152, i32 49152>
  %165 = trunc <4 x i32> %164 to <4 x i16>
  %166 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 24
  %167 = bitcast i16* %166 to <8 x i16>*
  %interleaved.vec.3 = shufflevector <4 x i16> %159, <4 x i16> %165, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.3, <8 x i16>* %167, align 2, !alias.scope !24, !noalias !26
  %wide.vec.4 = load <8 x float>, <8 x float>* %41, align 16, !alias.scope !19
  %wide.vec31.4 = load <8 x float>, <8 x float>* %43, align 4, !alias.scope !22
  %168 = fmul <8 x float> %wide.vec.4, %wide.vec31.4
  %169 = shufflevector <8 x float> %168, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %170 = fadd <4 x float> %169, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %171 = fptosi <4 x float> %170 to <4 x i32>
  %172 = add <4 x i32> %171, <i32 49152, i32 49152, i32 49152, i32 49152>
  %173 = trunc <4 x i32> %172 to <4 x i16>
  %174 = fmul <8 x float> %wide.vec.4, %wide.vec31.4
  %175 = shufflevector <8 x float> %174, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %176 = fadd <4 x float> %175, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %177 = fptosi <4 x float> %176 to <4 x i32>
  %178 = add <4 x i32> %177, <i32 49152, i32 49152, i32 49152, i32 49152>
  %179 = trunc <4 x i32> %178 to <4 x i16>
  %180 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 32
  %181 = bitcast i16* %180 to <8 x i16>*
  %interleaved.vec.4 = shufflevector <4 x i16> %173, <4 x i16> %179, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.4, <8 x i16>* %181, align 2, !alias.scope !24, !noalias !26
  %wide.vec.5 = load <8 x float>, <8 x float>* %45, align 16, !alias.scope !19
  %wide.vec31.5 = load <8 x float>, <8 x float>* %47, align 4, !alias.scope !22
  %182 = fmul <8 x float> %wide.vec.5, %wide.vec31.5
  %183 = shufflevector <8 x float> %182, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %184 = fadd <4 x float> %183, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %185 = fptosi <4 x float> %184 to <4 x i32>
  %186 = add <4 x i32> %185, <i32 49152, i32 49152, i32 49152, i32 49152>
  %187 = trunc <4 x i32> %186 to <4 x i16>
  %188 = fmul <8 x float> %wide.vec.5, %wide.vec31.5
  %189 = shufflevector <8 x float> %188, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %190 = fadd <4 x float> %189, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %191 = fptosi <4 x float> %190 to <4 x i32>
  %192 = add <4 x i32> %191, <i32 49152, i32 49152, i32 49152, i32 49152>
  %193 = trunc <4 x i32> %192 to <4 x i16>
  %194 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 40
  %195 = bitcast i16* %194 to <8 x i16>*
  %interleaved.vec.5 = shufflevector <4 x i16> %187, <4 x i16> %193, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.5, <8 x i16>* %195, align 2, !alias.scope !24, !noalias !26
  %wide.vec.6 = load <8 x float>, <8 x float>* %49, align 16, !alias.scope !19
  %wide.vec31.6 = load <8 x float>, <8 x float>* %51, align 4, !alias.scope !22
  %196 = fmul <8 x float> %wide.vec.6, %wide.vec31.6
  %197 = shufflevector <8 x float> %196, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %198 = fadd <4 x float> %197, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %199 = fptosi <4 x float> %198 to <4 x i32>
  %200 = add <4 x i32> %199, <i32 49152, i32 49152, i32 49152, i32 49152>
  %201 = trunc <4 x i32> %200 to <4 x i16>
  %202 = fmul <8 x float> %wide.vec.6, %wide.vec31.6
  %203 = shufflevector <8 x float> %202, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %204 = fadd <4 x float> %203, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %205 = fptosi <4 x float> %204 to <4 x i32>
  %206 = add <4 x i32> %205, <i32 49152, i32 49152, i32 49152, i32 49152>
  %207 = trunc <4 x i32> %206 to <4 x i16>
  %208 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 48
  %209 = bitcast i16* %208 to <8 x i16>*
  %interleaved.vec.6 = shufflevector <4 x i16> %201, <4 x i16> %207, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.6, <8 x i16>* %209, align 2, !alias.scope !24, !noalias !26
  %wide.vec.7 = load <8 x float>, <8 x float>* %53, align 16, !alias.scope !19
  %wide.vec31.7 = load <8 x float>, <8 x float>* %55, align 4, !alias.scope !22
  %210 = fmul <8 x float> %wide.vec.7, %wide.vec31.7
  %211 = shufflevector <8 x float> %210, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %212 = fadd <4 x float> %211, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %213 = fptosi <4 x float> %212 to <4 x i32>
  %214 = add <4 x i32> %213, <i32 49152, i32 49152, i32 49152, i32 49152>
  %215 = trunc <4 x i32> %214 to <4 x i16>
  %216 = fmul <8 x float> %wide.vec.7, %wide.vec31.7
  %217 = shufflevector <8 x float> %216, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %218 = fadd <4 x float> %217, <float 1.638450e+04, float 1.638450e+04, float 1.638450e+04, float 1.638450e+04>
  %219 = fptosi <4 x float> %218 to <4 x i32>
  %220 = add <4 x i32> %219, <i32 49152, i32 49152, i32 49152, i32 49152>
  %221 = trunc <4 x i32> %220 to <4 x i16>
  %222 = getelementptr [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 56
  %223 = bitcast i16* %222 to <8 x i16>*
  %interleaved.vec.7 = shufflevector <4 x i16> %215, <4 x i16> %221, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x i16> %interleaved.vec.7, <8 x i16>* %223, align 2, !alias.scope !24, !noalias !26
  br label %middle.block

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv10 = phi i64 [ %indvars.iv.next11.1, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %224 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 %indvars.iv10
  %225 = load float, float* %224, align 8
  %226 = getelementptr inbounds float, float* %18, i64 %indvars.iv10
  %227 = load float, float* %226, align 4
  %228 = fmul float %225, %227
  %229 = fadd float %228, 1.638450e+04
  %230 = fptosi float %229 to i32
  %231 = add i32 %230, 49152
  %232 = trunc i32 %231 to i16
  %233 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 %indvars.iv10
  store i16 %232, i16* %233, align 2
  %indvars.iv.next11 = or i64 %indvars.iv10, 1
  %234 = getelementptr inbounds [64 x float], [64 x float]* %8, i64 0, i64 %indvars.iv.next11
  %235 = load float, float* %234, align 4
  %236 = getelementptr inbounds float, float* %18, i64 %indvars.iv.next11
  %237 = load float, float* %236, align 4
  %238 = fmul float %235, %237
  %239 = fadd float %238, 1.638450e+04
  %240 = fptosi float %239 to i32
  %241 = add i32 %240, 49152
  %242 = trunc i32 %241 to i16
  %243 = getelementptr inbounds [64 x i16], [64 x i16]* %3, i64 %indvars.iv13, i64 %indvars.iv.next11
  store i16 %242, i16* %243, align 2
  %indvars.iv.next11.1 = add nuw nsw i64 %indvars.iv10, 2
  %exitcond12.1 = icmp eq i64 %indvars.iv.next11.1, 64
  br i1 %exitcond12.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !27

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block:                                     ; preds = %vector.body, %middle.block.loopexit
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %244 = add i32 %.048, 8
  %exitcond15 = icmp eq i64 %indvars.iv.next14, %wide.trip.count
  br i1 %exitcond15, label %._crit_edge.loopexit, label %56

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
