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
define void @jinit_c_coef_controller(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 192) #3
  %.cast = ptrtoint i8* %8 to i64
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %10 = bitcast %struct.jpeg_c_coef_controller** %9 to i64*
  store i64 %.cast, i64* %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_compress_struct*, i32)**
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef, void (%struct.jpeg_compress_struct*, i32)** %11, align 8
  %12 = icmp eq i32 %1, 0
  br i1 %12, label %51, label %13

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %15 = load i32, i32* %14, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %13
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %18 = bitcast %struct.jpeg_component_info** %17 to i64*
  %19 = load i64, i64* %18, align 8
  %20 = bitcast i8* %8 to %struct.my_coef_controller*
  %21 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr, 8
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to %struct.jpeg_memory_mgr**
  br label %22

; <label>:22:                                     ; preds = %.lr.ph, %22
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %22 ]
  %.sroa.0.027 = phi i64 [ %19, %.lr.ph ], [ %47, %22 ]
  %23 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr22, align 8
  %24 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %23, i64 0, i32 5
  %25 = load %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %24, align 8
  %26 = inttoptr i64 %.sroa.0.027 to %struct.jpeg_component_info*
  %27 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i64 0, i32 7
  %28 = load i32, i32* %27, align 4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i64 0, i32 2
  %31 = load i32, i32* %30, align 8
  %32 = sext i32 %31 to i64
  %33 = tail call i64 @jround_up(i64 %29, i64 %32) #3
  %34 = trunc i64 %33 to i32
  %35 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i64 0, i32 8
  %36 = load i32, i32* %35, align 8
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i64 0, i32 3
  %39 = load i32, i32* %38, align 4
  %40 = sext i32 %39 to i64
  %41 = tail call i64 @jround_up(i64 %37, i64 %40) #3
  %42 = trunc i64 %41 to i32
  %43 = load i32, i32* %38, align 4
  %44 = tail call %struct.jvirt_barray_control* %25(%struct.jpeg_common_struct* nonnull %21, i32 1, i32 0, i32 %34, i32 %42, i32 %43) #3
  %45 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %20, i64 0, i32 6, i64 %indvars.iv
  store %struct.jvirt_barray_control* %44, %struct.jvirt_barray_control** %45, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %26, i64 1
  %47 = ptrtoint %struct.jpeg_component_info* %46 to i64
  %48 = load i32, i32* %14, align 4
  %49 = sext i32 %48 to i64
  %50 = icmp slt i64 %indvars.iv.next, %49
  br i1 %50, label %22, label %.loopexit.loopexit

; <label>:51:                                     ; preds = %2
  %52 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr23 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 8
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to %struct.jpeg_memory_mgr**
  %53 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr25, align 8
  %54 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %53, i64 0, i32 1
  %55 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %54, align 8
  %56 = tail call i8* %55(%struct.jpeg_common_struct* %52, i32 1, i64 1280) #3
  %57 = getelementptr inbounds i8, i8* %8, i64 32
  %58 = bitcast i8* %57 to i8**
  store i8* %56, i8** %58, align 8
  %59 = getelementptr inbounds i8, i8* %56, i64 128
  %60 = getelementptr inbounds i8, i8* %8, i64 40
  %61 = bitcast i8* %60 to i8**
  store i8* %59, i8** %61, align 8
  %62 = getelementptr inbounds i8, i8* %56, i64 256
  %63 = getelementptr inbounds i8, i8* %8, i64 48
  %64 = bitcast i8* %63 to i8**
  store i8* %62, i8** %64, align 8
  %65 = getelementptr inbounds i8, i8* %56, i64 384
  %66 = getelementptr inbounds i8, i8* %8, i64 56
  %67 = bitcast i8* %66 to i8**
  store i8* %65, i8** %67, align 8
  %68 = getelementptr inbounds i8, i8* %56, i64 512
  %69 = getelementptr inbounds i8, i8* %8, i64 64
  %70 = bitcast i8* %69 to i8**
  store i8* %68, i8** %70, align 8
  %71 = getelementptr inbounds i8, i8* %56, i64 640
  %72 = getelementptr inbounds i8, i8* %8, i64 72
  %73 = bitcast i8* %72 to i8**
  store i8* %71, i8** %73, align 8
  %74 = getelementptr inbounds i8, i8* %56, i64 768
  %75 = getelementptr inbounds i8, i8* %8, i64 80
  %76 = bitcast i8* %75 to i8**
  store i8* %74, i8** %76, align 8
  %77 = getelementptr inbounds i8, i8* %56, i64 896
  %78 = getelementptr inbounds i8, i8* %8, i64 88
  %79 = bitcast i8* %78 to i8**
  store i8* %77, i8** %79, align 8
  %80 = getelementptr inbounds i8, i8* %56, i64 1024
  %81 = getelementptr inbounds i8, i8* %8, i64 96
  %82 = bitcast i8* %81 to i8**
  store i8* %80, i8** %82, align 8
  %83 = getelementptr inbounds i8, i8* %56, i64 1152
  %84 = getelementptr inbounds i8, i8* %8, i64 104
  %85 = bitcast i8* %84 to i8**
  store i8* %83, i8** %85, align 8
  %86 = getelementptr inbounds i8, i8* %8, i64 112
  %87 = bitcast i8* %86 to %struct.jvirt_barray_control**
  store %struct.jvirt_barray_control* null, %struct.jvirt_barray_control** %87, align 8
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %22
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %13, %51
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_coef(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %4 = bitcast %struct.jpeg_c_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 1
  store i32 0, i32* %6, align 8
  tail call void @start_iMCU_row(%struct.jpeg_compress_struct* %0)
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

declare i64 @jround_up(i64, i64) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @start_iMCU_row(%struct.jpeg_compress_struct*) #2 {
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
define internal i32 @compress_data(%struct.jpeg_compress_struct*, i8***) #0 {
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
  br i1 %16, label %.lr.ph110, label %._crit_edge111

.lr.ph110:                                        ; preds = %2
  %17 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 2
  %sunkaddr81 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr82 = add i64 %sunkaddr81, 20
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to i32*
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %19 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 1
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 58
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %22 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 0
  br label %23

; <label>:23:                                     ; preds = %.lr.ph110, %._crit_edge106
  %storemerge107 = phi i32 [ %13, %.lr.ph110 ], [ %216, %._crit_edge106 ]
  %24 = load i32, i32* %17, align 4
  %25 = icmp ugt i32 %24, %8
  br i1 %25, label %._crit_edge106, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %23
  %26 = shl nsw i32 %storemerge107, 3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %213
  %storemerge2103 = phi i32 [ %24, %.preheader.lr.ph ], [ %214, %213 ]
  %27 = load i32, i32* %18, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %.lr.ph101, label %._crit_edge102

.lr.ph101:                                        ; preds = %.preheader
  %29 = icmp ult i32 %storemerge2103, %8
  br i1 %29, label %.lr.ph101.split.us.preheader, label %.lr.ph101.split.preheader

.lr.ph101.split.preheader:                        ; preds = %.lr.ph101
  br label %.lr.ph101.split

.lr.ph101.split.us.preheader:                     ; preds = %.lr.ph101
  br label %.lr.ph101.split.us

.lr.ph101.split.us:                               ; preds = %.lr.ph101.split.us.preheader, %._crit_edge.us
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge.us ], [ 0, %.lr.ph101.split.us.preheader ]
  %.099.us = phi i32 [ %.1.lcssa.us, %._crit_edge.us ], [ 0, %.lr.ph101.split.us.preheader ]
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv126
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 0, i32 13
  %33 = load i32, i32* %32, align 4
  %34 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 0, i32 16
  %35 = load i32, i32* %34, align 8
  %36 = mul i32 %35, %storemerge2103
  %37 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 0, i32 14
  %38 = load i32, i32* %37, align 8
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %.lr.ph98.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.loopexit.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph101.split.us
  %.1.lcssa.us = phi i32 [ %.099.us, %.lr.ph101.split.us ], [ %93, %._crit_edge.us.loopexit ]
  %indvars.iv.next127 = add nuw i64 %indvars.iv126, 1
  %40 = load i32, i32* %18, align 4
  %41 = sext i32 %40 to i64
  %42 = icmp slt i64 %indvars.iv.next127, %41
  br i1 %42, label %.lr.ph101.split.us, label %._crit_edge102.loopexit

; <label>:43:                                     ; preds = %.lr.ph98.us, %.loopexit.us
  %storemerge497.us = phi i32 [ 0, %.lr.ph98.us ], [ %95, %.loopexit.us ]
  %.193.us = phi i32 [ %.099.us, %.lr.ph98.us ], [ %93, %.loopexit.us ]
  %.07092.us = phi i32 [ %26, %.lr.ph98.us ], [ %94, %.loopexit.us ]
  %44 = load i32, i32* %19, align 8
  %45 = icmp ult i32 %44, %11
  br i1 %45, label %70, label %46

; <label>:46:                                     ; preds = %43
  %47 = add nsw i32 %storemerge497.us, %storemerge107
  %48 = load i32, i32* %116, align 8
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %70, label %50

; <label>:50:                                     ; preds = %46
  %51 = sext i32 %.193.us to i64
  %52 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %51
  %53 = bitcast [64 x i16]** %52 to i8**
  %54 = load i8*, i8** %53, align 8
  %55 = load i32, i32* %32, align 4
  %56 = sext i32 %55 to i64
  %57 = shl nsw i64 %56, 7
  tail call void @jzero_far(i8* %54, i64 %57) #3
  %58 = load i32, i32* %32, align 4
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %.lr.ph.us, label %.loopexit.us

; <label>:60:                                     ; preds = %.lr.ph.us, %60
  %indvars.iv122 = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next123, %60 ]
  %61 = load i16*, i16** %114, align 8
  %62 = load i16, i16* %61, align 2
  %63 = add nsw i64 %indvars.iv122, %113
  %64 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %63
  %65 = bitcast [64 x i16]** %64 to i16**
  %66 = load i16*, i16** %65, align 8
  store i16 %62, i16* %66, align 2
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %67 = load i32, i32* %32, align 4
  %68 = sext i32 %67 to i64
  %69 = icmp slt i64 %indvars.iv.next123, %68
  br i1 %69, label %60, label %.loopexit.us.loopexit140

; <label>:70:                                     ; preds = %46, %43
  %71 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %20, align 8
  %72 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %71, i64 0, i32 1
  %73 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %72, align 8
  %74 = load i8**, i8*** %115, align 8
  %75 = sext i32 %.193.us to i64
  %76 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %75
  %77 = load [64 x i16]*, [64 x i16]** %76, align 8
  tail call void %73(%struct.jpeg_compress_struct* %0, %struct.jpeg_component_info* nonnull %31, i8** %74, [64 x i16]* %77, i32 %.07092.us, i32 %36, i32 %33) #3
  %78 = load i32, i32* %sunkaddr72.us, align 4
  %79 = icmp sgt i32 %78, %33
  br i1 %79, label %80, label %.loopexit.us

; <label>:80:                                     ; preds = %70
  %81 = add nsw i32 %.193.us, %33
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %82
  %84 = bitcast [64 x i16]** %83 to i8**
  %85 = load i8*, i8** %84, align 8
  %86 = sub nsw i32 %78, %33
  %87 = sext i32 %86 to i64
  %88 = shl nsw i64 %87, 7
  tail call void @jzero_far(i8* %85, i64 %88) #3
  %89 = load i32, i32* %32, align 4
  %90 = icmp slt i32 %33, %89
  br i1 %90, label %.lr.ph91.us.preheader, label %.loopexit.us

.lr.ph91.us.preheader:                            ; preds = %80
  %91 = sext i32 %.193.us to i64
  br label %.lr.ph91.us

.loopexit.us.loopexit:                            ; preds = %.lr.ph91.us
  br label %.loopexit.us

.loopexit.us.loopexit140:                         ; preds = %60
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit140, %.loopexit.us.loopexit, %50, %80, %70
  %92 = load i32, i32* %32, align 4
  %93 = add nsw i32 %92, %.193.us
  %94 = add i32 %.07092.us, 8
  %95 = add nuw nsw i32 %storemerge497.us, 1
  %96 = load i32, i32* %37, align 8
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %43, label %._crit_edge.us.loopexit

.lr.ph91.us:                                      ; preds = %.lr.ph91.us.preheader, %.lr.ph91.us
  %indvars.iv124 = phi i64 [ %117, %.lr.ph91.us.preheader ], [ %indvars.iv.next125, %.lr.ph91.us ]
  %98 = add nsw i64 %indvars.iv124, %91
  %99 = add nsw i64 %98, -1
  %100 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %99
  %101 = bitcast [64 x i16]** %100 to i16**
  %102 = load i16*, i16** %101, align 8
  %103 = load i16, i16* %102, align 2
  %104 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %98
  %105 = bitcast [64 x i16]** %104 to i16**
  %106 = load i16*, i16** %105, align 8
  store i16 %103, i16* %106, align 2
  %indvars.iv.next125 = add i64 %indvars.iv124, 1
  %107 = load i32, i32* %32, align 4
  %108 = sext i32 %107 to i64
  %109 = icmp slt i64 %indvars.iv.next125, %108
  br i1 %109, label %.lr.ph91.us, label %.loopexit.us.loopexit

.lr.ph.us:                                        ; preds = %50
  %110 = add nsw i32 %.193.us, -1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %111
  %113 = sext i32 %.193.us to i64
  %114 = bitcast [64 x i16]** %112 to i16**
  br label %60

.lr.ph98.us:                                      ; preds = %.lr.ph101.split.us
  %115 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv126
  %sunkaddr.us = ptrtoint %struct.jpeg_component_info* %31 to i64
  %sunkaddr71.us = add i64 %sunkaddr.us, 52
  %sunkaddr72.us = inttoptr i64 %sunkaddr71.us to i32*
  %116 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i64 0, i32 18
  %117 = sext i32 %33 to i64
  br label %43

.lr.ph101.split:                                  ; preds = %.lr.ph101.split.preheader, %._crit_edge
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %._crit_edge ], [ 0, %.lr.ph101.split.preheader ]
  %.099 = phi i32 [ %.1.lcssa, %._crit_edge ], [ 0, %.lr.ph101.split.preheader ]
  %118 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv120
  %119 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %118, align 8
  %120 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %119, i64 0, i32 13
  %121 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %119, i64 0, i32 17
  %122 = load i32, i32* %121, align 4
  %123 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %119, i64 0, i32 16
  %124 = load i32, i32* %123, align 8
  %125 = mul i32 %124, %storemerge2103
  %126 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %119, i64 0, i32 14
  %127 = load i32, i32* %126, align 8
  %128 = icmp sgt i32 %127, 0
  br i1 %128, label %.lr.ph98, label %._crit_edge

.lr.ph98:                                         ; preds = %.lr.ph101.split
  %129 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv120
  %sunkaddr = ptrtoint %struct.jpeg_component_info* %119 to i64
  %sunkaddr71 = add i64 %sunkaddr, 52
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i32*
  %130 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %119, i64 0, i32 18
  %131 = sext i32 %122 to i64
  br label %132

; <label>:132:                                    ; preds = %.lr.ph98, %.loopexit
  %storemerge497 = phi i32 [ 0, %.lr.ph98 ], [ %201, %.loopexit ]
  %.193 = phi i32 [ %.099, %.lr.ph98 ], [ %199, %.loopexit ]
  %.07092 = phi i32 [ %26, %.lr.ph98 ], [ %200, %.loopexit ]
  %133 = load i32, i32* %19, align 8
  %134 = icmp ult i32 %133, %11
  br i1 %134, label %139, label %135

; <label>:135:                                    ; preds = %132
  %136 = add nsw i32 %storemerge497, %storemerge107
  %137 = load i32, i32* %130, align 8
  %138 = icmp slt i32 %136, %137
  br i1 %138, label %139, label %173

; <label>:139:                                    ; preds = %135, %132
  %140 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %20, align 8
  %141 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %140, i64 0, i32 1
  %142 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %141, align 8
  %143 = load i8**, i8*** %129, align 8
  %144 = sext i32 %.193 to i64
  %145 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %144
  %146 = load [64 x i16]*, [64 x i16]** %145, align 8
  tail call void %142(%struct.jpeg_compress_struct* %0, %struct.jpeg_component_info* nonnull %119, i8** %143, [64 x i16]* %146, i32 %.07092, i32 %125, i32 %122) #3
  %147 = load i32, i32* %sunkaddr72, align 4
  %148 = icmp sgt i32 %147, %122
  br i1 %148, label %149, label %.loopexit

; <label>:149:                                    ; preds = %139
  %150 = add nsw i32 %.193, %122
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %151
  %153 = bitcast [64 x i16]** %152 to i8**
  %154 = load i8*, i8** %153, align 8
  %155 = sub nsw i32 %147, %122
  %156 = sext i32 %155 to i64
  %157 = shl nsw i64 %156, 7
  tail call void @jzero_far(i8* %154, i64 %157) #3
  %158 = load i32, i32* %120, align 4
  %159 = icmp slt i32 %122, %158
  br i1 %159, label %.lr.ph91.preheader, label %.loopexit

.lr.ph91.preheader:                               ; preds = %149
  %160 = sext i32 %.193 to i64
  br label %.lr.ph91

.lr.ph91:                                         ; preds = %.lr.ph91.preheader, %.lr.ph91
  %indvars.iv118 = phi i64 [ %131, %.lr.ph91.preheader ], [ %indvars.iv.next119, %.lr.ph91 ]
  %161 = add nsw i64 %indvars.iv118, %160
  %162 = add nsw i64 %161, -1
  %163 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %162
  %164 = bitcast [64 x i16]** %163 to i16**
  %165 = load i16*, i16** %164, align 8
  %166 = load i16, i16* %165, align 2
  %167 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %161
  %168 = bitcast [64 x i16]** %167 to i16**
  %169 = load i16*, i16** %168, align 8
  store i16 %166, i16* %169, align 2
  %indvars.iv.next119 = add i64 %indvars.iv118, 1
  %170 = load i32, i32* %120, align 4
  %171 = sext i32 %170 to i64
  %172 = icmp slt i64 %indvars.iv.next119, %171
  br i1 %172, label %.lr.ph91, label %.loopexit.loopexit

; <label>:173:                                    ; preds = %135
  %174 = sext i32 %.193 to i64
  %175 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %174
  %176 = bitcast [64 x i16]** %175 to i8**
  %177 = load i8*, i8** %176, align 8
  %178 = load i32, i32* %120, align 4
  %179 = sext i32 %178 to i64
  %180 = shl nsw i64 %179, 7
  tail call void @jzero_far(i8* %177, i64 %180) #3
  %181 = load i32, i32* %120, align 4
  %182 = icmp sgt i32 %181, 0
  br i1 %182, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %173
  %183 = add nsw i32 %.193, -1
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %184
  %186 = sext i32 %.193 to i64
  %187 = bitcast [64 x i16]** %185 to i16**
  br label %188

; <label>:188:                                    ; preds = %.lr.ph, %188
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %188 ]
  %189 = load i16*, i16** %187, align 8
  %190 = load i16, i16* %189, align 2
  %191 = add nsw i64 %indvars.iv, %186
  %192 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 5, i64 %191
  %193 = bitcast [64 x i16]** %192 to i16**
  %194 = load i16*, i16** %193, align 8
  store i16 %190, i16* %194, align 2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %195 = load i32, i32* %120, align 4
  %196 = sext i32 %195 to i64
  %197 = icmp slt i64 %indvars.iv.next, %196
  br i1 %197, label %188, label %.loopexit.loopexit141

.loopexit.loopexit:                               ; preds = %.lr.ph91
  br label %.loopexit

.loopexit.loopexit141:                            ; preds = %188
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit141, %.loopexit.loopexit, %173, %149, %139
  %198 = load i32, i32* %120, align 4
  %199 = add nsw i32 %198, %.193
  %200 = add i32 %.07092, 8
  %201 = add nuw nsw i32 %storemerge497, 1
  %202 = load i32, i32* %126, align 8
  %203 = icmp slt i32 %201, %202
  br i1 %203, label %132, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph101.split
  %.1.lcssa = phi i32 [ %.099, %.lr.ph101.split ], [ %199, %._crit_edge.loopexit ]
  %indvars.iv.next121 = add nuw i64 %indvars.iv120, 1
  %204 = load i32, i32* %18, align 4
  %205 = sext i32 %204 to i64
  %206 = icmp slt i64 %indvars.iv.next121, %205
  br i1 %206, label %.lr.ph101.split, label %._crit_edge102.loopexit142

._crit_edge102.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge102

._crit_edge102.loopexit142:                       ; preds = %._crit_edge
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102.loopexit142, %._crit_edge102.loopexit, %.preheader
  %207 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %21, align 8
  %208 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %207, i64 0, i32 1
  %209 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %208, align 8
  %210 = tail call i32 %209(%struct.jpeg_compress_struct* nonnull %0, [64 x i16]** %22) #3
  %211 = icmp eq i32 %210, 0
  br i1 %211, label %212, label %213

; <label>:212:                                    ; preds = %._crit_edge102
  %sunkaddr75 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr76 = add i64 %sunkaddr75, 24
  %sunkaddr77 = inttoptr i64 %sunkaddr76 to i32*
  store i32 %storemerge107, i32* %sunkaddr77, align 8
  %sunkaddr78 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr79 = add i64 %sunkaddr78, 20
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to i32*
  store i32 %storemerge2103, i32* %sunkaddr80, align 4
  br label %222

; <label>:213:                                    ; preds = %._crit_edge102
  %214 = add i32 %storemerge2103, 1
  %215 = icmp ugt i32 %214, %8
  br i1 %215, label %._crit_edge106.loopexit, label %.preheader

._crit_edge106.loopexit:                          ; preds = %213
  br label %._crit_edge106

._crit_edge106:                                   ; preds = %._crit_edge106.loopexit, %23
  store i32 0, i32* %sunkaddr83, align 4
  %216 = add nsw i32 %storemerge107, 1
  %217 = load i32, i32* %14, align 4
  %218 = icmp slt i32 %216, %217
  br i1 %218, label %23, label %._crit_edge111.loopexit

._crit_edge111.loopexit:                          ; preds = %._crit_edge106
  br label %._crit_edge111

._crit_edge111:                                   ; preds = %._crit_edge111.loopexit, %2
  %219 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 1
  %220 = load i32, i32* %219, align 8
  %221 = add i32 %220, 1
  store i32 %221, i32* %219, align 8
  tail call void @start_iMCU_row(%struct.jpeg_compress_struct* %0)
  br label %222

; <label>:222:                                    ; preds = %._crit_edge111, %212
  %storemerge1 = phi i32 [ 1, %._crit_edge111 ], [ 0, %212 ]
  ret i32 %storemerge1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @compress_first_pass(%struct.jpeg_compress_struct*, i8***) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %4 = bitcast %struct.jpeg_c_coef_controller** %3 to %struct.my_coef_controller**
  %5 = load %struct.my_coef_controller*, %struct.my_coef_controller** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  %7 = load i32, i32* %6, align 8
  %8 = add i32 %7, -1
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph105, label %._crit_edge106

.lr.ph105:                                        ; preds = %2
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %13 = bitcast %struct.jpeg_component_info** %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %16 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 1
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 58
  %sunkaddr72 = ptrtoint %struct.my_coef_controller* %5 to i64
  %sunkaddr73 = add i64 %sunkaddr72, 16
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i32*
  br label %18

; <label>:18:                                     ; preds = %.lr.ph105, %.loopexit77
  %indvars.iv131 = phi i64 [ 0, %.lr.ph105 ], [ %indvars.iv.next132, %.loopexit77 ]
  %.sroa.015.0103 = phi i64 [ %14, %.lr.ph105 ], [ %152, %.loopexit77 ]
  %19 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %15, align 8
  %20 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %19, i64 0, i32 8
  %21 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %20, align 8
  %22 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %5, i64 0, i32 6, i64 %indvars.iv131
  %23 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %22, align 8
  %24 = load i32, i32* %16, align 8
  %25 = inttoptr i64 %.sroa.015.0103 to %struct.jpeg_component_info*
  %26 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %25, i64 0, i32 3
  %27 = load i32, i32* %26, align 4
  %28 = mul i32 %27, %24
  %29 = tail call [64 x i16]** %21(%struct.jpeg_common_struct* %.cast, %struct.jvirt_barray_control* %23, i32 %28, i32 %27, i32 1) #3
  %30 = load i32, i32* %16, align 8
  %31 = icmp ult i32 %30, %8
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %18
  %sunkaddr = add i64 %.sroa.015.0103, 12
  %sunkaddr69 = inttoptr i64 %sunkaddr to i32*
  %33 = load i32, i32* %sunkaddr69, align 4
  br label %41

; <label>:34:                                     ; preds = %18
  %35 = inttoptr i64 %.sroa.015.0103 to %struct.jpeg_component_info*
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %35, i64 0, i32 8
  %37 = load i32, i32* %36, align 8
  %sunkaddr70 = add i64 %.sroa.015.0103, 12
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to i32*
  %38 = load i32, i32* %sunkaddr71, align 4
  %39 = urem i32 %37, %38
  %40 = icmp eq i32 %39, 0
  %. = select i1 %40, i32 %38, i32 %39
  br label %41

; <label>:41:                                     ; preds = %34, %32
  %.066 = phi i32 [ %33, %32 ], [ %., %34 ]
  %42 = inttoptr i64 %.sroa.015.0103 to %struct.jpeg_component_info*
  %43 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i64 0, i32 7
  %44 = load i32, i32* %43, align 4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %42, i64 0, i32 2
  %47 = load i32, i32* %46, align 8
  %48 = sext i32 %47 to i64
  %49 = sext i32 %47 to i64
  %50 = urem i32 %44, %47
  %51 = icmp sgt i32 %50, 0
  %52 = sub nsw i32 %47, %50
  %.68 = select i1 %51, i32 %52, i32 %50
  %53 = icmp sgt i32 %.066, 0
  br i1 %53, label %.lr.ph80, label %._crit_edge

.lr.ph80:                                         ; preds = %41
  %54 = inttoptr i64 %.sroa.015.0103 to %struct.jpeg_component_info*
  %55 = getelementptr inbounds i8**, i8*** %1, i64 %indvars.iv131
  %56 = icmp sgt i32 %.68, 0
  %57 = sext i32 %.68 to i64
  %58 = shl nsw i64 %57, 7
  br i1 %56, label %.lr.ph80.split.us.split.us.preheader, label %.lr.ph80.split.preheader

.lr.ph80.split.preheader:                         ; preds = %.lr.ph80
  %wide.trip.count = zext i32 %.066 to i64
  br label %.lr.ph80.split

.lr.ph80.split.us.split.us.preheader:             ; preds = %.lr.ph80
  %59 = add i32 %.68, -1
  %xtraiter = and i32 %.68, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %60 = icmp ult i32 %59, 7
  %wide.trip.count116 = zext i32 %.066 to i64
  %wide.trip.count112.7 = zext i32 %.68 to i64
  %61 = add nsw i32 %xtraiter, -1
  %62 = zext i32 %61 to i64
  %63 = add nuw nsw i64 %62, 1
  br label %.lr.ph80.split.us.split.us

.lr.ph80.split.us.split.us:                       ; preds = %..loopexit_crit_edge.us.us, %.lr.ph80.split.us.split.us.preheader
  %indvars.iv114 = phi i64 [ 0, %.lr.ph80.split.us.split.us.preheader ], [ %indvars.iv.next115, %..loopexit_crit_edge.us.us ]
  %64 = getelementptr inbounds [64 x i16]*, [64 x i16]** %29, i64 %indvars.iv114
  %65 = load [64 x i16]*, [64 x i16]** %64, align 8
  %66 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %17, align 8
  %67 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %66, i64 0, i32 1
  %68 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %67, align 8
  %69 = load i8**, i8*** %55, align 8
  %70 = trunc i64 %indvars.iv114 to i32
  %71 = shl nsw i32 %70, 3
  tail call void %68(%struct.jpeg_compress_struct* %0, %struct.jpeg_component_info* %54, i8** %69, [64 x i16]* %65, i32 %71, i32 0, i32 %44) #3
  %72 = getelementptr inbounds [64 x i16], [64 x i16]* %65, i64 %45
  %.cast4.us.us = bitcast [64 x i16]* %72 to i8*
  tail call void @jzero_far(i8* %.cast4.us.us, i64 %58) #3
  %73 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 -1
  %74 = getelementptr inbounds [64 x i16], [64 x i16]* %73, i64 0, i64 0
  %75 = load i16, i16* %74, align 2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph80.split.us.split.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv110.prol = phi i64 [ %indvars.iv.next111.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %76 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv110.prol, i64 0
  store i16 %75, i16* %76, align 2
  %indvars.iv.next111.prol = add nuw nsw i64 %indvars.iv110.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph80.split.us.split.us
  %indvars.iv110.unr = phi i64 [ 0, %.lr.ph80.split.us.split.us ], [ %63, %.prol.loopexit.loopexit ]
  br i1 %60, label %..loopexit_crit_edge.us.us, label %.lr.ph80.split.us.split.us.new.preheader

.lr.ph80.split.us.split.us.new.preheader:         ; preds = %.prol.loopexit
  br label %.lr.ph80.split.us.split.us.new

..loopexit_crit_edge.us.us.loopexit:              ; preds = %.lr.ph80.split.us.split.us.new
  br label %..loopexit_crit_edge.us.us

..loopexit_crit_edge.us.us:                       ; preds = %..loopexit_crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, %wide.trip.count116
  br i1 %exitcond117, label %._crit_edge.loopexit, label %.lr.ph80.split.us.split.us

.lr.ph80.split.us.split.us.new:                   ; preds = %.lr.ph80.split.us.split.us.new.preheader, %.lr.ph80.split.us.split.us.new
  %indvars.iv110 = phi i64 [ %indvars.iv.next111.7, %.lr.ph80.split.us.split.us.new ], [ %indvars.iv110.unr, %.lr.ph80.split.us.split.us.new.preheader ]
  %77 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv110, i64 0
  store i16 %75, i16* %77, align 2
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %78 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv.next111, i64 0
  store i16 %75, i16* %78, align 2
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %79 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv.next111.1, i64 0
  store i16 %75, i16* %79, align 2
  %indvars.iv.next111.2 = add nsw i64 %indvars.iv110, 3
  %80 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv.next111.2, i64 0
  store i16 %75, i16* %80, align 2
  %indvars.iv.next111.3 = add nsw i64 %indvars.iv110, 4
  %81 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv.next111.3, i64 0
  store i16 %75, i16* %81, align 2
  %indvars.iv.next111.4 = add nsw i64 %indvars.iv110, 5
  %82 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv.next111.4, i64 0
  store i16 %75, i16* %82, align 2
  %indvars.iv.next111.5 = add nsw i64 %indvars.iv110, 6
  %83 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv.next111.5, i64 0
  store i16 %75, i16* %83, align 2
  %indvars.iv.next111.6 = add nsw i64 %indvars.iv110, 7
  %84 = getelementptr inbounds [64 x i16], [64 x i16]* %72, i64 %indvars.iv.next111.6, i64 0
  store i16 %75, i16* %84, align 2
  %indvars.iv.next111.7 = add nsw i64 %indvars.iv110, 8
  %exitcond113.7 = icmp eq i64 %indvars.iv.next111.7, %wide.trip.count112.7
  br i1 %exitcond113.7, label %..loopexit_crit_edge.us.us.loopexit, label %.lr.ph80.split.us.split.us.new

.lr.ph80.split:                                   ; preds = %.lr.ph80.split.preheader, %.lr.ph80.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph80.split ], [ 0, %.lr.ph80.split.preheader ]
  %85 = getelementptr inbounds [64 x i16]*, [64 x i16]** %29, i64 %indvars.iv
  %86 = load [64 x i16]*, [64 x i16]** %85, align 8
  %87 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %17, align 8
  %88 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %87, i64 0, i32 1
  %89 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %88, align 8
  %90 = load i8**, i8*** %55, align 8
  %91 = trunc i64 %indvars.iv to i32
  %92 = shl nsw i32 %91, 3
  tail call void %89(%struct.jpeg_compress_struct* nonnull %0, %struct.jpeg_component_info* %54, i8** %90, [64 x i16]* %86, i32 %92, i32 0, i32 %44) #3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit138, label %.lr.ph80.split

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us.us
  br label %._crit_edge

._crit_edge.loopexit138:                          ; preds = %.lr.ph80.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit138, %._crit_edge.loopexit, %41
  %93 = load i32, i32* %sunkaddr74, align 8
  %94 = icmp eq i32 %93, %8
  br i1 %94, label %95, label %.loopexit77

; <label>:95:                                     ; preds = %._crit_edge
  %96 = add i32 %.68, %44
  %97 = udiv i32 %96, %47
  %sunkaddr75 = add i64 %.sroa.015.0103, 12
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to i32*
  %98 = load i32, i32* %sunkaddr76, align 4
  %99 = icmp slt i32 %.066, %98
  br i1 %99, label %.lr.ph93, label %.loopexit77

.lr.ph93:                                         ; preds = %95
  %100 = zext i32 %96 to i64
  %101 = shl nuw nsw i64 %100, 7
  %102 = icmp ugt i32 %47, %96
  %103 = add nsw i64 %49, -1
  %104 = icmp sgt i32 %47, 0
  br i1 %102, label %.lr.ph93.split.preheader, label %.lr.ph93.split.us.preheader

.lr.ph93.split.us.preheader:                      ; preds = %.lr.ph93
  %105 = add i32 %47, -1
  %106 = sext i32 %.066 to i64
  %xtraiter124 = and i32 %47, 7
  %lcmp.mod125 = icmp eq i32 %xtraiter124, 0
  %107 = icmp ult i32 %105, 7
  %wide.trip.count120.7 = zext i32 %47 to i64
  %108 = add nsw i32 %xtraiter124, -1
  %109 = zext i32 %108 to i64
  %110 = add nuw nsw i64 %109, 1
  br label %.lr.ph93.split.us

.lr.ph93.split.preheader:                         ; preds = %.lr.ph93
  %111 = sext i32 %.066 to i64
  br label %.lr.ph93.split

.lr.ph93.split.us:                                ; preds = %.lr.ph93.split.us.preheader, %._crit_edge90.us
  %indvars.iv127 = phi i64 [ %106, %.lr.ph93.split.us.preheader ], [ %indvars.iv.next128, %._crit_edge90.us ]
  %112 = getelementptr inbounds [64 x i16]*, [64 x i16]** %29, i64 %indvars.iv127
  %113 = bitcast [64 x i16]** %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = add nsw i64 %indvars.iv127, -1
  %116 = getelementptr inbounds [64 x i16]*, [64 x i16]** %29, i64 %115
  %117 = bitcast [64 x i16]** %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = inttoptr i64 %114 to i8*
  tail call void @jzero_far(i8* %119, i64 %101) #3
  br i1 %104, label %.lr.ph83.us.us.preheader, label %._crit_edge90.us

.lr.ph83.us.us.preheader:                         ; preds = %.lr.ph93.split.us
  br label %.lr.ph83.us.us

._crit_edge90.us.loopexit:                        ; preds = %._crit_edge84.us.us
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge90.us.loopexit, %.lr.ph93.split.us
  %indvars.iv.next128 = add i64 %indvars.iv127, 1
  %120 = load i32, i32* %sunkaddr76, align 4
  %121 = sext i32 %120 to i64
  %122 = icmp slt i64 %indvars.iv.next128, %121
  br i1 %122, label %.lr.ph93.split.us, label %.loopexit77.loopexit137

.lr.ph83.us.us:                                   ; preds = %.lr.ph83.us.us.preheader, %._crit_edge84.us.us
  %storemerge287.us.us = phi i32 [ %134, %._crit_edge84.us.us ], [ 0, %.lr.ph83.us.us.preheader ]
  %.sroa.0.086.us.us = phi i64 [ %133, %._crit_edge84.us.us ], [ %118, %.lr.ph83.us.us.preheader ]
  %.sroa.07.085.us.us = phi i64 [ %131, %._crit_edge84.us.us ], [ %114, %.lr.ph83.us.us.preheader ]
  %123 = inttoptr i64 %.sroa.0.086.us.us to [64 x i16]*
  %124 = getelementptr inbounds [64 x i16], [64 x i16]* %123, i64 %103, i64 0
  %125 = load i16, i16* %124, align 2
  %126 = inttoptr i64 %.sroa.07.085.us.us to [64 x i16]*
  br i1 %lcmp.mod125, label %.prol.loopexit123, label %.prol.preheader122.preheader

.prol.preheader122.preheader:                     ; preds = %.lr.ph83.us.us
  br label %.prol.preheader122

.prol.preheader122:                               ; preds = %.prol.preheader122.preheader, %.prol.preheader122
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.prol.preheader122 ], [ 0, %.prol.preheader122.preheader ]
  %prol.iter126 = phi i32 [ %prol.iter126.sub, %.prol.preheader122 ], [ %xtraiter124, %.prol.preheader122.preheader ]
  %127 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv118.prol, i64 0
  store i16 %125, i16* %127, align 2
  %indvars.iv.next119.prol = add nuw nsw i64 %indvars.iv118.prol, 1
  %prol.iter126.sub = add nsw i32 %prol.iter126, -1
  %prol.iter126.cmp = icmp eq i32 %prol.iter126.sub, 0
  br i1 %prol.iter126.cmp, label %.prol.loopexit123.loopexit, label %.prol.preheader122, !llvm.loop !3

.prol.loopexit123.loopexit:                       ; preds = %.prol.preheader122
  br label %.prol.loopexit123

.prol.loopexit123:                                ; preds = %.prol.loopexit123.loopexit, %.lr.ph83.us.us
  %indvars.iv118.unr = phi i64 [ 0, %.lr.ph83.us.us ], [ %110, %.prol.loopexit123.loopexit ]
  br i1 %107, label %._crit_edge84.us.us, label %.lr.ph83.us.us.new.preheader

.lr.ph83.us.us.new.preheader:                     ; preds = %.prol.loopexit123
  br label %.lr.ph83.us.us.new

._crit_edge84.us.us.loopexit:                     ; preds = %.lr.ph83.us.us.new
  br label %._crit_edge84.us.us

._crit_edge84.us.us:                              ; preds = %._crit_edge84.us.us.loopexit, %.prol.loopexit123
  %128 = inttoptr i64 %.sroa.07.085.us.us to [64 x i16]*
  %129 = inttoptr i64 %.sroa.0.086.us.us to [64 x i16]*
  %130 = getelementptr inbounds [64 x i16], [64 x i16]* %128, i64 %48
  %131 = ptrtoint [64 x i16]* %130 to i64
  %132 = getelementptr inbounds [64 x i16], [64 x i16]* %129, i64 %48
  %133 = ptrtoint [64 x i16]* %132 to i64
  %134 = add nuw i32 %storemerge287.us.us, 1
  %135 = icmp ult i32 %134, %97
  br i1 %135, label %.lr.ph83.us.us, label %._crit_edge90.us.loopexit

.lr.ph83.us.us.new:                               ; preds = %.lr.ph83.us.us.new.preheader, %.lr.ph83.us.us.new
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.7, %.lr.ph83.us.us.new ], [ %indvars.iv118.unr, %.lr.ph83.us.us.new.preheader ]
  %136 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv118, i64 0
  store i16 %125, i16* %136, align 2
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %137 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv.next119, i64 0
  store i16 %125, i16* %137, align 2
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  %138 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv.next119.1, i64 0
  store i16 %125, i16* %138, align 2
  %indvars.iv.next119.2 = add nsw i64 %indvars.iv118, 3
  %139 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv.next119.2, i64 0
  store i16 %125, i16* %139, align 2
  %indvars.iv.next119.3 = add nsw i64 %indvars.iv118, 4
  %140 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv.next119.3, i64 0
  store i16 %125, i16* %140, align 2
  %indvars.iv.next119.4 = add nsw i64 %indvars.iv118, 5
  %141 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv.next119.4, i64 0
  store i16 %125, i16* %141, align 2
  %indvars.iv.next119.5 = add nsw i64 %indvars.iv118, 6
  %142 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv.next119.5, i64 0
  store i16 %125, i16* %142, align 2
  %indvars.iv.next119.6 = add nsw i64 %indvars.iv118, 7
  %143 = getelementptr inbounds [64 x i16], [64 x i16]* %126, i64 %indvars.iv.next119.6, i64 0
  store i16 %125, i16* %143, align 2
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  %exitcond121.7 = icmp eq i64 %indvars.iv.next119.7, %wide.trip.count120.7
  br i1 %exitcond121.7, label %._crit_edge84.us.us.loopexit, label %.lr.ph83.us.us.new

.lr.ph93.split:                                   ; preds = %.lr.ph93.split.preheader, %.lr.ph93.split
  %indvars.iv129 = phi i64 [ %111, %.lr.ph93.split.preheader ], [ %indvars.iv.next130, %.lr.ph93.split ]
  %144 = getelementptr inbounds [64 x i16]*, [64 x i16]** %29, i64 %indvars.iv129
  %145 = bitcast [64 x i16]** %144 to i8**
  %146 = load i8*, i8** %145, align 8
  tail call void @jzero_far(i8* %146, i64 %101) #3
  %indvars.iv.next130 = add i64 %indvars.iv129, 1
  %147 = load i32, i32* %sunkaddr76, align 4
  %148 = sext i32 %147 to i64
  %149 = icmp slt i64 %indvars.iv.next130, %148
  br i1 %149, label %.lr.ph93.split, label %.loopexit77.loopexit

.loopexit77.loopexit:                             ; preds = %.lr.ph93.split
  br label %.loopexit77

.loopexit77.loopexit137:                          ; preds = %._crit_edge90.us
  br label %.loopexit77

.loopexit77:                                      ; preds = %.loopexit77.loopexit137, %.loopexit77.loopexit, %95, %._crit_edge
  %150 = inttoptr i64 %.sroa.015.0103 to %struct.jpeg_component_info*
  %indvars.iv.next132 = add nuw i64 %indvars.iv131, 1
  %151 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %150, i64 1
  %152 = ptrtoint %struct.jpeg_component_info* %151 to i64
  %153 = load i32, i32* %9, align 4
  %154 = sext i32 %153 to i64
  %155 = icmp slt i64 %indvars.iv.next132, %154
  br i1 %155, label %18, label %._crit_edge106.loopexit

._crit_edge106.loopexit:                          ; preds = %.loopexit77
  br label %._crit_edge106

._crit_edge106:                                   ; preds = %._crit_edge106.loopexit, %2
  %156 = tail call i32 @compress_output(%struct.jpeg_compress_struct* nonnull %0, i8*** %1)
  ret i32 %156
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @compress_output(%struct.jpeg_compress_struct*, i8*** nocapture readnone) #0 {
  %3 = alloca [4 x [64 x i16]**], align 16
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %5 = bitcast %struct.jpeg_c_coef_controller** %4 to i64*
  %6 = load i64, i64* %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %8 = load i32, i32* %7, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph78, label %._crit_edge79

.lr.ph78:                                         ; preds = %2
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %.cast7 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %11 = inttoptr i64 %6 to %struct.my_coef_controller*
  %12 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %11, i64 0, i32 1
  br label %13

; <label>:13:                                     ; preds = %.lr.ph78, %13
  %indvars.iv88 = phi i64 [ 0, %.lr.ph78 ], [ %indvars.iv.next89, %13 ]
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv88
  %15 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %14, align 8
  %16 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %10, align 8
  %17 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %16, i64 0, i32 8
  %18 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %15, i64 0, i32 1
  %20 = load i32, i32* %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %11, i64 0, i32 6, i64 %21
  %23 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %22, align 8
  %24 = load i32, i32* %12, align 8
  %25 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %15, i64 0, i32 3
  %26 = load i32, i32* %25, align 4
  %27 = mul i32 %26, %24
  %28 = tail call [64 x i16]** %18(%struct.jpeg_common_struct* %.cast7, %struct.jvirt_barray_control* %23, i32 %27, i32 %26, i32 0) #3
  %29 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %3, i64 0, i64 %indvars.iv88
  store [64 x i16]** %28, [64 x i16]*** %29, align 8
  %indvars.iv.next89 = add nuw i64 %indvars.iv88, 1
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %32 = icmp slt i64 %indvars.iv.next89, %31
  br i1 %32, label %13, label %._crit_edge79.loopexit

._crit_edge79.loopexit:                           ; preds = %13
  br label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge79.loopexit, %2
  %33 = inttoptr i64 %6 to %struct.my_coef_controller*
  %34 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %33, i64 0, i32 3
  %35 = load i32, i32* %34, align 8
  %36 = inttoptr i64 %6 to %struct.my_coef_controller*
  %37 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %36, i64 0, i32 4
  %38 = load i32, i32* %37, align 4
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %.lr.ph74, label %._crit_edge75

.lr.ph74:                                         ; preds = %._crit_edge79
  %40 = inttoptr i64 %6 to %struct.my_coef_controller*
  %41 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %40, i64 0, i32 2
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  %sunkaddr52 = add i64 %6, 20
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to i32*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr43 = add i64 %sunkaddr, 316
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to i32*
  %43 = inttoptr i64 %6 to %struct.my_coef_controller*
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %45 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %43, i64 0, i32 5, i64 0
  %46 = inttoptr i64 %6 to %struct.my_coef_controller*
  %47 = sext i32 %35 to i64
  br label %48

; <label>:48:                                     ; preds = %.lr.ph74, %._crit_edge70
  %indvars.iv86 = phi i64 [ %47, %.lr.ph74 ], [ %indvars.iv.next87, %._crit_edge70 ]
  %49 = load i32, i32* %41, align 4
  %50 = load i32, i32* %42, align 8
  %51 = icmp ult i32 %49, %50
  br i1 %51, label %.preheader.preheader, label %._crit_edge70

.preheader.preheader:                             ; preds = %48
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %92
  %storemerge369 = phi i32 [ %93, %92 ], [ %49, %.preheader.preheader ]
  %52 = load i32, i32* %sunkaddr44, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %.lr.ph67.preheader, label %._crit_edge68

.lr.ph67.preheader:                               ; preds = %.preheader
  br label %.lr.ph67

.lr.ph67:                                         ; preds = %.lr.ph67.preheader, %._crit_edge63
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge63 ], [ 0, %.lr.ph67.preheader ]
  %.04265 = phi i32 [ %.1.lcssa, %._crit_edge63 ], [ 0, %.lr.ph67.preheader ]
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv84
  %55 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %55, i64 0, i32 14
  %57 = load i32, i32* %56, align 8
  %58 = icmp sgt i32 %57, 0
  br i1 %58, label %.lr.ph62, label %._crit_edge63

.lr.ph62:                                         ; preds = %.lr.ph67
  %59 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %55, i64 0, i32 13
  %60 = load i32, i32* %59, align 4
  %61 = mul i32 %60, %storemerge369
  %62 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %3, i64 0, i64 %indvars.iv84
  %63 = zext i32 %61 to i64
  %sunkaddr45 = ptrtoint %struct.jpeg_component_info* %55 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 52
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to i32*
  br label %64

; <label>:64:                                     ; preds = %.lr.ph62, %._crit_edge
  %indvars.iv82 = phi i64 [ 0, %.lr.ph62 ], [ %indvars.iv.next83, %._crit_edge ]
  %.159 = phi i32 [ %.04265, %.lr.ph62 ], [ %.2.lcssa, %._crit_edge ]
  %65 = load i32, i32* %sunkaddr47, align 4
  %66 = icmp sgt i32 %65, 0
  br i1 %66, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %64
  %67 = load [64 x i16]**, [64 x i16]*** %62, align 8
  %68 = add nsw i64 %indvars.iv82, %indvars.iv86
  %69 = getelementptr inbounds [64 x i16]*, [64 x i16]** %67, i64 %68
  %70 = load [64 x i16]*, [64 x i16]** %69, align 8
  %71 = getelementptr inbounds [64 x i16], [64 x i16]* %70, i64 %63
  %72 = sext i32 %.159 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %72, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %storemerge658 = phi i32 [ 0, %.lr.ph.preheader ], [ %75, %.lr.ph ]
  %.057 = phi [64 x i16]* [ %71, %.lr.ph.preheader ], [ %73, %.lr.ph ]
  %73 = getelementptr inbounds [64 x i16], [64 x i16]* %.057, i64 1
  %indvars.iv.next = add i64 %indvars.iv, 1
  %74 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %46, i64 0, i32 5, i64 %indvars.iv
  store [64 x i16]* %.057, [64 x i16]** %74, align 8
  %75 = add nuw nsw i32 %storemerge658, 1
  %76 = load i32, i32* %sunkaddr47, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %78 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %64
  %.2.lcssa = phi i32 [ %.159, %64 ], [ %78, %._crit_edge.loopexit ]
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %79 = load i32, i32* %56, align 8
  %80 = sext i32 %79 to i64
  %81 = icmp slt i64 %indvars.iv.next83, %80
  br i1 %81, label %64, label %._crit_edge63.loopexit

._crit_edge63.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63.loopexit, %.lr.ph67
  %.1.lcssa = phi i32 [ %.04265, %.lr.ph67 ], [ %.2.lcssa, %._crit_edge63.loopexit ]
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %82 = load i32, i32* %sunkaddr44, align 4
  %83 = sext i32 %82 to i64
  %84 = icmp slt i64 %indvars.iv.next85, %83
  br i1 %84, label %.lr.ph67, label %._crit_edge68.loopexit

._crit_edge68.loopexit:                           ; preds = %._crit_edge63
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68.loopexit, %.preheader
  %85 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %44, align 8
  %86 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %85, i64 0, i32 1
  %87 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %86, align 8
  %88 = tail call i32 %87(%struct.jpeg_compress_struct* nonnull %0, [64 x i16]** %45) #3
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %._crit_edge68
  %91 = trunc i64 %indvars.iv86 to i32
  %sunkaddr48 = add i64 %6, 24
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to i32*
  store i32 %91, i32* %sunkaddr49, align 8
  %sunkaddr50 = add i64 %6, 20
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i32*
  store i32 %storemerge369, i32* %sunkaddr51, align 4
  br label %103

; <label>:92:                                     ; preds = %._crit_edge68
  %93 = add i32 %storemerge369, 1
  %94 = load i32, i32* %42, align 8
  %95 = icmp ult i32 %93, %94
  br i1 %95, label %.preheader, label %._crit_edge70.loopexit

._crit_edge70.loopexit:                           ; preds = %92
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit, %48
  store i32 0, i32* %sunkaddr53, align 4
  %indvars.iv.next87 = add i64 %indvars.iv86, 1
  %96 = load i32, i32* %37, align 4
  %97 = sext i32 %96 to i64
  %98 = icmp slt i64 %indvars.iv.next87, %97
  br i1 %98, label %48, label %._crit_edge75.loopexit

._crit_edge75.loopexit:                           ; preds = %._crit_edge70
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75.loopexit, %._crit_edge79
  %99 = inttoptr i64 %6 to %struct.my_coef_controller*
  %100 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %99, i64 0, i32 1
  %101 = load i32, i32* %100, align 8
  %102 = add i32 %101, 1
  store i32 %102, i32* %100, align 8
  tail call void @start_iMCU_row(%struct.jpeg_compress_struct* nonnull %0)
  br label %103

; <label>:103:                                    ; preds = %._crit_edge75, %90
  %storemerge2 = phi i32 [ 1, %._crit_edge75 ], [ 0, %90 ]
  ret i32 %storemerge2
}

declare void @jzero_far(i8*, i64) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
