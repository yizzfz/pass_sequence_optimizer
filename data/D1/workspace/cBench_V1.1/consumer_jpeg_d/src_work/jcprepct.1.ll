; ModuleID = 'jcprepct.ll'
source_filename = "jcprepct.c"
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
%struct.jpeg_destination_mgr = type { i8*, i64, void (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)* }
%struct.jpeg_color_converter = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { {}*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }
%struct.my_prep_controller = type { %struct.jpeg_c_prep_controller, [10 x i8**], i32, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define void @jinit_c_prep_controller(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %12, label %4

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i64 0, i32 5
  store i32 4, i32* %7, align 8
  %8 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %9 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %8, i64 0, i32 0
  %10 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %9, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %10(%struct.jpeg_common_struct* %11) #3
  br label %12

; <label>:12:                                     ; preds = %2, %4
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %14 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %14, i64 0, i32 0
  %16 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %18 = tail call i8* %16(%struct.jpeg_common_struct* %17, i32 1, i64 112) #3
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %20 = bitcast %struct.jpeg_c_prep_controller** %19 to i8**
  store i8* %18, i8** %20, align 8
  %21 = bitcast i8* %18 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_prep, void (%struct.jpeg_compress_struct*, i32)** %21, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 57
  %23 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %23, i64 0, i32 2
  %25 = load i32, i32* %24, align 8
  %26 = icmp eq i32 %25, 0
  %27 = getelementptr inbounds i8, i8* %18, i64 8
  %28 = bitcast i8* %27 to void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)**
  br i1 %26, label %30, label %29

; <label>:29:                                     ; preds = %12
  store void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* @pre_process_context, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %28, align 8
  tail call void @create_context_buffer(%struct.jpeg_compress_struct* nonnull %0)
  br label %.loopexit

; <label>:30:                                     ; preds = %12
  store void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* @pre_process_data, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)** %28, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %32 = load i32, i32* %31, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %30
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %35 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 38
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %38 = getelementptr inbounds i8, i8* %18, i64 16
  %39 = bitcast i8* %38 to [10 x i8**]*
  br label %40

; <label>:40:                                     ; preds = %.lr.ph, %40
  %.03 = phi %struct.jpeg_component_info* [ %35, %.lr.ph ], [ %59, %40 ]
  %indvars.iv2 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %40 ]
  %41 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %13, align 8
  %42 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %41, i64 0, i32 2
  %43 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 7
  %45 = load i32, i32* %44, align 4
  %46 = zext i32 %45 to i64
  %47 = shl nuw nsw i64 %46, 3
  %48 = load i32, i32* %36, align 8
  %49 = sext i32 %48 to i64
  %50 = mul nsw i64 %47, %49
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 0, i32 2
  %52 = load i32, i32* %51, align 8
  %53 = sext i32 %52 to i64
  %54 = sdiv i64 %50, %53
  %55 = trunc i64 %54 to i32
  %56 = load i32, i32* %37, align 4
  %57 = tail call i8** %43(%struct.jpeg_common_struct* nonnull %17, i32 1, i32 %55, i32 %56) #3
  %58 = getelementptr inbounds [10 x i8**], [10 x i8**]* %39, i64 0, i64 %indvars.iv2
  store i8** %57, i8*** %58, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv2, 1
  %59 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.03, i64 1
  %60 = load i32, i32* %31, align 4
  %61 = sext i32 %60 to i64
  %62 = icmp slt i64 %indvars.iv.next, %61
  br i1 %62, label %40, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %40
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %30, %29
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_prep(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %4 = bitcast %struct.jpeg_c_prep_controller** %3 to %struct.my_prep_controller**
  %5 = load %struct.my_prep_controller*, %struct.my_prep_controller** %4, align 8
  %6 = icmp eq i32 %1, 0
  br i1 %6, label %15, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 4, i32* %10, align 8
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 0
  %13 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %12, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %13(%struct.jpeg_common_struct* %14) #3
  br label %15

; <label>:15:                                     ; preds = %2, %7
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %5, i64 0, i32 2
  store i32 %17, i32* %18, align 8
  %19 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %5, i64 0, i32 3
  store i32 0, i32* %19, align 4
  %20 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %5, i64 0, i32 4
  store i32 0, i32* %20, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %22 = load i32, i32* %21, align 4
  %23 = shl nsw i32 %22, 1
  %24 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %5, i64 0, i32 5
  store i32 %23, i32* %24, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @pre_process_context(%struct.jpeg_compress_struct*, i8**, i32* nocapture, i32, i8***, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %9 = bitcast %struct.jpeg_c_prep_controller** %8 to %struct.my_prep_controller**
  %10 = load %struct.my_prep_controller*, %struct.my_prep_controller** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %12 = load i32, i32* %11, align 4
  %13 = mul nsw i32 %12, 3
  %14 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 2
  %15 = load i32, i32* %5, align 4
  %16 = icmp ult i32 %15, %6
  br i1 %16, label %.lr.ph14, label %.loopexit

.lr.ph14:                                         ; preds = %7
  %17 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 5
  %18 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 3
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %20 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 0
  %21 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 2
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %25 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 3
  %26 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 5
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 57
  %28 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 0
  %29 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 4
  %30 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 3
  %31 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 5
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  br label %34

; <label>:34:                                     ; preds = %.lr.ph14, %.backedge
  %35 = load i32, i32* %2, align 4
  %36 = icmp ult i32 %35, %3
  br i1 %36, label %37, label %72

; <label>:37:                                     ; preds = %34
  %38 = sub i32 %3, %35
  %39 = load i32, i32* %17, align 4
  %40 = load i32, i32* %18, align 4
  %41 = sub nsw i32 %39, %40
  %42 = icmp ult i32 %41, %38
  %. = select i1 %42, i32 %41, i32 %38
  %43 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %19, align 8
  %44 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %43, i64 0, i32 1
  %45 = load void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %44, align 8
  %46 = zext i32 %35 to i64
  %47 = getelementptr inbounds i8*, i8** %1, i64 %46
  tail call void %45(%struct.jpeg_compress_struct* %0, i8** %47, i8*** %20, i32 %40, i32 %.) #3
  %48 = load i32, i32* %21, align 8
  %49 = load i32, i32* %22, align 4
  %50 = icmp eq i32 %48, %49
  br i1 %50, label %.preheader5, label %.loopexit6

.preheader5:                                      ; preds = %37
  %51 = load i32, i32* %23, align 4
  %52 = icmp sgt i32 %51, 0
  br i1 %52, label %.preheader.preheader, label %.loopexit6

.preheader.preheader:                             ; preds = %.preheader5
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge11
  %indvars.iv212 = phi i64 [ %indvars.iv.next3, %._crit_edge11 ], [ 0, %.preheader.preheader ]
  %53 = load i32, i32* %11, align 4
  %54 = icmp slt i32 %53, 1
  br i1 %54, label %._crit_edge11, label %.lr.ph10

.lr.ph10:                                         ; preds = %.preheader
  %55 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 %indvars.iv212
  br label %56

; <label>:56:                                     ; preds = %56, %.lr.ph10
  %.09 = phi i32 [ 1, %.lr.ph10 ], [ %60, %56 ]
  %57 = load i8**, i8*** %55, align 8
  %58 = sub nsw i32 0, %.09
  %59 = load i32, i32* %24, align 8
  tail call void @jcopy_sample_rows(i8** %57, i32 0, i8** %57, i32 %58, i32 1, i32 %59) #3
  %60 = add nuw nsw i32 %.09, 1
  %61 = load i32, i32* %11, align 4
  %62 = icmp slt i32 %.09, %61
  br i1 %62, label %56, label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %56
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader
  %indvars.iv.next3 = add nuw i64 %indvars.iv212, 1
  %63 = load i32, i32* %23, align 4
  %64 = sext i32 %63 to i64
  %65 = icmp slt i64 %indvars.iv.next3, %64
  br i1 %65, label %.preheader, label %.loopexit6.loopexit

.loopexit6.loopexit:                              ; preds = %._crit_edge11
  br label %.loopexit6

.loopexit6:                                       ; preds = %.loopexit6.loopexit, %.preheader5, %37
  %66 = load i32, i32* %2, align 4
  %67 = add i32 %66, %.
  store i32 %67, i32* %2, align 4
  %68 = load i32, i32* %18, align 4
  %69 = add nsw i32 %68, %.
  store i32 %69, i32* %18, align 4
  %70 = load i32, i32* %21, align 8
  %71 = sub i32 %70, %.
  store i32 %71, i32* %21, align 8
  br label %90

; <label>:72:                                     ; preds = %34
  %73 = load i32, i32* %14, align 8
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %.loopexit.loopexit

; <label>:75:                                     ; preds = %72
  %76 = load i32, i32* %30, align 4
  %77 = load i32, i32* %31, align 4
  %78 = icmp slt i32 %76, %77
  br i1 %78, label %.preheader7, label %90

.preheader7:                                      ; preds = %75
  %79 = load i32, i32* %32, align 4
  %80 = icmp sgt i32 %79, 0
  br i1 %80, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv8 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %81 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 %indvars.iv8
  %82 = load i8**, i8*** %81, align 8
  %83 = load i32, i32* %33, align 8
  %84 = load i32, i32* %30, align 4
  %85 = load i32, i32* %31, align 4
  tail call void @expand_bottom_edge(i8** %82, i32 %83, i32 %84, i32 %85)
  %indvars.iv.next = add nuw i64 %indvars.iv8, 1
  %86 = load i32, i32* %32, align 4
  %87 = sext i32 %86 to i64
  %88 = icmp slt i64 %indvars.iv.next, %87
  br i1 %88, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader7
  %89 = load i32, i32* %31, align 4
  store i32 %89, i32* %30, align 4
  br label %90

; <label>:90:                                     ; preds = %75, %._crit_edge, %.loopexit6
  %91 = load i32, i32* %25, align 4
  %92 = load i32, i32* %26, align 4
  %93 = icmp eq i32 %91, %92
  br i1 %93, label %94, label %.backedge

; <label>:94:                                     ; preds = %90
  %95 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %27, align 8
  %96 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %95, i64 0, i32 1
  %97 = load void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)** %96, align 8
  %98 = load i32, i32* %29, align 8
  %99 = load i32, i32* %5, align 4
  tail call void %97(%struct.jpeg_compress_struct* %0, i8*** nonnull %28, i32 %98, i8*** %4, i32 %99) #3
  %100 = load i32, i32* %5, align 4
  %101 = add i32 %100, 1
  store i32 %101, i32* %5, align 4
  %102 = load i32, i32* %11, align 4
  %103 = load i32, i32* %29, align 8
  %104 = add nsw i32 %103, %102
  %105 = icmp sge i32 %104, %13
  %.4 = select i1 %105, i32 0, i32 %104
  store i32 %.4, i32* %29, align 8
  %106 = load i32, i32* %25, align 4
  %107 = icmp slt i32 %106, %13
  br i1 %107, label %109, label %108

; <label>:108:                                    ; preds = %94
  store i32 0, i32* %25, align 4
  br label %109

; <label>:109:                                    ; preds = %94, %108
  %110 = load i32, i32* %25, align 4
  %111 = load i32, i32* %11, align 4
  %112 = add nsw i32 %111, %110
  store i32 %112, i32* %26, align 4
  br label %.backedge

.backedge:                                        ; preds = %109, %90
  %113 = load i32, i32* %5, align 4
  %114 = icmp ult i32 %113, %6
  br i1 %114, label %34, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %72, %.backedge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @create_context_buffer(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %3 = bitcast %struct.jpeg_c_prep_controller** %2 to %struct.my_prep_controller**
  %4 = load %struct.my_prep_controller*, %struct.my_prep_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %8 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %8, i64 0, i32 0
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %13 = load i32, i32* %12, align 4
  %14 = mul i32 %6, 5
  %15 = mul i32 %14, %13
  %16 = sext i32 %15 to i64
  %17 = shl nsw i64 %16, 3
  %18 = tail call i8* %10(%struct.jpeg_common_struct* %11, i32 1, i64 %17) #3
  %19 = bitcast i8* %18 to i8**
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %21 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %20, align 8
  %22 = sext i32 %6 to i64
  %23 = load i32, i32* %12, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %1
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 38
  %26 = mul nsw i32 %6, 3
  %27 = sext i32 %26 to i64
  %28 = shl nsw i64 %27, 3
  %29 = icmp sgt i32 %6, 0
  %30 = mul nsw i32 %6, 5
  %31 = sext i32 %30 to i64
  %32 = shl nsw i32 %6, 1
  %33 = sext i32 %32 to i64
  %34 = shl nsw i32 %6, 2
  %35 = sext i32 %34 to i64
  br i1 %29, label %.lr.ph11.split.us.preheader, label %.lr.ph11.split.preheader

.lr.ph11.split.preheader:                         ; preds = %.lr.ph11
  br label %.lr.ph11.split

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  %xtraiter = and i64 %22, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %36 = icmp eq i32 %6, 1
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %._crit_edge.us
  %.09.us = phi i8** [ %89, %._crit_edge.us ], [ %19, %.lr.ph11.split.us.preheader ]
  %.018.us = phi %struct.jpeg_component_info* [ %90, %._crit_edge.us ], [ %21, %.lr.ph11.split.us.preheader ]
  %indvars.iv47.us = phi i64 [ %indvars.iv.next5.us, %._crit_edge.us ], [ 0, %.lr.ph11.split.us.preheader ]
  %37 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %38 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %37, i64 0, i32 2
  %39 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.018.us, i64 0, i32 7
  %41 = load i32, i32* %40, align 4
  %42 = zext i32 %41 to i64
  %43 = shl nuw nsw i64 %42, 3
  %44 = load i32, i32* %25, align 8
  %45 = sext i32 %44 to i64
  %46 = mul nsw i64 %43, %45
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.018.us, i64 0, i32 2
  %48 = load i32, i32* %47, align 8
  %49 = sext i32 %48 to i64
  %50 = sdiv i64 %46, %49
  %51 = trunc i64 %50 to i32
  %52 = tail call i8** %39(%struct.jpeg_common_struct* nonnull %11, i32 1, i32 %51, i32 %26) #3
  %53 = getelementptr inbounds i8*, i8** %.09.us, i64 %22
  %54 = bitcast i8** %53 to i8*
  %55 = bitcast i8** %52 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %54, i8* %55, i64 %28, i32 1, i1 false)
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph11.split.us
  %56 = getelementptr inbounds i8*, i8** %52, i64 %33
  %57 = bitcast i8** %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = bitcast i8** %.09.us to i64*
  store i64 %58, i64* %59, align 8
  %60 = bitcast i8** %52 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds i8*, i8** %.09.us, i64 %35
  %63 = bitcast i8** %62 to i64*
  store i64 %61, i64* %63, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph11.split.us
  %indvars.iv6.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph11.split.us ]
  br i1 %36, label %._crit_edge.us, label %.lr.ph11.split.us.new.preheader

.lr.ph11.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph11.split.us.new

.lr.ph11.split.us.new:                            ; preds = %.lr.ph11.split.us.new.preheader, %.lr.ph11.split.us.new
  %indvars.iv6.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph11.split.us.new ], [ %indvars.iv6.us.unr.ph, %.lr.ph11.split.us.new.preheader ]
  %64 = add nsw i64 %indvars.iv6.us, %33
  %65 = getelementptr inbounds i8*, i8** %52, i64 %64
  %66 = bitcast i8** %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds i8*, i8** %.09.us, i64 %indvars.iv6.us
  %69 = bitcast i8** %68 to i64*
  store i64 %67, i64* %69, align 8
  %70 = getelementptr inbounds i8*, i8** %52, i64 %indvars.iv6.us
  %71 = bitcast i8** %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = add nsw i64 %indvars.iv6.us, %35
  %74 = getelementptr inbounds i8*, i8** %.09.us, i64 %73
  %75 = bitcast i8** %74 to i64*
  store i64 %72, i64* %75, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %76 = add nsw i64 %indvars.iv.next.us, %33
  %77 = getelementptr inbounds i8*, i8** %52, i64 %76
  %78 = bitcast i8** %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds i8*, i8** %.09.us, i64 %indvars.iv.next.us
  %81 = bitcast i8** %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = getelementptr inbounds i8*, i8** %52, i64 %indvars.iv.next.us
  %83 = bitcast i8** %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = add nsw i64 %indvars.iv.next.us, %35
  %86 = getelementptr inbounds i8*, i8** %.09.us, i64 %85
  %87 = bitcast i8** %86 to i64*
  store i64 %84, i64* %87, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv6.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %22
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph11.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph11.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %88 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %4, i64 0, i32 1, i64 %indvars.iv47.us
  store i8** %53, i8*** %88, align 8
  %89 = getelementptr inbounds i8*, i8** %.09.us, i64 %31
  %indvars.iv.next5.us = add nuw i64 %indvars.iv47.us, 1
  %90 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.018.us, i64 1
  %91 = load i32, i32* %12, align 4
  %92 = sext i32 %91 to i64
  %93 = icmp slt i64 %indvars.iv.next5.us, %92
  br i1 %93, label %.lr.ph11.split.us, label %._crit_edge12.loopexit

.lr.ph11.split:                                   ; preds = %.lr.ph11.split.preheader, %.lr.ph11.split
  %.09 = phi i8** [ %114, %.lr.ph11.split ], [ %19, %.lr.ph11.split.preheader ]
  %.018 = phi %struct.jpeg_component_info* [ %115, %.lr.ph11.split ], [ %21, %.lr.ph11.split.preheader ]
  %indvars.iv47 = phi i64 [ %indvars.iv.next5, %.lr.ph11.split ], [ 0, %.lr.ph11.split.preheader ]
  %94 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %95 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %94, i64 0, i32 2
  %96 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %95, align 8
  %97 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.018, i64 0, i32 7
  %98 = load i32, i32* %97, align 4
  %99 = zext i32 %98 to i64
  %100 = shl nuw nsw i64 %99, 3
  %101 = load i32, i32* %25, align 8
  %102 = sext i32 %101 to i64
  %103 = mul nsw i64 %100, %102
  %104 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.018, i64 0, i32 2
  %105 = load i32, i32* %104, align 8
  %106 = sext i32 %105 to i64
  %107 = sdiv i64 %103, %106
  %108 = trunc i64 %107 to i32
  %109 = tail call i8** %96(%struct.jpeg_common_struct* nonnull %11, i32 1, i32 %108, i32 %26) #3
  %110 = getelementptr inbounds i8*, i8** %.09, i64 %22
  %111 = bitcast i8** %110 to i8*
  %112 = bitcast i8** %109 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %111, i8* %112, i64 %28, i32 1, i1 false)
  %113 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %4, i64 0, i32 1, i64 %indvars.iv47
  store i8** %110, i8*** %113, align 8
  %114 = getelementptr inbounds i8*, i8** %.09, i64 %31
  %indvars.iv.next5 = add nuw i64 %indvars.iv47, 1
  %115 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.018, i64 1
  %116 = load i32, i32* %12, align 4
  %117 = sext i32 %116 to i64
  %118 = icmp slt i64 %indvars.iv.next5, %117
  br i1 %118, label %.lr.ph11.split, label %._crit_edge12.loopexit16

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12.loopexit16:                         ; preds = %.lr.ph11.split
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit16, %._crit_edge12.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @pre_process_data(%struct.jpeg_compress_struct*, i8**, i32* nocapture, i32, i8***, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %9 = bitcast %struct.jpeg_c_prep_controller** %8 to %struct.my_prep_controller**
  %10 = load %struct.my_prep_controller*, %struct.my_prep_controller** %9, align 8
  %11 = load i32, i32* %2, align 4
  %12 = icmp ult i32 %11, %3
  br i1 %12, label %.lr.ph10, label %.loopexit

.lr.ph10:                                         ; preds = %7
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %14 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 3
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %16 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 0
  %17 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 2
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 57
  br label %21

; <label>:21:                                     ; preds = %.lr.ph10, %.backedge
  %22 = phi i32 [ %11, %.lr.ph10 ], [ %75, %.backedge ]
  %23 = load i32, i32* %5, align 4
  %24 = icmp ult i32 %23, %6
  br i1 %24, label %25, label %.loopexit.loopexit

; <label>:25:                                     ; preds = %21
  %26 = sub i32 %3, %22
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %14, align 4
  %29 = sub nsw i32 %27, %28
  %30 = icmp ult i32 %29, %26
  %. = select i1 %30, i32 %29, i32 %26
  %31 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %15, align 8
  %32 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %31, i64 0, i32 1
  %33 = load void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %32, align 8
  %34 = zext i32 %22 to i64
  %35 = getelementptr inbounds i8*, i8** %1, i64 %34
  tail call void %33(%struct.jpeg_compress_struct* nonnull %0, i8** %35, i8*** %16, i32 %28, i32 %.) #3
  %36 = load i32, i32* %2, align 4
  %37 = add i32 %36, %.
  store i32 %37, i32* %2, align 4
  %38 = load i32, i32* %14, align 4
  %39 = add nsw i32 %38, %.
  store i32 %39, i32* %14, align 4
  %40 = load i32, i32* %17, align 8
  %41 = sub i32 %40, %.
  store i32 %41, i32* %17, align 8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %58

; <label>:43:                                     ; preds = %25
  %44 = load i32, i32* %14, align 4
  %45 = load i32, i32* %13, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %.preheader, label %58

.preheader:                                       ; preds = %43
  %47 = load i32, i32* %18, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %.preheader
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %.lr.ph7
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.lr.ph7 ], [ 0, %.lr.ph7.preheader ]
  %49 = getelementptr inbounds %struct.my_prep_controller, %struct.my_prep_controller* %10, i64 0, i32 1, i64 %indvars.iv26
  %50 = load i8**, i8*** %49, align 8
  %51 = load i32, i32* %19, align 8
  %52 = load i32, i32* %14, align 4
  %53 = load i32, i32* %13, align 4
  tail call void @expand_bottom_edge(i8** %50, i32 %51, i32 %52, i32 %53)
  %indvars.iv.next3 = add nuw i64 %indvars.iv26, 1
  %54 = load i32, i32* %18, align 4
  %55 = sext i32 %54 to i64
  %56 = icmp slt i64 %indvars.iv.next3, %55
  br i1 %56, label %.lr.ph7, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %.lr.ph7
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader
  %57 = load i32, i32* %13, align 4
  store i32 %57, i32* %14, align 4
  br label %58

; <label>:58:                                     ; preds = %._crit_edge8, %43, %25
  %59 = load i32, i32* %14, align 4
  %60 = load i32, i32* %13, align 4
  %61 = icmp eq i32 %59, %60
  br i1 %61, label %62, label %69

; <label>:62:                                     ; preds = %58
  %63 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %20, align 8
  %64 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %63, i64 0, i32 1
  %65 = load void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)** %64, align 8
  %66 = load i32, i32* %5, align 4
  tail call void %65(%struct.jpeg_compress_struct* nonnull %0, i8*** nonnull %16, i32 0, i8*** %4, i32 %66) #3
  store i32 0, i32* %14, align 4
  %67 = load i32, i32* %5, align 4
  %68 = add i32 %67, 1
  store i32 %68, i32* %5, align 4
  br label %69

; <label>:69:                                     ; preds = %62, %58
  %70 = load i32, i32* %17, align 8
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %.backedge

; <label>:72:                                     ; preds = %69
  %73 = load i32, i32* %5, align 4
  %74 = icmp ult i32 %73, %6
  br i1 %74, label %77, label %.backedge

.backedge:                                        ; preds = %72, %69
  %75 = load i32, i32* %2, align 4
  %76 = icmp ult i32 %75, %3
  br i1 %76, label %21, label %.loopexit.loopexit

; <label>:77:                                     ; preds = %72
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %79 = load i32, i32* %78, align 4
  %80 = icmp sgt i32 %79, 0
  br i1 %80, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %77
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %82 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %81, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.05 = phi %struct.jpeg_component_info* [ %93, %.lr.ph ], [ %82, %.lr.ph.preheader ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %83 = getelementptr inbounds i8**, i8*** %4, i64 %indvars.iv4
  %84 = load i8**, i8*** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.05, i64 0, i32 7
  %86 = load i32, i32* %85, align 4
  %87 = shl i32 %86, 3
  %88 = load i32, i32* %5, align 4
  %89 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.05, i64 0, i32 3
  %90 = load i32, i32* %89, align 4
  %91 = mul i32 %90, %88
  %92 = mul i32 %90, %6
  tail call void @expand_bottom_edge(i8** %84, i32 %87, i32 %91, i32 %92)
  %indvars.iv.next = add nuw i64 %indvars.iv4, 1
  %93 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.05, i64 1
  %94 = load i32, i32* %78, align 4
  %95 = sext i32 %94 to i64
  %96 = icmp slt i64 %indvars.iv.next, %95
  br i1 %96, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %77
  store i32 %6, i32* %5, align 4
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %21, %.backedge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7, %._crit_edge
  ret void
}

declare void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @expand_bottom_edge(i8**, i32, i32, i32) #0 {
  %5 = icmp slt i32 %2, %3
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %6 = add nsw i32 %2, -1
  br label %7

; <label>:7:                                      ; preds = %7, %.lr.ph
  %.01 = phi i32 [ %2, %.lr.ph ], [ %8, %7 ]
  tail call void @jcopy_sample_rows(i8** %0, i32 %6, i8** %0, i32 %.01, i32 1, i32 %1) #3
  %8 = add nsw i32 %.01, 1
  %exitcond = icmp eq i32 %8, %3
  br i1 %exitcond, label %._crit_edge.loopexit, label %7

._crit_edge.loopexit:                             ; preds = %7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
