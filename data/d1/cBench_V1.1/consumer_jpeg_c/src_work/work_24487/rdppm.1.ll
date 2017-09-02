; ModuleID = 'rdppm.ll'
source_filename = "rdppm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cjpeg_source_struct = type { void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, %struct._IO_FILE*, i8**, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
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
%struct.jpeg_comp_master = type opaque
%struct.jpeg_c_main_controller = type opaque
%struct.jpeg_c_prep_controller = type opaque
%struct.jpeg_c_coef_controller = type opaque
%struct.jpeg_marker_writer = type opaque
%struct.jpeg_color_converter = type opaque
%struct.jpeg_downsampler = type opaque
%struct.jpeg_forward_dct = type opaque
%struct.jpeg_entropy_encoder = type opaque

; Function Attrs: noinline nounwind uwtable
define %struct.cjpeg_source_struct* @jinit_read_ppm(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %.cast, i32 1, i64 80) #3
  %.cast1 = bitcast i8* %6 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_ppm, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %.cast1, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 16
  %8 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_ppm, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %8, align 8
  %9 = bitcast i8* %6 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %9
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_ppm(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = tail call i32 @_IO_getc(%struct._IO_FILE* %4) #3
  %6 = icmp eq i32 %5, 80
  br i1 %6, label %15, label %7

; <label>:7:                                      ; preds = %2
  %8 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %9 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 1027, i32* %11, align 8
  %12 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  tail call void %14(%struct.jpeg_common_struct* %8) #3
  br label %15

; <label>:15:                                     ; preds = %2, %7
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr21 = add i64 %sunkaddr, 24
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to %struct._IO_FILE**
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr22, align 8
  %17 = tail call i32 @_IO_getc(%struct._IO_FILE* %16) #3
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr22, align 8
  %19 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr22, align 8
  %21 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %20)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr22, align 8
  %23 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %22)
  %24 = icmp eq i32 %19, 0
  %25 = icmp eq i32 %21, 0
  %or.cond = or i1 %24, %25
  %26 = icmp eq i32 %23, 0
  %or.cond3 = or i1 %or.cond, %26
  br i1 %or.cond3, label %27, label %35

; <label>:27:                                     ; preds = %15
  %28 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %29 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i64 0, i32 5
  store i32 1027, i32* %31, align 8
  %32 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %33 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %32, align 8
  %34 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %33, align 8
  tail call void %34(%struct.jpeg_common_struct* %28) #3
  br label %35

; <label>:35:                                     ; preds = %15, %27
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  store i32 8, i32* %36, align 8
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  store i32 %19, i32* %37, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  store i32 %21, i32* %38, align 4
  switch i32 %17, label %111 [
    i32 50, label %39
    i32 51, label %52
    i32 53, label %65
    i32 54, label %88
  ]

; <label>:39:                                     ; preds = %35
  %40 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 1, i32* %41, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 1, i32* %42, align 4
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 5
  store i32 1029, i32* %44, align 8
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %46, align 4
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 6, i32 0, i64 1
  store i32 %21, i32* %48, align 4
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %40, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i64 0, i32 1
  %51 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %50, align 8
  %.cast18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %51(%struct.jpeg_common_struct* %.cast18, i32 1) #3
  br label %.thread.sink.split

; <label>:52:                                     ; preds = %35
  %53 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 3, i32* %54, align 8
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 2, i32* %55, align 4
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 5
  store i32 1031, i32* %57, align 8
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %59, align 4
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i64 0, i32 6, i32 0, i64 1
  store i32 %21, i32* %61, align 4
  %62 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %63 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %62, i64 0, i32 1
  %64 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %63, align 8
  %.cast16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %64(%struct.jpeg_common_struct* %.cast16, i32 1) #3
  br label %.thread.sink.split

; <label>:65:                                     ; preds = %35
  %66 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %67 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 1, i32* %67, align 8
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 1, i32* %68, align 4
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 5
  store i32 1028, i32* %70, align 8
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %72, align 4
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i64 0, i32 6, i32 0, i64 1
  store i32 %21, i32* %74, align 4
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i64 0, i32 1
  %77 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %76, align 8
  %.cast14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %77(%struct.jpeg_common_struct* %.cast14, i32 1) #3
  %78 = icmp ugt i32 %23, 255
  br i1 %78, label %79, label %82

; <label>:79:                                     ; preds = %65
  %80 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %81 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_word_gray_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %81, align 8
  br label %119

; <label>:82:                                     ; preds = %65
  %83 = icmp eq i32 %23, 255
  br i1 %83, label %84, label %86

; <label>:84:                                     ; preds = %82
  %85 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr49 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr50 = add i64 %sunkaddr49, 8
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_raw_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %sunkaddr51, align 8
  br label %119

; <label>:86:                                     ; preds = %82
  %87 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr52 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr53 = add i64 %sunkaddr52, 8
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_scaled_gray_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %sunkaddr54, align 8
  br label %119

; <label>:88:                                     ; preds = %35
  %89 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %90 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 3, i32* %90, align 8
  %91 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 2, i32* %91, align 4
  %92 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %93 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %92, i64 0, i32 5
  store i32 1030, i32* %93, align 8
  %94 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %95 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %94, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %95, align 4
  %96 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %97 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %96, i64 0, i32 6, i32 0, i64 1
  store i32 %21, i32* %97, align 4
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %89, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 1
  %100 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %99, align 8
  %.cast7 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %100(%struct.jpeg_common_struct* %.cast7, i32 1) #3
  %101 = icmp ugt i32 %23, 255
  br i1 %101, label %102, label %105

; <label>:102:                                    ; preds = %88
  %103 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %104 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_word_rgb_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %104, align 8
  br label %119

; <label>:105:                                    ; preds = %88
  %106 = icmp eq i32 %23, 255
  br i1 %106, label %107, label %109

; <label>:107:                                    ; preds = %105
  %108 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr55 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr56 = add i64 %sunkaddr55, 8
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_raw_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %sunkaddr57, align 8
  br label %119

; <label>:109:                                    ; preds = %105
  %110 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr58 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr59 = add i64 %sunkaddr58, 8
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_scaled_rgb_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %sunkaddr60, align 8
  br label %119

; <label>:111:                                    ; preds = %35
  %112 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %113 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %114 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %113, align 8
  %115 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %114, i64 0, i32 5
  store i32 1027, i32* %115, align 8
  %116 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %117 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %116, align 8
  %118 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %117, align 8
  tail call void %118(%struct.jpeg_common_struct* nonnull %112) #3
  %.pre43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  br label %119

; <label>:119:                                    ; preds = %111, %84, %86, %79, %107, %109, %102
  %.cast12.pre-phi = phi %struct.jpeg_common_struct* [ %112, %111 ], [ %85, %84 ], [ %87, %86 ], [ %80, %79 ], [ %108, %107 ], [ %110, %109 ], [ %103, %102 ]
  %.pre-phi = phi i32* [ %.pre43, %111 ], [ %67, %84 ], [ %67, %86 ], [ %67, %79 ], [ %90, %107 ], [ %90, %109 ], [ %90, %102 ]
  %.ph = phi i32 [ 1, %111 ], [ 0, %84 ], [ 1, %86 ], [ 1, %79 ], [ 0, %107 ], [ 1, %109 ], [ 1, %102 ]
  %.ph20 = phi i1 [ true, %111 ], [ false, %84 ], [ true, %86 ], [ true, %79 ], [ false, %107 ], [ true, %109 ], [ true, %102 ]
  %120 = zext i32 %19 to i64
  %121 = load i32, i32* %.pre-phi, align 8
  %122 = sext i32 %121 to i64
  %123 = mul nsw i64 %120, %122
  %124 = icmp ult i32 %23, 256
  %125 = select i1 %124, i64 1, i64 2
  %126 = mul i64 %123, %125
  %127 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %128 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %127 to i64*
  store i64 %126, i64* %128, align 8
  %129 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %130 = bitcast %struct.jpeg_memory_mgr** %129 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %131 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %130, align 8
  %132 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %131, align 8
  %133 = tail call i8* %132(%struct.jpeg_common_struct* %.cast12.pre-phi, i32 1, i64 %126) #3
  %134 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1
  %135 = bitcast %struct.cjpeg_source_struct* %134 to i8**
  store i8* %133, i8** %135, align 8
  br i1 %.ph20, label %.thread, label %136

; <label>:136:                                    ; preds = %119
  %137 = ptrtoint i8* %133 to i64
  %138 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %139 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %138 to i64*
  store i64 %137, i64* %139, align 8
  %140 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %141 = bitcast i8*** %140 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)***
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %138, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*** %141, align 8
  br label %151

.thread.sink.split:                               ; preds = %52, %39
  %.pre47.pre-phi = phi i32* [ %54, %52 ], [ %41, %39 ]
  %.pre46.pre-phi = phi %struct.jpeg_common_struct* [ %.cast16, %52 ], [ %.cast18, %39 ]
  %get_text_gray_row.sink = phi i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* [ @get_text_rgb_row, %52 ], [ @get_text_gray_row, %39 ]
  %142 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %get_text_gray_row.sink, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %142, align 8
  %.pre44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  br label %.thread

.thread:                                          ; preds = %.thread.sink.split, %119
  %.pre-phi48 = phi i32* [ %.pre47.pre-phi, %.thread.sink.split ], [ %.pre-phi, %119 ]
  %.cast8.pre-phi = phi %struct.jpeg_common_struct* [ %.pre46.pre-phi, %.thread.sink.split ], [ %.cast12.pre-phi, %119 ]
  %.pre-phi45 = phi %struct.jpeg_memory_mgr** [ %.pre44, %.thread.sink.split ], [ %129, %119 ]
  %143 = phi i32 [ 1, %.thread.sink.split ], [ %.ph, %119 ]
  %144 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %.pre-phi45, align 8
  %145 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %144, i64 0, i32 2
  %146 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %145, align 8
  %147 = load i32, i32* %.pre-phi48, align 8
  %148 = mul i32 %19, %147
  %149 = tail call i8** %146(%struct.jpeg_common_struct* %.cast8.pre-phi, i32 1, i32 %148, i32 1) #3
  %150 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  store i8** %149, i8*** %150, align 8
  br label %151

; <label>:151:                                    ; preds = %.thread, %136
  %152 = phi i32 [ %143, %.thread ], [ %.ph, %136 ]
  %153 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 5
  store i32 1, i32* %153, align 8
  %154 = icmp eq i32 %152, 0
  br i1 %154, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %151
  %155 = icmp eq i32 %23, 0
  %156 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %157 = bitcast %struct.jpeg_memory_mgr** %156 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %158 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %157, align 8
  %159 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %158, align 8
  %.cast10 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %160 = zext i32 %23 to i64
  %161 = add nuw nsw i64 %160, 1
  %162 = tail call i8* %159(%struct.jpeg_common_struct* %.cast10, i32 1, i64 %161) #3
  %163 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %164 = bitcast %struct._IO_FILE** %163 to i8**
  store i8* %162, i8** %164, align 8
  %165 = lshr i32 %23, 1
  %166 = zext i32 %165 to i64
  %div = udiv i32 %165, %23
  %167 = trunc i32 %div to i8
  store i8 %167, i8* %162, align 1
  br i1 %155, label %.loopexit, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.lr.ph
  %xtraiter = and i64 %160, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit, label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.preheader
  %sunkaddr61 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr62 = add i64 %sunkaddr61, 72
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to i8**
  %.pre.prol = load i8*, i8** %sunkaddr63, align 8
  %168 = add nuw nsw i64 %166, 255
  %169 = udiv i64 %168, %160
  %170 = trunc i64 %169 to i8
  %171 = getelementptr inbounds i8, i8* %.pre.prol, i64 1
  store i8 %170, i8* %171, align 1
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.preheader, %._crit_edge.prol
  %.unr = phi i64 [ 0, %._crit_edge.preheader ], [ 1, %._crit_edge.prol ]
  %172 = icmp eq i32 %23, 1
  br i1 %172, label %.loopexit, label %._crit_edge.preheader.new

._crit_edge.preheader.new:                        ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader.new
  %173 = phi i64 [ %.unr, %._crit_edge.preheader.new ], [ %180, %._crit_edge ]
  %174 = add nuw nsw i64 %173, 1
  %sunkaddr64 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr65 = add i64 %sunkaddr64, 72
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i8**
  %.pre = load i8*, i8** %sunkaddr66, align 8
  %175 = mul nuw nsw i64 %174, 255
  %176 = add nuw nsw i64 %175, %166
  %177 = sdiv i64 %176, %160
  %178 = trunc i64 %177 to i8
  %179 = getelementptr inbounds i8, i8* %.pre, i64 %174
  store i8 %178, i8* %179, align 1
  %180 = add nsw i64 %173, 2
  %.pre.1 = load i8*, i8** %sunkaddr66, align 8
  %181 = mul nuw nsw i64 %180, 255
  %182 = add nuw nsw i64 %181, %166
  %183 = sdiv i64 %182, %160
  %184 = trunc i64 %183 to i8
  %185 = getelementptr inbounds i8, i8* %.pre.1, i64 %180
  store i8 %184, i8* %185, align 1
  %exitcond.1 = icmp eq i64 %180, %160
  br i1 %exitcond.1, label %.loopexit.loopexit, label %._crit_edge

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.prol.loopexit, %.lr.ph, %151
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @finish_input_ppm(%struct.jpeg_compress_struct* nocapture, %struct.cjpeg_source_struct* nocapture) #1 {
  ret void
}

declare i32 @_IO_getc(%struct._IO_FILE*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct*, %struct._IO_FILE*) unnamed_addr #0 {
  br label %.critedge

.critedge:                                        ; preds = %.critedge.backedge, %2
  %3 = tail call fastcc i32 @pbm_getc(%struct._IO_FILE* %1)
  switch i32 %3, label %.loopexit [
    i32 -1, label %.loopexit.thread
    i32 32, label %.critedge.backedge
    i32 9, label %.critedge.backedge
    i32 10, label %.critedge.backedge
    i32 13, label %.critedge.backedge
  ]

.critedge.backedge:                               ; preds = %.critedge, %.critedge, %.critedge, %.critedge
  br label %.critedge

.loopexit.thread:                                 ; preds = %.critedge
  %4 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %5 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i64 0, i32 5
  store i32 42, i32* %7, align 8
  %8 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %9 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %8, align 8
  %10 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %9, align 8
  tail call void %10(%struct.jpeg_common_struct* %4) #3
  br label %12

.loopexit:                                        ; preds = %.critedge
  %.off = add i32 %3, -48
  %11 = icmp ugt i32 %.off, 9
  br i1 %11, label %.loopexit._crit_edge, label %.preheader.preheader

.loopexit._crit_edge:                             ; preds = %.loopexit
  %.pre = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %.pre2536 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %.pre27 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  br label %12

; <label>:12:                                     ; preds = %.loopexit._crit_edge, %.loopexit.thread
  %.pre-phi28 = phi void (%struct.jpeg_common_struct*)*** [ %.pre27, %.loopexit._crit_edge ], [ %8, %.loopexit.thread ]
  %.pre-phi26 = phi %struct.jpeg_error_mgr** [ %.pre2536, %.loopexit._crit_edge ], [ %5, %.loopexit.thread ]
  %.pre-phi = phi %struct.jpeg_common_struct* [ %.pre, %.loopexit._crit_edge ], [ %4, %.loopexit.thread ]
  %.off13 = phi i32 [ %.off, %.loopexit._crit_edge ], [ -49, %.loopexit.thread ]
  %13 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %.pre-phi26, align 8
  %14 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %13, i64 0, i32 5
  store i32 1026, i32* %14, align 8
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %.pre-phi28, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  tail call void %16(%struct.jpeg_common_struct* %.pre-phi) #3
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.loopexit, %12
  %.ph = phi i32 [ %.off, %.loopexit ], [ %.off13, %12 ]
  %17 = tail call fastcc i32 @pbm_getc(%struct._IO_FILE* %1)
  %.off823 = add i32 %17, -48
  %18 = icmp ult i32 %.off823, 10
  br i1 %18, label %.preheader.preheader29, label %.preheader._crit_edge

.preheader.preheader29:                           ; preds = %.preheader.preheader
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader29, %.preheader
  %.off824 = phi i32 [ %.off8, %.preheader ], [ %.off823, %.preheader.preheader29 ]
  %19 = phi i32 [ %21, %.preheader ], [ %.ph, %.preheader.preheader29 ]
  %20 = mul i32 %19, 10
  %21 = add i32 %20, %.off824
  %22 = tail call fastcc i32 @pbm_getc(%struct._IO_FILE* %1)
  %.off8 = add i32 %22, -48
  %23 = icmp ult i32 %.off8, 10
  br i1 %23, label %.preheader, label %.preheader._crit_edge.loopexit

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.preheader
  %.lcssa = phi i32 [ %.ph, %.preheader.preheader ], [ %21, %.preheader._crit_edge.loopexit ]
  ret i32 %.lcssa
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_text_gray_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %6 = bitcast %struct._IO_FILE** %5 to i8**
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %11 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %12 = load i8**, i8*** %11, align 8
  %13 = load i8*, i8** %12, align 8
  br label %14

; <label>:14:                                     ; preds = %14, %.lr.ph
  %15 = phi i32 [ %9, %.lr.ph ], [ %22, %14 ]
  %16 = phi i8* [ %13, %.lr.ph ], [ %21, %14 ]
  %17 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %4)
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i8, i8* %7, i64 %18
  %20 = load i8, i8* %19, align 1
  %21 = getelementptr inbounds i8, i8* %16, i64 1
  store i8 %20, i8* %16, align 1
  %22 = add i32 %15, -1
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %._crit_edge.loopexit, label %14

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_text_rgb_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %6 = bitcast %struct._IO_FILE** %5 to i8**
  %7 = load i8*, i8** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %9 = load i32, i32* %8, align 8
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %11 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %12 = load i8**, i8*** %11, align 8
  %13 = load i8*, i8** %12, align 8
  br label %14

; <label>:14:                                     ; preds = %14, %.lr.ph
  %15 = phi i32 [ %9, %.lr.ph ], [ %32, %14 ]
  %16 = phi i8* [ %13, %.lr.ph ], [ %31, %14 ]
  %17 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %4)
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i8, i8* %7, i64 %18
  %20 = load i8, i8* %19, align 1
  %21 = getelementptr inbounds i8, i8* %16, i64 1
  store i8 %20, i8* %16, align 1
  %22 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %4)
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8* %7, i64 %23
  %25 = load i8, i8* %24, align 1
  %26 = getelementptr inbounds i8, i8* %16, i64 2
  store i8 %25, i8* %21, align 1
  %27 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %4)
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8* %7, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = getelementptr inbounds i8, i8* %16, i64 3
  store i8 %30, i8* %26, align 1
  %32 = add i32 %15, -1
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %._crit_edge.loopexit, label %14

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_word_gray_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %4 = bitcast %struct._IO_FILE** %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1
  %7 = bitcast %struct.cjpeg_source_struct* %6 to i8**
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %10 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = tail call i64 @fread(i8* %8, i64 1, i64 %11, %struct._IO_FILE* %13) #3
  %15 = load i64, i64* %10, align 8
  %16 = icmp eq i64 %14, %15
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 42, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %19) #3
  br label %25

; <label>:25:                                     ; preds = %17, %2
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %25
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr12 = add i64 %sunkaddr, 48
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i8**
  %29 = load i8*, i8** %sunkaddr13, align 8
  %30 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %31 = load i8**, i8*** %30, align 8
  %32 = load i8*, i8** %31, align 8
  %xtraiter = and i32 %27, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %33 = getelementptr inbounds i8, i8* %29, i64 1
  %34 = load i8, i8* %29, align 1
  %35 = zext i8 %34 to i64
  %36 = getelementptr inbounds i8, i8* %29, i64 2
  %37 = load i8, i8* %33, align 1
  %38 = zext i8 %37 to i64
  %39 = shl nuw nsw i64 %38, 8
  %40 = or i64 %35, %39
  %41 = getelementptr inbounds i8, i8* %5, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = getelementptr inbounds i8, i8* %32, i64 1
  store i8 %42, i8* %32, align 1
  %44 = add i32 %27, -1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %.unr = phi i32 [ %27, %.lr.ph ], [ %44, %.prol.preheader ]
  %.unr10 = phi i8* [ %32, %.lr.ph ], [ %43, %.prol.preheader ]
  %.unr11 = phi i8* [ %29, %.lr.ph ], [ %36, %.prol.preheader ]
  %45 = icmp eq i32 %27, 1
  br i1 %45, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %46 = phi i32 [ %71, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %47 = phi i8* [ %70, %.lr.ph.new ], [ %.unr10, %.lr.ph.new.preheader ]
  %48 = phi i8* [ %63, %.lr.ph.new ], [ %.unr11, %.lr.ph.new.preheader ]
  %49 = getelementptr inbounds i8, i8* %48, i64 1
  %50 = load i8, i8* %48, align 1
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds i8, i8* %48, i64 2
  %53 = load i8, i8* %49, align 1
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 8
  %56 = or i64 %51, %55
  %57 = getelementptr inbounds i8, i8* %5, i64 %56
  %58 = load i8, i8* %57, align 1
  %59 = getelementptr inbounds i8, i8* %47, i64 1
  store i8 %58, i8* %47, align 1
  %60 = getelementptr inbounds i8, i8* %48, i64 3
  %61 = load i8, i8* %52, align 1
  %62 = zext i8 %61 to i64
  %63 = getelementptr inbounds i8, i8* %48, i64 4
  %64 = load i8, i8* %60, align 1
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 8
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8* %5, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = getelementptr inbounds i8, i8* %47, i64 2
  store i8 %69, i8* %59, align 1
  %71 = add i32 %46, -2
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %25
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_raw_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1
  %4 = bitcast %struct.cjpeg_source_struct* %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %7 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %11 = tail call i64 @fread(i8* %5, i64 1, i64 %8, %struct._IO_FILE* %10) #3
  %12 = load i64, i64* %7, align 8
  %13 = icmp eq i64 %11, %12
  br i1 %13, label %22, label %14

; <label>:14:                                     ; preds = %2
  %15 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i64 0, i32 5
  store i32 42, i32* %18, align 8
  %19 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %20 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %19, align 8
  %21 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %20, align 8
  tail call void %21(%struct.jpeg_common_struct* %16) #3
  br label %22

; <label>:22:                                     ; preds = %14, %2
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_scaled_gray_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %4 = bitcast %struct._IO_FILE** %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1
  %7 = bitcast %struct.cjpeg_source_struct* %6 to i8**
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %10 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = tail call i64 @fread(i8* %8, i64 1, i64 %11, %struct._IO_FILE* %13) #3
  %15 = load i64, i64* %10, align 8
  %16 = icmp eq i64 %14, %15
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 42, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %19) #3
  br label %25

; <label>:25:                                     ; preds = %17, %2
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %25
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr22 = add i64 %sunkaddr, 48
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i8**
  %29 = load i8*, i8** %sunkaddr23, align 8
  %30 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %31 = load i8**, i8*** %30, align 8
  %32 = load i8*, i8** %31, align 8
  %33 = add i32 %27, -1
  %xtraiter = and i32 %27, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %34 = phi i32 [ %42, %.prol.preheader ], [ %27, %.prol.preheader.preheader ]
  %35 = phi i8* [ %41, %.prol.preheader ], [ %32, %.prol.preheader.preheader ]
  %36 = phi i8* [ %37, %.prol.preheader ], [ %29, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %37 = getelementptr inbounds i8, i8* %36, i64 1
  %38 = load i8, i8* %36, align 1
  %promoted.prol = zext i8 %38 to i64
  %39 = getelementptr inbounds i8, i8* %5, i64 %promoted.prol
  %40 = load i8, i8* %39, align 1
  %41 = getelementptr inbounds i8, i8* %35, i64 1
  store i8 %40, i8* %35, align 1
  %42 = add i32 %34, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.unr = phi i32 [ %27, %.lr.ph ], [ %42, %.prol.loopexit.loopexit ]
  %.unr8 = phi i8* [ %32, %.lr.ph ], [ %41, %.prol.loopexit.loopexit ]
  %.unr9 = phi i8* [ %29, %.lr.ph ], [ %37, %.prol.loopexit.loopexit ]
  %43 = icmp ult i32 %33, 3
  br i1 %43, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %44 = phi i32 [ %67, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %45 = phi i8* [ %66, %.lr.ph.new ], [ %.unr8, %.lr.ph.new.preheader ]
  %46 = phi i8* [ %62, %.lr.ph.new ], [ %.unr9, %.lr.ph.new.preheader ]
  %47 = getelementptr inbounds i8, i8* %46, i64 1
  %48 = load i8, i8* %46, align 1
  %promoted = zext i8 %48 to i64
  %49 = getelementptr inbounds i8, i8* %5, i64 %promoted
  %50 = load i8, i8* %49, align 1
  %51 = getelementptr inbounds i8, i8* %45, i64 1
  store i8 %50, i8* %45, align 1
  %52 = getelementptr inbounds i8, i8* %46, i64 2
  %53 = load i8, i8* %47, align 1
  %promoted.1 = zext i8 %53 to i64
  %54 = getelementptr inbounds i8, i8* %5, i64 %promoted.1
  %55 = load i8, i8* %54, align 1
  %56 = getelementptr inbounds i8, i8* %45, i64 2
  store i8 %55, i8* %51, align 1
  %57 = getelementptr inbounds i8, i8* %46, i64 3
  %58 = load i8, i8* %52, align 1
  %promoted.2 = zext i8 %58 to i64
  %59 = getelementptr inbounds i8, i8* %5, i64 %promoted.2
  %60 = load i8, i8* %59, align 1
  %61 = getelementptr inbounds i8, i8* %45, i64 3
  store i8 %60, i8* %56, align 1
  %62 = getelementptr inbounds i8, i8* %46, i64 4
  %63 = load i8, i8* %57, align 1
  %promoted.3 = zext i8 %63 to i64
  %64 = getelementptr inbounds i8, i8* %5, i64 %promoted.3
  %65 = load i8, i8* %64, align 1
  %66 = getelementptr inbounds i8, i8* %45, i64 4
  store i8 %65, i8* %61, align 1
  %67 = add i32 %44, -4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %25
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_word_rgb_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %4 = bitcast %struct._IO_FILE** %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1
  %7 = bitcast %struct.cjpeg_source_struct* %6 to i8**
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %10 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = tail call i64 @fread(i8* %8, i64 1, i64 %11, %struct._IO_FILE* %13) #3
  %15 = load i64, i64* %10, align 8
  %16 = icmp eq i64 %14, %15
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 42, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %19) #3
  br label %25

; <label>:25:                                     ; preds = %17, %2
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %25
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr10 = add i64 %sunkaddr, 48
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i8**
  %29 = load i8*, i8** %sunkaddr11, align 8
  %30 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %31 = load i8**, i8*** %30, align 8
  %32 = load i8*, i8** %31, align 8
  br label %33

; <label>:33:                                     ; preds = %33, %.lr.ph
  %34 = phi i32 [ %27, %.lr.ph ], [ %70, %33 ]
  %35 = phi i8* [ %32, %.lr.ph ], [ %69, %33 ]
  %36 = phi i8* [ %29, %.lr.ph ], [ %62, %33 ]
  %37 = getelementptr inbounds i8, i8* %36, i64 1
  %38 = load i8, i8* %36, align 1
  %39 = zext i8 %38 to i64
  %40 = getelementptr inbounds i8, i8* %36, i64 2
  %41 = load i8, i8* %37, align 1
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 8
  %44 = or i64 %39, %43
  %45 = getelementptr inbounds i8, i8* %5, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = getelementptr inbounds i8, i8* %35, i64 1
  store i8 %46, i8* %35, align 1
  %48 = getelementptr inbounds i8, i8* %36, i64 3
  %49 = load i8, i8* %40, align 1
  %50 = zext i8 %49 to i64
  %51 = getelementptr inbounds i8, i8* %36, i64 4
  %52 = load i8, i8* %48, align 1
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 8
  %55 = or i64 %50, %54
  %56 = getelementptr inbounds i8, i8* %5, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = getelementptr inbounds i8, i8* %35, i64 2
  store i8 %57, i8* %47, align 1
  %59 = getelementptr inbounds i8, i8* %36, i64 5
  %60 = load i8, i8* %51, align 1
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds i8, i8* %36, i64 6
  %63 = load i8, i8* %59, align 1
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 8
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8* %5, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = getelementptr inbounds i8, i8* %35, i64 3
  store i8 %68, i8* %58, align 1
  %70 = add i32 %34, -1
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %._crit_edge.loopexit, label %33

._crit_edge.loopexit:                             ; preds = %33
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %25
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_scaled_rgb_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %4 = bitcast %struct._IO_FILE** %3 to i8**
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1
  %7 = bitcast %struct.cjpeg_source_struct* %6 to i8**
  %8 = load i8*, i8** %7, align 8
  %9 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %10 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %14 = tail call i64 @fread(i8* %8, i64 1, i64 %11, %struct._IO_FILE* %13) #3
  %15 = load i64, i64* %10, align 8
  %16 = icmp eq i64 %14, %15
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_error_mgr**
  %19 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 42, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %19) #3
  br label %25

; <label>:25:                                     ; preds = %17, %2
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %25
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr12 = add i64 %sunkaddr, 48
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i8**
  %29 = load i8*, i8** %sunkaddr13, align 8
  %30 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %31 = load i8**, i8*** %30, align 8
  %32 = load i8*, i8** %31, align 8
  %xtraiter = and i32 %27, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %33 = getelementptr inbounds i8, i8* %29, i64 1
  %34 = load i8, i8* %29, align 1
  %promoted.prol = zext i8 %34 to i64
  %35 = getelementptr inbounds i8, i8* %5, i64 %promoted.prol
  %36 = load i8, i8* %35, align 1
  %37 = getelementptr inbounds i8, i8* %32, i64 1
  store i8 %36, i8* %32, align 1
  %38 = getelementptr inbounds i8, i8* %29, i64 2
  %39 = load i8, i8* %33, align 1
  %promoted1.prol = zext i8 %39 to i64
  %40 = getelementptr inbounds i8, i8* %5, i64 %promoted1.prol
  %41 = load i8, i8* %40, align 1
  %42 = getelementptr inbounds i8, i8* %32, i64 2
  store i8 %41, i8* %37, align 1
  %43 = getelementptr inbounds i8, i8* %29, i64 3
  %44 = load i8, i8* %38, align 1
  %promoted2.prol = zext i8 %44 to i64
  %45 = getelementptr inbounds i8, i8* %5, i64 %promoted2.prol
  %46 = load i8, i8* %45, align 1
  %47 = getelementptr inbounds i8, i8* %32, i64 3
  store i8 %46, i8* %42, align 1
  %48 = add i32 %27, -1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %.unr = phi i32 [ %27, %.lr.ph ], [ %48, %.prol.preheader ]
  %.unr10 = phi i8* [ %32, %.lr.ph ], [ %47, %.prol.preheader ]
  %.unr11 = phi i8* [ %29, %.lr.ph ], [ %43, %.prol.preheader ]
  %49 = icmp eq i32 %27, 1
  br i1 %49, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %50 = phi i32 [ %83, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %51 = phi i8* [ %82, %.lr.ph.new ], [ %.unr10, %.lr.ph.new.preheader ]
  %52 = phi i8* [ %78, %.lr.ph.new ], [ %.unr11, %.lr.ph.new.preheader ]
  %53 = getelementptr inbounds i8, i8* %52, i64 1
  %54 = load i8, i8* %52, align 1
  %promoted = zext i8 %54 to i64
  %55 = getelementptr inbounds i8, i8* %5, i64 %promoted
  %56 = load i8, i8* %55, align 1
  %57 = getelementptr inbounds i8, i8* %51, i64 1
  store i8 %56, i8* %51, align 1
  %58 = getelementptr inbounds i8, i8* %52, i64 2
  %59 = load i8, i8* %53, align 1
  %promoted1 = zext i8 %59 to i64
  %60 = getelementptr inbounds i8, i8* %5, i64 %promoted1
  %61 = load i8, i8* %60, align 1
  %62 = getelementptr inbounds i8, i8* %51, i64 2
  store i8 %61, i8* %57, align 1
  %63 = getelementptr inbounds i8, i8* %52, i64 3
  %64 = load i8, i8* %58, align 1
  %promoted2 = zext i8 %64 to i64
  %65 = getelementptr inbounds i8, i8* %5, i64 %promoted2
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds i8, i8* %51, i64 3
  store i8 %66, i8* %62, align 1
  %68 = getelementptr inbounds i8, i8* %52, i64 4
  %69 = load i8, i8* %63, align 1
  %promoted.1 = zext i8 %69 to i64
  %70 = getelementptr inbounds i8, i8* %5, i64 %promoted.1
  %71 = load i8, i8* %70, align 1
  %72 = getelementptr inbounds i8, i8* %51, i64 4
  store i8 %71, i8* %67, align 1
  %73 = getelementptr inbounds i8, i8* %52, i64 5
  %74 = load i8, i8* %68, align 1
  %promoted1.1 = zext i8 %74 to i64
  %75 = getelementptr inbounds i8, i8* %5, i64 %promoted1.1
  %76 = load i8, i8* %75, align 1
  %77 = getelementptr inbounds i8, i8* %51, i64 5
  store i8 %76, i8* %72, align 1
  %78 = getelementptr inbounds i8, i8* %52, i64 6
  %79 = load i8, i8* %73, align 1
  %promoted2.1 = zext i8 %79 to i64
  %80 = getelementptr inbounds i8, i8* %5, i64 %promoted2.1
  %81 = load i8, i8* %80, align 1
  %82 = getelementptr inbounds i8, i8* %51, i64 6
  store i8 %81, i8* %77, align 1
  %83 = add i32 %50, -2
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %25
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @pbm_getc(%struct._IO_FILE*) unnamed_addr #0 {
  %2 = tail call i32 @_IO_getc(%struct._IO_FILE* %0) #3
  %3 = icmp eq i32 %2, 35
  br i1 %3, label %.preheader.preheader, label %.loopexit

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %0) #3
  switch i32 %4, label %.preheader [
    i32 -1, label %.loopexit.loopexit
    i32 10, label %.loopexit.loopexit
  ]

.loopexit.loopexit:                               ; preds = %.preheader, %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  %5 = phi i32 [ %2, %1 ], [ %4, %.loopexit.loopexit ]
  ret i32 %5
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
