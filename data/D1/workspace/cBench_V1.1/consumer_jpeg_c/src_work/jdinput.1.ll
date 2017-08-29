; ModuleID = 'jdinput.ll'
source_filename = "jdinput.c"
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
%struct.my_input_controller = type { %struct.jpeg_input_controller, i32 }

; Function Attrs: noinline nounwind uwtable
define void @jinit_input_controller(%struct.jpeg_decompress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 0, i64 48) #4
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %9 = bitcast %struct.jpeg_input_controller** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to i32 (%struct.jpeg_decompress_struct*)**
  store i32 (%struct.jpeg_decompress_struct*)* @consume_markers, i32 (%struct.jpeg_decompress_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 8
  %12 = bitcast i8* %11 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @reset_input_controller, void (%struct.jpeg_decompress_struct*)** %12, align 8
  %13 = getelementptr inbounds i8, i8* %7, i64 16
  %14 = bitcast i8* %13 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @start_input_pass, void (%struct.jpeg_decompress_struct*)** %14, align 8
  %15 = getelementptr inbounds i8, i8* %7, i64 24
  %16 = bitcast i8* %15 to void (%struct.jpeg_decompress_struct*)**
  store void (%struct.jpeg_decompress_struct*)* @finish_input_pass, void (%struct.jpeg_decompress_struct*)** %16, align 8
  %17 = getelementptr inbounds i8, i8* %7, i64 32
  %18 = bitcast i8* %17 to i32*
  store i32 0, i32* %18, align 8
  %19 = getelementptr inbounds i8, i8* %7, i64 36
  %20 = bitcast i8* %19 to i32*
  store i32 0, i32* %20, align 4
  %21 = getelementptr inbounds i8, i8* %7, i64 40
  %22 = bitcast i8* %21 to i32*
  store i32 1, i32* %22, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @consume_markers(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %3 = bitcast %struct.jpeg_input_controller** %2 to %struct.my_input_controller**
  %4 = load %struct.my_input_controller*, %struct.my_input_controller** %3, align 8
  %5 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %4, i64 0, i32 0, i32 5
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge12

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %10 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %10, i64 0, i32 1
  %12 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %11, align 8
  %13 = tail call i32 %12(%struct.jpeg_decompress_struct* nonnull %0) #4
  switch i32 %13, label %._crit_edge12 [
    i32 1, label %14
    i32 2, label %32
  ]

; <label>:14:                                     ; preds = %8
  %15 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %4, i64 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %19, label %18

; <label>:18:                                     ; preds = %14
  tail call fastcc void @initial_setup(%struct.jpeg_decompress_struct* nonnull %0)
  %sunkaddr = ptrtoint %struct.my_input_controller* %4 to i64
  %sunkaddr1 = add i64 %sunkaddr, 40
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 0, i32* %sunkaddr2, align 8
  br label %._crit_edge12

; <label>:19:                                     ; preds = %14
  %20 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %4, i64 0, i32 0, i32 4
  %21 = load i32, i32* %20, align 8
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %31

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 34, i32* %26, align 8
  %27 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %28 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %27, align 8
  %29 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %28, align 8
  %30 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %29(%struct.jpeg_common_struct* %30) #4
  br label %31

; <label>:31:                                     ; preds = %19, %23
  tail call void @start_input_pass(%struct.jpeg_decompress_struct* nonnull %0)
  br label %._crit_edge12

; <label>:32:                                     ; preds = %8
  %sunkaddr3 = ptrtoint %struct.my_input_controller* %4 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 36
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  store i32 1, i32* %sunkaddr5, align 4
  %33 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %4, i64 0, i32 1
  %34 = load i32, i32* %33, align 8
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %49, label %36

; <label>:36:                                     ; preds = %32
  %sunkaddr6 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 568
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct.jpeg_marker_reader**
  %37 = load %struct.jpeg_marker_reader*, %struct.jpeg_marker_reader** %sunkaddr8, align 8
  %38 = getelementptr inbounds %struct.jpeg_marker_reader, %struct.jpeg_marker_reader* %37, i64 0, i32 6
  %39 = load i32, i32* %38, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge12, label %41

; <label>:41:                                     ; preds = %36
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 5
  store i32 58, i32* %44, align 8
  %45 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %46 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %45, align 8
  %47 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %46, align 8
  %48 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %47(%struct.jpeg_common_struct* %48) #4
  br label %._crit_edge12

; <label>:49:                                     ; preds = %32
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 36
  %51 = load i32, i32* %50, align 4
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 34
  %53 = load i32, i32* %52, align 4
  %54 = icmp sgt i32 %51, %53
  br i1 %54, label %55, label %._crit_edge12

; <label>:55:                                     ; preds = %49
  %sunkaddr9 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 172
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  store i32 %53, i32* %sunkaddr11, align 4
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %8, %49, %36, %1, %31, %18, %55, %41
  %.0 = phi i32 [ 2, %41 ], [ 2, %55 ], [ 1, %18 ], [ %13, %31 ], [ 2, %1 ], [ 2, %36 ], [ 2, %49 ], [ %13, %8 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @reset_input_controller(%struct.jpeg_decompress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %3 = bitcast %struct.jpeg_input_controller** %2 to %struct.my_input_controller**
  %4 = load %struct.my_input_controller*, %struct.my_input_controller** %3, align 8
  %5 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %4, i64 0, i32 0, i32 0
  store i32 (%struct.jpeg_decompress_struct*)* @consume_markers, i32 (%struct.jpeg_decompress_struct*)** %5, align 8
  %6 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %4, i64 0, i32 0, i32 4
  store i32 0, i32* %6, align 8
  %7 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %4, i64 0, i32 0, i32 5
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds %struct.my_input_controller, %struct.my_input_controller* %4, i64 0, i32 1
  store i32 1, i32* %8, align 8
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 4
  %12 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %11, align 8
  %13 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %12(%struct.jpeg_common_struct* %13) #4
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 78
  %15 = bitcast %struct.jpeg_marker_reader** %14 to void (%struct.jpeg_decompress_struct*)***
  %16 = load void (%struct.jpeg_decompress_struct*)**, void (%struct.jpeg_decompress_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %16, align 8
  tail call void %17(%struct.jpeg_decompress_struct* %0) #4
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 38
  store [64 x i32]* null, [64 x i32]** %18, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_pass(%struct.jpeg_decompress_struct*) #0 {
  tail call fastcc void @per_scan_setup(%struct.jpeg_decompress_struct* %0)
  tail call fastcc void @latch_quant_tables(%struct.jpeg_decompress_struct* %0)
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 79
  %3 = bitcast %struct.jpeg_entropy_decoder** %2 to void (%struct.jpeg_decompress_struct*)***
  %4 = load void (%struct.jpeg_decompress_struct*)**, void (%struct.jpeg_decompress_struct*)*** %3, align 8
  %5 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %4, align 8
  tail call void %5(%struct.jpeg_decompress_struct* %0) #4
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 75
  %7 = bitcast %struct.jpeg_d_coef_controller** %6 to void (%struct.jpeg_decompress_struct*)***
  %8 = load void (%struct.jpeg_decompress_struct*)**, void (%struct.jpeg_decompress_struct*)*** %7, align 8
  %9 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %8, align 8
  tail call void %9(%struct.jpeg_decompress_struct* %0) #4
  %10 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %6, align 8
  %11 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %10, i64 0, i32 1
  %12 = bitcast i32 (%struct.jpeg_decompress_struct*)** %11 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %15 = bitcast %struct.jpeg_input_controller** %14 to i64**
  %16 = load i64*, i64** %15, align 8
  store i64 %13, i64* %16, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @finish_input_pass(%struct.jpeg_decompress_struct* nocapture readonly) #1 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %3 = bitcast %struct.jpeg_input_controller** %2 to i32 (%struct.jpeg_decompress_struct*)***
  %4 = load i32 (%struct.jpeg_decompress_struct*)**, i32 (%struct.jpeg_decompress_struct*)*** %3, align 8
  store i32 (%struct.jpeg_decompress_struct*)* @consume_markers, i32 (%struct.jpeg_decompress_struct*)** %4, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @initial_setup(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  %3 = load i32, i32* %2, align 4
  %4 = icmp ugt i32 %3, 65500
  br i1 %4, label %9, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  %7 = load i32, i32* %6, align 8
  %8 = icmp ugt i32 %7, 65500
  br i1 %8, label %9, label %19

; <label>:9:                                      ; preds = %5, %1
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 5
  store i32 40, i32* %12, align 8
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 6, i32 0, i64 0
  store i32 65500, i32* %14, align 4
  %15 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %18 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %18) #4
  br label %19

; <label>:19:                                     ; preds = %5, %9
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 42
  %21 = load i32, i32* %20, align 8
  %22 = icmp eq i32 %21, 8
  br i1 %22, label %34, label %23

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 13, i32* %26, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr, 288
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  %27 = load i32, i32* %sunkaddr19, align 8
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i64 0, i32 6, i32 0, i64 0
  store i32 %27, i32* %29, align 4
  %30 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %31 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %30, align 8
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %32(%struct.jpeg_common_struct* %33) #4
  br label %34

; <label>:34:                                     ; preds = %19, %23
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 8
  %36 = load i32, i32* %35, align 8
  %37 = icmp sgt i32 %36, 10
  br i1 %37, label %38, label %51

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 5
  store i32 24, i32* %41, align 8
  %sunkaddr20 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 48
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  %42 = load i32, i32* %sunkaddr22, align 8
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 6, i32 0, i64 0
  store i32 %42, i32* %44, align 4
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 6, i32 0, i64 1
  store i32 10, i32* %46, align 4
  %47 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %48 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %47, align 8
  %49 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %48, align 8
  %50 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %49(%struct.jpeg_common_struct* %50) #4
  br label %51

; <label>:51:                                     ; preds = %34, %38
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 57
  store i32 1, i32* %52, align 4
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  store i32 1, i32* %53, align 8
  %sunkaddr23 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 48
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %54 = load i32, i32* %sunkaddr25, align 8
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %51
  %sunkaddr26 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 296
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to %struct.jpeg_component_info**
  %56 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr28, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %58 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %59 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr84 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr85 = add i64 %sunkaddr84, 388
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to i32*
  %sunkaddr87 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr88 = add i64 %sunkaddr87, 392
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to i32*
  %sunkaddr90 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr91 = add i64 %sunkaddr90, 48
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to i32*
  br label %60

; <label>:60:                                     ; preds = %73, %.lr.ph16
  %.014 = phi %struct.jpeg_component_info* [ %56, %.lr.ph16 ], [ %84, %73 ]
  %.0113 = phi i32 [ 0, %.lr.ph16 ], [ %83, %73 ]
  %61 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.014, i64 0, i32 2
  %62 = load i32, i32* %61, align 8
  %.off = add i32 %62, -1
  %63 = icmp ugt i32 %.off, 3
  br i1 %63, label %68, label %64

; <label>:64:                                     ; preds = %60
  %65 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.014, i64 0, i32 3
  %66 = load i32, i32* %65, align 4
  %.off8 = add i32 %66, -1
  %67 = icmp ugt i32 %.off8, 3
  br i1 %67, label %68, label %73

; <label>:68:                                     ; preds = %64, %60
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 5
  store i32 16, i32* %70, align 8
  %71 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %59, align 8
  %72 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %71, align 8
  tail call void %72(%struct.jpeg_common_struct* %58) #4
  br label %73

; <label>:73:                                     ; preds = %64, %68
  %74 = load i32, i32* %sunkaddr86, align 4
  %sunkaddr32 = ptrtoint %struct.jpeg_component_info* %.014 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 8
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  %75 = load i32, i32* %sunkaddr34, align 8
  %76 = icmp sgt i32 %74, %75
  %77 = select i1 %76, i32 %74, i32 %75
  store i32 %77, i32* %sunkaddr86, align 4
  %78 = load i32, i32* %sunkaddr89, align 8
  %79 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.014, i64 0, i32 3
  %80 = load i32, i32* %79, align 4
  %81 = icmp sgt i32 %78, %80
  %82 = select i1 %81, i32 %78, i32 %80
  store i32 %82, i32* %sunkaddr89, align 8
  %83 = add nuw nsw i32 %.0113, 1
  %84 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.014, i64 1
  %85 = load i32, i32* %sunkaddr92, align 8
  %86 = icmp slt i32 %83, %85
  br i1 %86, label %60, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %73
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %51
  %87 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 59
  store i32 8, i32* %87, align 4
  %sunkaddr41 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 48
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to i32*
  %88 = load i32, i32* %sunkaddr43, align 8
  %89 = icmp sgt i32 %88, 0
  br i1 %89, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge17
  %sunkaddr44 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr45 = add i64 %sunkaddr44, 296
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to %struct.jpeg_component_info**
  %90 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr46, align 8
  %sunkaddr93 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr94 = add i64 %sunkaddr93, 40
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to i32*
  %sunkaddr96 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr97 = add i64 %sunkaddr96, 388
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to i32*
  %sunkaddr99 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr100 = add i64 %sunkaddr99, 44
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to i32*
  %sunkaddr102 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr103 = add i64 %sunkaddr102, 392
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to i32*
  %sunkaddr105 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr106 = add i64 %sunkaddr105, 48
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to i32*
  br label %91

; <label>:91:                                     ; preds = %91, %.lr.ph
  %.112 = phi %struct.jpeg_component_info* [ %90, %.lr.ph ], [ %140, %91 ]
  %.1211 = phi i32 [ 0, %.lr.ph ], [ %139, %91 ]
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 9
  store i32 8, i32* %92, align 4
  %93 = load i32, i32* %sunkaddr95, align 8
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 2
  %96 = load i32, i32* %95, align 8
  %97 = sext i32 %96 to i64
  %98 = mul nsw i64 %97, %94
  %99 = load i32, i32* %sunkaddr98, align 4
  %100 = sext i32 %99 to i64
  %101 = shl nsw i64 %100, 3
  %102 = tail call i64 @jdiv_round_up(i64 %98, i64 %101) #4
  %103 = trunc i64 %102 to i32
  %104 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 7
  store i32 %103, i32* %104, align 4
  %105 = load i32, i32* %sunkaddr101, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 3
  %108 = load i32, i32* %107, align 4
  %109 = sext i32 %108 to i64
  %110 = mul nsw i64 %109, %106
  %111 = load i32, i32* %sunkaddr104, align 8
  %112 = sext i32 %111 to i64
  %113 = shl nsw i64 %112, 3
  %114 = tail call i64 @jdiv_round_up(i64 %110, i64 %113) #4
  %115 = trunc i64 %114 to i32
  %116 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 8
  store i32 %115, i32* %116, align 8
  %117 = load i32, i32* %sunkaddr95, align 8
  %118 = zext i32 %117 to i64
  %119 = load i32, i32* %95, align 8
  %120 = sext i32 %119 to i64
  %121 = mul nsw i64 %120, %118
  %122 = load i32, i32* %sunkaddr98, align 4
  %123 = sext i32 %122 to i64
  %124 = tail call i64 @jdiv_round_up(i64 %121, i64 %123) #4
  %125 = trunc i64 %124 to i32
  %126 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 10
  store i32 %125, i32* %126, align 8
  %127 = load i32, i32* %sunkaddr101, align 4
  %128 = zext i32 %127 to i64
  %129 = load i32, i32* %107, align 4
  %130 = sext i32 %129 to i64
  %131 = mul nsw i64 %130, %128
  %132 = load i32, i32* %sunkaddr104, align 8
  %133 = sext i32 %132 to i64
  %134 = tail call i64 @jdiv_round_up(i64 %131, i64 %133) #4
  %135 = trunc i64 %134 to i32
  %136 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 11
  store i32 %135, i32* %136, align 4
  %137 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 12
  store i32 1, i32* %137, align 8
  %138 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 0, i32 19
  store %struct.JQUANT_TBL* null, %struct.JQUANT_TBL** %138, align 8
  %139 = add nuw nsw i32 %.1211, 1
  %140 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.112, i64 1
  %141 = load i32, i32* %sunkaddr107, align 8
  %142 = icmp slt i32 %139, %141
  br i1 %142, label %91, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %91
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge17
  %sunkaddr62 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr63 = add i64 %sunkaddr62, 44
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i32*
  %143 = load i32, i32* %sunkaddr64, align 4
  %144 = zext i32 %143 to i64
  %sunkaddr65 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr66 = add i64 %sunkaddr65, 392
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to i32*
  %145 = load i32, i32* %sunkaddr67, align 8
  %146 = sext i32 %145 to i64
  %147 = shl nsw i64 %146, 3
  %148 = tail call i64 @jdiv_round_up(i64 %144, i64 %147) #4
  %149 = trunc i64 %148 to i32
  %150 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 60
  store i32 %149, i32* %150, align 8
  %151 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %152 = load i32, i32* %151, align 8
  %sunkaddr68 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr69 = add i64 %sunkaddr68, 48
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to i32*
  %153 = load i32, i32* %sunkaddr70, align 8
  %154 = icmp slt i32 %152, %153
  br i1 %154, label %159, label %155

; <label>:155:                                    ; preds = %._crit_edge
  %156 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 44
  %157 = load i32, i32* %156, align 8
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %160, label %159

; <label>:159:                                    ; preds = %155, %._crit_edge
  br label %160

; <label>:160:                                    ; preds = %155, %159
  %.sink = phi i32 [ 1, %159 ], [ 0, %155 ]
  %161 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 77
  %162 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %161, align 8
  %163 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %162, i64 0, i32 4
  store i32 %.sink, i32* %163, align 8
  ret void
}

declare i64 @jdiv_round_up(i64, i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @per_scan_setup(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %3 = load i32, i32* %2, align 8
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %29

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 0
  %7 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 7
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 64
  store i32 %9, i32* %10, align 8
  %11 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 8
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 65
  store i32 %12, i32* %13, align 4
  %14 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 13
  store i32 1, i32* %14, align 4
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 14
  store i32 1, i32* %15, align 8
  %16 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 15
  store i32 1, i32* %16, align 4
  %17 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 9
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 16
  store i32 %18, i32* %19, align 8
  %20 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 17
  store i32 1, i32* %20, align 4
  %21 = load i32, i32* %11, align 8
  %22 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 3
  %23 = load i32, i32* %22, align 4
  %24 = urem i32 %21, %23
  %25 = icmp eq i32 %24, 0
  %. = select i1 %25, i32 %23, i32 %24
  %26 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 18
  store i32 %., i32* %26, align 8
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 66
  store i32 1, i32* %27, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 67, i64 0
  store i32 0, i32* %28, align 4
  br label %.loopexit

; <label>:29:                                     ; preds = %1
  %.off = add i32 %3, -1
  %30 = icmp ugt i32 %.off, 3
  br i1 %30, label %31, label %44

; <label>:31:                                     ; preds = %29
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 5
  store i32 24, i32* %34, align 8
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr8 = add i64 %sunkaddr, 416
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  %35 = load i32, i32* %sunkaddr9, align 8
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 6, i32 0, i64 0
  store i32 %35, i32* %37, align 4
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i64 0, i32 6, i32 0, i64 1
  store i32 4, i32* %39, align 4
  %40 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %41 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %40, align 8
  %42 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %41, align 8
  %43 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %42(%struct.jpeg_common_struct* %43) #4
  br label %44

; <label>:44:                                     ; preds = %29, %31
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 6
  %46 = load i32, i32* %45, align 8
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 57
  %49 = load i32, i32* %48, align 4
  %50 = sext i32 %49 to i64
  %51 = shl nsw i64 %50, 3
  %52 = tail call i64 @jdiv_round_up(i64 %47, i64 %51) #4
  %53 = trunc i64 %52 to i32
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 64
  store i32 %53, i32* %54, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 7
  %56 = load i32, i32* %55, align 4
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %59 = load i32, i32* %58, align 8
  %60 = sext i32 %59 to i64
  %61 = shl nsw i64 %60, 3
  %62 = tail call i64 @jdiv_round_up(i64 %57, i64 %61) #4
  %63 = trunc i64 %62 to i32
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 65
  store i32 %63, i32* %64, align 4
  %65 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 66
  store i32 0, i32* %65, align 8
  %sunkaddr10 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 416
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i32*
  %66 = load i32, i32* %sunkaddr12, align 8
  %67 = icmp sgt i32 %66, 0
  br i1 %67, label %.lr.ph7.preheader, label %.loopexit

.lr.ph7.preheader:                                ; preds = %44
  %sunkaddr23 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 464
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %68 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %69 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %70 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr26 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 464
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %sunkaddr29 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 416
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i32*
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph7.preheader ]
  %71 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv
  %72 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %71, align 8
  %73 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 2
  %74 = load i32, i32* %73, align 8
  %75 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 13
  store i32 %74, i32* %75, align 4
  %76 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 3
  %77 = load i32, i32* %76, align 4
  %78 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 14
  store i32 %77, i32* %78, align 8
  %79 = mul nsw i32 %77, %74
  %80 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 15
  store i32 %79, i32* %80, align 4
  %81 = load i32, i32* %75, align 4
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 9
  %83 = load i32, i32* %82, align 4
  %84 = mul nsw i32 %83, %81
  %85 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 16
  store i32 %84, i32* %85, align 8
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 7
  %87 = load i32, i32* %86, align 4
  %88 = load i32, i32* %75, align 4
  %89 = urem i32 %87, %88
  %90 = icmp eq i32 %89, 0
  %.3 = select i1 %90, i32 %88, i32 %89
  %91 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 17
  store i32 %.3, i32* %91, align 4
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 8
  %93 = load i32, i32* %92, align 8
  %94 = load i32, i32* %78, align 8
  %95 = urem i32 %93, %94
  %96 = icmp eq i32 %95, 0
  %.2 = select i1 %96, i32 %94, i32 %95
  %97 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %72, i64 0, i32 18
  store i32 %.2, i32* %97, align 8
  %98 = load i32, i32* %80, align 4
  %99 = load i32, i32* %sunkaddr25, align 8
  %100 = add nsw i32 %99, %98
  %101 = icmp sgt i32 %100, 10
  br i1 %101, label %102, label %.preheader

; <label>:102:                                    ; preds = %.lr.ph7
  %103 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %68, align 8
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %103, i64 0, i32 5
  store i32 11, i32* %104, align 8
  %105 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %70, align 8
  %106 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %105, align 8
  tail call void %106(%struct.jpeg_common_struct* nonnull %69) #4
  br label %.preheader

.preheader:                                       ; preds = %.lr.ph7, %102
  %107 = icmp sgt i32 %98, 0
  br i1 %107, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %108 = trunc i64 %indvars.iv to i32
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.014 = phi i32 [ %109, %.lr.ph ], [ %98, %.lr.ph.preheader ]
  %109 = add nsw i32 %.014, -1
  %110 = load i32, i32* %sunkaddr28, align 8
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %sunkaddr28, align 8
  %112 = sext i32 %110 to i64
  %113 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 67, i64 %112
  store i32 %108, i32* %113, align 4
  %114 = icmp sgt i32 %.014, 1
  br i1 %114, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %115 = load i32, i32* %sunkaddr31, align 8
  %116 = sext i32 %115 to i64
  %117 = icmp slt i64 %indvars.iv.next, %116
  br i1 %117, label %.lr.ph7, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %44, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @latch_quant_tables(%struct.jpeg_decompress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 62
  %3 = load i32, i32* %2, align 8
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %1
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %6 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %8 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr16 = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 8
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr, 416
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %38
  %indvars.iv = phi i64 [ %indvars.iv.next, %38 ], [ 0, %.lr.ph.preheader ]
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 63, i64 %indvars.iv
  %10 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %10, i64 0, i32 19
  %12 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %11, align 8
  %13 = icmp eq %struct.JQUANT_TBL* %12, null
  br i1 %13, label %14, label %38

; <label>:14:                                     ; preds = %.lr.ph
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %10, i64 0, i32 4
  %16 = load i32, i32* %15, align 8
  %17 = sext i32 %16 to i64
  %18 = icmp ugt i32 %16, 3
  br i1 %18, label %24, label %19

; <label>:19:                                     ; preds = %14
  %20 = sext i32 %16 to i64
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 %20
  %22 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %21, align 8
  %23 = icmp eq %struct.JQUANT_TBL* %22, null
  br i1 %23, label %24, label %31

; <label>:24:                                     ; preds = %19, %14
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 51, i32* %26, align 8
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i64 0, i32 6, i32 0, i64 0
  store i32 %16, i32* %28, align 4
  %29 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %7, align 8
  %30 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %29, align 8
  tail call void %30(%struct.jpeg_common_struct* nonnull %6) #4
  br label %31

; <label>:31:                                     ; preds = %19, %24
  %32 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %sunkaddr18, align 8
  %33 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %32, align 8
  %34 = tail call i8* %33(%struct.jpeg_common_struct* nonnull %8, i32 1, i64 132) #4
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 39, i64 %17
  %36 = bitcast %struct.JQUANT_TBL** %35 to i8**
  %37 = load i8*, i8** %36, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* %37, i64 132, i32 1, i1 false)
  %sunkaddr4 = ptrtoint %struct.jpeg_component_info* %10 to i64
  %sunkaddr5 = add i64 %sunkaddr4, 80
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i8**
  store i8* %34, i8** %sunkaddr6, align 8
  br label %38

; <label>:38:                                     ; preds = %.lr.ph, %31
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %39 = load i32, i32* %sunkaddr20, align 8
  %40 = sext i32 %39 to i64
  %41 = icmp slt i64 %indvars.iv.next, %40
  br i1 %41, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %38
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
