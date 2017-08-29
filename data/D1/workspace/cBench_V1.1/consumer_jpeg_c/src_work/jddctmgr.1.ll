; ModuleID = 'jddctmgr.ll'
source_filename = "jddctmgr.c"
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
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.my_idct_controller = type { %struct.jpeg_inverse_dct, [10 x i32] }

@start_pass.aanscales = internal unnamed_addr constant [64 x i16] [i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 22725, i16 31521, i16 29692, i16 26722, i16 22725, i16 17855, i16 12299, i16 6270, i16 21407, i16 29692, i16 27969, i16 25172, i16 21407, i16 16819, i16 11585, i16 5906, i16 19266, i16 26722, i16 25172, i16 22654, i16 19266, i16 15137, i16 10426, i16 5315, i16 16384, i16 22725, i16 21407, i16 19266, i16 16384, i16 12873, i16 8867, i16 4520, i16 12873, i16 17855, i16 16819, i16 15137, i16 12873, i16 10114, i16 6967, i16 3552, i16 8867, i16 12299, i16 11585, i16 10426, i16 8867, i16 6967, i16 4799, i16 2446, i16 4520, i16 6270, i16 5906, i16 5315, i16 4520, i16 3552, i16 2446, i16 1247], align 16
@start_pass.aanscalefactor = internal unnamed_addr constant [8 x double] [double 1.000000e+00, double 0x3FF63150B14861EF, double 0x3FF4E7AE914D6FCA, double 0x3FF2D062EF6C11AA, double 1.000000e+00, double 0x3FE92469C0A7BF3B, double 5.411961e-01, double 0x3FD1A855DE72AB5D], align 16
@switch.table = private unnamed_addr constant [3 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] [void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_islow, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_ifast, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* @jpeg_idct_float]

; Function Attrs: noinline nounwind uwtable
define void @jinit_inverse_dct(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 128) #3
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 80
  %9 = bitcast %struct.jpeg_inverse_dct** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_pass, void (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %12 = load i32, i32* %11, align 8
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %15 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %16 = ptrtoint i8* %7 to i64
  %17 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr16 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 8
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr, 48
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  br label %18

; <label>:18:                                     ; preds = %18, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %18 ]
  %.03 = phi %struct.jpeg_component_info* [ %15, %.lr.ph ], [ %23, %18 ]
  %19 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr18, align 8
  %20 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %19, align 8
  %21 = tail call i8* %20(%struct.jpeg_common_struct* nonnull %17, i32 1, i64 256) #3
  %22 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 20
  store i8* %21, i8** %22, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %21, i8 0, i64 256, i32 1, i1 false)
  %sunkaddr7 = shl i64 %indvars.iv, 2
  %sunkaddr8 = add i64 %16, %sunkaddr7
  %sunkaddr9 = add i64 %sunkaddr8, 88
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i32*
  store i32 -1, i32* %sunkaddr10, align 4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %23 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %24 = load i32, i32* %sunkaddr20, align 8
  %25 = sext i32 %24 to i64
  %26 = icmp slt i64 %indvars.iv.next, %25
  br i1 %26, label %18, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %18
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 80
  %3 = bitcast %struct.jpeg_inverse_dct** %2 to %struct.my_idct_controller**
  %4 = load %struct.my_idct_controller*, %struct.my_idct_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %6 = load i32, i32* %5, align 8
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 43
  %9 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %11 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %12 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr66 = add i64 %sunkaddr, 48
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to i32*
  %13 = ptrtoint %struct.my_idct_controller* %4 to i64
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %16 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr63 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr64 = add i64 %sunkaddr63, 88
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i32*
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %19 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  br label %20

; <label>:20:                                     ; preds = %.loopexit, %.lr.ph
  %indvars.iv35 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next36, %.loopexit ]
  %.0421 = phi %struct.jpeg_component_info* [ %9, %.lr.ph ], [ %169, %.loopexit ]
  %.0520 = phi i32 [ 0, %.lr.ph ], [ %.27, %.loopexit ]
  %.0819 = phi void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* [ null, %.lr.ph ], [ %.210, %.loopexit ]
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0421, i64 0, i32 9
  %22 = load i32, i32* %21, align 4
  switch i32 %22, label %34 [
    i32 1, label %._crit_edge54
    i32 2, label %23
    i32 4, label %24
    i32 8, label %25
  ]

; <label>:23:                                     ; preds = %20
  br label %._crit_edge54

; <label>:24:                                     ; preds = %20
  br label %._crit_edge54

; <label>:25:                                     ; preds = %20
  %26 = load i32, i32* %sunkaddr65, align 8
  %27 = icmp ult i32 %26, 3
  br i1 %27, label %switch.lookup, label %28

; <label>:28:                                     ; preds = %25
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 5
  store i32 47, i32* %30, align 8
  %31 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %19, align 8
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  tail call void %32(%struct.jpeg_common_struct* nonnull %18) #3
  br label %._crit_edge54

switch.lookup:                                    ; preds = %25
  %33 = sext i32 %26 to i64
  %switch.gep = getelementptr inbounds [3 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*], [3 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*]* @switch.table, i64 0, i64 %33
  %switch.load = load void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %switch.gep, align 8
  br label %._crit_edge54

; <label>:34:                                     ; preds = %20
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 5
  store i32 6, i32* %36, align 8
  %sunkaddr41 = ptrtoint %struct.jpeg_component_info* %.0421 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 36
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i32*
  %37 = load i32, i32* %sunkaddr43, align 4
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i64 0, i32 6, i32 0, i64 0
  store i32 %37, i32* %39, align 4
  %40 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  tail call void %41(%struct.jpeg_common_struct* %11) #3
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %20, %28, %switch.lookup, %34, %24, %23
  %.210 = phi void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* [ %.0819, %34 ], [ @jpeg_idct_4x4, %24 ], [ @jpeg_idct_2x2, %23 ], [ %.0819, %28 ], [ %switch.load, %switch.lookup ], [ @jpeg_idct_1x1, %20 ]
  %.27 = phi i32 [ %.0520, %34 ], [ 0, %24 ], [ 0, %23 ], [ %.0520, %28 ], [ %26, %switch.lookup ], [ 0, %20 ]
  %42 = getelementptr inbounds %struct.my_idct_controller, %struct.my_idct_controller* %4, i64 0, i32 0, i32 1, i64 %indvars.iv35
  store void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)* %.210, void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)** %42, align 8
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0421, i64 0, i32 12
  %44 = load i32, i32* %43, align 8
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %.loopexit, label %46

; <label>:46:                                     ; preds = %._crit_edge54
  %47 = getelementptr inbounds %struct.my_idct_controller, %struct.my_idct_controller* %4, i64 0, i32 1, i64 %indvars.iv35
  %48 = load i32, i32* %47, align 4
  %49 = icmp eq i32 %48, %.27
  br i1 %49, label %.loopexit, label %50

; <label>:50:                                     ; preds = %46
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0421, i64 0, i32 19
  %52 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %51, align 8
  %53 = icmp eq %struct.JQUANT_TBL* %52, null
  br i1 %53, label %.loopexit, label %54

; <label>:54:                                     ; preds = %50
  %sunkaddr45 = shl i64 %indvars.iv35, 2
  %sunkaddr46 = add i64 %13, %sunkaddr45
  %sunkaddr47 = add i64 %sunkaddr46, 88
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i32*
  store i32 %.27, i32* %sunkaddr48, align 4
  switch i32 %.27, label %164 [
    i32 0, label %55
    i32 1, label %76
    i32 2, label %103
  ]

; <label>:55:                                     ; preds = %54
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0421, i64 0, i32 20
  %57 = bitcast i8** %56 to i32**
  %58 = load i32*, i32** %57, align 8
  br label %59

; <label>:59:                                     ; preds = %59, %55
  %indvars.iv32 = phi i64 [ 0, %55 ], [ %indvars.iv.next33.3, %59 ]
  %60 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv32
  %61 = load i16, i16* %60, align 2
  %62 = zext i16 %61 to i32
  %63 = getelementptr inbounds i32, i32* %58, i64 %indvars.iv32
  store i32 %62, i32* %63, align 4
  %indvars.iv.next33 = or i64 %indvars.iv32, 1
  %64 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next33
  %65 = load i16, i16* %64, align 2
  %66 = zext i16 %65 to i32
  %67 = getelementptr inbounds i32, i32* %58, i64 %indvars.iv.next33
  store i32 %66, i32* %67, align 4
  %indvars.iv.next33.1 = or i64 %indvars.iv32, 2
  %68 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next33.1
  %69 = load i16, i16* %68, align 2
  %70 = zext i16 %69 to i32
  %71 = getelementptr inbounds i32, i32* %58, i64 %indvars.iv.next33.1
  store i32 %70, i32* %71, align 4
  %indvars.iv.next33.2 = or i64 %indvars.iv32, 3
  %72 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next33.2
  %73 = load i16, i16* %72, align 2
  %74 = zext i16 %73 to i32
  %75 = getelementptr inbounds i32, i32* %58, i64 %indvars.iv.next33.2
  store i32 %74, i32* %75, align 4
  %indvars.iv.next33.3 = add nuw nsw i64 %indvars.iv32, 4
  %exitcond34.3 = icmp eq i64 %indvars.iv.next33.3, 64
  br i1 %exitcond34.3, label %.loopexit.loopexit, label %59

; <label>:76:                                     ; preds = %54
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0421, i64 0, i32 20
  %78 = bitcast i8** %77 to i32**
  %79 = load i32*, i32** %78, align 8
  br label %80

; <label>:80:                                     ; preds = %80, %76
  %indvars.iv29 = phi i64 [ 0, %76 ], [ %indvars.iv.next30.1, %80 ]
  %81 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv29
  %82 = load i16, i16* %81, align 2
  %83 = zext i16 %82 to i64
  %84 = getelementptr inbounds [64 x i16], [64 x i16]* @start_pass.aanscales, i64 0, i64 %indvars.iv29
  %85 = load i16, i16* %84, align 4
  %86 = sext i16 %85 to i64
  %87 = mul nsw i64 %86, %83
  %88 = add nsw i64 %87, 2048
  %89 = lshr i64 %88, 12
  %90 = trunc i64 %89 to i32
  %91 = getelementptr inbounds i32, i32* %79, i64 %indvars.iv29
  store i32 %90, i32* %91, align 4
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %92 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next30
  %93 = load i16, i16* %92, align 2
  %94 = zext i16 %93 to i64
  %95 = getelementptr inbounds [64 x i16], [64 x i16]* @start_pass.aanscales, i64 0, i64 %indvars.iv.next30
  %96 = load i16, i16* %95, align 2
  %97 = sext i16 %96 to i64
  %98 = mul nsw i64 %97, %94
  %99 = add nsw i64 %98, 2048
  %100 = lshr i64 %99, 12
  %101 = trunc i64 %100 to i32
  %102 = getelementptr inbounds i32, i32* %79, i64 %indvars.iv.next30
  store i32 %101, i32* %102, align 4
  %indvars.iv.next30.1 = add nuw nsw i64 %indvars.iv29, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next30.1, 64
  br i1 %exitcond31.1, label %.loopexit.loopexit70, label %80

; <label>:103:                                    ; preds = %54
  %104 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0421, i64 0, i32 20
  %105 = bitcast i8** %104 to float**
  %106 = load float*, float** %105, align 8
  br label %107

; <label>:107:                                    ; preds = %107, %103
  %indvars.iv27 = phi i64 [ 0, %103 ], [ %indvars.iv.next28, %107 ]
  %indvars.iv = phi i64 [ 0, %103 ], [ %indvars.iv.next, %107 ]
  %108 = getelementptr inbounds [8 x double], [8 x double]* @start_pass.aanscalefactor, i64 0, i64 %indvars.iv
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv27
  %111 = load i16, i16* %110, align 2
  %112 = uitofp i16 %111 to double
  %113 = fmul double %112, %109
  %114 = fptrunc double %113 to float
  %115 = getelementptr inbounds float, float* %106, i64 %indvars.iv27
  store float %114, float* %115, align 4
  %indvars.iv.next26 = or i64 %indvars.iv27, 1
  %116 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next26
  %117 = load i16, i16* %116, align 2
  %118 = uitofp i16 %117 to double
  %119 = fmul double %118, %109
  %120 = fmul double %119, 0x3FF63150B14861EF
  %121 = fptrunc double %120 to float
  %122 = getelementptr inbounds float, float* %106, i64 %indvars.iv.next26
  store float %121, float* %122, align 4
  %indvars.iv.next26.1 = add nuw nsw i64 %indvars.iv.next26, 1
  %123 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next26.1
  %124 = load i16, i16* %123, align 2
  %125 = uitofp i16 %124 to double
  %126 = fmul double %125, %109
  %127 = fmul double %126, 0x3FF4E7AE914D6FCA
  %128 = fptrunc double %127 to float
  %129 = getelementptr inbounds float, float* %106, i64 %indvars.iv.next26.1
  store float %128, float* %129, align 4
  %indvars.iv.next26.2 = or i64 %indvars.iv27, 3
  %130 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next26.2
  %131 = load i16, i16* %130, align 2
  %132 = uitofp i16 %131 to double
  %133 = fmul double %132, %109
  %134 = fmul double %133, 0x3FF2D062EF6C11AA
  %135 = fptrunc double %134 to float
  %136 = getelementptr inbounds float, float* %106, i64 %indvars.iv.next26.2
  store float %135, float* %136, align 4
  %indvars.iv.next26.3 = add nuw nsw i64 %indvars.iv.next26.2, 1
  %137 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next26.3
  %138 = load i16, i16* %137, align 2
  %139 = uitofp i16 %138 to double
  %140 = fmul double %139, %109
  %141 = fptrunc double %140 to float
  %142 = getelementptr inbounds float, float* %106, i64 %indvars.iv.next26.3
  store float %141, float* %142, align 4
  %indvars.iv.next26.4 = add nuw nsw i64 %indvars.iv.next26.2, 2
  %143 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next26.4
  %144 = load i16, i16* %143, align 2
  %145 = uitofp i16 %144 to double
  %146 = fmul double %145, %109
  %147 = fmul double %146, 0x3FE92469C0A7BF3B
  %148 = fptrunc double %147 to float
  %149 = getelementptr inbounds float, float* %106, i64 %indvars.iv.next26.4
  store float %148, float* %149, align 4
  %indvars.iv.next26.5 = add nuw nsw i64 %indvars.iv.next26.2, 3
  %150 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next26.5
  %151 = load i16, i16* %150, align 2
  %152 = uitofp i16 %151 to double
  %153 = fmul double %152, %109
  %154 = fmul double %153, 5.411961e-01
  %155 = fptrunc double %154 to float
  %156 = getelementptr inbounds float, float* %106, i64 %indvars.iv.next26.5
  store float %155, float* %156, align 4
  %indvars.iv.next26.6 = or i64 %indvars.iv27, 7
  %157 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %52, i64 0, i32 0, i64 %indvars.iv.next26.6
  %158 = load i16, i16* %157, align 2
  %159 = uitofp i16 %158 to double
  %160 = fmul double %159, %109
  %161 = fmul double %160, 0x3FD1A855DE72AB5D
  %162 = fptrunc double %161 to float
  %163 = getelementptr inbounds float, float* %106, i64 %indvars.iv.next26.6
  store float %162, float* %163, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 8
  %exitcond = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond, label %.loopexit.loopexit71, label %107

; <label>:164:                                    ; preds = %54
  %165 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %165, i64 0, i32 5
  store i32 47, i32* %166, align 8
  %167 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %16, align 8
  %168 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %167, align 8
  tail call void %168(%struct.jpeg_common_struct* %15) #3
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %59
  br label %.loopexit

.loopexit.loopexit70:                             ; preds = %80
  br label %.loopexit

.loopexit.loopexit71:                             ; preds = %107
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit71, %.loopexit.loopexit70, %.loopexit.loopexit, %50, %46, %._crit_edge54, %164
  %indvars.iv.next36 = add nuw i64 %indvars.iv35, 1
  %169 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0421, i64 1
  %170 = load i32, i32* %sunkaddr67, align 8
  %171 = sext i32 %170 to i64
  %172 = icmp slt i64 %indvars.iv.next36, %171
  br i1 %172, label %20, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @jpeg_idct_1x1(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_2x2(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_4x4(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_islow(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_ifast(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

declare void @jpeg_idct_float(%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
