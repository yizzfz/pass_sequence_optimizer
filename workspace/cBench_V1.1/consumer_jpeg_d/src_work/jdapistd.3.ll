; ModuleID = 'jdapistd.2.ll'
source_filename = "jdapistd.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, {}*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32 }
%struct.jpeg_d_main_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* }
%struct.jpeg_d_coef_controller = type { void (%struct.jpeg_decompress_struct*)*, {}*, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, i8***)*, %struct.jvirt_barray_control** }
%struct.jpeg_d_post_controller = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)* }
%struct.jpeg_input_controller = type { {}*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)*, i32, i32 }
%struct.jpeg_marker_reader = type { void (%struct.jpeg_decompress_struct*)*, {}*, {}*, {}*, [16 x {}*], i32, i32, i32, i32 }
%struct.jpeg_entropy_decoder = type { void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*, [64 x i16]**)* }
%struct.jpeg_inverse_dct = type { void (%struct.jpeg_decompress_struct*)*, [10 x void (%struct.jpeg_decompress_struct*, %struct.jpeg_component_info*, i16*, i8**, i32)*] }
%struct.jpeg_upsampler = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32*, i32, i8**, i32*, i32)*, i32 }
%struct.jpeg_color_deconverter = type { void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i8***, i32, i8**, i32)* }
%struct.jpeg_color_quantizer = type { void (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i8**, i32)*, void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_start_decompress = private constant [21 x i8] c"jpeg_start_decompress"
@__profn_tmp1.ll_output_pass_setup = private constant [25 x i8] c"tmp1.ll:output_pass_setup"
@__profn_jpeg_read_scanlines = private constant [19 x i8] c"jpeg_read_scanlines"
@__profn_jpeg_read_raw_data = private constant [18 x i8] c"jpeg_read_raw_data"
@__profn_jpeg_start_output = private constant [17 x i8] c"jpeg_start_output"
@__profn_jpeg_finish_output = private constant [18 x i8] c"jpeg_finish_output"
@__profc_jpeg_start_decompress = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_start_decompress = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_start_decompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6848842246281882915, i64 844599916012571, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @jpeg_start_decompress to i8*), i8* bitcast ([3 x i64]* @__profvp_jpeg_start_decompress to i8*), i32 13, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_output_pass_setup = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_output_pass_setup = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_output_pass_setup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3541693914439005201, i64 73465057992312379, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i32 0, i32 0), i8* null, i8* bitcast ([5 x i64]* @__profvp_tmp1.ll_output_pass_setup to i8*), i32 7, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_jpeg_read_scanlines = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_read_scanlines = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_read_scanlines = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2748833885215912068, i64 1125952951733243, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, i8**, i32)* @jpeg_read_scanlines to i8*), i8* bitcast ([4 x i64]* @__profvp_jpeg_read_scanlines to i8*), i32 4, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_jpeg_read_raw_data = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_read_raw_data = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_read_raw_data = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8497586474703323363, i64 1407452787661742, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, i8***, i32)* @jpeg_read_raw_data to i8*), i8* bitcast ([5 x i64]* @__profvp_jpeg_read_raw_data to i8*), i32 6, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__profc_jpeg_start_output = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_start_output = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_start_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4120438604289785818, i64 281541215085638, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*, i32)* @jpeg_start_output to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_start_output to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_finish_output = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_finish_output = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_finish_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3719451154115590521, i64 844530382929265, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_decompress_struct*)* @jpeg_finish_output to i8*), i8* bitcast ([3 x i64]* @__profvp_jpeg_finish_output to i8*), i32 8, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [21 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [91 x i8] c"{Yx\DAM\CCK\0A\800\0CEQ\BA!\C1\A9\9B\09\A1\8DZ\E9'\F4\A5\B8}\918pz\B8\DCK\E5 \18\0F\A3$\B1W\1D\02\04\AB\BA.\A5l}\9AN#e\80 65\5Co?\84\13!r+\B9\09~6\F8\A6\C4\C6N\BE\F5\87\CB\9E[\C6\F9\D1\03\C0\E20\C2", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_decompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_pass_setup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_scanlines to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_raw_data to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_output to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_output to i8*), i8* bitcast ([21 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([91 x i8], [91 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @jpeg_start_decompress(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 202
  br i1 %8, label %9, label %23

; <label>:9:                                      ; preds = %1
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @jinit_master_decompress(%struct.jpeg_decompress_struct* %10)
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 14
  %13 = load i32, i32* %12, align 8
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 7)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 7)
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 4
  store i32 207, i32* %18, align 4
  store i32 1, i32* %2, align 4
  br label %154

; <label>:19:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 9)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 9)
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 4
  store i32 203, i32* %22, align 4
  br label %23

; <label>:23:                                     ; preds = %19, %1
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 4
  %26 = load i32, i32* %25, align 4
  %27 = icmp eq i32 %26, 203
  br i1 %27, label %28, label %121

; <label>:28:                                     ; preds = %23
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 77
  %31 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %31, i32 0, i32 4
  %33 = load i32, i32* %32, align 8
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %114

; <label>:35:                                     ; preds = %28
  br label %36

; <label>:36:                                     ; preds = %111, %35
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 2
  %39 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %38, align 8
  %40 = icmp ne %struct.jpeg_progress_mgr* %39, null
  br i1 %40, label %41, label %52

; <label>:41:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 1)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 1)
  %43 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %44 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %43, i32 0, i32 2
  %45 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %44, align 8
  %46 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %45, i32 0, i32 0
  %47 = bitcast {}** %46 to void (%struct.jpeg_common_struct*)**
  %48 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %47, align 8
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %50 = bitcast %struct.jpeg_decompress_struct* %49 to %struct.jpeg_common_struct*
  %51 = ptrtoint void (%struct.jpeg_common_struct*)* %48 to i64
  call void @__llvm_profile_instrument_target(i64 %51, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_decompress to i8*), i32 0)
  call void %48(%struct.jpeg_common_struct* %50)
  br label %52

; <label>:52:                                     ; preds = %41, %36
  %53 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %53, i32 0, i32 77
  %55 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %54, align 8
  %56 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %55, i32 0, i32 0
  %57 = bitcast {}** %56 to i32 (%struct.jpeg_decompress_struct*)**
  %58 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %57, align 8
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %60 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %58 to i64
  call void @__llvm_profile_instrument_target(i64 %60, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_decompress to i8*), i32 1)
  %61 = call i32 %58(%struct.jpeg_decompress_struct* %59)
  store i32 %61, i32* %4, align 4
  %62 = load i32, i32* %4, align 4
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 11)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 11)
  store i32 0, i32* %2, align 4
  br label %154

; <label>:66:                                     ; preds = %52
  %67 = load i32, i32* %4, align 4
  %68 = icmp eq i32 %67, 2
  br i1 %68, label %69, label %71

; <label>:69:                                     ; preds = %66
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 12)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 12)
  br label %113

; <label>:71:                                     ; preds = %66
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 2
  %74 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %73, align 8
  %75 = icmp ne %struct.jpeg_progress_mgr* %74, null
  br i1 %75, label %76, label %111

; <label>:76:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 2)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 2)
  %78 = load i32, i32* %4, align 4
  %79 = icmp eq i32 %78, 3
  br i1 %79, label %84, label %80

; <label>:80:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 4)
  %81 = add i64 %pgocount6, 1
  store i64 %81, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 4)
  %82 = load i32, i32* %4, align 4
  %83 = icmp eq i32 %82, 1
  br i1 %83, label %84, label %111

; <label>:84:                                     ; preds = %80, %76
  %85 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %86 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %85, i32 0, i32 2
  %87 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %87, i32 0, i32 1
  %89 = load i64, i64* %88, align 8
  %90 = add nsw i64 %89, 1
  store i64 %90, i64* %88, align 8
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 2
  %93 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %93, i32 0, i32 2
  %95 = load i64, i64* %94, align 8
  %96 = icmp sge i64 %90, %95
  br i1 %96, label %97, label %109

; <label>:97:                                     ; preds = %84
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 5)
  %98 = add i64 %pgocount7, 1
  store i64 %98, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 5)
  %99 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %100 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %99, i32 0, i32 60
  %101 = load i32, i32* %100, align 8
  %102 = zext i32 %101 to i64
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 2
  %105 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %105, i32 0, i32 2
  %107 = load i64, i64* %106, align 8
  %108 = add nsw i64 %107, %102
  store i64 %108, i64* %106, align 8
  br label %109

; <label>:109:                                    ; preds = %97, %84
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 3)
  %110 = add i64 %pgocount8, 1
  store i64 %110, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 3)
  br label %111

; <label>:111:                                    ; preds = %109, %80, %71
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 0)
  %112 = add i64 %pgocount9, 1
  store i64 %112, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 0)
  br label %36

; <label>:113:                                    ; preds = %69
  br label %114

; <label>:114:                                    ; preds = %113, %28
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 8)
  %115 = add i64 %pgocount10, 1
  store i64 %115, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 8)
  %116 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %117 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %116, i32 0, i32 34
  %118 = load i32, i32* %117, align 4
  %119 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %120 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %119, i32 0, i32 36
  store i32 %118, i32* %120, align 4
  br label %151

; <label>:121:                                    ; preds = %23
  %122 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %123 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %122, i32 0, i32 4
  %124 = load i32, i32* %123, align 4
  %125 = icmp ne i32 %124, 204
  br i1 %125, label %126, label %149

; <label>:126:                                    ; preds = %121
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 10)
  %127 = add i64 %pgocount11, 1
  store i64 %127, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 10)
  %128 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %129 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %128, i32 0, i32 0
  %130 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %129, align 8
  %131 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %130, i32 0, i32 5
  store i32 18, i32* %131, align 8
  %132 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %133 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %132, i32 0, i32 4
  %134 = load i32, i32* %133, align 4
  %135 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %136 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %135, i32 0, i32 0
  %137 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %136, align 8
  %138 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %137, i32 0, i32 6
  %139 = bitcast %union.anon* %138 to [8 x i32]*
  %140 = getelementptr inbounds [8 x i32], [8 x i32]* %139, i64 0, i64 0
  store i32 %134, i32* %140, align 4
  %141 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %142 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %141, i32 0, i32 0
  %143 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %143, i32 0, i32 0
  %145 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %144, align 8
  %146 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %147 = bitcast %struct.jpeg_decompress_struct* %146 to %struct.jpeg_common_struct*
  %148 = ptrtoint void (%struct.jpeg_common_struct*)* %145 to i64
  call void @__llvm_profile_instrument_target(i64 %148, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_decompress to i8*), i32 2)
  call void %145(%struct.jpeg_common_struct* %147)
  br label %149

; <label>:149:                                    ; preds = %126, %121
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 6)
  %150 = add i64 %pgocount12, 1
  store i64 %150, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_jpeg_start_decompress, i64 0, i64 6)
  br label %151

; <label>:151:                                    ; preds = %149, %114
  %152 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %153 = call i32 @output_pass_setup(%struct.jpeg_decompress_struct* %152)
  store i32 %153, i32* %2, align 4
  br label %154

; <label>:154:                                    ; preds = %151, %64, %15
  %155 = load i32, i32* %2, align 4
  ret i32 %155
}

declare void @jinit_master_decompress(%struct.jpeg_decompress_struct*) #1

; Function Attrs: nounwind uwtable
define internal i32 @output_pass_setup(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 204
  br i1 %8, label %9, label %22

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 4)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 4)
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 73
  %13 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %12, align 8
  %14 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %13, i32 0, i32 0
  %15 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %14, align 8
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = ptrtoint void (%struct.jpeg_decompress_struct*)* %15 to i64
  call void @__llvm_profile_instrument_target(i64 %17, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_pass_setup to i8*), i32 0)
  call void %15(%struct.jpeg_decompress_struct* %16)
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 33
  store i32 0, i32* %19, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 4
  store i32 204, i32* %21, align 4
  br label %22

; <label>:22:                                     ; preds = %9, %1
  br label %23

; <label>:23:                                     ; preds = %93, %22
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 73
  %26 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %26, i32 0, i32 2
  %28 = load i32, i32* %27, align 8
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %111

; <label>:30:                                     ; preds = %23
  br label %31

; <label>:31:                                     ; preds = %91, %30
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 33
  %34 = load i32, i32* %33, align 8
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %35, i32 0, i32 27
  %37 = load i32, i32* %36, align 4
  %38 = icmp ult i32 %34, %37
  br i1 %38, label %39, label %93

; <label>:39:                                     ; preds = %31
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %40, i32 0, i32 2
  %42 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %41, align 8
  %43 = icmp ne %struct.jpeg_progress_mgr* %42, null
  br i1 %43, label %44, label %71

; <label>:44:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 1)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 1)
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 33
  %48 = load i32, i32* %47, align 8
  %49 = zext i32 %48 to i64
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 2
  %52 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %52, i32 0, i32 1
  store i64 %49, i64* %53, align 8
  %54 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %55 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %54, i32 0, i32 27
  %56 = load i32, i32* %55, align 4
  %57 = zext i32 %56 to i64
  %58 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %59 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %58, i32 0, i32 2
  %60 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %60, i32 0, i32 2
  store i64 %57, i64* %61, align 8
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 2
  %64 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %64, i32 0, i32 0
  %66 = bitcast {}** %65 to void (%struct.jpeg_common_struct*)**
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  %68 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %69 = bitcast %struct.jpeg_decompress_struct* %68 to %struct.jpeg_common_struct*
  %70 = ptrtoint void (%struct.jpeg_common_struct*)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_pass_setup to i8*), i32 1)
  call void %67(%struct.jpeg_common_struct* %69)
  br label %71

; <label>:71:                                     ; preds = %44, %39
  %72 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %73 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %72, i32 0, i32 33
  %74 = load i32, i32* %73, align 8
  store i32 %74, i32* %4, align 4
  %75 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %76 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %75, i32 0, i32 74
  %77 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %76, align 8
  %78 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %77, i32 0, i32 1
  %79 = load void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %78, align 8
  %80 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 33
  %83 = ptrtoint void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* %79 to i64
  call void @__llvm_profile_instrument_target(i64 %83, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_pass_setup to i8*), i32 2)
  call void %79(%struct.jpeg_decompress_struct* %80, i8** null, i32* %82, i32 0)
  %84 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %85 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %84, i32 0, i32 33
  %86 = load i32, i32* %85, align 8
  %87 = load i32, i32* %4, align 4
  %88 = icmp eq i32 %86, %87
  br i1 %88, label %89, label %91

; <label>:89:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 3)
  %90 = add i64 %pgocount2, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 3)
  store i32 0, i32* %2, align 4
  br label %122

; <label>:91:                                     ; preds = %71
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 0)
  %92 = add i64 %pgocount3, 1
  store i64 %92, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 0)
  br label %31

; <label>:93:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 2)
  %94 = add i64 %pgocount4, 1
  store i64 %94, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 2)
  %95 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %96 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %95, i32 0, i32 73
  %97 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %96, align 8
  %98 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %97, i32 0, i32 1
  %99 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %98, align 8
  %100 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %101 = ptrtoint void (%struct.jpeg_decompress_struct*)* %99 to i64
  call void @__llvm_profile_instrument_target(i64 %101, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_pass_setup to i8*), i32 3)
  call void %99(%struct.jpeg_decompress_struct* %100)
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %103 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %102, i32 0, i32 73
  %104 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %103, align 8
  %105 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %104, i32 0, i32 0
  %106 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %105, align 8
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %108 = ptrtoint void (%struct.jpeg_decompress_struct*)* %106 to i64
  call void @__llvm_profile_instrument_target(i64 %108, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_output_pass_setup to i8*), i32 4)
  call void %106(%struct.jpeg_decompress_struct* %107)
  %109 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %110 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %109, i32 0, i32 33
  store i32 0, i32* %110, align 8
  br label %23

; <label>:111:                                    ; preds = %23
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 5)
  %112 = add i64 %pgocount5, 1
  store i64 %112, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 5)
  %113 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %114 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %113, i32 0, i32 15
  %115 = load i32, i32* %114, align 4
  %116 = icmp ne i32 %115, 0
  %117 = zext i1 %116 to i64
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 6)
  %118 = add i64 %pgocount6, %117
  store i64 %118, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_output_pass_setup, i64 0, i64 6)
  %119 = select i1 %116, i32 206, i32 205
  %120 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %121 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %120, i32 0, i32 4
  store i32 %119, i32* %121, align 4
  store i32 1, i32* %2, align 4
  br label %122

; <label>:122:                                    ; preds = %111, %89
  %123 = load i32, i32* %2, align 4
  ret i32 %123
}

; Function Attrs: nounwind uwtable
define i32 @jpeg_read_scanlines(%struct.jpeg_decompress_struct*, i8**, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8** %1, i8*** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 4
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 205
  br i1 %12, label %13, label %36

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i64 0, i64 0)
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 18, i32* %18, align 8
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 6
  %26 = bitcast %union.anon* %25 to [8 x i32]*
  %27 = getelementptr inbounds [8 x i32], [8 x i32]* %26, i64 0, i64 0
  store i32 %21, i32* %27, align 4
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_scanlines to i8*), i32 0)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %13, %3
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 33
  %39 = load i32, i32* %38, align 8
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %40, i32 0, i32 27
  %42 = load i32, i32* %41, align 4
  %43 = icmp uge i32 %39, %42
  br i1 %43, label %44, label %58

; <label>:44:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i64 0, i64 1)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i64 0, i64 1)
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i32 0, i32 5
  store i32 119, i32* %49, align 8
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 0
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i32 0, i32 1
  %54 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %53, align 8
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %56 = bitcast %struct.jpeg_decompress_struct* %55 to %struct.jpeg_common_struct*
  %57 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_scanlines to i8*), i32 1)
  call void %54(%struct.jpeg_common_struct* %56, i32 -1)
  store i32 0, i32* %4, align 4
  br label %107

; <label>:58:                                     ; preds = %36
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 2
  %61 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %60, align 8
  %62 = icmp ne %struct.jpeg_progress_mgr* %61, null
  br i1 %62, label %63, label %90

; <label>:63:                                     ; preds = %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i64 0, i64 3)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i64 0, i64 3)
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %65, i32 0, i32 33
  %67 = load i32, i32* %66, align 8
  %68 = zext i32 %67 to i64
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i32 0, i32 2
  %71 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %71, i32 0, i32 1
  store i64 %68, i64* %72, align 8
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i32 0, i32 27
  %75 = load i32, i32* %74, align 4
  %76 = zext i32 %75 to i64
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i32 0, i32 2
  %79 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %79, i32 0, i32 2
  store i64 %76, i64* %80, align 8
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 2
  %83 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %83, i32 0, i32 0
  %85 = bitcast {}** %84 to void (%struct.jpeg_common_struct*)**
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %88 = bitcast %struct.jpeg_decompress_struct* %87 to %struct.jpeg_common_struct*
  %89 = ptrtoint void (%struct.jpeg_common_struct*)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %89, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_scanlines to i8*), i32 2)
  call void %86(%struct.jpeg_common_struct* %88)
  br label %90

; <label>:90:                                     ; preds = %63, %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i64 0, i64 2)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_read_scanlines, i64 0, i64 2)
  store i32 0, i32* %8, align 4
  %92 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %93 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %92, i32 0, i32 74
  %94 = load %struct.jpeg_d_main_controller*, %struct.jpeg_d_main_controller** %93, align 8
  %95 = getelementptr inbounds %struct.jpeg_d_main_controller, %struct.jpeg_d_main_controller* %94, i32 0, i32 1
  %96 = load void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)*, void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)** %95, align 8
  %97 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %98 = load i8**, i8*** %6, align 8
  %99 = load i32, i32* %7, align 4
  %100 = ptrtoint void (%struct.jpeg_decompress_struct*, i8**, i32*, i32)* %96 to i64
  call void @__llvm_profile_instrument_target(i64 %100, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_scanlines to i8*), i32 3)
  call void %96(%struct.jpeg_decompress_struct* %97, i8** %98, i32* %8, i32 %99)
  %101 = load i32, i32* %8, align 4
  %102 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %103 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %102, i32 0, i32 33
  %104 = load i32, i32* %103, align 8
  %105 = add i32 %104, %101
  store i32 %105, i32* %103, align 8
  %106 = load i32, i32* %8, align 4
  store i32 %106, i32* %4, align 4
  br label %107

; <label>:107:                                    ; preds = %90, %44
  %108 = load i32, i32* %4, align 4
  ret i32 %108
}

; Function Attrs: nounwind uwtable
define i32 @jpeg_read_raw_data(%struct.jpeg_decompress_struct*, i8***, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_decompress_struct*, align 8
  %6 = alloca i8***, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %5, align 8
  store i8*** %1, i8**** %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %10 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %9, i32 0, i32 4
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 206
  br i1 %12, label %13, label %36

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 0)
  %15 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %16 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 18, i32* %18, align 8
  %19 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %20 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 6
  %26 = bitcast %union.anon* %25 to [8 x i32]*
  %27 = getelementptr inbounds [8 x i32], [8 x i32]* %26, i64 0, i64 0
  store i32 %21, i32* %27, align 4
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %34 = bitcast %struct.jpeg_decompress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_raw_data to i8*), i32 0)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %13, %3
  %37 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %38 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %37, i32 0, i32 33
  %39 = load i32, i32* %38, align 8
  %40 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %41 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %40, i32 0, i32 27
  %42 = load i32, i32* %41, align 4
  %43 = icmp uge i32 %39, %42
  br i1 %43, label %44, label %58

; <label>:44:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 1)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 1)
  %46 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %47 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %46, i32 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i32 0, i32 5
  store i32 119, i32* %49, align 8
  %50 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %51 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %50, i32 0, i32 0
  %52 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %51, align 8
  %53 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %52, i32 0, i32 1
  %54 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %53, align 8
  %55 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %56 = bitcast %struct.jpeg_decompress_struct* %55 to %struct.jpeg_common_struct*
  %57 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_raw_data to i8*), i32 1)
  call void %54(%struct.jpeg_common_struct* %56, i32 -1)
  store i32 0, i32* %4, align 4
  br label %136

; <label>:58:                                     ; preds = %36
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 2
  %61 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %60, align 8
  %62 = icmp ne %struct.jpeg_progress_mgr* %61, null
  br i1 %62, label %63, label %90

; <label>:63:                                     ; preds = %58
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 2)
  %64 = add i64 %pgocount2, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 2)
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %65, i32 0, i32 33
  %67 = load i32, i32* %66, align 8
  %68 = zext i32 %67 to i64
  %69 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %70 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %69, i32 0, i32 2
  %71 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %70, align 8
  %72 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %71, i32 0, i32 1
  store i64 %68, i64* %72, align 8
  %73 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %74 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %73, i32 0, i32 27
  %75 = load i32, i32* %74, align 4
  %76 = zext i32 %75 to i64
  %77 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %78 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %77, i32 0, i32 2
  %79 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %79, i32 0, i32 2
  store i64 %76, i64* %80, align 8
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 2
  %83 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %83, i32 0, i32 0
  %85 = bitcast {}** %84 to void (%struct.jpeg_common_struct*)**
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %88 = bitcast %struct.jpeg_decompress_struct* %87 to %struct.jpeg_common_struct*
  %89 = ptrtoint void (%struct.jpeg_common_struct*)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %89, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_raw_data to i8*), i32 2)
  call void %86(%struct.jpeg_common_struct* %88)
  br label %90

; <label>:90:                                     ; preds = %63, %58
  %91 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %92 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %91, i32 0, i32 58
  %93 = load i32, i32* %92, align 8
  %94 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %95 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %94, i32 0, i32 59
  %96 = load i32, i32* %95, align 4
  %97 = mul nsw i32 %93, %96
  store i32 %97, i32* %8, align 4
  %98 = load i32, i32* %7, align 4
  %99 = load i32, i32* %8, align 4
  %100 = icmp ult i32 %98, %99
  br i1 %100, label %101, label %115

; <label>:101:                                    ; preds = %90
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 4)
  %102 = add i64 %pgocount3, 1
  store i64 %102, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 4)
  %103 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %104 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %103, i32 0, i32 0
  %105 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %105, i32 0, i32 5
  store i32 21, i32* %106, align 8
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %107, i32 0, i32 0
  %109 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %108, align 8
  %110 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %109, i32 0, i32 0
  %111 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %110, align 8
  %112 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %113 = bitcast %struct.jpeg_decompress_struct* %112 to %struct.jpeg_common_struct*
  %114 = ptrtoint void (%struct.jpeg_common_struct*)* %111 to i64
  call void @__llvm_profile_instrument_target(i64 %114, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_raw_data to i8*), i32 3)
  call void %111(%struct.jpeg_common_struct* %113)
  br label %115

; <label>:115:                                    ; preds = %101, %90
  %116 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %117 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %116, i32 0, i32 75
  %118 = load %struct.jpeg_d_coef_controller*, %struct.jpeg_d_coef_controller** %117, align 8
  %119 = getelementptr inbounds %struct.jpeg_d_coef_controller, %struct.jpeg_d_coef_controller* %118, i32 0, i32 3
  %120 = load i32 (%struct.jpeg_decompress_struct*, i8***)*, i32 (%struct.jpeg_decompress_struct*, i8***)** %119, align 8
  %121 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %122 = load i8***, i8**** %6, align 8
  %123 = ptrtoint i32 (%struct.jpeg_decompress_struct*, i8***)* %120 to i64
  call void @__llvm_profile_instrument_target(i64 %123, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_read_raw_data to i8*), i32 4)
  %124 = call i32 %120(%struct.jpeg_decompress_struct* %121, i8*** %122)
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %128, label %126

; <label>:126:                                    ; preds = %115
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 5)
  %127 = add i64 %pgocount4, 1
  store i64 %127, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 5)
  store i32 0, i32* %4, align 4
  br label %136

; <label>:128:                                    ; preds = %115
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 3)
  %129 = add i64 %pgocount5, 1
  store i64 %129, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_read_raw_data, i64 0, i64 3)
  %130 = load i32, i32* %8, align 4
  %131 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %5, align 8
  %132 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %131, i32 0, i32 33
  %133 = load i32, i32* %132, align 8
  %134 = add i32 %133, %130
  store i32 %134, i32* %132, align 8
  %135 = load i32, i32* %8, align 4
  store i32 %135, i32* %4, align 4
  br label %136

; <label>:136:                                    ; preds = %128, %126, %44
  %137 = load i32, i32* %4, align 4
  ret i32 %137
}

; Function Attrs: nounwind uwtable
define i32 @jpeg_start_output(%struct.jpeg_decompress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 207
  br i1 %8, label %9, label %38

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 2)
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 4
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 204
  br i1 %14, label %15, label %38

; <label>:15:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 5)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 5)
  %17 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %17, i32 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i32 0, i32 5
  store i32 18, i32* %20, align 8
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %22 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %21, i32 0, i32 4
  %23 = load i32, i32* %22, align 4
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 6
  %28 = bitcast %union.anon* %27 to [8 x i32]*
  %29 = getelementptr inbounds [8 x i32], [8 x i32]* %28, i64 0, i64 0
  store i32 %23, i32* %29, align 4
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i32 0, i32 0
  %34 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %33, align 8
  %35 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %36 = bitcast %struct.jpeg_decompress_struct* %35 to %struct.jpeg_common_struct*
  %37 = ptrtoint void (%struct.jpeg_common_struct*)* %34 to i64
  call void @__llvm_profile_instrument_target(i64 %37, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_start_output to i8*), i32 0)
  call void %34(%struct.jpeg_common_struct* %36)
  br label %38

; <label>:38:                                     ; preds = %15, %9, %2
  %39 = load i32, i32* %4, align 4
  %40 = icmp sle i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 3)
  store i32 1, i32* %4, align 4
  br label %43

; <label>:43:                                     ; preds = %41, %38
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 77
  %46 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %45, align 8
  %47 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %46, i32 0, i32 5
  %48 = load i32, i32* %47, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %62

; <label>:50:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 1)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 1)
  %52 = load i32, i32* %4, align 4
  %53 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %54 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %53, i32 0, i32 34
  %55 = load i32, i32* %54, align 4
  %56 = icmp sgt i32 %52, %55
  br i1 %56, label %57, label %62

; <label>:57:                                     ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 4)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 4)
  %59 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %60 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %59, i32 0, i32 34
  %61 = load i32, i32* %60, align 4
  store i32 %61, i32* %4, align 4
  br label %62

; <label>:62:                                     ; preds = %57, %50, %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 0)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_start_output, i64 0, i64 0)
  %64 = load i32, i32* %4, align 4
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %65, i32 0, i32 36
  store i32 %64, i32* %66, align 4
  %67 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %68 = call i32 @output_pass_setup(%struct.jpeg_decompress_struct* %67)
  ret i32 %68
}

; Function Attrs: nounwind uwtable
define i32 @jpeg_finish_output(%struct.jpeg_decompress_struct*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %4 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %4, i32 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 205
  br i1 %7, label %15, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 3)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 3)
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %10, i32 0, i32 4
  %12 = load i32, i32* %11, align 4
  %13 = icmp eq i32 %12, 206
  br i1 %13, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 0)
  br label %31

; <label>:15:                                     ; preds = %8, %1
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 14
  %18 = load i32, i32* %17, align 8
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %31

; <label>:20:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 6)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 6)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 73
  %24 = load %struct.jpeg_decomp_master*, %struct.jpeg_decomp_master** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_decomp_master, %struct.jpeg_decomp_master* %24, i32 0, i32 1
  %26 = load void (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*)** %25, align 8
  %27 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %28 = ptrtoint void (%struct.jpeg_decompress_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %28, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_output to i8*), i32 0)
  call void %26(%struct.jpeg_decompress_struct* %27)
  %29 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %30 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %29, i32 0, i32 4
  store i32 208, i32* %30, align 4
  br label %60

; <label>:31:                                     ; preds = %15, %._crit_edge
  %32 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %33 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %32, i32 0, i32 4
  %34 = load i32, i32* %33, align 4
  %35 = icmp ne i32 %34, 208
  br i1 %35, label %36, label %59

; <label>:36:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 7)
  %37 = add i64 %pgocount3, 1
  store i64 %37, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 7)
  %38 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %39 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 5
  store i32 18, i32* %41, align 8
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 4
  %44 = load i32, i32* %43, align 4
  %45 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %46 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %45, i32 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i32 0, i32 6
  %49 = bitcast %union.anon* %48 to [8 x i32]*
  %50 = getelementptr inbounds [8 x i32], [8 x i32]* %49, i64 0, i64 0
  store i32 %44, i32* %50, align 4
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i32 0, i32 0
  %55 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %54, align 8
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %57 = bitcast %struct.jpeg_decompress_struct* %56 to %struct.jpeg_common_struct*
  %58 = ptrtoint void (%struct.jpeg_common_struct*)* %55 to i64
  call void @__llvm_profile_instrument_target(i64 %58, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_output to i8*), i32 1)
  call void %55(%struct.jpeg_common_struct* %57)
  br label %59

; <label>:59:                                     ; preds = %36, %31
  br label %60

; <label>:60:                                     ; preds = %59, %20
  br label %61

; <label>:61:                                     ; preds = %93, %60
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 34
  %64 = load i32, i32* %63, align 4
  %65 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %66 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %65, i32 0, i32 36
  %67 = load i32, i32* %66, align 4
  %68 = icmp sle i32 %64, %67
  br i1 %68, label %69, label %78

; <label>:69:                                     ; preds = %61
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 2)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 2)
  %71 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %72 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %71, i32 0, i32 77
  %73 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %73, i32 0, i32 5
  %75 = load i32, i32* %74, align 4
  %76 = icmp ne i32 %75, 0
  %77 = xor i1 %76, true
  br label %78

; <label>:78:                                     ; preds = %69, %61
  %79 = phi i1 [ false, %61 ], [ %77, %69 ]
  br i1 %79, label %80, label %95

; <label>:80:                                     ; preds = %78
  %81 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %82 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %81, i32 0, i32 77
  %83 = load %struct.jpeg_input_controller*, %struct.jpeg_input_controller** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_input_controller, %struct.jpeg_input_controller* %83, i32 0, i32 0
  %85 = bitcast {}** %84 to i32 (%struct.jpeg_decompress_struct*)**
  %86 = load i32 (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)** %85, align 8
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %88 = ptrtoint i32 (%struct.jpeg_decompress_struct*)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %88, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_output to i8*), i32 2)
  %89 = call i32 %86(%struct.jpeg_decompress_struct* %87)
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 5)
  %92 = add i64 %pgocount5, 1
  store i64 %92, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 5)
  store i32 0, i32* %2, align 4
  br label %99

; <label>:93:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 1)
  %94 = add i64 %pgocount6, 1
  store i64 %94, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 1)
  br label %61

; <label>:95:                                     ; preds = %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 4)
  %96 = add i64 %pgocount7, 1
  store i64 %96, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_finish_output, i64 0, i64 4)
  %97 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %98 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %97, i32 0, i32 4
  store i32 207, i32* %98, align 4
  store i32 1, i32* %2, align 4
  br label %99

; <label>:99:                                     ; preds = %95, %91
  %100 = load i32, i32* %2, align 4
  ret i32 %100
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
