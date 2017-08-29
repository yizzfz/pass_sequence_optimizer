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
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 80) #3
  %8 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_ppm, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %8, align 8
  %9 = getelementptr inbounds i8, i8* %7, i64 16
  %10 = bitcast i8* %9 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_ppm, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %10, align 8
  %11 = bitcast i8* %7 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %11
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_ppm(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = tail call i32 @_IO_getc(%struct._IO_FILE* %4)
  %6 = icmp eq i32 %5, 80
  br i1 %6, label %15, label %7

; <label>:7:                                      ; preds = %2
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 1027, i32* %10, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %12 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %11, align 8
  %13 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %12, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %13(%struct.jpeg_common_struct* %14) #3
  br label %15

; <label>:15:                                     ; preds = %2, %7
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr20 = add i64 %sunkaddr, 24
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to %struct._IO_FILE**
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr21, align 8
  %17 = tail call i32 @_IO_getc(%struct._IO_FILE* %16)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr21, align 8
  %19 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %18)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr21, align 8
  %21 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %20)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr21, align 8
  %23 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %22)
  %24 = icmp eq i32 %19, 0
  %25 = icmp eq i32 %21, 0
  %or.cond = or i1 %24, %25
  %26 = icmp eq i32 %23, 0
  %or.cond8 = or i1 %or.cond, %26
  br i1 %or.cond8, label %27, label %35

; <label>:27:                                     ; preds = %15
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i64 0, i32 5
  store i32 1027, i32* %30, align 8
  %31 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %32 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %31, align 8
  %33 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %32, align 8
  %34 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %33(%struct.jpeg_common_struct* %34) #3
  br label %35

; <label>:35:                                     ; preds = %15, %27
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  store i32 8, i32* %36, align 8
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  store i32 %19, i32* %37, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  store i32 %21, i32* %38, align 4
  switch i32 %17, label %107 [
    i32 50, label %39
    i32 51, label %53
    i32 53, label %67
    i32 54, label %87
  ]

; <label>:39:                                     ; preds = %35
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 1, i32* %40, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 1, i32* %41, align 4
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 5
  store i32 1029, i32* %44, align 8
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %46, align 4
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 6, i32 0, i64 1
  store i32 %21, i32* %48, align 4
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i64 0, i32 1
  %51 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %50, align 8
  %52 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %51(%struct.jpeg_common_struct* %52, i32 1) #3
  br label %.thread.sink.split

; <label>:53:                                     ; preds = %35
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 3, i32* %54, align 8
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 2, i32* %55, align 4
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %57 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %57, i64 0, i32 5
  store i32 1031, i32* %58, align 8
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %60, align 4
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i64 0, i32 6, i32 0, i64 1
  store i32 %21, i32* %62, align 4
  %63 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %56, align 8
  %64 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %63, i64 0, i32 1
  %65 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %64, align 8
  %66 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %65(%struct.jpeg_common_struct* %66, i32 1) #3
  br label %.thread.sink.split

; <label>:67:                                     ; preds = %35
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 1, i32* %68, align 8
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 1, i32* %69, align 4
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 5
  store i32 1028, i32* %72, align 8
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %74, align 4
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i64 0, i32 6, i32 0, i64 1
  store i32 %21, i32* %76, align 4
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %78 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %77, i64 0, i32 1
  %79 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %78, align 8
  %80 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %79(%struct.jpeg_common_struct* %80, i32 1) #3
  %81 = icmp ugt i32 %23, 255
  br i1 %81, label %82, label %84

; <label>:82:                                     ; preds = %67
  %83 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_word_gray_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %83, align 8
  br label %select.unfold

; <label>:84:                                     ; preds = %67
  %85 = icmp eq i32 %23, 255
  %86 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  %get_scaled_gray_row.sink = select i1 %85, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_raw_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_scaled_gray_row
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %get_scaled_gray_row.sink, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %86, align 8
  %not.19 = xor i1 %85, true
  br label %select.unfold

; <label>:87:                                     ; preds = %35
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 3, i32* %88, align 8
  %89 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 2, i32* %89, align 4
  %90 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %91 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %90, align 8
  %92 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %91, i64 0, i32 5
  store i32 1030, i32* %92, align 8
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %90, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i64 0, i32 6, i32 0, i64 0
  store i32 %19, i32* %94, align 4
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %90, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i64 0, i32 6, i32 0, i64 1
  store i32 %21, i32* %96, align 4
  %97 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %90, align 8
  %98 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %97, i64 0, i32 1
  %99 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %98, align 8
  %100 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %99(%struct.jpeg_common_struct* %100, i32 1) #3
  %101 = icmp ugt i32 %23, 255
  br i1 %101, label %102, label %104

; <label>:102:                                    ; preds = %87
  %103 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_word_rgb_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %103, align 8
  br label %select.unfold

; <label>:104:                                    ; preds = %87
  %105 = icmp eq i32 %23, 255
  %106 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  %get_scaled_rgb_row.sink = select i1 %105, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_raw_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_scaled_rgb_row
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %get_scaled_rgb_row.sink, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %106, align 8
  %not. = xor i1 %105, true
  br label %select.unfold

; <label>:107:                                    ; preds = %35
  %108 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %108, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i64 0, i32 5
  store i32 1027, i32* %110, align 8
  %111 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %112 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %111, align 8
  %113 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %112, align 8
  %114 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %113(%struct.jpeg_common_struct* %114) #3
  br label %select.unfold

select.unfold:                                    ; preds = %104, %84, %102, %82, %107
  %.46.ph.shrunk = phi i1 [ false, %102 ], [ false, %82 ], [ false, %107 ], [ %105, %104 ], [ %85, %84 ]
  %.4.ph.shrunk = phi i1 [ true, %102 ], [ true, %82 ], [ true, %107 ], [ %not., %104 ], [ %not.19, %84 ]
  %.4.ph = zext i1 %.4.ph.shrunk to i32
  %115 = zext i32 %19 to i64
  %116 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %117 = load i32, i32* %116, align 8
  %118 = sext i32 %117 to i64
  %119 = icmp ult i32 %23, 256
  %120 = select i1 %119, i64 1, i64 2
  %121 = mul nuw nsw i64 %120, %115
  %122 = mul i64 %121, %118
  %123 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %124 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %123 to i64*
  store i64 %122, i64* %124, align 8
  %125 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %126 = bitcast %struct.jpeg_memory_mgr** %125 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %127 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %126, align 8
  %128 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %127, align 8
  %129 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %130 = tail call i8* %128(%struct.jpeg_common_struct* %129, i32 1, i64 %122) #3
  %131 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1
  %132 = bitcast %struct.cjpeg_source_struct* %131 to i8**
  store i8* %130, i8** %132, align 8
  br i1 %.46.ph.shrunk, label %133, label %.thread

; <label>:133:                                    ; preds = %select.unfold
  %134 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1
  %135 = bitcast %struct.cjpeg_source_struct* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %138 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %137 to i64*
  store i64 %136, i64* %138, align 8
  %139 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %140 = bitcast i8*** %139 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)***
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %137, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*** %140, align 8
  br label %152

.thread.sink.split:                               ; preds = %53, %39
  %get_text_gray_row.sink = phi i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* [ @get_text_gray_row, %39 ], [ @get_text_rgb_row, %53 ]
  %141 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %get_text_gray_row.sink, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %141, align 8
  br label %.thread

.thread:                                          ; preds = %select.unfold, %.thread.sink.split
  %.41114 = phi i32 [ %.4.ph, %select.unfold ], [ 1, %.thread.sink.split ]
  %142 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %143 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %143, i64 0, i32 2
  %145 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %144, align 8
  %146 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %147 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %148 = load i32, i32* %147, align 8
  %149 = mul i32 %148, %19
  %150 = tail call i8** %145(%struct.jpeg_common_struct* %146, i32 1, i32 %149, i32 1) #3
  %151 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  store i8** %150, i8*** %151, align 8
  br label %152

; <label>:152:                                    ; preds = %.thread, %133
  %.41113 = phi i32 [ %.41114, %.thread ], [ %.4.ph, %133 ]
  %153 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 5
  store i32 1, i32* %153, align 8
  %154 = icmp eq i32 %.41113, 0
  br i1 %154, label %.loopexit, label %155

; <label>:155:                                    ; preds = %152
  %156 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %157 = bitcast %struct.jpeg_memory_mgr** %156 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %158 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %157, align 8
  %159 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %158, align 8
  %160 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %161 = zext i32 %23 to i64
  %162 = add nuw nsw i64 %161, 1
  %163 = tail call i8* %159(%struct.jpeg_common_struct* %160, i32 1, i64 %162) #3
  %164 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %165 = bitcast %struct._IO_FILE** %164 to i8**
  store i8* %163, i8** %165, align 8
  %166 = lshr i32 %23, 1
  %167 = zext i32 %166 to i64
  %168 = add nuw nsw i64 %161, 1
  %xtraiter = and i64 %168, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %155
  %div = udiv i32 %166, %23
  %169 = trunc i32 %div to i8
  %sunkaddr26 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 72
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to i8**
  %170 = load i8*, i8** %sunkaddr28, align 8
  store i8 %169, i8* %170, align 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %155, %.prol.preheader
  %.025.unr = phi i64 [ 0, %155 ], [ 1, %.prol.preheader ]
  %171 = icmp eq i32 %23, 0
  br i1 %171, label %.loopexit, label %.new.preheader

.new.preheader:                                   ; preds = %.prol.loopexit
  %sunkaddr29 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 72
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to i8**
  br label %.new

.new:                                             ; preds = %.new.preheader, %.new
  %.025 = phi i64 [ %185, %.new ], [ %.025.unr, %.new.preheader ]
  %172 = mul nuw nsw i64 %.025, 255
  %173 = add nuw nsw i64 %172, %167
  %174 = sdiv i64 %173, %161
  %175 = trunc i64 %174 to i8
  %176 = load i8*, i8** %sunkaddr31, align 8
  %177 = getelementptr inbounds i8, i8* %176, i64 %.025
  store i8 %175, i8* %177, align 1
  %178 = add nuw nsw i64 %.025, 1
  %179 = mul nuw nsw i64 %178, 255
  %180 = add nuw nsw i64 %179, %167
  %181 = sdiv i64 %180, %161
  %182 = trunc i64 %181 to i8
  %183 = load i8*, i8** %sunkaddr31, align 8
  %184 = getelementptr inbounds i8, i8* %183, i64 %178
  store i8 %182, i8* %184, align 1
  %185 = add nsw i64 %.025, 2
  %exitcond.1 = icmp eq i64 %185, %168
  br i1 %exitcond.1, label %.loopexit.loopexit, label %.new

.loopexit.loopexit:                               ; preds = %.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.prol.loopexit, %152
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @finish_input_ppm(%struct.jpeg_compress_struct* nocapture, %struct.cjpeg_source_struct* nocapture) #1 {
  ret void
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct*, %struct._IO_FILE* nocapture) unnamed_addr #0 {
  br label %.critedge

.critedge:                                        ; preds = %.critedge.backedge, %2
  %3 = tail call fastcc i32 @pbm_getc(%struct._IO_FILE* %1)
  switch i32 %3, label %11 [
    i32 -1, label %.thread
    i32 32, label %.critedge.backedge
    i32 9, label %.critedge.backedge
    i32 10, label %.critedge.backedge
    i32 13, label %.critedge.backedge
  ]

.critedge.backedge:                               ; preds = %.critedge, %.critedge, %.critedge, %.critedge
  br label %.critedge

.thread:                                          ; preds = %.critedge
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %5 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %5, i64 0, i32 5
  store i32 42, i32* %6, align 8
  %7 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %8 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %7, align 8
  %9 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %8, align 8
  %10 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %9(%struct.jpeg_common_struct* %10) #3
  br label %13

; <label>:11:                                     ; preds = %.critedge
  %.off3 = add i32 %3, -48
  %12 = icmp ugt i32 %.off3, 9
  br i1 %12, label %13, label %21

; <label>:13:                                     ; preds = %.thread, %11
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 5
  store i32 1026, i32* %16, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %18 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %17, align 8
  %19 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %18, align 8
  %20 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %19(%struct.jpeg_common_struct* %20) #3
  br label %21

; <label>:21:                                     ; preds = %11, %13
  %22 = add nsw i32 %3, -48
  %23 = tail call fastcc i32 @pbm_getc(%struct._IO_FILE* %1)
  %.off5 = add i32 %23, -48
  %24 = icmp ult i32 %.off5, 10
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %21
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %25 = phi i32 [ %29, %.lr.ph ], [ %23, %.lr.ph.preheader ]
  %.06 = phi i32 [ %28, %.lr.ph ], [ %22, %.lr.ph.preheader ]
  %26 = mul i32 %.06, 10
  %27 = add nsw i32 %25, -48
  %28 = add i32 %27, %26
  %29 = tail call fastcc i32 @pbm_getc(%struct._IO_FILE* %1)
  %.off = add i32 %29, -48
  %30 = icmp ult i32 %.off, 10
  br i1 %30, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %21
  %.0.lcssa = phi i32 [ %22, %21 ], [ %28, %._crit_edge.loopexit ]
  ret i32 %.0.lcssa
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
  br i1 %10, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  %11 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %12 = load i8**, i8*** %11, align 8
  %13 = load i8*, i8** %12, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %19, %.lr.ph ], [ %9, %.lr.ph.preheader ]
  %.012 = phi i8* [ %18, %.lr.ph ], [ %13, %.lr.ph.preheader ]
  %14 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %4)
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %7, i64 %15
  %17 = load i8, i8* %16, align 1
  store i8 %17, i8* %.012, align 1
  %18 = getelementptr inbounds i8, i8* %.012, i64 1
  %19 = add i32 %.03, -1
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
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
  br i1 %10, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  %11 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %12 = load i8**, i8*** %11, align 8
  %13 = load i8*, i8** %12, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %29, %.lr.ph ], [ %9, %.lr.ph.preheader ]
  %.012 = phi i8* [ %28, %.lr.ph ], [ %13, %.lr.ph.preheader ]
  %14 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %4)
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %7, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = getelementptr inbounds i8, i8* %.012, i64 1
  store i8 %17, i8* %.012, align 1
  %19 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %4)
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i8, i8* %7, i64 %20
  %22 = load i8, i8* %21, align 1
  %23 = getelementptr inbounds i8, i8* %.012, i64 2
  store i8 %22, i8* %18, align 1
  %24 = tail call fastcc i32 @read_pbm_integer(%struct.jpeg_compress_struct* %0, %struct._IO_FILE* %4)
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i8, i8* %7, i64 %25
  %27 = load i8, i8* %26, align 1
  store i8 %27, i8* %23, align 1
  %28 = getelementptr inbounds i8, i8* %.012, i64 3
  %29 = add i32 %.03, -1
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
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
  %14 = tail call i64 @fread(i8* %8, i64 1, i64 %11, %struct._IO_FILE* %13)
  %15 = load i64, i64* %10, align 8
  %16 = icmp eq i64 %14, %15
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 42, i32* %20, align 8
  %21 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %22 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %21, align 8
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %23(%struct.jpeg_common_struct* %24) #3
  br label %25

; <label>:25:                                     ; preds = %17, %2
  %26 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %27 = load i8**, i8*** %26, align 8
  %28 = load i8*, i8** %27, align 8
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr3 = add i64 %sunkaddr, 48
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i8**
  %29 = load i8*, i8** %sunkaddr4, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %31 = load i32, i32* %30, align 8
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %25
  %xtraiter = and i32 %31, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %33 = getelementptr inbounds i8, i8* %29, i64 1
  %34 = load i8, i8* %29, align 1
  %35 = zext i8 %34 to i64
  %36 = load i8, i8* %33, align 1
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 8
  %39 = or i64 %38, %35
  %40 = getelementptr inbounds i8, i8* %5, i64 %39
  %41 = load i8, i8* %40, align 1
  store i8 %41, i8* %28, align 1
  %42 = getelementptr inbounds i8, i8* %28, i64 1
  %43 = getelementptr inbounds i8, i8* %29, i64 2
  %44 = add i32 %31, -1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.07.unr = phi i32 [ %31, %.lr.ph.preheader ], [ %44, %.lr.ph.prol ]
  %.016.unr = phi i8* [ %29, %.lr.ph.preheader ], [ %43, %.lr.ph.prol ]
  %.025.unr = phi i8* [ %28, %.lr.ph.preheader ], [ %42, %.lr.ph.prol ]
  %45 = icmp eq i32 %31, 1
  br i1 %45, label %._crit_edge, label %.lr.ph.preheader10

.lr.ph.preheader10:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader10, %.lr.ph
  %.07 = phi i32 [ %68, %.lr.ph ], [ %.07.unr, %.lr.ph.preheader10 ]
  %.016 = phi i8* [ %67, %.lr.ph ], [ %.016.unr, %.lr.ph.preheader10 ]
  %.025 = phi i8* [ %66, %.lr.ph ], [ %.025.unr, %.lr.ph.preheader10 ]
  %46 = getelementptr inbounds i8, i8* %.016, i64 1
  %47 = load i8, i8* %.016, align 1
  %48 = zext i8 %47 to i64
  %49 = load i8, i8* %46, align 1
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 8
  %52 = or i64 %51, %48
  %53 = getelementptr inbounds i8, i8* %5, i64 %52
  %54 = load i8, i8* %53, align 1
  store i8 %54, i8* %.025, align 1
  %55 = getelementptr inbounds i8, i8* %.025, i64 1
  %56 = getelementptr inbounds i8, i8* %.016, i64 2
  %57 = getelementptr inbounds i8, i8* %.016, i64 3
  %58 = load i8, i8* %56, align 1
  %59 = zext i8 %58 to i64
  %60 = load i8, i8* %57, align 1
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 8
  %63 = or i64 %62, %59
  %64 = getelementptr inbounds i8, i8* %5, i64 %63
  %65 = load i8, i8* %64, align 1
  store i8 %65, i8* %55, align 1
  %66 = getelementptr inbounds i8, i8* %.025, i64 2
  %67 = getelementptr inbounds i8, i8* %.016, i64 4
  %68 = add i32 %.07, -2
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %25
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
  %11 = tail call i64 @fread(i8* %5, i64 1, i64 %8, %struct._IO_FILE* %10)
  %12 = load i64, i64* %7, align 8
  %13 = icmp eq i64 %11, %12
  br i1 %13, label %22, label %14

; <label>:14:                                     ; preds = %2
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i64 0, i32 5
  store i32 42, i32* %17, align 8
  %18 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %19 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %18, align 8
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  %21 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %20(%struct.jpeg_common_struct* %21) #3
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
  %14 = tail call i64 @fread(i8* %8, i64 1, i64 %11, %struct._IO_FILE* %13)
  %15 = load i64, i64* %10, align 8
  %16 = icmp eq i64 %14, %15
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 42, i32* %20, align 8
  %21 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %22 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %21, align 8
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %23(%struct.jpeg_common_struct* %24) #3
  br label %25

; <label>:25:                                     ; preds = %17, %2
  %26 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %27 = load i8**, i8*** %26, align 8
  %28 = load i8*, i8** %27, align 8
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr3 = add i64 %sunkaddr, 48
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i8**
  %29 = load i8*, i8** %sunkaddr4, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %31 = load i32, i32* %30, align 8
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %25
  %33 = add i32 %31, -1
  %xtraiter = and i32 %31, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.07.prol = phi i32 [ %40, %.lr.ph.prol ], [ %31, %.lr.ph.prol.preheader ]
  %.016.prol = phi i8* [ %39, %.lr.ph.prol ], [ %29, %.lr.ph.prol.preheader ]
  %.025.prol = phi i8* [ %38, %.lr.ph.prol ], [ %28, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %34 = load i8, i8* %.016.prol, align 1
  %35 = zext i8 %34 to i64
  %36 = getelementptr inbounds i8, i8* %5, i64 %35
  %37 = load i8, i8* %36, align 1
  store i8 %37, i8* %.025.prol, align 1
  %38 = getelementptr inbounds i8, i8* %.025.prol, i64 1
  %39 = getelementptr inbounds i8, i8* %.016.prol, i64 1
  %40 = add i32 %.07.prol, -1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.07.unr = phi i32 [ %31, %.lr.ph.preheader ], [ %40, %.lr.ph.prol.loopexit.loopexit ]
  %.016.unr = phi i8* [ %29, %.lr.ph.preheader ], [ %39, %.lr.ph.prol.loopexit.loopexit ]
  %.025.unr = phi i8* [ %28, %.lr.ph.preheader ], [ %38, %.lr.ph.prol.loopexit.loopexit ]
  %41 = icmp ult i32 %33, 3
  br i1 %41, label %._crit_edge, label %.lr.ph.preheader14

.lr.ph.preheader14:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader14, %.lr.ph
  %.07 = phi i32 [ %66, %.lr.ph ], [ %.07.unr, %.lr.ph.preheader14 ]
  %.016 = phi i8* [ %65, %.lr.ph ], [ %.016.unr, %.lr.ph.preheader14 ]
  %.025 = phi i8* [ %64, %.lr.ph ], [ %.025.unr, %.lr.ph.preheader14 ]
  %42 = load i8, i8* %.016, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds i8, i8* %5, i64 %43
  %45 = load i8, i8* %44, align 1
  store i8 %45, i8* %.025, align 1
  %46 = getelementptr inbounds i8, i8* %.025, i64 1
  %47 = getelementptr inbounds i8, i8* %.016, i64 1
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i64
  %50 = getelementptr inbounds i8, i8* %5, i64 %49
  %51 = load i8, i8* %50, align 1
  store i8 %51, i8* %46, align 1
  %52 = getelementptr inbounds i8, i8* %.025, i64 2
  %53 = getelementptr inbounds i8, i8* %.016, i64 2
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i64
  %56 = getelementptr inbounds i8, i8* %5, i64 %55
  %57 = load i8, i8* %56, align 1
  store i8 %57, i8* %52, align 1
  %58 = getelementptr inbounds i8, i8* %.025, i64 3
  %59 = getelementptr inbounds i8, i8* %.016, i64 3
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds i8, i8* %5, i64 %61
  %63 = load i8, i8* %62, align 1
  store i8 %63, i8* %58, align 1
  %64 = getelementptr inbounds i8, i8* %.025, i64 4
  %65 = getelementptr inbounds i8, i8* %.016, i64 4
  %66 = add i32 %.07, -4
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %25
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
  %14 = tail call i64 @fread(i8* %8, i64 1, i64 %11, %struct._IO_FILE* %13)
  %15 = load i64, i64* %10, align 8
  %16 = icmp eq i64 %14, %15
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 42, i32* %20, align 8
  %21 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %22 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %21, align 8
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %23(%struct.jpeg_common_struct* %24) #3
  br label %25

; <label>:25:                                     ; preds = %17, %2
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %25
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr3 = add i64 %sunkaddr, 48
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i8**
  %29 = load i8*, i8** %sunkaddr4, align 8
  %30 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %31 = load i8**, i8*** %30, align 8
  %32 = load i8*, i8** %31, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.07 = phi i32 [ %66, %.lr.ph ], [ %27, %.lr.ph.preheader ]
  %.016 = phi i8* [ %65, %.lr.ph ], [ %29, %.lr.ph.preheader ]
  %.025 = phi i8* [ %64, %.lr.ph ], [ %32, %.lr.ph.preheader ]
  %33 = getelementptr inbounds i8, i8* %.016, i64 1
  %34 = load i8, i8* %.016, align 1
  %35 = zext i8 %34 to i64
  %36 = getelementptr inbounds i8, i8* %.016, i64 2
  %37 = load i8, i8* %33, align 1
  %38 = zext i8 %37 to i64
  %39 = shl nuw nsw i64 %38, 8
  %40 = or i64 %39, %35
  %41 = getelementptr inbounds i8, i8* %5, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = getelementptr inbounds i8, i8* %.025, i64 1
  store i8 %42, i8* %.025, align 1
  %44 = getelementptr inbounds i8, i8* %.016, i64 3
  %45 = load i8, i8* %36, align 1
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds i8, i8* %.016, i64 4
  %48 = load i8, i8* %44, align 1
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 8
  %51 = or i64 %50, %46
  %52 = getelementptr inbounds i8, i8* %5, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = getelementptr inbounds i8, i8* %.025, i64 2
  store i8 %53, i8* %43, align 1
  %55 = getelementptr inbounds i8, i8* %.016, i64 5
  %56 = load i8, i8* %47, align 1
  %57 = zext i8 %56 to i64
  %58 = load i8, i8* %55, align 1
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 8
  %61 = or i64 %60, %57
  %62 = getelementptr inbounds i8, i8* %5, i64 %61
  %63 = load i8, i8* %62, align 1
  store i8 %63, i8* %54, align 1
  %64 = getelementptr inbounds i8, i8* %.025, i64 3
  %65 = getelementptr inbounds i8, i8* %.016, i64 6
  %66 = add i32 %.07, -1
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
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
  %14 = tail call i64 @fread(i8* %8, i64 1, i64 %11, %struct._IO_FILE* %13)
  %15 = load i64, i64* %10, align 8
  %16 = icmp eq i64 %14, %15
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 42, i32* %20, align 8
  %21 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %22 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %21, align 8
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  %24 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %23(%struct.jpeg_common_struct* %24) #3
  br label %25

; <label>:25:                                     ; preds = %17, %2
  %26 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %27 = load i8**, i8*** %26, align 8
  %28 = load i8*, i8** %27, align 8
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr3 = add i64 %sunkaddr, 48
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i8**
  %29 = load i8*, i8** %sunkaddr4, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %31 = load i32, i32* %30, align 8
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %25
  %xtraiter = and i32 %31, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %33 = getelementptr inbounds i8, i8* %29, i64 1
  %34 = load i8, i8* %29, align 1
  %35 = zext i8 %34 to i64
  %36 = getelementptr inbounds i8, i8* %5, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = getelementptr inbounds i8, i8* %28, i64 1
  store i8 %37, i8* %28, align 1
  %39 = getelementptr inbounds i8, i8* %29, i64 2
  %40 = load i8, i8* %33, align 1
  %41 = zext i8 %40 to i64
  %42 = getelementptr inbounds i8, i8* %5, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = getelementptr inbounds i8, i8* %28, i64 2
  store i8 %43, i8* %38, align 1
  %45 = load i8, i8* %39, align 1
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds i8, i8* %5, i64 %46
  %48 = load i8, i8* %47, align 1
  store i8 %48, i8* %44, align 1
  %49 = getelementptr inbounds i8, i8* %28, i64 3
  %50 = getelementptr inbounds i8, i8* %29, i64 3
  %51 = add i32 %31, -1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.07.unr = phi i32 [ %31, %.lr.ph.preheader ], [ %51, %.lr.ph.prol ]
  %.016.unr = phi i8* [ %29, %.lr.ph.preheader ], [ %50, %.lr.ph.prol ]
  %.025.unr = phi i8* [ %28, %.lr.ph.preheader ], [ %49, %.lr.ph.prol ]
  %52 = icmp eq i32 %31, 1
  br i1 %52, label %._crit_edge, label %.lr.ph.preheader10

.lr.ph.preheader10:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader10, %.lr.ph
  %.07 = phi i32 [ %89, %.lr.ph ], [ %.07.unr, %.lr.ph.preheader10 ]
  %.016 = phi i8* [ %88, %.lr.ph ], [ %.016.unr, %.lr.ph.preheader10 ]
  %.025 = phi i8* [ %87, %.lr.ph ], [ %.025.unr, %.lr.ph.preheader10 ]
  %53 = getelementptr inbounds i8, i8* %.016, i64 1
  %54 = load i8, i8* %.016, align 1
  %55 = zext i8 %54 to i64
  %56 = getelementptr inbounds i8, i8* %5, i64 %55
  %57 = load i8, i8* %56, align 1
  %58 = getelementptr inbounds i8, i8* %.025, i64 1
  store i8 %57, i8* %.025, align 1
  %59 = getelementptr inbounds i8, i8* %.016, i64 2
  %60 = load i8, i8* %53, align 1
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds i8, i8* %5, i64 %61
  %63 = load i8, i8* %62, align 1
  %64 = getelementptr inbounds i8, i8* %.025, i64 2
  store i8 %63, i8* %58, align 1
  %65 = load i8, i8* %59, align 1
  %66 = zext i8 %65 to i64
  %67 = getelementptr inbounds i8, i8* %5, i64 %66
  %68 = load i8, i8* %67, align 1
  store i8 %68, i8* %64, align 1
  %69 = getelementptr inbounds i8, i8* %.025, i64 3
  %70 = getelementptr inbounds i8, i8* %.016, i64 3
  %71 = getelementptr inbounds i8, i8* %.016, i64 4
  %72 = load i8, i8* %70, align 1
  %73 = zext i8 %72 to i64
  %74 = getelementptr inbounds i8, i8* %5, i64 %73
  %75 = load i8, i8* %74, align 1
  %76 = getelementptr inbounds i8, i8* %.025, i64 4
  store i8 %75, i8* %69, align 1
  %77 = getelementptr inbounds i8, i8* %.016, i64 5
  %78 = load i8, i8* %71, align 1
  %79 = zext i8 %78 to i64
  %80 = getelementptr inbounds i8, i8* %5, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = getelementptr inbounds i8, i8* %.025, i64 5
  store i8 %81, i8* %76, align 1
  %83 = load i8, i8* %77, align 1
  %84 = zext i8 %83 to i64
  %85 = getelementptr inbounds i8, i8* %5, i64 %84
  %86 = load i8, i8* %85, align 1
  store i8 %86, i8* %82, align 1
  %87 = getelementptr inbounds i8, i8* %.025, i64 6
  %88 = getelementptr inbounds i8, i8* %.016, i64 6
  %89 = add i32 %.07, -2
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %25
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @pbm_getc(%struct._IO_FILE* nocapture) unnamed_addr #0 {
  %2 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %3 = icmp eq i32 %2, 35
  br i1 %3, label %.preheader.preheader, label %.loopexit

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  switch i32 %4, label %.preheader [
    i32 -1, label %.loopexit.loopexit
    i32 10, label %.loopexit.loopexit
  ]

.loopexit.loopexit:                               ; preds = %.preheader, %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  %.0 = phi i32 [ %2, %1 ], [ %4, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
