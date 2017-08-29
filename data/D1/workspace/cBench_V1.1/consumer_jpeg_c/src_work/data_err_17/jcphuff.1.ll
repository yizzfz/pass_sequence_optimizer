; ModuleID = 'jcphuff.ll'
source_filename = "jcphuff.c"
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
%struct.c_derived_tbl = type { [256 x i32], [256 x i8] }
%struct.phuff_entropy_encoder = type { %struct.jpeg_entropy_encoder, i32, i8*, i64, i64, i32, %struct.jpeg_compress_struct*, [4 x i32], i32, i32, i32, i8*, i32, i32, [4 x %struct.c_derived_tbl*], [4 x i64*] }

@jpeg_natural_order = external local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jinit_phuff_encoder(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 184) #3
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %9 = bitcast %struct.jpeg_entropy_encoder** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_phuff, void (%struct.jpeg_compress_struct*, i32)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 152
  %12 = getelementptr inbounds i8, i8* %7, i64 120
  %13 = bitcast i8* %12 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %13, align 8
  %14 = bitcast i8* %11 to i64**
  store i64* null, i64** %14, align 8
  %15 = getelementptr inbounds i8, i8* %7, i64 128
  %16 = bitcast i8* %15 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %16, align 8
  %17 = getelementptr inbounds i8, i8* %7, i64 160
  %18 = bitcast i8* %17 to i64**
  store i64* null, i64** %18, align 8
  %19 = getelementptr inbounds i8, i8* %7, i64 136
  %20 = bitcast i8* %19 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %20, align 8
  %21 = getelementptr inbounds i8, i8* %7, i64 168
  %22 = bitcast i8* %21 to i64**
  store i64* null, i64** %22, align 8
  %23 = getelementptr inbounds i8, i8* %7, i64 144
  %24 = bitcast i8* %23 to %struct.c_derived_tbl**
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %24, align 8
  %25 = getelementptr inbounds i8, i8* %7, i64 176
  %26 = bitcast i8* %25 to i64**
  store i64* null, i64** %26, align 8
  %27 = getelementptr inbounds i8, i8* %7, i64 104
  %28 = bitcast i8* %27 to i8**
  store i8* null, i8** %28, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_phuff(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.phuff_entropy_encoder**
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %6 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 6
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  %7 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 1
  store i32 %1, i32* %7, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 0
  %13 = icmp eq i32 %9, 0
  br i1 %12, label %14, label %15

; <label>:14:                                     ; preds = %2
  %encode_mcu_AC_first.sink = select i1 %13, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_DC_first, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_AC_first
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr5 = add i64 %sunkaddr, 8
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i32 (%struct.jpeg_compress_struct*, [64 x i16]**)**
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* %encode_mcu_AC_first.sink, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %sunkaddr6, align 8
  br label %28

; <label>:15:                                     ; preds = %2
  %sunkaddr34 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 8
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i32 (%struct.jpeg_compress_struct*, [64 x i16]**)**
  br i1 %13, label %16, label %17

; <label>:16:                                     ; preds = %15
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_DC_refine, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %sunkaddr36, align 8
  br label %28

; <label>:17:                                     ; preds = %15
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_AC_refine, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %sunkaddr36, align 8
  %18 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 11
  %19 = load i8*, i8** %18, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %21, label %28

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %23 = bitcast %struct.jpeg_memory_mgr** %22 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %24 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %23, align 8
  %25 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %24, align 8
  %26 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %27 = tail call i8* %25(%struct.jpeg_common_struct* %26, i32 1, i64 1000) #3
  %sunkaddr13 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 104
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i8**
  store i8* %27, i8** %sunkaddr15, align 8
  br label %28

; <label>:28:                                     ; preds = %16, %21, %17, %14
  %29 = icmp eq i32 %1, 0
  %30 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 0, i32 2
  %31 = bitcast {}** %30 to void (%struct.jpeg_compress_struct*)**
  %finish_pass_phuff.sink = select i1 %29, void (%struct.jpeg_compress_struct*)* @finish_pass_phuff, void (%struct.jpeg_compress_struct*)* @finish_pass_gather_phuff
  store void (%struct.jpeg_compress_struct*)* %finish_pass_phuff.sink, void (%struct.jpeg_compress_struct*)** %31, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %33 = load i32, i32* %32, align 4
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %28
  %35 = icmp eq i32 %9, 0
  br i1 %35, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  %sunkaddr49 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr50 = add i64 %sunkaddr49, 88
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i32*
  %36 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %37 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %39 = icmp eq i32 %1, 0
  %40 = icmp eq i32 %9, 0
  %sunkaddr55 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr56 = add i64 %sunkaddr55, 316
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to i32*
  %41 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %42 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr52 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr53 = add i64 %sunkaddr52, 8
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %43 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %44 = icmp eq i32 %1, 0
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  %sunkaddr40 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr41 = add i64 %sunkaddr40, 412
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to i32*
  %45 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %46 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %48 = icmp eq i32 %1, 0
  %49 = icmp eq i32 %9, 0
  %50 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %51 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr43 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr44 = add i64 %sunkaddr43, 8
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %52 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %53 = icmp eq i32 %1, 0
  %sunkaddr46 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr47 = add i64 %sunkaddr46, 316
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i32*
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %96
  %indvars.iv = phi i64 [ %indvars.iv.next, %96 ], [ 0, %.lr.ph.split.us.preheader ]
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %55 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %54, align 8
  %56 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 7, i64 %indvars.iv
  store i32 0, i32* %56, align 4
  %57 = load i32, i32* %sunkaddr42, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %96

; <label>:59:                                     ; preds = %.lr.ph.split.us
  %60 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %55, i64 0, i32 5
  %61 = load i32, i32* %60, align 4
  %62 = sext i32 %61 to i64
  %63 = icmp ugt i32 %61, 3
  br i1 %63, label %69, label %64

; <label>:64:                                     ; preds = %59
  %65 = sext i32 %61 to i64
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %65
  %67 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %66, align 8
  %68 = icmp eq %struct.JHUFF_TBL* %67, null
  %or.cond2.us = and i1 %53, %68
  br i1 %or.cond2.us, label %69, label %76

; <label>:69:                                     ; preds = %64, %59
  %70 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %71 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %70, i64 0, i32 5
  store i32 49, i32* %71, align 8
  %72 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %73 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %72, i64 0, i32 6, i32 0, i64 0
  store i32 %61, i32* %73, align 4
  %74 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %45, align 8
  %75 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %74, align 8
  tail call void %75(%struct.jpeg_common_struct* nonnull %46) #3
  br label %76

; <label>:76:                                     ; preds = %69, %64
  br i1 %48, label %87, label %77

; <label>:77:                                     ; preds = %76
  %78 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 15, i64 %62
  %79 = load i64*, i64** %78, align 8
  %80 = icmp eq i64* %79, null
  br i1 %80, label %81, label %85

; <label>:81:                                     ; preds = %77
  %82 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr45, align 8
  %83 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %82, align 8
  %84 = tail call i8* %83(%struct.jpeg_common_struct* nonnull %51, i32 1, i64 2056) #3
  %sunkaddr20.us = shl nsw i64 %62, 3
  %sunkaddr21.us = add i64 %50, %sunkaddr20.us
  %sunkaddr22.us = add i64 %sunkaddr21.us, 152
  %sunkaddr23.us = inttoptr i64 %sunkaddr22.us to i8**
  store i8* %84, i8** %sunkaddr23.us, align 8
  br label %85

; <label>:85:                                     ; preds = %81, %77
  %sunkaddr25.us = shl nsw i64 %62, 3
  %sunkaddr26.us = add i64 %52, %sunkaddr25.us
  %sunkaddr27.us = add i64 %sunkaddr26.us, 152
  %sunkaddr28.us = inttoptr i64 %sunkaddr27.us to i8**
  %86 = load i8*, i8** %sunkaddr28.us, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %86, i8 0, i64 2056, i32 1, i1 false)
  br label %96

; <label>:87:                                     ; preds = %76
  br i1 %49, label %92, label %88

; <label>:88:                                     ; preds = %87
  %89 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %62
  %90 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %89, align 8
  %91 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 14, i64 %62
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %90, %struct.c_derived_tbl** %91) #3
  br label %96

; <label>:92:                                     ; preds = %87
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %62
  %94 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %93, align 8
  %95 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 14, i64 %62
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %94, %struct.c_derived_tbl** %95) #3
  br label %96

; <label>:96:                                     ; preds = %92, %88, %85, %.lr.ph.split.us
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %97 = load i32, i32* %sunkaddr48, align 4
  %98 = sext i32 %97 to i64
  %99 = icmp slt i64 %indvars.iv.next, %98
  br i1 %99, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %139
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %139 ], [ 0, %.lr.ph.split.preheader ]
  %100 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv31
  %101 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %100, align 8
  %102 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 7, i64 %indvars.iv31
  store i32 0, i32* %102, align 4
  %103 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i64 0, i32 6
  %104 = load i32, i32* %103, align 8
  %105 = sext i32 %104 to i64
  store i32 %104, i32* %sunkaddr51, align 8
  %106 = icmp ugt i32 %104, 3
  br i1 %106, label %112, label %107

; <label>:107:                                    ; preds = %.lr.ph.split
  %108 = sext i32 %104 to i64
  %109 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %108
  %110 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %109, align 8
  %111 = icmp eq %struct.JHUFF_TBL* %110, null
  %or.cond4 = and i1 %44, %111
  br i1 %or.cond4, label %112, label %119

; <label>:112:                                    ; preds = %107, %.lr.ph.split
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i64 0, i32 5
  store i32 49, i32* %114, align 8
  %115 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %116 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %115, i64 0, i32 6, i32 0, i64 0
  store i32 %104, i32* %116, align 4
  %117 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %36, align 8
  %118 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %117, align 8
  tail call void %118(%struct.jpeg_common_struct* nonnull %37) #3
  br label %119

; <label>:119:                                    ; preds = %107, %112
  br i1 %39, label %130, label %120

; <label>:120:                                    ; preds = %119
  %121 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 15, i64 %105
  %122 = load i64*, i64** %121, align 8
  %123 = icmp eq i64* %122, null
  br i1 %123, label %124, label %128

; <label>:124:                                    ; preds = %120
  %125 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr54, align 8
  %126 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %125, align 8
  %127 = tail call i8* %126(%struct.jpeg_common_struct* nonnull %42, i32 1, i64 2056) #3
  %sunkaddr20 = shl nsw i64 %105, 3
  %sunkaddr21 = add i64 %41, %sunkaddr20
  %sunkaddr22 = add i64 %sunkaddr21, 152
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i8**
  store i8* %127, i8** %sunkaddr23, align 8
  br label %128

; <label>:128:                                    ; preds = %124, %120
  %sunkaddr25 = shl nsw i64 %105, 3
  %sunkaddr26 = add i64 %43, %sunkaddr25
  %sunkaddr27 = add i64 %sunkaddr26, 152
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i8**
  %129 = load i8*, i8** %sunkaddr28, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %129, i8 0, i64 2056, i32 1, i1 false)
  br label %139

; <label>:130:                                    ; preds = %119
  br i1 %40, label %131, label %135

; <label>:131:                                    ; preds = %130
  %132 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %105
  %133 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %132, align 8
  %134 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 14, i64 %105
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %133, %struct.c_derived_tbl** %134) #3
  br label %139

; <label>:135:                                    ; preds = %130
  %136 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %105
  %137 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %136, align 8
  %138 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 14, i64 %105
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %137, %struct.c_derived_tbl** %138) #3
  br label %139

; <label>:139:                                    ; preds = %128, %135, %131
  %indvars.iv.next32 = add nuw i64 %indvars.iv31, 1
  %140 = load i32, i32* %sunkaddr57, align 4
  %141 = sext i32 %140 to i64
  %142 = icmp slt i64 %indvars.iv.next32, %141
  br i1 %142, label %.lr.ph.split, label %._crit_edge.loopexit59

._crit_edge.loopexit:                             ; preds = %96
  br label %._crit_edge

._crit_edge.loopexit59:                           ; preds = %139
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit59, %._crit_edge.loopexit, %28
  %143 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 9
  store i32 0, i32* %143, align 4
  %144 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 10
  store i32 0, i32* %144, align 8
  %145 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 4
  store i64 0, i64* %145, align 8
  %146 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 5
  store i32 0, i32* %146, align 8
  %147 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %148 = load i32, i32* %147, align 8
  %149 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  store i32 %148, i32* %149, align 8
  %150 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  store i32 0, i32* %150, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_DC_first(%struct.jpeg_compress_struct* nocapture readonly, [64 x i16]** nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.phuff_entropy_encoder**
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  %7 = load i32, i32* %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %9 = bitcast %struct.jpeg_destination_mgr** %8 to i64**
  %10 = load i64*, i64** %9, align 8
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 2
  %13 = bitcast i8** %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %8, align 8
  %15 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %14, i64 0, i32 1
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 3
  store i64 %16, i64* %17, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %19 = load i32, i32* %18, align 8
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %.preheader, label %21

; <label>:21:                                     ; preds = %2
  %22 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %.preheader

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %27 = load i32, i32* %26, align 4
  tail call fastcc void @emit_restart(%struct.phuff_entropy_encoder* nonnull %5, i32 %27)
  br label %.preheader

.preheader:                                       ; preds = %21, %25, %2
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph27.preheader, label %._crit_edge28

.lr.ph27.preheader:                               ; preds = %.preheader
  %sunkaddr29 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 360
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i32*
  br label %.lr.ph27

.lr.ph27:                                         ; preds = %.lr.ph27.preheader, %55
  %indvars.iv = phi i64 [ %indvars.iv.next, %55 ], [ 0, %.lr.ph27.preheader ]
  %31 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %32 = bitcast [64 x i16]** %31 to i16**
  %33 = load i16*, i16** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %indvars.iv
  %35 = load i32, i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %36
  %38 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %37, align 8
  %39 = load i16, i16* %33, align 2
  %40 = sext i16 %39 to i32
  %41 = ashr i32 %40, %7
  %42 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 7, i64 %36
  %43 = load i32, i32* %42, align 4
  %44 = sub nsw i32 %41, %43
  store i32 %41, i32* %42, align 4
  %45 = icmp slt i32 %44, 0
  %46 = sub nsw i32 0, %44
  %.03 = select i1 %45, i32 %46, i32 %44
  %.lobit = ashr i32 %44, 31
  %.02 = add nsw i32 %.lobit, %44
  %47 = icmp eq i32 %.03, 0
  br i1 %47, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph27
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.0125 = phi i32 [ %48, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.124 = phi i32 [ %49, %.lr.ph ], [ %.03, %.lr.ph.preheader ]
  %48 = add nuw nsw i32 %.0125, 1
  %49 = ashr i32 %.124, 1
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph27
  %.01.lcssa = phi i32 [ 0, %.lr.ph27 ], [ %48, %._crit_edge.loopexit ]
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %38, i64 0, i32 5
  %52 = load i32, i32* %51, align 4
  tail call fastcc void @emit_symbol(%struct.phuff_entropy_encoder* %5, i32 %52, i32 %.01.lcssa)
  %53 = icmp eq i32 %.01.lcssa, 0
  br i1 %53, label %55, label %54

; <label>:54:                                     ; preds = %._crit_edge
  tail call fastcc void @emit_bits(%struct.phuff_entropy_encoder* %5, i32 %.02, i32 %.01.lcssa)
  br label %55

; <label>:55:                                     ; preds = %54, %._crit_edge
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %56 = load i32, i32* %sunkaddr31, align 8
  %57 = sext i32 %56 to i64
  %58 = icmp slt i64 %indvars.iv.next, %57
  br i1 %58, label %.lr.ph27, label %._crit_edge28.loopexit

._crit_edge28.loopexit:                           ; preds = %55
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %.preheader
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr4 = add i64 %sunkaddr, 32
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i64*
  %59 = load i64, i64* %sunkaddr5, align 8
  %sunkaddr6 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 32
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i64**
  %60 = load i64*, i64** %sunkaddr8, align 8
  store i64 %59, i64* %60, align 8
  %sunkaddr9 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 40
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i64*
  %61 = load i64, i64* %sunkaddr11, align 8
  %sunkaddr12 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 32
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to %struct.jpeg_destination_mgr**
  %62 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr14, align 8
  %63 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %62, i64 0, i32 1
  store i64 %61, i64* %63, align 8
  %sunkaddr15 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 272
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %64 = load i32, i32* %sunkaddr17, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %78, label %66

; <label>:66:                                     ; preds = %._crit_edge28
  %67 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %68 = load i32, i32* %67, align 8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %75

; <label>:70:                                     ; preds = %66
  %sunkaddr18 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 112
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  store i32 %64, i32* %sunkaddr20, align 8
  %71 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %72 = load i32, i32* %71, align 4
  %73 = add nsw i32 %72, 1
  %74 = and i32 %73, 7
  store i32 %74, i32* %71, align 4
  br label %75

; <label>:75:                                     ; preds = %70, %66
  %sunkaddr21 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 112
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %76 = load i32, i32* %sunkaddr23, align 8
  %77 = add i32 %76, -1
  store i32 %77, i32* %sunkaddr23, align 8
  br label %78

; <label>:78:                                     ; preds = %._crit_edge28, %75
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_AC_first(%struct.jpeg_compress_struct* nocapture readonly, [64 x i16]** nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.phuff_entropy_encoder**
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  %7 = load i32, i32* %6, align 8
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %12 = bitcast %struct.jpeg_destination_mgr** %11 to i64**
  %13 = load i64*, i64** %12, align 8
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 2
  %16 = bitcast i8** %15 to i64*
  store i64 %14, i64* %16, align 8
  %17 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %11, align 8
  %18 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %17, i64 0, i32 1
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 3
  store i64 %19, i64* %20, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %31, label %24

; <label>:24:                                     ; preds = %2
  %25 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %26 = load i32, i32* %25, align 8
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %24
  %29 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %30 = load i32, i32* %29, align 4
  tail call fastcc void @emit_restart(%struct.phuff_entropy_encoder* nonnull %5, i32 %30)
  br label %31

; <label>:31:                                     ; preds = %24, %28, %2
  %32 = load [64 x i16]*, [64 x i16]** %1, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %34 = load i32, i32* %33, align 4
  %35 = icmp sgt i32 %34, %7
  br i1 %35, label %._crit_edge.thread, label %.lr.ph30.preheader

.lr.ph30.preheader:                               ; preds = %31
  %36 = sext i32 %34 to i64
  %sunkaddr32 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 92
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  %sunkaddr38 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr39 = add i64 %sunkaddr38, 88
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to i32*
  %sunkaddr35 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 88
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i32*
  br label %.lr.ph30

.lr.ph30:                                         ; preds = %.lr.ph30.preheader, %75
  %indvars.iv = phi i64 [ %indvars.iv.next, %75 ], [ %36, %.lr.ph30.preheader ]
  %.0128 = phi i32 [ %.2, %75 ], [ 0, %.lr.ph30.preheader ]
  %37 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %38 = load i32, i32* %37, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [64 x i16], [64 x i16]* %32, i64 0, i64 %39
  %41 = load i16, i16* %40, align 2
  %42 = sext i16 %41 to i32
  %43 = icmp eq i16 %41, 0
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %.lr.ph30
  %45 = add nsw i32 %.0128, 1
  br label %75

; <label>:46:                                     ; preds = %.lr.ph30
  %47 = icmp slt i16 %41, 0
  br i1 %47, label %48, label %52

; <label>:48:                                     ; preds = %46
  %49 = sub nsw i32 0, %42
  %50 = ashr i32 %49, %10
  %51 = xor i32 %50, -1
  br label %54

; <label>:52:                                     ; preds = %46
  %53 = ashr i32 %42, %10
  br label %54

; <label>:54:                                     ; preds = %52, %48
  %.05 = phi i32 [ %51, %48 ], [ %53, %52 ]
  %.03 = phi i32 [ %50, %48 ], [ %53, %52 ]
  %55 = icmp eq i32 %.03, 0
  br i1 %55, label %56, label %58

; <label>:56:                                     ; preds = %54
  %57 = add nsw i32 %.0128, 1
  br label %75

; <label>:58:                                     ; preds = %54
  %59 = load i32, i32* %sunkaddr34, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %.preheader26, label %61

; <label>:61:                                     ; preds = %58
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* nonnull %5)
  br label %.preheader26

.preheader26:                                     ; preds = %58, %61
  %62 = icmp sgt i32 %.0128, 15
  br i1 %62, label %.lr.ph.preheader, label %.preheader

.lr.ph.preheader:                                 ; preds = %.preheader26
  br label %.lr.ph

.preheader.loopexit:                              ; preds = %.lr.ph
  %63 = and i32 %.0128, 15
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader26
  %.1.lcssa = phi i32 [ %.0128, %.preheader26 ], [ %63, %.preheader.loopexit ]
  br label %67

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.127 = phi i32 [ %65, %.lr.ph ], [ %.0128, %.lr.ph.preheader ]
  %64 = load i32, i32* %sunkaddr37, align 8
  tail call fastcc void @emit_symbol(%struct.phuff_entropy_encoder* nonnull %5, i32 %64, i32 240)
  %65 = add nsw i32 %.127, -16
  %66 = icmp sgt i32 %65, 15
  br i1 %66, label %.lr.ph, label %.preheader.loopexit

; <label>:67:                                     ; preds = %67, %.preheader
  %.14 = phi i32 [ %68, %67 ], [ %.03, %.preheader ]
  %.02 = phi i32 [ %70, %67 ], [ 1, %.preheader ]
  %68 = ashr i32 %.14, 1
  %69 = icmp eq i32 %68, 0
  %70 = add nuw nsw i32 %.02, 1
  br i1 %69, label %71, label %67

; <label>:71:                                     ; preds = %67
  %72 = load i32, i32* %sunkaddr40, align 8
  %73 = shl i32 %.1.lcssa, 4
  %74 = add nsw i32 %.02, %73
  tail call fastcc void @emit_symbol(%struct.phuff_entropy_encoder* %5, i32 %72, i32 %74)
  tail call fastcc void @emit_bits(%struct.phuff_entropy_encoder* %5, i32 %.05, i32 %.02)
  br label %75

; <label>:75:                                     ; preds = %71, %56, %44
  %.2 = phi i32 [ %45, %44 ], [ %57, %56 ], [ 0, %71 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %76 = icmp slt i64 %indvars.iv, %8
  br i1 %76, label %.lr.ph30, label %._crit_edge

._crit_edge:                                      ; preds = %75
  %77 = icmp sgt i32 %.2, 0
  br i1 %77, label %78, label %._crit_edge.thread

; <label>:78:                                     ; preds = %._crit_edge
  %79 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 9
  %80 = load i32, i32* %79, align 4
  %81 = add i32 %80, 1
  store i32 %81, i32* %79, align 4
  %82 = icmp eq i32 %81, 32767
  br i1 %82, label %83, label %._crit_edge.thread

; <label>:83:                                     ; preds = %78
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* nonnull %5)
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %31, %78, %83, %._crit_edge
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr6 = add i64 %sunkaddr, 32
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i64*
  %84 = load i64, i64* %sunkaddr7, align 8
  %sunkaddr8 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 32
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i64**
  %85 = load i64*, i64** %sunkaddr10, align 8
  store i64 %84, i64* %85, align 8
  %sunkaddr11 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 40
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i64*
  %86 = load i64, i64* %sunkaddr13, align 8
  %sunkaddr14 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 32
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to %struct.jpeg_destination_mgr**
  %87 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr16, align 8
  %88 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %87, i64 0, i32 1
  store i64 %86, i64* %88, align 8
  %sunkaddr17 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 272
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  %89 = load i32, i32* %sunkaddr19, align 8
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %103, label %91

; <label>:91:                                     ; preds = %._crit_edge.thread
  %92 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %93 = load i32, i32* %92, align 8
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %100

; <label>:95:                                     ; preds = %91
  %sunkaddr20 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 112
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  store i32 %89, i32* %sunkaddr22, align 8
  %96 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %97 = load i32, i32* %96, align 4
  %98 = add nsw i32 %97, 1
  %99 = and i32 %98, 7
  store i32 %99, i32* %96, align 4
  br label %100

; <label>:100:                                    ; preds = %95, %91
  %sunkaddr23 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 112
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %101 = load i32, i32* %sunkaddr25, align 8
  %102 = add i32 %101, -1
  store i32 %102, i32* %sunkaddr25, align 8
  br label %103

; <label>:103:                                    ; preds = %._crit_edge.thread, %100
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_DC_refine(%struct.jpeg_compress_struct* nocapture readonly, [64 x i16]** nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.phuff_entropy_encoder**
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  %7 = load i32, i32* %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %9 = bitcast %struct.jpeg_destination_mgr** %8 to i64**
  %10 = load i64*, i64** %9, align 8
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 2
  %13 = bitcast i8** %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %8, align 8
  %15 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %14, i64 0, i32 1
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 3
  store i64 %16, i64* %17, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %19 = load i32, i32* %18, align 8
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %.preheader, label %21

; <label>:21:                                     ; preds = %2
  %22 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %.preheader

; <label>:25:                                     ; preds = %21
  %26 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %27 = load i32, i32* %26, align 4
  tail call fastcc void @emit_restart(%struct.phuff_entropy_encoder* nonnull %5, i32 %27)
  br label %.preheader

.preheader:                                       ; preds = %21, %25, %2
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr22 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 360
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %31 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %32 = bitcast [64 x i16]** %31 to i16**
  %33 = load i16*, i16** %32, align 8
  %34 = load i16, i16* %33, align 2
  %35 = sext i16 %34 to i32
  %36 = ashr i32 %35, %7
  tail call fastcc void @emit_bits(%struct.phuff_entropy_encoder* %5, i32 %36, i32 1)
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %37 = load i32, i32* %sunkaddr24, align 8
  %38 = sext i32 %37 to i64
  %39 = icmp slt i64 %indvars.iv.next, %38
  br i1 %39, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr1 = add i64 %sunkaddr, 32
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i64*
  %40 = load i64, i64* %sunkaddr2, align 8
  %sunkaddr3 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 32
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i64**
  %41 = load i64*, i64** %sunkaddr5, align 8
  store i64 %40, i64* %41, align 8
  %sunkaddr6 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 40
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i64*
  %42 = load i64, i64* %sunkaddr8, align 8
  %sunkaddr9 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 32
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to %struct.jpeg_destination_mgr**
  %43 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr11, align 8
  %44 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %43, i64 0, i32 1
  store i64 %42, i64* %44, align 8
  %sunkaddr12 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 272
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %45 = load i32, i32* %sunkaddr14, align 8
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %59, label %47

; <label>:47:                                     ; preds = %._crit_edge
  %48 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %49 = load i32, i32* %48, align 8
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %56

; <label>:51:                                     ; preds = %47
  %sunkaddr15 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 112
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  store i32 %45, i32* %sunkaddr17, align 8
  %52 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %53 = load i32, i32* %52, align 4
  %54 = add nsw i32 %53, 1
  %55 = and i32 %54, 7
  store i32 %55, i32* %52, align 4
  br label %56

; <label>:56:                                     ; preds = %51, %47
  %sunkaddr18 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 112
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  %57 = load i32, i32* %sunkaddr20, align 8
  %58 = add i32 %57, -1
  store i32 %58, i32* %sunkaddr20, align 8
  br label %59

; <label>:59:                                     ; preds = %._crit_edge, %56
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_AC_refine(%struct.jpeg_compress_struct* nocapture readonly, [64 x i16]** nocapture readonly) #0 {
  %3 = alloca [64 x i32], align 16
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %5 = bitcast %struct.jpeg_entropy_encoder** %4 to %struct.phuff_entropy_encoder**
  %6 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  %8 = load i32, i32* %7, align 8
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %13 = bitcast %struct.jpeg_destination_mgr** %12 to i64**
  %14 = load i64*, i64** %13, align 8
  %15 = load i64, i64* %14, align 8
  %16 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 2
  %17 = bitcast i8** %16 to i64*
  store i64 %15, i64* %17, align 8
  %18 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %12, align 8
  %19 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %18, i64 0, i32 1
  %20 = load i64, i64* %19, align 8
  %21 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 3
  store i64 %20, i64* %21, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %32, label %25

; <label>:25:                                     ; preds = %2
  %26 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 12
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %32

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 13
  %31 = load i32, i32* %30, align 4
  tail call fastcc void @emit_restart(%struct.phuff_entropy_encoder* nonnull %6, i32 %31)
  br label %32

; <label>:32:                                     ; preds = %25, %29, %2
  %33 = load [64 x i16]*, [64 x i16]** %1, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %35 = load i32, i32* %34, align 4
  %36 = icmp sgt i32 %35, %8
  br i1 %36, label %._crit_edge66, label %.lr.ph65.preheader

.lr.ph65.preheader:                               ; preds = %32
  %37 = sext i32 %35 to i64
  br label %.lr.ph65

.lr.ph65:                                         ; preds = %.lr.ph65.preheader, %.lr.ph65
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %.lr.ph65 ], [ %37, %.lr.ph65.preheader ]
  %.0463 = phi i32 [ %.15, %.lr.ph65 ], [ 0, %.lr.ph65.preheader ]
  %38 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv69
  %39 = load i32, i32* %38, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [64 x i16], [64 x i16]* %33, i64 0, i64 %40
  %42 = load i16, i16* %41, align 2
  %43 = sext i16 %42 to i32
  %44 = icmp slt i16 %42, 0
  %45 = sub nsw i32 0, %43
  %. = select i1 %44, i32 %45, i32 %43
  %46 = ashr i32 %., %11
  %47 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %indvars.iv69
  store i32 %46, i32* %47, align 4
  %48 = icmp eq i32 %46, 1
  %49 = trunc i64 %indvars.iv69 to i32
  %.15 = select i1 %48, i32 %49, i32 %.0463
  %indvars.iv.next70 = add nsw i64 %indvars.iv69, 1
  %50 = icmp slt i64 %indvars.iv69, %9
  br i1 %50, label %.lr.ph65, label %._crit_edge66.loopexit

._crit_edge66.loopexit:                           ; preds = %.lr.ph65
  %phitmp = sext i32 %.15 to i64
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66.loopexit, %32
  %.04.lcssa = phi i64 [ 0, %32 ], [ %phitmp, %._crit_edge66.loopexit ]
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr, 404
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  %51 = load i32, i32* %sunkaddr16, align 4
  %52 = icmp sgt i32 %51, %8
  br i1 %52, label %._crit_edge59, label %.lr.ph58

.lr.ph58:                                         ; preds = %._crit_edge66
  %53 = sext i32 %51 to i64
  %54 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 11
  %55 = load i8*, i8** %54, align 8
  %56 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 10
  %57 = load i32, i32* %56, align 8
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8* %55, i64 %58
  %60 = sext i32 %8 to i64
  %sunkaddr77 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr78 = add i64 %sunkaddr77, 88
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i32*
  %sunkaddr80 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr81 = add i64 %sunkaddr80, 104
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to i8**
  %sunkaddr71 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr72 = add i64 %sunkaddr71, 88
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to i32*
  %sunkaddr74 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr75 = add i64 %sunkaddr74, 104
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i8**
  %sunkaddr83 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr84 = add i64 %sunkaddr83, 88
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to i32*
  %sunkaddr86 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr87 = add i64 %sunkaddr86, 104
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to i8**
  br label %61

; <label>:61:                                     ; preds = %96, %.lr.ph58
  %indvars.iv = phi i64 [ %indvars.iv.next, %96 ], [ %53, %.lr.ph58 ]
  %.056 = phi i32 [ %.2, %96 ], [ 0, %.lr.ph58 ]
  %.0155 = phi i8* [ %.23, %96 ], [ %59, %.lr.ph58 ]
  %.0754 = phi i32 [ %.29, %96 ], [ 0, %.lr.ph58 ]
  %62 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %indvars.iv
  %63 = load i32, i32* %62, align 4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %72, label %.preheader

.preheader:                                       ; preds = %61
  %65 = icmp sgt i32 %.0754, 15
  %66 = icmp sle i64 %indvars.iv, %.04.lcssa
  %.1347 = and i1 %66, %65
  br i1 %.1347, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %67 = icmp sgt i64 %indvars.iv, %.04.lcssa
  br i1 %67, label %.lr.ph.split, label %.lr.ph.split.us.preheader

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %.lr.ph.split.us
  %.150.us = phi i32 [ 0, %.lr.ph.split.us ], [ %.056, %.lr.ph.split.us.preheader ]
  %.1249.us = phi i8* [ %70, %.lr.ph.split.us ], [ %.0155, %.lr.ph.split.us.preheader ]
  %.1848.us = phi i32 [ %69, %.lr.ph.split.us ], [ %.0754, %.lr.ph.split.us.preheader ]
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* %6)
  %68 = load i32, i32* %sunkaddr73, align 8
  tail call fastcc void @emit_symbol(%struct.phuff_entropy_encoder* %6, i32 %68, i32 240)
  %69 = add nsw i32 %.1848.us, -16
  tail call fastcc void @emit_buffered_bits(%struct.phuff_entropy_encoder* %6, i8* %.1249.us, i32 %.150.us)
  %70 = load i8*, i8** %sunkaddr76, align 8
  %71 = icmp sgt i32 %69, 15
  br i1 %71, label %.lr.ph.split.us, label %._crit_edge.loopexit

; <label>:72:                                     ; preds = %61
  %73 = add nsw i32 %.0754, 1
  br label %96

.lr.ph.split:                                     ; preds = %.lr.ph
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* %6)
  %74 = load i32, i32* %sunkaddr79, align 8
  tail call fastcc void @emit_symbol(%struct.phuff_entropy_encoder* %6, i32 %74, i32 240)
  %75 = add nsw i32 %.0754, -16
  tail call fastcc void @emit_buffered_bits(%struct.phuff_entropy_encoder* %6, i8* %.0155, i32 %.056)
  %76 = load i8*, i8** %sunkaddr82, align 8
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %.lr.ph.split.us
  %77 = and i32 %.0754, 15
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.split, %.preheader
  %.18.lcssa = phi i32 [ %.0754, %.preheader ], [ %75, %.lr.ph.split ], [ %77, %._crit_edge.loopexit ]
  %.12.lcssa = phi i8* [ %.0155, %.preheader ], [ %76, %.lr.ph.split ], [ %70, %._crit_edge.loopexit ]
  %.1.lcssa = phi i32 [ %.056, %.preheader ], [ 0, %.lr.ph.split ], [ 0, %._crit_edge.loopexit ]
  %78 = icmp sgt i32 %63, 1
  br i1 %78, label %79, label %85

; <label>:79:                                     ; preds = %._crit_edge
  %80 = trunc i32 %63 to i8
  %81 = and i8 %80, 1
  %82 = add i32 %.1.lcssa, 1
  %83 = zext i32 %.1.lcssa to i64
  %84 = getelementptr inbounds i8, i8* %.12.lcssa, i64 %83
  store i8 %81, i8* %84, align 1
  br label %96

; <label>:85:                                     ; preds = %._crit_edge
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* %6)
  %86 = load i32, i32* %sunkaddr85, align 8
  %87 = shl i32 %.18.lcssa, 4
  %88 = or i32 %87, 1
  tail call fastcc void @emit_symbol(%struct.phuff_entropy_encoder* %6, i32 %86, i32 %88)
  %89 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %90 = load i32, i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [64 x i16], [64 x i16]* %33, i64 0, i64 %91
  %93 = load i16, i16* %92, align 2
  %.lobit = lshr i16 %93, 15
  %94 = xor i16 %.lobit, 1
  %.not = zext i16 %94 to i32
  tail call fastcc void @emit_bits(%struct.phuff_entropy_encoder* %6, i32 %.not, i32 1)
  tail call fastcc void @emit_buffered_bits(%struct.phuff_entropy_encoder* %6, i8* %.12.lcssa, i32 %.1.lcssa)
  %95 = load i8*, i8** %sunkaddr88, align 8
  br label %96

; <label>:96:                                     ; preds = %85, %79, %72
  %.29 = phi i32 [ %73, %72 ], [ %.18.lcssa, %79 ], [ 0, %85 ]
  %.23 = phi i8* [ %.0155, %72 ], [ %.12.lcssa, %79 ], [ %95, %85 ]
  %.2 = phi i32 [ %.056, %72 ], [ %82, %79 ], [ 0, %85 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %97 = icmp slt i64 %indvars.iv, %60
  br i1 %97, label %61, label %._crit_edge59.loopexit

._crit_edge59.loopexit:                           ; preds = %96
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.loopexit, %._crit_edge66
  %.07.lcssa = phi i32 [ 0, %._crit_edge66 ], [ %.29, %._crit_edge59.loopexit ]
  %.0.lcssa = phi i32 [ 0, %._crit_edge66 ], [ %.2, %._crit_edge59.loopexit ]
  %98 = icmp slt i32 %.07.lcssa, 1
  %99 = icmp eq i32 %.0.lcssa, 0
  %or.cond = and i1 %98, %99
  br i1 %or.cond, label %109, label %100

; <label>:100:                                    ; preds = %._crit_edge59
  %101 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 9
  %102 = load i32, i32* %101, align 4
  %103 = add i32 %102, 1
  store i32 %103, i32* %101, align 4
  %sunkaddr23 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 96
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %104 = load i32, i32* %sunkaddr25, align 8
  %105 = add i32 %104, %.0.lcssa
  store i32 %105, i32* %sunkaddr25, align 8
  %106 = icmp eq i32 %103, 32767
  %107 = icmp ugt i32 %105, 937
  %or.cond14 = or i1 %106, %107
  br i1 %or.cond14, label %108, label %109

; <label>:108:                                    ; preds = %100
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* nonnull %6)
  br label %109

; <label>:109:                                    ; preds = %100, %108, %._crit_edge59
  %sunkaddr26 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 32
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i64*
  %110 = load i64, i64* %sunkaddr28, align 8
  %sunkaddr29 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 32
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i64**
  %111 = load i64*, i64** %sunkaddr31, align 8
  store i64 %110, i64* %111, align 8
  %sunkaddr32 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 40
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i64*
  %112 = load i64, i64* %sunkaddr34, align 8
  %sunkaddr35 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 32
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to %struct.jpeg_destination_mgr**
  %113 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr37, align 8
  %114 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %113, i64 0, i32 1
  store i64 %112, i64* %114, align 8
  %sunkaddr38 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr39 = add i64 %sunkaddr38, 272
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to i32*
  %115 = load i32, i32* %sunkaddr40, align 8
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %129, label %117

; <label>:117:                                    ; preds = %109
  %118 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 12
  %119 = load i32, i32* %118, align 8
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %121, label %126

; <label>:121:                                    ; preds = %117
  %sunkaddr41 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 112
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i32*
  store i32 %115, i32* %sunkaddr43, align 8
  %122 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 13
  %123 = load i32, i32* %122, align 4
  %124 = add nsw i32 %123, 1
  %125 = and i32 %124, 7
  store i32 %125, i32* %122, align 4
  br label %126

; <label>:126:                                    ; preds = %121, %117
  %sunkaddr44 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 112
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i32*
  %127 = load i32, i32* %sunkaddr46, align 8
  %128 = add i32 %127, -1
  store i32 %128, i32* %sunkaddr46, align 8
  br label %129

; <label>:129:                                    ; preds = %109, %126
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_gather_phuff(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca [4 x i32], align 16
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.phuff_entropy_encoder**
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* %5)
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %7 = load i32, i32* %6, align 4
  %8 = bitcast [4 x i32]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 16, i32 16, i1 false)
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %12 = icmp eq i32 %7, 0
  br i1 %12, label %.lr.ph.split.us.preheader, label %.lr.ph.split.split.preheader

.lr.ph.split.split.preheader:                     ; preds = %.lr.ph
  %13 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr23 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %14 = ptrtoint [4 x i32]* %2 to i64
  %sunkaddr28 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr33 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr34 = add i64 %sunkaddr33, 316
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to i32*
  br label %.lr.ph.split.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr, 412
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  %15 = icmp eq i32 %7, 0
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %17 = ptrtoint [4 x i32]* %2 to i64
  %sunkaddr20 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 316
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %39
  %indvars.iv = phi i64 [ %indvars.iv.next, %39 ], [ 0, %.lr.ph.split.us.preheader ]
  %18 = load i32, i32* %sunkaddr19, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %39

; <label>:20:                                     ; preds = %.lr.ph.split.us
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %22 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %22, i64 0, i32 5
  %.01.us = load i32, i32* %23, align 4
  %24 = sext i32 %.01.us to i64
  %25 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %39

; <label>:28:                                     ; preds = %20
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %24
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %24
  %.0.us = select i1 %15, %struct.JHUFF_TBL** %29, %struct.JHUFF_TBL** %30
  %31 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %.0.us, align 8
  %32 = icmp eq %struct.JHUFF_TBL* %31, null
  br i1 %32, label %33, label %35

; <label>:33:                                     ; preds = %28
  %34 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %16) #3
  store %struct.JHUFF_TBL* %34, %struct.JHUFF_TBL** %.0.us, align 8
  br label %35

; <label>:35:                                     ; preds = %33, %28
  %36 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %.0.us, align 8
  %37 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 15, i64 %24
  %38 = load i64*, i64** %37, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %36, i64* %38) #3
  %sunkaddr3.us = shl nsw i64 %24, 2
  %sunkaddr4.us = add i64 %17, %sunkaddr3.us
  %sunkaddr5.us = inttoptr i64 %sunkaddr4.us to i32*
  store i32 1, i32* %sunkaddr5.us, align 4
  br label %39

; <label>:39:                                     ; preds = %35, %20, %.lr.ph.split.us
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %40 = load i32, i32* %sunkaddr22, align 4
  %41 = sext i32 %40 to i64
  %42 = icmp slt i64 %indvars.iv.next, %41
  br i1 %42, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split.split:                               ; preds = %.lr.ph.split.split.preheader, %60
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %60 ], [ 0, %.lr.ph.split.split.preheader ]
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv15
  %44 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %44, i64 0, i32 6
  %.01 = load i32, i32* %45, align 4
  %46 = sext i32 %.01 to i64
  %47 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %60

; <label>:50:                                     ; preds = %.lr.ph.split.split
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %46
  %52 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %51, align 8
  %53 = icmp eq %struct.JHUFF_TBL* %52, null
  br i1 %53, label %54, label %56

; <label>:54:                                     ; preds = %50
  %55 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %13) #3
  %sunkaddr24 = shl nsw i64 %46, 3
  %sunkaddr25 = add i64 %sunkaddr23, %sunkaddr24
  %sunkaddr26 = add i64 %sunkaddr25, 152
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to %struct.JHUFF_TBL**
  store %struct.JHUFF_TBL* %55, %struct.JHUFF_TBL** %sunkaddr27, align 8
  br label %56

; <label>:56:                                     ; preds = %54, %50
  %sunkaddr29 = shl nsw i64 %46, 3
  %sunkaddr30 = add i64 %sunkaddr28, %sunkaddr29
  %sunkaddr31 = add i64 %sunkaddr30, 152
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to %struct.JHUFF_TBL**
  %57 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %sunkaddr32, align 8
  %58 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 15, i64 %46
  %59 = load i64*, i64** %58, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %57, i64* %59) #3
  %sunkaddr3 = shl nsw i64 %46, 2
  %sunkaddr4 = add i64 %14, %sunkaddr3
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  store i32 1, i32* %sunkaddr5, align 4
  br label %60

; <label>:60:                                     ; preds = %56, %.lr.ph.split.split
  %indvars.iv.next16 = add nuw i64 %indvars.iv15, 1
  %61 = load i32, i32* %sunkaddr35, align 4
  %62 = sext i32 %61 to i64
  %63 = icmp slt i64 %indvars.iv.next16, %62
  br i1 %63, label %.lr.ph.split.split, label %._crit_edge.loopexit37

._crit_edge.loopexit:                             ; preds = %39
  br label %._crit_edge

._crit_edge.loopexit37:                           ; preds = %60
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit37, %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_phuff(%struct.jpeg_compress_struct* nocapture readonly) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %3 = bitcast %struct.jpeg_entropy_encoder** %2 to %struct.phuff_entropy_encoder**
  %4 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %6 = bitcast %struct.jpeg_destination_mgr** %5 to i64**
  %7 = load i64*, i64** %6, align 8
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %4, i64 0, i32 2
  %10 = bitcast i8** %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %5, align 8
  %12 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %11, i64 0, i32 1
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %4, i64 0, i32 3
  store i64 %13, i64* %14, align 8
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* %4)
  tail call fastcc void @flush_bits(%struct.phuff_entropy_encoder* %4)
  %15 = load i64, i64* %10, align 8
  %16 = load i64*, i64** %6, align 8
  store i64 %15, i64* %16, align 8
  %17 = load i64, i64* %14, align 8
  %18 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %5, align 8
  %19 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %18, i64 0, i32 1
  store i64 %17, i64* %19, align 8
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, %struct.c_derived_tbl**) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_restart(%struct.phuff_entropy_encoder* nocapture, i32) unnamed_addr #0 {
  tail call fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* %0)
  %3 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 1
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %24

; <label>:6:                                      ; preds = %2
  tail call fastcc void @flush_bits(%struct.phuff_entropy_encoder* nonnull %0)
  %7 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 2
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 1
  store i8* %9, i8** %7, align 8
  store i8 -1, i8* %8, align 1
  %10 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 3
  %11 = load i64, i64* %10, align 8
  %12 = add i64 %11, -1
  store i64 %12, i64* %10, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %6
  tail call fastcc void @dump_buffer(%struct.phuff_entropy_encoder* nonnull %0)
  br label %15

; <label>:15:                                     ; preds = %14, %6
  %16 = add nsw i32 %1, 208
  %17 = trunc i32 %16 to i8
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 32
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i8**
  %18 = load i8*, i8** %sunkaddr2, align 8
  %19 = getelementptr inbounds i8, i8* %18, i64 1
  store i8* %19, i8** %sunkaddr2, align 8
  store i8 %17, i8* %18, align 1
  %sunkaddr3 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 40
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i64*
  %20 = load i64, i64* %sunkaddr5, align 8
  %21 = add i64 %20, -1
  store i64 %21, i64* %sunkaddr5, align 8
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %24

; <label>:23:                                     ; preds = %15
  tail call fastcc void @dump_buffer(%struct.phuff_entropy_encoder* nonnull %0)
  br label %24

; <label>:24:                                     ; preds = %15, %23, %2
  %25 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 6
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i64 0, i32 47
  %28 = load i32, i32* %27, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %.preheader, label %40

.preheader:                                       ; preds = %24
  %sunkaddr6 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 64
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct.jpeg_compress_struct**
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %sunkaddr8, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i64 0, i32 41
  %32 = load i32, i32* %31, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr10 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 64
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to %struct.jpeg_compress_struct**
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %34 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 7, i64 %indvars.iv
  store i32 0, i32* %34, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %sunkaddr12, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i64 0, i32 41
  %37 = load i32, i32* %36, align 4
  %38 = sext i32 %37 to i64
  %39 = icmp slt i64 %indvars.iv.next, %38
  br i1 %39, label %.lr.ph, label %.loopexit.loopexit

; <label>:40:                                     ; preds = %24
  %41 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 9
  store i32 0, i32* %41, align 4
  %42 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 10
  store i32 0, i32* %42, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %40
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_symbol(%struct.phuff_entropy_encoder* nocapture, i32, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 1
  %5 = load i32, i32* %4, align 8
  %6 = icmp eq i32 %5, 0
  %7 = sext i32 %1 to i64
  br i1 %6, label %8, label %17

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 14, i64 %7
  %10 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %9, align 8
  %11 = sext i32 %2 to i64
  %12 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %10, i64 0, i32 0, i64 %11
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %10, i64 0, i32 1, i64 %11
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  tail call fastcc void @emit_bits(%struct.phuff_entropy_encoder* nonnull %0, i32 %13, i32 %16)
  ret void

; <label>:17:                                     ; preds = %3
  %18 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 15, i64 %7
  %19 = load i64*, i64** %18, align 8
  %20 = sext i32 %2 to i64
  %21 = getelementptr inbounds i64, i64* %19, i64 %20
  %22 = load i64, i64* %21, align 8
  %23 = add nsw i64 %22, 1
  store i64 %23, i64* %21, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_bits(%struct.phuff_entropy_encoder* nocapture, i32, i32) unnamed_addr #0 {
  %4 = zext i32 %1 to i64
  %5 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 5
  %6 = load i32, i32* %5, align 8
  %7 = icmp eq i32 %2, 0
  br i1 %7, label %8, label %18

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 6
  %10 = bitcast %struct.jpeg_compress_struct** %9 to %struct.jpeg_error_mgr***
  %11 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %10, align 8
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 39, i32* %13, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %9, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %14 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %14 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %.cast) #3
  br label %18

; <label>:18:                                     ; preds = %8, %3
  %19 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 1
  %20 = load i32, i32* %19, align 8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %60

; <label>:22:                                     ; preds = %18
  %23 = zext i32 %2 to i64
  %24 = shl i64 1, %23
  %25 = add i64 %24, 4294967295
  %26 = and i64 %25, %4
  %27 = add nsw i32 %6, %2
  %28 = sub nsw i32 24, %27
  %29 = zext i32 %28 to i64
  %30 = shl i64 %26, %29
  %31 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 4
  %32 = load i64, i64* %31, align 8
  %33 = or i64 %32, %30
  %34 = icmp sgt i32 %27, 7
  br i1 %34, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %22
  %35 = add i32 %6, %2
  %sunkaddr17 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 32
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i8**
  %sunkaddr20 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 40
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i64*
  %sunkaddr23 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 32
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i8**
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr26 = add i64 %sunkaddr, 40
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i64*
  br label %36

; <label>:36:                                     ; preds = %.lr.ph, %55
  %.014 = phi i32 [ %27, %.lr.ph ], [ %57, %55 ]
  %.0113 = phi i64 [ %33, %.lr.ph ], [ %56, %55 ]
  %37 = lshr i64 %.0113, 16
  %38 = trunc i64 %37 to i8
  %39 = load i8*, i8** %sunkaddr19, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 1
  store i8* %40, i8** %sunkaddr19, align 8
  store i8 %38, i8* %39, align 1
  %41 = load i64, i64* %sunkaddr22, align 8
  %42 = add i64 %41, -1
  store i64 %42, i64* %sunkaddr22, align 8
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %36
  tail call fastcc void @dump_buffer(%struct.phuff_entropy_encoder* nonnull %0)
  br label %45

; <label>:45:                                     ; preds = %44, %36
  %46 = and i64 %37, 255
  %47 = icmp eq i64 %46, 255
  br i1 %47, label %48, label %55

; <label>:48:                                     ; preds = %45
  %49 = load i8*, i8** %sunkaddr25, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 1
  store i8* %50, i8** %sunkaddr25, align 8
  store i8 0, i8* %49, align 1
  %51 = load i64, i64* %sunkaddr27, align 8
  %52 = add i64 %51, -1
  store i64 %52, i64* %sunkaddr27, align 8
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %54, label %55

; <label>:54:                                     ; preds = %48
  tail call fastcc void @dump_buffer(%struct.phuff_entropy_encoder* nonnull %0)
  br label %55

; <label>:55:                                     ; preds = %48, %54, %45
  %56 = shl i64 %.0113, 8
  %57 = add nsw i32 %.014, -8
  %58 = icmp sgt i32 %57, 7
  br i1 %58, label %36, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %55
  %59 = and i32 %35, 7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %22
  %.01.lcssa = phi i64 [ %33, %22 ], [ %56, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ %27, %22 ], [ %59, %._crit_edge.loopexit ]
  %sunkaddr7 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr8 = add i64 %sunkaddr7, 48
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i64*
  store i64 %.01.lcssa, i64* %sunkaddr9, align 8
  %sunkaddr10 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 56
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i32*
  store i32 %.0.lcssa, i32* %sunkaddr12, align 8
  br label %60

; <label>:60:                                     ; preds = %18, %._crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_eobrun(%struct.phuff_entropy_encoder* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 9
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %20, label %.preheader.preheader

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.01 = phi i32 [ %5, %.preheader ], [ %3, %.preheader.preheader ]
  %.0 = phi i32 [ %7, %.preheader ], [ 0, %.preheader.preheader ]
  %5 = ashr i32 %.01, 1
  %6 = icmp eq i32 %5, 0
  %7 = add nuw nsw i32 %.0, 1
  br i1 %6, label %8, label %.preheader

; <label>:8:                                      ; preds = %.preheader
  %9 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 8
  %10 = load i32, i32* %9, align 8
  %11 = shl i32 %.0, 4
  tail call fastcc void @emit_symbol(%struct.phuff_entropy_encoder* %0, i32 %10, i32 %11)
  %12 = icmp eq i32 %.0, 0
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %8
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr2 = add i64 %sunkaddr, 92
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i32*
  %14 = load i32, i32* %sunkaddr3, align 4
  tail call fastcc void @emit_bits(%struct.phuff_entropy_encoder* nonnull %0, i32 %14, i32 %.0)
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %sunkaddr4 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr5 = add i64 %sunkaddr4, 92
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i32*
  store i32 0, i32* %sunkaddr6, align 4
  %16 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 11
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 10
  %19 = load i32, i32* %18, align 8
  tail call fastcc void @emit_buffered_bits(%struct.phuff_entropy_encoder* nonnull %0, i8* %17, i32 %19)
  store i32 0, i32* %18, align 8
  br label %20

; <label>:20:                                     ; preds = %1, %15
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @flush_bits(%struct.phuff_entropy_encoder* nocapture) unnamed_addr #0 {
  tail call fastcc void @emit_bits(%struct.phuff_entropy_encoder* %0, i32 127, i32 7)
  %2 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 4
  store i64 0, i64* %2, align 8
  %3 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 5
  store i32 0, i32* %3, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @dump_buffer(%struct.phuff_entropy_encoder* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 6
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 5
  %5 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %5, i64 0, i32 3
  %7 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %6, align 8
  %8 = tail call i32 %7(%struct.jpeg_compress_struct* %3) #3
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %19

; <label>:10:                                     ; preds = %1
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 64
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to %struct.jpeg_compress_struct**
  %11 = inttoptr i64 %sunkaddr1 to %struct.jpeg_error_mgr***
  %12 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %11, align 8
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 22, i32* %14, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %sunkaddr2, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %15 to void (%struct.jpeg_common_struct*)***
  %17 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %16, align 8
  %18 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %17, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %15 to %struct.jpeg_common_struct*
  tail call void %18(%struct.jpeg_common_struct* %.cast) #3
  br label %19

; <label>:19:                                     ; preds = %1, %10
  %20 = bitcast %struct.jpeg_destination_mgr* %5 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 2
  %23 = bitcast i8** %22 to i64*
  store i64 %21, i64* %23, align 8
  %24 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %5, i64 0, i32 1
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 3
  store i64 %25, i64* %26, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_buffered_bits(%struct.phuff_entropy_encoder* nocapture, i8* nocapture readonly, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 1
  %5 = load i32, i32* %4, align 8
  %6 = icmp ne i32 %5, 0
  %7 = icmp eq i32 %2, 0
  %or.cond = or i1 %6, %7
  br i1 %or.cond, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %11, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %.012 = phi i8* [ %10, %.lr.ph ], [ %1, %.lr.ph.preheader ]
  %8 = load i8, i8* %.012, align 1
  %9 = sext i8 %8 to i32
  tail call fastcc void @emit_bits(%struct.phuff_entropy_encoder* %0, i32 %9, i32 1)
  %10 = getelementptr inbounds i8, i8* %.012, i64 1
  %11 = add i32 %.03, -1
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) local_unnamed_addr #2

declare void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, i64*) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
