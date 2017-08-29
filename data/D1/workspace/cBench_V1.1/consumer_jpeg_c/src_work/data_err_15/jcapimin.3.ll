; ModuleID = 'jcapimin.2.ll'
source_filename = "jcapimin.c"
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
%struct.jpeg_entropy_encoder = type { void (%struct.jpeg_compress_struct*, i32)*, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)*, void (%struct.jpeg_compress_struct*)* }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_CreateCompress = private constant [19 x i8] c"jpeg_CreateCompress"
@__profn_jpeg_destroy_compress = private constant [21 x i8] c"jpeg_destroy_compress"
@__profn_jpeg_abort_compress = private constant [19 x i8] c"jpeg_abort_compress"
@__profn_jpeg_suppress_tables = private constant [20 x i8] c"jpeg_suppress_tables"
@__profn_jpeg_finish_compress = private constant [20 x i8] c"jpeg_finish_compress"
@__profn_jpeg_write_marker = private constant [17 x i8] c"jpeg_write_marker"
@__profn_jpeg_write_tables = private constant [17 x i8] c"jpeg_write_tables"
@__profc_jpeg_CreateCompress = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_CreateCompress = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_CreateCompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 92046620708292785, i64 563029190709767, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32, i64)* @jpeg_CreateCompress to i8*), i8* bitcast ([2 x i64]* @__profvp_jpeg_CreateCompress to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_jpeg_destroy_compress = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_destroy_compress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7848681375371465763, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_destroy_compress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jpeg_destroy_compress to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_abort_compress = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_abort_compress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2147670401043535594, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_abort_compress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jpeg_abort_compress to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_suppress_tables = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_suppress_tables = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2987908803039288519, i64 91886912197, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @jpeg_suppress_tables to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_finish_compress = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_finish_compress = private global [10 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_finish_compress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2004907224427795506, i64 2814877039144908, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jpeg_finish_compress to i8*), i8* bitcast ([10 x i64]* @__profvp_jpeg_finish_compress to i8*), i32 9, [1 x i16] [i16 10] }, section "__llvm_prf_data", align 8
@__profc_jpeg_write_marker = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_write_marker = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_write_marker = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3864385473677404166, i64 562997974910456, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32, i8*, i32)* @jpeg_write_marker to i8*), i8* bitcast ([2 x i64]* @__profvp_jpeg_write_marker to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_jpeg_write_tables = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_write_tables = private global [5 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_write_tables = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6077474764561493177, i64 1407400454852354, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_tables, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jpeg_write_tables to i8*), i8* bitcast ([5 x i64]* @__profvp_jpeg_write_tables to i8*), i32 2, [1 x i16] [i16 5] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [19 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [142 x i8] c"\8B\01\00jpeg_CreateCompress\01jpeg_destroy_compress\01jpeg_abort_compress\01jpeg_suppress_tables\01jpeg_finish_compress\01jpeg_write_marker\01jpeg_write_tables", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_CreateCompress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_destroy_compress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_abort_compress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_suppress_tables to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_marker to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_tables to i8*), i8* bitcast ([19 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([142 x i8], [142 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @jpeg_CreateCompress(%struct.jpeg_compress_struct*, i32, i64) #0 {
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.jpeg_error_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i64 %2, i64* %6, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 1
  store %struct.jpeg_memory_mgr* null, %struct.jpeg_memory_mgr** %10, align 8
  %11 = load i32, i32* %5, align 4
  %12 = icmp ne i32 %11, 61
  br i1 %12, label %13, label %40

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 3)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 3)
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 10, i32* %18, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 6
  %23 = bitcast %union.anon* %22 to [8 x i32]*
  %24 = getelementptr inbounds [8 x i32], [8 x i32]* %23, i64 0, i64 0
  store i32 61, i32* %24, align 4
  %25 = load i32, i32* %5, align 4
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 6
  %30 = bitcast %union.anon* %29 to [8 x i32]*
  %31 = getelementptr inbounds [8 x i32], [8 x i32]* %30, i64 0, i64 1
  store i32 %25, i32* %31, align 4
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 0
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %38 = bitcast %struct.jpeg_compress_struct* %37 to %struct.jpeg_common_struct*
  %39 = ptrtoint void (%struct.jpeg_common_struct*)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_CreateCompress to i8*), i32 0)
  call void %36(%struct.jpeg_common_struct* %38)
  br label %40

; <label>:40:                                     ; preds = %13, %3
  %41 = load i64, i64* %6, align 8
  %42 = icmp ne i64 %41, 496
  br i1 %42, label %43, label %71

; <label>:43:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 4)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 4)
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %45, i32 0, i32 0
  %47 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %46, align 8
  %48 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %47, i32 0, i32 5
  store i32 19, i32* %48, align 8
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 0
  %51 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %51, i32 0, i32 6
  %53 = bitcast %union.anon* %52 to [8 x i32]*
  %54 = getelementptr inbounds [8 x i32], [8 x i32]* %53, i64 0, i64 0
  store i32 496, i32* %54, align 4
  %55 = load i64, i64* %6, align 8
  %56 = trunc i64 %55 to i32
  %57 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %58 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %57, i32 0, i32 0
  %59 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %58, align 8
  %60 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %59, i32 0, i32 6
  %61 = bitcast %union.anon* %60 to [8 x i32]*
  %62 = getelementptr inbounds [8 x i32], [8 x i32]* %61, i64 0, i64 1
  store i32 %56, i32* %62, align 4
  %63 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %63, i32 0, i32 0
  %65 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %64, align 8
  %66 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %65, i32 0, i32 0
  %67 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %66, align 8
  %68 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %69 = bitcast %struct.jpeg_compress_struct* %68 to %struct.jpeg_common_struct*
  %70 = ptrtoint void (%struct.jpeg_common_struct*)* %67 to i64
  call void @__llvm_profile_instrument_target(i64 %70, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_CreateCompress to i8*), i32 1)
  call void %67(%struct.jpeg_common_struct* %69)
  br label %71

; <label>:71:                                     ; preds = %43, %40
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %72, i32 0, i32 0
  %74 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %73, align 8
  store %struct.jpeg_error_mgr* %74, %struct.jpeg_error_mgr** %8, align 8
  %75 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %76 = bitcast %struct.jpeg_compress_struct* %75 to i8*
  call void @llvm.memset.p0i8.i64(i8* %76, i8 0, i64 496, i32 1, i1 false)
  %77 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %78 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %79 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %78, i32 0, i32 0
  store %struct.jpeg_error_mgr* %77, %struct.jpeg_error_mgr** %79, align 8
  %80 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %81 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %80, i32 0, i32 3
  store i32 0, i32* %81, align 8
  %82 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %83 = bitcast %struct.jpeg_compress_struct* %82 to %struct.jpeg_common_struct*
  call void @jinit_memory_mgr(%struct.jpeg_common_struct* %83)
  %84 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %84, i32 0, i32 2
  store %struct.jpeg_progress_mgr* null, %struct.jpeg_progress_mgr** %85, align 8
  %86 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %87 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %86, i32 0, i32 5
  store %struct.jpeg_destination_mgr* null, %struct.jpeg_destination_mgr** %87, align 8
  %88 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %89 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %88, i32 0, i32 14
  store %struct.jpeg_component_info* null, %struct.jpeg_component_info** %89, align 8
  store i32 0, i32* %7, align 4
  br label %90

; <label>:90:                                     ; preds = %99, %71
  %91 = load i32, i32* %7, align 4
  %92 = icmp slt i32 %91, 4
  br i1 %92, label %93, label %103

; <label>:93:                                     ; preds = %90
  %94 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %95 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %94, i32 0, i32 15
  %96 = load i32, i32* %7, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %95, i64 0, i64 %97
  store %struct.JQUANT_TBL* null, %struct.JQUANT_TBL** %98, align 8
  br label %99

; <label>:99:                                     ; preds = %93
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 0)
  %100 = add i64 %pgocount2, 1
  store i64 %100, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 0)
  %101 = load i32, i32* %7, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %7, align 4
  br label %90

; <label>:103:                                    ; preds = %90
  store i32 0, i32* %7, align 4
  br label %104

; <label>:104:                                    ; preds = %118, %103
  %105 = load i32, i32* %7, align 4
  %106 = icmp slt i32 %105, 4
  br i1 %106, label %107, label %122

; <label>:107:                                    ; preds = %104
  %108 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %109 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %108, i32 0, i32 16
  %110 = load i32, i32* %7, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %109, i64 0, i64 %111
  store %struct.JHUFF_TBL* null, %struct.JHUFF_TBL** %112, align 8
  %113 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %114 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %113, i32 0, i32 17
  %115 = load i32, i32* %7, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %114, i64 0, i64 %116
  store %struct.JHUFF_TBL* null, %struct.JHUFF_TBL** %117, align 8
  br label %118

; <label>:118:                                    ; preds = %107
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 1)
  %119 = add i64 %pgocount3, 1
  store i64 %119, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 1)
  %120 = load i32, i32* %7, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %7, align 4
  br label %104

; <label>:122:                                    ; preds = %104
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 2)
  %123 = add i64 %pgocount4, 1
  store i64 %123, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_CreateCompress, i64 0, i64 2)
  %124 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %125 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %124, i32 0, i32 10
  store double 1.000000e+00, double* %125, align 8
  %126 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %127 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %126, i32 0, i32 4
  store i32 100, i32* %127, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @jinit_memory_mgr(%struct.jpeg_common_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_destroy_compress(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_destroy_compress, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_destroy_compress, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %5 = bitcast %struct.jpeg_compress_struct* %4 to %struct.jpeg_common_struct*
  call void @jpeg_destroy(%struct.jpeg_common_struct* %5)
  ret void
}

declare void @jpeg_destroy(%struct.jpeg_common_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_abort_compress(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_abort_compress, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_abort_compress, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %5 = bitcast %struct.jpeg_compress_struct* %4 to %struct.jpeg_common_struct*
  call void @jpeg_abort(%struct.jpeg_common_struct* %5)
  ret void
}

declare void @jpeg_abort(%struct.jpeg_common_struct*) #2

; Function Attrs: noinline nounwind uwtable
define void @jpeg_suppress_tables(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.JQUANT_TBL*, align 8
  %7 = alloca %struct.JHUFF_TBL*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %8

; <label>:8:                                      ; preds = %25, %2
  %9 = load i32, i32* %5, align 4
  %10 = icmp slt i32 %9, 4
  br i1 %10, label %11, label %29

; <label>:11:                                     ; preds = %8
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %12, i32 0, i32 15
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %13, i64 0, i64 %15
  %17 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %16, align 8
  store %struct.JQUANT_TBL* %17, %struct.JQUANT_TBL** %6, align 8
  %18 = icmp ne %struct.JQUANT_TBL* %17, null
  br i1 %18, label %19, label %24

; <label>:19:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 2)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 2)
  %21 = load i32, i32* %4, align 4
  %22 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %6, align 8
  %23 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %22, i32 0, i32 1
  store i32 %21, i32* %23, align 4
  br label %24

; <label>:24:                                     ; preds = %19, %11
  br label %25

; <label>:25:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 0)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 0)
  %27 = load i32, i32* %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %5, align 4
  br label %8

; <label>:29:                                     ; preds = %8
  store i32 0, i32* %5, align 4
  br label %30

; <label>:30:                                     ; preds = %60, %29
  %31 = load i32, i32* %5, align 4
  %32 = icmp slt i32 %31, 4
  br i1 %32, label %33, label %64

; <label>:33:                                     ; preds = %30
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 16
  %36 = load i32, i32* %5, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %35, i64 0, i64 %37
  %39 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %38, align 8
  store %struct.JHUFF_TBL* %39, %struct.JHUFF_TBL** %7, align 8
  %40 = icmp ne %struct.JHUFF_TBL* %39, null
  br i1 %40, label %41, label %46

; <label>:41:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 3)
  %43 = load i32, i32* %4, align 4
  %44 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %7, align 8
  %45 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %44, i32 0, i32 2
  store i32 %43, i32* %45, align 4
  br label %46

; <label>:46:                                     ; preds = %41, %33
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %47, i32 0, i32 17
  %49 = load i32, i32* %5, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %48, i64 0, i64 %50
  %52 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %51, align 8
  store %struct.JHUFF_TBL* %52, %struct.JHUFF_TBL** %7, align 8
  %53 = icmp ne %struct.JHUFF_TBL* %52, null
  br i1 %53, label %54, label %59

; <label>:54:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 4)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 4)
  %56 = load i32, i32* %4, align 4
  %57 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %7, align 8
  %58 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %57, i32 0, i32 2
  store i32 %56, i32* %58, align 4
  br label %59

; <label>:59:                                     ; preds = %54, %46
  br label %60

; <label>:60:                                     ; preds = %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 1)
  %61 = add i64 %pgocount4, 1
  store i64 %61, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 1)
  %62 = load i32, i32* %5, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %5, align 4
  br label %30

; <label>:64:                                     ; preds = %30
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 5)
  %65 = add i64 %pgocount5, 1
  store i64 %65, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_jpeg_suppress_tables, i64 0, i64 5)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_finish_compress(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 101
  br i1 %7, label %14, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 5)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 5)
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 4
  %12 = load i32, i32* %11, align 4
  %13 = icmp eq i32 %12, 102
  br i1 %13, label %14, label %45

; <label>:14:                                     ; preds = %8, %1
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 36
  %17 = load i32, i32* %16, align 8
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %19 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %18, i32 0, i32 7
  %20 = load i32, i32* %19, align 4
  %21 = icmp ult i32 %17, %20
  br i1 %21, label %22, label %36

; <label>:22:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 6)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 6)
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 5
  store i32 66, i32* %27, align 8
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %34 = bitcast %struct.jpeg_compress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 0)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %22, %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 4)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 4)
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 51
  %40 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %40, i32 0, i32 2
  %42 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %41, align 8
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %44 = ptrtoint void (%struct.jpeg_compress_struct*)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 1)
  call void %42(%struct.jpeg_compress_struct* %43)
  br label %75

; <label>:45:                                     ; preds = %8
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 4
  %48 = load i32, i32* %47, align 4
  %49 = icmp ne i32 %48, 103
  br i1 %49, label %50, label %73

; <label>:50:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 8)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 8)
  %52 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %53 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %52, i32 0, i32 0
  %54 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %53, align 8
  %55 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %54, i32 0, i32 5
  store i32 18, i32* %55, align 8
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 4
  %58 = load i32, i32* %57, align 4
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 0
  %61 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %60, align 8
  %62 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %61, i32 0, i32 6
  %63 = bitcast %union.anon* %62 to [8 x i32]*
  %64 = getelementptr inbounds [8 x i32], [8 x i32]* %63, i64 0, i64 0
  store i32 %58, i32* %64, align 4
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 0
  %67 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %66, align 8
  %68 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %67, i32 0, i32 0
  %69 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %68, align 8
  %70 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %71 = bitcast %struct.jpeg_compress_struct* %70 to %struct.jpeg_common_struct*
  %72 = ptrtoint void (%struct.jpeg_common_struct*)* %69 to i64
  call void @__llvm_profile_instrument_target(i64 %72, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 2)
  call void %69(%struct.jpeg_common_struct* %71)
  br label %73

; <label>:73:                                     ; preds = %50, %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 7)
  %74 = add i64 %pgocount4, 1
  store i64 %74, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 7)
  br label %75

; <label>:75:                                     ; preds = %73, %36
  br label %76

; <label>:76:                                     ; preds = %157, %75
  %77 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %78 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %77, i32 0, i32 51
  %79 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %78, align 8
  %80 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %79, i32 0, i32 4
  %81 = load i32, i32* %80, align 4
  %82 = icmp ne i32 %81, 0
  %83 = xor i1 %82, true
  br i1 %83, label %84, label %166

; <label>:84:                                     ; preds = %76
  %85 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %85, i32 0, i32 51
  %87 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %86, align 8
  %88 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %87, i32 0, i32 0
  %89 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %88, align 8
  %90 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %91 = ptrtoint void (%struct.jpeg_compress_struct*)* %89 to i64
  call void @__llvm_profile_instrument_target(i64 %91, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 3)
  call void %89(%struct.jpeg_compress_struct* %90)
  store i32 0, i32* %3, align 4
  br label %92

; <label>:92:                                     ; preds = %153, %84
  %93 = load i32, i32* %3, align 4
  %94 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %95 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %94, i32 0, i32 40
  %96 = load i32, i32* %95, align 8
  %97 = icmp ult i32 %93, %96
  br i1 %97, label %98, label %157

; <label>:98:                                     ; preds = %92
  %99 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %100 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %99, i32 0, i32 2
  %101 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %100, align 8
  %102 = icmp ne %struct.jpeg_progress_mgr* %101, null
  br i1 %102, label %103, label %128

; <label>:103:                                    ; preds = %98
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 1)
  %104 = add i64 %pgocount5, 1
  store i64 %104, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 1)
  %105 = load i32, i32* %3, align 4
  %106 = zext i32 %105 to i64
  %107 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %108 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %107, i32 0, i32 2
  %109 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %108, align 8
  %110 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %109, i32 0, i32 1
  store i64 %106, i64* %110, align 8
  %111 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %111, i32 0, i32 40
  %113 = load i32, i32* %112, align 8
  %114 = zext i32 %113 to i64
  %115 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %116 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %115, i32 0, i32 2
  %117 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %116, align 8
  %118 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %117, i32 0, i32 2
  store i64 %114, i64* %118, align 8
  %119 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %120 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %119, i32 0, i32 2
  %121 = load %struct.jpeg_progress_mgr*, %struct.jpeg_progress_mgr** %120, align 8
  %122 = getelementptr inbounds %struct.jpeg_progress_mgr, %struct.jpeg_progress_mgr* %121, i32 0, i32 0
  %123 = bitcast {}** %122 to void (%struct.jpeg_common_struct*)**
  %124 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %123, align 8
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %126 = bitcast %struct.jpeg_compress_struct* %125 to %struct.jpeg_common_struct*
  %127 = ptrtoint void (%struct.jpeg_common_struct*)* %124 to i64
  call void @__llvm_profile_instrument_target(i64 %127, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 4)
  call void %124(%struct.jpeg_common_struct* %126)
  br label %128

; <label>:128:                                    ; preds = %103, %98
  %129 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %130 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %129, i32 0, i32 54
  %131 = load %struct.jpeg_c_coef_controller*, %struct.jpeg_c_coef_controller** %130, align 8
  %132 = getelementptr inbounds %struct.jpeg_c_coef_controller, %struct.jpeg_c_coef_controller* %131, i32 0, i32 1
  %133 = load i32 (%struct.jpeg_compress_struct*, i8***)*, i32 (%struct.jpeg_compress_struct*, i8***)** %132, align 8
  %134 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %135 = ptrtoint i32 (%struct.jpeg_compress_struct*, i8***)* %133 to i64
  call void @__llvm_profile_instrument_target(i64 %135, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 5)
  %136 = call i32 %133(%struct.jpeg_compress_struct* %134, i8*** null)
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %152, label %138

; <label>:138:                                    ; preds = %128
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 2)
  %139 = add i64 %pgocount6, 1
  store i64 %139, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 2)
  %140 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %141 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %140, i32 0, i32 0
  %142 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %141, align 8
  %143 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %142, i32 0, i32 5
  store i32 22, i32* %143, align 8
  %144 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %145 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %144, i32 0, i32 0
  %146 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %145, align 8
  %147 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %146, i32 0, i32 0
  %148 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %147, align 8
  %149 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %150 = bitcast %struct.jpeg_compress_struct* %149 to %struct.jpeg_common_struct*
  %151 = ptrtoint void (%struct.jpeg_common_struct*)* %148 to i64
  call void @__llvm_profile_instrument_target(i64 %151, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 6)
  call void %148(%struct.jpeg_common_struct* %150)
  br label %152

; <label>:152:                                    ; preds = %138, %128
  br label %153

; <label>:153:                                    ; preds = %152
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 0)
  %154 = add i64 %pgocount7, 1
  store i64 %154, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 0)
  %155 = load i32, i32* %3, align 4
  %156 = add i32 %155, 1
  store i32 %156, i32* %3, align 4
  br label %92

; <label>:157:                                    ; preds = %92
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 3)
  %158 = add i64 %pgocount8, 1
  store i64 %158, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_jpeg_finish_compress, i64 0, i64 3)
  %159 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %160 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %159, i32 0, i32 51
  %161 = load %struct.jpeg_comp_master*, %struct.jpeg_comp_master** %160, align 8
  %162 = getelementptr inbounds %struct.jpeg_comp_master, %struct.jpeg_comp_master* %161, i32 0, i32 2
  %163 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %162, align 8
  %164 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %165 = ptrtoint void (%struct.jpeg_compress_struct*)* %163 to i64
  call void @__llvm_profile_instrument_target(i64 %165, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 7)
  call void %163(%struct.jpeg_compress_struct* %164)
  br label %76

; <label>:166:                                    ; preds = %76
  %167 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %168 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %167, i32 0, i32 55
  %169 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %168, align 8
  %170 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %169, i32 0, i32 4
  %171 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %170, align 8
  %172 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %173 = ptrtoint void (%struct.jpeg_compress_struct*)* %171 to i64
  call void @__llvm_profile_instrument_target(i64 %173, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 8)
  call void %171(%struct.jpeg_compress_struct* %172)
  %174 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %175 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %174, i32 0, i32 5
  %176 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %175, align 8
  %177 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %176, i32 0, i32 4
  %178 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %177, align 8
  %179 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %180 = ptrtoint void (%struct.jpeg_compress_struct*)* %178 to i64
  call void @__llvm_profile_instrument_target(i64 %180, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_finish_compress to i8*), i32 9)
  call void %178(%struct.jpeg_compress_struct* %179)
  %181 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %182 = bitcast %struct.jpeg_compress_struct* %181 to %struct.jpeg_common_struct*
  call void @jpeg_abort(%struct.jpeg_common_struct* %182)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_write_marker(%struct.jpeg_compress_struct*, i32, i8*, i32) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  store i32 %3, i32* %8, align 4
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 36
  %11 = load i32, i32* %10, align 8
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %31, label %13

; <label>:13:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 2)
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 4
  %17 = load i32, i32* %16, align 4
  %18 = icmp ne i32 %17, 101
  br i1 %18, label %19, label %54

; <label>:19:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 3)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 3)
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 4
  %23 = load i32, i32* %22, align 4
  %24 = icmp ne i32 %23, 102
  br i1 %24, label %25, label %54

; <label>:25:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 4)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 4)
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 4
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %29, 103
  br i1 %30, label %31, label %54

; <label>:31:                                     ; preds = %25, %4
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 1)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 1)
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %34 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %33, i32 0, i32 0
  %35 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %34, align 8
  %36 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %35, i32 0, i32 5
  store i32 18, i32* %36, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 4
  %39 = load i32, i32* %38, align 4
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 0
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i32 0, i32 6
  %44 = bitcast %union.anon* %43 to [8 x i32]*
  %45 = getelementptr inbounds [8 x i32], [8 x i32]* %44, i64 0, i64 0
  store i32 %39, i32* %45, align 4
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i32 0, i32 0
  %50 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %49, align 8
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %52 = bitcast %struct.jpeg_compress_struct* %51 to %struct.jpeg_common_struct*
  %53 = ptrtoint void (%struct.jpeg_common_struct*)* %50 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_marker to i8*), i32 0)
  call void %50(%struct.jpeg_common_struct* %52)
  br label %54

; <label>:54:                                     ; preds = %31, %25, %19, %13
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 0)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_write_marker, i64 0, i64 0)
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 55
  %58 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %58, i32 0, i32 0
  %60 = load void (%struct.jpeg_compress_struct*, i32, i8*, i32)*, void (%struct.jpeg_compress_struct*, i32, i8*, i32)** %59, align 8
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %62 = load i32, i32* %6, align 4
  %63 = load i8*, i8** %7, align 8
  %64 = load i32, i32* %8, align 4
  %65 = ptrtoint void (%struct.jpeg_compress_struct*, i32, i8*, i32)* %60 to i64
  call void @__llvm_profile_instrument_target(i64 %65, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_marker to i8*), i32 1)
  call void %60(%struct.jpeg_compress_struct* %61, i32 %62, i8* %63, i32 %64)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_write_tables(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i32 0, i32 4
  %5 = load i32, i32* %4, align 4
  %6 = icmp ne i32 %5, 100
  br i1 %6, label %7, label %30

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_tables, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_tables, i64 0, i64 1)
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 0
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i32 0, i32 5
  store i32 18, i32* %12, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 4
  %15 = load i32, i32* %14, align 4
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 6
  %20 = bitcast %union.anon* %19 to [8 x i32]*
  %21 = getelementptr inbounds [8 x i32], [8 x i32]* %20, i64 0, i64 0
  store i32 %15, i32* %21, align 4
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 0
  %26 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %25, align 8
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %28 = bitcast %struct.jpeg_compress_struct* %27 to %struct.jpeg_common_struct*
  %29 = ptrtoint void (%struct.jpeg_common_struct*)* %26 to i64
  call void @__llvm_profile_instrument_target(i64 %29, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_tables to i8*), i32 0)
  call void %26(%struct.jpeg_common_struct* %28)
  br label %30

; <label>:30:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_tables, i64 0, i64 0)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jpeg_write_tables, i64 0, i64 0)
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 4
  %36 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %35, align 8
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %38 = bitcast %struct.jpeg_compress_struct* %37 to %struct.jpeg_common_struct*
  %39 = ptrtoint void (%struct.jpeg_common_struct*)* %36 to i64
  call void @__llvm_profile_instrument_target(i64 %39, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_tables to i8*), i32 1)
  call void %36(%struct.jpeg_common_struct* %38)
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 5
  %42 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %42, i32 0, i32 2
  %44 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %43, align 8
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %46 = ptrtoint void (%struct.jpeg_compress_struct*)* %44 to i64
  call void @__llvm_profile_instrument_target(i64 %46, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_tables to i8*), i32 2)
  call void %44(%struct.jpeg_compress_struct* %45)
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jinit_marker_writer(%struct.jpeg_compress_struct* %47)
  %48 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %48, i32 0, i32 55
  %50 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %50, i32 0, i32 5
  %52 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %51, align 8
  %53 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %54 = ptrtoint void (%struct.jpeg_compress_struct*)* %52 to i64
  call void @__llvm_profile_instrument_target(i64 %54, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_tables to i8*), i32 3)
  call void %52(%struct.jpeg_compress_struct* %53)
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 5
  %57 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %56, align 8
  %58 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %57, i32 0, i32 4
  %59 = load void (%struct.jpeg_compress_struct*)*, void (%struct.jpeg_compress_struct*)** %58, align 8
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %61 = ptrtoint void (%struct.jpeg_compress_struct*)* %59 to i64
  call void @__llvm_profile_instrument_target(i64 %61, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_write_tables to i8*), i32 4)
  call void %59(%struct.jpeg_compress_struct* %60)
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %63 = bitcast %struct.jpeg_compress_struct* %62 to %struct.jpeg_common_struct*
  call void @jpeg_abort(%struct.jpeg_common_struct* %63)
  ret void
}

declare void @jinit_marker_writer(%struct.jpeg_compress_struct*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
