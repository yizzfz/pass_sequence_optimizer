; ModuleID = 'jcmaster.ll'
source_filename = "jcmaster.c"
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
%struct.my_comp_master = type { %struct.jpeg_comp_master, i32, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define void @jinit_c_master_control(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %4 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %4, i64 0, i32 0
  %6 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %5, align 8
  %7 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %8 = tail call i8* %6(%struct.jpeg_common_struct* %7, i32 1, i64 48) #3
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %10 = bitcast %struct.jpeg_comp_master** %9 to i8**
  store i8* %8, i8** %10, align 8
  %11 = bitcast i8* %8 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @prepare_for_pass, void (%struct.jpeg_compress_struct*)** %11, align 8
  %12 = getelementptr inbounds i8, i8* %8, i64 8
  %13 = bitcast i8* %12 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @pass_startup, void (%struct.jpeg_compress_struct*)** %13, align 8
  %14 = getelementptr inbounds i8, i8* %8, i64 16
  %15 = bitcast i8* %14 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @finish_pass_master, void (%struct.jpeg_compress_struct*)** %15, align 8
  %16 = getelementptr inbounds i8, i8* %8, i64 28
  %17 = bitcast i8* %16 to i32*
  store i32 0, i32* %17, align 4
  tail call void @initial_setup(%struct.jpeg_compress_struct* %0)
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %19 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %18, align 8
  %20 = icmp eq %struct.jpeg_scan_info* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %2
  tail call void @validate_script(%struct.jpeg_compress_struct* nonnull %0)
  br label %25

; <label>:22:                                     ; preds = %2
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  store i32 0, i32* %23, align 4
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 21
  store i32 1, i32* %24, align 8
  br label %25

; <label>:25:                                     ; preds = %22, %21
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %31, label %29

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  store i32 1, i32* %30, align 8
  br label %31

; <label>:31:                                     ; preds = %25, %29
  %32 = icmp eq i32 %1, 0
  br i1 %32, label %39, label %33

; <label>:33:                                     ; preds = %31
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %35 = load i32, i32* %34, align 8
  %36 = icmp ne i32 %35, 0
  %37 = getelementptr inbounds i8, i8* %8, i64 32
  %38 = bitcast i8* %37 to i32*
  %.sink = select i1 %36, i32 1, i32 2
  store i32 %.sink, i32* %38, align 8
  br label %42

; <label>:39:                                     ; preds = %31
  %40 = getelementptr inbounds i8, i8* %8, i64 32
  %41 = bitcast i8* %40 to i32*
  store i32 0, i32* %41, align 8
  br label %42

; <label>:42:                                     ; preds = %39, %33
  %43 = getelementptr inbounds i8, i8* %8, i64 44
  %44 = bitcast i8* %43 to i32*
  store i32 0, i32* %44, align 4
  %45 = getelementptr inbounds i8, i8* %8, i64 36
  %46 = bitcast i8* %45 to i32*
  store i32 0, i32* %46, align 4
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %48 = load i32, i32* %47, align 8
  %49 = icmp ne i32 %48, 0
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 21
  %51 = load i32, i32* %50, align 8
  %52 = zext i1 %49 to i32
  %.sink1 = shl nsw i32 %51, %52
  %53 = getelementptr inbounds i8, i8* %8, i64 40
  %54 = bitcast i8* %53 to i32*
  store i32 %.sink1, i32* %54, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @prepare_for_pass(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %3 = bitcast %struct.jpeg_comp_master** %2 to %struct.my_comp_master**
  %4 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %5 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 1
  %6 = load i32, i32* %5, align 8
  switch i32 %6, label %103 [
    i32 0, label %7
    i32 1, label %49
    i32 2, label %75
  ]

; <label>:7:                                      ; preds = %1
  tail call void @select_scan_parameters(%struct.jpeg_compress_struct* nonnull %0)
  tail call void @per_scan_setup(%struct.jpeg_compress_struct* nonnull %0)
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 23
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %24

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %13 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %13, i64 0, i32 0
  %15 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %14, align 8
  tail call void %15(%struct.jpeg_compress_struct* nonnull %0) #3
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 57
  %17 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %17, i64 0, i32 0
  %19 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %18, align 8
  tail call void %19(%struct.jpeg_compress_struct* nonnull %0) #3
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %21 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_c_prep_controller, %struct.jpeg_c_prep_controller* %21, i64 0, i32 0
  %23 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %22, align 8
  tail call void %23(%struct.jpeg_compress_struct* nonnull %0, i32 0) #3
  br label %24

; <label>:24:                                     ; preds = %7, %11
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 58
  %26 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %26, i64 0, i32 0
  %28 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %27, align 8
  tail call void %28(%struct.jpeg_compress_struct* nonnull %0) #3
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %30 = bitcast %struct.jpeg_entropy_encoder** %29 to void (%struct.jpeg_compress_struct*, i32)***
  %31 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %30, align 8
  %32 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %34 = load i32, i32* %33, align 8
  tail call void %32(%struct.jpeg_compress_struct* nonnull %0, i32 %34) #3
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %36 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %36, i64 0, i32 0
  %38 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %37, align 8
  %39 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 3
  %40 = load i32, i32* %39, align 8
  %41 = icmp sgt i32 %40, 1
  %42 = select i1 %41, i32 3, i32 0
  tail call void %38(%struct.jpeg_compress_struct* nonnull %0, i32 %42) #3
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 52
  %44 = load %struct.jpeg_c_main_controller*, %struct.jpeg_c_main_controller** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_c_main_controller, %struct.jpeg_c_main_controller* %44, i64 0, i32 0
  %46 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %45, align 8
  tail call void %46(%struct.jpeg_compress_struct* nonnull %0, i32 0) #3
  %47 = load i32, i32* %33, align 8
  %48 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 0, i32 3
  %not. = icmp eq i32 %47, 0
  %.sink = zext i1 %not. to i32
  store i32 %.sink, i32* %48, align 8
  br label %111

; <label>:49:                                     ; preds = %1
  tail call void @select_scan_parameters(%struct.jpeg_compress_struct* nonnull %0)
  tail call void @per_scan_setup(%struct.jpeg_compress_struct* nonnull %0)
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %51 = load i32, i32* %50, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %61

; <label>:53:                                     ; preds = %49
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  %55 = load i32, i32* %54, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %61, label %57

; <label>:57:                                     ; preds = %53
  %58 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  %59 = load i32, i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %71, label %61

; <label>:61:                                     ; preds = %57, %49, %53
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %63 = bitcast %struct.jpeg_entropy_encoder** %62 to void (%struct.jpeg_compress_struct*, i32)***
  %64 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %63, align 8
  %65 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %64, align 8
  tail call void %65(%struct.jpeg_compress_struct* nonnull %0, i32 1) #3
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %67 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %67, i64 0, i32 0
  %69 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %68, align 8
  tail call void %69(%struct.jpeg_compress_struct* nonnull %0, i32 2) #3
  %70 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 0, i32 3
  store i32 0, i32* %70, align 8
  br label %111

; <label>:71:                                     ; preds = %57
  store i32 2, i32* %5, align 8
  %72 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 2
  %73 = load i32, i32* %72, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %72, align 4
  br label %75

; <label>:75:                                     ; preds = %71, %1
  %76 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %77 = load i32, i32* %76, align 8
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %80

; <label>:79:                                     ; preds = %75
  tail call void @select_scan_parameters(%struct.jpeg_compress_struct* nonnull %0)
  tail call void @per_scan_setup(%struct.jpeg_compress_struct* nonnull %0)
  br label %80

; <label>:80:                                     ; preds = %75, %79
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %82 = bitcast %struct.jpeg_entropy_encoder** %81 to void (%struct.jpeg_compress_struct*, i32)***
  %83 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %82, align 8
  %84 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %83, align 8
  tail call void %84(%struct.jpeg_compress_struct* nonnull %0, i32 0) #3
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %86 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %86, i64 0, i32 0
  %88 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %87, align 8
  tail call void %88(%struct.jpeg_compress_struct* nonnull %0, i32 2) #3
  %89 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 4
  %90 = load i32, i32* %89, align 4
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %97

; <label>:92:                                     ; preds = %80
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %94 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %93, align 8
  %95 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %94, i64 0, i32 2
  %96 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %95, align 8
  tail call void %96(%struct.jpeg_compress_struct* nonnull %0) #3
  br label %97

; <label>:97:                                     ; preds = %92, %80
  %98 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %99 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %98, align 8
  %100 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %99, i64 0, i32 3
  %101 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %100, align 8
  tail call void %101(%struct.jpeg_compress_struct* nonnull %0) #3
  %102 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 0, i32 3
  store i32 0, i32* %102, align 8
  br label %111

; <label>:103:                                    ; preds = %1
  %104 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 5
  store i32 47, i32* %106, align 8
  %107 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %104, align 8
  %108 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %107, i64 0, i32 0
  %109 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %108, align 8
  %110 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %109(%struct.jpeg_common_struct* %110) #3
  br label %111

; <label>:111:                                    ; preds = %103, %97, %61, %24
  %112 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 2
  %113 = load i32, i32* %112, align 4
  %114 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 3
  %115 = load i32, i32* %114, align 8
  %116 = add nsw i32 %115, -1
  %117 = icmp eq i32 %113, %116
  %118 = zext i1 %117 to i32
  %119 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 0, i32 4
  store i32 %118, i32* %119, align 4
  %120 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %121 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %120, align 8
  %122 = icmp eq %struct.jpeg_progress_mgr* %121, null
  br i1 %122, label %129, label %123

; <label>:123:                                    ; preds = %111
  %124 = load i32, i32* %112, align 4
  %125 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %121, i64 0, i32 3
  store i32 %124, i32* %125, align 8
  %126 = load i32, i32* %114, align 8
  %127 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %120, align 8
  %128 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %127, i64 0, i32 4
  store i32 %126, i32* %128, align 4
  br label %129

; <label>:129:                                    ; preds = %111, %123
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @pass_startup(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %3 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %3, i64 0, i32 3
  store i32 0, i32* %4, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %6 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %6, i64 0, i32 2
  %8 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %7, align 8
  tail call void %8(%struct.jpeg_compress_struct* %0) #3
  %9 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %5, align 8
  %10 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %9, i64 0, i32 3
  %11 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %10, align 8
  tail call void %11(%struct.jpeg_compress_struct* %0) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_master(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %3 = bitcast %struct.jpeg_comp_master** %2 to %struct.my_comp_master**
  %4 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %6 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %6, i64 0, i32 2
  %8 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %7, align 8
  tail call void %8(%struct.jpeg_compress_struct* %0) #3
  %9 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 1
  %10 = load i32, i32* %9, align 8
  switch i32 %10, label %29 [
    i32 0, label %11
    i32 1, label %19
    i32 2, label %20
  ]

; <label>:11:                                     ; preds = %1
  store i32 2, i32* %9, align 8
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %29

; <label>:15:                                     ; preds = %11
  %16 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 4
  %17 = load i32, i32* %16, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %16, align 4
  br label %29

; <label>:19:                                     ; preds = %1
  store i32 2, i32* %9, align 8
  br label %29

; <label>:20:                                     ; preds = %1
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %25, label %24

; <label>:24:                                     ; preds = %20
  store i32 1, i32* %9, align 8
  br label %25

; <label>:25:                                     ; preds = %20, %24
  %26 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 4
  %27 = load i32, i32* %26, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %26, align 4
  br label %29

; <label>:29:                                     ; preds = %11, %15, %25, %19, %1
  %30 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 2
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %30, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @initial_setup(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %17, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %17, label %9

; <label>:9:                                      ; preds = %5
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %11 = load i32, i32* %10, align 4
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %17, label %13

; <label>:13:                                     ; preds = %9
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %15 = load i32, i32* %14, align 8
  %16 = icmp slt i32 %15, 1
  br i1 %16, label %17, label %25

; <label>:17:                                     ; preds = %13, %9, %5, %1
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 31, i32* %20, align 8
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i64 0, i32 0
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %23(%struct.jpeg_common_struct* %24) #3
  br label %25

; <label>:25:                                     ; preds = %17, %13
  %26 = load i32, i32* %2, align 4
  %27 = icmp ugt i32 %26, 65500
  br i1 %27, label %32, label %28

; <label>:28:                                     ; preds = %25
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %30 = load i32, i32* %29, align 8
  %31 = icmp ugt i32 %30, 65500
  br i1 %31, label %32, label %42

; <label>:32:                                     ; preds = %28, %25
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i64 0, i32 5
  store i32 40, i32* %35, align 8
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 6, i32 0, i64 0
  store i32 65500, i32* %37, align 4
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i64 0, i32 0
  %40 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %39, align 8
  %41 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %40(%struct.jpeg_common_struct* %41) #3
  br label %42

; <label>:42:                                     ; preds = %32, %28
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %44 = load i32, i32* %43, align 8
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %47 = load i32, i32* %46, align 8
  %48 = sext i32 %47 to i64
  %49 = mul nsw i64 %48, %45
  %50 = and i64 %49, 4294967295
  %51 = icmp eq i64 %50, %49
  br i1 %51, label %60, label %52

; <label>:52:                                     ; preds = %42
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %54 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %54, i64 0, i32 5
  store i32 69, i32* %55, align 8
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 0
  %58 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %57, align 8
  %59 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %58(%struct.jpeg_common_struct* %59) #3
  br label %60

; <label>:60:                                     ; preds = %42, %52
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  %62 = load i32, i32* %61, align 8
  %63 = icmp eq i32 %62, 8
  br i1 %63, label %75, label %64

; <label>:64:                                     ; preds = %60
  %65 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %66 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %65, align 8
  %67 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %66, i64 0, i32 5
  store i32 13, i32* %67, align 8
  %68 = load i32, i32* %61, align 8
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %65, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 6, i32 0, i64 0
  store i32 %68, i32* %70, align 4
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %65, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 0
  %73 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %72, align 8
  %74 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %73(%struct.jpeg_common_struct* %74) #3
  br label %75

; <label>:75:                                     ; preds = %60, %64
  %76 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %77 = load i32, i32* %76, align 4
  %78 = icmp sgt i32 %77, 10
  br i1 %78, label %79, label %92

; <label>:79:                                     ; preds = %75
  %80 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 5
  store i32 24, i32* %82, align 8
  %83 = load i32, i32* %76, align 4
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i64 0, i32 6, i32 0, i64 0
  store i32 %83, i32* %85, align 4
  %86 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %87 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %86, i64 0, i32 6, i32 0, i64 1
  store i32 10, i32* %87, align 4
  %88 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %89 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %88, i64 0, i32 0
  %90 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %89, align 8
  %91 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %90(%struct.jpeg_common_struct* %91) #3
  br label %92

; <label>:92:                                     ; preds = %79, %75
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 38
  store i32 1, i32* %93, align 8
  %94 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  store i32 1, i32* %94, align 4
  %95 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  %96 = load i32, i32* %76, align 4
  %97 = icmp sgt i32 %96, 0
  br i1 %97, label %.lr.ph13, label %._crit_edge

.lr.ph13:                                         ; preds = %92
  %98 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %95, align 8
  %99 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %100 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  br label %101

; <label>:101:                                    ; preds = %.lr.ph13, %115
  %.011 = phi %struct.jpeg_component_info* [ %98, %.lr.ph13 ], [ %126, %115 ]
  %.0110 = phi i32 [ 0, %.lr.ph13 ], [ %125, %115 ]
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 0, i32 2
  %103 = load i32, i32* %102, align 8
  %.off = add i32 %103, -1
  %104 = icmp ugt i32 %.off, 3
  br i1 %104, label %109, label %105

; <label>:105:                                    ; preds = %101
  %106 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 0, i32 3
  %107 = load i32, i32* %106, align 4
  %.off5 = add i32 %107, -1
  %108 = icmp ugt i32 %.off5, 3
  br i1 %108, label %109, label %115

; <label>:109:                                    ; preds = %105, %101
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i64 0, i32 5
  store i32 16, i32* %111, align 8
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i64 0, i32 0
  %114 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %113, align 8
  tail call void %114(%struct.jpeg_common_struct* %100) #3
  br label %115

; <label>:115:                                    ; preds = %105, %109
  %116 = load i32, i32* %93, align 8
  %117 = load i32, i32* %102, align 8
  %118 = icmp sgt i32 %116, %117
  %119 = select i1 %118, i32 %116, i32 %117
  store i32 %119, i32* %93, align 8
  %120 = load i32, i32* %94, align 4
  %121 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 0, i32 3
  %122 = load i32, i32* %121, align 4
  %123 = icmp sgt i32 %120, %122
  %124 = select i1 %123, i32 %120, i32 %122
  store i32 %124, i32* %94, align 4
  %125 = add nuw nsw i32 %.0110, 1
  %126 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 1
  %127 = load i32, i32* %76, align 4
  %128 = icmp slt i32 %125, %127
  br i1 %128, label %101, label %._crit_edge14

._crit_edge14:                                    ; preds = %115
  %129 = icmp sgt i32 %127, 0
  br i1 %129, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge14
  %130 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %95, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.19 = phi %struct.jpeg_component_info* [ %179, %.lr.ph ], [ %130, %.lr.ph.preheader ]
  %.128 = phi i32 [ %178, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %131 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 1
  store i32 %.128, i32* %131, align 4
  %132 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 9
  store i32 8, i32* %132, align 4
  %133 = load i32, i32* %43, align 8
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 2
  %136 = load i32, i32* %135, align 8
  %137 = sext i32 %136 to i64
  %138 = mul nsw i64 %137, %134
  %139 = load i32, i32* %93, align 8
  %140 = shl nsw i32 %139, 3
  %141 = sext i32 %140 to i64
  %142 = tail call i64 @jdiv_round_up(i64 %138, i64 %141) #3
  %143 = trunc i64 %142 to i32
  %144 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 7
  store i32 %143, i32* %144, align 4
  %145 = load i32, i32* %2, align 4
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 3
  %148 = load i32, i32* %147, align 4
  %149 = sext i32 %148 to i64
  %150 = mul nsw i64 %149, %146
  %151 = load i32, i32* %94, align 4
  %152 = shl nsw i32 %151, 3
  %153 = sext i32 %152 to i64
  %154 = tail call i64 @jdiv_round_up(i64 %150, i64 %153) #3
  %155 = trunc i64 %154 to i32
  %156 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 8
  store i32 %155, i32* %156, align 8
  %157 = load i32, i32* %43, align 8
  %158 = zext i32 %157 to i64
  %159 = load i32, i32* %135, align 8
  %160 = sext i32 %159 to i64
  %161 = mul nsw i64 %160, %158
  %162 = load i32, i32* %93, align 8
  %163 = sext i32 %162 to i64
  %164 = tail call i64 @jdiv_round_up(i64 %161, i64 %163) #3
  %165 = trunc i64 %164 to i32
  %166 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 10
  store i32 %165, i32* %166, align 8
  %167 = load i32, i32* %2, align 4
  %168 = zext i32 %167 to i64
  %169 = load i32, i32* %147, align 4
  %170 = sext i32 %169 to i64
  %171 = mul nsw i64 %170, %168
  %172 = load i32, i32* %94, align 4
  %173 = sext i32 %172 to i64
  %174 = tail call i64 @jdiv_round_up(i64 %171, i64 %173) #3
  %175 = trunc i64 %174 to i32
  %176 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 11
  store i32 %175, i32* %176, align 4
  %177 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 12
  store i32 1, i32* %177, align 8
  %178 = add nuw nsw i32 %.128, 1
  %179 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 1
  %180 = load i32, i32* %76, align 4
  %181 = icmp slt i32 %178, %180
  br i1 %181, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %92, %._crit_edge14
  %182 = load i32, i32* %2, align 4
  %183 = zext i32 %182 to i64
  %184 = load i32, i32* %94, align 4
  %185 = shl nsw i32 %184, 3
  %186 = sext i32 %185 to i64
  %187 = tail call i64 @jdiv_round_up(i64 %183, i64 %186) #3
  %188 = trunc i64 %187 to i32
  %189 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  store i32 %188, i32* %189, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @validate_script(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca [10 x i32], align 16
  %3 = bitcast [10 x i32]* %2 to i8*
  %4 = alloca [10 x [64 x i32]], align 16
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 21
  %6 = load i32, i32* %5, align 8
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %18

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 17, i32* %11, align 8
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 6, i32 0, i64 0
  store i32 0, i32* %13, align 4
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 0
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #3
  br label %18

; <label>:18:                                     ; preds = %8, %1
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %20 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %20, i64 0, i32 2
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %18
  %25 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %20, i64 0, i32 3
  %26 = load i32, i32* %25, align 4
  %27 = icmp eq i32 %26, 63
  br i1 %27, label %67, label %28

; <label>:28:                                     ; preds = %24, %18
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  store i32 1, i32* %29, align 4
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %31 = load i32, i32* %30, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %.preheader94, label %.preheader37

.preheader94:                                     ; preds = %28
  %33 = load i32, i32* %30, align 4
  br label %64

.preheader37.loopexit:                            ; preds = %67
  %34 = load i32, i32* %69, align 4
  %35 = sext i32 %34 to i64
  %36 = icmp sgt i64 %35, 1
  %smax = select i1 %36, i64 %35, i64 1
  %37 = shl nsw i64 %smax, 2
  call void @llvm.memset.p0i8.i64(i8* nonnull %3, i8 0, i64 %37, i32 16, i1 false)
  br label %.preheader37

.preheader37.loopexit107:                         ; preds = %64
  br label %.preheader37

.preheader37:                                     ; preds = %.preheader37.loopexit107, %.preheader37.loopexit, %28, %67
  %38 = load i32, i32* %5, align 8
  %39 = icmp slt i32 %38, 1
  br i1 %39, label %._crit_edge65, label %.lr.ph64

.lr.ph64:                                         ; preds = %.preheader37
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %41 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %43 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %45 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %49 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %51 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %53 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %55 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %57 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %58 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %59 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %61 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %63 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  br label %72

; <label>:64:                                     ; preds = %.preheader94, %64
  %indvar = phi i64 [ %indvar.next, %64 ], [ 0, %.preheader94 ]
  %.0371 = phi i32 [ %65, %64 ], [ 0, %.preheader94 ]
  %scevgep86 = getelementptr [10 x [64 x i32]], [10 x [64 x i32]]* %4, i64 0, i64 %indvar, i64 0
  %scevgep8687 = bitcast i32* %scevgep86 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8687, i8 -1, i64 256, i32 16, i1 false)
  %65 = add nuw nsw i32 %.0371, 1
  %66 = icmp slt i32 %65, %33
  %indvar.next = add i64 %indvar, 1
  br i1 %66, label %64, label %.preheader37.loopexit107

; <label>:67:                                     ; preds = %24
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  store i32 0, i32* %68, align 4
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %70 = load i32, i32* %69, align 4
  %71 = icmp sgt i32 %70, 0
  br i1 %71, label %.preheader37.loopexit, label %.preheader37

; <label>:72:                                     ; preds = %.loopexit35, %.lr.ph64
  %.0159 = phi %struct.jpeg_scan_info* [ %20, %.lr.ph64 ], [ %292, %.loopexit35 ]
  %.0255 = phi i32 [ 1, %.lr.ph64 ], [ %293, %.loopexit35 ]
  %73 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 0
  %74 = load i32, i32* %73, align 4
  %.off = add i32 %74, -1
  %75 = icmp ugt i32 %.off, 3
  br i1 %75, label %77, label %.thread

.thread:                                          ; preds = %72
  %76 = sext i32 %74 to i64
  br label %.lr.ph44.preheader

; <label>:77:                                     ; preds = %72
  %78 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %79 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %78, i64 0, i32 5
  store i32 24, i32* %79, align 8
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i64 0, i32 6, i32 0, i64 0
  store i32 %74, i32* %81, align 4
  %82 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %83 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %82, i64 0, i32 6, i32 0, i64 1
  store i32 4, i32* %83, align 4
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i64 0, i32 0
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  tail call void %86(%struct.jpeg_common_struct* %41) #3
  %87 = sext i32 %74 to i64
  %88 = icmp sgt i32 %74, 0
  br i1 %88, label %.lr.ph44.preheader, label %._crit_edge

.lr.ph44.preheader:                               ; preds = %.thread, %77
  %89 = phi i64 [ %76, %.thread ], [ %87, %77 ]
  br label %.lr.ph44

.lr.ph44:                                         ; preds = %119, %.lr.ph44.preheader
  %indvars.iv943 = phi i64 [ %indvars.iv.next10, %119 ], [ 0, %.lr.ph44.preheader ]
  %90 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 1, i64 %indvars.iv943
  %91 = load i32, i32* %90, align 4
  %92 = icmp slt i32 %91, 0
  br i1 %92, label %96, label %93

; <label>:93:                                     ; preds = %.lr.ph44
  %94 = load i32, i32* %46, align 4
  %95 = icmp slt i32 %91, %94
  br i1 %95, label %104, label %96

; <label>:96:                                     ; preds = %93, %.lr.ph44
  %97 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %98 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %97, i64 0, i32 5
  store i32 17, i32* %98, align 8
  %99 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %100 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %99, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %100, align 4
  %101 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %102 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %101, i64 0, i32 0
  %103 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %102, align 8
  tail call void %103(%struct.jpeg_common_struct* %43) #3
  br label %104

; <label>:104:                                    ; preds = %93, %96
  %105 = icmp sgt i64 %indvars.iv943, 0
  br i1 %105, label %106, label %119

; <label>:106:                                    ; preds = %104
  %107 = add nsw i64 %indvars.iv943, -1
  %108 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 1, i64 %107
  %109 = load i32, i32* %108, align 4
  %110 = icmp sgt i32 %91, %109
  br i1 %110, label %119, label %111

; <label>:111:                                    ; preds = %106
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i64 0, i32 5
  store i32 17, i32* %113, align 8
  %114 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %115 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %114, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %115, align 4
  %116 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %117 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %116, i64 0, i32 0
  %118 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %117, align 8
  tail call void %118(%struct.jpeg_common_struct* nonnull %45) #3
  br label %119

; <label>:119:                                    ; preds = %106, %104, %111
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv943, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next10, %89
  br i1 %exitcond79, label %._crit_edge.loopexit, label %.lr.ph44

._crit_edge.loopexit:                             ; preds = %119
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %77
  %120 = phi i64 [ %87, %77 ], [ %89, %._crit_edge.loopexit ]
  %121 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 2
  %122 = load i32, i32* %121, align 4
  %123 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 3
  %124 = load i32, i32* %123, align 4
  %125 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 4
  %126 = load i32, i32* %125, align 4
  %127 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 5
  %128 = load i32, i32* %127, align 4
  %129 = load i32, i32* %47, align 4
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %262, label %131

; <label>:131:                                    ; preds = %._crit_edge
  %132 = icmp ugt i32 %122, 63
  %133 = icmp slt i32 %124, %122
  %or.cond20 = or i1 %132, %133
  %134 = icmp sgt i32 %124, 63
  %or.cond21 = or i1 %134, %or.cond20
  %135 = icmp ugt i32 %126, 13
  %136 = or i1 %135, %or.cond21
  %137 = icmp ugt i32 %128, 13
  %138 = or i1 %137, %136
  br i1 %138, label %139, label %147

; <label>:139:                                    ; preds = %131
  %140 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i64 0, i32 5
  store i32 15, i32* %141, align 8
  %142 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %143 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %142, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %143, align 4
  %144 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %145 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %144, i64 0, i32 0
  %146 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %145, align 8
  tail call void %146(%struct.jpeg_common_struct* nonnull %53) #3
  br label %147

; <label>:147:                                    ; preds = %131, %139
  %148 = icmp eq i32 %122, 0
  br i1 %148, label %149, label %159

; <label>:149:                                    ; preds = %147
  %150 = icmp eq i32 %124, 0
  br i1 %150, label %169, label %151

; <label>:151:                                    ; preds = %149
  %152 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %153 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %152, i64 0, i32 5
  store i32 15, i32* %153, align 8
  %154 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %155 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %154, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %155, align 4
  %156 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %157 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %156, i64 0, i32 0
  %158 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %157, align 8
  tail call void %158(%struct.jpeg_common_struct* nonnull %55) #3
  br label %169

; <label>:159:                                    ; preds = %147
  %160 = icmp eq i32 %74, 1
  br i1 %160, label %.lr.ph52, label %161

; <label>:161:                                    ; preds = %159
  %162 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %62, align 8
  %163 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %162, i64 0, i32 5
  store i32 15, i32* %163, align 8
  %164 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %62, align 8
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %164, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %165, align 4
  %166 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %62, align 8
  %167 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %166, i64 0, i32 0
  %168 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %167, align 8
  tail call void %168(%struct.jpeg_common_struct* nonnull %63) #3
  br label %169

; <label>:169:                                    ; preds = %149, %161, %151
  %170 = icmp sgt i32 %74, 0
  br i1 %170, label %.lr.ph52, label %.loopexit35

.lr.ph52:                                         ; preds = %159, %169
  %171 = sext i32 %122 to i64
  %172 = sext i32 %124 to i64
  %173 = icmp eq i32 %122, 0
  %174 = icmp sgt i32 %122, %124
  %175 = icmp eq i32 %126, 0
  %176 = add nsw i32 %126, -1
  %177 = icmp eq i32 %128, %176
  %178 = add nsw i64 %172, 1
  br label %179

; <label>:179:                                    ; preds = %._crit_edge47, %.lr.ph52
  %indvars.iv1550 = phi i64 [ 0, %.lr.ph52 ], [ %indvars.iv.next16, %._crit_edge47 ]
  %180 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 1, i64 %indvars.iv1550
  %181 = load i32, i32* %180, align 4
  %182 = sext i32 %181 to i64
  br i1 %173, label %.preheader33, label %183

; <label>:183:                                    ; preds = %179
  %184 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %4, i64 0, i64 %182, i64 0
  %185 = load i32, i32* %184, align 16
  %186 = icmp slt i32 %185, 0
  br i1 %186, label %187, label %.preheader33

; <label>:187:                                    ; preds = %183
  %188 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %189 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %188, i64 0, i32 5
  store i32 15, i32* %189, align 8
  %190 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %191 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %190, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %191, align 4
  %192 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %193 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %192, i64 0, i32 0
  %194 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %193, align 8
  tail call void %194(%struct.jpeg_common_struct* %61) #3
  br label %.preheader33

.preheader33:                                     ; preds = %187, %183, %179
  br i1 %174, label %._crit_edge47, label %.lr.ph46

.lr.ph46:                                         ; preds = %.preheader33
  br i1 %177, label %.lr.ph46.split, label %.lr.ph46.split.us

.lr.ph46.split.us:                                ; preds = %.lr.ph46
  br i1 %175, label %.lr.ph46.split.us.split.us.preheader, label %.lr.ph46.split.us.split.preheader

.lr.ph46.split.us.split.preheader:                ; preds = %.lr.ph46.split.us
  br label %.lr.ph46.split.us.split

.lr.ph46.split.us.split.us.preheader:             ; preds = %.lr.ph46.split.us
  br label %.lr.ph46.split.us.split.us

.lr.ph46.split.us.split.us:                       ; preds = %.lr.ph46.split.us.split.us.preheader, %206
  %indvars.iv1345.us.us = phi i64 [ %indvars.iv.next14.us.us, %206 ], [ %171, %.lr.ph46.split.us.split.us.preheader ]
  %195 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %4, i64 0, i64 %182, i64 %indvars.iv1345.us.us
  %196 = load i32, i32* %195, align 4
  %197 = icmp slt i32 %196, 0
  br i1 %197, label %206, label %198

; <label>:198:                                    ; preds = %.lr.ph46.split.us.split.us
  %199 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %200 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %199, i64 0, i32 5
  store i32 15, i32* %200, align 8
  %201 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %202 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %201, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %202, align 4
  %203 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %204 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %203, i64 0, i32 0
  %205 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %204, align 8
  tail call void %205(%struct.jpeg_common_struct* %59) #3
  br label %206

; <label>:206:                                    ; preds = %.lr.ph46.split.us.split.us, %198
  store i32 %128, i32* %195, align 4
  %indvars.iv.next14.us.us = add nsw i64 %indvars.iv1345.us.us, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next14.us.us, %178
  br i1 %exitcond81, label %._crit_edge47.loopexit104, label %.lr.ph46.split.us.split.us

.lr.ph46.split.us.split:                          ; preds = %.lr.ph46.split.us.split.preheader, %226
  %indvars.iv1345.us = phi i64 [ %indvars.iv.next14.us, %226 ], [ %171, %.lr.ph46.split.us.split.preheader ]
  %207 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %4, i64 0, i64 %182, i64 %indvars.iv1345.us
  %208 = load i32, i32* %207, align 4
  %209 = icmp slt i32 %208, 0
  br i1 %209, label %218, label %210

; <label>:210:                                    ; preds = %.lr.ph46.split.us.split
  %211 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %212 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %211, i64 0, i32 5
  store i32 15, i32* %212, align 8
  %213 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %214 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %213, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %214, align 4
  %215 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %216 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %215, i64 0, i32 0
  %217 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %216, align 8
  tail call void %217(%struct.jpeg_common_struct* %59) #3
  br label %226

; <label>:218:                                    ; preds = %.lr.ph46.split.us.split
  %219 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %220 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %219, i64 0, i32 5
  store i32 15, i32* %220, align 8
  %221 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %222 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %221, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %222, align 4
  %223 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %224 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %223, i64 0, i32 0
  %225 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %224, align 8
  tail call void %225(%struct.jpeg_common_struct* %57) #3
  br label %226

; <label>:226:                                    ; preds = %218, %210
  store i32 %128, i32* %207, align 4
  %indvars.iv.next14.us = add nsw i64 %indvars.iv1345.us, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next14.us, %178
  br i1 %exitcond80, label %._crit_edge47.loopexit105, label %.lr.ph46.split.us.split

.lr.ph46.split:                                   ; preds = %.lr.ph46
  br i1 %175, label %.lr.ph46.split.split.us.preheader, label %.lr.ph46.split.split.preheader

.lr.ph46.split.split.preheader:                   ; preds = %.lr.ph46.split
  br label %.lr.ph46.split.split

.lr.ph46.split.split.us.preheader:                ; preds = %.lr.ph46.split
  br label %.lr.ph46.split.split.us

.lr.ph46.split.split.us:                          ; preds = %.lr.ph46.split.split.us.preheader, %239
  %indvars.iv1345.us48 = phi i64 [ %indvars.iv.next14.us49, %239 ], [ %171, %.lr.ph46.split.split.us.preheader ]
  %227 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %4, i64 0, i64 %182, i64 %indvars.iv1345.us48
  %228 = load i32, i32* %227, align 4
  %229 = icmp sgt i32 %228, -1
  %230 = icmp ne i32 %126, %228
  %or.cond = and i1 %229, %230
  br i1 %or.cond, label %231, label %239

; <label>:231:                                    ; preds = %.lr.ph46.split.split.us
  %232 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %233 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %232, i64 0, i32 5
  store i32 15, i32* %233, align 8
  %234 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %235 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %234, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %235, align 4
  %236 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %237 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %236, i64 0, i32 0
  %238 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %237, align 8
  tail call void %238(%struct.jpeg_common_struct* %59) #3
  br label %239

; <label>:239:                                    ; preds = %.lr.ph46.split.split.us, %231
  store i32 %128, i32* %227, align 4
  %indvars.iv.next14.us49 = add nsw i64 %indvars.iv1345.us48, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next14.us49, %178
  br i1 %exitcond83, label %._crit_edge47.loopexit, label %.lr.ph46.split.split.us

.lr.ph46.split.split:                             ; preds = %.lr.ph46.split.split.preheader, %261
  %indvars.iv1345 = phi i64 [ %indvars.iv.next14, %261 ], [ %171, %.lr.ph46.split.split.preheader ]
  %240 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %4, i64 0, i64 %182, i64 %indvars.iv1345
  %241 = load i32, i32* %240, align 4
  %242 = icmp slt i32 %241, 0
  br i1 %242, label %243, label %251

; <label>:243:                                    ; preds = %.lr.ph46.split.split
  %244 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %245 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %244, i64 0, i32 5
  store i32 15, i32* %245, align 8
  %246 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %247 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %246, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %247, align 4
  %248 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %249 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %248, i64 0, i32 0
  %250 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %249, align 8
  tail call void %250(%struct.jpeg_common_struct* %57) #3
  br label %261

; <label>:251:                                    ; preds = %.lr.ph46.split.split
  %252 = icmp eq i32 %126, %241
  br i1 %252, label %261, label %253

; <label>:253:                                    ; preds = %251
  %254 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %255 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %254, i64 0, i32 5
  store i32 15, i32* %255, align 8
  %256 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %257 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %256, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %257, align 4
  %258 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %259 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %258, i64 0, i32 0
  %260 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %259, align 8
  tail call void %260(%struct.jpeg_common_struct* %59) #3
  br label %261

; <label>:261:                                    ; preds = %251, %253, %243
  store i32 %128, i32* %240, align 4
  %indvars.iv.next14 = add nsw i64 %indvars.iv1345, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next14, %178
  br i1 %exitcond82, label %._crit_edge47.loopexit103, label %.lr.ph46.split.split

._crit_edge47.loopexit:                           ; preds = %239
  br label %._crit_edge47

._crit_edge47.loopexit103:                        ; preds = %261
  br label %._crit_edge47

._crit_edge47.loopexit104:                        ; preds = %206
  br label %._crit_edge47

._crit_edge47.loopexit105:                        ; preds = %226
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit105, %._crit_edge47.loopexit104, %._crit_edge47.loopexit103, %._crit_edge47.loopexit, %.preheader33
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1550, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next16, %120
  br i1 %exitcond84, label %.loopexit35.loopexit106, label %179

; <label>:262:                                    ; preds = %._crit_edge
  %263 = icmp ne i32 %124, 63
  %264 = or i32 %126, %122
  %265 = or i32 %264, %128
  %266 = icmp ne i32 %265, 0
  %267 = or i1 %263, %266
  br i1 %267, label %268, label %.preheader34

; <label>:268:                                    ; preds = %262
  %269 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %270 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %269, i64 0, i32 5
  store i32 15, i32* %270, align 8
  %271 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %272 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %271, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %272, align 4
  %273 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %274 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %273, i64 0, i32 0
  %275 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %274, align 8
  tail call void %275(%struct.jpeg_common_struct* nonnull %49) #3
  br label %.preheader34

.preheader34:                                     ; preds = %262, %268
  %276 = icmp sgt i32 %74, 0
  br i1 %276, label %.lr.ph54.preheader, label %.loopexit35

.lr.ph54.preheader:                               ; preds = %.preheader34
  br label %.lr.ph54

.lr.ph54:                                         ; preds = %.lr.ph54.preheader, %291
  %indvars.iv1153 = phi i64 [ %indvars.iv.next12, %291 ], [ 0, %.lr.ph54.preheader ]
  %277 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 0, i32 1, i64 %indvars.iv1153
  %278 = load i32, i32* %277, align 4
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %279
  %281 = load i32, i32* %280, align 4
  %282 = icmp eq i32 %281, 0
  br i1 %282, label %291, label %283

; <label>:283:                                    ; preds = %.lr.ph54
  %284 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %285 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %284, i64 0, i32 5
  store i32 17, i32* %285, align 8
  %286 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %287 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %286, i64 0, i32 6, i32 0, i64 0
  store i32 %.0255, i32* %287, align 4
  %288 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %289 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %288, i64 0, i32 0
  %290 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %289, align 8
  tail call void %290(%struct.jpeg_common_struct* %51) #3
  br label %291

; <label>:291:                                    ; preds = %.lr.ph54, %283
  store i32 1, i32* %280, align 4
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1153, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next12, %120
  br i1 %exitcond85, label %.loopexit35.loopexit, label %.lr.ph54

.loopexit35.loopexit:                             ; preds = %291
  br label %.loopexit35

.loopexit35.loopexit106:                          ; preds = %._crit_edge47
  br label %.loopexit35

.loopexit35:                                      ; preds = %.loopexit35.loopexit106, %.loopexit35.loopexit, %169, %.preheader34
  %292 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0159, i64 1
  %293 = add nuw nsw i32 %.0255, 1
  %294 = load i32, i32* %5, align 8
  %295 = icmp slt i32 %.0255, %294
  br i1 %295, label %72, label %._crit_edge65.loopexit

._crit_edge65.loopexit:                           ; preds = %.loopexit35
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %.preheader37
  %296 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %297 = load i32, i32* %296, align 4
  %298 = icmp eq i32 %297, 0
  %299 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %300 = load i32, i32* %299, align 4
  %301 = icmp sgt i32 %300, 0
  br i1 %298, label %.preheader, label %.preheader31

.preheader31:                                     ; preds = %._crit_edge65
  br i1 %301, label %.lr.ph42, label %.loopexit

.lr.ph42:                                         ; preds = %.preheader31
  %302 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %303 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  br label %306

.preheader:                                       ; preds = %._crit_edge65
  br i1 %301, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.preheader
  %304 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %305 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  br label %320

; <label>:306:                                    ; preds = %.lr.ph42, %316
  %indvars.iv41 = phi i64 [ 0, %.lr.ph42 ], [ %indvars.iv.next, %316 ]
  %307 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %4, i64 0, i64 %indvars.iv41, i64 0
  %308 = load i32, i32* %307, align 16
  %309 = icmp slt i32 %308, 0
  br i1 %309, label %310, label %316

; <label>:310:                                    ; preds = %306
  %311 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %302, align 8
  %312 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %311, i64 0, i32 5
  store i32 44, i32* %312, align 8
  %313 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %302, align 8
  %314 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %313, i64 0, i32 0
  %315 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %314, align 8
  tail call void %315(%struct.jpeg_common_struct* %303) #3
  br label %316

; <label>:316:                                    ; preds = %306, %310
  %indvars.iv.next = add nuw i64 %indvars.iv41, 1
  %317 = load i32, i32* %299, align 4
  %318 = sext i32 %317 to i64
  %319 = icmp slt i64 %indvars.iv.next, %318
  br i1 %319, label %306, label %.loopexit.loopexit102

; <label>:320:                                    ; preds = %.lr.ph, %330
  %indvars.iv740 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next8, %330 ]
  %321 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %indvars.iv740
  %322 = load i32, i32* %321, align 4
  %323 = icmp eq i32 %322, 0
  br i1 %323, label %324, label %330

; <label>:324:                                    ; preds = %320
  %325 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %304, align 8
  %326 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %325, i64 0, i32 5
  store i32 44, i32* %326, align 8
  %327 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %304, align 8
  %328 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %327, i64 0, i32 0
  %329 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %328, align 8
  tail call void %329(%struct.jpeg_common_struct* %305) #3
  br label %330

; <label>:330:                                    ; preds = %320, %324
  %indvars.iv.next8 = add nuw i64 %indvars.iv740, 1
  %331 = load i32, i32* %299, align 4
  %332 = sext i32 %331 to i64
  %333 = icmp slt i64 %indvars.iv.next8, %332
  br i1 %333, label %320, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %330
  br label %.loopexit

.loopexit.loopexit102:                            ; preds = %316
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit102, %.loopexit.loopexit, %.preheader31, %.preheader
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @select_scan_parameters(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %3 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %2, align 8
  %4 = icmp eq %struct.jpeg_scan_info* %3, null
  br i1 %4, label %39, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %7 = bitcast %struct.jpeg_comp_master** %6 to %struct.my_comp_master**
  %8 = load %struct.my_comp_master*, %struct.my_comp_master** %7, align 8
  %9 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %8, i64 0, i32 4
  %10 = load i32, i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 0
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  store i32 %13, i32* %14, align 4
  %15 = load i32, i32* %12, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %5
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  br label %18

; <label>:18:                                     ; preds = %.lr.ph7, %18
  %indvars.iv5 = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next, %18 ]
  %19 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %20 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 1, i64 %indvars.iv5
  %21 = load i32, i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %19, i64 %22
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv5
  store %struct.jpeg_component_info* %23, %struct.jpeg_component_info** %24, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv5, 1
  %25 = load i32, i32* %12, align 4
  %26 = sext i32 %25 to i64
  %27 = icmp slt i64 %indvars.iv.next, %26
  br i1 %27, label %18, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %18
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %5
  %28 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 2
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  store i32 %29, i32* %30, align 4
  %31 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 3
  %32 = load i32, i32* %31, align 4
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  store i32 %32, i32* %33, align 8
  %34 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 4
  %35 = load i32, i32* %34, align 4
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  store i32 %35, i32* %36, align 4
  %37 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 5
  %38 = load i32, i32* %37, align 4
  br label %71

; <label>:39:                                     ; preds = %1
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %41 = load i32, i32* %40, align 4
  %42 = icmp sgt i32 %41, 4
  br i1 %42, label %43, label %56

; <label>:43:                                     ; preds = %39
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 5
  store i32 24, i32* %46, align 8
  %47 = load i32, i32* %40, align 4
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i64 0, i32 6, i32 0, i64 0
  store i32 %47, i32* %49, align 4
  %50 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %51 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %50, i64 0, i32 6, i32 0, i64 1
  store i32 4, i32* %51, align 4
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i64 0, i32 0
  %54 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %53, align 8
  %55 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %54(%struct.jpeg_common_struct* %55) #3
  %.pr = load i32, i32* %40, align 4
  br label %56

; <label>:56:                                     ; preds = %43, %39
  %57 = phi i32 [ %.pr, %43 ], [ %41, %39 ]
  %58 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  store i32 %57, i32* %58, align 4
  %59 = icmp sgt i32 %57, 0
  br i1 %59, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %56
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 14
  br label %61

; <label>:61:                                     ; preds = %.lr.ph, %61
  %indvars.iv14 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next2, %61 ]
  %62 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %60, align 8
  %63 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %62, i64 %indvars.iv14
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv14
  store %struct.jpeg_component_info* %63, %struct.jpeg_component_info** %64, align 8
  %indvars.iv.next2 = add nuw i64 %indvars.iv14, 1
  %65 = load i32, i32* %40, align 4
  %66 = sext i32 %65 to i64
  %67 = icmp slt i64 %indvars.iv.next2, %66
  br i1 %67, label %61, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %61
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %56
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  store i32 0, i32* %68, align 4
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  store i32 63, i32* %69, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  store i32 0, i32* %70, align 4
  br label %71

; <label>:71:                                     ; preds = %._crit_edge, %._crit_edge8
  %.sink = phi i32 [ 0, %._crit_edge ], [ %38, %._crit_edge8 ]
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  store i32 %.sink, i32* %72, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @per_scan_setup(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %27

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 0
  %7 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 7
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  store i32 %9, i32* %10, align 8
  %11 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 8
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 44
  store i32 %12, i32* %13, align 4
  %14 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 13
  store i32 1, i32* %14, align 4
  %15 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 14
  store i32 1, i32* %15, align 8
  %16 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 15
  store i32 1, i32* %16, align 4
  %17 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 16
  store i32 8, i32* %17, align 8
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 17
  store i32 1, i32* %18, align 4
  %19 = load i32, i32* %11, align 8
  %20 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 3
  %21 = load i32, i32* %20, align 4
  %22 = urem i32 %19, %21
  %23 = icmp eq i32 %22, 0
  %.3 = select i1 %23, i32 %21, i32 %22
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 18
  store i32 %.3, i32* %24, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  store i32 1, i32* %25, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 0
  store i32 0, i32* %26, align 4
  br label %.loopexit

; <label>:27:                                     ; preds = %1
  %.off = add i32 %3, -1
  %28 = icmp ugt i32 %.off, 3
  br i1 %28, label %29, label %42

; <label>:29:                                     ; preds = %27
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i64 0, i32 5
  store i32 24, i32* %32, align 8
  %33 = load i32, i32* %2, align 4
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i64 0, i32 6, i32 0, i64 0
  store i32 %33, i32* %35, align 4
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 6, i32 0, i64 1
  store i32 4, i32* %37, align 4
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i64 0, i32 0
  %40 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %39, align 8
  %41 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %40(%struct.jpeg_common_struct* %41) #3
  br label %42

; <label>:42:                                     ; preds = %27, %29
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %44 = load i32, i32* %43, align 8
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 38
  %47 = load i32, i32* %46, align 8
  %48 = shl nsw i32 %47, 3
  %49 = sext i32 %48 to i64
  %50 = tail call i64 @jdiv_round_up(i64 %45, i64 %49) #3
  %51 = trunc i64 %50 to i32
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  store i32 %51, i32* %52, align 8
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %54 = load i32, i32* %53, align 4
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %57 = load i32, i32* %56, align 4
  %58 = shl nsw i32 %57, 3
  %59 = sext i32 %58 to i64
  %60 = tail call i64 @jdiv_round_up(i64 %55, i64 %59) #3
  %61 = trunc i64 %60 to i32
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 44
  store i32 %61, i32* %62, align 4
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  store i32 0, i32* %63, align 8
  %64 = load i32, i32* %2, align 4
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %.lr.ph8, label %.loopexit

.lr.ph8:                                          ; preds = %42
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %67 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  br label %68

; <label>:68:                                     ; preds = %.lr.ph8, %._crit_edge
  %indvars.iv6 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next, %._crit_edge ]
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv6
  %70 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %69, align 8
  %71 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 2
  %72 = load i32, i32* %71, align 8
  %73 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 13
  store i32 %72, i32* %73, align 4
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 3
  %75 = load i32, i32* %74, align 4
  %76 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 14
  store i32 %75, i32* %76, align 8
  %77 = mul nsw i32 %75, %72
  %78 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 15
  store i32 %77, i32* %78, align 4
  %79 = load i32, i32* %73, align 4
  %80 = shl nsw i32 %79, 3
  %81 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 16
  store i32 %80, i32* %81, align 8
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 7
  %83 = load i32, i32* %82, align 4
  %84 = urem i32 %83, %79
  %85 = icmp eq i32 %84, 0
  %.4 = select i1 %85, i32 %79, i32 %84
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 17
  store i32 %.4, i32* %86, align 4
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 8
  %88 = load i32, i32* %87, align 8
  %89 = load i32, i32* %76, align 8
  %90 = urem i32 %88, %89
  %91 = icmp eq i32 %90, 0
  %.2 = select i1 %91, i32 %89, i32 %90
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 18
  store i32 %.2, i32* %92, align 8
  %93 = load i32, i32* %78, align 4
  %94 = load i32, i32* %63, align 8
  %95 = add nsw i32 %94, %93
  %96 = icmp sgt i32 %95, 10
  br i1 %96, label %97, label %.preheader

; <label>:97:                                     ; preds = %68
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 5
  store i32 11, i32* %99, align 8
  %100 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %101 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %100, i64 0, i32 0
  %102 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %101, align 8
  tail call void %102(%struct.jpeg_common_struct* nonnull %67) #3
  br label %.preheader

.preheader:                                       ; preds = %97, %68
  %103 = icmp sgt i32 %93, 0
  br i1 %103, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %104 = trunc i64 %indvars.iv6 to i32
  br label %105

; <label>:105:                                    ; preds = %.lr.ph, %105
  %.015 = phi i32 [ %93, %.lr.ph ], [ %106, %105 ]
  %106 = add nsw i32 %.015, -1
  %107 = load i32, i32* %63, align 8
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %63, align 8
  %109 = sext i32 %107 to i64
  %110 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %109
  store i32 %104, i32* %110, align 4
  %111 = icmp sgt i32 %.015, 1
  br i1 %111, label %105, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %105
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next = add nuw i64 %indvars.iv6, 1
  %112 = load i32, i32* %2, align 4
  %113 = sext i32 %112 to i64
  %114 = icmp slt i64 %indvars.iv.next, %113
  br i1 %114, label %68, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %42, %5
  %115 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 30
  %116 = load i32, i32* %115, align 4
  %117 = icmp sgt i32 %116, 0
  br i1 %117, label %118, label %127

; <label>:118:                                    ; preds = %.loopexit
  %119 = sext i32 %116 to i64
  %120 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  %121 = load i32, i32* %120, align 8
  %122 = zext i32 %121 to i64
  %123 = mul nsw i64 %122, %119
  %124 = icmp slt i64 %123, 65535
  %. = select i1 %124, i64 %123, i64 65535
  %125 = trunc i64 %. to i32
  %126 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  store i32 %125, i32* %126, align 8
  br label %127

; <label>:127:                                    ; preds = %118, %.loopexit
  ret void
}

declare i64 @jdiv_round_up(i64, i64) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
