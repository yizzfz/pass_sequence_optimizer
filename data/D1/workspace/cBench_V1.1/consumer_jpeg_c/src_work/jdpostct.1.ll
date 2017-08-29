; ModuleID = 'jdpostct.ll'
source_filename = "jdpostct.c"
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
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { {}*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }
%struct.my_post_controller = type { %struct.jpeg_d_post_controller, %struct.jvirt_sarray_control*, i8**, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define void @jinit_d_post_controller(%struct.jpeg_decompress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 48) #3
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %10 = bitcast %struct.jpeg_d_post_controller** %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_decompress_struct*, i32)**
  store void (%struct.jpeg_decompress_struct*, i32)* @start_pass_dpost, void (%struct.jpeg_decompress_struct*, i32)** %11, align 8
  %12 = getelementptr inbounds i8, i8* %8, i64 16
  %13 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 16, i32 8, i1 false)
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %50, label %16

; <label>:16:                                     ; preds = %2
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 58
  %18 = load i32, i32* %17, align 8
  %19 = getelementptr inbounds i8, i8* %8, i64 32
  %20 = bitcast i8* %19 to i32*
  store i32 %18, i32* %20, align 8
  %21 = icmp eq i32 %1, 0
  %sunkaddr = ptrtoint %struct.jpeg_decompress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 8
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to %struct.jpeg_memory_mgr**
  %22 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr2, align 8
  br i1 %21, label %40, label %23

; <label>:23:                                     ; preds = %16
  %24 = zext i32 %18 to i64
  %25 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %26 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %22, i64 0, i32 4
  %27 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %29 = load i32, i32* %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %31 = load i32, i32* %30, align 8
  %32 = mul i32 %31, %29
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %34 = load i32, i32* %33, align 4
  %35 = zext i32 %34 to i64
  %36 = tail call i64 @jround_up(i64 %35, i64 %24) #3
  %37 = trunc i64 %36 to i32
  %sunkaddr3 = ptrtoint i8* %8 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 32
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %38 = load i32, i32* %sunkaddr5, align 8
  %39 = tail call %struct.jvirt_sarray_control* %27(%struct.jpeg_common_struct* nonnull %25, i32 1, i32 0, i32 %32, i32 %37, i32 %38) #3
  %sunkaddr6 = ptrtoint i8* %8 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 16
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct.jvirt_sarray_control**
  store %struct.jvirt_sarray_control* %39, %struct.jvirt_sarray_control** %sunkaddr8, align 8
  br label %50

; <label>:40:                                     ; preds = %16
  %41 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %42 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %22, i64 0, i32 2
  %43 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 26
  %45 = load i32, i32* %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 28
  %47 = load i32, i32* %46, align 8
  %48 = mul i32 %47, %45
  %49 = tail call i8** %43(%struct.jpeg_common_struct* nonnull %41, i32 1, i32 %48, i32 %18) #3
  %sunkaddr9 = ptrtoint i8* %8 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 24
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i8***
  store i8** %49, i8*** %sunkaddr11, align 8
  br label %50

; <label>:50:                                     ; preds = %2, %23, %40
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_pass_dpost(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %4 = bitcast %struct.jpeg_d_post_controller** %3 to %struct.my_post_controller**
  %5 = load %struct.my_post_controller*, %struct.my_post_controller** %4, align 8
  switch i32 %1, label %62 [
    i32 0, label %6
    i32 3, label %34
    i32 2, label %48
  ]

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 19
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %26, label %10

; <label>:10:                                     ; preds = %6
  %11 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_1pass, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %11, align 8
  %12 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 2
  %13 = load i8**, i8*** %12, align 8
  %14 = icmp eq i8** %13, null
  br i1 %14, label %15, label %70

; <label>:15:                                     ; preds = %10
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %17 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %17, i64 0, i32 7
  %19 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %18, align 8
  %20 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %21 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 1
  %22 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %21, align 8
  %23 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 3
  %24 = load i32, i32* %23, align 8
  %25 = tail call i8** %19(%struct.jpeg_common_struct* %20, %struct.jvirt_sarray_control* %22, i32 0, i32 %24, i32 1) #3
  %sunkaddr = ptrtoint %struct.my_post_controller* %5 to i64
  %sunkaddr1 = add i64 %sunkaddr, 24
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i8***
  store i8** %25, i8*** %sunkaddr2, align 8
  br label %70

; <label>:26:                                     ; preds = %6
  %27 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %28 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %28, i64 0, i32 1
  %30 = bitcast void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 0, i32 1
  %33 = bitcast void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %32 to i64*
  store i64 %31, i64* %33, align 8
  br label %70

; <label>:34:                                     ; preds = %2
  %35 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 1
  %36 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %35, align 8
  %37 = icmp eq %struct.jvirt_sarray_control* %36, null
  br i1 %37, label %38, label %46

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 5
  store i32 4, i32* %41, align 8
  %42 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %43 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %42, align 8
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  %45 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %44(%struct.jpeg_common_struct* %45) #3
  br label %46

; <label>:46:                                     ; preds = %34, %38
  %47 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_prepass, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %47, align 8
  br label %70

; <label>:48:                                     ; preds = %2
  %49 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 1
  %50 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %49, align 8
  %51 = icmp eq %struct.jvirt_sarray_control* %50, null
  br i1 %51, label %52, label %60

; <label>:52:                                     ; preds = %48
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %54 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %54, i64 0, i32 5
  store i32 4, i32* %55, align 8
  %56 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %57 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %56, align 8
  %58 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %57, align 8
  %59 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %58(%struct.jpeg_common_struct* %59) #3
  br label %60

; <label>:60:                                     ; preds = %48, %52
  %61 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* @post_process_2pass, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %61, align 8
  br label %70

; <label>:62:                                     ; preds = %2
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 0
  %64 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %64, i64 0, i32 5
  store i32 4, i32* %65, align 8
  %66 = bitcast %struct.jpeg_decompress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %67 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %66, align 8
  %68 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %67, align 8
  %69 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %68(%struct.jpeg_common_struct* %69) #3
  br label %70

; <label>:70:                                     ; preds = %10, %26, %15, %62, %60, %46
  %71 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 5
  store i32 0, i32* %71, align 8
  %72 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %5, i64 0, i32 4
  store i32 0, i32* %72, align 4
  ret void
}

declare i64 @jround_up(i64, i64) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal void @post_process_1pass(%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32* nocapture, i32) #0 {
  %8 = alloca i32, align 4
  %9 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %10 = bitcast %struct.jpeg_d_post_controller** %9 to %struct.my_post_controller**
  %11 = load %struct.my_post_controller*, %struct.my_post_controller** %10, align 8
  %12 = load i32, i32* %5, align 4
  %13 = sub i32 %6, %12
  %14 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %11, i64 0, i32 3
  %15 = load i32, i32* %14, align 8
  %16 = icmp ugt i32 %13, %15
  %. = select i1 %16, i32 %15, i32 %13
  store i32 0, i32* %8, align 4
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %18 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %18, i64 0, i32 1
  %20 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %19, align 8
  %21 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %11, i64 0, i32 2
  %22 = load i8**, i8*** %21, align 8
  call void %20(%struct.jpeg_decompress_struct* nonnull %0, i8*** %1, i32* %2, i32 %3, i8** %22, i32* nonnull %8, i32 %.) #3
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %24 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %24, i64 0, i32 1
  %26 = load void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %25, align 8
  %27 = load i8**, i8*** %21, align 8
  %28 = load i32, i32* %5, align 4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8*, i8** %4, i64 %29
  %31 = load i32, i32* %8, align 4
  call void %26(%struct.jpeg_decompress_struct* nonnull %0, i8** %27, i8** %30, i32 %31) #3
  %32 = load i32, i32* %8, align 4
  %33 = load i32, i32* %5, align 4
  %34 = add i32 %33, %32
  store i32 %34, i32* %5, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @post_process_prepass(%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8** nocapture readnone, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %9 = bitcast %struct.jpeg_d_post_controller** %8 to %struct.my_post_controller**
  %10 = load %struct.my_post_controller*, %struct.my_post_controller** %9, align 8
  %11 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 5
  %12 = load i32, i32* %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %7
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %16 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %16, i64 0, i32 7
  %18 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %17, align 8
  %19 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %20 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 1
  %21 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %20, align 8
  %22 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 4
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 3
  %25 = load i32, i32* %24, align 8
  %26 = tail call i8** %18(%struct.jpeg_common_struct* %19, %struct.jvirt_sarray_control* %21, i32 %23, i32 %25, i32 1) #3
  %27 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 2
  store i8** %26, i8*** %27, align 8
  br label %28

; <label>:28:                                     ; preds = %7, %14
  %sunkaddr = ptrtoint %struct.my_post_controller* %10 to i64
  %sunkaddr1 = add i64 %sunkaddr, 40
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %29 = load i32, i32* %sunkaddr2, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 81
  %31 = load %struct.jpeg_upsampler*, %struct.jpeg_upsampler** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_upsampler, %struct.jpeg_upsampler* %31, i64 0, i32 1
  %33 = load void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)** %32, align 8
  %34 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 2
  %35 = load i8**, i8*** %34, align 8
  %36 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 3
  %37 = load i32, i32* %36, align 8
  tail call void %33(%struct.jpeg_decompress_struct* nonnull %0, i8*** %1, i32* %2, i32 %3, i8** %35, i32* %11, i32 %37) #3
  %38 = load i32, i32* %sunkaddr2, align 8
  %39 = icmp ugt i32 %38, %29
  br i1 %39, label %40, label %51

; <label>:40:                                     ; preds = %28
  %41 = zext i32 %29 to i64
  %42 = sub i32 %38, %29
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %44 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %44, i64 0, i32 1
  %46 = load void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %45, align 8
  %sunkaddr3 = ptrtoint %struct.my_post_controller* %10 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 24
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i8***
  %47 = load i8**, i8*** %sunkaddr5, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 %41
  tail call void %46(%struct.jpeg_decompress_struct* nonnull %0, i8** %48, i8** null, i32 %42) #3
  %49 = load i32, i32* %5, align 4
  %50 = add i32 %49, %42
  store i32 %50, i32* %5, align 4
  br label %51

; <label>:51:                                     ; preds = %28, %40
  %sunkaddr12 = ptrtoint %struct.my_post_controller* %10 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 40
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %52 = load i32, i32* %sunkaddr14, align 8
  %sunkaddr6 = ptrtoint %struct.my_post_controller* %10 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 32
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %53 = load i32, i32* %sunkaddr8, align 8
  %54 = icmp ult i32 %52, %53
  br i1 %54, label %59, label %55

; <label>:55:                                     ; preds = %51
  %56 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 4
  %57 = load i32, i32* %56, align 4
  %58 = add i32 %57, %53
  store i32 %58, i32* %56, align 4
  %sunkaddr9 = ptrtoint %struct.my_post_controller* %10 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 40
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  store i32 0, i32* %sunkaddr11, align 8
  br label %59

; <label>:59:                                     ; preds = %51, %55
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @post_process_2pass(%struct.jpeg_decompress_struct*, i8*** nocapture readnone, i32* nocapture readnone, i32, i8**, i32* nocapture, i32) #0 {
  %8 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 76
  %9 = bitcast %struct.jpeg_d_post_controller** %8 to %struct.my_post_controller**
  %10 = load %struct.my_post_controller*, %struct.my_post_controller** %9, align 8
  %11 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 5
  %12 = load i32, i32* %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %7
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 1
  %16 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %16, i64 0, i32 7
  %18 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %17, align 8
  %19 = bitcast %struct.jpeg_decompress_struct* %0 to %struct.jpeg_common_struct*
  %20 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 1
  %21 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %20, align 8
  %22 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 4
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 3
  %25 = load i32, i32* %24, align 8
  %26 = tail call i8** %18(%struct.jpeg_common_struct* %19, %struct.jvirt_sarray_control* %21, i32 %23, i32 %25, i32 0) #3
  %27 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 2
  store i8** %26, i8*** %27, align 8
  br label %28

; <label>:28:                                     ; preds = %7, %14
  %29 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 3
  %30 = load i32, i32* %29, align 8
  %sunkaddr = ptrtoint %struct.my_post_controller* %10 to i64
  %sunkaddr1 = add i64 %sunkaddr, 40
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %31 = load i32, i32* %sunkaddr2, align 8
  %32 = sub i32 %30, %31
  %33 = load i32, i32* %5, align 4
  %34 = sub i32 %6, %33
  %35 = icmp ugt i32 %32, %34
  %. = select i1 %35, i32 %34, i32 %32
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 27
  %37 = load i32, i32* %36, align 4
  %38 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 4
  %39 = load i32, i32* %38, align 4
  %40 = sub i32 %37, %39
  %41 = icmp ugt i32 %., %40
  %.1 = select i1 %41, i32 %40, i32 %.
  %42 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %0, i64 0, i32 83
  %43 = load %struct.jpeg_color_quantizer*, %struct.jpeg_color_quantizer** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_color_quantizer, %struct.jpeg_color_quantizer* %43, i64 0, i32 1
  %45 = load void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)** %44, align 8
  %46 = getelementptr inbounds %struct.my_post_controller, %struct.my_post_controller* %10, i64 0, i32 2
  %47 = load i8**, i8*** %46, align 8
  %48 = zext i32 %31 to i64
  %49 = getelementptr inbounds i8*, i8** %47, i64 %48
  %50 = zext i32 %33 to i64
  %51 = getelementptr inbounds i8*, i8** %4, i64 %50
  tail call void %45(%struct.jpeg_decompress_struct* nonnull %0, i8** %49, i8** %51, i32 %.1) #3
  %52 = load i32, i32* %5, align 4
  %53 = add i32 %52, %.1
  store i32 %53, i32* %5, align 4
  %54 = load i32, i32* %sunkaddr2, align 8
  %55 = add i32 %54, %.1
  store i32 %55, i32* %sunkaddr2, align 8
  %56 = load i32, i32* %29, align 8
  %57 = icmp ult i32 %55, %56
  br i1 %57, label %61, label %58

; <label>:58:                                     ; preds = %28
  %sunkaddr3 = ptrtoint %struct.my_post_controller* %10 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 36
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %59 = load i32, i32* %sunkaddr5, align 4
  %60 = add i32 %59, %56
  store i32 %60, i32* %sunkaddr5, align 4
  %sunkaddr6 = ptrtoint %struct.my_post_controller* %10 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 40
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  store i32 0, i32* %sunkaddr8, align 8
  br label %61

; <label>:61:                                     ; preds = %28, %58
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
