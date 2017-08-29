; ModuleID = 'rdtarga.ll'
source_filename = "rdtarga.c"
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
%struct._tga_source_struct = type { %struct.cjpeg_source_struct, %struct.jpeg_compress_struct*, i8**, %struct.jvirt_sarray_control*, i32, void (%struct._tga_source_struct*)*, [4 x i8], i32, i32, i32, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* }
%struct.cdjpeg_progress_mgr = type { %struct.jpeg_progress_mgr, i32, i32, i32 }

@c5to8bits = internal unnamed_addr constant [32 x i8] c"\00\08\10\19!)1:BJRZcks{\84\8C\94\9C\A5\AD\B5\BD\C5\CE\D6\DE\E6\EF\F7\FF", align 16

; Function Attrs: noinline nounwind uwtable
define %struct.cjpeg_source_struct* @jinit_read_targa(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 112) #3
  %8 = getelementptr inbounds i8, i8* %7, i64 48
  %9 = bitcast i8* %8 to %struct.jpeg_compress_struct**
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_tga, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 16
  %12 = bitcast i8* %11 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_tga, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %12, align 8
  %13 = bitcast i8* %7 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %13
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_tga(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture) #0 {
  %3 = alloca [18 x i8], align 16
  %4 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 0
  %5 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %7 = call i64 @fread(i8* nonnull %4, i64 1, i64 18, %struct._IO_FILE* %6)
  %8 = icmp eq i64 %7, 18
  br i1 %8, label %17, label %9

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 5
  store i32 42, i32* %12, align 8
  %13 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %14 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %13, align 8
  %15 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %14, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %15(%struct.jpeg_common_struct* %16) #3
  br label %17

; <label>:17:                                     ; preds = %2, %9
  %18 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 16
  %19 = load i8, i8* %18, align 16
  %20 = icmp eq i8 %19, 15
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %17
  %sunkaddr = ptrtoint [18 x i8]* %3 to i64
  %sunkaddr8 = add i64 %sunkaddr, 16
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to i8*
  store i8 16, i8* %sunkaddr9, align 16
  br label %22

; <label>:22:                                     ; preds = %17, %21
  %23 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 0
  %24 = bitcast %struct.cjpeg_source_struct* %1 to %struct._tga_source_struct*
  %25 = load i8, i8* %23, align 16
  %26 = zext i8 %25 to i32
  %27 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 1
  %28 = load i8, i8* %27, align 1
  %29 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 2
  %30 = load i8, i8* %29, align 2
  %31 = zext i8 %30 to i32
  %32 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 5
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 6
  %36 = load i8, i8* %35, align 2
  %37 = zext i8 %36 to i32
  %38 = shl nuw nsw i32 %37, 8
  %39 = or i32 %38, %34
  %40 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 12
  %41 = load i8, i8* %40, align 4
  %42 = zext i8 %41 to i32
  %43 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 13
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = shl nuw nsw i32 %45, 8
  %47 = or i32 %46, %42
  %48 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 14
  %49 = load i8, i8* %48, align 2
  %50 = zext i8 %49 to i32
  %51 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 15
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = shl nuw nsw i32 %53, 8
  %55 = or i32 %54, %50
  %sunkaddr10 = ptrtoint [18 x i8]* %3 to i64
  %sunkaddr11 = add i64 %sunkaddr10, 16
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i8*
  %56 = load i8, i8* %sunkaddr12, align 16
  %57 = zext i8 %56 to i32
  %58 = lshr i32 %57, 3
  %59 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %24, i64 0, i32 7
  store i32 %58, i32* %59, align 4
  %60 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 17
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %.lobit = and i32 %62, 32
  %63 = icmp ugt i8 %28, 1
  %64 = icmp eq i32 %58, 0
  %or.cond5 = or i1 %63, %64
  %65 = icmp ugt i8 %56, 39
  %or.cond6 = or i1 %65, %or.cond5
  br i1 %or.cond6, label %71, label %66

; <label>:66:                                     ; preds = %22
  %sunkaddr13 = ptrtoint [18 x i8]* %3 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 16
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i8*
  %67 = load i8, i8* %sunkaddr15, align 16
  %68 = and i8 %67, 7
  %69 = icmp eq i8 %68, 0
  %.mask = and i32 %62, 192
  %70 = icmp eq i32 %.mask, 0
  %or.cond = and i1 %70, %69
  br i1 %or.cond, label %79, label %71

; <label>:71:                                     ; preds = %66, %22
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %73 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %73, i64 0, i32 5
  store i32 1033, i32* %74, align 8
  %75 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %76 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %75, align 8
  %77 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %76, align 8
  %78 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %77(%struct.jpeg_common_struct* %78) #3
  br label %79

; <label>:79:                                     ; preds = %66, %71
  %80 = icmp ugt i8 %30, 8
  br i1 %80, label %81, label %87

; <label>:81:                                     ; preds = %79
  %82 = bitcast %struct.cjpeg_source_struct* %1 to %struct._tga_source_struct*
  %sunkaddr16 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 80
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to void (%struct._tga_source_struct*)**
  store void (%struct._tga_source_struct*)* @read_rle_pixel, void (%struct._tga_source_struct*)** %sunkaddr18, align 8
  %83 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %82, i64 0, i32 9
  store i32 0, i32* %83, align 4
  %84 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 2
  %85 = bitcast %struct.cjpeg_source_struct* %84 to i32*
  store i32 0, i32* %85, align 8
  %86 = add nsw i32 %31, -8
  br label %88

; <label>:87:                                     ; preds = %79
  %sunkaddr19 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 80
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to void (%struct._tga_source_struct*)**
  store void (%struct._tga_source_struct*)* @read_non_rle_pixel, void (%struct._tga_source_struct*)** %sunkaddr21, align 8
  br label %88

; <label>:88:                                     ; preds = %87, %81
  %.01 = phi i32 [ %86, %81 ], [ %31, %87 ]
  %89 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 2, i32* %89, align 4
  switch i32 %.01, label %169 [
    i32 1, label %90
    i32 2, label %116
    i32 3, label %144
  ]

; <label>:90:                                     ; preds = %88
  %sunkaddr22 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 92
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i32*
  %91 = load i32, i32* %sunkaddr24, align 4
  %92 = icmp eq i32 %91, 1
  %93 = icmp eq i8 %28, 1
  %or.cond4 = and i1 %93, %92
  br i1 %or.cond4, label %94, label %96

; <label>:94:                                     ; preds = %90
  %95 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 2, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %95, align 8
  br label %104

; <label>:96:                                     ; preds = %90
  %97 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %98 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %97, align 8
  %99 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %98, i64 0, i32 5
  store i32 1033, i32* %99, align 8
  %100 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %101 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %100, align 8
  %102 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %101, align 8
  %103 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %102(%struct.jpeg_common_struct* %103) #3
  br label %104

; <label>:104:                                    ; preds = %96, %94
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i64 0, i32 5
  store i32 1037, i32* %107, align 8
  %108 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %109 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %108, i64 0, i32 6, i32 0, i64 0
  store i32 %47, i32* %109, align 4
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i64 0, i32 6, i32 0, i64 1
  store i32 %55, i32* %111, align 4
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i64 0, i32 1
  %114 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %113, align 8
  %115 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %114(%struct.jpeg_common_struct* %115, i32 1) #3
  br label %177

; <label>:116:                                    ; preds = %88
  %sunkaddr25 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 92
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i32*
  %117 = load i32, i32* %sunkaddr27, align 4
  switch i32 %117, label %124 [
    i32 2, label %118
    i32 3, label %120
    i32 4, label %122
  ]

; <label>:118:                                    ; preds = %116
  %119 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 2, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_16bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %119, align 8
  br label %132

; <label>:120:                                    ; preds = %116
  %121 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 2, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_24bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %121, align 8
  br label %132

; <label>:122:                                    ; preds = %116
  %123 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 2, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_24bit_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %123, align 8
  br label %132

; <label>:124:                                    ; preds = %116
  %125 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %126 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %125, align 8
  %127 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %126, i64 0, i32 5
  store i32 1033, i32* %127, align 8
  %128 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %129 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %128, align 8
  %130 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %129, align 8
  %131 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %130(%struct.jpeg_common_struct* %131) #3
  br label %132

; <label>:132:                                    ; preds = %124, %122, %120, %118
  %133 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %134 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %133, align 8
  %135 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %134, i64 0, i32 5
  store i32 1035, i32* %135, align 8
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %133, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 6, i32 0, i64 0
  store i32 %47, i32* %137, align 4
  %138 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %133, align 8
  %139 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %138, i64 0, i32 6, i32 0, i64 1
  store i32 %55, i32* %139, align 4
  %140 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %133, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i64 0, i32 1
  %142 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %141, align 8
  %143 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %142(%struct.jpeg_common_struct* %143, i32 1) #3
  br label %177

; <label>:144:                                    ; preds = %88
  %sunkaddr28 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr29 = add i64 %sunkaddr28, 52
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to i32*
  store i32 1, i32* %sunkaddr30, align 4
  %sunkaddr31 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr32 = add i64 %sunkaddr31, 92
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  %145 = load i32, i32* %sunkaddr33, align 4
  %146 = icmp eq i32 %145, 1
  br i1 %146, label %147, label %149

; <label>:147:                                    ; preds = %144
  %148 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 2, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_8bit_gray_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %148, align 8
  br label %157

; <label>:149:                                    ; preds = %144
  %150 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %151 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %150, align 8
  %152 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %151, i64 0, i32 5
  store i32 1033, i32* %152, align 8
  %153 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %154 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %153, align 8
  %155 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %154, align 8
  %156 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %155(%struct.jpeg_common_struct* %156) #3
  br label %157

; <label>:157:                                    ; preds = %149, %147
  %158 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %159 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %158, align 8
  %160 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %159, i64 0, i32 5
  store i32 1036, i32* %160, align 8
  %161 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %158, align 8
  %162 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %161, i64 0, i32 6, i32 0, i64 0
  store i32 %47, i32* %162, align 4
  %163 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %158, align 8
  %164 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %163, i64 0, i32 6, i32 0, i64 1
  store i32 %55, i32* %164, align 4
  %165 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %158, align 8
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %165, i64 0, i32 1
  %167 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %166, align 8
  %168 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %167(%struct.jpeg_common_struct* %168, i32 1) #3
  br label %177

; <label>:169:                                    ; preds = %88
  %170 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %171 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %170, align 8
  %172 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %171, i64 0, i32 5
  store i32 1033, i32* %172, align 8
  %173 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %174 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %173, align 8
  %175 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %174, align 8
  %176 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %175(%struct.jpeg_common_struct* %176) #3
  br label %177

; <label>:177:                                    ; preds = %169, %157, %132, %104
  %.0 = phi i32 [ 3, %169 ], [ 1, %157 ], [ 3, %132 ], [ 3, %104 ]
  %178 = icmp eq i32 %.lobit, 0
  br i1 %178, label %179, label %200

; <label>:179:                                    ; preds = %177
  %180 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %181 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %180, align 8
  %182 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %181, i64 0, i32 4
  %183 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %182, align 8
  %184 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %185 = mul nuw nsw i32 %.0, %47
  %186 = tail call %struct.jvirt_sarray_control* %183(%struct.jpeg_common_struct* %184, i32 1, i32 0, i32 %185, i32 %55, i32 1) #3
  %187 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %188 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %187 to %struct.jvirt_sarray_control**
  store %struct.jvirt_sarray_control* %186, %struct.jvirt_sarray_control** %188, align 8
  %189 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %190 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %189, align 8
  %191 = icmp eq %struct.jpeg_progress_mgr* %190, null
  br i1 %191, label %197, label %192

; <label>:192:                                    ; preds = %179
  %sunkaddr34 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr35 = add i64 %sunkaddr34, 16
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to %struct.cdjpeg_progress_mgr**
  %193 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %sunkaddr36, align 8
  %194 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %193, i64 0, i32 2
  %195 = load i32, i32* %194, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %194, align 4
  br label %197

; <label>:197:                                    ; preds = %179, %192
  %198 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 5
  store i32 1, i32* %198, align 8
  %199 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @preload_image, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %199, align 8
  br label %.preheader

; <label>:200:                                    ; preds = %177
  %201 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %202 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %201 to %struct.jvirt_sarray_control**
  store %struct.jvirt_sarray_control* null, %struct.jvirt_sarray_control** %202, align 8
  %203 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %204 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %203, align 8
  %205 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %204, i64 0, i32 2
  %206 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %205, align 8
  %207 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %208 = mul nuw nsw i32 %.0, %47
  %209 = tail call i8** %206(%struct.jpeg_common_struct* %207, i32 1, i32 %208, i32 1) #3
  %210 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  store i8** %209, i8*** %210, align 8
  %211 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 5
  store i32 1, i32* %211, align 8
  %212 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 2, i32 1
  %213 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %212 to i64*
  %214 = load i64, i64* %213, align 8
  %215 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  %216 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %215 to i64*
  store i64 %214, i64* %216, align 8
  br label %.preheader

.preheader:                                       ; preds = %200, %197
  %217 = icmp eq i8 %25, 0
  br i1 %217, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader
  %218 = bitcast %struct.cjpeg_source_struct* %1 to %struct._tga_source_struct*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.027 = phi i32 [ %219, %.lr.ph ], [ %26, %.lr.ph.preheader ]
  %219 = add nsw i32 %.027, -1
  %220 = tail call fastcc i32 @read_byte(%struct._tga_source_struct* %218)
  %221 = icmp eq i32 %219, 0
  br i1 %221, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %222 = icmp eq i32 %39, 0
  br i1 %222, label %256, label %223

; <label>:223:                                    ; preds = %._crit_edge
  %224 = icmp ugt i32 %39, 256
  br i1 %224, label %235, label %225

; <label>:225:                                    ; preds = %223
  %226 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 3
  %227 = load i8, i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 4
  %230 = load i8, i8* %229, align 4
  %231 = zext i8 %230 to i32
  %232 = shl nuw nsw i32 %231, 8
  %233 = or i32 %232, %228
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %243, label %235

; <label>:235:                                    ; preds = %225, %223
  %236 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %237 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %236, align 8
  %238 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %237, i64 0, i32 5
  store i32 1032, i32* %238, align 8
  %239 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %240 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %239, align 8
  %241 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %240, align 8
  %242 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %241(%struct.jpeg_common_struct* %242) #3
  br label %243

; <label>:243:                                    ; preds = %225, %235
  %244 = bitcast %struct.cjpeg_source_struct* %1 to %struct._tga_source_struct*
  %245 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %246 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %245, align 8
  %247 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %246, i64 0, i32 2
  %248 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %247, align 8
  %249 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %250 = tail call i8** %248(%struct.jpeg_common_struct* %249, i32 1, i32 %39, i32 3) #3
  %251 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %252 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %251 to i8***
  store i8** %250, i8*** %252, align 8
  %253 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 7
  %254 = load i8, i8* %253, align 1
  %255 = zext i8 %254 to i32
  tail call fastcc void @read_colormap(%struct._tga_source_struct* %244, i32 %39, i32 %255)
  br label %269

; <label>:256:                                    ; preds = %._crit_edge
  %257 = icmp eq i8 %28, 0
  br i1 %257, label %266, label %258

; <label>:258:                                    ; preds = %256
  %259 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %260 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %259, align 8
  %261 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %260, i64 0, i32 5
  store i32 1033, i32* %261, align 8
  %262 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %263 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %262, align 8
  %264 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %263, align 8
  %265 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  tail call void %264(%struct.jpeg_common_struct* %265) #3
  br label %266

; <label>:266:                                    ; preds = %256, %258
  %267 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %268 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %267 to i8***
  store i8** null, i8*** %268, align 8
  br label %269

; <label>:269:                                    ; preds = %266, %243
  %270 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 %.0, i32* %270, align 8
  %271 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  store i32 8, i32* %271, align 8
  %272 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  store i32 %47, i32* %272, align 8
  %273 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  store i32 %55, i32* %273, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @finish_input_tga(%struct.jpeg_compress_struct* nocapture, %struct.cjpeg_source_struct* nocapture) #1 {
  ret void
}

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal void @read_rle_pixel(%struct._tga_source_struct* nocapture) #0 {
  %2 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 0, i32 3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %4 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 9
  %5 = load i32, i32* %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %1
  %8 = add nsw i32 %5, -1
  %sunkaddr = ptrtoint %struct._tga_source_struct* %0 to i64
  %sunkaddr3 = add i64 %sunkaddr, 100
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i32*
  store i32 %8, i32* %sunkaddr4, align 4
  br label %.loopexit

; <label>:9:                                      ; preds = %1
  %10 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 8
  %11 = load i32, i32* %10, align 8
  %12 = add nsw i32 %11, -1
  store i32 %12, i32* %10, align 8
  %13 = icmp slt i32 %11, 1
  br i1 %13, label %14, label %.preheader

; <label>:14:                                     ; preds = %9
  %15 = tail call fastcc i32 @read_byte(%struct._tga_source_struct* nonnull %0)
  %16 = trunc i32 %15 to i8
  %17 = icmp slt i8 %16, 0
  %18 = and i32 %15, 127
  br i1 %17, label %19, label %20

; <label>:19:                                     ; preds = %14
  %sunkaddr5 = ptrtoint %struct._tga_source_struct* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 100
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i32*
  store i32 %18, i32* %sunkaddr7, align 4
  br label %20

; <label>:20:                                     ; preds = %14, %19
  %.sink = phi i32 [ 0, %19 ], [ %18, %14 ]
  %sunkaddr8 = ptrtoint %struct._tga_source_struct* %0 to i64
  %sunkaddr9 = add i64 %sunkaddr8, 96
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to i32*
  store i32 %.sink, i32* %sunkaddr10, align 8
  br label %.preheader

.preheader:                                       ; preds = %9, %20
  %21 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 7
  %22 = load i32, i32* %21, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.preheader
  %sunkaddr14 = ptrtoint %struct._tga_source_struct* %0 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 92
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %24 = tail call i32 @_IO_getc(%struct._IO_FILE* %3)
  %25 = trunc i32 %24 to i8
  %26 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 6, i64 %indvars.iv
  store i8 %25, i8* %26, align 1
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %27 = load i32, i32* %sunkaddr16, align 4
  %28 = sext i32 %27 to i64
  %29 = icmp slt i64 %indvars.iv.next, %28
  br i1 %29, label %.lr.ph, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @read_non_rle_pixel(%struct._tga_source_struct* nocapture) #0 {
  %2 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 0, i32 3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %4 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 7
  %5 = load i32, i32* %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %1
  %sunkaddr4 = ptrtoint %struct._tga_source_struct* %0 to i64
  %sunkaddr5 = add i64 %sunkaddr4, 92
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %7 = tail call i32 @_IO_getc(%struct._IO_FILE* %3)
  %8 = trunc i32 %7 to i8
  %9 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 6, i64 %indvars.iv
  store i8 %8, i8* %9, align 1
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %10 = load i32, i32* %sunkaddr6, align 4
  %11 = sext i32 %10 to i64
  %12 = icmp slt i64 %indvars.iv.next, %11
  br i1 %12, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_8bit_row(%struct.jpeg_compress_struct* nocapture readonly, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %4 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %3 to i8***
  %5 = load i8**, i8*** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %9 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %10 = load i8**, i8*** %9, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = bitcast %struct.cjpeg_source_struct* %1 to %struct._tga_source_struct*
  %sunkaddr17 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 80
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to void (%struct._tga_source_struct*)**
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr20 = add i64 %sunkaddr, 88
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i8*
  %sunkaddr22 = ptrtoint i8** %5 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 8
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i8**
  %sunkaddr25 = ptrtoint i8** %5 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 16
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i8**
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph
  %.03 = phi i32 [ %7, %.lr.ph ], [ %29, %13 ]
  %.012 = phi i8* [ %11, %.lr.ph ], [ %28, %13 ]
  %14 = load void (%struct._tga_source_struct*)*, void (%struct._tga_source_struct*)** %sunkaddr19, align 8
  tail call void %14(%struct._tga_source_struct* nonnull %12) #3
  %15 = load i8, i8* %sunkaddr21, align 8
  %16 = load i8*, i8** %5, align 8
  %17 = zext i8 %15 to i64
  %18 = getelementptr inbounds i8, i8* %16, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = getelementptr inbounds i8, i8* %.012, i64 1
  store i8 %19, i8* %.012, align 1
  %21 = load i8*, i8** %sunkaddr24, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 %17
  %23 = load i8, i8* %22, align 1
  %24 = getelementptr inbounds i8, i8* %.012, i64 2
  store i8 %23, i8* %20, align 1
  %25 = load i8*, i8** %sunkaddr27, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 %17
  %27 = load i8, i8* %26, align 1
  store i8 %27, i8* %24, align 1
  %28 = getelementptr inbounds i8, i8* %.012, i64 3
  %29 = add i32 %.03, -1
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %._crit_edge.loopexit, label %13

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_16bit_row(%struct.jpeg_compress_struct* nocapture readonly, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %7 = load i8**, i8*** %6, align 8
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast %struct.cjpeg_source_struct* %1 to %struct._tga_source_struct*
  %sunkaddr14 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr15 = add i64 %sunkaddr14, 80
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to void (%struct._tga_source_struct*)**
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr17 = add i64 %sunkaddr, 88
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i8*
  %sunkaddr19 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr20 = add i64 %sunkaddr19, 89
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i8*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph
  %.03 = phi i32 [ %4, %.lr.ph ], [ %35, %10 ]
  %.012 = phi i8* [ %8, %.lr.ph ], [ %34, %10 ]
  %11 = load void (%struct._tga_source_struct*)*, void (%struct._tga_source_struct*)** %sunkaddr16, align 8
  tail call void %11(%struct._tga_source_struct* nonnull %9) #3
  %12 = load i8, i8* %sunkaddr18, align 8
  %13 = zext i8 %12 to i32
  %14 = load i8, i8* %sunkaddr21, align 1
  %15 = zext i8 %14 to i32
  %16 = shl nuw nsw i32 %15, 8
  %17 = or i32 %16, %13
  %18 = and i32 %13, 31
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds [32 x i8], [32 x i8]* @c5to8bits, i64 0, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = getelementptr inbounds i8, i8* %.012, i64 2
  store i8 %21, i8* %22, align 1
  %23 = lshr i32 %17, 5
  %24 = and i32 %23, 31
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [32 x i8], [32 x i8]* @c5to8bits, i64 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = getelementptr inbounds i8, i8* %.012, i64 1
  store i8 %27, i8* %28, align 1
  %29 = lshr i32 %15, 2
  %30 = and i32 %29, 31
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds [32 x i8], [32 x i8]* @c5to8bits, i64 0, i64 %31
  %33 = load i8, i8* %32, align 1
  store i8 %33, i8* %.012, align 1
  %34 = getelementptr inbounds i8, i8* %.012, i64 3
  %35 = add i32 %.03, -1
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %._crit_edge.loopexit, label %10

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_24bit_row(%struct.jpeg_compress_struct* nocapture readonly, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %7 = load i8**, i8*** %6, align 8
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast %struct.cjpeg_source_struct* %1 to %struct._tga_source_struct*
  %sunkaddr17 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr18 = add i64 %sunkaddr17, 80
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to void (%struct._tga_source_struct*)**
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr20 = add i64 %sunkaddr, 90
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i8*
  %sunkaddr22 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr23 = add i64 %sunkaddr22, 89
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to i8*
  %sunkaddr25 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr26 = add i64 %sunkaddr25, 88
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to i8*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph
  %.03 = phi i32 [ %4, %.lr.ph ], [ %18, %10 ]
  %.012 = phi i8* [ %8, %.lr.ph ], [ %17, %10 ]
  %11 = load void (%struct._tga_source_struct*)*, void (%struct._tga_source_struct*)** %sunkaddr19, align 8
  tail call void %11(%struct._tga_source_struct* nonnull %9) #3
  %12 = load i8, i8* %sunkaddr21, align 2
  %13 = getelementptr inbounds i8, i8* %.012, i64 1
  store i8 %12, i8* %.012, align 1
  %14 = load i8, i8* %sunkaddr24, align 1
  %15 = getelementptr inbounds i8, i8* %.012, i64 2
  store i8 %14, i8* %13, align 1
  %16 = load i8, i8* %sunkaddr27, align 8
  store i8 %16, i8* %15, align 1
  %17 = getelementptr inbounds i8, i8* %.012, i64 3
  %18 = add i32 %.03, -1
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %._crit_edge.loopexit, label %10

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_8bit_gray_row(%struct.jpeg_compress_struct* nocapture readonly, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %7 = load i8**, i8*** %6, align 8
  %8 = load i8*, i8** %7, align 8
  %9 = bitcast %struct.cjpeg_source_struct* %1 to %struct._tga_source_struct*
  %sunkaddr11 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 80
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to void (%struct._tga_source_struct*)**
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr14 = add i64 %sunkaddr, 88
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i8*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph
  %.03 = phi i32 [ %4, %.lr.ph ], [ %14, %10 ]
  %.012 = phi i8* [ %8, %.lr.ph ], [ %13, %10 ]
  %11 = load void (%struct._tga_source_struct*)*, void (%struct._tga_source_struct*)** %sunkaddr13, align 8
  tail call void %11(%struct._tga_source_struct* nonnull %9) #3
  %12 = load i8, i8* %sunkaddr15, align 8
  store i8 %12, i8* %.012, align 1
  %13 = getelementptr inbounds i8, i8* %.012, i64 1
  %14 = add i32 %.03, -1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %._crit_edge.loopexit, label %10

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @preload_image(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %4 = bitcast %struct.jpeg_progress_mgr** %3 to %struct.cdjpeg_progress_mgr**
  %5 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %2
  %9 = icmp eq %struct.cdjpeg_progress_mgr* %5, null
  br i1 %9, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  %10 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %11 = bitcast %struct.cdjpeg_progress_mgr* %5 to void (%struct.jpeg_common_struct*)**
  %12 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr54 = ptrtoint %struct.cdjpeg_progress_mgr* %5 to i64
  %sunkaddr55 = add i64 %sunkaddr54, 8
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to i64*
  %sunkaddr57 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr58 = add i64 %sunkaddr57, 44
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i32*
  %sunkaddr60 = ptrtoint %struct.cdjpeg_progress_mgr* %5 to i64
  %sunkaddr61 = add i64 %sunkaddr60, 16
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to i64*
  %sunkaddr63 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr64 = add i64 %sunkaddr63, 8
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to %struct.jpeg_memory_mgr**
  %sunkaddr66 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr67 = add i64 %sunkaddr66, 64
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to %struct.jvirt_sarray_control**
  %sunkaddr69 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr70 = add i64 %sunkaddr69, 32
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to i8***
  %sunkaddr72 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr73 = add i64 %sunkaddr72, 104
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  %13 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr40 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr41 = add i64 %sunkaddr40, 8
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to %struct.jpeg_memory_mgr**
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr43 = add i64 %sunkaddr, 64
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to %struct.jvirt_sarray_control**
  %sunkaddr45 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 32
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to i8***
  %sunkaddr48 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr49 = add i64 %sunkaddr48, 104
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  %sunkaddr51 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr52 = add i64 %sunkaddr51, 44
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to i32*
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %.lr.ph.split.us
  %.01.us = phi i32 [ %21, %.lr.ph.split.us ], [ 0, %.lr.ph.split.us.preheader ]
  %14 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr42, align 8
  %15 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %14, i64 0, i32 7
  %16 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %15, align 8
  %17 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %sunkaddr44, align 8
  %18 = tail call i8** %16(%struct.jpeg_common_struct* %13, %struct.jvirt_sarray_control* %17, i32 %.01.us, i32 1, i32 1) #3
  store i8** %18, i8*** %sunkaddr47, align 8
  %19 = load i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %sunkaddr50, align 8
  %20 = tail call i32 %19(%struct.jpeg_compress_struct* nonnull %0, %struct.cjpeg_source_struct* %1) #3
  %21 = add i32 %.01.us, 1
  %22 = load i32, i32* %sunkaddr53, align 4
  %23 = icmp ult i32 %21, %22
  br i1 %23, label %.lr.ph.split.us, label %._crit_edge.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %.lr.ph.split
  %.01 = phi i32 [ %35, %.lr.ph.split ], [ 0, %.lr.ph.split.preheader ]
  %24 = zext i32 %.01 to i64
  store i64 %24, i64* %sunkaddr56, align 8
  %25 = load i32, i32* %sunkaddr59, align 4
  %26 = zext i32 %25 to i64
  store i64 %26, i64* %sunkaddr62, align 8
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %11, align 8
  tail call void %27(%struct.jpeg_common_struct* %12) #3
  %28 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr65, align 8
  %29 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %28, i64 0, i32 7
  %30 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %29, align 8
  %31 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %sunkaddr68, align 8
  %32 = tail call i8** %30(%struct.jpeg_common_struct* %10, %struct.jvirt_sarray_control* %31, i32 %.01, i32 1, i32 1) #3
  store i8** %32, i8*** %sunkaddr71, align 8
  %33 = load i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)*, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %sunkaddr74, align 8
  %34 = tail call i32 %33(%struct.jpeg_compress_struct* nonnull %0, %struct.cjpeg_source_struct* %1) #3
  %35 = add i32 %.01, 1
  %36 = load i32, i32* %sunkaddr59, align 4
  %37 = icmp ult i32 %35, %36
  br i1 %37, label %.lr.ph.split, label %._crit_edge.loopexit76

._crit_edge.loopexit:                             ; preds = %.lr.ph.split.us
  br label %._crit_edge

._crit_edge.loopexit76:                           ; preds = %.lr.ph.split
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit76, %._crit_edge.loopexit, %2
  %38 = icmp eq %struct.cdjpeg_progress_mgr* %5, null
  br i1 %38, label %43, label %39

; <label>:39:                                     ; preds = %._crit_edge
  %40 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %5, i64 0, i32 1
  %41 = load i32, i32* %40, align 8
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %40, align 8
  br label %43

; <label>:43:                                     ; preds = %._crit_edge, %39
  %44 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_memory_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %44, align 8
  %45 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %46 = bitcast %struct._IO_FILE** %45 to i32*
  store i32 0, i32* %46, align 8
  %47 = tail call i32 @get_memory_row(%struct.jpeg_compress_struct* nonnull %0, %struct.cjpeg_source_struct* %1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @read_byte(%struct._tga_source_struct* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 0, i32 3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %3)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %16

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 1
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

; <label>:16:                                     ; preds = %1, %6
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @read_colormap(%struct._tga_source_struct* nocapture readonly, i32, i32) unnamed_addr #0 {
  %4 = icmp eq i32 %2, 24
  br i1 %4, label %.preheader, label %5

; <label>:5:                                      ; preds = %3
  %6 = getelementptr inbounds %struct._tga_source_struct, %struct._tga_source_struct* %0, i64 0, i32 1
  %7 = bitcast %struct.jpeg_compress_struct** %6 to %struct.jpeg_error_mgr***
  %8 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %7, align 8
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 1032, i32* %10, align 8
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %12 = bitcast %struct.jpeg_compress_struct* %11 to void (%struct.jpeg_common_struct*)***
  %13 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %12, align 8
  %14 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %13, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %11 to %struct.jpeg_common_struct*
  tail call void %14(%struct.jpeg_common_struct* %.cast) #3
  br label %.preheader

.preheader:                                       ; preds = %3, %5
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %wide.trip.count = zext i32 %1 to i64
  %sunkaddr5 = ptrtoint %struct._tga_source_struct* %0 to i64
  %sunkaddr6 = add i64 %sunkaddr5, 56
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i8***
  br label %16

; <label>:16:                                     ; preds = %16, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %16 ]
  %17 = tail call fastcc i32 @read_byte(%struct._tga_source_struct* %0)
  %18 = trunc i32 %17 to i8
  %19 = load i8**, i8*** %sunkaddr7, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i64 2
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv
  store i8 %18, i8* %22, align 1
  %23 = tail call fastcc i32 @read_byte(%struct._tga_source_struct* %0)
  %24 = trunc i32 %23 to i8
  %25 = load i8**, i8*** %sunkaddr7, align 8
  %26 = getelementptr inbounds i8*, i8** %25, i64 1
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 %indvars.iv
  store i8 %24, i8* %28, align 1
  %29 = tail call fastcc i32 @read_byte(%struct._tga_source_struct* %0)
  %30 = trunc i32 %29 to i8
  %31 = load i8**, i8*** %sunkaddr7, align 8
  %32 = load i8*, i8** %31, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 %indvars.iv
  store i8 %30, i8* %33, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %16

._crit_edge.loopexit:                             ; preds = %16
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  ret void
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_memory_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 3
  %6 = bitcast %struct._IO_FILE** %5 to i32*
  %7 = load i32, i32* %6, align 8
  %8 = add i32 %4, -1
  %9 = sub i32 %8, %7
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %11 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %11, i64 0, i32 7
  %13 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %12, align 8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %15 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 2
  %16 = bitcast void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %15 to %struct.jvirt_sarray_control**
  %17 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %16, align 8
  %18 = tail call i8** %13(%struct.jpeg_common_struct* %14, %struct.jvirt_sarray_control* %17, i32 %9, i32 1, i32 0) #3
  %19 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  store i8** %18, i8*** %19, align 8
  %20 = load i32, i32* %6, align 8
  %21 = add i32 %20, 1
  store i32 %21, i32* %6, align 8
  ret i32 1
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
