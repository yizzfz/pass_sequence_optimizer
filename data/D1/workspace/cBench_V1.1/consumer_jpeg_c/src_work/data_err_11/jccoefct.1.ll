; ModuleID = 'jccoefct.ll'
source_filename = "jccoefct.c"
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
%struct.my_coef_controller = type { %struct.jpeg_c_coef_controller, i32, i32, i32, i32, [10 x [64 x i16]*], [10 x %struct.jvirt_barray_control*] }

; Function Attrs: noinline nounwind uwtable
define void @jinit_c_coef_controller(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 192) #3
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %10 = bitcast %struct.jpeg_c_coef_controller** %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef, void (%struct.jpeg_compress_struct*, i32)** %11, align 8
  %12 = icmp eq i32 %1, 0
  br i1 %12, label %46, label %13

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %15 = load i32, i32* %14, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %13
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %18 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr11 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 8
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to %struct.jpeg_memory_mgr**
  %sunkaddr = ptrtoint i8* %8 to i64
  %sunkaddr18 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 68
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  br label %20

; <label>:20:                                     ; preds = %.lr.ph, %20
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %20 ]
  %.0110 = phi %struct.jpeg_component_info* [ %18, %.lr.ph ], [ %42, %20 ]
  %21 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr13, align 8
  %22 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %21, i64 0, i32 5
  %23 = load %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 7
  %25 = load i32, i32* %24, align 4
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 2
  %28 = load i32, i32* %27, align 8
  %29 = sext i32 %28 to i64
  %30 = tail call i64 @jround_up(i64 %26, i64 %29) #3
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 8
  %33 = load i32, i32* %32, align 8
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 0, i32 3
  %36 = load i32, i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = tail call i64 @jround_up(i64 %34, i64 %37) #3
  %39 = trunc i64 %38 to i32
  %40 = load i32, i32* %35, align 4
  %41 = tail call %struct.jvirt_barray_control* %23(%struct.jpeg_common_struct* nonnull %19, i32 1, i32 0, i32 %31, i32 %39, i32 %40) #3
  %sunkaddr14 = shl i64 %indvars.iv, 3
  %sunkaddr15 = add i64 %sunkaddr, %sunkaddr14
  %sunkaddr16 = add i64 %sunkaddr15, 112
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to %struct.jvirt_barray_control**
  store %struct.jvirt_barray_control* %41, %struct.jvirt_barray_control** %sunkaddr17, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %42 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0110, i64 1
  %43 = load i32, i32* %sunkaddr20, align 4
  %44 = sext i32 %43 to i64
  %45 = icmp slt i64 %indvars.iv.next, %44
  br i1 %45, label %20, label %.loopexit.loopexit

; <label>:46:                                     ; preds = %2
  %47 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr5 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 8
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to %struct.jpeg_memory_mgr**
  %48 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr7, align 8
  %49 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %48, i64 0, i32 1
  %50 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %49, align 8
  %51 = tail call i8* %50(%struct.jpeg_common_struct* %47, i32 1, i64 1280) #3
  %52 = getelementptr inbounds i8, i8* %8, i64 32
  %53 = bitcast i8* %52 to i8**
  store i8* %51, i8** %53, align 8
  %54 = getelementptr inbounds i8, i8* %51, i64 128
  %55 = getelementptr inbounds i8, i8* %8, i64 40
  %56 = bitcast i8* %55 to i8**
  store i8* %54, i8** %56, align 8
  %57 = getelementptr inbounds i8, i8* %51, i64 256
  %58 = getelementptr inbounds i8, i8* %8, i64 48
  %59 = bitcast i8* %58 to i8**
  store i8* %57, i8** %59, align 8
  %60 = getelementptr inbounds i8, i8* %51, i64 384
  %61 = getelementptr inbounds i8, i8* %8, i64 56
  %62 = bitcast i8* %61 to i8**
  store i8* %60, i8** %62, align 8
  %63 = getelementptr inbounds i8, i8* %51, i64 512
  %64 = getelementptr inbounds i8, i8* %8, i64 64
  %65 = bitcast i8* %64 to i8**
  store i8* %63, i8** %65, align 8
  %66 = getelementptr inbounds i8, i8* %51, i64 640
  %67 = getelementptr inbounds i8, i8* %8, i64 72
  %68 = bitcast i8* %67 to i8**
  store i8* %66, i8** %68, align 8
  %69 = getelementptr inbounds i8, i8* %51, i64 768
  %70 = getelementptr inbounds i8, i8* %8, i64 80
  %71 = bitcast i8* %70 to i8**
  store i8* %69, i8** %71, align 8
  %72 = getelementptr inbounds i8, i8* %51, i64 896
  %73 = getelementptr inbounds i8, i8* %8, i64 88
  %74 = bitcast i8* %73 to i8**
  store i8* %72, i8** %74, align 8
  %75 = getelementptr inbounds i8, i8* %51, i64 1024
  %76 = getelementptr inbounds i8, i8* %8, i64 96
  %77 = bitcast i8* %76 to i8**
  store i8* %75, i8** %77, align 8
  %78 = getelementptr inbounds i8, i8* %51, i64 1152
  %79 = getelementptr inbounds i8, i8* %8, i64 104
  %80 = bitcast i8* %79 to i8**
  store i8* %78, i8** %80, align 8
  %81 = getelementptr inbounds i8, i8* %8, i64 112
  %82 = bitcast i8* %81 to %struct.jvirt_barray_control**
  store %struct.jvirt_barray_control* null, %struct.jvirt_barray_control** %82, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %20
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %13, %46
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_coef(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %4 = bitcast %struct.jpeg_c_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 1
  store i32 0, i32* %6, align 8
  tail call fastcc void @start_iMCU_row(%struct.jpeg_compress_struct* %0)
  switch i32 %1, label %43 [
    i32 0, label %7
    i32 3, label %19
    i32 2, label %31
  ]

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 6, i64 0
  %9 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %8, align 8
  %10 = icmp eq %struct.jvirt_barray_control* %9, null
  br i1 %10, label %51, label %11

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 4, i32* %14, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %16 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %17 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %16, align 8
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %17(%struct.jpeg_common_struct* %18) #3
  br label %51

; <label>:19:                                     ; preds = %2
  %20 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 6, i64 0
  %21 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %20, align 8
  %22 = icmp eq %struct.jvirt_barray_control* %21, null
  br i1 %22, label %23, label %51

; <label>:23:                                     ; preds = %19
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 5
  store i32 4, i32* %26, align 8
  %27 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %28 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %27, align 8
  %29 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %28, align 8
  %30 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %29(%struct.jpeg_common_struct* %30) #3
  br label %51

; <label>:31:                                     ; preds = %2
  %32 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 6, i64 0
  %33 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %32, align 8
  %34 = icmp eq %struct.jvirt_barray_control* %33, null
  br i1 %34, label %35, label %51

; <label>:35:                                     ; preds = %31
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i64 0, i32 5
  store i32 4, i32* %38, align 8
  %39 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %40 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %39, align 8
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  %42 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %41(%struct.jpeg_common_struct* %42) #3
  br label %51

; <label>:43:                                     ; preds = %2
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 5
  store i32 4, i32* %46, align 8
  %47 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %48 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %47, align 8
  %49 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %48, align 8
  %50 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %49(%struct.jpeg_common_struct* %50) #3
  ret void

; <label>:51:                                     ; preds = %11, %7, %31, %35, %19, %23
  %compress_output.sink = phi i32 (%struct.jpeg_compress_struct*, i8***)* [ @compress_first_pass, %23 ], [ @compress_first_pass, %19 ], [ @compress_output, %35 ], [ @compress_output, %31 ], [ @compress_data, %7 ], [ @compress_data, %11 ]
  %52 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, i8***)* %compress_output.sink, i32 (%struct.jpeg_compress_struct*, i8***)** %52, align 8
  ret void
}

declare i64 @jround_up(i64, i64) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @start_iMCU_row(%struct.jpeg_compress_struct* nocapture readonly) unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %3 = bitcast %struct.jpeg_c_coef_controller** %2 to %struct.my_coef_controller**
  %4 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %6 = load i32, i32* %5, align 4
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %23, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  %12 = load i32, i32* %11, align 8
  %13 = add i32 %12, -1
  %14 = icmp ult i32 %10, %13
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 0
  %16 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %15, align 8
  br i1 %14, label %17, label %20

; <label>:17:                                     ; preds = %8
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %16, i64 0, i32 3
  %19 = load i32, i32* %18, align 4
  br label %23

; <label>:20:                                     ; preds = %8
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %16, i64 0, i32 18
  %22 = load i32, i32* %21, align 8
  br label %23

; <label>:23:                                     ; preds = %17, %20, %1
  %.sink.sink = phi i32 [ 1, %1 ], [ %22, %20 ], [ %19, %17 ]
  %24 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 4
  store i32 %.sink.sink, i32* %24, align 4
  %25 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 2
  store i32 0, i32* %25, align 4
  %26 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %4, i64 0, i32 3
  store i32 0, i32* %26, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @compress_data(%struct.jpeg_compress_struct*, i8*** nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %4 = bitcast %struct.jpeg_c_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  %7 = load i32, i32* %6, align 8
  %8 = add i32 %7, -1
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  %10 = load i32, i32* %9, align 8
  %11 = add i32 %10, -1
  %12 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 4
  %15 = load i32, i32* %14, align 4
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %.lr.ph48, label %._crit_edge49

.lr.ph48:                                         ; preds = %2
  %17 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 0
  %sunkaddr72 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr73 = add i64 %sunkaddr72, 20
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i32*
  %sunkaddr164 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr165 = add i64 %sunkaddr164, 20
  %sunkaddr166 = inttoptr i64 %sunkaddr165 to i32*
  %sunkaddr167 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr168 = add i64 %sunkaddr167, 28
  %sunkaddr169 = inttoptr i64 %sunkaddr168 to i32*
  %sunkaddr75 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr76 = add i64 %sunkaddr75, 316
  %sunkaddr77 = inttoptr i64 %sunkaddr76 to i32*
  %sunkaddr78 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr79 = add i64 %sunkaddr78, 316
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to i32*
  %sunkaddr81 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr82 = add i64 %sunkaddr81, 16
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to i32*
  %sunkaddr98 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr99 = add i64 %sunkaddr98, 480
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to %struct.jpeg_forward_dct**
  %sunkaddr101 = ptrtoint i8*** %1 to i64
  %sunkaddr90 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr158 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr159 = add i64 %sunkaddr158, 316
  %sunkaddr160 = inttoptr i64 %sunkaddr159 to i32*
  %sunkaddr120 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr121 = add i64 %sunkaddr120, 16
  %sunkaddr122 = inttoptr i64 %sunkaddr121 to i32*
  %sunkaddr126 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr127 = add i64 %sunkaddr126, 480
  %sunkaddr128 = inttoptr i64 %sunkaddr127 to %struct.jpeg_forward_dct**
  %sunkaddr129 = ptrtoint i8*** %1 to i64
  %sunkaddr144 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr161 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr162 = add i64 %sunkaddr161, 488
  %sunkaddr163 = inttoptr i64 %sunkaddr162 to %struct.jpeg_entropy_encoder**
  br label %18

; <label>:18:                                     ; preds = %.lr.ph48, %._crit_edge44
  %.0245 = phi i32 [ %13, %.lr.ph48 ], [ %200, %._crit_edge44 ]
  %19 = load i32, i32* %sunkaddr74, align 4
  %20 = icmp ugt i32 %19, %8
  br i1 %20, label %._crit_edge44, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %18
  %21 = shl nsw i32 %.0245, 3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %197
  %.0441 = phi i32 [ %19, %.preheader.lr.ph ], [ %198, %197 ]
  %22 = load i32, i32* %sunkaddr77, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.lr.ph39, label %._crit_edge40

.lr.ph39:                                         ; preds = %.preheader
  %24 = icmp ult i32 %.0441, %8
  br i1 %24, label %.lr.ph39.split.us.preheader, label %.lr.ph39.split.preheader

.lr.ph39.split.preheader:                         ; preds = %.lr.ph39
  br label %.lr.ph39.split

.lr.ph39.split.us.preheader:                      ; preds = %.lr.ph39
  br label %.lr.ph39.split.us

.lr.ph39.split.us:                                ; preds = %.lr.ph39.split.us.preheader, %._crit_edge.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge.us ], [ 0, %.lr.ph39.split.us.preheader ]
  %.0737.us = phi i32 [ %.18.lcssa.us, %._crit_edge.us ], [ 0, %.lr.ph39.split.us.preheader ]
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv64
  %26 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i64 0, i32 13
  %28 = load i32, i32* %27, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i64 0, i32 16
  %31 = load i32, i32* %30, align 8
  %32 = mul i32 %31, %.0441
  %33 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i64 0, i32 14
  %34 = load i32, i32* %33, align 8
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %.lr.ph36.us.preheader, label %._crit_edge.us

.lr.ph36.us.preheader:                            ; preds = %.lr.ph39.split.us
  %sunkaddr102 = shl i64 %indvars.iv64, 3
  %sunkaddr103 = add i64 %sunkaddr101, %sunkaddr102
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to i8***
  %sunkaddr105 = ptrtoint %struct.jpeg_component_info* %26 to i64
  %sunkaddr106 = add i64 %sunkaddr105, 52
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to i32*
  %sunkaddr108 = ptrtoint %struct.jpeg_component_info* %26 to i64
  %sunkaddr109 = add i64 %sunkaddr108, 52
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to i32*
  %sunkaddr117 = ptrtoint %struct.jpeg_component_info* %26 to i64
  %sunkaddr118 = add i64 %sunkaddr117, 52
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to i32*
  %sunkaddr111 = ptrtoint %struct.jpeg_component_info* %26 to i64
  %sunkaddr112 = add i64 %sunkaddr111, 52
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to i32*
  %sunkaddr114 = ptrtoint %struct.jpeg_component_info* %26 to i64
  %sunkaddr115 = add i64 %sunkaddr114, 56
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to i32*
  %sunkaddr84 = ptrtoint %struct.jpeg_component_info* %26 to i64
  %sunkaddr85 = add i64 %sunkaddr84, 72
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to i32*
  %sunkaddr87 = ptrtoint %struct.jpeg_component_info* %26 to i64
  %sunkaddr88 = add i64 %sunkaddr87, 52
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to i32*
  %sunkaddr95 = ptrtoint %struct.jpeg_component_info* %26 to i64
  %sunkaddr96 = add i64 %sunkaddr95, 52
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to i32*
  br label %.lr.ph36.us

._crit_edge.us.loopexit:                          ; preds = %.loopexit.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph39.split.us
  %.18.lcssa.us = phi i32 [ %.0737.us, %.lr.ph39.split.us ], [ %89, %._crit_edge.us.loopexit ]
  %indvars.iv.next65 = add nuw i64 %indvars.iv64, 1
  %36 = load i32, i32* %sunkaddr80, align 4
  %37 = sext i32 %36 to i64
  %38 = icmp slt i64 %indvars.iv.next65, %37
  br i1 %38, label %.lr.ph39.split.us, label %._crit_edge40.loopexit

.lr.ph36.us:                                      ; preds = %.lr.ph36.us.preheader, %.loopexit.us
  %.0135.us = phi i32 [ %87, %.loopexit.us ], [ %21, %.lr.ph36.us.preheader ]
  %.0334.us = phi i32 [ %90, %.loopexit.us ], [ 0, %.lr.ph36.us.preheader ]
  %.1830.us = phi i32 [ %89, %.loopexit.us ], [ %.0737.us, %.lr.ph36.us.preheader ]
  %39 = load i32, i32* %sunkaddr83, align 8
  %40 = icmp ult i32 %39, %11
  br i1 %40, label %65, label %41

; <label>:41:                                     ; preds = %.lr.ph36.us
  %42 = add nsw i32 %.0334.us, %.0245
  %43 = load i32, i32* %sunkaddr86, align 8
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %65, label %45

; <label>:45:                                     ; preds = %41
  %46 = sext i32 %.1830.us to i64
  %47 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %46
  %48 = bitcast [64 x i16]** %47 to i8**
  %49 = load i8*, i8** %48, align 8
  %50 = load i32, i32* %sunkaddr89, align 4
  %51 = sext i32 %50 to i64
  %52 = shl nsw i64 %51, 7
  tail call void @jzero_far(i8* %49, i64 %52) #3
  %53 = load i32, i32* %sunkaddr89, align 4
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %.lr.ph.us, label %.loopexit.us

; <label>:55:                                     ; preds = %.lr.ph.us, %55
  %indvars.iv60 = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next61, %55 ]
  %56 = load i16*, i16** %sunkaddr94, align 8
  %57 = load i16, i16* %56, align 2
  %58 = add nsw i64 %indvars.iv60, %107
  %59 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %58
  %60 = bitcast [64 x i16]** %59 to i16**
  %61 = load i16*, i16** %60, align 8
  store i16 %57, i16* %61, align 2
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %62 = load i32, i32* %sunkaddr97, align 4
  %63 = sext i32 %62 to i64
  %64 = icmp slt i64 %indvars.iv.next61, %63
  br i1 %64, label %55, label %.loopexit.us.loopexit176

; <label>:65:                                     ; preds = %41, %.lr.ph36.us
  %66 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %sunkaddr100, align 8
  %67 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %66, i64 0, i32 1
  %68 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %67, align 8
  %69 = load i8**, i8*** %sunkaddr104, align 8
  %70 = sext i32 %.1830.us to i64
  %71 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %70
  %72 = load [64 x i16]*, [64 x i16]** %71, align 8
  tail call void %68(%struct.jpeg_compress_struct* %0, %struct.jpeg_component_info* nonnull %26, i8** %69, [64 x i16]* %72, i32 %.0135.us, i32 %32, i32 %28) #3
  %73 = load i32, i32* %sunkaddr107, align 4
  %74 = icmp sgt i32 %73, %28
  br i1 %74, label %75, label %.loopexit.us

; <label>:75:                                     ; preds = %65
  %76 = add nsw i32 %.1830.us, %28
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %77
  %79 = bitcast [64 x i16]** %78 to i8**
  %80 = load i8*, i8** %79, align 8
  %81 = sub nsw i32 %73, %28
  %82 = sext i32 %81 to i64
  %83 = shl nsw i64 %82, 7
  tail call void @jzero_far(i8* %80, i64 %83) #3
  %84 = load i32, i32* %sunkaddr110, align 4
  %85 = icmp slt i32 %28, %84
  br i1 %85, label %.lr.ph29.us.preheader, label %.loopexit.us

.lr.ph29.us.preheader:                            ; preds = %75
  %86 = sext i32 %.1830.us to i64
  br label %.lr.ph29.us

.loopexit.us.loopexit:                            ; preds = %.lr.ph29.us
  br label %.loopexit.us

.loopexit.us.loopexit176:                         ; preds = %55
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit176, %.loopexit.us.loopexit, %45, %75, %65
  %87 = add i32 %.0135.us, 8
  %88 = load i32, i32* %sunkaddr113, align 4
  %89 = add nsw i32 %88, %.1830.us
  %90 = add nuw nsw i32 %.0334.us, 1
  %91 = load i32, i32* %sunkaddr116, align 8
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %.lr.ph36.us, label %._crit_edge.us.loopexit

.lr.ph29.us:                                      ; preds = %.lr.ph29.us.preheader, %.lr.ph29.us
  %indvars.iv62 = phi i64 [ %29, %.lr.ph29.us.preheader ], [ %indvars.iv.next63, %.lr.ph29.us ]
  %93 = add nsw i64 %indvars.iv62, %86
  %94 = add nsw i64 %93, -1
  %95 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %94
  %96 = bitcast [64 x i16]** %95 to i16**
  %97 = load i16*, i16** %96, align 8
  %98 = load i16, i16* %97, align 2
  %99 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %93
  %100 = bitcast [64 x i16]** %99 to i16**
  %101 = load i16*, i16** %100, align 8
  store i16 %98, i16* %101, align 2
  %indvars.iv.next63 = add i64 %indvars.iv62, 1
  %102 = load i32, i32* %sunkaddr119, align 4
  %103 = sext i32 %102 to i64
  %104 = icmp slt i64 %indvars.iv.next63, %103
  br i1 %104, label %.lr.ph29.us, label %.loopexit.us.loopexit

.lr.ph.us:                                        ; preds = %45
  %105 = add nsw i32 %.1830.us, -1
  %106 = sext i32 %105 to i64
  %107 = sext i32 %.1830.us to i64
  %sunkaddr91 = shl nsw i64 %106, 3
  %sunkaddr92 = add i64 %sunkaddr90, %sunkaddr91
  %sunkaddr93 = add i64 %sunkaddr92, 32
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to i16**
  br label %55

.lr.ph39.split:                                   ; preds = %.lr.ph39.split.preheader, %._crit_edge
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge ], [ 0, %.lr.ph39.split.preheader ]
  %.0737 = phi i32 [ %.18.lcssa, %._crit_edge ], [ 0, %.lr.ph39.split.preheader ]
  %108 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv58
  %109 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %108, align 8
  %110 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %109, i64 0, i32 17
  %111 = load i32, i32* %110, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %109, i64 0, i32 16
  %114 = load i32, i32* %113, align 8
  %115 = mul i32 %114, %.0441
  %116 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %109, i64 0, i32 14
  %117 = load i32, i32* %116, align 8
  %118 = icmp sgt i32 %117, 0
  br i1 %118, label %.lr.ph36.preheader, label %._crit_edge

.lr.ph36.preheader:                               ; preds = %.lr.ph39.split
  %sunkaddr130 = shl i64 %indvars.iv58, 3
  %sunkaddr131 = add i64 %sunkaddr129, %sunkaddr130
  %sunkaddr132 = inttoptr i64 %sunkaddr131 to i8***
  %sunkaddr133 = ptrtoint %struct.jpeg_component_info* %109 to i64
  %sunkaddr134 = add i64 %sunkaddr133, 52
  %sunkaddr135 = inttoptr i64 %sunkaddr134 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_component_info* %109 to i64
  %sunkaddr136 = add i64 %sunkaddr, 52
  %sunkaddr137 = inttoptr i64 %sunkaddr136 to i32*
  %sunkaddr138 = ptrtoint %struct.jpeg_component_info* %109 to i64
  %sunkaddr139 = add i64 %sunkaddr138, 52
  %sunkaddr140 = inttoptr i64 %sunkaddr139 to i32*
  %sunkaddr152 = ptrtoint %struct.jpeg_component_info* %109 to i64
  %sunkaddr153 = add i64 %sunkaddr152, 52
  %sunkaddr154 = inttoptr i64 %sunkaddr153 to i32*
  %sunkaddr155 = ptrtoint %struct.jpeg_component_info* %109 to i64
  %sunkaddr156 = add i64 %sunkaddr155, 56
  %sunkaddr157 = inttoptr i64 %sunkaddr156 to i32*
  %sunkaddr123 = ptrtoint %struct.jpeg_component_info* %109 to i64
  %sunkaddr124 = add i64 %sunkaddr123, 72
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to i32*
  %sunkaddr141 = ptrtoint %struct.jpeg_component_info* %109 to i64
  %sunkaddr142 = add i64 %sunkaddr141, 52
  %sunkaddr143 = inttoptr i64 %sunkaddr142 to i32*
  %sunkaddr149 = ptrtoint %struct.jpeg_component_info* %109 to i64
  %sunkaddr150 = add i64 %sunkaddr149, 52
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to i32*
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.lr.ph36.preheader, %.loopexit
  %.0135 = phi i32 [ %182, %.loopexit ], [ %21, %.lr.ph36.preheader ]
  %.0334 = phi i32 [ %185, %.loopexit ], [ 0, %.lr.ph36.preheader ]
  %.1830 = phi i32 [ %184, %.loopexit ], [ %.0737, %.lr.ph36.preheader ]
  %119 = load i32, i32* %sunkaddr122, align 8
  %120 = icmp ult i32 %119, %11
  br i1 %120, label %125, label %121

; <label>:121:                                    ; preds = %.lr.ph36
  %122 = add nsw i32 %.0334, %.0245
  %123 = load i32, i32* %sunkaddr125, align 8
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %125, label %159

; <label>:125:                                    ; preds = %121, %.lr.ph36
  %126 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %sunkaddr128, align 8
  %127 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %126, i64 0, i32 1
  %128 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %127, align 8
  %129 = load i8**, i8*** %sunkaddr132, align 8
  %130 = sext i32 %.1830 to i64
  %131 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %130
  %132 = load [64 x i16]*, [64 x i16]** %131, align 8
  tail call void %128(%struct.jpeg_compress_struct* %0, %struct.jpeg_component_info* nonnull %109, i8** %129, [64 x i16]* %132, i32 %.0135, i32 %115, i32 %111) #3
  %133 = load i32, i32* %sunkaddr135, align 4
  %134 = icmp sgt i32 %133, %111
  br i1 %134, label %135, label %.loopexit

; <label>:135:                                    ; preds = %125
  %136 = add nsw i32 %.1830, %111
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %137
  %139 = bitcast [64 x i16]** %138 to i8**
  %140 = load i8*, i8** %139, align 8
  %141 = sub nsw i32 %133, %111
  %142 = sext i32 %141 to i64
  %143 = shl nsw i64 %142, 7
  tail call void @jzero_far(i8* %140, i64 %143) #3
  %144 = load i32, i32* %sunkaddr137, align 4
  %145 = icmp slt i32 %111, %144
  br i1 %145, label %.lr.ph29.preheader, label %.loopexit

.lr.ph29.preheader:                               ; preds = %135
  %146 = sext i32 %.1830 to i64
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader, %.lr.ph29
  %indvars.iv56 = phi i64 [ %112, %.lr.ph29.preheader ], [ %indvars.iv.next57, %.lr.ph29 ]
  %147 = add nsw i64 %indvars.iv56, %146
  %148 = add nsw i64 %147, -1
  %149 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %148
  %150 = bitcast [64 x i16]** %149 to i16**
  %151 = load i16*, i16** %150, align 8
  %152 = load i16, i16* %151, align 2
  %153 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %147
  %154 = bitcast [64 x i16]** %153 to i16**
  %155 = load i16*, i16** %154, align 8
  store i16 %152, i16* %155, align 2
  %indvars.iv.next57 = add i64 %indvars.iv56, 1
  %156 = load i32, i32* %sunkaddr140, align 4
  %157 = sext i32 %156 to i64
  %158 = icmp slt i64 %indvars.iv.next57, %157
  br i1 %158, label %.lr.ph29, label %.loopexit.loopexit

; <label>:159:                                    ; preds = %121
  %160 = sext i32 %.1830 to i64
  %161 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %160
  %162 = bitcast [64 x i16]** %161 to i8**
  %163 = load i8*, i8** %162, align 8
  %164 = load i32, i32* %sunkaddr143, align 4
  %165 = sext i32 %164 to i64
  %166 = shl nsw i64 %165, 7
  tail call void @jzero_far(i8* %163, i64 %166) #3
  %167 = load i32, i32* %sunkaddr143, align 4
  %168 = icmp sgt i32 %167, 0
  br i1 %168, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %159
  %169 = add nsw i32 %.1830, -1
  %170 = sext i32 %169 to i64
  %171 = sext i32 %.1830 to i64
  %sunkaddr145 = shl nsw i64 %170, 3
  %sunkaddr146 = add i64 %sunkaddr144, %sunkaddr145
  %sunkaddr147 = add i64 %sunkaddr146, 32
  %sunkaddr148 = inttoptr i64 %sunkaddr147 to i16**
  br label %172

; <label>:172:                                    ; preds = %.lr.ph, %172
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %172 ]
  %173 = load i16*, i16** %sunkaddr148, align 8
  %174 = load i16, i16* %173, align 2
  %175 = add nsw i64 %indvars.iv, %171
  %176 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %175
  %177 = bitcast [64 x i16]** %176 to i16**
  %178 = load i16*, i16** %177, align 8
  store i16 %174, i16* %178, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %179 = load i32, i32* %sunkaddr151, align 4
  %180 = sext i32 %179 to i64
  %181 = icmp slt i64 %indvars.iv.next, %180
  br i1 %181, label %172, label %.loopexit.loopexit177

.loopexit.loopexit:                               ; preds = %.lr.ph29
  br label %.loopexit

.loopexit.loopexit177:                            ; preds = %172
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit177, %.loopexit.loopexit, %159, %135, %125
  %182 = add i32 %.0135, 8
  %183 = load i32, i32* %sunkaddr154, align 4
  %184 = add nsw i32 %183, %.1830
  %185 = add nuw nsw i32 %.0334, 1
  %186 = load i32, i32* %sunkaddr157, align 8
  %187 = icmp slt i32 %185, %186
  br i1 %187, label %.lr.ph36, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph39.split
  %.18.lcssa = phi i32 [ %.0737, %.lr.ph39.split ], [ %184, %._crit_edge.loopexit ]
  %indvars.iv.next59 = add nuw i64 %indvars.iv58, 1
  %188 = load i32, i32* %sunkaddr160, align 4
  %189 = sext i32 %188 to i64
  %190 = icmp slt i64 %indvars.iv.next59, %189
  br i1 %190, label %.lr.ph39.split, label %._crit_edge40.loopexit178

._crit_edge40.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge40

._crit_edge40.loopexit178:                        ; preds = %._crit_edge
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit178, %._crit_edge40.loopexit, %.preheader
  %191 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %sunkaddr163, align 8
  %192 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %191, i64 0, i32 1
  %193 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %192, align 8
  %194 = tail call i32 %193(%struct.jpeg_compress_struct* nonnull %0, [64 x i16]** %17) #3
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %196, label %197

; <label>:196:                                    ; preds = %._crit_edge40
  %sunkaddr13 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 24
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i32*
  store i32 %.0245, i32* %sunkaddr15, align 8
  %sunkaddr16 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 20
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i32*
  store i32 %.0441, i32* %sunkaddr18, align 4
  br label %206

; <label>:197:                                    ; preds = %._crit_edge40
  %198 = add i32 %.0441, 1
  %199 = icmp ugt i32 %198, %8
  br i1 %199, label %._crit_edge44.loopexit, label %.preheader

._crit_edge44.loopexit:                           ; preds = %197
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %18
  store i32 0, i32* %sunkaddr166, align 4
  %200 = add nsw i32 %.0245, 1
  %201 = load i32, i32* %sunkaddr169, align 4
  %202 = icmp slt i32 %200, %201
  br i1 %202, label %18, label %._crit_edge49.loopexit

._crit_edge49.loopexit:                           ; preds = %._crit_edge44
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %2
  %203 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 1
  %204 = load i32, i32* %203, align 8
  %205 = add i32 %204, 1
  store i32 %205, i32* %203, align 8
  tail call fastcc void @start_iMCU_row(%struct.jpeg_compress_struct* %0)
  br label %206

; <label>:206:                                    ; preds = %._crit_edge49, %196
  %.0 = phi i32 [ 0, %196 ], [ 1, %._crit_edge49 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @compress_first_pass(%struct.jpeg_compress_struct*, i8*** nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %4 = bitcast %struct.jpeg_c_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  %7 = load i32, i32* %6, align 8
  %8 = add i32 %7, -1
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph55, label %._crit_edge56

.lr.ph55:                                         ; preds = %2
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %13 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %12, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr85 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr86 = add i64 %sunkaddr85, 8
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to %struct.jpeg_memory_mgr**
  %sunkaddr88 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr89 = add i64 %sunkaddr88, 16
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to i32*
  %sunkaddr91 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr92 = add i64 %sunkaddr91, 480
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to %struct.jpeg_forward_dct**
  %sunkaddr94 = ptrtoint i8*** %1 to i64
  %sunkaddr98 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr99 = add i64 %sunkaddr98, 480
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to %struct.jpeg_forward_dct**
  %sunkaddr101 = ptrtoint i8*** %1 to i64
  %sunkaddr105 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr106 = add i64 %sunkaddr105, 16
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to i32*
  %sunkaddr114 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr115 = add i64 %sunkaddr114, 68
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to i32*
  br label %15

; <label>:15:                                     ; preds = %.lr.ph55, %.loopexit22
  %indvars.iv81 = phi i64 [ 0, %.lr.ph55 ], [ %indvars.iv.next82, %.loopexit22 ]
  %.0250 = phi %struct.jpeg_component_info* [ %13, %.lr.ph55 ], [ %139, %.loopexit22 ]
  %16 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr87, align 8
  %17 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %16, i64 0, i32 8
  %18 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %17, align 8
  %19 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 6, i64 %indvars.iv81
  %20 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %19, align 8
  %21 = load i32, i32* %sunkaddr90, align 8
  %22 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0250, i64 0, i32 3
  %23 = load i32, i32* %22, align 4
  %24 = mul i32 %23, %21
  %25 = tail call [64 x i16]** %18(%struct.jpeg_common_struct* %14, %struct.jvirt_barray_control* %20, i32 %24, i32 %23, i32 1) #3
  %26 = load i32, i32* %sunkaddr90, align 8
  %27 = icmp ult i32 %26, %8
  br i1 %27, label %.sink.split, label %28

; <label>:28:                                     ; preds = %15
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0250, i64 0, i32 8
  %30 = load i32, i32* %29, align 8
  %sunkaddr = ptrtoint %struct.jpeg_component_info* %.0250 to i64
  %sunkaddr11 = add i64 %sunkaddr, 12
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i32*
  %31 = load i32, i32* %sunkaddr12, align 4
  %32 = urem i32 %30, %31
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %.sink.split, label %35

.sink.split:                                      ; preds = %15, %28
  %sunkaddr13 = ptrtoint %struct.jpeg_component_info* %.0250 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 12
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i32*
  %34 = load i32, i32* %sunkaddr15, align 4
  br label %35

; <label>:35:                                     ; preds = %.sink.split, %28
  %.18 = phi i32 [ %32, %28 ], [ %34, %.sink.split ]
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0250, i64 0, i32 7
  %37 = load i32, i32* %36, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0250, i64 0, i32 2
  %40 = load i32, i32* %39, align 8
  %41 = sext i32 %40 to i64
  %42 = sext i32 %40 to i64
  %43 = urem i32 %37, %40
  %44 = icmp sgt i32 %43, 0
  %45 = sub nsw i32 %40, %43
  %. = select i1 %44, i32 %45, i32 %43
  %46 = icmp sgt i32 %.18, 0
  br i1 %46, label %.lr.ph25, label %._crit_edge

.lr.ph25:                                         ; preds = %35
  %47 = icmp sgt i32 %., 0
  %48 = sext i32 %. to i64
  %49 = shl nsw i64 %48, 7
  br i1 %47, label %.lr.ph25.split.us.split.us.preheader, label %.lr.ph25.split.preheader

.lr.ph25.split.preheader:                         ; preds = %.lr.ph25
  %wide.trip.count = zext i32 %.18 to i64
  %sunkaddr102 = shl i64 %indvars.iv81, 3
  %sunkaddr103 = add i64 %sunkaddr101, %sunkaddr102
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to i8***
  br label %.lr.ph25.split

.lr.ph25.split.us.split.us.preheader:             ; preds = %.lr.ph25
  %50 = add i32 %., -1
  %xtraiter = and i32 %., 7
  %wide.trip.count66 = zext i32 %.18 to i64
  %wide.trip.count62.7 = zext i32 %. to i64
  %51 = icmp eq i32 %xtraiter, 0
  %sunkaddr95 = shl i64 %indvars.iv81, 3
  %sunkaddr96 = add i64 %sunkaddr94, %sunkaddr95
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to i8***
  %52 = icmp ult i32 %50, 7
  br label %.lr.ph25.split.us.split.us

.lr.ph25.split.us.split.us:                       ; preds = %..loopexit_crit_edge.us.us, %.lr.ph25.split.us.split.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.lr.ph25.split.us.split.us.preheader ], [ %indvars.iv.next65, %..loopexit_crit_edge.us.us ]
  %53 = getelementptr inbounds [64 x i16]*, [64 x i16]** %25, i64 %indvars.iv64
  %54 = load [64 x i16]*, [64 x i16]** %53, align 8
  %55 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %sunkaddr93, align 8
  %56 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %55, i64 0, i32 1
  %57 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %56, align 8
  %58 = load i8**, i8*** %sunkaddr97, align 8
  %59 = trunc i64 %indvars.iv64 to i32
  %60 = shl nsw i32 %59, 3
  tail call void %57(%struct.jpeg_compress_struct* %0, %struct.jpeg_component_info* %.0250, i8** %58, [64 x i16]* %54, i32 %60, i32 0, i32 %37) #3
  %61 = getelementptr inbounds [64 x i16], [64 x i16]* %54, i64 %38
  %62 = bitcast [64 x i16]* %61 to i8*
  tail call void @jzero_far(i8* %62, i64 %49) #3
  %63 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 -1
  %64 = getelementptr inbounds [64 x i16], [64 x i16]* %63, i64 0, i64 0
  %65 = load i16, i16* %64, align 2
  br i1 %51, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph25.split.us.split.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv60.prol = phi i64 [ %indvars.iv.next61.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %66 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv60.prol
  %67 = getelementptr inbounds [64 x i16], [64 x i16]* %66, i64 0, i64 0
  store i16 %65, i16* %67, align 2
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph25.split.us.split.us
  %indvars.iv60.unr = phi i64 [ 0, %.lr.ph25.split.us.split.us ], [ %indvars.iv.next61.prol, %.prol.loopexit.loopexit ]
  br i1 %52, label %..loopexit_crit_edge.us.us, label %.lr.ph25.split.us.split.us.new.preheader

.lr.ph25.split.us.split.us.new.preheader:         ; preds = %.prol.loopexit
  br label %.lr.ph25.split.us.split.us.new

..loopexit_crit_edge.us.us.loopexit:              ; preds = %.lr.ph25.split.us.split.us.new
  br label %..loopexit_crit_edge.us.us

..loopexit_crit_edge.us.us:                       ; preds = %..loopexit_crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %._crit_edge.loopexit, label %.lr.ph25.split.us.split.us

.lr.ph25.split.us.split.us.new:                   ; preds = %.lr.ph25.split.us.split.us.new.preheader, %.lr.ph25.split.us.split.us.new
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.7, %.lr.ph25.split.us.split.us.new ], [ %indvars.iv60.unr, %.lr.ph25.split.us.split.us.new.preheader ]
  %68 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv60
  %69 = getelementptr inbounds [64 x i16], [64 x i16]* %68, i64 0, i64 0
  store i16 %65, i16* %69, align 2
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %70 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv.next61
  %71 = getelementptr inbounds [64 x i16], [64 x i16]* %70, i64 0, i64 0
  store i16 %65, i16* %71, align 2
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %72 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv.next61.1
  %73 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 0, i64 0
  store i16 %65, i16* %73, align 2
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %74 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv.next61.2
  %75 = getelementptr inbounds [64 x i16], [64 x i16]* %74, i64 0, i64 0
  store i16 %65, i16* %75, align 2
  %indvars.iv.next61.3 = add nsw i64 %indvars.iv60, 4
  %76 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv.next61.3
  %77 = getelementptr inbounds [64 x i16], [64 x i16]* %76, i64 0, i64 0
  store i16 %65, i16* %77, align 2
  %indvars.iv.next61.4 = add nsw i64 %indvars.iv60, 5
  %78 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv.next61.4
  %79 = getelementptr inbounds [64 x i16], [64 x i16]* %78, i64 0, i64 0
  store i16 %65, i16* %79, align 2
  %indvars.iv.next61.5 = add nsw i64 %indvars.iv60, 6
  %80 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv.next61.5
  %81 = getelementptr inbounds [64 x i16], [64 x i16]* %80, i64 0, i64 0
  store i16 %65, i16* %81, align 2
  %indvars.iv.next61.6 = add nsw i64 %indvars.iv60, 7
  %82 = getelementptr inbounds [64 x i16], [64 x i16]* %61, i64 %indvars.iv.next61.6
  %83 = getelementptr inbounds [64 x i16], [64 x i16]* %82, i64 0, i64 0
  store i16 %65, i16* %83, align 2
  %indvars.iv.next61.7 = add nsw i64 %indvars.iv60, 8
  %exitcond63.7 = icmp eq i64 %indvars.iv.next61.7, %wide.trip.count62.7
  br i1 %exitcond63.7, label %..loopexit_crit_edge.us.us.loopexit, label %.lr.ph25.split.us.split.us.new

.lr.ph25.split:                                   ; preds = %.lr.ph25.split.preheader, %.lr.ph25.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph25.split ], [ 0, %.lr.ph25.split.preheader ]
  %84 = getelementptr inbounds [64 x i16]*, [64 x i16]** %25, i64 %indvars.iv
  %85 = load [64 x i16]*, [64 x i16]** %84, align 8
  %86 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %sunkaddr100, align 8
  %87 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %86, i64 0, i32 1
  %88 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %87, align 8
  %89 = load i8**, i8*** %sunkaddr104, align 8
  %90 = trunc i64 %indvars.iv to i32
  %91 = shl nsw i32 %90, 3
  tail call void %88(%struct.jpeg_compress_struct* nonnull %0, %struct.jpeg_component_info* %.0250, i8** %89, [64 x i16]* %85, i32 %91, i32 0, i32 %37) #3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit120, label %.lr.ph25.split

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us.us
  br label %._crit_edge

._crit_edge.loopexit120:                          ; preds = %.lr.ph25.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit120, %._crit_edge.loopexit, %35
  %92 = load i32, i32* %sunkaddr107, align 8
  %93 = icmp eq i32 %92, %8
  br i1 %93, label %94, label %.loopexit22

; <label>:94:                                     ; preds = %._crit_edge
  %95 = add i32 %., %37
  %96 = udiv i32 %95, %40
  %sunkaddr19 = ptrtoint %struct.jpeg_component_info* %.0250 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 12
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i32*
  %97 = load i32, i32* %sunkaddr21, align 4
  %98 = icmp slt i32 %.18, %97
  br i1 %98, label %.lr.ph39, label %.loopexit22

.lr.ph39:                                         ; preds = %94
  %99 = zext i32 %95 to i64
  %100 = shl nuw nsw i64 %99, 7
  %101 = icmp ugt i32 %40, %95
  %102 = add nsw i64 %42, -1
  br i1 %101, label %.lr.ph39.split.preheader, label %.lr.ph39.split.us.preheader

.lr.ph39.split.us.preheader:                      ; preds = %.lr.ph39
  %103 = add i32 %40, -1
  %104 = sext i32 %.18 to i64
  %xtraiter74 = and i32 %40, 7
  %wide.trip.count70.7 = zext i32 %40 to i64
  %105 = icmp sgt i32 %40, 0
  %sunkaddr108 = ptrtoint %struct.jpeg_component_info* %.0250 to i64
  %sunkaddr109 = add i64 %sunkaddr108, 12
  %sunkaddr110 = inttoptr i64 %sunkaddr109 to i32*
  %106 = icmp eq i32 %xtraiter74, 0
  %107 = icmp ult i32 %103, 7
  br label %.lr.ph39.split.us

.lr.ph39.split.preheader:                         ; preds = %.lr.ph39
  %108 = sext i32 %.18 to i64
  %sunkaddr111 = ptrtoint %struct.jpeg_component_info* %.0250 to i64
  %sunkaddr112 = add i64 %sunkaddr111, 12
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to i32*
  br label %.lr.ph39.split

.lr.ph39.split.us:                                ; preds = %.lr.ph39.split.us.preheader, %._crit_edge36.us
  %indvars.iv77 = phi i64 [ %104, %.lr.ph39.split.us.preheader ], [ %indvars.iv.next78, %._crit_edge36.us ]
  %109 = getelementptr inbounds [64 x i16]*, [64 x i16]** %25, i64 %indvars.iv77
  %110 = load [64 x i16]*, [64 x i16]** %109, align 8
  %111 = add nsw i64 %indvars.iv77, -1
  %112 = getelementptr inbounds [64 x i16]*, [64 x i16]** %25, i64 %111
  %113 = load [64 x i16]*, [64 x i16]** %112, align 8
  %114 = bitcast [64 x i16]* %110 to i8*
  tail call void @jzero_far(i8* %114, i64 %100) #3
  br i1 %105, label %.lr.ph28.us.us.preheader, label %._crit_edge36.us

.lr.ph28.us.us.preheader:                         ; preds = %.lr.ph39.split.us
  br label %.lr.ph28.us.us

._crit_edge36.us.loopexit:                        ; preds = %._crit_edge29.us.us
  br label %._crit_edge36.us

._crit_edge36.us:                                 ; preds = %._crit_edge36.us.loopexit, %.lr.ph39.split.us
  %indvars.iv.next78 = add i64 %indvars.iv77, 1
  %115 = load i32, i32* %sunkaddr110, align 4
  %116 = sext i32 %115 to i64
  %117 = icmp slt i64 %indvars.iv.next78, %116
  br i1 %117, label %.lr.ph39.split.us, label %.loopexit22.loopexit119

.lr.ph28.us.us:                                   ; preds = %.lr.ph28.us.us.preheader, %._crit_edge29.us.us
  %.033.us.us = phi [64 x i16]* [ %121, %._crit_edge29.us.us ], [ %113, %.lr.ph28.us.us.preheader ]
  %.0131.us.us = phi [64 x i16]* [ %122, %._crit_edge29.us.us ], [ %110, %.lr.ph28.us.us.preheader ]
  %.0430.us.us = phi i32 [ %123, %._crit_edge29.us.us ], [ 0, %.lr.ph28.us.us.preheader ]
  %118 = getelementptr inbounds [64 x i16], [64 x i16]* %.033.us.us, i64 %102, i64 0
  %119 = load i16, i16* %118, align 2
  br i1 %106, label %.prol.loopexit73, label %.prol.preheader72.preheader

.prol.preheader72.preheader:                      ; preds = %.lr.ph28.us.us
  br label %.prol.preheader72

.prol.preheader72:                                ; preds = %.prol.preheader72.preheader, %.prol.preheader72
  %indvars.iv68.prol = phi i64 [ %indvars.iv.next69.prol, %.prol.preheader72 ], [ 0, %.prol.preheader72.preheader ]
  %prol.iter76 = phi i32 [ %prol.iter76.sub, %.prol.preheader72 ], [ %xtraiter74, %.prol.preheader72.preheader ]
  %120 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv68.prol, i64 0
  store i16 %119, i16* %120, align 2
  %indvars.iv.next69.prol = add nuw nsw i64 %indvars.iv68.prol, 1
  %prol.iter76.sub = add i32 %prol.iter76, -1
  %prol.iter76.cmp = icmp eq i32 %prol.iter76.sub, 0
  br i1 %prol.iter76.cmp, label %.prol.loopexit73.loopexit, label %.prol.preheader72, !llvm.loop !3

.prol.loopexit73.loopexit:                        ; preds = %.prol.preheader72
  br label %.prol.loopexit73

.prol.loopexit73:                                 ; preds = %.prol.loopexit73.loopexit, %.lr.ph28.us.us
  %indvars.iv68.unr = phi i64 [ 0, %.lr.ph28.us.us ], [ %indvars.iv.next69.prol, %.prol.loopexit73.loopexit ]
  br i1 %107, label %._crit_edge29.us.us, label %.lr.ph28.us.us.new.preheader

.lr.ph28.us.us.new.preheader:                     ; preds = %.prol.loopexit73
  br label %.lr.ph28.us.us.new

._crit_edge29.us.us.loopexit:                     ; preds = %.lr.ph28.us.us.new
  br label %._crit_edge29.us.us

._crit_edge29.us.us:                              ; preds = %._crit_edge29.us.us.loopexit, %.prol.loopexit73
  %121 = getelementptr inbounds [64 x i16], [64 x i16]* %.033.us.us, i64 %41
  %122 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %41
  %123 = add nuw i32 %.0430.us.us, 1
  %124 = icmp ult i32 %123, %96
  br i1 %124, label %.lr.ph28.us.us, label %._crit_edge36.us.loopexit

.lr.ph28.us.us.new:                               ; preds = %.lr.ph28.us.us.new.preheader, %.lr.ph28.us.us.new
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.7, %.lr.ph28.us.us.new ], [ %indvars.iv68.unr, %.lr.ph28.us.us.new.preheader ]
  %125 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv68, i64 0
  store i16 %119, i16* %125, align 2
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %126 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv.next69, i64 0
  store i16 %119, i16* %126, align 2
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv68, 2
  %127 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv.next69.1, i64 0
  store i16 %119, i16* %127, align 2
  %indvars.iv.next69.2 = add nsw i64 %indvars.iv68, 3
  %128 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv.next69.2, i64 0
  store i16 %119, i16* %128, align 2
  %indvars.iv.next69.3 = add nsw i64 %indvars.iv68, 4
  %129 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv.next69.3, i64 0
  store i16 %119, i16* %129, align 2
  %indvars.iv.next69.4 = add nsw i64 %indvars.iv68, 5
  %130 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv.next69.4, i64 0
  store i16 %119, i16* %130, align 2
  %indvars.iv.next69.5 = add nsw i64 %indvars.iv68, 6
  %131 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv.next69.5, i64 0
  store i16 %119, i16* %131, align 2
  %indvars.iv.next69.6 = add nsw i64 %indvars.iv68, 7
  %132 = getelementptr inbounds [64 x i16], [64 x i16]* %.0131.us.us, i64 %indvars.iv.next69.6, i64 0
  store i16 %119, i16* %132, align 2
  %indvars.iv.next69.7 = add nsw i64 %indvars.iv68, 8
  %exitcond71.7 = icmp eq i64 %indvars.iv.next69.7, %wide.trip.count70.7
  br i1 %exitcond71.7, label %._crit_edge29.us.us.loopexit, label %.lr.ph28.us.us.new

.lr.ph39.split:                                   ; preds = %.lr.ph39.split.preheader, %.lr.ph39.split
  %indvars.iv79 = phi i64 [ %108, %.lr.ph39.split.preheader ], [ %indvars.iv.next80, %.lr.ph39.split ]
  %133 = getelementptr inbounds [64 x i16]*, [64 x i16]** %25, i64 %indvars.iv79
  %134 = bitcast [64 x i16]** %133 to i8**
  %135 = load i8*, i8** %134, align 8
  tail call void @jzero_far(i8* %135, i64 %100) #3
  %indvars.iv.next80 = add i64 %indvars.iv79, 1
  %136 = load i32, i32* %sunkaddr113, align 4
  %137 = sext i32 %136 to i64
  %138 = icmp slt i64 %indvars.iv.next80, %137
  br i1 %138, label %.lr.ph39.split, label %.loopexit22.loopexit

.loopexit22.loopexit:                             ; preds = %.lr.ph39.split
  br label %.loopexit22

.loopexit22.loopexit119:                          ; preds = %._crit_edge36.us
  br label %.loopexit22

.loopexit22:                                      ; preds = %.loopexit22.loopexit119, %.loopexit22.loopexit, %94, %._crit_edge
  %indvars.iv.next82 = add nuw i64 %indvars.iv81, 1
  %139 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.0250, i64 1
  %140 = load i32, i32* %sunkaddr116, align 4
  %141 = sext i32 %140 to i64
  %142 = icmp slt i64 %indvars.iv.next82, %141
  br i1 %142, label %15, label %._crit_edge56.loopexit

._crit_edge56.loopexit:                           ; preds = %.loopexit22
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %._crit_edge56.loopexit, %2
  %143 = tail call i32 @compress_output(%struct.jpeg_compress_struct* nonnull %0, i8*** %1)
  ret i32 %143
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @compress_output(%struct.jpeg_compress_struct*, i8*** nocapture readnone) #0 {
  %3 = alloca [4 x [64 x i16]**], align 16
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %5 = bitcast %struct.jpeg_c_coef_controller** %4 to %struct.my_coef_controller**
  %6 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %8 = load i32, i32* %7, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph47.preheader, label %._crit_edge48

.lr.ph47.preheader:                               ; preds = %2
  %10 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr61 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr62 = add i64 %sunkaddr61, 8
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to %struct.jpeg_memory_mgr**
  %sunkaddr64 = ptrtoint %struct.my_coef_controller* %6 to i64
  %sunkaddr65 = add i64 %sunkaddr64, 16
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i32*
  %sunkaddr67 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr68 = add i64 %sunkaddr67, 316
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i32*
  br label %.lr.ph47

.lr.ph47:                                         ; preds = %.lr.ph47.preheader, %.lr.ph47
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.lr.ph47 ], [ 0, %.lr.ph47.preheader ]
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv57
  %12 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %11, align 8
  %13 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr63, align 8
  %14 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %13, i64 0, i32 8
  %15 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %12, i64 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %6, i64 0, i32 6, i64 %18
  %20 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %19, align 8
  %21 = load i32, i32* %sunkaddr66, align 8
  %22 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %12, i64 0, i32 3
  %23 = load i32, i32* %22, align 4
  %24 = mul i32 %23, %21
  %25 = tail call [64 x i16]** %15(%struct.jpeg_common_struct* %10, %struct.jvirt_barray_control* %20, i32 %24, i32 %23, i32 0) #3
  %26 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %3, i64 0, i64 %indvars.iv57
  store [64 x i16]** %25, [64 x i16]*** %26, align 8
  %indvars.iv.next58 = add nuw i64 %indvars.iv57, 1
  %27 = load i32, i32* %sunkaddr69, align 4
  %28 = sext i32 %27 to i64
  %29 = icmp slt i64 %indvars.iv.next58, %28
  br i1 %29, label %.lr.ph47, label %._crit_edge48.loopexit

._crit_edge48.loopexit:                           ; preds = %.lr.ph47
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %2
  %30 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %6, i64 0, i32 3
  %31 = load i32, i32* %30, align 8
  %32 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %6, i64 0, i32 4
  %33 = load i32, i32* %32, align 4
  %34 = icmp slt i32 %31, %33
  br i1 %34, label %.lr.ph43, label %._crit_edge44

.lr.ph43:                                         ; preds = %._crit_edge48
  %35 = sext i32 %31 to i64
  %36 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %6, i64 0, i32 5, i64 0
  %sunkaddr70 = ptrtoint %struct.my_coef_controller* %6 to i64
  %sunkaddr71 = add i64 %sunkaddr70, 20
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i32*
  %sunkaddr73 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr74 = add i64 %sunkaddr73, 352
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i32*
  %sunkaddr100 = ptrtoint %struct.my_coef_controller* %6 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 20
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to i32*
  %sunkaddr103 = ptrtoint %struct.my_coef_controller* %6 to i64
  %sunkaddr104 = add i64 %sunkaddr103, 28
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to i32*
  %sunkaddr76 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr77 = add i64 %sunkaddr76, 316
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr95 = add i64 %sunkaddr, 488
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to %struct.jpeg_entropy_encoder**
  %sunkaddr97 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr98 = add i64 %sunkaddr97, 352
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  %sunkaddr82 = ptrtoint [4 x [64 x i16]**]* %3 to i64
  %sunkaddr92 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr93 = add i64 %sunkaddr92, 316
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to i32*
  br label %37

; <label>:37:                                     ; preds = %.lr.ph43, %._crit_edge39
  %indvars.iv55 = phi i64 [ %35, %.lr.ph43 ], [ %indvars.iv.next56, %._crit_edge39 ]
  %38 = load i32, i32* %sunkaddr72, align 4
  %39 = load i32, i32* %sunkaddr75, align 8
  %40 = icmp ult i32 %38, %39
  br i1 %40, label %.preheader.preheader, label %._crit_edge39

.preheader.preheader:                             ; preds = %37
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %80
  %.0338 = phi i32 [ %81, %80 ], [ %38, %.preheader.preheader ]
  %41 = load i32, i32* %sunkaddr78, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %.lr.ph36.preheader, label %._crit_edge37

.lr.ph36.preheader:                               ; preds = %.preheader
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.lr.ph36.preheader, %._crit_edge32
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge32 ], [ 0, %.lr.ph36.preheader ]
  %.0435 = phi i32 [ %.1.lcssa, %._crit_edge32 ], [ 0, %.lr.ph36.preheader ]
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv53
  %44 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %44, i64 0, i32 14
  %46 = load i32, i32* %45, align 8
  %47 = icmp sgt i32 %46, 0
  br i1 %47, label %.lr.ph31, label %._crit_edge32

.lr.ph31:                                         ; preds = %.lr.ph36
  %48 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %44, i64 0, i32 13
  %49 = load i32, i32* %48, align 4
  %50 = mul i32 %49, %.0338
  %51 = zext i32 %50 to i64
  %sunkaddr79 = ptrtoint %struct.jpeg_component_info* %44 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 52
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i32*
  %sunkaddr83 = shl i64 %indvars.iv53, 3
  %sunkaddr84 = add i64 %sunkaddr82, %sunkaddr83
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to [64 x i16]***
  %sunkaddr86 = ptrtoint %struct.jpeg_component_info* %44 to i64
  %sunkaddr87 = add i64 %sunkaddr86, 52
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to i32*
  %sunkaddr89 = ptrtoint %struct.jpeg_component_info* %44 to i64
  %sunkaddr90 = add i64 %sunkaddr89, 56
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to i32*
  br label %52

; <label>:52:                                     ; preds = %.lr.ph31, %._crit_edge
  %indvars.iv51 = phi i64 [ 0, %.lr.ph31 ], [ %indvars.iv.next52, %._crit_edge ]
  %.129 = phi i32 [ %.0435, %.lr.ph31 ], [ %.2.lcssa, %._crit_edge ]
  %53 = load i32, i32* %sunkaddr81, align 4
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %52
  %55 = load [64 x i16]**, [64 x i16]*** %sunkaddr85, align 8
  %56 = add nsw i64 %indvars.iv51, %indvars.iv55
  %57 = getelementptr inbounds [64 x i16]*, [64 x i16]** %55, i64 %56
  %58 = load [64 x i16]*, [64 x i16]** %57, align 8
  %59 = getelementptr inbounds [64 x i16], [64 x i16]* %58, i64 %51
  %60 = sext i32 %.129 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %60, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %.0127 = phi [64 x i16]* [ %59, %.lr.ph.preheader ], [ %62, %.lr.ph ]
  %.0725 = phi i32 [ 0, %.lr.ph.preheader ], [ %63, %.lr.ph ]
  %61 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %6, i64 0, i32 5, i64 %indvars.iv
  store [64 x i16]* %.0127, [64 x i16]** %61, align 8
  %indvars.iv.next = add i64 %indvars.iv, 1
  %62 = getelementptr inbounds [64 x i16], [64 x i16]* %.0127, i64 1
  %63 = add nuw nsw i32 %.0725, 1
  %64 = load i32, i32* %sunkaddr88, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %66 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %52
  %.2.lcssa = phi i32 [ %.129, %52 ], [ %66, %._crit_edge.loopexit ]
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %67 = load i32, i32* %sunkaddr91, align 8
  %68 = sext i32 %67 to i64
  %69 = icmp slt i64 %indvars.iv.next52, %68
  br i1 %69, label %52, label %._crit_edge32.loopexit

._crit_edge32.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %.lr.ph36
  %.1.lcssa = phi i32 [ %.0435, %.lr.ph36 ], [ %.2.lcssa, %._crit_edge32.loopexit ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %70 = load i32, i32* %sunkaddr94, align 4
  %71 = sext i32 %70 to i64
  %72 = icmp slt i64 %indvars.iv.next54, %71
  br i1 %72, label %.lr.ph36, label %._crit_edge37.loopexit

._crit_edge37.loopexit:                           ; preds = %._crit_edge32
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %.preheader
  %73 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %sunkaddr96, align 8
  %74 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %73, i64 0, i32 1
  %75 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %74, align 8
  %76 = tail call i32 %75(%struct.jpeg_compress_struct* nonnull %0, [64 x i16]** %36) #3
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %80

; <label>:78:                                     ; preds = %._crit_edge37
  %79 = trunc i64 %indvars.iv55 to i32
  %sunkaddr14 = ptrtoint %struct.my_coef_controller* %6 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 24
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  store i32 %79, i32* %sunkaddr16, align 8
  %sunkaddr17 = ptrtoint %struct.my_coef_controller* %6 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 20
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  store i32 %.0338, i32* %sunkaddr19, align 4
  br label %90

; <label>:80:                                     ; preds = %._crit_edge37
  %81 = add i32 %.0338, 1
  %82 = load i32, i32* %sunkaddr99, align 8
  %83 = icmp ult i32 %81, %82
  br i1 %83, label %.preheader, label %._crit_edge39.loopexit

._crit_edge39.loopexit:                           ; preds = %80
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %37
  store i32 0, i32* %sunkaddr102, align 4
  %indvars.iv.next56 = add i64 %indvars.iv55, 1
  %84 = load i32, i32* %sunkaddr105, align 4
  %85 = sext i32 %84 to i64
  %86 = icmp slt i64 %indvars.iv.next56, %85
  br i1 %86, label %37, label %._crit_edge44.loopexit

._crit_edge44.loopexit:                           ; preds = %._crit_edge39
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %._crit_edge48
  %87 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %6, i64 0, i32 1
  %88 = load i32, i32* %87, align 8
  %89 = add i32 %88, 1
  store i32 %89, i32* %87, align 8
  tail call fastcc void @start_iMCU_row(%struct.jpeg_compress_struct* nonnull %0)
  br label %90

; <label>:90:                                     ; preds = %._crit_edge44, %78
  %.0 = phi i32 [ 0, %78 ], [ 1, %._crit_edge44 ]
  ret i32 %.0
}

declare void @jzero_far(i8*, i64) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
