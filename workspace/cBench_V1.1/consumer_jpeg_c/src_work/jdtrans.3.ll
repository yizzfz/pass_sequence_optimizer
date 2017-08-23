; ModuleID = 'jdtrans.2.ll'
source_filename = "jdtrans.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jvirt_barray_control = type opaque
%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, [16 x i32 (%struct.jpeg_decompress_struct*)*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_read_coefficients = private constant [22 x i8] c"jpeg_read_coefficients"
@__profn_tmp1.ll_transdecode_master_selection = private constant [36 x i8] c"tmp1.ll:transdecode_master_selection"
@__profc_jpeg_read_coefficients = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_read_coefficients = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_read_coefficients = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8075379430349950607, i64 844558267254573, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i32 0, i32 0), i8* bitcast (%struct.jvirt_barray_control** (%struct.jpeg_decompress_struct*)* @jpeg_read_coefficients to i8*), i8* bitcast ([3 x i64]* @__profvp_jpeg_read_coefficients to i8*), i32 10, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_transdecode_master_selection = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_transdecode_master_selection = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_transdecode_master_selection = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 931321861077874891, i64 844518775647823, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i32 0, i32 0), i8* null, i8* bitcast ([3 x i64]* @__profvp_tmp1.ll_transdecode_master_selection to i8*), i32 6, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [12 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [64 x i8] c";>x\DA\05\C1\D1\09\C00\08\05@\BAP\A1\BFYFD_\8A\C5\C4\A0\EEO\EF\BE\83\97\12\AC$\819M\0C\BB\EB\EAu\9E\DB}t\F2.\85\84\82\16W#\A9\E0\90\B6\D8?\B4\15\17R", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_coefficients to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transdecode_master_selection to i8*), i8* bitcast ([12 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define %struct.jvirt_barray_control** @jpeg_read_coefficients(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jvirt_barray_control**, align 8
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 202
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %1
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @transdecode_master_selection(%struct.jpeg_decompress_struct* %10)
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 4
  store i32 209, i32* %12, align 4
  br label %43

; <label>:13:                                     ; preds = %1
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 4
  %16 = load i32, i32* %15, align 4
  %17 = icmp ne i32 %16, 209
  br i1 %17, label %18, label %41

; <label>:18:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 9)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 9)
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i32 0, i32 5
  store i32 18, i32* %23, align 8
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 4
  %26 = load i32, i32* %25, align 4
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %28 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %27, i32 0, i32 0
  %29 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %29, i32 0, i32 6
  %31 = bitcast %union.anon* %30 to [8 x i32]*
  %32 = getelementptr inbounds [8 x i32], [8 x i32]* %31, i64 0, i64 0
  store i32 %26, i32* %32, align 4
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %33, i32 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i32 0, i32 0
  %37 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %36, align 8
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %39 = bitcast %struct.jpeg_decompress_struct* %38 to %struct.jpeg_common_struct*
  %40 = ptrtoint void (%struct.jpeg_common_struct*)* %37 to i64
  call void @__llvm_profile_instrument_target(i64 %40, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_coefficients to i8*), i32 0)
  call void %37(%struct.jpeg_common_struct* %39)
  br label %41

; <label>:41:                                     ; preds = %18, %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 6)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 6)
  br label %43

; <label>:43:                                     ; preds = %41, %9
  br label %44

; <label>:44:                                     ; preds = %118, %43
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 2
  %47 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %46, align 8
  %48 = icmp ne %struct.jpeg_progress_mgr* %47, null
  br i1 %48, label %49, label %60

; <label>:49:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 1)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 1)
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 2
  %53 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %53, i32 0, i32 0
  %55 = bitcast {}** %54 to void (%struct.jpeg_common_struct*)**
  %56 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %55, align 8
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %58 = bitcast %struct.jpeg_decompress_struct* %57 to %struct.jpeg_common_struct*
  %59 = ptrtoint void (%struct.jpeg_common_struct*)* %56 to i64
  call void @__llvm_profile_instrument_target(i64 %59, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_coefficients to i8*), i32 1)
  call void %56(%struct.jpeg_common_struct* %58)
  br label %60

; <label>:60:                                     ; preds = %49, %44
  %61 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %62 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %61, i32 0, i32 77
  %63 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %63, i32 0, i32 0
  %65 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %64, align 8
  %66 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %67 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %65 to i64
  call void @__llvm_profile_instrument_target(i64 %67, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_coefficients to i8*), i32 2)
  %68 = call i32 %65(%struct.jpeg_decompress_struct* %66)
  store i32 %68, i32* %4, align 4
  %69 = load i32, i32* %4, align 4
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %73

; <label>:71:                                     ; preds = %60
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 7)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 7)
  store %struct.jvirt_barray_control** null, %struct.jvirt_barray_control*** %2, align 8
  br label %128

; <label>:73:                                     ; preds = %60
  %74 = load i32, i32* %4, align 4
  %75 = icmp eq i32 %74, 2
  br i1 %75, label %76, label %77

; <label>:76:                                     ; preds = %73
  br label %119

; <label>:77:                                     ; preds = %73
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 0)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 0)
  %79 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %80 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %79, i32 0, i32 2
  %81 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %80, align 8
  %82 = icmp ne %struct.jpeg_progress_mgr* %81, null
  br i1 %82, label %83, label %118

; <label>:83:                                     ; preds = %77
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 2)
  %84 = add i64 %pgocount5, 1
  store i64 %84, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 2)
  %85 = load i32, i32* %4, align 4
  %86 = icmp eq i32 %85, 3
  br i1 %86, label %91, label %87

; <label>:87:                                     ; preds = %83
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 4)
  %88 = add i64 %pgocount6, 1
  store i64 %88, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 4)
  %89 = load i32, i32* %4, align 4
  %90 = icmp eq i32 %89, 1
  br i1 %90, label %91, label %118

; <label>:91:                                     ; preds = %87, %83
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %92, i32 0, i32 2
  %94 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %93, align 8
  %95 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %94, i32 0, i32 1
  %96 = load i64, i64* %95, align 8
  %97 = add nsw i64 %96, 1
  store i64 %97, i64* %95, align 8
  %98 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %99 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %98, i32 0, i32 2
  %100 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %99, align 8
  %101 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %100, i32 0, i32 2
  %102 = load i64, i64* %101, align 8
  %103 = icmp sge i64 %97, %102
  br i1 %103, label %104, label %116

; <label>:104:                                    ; preds = %91
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 5)
  %105 = add i64 %pgocount7, 1
  store i64 %105, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 5)
  %106 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %107 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %106, i32 0, i32 60
  %108 = load i32, i32* %107, align 8
  %109 = zext i32 %108 to i64
  %110 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %111 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %110, i32 0, i32 2
  %112 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %111, align 8
  %113 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %112, i32 0, i32 2
  %114 = load i64, i64* %113, align 8
  %115 = add nsw i64 %114, %109
  store i64 %115, i64* %113, align 8
  br label %116

; <label>:116:                                    ; preds = %104, %91
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 3)
  %117 = add i64 %pgocount8, 1
  store i64 %117, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 3)
  br label %118

; <label>:118:                                    ; preds = %116, %87, %77
  br label %44

; <label>:119:                                    ; preds = %76
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 8)
  %120 = add i64 %pgocount9, 1
  store i64 %120, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_jpeg_read_coefficients, i64 0, i64 8)
  %121 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %122 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %121, i32 0, i32 4
  store i32 210, i32* %122, align 4
  %123 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %124 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %123, i32 0, i32 75
  %125 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %124, align 8
  %126 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %125, i32 0, i32 4
  %127 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %126, align 8
  store %struct.jvirt_barray_control** %127, %struct.jvirt_barray_control*** %2, align 8
  br label %128

; <label>:128:                                    ; preds = %119, %71
  %129 = load %struct.jvirt_barray_control**, %struct.jvirt_barray_control*** %2, align 8
  ret %struct.jvirt_barray_control** %129
}

; Function Attrs: nounwind uwtable
define internal void @transdecode_master_selection(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca %struct.jpeg_decompress_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %2, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 45
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %22

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 0)
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i32 0, i32 5
  store i32 1, i32* %13, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 0
  %16 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %15, align 8
  %17 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %16, i32 0, i32 0
  %18 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %17, align 8
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %20 = bitcast %struct.jpeg_decompress_struct* %19 to %struct.jpeg_common_struct*
  %21 = ptrtoint void (%struct.jpeg_common_struct*)* %18 to i64
  call void @__llvm_profile_instrument_target(i64 %21, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transdecode_master_selection to i8*), i32 0)
  call void %18(%struct.jpeg_common_struct* %20)
  br label %34

; <label>:22:                                     ; preds = %1
  %23 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %23, i32 0, i32 44
  %25 = load i32, i32* %24, align 8
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %30

; <label>:27:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 2)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 2)
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_phuff_decoder(%struct.jpeg_decompress_struct* %29)
  br label %33

; <label>:30:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 4)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 4)
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_huff_decoder(%struct.jpeg_decompress_struct* %32)
  br label %33

; <label>:33:                                     ; preds = %30, %27
  br label %34

; <label>:34:                                     ; preds = %33, %8
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  call void @jinit_d_coef_controller(%struct.jpeg_decompress_struct* %35, i32 1)
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 1
  %38 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %38, i32 0, i32 6
  %40 = bitcast {}** %39 to void (%struct.jpeg_common_struct*)**
  %41 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %40, align 8
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %43 = bitcast %struct.jpeg_decompress_struct* %42 to %struct.jpeg_common_struct*
  %44 = ptrtoint void (%struct.jpeg_common_struct*)* %41 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transdecode_master_selection to i8*), i32 1)
  call void %41(%struct.jpeg_common_struct* %43)
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 77
  %47 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %47, i32 0, i32 2
  %49 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %48, align 8
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %51 = ptrtoint void (%struct.jpeg_decompress_struct*)* %49 to i64
  call void @__llvm_profile_instrument_target(i64 %51, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_transdecode_master_selection to i8*), i32 2)
  call void %49(%struct.jpeg_decompress_struct* %50)
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %53 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %52, i32 0, i32 2
  %54 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %53, align 8
  %55 = icmp ne %struct.jpeg_progress_mgr* %54, null
  br i1 %55, label %56, label %107

; <label>:56:                                     ; preds = %34
  %57 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %58 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %57, i32 0, i32 44
  %59 = load i32, i32* %58, align 8
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %68

; <label>:61:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 1)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 1)
  %63 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %64 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %63, i32 0, i32 8
  %65 = load i32, i32* %64, align 8
  %66 = mul nsw i32 3, %65
  %67 = add nsw i32 2, %66
  store i32 %67, i32* %3, align 4
  br label %83

; <label>:68:                                     ; preds = %56
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i32 0, i32 77
  %71 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %71, i32 0, i32 4
  %73 = load i32, i32* %72, align 8
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %80

; <label>:75:                                     ; preds = %68
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 3)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 3)
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i32 0, i32 8
  %79 = load i32, i32* %78, align 8
  store i32 %79, i32* %3, align 4
  br label %82

; <label>:80:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 5)
  %81 = add i64 %pgocount5, 1
  store i64 %81, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_transdecode_master_selection, i64 0, i64 5)
  store i32 1, i32* %3, align 4
  br label %82

; <label>:82:                                     ; preds = %80, %75
  br label %83

; <label>:83:                                     ; preds = %82, %61
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 2
  %86 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %86, i32 0, i32 1
  store i64 0, i64* %87, align 8
  %88 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %89 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %88, i32 0, i32 60
  %90 = load i32, i32* %89, align 8
  %91 = zext i32 %90 to i64
  %92 = load i32, i32* %3, align 4
  %93 = sext i32 %92 to i64
  %94 = mul nsw i64 %91, %93
  %95 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %96 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %95, i32 0, i32 2
  %97 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %96, align 8
  %98 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %97, i32 0, i32 2
  store i64 %94, i64* %98, align 8
  %99 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %100 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %99, i32 0, i32 2
  %101 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %100, align 8
  %102 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %101, i32 0, i32 3
  store i32 0, i32* %102, align 8
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %2, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 2
  %105 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %105, i32 0, i32 4
  store i32 1, i32* %106, align 4
  br label %107

; <label>:107:                                    ; preds = %83, %34
  ret void
}

declare void @jinit_phuff_decoder(%struct.jpeg_decompress_struct*) #1

declare void @jinit_huff_decoder(%struct.jpeg_decompress_struct*) #1

declare void @jinit_d_coef_controller(%struct.jpeg_decompress_struct*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
