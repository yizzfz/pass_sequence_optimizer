; ModuleID = 'tmp1.ll'
source_filename = "jcmaster.c"
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
%struct.my_comp_master = type { %struct.jpeg_comp_master, i32, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_c_master_control = private constant [22 x i8] c"jinit_c_master_control"
@__profn_tmp1.ll_prepare_for_pass = private constant [24 x i8] c"tmp1.ll:prepare_for_pass"
@__profn_tmp1.ll_pass_startup = private constant [20 x i8] c"tmp1.ll:pass_startup"
@__profn_tmp1.ll_finish_pass_master = private constant [26 x i8] c"tmp1.ll:finish_pass_master"
@__profn_tmp1.ll_initial_setup = private constant [21 x i8] c"tmp1.ll:initial_setup"
@__profn_tmp1.ll_validate_script = private constant [23 x i8] c"tmp1.ll:validate_script"
@__profn_tmp1.ll_select_scan_parameters = private constant [30 x i8] c"tmp1.ll:select_scan_parameters"
@__profn_tmp1.ll_per_scan_setup = private constant [22 x i8] c"tmp1.ll:per_scan_setup"
@__profc_jinit_c_master_control = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_c_master_control = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_c_master_control = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6416261527850248003, i64 281565575273855, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @jinit_c_master_control to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_c_master_control to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_prepare_for_pass = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_prepare_for_pass = private global [14 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_prepare_for_pass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6578155582011151263, i64 75998388921278551, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @prepare_for_pass to i8*), i8* bitcast ([14 x i64]* @__profvp_tmp1.ll_prepare_for_pass to i8*), i32 13, [1 x i16] [i16 14] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pass_startup = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_pass_startup = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_pass_startup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3281501188453151173, i64 562962838323199, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_pass_startup, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @pass_startup to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_pass_startup to i8*), i32 1, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_pass_master = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_finish_pass_master = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_finish_pass_master = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3216709327471735860, i64 281540694780667, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @finish_pass_master to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_finish_pass_master to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_initial_setup = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_initial_setup = private global [6 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_initial_setup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7911921014449640895, i64 1689073728166230, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i32 0, i32 0), i8* null, i8* bitcast ([6 x i64]* @__profvp_tmp1.ll_initial_setup to i8*), i32 18, [1 x i16] [i16 6] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_validate_script = private global [46 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_validate_script = private global [14 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_validate_script = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7197914414455353716, i64 3941280064207656, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i32 0, i32 0), i8* null, i8* bitcast ([14 x i64]* @__profvp_tmp1.ll_validate_script to i8*), i32 46, [1 x i16] [i16 14] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_select_scan_parameters = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_select_scan_parameters = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_select_scan_parameters = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6830036374844703070, i64 281557743439994, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_select_scan_parameters to i8*), i32 5, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_per_scan_setup = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_per_scan_setup = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_per_scan_setup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5859956703037387580, i64 563119477477053, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_per_scan_setup to i8*), i32 12, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [41 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [198 x i8] c"\C3\01\00jinit_c_master_control\01tmp1.ll:prepare_for_pass\01tmp1.ll:pass_startup\01tmp1.ll:finish_pass_master\01tmp1.ll:initial_setup\01tmp1.ll:validate_script\01tmp1.ll:select_scan_parameters\01tmp1.ll:per_scan_setup", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_master_control to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pass_startup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass_master to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_scan_parameters to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_per_scan_setup to i8*), i8* bitcast ([41 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([198 x i8], [198 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jinit_c_master_control(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.my_comp_master*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 1
  %8 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %7, align 8
  %9 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %8, i32 0, i32 0
  %10 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %9, align 8
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %12 = bitcast %struct.jpeg_compress_struct* %11 to %struct.jpeg_common_struct*
  %13 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %10 to i64
  call void @__llvm_profile_instrument_target(i64 %13, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_c_master_control to i8*), i32 0)
  %14 = call i8* %10(%struct.jpeg_common_struct* %12, i32 1, i64 48)
  %15 = bitcast i8* %14 to %struct.my_comp_master*
  store %struct.my_comp_master* %15, %struct.my_comp_master** %5, align 8
  %16 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %17 = bitcast %struct.my_comp_master* %16 to %struct.jpeg_comp_master*
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 51
  store %struct.jpeg_comp_master* %17, %struct.jpeg_comp_master** %19, align 8
  %20 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %21 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %20, i32 0, i32 0
  %22 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %21, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*)* @prepare_for_pass, void (%struct.jpeg_compress_struct*)** %22, align 8
  %23 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %24 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %23, i32 0, i32 0
  %25 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %24, i32 0, i32 1
  store void (%struct.jpeg_compress_struct*)* @pass_startup, void (%struct.jpeg_compress_struct*)** %25, align 8
  %26 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %27 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %26, i32 0, i32 0
  %28 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %27, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*)* @finish_pass_master, void (%struct.jpeg_compress_struct*)** %28, align 8
  %29 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %30 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %30, i32 0, i32 4
  store i32 0, i32* %31, align 4
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @initial_setup(%struct.jpeg_compress_struct* %32)
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 22
  %35 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %34, align 8
  %36 = icmp ne %struct.jpeg_scan_info* %35, null
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %2
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @validate_script(%struct.jpeg_compress_struct* %38)
  br label %45

; <label>:39:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 2)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 2)
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %41, i32 0, i32 37
  store i32 0, i32* %42, align 4
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %43, i32 0, i32 21
  store i32 1, i32* %44, align 8
  br label %45

; <label>:45:                                     ; preds = %39, %37
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 37
  %48 = load i32, i32* %47, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %45
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 0)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 0)
  %52 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %52, i32 0, i32 25
  store i32 1, i32* %53, align 8
  br label %54

; <label>:54:                                     ; preds = %50, %45
  %55 = load i32, i32* %4, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %71

; <label>:57:                                     ; preds = %54
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %59 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %58, i32 0, i32 25
  %60 = load i32, i32* %59, align 8
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %66

; <label>:62:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 1)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 1)
  %64 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %65 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %64, i32 0, i32 1
  store i32 1, i32* %65, align 8
  br label %70

; <label>:66:                                     ; preds = %57
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 5)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 5)
  %68 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %69 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %68, i32 0, i32 1
  store i32 2, i32* %69, align 8
  br label %70

; <label>:70:                                     ; preds = %66, %62
  br label %75

; <label>:71:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 3)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 3)
  %73 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %74 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %73, i32 0, i32 1
  store i32 0, i32* %74, align 8
  br label %75

; <label>:75:                                     ; preds = %71, %70
  %76 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %77 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %76, i32 0, i32 4
  store i32 0, i32* %77, align 4
  %78 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %79 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %78, i32 0, i32 2
  store i32 0, i32* %79, align 4
  %80 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %80, i32 0, i32 25
  %82 = load i32, i32* %81, align 8
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %91

; <label>:84:                                     ; preds = %75
  %85 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %85, i32 0, i32 21
  %87 = load i32, i32* %86, align 8
  %88 = mul nsw i32 %87, 2
  %89 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %90 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %89, i32 0, i32 3
  store i32 %88, i32* %90, align 8
  br label %98

; <label>:91:                                     ; preds = %75
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 4)
  %92 = add i64 %pgocount5, 1
  store i64 %92, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jinit_c_master_control, i64 0, i64 4)
  %93 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %94 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %93, i32 0, i32 21
  %95 = load i32, i32* %94, align 8
  %96 = load %struct.my_comp_master*, %struct.my_comp_master** %5, align 8
  %97 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %96, i32 0, i32 3
  store i32 %95, i32* %97, align 8
  br label %98

; <label>:98:                                     ; preds = %91, %84
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @prepare_for_pass(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_comp_master*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 51
  %6 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %5, align 8
  %7 = bitcast %struct.jpeg_comp_master* %6 to %struct.my_comp_master*
  store %struct.my_comp_master* %7, %struct.my_comp_master** %3, align 8
  %8 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %9 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 8
  switch i32 %10, label %193 [
    i32 0, label %11
    i32 1, label %96
    i32 2, label %143
  ]

; <label>:11:                                     ; preds = %1
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @select_scan_parameters(%struct.jpeg_compress_struct* %12)
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @per_scan_setup(%struct.jpeg_compress_struct* %13)
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 23
  %16 = load i32, i32* %15, align 8
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %41, label %18

; <label>:18:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 7)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 7)
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 56
  %22 = load %struct.jpeg_color_converter*, %struct.jpeg_color_converter** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_color_converter, %struct.jpeg_color_converter* %22, i32 0, i32 0
  %24 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %23, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %26 = ptrtoint void (%struct.jpeg_compress_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %26, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 0)
  call void %24(%struct.jpeg_compress_struct* %25)
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 57
  %29 = load %struct.jpeg_downsampler*, %struct.jpeg_downsampler** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_downsampler, %struct.jpeg_downsampler* %29, i32 0, i32 0
  %31 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %30, align 8
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %33 = ptrtoint void (%struct.jpeg_compress_struct*)* %31 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 1)
  call void %31(%struct.jpeg_compress_struct* %32)
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 53
  %36 = load %struct.jpeg_c_prep_controller*, %struct.jpeg_c_prep_controller** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_c_prep_controller, %struct.jpeg_c_prep_controller* %36, i32 0, i32 0
  %38 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %37, align 8
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %40 = ptrtoint void (%struct.jpeg_compress_struct*, i32)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %40, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 2)
  call void %38(%struct.jpeg_compress_struct* %39, i32 0)
  br label %41

; <label>:41:                                     ; preds = %18, %11
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %42, i32 0, i32 58
  %44 = load %struct.jpeg_forward_dct*, %struct.jpeg_forward_dct** %43, align 8
  %45 = getelementptr inbounds %struct.jpeg_forward_dct, %struct.jpeg_forward_dct* %44, i32 0, i32 0
  %46 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %45, align 8
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %48 = ptrtoint void (%struct.jpeg_compress_struct*)* %46 to i64
  call void @__llvm_profile_instrument_target(i64 %48, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 3)
  call void %46(%struct.jpeg_compress_struct* %47)
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 59
  %51 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %51, i32 0, i32 0
  %53 = bitcast {}** %52 to void (%struct.jpeg_compress_struct*, i32)**
  %54 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %53, align 8
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 25
  %58 = load i32, i32* %57, align 8
  %59 = ptrtoint void (%struct.jpeg_compress_struct*, i32)* %54 to i64
  call void @__llvm_profile_instrument_target(i64 %59, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 4)
  call void %54(%struct.jpeg_compress_struct* %55, i32 %58)
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i32 0, i32 54
  %62 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %61, align 8
  %63 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %62, i32 0, i32 0
  %64 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %63, align 8
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %66 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %67 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %66, i32 0, i32 3
  %68 = load i32, i32* %67, align 8
  %69 = icmp sgt i32 %68, 1
  %70 = zext i1 %69 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 12)
  %71 = add i64 %pgocount1, %70
  store i64 %71, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 12)
  %72 = select i1 %69, i32 3, i32 0
  %73 = ptrtoint void (%struct.jpeg_compress_struct*, i32)* %64 to i64
  call void @__llvm_profile_instrument_target(i64 %73, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 5)
  call void %64(%struct.jpeg_compress_struct* %65, i32 %72)
  %74 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %75 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %74, i32 0, i32 52
  %76 = load %struct.jpeg_c_main_controller*, %struct.jpeg_c_main_controller** %75, align 8
  %77 = getelementptr inbounds %struct.jpeg_c_main_controller, %struct.jpeg_c_main_controller* %76, i32 0, i32 0
  %78 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %77, align 8
  %79 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %80 = ptrtoint void (%struct.jpeg_compress_struct*, i32)* %78 to i64
  call void @__llvm_profile_instrument_target(i64 %80, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 6)
  call void %78(%struct.jpeg_compress_struct* %79, i32 0)
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %81, i32 0, i32 25
  %83 = load i32, i32* %82, align 8
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %90

; <label>:85:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 4)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 4)
  %87 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %88 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %87, i32 0, i32 0
  %89 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %88, i32 0, i32 3
  store i32 0, i32* %89, align 8
  br label %95

; <label>:90:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 8)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 8)
  %92 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %93 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %92, i32 0, i32 0
  %94 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %93, i32 0, i32 3
  store i32 1, i32* %94, align 8
  br label %95

; <label>:95:                                     ; preds = %90, %85
  br label %207

; <label>:96:                                     ; preds = %1
  %97 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @select_scan_parameters(%struct.jpeg_compress_struct* %97)
  %98 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @per_scan_setup(%struct.jpeg_compress_struct* %98)
  %99 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %100 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %99, i32 0, i32 47
  %101 = load i32, i32* %100, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %115, label %103

; <label>:103:                                    ; preds = %96
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 9)
  %104 = add i64 %pgocount4, 1
  store i64 %104, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 9)
  %105 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %106 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %105, i32 0, i32 49
  %107 = load i32, i32* %106, align 4
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %115, label %109

; <label>:109:                                    ; preds = %103
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 10)
  %110 = add i64 %pgocount5, 1
  store i64 %110, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 10)
  %111 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %111, i32 0, i32 24
  %113 = load i32, i32* %112, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %135

; <label>:115:                                    ; preds = %109, %103, %96
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 3)
  %116 = add i64 %pgocount6, 1
  store i64 %116, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 3)
  %117 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %118 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %117, i32 0, i32 59
  %119 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %118, align 8
  %120 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %119, i32 0, i32 0
  %121 = bitcast {}** %120 to void (%struct.jpeg_compress_struct*, i32)**
  %122 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %121, align 8
  %123 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %124 = ptrtoint void (%struct.jpeg_compress_struct*, i32)* %122 to i64
  call void @__llvm_profile_instrument_target(i64 %124, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 7)
  call void %122(%struct.jpeg_compress_struct* %123, i32 1)
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %126 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %125, i32 0, i32 54
  %127 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %127, i32 0, i32 0
  %129 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %128, align 8
  %130 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %131 = ptrtoint void (%struct.jpeg_compress_struct*, i32)* %129 to i64
  call void @__llvm_profile_instrument_target(i64 %131, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 8)
  call void %129(%struct.jpeg_compress_struct* %130, i32 2)
  %132 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %133 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %132, i32 0, i32 0
  %134 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %133, i32 0, i32 3
  store i32 0, i32* %134, align 8
  br label %207

; <label>:135:                                    ; preds = %109
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 11)
  %136 = add i64 %pgocount7, 1
  store i64 %136, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 11)
  %137 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %138 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %137, i32 0, i32 1
  store i32 2, i32* %138, align 8
  %139 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %140 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %139, i32 0, i32 2
  %141 = load i32, i32* %140, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %140, align 4
  br label %143

; <label>:143:                                    ; preds = %135, %1
  %144 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %145 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %144, i32 0, i32 25
  %146 = load i32, i32* %145, align 8
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %152, label %148

; <label>:148:                                    ; preds = %143
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 5)
  %149 = add i64 %pgocount8, 1
  store i64 %149, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 5)
  %150 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @select_scan_parameters(%struct.jpeg_compress_struct* %150)
  %151 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @per_scan_setup(%struct.jpeg_compress_struct* %151)
  br label %152

; <label>:152:                                    ; preds = %148, %143
  %153 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %154 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %153, i32 0, i32 59
  %155 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %154, align 8
  %156 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %155, i32 0, i32 0
  %157 = bitcast {}** %156 to void (%struct.jpeg_compress_struct*, i32)**
  %158 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %157, align 8
  %159 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %160 = ptrtoint void (%struct.jpeg_compress_struct*, i32)* %158 to i64
  call void @__llvm_profile_instrument_target(i64 %160, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 9)
  call void %158(%struct.jpeg_compress_struct* %159, i32 0)
  %161 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %162 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %161, i32 0, i32 54
  %163 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %162, align 8
  %164 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %163, i32 0, i32 0
  %165 = load void (%struct.jpeg_compress_struct*, i32)*, void (%struct.jpeg_compress_struct*, i32)** %164, align 8
  %166 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %167 = ptrtoint void (%struct.jpeg_compress_struct*, i32)* %165 to i64
  call void @__llvm_profile_instrument_target(i64 %167, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 10)
  call void %165(%struct.jpeg_compress_struct* %166, i32 2)
  %168 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %169 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %168, i32 0, i32 4
  %170 = load i32, i32* %169, align 4
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %181

; <label>:172:                                    ; preds = %152
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 6)
  %173 = add i64 %pgocount9, 1
  store i64 %173, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 6)
  %174 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %175 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %174, i32 0, i32 55
  %176 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %175, align 8
  %177 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %176, i32 0, i32 2
  %178 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %177, align 8
  %179 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %180 = ptrtoint void (%struct.jpeg_compress_struct*)* %178 to i64
  call void @__llvm_profile_instrument_target(i64 %180, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 11)
  call void %178(%struct.jpeg_compress_struct* %179)
  br label %181

; <label>:181:                                    ; preds = %172, %152
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 1)
  %182 = add i64 %pgocount10, 1
  store i64 %182, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 1)
  %183 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %184 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %183, i32 0, i32 55
  %185 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %184, align 8
  %186 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %185, i32 0, i32 3
  %187 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %186, align 8
  %188 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %189 = ptrtoint void (%struct.jpeg_compress_struct*)* %187 to i64
  call void @__llvm_profile_instrument_target(i64 %189, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 12)
  call void %187(%struct.jpeg_compress_struct* %188)
  %190 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %191 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %190, i32 0, i32 0
  %192 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %191, i32 0, i32 3
  store i32 0, i32* %192, align 8
  br label %207

; <label>:193:                                    ; preds = %1
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 2)
  %194 = add i64 %pgocount11, 1
  store i64 %194, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 2)
  %195 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %196 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %195, i32 0, i32 0
  %197 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %196, align 8
  %198 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %197, i32 0, i32 5
  store i32 47, i32* %198, align 8
  %199 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %200 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %199, i32 0, i32 0
  %201 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %200, align 8
  %202 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %201, i32 0, i32 0
  %203 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %202, align 8
  %204 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %205 = bitcast %struct.jpeg_compress_struct* %204 to %struct.jpeg_common_struct*
  %206 = ptrtoint void (%struct.jpeg_common_struct*)* %203 to i64
  call void @__llvm_profile_instrument_target(i64 %206, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_prepare_for_pass to i8*), i32 13)
  call void %203(%struct.jpeg_common_struct* %205)
  br label %207

; <label>:207:                                    ; preds = %193, %181, %115, %95
  %208 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %209 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %208, i32 0, i32 2
  %210 = load i32, i32* %209, align 4
  %211 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %212 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %211, i32 0, i32 3
  %213 = load i32, i32* %212, align 8
  %214 = sub nsw i32 %213, 1
  %215 = icmp eq i32 %210, %214
  %216 = zext i1 %215 to i32
  %217 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %218 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %217, i32 0, i32 0
  %219 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %218, i32 0, i32 4
  store i32 %216, i32* %219, align 4
  %220 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %221 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %220, i32 0, i32 2
  %222 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %221, align 8
  %223 = icmp ne %struct.jpeg_progress_mgr* %222, null
  br i1 %223, label %224, label %240

; <label>:224:                                    ; preds = %207
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 0)
  %225 = add i64 %pgocount12, 1
  store i64 %225, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_prepare_for_pass, i64 0, i64 0)
  %226 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %227 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %226, i32 0, i32 2
  %228 = load i32, i32* %227, align 4
  %229 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %230 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %229, i32 0, i32 2
  %231 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %230, align 8
  %232 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %231, i32 0, i32 3
  store i32 %228, i32* %232, align 8
  %233 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %234 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %233, i32 0, i32 3
  %235 = load i32, i32* %234, align 8
  %236 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %237 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %236, i32 0, i32 2
  %238 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %237, align 8
  %239 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %238, i32 0, i32 4
  store i32 %235, i32* %239, align 4
  br label %240

; <label>:240:                                    ; preds = %224, %207
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @pass_startup(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_pass_startup, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_pass_startup, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 51
  %6 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %6, i32 0, i32 3
  store i32 0, i32* %7, align 8
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %8, i32 0, i32 55
  %10 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %10, i32 0, i32 2
  %12 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %11, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %14 = ptrtoint void (%struct.jpeg_compress_struct*)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %14, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pass_startup to i8*), i32 0)
  call void %12(%struct.jpeg_compress_struct* %13)
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 55
  %17 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %17, i32 0, i32 3
  %19 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %18, align 8
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %21 = ptrtoint void (%struct.jpeg_compress_struct*)* %19 to i64
  call void @__llvm_profile_instrument_target(i64 %21, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pass_startup to i8*), i32 1)
  call void %19(%struct.jpeg_compress_struct* %20)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @finish_pass_master(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.my_comp_master*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 51
  %6 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %5, align 8
  %7 = bitcast %struct.jpeg_comp_master* %6 to %struct.my_comp_master*
  store %struct.my_comp_master* %7, %struct.my_comp_master** %3, align 8
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %8, i32 0, i32 59
  %10 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %9, align 8
  %11 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %10, i32 0, i32 2
  %12 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %11, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %14 = ptrtoint void (%struct.jpeg_compress_struct*)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %14, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass_master to i8*), i32 0)
  call void %12(%struct.jpeg_compress_struct* %13)
  %15 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %16 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %15, i32 0, i32 1
  %17 = load i32, i32* %16, align 8
  switch i32 %17, label %52 [
    i32 0, label %18
    i32 1, label %33
    i32 2, label %37
  ]

; <label>:18:                                     ; preds = %1
  %19 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %20 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %19, i32 0, i32 1
  store i32 2, i32* %20, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 25
  %23 = load i32, i32* %22, align 8
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %31, label %25

; <label>:25:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 5)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 5)
  %27 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %28 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %27, i32 0, i32 4
  %29 = load i32, i32* %28, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %28, align 4
  br label %31

; <label>:31:                                     ; preds = %25, %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 1)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 1)
  br label %52

; <label>:33:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 2)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 2)
  %35 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %36 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %35, i32 0, i32 1
  store i32 2, i32* %36, align 8
  br label %52

; <label>:37:                                     ; preds = %1
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 25
  %40 = load i32, i32* %39, align 8
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %46

; <label>:42:                                     ; preds = %37
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 4)
  %43 = add i64 %pgocount3, 1
  store i64 %43, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 4)
  %44 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %45 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %44, i32 0, i32 1
  store i32 1, i32* %45, align 8
  br label %46

; <label>:46:                                     ; preds = %42, %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 3)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 3)
  %48 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %49 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %48, i32 0, i32 4
  %50 = load i32, i32* %49, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %49, align 4
  br label %52

; <label>:52:                                     ; preds = %46, %33, %31, %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 0)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_master, i64 0, i64 0)
  %54 = load %struct.my_comp_master*, %struct.my_comp_master** %3, align 8
  %55 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %54, i32 0, i32 2
  %56 = load i32, i32* %55, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %55, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @initial_setup(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_component_info*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %7, i32 0, i32 7
  %9 = load i32, i32* %8, align 4
  %10 = icmp ule i32 %9, 0
  br i1 %10, label %29, label %11

; <label>:11:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 11)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 11)
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 6
  %15 = load i32, i32* %14, align 8
  %16 = icmp ule i32 %15, 0
  br i1 %16, label %29, label %17

; <label>:17:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 16)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 16)
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 12
  %21 = load i32, i32* %20, align 4
  %22 = icmp sle i32 %21, 0
  br i1 %22, label %29, label %23

; <label>:23:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 17)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 17)
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 8
  %27 = load i32, i32* %26, align 8
  %28 = icmp sle i32 %27, 0
  br i1 %28, label %29, label %43

; <label>:29:                                     ; preds = %23, %17, %11, %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 9)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 9)
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %31, i32 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i32 0, i32 5
  store i32 31, i32* %34, align 8
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 0
  %39 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %38, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %41 = bitcast %struct.jpeg_compress_struct* %40 to %struct.jpeg_common_struct*
  %42 = ptrtoint void (%struct.jpeg_common_struct*)* %39 to i64
  call void @__llvm_profile_instrument_target(i64 %42, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 0)
  call void %39(%struct.jpeg_common_struct* %41)
  br label %43

; <label>:43:                                     ; preds = %29, %23
  %44 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %45 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %44, i32 0, i32 7
  %46 = load i32, i32* %45, align 4
  %47 = zext i32 %46 to i64
  %48 = icmp sgt i64 %47, 65500
  br i1 %48, label %56, label %49

; <label>:49:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 12)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 12)
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %51, i32 0, i32 6
  %53 = load i32, i32* %52, align 8
  %54 = zext i32 %53 to i64
  %55 = icmp sgt i64 %54, 65500
  br i1 %55, label %56, label %76

; <label>:56:                                     ; preds = %49, %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 10)
  %57 = add i64 %pgocount5, 1
  store i64 %57, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 10)
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %59 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %58, i32 0, i32 0
  %60 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %59, align 8
  %61 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %60, i32 0, i32 5
  store i32 40, i32* %61, align 8
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %62, i32 0, i32 0
  %64 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %64, i32 0, i32 6
  %66 = bitcast %union.anon* %65 to [8 x i32]*
  %67 = getelementptr inbounds [8 x i32], [8 x i32]* %66, i64 0, i64 0
  store i32 65500, i32* %67, align 4
  %68 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %68, i32 0, i32 0
  %70 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %69, align 8
  %71 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %70, i32 0, i32 0
  %72 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %71, align 8
  %73 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %74 = bitcast %struct.jpeg_compress_struct* %73 to %struct.jpeg_common_struct*
  %75 = ptrtoint void (%struct.jpeg_common_struct*)* %72 to i64
  call void @__llvm_profile_instrument_target(i64 %75, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 1)
  call void %72(%struct.jpeg_common_struct* %74)
  br label %76

; <label>:76:                                     ; preds = %56, %49
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %77, i32 0, i32 6
  %79 = load i32, i32* %78, align 8
  %80 = zext i32 %79 to i64
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %81, i32 0, i32 8
  %83 = load i32, i32* %82, align 8
  %84 = sext i32 %83 to i64
  %85 = mul nsw i64 %80, %84
  store i64 %85, i64* %5, align 8
  %86 = load i64, i64* %5, align 8
  %87 = trunc i64 %86 to i32
  store i32 %87, i32* %6, align 4
  %88 = load i32, i32* %6, align 4
  %89 = zext i32 %88 to i64
  %90 = load i64, i64* %5, align 8
  %91 = icmp ne i64 %89, %90
  br i1 %91, label %92, label %106

; <label>:92:                                     ; preds = %76
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 13)
  %93 = add i64 %pgocount6, 1
  store i64 %93, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 13)
  %94 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %95 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %94, i32 0, i32 0
  %96 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %95, align 8
  %97 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %96, i32 0, i32 5
  store i32 69, i32* %97, align 8
  %98 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %99 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %98, i32 0, i32 0
  %100 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %101 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %100, i32 0, i32 0
  %102 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %101, align 8
  %103 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %104 = bitcast %struct.jpeg_compress_struct* %103 to %struct.jpeg_common_struct*
  %105 = ptrtoint void (%struct.jpeg_common_struct*)* %102 to i64
  call void @__llvm_profile_instrument_target(i64 %105, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 2)
  call void %102(%struct.jpeg_common_struct* %104)
  br label %106

; <label>:106:                                    ; preds = %92, %76
  %107 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %108 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %107, i32 0, i32 11
  %109 = load i32, i32* %108, align 8
  %110 = icmp ne i32 %109, 8
  br i1 %110, label %111, label %134

; <label>:111:                                    ; preds = %106
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 14)
  %112 = add i64 %pgocount7, 1
  store i64 %112, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 14)
  %113 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %114 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %113, i32 0, i32 0
  %115 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %114, align 8
  %116 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %115, i32 0, i32 5
  store i32 13, i32* %116, align 8
  %117 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %118 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %117, i32 0, i32 11
  %119 = load i32, i32* %118, align 8
  %120 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %121 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %120, i32 0, i32 0
  %122 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %121, align 8
  %123 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %122, i32 0, i32 6
  %124 = bitcast %union.anon* %123 to [8 x i32]*
  %125 = getelementptr inbounds [8 x i32], [8 x i32]* %124, i64 0, i64 0
  store i32 %119, i32* %125, align 4
  %126 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %127 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %126, i32 0, i32 0
  %128 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %127, align 8
  %129 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %128, i32 0, i32 0
  %130 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %129, align 8
  %131 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %132 = bitcast %struct.jpeg_compress_struct* %131 to %struct.jpeg_common_struct*
  %133 = ptrtoint void (%struct.jpeg_common_struct*)* %130 to i64
  call void @__llvm_profile_instrument_target(i64 %133, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 3)
  call void %130(%struct.jpeg_common_struct* %132)
  br label %134

; <label>:134:                                    ; preds = %111, %106
  %135 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %136 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %135, i32 0, i32 12
  %137 = load i32, i32* %136, align 4
  %138 = icmp sgt i32 %137, 10
  br i1 %138, label %139, label %168

; <label>:139:                                    ; preds = %134
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 15)
  %140 = add i64 %pgocount8, 1
  store i64 %140, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 15)
  %141 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %142 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %141, i32 0, i32 0
  %143 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %143, i32 0, i32 5
  store i32 24, i32* %144, align 8
  %145 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %146 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %145, i32 0, i32 12
  %147 = load i32, i32* %146, align 4
  %148 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %149 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %148, i32 0, i32 0
  %150 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %149, align 8
  %151 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %150, i32 0, i32 6
  %152 = bitcast %union.anon* %151 to [8 x i32]*
  %153 = getelementptr inbounds [8 x i32], [8 x i32]* %152, i64 0, i64 0
  store i32 %147, i32* %153, align 4
  %154 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %155 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %154, i32 0, i32 0
  %156 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %155, align 8
  %157 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %156, i32 0, i32 6
  %158 = bitcast %union.anon* %157 to [8 x i32]*
  %159 = getelementptr inbounds [8 x i32], [8 x i32]* %158, i64 0, i64 1
  store i32 10, i32* %159, align 4
  %160 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %161 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %160, i32 0, i32 0
  %162 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %161, align 8
  %163 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %162, i32 0, i32 0
  %164 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %163, align 8
  %165 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %166 = bitcast %struct.jpeg_compress_struct* %165 to %struct.jpeg_common_struct*
  %167 = ptrtoint void (%struct.jpeg_common_struct*)* %164 to i64
  call void @__llvm_profile_instrument_target(i64 %167, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 4)
  call void %164(%struct.jpeg_common_struct* %166)
  br label %168

; <label>:168:                                    ; preds = %139, %134
  %169 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %170 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %169, i32 0, i32 38
  store i32 1, i32* %170, align 8
  %171 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %172 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %171, i32 0, i32 39
  store i32 1, i32* %172, align 4
  store i32 0, i32* %3, align 4
  %173 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %174 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %173, i32 0, i32 14
  %175 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %174, align 8
  store %struct.jpeg_component_info* %175, %struct.jpeg_component_info** %4, align 8
  br label %176

; <label>:176:                                    ; preds = %261, %168
  %177 = load i32, i32* %3, align 4
  %178 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %179 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %178, i32 0, i32 12
  %180 = load i32, i32* %179, align 4
  %181 = icmp slt i32 %177, %180
  br i1 %181, label %182, label %266

; <label>:182:                                    ; preds = %176
  %183 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %184 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %183, i32 0, i32 2
  %185 = load i32, i32* %184, align 8
  %186 = icmp sle i32 %185, 0
  br i1 %186, label %205, label %187

; <label>:187:                                    ; preds = %182
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 2)
  %188 = add i64 %pgocount9, 1
  store i64 %188, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 2)
  %189 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %190 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %189, i32 0, i32 2
  %191 = load i32, i32* %190, align 8
  %192 = icmp sgt i32 %191, 4
  br i1 %192, label %205, label %193

; <label>:193:                                    ; preds = %187
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 6)
  %194 = add i64 %pgocount10, 1
  store i64 %194, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 6)
  %195 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %196 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %195, i32 0, i32 3
  %197 = load i32, i32* %196, align 4
  %198 = icmp sle i32 %197, 0
  br i1 %198, label %205, label %199

; <label>:199:                                    ; preds = %193
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 7)
  %200 = add i64 %pgocount11, 1
  store i64 %200, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 7)
  %201 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %202 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %201, i32 0, i32 3
  %203 = load i32, i32* %202, align 4
  %204 = icmp sgt i32 %203, 4
  br i1 %204, label %205, label %219

; <label>:205:                                    ; preds = %199, %193, %187, %182
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 1)
  %206 = add i64 %pgocount12, 1
  store i64 %206, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 1)
  %207 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %208 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %207, i32 0, i32 0
  %209 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %208, align 8
  %210 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %209, i32 0, i32 5
  store i32 16, i32* %210, align 8
  %211 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %212 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %211, i32 0, i32 0
  %213 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %212, align 8
  %214 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %213, i32 0, i32 0
  %215 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %214, align 8
  %216 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %217 = bitcast %struct.jpeg_compress_struct* %216 to %struct.jpeg_common_struct*
  %218 = ptrtoint void (%struct.jpeg_common_struct*)* %215 to i64
  call void @__llvm_profile_instrument_target(i64 %218, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_initial_setup to i8*), i32 5)
  call void %215(%struct.jpeg_common_struct* %217)
  br label %219

; <label>:219:                                    ; preds = %205, %199
  %220 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %221 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %220, i32 0, i32 38
  %222 = load i32, i32* %221, align 8
  %223 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %224 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %223, i32 0, i32 2
  %225 = load i32, i32* %224, align 8
  %226 = icmp sgt i32 %222, %225
  br i1 %226, label %227, label %231

; <label>:227:                                    ; preds = %219
  %228 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %229 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %228, i32 0, i32 38
  %230 = load i32, i32* %229, align 8
  br label %236

; <label>:231:                                    ; preds = %219
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 3)
  %232 = add i64 %pgocount13, 1
  store i64 %232, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 3)
  %233 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %234 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %233, i32 0, i32 2
  %235 = load i32, i32* %234, align 8
  br label %236

; <label>:236:                                    ; preds = %231, %227
  %237 = phi i32 [ %230, %227 ], [ %235, %231 ]
  %238 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %239 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %238, i32 0, i32 38
  store i32 %237, i32* %239, align 8
  %240 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %241 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %240, i32 0, i32 39
  %242 = load i32, i32* %241, align 4
  %243 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %244 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %243, i32 0, i32 3
  %245 = load i32, i32* %244, align 4
  %246 = icmp sgt i32 %242, %245
  br i1 %246, label %247, label %252

; <label>:247:                                    ; preds = %236
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 4)
  %248 = add i64 %pgocount14, 1
  store i64 %248, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 4)
  %249 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %250 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %249, i32 0, i32 39
  %251 = load i32, i32* %250, align 4
  br label %257

; <label>:252:                                    ; preds = %236
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 5)
  %253 = add i64 %pgocount15, 1
  store i64 %253, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 5)
  %254 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %255 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %254, i32 0, i32 3
  %256 = load i32, i32* %255, align 4
  br label %257

; <label>:257:                                    ; preds = %252, %247
  %258 = phi i32 [ %251, %247 ], [ %256, %252 ]
  %259 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %260 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %259, i32 0, i32 39
  store i32 %258, i32* %260, align 4
  br label %261

; <label>:261:                                    ; preds = %257
  %262 = load i32, i32* %3, align 4
  %263 = add nsw i32 %262, 1
  store i32 %263, i32* %3, align 4
  %264 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %265 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %264, i32 1
  store %struct.jpeg_component_info* %265, %struct.jpeg_component_info** %4, align 8
  br label %176

; <label>:266:                                    ; preds = %176
  store i32 0, i32* %3, align 4
  %267 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %268 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %267, i32 0, i32 14
  %269 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %268, align 8
  store %struct.jpeg_component_info* %269, %struct.jpeg_component_info** %4, align 8
  br label %270

; <label>:270:                                    ; preds = %354, %266
  %271 = load i32, i32* %3, align 4
  %272 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %273 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %272, i32 0, i32 12
  %274 = load i32, i32* %273, align 4
  %275 = icmp slt i32 %271, %274
  br i1 %275, label %276, label %360

; <label>:276:                                    ; preds = %270
  %277 = load i32, i32* %3, align 4
  %278 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %279 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %278, i32 0, i32 1
  store i32 %277, i32* %279, align 4
  %280 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %281 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %280, i32 0, i32 9
  store i32 8, i32* %281, align 4
  %282 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %283 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %282, i32 0, i32 6
  %284 = load i32, i32* %283, align 8
  %285 = zext i32 %284 to i64
  %286 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %287 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %286, i32 0, i32 2
  %288 = load i32, i32* %287, align 8
  %289 = sext i32 %288 to i64
  %290 = mul nsw i64 %285, %289
  %291 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %292 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %291, i32 0, i32 38
  %293 = load i32, i32* %292, align 8
  %294 = mul nsw i32 %293, 8
  %295 = sext i32 %294 to i64
  %296 = call i64 @jdiv_round_up(i64 %290, i64 %295)
  %297 = trunc i64 %296 to i32
  %298 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %299 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %298, i32 0, i32 7
  store i32 %297, i32* %299, align 4
  %300 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %301 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %300, i32 0, i32 7
  %302 = load i32, i32* %301, align 4
  %303 = zext i32 %302 to i64
  %304 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %305 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %304, i32 0, i32 3
  %306 = load i32, i32* %305, align 4
  %307 = sext i32 %306 to i64
  %308 = mul nsw i64 %303, %307
  %309 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %310 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %309, i32 0, i32 39
  %311 = load i32, i32* %310, align 4
  %312 = mul nsw i32 %311, 8
  %313 = sext i32 %312 to i64
  %314 = call i64 @jdiv_round_up(i64 %308, i64 %313)
  %315 = trunc i64 %314 to i32
  %316 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %317 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %316, i32 0, i32 8
  store i32 %315, i32* %317, align 8
  %318 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %319 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %318, i32 0, i32 6
  %320 = load i32, i32* %319, align 8
  %321 = zext i32 %320 to i64
  %322 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %323 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %322, i32 0, i32 2
  %324 = load i32, i32* %323, align 8
  %325 = sext i32 %324 to i64
  %326 = mul nsw i64 %321, %325
  %327 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %328 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %327, i32 0, i32 38
  %329 = load i32, i32* %328, align 8
  %330 = sext i32 %329 to i64
  %331 = call i64 @jdiv_round_up(i64 %326, i64 %330)
  %332 = trunc i64 %331 to i32
  %333 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %334 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %333, i32 0, i32 10
  store i32 %332, i32* %334, align 8
  %335 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %336 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %335, i32 0, i32 7
  %337 = load i32, i32* %336, align 4
  %338 = zext i32 %337 to i64
  %339 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %340 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %339, i32 0, i32 3
  %341 = load i32, i32* %340, align 4
  %342 = sext i32 %341 to i64
  %343 = mul nsw i64 %338, %342
  %344 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %345 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %344, i32 0, i32 39
  %346 = load i32, i32* %345, align 4
  %347 = sext i32 %346 to i64
  %348 = call i64 @jdiv_round_up(i64 %343, i64 %347)
  %349 = trunc i64 %348 to i32
  %350 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %351 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %350, i32 0, i32 11
  store i32 %349, i32* %351, align 4
  %352 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %353 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %352, i32 0, i32 12
  store i32 1, i32* %353, align 8
  br label %354

; <label>:354:                                    ; preds = %276
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 0)
  %355 = add i64 %pgocount16, 1
  store i64 %355, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 0)
  %356 = load i32, i32* %3, align 4
  %357 = add nsw i32 %356, 1
  store i32 %357, i32* %3, align 4
  %358 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %359 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %358, i32 1
  store %struct.jpeg_component_info* %359, %struct.jpeg_component_info** %4, align 8
  br label %270

; <label>:360:                                    ; preds = %270
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 8)
  %361 = add i64 %pgocount17, 1
  store i64 %361, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_initial_setup, i64 0, i64 8)
  %362 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %363 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %362, i32 0, i32 7
  %364 = load i32, i32* %363, align 4
  %365 = zext i32 %364 to i64
  %366 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %367 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %366, i32 0, i32 39
  %368 = load i32, i32* %367, align 4
  %369 = mul nsw i32 %368, 8
  %370 = sext i32 %369 to i64
  %371 = call i64 @jdiv_round_up(i64 %365, i64 %370)
  %372 = trunc i64 %371 to i32
  %373 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %374 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %373, i32 0, i32 40
  store i32 %372, i32* %374, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @validate_script(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.jpeg_scan_info*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [10 x i32], align 16
  %14 = alloca i32*, align 8
  %15 = alloca [10 x [64 x i32]], align 16
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 21
  %18 = load i32, i32* %17, align 8
  %19 = icmp sle i32 %18, 0
  br i1 %19, label %20, label %40

; <label>:20:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 40)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 40)
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 5
  store i32 17, i32* %25, align 8
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 6
  %30 = bitcast %union.anon* %29 to [8 x i32]*
  %31 = getelementptr inbounds [8 x i32], [8 x i32]* %30, i64 0, i64 0
  store i32 0, i32* %31, align 4
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 0
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %38 = bitcast %struct.jpeg_compress_struct* %37 to %struct.jpeg_common_struct*
  %39 = ptrtoint void (%struct.jpeg_common_struct*)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 0)
  call void %36(%struct.jpeg_common_struct* %38)
  br label %40

; <label>:40:                                     ; preds = %20, %1
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %41, i32 0, i32 22
  %43 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %42, align 8
  store %struct.jpeg_scan_info* %43, %struct.jpeg_scan_info** %3, align 8
  %44 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %45 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %44, i32 0, i32 2
  %46 = load i32, i32* %45, align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %54, label %48

; <label>:48:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 42)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 42)
  %50 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %51 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %50, i32 0, i32 3
  %52 = load i32, i32* %51, align 4
  %53 = icmp ne i32 %52, 63
  br i1 %53, label %54, label %82

; <label>:54:                                     ; preds = %48, %40
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 37
  store i32 1, i32* %56, align 4
  %57 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %15, i64 0, i64 0
  %58 = getelementptr inbounds [64 x i32], [64 x i32]* %57, i64 0, i64 0
  store i32* %58, i32** %14, align 8
  store i32 0, i32* %6, align 4
  br label %59

; <label>:59:                                     ; preds = %77, %54
  %60 = load i32, i32* %6, align 4
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %61, i32 0, i32 12
  %63 = load i32, i32* %62, align 4
  %64 = icmp slt i32 %60, %63
  br i1 %64, label %65, label %81

; <label>:65:                                     ; preds = %59
  store i32 0, i32* %7, align 4
  br label %66

; <label>:66:                                     ; preds = %72, %65
  %67 = load i32, i32* %7, align 4
  %68 = icmp slt i32 %67, 64
  br i1 %68, label %69, label %76

; <label>:69:                                     ; preds = %66
  %70 = load i32*, i32** %14, align 8
  %71 = getelementptr inbounds i32, i32* %70, i32 1
  store i32* %71, i32** %14, align 8
  store i32 -1, i32* %70, align 4
  br label %72

; <label>:72:                                     ; preds = %69
  %pgocount2 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 6)
  %73 = add i64 %pgocount2, 1
  store i64 %73, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 6)
  %74 = load i32, i32* %7, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %7, align 4
  br label %66

; <label>:76:                                     ; preds = %66
  br label %77

; <label>:77:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 16)
  %78 = add i64 %pgocount3, 1
  store i64 %78, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 16)
  %79 = load i32, i32* %6, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %6, align 4
  br label %59

; <label>:81:                                     ; preds = %59
  br label %101

; <label>:82:                                     ; preds = %48
  %83 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %84 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %83, i32 0, i32 37
  store i32 0, i32* %84, align 4
  store i32 0, i32* %6, align 4
  br label %85

; <label>:85:                                     ; preds = %95, %82
  %86 = load i32, i32* %6, align 4
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %87, i32 0, i32 12
  %89 = load i32, i32* %88, align 4
  %90 = icmp slt i32 %86, %89
  br i1 %90, label %91, label %99

; <label>:91:                                     ; preds = %85
  %92 = load i32, i32* %6, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [10 x i32], [10 x i32]* %13, i64 0, i64 %93
  store i32 0, i32* %94, align 4
  br label %95

; <label>:95:                                     ; preds = %91
  %pgocount4 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 30)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 30)
  %97 = load i32, i32* %6, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %6, align 4
  br label %85

; <label>:99:                                     ; preds = %85
  %pgocount5 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 45)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 45)
  br label %101

; <label>:101:                                    ; preds = %99, %81
  store i32 1, i32* %4, align 4
  br label %102

; <label>:102:                                    ; preds = %572, %101
  %103 = load i32, i32* %4, align 4
  %104 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %104, i32 0, i32 21
  %106 = load i32, i32* %105, align 8
  %107 = icmp sle i32 %103, %106
  br i1 %107, label %108, label %577

; <label>:108:                                    ; preds = %102
  %109 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %110 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %109, i32 0, i32 0
  %111 = load i32, i32* %110, align 4
  store i32 %111, i32* %5, align 4
  %112 = load i32, i32* %5, align 4
  %113 = icmp sle i32 %112, 0
  br i1 %113, label %118, label %114

; <label>:114:                                    ; preds = %108
  %pgocount6 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 20)
  %115 = add i64 %pgocount6, 1
  store i64 %115, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 20)
  %116 = load i32, i32* %5, align 4
  %117 = icmp sgt i32 %116, 4
  br i1 %117, label %118, label %145

; <label>:118:                                    ; preds = %114, %108
  %pgocount7 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 17)
  %119 = add i64 %pgocount7, 1
  store i64 %119, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 17)
  %120 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %121 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %120, i32 0, i32 0
  %122 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %121, align 8
  %123 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %122, i32 0, i32 5
  store i32 24, i32* %123, align 8
  %124 = load i32, i32* %5, align 4
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %126 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %125, i32 0, i32 0
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i32 0, i32 6
  %129 = bitcast %union.anon* %128 to [8 x i32]*
  %130 = getelementptr inbounds [8 x i32], [8 x i32]* %129, i64 0, i64 0
  store i32 %124, i32* %130, align 4
  %131 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %132 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %131, i32 0, i32 0
  %133 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %132, align 8
  %134 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %133, i32 0, i32 6
  %135 = bitcast %union.anon* %134 to [8 x i32]*
  %136 = getelementptr inbounds [8 x i32], [8 x i32]* %135, i64 0, i64 1
  store i32 4, i32* %136, align 4
  %137 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %138 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %137, i32 0, i32 0
  %139 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %138, align 8
  %140 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %139, i32 0, i32 0
  %141 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %140, align 8
  %142 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %143 = bitcast %struct.jpeg_compress_struct* %142 to %struct.jpeg_common_struct*
  %144 = ptrtoint void (%struct.jpeg_common_struct*)* %141 to i64
  call void @__llvm_profile_instrument_target(i64 %144, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 1)
  call void %141(%struct.jpeg_common_struct* %143)
  br label %145

; <label>:145:                                    ; preds = %118, %114
  store i32 0, i32* %6, align 4
  br label %146

; <label>:146:                                    ; preds = %223, %145
  %147 = load i32, i32* %6, align 4
  %148 = load i32, i32* %5, align 4
  %149 = icmp slt i32 %147, %148
  br i1 %149, label %150, label %227

; <label>:150:                                    ; preds = %146
  %151 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %152 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %151, i32 0, i32 1
  %153 = load i32, i32* %6, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [4 x i32], [4 x i32]* %152, i64 0, i64 %154
  %156 = load i32, i32* %155, align 4
  store i32 %156, i32* %8, align 4
  %157 = load i32, i32* %8, align 4
  %158 = icmp slt i32 %157, 0
  br i1 %158, label %166, label %159

; <label>:159:                                    ; preds = %150
  %pgocount8 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 8)
  %160 = add i64 %pgocount8, 1
  store i64 %160, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 8)
  %161 = load i32, i32* %8, align 4
  %162 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %163 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %162, i32 0, i32 12
  %164 = load i32, i32* %163, align 4
  %165 = icmp sge i32 %161, %164
  br i1 %165, label %166, label %187

; <label>:166:                                    ; preds = %159, %150
  %pgocount9 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 7)
  %167 = add i64 %pgocount9, 1
  store i64 %167, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 7)
  %168 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %169 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %168, i32 0, i32 0
  %170 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %169, align 8
  %171 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %170, i32 0, i32 5
  store i32 17, i32* %171, align 8
  %172 = load i32, i32* %4, align 4
  %173 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %174 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %173, i32 0, i32 0
  %175 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %174, align 8
  %176 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %175, i32 0, i32 6
  %177 = bitcast %union.anon* %176 to [8 x i32]*
  %178 = getelementptr inbounds [8 x i32], [8 x i32]* %177, i64 0, i64 0
  store i32 %172, i32* %178, align 4
  %179 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %180 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %179, i32 0, i32 0
  %181 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %180, align 8
  %182 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %181, i32 0, i32 0
  %183 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %182, align 8
  %184 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %185 = bitcast %struct.jpeg_compress_struct* %184 to %struct.jpeg_common_struct*
  %186 = ptrtoint void (%struct.jpeg_common_struct*)* %183 to i64
  call void @__llvm_profile_instrument_target(i64 %186, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 2)
  call void %183(%struct.jpeg_common_struct* %185)
  br label %187

; <label>:187:                                    ; preds = %166, %159
  %188 = load i32, i32* %6, align 4
  %189 = icmp sgt i32 %188, 0
  br i1 %189, label %190, label %222

; <label>:190:                                    ; preds = %187
  %pgocount10 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 9)
  %191 = add i64 %pgocount10, 1
  store i64 %191, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 9)
  %192 = load i32, i32* %8, align 4
  %193 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %194 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %193, i32 0, i32 1
  %195 = load i32, i32* %6, align 4
  %196 = sub nsw i32 %195, 1
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [4 x i32], [4 x i32]* %194, i64 0, i64 %197
  %199 = load i32, i32* %198, align 4
  %200 = icmp sle i32 %192, %199
  br i1 %200, label %201, label %222

; <label>:201:                                    ; preds = %190
  %pgocount11 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 13)
  %202 = add i64 %pgocount11, 1
  store i64 %202, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 13)
  %203 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %204 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %203, i32 0, i32 0
  %205 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %204, align 8
  %206 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %205, i32 0, i32 5
  store i32 17, i32* %206, align 8
  %207 = load i32, i32* %4, align 4
  %208 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %209 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %208, i32 0, i32 0
  %210 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %209, align 8
  %211 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %210, i32 0, i32 6
  %212 = bitcast %union.anon* %211 to [8 x i32]*
  %213 = getelementptr inbounds [8 x i32], [8 x i32]* %212, i64 0, i64 0
  store i32 %207, i32* %213, align 4
  %214 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %215 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %214, i32 0, i32 0
  %216 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %215, align 8
  %217 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %216, i32 0, i32 0
  %218 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %217, align 8
  %219 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %220 = bitcast %struct.jpeg_compress_struct* %219 to %struct.jpeg_common_struct*
  %221 = ptrtoint void (%struct.jpeg_common_struct*)* %218 to i64
  call void @__llvm_profile_instrument_target(i64 %221, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 3)
  call void %218(%struct.jpeg_common_struct* %220)
  br label %222

; <label>:222:                                    ; preds = %201, %190, %187
  br label %223

; <label>:223:                                    ; preds = %222
  %pgocount12 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 5)
  %224 = add i64 %pgocount12, 1
  store i64 %224, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 5)
  %225 = load i32, i32* %6, align 4
  %226 = add nsw i32 %225, 1
  store i32 %226, i32* %6, align 4
  br label %146

; <label>:227:                                    ; preds = %146
  %228 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %229 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %228, i32 0, i32 2
  %230 = load i32, i32* %229, align 4
  store i32 %230, i32* %9, align 4
  %231 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %232 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %231, i32 0, i32 3
  %233 = load i32, i32* %232, align 4
  store i32 %233, i32* %10, align 4
  %234 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %235 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %234, i32 0, i32 4
  %236 = load i32, i32* %235, align 4
  store i32 %236, i32* %11, align 4
  %237 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %238 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %237, i32 0, i32 5
  %239 = load i32, i32* %238, align 4
  store i32 %239, i32* %12, align 4
  %240 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %241 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %240, i32 0, i32 37
  %242 = load i32, i32* %241, align 4
  %243 = icmp ne i32 %242, 0
  br i1 %243, label %244, label %487

; <label>:244:                                    ; preds = %227
  %245 = load i32, i32* %9, align 4
  %246 = icmp slt i32 %245, 0
  br i1 %246, label %276, label %247

; <label>:247:                                    ; preds = %244
  %pgocount13 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 21)
  %248 = add i64 %pgocount13, 1
  store i64 %248, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 21)
  %249 = load i32, i32* %9, align 4
  %250 = icmp sge i32 %249, 64
  br i1 %250, label %276, label %251

; <label>:251:                                    ; preds = %247
  %pgocount14 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 28)
  %252 = add i64 %pgocount14, 1
  store i64 %252, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 28)
  %253 = load i32, i32* %10, align 4
  %254 = load i32, i32* %9, align 4
  %255 = icmp slt i32 %253, %254
  br i1 %255, label %276, label %256

; <label>:256:                                    ; preds = %251
  %pgocount15 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 34)
  %257 = add i64 %pgocount15, 1
  store i64 %257, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 34)
  %258 = load i32, i32* %10, align 4
  %259 = icmp sge i32 %258, 64
  br i1 %259, label %276, label %260

; <label>:260:                                    ; preds = %256
  %pgocount16 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 36)
  %261 = add i64 %pgocount16, 1
  store i64 %261, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 36)
  %262 = load i32, i32* %11, align 4
  %263 = icmp slt i32 %262, 0
  br i1 %263, label %276, label %264

; <label>:264:                                    ; preds = %260
  %pgocount17 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 37)
  %265 = add i64 %pgocount17, 1
  store i64 %265, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 37)
  %266 = load i32, i32* %11, align 4
  %267 = icmp sgt i32 %266, 13
  br i1 %267, label %276, label %268

; <label>:268:                                    ; preds = %264
  %pgocount18 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 41)
  %269 = add i64 %pgocount18, 1
  store i64 %269, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 41)
  %270 = load i32, i32* %12, align 4
  %271 = icmp slt i32 %270, 0
  br i1 %271, label %276, label %272

; <label>:272:                                    ; preds = %268
  %pgocount19 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 44)
  %273 = add i64 %pgocount19, 1
  store i64 %273, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 44)
  %274 = load i32, i32* %12, align 4
  %275 = icmp sgt i32 %274, 13
  br i1 %275, label %276, label %297

; <label>:276:                                    ; preds = %272, %268, %264, %260, %256, %251, %247, %244
  %pgocount20 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 19)
  %277 = add i64 %pgocount20, 1
  store i64 %277, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 19)
  %278 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %279 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %278, i32 0, i32 0
  %280 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %279, align 8
  %281 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %280, i32 0, i32 5
  store i32 15, i32* %281, align 8
  %282 = load i32, i32* %4, align 4
  %283 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %284 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %283, i32 0, i32 0
  %285 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %284, align 8
  %286 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %285, i32 0, i32 6
  %287 = bitcast %union.anon* %286 to [8 x i32]*
  %288 = getelementptr inbounds [8 x i32], [8 x i32]* %287, i64 0, i64 0
  store i32 %282, i32* %288, align 4
  %289 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %290 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %289, i32 0, i32 0
  %291 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %290, align 8
  %292 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %291, i32 0, i32 0
  %293 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %292, align 8
  %294 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %295 = bitcast %struct.jpeg_compress_struct* %294 to %struct.jpeg_common_struct*
  %296 = ptrtoint void (%struct.jpeg_common_struct*)* %293 to i64
  call void @__llvm_profile_instrument_target(i64 %296, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 4)
  call void %293(%struct.jpeg_common_struct* %295)
  br label %297

; <label>:297:                                    ; preds = %276, %272
  %298 = load i32, i32* %9, align 4
  %299 = icmp eq i32 %298, 0
  br i1 %299, label %300, label %326

; <label>:300:                                    ; preds = %297
  %pgocount21 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 26)
  %301 = add i64 %pgocount21, 1
  store i64 %301, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 26)
  %302 = load i32, i32* %10, align 4
  %303 = icmp ne i32 %302, 0
  br i1 %303, label %304, label %325

; <label>:304:                                    ; preds = %300
  %pgocount22 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 31)
  %305 = add i64 %pgocount22, 1
  store i64 %305, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 31)
  %306 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %307 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %306, i32 0, i32 0
  %308 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %307, align 8
  %309 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %308, i32 0, i32 5
  store i32 15, i32* %309, align 8
  %310 = load i32, i32* %4, align 4
  %311 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %312 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %311, i32 0, i32 0
  %313 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %312, align 8
  %314 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %313, i32 0, i32 6
  %315 = bitcast %union.anon* %314 to [8 x i32]*
  %316 = getelementptr inbounds [8 x i32], [8 x i32]* %315, i64 0, i64 0
  store i32 %310, i32* %316, align 4
  %317 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %318 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %317, i32 0, i32 0
  %319 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %318, align 8
  %320 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %319, i32 0, i32 0
  %321 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %320, align 8
  %322 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %323 = bitcast %struct.jpeg_compress_struct* %322 to %struct.jpeg_common_struct*
  %324 = ptrtoint void (%struct.jpeg_common_struct*)* %321 to i64
  call void @__llvm_profile_instrument_target(i64 %324, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 5)
  call void %321(%struct.jpeg_common_struct* %323)
  br label %325

; <label>:325:                                    ; preds = %304, %300
  br label %352

; <label>:326:                                    ; preds = %297
  %327 = load i32, i32* %5, align 4
  %328 = icmp ne i32 %327, 1
  br i1 %328, label %329, label %350

; <label>:329:                                    ; preds = %326
  %pgocount23 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 29)
  %330 = add i64 %pgocount23, 1
  store i64 %330, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 29)
  %331 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %332 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %331, i32 0, i32 0
  %333 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %332, align 8
  %334 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %333, i32 0, i32 5
  store i32 15, i32* %334, align 8
  %335 = load i32, i32* %4, align 4
  %336 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %337 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %336, i32 0, i32 0
  %338 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %337, align 8
  %339 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %338, i32 0, i32 6
  %340 = bitcast %union.anon* %339 to [8 x i32]*
  %341 = getelementptr inbounds [8 x i32], [8 x i32]* %340, i64 0, i64 0
  store i32 %335, i32* %341, align 4
  %342 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %343 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %342, i32 0, i32 0
  %344 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %343, align 8
  %345 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %344, i32 0, i32 0
  %346 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %345, align 8
  %347 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %348 = bitcast %struct.jpeg_compress_struct* %347 to %struct.jpeg_common_struct*
  %349 = ptrtoint void (%struct.jpeg_common_struct*)* %346 to i64
  call void @__llvm_profile_instrument_target(i64 %349, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 6)
  call void %346(%struct.jpeg_common_struct* %348)
  br label %350

; <label>:350:                                    ; preds = %329, %326
  %pgocount24 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 22)
  %351 = add i64 %pgocount24, 1
  store i64 %351, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 22)
  br label %352

; <label>:352:                                    ; preds = %350, %325
  store i32 0, i32* %6, align 4
  br label %353

; <label>:353:                                    ; preds = %482, %352
  %354 = load i32, i32* %6, align 4
  %355 = load i32, i32* %5, align 4
  %356 = icmp slt i32 %354, %355
  br i1 %356, label %357, label %486

; <label>:357:                                    ; preds = %353
  %358 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %359 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %358, i32 0, i32 1
  %360 = load i32, i32* %6, align 4
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds [4 x i32], [4 x i32]* %359, i64 0, i64 %361
  %363 = load i32, i32* %362, align 4
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %15, i64 0, i64 %364
  %366 = getelementptr inbounds [64 x i32], [64 x i32]* %365, i64 0, i64 0
  store i32* %366, i32** %14, align 8
  %367 = load i32, i32* %9, align 4
  %368 = icmp ne i32 %367, 0
  br i1 %368, label %369, label %396

; <label>:369:                                    ; preds = %357
  %pgocount25 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 11)
  %370 = add i64 %pgocount25, 1
  store i64 %370, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 11)
  %371 = load i32*, i32** %14, align 8
  %372 = getelementptr inbounds i32, i32* %371, i64 0
  %373 = load i32, i32* %372, align 4
  %374 = icmp slt i32 %373, 0
  br i1 %374, label %375, label %396

; <label>:375:                                    ; preds = %369
  %pgocount26 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 15)
  %376 = add i64 %pgocount26, 1
  store i64 %376, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 15)
  %377 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %378 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %377, i32 0, i32 0
  %379 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %378, align 8
  %380 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %379, i32 0, i32 5
  store i32 15, i32* %380, align 8
  %381 = load i32, i32* %4, align 4
  %382 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %383 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %382, i32 0, i32 0
  %384 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %383, align 8
  %385 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %384, i32 0, i32 6
  %386 = bitcast %union.anon* %385 to [8 x i32]*
  %387 = getelementptr inbounds [8 x i32], [8 x i32]* %386, i64 0, i64 0
  store i32 %381, i32* %387, align 4
  %388 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %389 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %388, i32 0, i32 0
  %390 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %389, align 8
  %391 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %390, i32 0, i32 0
  %392 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %391, align 8
  %393 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %394 = bitcast %struct.jpeg_compress_struct* %393 to %struct.jpeg_common_struct*
  %395 = ptrtoint void (%struct.jpeg_common_struct*)* %392 to i64
  call void @__llvm_profile_instrument_target(i64 %395, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 7)
  call void %392(%struct.jpeg_common_struct* %394)
  br label %396

; <label>:396:                                    ; preds = %375, %369, %357
  %397 = load i32, i32* %9, align 4
  store i32 %397, i32* %7, align 4
  br label %398

; <label>:398:                                    ; preds = %478, %396
  %399 = load i32, i32* %7, align 4
  %400 = load i32, i32* %10, align 4
  %401 = icmp sle i32 %399, %400
  br i1 %401, label %402, label %481

; <label>:402:                                    ; preds = %398
  %403 = load i32*, i32** %14, align 8
  %404 = load i32, i32* %7, align 4
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds i32, i32* %403, i64 %405
  %407 = load i32, i32* %406, align 4
  %408 = icmp slt i32 %407, 0
  br i1 %408, label %409, label %435

; <label>:409:                                    ; preds = %402
  %pgocount27 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 2)
  %410 = add i64 %pgocount27, 1
  store i64 %410, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 2)
  %411 = load i32, i32* %11, align 4
  %412 = icmp ne i32 %411, 0
  br i1 %412, label %413, label %434

; <label>:413:                                    ; preds = %409
  %pgocount28 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 4)
  %414 = add i64 %pgocount28, 1
  store i64 %414, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 4)
  %415 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %416 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %415, i32 0, i32 0
  %417 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %416, align 8
  %418 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %417, i32 0, i32 5
  store i32 15, i32* %418, align 8
  %419 = load i32, i32* %4, align 4
  %420 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %421 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %420, i32 0, i32 0
  %422 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %421, align 8
  %423 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %422, i32 0, i32 6
  %424 = bitcast %union.anon* %423 to [8 x i32]*
  %425 = getelementptr inbounds [8 x i32], [8 x i32]* %424, i64 0, i64 0
  store i32 %419, i32* %425, align 4
  %426 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %427 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %426, i32 0, i32 0
  %428 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %427, align 8
  %429 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %428, i32 0, i32 0
  %430 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %429, align 8
  %431 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %432 = bitcast %struct.jpeg_compress_struct* %431 to %struct.jpeg_common_struct*
  %433 = ptrtoint void (%struct.jpeg_common_struct*)* %430 to i64
  call void @__llvm_profile_instrument_target(i64 %433, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 8)
  call void %430(%struct.jpeg_common_struct* %432)
  br label %434

; <label>:434:                                    ; preds = %413, %409
  br label %472

; <label>:435:                                    ; preds = %402
  %436 = load i32, i32* %11, align 4
  %437 = load i32*, i32** %14, align 8
  %438 = load i32, i32* %7, align 4
  %439 = sext i32 %438 to i64
  %440 = getelementptr inbounds i32, i32* %437, i64 %439
  %441 = load i32, i32* %440, align 4
  %442 = icmp ne i32 %436, %441
  br i1 %442, label %449, label %443

; <label>:443:                                    ; preds = %435
  %pgocount29 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 3)
  %444 = add i64 %pgocount29, 1
  store i64 %444, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 3)
  %445 = load i32, i32* %12, align 4
  %446 = load i32, i32* %11, align 4
  %447 = sub nsw i32 %446, 1
  %448 = icmp ne i32 %445, %447
  br i1 %448, label %449, label %470

; <label>:449:                                    ; preds = %443, %435
  %pgocount30 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 1)
  %450 = add i64 %pgocount30, 1
  store i64 %450, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 1)
  %451 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %452 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %451, i32 0, i32 0
  %453 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %452, align 8
  %454 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %453, i32 0, i32 5
  store i32 15, i32* %454, align 8
  %455 = load i32, i32* %4, align 4
  %456 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %457 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %456, i32 0, i32 0
  %458 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %457, align 8
  %459 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %458, i32 0, i32 6
  %460 = bitcast %union.anon* %459 to [8 x i32]*
  %461 = getelementptr inbounds [8 x i32], [8 x i32]* %460, i64 0, i64 0
  store i32 %455, i32* %461, align 4
  %462 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %463 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %462, i32 0, i32 0
  %464 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %463, align 8
  %465 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %464, i32 0, i32 0
  %466 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %465, align 8
  %467 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %468 = bitcast %struct.jpeg_compress_struct* %467 to %struct.jpeg_common_struct*
  %469 = ptrtoint void (%struct.jpeg_common_struct*)* %466 to i64
  call void @__llvm_profile_instrument_target(i64 %469, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 9)
  call void %466(%struct.jpeg_common_struct* %468)
  br label %470

; <label>:470:                                    ; preds = %449, %443
  %pgocount31 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 0)
  %471 = add i64 %pgocount31, 1
  store i64 %471, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 0)
  br label %472

; <label>:472:                                    ; preds = %470, %434
  %473 = load i32, i32* %12, align 4
  %474 = load i32*, i32** %14, align 8
  %475 = load i32, i32* %7, align 4
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds i32, i32* %474, i64 %476
  store i32 %473, i32* %477, align 4
  br label %478

; <label>:478:                                    ; preds = %472
  %479 = load i32, i32* %7, align 4
  %480 = add nsw i32 %479, 1
  store i32 %480, i32* %7, align 4
  br label %398

; <label>:481:                                    ; preds = %398
  br label %482

; <label>:482:                                    ; preds = %481
  %pgocount32 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 10)
  %483 = add i64 %pgocount32, 1
  store i64 %483, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 10)
  %484 = load i32, i32* %6, align 4
  %485 = add nsw i32 %484, 1
  store i32 %485, i32* %6, align 4
  br label %353

; <label>:486:                                    ; preds = %353
  br label %571

; <label>:487:                                    ; preds = %227
  %pgocount33 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 24)
  %488 = add i64 %pgocount33, 1
  store i64 %488, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 24)
  %489 = load i32, i32* %9, align 4
  %490 = icmp ne i32 %489, 0
  br i1 %490, label %503, label %491

; <label>:491:                                    ; preds = %487
  %pgocount34 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 32)
  %492 = add i64 %pgocount34, 1
  store i64 %492, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 32)
  %493 = load i32, i32* %10, align 4
  %494 = icmp ne i32 %493, 63
  br i1 %494, label %503, label %495

; <label>:495:                                    ; preds = %491
  %pgocount35 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 35)
  %496 = add i64 %pgocount35, 1
  store i64 %496, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 35)
  %497 = load i32, i32* %11, align 4
  %498 = icmp ne i32 %497, 0
  br i1 %498, label %503, label %499

; <label>:499:                                    ; preds = %495
  %pgocount36 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 38)
  %500 = add i64 %pgocount36, 1
  store i64 %500, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 38)
  %501 = load i32, i32* %12, align 4
  %502 = icmp ne i32 %501, 0
  br i1 %502, label %503, label %524

; <label>:503:                                    ; preds = %499, %495, %491, %487
  %pgocount37 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 25)
  %504 = add i64 %pgocount37, 1
  store i64 %504, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 25)
  %505 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %506 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %505, i32 0, i32 0
  %507 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %506, align 8
  %508 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %507, i32 0, i32 5
  store i32 15, i32* %508, align 8
  %509 = load i32, i32* %4, align 4
  %510 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %511 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %510, i32 0, i32 0
  %512 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %511, align 8
  %513 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %512, i32 0, i32 6
  %514 = bitcast %union.anon* %513 to [8 x i32]*
  %515 = getelementptr inbounds [8 x i32], [8 x i32]* %514, i64 0, i64 0
  store i32 %509, i32* %515, align 4
  %516 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %517 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %516, i32 0, i32 0
  %518 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %517, align 8
  %519 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %518, i32 0, i32 0
  %520 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %519, align 8
  %521 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %522 = bitcast %struct.jpeg_compress_struct* %521 to %struct.jpeg_common_struct*
  %523 = ptrtoint void (%struct.jpeg_common_struct*)* %520 to i64
  call void @__llvm_profile_instrument_target(i64 %523, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 10)
  call void %520(%struct.jpeg_common_struct* %522)
  br label %524

; <label>:524:                                    ; preds = %503, %499
  store i32 0, i32* %6, align 4
  br label %525

; <label>:525:                                    ; preds = %566, %524
  %526 = load i32, i32* %6, align 4
  %527 = load i32, i32* %5, align 4
  %528 = icmp slt i32 %526, %527
  br i1 %528, label %529, label %570

; <label>:529:                                    ; preds = %525
  %530 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %531 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %530, i32 0, i32 1
  %532 = load i32, i32* %6, align 4
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds [4 x i32], [4 x i32]* %531, i64 0, i64 %533
  %535 = load i32, i32* %534, align 4
  store i32 %535, i32* %8, align 4
  %536 = load i32, i32* %8, align 4
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds [10 x i32], [10 x i32]* %13, i64 0, i64 %537
  %539 = load i32, i32* %538, align 4
  %540 = icmp ne i32 %539, 0
  br i1 %540, label %541, label %562

; <label>:541:                                    ; preds = %529
  %pgocount38 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 14)
  %542 = add i64 %pgocount38, 1
  store i64 %542, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 14)
  %543 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %544 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %543, i32 0, i32 0
  %545 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %544, align 8
  %546 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %545, i32 0, i32 5
  store i32 17, i32* %546, align 8
  %547 = load i32, i32* %4, align 4
  %548 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %549 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %548, i32 0, i32 0
  %550 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %549, align 8
  %551 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %550, i32 0, i32 6
  %552 = bitcast %union.anon* %551 to [8 x i32]*
  %553 = getelementptr inbounds [8 x i32], [8 x i32]* %552, i64 0, i64 0
  store i32 %547, i32* %553, align 4
  %554 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %555 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %554, i32 0, i32 0
  %556 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %555, align 8
  %557 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %556, i32 0, i32 0
  %558 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %557, align 8
  %559 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %560 = bitcast %struct.jpeg_compress_struct* %559 to %struct.jpeg_common_struct*
  %561 = ptrtoint void (%struct.jpeg_common_struct*)* %558 to i64
  call void @__llvm_profile_instrument_target(i64 %561, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 11)
  call void %558(%struct.jpeg_common_struct* %560)
  br label %562

; <label>:562:                                    ; preds = %541, %529
  %563 = load i32, i32* %8, align 4
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds [10 x i32], [10 x i32]* %13, i64 0, i64 %564
  store i32 1, i32* %565, align 4
  br label %566

; <label>:566:                                    ; preds = %562
  %pgocount39 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 12)
  %567 = add i64 %pgocount39, 1
  store i64 %567, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 12)
  %568 = load i32, i32* %6, align 4
  %569 = add nsw i32 %568, 1
  store i32 %569, i32* %6, align 4
  br label %525

; <label>:570:                                    ; preds = %525
  br label %571

; <label>:571:                                    ; preds = %570, %486
  br label %572

; <label>:572:                                    ; preds = %571
  %573 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %3, align 8
  %574 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %573, i32 1
  store %struct.jpeg_scan_info* %574, %struct.jpeg_scan_info** %3, align 8
  %575 = load i32, i32* %4, align 4
  %576 = add nsw i32 %575, 1
  store i32 %576, i32* %4, align 4
  br label %102

; <label>:577:                                    ; preds = %102
  %578 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %579 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %578, i32 0, i32 37
  %580 = load i32, i32* %579, align 4
  %581 = icmp ne i32 %580, 0
  br i1 %581, label %582, label %617

; <label>:582:                                    ; preds = %577
  store i32 0, i32* %6, align 4
  br label %583

; <label>:583:                                    ; preds = %611, %582
  %584 = load i32, i32* %6, align 4
  %585 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %586 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %585, i32 0, i32 12
  %587 = load i32, i32* %586, align 4
  %588 = icmp slt i32 %584, %587
  br i1 %588, label %589, label %615

; <label>:589:                                    ; preds = %583
  %590 = load i32, i32* %6, align 4
  %591 = sext i32 %590 to i64
  %592 = getelementptr inbounds [10 x [64 x i32]], [10 x [64 x i32]]* %15, i64 0, i64 %591
  %593 = getelementptr inbounds [64 x i32], [64 x i32]* %592, i64 0, i64 0
  %594 = load i32, i32* %593, align 16
  %595 = icmp slt i32 %594, 0
  br i1 %595, label %596, label %610

; <label>:596:                                    ; preds = %589
  %pgocount40 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 27)
  %597 = add i64 %pgocount40, 1
  store i64 %597, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 27)
  %598 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %599 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %598, i32 0, i32 0
  %600 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %599, align 8
  %601 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %600, i32 0, i32 5
  store i32 44, i32* %601, align 8
  %602 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %603 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %602, i32 0, i32 0
  %604 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %603, align 8
  %605 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %604, i32 0, i32 0
  %606 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %605, align 8
  %607 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %608 = bitcast %struct.jpeg_compress_struct* %607 to %struct.jpeg_common_struct*
  %609 = ptrtoint void (%struct.jpeg_common_struct*)* %606 to i64
  call void @__llvm_profile_instrument_target(i64 %609, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 12)
  call void %606(%struct.jpeg_common_struct* %608)
  br label %610

; <label>:610:                                    ; preds = %596, %589
  br label %611

; <label>:611:                                    ; preds = %610
  %pgocount41 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 18)
  %612 = add i64 %pgocount41, 1
  store i64 %612, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 18)
  %613 = load i32, i32* %6, align 4
  %614 = add nsw i32 %613, 1
  store i32 %614, i32* %6, align 4
  br label %583

; <label>:615:                                    ; preds = %583
  %pgocount42 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 39)
  %616 = add i64 %pgocount42, 1
  store i64 %616, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 39)
  br label %651

; <label>:617:                                    ; preds = %577
  %pgocount43 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 43)
  %618 = add i64 %pgocount43, 1
  store i64 %618, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 43)
  store i32 0, i32* %6, align 4
  br label %619

; <label>:619:                                    ; preds = %646, %617
  %620 = load i32, i32* %6, align 4
  %621 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %622 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %621, i32 0, i32 12
  %623 = load i32, i32* %622, align 4
  %624 = icmp slt i32 %620, %623
  br i1 %624, label %625, label %650

; <label>:625:                                    ; preds = %619
  %626 = load i32, i32* %6, align 4
  %627 = sext i32 %626 to i64
  %628 = getelementptr inbounds [10 x i32], [10 x i32]* %13, i64 0, i64 %627
  %629 = load i32, i32* %628, align 4
  %630 = icmp ne i32 %629, 0
  br i1 %630, label %645, label %631

; <label>:631:                                    ; preds = %625
  %pgocount44 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 33)
  %632 = add i64 %pgocount44, 1
  store i64 %632, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 33)
  %633 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %634 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %633, i32 0, i32 0
  %635 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %634, align 8
  %636 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %635, i32 0, i32 5
  store i32 44, i32* %636, align 8
  %637 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %638 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %637, i32 0, i32 0
  %639 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %638, align 8
  %640 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %639, i32 0, i32 0
  %641 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %640, align 8
  %642 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %643 = bitcast %struct.jpeg_compress_struct* %642 to %struct.jpeg_common_struct*
  %644 = ptrtoint void (%struct.jpeg_common_struct*)* %641 to i64
  call void @__llvm_profile_instrument_target(i64 %644, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_validate_script to i8*), i32 13)
  call void %641(%struct.jpeg_common_struct* %643)
  br label %645

; <label>:645:                                    ; preds = %631, %625
  br label %646

; <label>:646:                                    ; preds = %645
  %pgocount45 = load i64, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 23)
  %647 = add i64 %pgocount45, 1
  store i64 %647, i64* getelementptr inbounds ([46 x i64], [46 x i64]* @__profc_tmp1.ll_validate_script, i64 0, i64 23)
  %648 = load i32, i32* %6, align 4
  %649 = add nsw i32 %648, 1
  store i32 %649, i32* %6, align 4
  br label %619

; <label>:650:                                    ; preds = %619
  br label %651

; <label>:651:                                    ; preds = %650, %615
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @select_scan_parameters(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.my_comp_master*, align 8
  %5 = alloca %struct.jpeg_scan_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 22
  %8 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  %9 = icmp ne %struct.jpeg_scan_info* %8, null
  br i1 %9, label %10, label %77

; <label>:10:                                     ; preds = %1
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %11, i32 0, i32 51
  %13 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %12, align 8
  %14 = bitcast %struct.jpeg_comp_master* %13 to %struct.my_comp_master*
  store %struct.my_comp_master* %14, %struct.my_comp_master** %4, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 22
  %17 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %16, align 8
  %18 = load %struct.my_comp_master*, %struct.my_comp_master** %4, align 8
  %19 = getelementptr inbounds %struct.my_comp_master, %struct.my_comp_master* %18, i32 0, i32 4
  %20 = load i32, i32* %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %17, i64 %21
  store %struct.jpeg_scan_info* %22, %struct.jpeg_scan_info** %5, align 8
  %23 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %24 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %23, i32 0, i32 0
  %25 = load i32, i32* %24, align 4
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 41
  store i32 %25, i32* %27, align 4
  store i32 0, i32* %3, align 4
  br label %28

; <label>:28:                                     ; preds = %51, %10
  %29 = load i32, i32* %3, align 4
  %30 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %31 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %30, i32 0, i32 0
  %32 = load i32, i32* %31, align 4
  %33 = icmp slt i32 %29, %32
  br i1 %33, label %34, label %55

; <label>:34:                                     ; preds = %28
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 14
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %36, align 8
  %38 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %39 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %38, i32 0, i32 1
  %40 = load i32, i32* %3, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [4 x i32], [4 x i32]* %39, i64 0, i64 %41
  %43 = load i32, i32* %42, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i64 %44
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 42
  %48 = load i32, i32* %3, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %47, i64 0, i64 %49
  store %struct.jpeg_component_info* %45, %struct.jpeg_component_info** %50, align 8
  br label %51

; <label>:51:                                     ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 0)
  %52 = add i64 %pgocount, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 0)
  %53 = load i32, i32* %3, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %3, align 4
  br label %28

; <label>:55:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 2)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 2)
  %57 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %58 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %57, i32 0, i32 2
  %59 = load i32, i32* %58, align 4
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i32 0, i32 47
  store i32 %59, i32* %61, align 4
  %62 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %63 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %62, i32 0, i32 3
  %64 = load i32, i32* %63, align 4
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 48
  store i32 %64, i32* %66, align 8
  %67 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %68 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %67, i32 0, i32 4
  %69 = load i32, i32* %68, align 4
  %70 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %70, i32 0, i32 49
  store i32 %69, i32* %71, align 4
  %72 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %73 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %72, i32 0, i32 5
  %74 = load i32, i32* %73, align 4
  %75 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %76 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %75, i32 0, i32 50
  store i32 %74, i32* %76, align 8
  br label %149

; <label>:77:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 3)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 3)
  %79 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %80 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %79, i32 0, i32 12
  %81 = load i32, i32* %80, align 4
  %82 = icmp sgt i32 %81, 4
  br i1 %82, label %83, label %112

; <label>:83:                                     ; preds = %77
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 4)
  %84 = add i64 %pgocount3, 1
  store i64 %84, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 4)
  %85 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %85, i32 0, i32 0
  %87 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %87, i32 0, i32 5
  store i32 24, i32* %88, align 8
  %89 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %90 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %89, i32 0, i32 12
  %91 = load i32, i32* %90, align 4
  %92 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %93 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %92, i32 0, i32 0
  %94 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %93, align 8
  %95 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %94, i32 0, i32 6
  %96 = bitcast %union.anon* %95 to [8 x i32]*
  %97 = getelementptr inbounds [8 x i32], [8 x i32]* %96, i64 0, i64 0
  store i32 %91, i32* %97, align 4
  %98 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %99 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %98, i32 0, i32 0
  %100 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %99, align 8
  %101 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %100, i32 0, i32 6
  %102 = bitcast %union.anon* %101 to [8 x i32]*
  %103 = getelementptr inbounds [8 x i32], [8 x i32]* %102, i64 0, i64 1
  store i32 4, i32* %103, align 4
  %104 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %105 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %104, i32 0, i32 0
  %106 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %105, align 8
  %107 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %106, i32 0, i32 0
  %108 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %107, align 8
  %109 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %110 = bitcast %struct.jpeg_compress_struct* %109 to %struct.jpeg_common_struct*
  %111 = ptrtoint void (%struct.jpeg_common_struct*)* %108 to i64
  call void @__llvm_profile_instrument_target(i64 %111, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_select_scan_parameters to i8*), i32 0)
  call void %108(%struct.jpeg_common_struct* %110)
  br label %112

; <label>:112:                                    ; preds = %83, %77
  %113 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %114 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %113, i32 0, i32 12
  %115 = load i32, i32* %114, align 4
  %116 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %117 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %116, i32 0, i32 41
  store i32 %115, i32* %117, align 4
  store i32 0, i32* %3, align 4
  br label %118

; <label>:118:                                    ; preds = %136, %112
  %119 = load i32, i32* %3, align 4
  %120 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %121 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %120, i32 0, i32 12
  %122 = load i32, i32* %121, align 4
  %123 = icmp slt i32 %119, %122
  br i1 %123, label %124, label %140

; <label>:124:                                    ; preds = %118
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %126 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %125, i32 0, i32 14
  %127 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %126, align 8
  %128 = load i32, i32* %3, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i64 %129
  %131 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %132 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %131, i32 0, i32 42
  %133 = load i32, i32* %3, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %132, i64 0, i64 %134
  store %struct.jpeg_component_info* %130, %struct.jpeg_component_info** %135, align 8
  br label %136

; <label>:136:                                    ; preds = %124
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 1)
  %137 = add i64 %pgocount4, 1
  store i64 %137, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_select_scan_parameters, i64 0, i64 1)
  %138 = load i32, i32* %3, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %3, align 4
  br label %118

; <label>:140:                                    ; preds = %118
  %141 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %142 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %141, i32 0, i32 47
  store i32 0, i32* %142, align 4
  %143 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %144 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %143, i32 0, i32 48
  store i32 63, i32* %144, align 8
  %145 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %146 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %145, i32 0, i32 49
  store i32 0, i32* %146, align 4
  %147 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %148 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %147, i32 0, i32 50
  store i32 0, i32* %148, align 8
  br label %149

; <label>:149:                                    ; preds = %140, %55
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @per_scan_setup(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_component_info*, align 8
  %7 = alloca i64, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %9 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %8, i32 0, i32 41
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %61

; <label>:12:                                     ; preds = %1
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 42
  %15 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %14, i64 0, i64 0
  %16 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %15, align 8
  store %struct.jpeg_component_info* %16, %struct.jpeg_component_info** %6, align 8
  %17 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %18 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %17, i32 0, i32 7
  %19 = load i32, i32* %18, align 4
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 43
  store i32 %19, i32* %21, align 8
  %22 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %23 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %22, i32 0, i32 8
  %24 = load i32, i32* %23, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 44
  store i32 %24, i32* %26, align 4
  %27 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %28 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %27, i32 0, i32 13
  store i32 1, i32* %28, align 4
  %29 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %30 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %29, i32 0, i32 14
  store i32 1, i32* %30, align 8
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %32 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %31, i32 0, i32 15
  store i32 1, i32* %32, align 4
  %33 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %34 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %33, i32 0, i32 16
  store i32 8, i32* %34, align 8
  %35 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %35, i32 0, i32 17
  store i32 1, i32* %36, align 4
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i32 0, i32 8
  %39 = load i32, i32* %38, align 8
  %40 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %41 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %40, i32 0, i32 3
  %42 = load i32, i32* %41, align 4
  %43 = urem i32 %39, %42
  store i32 %43, i32* %5, align 4
  %44 = load i32, i32* %5, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %51

; <label>:46:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 11)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 11)
  %48 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %49 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %48, i32 0, i32 3
  %50 = load i32, i32* %49, align 4
  store i32 %50, i32* %5, align 4
  br label %51

; <label>:51:                                     ; preds = %46, %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 5)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 5)
  %53 = load i32, i32* %5, align 4
  %54 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %55 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %54, i32 0, i32 18
  store i32 %53, i32* %55, align 8
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 45
  store i32 1, i32* %57, align 8
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %59 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %58, i32 0, i32 46
  %60 = getelementptr inbounds [10 x i32], [10 x i32]* %59, i64 0, i64 0
  store i32 0, i32* %60, align 4
  br label %250

; <label>:61:                                     ; preds = %1
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %62, i32 0, i32 41
  %64 = load i32, i32* %63, align 4
  %65 = icmp sle i32 %64, 0
  br i1 %65, label %72, label %66

; <label>:66:                                     ; preds = %61
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 10)
  %67 = add i64 %pgocount2, 1
  store i64 %67, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 10)
  %68 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %68, i32 0, i32 41
  %70 = load i32, i32* %69, align 4
  %71 = icmp sgt i32 %70, 4
  br i1 %71, label %72, label %101

; <label>:72:                                     ; preds = %66, %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 7)
  %73 = add i64 %pgocount3, 1
  store i64 %73, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 7)
  %74 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %75 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %74, i32 0, i32 0
  %76 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %75, align 8
  %77 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %76, i32 0, i32 5
  store i32 24, i32* %77, align 8
  %78 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %79 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %78, i32 0, i32 41
  %80 = load i32, i32* %79, align 4
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %81, i32 0, i32 0
  %83 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %82, align 8
  %84 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %83, i32 0, i32 6
  %85 = bitcast %union.anon* %84 to [8 x i32]*
  %86 = getelementptr inbounds [8 x i32], [8 x i32]* %85, i64 0, i64 0
  store i32 %80, i32* %86, align 4
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %87, i32 0, i32 0
  %89 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %89, i32 0, i32 6
  %91 = bitcast %union.anon* %90 to [8 x i32]*
  %92 = getelementptr inbounds [8 x i32], [8 x i32]* %91, i64 0, i64 1
  store i32 4, i32* %92, align 4
  %93 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %94 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %93, i32 0, i32 0
  %95 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %94, align 8
  %96 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %95, i32 0, i32 0
  %97 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %96, align 8
  %98 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %99 = bitcast %struct.jpeg_compress_struct* %98 to %struct.jpeg_common_struct*
  %100 = ptrtoint void (%struct.jpeg_common_struct*)* %97 to i64
  call void @__llvm_profile_instrument_target(i64 %100, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_per_scan_setup to i8*), i32 0)
  call void %97(%struct.jpeg_common_struct* %99)
  br label %101

; <label>:101:                                    ; preds = %72, %66
  %102 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %103 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %102, i32 0, i32 6
  %104 = load i32, i32* %103, align 8
  %105 = zext i32 %104 to i64
  %106 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %107 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %106, i32 0, i32 38
  %108 = load i32, i32* %107, align 8
  %109 = mul nsw i32 %108, 8
  %110 = sext i32 %109 to i64
  %111 = call i64 @jdiv_round_up(i64 %105, i64 %110)
  %112 = trunc i64 %111 to i32
  %113 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %114 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %113, i32 0, i32 43
  store i32 %112, i32* %114, align 8
  %115 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %116 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %115, i32 0, i32 7
  %117 = load i32, i32* %116, align 4
  %118 = zext i32 %117 to i64
  %119 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %120 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %119, i32 0, i32 39
  %121 = load i32, i32* %120, align 4
  %122 = mul nsw i32 %121, 8
  %123 = sext i32 %122 to i64
  %124 = call i64 @jdiv_round_up(i64 %118, i64 %123)
  %125 = trunc i64 %124 to i32
  %126 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %127 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %126, i32 0, i32 44
  store i32 %125, i32* %127, align 4
  %128 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %129 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %128, i32 0, i32 45
  store i32 0, i32* %129, align 8
  store i32 0, i32* %3, align 4
  br label %130

; <label>:130:                                    ; preds = %245, %101
  %131 = load i32, i32* %3, align 4
  %132 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %133 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %132, i32 0, i32 41
  %134 = load i32, i32* %133, align 4
  %135 = icmp slt i32 %131, %134
  br i1 %135, label %136, label %248

; <label>:136:                                    ; preds = %130
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 1)
  %137 = add i64 %pgocount4, 1
  store i64 %137, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 1)
  %138 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %139 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %138, i32 0, i32 42
  %140 = load i32, i32* %3, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %139, i64 0, i64 %141
  %143 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %142, align 8
  store %struct.jpeg_component_info* %143, %struct.jpeg_component_info** %6, align 8
  %144 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %145 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %144, i32 0, i32 2
  %146 = load i32, i32* %145, align 8
  %147 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %148 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %147, i32 0, i32 13
  store i32 %146, i32* %148, align 4
  %149 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %150 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %149, i32 0, i32 3
  %151 = load i32, i32* %150, align 4
  %152 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %153 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %152, i32 0, i32 14
  store i32 %151, i32* %153, align 8
  %154 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %155 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %154, i32 0, i32 13
  %156 = load i32, i32* %155, align 4
  %157 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %158 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %157, i32 0, i32 14
  %159 = load i32, i32* %158, align 8
  %160 = mul nsw i32 %156, %159
  %161 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %162 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %161, i32 0, i32 15
  store i32 %160, i32* %162, align 4
  %163 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %164 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %163, i32 0, i32 13
  %165 = load i32, i32* %164, align 4
  %166 = mul nsw i32 %165, 8
  %167 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %168 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %167, i32 0, i32 16
  store i32 %166, i32* %168, align 8
  %169 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %170 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %169, i32 0, i32 7
  %171 = load i32, i32* %170, align 4
  %172 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %173 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %172, i32 0, i32 13
  %174 = load i32, i32* %173, align 4
  %175 = urem i32 %171, %174
  store i32 %175, i32* %5, align 4
  %176 = load i32, i32* %5, align 4
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %178, label %183

; <label>:178:                                    ; preds = %136
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 3)
  %179 = add i64 %pgocount5, 1
  store i64 %179, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 3)
  %180 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %181 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %180, i32 0, i32 13
  %182 = load i32, i32* %181, align 4
  store i32 %182, i32* %5, align 4
  br label %183

; <label>:183:                                    ; preds = %178, %136
  %184 = load i32, i32* %5, align 4
  %185 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %186 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %185, i32 0, i32 17
  store i32 %184, i32* %186, align 4
  %187 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %188 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %187, i32 0, i32 8
  %189 = load i32, i32* %188, align 8
  %190 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %191 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %190, i32 0, i32 14
  %192 = load i32, i32* %191, align 8
  %193 = urem i32 %189, %192
  store i32 %193, i32* %5, align 4
  %194 = load i32, i32* %5, align 4
  %195 = icmp eq i32 %194, 0
  br i1 %195, label %196, label %201

; <label>:196:                                    ; preds = %183
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 4)
  %197 = add i64 %pgocount6, 1
  store i64 %197, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 4)
  %198 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %199 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %198, i32 0, i32 14
  %200 = load i32, i32* %199, align 8
  store i32 %200, i32* %5, align 4
  br label %201

; <label>:201:                                    ; preds = %196, %183
  %202 = load i32, i32* %5, align 4
  %203 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %204 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %203, i32 0, i32 18
  store i32 %202, i32* %204, align 8
  %205 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %206 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %205, i32 0, i32 15
  %207 = load i32, i32* %206, align 4
  store i32 %207, i32* %4, align 4
  %208 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %209 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %208, i32 0, i32 45
  %210 = load i32, i32* %209, align 8
  %211 = load i32, i32* %4, align 4
  %212 = add nsw i32 %210, %211
  %213 = icmp sgt i32 %212, 10
  br i1 %213, label %214, label %228

; <label>:214:                                    ; preds = %201
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 2)
  %215 = add i64 %pgocount7, 1
  store i64 %215, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 2)
  %216 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %217 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %216, i32 0, i32 0
  %218 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %217, align 8
  %219 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %218, i32 0, i32 5
  store i32 11, i32* %219, align 8
  %220 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %221 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %220, i32 0, i32 0
  %222 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %221, align 8
  %223 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %222, i32 0, i32 0
  %224 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %223, align 8
  %225 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %226 = bitcast %struct.jpeg_compress_struct* %225 to %struct.jpeg_common_struct*
  %227 = ptrtoint void (%struct.jpeg_common_struct*)* %224 to i64
  call void @__llvm_profile_instrument_target(i64 %227, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_per_scan_setup to i8*), i32 1)
  call void %224(%struct.jpeg_common_struct* %226)
  br label %228

; <label>:228:                                    ; preds = %214, %201
  br label %229

; <label>:229:                                    ; preds = %233, %228
  %230 = load i32, i32* %4, align 4
  %231 = add nsw i32 %230, -1
  store i32 %231, i32* %4, align 4
  %232 = icmp sgt i32 %230, 0
  br i1 %232, label %233, label %244

; <label>:233:                                    ; preds = %229
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 0)
  %234 = add i64 %pgocount8, 1
  store i64 %234, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 0)
  %235 = load i32, i32* %3, align 4
  %236 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %237 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %236, i32 0, i32 46
  %238 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %239 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %238, i32 0, i32 45
  %240 = load i32, i32* %239, align 8
  %241 = add nsw i32 %240, 1
  store i32 %241, i32* %239, align 8
  %242 = sext i32 %240 to i64
  %243 = getelementptr inbounds [10 x i32], [10 x i32]* %237, i64 0, i64 %242
  store i32 %235, i32* %243, align 4
  br label %229

; <label>:244:                                    ; preds = %229
  br label %245

; <label>:245:                                    ; preds = %244
  %246 = load i32, i32* %3, align 4
  %247 = add nsw i32 %246, 1
  store i32 %247, i32* %3, align 4
  br label %130

; <label>:248:                                    ; preds = %130
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 6)
  %249 = add i64 %pgocount9, 1
  store i64 %249, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 6)
  br label %250

; <label>:250:                                    ; preds = %248, %51
  %251 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %252 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %251, i32 0, i32 30
  %253 = load i32, i32* %252, align 4
  %254 = icmp sgt i32 %253, 0
  br i1 %254, label %255, label %277

; <label>:255:                                    ; preds = %250
  %256 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %257 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %256, i32 0, i32 30
  %258 = load i32, i32* %257, align 4
  %259 = sext i32 %258 to i64
  %260 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %261 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %260, i32 0, i32 43
  %262 = load i32, i32* %261, align 8
  %263 = zext i32 %262 to i64
  %264 = mul nsw i64 %259, %263
  store i64 %264, i64* %7, align 8
  %265 = load i64, i64* %7, align 8
  %266 = icmp slt i64 %265, 65535
  br i1 %266, label %267, label %270

; <label>:267:                                    ; preds = %255
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 8)
  %268 = add i64 %pgocount10, 1
  store i64 %268, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 8)
  %269 = load i64, i64* %7, align 8
  br label %272

; <label>:270:                                    ; preds = %255
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 9)
  %271 = add i64 %pgocount11, 1
  store i64 %271, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_tmp1.ll_per_scan_setup, i64 0, i64 9)
  br label %272

; <label>:272:                                    ; preds = %270, %267
  %273 = phi i64 [ %269, %267 ], [ 65535, %270 ]
  %274 = trunc i64 %273 to i32
  %275 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %276 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %275, i32 0, i32 29
  store i32 %274, i32* %276, align 8
  br label %277

; <label>:277:                                    ; preds = %272, %250
  ret void
}

declare i64 @jdiv_round_up(i64, i64) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
