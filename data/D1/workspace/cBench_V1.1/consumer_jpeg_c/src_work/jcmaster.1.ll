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
define void @jinit_c_master_control(%struct.jpeg_compress_struct*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_memory_mgr** %3 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %4, align 8
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
  tail call fastcc void @initial_setup(%struct.jpeg_compress_struct* %0)
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %19 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %18, align 8
  %20 = icmp eq %struct.jpeg_scan_info* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %2
  tail call fastcc void @validate_script(%struct.jpeg_compress_struct* nonnull %0)
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
  %36 = icmp eq i32 %35, 0
  %37 = getelementptr inbounds i8, i8* %8, i64 32
  %38 = bitcast i8* %37 to i32*
  %.sink = select i1 %36, i32 2, i32 1
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
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 21
  %50 = load i32, i32* %49, align 8
  %not. = icmp ne i32 %48, 0
  %51 = zext i1 %not. to i32
  %.sink1 = shl nsw i32 %50, %51
  %52 = getelementptr inbounds i8, i8* %8, i64 40
  %53 = bitcast i8* %52 to i32*
  store i32 %.sink1, i32* %53, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @prepare_for_pass(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 51
  %3 = bitcast %struct.jpeg_comp_master** %2 to %struct.my_comp_master**
  %4 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %5 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 1
  %6 = load i32, i32* %5, align 8
  switch i32 %6, label %104 [
    i32 0, label %7
    i32 1, label %50
    i32 2, label %76
  ]

; <label>:7:                                      ; preds = %1
  tail call fastcc void @select_scan_parameters(%struct.jpeg_compress_struct* nonnull %0)
  tail call fastcc void @per_scan_setup(%struct.jpeg_compress_struct* nonnull %0)
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 23
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %24

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %13 = bitcast %struct.jpeg_color_converter** %12 to void (%struct.jpeg_compress_struct*)***
  %14 = load void (%struct.jpeg_compress_struct*)**, void (%struct.jpeg_compress_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %14, align 8
  tail call void %15(%struct.jpeg_compress_struct* nonnull %0) #3
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 57
  %17 = bitcast %struct.jpeg_downsampler** %16 to void (%struct.jpeg_compress_struct*)***
  %18 = load void (%struct.jpeg_compress_struct*)**, void (%struct.jpeg_compress_struct*)*** %17, align 8
  %19 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %18, align 8
  tail call void %19(%struct.jpeg_compress_struct* nonnull %0) #3
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 53
  %21 = bitcast %struct.jpeg_c_prep_controller** %20 to void (%struct.jpeg_compress_struct*, i32)***
  %22 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %21, align 8
  %23 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %22, align 8
  tail call void %23(%struct.jpeg_compress_struct* nonnull %0, i32 0) #3
  br label %24

; <label>:24:                                     ; preds = %7, %11
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 58
  %26 = bitcast %struct.jpeg_forward_dct** %25 to void (%struct.jpeg_compress_struct*)***
  %27 = load void (%struct.jpeg_compress_struct*)**, void (%struct.jpeg_compress_struct*)*** %26, align 8
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
  %36 = bitcast %struct.jpeg_c_coef_controller** %35 to void (%struct.jpeg_compress_struct*, i32)***
  %37 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %36, align 8
  %38 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %37, align 8
  %39 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 3
  %40 = load i32, i32* %39, align 8
  %41 = icmp sgt i32 %40, 1
  %42 = select i1 %41, i32 3, i32 0
  tail call void %38(%struct.jpeg_compress_struct* nonnull %0, i32 %42) #3
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 52
  %44 = bitcast %struct.jpeg_c_main_controller** %43 to void (%struct.jpeg_compress_struct*, i32)***
  %45 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %44, align 8
  %46 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %45, align 8
  tail call void %46(%struct.jpeg_compress_struct* nonnull %0, i32 0) #3
  %47 = load i32, i32* %33, align 8
  %48 = icmp eq i32 %47, 0
  %49 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 0, i32 3
  %.sink = zext i1 %48 to i32
  store i32 %.sink, i32* %49, align 8
  br label %112

; <label>:50:                                     ; preds = %1
  tail call fastcc void @select_scan_parameters(%struct.jpeg_compress_struct* nonnull %0)
  tail call fastcc void @per_scan_setup(%struct.jpeg_compress_struct* nonnull %0)
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  %52 = load i32, i32* %51, align 4
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %62

; <label>:54:                                     ; preds = %50
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  %56 = load i32, i32* %55, align 4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %62, label %58

; <label>:58:                                     ; preds = %54
  %59 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 24
  %60 = load i32, i32* %59, align 4
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %72, label %62

; <label>:62:                                     ; preds = %58, %54, %50
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %64 = bitcast %struct.jpeg_entropy_encoder** %63 to void (%struct.jpeg_compress_struct*, i32)***
  %65 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %64, align 8
  %66 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %65, align 8
  tail call void %66(%struct.jpeg_compress_struct* nonnull %0, i32 1) #3
  %67 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %68 = bitcast %struct.jpeg_c_coef_controller** %67 to void (%struct.jpeg_compress_struct*, i32)***
  %69 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %68, align 8
  %70 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %69, align 8
  tail call void %70(%struct.jpeg_compress_struct* nonnull %0, i32 2) #3
  %71 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 0, i32 3
  store i32 0, i32* %71, align 8
  br label %112

; <label>:72:                                     ; preds = %58
  %sunkaddr = ptrtoint %struct.my_comp_master* %4 to i64
  %sunkaddr1 = add i64 %sunkaddr, 32
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 2, i32* %sunkaddr2, align 8
  %73 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 2
  %74 = load i32, i32* %73, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %73, align 4
  br label %76

; <label>:76:                                     ; preds = %1, %72
  %77 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %78 = load i32, i32* %77, align 8
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %81

; <label>:80:                                     ; preds = %76
  tail call fastcc void @select_scan_parameters(%struct.jpeg_compress_struct* nonnull %0)
  tail call fastcc void @per_scan_setup(%struct.jpeg_compress_struct* nonnull %0)
  br label %81

; <label>:81:                                     ; preds = %76, %80
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 59
  %83 = bitcast %struct.jpeg_entropy_encoder** %82 to void (%struct.jpeg_compress_struct*, i32)***
  %84 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %83, align 8
  %85 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %84, align 8
  tail call void %85(%struct.jpeg_compress_struct* nonnull %0, i32 0) #3
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 54
  %87 = bitcast %struct.jpeg_c_coef_controller** %86 to void (%struct.jpeg_compress_struct*, i32)***
  %88 = load void (%struct.jpeg_compress_struct*, i32)**, void (%struct.jpeg_compress_struct*, i32)*** %87, align 8
  %89 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %88, align 8
  tail call void %89(%struct.jpeg_compress_struct* nonnull %0, i32 2) #3
  %90 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 4
  %91 = load i32, i32* %90, align 4
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %98

; <label>:93:                                     ; preds = %81
  %94 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %95 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %94, align 8
  %96 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %95, i64 0, i32 2
  %97 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %96, align 8
  tail call void %97(%struct.jpeg_compress_struct* nonnull %0) #3
  br label %98

; <label>:98:                                     ; preds = %81, %93
  %99 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 55
  %100 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %99, align 8
  %101 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %100, i64 0, i32 3
  %102 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %101, align 8
  tail call void %102(%struct.jpeg_compress_struct* nonnull %0) #3
  %103 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 0, i32 3
  store i32 0, i32* %103, align 8
  br label %112

; <label>:104:                                    ; preds = %1
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i64 0, i32 5
  store i32 47, i32* %107, align 8
  %108 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %109 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %108, align 8
  %110 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %109, align 8
  %111 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %110(%struct.jpeg_common_struct* %111) #3
  br label %112

; <label>:112:                                    ; preds = %104, %98, %62, %24
  %113 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 2
  %114 = load i32, i32* %113, align 4
  %115 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 3
  %116 = load i32, i32* %115, align 8
  %117 = add nsw i32 %116, -1
  %118 = icmp eq i32 %114, %117
  %119 = zext i1 %118 to i32
  %120 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 0, i32 4
  store i32 %119, i32* %120, align 4
  %121 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %122 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %121, align 8
  %123 = icmp eq %struct.jpeg_progress_mgr* %122, null
  br i1 %123, label %130, label %124

; <label>:124:                                    ; preds = %112
  %sunkaddr3 = ptrtoint %struct.my_comp_master* %4 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 36
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %125 = load i32, i32* %sunkaddr5, align 4
  %126 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %122, i64 0, i32 3
  store i32 %125, i32* %126, align 8
  %sunkaddr6 = ptrtoint %struct.my_comp_master* %4 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 40
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %127 = load i32, i32* %sunkaddr8, align 8
  %sunkaddr9 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 16
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to %struct.jpeg_progress_mgr**
  %128 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %sunkaddr11, align 8
  %129 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %128, i64 0, i32 4
  store i32 %127, i32* %129, align 4
  br label %130

; <label>:130:                                    ; preds = %112, %124
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
  %sunkaddr = ptrtoint %struct.my_comp_master* %4 to i64
  %sunkaddr1 = add i64 %sunkaddr, 32
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  store i32 2, i32* %sunkaddr2, align 8
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
  %sunkaddr3 = ptrtoint %struct.my_comp_master* %4 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 32
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  store i32 2, i32* %sunkaddr5, align 8
  br label %29

; <label>:20:                                     ; preds = %1
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 25
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %25, label %24

; <label>:24:                                     ; preds = %20
  %sunkaddr6 = ptrtoint %struct.my_comp_master* %4 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 32
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  store i32 1, i32* %sunkaddr8, align 8
  br label %25

; <label>:25:                                     ; preds = %20, %24
  %26 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 4
  %27 = load i32, i32* %26, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %26, align 4
  br label %29

; <label>:29:                                     ; preds = %11, %1, %15, %25, %19
  %30 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %4, i64 0, i32 2
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %30, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @initial_setup(%struct.jpeg_compress_struct*) unnamed_addr #0 {
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
  %21 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %22 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %21, align 8
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %23(%struct.jpeg_common_struct* %24) #3
  br label %25

; <label>:25:                                     ; preds = %13, %17
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr, 44
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  %26 = load i32, i32* %sunkaddr16, align 4
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
  %38 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %39 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %38, align 8
  %40 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %39, align 8
  %41 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %40(%struct.jpeg_common_struct* %41) #3
  br label %42

; <label>:42:                                     ; preds = %28, %32
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
  %56 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %57 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %56, align 8
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
  %sunkaddr17 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 64
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i32*
  %68 = load i32, i32* %sunkaddr19, align 8
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %65, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 6, i32 0, i64 0
  store i32 %68, i32* %70, align 4
  %71 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %72 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %71, align 8
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
  %sunkaddr20 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr21 = add i64 %sunkaddr20, 68
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i32*
  %83 = load i32, i32* %sunkaddr22, align 4
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i64 0, i32 6, i32 0, i64 0
  store i32 %83, i32* %85, align 4
  %86 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %80, align 8
  %87 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %86, i64 0, i32 6, i32 0, i64 1
  store i32 10, i32* %87, align 4
  %88 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %89 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %88, align 8
  %90 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %89, align 8
  %91 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %90(%struct.jpeg_common_struct* %91) #3
  br label %92

; <label>:92:                                     ; preds = %75, %79
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 38
  store i32 1, i32* %93, align 8
  %94 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  store i32 1, i32* %94, align 4
  %sunkaddr23 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 68
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %95 = load i32, i32* %sunkaddr25, align 4
  %96 = icmp sgt i32 %95, 0
  br i1 %96, label %.lr.ph13, label %._crit_edge

.lr.ph13:                                         ; preds = %92
  %sunkaddr26 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 80
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to %struct.jpeg_component_info**
  %97 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr28, align 8
  %98 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %99 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %100 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr80 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr81 = add i64 %sunkaddr80, 304
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to i32*
  %sunkaddr83 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr84 = add i64 %sunkaddr83, 308
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to i32*
  %sunkaddr86 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr87 = add i64 %sunkaddr86, 68
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to i32*
  br label %101

; <label>:101:                                    ; preds = %114, %.lr.ph13
  %.011 = phi %struct.jpeg_component_info* [ %97, %.lr.ph13 ], [ %125, %114 ]
  %.0110 = phi i32 [ 0, %.lr.ph13 ], [ %124, %114 ]
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
  br i1 %108, label %109, label %114

; <label>:109:                                    ; preds = %105, %101
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %98, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i64 0, i32 5
  store i32 16, i32* %111, align 8
  %112 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %100, align 8
  %113 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %112, align 8
  tail call void %113(%struct.jpeg_common_struct* %99) #3
  br label %114

; <label>:114:                                    ; preds = %105, %109
  %115 = load i32, i32* %sunkaddr82, align 8
  %sunkaddr32 = ptrtoint %struct.jpeg_component_info* %.011 to i64
  %sunkaddr33 = add i64 %sunkaddr32, 8
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to i32*
  %116 = load i32, i32* %sunkaddr34, align 8
  %117 = icmp sgt i32 %115, %116
  %118 = select i1 %117, i32 %115, i32 %116
  store i32 %118, i32* %sunkaddr82, align 8
  %119 = load i32, i32* %sunkaddr85, align 4
  %120 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 0, i32 3
  %121 = load i32, i32* %120, align 4
  %122 = icmp sgt i32 %119, %121
  %123 = select i1 %122, i32 %119, i32 %121
  store i32 %123, i32* %sunkaddr85, align 4
  %124 = add nuw nsw i32 %.0110, 1
  %125 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.011, i64 1
  %126 = load i32, i32* %sunkaddr88, align 4
  %127 = icmp slt i32 %124, %126
  br i1 %127, label %101, label %._crit_edge14

._crit_edge14:                                    ; preds = %114
  %128 = icmp sgt i32 %126, 0
  br i1 %128, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge14
  %sunkaddr41 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr42 = add i64 %sunkaddr41, 80
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to %struct.jpeg_component_info**
  %129 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr43, align 8
  %sunkaddr89 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr90 = add i64 %sunkaddr89, 40
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to i32*
  %sunkaddr92 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr93 = add i64 %sunkaddr92, 304
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to i32*
  %sunkaddr95 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr96 = add i64 %sunkaddr95, 44
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to i32*
  %sunkaddr98 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr99 = add i64 %sunkaddr98, 308
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to i32*
  %sunkaddr101 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr102 = add i64 %sunkaddr101, 68
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.19 = phi %struct.jpeg_component_info* [ %178, %.lr.ph ], [ %129, %.lr.ph.preheader ]
  %.128 = phi i32 [ %177, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %130 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 1
  store i32 %.128, i32* %130, align 4
  %131 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 9
  store i32 8, i32* %131, align 4
  %132 = load i32, i32* %sunkaddr91, align 8
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 2
  %135 = load i32, i32* %134, align 8
  %136 = sext i32 %135 to i64
  %137 = mul nsw i64 %136, %133
  %138 = load i32, i32* %sunkaddr94, align 8
  %139 = sext i32 %138 to i64
  %140 = shl nsw i64 %139, 3
  %141 = tail call i64 @jdiv_round_up(i64 %137, i64 %140) #3
  %142 = trunc i64 %141 to i32
  %143 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 7
  store i32 %142, i32* %143, align 4
  %144 = load i32, i32* %sunkaddr97, align 4
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 3
  %147 = load i32, i32* %146, align 4
  %148 = sext i32 %147 to i64
  %149 = mul nsw i64 %148, %145
  %150 = load i32, i32* %sunkaddr100, align 4
  %151 = sext i32 %150 to i64
  %152 = shl nsw i64 %151, 3
  %153 = tail call i64 @jdiv_round_up(i64 %149, i64 %152) #3
  %154 = trunc i64 %153 to i32
  %155 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 8
  store i32 %154, i32* %155, align 8
  %156 = load i32, i32* %sunkaddr91, align 8
  %157 = zext i32 %156 to i64
  %158 = load i32, i32* %134, align 8
  %159 = sext i32 %158 to i64
  %160 = mul nsw i64 %159, %157
  %161 = load i32, i32* %sunkaddr94, align 8
  %162 = sext i32 %161 to i64
  %163 = tail call i64 @jdiv_round_up(i64 %160, i64 %162) #3
  %164 = trunc i64 %163 to i32
  %165 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 10
  store i32 %164, i32* %165, align 8
  %166 = load i32, i32* %sunkaddr97, align 4
  %167 = zext i32 %166 to i64
  %168 = load i32, i32* %146, align 4
  %169 = sext i32 %168 to i64
  %170 = mul nsw i64 %169, %167
  %171 = load i32, i32* %sunkaddr100, align 4
  %172 = sext i32 %171 to i64
  %173 = tail call i64 @jdiv_round_up(i64 %170, i64 %172) #3
  %174 = trunc i64 %173 to i32
  %175 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 11
  store i32 %174, i32* %175, align 4
  %176 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 0, i32 12
  store i32 1, i32* %176, align 8
  %177 = add nuw nsw i32 %.128, 1
  %178 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %.19, i64 1
  %179 = load i32, i32* %sunkaddr103, align 4
  %180 = icmp slt i32 %177, %179
  br i1 %180, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge14, %92
  %sunkaddr59 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr60 = add i64 %sunkaddr59, 44
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to i32*
  %181 = load i32, i32* %sunkaddr61, align 4
  %182 = zext i32 %181 to i64
  %sunkaddr62 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr63 = add i64 %sunkaddr62, 308
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to i32*
  %183 = load i32, i32* %sunkaddr64, align 4
  %184 = sext i32 %183 to i64
  %185 = shl nsw i64 %184, 3
  %186 = tail call i64 @jdiv_round_up(i64 %182, i64 %185) #3
  %187 = trunc i64 %186 to i32
  %188 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 40
  store i32 %187, i32* %188, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @validate_script(%struct.jpeg_compress_struct*) unnamed_addr #0 {
  %2 = alloca [10 x i32], align 16
  %3 = alloca [10 x [64 x i32]], align 16
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 21
  %5 = load i32, i32* %4, align 8
  %6 = icmp slt i32 %5, 1
  br i1 %6, label %7, label %17

; <label>:7:                                      ; preds = %1
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 17, i32* %10, align 8
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6, i32 0, i64 0
  store i32 0, i32* %12, align 4
  %13 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #3
  br label %17

; <label>:17:                                     ; preds = %1, %7
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %19 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %19, i64 0, i32 2
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %17
  %24 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %19, i64 0, i32 3
  %25 = load i32, i32* %24, align 4
  %26 = icmp eq i32 %25, 63
  br i1 %26, label %87, label %27

; <label>:27:                                     ; preds = %23, %17
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  store i32 1, i32* %28, align 4
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %30 = load i32, i32* %29, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.preheader96.preheader, label %.preheader27

.preheader96.preheader:                           ; preds = %27
  %sunkaddr153 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr154 = add i64 %sunkaddr153, 68
  %sunkaddr155 = inttoptr i64 %sunkaddr154 to i32*
  br label %.preheader96

.preheader27.loopexit:                            ; preds = %87
  %32 = bitcast [10 x i32]* %2 to i8*
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr98 = add i64 %sunkaddr, 68
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i32*
  %33 = load i32, i32* %sunkaddr99, align 4
  %34 = icmp sgt i32 %33, 1
  %smax = select i1 %34, i32 %33, i32 1
  %35 = add nsw i32 %smax, -1
  %36 = zext i32 %35 to i64
  %37 = shl nuw nsw i64 %36, 2
  %38 = add nuw nsw i64 %37, 4
  call void @llvm.memset.p0i8.i64(i8* nonnull %32, i8 0, i64 %38, i32 16, i1 false)
  br label %.preheader27

.preheader27.loopexit182:                         ; preds = %.preheader96
  br label %.preheader27

.preheader27:                                     ; preds = %.preheader27.loopexit182, %87, %27, %.preheader27.loopexit
  %sunkaddr100 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr101 = add i64 %sunkaddr100, 232
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to i32*
  %39 = load i32, i32* %sunkaddr102, align 8
  %40 = icmp slt i32 %39, 1
  br i1 %40, label %._crit_edge51, label %.lr.ph50.preheader

.lr.ph50.preheader:                               ; preds = %.preheader27
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %42 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %43 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr159 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr160 = add i64 %sunkaddr159, 300
  %sunkaddr161 = inttoptr i64 %sunkaddr160 to i32*
  %44 = ptrtoint [10 x i32]* %2 to i64
  %45 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %46 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %47 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %49 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %50 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr162 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr163 = add i64 %sunkaddr162, 232
  %sunkaddr164 = inttoptr i64 %sunkaddr163 to i32*
  %51 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %52 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %53 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %55 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %56 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %58 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %59 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %61 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %62 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %64 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %65 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %67 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %68 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %70 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %71 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %73 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %74 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %75 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %76 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %77 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %79 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %80 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %82 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %83 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr156 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr157 = add i64 %sunkaddr156, 68
  %sunkaddr158 = inttoptr i64 %sunkaddr157 to i32*
  br label %.lr.ph50

.preheader96:                                     ; preds = %.preheader96.preheader, %.preheader96
  %indvar = phi i64 [ %indvar.next, %.preheader96 ], [ 0, %.preheader96.preheader ]
  %.0357 = phi i32 [ %84, %.preheader96 ], [ 0, %.preheader96.preheader ]
  %scevgep89 = getelementptr [10 x [64 x i32]], [10 x [64 x i32]]* %3, i64 0, i64 %indvar, i64 0
  %scevgep8990 = bitcast i32* %scevgep89 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8990, i8 -1, i64 256, i32 16, i1 false)
  %84 = add nuw nsw i32 %.0357, 1
  %85 = load i32, i32* %sunkaddr155, align 4
  %86 = icmp slt i32 %84, %85
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %86, label %.preheader96, label %.preheader27.loopexit182

; <label>:87:                                     ; preds = %23
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  store i32 0, i32* %88, align 4
  %89 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %90 = load i32, i32* %89, align 4
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %.preheader27.loopexit, label %.preheader27

.lr.ph50:                                         ; preds = %.lr.ph50.preheader, %.loopexit23
  %.0145 = phi %struct.jpeg_scan_info* [ %285, %.loopexit23 ], [ %19, %.lr.ph50.preheader ]
  %.0242 = phi i32 [ %286, %.loopexit23 ], [ 1, %.lr.ph50.preheader ]
  %92 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 0
  %93 = load i32, i32* %92, align 4
  %wide.trip.count84 = zext i32 %93 to i64
  %wide.trip.count80 = zext i32 %93 to i64
  %wide.trip.count = zext i32 %93 to i64
  %.off = add i32 %93, -1
  %94 = icmp ugt i32 %.off, 3
  br i1 %94, label %.preheader26, label %.lr.ph34.preheader

.preheader26:                                     ; preds = %.lr.ph50
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i64 0, i32 5
  store i32 24, i32* %96, align 8
  %97 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %98 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %97, i64 0, i32 6, i32 0, i64 0
  store i32 %93, i32* %98, align 4
  %99 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %100 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %99, i64 0, i32 6, i32 0, i64 1
  store i32 4, i32* %100, align 4
  %101 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %43, align 8
  %102 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %101, align 8
  tail call void %102(%struct.jpeg_common_struct* %42) #3
  %103 = icmp sgt i32 %93, 0
  br i1 %103, label %.lr.ph34.preheader, label %._crit_edge

.lr.ph34.preheader:                               ; preds = %.preheader26, %.lr.ph50
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %.lr.ph34.preheader, %131
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %131 ], [ 0, %.lr.ph34.preheader ]
  %104 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 1, i64 %indvars.iv68
  %105 = load i32, i32* %104, align 4
  %106 = icmp slt i32 %105, 0
  br i1 %106, label %110, label %107

; <label>:107:                                    ; preds = %.lr.ph34
  %108 = load i32, i32* %sunkaddr158, align 4
  %109 = icmp slt i32 %105, %108
  br i1 %109, label %117, label %110

; <label>:110:                                    ; preds = %107, %.lr.ph34
  %111 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %112 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %111, i64 0, i32 5
  store i32 17, i32* %112, align 8
  %113 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %114 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %113, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %114, align 4
  %115 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %80, align 8
  %116 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %115, align 8
  tail call void %116(%struct.jpeg_common_struct* %79) #3
  br label %117

; <label>:117:                                    ; preds = %107, %110
  %118 = icmp sgt i64 %indvars.iv68, 0
  br i1 %118, label %119, label %131

; <label>:119:                                    ; preds = %117
  %120 = add nsw i64 %indvars.iv68, -1
  %121 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 1, i64 %120
  %122 = load i32, i32* %121, align 4
  %123 = icmp sgt i32 %105, %122
  br i1 %123, label %131, label %124

; <label>:124:                                    ; preds = %119
  %125 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %81, align 8
  %126 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %125, i64 0, i32 5
  store i32 17, i32* %126, align 8
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %81, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %128, align 4
  %129 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %83, align 8
  %130 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %129, align 8
  tail call void %130(%struct.jpeg_common_struct* nonnull %82) #3
  br label %131

; <label>:131:                                    ; preds = %119, %117, %124
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond = icmp eq i64 %indvars.iv.next69, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph34

._crit_edge.loopexit:                             ; preds = %131
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader26
  %132 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 2
  %133 = load i32, i32* %132, align 4
  %134 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 3
  %135 = load i32, i32* %134, align 4
  %136 = sext i32 %135 to i64
  %137 = sext i32 %135 to i64
  %138 = sext i32 %135 to i64
  %139 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 4
  %140 = load i32, i32* %139, align 4
  %141 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 5
  %142 = load i32, i32* %141, align 4
  %143 = load i32, i32* %sunkaddr161, align 4
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %257, label %145

; <label>:145:                                    ; preds = %._crit_edge
  %146 = icmp ugt i32 %133, 63
  %147 = icmp slt i32 %135, %133
  %or.cond8 = or i1 %146, %147
  %148 = icmp sgt i32 %135, 63
  %or.cond9 = or i1 %148, %or.cond8
  %149 = icmp ugt i32 %140, 13
  %150 = or i1 %149, %or.cond9
  %151 = icmp ugt i32 %142, 13
  %152 = or i1 %151, %150
  br i1 %152, label %153, label %160

; <label>:153:                                    ; preds = %145
  %154 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %155 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %154, i64 0, i32 5
  store i32 15, i32* %155, align 8
  %156 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %157 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %156, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %157, align 4
  %158 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %53, align 8
  %159 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %158, align 8
  tail call void %159(%struct.jpeg_common_struct* nonnull %52) #3
  br label %160

; <label>:160:                                    ; preds = %145, %153
  %161 = icmp eq i32 %133, 0
  br i1 %161, label %162, label %171

; <label>:162:                                    ; preds = %160
  %163 = icmp eq i32 %135, 0
  br i1 %163, label %.preheader24, label %164

; <label>:164:                                    ; preds = %162
  %165 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %165, i64 0, i32 5
  store i32 15, i32* %166, align 8
  %167 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %168 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %167, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %168, align 4
  %169 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %56, align 8
  %170 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %169, align 8
  tail call void %170(%struct.jpeg_common_struct* nonnull %55) #3
  br label %.preheader24

; <label>:171:                                    ; preds = %160
  %172 = icmp eq i32 %93, 1
  br i1 %172, label %.lr.ph39, label %173

; <label>:173:                                    ; preds = %171
  %174 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %175 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %174, i64 0, i32 5
  store i32 15, i32* %175, align 8
  %176 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %177 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %176, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %177, align 4
  %178 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %77, align 8
  %179 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %178, align 8
  tail call void %179(%struct.jpeg_common_struct* nonnull %76) #3
  br label %.preheader24

.preheader24:                                     ; preds = %162, %173, %164
  %180 = icmp sgt i32 %93, 0
  br i1 %180, label %.lr.ph39, label %.loopexit23

.lr.ph39:                                         ; preds = %.preheader24, %171
  %181 = add nsw i32 %140, -1
  %182 = sext i32 %135 to i64
  %183 = icmp eq i32 %133, 0
  %184 = icmp eq i32 %142, %181
  %185 = icmp eq i32 %140, 0
  br label %186

; <label>:186:                                    ; preds = %._crit_edge37, %.lr.ph39
  %indvars.iv78 = phi i64 [ 0, %.lr.ph39 ], [ %indvars.iv.next79, %._crit_edge37 ]
  %187 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 1, i64 %indvars.iv78
  %188 = load i32, i32* %187, align 4
  %189 = sext i32 %188 to i64
  br i1 %183, label %.preheader21, label %190

; <label>:190:                                    ; preds = %186
  %191 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %3, i64 0, i64 %189, i64 0
  %192 = load i32, i32* %191, align 16
  %193 = icmp slt i32 %192, 0
  br i1 %193, label %194, label %.preheader21

; <label>:194:                                    ; preds = %190
  %195 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %72, align 8
  %196 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %195, i64 0, i32 5
  store i32 15, i32* %196, align 8
  %197 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %72, align 8
  %198 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %197, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %198, align 4
  %199 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %74, align 8
  %200 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %199, align 8
  tail call void %200(%struct.jpeg_common_struct* %73) #3
  br label %.preheader21

.preheader21:                                     ; preds = %190, %186, %194
  %.16.ph = phi i32 [ %133, %194 ], [ 0, %186 ], [ %133, %190 ]
  %201 = icmp sgt i32 %.16.ph, %135
  br i1 %201, label %._crit_edge37, label %.lr.ph36

.lr.ph36:                                         ; preds = %.preheader21
  %202 = sext i32 %.16.ph to i64
  br i1 %184, label %.lr.ph36.split.us, label %.lr.ph36.split

.lr.ph36.split.us:                                ; preds = %.lr.ph36
  br i1 %185, label %.lr.ph36.split.us.split.us.preheader, label %.lr.ph36.split.us.split.preheader

.lr.ph36.split.us.split.preheader:                ; preds = %.lr.ph36.split.us
  br label %.lr.ph36.split.us.split

.lr.ph36.split.us.split.us.preheader:             ; preds = %.lr.ph36.split.us
  br label %.lr.ph36.split.us.split.us

.lr.ph36.split.us.split.us:                       ; preds = %.lr.ph36.split.us.split.us.preheader, %214
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %214 ], [ %202, %.lr.ph36.split.us.split.us.preheader ]
  %203 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %3, i64 0, i64 %189, i64 %indvars.iv76
  %204 = load i32, i32* %203, align 4
  %205 = icmp slt i32 %204, 0
  %206 = icmp eq i32 %140, %204
  %or.cond = or i1 %205, %206
  br i1 %or.cond, label %214, label %207

; <label>:207:                                    ; preds = %.lr.ph36.split.us.split.us
  %208 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %209 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %208, i64 0, i32 5
  store i32 15, i32* %209, align 8
  %210 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %211 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %210, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %211, align 4
  %212 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %59, align 8
  %213 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %212, align 8
  tail call void %213(%struct.jpeg_common_struct* %58) #3
  br label %214

; <label>:214:                                    ; preds = %.lr.ph36.split.us.split.us, %207
  store i32 %142, i32* %203, align 4
  %indvars.iv.next77 = add nsw i64 %indvars.iv76, 1
  %215 = icmp slt i64 %indvars.iv76, %182
  br i1 %215, label %.lr.ph36.split.us.split.us, label %._crit_edge37.loopexit

.lr.ph36.split.us.split:                          ; preds = %.lr.ph36.split.us.split.preheader, %235
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %235 ], [ %202, %.lr.ph36.split.us.split.preheader ]
  %216 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %3, i64 0, i64 %189, i64 %indvars.iv74
  %217 = load i32, i32* %216, align 4
  %218 = icmp slt i32 %217, 0
  br i1 %218, label %228, label %219

; <label>:219:                                    ; preds = %.lr.ph36.split.us.split
  %220 = icmp eq i32 %140, %217
  br i1 %220, label %235, label %221

; <label>:221:                                    ; preds = %219
  %222 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %63, align 8
  %223 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %222, i64 0, i32 5
  store i32 15, i32* %223, align 8
  %224 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %63, align 8
  %225 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %224, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %225, align 4
  %226 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %65, align 8
  %227 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %226, align 8
  tail call void %227(%struct.jpeg_common_struct* %64) #3
  br label %235

; <label>:228:                                    ; preds = %.lr.ph36.split.us.split
  %229 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %230 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %229, i64 0, i32 5
  store i32 15, i32* %230, align 8
  %231 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %232 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %231, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %232, align 4
  %233 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %62, align 8
  %234 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %233, align 8
  tail call void %234(%struct.jpeg_common_struct* %61) #3
  br label %235

; <label>:235:                                    ; preds = %219, %228, %221
  store i32 %142, i32* %216, align 4
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, 1
  %236 = icmp slt i64 %indvars.iv74, %136
  br i1 %236, label %.lr.ph36.split.us.split, label %._crit_edge37.loopexit178

.lr.ph36.split:                                   ; preds = %.lr.ph36
  br i1 %185, label %.lr.ph36.split.split.us.preheader, label %.lr.ph36.split.split.preheader

.lr.ph36.split.split.preheader:                   ; preds = %.lr.ph36.split
  br label %.lr.ph36.split.split

.lr.ph36.split.split.us.preheader:                ; preds = %.lr.ph36.split
  br label %.lr.ph36.split.split.us

.lr.ph36.split.split.us:                          ; preds = %.lr.ph36.split.split.us.preheader, %247
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %247 ], [ %202, %.lr.ph36.split.split.us.preheader ]
  %237 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %3, i64 0, i64 %189, i64 %indvars.iv72
  %238 = load i32, i32* %237, align 4
  %239 = icmp slt i32 %238, 0
  br i1 %239, label %247, label %240

; <label>:240:                                    ; preds = %.lr.ph36.split.split.us
  %241 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %242 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %241, i64 0, i32 5
  store i32 15, i32* %242, align 8
  %243 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %244 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %243, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %244, align 4
  %245 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %68, align 8
  %246 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %245, align 8
  tail call void %246(%struct.jpeg_common_struct* %67) #3
  br label %247

; <label>:247:                                    ; preds = %.lr.ph36.split.split.us, %240
  store i32 %142, i32* %237, align 4
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, 1
  %248 = icmp slt i64 %indvars.iv72, %137
  br i1 %248, label %.lr.ph36.split.split.us, label %._crit_edge37.loopexit179

.lr.ph36.split.split:                             ; preds = %.lr.ph36.split.split.preheader, %.lr.ph36.split.split
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %.lr.ph36.split.split ], [ %202, %.lr.ph36.split.split.preheader ]
  %249 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %3, i64 0, i64 %189, i64 %indvars.iv70
  %250 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %69, align 8
  %251 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %250, i64 0, i32 5
  store i32 15, i32* %251, align 8
  %252 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %69, align 8
  %253 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %252, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %253, align 4
  %254 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %71, align 8
  %255 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %254, align 8
  tail call void %255(%struct.jpeg_common_struct* %70) #3
  store i32 %142, i32* %249, align 4
  %indvars.iv.next71 = add nsw i64 %indvars.iv70, 1
  %256 = icmp slt i64 %indvars.iv70, %138
  br i1 %256, label %.lr.ph36.split.split, label %._crit_edge37.loopexit180

._crit_edge37.loopexit:                           ; preds = %214
  br label %._crit_edge37

._crit_edge37.loopexit178:                        ; preds = %235
  br label %._crit_edge37

._crit_edge37.loopexit179:                        ; preds = %247
  br label %._crit_edge37

._crit_edge37.loopexit180:                        ; preds = %.lr.ph36.split.split
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit180, %._crit_edge37.loopexit179, %._crit_edge37.loopexit178, %._crit_edge37.loopexit, %.preheader21
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %.loopexit23.loopexit181, label %186

; <label>:257:                                    ; preds = %._crit_edge
  %258 = icmp eq i32 %135, 63
  %259 = or i32 %140, %133
  %260 = or i32 %259, %142
  %261 = icmp eq i32 %260, 0
  %262 = and i1 %258, %261
  br i1 %262, label %.preheader22, label %263

; <label>:263:                                    ; preds = %257
  %264 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %265 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %264, i64 0, i32 5
  store i32 15, i32* %265, align 8
  %266 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %267 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %266, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %267, align 4
  %268 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %50, align 8
  %269 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %268, align 8
  tail call void %269(%struct.jpeg_common_struct* nonnull %49) #3
  br label %.preheader22

.preheader22:                                     ; preds = %257, %263
  %270 = icmp sgt i32 %93, 0
  br i1 %270, label %.lr.ph41.preheader, label %.loopexit23

.lr.ph41.preheader:                               ; preds = %.preheader22
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.preheader, %284
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %284 ], [ 0, %.lr.ph41.preheader ]
  %271 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 0, i32 1, i64 %indvars.iv82
  %272 = load i32, i32* %271, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %273
  %275 = load i32, i32* %274, align 4
  %276 = icmp eq i32 %275, 0
  br i1 %276, label %284, label %277

; <label>:277:                                    ; preds = %.lr.ph41
  %278 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %45, align 8
  %279 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %278, i64 0, i32 5
  store i32 17, i32* %279, align 8
  %280 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %45, align 8
  %281 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %280, i64 0, i32 6, i32 0, i64 0
  store i32 %.0242, i32* %281, align 4
  %282 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %47, align 8
  %283 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %282, align 8
  tail call void %283(%struct.jpeg_common_struct* %46) #3
  br label %284

; <label>:284:                                    ; preds = %.lr.ph41, %277
  %sunkaddr113 = shl nsw i64 %273, 2
  %sunkaddr114 = add i64 %44, %sunkaddr113
  %sunkaddr115 = inttoptr i64 %sunkaddr114 to i32*
  store i32 1, i32* %sunkaddr115, align 4
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %.loopexit23.loopexit, label %.lr.ph41

.loopexit23.loopexit:                             ; preds = %284
  br label %.loopexit23

.loopexit23.loopexit181:                          ; preds = %._crit_edge37
  br label %.loopexit23

.loopexit23:                                      ; preds = %.loopexit23.loopexit181, %.loopexit23.loopexit, %.preheader22, %.preheader24
  %285 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %.0145, i64 1
  %286 = add nuw nsw i32 %.0242, 1
  %287 = load i32, i32* %sunkaddr164, align 8
  %288 = icmp slt i32 %.0242, %287
  br i1 %288, label %.lr.ph50, label %._crit_edge51.loopexit

._crit_edge51.loopexit:                           ; preds = %.loopexit23
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %.preheader27
  %289 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 37
  %290 = load i32, i32* %289, align 4
  %291 = icmp eq i32 %290, 0
  %292 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %293 = load i32, i32* %292, align 4
  %294 = icmp sgt i32 %293, 0
  br i1 %291, label %.preheader, label %.preheader19

.preheader19:                                     ; preds = %._crit_edge51
  br i1 %294, label %.lr.ph32.preheader, label %.loopexit

.lr.ph32.preheader:                               ; preds = %.preheader19
  %295 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %296 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %297 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr165 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr166 = add i64 %sunkaddr165, 68
  %sunkaddr167 = inttoptr i64 %sunkaddr166 to i32*
  br label %.lr.ph32

.preheader:                                       ; preds = %._crit_edge51
  br i1 %294, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  %298 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %299 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %300 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr168 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr169 = add i64 %sunkaddr168, 68
  %sunkaddr170 = inttoptr i64 %sunkaddr169 to i32*
  br label %.lr.ph

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %309
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %309 ], [ 0, %.lr.ph32.preheader ]
  %301 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %3, i64 0, i64 %indvars.iv66, i64 0
  %302 = load i32, i32* %301, align 16
  %303 = icmp slt i32 %302, 0
  br i1 %303, label %304, label %309

; <label>:304:                                    ; preds = %.lr.ph32
  %305 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %295, align 8
  %306 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %305, i64 0, i32 5
  store i32 44, i32* %306, align 8
  %307 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %297, align 8
  %308 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %307, align 8
  tail call void %308(%struct.jpeg_common_struct* %296) #3
  br label %309

; <label>:309:                                    ; preds = %.lr.ph32, %304
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %310 = load i32, i32* %sunkaddr167, align 4
  %311 = sext i32 %310 to i64
  %312 = icmp slt i64 %indvars.iv.next67, %311
  br i1 %312, label %.lr.ph32, label %.loopexit.loopexit177

.lr.ph:                                           ; preds = %.lr.ph.preheader, %321
  %indvars.iv = phi i64 [ %indvars.iv.next, %321 ], [ 0, %.lr.ph.preheader ]
  %313 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %indvars.iv
  %314 = load i32, i32* %313, align 4
  %315 = icmp eq i32 %314, 0
  br i1 %315, label %316, label %321

; <label>:316:                                    ; preds = %.lr.ph
  %317 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %298, align 8
  %318 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %317, i64 0, i32 5
  store i32 44, i32* %318, align 8
  %319 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %300, align 8
  %320 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %319, align 8
  tail call void %320(%struct.jpeg_common_struct* %299) #3
  br label %321

; <label>:321:                                    ; preds = %.lr.ph, %316
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %322 = load i32, i32* %sunkaddr170, align 4
  %323 = sext i32 %322 to i64
  %324 = icmp slt i64 %indvars.iv.next, %323
  br i1 %324, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %321
  br label %.loopexit

.loopexit.loopexit177:                            ; preds = %309
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit177, %.loopexit.loopexit, %.preheader, %.preheader19
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @select_scan_parameters(%struct.jpeg_compress_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 22
  %3 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %2, align 8
  %4 = icmp eq %struct.jpeg_scan_info* %3, null
  br i1 %4, label %37, label %5

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
  br i1 %16, label %.lr.ph5.preheader, label %._crit_edge6

.lr.ph5.preheader:                                ; preds = %5
  %sunkaddr25 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 80
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to %struct.jpeg_component_info**
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph5.preheader, %.lr.ph5
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %.lr.ph5 ], [ 0, %.lr.ph5.preheader ]
  %17 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr27, align 8
  %18 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 1, i64 %indvars.iv7
  %19 = load i32, i32* %18, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %17, i64 %20
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv7
  store %struct.jpeg_component_info* %21, %struct.jpeg_component_info** %22, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %23 = load i32, i32* %12, align 4
  %24 = sext i32 %23 to i64
  %25 = icmp slt i64 %indvars.iv.next8, %24
  br i1 %25, label %.lr.ph5, label %._crit_edge6.loopexit

._crit_edge6.loopexit:                            ; preds = %.lr.ph5
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %5
  %26 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 2
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  store i32 %27, i32* %28, align 4
  %29 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 3
  %30 = load i32, i32* %29, align 4
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  store i32 %30, i32* %31, align 8
  %32 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 4
  %33 = load i32, i32* %32, align 4
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  store i32 %33, i32* %34, align 4
  %35 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %3, i64 %11, i32 5
  %36 = load i32, i32* %35, align 4
  br label %67

; <label>:37:                                     ; preds = %1
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %39 = load i32, i32* %38, align 4
  %40 = icmp sgt i32 %39, 4
  br i1 %40, label %41, label %54

; <label>:41:                                     ; preds = %37
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 5
  store i32 24, i32* %44, align 8
  %sunkaddr11 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 68
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i32*
  %45 = load i32, i32* %sunkaddr13, align 4
  %46 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %47 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %46, i64 0, i32 6, i32 0, i64 0
  store i32 %45, i32* %47, align 4
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i64 0, i32 6, i32 0, i64 1
  store i32 4, i32* %49, align 4
  %50 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %51 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %50, align 8
  %52 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %51, align 8
  %53 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %52(%struct.jpeg_common_struct* %53) #3
  %.pr = load i32, i32* %sunkaddr13, align 4
  br label %54

; <label>:54:                                     ; preds = %37, %41
  %55 = phi i32 [ %.pr, %41 ], [ %39, %37 ]
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 41
  store i32 %55, i32* %56, align 4
  %57 = icmp sgt i32 %55, 0
  br i1 %57, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %54
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr28 = add i64 %sunkaddr, 80
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to %struct.jpeg_component_info**
  %sunkaddr30 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 68
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %58 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %sunkaddr29, align 8
  %59 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %58, i64 %indvars.iv
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
  store %struct.jpeg_component_info* %59, %struct.jpeg_component_info** %60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %61 = load i32, i32* %sunkaddr32, align 4
  %62 = sext i32 %61 to i64
  %63 = icmp slt i64 %indvars.iv.next, %62
  br i1 %63, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %54
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 47
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 48
  store i32 63, i32* %65, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 49
  store i32 0, i32* %66, align 4
  br label %67

; <label>:67:                                     ; preds = %._crit_edge, %._crit_edge6
  %.sink = phi i32 [ 0, %._crit_edge ], [ %36, %._crit_edge6 ]
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 50
  store i32 %.sink, i32* %68, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @per_scan_setup(%struct.jpeg_compress_struct*) unnamed_addr #0 {
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
  %. = select i1 %23, i32 %21, i32 %22
  %24 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %7, i64 0, i32 18
  store i32 %., i32* %24, align 8
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
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr8 = add i64 %sunkaddr, 316
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i32*
  %33 = load i32, i32* %sunkaddr9, align 4
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i64 0, i32 6, i32 0, i64 0
  store i32 %33, i32* %35, align 4
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i64 0, i32 6, i32 0, i64 1
  store i32 4, i32* %37, align 4
  %38 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %39 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %38, align 8
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
  %48 = sext i32 %47 to i64
  %49 = shl nsw i64 %48, 3
  %50 = tail call i64 @jdiv_round_up(i64 %45, i64 %49) #3
  %51 = trunc i64 %50 to i32
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  store i32 %51, i32* %52, align 8
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %54 = load i32, i32* %53, align 4
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 39
  %57 = load i32, i32* %56, align 4
  %58 = sext i32 %57 to i64
  %59 = shl nsw i64 %58, 3
  %60 = tail call i64 @jdiv_round_up(i64 %55, i64 %59) #3
  %61 = trunc i64 %60 to i32
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 44
  store i32 %61, i32* %62, align 4
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 45
  store i32 0, i32* %63, align 8
  %sunkaddr10 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 316
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i32*
  %64 = load i32, i32* %sunkaddr12, align 4
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %.lr.ph7.preheader, label %.loopexit

.lr.ph7.preheader:                                ; preds = %42
  %sunkaddr23 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr24 = add i64 %sunkaddr23, 360
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i32*
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %67 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %68 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %sunkaddr26 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 360
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i32*
  %sunkaddr29 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 316
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i32*
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph7.preheader ]
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 42, i64 %indvars.iv
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
  %.3 = select i1 %85, i32 %79, i32 %84
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 17
  store i32 %.3, i32* %86, align 4
  %87 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 8
  %88 = load i32, i32* %87, align 8
  %89 = load i32, i32* %76, align 8
  %90 = urem i32 %88, %89
  %91 = icmp eq i32 %90, 0
  %.2 = select i1 %91, i32 %89, i32 %90
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i64 0, i32 18
  store i32 %.2, i32* %92, align 8
  %93 = load i32, i32* %78, align 4
  %94 = load i32, i32* %sunkaddr25, align 8
  %95 = add nsw i32 %94, %93
  %96 = icmp sgt i32 %95, 10
  br i1 %96, label %97, label %.preheader

; <label>:97:                                     ; preds = %.lr.ph7
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 5
  store i32 11, i32* %99, align 8
  %100 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %68, align 8
  %101 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %100, align 8
  tail call void %101(%struct.jpeg_common_struct* nonnull %67) #3
  br label %.preheader

.preheader:                                       ; preds = %.lr.ph7, %97
  %102 = icmp sgt i32 %93, 0
  br i1 %102, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %103 = trunc i64 %indvars.iv to i32
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.014 = phi i32 [ %104, %.lr.ph ], [ %93, %.lr.ph.preheader ]
  %104 = add nsw i32 %.014, -1
  %105 = load i32, i32* %sunkaddr28, align 8
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %sunkaddr28, align 8
  %107 = sext i32 %105 to i64
  %108 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 46, i64 %107
  store i32 %103, i32* %108, align 4
  %109 = icmp sgt i32 %.014, 1
  br i1 %109, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %110 = load i32, i32* %sunkaddr31, align 4
  %111 = sext i32 %110 to i64
  %112 = icmp slt i64 %indvars.iv.next, %111
  br i1 %112, label %.lr.ph7, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %42, %5
  %113 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 30
  %114 = load i32, i32* %113, align 4
  %115 = icmp sgt i32 %114, 0
  br i1 %115, label %116, label %126

; <label>:116:                                    ; preds = %.loopexit
  %117 = sext i32 %114 to i64
  %118 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 43
  %119 = load i32, i32* %118, align 8
  %120 = zext i32 %119 to i64
  %121 = mul nsw i64 %120, %117
  %122 = icmp slt i64 %121, 65535
  %123 = select i1 %122, i64 %121, i64 65535
  %124 = trunc i64 %123 to i32
  %125 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 29
  store i32 %124, i32* %125, align 8
  br label %126

; <label>:126:                                    ; preds = %.loopexit, %116
  ret void
}

declare i64 @jdiv_round_up(i64, i64) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
