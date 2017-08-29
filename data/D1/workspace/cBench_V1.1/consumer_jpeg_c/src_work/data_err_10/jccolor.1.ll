; ModuleID = 'jccolor.ll'
source_filename = "jccolor.c"
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
%struct.jpeg_destination_mgr = type { i8*, i64, {}*, i32 (%struct.jpeg_compress_struct*)*, {}* }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_scan_info = type { i32, [4 x i32], i32, i32, i32, i32 }
%struct.jpeg_comp_master = type { {}*, {}*, {}*, i32, i32 }
%struct.jpeg_c_main_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32)* }
%struct.jpeg_c_prep_controller = type { void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i8**, i32*, i32, i8***, i32*, i32)* }
%struct.jpeg_c_coef_controller = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, i8***)* }
%struct.jpeg_marker_writer = type { void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, {}*, {}*, {}*, {}*, {}* }
%struct.jpeg_color_converter = type { {}*, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* }
%struct.jpeg_downsampler = type { {}*, void (%struct.jpeg_compress_struct*, i8***, i32, i8***, i32)*, i32 }
%struct.jpeg_forward_dct = type { {}*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)* }
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, {}* }
%struct.my_color_converter = type { %struct.jpeg_color_converter, i64* }

; Function Attrs: noinline nounwind uwtable
define void @jinit_color_converter(%struct.jpeg_compress_struct*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %6 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %7 = tail call i8* %5(%struct.jpeg_common_struct* %6, i32 1, i64 24) #3
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %9 = bitcast %struct.jpeg_color_converter** %8 to i8**
  store i8* %7, i8** %9, align 8
  %10 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @null_method, void (%struct.jpeg_compress_struct*)** %10, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  %12 = load i32, i32* %11, align 4
  switch i32 %12, label %49 [
    i32 1, label %13
    i32 2, label %25
    i32 3, label %25
    i32 4, label %37
    i32 5, label %37
  ]

; <label>:13:                                     ; preds = %1
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %61, label %17

; <label>:17:                                     ; preds = %13
  %18 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %20 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %19, align 8
  %21 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %20, i64 0, i32 5
  store i32 7, i32* %21, align 8
  %22 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %23 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %22, align 8
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  tail call void %24(%struct.jpeg_common_struct* nonnull %18) #3
  br label %61

; <label>:25:                                     ; preds = %1, %1
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 3
  br i1 %28, label %61, label %29

; <label>:29:                                     ; preds = %25
  %30 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i64 0, i32 5
  store i32 7, i32* %33, align 8
  %34 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %35 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %34, align 8
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  tail call void %36(%struct.jpeg_common_struct* nonnull %30) #3
  br label %61

; <label>:37:                                     ; preds = %1, %1
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %39 = load i32, i32* %38, align 8
  %40 = icmp eq i32 %39, 4
  br i1 %40, label %61, label %41

; <label>:41:                                     ; preds = %37
  %42 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %44 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %44, i64 0, i32 5
  store i32 7, i32* %45, align 8
  %46 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %47 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %46, align 8
  %48 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %47, align 8
  tail call void %48(%struct.jpeg_common_struct* nonnull %42) #3
  br label %61

; <label>:49:                                     ; preds = %1
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %51 = load i32, i32* %50, align 8
  %52 = icmp slt i32 %51, 1
  br i1 %52, label %53, label %61

; <label>:53:                                     ; preds = %49
  %54 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %56 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %56, i64 0, i32 5
  store i32 7, i32* %57, align 8
  %58 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %59 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %58, align 8
  %60 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %59, align 8
  tail call void %60(%struct.jpeg_common_struct* nonnull %54) #3
  br label %61

; <label>:61:                                     ; preds = %49, %53, %41, %37, %29, %25, %17, %13
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 13
  %63 = load i32, i32* %62, align 8
  switch i32 %63, label %182 [
    i32 1, label %64
    i32 2, label %88
    i32 3, label %111
    i32 4, label %135
    i32 5, label %158
  ]

; <label>:64:                                     ; preds = %61
  %65 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %66 = load i32, i32* %65, align 4
  %67 = icmp eq i32 %66, 1
  br i1 %67, label %76, label %68

; <label>:68:                                     ; preds = %64
  %69 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i64 0, i32 5
  store i32 8, i32* %72, align 8
  %73 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %74 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %73, align 8
  %75 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %74, align 8
  tail call void %75(%struct.jpeg_common_struct* nonnull %69) #3
  br label %76

; <label>:76:                                     ; preds = %64, %68
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr1 = add i64 %sunkaddr, 52
  %sunkaddr2 = inttoptr i64 %sunkaddr1 to i32*
  %77 = load i32, i32* %sunkaddr2, align 4
  switch i32 %77, label %80 [
    i32 1, label %199
    i32 2, label %78
    i32 3, label %199
  ]

; <label>:78:                                     ; preds = %76
  %79 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %79, align 8
  br label %199

; <label>:80:                                     ; preds = %76
  %81 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %83 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %83, i64 0, i32 5
  store i32 25, i32* %84, align 8
  %85 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %86 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %85, align 8
  %87 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %86, align 8
  tail call void %87(%struct.jpeg_common_struct* nonnull %81) #3
  ret void

; <label>:88:                                     ; preds = %61
  %89 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %90 = load i32, i32* %89, align 4
  %91 = icmp eq i32 %90, 3
  br i1 %91, label %100, label %92

; <label>:92:                                     ; preds = %88
  %93 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %94 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %94, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i64 0, i32 5
  store i32 8, i32* %96, align 8
  %97 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %98 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %97, align 8
  %99 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %98, align 8
  tail call void %99(%struct.jpeg_common_struct* nonnull %93) #3
  br label %100

; <label>:100:                                    ; preds = %88, %92
  %sunkaddr3 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr4 = add i64 %sunkaddr3, 52
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to i32*
  %101 = load i32, i32* %sunkaddr5, align 4
  %102 = icmp eq i32 %101, 2
  br i1 %102, label %199, label %103

; <label>:103:                                    ; preds = %100
  %104 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i64 0, i32 5
  store i32 25, i32* %107, align 8
  %108 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %109 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %108, align 8
  %110 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %109, align 8
  tail call void %110(%struct.jpeg_common_struct* nonnull %104) #3
  ret void

; <label>:111:                                    ; preds = %61
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %113 = load i32, i32* %112, align 4
  %114 = icmp eq i32 %113, 3
  br i1 %114, label %123, label %115

; <label>:115:                                    ; preds = %111
  %116 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %117 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %118 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %117, align 8
  %119 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %118, i64 0, i32 5
  store i32 8, i32* %119, align 8
  %120 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %121 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %120, align 8
  %122 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %121, align 8
  tail call void %122(%struct.jpeg_common_struct* nonnull %116) #3
  br label %123

; <label>:123:                                    ; preds = %111, %115
  %sunkaddr6 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr7 = add i64 %sunkaddr6, 52
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to i32*
  %124 = load i32, i32* %sunkaddr8, align 4
  switch i32 %124, label %127 [
    i32 2, label %125
    i32 3, label %199
  ]

; <label>:125:                                    ; preds = %123
  %126 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %126, align 8
  br label %199

; <label>:127:                                    ; preds = %123
  %128 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %129 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %130 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %129, align 8
  %131 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %130, i64 0, i32 5
  store i32 25, i32* %131, align 8
  %132 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %133 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %132, align 8
  %134 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %133, align 8
  tail call void %134(%struct.jpeg_common_struct* nonnull %128) #3
  ret void

; <label>:135:                                    ; preds = %61
  %136 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %137 = load i32, i32* %136, align 4
  %138 = icmp eq i32 %137, 4
  br i1 %138, label %147, label %139

; <label>:139:                                    ; preds = %135
  %140 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %141 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %142 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %141, align 8
  %143 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %142, i64 0, i32 5
  store i32 8, i32* %143, align 8
  %144 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %145 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %144, align 8
  %146 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %145, align 8
  tail call void %146(%struct.jpeg_common_struct* nonnull %140) #3
  br label %147

; <label>:147:                                    ; preds = %135, %139
  %sunkaddr9 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr10 = add i64 %sunkaddr9, 52
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i32*
  %148 = load i32, i32* %sunkaddr11, align 4
  %149 = icmp eq i32 %148, 4
  br i1 %149, label %199, label %150

; <label>:150:                                    ; preds = %147
  %151 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %152 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %153 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %152, align 8
  %154 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %153, i64 0, i32 5
  store i32 25, i32* %154, align 8
  %155 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %156 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %155, align 8
  %157 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %156, align 8
  tail call void %157(%struct.jpeg_common_struct* nonnull %151) #3
  ret void

; <label>:158:                                    ; preds = %61
  %159 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %160 = load i32, i32* %159, align 4
  %161 = icmp eq i32 %160, 4
  br i1 %161, label %170, label %162

; <label>:162:                                    ; preds = %158
  %163 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %164 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %165 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %164, align 8
  %166 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %165, i64 0, i32 5
  store i32 8, i32* %166, align 8
  %167 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %168 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %167, align 8
  %169 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %168, align 8
  tail call void %169(%struct.jpeg_common_struct* nonnull %163) #3
  br label %170

; <label>:170:                                    ; preds = %158, %162
  %sunkaddr12 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr13 = add i64 %sunkaddr12, 52
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to i32*
  %171 = load i32, i32* %sunkaddr14, align 4
  switch i32 %171, label %174 [
    i32 4, label %172
    i32 5, label %199
  ]

; <label>:172:                                    ; preds = %170
  %173 = bitcast i8* %7 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %173, align 8
  br label %199

; <label>:174:                                    ; preds = %170
  %175 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %176 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %177 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %176, align 8
  %178 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %177, i64 0, i32 5
  store i32 25, i32* %178, align 8
  %179 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %180 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %179, align 8
  %181 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %180, align 8
  tail call void %181(%struct.jpeg_common_struct* nonnull %175) #3
  ret void

; <label>:182:                                    ; preds = %61
  %sunkaddr15 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr16 = add i64 %sunkaddr15, 52
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to i32*
  %183 = load i32, i32* %sunkaddr17, align 4
  %184 = icmp eq i32 %63, %183
  br i1 %184, label %185, label %191

; <label>:185:                                    ; preds = %182
  %186 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %187 = load i32, i32* %186, align 4
  %188 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %189 = load i32, i32* %188, align 8
  %190 = icmp eq i32 %187, %189
  br i1 %190, label %199, label %191

; <label>:191:                                    ; preds = %185, %182
  %192 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %193 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %194 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %193, align 8
  %195 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %194, i64 0, i32 5
  store i32 25, i32* %195, align 8
  %196 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %197 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %196, align 8
  %198 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %197, align 8
  tail call void %198(%struct.jpeg_common_struct* nonnull %192) #3
  br label %199

; <label>:199:                                    ; preds = %76, %191, %185, %170, %147, %123, %100, %76, %172, %125, %78
  %cmyk_ycck_convert.sink = phi void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* [ @cmyk_ycck_convert, %172 ], [ @rgb_ycc_convert, %125 ], [ @rgb_gray_convert, %78 ], [ @grayscale_convert, %76 ], [ @null_convert, %100 ], [ @null_convert, %123 ], [ @null_convert, %147 ], [ @null_convert, %170 ], [ @null_convert, %185 ], [ @null_convert, %191 ], [ @grayscale_convert, %76 ]
  %200 = getelementptr inbounds i8, i8* %7, i64 8
  %201 = bitcast i8* %200 to void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)**
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* %cmyk_ycck_convert.sink, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %201, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @null_method(%struct.jpeg_compress_struct* nocapture) #1 {
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @grayscale_convert(%struct.jpeg_compress_struct* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %7 = load i32, i32* %6, align 8
  %wide.trip.count.7 = zext i32 %7 to i64
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %9 = load i32, i32* %8, align 8
  %10 = sext i32 %9 to i64
  %11 = icmp slt i32 %4, 1
  %12 = icmp eq i32 %7, 0
  %or.cond = or i1 %11, %12
  br i1 %or.cond, label %._crit_edge, label %.lr.ph9.split.us.preheader

.lr.ph9.split.us.preheader:                       ; preds = %5
  %13 = add i32 %7, -1
  %xtraiter = and i32 %7, 7
  %14 = icmp eq i32 %xtraiter, 0
  %15 = icmp ult i32 %13, 7
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %..loopexit_crit_edge.us
  %.in = phi i32 [ %16, %..loopexit_crit_edge.us ], [ %4, %.lr.ph9.split.us.preheader ]
  %.018.us = phi i8** [ %49, %..loopexit_crit_edge.us ], [ %1, %.lr.ph9.split.us.preheader ]
  %.037.us = phi i32 [ %50, %..loopexit_crit_edge.us ], [ %3, %.lr.ph9.split.us.preheader ]
  %16 = add nsw i32 %.in, -1
  %17 = load i8*, i8** %.018.us, align 8
  %18 = load i8**, i8*** %2, align 8
  %19 = zext i32 %.037.us to i64
  %20 = getelementptr inbounds i8*, i8** %18, i64 %19
  %21 = load i8*, i8** %20, align 8
  br i1 %14, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph9.split.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.025.us.prol = phi i8* [ %24, %.prol.preheader ], [ %17, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = load i8, i8* %.025.us.prol, align 1
  %23 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv.prol
  store i8 %22, i8* %23, align 1
  %24 = getelementptr inbounds i8, i8* %.025.us.prol, i64 %10
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph9.split.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.025.us.unr = phi i8* [ %17, %.lr.ph9.split.us ], [ %24, %.prol.loopexit.loopexit ]
  br i1 %15, label %..loopexit_crit_edge.us, label %.lr.ph9.split.us.new.preheader

.lr.ph9.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph9.split.us.new

.lr.ph9.split.us.new:                             ; preds = %.lr.ph9.split.us.new.preheader, %.lr.ph9.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph9.split.us.new ], [ %indvars.iv.unr, %.lr.ph9.split.us.new.preheader ]
  %.025.us = phi i8* [ %48, %.lr.ph9.split.us.new ], [ %.025.us.unr, %.lr.ph9.split.us.new.preheader ]
  %25 = load i8, i8* %.025.us, align 1
  %26 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv
  store i8 %25, i8* %26, align 1
  %27 = getelementptr inbounds i8, i8* %.025.us, i64 %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = load i8, i8* %27, align 1
  %29 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv.next
  store i8 %28, i8* %29, align 1
  %30 = getelementptr inbounds i8, i8* %27, i64 %10
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %31 = load i8, i8* %30, align 1
  %32 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv.next.1
  store i8 %31, i8* %32, align 1
  %33 = getelementptr inbounds i8, i8* %30, i64 %10
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %34 = load i8, i8* %33, align 1
  %35 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv.next.2
  store i8 %34, i8* %35, align 1
  %36 = getelementptr inbounds i8, i8* %33, i64 %10
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %37 = load i8, i8* %36, align 1
  %38 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv.next.3
  store i8 %37, i8* %38, align 1
  %39 = getelementptr inbounds i8, i8* %36, i64 %10
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %40 = load i8, i8* %39, align 1
  %41 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv.next.4
  store i8 %40, i8* %41, align 1
  %42 = getelementptr inbounds i8, i8* %39, i64 %10
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %43 = load i8, i8* %42, align 1
  %44 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv.next.5
  store i8 %43, i8* %44, align 1
  %45 = getelementptr inbounds i8, i8* %42, i64 %10
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %46 = load i8, i8* %45, align 1
  %47 = getelementptr inbounds i8, i8* %21, i64 %indvars.iv.next.6
  store i8 %46, i8* %47, align 1
  %48 = getelementptr inbounds i8, i8* %45, i64 %10
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph9.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph9.split.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %49 = getelementptr inbounds i8*, i8** %.018.us, i64 1
  %50 = add i32 %.037.us, 1
  %51 = icmp sgt i32 %.in, 1
  br i1 %51, label %.lr.ph9.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @rgb_ycc_start(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %3 = bitcast %struct.jpeg_color_converter** %2 to %struct.my_color_converter**
  %4 = load %struct.my_color_converter*, %struct.my_color_converter** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %6 = bitcast %struct.jpeg_memory_mgr** %5 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %7 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %6, align 8
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %10 = tail call i8* %8(%struct.jpeg_common_struct* %9, i32 1, i64 16384) #3
  %11 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %4, i64 0, i32 1
  %12 = bitcast i64** %11 to i8**
  store i8* %10, i8** %12, align 8
  %13 = bitcast i8* %10 to i64*
  br label %14

; <label>:14:                                     ; preds = %14, %1
  %.01 = phi i64 [ 0, %1 ], [ %40, %14 ]
  %15 = mul nuw nsw i64 %.01, 19595
  %16 = getelementptr inbounds i64, i64* %13, i64 %.01
  store i64 %15, i64* %16, align 8
  %17 = mul nuw nsw i64 %.01, 38470
  %18 = add nuw nsw i64 %.01, 256
  %19 = getelementptr inbounds i64, i64* %13, i64 %18
  store i64 %17, i64* %19, align 8
  %20 = mul nuw nsw i64 %.01, 7471
  %21 = add nuw nsw i64 %20, 32768
  %22 = add nuw nsw i64 %.01, 512
  %23 = getelementptr inbounds i64, i64* %13, i64 %22
  store i64 %21, i64* %23, align 8
  %24 = mul nsw i64 %.01, -11059
  %25 = add nuw nsw i64 %.01, 768
  %26 = getelementptr inbounds i64, i64* %13, i64 %25
  store i64 %24, i64* %26, align 8
  %27 = mul nsw i64 %.01, -21709
  %28 = add nuw nsw i64 %.01, 1024
  %29 = getelementptr inbounds i64, i64* %13, i64 %28
  store i64 %27, i64* %29, align 8
  %30 = shl i64 %.01, 15
  %31 = add nuw nsw i64 %30, 8421375
  %32 = add nuw nsw i64 %.01, 1280
  %33 = getelementptr inbounds i64, i64* %13, i64 %32
  store i64 %31, i64* %33, align 8
  %34 = mul nsw i64 %.01, -27439
  %35 = add nuw nsw i64 %.01, 1536
  %36 = getelementptr inbounds i64, i64* %13, i64 %35
  store i64 %34, i64* %36, align 8
  %37 = mul nsw i64 %.01, -5329
  %38 = add nuw nsw i64 %.01, 1792
  %39 = getelementptr inbounds i64, i64* %13, i64 %38
  store i64 %37, i64* %39, align 8
  %40 = add nuw nsw i64 %.01, 1
  %exitcond = icmp eq i64 %40, 256
  br i1 %exitcond, label %41, label %14

; <label>:41:                                     ; preds = %14
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @rgb_gray_convert(%struct.jpeg_compress_struct* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %7 = bitcast %struct.jpeg_color_converter** %6 to %struct.my_color_converter**
  %8 = load %struct.my_color_converter*, %struct.my_color_converter** %7, align 8
  %9 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %8, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %wide.trip.count = zext i32 %12 to i64
  %13 = icmp slt i32 %4, 1
  %14 = icmp eq i32 %12, 0
  %or.cond = or i1 %13, %14
  br i1 %or.cond, label %._crit_edge, label %.lr.ph9.split.us.preheader

.lr.ph9.split.us.preheader:                       ; preds = %5
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %..loopexit_crit_edge.us
  %.in = phi i32 [ %15, %..loopexit_crit_edge.us ], [ %4, %.lr.ph9.split.us.preheader ]
  %.018.us = phi i8** [ %43, %..loopexit_crit_edge.us ], [ %1, %.lr.ph9.split.us.preheader ]
  %.037.us = phi i32 [ %44, %..loopexit_crit_edge.us ], [ %3, %.lr.ph9.split.us.preheader ]
  %15 = add nsw i32 %.in, -1
  %16 = load i8*, i8** %.018.us, align 8
  %17 = load i8**, i8*** %2, align 8
  %18 = zext i32 %.037.us to i64
  %19 = getelementptr inbounds i8*, i8** %17, i64 %18
  %20 = load i8*, i8** %19, align 8
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph9.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next, %21 ]
  %.025.us = phi i8* [ %16, %.lr.ph9.split.us ], [ %42, %21 ]
  %22 = load i8, i8* %.025.us, align 1
  %23 = getelementptr inbounds i8, i8* %.025.us, i64 1
  %24 = bitcast i8* %23 to <2 x i8>*
  %25 = load <2 x i8>, <2 x i8>* %24, align 1
  %26 = zext <2 x i8> %25 to <2 x i64>
  %27 = zext i8 %22 to i64
  %28 = getelementptr inbounds i64, i64* %10, i64 %27
  %29 = load i64, i64* %28, align 8
  %30 = or <2 x i64> %26, <i64 256, i64 512>
  %31 = extractelement <2 x i64> %30, i32 0
  %32 = extractelement <2 x i64> %30, i32 1
  %33 = getelementptr inbounds i64, i64* %10, i64 %31
  %34 = load i64, i64* %33, align 8
  %35 = add nsw i64 %34, %29
  %36 = getelementptr inbounds i64, i64* %10, i64 %32
  %37 = load i64, i64* %36, align 8
  %38 = add nsw i64 %35, %37
  %39 = lshr i64 %38, 16
  %40 = trunc i64 %39 to i8
  %41 = getelementptr inbounds i8, i8* %20, i64 %indvars.iv
  store i8 %40, i8* %41, align 1
  %42 = getelementptr inbounds i8, i8* %.025.us, i64 3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..loopexit_crit_edge.us, label %21

..loopexit_crit_edge.us:                          ; preds = %21
  %43 = getelementptr inbounds i8*, i8** %.018.us, i64 1
  %44 = add i32 %.037.us, 1
  %45 = icmp sgt i32 %.in, 1
  br i1 %45, label %.lr.ph9.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @null_convert(%struct.jpeg_compress_struct* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %7 = load i32, i32* %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %10 = load i32, i32* %9, align 8
  %wide.trip.count.7 = zext i32 %10 to i64
  %11 = icmp sgt i32 %4, 0
  %12 = icmp sgt i32 %7, 0
  %or.cond = and i1 %11, %12
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %5
  %13 = add i32 %10, -1
  %xtraiter = and i32 %10, 7
  %wide.trip.count27 = zext i32 %7 to i64
  %14 = icmp eq i32 %10, 0
  %15 = icmp eq i32 %xtraiter, 0
  %16 = icmp ult i32 %13, 7
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge10.us
  %.in = phi i32 [ %17, %._crit_edge10.us ], [ %4, %.preheader.us.preheader ]
  %.0112.us = phi i8** [ %19, %._crit_edge10.us ], [ %1, %.preheader.us.preheader ]
  %.0311.us = phi i32 [ %20, %._crit_edge10.us ], [ %3, %.preheader.us.preheader ]
  %17 = add nsw i32 %.in, -1
  %18 = zext i32 %.0311.us to i64
  br i1 %14, label %._crit_edge10.us, label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  br label %.lr.ph.us.us

._crit_edge10.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %.preheader.us
  %19 = getelementptr inbounds i8*, i8** %.0112.us, i64 1
  %20 = add i32 %.0311.us, 1
  %21 = icmp sgt i32 %.in, 1
  br i1 %21, label %.preheader.us, label %._crit_edge15.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %22 = load i8*, i8** %.0112.us, align 8
  %23 = getelementptr inbounds i8**, i8*** %2, i64 %indvars.iv25
  %24 = load i8**, i8*** %23, align 8
  %25 = getelementptr inbounds i8*, i8** %24, i64 %18
  %26 = load i8*, i8** %25, align 8
  br i1 %15, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.056.us.us.prol = phi i8* [ %30, %.prol.preheader ], [ %22, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %27 = getelementptr inbounds i8, i8* %.056.us.us.prol, i64 %indvars.iv25
  %28 = load i8, i8* %27, align 1
  %29 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv.prol
  store i8 %28, i8* %29, align 1
  %30 = getelementptr inbounds i8, i8* %.056.us.us.prol, i64 %8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.056.us.us.unr = phi i8* [ %22, %.lr.ph.us.us ], [ %30, %.prol.loopexit.loopexit ]
  br i1 %16, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond, label %._crit_edge10.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.us.us.new ], [ %indvars.iv.unr, %.lr.ph.us.us.new.preheader ]
  %.056.us.us = phi i8* [ %62, %.lr.ph.us.us.new ], [ %.056.us.us.unr, %.lr.ph.us.us.new.preheader ]
  %31 = getelementptr inbounds i8, i8* %.056.us.us, i64 %indvars.iv25
  %32 = load i8, i8* %31, align 1
  %33 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv
  store i8 %32, i8* %33, align 1
  %34 = getelementptr inbounds i8, i8* %.056.us.us, i64 %8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = getelementptr inbounds i8, i8* %34, i64 %indvars.iv25
  %36 = load i8, i8* %35, align 1
  %37 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv.next
  store i8 %36, i8* %37, align 1
  %38 = getelementptr inbounds i8, i8* %34, i64 %8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %39 = getelementptr inbounds i8, i8* %38, i64 %indvars.iv25
  %40 = load i8, i8* %39, align 1
  %41 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv.next.1
  store i8 %40, i8* %41, align 1
  %42 = getelementptr inbounds i8, i8* %38, i64 %8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %43 = getelementptr inbounds i8, i8* %42, i64 %indvars.iv25
  %44 = load i8, i8* %43, align 1
  %45 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv.next.2
  store i8 %44, i8* %45, align 1
  %46 = getelementptr inbounds i8, i8* %42, i64 %8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %47 = getelementptr inbounds i8, i8* %46, i64 %indvars.iv25
  %48 = load i8, i8* %47, align 1
  %49 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv.next.3
  store i8 %48, i8* %49, align 1
  %50 = getelementptr inbounds i8, i8* %46, i64 %8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %51 = getelementptr inbounds i8, i8* %50, i64 %indvars.iv25
  %52 = load i8, i8* %51, align 1
  %53 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv.next.4
  store i8 %52, i8* %53, align 1
  %54 = getelementptr inbounds i8, i8* %50, i64 %8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %55 = getelementptr inbounds i8, i8* %54, i64 %indvars.iv25
  %56 = load i8, i8* %55, align 1
  %57 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv.next.5
  store i8 %56, i8* %57, align 1
  %58 = getelementptr inbounds i8, i8* %54, i64 %8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %59 = getelementptr inbounds i8, i8* %58, i64 %indvars.iv25
  %60 = load i8, i8* %59, align 1
  %61 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv.next.6
  store i8 %60, i8* %61, align 1
  %62 = getelementptr inbounds i8, i8* %58, i64 %8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge15.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @rgb_ycc_convert(%struct.jpeg_compress_struct* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %7 = bitcast %struct.jpeg_color_converter** %6 to %struct.my_color_converter**
  %8 = load %struct.my_color_converter*, %struct.my_color_converter** %7, align 8
  %9 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %8, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %wide.trip.count = zext i32 %12 to i64
  %13 = icmp slt i32 %4, 1
  %14 = icmp eq i32 %12, 0
  %or.cond = or i1 %13, %14
  br i1 %or.cond, label %._crit_edge, label %.lr.ph9.split.us.preheader

.lr.ph9.split.us.preheader:                       ; preds = %5
  %sunkaddr = ptrtoint i8*** %2 to i64
  %sunkaddr11 = add i64 %sunkaddr, 8
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i8***
  %sunkaddr13 = ptrtoint i8*** %2 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 16
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i8***
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %..loopexit_crit_edge.us
  %.in = phi i32 [ %15, %..loopexit_crit_edge.us ], [ %4, %.lr.ph9.split.us.preheader ]
  %.018.us = phi i8** [ %87, %..loopexit_crit_edge.us ], [ %1, %.lr.ph9.split.us.preheader ]
  %.037.us = phi i32 [ %88, %..loopexit_crit_edge.us ], [ %3, %.lr.ph9.split.us.preheader ]
  %15 = add nsw i32 %.in, -1
  %16 = load i8*, i8** %.018.us, align 8
  %17 = load i8**, i8*** %2, align 8
  %18 = zext i32 %.037.us to i64
  %19 = getelementptr inbounds i8*, i8** %17, i64 %18
  %20 = load i8*, i8** %19, align 8
  %21 = load i8**, i8*** %sunkaddr12, align 8
  %22 = getelementptr inbounds i8*, i8** %21, i64 %18
  %23 = load i8*, i8** %22, align 8
  %24 = load i8**, i8*** %sunkaddr15, align 8
  %25 = getelementptr inbounds i8*, i8** %24, i64 %18
  %26 = load i8*, i8** %25, align 8
  br label %27

; <label>:27:                                     ; preds = %27, %.lr.ph9.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next, %27 ]
  %.025.us = phi i8* [ %16, %.lr.ph9.split.us ], [ %86, %27 ]
  %28 = load i8, i8* %.025.us, align 1
  %29 = zext i8 %28 to i32
  %30 = getelementptr inbounds i8, i8* %.025.us, i64 1
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = getelementptr inbounds i8, i8* %.025.us, i64 2
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = zext i8 %28 to i64
  %37 = getelementptr inbounds i64, i64* %10, i64 %36
  %38 = load i64, i64* %37, align 8
  %39 = or i32 %32, 256
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i64, i64* %10, i64 %40
  %42 = load i64, i64* %41, align 8
  %43 = add nsw i64 %42, %38
  %44 = or i32 %35, 512
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i64, i64* %10, i64 %45
  %47 = load i64, i64* %46, align 8
  %48 = add nsw i64 %43, %47
  %49 = lshr i64 %48, 16
  %50 = trunc i64 %49 to i8
  %51 = getelementptr inbounds i8, i8* %20, i64 %indvars.iv
  store i8 %50, i8* %51, align 1
  %52 = or i32 %29, 768
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i64, i64* %10, i64 %53
  %55 = load i64, i64* %54, align 8
  %56 = or i32 %32, 1024
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i64, i64* %10, i64 %57
  %59 = load i64, i64* %58, align 8
  %60 = add nsw i64 %59, %55
  %61 = or i32 %35, 1280
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i64, i64* %10, i64 %62
  %64 = load i64, i64* %63, align 8
  %65 = add nsw i64 %60, %64
  %66 = lshr i64 %65, 16
  %67 = trunc i64 %66 to i8
  %68 = getelementptr inbounds i8, i8* %23, i64 %indvars.iv
  store i8 %67, i8* %68, align 1
  %69 = or i32 %29, 1280
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i64, i64* %10, i64 %70
  %72 = load i64, i64* %71, align 8
  %73 = or i32 %32, 1536
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds i64, i64* %10, i64 %74
  %76 = load i64, i64* %75, align 8
  %77 = add nsw i64 %76, %72
  %78 = or i32 %35, 1792
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i64, i64* %10, i64 %79
  %81 = load i64, i64* %80, align 8
  %82 = add nsw i64 %77, %81
  %83 = lshr i64 %82, 16
  %84 = trunc i64 %83 to i8
  %85 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv
  store i8 %84, i8* %85, align 1
  %86 = getelementptr inbounds i8, i8* %.025.us, i64 3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..loopexit_crit_edge.us, label %27

..loopexit_crit_edge.us:                          ; preds = %27
  %87 = getelementptr inbounds i8*, i8** %.018.us, i64 1
  %88 = add i32 %.037.us, 1
  %89 = icmp sgt i32 %.in, 1
  br i1 %89, label %.lr.ph9.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @cmyk_ycck_convert(%struct.jpeg_compress_struct* nocapture readonly, i8** nocapture readonly, i8*** nocapture readonly, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %7 = bitcast %struct.jpeg_color_converter** %6 to %struct.my_color_converter**
  %8 = load %struct.my_color_converter*, %struct.my_color_converter** %7, align 8
  %9 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %8, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %wide.trip.count = zext i32 %12 to i64
  %13 = icmp slt i32 %4, 1
  %14 = icmp eq i32 %12, 0
  %or.cond = or i1 %13, %14
  br i1 %or.cond, label %._crit_edge, label %.lr.ph9.split.us.preheader

.lr.ph9.split.us.preheader:                       ; preds = %5
  %sunkaddr = ptrtoint i8*** %2 to i64
  %sunkaddr11 = add i64 %sunkaddr, 8
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to i8***
  %sunkaddr13 = ptrtoint i8*** %2 to i64
  %sunkaddr14 = add i64 %sunkaddr13, 16
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i8***
  %sunkaddr16 = ptrtoint i8*** %2 to i64
  %sunkaddr17 = add i64 %sunkaddr16, 24
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to i8***
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %..loopexit_crit_edge.us
  %.in = phi i32 [ %15, %..loopexit_crit_edge.us ], [ %4, %.lr.ph9.split.us.preheader ]
  %.018.us = phi i8** [ %96, %..loopexit_crit_edge.us ], [ %1, %.lr.ph9.split.us.preheader ]
  %.037.us = phi i32 [ %97, %..loopexit_crit_edge.us ], [ %3, %.lr.ph9.split.us.preheader ]
  %15 = add nsw i32 %.in, -1
  %16 = load i8*, i8** %.018.us, align 8
  %17 = load i8**, i8*** %2, align 8
  %18 = zext i32 %.037.us to i64
  %19 = getelementptr inbounds i8*, i8** %17, i64 %18
  %20 = load i8*, i8** %19, align 8
  %21 = load i8**, i8*** %sunkaddr12, align 8
  %22 = getelementptr inbounds i8*, i8** %21, i64 %18
  %23 = load i8*, i8** %22, align 8
  %24 = load i8**, i8*** %sunkaddr15, align 8
  %25 = getelementptr inbounds i8*, i8** %24, i64 %18
  %26 = load i8*, i8** %25, align 8
  %27 = load i8**, i8*** %sunkaddr18, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 %18
  %29 = load i8*, i8** %28, align 8
  br label %30

; <label>:30:                                     ; preds = %30, %.lr.ph9.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next, %30 ]
  %.025.us = phi i8* [ %16, %.lr.ph9.split.us ], [ %95, %30 ]
  %31 = load i8, i8* %.025.us, align 1
  %32 = xor i8 %31, -1
  %33 = zext i8 %32 to i32
  %34 = getelementptr inbounds i8, i8* %.025.us, i64 1
  %35 = load i8, i8* %34, align 1
  %36 = xor i8 %35, -1
  %37 = zext i8 %36 to i32
  %38 = getelementptr inbounds i8, i8* %.025.us, i64 2
  %39 = load i8, i8* %38, align 1
  %40 = xor i8 %39, -1
  %41 = zext i8 %40 to i32
  %42 = getelementptr inbounds i8, i8* %.025.us, i64 3
  %43 = load i8, i8* %42, align 1
  %44 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv
  store i8 %43, i8* %44, align 1
  %45 = zext i8 %32 to i64
  %46 = getelementptr inbounds i64, i64* %10, i64 %45
  %47 = load i64, i64* %46, align 8
  %48 = or i32 %37, 256
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i64, i64* %10, i64 %49
  %51 = load i64, i64* %50, align 8
  %52 = add nsw i64 %51, %47
  %53 = or i32 %41, 512
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i64, i64* %10, i64 %54
  %56 = load i64, i64* %55, align 8
  %57 = add nsw i64 %52, %56
  %58 = lshr i64 %57, 16
  %59 = trunc i64 %58 to i8
  %60 = getelementptr inbounds i8, i8* %20, i64 %indvars.iv
  store i8 %59, i8* %60, align 1
  %61 = or i32 %33, 768
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i64, i64* %10, i64 %62
  %64 = load i64, i64* %63, align 8
  %65 = or i32 %37, 1024
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i64, i64* %10, i64 %66
  %68 = load i64, i64* %67, align 8
  %69 = add nsw i64 %68, %64
  %70 = or i32 %41, 1280
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i64, i64* %10, i64 %71
  %73 = load i64, i64* %72, align 8
  %74 = add nsw i64 %69, %73
  %75 = lshr i64 %74, 16
  %76 = trunc i64 %75 to i8
  %77 = getelementptr inbounds i8, i8* %23, i64 %indvars.iv
  store i8 %76, i8* %77, align 1
  %78 = or i32 %33, 1280
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i64, i64* %10, i64 %79
  %81 = load i64, i64* %80, align 8
  %82 = or i32 %37, 1536
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i64, i64* %10, i64 %83
  %85 = load i64, i64* %84, align 8
  %86 = add nsw i64 %85, %81
  %87 = or i32 %41, 1792
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds i64, i64* %10, i64 %88
  %90 = load i64, i64* %89, align 8
  %91 = add nsw i64 %86, %90
  %92 = lshr i64 %91, 16
  %93 = trunc i64 %92 to i8
  %94 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv
  store i8 %93, i8* %94, align 1
  %95 = getelementptr inbounds i8, i8* %.025.us, i64 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..loopexit_crit_edge.us, label %30

..loopexit_crit_edge.us:                          ; preds = %30
  %96 = getelementptr inbounds i8*, i8** %.018.us, i64 1
  %97 = add i32 %.037.us, 1
  %98 = icmp sgt i32 %.in, 1
  br i1 %98, label %.lr.ph9.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
