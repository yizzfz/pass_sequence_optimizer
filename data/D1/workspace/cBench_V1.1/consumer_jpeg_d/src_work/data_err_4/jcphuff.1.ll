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
%struct.phuff_entropy_encoder = type { %struct.jpeg_entropy_encoder, i32, i8*, i64, i64, i32, %struct.jpeg_compress_struct*, [4 x i32], i32, i32, i32, i8*, i32, i32, [4 x %struct.c_derived_tbl*], [4 x i64*] }
%struct.c_derived_tbl = type { [256 x i32], [256 x i8] }

@jpeg_natural_order = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jinit_phuff_encoder(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %.cast, i32 1, i64 184) #3
  %.cast1 = ptrtoint i8* %6 to i64
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %8 = bitcast %struct.jpeg_entropy_encoder** %7 to i64*
  store i64 %.cast1, i64* %8, align 8
  %9 = bitcast i8* %6 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_phuff, void (%struct.jpeg_compress_struct*, i32)** %9, align 8
  %10 = getelementptr inbounds i8, i8* %6, i64 120
  %11 = getelementptr inbounds i8, i8* %6, i64 104
  %12 = bitcast i8* %11 to i8**
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 64, i32 8, i1 false)
  store i8* null, i8** %12, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_phuff(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %5 = bitcast %struct.jpeg_entropy_encoder** %4 to %struct.phuff_entropy_encoder**
  %6 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %7 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 6
  %8 = bitcast %struct.jpeg_compress_struct** %7 to i64*
  store i64 %3, i64* %8, align 8
  %9 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 1
  store i32 %1, i32* %9, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  %13 = load i32, i32* %12, align 4
  %14 = icmp eq i32 %13, 0
  %15 = icmp eq i32 %11, 0
  br i1 %14, label %16, label %17

; <label>:16:                                     ; preds = %2
  %encode_mcu_AC_first.sink = select i1 %15, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_DC_first, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_AC_first
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr61 = add i64 %sunkaddr, 8
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to i32 (%struct.jpeg_compress_struct*, [64 x i16]**)**
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* %encode_mcu_AC_first.sink, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %sunkaddr62, align 8
  br label %29

; <label>:17:                                     ; preds = %2
  %sunkaddr63 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr64 = add i64 %sunkaddr63, 8
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i32 (%struct.jpeg_compress_struct*, [64 x i16]**)**
  br i1 %15, label %18, label %19

; <label>:18:                                     ; preds = %17
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_DC_refine, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %sunkaddr65, align 8
  br label %29

; <label>:19:                                     ; preds = %17
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_AC_refine, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %sunkaddr65, align 8
  %20 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 11
  %21 = load i8*, i8** %20, align 8
  %22 = icmp eq i8* %21, null
  br i1 %22, label %23, label %29

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %25 = bitcast %struct.jpeg_memory_mgr** %24 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %26 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %25, align 8
  %27 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %26, align 8
  %.cast4 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %28 = tail call i8* %27(%struct.jpeg_common_struct* %.cast4, i32 1, i64 1000) #3
  %sunkaddr69 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr70 = add i64 %sunkaddr69, 104
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to i8**
  store i8* %28, i8** %sunkaddr71, align 8
  br label %29

; <label>:29:                                     ; preds = %18, %23, %19, %16
  %30 = icmp eq i32 %1, 0
  %31 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 0, i32 2
  %32 = bitcast {}** %31 to void (%struct.jpeg_compress_struct*)**
  %finish_pass_phuff.sink = select i1 %30, void (%struct.jpeg_compress_struct*)* @finish_pass_phuff, void (%struct.jpeg_compress_struct*)* @finish_pass_gather_phuff
  store void (%struct.jpeg_compress_struct*)* %finish_pass_phuff.sink, void (%struct.jpeg_compress_struct*)** %32, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %34 = load i32, i32* %33, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %29
  %36 = icmp eq i32 %11, 0
  %sunkaddr72 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr73 = add i64 %sunkaddr72, 412
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i32*
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %.cast3 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %38 = icmp eq i32 %1, 0
  %39 = icmp eq i32 %1, 0
  %40 = icmp eq i32 %11, 0
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %.cast1 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr75 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr80 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %42 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 8
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %.cast2 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %44 = icmp eq i32 %1, 0
  %45 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %46 = bitcast %struct.jpeg_memory_mgr** %41 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  br i1 %36, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %89
  %indvars.iv = phi i64 [ %indvars.iv.next, %89 ], [ 0, %.lr.ph.split.us.preheader ]
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %48 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %47, align 8
  %49 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 7, i64 %indvars.iv
  store i32 0, i32* %49, align 4
  %50 = load i32, i32* %sunkaddr74, align 4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %89

; <label>:52:                                     ; preds = %.lr.ph.split.us
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i64 0, i32 5
  %54 = load i32, i32* %53, align 4
  %55 = icmp ugt i32 %54, 3
  br i1 %55, label %61, label %56

; <label>:56:                                     ; preds = %52
  %57 = sext i32 %54 to i64
  %58 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %57
  %59 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %58, align 8
  %60 = icmp eq %struct.JHUFF_TBL* %59, null
  %or.cond7.us = and i1 %38, %60
  br i1 %or.cond7.us, label %61, label %68

; <label>:61:                                     ; preds = %56, %52
  %62 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %63 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %62, i64 0, i32 5
  store i32 49, i32* %63, align 8
  %64 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %65 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %64, i64 0, i32 6, i32 0, i64 0
  store i32 %54, i32* %65, align 4
  %66 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %45, align 8
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  tail call void %67(%struct.jpeg_common_struct* nonnull %.cast3) #3
  br label %68

; <label>:68:                                     ; preds = %61, %56
  %69 = sext i32 %54 to i64
  br i1 %39, label %80, label %70

; <label>:70:                                     ; preds = %68
  %71 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 15, i64 %69
  %72 = load i64*, i64** %71, align 8
  %73 = icmp eq i64* %72, null
  br i1 %73, label %74, label %78

; <label>:74:                                     ; preds = %70
  %75 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %46, align 8
  %76 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %75, align 8
  %77 = tail call i8* %76(%struct.jpeg_common_struct* nonnull %.cast1, i32 1, i64 2056) #3
  %sunkaddr76.us = shl nsw i64 %69, 3
  %sunkaddr77.us = add i64 %sunkaddr75, %sunkaddr76.us
  %sunkaddr78.us = add i64 %sunkaddr77.us, 152
  %sunkaddr79.us = inttoptr i64 %sunkaddr78.us to i8**
  store i8* %77, i8** %sunkaddr79.us, align 8
  br label %78

; <label>:78:                                     ; preds = %74, %70
  %sunkaddr81.us = shl nsw i64 %69, 3
  %sunkaddr82.us = add i64 %sunkaddr80, %sunkaddr81.us
  %sunkaddr83.us = add i64 %sunkaddr82.us, 152
  %sunkaddr84.us = inttoptr i64 %sunkaddr83.us to i8**
  %79 = load i8*, i8** %sunkaddr84.us, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %79, i8 0, i64 2056, i32 1, i1 false)
  br label %89

; <label>:80:                                     ; preds = %68
  br i1 %40, label %85, label %81

; <label>:81:                                     ; preds = %80
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %69
  %83 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %82, align 8
  %84 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 14, i64 %69
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %83, %struct.c_derived_tbl** %84) #3
  br label %89

; <label>:85:                                     ; preds = %80
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %69
  %87 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %86, align 8
  %88 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 14, i64 %69
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %87, %struct.c_derived_tbl** %88) #3
  br label %89

; <label>:89:                                     ; preds = %85, %81, %78, %.lr.ph.split.us
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %90 = load i32, i32* %33, align 4
  %91 = sext i32 %90 to i64
  %92 = icmp slt i64 %indvars.iv.next, %91
  br i1 %92, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %132
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %132 ], [ 0, %.lr.ph.split.preheader ]
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv87
  %94 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %93, align 8
  %95 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 7, i64 %indvars.iv87
  store i32 0, i32* %95, align 4
  %96 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %94, i64 0, i32 6
  %97 = load i32, i32* %96, align 8
  store i32 %97, i32* %42, align 8
  %98 = icmp ugt i32 %97, 3
  br i1 %98, label %104, label %99

; <label>:99:                                     ; preds = %.lr.ph.split
  %100 = sext i32 %97 to i64
  %101 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %100
  %102 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %101, align 8
  %103 = icmp eq %struct.JHUFF_TBL* %102, null
  %or.cond11 = and i1 %44, %103
  br i1 %or.cond11, label %104, label %111

; <label>:104:                                    ; preds = %99, %.lr.ph.split
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 5
  store i32 49, i32* %106, align 8
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i64 0, i32 6, i32 0, i64 0
  store i32 %97, i32* %108, align 4
  %109 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %45, align 8
  %110 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %109, align 8
  tail call void %110(%struct.jpeg_common_struct* nonnull %.cast2) #3
  br label %111

; <label>:111:                                    ; preds = %99, %104
  %112 = sext i32 %97 to i64
  br i1 %39, label %123, label %113

; <label>:113:                                    ; preds = %111
  %114 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 15, i64 %112
  %115 = load i64*, i64** %114, align 8
  %116 = icmp eq i64* %115, null
  br i1 %116, label %117, label %121

; <label>:117:                                    ; preds = %113
  %118 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %46, align 8
  %119 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %118, align 8
  %120 = tail call i8* %119(%struct.jpeg_common_struct* nonnull %.cast1, i32 1, i64 2056) #3
  %sunkaddr76 = shl nsw i64 %112, 3
  %sunkaddr77 = add i64 %sunkaddr75, %sunkaddr76
  %sunkaddr78 = add i64 %sunkaddr77, 152
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to i8**
  store i8* %120, i8** %sunkaddr79, align 8
  br label %121

; <label>:121:                                    ; preds = %117, %113
  %sunkaddr81 = shl nsw i64 %112, 3
  %sunkaddr82 = add i64 %sunkaddr80, %sunkaddr81
  %sunkaddr83 = add i64 %sunkaddr82, 152
  %sunkaddr84 = inttoptr i64 %sunkaddr83 to i8**
  %122 = load i8*, i8** %sunkaddr84, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %122, i8 0, i64 2056, i32 1, i1 false)
  br label %132

; <label>:123:                                    ; preds = %111
  br i1 %40, label %124, label %128

; <label>:124:                                    ; preds = %123
  %125 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %112
  %126 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %125, align 8
  %127 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 14, i64 %112
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %126, %struct.c_derived_tbl** %127) #3
  br label %132

; <label>:128:                                    ; preds = %123
  %129 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %112
  %130 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %129, align 8
  %131 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 14, i64 %112
  tail call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %130, %struct.c_derived_tbl** %131) #3
  br label %132

; <label>:132:                                    ; preds = %121, %128, %124
  %indvars.iv.next88 = add nuw i64 %indvars.iv87, 1
  %133 = load i32, i32* %33, align 4
  %134 = sext i32 %133 to i64
  %135 = icmp slt i64 %indvars.iv.next88, %134
  br i1 %135, label %.lr.ph.split, label %._crit_edge.loopexit91

._crit_edge.loopexit:                             ; preds = %89
  br label %._crit_edge

._crit_edge.loopexit91:                           ; preds = %132
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit91, %._crit_edge.loopexit, %29
  %136 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 9
  store i32 0, i32* %136, align 4
  %137 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 10
  store i32 0, i32* %137, align 8
  %138 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 4
  store i64 0, i64* %138, align 8
  %139 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 5
  store i32 0, i32* %139, align 8
  %140 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %141 = load i32, i32* %140, align 8
  %142 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 12
  store i32 %141, i32* %142, align 8
  %143 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 13
  store i32 0, i32* %143, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_DC_first(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
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
  tail call void @emit_restart(%struct.phuff_entropy_encoder* nonnull %5, i32 %27)
  br label %.preheader

.preheader:                                       ; preds = %21, %25, %2
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph65.preheader, label %._crit_edge66

.lr.ph65.preheader:                               ; preds = %.preheader
  br label %.lr.ph65

.lr.ph65:                                         ; preds = %.lr.ph65.preheader, %55
  %indvars.iv = phi i64 [ %indvars.iv.next, %55 ], [ 0, %.lr.ph65.preheader ]
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
  %.lobit = ashr i32 %44, 31
  %. = add nsw i32 %.lobit, %44
  %.41 = select i1 %45, i32 %46, i32 %44
  %47 = icmp eq i32 %.41, 0
  br i1 %47, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph65
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.163 = phi i32 [ %49, %.lr.ph ], [ %.41, %.lr.ph.preheader ]
  %.04062 = phi i32 [ %48, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %48 = add nuw nsw i32 %.04062, 1
  %49 = ashr i32 %.163, 1
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph65
  %.040.lcssa = phi i32 [ 0, %.lr.ph65 ], [ %48, %._crit_edge.loopexit ]
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %38, i64 0, i32 5
  %52 = load i32, i32* %51, align 4
  tail call void @emit_symbol(%struct.phuff_entropy_encoder* %5, i32 %52, i32 %.040.lcssa)
  %53 = icmp eq i32 %.040.lcssa, 0
  br i1 %53, label %55, label %54

; <label>:54:                                     ; preds = %._crit_edge
  tail call void @emit_bits(%struct.phuff_entropy_encoder* %5, i32 %., i32 %.040.lcssa)
  br label %55

; <label>:55:                                     ; preds = %54, %._crit_edge
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %56 = load i32, i32* %28, align 8
  %57 = sext i32 %56 to i64
  %58 = icmp slt i64 %indvars.iv.next, %57
  br i1 %58, label %.lr.ph65, label %._crit_edge66.loopexit

._crit_edge66.loopexit:                           ; preds = %55
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66.loopexit, %.preheader
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr42 = add i64 %sunkaddr, 32
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i64*
  %59 = load i64, i64* %sunkaddr43, align 8
  %sunkaddr44 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 32
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to i64**
  %60 = load i64*, i64** %sunkaddr46, align 8
  store i64 %59, i64* %60, align 8
  %sunkaddr47 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr48 = add i64 %sunkaddr47, 40
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i64*
  %61 = load i64, i64* %sunkaddr49, align 8
  %sunkaddr50 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 32
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to %struct.jpeg_destination_mgr**
  %62 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr52, align 8
  %63 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %62, i64 0, i32 1
  store i64 %61, i64* %63, align 8
  %sunkaddr53 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr54 = add i64 %sunkaddr53, 272
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to i32*
  %64 = load i32, i32* %sunkaddr55, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %78, label %66

; <label>:66:                                     ; preds = %._crit_edge66
  %67 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %68 = load i32, i32* %67, align 8
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %75

; <label>:70:                                     ; preds = %66
  %sunkaddr56 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr57 = add i64 %sunkaddr56, 112
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to i32*
  store i32 %64, i32* %sunkaddr58, align 8
  %71 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %72 = load i32, i32* %71, align 4
  %73 = add nsw i32 %72, 1
  %74 = and i32 %73, 7
  store i32 %74, i32* %71, align 4
  br label %75

; <label>:75:                                     ; preds = %70, %66
  %sunkaddr59 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr60 = add i64 %sunkaddr59, 112
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to i32*
  %76 = load i32, i32* %sunkaddr61, align 8
  %77 = add i32 %76, -1
  store i32 %77, i32* %sunkaddr61, align 8
  br label %78

; <label>:78:                                     ; preds = %._crit_edge66, %75
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_AC_first(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.phuff_entropy_encoder**
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  %7 = load i32, i32* %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %11 = bitcast %struct.jpeg_destination_mgr** %10 to i64**
  %12 = load i64*, i64** %11, align 8
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 2
  %15 = bitcast i8** %14 to i64*
  store i64 %13, i64* %15, align 8
  %16 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %10, align 8
  %17 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %16, i64 0, i32 1
  %18 = load i64, i64* %17, align 8
  %19 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 3
  store i64 %18, i64* %19, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %21 = load i32, i32* %20, align 8
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %30, label %23

; <label>:23:                                     ; preds = %2
  %24 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %29 = load i32, i32* %28, align 4
  tail call void @emit_restart(%struct.phuff_entropy_encoder* nonnull %5, i32 %29)
  br label %30

; <label>:30:                                     ; preds = %23, %27, %2
  %31 = load [64 x i16]*, [64 x i16]** %1, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %33 = load i32, i32* %32, align 4
  %34 = icmp sgt i32 %33, %7
  br i1 %34, label %._crit_edge.thread, label %.lr.ph72

.lr.ph72:                                         ; preds = %30
  %35 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 9
  %36 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 8
  %37 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 8
  %38 = sext i32 %33 to i64
  %39 = sext i32 %7 to i64
  br label %40

; <label>:40:                                     ; preds = %76, %.lr.ph72
  %indvars.iv = phi i64 [ %indvars.iv.next, %76 ], [ %38, %.lr.ph72 ]
  %.04670 = phi i32 [ %.2, %76 ], [ 0, %.lr.ph72 ]
  %41 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %42 = load i32, i32* %41, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [64 x i16], [64 x i16]* %31, i64 0, i64 %43
  %45 = load i16, i16* %44, align 2
  %46 = sext i16 %45 to i32
  %47 = icmp eq i16 %45, 0
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %40
  %49 = add nsw i32 %.04670, 1
  br label %76

; <label>:50:                                     ; preds = %40
  %51 = icmp slt i16 %45, 0
  %52 = sub nsw i32 0, %46
  %53 = ashr i32 %52, %9
  %54 = xor i32 %53, -1
  %55 = lshr i32 %46, %9
  %.0 = select i1 %51, i32 %53, i32 %55
  %storemerge1 = select i1 %51, i32 %54, i32 %55
  %56 = icmp eq i32 %.0, 0
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %50
  %58 = add nsw i32 %.04670, 1
  br label %76

; <label>:59:                                     ; preds = %50
  %60 = load i32, i32* %35, align 4
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %.preheader68, label %62

; <label>:62:                                     ; preds = %59
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* nonnull %5)
  br label %.preheader68

.preheader68:                                     ; preds = %59, %62
  %63 = icmp sgt i32 %.04670, 15
  br i1 %63, label %.lr.ph.preheader, label %.preheader

.lr.ph.preheader:                                 ; preds = %.preheader68
  br label %.lr.ph

.preheader.loopexit:                              ; preds = %.lr.ph
  %64 = and i32 %.04670, 15
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader68
  %.147.lcssa = phi i32 [ %.04670, %.preheader68 ], [ %64, %.preheader.loopexit ]
  br label %68

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.14769 = phi i32 [ %66, %.lr.ph ], [ %.04670, %.lr.ph.preheader ]
  %65 = load i32, i32* %37, align 8
  tail call void @emit_symbol(%struct.phuff_entropy_encoder* nonnull %5, i32 %65, i32 240)
  %66 = add nsw i32 %.14769, -16
  %67 = icmp sgt i32 %66, 15
  br i1 %67, label %.lr.ph, label %.preheader.loopexit

; <label>:68:                                     ; preds = %68, %.preheader
  %.1 = phi i32 [ %69, %68 ], [ %.0, %.preheader ]
  %storemerge2 = phi i32 [ %71, %68 ], [ 1, %.preheader ]
  %69 = ashr i32 %.1, 1
  %70 = icmp eq i32 %69, 0
  %71 = add nuw nsw i32 %storemerge2, 1
  br i1 %70, label %72, label %68

; <label>:72:                                     ; preds = %68
  %73 = load i32, i32* %36, align 8
  %74 = shl i32 %.147.lcssa, 4
  %75 = add nsw i32 %storemerge2, %74
  tail call void @emit_symbol(%struct.phuff_entropy_encoder* %5, i32 %73, i32 %75)
  tail call void @emit_bits(%struct.phuff_entropy_encoder* %5, i32 %storemerge1, i32 %storemerge2)
  br label %76

; <label>:76:                                     ; preds = %72, %57, %48
  %.2 = phi i32 [ %49, %48 ], [ %58, %57 ], [ 0, %72 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %77 = icmp slt i64 %indvars.iv, %39
  br i1 %77, label %40, label %._crit_edge

._crit_edge:                                      ; preds = %76
  %78 = icmp sgt i32 %.2, 0
  br i1 %78, label %79, label %._crit_edge.thread

; <label>:79:                                     ; preds = %._crit_edge
  %80 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 9
  %81 = load i32, i32* %80, align 4
  %82 = add i32 %81, 1
  store i32 %82, i32* %80, align 4
  %83 = icmp eq i32 %82, 32767
  br i1 %83, label %84, label %._crit_edge.thread

; <label>:84:                                     ; preds = %79
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* nonnull %5)
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %30, %79, %84, %._crit_edge
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr48 = add i64 %sunkaddr, 32
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i64*
  %85 = load i64, i64* %sunkaddr49, align 8
  %sunkaddr50 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr51 = add i64 %sunkaddr50, 32
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to i64**
  %86 = load i64*, i64** %sunkaddr52, align 8
  store i64 %85, i64* %86, align 8
  %sunkaddr53 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr54 = add i64 %sunkaddr53, 40
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to i64*
  %87 = load i64, i64* %sunkaddr55, align 8
  %sunkaddr56 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr57 = add i64 %sunkaddr56, 32
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to %struct.jpeg_destination_mgr**
  %88 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr58, align 8
  %89 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %88, i64 0, i32 1
  store i64 %87, i64* %89, align 8
  %sunkaddr59 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr60 = add i64 %sunkaddr59, 272
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to i32*
  %90 = load i32, i32* %sunkaddr61, align 8
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %104, label %92

; <label>:92:                                     ; preds = %._crit_edge.thread
  %93 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %94 = load i32, i32* %93, align 8
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %101

; <label>:96:                                     ; preds = %92
  %sunkaddr62 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr63 = add i64 %sunkaddr62, 112
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i32*
  store i32 %90, i32* %sunkaddr64, align 8
  %97 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %98 = load i32, i32* %97, align 4
  %99 = add nsw i32 %98, 1
  %100 = and i32 %99, 7
  store i32 %100, i32* %97, align 4
  br label %101

; <label>:101:                                    ; preds = %96, %92
  %sunkaddr65 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr66 = add i64 %sunkaddr65, 112
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to i32*
  %102 = load i32, i32* %sunkaddr67, align 8
  %103 = add i32 %102, -1
  store i32 %103, i32* %sunkaddr67, align 8
  br label %104

; <label>:104:                                    ; preds = %._crit_edge.thread, %101
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_DC_refine(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
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
  tail call void @emit_restart(%struct.phuff_entropy_encoder* nonnull %5, i32 %27)
  br label %.preheader

.preheader:                                       ; preds = %21, %25, %2
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %31 = getelementptr inbounds [64 x i16]*, [64 x i16]** %1, i64 %indvars.iv
  %32 = bitcast [64 x i16]** %31 to i16**
  %33 = load i16*, i16** %32, align 8
  %34 = load i16, i16* %33, align 2
  %35 = sext i16 %34 to i32
  %36 = ashr i32 %35, %7
  tail call void @emit_bits(%struct.phuff_entropy_encoder* %5, i32 %36, i32 1)
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %37 = load i32, i32* %28, align 8
  %38 = sext i32 %37 to i64
  %39 = icmp slt i64 %indvars.iv.next, %38
  br i1 %39, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr20 = add i64 %sunkaddr, 32
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i64*
  %40 = load i64, i64* %sunkaddr21, align 8
  %sunkaddr22 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 32
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i64**
  %41 = load i64*, i64** %sunkaddr24, align 8
  store i64 %40, i64* %41, align 8
  %sunkaddr25 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 40
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i64*
  %42 = load i64, i64* %sunkaddr27, align 8
  %sunkaddr28 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 32
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to %struct.jpeg_destination_mgr**
  %43 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr30, align 8
  %44 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %43, i64 0, i32 1
  store i64 %42, i64* %44, align 8
  %sunkaddr31 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 272
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  %45 = load i32, i32* %sunkaddr33, align 8
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %59, label %47

; <label>:47:                                     ; preds = %._crit_edge
  %48 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 12
  %49 = load i32, i32* %48, align 8
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %56

; <label>:51:                                     ; preds = %47
  %sunkaddr34 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 112
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to i32*
  store i32 %45, i32* %sunkaddr36, align 8
  %52 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 13
  %53 = load i32, i32* %52, align 4
  %54 = add nsw i32 %53, 1
  %55 = and i32 %54, 7
  store i32 %55, i32* %52, align 4
  br label %56

; <label>:56:                                     ; preds = %51, %47
  %sunkaddr37 = ptrtoint %struct.phuff_entropy_encoder* %5 to i64
  %sunkaddr38 = add i64 %sunkaddr37, 112
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to i32*
  %57 = load i32, i32* %sunkaddr39, align 8
  %58 = add i32 %57, -1
  store i32 %58, i32* %sunkaddr39, align 8
  br label %59

; <label>:59:                                     ; preds = %._crit_edge, %56
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @encode_mcu_AC_refine(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca [64 x i32], align 16
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %5 = bitcast %struct.jpeg_entropy_encoder** %4 to %struct.phuff_entropy_encoder**
  %6 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  %8 = load i32, i32* %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %12 = bitcast %struct.jpeg_destination_mgr** %11 to i64**
  %13 = load i64*, i64** %12, align 8
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 2
  %16 = bitcast i8** %15 to i64*
  store i64 %14, i64* %16, align 8
  %17 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %11, align 8
  %18 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %17, i64 0, i32 1
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 3
  store i64 %19, i64* %20, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %31, label %24

; <label>:24:                                     ; preds = %2
  %25 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 12
  %26 = load i32, i32* %25, align 8
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %24
  %29 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 13
  %30 = load i32, i32* %29, align 4
  tail call void @emit_restart(%struct.phuff_entropy_encoder* nonnull %6, i32 %30)
  br label %31

; <label>:31:                                     ; preds = %24, %28, %2
  %32 = bitcast [64 x i16]** %1 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %35 = load i32, i32* %34, align 4
  %36 = icmp sgt i32 %35, %8
  br i1 %36, label %._crit_edge122, label %.lr.ph121

.lr.ph121:                                        ; preds = %31
  %37 = inttoptr i64 %33 to [64 x i16]*
  %38 = sext i32 %35 to i64
  %39 = sext i32 %8 to i64
  br label %40

; <label>:40:                                     ; preds = %40, %.lr.ph121
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %40 ], [ %38, %.lr.ph121 ]
  %.069118 = phi i32 [ %.170, %40 ], [ 0, %.lr.ph121 ]
  %41 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv125
  %42 = load i32, i32* %41, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [64 x i16], [64 x i16]* %37, i64 0, i64 %43
  %45 = load i16, i16* %44, align 2
  %46 = sext i16 %45 to i32
  %47 = icmp slt i16 %45, 0
  %48 = sub nsw i32 0, %46
  %. = select i1 %47, i32 %48, i32 %46
  %49 = ashr i32 %., %10
  %50 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %indvars.iv125
  store i32 %49, i32* %50, align 4
  %51 = icmp eq i32 %49, 1
  %52 = trunc i64 %indvars.iv125 to i32
  %.170 = select i1 %51, i32 %52, i32 %.069118
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  %53 = icmp slt i64 %indvars.iv125, %39
  br i1 %53, label %40, label %._crit_edge122.loopexit

._crit_edge122.loopexit:                          ; preds = %40
  %phitmp = sext i32 %.170 to i64
  br label %._crit_edge122

._crit_edge122:                                   ; preds = %._crit_edge122.loopexit, %31
  %.069.lcssa = phi i64 [ 0, %31 ], [ %phitmp, %._crit_edge122.loopexit ]
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr73 = add i64 %sunkaddr, 404
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i32*
  %54 = load i32, i32* %sunkaddr74, align 4
  %55 = icmp sgt i32 %54, %8
  br i1 %55, label %._crit_edge, label %.lr.ph115

.lr.ph115:                                        ; preds = %._crit_edge122
  %56 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 11
  %57 = load i8*, i8** %56, align 8
  %58 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 10
  %59 = load i32, i32* %58, align 8
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %57, i64 %60
  %62 = ptrtoint i8* %61 to i64
  %63 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 8
  %sunkaddr75 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr76 = add i64 %sunkaddr75, 104
  %sunkaddr77 = inttoptr i64 %sunkaddr76 to i64*
  %64 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 8
  %65 = inttoptr i64 %33 to [64 x i16]*
  %sunkaddr78 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr79 = add i64 %sunkaddr78, 104
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to i64*
  %66 = sext i32 %54 to i64
  %67 = sext i32 %8 to i64
  br label %68

; <label>:68:                                     ; preds = %106, %.lr.ph115
  %indvars.iv = phi i64 [ %indvars.iv.next, %106 ], [ %66, %.lr.ph115 ]
  %.065113 = phi i32 [ %.2, %106 ], [ 0, %.lr.ph115 ]
  %.066112 = phi i32 [ %.268, %106 ], [ 0, %.lr.ph115 ]
  %.sroa.011.0111 = phi i64 [ %.sroa.011.2, %106 ], [ %62, %.lr.ph115 ]
  %69 = getelementptr inbounds [64 x i32], [64 x i32]* %3, i64 0, i64 %indvars.iv
  %70 = load i32, i32* %69, align 4
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %79, label %.preheader

.preheader:                                       ; preds = %68
  %72 = icmp sgt i32 %.065113, 15
  %73 = icmp sle i64 %indvars.iv, %.069.lcssa
  %or.cond71105 = and i1 %73, %72
  br i1 %or.cond71105, label %.lr.ph, label %.critedge

.lr.ph:                                           ; preds = %.preheader
  br i1 %73, label %.lr.ph.split.us.preheader, label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %.lr.ph.split.us
  %.1108.us = phi i32 [ %75, %.lr.ph.split.us ], [ %.065113, %.lr.ph.split.us.preheader ]
  %.167107.us = phi i32 [ 0, %.lr.ph.split.us ], [ %.066112, %.lr.ph.split.us.preheader ]
  %.sroa.011.1106.us = phi i64 [ %77, %.lr.ph.split.us ], [ %.sroa.011.0111, %.lr.ph.split.us.preheader ]
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* %6)
  %74 = load i32, i32* %63, align 8
  tail call void @emit_symbol(%struct.phuff_entropy_encoder* %6, i32 %74, i32 240)
  %75 = add nsw i32 %.1108.us, -16
  %76 = inttoptr i64 %.sroa.011.1106.us to i8*
  tail call void @emit_buffered_bits(%struct.phuff_entropy_encoder* %6, i8* %76, i32 %.167107.us)
  %77 = load i64, i64* %sunkaddr77, align 8
  %78 = icmp sgt i32 %75, 15
  br i1 %78, label %.lr.ph.split.us, label %.critedge.loopexit

; <label>:79:                                     ; preds = %68
  %80 = add nsw i32 %.065113, 1
  br label %106

.lr.ph.split:                                     ; preds = %.lr.ph
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* %6)
  %81 = load i32, i32* %63, align 8
  tail call void @emit_symbol(%struct.phuff_entropy_encoder* %6, i32 %81, i32 240)
  %82 = add nsw i32 %.065113, -16
  %83 = inttoptr i64 %.sroa.011.0111 to i8*
  tail call void @emit_buffered_bits(%struct.phuff_entropy_encoder* %6, i8* %83, i32 %.066112)
  %84 = load i64, i64* %sunkaddr77, align 8
  br label %.critedge

.critedge.loopexit:                               ; preds = %.lr.ph.split.us
  %85 = and i32 %.065113, 15
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.lr.ph.split, %.preheader
  %.sroa.011.1.lcssa = phi i64 [ %.sroa.011.0111, %.preheader ], [ %84, %.lr.ph.split ], [ %77, %.critedge.loopexit ]
  %.167.lcssa = phi i32 [ %.066112, %.preheader ], [ 0, %.lr.ph.split ], [ 0, %.critedge.loopexit ]
  %.1.lcssa = phi i32 [ %.065113, %.preheader ], [ %82, %.lr.ph.split ], [ %85, %.critedge.loopexit ]
  %86 = icmp sgt i32 %70, 1
  br i1 %86, label %87, label %94

; <label>:87:                                     ; preds = %.critedge
  %88 = trunc i32 %70 to i8
  %89 = and i8 %88, 1
  %90 = inttoptr i64 %.sroa.011.1.lcssa to i8*
  %91 = add i32 %.167.lcssa, 1
  %92 = zext i32 %.167.lcssa to i64
  %93 = getelementptr inbounds i8, i8* %90, i64 %92
  store i8 %89, i8* %93, align 1
  br label %106

; <label>:94:                                     ; preds = %.critedge
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* %6)
  %95 = load i32, i32* %64, align 8
  %96 = shl i32 %.1.lcssa, 4
  %97 = or i32 %96, 1
  tail call void @emit_symbol(%struct.phuff_entropy_encoder* %6, i32 %95, i32 %97)
  %98 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %99 = load i32, i32* %98, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [64 x i16], [64 x i16]* %65, i64 0, i64 %100
  %102 = load i16, i16* %101, align 2
  %.lobit = lshr i16 %102, 15
  %103 = xor i16 %.lobit, 1
  %.not = zext i16 %103 to i32
  tail call void @emit_bits(%struct.phuff_entropy_encoder* %6, i32 %.not, i32 1)
  %104 = inttoptr i64 %.sroa.011.1.lcssa to i8*
  tail call void @emit_buffered_bits(%struct.phuff_entropy_encoder* %6, i8* %104, i32 %.167.lcssa)
  %105 = load i64, i64* %sunkaddr80, align 8
  br label %106

; <label>:106:                                    ; preds = %94, %87, %79
  %.sroa.011.2 = phi i64 [ %.sroa.011.0111, %79 ], [ %.sroa.011.1.lcssa, %87 ], [ %105, %94 ]
  %.268 = phi i32 [ %.066112, %79 ], [ %91, %87 ], [ 0, %94 ]
  %.2 = phi i32 [ %80, %79 ], [ %.1.lcssa, %87 ], [ 0, %94 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %107 = icmp slt i64 %indvars.iv, %67
  br i1 %107, label %68, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %106
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge122
  %.066.lcssa = phi i32 [ 0, %._crit_edge122 ], [ %.268, %._crit_edge.loopexit ]
  %.065.lcssa = phi i32 [ 0, %._crit_edge122 ], [ %.2, %._crit_edge.loopexit ]
  %108 = icmp slt i32 %.065.lcssa, 1
  %109 = icmp eq i32 %.066.lcssa, 0
  %or.cond = and i1 %109, %108
  br i1 %or.cond, label %119, label %110

; <label>:110:                                    ; preds = %._crit_edge
  %111 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 9
  %112 = load i32, i32* %111, align 4
  %113 = add i32 %112, 1
  store i32 %113, i32* %111, align 4
  %sunkaddr81 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr82 = add i64 %sunkaddr81, 96
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to i32*
  %114 = load i32, i32* %sunkaddr83, align 8
  %115 = add i32 %114, %.066.lcssa
  store i32 %115, i32* %sunkaddr83, align 8
  %116 = icmp eq i32 %113, 32767
  %117 = icmp ugt i32 %115, 937
  %or.cond72 = or i1 %116, %117
  br i1 %or.cond72, label %118, label %119

; <label>:118:                                    ; preds = %110
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* nonnull %6)
  br label %119

; <label>:119:                                    ; preds = %110, %118, %._crit_edge
  %sunkaddr84 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr85 = add i64 %sunkaddr84, 32
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to i64*
  %120 = load i64, i64* %sunkaddr86, align 8
  %sunkaddr87 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr88 = add i64 %sunkaddr87, 32
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to i64**
  %121 = load i64*, i64** %sunkaddr89, align 8
  store i64 %120, i64* %121, align 8
  %sunkaddr90 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr91 = add i64 %sunkaddr90, 40
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to i64*
  %122 = load i64, i64* %sunkaddr92, align 8
  %sunkaddr93 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr94 = add i64 %sunkaddr93, 32
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to %struct.jpeg_destination_mgr**
  %123 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %sunkaddr95, align 8
  %124 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %123, i64 0, i32 1
  store i64 %122, i64* %124, align 8
  %sunkaddr96 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr97 = add i64 %sunkaddr96, 272
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to i32*
  %125 = load i32, i32* %sunkaddr98, align 8
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %139, label %127

; <label>:127:                                    ; preds = %119
  %128 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 12
  %129 = load i32, i32* %128, align 8
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %136

; <label>:131:                                    ; preds = %127
  %sunkaddr99 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr100 = add i64 %sunkaddr99, 112
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to i32*
  store i32 %125, i32* %sunkaddr101, align 8
  %132 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %6, i64 0, i32 13
  %133 = load i32, i32* %132, align 4
  %134 = add nsw i32 %133, 1
  %135 = and i32 %134, 7
  store i32 %135, i32* %132, align 4
  br label %136

; <label>:136:                                    ; preds = %131, %127
  %sunkaddr102 = ptrtoint %struct.phuff_entropy_encoder* %6 to i64
  %sunkaddr103 = add i64 %sunkaddr102, 112
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to i32*
  %137 = load i32, i32* %sunkaddr104, align 8
  %138 = add i32 %137, -1
  store i32 %138, i32* %sunkaddr104, align 8
  br label %139

; <label>:139:                                    ; preds = %119, %136
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_gather_phuff(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca [4 x i32], align 16
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %4 = bitcast %struct.jpeg_entropy_encoder** %3 to %struct.phuff_entropy_encoder**
  %5 = load %struct.phuff_entropy_encoder*, %struct.phuff_entropy_encoder** %4, align 8
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* %5)
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
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  %14 = icmp eq i32 %7, 0
  %15 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint [4 x i32]* %2 to i64
  br i1 %12, label %.lr.ph.split.us.preheader, label %.lr.ph.split.split.preheader

.lr.ph.split.split.preheader:                     ; preds = %.lr.ph
  br label %.lr.ph.split.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %37
  %indvars.iv = phi i64 [ %indvars.iv.next, %37 ], [ 0, %.lr.ph.split.us.preheader ]
  %16 = load i32, i32* %13, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %37

; <label>:18:                                     ; preds = %.lr.ph.split.us
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %20 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %20, i64 0, i32 5
  %storemerge1.us = load i32, i32* %21, align 4
  %22 = sext i32 %storemerge1.us to i64
  %23 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %22
  %24 = load i32, i32* %23, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %37

; <label>:26:                                     ; preds = %18
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %22
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %22
  %storemerge2.us = select i1 %14, %struct.JHUFF_TBL** %28, %struct.JHUFF_TBL** %27
  %29 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %storemerge2.us, align 8
  %30 = icmp eq %struct.JHUFF_TBL* %29, null
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %26
  %32 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %15) #3
  store %struct.JHUFF_TBL* %32, %struct.JHUFF_TBL** %storemerge2.us, align 8
  br label %33

; <label>:33:                                     ; preds = %31, %26
  %34 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %storemerge2.us, align 8
  %35 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 15, i64 %22
  %36 = load i64*, i64** %35, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %34, i64* %36) #3
  %sunkaddr18.us = shl nsw i64 %22, 2
  %sunkaddr19.us = add i64 %sunkaddr, %sunkaddr18.us
  %sunkaddr20.us = inttoptr i64 %sunkaddr19.us to i32*
  store i32 1, i32* %sunkaddr20.us, align 4
  br label %37

; <label>:37:                                     ; preds = %33, %18, %.lr.ph.split.us
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %38 = load i32, i32* %9, align 4
  %39 = sext i32 %38 to i64
  %40 = icmp slt i64 %indvars.iv.next, %39
  br i1 %40, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split.split:                               ; preds = %.lr.ph.split.split.preheader, %58
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %58 ], [ 0, %.lr.ph.split.split.preheader ]
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv30
  %42 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i64 0, i32 6
  %storemerge1 = load i32, i32* %43, align 4
  %44 = sext i32 %storemerge1 to i64
  %45 = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 0, i64 %44
  %46 = load i32, i32* %45, align 4
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %58

; <label>:48:                                     ; preds = %.lr.ph.split.split
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %44
  %50 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %49, align 8
  %51 = icmp eq %struct.JHUFF_TBL* %50, null
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %48
  %53 = tail call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* nonnull %15) #3
  store %struct.JHUFF_TBL* %53, %struct.JHUFF_TBL** %49, align 8
  br label %54

; <label>:54:                                     ; preds = %52, %48
  %55 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %49, align 8
  %56 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %5, i64 0, i32 15, i64 %44
  %57 = load i64*, i64** %56, align 8
  tail call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* nonnull %0, %struct.JHUFF_TBL* %55, i64* %57) #3
  %sunkaddr18 = shl nsw i64 %44, 2
  %sunkaddr19 = add i64 %sunkaddr, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  store i32 1, i32* %sunkaddr20, align 4
  br label %58

; <label>:58:                                     ; preds = %54, %.lr.ph.split.split
  %indvars.iv.next31 = add nuw i64 %indvars.iv30, 1
  %59 = load i32, i32* %9, align 4
  %60 = sext i32 %59 to i64
  %61 = icmp slt i64 %indvars.iv.next31, %60
  br i1 %61, label %.lr.ph.split.split, label %._crit_edge.loopexit34

._crit_edge.loopexit:                             ; preds = %37
  br label %._crit_edge

._crit_edge.loopexit34:                           ; preds = %58
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit34, %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_phuff(%struct.jpeg_compress_struct*) #0 {
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
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* %4)
  tail call void @flush_bits(%struct.phuff_entropy_encoder* %4)
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

declare void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, %struct.c_derived_tbl**) #2

; Function Attrs: noinline nounwind uwtable
define internal void @emit_restart(%struct.phuff_entropy_encoder*, i32) #0 {
  tail call void @emit_eobrun(%struct.phuff_entropy_encoder* %0)
  %3 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 1
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %24

; <label>:6:                                      ; preds = %2
  tail call void @flush_bits(%struct.phuff_entropy_encoder* nonnull %0)
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
  tail call void @dump_buffer(%struct.phuff_entropy_encoder* nonnull %0)
  br label %15

; <label>:15:                                     ; preds = %14, %6
  %16 = add nsw i32 %1, 208
  %17 = trunc i32 %16 to i8
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr, 32
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i8**
  %18 = load i8*, i8** %sunkaddr12, align 8
  %19 = getelementptr inbounds i8, i8* %18, i64 1
  store i8* %19, i8** %sunkaddr12, align 8
  store i8 %17, i8* %18, align 1
  %sunkaddr13 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 40
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i64*
  %20 = load i64, i64* %sunkaddr15, align 8
  %21 = add i64 %20, -1
  store i64 %21, i64* %sunkaddr15, align 8
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %24

; <label>:23:                                     ; preds = %15
  tail call void @dump_buffer(%struct.phuff_entropy_encoder* nonnull %0)
  br label %24

; <label>:24:                                     ; preds = %15, %23, %2
  %25 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 6
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i64 0, i32 47
  %28 = load i32, i32* %27, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %.preheader, label %40

.preheader:                                       ; preds = %24
  %sunkaddr16 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 64
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to %struct.jpeg_compress_struct**
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %sunkaddr18, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i64 0, i32 41
  %32 = load i32, i32* %31, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %34 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 7, i64 %indvars.iv
  store i32 0, i32* %34, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %sunkaddr18, align 8
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
define internal void @emit_symbol(%struct.phuff_entropy_encoder*, i32, i32) #0 {
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
  tail call void @emit_bits(%struct.phuff_entropy_encoder* nonnull %0, i32 %13, i32 %16)
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
define internal void @emit_bits(%struct.phuff_entropy_encoder*, i32, i32) #0 {
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
  br i1 %21, label %22, label %62

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
  %35 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 2
  %36 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 3
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr20 = add i64 %sunkaddr, 32
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i8**
  %sunkaddr22 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 40
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i64*
  br label %37

; <label>:37:                                     ; preds = %.lr.ph, %56
  %.032 = phi i64 [ %33, %.lr.ph ], [ %57, %56 ]
  %.01931 = phi i32 [ %27, %.lr.ph ], [ %58, %56 ]
  %38 = lshr i64 %.032, 16
  %39 = trunc i64 %38 to i8
  %40 = load i8*, i8** %35, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 1
  store i8* %41, i8** %35, align 8
  store i8 %39, i8* %40, align 1
  %42 = load i64, i64* %36, align 8
  %43 = add i64 %42, -1
  store i64 %43, i64* %36, align 8
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %45, label %46

; <label>:45:                                     ; preds = %37
  tail call void @dump_buffer(%struct.phuff_entropy_encoder* nonnull %0)
  br label %46

; <label>:46:                                     ; preds = %45, %37
  %47 = and i64 %38, 255
  %48 = icmp eq i64 %47, 255
  br i1 %48, label %49, label %56

; <label>:49:                                     ; preds = %46
  %50 = load i8*, i8** %sunkaddr21, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 1
  store i8* %51, i8** %sunkaddr21, align 8
  store i8 0, i8* %50, align 1
  %52 = load i64, i64* %sunkaddr24, align 8
  %53 = add i64 %52, -1
  store i64 %53, i64* %sunkaddr24, align 8
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %55, label %56

; <label>:55:                                     ; preds = %49
  tail call void @dump_buffer(%struct.phuff_entropy_encoder* nonnull %0)
  br label %56

; <label>:56:                                     ; preds = %49, %55, %46
  %57 = shl i64 %.032, 8
  %58 = add nsw i32 %.01931, -8
  %59 = icmp sgt i32 %58, 7
  br i1 %59, label %37, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %56
  %60 = add i32 %6, %2
  %61 = and i32 %60, 7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %22
  %.019.lcssa = phi i32 [ %27, %22 ], [ %61, %._crit_edge.loopexit ]
  %.0.lcssa = phi i64 [ %33, %22 ], [ %57, %._crit_edge.loopexit ]
  %sunkaddr25 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 48
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i64*
  store i64 %.0.lcssa, i64* %sunkaddr27, align 8
  %sunkaddr28 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 56
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  store i32 %.019.lcssa, i32* %sunkaddr30, align 8
  br label %62

; <label>:62:                                     ; preds = %18, %._crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_eobrun(%struct.phuff_entropy_encoder*) #0 {
  %2 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 9
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %20, label %.preheader.preheader

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.0 = phi i32 [ %5, %.preheader ], [ %3, %.preheader.preheader ]
  %storemerge = phi i32 [ %7, %.preheader ], [ 0, %.preheader.preheader ]
  %5 = ashr i32 %.0, 1
  %6 = icmp eq i32 %5, 0
  %7 = add nuw nsw i32 %storemerge, 1
  br i1 %6, label %8, label %.preheader

; <label>:8:                                      ; preds = %.preheader
  %9 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 8
  %10 = load i32, i32* %9, align 8
  %11 = shl i32 %storemerge, 4
  tail call void @emit_symbol(%struct.phuff_entropy_encoder* %0, i32 %10, i32 %11)
  %12 = icmp eq i32 %storemerge, 0
  br i1 %12, label %15, label %13

; <label>:13:                                     ; preds = %8
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr8 = add i64 %sunkaddr, 92
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  %14 = load i32, i32* %sunkaddr9, align 4
  tail call void @emit_bits(%struct.phuff_entropy_encoder* nonnull %0, i32 %14, i32 %storemerge)
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %sunkaddr10 = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 92
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i32*
  store i32 0, i32* %sunkaddr12, align 4
  %16 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 11
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 10
  %19 = load i32, i32* %18, align 8
  tail call void @emit_buffered_bits(%struct.phuff_entropy_encoder* nonnull %0, i8* %17, i32 %19)
  store i32 0, i32* %18, align 8
  br label %20

; <label>:20:                                     ; preds = %1, %15
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @flush_bits(%struct.phuff_entropy_encoder*) #0 {
  tail call void @emit_bits(%struct.phuff_entropy_encoder* %0, i32 127, i32 7)
  %2 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 4
  store i64 0, i64* %2, align 8
  %3 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 5
  store i32 0, i32* %3, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @dump_buffer(%struct.phuff_entropy_encoder*) #0 {
  %2 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 6
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i64 0, i32 5
  %5 = bitcast %struct.jpeg_destination_mgr** %4 to i64*
  %6 = load i64, i64* %5, align 8
  %.cast = inttoptr i64 %6 to %struct.jpeg_destination_mgr*
  %7 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %.cast, i64 0, i32 3
  %8 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %7, align 8
  %9 = tail call i32 %8(%struct.jpeg_compress_struct* %3) #3
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %20

; <label>:11:                                     ; preds = %1
  %sunkaddr = ptrtoint %struct.phuff_entropy_encoder* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr, 64
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct.jpeg_compress_struct**
  %12 = inttoptr i64 %sunkaddr7 to %struct.jpeg_error_mgr***
  %13 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %12, align 8
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 5
  store i32 22, i32* %15, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %sunkaddr8, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %16 to void (%struct.jpeg_common_struct*)***
  %18 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %17, align 8
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  %.cast6 = bitcast %struct.jpeg_compress_struct* %16 to %struct.jpeg_common_struct*
  tail call void %19(%struct.jpeg_common_struct* %.cast6) #3
  br label %20

; <label>:20:                                     ; preds = %1, %11
  %21 = inttoptr i64 %6 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 2
  %24 = bitcast i8** %23 to i64*
  store i64 %22, i64* %24, align 8
  %25 = getelementptr inbounds i64, i64* %21, i64 1
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 3
  store i64 %26, i64* %27, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_buffered_bits(%struct.phuff_entropy_encoder*, i8*, i32) #0 {
  %4 = getelementptr inbounds %struct.phuff_entropy_encoder, %struct.phuff_entropy_encoder* %0, i64 0, i32 1
  %5 = load i32, i32* %4, align 8
  %6 = icmp ne i32 %5, 0
  %7 = icmp eq i32 %2, 0
  %or.cond = or i1 %7, %6
  br i1 %or.cond, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.05 = phi i8* [ %10, %.preheader ], [ %1, %.preheader.preheader ]
  %.0 = phi i32 [ %11, %.preheader ], [ %2, %.preheader.preheader ]
  %8 = load i8, i8* %.05, align 1
  %9 = sext i8 %8 to i32
  tail call void @emit_bits(%struct.phuff_entropy_encoder* %0, i32 %9, i32 1)
  %10 = getelementptr inbounds i8, i8* %.05, i64 1
  %11 = add i32 %.0, -1
  %.old1 = icmp eq i32 %11, 0
  br i1 %.old1, label %.loopexit.loopexit, label %.preheader

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) #2

declare void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, i64*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
