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
define void @jinit_color_converter(%struct.jpeg_compress_struct*) #0 {
  %2 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 1
  %3 = bitcast %struct.jpeg_memory_mgr** %2 to i8* (%struct.jpeg_common_struct*, i32, i64)***
  %4 = load i8* (%struct.jpeg_common_struct*, i32, i64)**, i8* (%struct.jpeg_common_struct*, i32, i64)*** %3, align 8
  %5 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %4, align 8
  %.cast = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %6 = tail call i8* %5(%struct.jpeg_common_struct* %.cast, i32 1, i64 24) #3
  %.cast1 = ptrtoint i8* %6 to i64
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %8 = bitcast %struct.jpeg_color_converter** %7 to i64*
  store i64 %.cast1, i64* %8, align 8
  %9 = bitcast i8* %6 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @null_method, void (%struct.jpeg_compress_struct*)** %9, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 9
  %11 = load i32, i32* %10, align 4
  switch i32 %11, label %48 [
    i32 1, label %12
    i32 2, label %24
    i32 3, label %24
    i32 4, label %36
    i32 5, label %36
  ]

; <label>:12:                                     ; preds = %1
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %60, label %16

; <label>:16:                                     ; preds = %12
  %17 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i64 0, i32 5
  store i32 7, i32* %20, align 8
  %21 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %22 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %21, align 8
  %23 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %22, align 8
  tail call void %23(%struct.jpeg_common_struct* nonnull %17) #3
  br label %60

; <label>:24:                                     ; preds = %1, %1
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %26 = load i32, i32* %25, align 8
  %27 = icmp eq i32 %26, 3
  br i1 %27, label %60, label %28

; <label>:28:                                     ; preds = %24
  %29 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i64 0, i32 5
  store i32 7, i32* %32, align 8
  %33 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %34 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %33, align 8
  %35 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %34, align 8
  tail call void %35(%struct.jpeg_common_struct* nonnull %29) #3
  br label %60

; <label>:36:                                     ; preds = %1, %1
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %38 = load i32, i32* %37, align 8
  %39 = icmp eq i32 %38, 4
  br i1 %39, label %60, label %40

; <label>:40:                                     ; preds = %36
  %41 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i64 0, i32 5
  store i32 7, i32* %44, align 8
  %45 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %46 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %45, align 8
  %47 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %46, align 8
  tail call void %47(%struct.jpeg_common_struct* nonnull %41) #3
  br label %60

; <label>:48:                                     ; preds = %1
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %50 = load i32, i32* %49, align 8
  %51 = icmp slt i32 %50, 1
  br i1 %51, label %52, label %60

; <label>:52:                                     ; preds = %48
  %53 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %55 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %55, i64 0, i32 5
  store i32 7, i32* %56, align 8
  %57 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %58 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %57, align 8
  %59 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %58, align 8
  tail call void %59(%struct.jpeg_common_struct* nonnull %53) #3
  br label %60

; <label>:60:                                     ; preds = %48, %52, %40, %36, %28, %24, %16, %12
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 13
  %62 = load i32, i32* %61, align 8
  switch i32 %62, label %181 [
    i32 1, label %63
    i32 2, label %87
    i32 3, label %110
    i32 4, label %134
    i32 5, label %157
  ]

; <label>:63:                                     ; preds = %60
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %65 = load i32, i32* %64, align 4
  %66 = icmp eq i32 %65, 1
  br i1 %66, label %75, label %67

; <label>:67:                                     ; preds = %63
  %68 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %70 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %69, align 8
  %71 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %70, i64 0, i32 5
  store i32 8, i32* %71, align 8
  %72 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %73 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %72, align 8
  %74 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %73, align 8
  tail call void %74(%struct.jpeg_common_struct* nonnull %68) #3
  br label %75

; <label>:75:                                     ; preds = %63, %67
  %sunkaddr = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr68 = add i64 %sunkaddr, 52
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to i32*
  %76 = load i32, i32* %sunkaddr69, align 4
  switch i32 %76, label %79 [
    i32 1, label %198
    i32 2, label %77
    i32 3, label %198
  ]

; <label>:77:                                     ; preds = %75
  %78 = bitcast i8* %6 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %78, align 8
  br label %198

; <label>:79:                                     ; preds = %75
  %80 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %82 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %81, align 8
  %83 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %82, i64 0, i32 5
  store i32 25, i32* %83, align 8
  %84 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %85 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %84, align 8
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  tail call void %86(%struct.jpeg_common_struct* nonnull %80) #3
  ret void

; <label>:87:                                     ; preds = %60
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %89 = load i32, i32* %88, align 4
  %90 = icmp eq i32 %89, 3
  br i1 %90, label %99, label %91

; <label>:91:                                     ; preds = %87
  %92 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %94 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %93, align 8
  %95 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %94, i64 0, i32 5
  store i32 8, i32* %95, align 8
  %96 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %97 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %96, align 8
  %98 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %97, align 8
  tail call void %98(%struct.jpeg_common_struct* nonnull %92) #3
  br label %99

; <label>:99:                                     ; preds = %87, %91
  %sunkaddr70 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr71 = add i64 %sunkaddr70, 52
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to i32*
  %100 = load i32, i32* %sunkaddr72, align 4
  %101 = icmp eq i32 %100, 2
  br i1 %101, label %198, label %102

; <label>:102:                                    ; preds = %99
  %103 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %104 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i64 0, i32 5
  store i32 25, i32* %106, align 8
  %107 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %108 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %107, align 8
  %109 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %108, align 8
  tail call void %109(%struct.jpeg_common_struct* nonnull %103) #3
  ret void

; <label>:110:                                    ; preds = %60
  %111 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %112 = load i32, i32* %111, align 4
  %113 = icmp eq i32 %112, 3
  br i1 %113, label %122, label %114

; <label>:114:                                    ; preds = %110
  %115 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %116 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %117 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %116, align 8
  %118 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %117, i64 0, i32 5
  store i32 8, i32* %118, align 8
  %119 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %120 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %119, align 8
  %121 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %120, align 8
  tail call void %121(%struct.jpeg_common_struct* nonnull %115) #3
  br label %122

; <label>:122:                                    ; preds = %110, %114
  %sunkaddr73 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr74 = add i64 %sunkaddr73, 52
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to i32*
  %123 = load i32, i32* %sunkaddr75, align 4
  switch i32 %123, label %126 [
    i32 2, label %124
    i32 3, label %198
  ]

; <label>:124:                                    ; preds = %122
  %125 = bitcast i8* %6 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %125, align 8
  br label %198

; <label>:126:                                    ; preds = %122
  %127 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %128 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %129 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %128, align 8
  %130 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %129, i64 0, i32 5
  store i32 25, i32* %130, align 8
  %131 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %132 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %131, align 8
  %133 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %132, align 8
  tail call void %133(%struct.jpeg_common_struct* nonnull %127) #3
  ret void

; <label>:134:                                    ; preds = %60
  %135 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %136 = load i32, i32* %135, align 4
  %137 = icmp eq i32 %136, 4
  br i1 %137, label %146, label %138

; <label>:138:                                    ; preds = %134
  %139 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %140 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %141 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %140, align 8
  %142 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %141, i64 0, i32 5
  store i32 8, i32* %142, align 8
  %143 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %144 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %143, align 8
  %145 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %144, align 8
  tail call void %145(%struct.jpeg_common_struct* nonnull %139) #3
  br label %146

; <label>:146:                                    ; preds = %134, %138
  %sunkaddr76 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr77 = add i64 %sunkaddr76, 52
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to i32*
  %147 = load i32, i32* %sunkaddr78, align 4
  %148 = icmp eq i32 %147, 4
  br i1 %148, label %198, label %149

; <label>:149:                                    ; preds = %146
  %150 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %151 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %152 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %151, align 8
  %153 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %152, i64 0, i32 5
  store i32 25, i32* %153, align 8
  %154 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %155 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %154, align 8
  %156 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %155, align 8
  tail call void %156(%struct.jpeg_common_struct* nonnull %150) #3
  ret void

; <label>:157:                                    ; preds = %60
  %158 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %159 = load i32, i32* %158, align 4
  %160 = icmp eq i32 %159, 4
  br i1 %160, label %169, label %161

; <label>:161:                                    ; preds = %157
  %162 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %163 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %164 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %163, align 8
  %165 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %164, i64 0, i32 5
  store i32 8, i32* %165, align 8
  %166 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %167 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %166, align 8
  %168 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %167, align 8
  tail call void %168(%struct.jpeg_common_struct* nonnull %162) #3
  br label %169

; <label>:169:                                    ; preds = %157, %161
  %sunkaddr79 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr80 = add i64 %sunkaddr79, 52
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to i32*
  %170 = load i32, i32* %sunkaddr81, align 4
  switch i32 %170, label %173 [
    i32 4, label %171
    i32 5, label %198
  ]

; <label>:171:                                    ; preds = %169
  %172 = bitcast i8* %6 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @rgb_ycc_start, void (%struct.jpeg_compress_struct*)** %172, align 8
  br label %198

; <label>:173:                                    ; preds = %169
  %174 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %175 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %176 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %175, align 8
  %177 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %176, i64 0, i32 5
  store i32 25, i32* %177, align 8
  %178 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %179 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %178, align 8
  %180 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %179, align 8
  tail call void %180(%struct.jpeg_common_struct* nonnull %174) #3
  ret void

; <label>:181:                                    ; preds = %60
  %sunkaddr82 = ptrtoint %struct.jpeg_compress_struct* %0 to i64
  %sunkaddr83 = add i64 %sunkaddr82, 52
  %sunkaddr84 = inttoptr i64 %sunkaddr83 to i32*
  %182 = load i32, i32* %sunkaddr84, align 4
  %183 = icmp eq i32 %62, %182
  br i1 %183, label %184, label %190

; <label>:184:                                    ; preds = %181
  %185 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %186 = load i32, i32* %185, align 4
  %187 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %188 = load i32, i32* %187, align 8
  %189 = icmp eq i32 %186, %188
  br i1 %189, label %198, label %190

; <label>:190:                                    ; preds = %184, %181
  %191 = bitcast %struct.jpeg_compress_struct* %0 to %struct.jpeg_common_struct*
  %192 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 0
  %193 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %192, align 8
  %194 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %193, i64 0, i32 5
  store i32 25, i32* %194, align 8
  %195 = bitcast %struct.jpeg_compress_struct* %0 to void (%struct.jpeg_common_struct*)***
  %196 = load void (%struct.jpeg_common_struct*)**, void (%struct.jpeg_common_struct*)*** %195, align 8
  %197 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %196, align 8
  tail call void %197(%struct.jpeg_common_struct* nonnull %191) #3
  br label %198

; <label>:198:                                    ; preds = %75, %190, %184, %169, %146, %122, %99, %75, %171, %124, %77
  %cmyk_ycck_convert.sink = phi void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* [ @cmyk_ycck_convert, %171 ], [ @rgb_ycc_convert, %124 ], [ @rgb_gray_convert, %77 ], [ @grayscale_convert, %75 ], [ @null_convert, %99 ], [ @null_convert, %122 ], [ @null_convert, %146 ], [ @null_convert, %169 ], [ @null_convert, %184 ], [ @null_convert, %190 ], [ @grayscale_convert, %75 ]
  %199 = getelementptr inbounds i8, i8* %6, i64 8
  %200 = bitcast i8* %199 to void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)**
  store void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)* %cmyk_ycck_convert.sink, void (%struct.jpeg_compress_struct*, i8**, i8***, i32, i32)** %200, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal void @null_method(%struct.jpeg_compress_struct* nocapture) #1 {
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @grayscale_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %7 = load i32, i32* %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 8
  %9 = load i32, i32* %8, align 8
  %10 = sext i32 %9 to i64
  %11 = icmp slt i32 %4, 1
  %12 = icmp eq i32 %7, 0
  %or.cond = or i1 %11, %12
  br i1 %or.cond, label %._crit_edge, label %.lr.ph17.split.us.preheader

.lr.ph17.split.us.preheader:                      ; preds = %5
  %13 = add i32 %7, -1
  %xtraiter = and i32 %7, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp ult i32 %13, 7
  %wide.trip.count.7 = zext i32 %7 to i64
  %15 = add nsw i32 %xtraiter, -1
  %16 = zext i32 %15 to i64
  %17 = add nuw nsw i64 %16, 1
  br label %.lr.ph17.split.us

.lr.ph17.split.us:                                ; preds = %.lr.ph17.split.us.preheader, %..loopexit_crit_edge.us
  %.in = phi i32 [ %18, %..loopexit_crit_edge.us ], [ %4, %.lr.ph17.split.us.preheader ]
  %.016.us = phi i8** [ %56, %..loopexit_crit_edge.us ], [ %1, %.lr.ph17.split.us.preheader ]
  %.01115.us = phi i32 [ %57, %..loopexit_crit_edge.us ], [ %3, %.lr.ph17.split.us.preheader ]
  %18 = add nsw i32 %.in, -1
  %19 = bitcast i8** %.016.us to i64*
  %20 = load i64, i64* %19, align 8
  %21 = load i8**, i8*** %2, align 8
  %22 = zext i32 %.01115.us to i64
  %23 = getelementptr inbounds i8*, i8** %21, i64 %22
  %24 = load i8*, i8** %23, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph17.split.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.sroa.04.013.us.prol = phi i64 [ %29, %.prol.preheader ], [ %20, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %25 = inttoptr i64 %.sroa.04.013.us.prol to i8*
  %26 = load i8, i8* %25, align 1
  %27 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv.prol
  store i8 %26, i8* %27, align 1
  %28 = getelementptr inbounds i8, i8* %25, i64 %10
  %29 = ptrtoint i8* %28 to i64
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph17.split.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph17.split.us ], [ %17, %.prol.loopexit.loopexit ]
  %.sroa.04.013.us.unr = phi i64 [ %20, %.lr.ph17.split.us ], [ %29, %.prol.loopexit.loopexit ]
  br i1 %14, label %..loopexit_crit_edge.us, label %.lr.ph17.split.us.new.preheader

.lr.ph17.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph17.split.us.new

.lr.ph17.split.us.new:                            ; preds = %.lr.ph17.split.us.new.preheader, %.lr.ph17.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph17.split.us.new ], [ %indvars.iv.unr, %.lr.ph17.split.us.new.preheader ]
  %.sroa.04.013.us = phi i64 [ %55, %.lr.ph17.split.us.new ], [ %.sroa.04.013.us.unr, %.lr.ph17.split.us.new.preheader ]
  %30 = inttoptr i64 %.sroa.04.013.us to i8*
  %31 = load i8, i8* %30, align 1
  %32 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv
  store i8 %31, i8* %32, align 1
  %33 = getelementptr inbounds i8, i8* %30, i64 %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = load i8, i8* %33, align 1
  %35 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv.next
  store i8 %34, i8* %35, align 1
  %36 = getelementptr inbounds i8, i8* %33, i64 %10
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = load i8, i8* %36, align 1
  %38 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv.next.1
  store i8 %37, i8* %38, align 1
  %39 = getelementptr inbounds i8, i8* %36, i64 %10
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %40 = load i8, i8* %39, align 1
  %41 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv.next.2
  store i8 %40, i8* %41, align 1
  %42 = getelementptr inbounds i8, i8* %39, i64 %10
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %43 = load i8, i8* %42, align 1
  %44 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv.next.3
  store i8 %43, i8* %44, align 1
  %45 = getelementptr inbounds i8, i8* %42, i64 %10
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %46 = load i8, i8* %45, align 1
  %47 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv.next.4
  store i8 %46, i8* %47, align 1
  %48 = getelementptr inbounds i8, i8* %45, i64 %10
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %49 = load i8, i8* %48, align 1
  %50 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv.next.5
  store i8 %49, i8* %50, align 1
  %51 = getelementptr inbounds i8, i8* %48, i64 %10
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %52 = load i8, i8* %51, align 1
  %53 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv.next.6
  store i8 %52, i8* %53, align 1
  %54 = getelementptr inbounds i8, i8* %51, i64 %10
  %55 = ptrtoint i8* %54 to i64
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph17.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph17.split.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %56 = getelementptr inbounds i8*, i8** %.016.us, i64 1
  %57 = add i32 %.01115.us, 1
  %58 = icmp sgt i32 %.in, 1
  br i1 %58, label %.lr.ph17.split.us, label %._crit_edge.loopexit

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
  %storemerge12 = phi i64 [ 0, %1 ], [ %40, %14 ]
  %15 = mul nuw nsw i64 %storemerge12, 19595
  %16 = getelementptr inbounds i64, i64* %13, i64 %storemerge12
  store i64 %15, i64* %16, align 8
  %17 = mul nuw nsw i64 %storemerge12, 38470
  %18 = add nuw nsw i64 %storemerge12, 256
  %19 = getelementptr inbounds i64, i64* %13, i64 %18
  store i64 %17, i64* %19, align 8
  %20 = mul nuw nsw i64 %storemerge12, 7471
  %21 = add nuw nsw i64 %20, 32768
  %22 = add nuw nsw i64 %storemerge12, 512
  %23 = getelementptr inbounds i64, i64* %13, i64 %22
  store i64 %21, i64* %23, align 8
  %24 = mul nsw i64 %storemerge12, -11059
  %25 = add nuw nsw i64 %storemerge12, 768
  %26 = getelementptr inbounds i64, i64* %13, i64 %25
  store i64 %24, i64* %26, align 8
  %27 = mul nsw i64 %storemerge12, -21709
  %28 = add nuw nsw i64 %storemerge12, 1024
  %29 = getelementptr inbounds i64, i64* %13, i64 %28
  store i64 %27, i64* %29, align 8
  %30 = shl i64 %storemerge12, 15
  %31 = add nuw nsw i64 %30, 8421375
  %32 = add nuw nsw i64 %storemerge12, 1280
  %33 = getelementptr inbounds i64, i64* %13, i64 %32
  store i64 %31, i64* %33, align 8
  %34 = mul nsw i64 %storemerge12, -27439
  %35 = add nuw nsw i64 %storemerge12, 1536
  %36 = getelementptr inbounds i64, i64* %13, i64 %35
  store i64 %34, i64* %36, align 8
  %37 = mul nsw i64 %storemerge12, -5329
  %38 = add nuw nsw i64 %storemerge12, 1792
  %39 = getelementptr inbounds i64, i64* %13, i64 %38
  store i64 %37, i64* %39, align 8
  %40 = add nuw nsw i64 %storemerge12, 1
  %exitcond = icmp eq i64 %40, 256
  br i1 %exitcond, label %41, label %14

; <label>:41:                                     ; preds = %14
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @rgb_gray_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %7 = bitcast %struct.jpeg_color_converter** %6 to %struct.my_color_converter**
  %8 = load %struct.my_color_converter*, %struct.my_color_converter** %7, align 8
  %9 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %8, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %13 = icmp slt i32 %4, 1
  %14 = icmp eq i32 %12, 0
  %or.cond = or i1 %13, %14
  br i1 %or.cond, label %._crit_edge, label %.lr.ph21.split.us.preheader

.lr.ph21.split.us.preheader:                      ; preds = %5
  %wide.trip.count = zext i32 %12 to i64
  br label %.lr.ph21.split.us

.lr.ph21.split.us:                                ; preds = %.lr.ph21.split.us.preheader, %..loopexit_crit_edge.us
  %.in = phi i32 [ %46, %..loopexit_crit_edge.us ], [ %4, %.lr.ph21.split.us.preheader ]
  %.020.us = phi i8** [ %47, %..loopexit_crit_edge.us ], [ %1, %.lr.ph21.split.us.preheader ]
  %.01519.us = phi i32 [ %48, %..loopexit_crit_edge.us ], [ %3, %.lr.ph21.split.us.preheader ]
  %15 = bitcast i8** %.020.us to i64*
  %16 = load i64, i64* %15, align 8
  %17 = load i8**, i8*** %2, align 8
  %18 = zext i32 %.01519.us to i64
  %19 = getelementptr inbounds i8*, i8** %17, i64 %18
  %20 = load i8*, i8** %19, align 8
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph21.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph21.split.us ], [ %indvars.iv.next, %21 ]
  %.sroa.03.017.us = phi i64 [ %16, %.lr.ph21.split.us ], [ %31, %21 ]
  %22 = inttoptr i64 %.sroa.03.017.us to i8*
  %23 = load i8, i8* %22, align 1
  %24 = getelementptr inbounds i8, i8* %22, i64 1
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i64
  %27 = getelementptr inbounds i8, i8* %22, i64 2
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = getelementptr inbounds i8, i8* %22, i64 3
  %31 = ptrtoint i8* %30 to i64
  %32 = zext i8 %23 to i64
  %33 = getelementptr inbounds i64, i64* %10, i64 %32
  %34 = load i64, i64* %33, align 8
  %35 = or i64 %26, 256
  %36 = getelementptr inbounds i64, i64* %10, i64 %35
  %37 = load i64, i64* %36, align 8
  %38 = add nsw i64 %37, %34
  %39 = or i64 %29, 512
  %40 = getelementptr inbounds i64, i64* %10, i64 %39
  %41 = load i64, i64* %40, align 8
  %42 = add nsw i64 %38, %41
  %43 = lshr i64 %42, 16
  %44 = trunc i64 %43 to i8
  %45 = getelementptr inbounds i8, i8* %20, i64 %indvars.iv
  store i8 %44, i8* %45, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..loopexit_crit_edge.us, label %21

..loopexit_crit_edge.us:                          ; preds = %21
  %46 = add nsw i32 %.in, -1
  %47 = getelementptr inbounds i8*, i8** %.020.us, i64 1
  %48 = add i32 %.01519.us, 1
  %49 = icmp sgt i32 %.in, 1
  br i1 %49, label %.lr.ph21.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @null_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 12
  %7 = load i32, i32* %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %10 = load i32, i32* %9, align 8
  %11 = icmp sgt i32 %4, 0
  br i1 %11, label %.preheader.lr.ph, label %._crit_edge26

.preheader.lr.ph:                                 ; preds = %5
  %12 = icmp sgt i32 %7, 0
  %13 = icmp eq i32 %10, 0
  br i1 %12, label %.preheader.us.preheader, label %._crit_edge26

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %14 = add i32 %10, -1
  %xtraiter = and i32 %10, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp ult i32 %14, 7
  %wide.trip.count38 = zext i32 %7 to i64
  %wide.trip.count.7 = zext i32 %10 to i64
  %16 = add nsw i32 %xtraiter, -1
  %17 = zext i32 %16 to i64
  %18 = add nuw nsw i64 %17, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge23.us
  %.in = phi i32 [ %19, %._crit_edge23.us ], [ %4, %.preheader.us.preheader ]
  %.025.us = phi i8** [ %22, %._crit_edge23.us ], [ %1, %.preheader.us.preheader ]
  %.01724.us = phi i32 [ %23, %._crit_edge23.us ], [ %3, %.preheader.us.preheader ]
  %19 = add nsw i32 %.in, -1
  %20 = bitcast i8** %.025.us to i64*
  %21 = zext i32 %.01724.us to i64
  br i1 %13, label %._crit_edge23.us, label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  br label %.lr.ph.us.us

._crit_edge23.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %._crit_edge23.us.loopexit, %.preheader.us
  %22 = getelementptr inbounds i8*, i8** %.025.us, i64 1
  %23 = add i32 %.01724.us, 1
  %24 = icmp sgt i32 %.in, 1
  br i1 %24, label %.preheader.us, label %._crit_edge26.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %25 = load i64, i64* %20, align 8
  %26 = getelementptr inbounds i8**, i8*** %2, i64 %indvars.iv36
  %27 = load i8**, i8*** %26, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 %21
  %29 = load i8*, i8** %28, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.sroa.09.019.us.us.prol = phi i64 [ %35, %.prol.preheader ], [ %25, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %30 = inttoptr i64 %.sroa.09.019.us.us.prol to i8*
  %31 = getelementptr inbounds i8, i8* %30, i64 %indvars.iv36
  %32 = load i8, i8* %31, align 1
  %33 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv.prol
  store i8 %32, i8* %33, align 1
  %34 = getelementptr inbounds i8, i8* %30, i64 %8
  %35 = ptrtoint i8* %34 to i64
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us.us ], [ %18, %.prol.loopexit.loopexit ]
  %.sroa.09.019.us.us.unr = phi i64 [ %25, %.lr.ph.us.us ], [ %35, %.prol.loopexit.loopexit ]
  br i1 %15, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond, label %._crit_edge23.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.us.us.new ], [ %indvars.iv.unr, %.lr.ph.us.us.new.preheader ]
  %.sroa.09.019.us.us = phi i64 [ %69, %.lr.ph.us.us.new ], [ %.sroa.09.019.us.us.unr, %.lr.ph.us.us.new.preheader ]
  %36 = inttoptr i64 %.sroa.09.019.us.us to i8*
  %37 = getelementptr inbounds i8, i8* %36, i64 %indvars.iv36
  %38 = load i8, i8* %37, align 1
  %39 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv
  store i8 %38, i8* %39, align 1
  %40 = getelementptr inbounds i8, i8* %36, i64 %8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = getelementptr inbounds i8, i8* %40, i64 %indvars.iv36
  %42 = load i8, i8* %41, align 1
  %43 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv.next
  store i8 %42, i8* %43, align 1
  %44 = getelementptr inbounds i8, i8* %40, i64 %8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %45 = getelementptr inbounds i8, i8* %44, i64 %indvars.iv36
  %46 = load i8, i8* %45, align 1
  %47 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv.next.1
  store i8 %46, i8* %47, align 1
  %48 = getelementptr inbounds i8, i8* %44, i64 %8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %49 = getelementptr inbounds i8, i8* %48, i64 %indvars.iv36
  %50 = load i8, i8* %49, align 1
  %51 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv.next.2
  store i8 %50, i8* %51, align 1
  %52 = getelementptr inbounds i8, i8* %48, i64 %8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %53 = getelementptr inbounds i8, i8* %52, i64 %indvars.iv36
  %54 = load i8, i8* %53, align 1
  %55 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv.next.3
  store i8 %54, i8* %55, align 1
  %56 = getelementptr inbounds i8, i8* %52, i64 %8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %57 = getelementptr inbounds i8, i8* %56, i64 %indvars.iv36
  %58 = load i8, i8* %57, align 1
  %59 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv.next.4
  store i8 %58, i8* %59, align 1
  %60 = getelementptr inbounds i8, i8* %56, i64 %8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %61 = getelementptr inbounds i8, i8* %60, i64 %indvars.iv36
  %62 = load i8, i8* %61, align 1
  %63 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv.next.5
  store i8 %62, i8* %63, align 1
  %64 = getelementptr inbounds i8, i8* %60, i64 %8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %65 = getelementptr inbounds i8, i8* %64, i64 %indvars.iv36
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv.next.6
  store i8 %66, i8* %67, align 1
  %68 = getelementptr inbounds i8, i8* %64, i64 %8
  %69 = ptrtoint i8* %68 to i64
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge26.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader.lr.ph, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @rgb_ycc_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %7 = bitcast %struct.jpeg_color_converter** %6 to %struct.my_color_converter**
  %8 = load %struct.my_color_converter*, %struct.my_color_converter** %7, align 8
  %9 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %8, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %13 = icmp sgt i32 %4, 0
  br i1 %13, label %.lr.ph39, label %._crit_edge

.lr.ph39:                                         ; preds = %5
  %14 = getelementptr inbounds i8**, i8*** %2, i64 1
  %15 = getelementptr inbounds i8**, i8*** %2, i64 2
  %16 = icmp eq i32 %12, 0
  br i1 %16, label %._crit_edge, label %.lr.ph39.split.us.preheader

.lr.ph39.split.us.preheader:                      ; preds = %.lr.ph39
  %wide.trip.count = zext i32 %12 to i64
  br label %.lr.ph39.split.us

.lr.ph39.split.us:                                ; preds = %.lr.ph39.split.us.preheader, %..loopexit_crit_edge.us
  %.in = phi i32 [ %91, %..loopexit_crit_edge.us ], [ %4, %.lr.ph39.split.us.preheader ]
  %.038.us = phi i8** [ %92, %..loopexit_crit_edge.us ], [ %1, %.lr.ph39.split.us.preheader ]
  %.03337.us = phi i32 [ %93, %..loopexit_crit_edge.us ], [ %3, %.lr.ph39.split.us.preheader ]
  %17 = bitcast i8** %.038.us to i64*
  %18 = load i64, i64* %17, align 8
  %19 = load i8**, i8*** %2, align 8
  %20 = zext i32 %.03337.us to i64
  %21 = getelementptr inbounds i8*, i8** %19, i64 %20
  %22 = load i8*, i8** %21, align 8
  %23 = load i8**, i8*** %14, align 8
  %24 = getelementptr inbounds i8*, i8** %23, i64 %20
  %25 = load i8*, i8** %24, align 8
  %26 = load i8**, i8*** %15, align 8
  %27 = getelementptr inbounds i8*, i8** %26, i64 %20
  %28 = load i8*, i8** %27, align 8
  br label %29

; <label>:29:                                     ; preds = %29, %.lr.ph39.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph39.split.us ], [ %indvars.iv.next, %29 ]
  %.sroa.07.035.us = phi i64 [ %18, %.lr.ph39.split.us ], [ %40, %29 ]
  %30 = inttoptr i64 %.sroa.07.035.us to i8*
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = getelementptr inbounds i8, i8* %30, i64 1
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = getelementptr inbounds i8, i8* %30, i64 2
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = getelementptr inbounds i8, i8* %30, i64 3
  %40 = ptrtoint i8* %39 to i64
  %41 = zext i8 %31 to i64
  %42 = getelementptr inbounds i64, i64* %10, i64 %41
  %43 = load i64, i64* %42, align 8
  %44 = or i32 %35, 256
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i64, i64* %10, i64 %45
  %47 = load i64, i64* %46, align 8
  %48 = add nsw i64 %47, %43
  %49 = or i32 %38, 512
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i64, i64* %10, i64 %50
  %52 = load i64, i64* %51, align 8
  %53 = add nsw i64 %48, %52
  %54 = lshr i64 %53, 16
  %55 = trunc i64 %54 to i8
  %56 = getelementptr inbounds i8, i8* %22, i64 %indvars.iv
  store i8 %55, i8* %56, align 1
  %57 = or i32 %32, 768
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i64, i64* %10, i64 %58
  %60 = load i64, i64* %59, align 8
  %61 = or i32 %35, 1024
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i64, i64* %10, i64 %62
  %64 = load i64, i64* %63, align 8
  %65 = add nsw i64 %64, %60
  %66 = or i32 %38, 1280
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i64, i64* %10, i64 %67
  %69 = load i64, i64* %68, align 8
  %70 = add nsw i64 %65, %69
  %71 = lshr i64 %70, 16
  %72 = trunc i64 %71 to i8
  %73 = getelementptr inbounds i8, i8* %25, i64 %indvars.iv
  store i8 %72, i8* %73, align 1
  %74 = or i32 %32, 1280
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i64, i64* %10, i64 %75
  %77 = load i64, i64* %76, align 8
  %78 = or i32 %35, 1536
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i64, i64* %10, i64 %79
  %81 = load i64, i64* %80, align 8
  %82 = add nsw i64 %81, %77
  %83 = or i32 %38, 1792
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i64, i64* %10, i64 %84
  %86 = load i64, i64* %85, align 8
  %87 = add nsw i64 %82, %86
  %88 = lshr i64 %87, 16
  %89 = trunc i64 %88 to i8
  %90 = getelementptr inbounds i8, i8* %28, i64 %indvars.iv
  store i8 %89, i8* %90, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..loopexit_crit_edge.us, label %29

..loopexit_crit_edge.us:                          ; preds = %29
  %91 = add nsw i32 %.in, -1
  %92 = getelementptr inbounds i8*, i8** %.038.us, i64 1
  %93 = add i32 %.03337.us, 1
  %94 = icmp sgt i32 %.in, 1
  br i1 %94, label %.lr.ph39.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph39, %5
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @cmyk_ycck_convert(%struct.jpeg_compress_struct*, i8**, i8***, i32, i32) #2 {
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 56
  %7 = bitcast %struct.jpeg_color_converter** %6 to %struct.my_color_converter**
  %8 = load %struct.my_color_converter*, %struct.my_color_converter** %7, align 8
  %9 = getelementptr inbounds %struct.my_color_converter, %struct.my_color_converter* %8, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %0, i64 0, i32 6
  %12 = load i32, i32* %11, align 8
  %13 = icmp sgt i32 %4, 0
  br i1 %13, label %.lr.ph44, label %._crit_edge

.lr.ph44:                                         ; preds = %5
  %14 = getelementptr inbounds i8**, i8*** %2, i64 1
  %15 = getelementptr inbounds i8**, i8*** %2, i64 2
  %16 = getelementptr inbounds i8**, i8*** %2, i64 3
  %17 = icmp eq i32 %12, 0
  br i1 %17, label %._crit_edge, label %.lr.ph44.split.us.preheader

.lr.ph44.split.us.preheader:                      ; preds = %.lr.ph44
  %wide.trip.count = zext i32 %12 to i64
  br label %.lr.ph44.split.us

.lr.ph44.split.us:                                ; preds = %.lr.ph44.split.us.preheader, %..loopexit_crit_edge.us
  %.in = phi i32 [ %101, %..loopexit_crit_edge.us ], [ %4, %.lr.ph44.split.us.preheader ]
  %.043.us = phi i8** [ %102, %..loopexit_crit_edge.us ], [ %1, %.lr.ph44.split.us.preheader ]
  %.03842.us = phi i32 [ %103, %..loopexit_crit_edge.us ], [ %3, %.lr.ph44.split.us.preheader ]
  %18 = bitcast i8** %.043.us to i64*
  %19 = load i64, i64* %18, align 8
  %20 = load i8**, i8*** %2, align 8
  %21 = zext i32 %.03842.us to i64
  %22 = getelementptr inbounds i8*, i8** %20, i64 %21
  %23 = load i8*, i8** %22, align 8
  %24 = load i8**, i8*** %14, align 8
  %25 = getelementptr inbounds i8*, i8** %24, i64 %21
  %26 = load i8*, i8** %25, align 8
  %27 = load i8**, i8*** %15, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 %21
  %29 = load i8*, i8** %28, align 8
  %30 = load i8**, i8*** %16, align 8
  %31 = getelementptr inbounds i8*, i8** %30, i64 %21
  %32 = load i8*, i8** %31, align 8
  br label %33

; <label>:33:                                     ; preds = %33, %.lr.ph44.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph44.split.us ], [ %indvars.iv.next, %33 ]
  %.sroa.09.040.us = phi i64 [ %19, %.lr.ph44.split.us ], [ %50, %33 ]
  %34 = inttoptr i64 %.sroa.09.040.us to i8*
  %35 = load i8, i8* %34, align 1
  %36 = xor i8 %35, -1
  %37 = zext i8 %36 to i32
  %38 = getelementptr inbounds i8, i8* %34, i64 1
  %39 = load i8, i8* %38, align 1
  %40 = xor i8 %39, -1
  %41 = zext i8 %40 to i32
  %42 = getelementptr inbounds i8, i8* %34, i64 2
  %43 = load i8, i8* %42, align 1
  %44 = xor i8 %43, -1
  %45 = zext i8 %44 to i32
  %46 = getelementptr inbounds i8, i8* %34, i64 3
  %47 = load i8, i8* %46, align 1
  %48 = getelementptr inbounds i8, i8* %32, i64 %indvars.iv
  store i8 %47, i8* %48, align 1
  %49 = getelementptr inbounds i8, i8* %34, i64 4
  %50 = ptrtoint i8* %49 to i64
  %51 = zext i8 %36 to i64
  %52 = getelementptr inbounds i64, i64* %10, i64 %51
  %53 = load i64, i64* %52, align 8
  %54 = or i32 %41, 256
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i64, i64* %10, i64 %55
  %57 = load i64, i64* %56, align 8
  %58 = add nsw i64 %57, %53
  %59 = or i32 %45, 512
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i64, i64* %10, i64 %60
  %62 = load i64, i64* %61, align 8
  %63 = add nsw i64 %58, %62
  %64 = lshr i64 %63, 16
  %65 = trunc i64 %64 to i8
  %66 = getelementptr inbounds i8, i8* %23, i64 %indvars.iv
  store i8 %65, i8* %66, align 1
  %67 = or i32 %37, 768
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i64, i64* %10, i64 %68
  %70 = load i64, i64* %69, align 8
  %71 = or i32 %41, 1024
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i64, i64* %10, i64 %72
  %74 = load i64, i64* %73, align 8
  %75 = add nsw i64 %74, %70
  %76 = or i32 %45, 1280
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i64, i64* %10, i64 %77
  %79 = load i64, i64* %78, align 8
  %80 = add nsw i64 %75, %79
  %81 = lshr i64 %80, 16
  %82 = trunc i64 %81 to i8
  %83 = getelementptr inbounds i8, i8* %26, i64 %indvars.iv
  store i8 %82, i8* %83, align 1
  %84 = or i32 %37, 1280
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i64, i64* %10, i64 %85
  %87 = load i64, i64* %86, align 8
  %88 = or i32 %41, 1536
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i64, i64* %10, i64 %89
  %91 = load i64, i64* %90, align 8
  %92 = add nsw i64 %91, %87
  %93 = or i32 %45, 1792
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i64, i64* %10, i64 %94
  %96 = load i64, i64* %95, align 8
  %97 = add nsw i64 %92, %96
  %98 = lshr i64 %97, 16
  %99 = trunc i64 %98 to i8
  %100 = getelementptr inbounds i8, i8* %29, i64 %indvars.iv
  store i8 %99, i8* %100, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..loopexit_crit_edge.us, label %33

..loopexit_crit_edge.us:                          ; preds = %33
  %101 = add nsw i32 %.in, -1
  %102 = getelementptr inbounds i8*, i8** %.043.us, i64 1
  %103 = add i32 %.03842.us, 1
  %104 = icmp sgt i32 %.in, 1
  br i1 %104, label %.lr.ph44.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph44, %5
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
