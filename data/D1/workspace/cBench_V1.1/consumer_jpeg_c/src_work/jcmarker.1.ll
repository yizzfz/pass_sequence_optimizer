; ModuleID = 'jcmarker.ll'
source_filename = "jcmarker.c"
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

@jpeg_natural_order = external local_unnamed_addr constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jinit_marker_writer(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 48) #1
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %9 = bitcast %struct.jpeg_marker_writer** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*, i32, i8*, i32)**
  store void (%struct.jpeg_compress_struct*, i32, i8*, i32)* @write_any_marker, void (%struct.jpeg_compress_struct*, i32, i8*, i32)** %10, align 8
  %11 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %8, align 8
  %12 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %11, i64 0, i32 1
  %13 = bitcast {}** %12 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_file_header, void (%struct.jpeg_compress_struct*)** %13, align 8
  %14 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %8, align 8
  %15 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %14, i64 0, i32 2
  %16 = bitcast {}** %15 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_frame_header, void (%struct.jpeg_compress_struct*)** %16, align 8
  %17 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %8, align 8
  %18 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %17, i64 0, i32 3
  %19 = bitcast {}** %18 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_scan_header, void (%struct.jpeg_compress_struct*)** %19, align 8
  %20 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %8, align 8
  %21 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %20, i64 0, i32 4
  %22 = bitcast {}** %21 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_file_trailer, void (%struct.jpeg_compress_struct*)** %22, align 8
  %23 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %8, align 8
  %24 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %23, i64 0, i32 5
  %25 = bitcast {}** %24 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_tables_only, void (%struct.jpeg_compress_struct*)** %25, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_any_marker(%struct.jpeg_compress_struct*, i32, i8* nocapture readonly, i32) #0 {
  %5 = icmp ult i32 %3, 65534
  br i1 %5, label %6, label %.loopexit

; <label>:6:                                      ; preds = %4
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 %1)
  %7 = add i32 %3, 2
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %7)
  %8 = icmp eq i32 %3, 0
  br i1 %8, label %.loopexit, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %9, %.lr.ph ], [ %3, %.lr.ph.preheader ]
  %.012 = phi i8* [ %12, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %9 = add i32 %.03, -1
  %10 = load i8, i8* %.012, align 1
  %11 = zext i8 %10 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %11)
  %12 = getelementptr inbounds i8, i8* %.012, i64 1
  %13 = icmp eq i32 %9, 0
  br i1 %13, label %.loopexit.loopexit, label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %6, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_file_header(%struct.jpeg_compress_struct*) #0 {
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 216)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 31
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5:                                      ; preds = %1
  tail call fastcc void @emit_jfif_app0(%struct.jpeg_compress_struct* nonnull %0)
  br label %6

; <label>:6:                                      ; preds = %1, %5
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 35
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10:                                     ; preds = %6
  tail call fastcc void @emit_adobe_app14(%struct.jpeg_compress_struct* nonnull %0)
  ret void

; <label>:11:                                     ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_frame_header(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %3 = load i32, i32* %2, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %1
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr, 80
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to %struct.jpeg_component_info**
  %5 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr18, align 8
  %sunkaddr41 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 68
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i32*
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13, %.lr.ph13.preheader
  %.011 = phi %struct.jpeg_component_info* [ %11, %.lr.ph13 ], [ %5, %.lr.ph13.preheader ]
  %.0110 = phi i32 [ %10, %.lr.ph13 ], [ 0, %.lr.ph13.preheader ]
  %.039 = phi i32 [ %9, %.lr.ph13 ], [ 0, %.lr.ph13.preheader ]
  %6 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 0, i32 4
  %7 = load i32, i32* %6, align 8
  %8 = tail call fastcc i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 %7)
  %9 = add nsw i32 %8, %.039
  %10 = add nuw nsw i32 %.0110, 1
  %11 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 1
  %12 = load i32, i32* %sunkaddr43, align 4
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %.lr.ph13, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %.lr.ph13
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %1
  %.03.lcssa = phi i32 [ 0, %1 ], [ %9, %._crit_edge14.loopexit ]
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  %15 = load i32, i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %.thread

; <label>:17:                                     ; preds = %._crit_edge14
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %53

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 8
  br i1 %24, label %25, label %53

; <label>:25:                                     ; preds = %21
  %sunkaddr22 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 68
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  %26 = load i32, i32* %sunkaddr24, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %25
  %sunkaddr25 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 80
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to %struct.jpeg_component_info**
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr27, align 8
  %sunkaddr28 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 68
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  %29 = load i32, i32* %sunkaddr30, align 4
  br label %30

; <label>:30:                                     ; preds = %39, %.lr.ph
  %.18 = phi %struct.jpeg_component_info* [ %28, %.lr.ph ], [ %41, %39 ]
  %.127 = phi i32 [ 0, %.lr.ph ], [ %40, %39 ]
  %.046 = phi i32 [ 1, %.lr.ph ], [ %.15, %39 ]
  %31 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.18, i64 0, i32 5
  %32 = load i32, i32* %31, align 4
  %33 = icmp sgt i32 %32, 1
  br i1 %33, label %38, label %34

; <label>:34:                                     ; preds = %30
  %35 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.18, i64 0, i32 6
  %36 = load i32, i32* %35, align 8
  %37 = icmp sgt i32 %36, 1
  br i1 %37, label %38, label %39

; <label>:38:                                     ; preds = %34, %30
  br label %39

; <label>:39:                                     ; preds = %34, %38
  %.15 = phi i32 [ 0, %38 ], [ %.046, %34 ]
  %40 = add nuw nsw i32 %.127, 1
  %41 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.18, i64 1
  %42 = icmp slt i32 %40, %29
  br i1 %42, label %30, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %39
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %25
  %.04.lcssa = phi i32 [ 1, %25 ], [ %.15, %._crit_edge.loopexit ]
  %43 = icmp eq i32 %.03.lcssa, 0
  %44 = icmp eq i32 %.04.lcssa, 0
  %or.cond = or i1 %43, %44
  br i1 %or.cond, label %53, label %45

; <label>:45:                                     ; preds = %._crit_edge
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 5
  store i32 74, i32* %48, align 8
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i64 0, i32 1
  %51 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %50, align 8
  %52 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %51(%struct.jpeg_common_struct* %52, i32 0) #1
  br label %53

; <label>:53:                                     ; preds = %._crit_edge, %21, %17, %45
  %.3.ph = phi i32 [ 0, %45 ], [ 0, %17 ], [ 0, %21 ], [ %.04.lcssa, %._crit_edge ]
  %sunkaddr31 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 252
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  %.pr = load i32, i32* %sunkaddr33, align 4
  %54 = icmp eq i32 %.pr, 0
  br i1 %54, label %55, label %.thread

.thread:                                          ; preds = %53, %._crit_edge14
  tail call fastcc void @emit_sof(%struct.jpeg_compress_struct* nonnull %0, i32 201)
  ret void

; <label>:55:                                     ; preds = %53
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %57 = load i32, i32* %56, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %60, label %59

; <label>:59:                                     ; preds = %55
  tail call fastcc void @emit_sof(%struct.jpeg_compress_struct* nonnull %0, i32 194)
  ret void

; <label>:60:                                     ; preds = %55
  %61 = icmp eq i32 %.3.ph, 0
  br i1 %61, label %63, label %62

; <label>:62:                                     ; preds = %60
  tail call fastcc void @emit_sof(%struct.jpeg_compress_struct* nonnull %0, i32 192)
  ret void

; <label>:63:                                     ; preds = %60
  tail call fastcc void @emit_sof(%struct.jpeg_compress_struct* nonnull %0, i32 193)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_scan_header(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %1
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %6 = load i32, i32* %5, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr15 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 300
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %sunkaddr23 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 316
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr, 404
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  %sunkaddr20 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 412
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %29
  %indvars.iv = phi i64 [ %indvars.iv.next, %29 ], [ 0, %.lr.ph.preheader ]
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %9 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %10 = load i32, i32* %sunkaddr17, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %24, label %12

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load i32, i32* %sunkaddr19, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %21

; <label>:15:                                     ; preds = %12
  %16 = load i32, i32* %sunkaddr22, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %29

; <label>:18:                                     ; preds = %15
  %19 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %9, i64 0, i32 5
  %20 = load i32, i32* %19, align 4
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 %20, i32 0)
  br label %29

; <label>:21:                                     ; preds = %12
  %22 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %9, i64 0, i32 6
  %23 = load i32, i32* %22, align 8
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 %23, i32 1)
  br label %29

; <label>:24:                                     ; preds = %.lr.ph
  %25 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %9, i64 0, i32 5
  %26 = load i32, i32* %25, align 4
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 %26, i32 0)
  %27 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %9, i64 0, i32 6
  %28 = load i32, i32* %27, align 8
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 %28, i32 1)
  br label %29

; <label>:29:                                     ; preds = %15, %24, %18, %21
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %30 = load i32, i32* %sunkaddr25, align 4
  %31 = sext i32 %30 to i64
  %32 = icmp slt i64 %indvars.iv.next, %31
  br i1 %32, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %29
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %1
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %34 = load i32, i32* %33, align 8
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %37, label %36

; <label>:36:                                     ; preds = %.loopexit
  tail call fastcc void @emit_dri(%struct.jpeg_compress_struct* nonnull %0)
  br label %37

; <label>:37:                                     ; preds = %.loopexit, %36
  tail call fastcc void @emit_sos(%struct.jpeg_compress_struct* nonnull %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_file_trailer(%struct.jpeg_compress_struct*) #0 {
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 217)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_tables_only(%struct.jpeg_compress_struct*) #0 {
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 216)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 0
  %3 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %2, align 8
  %4 = icmp eq %struct.JQUANT_TBL* %3, null
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %1
  %6 = tail call fastcc i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 0)
  br label %7

; <label>:7:                                      ; preds = %1, %5
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 1
  %9 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %8, align 8
  %10 = icmp eq %struct.JQUANT_TBL* %9, null
  br i1 %10, label %49, label %47

.preheader:                                       ; preds = %61
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 0
  %12 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %11, align 8
  %13 = icmp eq %struct.JHUFF_TBL* %12, null
  br i1 %13, label %15, label %14

; <label>:14:                                     ; preds = %.preheader
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 0, i32 0)
  br label %15

; <label>:15:                                     ; preds = %.preheader, %14
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 0
  %17 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %16, align 8
  %18 = icmp eq %struct.JHUFF_TBL* %17, null
  br i1 %18, label %.preheader.13, label %19

; <label>:19:                                     ; preds = %15
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 0, i32 1)
  br label %.preheader.13

.preheader.13:                                    ; preds = %15, %19
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 1
  %21 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %20, align 8
  %22 = icmp eq %struct.JHUFF_TBL* %21, null
  br i1 %22, label %24, label %23

.loopexit:                                        ; preds = %61, %42, %46
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* nonnull %0, i32 217)
  ret void

; <label>:23:                                     ; preds = %.preheader.13
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 1, i32 0)
  br label %24

; <label>:24:                                     ; preds = %.preheader.13, %23
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 1
  %26 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %25, align 8
  %27 = icmp eq %struct.JHUFF_TBL* %26, null
  br i1 %27, label %.preheader.24, label %28

; <label>:28:                                     ; preds = %24
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 1, i32 1)
  br label %.preheader.24

.preheader.24:                                    ; preds = %24, %28
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 2
  %30 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %29, align 8
  %31 = icmp eq %struct.JHUFF_TBL* %30, null
  br i1 %31, label %33, label %32

; <label>:32:                                     ; preds = %.preheader.24
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 2, i32 0)
  br label %33

; <label>:33:                                     ; preds = %.preheader.24, %32
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 2
  %35 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %34, align 8
  %36 = icmp eq %struct.JHUFF_TBL* %35, null
  br i1 %36, label %.preheader.35, label %37

; <label>:37:                                     ; preds = %33
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 2, i32 1)
  br label %.preheader.35

.preheader.35:                                    ; preds = %33, %37
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 3
  %39 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %38, align 8
  %40 = icmp eq %struct.JHUFF_TBL* %39, null
  br i1 %40, label %42, label %41

; <label>:41:                                     ; preds = %.preheader.35
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 3, i32 0)
  br label %42

; <label>:42:                                     ; preds = %.preheader.35, %41
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 3
  %44 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %43, align 8
  %45 = icmp eq %struct.JHUFF_TBL* %44, null
  br i1 %45, label %.loopexit, label %46

; <label>:46:                                     ; preds = %42
  tail call fastcc void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 3, i32 1)
  br label %.loopexit

; <label>:47:                                     ; preds = %7
  %48 = tail call fastcc i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 1)
  br label %49

; <label>:49:                                     ; preds = %7, %47
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 2
  %51 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %50, align 8
  %52 = icmp eq %struct.JQUANT_TBL* %51, null
  br i1 %52, label %55, label %53

; <label>:53:                                     ; preds = %49
  %54 = tail call fastcc i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 2)
  br label %55

; <label>:55:                                     ; preds = %49, %53
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 3
  %57 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %56, align 8
  %58 = icmp eq %struct.JQUANT_TBL* %57, null
  br i1 %58, label %61, label %59

; <label>:59:                                     ; preds = %55
  %60 = tail call fastcc i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 3)
  br label %61

; <label>:61:                                     ; preds = %55, %59
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  %63 = load i32, i32* %62, align 4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %.preheader, label %.loopexit
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_marker(%struct.jpeg_compress_struct*, i32) unnamed_addr #0 {
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 255)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_2bytes(%struct.jpeg_compress_struct*, i32) unnamed_addr #0 {
  %3 = lshr i32 %1, 8
  %4 = and i32 %3, 255
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %4)
  %5 = and i32 %1, 255
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %5)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_byte(%struct.jpeg_compress_struct*, i32) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 5
  %4 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %3, align 8
  %5 = trunc i32 %1 to i8
  %6 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %4, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds i8, i8* %7, i64 1
  store i8* %8, i8** %6, align 8
  store i8 %5, i8* %7, align 1
  %9 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %4, i64 0, i32 1
  %10 = load i64, i64* %9, align 8
  %11 = add i64 %10, -1
  store i64 %11, i64* %9, align 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %26

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %4, i64 0, i32 3
  %15 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %14, align 8
  %16 = tail call i32 %15(%struct.jpeg_compress_struct* nonnull %0) #1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %26

; <label>:18:                                     ; preds = %13
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 22, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %24(%struct.jpeg_common_struct* %25) #1
  ret void

; <label>:26:                                     ; preds = %13, %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_jfif_app0(%struct.jpeg_compress_struct*) unnamed_addr #0 {
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 224)
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 16)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 74)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 70)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 73)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 70)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 0)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 1)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 1)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 32
  %3 = load i8, i8* %2, align 4
  %4 = zext i8 %3 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %4)
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 33
  %6 = load i16, i16* %5, align 2
  %7 = zext i16 %6 to i32
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %7)
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 34
  %9 = load i16, i16* %8, align 8
  %10 = zext i16 %9 to i32
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %10)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 0)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_adobe_app14(%struct.jpeg_compress_struct*) unnamed_addr #0 {
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 238)
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 14)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 65)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 100)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 111)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 98)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 101)
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 100)
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 0)
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 0)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 13
  %3 = load i32, i32* %2, align 8
  switch i32 %3, label %6 [
    i32 3, label %4
    i32 5, label %5
  ]

; <label>:4:                                      ; preds = %1
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 1)
  ret void

; <label>:5:                                      ; preds = %1
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 2)
  ret void

; <label>:6:                                      ; preds = %1
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @emit_dqt(%struct.jpeg_compress_struct*, i32) unnamed_addr #0 {
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 %3
  %5 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %4, align 8
  %6 = icmp eq %struct.JQUANT_TBL* %5, null
  br i1 %6, label %7, label %.preheader.preheader

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 51, i32* %10, align 8
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 0
  store i32 %1, i32* %12, align 4
  %13 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #1
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %2, %7
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next12.3.1, %.preheader ]
  %.015 = phi i32 [ 0, %.preheader.preheader ], [ %..01.3.1, %.preheader ]
  %17 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv11
  %18 = load i16, i16* %17, align 2
  %indvars.iv.next12 = or i64 %indvars.iv11, 1
  %19 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next12
  %20 = load i16, i16* %19, align 2
  %21 = or i16 %20, %18
  %indvars.iv.next12.1 = or i64 %indvars.iv11, 2
  %22 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next12.1
  %23 = load i16, i16* %22, align 2
  %24 = or i16 %23, %21
  %indvars.iv.next12.2 = or i64 %indvars.iv11, 3
  %25 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next12.2
  %26 = load i16, i16* %25, align 2
  %27 = or i16 %26, %24
  %indvars.iv.next12.3 = or i64 %indvars.iv11, 4
  %28 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next12.3
  %29 = load i16, i16* %28, align 2
  %indvars.iv.next12.120 = or i64 %indvars.iv11, 5
  %30 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next12.120
  %31 = load i16, i16* %30, align 2
  %32 = or i16 %31, %29
  %indvars.iv.next12.1.1 = or i64 %indvars.iv11, 6
  %33 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next12.1.1
  %34 = load i16, i16* %33, align 2
  %35 = or i16 %34, %32
  %indvars.iv.next12.2.1 = or i64 %indvars.iv11, 7
  %36 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next12.2.1
  %37 = load i16, i16* %36, align 2
  %38 = or i16 %37, %35
  %39 = or i16 %38, %27
  %40 = icmp ugt i16 %39, 255
  %..01.3.1 = select i1 %40, i32 1, i32 %.015
  %indvars.iv.next12.3.1 = add nsw i64 %indvars.iv11, 8
  %exitcond13.3.1 = icmp eq i64 %indvars.iv.next12.3.1, 64
  br i1 %exitcond13.3.1, label %41, label %.preheader

; <label>:41:                                     ; preds = %.preheader
  %42 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 1
  %43 = load i32, i32* %42, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %66

; <label>:45:                                     ; preds = %41
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 219)
  %46 = icmp ne i32 %..01.3.1, 0
  %47 = select i1 %46, i32 131, i32 67
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %47)
  %48 = shl i32 %..01.3.1, 4
  %49 = add nsw i32 %48, %1
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %49)
  %50 = icmp eq i32 %..01.3.1, 0
  br i1 %50, label %.split.us.preheader, label %.split.preheader

.split.preheader:                                 ; preds = %45
  br label %.split

.split.us.preheader:                              ; preds = %45
  br label %.split.us

.split.us:                                        ; preds = %.split.us.preheader, %.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %.split.us ], [ 0, %.split.us.preheader ]
  %51 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv
  %52 = load i32, i32* %51, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %53
  %55 = load i16, i16* %54, align 2
  %56 = and i16 %55, 255
  %57 = zext i16 %56 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %57)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond, label %.us-lcssa.us.loopexit, label %.split.us

.split:                                           ; preds = %.split.preheader, %.split
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %.split ], [ 0, %.split.preheader ]
  %58 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv8
  %59 = load i32, i32* %58, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %60
  %62 = load i16, i16* %61, align 2
  %63 = zext i16 %62 to i32
  %64 = lshr i32 %63, 8
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %64)
  %65 = and i32 %63, 255
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %65)
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 64
  br i1 %exitcond10, label %.us-lcssa.us.loopexit19, label %.split

.us-lcssa.us.loopexit:                            ; preds = %.split.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit19:                          ; preds = %.split
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit19, %.us-lcssa.us.loopexit
  %sunkaddr = ptrtoint %struct.JQUANT_TBL* %5 to i64
  %sunkaddr15 = add i64 %sunkaddr, 128
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  store i32 1, i32* %sunkaddr16, align 4
  br label %66

; <label>:66:                                     ; preds = %41, %.us-lcssa.us
  ret i32 %..01.3.1
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_sof(%struct.jpeg_compress_struct*, i32) unnamed_addr #0 {
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 %1)
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %4 = load i32, i32* %3, align 4
  %5 = mul nsw i32 %4, 3
  %6 = add nsw i32 %5, 8
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %6)
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %8 = load i32, i32* %7, align 4
  %9 = icmp ugt i32 %8, 65535
  br i1 %9, label %14, label %10

; <label>:10:                                     ; preds = %2
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %13 = icmp ugt i32 %12, 65535
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %10, %2
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 40, i32* %17, align 8
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i64 0, i32 6, i32 0, i64 0
  store i32 65535, i32* %19, align 4
  %20 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %21 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %20, align 8
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %22(%struct.jpeg_common_struct* %23) #1
  br label %24

; <label>:24:                                     ; preds = %10, %14
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  %26 = load i32, i32* %25, align 8
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %26)
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr, 44
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %27 = load i32, i32* %sunkaddr5, align 4
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* nonnull %0, i32 %27)
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %29 = load i32, i32* %28, align 8
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* nonnull %0, i32 %29)
  %sunkaddr6 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 68
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %30 = load i32, i32* %sunkaddr8, align 4
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %30)
  %31 = load i32, i32* %sunkaddr8, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %24
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %34 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %33, align 8
  %sunkaddr15 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 68
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.03 = phi %struct.jpeg_component_info* [ %46, %.lr.ph ], [ %34, %.lr.ph.preheader ]
  %.012 = phi i32 [ %45, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %35 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 0
  %36 = load i32, i32* %35, align 8
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %36)
  %37 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 2
  %38 = load i32, i32* %37, align 8
  %39 = shl i32 %38, 4
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %41 = load i32, i32* %40, align 4
  %42 = add nsw i32 %39, %41
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %42)
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 4
  %44 = load i32, i32* %43, align 8
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %44)
  %45 = add nuw nsw i32 %.012, 1
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %47 = load i32, i32* %sunkaddr17, align 4
  %48 = icmp slt i32 %45, %47
  br i1 %48, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %24
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_dht(%struct.jpeg_compress_struct*, i32, i32) unnamed_addr #0 {
  %4 = icmp eq i32 %2, 0
  %5 = sext i32 %1 to i64
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 %5
  %7 = add nsw i32 %1, 16
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 %5
  %.03.in = select i1 %4, %struct.JHUFF_TBL** %8, %struct.JHUFF_TBL** %6
  %.01 = select i1 %4, i32 %1, i32 %7
  %.03 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %.03.in, align 8
  %9 = icmp eq %struct.JHUFF_TBL* %.03, null
  br i1 %9, label %10, label %20

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 49, i32* %13, align 8
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 6, i32 0, i64 0
  store i32 %.01, i32* %15, align 4
  %16 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %17 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %16, align 8
  %18 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %17, align 8
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %18(%struct.jpeg_common_struct* %19) #1
  br label %20

; <label>:20:                                     ; preds = %3, %10
  %21 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 2
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %.preheader11, label %140

.preheader11:                                     ; preds = %20
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 196)
  %24 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 1
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 2
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = add nuw nsw i32 %29, %26
  %31 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 3
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = add nuw nsw i32 %33, %30
  %35 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 4
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = add nuw nsw i32 %37, %34
  %39 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 5
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = add nuw nsw i32 %41, %38
  %43 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 6
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = add nuw nsw i32 %45, %42
  %47 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 7
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = add nuw nsw i32 %49, %46
  %51 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 8
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = add nsw i32 %53, %50
  %55 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 9
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = add nsw i32 %57, %54
  %59 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 10
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  %62 = add nsw i32 %61, %58
  %63 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 11
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = add nsw i32 %65, %62
  %67 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 12
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = add nsw i32 %69, %66
  %71 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 13
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = add nsw i32 %73, %70
  %75 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 14
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = add nsw i32 %77, %74
  %79 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 15
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = add nsw i32 %81, %78
  %83 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 16
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = add nsw i32 %85, %82
  %87 = add nsw i32 %86, 19
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %87)
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %.01)
  %88 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 1
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %90)
  %91 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 2
  %92 = load i8, i8* %91, align 1
  %93 = zext i8 %92 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %93)
  %94 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 3
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %96)
  %97 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 4
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %99)
  %100 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 5
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %102)
  %103 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 6
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %105)
  %106 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 7
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %108)
  %109 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 8
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %111)
  %112 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 9
  %113 = load i8, i8* %112, align 1
  %114 = zext i8 %113 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %114)
  %115 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 10
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %117)
  %118 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 11
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %120)
  %121 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 12
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %123)
  %124 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 13
  %125 = load i8, i8* %124, align 1
  %126 = zext i8 %125 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %126)
  %127 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 14
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %129)
  %130 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 15
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %132)
  %133 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 16
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %135)
  %136 = icmp sgt i32 %86, 0
  br i1 %136, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader11
  %wide.trip.count = zext i32 %86 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %137 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 1, i64 %indvars.iv
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %139)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader11
  %sunkaddr = ptrtoint %struct.JHUFF_TBL* %.03 to i64
  %sunkaddr15 = add i64 %sunkaddr, 276
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  store i32 1, i32* %sunkaddr16, align 4
  br label %140

; <label>:140:                                    ; preds = %20, %._crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_dri(%struct.jpeg_compress_struct*) unnamed_addr #0 {
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 221)
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 4)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %3 = load i32, i32* %2, align 8
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @emit_sos(%struct.jpeg_compress_struct*) unnamed_addr #0 {
  tail call fastcc void @emit_marker(%struct.jpeg_compress_struct* %0, i32 218)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %3 = load i32, i32* %2, align 4
  %4 = shl i32 %3, 1
  %5 = add nsw i32 %4, 6
  tail call fastcc void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %5)
  %6 = load i32, i32* %2, align 4
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %6)
  %7 = load i32, i32* %2, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %1
  %sunkaddr24 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 300
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i32*
  %sunkaddr35 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr36 = add i64 %sunkaddr35, 316
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr, 404
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %sunkaddr29 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 412
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i32*
  %sunkaddr32 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 252
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %28
  %indvars.iv = phi i64 [ %indvars.iv.next, %28 ], [ 0, %.lr.ph.preheader ]
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  %10 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %10, i64 0, i32 0
  %12 = load i32, i32* %11, align 8
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %12)
  %13 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %10, i64 0, i32 5
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %10, i64 0, i32 6
  %16 = load i32, i32* %15, align 8
  %17 = load i32, i32* %sunkaddr26, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %28, label %19

; <label>:19:                                     ; preds = %.lr.ph
  %20 = load i32, i32* %sunkaddr28, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %28

; <label>:22:                                     ; preds = %19
  %23 = load i32, i32* %sunkaddr31, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %28, label %25

; <label>:25:                                     ; preds = %22
  %26 = load i32, i32* %sunkaddr34, align 4
  %27 = icmp eq i32 %26, 0
  %. = select i1 %27, i32 0, i32 %14
  br label %28

; <label>:28:                                     ; preds = %22, %19, %.lr.ph, %25
  %.2 = phi i32 [ %., %25 ], [ %14, %.lr.ph ], [ 0, %19 ], [ %14, %22 ]
  %.1 = phi i32 [ 0, %25 ], [ %16, %.lr.ph ], [ %16, %19 ], [ 0, %22 ]
  %29 = shl i32 %.2, 4
  %30 = add nsw i32 %29, %.1
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %30)
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %31 = load i32, i32* %sunkaddr37, align 4
  %32 = sext i32 %31 to i64
  %33 = icmp slt i64 %indvars.iv.next, %32
  br i1 %33, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %28
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %35 = load i32, i32* %34, align 4
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %35)
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  %37 = load i32, i32* %36, align 8
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %37)
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  %39 = load i32, i32* %38, align 4
  %40 = shl i32 %39, 4
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  %42 = load i32, i32* %41, align 8
  %43 = add nsw i32 %40, %42
  tail call fastcc void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %43)
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
