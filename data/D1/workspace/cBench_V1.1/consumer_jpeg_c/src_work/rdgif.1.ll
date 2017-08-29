; ModuleID = 'rdgif.ll'
source_filename = "rdgif.c"
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
%struct.gif_source_struct = type { %struct.cjpeg_source_struct, %struct.jpeg_compress_struct*, i8**, [260 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16*, i8*, i8*, i8*, i32, %struct.jvirt_sarray_control*, i32, i32, i32, i32 }
%struct.cdjpeg_progress_mgr = type { %struct.jpeg_progress_mgr, i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define %struct.cjpeg_source_struct* @jinit_read_gif(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 440) #4
  %8 = getelementptr inbounds i8, i8* %7, i64 48
  %9 = bitcast i8* %8 to %struct.jpeg_compress_struct**
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @start_input_gif, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %10, align 8
  %11 = getelementptr inbounds i8, i8* %7, i64 16
  %12 = bitcast i8* %11 to void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)**
  store void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @finish_input_gif, void (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %12, align 8
  %13 = bitcast i8* %7 to %struct.cjpeg_source_struct*
  ret %struct.cjpeg_source_struct* %13
}

; Function Attrs: noinline nounwind uwtable
define internal void @start_input_gif(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture) #0 {
  %3 = alloca [10 x i8], align 1
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %5 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %5, i64 0, i32 2
  %7 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %6, align 8
  %8 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %9 = tail call i8** %7(%struct.jpeg_common_struct* %8, i32 1, i32 256, i32 3) #4
  %10 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %11 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %10 to i8***
  store i8** %9, i8*** %11, align 8
  %12 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0
  %13 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 3
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8
  %15 = call i64 @fread(i8* nonnull %12, i64 1, i64 6, %struct._IO_FILE* %14)
  %16 = icmp eq i64 %15, 6
  br i1 %16, label %25, label %17

; <label>:17:                                     ; preds = %2
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 1016, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* %18) #4
  br label %25

; <label>:25:                                     ; preds = %2, %17
  %26 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0
  %27 = load i8, i8* %26, align 1
  %28 = icmp eq i8 %27, 71
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 1
  %31 = load i8, i8* %30, align 1
  %32 = icmp eq i8 %31, 73
  br i1 %32, label %33, label %37

; <label>:33:                                     ; preds = %29
  %34 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 2
  %35 = load i8, i8* %34, align 1
  %36 = icmp eq i8 %35, 70
  br i1 %36, label %45, label %37

; <label>:37:                                     ; preds = %33, %29, %25
  %38 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i64 0, i32 5
  store i32 1016, i32* %41, align 8
  %42 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %43 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %42, align 8
  %44 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %43, align 8
  tail call void %44(%struct.jpeg_common_struct* %38) #4
  br label %45

; <label>:45:                                     ; preds = %33, %37
  %46 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 3
  %47 = load i8, i8* %46, align 1
  %48 = icmp eq i8 %47, 56
  br i1 %48, label %49, label %.thread

; <label>:49:                                     ; preds = %45
  %50 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 4
  %51 = load i8, i8* %50, align 1
  %52 = icmp eq i8 %51, 55
  br i1 %52, label %53, label %57

; <label>:53:                                     ; preds = %49
  %54 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 5
  %55 = load i8, i8* %54, align 1
  %56 = icmp eq i8 %55, 97
  br i1 %56, label %86, label %57

; <label>:57:                                     ; preds = %53, %49
  %sunkaddr = ptrtoint [10 x i8]* %3 to i64
  %sunkaddr1 = add i64 %sunkaddr, 3
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i8*
  %.pr = load i8, i8* %sunkaddr2, align 1
  %58 = icmp eq i8 %.pr, 56
  br i1 %58, label %59, label %.thread

; <label>:59:                                     ; preds = %57
  %60 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 4
  %61 = load i8, i8* %60, align 1
  %62 = icmp eq i8 %61, 57
  br i1 %62, label %63, label %.thread

; <label>:63:                                     ; preds = %59
  %64 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 5
  %65 = load i8, i8* %64, align 1
  %66 = icmp eq i8 %65, 97
  br i1 %66, label %86, label %.thread

.thread:                                          ; preds = %63, %59, %57, %45
  %67 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %69 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %68, align 8
  %70 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 6, i32 0, i64 0
  %sunkaddr3 = ptrtoint [10 x i8]* %3 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 3
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i8*
  %71 = load i8, i8* %sunkaddr5, align 1
  %72 = sext i8 %71 to i32
  store i32 %72, i32* %70, align 4
  %73 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 4
  %74 = load i8, i8* %73, align 1
  %75 = sext i8 %74 to i32
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 6, i32 0, i64 1
  store i32 %75, i32* %76, align 4
  %77 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 5
  %78 = load i8, i8* %77, align 1
  %79 = sext i8 %78 to i32
  %80 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %69, i64 0, i32 6, i32 0, i64 2
  store i32 %79, i32* %80, align 4
  %81 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %68, align 8
  %82 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %81, i64 0, i32 5
  store i32 1018, i32* %82, align 8
  %83 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %68, align 8
  %84 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %83, i64 0, i32 1
  %85 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %84, align 8
  tail call void %85(%struct.jpeg_common_struct* %67, i32 1) #4
  br label %86

; <label>:86:                                     ; preds = %63, %53, %.thread
  %87 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0
  %sunkaddr6 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 24
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to %struct._IO_FILE**
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr8, align 8
  %89 = call i64 @fread(i8* nonnull %87, i64 1, i64 7, %struct._IO_FILE* %88)
  %90 = icmp eq i64 %89, 7
  br i1 %90, label %99, label %91

; <label>:91:                                     ; preds = %86
  %92 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %94 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %93, align 8
  %95 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %94, i64 0, i32 5
  store i32 42, i32* %95, align 8
  %96 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %97 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %96, align 8
  %98 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %97, align 8
  tail call void %98(%struct.jpeg_common_struct* %92) #4
  br label %99

; <label>:99:                                     ; preds = %86, %91
  %100 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 4
  %101 = load i8, i8* %100, align 1
  %102 = and i8 %101, 7
  %103 = zext i8 %102 to i32
  %104 = shl i32 2, %103
  %105 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 6
  %106 = load i8, i8* %105, align 1
  switch i8 %106, label %107 [
    i8 0, label %115
    i8 49, label %115
  ]

; <label>:107:                                    ; preds = %99
  %108 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %109 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %110 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %109, align 8
  %111 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %110, i64 0, i32 5
  store i32 1020, i32* %111, align 8
  %112 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %109, align 8
  %113 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %112, i64 0, i32 1
  %114 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %113, align 8
  tail call void %114(%struct.jpeg_common_struct* %108, i32 1) #4
  br label %115

; <label>:115:                                    ; preds = %99, %99, %107
  %sunkaddr9 = ptrtoint [10 x i8]* %3 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 4
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i8*
  %116 = load i8, i8* %sunkaddr11, align 1
  %117 = icmp slt i8 %116, 0
  br i1 %117, label %118, label %.backedge.preheader

; <label>:118:                                    ; preds = %115
  %119 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %sunkaddr12 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 56
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i8***
  %120 = load i8**, i8*** %sunkaddr14, align 8
  tail call fastcc void @ReadColorMap(%struct.gif_source_struct* %119, i32 %104, i8** %120)
  br label %.backedge.preheader

.backedge.preheader:                              ; preds = %115, %118
  %121 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %122 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %123 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %124 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %125 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %126 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %127 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  br label %.backedge

.backedge:                                        ; preds = %.backedge.backedge, %.backedge.preheader
  %128 = tail call fastcc i32 @ReadByte(%struct.gif_source_struct* %121)
  switch i32 %128, label %135 [
    i32 59, label %129
    i32 33, label %134
    i32 44, label %143
  ]

; <label>:129:                                    ; preds = %.backedge
  %130 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %125, align 8
  %131 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %130, i64 0, i32 5
  store i32 1015, i32* %131, align 8
  %132 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %126, align 8
  %133 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %132, align 8
  tail call void %133(%struct.jpeg_common_struct* %124) #4
  br label %135

; <label>:134:                                    ; preds = %.backedge
  tail call fastcc void @DoExtension(%struct.gif_source_struct* %127)
  br label %.backedge.backedge

.backedge.backedge:                               ; preds = %134, %135
  br label %.backedge

; <label>:135:                                    ; preds = %.backedge, %129
  %136 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %123, align 8
  %137 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %136, i64 0, i32 5
  store i32 1022, i32* %137, align 8
  %138 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %123, align 8
  %139 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %138, i64 0, i32 6, i32 0, i64 0
  store i32 %128, i32* %139, align 4
  %140 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %123, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i64 0, i32 1
  %142 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %141, align 8
  tail call void %142(%struct.jpeg_common_struct* %122, i32 -1) #4
  br label %.backedge.backedge

; <label>:143:                                    ; preds = %.backedge
  %144 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0
  %sunkaddr15 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 24
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to %struct._IO_FILE**
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** %sunkaddr17, align 8
  %146 = call i64 @fread(i8* nonnull %144, i64 1, i64 9, %struct._IO_FILE* %145)
  %147 = icmp eq i64 %146, 9
  br i1 %147, label %156, label %148

; <label>:148:                                    ; preds = %143
  %149 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %150 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %151 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %150, align 8
  %152 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %151, i64 0, i32 5
  store i32 42, i32* %152, align 8
  %153 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %154 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %153, align 8
  %155 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %154, align 8
  tail call void %155(%struct.jpeg_common_struct* %149) #4
  br label %156

; <label>:156:                                    ; preds = %143, %148
  %157 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 5
  %158 = load i8, i8* %157, align 1
  %159 = zext i8 %158 to i32
  %160 = shl nuw nsw i32 %159, 8
  %sunkaddr18 = ptrtoint [10 x i8]* %3 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 4
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i8*
  %161 = load i8, i8* %sunkaddr20, align 1
  %162 = zext i8 %161 to i32
  %163 = or i32 %160, %162
  %164 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 7
  %165 = load i8, i8* %164, align 1
  %166 = zext i8 %165 to i32
  %167 = shl nuw nsw i32 %166, 8
  %sunkaddr21 = ptrtoint [10 x i8]* %3 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 6
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i8*
  %168 = load i8, i8* %sunkaddr23, align 1
  %169 = zext i8 %168 to i32
  %170 = or i32 %167, %169
  %171 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 8
  %172 = load i8, i8* %171, align 1
  %173 = and i8 %172, 64
  %174 = zext i8 %173 to i32
  %175 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 8, i32 3
  %176 = bitcast %struct._IO_FILE** %175 to i32*
  store i32 %174, i32* %176, align 8
  %177 = icmp slt i8 %172, 0
  %178 = and i8 %172, 7
  %179 = zext i8 %178 to i32
  %180 = shl i32 2, %179
  br i1 %177, label %181, label %184

; <label>:181:                                    ; preds = %156
  %182 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %sunkaddr24 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr25 = add i64 %sunkaddr24, 56
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to i8***
  %183 = load i8**, i8*** %sunkaddr26, align 8
  tail call fastcc void @ReadColorMap(%struct.gif_source_struct* nonnull %182, i32 %180, i8** %183)
  br label %184

; <label>:184:                                    ; preds = %156, %181
  %.0 = phi i32 [ %180, %181 ], [ %104, %156 ]
  %185 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %186 = tail call fastcc i32 @ReadByte(%struct.gif_source_struct* nonnull %185)
  %187 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %185, i64 0, i32 8
  store i32 %186, i32* %187, align 4
  %.off = add i32 %186, -2
  %188 = icmp ugt i32 %.off, 9
  br i1 %188, label %189, label %200

; <label>:189:                                    ; preds = %184
  %190 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %191 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %192 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %191, align 8
  %193 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %192, i64 0, i32 5
  store i32 1013, i32* %193, align 8
  %sunkaddr27 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 340
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i32*
  %194 = load i32, i32* %sunkaddr29, align 4
  %195 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %191, align 8
  %196 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %195, i64 0, i32 6, i32 0, i64 0
  store i32 %194, i32* %196, align 4
  %197 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %198 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %197, align 8
  %199 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %198, align 8
  tail call void %199(%struct.jpeg_common_struct* %190) #4
  br label %200

; <label>:200:                                    ; preds = %184, %189
  %201 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %202 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %sunkaddr30 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 8
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to %struct.jpeg_memory_mgr**
  %203 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr32, align 8
  %204 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %203, i64 0, i32 1
  %205 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %204, align 8
  %206 = tail call i8* %205(%struct.jpeg_common_struct* %201, i32 1, i64 8192) #4
  %207 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 7, i32 5
  %208 = bitcast i32* %207 to i8**
  store i8* %206, i8** %208, align 8
  %209 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr32, align 8
  %210 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %209, i64 0, i32 1
  %211 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %210, align 8
  %212 = tail call i8* %211(%struct.jpeg_common_struct* %201, i32 1, i64 4096) #4
  %213 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 8
  %214 = bitcast %struct.cjpeg_source_struct* %213 to i8**
  store i8* %212, i8** %214, align 8
  %215 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr32, align 8
  %216 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %215, i64 0, i32 1
  %217 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %216, align 8
  %218 = tail call i8* %217(%struct.jpeg_common_struct* %201, i32 1, i64 4096) #4
  %219 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 8, i32 1
  %220 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %219 to i8**
  store i8* %218, i8** %220, align 8
  tail call fastcc void @InitLZWCode(%struct.gif_source_struct* nonnull %202)
  %sunkaddr33 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr34 = add i64 %sunkaddr33, 408
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to i32*
  %221 = load i32, i32* %sunkaddr35, align 8
  %222 = icmp eq i32 %221, 0
  br i1 %222, label %239, label %223

; <label>:223:                                    ; preds = %200
  %224 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr36 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 8
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to %struct.jpeg_memory_mgr**
  %225 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr38, align 8
  %226 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %225, i64 0, i32 4
  %227 = load %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %226, align 8
  %228 = tail call %struct.jvirt_sarray_control* %227(%struct.jpeg_common_struct* nonnull %224, i32 1, i32 0, i32 %163, i32 %170, i32 1) #4
  %229 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 8, i32 4
  %230 = bitcast i8*** %229 to %struct.jvirt_sarray_control**
  store %struct.jvirt_sarray_control* %228, %struct.jvirt_sarray_control** %230, align 8
  %231 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %232 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %231, align 8
  %233 = icmp eq %struct.jpeg_progress_mgr* %232, null
  br i1 %233, label %239, label %234

; <label>:234:                                    ; preds = %223
  %sunkaddr39 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 16
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to %struct.cdjpeg_progress_mgr**
  %235 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %sunkaddr41, align 8
  %236 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %235, i64 0, i32 2
  %237 = load i32, i32* %236, align 4
  %238 = add nsw i32 %237, 1
  store i32 %238, i32* %236, align 4
  br label %239

; <label>:239:                                    ; preds = %223, %200, %234
  %get_pixel_rows.sink = phi i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* [ @load_interlaced_image, %234 ], [ @get_pixel_rows, %200 ], [ @load_interlaced_image, %223 ]
  %240 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %241 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* %get_pixel_rows.sink, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %241, align 8
  %sunkaddr42 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr43 = add i64 %sunkaddr42, 8
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to %struct.jpeg_memory_mgr**
  %242 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr44, align 8
  %243 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %242, i64 0, i32 2
  %244 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %243, align 8
  %245 = mul nuw nsw i32 %163, 3
  %246 = tail call i8** %244(%struct.jpeg_common_struct* nonnull %240, i32 1, i32 %245, i32 1) #4
  %247 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  store i8** %246, i8*** %247, align 8
  %248 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 5
  store i32 1, i32* %248, align 8
  %249 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  store i32 2, i32* %249, align 4
  %250 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  store i32 3, i32* %250, align 8
  %251 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 11
  store i32 8, i32* %251, align 8
  %252 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  store i32 %163, i32* %252, align 8
  %253 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  store i32 %170, i32* %253, align 4
  %254 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %255 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %254, align 8
  %256 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %255, i64 0, i32 6, i32 0, i64 0
  store i32 %163, i32* %256, align 4
  %257 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %255, i64 0, i32 6, i32 0, i64 1
  store i32 %170, i32* %257, align 4
  %258 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %255, i64 0, i32 6, i32 0, i64 2
  store i32 %.0, i32* %258, align 4
  %259 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %254, align 8
  %260 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %259, i64 0, i32 5
  store i32 1017, i32* %260, align 8
  %261 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %254, align 8
  %262 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %261, i64 0, i32 1
  %263 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %262, align 8
  tail call void %263(%struct.jpeg_common_struct* nonnull %240, i32 1) #4
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @finish_input_gif(%struct.jpeg_compress_struct* nocapture, %struct.cjpeg_source_struct* nocapture) #1 {
  ret void
}

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @ReadColorMap(%struct.gif_source_struct* nocapture readonly, i32, i8** nocapture readonly) unnamed_addr #0 {
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  %sunkaddr9 = ptrtoint i8** %2 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 8
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i8**
  %sunkaddr = ptrtoint i8** %2 to i64
  %sunkaddr12 = add i64 %sunkaddr, 16
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i8**
  br label %5

; <label>:5:                                      ; preds = %5, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %5 ]
  %6 = tail call fastcc i32 @ReadByte(%struct.gif_source_struct* %0)
  %7 = trunc i32 %6 to i8
  %8 = load i8*, i8** %2, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 %indvars.iv
  store i8 %7, i8* %9, align 1
  %10 = tail call fastcc i32 @ReadByte(%struct.gif_source_struct* %0)
  %11 = trunc i32 %10 to i8
  %12 = load i8*, i8** %sunkaddr11, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 %indvars.iv
  store i8 %11, i8* %13, align 1
  %14 = tail call fastcc i32 @ReadByte(%struct.gif_source_struct* %0)
  %15 = trunc i32 %14 to i8
  %16 = load i8*, i8** %sunkaddr13, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 %indvars.iv
  store i8 %15, i8* %17, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %5

._crit_edge.loopexit:                             ; preds = %5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @ReadByte(%struct.gif_source_struct* nocapture readonly) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 0, i32 3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %3)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %16

; <label>:6:                                      ; preds = %1
  %7 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 1
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
  tail call void %15(%struct.jpeg_common_struct* %.cast) #4
  br label %16

; <label>:16:                                     ; preds = %1, %6
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @DoExtension(%struct.gif_source_struct* nocapture readonly) unnamed_addr #0 {
  %2 = tail call fastcc i32 @ReadByte(%struct.gif_source_struct* %0)
  %3 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 1
  %4 = bitcast %struct.jpeg_compress_struct** %3 to %struct.jpeg_error_mgr***
  %5 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %4, align 8
  %6 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %6, i64 0, i32 5
  store i32 1019, i32* %7, align 8
  %8 = bitcast %struct.jpeg_compress_struct** %3 to %struct.jpeg_error_mgr***
  %9 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %8, align 8
  %10 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %10, i64 0, i32 6, i32 0, i64 0
  store i32 %2, i32* %11, align 4
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %12, i64 0, i32 0
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %13, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 1
  %16 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %15, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %12 to %struct.jpeg_common_struct*
  tail call void %16(%struct.jpeg_common_struct* %.cast, i32 1) #4
  tail call fastcc void @SkipDataBlocks(%struct.gif_source_struct* %0)
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @InitLZWCode(%struct.gif_source_struct* nocapture) unnamed_addr #3 {
  %2 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 4
  store i32 2, i32* %2, align 4
  %3 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 5
  store i32 0, i32* %3, align 8
  %4 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 6
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 7
  store i32 0, i32* %5, align 8
  %6 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 8
  %7 = load i32, i32* %6, align 4
  %8 = shl i32 1, %7
  %9 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 9
  store i32 %8, i32* %9, align 8
  %10 = add nsw i32 %8, 1
  %11 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 10
  store i32 %10, i32* %11, align 4
  %12 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 14
  store i32 1, i32* %12, align 4
  tail call fastcc void @ReInitLZW(%struct.gif_source_struct* %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @load_interlaced_image(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*) #0 {
  %3 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 2
  %4 = bitcast %struct.jpeg_progress_mgr** %3 to %struct.cdjpeg_progress_mgr**
  %5 = load %struct.cdjpeg_progress_mgr*, %struct.cdjpeg_progress_mgr** %4, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 7
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %2
  %9 = icmp eq %struct.cdjpeg_progress_mgr* %5, null
  br i1 %9, label %.lr.ph8.split.us.preheader, label %.lr.ph8.split.preheader

.lr.ph8.split.preheader:                          ; preds = %.lr.ph8
  %10 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %11 = bitcast %struct.cdjpeg_progress_mgr* %5 to void (%struct.jpeg_common_struct*)**
  %12 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr60 = ptrtoint %struct.cdjpeg_progress_mgr* %5 to i64
  %sunkaddr61 = add i64 %sunkaddr60, 8
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to i64*
  %sunkaddr63 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr64 = add i64 %sunkaddr63, 44
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to i32*
  %sunkaddr66 = ptrtoint %struct.cdjpeg_progress_mgr* %5 to i64
  %sunkaddr67 = add i64 %sunkaddr66, 16
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to i64*
  %sunkaddr69 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr70 = add i64 %sunkaddr69, 8
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to %struct.jpeg_memory_mgr**
  %sunkaddr72 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr73 = add i64 %sunkaddr72, 416
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to %struct.jvirt_sarray_control**
  %sunkaddr75 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr76 = add i64 %sunkaddr75, 40
  %sunkaddr77 = inttoptr i64 %sunkaddr76 to i32*
  %sunkaddr78 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr79 = add i64 %sunkaddr78, 44
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to i32*
  %13 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  br label %.lr.ph8.split

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %14 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %sunkaddr49 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr50 = add i64 %sunkaddr49, 8
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to %struct.jpeg_memory_mgr**
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr52 = add i64 %sunkaddr, 416
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to %struct.jvirt_sarray_control**
  %sunkaddr54 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr55 = add i64 %sunkaddr54, 40
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to i32*
  %sunkaddr57 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr58 = add i64 %sunkaddr57, 44
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to i32*
  %15 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %.lr.ph8.split.us.preheader, %._crit_edge.us
  %.06.us = phi i32 [ %29, %._crit_edge.us ], [ 0, %.lr.ph8.split.us.preheader ]
  %16 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr51, align 8
  %17 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %16, i64 0, i32 7
  %18 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %17, align 8
  %19 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %sunkaddr53, align 8
  %20 = tail call i8** %18(%struct.jpeg_common_struct* %14, %struct.jvirt_sarray_control* %19, i32 %.06.us, i32 1, i32 1) #4
  %21 = load i32, i32* %sunkaddr56, align 8
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %._crit_edge.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.lr.ph8.split.us
  %23 = load i8*, i8** %20, align 8
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader
  %.015.us = phi i32 [ %27, %.lr.ph.us ], [ %21, %.lr.ph.us.preheader ]
  %.024.us = phi i8* [ %26, %.lr.ph.us ], [ %23, %.lr.ph.us.preheader ]
  %24 = tail call fastcc i32 @LZWReadByte(%struct.gif_source_struct* %15)
  %25 = trunc i32 %24 to i8
  store i8 %25, i8* %.024.us, align 1
  %26 = getelementptr inbounds i8, i8* %.024.us, i64 1
  %27 = add i32 %.015.us, -1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %._crit_edge.us.loopexit, label %.lr.ph.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph8.split.us
  %29 = add i32 %.06.us, 1
  %30 = load i32, i32* %sunkaddr59, align 4
  %31 = icmp ult i32 %29, %30
  br i1 %31, label %.lr.ph8.split.us, label %._crit_edge9.loopexit

.lr.ph8.split:                                    ; preds = %.lr.ph8.split.preheader, %._crit_edge
  %.06 = phi i32 [ %49, %._crit_edge ], [ 0, %.lr.ph8.split.preheader ]
  %32 = zext i32 %.06 to i64
  store i64 %32, i64* %sunkaddr62, align 8
  %33 = load i32, i32* %sunkaddr65, align 4
  %34 = zext i32 %33 to i64
  store i64 %34, i64* %sunkaddr68, align 8
  %35 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %11, align 8
  tail call void %35(%struct.jpeg_common_struct* %12) #4
  %36 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %sunkaddr71, align 8
  %37 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %36, i64 0, i32 7
  %38 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %37, align 8
  %39 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %sunkaddr74, align 8
  %40 = tail call i8** %38(%struct.jpeg_common_struct* %10, %struct.jvirt_sarray_control* %39, i32 %.06, i32 1, i32 1) #4
  %41 = load i32, i32* %sunkaddr77, align 8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph8.split
  %43 = load i8*, i8** %40, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.015 = phi i32 [ %47, %.lr.ph ], [ %41, %.lr.ph.preheader ]
  %.024 = phi i8* [ %46, %.lr.ph ], [ %43, %.lr.ph.preheader ]
  %44 = tail call fastcc i32 @LZWReadByte(%struct.gif_source_struct* %13)
  %45 = trunc i32 %44 to i8
  store i8 %45, i8* %.024, align 1
  %46 = getelementptr inbounds i8, i8* %.024, i64 1
  %47 = add i32 %.015, -1
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph8.split
  %49 = add i32 %.06, 1
  %50 = load i32, i32* %sunkaddr80, align 4
  %51 = icmp ult i32 %49, %50
  br i1 %51, label %.lr.ph8.split, label %._crit_edge9.loopexit82

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9.loopexit82:                          ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit82, %._crit_edge9.loopexit, %2
  %52 = icmp eq %struct.cdjpeg_progress_mgr* %5, null
  br i1 %52, label %57, label %53

; <label>:53:                                     ; preds = %._crit_edge9
  %54 = getelementptr inbounds %struct.cdjpeg_progress_mgr, %struct.cdjpeg_progress_mgr* %5, i64 0, i32 1
  %55 = load i32, i32* %54, align 8
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %54, align 8
  br label %57

; <label>:57:                                     ; preds = %._crit_edge9, %53
  %58 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %59 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)* @get_interlaced_row, i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %59, align 8
  %60 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 8, i32 5
  store i32 0, i32* %60, align 8
  %sunkaddr45 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 44
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to i32*
  %61 = load i32, i32* %sunkaddr47, align 4
  %62 = add i32 %61, 7
  %63 = lshr i32 %62, 3
  %64 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %58, i64 0, i32 24
  store i32 %63, i32* %64, align 4
  %65 = load i32, i32* %sunkaddr47, align 4
  %66 = add i32 %65, 3
  %67 = lshr i32 %66, 3
  %68 = add nuw nsw i32 %67, %63
  %69 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 9
  %70 = bitcast %struct.cjpeg_source_struct* %69 to i32*
  store i32 %68, i32* %70, align 8
  %71 = load i32, i32* %sunkaddr47, align 4
  %72 = add i32 %71, 1
  %73 = lshr i32 %72, 2
  %74 = add nuw nsw i32 %73, %68
  %75 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %58, i64 0, i32 26
  store i32 %74, i32* %75, align 4
  %76 = tail call i32 @get_interlaced_row(%struct.jpeg_compress_struct* nonnull %0, %struct.cjpeg_source_struct* %1)
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_pixel_rows(%struct.jpeg_compress_struct* nocapture readonly, %struct.cjpeg_source_struct*) #0 {
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
  %12 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %sunkaddr11 = ptrtoint i8** %5 to i64
  %sunkaddr12 = add i64 %sunkaddr11, 8
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to i8**
  %sunkaddr = ptrtoint i8** %5 to i64
  %sunkaddr14 = add i64 %sunkaddr, 16
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i8**
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph
  %.03 = phi i32 [ %7, %.lr.ph ], [ %28, %13 ]
  %.012 = phi i8* [ %11, %.lr.ph ], [ %27, %13 ]
  %14 = tail call fastcc i32 @LZWReadByte(%struct.gif_source_struct* %12)
  %15 = load i8*, i8** %5, align 8
  %16 = sext i32 %14 to i64
  %17 = getelementptr inbounds i8, i8* %15, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = getelementptr inbounds i8, i8* %.012, i64 1
  store i8 %18, i8* %.012, align 1
  %20 = load i8*, i8** %sunkaddr13, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 %16
  %22 = load i8, i8* %21, align 1
  %23 = getelementptr inbounds i8, i8* %.012, i64 2
  store i8 %22, i8* %19, align 1
  %24 = load i8*, i8** %sunkaddr15, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 %16
  %26 = load i8, i8* %25, align 1
  store i8 %26, i8* %23, align 1
  %27 = getelementptr inbounds i8, i8* %.012, i64 3
  %28 = add i32 %.03, -1
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %._crit_edge.loopexit, label %13

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret i32 1
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @SkipDataBlocks(%struct.gif_source_struct* nocapture readonly) unnamed_addr #0 {
  %2 = alloca [256 x i8], align 16
  %.sub = getelementptr inbounds [256 x i8], [256 x i8]* %2, i64 0, i64 0
  br label %3

; <label>:3:                                      ; preds = %3, %1
  %4 = call fastcc i32 @GetDataBlock(%struct.gif_source_struct* %0, i8* nonnull %.sub)
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %3, label %6

; <label>:6:                                      ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @GetDataBlock(%struct.gif_source_struct* nocapture readonly, i8* nocapture) unnamed_addr #0 {
  %3 = tail call fastcc i32 @ReadByte(%struct.gif_source_struct* %0)
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %21

; <label>:5:                                      ; preds = %2
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 0, i32 3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %9 = tail call i64 @fread(i8* %1, i64 1, i64 %6, %struct._IO_FILE* %8)
  %10 = icmp eq i64 %9, %6
  br i1 %10, label %21, label %11

; <label>:11:                                     ; preds = %5
  %12 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 1
  %13 = bitcast %struct.jpeg_compress_struct** %12 to %struct.jpeg_error_mgr***
  %14 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %13, align 8
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i64 0, i32 5
  store i32 42, i32* %16, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %12, align 8
  %18 = bitcast %struct.jpeg_compress_struct* %17 to void (%struct.jpeg_common_struct*)***
  %19 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %18, align 8
  %20 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %19, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %17 to %struct.jpeg_common_struct*
  tail call void %20(%struct.jpeg_common_struct* %.cast) #4
  br label %21

; <label>:21:                                     ; preds = %5, %2, %11
  ret i32 %3
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @ReInitLZW(%struct.gif_source_struct* nocapture) unnamed_addr #3 {
  %2 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 8
  %3 = load i32, i32* %2, align 4
  %4 = add nsw i32 %3, 1
  %5 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 11
  store i32 %4, i32* %5, align 8
  %6 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 9
  %7 = load i32, i32* %6, align 8
  %8 = shl i32 %7, 1
  %9 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 12
  store i32 %8, i32* %9, align 4
  %10 = add nsw i32 %7, 2
  %11 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 13
  store i32 %10, i32* %11, align 8
  %12 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 19
  %13 = bitcast i8** %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 20
  %16 = bitcast i8** %15 to i64*
  store i64 %14, i64* %16, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @LZWReadByte(%struct.gif_source_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 14
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5:                                      ; preds = %1
  %sunkaddr = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr, 364
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  store i32 0, i32* %sunkaddr11, align 4
  %6 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 9
  %7 = load i32, i32* %6, align 8
  br label %20

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 20
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 19
  %12 = load i8*, i8** %11, align 8
  %13 = icmp ugt i8* %10, %12
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %8
  %15 = getelementptr inbounds i8, i8* %10, i64 -1
  %sunkaddr12 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 400
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i8**
  store i8* %15, i8** %sunkaddr14, align 8
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  br label %138

; <label>:18:                                     ; preds = %8
  %19 = tail call fastcc i32 @GetCode(%struct.gif_source_struct* nonnull %0)
  br label %20

; <label>:20:                                     ; preds = %18, %5
  %.02 = phi i32 [ %7, %5 ], [ %19, %18 ]
  %21 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 9
  %22 = load i32, i32* %21, align 8
  %23 = icmp eq i32 %.02, %22
  br i1 %23, label %24, label %45

; <label>:24:                                     ; preds = %20
  tail call fastcc void @ReInitLZW(%struct.gif_source_struct* nonnull %0)
  %sunkaddr67 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr68 = add i64 %sunkaddr67, 344
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i32*
  br label %25

; <label>:25:                                     ; preds = %25, %24
  %26 = tail call fastcc i32 @GetCode(%struct.gif_source_struct* nonnull %0)
  %27 = load i32, i32* %sunkaddr69, align 8
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %25, label %29

; <label>:29:                                     ; preds = %25
  %30 = icmp sgt i32 %26, %27
  br i1 %30, label %31, label %42

; <label>:31:                                     ; preds = %29
  %32 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 1
  %33 = bitcast %struct.jpeg_compress_struct** %32 to %struct.jpeg_error_mgr***
  %34 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %33, align 8
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i64 0, i32 5
  store i32 1021, i32* %36, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %32, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i64 0, i32 0
  %39 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %38, align 8
  %40 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %39, i64 0, i32 1
  %41 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %40, align 8
  %.cast5 = bitcast %struct.jpeg_compress_struct* %37 to %struct.jpeg_common_struct*
  tail call void %41(%struct.jpeg_common_struct* %.cast5, i32 -1) #4
  br label %42

; <label>:42:                                     ; preds = %29, %31
  %.13 = phi i32 [ 0, %31 ], [ %26, %29 ]
  %43 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 15
  store i32 %.13, i32* %43, align 8
  %44 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 16
  store i32 %.13, i32* %44, align 4
  br label %138

; <label>:45:                                     ; preds = %20
  %46 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 10
  %47 = load i32, i32* %46, align 4
  %48 = icmp eq i32 %.02, %47
  br i1 %48, label %49, label %65

; <label>:49:                                     ; preds = %45
  %50 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 7
  %51 = load i32, i32* %50, align 8
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %54

; <label>:53:                                     ; preds = %49
  tail call fastcc void @SkipDataBlocks(%struct.gif_source_struct* nonnull %0)
  %sunkaddr18 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr19 = add i64 %sunkaddr18, 336
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to i32*
  store i32 1, i32* %sunkaddr20, align 8
  br label %54

; <label>:54:                                     ; preds = %49, %53
  %55 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 1
  %56 = bitcast %struct.jpeg_compress_struct** %55 to %struct.jpeg_error_mgr***
  %57 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %56, align 8
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i64 0, i32 5
  store i32 1023, i32* %59, align 8
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %55, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i64 0, i32 0
  %62 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %62, i64 0, i32 1
  %64 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %63, align 8
  %.cast4 = bitcast %struct.jpeg_compress_struct* %60 to %struct.jpeg_common_struct*
  tail call void %64(%struct.jpeg_common_struct* %.cast4, i32 -1) #4
  br label %138

; <label>:65:                                     ; preds = %45
  %66 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 13
  %67 = load i32, i32* %66, align 8
  %68 = icmp slt i32 %.02, %67
  br i1 %68, label %91, label %69

; <label>:69:                                     ; preds = %65
  %70 = icmp sgt i32 %.02, %67
  br i1 %70, label %71, label %82

; <label>:71:                                     ; preds = %69
  %72 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 1
  %73 = bitcast %struct.jpeg_compress_struct** %72 to %struct.jpeg_error_mgr***
  %74 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %73, align 8
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %74, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i64 0, i32 5
  store i32 1021, i32* %76, align 8
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %72, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %77, i64 0, i32 0
  %79 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %79, i64 0, i32 1
  %81 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %80, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %77 to %struct.jpeg_common_struct*
  tail call void %81(%struct.jpeg_common_struct* %.cast, i32 -1) #4
  br label %82

; <label>:82:                                     ; preds = %69, %71
  %.01 = phi i32 [ 0, %71 ], [ %.02, %69 ]
  %83 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 16
  %84 = load i32, i32* %83, align 4
  %85 = trunc i32 %84 to i8
  %86 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 20
  %87 = load i8*, i8** %86, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 1
  store i8* %88, i8** %86, align 8
  store i8 %85, i8* %87, align 1
  %89 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 15
  %90 = load i32, i32* %89, align 8
  br label %91

; <label>:91:                                     ; preds = %65, %82
  %.2 = phi i32 [ %90, %82 ], [ %.02, %65 ]
  %.1 = phi i32 [ %.01, %82 ], [ %.02, %65 ]
  %sunkaddr21 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 344
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %92 = load i32, i32* %sunkaddr23, align 8
  %93 = icmp slt i32 %.2, %92
  br i1 %93, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %91
  %sunkaddr70 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr71 = add i64 %sunkaddr70, 384
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i8**
  %sunkaddr73 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr74 = add i64 %sunkaddr73, 400
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i8**
  %sunkaddr76 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr77 = add i64 %sunkaddr76, 376
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i16**
  %sunkaddr79 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 344
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i32*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.37 = phi i32 [ %103, %.lr.ph ], [ %.2, %.lr.ph.preheader ]
  %94 = load i8*, i8** %sunkaddr72, align 8
  %95 = sext i32 %.37 to i64
  %96 = getelementptr inbounds i8, i8* %94, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = load i8*, i8** %sunkaddr75, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 1
  store i8* %99, i8** %sunkaddr75, align 8
  store i8 %97, i8* %98, align 1
  %100 = load i16*, i16** %sunkaddr78, align 8
  %101 = getelementptr inbounds i16, i16* %100, i64 %95
  %102 = load i16, i16* %101, align 2
  %103 = zext i16 %102 to i32
  %104 = load i32, i32* %sunkaddr81, align 8
  %105 = icmp slt i32 %103, %104
  br i1 %105, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %91
  %.3.lcssa = phi i32 [ %.2, %91 ], [ %103, %._crit_edge.loopexit ]
  %106 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 16
  store i32 %.3.lcssa, i32* %106, align 4
  %sunkaddr36 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr37 = add i64 %sunkaddr36, 360
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to i32*
  %107 = load i32, i32* %sunkaddr38, align 8
  %108 = sext i32 %107 to i64
  %109 = icmp slt i32 %107, 4096
  br i1 %109, label %110, label %135

; <label>:110:                                    ; preds = %._crit_edge
  %111 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 15
  %112 = load i32, i32* %111, align 8
  %113 = trunc i32 %112 to i16
  %114 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 17
  %115 = load i16*, i16** %114, align 8
  %116 = getelementptr inbounds i16, i16* %115, i64 %108
  store i16 %113, i16* %116, align 2
  %sunkaddr39 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr40 = add i64 %sunkaddr39, 372
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to i32*
  %117 = load i32, i32* %sunkaddr41, align 4
  %118 = trunc i32 %117 to i8
  %119 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 18
  %120 = load i8*, i8** %119, align 8
  %121 = getelementptr inbounds i8, i8* %120, i64 %108
  store i8 %118, i8* %121, align 1
  %sunkaddr42 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr43 = add i64 %sunkaddr42, 360
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to i32*
  %122 = load i32, i32* %sunkaddr44, align 8
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %sunkaddr44, align 8
  %124 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 12
  %125 = load i32, i32* %124, align 4
  %126 = icmp slt i32 %123, %125
  br i1 %126, label %135, label %127

; <label>:127:                                    ; preds = %110
  %128 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 11
  %129 = load i32, i32* %128, align 8
  %130 = icmp slt i32 %129, 12
  br i1 %130, label %131, label %135

; <label>:131:                                    ; preds = %127
  %132 = add nsw i32 %129, 1
  %sunkaddr45 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr46 = add i64 %sunkaddr45, 352
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to i32*
  store i32 %132, i32* %sunkaddr47, align 8
  %sunkaddr48 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr49 = add i64 %sunkaddr48, 356
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to i32*
  %133 = load i32, i32* %sunkaddr50, align 4
  %134 = shl i32 %133, 1
  store i32 %134, i32* %sunkaddr50, align 4
  br label %135

; <label>:135:                                    ; preds = %127, %110, %._crit_edge, %131
  %136 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 15
  store i32 %.1, i32* %136, align 8
  %sunkaddr51 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr52 = add i64 %sunkaddr51, 372
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to i32*
  %137 = load i32, i32* %sunkaddr53, align 4
  br label %138

; <label>:138:                                    ; preds = %135, %54, %42, %14
  %.0 = phi i32 [ %.13, %42 ], [ 0, %54 ], [ %137, %135 ], [ %17, %14 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_interlaced_row(%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct* nocapture) #0 {
  %3 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 1, i32 1
  %4 = bitcast i32 (%struct.jpeg_compress_struct*, %struct.cjpeg_source_struct*)** %3 to i8***
  %5 = load i8**, i8*** %4, align 8
  %6 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 8, i32 5
  %7 = load i32, i32* %6, align 8
  %trunc = trunc i32 %7 to i3
  switch i3 %trunc, label %23 [
    i3 0, label %8
    i3 -4, label %10
    i3 2, label %16
    i3 -2, label %16
  ]

; <label>:8:                                      ; preds = %2
  %9 = lshr i32 %7, 3
  br label %29

; <label>:10:                                     ; preds = %2
  %11 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %12 = lshr i32 %7, 3
  %13 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %11, i64 0, i32 24
  %14 = load i32, i32* %13, align 4
  %15 = add i32 %14, %12
  br label %29

; <label>:16:                                     ; preds = %2, %2
  %sunkaddr = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr7 = add i64 %sunkaddr, 424
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %17 = load i32, i32* %sunkaddr8, align 8
  %18 = lshr i32 %17, 2
  %19 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 9
  %20 = bitcast %struct.cjpeg_source_struct* %19 to i32*
  %21 = load i32, i32* %20, align 8
  %22 = add i32 %18, %21
  br label %29

; <label>:23:                                     ; preds = %2
  %24 = bitcast %struct.cjpeg_source_struct* %1 to %struct.gif_source_struct*
  %25 = lshr i32 %7, 1
  %26 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %24, i64 0, i32 26
  %27 = load i32, i32* %26, align 4
  %28 = add i32 %27, %25
  br label %29

; <label>:29:                                     ; preds = %23, %16, %10, %8
  %.0 = phi i32 [ %28, %23 ], [ %22, %16 ], [ %15, %10 ], [ %9, %8 ]
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %31 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %31, i64 0, i32 7
  %33 = load i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)** %32, align 8
  %34 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %35 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 8, i32 4
  %36 = bitcast i8*** %35 to %struct.jvirt_sarray_control**
  %37 = load %struct.jvirt_sarray_control*, %struct.jvirt_sarray_control** %36, align 8
  %38 = tail call i8** %33(%struct.jpeg_common_struct* %34, %struct.jvirt_sarray_control* %37, i32 %.0, i32 1, i32 0) #4
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %40 = load i32, i32* %39, align 8
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %29
  %42 = getelementptr inbounds %struct.cjpeg_source_struct, %struct.cjpeg_source_struct* %1, i64 0, i32 4
  %43 = load i8**, i8*** %42, align 8
  %44 = load i8*, i8** %43, align 8
  %45 = load i8*, i8** %38, align 8
  %xtraiter = and i32 %40, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %46 = load i8, i8* %45, align 1
  %47 = load i8*, i8** %5, align 8
  %48 = zext i8 %46 to i64
  %49 = getelementptr inbounds i8, i8* %47, i64 %48
  %50 = load i8, i8* %49, align 1
  %51 = getelementptr inbounds i8, i8* %44, i64 1
  store i8 %50, i8* %44, align 1
  %sunkaddr9 = ptrtoint i8** %5 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 8
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i8**
  %52 = load i8*, i8** %sunkaddr11, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 %48
  %54 = load i8, i8* %53, align 1
  %55 = getelementptr inbounds i8, i8* %44, i64 2
  store i8 %54, i8* %51, align 1
  %sunkaddr12 = ptrtoint i8** %5 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 16
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i8**
  %56 = load i8*, i8** %sunkaddr14, align 8
  %57 = getelementptr inbounds i8, i8* %56, i64 %48
  %58 = load i8, i8* %57, align 1
  store i8 %58, i8* %55, align 1
  %59 = getelementptr inbounds i8, i8* %44, i64 3
  %60 = getelementptr inbounds i8, i8* %45, i64 1
  %61 = add i32 %40, -1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %.016.unr = phi i32 [ %61, %.prol.preheader ], [ %40, %.lr.ph ]
  %.025.unr = phi i8* [ %59, %.prol.preheader ], [ %44, %.lr.ph ]
  %.034.unr = phi i8* [ %60, %.prol.preheader ], [ %45, %.lr.ph ]
  %62 = icmp eq i32 %40, 1
  br i1 %62, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr27 = ptrtoint i8** %5 to i64
  %sunkaddr28 = add i64 %sunkaddr27, 8
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to i8**
  %sunkaddr30 = ptrtoint i8** %5 to i64
  %sunkaddr31 = add i64 %sunkaddr30, 16
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to i8**
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %.016 = phi i32 [ %93, %.lr.ph.new ], [ %.016.unr, %.lr.ph.new.preheader ]
  %.025 = phi i8* [ %91, %.lr.ph.new ], [ %.025.unr, %.lr.ph.new.preheader ]
  %.034 = phi i8* [ %92, %.lr.ph.new ], [ %.034.unr, %.lr.ph.new.preheader ]
  %63 = load i8, i8* %.034, align 1
  %64 = load i8*, i8** %5, align 8
  %65 = zext i8 %63 to i64
  %66 = getelementptr inbounds i8, i8* %64, i64 %65
  %67 = load i8, i8* %66, align 1
  %68 = getelementptr inbounds i8, i8* %.025, i64 1
  store i8 %67, i8* %.025, align 1
  %69 = load i8*, i8** %sunkaddr29, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 %65
  %71 = load i8, i8* %70, align 1
  %72 = getelementptr inbounds i8, i8* %.025, i64 2
  store i8 %71, i8* %68, align 1
  %73 = load i8*, i8** %sunkaddr32, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 %65
  %75 = load i8, i8* %74, align 1
  store i8 %75, i8* %72, align 1
  %76 = getelementptr inbounds i8, i8* %.025, i64 3
  %77 = getelementptr inbounds i8, i8* %.034, i64 1
  %78 = load i8, i8* %77, align 1
  %79 = load i8*, i8** %5, align 8
  %80 = zext i8 %78 to i64
  %81 = getelementptr inbounds i8, i8* %79, i64 %80
  %82 = load i8, i8* %81, align 1
  %83 = getelementptr inbounds i8, i8* %.025, i64 4
  store i8 %82, i8* %76, align 1
  %84 = load i8*, i8** %sunkaddr29, align 8
  %85 = getelementptr inbounds i8, i8* %84, i64 %80
  %86 = load i8, i8* %85, align 1
  %87 = getelementptr inbounds i8, i8* %.025, i64 5
  store i8 %86, i8* %83, align 1
  %88 = load i8*, i8** %sunkaddr32, align 8
  %89 = getelementptr inbounds i8, i8* %88, i64 %80
  %90 = load i8, i8* %89, align 1
  store i8 %90, i8* %87, align 1
  %91 = getelementptr inbounds i8, i8* %.025, i64 6
  %92 = getelementptr inbounds i8, i8* %.034, i64 2
  %93 = add i32 %.016, -2
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %29
  %sunkaddr21 = ptrtoint %struct.cjpeg_source_struct* %1 to i64
  %sunkaddr22 = add i64 %sunkaddr21, 424
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to i32*
  %95 = load i32, i32* %sunkaddr23, align 8
  %96 = add i32 %95, 1
  store i32 %96, i32* %sunkaddr23, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @GetCode(%struct.gif_source_struct*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 6
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 11
  %5 = load i32, i32* %4, align 8
  %6 = add nsw i32 %5, %3
  %7 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 5
  %8 = load i32, i32* %7, align 8
  %9 = icmp sgt i32 %6, %8
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1
  %10 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 3, i64 2
  %sunkaddr = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr20 = add i64 %sunkaddr, 336
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to i32*
  %11 = load i32, i32* %sunkaddr21, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %.lr.ph56.preheader, label %.loopexit

.lr.ph56.preheader:                               ; preds = %.lr.ph
  %sunkaddr61 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr62 = add i64 %sunkaddr61, 324
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to i32*
  %sunkaddr64 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr65 = add i64 %sunkaddr64, 64
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to i8*
  %sunkaddr67 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr68 = add i64 %sunkaddr67, 65
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i8*
  %sunkaddr31 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr71 = add i64 %sunkaddr31, 332
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i32*
  %sunkaddr73 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr74 = add i64 %sunkaddr73, 328
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i32*
  %sunkaddr76 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr77 = add i64 %sunkaddr76, 324
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %sunkaddr79 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 352
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i32*
  %sunkaddr58 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr59 = add i64 %sunkaddr58, 336
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to i32*
  br label %.lr.ph56

; <label>:13:                                     ; preds = %52
  %14 = load i32, i32* %sunkaddr60, align 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %.lr.ph56, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %13
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph
  %16 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 1
  %17 = bitcast %struct.jpeg_compress_struct** %16 to %struct.jpeg_error_mgr***
  %18 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %17, align 8
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 1024, i32* %20, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %16, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i64 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 1
  %25 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %24, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %21 to %struct.jpeg_common_struct*
  tail call void %25(%struct.jpeg_common_struct* %.cast, i32 -1) #4
  %26 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 10
  %27 = load i32, i32* %26, align 4
  br label %84

.lr.ph56:                                         ; preds = %.lr.ph56.preheader, %13
  %28 = load i32, i32* %sunkaddr63, align 4
  %29 = sext i32 %28 to i64
  %30 = sext i32 %28 to i64
  %31 = add nsw i64 %30, -2
  %32 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 3, i64 %31
  %33 = load i8, i8* %32, align 1
  store i8 %33, i8* %sunkaddr66, align 8
  %34 = add nsw i64 %29, -1
  %35 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 3, i64 %34
  %36 = load i8, i8* %35, align 1
  store i8 %36, i8* %sunkaddr69, align 1
  %37 = tail call fastcc i32 @GetDataBlock(%struct.gif_source_struct* nonnull %0, i8* nonnull %10)
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %52

; <label>:39:                                     ; preds = %.lr.ph56
  %sunkaddr32 = add i64 %sunkaddr31, 336
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to i32*
  store i32 1, i32* %sunkaddr33, align 8
  %40 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 1
  %41 = bitcast %struct.jpeg_compress_struct** %40 to %struct.jpeg_error_mgr***
  %42 = load %struct.jpeg_error_mgr**, %struct.jpeg_error_mgr*** %41, align 8
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 5
  store i32 1024, i32* %44, align 8
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %40, align 8
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %45, i64 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i64 0, i32 1
  %49 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %48, align 8
  %.cast1 = bitcast %struct.jpeg_compress_struct* %45 to %struct.jpeg_common_struct*
  tail call void %49(%struct.jpeg_common_struct* %.cast1, i32 -1) #4
  %50 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 10
  %51 = load i32, i32* %50, align 4
  br label %84

; <label>:52:                                     ; preds = %.lr.ph56
  %53 = load i32, i32* %sunkaddr72, align 4
  %54 = load i32, i32* %sunkaddr75, align 8
  %55 = add i32 %53, 16
  %56 = sub i32 %55, %54
  store i32 %56, i32* %sunkaddr72, align 4
  %57 = add nsw i32 %37, 2
  store i32 %57, i32* %sunkaddr78, align 4
  %58 = shl nsw i32 %57, 3
  store i32 %58, i32* %sunkaddr75, align 8
  %59 = load i32, i32* %sunkaddr81, align 8
  %60 = add nsw i32 %59, %56
  %61 = icmp sgt i32 %60, %58
  br i1 %61, label %13, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %52
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %.lcssa9 = phi i32 [ %3, %1 ], [ %56, %._crit_edge.loopexit ]
  %.lcssa6 = phi i32 [ %5, %1 ], [ %59, %._crit_edge.loopexit ]
  %.lcssa3 = phi i32 [ %6, %1 ], [ %60, %._crit_edge.loopexit ]
  %62 = ashr i32 %.lcssa9, 3
  %addconv87 = add nsw i32 %62, 2
  %addconv = sext i32 %addconv87 to i64
  %63 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 3, i64 %addconv
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 8
  %addconv88 = add nsw i32 %62, 1
  %addconv51 = sext i32 %addconv88 to i64
  %67 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 3, i64 %addconv51
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i64
  %70 = or i64 %66, %69
  %71 = shl nuw nsw i64 %70, 8
  %72 = sext i32 %62 to i64
  %73 = getelementptr inbounds %struct.gif_source_struct, %struct.gif_source_struct* %0, i64 0, i32 3, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i64
  %76 = or i64 %71, %75
  %77 = and i32 %.lcssa9, 7
  %78 = zext i32 %77 to i64
  %79 = lshr i64 %76, %78
  %80 = trunc i64 %79 to i32
  %81 = shl i32 1, %.lcssa6
  %82 = add nsw i32 %81, -1
  %83 = and i32 %80, %82
  %sunkaddr46 = ptrtoint %struct.gif_source_struct* %0 to i64
  %sunkaddr47 = add i64 %sunkaddr46, 332
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to i32*
  store i32 %.lcssa3, i32* %sunkaddr48, align 4
  br label %84

; <label>:84:                                     ; preds = %._crit_edge, %39, %.loopexit
  %.0 = phi i32 [ %27, %.loopexit ], [ %51, %39 ], [ %83, %._crit_edge ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
