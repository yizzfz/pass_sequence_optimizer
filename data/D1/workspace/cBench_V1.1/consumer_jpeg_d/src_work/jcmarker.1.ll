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

@jpeg_natural_order = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind uwtable
define void @jinit_marker_writer(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %3, i64 0, i32 0
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
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 %1)
  %7 = add i32 %3, 2
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %7)
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
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %11)
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
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 216)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 31
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5:                                      ; preds = %1
  tail call void @emit_jfif_app0(%struct.jpeg_compress_struct* nonnull %0)
  br label %6

; <label>:6:                                      ; preds = %1, %5
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 35
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10:                                     ; preds = %6
  tail call void @emit_adobe_app14(%struct.jpeg_compress_struct* nonnull %0)
  br label %11

; <label>:11:                                     ; preds = %6, %10
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_frame_header(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %4 = load i32, i32* %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %1
  %6 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %2, align 8
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13.preheader, %.lr.ph13
  %.011 = phi %struct.jpeg_component_info* [ %12, %.lr.ph13 ], [ %6, %.lr.ph13.preheader ]
  %.0110 = phi i32 [ %11, %.lr.ph13 ], [ 0, %.lr.ph13.preheader ]
  %.039 = phi i32 [ %10, %.lr.ph13 ], [ 0, %.lr.ph13.preheader ]
  %7 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 0, i32 4
  %8 = load i32, i32* %7, align 8
  %9 = tail call i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 %8)
  %10 = add nsw i32 %9, %.039
  %11 = add nuw nsw i32 %.0110, 1
  %12 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 1
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 %11, %13
  br i1 %14, label %.lr.ph13, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %.lr.ph13
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %1
  %.03.lcssa = phi i32 [ 0, %1 ], [ %10, %._crit_edge14.loopexit ]
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %.thread

; <label>:18:                                     ; preds = %._crit_edge14
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %20 = load i32, i32* %19, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %54

; <label>:22:                                     ; preds = %18
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  %24 = load i32, i32* %23, align 8
  %25 = icmp eq i32 %24, 8
  br i1 %25, label %26, label %54

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %3, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %26
  %29 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %2, align 8
  %30 = load i32, i32* %3, align 4
  br label %31

; <label>:31:                                     ; preds = %.lr.ph, %40
  %.18 = phi %struct.jpeg_component_info* [ %29, %.lr.ph ], [ %42, %40 ]
  %.127 = phi i32 [ 0, %.lr.ph ], [ %41, %40 ]
  %.046 = phi i32 [ 1, %.lr.ph ], [ %.15, %40 ]
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.18, i64 0, i32 5
  %33 = load i32, i32* %32, align 4
  %34 = icmp sgt i32 %33, 1
  br i1 %34, label %39, label %35

; <label>:35:                                     ; preds = %31
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.18, i64 0, i32 6
  %37 = load i32, i32* %36, align 8
  %38 = icmp sgt i32 %37, 1
  br i1 %38, label %39, label %40

; <label>:39:                                     ; preds = %35, %31
  br label %40

; <label>:40:                                     ; preds = %35, %39
  %.15 = phi i32 [ 0, %39 ], [ %.046, %35 ]
  %41 = add nuw nsw i32 %.127, 1
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.18, i64 1
  %43 = icmp slt i32 %41, %30
  br i1 %43, label %31, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %40
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %26
  %.04.lcssa = phi i32 [ 1, %26 ], [ %.15, %._crit_edge.loopexit ]
  %44 = icmp ne i32 %.03.lcssa, 0
  %45 = icmp ne i32 %.04.lcssa, 0
  %or.cond = and i1 %44, %45
  br i1 %or.cond, label %46, label %54

; <label>:46:                                     ; preds = %._crit_edge
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i64 0, i32 5
  store i32 74, i32* %49, align 8
  %50 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %51 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %50, i64 0, i32 1
  %52 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %51, align 8
  %53 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %52(%struct.jpeg_common_struct* %53, i32 0) #1
  br label %54

; <label>:54:                                     ; preds = %22, %18, %._crit_edge, %46
  %.3.ph = phi i32 [ %.04.lcssa, %._crit_edge ], [ 0, %46 ], [ 0, %18 ], [ 0, %22 ]
  %.pr = load i32, i32* %15, align 4
  %55 = icmp eq i32 %.pr, 0
  br i1 %55, label %56, label %.thread

.thread:                                          ; preds = %54, %._crit_edge14
  tail call void @emit_sof(%struct.jpeg_compress_struct* nonnull %0, i32 201)
  br label %65

; <label>:56:                                     ; preds = %54
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %58 = load i32, i32* %57, align 4
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %61, label %60

; <label>:60:                                     ; preds = %56
  tail call void @emit_sof(%struct.jpeg_compress_struct* nonnull %0, i32 194)
  br label %65

; <label>:61:                                     ; preds = %56
  %62 = icmp eq i32 %.3.ph, 0
  br i1 %62, label %64, label %63

; <label>:63:                                     ; preds = %61
  tail call void @emit_sof(%struct.jpeg_compress_struct* nonnull %0, i32 192)
  br label %65

; <label>:64:                                     ; preds = %61
  tail call void @emit_sof(%struct.jpeg_compress_struct* nonnull %0, i32 193)
  br label %65

; <label>:65:                                     ; preds = %60, %64, %63, %.thread
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
  br i1 %7, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.preheader
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  br label %11

; <label>:11:                                     ; preds = %.lr.ph, %33
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %33 ]
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv1
  %13 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %12, align 8
  %14 = load i32, i32* %8, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %28, label %16

; <label>:16:                                     ; preds = %11
  %17 = load i32, i32* %9, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %25

; <label>:19:                                     ; preds = %16
  %20 = load i32, i32* %10, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %33

; <label>:22:                                     ; preds = %19
  %23 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %13, i64 0, i32 5
  %24 = load i32, i32* %23, align 4
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 %24, i32 0)
  br label %33

; <label>:25:                                     ; preds = %16
  %26 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %13, i64 0, i32 6
  %27 = load i32, i32* %26, align 8
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 %27, i32 1)
  br label %33

; <label>:28:                                     ; preds = %11
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %13, i64 0, i32 5
  %30 = load i32, i32* %29, align 4
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 %30, i32 0)
  %31 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %13, i64 0, i32 6
  %32 = load i32, i32* %31, align 8
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 %32, i32 1)
  br label %33

; <label>:33:                                     ; preds = %28, %19, %22, %25
  %indvars.iv.next = add nuw i64 %indvars.iv1, 1
  %34 = load i32, i32* %5, align 4
  %35 = sext i32 %34 to i64
  %36 = icmp slt i64 %indvars.iv.next, %35
  br i1 %36, label %11, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %33
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %1
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %38 = load i32, i32* %37, align 8
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %41, label %40

; <label>:40:                                     ; preds = %.loopexit
  tail call void @emit_dri(%struct.jpeg_compress_struct* nonnull %0)
  br label %41

; <label>:41:                                     ; preds = %.loopexit, %40
  tail call void @emit_sos(%struct.jpeg_compress_struct* nonnull %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_file_trailer(%struct.jpeg_compress_struct*) #0 {
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 217)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_tables_only(%struct.jpeg_compress_struct*) #0 {
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 216)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 0
  %3 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %2, align 8
  %4 = icmp eq %struct.JQUANT_TBL* %3, null
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %1
  %6 = tail call i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 0)
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
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 0, i32 0)
  br label %15

; <label>:15:                                     ; preds = %.preheader, %14
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 0
  %17 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %16, align 8
  %18 = icmp eq %struct.JHUFF_TBL* %17, null
  br i1 %18, label %.preheader.16, label %19

; <label>:19:                                     ; preds = %15
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 0, i32 1)
  br label %.preheader.16

.preheader.16:                                    ; preds = %15, %19
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 1
  %21 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %20, align 8
  %22 = icmp eq %struct.JHUFF_TBL* %21, null
  br i1 %22, label %24, label %23

.loopexit:                                        ; preds = %42, %46, %61
  tail call void @emit_marker(%struct.jpeg_compress_struct* nonnull %0, i32 217)
  ret void

; <label>:23:                                     ; preds = %.preheader.16
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 1, i32 0)
  br label %24

; <label>:24:                                     ; preds = %23, %.preheader.16
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 1
  %26 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %25, align 8
  %27 = icmp eq %struct.JHUFF_TBL* %26, null
  br i1 %27, label %.preheader.27, label %28

; <label>:28:                                     ; preds = %24
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 1, i32 1)
  br label %.preheader.27

.preheader.27:                                    ; preds = %28, %24
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 2
  %30 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %29, align 8
  %31 = icmp eq %struct.JHUFF_TBL* %30, null
  br i1 %31, label %33, label %32

; <label>:32:                                     ; preds = %.preheader.27
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 2, i32 0)
  br label %33

; <label>:33:                                     ; preds = %32, %.preheader.27
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 2
  %35 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %34, align 8
  %36 = icmp eq %struct.JHUFF_TBL* %35, null
  br i1 %36, label %.preheader.38, label %37

; <label>:37:                                     ; preds = %33
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 2, i32 1)
  br label %.preheader.38

.preheader.38:                                    ; preds = %37, %33
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 16, i64 3
  %39 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %38, align 8
  %40 = icmp eq %struct.JHUFF_TBL* %39, null
  br i1 %40, label %42, label %41

; <label>:41:                                     ; preds = %.preheader.38
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 3, i32 0)
  br label %42

; <label>:42:                                     ; preds = %41, %.preheader.38
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 17, i64 3
  %44 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %43, align 8
  %45 = icmp eq %struct.JHUFF_TBL* %44, null
  br i1 %45, label %.loopexit, label %46

; <label>:46:                                     ; preds = %42
  tail call void @emit_dht(%struct.jpeg_compress_struct* nonnull %0, i32 3, i32 1)
  br label %.loopexit

; <label>:47:                                     ; preds = %7
  %48 = tail call i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 1)
  br label %49

; <label>:49:                                     ; preds = %47, %7
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 2
  %51 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %50, align 8
  %52 = icmp eq %struct.JQUANT_TBL* %51, null
  br i1 %52, label %55, label %53

; <label>:53:                                     ; preds = %49
  %54 = tail call i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 2)
  br label %55

; <label>:55:                                     ; preds = %53, %49
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 15, i64 3
  %57 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %56, align 8
  %58 = icmp eq %struct.JQUANT_TBL* %57, null
  br i1 %58, label %61, label %59

; <label>:59:                                     ; preds = %55
  %60 = tail call i32 @emit_dqt(%struct.jpeg_compress_struct* nonnull %0, i32 3)
  br label %61

; <label>:61:                                     ; preds = %59, %55
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  %63 = load i32, i32* %62, align 4
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %.preheader, label %.loopexit
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_marker(%struct.jpeg_compress_struct*, i32) #0 {
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 255)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_2bytes(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = lshr i32 %1, 8
  %4 = and i32 %3, 255
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %4)
  %5 = and i32 %1, 255
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %5)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_byte(%struct.jpeg_compress_struct*, i32) #0 {
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
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i64 0, i32 0
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %24(%struct.jpeg_common_struct* %25) #1
  br label %26

; <label>:26:                                     ; preds = %13, %18, %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_jfif_app0(%struct.jpeg_compress_struct*) #0 {
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 224)
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 16)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 74)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 70)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 73)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 70)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 0)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 1)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 1)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 32
  %3 = load i8, i8* %2, align 4
  %4 = zext i8 %3 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %4)
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 33
  %6 = load i16, i16* %5, align 2
  %7 = zext i16 %6 to i32
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %7)
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 34
  %9 = load i16, i16* %8, align 8
  %10 = zext i16 %9 to i32
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %10)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 0)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_adobe_app14(%struct.jpeg_compress_struct*) #0 {
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 238)
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 14)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 65)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 100)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 111)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 98)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 101)
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 100)
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 0)
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 0)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 13
  %3 = load i32, i32* %2, align 8
  switch i32 %3, label %6 [
    i32 3, label %4
    i32 5, label %5
  ]

; <label>:4:                                      ; preds = %1
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 1)
  br label %7

; <label>:5:                                      ; preds = %1
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 2)
  br label %7

; <label>:6:                                      ; preds = %1
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 0)
  br label %7

; <label>:7:                                      ; preds = %6, %5, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @emit_dqt(%struct.jpeg_compress_struct*, i32) #0 {
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
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 0
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #1
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %7, %2
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %.019 = phi i32 [ 0, %.preheader.preheader ], [ %..01.3.1, %.preheader ]
  %indvars.iv48 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next5.3.1, %.preheader ]
  %17 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv48
  %18 = load i16, i16* %17, align 2
  %indvars.iv.next5 = or i64 %indvars.iv48, 1
  %19 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next5
  %20 = load i16, i16* %19, align 2
  %21 = or i16 %20, %18
  %indvars.iv.next5.1 = or i64 %indvars.iv48, 2
  %22 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next5.1
  %23 = load i16, i16* %22, align 2
  %24 = or i16 %23, %21
  %indvars.iv.next5.2 = or i64 %indvars.iv48, 3
  %25 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next5.2
  %26 = load i16, i16* %25, align 2
  %27 = or i16 %26, %24
  %indvars.iv.next5.3 = or i64 %indvars.iv48, 4
  %28 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next5.3
  %29 = load i16, i16* %28, align 2
  %indvars.iv.next5.114 = or i64 %indvars.iv48, 5
  %30 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next5.114
  %31 = load i16, i16* %30, align 2
  %32 = or i16 %31, %29
  %indvars.iv.next5.1.1 = or i64 %indvars.iv48, 6
  %33 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next5.1.1
  %34 = load i16, i16* %33, align 2
  %35 = or i16 %34, %32
  %indvars.iv.next5.2.1 = or i64 %indvars.iv48, 7
  %36 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %indvars.iv.next5.2.1
  %37 = load i16, i16* %36, align 2
  %38 = or i16 %37, %35
  %39 = or i16 %38, %27
  %40 = icmp ugt i16 %39, 255
  %..01.3.1 = select i1 %40, i32 1, i32 %.019
  %indvars.iv.next5.3.1 = add nsw i64 %indvars.iv48, 8
  %exitcond6.3.1 = icmp eq i64 %indvars.iv.next5.3.1, 64
  br i1 %exitcond6.3.1, label %41, label %.preheader

; <label>:41:                                     ; preds = %.preheader
  %42 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 1
  %43 = load i32, i32* %42, align 4
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %65

; <label>:45:                                     ; preds = %41
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 219)
  %46 = icmp ne i32 %..01.3.1, 0
  %47 = select i1 %46, i32 131, i32 67
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %47)
  %48 = shl i32 %..01.3.1, 4
  %49 = add nsw i32 %48, %1
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %49)
  br i1 %46, label %.split.us.preheader, label %.split.preheader

.split.preheader:                                 ; preds = %45
  br label %.split

.split.us.preheader:                              ; preds = %45
  br label %.split.us

.split.us:                                        ; preds = %.split.us.preheader, %.split.us
  %indvars.iv7.us = phi i64 [ %indvars.iv.next.us, %.split.us ], [ 0, %.split.us.preheader ]
  %50 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv7.us
  %51 = load i32, i32* %50, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %52
  %54 = load i16, i16* %53, align 2
  %55 = zext i16 %54 to i32
  %56 = lshr i32 %55, 8
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %56)
  %57 = and i32 %55, 255
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %57)
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv7.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 64
  br i1 %exitcond.us, label %.us-lcssa.us.loopexit, label %.split.us

.split:                                           ; preds = %.split.preheader, %.split
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %.split ], [ 0, %.split.preheader ]
  %58 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %indvars.iv7
  %59 = load i32, i32* %58, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %5, i64 0, i32 0, i64 %60
  %62 = load i16, i16* %61, align 2
  %63 = and i16 %62, 255
  %64 = zext i16 %63 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %64)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond, label %.us-lcssa.us.loopexit13, label %.split

.us-lcssa.us.loopexit:                            ; preds = %.split.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit13:                          ; preds = %.split
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit13, %.us-lcssa.us.loopexit
  store i32 1, i32* %42, align 4
  br label %65

; <label>:65:                                     ; preds = %41, %.us-lcssa.us
  ret i32 %..01.3.1
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_sof(%struct.jpeg_compress_struct*, i32) #0 {
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 %1)
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %4 = load i32, i32* %3, align 4
  %5 = mul nsw i32 %4, 3
  %6 = add nsw i32 %5, 8
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %6)
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
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 0
  %22 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %21, align 8
  %23 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %22(%struct.jpeg_common_struct* %23) #1
  br label %24

; <label>:24:                                     ; preds = %14, %10
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  %26 = load i32, i32* %25, align 8
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %26)
  %27 = load i32, i32* %7, align 4
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* nonnull %0, i32 %27)
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %29 = load i32, i32* %28, align 8
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* nonnull %0, i32 %29)
  %30 = load i32, i32* %3, align 4
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %30)
  %31 = load i32, i32* %3, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %24
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %34 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %33, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi %struct.jpeg_component_info* [ %46, %.lr.ph ], [ %34, %.lr.ph.preheader ]
  %.012 = phi i32 [ %45, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %35 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 0
  %36 = load i32, i32* %35, align 8
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %36)
  %37 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 2
  %38 = load i32, i32* %37, align 8
  %39 = shl i32 %38, 4
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 3
  %41 = load i32, i32* %40, align 4
  %42 = add nsw i32 %39, %41
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %42)
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 4
  %44 = load i32, i32* %43, align 8
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %44)
  %45 = add nuw nsw i32 %.012, 1
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %47 = load i32, i32* %3, align 4
  %48 = icmp slt i32 %45, %47
  br i1 %48, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %24
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_dht(%struct.jpeg_compress_struct*, i32, i32) #0 {
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
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 0
  %18 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %17, align 8
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %18(%struct.jpeg_common_struct* %19) #1
  br label %20

; <label>:20:                                     ; preds = %10, %3
  %21 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 2
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %142

; <label>:24:                                     ; preds = %20
  tail call void @emit_marker(%struct.jpeg_compress_struct* nonnull %0, i32 196)
  %25 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 1
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 2
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = add nuw nsw i32 %30, %27
  %32 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 3
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = add nuw nsw i32 %34, %31
  %36 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 4
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = add nuw nsw i32 %38, %35
  %40 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 5
  %41 = load i8, i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = add nuw nsw i32 %42, %39
  %44 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 6
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = add nuw nsw i32 %46, %43
  %48 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 7
  %49 = load i8, i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = add nuw nsw i32 %50, %47
  %52 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 8
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = add nsw i32 %54, %51
  %56 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 9
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = add nsw i32 %58, %55
  %60 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 10
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = add nsw i32 %62, %59
  %64 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 11
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = add nsw i32 %66, %63
  %68 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 12
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = add nsw i32 %70, %67
  %72 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 13
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = add nsw i32 %74, %71
  %76 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 14
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = add nsw i32 %78, %75
  %80 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 15
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = add nsw i32 %82, %79
  %84 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 16
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = add nsw i32 %86, %83
  %88 = add nsw i32 %87, 19
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %88)
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %.01)
  %89 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 1
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %91)
  %92 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 2
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %94)
  %95 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 3
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %97)
  %98 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 4
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %100)
  %101 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 5
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %103)
  %104 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 6
  %105 = load i8, i8* %104, align 1
  %106 = zext i8 %105 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %106)
  %107 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 7
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %109)
  %110 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 8
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %112)
  %113 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 9
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %115)
  %116 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 10
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %118)
  %119 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 11
  %120 = load i8, i8* %119, align 1
  %121 = zext i8 %120 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %121)
  %122 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 12
  %123 = load i8, i8* %122, align 1
  %124 = zext i8 %123 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %124)
  %125 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 13
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %127)
  %128 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 14
  %129 = load i8, i8* %128, align 1
  %130 = zext i8 %129 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %130)
  %131 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 15
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %133)
  %134 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 0, i64 16
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %136)
  %137 = sext i32 %87 to i64
  %138 = icmp sgt i32 %87, 0
  br i1 %138, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %24
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv9 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %139 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %.03, i64 0, i32 1, i64 %indvars.iv9
  %140 = load i8, i8* %139, align 1
  %141 = zext i8 %140 to i32
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %141)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %137
  br i1 %exitcond13, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %24
  store i32 1, i32* %21, align 4
  br label %142

; <label>:142:                                    ; preds = %20, %._crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_dri(%struct.jpeg_compress_struct*) #0 {
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 221)
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 4)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  %3 = load i32, i32* %2, align 8
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @emit_sos(%struct.jpeg_compress_struct*) #0 {
  tail call void @emit_marker(%struct.jpeg_compress_struct* %0, i32 218)
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %3 = load i32, i32* %2, align 4
  %4 = shl i32 %3, 1
  %5 = add nsw i32 %4, 6
  tail call void @emit_2bytes(%struct.jpeg_compress_struct* %0, i32 %5)
  %6 = load i32, i32* %2, align 4
  tail call void @emit_byte(%struct.jpeg_compress_struct* %0, i32 %6)
  %7 = load i32, i32* %2, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  br label %13

; <label>:13:                                     ; preds = %.lr.ph, %33
  %indvars.iv4 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %33 ]
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv4
  %15 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %15, i64 0, i32 0
  %17 = load i32, i32* %16, align 8
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %17)
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %15, i64 0, i32 5
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %15, i64 0, i32 6
  %21 = load i32, i32* %20, align 8
  %22 = load i32, i32* %9, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %33, label %24

; <label>:24:                                     ; preds = %13
  %25 = load i32, i32* %10, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %33

; <label>:27:                                     ; preds = %24
  %28 = load i32, i32* %11, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %33, label %30

; <label>:30:                                     ; preds = %27
  %31 = load i32, i32* %12, align 4
  %32 = icmp ne i32 %31, 0
  %. = select i1 %32, i32 %19, i32 0
  br label %33

; <label>:33:                                     ; preds = %27, %13, %30, %24
  %.2 = phi i32 [ %19, %13 ], [ %19, %27 ], [ %., %30 ], [ 0, %24 ]
  %.1 = phi i32 [ %21, %13 ], [ 0, %27 ], [ 0, %30 ], [ %21, %24 ]
  %34 = shl i32 %.2, 4
  %35 = add nsw i32 %34, %.1
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %35)
  %indvars.iv.next = add nuw i64 %indvars.iv4, 1
  %36 = load i32, i32* %2, align 4
  %37 = sext i32 %36 to i64
  %38 = icmp slt i64 %indvars.iv.next, %37
  br i1 %38, label %13, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %33
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %40 = load i32, i32* %39, align 4
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %40)
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  %42 = load i32, i32* %41, align 8
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %42)
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  %44 = load i32, i32* %43, align 4
  %45 = shl i32 %44, 4
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  %47 = load i32, i32* %46, align 8
  %48 = add nsw i32 %45, %47
  tail call void @emit_byte(%struct.jpeg_compress_struct* nonnull %0, i32 %48)
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
