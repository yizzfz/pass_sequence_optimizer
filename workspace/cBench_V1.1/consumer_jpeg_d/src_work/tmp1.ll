; ModuleID = 'jccoefct.ll'
source_filename = "jccoefct.c"
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
%struct.my_coef_controller = type { %struct.jpeg_c_coef_controller, i32, i32, i32, i32, [10 x [64 x i16]*], [10 x %struct.jvirt_barray_control*] }

; Function Attrs: nounwind uwtable
define void @jinit_c_coef_controller(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_coef_controller*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca [64 x i16]*, align 8
  %9 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 1
  %12 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %12, i32 0, i32 0
  %14 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %13, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %16 = bitcast %struct.jpeg_compress_struct* %15 to %struct.jpeg_common_struct*
  %17 = call i8* %14(%struct.jpeg_common_struct* %16, i32 1, i64 192)
  %18 = bitcast i8* %17 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %18, %struct.my_coef_controller** %5, align 8
  %19 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %20 = bitcast %struct.my_coef_controller* %19 to %struct.jpeg_c_coef_controller*
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 54
  store %struct.jpeg_c_coef_controller* %20, %struct.jpeg_c_coef_controller** %22, align 8
  %23 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %24 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %23, i32 0, i32 0
  %25 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %24, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_coef, void (%struct.jpeg_compress_struct*, i32)** %25, align 8
  %26 = load i32, i32* %4, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %81

; <label>:28:                                     ; preds = %2
  store i32 0, i32* %6, align 4
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 14
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  store %struct.jpeg_component_info* %31, %struct.jpeg_component_info** %7, align 8
  br label %32

; <label>:32:                                     ; preds = %75, %28
  %33 = load i32, i32* %6, align 4
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 12
  %36 = load i32, i32* %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %80

; <label>:38:                                     ; preds = %32
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %39, i32 0, i32 1
  %41 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %41, i32 0, i32 5
  %43 = load %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)** %42, align 8
  %44 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %45 = bitcast %struct.jpeg_compress_struct* %44 to %struct.jpeg_common_struct*
  %46 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i32 0, i32 7
  %48 = load i32, i32* %47, align 4
  %49 = zext i32 %48 to i64
  %50 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %51 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %50, i32 0, i32 2
  %52 = load i32, i32* %51, align 8
  %53 = sext i32 %52 to i64
  %54 = call i64 @jround_up(i64 %49, i64 %53)
  %55 = trunc i64 %54 to i32
  %56 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %57 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %56, i32 0, i32 8
  %58 = load i32, i32* %57, align 8
  %59 = zext i32 %58 to i64
  %60 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %61 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %60, i32 0, i32 3
  %62 = load i32, i32* %61, align 4
  %63 = sext i32 %62 to i64
  %64 = call i64 @jround_up(i64 %59, i64 %63)
  %65 = trunc i64 %64 to i32
  %66 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i32 0, i32 3
  %68 = load i32, i32* %67, align 4
  %69 = call %struct.jvirt_barray_control* %43(%struct.jpeg_common_struct* %45, i32 1, i32 0, i32 %55, i32 %65, i32 %68)
  %70 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %71 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %70, i32 0, i32 6
  %72 = load i32, i32* %6, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %71, i64 0, i64 %73
  store %struct.jvirt_barray_control* %69, %struct.jvirt_barray_control** %74, align 8
  br label %75

; <label>:75:                                     ; preds = %38
  %76 = load i32, i32* %6, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %6, align 4
  %78 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %79 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %78, i32 1
  store %struct.jpeg_component_info* %79, %struct.jpeg_component_info** %7, align 8
  br label %32

; <label>:80:                                     ; preds = %32
  br label %111

; <label>:81:                                     ; preds = %2
  %82 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %83 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %82, i32 0, i32 1
  %84 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %84, i32 0, i32 1
  %86 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %85, align 8
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %88 = bitcast %struct.jpeg_compress_struct* %87 to %struct.jpeg_common_struct*
  %89 = call i8* %86(%struct.jpeg_common_struct* %88, i32 1, i64 1280)
  %90 = bitcast i8* %89 to [64 x i16]*
  store [64 x i16]* %90, [64 x i16]** %8, align 8
  store i32 0, i32* %9, align 4
  br label %91

; <label>:91:                                     ; preds = %104, %81
  %92 = load i32, i32* %9, align 4
  %93 = icmp slt i32 %92, 10
  br i1 %93, label %94, label %107

; <label>:94:                                     ; preds = %91
  %95 = load [64 x i16]*, [64 x i16]** %8, align 8
  %96 = load i32, i32* %9, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [64 x i16], [64 x i16]* %95, i64 %97
  %99 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %100 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %99, i32 0, i32 5
  %101 = load i32, i32* %9, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %100, i64 0, i64 %102
  store [64 x i16]* %98, [64 x i16]** %103, align 8
  br label %104

; <label>:104:                                    ; preds = %94
  %105 = load i32, i32* %9, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %9, align 4
  br label %91

; <label>:107:                                    ; preds = %91
  %108 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %109 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %108, i32 0, i32 6
  %110 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %109, i64 0, i64 0
  store %struct.jvirt_barray_control* null, %struct.jvirt_barray_control** %110, align 8
  br label %111

; <label>:111:                                    ; preds = %107, %80
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_pass_coef(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_coef_controller*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 54
  %8 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %7, align 8
  %9 = bitcast %struct.jpeg_c_coef_controller* %8 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %9, %struct.my_coef_controller** %5, align 8
  %10 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %11 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %10, i32 0, i32 1
  store i32 0, i32* %11, align 8
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %12)
  %13 = load i32, i32* %4, align 4
  switch i32 %13, label %80 [
    i32 0, label %14
    i32 3, label %36
    i32 2, label %58
  ]

; <label>:14:                                     ; preds = %2
  %15 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %16 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %15, i32 0, i32 6
  %17 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %16, i64 0, i64 0
  %18 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %17, align 8
  %19 = icmp ne %struct.jvirt_barray_control* %18, null
  br i1 %19, label %20, label %32

; <label>:20:                                     ; preds = %14
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i32 0, i32 5
  store i32 4, i32* %24, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 0
  %29 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %28, align 8
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %31 = bitcast %struct.jpeg_compress_struct* %30 to %struct.jpeg_common_struct*
  call void %29(%struct.jpeg_common_struct* %31)
  br label %32

; <label>:32:                                     ; preds = %20, %14
  %33 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %34 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %33, i32 0, i32 0
  %35 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %34, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_data, i32 (%struct.jpeg_compress_struct*, i8***)** %35, align 8
  br label %92

; <label>:36:                                     ; preds = %2
  %37 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %38 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %37, i32 0, i32 6
  %39 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %38, i64 0, i64 0
  %40 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %39, align 8
  %41 = icmp eq %struct.jvirt_barray_control* %40, null
  br i1 %41, label %42, label %54

; <label>:42:                                     ; preds = %36
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %43, i32 0, i32 0
  %45 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %45, i32 0, i32 5
  store i32 4, i32* %46, align 8
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %47, i32 0, i32 0
  %49 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %49, i32 0, i32 0
  %51 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %50, align 8
  %52 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %53 = bitcast %struct.jpeg_compress_struct* %52 to %struct.jpeg_common_struct*
  call void %51(%struct.jpeg_common_struct* %53)
  br label %54

; <label>:54:                                     ; preds = %42, %36
  %55 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %56 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %55, i32 0, i32 0
  %57 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %56, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_first_pass, i32 (%struct.jpeg_compress_struct*, i8***)** %57, align 8
  br label %92

; <label>:58:                                     ; preds = %2
  %59 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %60 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %59, i32 0, i32 6
  %61 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %60, i64 0, i64 0
  %62 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %61, align 8
  %63 = icmp eq %struct.jvirt_barray_control* %62, null
  br i1 %63, label %64, label %76

; <label>:64:                                     ; preds = %58
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 0
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i32 0, i32 5
  store i32 4, i32* %68, align 8
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 0
  %71 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %71, i32 0, i32 0
  %73 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %72, align 8
  %74 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %75 = bitcast %struct.jpeg_compress_struct* %74 to %struct.jpeg_common_struct*
  call void %73(%struct.jpeg_common_struct* %75)
  br label %76

; <label>:76:                                     ; preds = %64, %58
  %77 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %78 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %77, i32 0, i32 0
  %79 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %78, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, i8***)* @compress_output, i32 (%struct.jpeg_compress_struct*, i8***)** %79, align 8
  br label %92

; <label>:80:                                     ; preds = %2
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %81, i32 0, i32 0
  %83 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %83, i32 0, i32 5
  store i32 4, i32* %84, align 8
  %85 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %85, i32 0, i32 0
  %87 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %87, i32 0, i32 0
  %89 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %88, align 8
  %90 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %91 = bitcast %struct.jpeg_compress_struct* %90 to %struct.jpeg_common_struct*
  call void %89(%struct.jpeg_common_struct* %91)
  br label %92

; <label>:92:                                     ; preds = %80, %76, %54, %32
  ret void
}

declare i64 @jround_up(i64, i64) #1

; Function Attrs: nounwind uwtable
define internal void @start_iMCU_row(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_coef_controller*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 54
  %6 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %5, align 8
  %7 = bitcast %struct.jpeg_c_coef_controller* %6 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %7, %struct.my_coef_controller** %3, align 8
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %8, i32 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %15

; <label>:12:                                     ; preds = %1
  %13 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %14 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %13, i32 0, i32 4
  store i32 1, i32* %14, align 4
  br label %43

; <label>:15:                                     ; preds = %1
  %16 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %17 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %16, i32 0, i32 1
  %18 = load i32, i32* %17, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 40
  %21 = load i32, i32* %20, align 8
  %22 = sub i32 %21, 1
  %23 = icmp ult i32 %18, %22
  br i1 %23, label %24, label %33

; <label>:24:                                     ; preds = %15
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 42
  %27 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %26, i64 0, i64 0
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i32 0, i32 3
  %30 = load i32, i32* %29, align 4
  %31 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %32 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %31, i32 0, i32 4
  store i32 %30, i32* %32, align 4
  br label %42

; <label>:33:                                     ; preds = %15
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 42
  %36 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %35, i64 0, i64 0
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i32 0, i32 18
  %39 = load i32, i32* %38, align 8
  %40 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %41 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %40, i32 0, i32 4
  store i32 %39, i32* %41, align 4
  br label %42

; <label>:42:                                     ; preds = %33, %24
  br label %43

; <label>:43:                                     ; preds = %42, %12
  %44 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %45 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %44, i32 0, i32 2
  store i32 0, i32* %45, align 4
  %46 = load %struct.my_coef_controller*, %struct.my_coef_controller** %3, align 8
  %47 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %46, i32 0, i32 3
  store i32 0, i32* %47, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @compress_data(%struct.jpeg_compress_struct*, i8***) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i8***, align 8
  %6 = alloca %struct.my_coef_controller*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8*** %1, i8**** %5, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 54
  %21 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %20, align 8
  %22 = bitcast %struct.jpeg_c_coef_controller* %21 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %22, %struct.my_coef_controller** %6, align 8
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 43
  %25 = load i32, i32* %24, align 8
  %26 = sub i32 %25, 1
  store i32 %26, i32* %8, align 4
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 40
  %29 = load i32, i32* %28, align 8
  %30 = sub i32 %29, 1
  store i32 %30, i32* %9, align 4
  %31 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %32 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %31, i32 0, i32 3
  %33 = load i32, i32* %32, align 8
  store i32 %33, i32* %14, align 4
  br label %34

; <label>:34:                                     ; preds = %266, %2
  %35 = load i32, i32* %14, align 4
  %36 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %37 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %36, i32 0, i32 4
  %38 = load i32, i32* %37, align 4
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %269

; <label>:40:                                     ; preds = %34
  %41 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %42 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %41, i32 0, i32 2
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %7, align 4
  br label %44

; <label>:44:                                     ; preds = %260, %40
  %45 = load i32, i32* %7, align 4
  %46 = load i32, i32* %8, align 4
  %47 = icmp ule i32 %45, %46
  br i1 %47, label %48, label %263

; <label>:48:                                     ; preds = %44
  store i32 0, i32* %10, align 4
  store i32 0, i32* %12, align 4
  br label %49

; <label>:49:                                     ; preds = %237, %48
  %50 = load i32, i32* %12, align 4
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %51, i32 0, i32 41
  %53 = load i32, i32* %52, align 4
  %54 = icmp slt i32 %50, %53
  br i1 %54, label %55, label %240

; <label>:55:                                     ; preds = %49
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 42
  %58 = load i32, i32* %12, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %57, i64 0, i64 %59
  %61 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %60, align 8
  store %struct.jpeg_component_info* %61, %struct.jpeg_component_info** %18, align 8
  %62 = load i32, i32* %7, align 4
  %63 = load i32, i32* %8, align 4
  %64 = icmp ult i32 %62, %63
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %55
  %66 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %67 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %66, i32 0, i32 13
  %68 = load i32, i32* %67, align 4
  br label %73

; <label>:69:                                     ; preds = %55
  %70 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %71 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %70, i32 0, i32 17
  %72 = load i32, i32* %71, align 4
  br label %73

; <label>:73:                                     ; preds = %69, %65
  %74 = phi i32 [ %68, %65 ], [ %72, %69 ]
  store i32 %74, i32* %15, align 4
  %75 = load i32, i32* %7, align 4
  %76 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %76, i32 0, i32 16
  %78 = load i32, i32* %77, align 8
  %79 = mul i32 %75, %78
  store i32 %79, i32* %17, align 4
  %80 = load i32, i32* %14, align 4
  %81 = mul nsw i32 %80, 8
  store i32 %81, i32* %16, align 4
  store i32 0, i32* %13, align 4
  br label %82

; <label>:82:                                     ; preds = %233, %73
  %83 = load i32, i32* %13, align 4
  %84 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %85 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %84, i32 0, i32 14
  %86 = load i32, i32* %85, align 8
  %87 = icmp slt i32 %83, %86
  br i1 %87, label %88, label %236

; <label>:88:                                     ; preds = %82
  %89 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %90 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %89, i32 0, i32 1
  %91 = load i32, i32* %90, align 8
  %92 = load i32, i32* %9, align 4
  %93 = icmp ult i32 %91, %92
  br i1 %93, label %102, label %94

; <label>:94:                                     ; preds = %88
  %95 = load i32, i32* %14, align 4
  %96 = load i32, i32* %13, align 4
  %97 = add nsw i32 %95, %96
  %98 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %99 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %98, i32 0, i32 18
  %100 = load i32, i32* %99, align 8
  %101 = icmp slt i32 %97, %100
  br i1 %101, label %102, label %181

; <label>:102:                                    ; preds = %94, %88
  %103 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %104 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %103, i32 0, i32 58
  %105 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %105, i32 0, i32 1
  %107 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %106, align 8
  %108 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %109 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %110 = load i8***, i8**** %5, align 8
  %111 = load i32, i32* %12, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8**, i8*** %110, i64 %112
  %114 = load i8**, i8*** %113, align 8
  %115 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %116 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %115, i32 0, i32 5
  %117 = load i32, i32* %10, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %116, i64 0, i64 %118
  %120 = load [64 x i16]*, [64 x i16]** %119, align 8
  %121 = load i32, i32* %16, align 4
  %122 = load i32, i32* %17, align 4
  %123 = load i32, i32* %15, align 4
  call void %107(%struct.jpeg_compress_struct* %108, %struct.jpeg_component_info* %109, i8** %114, [64 x i16]* %120, i32 %121, i32 %122, i32 %123)
  %124 = load i32, i32* %15, align 4
  %125 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %126 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %125, i32 0, i32 13
  %127 = load i32, i32* %126, align 4
  %128 = icmp slt i32 %124, %127
  br i1 %128, label %129, label %180

; <label>:129:                                    ; preds = %102
  %130 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %131 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %130, i32 0, i32 5
  %132 = load i32, i32* %10, align 4
  %133 = load i32, i32* %15, align 4
  %134 = add nsw i32 %132, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %131, i64 0, i64 %135
  %137 = load [64 x i16]*, [64 x i16]** %136, align 8
  %138 = bitcast [64 x i16]* %137 to i8*
  %139 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %140 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %139, i32 0, i32 13
  %141 = load i32, i32* %140, align 4
  %142 = load i32, i32* %15, align 4
  %143 = sub nsw i32 %141, %142
  %144 = sext i32 %143 to i64
  %145 = mul i64 %144, 128
  call void @jzero_far(i8* %138, i64 %145)
  %146 = load i32, i32* %15, align 4
  store i32 %146, i32* %11, align 4
  br label %147

; <label>:147:                                    ; preds = %176, %129
  %148 = load i32, i32* %11, align 4
  %149 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %150 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %149, i32 0, i32 13
  %151 = load i32, i32* %150, align 4
  %152 = icmp slt i32 %148, %151
  br i1 %152, label %153, label %179

; <label>:153:                                    ; preds = %147
  %154 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %155 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %154, i32 0, i32 5
  %156 = load i32, i32* %10, align 4
  %157 = load i32, i32* %11, align 4
  %158 = add nsw i32 %156, %157
  %159 = sub nsw i32 %158, 1
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %155, i64 0, i64 %160
  %162 = load [64 x i16]*, [64 x i16]** %161, align 8
  %163 = getelementptr inbounds [64 x i16], [64 x i16]* %162, i64 0
  %164 = getelementptr inbounds [64 x i16], [64 x i16]* %163, i64 0, i64 0
  %165 = load i16, i16* %164, align 2
  %166 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %167 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %166, i32 0, i32 5
  %168 = load i32, i32* %10, align 4
  %169 = load i32, i32* %11, align 4
  %170 = add nsw i32 %168, %169
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %167, i64 0, i64 %171
  %173 = load [64 x i16]*, [64 x i16]** %172, align 8
  %174 = getelementptr inbounds [64 x i16], [64 x i16]* %173, i64 0
  %175 = getelementptr inbounds [64 x i16], [64 x i16]* %174, i64 0, i64 0
  store i16 %165, i16* %175, align 2
  br label %176

; <label>:176:                                    ; preds = %153
  %177 = load i32, i32* %11, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %11, align 4
  br label %147

; <label>:179:                                    ; preds = %147
  br label %180

; <label>:180:                                    ; preds = %179, %102
  br label %225

; <label>:181:                                    ; preds = %94
  %182 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %183 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %182, i32 0, i32 5
  %184 = load i32, i32* %10, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %183, i64 0, i64 %185
  %187 = load [64 x i16]*, [64 x i16]** %186, align 8
  %188 = bitcast [64 x i16]* %187 to i8*
  %189 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %190 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %189, i32 0, i32 13
  %191 = load i32, i32* %190, align 4
  %192 = sext i32 %191 to i64
  %193 = mul i64 %192, 128
  call void @jzero_far(i8* %188, i64 %193)
  store i32 0, i32* %11, align 4
  br label %194

; <label>:194:                                    ; preds = %221, %181
  %195 = load i32, i32* %11, align 4
  %196 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %197 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %196, i32 0, i32 13
  %198 = load i32, i32* %197, align 4
  %199 = icmp slt i32 %195, %198
  br i1 %199, label %200, label %224

; <label>:200:                                    ; preds = %194
  %201 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %202 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %201, i32 0, i32 5
  %203 = load i32, i32* %10, align 4
  %204 = sub nsw i32 %203, 1
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %202, i64 0, i64 %205
  %207 = load [64 x i16]*, [64 x i16]** %206, align 8
  %208 = getelementptr inbounds [64 x i16], [64 x i16]* %207, i64 0
  %209 = getelementptr inbounds [64 x i16], [64 x i16]* %208, i64 0, i64 0
  %210 = load i16, i16* %209, align 2
  %211 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %212 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %211, i32 0, i32 5
  %213 = load i32, i32* %10, align 4
  %214 = load i32, i32* %11, align 4
  %215 = add nsw i32 %213, %214
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %212, i64 0, i64 %216
  %218 = load [64 x i16]*, [64 x i16]** %217, align 8
  %219 = getelementptr inbounds [64 x i16], [64 x i16]* %218, i64 0
  %220 = getelementptr inbounds [64 x i16], [64 x i16]* %219, i64 0, i64 0
  store i16 %210, i16* %220, align 2
  br label %221

; <label>:221:                                    ; preds = %200
  %222 = load i32, i32* %11, align 4
  %223 = add nsw i32 %222, 1
  store i32 %223, i32* %11, align 4
  br label %194

; <label>:224:                                    ; preds = %194
  br label %225

; <label>:225:                                    ; preds = %224, %180
  %226 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %18, align 8
  %227 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %226, i32 0, i32 13
  %228 = load i32, i32* %227, align 4
  %229 = load i32, i32* %10, align 4
  %230 = add nsw i32 %229, %228
  store i32 %230, i32* %10, align 4
  %231 = load i32, i32* %16, align 4
  %232 = add i32 %231, 8
  store i32 %232, i32* %16, align 4
  br label %233

; <label>:233:                                    ; preds = %225
  %234 = load i32, i32* %13, align 4
  %235 = add nsw i32 %234, 1
  store i32 %235, i32* %13, align 4
  br label %82

; <label>:236:                                    ; preds = %82
  br label %237

; <label>:237:                                    ; preds = %236
  %238 = load i32, i32* %12, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* %12, align 4
  br label %49

; <label>:240:                                    ; preds = %49
  %241 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %242 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %241, i32 0, i32 59
  %243 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %242, align 8
  %244 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %243, i32 0, i32 1
  %245 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %244, align 8
  %246 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %247 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %248 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %247, i32 0, i32 5
  %249 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %248, i32 0, i32 0
  %250 = call i32 %245(%struct.jpeg_compress_struct* %246, [64 x i16]** %249)
  %251 = icmp ne i32 %250, 0
  br i1 %251, label %259, label %252

; <label>:252:                                    ; preds = %240
  %253 = load i32, i32* %14, align 4
  %254 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %255 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %254, i32 0, i32 3
  store i32 %253, i32* %255, align 8
  %256 = load i32, i32* %7, align 4
  %257 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %258 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %257, i32 0, i32 2
  store i32 %256, i32* %258, align 4
  store i32 0, i32* %3, align 4
  br label %275

; <label>:259:                                    ; preds = %240
  br label %260

; <label>:260:                                    ; preds = %259
  %261 = load i32, i32* %7, align 4
  %262 = add i32 %261, 1
  store i32 %262, i32* %7, align 4
  br label %44

; <label>:263:                                    ; preds = %44
  %264 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %265 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %264, i32 0, i32 2
  store i32 0, i32* %265, align 4
  br label %266

; <label>:266:                                    ; preds = %263
  %267 = load i32, i32* %14, align 4
  %268 = add nsw i32 %267, 1
  store i32 %268, i32* %14, align 4
  br label %34

; <label>:269:                                    ; preds = %34
  %270 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %271 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %270, i32 0, i32 1
  %272 = load i32, i32* %271, align 8
  %273 = add i32 %272, 1
  store i32 %273, i32* %271, align 8
  %274 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %274)
  store i32 1, i32* %3, align 4
  br label %275

; <label>:275:                                    ; preds = %269, %252
  %276 = load i32, i32* %3, align 4
  ret i32 %276
}

; Function Attrs: nounwind uwtable
define internal i32 @compress_first_pass(%struct.jpeg_compress_struct*, i8***) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i8***, align 8
  %5 = alloca %struct.my_coef_controller*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i16, align 2
  %17 = alloca %struct.jpeg_component_info*, align 8
  %18 = alloca [64 x i16]**, align 8
  %19 = alloca [64 x i16]*, align 8
  %20 = alloca [64 x i16]*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i8*** %1, i8**** %4, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 54
  %23 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %22, align 8
  %24 = bitcast %struct.jpeg_c_coef_controller* %23 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %24, %struct.my_coef_controller** %5, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 40
  %27 = load i32, i32* %26, align 8
  %28 = sub i32 %27, 1
  store i32 %28, i32* %6, align 4
  store i32 0, i32* %11, align 4
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 14
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  store %struct.jpeg_component_info* %31, %struct.jpeg_component_info** %17, align 8
  br label %32

; <label>:32:                                     ; preds = %246, %2
  %33 = load i32, i32* %11, align 4
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 12
  %36 = load i32, i32* %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %251

; <label>:38:                                     ; preds = %32
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %40 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %39, i32 0, i32 1
  %41 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %40, align 8
  %42 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %41, i32 0, i32 8
  %43 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %42, align 8
  %44 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %45 = bitcast %struct.jpeg_compress_struct* %44 to %struct.jpeg_common_struct*
  %46 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %47 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %46, i32 0, i32 6
  %48 = load i32, i32* %11, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %47, i64 0, i64 %49
  %51 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %50, align 8
  %52 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %53 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %52, i32 0, i32 1
  %54 = load i32, i32* %53, align 8
  %55 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %55, i32 0, i32 3
  %57 = load i32, i32* %56, align 4
  %58 = mul i32 %54, %57
  %59 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %60 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %59, i32 0, i32 3
  %61 = load i32, i32* %60, align 4
  %62 = call [64 x i16]** %43(%struct.jpeg_common_struct* %45, %struct.jvirt_barray_control* %51, i32 %58, i32 %61, i32 1)
  store [64 x i16]** %62, [64 x i16]*** %18, align 8
  %63 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %64 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %63, i32 0, i32 1
  %65 = load i32, i32* %64, align 8
  %66 = load i32, i32* %6, align 4
  %67 = icmp ult i32 %65, %66
  br i1 %67, label %68, label %72

; <label>:68:                                     ; preds = %38
  %69 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %70 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %69, i32 0, i32 3
  %71 = load i32, i32* %70, align 4
  store i32 %71, i32* %14, align 4
  br label %87

; <label>:72:                                     ; preds = %38
  %73 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %73, i32 0, i32 8
  %75 = load i32, i32* %74, align 8
  %76 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %76, i32 0, i32 3
  %78 = load i32, i32* %77, align 4
  %79 = urem i32 %75, %78
  store i32 %79, i32* %14, align 4
  %80 = load i32, i32* %14, align 4
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %86

; <label>:82:                                     ; preds = %72
  %83 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %84 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %83, i32 0, i32 3
  %85 = load i32, i32* %84, align 4
  store i32 %85, i32* %14, align 4
  br label %86

; <label>:86:                                     ; preds = %82, %72
  br label %87

; <label>:87:                                     ; preds = %86, %68
  %88 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %89 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %88, i32 0, i32 7
  %90 = load i32, i32* %89, align 4
  store i32 %90, i32* %7, align 4
  %91 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %91, i32 0, i32 2
  %93 = load i32, i32* %92, align 8
  store i32 %93, i32* %12, align 4
  %94 = load i32, i32* %7, align 4
  %95 = load i32, i32* %12, align 4
  %96 = urem i32 %94, %95
  store i32 %96, i32* %15, align 4
  %97 = load i32, i32* %15, align 4
  %98 = icmp sgt i32 %97, 0
  br i1 %98, label %99, label %103

; <label>:99:                                     ; preds = %87
  %100 = load i32, i32* %12, align 4
  %101 = load i32, i32* %15, align 4
  %102 = sub nsw i32 %100, %101
  store i32 %102, i32* %15, align 4
  br label %103

; <label>:103:                                    ; preds = %99, %87
  store i32 0, i32* %13, align 4
  br label %104

; <label>:104:                                    ; preds = %162, %103
  %105 = load i32, i32* %13, align 4
  %106 = load i32, i32* %14, align 4
  %107 = icmp slt i32 %105, %106
  br i1 %107, label %108, label %165

; <label>:108:                                    ; preds = %104
  %109 = load [64 x i16]**, [64 x i16]*** %18, align 8
  %110 = load i32, i32* %13, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [64 x i16]*, [64 x i16]** %109, i64 %111
  %113 = load [64 x i16]*, [64 x i16]** %112, align 8
  store [64 x i16]* %113, [64 x i16]** %19, align 8
  %114 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %115 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %114, i32 0, i32 58
  %116 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %115, align 8
  %117 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %116, i32 0, i32 1
  %118 = load void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)*, void (%struct.jpeg_compress_struct*, %struct.jpeg_component_info*, i8**, [64 x i16]*, i32, i32, i32)** %117, align 8
  %119 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %120 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %121 = load i8***, i8**** %4, align 8
  %122 = load i32, i32* %11, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i8**, i8*** %121, i64 %123
  %125 = load i8**, i8*** %124, align 8
  %126 = load [64 x i16]*, [64 x i16]** %19, align 8
  %127 = load i32, i32* %13, align 4
  %128 = mul nsw i32 %127, 8
  %129 = load i32, i32* %7, align 4
  call void %118(%struct.jpeg_compress_struct* %119, %struct.jpeg_component_info* %120, i8** %125, [64 x i16]* %126, i32 %128, i32 0, i32 %129)
  %130 = load i32, i32* %15, align 4
  %131 = icmp sgt i32 %130, 0
  br i1 %131, label %132, label %161

; <label>:132:                                    ; preds = %108
  %133 = load i32, i32* %7, align 4
  %134 = load [64 x i16]*, [64 x i16]** %19, align 8
  %135 = zext i32 %133 to i64
  %136 = getelementptr inbounds [64 x i16], [64 x i16]* %134, i64 %135
  store [64 x i16]* %136, [64 x i16]** %19, align 8
  %137 = load [64 x i16]*, [64 x i16]** %19, align 8
  %138 = bitcast [64 x i16]* %137 to i8*
  %139 = load i32, i32* %15, align 4
  %140 = sext i32 %139 to i64
  %141 = mul i64 %140, 128
  call void @jzero_far(i8* %138, i64 %141)
  %142 = load [64 x i16]*, [64 x i16]** %19, align 8
  %143 = getelementptr inbounds [64 x i16], [64 x i16]* %142, i64 -1
  %144 = getelementptr inbounds [64 x i16], [64 x i16]* %143, i64 0, i64 0
  %145 = load i16, i16* %144, align 2
  store i16 %145, i16* %16, align 2
  store i32 0, i32* %10, align 4
  br label %146

; <label>:146:                                    ; preds = %157, %132
  %147 = load i32, i32* %10, align 4
  %148 = load i32, i32* %15, align 4
  %149 = icmp slt i32 %147, %148
  br i1 %149, label %150, label %160

; <label>:150:                                    ; preds = %146
  %151 = load i16, i16* %16, align 2
  %152 = load [64 x i16]*, [64 x i16]** %19, align 8
  %153 = load i32, i32* %10, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [64 x i16], [64 x i16]* %152, i64 %154
  %156 = getelementptr inbounds [64 x i16], [64 x i16]* %155, i64 0, i64 0
  store i16 %151, i16* %156, align 2
  br label %157

; <label>:157:                                    ; preds = %150
  %158 = load i32, i32* %10, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, i32* %10, align 4
  br label %146

; <label>:160:                                    ; preds = %146
  br label %161

; <label>:161:                                    ; preds = %160, %108
  br label %162

; <label>:162:                                    ; preds = %161
  %163 = load i32, i32* %13, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %13, align 4
  br label %104

; <label>:165:                                    ; preds = %104
  %166 = load %struct.my_coef_controller*, %struct.my_coef_controller** %5, align 8
  %167 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %166, i32 0, i32 1
  %168 = load i32, i32* %167, align 8
  %169 = load i32, i32* %6, align 4
  %170 = icmp eq i32 %168, %169
  br i1 %170, label %171, label %245

; <label>:171:                                    ; preds = %165
  %172 = load i32, i32* %15, align 4
  %173 = load i32, i32* %7, align 4
  %174 = add i32 %173, %172
  store i32 %174, i32* %7, align 4
  %175 = load i32, i32* %7, align 4
  %176 = load i32, i32* %12, align 4
  %177 = udiv i32 %175, %176
  store i32 %177, i32* %8, align 4
  %178 = load i32, i32* %14, align 4
  store i32 %178, i32* %13, align 4
  br label %179

; <label>:179:                                    ; preds = %241, %171
  %180 = load i32, i32* %13, align 4
  %181 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %182 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %181, i32 0, i32 3
  %183 = load i32, i32* %182, align 4
  %184 = icmp slt i32 %180, %183
  br i1 %184, label %185, label %244

; <label>:185:                                    ; preds = %179
  %186 = load [64 x i16]**, [64 x i16]*** %18, align 8
  %187 = load i32, i32* %13, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [64 x i16]*, [64 x i16]** %186, i64 %188
  %190 = load [64 x i16]*, [64 x i16]** %189, align 8
  store [64 x i16]* %190, [64 x i16]** %19, align 8
  %191 = load [64 x i16]**, [64 x i16]*** %18, align 8
  %192 = load i32, i32* %13, align 4
  %193 = sub nsw i32 %192, 1
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [64 x i16]*, [64 x i16]** %191, i64 %194
  %196 = load [64 x i16]*, [64 x i16]** %195, align 8
  store [64 x i16]* %196, [64 x i16]** %20, align 8
  %197 = load [64 x i16]*, [64 x i16]** %19, align 8
  %198 = bitcast [64 x i16]* %197 to i8*
  %199 = load i32, i32* %7, align 4
  %200 = zext i32 %199 to i64
  %201 = mul i64 %200, 128
  call void @jzero_far(i8* %198, i64 %201)
  store i32 0, i32* %9, align 4
  br label %202

; <label>:202:                                    ; preds = %237, %185
  %203 = load i32, i32* %9, align 4
  %204 = load i32, i32* %8, align 4
  %205 = icmp ult i32 %203, %204
  br i1 %205, label %206, label %240

; <label>:206:                                    ; preds = %202
  %207 = load [64 x i16]*, [64 x i16]** %20, align 8
  %208 = load i32, i32* %12, align 4
  %209 = sub nsw i32 %208, 1
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [64 x i16], [64 x i16]* %207, i64 %210
  %212 = getelementptr inbounds [64 x i16], [64 x i16]* %211, i64 0, i64 0
  %213 = load i16, i16* %212, align 2
  store i16 %213, i16* %16, align 2
  store i32 0, i32* %10, align 4
  br label %214

; <label>:214:                                    ; preds = %225, %206
  %215 = load i32, i32* %10, align 4
  %216 = load i32, i32* %12, align 4
  %217 = icmp slt i32 %215, %216
  br i1 %217, label %218, label %228

; <label>:218:                                    ; preds = %214
  %219 = load i16, i16* %16, align 2
  %220 = load [64 x i16]*, [64 x i16]** %19, align 8
  %221 = load i32, i32* %10, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [64 x i16], [64 x i16]* %220, i64 %222
  %224 = getelementptr inbounds [64 x i16], [64 x i16]* %223, i64 0, i64 0
  store i16 %219, i16* %224, align 2
  br label %225

; <label>:225:                                    ; preds = %218
  %226 = load i32, i32* %10, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %10, align 4
  br label %214

; <label>:228:                                    ; preds = %214
  %229 = load i32, i32* %12, align 4
  %230 = load [64 x i16]*, [64 x i16]** %19, align 8
  %231 = sext i32 %229 to i64
  %232 = getelementptr inbounds [64 x i16], [64 x i16]* %230, i64 %231
  store [64 x i16]* %232, [64 x i16]** %19, align 8
  %233 = load i32, i32* %12, align 4
  %234 = load [64 x i16]*, [64 x i16]** %20, align 8
  %235 = sext i32 %233 to i64
  %236 = getelementptr inbounds [64 x i16], [64 x i16]* %234, i64 %235
  store [64 x i16]* %236, [64 x i16]** %20, align 8
  br label %237

; <label>:237:                                    ; preds = %228
  %238 = load i32, i32* %9, align 4
  %239 = add i32 %238, 1
  store i32 %239, i32* %9, align 4
  br label %202

; <label>:240:                                    ; preds = %202
  br label %241

; <label>:241:                                    ; preds = %240
  %242 = load i32, i32* %13, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* %13, align 4
  br label %179

; <label>:244:                                    ; preds = %179
  br label %245

; <label>:245:                                    ; preds = %244, %165
  br label %246

; <label>:246:                                    ; preds = %245
  %247 = load i32, i32* %11, align 4
  %248 = add nsw i32 %247, 1
  store i32 %248, i32* %11, align 4
  %249 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %17, align 8
  %250 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %249, i32 1
  store %struct.jpeg_component_info* %250, %struct.jpeg_component_info** %17, align 8
  br label %32

; <label>:251:                                    ; preds = %32
  %252 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %253 = load i8***, i8**** %4, align 8
  %254 = call i32 @compress_output(%struct.jpeg_compress_struct* %252, i8*** %253)
  ret i32 %254
}

; Function Attrs: nounwind uwtable
define internal i32 @compress_output(%struct.jpeg_compress_struct*, i8***) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i8***, align 8
  %6 = alloca %struct.my_coef_controller*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [4 x [64 x i16]**], align 16
  %15 = alloca [64 x i16]*, align 8
  %16 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i8*** %1, i8**** %5, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 54
  %19 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %18, align 8
  %20 = bitcast %struct.jpeg_c_coef_controller* %19 to %struct.my_coef_controller*
  store %struct.my_coef_controller* %20, %struct.my_coef_controller** %6, align 8
  store i32 0, i32* %9, align 4
  br label %21

; <label>:21:                                     ; preds = %63, %2
  %22 = load i32, i32* %9, align 4
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 41
  %25 = load i32, i32* %24, align 4
  %26 = icmp slt i32 %22, %25
  br i1 %26, label %27, label %66

; <label>:27:                                     ; preds = %21
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 42
  %30 = load i32, i32* %9, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %29, i64 0, i64 %31
  %33 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %32, align 8
  store %struct.jpeg_component_info* %33, %struct.jpeg_component_info** %16, align 8
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 1
  %36 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %36, i32 0, i32 8
  %38 = load [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)** %37, align 8
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %40 = bitcast %struct.jpeg_compress_struct* %39 to %struct.jpeg_common_struct*
  %41 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %42 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %41, i32 0, i32 6
  %43 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %44 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %43, i32 0, i32 1
  %45 = load i32, i32* %44, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [10 x %struct.jvirt_barray_control*], [10 x %struct.jvirt_barray_control*]* %42, i64 0, i64 %46
  %48 = load %struct.jvirt_barray_control*, %struct.jvirt_barray_control** %47, align 8
  %49 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %50 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %49, i32 0, i32 1
  %51 = load i32, i32* %50, align 8
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i32 0, i32 3
  %54 = load i32, i32* %53, align 4
  %55 = mul i32 %51, %54
  %56 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %57 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %56, i32 0, i32 3
  %58 = load i32, i32* %57, align 4
  %59 = call [64 x i16]** %38(%struct.jpeg_common_struct* %40, %struct.jvirt_barray_control* %48, i32 %55, i32 %58, i32 0)
  %60 = load i32, i32* %9, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %14, i64 0, i64 %61
  store [64 x i16]** %59, [64 x i16]*** %62, align 8
  br label %63

; <label>:63:                                     ; preds = %27
  %64 = load i32, i32* %9, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %9, align 4
  br label %21

; <label>:66:                                     ; preds = %21
  %67 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %68 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %67, i32 0, i32 3
  %69 = load i32, i32* %68, align 8
  store i32 %69, i32* %12, align 4
  br label %70

; <label>:70:                                     ; preds = %177, %66
  %71 = load i32, i32* %12, align 4
  %72 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %73 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %72, i32 0, i32 4
  %74 = load i32, i32* %73, align 4
  %75 = icmp slt i32 %71, %74
  br i1 %75, label %76, label %180

; <label>:76:                                     ; preds = %70
  %77 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %78 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %77, i32 0, i32 2
  %79 = load i32, i32* %78, align 4
  store i32 %79, i32* %7, align 4
  br label %80

; <label>:80:                                     ; preds = %171, %76
  %81 = load i32, i32* %7, align 4
  %82 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %83 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %82, i32 0, i32 43
  %84 = load i32, i32* %83, align 8
  %85 = icmp ult i32 %81, %84
  br i1 %85, label %86, label %174

; <label>:86:                                     ; preds = %80
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %87

; <label>:87:                                     ; preds = %148, %86
  %88 = load i32, i32* %9, align 4
  %89 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %90 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %89, i32 0, i32 41
  %91 = load i32, i32* %90, align 4
  %92 = icmp slt i32 %88, %91
  br i1 %92, label %93, label %151

; <label>:93:                                     ; preds = %87
  %94 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %95 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %94, i32 0, i32 42
  %96 = load i32, i32* %9, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %95, i64 0, i64 %97
  %99 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %98, align 8
  store %struct.jpeg_component_info* %99, %struct.jpeg_component_info** %16, align 8
  %100 = load i32, i32* %7, align 4
  %101 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i32 0, i32 13
  %103 = load i32, i32* %102, align 4
  %104 = mul i32 %100, %103
  store i32 %104, i32* %13, align 4
  store i32 0, i32* %11, align 4
  br label %105

; <label>:105:                                    ; preds = %144, %93
  %106 = load i32, i32* %11, align 4
  %107 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %108 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %107, i32 0, i32 14
  %109 = load i32, i32* %108, align 8
  %110 = icmp slt i32 %106, %109
  br i1 %110, label %111, label %147

; <label>:111:                                    ; preds = %105
  %112 = load i32, i32* %9, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [4 x [64 x i16]**], [4 x [64 x i16]**]* %14, i64 0, i64 %113
  %115 = load [64 x i16]**, [64 x i16]*** %114, align 8
  %116 = load i32, i32* %11, align 4
  %117 = load i32, i32* %12, align 4
  %118 = add nsw i32 %116, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [64 x i16]*, [64 x i16]** %115, i64 %119
  %121 = load [64 x i16]*, [64 x i16]** %120, align 8
  %122 = load i32, i32* %13, align 4
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds [64 x i16], [64 x i16]* %121, i64 %123
  store [64 x i16]* %124, [64 x i16]** %15, align 8
  store i32 0, i32* %10, align 4
  br label %125

; <label>:125:                                    ; preds = %140, %111
  %126 = load i32, i32* %10, align 4
  %127 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %16, align 8
  %128 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i32 0, i32 13
  %129 = load i32, i32* %128, align 4
  %130 = icmp slt i32 %126, %129
  br i1 %130, label %131, label %143

; <label>:131:                                    ; preds = %125
  %132 = load [64 x i16]*, [64 x i16]** %15, align 8
  %133 = getelementptr inbounds [64 x i16], [64 x i16]* %132, i32 1
  store [64 x i16]* %133, [64 x i16]** %15, align 8
  %134 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %135 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %134, i32 0, i32 5
  %136 = load i32, i32* %8, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %8, align 4
  %138 = sext i32 %136 to i64
  %139 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %135, i64 0, i64 %138
  store [64 x i16]* %132, [64 x i16]** %139, align 8
  br label %140

; <label>:140:                                    ; preds = %131
  %141 = load i32, i32* %10, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %10, align 4
  br label %125

; <label>:143:                                    ; preds = %125
  br label %144

; <label>:144:                                    ; preds = %143
  %145 = load i32, i32* %11, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %11, align 4
  br label %105

; <label>:147:                                    ; preds = %105
  br label %148

; <label>:148:                                    ; preds = %147
  %149 = load i32, i32* %9, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %9, align 4
  br label %87

; <label>:151:                                    ; preds = %87
  %152 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %153 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %152, i32 0, i32 59
  %154 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %153, align 8
  %155 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %154, i32 0, i32 1
  %156 = load i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %155, align 8
  %157 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %158 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %159 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %158, i32 0, i32 5
  %160 = getelementptr inbounds [10 x [64 x i16]*], [10 x [64 x i16]*]* %159, i32 0, i32 0
  %161 = call i32 %156(%struct.jpeg_compress_struct* %157, [64 x i16]** %160)
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %170, label %163

; <label>:163:                                    ; preds = %151
  %164 = load i32, i32* %12, align 4
  %165 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %166 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %165, i32 0, i32 3
  store i32 %164, i32* %166, align 8
  %167 = load i32, i32* %7, align 4
  %168 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %169 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %168, i32 0, i32 2
  store i32 %167, i32* %169, align 4
  store i32 0, i32* %3, align 4
  br label %186

; <label>:170:                                    ; preds = %151
  br label %171

; <label>:171:                                    ; preds = %170
  %172 = load i32, i32* %7, align 4
  %173 = add i32 %172, 1
  store i32 %173, i32* %7, align 4
  br label %80

; <label>:174:                                    ; preds = %80
  %175 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %176 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %175, i32 0, i32 2
  store i32 0, i32* %176, align 4
  br label %177

; <label>:177:                                    ; preds = %174
  %178 = load i32, i32* %12, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* %12, align 4
  br label %70

; <label>:180:                                    ; preds = %70
  %181 = load %struct.my_coef_controller*, %struct.my_coef_controller** %6, align 8
  %182 = getelementptr inbounds %struct.my_coef_controller, %struct.my_coef_controller* %181, i32 0, i32 1
  %183 = load i32, i32* %182, align 8
  %184 = add i32 %183, 1
  store i32 %184, i32* %182, align 8
  %185 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  call void @start_iMCU_row(%struct.jpeg_compress_struct* %185)
  store i32 1, i32* %3, align 4
  br label %186

; <label>:186:                                    ; preds = %180, %163
  %187 = load i32, i32* %3, align 4
  ret i32 %187
}

declare void @jzero_far(i8*, i64) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
