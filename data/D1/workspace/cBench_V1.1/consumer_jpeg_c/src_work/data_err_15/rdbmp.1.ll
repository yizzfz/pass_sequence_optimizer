; ModuleID = 'rdbmp.ll'
source_filename = "rdbmp.c"
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
%struct._bmp_source_struct = type { %struct.cjpeg_source_struct, %struct.jpeg_compress_struct*, i8**, %struct.jvirt_sarray_control*, i32, i32, i32 }
%struct.cdjpeg_progress_mgr = type { %struct.jpeg_progress_mgr, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define %struct.cjpeg_source_struct* @jinit_read_bmp(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 88) #3
  %8 = getelementptr inbounds i8, i8* %7, i64 48
  %9 = bitcast i8* %8 to %struct.jpeg_compress_struct**
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_bmp, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 16
  %12 = bitcast i8* %11 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_bmp, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %12, align 8
  %13 = bitcast i8* %7 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %13
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_bmp(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture) #0 {
  %3 = alloca [14 x i8], align 1
  %4 = alloca [64 x i8], align 16
  %5 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %8 = call i64 @fread(i8* nonnull %5, i64 1, i64 14, %struct._IO_FILE* %7)
  %9 = icmp eq i64 %8, 14
  br i1 %9, label %18, label %10

; <label>:10:                                     ; preds = %2
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 42, i32* %13, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %15 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %14, align 8
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %17) #3
  br label %18

; <label>:18:                                     ; preds = %10, %2
  %19 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 0
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 1
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = shl nuw nsw i32 %24, 8
  %26 = or i32 %25, %21
  %27 = icmp eq i32 %26, 19778
  br i1 %27, label %36, label %28

; <label>:28:                                     ; preds = %18
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i64 0, i32 5
  store i32 1007, i32* %31, align 8
  %32 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %33 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %32, align 8
  %34 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %33, align 8
  %35 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %34(%struct.jpeg_common_struct* %35) #3
  br label %36

; <label>:36:                                     ; preds = %18, %28
  %37 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 10
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i64
  %40 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 11
  %41 = load i8, i8* %40, align 1
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 8
  %44 = or i64 %43, %39
  %45 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 12
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 16
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds [14 x i8], [14 x i8]* %3, i64 0, i64 13
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 24
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 0
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr15 = add i64 %sunkaddr, 24
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to %struct._IO_FILE**
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr16, align 8
  %57 = call i64 @fread(i8* nonnull %55, i64 1, i64 4, %struct._IO_FILE* %56)
  %58 = icmp eq i64 %57, 4
  br i1 %58, label %67, label %59

; <label>:59:                                     ; preds = %36
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i64 0, i32 5
  store i32 42, i32* %62, align 8
  %63 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %64 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %63, align 8
  %65 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %64, align 8
  %66 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %65(%struct.jpeg_common_struct* %66) #3
  br label %67

; <label>:67:                                     ; preds = %59, %36
  %68 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 0
  %69 = load i8, i8* %68, align 16
  %70 = zext i8 %69 to i64
  %71 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 1
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 8
  %75 = or i64 %74, %70
  %76 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 2
  %77 = load i8, i8* %76, align 2
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 16
  %80 = or i64 %75, %79
  %81 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 3
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 24
  %85 = or i64 %80, %84
  %.off = add nsw i64 %85, -12
  %86 = icmp ugt i64 %.off, 52
  br i1 %86, label %87, label %95

; <label>:87:                                     ; preds = %67
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %89 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %89, i64 0, i32 5
  store i32 1003, i32* %90, align 8
  %91 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %92 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %91, align 8
  %93 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %92, align 8
  %94 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %93(%struct.jpeg_common_struct* %94) #3
  br label %95

; <label>:95:                                     ; preds = %67, %87
  %96 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 4
  %97 = add nsw i64 %85, -4
  %sunkaddr17 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 24
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to %struct._IO_FILE**
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr19, align 8
  %99 = call i64 @fread(i8* %96, i64 1, i64 %97, %struct._IO_FILE* %98)
  %100 = icmp eq i64 %99, %97
  br i1 %100, label %109, label %101

; <label>:101:                                    ; preds = %95
  %102 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %103 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %102, align 8
  %104 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %103, i64 0, i32 5
  store i32 42, i32* %104, align 8
  %105 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %106 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %105, align 8
  %107 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %106, align 8
  %108 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %107(%struct.jpeg_common_struct* %108) #3
  br label %109

; <label>:109:                                    ; preds = %101, %95
  %110 = trunc i64 %85 to i32
  switch i32 %110, label %.thread [
    i32 12, label %111
    i32 40, label %191
    i32 64, label %191
  ]

; <label>:111:                                    ; preds = %109
  %sunkaddr20 = ptrtoint [64 x i8]* %4 to i64
  %sunkaddr21 = or i64 %sunkaddr20, 4
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to i8*
  %112 = load i8, i8* %sunkaddr22, align 4
  %113 = zext i8 %112 to i64
  %114 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 5
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 8
  %118 = or i64 %117, %113
  %119 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 6
  %120 = load i8, i8* %119, align 2
  %121 = zext i8 %120 to i64
  %122 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 7
  %123 = load i8, i8* %122, align 1
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 8
  %126 = or i64 %125, %121
  %127 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 8
  %128 = load i8, i8* %127, align 8
  %129 = zext i8 %128 to i32
  %130 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 9
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i32
  %133 = shl nuw nsw i32 %132, 8
  %134 = or i32 %133, %129
  %135 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 10
  %136 = load i8, i8* %135, align 2
  %137 = zext i8 %136 to i32
  %138 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 11
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = shl nuw nsw i32 %140, 8
  %142 = or i32 %141, %137
  %143 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 4
  %144 = bitcast i8*** %143 to i32*
  store i32 %142, i32* %144, align 8
  %trunc = trunc i32 %142 to i16
  switch i16 %trunc, label %173 [
    i16 8, label %145
    i16 24, label %159
  ]

; <label>:145:                                    ; preds = %111
  %146 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %147 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %146, align 8
  %148 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %147, i64 0, i32 5
  store i32 1011, i32* %148, align 8
  %149 = trunc i64 %118 to i32
  %150 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %146, align 8
  %151 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %150, i64 0, i32 6, i32 0, i64 0
  store i32 %149, i32* %151, align 4
  %152 = trunc i64 %126 to i32
  %153 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %146, align 8
  %154 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i64 0, i32 6, i32 0, i64 1
  store i32 %152, i32* %154, align 4
  %155 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %146, align 8
  %156 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %155, i64 0, i32 1
  %157 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %156, align 8
  %158 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %157(%struct.jpeg_common_struct* %158, i32 1) #3
  br label %181

; <label>:159:                                    ; preds = %111
  %160 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %161 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %160, align 8
  %162 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %161, i64 0, i32 5
  store i32 1010, i32* %162, align 8
  %163 = trunc i64 %118 to i32
  %164 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %160, align 8
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %164, i64 0, i32 6, i32 0, i64 0
  store i32 %163, i32* %165, align 4
  %166 = trunc i64 %126 to i32
  %167 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %160, align 8
  %168 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %167, i64 0, i32 6, i32 0, i64 1
  store i32 %166, i32* %168, align 4
  %169 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %160, align 8
  %170 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %169, i64 0, i32 1
  %171 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %170, align 8
  %172 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %171(%struct.jpeg_common_struct* %172, i32 1) #3
  br label %181

; <label>:173:                                    ; preds = %111
  %174 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %175 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %174, align 8
  %176 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %175, i64 0, i32 5
  store i32 1002, i32* %176, align 8
  %177 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %178 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %177, align 8
  %179 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %178, align 8
  %180 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %179(%struct.jpeg_common_struct* %180) #3
  br label %181

; <label>:181:                                    ; preds = %173, %159, %145
  %.03 = phi i32 [ 0, %173 ], [ 0, %159 ], [ 3, %145 ]
  %182 = icmp eq i32 %134, 1
  br i1 %182, label %394, label %183

; <label>:183:                                    ; preds = %181
  %184 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %185 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %184, align 8
  %186 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %185, i64 0, i32 5
  store i32 1004, i32* %186, align 8
  %187 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %188 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %187, align 8
  %189 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %188, align 8
  %190 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %189(%struct.jpeg_common_struct* %190) #3
  br label %394

; <label>:191:                                    ; preds = %109, %109
  %sunkaddr23 = ptrtoint [64 x i8]* %4 to i64
  %sunkaddr24 = or i64 %sunkaddr23, 4
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to i8*
  %192 = load i8, i8* %sunkaddr25, align 4
  %193 = zext i8 %192 to i64
  %194 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 5
  %195 = load i8, i8* %194, align 1
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 8
  %198 = or i64 %197, %193
  %199 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 6
  %200 = load i8, i8* %199, align 2
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 16
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 7
  %205 = load i8, i8* %204, align 1
  %206 = zext i8 %205 to i64
  %207 = shl nuw nsw i64 %206, 24
  %208 = or i64 %203, %207
  %209 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 8
  %210 = load i8, i8* %209, align 8
  %211 = zext i8 %210 to i64
  %212 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 9
  %213 = load i8, i8* %212, align 1
  %214 = zext i8 %213 to i64
  %215 = shl nuw nsw i64 %214, 8
  %216 = or i64 %215, %211
  %217 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 10
  %218 = load i8, i8* %217, align 2
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 16
  %221 = or i64 %216, %220
  %222 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 11
  %223 = load i8, i8* %222, align 1
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 24
  %226 = or i64 %221, %225
  %227 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 12
  %228 = load i8, i8* %227, align 4
  %229 = zext i8 %228 to i32
  %230 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 13
  %231 = load i8, i8* %230, align 1
  %232 = zext i8 %231 to i32
  %233 = shl nuw nsw i32 %232, 8
  %234 = or i32 %233, %229
  %235 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 14
  %236 = load i8, i8* %235, align 2
  %237 = zext i8 %236 to i32
  %238 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 15
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = shl nuw nsw i32 %240, 8
  %242 = or i32 %241, %237
  %243 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 4
  %244 = bitcast i8*** %243 to i32*
  store i32 %242, i32* %244, align 8
  %245 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 16
  %246 = load i8, i8* %245, align 16
  %247 = zext i8 %246 to i64
  %248 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 17
  %249 = load i8, i8* %248, align 1
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 8
  %252 = or i64 %251, %247
  %253 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 18
  %254 = load i8, i8* %253, align 2
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 16
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 19
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 24
  %262 = or i64 %257, %261
  %263 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 24
  %264 = load i8, i8* %263, align 8
  %265 = zext i8 %264 to i64
  %266 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 25
  %267 = load i8, i8* %266, align 1
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 8
  %270 = or i64 %269, %265
  %271 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 26
  %272 = load i8, i8* %271, align 2
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 16
  %275 = or i64 %270, %274
  %276 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 27
  %277 = load i8, i8* %276, align 1
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 24
  %280 = or i64 %275, %279
  %281 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 28
  %282 = load i8, i8* %281, align 4
  %283 = zext i8 %282 to i64
  %284 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 29
  %285 = load i8, i8* %284, align 1
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 8
  %288 = or i64 %287, %283
  %289 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 30
  %290 = load i8, i8* %289, align 2
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 16
  %293 = or i64 %288, %292
  %294 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 31
  %295 = load i8, i8* %294, align 1
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 24
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 32
  %300 = load i8, i8* %299, align 16
  %301 = zext i8 %300 to i64
  %302 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 33
  %303 = load i8, i8* %302, align 1
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 8
  %306 = or i64 %305, %301
  %307 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 34
  %308 = load i8, i8* %307, align 2
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 16
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds [64 x i8], [64 x i8]* %4, i64 0, i64 35
  %313 = load i8, i8* %312, align 1
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 24
  %316 = or i64 %311, %315
  %trunc12 = trunc i32 %242 to i16
  switch i16 %trunc12, label %345 [
    i16 8, label %317
    i16 24, label %331
  ]

; <label>:317:                                    ; preds = %191
  %318 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %319 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %318, align 8
  %320 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %319, i64 0, i32 5
  store i32 1009, i32* %320, align 8
  %321 = trunc i64 %208 to i32
  %322 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %318, align 8
  %323 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %322, i64 0, i32 6, i32 0, i64 0
  store i32 %321, i32* %323, align 4
  %324 = trunc i64 %226 to i32
  %325 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %318, align 8
  %326 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %325, i64 0, i32 6, i32 0, i64 1
  store i32 %324, i32* %326, align 4
  %327 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %318, align 8
  %328 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %327, i64 0, i32 1
  %329 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %328, align 8
  %330 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %329(%struct.jpeg_common_struct* %330, i32 1) #3
  br label %353

; <label>:331:                                    ; preds = %191
  %332 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %333 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %332, align 8
  %334 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %333, i64 0, i32 5
  store i32 1008, i32* %334, align 8
  %335 = trunc i64 %208 to i32
  %336 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %332, align 8
  %337 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %336, i64 0, i32 6, i32 0, i64 0
  store i32 %335, i32* %337, align 4
  %338 = trunc i64 %226 to i32
  %339 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %332, align 8
  %340 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %339, i64 0, i32 6, i32 0, i64 1
  store i32 %338, i32* %340, align 4
  %341 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %332, align 8
  %342 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %341, i64 0, i32 1
  %343 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %342, align 8
  %344 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %343(%struct.jpeg_common_struct* %344, i32 1) #3
  br label %353

; <label>:345:                                    ; preds = %191
  %346 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %347 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %346, align 8
  %348 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %347, i64 0, i32 5
  store i32 1002, i32* %348, align 8
  %349 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %350 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %349, align 8
  %351 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %350, align 8
  %352 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %351(%struct.jpeg_common_struct* %352) #3
  br label %353

; <label>:353:                                    ; preds = %345, %331, %317
  %.14 = phi i32 [ 0, %345 ], [ 0, %331 ], [ 4, %317 ]
  %354 = icmp eq i32 %234, 1
  br i1 %354, label %363, label %355

; <label>:355:                                    ; preds = %353
  %356 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %357 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %356, align 8
  %358 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %357, i64 0, i32 5
  store i32 1004, i32* %358, align 8
  %359 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %360 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %359, align 8
  %361 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %360, align 8
  %362 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %361(%struct.jpeg_common_struct* %362) #3
  br label %363

; <label>:363:                                    ; preds = %353, %355
  %364 = icmp eq i64 %262, 0
  br i1 %364, label %373, label %365

; <label>:365:                                    ; preds = %363
  %366 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %367 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %366, align 8
  %368 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %367, i64 0, i32 5
  store i32 1006, i32* %368, align 8
  %369 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %370 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %369, align 8
  %371 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %370, align 8
  %372 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %371(%struct.jpeg_common_struct* %372) #3
  br label %373

; <label>:373:                                    ; preds = %363, %365
  %374 = icmp eq i64 %280, 0
  %375 = icmp eq i64 %298, 0
  %or.cond9 = or i1 %374, %375
  br i1 %or.cond9, label %394, label %376

; <label>:376:                                    ; preds = %373
  %377 = udiv i64 %280, 100
  %378 = trunc i64 %377 to i16
  %379 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 33
  %380 = bitcast i16* %379 to <2 x i16>*
  %381 = udiv i64 %298, 100
  %382 = trunc i64 %381 to i16
  %383 = insertelement <2 x i16> undef, i16 %378, i32 0
  %384 = insertelement <2 x i16> %383, i16 %382, i32 1
  store <2 x i16> %384, <2 x i16>* %380, align 2
  %385 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 32
  store i8 2, i8* %385, align 4
  br label %394

.thread:                                          ; preds = %109
  %386 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %387 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %386, align 8
  %388 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %387, i64 0, i32 5
  store i32 1003, i32* %388, align 8
  %389 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %390 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %389, align 8
  %391 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %390, align 8
  %392 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %391(%struct.jpeg_common_struct* %392) #3
  %.neg14 = add nsw i64 %54, -14
  %393 = sub nsw i64 %.neg14, %85
  br label %423

; <label>:394:                                    ; preds = %376, %373, %183, %181
  %.08 = phi i64 [ %126, %181 ], [ %126, %183 ], [ %226, %373 ], [ %226, %376 ]
  %.07 = phi i64 [ %118, %181 ], [ %118, %183 ], [ %208, %373 ], [ %208, %376 ]
  %.05 = phi i64 [ 0, %181 ], [ 0, %183 ], [ %316, %373 ], [ %316, %376 ]
  %.2 = phi i32 [ %.03, %181 ], [ %.03, %183 ], [ %.14, %373 ], [ %.14, %376 ]
  %.neg13 = add nsw i64 %54, -14
  %395 = sub nsw i64 %.neg13, %85
  %396 = icmp sgt i32 %.2, 0
  br i1 %396, label %397, label %423

; <label>:397:                                    ; preds = %394
  %398 = icmp slt i64 %.05, 1
  br i1 %398, label %409, label %399

; <label>:399:                                    ; preds = %397
  %400 = icmp sgt i64 %.05, 256
  br i1 %400, label %401, label %409

; <label>:401:                                    ; preds = %399
  %402 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %403 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %402, align 8
  %404 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %403, i64 0, i32 5
  store i32 1001, i32* %404, align 8
  %405 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %406 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %405, align 8
  %407 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %406, align 8
  %408 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %407(%struct.jpeg_common_struct* %408) #3
  br label %409

; <label>:409:                                    ; preds = %399, %401, %397
  %.16 = phi i64 [ 256, %397 ], [ %.05, %401 ], [ %.05, %399 ]
  %410 = bitcast %struct.cjpeg_source_struct* %1 to %struct._bmp_source_struct*
  %411 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %412 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %411, align 8
  %413 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %412, i64 0, i32 2
  %414 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %413, align 8
  %415 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %416 = trunc i64 %.16 to i32
  %417 = tail call i8** %414(%struct.jpeg_common_struct* %415, i32 1, i32 %416, i32 3) #3
  %418 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %419 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %418 to i8***
  store i8** %417, i8*** %419, align 8
  tail call fastcc void @read_colormap(%struct._bmp_source_struct* %410, i32 %416, i32 %.2)
  %420 = sext i32 %.2 to i64
  %421 = mul nsw i64 %.16, %420
  %422 = sub nsw i64 %395, %421
  br label %423

; <label>:423:                                    ; preds = %.thread, %409, %394
  %.0711 = phi i64 [ %.07, %409 ], [ %.07, %394 ], [ 0, %.thread ]
  %.0810 = phi i64 [ %.08, %409 ], [ %.08, %394 ], [ 0, %.thread ]
  %.01 = phi i64 [ %422, %409 ], [ %395, %394 ], [ %393, %.thread ]
  %424 = icmp slt i64 %.01, 0
  br i1 %424, label %.preheader.thread, label %.preheader

.preheader.thread:                                ; preds = %423
  %425 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %426 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %425, align 8
  %427 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %426, i64 0, i32 5
  store i32 1003, i32* %427, align 8
  %428 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %429 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %428, align 8
  %430 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %429, align 8
  %431 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %430(%struct.jpeg_common_struct* %431) #3
  br label %._crit_edge

.preheader:                                       ; preds = %423
  %432 = icmp eq i64 %.01, 0
  br i1 %432, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %433 = bitcast %struct.cjpeg_source_struct* %1 to %struct._bmp_source_struct*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.1232 = phi i64 [ %434, %.lr.ph ], [ %.01, %.lr.ph.preheader ]
  %434 = add nsw i64 %.1232, -1
  %435 = tail call fastcc i32 @read_byte(%struct._bmp_source_struct* %433)
  %436 = icmp sgt i64 %.1232, 1
  br i1 %436, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader, %.preheader.thread
  %437 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 4
  %438 = bitcast i8*** %437 to i32*
  %439 = load i32, i32* %438, align 8
  %440 = icmp eq i32 %439, 24
  %441 = mul nsw i64 %.0711, 3
  %.0.in = select i1 %440, i64 %441, i64 %.0711
  %.0 = trunc i64 %.0.in to i32
  br label %442

; <label>:442:                                    ; preds = %442, %._crit_edge
  %.1 = phi i32 [ %.0, %._crit_edge ], [ %445, %442 ]
  %443 = and i32 %.1, 3
  %444 = icmp eq i32 %443, 0
  %445 = add i32 %.1, 1
  br i1 %444, label %446, label %442

; <label>:446:                                    ; preds = %442
  %447 = bitcast %struct.cjpeg_source_struct* %1 to %struct._bmp_source_struct*
  %448 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %447, i64 0, i32 5
  store i32 %.1, i32* %448, align 4
  %449 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %450 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %449, align 8
  %451 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %450, i64 0, i32 4
  %452 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %451, align 8
  %453 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %454 = trunc i64 %.0810 to i32
  %455 = tail call %struct.jvirt_sarray_control* %452(%struct.jpeg_common_struct* %453, i32 1, i32 0, i32 %.1, i32 %454, i32 1) #3
  %456 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %457 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %456 to %struct.jvirt_sarray_control**
  store %struct.jvirt_sarray_control* %455, %struct.jvirt_sarray_control** %457, align 8
  %458 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @preload_image, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %458, align 8
  %459 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %460 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %459, align 8
  %461 = icmp eq %struct.jpeg_progress_mgr* %460, null
  br i1 %461, label %467, label %462

; <label>:462:                                    ; preds = %446
  %sunkaddr26 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr27 = add i64 %sunkaddr26, 16
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to %struct.cdjpeg_progress_mgr**
  %463 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %sunkaddr28, align 8
  %464 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %463, i64 0, i32 2
  %465 = load i32, i32* %464, align 4
  %466 = add nsw i32 %465, 1
  store i32 %466, i32* %464, align 4
  br label %467

; <label>:467:                                    ; preds = %446, %462
  %468 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr29 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr30 = add i64 %sunkaddr29, 8
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to %struct.jpeg_memory_mgr**
  %469 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr31, align 8
  %470 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %469, i64 0, i32 2
  %471 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %470, align 8
  %472 = trunc i64 %441 to i32
  %473 = tail call i8** %471(%struct.jpeg_common_struct* %468, i32 1, i32 %472, i32 1) #3
  %474 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  store i8** %473, i8*** %474, align 8
  %475 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 5
  store i32 1, i32* %475, align 8
  %476 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 2, i32* %476, align 4
  %477 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 3, i32* %477, align 8
  %478 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  store i32 8, i32* %478, align 8
  %479 = trunc i64 %.0711 to i32
  %480 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  store i32 %479, i32* %480, align 8
  %481 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  store i32 %454, i32* %481, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @finish_input_bmp(%struct.jpeg_compress_struct* nocapture, %struct.cjpeg_source_struct* nocapture) #1 {
  ret void
}

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @read_colormap(%struct._bmp_source_struct* nocapture readonly, i32, i32) unnamed_addr #0 {
  switch i32 %2, label %43 [
    i32 3, label %.preheader
    i32 4, label %.preheader1
  ]

.preheader1:                                      ; preds = %3
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %.lr.ph5, label %.loopexit

.lr.ph5:                                          ; preds = %.preheader1
  %wide.trip.count9 = zext i32 %1 to i64
  %sunkaddr14 = ptrtoint %struct._bmp_source_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 56
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i8***
  br label %24

.preheader:                                       ; preds = %3
  %5 = icmp sgt i32 %1, 0
  br i1 %5, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.preheader
  %wide.trip.count = zext i32 %1 to i64
  %sunkaddr = ptrtoint %struct._bmp_source_struct* %0 to i64
  %sunkaddr12 = add i64 %sunkaddr, 56
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i8***
  br label %6

; <label>:6:                                      ; preds = %6, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %6 ]
  %7 = tail call fastcc i32 @read_byte(%struct._bmp_source_struct* %0)
  %8 = trunc i32 %7 to i8
  %9 = load i8**, i8*** %sunkaddr13, align 8
  %10 = getelementptr inbounds i8*, i8** %9, i64 2
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 %indvars.iv
  store i8 %8, i8* %12, align 1
  %13 = tail call fastcc i32 @read_byte(%struct._bmp_source_struct* %0)
  %14 = trunc i32 %13 to i8
  %15 = load i8**, i8*** %sunkaddr13, align 8
  %16 = getelementptr inbounds i8*, i8** %15, i64 1
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 %indvars.iv
  store i8 %14, i8* %18, align 1
  %19 = tail call fastcc i32 @read_byte(%struct._bmp_source_struct* %0)
  %20 = trunc i32 %19 to i8
  %21 = load i8**, i8*** %sunkaddr13, align 8
  %22 = load i8*, i8** %21, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 %indvars.iv
  store i8 %20, i8* %23, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.loopexit, label %6

; <label>:24:                                     ; preds = %24, %.lr.ph5
  %indvars.iv7 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next8, %24 ]
  %25 = tail call fastcc i32 @read_byte(%struct._bmp_source_struct* %0)
  %26 = trunc i32 %25 to i8
  %27 = load i8**, i8*** %sunkaddr16, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 2
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv7
  store i8 %26, i8* %30, align 1
  %31 = tail call fastcc i32 @read_byte(%struct._bmp_source_struct* %0)
  %32 = trunc i32 %31 to i8
  %33 = load i8**, i8*** %sunkaddr16, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i64 1
  %35 = load i8*, i8** %34, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 %indvars.iv7
  store i8 %32, i8* %36, align 1
  %37 = tail call fastcc i32 @read_byte(%struct._bmp_source_struct* %0)
  %38 = trunc i32 %37 to i8
  %39 = load i8**, i8*** %sunkaddr16, align 8
  %40 = load i8*, i8** %39, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 %indvars.iv7
  store i8 %38, i8* %41, align 1
  %42 = tail call fastcc i32 @read_byte(%struct._bmp_source_struct* %0)
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %.loopexit.loopexit18, label %24

; <label>:43:                                     ; preds = %3
  %44 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %0, i64 0, i32 1
  %45 = bitcast %struct.jpeg_compress_struct** %44 to %struct.jpeg_error_mgr***
  %46 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %45, align 8
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 5
  store i32 1001, i32* %48, align 8
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %44, align 8
  %50 = bitcast %struct.jpeg_compress_struct* %49 to void (%struct.jpeg_common_struct*)***
  %51 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %50, align 8
  %52 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %51, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %49 to %struct.jpeg_common_struct*
  tail call void %52(%struct.jpeg_common_struct* %.cast) #3
  ret void

.loopexit.loopexit:                               ; preds = %6
  br label %.loopexit

.loopexit.loopexit18:                             ; preds = %24
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit18, %.loopexit.loopexit, %.preheader1, %.preheader
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @read_byte(%struct._bmp_source_struct* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %0, i64 0, i32 0, i32 3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %3)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %16

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds %struct._bmp_source_struct, %struct._bmp_source_struct* %0, i64 0, i32 1
  %8 = bitcast %struct.jpeg_compress_struct** %7 to %struct.jpeg_error_mgr***
  %9 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %8, align 8
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 5
  store i32 42, i32* %11, align 8
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %7, align 8
  %13 = bitcast %struct.jpeg_compress_struct* %12 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %12 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %.cast) #3
  br label %16

; <label>:16:                                     ; preds = %6, %1
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @preload_image(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %6 = bitcast %struct.jpeg_progress_mgr** %5 to %struct.cdjpeg_progress_mgr**
  %7 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %9 = load i32, i32* %8, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %._crit_edge13, label %.lr.ph12

.lr.ph12:                                         ; preds = %2
  %11 = icmp eq %struct.cdjpeg_progress_mgr* %7, null
  br i1 %11, label %.lr.ph12.split.us.preheader, label %.lr.ph12.split.preheader

.lr.ph12.split.preheader:                         ; preds = %.lr.ph12
  %12 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %13 = bitcast %struct.cdjpeg_progress_mgr* %7 to void (%struct.jpeg_common_struct*)**
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr28 = ptrtoint %struct.cdjpeg_progress_mgr* %7 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 8
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i64*
  %sunkaddr31 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 44
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  %sunkaddr = ptrtoint %struct.cdjpeg_progress_mgr* %7 to i64
  %sunkaddr34 = add i64 %sunkaddr, 16
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to i64*
  %sunkaddr36 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 8
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to %struct.jpeg_memory_mgr**
  %sunkaddr39 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 64
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to %struct.jvirt_sarray_control**
  %sunkaddr42 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr43 = add i64 %sunkaddr42, 76
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to i32*
  %sunkaddr45 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 44
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to i32*
  %15 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  br label %.lr.ph12.split

.lr.ph12.split.us.preheader:                      ; preds = %.lr.ph12
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr16 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 8
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to %struct.jpeg_memory_mgr**
  %sunkaddr19 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 64
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to %struct.jvirt_sarray_control**
  %sunkaddr22 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 76
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  %sunkaddr25 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 44
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i32*
  %19 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %21 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %.lr.ph12.split.us.preheader, %._crit_edge.us
  %.0110.us = phi i32 [ %42, %._crit_edge.us ], [ 0, %.lr.ph12.split.us.preheader ]
  %22 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr18, align 8
  %23 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %22, i64 0, i32 7
  %24 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %23, align 8
  %25 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %sunkaddr21, align 8
  %26 = tail call i8** %24(%struct.jpeg_common_struct* %18, %struct.jvirt_sarray_control* %25, i32 %.0110.us, i32 1, i32 1) #3
  %27 = load i32, i32* %sunkaddr24, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %._crit_edge.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.lr.ph12.split.us
  %29 = load i8*, i8** %26, align 8
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %37
  %.09.us = phi i32 [ %40, %37 ], [ %27, %.lr.ph.us.preheader ]
  %.028.us = phi i8* [ %39, %37 ], [ %29, %.lr.ph.us.preheader ]
  %30 = tail call i32 @_IO_getc(%struct._IO_FILE* %4)
  %31 = icmp eq i32 %30, -1
  br i1 %31, label %32, label %37

; <label>:32:                                     ; preds = %.lr.ph.us
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i64 0, i32 5
  store i32 42, i32* %34, align 8
  %35 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %19, align 8
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  tail call void %36(%struct.jpeg_common_struct* %21) #3
  br label %37

; <label>:37:                                     ; preds = %32, %.lr.ph.us
  %38 = trunc i32 %30 to i8
  store i8 %38, i8* %.028.us, align 1
  %39 = getelementptr inbounds i8, i8* %.028.us, i64 1
  %40 = add i32 %.09.us, -1
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %._crit_edge.us.loopexit, label %.lr.ph.us

._crit_edge.us.loopexit:                          ; preds = %37
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph12.split.us
  %42 = add i32 %.0110.us, 1
  %43 = load i32, i32* %sunkaddr27, align 4
  %44 = icmp ult i32 %42, %43
  br i1 %44, label %.lr.ph12.split.us, label %._crit_edge13.loopexit

.lr.ph12.split:                                   ; preds = %.lr.ph12.split.preheader, %._crit_edge
  %.0110 = phi i32 [ %69, %._crit_edge ], [ 0, %.lr.ph12.split.preheader ]
  %45 = zext i32 %.0110 to i64
  store i64 %45, i64* %sunkaddr30, align 8
  %46 = load i32, i32* %sunkaddr33, align 4
  %47 = zext i32 %46 to i64
  store i64 %47, i64* %sunkaddr35, align 8
  %48 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  tail call void %48(%struct.jpeg_common_struct* %12) #3
  %49 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr38, align 8
  %50 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %49, i64 0, i32 7
  %51 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %50, align 8
  %52 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %sunkaddr41, align 8
  %53 = tail call i8** %51(%struct.jpeg_common_struct* %14, %struct.jvirt_sarray_control* %52, i32 %.0110, i32 1, i32 1) #3
  %54 = load i32, i32* %sunkaddr44, align 4
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph12.split
  %56 = load i8*, i8** %53, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %64
  %.09 = phi i32 [ %67, %64 ], [ %54, %.lr.ph.preheader ]
  %.028 = phi i8* [ %66, %64 ], [ %56, %.lr.ph.preheader ]
  %57 = tail call i32 @_IO_getc(%struct._IO_FILE* %4)
  %58 = icmp eq i32 %57, -1
  br i1 %58, label %59, label %64

; <label>:59:                                     ; preds = %.lr.ph
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i64 0, i32 5
  store i32 42, i32* %61, align 8
  %62 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %15, align 8
  %63 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %62, align 8
  tail call void %63(%struct.jpeg_common_struct* %17) #3
  br label %64

; <label>:64:                                     ; preds = %59, %.lr.ph
  %65 = trunc i32 %57 to i8
  store i8 %65, i8* %.028, align 1
  %66 = getelementptr inbounds i8, i8* %.028, i64 1
  %67 = add i32 %.09, -1
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %64
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph12.split
  %69 = add i32 %.0110, 1
  %70 = load i32, i32* %sunkaddr47, align 4
  %71 = icmp ult i32 %69, %70
  br i1 %71, label %.lr.ph12.split, label %._crit_edge13.loopexit49

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13.loopexit49:                         ; preds = %._crit_edge
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit49, %._crit_edge13.loopexit, %2
  %72 = icmp eq %struct.cdjpeg_progress_mgr* %7, null
  br i1 %72, label %77, label %73

; <label>:73:                                     ; preds = %._crit_edge13
  %74 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %7, i64 0, i32 1
  %75 = load i32, i32* %74, align 8
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %74, align 8
  br label %77

; <label>:77:                                     ; preds = %._crit_edge13, %73
  %78 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 4
  %79 = bitcast i8*** %78 to i32*
  %80 = load i32, i32* %79, align 8
  switch i32 %80, label %85 [
    i32 8, label %81
    i32 24, label %83
  ]

; <label>:81:                                     ; preds = %77
  %82 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %82, align 8
  br label %93

; <label>:83:                                     ; preds = %77
  %84 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_24bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %84, align 8
  br label %93

; <label>:85:                                     ; preds = %77
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %87 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %87, i64 0, i32 5
  store i32 1002, i32* %88, align 8
  %89 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %90 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %89, align 8
  %91 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %90, align 8
  %92 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %91(%struct.jpeg_common_struct* %92) #3
  br label %93

; <label>:93:                                     ; preds = %85, %83, %81
  %sunkaddr5 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 44
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i32*
  %94 = load i32, i32* %sunkaddr7, align 4
  %95 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %96 = bitcast %struct._IO_FILE** %95 to i32*
  store i32 %94, i32* %96, align 8
  %97 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  %98 = load i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %97, align 8
  %99 = tail call i32 %98(%struct.jpeg_compress_struct* %0, %struct.cjpeg_source_struct* nonnull %1) #3
  ret i32 %99
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_8bit_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %4 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %3 to i8***
  %5 = load i8**, i8*** %4, align 8
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %7 = bitcast %struct._IO_FILE** %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = add i32 %8, -1
  store i32 %9, i32* %7, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %11 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %11, i64 0, i32 7
  %13 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %12, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %15 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %16 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %15 to %struct.jvirt_sarray_control**
  %17 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %16, align 8
  %18 = tail call i8** %13(%struct.jpeg_common_struct* %14, %struct.jvirt_sarray_control* %17, i32 %9, i32 1, i32 0) #3
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %20 = load i32, i32* %19, align 8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %22 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %23 = load i8**, i8*** %22, align 8
  %24 = load i8*, i8** %23, align 8
  %25 = load i8*, i8** %18, align 8
  %xtraiter = and i32 %20, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %26 = load i8, i8* %25, align 1
  %27 = load i8*, i8** %5, align 8
  %28 = zext i8 %26 to i64
  %29 = getelementptr inbounds i8, i8* %27, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = getelementptr inbounds i8, i8* %24, i64 1
  store i8 %30, i8* %24, align 1
  %sunkaddr = ptrtoint i8** %5 to i64
  %sunkaddr6 = add i64 %sunkaddr, 8
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i8**
  %32 = load i8*, i8** %sunkaddr7, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 %28
  %34 = load i8, i8* %33, align 1
  %35 = getelementptr inbounds i8, i8* %24, i64 2
  store i8 %34, i8* %31, align 1
  %sunkaddr8 = ptrtoint i8** %5 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 16
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i8**
  %36 = load i8*, i8** %sunkaddr10, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 %28
  %38 = load i8, i8* %37, align 1
  store i8 %38, i8* %35, align 1
  %39 = getelementptr inbounds i8, i8* %24, i64 3
  %40 = getelementptr inbounds i8, i8* %25, i64 1
  %41 = add i32 %20, -1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %.05.unr = phi i32 [ %20, %.lr.ph ], [ %41, %.prol.preheader ]
  %.014.unr = phi i8* [ %24, %.lr.ph ], [ %39, %.prol.preheader ]
  %.023.unr = phi i8* [ %25, %.lr.ph ], [ %40, %.prol.preheader ]
  %42 = icmp eq i32 %20, 1
  br i1 %42, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr11 = ptrtoint i8** %5 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 8
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i8**
  %sunkaddr14 = ptrtoint i8** %5 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 16
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i8**
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %.05 = phi i32 [ %73, %.lr.ph.new ], [ %.05.unr, %.lr.ph.new.preheader ]
  %.014 = phi i8* [ %71, %.lr.ph.new ], [ %.014.unr, %.lr.ph.new.preheader ]
  %.023 = phi i8* [ %72, %.lr.ph.new ], [ %.023.unr, %.lr.ph.new.preheader ]
  %43 = load i8, i8* %.023, align 1
  %44 = load i8*, i8** %5, align 8
  %45 = zext i8 %43 to i64
  %46 = getelementptr inbounds i8, i8* %44, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = getelementptr inbounds i8, i8* %.014, i64 1
  store i8 %47, i8* %.014, align 1
  %49 = load i8*, i8** %sunkaddr13, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 %45
  %51 = load i8, i8* %50, align 1
  %52 = getelementptr inbounds i8, i8* %.014, i64 2
  store i8 %51, i8* %48, align 1
  %53 = load i8*, i8** %sunkaddr16, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 %45
  %55 = load i8, i8* %54, align 1
  store i8 %55, i8* %52, align 1
  %56 = getelementptr inbounds i8, i8* %.014, i64 3
  %57 = getelementptr inbounds i8, i8* %.023, i64 1
  %58 = load i8, i8* %57, align 1
  %59 = load i8*, i8** %5, align 8
  %60 = zext i8 %58 to i64
  %61 = getelementptr inbounds i8, i8* %59, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = getelementptr inbounds i8, i8* %.014, i64 4
  store i8 %62, i8* %56, align 1
  %64 = load i8*, i8** %sunkaddr13, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 %60
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds i8, i8* %.014, i64 5
  store i8 %66, i8* %63, align 1
  %68 = load i8*, i8** %sunkaddr16, align 8
  %69 = getelementptr inbounds i8, i8* %68, i64 %60
  %70 = load i8, i8* %69, align 1
  store i8 %70, i8* %67, align 1
  %71 = getelementptr inbounds i8, i8* %.014, i64 6
  %72 = getelementptr inbounds i8, i8* %.023, i64 2
  %73 = add i32 %.05, -2
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %2
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_24bit_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %4 = bitcast %struct._IO_FILE** %3 to i32*
  %5 = load i32, i32* %4, align 8
  %6 = add i32 %5, -1
  store i32 %6, i32* %4, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %8 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %8, i64 0, i32 7
  %10 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %9, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %12 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %13 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %12 to %struct.jvirt_sarray_control**
  %14 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %13, align 8
  %15 = tail call i8** %10(%struct.jpeg_common_struct* %11, %struct.jvirt_sarray_control* %14, i32 %6, i32 1, i32 0) #3
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %18 = load i8**, i8*** %17, align 8
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %21 = load i32, i32* %20, align 8
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %2
  %xtraiter = and i32 %21, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %23 = getelementptr inbounds i8, i8* %16, i64 1
  %24 = load i8, i8* %16, align 1
  %25 = getelementptr inbounds i8, i8* %19, i64 2
  store i8 %24, i8* %25, align 1
  %26 = getelementptr inbounds i8, i8* %16, i64 2
  %27 = load i8, i8* %23, align 1
  %28 = getelementptr inbounds i8, i8* %19, i64 1
  store i8 %27, i8* %28, align 1
  %29 = load i8, i8* %26, align 1
  store i8 %29, i8* %19, align 1
  %30 = getelementptr inbounds i8, i8* %19, i64 3
  %31 = getelementptr inbounds i8, i8* %16, i64 3
  %32 = add i32 %21, -1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.05.unr = phi i32 [ %21, %.lr.ph.preheader ], [ %32, %.lr.ph.prol ]
  %.014.unr = phi i8* [ %19, %.lr.ph.preheader ], [ %30, %.lr.ph.prol ]
  %.023.unr = phi i8* [ %16, %.lr.ph.preheader ], [ %31, %.lr.ph.prol ]
  %33 = icmp eq i32 %21, 1
  br i1 %33, label %._crit_edge, label %.lr.ph.preheader8

.lr.ph.preheader8:                                ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader8, %.lr.ph
  %.05 = phi i32 [ %52, %.lr.ph ], [ %.05.unr, %.lr.ph.preheader8 ]
  %.014 = phi i8* [ %50, %.lr.ph ], [ %.014.unr, %.lr.ph.preheader8 ]
  %.023 = phi i8* [ %51, %.lr.ph ], [ %.023.unr, %.lr.ph.preheader8 ]
  %34 = getelementptr inbounds i8, i8* %.023, i64 1
  %35 = load i8, i8* %.023, align 1
  %36 = getelementptr inbounds i8, i8* %.014, i64 2
  store i8 %35, i8* %36, align 1
  %37 = getelementptr inbounds i8, i8* %.023, i64 2
  %38 = load i8, i8* %34, align 1
  %39 = getelementptr inbounds i8, i8* %.014, i64 1
  store i8 %38, i8* %39, align 1
  %40 = load i8, i8* %37, align 1
  store i8 %40, i8* %.014, align 1
  %41 = getelementptr inbounds i8, i8* %.014, i64 3
  %42 = getelementptr inbounds i8, i8* %.023, i64 3
  %43 = getelementptr inbounds i8, i8* %.023, i64 4
  %44 = load i8, i8* %42, align 1
  %45 = getelementptr inbounds i8, i8* %.014, i64 5
  store i8 %44, i8* %45, align 1
  %46 = getelementptr inbounds i8, i8* %.023, i64 5
  %47 = load i8, i8* %43, align 1
  %48 = getelementptr inbounds i8, i8* %.014, i64 4
  store i8 %47, i8* %48, align 1
  %49 = load i8, i8* %46, align 1
  store i8 %49, i8* %41, align 1
  %50 = getelementptr inbounds i8, i8* %.014, i64 6
  %51 = getelementptr inbounds i8, i8* %.023, i64 6
  %52 = add i32 %.05, -2
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %2
  ret i32 1
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
