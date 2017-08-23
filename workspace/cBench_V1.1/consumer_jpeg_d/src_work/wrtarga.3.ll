; ModuleID = 'wrtarga.2.ll'
source_filename = "wrtarga.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.djpeg_dest_struct = type { void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)*, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)*, %struct._IO_FILE*, i8**, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.jpeg_decompress_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32, %struct.jpeg_source_mgr*, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8**, i32, i32, i32, i32, i32, [64 x i32]*, [4 x %struct.JQUANT_TBL*], [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*], i32, %struct.jpeg_component_info*, i32, i32, [16 x i8], [16 x i8], [16 x i8], i32, i32, i8, i16, i16, i32, i8, i32, i32, i32, i32, i32, i8*, i32, [4 x %struct.jpeg_component_info*], i32, i32, i32, [10 x i32], i32, i32, i32, i32, i32, %struct.jpeg_decomp_master*, %struct.jpeg_d_main_controller*, %struct.jpeg_d_coef_controller*, %struct.jpeg_d_post_controller*, %struct.jpeg_input_controller*, %struct.jpeg_marker_reader*, %struct.jpeg_entropy_decoder*, %struct.jpeg_inverse_dct*, %struct.jpeg_upsampler*, %struct.jpeg_color_deconverter*, %struct.jpeg_color_quantizer* }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, {}*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, {}*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { {}*, i64, i64, i32, i32 }
%struct.jpeg_source_mgr = type { i8*, i64, void (%struct.jpeg_decompress_struct*)*, i32 (%struct.jpeg_decompress_struct*)*, void (%struct.jpeg_decompress_struct*, i64)*, i32 (%struct.jpeg_decompress_struct*, i32)*, void (%struct.jpeg_decompress_struct*)* }
%struct.JQUANT_TBL = type { [64 x i16], i32 }
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.jpeg_component_info = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.JQUANT_TBL*, i8* }
%struct.jpeg_decomp_master = type opaque
%struct.jpeg_d_main_controller = type opaque
%struct.jpeg_d_coef_controller = type opaque
%struct.jpeg_d_post_controller = type opaque
%struct.jpeg_input_controller = type opaque
%struct.jpeg_marker_reader = type opaque
%struct.jpeg_entropy_decoder = type opaque
%struct.jpeg_inverse_dct = type opaque
%struct.jpeg_upsampler = type opaque
%struct.jpeg_color_deconverter = type opaque
%struct.jpeg_color_quantizer = type opaque
%struct.tga_dest_struct = type { %struct.djpeg_dest_struct, i8*, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_write_targa = private constant [17 x i8] c"jinit_write_targa"
@__profn_tmp1.ll_start_output_tga = private constant [24 x i8] c"tmp1.ll:start_output_tga"
@__profn_tmp1.ll_finish_output_tga = private constant [25 x i8] c"tmp1.ll:finish_output_tga"
@__profn_tmp1.ll_write_header = private constant [20 x i8] c"tmp1.ll:write_header"
@__profn_tmp1.ll_put_demapped_gray = private constant [25 x i8] c"tmp1.ll:put_demapped_gray"
@__profn_tmp1.ll_put_gray_rows = private constant [21 x i8] c"tmp1.ll:put_gray_rows"
@__profn_tmp1.ll_put_pixel_rows = private constant [22 x i8] c"tmp1.ll:put_pixel_rows"
@__profc_jinit_write_targa = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_write_targa = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_write_targa = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3528990914358793292, i64 844437815033855, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_write_targa, i32 0, i32 0), i8* bitcast (%struct.djpeg_dest_struct* (%struct.jpeg_decompress_struct*)* @jinit_write_targa to i8*), i8* bitcast ([3 x i64]* @__profvp_jinit_write_targa to i8*), i32 1, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_output_tga = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_output_tga = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_output_tga = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -658482884283358754, i64 563064927125166, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_tga to i8*), i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_start_output_tga to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_output_tga = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_finish_output_tga = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_finish_output_tga = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4672475742495126047, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_tga, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_tga to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_finish_output_tga to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_header = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_write_header = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_write_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1030416134824232016, i64 281547326152517, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_write_header to i8*), i32 5, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_demapped_gray = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_demapped_gray = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 105734626384875677, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_gray to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_gray_rows = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_gray_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -856501299774802929, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_gray_rows, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_put_pixel_rows = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_put_pixel_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7264417600277484566, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [14 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [97 x i8] c"\A0\01^x\DAm\8CQ\0A\80 \10D\E9BA\BF]fYpSCsYW\AC\DB\A7\05Q\D0\E7\BC73\AB\DF\BCB\15\AF\04\8Abq\D0\C8\D3\18\C2\9C[THE\B9(\E8K,m\92\DD\9F\B9o\1C\A1!y`/\19\8A\C8L\06\AC\E0\F11\1D\80\A4\9A?\94\FDN\E1\C2'Hz=D", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_targa to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_output_tga to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_tga to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_demapped_gray to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_gray_rows to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_put_pixel_rows to i8*), i8* bitcast ([14 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define %struct.djpeg_dest_struct* @jinit_write_targa(%struct.jpeg_decompress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_write_targa, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_write_targa, i64 0, i64 0)
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.tga_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  %5 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %11 = bitcast %struct.jpeg_decompress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_targa to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 64)
  %14 = bitcast i8* %13 to %struct.tga_dest_struct*
  store %struct.tga_dest_struct* %14, %struct.tga_dest_struct** %4, align 8
  %15 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %16 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %15, i32 0, i32 0
  %17 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %16, i32 0, i32 0
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @start_output_tga, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %17, align 8
  %18 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %19 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %19, i32 0, i32 2
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)* @finish_output_tga, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*)** %20, align 8
  %21 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  call void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct* %21)
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 26
  %24 = load i32, i32* %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %25, i32 0, i32 29
  %27 = load i32, i32* %26, align 4
  %28 = mul i32 %24, %27
  %29 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %30 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %29, i32 0, i32 2
  store i32 %28, i32* %30, align 8
  %31 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %32 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %31, i32 0, i32 1
  %33 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %33, i32 0, i32 0
  %35 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %34, align 8
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %37 = bitcast %struct.jpeg_decompress_struct* %36 to %struct.jpeg_common_struct*
  %38 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %39 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %38, i32 0, i32 2
  %40 = load i32, i32* %39, align 8
  %41 = zext i32 %40 to i64
  %42 = mul i64 %41, 1
  %43 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %35 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_targa to i8*), i32 1)
  %44 = call i8* %35(%struct.jpeg_common_struct* %37, i32 1, i64 %42)
  %45 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %46 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %45, i32 0, i32 1
  store i8* %44, i8** %46, align 8
  %47 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %47, i32 0, i32 1
  %49 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %48, align 8
  %50 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %49, i32 0, i32 2
  %51 = load i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)** %50, align 8
  %52 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %53 = bitcast %struct.jpeg_decompress_struct* %52 to %struct.jpeg_common_struct*
  %54 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %55 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %54, i32 0, i32 2
  %56 = load i32, i32* %55, align 8
  %57 = ptrtoint i8** (%struct.jpeg_common_struct*, i32, i32, i32)* %51 to i64
  call void @__llvm_profile_instrument_target(i64 %57, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_write_targa to i8*), i32 2)
  %58 = call i8** %51(%struct.jpeg_common_struct* %53, i32 1, i32 %56, i32 1)
  %59 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %60 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %59, i32 0, i32 0
  %61 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %60, i32 0, i32 4
  store i8** %58, i8*** %61, align 8
  %62 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %63 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %62, i32 0, i32 0
  %64 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %63, i32 0, i32 5
  store i32 1, i32* %64, align 8
  %65 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %4, align 8
  %66 = bitcast %struct.tga_dest_struct* %65 to %struct.djpeg_dest_struct*
  ret %struct.djpeg_dest_struct* %66
}

; Function Attrs: nounwind uwtable
define internal void @start_output_tga(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.djpeg_dest_struct*, align 8
  %5 = alloca %struct.tga_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct._IO_FILE*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %4, align 8
  %9 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %10 = bitcast %struct.djpeg_dest_struct* %9 to %struct.tga_dest_struct*
  store %struct.tga_dest_struct* %10, %struct.tga_dest_struct** %5, align 8
  %11 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %12 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %11, i32 0, i32 10
  %13 = load i32, i32* %12, align 8
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %33

; <label>:15:                                     ; preds = %2
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  call void @write_header(%struct.jpeg_decompress_struct* %16, %struct.djpeg_dest_struct* %17, i32 0)
  %18 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %19 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %18, i32 0, i32 19
  %20 = load i32, i32* %19, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %15
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 1)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 1)
  %24 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %5, align 8
  %25 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %25, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_demapped_gray, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %26, align 8
  br label %32

; <label>:27:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 3)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 3)
  %29 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %5, align 8
  %30 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %30, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %31, align 8
  br label %32

; <label>:32:                                     ; preds = %27, %22
  br label %151

; <label>:33:                                     ; preds = %2
  %34 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %34, i32 0, i32 10
  %36 = load i32, i32* %35, align 8
  %37 = icmp eq i32 %36, 2
  br i1 %37, label %38, label %136

; <label>:38:                                     ; preds = %33
  %39 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %40 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %39, i32 0, i32 19
  %41 = load i32, i32* %40, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %128

; <label>:43:                                     ; preds = %38
  %44 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %45 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %44, i32 0, i32 31
  %46 = load i32, i32* %45, align 4
  store i32 %46, i32* %6, align 4
  %47 = load i32, i32* %6, align 4
  %48 = icmp sgt i32 %47, 256
  br i1 %48, label %49, label %70

; <label>:49:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 6)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 6)
  %51 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %51, i32 0, i32 0
  %53 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %52, align 8
  %54 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %53, i32 0, i32 5
  store i32 1039, i32* %54, align 8
  %55 = load i32, i32* %6, align 4
  %56 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %57 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %56, i32 0, i32 0
  %58 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %57, align 8
  %59 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %58, i32 0, i32 6
  %60 = bitcast %union.anon* %59 to [8 x i32]*
  %61 = getelementptr inbounds [8 x i32], [8 x i32]* %60, i64 0, i64 0
  store i32 %55, i32* %61, align 4
  %62 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %63 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %62, i32 0, i32 0
  %64 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %63, align 8
  %65 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %64, i32 0, i32 0
  %66 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %65, align 8
  %67 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %68 = bitcast %struct.jpeg_decompress_struct* %67 to %struct.jpeg_common_struct*
  %69 = ptrtoint void (%struct.jpeg_common_struct*)* %66 to i64
  call void @__llvm_profile_instrument_target(i64 %69, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_output_tga to i8*), i32 0)
  call void %66(%struct.jpeg_common_struct* %68)
  br label %70

; <label>:70:                                     ; preds = %49, %43
  %71 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %72 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %73 = load i32, i32* %6, align 4
  call void @write_header(%struct.jpeg_decompress_struct* %71, %struct.djpeg_dest_struct* %72, i32 %73)
  %74 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %5, align 8
  %75 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %74, i32 0, i32 0
  %76 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %75, i32 0, i32 3
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** %76, align 8
  store %struct._IO_FILE* %77, %struct._IO_FILE** %8, align 8
  store i32 0, i32* %7, align 4
  br label %78

; <label>:78:                                     ; preds = %119, %70
  %79 = load i32, i32* %7, align 4
  %80 = load i32, i32* %6, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %123

; <label>:82:                                     ; preds = %78
  %83 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %84 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %83, i32 0, i32 32
  %85 = load i8**, i8*** %84, align 8
  %86 = getelementptr inbounds i8*, i8** %85, i64 2
  %87 = load i8*, i8** %86, align 8
  %88 = load i32, i32* %7, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8* %87, i64 %89
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %94 = call i32 @_IO_putc(i32 %92, %struct._IO_FILE* %93)
  %95 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %96 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %95, i32 0, i32 32
  %97 = load i8**, i8*** %96, align 8
  %98 = getelementptr inbounds i8*, i8** %97, i64 1
  %99 = load i8*, i8** %98, align 8
  %100 = load i32, i32* %7, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8* %99, i64 %101
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %106 = call i32 @_IO_putc(i32 %104, %struct._IO_FILE* %105)
  %107 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %108 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %107, i32 0, i32 32
  %109 = load i8**, i8*** %108, align 8
  %110 = getelementptr inbounds i8*, i8** %109, i64 0
  %111 = load i8*, i8** %110, align 8
  %112 = load i32, i32* %7, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %111, i64 %113
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i32
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 8
  %118 = call i32 @_IO_putc(i32 %116, %struct._IO_FILE* %117)
  br label %119

; <label>:119:                                    ; preds = %82
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 0)
  %120 = add i64 %pgocount3, 1
  store i64 %120, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 0)
  %121 = load i32, i32* %7, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %7, align 4
  br label %78

; <label>:123:                                    ; preds = %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 4)
  %124 = add i64 %pgocount4, 1
  store i64 %124, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 4)
  %125 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %5, align 8
  %126 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %125, i32 0, i32 0
  %127 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %126, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_gray_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %127, align 8
  br label %135

; <label>:128:                                    ; preds = %38
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 5)
  %129 = add i64 %pgocount5, 1
  store i64 %129, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 5)
  %130 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %131 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  call void @write_header(%struct.jpeg_decompress_struct* %130, %struct.djpeg_dest_struct* %131, i32 0)
  %132 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %5, align 8
  %133 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %132, i32 0, i32 0
  %134 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %133, i32 0, i32 1
  store void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)* @put_pixel_rows, void (%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32)** %134, align 8
  br label %135

; <label>:135:                                    ; preds = %128, %123
  br label %150

; <label>:136:                                    ; preds = %33
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 2)
  %137 = add i64 %pgocount6, 1
  store i64 %137, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_start_output_tga, i64 0, i64 2)
  %138 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %139 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %138, i32 0, i32 0
  %140 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %139, align 8
  %141 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %140, i32 0, i32 5
  store i32 1034, i32* %141, align 8
  %142 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %143 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %142, i32 0, i32 0
  %144 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %143, align 8
  %145 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %144, i32 0, i32 0
  %146 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %145, align 8
  %147 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %148 = bitcast %struct.jpeg_decompress_struct* %147 to %struct.jpeg_common_struct*
  %149 = ptrtoint void (%struct.jpeg_common_struct*)* %146 to i64
  call void @__llvm_profile_instrument_target(i64 %149, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_output_tga to i8*), i32 1)
  call void %146(%struct.jpeg_common_struct* %148)
  br label %150

; <label>:150:                                    ; preds = %136, %135
  br label %151

; <label>:151:                                    ; preds = %150, %32
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @finish_output_tga(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*) #0 {
  %3 = alloca %struct.jpeg_decompress_struct*, align 8
  %4 = alloca %struct.djpeg_dest_struct*, align 8
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %3, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %4, align 8
  %5 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %6 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %5, i32 0, i32 3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %8 = call i32 @fflush(%struct._IO_FILE* %7)
  %9 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %4, align 8
  %10 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %9, i32 0, i32 3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %12 = call i32 @ferror(%struct._IO_FILE* %11) #4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %28

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_tga, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_tga, i64 0, i64 1)
  %16 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %16, i32 0, i32 0
  %18 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %18, i32 0, i32 5
  store i32 36, i32* %19, align 8
  %20 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %20, i32 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i32 0, i32 0
  %24 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %23, align 8
  %25 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %3, align 8
  %26 = bitcast %struct.jpeg_decompress_struct* %25 to %struct.jpeg_common_struct*
  %27 = ptrtoint void (%struct.jpeg_common_struct*)* %24 to i64
  call void @__llvm_profile_instrument_target(i64 %27, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_output_tga to i8*), i32 0)
  call void %24(%struct.jpeg_common_struct* %26)
  br label %28

; <label>:28:                                     ; preds = %14, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_tga, i64 0, i64 0)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_output_tga, i64 0, i64 0)
  ret void
}

declare void @jpeg_calc_output_dimensions(%struct.jpeg_decompress_struct*) #1

; Function Attrs: nounwind uwtable
define internal void @write_header(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca [18 x i8], align 16
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %8 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 18, i32 16, i1 false)
  %9 = load i32, i32* %6, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %23

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 0)
  %13 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 1
  store i8 1, i8* %13, align 1
  %14 = load i32, i32* %6, align 4
  %15 = and i32 %14, 255
  %16 = trunc i32 %15 to i8
  %17 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 5
  store i8 %16, i8* %17, align 1
  %18 = load i32, i32* %6, align 4
  %19 = ashr i32 %18, 8
  %20 = trunc i32 %19 to i8
  %21 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 6
  store i8 %20, i8* %21, align 2
  %22 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 7
  store i8 24, i8* %22, align 1
  br label %23

; <label>:23:                                     ; preds = %11, %3
  %24 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %25 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %24, i32 0, i32 26
  %26 = load i32, i32* %25, align 8
  %27 = and i32 %26, 255
  %28 = trunc i32 %27 to i8
  %29 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 12
  store i8 %28, i8* %29, align 4
  %30 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %31 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %30, i32 0, i32 26
  %32 = load i32, i32* %31, align 8
  %33 = lshr i32 %32, 8
  %34 = trunc i32 %33 to i8
  %35 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 13
  store i8 %34, i8* %35, align 1
  %36 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %37 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %36, i32 0, i32 27
  %38 = load i32, i32* %37, align 4
  %39 = and i32 %38, 255
  %40 = trunc i32 %39 to i8
  %41 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 14
  store i8 %40, i8* %41, align 2
  %42 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %43 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %42, i32 0, i32 27
  %44 = load i32, i32* %43, align 4
  %45 = lshr i32 %44, 8
  %46 = trunc i32 %45 to i8
  %47 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 15
  store i8 %46, i8* %47, align 1
  %48 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 17
  store i8 32, i8* %48, align 1
  %49 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %50 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %49, i32 0, i32 10
  %51 = load i32, i32* %50, align 8
  %52 = icmp eq i32 %51, 1
  br i1 %52, label %53, label %57

; <label>:53:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 1)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 1)
  %55 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 2
  store i8 3, i8* %55, align 2
  %56 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 16
  store i8 8, i8* %56, align 16
  br label %69

; <label>:57:                                     ; preds = %23
  %58 = load i32, i32* %6, align 4
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %64

; <label>:60:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 3)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 3)
  %62 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 2
  store i8 1, i8* %62, align 2
  %63 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 16
  store i8 8, i8* %63, align 16
  br label %68

; <label>:64:                                     ; preds = %57
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 4)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 4)
  %66 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 2
  store i8 2, i8* %66, align 2
  %67 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i64 0, i64 16
  store i8 24, i8* %67, align 16
  br label %68

; <label>:68:                                     ; preds = %64, %60
  br label %69

; <label>:69:                                     ; preds = %68, %53
  %70 = getelementptr inbounds [18 x i8], [18 x i8]* %7, i32 0, i32 0
  %71 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %72 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %71, i32 0, i32 3
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** %72, align 8
  %74 = call i64 @fwrite(i8* %70, i64 1, i64 18, %struct._IO_FILE* %73)
  %75 = icmp ne i64 %74, 18
  br i1 %75, label %76, label %90

; <label>:76:                                     ; preds = %69
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 2)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_write_header, i64 0, i64 2)
  %78 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %79 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 5
  store i32 36, i32* %81, align 8
  %82 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %83 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %82, i32 0, i32 0
  %84 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %83, align 8
  %85 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %84, i32 0, i32 0
  %86 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %85, align 8
  %87 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %88 = bitcast %struct.jpeg_decompress_struct* %87 to %struct.jpeg_common_struct*
  %89 = ptrtoint void (%struct.jpeg_common_struct*)* %86 to i64
  call void @__llvm_profile_instrument_target(i64 %89, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_header to i8*), i32 0)
  call void %86(%struct.jpeg_common_struct* %88)
  br label %90

; <label>:90:                                     ; preds = %76, %69
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @put_demapped_gray(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.tga_dest_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %12 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %13 = bitcast %struct.djpeg_dest_struct* %12 to %struct.tga_dest_struct*
  store %struct.tga_dest_struct* %13, %struct.tga_dest_struct** %7, align 8
  %14 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %15 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %14, i32 0, i32 32
  %16 = load i8**, i8*** %15, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 0
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %10, align 8
  %19 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %20 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %20, i32 0, i32 4
  %22 = load i8**, i8*** %21, align 8
  %23 = getelementptr inbounds i8*, i8** %22, i64 0
  %24 = load i8*, i8** %23, align 8
  store i8* %24, i8** %8, align 8
  %25 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %26 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %25, i32 0, i32 1
  %27 = load i8*, i8** %26, align 8
  store i8* %27, i8** %9, align 8
  %28 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %29 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %28, i32 0, i32 26
  %30 = load i32, i32* %29, align 8
  store i32 %30, i32* %11, align 4
  br label %31

; <label>:31:                                     ; preds = %47, %3
  %32 = load i32, i32* %11, align 4
  %33 = icmp ugt i32 %32, 0
  br i1 %33, label %34, label %51

; <label>:34:                                     ; preds = %31
  %35 = load i8*, i8** %10, align 8
  %36 = load i8*, i8** %8, align 8
  %37 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %37, i8** %8, align 8
  %38 = load i8, i8* %36, align 1
  %39 = zext i8 %38 to i32
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* %35, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = trunc i32 %43 to i8
  %45 = load i8*, i8** %9, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %9, align 8
  store i8 %44, i8* %45, align 1
  br label %47

; <label>:47:                                     ; preds = %34
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i64 0, i64 0)
  %48 = add i64 %pgocount, 1
  store i64 %48, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i64 0, i64 0)
  %49 = load i32, i32* %11, align 4
  %50 = add i32 %49, -1
  store i32 %50, i32* %11, align 4
  br label %31

; <label>:51:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i64 0, i64 1)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_demapped_gray, i64 0, i64 1)
  %53 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %54 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %53, i32 0, i32 1
  %55 = load i8*, i8** %54, align 8
  %56 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %57 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %56, i32 0, i32 2
  %58 = load i32, i32* %57, align 8
  %59 = zext i32 %58 to i64
  %60 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %61 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %60, i32 0, i32 0
  %62 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %61, i32 0, i32 3
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %62, align 8
  %64 = call i64 @fwrite(i8* %55, i64 1, i64 %59, %struct._IO_FILE* %63)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @put_gray_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.tga_dest_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %11 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %12 = bitcast %struct.djpeg_dest_struct* %11 to %struct.tga_dest_struct*
  store %struct.tga_dest_struct* %12, %struct.tga_dest_struct** %7, align 8
  %13 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %14 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %13, i32 0, i32 0
  %15 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %14, i32 0, i32 4
  %16 = load i8**, i8*** %15, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 0
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %8, align 8
  %19 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %20 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %19, i32 0, i32 1
  %21 = load i8*, i8** %20, align 8
  store i8* %21, i8** %9, align 8
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 26
  %24 = load i32, i32* %23, align 8
  store i32 %24, i32* %10, align 4
  br label %25

; <label>:25:                                     ; preds = %36, %3
  %26 = load i32, i32* %10, align 4
  %27 = icmp ugt i32 %26, 0
  br i1 %27, label %28, label %40

; <label>:28:                                     ; preds = %25
  %29 = load i8*, i8** %8, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %8, align 8
  %31 = load i8, i8* %29, align 1
  %32 = zext i8 %31 to i32
  %33 = trunc i32 %32 to i8
  %34 = load i8*, i8** %9, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %9, align 8
  store i8 %33, i8* %34, align 1
  br label %36

; <label>:36:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 0)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 0)
  %38 = load i32, i32* %10, align 4
  %39 = add i32 %38, -1
  store i32 %39, i32* %10, align 4
  br label %25

; <label>:40:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_gray_rows, i64 0, i64 1)
  %42 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %43 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %42, i32 0, i32 1
  %44 = load i8*, i8** %43, align 8
  %45 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %46 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %45, i32 0, i32 2
  %47 = load i32, i32* %46, align 8
  %48 = zext i32 %47 to i64
  %49 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %50 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %49, i32 0, i32 0
  %51 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %50, i32 0, i32 3
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %51, align 8
  %53 = call i64 @fwrite(i8* %44, i64 1, i64 %48, %struct._IO_FILE* %52)
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal void @put_pixel_rows(%struct.jpeg_decompress_struct*, %struct.djpeg_dest_struct*, i32) #0 {
  %4 = alloca %struct.jpeg_decompress_struct*, align 8
  %5 = alloca %struct.djpeg_dest_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.tga_dest_struct*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  store %struct.jpeg_decompress_struct* %0, %struct.jpeg_decompress_struct** %4, align 8
  store %struct.djpeg_dest_struct* %1, %struct.djpeg_dest_struct** %5, align 8
  store i32 %2, i32* %6, align 4
  %11 = load %struct.djpeg_dest_struct*, %struct.djpeg_dest_struct** %5, align 8
  %12 = bitcast %struct.djpeg_dest_struct* %11 to %struct.tga_dest_struct*
  store %struct.tga_dest_struct* %12, %struct.tga_dest_struct** %7, align 8
  %13 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %14 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %13, i32 0, i32 0
  %15 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %14, i32 0, i32 4
  %16 = load i8**, i8*** %15, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 0
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %8, align 8
  %19 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %20 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %19, i32 0, i32 1
  %21 = load i8*, i8** %20, align 8
  store i8* %21, i8** %9, align 8
  %22 = load %struct.jpeg_decompress_struct*, %struct.jpeg_decompress_struct** %4, align 8
  %23 = getelementptr inbounds %struct.jpeg_decompress_struct, %struct.jpeg_decompress_struct* %22, i32 0, i32 26
  %24 = load i32, i32* %23, align 8
  store i32 %24, i32* %10, align 4
  br label %25

; <label>:25:                                     ; preds = %54, %3
  %26 = load i32, i32* %10, align 4
  %27 = icmp ugt i32 %26, 0
  br i1 %27, label %28, label %58

; <label>:28:                                     ; preds = %25
  %29 = load i8*, i8** %8, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 2
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = trunc i32 %32 to i8
  %34 = load i8*, i8** %9, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 0
  store i8 %33, i8* %35, align 1
  %36 = load i8*, i8** %8, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 1
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = trunc i32 %39 to i8
  %41 = load i8*, i8** %9, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 1
  store i8 %40, i8* %42, align 1
  %43 = load i8*, i8** %8, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 0
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = trunc i32 %46 to i8
  %48 = load i8*, i8** %9, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 2
  store i8 %47, i8* %49, align 1
  %50 = load i8*, i8** %8, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 3
  store i8* %51, i8** %8, align 8
  %52 = load i8*, i8** %9, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 3
  store i8* %53, i8** %9, align 8
  br label %54

; <label>:54:                                     ; preds = %28
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 0)
  %55 = add i64 %pgocount, 1
  store i64 %55, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 0)
  %56 = load i32, i32* %10, align 4
  %57 = add i32 %56, -1
  store i32 %57, i32* %10, align 4
  br label %25

; <label>:58:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 1)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_put_pixel_rows, i64 0, i64 1)
  %60 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %61 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %60, i32 0, i32 1
  %62 = load i8*, i8** %61, align 8
  %63 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %64 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %63, i32 0, i32 2
  %65 = load i32, i32* %64, align 8
  %66 = zext i32 %65 to i64
  %67 = load %struct.tga_dest_struct*, %struct.tga_dest_struct** %7, align 8
  %68 = getelementptr inbounds %struct.tga_dest_struct, %struct.tga_dest_struct* %67, i32 0, i32 0
  %69 = getelementptr inbounds %struct.djpeg_dest_struct, %struct.djpeg_dest_struct* %68, i32 0, i32 3
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** %69, align 8
  %71 = call i64 @fwrite(i8* %62, i64 1, i64 %66, %struct._IO_FILE* %70)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
